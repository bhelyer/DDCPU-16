// D import file generated from 'derelict\allegro\font.d'
module derelict.allegro.font;
private 
{
    import derelict.allegro.allegrotypes;
    import derelict.util.compat;
    import derelict.util.loader;
}
struct ALLEGRO_FONT
{
    void* data;
    int height;
    ALLEGRO_FONT_VTABLE* vtable;
}
struct ALLEGRO_FONT_VTABLE
{
    extern (C) 
{
    int function(in ALLEGRO_FONT*) font_height;
    int function(in ALLEGRO_FONT*) font_ascent;
    int function(in ALLEGRO_FONT*) font_descent;
    int function(in ALLEGRO_FONT*, int) char_length;
    int function(in ALLEGRO_FONT*, in ALLEGRO_USTR*) text_length;
    int function(in ALLEGRO_FONT*, ALLEGRO_COLOR, int, float, float) render_char;
    int function(in ALLEGRO_FONT*, ALLEGRO_COLOR, in ALLEGRO_USTR*, float, float) render;
    void function(ALLEGRO_FONT*) destroy;
    void function(in ALLEGRO_FONT*, in ALLEGRO_USTR*, int*, int*, int*, int*) get_text_dimensions;
}
}
enum 
{
ALLEGRO_ALIGN_LEFT = 0,
ALLEGRO_ALIGN_CENTRE = 1,
ALLEGRO_ALIGN_RIGHT = 2,
}
extern (C) 
{
    alias bool function(in char*, ALLEGRO_FONT* function(in char*, int, int)) da_al_register_font_loader;
    alias ALLEGRO_FONT* function(in char*) da_al_load_bitmap_font;
    alias ALLEGRO_FONT* function(in char*, int size, int flags) da_al_load_font;
    alias ALLEGRO_FONT* function(ALLEGRO_BITMAP*, int, int*) da_al_grab_font_from_bitmap;
    alias void function(in ALLEGRO_FONT*, ALLEGRO_COLOR, float, float, int, in ALLEGRO_USTR) da_al_draw_ustr;
    alias void function(in ALLEGRO_FONT*, ALLEGRO_COLOR, float, float, int, in char*) da_al_draw_text;
    alias void function(in ALLEGRO_FONT*, ALLEGRO_COLOR, float, float, float, float, int, in char*) da_al_draw_justified_text;
    alias void function(in ALLEGRO_FONT*, ALLEGRO_COLOR, float, float, float, float, int, in ALLEGRO_USTR*) da_al_draw_justified_ustr;
    alias void function(in ALLEGRO_FONT*, ALLEGRO_COLOR, float, float, int, in char*,...) da_al_draw_textf;
    alias void function(in ALLEGRO_FONT*, ALLEGRO_COLOR, float, float, float, float, int, in char*) da_al_draw_justified_textf;
    alias int function(in ALLEGRO_FONT*, in char*) da_al_get_text_width;
    alias int function(in ALLEGRO_FONT*, in ALLEGRO_USTR*) da_al_get_ustr_width;
    alias int function(in ALLEGRO_FONT*) da_al_get_font_line_height;
    alias int function(in ALLEGRO_FONT*) da_al_get_font_ascent;
    alias int function(in ALLEGRO_FONT*) da_al_get_font_descent;
    alias void function(ALLEGRO_FONT*) da_al_destroy_font;
    alias void function(in ALLEGRO_FONT*, in ALLEGRO_USTR*, int*, int*, int*, int*) da_al_get_ustr_dimensions;
    alias void function(in ALLEGRO_FONT*, in char*, int*, int*, int*, int*) da_al_get_text_dimensions;
    alias void function() da_al_init_font_addon;
    alias void function() da_al_shutdown_font_addon;
    alias uint function() da_al_get_allegro_font_version;
}
mixin(gsharedString!() ~ "\x0ada_al_register_font_loader al_register_font_loader;\x0ada_al_load_bitmap_font al_load_bitmap_font;\x0ada_al_load_font al_load_font;\x0ada_al_grab_font_from_bitmap al_grab_font_from_bitmap;\x0ada_al_draw_ustr al_draw_ustr;\x0ada_al_draw_text al_draw_text;\x0ada_al_draw_justified_text al_draw_justified_text;\x0ada_al_draw_justified_ustr al_draw_justified_ustr;\x0ada_al_draw_textf al_draw_textf;\x0ada_al_draw_justified_textf al_draw_justified_textf;\x0ada_al_get_text_width al_get_text_width;\x0ada_al_get_ustr_width al_get_ustr_width;\x0ada_al_get_font_line_height al_get_font_line_height;\x0ada_al_get_font_ascent al_get_font_ascent;\x0ada_al_get_font_descent al_get_font_descent;\x0ada_al_destroy_font al_destroy_font;\x0ada_al_get_ustr_dimensions al_get_ustr_dimensions;\x0ada_al_get_text_dimensions al_get_text_dimensions;\x0ada_al_init_font_addon al_init_font_addon;\x0ada_al_shutdown_font_addon al_shutdown_font_addon;\x0ada_al_get_allegro_font_version al_get_allegro_font_version;\x0a");
class DerelictAllegroFontLoader : SharedLibLoader
{
    public 
{
    this()
{
super("allegro_font-5.0.5-mt.dll,allegro_font-5.0.4-mt.dll,allegro_font-5.0.3-mt.dll,allegro_font-5.0.2-mt.dll,allegro_font-5.0.1-mt.dll,allegro_font-5.0.0-mt.dll","liballegro_font-5.0.5.so,liballegro_font-5.0.so","../Frameworks/AllegroFont-5.0.framework,/Library/Frameworks/AllegroFont-5.0.framwork,liballegro_font-5.0.5.dylib,liballegro_font-5.0.dylib");
}
    protected override void loadSymbols()
{
bindFunc(cast(void**)&al_register_font_loader,"al_register_font_loader");
bindFunc(cast(void**)&al_load_bitmap_font,"al_load_bitmap_font");
bindFunc(cast(void**)&al_load_font,"al_load_font");
bindFunc(cast(void**)&al_grab_font_from_bitmap,"al_grab_font_from_bitmap");
bindFunc(cast(void**)&al_draw_ustr,"al_draw_ustr");
bindFunc(cast(void**)&al_draw_text,"al_draw_text");
bindFunc(cast(void**)&al_draw_justified_text,"al_draw_justified_text");
bindFunc(cast(void**)&al_draw_justified_ustr,"al_draw_justified_ustr");
bindFunc(cast(void**)&al_draw_textf,"al_draw_textf");
bindFunc(cast(void**)&al_draw_justified_textf,"al_draw_justified_textf");
bindFunc(cast(void**)&al_get_text_width,"al_get_text_width");
bindFunc(cast(void**)&al_get_ustr_width,"al_get_ustr_width");
bindFunc(cast(void**)&al_get_font_line_height,"al_get_font_line_height");
bindFunc(cast(void**)&al_get_font_ascent,"al_get_font_ascent");
bindFunc(cast(void**)&al_get_font_descent,"al_get_font_descent");
bindFunc(cast(void**)&al_destroy_font,"al_destroy_font");
bindFunc(cast(void**)&al_get_ustr_dimensions,"al_get_ustr_dimensions");
bindFunc(cast(void**)&al_get_text_dimensions,"al_get_text_dimensions");
bindFunc(cast(void**)&al_init_font_addon,"al_init_font_addon");
bindFunc(cast(void**)&al_shutdown_font_addon,"al_shutdown_font_addon");
bindFunc(cast(void**)&al_get_allegro_font_version,"al_get_allegro_font_version");
}


}
}
DerelictAllegroFontLoader DerelictAllegroFont;
static this();
