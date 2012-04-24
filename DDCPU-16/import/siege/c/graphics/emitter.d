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
module siege.c.graphics.emitter;

import siege.c.common;
import siege.c.graphics.texture;

extern (C):

struct SGParticle
{
    float x, y, angle, speed, age, width, height, rotation, alpha;
}

alias void function(SGParticle*, float time, float friction) SGParticleUpdate;

struct SGEmitter
{
    float x, y, angle, delta_angle, initial_speed, duration, rate, friction, time_accumulator;
    size_t nb_particles;
    SGTexture* texture;
    SGParticle* particles;
    SGbool silent;
    SGParticleUpdate cbUpdate;
}

SGEmitter* sgEmitterCreate(
                           float x,              /* initial x of particles */
                           float y,              /* initial y of particles */
                           float angle,          /* direction of particles */
                           float delta_angle,    /* variation in direction */
                           float initial_speed,  /* initial speed of particles */
                           float duration,       /* lifetime of particles */
                           float rate,           /* production rate of particles */
                           float friction,       /* environmental friction to particles */
                           size_t nb_particles,  /* size of particles pool */
                           SGTexture* texture);  /* texture used by particles */

void sgEmitterUpdate(SGEmitter* emitter, float time);
SGParticle* _sgParticleCreate(float x, float y, float angle, float speed);
void _sgParticleUpdate(SGParticle* particle, float time, float friction);
void sgEmitterDraw(SGEmitter* emitter);
void sgEmitterSetUpdateFunc(SGEmitter* emitter, SGParticleUpdate cbUpdate);
void sgEmitterSetSilent(SGEmitter*, SGbool);
