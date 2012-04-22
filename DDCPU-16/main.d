module main;

import std.stdio;
import std.file;
import core.thread;

import dcpu16.cpu;

void main(string[] args)
{
    try {
        realmain(args);
    } catch (Throwable t) {
        writeln("An exception halted execution: %s", t);
    }
}

void realmain(string[] args)
{
    if (args.length == 1) {
        writeln("usage: ", args[0], " <image file>");
        return;
    }

    auto cpu = new CPU();
    auto prog = cast(ushort[]) read(args[1]);
    cpu.load(prog);
    
    while (true) {
        writeln("CYCLES: ", cpu.cycleCount);
        writefln("A:%s B:%s PC:%s SP:%s (%s) O = 0x%04X", cpu.A, cpu.B, cpu.PC, cpu.SP, cpu.memory[cpu.SP], cpu.O);
        if (readln().length == 0) {
            break;
        }
        
        cpu.run(1);
    }
}
