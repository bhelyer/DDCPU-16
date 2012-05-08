// D import file generated from 'derelict\sdl\sdl.d'
module derelict.sdl.sdl;
public 
{
    import derelict.sdl.sdltypes;
    import derelict.sdl.sdlfuncs;
}
private 
{
    import derelict.util.loader;
    version (darwin)
{
    version = MacOSX;
}
    version (OSX)
{
    version = MacOSX;
}
    version (MacOSX)
{
    import derelict.sdl.macinit.SDLMain;
}
}
class DerelictSDLLoader : SharedLibLoader
{
    public 
{
    this()
{
super("sdl.dll","libSDL.so, libSDL.so.0, libSDL-1.2.so, libSDL-1.2.so.0","../Frameworks/SDL.framework/SDL, /Library/Frameworks/SDL.framework/SDL, /System/Library/Frameworks/SDL.framework/SDL");
}
    protected override void loadSymbols();


}
}
DerelictSDLLoader DerelictSDL;
static this();
