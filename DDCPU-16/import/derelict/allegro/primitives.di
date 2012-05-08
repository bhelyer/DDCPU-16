// D import file generated from 'derelict\allegro\primitives.d'
module derelict.allegro.primitves;
private 
{
    import std.stdint;
    import derelict.allegro.allegrotypes;
    import derelict.util.compat;
    import derelict.util.loader;
}
struct ALLEGRO_VERTEX_ELEMENT
{
    int attribute;
    int storage;
    int offset;
}
struct ALLEGRO_VERTEX_DECL
{
}
struct ALLEGRO_VERTEX
{
    float x;
    float y;
    float z;
    float u;
    float v;
    ALLEGRO_COLOR color;
}
extern (C) 
{
    alias uint function() da_al_get_allegro_primitives_version;
    alias bool function() da_al_init_primitives_addon;
    alias void function() da_al_shutdown_primitives_addon;
    alias int function(in void*, in ALLEGRO_VERTEX_DECL*, ALLEGRO_BITMAP*, int, int, int) da_al_draw_prim;
    alias int function(in void*, in ALLEGRO_VERTEX_DECL*, ALLEGRO_BITMAP*, in int*, int, int) da_al_draw_indexed_prim;
    alias ALLEGRO_VERTEX_DECL* function(in ALLEGRO_VERTEX_ELEMENT*, int) da_al_create_vertex_decl;
    alias void function(ALLEGRO_VERTEX_DECL*) da_al_destroy_vertex_decl;
    alias void function(ALLEGRO_VERTEX*, ALLEGRO_VERTEX*, ALLEGRO_VERTEX*, uintptr_t, void function(uintptr_t, ALLEGRO_VERTEX*, ALLEGRO_VERTEX*, ALLEGRO_VERTEX*), void function(uintptr_t, int, int, int, int), void function(uintptr_t, int), void function(uintptr_t, int, int, int)) da_al_draw_soft_triangle;
    alias void function(ALLEGRO_VERTEX*, ALLEGRO_VERTEX*, uintptr_t, void function(uintptr_t, int, int, ALLEGRO_VERTEX*, ALLEGRO_VERTEX*), void function(uintptr_t, int), void function(uintptr_t, int, int, int)) da_al_draw_soft_line;
    alias void function(float, float, float, float, ALLEGRO_COLOR, float) da_al_draw_line;
    alias void function(float, float, float, float, float, float, ALLEGRO_COLOR, float) da_al_draw_triangle;
    alias void function(float, float, float, float, ALLEGRO_COLOR, float) da_al_draw_rectangle;
    alias void function(float, float, float, float, float, float, ALLEGRO_COLOR, float) da_al_draw_rounded_rectangle;
    alias void function(float*, int, float, float, float, float, float, float, float, int) da_al_calculate_arc;
    alias void function(float, float, float, ALLEGRO_COLOR, float) da_al_draw_circle;
    alias void function(float, float, float, float, ALLEGRO_COLOR, float) da_al_draw_ellipse;
    alias void function(float, float, float, float, float, ALLEGRO_COLOR, float) da_al_draw_arc;
    alias void function(float*, int, ref float[8], float, int) da_al_calculate_spline;
    alias void function(ref float[8], ALLEGRO_COLOR, float) da_al_draw_spline;
    alias void function(float*, int, in float*, int, float, int) da_al_calculate_ribbon;
    alias void function(in float*, int, ALLEGRO_COLOR, float, int) da_al_draw_ribbon;
    alias void function(float, float, float, float, float, float, ALLEGRO_COLOR) da_al_draw_filled_triangle;
    alias void function(float, float, float, float, ALLEGRO_COLOR) da_al_draw_filled_rectangle;
    alias void function(float, float, float, float, ALLEGRO_COLOR) da_al_draw_filled_ellipse;
    alias void function(float, float, float, ALLEGRO_COLOR) da_al_draw_filled_circle;
    alias void function(float, float, float, float, float, float, ALLEGRO_COLOR) da_al_draw_filled_rounded_rectangle;
}
mixin(gsharedString!() ~ "\x0ada_al_get_allegro_primitives_version al_get_allegro_primitives_version;\x0ada_al_init_primitives_addon al_init_primitives_addon;\x0ada_al_shutdown_primitives_addon al_shutdown_primitives_addon;\x0ada_al_draw_prim al_draw_prim;\x0ada_al_draw_indexed_prim al_draw_indexed_prim;\x0ada_al_create_vertex_decl al_create_vertex_decl;\x0ada_al_destroy_vertex_decl al_destroy_vertex_decl;\x0ada_al_draw_soft_triangle al_draw_soft_triangle;\x0ada_al_draw_soft_line al_draw_soft_line;\x0ada_al_draw_line al_draw_line;\x0ada_al_draw_triangle al_draw_triangle;\x0ada_al_draw_rectangle al_draw_rectangle;\x0ada_al_draw_rounded_rectangle al_draw_rounded_rectangle;\x0ada_al_calculate_arc al_calculate_arc;\x0ada_al_draw_circle al_draw_circle;\x0ada_al_draw_ellipse al_draw_ellipse;\x0ada_al_draw_arc al_draw_arc;\x0ada_al_calculate_spline al_calculate_spline;\x0ada_al_draw_spline al_draw_spline;\x0ada_al_calculate_ribbon al_calculate_ribbon;\x0ada_al_draw_ribbon al_draw_ribbon;\x0ada_al_draw_filled_triangle al_draw_filled_triangle;\x0ada_al_draw_filled_rectangle al_draw_filled_rectangle;\x0ada_al_draw_filled_ellipse al_draw_filled_ellipse;\x0ada_al_draw_filled_circle al_draw_filled_circle;\x0ada_al_draw_filled_rounded_rectangle al_draw_filled_rounded_rectangle;\x0a");
class DerelictAllegroPrimitivesLoader : SharedLibLoader
{
    public 
{
    this()
{
super("allegro_primitives-5.0.5-mt.dll,allegro_primitives-5.0.4-mt.dll,allegro_primitives-5.0.3-mt.dll,allegro_primitives-5.0.2-mt.dll,allegro_primitives-5.0.1-mt.dll,allegro_primitives-5.0.0-mt.dll","liballegro_primitives-5.0.5.so,liballegro_primitives-5.0.so","../Frameworks/AllegroPrimitives-5.0.framework,/Library/Frameworks/AllegroPrimitives-5.0.framwork,liballegro_primitives-5.0.5.dylib,liballegro_primitives-5.0.dylib");
}
    protected override void loadSymbols()
{
bindFunc(cast(void**)&al_init_primitives_addon,"al_init_primitives_addon");
bindFunc(cast(void**)&al_shutdown_primitives_addon,"al_shutdown_primitives_addon");
bindFunc(cast(void**)&al_draw_prim,"al_draw_prim");
bindFunc(cast(void**)&al_draw_indexed_prim,"al_draw_indexed_prim");
bindFunc(cast(void**)&al_create_vertex_decl,"al_create_vertex_decl");
bindFunc(cast(void**)&al_destroy_vertex_decl,"al_destroy_vertex_decl");
bindFunc(cast(void**)&al_draw_soft_triangle,"al_draw_soft_triangle");
bindFunc(cast(void**)&al_draw_soft_line,"al_draw_soft_line");
bindFunc(cast(void**)&al_draw_line,"al_draw_line");
bindFunc(cast(void**)&al_draw_triangle,"al_draw_triangle");
bindFunc(cast(void**)&al_draw_rectangle,"al_draw_rectangle");
bindFunc(cast(void**)&al_draw_rounded_rectangle,"al_draw_rounded_rectangle");
bindFunc(cast(void**)&al_calculate_arc,"al_calculate_arc");
bindFunc(cast(void**)&al_draw_circle,"al_draw_circle");
bindFunc(cast(void**)&al_draw_ellipse,"al_draw_ellipse");
bindFunc(cast(void**)&al_draw_arc,"al_draw_arc");
bindFunc(cast(void**)&al_calculate_spline,"al_calculate_spline");
bindFunc(cast(void**)&al_draw_spline,"al_draw_spline");
bindFunc(cast(void**)&al_calculate_ribbon,"al_calculate_ribbon");
bindFunc(cast(void**)&al_draw_ribbon,"al_draw_ribbon");
bindFunc(cast(void**)&al_draw_filled_triangle,"al_draw_filled_triangle");
bindFunc(cast(void**)&al_draw_filled_rectangle,"al_draw_filled_rectangle");
bindFunc(cast(void**)&al_draw_filled_ellipse,"al_draw_filled_ellipse");
bindFunc(cast(void**)&al_draw_filled_circle,"al_draw_filled_circle");
bindFunc(cast(void**)&al_draw_filled_rounded_rectangle,"al_draw_filled_rounded_rectangle");
}


}
}
DerelictAllegroPrimitivesLoader DerelictAllegroPrimitives;
static this();
