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
module siege.c.input.joystick;
extern (C):

import siege.c.common;


struct _SGJoystick
{
    SGuint id;
    void* handle;

    SGuint numbuttons;
    SGbool* bprev;
    SGbool* bcurr;

    SGuint numaxis;
    float* aprev;
    float* acurr;
    float* adelt;
}

void _sg_cbJoystickButton(void* joystick, SGuint button, SGbool down);
void _sg_cbJoystickMove(void* joystick, float* axis);

SGbool _sgJoystickInit();
SGbool _sgJoystickDeinit();

_SGJoystick* _sgJoystickCreate(SGuint id);
void _sgJoystickDestroy(_SGJoystick* joy);

SGbool sgJoystickGetButtonPrev(SGuint joy, SGuint button);
SGbool sgJoystickGetButton(SGuint joy, SGuint button);
SGbool sgJoystickGetButtonPress(SGuint joy, SGuint button);
SGbool sgJoystickGetButtonRelease(SGuint joy, SGuint button);

float* sgJoystickGetAxisPrev(SGuint joy);
float sgJoystickGetAxisIndexPrev(SGuint joy, SGuint axis);
float* sgJoystickGetAxis(SGuint joy);
float sgJoystickGetAxisIndex(SGuint joy, SGuint axis);
float* sgJoystickGetAxisDelta(SGuint joy);
float sgJoystickGetAxisIndexDelta(SGuint joy, SGuint axis);


