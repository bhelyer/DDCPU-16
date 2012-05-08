// D import file generated from 'derelict\openal\al.d'
module derelict.openal.al;
public 
{
    import derelict.openal.altypes;
    import derelict.openal.alfuncs;
}
private import derelict.util.loader;

class DerelictALLoader : SharedLibLoader
{
    public 
{
    this()
{
super("OpenAl32.dll","libal.so, libAL.so, libopenal.so, libopenal.so.1, libopenal.so.0","../Frameworks/OpenAL.framework/OpenAL, /Library/Frameworks/OpenAL.framework/OpenAL, /System/Library/Frameworks/OpenAL.framework/OpenAL");
}
    protected override void loadSymbols();


}
}
DerelictALLoader DerelictAL;
static this();
