// D import file generated from 'derelict\ogg\vorbistypes.d'
module derelict.ogg.vorbistypes;
private 
{
    import derelict.util.compat;
    import derelict.ogg.oggtypes;
}
enum 
{
OV_FALSE = -1,
OV_EOF = -2,
OV_HOLE = -3,
OV_EREAD = -128,
OV_EFAULT = -129,
OV_EIMPL = -130,
OV_EINVAL = -131,
OV_ENOTVORBIS = -132,
OV_EBADHEADER = -133,
OV_EVERSION = -134,
OV_ENOTAUDIO = -135,
OV_EBADPACKET = -136,
OV_EBADLINK = -137,
OV_ENOSEEK = -138,
}
struct vorbis_info
{
    int _version;
    int channels;
    int rate;
    c_long bitrate_upper;
    c_long bitrate_nominal;
    c_long bitrate_lower;
    c_long bitrate_window;
    void* codec_setup;
}
struct vorbis_dsp_state
{
    int analysisp;
    vorbis_info* vi;
    float** pcm;
    float** pcmret;
    int pcm_storage;
    int pcm_current;
    int pcm_returned;
    int preextrapolate;
    int eofflag;
    c_long lW;
    c_long W;
    c_long nW;
    c_long centerW;
    ogg_int64_t granulepos;
    ogg_int64_t sequence;
    ogg_int64_t glue_bits;
    ogg_int64_t time_bits;
    ogg_int64_t floor_bits;
    ogg_int64_t res_bits;
    void* backend_state;
}
struct vorbis_block
{
    float** pcm;
    oggpack_buffer opb;
    c_long lW;
    c_long W;
    c_long nW;
    int pcmend;
    int mode;
    int eofflag;
    ogg_int64_t granulepos;
    ogg_int64_t sequence;
    vorbis_dsp_state* vd;
    void* localstore;
    c_long localtop;
    c_long localalloc;
    c_long totaluse;
    alloc_chain* reap;
    c_long glue_bits;
    c_long time_bits;
    c_long floor_bits;
    c_long res_bits;
    void* internal;
}
struct alloc_chain
{
    void* ptr;
    alloc_chain* next;
}
struct vorbis_comment
{
    char** user_comments;
    int* comment_lengths;
    int comments;
    char* vendor;
}
