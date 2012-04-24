module siege.physics._body;

import siege.physics.space;
import siege.util.angles;
import siege.c.common;
import siege.c.physics._body;


enum BodyType
{
    Passive = SG_PHYSICS_BODY_PASSIVE,
    Normal = SG_PHYSICS_BODY_NORMAL,
    Semistatic = SG_PHYSICS_BODY_SEMISTATIC,
    Static = SG_PHYSICS_BODY_STATIC
}

class Body
{
    SGPhysicsBody* handle;

    this(Space space, BodyType type)
    {
        if (space !is null) handle = sgPhysicsBodyCreate(space.handle, type);
        else handle = sgPhysicsBodyCreate(null, type);
        assert(handle);
    }

    ~this()
    {
        sgPhysicsBodyDestroy(handle);
    }

    void setPos(float x, float y)
    {
        sgPhysicsBodySetPos(handle, x, y);
    }

    void getPos(out float x, out float y)
    {
        sgPhysicsBodyGetPos(handle, &x, &y);
    }

    void setVelocity(float x, float y)
    {
        sgPhysicsBodySetVel(handle, x, y);
    }

    void getVelocity(out float x, out float y)
    {
        sgPhysicsBodyGetVel(handle, &x, &y);
    }

    void applyImpulse(float jx, float jy, float rx, float ry)
    {
        sgPhysicsBodyApplyImpulse(handle, jx, jy, rx, ry);
    }

    void applyForce(float jx, float jy, float rx, float ry)
    {
        sgPhysicsBodyApplyForce(handle, jx, jy, rx, ry);
    }

    @property {
        bool sleeping() { return sgPhysicsBodyGetSleeping(handle); }
        void sleeping(bool val) { sgPhysicsBodySetSleeping(handle, val); }

        float x() { return sgPhysicsBodyGetPosX(handle); }
        void x(float val) { sgPhysicsBodySetPosX(handle, val); }

        float y() { return sgPhysicsBodyGetPosY(handle); }
        void y(float val) { sgPhysicsBodySetPosY(handle, val); }

        void angle(Degrees val) { sgPhysicsBodySetAngleDegs(handle, val); }
        void angle(Radians val) { sgPhysicsBodySetAngleRads(handle, val); }
        float angleDegrees() { return sgPhysicsBodyGetAngleDegs(handle); }
        float angleRadians() { return sgPhysicsBodyGetAngleRads(handle); }

        float xVelocity() { return sgPhysicsBodyGetVelX(handle); }
        void xVelocity(float val) { sgPhysicsBodySetVelX(handle, val); }
        float yVelocity() { return sgPhysicsBodyGetVelY(handle); }
        void yVelocity(float val) { sgPhysicsBodySetVelY(handle, val); }

        float angleVelocityDegrees() { return sgPhysicsBodyGetAngVelDegs(handle); }
        float angleVelocityRadians() { return sgPhysicsBodyGetAngVelRads(handle); }
        void angleVelocity(Degrees val) { sgPhysicsBodySetAngVelDegs(handle, val); }
        void angleVelocity(Radians val) { sgPhysicsBodySetAngVelRads(handle, val); }

        float mass() { return sgPhysicsBodyGetMass(handle); }
        void mass(float val) { sgPhysicsBodySetMass(handle, val); }

        float moment() { return sgPhysicsBodyGetMoment(handle); }
        void moment(float val) { sgPhysicsBodySetMoment(handle, val); }
    }
}

