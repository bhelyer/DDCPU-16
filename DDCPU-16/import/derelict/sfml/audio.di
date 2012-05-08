// D import file generated from 'derelict\sfml\audio.d'
module derelict.sfml.audio;
public 
{
    import derelict.sfml.atypes;
    import derelict.sfml.afuncs;
}
private import derelict.util.loader;

class DerelictSFMLAudioLoader : SharedLibLoader
{
    public 
{
    this()
{
super("csfml-audio.dll","libcsfml-audio.so,libcsfml-audio.so.1.6","../Frameworks/csfml-audio.framework/csfml-audio, /Library/Frameworks/csfml-audio.framework/csfml-audio, /System/Library/Frameworks/csfml-audio.framework/csfml-audio");
}
    protected override void loadSymbols();


}
}
DerelictSFMLAudioLoader DerelictSFMLAudio;
static this();
