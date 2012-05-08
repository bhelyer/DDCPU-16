// D import file generated from 'derelict\ogg\vorbisfile.d'
module derelict.ogg.vorbisfile;
public 
{
    import derelict.ogg.vorbisfiletypes;
    import derelict.ogg.vorbisfilefuncs;
}
private import derelict.util.loader;

class DerelictVorbisFileLoader : SharedLibLoader
{
    public 
{
    this()
{
super("vorbisfile.dll, libvorbisfile.dll","libvorbisfile.so, libvorbisfile.so.3, libvorbisfile.so.3.1.0","");
}
    protected override void loadSymbols()
{
bindFunc(cast(void**)&ov_clear,"ov_clear");
bindFunc(cast(void**)&ov_open_callbacks,"ov_open_callbacks");
bindFunc(cast(void**)&ov_test_callbacks,"ov_test_callbacks");
bindFunc(cast(void**)&ov_test_open,"ov_test_open");
bindFunc(cast(void**)&ov_bitrate,"ov_bitrate");
bindFunc(cast(void**)&ov_bitrate_instant,"ov_bitrate_instant");
bindFunc(cast(void**)&ov_streams,"ov_streams");
bindFunc(cast(void**)&ov_seekable,"ov_seekable");
bindFunc(cast(void**)&ov_serialnumber,"ov_serialnumber");
bindFunc(cast(void**)&ov_raw_total,"ov_raw_total");
bindFunc(cast(void**)&ov_pcm_total,"ov_pcm_total");
bindFunc(cast(void**)&ov_time_total,"ov_time_total");
bindFunc(cast(void**)&ov_raw_seek,"ov_raw_seek");
bindFunc(cast(void**)&ov_pcm_seek,"ov_pcm_seek");
bindFunc(cast(void**)&ov_pcm_seek_page,"ov_pcm_seek_page");
bindFunc(cast(void**)&ov_time_seek,"ov_time_seek");
bindFunc(cast(void**)&ov_time_seek_page,"ov_time_seek_page");
bindFunc(cast(void**)&ov_raw_seek_lap,"ov_raw_seek_lap");
bindFunc(cast(void**)&ov_pcm_seek_lap,"ov_pcm_seek_lap");
bindFunc(cast(void**)&ov_pcm_seek_page_lap,"ov_pcm_seek_page_lap");
bindFunc(cast(void**)&ov_time_seek_lap,"ov_time_seek_lap");
bindFunc(cast(void**)&ov_time_seek_page_lap,"ov_time_seek_page_lap");
bindFunc(cast(void**)&ov_raw_tell,"ov_raw_tell");
bindFunc(cast(void**)&ov_pcm_tell,"ov_pcm_tell");
bindFunc(cast(void**)&ov_time_tell,"ov_time_tell");
bindFunc(cast(void**)&ov_info,"ov_info");
bindFunc(cast(void**)&ov_comment,"ov_comment");
bindFunc(cast(void**)&ov_read_float,"ov_read_float");
bindFunc(cast(void**)&ov_read_filter,"ov_read_filter");
bindFunc(cast(void**)&ov_read,"ov_read");
bindFunc(cast(void**)&ov_crosslap,"ov_crosslap");
bindFunc(cast(void**)&ov_halfrate,"ov_halfrate");
bindFunc(cast(void**)&ov_halfrate_p,"ov_halfrate_p");
}


}
}
DerelictVorbisFileLoader DerelictVorbisFile;
static this();
