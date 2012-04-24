/*
 * Copyright (c) 2007 SIEGE Development Team
 * All rights reserved.
 *
 * This file is part of libSIEGE.
 *
 * This software is copyrighted work licensed under the terms of the
 * 2-clause BSD license. Please consult the file "license.txt" for
 * details.
 *
 * If you did not recieve the file with this program, please email
 * Tim Chas <darkuranium@gmail.com>.
 */
module siege.core.entity;

import std.stdio;
import siege.audio.source;
import siege.graphics.sprite;
import siege.graphics.mask;
import siege.physics._body;
import siege.physics.collision;
import siege.util.angles;
import siege.c.common;
import siege.c.siege;
import siege.c.core.entity;
import siege.c.physics.collision;


class Entity
{
    this()
    {
        this(0.0);
    }

    this(float priority)
    {
        mHandle = sgEntityCreate(priority);
        prepareHandle();
    }

    ~this()
    {
        destroy();
    }

    void destroy()
    {
        if (mHandle) {
            sgEntityDestroy(mHandle);
            mHandle = null;
        }
    }

    void draw()
    {
        sgEntityDraw(handle);
    }

    bool cbInside(float, float) { return false; }
    void lcDestroy() {}
    void lcMouseEnter() {}
    void lcMouseExit() {}
    void lcMouseButton(uint i) {}
    void lcMouseButtonPress(uint i) {}
    void lcMouseButtonRelease(uint i) {}
    void lcMouseButtonLeft() {}
    void lcMouseButtonLeftPress() {}
    void lcMouseButtonLeftRelease() {}
    void lcMouseButtonRight() {}
    void lcMouseButtonRightPress() {}
    void lcMouseButtonRightRelease() {}
    void lcMouseButtonMiddle() {}
    void lcMouseButtonMiddlePress() {}
    void lcMouseButtonMiddleRelease() {}
    void lcMouseMove(int x, int y) {}
    void lcMouseWheel(int i) {}
    void lcCollision(Entity e, PhysicsCollision c) {}
    void lcCollisionOne(Entity e, PhysicsCollision c) {}
    void lcCollisionTwo(Entity e, PhysicsCollision c) {}
    void lcCollisionBegin(Entity e, PhysicsCollision c) {}
    void lcCollisionOneBegin(Entity e, PhysicsCollision c) {}
    void lcCollisionTwoBegin(Entity e, PhysicsCollision c) {}
    void lcCollisionEnd(Entity e, PhysicsCollision c) {}
    void lcCollisionOneEnd(Entity e, PhysicsCollision c) {}
    void lcCollisionTwoEnd(Entity e, PhysicsCollision c) {}
    void evStart() {}
    void evExit() {}
    void evTick() {}
    void evTickBegin() {}
    void evTickEnd() {}
    void evInit() {}
    void evDeinit() {}
    void evDraw() { if (visible) draw(); }
    void evWindowOpen() {}
    void evWindowClose() {}
    void evWindowResize(uint width, uint height) {}
    void evMouseButton(uint i) {}
    void evMouseButtonPress(uint i) {}
    void evMouseButtonRelease(uint i) {}
    void evMouseButtonLeft() {}
    void evMouseButtonLeftPress() {}
    void evMouseButtonLeftRelease() {}
    void evMouseButtonRight() {}
    void evMouseButtonRightPress() {}
    void evMouseButtonRightRelease() {}
    void evMouseButtonMiddle() {}
    void evMouseButtonMiddlePress() {}
    void evMouseButtonMiddleRelease() {}
    void evMouseMove(int x, int y) {}
    void evMouseWheel(int i) {}
    void evKeyboardKey(uint i) {}
    void evKeyboardKeyPress(uint i) {}
    void evKeyboardKeyRelease(uint i) {}
    void evKeyboardKeyRepeat(uint i) {}
    void evKeyboardCharPress(dchar c) {}
    void evKeyboardCharRepeat(dchar c) {}
    void evJoystickButton(uint, uint) {}
    void evJoystickButtonPress(uint, uint) {}
    void evJoystickButtonRelease(uint, uint) {}
    void evJoystickMove(uint joy, float[] axis) {}
    void evLevelStart() {}
    void evLevelEnd() {}

    @property {
        SGEntity* handle()
        {
            assert(mHandle);
            return mHandle;
        }

        void sprite(Sprite val)
        {
            sgEntitySetSprite(handle, val.handle);
            mSprite = val;
        }

        Sprite sprite()
        {
            return mSprite;
        }

        void source(Source val)
        {
            sgEntitySetAudioSource(handle, val.handle);
            mSource = val;
        }

        Source source()
        {
            return mSource;
        }

        void mask(Mask val)
        {
            sgEntitySetMask(handle, val.handle);
            mMask = val;
        }

        Mask mask()
        {
            return mMask;
        }

        void physicsBody(Body val)
        {
            sgEntitySetPhysicsBody(handle, val.handle);
            mBody = val;
        }

        Body physicsBody()
        {
            return mBody;
        }

        void angle(Degrees ang)
        {
            sgEntitySetAngleDegs(handle, ang);
        }

        void angle(Radians ang)
        {
            sgEntitySetAngleRads(handle, ang);
        }

        float degrees()
        {
            return sgEntityGetAngleDegs(handle);
        }

        float radians()
        {
            return sgEntityGetAngleRads(handle);
        }

        float depth()
        {
            return sgEntityGetDepth(handle);
        }

        void depth(float val)
        {
            sgEntitySetDepth(handle, val);
        }

        float x()
        {
            return sgEntityGetPosX(handle);
        }

        void x(float val)
        {
            sgEntitySetPosX(handle, val);
        }

        float y()
        {
            return sgEntityGetPosY(handle);
        }

        void y(float val)
        {
            sgEntitySetPosY(handle, val);
        }

        bool active() { return handle.active; }
        void active(bool val) { handle.active = val; }
        bool pausable() { return handle.pausable; }
        void pausable(bool val) { handle.pausable = val; }
        bool minside() { return handle.minside; }
        void minside(bool val) { handle.minside = val; }
        bool visible() { return handle.visible; }
        void visible(bool val) { handle.visible = val; }
    }

    void setPos(float x, float y)
    {
        sgEntitySetPos(handle, x, y);
    }

    void getPos(out float x, out float y)
    {
        sgEntityGetPos(handle, &x, &y);
    }

    protected void prepareHandle()
    {
        handle.data = cast(void*) this;
        handle.cbInside = &ccbInside;
        handle.lcDestroy = &clcDestroy;
        handle.lcMouseEnter = &clcMouseEnter;
        handle.lcMouseExit = &clcMouseExit;
        handle.lcMouseButton = &clcMouseButton;
        handle.lcMouseButtonPress = &clcMouseButtonPress;
        handle.lcMouseButtonRelease = &clcMouseButtonRelease;
        handle.lcMouseButtonLeft = &clcMouseButtonLeft;
        handle.lcMouseButtonLeftPress = &clcMouseButtonLeftPress;
        handle.lcMouseButtonLeftRelease = &clcMouseButtonLeftRelease;
        handle.lcMouseButtonRight = &clcMouseButtonRight;
        handle.lcMouseButtonRightPress = &clcMouseButtonRightPress;
        handle.lcMouseButtonRightRelease = &clcMouseButtonRightRelease;
        handle.lcMouseButtonMiddle = &clcMouseButtonMiddle;
        handle.lcMouseButtonMiddlePress = &clcMouseButtonMiddlePress;
        handle.lcMouseButtonMiddleRelease = &clcMouseButtonMiddleRelease;
        handle.lcMouseMove = &clcMouseMove;
        handle.lcMouseWheel = &clcMouseWheel;
        handle.lcCollision = &clcCollision;
        handle.lcCollisionOne = &clcCollisionOne;
        handle.lcCollisionTwo = &clcCollisionTwo;
        handle.lcCollisionBegin = &clcCollisionBegin;
        handle.lcCollisionOneBegin = &clcCollisionOneBegin;
        handle.lcCollisionTwoBegin = &clcCollisionTwoBegin;
        handle.lcCollisionEnd = &clcCollisionEnd;
        handle.lcCollisionOneEnd = &clcCollisionOneEnd;
        handle.lcCollisionTwoEnd = &clcCollisionTwoEnd;
        handle.evInit = &cevInit;
        handle.evInit = &cevInit;
        handle.evInit = &cevInit;
        handle.evDeinit = &cevDeinit;
        handle.evStart = &cevStart;
        handle.evExit = &cevExit;
        handle.evTick = &cevTick;       
        handle.evTickBegin = &cevTickBegin; 
        handle.evTickEnd = &cevTickEnd; 
        handle.evDraw = &cevDraw; 
        handle.evWindowOpen = &cevWindowOpen;
        handle.evWindowClose = &cevWindowClose;
        handle.evWindowResize = &cevWindowResize;
        handle.evMouseButton = &cevMouseButton;
        handle.evMouseButtonPress = &cevMouseButtonPress;
        handle.evMouseButtonRelease = &cevMouseButtonRelease;
        handle.evMouseButtonLeft = &cevMouseButtonLeft;
        handle.evMouseButtonLeftPress = &cevMouseButtonLeftPress;
        handle.evMouseButtonLeftRelease = &cevMouseButtonLeftRelease;
        handle.evMouseButtonRight = &cevMouseButtonRight;
        handle.evMouseButtonRightPress = &cevMouseButtonRightPress;
        handle.evMouseButtonRightRelease = &cevMouseButtonRightRelease;
        handle.evMouseButtonMiddle = &cevMouseButtonMiddle;
        handle.evMouseButtonMiddlePress = &cevMouseButtonMiddlePress;
        handle.evMouseButtonMiddleRelease = &cevMouseButtonMiddleRelease;
        handle.evMouseMove = &cevMouseMove;
        handle.evMouseWheel = &cevMouseWheel;
        handle.evKeyboardKey = &cevKeyboardKey;
        handle.evKeyboardKeyPress = &cevKeyboardKeyPress;
        handle.evKeyboardKeyRelease = &cevKeyboardKeyRelease;
        handle.evKeyboardKeyRepeat = &cevKeyboardKeyRepeat;
        handle.evKeyboardCharPress = &cevKeyboardCharPress;
        handle.evKeyboardCharRepeat = &cevKeyboardCharRepeat;
        handle.evJoystickButton = &cevJoystickButton;
        handle.evJoystickButtonPress = &cevJoystickButtonPress;
        handle.evJoystickButtonRelease = &cevJoystickButtonRelease;
        handle.evJoystickMove = &cevJoystickMove;
        handle.evLevelStart = &cevLevelStart;
        handle.evLevelEnd = &cevLevelEnd;
    }

    protected SGEntity* mHandle;
    protected Sprite mSprite;
    protected Source mSource;
    protected Mask mMask;
    protected Body mBody;
}

mixin template BindFunction(alias FUNCTION_NAME)
{
    mixin(
    "extern (C) void c" ~ FUNCTION_NAME ~ "(SGEntity* centity) {"
        "auto entity = cast(Entity) centity.data;"
        "assert(entity !is null);" 
        "entity." ~ FUNCTION_NAME ~ "();"
    "}"
    );
}

mixin template BindFunctionui(alias FUNCTION_NAME)
{
    mixin("extern (C) void c" ~ FUNCTION_NAME ~ "(SGEntity* centity, uint i) {"
        q{auto entity = cast(Entity) centity.data;
        assert(entity !is null);
        } ~ 
        "entity." ~ FUNCTION_NAME ~ "(i);}");
}

mixin template BindFunctioni(alias FUNCTION_NAME)
{
    mixin("extern (C) void c" ~ FUNCTION_NAME ~ "(SGEntity* centity, int i) {"
        q{auto entity = cast(Entity) centity.data;
        assert(entity !is null);
        } ~ 
        "entity." ~ FUNCTION_NAME ~ "(i);}");
}

mixin template BindFunctiond(alias FUNCTION_NAME)
{
    mixin("extern (C) void c" ~ FUNCTION_NAME ~ "(SGEntity* centity, dchar i) {"
        q{auto entity = cast(Entity) centity.data;
        assert(entity !is null);
        } ~ 
        "entity." ~ FUNCTION_NAME ~ "(i);}");
}

mixin template BindFunctionuiui(alias FUNCTION_NAME)
{
    mixin("extern (C) void c" ~ FUNCTION_NAME ~ "(SGEntity* centity, uint i, uint j) {"
        q{auto entity = cast(Entity) centity.data;
        assert(entity !is null);
        } ~ 
        "entity." ~ FUNCTION_NAME ~ "(i, j);}");
}

mixin template BindFunctionii(alias FUNCTION_NAME)
{
    mixin("extern (C) void c" ~ FUNCTION_NAME ~ "(SGEntity* centity, int i, int j) {"
        q{auto entity = cast(Entity) centity.data;
        assert(entity !is null);
        } ~ 
        "entity." ~ FUNCTION_NAME ~ "(i, j);}");
}

mixin template BindCollisionFunction(alias FUNCTION_NAME)
{
    mixin("extern (C) void c" ~ FUNCTION_NAME ~ "(SGEntity* centity, SGEntity* centity2, SGPhysicsCollision* c) {"
        q{auto entity = cast(Entity) centity.data;
        auto entity2 = cast(Entity) centity2.data;
        auto collision = new PhysicsCollision(c);
        assert(entity !is null && entity2 !is null);
        } ~ 
        "entity." ~ FUNCTION_NAME ~ "(entity2, collision);}");
}

mixin BindFunction!"lcMouseEnter";
mixin BindFunction!"lcMouseExit";
mixin BindFunctionui!"lcMouseButton";
mixin BindFunctionui!"lcMouseButtonPress";
mixin BindFunctionui!"lcMouseButtonRelease";
mixin BindFunction!"lcMouseButtonLeft";
mixin BindFunction!"lcMouseButtonLeftPress";
mixin BindFunction!"lcMouseButtonLeftRelease";
mixin BindFunction!"lcMouseButtonRight";
mixin BindFunction!"lcMouseButtonRightPress";
mixin BindFunction!"lcMouseButtonRightRelease";
mixin BindFunction!"lcMouseButtonMiddle";
mixin BindFunction!"lcMouseButtonMiddlePress";
mixin BindFunction!"lcMouseButtonMiddleRelease";
mixin BindFunctionii!"lcMouseMove";
mixin BindFunctioni!"lcMouseWheel";
mixin BindCollisionFunction!"lcCollision";
mixin BindCollisionFunction!"lcCollisionOne";
mixin BindCollisionFunction!"lcCollisionTwo";
mixin BindCollisionFunction!"lcCollisionBegin";
mixin BindCollisionFunction!"lcCollisionOneBegin";
mixin BindCollisionFunction!"lcCollisionTwoBegin";
mixin BindCollisionFunction!"lcCollisionEnd";
mixin BindCollisionFunction!"lcCollisionOneEnd";
mixin BindCollisionFunction!"lcCollisionTwoEnd";
mixin BindFunction!"evInit";
mixin BindFunction!"evDeinit";
mixin BindFunction!"evStart";
mixin BindFunction!"evExit";
mixin BindFunction!"evTick";
mixin BindFunction!"evTickBegin";
mixin BindFunction!"evTickEnd";
mixin BindFunction!"evDraw";
mixin BindFunction!"evWindowOpen";
mixin BindFunction!"evWindowClose";
mixin BindFunctionuiui!"evWindowResize";
mixin BindFunctionui!"evMouseButton";
mixin BindFunctionui!"evMouseButtonPress";
mixin BindFunctionui!"evMouseButtonRelease";
mixin BindFunction!"evMouseButtonLeft";
mixin BindFunction!"evMouseButtonLeftPress";
mixin BindFunction!"evMouseButtonLeftRelease";
mixin BindFunction!"evMouseButtonRight";
mixin BindFunction!"evMouseButtonRightPress";
mixin BindFunction!"evMouseButtonRightRelease";
mixin BindFunction!"evMouseButtonMiddle";
mixin BindFunction!"evMouseButtonMiddlePress";
mixin BindFunction!"evMouseButtonMiddleRelease";
mixin BindFunctionii!"evMouseMove";
mixin BindFunctioni!"evMouseWheel";
mixin BindFunctionui!"evKeyboardKey";
mixin BindFunctionui!"evKeyboardKeyPress";
mixin BindFunctionui!"evKeyboardKeyRelease";
mixin BindFunctionui!"evKeyboardKeyRepeat";
mixin BindFunctiond!"evKeyboardCharPress";
mixin BindFunctiond!"evKeyboardCharRepeat";
mixin BindFunctionuiui!"evJoystickButton";
mixin BindFunctionuiui!"evJoystickButtonPress";
mixin BindFunctionuiui!"evJoystickButtonRelease";
mixin BindFunction!"evLevelStart";
mixin BindFunction!"evLevelEnd";

extern (C) {
    void clcDestroy(SGEntity* centity)
    {
        auto entity = cast(Entity) centity.data;
        assert(entity !is null);
        entity.lcDestroy();
        entity.mHandle = null;
    }

    bool ccbInside(SGEntity* centity, float x, float y)
    {
        auto entity = cast(Entity) centity.data;
        assert(entity !is null);
        return entity.cbInside(x, y);
    }

    void cevJoystickMove(SGEntity* centity, uint joy, float* axis, size_t axislen)
    {
        auto entity = cast(Entity) centity.data;
        assert(entity !is null);
        entity.evJoystickMove(joy, axis[0 .. axislen]);
    }
}

