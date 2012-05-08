// D import file generated from 'derelict\devil\ilut.d'
module derelict.devil.ilut;
public 
{
    import derelict.devil.iluttypes;
    import derelict.devil.ilutfuncs;
}
private 
{
    import derelict.util.sharedlib;
    import derelict.util.loader;
}
class DerelictILUTLoader : SharedLibLoader
{
    public 
{
    this()
{
super("ilut.dll","libILUT.so","");
}
    protected override void loadSymbols();


}
}
DerelictILUTLoader DerelictILUT;
static this();
