// D import file generated from 'derelict\ode\odetypes.d'
module derelict.ode.odetypes;
private import derelict.util.compat;

private version (Tango)
{
    import tango.stdc.math;
    import tango.stdc.stdarg;
    const real PI = 0x1.921fb54442d1846ap+1L;

    const real SQRT1_2 = 0x1.6a09e667f3bcc908p-1L;

}
else
{
    import std.math;
    version (D_Version2)
{
    import core.vararg;
}
else
{
    import std.stdarg;
}
}

alias int int32;
alias uint uint32;
alias short int16;
alias ushort uint16;
alias byte int8;
alias ubyte uint8;
version (DerelictODE_DoublePrecision)
{
    alias double dReal;
}
else
{
    alias float dReal;
}
alias PI M_PI;
alias SQRT1_2 M_SQRT1_2;
version (DerelictOde_TriMesh_16Bit_Indices)
{
    alias uint16 dTriIndex;
}
else
{
    alias uint32 dTriIndex;
}
int dPAD(int a)
{
return a > 1 ? (a - 1 | 3) + 1 : a;
}
alias dReal[4] dVector3;
alias dReal[4] dVector4;
alias dReal[4 * 3] dMatrix3;
alias dReal[4 * 4] dMatrix4;
alias dReal[8 * 6] dMatrix6;
alias dReal[4] dQuaternion;
dReal dRecip(dReal x)
{
return 1 / x;
}
dReal dRecipSqrt(dReal x)
{
return 1 / sqrt(x);
}
dReal dFMod(dReal a, dReal b);
alias sqrt dSqrt;
alias sin dSin;
alias cos dCos;
alias fabs dFabs;
alias atan2 dAtan2;
alias isnan dIsNan;
alias copysign dCopySign;
struct dxWorld;
struct dxSpace;
struct dxBody;
struct dxGeom;
struct dxJoint;
struct dxJointNode;
struct dxJointGroup;
alias dxWorld* dWorldID;
alias dxSpace* dSpaceID;
alias dxBody* dBodyID;
alias dxGeom* dGeomID;
alias dxJoint* dJointID;
alias dxJointGroup* dJointGroupID;
enum 
{
d_ERR_UNKNOWN,
d_ERR_IASSERT,
d_ERR_UASSERT,
d_ERR_LCP,
}
alias int dJointType;
enum 
{
dJointTypeNone,
dJointTypeBall,
dJointTypeHinge,
dJointTypeSlider,
dJointTypeContact,
dJointTypeUniversal,
dJointTypeHinge2,
dJointTypeFixed,
dJointTypeNull,
dJointTypeAMotor,
dJointTypeLMotor,
dJointTypePlane2D,
dJointTypePR,
dJointTypePU,
dJointTypePiston,
}
enum 
{
dParamLoStop = 0,
dParamHiStop,
dParamVel,
dParamFMax,
dParamFudgeFactor,
dParamBounce,
dParamCFM,
dParamStopERP,
dParamStopCFM,
dParamSuspensionERP,
dParamSuspensionCFM,
dParamERP,
dParamsInGroup,
dParamLoStop1 = 0,
dParamHiStop1,
dParamVel1,
dParamFMax1,
dParamFudgeFactor1,
dParamBounce1,
dParamCFM1,
dParamStopERP1,
dParamStopCFM1,
dParamSuspensionERP1,
dParamSuspensionCFM1,
dParamERP1,
dParamLoStop2 = 256,
dParamHiStop2,
dParamVel2,
dParamFMax2,
dParamFudgeFactor2,
dParamBounce2,
dParamCFM2,
dParamStopERP2,
dParamStopCFM2,
dParamSuspensionERP2,
dParamSuspensionCFM2,
dParamERP2,
dParamLoStop3 = 512,
dParamHiStop3,
dParamVel3,
dParamFMax3,
dParamFudgeFactor3,
dParamBounce3,
dParamCFM3,
dParamStopERP3,
dParamStopCFM3,
dParamSuspensionERP3,
dParamSuspensionCFM3,
dParamERP3,
dParamGroup = 256,
}
enum 
{
dAMotorUser,
dAMotorEuler,
}
struct dJointFeedback
{
    dVector3 f1;
    dVector3 t1;
    dVector3 f2;
    dVector3 t2;
}
enum 
{
CONTACTS_UNIMPORTANT = -2147483648u,
}
enum 
{
dMaxUserClasses = 4,
}
enum 
{
dSphereClass = 0,
dBoxClass,
dCapsuleClass,
dCylinderClass,
dPlaneClass,
dRayClass,
dConvexClass,
dGeomTransformClass,
dTriMeshClass,
dHeightFieldClass,
dFirstSpaceClass,
dSimpleSpaceClass = dFirstSpaceClass,
dHashSpaceClass,
dSweepAndPruneClass,
dQuadTreeClass,
dLastSpaceClass = dQuadTreeClass,
dFirstUserClass,
dLastUserClass = dFirstUserClass + dMaxUserClasses - 1,
dGeomNumClasses,
}
alias dCapsuleClass dCCapsuleClass;
struct dxHeightfieldData;
alias dxHeightfieldData* dHeightfieldDataID;
extern (C) 
{
    alias dReal function(void*, int, int) dHeightfieldGetHeight;
    alias void function(dGeomID, ref dReal[6]) dGetAABBFn;
    alias int function(dGeomID, dGeomID, int, dContactGeom*, int) dColliderFn;
    alias dColliderFn function(int) dGetColliderFnFn;
    alias void function(dGeomID) dGeomDtorFn;
    alias int function(dGeomID, dGeomID, ref dReal[6]) dAABBTestFn;
}
struct dGeomClass
{
    int bytes;
    dGetColliderFnFn collider;
    dGetAABBFn aabb;
    dAABBTestFn aabb_test;
    dGeomDtorFn dtor;
}
extern (C) alias void function(void*, dGeomID, dGeomID) dNearCallback;

enum 
{
dSAP_AXES_XYZ = 0 | 1 << 2 | 2 << 4,
dSAP_AXES_XZY = 0 | 2 << 2 | 1 << 4,
dSAP_AXES_YXZ = 1 | 0 << 2 | 2 << 4,
dSAP_AXES_YZX = 1 | 2 << 2 | 0 << 4,
dSAP_AXES_ZXY = 2 | 0 << 2 | 1 << 4,
dSAP_AXES_ZYX = 2 | 1 << 2 | 0 << 4,
}
struct dxTriMeshData;
alias dxTriMeshData* dTriMeshDataID;
enum 
{
TRIMESH_FACE_NORMALS,
}
extern (C) 
{
    alias int function(dGeomID, dGeomID, int) dTriCallback;
    alias void function(dGeomID, dGeomID, in int*, int) dTriArrayCallback;
    alias int function(dGeomID, dGeomID, int, dReal, dReal) dTriRayCallback;
    alias int function(dGeomID, int, int) dTriTriMergeCallback;
}
enum 
{
dContactMu2 = 1,
dContactFDir1 = 2,
dContactBounce = 4,
dContactSoftERP = 8,
dContactSoftCFM = 16,
dContactMotion1 = 32,
dContactMotion2 = 64,
dContactMotionN = 128,
dContactSlip1 = 256,
dContactSlip2 = 512,
dContactApprox0 = 0,
dContactApprox1_1 = 4096,
dContactApprox1_2 = 8192,
dContactApprox1 = 12288,
}
struct dSurfaceParameters
{
    int mode;
    dReal mu;
    dReal mu2;
    dReal bounce;
    dReal bounce_vel;
    dReal soft_erp;
    dReal soft_cfm;
    dReal motion1;
    dReal motion2;
    dReal motionN;
    dReal slip1;
    dReal slip2;
}
struct dContactGeom
{
    dVector3 pos;
    dVector3 normal;
    dReal depth;
    dGeomID g1;
    dGeomID g2;
    int side1;
    int side2;
}
struct dContact
{
    dSurfaceParameters surface;
    dContactGeom geom;
    dVector3 fdir1;
}
extern (C) alias void function(int, char*, va_list ap) dMessageFunction;

struct dMass
{
    dReal mass;
    dVector3 C;
    dMatrix3 I;
}
extern (C) 
{
    alias void* function(size_t) dAllocFunction;
    alias void* function(void*, size_t, size_t) dReallocFunction;
    alias void function(void*, size_t) dFreeFunction;
}
enum : uint
{
dInitFlagManualThreadCleanup = 1,
}
enum : uint
{
dAllocateFlagsBasicData = 0,
dAllocateFlagsCollisionData = 1,
dAllocateMaskAll = ~0u,
}
struct dStopwatch
{
    double time;
    c_ulong[2] cc;
}
