module display;

import std.array;
import std.algorithm;
import std.datetime;
import std.file;

import dcpu16.cpu;
import dcpu16.hardware;
import wmain;

class Display : IHardware
{
    CPU cpu;
    uint[] texture;
    uint[] palette = [
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
    uint[] effectivePalette;
    uint background;
    ushort[] font;
    ushort vramBase;
    ushort* userFont;
    uint userPalette;
    bool blink;

    private SysTime waitOrigin;

    this()
    {
        texture = new uint[SWIDTH * SHEIGHT];
        texture[] = 0xFF1F1F1F;  // TODO: Nya logo
        font = cast(ushort[]) read("font.bin");

        userFont = font.ptr;

    }

    void reset() @safe
    {
        texture[] = 0xFF1F1F1F;
        background = 0;
        vramBase = 0;
        userFont = font.ptr;
        userPalette = 0;
        blink = false;
    }

    /// Called by the CPU when this hardware device is registered.
    void attach(CPU cpu) @safe
    {
        this.cpu = cpu;
    }

    /// Called by the CPU when this hardware is the target of an HWQ op.
    void query() @safe
    {
        cpu.A = 0xF615;
        cpu.B = 0x7349;
        cpu.C = 0x1802;
        cpu.X = 0x8B36;
        cpu.Y = 0x1C6C;
    }

    /// Called by the CPU when this hardware is the target of an HWI op.
    void interrupt() @trusted
    {
        switch (cpu.A) {
        case 0:
            if (vramBase == 0 && cpu.B != 0) {
                waitOrigin = Clock.currTime();
            }
            vramBase = cpu.B;
            break;
        case 1:
            if (cpu.B > 0xFFFF-16) {
                throw new Exception("Not enough room to map font.");
            }
            if (cpu.B == 0) {
                userFont = font.ptr;
            } else {
                userFont = &cpu.memory[cpu.B];
            }
            break;
        case 2:
            userPalette = cpu.B;
            break;
        case 3:
            background = cpu.B;
            break;
        case 4:
            cpu.memory[cpu.B..cpu.B+font.length] = font[];
            cpu.cycleCount += 256;
            break;
        case 5:
            cpu.memory[cpu.B..cpu.B+palette.length] = array( map!rgbaToDcpu(palette) );
            cpu.cycleCount += 16;
            break;
        default:
            break;
        }
    }

    /// Render out the screen buffer at base to texture. (using 0xAABBGGRR, i.e. RGBA in little endian).
    final void render() @trusted
    {
        if ((Clock.currTime() - waitOrigin) < dur!"seconds"(1) || vramBase == 0) {
            return;
        }
        uint borderColour = colour(background & 0xF);

        if (userPalette == 0) {
            effectivePalette = palette;
        } else {
            effectivePalette.length = 16;
            foreach (i; 0..16) {
                effectivePalette[i] = dcpuToRGBA(cpu.memory[userPalette+i]);
            }
        }

        foreach (i, ref px; texture) {
            // The x, y coordinates of this pixel from the top left of the screen.
            int y = i / SWIDTH;
            int x = i - y * SWIDTH;

            // Inside the screenbuffer's display rectangle.
            if (x > BORDERWIDTH-1 && x < SWIDTH - BORDERWIDTH && y > BORDERWIDTH-1 && y < SHEIGHT - BORDERWIDTH) {
                // The coordinates in the DCPU screenbuffer. (i.e. it goes to 31,11)
                int nx = (x - BORDERWIDTH) / TW;
                int ny = (y - BORDERWIDTH) / TH;

                size_t j = nx + ny * WIDTH;
                // Figure out which ASCII character needs to be displayed.
                ushort c;
                c = cpu.memory[vramBase+j];
                ubyte ascii = c & 0x007F;
                bool cblink = (c & 0x0080) != 0;

                // The actual pixel data stored in memory.
                uint chr = (userFont[ascii*2] << 16) | userFont[ascii*2+1];

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
                    px = effectivePalette[(c & 0xF000) >> 12];
                } else {
                    px = effectivePalette[(c & 0x0F00) >> 8];
                }
            } else {
                // Otherwise, we're rendering the border.
                px = borderColour;
            }
        }
    }

    protected final uint colour(size_t i) @safe pure
    {
        if (userPalette != 0) {
            return dcpuToRGBA(cpu.memory[userPalette+i]);
        } else {
            return palette[i];
        }
    }
}

/// Convert from the texture's little endian RGBA format to DCPU's colour format.
uint dcpuToRGBA(ushort i) @safe pure
{
    float rpercent = ((i & 0x0F00) >> 8) / cast(float) 0xF;
    float gpercent = ((i & 0x00F0) >> 4) / cast(float) 0xF;
    float bpercent = (i & 0x000F) / cast(float) 0xF;
    uint r = cast(uint) (0xFF * rpercent);
    uint g = cast(uint) (0xFF * gpercent);
    uint b = cast(uint) (0xFF * bpercent);
    return 0xFF00_0000 | r | (g << 8) | (b << 16);
}

/// Convert from DCPU's colour format to little endian RGBA.
ushort rgbaToDcpu(uint i)
{
    float rpercent = (i & 0x0000_00FF) / cast(float) 0xFF;
    float gpercent = ((i & 0x0000_FF00) >> 8) / cast(float) 0xFF;
    float bpercent = ((i & 0x00FF_0000) >> 16) / cast(float) 0xFF;
    ushort r = cast(ushort) (0xF * rpercent);
    ushort g = cast(ushort) (0xF * gpercent);
    ushort b = cast(ushort) (0xF * bpercent);
    return cast(ushort) (r | (g << 4) | (b << 8));
}