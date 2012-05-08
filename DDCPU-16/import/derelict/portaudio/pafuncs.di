// D import file generated from 'derelict\portaudio\pafuncs.d'
module derelict.portaudio.pafuncs;
private 
{
    import derelict.util.compat;
    import derelict.portaudio.patypes;
}
extern (C) 
{
    alias int function() da_Pa_GetVersion;
    alias CCPTR function() da_Pa_GetVersionText;
    alias CCPTR function(PaError errorCode) da_Pa_GetErrorText;
    alias PaError function() da_Pa_Initialize;
    alias PaError function() da_Pa_Terminate;
    alias PaHostApiIndex function() da_Pa_GetHostApiCount;
    alias PaHostApiIndex function() da_Pa_GetDefaultHostApi;
    alias CPHAIPTR function(PaHostApiIndex) da_Pa_GetHostApiInfo;
    alias PaHostApiIndex function(PaHostApiTypeId) da_Pa_HostApiTypeIdToHostApiIndex;
    alias PaDeviceIndex function(PaHostApiIndex, int) da_Pa_HostApiDeviceIndexToDeviceIndex;
    alias CPHEIPTR function() da_Pa_GetLastHostErrorInfo;
    alias PaDeviceIndex function() da_Pa_GetDeviceCount;
    alias PaDeviceIndex function() da_Pa_GetDefaultInputDevice;
    alias PaDeviceIndex function() da_Pa_GetDefaultOutputDevice;
    alias CPDIPTR function(PaDeviceIndex) da_Pa_GetDeviceInfo;
    alias PaError function(in PaStreamParameters*, in PaStreamParameters*, double) da_Pa_IsFormatSupported;
    alias PaError function(PaStream**, in PaStreamParameters*, in PaStreamParameters*, double, c_ulong, PaStreamFlags, PaStreamCallback, void*) da_Pa_OpenStream;
    alias PaError function(PaStream**, int, int, PaSampleFormat, double, c_ulong, PaStreamCallback, void*) da_Pa_OpenDefaultStream;
    alias PaError function(PaStream*) da_Pa_CloseStream;
    alias PaError function(PaStream*, void function(void*)) da_Pa_SetStreamFinishedCallback;
    alias PaError function(PaStream*) da_Pa_StartStream;
    alias PaError function(PaStream*) da_Pa_StopStream;
    alias PaError function(PaStream*) da_Pa_AbortStream;
    alias PaError function(PaStream*) da_Pa_IsStreamStopped;
    alias PaError function(PaStream*) da_Pa_IsStreamActive;
    alias CPSIPTR function(PaStream*) da_Pa_GetStreamInfo;
    alias PaTime function(PaStream*) da_Pa_GetStreamTime;
    alias double function(PaStream*) da_Pa_GetStreamCpuLoad;
    alias PaError function(PaStream*, void*, c_ulong) da_Pa_ReadStream;
    alias PaError function(PaStream*, in void*, c_ulong) da_Pa_WriteStream;
    alias c_long function(PaStream*) da_Pa_GetStreamReadAvailable;
    alias c_long function(PaStream*) da_Pa_GetStreamWriteAvailable;
    alias PaError function(PaSampleFormat) da_Pa_GetSampleSize;
    alias void function(c_long) da_Pa_Sleep;
}
mixin(gsharedString!() ~ "\x0ada_Pa_GetVersion Pa_GetVersion;\x0ada_Pa_GetVersionText Pa_GetVersionText;\x0ada_Pa_GetErrorText Pa_GetErrorText;\x0ada_Pa_Initialize Pa_Initialize;\x0ada_Pa_Terminate Pa_Terminate;\x0ada_Pa_GetHostApiCount Pa_GetHostApiCount;\x0ada_Pa_GetDefaultHostApi Pa_GetDefaultHostApi;\x0ada_Pa_GetHostApiInfo Pa_GetHostApiInfo;\x0ada_Pa_HostApiTypeIdToHostApiIndex Pa_HostApiTypeIdToHostApiIndex;\x0ada_Pa_HostApiDeviceIndexToDeviceIndex Pa_HostApiDeviceIndexToDeviceIndex;\x0ada_Pa_GetLastHostErrorInfo Pa_GetLastHostErrorInfo;\x0ada_Pa_GetDeviceCount Pa_GetDeviceCount;\x0ada_Pa_GetDefaultInputDevice Pa_GetDefaultInputDevice;\x0ada_Pa_GetDefaultOutputDevice Pa_GetDefaultOutputDevice;\x0ada_Pa_GetDeviceInfo Pa_GetDeviceInfo;\x0ada_Pa_IsFormatSupported Pa_IsFormatSupported;\x0ada_Pa_OpenStream Pa_OpenStream;\x0ada_Pa_OpenDefaultStream Pa_OpenDefaultStream;\x0ada_Pa_CloseStream Pa_CloseStream;\x0ada_Pa_SetStreamFinishedCallback Pa_SetStreamFinishedCallback;\x0ada_Pa_StartStream Pa_StartStream;\x0ada_Pa_StopStream Pa_StopStream;\x0ada_Pa_AbortStream Pa_AbortStream;\x0ada_Pa_IsStreamStopped Pa_IsStreamStopped;\x0ada_Pa_IsStreamActive Pa_IsStreamActive;\x0ada_Pa_GetStreamInfo Pa_GetStreamInfo;\x0ada_Pa_GetStreamTime Pa_GetStreamTime;\x0ada_Pa_GetStreamCpuLoad Pa_GetStreamCpuLoad;\x0ada_Pa_ReadStream Pa_ReadStream;\x0ada_Pa_WriteStream Pa_WriteStream;\x0ada_Pa_GetStreamReadAvailable Pa_GetStreamReadAvailable;\x0ada_Pa_GetStreamWriteAvailable Pa_GetStreamWriteAvailable;\x0ada_Pa_GetSampleSize Pa_GetSampleSize;\x0ada_Pa_Sleep Pa_Sleep;\x0a");
