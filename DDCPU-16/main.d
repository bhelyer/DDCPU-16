module main;

import std.stdio;
import std.string;

import dcpu16.cpu;

void main(string[] args)
{
    realmain(args);
}

void realmain(string[] args) @safe
{
    auto cpu = new CPU();
    //cpu.run();
}
