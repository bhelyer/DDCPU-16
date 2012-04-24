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

module siege.c.graphics.draw;

import siege.c.common;
import siege.c.graphics.texture;
import siege.c.util.plist;

extern(C):


SGbool _sgDrawInit();
SGbool _sgDrawDeinit();

void sgDrawBeginT(SGenum type, SGTexture* texture);
void sgDrawBegin(SGenum type);
void sgDrawEnd();
void sgDrawColor4f(float r, float g, float b, float a);
void sgDrawColor3f(float r, float g, float b);
void sgDrawColor2f(float g, float a);
void sgDrawColor1f(float g);
void sgDrawColor4ub(SGubyte r, SGubyte g, SGubyte b, SGubyte a);
void sgDrawColor3ub(SGubyte r, SGubyte g, SGubyte b);
void sgDrawColor2ub(SGubyte g, SGubyte a);
void sgDrawColor1ub(SGubyte g);
void sgDrawColor4fv(float* rgba);
void sgDrawColor3fv(float* rgb);
void sgDrawColor2fv(float* ga);
void sgDrawColor1fv(float* g);
void sgDrawColor4ubv(SGubyte* rgba);
void sgDrawColor3ubv(SGubyte* rgb);
void sgDrawColor2ubv(SGubyte* ga);
void sgDrawColor1ubv(SGubyte* g);
void sgDrawTexCoord2f(float s, float t);
void sgDrawTexCoord2fv(float* st);
void sgDrawVertex3f(float x, float y, float z);
void sgDrawVertex2f(float x, float y);
void sgDrawVertex3fv(float* xyz);
void sgDrawVertex2fv(float* xy);
void sgDrawClear4f(float r, float g, float b, float a);
void sgDrawClear3f(float r, float g, float b);
void sgDrawClear2f(float g, float a);
void sgDrawClear1f(float g);
void sgDrawClear4fv(float* rgba);
void sgDrawClear3fv(float* rgb);
void sgDrawClear2fv(float* ga);
void sgDrawClear1fv(float* g);
void sgDrawClear4ub(SGubyte r, SGubyte g, SGubyte b, SGubyte a);
void sgDrawClear3ub(SGubyte r, SGubyte g, SGubyte b);
void sgDrawClear2ub(SGubyte g, SGubyte a);
void sgDrawClear1ub(SGubyte g);
void sgDrawClear4ubv(SGubyte* rgba);
void sgDrawClear3ubv(SGubyte* rgb);
void sgDrawClear2ubv(SGubyte* ga);
void sgDrawClear1ubv(SGubyte* g);
void sgDrawClear();

void sgDrawSetBlendFunc(SGenum src, SGenum dst);
void sgDrawSetBlendEquation(SGenum equation);
void sgDrawSetDepthTest(SGbool test);
void sgDrawSetSmooth(SGbool smooth);

void sgDrawPoint(float x, float y);
void sgDrawPointSetSize(float size);

void sgDrawLine(float x1, float y1, float x2, float y2);
void sgDrawLineSetWidth(float width);

void sgDrawTriangle(float x1, float y1, float x2, float y2, float x3, float y3, SGbool fill);

void sgDrawQuad(float x1, float y1, float x2, float y2, float x3, float y3, float x4, float y4, SGbool fill);

void sgDrawRectangle(float x1, float y1, float x2, float y2, SGbool fill);
void sgDrawRectangleWH(float x, float y, float w, float h, SGbool fill);

void sgDrawEllipse2R(float x, float y, float rx, float ry, SGbool fill);

void sgDrawCircle(float x, float y, float radius, SGbool fill);

void sgDrawEArcRads(float x, float y, float rx, float ry, float a1, float a2, SGbool ccw, SGbool fill);
void sgDrawEArcDegs(float x, float y, float rx, float ry, float a1, float a2, SGbool ccw, SGbool fill);

void sgDrawArcRads(float x, float y, float r, float a1, float a2, SGbool ccw, SGbool fill);
void sgDrawArcDegs(float x, float y, float r, float a1, float a2, SGbool ccw, SGbool fill);
