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
module siege.audio.source;

import siege.audio.buffer;
import siege.c.audio.buffer;
import siege.c.audio.source;


class Source
{
    SGAudioSource* handle;

    this(float priority, float volume, float pitch, bool looping)
    {
        handle = sgAudioSourceCreate(priority, volume, pitch, looping);
	    assert(handle);
    }

    ~this()
    {
        sgAudioSourceDestroy(handle);
    }

    void play()
    {
        sgAudioSourcePlay(handle);
    }

    @property bool isPlaying()
    {
        return sgAudioSourceIsPlaying(handle);
    }

    void pause()
    {
        sgAudioSourcePause(handle);
    }

    @property bool isPaused()
    {
        return sgAudioSourceIsPaused(handle);
    }

    void rewind()
    {
         sgAudioSourceRewind(handle);
    }

    void stop()
    {
         sgAudioSourceStop(handle);
    }

    @property bool isStopped()
    {
        return sgAudioSourceIsStopped(handle);
    }

    void queueBuffers(Buffer[] buffers)
    {
        auto audioBuffers = new SGAudioBuffer*[buffers.length];
	    foreach (i, b; buffers) audioBuffers[i] = b.handle;
        sgAudioSourceQueueBuffers(handle, audioBuffers.ptr, audioBuffers.length);
    }

    void queueBuffer(Buffer buffer)
    {
        sgAudioSourceQueueBuffer(handle, buffer.handle);
    }

    void setPosition(float x, float y, float z)
    {
        sgAudioSourceSetPosition3f(handle, x, y, z);
    }

    void getPosition(out float x, out float y, out float z)
    {
        sgAudioSourceGetPosition3f(handle, &x, &y, &z);
    }

    void setPosition(float x, float y)
    {
        sgAudioSourceSetPosition2f(handle, x, y);
    }

    void getPosition(out float x, out float y)
    {
        sgAudioSourceGetPosition2f(handle, &x, &y);
    }

    void setVelocity(float x, float y, float z)
    {
        sgAudioSourceSetVelocity3f(handle, x, y, z);
    }

    void getVelocity(out float x, out float y, out float z)
    {
        sgAudioSourceGetVelocity3f(handle, &x, &y, &z);
    }

    void setVelocity(float x, float y)
    {
        sgAudioSourceSetVelocity2f(handle, x, y);
    }

    void getVelocity(out float x, out float y)
    {
        sgAudioSourceGetVelocity2f(handle, &x, &y);
    }

    @property void pitch(float f)
    {
        sgAudioSourceSetPitch(handle, f);
    }

    @property float pitch()
    {
        return sgAudioSourceGetPitch(handle);
    }
    
    @property void loop(bool b)
    {
        sgAudioSourceSetLooping(handle, b);
    }

    @property bool loop()
    {
        return sgAudioSourceGetLooping(handle);
    }
}

