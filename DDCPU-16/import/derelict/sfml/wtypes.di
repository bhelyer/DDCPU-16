// D import file generated from 'derelict\sfml\wtypes.d'
module derelict.sfml.wtypes;
private 
{
    import derelict.util.compat;
    import derelict.sfml.config;
}
struct sfContext;
struct sfInput;
struct sfWindow;
alias int sfKeyCode;
enum 
{
sfKeyA = 'a',
sfKeyB = 'b',
sfKeyC = 'c',
sfKeyD = 'd',
sfKeyE = 'e',
sfKeyF = 'f',
sfKeyG = 'g',
sfKeyH = 'h',
sfKeyI = 'i',
sfKeyJ = 'j',
sfKeyK = 'k',
sfKeyL = 'l',
sfKeyM = 'm',
sfKeyN = 'n',
sfKeyO = 'o',
sfKeyP = 'p',
sfKeyQ = 'q',
sfKeyR = 'r',
sfKeyS = 's',
sfKeyT = 't',
sfKeyU = 'u',
sfKeyV = 'v',
sfKeyW = 'w',
sfKeyX = 'x',
sfKeyY = 'y',
sfKeyZ = 'z',
sfKeyNum0 = '0',
sfKeyNum1 = '1',
sfKeyNum2 = '2',
sfKeyNum3 = '3',
sfKeyNum4 = '4',
sfKeyNum5 = '5',
sfKeyNum6 = '6',
sfKeyNum7 = '7',
sfKeyNum8 = '8',
sfKeyNum9 = '9',
sfKeyEscape = 256,
sfKeyLControl,
sfKeyLShift,
sfKeyLAlt,
sfKeyLSystem,
sfKeyRControl,
sfKeyRShift,
sfKeyRAlt,
sfKeyRSystem,
sfKeyMenu,
sfKeyLBracket,
sfKeyRBracket,
sfKeySemiColon,
sfKeyComma,
sfKeyPeriod,
sfKeyQuote,
sfKeySlash,
sfKeyBackSlash,
sfKeyTilde,
sfKeyEqual,
sfKeyDash,
sfKeySpace,
sfKeyReturn,
sfKeyBack,
sfKeyTab,
sfKeyPageUp,
sfKeyPageDown,
sfKeyEnd,
sfKeyHome,
sfKeyInsert,
sfKeyDelete,
sfKeyAdd,
sfKeySubtract,
sfKeyMultiply,
sfKeyDivide,
sfKeyLeft,
sfKeyRight,
sfKeyUp,
sfKeyDown,
sfKeyNumpad0,
sfKeyNumpad1,
sfKeyNumpad2,
sfKeyNumpad3,
sfKeyNumpad4,
sfKeyNumpad5,
sfKeyNumpad6,
sfKeyNumpad7,
sfKeyNumpad8,
sfKeyNumpad9,
sfKeyF1,
sfKeyF2,
sfKeyF3,
sfKeyF4,
sfKeyF5,
sfKeyF6,
sfKeyF7,
sfKeyF8,
sfKeyF9,
sfKeyF10,
sfKeyF11,
sfKeyF12,
sfKeyF13,
sfKeyF14,
sfKeyF15,
sfKeyPause,
sfKeyCount,
}
alias int sfMouseButton;
enum 
{
sfButtonLeft,
sfButtonRight,
sfButtonMiddle,
sfButtonX1,
sfButtonX2,
}
alias int sfJoyAxis;
enum 
{
sfJoyAxisX,
sfJoyAxisY,
sfJoyAxisZ,
sfJoyAxisR,
sfJoyAxisU,
sfJoyAxisV,
sfJoyAxisPOV,
}
alias int sfEventType;
enum 
{
sfEvtClosed,
sfEvtResized,
sfEvtLostFocus,
sfEvtGainedFocus,
sfEvtTextEntered,
sfEvtKeyPressed,
sfEvtKeyReleased,
sfEvtMouseWheelMoved,
sfEvtMouseButtonPressed,
sfEvtMouseButtonReleased,
sfEvtMouseMoved,
sfEvtMouseEntered,
sfEvtMouseLeft,
sfEvtJoyButtonPressed,
sfEvtJoyButtonReleased,
sfEvtJoyMoved,
}
struct sfKeyEvent
{
    sfEventType Type;
    sfKeyCode Code;
    sfBool Alt;
    sfBool Control;
    sfBool Shift;
}
struct sfTextEvent
{
    sfEventType Type;
    sfUint32 Unicode;
}
struct sfMouseMoveEvent
{
    sfEventType Type;
    int X;
    int Y;
}
struct sfMouseButtonEvent
{
    sfEventType Type;
    sfMouseButton Button;
    int X;
    int Y;
}
struct sfMouseWheelEvent
{
    sfEventType Type;
    int Delta;
}
struct sfJoyMoveEvent
{
    sfEventType Type;
    uint JoystickId;
    sfJoyAxis Axis;
    float Position;
}
struct sfJoyButtonEvent
{
    sfEventType Type;
    uint JoystickId;
    uint Button;
}
struct sfSizeEvent
{
    sfEventType Type;
    uint Width;
    uint Height;
}
union sfEvent
{
    sfEventType Type;
    sfKeyEvent Key;
    sfTextEvent Text;
    sfMouseMoveEvent MouseMove;
    sfMouseButtonEvent MouseButton;
    sfMouseWheelEvent MouseWheel;
    sfJoyMoveEvent JoyMove;
    sfJoyButtonEvent JoyButton;
    sfSizeEvent Size;
}
struct sfVideoMode
{
    uint Width;
    uint Height;
    uint BitsPerPixel;
}
enum 
{
sfNone = 0,
sfTitleBar = 1 << 0,
sfResize = 1 << 1,
sfClose = 1 << 2,
sfFullscreen = 1 << 3,
}
struct sfWindowSettings
{
    uint DepthBits;
    uint StencilBits;
    uint AntialiasingLevel;
}
version (Windows)
{
    alias void* sfWindowHandle;
}
else
{
    version (linux)
{
    alias c_ulong sfWindowHandle;
}
else
{
    version (posix)
{
    alias c_ulong sfWindowHandle;
}
else
{
    version (OSX)
{
    alias void* sfWindowHandle;
}
else
{
    version (darwin)
{
    alias void* sfWindowHandle;
}
}
}
}
}
