// D import file generated from 'derelict\util\loader.d'
module derelict.util.loader;
private 
{
    import derelict.util.sharedlib;
    import derelict.util.compat;
}
class SharedLibLoader
{
    public 
{
    this(string winLibs, string nixLibs, string macLibs);
    static void disableAutoUnload()
{
_manualUnload = true;
}

    static bool isAutoUnloadEnabled()
{
return _manualUnload == false;
}

    void load()
{
load(_libNames);
}
    void load(string libNameString);
    void load(string[] libNames)
{
_lib.load(libNames);
loadSymbols();
}
    void unload()
{
_lib.unload();
}
    bool isLoaded()
{
return _lib.isLoaded;
}
    protected 
{
    abstract void loadSymbols();

    void* loadSymbol(string name)
{
return _lib.loadSymbol(name);
}
    SharedLib lib()
{
return _lib;
}
    void bindFunc(void** ptr, string funcName, bool doThrow = true)
{
void* func = lib.loadSymbol(funcName,doThrow);
*ptr = func;
}
    private 
{
    static bool _manualUnload;

    string _libNames;
    SharedLib _lib;
}
}
}
}
package template Binder(T)
{
struct Binder
{
    void opCall(in char[] n, SharedLib lib)
{
*fptr = lib.loadSymbol(n);
}
    private void** fptr;

}
}

template bindFunc(T)
{
Binder!(T) bindFunc(T a)
{
Binder!(T) res;
res.fptr = cast(void**)&a;
return res;
}
}
