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
    self.secondaryweapon = "beretta_muzzle_nodynlight";
    self.sidearm = "beretta_muzzle_nodynlight";

    if ( isai( self ) )
    {
        self setengagementmindist( 128.0, 0.0 );
        self setengagementmaxdist( 512.0, 1024.0 );
    }

    self.weapon = "ak47_muzzle_nodynlight";

	character\gfl\randomizer_merc_ar::main();
}

spawner()
{
    self setspawnerteam( "axis" );
}

precache()
{
    character\gfl\randomizer_merc_ar::precache();
    precacheitem( "ak47_muzzle_nodynlight" );
    precacheitem( "beretta_muzzle_nodynlight" );
    precacheitem( "beretta_muzzle_nodynlight" );
    precacheitem( "fraggrenade" );
}
