// D import file generated from 'derelict\sdl\image.d'
module derelict.sdl.image;
private 
{
    import derelict.util.loader;
    import derelict.util.exception;
    import derelict.util.compat;
    import derelict.sdl.sdl;
}
alias SDL_SetError IMG_SetError;
alias SDL_GetError IMG_GetError;
enum : Uint8
{
SDL_IMAGE_MAJOR_VERSION = 1,
SDL_IMAGE_MINOR_VERSION = 2,
SDL_IMAGE_PATCHLEVEL = 11,
}
void SDL_IMAGE_VERSION(SDL_version* X)
{
X.major = SDL_IMAGE_MAJOR_VERSION;
X.minor = SDL_IMAGE_MINOR_VERSION;
X.patch = SDL_IMAGE_PATCHLEVEL;
}
enum 
{
IMG_INIT_JPG = 1,
IMG_INIT_PNG = 2,
IMG_INIT_TIF = 4,
IMG_INIT_WEBP = 8,
}
extern (C) 
{
    alias int function(int) da_IMG_Init;
    alias int function() da_IMG_Quit;
    alias CSDLVERPTR function() da_IMG_Linked_Version;
    alias SDL_Surface* function(SDL_RWops*, int, char*) da_IMG_LoadTyped_RW;
    alias SDL_Surface* function(in char*) da_IMG_Load;
    alias SDL_Surface* function(SDL_RWops*, int) da_IMG_Load_RW;
    alias int function(int) da_IMG_InvertAlpha;
    alias int function(SDL_RWops*) da_IMG_isBMP;
    alias int function(SDL_RWops*) da_IMG_isGIF;
    alias int function(SDL_RWops*) da_IMG_isJPG;
    alias int function(SDL_RWops*) da_IMG_isLBM;
    alias int function(SDL_RWops*) da_IMG_isPCX;
    alias int function(SDL_RWops*) da_IMG_isPNG;
    alias int function(SDL_RWops*) da_IMG_isPNM;
    alias int function(SDL_RWops*) da_IMG_isTIF;
    alias int function(SDL_RWops*) da_IMG_isXCF;
    alias int function(SDL_RWops*) da_IMG_isXPM;
    alias int function(SDL_RWops*) da_IMG_isXV;
    alias int function(SDL_RWops*) da_IMG_isICO;
    alias int function(SDL_RWops*) da_IMG_isCUR;
    alias SDL_Surface* function(SDL_RWops*) da_IMG_LoadBMP_RW;
    alias SDL_Surface* function(SDL_RWops*) da_IMG_LoadGIF_RW;
    alias SDL_Surface* function(SDL_RWops*) da_IMG_LoadJPG_RW;
    alias SDL_Surface* function(SDL_RWops*) da_IMG_LoadLBM_RW;
    alias SDL_Surface* function(SDL_RWops*) da_IMG_LoadPCX_RW;
    alias SDL_Surface* function(SDL_RWops*) da_IMG_LoadPNG_RW;
    alias SDL_Surface* function(SDL_RWops*) da_IMG_LoadPNM_RW;
    alias SDL_Surface* function(SDL_RWops*) da_IMG_LoadTGA_RW;
    alias SDL_Surface* function(SDL_RWops*) da_IMG_LoadTIF_RW;
    alias SDL_Surface* function(SDL_RWops*) da_IMG_LoadXCF_RW;
    alias SDL_Surface* function(SDL_RWops*) da_IMG_LoadXPM_RW;
    alias SDL_Surface* function(SDL_RWops*) da_IMG_LoadXV_RW;
    alias SDL_Surface* function(SDL_RWops*) da_IMG_LoadICO_RW;
    alias SDL_Surface* function(SDL_RWops*) da_IMG_LoadCUR_RW;
    alias SDL_Surface* function(char**) da_IMG_ReadXPMFromArray;
}
mixin(gsharedString!() ~ "\x0ada_IMG_Init IMG_Init;\x0ada_IMG_Quit IMG_Quit;\x0ada_IMG_Linked_Version IMG_Linked_Version;\x0ada_IMG_LoadTyped_RW IMG_LoadTyped_RW;\x0ada_IMG_Load IMG_Load;\x0ada_IMG_Load_RW IMG_Load_RW;\x0ada_IMG_InvertAlpha IMG_InvertAlpha;\x0ada_IMG_isBMP IMG_isBMP;\x0ada_IMG_isGIF IMG_isGIF;\x0ada_IMG_isJPG IMG_isJPG;\x0ada_IMG_isLBM IMG_isLBM;\x0ada_IMG_isPCX IMG_isPCX;\x0ada_IMG_isPNG IMG_isPNG;\x0ada_IMG_isPNM IMG_isPNM;\x0ada_IMG_isTIF IMG_isTIF;\x0ada_IMG_isXCF IMG_isXCF;\x0ada_IMG_isXPM IMG_isXPM;\x0ada_IMG_isXV IMG_isXV;\x0ada_IMG_isICO IMG_isICO;\x0ada_IMG_isCUR IMG_isCUR;\x0ada_IMG_LoadBMP_RW IMG_LoadBMP_RW;\x0ada_IMG_LoadGIF_RW IMG_LoadGIF_RW;\x0ada_IMG_LoadJPG_RW IMG_LoadJPG_RW;\x0ada_IMG_LoadLBM_RW IMG_LoadLBM_RW;\x0ada_IMG_LoadPCX_RW IMG_LoadPCX_RW;\x0ada_IMG_LoadPNG_RW IMG_LoadPNG_RW;\x0ada_IMG_LoadPNM_RW IMG_LoadPNM_RW;\x0ada_IMG_LoadTGA_RW IMG_LoadTGA_RW;\x0ada_IMG_LoadTIF_RW IMG_LoadTIF_RW;\x0ada_IMG_LoadXCF_RW IMG_LoadXCF_RW;\x0ada_IMG_LoadXPM_RW IMG_LoadXPM_RW;\x0ada_IMG_LoadXV_RW IMG_LoadXV_RW;\x0ada_IMG_LoadICO_RW IMG_LoadICO_RW;\x0ada_IMG_LoadCUR_RW IMG_LoadCUR_RW;\x0ada_IMG_ReadXPMFromArray IMG_ReadXPMFromArray;\x0a");
class DerelictSDLImageLoader : SharedLibLoader
{
    public 
{
    this()
{
super("SDL_image.dll","libSDL_image.so, libSDL_image-1.2.so, libSDL_image-1.2.so.0","../Frameworks/SDL_image.framework/SDL_image, /Library/Frameworks/SDL_image.framework/SDL_image, /System/Library/Frameworks/SDL_image.framework/SDL_image");
}
    protected override void loadSymbols();


}
}
DerelictSDLImageLoader DerelictSDLImage;
static this();
