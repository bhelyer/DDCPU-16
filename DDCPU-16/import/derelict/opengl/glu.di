// D import file generated from 'derelict\opengl\glu.d'
module derelict.opengl.glu;
public 
{
    import derelict.opengl.glutypes;
    import derelict.opengl.glufuncs;
}
private 
{
    import derelict.util.loader;
    import derelict.util.exception;
}
class DerelictGLULoader : SharedLibLoader
{
    private 
{
    this()
{
super("glu32.dll","libGLU.so,libGLU.so.1","../Frameworks/OpenGL.framework/OpenGL, /Library/Frameworks/OpenGL.framework/OpenGL, /System/Library/Frameworks/OpenGL.framework/OpenGL");
}
    protected override void loadSymbols();


}
}
DerelictGLULoader DerelictGLU;
static this();
