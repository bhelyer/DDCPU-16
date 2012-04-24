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

module siege.c.core.event;

import core.vararg;
import siege.c.util.plist;
import siege.c.common;

extern(C):

enum: SGenum
{
    SG_EV_INTERNAL = -1,
}

// EventClient types -- these should be OR'd together
enum: SGenum
{
    SG_EVT_MODULE   = 0x00010000,
    SG_EVT_CORE     = 0x00020000,
    SG_EVT_WINDOW   = 0x00040000,
    SG_EVT_MOUSE    = 0x00080000,
    SG_EVT_KEYBOARD = 0x00100000,
    SG_EVT_JOYSTICK = 0x00200000,
    SG_EVT_NETWORK  = 0x00400000,
    SG_EVT_PHYSICS  = 0x00800000,
    SG_EVT_LEVEL    = 0x01000000,
    SG_EVT_LOCAL    = 0x02000000,
    SG_EVT_ALL      = 0xFFFF0000,
}

// EventClient functions -- used in calls
enum: SGenum
{
    SG_EVF_INIT   = SG_EVT_MODULE | 0x0001,
    SG_EVF_DEINIT = SG_EVT_MODULE | 0x0002,

    SG_EVF_START = SG_EVT_CORE | 0x0001,
    SG_EVF_EXIT  = SG_EVT_CORE | 0x0002,
    SG_EVF_TICK  = SG_EVT_CORE | 0x0004,
    SG_EVF_TICKB = SG_EVT_CORE | 0x0008,
    SG_EVF_TICKE = SG_EVT_CORE | 0x0010,
    SG_EVF_DRAW  = SG_EVT_CORE | 0x0020,

    SG_EVF_WINOPEN   = SG_EVT_WINDOW | 0x0001,
    SG_EVF_WINCLOSE  = SG_EVT_WINDOW | 0x0002,
    SG_EVF_WINRESIZE = SG_EVT_WINDOW | 0x0004,

    /*
        H: held
        P: press
        R: release
        A: repeat ("again")
    */

    SG_EVF_MOUSEBUTH  = SG_EVT_MOUSE | 0x0001,
    SG_EVF_MOUSEBUTP  = SG_EVT_MOUSE | 0x0002,
    SG_EVF_MOUSEBUTR  = SG_EVT_MOUSE | 0x0004,
    SG_EVF_MOUSEBUTLH = SG_EVT_MOUSE | 0x0008,
    SG_EVF_MOUSEBUTLP = SG_EVT_MOUSE | 0x0010,
    SG_EVF_MOUSEBUTLR = SG_EVT_MOUSE | 0x0020,
    SG_EVF_MOUSEBUTRH = SG_EVT_MOUSE | 0x0040,
    SG_EVF_MOUSEBUTRP = SG_EVT_MOUSE | 0x0080,
    SG_EVF_MOUSEBUTRR = SG_EVT_MOUSE | 0x0100,
    SG_EVF_MOUSEBUTMH = SG_EVT_MOUSE | 0x0200,
    SG_EVF_MOUSEBUTMP = SG_EVT_MOUSE | 0x0400,
    SG_EVF_MOUSEBUTMR = SG_EVT_MOUSE | 0x0800,
    SG_EVF_MOUSEMOVE  = SG_EVT_MOUSE | 0x1000,
    SG_EVF_MOUSEWHEEL = SG_EVT_MOUSE | 0x2000,

    SG_EVF_KEYKEYH  = SG_EVT_KEYBOARD | 0x0001,
    SG_EVF_KEYKEYP  = SG_EVT_KEYBOARD | 0x0002,
    SG_EVF_KEYKEYR  = SG_EVT_KEYBOARD | 0x0004,
    SG_EVF_KEYKEYA  = SG_EVT_KEYBOARD | 0x0008,
    //SG_EVF_KEYCHARH = SG_EVT_KEYBOARD | 5,
    SG_EVF_KEYCHARP = SG_EVT_KEYBOARD | 0x0020,
    //SG_EVF_KEYCHARR = SG_EVT_KEYBOARD | 7,
    SG_EVF_KEYCHARA = SG_EVT_KEYBOARD | 0x0080,

    SG_EVF_JOYSTICKBUTH = SG_EVT_JOYSTICK | 0x0001,
    SG_EVF_JOYSTICKBUTP = SG_EVT_JOYSTICK | 0x0002,
    SG_EVF_JOYSTICKBUTR = SG_EVT_JOYSTICK | 0x0004,
    SG_EVF_JOYSTICKMOVE = SG_EVT_JOYSTICK | 0x0008,

    //SG_EVF_NET = SG_EVT_NETWORK | 1,

    SG_EVF_PHYSCOLH  = SG_EVT_PHYSICS | 0x0001,
    SG_EVF_PHYSCOL1  = SG_EVT_PHYSICS | 0x0002,
    SG_EVF_PHYSCOL2  = SG_EVT_PHYSICS | 0x0004,
    SG_EVF_PHYSCOLBH = SG_EVT_PHYSICS | 0x0008,
    SG_EVF_PHYSCOLB1 = SG_EVT_PHYSICS | 0x0010,
    SG_EVF_PHYSCOLB2 = SG_EVT_PHYSICS | 0x0020,
    SG_EVF_PHYSCOLEH = SG_EVT_PHYSICS | 0x0040,
    SG_EVF_PHYSCOLE1 = SG_EVT_PHYSICS | 0x0080,
    SG_EVF_PHYSCOLE2 = SG_EVT_PHYSICS | 0x0100,
    SG_EVF_PHYSCOLRH = SG_EVT_PHYSICS | 0x0200,
    SG_EVF_PHYSCOLR1 = SG_EVT_PHYSICS | 0x0400,
    SG_EVF_PHYSCOLR2 = SG_EVT_PHYSICS | 0x0800,

    SG_EVF_LVLSTART = SG_EVT_LEVEL | 0x0001,
    SG_EVF_LVLEND   = SG_EVT_LEVEL | 0x0002,
}

/**
    \param data Used-provided data
    \param args Event arguments (depends on the type of event)
    \return SG_TRUE to continue with the next event, SG_FALSE to stop
*/
alias SGbool function(void* data, va_list args) SGEventCall;

struct SGEvent
{
    float priority;
    SGenum type;
    void* data;
    SGEventCall func;
}

SGbool _sgEventInit();
SGbool _sgEventDeinit();
SGEvent* sgEventCreate(float priority, SGenum type, void* data, SGEventCall func);
void sgEventDestroy(SGEvent* event);
void sgEventCall(SGenum type, ...);
void sgEventCallv(SGenum type, va_list args);
