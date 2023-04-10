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
    self.secondaryweapon = "colt45";
    self.sidearm = "colt45";

    if ( isai( self ) )
    {
        self setengagementmindist( 256.0, 0.0 );
        self setengagementmaxdist( 768.0, 1024.0 );
    }

    self.weapon = "m4_grunt";

	character\gfl\randomizer_usmc::main();
}

spawner()
{
    self setspawnerteam( "allies" );
}

precache()
{
    character\gfl\randomizer_usmc::precache();
    character\character_sp_usmc_james::precache();
    character\character_sp_usmc_sami::precache();
    character\character_sp_usmc_at4::precache();
    character\character_sp_usmc_ryan::precache();
    character\character_sp_usmc_sami_goggles::precache();
    character\character_sp_usmc_zach::precache();
    character\character_sp_usmc_zach_goggles::precache();
    precacheitem( "m4_grunt" );
    precacheitem( "colt45" );
    precacheitem( "colt45" );
    precacheitem( "fraggrenade" );
}
