// D import file generated from 'derelict\freetype\ft.d'
module derelict.freetype.ft;
public 
{
    import derelict.freetype.fttypes;
    import derelict.freetype.ftfuncs;
}
private import derelict.util.loader;

class DerelictFTLoader : SharedLibLoader
{
    public 
{
    this()
{
super("freetype.dll","libfreetype.so.6,libfreetype.so","libfreetype.dylib,libfreetype.6.dylib,libfreetype.6.3.16.dylib,/usr/X11/lib/libfreetype.dylib,/usr/X11/lib/libfreetype.6.dylib,/usr/X11/lib/libfreetype.6.3.16.dylib");
}
    protected override void loadSymbols();


}
}
DerelictFTLoader DerelictFT;
static this();
