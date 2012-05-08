// D import file generated from 'derelict\allegro\image.d'
module derelict.allegro.image;
private 
{
    import derelict.util.compat;
    import derelict.util.loader;
}
extern (C) 
{
    alias bool function() da_al_init_image_addon;
    alias void function() da_al_shutdown_image_addon;
    alias uint function() da_al_get_allegro_image_version;
}
mixin(gsharedString!() ~ "\x0ada_al_init_image_addon al_init_image_addon;\x0ada_al_shutdown_image_addon al_shutdown_image_addon;\x0ada_al_get_allegro_image_version al_get_allegro_image_version;\x0a");
class DerelictAllegroImageLoader : SharedLibLoader
{
    public 
{
    this()
{
super("allegro_image-5.0.5-mt.dll,allegro_image-5.0.4-mt.dll,allegro_image-5.0.3-mt.dll,allegro_image-5.0.2-mt.dll,allegro_image-5.0.1-mt.dll,allegro_image-5.0.0-mt.dll","liballegro_image-5.0.5.so,liballegro_image-5.0.so","../Frameworks/AllegroImage-5.0.framework,/Library/Frameworks/AllegroImage-5.0.framwork,liballegro_image-5.0.5.dylib,liballegro_image-5.0.dylib");
}
    protected override void loadSymbols()
{
bindFunc(cast(void**)&al_init_image_addon,"al_init_image_addon");
bindFunc(cast(void**)&al_shutdown_image_addon,"al_shutdown_image_addon");
bindFunc(cast(void**)&al_get_allegro_image_version,"al_get_allegro_image_version");
}


}
}
DerelictAllegroImageLoader DerelictAllegroImage;
static this();
