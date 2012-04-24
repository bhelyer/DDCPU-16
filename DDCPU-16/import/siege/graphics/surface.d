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
module siege.graphics.surface;

import std.string;

import siege.util.angles;
import siege.c.common;
import siege.c.graphics.surface;


class Surface
{
    SGSurface* handle;
    
    this(string fname)
    {
        handle = sgSurfaceCreateFile(toStringz(fname));
        assert(handle);
    }
    
    this(uint width, uint height, SGenum bpp, void* data=null)
    {
        if (data !is null) {
            handle = sgSurfaceCreateData(width, height, bpp, data);
        } else {
            handle = sgSurfaceCreate(width, height, bpp);
        }
        assert(handle);
    }
    
    ~this()
    {
        sgSurfaceDestroy(handle);
    }
    
    void draw()
    {
        sgSurfaceDraw(handle);
    }
    
    void draw(float x, float y)
    {
        sgSurfaceDraw2f(handle, x, y);
    }
    
    void draw(float x, float y, Degrees angle)
    {
        sgSurfaceDrawDegs2f1f(handle, x, y, angle);
    }
    
    void draw(float x, float y, Radians angle)
    {
        sgSurfaceDrawRads2f1f(handle, x, y, angle);
    }
    
    void draw(float x, float y, float z)
    {
        sgSurfaceDraw3f(handle, x, y, z);
    }
    
    void draw(float x, float y, float z, Degrees angle)
    {
        sgSurfaceDrawDegs3f1f(handle, x, y, z, angle);
    }
    
    void draw(float x, float y, float z, Radians angle)
    {
        sgSurfaceDrawRads3f1f(handle, x, y, z, angle);
    }
    
    void draw(float x, float y, float xscale, float yscale)
    {
        sgSurfaceDraw2f2f(handle, x, y, xscale, yscale);
    }
    
    void draw(float x, float y, float xscale, float yscale, Degrees angle)
    {
        sgSurfaceDrawDegs2f2f1f(handle, x, y, xscale, yscale, angle);
    }
    
    void draw(float x, float y, float xscale, float yscale, Radians angle)
    {
        sgSurfaceDrawRads2f2f1f(handle, x, y, xscale, yscale, angle);
    }
    
    void draw(float x, float y, float z, float xscale, float yscale)
    {
        sgSurfaceDraw3f2f(handle, x, y, z, xscale, yscale);
    }
    
    void draw(float x, float y, float z, float xscale, float yscale, Degrees angle)
    {
        sgSurfaceDrawDegs3f2f1f(handle, x, y, z, xscale, yscale, angle);
    }
    
    void draw(float x, float y, float z, float xscale, float yscale, Radians angle)
    {
        sgSurfaceDrawRads3f2f1f(handle, x, y, z, xscale, yscale, angle);
    }
    
    void draw(float x, float y, float xscale, float yscale, float xoffset, float yoffset)
    {
        sgSurfaceDraw2f2f2f(handle, x, y, xscale, yscale, xoffset, yoffset);
    }
    
    void draw(float x, float y, float xscale, float yscale, float xoffset, float yoffset, Degrees angle)
    {
        sgSurfaceDrawDegs2f2f2f1f(handle, x, y, xscale, yscale, xoffset, yoffset, angle);
    }

    void draw(float x, float y, float xscale, float yscale, float xoffset, float yoffset, Radians angle)
    {
        sgSurfaceDrawRads2f2f2f1f(handle, x, y, xscale, yscale, xoffset, yoffset, angle);
    }
            
    void draw(float x, float y, float z, float xscale, float yscale, float xoffset, float yoffset)
    {
        sgSurfaceDraw3f2f2f(handle, x, y, z, xscale, yscale, xoffset, yoffset);
    }
     
    void draw(float x, float y, float z, float xscale, float yscale, float xoffset, float yoffset, Degrees angle)
    {
        sgSurfaceDrawDegs3f2f2f1f(handle, x, y, z, xscale, yscale, xoffset, yoffset, angle);
    }
    
    void draw(float x, float y, float z, float xscale, float yscale, float xoffset, float yoffset, Radians angle)
    {
        sgSurfaceDrawRads3f2f2f1f(handle, x, y, z, xscale, yscale, xoffset, yoffset, angle);
    }
        
    void clear()
    {
        sgSurfaceClear(handle);
    }
    
    void clearub(ubyte g)
    {
        sgSurfaceClear1ub(handle, g);
    }
    
    void clearub(ubyte g, ubyte a)
    {
        sgSurfaceClear2ub(handle, g, a);
    }
    
    void clearub(ubyte r, ubyte g, ubyte b)
    {
        sgSurfaceClear3ub(handle, r, g, b);
    }
    
    void clearub(ubyte r, ubyte g, ubyte b, ubyte a)
    {
        sgSurfaceClear4ub(handle, r, g, b, a);
    }
    
    void clearf(float g)
    {
        sgSurfaceClear1f(handle, g);
    }
    
    void clearf(float g, float a)
    {
        sgSurfaceClear2f(handle, g, a);
    }
    
    void clearf(float r, float g, float b)
    {
        sgSurfaceClear3f(handle, r, g, b);
    }
    
    void clearf(float r, float g, float b, float a)
    {
        sgSurfaceClear4f(handle, r, g, b, a);
    }
    
    void getSize(out uint width, out uint height)
    {
        sgSurfaceGetSize(handle, &width, &height);
    }
    
    @property uint width()
    {
        return sgSurfaceGetWidth(handle);
    }
    
    @property uint height()
    {
        return sgSurfaceGetHeight(handle);
    }
} 
