// D import file generated from 'derelict\opengl\cgl.d'
module derelict.opengl.cgl;
version (darwin)
{
    version = CGL;
}
else
{
    version (OSX)
{
    version = CGL;
}
}
version (CGL)
{
    private 
{
    import derelict.opengl.gltypes;
    import derelict.util.compat;
    import derelict.util.loader;
}
    struct _CGLContextObject
{
}
    struct _CGLPixelFormatObject
{
}
    struct _CGLRendererInfoObject
{
}
    struct _CGLPBufferObject
{
}
    alias _CGLContextObject* CGLContextObj;
    alias _CGLPixelFormatObject* CGLPixelFormatObj;
    alias _CGLRendererInfoObject* CGLRendererInfoObj;
    alias _CGLPBufferObject* CGLPBufferObj;
    enum CGLPixelFormatAttribute 
{
kCGLPFAAllRenderers = 1,
kCGLPFADoubleBuffer = 5,
kCGLPFAStereo = 6,
kCGLPFAAuxBuffers = 7,
kCGLPFAColorSize = 8,
kCGLPFAAlphaSize = 11,
kCGLPFADepthSize = 12,
kCGLPFAStencilSize = 13,
kCGLPFAAccumSize = 14,
kCGLPFAMinimumPolicy = 51,
kCGLPFAMaximumPolicy = 52,
kCGLPFAOffScreen = 53,
kCGLPFAFullScreen = 54,
kCGLPFASampleBuffers = 55,
kCGLPFASamples = 56,
kCGLPFAAuxDepthStencil = 57,
kCGLPFAColorFloat = 58,
kCGLPFAMultisample = 59,
kCGLPFASupersample = 60,
kCGLPFASampleAlpha = 61,
kCGLPFARendererID = 70,
kCGLPFASingleRenderer = 71,
kCGLPFANoRecovery = 72,
kCGLPFAAccelerated = 73,
kCGLPFAClosestPolicy = 74,
kCGLPFARobust = 75,
kCGLPFABackingStore = 76,
kCGLPFAMPSafe = 78,
kCGLPFAWindow = 80,
kCGLPFAMultiScreen = 81,
kCGLPFACompliant = 83,
kCGLPFADisplayMask = 84,
kCGLPFAPBuffer = 90,
kCGLPFARemotePBuffer = 91,
kCGLPFAVirtualScreenCount = 128,
}
    enum CGLRendererProperty 
{
kCGLRPOffScreen = 53,
kCGLRPFullScreen = 54,
kCGLRPRendererID = 70,
kCGLRPAccelerated = 73,
kCGLRPRobust = 75,
kCGLRPBackingStore = 76,
kCGLRPMPSafe = 78,
kCGLRPWindow = 80,
kCGLRPMultiScreen = 81,
kCGLRPCompliant = 83,
kCGLRPDisplayMask = 84,
kCGLRPBufferModes = 100,
kCGLRPColorModes = 103,
kCGLRPAccumModes = 104,
kCGLRPDepthModes = 105,
kCGLRPStencilModes = 106,
kCGLRPMaxAuxBuffers = 107,
kCGLRPMaxSampleBuffers = 108,
kCGLRPMaxSamples = 109,
kCGLRPSampleModes = 110,
kCGLRPSampleAlpha = 111,
kCGLRPVideoMemory = 120,
kCGLRPTextureMemory = 121,
kCGLRPGPUVertProcCapable = 122,
kCGLRPGPUFragProcCapable = 123,
kCGLRPRendererCount = 128,
}
    enum CGLContextEnable 
{
kCGLCESwapRectangle = 201,
kCGLCESwapLimit = 203,
kCGLCERasterization = 221,
kCGLCEStateValidation = 301,
kCGLCESurfaceBackingSize = 305,
kCGLCEDisplayListOptimization = 307,
kCGLCEMPEngine = 313,
}
    enum CGLContextParameter 
{
kCGLCPSwapRectangle = 200,
kCGLCPSwapInterval = 222,
kCGLCPDispatchTableSize = 224,
kCGLCPClientStorage = 226,
kCGLCPSurfaceTexture = 228,
kCGLCPSurfaceOrder = 235,
kCGLCPSurfaceOpacity = 236,
kCGLCPSurfaceBackingSize = 304,
kCGLCPSurfaceSurfaceVolatile = 306,
kCGLCPReclaimResources = 308,
kCGLCPCurrentRendererID = 309,
kCGLCPGPUVertexProcessing = 310,
kCGLCPGPUFragmentProcessing = 311,
}
    enum CGLGlobalOption 
{
kCGLGOFormatCacheSize = 501,
kCGLGOClearFormatCache = 502,
kCGLGORetainRenderers = 503,
kCGLGOResetLibrary = 504,
kCGLGOUseErrorHandler = 505,
}
    enum CGLError 
{
kCGLNoError = 0,
kCGLBadAttribute = 10000,
kCGLBadProperty = 10001,
kCGLBadPixelFormat = 10002,
kCGLBadRendererInfo = 10003,
kCGLBadContext = 10004,
kCGLBadDrawable = 10005,
kCGLBadDisplay = 10006,
kCGLBadState = 10007,
kCGLBadValue = 10008,
kCGLBadMatch = 10009,
kCGLBadEnumeration = 10010,
kCGLBadOffScreen = 10011,
kCGLBadFullScreen = 10012,
kCGLBadWindow = 10013,
kCGLBadAddress = 10014,
kCGLBadCodeModule = 10015,
kCGLBadAlloc = 10016,
kCGLBadConnection = 10017,
}
    extern (C) mixin(gsharedString!() ~ "\x0a        /*\x0a        ** Pixel format functions\x0a        */\x0a        CGLError function(CGLPixelFormatAttribute*, CGLPixelFormatObj*, int*) CGLChoosePixelFormat;\x0a        CGLError function(CGLPixelFormatObj) CGLDestroyPixelFormat;\x0a        CGLError function(CGLPixelFormatObj, int, CGLPixelFormatAttribute, int*) CGLDescribePixelFormat;\x0a\x0a        /*\x0a        ** Renderer information functions\x0a        */\x0a        CGLError function(uint, CGLRendererInfoObj*, int*) CGLQueryRendererInfo;\x0a        CGLError function(CGLRendererInfoObj) CGLDestroyRendererInfo;\x0a        CGLError function(CGLRendererInfoObj, int, CGLRendererProperty, int*) CGLDescribeRenderer;\x0a\x0a        /*\x0a        ** Context functions\x0a        */\x0a        CGLError function(CGLPixelFormatObj, CGLContextObj, CGLContextObj*) CGLCreateContext;\x0a        CGLError function(CGLContextObj) CGLDestroyContext;\x0a        CGLError function(CGLContextObj, CGLContextObj, uint) CGLCopyContext;\x0a\x0a        /*\x0a        ** PBuffer functions\x0a        */\x0a        // FIXME\x0a        // These functions use the AVAILABLE_MAC_OS_X_VERSION_10_3_AND_LATER macro. See\x0a        // <AvailabilityMacros.h>.\x0a        version (Mac_OS_X_10_3_and_later)\x0a        {\x0a        CGLError function(int, int, uint, uint, int, CGLPBufferObj*) CGLCreatePBuffer;\x0a        CGLError function(CGLPBufferObj) CGLDestroyPBuffer;\x0a        CGLError function(CGLPBufferObj, int*, int*, uint*, uint*, int*) CGLDescribePBuffer;\x0a        CGLError function(CGLContextObj, CGLPBufferObj, uint) CGLTexImagePBuffer;\x0a        }\x0a\x0a        /*\x0a        ** Drawable Functions\x0a        */\x0a        CGLError function(CGLContextObj, int, int, int, void*) CGLSetOffScreen;\x0a        CGLError function(CGLContextObj, int*, int*, int*, void **baseaddr) CGLGetOffScreen;\x0a        CGLError function(CGLContextObj) CGLSetFullScreen;\x0a\x0a        version (Mac_OS_X_10_3_and_later)\x0a        {\x0a        CGLError function(CGLContextObj, CGLPBufferObj, uint, int, int) CGLSetPBuffer;\x0a        CGLError function(CGLContextObj, CGLPBufferObj*, uint*, int*, int*) CGLGetPBuffer;\x0a        }\x0a\x0a        CGLError function(CGLContextObj) CGLClearDrawable;\x0a        CGLError function(CGLContextObj) CGLFlushDrawable;\x0a\x0a        /*\x0a        ** Per context enables and parameters\x0a        */\x0a        CGLError function(CGLContextObj, CGLContextEnable) CGLEnable;\x0a        CGLError function(CGLContextObj, CGLContextEnable) CGLDisable;\x0a        CGLError function(CGLContextObj, CGLContextEnable, int*) CGLIsEnabled;\x0a        CGLError function(CGLContextObj, CGLContextParameter, int*) CGLSetParameter;\x0a        CGLError function(CGLContextObj, CGLContextParameter, int*) CGLGetParameter;\x0a\x0a        /*\x0a        ** Virtual screen functions\x0a        */\x0a        CGLError function(CGLContextObj, int) CGLSetVirtualScreen;\x0a        CGLError function(CGLContextObj, int*) CGLGetVirtualScreen;\x0a\x0a        /*\x0a        ** Global library options\x0a        */\x0a        CGLError function(CGLGlobalOption, int) CGLSetOption;\x0a        CGLError function(CGLGlobalOption, int*) CGLGetOption;\x0a\x0a        /*\x0a        ** Locking functions\x0a        */\x0a        version (Mac_OS_X_10_4_and_later)\x0a        {\x0a        CGLError function(CGLContextObj) CGLLockContext;\x0a        CGLError function(CGLContextObj) CGLUnlockContext;\x0a        }\x0a\x0a        /*\x0a        ** Version numbers\x0a        */\x0a        void function(int*, int*) CGLGetVersion;\x0a\x0a        /*\x0a        ** Convert an error code to a string\x0a        */\x0a        char* function(CGLError) CGLErrorString;\x0a\x0a        /*\x0a        ** Current context functions\x0a        */\x0a        CGLError function(CGLContextObj) CGLSetCurrentContext;\x0a        CGLContextObj function() CGLGetCurrentContext;");

    package void loadPlatformGL(void delegate(void**, string, bool doThrow = true) bindFunc);

}
