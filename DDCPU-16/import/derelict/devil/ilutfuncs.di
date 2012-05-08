// D import file generated from 'derelict\devil\ilutfuncs.d'
module derelict.devil.ilutfuncs;
private 
{
    import derelict.util.compat;
    import derelict.devil.iltypes;
    import derelict.devil.iluttypes;
}
extern (Windows) 
{
    alias ILboolean function(ILenum) da_ilutDisable;
    alias ILboolean function(ILenum) da_ilutEnable;
    alias ILboolean function(ILenum) da_ilutGetBoolean;
    alias ILvoid function(ILenum, ILboolean*) da_ilutGetBooleanv;
    alias ILint function(ILenum) da_ilutGetInteger;
    alias ILvoid function(ILenum, ILint*) da_ilutGetIntegerv;
    alias ILstring function(ILenum) da_ilutGetString;
    alias ILvoid function() da_ilutInit;
    alias ILboolean function(ILenum) da_ilutIsDisabled;
    alias ILboolean function(ILenum) da_ilutIsEnabled;
    alias ILvoid function() da_ilutPopAttrib;
    alias ILvoid function(ILuint) da_ilutPushAttrib;
    alias ILvoid function(ILenum, ILint) da_ilutSetInteger;
    alias ILboolean function(ILenum) da_ilutRenderer;
    alias uint function() da_ilutGLBindTexImage;
    alias uint function() da_ilutGLBindMipmaps;
    alias ILboolean function() da_ilutGLBuildMipmaps;
    alias uint function(ILstring FileName) da_ilutGLLoadImage;
    alias ILboolean function() da_ilutGLScreen;
    alias ILboolean function() da_ilutGLScreenie;
    alias ILboolean function(ILstring, uint) da_ilutGLSaveImage;
    alias ILboolean function(uint) da_ilutGLSetTex;
    alias ILboolean function(uint) da_ilutGLTexImage;
    alias ILboolean function(uint, ILuint, ILuint) da_ilutGLSubTex;
    version (Windows)
{
    private import derelict.util.wintypes;

    alias HBITMAP function(HDC hDC) da_ilutConvertToHBitmap;
    alias ILvoid function(ILubyte* Data) da_ilutFreePaddedData;
    alias ILvoid function(BITMAPINFO* Info) da_ilutGetBmpInfo;
    alias HPALETTE function() da_ilutGetHPal;
    alias ILubyte* function() da_ilutGetPaddedData;
    alias ILboolean function() da_ilutGetWinClipboard;
    alias ILboolean function(HINSTANCE hInst, ILint ID, ILstring ResourceType, ILenum Type) da_ilutLoadResource;
    alias ILboolean function(HBITMAP Bitmap) da_ilutSetHBitmap;
    alias ILboolean function(HPALETTE Pal) da_ilutSetHPal;
    alias ILboolean function() da_ilutSetWinClipboard;
    alias HBITMAP function(ILstring FileName, HDC hDC) da_ilutWinLoadImage;
    alias ILboolean function(ILstring Url) da_ilutWinLoadUrl;
    alias ILboolean function(ILuint XPos, ILuint YPos, ILuint Width, ILuint Height, HDC hDC) da_ilutWinPrint;
    alias ILboolean function(ILstring FileName, HBITMAP Bitmap) da_ilutWinSaveImage;
}
    version (Linux)
{
}
}
mixin(gsharedString!() ~ "\x0ada_ilutDisable ilutDisable;\x0ada_ilutEnable ilutEnable;\x0ada_ilutGetBoolean ilutGetBoolean;\x0ada_ilutGetBooleanv ilutGetBooleanv;\x0ada_ilutGetInteger ilutGetInteger;\x0ada_ilutGetIntegerv ilutGetIntegerv;\x0ada_ilutGetString ilutGetString;\x0ada_ilutInit ilutInit;\x0ada_ilutIsDisabled ilutIsDisabled;\x0ada_ilutIsEnabled ilutIsEnabled;\x0ada_ilutPopAttrib ilutPopAttrib;\x0ada_ilutPushAttrib ilutPushAttrib;\x0ada_ilutSetInteger ilutSetInteger;\x0ada_ilutRenderer ilutRenderer;\x0ada_ilutGLBindTexImage ilutGLBindTexImage;\x0ada_ilutGLBindMipmaps ilutGLBindMipmaps;\x0ada_ilutGLBuildMipmaps ilutGLBuildMipmaps;\x0ada_ilutGLLoadImage ilutGLLoadImage;\x0ada_ilutGLScreen ilutGLScreen;\x0ada_ilutGLScreenie ilutGLScreenie;\x0ada_ilutGLSaveImage ilutGLSaveImage;\x0ada_ilutGLSetTex ilutGLSetTex;\x0ada_ilutGLTexImage ilutGLTexImage;\x0ada_ilutGLSubTex ilutGLSubTex;\x0a\x0aversion(Windows)\x0a{\x0a    da_ilutConvertToHBitmap ilutConvertToHBitmap;\x0a    da_ilutFreePaddedData ilutFreePaddedData;\x0a    da_ilutGetBmpInfo ilutGetBmpInfo;\x0a    da_ilutGetHPal ilutGetHPal;\x0a    da_ilutGetPaddedData ilutGetPaddedData;\x0a    da_ilutGetWinClipboard ilutGetWinClipboard;\x0a    da_ilutLoadResource ilutLoadResource;\x0a    da_ilutSetHBitmap ilutSetHBitmap;\x0a    da_ilutSetHPal ilutSetHPal;\x0a    da_ilutSetWinClipboard ilutSetWinClipboard;\x0a    da_ilutWinLoadImage ilutWinLoadImage;\x0a    da_ilutWinLoadUrl ilutWinLoadUrl;\x0a    da_ilutWinPrint ilutWinPrint;\x0a    da_ilutWinSaveImage ilutWinSaveImage;\x0a}\x0a");
