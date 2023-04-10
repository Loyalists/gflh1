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
    self.secondaryweapon = "ak47_muzzle_nodynlight";
    self.sidearm = "beretta_muzzle_nodynlight";

    if ( isai( self ) )
    {
        self setengagementmindist( 768.0, 512.0 );
        self setengagementmaxdist( 1024.0, 1500.0 );
    }

    self.weapon = "rpg_jeepride";

	character\gfl\randomizer_merc_sniper::main();
}

spawner()
{
    self setspawnerteam( "axis" );
}

precache()
{
    character\gfl\randomizer_merc_sniper::precache();
    character\character_sp_spetsnaz_boris::precache();
    character\character_sp_spetsnaz_demetry::precache();
    character\character_sp_spetsnaz_vlad::precache();
    character\character_sp_spetsnaz_yuri::precache();
    character\character_sp_spetsnaz_collins::precache();
    character\character_sp_spetsnaz_geoff::precache();
    character\character_sp_spetsnaz_derik::precache();
    precacheitem( "rpg_jeepride" );
    precacheitem( "ak47_muzzle_nodynlight" );
    precacheitem( "beretta_muzzle_nodynlight" );
    precacheitem( "fraggrenade" );
}
