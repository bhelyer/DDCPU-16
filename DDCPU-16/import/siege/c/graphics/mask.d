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
/**
 * \file siege/graphics/mask.h
 * \brief Collision masks
 */
module siege.c.graphics.mask;
extern (C):

import siege.c.common;
import siege.c.graphics.sprite;
import siege.c.graphics.texture;

/**
 * \todo Add a bounding box.
 */
struct SGMask
{
	SGuint width;
	SGuint height;

	SGint xoffset;
	SGint yoffset;

	SGbool precise;
	SGbool** field;
}

SGMask* sgMaskCreateSprite(SGSprite* sprite);
SGMask* sgMaskCreateTexture2i(SGTexture* texture, SGint xoffset, SGint yoffset);
SGMask* sgMaskCreateTexture(SGTexture* texture);
SGMask* sgMaskCreateFile2i(const char* fname, SGint xoffset, SGint yoffset);
SGMask* sgMaskCreateFile(const char* fname);
void sgMaskDestroy(SGMask* mask);

/**
 * \brief Check the collision between two masks
 * 
 * \param m1 The first mask to test
 * \param x1 First mask's x position
 * \param y1 First mask's y position
 * \param m2 The second mask to test
 * \param x2 Second mask's x position
 * \param y2 Second mask's y position
 * 
 * \return SG_TRUE if the masks collide, SG_FALSE otherwise.
 *
 * \todo Test whether this works or not
 * \todo Use the \c precise field
 * \todo Use bounding box info once BB's are added
 */
SGbool sgMaskCheckCollision(SGMask* m1, SGint x1, SGint y1, SGMask* m2, SGint x2, SGint y2);

void sgMaskGetSize(SGMask* mask, SGuint* width, SGuint* height);
SGuint sgMaskGetWidth(SGMask* mask);
SGuint sgMaskGetHeight(SGMask* mask);

/**
 * \brief A function used for debugging the mask
 * 
 * \warning This draws the mask pixel-for-pixel and is <em>slow</em>!
 * \warning This function may be removed in the future!
 * 
 * \todo sg[Sprite|Texture|Surface]CreateMask(SGMask* mask)
 */
void sgMaskDrawDBG(SGMask* mask, SGint x, SGint y, SGbool transparent);

