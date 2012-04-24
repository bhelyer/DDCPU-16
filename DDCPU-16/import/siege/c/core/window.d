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

module siege.c.core.window;

import siege.c.common;

import core.vararg;

extern(C):

void _sg_cbWindowOpen(void* window);
void _sg_cbWindowClose(void* window);
void _sg_cbWindowResize(void* window, SGuint width, SGuint height);

SGbool _sgWindowInit();
SGbool _sgWindowDeinit();
SGbool sgWindowOpen(SGuint width, SGuint height, SGuint bpp, SGenum flags);
SGbool sgWindowIsOpened();
void sgWindowClose();

void sgWindowSetTitlef(const char* format, ...);
void sgWindowSetTitlefv(const char* format, va_list args);
void sgWindowSetTitle(const char* title);
const(char)* sgWindowGetTitle();

void sgWindowSetSize(SGuint width, SGuint height);
void sgWindowGetSize(SGuint* width, SGuint* height);

void sgWindowSetWidth(SGuint width);
SGuint sgWindowGetWidth();
void sgWindowSetHeight(SGuint height);
SGuint sgWindowGetHeight();

void sgWindowSwapBuffers();

SGfloat sgWindowGetFPSLimit();
void sgWindowSetFPSLimit(SGfloat);
SGfloat sgWindowGetFPS();

