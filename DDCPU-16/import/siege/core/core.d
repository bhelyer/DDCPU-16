/*
    Copyright (c) 2007 SIEGE Development Team
    All rights reserved.
    
    This file is part of libSIEGE.
    
    This software is copyrighted work licensed under the terms of the
    2-clause BSD license. Please consult the file "license.txt" for
    details.
    
    If you did not recieve the file with this program, please email
    Tim Chas <darkuranium@gmail.com>.
*/

module siege.core.core;

import siege.c.siege;

import std.conv;
import std.string;

void getVersion(out ushort _version)
{
    sgGetVersionv(&_version);
}

void getVersion(out ushort vmajor, out ushort vminor, out ushort vpatch)
{
    sgGetVersion(&vmajor, &vminor, &vpatch);
}

string getVersionString()
{
    return to!string(sgGetVersionString());
}

uint loadModules(string[] names...)
{
    uint ret = 0;
    foreach(name; names)
        ret += sgLoadModule(toStringz(name));
    return ret;
}

bool loadModule(string name)
{
    return sgLoadModule(toStringz(name));
}

private extern (C) void exitshim()
{
    sgDeinit();
}

bool init(uint flags)
{
    import std.c.stdlib;
    atexit(&exitshim);
    return sgInit(flags);
}

int run()
{
    return sgRun();
}

bool loop()
{
    return sgLoop(null);
}

bool loop(out int code)
{
    return sgLoop(&code);
}

void stop(int ret)
{
    sgStop(ret);
}

ulong getTick()
{
    return sgGetTick();
}

