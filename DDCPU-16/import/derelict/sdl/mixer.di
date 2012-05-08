// D import file generated from 'derelict\sdl\mixer.d'
module derelict.sdl.mixer;
private 
{
    import derelict.util.loader;
    import derelict.util.exception;
    import derelict.util.compat;
    import derelict.sdl.sdl;
}
enum : Uint8
{
SDL_MIXER_MAJOR_VERSION = 1,
SDL_MIXER_MINOR_VERSION = 2,
SDL_MIXER_PATCHLEVEL = 12,
}
alias SDL_MIXER_MAJOR_VERSION MIX_MAJOR_VERSION;
alias SDL_MIXER_MINOR_VERSION MIX_MINOR_VERSION;
alias SDL_MIXER_PATCHLEVEL MIX_PATCH_LEVEL;
alias SDL_SetError Mix_SetError;
alias SDL_GetError Mix_GetError;
alias int MIX_InitFlags;
enum : int
{
MIX_INIT_FLAC = 1,
MIX_INIT_MOD = 2,
MIX_INIT_MP3 = 4,
MIX_INIT_OGG = 8,
}
struct Mix_Chunk
{
    int allocated;
    Uint8* abuf;
    Uint32 alen;
    Uint8 volume;
}
alias int Mix_Fading;
enum : int
{
MIX_NO_FADING,
MIX_FADING_OUT,
MIX_FADING_IN,
}
alias int Mix_MusicType;
enum : int
{
MUS_NONE,
MUS_CMD,
MUS_WAV,
MUS_MOD,
MUS_MID,
MUS_OGG,
MUS_MP3,
MUS_MP3_MAD,
MUS_FLAC,
MUS_MODPLUG,
}
struct _Mix_Music
{
}
alias _Mix_Music Mix_Music;
enum 
{
MIX_CHANNELS = 8,
MIX_DEFAULT_FREQUENCY = 22050,
MIX_DEFAULT_CHANNELS = 2,
MIX_MAX_VOLUME = 128,
MIX_CHANNEL_POST = -2,
}
version (LittleEndian)
{
    enum 
{
MIX_DEFAULT_FORMAT = AUDIO_S16LSB,
}
}
else
{
    enum 
{
MIX_DEFAULT_FORMAT = AUDIO_S16MSB,
}
}
string MIX_EFFECTSMAXSPEED = "MIX_EFFECTSMAXSPEED";
extern (C) 
{
    alias void function(int chan, void* stream, int len, void* udata) Mix_EffectFunc_t;
    alias void function(int chan, void* udata) Mix_EffectDone_t;
}
void SDL_MIXER_VERSION(SDL_version* X)
{
X.major = SDL_MIXER_MAJOR_VERSION;
X.minor = SDL_MIXER_MINOR_VERSION;
X.patch = SDL_MIXER_PATCHLEVEL;
}
alias SDL_MIXER_VERSION MIX_VERSION;
Mix_Chunk* Mix_LoadWAV(string file)
{
return Mix_LoadWAV_RW(SDL_RWFromFile(toCString(file),toCString("rb")),1);
}
int Mix_PlayChannel(int channel, Mix_Chunk* chunk, int loops)
{
return Mix_PlayChannelTimed(channel,chunk,loops,-1);
}
int Mix_FadeInChannel(int channel, Mix_Chunk* chunk, int loops, int ms)
{
return Mix_FadeInChannelTimed(channel,chunk,loops,ms,-1);
}
extern (C) 
{
    alias CSDLVERPTR function() da_Mix_Linked_Version;
    alias int function(int) da_Mix_Init;
    alias void function() da_Mix_Quit;
    alias int function(int, Uint16, int, int) da_Mix_OpenAudio;
    alias int function(int) da_Mix_AllocateChannels;
    alias int function(int*, Uint16*, int*) da_Mix_QuerySpec;
    alias Mix_Chunk* function(SDL_RWops*, int) da_Mix_LoadWAV_RW;
    alias Mix_Music* function(in char*) da_Mix_LoadMUS;
    alias Mix_Music* function(SDL_RWops*) da_Mix_LoadMUS_RW;
    alias Mix_Music* function(SDL_RWops*, Mix_MusicType, int) da_Mix_LoadMUSType_RW;
    alias Mix_Chunk* function(Uint8*) da_Mix_QuickLoad_WAV;
    alias Mix_Chunk* function(Uint8*, Uint32) da_Mix_QuickLoad_RAW;
    alias void function(Mix_Chunk*) da_Mix_FreeChunk;
    alias void function(Mix_Music*) da_Mix_FreeMusic;
    alias int function() da_Mix_GetNumChunkDecoders;
    alias CCPTR function(int) da_Mix_GetChunkDecoder;
    alias int function() da_Mix_GetNumMusicDecoders;
    alias CCPTR function(int) da_Mix_GetMusicDecoder;
    alias Mix_MusicType function(in Mix_Music*) da_Mix_GetMusicType;
    alias void function(void function(void*, Uint8*, int) da_Mix_func, void*) da_Mix_SetPostMix;
    alias void function(void function(void*, Uint8*, int) da_Mix_func, void*) da_Mix_HookMusic;
    alias void function(void function() music_finished) da_Mix_HookMusicFinished;
    alias void* function() da_Mix_GetMusicHookData;
    alias void function(void function(int channel) channel_finished) da_Mix_ChannelFinished;
    alias int function(int, Mix_EffectFunc_t, Mix_EffectDone_t, void*) da_Mix_RegisterEffect;
    alias int function(int, Mix_EffectFunc_t) da_Mix_UnregisterEffect;
    alias int function(int) da_Mix_UnregisterAllEffects;
    alias int function(int, Uint8, Uint8) da_Mix_SetPanning;
    alias int function(int, Sint16, Uint8) da_Mix_SetPosition;
    alias int function(int, Uint8) da_Mix_SetDistance;
    alias int function(int, int) da_Mix_SetReverseStereo;
    alias int function(int) da_Mix_ReserveChannels;
    alias int function(int, int) da_Mix_GroupChannel;
    alias int function(int, int, int) da_Mix_GroupChannels;
    alias int function(int) da_Mix_GroupAvailable;
    alias int function(int) da_Mix_GroupCount;
    alias int function(int) da_Mix_GroupOldest;
    alias int function(int) da_Mix_GroupNewer;
    alias int function(int, Mix_Chunk*, int, int) da_Mix_PlayChannelTimed;
    alias int function(Mix_Music*, int) da_Mix_PlayMusic;
    alias int function(Mix_Music*, int, int) da_Mix_FadeInMusic;
    alias int function(Mix_Music*, int, int, double) da_Mix_FadeInMusicPos;
    alias int function(int, Mix_Chunk*, int, int, int) da_Mix_FadeInChannelTimed;
    alias int function(int, int) da_Mix_Volume;
    alias int function(Mix_Chunk*, int) da_Mix_VolumeChunk;
    alias int function(int) da_Mix_VolumeMusic;
    alias int function(int) da_Mix_HaltChannel;
    alias int function(int) da_Mix_HaltGroup;
    alias int function() da_Mix_HaltMusic;
    alias int function(int, int) da_Mix_ExpireChannel;
    alias int function(int, int) da_Mix_FadeOutChannel;
    alias int function(int, int) da_Mix_FadeOutGroup;
    alias int function(int) da_Mix_FadeOutMusic;
    alias Mix_Fading function() da_Mix_FadingMusic;
    alias Mix_Fading function(int) da_Mix_FadingChannel;
    alias void function(int) da_Mix_Pause;
    alias void function(int) da_Mix_Resume;
    alias int function(int) da_Mix_Paused;
    alias void function() da_Mix_PauseMusic;
    alias void function() da_Mix_ResumeMusic;
    alias void function() da_Mix_RewindMusic;
    alias int function() da_Mix_PausedMusic;
    alias int function(double) da_Mix_SetMusicPosition;
    alias int function(int) da_Mix_Playing;
    alias int function() da_Mix_PlayingMusic;
    alias int function(in char*) da_Mix_SetMusicCMD;
    alias int function(int) da_Mix_SetSynchroValue;
    alias int function() da_Mix_GetSynchroValue;
    alias Mix_Chunk* function(int) da_Mix_GetChunk;
    alias void function() da_Mix_CloseAudio;
}
mixin(gsharedString!() ~ "\x0ada_Mix_Linked_Version Mix_Linked_Version;\x0ada_Mix_Init Mix_Init;\x0ada_Mix_Quit Mix_Quit;\x0ada_Mix_OpenAudio Mix_OpenAudio;\x0ada_Mix_AllocateChannels Mix_AllocateChannels;\x0ada_Mix_QuerySpec Mix_QuerySpec;\x0ada_Mix_LoadWAV_RW Mix_LoadWAV_RW;\x0ada_Mix_LoadMUS Mix_LoadMUS;\x0ada_Mix_LoadMUS_RW Mix_LoadMUS_RW;\x0ada_Mix_LoadMUSType_RW Mix_LoadMUSType_RW;\x0ada_Mix_QuickLoad_WAV Mix_QuickLoad_WAV;\x0ada_Mix_QuickLoad_RAW Mix_QuickLoad_RAW;\x0ada_Mix_FreeChunk Mix_FreeChunk;\x0ada_Mix_FreeMusic Mix_FreeMusic;\x0ada_Mix_GetNumChunkDecoders Mix_GetNumChunkDecoders;\x0ada_Mix_GetChunkDecoder Mix_GetChunkDecoder;\x0ada_Mix_GetNumMusicDecoders Mix_GetNumMusicDecoders;\x0ada_Mix_GetMusicDecoder Mix_GetMusicDecoder;\x0ada_Mix_GetMusicType Mix_GetMusicType;\x0ada_Mix_SetPostMix Mix_SetPostMix;\x0ada_Mix_HookMusic Mix_HookMusic;\x0ada_Mix_HookMusicFinished Mix_HookMusicFinished;\x0ada_Mix_GetMusicHookData Mix_GetMusicHookData;\x0ada_Mix_ChannelFinished Mix_ChannelFinished;\x0ada_Mix_RegisterEffect Mix_RegisterEffect;\x0ada_Mix_UnregisterEffect Mix_UnregisterEffect;\x0ada_Mix_UnregisterAllEffects Mix_UnregisterAllEffects;\x0ada_Mix_SetPanning Mix_SetPanning;\x0ada_Mix_SetPosition Mix_SetPosition;\x0ada_Mix_SetDistance Mix_SetDistance;\x0a// da_ Mix_SetReverb;\x0ada_Mix_SetReverseStereo Mix_SetReverseStereo;\x0ada_Mix_ReserveChannels Mix_ReserveChannels;\x0ada_Mix_GroupChannel Mix_GroupChannel;\x0ada_Mix_GroupChannels Mix_GroupChannels;\x0ada_Mix_GroupAvailable Mix_GroupAvailable;\x0ada_Mix_GroupCount Mix_GroupCount;\x0ada_Mix_GroupOldest Mix_GroupOldest;\x0ada_Mix_GroupNewer Mix_GroupNewer;\x0ada_Mix_PlayChannelTimed Mix_PlayChannelTimed;\x0ada_Mix_PlayMusic Mix_PlayMusic;\x0ada_Mix_FadeInMusic Mix_FadeInMusic;\x0ada_Mix_FadeInMusicPos Mix_FadeInMusicPos;\x0ada_Mix_FadeInChannelTimed Mix_FadeInChannelTimed;\x0ada_Mix_Volume Mix_Volume;\x0ada_Mix_VolumeChunk Mix_VolumeChunk;\x0ada_Mix_VolumeMusic Mix_VolumeMusic;\x0ada_Mix_HaltChannel Mix_HaltChannel;\x0ada_Mix_HaltGroup Mix_HaltGroup;\x0ada_Mix_HaltMusic Mix_HaltMusic;\x0ada_Mix_ExpireChannel Mix_ExpireChannel;\x0ada_Mix_FadeOutChannel Mix_FadeOutChannel;\x0ada_Mix_FadeOutGroup Mix_FadeOutGroup;\x0ada_Mix_FadeOutMusic Mix_FadeOutMusic;\x0ada_Mix_FadingMusic Mix_FadingMusic;\x0ada_Mix_FadingChannel Mix_FadingChannel;\x0ada_Mix_Pause Mix_Pause;\x0ada_Mix_Resume Mix_Resume;\x0ada_Mix_Paused Mix_Paused;\x0ada_Mix_PauseMusic Mix_PauseMusic;\x0ada_Mix_ResumeMusic Mix_ResumeMusic;\x0ada_Mix_RewindMusic Mix_RewindMusic;\x0ada_Mix_PausedMusic Mix_PausedMusic;\x0ada_Mix_SetMusicPosition Mix_SetMusicPosition;\x0ada_Mix_Playing Mix_Playing;\x0ada_Mix_PlayingMusic Mix_PlayingMusic;\x0ada_Mix_SetMusicCMD Mix_SetMusicCMD;\x0ada_Mix_SetSynchroValue Mix_SetSynchroValue;\x0ada_Mix_GetSynchroValue Mix_GetSynchroValue;\x0ada_Mix_GetChunk Mix_GetChunk;\x0ada_Mix_CloseAudio Mix_CloseAudio;\x0a");
class DerelictSDLMixerLoader : SharedLibLoader
{
    public 
{
    this()
{
super("SDL_mixer.dll","libSDL_mixer.so, libSDL_mixer-1.2.so, libSDL_mixer-1.2.so.0","../Frameworks/SDL_mixer.framework/SDL_mixer, /Library/Frameworks/SDL_mixer.framework/SDL_mixer, /System/Library/Frameworks/SDL_mixer.framework/SDL_mixer");
}
    protected override void loadSymbols();


}
}
DerelictSDLMixerLoader DerelictSDLMixer;
static this();
