// D import file generated from 'derelict\util\compat.d'
module derelict.util.compat;
version (D_Version2)
{
    mixin("alias const(char)* CCPTR;");
    mixin("alias const(wchar)* CWCPTR;");
    mixin("alias const(dchar)* CDCPTR;");
    mixin("alias const(ubyte)* CUBPTR;");
    mixin("alias const(void)* CVPTR;");
    mixin("alias immutable(char)* ICPTR;");
}
else
{
    alias char* CCPTR;
    alias wchar* CWCPTR;
    alias dchar* CDCPTR;
    alias ubyte* CUBPTR;
    alias void* CVPTR;
    alias char* ICPTR;
}
version (D_Version2)
{
    public import core.stdc.config;

}
else
{
    version (Tango)
{
    version (Windows)
{
    alias int c_long;
    alias uint c_ulong;
}
else
{
    static if((void*).sizeof > (int).sizeof)
{
    alias long c_long;
    alias ulong c_ulong;
}
else
{
    alias int c_long;
    alias uint c_ulong;
}
}
}
}
version (D_Version2)
{
    version (Posix)
{
    public import core.sys.posix.sys.types;

}
else
{
    alias c_long off_t;
}
}
else
{
    alias c_long off_t;
}
version (Tango)
{
    private 
{
    import tango.stdc.string;
    import tango.stdc.stringz;
    import tango.text.Util;
    import tango.core.Version;
}
    version (PhobosCompatibility)
{
}
else
{
    alias char[] string;
    alias wchar[] wstring;
    alias dchar[] dstring;
}
}
else
{
    private 
{
    version (D_Version2)
{
    import std.conv;
}
    import std.string;
    import std.c.string;
}
}
template gsharedString()
{
version (D_Version2)
{
    const gsharedString = "__gshared: ";
}
else
{
    const gsharedString = "";
}
}
CCPTR toCString(string str)
{
return toStringz(str);
}
string toDString(CCPTR cstr);
int findStr(string str, string match);
string[] splitStr(string str, string delim)
{
return split(str,delim);
}
string stripWhiteSpace(string str);
