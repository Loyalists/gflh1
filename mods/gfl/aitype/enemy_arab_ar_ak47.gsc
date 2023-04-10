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
    self.sidearm = "beretta";

    if ( isai( self ) )
    {
        self setengagementmindist( 128.0, 0.0 );
        self setengagementmaxdist( 512.0, 1024.0 );
    }

    self.weapon = "ak47";

	character\gfl\randomizer_arab_ar::main();
}

spawner()
{
    self setspawnerteam( "axis" );
}

precache()
{
    character\gfl\randomizer_arab_ar::precache();
    character\character_sp_arab_regular_asad::precache();
    character\character_sp_arab_regular_sadiq::precache();
    character\character_sp_arab_regular_ski_mask::precache();
    character\character_sp_arab_regular_ski_mask2::precache();
    character\character_sp_arab_regular_suren::precache();
    character\character_sp_arab_regular_yasir::precache();
    precacheitem( "ak47" );
    precacheitem( "beretta" );
    precacheitem( "beretta" );
    precacheitem( "fraggrenade" );
}
