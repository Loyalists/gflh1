// H1 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

#using_animtree("generic_human");

anim_main()
{
    level dialog();
    level.scr_anim["generic"]["jog"] = %combat_jog;
    level.scr_anim["generic"]["walk"] = %patrol_bored_patrolwalk;
    level.scr_anim["generic"]["patrol_stop"] = %patrol_bored_walk_2_bored;
    level.scr_anim["generic"]["fast_walk"] = %active_patrolwalk_gundown;
    level.scr_anim["generic"]["casual_killer_jog_A"] = %casual_killer_jog_a;
    level.scr_anim["price"]["reveal"] = %killhouse_sas_price;
    maps\_anim::addnotetrack_dialogue( "price", "dialog", "reveal", "killhouse_pri_muppet" );
    maps\_anim::addnotetrack_dialogue( "price", "dialog2", "reveal", "killhouse_pri_cqbtest" );
    maps\_anim::addnotetrack_dialogue( "price", "dialog3", "reveal", "killhouse_pri_runsolo" );
    maps\_anim::addnotetrack_dialogue( "price", "dialog4", "reveal", "killhouse_pri_record19sec" );
    maps\_anim::addnotetrack_customfunction( "price", "dialog5", maps\killhouse::reveal_dialog_ladder, "reveal" );
    level.scr_anim["price"]["reveal_idle"][0] = %killhouse_sas_price_idle;
    level.scr_anim["price"]["debrief_p"] = %h1_killhouse_07_price;
    level.scr_anim["price"]["debrief_idle_s4_b"][0] = %h1_killhouse_07_price_idle;
    level.scr_anim["price"]["price_mask_up"] = %price_mask_up;
    level.scr_anim["price"]["price_mask_outloop"] = %h1_cargoship_price_mask_outloop;
    maps\_anim::addnotetrack_dialogue( "sas1", "dialog", "reveal", "killhouse_sas4_fng" );
    maps\_anim::addnotetrack_dialogue( "sas1", "dialog", "reveal", "killhouse_sas4_goeasy" );
    maps\_anim::addnotetrack_dialogue( "price", "dialog", "debrief_p", "killhouse_pri_wheelsup" );
    level.scr_anim["sas1"]["reveal"] = %killhouse_sas_1;
    level.scr_anim["sas1"]["reveal_idle"][0] = %killhouse_sas_1_idle;
    level.scr_anim["spectator"]["spectator_idle"][0] = %killhouse_woodland_sas_priceidle;
    level.scr_anim["sas1"]["debrief_S1"] = %h1_killhouse_07_soldier1;
    level.scr_anim["sas1"]["debrief_idle_s1_b"][0] = %h1_killhouse_07_soldier1_idle;
    level.scr_anim["sas2"]["reveal"] = %killhouse_sas_2;
    level.scr_anim["sas2"]["reveal_idle"][0] = %killhouse_sas_2_idle;
    level.scr_anim["sas2"]["debrief_S2"] = %h1_killhouse_07_soldier2;
    level.scr_anim["sas2"]["debrief_idle_s2_b"][0] = %h1_killhouse_07_soldier2_idle;
    level.scr_anim["sas3"]["reveal"] = %killhouse_sas_3;
    level.scr_anim["sas3"]["reveal_idle"][0] = %killhouse_sas_3_idle;
    level.scr_anim["sas3"]["debrief_S3"] = %h1_killhouse_07_soldier3;
    level.scr_anim["sas3"]["debrief_idle_s3_b"][0] = %h1_killhouse_07_soldier3_idle;
    level.scr_anim["price"]["h1_price_before_reveal_idle"][0] = %h1_killhouse_sas_price_intro_idle;
    level.scr_anim["sas1"]["h1_sas1_before_reveal_idle"][0] = %h1_killhouse_sas_1_intro_idle;
    level.scr_anim["sas2"]["h1_sas2_before_reveal_idle"][0] = %h1_killhouse_sas_2_intro_idle;
    level.scr_anim["sas3"]["h1_sas3_before_reveal_idle"][0] = %h1_killhouse_sas_3_intro_idle;
    level.scr_anim["generic"]["chair_typing"] = %h1_killhouse_laptopguy_generic_typing;
    level.scr_anim["generic"]["chair_typing_variation"] = %h1_killhouse_laptopguy_typing_variation;
    level.scr_anim["generic"]["chair_typing_pause"] = %h1_killhouse_laptopguy_pause_think;
    level.scr_anim["generic"]["chair_nod_01"] = %h1_killhouse_laptopguy_head_nod_01;
    level.scr_anim["generic"]["chair_nod_02"] = %h1_killhouse_laptopguy_head_nod_02;
    level.scr_anim["generic"]["guy_chair_turnaround"] = %h1_killhouse_laptopguy_turnaround;
    level.scr_anim["generic"]["guy_chair_counting"] = %h1_killhouse_laptopguy_counting;
    level.scr_anim["generic"]["guy_inventory_idle01"][0] = %h1_killhouse_inventory_idle01;
    level.scr_anim["generic"]["guy_inventory_idle02"][0] = %h1_killhouse_inventory_idle02;
    level.scr_anim["generic"]["guy_inventory_lookback"][0] = %h1_killhouse_inventory_lookback;
    level.scr_anim["generic"]["patrol_walk_unarmed"] = %patrol_unarmed_walk;
    level.scr_sound["generic"]["chair_typing"] = "npc_generic_typing";
    level.scr_sound["generic"]["chair_typing_variation"] = "npc_typing_variation";
    level.scr_sound["generic"]["chair_typing_pause"] = "npc_laptop_pause_think";
    level.scr_sound["generic"]["chair_nod_01"] = "npc_laptop_head_nod_1";
    level.scr_sound["generic"]["cchair_nod_02"] = "npc_laptop_head_nod_2";
    level.scr_anim["gaz"]["h1_killhouse_gaz_walkonstage"] = %h1_killhouse_gaz_walkonstage;
    level.scr_anim["gaz"]["killhouse_gaz_idleB"][0] = %h1_killhouse_gaz_idleb;
    level.scr_anim["gaz"]["killhouse_gaz_idleA"] = %h1_killhouse_gaz_idlea;
    level.scr_anim["gaz"]["killhouse_gaz_idleC"][0] = %h1_killhouse_gaz_idlec;
    level.scr_anim["gaz"]["killhouse_gaz_lookdown"] = %h1_killhouse_gaz_lookdown;
    level.scr_anim["gaz"]["killhouse_gaz_lookdown_idle"][0] = %h1_killhouse_gaz_lookdown_idle;
    level.scr_anim["gaz"]["killhouse_gaz_point_side"] = %h1_killhouse_gaz_point_side;
    level.scr_anim["gaz"]["killhouse_gaz_talk_side"] = %h1_killhouse_gaz_talk_side;
    level.scr_anim["gaz"]["killhouse_gaz_talk_side_alt"] = %h1_killhouse_gaz_talk_side_alt;
    level.scr_anim["gaz"]["killhouse_gaz_talk"] = %h1_killhouse_gaz_talk;
    level.scr_anim["gaz"]["killhouse_gaz_explain"] = %h1_killhouse_gaz_explain;
    level.scr_anim["gaz"]["killhouse_gaz_explain2"] = %h1_killhouse_gaz_explain2;
    level.scr_anim["gaz"]["killhouse_gaz_point_front"] = %h1_killhouse_gaz_point_front;
    level.scr_anim["gaz"]["killhouse_gaz_nod"] = %h1_killhouse_gaz_nod;

    if ( getdvarint( "loc_language", 99 ) == 0 )
    {
        level.scr_face["gaz"]["evenfaster"] = %killhouse_gaz_evenfaster;
        level.scr_face["gaz"]["knifewatermelon"] = %killhouse_gaz_knifewatermelon;
        level.scr_face["gaz"]["seeyoufire"] = %killhouse_gaz_seeyoufire;
        level.scr_face["gaz"]["takearifle"] = %killhouse_gaz_takearifle;
        level.scr_face["gaz"]["youknowdrill"] = %killhouse_gaz_youknowdrill;
        level.scr_face["gaz"]["gotostation1"] = %killhouse_gaz_gotostation1;
        level.scr_face["gaz"]["heygo"] = %killhouse_gaz_heygo;
        level.scr_face["gaz"]["getback"] = %killhouse_gaz_getback;
        level.scr_face["gaz"]["lovely"] = %killhouse_gaz_lovely;
        level.scr_face["gaz"]["shooteachtarget"] = %killhouse_gaz_shooteachtarget;
        level.scr_face["gaz"]["firingfromhip"] = %killhouse_gaz_firingfromhip;
        level.scr_face["gaz"]["blocktargets"] = %killhouse_gaz_blocktargets;
        level.scr_face["gaz"]["shoottargets"] = %killhouse_gaz_shoottargets;
        level.scr_face["gaz"]["bulletspenetrate"] = %killhouse_gaz_bulletspenetrate;
        level.scr_face["gaz"]["targetspop"] = %killhouse_gaz_targetspop;
        level.scr_face["gaz"]["hitall"] = %killhouse_gaz_hitall;
        level.scr_face["gaz"]["onemoretime"] = %killhouse_gaz_onemoretime;
        level.scr_face["gaz"]["switchtorifle"] = %killhouse_gaz_switchtorifle;
        level.scr_face["gaz"]["pulloutsidearm"] = %killhouse_gaz_pulloutsidearm;
        level.scr_face["gaz"]["switchingfaster"] = %killhouse_gaz_switchingfaster;
        level.scr_face["gaz"]["comethisway"] = %killhouse_gaz_comethisway;
        level.scr_face["gaz"]["knifemelon"] = %killhouse_gaz_knifemelon;
        level.scr_face["gaz"]["fruitkilling"] = %killhouse_gaz_fruitkilling;
        level.scr_face["gaz"]["wantstosee"] = %killhouse_gaz_wantstosee;
        level.scr_face["nwc"]["timeforfun"] = %killhouse_nwc_timeforfun;
        level.scr_face["nwc"]["pickupfrag"] = %killhouse_nwc_pickupfrag;
        level.scr_face["nwc"]["getinsafety"] = %killhouse_nwc_getinthesafetypit;
        level.scr_face["nwc"]["nowbacktopit"] = %killhouse_nwc_nowbacktopit;
        level.scr_face["nwc"]["followme2"] = %killhouse_nwc_followme2;
        level.scr_face["nwc"]["equipc4"] = %killhouse_nwc_equipc4;
        level.scr_face["nwc"]["exwifecar"] = %killhouse_nwc_exwifecar;
        level.scr_face["nwc"]["placec4"] = %killhouse_nwc_placec4;
        level.scr_face["nwc"]["safedistance"] = %killhouse_nwc_safedistance;
        level.scr_face["nwc"]["fireinhole"] = %killhouse_nwc_fireinhole;
        level.scr_face["nwc"]["chuckle"] = %killhouse_nwc_chuckle;
        level.scr_face["nwc"]["muchimproved"] = %killhouse_nwc_muchimproved;
        level.scr_face["nwc"]["passedeval"] = %killhouse_nwc_passedeval;
    }

    level.scr_anim["gaz"]["intro"] = %killhouse_gaz_intro;
    level.scr_anim["gaz"]["intro_idle"][0] = %h1_killhouse_gaz_intro_idle;
    maps\_anim::addnotetrack_dialogue( "gaz", "dialog", "intro", "killhouse_gaz_goodtosee" );
    level.scr_anim["generic"]["training_sleeping_in_chair"][0] = %training_sleeping_in_chair;
    level.scr_anim["generic"]["training_basketball_rest"][0] = %training_basketball_rest;
    level.scr_anim["generic"]["training_basketball_guy1"][0] = %training_basketball_guy1;
    level.scr_anim["generic"]["training_basketball_guy2"][0] = %training_basketball_guy2;
    level.scr_anim["generic"]["training_humvee_repair"][0] = %training_humvee_repair;
    level.scr_anim["generic"]["training_pushups_guy1"][0] = %training_pushups_guy1;
    level.scr_anim["generic"]["training_pushups_guy2"][0] = %training_pushups_guy2;
    level.scr_anim["generic"]["training_humvee_repair"][0] = %training_humvee_repair;
    level.scr_anim["generic"]["cliffhanger_welder_wing"][0] = %cliffhanger_welder_wing;
    level.scr_anim["generic"]["cliffhanger_welder_engine"][0] = %cliffhanger_welder_engine;
    level.scr_anim["generic"]["patrolstand_idle"][0] = %patrolstand_idle;
    level.scr_anim["generic"]["parabolic_guard_sleeper_idle"][0] = %parabolic_guard_sleeper_idle;
    level.scr_anim["generic"]["roadkill_cover_spotter_idle"][0] = %roadkill_cover_spotter_idle;
    level.scr_anim["generic"]["oilrig_balcony_smoke_idle"][0] = %oilrig_balcony_smoke_idle;
    level.scr_anim["generic"]["killhouse_gaz_idleB"][0] = %killhouse_gaz_idleb;
    level.scr_anim["generic"]["civilian_sitting_talking_A_2"] = %civilian_sitting_talking_a_2;
    level.scr_anim["generic"]["civilian_sitting_talking_A_2_Idle"][0] = %civilian_sitting_talking_a_2_idle;
    level.scr_anim["generic"]["civilian_sitting_talking_A_2_facial"] = %civilian_sitting_talking_a_2_facial;
    level.scr_anim["generic"]["parabolic_leaning_guy_smoking_idle"][0] = %parabolic_leaning_guy_smoking_idle;
    level.scr_anim["generic"]["parabolic_leaning_guy_idle"][0] = %parabolic_leaning_guy_idle;
    level.scr_anim["generic"]["parabolic_leaning_guy_idle_training"][0] = %parabolic_leaning_guy_idle_training;
    level.scr_anim["generic"]["civilian_texting_sitting"][0] = %civilian_texting_sitting;
    level.scr_anim["generic"]["sitting_guard_loadAK_idle"][0] = %sitting_guard_loadak_idle;
    level.scr_anim["generic"]["afgan_caves_sleeping_guard_idle"][0] = %afgan_caves_sleeping_guard_idle;
    level.scr_anim["generic"]["cargoship_sleeping_guy_idle_2"][0] = %cargoship_sleeping_guy_idle_2;
    level.scr_anim["generic"]["civilian_sitting_talking_A_1"][0] = %civilian_sitting_talking_a_1;
    level.scr_anim["generic"]["bunker_toss_idle_guy1"][0] = %bunker_toss_idle_guy1;
    level.scr_anim["generic"]["roadkill_cover_radio_soldier3"][0] = %roadkill_cover_radio_soldier3;
    level.scr_anim["generic"]["civilian_sitting_talking_B_1"][0] = %civilian_sitting_talking_b_1;
    level.scr_anim["generic"]["civilian_smoking_A"][0] = %civilian_smoking_a;
    level.scr_anim["generic"]["civilian_reader_1"][0] = %civilian_reader_1;
    level.scr_anim["generic"]["civilian_reader_2"][0] = %civilian_reader_2;
    level.scr_anim["generic"]["civilian_reader_2_facial"] = %civilian_reader_2_facial;
    level.scr_anim["generic"]["guardA_sit_sleeper_sleep_idle"] = %guarda_sit_sleeper_sleep_idle;
    level.scr_anim["generic"]["roadkill_humvee_map_sequence_quiet_idle"][0] = %roadkill_humvee_map_sequence_quiet_idle;
    level.scr_anim["generic"]["guardB_sit_drinker_idle"][0] = %guardb_sit_drinker_idle;
    level.scr_anim["generic"]["guardB_standing_cold_idle"][0] = %guardb_standing_cold_idle;
    level.scr_anim["generic"]["civilian_texting_standing"][0] = %civilian_texting_standing;
    level.scr_anim["generic"]["killhouse_sas_2_idle"][0] = %killhouse_sas_2_idle;
    level.scr_anim["generic"]["killhouse_sas_3_idle"][0] = %killhouse_sas_3_idle;
    level.scr_anim["generic"]["killhouse_sas_price_idle"][0] = %killhouse_sas_price_idle;
    level.scr_anim["generic"]["killhouse_sas_1_idle"][0] = %killhouse_sas_1_idle;
    level.scr_anim["generic"]["little_bird_casual_idle_guy1"][0] = %little_bird_casual_idle_guy1;
    level.scr_anim["generic"]["sniper_escape_spotter_idle"][0] = %sniper_escape_spotter_idle;
    level.scr_anim["generic"]["patrol_bored_idle"][0] = %patrol_bored_idle;
    level.scr_anim["generic"]["patrol_unarmed_idle"][0] = %patrol_unarmed_idle;
    level.scr_anim["generic"]["patrol_unarmed_walk"] = %patrol_unarmed_walk;
    level.scr_anim["generic"]["patrol_walk"] = %patrol_bored_patrolwalk;
    level.scr_anim["generic"]["patrol_walk_twitch"] = %patrol_bored_patrolwalk_twitch;
    level.scr_anim["generic"]["patrol_stop"] = %patrol_bored_walk_2_bored;
    level.scr_anim["generic"]["patrol_start"] = %patrol_bored_2_walk;
    level.scr_anim["generic"]["patrol_turn180"] = %patrol_bored_2_walk_180turn_fng;
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
    level.scr_anim["generic"]["patrol_turn_l45_rfoot"] = %h1_bored_patrol_walk_turn_l45_right_foot;
    level.scr_anim["generic"]["patrol_turn_l45_lfoot"] = %h1_bored_patrol_walk_turn_l45_left_foot;
    level.scr_anim["generic"]["patrol_turn_l90_rfoot"] = %h1_bored_patrol_walk_turn_l90_right_foot;
    level.scr_anim["generic"]["patrol_turn_l90_lfoot"] = %h1_bored_patrol_walk_turn_l90_left_foot;
    level.scr_anim["generic"]["patrol_turn_l135_rfoot"] = %h1_bored_patrol_walk_turn_l135_right_foot;
    level.scr_anim["generic"]["patrol_turn_l135_lfoot"] = %h1_bored_patrol_walk_turn_l135_left_foot;
    level.scr_anim["generic"]["patrol_turn_r45_rfoot"] = %h1_bored_patrol_walk_turn_r45_right_foot;
    level.scr_anim["generic"]["patrol_turn_r45_lfoot"] = %h1_bored_patrol_walk_turn_r45_left_foot;
    level.scr_anim["generic"]["patrol_turn_r90_rfoot"] = %h1_bored_patrol_walk_turn_r90_right_foot;
    level.scr_anim["generic"]["patrol_turn_r90_lfoot"] = %h1_bored_patrol_walk_turn_r90_left_foot;
    level.scr_anim["generic"]["patrol_turn_r135_rfoot"] = %h1_bored_patrol_walk_turn_r135_right_foot;
    level.scr_anim["generic"]["patrol_turn_r135_lfoot"] = %h1_bored_patrol_walk_turn_r135_left_foot;
    level.scr_anim["generic"]["patrol_walk_in_lfoot"] = %h1_bored_patrol_walk_turn_walk_in_left;
    level.scr_anim["generic"]["patrol_walk_out_lfoot"] = %h1_bored_patrol_walk_turn_walk_out_left;
    level.scr_anim["generic"]["patrol_walk_in_rfoot"] = %h1_bored_patrol_walk_turn_walk_in_right;
    level.scr_anim["generic"]["patrol_walk_out_rfoot"] = %h1_bored_patrol_walk_turn_walk_out_right;
    level.scr_anim["generic"]["RunNoGun_1"] = %h1_ambiant_run_no_gun;
    level.scr_anim["generic"]["RunNoGun_2"] = %h1_ambiant_run_no_gun_2;
    level.scr_anim["generic"]["RunNoGun_3"] = %h1_ambiant_run_no_gun_3;
    level.scr_anim["generic"]["RunNoGun_4"] = %h1_ambiant_run_no_gun;
    level.scr_anim["generic"]["RunNoGun_5"] = %h1_ambiant_run_no_gun_5;
    level.scr_anim["generic"]["runner_facial_1"] = %facial_run_1;
    level.scr_anim["generic"]["runner_facial_2"] = %facial_run_2;
    level.scr_anim["generic"]["runner_facial_3"] = %facial_pain_1;
    level.scr_anim["generic"]["runner_facial_4"] = %facial_pain_2;
    level.scr_anim["generic"]["runner_facial_5"] = %facial_pain_3;
    level.scr_anim["generic"]["training_jog_guy1"] = %training_jog_guy1;
    level.scr_anim["generic"]["training_jog_guy2"] = %training_jog_guy2;
    level.scr_anim["generic"]["v2_idle"][0] = %casual_stand_v2_idle;
    level.scr_anim["generic"]["v2_idle"][1] = %casual_stand_v2_twitch_shift;
    level.scr_anim["generic"]["v2_idle"][2] = %casual_stand_v2_twitch_radio;
    level.scr_anim["generic"]["jog_stop"] = %casual_killer_jog_stop;
    level.scr_anim["generic"]["prone_to_stand"] = %killhouse_course_prone_2_stand;
    anim_view_body();
    anim_props();
    anim_chair();
    maps\_patrol::init_patrol_animation_list();
}

#using_animtree("player");

anim_view_body()
{
    precachemodel( "h2_gfl_m4_sopmod_ii_viewbody" );
    precachemodel( "h2_gfl_m4_sopmod_ii_viewbody_uaz" );
    precachemodel( "h2_gfl_m4_sopmod_ii_viewhands" );
    precachemodel( "h2_gfl_m4_sopmod_ii_viewhands_player" );
    precachemodel( "h2_gfl_m4_sopmod_ii_worldhands" );

    precachemodel( "vb_generic_s1" );
    level.scr_animtree["view_body"] = #animtree;
    level.scr_model["view_body"] = "h2_gfl_m4_sopmod_ii_viewbody_uaz";
    level.scr_anim["view_body"]["training_rope"] = %h1_killhouse_player_fastrope;
    precachemodel( "worldbody_h1_sas_ct" );
    level.scr_animtree["view_body_door"] = #animtree;
    level.scr_model["view_body_door"] = "h2_gfl_m4_sopmod_ii_viewbody";
    level.scr_anim["view_body_door"]["player_opendoor"] = %h1_killhouse_player_opendoor;
}

dialog()
{
    level.scr_sound["gaz"]["wantstosee"] = "killhouse_gaz_wantstosee";
    level.scr_sound["gaz"]["onemoretime"] = "killhouse_gaz_onemoretime";
    level.scr_sound["gaz"]["getarifle"] = "killhouse_gaz_getarifle";
    level.scr_sound["gaz"]["getasidearm"] = "killhouse_gaz_getasidearm";
    level.scr_sound["gaz"]["snaponto"] = "killhouse_gaz_snaponto";
    level.scr_sound["gaz"]["evenfaster"] = "killhouse_gaz_evenfaster";
    level.scr_sound["gaz"]["knifewatermelon"] = "killhouse_gaz_knifewatermelon";
    level.scr_sound["gaz"]["stopaiming"] = "killhouse_gaz_stopaiming";
    level.scr_sound["gaz"]["seeyoufire"] = "killhouse_gaz_seeyoufire";
    level.scr_sound["sas2"]["fng"] = "killhouse_sas4_fng";
    level.scr_sound["sas2"]["goeasy"] = "killhouse_sas4_goeasy";
    level.scr_sound["price"]["cqbsim"] = "killhouse_pri_cqbsim";
    level.scr_sound["price"]["muppet"] = "killhouse_pri_muppet";
    level.scr_sound["price"]["cbqtest"] = "killhouse_pri_cqbtest";
    level.scr_sound["price"]["runsolo"] = "killhouse_pri_runsolo";
    level.scr_sound["price"]["record19sec"] = "killhouse_pri_record19sec";
    level.scr_sound["price"]["welcome"] = "killhouse_pri_welcome";
    level.scr_sound["price"]["ladderhere"] = "killhouse_pri_ladderhere";
    level.scr_sound["price"]["ladderthere"] = "killhouse_pri_ladderthere";
    level.scr_sound["price"]["wheelsup"] = "killhouse_pri_wheelsup";
    level.scr_sound["price"]["sprint"] = "killhouse_pri_sprint";
    level.scr_sound["price"]["tooslow"] = "killhouse_pri_tooslow";
    level.scr_sound["price"]["comeback"] = "killhouse_pri_comeback";
    level.scr_sound["price"]["youlldo"] = "killhouse_pri_youlldo";
    level.scr_sound["price"]["seenbetter2"] = "killhouse_pri_seenbetter";
    level.scr_sound["price"]["sloppy"] = "killhouse_pri_sloppy";
    level.scr_sound["price"]["tryitagain"] = "killhouse_pri_tryitagain";
    level.scr_sound["price"]["notgreat"] = "killhouse_pri_notgreat";
    level.scr_sound["price"]["lesstime"] = "killhouse_pri_lesstime";
    level.scr_sound["price"]["letyouskip"] = "killhouse_pri_letyouskip";
    level.scr_sound["gaz"]["illletyouin"] = "killhouse_gaz_illletyouin";
    level.scr_sound["gaz"]["smalldoor"] = "killhouse_gaz_smalldoor";
    level.scr_sound["gaz"]["gotallday"] = "killhouse_gaz_gotallday";
    level.scr_sound["gaz"]["getamoveon"] = "killhouse_gaz_getamoveon";
    level.scr_sound["gaz"]["goodtosee"] = "killhouse_gaz_goodtosee";
    level.scr_sound["gaz"]["takearifle"] = "killhouse_gaz_takearifle";
    level.scr_sound["gaz"]["youknowdrill"] = "killhouse_gaz_youknowdrill";
    level.scr_sound["gaz"]["gotostation1"] = "killhouse_gaz_gotostation1";
    level.scr_sound["gaz"]["heygo"] = "killhouse_gaz_heygo";
    level.scr_sound["gaz"]["getback"] = "killhouse_gaz_getback";
    level.scr_sound["gaz"]["priceevaluation"] = "killhouse_gaz_priceevaluation";
    level.scr_sound["gaz"]["rifledownrange"] = "killhouse_gaz_rifledownrange";
    level.scr_sound["gaz"]["aimyourrifle"] = "killhouse_gaz_aimyourrifle";
    level.scr_sound["gaz"]["lovely"] = "killhouse_gaz_lovely";
    level.scr_sound["gaz"]["shooteachtarget"] = "killhouse_gaz_shooteachtarget";
    level.scr_sound["gaz"]["brilliant"] = "killhouse_gaz_brilliant";
    level.scr_sound["gaz"]["firingfromhip"] = "killhouse_gaz_firingfromhip";
    level.scr_sound["gaz"]["changessize"] = "killhouse_gaz_changessize";
    level.scr_sound["gaz"]["stupidtest"] = "killhouse_gaz_stupidtest";
    level.scr_sound["gaz"]["stupidinnit"] = "killhouse_gaz_stupidinnit";
    level.scr_sound["gaz"]["overwith"] = "killhouse_gaz_overwith";
    level.scr_sound["gaz"]["blocktargets"] = "killhouse_gaz_blocktargets";
    level.scr_sound["gaz"]["shoottargets"] = "killhouse_gaz_shoottargets";
    level.scr_sound["gaz"]["good"] = "killhouse_gaz_good";
    level.scr_sound["gaz"]["bulletspenetrate"] = "killhouse_gaz_bulletspenetrate";
    level.scr_sound["gaz"]["largerweapon"] = "killhouse_gaz_largerweapon";
    level.scr_sound["gaz"]["youknewthat"] = "killhouse_gaz_youknewthat";
    level.scr_sound["gaz"]["movingon"] = "killhouse_gaz_movingon";
    level.scr_sound["gaz"]["targetspop"] = "killhouse_gaz_targetspop";
    level.scr_sound["gaz"]["hitall"] = "killhouse_gaz_hitall";
    level.scr_sound["gaz"]["cansnap"] = "killhouse_gaz_cansnap";
    level.scr_sound["gaz"]["tryagain"] = "killhouse_gaz_tryagain";
    level.scr_sound["gaz"]["stilltooslow"] = "killhouse_gaz_stilltooslow";
    level.scr_sound["gaz"]["again"] = "killhouse_gaz_again";
    level.scr_sound["gaz"]["again2"] = "killhouse_gaz_again2";
    level.scr_sound["gaz"]["walkinpark"] = "killhouse_gaz_walkinpark";
    level.scr_sound["gaz"]["propergood"] = "killhouse_gaz_propergood";
    level.scr_sound["gaz"]["getsidearm"] = "killhouse_gaz_getsidearm";
    level.scr_sound["gaz"]["switchtorifle"] = "killhouse_gaz_switchtorifle";
    level.scr_sound["gaz"]["pulloutsidearm"] = "killhouse_gaz_pulloutsidearm";
    level.scr_sound["gaz"]["switchback"] = "killhouse_gaz_switchback";
    level.scr_sound["gaz"]["drawsidearm"] = "killhouse_gaz_drawsidearm";
    level.scr_sound["gaz"]["switchsidearm"] = "killhouse_gaz_switchsidearm";
    level.scr_sound["gaz"]["switchingfaster"] = "killhouse_gaz_switchingfaster";
    level.scr_sound["gaz"]["shortofelephant"] = "killhouse_gaz_shortofelephant";
    level.scr_sound["gaz"]["comethisway"] = "killhouse_gaz_comethisway";
    level.scr_sound["gaz"]["fewfeet"] = "killhouse_gaz_fewfeet";
    level.scr_sound["gaz"]["whatdoyoudo"] = "killhouse_gaz_whatdoyoudo";
    level.scr_sound["gaz"]["attackwithknife"] = "killhouse_gaz_attackwithknife";
    level.scr_sound["gaz"]["attackwithknife"] = "Killhouse_gaz_knifemelon";
    level.scr_sound["gaz"]["fruitkilling"] = "killhouse_gaz_fruitkilling";
    level.scr_sound["gaz"]["followme"] = "killhouse_gaz_followme";
    level.scr_sound["gaz"]["herebymelon"] = "killhouse_gaz_herebymelon";
    level.scr_sound["gaz"]["therebymelon"] = "killhouse_gaz_therebymelon";
    level.scr_sound["gaz"]["allgoodhere"] = "killhouse_gaz_allgoodhere";
    level.scr_sound["nwc"]["timeforfun"] = "killhouse_nwc_timeforfun";
    level.scr_sound["nwc"]["pickupfrag"] = "killhouse_nwc_pickupfrag";
    level.scr_sound["nwc"]["getinsafety"] = "killhouse_nwc_getinsafety";
    level.scr_sound["nwc"]["getbackin"] = "killhouse_nwc_getbackin";
    level.scr_sound["nwc"]["stayinpit"] = "killhouse_nwc_stayinpit";
    level.scr_sound["nwc"]["throwgrenade"] = "killhouse_nwc_throwgrenade";
    level.scr_sound["nwc"]["23and4"] = "killhouse_nwc_23and4";
    level.scr_sound["nwc"]["2and3"] = "killhouse_nwc_2and3";
    level.scr_sound["nwc"]["2and4"] = "killhouse_nwc_2and4";
    level.scr_sound["nwc"]["3and4"] = "killhouse_nwc_3and4";
    level.scr_sound["nwc"]["window2"] = "killhouse_nwc_window2";
    level.scr_sound["nwc"]["window3"] = "killhouse_nwc_window3";
    level.scr_sound["nwc"]["window4"] = "killhouse_nwc_window4";
    level.scr_sound["nwc"]["getsomemore"] = "killhouse_nwc_getsomemore";
    level.scr_sound["nwc"]["moregrenades"] = "killhouse_nwc_moregrenades";
    level.scr_sound["nwc"]["aimabovetarget"] = "killhouse_nwc_aimabovetarget";
    level.scr_sound["nwc"]["whereyougoing"] = "killhouse_nwc_whereyougoing";
    level.scr_sound["nwc"]["comebackidiot"] = "killhouse_nwc_comebackidiot";
    level.scr_sound["nwc"]["moremojo"] = "killhouse_nwc_moremojo";
    level.scr_sound["nwc"]["pickuplauncher"] = "killhouse_nwc_pickuplauncher";
    level.scr_sound["nwc"]["launcherfromtable"] = "killhouse_nwc_launcherfromtable";
    level.scr_sound["nwc"]["icononhud"] = "killhouse_nwc_icononhud";
    level.scr_sound["nwc"]["nowbacktopit"] = "killhouse_nwc_nowbacktopit";
    level.scr_sound["nwc"]["equiplauncher"] = "killhouse_nwc_equiplauncher";
    level.scr_sound["nwc"]["firewall1"] = "killhouse_nwc_firewall1";
    level.scr_sound["nwc"]["didntexplode"] = "killhouse_nwc_didntexplode";
    level.scr_sound["nwc"]["safearming"] = "killhouse_nwc_safearming";
    level.scr_sound["nwc"]["wontexplode"] = "killhouse_nwc_wontexplode";
    level.scr_sound["nwc"]["56and7"] = "killhouse_nwc_56and7";
    level.scr_sound["nwc"]["switchaway"] = "killhouse_nwc_switchaway";
    level.scr_sound["nwc"]["c4offtable"] = "killhouse_nwc_c4offtable";
    level.scr_sound["nwc"]["pickupc4"] = "killhouse_nwc_pickupc4";
    level.scr_sound["nwc"]["followme2"] = "killhouse_nwc_followme2";
    level.scr_sound["nwc"]["c4icon"] = "killhouse_nwc_c4icon";
    level.scr_sound["nwc"]["dpadicon"] = "killhouse_nwc_dpadicon";
    level.scr_sound["nwc"]["dpadicons"] = "killhouse_nwc_dpadicons";
    level.scr_sound["nwc"]["hudinventory"] = "killhouse_nwc_hudinventory";
    level.scr_sound["nwc"]["equipwillchange"] = "killhouse_nwc_equipwillchange";
    level.scr_sound["nwc"]["equipc4"] = "killhouse_nwc_equipc4";
    level.scr_sound["nwc"]["hudchanges"] = "killhouse_nwc_hudchanges";
    level.scr_sound["nwc"]["exwifecar"] = "killhouse_nwc_exwifecar";
    level.scr_sound["nwc"]["exwifeantique"] = "killhouse_nwc_exwifeantique";
    level.scr_sound["nwc"]["placec4"] = "killhouse_nwc_placec4";
    level.scr_sound["nwc"]["throwc4"] = "killhouse_nwc_throwc4";
    level.scr_sound["nwc"]["throwc4car"] = "killhouse_nwc_throwc4car";
    level.scr_sound["nwc"]["c4furniture"] = "killhouse_nwc_c4furniture";
    level.scr_sound["nwc"]["morec4"] = "killhouse_nwc_morec4";
    level.scr_sound["nwc"]["behindwall"] = "killhouse_nwc_behindwall";
    level.scr_sound["nwc"]["safedistance"] = "killhouse_nwc_safedistance";
    level.scr_sound["nwc"]["fireinhole"] = "killhouse_nwc_fireinhole";
    level.scr_sound["nwc"]["chuckle"] = "killhouse_nwc_chuckle";
    level.scr_sound["nwc"]["muchimproved"] = "killhouse_nwc_muchimproved";
    level.scr_sound["nwc"]["passedeval"] = "killhouse_nwc_passedeval";
    level.scr_sound["nwc"]["reporttomac"] = "killhouse_nwc_reporttomac";
    level.scr_sound["nwc"]["justbetween"] = "killhouse_nwc_justbetween";
    level.scr_sound["nwc"]["thrilledtosee"] = "killhouse_nwc_thrilledtosee";
    level.scr_sound["nwc"]["goodluck"] = "killhouse_nwc_goodluck";
    level.scr_sound["mac"]["misssoap"] = "killhouse_mcm_misssoap";
    level.scr_sound["mac"]["lineup"] = "killhouse_mcm_lineup";
    level.scr_sound["mac"]["go"] = "killhouse_mcm_go";
    level.scr_sound["mac"]["jumpobstacles"] = "killhouse_mcm_jumpobstacles";
    level.scr_sound["mac"]["isntcharitywalk"] = "killhouse_mcm_isntcharitywalk";
    level.scr_sound["mac"]["commandos"] = "killhouse_mcm_commandos";
    level.scr_sound["mac"]["bertud"] = "killhouse_mcm_bertud";
    level.scr_sound["mac"]["youcrawllike"] = "killhouse_mcm_youcrawllike";
    level.scr_sound["mac"]["passedtest"] = "killhouse_mcm_passedtest";
    level.scr_sound["mac"]["runitagain"] = "killhouse_mcm_runitagain";
    level.scr_sound["sas2"]["fingy"] = "killhouse_sas2_fingy";
    level.scr_sound["price"]["ropedeck"] = "killhouse_pri_ropedeck";
    level.scr_sound["price"]["stormstairs"] = "killhouse_pri_stormstairs";
    level.scr_sound["price"]["hit3and4"] = "killhouse_pri_hit3and4";
    level.scr_sound["price"]["gogogo"] = "killhouse_pri_gogogo";
    level.scr_sound["price"]["hittargets"] = "killhouse_pri_hittargets";
    level.scr_sound["price"]["position2"] = "killhouse_pri_position2";
    level.scr_sound["price"]["flashthrudoor"] = "killhouse_pri_flashthrudoor";
    level.scr_sound["price"]["position3"] = "killhouse_pri_position3";
    level.scr_sound["price"]["hittargets"] = "killhouse_pri_hittargets";
    level.scr_sound["price"]["position4"] = "killhouse_pri_position4";
    level.scr_sound["price"]["hittargets"] = "killhouse_pri_hittargets";
    level.scr_sound["price"]["startover"] = "killhouse_pri_startover";
    level.scr_sound["price"]["doitagain"] = "killhouse_pri_doitagain";
    level.scr_sound["price"]["goodjob"] = "killhouse_pri_goodjob";
    level.scr_sound["price"]["pickupmp5"] = "killhouse_pri_pickupmp5";
    level.scr_sound["price"]["markcompass"] = "killhouse_pri_markcompass";
    level.scr_sound["price"]["grabrope"] = "killhouse_pri_grabrope";
    level.scr_sound["price"]["waitsignal"] = "killhouse_pri_waitsignal";
    level.scr_sound["price"]["soap4flash"] = "killhouse_pri_soap4flash";
    level.scr_sound["price"]["replaceflash"] = "killhouse_pri_replaceflash";
    level.scr_sound["price"]["getflash"] = "killhouse_pri_getflash";
    level.scr_sound["price"]["moreflash"] = "killhouse_pri_moreflash";
    level.scr_sound["price"]["soapequipmp5"] = "killhouse_pri_soapequipmp5";
    level.scr_sound["price"]["equipmp5"] = "killhouse_pri_equipmp5";
    level.scr_sound["price"]["missgoback"] = "killhouse_pri_missgoback";
    level.scr_sound["price"]["passgoback"] = "killhouse_pri_passgoback";
    level.scr_sound["price"]["goback"] = "killhouse_pri_goback";
    level.scr_sound["price"]["flashroomfirst"] = "killhouse_pri_flashroomfirst";
    level.scr_sound["price"]["notthatgood"] = "killhouse_pri_notthatgood";
    level.scr_sound["price"]["seenbetter"] = "killhouse_pri_seenbetter";
    level.scr_sound["price"]["anothergo"] = "killhouse_pri_anothergo";
    level.scr_sound["price"]["debrief"] = "killhouse_pri_debrief";
    level.scr_sound["price"]["newrecord"] = "killhouse_pri_newrecord";
    level.scr_sound["price"]["5go"] = "killhouse_pri_5go";
    level.scr_sound["price"]["6go"] = "killhouse_pri_6go";
    level.scr_sound["price"]["finalgo"] = "killhouse_pri_finalgo";
    level.scr_sound["price"]["flashroom"] = "killhouse_pri_flashroom";
    level.scr_sound["price"]["flashintoroom"] = "killhouse_pri_flashintoroom";
    level.scr_sound["price"]["missedflash"] = "killhouse_pri_missedflash";
    level.scr_sound["price"]["youmissed"] = "killhouse_pri_youmissed";
    level.scr_sound["price"]["followarrows"] = "killhouse_pri_followarrows";
    level.scr_sound["price"]["2"] = "killhouse_pri_2position";
    level.scr_sound["price"]["3"] = "killhouse_pri_3position";
    level.scr_sound["price"]["4"] = "killhouse_pri_4";
    level.scr_sound["price"]["5"] = "killhouse_pri_5";
    level.scr_sound["price"]["finalposition"] = "killhouse_pri_finalposition";
    level.scr_sound["price"]["shoottarget"] = "killhouse_pri_shoottarget";
    level.scr_sound["price"]["remainingtarg"] = "killhouse_pri_remainingtarg";
    level.scr_sound["price"]["hitother"] = "killhouse_pri_hitother";
}

#using_animtree("animated_props");

anim_props()
{
    level.anim_prop_models["foliage_sequoia_tree_cut_12_animated"]["still"] = %foliage_sequoia_cut_12_still;
    level.anim_prop_models["foliage_sequoia_tree_cut_12_animated"]["strong"] = %foliage_sequoia_cut_12_sway;
    level.anim_prop_models["foliage_sequoia_tree_cut_12_animated"]["heli"] = %foliage_sequoia_cut_12_heliwash;
    level.anim_prop_models["h1_foliage_jr_pine_01_animated"]["still"] = %jr_pine_01_still;
    level.anim_prop_models["h1_foliage_jr_pine_01_animated"]["strong"] = %jr_pine_01_sway;
    level.anim_prop_models["h1_foliage_jr_pine_01_animated"]["heli"] = %jr_pine_01_heliwash;
    level.anim_prop_models["h1_foliage_jr_pine_02_animated"]["still"] = %jr_pine_02_still;
    level.anim_prop_models["h1_foliage_jr_pine_02_animated"]["strong"] = %jr_pine_02_sway;
    level.anim_prop_models["h1_foliage_jr_pine_02_animated"]["heli"] = %jr_pine_02_heliwash;
}

#using_animtree("chair");

anim_chair()
{
    level.scr_anim["chair"]["chair_turnaround"] = %h1_killhouse_laptopguy_chair_turnaround;
    level.scr_anim["chair"]["chair_idle"] = %h1_killhouse_laptopguy_chair_idle;
    level.scr_anim["chair"]["chair_counting"] = %h1_killhouse_laptopguy_chair_counting;
    level.scr_animtree["chair"] = #animtree;
    level.scr_model["chair"] = "h1_mwr_com_office_chair_black";
}

#using_animtree("generic_human");

play_idle_facial_anim( var_0 )
{
    if ( !isdefined( var_0 ) )
        var_0 = randomint( anim.facial["idle"].size );

    self setanimknoballrestart( anim.facial["idle"][var_0], %head, 1 );
    self setanimlimited( %head, 1 );
    wait(getanimlength( anim.facial["idle"][var_0] ));
}

gaz_face_think( var_0 )
{
    level waittill( "navigationTraining_end" );
    level endon( "out_of_firing_range" );

    for (;;)
    {
        if ( var_0.speaking == 1 )
        {
            wait 0.1;
            var_0 setanimknoballlimited( %facial_idle_1, %head, 0.1, 0.1 );
            var_0 setanimlimited( %head, 0.11, 0.1 );
            continue;
        }

        if ( var_0.speaking == 0 )
        {
            var_0 setanimknoballlimitedrestart( %facial_idle_1, %head, 0.8 );
            var_0 setanimlimited( %head, 0.8 );

            for (;;)
            {
                if ( var_0.speaking == 1 )
                    break;
                else
                    wait 0.2;
            }
        }
    }
}

newcastle_face_think( var_0 )
{
    level endon( "explosivesTraining_end" );

    for (;;)
    {
        if ( var_0.speaking )
        {
            wait 0.4;
            var_0 setanimknoballlimited( %h1_killhouse_nwc_idle_facial, %newcastle_face, 0.1, 0.4 );
            var_0 setanimlimited( %newcastle_face, 0.1, 0.4 );
            continue;
        }

        var_0 setanimknoballlimitedrestart( %h1_killhouse_nwc_idle_facial, %newcastle_face, 0.8 );
        var_0 setanimlimited( %newcastle_face, 0.8 );

        for (;;)
        {
            if ( var_0.speaking == 1 )
                break;

            wait 0.8;
        }
    }
}
