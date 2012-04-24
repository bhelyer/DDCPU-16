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
module siege.c.physics.space;
extern (C):

import siege.c.common;


struct SGPhysicsSpace
{
    void* handle;
}

SGbool _sgPhysicsSpaceInit();
SGbool _sgPhysicsSpaceDeinit();

SGPhysicsSpace* sgPhysicsSpaceGetDefault();
SGPhysicsSpace* sgPhysicsSpaceCreate();
void sgPhysicsSpaceDestroy(SGPhysicsSpace* space);

void sgPhysicsSpaceStep(SGPhysicsSpace* space, float time);
void sgPhysicsSpaceSetGravity(SGPhysicsSpace* space, float x, float y);
void sgPhysicsSpaceSetDamping(SGPhysicsSpace* space, float damping);
void sgPhysicsSpaceSetIterations(SGPhysicsSpace* space, uint iterations);

void sgPhysicsSpaceRehash(SGPhysicsSpace* space);

