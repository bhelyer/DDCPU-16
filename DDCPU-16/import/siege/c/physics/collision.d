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
module siege.c.physics.collision;
extern (C):

import siege.c.common;
import siege.c.physics.shape;

struct SGPhysicsCollision
{
    void* shandle1;
    void* shandle2;
    void* handle;

    SGPhysicsShape* shape1;
    SGPhysicsShape* shape2;
}

void sgPhysicsCollisionIgnore(SGPhysicsCollision*);
size_t sgPhysicsCollisionGetNumContacts(SGPhysicsCollision*);
void sgPhysicsCollisionGetPoint(SGPhysicsCollision*, size_t, float*, float*);
void sgPhysicsCollisionGetNormal(SGPhysicsCollision*, size_t, float*, float*);
float sgPhysicsCollisionGetDistance(SGPhysicsCollision*, size_t);
void sgPhysicsCollisionGetImpulse(SGPhysicsCollision*, float*, float*, SGbool);
SGPhysicsShape* sgPhysicsCollisionGetShapeOne(SGPhysicsCollision*);
SGPhysicsShape* sgPhysicsCollisionGetShapeTwo(SGPhysicsCollision*);

