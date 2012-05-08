// D import file generated from 'derelict\ogg\ogg.d'
module derelict.ogg.ogg;
public 
{
    import derelict.ogg.oggtypes;
    import derelict.ogg.oggfuncs;
}
private import derelict.util.loader;

class DerelictOggLoader : SharedLibLoader
{
    public 
{
    this()
{
super("ogg.dll, libogg.dll","libogg.so, libogg.so.0","");
}
    protected override void loadSymbols();


}
}
DerelictOggLoader DerelictOgg;
static this();
