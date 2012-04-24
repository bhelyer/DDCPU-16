module siege.ai.grid;

import siege.ai.astar;
import siege.util.list;
import siege.c.ai.grid;

alias SGNavGridData NavGridData;

enum GridType
{
    Clear = SG_NAVGRID_CLEAR,
    Wall = SG_NAVGRID_WALL,
    Start = SG_NAVGRID_START,
    Goal = SG_NAVGRID_GOAL,
}

class NavGrid
{
    SGNavGrid* handle;

    this(uint width, uint height, bool diag, bool wdiag)
    {
        handle = sgNavGridCreate(width, height, diag, wdiag);
    }

    ~this()
    {
        sgNavGridDestroy(handle);
    }

    Node getNode(uint x, uint y)
    {
        return new Node(sgNavGridGetNode(handle, x, y));
    }

    NavGridData* getData(uint x, uint y)
    {
        return sgNavGridGetData(handle, x, y);
    }

    void addClear(uint x, uint y)
    {
        sgNavGridAddClear(handle, x, y);
    }

    void addWall(uint x, uint y)
    {
        sgNavGridAddWall(handle, x, y);
    }

    void addStart(uint x, uint y)
    {
        sgNavGridAddStart(handle, x, y);
    }

    void addGoal(uint x, uint y)
    {
        sgNavGridAddGoal(handle, x, y);
    }

    void searchCreate()
    {
        sgNavGridSearchCreate(handle);
    }

    bool searchStep()
    {
        return sgNavGridSearchStep(handle);
    }

    @property bool goalFound()
    {
        return sgNavGridGoalFound(handle);
    }

    List!(NavGridData*)* searchPath()
    {
        uint len;
        auto path = sgNavGridSearchPath(handle, &len);
        if (path) {
            auto list = new List!(NavGridData*)(path);
            list.length = len;
            return list;
        } else return null;
    }

    @property typeof(handle.width) width() { return handle.width; }
    @property typeof(handle.height) height() { return handle.height; }
}

