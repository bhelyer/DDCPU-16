// D import file generated from 'derelict\ogg\vorbisenc.d'
module derelict.ogg.vorbisenc;
public 
{
    import derelict.ogg.vorbistypes;
    import derelict.ogg.vorbisenctypes;
    import derelict.ogg.vorbisencfuncs;
}
private import derelict.util.loader;

class DerelictVorbisEncLoader : SharedLibLoader
{
    public 
{
    this()
{
super("vorbisenc.dll, libvorbisenc.dll","libvorbisenc.so, libvorbisenc.so.0, libvorbisenc.so.0.3.0","");
}
    protected override void loadSymbols()
{
bindFunc(cast(void**)&vorbis_encode_init,"vorbis_encode_init");
bindFunc(cast(void**)&vorbis_encode_setup_managed,"vorbis_encode_setup_managed");
bindFunc(cast(void**)&vorbis_encode_setup_vbr,"vorbis_encode_setup_vbr");
bindFunc(cast(void**)&vorbis_encode_init_vbr,"vorbis_encode_init_vbr");
bindFunc(cast(void**)&vorbis_encode_setup_init,"vorbis_encode_setup_init");
bindFunc(cast(void**)&vorbis_encode_ctl,"vorbis_encode_ctl");
}


}
}
DerelictVorbisEncLoader DerelictVorbisEnc;
static this();
