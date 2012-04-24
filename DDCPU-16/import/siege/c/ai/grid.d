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
module siege.c.ai.grid;
extern (C):

import siege.c.common;
import siege.c.ai.astar;
import siege.c.util.list;

enum SG_NAVGRID_CLEAR = 0;
enum SG_NAVGRID_WALL = 1;
enum SG_NAVGRID_START = 2;
enum SG_NAVGRID_GOAL = 3;

struct SGNavGridData
{
	SGuint x;
	SGuint y;
	SGenum type;
	float cost;
}

struct SGNavGrid
{
	SGAStar* search;
	SGAStarNode*** grid;
	SGuint width;
	SGuint height;

	SGList* path;
	SGAStarNode* start;
	SGAStarNode* goal;

	SGbool diag;
	SGbool wdiag;
}

float _sgNavGridG(SGAStarNode* from, SGAStarNode* to);
float _sgNavGridH(SGAStarNode* from, SGAStarNode* to);
SGbool _sgNavGridGoal(SGAStarNode* from, SGAStarNode* to);

SGNavGrid* sgNavGridCreate(SGuint width, SGuint height, SGbool diag, SGbool wdiag);
void sgNavGridDestroy(SGNavGrid* grid);
SGAStarNode* sgNavGridGetNode(SGNavGrid* grid, SGuint x, SGuint y);
SGNavGridData* sgNavGridGetData(SGNavGrid* grid, SGuint x, SGuint y);
void sgNavGridAddClear(SGNavGrid* grid, SGuint x, SGuint y);
void sgNavGridAddWall(SGNavGrid* grid, SGuint x, SGuint y);
void sgNavGridAddStart(SGNavGrid* grid, SGuint x, SGuint y);
void sgNavGridAddGoal(SGNavGrid* grid, SGuint x, SGuint y);
void sgNavGridSearchCreate(SGNavGrid* grid);
SGbool sgNavGridSearchStep(SGNavGrid* grid);
SGbool sgNavGridGoalFound(SGNavGrid* grid);
SGList* sgNavGridSearchPath(SGNavGrid* grid, SGuint* pathlen);

