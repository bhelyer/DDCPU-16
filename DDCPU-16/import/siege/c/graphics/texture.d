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
module siege.c.graphics.texture;
extern (C):

import siege.c.common;

struct SGTexture
{
	void* handle;
}

SGTexture* sgTextureCreateFile(const char* fname);
SGTexture* sgTextureCreateData(SGuint width, SGuint height, SGenum bpp, void* data);
void sgTextureSetData(SGTexture* texture, size_t width, size_t height, SGenum bpp, void* data);
SGTexture* sgTextureCreate(SGuint width, SGuint height, SGenum bpp);
void sgTextureDestroy(SGTexture* texture);

void sgTextureDrawRads3f2f2f1f(SGTexture* texture, float x, float y, float z, float xscale, float yscale, float xoffset, float yoffset, float angle);
void sgTextureDrawDegs3f2f2f1f(SGTexture* texture, float x, float y, float z, float xscale, float yscale, float xoffset, float yoffset, float angle);
void sgTextureDrawRads2f2f2f1f(SGTexture* texture, float x, float y, float xscale, float yscale, float xoffset, float yoffset, float angle);
void sgTextureDrawDegs2f2f2f1f(SGTexture* texture, float x, float y, float xscale, float yscale, float xoffset, float yoffset, float angle);
void sgTextureDrawRads3f2f1f(SGTexture* texture, float x, float y, float z, float xscale, float yscale, float angle);
void sgTextureDrawDegs3f2f1f(SGTexture* texture, float x, float y, float z, float xscale, float yscale, float angle);
void sgTextureDrawRads2f2f1f(SGTexture* texture, float x, float y, float xscale, float yscale, float angle);
void sgTextureDrawDegs2f2f1f(SGTexture* texture, float x, float y, float xscale, float yscale, float angle);
void sgTextureDrawRads3f1f(SGTexture* texture, float x, float y, float z, float angle);
void sgTextureDrawDegs3f1f(SGTexture* texture, float x, float y, float z, float angle);
void sgTextureDrawRads2f1f(SGTexture* texture, float x, float y, float angle);
void sgTextureDrawDegs2f1f(SGTexture* texture, float x, float y, float angle);
void sgTextureDraw3f2f2f(SGTexture* texture, float x, float y, float z, float xscale, float yscale, float xoffset, float yoffset);
void sgTextureDraw2f2f2f(SGTexture* texture, float x, float y, float xscale, float yscale, float xoffset, float yoffset);
void sgTextureDraw3f2f(SGTexture* texture, float x, float y, float z, float xscale, float yscale);
void sgTextureDraw2f2f(SGTexture* texture, float x, float y, float xscale, float yscale);
void sgTextureDraw3f(SGTexture* texture, float x, float y, float z);
void sgTextureDraw2f(SGTexture* texture, float x, float y);
void sgTextureDraw(SGTexture* texture);

void sgTextureGetSize(SGTexture* texture, SGuint* width, SGuint* height);
SGuint sgTextureGetWidth(SGTexture* texture);
SGuint sgTextureGetHeight(SGTexture* texture);

