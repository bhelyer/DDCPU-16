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

module siege.c.input.mouse;

import siege.c.common;

extern(C):

void _sg_cbMouseButton(void* mouse, SGuint button, SGbool action);
void _sg_cbMouseMove(void* mouse, SGint x, SGint y);
void _sg_cbMouseWheel(void* mouse, SGint w);

SGbool _sgMouseInit();
SGbool _sgMouseDeinit();

void sgMouseGetPosPrev(SGint* x, SGint* y);
SGint sgMouseGetPosPrevX();
SGint sgMouseGetPosPrevY();

void sgMouseGetPos(SGint* x, SGint* y);
SGint sgMouseGetPosX();
SGint sgMouseGetPosY();

SGint sgMouseGetWheelPrev();
SGint sgMouseGetWheel();

SGbool sgMouseGetButtonPrev(SGuint button);
SGbool sgMouseGetButton(SGuint button);
SGbool sgMouseGetButtonPress(SGuint button);
SGbool sgMouseGetButtonRelease(SGuint button);

SGbool sgMouseGetButtonLeftPrev();
SGbool sgMouseGetButtonLeft();
SGbool sgMouseGetButtonLeftPress();
SGbool sgMouseGetButtonLeftRelease();

SGbool sgMouseGetButtonRightPrev();
SGbool sgMouseGetButtonRight();
SGbool sgMouseGetButtonRightPress();
SGbool sgMouseGetButtonRightRelease();

SGbool sgMouseGetButtonMiddlePrev();
SGbool sgMouseGetButtonMiddle();
SGbool sgMouseGetButtonMiddlePress();
SGbool sgMouseGetButtonMiddleRelease();

