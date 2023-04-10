// H1 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

main()
{
    anims();
    dialogue();
    exploder_script_model_anims();
    luggage_compartment_anims();
    center_console_anims();
    air_mask_anims();
    bathroom_door_anims();
}

#using_animtree("generic_human");

anims()
{
    level.scr_anim["frnd"]["C4_plant_start"] = %explosive_plant_knee;
    level.scr_anim["frnd"]["C4_plant"] = %explosive_plant_knee;
    maps\_hand_signals::inithandsignals();
    level.scr_anim["generic"]["signal_onme"] = %cqb_stand_wave_on_me;
    level.scr_anim["generic"]["signal_go"] = %cqb_stand_wave_go_v1;
    level.scr_anim["generic"]["signal_stop"] = %cqb_stand_signal_stop;
    level.scr_anim["generic"]["signal_moveup"] = %cqb_stand_signal_move_up;
    level.scr_anim["generic"]["signal_moveout"] = %cqb_stand_signal_move_out;
    level.scr_anim["generic"]["signal_check"] = %cqb_stand_signal_twitch_check;
    level.scr_anim["generic"]["signal_look"] = %cqb_stand_signal_twitch_look;
    level.scr_anim["generic"]["signal_quicklook"] = %cqb_stand_signal_twitch_quicklook;
    level.scr_anim["generic"]["signal_shift"] = %cqb_stand_signal_twitch_shift;
    level.scr_anim["generic"]["signal_twitch"] = %cqb_stand_twitch;
    level.scr_anim["generic"]["moveout_exposed"] = %stand_exposed_wave_move_out;
    level.scr_anim["generic"]["moveup_exposed"] = %stand_exposed_wave_move_up;
    level.scr_anim["generic"]["stop_exposed"] = %stand_exposed_wave_halt;
    level.scr_anim["generic"]["stop2_exposed"] = %stand_exposed_wave_halt_v2;
    level.scr_anim["generic"]["onme_exposed"] = %stand_exposed_wave_on_me;
    level.scr_anim["generic"]["onme2_exposed"] = %stand_exposed_wave_on_me_v2;
    level.scr_anim["generic"]["enemy_exposed"] = %stand_exposed_wave_target_spotted;
    level.scr_anim["generic"]["down_exposed"] = %stand_exposed_wave_down;
    level.scr_anim["generic"]["go_exposed"] = %stand_exposed_wave_go;
    level.scr_anim["generic"]["moveout_cornerR"] = %cornerstndr_alert_signal_move_out;
    level.scr_anim["generic"]["stop_cornerR"] = %cornerstndr_alert_signal_stopstay_down;
    level.scr_anim["generic"]["onme_cornerR"] = %cornerstndr_alert_signal_on_me;
    level.scr_anim["generic"]["enemy_cornerR"] = %cornerstndr_alert_signal_enemy_spotted;
    level.scr_anim["generic"]["patrol_walk"] = %patrol_bored_patrolwalk;
    level.scr_anim["generic"]["patrol_walk_twitch"] = %patrol_bored_patrolwalk_twitch;
    level.scr_anim["generic"]["patrol_stop"] = %patrol_bored_walk_2_bored;
    level.scr_anim["generic"]["patrol_start"] = %patrol_bored_2_walk;
    level.scr_anim["generic"]["patrol_turn180"] = %patrol_bored_2_walk_180turn;
    level.scr_anim["generic"]["patrol_idle_1"] = %patrol_bored_idle;
    level.scr_anim["generic"]["patrol_idle_2"] = %patrol_bored_idle_smoke;
    level.scr_anim["generic"]["patrol_idle_3"] = %patrol_bored_idle_cellphone;
    level.scr_anim["generic"]["patrol_idle_4"] = %patrol_bored_twitch_bug;
    level.scr_anim["generic"]["patrol_idle_5"] = %patrol_bored_twitch_checkphone;
    level.scr_anim["generic"]["patrol_idle_6"] = %patrol_bored_twitch_stretch;
    level.scr_anim["generic"]["patrol_idle_smoke"] = %patrol_bored_idle_smoke;
    level.scr_anim["generic"]["patrol_idle_checkphone"] = %patrol_bored_twitch_checkphone;
    level.scr_anim["generic"]["patrol_idle_stretch"] = %patrol_bored_twitch_stretch;
    level.scr_anim["generic"]["patrol_idle_phone"] = %patrol_bored_idle_cellphone;
    level.scr_anim["generic"]["patrol_jog"] = %patrol_jog;
    level.scr_anim["generic"]["combat_jog"] = %combat_jog;
    level.scr_anim["generic"]["patrol_jog_turn180"] = %patrol_jog_360;
    level.scr_anim["generic"]["stealth_jog"] = %patrol_jog;
    level.scr_anim["generic"]["stealth_walk"] = %patrol_bored_patrolwalk;
    level.scr_anim["generic"]["death_pose_sit_1"][0] = %death_sitting_pose_v1;
    level.scr_anim["generic"]["death_pose_sit_2"][0] = %death_sitting_pose_v2;
    level.scr_anim["generic"]["death_pose_chair_1"][0] = %airlift_copilot_dead;
    level.scr_anim["generic"]["death_pose_floor_1"][0] = %cargoship_sleeping_guy_idle_1;
    level.scr_anim["generic"]["death_pose_floor_2"][0] = %cargoship_sleeping_guy_idle_2;
    level.scr_anim["generic"]["death_pose_desk"][0] = %death_pose_on_desk;
    level.scr_anim["generic"]["death_pose_window"][0] = %death_pose_on_window;
    level.scr_anim["hostage"]["unarmed_run1"] = %unarmed_run_russian;
    level.scr_anim["hostage"]["unarmed_run2"] = %unarmed_panickedrun_loop_v1;
    level.scr_anim["hostage"]["unarmed_run3"] = %unarmed_panickedrun_loop_v2;
    level.scr_anim["hostage"]["human_shield_idle"][0] = %human_shield_idle_1_h;
    level.scr_anim["terrorist"]["human_shield_idle"][0] = %human_shield_idle_1_t;
    level.scr_anim["terrorist"]["human_shield_death"] = %human_shield_death_1_t;
    level.scr_anim["hostage"]["human_shield_death"] = %hostage_human_shield_host_death;
    level.scr_anim["terrorist"]["human_shield_pain"] = %human_shield_wounded_1_t;
    level.scr_anim["hostage"]["human_shield_breakfree_partner_dead"] = %human_shield_death_1_h;
    level.scr_anim["terrorist"]["human_shield_breakfree_partner_dead"] = %terrorist_human_shield_host_death;
    level.scr_anim["hostage"]["human_shield_breakfree_partner_wounded"] = %human_shield_wounded_1_h;
    level.scr_anim["bridge_stand1"]["idle"][0] = %cargoship_stunned_react_v2_idle;
    level.scr_anim["bridge_stand1"]["react"] = %cargoship_stunned_react_v2;
    level.scr_anim["bridge_stand1"]["death"] = %cargoship_stunned_react_v2_death;
    level.scr_anim["hostage"]["standunarmed_idle_loop"][0] = %standunarmed_idle_loop;
    level.scr_anim["hostage"]["unarmed_crouch_idle1"][0] = %unarmed_crouch_idle1;
    level.scr_anim["hostage"]["unarmed_crouch_twitch1"] = %unarmed_crouch_twitch1;

    if ( getdvarint( "use_old_airplane_jump" ) == 1 )
    {
        level.scr_anim["hostage"]["airplane_end_VIP_idle"][0] = %airplane_end_vip_idle;
        level.scr_anim["hostage"]["airplane_end_VIP_start"] = %airplane_end_vip;
        level.scr_anim["frnd"]["airplane_end_VIP_start"] = %airplane_end_soldier;
        level.scr_anim["hostage"]["airplane_end_VIP"] = %airplane_end_vip;
        level.scr_anim["frnd"]["airplane_end_VIP"] = %airplane_end_soldier;
    }
    else
    {
        level.scr_anim["hostage"]["airplane_end_VIP_idle"][0] = %h1_airplane_tandem_jump_vip_idle;
        level.scr_anim["hostage"]["airplane_end_VIP_start"] = %h1_airplane_tandem_jump_vip;
        level.scr_anim["frnd"]["airplane_end_VIP_start"] = %h1_airplane_tandem_jump_soldier;
        level.scr_anim["hostage"]["airplane_end_VIP"] = %h1_airplane_tandem_jump_vip;
        level.scr_anim["frnd"]["airplane_end_VIP"] = %h1_airplane_tandem_jump_soldier;
    }
}

dialogue()
{
    level.dialoguemovelines = 3;
    level.scr_radio["airplane_gaz_keepmoving_1"] = "airplane_gaz_move";
    level.scr_radio["airplane_gaz_keepmoving_2"] = "airplane_gaz_moveup";
    level.scr_radio["airplane_gaz_keepmoving_3"] = "airplane_gaz_keepmoving";
    level.dialoguehostiledown = 12;
    level.scr_radio["airplane_killfirm_1"] = "airplane_gaz_tangodown";
    level.scr_radio["airplane_killfirm_2"] = "airplane_gaz_xraydown";
    level.scr_radio["airplane_killfirm_3"] = "airplane_gaz_hostileneut";
    level.scr_radio["airplane_killfirm_4"] = "airplane_gaz_targneut";
    level.scr_radio["airplane_killfirm_5"] = "airplane_sas1_tangodown";
    level.scr_radio["airplane_killfirm_6"] = "airplane_sas1_xraydown";
    level.scr_radio["airplane_killfirm_7"] = "airplane_sas1_hostileneut";
    level.scr_radio["airplane_killfirm_8"] = "airplane_sas1_targneut";
    level.scr_radio["airplane_killfirm_9"] = "airplane_sas4_tangodown";
    level.scr_radio["airplane_killfirm_10"] = "airplane_sas4_xraydown";
    level.scr_radio["airplane_killfirm_11"] = "airplane_sas4_hostileneut";
    level.scr_radio["airplane_killfirm_12"] = "airplane_sas4_targneut";
    level.dialogueareaclear = 9;
    level.scr_radio["airplane_areaclear_1"] = "airplane_gaz_areaclear";
    level.scr_radio["airplane_areaclear_2"] = "airplane_gaz_sectionclear";
    level.scr_radio["airplane_areaclear_3"] = "airplane_gaz_clear";
    level.scr_radio["airplane_areaclear_4"] = "airplane_sas1_areaclear";
    level.scr_radio["airplane_areaclear_5"] = "airplane_sas1_sectionclear";
    level.scr_radio["airplane_areaclear_6"] = "airplane_sas1_clear";
    level.scr_radio["airplane_areaclear_7"] = "airplane_sas4_areaclear";
    level.scr_radio["airplane_areaclear_8"] = "airplane_sas4_sectionclear";
    level.scr_radio["airplane_areaclear_9"] = "airplane_sas4_clear";
    level.scr_radio["airplane_gaz_capturekriegler"] = "airplane_gaz_capturekriegler";
    level.scr_radio["airplane_gaz_goindeep"] = "airplane_gaz_goindeep";
    level.scr_radio["airplane_sas1_surely"] = "airplane_sas1_surely";
    level.scr_radio["airplane_gaz_shirley"] = "airplane_gaz_shirley";
    level.scr_radio["airplane_gaz_okgetready"] = "airplane_gaz_okgetready";
    level.scr_radio["airplane_first_hostile_killed_1"] = "airplane_sas4_onealpha";
    level.scr_radio["airplane_first_hostile_killed_2"] = "airplane_gaz_weaponsfree";
    level.scr_radio["airplane_sas4_multiplecont"] = "airplane_sas4_multiplecont";
    level.scr_radio["airplane_gaz_stairwayclear"] = "airplane_gaz_stairwayclear";
    level.scr_radio["airplane_gaz_standby"] = "airplane_gaz_standby";
    level.scr_radio["airplane_gaz_hullbreach"] = "airplane_gaz_hullbreach";
    level.scr_radio["airplane_gaz_watchyourfire"] = "airplane_gaz_watchyourfire";
    level.scr_radio["airplane_gaz_needkriegleralive"] = "airplane_gaz_needkriegleralive";
    level.scr_radio["airplane_gaz_needvipalive"] = "airplane_gaz_needvipalive";
    level.scr_radio["airplane_gaz_downonfloor"] = "airplane_gaz_downonfloor";
    level.scr_radio["airplane_gaz_takehim"] = "airplane_gaz_takehim";
    level.scr_sound["terrorist"]["airplane_ter_illkillhim"] = "airplane_ter_illkillhim";
    level.scr_radio["airplane_gaz_niceone"] = "airplane_gaz_niceone";
    level.scr_radio["airplane_sas4_armedbomb"] = "airplane_sas4_armedbomb";
    level.scr_sound["frnd"]["airplane_gaz_dooropen"] = "airplane_gaz_dooropen";
    level.scr_radio["airplane_gaz_preptobreach"] = "airplane_gaz_preptobreach";
    level.scr_sound["hostage"]["airplane_ru4_donthurtme"] = "airplane_ru4_donthurtme";
    level.scr_sound["hostage"]["airplane_ru4_gettoaphone"] = "airplane_ru4_gettoaphone";
    level.scr_radio["airplane_gaz_littlefreefall"] = "airplane_gaz_littlefreefall";
    level.scr_radio["airplane_gaz_onyourfeet"] = "airplane_gaz_onyourfeet";
    level.scr_sound["hostage"]["airplane_ru4_noparachute"] = "airplane_ru4_noparachute";
    level.scr_radio["airplane_sas4_thatsoneway"] = "airplane_sas4_thatsoneway";
    level.scr_radio["airplane_sas1_letsgo"] = "airplane_sas1_letsgo";
    level.scr_radio["airplane_gaz_seeya"] = "airplane_gaz_seeya";
    player_view();
}

#using_animtree("player");

player_view()
{
    level.scr_animtree["player_view"] = #animtree;
    level.scr_model["player_view"] = "h2_gfl_m4_sopmod_ii_worldhands";
    level.scr_animtree["worldbody"] = #animtree;
    level.scr_model["worldbody"] = "h2_gfl_m4_sopmod_ii_viewbody";
    level.scr_anim["worldbody"]["airplane_end_player"] = %h1_airplane_tandem_jump_full;
}

#using_animtree("script_model");

exploder_script_model_anims()
{
    level.exploder_animtrees = [];
    level.exploder_animtrees[0] = "exploder_script_model";
    level.scr_animtree["exploder_script_model"] = #animtree;
    level.scr_anim["exploder_script_model"]["h1_airplane_breach_lowwer0_anim"] = %h1_airplane_breach_lowwer0_anim;
    level.scr_anim["exploder_script_model"]["h1_airplane_breach_lowwer1_anim"] = %h1_airplane_breach_lowwer1_anim;
    level.scr_anim["exploder_script_model"]["h1_airplane_breach_lowwer2_anim"] = %h1_airplane_breach_lowwer2_anim;
    level.scr_anim["exploder_script_model"]["h1_airplane_breach_lowwer3_anim"] = %h1_airplane_breach_lowwer3_anim;
    level.scr_anim["exploder_script_model"]["h1_airplane_breach_lowwer4_anim"] = %h1_airplane_breach_lowwer4_anim;
    level.scr_anim["exploder_script_model"]["h1_airplane_upper_breach0_anim"] = %h1_airplane_upper_breach0_anim;
    level.scr_anim["exploder_script_model"]["h1_airplane_upper_breach1_anim"] = %h1_airplane_upper_breach1_anim;
    level.scr_anim["exploder_script_model"]["h1_airplane_upper_breach2_anim"] = %h1_airplane_upper_breach2_anim;
    level.scr_anim["exploder_script_model"]["h1_airplane_upper_breach3_anim"] = %h1_airplane_upper_breach3_anim;
}

luggage_compartment_anims()
{
    level.scr_animtree["bin"] = #animtree;
    level.scr_anim["bin"]["bin_open"] = %h1_airplane_overhead_bin_open_anim;
    level.scr_anim["bin"]["bin_shake"][0] = %h1_airplane_overhead_bin_shake_anim;
}

center_console_anims()
{
    level.scr_animtree["center_console"] = #animtree;
    level.scr_anim["center_console"]["center_console_open"] = %h1_airplane_center_console_open;
    level.scr_anim["center_console"]["center_console_shake"][0] = %h1_airplane_center_console_shake;
}

air_mask_anims()
{
    level.scr_animtree["air_mask"] = #animtree;
    level.scr_anim["air_mask"]["air_masks_breach_fall"] = %ap_air_masks_breach_fall;
    level.scr_anim["air_mask"]["air_masks_breach_loop"][0] = %ap_air_masks_breach_loop;
    level.scr_anim["air_mask"]["air_masks_fall"] = %ap_air_masks_fall;
    level.scr_anim["air_mask"]["air_masks_loop"][0] = %ap_air_masks_loop;
}

bathroom_door_anims()
{
    level.scr_animtree["bathroom_door"] = #animtree;
    level.scr_anim["bathroom_door"]["bathroom_door_shake"][0] = %h1_airplane_bathroom_door_animated_shake;
    maps\_anim::addnotetrack_animsound( "bathroom_door", "bathroom_door_shake", "start", "emt_metal_shake" );
}
