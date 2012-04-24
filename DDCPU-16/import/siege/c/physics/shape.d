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
module siege.c.physics.shape;
extern (C):

import siege.c.common;
import siege.c.physics._body;

struct SGPhysicsShape
{
    void* handle;
    SGPhysicsBody* _body;
    void* data;

    SGenum type;

    float x;
    float y;
    size_t numverts;
    float* verts;
}

SGPhysicsShape* sgPhysicsShapeCreate(SGPhysicsBody* _body, SGenum type);
SGPhysicsShape* sgPhysicsShapeCreateSegment(SGPhysicsBody* _body, float x1, float y1, float x2, float y2, float width);
SGPhysicsShape* sgPhysicsShapeCreatePoly(SGPhysicsBody* _body, float x, float y, float* verts, size_t numverts);
SGPhysicsShape* sgPhysicsShapeCreateCircle(SGPhysicsBody* _body, float x, float y, float r1, float r2);
void sgPhysicsShapeDestroy(SGPhysicsShape* shape);

void sgPhysicsShapeSetGroup(SGPhysicsShape* shape, SGuint group);
SGuint sgPhysicsShapeGetGroup(SGPhysicsShape* shape);
void sgPhysicsShapeSetFriction(SGPhysicsShape* shape, float friction);
float sgPhysicsShapeGetFriction(SGPhysicsShape* shape);
void sgPhysicsShapeSetRestitution(SGPhysicsShape* shape, float restitution);
float sgPhysicsShapeGetRestitution(SGPhysicsShape* shape);
void sgPhysicsShapeSetData(SGPhysicsShape* shape, void* data);
void* sgPhysicsShapeGetData(SGPhysicsShape* shape);

float sgPhysicsShapeGetAreaS(SGPhysicsShape* shape);
float sgPhysicsShapeGetAreaU(SGPhysicsShape* shape);
float sgPhysicsShapeGetMass(SGPhysicsShape* shape, float density);
float sgPhysicsShapeGetMomentMass(SGPhysicsShape* shape, float mass);
float sgPhysicsShapeGetMomentDensity(SGPhysicsShape* shape, float density);

void sgPhysicsShapeGetBBox(SGPhysicsShape* shape, float* t, float* l, float* b, float* r);
void sgPhysicsShapeDrawDBG(SGPhysicsShape* shape);
