// D import file generated from 'derelict\ogg\vorbisfilefuncs.d'
module derelict.ogg.vorbisfilefuncs;
private 
{
    import derelict.util.compat;
    import derelict.ogg.oggtypes;
    import derelict.ogg.vorbistypes;
    import derelict.ogg.vorbisfiletypes;
    version (Tango)
{
    import tango.stdc.stdio;
}
else
{
    import std.c.stdio;
}
}
extern (C) 
{
    alias int function(OggVorbis_File*) da_ov_clear;
    alias int function(void* datasource, OggVorbis_File*, CCPTR, c_long, ov_callbacks) da_ov_open_callbacks;
    alias int function(void*, OggVorbis_File*, CCPTR, c_long, ov_callbacks) da_ov_test_callbacks;
    alias int function(OggVorbis_File*) da_ov_test_open;
    alias c_long function(OggVorbis_File*, int) da_ov_bitrate;
    alias c_long function(OggVorbis_File*) da_ov_bitrate_instant;
    alias c_long function(OggVorbis_File*) da_ov_streams;
    alias c_long function(OggVorbis_File*) da_ov_seekable;
    alias c_long function(OggVorbis_File*, int) da_ov_serialnumber;
    alias ogg_int64_t function(OggVorbis_File*, int) da_ov_raw_total;
    alias ogg_int64_t function(OggVorbis_File*, int) da_ov_pcm_total;
    alias double function(OggVorbis_File*, int) da_ov_time_total;
    alias int function(OggVorbis_File*, ogg_int64_t) da_ov_raw_seek;
    alias int function(OggVorbis_File*, ogg_int64_t) da_ov_pcm_seek;
    alias int function(OggVorbis_File*, ogg_int64_t) da_ov_pcm_seek_page;
    alias int function(OggVorbis_File*, double) da_ov_time_seek;
    alias int function(OggVorbis_File*, double) da_ov_time_seek_page;
    alias int function(OggVorbis_File*, ogg_int64_t) da_ov_raw_seek_lap;
    alias int function(OggVorbis_File*, ogg_int64_t) da_ov_pcm_seek_lap;
    alias int function(OggVorbis_File*, ogg_int64_t) da_ov_pcm_seek_page_lap;
    alias int function(OggVorbis_File*, double) da_ov_time_seek_lap;
    alias int function(OggVorbis_File*, double) da_ov_time_seek_page_lap;
    alias ogg_int64_t function(OggVorbis_File*) da_ov_raw_tell;
    alias ogg_int64_t function(OggVorbis_File*) da_ov_pcm_tell;
    alias double function(OggVorbis_File*) da_ov_time_tell;
    alias vorbis_info* function(OggVorbis_File*, int) da_ov_info;
    alias vorbis_comment* function(OggVorbis_File*, int) da_ov_comment;
    alias c_long function(OggVorbis_File*, float***, int, int*) da_ov_read_float;
    alias c_long function(OggVorbis_File*, char*, int, int, int, int, int*) da_ov_read_filter;
    alias c_long function(OggVorbis_File*, byte*, int, int, int, int, int*) da_ov_read;
    alias int function(OggVorbis_File*, OggVorbis_File*) da_ov_crosslap;
    alias int function(OggVorbis_File*, int) da_ov_halfrate;
    alias int function(OggVorbis_File*) da_ov_halfrate_p;
}
private extern (C) 
{
    size_t Derelict_VorbisRead(void* ptr, size_t byteSize, size_t sizeToRead, void* datasource)
{
return fread(ptr,byteSize,sizeToRead,cast(FILE*)datasource);
}
    int Derelict_VorbisSeek(void* datasource, ogg_int64_t offset, int whence)
{
return fseek(cast(FILE*)datasource,cast(int)offset,whence);
}
    int Derelict_VorbisClose(void* datasource)
{
return fclose(cast(FILE*)datasource);
}
    c_long Derelict_VorbisTell(void* datasource)
{
return cast(c_long)ftell(cast(FILE*)datasource);
}
}

int ov_open(FILE* f, OggVorbis_File* vf, CCPTR initial, c_long ibytes)
{
ov_callbacks vorbisCallbacks;
vorbisCallbacks.read_func = &Derelict_VorbisRead;
vorbisCallbacks.close_func = &Derelict_VorbisClose;
vorbisCallbacks.seek_func = &Derelict_VorbisSeek;
vorbisCallbacks.tell_func = &Derelict_VorbisTell;
return ov_open_callbacks(cast(void*)f,vf,initial,cast(int)ibytes,vorbisCallbacks);
}
int ov_test(FILE* f, OggVorbis_File* vf, CCPTR initial, c_long ibytes)
{
ov_callbacks vorbisCallbacks;
vorbisCallbacks.read_func = &Derelict_VorbisRead;
vorbisCallbacks.close_func = &Derelict_VorbisClose;
vorbisCallbacks.seek_func = &Derelict_VorbisSeek;
vorbisCallbacks.tell_func = &Derelict_VorbisTell;
return ov_test_callbacks(cast(void*)f,vf,initial,cast(int)ibytes,vorbisCallbacks);
}
mixin(gsharedString!() ~ "\x0ada_ov_clear ov_clear;\x0ada_ov_open_callbacks ov_open_callbacks;\x0ada_ov_test_callbacks ov_test_callbacks;\x0ada_ov_test_open ov_test_open;\x0ada_ov_bitrate ov_bitrate;\x0ada_ov_bitrate_instant ov_bitrate_instant;\x0ada_ov_streams ov_streams;\x0ada_ov_seekable ov_seekable;\x0ada_ov_serialnumber ov_serialnumber;\x0ada_ov_raw_total ov_raw_total;\x0ada_ov_pcm_total ov_pcm_total;\x0ada_ov_time_total ov_time_total;\x0ada_ov_raw_seek ov_raw_seek;\x0ada_ov_pcm_seek ov_pcm_seek;\x0ada_ov_pcm_seek_page ov_pcm_seek_page;\x0ada_ov_time_seek ov_time_seek;\x0ada_ov_time_seek_page ov_time_seek_page;\x0ada_ov_raw_seek_lap ov_raw_seek_lap;\x0ada_ov_pcm_seek_lap ov_pcm_seek_lap;\x0ada_ov_pcm_seek_page_lap ov_pcm_seek_page_lap;\x0ada_ov_time_seek_lap ov_time_seek_lap;\x0ada_ov_time_seek_page_lap ov_time_seek_page_lap;\x0ada_ov_raw_tell ov_raw_tell;\x0ada_ov_pcm_tell ov_pcm_tell;\x0ada_ov_time_tell ov_time_tell;\x0ada_ov_info ov_info;\x0ada_ov_comment ov_comment;\x0ada_ov_read_float ov_read_float;\x0ada_ov_read_filter ov_read_filter;\x0ada_ov_read ov_read;\x0ada_ov_crosslap ov_crosslap;\x0ada_ov_halfrate ov_halfrate;\x0ada_ov_halfrate_p ov_halfrate_p;\x0a");
