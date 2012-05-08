// D import file generated from 'derelict\ogg\vorbisencfuncs.d'
module derelict.ogg.vorbisencfuncs;
private 
{
    import derelict.util.compat;
    import derelict.ogg.vorbistypes;
}
extern (C) 
{
    alias int function(vorbis_info*, c_long, c_long, c_long, c_long, c_long) da_vorbis_encode_init;
    alias int function(vorbis_info*, c_long, c_long, c_long, c_long, c_long) da_vorbis_encode_setup_managed;
    alias int function(vorbis_info*, c_long, c_long, float) da_vorbis_encode_setup_vbr;
    alias int function(vorbis_info*, c_long, c_long, float) da_vorbis_encode_init_vbr;
    alias int function(vorbis_info*) da_vorbis_encode_setup_init;
    alias int function(vorbis_info*, int, void*) da_vorbis_encode_ctl;
}
mixin(gsharedString!() ~ "\x0ada_vorbis_encode_init vorbis_encode_init;\x0ada_vorbis_encode_setup_managed vorbis_encode_setup_managed;\x0ada_vorbis_encode_setup_vbr vorbis_encode_setup_vbr;\x0ada_vorbis_encode_init_vbr vorbis_encode_init_vbr;\x0ada_vorbis_encode_setup_init vorbis_encode_setup_init;\x0ada_vorbis_encode_ctl vorbis_encode_ctl;\x0a\x0a");
