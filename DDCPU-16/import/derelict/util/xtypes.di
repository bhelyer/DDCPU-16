// D import file generated from 'derelict\util\xtypes.d'
module derelict.util.xtypes;
version (freebsd)
{
    version = GLX;
}
else
{
    version (FreeBSD)
{
    version = GLX;
}
else
{
    version (linux)
{
    version = GLX;
}
}
}
version (GLX)
{
    alias int Bool;
    alias uint VisualID;
    alias byte* XPointer;
    alias void Display;
    alias uint XID;
    alias XID Pixmap;
    alias XID Font;
    alias XID Window;
    struct XExtData
{
    int number;
    XExtData* next;
    extern (C) int function(XExtData*) free_private;

    XPointer private_data;
}
    struct Visual
{
    XExtData* ext_data;
    VisualID visualid;
    int _class;
    uint red_mask;
    uint green_mask;
    uint blue_mask;
    int bits_per_rgb;
    int map_entries;
}
    struct XVisualInfo
{
    Visual* visual;
    VisualID visualid;
    int screen;
    int depth;
    int _class;
    uint red_mask;
    uint green_mask;
    uint blue_mask;
    int colormap_size;
    int bits_per_rgb;
}
}
