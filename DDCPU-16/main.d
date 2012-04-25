module main;

import std.datetime;
import std.file;
import std.stdio;
import std.traits;
import core.thread;

import siege.siege;

import dcpu16.cpu;

enum CLOCKSPEED = 100_000;  // In hertz
enum FPS = 60;
enum SCALING = 4;
enum TW = 4 * SCALING;  // tile width
enum TH = 8 * SCALING;  // tile height
enum SCREENBASE = 0x8000;
enum FONTBASE = 0x8180;
enum BACKGROUND = 0x8280;
enum KEYBUFFER = 0x9000;
enum LASTKEY = 0x9010;
enum WIDTH = 32;  // in tiles
enum HEIGHT = 12; // in tiles
enum BORDERWIDTH = 4 * SCALING;
enum SWIDTH = WIDTH * TW + BORDERWIDTH * 2;
enum SHEIGHT = HEIGHT * TH + BORDERWIDTH * 2;

class Controller : Entity
{
    CPU cpu;

    this(CPU cpu)
    {
        this.cpu = cpu;
    }

    final override void evKeyboardKeyPress(uint k)
    {
        addKey(cast(ushort) k);
    }

    protected final addKey(ushort k)
    {
        size_t i = 0x9000;
        if (cpu.memory[LASTKEY] >= 0x9000 && cpu.memory[LASTKEY] <= 0x900F) {
            i = cpu.memory[LASTKEY];
        }
        size_t start = i;

        do {
            if (cpu.memory[i] == 0) {
                cpu.memory[i] = k;
                cpu.memory[LASTKEY] = cast(ushort) i;
                break;
            }
            i++;
            if (i > 0x900F) {
                i = 0x9000;
            }
        } while (i != start);
    }
}

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
    if (args.length == 1) {
        writeln("usage: ddcpu16 <rom>");
        return;
    } else {
        rom = args[1];
    }

    auto cpu = new CPU();
    auto prog = cast(ushort[]) read(rom);
    cpu.load(prog);

    try {
        auto font = cast(ushort[]) read("font.bin");
        cpu.memory[FONTBASE..FONTBASE+font.length] = font;
    } catch (Throwable t) {
        // No font. Just ignore it.
    }

    sgcore.loadModules("SDL", "OpenGL");
    sgcore.init(0);
    window.open(SWIDTH, SHEIGHT, 32, 0);
    window.title = "DDCPU-16";

    auto pixels = new uint[SWIDTH * SHEIGHT];
    auto texture = new Texture(SWIDTH, SHEIGHT, 32);

    bool blink = false; 
    long lastBlinkToggle;
    auto controller = new Controller(cpu);
    while (sgcore.loop()) {
        SysTime a = Clock.currTime();
        draw.clear();  // The texture won't render without this. SIEGE bug.
        cpu.run(CLOCKSPEED/FPS);

        cpu.render(pixels, blink);
        texture.data(SWIDTH, SHEIGHT, 32, pixels);
        texture.draw();
        window.swapBuffers();

        // A magical cycle count, that's Close Enough (tm) to the emulator on 0x10co.de.
        if ((cpu.cycleCount - lastBlinkToggle) > 100_000) {
            blink = !blink;
            lastBlinkToggle = cpu.cycleCount;
        }
        SysTime b = Clock.currTime();
        Duration delta = b - a;
        if (delta < dur!"msecs"(1000/FPS)) {
            Thread.sleep(dur!"msecs"(1000/FPS) - delta);
        }
    }
}

immutable uint[0xF+1] colours = [
    0xFF000000,
    0xFFAA0000,
    0xFF00AA00,
    0xFFAAAA00,
    0xFF0000AA,
    0xFFAA00AA,
    0xFF0055AA,
    0xFFAAAAAA,
    0xFF555555,
    0xFFFF5555,
    0xFF55FF55,
    0xFFFFFF55,
    0xFF5555FF,
    0xFFFF55FF,
    0xFF55FFFF,
    0xFFFFFFFF,
];

/// Render out the screen buffer to pixels (using 0xAABBGGRR, i.e. RGBA in little endian).
void render(CPU cpu, ref uint[] pixels, bool blink)
{
    // The border colour doesn't change, so just compute it once.
    ushort bi = cpu.memory[BACKGROUND];
    uint borderColour = colours[bi-colours.length*(bi/colours.length)];  // Wrap the number (@ 0x8280) around.

    foreach (i, ref px; pixels) {
        // The x, y coordinates of this pixel from the top left of the screen.
        int y = i / SWIDTH;
        int x = i - y * SWIDTH;

        // Inside the screenbuffer's display rectangle.
        if (x > BORDERWIDTH && x < SWIDTH - BORDERWIDTH && y > BORDERWIDTH && y < SHEIGHT - BORDERWIDTH) {
            // The coordinates in the DCPU screenbuffer. (i.e. it goes to 31,11)
            int nx = (x - BORDERWIDTH) / TW;
            int ny = (y - BORDERWIDTH) / TH;

            size_t j = nx + ny * WIDTH;
            // Figure out which ASCII character needs to be displayed.
            ushort c = cpu.memory[SCREENBASE+j];
            ubyte ascii = c & 0x007F;
            bool cblink = (c & 0x0080) != 0;

            // The actual pixel data stored in memory.
            uint chr = (cpu.memory[FONTBASE+ascii*2] << 16) | cpu.memory[FONTBASE+ascii*2+1];
            
            // The top left origin of the current character.
            int lx = (nx * TW) + BORDERWIDTH;
            int ly = (ny * TH) + BORDERWIDTH;

            // The coordinates relative to the current character.
            int cx = (x - lx) / SCALING;
            int cy = (y - ly) / SCALING;

            // Which bit to test (from MSB) to see if to use the fg colour or bg one.
            size_t bit = (0x0100_0000 >> cx*8) << cy;

            // Use the appropriate colour.
            if (chr & bit && !(cblink && blink)) {
                px = colours[(c & 0xF000) >> 12];
            } else {
                px = colours[(c & 0x0F00) >> 8];
            }
        } else {
            // Otherwise, we're rendering the border.
            px = borderColour;
        }
    }
}
