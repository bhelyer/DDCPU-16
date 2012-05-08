module main;

import std.datetime;
import std.file;
import std.getopt : getopt;
import std.stdio;
import std.traits;
import core.thread;

import siege.siege;
import siege.input.keyboard : press;

import dcpu16.cpu;
static import clock;
import display : Display;
import floppy : Floppy;
import keyboard : Keyboard;
import util : loadBinary;
import ex : DcpuException;

alias clock.Clock DClock;

enum CLOCKSPEED = 100_000;  // In hertz
enum FPS = 60;
enum SCALING = 4;
enum TW = 4 * SCALING;  // tile width
enum TH = 8 * SCALING;  // tile height
enum WIDTH = 32;  // in tiles
enum HEIGHT = 12; // in tiles
enum BORDERWIDTH = 8 * SCALING;
enum SWIDTH = WIDTH * TW + BORDERWIDTH * 2;
enum SHEIGHT = HEIGHT * TH + BORDERWIDTH * 2;

void main(string[] args)
{
    try {
        realmain(args);
    } catch (Throwable t) {
        writefln("An exception halted execution: %s", t);
        readln();
    }
}

void realmain(string[] args)
{
    string rom;
    string disk = null;
    bool forceLittleEndian = true;

    getopt(args,
           "disk", &disk,
           "little-endian", { forceLittleEndian = true; },
           "big-endian", { forceLittleEndian = false; });

    if (args.length == 1) {
        writeln("usage: ddcpu16 [--disk=PATH] [--little-endian] <rom>");
        return;
    } else {
        rom = args[1];
    }

    auto cpu = new CPU();

    auto display = new Display(forceLittleEndian);
    cpu.register(display);
    auto clock = new DClock();
    cpu.register(clock);

    Floppy floppy = null;
    if (disk.length > 0)
    {
        floppy = new Floppy(disk, forceLittleEndian);
        cpu.register(floppy);
    }

    auto prog = loadBinary(rom, forceLittleEndian);
    cpu.load(prog);

    sgcore.loadModules("SDL", "OpenGL");
    sgcore.init(0);
    window.open(SWIDTH, SHEIGHT, 32, 0);
    window.title = "DDCPU-16";

    auto keyboard = new Keyboard();  // Keyboard is an Entity and IHardware.
    cpu.register(keyboard);
    auto texture = new Texture(SWIDTH, SHEIGHT, 32);

    long lastBlinkToggle;
    while (sgcore.loop()) {
        if (press(SG_KEYBOARD_KEY_LCTRL) || press(SG_KEYBOARD_KEY_RCTRL)) {
            if (press('R')) {
                cpu.reset();
                cpu.load(prog);
            }
        }

        clock.tick();
        SysTime a = Clock.currTime();
        draw.clear();  // The texture won't render without this. SIEGE bug.
        try
        {
            cpu.run(CLOCKSPEED/FPS);
        }
        catch (DcpuException ex)
        {
            writefln("Error: %s", ex.msg);
            cpu.debugDump();
            return;
        }
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

    keyboard.destroy();
}
