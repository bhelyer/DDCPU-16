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
module siege.c.graphics.font; 
extern (C):
/**
 * \file siege/graphics/font.h
 * \brief Font handling.
 * \ingroup Graphics
 */
import core.vararg;

import siege.c.common;
import siege.c.graphics.texture;
import siege.c.util.conv;

enum SG_ALIGN_CENTER = 0x00;
enum SG_ALIGN_CENTRE = SG_ALIGN_CENTER;  // Because someday I'm gonna type it.
enum SG_ALIGN_LEFT = 0x01;
enum SG_ALIGN_RIGHT = 0x02;
enum SG_ALIGN_TOP = 0x10;
enum SG_ALIGN_BASELINE = 0x20;
enum SG_ALIGN_BOTTOM = 0x40;
enum SG_ALIGN_HMASK = 0x0F;
enum SG_ALIGN_VMASK = 0xF0;

/**
 * \brief Character info.
 * \private
 *
 * This is the character info which holds data such as datafield
 * width, height, character width, height, etc...
 */
struct SGCharInfo
{
	/**
	 * \brief Character's texture.
	 * 
	 * \todo
	 *	Should multiple characters be put into a single texture?
	 */
	SGTexture* texture;

	/**
	 * \name Actual size
	 */
	/// @{
	float width;
	float height;
	/// @}

	/**
	 * \name Bitmap size
	 */
	/// @{
	SGuint dwidth;
	SGuint dheight;
	/// @}
	
	/**
	 * \name Local offset
	 *
	 * This is not cumulative with other characters - thus,
	 * it does not affect the position of other characters.
	 */
	/// @{
	float xpre;
	float ypre;
	/// @}
	
	/**
	 * \name Global offset
	 *
	 * This \em is (unlike the local offset) cumulative with
	 * other characters and does affect their position.
	 */
	/// @{
	float xpost;
	float ypost;
	/// @}
}

/**
 * \brief Font info
 *
 * This buffer holds the info of a font, along
 * with the characters (both preloaded and not).
 */
struct SGFont
{
	/// @{
	/**
	 * \brief Internal handle
	 * \private
	 */
    void* handle;
    char* fname;	/// < Filename used to load the font
    float height;	/// < Height of the font
	/// @}

    SGConv*[4] conv;

	/**
	 * \name Preloaded characters
	 */
	/// @{
    SGuint numchars;	/// < The number of characters
    SGCharInfo* chars;	/// < The characters themselves
	/// @}

	/**
	 * \name On-demand loaded characters
	 */
	/// @{
    SGuint numcache;		/// < Length of the arrays
    SGdchar* cachechars;	/// < The character UTF-32 values (keys)
    SGCharInfo* cache;		/// < Character infos (values)
	/// @}
}

SGCharInfo* _sgFontFindCache(SGFont* font, SGdchar c);
SGbool _sgFontGetChars(SGFont* font, SGdchar* str, SGuint strlen, SGCharInfo* info);
void _sgFontToLoad(SGFont* font, SGdchar* input, SGuint inlen, SGdchar* output, SGuint* outlen);
SGbool _sgFontLoad(SGFont* font, SGdchar* chars, SGuint numchars, SGbool force);
SGubyte* _sgFontToRGBA(SGFont* font, SGubyte* data, SGuint datalen);
void _sgFontCenterOffsetU32(SGFont* font, float* x, float* y, const char* text);
SGdchar* _sgFontU16ToU32(SGFont*, const(SGwchar)*);
SGdchar* _sgFontU8ToU32(SGFont*, const(SGchar)*);
// sgFontWToU32 omitted because the size of wchar_t is quite variant.
SGdchar* _sgFontToU32(SGFont*, const(char)*);


SGFont* sgFontCreate(const char* fname, float height, SGuint preload);
void sgFontDestroy(SGFont* font);
SGFont* sgFontResizeCopy(SGFont* font, float height);
SGFont* sgFontResize(SGFont* font, float height);

void sgFontPrintf(SGFont* font, float x, float y, const char* format, ...);
void sgFontPrintfv(SGFont* font, float x, float y, const char* format, va_list args);
void sgFontPrintU32(SGFont* font, float x, float y, const SGdchar* text);
void sgFontPrintU16(SGFont* font, float x, float y, const SGwchar* text);
void sgFontPrintU8(SGFont* font, float x, float y, const SGchar* text);
void sgFontPrint(SGFont* font, float x, float y, const char* text);

void sgFontPrintAligned(SGFont*, float, float, SGenum, const char*);
void sgFontPrintAlignedf(SGFont* font, float x, float y, SGenum _align, const char* format, ...);
void sgFontPrintAlignedfv(SGFont*, float, float, SGenum, const char*, va_list);
// TODO: other widths. -Bernard.

deprecated {
    void sgFontPrintCenteredf(SGFont* font, float x, float y, const char* format, ...);
    void sgFontPrintCenteredfv(SGFont* font, float x, float y, const char* format, va_list args);
    void sgFontPrintCentered(SGFont* font, float x, float y, const char* text);
    void sgFontPrintXCenteredf(SGFont* font, float x, float y, const char* format, ...);
    void sgFontPrintXCenteredfv(SGFont* font, float x, float y, const char* format, va_list args);
    void sgFontPrintXCentered(SGFont* font, float x, float y, const char* text);
    void sgFontPrintYCenteredf(SGFont* font, float x, float y, const char* format, ...);
    void sgFontPrintYCenteredfv(SGFont* font, float x, float y, const char* format, va_list args);
    void sgFontPrintYCentered(SGFont* font, float x, float y, const char* text);
}

void sgFontStrSizef(SGFont* font, float* x, float* y, const char* format, ...);
void sgFontStrSizefv(SGFont* font, float* x, float* y, const char* format, va_list args);
void sgFontStrSize(SGFont* font, float* x, float* y, const char* text);
size_t sgFontFindIndexf(SGFont*, float, float, const char*, ...);
size_t sgFontFindIndexfv(SGFont*, float, float, const char*, va_list);
size_t sgFontFindIndex(SGFont*, float, float, const char*);
void sgFontGetPosf(SGFont*, float*, float*, size_t, const char*, ...);
void sgFontGetPosfv(SGFont*, float*, float*, size_t, const char*, va_list);
void sgFontGetPos(SGFont*, float*, float*, size_t, const char*);


