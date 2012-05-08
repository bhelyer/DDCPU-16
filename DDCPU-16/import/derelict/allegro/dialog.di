// D import file generated from 'derelict\allegro\dialog.d'
module derelict.allegro.dialog;
private 
{
    import derelict.util.compat;
    import derelict.util.loader;
    import derelict.allegro.allegrotypes;
}
enum 
{
ALLEGRO_FILECHOOSER_FILE_MUST_EXIST = 1,
ALLEGRO_FILECHOOSER_SAVE = 2,
ALLEGRO_FILECHOOSER_FOLDER = 4,
ALLEGRO_FILECHOOSER_PICTURES = 8,
ALLEGRO_FILECHOOSER_SHOW_HIDDEN = 16,
ALLEGRO_FILECHOOSER_MULTIPLE = 32,
}
enum 
{
ALLEGRO_MESSAGEBOX_WARN = 1 << 0,
ALLEGRO_MESSAGEBOX_ERROR = 1 << 1,
ALLEGRO_MESSAGEBOX_OK_CANCEL = 1 << 2,
ALLEGRO_MESSAGEBOX_YES_NO = 1 << 3,
ALLEGRO_MESSAGEBOX_QUESTION = 1 << 4,
}
enum 
{
ALLEGRO_TEXTLOG_NO_CLOSE = 1 << 0,
ALLEGRO_TEXTLOG_MONOSPACE = 1 << 1,
}
struct ALLEGRO_FILECHOOSER
{
}
struct ALLEGRO_TEXTLOG
{
}
extern (C) 
{
    alias ALLEGRO_FILECHOOSER* function(in char*, in char*, in char*, int) da_al_create_native_file_dialog;
    alias bool function(ALLEGRO_DISPLAY*, ALLEGRO_FILECHOOSER*) da_al_show_native_file_dialog;
    alias int function(in ALLEGRO_FILECHOOSER*) da_al_get_native_file_dialog_count;
    alias CCPTR function(in ALLEGRO_FILECHOOSER*, size_t) da_al_get_native_file_dialog_path;
    alias void function(ALLEGRO_FILECHOOSER*) da_al_destroy_native_file_dialog;
    alias int function(ALLEGRO_DISPLAY*, in char*, in char*, in char*, in char*, int) da_al_show_native_message_box;
    alias ALLEGRO_TEXTLOG* function(in char*, int) da_al_open_native_text_log;
    alias void function(ALLEGRO_TEXTLOG*) da_al_close_native_text_log;
    alias void function(ALLEGRO_TEXTLOG*, in char*,...) da_al_append_native_text_log;
    alias ALLEGRO_EVENT_SOURCE* function(ALLEGRO_TEXTLOG*) da_al_get_native_text_log_event_source;
    alias uint function() da_al_get_allegro_native_dialog_version;
}
mixin(gsharedString!() ~ "\x0ada_al_create_native_file_dialog al_create_native_file_dialog;\x0ada_al_show_native_file_dialog al_show_native_file_dialog;\x0ada_al_get_native_file_dialog_count al_get_native_file_dialog_count;\x0ada_al_get_native_file_dialog_path al_get_native_file_dialog_path;\x0ada_al_destroy_native_file_dialog al_destroy_native_file_dialog;\x0ada_al_show_native_message_box al_show_native_message_box;\x0ada_al_open_native_text_log al_open_native_text_log;\x0ada_al_close_native_text_log al_close_native_text_log;\x0ada_al_append_native_text_log al_append_native_text_log;\x0ada_al_get_native_text_log_event_source al_get_native_text_log_event_source;\x0ada_al_get_allegro_native_dialog_version al_get_allegro_native_dialog_version;\x0a");
class DerelictAllegroDialogLoader : SharedLibLoader
{
    public 
{
    this()
{
super("allegro_dialog-5.0.5-mt.dll,allegro_dialog-5.0.4-mt.dll,allegro_dialog-5.0.3-mt.dll,allegro_dialog-5.0.2-mt.dll,allegro_dialog-5.0.1-mt.dll,allegro_dialog-5.0.0-mt.dll","liballegro_dialog-5.0.5.so,liballegro_dialog-5.0.so","../Frameworks/AllegroDialog-5.0.framework,/Library/Frameworks/AllegroDialog-5.0.framwork,liballegro_dialog-5.0.5.dylib,liballegro_dialog-5.0.dylib");
}
    protected override void loadSymbols()
{
bindFunc(cast(void**)&al_create_native_file_dialog,"al_create_native_file_dialog");
bindFunc(cast(void**)&al_show_native_file_dialog,"al_show_native_file_dialog");
bindFunc(cast(void**)&al_get_native_file_dialog_count,"al_get_native_file_dialog_count");
bindFunc(cast(void**)&al_get_native_file_dialog_path,"al_get_native_file_dialog_path");
bindFunc(cast(void**)&al_destroy_native_file_dialog,"al_destroy_native_file_dialog");
bindFunc(cast(void**)&al_show_native_message_box,"al_show_native_message_box");
bindFunc(cast(void**)&al_open_native_text_log,"al_open_native_text_log");
bindFunc(cast(void**)&al_close_native_text_log,"al_close_native_text_log");
bindFunc(cast(void**)&al_append_native_text_log,"al_append_native_text_log");
bindFunc(cast(void**)&al_get_native_text_log_event_source,"al_get_native_text_log_event_source");
bindFunc(cast(void**)&al_get_allegro_native_dialog_version,"al_get_allegro_native_dialog_version");
}


}
}
DerelictAllegroDialogLoader DerelictAllegroDialog;
static this();
