// H1 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

main()
{
    maps\_load::set_player_viewhand_model( "h2_gfl_m4_sopmod_ii_worldhands" );
    setup_exploder_anims();
    exploder_script_model_anims();
    animated_model_setup();
    dialogue();
    run_anims();
}

#using_animtree("generic_human");

dialogue()
{
    level.scr_sound["price"]["spreadout"] = "villagedef_pri_counterattackimminent";
    level.scr_radio["belltowerhere"] = "villagedef_sas1_belltowerhere";
    level.scr_radio["justsaywhen"] = "villagedef_sas2_justsaywhen";
    level.scr_radio["doit"] = "villagedef_pri_doit";
    level.scr_radio["kaboom"] = "villagedef_sas2_kaboom";
    level.scr_sound["price"]["openfire"] = "villagedef_pri_openfire";
    level.scr_radio["targetdown"] = "villagedef_sas3_targetdown";
    level.scr_radio["gothim"] = "villagedef_sas3_gothim";
    level.scr_radio["targeteliminated"] = "villagedef_sas3_targeteliminated";
    level.scr_radio["goodbye"] = "villagedef_sas3_goodbye";
    level.scr_radio["recreationalvehicle"] = "villagedef_sas2_rv";
    level.scr_radio["takeitout"] = "villagedef_pri_takeitout";
    level.scr_radio["firingjavelin"] = "villagedef_sas2_firingjavelin";
    level.scr_radio["niceshotmate"] = "villagedef_sas3_niceshot";
    level.scr_radio["blastnolock"] = "villagedef_sas2_cantgetlock";
    level.scr_radio["largerforce"] = "villagedef_pri_holdground";
    level.scr_radio["copy"] = "villagedef_sas3_copy";
    level.scr_radio["smokescreensmac"] = "villagedef_sas2_smokescreens";
    level.scr_radio["notmuchmovement"] = "villagedef_sas4_toourwest";
    level.scr_radio["targetingour"] = "villagedef_gaz_fallback";
    level.scr_radio["minigunflank"] = "villagedef_pri_coverwestflank";
    level.scr_radio["miniguncrashed"] = "villagedef_pri_gettominigun";
    level.scr_radio["minigunarse"] = "villagedef_pri_arsemoving";
    level.scr_radio["twofallingback"] = "villagedef_sas2_fallingback";
    level.scr_radio["threeonthemove"] = "villagedef_sas3_onmove";
    level.scr_radio["easternroadlocked"] = "villagedef_sas3_roadlocked";
    level.scr_radio["spooledup"] = "villagedef_pri_fireinbursts";
    level.scr_sound["gaz"]["gazuseminigun"] = "villagedef_gaz_usethminigun";
    level.scr_radio["priceminiguninheli"] = "villagedef_pri_insidecrashed";
    level.scr_radio["priceminiguninhelimove"] = "villagedef_pri_getonminigunheli";
    level.scr_radio["gazminigunonline"] = "villagedef_gaz_minigunsonline";
    level.scr_radio["heretheycome"] = "villagedef_pri_heretheycome";
    level.scr_radio["headsup"] = "villagedef_sas2_headsup";
    level.scr_radio["lotofhelis"] = "villagedef_sas3_lotofhelis";
    level.scr_radio["tavern"] = "villagedef_pri_backtotavern";
    level.scr_radio["nextdefensiveline"] = "villagedef_pri_defensiveline";
    level.scr_radio["detfallbackremind3"] = "villagedef_pri_getoverrun";
    level.scr_radio["detuseremind1"] = "villagedef_gaz_fourintavern";
    level.scr_radio["detuseremind2"] = "villagedef_gaz_checkcompass";
    level.scr_radio["detfallbackremind1"] = "villagedef_gaz_nextphaseline";
    level.scr_radio["detfallbackremind2"] = "villagedef_gaz_fallbacknow";
    level.scr_radio["detminigunfallbackremind1"] = "villagedef_gaz_getoffminigun";
    level.scr_radio["detminigunfallbackremind2"] = "villagedef_gaz_forgetminigun";
    level.scr_radio["fallbacktofarm1"] = "villagedef_pri_topofthehill";
    level.scr_radio["fallbacktofarm2"] = "villagedef_pri_wannabeleft";
    level.scr_radio["tavernoverrunsoon"] = "villagedef_gaz_overrunyourpos";
    level.scr_sound["gaz"]["fallbacktofarm3"] = "villagedef_gaz_headfforfarm";
    level.scr_sound["gaz"]["fallbackgeneric"] = "villagedef_gaz_fallbackfallback";
    level.scr_radio["enemytanksnorth"] = "villagedef_sas4_imhit";
    level.scr_radio["gettothebarn"] = "villagedef_pri_stoptanks";
    level.scr_sound["price"]["javelinorder1"] = "villagedef_pri_getjavelinbarn";
    level.scr_radio["javelinorder2"] = "villagedef_gaz_javelinsinbarn";
    level.scr_sound["gaz"]["javelinorder3"] = "villagedef_gaz_javelinhurry";
    level.scr_radio["casready"] = "villagedef_fpp_standingby";
    level.scr_radio["airstrikewarning"] = "villagedef_fpp_airstrike";
    level.scr_radio["airstrikewarning"] = "villagedef_fpp_airstrike";
    level.scr_radio["airstrikewarning"] = "villagedef_fpp_airstrike";
    level.scr_radio["etafourminutes"] = "villagedef_hp2_beready";
    level.scr_radio["pickingupSAMs"] = "villagedef_hp2_samsites";
    level.scr_sound["gaz"]["thatsjustgreat"] = "villagedef_gaz_justgreat";
    level.scr_radio["lzbottomhill"] = "villagedef_hp2_enemyradar";
    level.scr_radio["cantlandhigh"] = "villagedef_pri_cantlandhigh";
    level.scr_radio["takingthepiss"] = "villagedef_gaz_takinthepiss";
    level.scr_radio["thenewlz"] = "villagedef_pri_forgetitgaz";
    level.scr_radio["lzfoxtrot"] = "villagedef_hp2_acrossriver";
    level.scr_radio["headlandingzone"] = "villagedef_pri_lastchance";
    level.scr_radio["bottomofthehill"] = "villagedef_pri_gettobottom";
    level.scr_radio["gettolandingzone"] = "villagedef_gaz_gonnagetleft";
    level.scr_radio["breakthroughtolz"] = "villagedef_pri_breakthru";
    level.scr_radio["getdownthehill"] = "villagedef_gaz_getdownthehill";
    level.scr_radio["gettothelzgogo"] = "villagedef_gaz_gettolzgo";
    level.scr_radio["almosttherethree"] = "villagedef_hp2_3minutes";
    level.scr_radio["twominutesleft"] = "villagedef_hp2_2minutes";
    level.scr_radio["copywereonourway"] = "villagedef_pri_copythat";
    level.scr_radio["ninetysecondsleft"] = "villagedef_hp2_ninetysecs";
    level.scr_radio["oneminutebingo"] = "villagedef_hp2_1mintobingo";
    level.scr_radio["thirtyseconds"] = "villagedef_hp2_30seconds";
    level.scr_radio["outtahere"] = "villagedef_hp2_outtahere";
    level.scr_radio["cominhome"] = "villagedef_hp2_cominhome";
    level.scr_sound["griggs"]["needaride"] = "villagedef_grg_needaride";
    level.scr_sound["griggs"]["getonboard"] = "villagedef_grg_getonboard";
    level.scr_sound["griggs"]["griggsletsgo"] = "villagedef_grg_letsgo";
    level.scr_sound["griggs"]["wereallaboard"] = "villagedef_grg_wereallaboard";
    level.scr_anim["generic"]["ch46_unload_1"] = %ch46_unload_1;
    level.scr_anim["generic"]["ch46_unload_2"] = %ch46_heat_unload_2;
    level.scr_anim["generic"]["ch46_unload_3"] = %ch46_heat_unload_3;
    level.scr_anim["generic"]["ch46_unload_4"] = %ch46_unload_4;
    level.scr_anim["generic"]["ch46_load_1"] = %ch46_load_1;
    level.scr_anim["generic"]["ch46_load_2"] = %ch46_heat_load_2;
    level.scr_anim["generic"]["ch46_load_3"] = %ch46_heat_load_3;
    level.scr_anim["generic"]["ch46_load_4"] = %ch46_load_4;
    script_models();
    script_models_minigun_player();
    player_boarding();
    seaknight_anims();
}

run_anims()
{
    level.scr_anim["axis"]["patrolwalk_1"] = %patrol_bored_patrolwalk;
    level.scr_anim["axis"]["patrolwalk_2"] = %patrol_bored_patrolwalk;
    level.scr_anim["axis"]["patrolwalk_3"] = %patrol_bored_patrolwalk;
    level.scr_anim["axis"]["patrolwalk_4"] = %patrol_bored_patrolwalk;
    level.scr_anim["axis"]["patrolwalk_5"] = %patrol_bored_patrolwalk;
    level.scr_anim["axis"]["patrolwalk_pause"] = %patrol_bored_react_walkstop;
}

player_boarding()
{
    level.scr_anim["player_carry"]["village_player_getin"] = %village_player_getin;
    level.scr_animtree["player_carry"] = #animtree;
    level.scr_model["player_carry"] = "h2_gfl_m4_sopmod_ii_worldhands";
}

#using_animtree("script_model");

script_models()
{
    level.scr_anim["minigun"]["spin_idle"][0] = %minigun_spin_idle;
    level.scr_anim["minigun"]["spin_loop"][0] = %minigun_spin_loop;
    level.scr_anim["minigun"]["spin"] = %minigun_spin_loop;
    level.scr_anim["minigun"]["spin_start"] = %minigun_spin_start;
    level.scr_anim["minigun"]["use"] = %h1_minigun_in;
    level.scr_anim["minigun"]["drop"] = %h1_minigun_out;
    maps\_anim::addnotetrack_animsound( "minigun", "use", "start", "h1_minigun_use_foley" );
    maps\_anim::addnotetrack_animsound( "minigun", "drop", "start", "h1_minigun_drop_foley" );
    level.scr_animtree["minigun"] = #animtree;
    level.scr_model["minigun"] = "weapon_minigun";
}

#using_animtree("generic_human");

script_models_minigun_player()
{
    level.scr_anim["minigun_player"]["use_minigun"] = %h1_minigun_in_player;
    level.scr_animtree["minigun_player"] = #animtree;
    level.scr_model["minigun_player"] = "h2_gfl_m4_sopmod_ii_worldhands";
    level.scr_anim["detonator_guy"]["press_detonator"] = %h1_village_defend_sas_press_detonator;
    maps\_anim::addnotetrack_customfunction( "detonator_guy", "radio_dialog", maps\village_defend::say_kaboom, "press_detonator" );
    maps\_anim::addnotetrack_customfunction( "detonator_guy", "kaboom", maps\village_defend::do_kaboom, "press_detonator" );
    maps\_anim::addnotetrack_customfunction( "detonator_guy", "spawn_detonator", maps\village_defend::toggle_detonator, "press_detonator", 1 );
    maps\_anim::addnotetrack_customfunction( "detonator_guy", "despawn_detonator", maps\village_defend::toggle_detonator, "press_detonator", 0 );
}

#using_animtree("vehicles");

seaknight_anims()
{
    level.scr_anim["generic"]["ch46_doors_open"] = %ch46_doors_open;
}

setup_exploder_anims()
{
    level.exploder_animtrees = [];
    level.exploder_animtrees[0] = "exploder_script_model";
}

#using_animtree("script_model");

exploder_script_model_anims()
{
    level.scr_animtree["exploder_script_model"] = #animtree;
    level.scr_anim["exploder_script_model"]["village_defend_church_prt1_anim"] = %village_defend_church_prt1_anim;
    level.scr_anim["exploder_script_model"]["village_defend_church_prt2_anim"] = %village_defend_church_prt2_anim;
}

#using_animtree("animated_props");

animated_model_setup()
{
    level.anim_prop_models["foliage_birch_tree_b_green_hero"]["still"] = %foliage_birch_tree_hero_still;
    level.anim_prop_models["foliage_birch_tree_b_green_hero"]["strong"] = %foliage_birch_tree_hero_sway;
    level.anim_prop_models["foliage_birch_tree_b_green_hero"]["heli"] = %foliage_birch_tree_hero_heliwash;
    level.anim_prop_models["h1_tree_pine_evergreen_03_hero"]["still"] = %h1_tree_pine_evergreen_03_hero_still;
    level.anim_prop_models["h1_tree_pine_evergreen_03_hero"]["strong"] = %h1_tree_pine_evergreen_03_hero_sway;
    level.anim_prop_models["h1_tree_pine_evergreen_03_hero"]["heli"] = %h1_tree_pine_evergreen_03_hero_heliwash;
}
