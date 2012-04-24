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
module siege.c.util.conv;

import siege.c.common;

extern (C):

enum SG_CONV_TYPE_UNKNOWN = 0;
enum SG_CONV_TYPE_CHAR = 1;
enum SG_CONV_TYPE_WCHAR_T = 2;
enum SG_CONV_TYPE_UTF8 = 3;
enum SG_CONV_TYPE_UTF16 = 4;
enum SG_CONV_TYPE_UTF32 = 5;

struct SGConv
{
    void* handle;
    SGenum from;
    SGenum to;
}

SGint _sgStringICmp(const(char)* a, const(char)* b);
SGenum _sgConvType(const(char)* type);
SGConv* sgConvCreate(const(char)* from, const(char)* to);
void sgConvDestroy(SGConv*);
void* sgConv(SGConv*, size_t outlen, void* str, size_t len);
void* sgConv2s(const(char)* from, const(char)* to, size_t* outlen, void* str, size_t len);
