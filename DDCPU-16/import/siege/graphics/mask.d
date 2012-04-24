module siege.graphics.mask;

import std.string;

import siege.graphics.sprite;
import siege.graphics.texture;
import siege.c.graphics.mask;


class Mask
{
    SGMask* handle;
    
    this(Sprite sprite)
    {
        handle = sgMaskCreateSprite(sprite.handle);
        assert(handle);
    }
    
    this(Texture texture)
    {
        handle = sgMaskCreateTexture(texture.handle);
        assert(handle);
    }
    
    this(Texture texture, int xoffset, int yoffset)
    {
        handle = sgMaskCreateTexture2i(texture.handle, xoffset, yoffset);
        assert(handle);
    }
    
    this(string fname)
    {
        handle = sgMaskCreateFile(toStringz(fname));
        assert(handle);
    }
    
    this(string fname, int xoffset, int yoffset)
    {
        handle = sgMaskCreateFile2i(toStringz(fname), xoffset, yoffset);
        assert(handle);
    }
    
    ~this()
    {
        sgMaskDestroy(handle);
    }
    
    bool checkCollision(int x1, int y1, Mask m2, int x2, int y2)
    {
        return sgMaskCheckCollision(handle, x1, y1, m2.handle, x2, y2);
    }
    
    void getSize(out uint width, out uint height)
    {
        sgMaskGetSize(handle, &width, &height);
    }
    
    @property uint width()
    {
        return sgMaskGetWidth(handle);
    }
    
    @property uint height()
    {
        return sgMaskGetHeight(handle);
    }
    
    void drawDBG(int x, int y, bool transparent)
    {
        sgMaskDrawDBG(handle, x, y, transparent);
    }
}
