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

module siege.input.mouse;

import siege.c.siege;

void positionPrev(out int x, out int y)
{
    sgMouseGetPosPrev(&x, &y);
}
int prevX() @property
{
    return sgMouseGetPosPrevX();
}
int prevY() @property
{
    return sgMouseGetPosPrevY();
}

void position(out int x, out int y)
{
    sgMouseGetPos(&x, &y);
}
int x() @property
{
    return sgMouseGetPosX();
}
int y() @property
{
    return sgMouseGetPosY();
}

int wheelPrev() @property
{
    return sgMouseGetWheelPrev();
}
int wheel() @property
{
    return sgMouseGetWheel();
}

bool buttonPrev(uint button)
{
    return sgMouseGetButtonPrev(button);
}
bool button(uint button)
{
    return sgMouseGetButton(button);
}
bool buttonPress(uint button)
{
    return sgMouseGetButtonPress(button);
}
bool buttonRelease(uint button)
{
    return sgMouseGetButtonRelease(button);
}

bool buttonLeftPrev() @property
{
    return sgMouseGetButtonLeftPrev();
}
bool buttonLeft() @property
{
    return sgMouseGetButtonLeft();
}
bool buttonLeftPress() @property
{
    return sgMouseGetButtonLeftPress();
}
bool buttonLeftRelease() @property
{
    return sgMouseGetButtonLeftRelease();
}

bool buttonRightPrev() @property
{
    return sgMouseGetButtonRightPrev();
}
bool buttonRight() @property
{
    return sgMouseGetButtonRight();
}
bool buttonRightPress() @property
{
    return sgMouseGetButtonRightPress();
}
bool buttonRightRelease() @property
{
    return sgMouseGetButtonRightRelease();
}

bool buttonMiddlePrev() @property
{
    return sgMouseGetButtonMiddlePrev();
}
bool buttonMiddle() @property
{
    return sgMouseGetButtonMiddle();
}
bool buttonMiddlePress() @property
{
    return sgMouseGetButtonMiddlePress();
}
bool buttonMiddleRelease() @property
{
    return sgMouseGetButtonMiddleRelease();
}

