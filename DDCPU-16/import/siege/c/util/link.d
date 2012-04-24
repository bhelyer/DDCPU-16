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

module siege.c.util.link;

import siege.c.common;

extern(C):

struct SGLibrary
{
    const(char)* fname;
    void* handle;
}

SGbool _sgLibraryInit();
SGbool _sgLibraryDeinit();
SGLibrary* sgLibraryLoad(const(char)* fname);
void sgLibraryUnload(SGLibrary* lib);
void* sgGetProcAddress(SGLibrary* lib, const(char)* proc);

