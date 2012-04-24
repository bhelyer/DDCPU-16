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

module siege.c.util.plist;

import siege.c.util.list;
import siege.c.common;

extern(C):

// [lower/greater]-[equal/than]
enum
{
    SG_PLIST_LEQ = 1<<0,
    SG_PLIST_LT  = 1<<1,
    SG_PLIST_GEQ = 1<<2,
    SG_PLIST_GT  = 1<<3,
}

// [high/low]-first-[new/old]
enum
{
    SG_PLIST_HFN = SG_PLIST_LEQ,
    SG_PLIST_HFO = SG_PLIST_LT ,
    SG_PLIST_LFN = SG_PLIST_GEQ,
    SG_PLIST_LFO = SG_PLIST_GT ,
}

alias SGListNode SGPListNode;
alias SGList SGPList;

SGPList* sgPListCreate(SGenum);;
SGPListNode* sgPListInsertPriority(SGPList*, float, void*);

