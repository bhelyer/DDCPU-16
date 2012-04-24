/*
 * Copyright (c) 2007 SIEGE Development Team
 * All rights reserved.
 *
 * This file is part of libSIEGE.
 *
 * This software is copyrighted work licensed under the terms of the
 * 2-clause BSD license. Please consult the file "license.txt" for
 * details.
 *
 * If you did not recieve the file with this program, please email
 * Tim Chas <darkuranium@gmail.com>.
 */
module siege.graphics.font;

import core.memory;
import std.string;
import std.c.stdio;

import siege.c.graphics.font;


/// returns a string formatted with snprintf.
private string _cprintf(Vs...)(string fmt, Vs vs)
{
    auto buf = new char[fmt.length + 255];
    auto retval = snprintf(buf.ptr, buf.length, toStringz(fmt), vs);
    assert(retval >= 0);
    if (retval > buf.length) {
        buf = new char[retval + 1];
        retval = snprintf(buf.ptr, buf.length, toStringz(fmt), vs);
        assert(retval >= 0);
    }
    return buf[0 .. retval + 1].idup;
}

class Font
{
    SGFont* handle;
    
    this(string fontname, float height, uint preload=127)
    {
        handle = sgFontCreate(toStringz(fontname), height, preload);
        assert(handle);
    }
    
    this(Font font, float height)
    {
        assert(font !is null);
        handle = sgFontResizeCopy(font.handle, height);
    }
    
    this(SGFont* handle)
    {
        assert(handle);
        this.handle = handle;
    }
    
    ~this()
    {
        sgFontDestroy(handle);
    }
    
    Font resize(float height)
    {
        auto newhandle = sgFontResize(handle, height);
        if (newhandle is handle) {
            return this;
        } else {
            return new Font(newhandle);
        }
    }
    
    void print(float x, float y, string s)
    {
        sgFontPrint(handle, x, y, toStringz(s)); 
    }
    
    void writef(Vs...)(float x, float y, string fmt, Vs vs)
    {
        auto s = format(fmt, vs);
        print(x, y, s);
    }
    
    void cprintf(Vs...)(float x, float y, string fmt, Vs vs)
    {
        auto s = _cprintf(fmt, vs);
        print(x, y, s);
    }

    void printAligned(float x, float y, int _align, string s)
    {
        sgFontPrintAligned(handle, x, y, _align, toStringz(s));
    }

    void writefAligned(Vs...)(float x, float y, int _align, string fmt, Vs vs)
    {
        auto s = format(fmt, vs);
        printAligned(x, y, _align, s);
    }

    void printfAligned(Vs...)(float x, float y, int _align, string fmt, Vs vs)
    {
        auto s = _cprintf(fmt, vs);
        printAligned(x, y, _align, s);
    }

    void getPos(out float x, out float y, size_t index, string s)
    {
        sgFontGetPos(handle, &x, &y, index, toStringz(s));
    }
    
    void strSize(out float x, out float y, string s)
    {
        sgFontStrSize(handle, &x, &y, toStringz(s));
    }
    
    void writefSize(Vs...)(out float x, out float y, string fmt, Vs vs)
    {
        auto s = format(fmt, vs);
        strSize(x, y, s);
    }
    
    void cprintfSize(Vs...)(out float x, out float y, string fmt, Vs vs)
    {
        auto s = _cprintf(fmt, vs);
        strSize(x, y, s);
    }   
} 
