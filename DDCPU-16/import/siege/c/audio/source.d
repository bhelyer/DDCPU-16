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

module siege.c.audio.source;

import siege.c.common;
import siege.c.audio.buffer;
import siege.c.util.plist;

extern(C):

struct SGAudioSourceDispatch
{
    SGAudioSource* source;
    void* handle;
}

struct SGAudioSource
{
    SGAudioSourceDispatch* dispatch;
    float priority;
}

SGbool _sgAudioSourceInit();
SGbool _sgAudioSourceDeinit();

SGAudioSourceDispatch* _sgAudioSourceGetFreeDispatch(SGAudioSource* source);

SGAudioSource* sgAudioSourceCreate(float priority, float volume, float pitch, SGbool looping);
void sgAudioSourceDestroy(SGAudioSource* source);
void sgAudioSourceDestroyLazy(SGAudioSource* source);
void sgAudioSourcePlay(SGAudioSource* source);
void sgAudioSourcePause(SGAudioSource* source);
void sgAudioSourceRewind(SGAudioSource* source);
void sgAudioSourceStop(SGAudioSource* source);
SGbool sgAudioSourceIsPlaying(SGAudioSource* source);
SGbool sgAudioSourceIsActive(SGAudioSource* source);
SGbool sgAudioSourceIsPaused(SGAudioSource* source);
SGbool sgAudioSourceIsStopped(SGAudioSource* source);

void sgAudioSourceQueueBuffers(SGAudioSource* source, SGAudioBuffer** buffers, size_t numbuffers);
void sgAudioSourceQueueBuffer(SGAudioSource* source, SGAudioBuffer* buffer);
void sgAudioSourceUnqueueBuffers(SGAudioSource* source, size_t numbuffers);
void sgAudioSourceUnqueueBuffer(SGAudioSource* source);

void sgAudioSourceSetPosition3f(SGAudioSource* source, float x, float y, float z);
void sgAudioSourceSetPosition2f(SGAudioSource* source, float x, float y);
void sgAudioSourceGetPosition3f(SGAudioSource* source, float* x, float* y, float* z);
void sgAudioSourceGetPosition2f(SGAudioSource* source, float* x, float* y);
void sgAudioSourceSetVelocity3f(SGAudioSource* source, float x, float y, float z);
void sgAudioSourceSetVelocity2f(SGAudioSource* source, float x, float y);
void sgAudioSourceGetVelocity3f(SGAudioSource* source, float* x, float* y, float* z);
void sgAudioSourceGetVelocity2f(SGAudioSource* source ,float* x, float* y);
void sgAudioSourceSetPitch(SGAudioSource* source, float pitch);
float sgAudioSourceGetPitch(SGAudioSource* source);
void sgAudioSourceSetVolume(SGAudioSource* source, float volume);
float sgAudioSourceGetVolume(SGAudioSource* source);
void sgAudioSourceSetLooping(SGAudioSource* source, SGbool looping);
SGbool sgAudioSourceGetLooping(SGAudioSource* source);


