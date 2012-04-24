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
module siege.c.core.entity;
extern (C):

import core.vararg;
import siege.c.common;
import siege.c.audio.source;
import siege.c.core.event;
import siege.c.graphics.sprite;
import siege.c.graphics.mask;
import siege.c.physics._body;
import siege.c.physics.collision;


struct SGEntity
{
    SGbool active;
    SGbool pausable;
    SGEvent* event;
    SGvoid* data;
    SGbool visible;
    SGSprite* sprite;
    SGMask* mask;
    SGPhysicsBody* physicsBody;
    SGAudioSource* source;
    float x;
    float y;
    float depth;
    float angle;
    SGbool minside;
    
    SGbool function(SGEntity*, float, float) cbInside;
    
    SGvoid function(SGEntity*) lcDestroy;
    
    SGvoid function(SGEntity*) lcMouseEnter;
    SGvoid function(SGEntity*) lcMouseExit; 

    SGvoid function(SGEntity*, SGuint) lcMouseButton;
    SGvoid function(SGEntity*, SGuint) lcMouseButtonPress;
    SGvoid function(SGEntity*, SGuint) lcMouseButtonRelease;
    SGvoid function(SGEntity*) lcMouseButtonLeft;
    SGvoid function(SGEntity*) lcMouseButtonLeftPress;
    SGvoid function(SGEntity*) lcMouseButtonLeftRelease;
    SGvoid function(SGEntity*) lcMouseButtonRight;
    SGvoid function(SGEntity*) lcMouseButtonRightPress;
    SGvoid function(SGEntity*) lcMouseButtonRightRelease;
    SGvoid function(SGEntity*) lcMouseButtonMiddle;
    SGvoid function(SGEntity*) lcMouseButtonMiddlePress;
    SGvoid function(SGEntity*) lcMouseButtonMiddleRelease;
    SGvoid function(SGEntity*, SGint, SGint) lcMouseMove;
    SGvoid function(SGEntity*, SGint) lcMouseWheel;
    SGvoid function(SGEntity*, SGEntity*, SGPhysicsCollision*) lcCollision;
    SGvoid function(SGEntity*, SGEntity*, SGPhysicsCollision*) lcCollisionOne;
    SGvoid function(SGEntity*, SGEntity*, SGPhysicsCollision*) lcCollisionTwo;
    SGvoid function(SGEntity*, SGEntity*, SGPhysicsCollision*) lcCollisionBegin;
    SGvoid function(SGEntity*, SGEntity*, SGPhysicsCollision*) lcCollisionOneBegin;
    SGvoid function(SGEntity*, SGEntity*, SGPhysicsCollision*) lcCollisionTwoBegin;
    SGvoid function(SGEntity*, SGEntity*, SGPhysicsCollision*) lcCollisionEnd;
    SGvoid function(SGEntity*, SGEntity*, SGPhysicsCollision*) lcCollisionOneEnd;
    SGvoid function(SGEntity*, SGEntity*, SGPhysicsCollision*) lcCollisionTwoEnd;
    SGvoid function(SGEntity*) evInit;
    SGvoid function(SGEntity*) evDeinit;

    SGvoid function(SGEntity*) evStart;
    SGvoid function(SGEntity*) evExit;
    SGvoid function(SGEntity*) evTick;
    SGvoid function(SGEntity*) evTickBegin;
    SGvoid function(SGEntity*) evTickEnd;
    SGvoid function(SGEntity*) evDraw;

    SGvoid function(SGEntity*) evWindowOpen;
    SGvoid function(SGEntity*) evWindowClose;
    SGvoid function(SGEntity*, SGuint, SGuint) evWindowResize;

    SGvoid function(SGEntity*, SGuint) evMouseButton;
    SGvoid function(SGEntity*, SGuint) evMouseButtonPress;
    SGvoid function(SGEntity*, SGuint) evMouseButtonRelease;
    SGvoid function(SGEntity*) evMouseButtonLeft;
    SGvoid function(SGEntity*) evMouseButtonLeftPress;
    SGvoid function(SGEntity*) evMouseButtonLeftRelease;
    SGvoid function(SGEntity*) evMouseButtonRight;
    SGvoid function(SGEntity*) evMouseButtonRightPress;
    SGvoid function(SGEntity*) evMouseButtonRightRelease;
    SGvoid function(SGEntity*) evMouseButtonMiddle;
    SGvoid function(SGEntity*) evMouseButtonMiddlePress;
    SGvoid function(SGEntity*) evMouseButtonMiddleRelease;

    SGvoid function(SGEntity*, SGint, SGint) evMouseMove;
    SGvoid function(SGEntity*, SGint) evMouseWheel;

    SGvoid function(SGEntity*, SGuint) evKeyboardKey;
    SGvoid function(SGEntity*, SGuint) evKeyboardKeyPress;
    SGvoid function(SGEntity*, SGuint) evKeyboardKeyRelease;
    SGvoid function(SGEntity*, SGuint) evKeyboardKeyRepeat;
    SGvoid function(SGEntity*, SGdchar) evKeyboardCharPress;
    SGvoid function(SGEntity*, SGdchar) evKeyboardCharRepeat;

    SGvoid function(SGEntity*, SGuint, SGuint) evJoystickButton;
    SGvoid function(SGEntity*, SGuint, SGuint) evJoystickButtonPress;
    SGvoid function(SGEntity*, SGuint, SGuint) evJoystickButtonRelease;
    SGvoid function(SGEntity*, SGuint, SGfloat*, size_t) evJoystickMove;

    SGvoid function(SGEntity*) evLevelStart;
    SGvoid function(SGEntity*) evLevelEnd;
}

SGbool _sg_evCall(SGEntity*, va_list);
SGvoid _sg_evDraw(SGEntity*);
SGbool _sgEntityInit();
SGbool _sgEntityDeinit();

SGEntity* sgEntityCreate(float);
SGvoid sgEntityDestroy(SGEntity*);

SGvoid sgEntitySetSprite(SGEntity*, SGSprite*);
SGSprite* sgEntityGetSprite(SGEntity*);

SGvoid sgEntitySetMask(SGEntity*, SGMask*);
SGMask* sgEntityGetMask(SGEntity*);

SGvoid sgEntitySetPhysicsBody(SGEntity*, SGPhysicsBody*);
SGPhysicsBody* sgEntityGetPhysicsBody(SGEntity*);

SGvoid sgEntitySetAudioSource(SGEntity*, SGAudioSource*);
SGAudioSource* sgEntityGetAudioSource(SGEntity*);

SGvoid sgEntitySetPos(SGEntity*, float, float);
SGvoid sgEntityGetPos(SGEntity*, float*, float*);
SGvoid sgEntitySetPosX(SGEntity*, float);
float sgEntityGetPosX(SGEntity*);
SGvoid sgEntitySetPosY(SGEntity*, float);
float sgEntityGetPosY(SGEntity*);
SGvoid sgEntitySetDepth(SGEntity*, float);
float sgEntityGetDepth(SGEntity*);
SGvoid sgEntitySetAngleRads(SGEntity*, float);
float sgEntityGetAngleRads(SGEntity*);
SGvoid sgEntitySetAngleDegs(SGEntity*, float);
float sgEntityGetAngleDegs(SGEntity*);

SGvoid sgEntityDraw(SGEntity* entity);

