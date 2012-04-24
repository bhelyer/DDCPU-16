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
module siege.graphics.trail;

import siege.c.graphics.trail;


class Trail
{
    SGTrail* handle;
    
    this(uint maxpoints)
    {
        handle = sgTrailCreate(maxpoints);
        assert(handle);
    }
    
    ~this()
    {
        sgTrailDestroy(handle);
    }
    
    void addPoint(float x, float y)
    {
        sgTrailAddPoint2f(handle, x, y);
    }
    
    void addBreak()
    {
        sgTrailAddBreak(handle);
    }
    
    void draw()
    {
        sgTrailDraw(handle);
    }
}
