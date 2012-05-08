// D import file generated from 'derelict\devil\il.d'
module derelict.devil.il;
public 
{
    import derelict.devil.iltypes;
    import derelict.devil.ilfuncs;
}
private 
{
    import derelict.util.sharedlib;
    import derelict.util.loader;
}
class DerelictILLoader : SharedLibLoader
{
    public 
{
    this()
{
super("devil.dll","libIL.so","");
}
    protected override void loadSymbols();


}
}
DerelictILLoader DerelictIL;
static this();
