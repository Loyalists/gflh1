// H1 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

main()
{
    anims();
    setup_exploder_anims();
    blast_door();
    player_anims();
    dialogue();
}

#using_animtree("generic_human");

anims()
{
    if ( getdvarint( "use_old_vent_drop" ) == 1 )
    {
        level.scr_anim["price"]["vent_drop_l"] = %launchfacility_b_vent_drop_l;
        level.scr_anim["grigsby"]["vent_drop_r"] = %launchfacility_b_vent_drop_r;
        level.scr_anim["steve"]["vent_drop_team1"] = %launchfacility_b_vent_drop_r;
    }
    else
    {
        level.scr_anim["price"]["vent_drop_l"] = %h1_launchfacility_b_vent_drop_l;
        level.scr_anim["grigsby"]["vent_drop_r"] = %h1_launchfacility_b_vent_drop_r;
        level.scr_anim["steve"]["vent_drop_team1"] = %h1_launchfacility_b_vent_drop_r;
    }

    level.scr_anim["price"]["blast_door_runto"] = %launchfacility_b_blast_door_seq_approch;
    level.scr_anim["price"]["blast_door_wave"][0] = %launchfacility_b_blast_door_seq_waveidle;
    level.scr_anim["price"]["blast_door_close"] = %launchfacility_b_blast_door_seq_close;

    if ( getdvarint( "use_old_vaultdoors" ) == 1 )
    {
        level.scr_anim["price"]["guard_vaultdoors"] = %launchfacility_b_wargame_door_price;
        level.scr_anim["grigsby"]["guard_vaultdoors"] = %launchfacility_b_wargame_door_grigs;
    }
    else
    {
        level.scr_anim["price"]["guard_vaultdoors"] = %h1_launchfacility_b_wargame_door_price;
        maps\_anim::addnotetrack_dialogue( "price", "dialog", "guard_vaultdoors", "launchfacility_b_pri_atdoor" );
        maps\_anim::addnotetrack_customfunction( "price", "gaz_dialog1", ::play_gaz_doors1_roger, "guard_vaultdoors" );
        maps\_anim::addnotetrack_customfunction( "price", "gaz_dialog2", ::play_gaz_doors2_standby, "guard_vaultdoors" );
        maps\_anim::addnotetrack_customfunction( "price", "gaz_dialog3", ::play_gaz_doors3_gotit, "guard_vaultdoors" );
        maps\_anim::addnotetrack_dialogue( "price", "dialog", "guard_vaultdoors", "launchfacility_b_pri_faster" );
        maps\_anim::addnotetrack_customfunction( "price", "gaz_dialog4", ::play_gaz_doors4_negative, "guard_vaultdoors" );
        level.scr_anim["grigsby"]["guard_vaultdoors"] = %h1_launchfacility_b_wargame_door_grigs;
        maps\_anim::addnotetrack_dialogue( "grigsby", "griggs_dialog", "guard_vaultdoors", "launchfacility_b_grg_shittinme" );
    }

    level.scr_anim["grigsby"]["elevator_runin"] = %hunted_tunnel_guy1_runin;
    level.scr_anim["grigsby"]["elevator_idle"][0] = %hunted_tunnel_guy1_idle;
    level.scr_anim["price"]["elevator_runin"] = %hunted_tunnel_guy2_runin;
    level.scr_anim["price"]["elevator_idle"][0] = %hunted_tunnel_guy2_idle;
    level.scr_anim["price"]["elevator_runout"] = %hunted_tunnel_guy2_runout;
    level.scr_anim["grigsby"]["elevator_runout"] = %hunted_tunnel_guy1_runout;
    level.scr_anim["grigsby"]["h1_elevator_elevator"] = %h1_launchfacility_b_elevator_griggs_elevator;
    level.scr_anim["grigsby"]["h1_elevator_idle1"][0] = %h1_launchfacility_b_elevator_griggs_idle1;
    level.scr_anim["grigsby"]["h1_elevator_idle2"][0] = %h1_launchfacility_b_elevator_griggs_idle2;
    level.scr_anim["grigsby"]["h1_elevator_runin"] = %h1_launchfacility_b_elevator_griggs_runin;
    level.scr_anim["grigsby"]["h1_elevator_runout"] = %h1_launchfacility_b_elevator_griggs_runout;
    level.scr_anim["price"]["h1_elevator_elevator"] = %h1_launchfacility_b_elevator_price_elevator;
    level.scr_anim["price"]["h1_elevator_entering"] = %h1_launchfacility_b_elevator_price_entering;
    level.scr_anim["price"]["h1_elevator_run_to_idle1"] = %h1_launchfacility_b_elevator_price_run_to_idle1;
    level.scr_anim["price"]["h1_elevator_idle1"][0] = %h1_launchfacility_b_elevator_price_idle1;
    level.scr_anim["price"]["h1_elevator_idle2"][0] = %h1_launchfacility_b_elevator_price_idle2;
    level.scr_anim["price"]["h1_elevator_runin"] = %h1_launchfacility_b_elevator_price_runin;
    level.scr_anim["price"]["h1_elevator_runout"] = %h1_launchfacility_b_elevator_price_runout;

    if ( getdvarint( "use_old_elevator" ) != 1 )
    {
        maps\_anim::addnotetrack_dialogue( "grigsby", "dialog", "h1_elevator_elevator", "launchfacility_b_grg_ashot" );
        maps\_anim::addnotetrack_customfunction( "price", "gaz_dialog", ::play_gaz_elevator_radio, "h1_elevator_elevator" );
        maps\_anim::addnotetrack_dialogue( "price", "radio_dialog", "h1_elevator_elevator", "launchfacility_b_pri_upthelift" );
        maps\_anim::addnotetrack_dialogue( "price", "dialog", "h1_elevator_elevator", "launchfacility_b_pri_getinline" );
    }

    level.scr_deadbody[1] = character\character_dead_russian_loyalist_a::main;
    level.scr_deadbody[2] = character\character_dead_russian_loyalist_b::main;
    level.scr_deadbody[3] = character\character_dead_russian_loyalist_c::main;
}

setup_exploder_anims()
{
    level.exploder_animtrees = [];
    level.exploder_animtrees[0] = "exploder_script_model";
}

#using_animtree("script_model");

blast_door()
{
    level.scr_animtree["door"] = #animtree;
    level.scr_anim["door"]["blast_door_close"] = %launchfacility_b_blast_door_seq_close_door;
    level.scr_animtree["exploder_script_model"] = #animtree;
    level.scr_anim["exploder_script_model"]["h1_launch_b_breach_anim"] = %h1_launch_b_breach_anim;
}

#using_animtree("player");

player_anims()
{
    level.scr_animtree["player"] = #animtree;
    level.scr_model["player"] = "h2_gfl_m4_sopmod_ii_worldhands";
    level.scr_anim["player"]["typing_abort_codes"] = %h1_launchfacility_b_player_typing;
}

dialogue()
{
    level.scr_radio["letsmove"] = "launchfacility_b_pri_letsmove";
    level.scr_radio["basesecurity"] = "launchfacility_b_gm1_basesecurity";
    level.scr_radio["invents"] = "launchfacility_b_pri_invents";
    level.scr_radio["gm1_copythat"] = "launchfacility_b_gm1_copythat";
    level.scr_radio["heavyresistance"] = "launchfacility_b_gm2_heavyresistance";
    level.scr_radio["gaincontrol"] = "launchfacility_b_pri_gaincontrol";
    level.scr_radio["regroup"] = "launchfacility_b_gm2_regroup";
    level.scr_radio["15mins"] = "launchfacility_b_hqr_15mins";
    level.scr_radio["11mins"] = "launchfacility_b_hqr_11mins";
    level.scr_radio["9mins"] = "launchfacility_b_hqr_9mins";
    level.scr_sound["price"]["pri_copythat"] = "launchfacility_b_pri_copythat";
    level.scr_radio["grg_gottamove"] = "launchfacility_b_grg_gottamove";
    level.scr_radio["grg_goinon"] = "launchfacility_b_grg_goinon";
    level.scr_radio["startedcountdown"] = "launchfacility_b_pri_startedcountdown";
    level.scr_radio["pri_movemove"] = "launchfacility_b_pri_movemove";
    level.scr_radio["pri_gogogo1"] = "launchfacility_b_pri_gogogo1";
    level.scr_radio["controlbasesec"] = "launchfacility_b_gm1_controlbasesec";
    level.scr_sound["price"]["pri_atdoor"] = "launchfacility_b_pri_atdoor";
    level.scr_radio["workinonit"] = "launchfacility_b_gm1_workinonit";
    level.scr_radio["almostthere"] = "launchfacility_b_gm1_almostthere";
    level.scr_radio["gotit"] = "launchfacility_b_gm1_gotit";
    level.scr_sound["grigsby"]["grg_shittinme"] = "launchfacility_b_grg_shittinme";
    level.scr_radio["pri_faster"] = "launchfacility_b_pri_faster";
    level.scr_radio["gm1_trypulling"] = "launchfacility_b_gm1_trypulling";
    level.scr_sound["price"]["pri_cheeky"] = "launchfacility_b_pri_cheeky";
    level.scr_sound["price"]["status"] = "launchfacility_b_pri_status";
    level.scr_radio["gm2_inposition"] = "launchfacility_b_gm2_inposition";
    level.scr_radio["prepbreach"] = "launchfacility_b_pri_prepbreach";
    level.scr_radio["grg_inposition"] = "launchfacility_b_grg_inposition";
    level.scr_sound["price"]["pri_plantexplos"] = "launchfacility_b_pri_plantexplos";
    level.scr_radio["movingin"] = "launchfacility_b_gm2_movingin";
    level.scr_radio["pri_gogogo2"] = "launchfacility_b_pri_gogogo2";
    level.scr_radio["grg_clearR"] = "launchfacility_b_grg_clearR";
    level.scr_radio["entercodes"] = "launchfacility_b_pri_entercodes";
    level.scr_radio["hqr_confirm"] = "launchfacility_b_hqr_confirm";
    level.scr_radio["hqr_standby"] = "launchfacility_b_hqr_standby";
    level.scr_radio["hqr_crashed"] = "launchfacility_b_hqr_crashed";
    level.scr_radio["hqr_confdest"] = "launchfacility_b_hqr_confdest";
    level.scr_radio["checkfeed2"] = "launchfacility_b_gm2_checkfeed2";
    level.scr_radio["extractionpoint"] = "launchfacility_b_pri_extractionpoint";
    level.scr_radio["sendcoordinates"] = "launchfacility_b_gm1_sendcoordinates";
    level.scr_sound["price"]["vehicledepot"] = "launchfacility_b_pri_vehicledepot";
    level.scr_sound["price"]["pri_outtahere"] = "launchfacility_b_pri_outtahere";
    level.scr_radio["exfilfromarea"] = "launchfacility_b_hqr_exfilfromarea";
    level.scr_sound["grigsby"]["grg_company"] = "launchfacility_b_grg_company";
    level.scr_sound["price"]["pri_movemove"] = "launchfacility_b_pri_movemove";
    level.scr_radio["pri_movemove"] = "launchfacility_b_pri_movemove";
    level.scr_radio["takinfire"] = "launchfacility_b_gm1_takinfire";
    level.scr_radio["upthelift"] = "launchfacility_b_pri_upthelift";
    level.scr_sound["grigsby"]["grg_ashot"] = "launchfacility_b_grg_ashot";
    level.scr_sound["price"]["pri_getinline"] = "launchfacility_b_pri_getinline";
    level.scr_radio["takinfire"] = "launchfacility_b_gm1_takinfire";
    level.scr_sound["price"]["letsgo"] = "launchfacility_b_pri_letsgo";
    level.scr_sound["grigsby"]["grg_move"] = "launchfacility_b_grg_move";
    level.scr_radio["grg_10"] = "launchfacility_b_grg_10";
    level.scr_radio["grg_8"] = "launchfacility_b_grg_8";
    level.scr_radio["grg_6"] = "launchfacility_b_grg_6";
    level.scr_radio["grg_5"] = "launchfacility_b_grg_5";
    level.scr_radio["grg_4"] = "launchfacility_b_grg_4";
    level.scr_radio["grg_3"] = "launchfacility_b_grg_3";
}

play_gaz_elevator_radio( var_0 )
{
    maps\_utility::radio_dialogue( "takinfire" );
}

play_gaz_doors1_roger( var_0 )
{
    maps\_utility::radio_dialogue( "workinonit" );
}

play_gaz_doors2_standby( var_0 )
{
    maps\_utility::radio_dialogue( "almostthere" );
}

play_gaz_doors3_gotit( var_0 )
{
    maps\_utility::radio_dialogue( "gotit" );
    thread maps\launchfacility_b::vault_doors_team_ready();
    wait 0.5;
    common_scripts\utility::flag_set( "vault_doors_unlocked" );
}

play_gaz_doors4_negative_scenecompletedevent()
{
    wait 3;
    maps\launchfacility_b::vault_door_scene_completed();
}

play_gaz_doors4_negative( var_0 )
{
    thread play_gaz_doors4_negative_scenecompletedevent();
    maps\_utility::radio_dialogue( "gm1_trypulling" );
    level.price thread maps\_anim::anim_single_queue( level.price, "pri_cheeky" );
}
