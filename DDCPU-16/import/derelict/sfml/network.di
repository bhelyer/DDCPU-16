// D import file generated from 'derelict\sfml\network.d'
module derelict.sfml.network;
public 
{
    import derelict.sfml.ntypes;
    import derelict.sfml.nfuncs;
}
private import derelict.util.loader;

class DerelictSFMLNetworkLoader : SharedLibLoader
{
    public 
{
    this()
{
super("csfml-network.dll","libcsfml-network.so,libcsfml-network.so.1.6","../Frameworks/csfml-network.framework/csfml-network, /Library/Frameworks/csfml-network.framework/csfml-network, /System/Library/Frameworks/csfml-network.framework/csfml-network");
}
    protected override void loadSymbols();


}
}
DerelictSFMLNetworkLoader DerelictSFMLNetwork;
static this();
