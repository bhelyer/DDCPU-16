// D import file generated from 'derelict\sdl\ttf.d'
module derelict.sdl.ttf;
private 
{
    import derelict.util.loader;
    import derelict.util.exception;
    import derelict.util.compat;
    import derelict.sdl.sdl;
}
enum : Uint8
{
SDL_TTF_MAJOR_VERSION = 2,
SDL_TTF_MINOR_VERSION = 0,
SDL_TTF_PATCHLEVEL = 11,
}
alias SDL_TTF_MAJOR_VERSION TTF_MAJOR_VERSION;
alias SDL_TTF_MINOR_VERSION TTF_MINOR_VERSION;
alias SDL_TTF_PATCHLEVEL TTF_PATCHLEVEL;
enum 
{
UNICODE_BOM_NATIVE = 65279,
UNICODE_BOM_SWAPPED = 65534,
TTF_STYLE_NORMAL = 0,
TTF_STYLE_BOLD = 1,
TTF_STYLE_ITALIC = 2,
TTF_STYLE_UNDERLINE = 4,
TTF_STYLE_STRIKETHROUGH = 8,
}
enum 
{
TTF_HINTING_NORMAL = 0,
TTF_HINTING_LIGHT = 1,
TTF_HINTING_MONO = 2,
TTF_HINTING_NONE = 3,
}
alias SDL_SetError TTF_SetError;
alias SDL_GetError TTF_GetError;
struct _TTF_Font
{
}
alias _TTF_Font TTF_Font;
void SDL_TTF_VERSION(SDL_version* X)
{
X.major = SDL_TTF_MAJOR_VERSION;
X.minor = SDL_TTF_MINOR_VERSION;
X.patch = SDL_TTF_PATCHLEVEL;
}
void TTF_VERSION(SDL_version* X)
{
SDL_TTF_VERSION(X);
}
extern (C) 
{
    alias CSDLVERPTR function() da_TTF_Linked_Version;
    alias void function(int) da_TTF_ByteSwappedUNICODE;
    alias int function() da_TTF_Init;
    alias TTF_Font* function(in char*, int) da_TTF_OpenFont;
    alias TTF_Font* function(in char*, int, long) da_TTF_OpenFontIndex;
    alias TTF_Font* function(SDL_RWops*, int, int) da_TTF_OpenFontRW;
    alias TTF_Font* function(SDL_RWops*, int, int, long) da_TTF_OpenFontIndexRW;
    alias int function(in TTF_Font*) da_TTF_GetFontStyle;
    alias void function(in TTF_Font*, int style) da_TTF_SetFontStyle;
    alias int function(in TTF_Font*) da_TTF_GetFontOutline;
    alias void function(TTF_Font*, int) da_TTF_SetFontOutline;
    alias int function(in TTF_Font*) da_TTF_GetFontHinting;
    alias void function(TTF_Font*, int) da_TTF_SetFontHinting;
    alias int function(in TTF_Font*) da_TTF_FontHeight;
    alias int function(in TTF_Font*) da_TTF_FontAscent;
    alias int function(in TTF_Font*) da_TTF_FontDescent;
    alias int function(in TTF_Font*) da_TTF_FontLineSkip;
    alias int function(in TTF_Font*) da_TTF_GetFontKerning;
    alias void function(TTF_Font*, int) da_TTF_SetFontKerning;
    alias int function(in TTF_Font*) da_TTF_FontFaces;
    alias int function(in TTF_Font*) da_TTF_FontFaceIsFixedWidth;
    alias char* function(in TTF_Font*) da_TTF_FontFaceFamilyName;
    alias char* function(in TTF_Font*) da_TTF_FontFaceStyleName;
    alias int function(in TTF_Font*, Uint16) da_TTF_GlyphIsProvided;
    alias int function(TTF_Font*, Uint16, int*, int*, int*, int*, int*) da_TTF_GlyphMetrics;
    alias int function(TTF_Font*, in char*, int*, int*) da_TTF_SizeText;
    alias int function(TTF_Font*, in char*, int*, int*) da_TTF_SizeUTF8;
    alias int function(TTF_Font*, Uint16*, int*, int*) da_TTF_SizeUNICODE;
    alias SDL_Surface* function(TTF_Font*, in char*, SDL_Color) da_TTF_RenderText_Solid;
    alias SDL_Surface* function(TTF_Font*, in char*, SDL_Color) da_TTF_RenderUTF8_Solid;
    alias SDL_Surface* function(TTF_Font*, in Uint16*, SDL_Color) da_TTF_RenderUNICODE_Solid;
    alias SDL_Surface* function(TTF_Font*, Uint16, SDL_Color) da_TTF_RenderGlyph_Solid;
    alias SDL_Surface* function(TTF_Font*, in char*, SDL_Color, SDL_Color) da_TTF_RenderText_Shaded;
    alias SDL_Surface* function(TTF_Font*, in char*, SDL_Color, SDL_Color) da_TTF_RenderUTF8_Shaded;
    alias SDL_Surface* function(TTF_Font*, in Uint16*, SDL_Color, SDL_Color) da_TTF_RenderUNICODE_Shaded;
    alias SDL_Surface* function(TTF_Font*, Uint16, SDL_Color, SDL_Color) da_TTF_RenderGlyph_Shaded;
    alias SDL_Surface* function(TTF_Font*, in char*, SDL_Color) da_TTF_RenderText_Blended;
    alias SDL_Surface* function(TTF_Font*, in char*, SDL_Color) da_TTF_RenderUTF8_Blended;
    alias SDL_Surface* function(TTF_Font*, in Uint16*, SDL_Color) da_TTF_RenderUNICODE_Blended;
    alias SDL_Surface* function(TTF_Font*, Uint16, SDL_Color) da_TTF_RenderGlyph_Blended;
    alias void function(TTF_Font*) da_TTF_CloseFont;
    alias void function() da_TTF_Quit;
    alias int function() da_TTF_WasInit;
    alias int function(TTF_Font*, int, int) da_TTF_GetFontKerningSize;
}
mixin(gsharedString!() ~ "\x0ada_TTF_Linked_Version TTF_Linked_Version;\x0ada_TTF_ByteSwappedUNICODE TTF_ByteSwappedUNICODE;\x0ada_TTF_Init TTF_Init;\x0ada_TTF_OpenFont TTF_OpenFont;\x0ada_TTF_OpenFontIndex TTF_OpenFontIndex;\x0ada_TTF_OpenFontRW TTF_OpenFontRW;\x0ada_TTF_OpenFontIndexRW TTF_OpenFontIndexRW;\x0ada_TTF_GetFontStyle TTF_GetFontStyle;\x0ada_TTF_SetFontStyle TTF_SetFontStyle;\x0ada_TTF_GetFontOutline TTF_GetFontOutline;\x0ada_TTF_SetFontOutline TTF_SetFontOutline;\x0ada_TTF_GetFontHinting TTF_GetFontHinting;\x0ada_TTF_SetFontHinting TTF_SetFontHinting;\x0ada_TTF_FontHeight TTF_FontHeight;\x0ada_TTF_FontAscent TTF_FontAscent;\x0ada_TTF_FontDescent TTF_FontDescent;\x0ada_TTF_FontLineSkip TTF_FontLineSkip;\x0ada_TTF_GetFontKerning TTF_GetFontKerning;\x0ada_TTF_SetFontKerning TTF_SetFontKerning;\x0ada_TTF_FontFaces TTF_FontFaces;\x0ada_TTF_FontFaceIsFixedWidth TTF_FontFaceIsFixedWidth;\x0ada_TTF_FontFaceFamilyName TTF_FontFaceFamilyName;\x0ada_TTF_FontFaceStyleName TTF_FontFaceStyleName;\x0ada_TTF_GlyphIsProvided TTF_GlyphIsProvided;\x0ada_TTF_GlyphMetrics TTF_GlyphMetrics;\x0ada_TTF_SizeText TTF_SizeText;\x0ada_TTF_SizeUTF8 TTF_SizeUTF8;\x0ada_TTF_SizeUNICODE TTF_SizeUNICODE;\x0ada_TTF_RenderText_Solid TTF_RenderText_Solid;\x0ada_TTF_RenderUTF8_Solid TTF_RenderUTF8_Solid;\x0ada_TTF_RenderUNICODE_Solid TTF_RenderUNICODE_Solid;\x0ada_TTF_RenderGlyph_Solid TTF_RenderGlyph_Solid;\x0ada_TTF_RenderText_Shaded TTF_RenderText_Shaded;\x0ada_TTF_RenderUTF8_Shaded TTF_RenderUTF8_Shaded;\x0ada_TTF_RenderUNICODE_Shaded TTF_RenderUNICODE_Shaded;\x0ada_TTF_RenderGlyph_Shaded TTF_RenderGlyph_Shaded;\x0ada_TTF_RenderText_Blended TTF_RenderText_Blended;\x0ada_TTF_RenderUTF8_Blended TTF_RenderUTF8_Blended;\x0ada_TTF_RenderUNICODE_Blended TTF_RenderUNICODE_Blended;\x0ada_TTF_RenderGlyph_Blended TTF_RenderGlyph_Blended;\x0ada_TTF_CloseFont TTF_CloseFont;\x0ada_TTF_Quit TTF_Quit;\x0ada_TTF_WasInit TTF_WasInit;\x0ada_TTF_GetFontKerningSize TTF_GetFontKerningSize;\x0a");
alias TTF_RenderText_Shaded TTF_RenderText;
alias TTF_RenderUTF8_Shaded TTF_RenderUTF8;
alias TTF_RenderUNICODE_Shaded TTF_RenderUNICODE;
class DerelictSDLttfLoader : SharedLibLoader
{
    public 
{
    this()
{
super("SDL_ttf.dll","libSDL_ttf.so, libSDL_ttf-2.0.so, libSDL_ttf-2.0.so.0","./Frameworks/SDL_ttf.framework/SDL_ttf, /Library/Frameworks/SDL_ttf.framework/SDL_ttf, /System/Library/Frameworks/SDL_ttf.framework/SDL_ttf");
}
    protected override void loadSymbols();


}
}
DerelictSDLttfLoader DerelictSDLttf;
static this();
