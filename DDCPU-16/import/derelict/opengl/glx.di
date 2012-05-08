// D import file generated from 'derelict\opengl\glx.d'
module derelict.opengl.glx;
version (freebsd)
{
    version = GLX;
}
else
{
    version (FreeBSD)
{
    version = GLX;
}
else
{
    version (linux)
{
    version = GLX;
}
}
}
version (GLX)
{
    private 
{
    import derelict.opengl.gltypes;
    import derelict.util.compat;
    import derelict.util.loader;
    import derelict.util.xtypes;
}
    struct __GLXcontextRec
{
}
    struct __GLXFBConfigRec
{
}
    alias uint GLXContentID;
    alias uint GLXPixmap;
    alias uint GLXDrawable;
    alias uint GLXPbuffer;
    alias uint GLXWindow;
    alias uint GLXFBConfigID;
    alias __GLXcontextRec* GLXContext;
    alias __GLXFBConfigRec* GLXFBConfig;
    struct GLXPbufferClobberEvent
{
    int event_type;
    int draw_type;
    uint serial;
    Bool send_event;
    Display* display;
    GLXDrawable drawable;
    uint buffer_mask;
    uint aux_buffer;
    int x;
    int y;
    int width;
    int height;
    int count;
}
    union GLXEvent
{
    GLXPbufferClobberEvent glxpbufferclobber;
    int[24] pad;
}
    extern (C) 
{
    alias XVisualInfo* function(Display*, int, int*) da_glXChooseVisual;
    alias void function(Display*, GLXContext, GLXContext, uint) da_glXCopyContext;
    alias GLXContext function(Display*, XVisualInfo*, GLXContext, Bool) da_glXCreateContext;
    alias GLXPixmap function(Display*, XVisualInfo*, Pixmap) da_glXCreateGLXPixmap;
    alias void function(Display*, GLXContext) da_glXDestroyContext;
    alias void function(Display*, GLXPixmap) da_glXDestroyGLXPixmap;
    alias int function(Display*, XVisualInfo*, int, int*) da_glXGetConfig;
    alias GLXContext function() da_glXGetCurrentContext;
    alias GLXDrawable function() da_glXGetCurrentDrawable;
    alias Bool function(Display*, GLXContext) da_glXIsDirect;
    alias Bool function(Display*, GLXDrawable, GLXContext) da_glXMakeCurrent;
    alias Bool function(Display*, int*, int*) da_glXQueryExtension;
    alias Bool function(Display*, int*, int*) da_glXQueryVersion;
    alias void function(Display*, GLXDrawable) da_glXSwapBuffers;
    alias void function(Font, int, int, int) da_glXUseXFont;
    alias void function() da_glXWaitGL;
    alias void function() da_glXWaitX;
    alias char* function(Display*, int) da_glXGetClientString;
    alias char* function(Display*, int, int) da_glXQueryServerString;
    alias char* function(Display*, int) da_glXQueryExtensionsString;
    alias GLXFBConfig* function(Display*, int, int*) da_glXGetFBConfigs;
    alias GLXFBConfig* function(Display*, int, int*, int*) da_glXChooseFBConfig;
    alias int function(Display*, GLXFBConfig, int, int*) da_glXGetFBConfigAttrib;
    alias XVisualInfo* function(Display*, GLXFBConfig) da_glXGetVisualFromFBConfig;
    alias GLXWindow function(Display*, GLXFBConfig, Window, int*) da_glXCreateWindow;
    alias void function(Display*, GLXWindow) da_glXDestroyWindow;
    alias GLXPixmap function(Display*, GLXFBConfig, Pixmap, int*) da_glXCreatePixmap;
    alias void function(Display*, GLXPixmap) da_glXDestroyPixmap;
    alias GLXPbuffer function(Display*, GLXFBConfig, int*) da_glXCreatePbuffer;
    alias void function(Display*, GLXPbuffer) da_glXDestroyPbuffer;
    alias void function(Display*, GLXDrawable, int, uint*) da_glXQueryDrawable;
    alias GLXContext function(Display*, GLXFBConfig, int, GLXContext, Bool) da_glXCreateNewContext;
    alias Bool function(Display*, GLXDrawable, GLXDrawable, GLXContext) da_glXMakeContextCurrent;
    alias GLXDrawable function() da_glXGetCurrentReadDrawable;
    alias Display* function() da_glXGetCurrentDisplay;
    alias int function(Display*, GLXContext, int, int*) da_glXQueryContext;
    alias void function(Display*, GLXDrawable, uint) da_glXSelectEvent;
    alias void function(Display*, GLXDrawable, uint*) da_glXGetSelectedEvent;
    alias void* function(CCPTR) da_glXGetProcAddress;
}
    mixin(gsharedString!() ~ "\x0ada_glXChooseVisual glXChooseVisual;\x0ada_glXCopyContext glXCopyContext;\x0ada_glXCreateContext glXCreateContext;\x0ada_glXCreateGLXPixmap glXCreateGLXPixmap;\x0ada_glXDestroyContext glXDestroyContext;\x0ada_glXDestroyGLXPixmap glXDestroyGLXPixmap;\x0ada_glXGetConfig glXGetConfig;\x0ada_glXGetCurrentContext glXGetCurrentContext;\x0ada_glXGetCurrentDrawable glXGetCurrentDrawable;\x0ada_glXIsDirect glXIsDirect;\x0ada_glXMakeCurrent glXMakeCurrent;\x0ada_glXQueryExtension glXQueryExtension;\x0ada_glXQueryVersion glXQueryVersion;\x0ada_glXSwapBuffers glXSwapBuffers;\x0ada_glXUseXFont glXUseXFont;\x0ada_glXWaitGL glXWaitGL;\x0ada_glXWaitX glXWaitX;\x0ada_glXGetClientString glXGetClientString;\x0ada_glXQueryServerString glXQueryServerString;\x0ada_glXQueryExtensionsString glXQueryExtensionsString;\x0a\x0a/* GLX 1.3 */\x0a\x0ada_glXGetFBConfigs glXGetFBConfigs;\x0ada_glXChooseFBConfig glXChooseFBConfig;\x0ada_glXGetFBConfigAttrib glXGetFBConfigAttrib;\x0ada_glXGetVisualFromFBConfig glXGetVisualFromFBConfig;\x0ada_glXCreateWindow glXCreateWindow;\x0ada_glXDestroyWindow glXDestroyWindow;\x0ada_glXCreatePixmap glXCreatePixmap;\x0ada_glXDestroyPixmap glXDestroyPixmap;\x0ada_glXCreatePbuffer glXCreatePbuffer;\x0ada_glXDestroyPbuffer glXDestroyPbuffer;\x0ada_glXQueryDrawable glXQueryDrawable;\x0ada_glXCreateNewContext glXCreateNewContext;\x0ada_glXMakeContextCurrent glXMakeContextCurrent;\x0ada_glXGetCurrentReadDrawable glXGetCurrentReadDrawable;\x0ada_glXGetCurrentDisplay glXGetCurrentDisplay;\x0ada_glXQueryContext glXQueryContext;\x0ada_glXSelectEvent glXSelectEvent;\x0ada_glXGetSelectedEvent glXGetSelectedEvent;\x0a\x0a/* GLX 1.4+ */\x0ada_glXGetProcAddress glXGetProcAddress;\x0a\x0a");
    package 
{
    void loadPlatformGL(void delegate(void**, string, bool doThrow = true) bindFunc)
{
bindFunc(cast(void**)&glXChooseVisual,"glXChooseVisual");
bindFunc(cast(void**)&glXCopyContext,"glXCopyContext");
bindFunc(cast(void**)&glXCreateContext,"glXCreateContext");
bindFunc(cast(void**)&glXCreateGLXPixmap,"glXCreateGLXPixmap");
bindFunc(cast(void**)&glXDestroyContext,"glXDestroyContext");
bindFunc(cast(void**)&glXDestroyGLXPixmap,"glXDestroyGLXPixmap");
bindFunc(cast(void**)&glXGetConfig,"glXGetConfig");
bindFunc(cast(void**)&glXGetCurrentContext,"glXGetCurrentContext");
bindFunc(cast(void**)&glXGetCurrentDrawable,"glXGetCurrentDrawable");
bindFunc(cast(void**)&glXIsDirect,"glXIsDirect");
bindFunc(cast(void**)&glXMakeCurrent,"glXMakeCurrent");
bindFunc(cast(void**)&glXQueryExtension,"glXQueryExtension");
bindFunc(cast(void**)&glXQueryVersion,"glXQueryVersion");
bindFunc(cast(void**)&glXSwapBuffers,"glXSwapBuffers");
bindFunc(cast(void**)&glXUseXFont,"glXUseXFont");
bindFunc(cast(void**)&glXWaitGL,"glXWaitGL");
bindFunc(cast(void**)&glXWaitX,"glXWaitX");
bindFunc(cast(void**)&glXGetClientString,"glXGetClientString");
bindFunc(cast(void**)&glXQueryServerString,"glXQueryServerString");
bindFunc(cast(void**)&glXQueryExtensionsString,"glXQueryExtensionsString");
bindFunc(cast(void**)&glXGetFBConfigs,"glXGetFBConfigs");
bindFunc(cast(void**)&glXChooseFBConfig,"glXChooseFBConfig");
bindFunc(cast(void**)&glXGetFBConfigAttrib,"glXGetFBConfigAttrib");
bindFunc(cast(void**)&glXGetVisualFromFBConfig,"glXGetVisualFromFBConfig");
bindFunc(cast(void**)&glXCreateWindow,"glXCreateWindow");
bindFunc(cast(void**)&glXDestroyWindow,"glXDestroyWindow");
bindFunc(cast(void**)&glXCreatePixmap,"glXCreatePixmap");
bindFunc(cast(void**)&glXDestroyPixmap,"glXDestroyPixmap");
bindFunc(cast(void**)&glXCreatePbuffer,"glXCreatePbuffer");
bindFunc(cast(void**)&glXDestroyPbuffer,"glXDestroyPbuffer");
bindFunc(cast(void**)&glXQueryDrawable,"glXQueryDrawable");
bindFunc(cast(void**)&glXCreateNewContext,"glXCreateNewContext");
bindFunc(cast(void**)&glXMakeContextCurrent,"glXMakeContextCurrent");
bindFunc(cast(void**)&glXGetCurrentReadDrawable,"glXGetCurrentReadDrawable");
bindFunc(cast(void**)&glXGetCurrentDisplay,"glXGetCurrentDisplay");
bindFunc(cast(void**)&glXQueryContext,"glXQueryContext");
bindFunc(cast(void**)&glXSelectEvent,"glXSelectEvent");
bindFunc(cast(void**)&glXGetSelectedEvent,"glXGetSelectedEvent");
bindFunc(cast(void**)&glXGetProcAddress,"glXGetProcAddressARB");
}
    void* loadGLSymbol(string symName)
{
return glXGetProcAddress(toCString(symName));
}
}
}
