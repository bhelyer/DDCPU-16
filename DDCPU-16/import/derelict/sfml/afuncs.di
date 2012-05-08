// D import file generated from 'derelict\sfml\afuncs.d'
module derelict.sfml.afuncs;
private 
{
    import derelict.util.compat;
    import derelict.sfml.config;
    import derelict.sfml.atypes;
}
version (D_Version2)
{
    mixin("alias const(sfInt16*) SFI16PTR;");
}
else
{
    alias sfInt16* SFI16PTR;
}
extern (C) 
{
    alias void function(float) da_sfListener_SetGlobalVolume;
    alias float function() da_sfListener_GetGlobalVolume;
    alias void function(float, float, float) da_sfListener_SetPosition;
    alias void function(float*, float*, float*) da_sfListener_GetPosition;
    alias void function(float, float, float) da_sfListener_SetTarget;
    alias void function(float*, float*, float*) da_sfListener_GetTarget;
    alias sfMusic* function(CCPTR) da_sfMusic_CreateFromFile;
    alias sfMusic* function(in ubyte*, size_t) da_sfMusic_CreateFromMemory;
    alias void function(sfMusic*) da_sfMusic_Destroy;
    alias void function(sfMusic*, sfBool) da_sfMusic_SetLoop;
    alias sfBool function(sfMusic*) da_sfMusic_GetLoop;
    alias float function(sfMusic*) da_sfMusic_GetDuration;
    alias void function(sfMusic*) da_sfMusic_Play;
    alias void function(sfMusic*) da_sfMusic_Pause;
    alias void function(sfMusic*) da_sfMusic_Stop;
    alias uint function(sfMusic*) da_sfMusic_GetChannelsCount;
    alias uint function(sfMusic*) da_sfMusic_GetSampleRate;
    alias sfSoundStatus function(sfMusic*) da_sfMusic_GetStatus;
    alias float function(sfMusic*) da_sfMusic_GetPlayingOffset;
    alias void function(sfMusic*, float) da_sfMusic_SetPitch;
    alias void function(sfMusic*, float) da_sfMusic_SetVolume;
    alias void function(sfMusic*, float, float, float) da_sfMusic_SetPosition;
    alias void function(sfMusic*, sfBool) da_sfMusic_SetRelativeToListener;
    alias void function(sfMusic*, float) da_sfMusic_SetMinDistance;
    alias void function(sfMusic*, float) da_sfMusic_SetAttenuation;
    alias float function(sfMusic*) da_sfMusic_GetPitch;
    alias float function(sfMusic*) da_sfMusic_GetVolume;
    alias void function(sfMusic*, float*, float*, float*) da_sfMusic_GetPosition;
    alias sfBool function(sfMusic*) da_sfMusic_IsRelativeToListener;
    alias float function(sfMusic*) da_sfMusic_GetMinDistance;
    alias float function(sfMusic*) da_sfMusic_GetAttenuation;
    alias sfSound* function() da_sfSound_Create;
    alias void function(sfSound*) da_sfSound_Destroy;
    alias void function(sfSound*) da_sfSound_Play;
    alias void function(sfSound*) da_sfSound_Pause;
    alias void function(sfSound*) da_sfSound_Stop;
    alias void function(sfSound*, sfSoundBuffer*) da_sfSound_SetBuffer;
    alias sfSoundBuffer* function(sfSound*) da_sfSound_GetBuffer;
    alias void function(sfSound*, sfBool) da_sfSound_SetLoop;
    alias sfBool function(sfSound*) da_sfSound_GetLoop;
    alias sfSoundStatus function(sfSound*) da_sfSound_GetStatus;
    alias void function(sfSound*, float) da_sfSound_SetPitch;
    alias void function(sfSound*, float) da_sfSound_SetVolume;
    alias void function(sfSound*, float, float, float) da_sfSound_SetPosition;
    alias void function(sfSound*, sfBool) da_sfSound_SetRelativeToListener;
    alias void function(sfSound*, float) da_sfSound_SetMinDistance;
    alias void function(sfSound*, float) da_sfSound_SetAttenuation;
    alias void function(sfSound*, float) da_sfSound_SetPlayingOffset;
    alias float function(sfSound*) da_sfSound_GetPitch;
    alias float function(sfSound*) da_sfSound_GetVolume;
    alias void function(sfSound*, float*, float*, float*) da_sfSound_GetPosition;
    alias sfBool function(sfSound*) da_sfSound_IsRelativeToListener;
    alias float function(sfSound*) da_sfSound_GetMinDistance;
    alias float function(sfSound*) da_sfSound_GetAttenuation;
    alias float function(sfSound*) da_sfSound_GetPlayingOffset;
    alias sfSoundBuffer* function(CCPTR) da_sfSoundBuffer_CreateFromFile;
    alias sfSoundBuffer* function(in ubyte*, size_t) da_sfSoundBuffer_CreateFromMemory;
    alias sfSoundBuffer* function(in sfInt16, size_t, uint, uint) da_sfSoundBuffer_CreateFromSamples;
    alias void function(sfSoundBuffer*) da_sfSoundBuffer_Destroy;
    alias sfBool function(sfSoundBuffer*, CCPTR) da_sfSoundBuffer_SaveToFile;
    alias SFI16PTR function(sfSoundBuffer*) da_sfSoundBuffer_GetSamples;
    alias size_t function(sfSoundBuffer*) da_sfSoundBuffer_GetSamplesCount;
    alias uint function(sfSoundBuffer*) da_sfSoundBuffer_GetSampleRate;
    alias uint function(sfSoundBuffer*) da_sfSoundBuffer_GetChannelsCount;
    alias float function(sfSoundBuffer*) da_sfSoundBuffer_GetDuration;
    alias sfSoundBufferRecorder* function() da_sfSoundBufferRecorder_Create;
    alias void function(sfSoundBufferRecorder*) da_sfSoundBufferRecorder_Destroy;
    alias void function(sfSoundBufferRecorder*, uint) da_sfSoundBufferRecorder_Start;
    alias void function(sfSoundBufferRecorder*) da_sfSoundBufferRecorder_Stop;
    alias uint function(sfSoundBufferRecorder*) da_sfSoundBufferRecorder_GetSampleRate;
    alias sfSoundBuffer* function(sfSoundBufferRecorder*) da_sfSoundBufferRecorder_GetBuffer;
    alias sfSoundRecorder* function(sfSoundRecorderStartCallback, sfSoundRecorderProcessCallback, sfSoundRecorderStopCallback, void*) da_sfSoundRecorder_Create;
    alias void function(sfSoundRecorder*) da_sfSoundRecorder_Destroy;
    alias void function(sfSoundRecorder*, uint) da_sfSoundRecorder_Start;
    alias void function(sfSoundRecorder*) da_sfSoundRecorder_Stop;
    alias uint function(sfSoundRecorder*) da_sfSoundRecorder_GetSampleRate;
    alias sfBool function(sfSoundRecorder*) da_sfSoundRecorder_CanCapture;
    alias sfSoundStream* function(sfSoundStreamStartCallback, sfSoundStreamGetDataCallback, uint, uint, void*) da_sfSoundStream_Create;
    alias void function(sfSoundStream*) da_sfSoundStream_Destroy;
    alias void function(sfSoundStream*) da_sfSoundStream_Play;
    alias void function(sfSoundStream*) da_sfSoundStream_Pause;
    alias void function(sfSoundStream*) da_sfSoundStream_Stop;
    alias sfSoundStatus function(sfSoundStream*) da_sfSoundStream_GetStatus;
    alias uint function(sfSoundStream*) da_sfSoundStream_GetChannelsCount;
    alias uint function(sfSoundStream*) da_sfSoundStream_GetSampleRate;
    alias void function(sfSoundStream*, float) da_sfSoundStream_SetPitch;
    alias void function(sfSoundStream*, float) da_sfSoundStream_SetVolume;
    alias void function(sfSoundStream*, float, float, float) da_sfSoundStream_SetPosition;
    alias void function(sfSoundStream*, sfBool) da_sfSoundStream_SetRelativeToListener;
    alias void function(sfSoundStream*, float) da_sfSoundStream_SetMinDistance;
    alias void function(sfSoundStream*, float) da_sfSoundStream_SetAttenuation;
    alias void function(sfSoundStream*, sfBool) da_sfSoundStream_SetLoop;
    alias float function(sfSoundStream*) da_sfSoundStream_GetPitch;
    alias float function(sfSoundStream*) da_sfSoundStream_GetVolume;
    alias void function(sfSoundStream*, float*, float*, float*) da_sfSoundStream_GetPosition;
    alias sfBool function(sfSoundStream*) da_sfSoundStream_IsRelativeToListener;
    alias float function(sfSoundStream*) da_sfSoundStream_GetMinDistance;
    alias float function(sfSoundStream*) da_sfSoundStream_GetAttenuation;
    alias sfBool function(sfSoundStream*) da_sfSoundStream_GetLoop;
    alias float function(sfSoundStream*) da_sfSoundStream_GetPlayingOffset;
}
mixin(gsharedString!() ~ "\x0ada_sfListener_SetGlobalVolume sfListener_SetGlobalVolume;\x0ada_sfListener_GetGlobalVolume sfListener_GetGlobalVolume;\x0ada_sfListener_SetPosition sfListener_SetPosition;\x0ada_sfListener_GetPosition sfListener_GetPosition;\x0ada_sfListener_SetTarget sfListener_SetTarget;\x0ada_sfListener_GetTarget sfListener_GetTarget;\x0ada_sfMusic_CreateFromFile sfMusic_CreateFromFile;\x0ada_sfMusic_CreateFromMemory sfMusic_CreateFromMemory;\x0ada_sfMusic_Destroy sfMusic_Destroy;\x0ada_sfMusic_SetLoop sfMusic_SetLoop;\x0ada_sfMusic_GetLoop sfMusic_GetLoop;\x0ada_sfMusic_GetDuration sfMusic_GetDuration;\x0ada_sfMusic_Play sfMusic_Play;\x0ada_sfMusic_Pause sfMusic_Pause;\x0ada_sfMusic_Stop sfMusic_Stop;\x0ada_sfMusic_GetChannelsCount sfMusic_GetChannelsCount;\x0ada_sfMusic_GetSampleRate sfMusic_GetSampleRate;\x0ada_sfMusic_GetStatus sfMusic_GetStatus;\x0ada_sfMusic_GetPlayingOffset sfMusic_GetPlayingOffset;\x0ada_sfMusic_SetPitch sfMusic_SetPitch;\x0ada_sfMusic_SetVolume sfMusic_SetVolume;\x0ada_sfMusic_SetPosition sfMusic_SetPosition;\x0ada_sfMusic_SetRelativeToListener sfMusic_SetRelativeToListener;\x0ada_sfMusic_SetMinDistance sfMusic_SetMinDistance;\x0ada_sfMusic_SetAttenuation sfMusic_SetAttenuation;\x0ada_sfMusic_GetPitch sfMusic_GetPitch;\x0ada_sfMusic_GetVolume sfMusic_GetVolume;\x0ada_sfMusic_GetPosition sfMusic_GetPosition;\x0ada_sfMusic_IsRelativeToListener sfMusic_IsRelativeToListener;\x0ada_sfMusic_GetMinDistance sfMusic_GetMinDistance;\x0ada_sfMusic_GetAttenuation sfMusic_GetAttenuation;\x0ada_sfSound_Create sfSound_Create;\x0ada_sfSound_Destroy sfSound_Destroy;\x0ada_sfSound_Play sfSound_Play;\x0ada_sfSound_Pause sfSound_Pause;\x0ada_sfSound_Stop sfSound_Stop;\x0ada_sfSound_SetBuffer sfSound_SetBuffer;\x0ada_sfSound_GetBuffer sfSound_GetBuffer;\x0ada_sfSound_SetLoop sfSound_SetLoop;\x0ada_sfSound_GetLoop sfSound_GetLoop;\x0ada_sfSound_GetStatus sfSound_GetStatus;\x0ada_sfSound_SetPitch sfSound_SetPitch;\x0ada_sfSound_SetVolume sfSound_SetVolume;\x0ada_sfSound_SetPosition sfSound_SetPosition;\x0ada_sfSound_SetRelativeToListener sfSound_SetRelativeToListener;\x0ada_sfSound_SetMinDistance sfSound_SetMinDistance;\x0ada_sfSound_SetAttenuation sfSound_SetAttenuation;\x0ada_sfSound_SetPlayingOffset sfSound_SetPlayingOffset;\x0ada_sfSound_GetPitch sfSound_GetPitch;\x0ada_sfSound_GetVolume sfSound_GetVolume;\x0ada_sfSound_GetPosition sfSound_GetPosition;\x0ada_sfSound_IsRelativeToListener sfSound_IsRelativeToListener;\x0ada_sfSound_GetMinDistance sfSound_GetMinDistance;\x0ada_sfSound_GetAttenuation sfSound_GetAttenuation;\x0ada_sfSound_GetPlayingOffset sfSound_GetPlayingOffset;\x0ada_sfSoundBuffer_CreateFromFile sfSoundBuffer_CreateFromFile;\x0ada_sfSoundBuffer_CreateFromMemory sfSoundBuffer_CreateFromMemory;\x0ada_sfSoundBuffer_CreateFromSamples sfSoundBuffer_CreateFromSamples;\x0ada_sfSoundBuffer_Destroy sfSoundBuffer_Destroy;\x0ada_sfSoundBuffer_SaveToFile sfSoundBuffer_SaveToFile;\x0ada_sfSoundBuffer_GetSamples sfSoundBuffer_GetSamples;\x0ada_sfSoundBuffer_GetSamplesCount sfSoundBuffer_GetSamplesCount;\x0ada_sfSoundBuffer_GetSampleRate sfSoundBuffer_GetSampleRate;\x0ada_sfSoundBuffer_GetChannelsCount sfSoundBuffer_GetChannelsCount;\x0ada_sfSoundBuffer_GetDuration sfSoundBuffer_GetDuration;\x0ada_sfSoundBufferRecorder_Create sfSoundBufferRecorder_Create;\x0ada_sfSoundBufferRecorder_Destroy sfSoundBufferRecorder_Destroy;\x0ada_sfSoundBufferRecorder_Start sfSoundBufferRecorder_Start;\x0ada_sfSoundBufferRecorder_Stop sfSoundBufferRecorder_Stop;\x0ada_sfSoundBufferRecorder_GetSampleRate sfSoundBufferRecorder_GetSampleRate;\x0ada_sfSoundBufferRecorder_GetBuffer sfSoundBufferRecorder_GetBuffer;\x0ada_sfSoundRecorder_Create sfSoundRecorder_Create;\x0ada_sfSoundRecorder_Destroy sfSoundRecorder_Destroy;\x0ada_sfSoundRecorder_Start sfSoundRecorder_Start;\x0ada_sfSoundRecorder_Stop sfSoundRecorder_Stop;\x0ada_sfSoundRecorder_GetSampleRate sfSoundRecorder_GetSampleRate;\x0ada_sfSoundRecorder_CanCapture sfSoundRecorder_CanCapture;\x0ada_sfSoundStream_Create sfSoundStream_Create;\x0ada_sfSoundStream_Destroy sfSoundStream_Destroy;\x0ada_sfSoundStream_Play sfSoundStream_Play;\x0ada_sfSoundStream_Pause sfSoundStream_Pause;\x0ada_sfSoundStream_Stop sfSoundStream_Stop;\x0ada_sfSoundStream_GetStatus sfSoundStream_GetStatus;\x0ada_sfSoundStream_GetChannelsCount sfSoundStream_GetChannelsCount;\x0ada_sfSoundStream_GetSampleRate sfSoundStream_GetSampleRate;\x0ada_sfSoundStream_SetPitch sfSoundStream_SetPitch;\x0ada_sfSoundStream_SetVolume sfSoundStream_SetVolume;\x0ada_sfSoundStream_SetPosition sfSoundStream_SetPosition;\x0ada_sfSoundStream_SetRelativeToListener sfSoundStream_SetRelativeToListener;\x0ada_sfSoundStream_SetMinDistance sfSoundStream_SetMinDistance;\x0ada_sfSoundStream_SetAttenuation sfSoundStream_SetAttenuation;\x0ada_sfSoundStream_SetLoop sfSoundStream_SetLoop;\x0ada_sfSoundStream_GetPitch sfSoundStream_GetPitch;\x0ada_sfSoundStream_GetVolume sfSoundStream_GetVolume;\x0ada_sfSoundStream_GetPosition sfSoundStream_GetPosition;\x0ada_sfSoundStream_IsRelativeToListener sfSoundStream_IsRelativeToListener;\x0ada_sfSoundStream_GetMinDistance sfSoundStream_GetMinDistance;\x0ada_sfSoundStream_GetAttenuation sfSoundStream_GetAttenuation;\x0ada_sfSoundStream_GetLoop sfSoundStream_GetLoop;\x0ada_sfSoundStream_GetPlayingOffset sfSoundStream_GetPlayingOffset;\x0a");
