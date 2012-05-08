// D import file generated from 'derelict\portaudio\pa.d'
module derelict.portaudio.pa;
public 
{
    import derelict.portaudio.patypes;
    import derelict.portaudio.pafuncs;
}
private import derelict.util.loader;

class DerelictPALoader : SharedLibLoader
{
    public 
{
    this()
{
super("PortAudio.dll","portaudio.so,libportaudio.so","");
}
    protected override void loadSymbols()
{
bindFunc(cast(void**)&Pa_GetVersion,"Pa_GetVersion");
bindFunc(cast(void**)&Pa_GetVersionText,"Pa_GetVersionText");
bindFunc(cast(void**)&Pa_GetErrorText,"Pa_GetErrorText");
bindFunc(cast(void**)&Pa_Initialize,"Pa_Initialize");
bindFunc(cast(void**)&Pa_Terminate,"Pa_Terminate");
bindFunc(cast(void**)&Pa_GetDefaultHostApi,"Pa_GetDefaultHostApi");
bindFunc(cast(void**)&Pa_GetHostApiInfo,"Pa_GetHostApiInfo");
bindFunc(cast(void**)&Pa_HostApiTypeIdToHostApiIndex,"Pa_HostApiTypeIdToHostApiIndex");
bindFunc(cast(void**)&Pa_HostApiDeviceIndexToDeviceIndex,"Pa_HostApiDeviceIndexToDeviceIndex");
bindFunc(cast(void**)&Pa_GetLastHostErrorInfo,"Pa_GetLastHostErrorInfo");
bindFunc(cast(void**)&Pa_GetDeviceCount,"Pa_GetDeviceCount");
bindFunc(cast(void**)&Pa_GetDefaultInputDevice,"Pa_GetDefaultInputDevice");
bindFunc(cast(void**)&Pa_GetDefaultOutputDevice,"Pa_GetDefaultOutputDevice");
bindFunc(cast(void**)&Pa_GetDeviceInfo,"Pa_GetDeviceInfo");
bindFunc(cast(void**)&Pa_IsFormatSupported,"Pa_IsFormatSupported");
bindFunc(cast(void**)&Pa_OpenStream,"Pa_OpenStream");
bindFunc(cast(void**)&Pa_OpenDefaultStream,"Pa_OpenDefaultStream");
bindFunc(cast(void**)&Pa_CloseStream,"Pa_CloseStream");
bindFunc(cast(void**)&Pa_SetStreamFinishedCallback,"Pa_SetStreamFinishedCallback");
bindFunc(cast(void**)&Pa_StartStream,"Pa_StartStream");
bindFunc(cast(void**)&Pa_StopStream,"Pa_StopStream");
bindFunc(cast(void**)&Pa_AbortStream,"Pa_AbortStream");
bindFunc(cast(void**)&Pa_IsStreamStopped,"Pa_IsStreamStopped");
bindFunc(cast(void**)&Pa_IsStreamActive,"Pa_IsStreamActive");
bindFunc(cast(void**)&Pa_GetStreamInfo,"Pa_GetStreamInfo");
bindFunc(cast(void**)&Pa_GetStreamTime,"Pa_GetStreamTime");
bindFunc(cast(void**)&Pa_GetStreamCpuLoad,"Pa_GetStreamCpuLoad");
bindFunc(cast(void**)&Pa_ReadStream,"Pa_ReadStream");
bindFunc(cast(void**)&Pa_WriteStream,"Pa_WriteStream");
bindFunc(cast(void**)&Pa_GetStreamReadAvailable,"Pa_GetStreamReadAvailable");
bindFunc(cast(void**)&Pa_GetStreamWriteAvailable,"Pa_GetStreamWriteAvailable");
bindFunc(cast(void**)&Pa_GetSampleSize,"Pa_GetSampleSize");
bindFunc(cast(void**)&Pa_Sleep,"Pa_Sleep");
}


}
}
DerelictPALoader DerelictPA;
static this();
