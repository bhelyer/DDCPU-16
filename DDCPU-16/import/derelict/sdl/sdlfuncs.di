// D import file generated from 'derelict\sdl\sdlfuncs.d'
module derelict.sdl.sdlfuncs;
private 
{
    import derelict.util.compat;
    import derelict.sdl.sdltypes;
    version (Tango)
{
    import tango.stdc.stdio;
}
else
{
    import std.c.stdio;
}
}
SDL_AudioSpec* SDL_LoadWAV(in char* file, SDL_AudioSpec* spec, Uint8** buf, Uint32* len)
{
return SDL_LoadWAV_RW(SDL_RWFromFile(file,"rb"),1,spec,buf,len);
}
int SDL_QuitRequested()
{
SDL_PumpEvents();
return SDL_PeepEvents(null,0,SDL_PEEKEVENT,SDL_QUITMASK);
}
int SDL_LockMutex(SDL_mutex* mutex)
{
return SDL_mutexP(mutex);
}
int SDL_UnlockMutex(SDL_mutex* mutex)
{
return SDL_mutexV(mutex);
}
SDL_Surface* SDL_LoadBMP(in char* file)
{
return SDL_LoadBMP_RW(SDL_RWFromFile(file,"rb"),1);
}
int SDL_SaveBMP(SDL_Surface* surface, in char* file)
{
return SDL_SaveBMP_RW(surface,SDL_RWFromFile(file,"wb"),1);
}
version (D_Version2)
{
    mixin("alias const(SDL_VideoInfo*) SDLVIPTR;");
}
else
{
    alias SDL_VideoInfo* SDLVIPTR;
}
extern (C) 
{
    alias int function(Uint32) da_SDL_Init;
    alias int function(Uint32) da_SDL_InitSubSystem;
    alias void function(Uint32) da_SDL_QuitSubSystem;
    alias Uint32 function(Uint32) da_SDL_WasInit;
    alias void function() da_SDL_Quit;
    alias Uint8 function() da_SDL_GetAppState;
    alias int function(in char*) da_SDL_AudioInit;
    alias void function() da_SDL_AudioQuit;
    alias char* function(char*, int) da_SDL_AudioDriverName;
    alias int function(SDL_AudioSpec*, SDL_AudioSpec*) da_SDL_OpenAudio;
    alias SDL_audiostatus function() da_SDL_GetAudioStatus;
    alias void function(int) da_SDL_PauseAudio;
    alias SDL_AudioSpec* function(SDL_RWops*, int, SDL_AudioSpec*, Uint8**, Uint32*) da_SDL_LoadWAV_RW;
    alias void function(Uint8*) da_SDL_FreeWAV;
    alias int function(SDL_AudioCVT*, Uint16, Uint8, int, Uint16, Uint8, int) da_SDL_BuildAudioCVT;
    alias int function(SDL_AudioCVT*) da_SDL_ConvertAudio;
    alias void function(Uint8*, in Uint8*, Uint32, int) da_SDL_MixAudio;
    alias void function() da_SDL_LockAudio;
    alias void function() da_SDL_UnlockAudio;
    alias void function() da_SDL_CloseAudio;
    alias int function() da_SDL_CDNumDrives;
    alias CCPTR function(int) da_SDL_CDName;
    alias SDL_CD* function(int) da_SDL_CDOpen;
    alias CDstatus function(SDL_CD*) da_SDL_CDStatus;
    alias int function(SDL_CD*, int, int, int, int) da_SDL_CDPlayTracks;
    alias int function(SDL_CD*, int, int) da_SDL_CDPlay;
    alias int function(SDL_CD*) da_SDL_CDPause;
    alias int function(SDL_CD*) da_SDL_CDResume;
    alias int function(SDL_CD*) da_SDL_CDStop;
    alias int function(SDL_CD*) da_SDL_CDEject;
    alias int function(SDL_CD*) da_SDL_CDClose;
    alias SDL_bool function() da_SDL_HasRDTSC;
    alias SDL_bool function() da_SDL_HasMMX;
    alias SDL_bool function() da_SDL_HasMMXExt;
    alias SDL_bool function() da_SDL_Has3DNow;
    alias SDL_bool function() da_SDL_Has3DNowExt;
    alias SDL_bool function() da_SDL_HasSSE;
    alias SDL_bool function() da_SDL_HasSSE2;
    alias SDL_bool function() da_SDL_HasAltiVec;
    alias void function(in char*,...) da_SDL_SetError;
    alias char* function() da_SDL_GetError;
    alias void function() da_SDL_ClearError;
    alias void function() da_SDL_PumpEvents;
    alias int function(SDL_Event*, int, SDL_eventaction, Uint32) da_SDL_PeepEvents;
    alias int function(SDL_Event*) da_SDL_PollEvent;
    alias int function(SDL_Event*) da_SDL_WaitEvent;
    alias int function(SDL_Event*) da_SDL_PushEvent;
    alias void function(SDL_EventFilter) da_SDL_SetEventFilter;
    alias SDL_EventFilter function() da_SDL_GetEventFilter;
    alias Uint8 function(Uint8, int) da_SDL_EventState;
    alias int function() da_SDL_NumJoysticks;
    alias CCPTR function(int) da_SDL_JoystickName;
    alias SDL_Joystick* function(int) da_SDL_JoystickOpen;
    alias int function(int) da_SDL_JoystickOpened;
    alias int function(SDL_Joystick*) da_SDL_JoystickIndex;
    alias int function(SDL_Joystick*) da_SDL_JoystickNumAxes;
    alias int function(SDL_Joystick*) da_SDL_JoystickNumBalls;
    alias int function(SDL_Joystick*) da_SDL_JoystickNumHats;
    alias int function(SDL_Joystick*) da_SDL_JoystickNumButtons;
    alias void function() da_SDL_JoystickUpdate;
    alias int function(int) da_SDL_JoystickEventState;
    alias Sint16 function(SDL_Joystick*, int) da_SDL_JoystickGetAxis;
    alias Uint8 function(SDL_Joystick*, int) da_SDL_JoystickGetHat;
    alias int function(SDL_Joystick*, int, int*, int*) da_SDL_JoystickGetBall;
    alias Uint8 function(SDL_Joystick*, int) da_SDL_JoystickGetButton;
    alias void function(SDL_Joystick*) da_SDL_JoystickClose;
    alias int function(int) da_SDL_EnableUNICODE;
    alias int function(int, int) da_SDL_EnableKeyRepeat;
    alias void function(int*, int*) da_SDL_GetKeyRepeat;
    alias Uint8* function(int*) da_SDL_GetKeyState;
    alias SDLMod function() da_SDL_GetModState;
    alias void function(SDLMod) da_SDL_SetModState;
    alias char* function(SDLKey key) da_SDL_GetKeyName;
    alias void* function(in char*) da_SDL_LoadObject;
    alias void* function(in void*, char*) da_SDL_LoadFunction;
    alias void function(void*) da_SDL_UnloadObject;
    alias Uint8 function(int*, int*) da_SDL_GetMouseState;
    alias Uint8 function(int*, int*) da_SDL_GetRelativeMouseState;
    alias void function(Uint16, Uint16) da_SDL_WarpMouse;
    alias SDL_Cursor* function(Uint8*, Uint8*, int, int, int, int) da_SDL_CreateCursor;
    alias void function(SDL_Cursor*) da_SDL_SetCursor;
    alias SDL_Cursor* function() da_SDL_GetCursor;
    alias void function(SDL_Cursor*) da_SDL_FreeCursor;
    alias int function(int) da_SDL_ShowCursor;
    alias SDL_mutex* function() da_SDL_CreateMutex;
    alias int function(SDL_mutex*) da_SDL_mutexP;
    alias int function(SDL_mutex*) da_SDL_mutexV;
    alias void function(SDL_mutex*) da_SDL_DestroyMutex;
    alias SDL_sem* function(Uint32) da_SDL_CreateSemaphore;
    alias void function(SDL_sem*) da_SDL_DestroySemaphore;
    alias int function(SDL_sem*) da_SDL_SemWait;
    alias int function(SDL_sem*) da_SDL_SemTryWait;
    alias int function(SDL_sem*, Uint32) da_SDL_SemWaitTimeout;
    alias int function(SDL_sem*) da_SDL_SemPost;
    alias Uint32 function(SDL_sem*) da_SDL_SemValue;
    alias SDL_cond* function() da_SDL_CreateCond;
    alias void function(SDL_cond*) da_SDL_DestroyCond;
    alias int function(SDL_cond*) da_SDL_CondSignal;
    alias int function(SDL_cond*) da_SDL_CondBroadcast;
    alias int function(SDL_cond*, SDL_mutex*) da_SDL_CondWait;
    alias int function(SDL_cond*, SDL_mutex*, Uint32) da_SDL_CondWaitTimeout;
    alias SDL_RWops* function(in char*, in char*) da_SDL_RWFromFile;
    alias SDL_RWops* function(FILE*, int) da_SDL_RWFromFP;
    alias SDL_RWops* function(void*, int) da_SDL_RWFromMem;
    alias SDL_RWops* function(in void*, int) da_SDL_RWFromConstMem;
    alias SDL_RWops* function() da_SDL_AllocRW;
    alias void function(SDL_RWops*) da_SDL_FreeRW;
    alias Uint16 function(SDL_RWops*) da_SDL_ReadLE16;
    alias Uint16 function(SDL_RWops*) da_SDL_ReadBE16;
    alias Uint32 function(SDL_RWops*) da_SDL_ReadLE32;
    alias Uint32 function(SDL_RWops*) da_SDL_ReadBE32;
    alias Uint64 function(SDL_RWops*) da_SDL_ReadLE64;
    alias Uint64 function(SDL_RWops*) da_SDL_ReadBE64;
    alias Uint16 function(SDL_RWops*, Uint16) da_SDL_WriteLE16;
    alias Uint16 function(SDL_RWops*, Uint16) da_SDL_WriteBE16;
    alias Uint32 function(SDL_RWops*, Uint32) da_SDL_WriteLE32;
    alias Uint32 function(SDL_RWops*, Uint32) da_SDL_WriteBE32;
    alias Uint64 function(SDL_RWops*, Uint64) da_SDL_WriteLE64;
    alias Uint64 function(SDL_RWops*, Uint64) da_SDL_WriteBE64;
    alias CSDLVERPTR function() da_SDL_Linked_Version;
    alias int function(SDL_SysWMinfo*) da_SDL_GetWMInfo;
    alias SDL_Thread* function(int function(void*) fm, void*) da_SDL_CreateThread;
    alias Uint32 function() da_SDL_ThreadID;
    alias Uint32 function(SDL_Thread*) da_SDL_GetThreadID;
    alias void function(SDL_Thread*, int*) da_SDL_WaitThread;
    alias void function(SDL_Thread*) da_SDL_KillThread;
    alias Uint32 function() da_SDL_GetTicks;
    alias void function(Uint32) da_SDL_Delay;
    alias int function(Uint32, SDL_TimerCallback) da_SDL_SetTimer;
    alias SDL_TimerID function(Uint32, SDL_NewTimerCallback, void*) da_SDL_AddTimer;
    alias SDL_bool function(SDL_TimerID) da_SDL_RemoveTimer;
    alias int function(in char*, Uint32) da_SDL_VideoInit;
    alias void function() da_SDL_VideoQuit;
    alias char* function(char*, int) da_SDL_VideoDriverName;
    alias SDL_Surface* function() da_SDL_GetVideoSurface;
    alias SDLVIPTR function() da_SDL_GetVideoInfo;
    alias int function(int, int, int, Uint32) da_SDL_VideoModeOK;
    alias SDL_Rect** function(SDL_PixelFormat*, Uint32) da_SDL_ListModes;
    alias SDL_Surface* function(int, int, int, Uint32) da_SDL_SetVideoMode;
    alias void function(SDL_Surface*, int, SDL_Rect*) da_SDL_UpdateRects;
    alias void function(SDL_Surface*, Sint32, Sint32, Uint32, Uint32) da_SDL_UpdateRect;
    alias int function(SDL_Surface*) da_SDL_Flip;
    alias int function(float, float, float) da_SDL_SetGamma;
    alias int function(in Uint16*, in Uint16*, in Uint16*) da_SDL_SetGammaRamp;
    alias int function(Uint16*, Uint16*, Uint16*) da_SDL_GetGammaRamp;
    alias int function(SDL_Surface*, SDL_Color*, int, int) da_SDL_SetColors;
    alias int function(SDL_Surface*, int, SDL_Color*, int, int) da_SDL_SetPalette;
    alias Uint32 function(in SDL_PixelFormat*, in Uint8, in Uint8, in Uint8) da_SDL_MapRGB;
    alias Uint32 function(in SDL_PixelFormat*, in Uint8, in Uint8, in Uint8, in Uint8) da_SDL_MapRGBA;
    alias void function(Uint32, SDL_PixelFormat*, Uint8*, Uint8*, Uint8*) da_SDL_GetRGB;
    alias void function(Uint32, SDL_PixelFormat*, Uint8*, Uint8*, Uint8*, Uint8*) da_SDL_GetRGBA;
    alias SDL_Surface* function(Uint32, int, int, int, Uint32, Uint32, Uint32, Uint32) da_SDL_CreateRGBSurface;
    alias SDL_Surface* function(void*, int, int, int, int, Uint32, Uint32, Uint32, Uint32) da_SDL_CreateRGBSurfaceFrom;
    alias void function(SDL_Surface*) da_SDL_FreeSurface;
    alias int function(SDL_Surface*) da_SDL_LockSurface;
    alias void function(SDL_Surface*) da_SDL_UnlockSurface;
    alias SDL_Surface* function(SDL_RWops*, int) da_SDL_LoadBMP_RW;
    alias int function(SDL_Surface*, SDL_RWops*, int) da_SDL_SaveBMP_RW;
    alias int function(SDL_Surface*, Uint32, Uint32) da_SDL_SetColorKey;
    alias int function(SDL_Surface*, Uint32, Uint8) da_SDL_SetAlpha;
    alias SDL_bool function(SDL_Surface*, in SDL_Rect*) da_SDL_SetClipRect;
    alias void function(SDL_Surface*, SDL_Rect*) da_SDL_GetClipRect;
    alias SDL_Surface* function(SDL_Surface*, SDL_PixelFormat*, Uint32) da_SDL_ConvertSurface;
    alias int function(SDL_Surface*, SDL_Rect*, SDL_Surface*, SDL_Rect*) da_SDL_UpperBlit;
    alias int function(SDL_Surface*, SDL_Rect*, SDL_Surface*, SDL_Rect*) da_SDL_LowerBlit;
    alias int function(SDL_Surface*, SDL_Rect*, Uint32) da_SDL_FillRect;
    alias SDL_Surface* function(SDL_Surface*) da_SDL_DisplayFormat;
    alias SDL_Surface* function(SDL_Surface*) da_SDL_DisplayFormatAlpha;
    alias SDL_Overlay* function(int, int, Uint32, SDL_Surface*) da_SDL_CreateYUVOverlay;
    alias int function(SDL_Overlay*) da_SDL_LockYUVOverlay;
    alias void function(SDL_Overlay*) da_SDL_UnlockYUVOverlay;
    alias int function(SDL_Overlay*, SDL_Rect*) da_SDL_DisplayYUVOverlay;
    alias void function(SDL_Overlay*) da_SDL_FreeYUVOverlay;
    alias int function(in char*) da_SDL_GL_LoadLibrary;
    alias void* function(in char*) da_SDL_GL_GetProcAddress;
    alias int function(SDL_GLattr, int) da_SDL_GL_SetAttribute;
    alias int function(SDL_GLattr, int*) da_SDL_GL_GetAttribute;
    alias void function() da_SDL_GL_SwapBuffers;
    alias void function(int, SDL_Rect*) da_SDL_GL_UpdateRects;
    alias void function() da_SDL_GL_Lock;
    alias void function() da_SDL_GL_Unlock;
    alias void function(in char*, in char*) da_SDL_WM_SetCaption;
    alias void function(char**, char**) da_SDL_WM_GetCaption;
    alias void function(SDL_Surface*, Uint8*) da_SDL_WM_SetIcon;
    alias int function() da_SDL_WM_IconifyWindow;
    alias int function(SDL_Surface*) da_SDL_WM_ToggleFullScreen;
    alias SDL_GrabMode function(SDL_GrabMode) da_SDL_WM_GrabInput;
}
mixin(gsharedString!() ~ "\x0ada_SDL_Init SDL_Init;\x0ada_SDL_InitSubSystem SDL_InitSubSystem;\x0ada_SDL_QuitSubSystem SDL_QuitSubSystem;\x0ada_SDL_WasInit SDL_WasInit;\x0ada_SDL_Quit SDL_Quit;\x0a\x0ada_SDL_GetAppState SDL_GetAppState;\x0a\x0ada_SDL_AudioInit SDL_AudioInit;\x0ada_SDL_AudioQuit SDL_AudioQuit;\x0ada_SDL_AudioDriverName SDL_AudioDriverName;\x0ada_SDL_OpenAudio SDL_OpenAudio;\x0ada_SDL_GetAudioStatus SDL_GetAudioStatus;\x0ada_SDL_PauseAudio SDL_PauseAudio;\x0ada_SDL_LoadWAV_RW SDL_LoadWAV_RW;\x0ada_SDL_FreeWAV SDL_FreeWAV;\x0ada_SDL_BuildAudioCVT SDL_BuildAudioCVT;\x0ada_SDL_ConvertAudio SDL_ConvertAudio;\x0ada_SDL_MixAudio SDL_MixAudio;\x0ada_SDL_LockAudio SDL_LockAudio;\x0ada_SDL_UnlockAudio SDL_UnlockAudio;\x0ada_SDL_CloseAudio SDL_CloseAudio;\x0a\x0ada_SDL_CDNumDrives SDL_CDNumDrives;\x0ada_SDL_CDName SDL_CDName;\x0ada_SDL_CDOpen SDL_CDOpen;\x0ada_SDL_CDStatus SDL_CDStatus;\x0ada_SDL_CDPlayTracks SDL_CDPlayTracks;\x0ada_SDL_CDPlay SDL_CDPlay;\x0ada_SDL_CDPause SDL_CDPause;\x0ada_SDL_CDResume SDL_CDResume;\x0ada_SDL_CDStop SDL_CDStop;\x0ada_SDL_CDEject SDL_CDEject;\x0ada_SDL_CDClose SDL_CDClose;\x0a\x0ada_SDL_HasRDTSC SDL_HasRDTSC;\x0ada_SDL_HasMMX SDL_HasMMX;\x0ada_SDL_HasMMXExt SDL_HasMMXExt;\x0ada_SDL_Has3DNow SDL_Has3DNow;\x0ada_SDL_Has3DNowExt SDL_Has3DNowExt;\x0ada_SDL_HasSSE SDL_HasSSE;\x0ada_SDL_HasSSE2 SDL_HasSSE2;\x0ada_SDL_HasAltiVec SDL_HasAltiVec;\x0a\x0ada_SDL_SetError SDL_SetError;\x0ada_SDL_GetError SDL_GetError;\x0ada_SDL_ClearError SDL_ClearError;\x0a\x0ada_SDL_PumpEvents SDL_PumpEvents;\x0ada_SDL_PeepEvents SDL_PeepEvents;\x0ada_SDL_PollEvent SDL_PollEvent;\x0ada_SDL_WaitEvent SDL_WaitEvent;\x0ada_SDL_PushEvent SDL_PushEvent;\x0ada_SDL_SetEventFilter SDL_SetEventFilter;\x0ada_SDL_GetEventFilter SDL_GetEventFilter;\x0ada_SDL_EventState SDL_EventState;\x0a\x0ada_SDL_NumJoysticks SDL_NumJoysticks;\x0ada_SDL_JoystickName SDL_JoystickName;\x0ada_SDL_JoystickOpen SDL_JoystickOpen;\x0ada_SDL_JoystickOpened SDL_JoystickOpened;\x0ada_SDL_JoystickIndex SDL_JoystickIndex;\x0ada_SDL_JoystickNumAxes SDL_JoystickNumAxes;\x0ada_SDL_JoystickNumBalls SDL_JoystickNumBalls;\x0ada_SDL_JoystickNumHats SDL_JoystickNumHats;\x0ada_SDL_JoystickNumButtons SDL_JoystickNumButtons;\x0ada_SDL_JoystickUpdate SDL_JoystickUpdate;\x0ada_SDL_JoystickEventState SDL_JoystickEventState;\x0ada_SDL_JoystickGetAxis SDL_JoystickGetAxis;\x0ada_SDL_JoystickGetHat SDL_JoystickGetHat;\x0ada_SDL_JoystickGetBall SDL_JoystickGetBall;\x0ada_SDL_JoystickGetButton SDL_JoystickGetButton;\x0ada_SDL_JoystickClose SDL_JoystickClose;\x0a\x0ada_SDL_EnableUNICODE SDL_EnableUNICODE;\x0ada_SDL_EnableKeyRepeat SDL_EnableKeyRepeat;\x0ada_SDL_GetKeyRepeat SDL_GetKeyRepeat;\x0ada_SDL_GetKeyState SDL_GetKeyState;\x0ada_SDL_GetModState SDL_GetModState;\x0ada_SDL_SetModState SDL_SetModState;\x0ada_SDL_GetKeyName SDL_GetKeyName;\x0a\x0ada_SDL_LoadObject SDL_LoadObject;\x0ada_SDL_LoadFunction SDL_LoadFunction;\x0ada_SDL_UnloadObject SDL_UnloadObject;\x0a\x0ada_SDL_GetMouseState SDL_GetMouseState;\x0ada_SDL_GetRelativeMouseState SDL_GetRelativeMouseState;\x0ada_SDL_WarpMouse SDL_WarpMouse;\x0ada_SDL_CreateCursor SDL_CreateCursor;\x0ada_SDL_SetCursor SDL_SetCursor;\x0ada_SDL_GetCursor SDL_GetCursor;\x0ada_SDL_FreeCursor SDL_FreeCursor;\x0ada_SDL_ShowCursor SDL_ShowCursor;\x0a\x0ada_SDL_CreateMutex SDL_CreateMutex;\x0ada_SDL_mutexP SDL_mutexP;\x0ada_SDL_mutexV SDL_mutexV;\x0ada_SDL_DestroyMutex SDL_DestroyMutex;\x0ada_SDL_CreateSemaphore SDL_CreateSemaphore;\x0ada_SDL_DestroySemaphore SDL_DestroySemaphore;\x0ada_SDL_SemWait SDL_SemWait;\x0ada_SDL_SemTryWait SDL_SemTryWait;\x0ada_SDL_SemWaitTimeout SDL_SemWaitTimeout;\x0ada_SDL_SemPost SDL_SemPost;\x0ada_SDL_SemValue SDL_SemValue;\x0ada_SDL_CreateCond SDL_CreateCond;\x0ada_SDL_DestroyCond SDL_DestroyCond;\x0ada_SDL_CondSignal SDL_CondSignal;\x0ada_SDL_CondBroadcast SDL_CondBroadcast;\x0ada_SDL_CondWait SDL_CondWait;\x0ada_SDL_CondWaitTimeout SDL_CondWaitTimeout;\x0a\x0ada_SDL_RWFromFile SDL_RWFromFile;\x0ada_SDL_RWFromFP SDL_RWFromFP;\x0ada_SDL_RWFromMem SDL_RWFromMem;\x0ada_SDL_RWFromConstMem SDL_RWFromConstMem;\x0ada_SDL_AllocRW SDL_AllocRW;\x0ada_SDL_FreeRW SDL_FreeRW;\x0ada_SDL_ReadLE16 SDL_ReadLE16;\x0ada_SDL_ReadBE16 SDL_ReadBE16;\x0ada_SDL_ReadLE32 SDL_ReadLE32;\x0ada_SDL_ReadBE32 SDL_ReadBE32;\x0ada_SDL_ReadLE64 SDL_ReadLE64;\x0ada_SDL_ReadBE64 SDL_ReadBE64;\x0ada_SDL_WriteLE16 SDL_WriteLE16;\x0ada_SDL_WriteBE16 SDL_WriteBE16;\x0ada_SDL_WriteLE32 SDL_WriteLE32;\x0ada_SDL_WriteBE32 SDL_WriteBE32;\x0ada_SDL_WriteLE64 SDL_WriteLE64;\x0ada_SDL_WriteBE64 SDL_WriteBE64;\x0a\x0ada_SDL_Linked_Version SDL_Linked_Version;\x0a\x0ada_SDL_GetWMInfo SDL_GetWMInfo;\x0a\x0ada_SDL_CreateThread SDL_CreateThread;\x0ada_SDL_ThreadID SDL_ThreadID;\x0ada_SDL_GetThreadID SDL_GetThreadID;\x0ada_SDL_WaitThread SDL_WaitThread;\x0ada_SDL_KillThread SDL_KillThread;\x0a\x0ada_SDL_GetTicks SDL_GetTicks;\x0ada_SDL_Delay SDL_Delay;\x0ada_SDL_SetTimer SDL_SetTimer;\x0ada_SDL_AddTimer SDL_AddTimer;\x0ada_SDL_RemoveTimer SDL_RemoveTimer;\x0a\x0ada_SDL_VideoInit SDL_VideoInit;\x0ada_SDL_VideoQuit SDL_VideoQuit;\x0ada_SDL_VideoDriverName SDL_VideoDriverName;\x0ada_SDL_GetVideoSurface SDL_GetVideoSurface;\x0ada_SDL_GetVideoInfo SDL_GetVideoInfo;\x0ada_SDL_VideoModeOK SDL_VideoModeOK;\x0ada_SDL_ListModes SDL_ListModes;\x0ada_SDL_SetVideoMode SDL_SetVideoMode;\x0ada_SDL_UpdateRects SDL_UpdateRects;\x0ada_SDL_UpdateRect SDL_UpdateRect;\x0ada_SDL_Flip SDL_Flip;\x0ada_SDL_SetGamma SDL_SetGamma;\x0ada_SDL_SetGammaRamp SDL_SetGammaRamp;\x0ada_SDL_GetGammaRamp SDL_GetGammaRamp;\x0ada_SDL_SetColors SDL_SetColors;\x0ada_SDL_SetPalette SDL_SetPalette;\x0ada_SDL_MapRGB SDL_MapRGB;\x0ada_SDL_MapRGBA SDL_MapRGBA;\x0ada_SDL_GetRGB SDL_GetRGB;\x0ada_SDL_GetRGBA SDL_GetRGBA;\x0ada_SDL_CreateRGBSurface SDL_CreateRGBSurface;\x0ada_SDL_CreateRGBSurfaceFrom SDL_CreateRGBSurfaceFrom;\x0ada_SDL_FreeSurface SDL_FreeSurface;\x0ada_SDL_LockSurface SDL_LockSurface;\x0ada_SDL_UnlockSurface SDL_UnlockSurface;\x0ada_SDL_LoadBMP_RW SDL_LoadBMP_RW;\x0ada_SDL_SaveBMP_RW SDL_SaveBMP_RW;\x0ada_SDL_SetColorKey SDL_SetColorKey;\x0ada_SDL_SetAlpha SDL_SetAlpha;\x0ada_SDL_SetClipRect SDL_SetClipRect;\x0ada_SDL_GetClipRect SDL_GetClipRect;\x0ada_SDL_ConvertSurface SDL_ConvertSurface;\x0ada_SDL_UpperBlit SDL_UpperBlit;\x0ada_SDL_LowerBlit SDL_LowerBlit;\x0ada_SDL_FillRect SDL_FillRect;\x0ada_SDL_DisplayFormat SDL_DisplayFormat;\x0ada_SDL_DisplayFormatAlpha SDL_DisplayFormatAlpha;\x0ada_SDL_CreateYUVOverlay SDL_CreateYUVOverlay;\x0ada_SDL_LockYUVOverlay SDL_LockYUVOverlay;\x0ada_SDL_UnlockYUVOverlay SDL_UnlockYUVOverlay;\x0ada_SDL_DisplayYUVOverlay SDL_DisplayYUVOverlay;\x0ada_SDL_FreeYUVOverlay SDL_FreeYUVOverlay;\x0ada_SDL_GL_LoadLibrary SDL_GL_LoadLibrary;\x0ada_SDL_GL_GetProcAddress SDL_GL_GetProcAddress;\x0ada_SDL_GL_SetAttribute SDL_GL_SetAttribute;\x0ada_SDL_GL_GetAttribute SDL_GL_GetAttribute;\x0ada_SDL_GL_SwapBuffers SDL_GL_SwapBuffers;\x0ada_SDL_GL_UpdateRects SDL_GL_UpdateRects;\x0ada_SDL_GL_Lock SDL_GL_Lock;\x0ada_SDL_GL_Unlock SDL_GL_Unlock;\x0ada_SDL_WM_SetCaption SDL_WM_SetCaption;\x0ada_SDL_WM_GetCaption SDL_WM_GetCaption;\x0ada_SDL_WM_SetIcon SDL_WM_SetIcon;\x0ada_SDL_WM_IconifyWindow SDL_WM_IconifyWindow;\x0ada_SDL_WM_ToggleFullScreen SDL_WM_ToggleFullScreen;\x0ada_SDL_WM_GrabInput SDL_WM_GrabInput;\x0a");
alias SDL_CreateRGBSurface SDL_AllocSurface;
alias SDL_UpperBlit SDL_BlitSurface;
