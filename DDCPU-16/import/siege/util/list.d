module siege.util.list;

import siege.c.util.list;


struct List(T)
{
    SGList* handle;
    SGListNode* first;
    SGListNode* last;
    size_t length;

    this(SGList* list)
    {
        handle = list;
        first = handle.first;
        last = handle.last;
    }

    void destroy()
    {
        sgListDestroy(handle);
    }

    @property bool empty()
    {
        return first is null || last is null;
    }

    @property T front()
    {
        return cast(T) first.item;
    }

    @property T back()
    {
        return cast(T) last.item;
    }

    void popFront()
    {
        if (first is last) {
            first = last = null;
        } else {
            first = first.next;
        }
    }

    void popBack()
    {
        if (last is first) {
            last = first = null;
        } else {
            last = last.next;
        }
    }
}

