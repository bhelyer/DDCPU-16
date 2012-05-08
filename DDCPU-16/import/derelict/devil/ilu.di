// D import file generated from 'derelict\devil\ilu.d'
module derelict.devil.ilu;
public 
{
    import derelict.devil.ilutypes;
    import derelict.devil.ilufuncs;
}
private 
{
    import derelict.util.sharedlib;
    import derelict.util.loader;
}
class DerelictILULoader : SharedLibLoader
{
    public 
{
    this()
{
super("ilu.dll","libILU.so","");
}
    protected override void loadSymbols();


}
}
DerelictILULoader DerelictILU;
static this();
