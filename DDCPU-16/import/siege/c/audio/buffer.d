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

module siege.c.audio.buffer;

import siege.c.common;

extern(C):

struct SGAudioBuffer
{
    void* handle;
}

SGAudioBuffer* sgAudioBufferCreateFile(const(char)* fname);
void sgAudioBufferDestroy(SGAudioBuffer* buffer);

void sgAudioBufferSetData(SGAudioBuffer* buffer, SGuint channels, SGuint format, SGuint frequency, void* data, size_t datalen);

