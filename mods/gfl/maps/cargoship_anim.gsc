// H1 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

main()
{
    anim_gen_human();
    anim_door();
    anim_chair();
    anim_seaknight();
    anim_sea();
    anim_player();
    dialogue();
    anim_blackhawk();
    anim_props();
}

dialogue()
{
    level.scr_radio["cargoship_hp1_baseplatehammertwo"] = "cargoship_hp1_baseplatehammertwo";
    level.scr_radio["cargoship_hqr_copytwofour"] = "cargoship_hqr_copytwofour";
    level.scr_radio["cargoship_hp1_thirtysecdark"] = "cargoship_hp1_thirtysecdark";
    level.scr_radio["cargoship_pri_crewexpend"] = "cargoship_pri_crewexpend";
    level.scr_radio["cargoship_hp1_tensecondsradio"] = "cargoship_hp1_tensecondsradio";
    level.scr_radio["cargoship_hp1_radiocheck"] = "cargoship_hp1_radiocheck";
    level.scr_radio["cargoship_hp1_greenlightgoradio"] = "cargoship_hp1_greenlightgoradio";
    level.scr_radio["cargoship_gm1_bridgesecure"] = "cargoship_gm1_bridgesecure";
    level.scr_radio["cargoship_pri_weaponsfree"] = "cargoship_pri_weaponsfree";
    level.scr_radio["cargoship_pri_holdyourfire"] = "cargoship_pri_holdyourfire";
    level.scr_radio["cargoship_grg_rogerthat"] = "cargoship_grg_rogerthat";
    level.scr_radio["cargoship_pri_squadonme"] = "cargoship_pri_squadonme";
    level.scr_radio["cargoship_pri_stairsclear"] = "cargoship_pri_stairsclear";
    level.scr_radio["cargoship_pri_hallwayclear"] = "cargoship_pri_hallwayclear";
    level.scr_radio["cargoship_pri_crewquarters"] = "cargoship_pri_crewquarters";
    level.scr_radio["cargoship_pri_moveup"] = "cargoship_pri_moveup";
    level.scr_radio["cargoship_hp1_forwarddeckradio"] = "cargoship_hp1_forwarddeckradio";
    level.scr_radio["cargoship_grg_readysir"] = "cargoship_grg_readysir";
    level.scr_radio["cargoship_pri_fanout"] = "cargoship_pri_fanout";
    level.scr_radio["cargoship_grg_gottwo"] = "cargoship_grg_gottwo";
    level.scr_radio["cargoship_pri_iseeem"] = "cargoship_pri_iseeem";
    level.scr_radio["cargoship_grg_gotcompany"] = "cargoship_grg_gotcompany";
    level.scr_radio["cargoship_pri_tangos2ndfl"] = "cargoship_pri_tangos2ndfl";
    level.scr_radio["cargoship_hp1_copyengaging"] = "cargoship_hp1_copyengaging";
    level.scr_radio["cargoship_hp1_bingofuel"] = "cargoship_hp1_bingofuel";
    level.scr_radio["cargoship_pri_copyhammer"] = "cargoship_pri_copyhammer";
    level.scr_radio["cargoship_pri_restonme"] = "cargoship_pri_restonme";
    level.scr_radio["cargoship_grg_closeencounters"] = "cargoship_grg_closeencounters";
    level.scr_radio["cargoship_gm1_tooright"] = "cargoship_gm1_tooright";
    level.scr_radio["cargoship_pri_onmymark"] = "cargoship_pri_onmymark";
    level.scr_radio["cargoship_pri_checkcorners"] = "cargoship_pri_checkcorners";
    level.scr_radio["cargoship_pri_checkthose"] = "cargoship_pri_checkthose";
    level.scr_radio["cargoship_pri_keepittight"] = "cargoship_pri_keepittight";
    level.scr_radio["cargoship_gm1_moveup"] = "cargoship_gm1_moveup";
    level.scr_radio["cargoship_pri_rightside"] = "cargoship_pri_rightside";
    level.scr_radio["cargoship_grg_onit"] = "cargoship_grg_onit";
    level.scr_radio["cargoship_gm1_standingby"] = "cargoship_gm1_standingby";
    level.scr_radio["cargoship_pri_move"] = "cargoship_pri_move";
    level.scr_radio["cargoship_pri_stackup"] = "cargoship_pri_stackup";
    level.scr_radio["cargoship_grg_oneready"] = "cargoship_grg_oneready";
    level.scr_radio["cargoship_gm1_twoready"] = "cargoship_gm1_twoready";
    level.scr_radio["cargoship_pri_go"] = "cargoship_pri_go";
    level.scr_radio["cargoship_grg_zeromovement"] = "cargoship_grg_zeromovement";
    level.scr_radio["cargoship_gm1_looksquiet"] = "cargoship_gm1_looksquiet";
    level.scr_radio["cargoship_pri_stayfrosty"] = "cargoship_pri_stayfrosty";
    level.scr_radio["cargoship_pri_nextroom"] = "cargoship_pri_nextroom";
    level.scr_radio["cargoship_pri_standby"] = "cargoship_pri_standby";
    level.scr_radio["cargoship_pri_flashbangout"] = "cargoship_pri_flashbangout";
    level.scr_radio["cargoship_pri_report"] = "cargoship_pri_report";
    level.scr_radio["cargoship_grg_roomsempty"] = "cargoship_grg_roomsempty";
    level.scr_sound["escape"]["cargoship_pri_packagesecured"] = "cargoship_pri_packagesecured";
    level.scr_radio["cargoship_grg_soundrussian"] = "cargoship_grg_soundrussian";
    level.scr_radio["cargoship_hqr_notime"] = "cargoship_hqr_notime";
    level.scr_sound["escape"]["cargoship_grg_fastmovers"] = "cargoship_grg_fastmovers";
    level.scr_sound["escape"]["cargoship_pri_getmanifestmove"] = "cargoship_pri_getmanifestmove";
    level.scr_sound["escape"]["cargoship_pri_macgetmanifest"] = "cargoship_pri_macgetmanifest";
    level.scr_sound["escape"]["cargoship_pri_donthavetime"] = "cargoship_pri_donthavetime";
    level.scr_sound["escape"]["cargoship_pri_getmanifest"] = "cargoship_pri_getmanifest";
    level.scr_sound["escape"]["cargoship_pri_gottamove"] = "cargoship_pri_gottamove";
    level.scr_sound["escape"]["cargoship_pri_manifestletsgo"] = "cargoship_pri_manifestletsgo";
    level.scr_sound["escape"]["cargoship_pri_topside"] = "cargoship_pri_topside";
    level.scr_sound["escape"]["cargoship_grg_strongreading"] = "cargoship_grg_strongreading";
    level.scr_sound["escape"]["cargoship_gaz_takealook"] = "cargoship_gaz_takealook";
    level.scr_sound["escape"]["cargoship_pri_inarabic"] = "cargoship_pri_inarabic";
    level.scr_sound["escape"]["cargoship_pri_readytosecure"] = "cargoship_pri_readytosecure";
    level.scr_radio["cargoship_pri_lastcall"] = "cargoship_pri_lastcall";
    level.scr_radio["cargoship_sas4_sweetdreams"] = "cargoship_sas4_sweetdreams";
    level.scr_radio["cargoship_sas4_sleeptight"] = "cargoship_sas4_sleeptight";
    level.scr_sound["escape"]["cargoship_pri_status"] = "cargoship_pri_status";
    level.scr_radio["cargoship_gm2_aircraftinbound2"] = "cargoship_gm2_aircraftinbound2";
    level.scr_radio["cargoship_hp3_yourstatus"] = "cargoship_hp3_yourstatus";
    level.scr_sound["escape"]["cargoship_grg_shipssinking"] = "cargoship_grg_shipssinking";
    level.scr_radio["cargoship_grg_whathappened"] = "cargoship_grg_whathappened";
    level.scr_radio["cargoship_hp3_comein"] = "cargoship_hp3_comein";
    level.scr_sound["escape"]["cargoship_pri_weareleaving"] = "cargoship_pri_weareleaving";
    level.scr_sound["escape"]["cargoship_pri_onyourfeet"] = "cargoship_pri_onyourfeet";
    level.scr_sound["escape"]["cargoship_pri_gettocatwalks"] = "cargoship_pri_gettocatwalks";
    level.scr_sound["escape"]["cargoship_pri_weareleaving"] = "cargoship_pri_weareleaving";
    level.scr_sound["escape"]["cargoship_pri_backonfeet"] = "cargoship_pri_backonfeet";
    level.scr_sound["escape"]["cargoship_grg_keepmoving"] = "cargoship_grg_keepmoving";
    level.scr_radio["cargoship_hp3_talktome"] = "cargoship_hp3_talktome";
    level.scr_sound["escape"]["cargoship_pri_almostthere"] = "cargoship_pri_almostthere";
    level.scr_sound["escape"]["cargoship_grg_breakinaway"] = "cargoship_grg_breakinaway";
    level.scr_sound["escape"]["cargoship_pri_comeoncomeon"] = "cargoship_pri_comeoncomeon";
    level.scr_sound["escape"]["cargoship_grg_watchpipes"] = "cargoship_grg_watchpipes";
    level.scr_radio["cargoship_gm1_watchyerhead"] = "cargoship_gm1_watchyerhead";
    level.scr_radio["cargoship_hp3_moveit"] = "cargoship_pri_go";
    level.scr_sound["escape"]["cargoship_pri_walkinpark"] = "cargoship_pri_walkinpark";
    level.scr_sound["escape"]["cargoship_grg_outtatime"] = "cargoship_grg_outtatime";
    level.scr_sound["escape"]["cargoship_pri_keepmoving"] = "cargoship_pri_keepmoving";
    level.scr_radio["cargoship_gm1_whichway"] = "cargoship_gm1_whichway";
    level.scr_sound["escape"]["cargoship_pri_totheright"] = "cargoship_pri_totheright";
    level.scr_sound["escape"]["cargoship_grg_movego"] = "cargoship_grg_movego";
    level.scr_sound["escape"]["cargoship_grg_whereisit"] = "cargoship_grg_whereisit";
    level.scr_radio["cargoship_gm2_jumpforit"] = "cargoship_gm2_jumpforit";
    level.scr_radio["cargoship_pri_gotcha"] = "cargoship_pri_gotcha";
    level.scr_sound["escape"]["cargoship_pri_allaboard"] = "cargoship_pri_allaboard";
    level.scr_radio["cargoship_pri_allaboard"] = "cargoship_pri_allaboard";
    level.scr_radio["cargoship_hp3_outtahere"] = "cargoship_hp3_outtahere";
    level.scr_radio["cargoship_hp3_returntobase"] = "cargoship_hp3_returntobase";
    level.scr_radio["cargoship_grg_clearleft"] = "cargoship_grg_clearleft";
    level.scr_radio["cargoship_grg_clearright"] = "cargoship_grg_clearright";
    level.scr_radio["cargoship_grg_movementright"] = "cargoship_grg_movementright";
    level.scr_radio["cargoship_grg_catwalkclear"] = "cargoship_grg_catwalkclear";
    level.scr_radio["cargoship_grg_forwardclear"] = "cargoship_grg_forwardclear";
    level.scr_radio["cargoship_grg_notangos"] = "cargoship_grg_notangos";
    level.scr_radio["cargoship_gm1_clearleft"] = "cargoship_gm1_clearleft";
    level.scr_radio["cargoship_gm1_clearright"] = "cargoship_gm1_clearright";
    level.scr_radio["cargoship_gm1_movementright"] = "cargoship_gm1_movementright";
    level.scr_radio["cargoship_gm1_catwalkclear"] = "cargoship_gm1_catwalkclear";
    level.scr_radio["cargoship_gm1_forwardclear"] = "cargoship_gm1_forwardclear";
    level.scr_radio["cargoship_gm1_notangos"] = "cargoship_gm1_notangos";
    level.scr_radio["cargoship_gm1_targetneutralized"] = "cargoship_gm1_targetneutralized";
    level.scr_radio["cargoship_gm1_tangodown"] = "cargoship_gm1_tangodown";
    level.scr_radio["cargoship_gm2_targetneutralized"] = "cargoship_gm2_targetneutralized";
    level.scr_radio["cargoship_gm2_tangodown"] = "cargoship_gm2_tangodown";
    level.scr_radio["cargoship_grg_targetneutralized"] = "cargoship_grg_targetneutralized";
    level.scr_radio["cargoship_grg_tangodown"] = "cargoship_grg_tangodown";
}

#using_animtree("generic_human");

anim_gen_human()
{
    level.scr_anim["bridge_capt"]["idle"][0] = %cargoship_stunned_coffee_react_idle;
    level.scr_anim["bridge_capt"]["react"] = %cargoship_stunned_coffee_react;
    level.scr_anim["bridge_capt"]["death"] = %cargoship_stunned_coffee_death;
    level.scr_anim["bridge_tv"]["idle"][0] = %cargoship_stunned_tv_react_idle;
    level.scr_anim["bridge_tv"]["react"] = %cargoship_stunned_tv_react;
    level.scr_anim["bridge_tv"]["death"] = %cargoship_stunned_tv_death;
    level.scr_anim["bridge_clipboard"]["idle"][0] = %cargoship_stunned_clipboard_react_idle;
    level.scr_anim["bridge_clipboard"]["react"] = %cargoship_stunned_clipboard_react;
    level.scr_anim["bridge_clipboard"]["death"] = %cargoship_stunned_clipboard_death;
    level.scr_anim["bridge_stand1"]["idle"][0] = %cargoship_stunned_react_v2_idle;
    level.scr_anim["bridge_stand1"]["react"] = %cargoship_stunned_react_v2;
    level.scr_anim["bridge_stand1"]["death"] = %cargoship_stunned_react_v2_death;
    level.scr_anim["sleeper_0"]["sleep"][0] = %cargoship_sleeping_guy_idle_1;
    level.scr_anim["sleeper_0"]["death"] = %cargoship_sleeping_guy_death_1;
    level.scr_anim["sleeper_1"]["sleep"][0] = %cargoship_sleeping_guy_idle_2;
    level.scr_anim["sleeper_1"]["death"] = %cargoship_sleeping_guy_death_2;
    level.scr_anim["drunk"]["walk"] = %cargoship_drunk_sequence;
    level.scr_anim["drunk"]["death"] = %cargoship_drunk_sequence_death;
    level.scr_anim["price"]["bridge_breach"] = %h1_cgoship_bridge_breach_price;
    maps\_anim::addnotetrack_animsound( "price", "bridge_breach", "kick_door", "wood_door_kick" );
    level.scr_anim["price"]["stair_cover_exit"] = %h1_cgoship_stair_cover_exit_price;
    level.scr_anim["price"]["door_breach_setup"] = %shotgunbreach_cs_shoot_hinge;
    level.scr_anim["price"]["door_breach_setup_idle"][0] = %shotgunbreach_v1_shoot_hinge_idle;
    level.scr_anim["price"]["door_breach_idle"] = %shotgunbreach_v1_shoot_hinge_ready_idle;
    level.scr_anim["price"]["door_breach"] = %shotgunbreach_cs_shoot_hinge_runin;
    level.scr_anim["alavi"]["bridge_breach"] = %h1_cgoship_bridge_breach_ally;
    maps\_anim::addnotetrack_animsound( "alavi", "bridge_breach", "turn_wheel_start", "scn_cargoship_intro_breaching" );
    level.scr_anim["alavi"]["bunkbed_approach"] = %h1_cgoship_bunkbed_approach_ally;
    level.scr_anim["alavi"]["door_breach_setup"] = %shotgunbreach_cs_stackb;
    level.scr_anim["alavi"]["door_breach_setup_idle"][0] = %breach_cargo_alavis_idle;
    level.scr_anim["alavi"]["door_breach_idle"] = %shotgunbreach_v1_stackb_ready_idle;
    level.scr_anim["alavi"]["door_breach"] = %breach_cargo_alavis_runin;
    level.scr_anim["grigsby"]["door_breach_setup"] = %shotgunbreach_cs_stackb;
    level.scr_anim["grigsby"]["door_breach_setup_idle"][0] = %shotgunbreach_v1_stackb_idle;
    level.scr_anim["grigsby"]["door_breach_idle"] = %shotgunbreach_v1_stackb_ready_idle;
    level.scr_anim["grigsby"]["door_breach"] = %shotgunbreach_cs_stackb_runin;
    level.scr_anim["guy"]["grigsturn"] = %crouch_2run_180;
    level.scr_anim["guy"]["grigstop"] = %run_2_stand_f_6;
    level.scr_anim["guy"]["grigsgo"] = %stand_2_run_f_2;
    level.scr_anim["patrol"]["pause"] = %active_patrolwalk_pause;
    level.scr_anim["patrol"]["turn"] = %active_patrolwalk_turn_180;
    level.scr_anim["patrol"]["walk1"] = %active_patrolwalk_v1;
    level.scr_anim["patrol"]["walk2"] = %active_patrolwalk_v2;
    level.scr_anim["patrol"]["walk3"] = %active_patrolwalk_v3;
    level.scr_anim["patrol"]["walk4"] = %active_patrolwalk_v4;
    level.scr_anim["patrol"]["walk5"] = %active_patrolwalk_v5;
    level.scr_anim["guy"]["explosion"] = %death_explosion_run_f_v1;
    level.scr_anim["sprinter"]["sprint"] = %sprint1_loop;
    level.scr_anim["pulp_fiction_guy"]["run"] = %unarmed_run_russian;
    level.scr_anim["guy"]["grenade_throw"] = %corner_standl_grenade_b;
    level.scr_anim["guy"]["corner_l_look"] = %corner_standl_alert_2_look;
    level.scr_anim["guy"]["corner_l_quickreact"] = %corner_standl_look_2_alert_fast_v1;
    level.scr_anim["guy"]["corner_l_idle"][0] = %corner_standl_alert_idle;
    level.scr_anim["guy"]["corner_l_idle"][1] = %corner_standl_alert_twitch01;
    level.scr_anim["guy"]["corner_l_idle"][2] = %corner_standl_alert_twitch02;
    level.scr_anim["guy"]["corner_l_idle"][3] = %corner_standl_alert_twitch03;
    level.scr_anim["guy"]["corner_l_idle"][4] = %corner_standl_alert_twitch06;
    level.scr_anim["guy"]["corner_l_idle"][5] = %corner_standl_alert_twitch07;
    level.scr_anim["guy"]["grenade_throw"] = %corner_standl_grenade_b;
    level.scr_anim["guy"]["grenade_throwR"] = %corner_standr_grenade_b;
    level.scr_anim["guy"]["onme"] = %cqb_stand_wave_on_me;
    level.scr_anim["guy"]["go"] = %cqb_stand_wave_go_v1;
    level.scr_anim["guy"]["onme_back"] = %cqb_stand_wave_on_me_back;
    level.scr_anim["generic"]["signal_onme"] = %cqb_stand_wave_on_me;
    level.scr_anim["generic"]["signal_go"] = %cqb_stand_wave_go_v1;
    level.scr_anim["generic"]["onme_back"] = %cqb_stand_wave_on_me_back;
    level.scr_anim["generic"]["signal_go_cqb"] = %cqb_stand_wave_go_v1;
    level.scr_anim["generic"]["signal_onme_cqb"] = %cqb_stand_wave_on_me;
    level.scr_anim["generic"]["signal_onme_crouch"] = %cqb_stand_wave_go_v1;
    level.scr_anim["generic"]["signal_go_crouch"] = %cqb_stand_wave_go_v1;
    maps\_anim::addnotetrack_animsound( "generic", "signal_onme", "foley_sound", "foly_waving_go" );
    level.scr_anim["guy"]["coverstand_aim"] = %coverstand_hide_2_aim;
    level.scr_anim["guy"]["coverleft_crouch_aim"] = %cornercrl_alert_2_stand;
    level.scr_anim["guy"]["standaim2idle"] = %casual_stand_idle_trans_in;
    level.scr_anim["generic"]["standidle2aim"] = %casual_stand_idle_trans_out;
    level.scr_anim["generic"]["standaim"][0] = %exposed_aim_5;
    level.scr_anim["guy"]["standidle"][0] = %casual_stand_idle;
    level.scr_anim["guy"]["standidle"][1] = %casual_stand_idle_twitch;
    level.scr_anim["guy"]["standidle"][2] = %casual_stand_idle_twitchb;
    level.scr_anim["shuffle"]["loop"] = %walk_left;
    level.scr_anim["shuffle"]["exit"] = %trans_walkl_2_run;
    level.scr_anim["shuffle"]["stop"] = %casual_stand_idle_trans_in;
    level.scr_anim["shuffle"]["arrival"] = %trans_run_2_walkl;
    level.scr_anim["guy"]["cornerright8"] = %corner_standr_trans_out_8;
    level.scr_anim["guy"]["cornerright9"] = %corner_standr_trans_out_9;
    level.scr_anim["guy"]["cornerleft8"] = %corner_standl_trans_out_8;
    level.scr_anim["guy"]["cornerleft7"] = %corner_standl_trans_out_7;
    level.scr_anim["guy"]["cornerleft6"] = %corner_standl_trans_out_6;
    level.scr_anim["guy"]["stand2run"] = %stand_2_run_f_2;
    level.scr_anim["generic"]["stand2run"] = %stand_2_run_f_2;
    level.scr_anim["guy"]["stand2run180"] = %stand_2_run_180_med;
    level.scr_anim["guy"]["stand2runL"] = %stand_2_run_l;
    level.scr_anim["guy"]["stand2runR"] = %stand_2_run_r;
    level.scr_anim["guy"]["cqbstart4"] = %cqb_start_4;
    level.scr_anim["flashed"]["0"] = %exposed_flashbang_v1;
    level.scr_anim["flashed"]["1"] = %exposed_flashbang_v2;
    level.scr_anim["flashed"]["2"] = %exposed_flashbang_v3;
    level.scr_anim["flashed"]["3"] = %exposed_flashbang_v4;
    level.scr_anim["flashed"]["4"] = %exposed_flashbang_v5;
    level.scr_anim["guy"]["crouch2run"] = %crouch_2run_f;
    level.scr_anim["guy"]["walk"] = %patrol_bored_patrolwalk;
    level.scr_anim["guy"]["jog"] = %huntedrun_2;
    level.scr_anim["escape"]["blowback"] = %backdraft;
    level.scr_anim["escape"]["standup"] = %prone_2_stand;
    level.scr_anim["generic"]["lean_left"] = %cargoship_run_leanl;
    level.scr_anim["generic"]["lean_right"] = %cargoship_run_leanr;
    level.scr_anim["generic"]["lean_forward"] = %run_lowready_f;
    level.scr_anim["generic"]["lean_back"] = %run_lowready_f;
    level.scr_anim["generic"]["lean_none"] = %run_lowready_f;
    level.scr_anim["generic"]["lean_left_jog"] = %cargoship_jog_leanl;
    level.scr_anim["generic"]["lean_right_jog"] = %cargoship_jog_leanr;
    level.scr_anim["generic"]["lean_forward_jog"] = %combat_jog;
    level.scr_anim["generic"]["lean_back_jog"] = %combat_jog;
    level.scr_anim["generic"]["lean_none_jog"] = %combat_jog;
    level.scr_anim["escape"]["stumble1"] = %run_pain_fallonknee;
    level.scr_anim["escape"]["stumble2"] = %run_pain_stomach;
    level.scr_anim["escape"]["stumble3"] = %run_pain_fallonknee_02;
    level.scr_anim["escape"]["turn_l"] = %run_tight_turn_l90;
    level.scr_anim["escape"]["turn_r"] = %run_tight_turn_r90;
    level.scr_anim["seat5"]["rescue"][0] = %cargoship_ch46_rescue_load_4_idle;
    level.scr_anim["seat6"]["rescue"][0] = %cargoship_ch46_rescue_load_5_idle;
    level.scr_anim["generic"]["rescue_alavi"] = %cargoship_ch46_rescue_load_1;
    level.scr_anim["generic"]["rescue_alavi_idle"][0] = %cargoship_ch46_rescue_load_1_idle;
    level.scr_anim["generic"]["help_alavi"] = %cargoship_ch46_rescue_load_1_help;
    level.scr_anim["generic"]["rescue_grigsby"] = %cargoship_ch46_rescue_load_2;
    level.scr_anim["generic"]["rescue_grigsby_idle"][0] = %cargoship_ch46_rescue_load_2_idle;
    level.scr_anim["generic"]["help_grigsby"] = %cargoship_ch46_rescue_load_2_help;
    level.scr_anim["generic"]["rescue_price"] = %cargoship_ch46_rescue_load_3;
    level.scr_anim["generic"]["reach_price"] = %cargoship_ch46_rescue_load_3_alt;
    level.scr_anim["generic"]["rescue_price_idle"][0] = %cargoship_ch46_rescue_price_idle;
    level.scr_anim["generic"]["help_price"] = %cargoship_ch46_rescue_price_help;
    maps\_anim::addnotetrack_dialogue( "generic", "dialog", "help_price", "cargoship_pri_gotcha" );
    level.scr_anim["generic"]["price_explosion"] = %cargoship_explosion_price;
    maps\_anim::addnotetrack_dialogue( "generic", "dialog", "price_explosion", "cargoship_pri_weareleaving" );
    level.scr_anim["generic"]["grigsby_explosion"] = %h1_cargoship_explosion_gaz;
    maps\_anim::addnotetrack_dialogue( "generic", "dialog", "grigsby_explosion", "cargoship_grg_shipssinking" );
    level.scr_anim["generic"]["breach2_price_arrival"] = %cargoship_price_run2door;
    level.scr_anim["generic"]["breach2_price_idle"][0] = %cargoship_price_run2door_idle;
    level.scr_anim["generic"]["breach2_price_breach"] = %cargoship_price_runin;
    maps\_anim::addnotetrack_animsound( "generic", "breach2_price_breach", "sound_opendoor", "scn_door_cargoship_hatch_open" );
    level.scr_anim["generic"]["breach2_grigsby_arrival"] = %cargoship_grigsby_run2door;
    level.scr_anim["generic"]["breach2_grigsby_idle"][0] = %cargoship_grigsby_run2door_idle;
    level.scr_anim["generic"]["breach2_grigsby_breach"] = %cargoship_grigsby_runin;
    level.scr_anim["generic"]["breach2_grigsby_talk"] = %cargoship_grigsby_shotgun_pullout;
    level.scr_anim["generic"]["breach2_alavi_arrival"] = %cargoship_alavie_run2door;
    level.scr_anim["generic"]["breach2_alavi_idle"][0] = %cargoship_alavie_run2door_idle;
    level.scr_anim["generic"]["breach2_alavi_breach"] = %cargoship_alavie_runin;
    maps\_anim::addnotetrack_customfunction( "generic", "gun_2_chest", maps\cargoship_code::carogship_shotgunpulla, "breach2_grigsby_talk" );
    maps\_anim::addnotetrack_customfunction( "generic", "shotgun_pickup", maps\cargoship_code::carogship_shotgunpullb, "breach2_grigsby_talk" );
    level.scr_anim["generic"]["breach2_door_breach"] = %cargoship_price_runin_door;
    level.scr_anim["generic"]["package_idle_waitinggunup"][0] = %exposed_aim_5;
    level.scr_anim["generic"]["package_idle_waitinggundown"][0] = %casual_stand_idle;
    level.scr_anim["generic"]["package_opendoor_price"] = %h1_cargoship_open_cargo_price;
    level.scr_anim["generic"]["package_idle_price"][0] = %h1_cargoship_open_cargo_price_idle;
    level.scr_anim["generic"]["package_idle_grigs"][0] = %h1_cargoship_open_cargo_guyl_idle;
    level.scr_anim["escape"]["package_grigs"] = %cargoship_open_cargo_guyl;
    level.scr_anim["generic"]["package_grigs"] = %cargoship_open_cargo_guyl;
    level.scr_anim["generic"]["package_doorL"] = %cargoship_open_cargo_doorl;
    level.scr_anim["generic"]["package_doorR"] = %cargoship_open_cargo_doorr;
    maps\_anim::addnotetrack_animsound( "generic", "package_doorR", "sound", "door_cargo_container_pull_open" );
    maps\_anim::addnotetrack_dialogue( "generic", "dialog", "package_opendoor_price", "cargoship_pri_inarabic" );
    maps\_anim::addnotetrack_dialogue( "generic", "dialog", "package_opendoor_price", "cargoship_pri_readytosecure" );
    maps\_anim::addnotetrack_flag( "generic", "radio", "radiomessage_notime", "package_opendoor_price" );
    maps\_anim::addnotetrack_dialogue( "generic", "dialog2", "package_opendoor_price", "cargoship_pri_getmanifestmove" );
    maps\_anim::addnotetrack_flag( "generic", "animend", "package_orders", "package_opendoor_price" );
    maps\_anim::addnotetrack_dialogue( "generic", "dialog", "package_grigs", "cargoship_grg_fastmovers" );
    level.scr_animtree["escape"] = #animtree;
    level.scr_anim["escape"]["price_escape_1"] = %h1_cargoship_priceescape01;
    level.scr_anim["escape"]["price_escape_2"] = %h1_cargoship_priceescape02;
    level.scr_anim["escape"]["price_escape_3"] = %h1_cargoship_priceescape03;
    level.scr_anim["escape"]["price_escape_4"] = %h1_cargoship_priceescape04;
    level.scr_anim["escape"]["price_escape_5"] = %h1_cargoship_priceescape05;
}

#using_animtree("player");

anim_player()
{
    precachemodel( "h2_gfl_m4_sopmod_ii_viewbody" );
    precachemodel( "h2_gfl_m4_sopmod_ii_viewhands" );
    precachemodel( "h2_gfl_m4_sopmod_ii_viewhands_player" );
    precachemodel( "h2_gfl_m4_sopmod_ii_worldhands" );

    precachemodel( "worldhands_h1_sas_ct" );
    level.scr_animtree["end_hands"] = #animtree;
    level.scr_model["end_hands"] = "h2_gfl_m4_sopmod_ii_worldhands";
    level.scr_anim["end_hands"]["player_rescue"] = %cargoship_ch46_rescue_load_player;
    precachemodel( "worldbody_h1_sas_ct" );
    precacheitem( "mp5_silencer" );
    level.scr_animtree["fastrope_intro"] = #animtree;
    level.scr_model["fastrope_intro"] = "h2_gfl_m4_sopmod_ii_viewbody";
    level.scr_anim["fastrope_intro"]["opening"] = %h1_cargoship_opening_player;
    level.scr_anim["fastrope_intro"]["loop"][0] = %h1_cargoship_opening_player;
    level.scr_gun["fastrope_intro"] = "viewmodel_mp5_silencer";
    level.scr_animtree["player_viewbody"] = #animtree;
    level.scr_model["player_viewbody"] = "h2_gfl_m4_sopmod_ii_viewbody";
    level.scr_anim["player_viewbody"]["player_explosion"] = %cargoship_explosion_player;
    level.scr_anim["player_viewbody"]["player_explosion_start"] = %h1_cargoship_explosion_reaction_player;
    maps\_anim::addnotetrack_flag( "player_viewbody", "fade_in", "shellshock_blinking", "player_explosion" );
    maps\_anim::addnotetrack_flag_clear( "player_viewbody", "fade_out", "shellshock_blinking", "player_explosion" );
    maps\_anim::addnotetrack_flag( "player_viewbody", "blur_in", "shellshock_blur", "player_explosion" );
    maps\_anim::addnotetrack_flag_clear( "player_viewbody", "blur_out", "shellshock_blur", "player_explosion" );
    maps\_anim::addnotetrack_animsound( "fastrope_intro", "opening", "scn_cgo_intro_player_fastrope", "scn_cgo_intro_player_fastrope" );
    maps\_anim::addnotetrack_animsound( "player_viewbody", "player_explosion", "scn_cargo_explosion_foley", "scn_cargo_explosion_foley" );
}

#using_animtree("vehicles");

anim_seaknight()
{
    level.scr_anim["bigbird"]["in"] = %cargoship_ch46_rescue_in;
    level.scr_anim["bigbird"]["idle"][0] = %cargoship_ch46_rescue_idle;
    level.scr_anim["bigbird"]["drift"] = %cargoship_ch46_rescue_drift;
    level.scr_anim["bigbird"]["drift_idle"][0] = %cargoship_ch46_rescue_drift_idle;
    level.scr_anim["bigbird"]["out"] = %cargoship_ch46_rescue_out;
}

anim_blackhawk()
{
    level.scr_animtree["blackhawk"] = #animtree;
    level.scr_anim["blackhawk"]["interiorwires"][0] = %h1_blackhawk_interiorwires;
}

#using_animtree("door");

anim_door()
{
    level.scr_anim["door"]["door_breach"] = %shotgunbreach_v1_shoot_hinge_door;
    level.scr_animtree["door"] = #animtree;
    level.scr_model["door"] = "cs_cargoship_door_PUSH";
    precachemodel( level.scr_model["door"] );
}

#using_animtree("chair");

anim_chair()
{
    level.scr_anim["chair"]["start"][0] = %cargoship_stunned_coffee_death_chair_startidle;
    level.scr_anim["chair"]["fall"] = %cargoship_stunned_coffee_death_chair;
    level.scr_anim["chair"]["end"][0] = %cargoship_stunned_coffee_death_chair_endidle;
}

#using_animtree("script_model");

anim_sea()
{
    level.scr_anim["sea"]["waves"][0] = %cargoship_water;
}

anim_props()
{
    level.scr_animtree["bridge_door_anim"] = #animtree;
    level.scr_model["bridge_door_anim"] = "cs_cargoship_door_PULL";
    level.scr_anim["bridge_door_anim"]["bridge_breach"] = %h1_cgoship_bridge_breach_door;
}
