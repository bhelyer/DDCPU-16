// D import file generated from 'derelict\sfml\system.d'
module derelict.sfml.system;
public 
{
    import derelict.sfml.stypes;
    import derelict.sfml.sfuncs;
}
private import derelict.util.loader;

class DerelictSFMLSystemLoader : SharedLibLoader
{
    public 
{
    this()
{
super("csfml-system.dll","libcsfml-system.so,libcsfml-system.so.1.6","../Frameworks/csfml-system.framework/csfml-system, /Library/Frameworks/csfml-system.framework/csfml-system, /System/Library/Frameworks/csfml-system.framework/csfml-system");
}
    protected override void loadSymbols()
{
bindFunc(cast(void**)&sfClock_Create,"sfClock_Create");
bindFunc(cast(void**)&sfClock_Destroy,"sfClock_Destroy");
bindFunc(cast(void**)&sfClock_GetTime,"sfClock_GetTime");
bindFunc(cast(void**)&sfClock_Reset,"sfClock_Reset");
bindFunc(cast(void**)&sfMutex_Create,"sfMutex_Create");
bindFunc(cast(void**)&sfMutex_Destroy,"sfMutex_Destroy");
bindFunc(cast(void**)&sfMutex_Lock,"sfMutex_Lock");
bindFunc(cast(void**)&sfMutex_Unlock,"sfMutex_Unlock");
bindFunc(cast(void**)&sfRandom_SetSeed,"sfRandom_SetSeed");
bindFunc(cast(void**)&sfRandom_GetSeed,"sfRandom_GetSeed");
bindFunc(cast(void**)&sfRandom_Float,"sfRandom_Float");
bindFunc(cast(void**)&sfRandom_Int,"sfRandom_Int");
bindFunc(cast(void**)&sfSleep,"sfSleep");
bindFunc(cast(void**)&sfThread_Create,"sfThread_Create");
bindFunc(cast(void**)&sfThread_Destroy,"sfThread_Destroy");
bindFunc(cast(void**)&sfThread_Launch,"sfThread_Launch");
bindFunc(cast(void**)&sfThread_Wait,"sfThread_Wait");
bindFunc(cast(void**)&sfThread_Terminate,"sfThread_Terminate");
}


}
}
DerelictSFMLSystemLoader DerelictSFMLSystem;
static this();
