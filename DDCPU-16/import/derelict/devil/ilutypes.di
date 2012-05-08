// D import file generated from 'derelict\devil\ilutypes.d'
module derelict.devil.ilutypes;
private import derelict.devil.iltypes;

enum : ILenum
{
ILU_VERSION_1_7_3 = 1,
ILU_VERSION = 173,
ILU_FILTER = 9728,
ILU_NEAREST = 9729,
ILU_LINEAR = 9730,
ILU_BILINEAR = 9731,
ILU_SCALE_BOX = 9732,
ILU_SCALE_TRIANGLE = 9733,
ILU_SCALE_BELL = 9734,
ILU_SCALE_BSPLINE = 9735,
ILU_SCALE_LANCZOS3 = 9736,
ILU_SCALE_MITCHELL = 9737,
ILU_INVALID_ENUM = 1281,
ILU_OUT_OF_MEMORY = 1282,
ILU_INTERNAL_ERROR = 1284,
ILU_INVALID_VALUE = 1285,
ILU_ILLEGAL_OPERATION = 1286,
ILU_INVALID_PARAM = 1289,
ILU_PLACEMENT = 1792,
ILU_LOWER_LEFT = 1793,
ILU_LOWER_RIGHT = 1794,
ILU_UPPER_LEFT = 1795,
ILU_UPPER_RIGHT = 1796,
ILU_CENTER = 1797,
ILU_CONVOLUTION_MATRIX = 1808,
ILU_VERSION_NUM = IL_VERSION_NUM,
ILU_VENDOR = IL_VENDOR,
ILU_ENGLISH = 2048,
ILU_ARABIC = 2049,
ILU_DUTCH = 2050,
ILU_JAPANESE = 2051,
ILU_SPANISH = 2052,
}
struct ILinfo
{
    ILuint Id;
    ILubyte* Data;
    ILuint Width;
    ILuint Height;
    ILuint Depth;
    ILubyte Bpp;
    ILuint SizeOfData;
    ILenum Format;
    ILenum Type;
    ILenum Origin;
    ILubyte* Palette;
    ILenum PalType;
    ILuint PalSize;
    ILenum CubeFlags;
    ILuint NumNext;
    ILuint NumMips;
    ILuint NumLayers;
}
struct ILpointf
{
    ILfloat x;
    ILfloat y;
}
struct ILpointi
{
    ILint x;
    ILint y;
}
