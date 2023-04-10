// H1 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

main()
{
    self.animtree = "";
    self.additionalassets = "";
    self.team = "axis";
    self.type = "human";
    self.subclass = "regular";
    self.accuracy = 0.2;
    self.health = 150;
    self.grenadeweapon = "fraggrenade";
    self.grenadeammo = 0;
    self.secondaryweapon = "beretta";
    self.sidearm = "colt45";

    if ( isai( self ) )
    {
        self setengagementmindist( 1250.0, 1024.0 );
        self setengagementmaxdist( 1600.0, 2400.0 );
    }

    self.weapon = "beretta";

	character\gfl\randomizer_sf::main();
}

spawner()
{
    self setspawnerteam( "axis" );
}

precache()
{
    character\gfl\randomizer_sf::precache();
    precacheitem( "beretta" );
    precacheitem( "beretta" );
    precacheitem( "colt45" );
    precacheitem( "fraggrenade" );
}
