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
module siege.audio.buffer;

import std.string;

import siege.c.audio.buffer;


class Buffer
{
    SGAudioBuffer* handle;

    uint channels;
    uint format;
    uint frequency;
    void[] data;

    this(string filename)
    {
        handle = sgAudioBufferCreateFile(toStringz(filename));
	    assert(handle);
    }
    
    ~this()
    {
        sgAudioBufferDestroy(handle);
    }

    void set()
    {
        sgAudioBufferSetData(handle, channels, format, frequency, data.ptr, data.length);
    }

    void set(uint channels, uint format, uint frequency, void[] data)
    {
        this.channels = channels;
        this.format = format;
        this.frequency = frequency;
        this.data = data;
        set();
    }
}

