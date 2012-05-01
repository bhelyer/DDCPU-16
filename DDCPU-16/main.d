module main;

import std.conv;
import std.datetime;
import std.file;
import std.getopt : getopt;
import std.stdio;
import std.traits;
import std.utf;
import core.thread;

import siege.siege;
import siege.input.keyboard : press;

import dcpu16.cpu;
static import clock;
import display : Display;
import floppy : Floppy;
import keyboard : Keyboard;

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

version (Windows) {
    import core.sys.windows.windows;
    extern (Windows) DWORD CommDlgExtendedError();
    enum OFN_FILEMUSTEXIST = 0x001000;
}

void main(string[] args)
{
    version (Windows) {
    try {
        realmain(args);
    } catch (Throwable t) {
        MessageBoxW(null, toUTF16z(t.msg), toUTF16z("DDCPU 16"w), MB_OK | MB_ICONERROR);
    }
    } else {
        realmain(args);
    }
}

void realmain(string[] args)
{
    string rom;
	string disk = null;

	getopt(args,
		   "disk", &disk);

    if (args.length == 1) {
        writeln("usage: ddcpu16 <rom>");
        return;
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

/**
 * Open an 'open file' dialog at cwd and block until you get a result.
 * Returns: the selected file, or an empty string on cancellation.
 */
version (Windows) string fileDialog(string cwd)
{ 
    wchar[] buf = new wchar[1024];
    buf[] = 0;

    OPENFILENAMEW ofn;
    ofn.lStructSize = OPENFILENAMEW.sizeof;
    ofn.lpstrFile = buf.ptr;
    ofn.nMaxFile = 1024;
    ofn.lpstrInitialDir = toUTF16z(cwd);
    ofn.Flags = OFN_FILEMUSTEXIST;

    BOOL retval = GetOpenFileNameW(&ofn);
    if (retval == 0) {
        DWORD errorCode = CommDlgExtendedError();
        if (errorCode == 0) {
            // Just a cancel.
            return "";
        }
        throw new Exception("GetOpenFileNameW failure.");
    }

    return to!string(buf);
}
else string fileDialog(string cwd)
{
    return "";
}
