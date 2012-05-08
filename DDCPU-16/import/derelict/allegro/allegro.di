// D import file generated from 'derelict\allegro\allegro.d'
module derelict.allegro.allegro;
public 
{
    import derelict.allegro.allegrotypes;
    import derelict.allegro.allegrofuncs;
}
private import derelict.util.loader;

class DerelictAllegroLoader : SharedLibLoader
{
    public 
{
    this()
{
super("allegro-5.0.5-mt.dll,allegro-5.0.4-mt.dll,allegro-5.0.3-mt.dll,allegro-5.0.2-mt.dll,allegro-5.0.1-mt.dll,allegro-5.0.0-mt.dll","liballegro-5.0.5.so,liballegro-5.0.so","../Frameworks/Allegro-5.0.framework,/Library/Frameworks/Allegro-5.0.framwork,liballegro-5.0.5.dylib,liballegro-5.0.dylib");
}
    protected override void loadSymbols();


}
}
DerelictAllegroLoader DerelictAllegro;
static this();
