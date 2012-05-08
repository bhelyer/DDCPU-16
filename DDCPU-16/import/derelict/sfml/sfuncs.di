// D import file generated from 'derelict\sfml\sfuncs.d'
module derelict.sfml.sfuncs;
private 
{
    import derelict.util.compat;
    import derelict.sfml.stypes;
}
extern (C) 
{
    alias sfClock* function() da_sfClock_Create;
    alias void function(sfClock*) da_sfClock_Destroy;
    alias float function(sfClock*) da_sfClock_GetTime;
    alias void function(sfClock*) da_sfClock_Reset;
    alias sfMutex* function() da_sfMutex_Create;
    alias void function(sfMutex*) da_sfMutex_Destroy;
    alias void function(sfMutex*) da_sfMutex_Lock;
    alias void function(sfMutex*) da_sfMutex_Unlock;
    alias void function(uint) da_sfRandom_SetSeed;
    alias uint function() da_sfRandom_GetSeed;
    alias float function(float, float) da_sfRandom_Float;
    alias int function(int, int) da_sfRandom_Int;
    alias void function(float) da_sfSleep;
    alias sfThread* function(void function(void*), void*) da_sfThread_Create;
    alias void function(sfThread*) da_sfThread_Destroy;
    alias void function(sfThread*) da_sfThread_Launch;
    alias void function(sfThread*) da_sfThread_Wait;
    alias void function(sfThread*) da_sfThread_Terminate;
}
mixin(gsharedString!() ~ "\x0ada_sfClock_Create sfClock_Create;\x0ada_sfClock_Destroy sfClock_Destroy;\x0ada_sfClock_GetTime sfClock_GetTime;\x0ada_sfClock_Reset sfClock_Reset;\x0ada_sfMutex_Create sfMutex_Create;\x0ada_sfMutex_Destroy sfMutex_Destroy;\x0ada_sfMutex_Lock sfMutex_Lock;\x0ada_sfMutex_Unlock sfMutex_Unlock;\x0ada_sfRandom_SetSeed sfRandom_SetSeed;\x0ada_sfRandom_GetSeed sfRandom_GetSeed;\x0ada_sfRandom_Float sfRandom_Float;\x0ada_sfRandom_Int sfRandom_Int;\x0ada_sfSleep sfSleep;\x0ada_sfThread_Create sfThread_Create;\x0ada_sfThread_Destroy sfThread_Destroy;\x0ada_sfThread_Launch sfThread_Launch;\x0ada_sfThread_Wait sfThread_Wait;\x0ada_sfThread_Terminate sfThread_Terminate;\x0a");
