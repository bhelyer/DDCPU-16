// D import file generated from 'derelict\opengl\gl.d'
module derelict.opengl.gl;
public 
{
    import derelict.opengl.glfuncs;
    import derelict.opengl.gltypes;
}
private 
{
    import derelict.util.loader;
    import derelict.util.exception;
    import derelict.util.compat;
    import derelict.opengl.extloader;
    version (Windows)
{
    import derelict.opengl.wgl;
}
    version (darwin)
{
    version = MacOSX;
}
    version (OSX)
{
    version = MacOSX;
}
    version (MacOSX)
{
    import derelict.opengl.cgl;
}
    version (linux)
{
    version = GLX;
}
    version (FreeBSD)
{
    version = freebsd;
}
    version (freebsd)
{
    version = GLX;
}
    version (GLX)
{
    import derelict.opengl.glx;
}
}
enum GLVersion 
{
None,
GL11 = 11,
GL12 = 12,
GL13 = 13,
GL14 = 14,
GL15 = 15,
GL20 = 20,
GL21 = 21,
MaxClassic = 21,
GL30 = 30,
GL31 = 31,
GL32 = 32,
GL33 = 33,
GL40 = 40,
MaxModern = 40,
HighestSupported = 40,
}
class DerelictGLLoader : SharedLibLoader
{
    private 
{
    this()
{
super("opengl32.dll","libGL.so.2,libGL.so.1,libGL.so","../Frameworks/OpenGL.framework/OpenGL, /Library/Frameworks/OpenGL.framework/OpenGL, /System/Library/Frameworks/OpenGL.framework/OpenGL");
}
    GLVersion findMaxAvailable();
    GLVersion _maxVersion;
    public 
{
    GLVersion maxVersion()
{
return _maxVersion;
}
    void loadExtensions();
    string[] loadedExtensionNames()
{
return getLoadedExtensionNames();
}
    string[] notLoadedExtensionNames()
{
return getNotLoadedExtensionNames();
}
    bool isExtensionSupported(string extName);
    bool isExtensionLoaded(string extName);
    GLExtensionState getExtensionState(string extName);
    alias loadClassicVersions loadExtendedVersions;
    GLVersion loadClassicVersions(GLVersion targetVersion = GLVersion.GL11);
    GLVersion loadModernVersions(GLVersion targetVersion = GLVersion.GL30);
    string versionToString(GLVersion ver);
    bool hasValidContext();
    protected 
{
    override void loadSymbols();

    public void bindExtendedFunc(void** ptr, string funcName, bool doThrow);

}
}
}
}
DerelictGLLoader DerelictGL;
static this();
