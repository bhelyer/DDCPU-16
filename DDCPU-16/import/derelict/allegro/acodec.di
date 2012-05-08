// D import file generated from 'derelict\allegro\acodec.d'
module derelict.allegro.acodec;
private 
{
    import derelict.util.compat;
    import derelict.util.loader;
}
extern (C) 
{
    alias bool function() da_al_init_acodec_addon;
    alias uint function() da_al_get_allegro_acodec_version;
}
mixin(gsharedString!() ~ "\x0ada_al_init_acodec_addon al_init_acodec_addon;\x0ada_al_get_allegro_acodec_version al_get_allegro_acodec_version;\x0a");
class DerelictAllegroACodecLoader : SharedLibLoader
{
    public 
{
    this()
{
super("allegro_acodec-5.0.5-mt.dll,allegro_acodec-5.0.4-mt.dll,allegro_acodec-5.0.3-mt.dll,allegro_acodec-5.0.2-mt.dll,allegro_acodec-5.0.1-mt.dll,allegro_acodec-5.0.0-mt.dll","liballegro_acodec-5.0.5.so,liballegro_acodec-5.0.so","../Frameworks/AllegroAcodec-5.0.framework,/Library/Frameworks/AllegroAcodec-5.0.framwork,liballegro_acodec-5.0.5.dylib,liballegro_acodec-5.0.dylib");
}
    protected override void loadSymbols()
{
bindFunc(cast(void**)&al_init_acodec_addon,"al_init_acodec_addon");
bindFunc(cast(void**)&al_get_allegro_acodec_version,"al_get_allegro_acodec_version");
}


}
}
DerelictAllegroACodecLoader DerelictAllegroACodec;
static this();
