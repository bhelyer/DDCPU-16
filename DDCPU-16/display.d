module display;

import std.datetime;
import std.file;

import dcpu16.cpu;
import dcpu16.hardware;
import main;

class Display : IHardware
{
    CPU cpu;
    uint[] texture;
    uint[0xF+1] palette = [
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
    uint background;
    ushort[] font;
    ushort vramBase;
    ushort userFont;
    ushort userPalette;
    bool blink;

    private SysTime waitOrigin;

    this()
    {
        texture = new uint[SWIDTH * SHEIGHT];
        font = cast(ushort[]) read("font.bin");
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
                texture[] = 0xFF1F1F1F;  // TODO: Nya logo
                waitOrigin = Clock.currTime();
            }
            vramBase = cpu.B;
            break;
        case 1:
            userFont = cpu.B;
            break;
        case 2:
            userPalette = cpu.B;
            break;
        case 3:
            background = cpu.B;
            break;
        default:
            break;
        }
    }

    /** 
    * Returns: true if the hardware wants to trigger the interrupt handler.
    * Params:
    *   message = the message to give the interrupt handler.
    *             ignored if there's no pending interrupt.
    */
    bool pendingInterrupt(out ushort message) @safe
    {
        return false;
    }

    /// Render out the screen buffer at base to texture. (using 0xAABBGGRR, i.e. RGBA in little endian).
    final void render() @trusted
    {
        if ((Clock.currTime() - waitOrigin) < dur!"seconds"(1) || vramBase == 0) {
            return;
        }
        uint borderColour = colour(background & 0xF);

        foreach (i, ref px; texture) {
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
                ushort c;
                if (vramBase != 0) {
                    c = cpu.memory[vramBase+j];
                }
                ubyte ascii = c & 0x007F;
                bool cblink = (c & 0x0080) != 0;

                // The actual pixel data stored in memory.
                uint chr;
                if (userFont != 0) {
                    chr = (cpu.memory[userFont+ascii*2] << 16) | cpu.memory[userFont+ascii*2+1];
                } else {
                    chr = (font[ascii*2] << 16) | font[ascii*2+1];
                }

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
                    px = colour((c & 0xF000) >> 12);
                } else {
                    px = colour((c & 0x0F00) >> 8);
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
            /// !!! TMP
            return cpu.memory[userPalette+i];
        } else {
            return palette[i];
        }
    }
}
