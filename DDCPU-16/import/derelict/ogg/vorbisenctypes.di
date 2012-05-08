// D import file generated from 'derelict\ogg\vorbisenctypes.d'
module derelict.ogg.vorbisenctypes;
private import derelict.util.compat;

enum 
{
OV_ECTL_RATEMANAGE_GET = 16,
OV_ECTL_RATEMANAGE_SET = 17,
OV_ECTL_RATEMANAGE_AVG = 18,
OV_ECTL_RATEMANAGE_HARD = 19,
}
struct ovectl_ratemanage_arg
{
    int management_active;
    c_long bitrate_hard_min;
    c_long bitrate_hard_max;
    double bitrate_hard_window;
    c_long bitrate_av_lo;
    c_long bitrate_av_hi;
    double bitrate_av_window;
    double bitrate_av_window_center;
}
enum 
{
OV_ECTL_RATEMANAGE2_GET = 20,
OV_ECTL_RATEMANAGE2_SET = 21,
}
struct ovectl_ratemanage2_arg
{
    int management_active;
    c_long bitrate_limit_min_kbps;
    c_long bitrate_limit_max_kbps;
    c_long bitrate_limit_reservoir_bits;
    double bitrate_limit_reservoir_bias;
    c_long bitrate_average_kbps;
    double bitrate_average_damping;
}
enum 
{
OV_ECTL_LOWPASS_GET = 32,
OV_ECTL_LOWPASS_SET = 33,
OV_ECTL_IBLOCK_GET = 48,
OV_ECTL_IBLOCK_SET = 49,
}
