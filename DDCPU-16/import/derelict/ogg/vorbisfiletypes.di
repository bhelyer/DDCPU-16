// D import file generated from 'derelict\ogg\vorbisfiletypes.d'
module derelict.ogg.vorbisfiletypes;
private 
{
    import derelict.util.compat;
    import derelict.ogg.oggtypes;
    import derelict.ogg.vorbistypes;
    import derelict.ogg.vorbisenctypes;
}
extern (C) struct ov_callbacks
{
    size_t function(void* ptr, size_t size, size_t nmemb, void* datasource) read_func;
    int function(void* datasource, ogg_int64_t offset, int whence) seek_func;
    int function(void* datasource) close_func;
    c_long function(void* datasource) tell_func;
}

enum 
{
NOTOPEN = 0,
PARTOPEN = 1,
OPENED = 2,
STREAMSET = 3,
INITSET = 4,
}
struct OggVorbis_File
{
    void* datasource;
    int seekable;
    ogg_int64_t offset;
    ogg_int64_t end;
    ogg_sync_state oy;
    int links;
    ogg_int64_t* offsets;
    ogg_int64_t* dataoffsets;
    c_long* serialnos;
    ogg_int64_t* pcmlengths;
    vorbis_info* vi;
    vorbis_comment* vc;
    ogg_int64_t pcm_offset;
    int ready_state;
    c_long current_serialno;
    int current_link;
    double bittrack;
    double samptrack;
    ogg_stream_state os;
    vorbis_dsp_state vd;
    vorbis_block vb;
    ov_callbacks callbacks;
}
