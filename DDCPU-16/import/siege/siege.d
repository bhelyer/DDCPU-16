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

module siege.siege;
public:

import sgcore = siege.core.core;
import window = siege.core.window;
import draw = siege.graphics.draw;
import keyboard = siege.input.keyboard;
import mouse = siege.input.mouse;
import joystick = siege.input.joystick;
import time = siege.util.time;

import siege.audio.buffer;
import siege.audio.source;
import siege.ai.astar;
import siege.ai.grid;

import siege.core.entity;

import siege.graphics.font;
import siege.graphics.mask;
import siege.graphics.sprite;
import siege.graphics.surface;
import siege.graphics.texture;
import siege.graphics.trail;
import siege.graphics.turtle;
import siege.graphics.viewport;

import siege.physics._body;
import siege.physics.collision;
import siege.physics.space;
import siege.physics.shape;

import siege.util.angles;
import siege.util.list;

import siege.c.common;
