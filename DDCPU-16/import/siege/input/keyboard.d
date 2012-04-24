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

module siege.input.keyboard;

import siege.c.common;
import siege.c.input.keyboard;

bool key(SGenum key)
{
    return sgKeyboardKey(key);
}

bool press(SGenum key)
{
    return sgKeyboardKeyPress(key);
}

bool release(SGenum key)
{
    return sgKeyboardKeyRelease(key);
}

bool character(dchar c)
{
    return sgKeyboardChar(c);
}

bool characterPress(dchar c)
{
    return sgKeyboardCharPress(c);
}

bool characterRelease(dchar c)
{
    return sgKeyboardCharRelease(c);
}

enum Key
{
    Unknown = SG_KEYBOARD_KEY_UNKNOWN,
    Space = SG_KEYBOARD_KEY_SPACE,
    Escape = SG_KEYBOARD_KEY_ESC,
    F1 = SG_KEYBOARD_KEY_F1,
    F2, F3, F4, F5, F6, F7, F8, F9, F10,
    F11, F12, F13, F14, F15, F16, F17, F18, F19,
    F20, F21, F22, F23, F24, F25,
    Up = SG_KEYBOARD_KEY_UP,
    Down, Left, Right,
    LShift = SG_KEYBOARD_KEY_LSHIFT,
    RShift = SG_KEYBOARD_KEY_RSHIFT,
    LCtrl = SG_KEYBOARD_KEY_LCTRL,
    RCtrl = SG_KEYBOARD_KEY_RCTRL,
    LAlt = SG_KEYBOARD_KEY_LALT,
    RAlt = SG_KEYBOARD_KEY_RALT,
    Tab = SG_KEYBOARD_KEY_TAB,
    Enter = SG_KEYBOARD_KEY_ENTER,
    Backspace = SG_KEYBOARD_KEY_BACKSPACE,
    Insert = SG_KEYBOARD_KEY_INSERT,
    Delete = SG_KEYBOARD_KEY_DELETE,
    Home = SG_KEYBOARD_KEY_HOME,
    End = SG_KEYBOARD_KEY_END,
    Pageup = SG_KEYBOARD_KEY_PAGEUP,
    Pagedown = SG_KEYBOARD_KEY_PAGEDOWN,
    KP0 = SG_KEYBOARD_KEY_KP0,
    KP1, KP2, KP3, KP4, KP5, KP6, KP7, KP8, KP9,
    KPAdd = SG_KEYBOARD_KEY_KP_ADD,
    KPSubtract = SG_KEYBOARD_KEY_KP_SUBTRACT,
    KPMultiply = SG_KEYBOARD_KEY_KP_MULTIPLY,
    KPDivide = SG_KEYBOARD_KEY_KP_DIVIDE,
    KPDecimal = SG_KEYBOARD_KEY_KP_DECIMAL,
    KPEqual = SG_KEYBOARD_KEY_KP_EQUAL,
    KPEnter = SG_KEYBOARD_KEY_KP_ENTER,
}

