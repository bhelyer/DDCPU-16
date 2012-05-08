module wmain;

import core.runtime;
import core.thread;
import core.sys.windows.windows;
import std.array;
import std.conv;
import std.datetime;
import std.file : read, exists;
import std.getopt;
import std.utf;
import std.stdio;

import derelict.opengl.gl;
import derelict.opengl.wgl;

static import clock;
import dcpu16.cpu;
import floppy;
import display;

alias clock.Clock DClock;

pragma(lib, "comdlg32");
pragma(lib, "gdi32");
pragma(lib, "DerelictUtil");
pragma(lib, "DerelictGL");

extern (Windows) {
    struct WNDCLASSEXW {
        UINT      cbSize = WNDCLASSEXW.sizeof;
        UINT      style;
        WNDPROC   lpfnWndProc;
        int       cbClsExtra;
        int       cbWndExtra;
        HINSTANCE hInstance;
        HICON     hIcon;
        HCURSOR   hCursor;
        HBRUSH    hbrBackground;
        LPCWSTR   lpszMenuName;
        LPCWSTR   lpszClassName;
        HICON     hIconSm;
    }

    struct CLIENTCREATESTRUCT {
        HANDLE hWindowMenu;
        UINT   idFirstChild;
    }

    struct MDICREATESTRUCTW {
        LPCWSTR szClass;
        LPCWSTR szTitle;
        HANDLE hOwner;
        int x;
        int y;
        int cx;
        int cy;
        DWORD style;
        LPARAM lParam;
    }

    ATOM RegisterClassExW(WNDCLASSEXW*);
    int DrawTextW(HDC, LPCWSTR, int, LPRECT, UINT);
    DWORD CommDlgExtendedError();
    HWND CreateWindowExW(DWORD, LPCWSTR, LPCWSTR, DWORD, int, int, int, int, HWND, HMENU, HINSTANCE, LPVOID);
    HWND CreateMDIWindowW(LPCWSTR, LPCWSTR, DWORD, int, int, int, int, HWND, HINSTANCE, LPARAM);
    BOOL GetMessageW(LPMSG, HWND, UINT, UINT);
    BOOL PeekMessageW(LPMSG, HWND, UINT, UINT, UINT);
    LRESULT SendMessageW(HWND, UINT, WPARAM, LPARAM);
    LRESULT DispatchMessageW(MSG*);
    LRESULT DefMDIChildProcW(HWND, UINT, WPARAM, LPARAM);
    LRESULT DefFrameProcW(HWND, HWND, UINT, WPARAM, LPARAM);
    int ChoosePixelFormat(HDC, PIXELFORMATDESCRIPTOR*);
    BOOL SwapBuffers(HDC);

    enum OFN_FILEMUSTEXIST = 0x001000;
    enum DT_CENTER = 1;
    enum DT_VCENTER = 4;
    enum DT_SINGLELINE = 32;
    enum WM_MDICREATE = 544;
    enum PFD_MAIN_PLANE = 0;
    enum PFD_TYPE_RGBA = 0;
    enum PFD_DOUBLEBUFFER = 0x00000001;
    enum PFD_DRAW_TO_WINDOW = 0x00000004;
    enum PFD_SUPPORT_OPENGL = 0x00000020;
}

enum CLOCKSPEED = 100_000;  // In hertz
enum FPS = 60;
enum SCALING = 4;
enum TW = 4 * SCALING;  // tile width
enum TH = 8 * SCALING;  // tile height
enum WIDTH = 32;  // in tiles
enum HEIGHT = 12; // in tiles
enum BORDERWIDTH = 8 * SCALING;
enum SWIDTH = WIDTH * TW + BORDERWIDTH * 2;
enum SHEIGHT = HEIGHT * TH + BORDERWIDTH * 2;

string szVideoPane = "MdiVideoPane";
HWND hwndClient, hwndChild;
HINSTANCE hinst;
HGLRC hrc;

extern (Windows) int WinMain(HINSTANCE hInstance, HINSTANCE hPrevInstance, LPSTR lpCmdLine, int nCmdShow)
{
    int result;
    HWND hwnd;

    void exceptionHandler(Throwable e) { throw e; }
    
    try {
        Runtime.initialize(&exceptionHandler);
        result = entry(hInstance, hPrevInstance, lpCmdLine, nCmdShow, hwnd);
        Runtime.terminate(&exceptionHandler);
    } catch (Throwable e) {
        MessageBoxW(hwnd, toUTF16z(e.toString()), toUTF16z("Error"w), MB_OK | MB_ICONERROR);
        result = 0;
    }

    return result;
}

int entry(HINSTANCE hInstance, HINSTANCE hPrevInstance, LPSTR lpCmdLine, int nCmdShow, out HWND hwnd)
{
    string[] args = "DDCPU_16" ~ to!string(lpCmdLine).split();
    string rom;
    string disk;

    getopt(args, "disk", &disk);

    if (args.length == 1) {
        if (exists("intro.dcpu")) {
            rom = "intro.dcpu";
        } else {
            rom = fileDialog(".");
        }
        if (rom.length == 0) {
            writeln("usage: ddcpu16 <rom>");
            return 0;
        }
    } else {
        rom = args[1];
    }

    hinst = hInstance;
    const(wchar)* appname = toUTF16z("DDCPU_16"w);
    WNDCLASSEXW wndclass;
    MSG msg;

    DerelictGL.load();

    // Frame window.
    wndclass.style  = CS_HREDRAW | CS_VREDRAW;
    wndclass.cbSize = wndclass.sizeof;
    wndclass.lpfnWndProc = &frameWndProc;
    wndclass.hInstance = hInstance;
    wndclass.hIcon = LoadIconW(null, cast(wchar*) IDI_APPLICATION);
    wndclass.hCursor = LoadCursorW(null, cast(wchar*) IDC_ARROW);
    wndclass.hbrBackground = cast(HBRUSH)(COLOR_APPWORKSPACE + 1);
    wndclass.lpszClassName = appname;

    if (RegisterClassExW(&wndclass) == 0) {
        throw new Exception("RegisterClassExW failure: " ~ to!string(GetLastError()));
    }

    // Video output window.
    wndclass.style = CS_HREDRAW | CS_VREDRAW;
    wndclass.cbSize = wndclass.sizeof;
    wndclass.lpfnWndProc = &videoWndProc;
    wndclass.hInstance = hInstance;
    wndclass.hIcon = LoadIconW(null, cast(wchar*) IDI_APPLICATION);
    wndclass.hCursor = LoadCursorW(null, cast(wchar*) IDC_ARROW);
    wndclass.hbrBackground = cast(HBRUSH) GetStockObject(WHITE_BRUSH);
    wndclass.lpszClassName = szVideoPane.toUTF16z();

    if (RegisterClassExW(&wndclass) == 0) {
        throw new Exception("RegisterClassExW failure: " ~ to!string(GetLastError()));
    }

    // Create the frame.
    hwnd = CreateWindowExW(0,
                           appname,              // window class name
                           appname,              // window caption
                           WS_OVERLAPPEDWINDOW,  // window style
                           CW_USEDEFAULT,        // initial x position
                           CW_USEDEFAULT,        // initial y position
                           CW_USEDEFAULT,        // initial x size
                           CW_USEDEFAULT,        // initial y size
                           null,                 // parent window handle
                           null,                 // window menu handle
                           hInstance,            // program instance handle
                           null);                // creation parameters

    ShowWindow(hwnd, nCmdShow);
    UpdateWindow(hwnd);

    glGetError();  // Clear any error flags.

    GLuint texture;
    glGenTextures(1, &texture);
    assert(glGetError() == GL_NO_ERROR);

    glBindTexture(GL_TEXTURE_2D, texture);
    assert(glGetError() == GL_NO_ERROR);

    glTexParameterf(GL_TEXTURE_2D, GL_TEXTURE_WRAP_S, GL_CLAMP);
    glTexParameterf(GL_TEXTURE_2D, GL_TEXTURE_WRAP_T, GL_CLAMP);
    glTexParameterf(GL_TEXTURE_2D, GL_TEXTURE_MAG_FILTER, GL_LINEAR);
    glTexParameterf(GL_TEXTURE_2D, GL_TEXTURE_MIN_FILTER, GL_LINEAR);
    glEnable(GL_TEXTURE_2D);
    assert(glGetError() == GL_NO_ERROR);

    auto cpu = new CPU();

    auto display = new Display();
    cpu.register(display);

    auto dclock = new DClock();
    cpu.register(dclock);

    Floppy floppy;
    if (disk.length > 0) {
        floppy = new Floppy(disk);
        cpu.register(floppy);
    }

    auto prog = cast(ushort[]) read(rom);
    cpu.load(prog);

    long lastBlinkToggle;
    MAINLOOP: while (true) {
        if (PeekMessageW(&msg, null, 0, 0, PM_REMOVE)) {
            TranslateMessage(&msg);
            DispatchMessageW(&msg);
            if (msg.message == WM_QUIT) {
                break MAINLOOP;
            }
        }
        dclock.tick();

        SysTime a = Clock.currTime();

        cpu.run(CLOCKSPEED/FPS);
        display.render();
        glTexImage2D(GL_TEXTURE_2D, 0, GL_RGBA, SWIDTH, SHEIGHT, 0, GL_RGBA, GL_UNSIGNED_BYTE, display.texture.ptr);


        HDC hdc = GetDC(hwndChild);
        glClear(GL_COLOR_BUFFER_BIT);

        glBegin(GL_QUADS);
            glTexCoord2i(0,1);
            glVertex2i(0,0);
            
            glTexCoord2i(1,1); 
            glVertex2i(1,0);
            
            glTexCoord2i(1,0); 
            glVertex2i(1,1);

            glTexCoord2i(0,0); 
            glVertex2i(0,1);
        glEnd();

        glFlush();
        SwapBuffers(hdc);
        ReleaseDC(hwndChild, hdc);

        if (cpu.cycleCount - lastBlinkToggle >= 100_000) {
            display.blink = !display.blink;
            lastBlinkToggle = cpu.cycleCount;
        }

        SysTime b = Clock.currTime();

        Thread.sleep(dur!"msecs"(16));
        Duration delta = b - a;
        if (delta < dur!"msecs"(1000/FPS)) {
            Thread.sleep(dur!"msecs"(1000/FPS) - delta);
        }
    }

    glDeleteTextures(1, &texture);
    disableOpenGL(hwndChild, hrc);

    return msg.wParam;
}

extern (Windows) LRESULT frameWndProc(HWND hwnd, UINT message, WPARAM wParam, LPARAM lParam)
{
    HDC hdc;
    PAINTSTRUCT ps;
    RECT rect;
    MDICREATESTRUCTW mdicreate;
    CLIENTCREATESTRUCT clientcreate;
    

    switch (message)
    {
        case WM_CREATE:
            hwndClient = CreateWindowExW(0, toUTF16z("MDICLIENT"w), null,
                                      WS_CHILD | WS_CLIPCHILDREN | WS_VISIBLE,
                                      0, 0, 0, 0, hwnd, cast(HMENU) 1, hinst,
                                      cast(void*) &clientcreate);

            mdicreate.szClass = szVideoPane.toUTF16z();
            mdicreate.szTitle = toUTF16z("Video Output"w);
            mdicreate.hOwner  = hinst;
            mdicreate.x       = CW_USEDEFAULT;
            mdicreate.y       = CW_USEDEFAULT;
            mdicreate.cx      = SWIDTH;
            mdicreate.cy      = SHEIGHT;

            hwndChild = cast(HWND) SendMessageW(hwndClient, WM_MDICREATE, 0, cast(LPARAM) cast(MDICREATESTRUCTW*) &mdicreate);
            return 0;
        case WM_DESTROY:
            PostQuitMessage(0);
            return 0;
        default:
            break;
    }

    return DefFrameProcW(hwnd, hwndClient, message, wParam, lParam);
}

extern (Windows) LRESULT videoWndProc(HWND hwnd, UINT message, WPARAM wParam, LPARAM lParam)
{
    switch (message)
    {
        case WM_SIZE:
            disableOpenGL(hwnd, hrc);
            hrc = enableOpenGL(hwnd);
            return 0;
        default:
            break;
    }

    return DefMDIChildProcW(hwnd, message, wParam, lParam);
}

HGLRC enableOpenGL(HWND hwnd)
{
    PIXELFORMATDESCRIPTOR pfd;
    
    HDC hdc = GetDC(hwnd);
    if (hdc is null) {
        throw new Exception("GetDC failure.");
    }

    pfd.nSize = pfd.sizeof;
    pfd.nVersion = 1;
    pfd.dwFlags = PFD_DRAW_TO_WINDOW | PFD_SUPPORT_OPENGL | PFD_DOUBLEBUFFER;
    pfd.iPixelType = PFD_TYPE_RGBA;
    pfd.cColorBits = 24;
    pfd.cDepthBits = 16;
    pfd.iLayerType = PFD_MAIN_PLANE;
    int iFormat = ChoosePixelFormat(hdc, &pfd);
    SetPixelFormat(hdc, iFormat, &pfd);

    HGLRC hrc = wglCreateContext(hdc);
    if (hrc is null) {
        throw new Exception("wglCreateContext failure.");
    }
    wglMakeCurrent(hdc, hrc);

    GLVersion loaded = DerelictGL.loadClassicVersions(GLVersion.GL21);
    if (loaded != GLVersion.GL21) {
        throw new Exception("Failed to load OpenGL.");
    }

    glClearColor(0, 0, 0, 0);
    glMatrixMode(GL_PROJECTION);
    glLoadIdentity();
    glOrtho(0, 1, 0, 1, -1, 1);

    return hrc;
}

void disableOpenGL(HWND hwnd, HGLRC hrc)
{
    wglMakeCurrent(null, null);
    wglDeleteContext(hrc);
}

/**
 * Open an 'open file' dialog at cwd and block until you get a result.
 * Returns: the selected file, or an empty string on cancellation.
 */
string fileDialog(string cwd)
{ 
    wchar[] buf = new wchar[1024];
    buf[] = 0;

    OPENFILENAMEW ofn;
    ofn.lStructSize = OPENFILENAMEW.sizeof;
    ofn.lpstrFile = buf.ptr;
    ofn.nMaxFile = 1024;
    ofn.lpstrInitialDir = toUTF16z(cwd);
    ofn.Flags = OFN_FILEMUSTEXIST;

    BOOL retval = GetOpenFileNameW(&ofn);
    if (retval == 0) {
        DWORD errorCode = CommDlgExtendedError();
        if (errorCode == 0) {
            // Just a cancel.
            return "";
        }
        throw new Exception("GetOpenFileNameW failure.");
    }

    return to!string(buf);
}