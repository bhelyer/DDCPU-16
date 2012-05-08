// D import file generated from 'derelict\opengl\glufuncs.d'
module derelict.opengl.glufuncs;
private 
{
    import derelict.util.compat;
    import derelict.opengl.gltypes;
    import derelict.opengl.glutypes;
}
extern (Windows) 
{
    alias void function(GLUnurbs*) da_gluBeginCurve;
    alias void function(GLUtesselator*) da_gluBeginPolygon;
    alias void function(GLUnurbs*) da_gluBeginSurface;
    alias void function(GLUnurbs*) da_gluBeginTrim;
    alias GLint function(GLenum, GLint, GLsizei, GLenum, GLenum, in void*) da_gluBuild1DMipmaps;
    alias GLint function(GLenum, GLint, GLsizei, GLsizei, GLenum, GLenum, in void*) da_gluBuild2DMipmaps;
    alias void function(GLUquadric*, GLdouble, GLdouble, GLdouble, GLint, GLint) da_gluCylinder;
    alias void function(GLUnurbs*) da_gluDeleteNurbsRenderer;
    alias void function(GLUquadric*) da_gluDeleteQuadric;
    alias void function(GLUtesselator*) da_gluDeleteTess;
    alias void function(GLUquadric*, GLdouble, GLdouble, GLint, GLint) da_gluDisk;
    alias void function(GLUnurbs*) da_gluEndCurve;
    alias void function(GLUtesselator*) da_gluEndPolygon;
    alias void function(GLUnurbs*) da_gluEndSurface;
    alias void function(GLUnurbs*) da_gluEndTrim;
    alias CCPTR function(GLenum) da_gluErrorString;
    alias void function(GLUnurbs*, GLenum, GLfloat*) da_gluGetNurbsProperty;
    alias CCPTR function(GLenum) da_gluGetString;
    alias void function(GLUtesselator*, GLenum, GLdouble*) da_gluGetTessProperty;
    alias void function(GLUnurbs*, in GLfloat*, in GLfloat*, in GLint*) da_gluLoadSamplingMatrices;
    alias void function(GLdouble, GLdouble, GLdouble, GLdouble, GLdouble, GLdouble, GLdouble, GLdouble, GLdouble) da_gluLookAt;
    alias GLUnurbs* function() da_gluNewNurbsRenderer;
    alias GLUquadric* function() da_gluNewQuadric;
    alias GLUtesselator* function() da_gluNewTess;
    alias void function(GLUtesselator*, GLenum) da_gluNextContour;
    alias void function(GLUnurbs*, GLenum, _GLUfuncptr) da_gluNurbsCallback;
    alias void function(GLUnurbs*, GLint, GLfloat*, GLint, GLfloat*, GLint, GLenum) da_gluNurbsCurve;
    alias void function(GLUnurbs*, GLenum, GLfloat) da_gluNurbsProperty;
    alias void function(GLUnurbs*, GLint, GLfloat*, GLint, GLfloat*, GLint, GLint, GLfloat*, GLint, GLint, GLenum) da_gluNurbsSurface;
    alias void function(GLdouble, GLdouble, GLdouble, GLdouble) da_gluOrtho2D;
    alias void function(GLUquadric*, GLdouble, GLdouble, GLint, GLint, GLdouble, GLdouble) da_gluPartialDisk;
    alias void function(GLdouble, GLdouble, GLdouble, GLdouble) da_gluPerspective;
    alias void function(GLdouble, GLdouble, GLdouble, GLdouble, GLint*) da_gluPickMatrix;
    alias GLint function(GLdouble, GLdouble, GLdouble, in GLdouble*, in GLdouble*, in GLint*, GLdouble*, GLdouble*, GLdouble*) da_gluProject;
    alias void function(GLUnurbs*, GLint, GLfloat*, GLint, GLenum) da_gluPwlCurve;
    alias void function(GLUquadric*, GLenum, _GLUfuncptr) da_gluQuadricCallback;
    alias void function(GLUquadric*, GLenum) da_gluQuadricDrawStyle;
    alias void function(GLUquadric*, GLenum) da_gluQuadricNormals;
    alias void function(GLUquadric*, GLenum) da_gluQuadricOrientation;
    alias void function(GLUquadric*, GLboolean) da_gluQuadricTexture;
    alias GLint function(GLenum, GLsizei, GLsizei, GLenum, in void*, GLsizei, GLsizei, GLenum, GLvoid*) da_gluScaleImage;
    alias void function(GLUquadric*, GLdouble, GLint, GLint) da_gluSphere;
    alias void function(GLUtesselator*) da_gluTessBeginContour;
    alias void function(GLUtesselator*, GLvoid*) da_gluTessBeginPolygon;
    alias void function(GLUtesselator*, GLenum, _GLUfuncptr) da_gluTessCallback;
    alias void function(GLUtesselator*) da_gluTessEndContour;
    alias void function(GLUtesselator*) da_gluTessEndPolygon;
    alias void function(GLUtesselator*, GLdouble, GLdouble, GLdouble) da_gluTessNormal;
    alias void function(GLUtesselator*, GLenum, GLdouble) da_gluTessProperty;
    alias void function(GLUtesselator*, GLdouble*, GLvoid*) da_gluTessVertex;
    alias GLint function(GLdouble, GLdouble, GLdouble, in GLdouble*, in GLdouble*, in GLint*, GLdouble*, GLdouble*, GLdouble*) da_gluUnProject;
}
mixin(gsharedString!() ~ "\x0ada_gluBeginCurve gluBeginCurve;\x0ada_gluBeginPolygon gluBeginPolygon;\x0ada_gluBeginSurface gluBeginSurface;\x0ada_gluBeginTrim gluBeginTrim;\x0ada_gluBuild1DMipmaps gluBuild1DMipmaps;\x0ada_gluBuild2DMipmaps gluBuild2DMipmaps;\x0ada_gluCylinder gluCylinder;\x0ada_gluDeleteNurbsRenderer gluDeleteNurbsRenderer;\x0ada_gluDeleteQuadric gluDeleteQuadric;\x0ada_gluDeleteTess gluDeleteTess;\x0ada_gluDisk gluDisk;\x0ada_gluEndCurve gluEndCurve;\x0ada_gluEndPolygon gluEndPolygon;\x0ada_gluEndSurface gluEndSurface;\x0ada_gluEndTrim gluEndTrim;\x0ada_gluErrorString gluErrorString;\x0a// wchar* function(GLenum) gluErrorUnicodeStringEXT;\x0ada_gluGetNurbsProperty gluGetNurbsProperty;\x0ada_gluGetString gluGetString;\x0ada_gluGetTessProperty gluGetTessProperty;\x0ada_gluLoadSamplingMatrices gluLoadSamplingMatrices;\x0ada_gluLookAt gluLookAt;\x0ada_gluNewNurbsRenderer gluNewNurbsRenderer;\x0ada_gluNewQuadric gluNewQuadric;\x0ada_gluNewTess gluNewTess;\x0ada_gluNextContour gluNextContour;\x0ada_gluNurbsCallback gluNurbsCallback;\x0ada_gluNurbsCurve gluNurbsCurve;\x0ada_gluNurbsProperty gluNurbsProperty;\x0ada_gluNurbsSurface gluNurbsSurface;\x0ada_gluOrtho2D gluOrtho2D;\x0ada_gluPartialDisk gluPartialDisk;\x0ada_gluPerspective gluPerspective;\x0ada_gluPickMatrix gluPickMatrix;\x0ada_gluProject gluProject;\x0ada_gluPwlCurve gluPwlCurve;\x0ada_gluQuadricCallback gluQuadricCallback;\x0ada_gluQuadricDrawStyle gluQuadricDrawStyle;\x0ada_gluQuadricNormals gluQuadricNormals;\x0ada_gluQuadricOrientation gluQuadricOrientation;\x0ada_gluQuadricTexture gluQuadricTexture;\x0ada_gluScaleImage gluScaleImage;\x0ada_gluSphere gluSphere;\x0ada_gluTessBeginContour gluTessBeginContour;\x0ada_gluTessBeginPolygon gluTessBeginPolygon;\x0ada_gluTessCallback gluTessCallback;\x0ada_gluTessEndContour gluTessEndContour;\x0ada_gluTessEndPolygon gluTessEndPolygon;\x0ada_gluTessNormal gluTessNormal;\x0ada_gluTessProperty gluTessProperty;\x0ada_gluTessVertex gluTessVertex;\x0ada_gluUnProject gluUnProject;\x0a");
