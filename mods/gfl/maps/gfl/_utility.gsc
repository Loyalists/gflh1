precache_all_weapons()
{
    precacheitem( "junlmg" );
    precacheitem( "febsnp" );
    precacheitem( "xmlar" );
    precacheitem( "kam12" );
}

precache_all_viewmodels()
{
    precachemodel( "h2_gfl_m4_sopmod_ii_viewbody" );
    precachemodel( "h2_gfl_m4_sopmod_ii_viewbody_uaz" );
    precachemodel( "h2_gfl_m4_sopmod_ii_viewhands" );
    // precachemodel( "h2_gfl_m4_sopmod_ii_viewhands_player" );
    precachemodel( "h2_gfl_m4_sopmod_ii_worldhands" );

    precachemodel( "h2_gfl_m4a1_viewbody" );
    precachemodel( "h2_gfl_m4a1_worldbody" );
    precachemodel( "h2_gfl_m4a1_viewhands" );
    // precachemodel( "h2_gfl_m4a1_viewhands_player" );
    precachemodel( "h2_gfl_m4a1_worldhands" );

    precachemodel( "h1_gfl_ump40_viewbody" );
    precachemodel( "h1_gfl_ump40_worldbody" );
    precachemodel( "h1_gfl_ump40_viewhands" );
    // precachemodel( "h2_gfl_ump40_viewhands_player" );
    precachemodel( "h1_gfl_ump40_worldhands" );

    precachemodel( "h2_gfl_commander_viewbody" );
    precachemodel( "h2_gfl_commander_worldbody" );
    precachemodel( "h2_gfl_commander_viewhands" );
    // precachemodel( "h2_gfl_m4a1_viewhands_player" );
    precachemodel( "h2_gfl_commander_worldhands" );
}

precache_all_characters()
{
	// main characters
    // character\gfl\character_gfl_hk416::precache();
	// character\gfl\character_gfl_g11::precache();
    character\gfl\character_gfl_m4a1::precache();
	character\gfl\character_gfl_m4_sopmod_ii::precache();
	// character\gfl\character_gfl_ro635::precache();
    // character\gfl\character_gfl_rpk16::precache();
	character\gfl\character_gfl_suomi::precache();
	character\gfl\character_gfl_dima::precache();
    character\gfl\character_gfl_ak12::precache();
    character\gfl\character_gfl_m16a1_prime::precache();
    character\gfl\character_gfl_negev::precache();
	character\gfl\character_gfl_ppsh41::precache();
	character\gfl\character_gfl_commander::precache();
	character\gfl\character_gfl_sp9_v2::precache();

	// randomized dolls dying from time to time
	character\gfl\character_gfl_p90::precache();
	character\gfl\character_gfl_9a91::precache();
	character\gfl\character_gfl_rfb::precache();
	character\gfl\character_gfl_type97::precache();
	character\gfl\character_gfl_saiga12::precache();
	character\gfl\character_gfl_fnc::precache();
	character\gfl\character_gfl_sten::precache();
	character\gfl\character_gfl_ak74m::precache();
	// character\gfl\character_gfl_sp9::precache();
	character\gfl\character_gfl_tac50::precache();
	character\gfl\character_gfl_super_sass::precache();
	character\gfl\character_gfl_super_sass_nocoat::precache();
	character\gfl\character_gfl_mp7_tights::precache();
	character\gfl\character_gfl_mp7_casual_tights::precache();
	character\gfl\character_gfl_g36c::precache();

	// sf
	character\gfl\character_gfl_dreamer::precache();
	character\gfl\character_gfl_destroyer::precache();
	character\gfl\character_gfl_ouroboros::precache();
	character\gfl\character_gfl_vespid::precache();
	character\gfl\character_gfl_jaeger::precache();
	character\gfl\character_gfl_jaeger_goggle_up::precache();
	character\gfl\character_gfl_ripper::precache();
	character\gfl\character_gfl_guard::precache();
	character\gfl\character_gfl_guard_visor_up::precache();

	// nofacial
	character\gfl\character_gfl_suomi_nofacial::precache();
	character\gfl\character_gfl_commander_nofacial::precache();
}