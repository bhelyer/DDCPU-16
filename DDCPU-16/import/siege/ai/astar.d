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
module siege.ai.astar;

import siege.c.ai.astar;


class Node
{
    SGAStarNode* handle;
    void* data;  // user data
    
    this()
    {
        handle = sgAStarNodeCreate(null);
        assert(handle);
        handle.data = cast(void*) this;
    }

    this(SGAStarNode* node)
    {
        handle = node;
        handle.data = cast(void*) this;
    }
    
    ~this()
    {
        sgAStarNodeDestroy(handle);
    }
    
    void link(Node target)
    {
        sgAStarNodeLink(handle, target.handle);
    }
    
    void doubleLink(Node target)
    {
        sgAStarNodeDLink(handle, target.handle);
    }
    
    void unlink(Node target)
    {
        sgAStarNodeUnlink(handle, target.handle);
    }
    
    void doubleUnlink(Node target)
    {
        sgAStarNodeDUnlink(handle, target.handle);
    }
    
    float g(Node target)
    {
        return float.nan;
    }
    
    float h(Node target)
    {
        return float.nan;
    }
    
    bool isGoal(Node target)
    {
        return false;
    }
}

private extern (C) float _g(SGAStarNode* _a, SGAStarNode* _b)
{
    auto a = cast(Node) _a.data;
    assert(a);
    auto b = cast(Node) _b.data;
    assert(b);
    return a.g(b);
}

private extern (C) float _h(SGAStarNode* _a, SGAStarNode* _b)
{
    auto a = cast(Node) _a.data;
    assert(a);
    auto b = cast(Node) _b.data;
    assert(b);
    return a.h(b);
}

private extern (C) bool _goal(SGAStarNode* _a, SGAStarNode* _b)
{
    auto a = cast(Node) _a.data;
    assert(a);
    auto b = cast(Node) _b.data;
    assert(b);
    return a.isGoal(b);
}

class Search
{
    SGAStar* handle;
    
    this(Node start, Node goal)
    {
        handle = sgAStarCreate(start.handle, goal.handle, &_g, &_h, &_goal);
        assert(handle);
    } 
    
    ~this()
    {
        sgAStarDestroy(handle);
    }
    
    bool step()
    {
        return sgAStarStep(handle);
    }
    
    bool goalFound()
    {
        return sgAStarGoalFound(handle);
    }
    
    Node[] path()
    {
        uint pathLength;
        auto list = sgAStarPath(handle, &pathLength);
        auto pathList = new Node[pathLength];
        auto current = list.first;
        size_t i = 0;
        while (current !is null) {
            auto cnode = cast(SGAStarNode*) current.item;
            assert(cnode);
            auto node = cast(Node) cnode.data;
            assert(node !is null);
            pathList[i] = node;
            i++;
        }
        return pathList;
    }
}
