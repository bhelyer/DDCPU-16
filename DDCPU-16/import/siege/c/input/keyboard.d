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

module siege.c.input.keyboard;

import siege.c.common;

extern(C):

void _sg_cbKeyboardKey(void* keyboard, SGuint key, SGbool down);
void _sg_cbKeyboardChar(void* keyboard, SGdchar chr, SGbool down);

SGint _sgKeyboardInside(SGuint* array, SGuint what, SGuint len);

SGbool _sgKeyboardInit();
SGbool _sgKeyboardDeinit();

void _sgKeyboardKeyUpdate(SGenum key, SGbool down);
void _sgKeyboardCharUpdate(SGdchar chr, SGbool down);

SGbool sgKeyboardKey(SGenum key);
SGbool sgKeyboardKeyPress(SGenum key);
SGbool sgKeyboardKeyRelease(SGenum key);

SGbool sgKeyboardChar(SGdchar chr);
SGbool sgKeyboardCharPress(SGdchar chr);
SGbool sgKeyboardCharRelease(SGdchar chr);

