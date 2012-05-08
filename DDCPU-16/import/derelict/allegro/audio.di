// D import file generated from 'derelict\allegro\audio.d'
module derelict.allegro.audio;
private 
{
    import derelict.allegro.allegrotypes;
    import derelict.util.compat;
    import derelict.util.loader;
}
enum 
{
ALLEGRO_EVENT_AUDIO_STREAM_FRAGMENT = 513,
ALLEGRO_EVENT_AUDIO_STREAM_FINISHED = 514,
}
alias int ALLEGRO_AUDIO_DEPTH;
enum 
{
ALLEGRO_AUDIO_DEPTH_INT8 = 0,
ALLEGRO_AUDIO_DEPTH_INT16 = 1,
ALLEGRO_AUDIO_DEPTH_INT24 = 2,
ALLEGRO_AUDIO_DEPTH_FLOAT32 = 3,
ALLEGRO_AUDIO_DEPTH_UNSIGNED = 8,
ALLEGRO_AUDIO_DEPTH_UINT8 = ALLEGRO_AUDIO_DEPTH_INT8 | ALLEGRO_AUDIO_DEPTH_UNSIGNED,
ALLEGRO_AUDIO_DEPTH_UINT16 = ALLEGRO_AUDIO_DEPTH_INT16 | ALLEGRO_AUDIO_DEPTH_UNSIGNED,
ALLEGRO_AUDIO_DEPTH_UINT24 = ALLEGRO_AUDIO_DEPTH_INT24 | ALLEGRO_AUDIO_DEPTH_UNSIGNED,
}
alias int ALLEGRO_CHANNEL_CONF;
enum 
{
ALLEGRO_CHANNEL_CONF_1 = 16,
ALLEGRO_CHANNEL_CONF_2 = 32,
ALLEGRO_CHANNEL_CONF_3 = 48,
ALLEGRO_CHANNEL_CONF_4 = 64,
ALLEGRO_CHANNEL_CONF_5_1 = 81,
ALLEGRO_CHANNEL_CONF_6_1 = 97,
ALLEGRO_CHANNEL_CONF_7_1 = 113,
ALLEGRO_MAX_CHANNELS = 8,
}
alias int ALLEGRO_PLAYMODE;
enum 
{
ALLEGRO_PLAYMODE_ONCE = 256,
ALLEGRO_PLAYMODE_LOOP = 257,
ALLEGRO_PLAYMODE_BIDIR = 258,
}
alias int ALLEGRO_MIXER_QUALITY;
enum 
{
ALLEGRO_MIXER_QUALITY_POINT = 272,
ALLEGRO_MIXER_QUALITY_LINEAR = 273,
}
version (D_Version2)
{
    mixin("enum float ALLEGRO_AUDIO_PAN_NONE = -1000.0f;");
}
else
{
    const float ALLEGRO_AUDIO_PAN_NONE = -1000F;

}
struct ALLEGRO_SAMPLE
{
}
struct ALLEGRO_SAMPLE_ID
{
    int _index;
    int _id;
}
struct ALLEGRO_SAMPLE_INSTANCE
{
}
struct ALLEGRO_AUDIO_STREAM
{
}
struct ALLEGRO_MIXER
{
}
struct ALLEGRO_VOICE
{
}
extern (C) 
{
    alias ALLEGRO_SAMPLE* function(void*, uint, uint, ALLEGRO_AUDIO_DEPTH, ALLEGRO_CHANNEL_CONF, bool) da_al_create_sample;
    alias void function(ALLEGRO_SAMPLE*) da_al_destroy_sample;
    alias ALLEGRO_SAMPLE_INSTANCE* function(ALLEGRO_SAMPLE*) da_al_create_sample_instance;
    alias void function(ALLEGRO_SAMPLE_INSTANCE*) da_al_destroy_sample_instance;
    alias uint function(in ALLEGRO_SAMPLE*) da_al_get_sample_frequency;
    alias uint function(in ALLEGRO_SAMPLE*) da_al_get_sample_length;
    alias ALLEGRO_AUDIO_DEPTH function(in ALLEGRO_SAMPLE*) da_al_get_sample_depth;
    alias ALLEGRO_CHANNEL_CONF function(in ALLEGRO_SAMPLE*) da_al_get_sample_channels;
    alias void* function(in ALLEGRO_SAMPLE*) da_al_get_sample_data;
    alias uint function(in ALLEGRO_SAMPLE_INSTANCE*) da_al_get_sample_instance_frequency;
    alias uint function(in ALLEGRO_SAMPLE_INSTANCE*) da_al_get_sample_instance_length;
    alias uint function(in ALLEGRO_SAMPLE_INSTANCE*) da_al_get_sample_instance_position;
    alias float function(in ALLEGRO_SAMPLE_INSTANCE*) da_al_get_sample_instance_speed;
    alias float function(in ALLEGRO_SAMPLE_INSTANCE*) da_al_get_sample_instance_gain;
    alias float function(in ALLEGRO_SAMPLE_INSTANCE*) da_al_get_sample_instance_pan;
    alias float function(in ALLEGRO_SAMPLE_INSTANCE*) da_al_get_sample_instance_time;
    alias ALLEGRO_AUDIO_DEPTH function(in ALLEGRO_SAMPLE_INSTANCE*) da_al_get_sample_instance_depth;
    alias ALLEGRO_CHANNEL_CONF function(in ALLEGRO_SAMPLE_INSTANCE*) da_al_get_sample_instance_channels;
    alias ALLEGRO_PLAYMODE function(in ALLEGRO_SAMPLE_INSTANCE*) da_al_get_sample_instance_playmode;
    alias bool function(in ALLEGRO_SAMPLE_INSTANCE*) da_al_get_sample_instance_playing;
    alias bool function(in ALLEGRO_SAMPLE_INSTANCE*) da_al_get_sample_instance_attached;
    alias bool function(ALLEGRO_SAMPLE_INSTANCE*, uint) da_al_set_sample_instance_position;
    alias bool function(ALLEGRO_SAMPLE_INSTANCE*, uint) da_al_set_sample_instance_length;
    alias bool function(ALLEGRO_SAMPLE_INSTANCE*, float) da_al_set_sample_instance_speed;
    alias bool function(ALLEGRO_SAMPLE_INSTANCE*, float) da_al_set_sample_instance_gain;
    alias bool function(ALLEGRO_SAMPLE_INSTANCE*, float) da_al_set_sample_instance_pan;
    alias bool function(ALLEGRO_SAMPLE_INSTANCE*, ALLEGRO_PLAYMODE) da_al_set_sample_instance_playmode;
    alias bool function(ALLEGRO_SAMPLE_INSTANCE*, bool) da_al_set_sample_instance_playing;
    alias bool function(ALLEGRO_SAMPLE_INSTANCE*) da_al_detach_sample_instance;
    alias bool function(ALLEGRO_SAMPLE_INSTANCE*, ALLEGRO_SAMPLE*) da_al_set_sample;
    alias ALLEGRO_SAMPLE* function(ALLEGRO_SAMPLE_INSTANCE*) da_al_get_sample;
    alias bool function(ALLEGRO_SAMPLE_INSTANCE*) da_al_play_sample_instance;
    alias bool function(ALLEGRO_SAMPLE_INSTANCE*) da_al_stop_sample_instance;
    alias ALLEGRO_AUDIO_STREAM* function(size_t, uint, uint, ALLEGRO_AUDIO_DEPTH, ALLEGRO_CHANNEL_CONF) da_al_create_audio_stream;
    alias void function(ALLEGRO_AUDIO_STREAM*) da_al_destroy_audio_stream;
    alias void function(ALLEGRO_AUDIO_STREAM*) da_al_drain_audio_stream;
    alias uint function(in ALLEGRO_AUDIO_STREAM*) da_al_get_audio_stream_frequency;
    alias uint function(in ALLEGRO_AUDIO_STREAM*) da_al_get_audio_stream_length;
    alias uint function(in ALLEGRO_AUDIO_STREAM*) da_al_get_audio_stream_fragments;
    alias uint function(in ALLEGRO_AUDIO_STREAM*) da_al_get_available_audio_stream_fragments;
    alias float function(in ALLEGRO_AUDIO_STREAM*) da_al_get_audio_stream_speed;
    alias float function(in ALLEGRO_AUDIO_STREAM*) da_al_get_audio_stream_gain;
    alias float function(in ALLEGRO_AUDIO_STREAM*) da_al_get_audio_stream_pan;
    alias ALLEGRO_CHANNEL_CONF function(in ALLEGRO_AUDIO_STREAM*) da_al_get_audio_stream_channels;
    alias ALLEGRO_AUDIO_DEPTH function(in ALLEGRO_AUDIO_STREAM*) da_al_get_audio_stream_depth;
    alias ALLEGRO_PLAYMODE function(in ALLEGRO_AUDIO_STREAM*) da_al_get_audio_stream_playmode;
    alias bool function(in ALLEGRO_AUDIO_STREAM*) da_al_get_audio_stream_playing;
    alias bool function(in ALLEGRO_AUDIO_STREAM*) da_al_get_audio_stream_attached;
    alias void* function(in ALLEGRO_AUDIO_STREAM*) da_al_get_audio_stream_fragment;
    alias bool function(ALLEGRO_AUDIO_STREAM*, float) da_al_set_audio_stream_speed;
    alias bool function(ALLEGRO_AUDIO_STREAM*, float) da_al_set_audio_stream_gain;
    alias bool function(ALLEGRO_AUDIO_STREAM*, float) da_al_set_audio_stream_pan;
    alias bool function(ALLEGRO_AUDIO_STREAM*, ALLEGRO_PLAYMODE) da_al_set_audio_stream_playmode;
    alias bool function(ALLEGRO_AUDIO_STREAM*, bool) da_al_set_audio_stream_playing;
    alias bool function(ALLEGRO_AUDIO_STREAM*) da_al_detach_audio_stream;
    alias bool function(ALLEGRO_AUDIO_STREAM*, void*) da_al_set_audio_stream_fragment;
    alias bool function(ALLEGRO_AUDIO_STREAM*) da_al_rewind_audio_stream;
    alias bool function(ALLEGRO_AUDIO_STREAM*, double) da_al_seek_audio_stream_secs;
    alias double function(ALLEGRO_AUDIO_STREAM*) da_al_get_audio_stream_position_secs;
    alias double function(ALLEGRO_AUDIO_STREAM*) da_al_get_audio_stream_length_secs;
    alias bool function(ALLEGRO_AUDIO_STREAM*, double, double) da_al_set_audio_stream_loop_secs;
    alias ALLEGRO_EVENT_SOURCE* function(ALLEGRO_AUDIO_STREAM*) da_al_get_audio_stream_event_source;
    alias ALLEGRO_MIXER* function(uint, ALLEGRO_AUDIO_DEPTH, ALLEGRO_CHANNEL_CONF) da_al_create_mixer;
    alias void function(ALLEGRO_MIXER*) da_al_destroy_mixer;
    alias bool function(ALLEGRO_SAMPLE_INSTANCE*, ALLEGRO_MIXER*) da_al_attach_sample_instance_to_mixer;
    alias bool function(ALLEGRO_AUDIO_STREAM*, ALLEGRO_MIXER*) da_al_attach_audio_stream_to_mixer;
    alias bool function(ALLEGRO_MIXER*, ALLEGRO_MIXER*) da_al_attach_mixer_to_mixer;
    alias bool function(ALLEGRO_MIXER*, void function(void*, uint, void*), void*) da_al_set_mixer_postprocess_callback;
    alias uint function(in ALLEGRO_MIXER*) da_al_get_mixer_frequency;
    alias ALLEGRO_CHANNEL_CONF function(in ALLEGRO_MIXER*) da_al_get_mixer_channels;
    alias ALLEGRO_AUDIO_DEPTH function(in ALLEGRO_MIXER*) da_al_get_mixer_depth;
    alias ALLEGRO_MIXER_QUALITY function(in ALLEGRO_MIXER*) da_al_get_mixer_quality;
    alias bool function(in ALLEGRO_MIXER*) da_al_get_mixer_playing;
    alias bool function(in ALLEGRO_MIXER*) da_al_get_mixer_attached;
    alias bool function(ALLEGRO_MIXER*, uint) da_al_set_mixer_frequency;
    alias bool function(ALLEGRO_MIXER*, ALLEGRO_MIXER_QUALITY) da_al_set_mixer_quality;
    alias bool function(ALLEGRO_MIXER*, bool) da_al_set_mixer_playing;
    alias bool function(ALLEGRO_MIXER*) da_al_detach_mixer;
    alias ALLEGRO_VOICE* function(uint, ALLEGRO_AUDIO_DEPTH, ALLEGRO_CHANNEL_CONF) da_al_create_voice;
    alias void function(ALLEGRO_VOICE*) da_al_destroy_voice;
    alias bool function(ALLEGRO_SAMPLE_INSTANCE*, ALLEGRO_VOICE*) da_al_attach_sample_instance_to_voice;
    alias bool function(ALLEGRO_AUDIO_STREAM*, ALLEGRO_VOICE*) da_al_attach_audio_stream_to_voice;
    alias bool function(ALLEGRO_MIXER*, ALLEGRO_VOICE*) da_al_attach_mixer_to_voice;
    alias void function(ALLEGRO_VOICE*) da_al_detach_voice;
    alias uint function(in ALLEGRO_VOICE*) da_al_get_voice_frequency;
    alias uint function(in ALLEGRO_VOICE*) da_al_get_voice_position;
    alias ALLEGRO_CHANNEL_CONF function(in ALLEGRO_VOICE*) da_al_get_voice_channels;
    alias ALLEGRO_AUDIO_DEPTH function(in ALLEGRO_VOICE*) da_al_get_voice_depth;
    alias bool function(in ALLEGRO_VOICE*) da_al_get_voice_playing;
    alias bool function(ALLEGRO_VOICE*, uint) da_al_set_voice_position;
    alias bool function(ALLEGRO_VOICE*, bool) da_al_set_voice_playing;
    alias bool function() da_al_install_audio;
    alias void function() da_al_uninstall_audio;
    alias bool function() da_al_is_audio_installed;
    alias uint function() da_al_get_allegro_audio_version;
    alias size_t function(ALLEGRO_CHANNEL_CONF) da_al_get_channel_count;
    alias size_t function(ALLEGRO_AUDIO_DEPTH) da_al_get_audio_depth_size;
    alias bool function(int) da_al_reserve_samples;
    alias ALLEGRO_MIXER* function() da_al_get_default_mixer;
    alias bool function(ALLEGRO_MIXER*) da_al_set_default_mixer;
    alias bool function() da_al_restore_default_mixer;
    alias bool function(ALLEGRO_SAMPLE*, float, float, float, ALLEGRO_PLAYMODE, ALLEGRO_SAMPLE_ID*) da_al_play_sample;
    alias void function(ALLEGRO_SAMPLE_ID*) da_al_stop_sample;
    alias void function() da_al_stop_samples;
    alias bool function(in char*, ALLEGRO_SAMPLE* function(in char*)) da_al_register_sample_loader;
    alias bool function(in char*, bool function(in char*, ALLEGRO_SAMPLE*)) da_al_register_sample_saver;
    alias bool function(in char*, ALLEGRO_AUDIO_STREAM* function(in char*, size_t, uint)) da_al_register_audio_stream_loader;
    alias bool function(in char*, ALLEGRO_SAMPLE* function(ALLEGRO_FILE*)) da_al_register_sample_loader_f;
    alias bool function(in char*, bool function(ALLEGRO_FILE*, ALLEGRO_SAMPLE*)) da_al_register_sample_saver_f;
    alias bool function(in char*, ALLEGRO_AUDIO_STREAM* function(ALLEGRO_FILE*, size_t, uint)) da_al_register_audio_stream_loader_f;
    alias ALLEGRO_SAMPLE* function(in char*) da_al_load_sample;
    alias bool function(in char*, ALLEGRO_SAMPLE*) da_al_save_sample;
    alias ALLEGRO_AUDIO_STREAM* function(in char*, size_t, uint) da_al_load_audio_stream;
    alias ALLEGRO_SAMPLE* function(ALLEGRO_FILE*, in char*) da_al_load_sample_f;
    alias bool function(ALLEGRO_FILE*, in char*, ALLEGRO_SAMPLE*) da_al_save_sample_f;
    alias ALLEGRO_AUDIO_STREAM* function(ALLEGRO_FILE*, in char*, size_t, uint) da_al_load_audio_stream_f;
}
mixin(gsharedString!() ~ "\x0ada_al_create_sample al_create_sample;\x0ada_al_destroy_sample al_destroy_sample;\x0ada_al_create_sample_instance al_create_sample_instance;\x0ada_al_destroy_sample_instance al_destroy_sample_instance;\x0ada_al_get_sample_frequency al_get_sample_frequency;\x0ada_al_get_sample_length al_get_sample_length;\x0ada_al_get_sample_depth al_get_sample_depth;\x0ada_al_get_sample_channels al_get_sample_channels;\x0ada_al_get_sample_data al_get_sample_data;\x0ada_al_get_sample_instance_frequency al_get_sample_instance_frequency;\x0ada_al_get_sample_instance_length al_get_sample_instance_length;\x0ada_al_get_sample_instance_position al_get_sample_instance_position;\x0ada_al_get_sample_instance_speed al_get_sample_instance_speed;\x0ada_al_get_sample_instance_gain al_get_sample_instance_gain;\x0ada_al_get_sample_instance_pan al_get_sample_instance_pan;\x0ada_al_get_sample_instance_time al_get_sample_instance_time;\x0ada_al_get_sample_instance_depth al_get_sample_instance_depth;\x0ada_al_get_sample_instance_channels al_get_sample_instance_channels;\x0ada_al_get_sample_instance_playmode al_get_sample_instance_playmode;\x0ada_al_get_sample_instance_playing al_get_sample_instance_playing;\x0ada_al_get_sample_instance_attached al_get_sample_instance_attached;\x0ada_al_set_sample_instance_position al_set_sample_instance_position;\x0ada_al_set_sample_instance_length al_set_sample_instance_length;\x0ada_al_set_sample_instance_speed al_set_sample_instance_speed;\x0ada_al_set_sample_instance_gain al_set_sample_instance_gain;\x0ada_al_set_sample_instance_pan al_set_sample_instance_pan;\x0ada_al_set_sample_instance_playmode al_set_sample_instance_playmode;\x0ada_al_set_sample_instance_playing al_set_sample_instance_playing;\x0ada_al_detach_sample_instance al_detach_sample_instance;\x0ada_al_set_sample al_set_sample;\x0ada_al_get_sample al_get_sample;\x0ada_al_play_sample_instance al_play_sample_instance;\x0ada_al_stop_sample_instance al_stop_sample_instance;\x0ada_al_create_audio_stream al_create_audio_stream;\x0ada_al_destroy_audio_stream al_destroy_audio_stream;\x0ada_al_drain_audio_stream al_drain_audio_stream;\x0ada_al_get_audio_stream_frequency al_get_audio_stream_frequency;\x0ada_al_get_audio_stream_length al_get_audio_stream_length;\x0ada_al_get_audio_stream_fragments al_get_audio_stream_fragments;\x0ada_al_get_available_audio_stream_fragments al_get_available_audio_stream_fragments;\x0ada_al_get_audio_stream_speed al_get_audio_stream_speed;\x0ada_al_get_audio_stream_gain al_get_audio_stream_gain;\x0ada_al_get_audio_stream_pan al_get_audio_stream_pan;\x0ada_al_get_audio_stream_channels al_get_audio_stream_channels;\x0ada_al_get_audio_stream_depth al_get_audio_stream_depth;\x0ada_al_get_audio_stream_playmode al_get_audio_stream_playmode;\x0ada_al_get_audio_stream_playing al_get_audio_stream_playing;\x0ada_al_get_audio_stream_attached al_get_audio_stream_attached;\x0ada_al_get_audio_stream_fragment al_get_audio_stream_fragment;\x0ada_al_set_audio_stream_speed al_set_audio_stream_speed;\x0ada_al_set_audio_stream_gain al_set_audio_stream_gain;\x0ada_al_set_audio_stream_pan al_set_audio_stream_pan;\x0ada_al_set_audio_stream_playmode al_set_audio_stream_playmode;\x0ada_al_set_audio_stream_playing al_set_audio_stream_playing;\x0ada_al_detach_audio_stream al_detach_audio_stream;\x0ada_al_set_audio_stream_fragment al_set_audio_stream_fragment;\x0ada_al_rewind_audio_stream al_rewind_audio_stream;\x0ada_al_seek_audio_stream_secs al_seek_audio_stream_secs;\x0ada_al_get_audio_stream_position_secs al_get_audio_stream_position_secs;\x0ada_al_get_audio_stream_length_secs al_get_audio_stream_length_secs;\x0ada_al_set_audio_stream_loop_secs al_set_audio_stream_loop_secs;\x0ada_al_get_audio_stream_event_source al_get_audio_stream_event_source;\x0ada_al_create_mixer al_create_mixer;\x0ada_al_destroy_mixer al_destroy_mixer;\x0ada_al_attach_sample_instance_to_mixer al_attach_sample_instance_to_mixer;\x0ada_al_attach_audio_stream_to_mixer al_attach_audio_stream_to_mixer;\x0ada_al_attach_mixer_to_mixer al_attach_mixer_to_mixer;\x0ada_al_set_mixer_postprocess_callback al_set_mixer_postprocess_callback;\x0ada_al_get_mixer_frequency al_get_mixer_frequency;\x0ada_al_get_mixer_channels al_get_mixer_channels;\x0ada_al_get_mixer_depth al_get_mixer_depth;\x0ada_al_get_mixer_quality al_get_mixer_quality;\x0ada_al_get_mixer_playing al_get_mixer_playing;\x0ada_al_get_mixer_attached al_get_mixer_attached;\x0ada_al_set_mixer_frequency al_set_mixer_frequency;\x0ada_al_set_mixer_quality al_set_mixer_quality;\x0ada_al_set_mixer_playing al_set_mixer_playing;\x0ada_al_detach_mixer al_detach_mixer;\x0ada_al_create_voice al_create_voice;\x0ada_al_destroy_voice al_destroy_voice;\x0ada_al_attach_sample_instance_to_voice al_attach_sample_instance_to_voice;\x0ada_al_attach_audio_stream_to_voice al_attach_audio_stream_to_voice;\x0ada_al_attach_mixer_to_voice al_attach_mixer_to_voice;\x0ada_al_detach_voice al_detach_voice;\x0ada_al_get_voice_frequency al_get_voice_frequency;\x0ada_al_get_voice_position al_get_voice_position;\x0ada_al_get_voice_channels al_get_voice_channels;\x0ada_al_get_voice_depth al_get_voice_depth;\x0ada_al_get_voice_playing al_get_voice_playing;\x0ada_al_set_voice_position al_set_voice_position;\x0ada_al_set_voice_playing al_set_voice_playing;\x0ada_al_install_audio al_install_audio;\x0ada_al_uninstall_audio al_uninstall_audio;\x0ada_al_is_audio_installed al_is_audio_installed;\x0ada_al_get_allegro_audio_version al_get_allegro_audio_version;\x0ada_al_get_channel_count al_get_channel_count;\x0ada_al_get_audio_depth_size al_get_audio_depth_size;\x0ada_al_reserve_samples al_reserve_samples;\x0ada_al_get_default_mixer al_get_default_mixer;\x0ada_al_set_default_mixer al_set_default_mixer;\x0ada_al_restore_default_mixer al_restore_default_mixer;\x0ada_al_play_sample al_play_sample;\x0ada_al_stop_sample al_stop_sample;\x0ada_al_stop_samples al_stop_samples;\x0ada_al_register_sample_loader al_register_sample_loader;\x0ada_al_register_sample_saver al_register_sample_saver;\x0ada_al_register_audio_stream_loader al_register_audio_stream_loader;\x0ada_al_register_sample_loader_f al_register_sample_loader_f;\x0ada_al_register_sample_saver_f al_register_sample_saver_f;\x0ada_al_register_audio_stream_loader_f al_register_audio_stream_loader_f;\x0ada_al_load_sample al_load_sample;\x0ada_al_save_sample al_save_sample;\x0ada_al_load_audio_stream al_load_audio_stream;\x0ada_al_load_sample_f al_load_sample_f;\x0ada_al_save_sample_f al_save_sample_f;\x0ada_al_load_audio_stream_f al_load_audio_stream_f;\x0a");
class DerelictAllegroAudioLoader : SharedLibLoader
{
    public 
{
    this()
{
super("allegro_audio-5.0.5-mt.dll,allegro_audio-5.0.4-mt.dll,allegro_audio-5.0.3-mt.dll,allegro_audio-5.0.2-mt.dll,allegro_audio-5.0.1-mt.dll,allegro_audio-5.0.0-mt.dll","liballegro_audio-5.0.5.so,liballegro_audio-5.0.so","../Frameworks/AllegroAudio-5.0.framework,/Library/Frameworks/AllegroAudio-5.0.framwork,liballegro_audio-5.0.5.dylib,liballegro_audio-5.0.dylib");
}
    protected override void loadSymbols();


}
}
DerelictAllegroAudioLoader DerelictAllegroAudio;
static this();
