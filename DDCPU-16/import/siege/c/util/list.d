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

module siege.c.util.list;

import siege.c.common;

extern(C):

struct SGListNode
{
	SGList* list;
	SGListNode* prev;
	SGListNode* next;
	void* item;

	void* internal;
    void function(void*) internalFree;
}

struct SGList
{
	SGListNode* first;
	SGListNode* last;

	void* internal;
    void function(void*) internalFree;
}

SGList* sgListCreate();
void sgListDestroy(SGList* list);

size_t sgListLength(SGList* list);

SGListNode* sgListFindItem(SGList* list, void* item);
SGListNode* sgListFindIndex(SGList* list, size_t index);

SGListNode* sgListInsertNode(SGList* list, SGListNode* after, void* item);
SGListNode* sgListInsertItem(SGList* list, void* after, void* item);
SGListNode* sgListInsertIndex(SGList* list, size_t after, void* item);
SGListNode* sgListPrepend(SGList* list, void* item);
SGListNode* sgListAppend(SGList* list, void* item);

void sgListRemoveNode(SGList* list, SGListNode* node);
void sgListRemoveItem(SGList* list, void* item);
void sgListRemoveIndex(SGList* list, size_t index);

SGListNode* sgListGetFirst(SGList* list);
SGListNode* sgListGetLast(SGList* list);

void* sgListPopFirst(SGList* list);
void* sgListPopLast(SGList* list);

