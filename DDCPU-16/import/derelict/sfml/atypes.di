// D import file generated from 'derelict\sfml\atypes.d'
module derelict.sfml.atypes;
private import derelict.sfml.config;

extern (C) 
{
    alias sfBool function(void*) sfSoundRecorderStartCallback;
    alias sfBool function(in sfInt16*, size_t, void*) sfSoundRecorderProcessCallback;
    alias void function(void*) sfSoundRecorderStopCallback;
}
alias int sfSoundStatus;
enum 
{
sfStopped,
sfPaused,
sfPlaying,
}
struct sfSoundStreamChunk
{
    sfInt16* Samples;
    uint NbSamples;
}
extern (C) 
{
    alias sfBool function(void*) sfSoundStreamStartCallback;
    alias sfBool function(sfSoundStreamChunk*, void*) sfSoundStreamGetDataCallback;
}
struct sfMusic;
struct sfSound;
struct sfSoundBuffer;
struct sfSoundBufferRecorder;
struct sfSoundRecorder;
struct sfSoundStream;
