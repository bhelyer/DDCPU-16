// D import file generated from 'derelict\sdl\net.d'
module derelict.sdl.net;
private 
{
    import derelict.util.loader;
    import derelict.util.exception;
    import derelict.util.compat;
    import derelict.sdl.sdl;
}
enum : Uint8
{
SDL_NET_MAJOR_VERSION = 1,
SDL_NET_MINOR_VERSION = 2,
SDL_NET_PATCHLEVEL = 8,
}
struct IPaddress
{
    Uint32 host;
    Uint16 port;
}
struct TCPsocketStruct
{
}
alias TCPsocketStruct* TCPsocket;
enum : uint
{
INADDR_ANY = 0,
INADDR_NONE = -1u,
INADDR_BROADCAST = -1u,
SDLNET_MAX_UDPCHANNELS = 32,
SDLNET_MAX_UDPADDRESSES = 4,
}
struct UDPsocketStruct
{
}
alias UDPsocketStruct* UDPsocket;
struct UDPpacket
{
    int channel;
    Uint8* data;
    int len;
    int maxlen;
    int status;
    IPaddress address;
}
alias void* SDLNet_SocketSet;
struct _SDLNet_GenericSocket
{
    int ready;
}
alias _SDLNet_GenericSocket* SDLNet_GenericSocket;
alias SDL_SetError SDLNet_SetError;
alias SDL_GetError SDLNet_GetError;
void SDL_NET_VERSION(SDL_version* X)
{
X.major = SDL_NET_MAJOR_VERSION;
X.minor = SDL_NET_MINOR_VERSION;
X.patch = SDL_NET_PATCHLEVEL;
}
int SDLNet_TCP_AddSocket(SDLNet_SocketSet set, TCPsocket sock)
{
return SDLNet_AddSocket(set,cast(SDLNet_GenericSocket)sock);
}
int SDLNet_TCP_DelSocket(SDLNet_SocketSet set, TCPsocket sock)
{
return SDLNet_DelSocket(set,cast(SDLNet_GenericSocket)sock);
}
int SDLNet_UDP_AddSocket(SDLNet_SocketSet set, UDPsocket sock)
{
return SDLNet_AddSocket(set,cast(SDLNet_GenericSocket)sock);
}
int SDLNet_UDP_DelSocket(SDLNet_SocketSet set, UDPsocket sock)
{
return SDLNet_DelSocket(set,cast(SDLNet_GenericSocket)sock);
}
bool SDLNet_SocketReady(TCPsocket sock)
{
return cast(bool)(sock !is null && (cast(SDLNet_GenericSocket)sock).ready);
}
bool SDLNet_SocketReady(UDPsocket sock)
{
return cast(bool)(sock !is null && (cast(SDLNet_GenericSocket)sock).ready);
}
void SDLNet_Write16(Uint16 value, void* areap)
{
Uint16* areap16 = cast(Uint16*)areap;
*areap16 = SDL_SwapBE16(value);
}
Uint16 SDLNet_Read16(void* areap)
{
Uint16* areap16 = cast(Uint16*)areap;
return SDL_SwapBE16(*areap16);
}
void SDLNet_Write32(Uint32 value, void* areap)
{
Uint32* areap32 = cast(Uint32*)areap;
*areap32 = SDL_SwapBE32(value);
}
Uint32 SDLNet_Read32(void* areap)
{
Uint32* areap32 = cast(Uint32*)areap;
return SDL_SwapBE32(*areap32);
}
extern (C) 
{
    alias CSDLVERPTR function() da_SDLNet_Linked_Version;
    alias int function() da_SDLNet_Init;
    alias void function() da_SDLNet_Quit;
    alias int function(IPaddress*, in char*, Uint16) da_SDLNet_ResolveHost;
    alias CCPTR function(in IPaddress*) da_SDLNet_ResolveIP;
    alias int function(IPaddress*, int) da_SDLNet_GetLocalAddresses;
    alias TCPsocket function(IPaddress*) da_SDLNet_TCP_Open;
    alias TCPsocket function(TCPsocket) da_SDLNet_TCP_Accept;
    alias IPaddress* function(TCPsocket) da_SDLNet_TCP_GetPeerAddress;
    alias int function(TCPsocket, in void*, int) da_SDLNet_TCP_Send;
    alias int function(TCPsocket, void*, int) da_SDLNet_TCP_Recv;
    alias void function(TCPsocket) da_SDLNet_TCP_Close;
    alias UDPpacket* function(int) da_SDLNet_AllocPacket;
    alias int function(UDPpacket*) da_SDLNet_ResizePacket;
    alias void function(UDPpacket*) da_SDLNet_FreePacket;
    alias UDPpacket** function(int, int) da_SDLNet_AllocPacketV;
    alias void function(UDPpacket**) da_SDLNet_FreePacketV;
    alias UDPsocket function(Uint16) da_SDLNet_UDP_Open;
    alias void function(Uint16) da_SDLNet_UDP_SetPacketLoss;
    alias int function(UDPsocket, int, IPaddress*) da_SDLNet_UDP_Bind;
    alias void function(UDPsocket, int) da_SDLNet_UDP_Unbind;
    alias IPaddress* function(UDPsocket, int) da_SDLNet_UDP_GetPeerAddress;
    alias int function(UDPsocket, UDPpacket**, int) da_SDLNet_UDP_SendV;
    alias int function(UDPsocket, int, UDPpacket*) da_SDLNet_UDP_Send;
    alias int function(UDPsocket, UDPpacket**) da_SDLNet_UDP_RecvV;
    alias int function(UDPsocket, UDPpacket*) da_SDLNet_UDP_Recv;
    alias void function(UDPsocket) da_SDLNet_UDP_Close;
    alias SDLNet_SocketSet function(int) da_SDLNet_AllocSocketSet;
    alias int function(SDLNet_SocketSet, SDLNet_GenericSocket) da_SDLNet_AddSocket;
    alias int function(SDLNet_SocketSet, SDLNet_GenericSocket) da_SDLNet_DelSocket;
    alias int function(SDLNet_SocketSet, Uint32) da_SDLNet_CheckSockets;
    alias void function(SDLNet_SocketSet) da_SDLNet_FreeSocketSet;
}
mixin(gsharedString!() ~ "\x0ada_SDLNet_Linked_Version SDLNet_Linked_Version;\x0ada_SDLNet_Init SDLNet_Init;\x0ada_SDLNet_Quit SDLNet_Quit;\x0ada_SDLNet_ResolveHost SDLNet_ResolveHost;\x0ada_SDLNet_ResolveIP SDLNet_ResolveIP;\x0ada_SDLNet_GetLocalAddresses SDLNet_GetLocalAddresses;\x0ada_SDLNet_TCP_Open SDLNet_TCP_Open;\x0ada_SDLNet_TCP_Accept SDLNet_TCP_Accept;\x0ada_SDLNet_TCP_GetPeerAddress SDLNet_TCP_GetPeerAddress;\x0ada_SDLNet_TCP_Send SDLNet_TCP_Send;\x0ada_SDLNet_TCP_Recv SDLNet_TCP_Recv;\x0ada_SDLNet_TCP_Close SDLNet_TCP_Close;\x0ada_SDLNet_AllocPacket SDLNet_AllocPacket;\x0ada_SDLNet_ResizePacket SDLNet_ResizePacket;\x0ada_SDLNet_FreePacket SDLNet_FreePacket;\x0ada_SDLNet_AllocPacketV SDLNet_AllocPacketV;\x0ada_SDLNet_FreePacketV SDLNet_FreePacketV;\x0ada_SDLNet_UDP_Open SDLNet_UDP_Open;\x0ada_SDLNet_UDP_SetPacketLoss SDLNet_UDP_SetPacketLoss;\x0ada_SDLNet_UDP_Bind SDLNet_UDP_Bind;\x0ada_SDLNet_UDP_Unbind SDLNet_UDP_Unbind;\x0ada_SDLNet_UDP_GetPeerAddress SDLNet_UDP_GetPeerAddress;\x0ada_SDLNet_UDP_SendV SDLNet_UDP_SendV;\x0ada_SDLNet_UDP_Send SDLNet_UDP_Send;\x0ada_SDLNet_UDP_RecvV SDLNet_UDP_RecvV;\x0ada_SDLNet_UDP_Recv SDLNet_UDP_Recv;\x0ada_SDLNet_UDP_Close SDLNet_UDP_Close;\x0ada_SDLNet_AllocSocketSet SDLNet_AllocSocketSet;\x0ada_SDLNet_AddSocket SDLNet_AddSocket;\x0ada_SDLNet_DelSocket SDLNet_DelSocket;\x0ada_SDLNet_CheckSockets SDLNet_CheckSockets;\x0ada_SDLNet_FreeSocketSet SDLNet_FreeSocketSet;\x0a");
class DerelictSDLNetLoader : SharedLibLoader
{
    public 
{
    this()
{
super("SDL_net.dll","libSDL_net.so, libSDL_net-1.2.so, libSDL_net-1.2.so.0","../Frameworks/SDL_net.framework/SDL_net, /Library/Frameworks/SDL_net.framework/SDL_net, /System/Library/Frameworks/SDL_net.framework/SDL_net");
}
    protected override void loadSymbols();


}
}
DerelictSDLNetLoader DerelictSDLNet;
static this();
