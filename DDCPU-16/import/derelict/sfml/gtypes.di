// D import file generated from 'derelict\sfml\gtypes.d'
module derelict.sfml.gtypes;
private import derelict.sfml.config;

alias int sfBlendMode;
enum 
{
sfBlendAlpha,
sfBlendAdd,
sfBlendMultiply,
sfBlendNone,
}
struct sfColor
{
    sfUint8 r;
    sfUint8 g;
    sfUint8 b;
    sfUint8 a;
}
sfColor sfBlack = {0,0,0,255};
sfColor sfWhite = {255,255,255,255};
sfColor sfRed = {255,0,0,255};
sfColor sfGreen = {0,255,0,255};
sfColor sfBlue = {0,0,255,255};
sfColor sfYellow = {255,255,0,255};
sfColor sfMagenta = {255,0,255,255};
sfColor sfCyan = {0,255,255,255};
struct sfGlyph
{
    int Advance;
    sfIntRect Rectangle;
    sfFloatRect TexCoords;
}
struct sfFloatRect
{
    float Left;
    float Top;
    float Right;
    float Bottom;
}
struct sfIntRect
{
    int Left;
    int Top;
    int Right;
    int Bottom;
}
alias uint sfStringStyle;
enum 
{
sfStringRegular = 0,
sfStringBold = 1 << 0,
sfStringItalic = 1 << 1,
sfStringUnderlined = 1 << 2,
}
struct sfFont;
struct sfImage;
struct sfPostFX;
struct sfRenderWindow;
struct sfShape;
struct sfSprite;
struct sfString;
struct sfView;
