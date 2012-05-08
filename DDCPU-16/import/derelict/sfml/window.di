// D import file generated from 'derelict\sfml\window.d'
module derelict.sfml.window;
public 
{
    import derelict.sfml.wtypes;
    import derelict.sfml.wfuncs;
}
private import derelict.util.loader;

class DerelictSFMLWindowLoader : SharedLibLoader
{
    public 
{
    this()
{
super("csfml-window.dll","libcsfml-window.so,libcsfml-window.so.1.6","../Frameworks/csfml-window.framework/csfml-window, /Library/Frameworks/csfml-window.framework/csfml-window, /System/Library/Frameworks/csfml-window.framework/csfml-window");
}
    protected override void loadSymbols()
{
bindFunc(cast(void**)&sfContext_Create,"sfContext_Create");
bindFunc(cast(void**)&sfContext_Destroy,"sfContext_Destroy");
bindFunc(cast(void**)&sfContext_SetActive,"sfContext_SetActive");
bindFunc(cast(void**)&sfInput_IsKeyDown,"sfInput_IsKeyDown");
bindFunc(cast(void**)&sfInput_IsMouseButtonDown,"sfInput_IsMouseButtonDown");
bindFunc(cast(void**)&sfInput_IsJoystickButtonDown,"sfInput_IsJoystickButtonDown");
bindFunc(cast(void**)&sfInput_GetMouseX,"sfInput_GetMouseX");
bindFunc(cast(void**)&sfInput_GetMouseY,"sfInput_GetMouseY");
bindFunc(cast(void**)&sfInput_GetJoystickAxis,"sfInput_GetJoystickAxis");
bindFunc(cast(void**)&sfVideoMode_GetDesktopMode,"sfVideoMode_GetDesktopMode");
bindFunc(cast(void**)&sfVideoMode_GetMode,"sfVideoMode_GetMode");
bindFunc(cast(void**)&sfVideoMode_GetModesCount,"sfVideoMode_GetModesCount");
bindFunc(cast(void**)&sfVideoMode_IsValid,"sfVideoMode_IsValid");
bindFunc(cast(void**)&sfWindow_Create,"sfWindow_Create");
bindFunc(cast(void**)&sfWindow_CreateFromHandle,"sfWindow_CreateFromHandle");
bindFunc(cast(void**)&sfWindow_Destroy,"sfWindow_Destroy");
bindFunc(cast(void**)&sfWindow_Close,"sfWindow_Close");
bindFunc(cast(void**)&sfWindow_IsOpened,"sfWindow_IsOpened");
bindFunc(cast(void**)&sfWindow_GetWidth,"sfWindow_GetWidth");
bindFunc(cast(void**)&sfWindow_GetHeight,"sfWindow_GetHeight");
bindFunc(cast(void**)&sfWindow_GetSettings,"sfWindow_GetSettings");
bindFunc(cast(void**)&sfWindow_GetEvent,"sfWindow_GetEvent");
bindFunc(cast(void**)&sfWindow_UseVerticalSync,"sfWindow_UseVerticalSync");
bindFunc(cast(void**)&sfWindow_ShowMouseCursor,"sfWindow_ShowMouseCursor");
bindFunc(cast(void**)&sfWindow_SetCursorPosition,"sfWindow_SetCursorPosition");
bindFunc(cast(void**)&sfWindow_SetPosition,"sfWindow_SetPosition");
bindFunc(cast(void**)&sfWindow_SetSize,"sfWindow_SetSize");
bindFunc(cast(void**)&sfWindow_Show,"sfWindow_Show");
bindFunc(cast(void**)&sfWindow_EnableKeyRepeat,"sfWindow_EnableKeyRepeat");
bindFunc(cast(void**)&sfWindow_SetIcon,"sfWindow_SetIcon");
bindFunc(cast(void**)&sfWindow_SetActive,"sfWindow_SetActive");
bindFunc(cast(void**)&sfWindow_Display,"sfWindow_Display");
bindFunc(cast(void**)&sfWindow_GetInput,"sfWindow_GetInput");
bindFunc(cast(void**)&sfWindow_SetFramerateLimit,"sfWindow_SetFramerateLimit");
bindFunc(cast(void**)&sfWindow_GetFrameTime,"sfWindow_GetFrameTime");
bindFunc(cast(void**)&sfWindow_SetJoystickThreshold,"sfWindow_SetJoystickThreshold");
}


}
}
DerelictSFMLWindowLoader DerelictSFMLWindow;
static this();
