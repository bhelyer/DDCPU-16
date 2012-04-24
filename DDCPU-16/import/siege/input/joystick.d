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
module siege.input.joystick;

import siege.c.input.joystick;


bool getButtonPrev(uint joy, uint button)
{
    return sgJoystickGetButtonPrev(joy, button);
}

bool getButton(uint joy, uint button)
{
    return sgJoystickGetButton(joy, button);
}

bool getButtonPress(uint joy, uint button)
{
    return sgJoystickGetButtonPress(joy, button);
}

bool getButtonRelease(uint joy, uint button)
{
    return sgJoystickGetButtonRelease(joy, button);
}

float* getAxisPrev(uint joy)
{
    return sgJoystickGetAxisPrev(joy);
}

float getAxisPrev(uint joy, uint axis)
{
    return sgJoystickGetAxisIndexPrev(joy, axis);
}

float* getAxis(uint joy)
{
    return sgJoystickGetAxis(joy); 
}

float getAxis(uint joy, uint axis)
{
    return sgJoystickGetAxisIndex(joy, axis);
}

float* getAxisDelta(uint joy)
{
    return sgJoystickGetAxisDelta(joy);
}

float getAxisDelta(uint joy, uint axis)
{
    return sgJoystickGetAxisIndexDelta(joy, axis);
}
