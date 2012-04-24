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

module siege.graphics.viewport;

import siege.c.siege;

class Viewport
{
    SGViewport* handle;

    this(uint wposx, uint wposy, uint wsizex, uint wsizey, float posx, float posy, float sizex, float sizey)
    {
        handle = sgViewportCreate4i4f(wposx, wposy, wsizex, wsizey, posx, posy, sizex, sizey);
    }
    
    this(uint wposx, uint wposy, uint wsizex, uint wsizey)
    {
        handle = sgViewportCreate4i(wposx, wposy, wsizex, wsizey);
    }
    
    this()
    {
        handle = sgViewportCreate();
    }
    
    ~this()
    {
        sgViewportDestroy(handle);
    }

    void set(uint wposx, uint wposy, uint wsizex, uint wsizey, float posx, float posy, float sizex, float sizey)
    {
        sgViewportSet4i4f(handle, wposx, wposy, wsizex, wsizey, posx, posy, sizex, sizey);
    }
    
    void set(uint wposx, uint wposy, uint wsizex, uint wsizey)
    {
        sgViewportSet4i(handle, wposx, wposy, wsizex, wsizey);
    }
    
    void reset()
    {
        sgViewportReset(handle);
    }
    
    uint wposx() @property { return handle.wposx; }
    uint wposy() @property { return handle.wposy; }
    uint wsizex() @property { return handle.wsizex; }
    uint wsizey() @property { return handle.wsizey; }
    float posx() @property { return handle.posx; }
    float posy() @property { return handle.posy; }
    float sizex() @property { return handle.sizex; }
    float sizey() @property { return handle.sizey; }
}
