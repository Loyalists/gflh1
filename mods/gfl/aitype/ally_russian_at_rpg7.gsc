// H1 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

main()
{
    self.animtree = "";
    self.additionalassets = "";
    self.team = "allies";
    self.type = "human";
    self.subclass = "regular";
    self.accuracy = 0.2;
    self.health = 150;
    self.grenadeweapon = "fraggrenade";
    self.grenadeammo = 0;
    self.secondaryweapon = "ak47";
    self.sidearm = "beretta";

    if ( isai( self ) )
    {
        self setengagementmindist( 768.0, 512.0 );
        self setengagementmaxdist( 1024.0, 1500.0 );
    }

    self.weapon = "rpg";

	character\gfl\randomizer_loyalist::main();
}

spawner()
{
    self setspawnerteam( "allies" );
}

precache()
{
    character\gfl\randomizer_loyalist::precache();
    precacheitem( "rpg" );
    precacheitem( "ak47" );
    precacheitem( "beretta" );
    precacheitem( "fraggrenade" );
}
