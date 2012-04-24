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
module siege.graphics.sprite;

import std.string;

import siege.graphics.texture;
import siege.util.angles;
import siege.c.graphics.sprite;


class Sprite
{
    SGSprite* handle;

    this(Texture texture)
    {
        handle = sgSpriteCreateTexture(texture.handle);
        assert(handle);
    }

    this(Texture texture, float xoffset, float yoffset)
    {
        handle = sgSpriteCreateTexture2f(texture.handle, xoffset, yoffset);
        assert(handle);
    }

    this(string fname)
    {
        handle = sgSpriteCreateFile(toStringz(fname));
        assert(handle);
    }

    this(string fname, float xoffset, float yoffset)
    {
        handle = sgSpriteCreateFile2f(toStringz(fname), xoffset, yoffset);
        assert(handle);
    }

    ~this()
    {
        sgSpriteDestroy(handle);
    }

    void addFrame(string fname)
    {
        sgSpriteAddFrameFile(handle, toStringz(fname));
    }

    void image(float val) @property
    {
        sgSpriteSetImage(handle, val);
    }

    float image() @property
    {
        return sgSpriteGetImage(handle);
    }

    void speed(float val) @property
    {
        sgSpriteSetSpeed(handle, val);
    }

    float speed() @property
    {
        return sgSpriteGetSpeed(handle);
    }

    void draw(float x, float y)
    {
        sgSpriteDraw2f(handle, x, y);
    }

    void draw(float x, float y, float z)
    {
        sgSpriteDraw3f(handle, x, y, z);
    }

    void draw(float x, float y, float xscale, float yscale)
    {
        sgSpriteDraw2f2f(handle, x, y, xscale, yscale);
    }

    void draw(float x, float y, float z, float xscale, float yscale)
    {
        sgSpriteDraw3f2f(handle, x, y, z, xscale, yscale);
    }

    void draw(float x, float y, Degrees angle)
    {
        sgSpriteDrawDegs2f1f(handle, x, y, angle);
    }

    void draw(float x, float y, Radians angle)
    {
        sgSpriteDrawRads2f1f(handle, x, y, angle);
    }

    void draw(float x, float y, float z, Degrees angle)
    {
        sgSpriteDrawDegs3f1f(handle, x, y, z, angle);
    }

    void draw(float x, float y, float z, Radians angle)
    {
        sgSpriteDrawRads3f1f(handle, x, y, z, angle);
    }

    void draw(float x, float y, float xscale, float yscale, Degrees angle)
    {
        sgSpriteDrawDegs2f2f1f(handle, x, y, xscale, yscale, angle);
    }

    void draw(float x, float y, float xscale, float yscale, Radians angle)
    {
        sgSpriteDrawRads2f2f1f(handle, x, y, xscale, yscale, angle);
    }

    void draw(float x, float y, float z, float xscale, float yscale, Degrees angle)
    {
        sgSpriteDrawDegs3f2f1f(handle, x, y, z, xscale, yscale, angle);
    }

    void draw(float x, float y, float z, float xscale, float yscale, Radians angle)
    {
        sgSpriteDrawRads3f2f1f(handle, x, y, z, xscale, yscale, angle);
    }

    void getSize(out uint width, out uint height)
    {
        sgSpriteGetSize(handle, &width, &height);
    }

    @property uint width()
    {
        return sgSpriteGetWidth(handle);
    }

    @property uint height()
    {
        return sgSpriteGetHeight(handle);
    }
}
