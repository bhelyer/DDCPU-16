module siege.physics.shape;

import std.stdio;
import siege.physics._body;
import siege.c.common;
import siege.c.physics.shape;


enum ShapeType
{
    Segment = SG_PHYSICS_SHAPE_SEGMENT,
    Polygon = SG_PHYSICS_SHAPE_POLYGON,
    Circle  = SG_PHYSICS_SHAPE_CIRCLE
}

class Shape
{
    SGPhysicsShape* handle;

    this() {}
    this(SGPhysicsShape* handle)
    {
        this.handle = handle;
    }

    @property void group(uint g)
    {
        sgPhysicsShapeSetGroup(handle, g);
    }

    @property uint group()
    {
        return sgPhysicsShapeGetGroup(handle);
    }

    @property void friction(float f)
    {
        sgPhysicsShapeSetFriction(handle, f);
    }

    @property float friction()
    {
        return sgPhysicsShapeGetFriction(handle);
    }

    @property void restitution(float r)
    {
        sgPhysicsShapeSetRestitution(handle, r);
    }

    @property float restitution()
    {
        return sgPhysicsShapeGetRestitution(handle);
    }

    @property float areaS()
    {
        return sgPhysicsShapeGetAreaS(handle);
    }

    @property float areaU()
    {
        return sgPhysicsShapeGetAreaU(handle);
    }

    float mass(float density)
    {
        return sgPhysicsShapeGetMass(handle, density);
    }

    float momentMass(float mass)
    {
        return sgPhysicsShapeGetMomentMass(handle, mass);
    }

    float momentDensity(float density)
    {
        return sgPhysicsShapeGetMomentDensity(handle, density);
    }

    void getBoundingBox(out float t, out float l, out float b, out float r)
    {
        sgPhysicsShapeGetBBox(handle, &t, &l, &b, &r);
    }

    void drawDBG()
    {
        sgPhysicsShapeDrawDBG(handle);
    }
}

class Segment : Shape
{
    this(Body _body, float x1, float y1, float x2, float y2, float width)
    {
        handle = sgPhysicsShapeCreateSegment(_body.handle, x1, y1, x2, y2, width);
        assert(handle);
    }

    ~this()
    {
        sgPhysicsShapeDestroy(handle);
    }
}

class Poly : Shape
{
    this(Body _body, float x, float y, float[] verts)
    {
        handle = sgPhysicsShapeCreatePoly(_body.handle, x, y, verts.ptr, verts.length / 2);
        assert(handle);
    }

    ~this()
    {
        sgPhysicsShapeDestroy(handle);
    }
}

class Circle : Shape
{
    this(Body _body, float x, float y, float r1, float r2)
    {
        handle = sgPhysicsShapeCreateCircle(_body.handle, x, y, r1, r2);
        assert(handle);
    }

    ~this()
    {
        sgPhysicsShapeDestroy(handle);
    }
}

