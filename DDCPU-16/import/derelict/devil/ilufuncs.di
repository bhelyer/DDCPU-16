// D import file generated from 'derelict\devil\ilufuncs.d'
module derelict.devil.ilufuncs;
private 
{
    import derelict.util.compat;
    import derelict.devil.iltypes;
    import derelict.devil.ilutypes;
}
extern (Windows) 
{
    alias ILboolean function() da_iluAlienify;
    alias ILboolean function(ILuint) da_iluBlurAvg;
    alias ILboolean function(ILuint) da_iluBlurGaussian;
    alias ILboolean function() da_iluBuildMipmaps;
    alias ILuint function() da_iluColoursUsed;
    alias ILboolean function(ILuint) da_iluCompareImage;
    alias ILboolean function(ILfloat) da_iluContrast;
    alias ILboolean function(ILuint, ILuint, ILuint, ILuint, ILuint, ILuint) da_iluCrop;
    alias ILvoid function(ILuint) da_iluDeleteImage;
    alias ILboolean function() da_iluEdgeDetectE;
    alias ILboolean function() da_iluEdgeDetectP;
    alias ILboolean function() da_iluEdgeDetectS;
    alias ILboolean function() da_iluEmboss;
    alias ILboolean function(ILuint, ILuint, ILuint) da_iluEnlargeCanvas;
    alias ILboolean function(ILfloat, ILfloat, ILfloat) da_iluEnlargeImage;
    alias ILboolean function() da_iluEqualize;
    alias ILconst_string function(ILenum) da_iluErrorString;
    alias ILboolean function(ILint*, ILint, ILint) da_iluConvolution;
    alias ILboolean function() da_iluFlipImage;
    alias ILboolean function(ILfloat) da_iluGammaCorrect;
    alias ILuint function() da_iluGenImage;
    alias ILvoid function(ILinfo*) da_iluGetImageInfo;
    alias ILint function(ILenum) da_iluGetInteger;
    alias ILvoid function(ILenum, ILint*) da_iluGetIntegerv;
    alias ILstring function(ILenum) da_iluGetString;
    alias ILvoid function(ILenum, ILenum) da_iluImageParameter;
    alias ILvoid function() da_iluInit;
    alias ILboolean function() da_iluInvertAlpha;
    alias ILuint function(ILconst_string) da_iluLoadImage;
    alias ILboolean function() da_iluMirror;
    alias ILboolean function() da_iluNegative;
    alias ILboolean function(ILclampf) da_iluNoisify;
    alias ILboolean function(ILuint) da_iluPixelize;
    alias ILvoid function(ILpointf*, ILuint) da_iluRegionfv;
    alias ILvoid function(ILpointi*, ILuint) da_iluRegioniv;
    alias ILboolean function(ILubyte, ILubyte, ILubyte, ILfloat) da_iluReplaceColour;
    alias ILboolean function(ILfloat) da_iluRotate;
    alias ILboolean function(ILfloat, ILfloat, ILfloat, ILfloat) da_iluRotate3D;
    alias ILboolean function(ILfloat) da_iluSaturate1f;
    alias ILboolean function(ILfloat, ILfloat, ILfloat, ILfloat) da_iluSaturate4f;
    alias ILboolean function(ILuint, ILuint, ILuint) da_iluScale;
    alias ILboolean function(ILfloat, ILfloat, ILfloat) da_iluScaleColours;
    alias ILboolean function(ILenum) da_iluSetLanguage;
    alias ILboolean function(ILfloat, ILuint) da_iluSharpen;
    alias ILboolean function() da_iluSwapColours;
    alias ILboolean function(ILfloat) da_iluWave;
}
mixin(gsharedString!() ~ "\x0ada_iluAlienify iluAlienify;\x0ada_iluBlurAvg iluBlurAvg;\x0ada_iluBlurGaussian iluBlurGaussian;\x0ada_iluBuildMipmaps iluBuildMipmaps;\x0ada_iluColoursUsed iluColoursUsed;\x0ada_iluCompareImage iluCompareImage;\x0ada_iluContrast iluContrast;\x0ada_iluCrop iluCrop;\x0ada_iluDeleteImage iluDeleteImage;\x0ada_iluEdgeDetectE iluEdgeDetectE;\x0ada_iluEdgeDetectP iluEdgeDetectP;\x0ada_iluEdgeDetectS iluEdgeDetectS;\x0ada_iluEmboss iluEmboss;\x0ada_iluEnlargeCanvas iluEnlargeCanvas;\x0ada_iluEnlargeImage iluEnlargeImage;\x0ada_iluEqualize iluEqualize;\x0ada_iluErrorString iluErrorString;\x0ada_iluConvolution iluConvolution;\x0ada_iluFlipImage iluFlipImage;\x0ada_iluGammaCorrect iluGammaCorrect;\x0ada_iluGenImage iluGenImage;\x0ada_iluGetImageInfo iluGetImageInfo;\x0ada_iluGetInteger iluGetInteger;\x0ada_iluGetIntegerv iluGetIntegerv;\x0ada_iluGetString iluGetString;\x0ada_iluImageParameter iluImageParameter;\x0ada_iluInit iluInit;\x0ada_iluInvertAlpha iluInvertAlpha;\x0ada_iluLoadImage iluLoadImage;\x0ada_iluMirror iluMirror;\x0ada_iluNegative iluNegative;\x0ada_iluNoisify iluNoisify;\x0ada_iluPixelize iluPixelize;\x0ada_iluRegionfv iluRegionfv;\x0ada_iluRegioniv iluRegioniv;\x0ada_iluReplaceColour iluReplaceColour;\x0ada_iluRotate iluRotate;\x0ada_iluRotate3D iluRotate3D;\x0ada_iluSaturate1f iluSaturate1f;\x0ada_iluSaturate4f iluSaturate4f;\x0ada_iluScale iluScale;\x0ada_iluScaleColours iluScaleColours;\x0ada_iluSetLanguage iluSetLanguage;\x0ada_iluSharpen iluSharpen;\x0ada_iluSwapColours iluSwapColours;\x0ada_iluWave iluWave;\x0a\x0aalias iluColoursUsed    iluColorsUsed;\x0aalias iluSwapColours    iluSwapColors;\x0aalias iluReplaceColour  iluReplaceColor;\x0aalias iluScaleColours  iluScaleColors;\x0a");
