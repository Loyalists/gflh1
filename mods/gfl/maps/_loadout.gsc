// H1 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

init_loadout()
{
    give_loadout();
    maps\_loadout_code::loadout_complete();
}

give_loadout()
{
    if ( isdefined( level.dodgeloadout ) )
        return;

    if ( !isdefined( level.campaign ) )
        level.campaign = "american";

    var_0 = maps\_loadout_code::get_loadout();
    level.player maps\_loadout_code::setdefaultactionslot();
    level.has_loadout = 0;
    maps\_loadout_code::persist( "sniperescape", "scoutsniper" );
    maps\_loadout_code::persist( "launchfacility_a", "icbm" );
    maps\_loadout_code::persist( "launchfacility_b", "launchfacility_a" );
    maps\_loadout_code::loadout( "killhouse", undefined, undefined, "fraggrenade", "flash_grenade", "h2_gfl_m4_sopmod_ii_viewhands", "british" );
    maps\_loadout_code::loadout( "cargoship", "mp5_silencer", "usp_silencer", "fraggrenade", "flash_grenade", "h2_gfl_m4_sopmod_ii_viewhands", "british" );
    maps\_loadout_code::loadout( "coup", undefined, undefined, undefined, undefined, undefined, "american" );
    maps\_loadout_code::loadout( "blackout", "m4m203_silencer_reflex", "m14_scoped_silencer_woodland", "fraggrenade", "flash_grenade", "h2_gfl_m4_sopmod_ii_viewhands", "american" );
    maps\_loadout_code::loadout( "armada", "m4_grunt", "beretta", "fraggrenade", "flash_grenade", "h1_gfl_ump40_viewhands", "american" );
    maps\_loadout_code::loadout( "bog_a", "m4_grenadier", "beretta", "fraggrenade", "flash_grenade", "h1_gfl_ump40_viewhands", "american" );
    maps\_loadout_code::loadout( "hunted", undefined, "colt45", "fraggrenade", "flash_grenade", "h2_gfl_m4_sopmod_ii_viewhands", "british" );
    maps\_loadout_code::loadout( "ac130", undefined, undefined, undefined, undefined, "h2_gfl_m4_sopmod_ii_viewhands", "american" );
    maps\_loadout_code::loadout( "bog_b", "m4_grenadier", "beretta", "fraggrenade", "flash_grenade", "h1_gfl_ump40_viewhands", "american" );
    maps\_loadout_code::loadout( "airlift", "m4_grenadier", "colt45", "fraggrenade", "flash_grenade", "h1_gfl_ump40_viewhands", "american" );
    maps\_loadout_code::loadout( "aftermath", undefined, undefined, undefined, undefined, "h1_gfl_ump40_viewhands", "american" );
    maps\_loadout_code::loadout( "village_assault", "m4m203_silencer_reflex", "m1014", "fraggrenade", "flash_grenade", "h2_gfl_m4_sopmod_ii_viewhands", "british" );
    maps\_loadout_code::loadout( "scoutsniper", "m14_scoped_silencer", "usp_silencer", "fraggrenade", undefined, "h2_gfl_m4a1_viewhands", "british" );
    maps\_loadout_code::loadout( "sniperescape", "m14_scoped_woodland", "usp_silencer", "fraggrenade", "flash_grenade", "h2_gfl_m4a1_viewhands", "british" );
    maps\_loadout_code::loadout( "village_defend", "saw", "m14_scoped_woodland", "fraggrenade", "smoke_grenade_american", "h2_gfl_m4_sopmod_ii_viewhands", "british" );
    maps\_loadout_code::loadout( "ambush", "remington700", "colt45", "fraggrenade", "flash_grenade", "h2_gfl_m4_sopmod_ii_viewhands", "british" );
    maps\_loadout_code::loadout( "icbm", "m4m203_silencer_reflex", "usp_silencer", "fraggrenade", "flash_grenade", "h2_gfl_m4_sopmod_ii_viewhands", "british" );
    maps\_loadout_code::loadout( "launchfacility_a", "m4m203_silencer_reflex", "usp_silencer", "fraggrenade", "smoke_grenade_american", "h2_gfl_m4_sopmod_ii_viewhands", "british" );
    maps\_loadout_code::loadout( "launchfacility_b", "m4m203_silencer_reflex", "usp_silencer", "fraggrenade", "flash_grenade", "h2_gfl_m4_sopmod_ii_viewhands", "british" );
    maps\_loadout_code::loadout( "jeepride", "m4_grunt", "colt45", "fraggrenade", undefined, "h2_gfl_m4_sopmod_ii_viewhands", "british" );
    maps\_loadout_code::loadout( "airplane", "mp5_silencer", "usp_silencer", undefined, "flash_grenade", "h2_gfl_m4_sopmod_ii_viewhands", "british" );
    maps\_loadout_code::loadout( "simplecredits", undefined, undefined, undefined, undefined, undefined, undefined );
    maps\_loadout_code::loadoutequipment( "blackout", "c4", "claymore" );
    maps\_loadout_code::loadoutequipment( "armada", undefined, "claymore" );
    maps\_loadout_code::loadoutequipment( "village_assault", "c4", "cobra_air_support" );
    maps\_loadout_code::loadoutequipment( "sniperescape", "c4", "claymore" );
    maps\_loadout_code::loadoutequipment( "village_defend", undefined, "claymore" );
    maps\_loadout_code::loadoutequipment( "icbm", "c4", "claymore" );
    maps\_loadout_code::loadoutequipment( "launchfacility_a", "c4", "claymore" );
    maps\_loadout_code::loadoutequipment( "launchfacility_b", "c4", "claymore" );
    maps\_loadout_code::loadoutcustomization();
    maps\_loadout_code::default_loadout_if_notset();
}
