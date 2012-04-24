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
module siege.c.physics.constraint;
extern (C):

import siege.c.common;

struct SGPhysicsConstraint
{
    void* handle;
}

void sgPhysicsConstraintDestroy(SGPhysicsConstraint* constraint);

