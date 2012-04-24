module siege.physics.space;

import siege.c.physics.space;


class Space
{
    static Space getDefault()
    {
	    return new Space(sgPhysicsSpaceGetDefault());
    }

    SGPhysicsSpace* handle;

    this()
    {
        handle = sgPhysicsSpaceCreate();
        assert(handle);
        mDestroy = true;
    }

    this(SGPhysicsSpace* h)
    {
        handle = h;
    }   

    ~this()
    {
        if (mDestroy) {
            sgPhysicsSpaceDestroy(handle);        }
    }

    @property void step(float time)
    {
        sgPhysicsSpaceStep(handle, time);
    }

    @property void damping(float d)
    {
        sgPhysicsSpaceSetDamping(handle, d);
    }

    @property void iterations(uint i)
    {
	    sgPhysicsSpaceSetIterations(handle, i);
    }

    void setGravity(float x, float y)
    {
        sgPhysicsSpaceSetGravity(handle, x, y);
    }

    private bool mDestroy;
}
