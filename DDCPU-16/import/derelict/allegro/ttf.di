// D import file generated from 'derelict\allegro\ttf.d'
module derelict.allegro.ttf;
private 
{
    import derelict.allegro.allegrotypes;
    import derelict.allegro.font;
    import derelict.util.compat;
    import derelict.util.loader;
}
enum 
{
ALLEGRO_TTF_NO_KERNING = 1,
ALLEGRO_TTF_MONOCHROME = 2,
}
extern (C) 
{
    alias ALLEGRO_FONT* function(in char*, int, int) da_al_load_ttf_font;
    alias ALLEGRO_FONT* function(ALLEGRO_FILE*, in char*, int, int) da_al_load_ttf_font_f;
    alias bool function() da_al_init_ttf_addon;
    alias void function() da_al_shutdown_ttf_addon;
    alias uint function() da_al_get_allegro_ttf_version;
}
mixin(gsharedString!() ~ "\x0ada_al_load_ttf_font al_load_ttf_font;\x0ada_al_load_ttf_font_f al_load_ttf_font_f;\x0ada_al_init_ttf_addon al_init_ttf_addon;\x0ada_al_shutdown_ttf_addon al_shutdown_ttf_addon;\x0ada_al_get_allegro_ttf_version al_get_allegro_ttf_version;\x0a");
class DerelictAllegroTTFLoader : SharedLibLoader
{
    public 
{
    this()
{
super("allegro_ttf-5.0.5-mt.dll,allegro_ttf-5.0.4-mt.dll,allegro_ttf-5.0.3-mt.dll,allegro_ttf-5.0.2-mt.dll,allegro_ttf-5.0.1-mt.dll,allegro_ttf-5.0.0-mt.dll","liballegro_ttf-5.0.5.so,liballegro_ttf-5.0.so","../Frameworks/Allegrottf-5.0.framework,/Library/Frameworks/AllegroTTF-5.0.framwork,liballegro_ttf-5.0.5.dylib,liballegro_ttf-5.0.dylib");
}
    protected override void loadSymbols()
{
bindFunc(cast(void**)&al_load_ttf_font,"al_load_ttf_font");
bindFunc(cast(void**)&al_load_ttf_font_f,"al_load_ttf_font_f");
bindFunc(cast(void**)&al_init_ttf_addon,"al_init_ttf_addon");
bindFunc(cast(void**)&al_shutdown_ttf_addon,"al_shutdown_ttf_addon");
bindFunc(cast(void**)&al_get_allegro_ttf_version,"al_get_allegro_ttf_version");
}


}
}
DerelictAllegroTTFLoader DerelictAllegroTTF;
static this();
