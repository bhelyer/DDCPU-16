// D import file generated from 'derelict\portaudio\patypes.d'
module derelict.portaudio.patypes;
private import derelict.util.compat;

enum PaError 
{
paNoError = 0,
paNotInitialized = -10000,
paUnanticipatedHostError,
paInvalidChannelCount,
}
enum PaErrorCode 
{
paNoError,
paNotInitialized = -10000,
paUnanticipatedHostError,
paInvalidChannelCount,
paInvalidSampleRate,
paInvalidDevice,
paInvalidFlag,
paSampleFormatNotSupported,
paBadIODeviceCombination,
paInsufficientMemory,
paBufferTooBig,
paBufferTooSmall,
paNullCallback,
paBadStreamPtr,
paTimedOut,
paInternalError,
paDeviceUnavailable,
paIncompatibleHostApiSpecificStreamInfo,
paStreamIsStopped,
paStreamIsNotStopped,
paInputOverflowed,
paOutputUnderflowed,
paHostApiNotFound,
paInvalidHostApi,
paCanNotReadFromACallbackStream,
paCanNotWriteToACallbackStream,
paCanNotReadFromAnOutputOnlyStream,
paCanNotWriteToAnInputOnlyStream,
paIncompatibleStreamHostApi,
paBadBufferPtr,
}
alias int PaDeviceIndex;
alias int PaHostApiIndex;
version (D_Version2)
{
    mixin("alias const(PaHostApiInfo)* CPHAIPTR;");
}
else
{
    alias PaHostApiInfo* CPHAIPTR;
}
enum PaHostApiTypeId 
{
paInDevelopment,
paDirectSound,
paMME,
paASIO,
paSoundManager,
paCoreAudio,
paOSS = 7,
paALSA,
paAL,
paBeOS,
paWDMKS,
paJACK,
paWASAPI,
paAudioScienceHPI,
}
struct PaHostApiInfo
{
    int structVersion;
    PaHostApiTypeId type;
    CCPTR name;
    int deviceCount;
    PaDeviceIndex defaultInputDevice;
    PaDeviceIndex defaultOutputDevice;
}
struct PaHostErrorInfo
{
    PaHostApiTypeId hostApiType;
    c_long errorCode;
    CCPTR errorText;
}
version (D_Version2)
{
    mixin("alias const(PaHostErrorInfo)* CPHEIPTR;");
}
else
{
    alias PaDeviceInfo* CPHEIPTR;
}
alias double PaTime;
alias c_ulong PaSampleFormat;
enum : PaSampleFormat
{
paFloat32 = 1,
paInt32 = 2,
paInt24 = 4,
paInt16 = 8,
paInt8 = 16,
paUInt8 = 32,
paCustomFormat = 65536,
paNonInterleaved = -2147483648u,
}
struct PaDeviceInfo
{
    int structVersion;
    CCPTR name;
    PaHostApiIndex hostApi;
    int maxInputChannels;
    int maxOutputChannels;
    PaTime defaultLowInputLatency;
    PaTime defaultLowOutputLatency;
    PaTime defaultHighInputLatency;
    PaTime defaultHighOutputLatency;
    double defaultSampleRate;
}
version (D_Version2)
{
    mixin("alias const(PaDeviceInfo)* CPDIPTR;");
}
else
{
    alias PaDeviceInfo* CPDIPTR;
}
struct PaStreamParameters
{
    PaDeviceIndex device;
    int channelCount;
    PaSampleFormat sampleFormat;
    PaTime suggestedLatency;
    void* hostApiSpecificStreamInfo;
}
alias void PaStream;
alias c_ulong PaStreamFlags;
enum : PaStreamFlags
{
paClipOff = 1,
paDitherOff = 2,
}
struct PaStreamCallbackTimeInfo
{
    PaTime inputBufferAdcTime;
    PaTime currentTime;
    PaTime outputBufferDacTime;
}
alias c_ulong PaStreamCallbackFlags;
enum PaStreamCallbackResult 
{
paContinue,
paComplete,
paAbort,
}
struct PaStreamInfo
{
    int structVersion;
    PaTime inputLatency;
    PaTime outputLatency;
    double sampleRate;
}
version (D_Version2)
{
    mixin("alias const(PaStreamInfo)* CPSIPTR;");
}
else
{
    alias PaStreamInfo* CPSIPTR;
}
extern (C) 
{
    alias void function(void*) PaStreamFinishedCallback;
    alias int function(in void*, void*, c_ulong, in PaStreamCallbackTimeInfo*, PaStreamCallbackFlags, void*) PaStreamCallback;
}
