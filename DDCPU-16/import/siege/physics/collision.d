module siege.physics.collision;

import siege.physics.shape;
import siege.c.physics.collision;

class PhysicsCollision
{
    SGPhysicsCollision* handle;

    this(SGPhysicsCollision* collision)
    {
        handle = collision;
    }

    void ignore()
    {
        sgPhysicsCollisionIgnore(handle);
    }

    @property size_t numContacts()
    {
        return sgPhysicsCollisionGetNumContacts(handle);
    }

    void getPoint(size_t index, out float x, out float y)
    {
        sgPhysicsCollisionGetPoint(handle, index, &x, &y);
    }

    void getNormal(size_t index, out float x, out float y)
    {
        sgPhysicsCollisionGetNormal(handle, index, &x, &y);
    }

    float getDistance(size_t index)
    {
        return sgPhysicsCollisionGetDistance(handle, index);
    }

    void getImpulse(bool friction, out float x, out float y)
    {
        sgPhysicsCollisionGetImpulse(handle, &x, &y, friction);
    }

    @property Shape shapeOne()
    {
        return new Shape(sgPhysicsCollisionGetShapeOne(handle));
    }

    @property Shape shapeTwo()
    {
        return new Shape(sgPhysicsCollisionGetShapeTwo(handle));
    }
}

