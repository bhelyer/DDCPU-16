// D import file generated from 'derelict\sfml\wfuncs.d'
module derelict.sfml.wfuncs;
private 
{
    import derelict.util.compat;
    import derelict.sfml.config;
    import derelict.sfml.wtypes;
}
extern (C) 
{
    alias sfContext* function() da_sfContext_Create;
    alias void function(sfContext*) da_sfContext_Destroy;
    alias void function(sfContext*, sfBool) da_sfContext_SetActive;
    alias sfBool function(sfInput*, sfKeyCode) da_sfInput_IsKeyDown;
    alias sfBool function(sfInput*, sfMouseButton) da_sfInput_IsMouseButtonDown;
    alias sfBool function(sfInput*, uint, uint) da_sfInput_IsJoystickButtonDown;
    alias int function(sfInput*) da_sfInput_GetMouseX;
    alias int function(sfInput*) da_sfInput_GetMouseY;
    alias float function(sfInput*, uint, sfJoyAxis) da_sfInput_GetJoystickAxis;
    alias sfVideoMode function() da_sfVideoMode_GetDesktopMode;
    alias sfVideoMode function(size_t) da_sfVideoMode_GetMode;
    alias size_t function() da_sfVideoMode_GetModesCount;
    alias sfBool function(sfVideoMode) da_sfVideoMode_IsValid;
    alias sfWindow* function(sfVideoMode, CCPTR, c_ulong, sfWindowSettings) da_sfWindow_Create;
    alias sfWindow* function(sfWindowHandle, sfWindowSettings) da_sfWindow_CreateFromHandle;
    alias void function(sfWindow*) da_sfWindow_Destroy;
    alias void function(sfWindow*) da_sfWindow_Close;
    alias sfBool function(sfWindow*) da_sfWindow_IsOpened;
    alias uint function(sfWindow*) da_sfWindow_GetWidth;
    alias uint function(sfWindow*) da_sfWindow_GetHeight;
    alias sfWindowSettings function(sfWindow*) da_sfWindow_GetSettings;
    alias sfBool function(sfWindow*, sfEvent*) da_sfWindow_GetEvent;
    alias void function(sfWindow*, sfBool) da_sfWindow_UseVerticalSync;
    alias void function(sfWindow*, sfBool) da_sfWindow_ShowMouseCursor;
    alias void function(sfWindow*, uint, uint) da_sfWindow_SetCursorPosition;
    alias void function(sfWindow*, int, int) da_sfWindow_SetPosition;
    alias void function(sfWindow*, uint, uint) da_sfWindow_SetSize;
    alias void function(sfWindow*, sfBool) da_sfWindow_Show;
    alias void function(sfWindow*, sfBool) da_sfWindow_EnableKeyRepeat;
    alias void function(sfWindow*, uint, uint, sfUint8*) da_sfWindow_SetIcon;
    alias sfBool function(sfWindow*, sfBool) da_sfWindow_SetActive;
    alias void function(sfWindow*) da_sfWindow_Display;
    alias sfInput* function(sfWindow*) da_sfWindow_GetInput;
    alias void function(sfWindow*, uint) da_sfWindow_SetFramerateLimit;
    alias float function(sfWindow*) da_sfWindow_GetFrameTime;
    alias void function(sfWindow*, float) da_sfWindow_SetJoystickThreshold;
}
mixin(gsharedString!() ~ "\x0ada_sfContext_Create sfContext_Create;\x0ada_sfContext_Destroy sfContext_Destroy;\x0ada_sfContext_SetActive sfContext_SetActive;\x0ada_sfInput_IsKeyDown sfInput_IsKeyDown;\x0ada_sfInput_IsMouseButtonDown sfInput_IsMouseButtonDown;\x0ada_sfInput_IsJoystickButtonDown sfInput_IsJoystickButtonDown;\x0ada_sfInput_GetMouseX sfInput_GetMouseX;\x0ada_sfInput_GetMouseY sfInput_GetMouseY;\x0ada_sfInput_GetJoystickAxis sfInput_GetJoystickAxis;\x0ada_sfVideoMode_GetDesktopMode sfVideoMode_GetDesktopMode;\x0ada_sfVideoMode_GetMode sfVideoMode_GetMode;\x0ada_sfVideoMode_GetModesCount sfVideoMode_GetModesCount;\x0ada_sfVideoMode_IsValid sfVideoMode_IsValid;\x0ada_sfWindow_Create sfWindow_Create;\x0ada_sfWindow_CreateFromHandle sfWindow_CreateFromHandle;\x0ada_sfWindow_Destroy sfWindow_Destroy;\x0ada_sfWindow_Close sfWindow_Close;\x0ada_sfWindow_IsOpened sfWindow_IsOpened;\x0ada_sfWindow_GetWidth sfWindow_GetWidth;\x0ada_sfWindow_GetHeight sfWindow_GetHeight;\x0ada_sfWindow_GetSettings sfWindow_GetSettings;\x0ada_sfWindow_GetEvent sfWindow_GetEvent;\x0ada_sfWindow_UseVerticalSync sfWindow_UseVerticalSync;\x0ada_sfWindow_ShowMouseCursor sfWindow_ShowMouseCursor;\x0ada_sfWindow_SetCursorPosition sfWindow_SetCursorPosition;\x0ada_sfWindow_SetPosition sfWindow_SetPosition;\x0ada_sfWindow_SetSize sfWindow_SetSize;\x0ada_sfWindow_Show sfWindow_Show;\x0ada_sfWindow_EnableKeyRepeat sfWindow_EnableKeyRepeat;\x0ada_sfWindow_SetIcon sfWindow_SetIcon;\x0ada_sfWindow_SetActive sfWindow_SetActive;\x0ada_sfWindow_Display sfWindow_Display;\x0ada_sfWindow_GetInput sfWindow_GetInput;\x0ada_sfWindow_SetFramerateLimit sfWindow_SetFramerateLimit;\x0ada_sfWindow_GetFrameTime sfWindow_GetFrameTime;\x0ada_sfWindow_SetJoystickThreshold sfWindow_SetJoystickThreshold;\x0a");
