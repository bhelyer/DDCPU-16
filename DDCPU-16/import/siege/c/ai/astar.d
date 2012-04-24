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
module siege.c.ai.astar;
extern (C):

import siege.c.common;
import siege.c.util.list;

alias float function(SGAStarNode*, SGAStarNode*) SGAStarScore;
alias SGbool function(SGAStarNode*, SGAStarNode*) SGAStarIsGoal;

struct SGAStarNode
{
	SGAStarNode* from;
	SGList* links;
	void* data; // userdata

	struct _score
	{
		float g;
		float h;
		float f;
	} 
    _score score;
}

struct SGAStar
{
	struct _set
	{
		SGList* open;
		SGList* closed;
	}
    _set set;
	SGList* path;
	SGAStarNode* current;
	SGAStarNode* goal;
	SGbool gfound;

	struct _cb
	{
		SGAStarScore g;
		SGAStarScore h;
		SGAStarIsGoal isgoal;
	}
    _cb cb;
}

SGAStar* sgAStarCreate(SGAStarNode* start, SGAStarNode* goal, SGAStarScore g, SGAStarScore h, SGAStarIsGoal isgoal);
void sgAStarDestroy(SGAStar* search);
SGbool sgAStarStep(SGAStar* search);
SGbool sgAStarGoalFound(SGAStar* search);
SGList* sgAStarPath(SGAStar* search, SGuint* pathlen); // reconstruct the path from the current node to the start; current node need not be the goal

SGAStarNode* sgAStarNodeCreate(void* data);
void sgAStarNodeDestroy(SGAStarNode* node);
void sgAStarNodeLink(SGAStarNode* from, SGAStarNode* to);
void sgAStarNodeDLink(SGAStarNode* one, SGAStarNode* two);
void sgAStarNodeUnlink(SGAStarNode* from, SGAStarNode* to);
void sgAStarNodeDUnlink(SGAStarNode* one, SGAStarNode* two);

