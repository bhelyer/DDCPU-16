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

module siege.core.window;

import siege.c.siege;

import std.string;
import std.conv;

bool open(uint width, uint height, uint bpp, uint flags)
{
    return sgWindowOpen(width, height, bpp, flags);
}

bool isOpened()
{
    return sgWindowIsOpened();
}

void close()
{
    sgWindowClose();
}

@property void title(string title)
{
    sgWindowSetTitle(toStringz(title));
}

@property string title()
{
    return to!string(sgWindowGetTitle());
}

void setSize(uint width, uint height)
{
    sgWindowSetSize(width, height);
}

void getSize(out uint width, out uint height)
{
    sgWindowGetSize(&width, &height);
}

@property void width(uint width)
{
    sgWindowSetWidth(width);
}

@property uint width()
{
    return sgWindowGetWidth();
}

@property void height(uint height)
{
    sgWindowSetHeight(height);
}

@property uint height()
{
    return sgWindowGetHeight();
}

void swapBuffers()
{
    sgWindowSwapBuffers();
}

@property float FPSLimit()
{
    return sgWindowGetFPSLimit();
}

@property void FPSLimit(float f)
{
    sgWindowSetFPSLimit(f);
}

@property float FPS()
{
    return sgWindowGetFPS();
}

