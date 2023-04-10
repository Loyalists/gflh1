// H1 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

main()
{
    anims();
    run_anims();
    dialogue();
    player_anims();
    anim_blackhawk();
    scriptmodel_anims();
    animated_model_setup();
    bm21_custom();
}

#using_animtree("generic_human");

anims()
{
    level.scr_anim["price"]["hunted_opening_price"] = %hunted_opening_price;
    maps\_anim::addnotetrack_dialogue( "price", "dialog", "hunted_opening_price", "hunted_pri_onepiece" );
    maps\_anim::addnotetrack_dialogue( "price", "dialog", "hunted_opening_price", "hunted_pri_getup" );
    maps\_anim::addnotetrack_dialogue( "price", "dialog", "hunted_opening_price", "hunted_pri_comeonsearchparties" );
    maps\_anim::addnotetrack_dialogue( "price", "dialog", "hunted_opening_price", "hunted_pri_casualtyreport" );
    maps\_anim::addnotetrack_dialogue( "price", "dialog", "hunted_opening_price", "hunted_pri_bugger" );
    maps\_anim::addnotetrack_dialogue( "price", "dialog", "hunted_opening_price", "hunted_pri_extractionpoint" );
    level.scr_anim["steve"]["hunted_opening_nikolai"] = %hunted_opening_nikolai;
    level.scr_anim["dead_guy"]["hunted_dying"] = %hunted_dying_deadguy;
    level.scr_anim["dead_guy"]["hunted_dying_endidle"][0] = %hunted_dying_deadguy_endidle;
    level.scr_anim["steve"]["hunted_dying"] = %hunted_dying_soldier;
    level.scr_anim["mark"]["mark_hunted_dying"] = %hunted_dying_gaz;
    maps\_anim::addnotetrack_dialogue( "mark", "dialog", "mark_hunted_dying", "hunted_uk2_bothpilotsdead" );
    level.scr_anim["price"]["hunted_wave_chat"] = %hunted_wave_chat;
    level.scr_sound["price"]["hunted_wave_chat_snd"] = "hunted_pri_underbridge";
    level.scr_anim["charlie"]["hunted_wave_chat"] = %hunted_spotter_wave_chat;
    level.scr_sound["charlie"]["hunted_wave_chat_snd"] = "hunted_sas2_vehiclesnorth";
    level.scr_anim["charlie"]["hunted_spotter_idle"][0] = %hunted_spotter_idle;
    level.scr_anim["charlie"]["hunted_spotter_idle"][1] = %hunted_spotter_twitch;
    level.scr_anim["mark"]["hunted_tunnel_guy1_runin"] = %hunted_tunnel_guy1_runin;
    level.scr_anim["mark"]["hunted_tunnel_guy1_idle"][0] = %hunted_tunnel_guy1_idle;
    level.scr_anim["mark"]["hunted_tunnel_guy1_lookup"] = %hunted_tunnel_guy1_lookup;
    level.scr_anim["mark"]["hunted_tunnel_guy1_runout"] = %hunted_tunnel_guy1_runout;
    level.scr_anim["price"]["hunted_tunnel_guy2_runin"] = %hunted_tunnel_guy2_runin;
    level.scr_anim["price"]["hunted_tunnel_guy2_idle"][0] = %hunted_tunnel_guy2_idle;
    level.scr_anim["price"]["hunted_tunnel_guy2_runout"] = %hunted_tunnel_guy2_runout;
    level.scr_sound["price"]["hunted_tunnel_guy2_runout"] = "hunted_pri_letsmove";
    level.scr_anim["price"]["hunted_tunnel_guy2_runout_interrupt"] = %hunted_tunnel_guy2_runout;

    if ( getdvarint( "use_old_door_openings" ) == 1 )
    {
        level.scr_anim["price"]["hunted_open_barndoor"] = %hunted_open_barndoor;
        level.scr_anim["price"]["hunted_open_barndoor_nodialogue"] = %hunted_open_barndoor;
    }
    else
    {
        level.scr_anim["price"]["hunted_open_barndoor"] = %h1_hunted_open_barndoor_01;
        level.scr_anim["price"]["hunted_open_barndoor_nodialogue"] = %h1_hunted_open_barndoor_01;
    }

    level.scr_sound["price"]["hunted_open_barndoor"] = "hunted_pri_holdup";

    if ( getdvarint( "use_old_door_openings" ) == 1 )
    {
        level.scr_anim["price"]["hunted_open_barndoor_stop"] = %hunted_open_barndoor_stop;
        level.scr_anim["price"]["hunted_open_barndoor_idle"][0] = %hunted_open_barndoor_idle;
    }
    else
    {
        level.scr_anim["price"]["hunted_open_barndoor_stop"] = %h1_hunted_open_barndoor_stop;
        level.scr_anim["price"]["hunted_open_barndoor_idle"][0] = %h1_hunted_open_barndoor_idle;
    }

    level.scr_anim["mark"]["door_kick_in"] = %doorkick_2_cqbwalk;
    level.scr_anim["leader"]["hunted_farmsequence"] = %hunted_farmsequence_leader;
    level.scr_anim["farmer"]["hunted_farmsequence"] = %hunted_farmsequence_farmer;
    level.scr_anim["thug"]["hunted_farmsequence"] = %hunted_farmsequence_brute1;
    level.scr_anim["thug2"]["hunted_farmsequence"] = %hunted_farmsequence_brute2;
    level.scr_anim["farmer"]["farmer_deathpose"][0] = %hunted_farmsequence_farmer_deathpose;
    level.scr_anim["farmer"]["farmer_altending"] = %hunted_farmsequence_farmer_altending;
    level.scr_anim["farmer"]["hack_idle"][0] = %hunted_pronehide_idle_v3;
    maps\_anim::addnotetrack_dialogue( "leader", "dialog", "hunted_farmsequence", "hunted_ru1_dontplaystupid" );
    maps\_anim::addnotetrack_dialogue( "leader", "dialog", "hunted_farmsequence", "hunted_ru1_hidingsoldiers" );
    maps\_anim::addnotetrack_dialogue( "leader", "dialog", "hunted_farmsequence", "hunted_ru1_forgetit" );
    maps\_anim::addnotetrack_dialogue( "farmer", "dialog", "hunted_farmsequence", "hunted_ruf_whatsgoingon" );
    maps\_anim::addnotetrack_dialogue( "farmer", "dialog", "hunted_farmsequence", "hunted_ruf_hidingwho" );
    maps\_anim::addnotetrack_dialogue( "farmer", "dialog", "hunted_farmsequence", "hunted_ruf_british" );
    level.scr_anim["price"]["hunted_dive_2_pronehide"] = %hunted_dive_2_pronehide_v1;
    level.scr_anim["price"]["hunted_pronehide_idle"][0] = %hunted_pronehide_idle_v1;
    level.scr_anim["price"]["hunted_pronehide_2_stand"] = %hunted_pronehide_2_stand_v1;
    level.scr_anim["mark"]["hunted_dive_2_pronehide"] = %hunted_dive_2_pronehide_v1;
    level.scr_anim["mark"]["hunted_pronehide_idle"][0] = %hunted_pronehide_idle_v1;
    level.scr_anim["mark"]["hunted_pronehide_2_stand"] = %hunted_pronehide_2_stand_v1;
    level.scr_anim["steve"]["hunted_dive_2_pronehide"] = %hunted_dive_2_pronehide_v2;
    level.scr_anim["steve"]["hunted_pronehide_idle"][0] = %hunted_pronehide_idle_v2;
    level.scr_anim["steve"]["hunted_pronehide_2_stand"] = %hunted_pronehide_2_stand_v2;
    level.scr_anim["charlie"]["hunted_dive_2_pronehide"] = %hunted_dive_2_pronehide_v3;
    level.scr_anim["charlie"]["hunted_pronehide_idle"][0] = %hunted_pronehide_idle_v3;
    level.scr_anim["charlie"]["hunted_pronehide_2_stand"] = %hunted_pronehide_2_stand_v3;
    level.scr_anim["mark"]["hunted_open_basement_door_kick"] = %hunted_open_basement_door_kick;
    level.scr_goaltime["mark"]["hunted_open_basement_door_kick"] = 0.4;
    level.scr_anim["price"]["hunted_basement_door_block"] = %hunted_basement_door_block;
    level.scr_anim["price"]["hunted_open_creek_gate_stop"] = %hunted_open_barndoor_stop;

    if ( getdvarint( "use_old_door_openings" ) == 1 )
        level.scr_anim["price"]["hunted_open_creek_gate"] = %hunted_open_barndoor;
    else
        level.scr_anim["price"]["hunted_open_creek_gate"] = %h1_hunted_open_grilldoor;

    level.scr_anim["guard1"]["roadblock_sequence"] = %hunted_roadblock_guy1_sequence;
    level.scr_anim["guard1"]["roadblock_startidle"][0] = %hunted_roadblock_guy1_startidle;
    level.scr_anim["guard2"]["roadblock_sequence"] = %hunted_roadblock_guy2_sequence;
    level.scr_anim["guard2"]["roadblock_startidle"][0] = %hunted_roadblock_guy2_startidle;
    level.scr_anim["price"]["hunted_open_big_barn_gate_stop"] = %hunted_open_barndoor_stop;

    if ( getdvarint( "use_old_door_openings" ) == 1 )
        level.scr_anim["price"]["hunted_open_big_barn_gate"] = %hunted_open_barndoor;
    else
        level.scr_anim["price"]["hunted_open_big_barn_gate"] = %h1_hunted_open_barndoor_02;

    level.scr_anim["mark"]["hunted_celebrate"] = %hunted_celebrate;
    level.scr_sound["mark"]["hunted_celebrate"] = "hunted_uk2_outrageous";
    level.scr_anim["steve"]["hunted_celebrate"] = %hunted_celebrate_v2;
    level.scr_anim["charlie"]["hunted_celebrate"] = %hunted_celebrate_v3;
    level.scr_anim["dead_guy"]["death1"] = %exposed_death_nerve;
    level.scr_anim["dead_guy"]["death2"] = %exposed_death_falltoknees;
    level.scr_anim["dead_guy"]["death3"] = %exposed_death_headshot;
    level.scr_anim["dead_guy"]["death4"] = %exposed_crouch_death_twist;
    level.scr_anim["dead_guy"]["death5"] = %exposed_crouch_death_fetal;
    level.scr_animtree["dead_guy"] = #animtree;
    level.scr_anim["farmer"]["farmer_surprised"] = %h1_hunted_farmer_surprised;
    level.scr_anim["farmer"]["runaway"] = %h1_hunted_farmer_runaway;
    level.scr_anim["price"]["talk_to_control"] = %h1_hunted_price_talks_to_control;
    maps\_anim::addnotetrack_dialogue( "price", "dialog", "talk_to_control", "hunted_pri_100metres" );
}

run_anims()
{
    level.scr_anim["price"]["path_slow"] = %huntedrun_1_idle;
    level.scr_anim["price"]["path_slow_left"] = %huntedrun_1_look_left;
    level.scr_anim["price"]["path_slow_right"] = %huntedrun_1_look_right;
    level.scr_anim["price"]["sprint"] = %sprint1_loop;
    level.scr_anim["mark"]["path_slow"] = %huntedrun_1_idle;
    level.scr_anim["mark"]["sprint"] = %sprint1_loop;
    level.scr_anim["steve"]["path_slow"] = %huntedrun_2;
    level.scr_anim["steve"]["sprint"] = %sprint1_loop;
    level.scr_anim["charlie"]["path_slow"] = %huntedrun_1_idle;
    level.scr_anim["charlie"]["sprint"] = %sprint1_loop;
    level.scr_anim["thug"]["walk_slow"] = %huntedrun_2;
    level.scr_anim["farmer"]["walk"] = %huntedrun_1_idle;
    level.scr_anim["guard1"]["patrolwalk"] = %active_patrolwalk_v1;
    level.scr_anim["guard2"]["patrolwalk"] = %active_patrolwalk_v2;
    level.scr_anim["axis"]["patrolwalk_1"] = %active_patrolwalk_v1;
    level.scr_anim["axis"]["patrolwalk_2"] = %active_patrolwalk_v2;
    level.scr_anim["axis"]["patrolwalk_3"] = %active_patrolwalk_v3;
    level.scr_anim["axis"]["patrolwalk_4"] = %active_patrolwalk_v4;
    level.scr_anim["axis"]["patrolwalk_5"] = %active_patrolwalk_v5;
    level.scr_anim["axis"]["patrolwalk_pause"] = %active_patrolwalk_pause;
    level.scr_anim["axis"]["patrolwalk_turn"] = %active_patrolwalk_turn_180;
    level.scr_anim["axis"]["patrolwalk_nolight"] = %huntedrun_1_idle;
    level.scr_anim["axis"]["dazed_0"] = %hunted_dazed_walk_e_run;
    level.scr_anim["axis"]["dazed_1"] = %hunted_dazed_walk_a_zombie;
    level.scr_anim["axis"]["dazed_2"] = %hunted_dazed_walk_b_blind;
    level.scr_anim["axis"]["dazed_3"] = %hunted_dazed_walk_d_woozy;
    level.scr_anim["axis"]["dazed_4"] = %hunted_dazed_walk_c_limp;
}

dialogue()
{
    level.scr_sound["price"]["youallright"] = "hunted_pri_youallright";
    level.scr_sound["price"]["casualtyreport"] = "hunted_pri_casualtyreport";
    level.scr_sound["mark"]["bothpilotsdead"] = "hunted_uk2_bothpilotsdead";
    level.scr_sound["price"]["bugger"] = "hunted_pri_bugger";
    level.scr_sound["price"]["extractionpoint"] = "hunted_pri_extractionpoint";
    level.scr_radio["hunted_price_ac130_inbound"] = "hunted_price_ac130_inbound";
    level.scr_sound["price"]["hunted_pri_copy"] = "hunted_pri_copy";
    level.scr_sound["mark"]["hunted_uk2_ac130"] = "hunted_uk2_ac130";
    level.scr_sound["price"]["lowprofile"] = "hunted_pri_lowprofile";
    level.scr_sound["price"]["killoldman"] = "hunted_pri_killoldman";
    level.scr_sound["price"]["keepmoving"] = "hunted_pri_keepmoving";
    level.scr_sound["mark"]["areaclear"] = "hunted_uk2_areaclear";
    level.scr_sound["price"]["holdfire"] = "hunted_pri_holdfire";
    level.scr_sound["generic"]["hunted_ru1_isadump"] = "hunted_ru1_isadump";
    level.scr_sound["generic"]["laugh1"] = "hunted_ru1_laugh";
    level.scr_sound["generic"]["laugh2"] = "hunted_ru2_laugh";
    level.scr_sound["price"]["hitdeck"] = "hunted_pri_hitdeck";
    level.scr_sound["generic"]["bythehouse"] = "hunted_ru1_bythehouse";
    level.scr_sound["price"]["staydown"] = "hunted_pri_staydown";
    level.scr_sound["price"]["helismoving"] = "hunted_pri_helismoving";
    level.scr_sound["price"]["ontous"] = "hunted_pri_ontous";
    level.scr_sound["price"]["returnfire2"] = "hunted_pri_returnfire2";
    level.scr_sound["price"]["basementdooropen2"] = "hunted_pri_basementdooropen2";
    level.scr_sound["price"]["getinhouse"] = "hunted_pri_getinhouse";
    level.scr_sound["price"]["whatwaitingfor"] = "hunted_pri_whatwaitingfor";
    level.scr_sound["price"]["getinbasement"] = "hunted_pri_getinbasement";
    level.scr_sound["mark"]["contact6oclock"] = "hunted_uk2_contact6oclock";
    level.scr_sound["mark"]["imonit"] = "hunted_uk2_imonit";
    level.scr_sound["mark"]["doorsopen"] = "hunted_uk2_doorsopen";
    level.scr_sound["price"]["takepoint"] = "hunted_pri_takepoint";
    level.scr_sound["mark"]["warn_flashbang"] = "hunted_uk2_flashbang";
    level.scr_sound["charlie"]["tooquiet"] = "hunted_sas2_tooquiet";
    level.scr_sound["mark"]["regrouping"] = "hunted_uk2_regrouping";
    level.scr_sound["price"]["staysharp"] = "hunted_pri_staysharp";
    level.scr_sound["mark"]["helicoptersback"] = "hunted_uk2_helicoptersback";
    level.scr_sound["price"]["keepitthatway"] = "hunted_pri_keepitthatway";
    level.scr_sound["price"]["presson"] = "hunted_pri_presson";
    level.scr_sound["price"]["sentriesatbridge"] = "hunted_pri_sentriesatbridge";
    level.scr_sound["price"]["outofspotlight"] = "hunted_pri_outofspotlight";
    level.scr_sound["price"]["staylow"] = "hunted_pri_staylow";
    level.scr_sound["price"]["moveit"] = "hunted_pri_moveit";
    level.scr_sound["price"]["endoffield"] = "hunted_pri_endoffield";
    level.scr_sound["price"]["watchhelicopter"] = "hunted_pri_watchhelicopter";
    level.scr_sound["mark"]["hunted_uk2_werecompromised"] = "hunted_uk2_werecompromised";
    level.scr_sound["generic"]["hunted_ru2_bythecreek"] = "hunted_ru2_bythecreek";
    level.scr_sound["generic"]["hunted_ru1_inthefield"] = "hunted_ru1_inthefield";
    level.scr_sound["generic"]["hunted_ru4_outonfield"] = "hunted_ru4_outonfield";
    level.scr_sound["price"]["anotherpass"] = "hunted_pri_anotherpass";
    level.scr_sound["mark"]["missilesinbarn"] = "hunted_uk2_missilesinbarn";
    level.scr_sound["price"]["takeoutchopper"] = "hunted_pri_takeoutchopper";
    level.scr_sound["mark"]["hunted_uk2_poppingflares"] = "hunted_uk2_poppingflares";
    level.scr_sound["mark"]["hunted_uk2_fireagain"] = "hunted_uk2_fireagain";
    level.scr_sound["mark"]["niceshooting"] = "hunted_uk2_niceshooting";
    level.scr_sound["price"]["everyoneonme"] = "hunted_pri_everyoneonme";
    level.scr_sound["mark"]["bringingintanks"] = "hunted_uk2_bringingintanks";
    level.scr_sound["price"]["blockedpath"] = "hunted_pri_blockedpath";
    level.scr_radio["requestfire"] = "hunted_hqr_requestfire";
    level.scr_radio["usesomehelp"] = "hunted_acc_usesomehelp";
    level.scr_sound["price"]["100metres"] = "hunted_pri_100metres";
    level.scr_radio["comindown"] = "hunted_acc_comindown";
    level.scr_radio["getmovin"] = "hunted_acc_getmovin";
    level.scr_sound["price"]["comeonletsgo"] = "hunted_pri_comeonletsgo";
}

#using_animtree("player");

player_anims()
{
    level.scr_anim["player_flight_helicopter"]["flight_crash_player"] = %hunted_bh_crash_player;
    level.scr_animtree["player_flight_helicopter"] = #animtree;
    level.scr_model["player_flight_helicopter"] = "h2_gfl_m4_sopmod_ii_viewbody";
    level.scr_anim["opening_player_model"]["opening_player"] = %hunted_opening_player;
    level.scr_animtree["opening_player_model"] = #animtree;
    level.scr_model["opening_player_model"] = "h2_gfl_m4_sopmod_ii_viewbody";
}

#using_animtree("vehicles");

anim_blackhawk()
{
    level.scr_animtree["blackhawk"] = #animtree;
    level.scr_anim["blackhawk"]["interiorwires"][0] = %h1_blackhawk_interiorwires;
}

#using_animtree("script_model");

scriptmodel_anims()
{
    if ( getdvarint( "use_old_door_openings" ) != 1 )
    {
        level.scr_anim["creekgate"]["open"] = %h1_hunted_open_grilldoor_door;
        level.scr_animtree["creekgate"] = #animtree;
        level.scr_model["creekgate"] = "h1_hunted_gatelatch";
        level.scr_anim["barndoor_01"]["open"] = %h1_hunted_open_barndoor_01_door;
        level.scr_animtree["barndoor_01"] = #animtree;
        level.scr_model["barndoor_01"] = "h1_me_armada_door_hq_entrance_ver1";
        level.scr_anim["barndoor_02"]["open"] = %h1_hunted_open_barndoor_02_door;
        level.scr_animtree["barndoor_02"] = #animtree;
        level.scr_model["barndoor_02"] = "h1_hunted_barndoor";
    }

    level.scr_anim["dogtags"]["hunted_dying"] = %h1_hunted_dogtags_pickup;
    level.scr_animtree["dogtags"] = #animtree;
    level.scr_model["dogtags"] = "h1_prop_dogtag";
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

#using_animtree("vehicles");

bm21_custom()
{
    level.bm21_custom["explosion"] = %vehicle_80s_sedan1_destroy;
}
