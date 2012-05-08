// D import file generated from 'derelict\ogg\vorbisfuncs.d'
module derelict.ogg.vorbisfuncs;
private 
{
    import derelict.util.compat;
    import derelict.ogg.oggtypes;
    import derelict.ogg.vorbistypes;
}
extern (C) 
{
    alias void function(vorbis_info*) da_vorbis_info_init;
    alias void function(vorbis_info*) da_vorbis_info_clear;
    alias int function(vorbis_info*, int) da_vorbis_info_blocksize;
    alias void function(vorbis_comment*) da_vorbis_comment_init;
    alias void function(vorbis_comment*, byte* t) da_vorbis_comment_add;
    alias void function(vorbis_comment*, byte*, byte*) da_vorbis_comment_add_tag;
    alias byte* function(vorbis_comment*, byte*, int) da_vorbis_comment_query;
    alias int function(vorbis_comment*, byte*) da_vorbis_comment_query_count;
    alias void function(vorbis_comment*) da_vorbis_comment_clear;
    alias int function(vorbis_dsp_state*, vorbis_block*) da_vorbis_block_init;
    alias int function(vorbis_block*) da_vorbis_block_clear;
    alias void function(vorbis_dsp_state*) da_vorbis_dsp_clear;
    alias double function(vorbis_dsp_state*, ogg_int64_t) da_vorbis_granule_time;
    alias CCPTR function() da_vorbis_version_string;
    alias int function(vorbis_dsp_state*, vorbis_info*) da_vorbis_analysis_init;
    alias int function(vorbis_comment*, ogg_packet*) da_vorbis_commentheader_out;
    alias int function(vorbis_dsp_state*, vorbis_comment*, ogg_packet*, ogg_packet*, ogg_packet*) da_vorbis_analysis_headerout;
    alias float** function(vorbis_dsp_state*, int) da_vorbis_analysis_buffer;
    alias int function(vorbis_dsp_state*, int) da_vorbis_analysis_wrote;
    alias int function(vorbis_dsp_state*, vorbis_block*) da_vorbis_analysis_blockout;
    alias int function(vorbis_block*, ogg_packet*) da_vorbis_analysis;
    alias int function(vorbis_block*) da_vorbis_bitrate_addblock;
    alias int function(vorbis_dsp_state*, ogg_packet*) da_vorbis_bitrate_flushpacket;
    alias int function(ogg_packet*) da_vorbis_synthesis_idheader;
    alias int function(vorbis_info*, vorbis_comment*, ogg_packet*) da_vorbis_synthesis_headerin;
    alias int function(vorbis_dsp_state*, vorbis_info*) da_vorbis_synthesis_init;
    alias int function(vorbis_dsp_state*) da_vorbis_synthesis_restart;
    alias int function(vorbis_block*, ogg_packet*) da_vorbis_synthesis;
    alias int function(vorbis_block*, ogg_packet*) da_vorbis_synthesis_trackonly;
    alias int function(vorbis_dsp_state*, vorbis_block*) da_vorbis_synthesis_blockin;
    alias int function(vorbis_dsp_state*, float***) da_vorbis_synthesis_pcmout;
    alias int function(vorbis_dsp_state*, float***) da_vorbis_synthesis_lapout;
    alias int function(vorbis_dsp_state*, int) da_vorbis_synthesis_read;
    alias c_long function(vorbis_info*, ogg_packet*) da_vorbis_packet_blocksize;
    alias int function(vorbis_info*, int) da_vorbis_synthesis_halfrate;
    alias int function(vorbis_info*) da_vorbis_synthesis_halfrate_p;
}
mixin(gsharedString!() ~ "\x0ada_vorbis_info_init vorbis_info_init;\x0ada_vorbis_info_clear vorbis_info_clear;\x0ada_vorbis_info_blocksize vorbis_info_blocksize;\x0ada_vorbis_comment_init vorbis_comment_init;\x0ada_vorbis_comment_add vorbis_comment_add;\x0ada_vorbis_comment_add_tag vorbis_comment_add_tag;\x0ada_vorbis_comment_query vorbis_comment_query;\x0ada_vorbis_comment_query_count vorbis_comment_query_count;\x0ada_vorbis_comment_clear vorbis_comment_clear;\x0ada_vorbis_block_init vorbis_block_init;\x0ada_vorbis_block_clear vorbis_block_clear;\x0ada_vorbis_dsp_clear vorbis_dsp_clear;\x0ada_vorbis_granule_time vorbis_granule_time;\x0ada_vorbis_version_string vorbis_version_string;\x0ada_vorbis_analysis_init vorbis_analysis_init;\x0ada_vorbis_commentheader_out vorbis_commentheader_out;\x0ada_vorbis_analysis_headerout vorbis_analysis_headerout;\x0ada_vorbis_analysis_buffer vorbis_analysis_buffer;\x0ada_vorbis_analysis_wrote vorbis_analysis_wrote;\x0ada_vorbis_analysis_blockout vorbis_analysis_blockout;\x0ada_vorbis_analysis vorbis_analysis;\x0ada_vorbis_bitrate_addblock vorbis_bitrate_addblock;\x0ada_vorbis_bitrate_flushpacket vorbis_bitrate_flushpacket;\x0ada_vorbis_synthesis_idheader vorbis_synthesis_idheader;\x0ada_vorbis_synthesis_headerin vorbis_synthesis_headerin;\x0ada_vorbis_synthesis_init vorbis_synthesis_init;\x0ada_vorbis_synthesis_restart vorbis_synthesis_restart;\x0ada_vorbis_synthesis vorbis_synthesis;\x0ada_vorbis_synthesis_trackonly vorbis_synthesis_trackonly;\x0ada_vorbis_synthesis_blockin vorbis_synthesis_blockin;\x0ada_vorbis_synthesis_pcmout vorbis_synthesis_pcmout;\x0ada_vorbis_synthesis_lapout vorbis_synthesis_lapout;\x0ada_vorbis_synthesis_read vorbis_synthesis_read;\x0ada_vorbis_packet_blocksize vorbis_packet_blocksize;\x0ada_vorbis_synthesis_halfrate vorbis_synthesis_halfrate;\x0ada_vorbis_synthesis_halfrate_p vorbis_synthesis_halfrate_p;\x0a");
