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

module siege.c.common;

extern(C):

alias void     SGvoid;
alias bool     SGbool;
alias uint     SGenum;

alias char     SGchar;
alias wchar    SGwchar;
alias dchar    SGdchar;

alias byte     SGbyte;
alias ubyte    SGubyte;
alias short    SGshort;
alias ushort   SGushort;
alias int      SGint;
alias uint     SGuint;
alias long     SGlong;
alias ulong    SGulong;

alias float  SGfloat;
alias double SGdouble;

const SG_INTERFACE_VMAJOR = 0;
const SG_INTERFACE_VMINOR = 3;
const SG_INTERFACE_VPATCH = 3;
enum SG_VERSION_STRING = "0.3.3";

const SG_TRUE  = true;
const SG_FALSE = false;

enum
{
    SG_OK            = 0,
    SG_NO_ERROR      = 0,
    SG_UNKNOWN_ERROR = 1,
    SG_INVALID_VALUE = 2,
}

enum
{
    SG_MODULE_WINDOW       = 0x0001,
    SG_MODULE_INPUT        = 0x0002,
    SG_MODULE_CORE         = SG_MODULE_WINDOW | SG_MODULE_INPUT,
    SG_MODULE_GRAPHICS     = 0x0004,
    SG_MODULE_GRAPHICSLOAD = 0x0008,
    SG_MODULE_AUDIO        = 0x0010,
    SG_MODULE_AUDIOLOAD    = 0x0020,
    SG_MODULE_FONTLOAD     = 0x0040,
    SG_MODULE_FONTCONV     = 0x0080,
    SG_MODULE_PHYSICS      = 0x0100,
}

enum
{
    SG_AUDIO_FORMAT_S8  = 0x01,
    SG_AUDIO_FORMAT_S16 = 0x02,
    SG_AUDIO_FORMAT_S24 = 0x03,
    SG_AUDIO_FORMAT_S32 = 0x04,

    SG_AUDIO_FORMAT_U8  = 0x05,
    SG_AUDIO_FORMAT_U16 = 0x06,
    SG_AUDIO_FORMAT_U24 = 0x07,
    SG_AUDIO_FORMAT_U32 = 0x08,

    SG_AUDIO_FORMAT_F   = 0x0A,
    SG_AUDIO_FORMAT_D   = 0x0B,
}

enum
{
    SG_GRAPHICS_PRIMITIVE_POINTS            = 0x01,
    SG_GRAPHICS_PRIMITIVE_LINES             = 0x02,
    SG_GRAPHICS_PRIMITIVE_LINE_STRIP        = 0x03,
    SG_GRAPHICS_PRIMITIVE_LINE_FAN          = 0x04,
    SG_GRAPHICS_PRIMITIVE_LINE_LOOP         = 0x05,
    SG_GRAPHICS_PRIMITIVE_TRIANGLES         = 0x06,
    SG_GRAPHICS_PRIMITIVE_TRIANGLE_STRIP    = 0x07,
    SG_GRAPHICS_PRIMITIVE_TRIANGLE_FAN      = 0x08,
    SG_GRAPHICS_PRIMITIVE_QUADS             = 0x0A,
    SG_GRAPHICS_PRIMITIVE_QUAD_STRIP        = 0x0B,
    SG_GRAPHICS_PRIMITIVE_CONVEX_POLYGON        = 0x10,
    SG_GRAPHICS_PRIMITIVE_CONCAVE_POLYGON       = 0x20,
    SG_GRAPHICS_PRIMITIVE_INTERSECTING_POLYGON  = 0x30,
}

enum
{
    SG_GRAPHICS_WRAP_CURRENT = 0x00,
    SG_GRAPHICS_WRAP_CLAMP = 0x01,
    SG_GRAPHICS_CLAMP_TO_EDGE = 0x02,
    SG_GRAPHICS_MIRRORED_REPEAT = 0x03,
    SG_GRAPHICS_WRAP_REPEAT = 0x04,
}

enum
{
    SG_GRAPHICS_INTERP_CURRENT = 0x00,
    SG_GRAPHICS_INTERP_NEAREST = 0x01,
    SG_GRAPHICS_INTERP_LINEAR = 0x02,
}

enum
{
    SG_GRAPHICS_FUNC_ZERO = 0x00,
    SG_GRAPHICS_FUNC_ONE = 0x01,
    SG_GRAPHICS_FUNC_SRC_COLOR = 0x02,
    SG_GRAPHICS_FUNC_ONE_MINUS_SRC_COLOR = 0x03,
    SG_GRAPHICS_FUNC_DST_COLOR = 0x04,
    SG_GRAPHICS_FUNC_ONE_MINUS_DST_COLOR = 0x05,
    SG_GRAPHICS_FUNC_SRC_ALPHA = 0x06,
    SG_GRAPHICS_FUNC_ONE_MINUS_SRC_ALPHA = 0x07,
    SG_GRAPHICS_FUNC_DST_ALPHA = 0x08,
    SG_GRAPHICS_FUNC_ONE_MINUS_DST_ALPHA = 0x09,
}

enum
{
    SG_GRAPHICS_EQUATION_ADD = 0x00,
    SG_GRAPHICS_EQUATION_SUBTRACT = 0x01,
    SG_GRAPHICS_EQUATION_REVERSE_SUBTRACT = 0X02,
    SG_GRAPHICS_EQUATION_MIN = 0x03,
    SG_GRAPHICS_EQUATION_MAX = 0x04,
}

enum
{
    SG_PHYSICS_SHAPE_SEGMENT = 0x01,
    SG_PHYSICS_SHAPE_POLYGON = 0x02,
    SG_PHYSICS_SHAPE_CIRCLE  = 0x03,
}

enum
{
    SG_PHYSICS_CONSTRAINT_PIN = 0x01,
    SG_PHYSICS_CONSTRAINT_SLIDE = 0x02,
    SG_PHYSICS_CONSTRAINT_PIVOT = 0x03,
    SG_PHYSICS_CONSTRAINT_GROOVE = 0x04,
    SG_PHYSICS_CONSTRAINT_LINSPRING = 0x05,
    SG_PHYSICS_CONSTRAINT_ROTSPRING = 0x06,
    SG_PHYSICS_CONSTRAINT_RATCHET = 0x07,
    SG_PHYSICS_CONSTRAINT_GEAR = 0x09,
    SG_PHYSICS_CONTRAINT_MOTOR = 0x0A,
}

enum
{
    SG_PHYSICS_BODY_PASSIVE    = 0x01,
    SG_PHYSICS_BODY_NORMAL     = 0x02,
    SG_PHYSICS_BODY_SEMISTATIC = 0x03,
    SG_PHYSICS_BODY_STATIC     = 0x04,
}

enum
{
    SG_WINDOW_FULLSCREEN = 0x01,
    SG_WINDOW_RESIZABLE  = 0x02,
}

enum
{
    SG_JOYSTICK_BUTTON_NOCB = 0x01,
    SG_JOYSTICK_AXIS_NOCB   = 0x11,
}

enum
{
    SG_KEYBOARD_KEY_UNKNOWN     = 0x000,
    SG_KEYBOARD_KEY_SPACE       = 0x020,
    SG_KEYBOARD_KEY_ESC         = 0x100,
    SG_KEYBOARD_KEY_F1          = 0x101,
    SG_KEYBOARD_KEY_F2          = 0x102,
    SG_KEYBOARD_KEY_F3          = 0x103,
    SG_KEYBOARD_KEY_F4          = 0x104,
    SG_KEYBOARD_KEY_F5          = 0x105,
    SG_KEYBOARD_KEY_F6          = 0x106,
    SG_KEYBOARD_KEY_F7          = 0x107,
    SG_KEYBOARD_KEY_F8          = 0x108,
    SG_KEYBOARD_KEY_F9          = 0x109,
    SG_KEYBOARD_KEY_F10         = 0x10A,
    SG_KEYBOARD_KEY_F11         = 0x10B,
    SG_KEYBOARD_KEY_F12         = 0x10C,
    SG_KEYBOARD_KEY_F13         = 0x10D,
    SG_KEYBOARD_KEY_F14         = 0x10E,
    SG_KEYBOARD_KEY_F15         = 0x10F,
    SG_KEYBOARD_KEY_F16         = 0x110,
    SG_KEYBOARD_KEY_F17         = 0x111,
    SG_KEYBOARD_KEY_F18         = 0x112,
    SG_KEYBOARD_KEY_F19         = 0x113,
    SG_KEYBOARD_KEY_F20         = 0x114,
    SG_KEYBOARD_KEY_F21         = 0x115,
    SG_KEYBOARD_KEY_F22         = 0x116,
    SG_KEYBOARD_KEY_F23         = 0x117,
    SG_KEYBOARD_KEY_F24         = 0x118,
    SG_KEYBOARD_KEY_F25         = 0x119,
    SG_KEYBOARD_KEY_UP          = 0x200,
    SG_KEYBOARD_KEY_DOWN        = 0x201,
    SG_KEYBOARD_KEY_LEFT        = 0x202,
    SG_KEYBOARD_KEY_RIGHT       = 0x203,
    SG_KEYBOARD_KEY_LSHIFT      = 0x210,
    SG_KEYBOARD_KEY_RSHIFT      = 0x211,
    SG_KEYBOARD_KEY_LCTRL       = 0x220,
    SG_KEYBOARD_KEY_RCTRL       = 0x221,
    SG_KEYBOARD_KEY_LALT        = 0x230,
    SG_KEYBOARD_KEY_RALT        = 0x231,
    SG_KEYBOARD_KEY_TAB         = 0x240,
    SG_KEYBOARD_KEY_ENTER       = 0x241,
    SG_KEYBOARD_KEY_BACKSPACE   = 0x242,
    SG_KEYBOARD_KEY_INSERT      = 0x250,
    SG_KEYBOARD_KEY_DELETE      = 0x251,
    SG_KEYBOARD_KEY_HOME        = 0x252,
    SG_KEYBOARD_KEY_END         = 0x253,
    SG_KEYBOARD_KEY_PAGEUP      = 0x254,
    SG_KEYBOARD_KEY_PAGEDOWN    = 0x255,
    SG_KEYBOARD_KEY_KP0         = 0x300,
    SG_KEYBOARD_KEY_KP1         = 0x301,
    SG_KEYBOARD_KEY_KP2         = 0x302,
    SG_KEYBOARD_KEY_KP3         = 0x303,
    SG_KEYBOARD_KEY_KP4         = 0x304,
    SG_KEYBOARD_KEY_KP5         = 0x305,
    SG_KEYBOARD_KEY_KP6         = 0x306,
    SG_KEYBOARD_KEY_KP7         = 0x307,
    SG_KEYBOARD_KEY_KP8         = 0x308,
    SG_KEYBOARD_KEY_KP9         = 0x309,
    SG_KEYBOARD_KEY_KP_ADD      = 0x310,
    SG_KEYBOARD_KEY_KP_SUBTRACT = 0x311,
    SG_KEYBOARD_KEY_KP_MULTIPLY = 0x312,
    SG_KEYBOARD_KEY_KP_DIVIDE   = 0x313,
    SG_KEYBOARD_KEY_KP_DECIMAL  = 0x314,
    SG_KEYBOARD_KEY_KP_EQUAL    = 0x315,
    SG_KEYBOARD_KEY_KP_ENTER    = 0x316,
}

enum
{
    SG_MOUSE_BUTTON_LEFT   = 1,
    SG_MOUSE_BUTTON_RIGHT  = 2,
    SG_MOUSE_BUTTON_MIDDLE = 3,
}

struct SGModuleInfo
{
    SGushort vmajor;
    SGushort vminor;
    SGushort vpatch;

    SGushort mmajor;
    SGushort mminor;
    SGushort mpatch;

    SGuint type;
    const(char)* name;

    void* data;
}

