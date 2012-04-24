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
module siege.c.graphics.surface;
extern (C):

import siege.c.common;

struct SGSurface
{
	void* handle;
}

SGbool _sgSurfaceInit();
SGbool _sgSurfaceDeinit();

SGSurface* sgSurfaceCreateFile(const char* fname);
SGSurface* sgSurfaceCreateData(SGuint width, SGuint height, SGenum bpp, void* data);
SGSurface* sgSurfaceCreate(SGuint width, SGuint height, SGenum bpp);
void sgSurfaceDestroy(SGSurface* surface);

void sgSurfaceDrawRads3f2f2f1f(SGSurface* surface, float x, float y, float z, float xscale, float yscale, float xoffset, float yoffset, float angle);
void sgSurfaceDrawDegs3f2f2f1f(SGSurface* surface, float x, float y, float z, float xscale, float yscale, float xoffset, float yoffset, float angle);
void sgSurfaceDrawRads2f2f2f1f(SGSurface* surface, float x, float y, float xscale, float yscale, float xoffset, float yoffset, float angle);
void sgSurfaceDrawDegs2f2f2f1f(SGSurface* surface, float x, float y, float xscale, float yscale, float xoffset, float yoffset, float angle);
void sgSurfaceDrawRads3f2f1f(SGSurface* surface, float x, float y, float z, float xscale, float yscale, float angle);
void sgSurfaceDrawDegs3f2f1f(SGSurface* surface, float x, float y, float z, float xscale, float yscale, float angle);
void sgSurfaceDrawRads2f2f1f(SGSurface* surface, float x, float y, float xscale, float yscale, float angle);
void sgSurfaceDrawDegs2f2f1f(SGSurface* surface, float x, float y, float xscale, float yscale, float angle);
void sgSurfaceDrawRads3f1f(SGSurface* surface, float x, float y, float z, float angle);
void sgSurfaceDrawDegs3f1f(SGSurface* surface, float x, float y, float z, float angle);
void sgSurfaceDrawRads2f1f(SGSurface* surface, float x, float y, float angle);
void sgSurfaceDrawDegs2f1f(SGSurface* surface, float x, float y, float angle);
void sgSurfaceDraw3f2f2f(SGSurface* surface, float x, float y, float z, float xscale, float yscale, float xoffset, float yoffset);
void sgSurfaceDraw2f2f2f(SGSurface* surface, float x, float y, float xscale, float yscale, float xoffset, float yoffset);
void sgSurfaceDraw3f2f(SGSurface* surface, float x, float y, float z, float xscale, float yscale);
void sgSurfaceDraw2f2f(SGSurface* surface, float x, float y, float xscale, float yscale);
void sgSurfaceDraw3f(SGSurface* surface, float x, float y, float z);
void sgSurfaceDraw2f(SGSurface* surface, float x, float y);
void sgSurfaceDraw(SGSurface* surface);

void sgSurfaceTarget(SGSurface* surface);
void sgSurfaceUntarget(SGSurface* surface);
void sgSurfaceClear4f(SGSurface* surface, float r, float g, float b, float a);
void sgSurfaceClear3f(SGSurface* surface, float r, float g, float b);
void sgSurfaceClear2f(SGSurface* surface, float g, float a);
void sgSurfaceClear1f(SGSurface* surface, float g);
void sgSurfaceClear4ub(SGSurface* surface, SGubyte r, SGubyte g, SGubyte b, SGubyte a);
void sgSurfaceClear3ub(SGSurface* surface, SGubyte r, SGubyte g, SGubyte b);
void sgSurfaceClear2ub(SGSurface* surface, SGubyte g, SGubyte a);
void sgSurfaceClear1ub(SGSurface* surface, SGubyte g);
void sgSurfaceClear(SGSurface* surface);

void sgSurfaceGetSize(SGSurface* surface, SGuint* width, SGuint* height);
SGuint sgSurfaceGetWidth(SGSurface* surface);
SGuint sgSurfaceGetHeight(SGSurface* surface);

