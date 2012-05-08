// D import file generated from 'derelict\util\sharedlib.d'
module derelict.util.sharedlib;
private 
{
    import derelict.util.exception;
    import derelict.util.compat;
}
version (linux)
{
    version = Nix;
}
else
{
    version (darwin)
{
    version = Nix;
}
else
{
    version (OSX)
{
    version = Nix;
}
else
{
    version (FreeBSD)
{
    version = Nix;
    version = freebsd;
}
else
{
    version (freebsd)
{
    version = Nix;
}
else
{
    version (Unix)
{
    version = Nix;
}
else
{
    version (Posix)
{
    version = Nix;
}
}
}
}
}
}
}
version (Nix)
{
    version (build)
{
    version (freebsd)
{
}
else
{
    pragma (link, "dl");
}
}
    version (Tango)
{
    private import tango.sys.Common;

}
else
{
    version (linux)
{
    private import std.c.linux.linux;

}
else
{
    extern (C) 
{
    const int RTLD_NOW = 2;

    void* dlopen(CCPTR file, int mode);
    int dlclose(void* handle);
    void* dlsym(void* handle, CCPTR name);
    CCPTR dlerror();
}
}
}
    alias void* SharedLibHandle;
    private SharedLibHandle LoadSharedLib(string libName)
{
return dlopen(toCString(libName),RTLD_NOW);
}

    private void UnloadSharedLib(SharedLibHandle hlib)
{
dlclose(hlib);
}

    private void* GetSymbol(SharedLibHandle hlib, string symbolName)
{
return dlsym(hlib,toCString(symbolName));
}

    private string GetErrorStr();

}
else
{
    version (Windows)
{
    private import derelict.util.wintypes;

    alias HMODULE SharedLibHandle;
    private SharedLibHandle LoadSharedLib(string libName)
{
return LoadLibraryA(toCString(libName));
}

    private void UnloadSharedLib(SharedLibHandle hlib)
{
FreeLibrary(hlib);
}

    private void* GetSymbol(SharedLibHandle hlib, string symbolName)
{
return GetProcAddress(hlib,toCString(symbolName));
}

    private string GetErrorStr()
{
DWORD errcode = GetLastError();
LPCSTR msgBuf;
DWORD i = FormatMessageA(FORMAT_MESSAGE_ALLOCATE_BUFFER | FORMAT_MESSAGE_FROM_SYSTEM | FORMAT_MESSAGE_IGNORE_INSERTS,null,errcode,MAKELANGID(LANG_NEUTRAL,SUBLANG_DEFAULT),cast(LPCSTR)&msgBuf,0,null);
string text = toDString(msgBuf);
LocalFree(cast(HLOCAL)msgBuf);
if (i >= 2)
i -= 2;
return text[0..i];
}

}
else
{
    static assert(0,"Derelict does not support this platform.");
}
}
final class SharedLib
{
    public 
{
    this()
{
}
    string name()
{
return _name;
}
    bool isLoaded()
{
return _hlib !is null;
}
    void load(string[] names);
    void* loadSymbol(string symbolName, bool doThrow = true)
{
void* sym = GetSymbol(_hlib,symbolName);
if (doThrow && sym is null)
Derelict_HandleMissingSymbol(name,symbolName);
return sym;
}
    void unload()
{
if (isLoaded)
{
UnloadSharedLib(_hlib);
_hlib = null;
}
}
    private 
{
    string _name;
    SharedLibHandle _hlib;
}
}
}

