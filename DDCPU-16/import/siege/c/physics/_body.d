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
module siege.c.physics._body;
extern (C):


import siege.c.common;
import siege.c.physics.space;
import siege.c.core.entity;

struct SGPhysicsBody
{
    void* handle;
    SGPhysicsSpace* space;
    void* data;

    SGenum type;

    SGEntity* entity;
}

SGPhysicsBody* sgPhysicsBodyCreate(SGPhysicsSpace* space, SGenum type);
void sgPhysicsBodyDestroy(SGPhysicsBody* _body);

void sgPhysicsBodySetData(SGPhysicsBody* _body, void* data);
void* sgPhysicsBodyGetData(SGPhysicsBody* _body);

void sgPhysicsBodySetSleeping(SGPhysicsBody*, SGbool);
SGbool sgPhysicsBodyGetSleeping(SGPhysicsBody*);

void sgPhysicsBodySetPos(SGPhysicsBody* _body, float x, float y);
void sgPhysicsBodyGetPos(SGPhysicsBody* _body, float* x, float* y);

void sgPhysicsBodySetPosX(SGPhysicsBody* _body, float x);
float sgPhysicsBodyGetPosX(SGPhysicsBody* _body);
void sgPhysicsBodySetPosY(SGPhysicsBody* _body, float y);
float sgPhysicsBodyGetPosY(SGPhysicsBody* _body);

void sgPhysicsBodySetAngleRads(SGPhysicsBody* _body, float rads);
float sgPhysicsBodyGetAngleRads(SGPhysicsBody* _body);
void sgPhysicsBodySetAngleDegs(SGPhysicsBody* _body, float degs);
float sgPhysicsBodyGetAngleDegs(SGPhysicsBody* _body);

void sgPhysicsBodySetVel(SGPhysicsBody* _body, float x, float y);
void sgPhysicsBodyGetVel(SGPhysicsBody* _body, float* x, float* y);

void sgPhysicsBodySetVelX(SGPhysicsBody* _body, float x);
float sgPhysicsBodyGetVelX(SGPhysicsBody* _body);
void sgPhysicsBodySetVelY(SGPhysicsBody* _body, float y);
float sgPhysicsBodyGetVelY(SGPhysicsBody* _body);

void sgPhysicsBodySetAngVelRads(SGPhysicsBody* _body, float rads);
float sgPhysicsBodyGetAngVelRads(SGPhysicsBody* _body);
void sgPhysicsBodySetAngVelDegs(SGPhysicsBody* _body, float degs);
float sgPhysicsBodyGetAngVelDegs(SGPhysicsBody* _body);

void sgPhysicsBodySetMass(SGPhysicsBody* _body, float mass);
float sgPhysicsBodyGetMass(SGPhysicsBody* _body);

void sgPhysicsBodySetMoment(SGPhysicsBody* _body, float moment);
float sgPhysicsBodyGetMoment(SGPhysicsBody* _body);

void sgPhysicsBodyApplyImpulse(SGPhysicsBody* _body, float jx, float jy, float rx, float ry);
void sgPhysicsBodyApplyForce(SGPhysicsBody*, float, float, float, float);

