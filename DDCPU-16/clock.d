module clock;

import std.datetime;

import dcpu16.cpu;
import dcpu16.hardware;

import wmain : FPS;


class Clock : IHardware
{
    CPU cpu;
    bool enabled;
    bool interruptsEnabled;
    ushort imessage;
    ushort framesPerTick;
    ushort tickCounter;
    ushort frameCounter;

    /// Called by the CPU when this hardware device is registered.
    void attach(CPU cpu) @safe
    {
        this.cpu = cpu;
    }

    void reset() @safe
    {
        enabled = false;
        interruptsEnabled = false;
        imessage = 0;
        framesPerTick = 0;
        tickCounter = 0;
        frameCounter = 0;
    }

    /// Called by the CPU when this hardware is the target of an HWQ op.
    void query() @safe
    {
        cpu.A = 0xB402;
        cpu.B = 0x12D0;
        cpu.C = 0x1;
        cpu.X = 0;
        cpu.Y = 0;
    }

    /// Called by the CPU when this hardware is the target of an HWI op.
    void interrupt() @safe
    {
        switch (cpu.A) {
        case 0:
            if (cpu.B == 0) {
                enabled = false;
                break;
            }
            enabled = true;
            framesPerTick = cpu.B;
            tickCounter = 0;
            break;
        case 1:
            cpu.C = tickCounter;
            break;
        case 2:
            if (cpu.B == 0) {
                interruptsEnabled = false;
                break;
            }
            interruptsEnabled = true;
            imessage = cpu.B;
            break;
        default:
            break;
        }
    }

    void tick() @safe
    {
        static assert(FPS == 60, "Clock relies on 60 FPS.");
        if (!enabled) return;

        frameCounter++;
        if (frameCounter >= framesPerTick) {
            tickCounter++;
            frameCounter = 0;
            if (interruptsEnabled) cpu.interrupt(imessage);
        }
    }
}
