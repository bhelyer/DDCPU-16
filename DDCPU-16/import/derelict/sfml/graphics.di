// D import file generated from 'derelict\sfml\graphics.d'
module derelict.sfml.graphics;
public 
{
    import derelict.sfml.gtypes;
    import derelict.sfml.gfuncs;
}
private import derelict.util.loader;

class DerelictSFMLGraphicsLoader : SharedLibLoader
{
    public 
{
    this()
{
super("csfml-graphics.dll","libcsfml-graphics.so,libcsfml-graphics.so.1.6","../Frameworks/csfml-graphics.framework/csfml-graphics, /Library/Frameworks/csfml-graphics.framework/csfml-graphics, /System/Library/Frameworks/csfml-graphics.framework/csfml-graphics");
}
    protected override void loadSymbols();


}
}
DerelictSFMLGraphicsLoader DerelictSFMLGraphics;
static this();
