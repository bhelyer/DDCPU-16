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
module siege.graphics.texture;

import std.string;

import siege.util.angles;
import siege.c.common;
import siege.c.graphics.texture;


class Texture
{
    SGTexture* handle;

    this(string fname)
    {
        handle = sgTextureCreateFile(toStringz(fname));
        assert(handle);
    }

    this(uint width, uint height, SGenum bpp, void* data = null)
    {
        if (data !is null) {
            handle = sgTextureCreateData(width, height, bpp, data);
        } else {
            handle = sgTextureCreate(width, height, bpp);
        }
        assert(handle);
    }

    ~this()
    {
        sgTextureDestroy(handle);
    }

    void data(uint width, uint height, SGenum bpp, void[] ptr)
    {
        sgTextureSetData(handle, width, height, bpp, ptr.ptr);
    }

    void draw()
    {
        sgTextureDraw(handle);
    }

    void draw(float x, float y)
    {
        sgTextureDraw2f(handle, x, y);
    }

    void draw(float x, float y, float z)
    {
        sgTextureDraw3f(handle, x, y, z);
    }

    void draw(float x, float y, float xscale, float yscale)
    {
        sgTextureDraw2f2f(handle, x, y, xscale, yscale);
    }

    void draw(float x, float y, float z, float xscale, float yscale)
    {
        sgTextureDraw3f2f(handle, x, y, z, xscale, yscale);
    }

    void draw(float x, float y, float xscale, float yscale, float xoffset, float yoffset)
    {
        sgTextureDraw2f2f2f(handle, x, y, xscale, yscale, xoffset, yoffset);
    }

    void draw(float x, float y, float z, float xscale, float yscale, float xoffset, float yoffset)
    {
        sgTextureDraw3f2f2f(handle, x, y, z, xscale, yscale, xoffset, yoffset);
    }

    void draw(float x, float y, Degrees angle)
    {
        sgTextureDrawDegs2f1f(handle, x, y, angle);
    }

    void draw(float x, float y, Radians angle)
    {
        sgTextureDrawRads2f1f(handle, x, y, angle);
    }

    void draw(float x, float y, float z, Degrees angle)
    {
        sgTextureDrawDegs3f1f(handle, x, y, z, angle);
    }

    void draw(float x, float y, float z, Radians angle)
    {
        sgTextureDrawRads3f1f(handle, x, y, z, angle);
    }

    void draw(float x, float y, float xscale, float yscale, Degrees angle)
    {
        sgTextureDrawDegs2f2f1f(handle, x, y, xscale, yscale, angle);
    }

    void draw(float x, float y, float xscale, float yscale, Radians angle)
    {
        sgTextureDrawRads2f2f1f(handle, x, y, xscale, yscale, angle);
    }

    void draw(float x, float y, float z, float xscale, float yscale, Degrees angle)
    {
        sgTextureDrawDegs3f2f1f(handle, x, y, z, xscale, yscale, angle);
    }

    void draw(float x, float y, float z, float xscale, float yscale, Radians angle)
    {
        sgTextureDrawRads3f2f1f(handle, x, y, z, xscale, yscale, angle);
    }

    void draw(float x, float y, float xscale, float yscale, float xoffset, float yoffset, Degrees angle)
    {
        sgTextureDrawDegs2f2f2f1f(handle, x, y, xscale, yscale, xoffset, yoffset, angle);
    }

    void draw(float x, float y, float xscale, float yscale, float xoffset, float yoffset, Radians angle)
    {
        sgTextureDrawRads2f2f2f1f(handle, x, y, xscale, yscale, xoffset, yoffset, angle);
    }

    void draw(float x, float y, float z, float xscale, float yscale, float xoffset, float yoffset, Degrees angle)
    {
        sgTextureDrawDegs3f2f2f1f(handle, x, y, z, xscale, yscale, xoffset, yoffset, angle);
    }

    void draw(float x, float y, float z, float xscale, float yscale, float xoffset, float yoffset, Radians angle)
    {
        sgTextureDrawRads3f2f2f1f(handle, x, y, z, xscale, yscale, xoffset, yoffset, angle);
    }

    void getSize(out uint width, out uint height)
    {
        sgTextureGetSize(handle, &width, &height);
    }

    @property uint width()
    {
        return sgTextureGetWidth(handle);
    }

    @property uint height()
    {
        return sgTextureGetHeight(handle);
    }
}

