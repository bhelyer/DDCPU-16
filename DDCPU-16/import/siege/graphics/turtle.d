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

module siege.graphics.turtle;

import siege.util.angles;
import siege.c.siege;

class Turtle
{
    SGTurtle* handle;

    this(float x, float y, float angle, bool draw)
    {
        handle = sgTurtleCreateDegs(x, y, angle, draw);
        assert(handle);
    }
    
    this(float x, float y, float angle)
    {
        this(x, y, angle, true);
    }
    
    this(float x, float y, bool draw)
    {
        this(x, y, 0.0, draw);
    }
    
    this(float x, float y)
    {
        this(x, y, 0.0, true);
    }
    
    ~this()
    {
        sgTurtleDestroy(handle);
    }

    void reset()
    {
        sgTurtleReset(handle);
    }
    
    void push()
    {
        sgTurtlePush(handle);
    }
    
    void pop()
    {
        sgTurtlePop(handle);
    }
    
    void step(float dist)
    {
        sgTurtleStep(handle, dist);
    }
    
    void move(float x, float y)
    {
        sgTurtleMove(handle, x, y);
    }
    
    void jump(float x, float y)
    {
        sgTurtleJump(handle, x, y);
    }
    
    void penUp()
    {
        sgTurtlePenUp(handle);
    }
    
    void penDown()
    {
        sgTurtlePenDown(handle);
    }

    @property void pen(bool pen)
    {
        sgTurtleSetPen(handle, pen);
    }
    
    @property bool pen()
    {
        return sgTurtleGetPen(handle);
    }

    void setPos(float x, float y)
    {
        sgTurtleSetPos(handle, x, y);
    }
    
    void getPos(out float x, out float y)
    {
        sgTurtleGetPos(handle, &x, &y);
    }
    
    @property void posX(float x)
    {
        sgTurtleSetPosX(handle, x);
    }
    
    @property float posX()
    {
        return sgTurtleGetPosX(handle);
    }
    
    @property void posY(float y)
    {
        sgTurtleSetPosY(handle, y);
    }
    
    @property float posY()
    {
        return sgTurtleGetPosY(handle);
    }

    // positive CCW
    void turnLeft(Radians rads)
    {
        sgTurtleTurnLeftRads(handle, rads);
    }
    void turnLeft(Degrees degs)
    {
        sgTurtleTurnLeftDegs(handle, degs);
    }
    void turnRight(Radians rads)
    {
        sgTurtleTurnRightRads(handle, rads);
    }
    void turnRight(Degrees degs)
    {
        sgTurtleTurnRightDegs(handle, degs);
    }

    @property void angle(Radians angle)
    {
        sgTurtleSetAngleRads(handle, angle);
    }
    
    @property void angle(Degrees angle)
    {
        sgTurtleSetAngleDegs(handle, angle);
    }
    
    @property float angleRadians()
    {
        return sgTurtleGetAngleRads(handle);
    }

    @property float angleDegrees()
    {
        return sgTurtleGetAngleDegs(handle);
    }
    
}
