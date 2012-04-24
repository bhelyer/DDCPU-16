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

module siege.c.graphics.turtle;

import siege.c.common;

extern(C):

struct SGTurtleState
{
    float x;
    float y;
    float angle;
    SGbool draw;
}

struct SGTurtle
{
    SGTurtleState* stack;
    size_t stacklen;

    SGTurtleState start;
    SGTurtleState prev;
    SGTurtleState curr;
}

SGbool _sgTurtleInit();
SGbool _sgTurtleDeinit();

SGTurtle* sgTurtleCreateDegs(float x, float y, float angle, SGbool draw);
SGTurtle* sgTurtleCreateRads(float x, float y, float angle, SGbool draw);
void sgTurtleDestroy(SGTurtle* turtle);
void sgTurtleReset(SGTurtle* turtle);
void sgTurtlePush(SGTurtle* turtle);
void sgTurtlePop(SGTurtle* turtle);
void sgTurtleStep(SGTurtle* turtle, float dist);
void sgTurtleMove(SGTurtle* turtle, float x, float y);
void sgTurtleJump(SGTurtle* turtle, float x, float y);
void sgTurtlePenUp(SGTurtle* turtle);
void sgTurtlePenDown(SGTurtle* turtle);

void sgTurtleSetPen(SGTurtle* turtle, SGbool pen);
SGbool sgTurtleGetPen(SGTurtle* turtle);
// alias of jump
void sgTurtleSetPos(SGTurtle* turtle, float x, float y);
void sgTurtleSetPosX(SGTurtle* turtle, float x);
void sgTurtleSetPosY(SGTurtle* turtle, float y);
void sgTurtleGetPos(SGTurtle* turtle, float* x, float* y);
float sgTurtleGetPosX(SGTurtle* turtle);
float sgTurtleGetPosY(SGTurtle* turtle);

// positive CCW
void sgTurtleTurnLeftRads(SGTurtle* turtle, float rads);
void sgTurtleTurnLeftDegs(SGTurtle* turtle, float degs);
void sgTurtleTurnRightRads(SGTurtle* turtle, float rads);
void sgTurtleTurnRightDegs(SGTurtle* turtle, float degs);

void sgTurtleSetAngleRads(SGTurtle* turtle, float rads);
float sgTurtleGetAngleRads(SGTurtle* turtle);

void sgTurtleSetAngleDegs(SGTurtle* turtle, float degs);
float sgTurtleGetAngleDegs(SGTurtle* turtle);

