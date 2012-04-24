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
module siege.c.graphics.viewport;
extern (C):

import siege.c.common;

struct SGViewport
{
    void* handle;

    SGuint wposx;
    SGuint wposy;
    SGuint wsizex;
    SGuint wsizey;
    float posx;
    float posy;
    float sizex;
    float sizey;
}

SGViewport* sgViewportCreate4i4f(SGuint, SGuint, SGuint, SGuint, float, float, float, float);
SGViewport* sgViewportCreate4i(SGuint, SGuint, SGuint, SGuint);
SGViewport* sgViewportCreate();
void sgViewportDestroy(SGViewport*);
void sgViewportSet4i4f(SGViewport*, SGuint, SGuint, SGuint, SGuint, float, float, float, float);
void sgViewportSet4i(SGViewport*, SGuint, SGuint, SGuint, SGuint);
void sgViewportReset(SGViewport*);
void sgViewportSetWPos(SGViewport*, SGuint, SGuint);
void sgViewportSetWSize(SGViewport*, SGuint, SGuint);
void sgViewportSetPos(SGViewport*, float, float);
void sgViewportSetSize(SGViewport*, float, float);

