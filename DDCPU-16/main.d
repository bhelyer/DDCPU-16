module main;

import std.conv;
import std.datetime;
import std.file;
import std.getopt : getopt;
import std.stdio;
import std.traits;
import std.utf;
import core.thread;
version (Windows) import core.sys.windows.windows;

//import siege.siege;
//import siege.input.keyboard : press;

import dcpu16.cpu;
static import bief;
static import clock;
//import display : Display;
import floppy : Floppy;
//import keyboard : Keyboard;
//import ui;

alias bief.read biefRead;
alias clock.Clock DClock;


version (none) void main(string[] args)
{
    version (Windows) {
    try {
        biefRead("bieftest.txt");
        realmain(args);
    } catch (Throwable t) {
        MessageBoxW(null, toUTF16z(t.msg), toUTF16z("DDCPU 16"w), MB_OK | MB_ICONERROR);
    }
    } else {
        realmain(args);
    }
}

version (none) void realmain(string[] args)
{
    string rom;
	string disk = null;

	getopt(args,
		   "disk", &disk);

    if (args.length == 1) {
        if (exists("intro.dcpu")) {
            rom = "intro.dcpu";
        } else {
            rom = fileDialog(".");
        }
        if (rom.length == 0) {
            writeln("usage: ddcpu16 <rom>");
            return;
        }
    } else {
        rom = args[1];
    }

    auto cpu = new CPU();

    auto display = new Display();
    cpu.register(display);
    auto clock = new DClock();
    cpu.register(clock);

	Floppy floppy = null;
	if (disk.length > 0)
	{
		floppy = new Floppy(disk);
		cpu.register(floppy);
	}

    auto prog = cast(ushort[]) read(rom);
    cpu.load(prog);

    sgcore.loadModules("SDL", "OpenGL");
    sgcore.init(0);
    window.open(SWIDTH, SHEIGHT, 32, 0);
    window.title = "DDCPU-16";

    auto keyboard = new Keyboard();  // Keyboard is an Entity and IHardware.
    scope (exit) keyboard.destroy();
    cpu.register(keyboard);
    auto texture = new Texture(SWIDTH, SHEIGHT, 32);

    long lastBlinkToggle;
    while (sgcore.loop()) {
        if (press(SG_KEYBOARD_KEY_LCTRL) || press(SG_KEYBOARD_KEY_RCTRL)) {
            if (press('R')) {
                prog = cast(ushort[]) read(rom);
                cpu.reset();
                cpu.load(prog);
            }
            if (press('O')) {
                string newFile = fileDialog(".");
                if (newFile.length != 0) {
                    rom = newFile;
                    cpu.reset();
                    prog = cast(ushort[]) read(rom);
                    cpu.load(prog);
                }
            }
            if (press('D')) {
                auto dui = new DebugUI(cpu);
            }
        }

        clock.tick();
        SysTime a = Clock.currTime();
        draw.clear();  // The texture won't render without this. SIEGE bug.
        cpu.run(CLOCKSPEED/FPS);

        display.render();
        texture.data(SWIDTH, SHEIGHT, 32, display.texture);
        texture.draw();
        window.swapBuffers();

        if (cpu.cycleCount - lastBlinkToggle >= 100_000) {
            display.blink = !display.blink;
            lastBlinkToggle = cpu.cycleCount;
        }

        SysTime b = Clock.currTime();
        Duration delta = b - a;
        if (delta < dur!"msecs"(1000/FPS)) {
            Thread.sleep(dur!"msecs"(1000/FPS) - delta);
        }
    }

    
}

