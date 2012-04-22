module main;

import std.stdio;
import std.string;
import core.thread;

import dcpu16.cpu;

void main(string[] args)
{
    try {
        realmain(args);
    } catch (Throwable t) {
        writeln("An exception halted execution: %s", t);
    }
    writeln("Press enter to exit.");
    readln();
}

void realmain(string[] args)
{
    auto cpu = new CPU();
    ushort[] prog = [0x7c01, 0x0030, 0x7de1, 0x1000, 0x0020, 0x7803, 0x1000, 0xc00d,
                     0x7dc1, 0x001a, 0xa861, 0x7c01, 0x2000, 0x2162, 0x2000, 0x8463,
                     0x806d, 0x7dc1, 0x000d, 0x9031, 0x7c10, 0x0018, 0x7dc1, 0x001a,
                     0x9037, 0x61c1, 0x7dc1, 0x001a];
    cpu.load(prog);
    
    while (true) {
        cpu.run(100_000/60);
        writeln(cpu);
    }
}
