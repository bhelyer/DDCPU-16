// D import file generated from 'derelict\util\exception.d'
module derelict.util.exception;
private import derelict.util.compat;

class DerelictException : Exception
{
    public this(string msg)
{
super(msg);
}

}
struct FailedSharedLib
{
    string name;
    string reason;
}
class SharedLibLoadException : DerelictException
{
    public 
{
    static void throwNew(in char[][] libNames, in char[][] reasons);

    this(string msg)
{
super(msg);
_sharedLibName = "";
}
    this(string msg, string sharedLibName)
{
super(msg);
_sharedLibName = sharedLibName;
}
    string sharedLibName()
{
return _sharedLibName;
}
    private string _sharedLibName;

}
}
class SymbolLoadException : DerelictException
{
    public 
{
    this(string msg)
{
super(msg);
}
    this(string sharedLibName, string symbolName)
{
super("Failed to load symbol " ~ symbolName ~ " from shared library " ~ sharedLibName);
_symbolName = symbolName;
}
    string symbolName()
{
return _symbolName;
}
    private string _symbolName;

}
}
alias SymbolLoadException SharedLibProcLoadException;
alias bool function(string libName, string symbolName) MissingSymbolCallback;
alias MissingSymbolCallback MissingProcCallback;
private MissingSymbolCallback missingSymbolCallback;

public void Derelict_HandleMissingSymbol(string libName, string symbolName);

alias Derelict_HandleMissingSymbol Derelict_HandleMissingProc;
void Derelict_SetMissingSymbolCallback(MissingSymbolCallback callback)
{
missingSymbolCallback = callback;
}
alias Derelict_SetMissingSymbolCallback Derelict_SetMissingProcCallback;
