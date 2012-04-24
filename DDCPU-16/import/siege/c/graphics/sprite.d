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
module siege.c.graphics.sprite;
extern (C):

import siege.c.common;
import siege.c.core.entity;
import siege.c.graphics.texture;

struct SGSprite
{
    SGulong tick;

	float xoffset;
	float yoffset;
	SGbool extimages;
	SGuint numimages;
	SGTexture** subimages;
	float image;
	float speed;
}

void _sgSpriteEvTick(SGSprite* sprite);

SGSprite* sgSpriteCreateTexture2f(SGTexture* texture, float xoffset, float yoffset);
SGSprite* sgSpriteCreateTexture(SGTexture* texture);
SGSprite* sgSpriteCreateFile2f(const char* fname, float xoffset, float yoffset);
SGSprite* sgSpriteCreateFile(const char* fname);
void sgSpriteDestroy(SGSprite* sprite);

SGbool sgSpriteAddFrameFile(SGSprite*, const char*);
void sgSpriteSetImage(SGSprite*, float);
float sgSpriteGetImage(SGSprite*);
void sgSpriteSetSpeed(SGSprite*, float);
float sgSpriteGetSpeed(SGSprite*);

void sgSpriteDrawRads3f2f1f(SGSprite* sprite, float x, float y, float z, float xscale, float yscale, float angle);
void sgSpriteDrawDegs3f2f1f(SGSprite* sprite, float x, float y, float z, float xscale, float yscale, float angle);
void sgSpriteDrawRads2f2f1f(SGSprite* sprite, float x, float y, float xscale, float yscale, float angle);
void sgSpriteDrawDegs2f2f1f(SGSprite* sprite, float x, float y, float xscale, float yscale, float angle);
void sgSpriteDrawRads3f1f(SGSprite* sprite, float x, float y, float z, float angle);
void sgSpriteDrawDegs3f1f(SGSprite* sprite, float x, float y, float z, float angle);
void sgSpriteDrawRads2f1f(SGSprite* sprite, float x, float y, float angle);
void sgSpriteDrawDegs2f1f(SGSprite* sprite, float x, float y, float angle);
void sgSpriteDraw3f2f(SGSprite* sprite, float x, float y, float z, float xscale, float yscale);
void sgSpriteDraw2f2f(SGSprite* sprite, float x, float y, float xscale, float yscale);
void sgSpriteDraw3f(SGSprite* sprite, float x, float y, float z);
void sgSpriteDraw2f(SGSprite* sprite, float x, float y);

void sgSpriteGetSize(SGSprite* sprite, SGuint* width, SGuint* height);
SGuint sgSpriteGetWidth(SGSprite* sprite);
SGuint sgSpriteGetHeight(SGSprite* sprite);

