// D import file generated from 'derelict\util\wintypes.d'
module derelict.util.wintypes;
private import derelict.util.compat;

version (Windows)
{
    alias uint DWORD;
    alias ushort WORD;
    alias ushort USHORT;
    alias uint UINT;
    alias int INT;
    alias int LONG;
    alias ubyte BYTE;
    alias float FLOAT;
    alias int BOOL;
    alias DWORD COLORREF;
    alias CCPTR LPCSTR;
    alias void* LPVOID;
    alias void* HANDLE;
    alias HANDLE HDC;
    alias HANDLE HGLRC;
    alias HANDLE HINSTANCE;
    alias HANDLE HMODULE;
    alias HANDLE HWND;
    alias HANDLE HLOCAL;
    alias HANDLE HPALETTE;
    alias HANDLE HBITMAP;
    alias UINT WPARAM;
    alias LONG LPARAM;
    alias int function() FARPROC;
    struct LAYERPLANEDESCRIPTOR
{
    WORD nSize;
    WORD nVersion;
    DWORD dwFlags;
    BYTE iPixelType;
    BYTE cColorBits;
    BYTE cRedBits;
    BYTE cRedShift;
    BYTE cGreenBits;
    BYTE cGreenShift;
    BYTE cBlueBits;
    BYTE cBlueShift;
    BYTE cAlphaBits;
    BYTE cAlphaShift;
    BYTE cAccumBits;
    BYTE cAccumRedBits;
    BYTE cAccumGreenBits;
    BYTE cAccumBlueBits;
    BYTE cAccumAlphaBits;
    BYTE cDepthBits;
    BYTE cStencilBits;
    BYTE cAuxBuffers;
    BYTE iLayerPlane;
    BYTE bReserved;
    COLORREF crTransparent;
}
    struct POINTFLOAT
{
    FLOAT x;
    FLOAT y;
}
    struct GLYPHMETRICSFLOAT
{
    FLOAT gmfBlackBoxX;
    FLOAT gmfBlackBoxY;
    POINTFLOAT gmfptGlyphOrigin;
    FLOAT gmfCellIncX;
    FLOAT gmfCellIncY;
}
    struct PIXELFORMATDESCRIPTOR
{
    WORD nSize;
    WORD nVersion;
    DWORD dwFlags;
    BYTE iPixelType;
    BYTE cColorBits;
    BYTE cRedBits;
    BYTE cRedShift;
    BYTE cGreenBits;
    BYTE cGreenShift;
    BYTE cBlueBits;
    BYTE cBlueShift;
    BYTE cAlphaBits;
    BYTE cAlphaShift;
    BYTE cAccumBits;
    BYTE cAccumRedBits;
    BYTE cAccumGreenBits;
    BYTE cAccumBlueBits;
    BYTE cAccumAlphaBits;
    BYTE cDepthBits;
    BYTE cStencilBits;
    BYTE cAuxBuffers;
    BYTE iLayerType;
    BYTE bReserved;
    DWORD dwLayerMask;
    DWORD dwVisibleMask;
    DWORD dwDamageMask;
}
    struct VA_LIST
{
}
    enum : BYTE
{
PFD_TYPE_RGBA = 0,
PFD_TYPE_COLORINDEX = 1,
}
    enum 
{
PFD_MAIN_PLANE = 0,
PFD_OVERLAY_PLANE = 1,
PFD_UNDERLAY_PLANE = -1,
}
    enum 
{
PFD_DOUBLEBUFFER = 1,
PFD_STEREO = 2,
PFD_DRAW_TO_WINDOW = 4,
PFD_DRAW_TO_BITMAP = 8,
PFD_SUPPORT_GDI = 16,
PFD_SUPPORT_OPENGL = 32,
PFD_GENERIC_FORMAT = 64,
PFD_NEED_PALETTE = 128,
PFD_NEED_SYSTEM_PALETTE = 256,
PFD_SWAP_EXCHANGE = 512,
PFD_SWAP_COPY = 1024,
PFD_SWAP_LAYER_BUFFERS = 2048,
PFD_GENERIC_ACCELERATED = 4096,
PFD_SUPPORT_DIRECTDRAW = 8192,
PFD_DEPTH_DONTCARE = 536870912,
PFD_DOUBLBUFFER_DONTCARE = 1073741824,
PFD_STEREO_DONTCARE = -2147483648u,
}
    enum 
{
LANG_NEUTRAL = 0,
SUBLANG_DEFAULT = 1,
FORMAT_MESSAGE_ALLOCATE_BUFFER = 256,
FORMAT_MESSAGE_IGNORE_INSERTS = 512,
FORMAT_MESSAGE_FROM_SYSTEM = 4096,
}
    struct RGBQUAD
{
    BYTE rgbBlue;
    BYTE rgbGreen;
    BYTE rgbRed;
    BYTE rgbReserved;
}
    struct BITMAPINFOHEADER
{
    DWORD biSize;
    LONG biWidth;
    LONG biHeight;
    WORD biPlanes;
    WORD biBitCount;
    DWORD biCompression;
    DWORD biSizeImage;
    LONG biXPelsPerMeter;
    LONG biYPelsPerMeter;
    DWORD biClrUsed;
    DWORD biClrImportant;
}
    struct BITMAPINFO
{
    BITMAPINFOHEADER bmiHeader;
    RGBQUAD[1] bmiColors;
}
    struct RECT
{
    LONG left;
    LONG top;
    LONG right;
    LONG bottom;
}
    extern (Windows) 
{
    int ChoosePixelFormat(HDC, PIXELFORMATDESCRIPTOR*);
    int GetPixelFormat(HDC);
    int DescribePixelFormat(HDC, int, UINT, PIXELFORMATDESCRIPTOR*);
    BOOL SwapBuffers(HDC);
    HMODULE LoadLibraryA(LPCSTR);
    FARPROC GetProcAddress(HMODULE, LPCSTR);
    void FreeLibrary(HMODULE);
    DWORD GetLastError();
    DWORD FormatMessageA(DWORD, in void*, DWORD, DWORD, LPCSTR, DWORD, VA_LIST*);
    HLOCAL LocalFree(HLOCAL);
}
    DWORD MAKELANGID(WORD p, WORD s)
{
return cast(WORD)s << 10 | cast(WORD)p;
}
}
