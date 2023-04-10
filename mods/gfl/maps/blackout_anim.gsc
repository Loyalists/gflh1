// H1 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

#using_animtree("generic_human");

main()
{
    setup_exploder_anims();
    exploder_script_model_anims();
    maps\_props::add_smoking_notetracks( "generic" );
    maps\_props::add_cellphone_notetracks( "generic" );
    maps\_hand_signals::inithandsignals();
    level.scr_anim["generic"]["rappel_end"] = %sniper_escape_rappel_finish;
    level.scr_anim["generic"]["rappel_start"] = %blackout_rappel_start;
    level.scr_anim["generic"]["rappel_idle"][0] = %sniper_escape_rappel_idle;
    level.scr_anim["generic"]["grenade_throw"] = %corner_standl_grenade_b;
    level.scr_anim["generic"]["moveout_cqb"] = %cqb_stand_signal_move_out;
    level.scr_anim["generic"]["moveup_cqb"] = %cqb_stand_signal_move_up;
    level.scr_anim["generic"]["stop_cqb"] = %cqb_stand_signal_stop;
    level.scr_anim["generic"]["onme_cqb"] = %cqb_stand_wave_on_me;
    level.scr_anim["generic"]["signal_go_cqb"] = %cqb_stand_wave_go_v1;
    level.scr_anim["generic"]["moveout_exposed"] = %stand_exposed_wave_move_out;
    level.scr_anim["generic"]["moveup_exposed"] = %stand_exposed_wave_move_up;
    level.scr_anim["generic"]["stop_exposed"] = %stand_exposed_wave_halt;
    level.scr_anim["generic"]["stop2_exposed"] = %stand_exposed_wave_halt_v2;
    level.scr_anim["generic"]["onme_exposed"] = %stand_exposed_wave_on_me;
    level.scr_anim["generic"]["onme2_exposed"] = %stand_exposed_wave_on_me_v2;
    level.scr_anim["generic"]["enemy_exposed"] = %stand_exposed_wave_target_spotted;
    level.scr_anim["generic"]["down_exposed"] = %stand_exposed_wave_down;
    level.scr_anim["generic"]["go_exposed"] = %stand_exposed_wave_go;
    level.scr_anim["generic"]["walk_1"] = %patrolwalk_tired;
    level.scr_anim["generic"]["walk_2"] = %patrol_bored_patrolwalk;
    level.scr_anim["generic"]["walk_3"] = %patrolwalk_bounce;
    level.scr_anim["generic"]["walk_4"] = %patrolwalk_swagger;
    level.scr_anim["generic"]["walk_5"] = %walk_lowready_f;
    level.scr_anim["kamarov"]["binoc_idle"][0] = %blackout_binoc_idle;
    level.scr_model["binocs"] = "weapon_binocular";
    level.scr_anim["gaz"]["powercut"] = %h1_blackout_gaz_powercut;
    level.scr_sound["gaz"]["powercut_dialog"] = "blackout_gaz_ivecutthepower";
    maps\_anim::addnotetrack_customfunction( "gaz", "dialog", maps\blackout_code::gaz_play_powercut_generic_facial_anim, "powercut" );
    level.scr_anim["gaz"]["powercut_idle"][0] = %h1_blackout_gaz_powercut_idle;
    maps\_anim::addnotetrack_flag( "price", "start_gaz", "start_cliff_scene_gaz" );
    maps\_anim::addnotetrack_flag( "price", "start_kam", "start_cliff_scene_kamarov" );
    maps\_anim::addnotetrack_flag( "kamarov", "drop binoculars", "kamarov_drops_binocs" );
    level.scr_anim["gaz"]["open_blackout_door"] = %h1_blackout_gaz_open_blackout_door;

    if ( getdvarint( "use_old_rappel_fight" ) == 1 )
    {
        level.scr_anim["price"]["cliff_start"] = %blackout_price_cliff;
        level.scr_anim["kamarov"]["cliff_start"] = %blackout_kam_cliff;
        level.scr_anim["gaz"]["cliff_start"] = %blackout_gaz_cliff;
        level.scr_anim["kamarov"]["cliff_start_idle"][0] = %blackout_kam_start;
        level.scr_anim["gaz"]["cliff_start_idle"][0] = %blackout_gaz_cliff_start;
        level.scr_anim["kamarov"]["cliff_end_idle"][0] = %blackout_kam_cliff_endidle;
    }
    else
    {
        level.scr_anim["kamarov"]["cliff_runin"] = %h1_blackout_kam_cliff_runin;
        level.scr_anim["price"]["cliff_runin"] = %h1_blackout_price_cliff_runin;
        level.scr_anim["gaz"]["cliff_runin"] = %h1_blackout_gaz_cliff_runin;
        level.scr_anim["kamarov"]["cliff_prestart"] = %h1_blackout_kam_cliff_gunaway;

        if ( getdvarint( "loc_language", 99 ) == 0 )
            level.scr_face["kamarov"]["final_assault"] = %h1_blackout_kamarov_cliff_start_dialog_facial;

        level.scr_anim["price"]["cliff_start"] = %h1_blackout_price_cliff;
        level.scr_anim["kamarov"]["cliff_start"] = %h1_blackout_kam_cliff;
        level.scr_anim["gaz"]["cliff_start"] = %h1_blackout_gaz_cliff;
        level.scr_anim["price"]["cliff_start_idle"][0] = %h1_blackout_price_cliff_start;
        level.scr_anim["kamarov"]["cliff_start_idle"][0] = %h1_blackout_kam_start;
        level.scr_anim["gaz"]["cliff_start_idle"][0] = %h1_blackout_gaz_cliff_start;
        level.scr_anim["kamarov"]["cliff_end_idle"][0] = %h1_blackout_kam_cliff_endidle;
        maps\_anim::addnotetrack_dialogue( "gaz", "dialog", "cliff_start", "blackout_gaz_enoughsniping" );
        maps\_anim::addnotetrack_dialogue( "kamarov", "dialog", "cliff_start", "blackout_kmr_outofmind" );
        maps\_anim::addnotetrack_dialogue( "gaz", "dialog", "cliff_start", "blackout_gaz_whereishe" );
        maps\_anim::addnotetrack_dialogue( "kamarov", "dialog", "cliff_start", "blackout_kmr_thehouse" );
        maps\_anim::addnotetrack_dialogue( "gaz", "dialog", "cliff_start", "blackout_gaz_thatwasntsohard" );
        maps\_anim::addnotetrack_dialogue( "price", "dialog", "cliff_start", "blackout_pri_reachthathouse" );
    }

    if ( getdvarint( "use_old_meeting" ) == 1 )
    {
        level.scr_anim["price"]["meeting"] = %blackout_meeting_price;
        level.scr_anim["kamarov"]["meeting"] = %blackout_meeting_kamarov;
    }
    else
    {
        level.scr_anim["price"]["meeting"] = %h1_blackout_meeting_price;
        level.scr_anim["kamarov"]["meeting"] = %h1_blackout_meeting_kamarov;
        level.scr_anim["kamarov"]["meeting_idle"][0] = %h1_blackout_meeting_kamarov_idle;
        level.scr_anim["gaz"]["meeting"] = %h1_blackout_meeting_gaz;
        maps\_anim::addnotetrack_dialogue( "gaz", "dialog", "meeting", "blackout_gaz_bloodyrightyoudo" );
    }

    maps\_anim::addnotetrack_animsound( "kamarov", "cliff_start", "scn_blackout_kam_cliff", "scn_blackout_kam_cliff" );
    maps\_anim::addnotetrack_animsound( "gaz", "cliff_start", "scn_blackout_gaz_cliff", "scn_blackout_gaz_cliff" );
    maps\_anim::addnotetrack_animsound( "price", "meeting", "scn_blackout_price_meeting", "scn_blackout_price_meeting" );
    maps\_anim::addnotetrack_animsound( "kamarov", "meeting", "scn_blackout_kam_meeting", "scn_blackout_kam_meeting" );
    maps\_anim::addnotetrack_animsound( "kamarov", "meeting", "scn_blackout_kam_meeting_step", "scn_blackout_kam_meeting_step" );
    maps\_anim::addnotetrack_animsound( "gaz", "meeting", "scn_blackout_gaz_meeting", "scn_blackout_gaz_meeting" );
    maps\_anim::addnotetrack_dialogue( "price", "dialog", "meeting", "blackout_pri_whattarget" );
    maps\_anim::addnotetrack_dialogue( "price", "dialog", "meeting", "blackout_pri_beirut" );
    level.scr_sound["price"]["move_out"] = "blackout_pri_moveout";
    maps\_anim::addnotetrack_dialogue( "kamarov", "dialog", "meeting", "blackout_kmr_welcome" );
    maps\_anim::addnotetrack_dialogue( "kamarov", "dialog", "meeting", "blackout_kmr_valleybelow" );
    maps\_anim::addnotetrack_dialogue( "kamarov", "dialog", "meeting", "blackout_kmr_oweyouone" );
    level.scr_anim["frnd"]["signal_assault_coverstand"] = %coverstand_hide_idle_wave02;
    level.scr_anim["frnd"]["signal_forward_coverstand"] = %coverstand_hide_idle_wave01;
    level.scr_anim["generic"]["surprise_1"] = %parabolic_chessgame_surprise_a;
    level.scr_anim["generic"]["surprise_2"] = %parabolic_chessgame_surprise_b;
    level.scr_anim["generic"]["idle_1"][0] = %parabolic_chessgame_idle_a;
    level.scr_anim["generic"]["idle_2"][0] = %parabolic_chessgame_idle_b;
    level.scr_anim["chess_guy1"]["death"] = %parabolic_chessgame_death_a;
    level.scr_anim["chess_guy2"]["death"] = %parabolic_chessgame_death_b;
    level.scr_anim["kamarov"]["overlook_gunaway"] = %h1_blackout_kamarov_overlook_gunaway;
    level.scr_anim["kamarov"]["overlook_idle"][0] = %h1_blackout_kamarov_overlook_idle;
    level.scr_anim["kamarov"]["walk_burning_house"] = %h1_blackout_burninghouse_kamarov;
    level.scr_sound["kamarov"]["walk_burning_house"] = "scn_kam_burninghouse_kick";
    level.scr_anim["kamarov"]["walk_burning_house_idle"][0] = %h1_blackout_burninghouse_kamarov_idle;
    level.scr_anim["price"]["walk_burning_house"] = %h1_blackout_burninghouse_price;
    level.scr_anim["price"]["walk_burning_house_idle"][0] = %h1_blackout_burninghouse_price_idle;
    level.scr_anim["gaz"]["walk_burning_house"] = %h1_blackout_burninghouse_gaz;
    level.scr_anim["gaz"]["walk_burning_house_idle"][0] = %h1_blackout_burninghouse_gaz_idle;

    if ( getdvarint( "use_old_evac" ) == 1 )
    {
        level.scr_anim["vip"]["evac"] = %blackout_bh_evac_1;
        level.scr_anim["gaz"]["evac"] = %blackout_bh_evac_2;
        level.scr_anim["price"]["evac"] = %blackout_bh_evac_price;
        level.scr_anim["price"]["evac_flyaway"] = %blackout_bh_evac_price_flyaway;
        level.scr_anim["price"]["evac_idle"][0] = %blackout_bh_evac_price_idle;
    }
    else
    {
        level.scr_anim["vip"]["evac"] = %h1_blackout_bh_evac_1;
        level.scr_anim["gaz"]["evac"] = %h1_blackout_bh_evac_2;
        level.scr_anim["price"]["evac"] = %h1_blackout_bh_evac_price;
        level.scr_anim["price"]["evac_flyaway"] = %h1_blackout_bh_evac_price_flyaway;
        level.scr_anim["price"]["evac_idle"][0] = %h1_blackout_bh_evac_price_idle;
        maps\_anim::addnotetrack_animsound( "vip", "evac", "scn_vip_evac_foley", "scn_vip_evac_foley" );
    }

    maps\_anim::addnotetrack_dialogue( "vip", "dialog", "evac", "blackout_nkd_americansattacked" );
    maps\_anim::addnotetrack_dialogue( "vip", "dialog", "evac", "blackout_nkd_makingamistake" );
    maps\_anim::addnotetrack_dialogue( "price", "dialog", "evac_flyaway", "blackout_pri_invasion" );

    if ( getdvarint( "use_old_nikolai_rescue" ) == 1 )
    {
        level.scr_anim["price"]["rescue"] = %blackout_rescue_price;
        maps\_anim::addnotetrack_customfunction( "price", "dialog", maps\blackout_code::vip_rescue_dialogue, "rescue" );
        level.scr_anim["vip"]["idle"][0] = %blackout_vip_cower_idle;
        level.scr_anim["vip"]["rescue"] = %blackout_rescue_vip;
        level.scr_sound["vip"]["rescue"] = "scn_blackout_vip_rescue";
        level.scr_anim["flashlight_guy"]["fl_death"] = %blackout_flashlightguy_death_only;
        level.scr_anim["flashlight_guy"]["fl_death_local"] = %blackout_flashlightguy_death_local;
        level.scr_anim["flashlight_guy"]["search"] = %blackout_flashlightguy_moment2death;
    }
    else
    {
        level.scr_anim["price"]["rescue"] = %h1_blackout_rescue_price;
        maps\_anim::addnotetrack_customfunction( "price", "dialog", maps\blackout_code::vip_rescue_dialogue, "rescue" );
        level.scr_anim["vip"]["idle"][0] = %h1_blackout_vip_cower_idle;
        level.scr_anim["vip"]["rescue"] = %h1_blackout_rescue_vip;
        level.scr_sound["vip"]["rescue"] = "scn_blackout_vip_rescue";
        level.scr_anim["flashlight_guy"]["fl_death"] = %h1_blackout_flashlightguy_death_only;
        level.scr_anim["flashlight_guy"]["fl_death_local"] = %blackout_flashlightguy_death_local;
        level.scr_anim["flashlight_guy"]["search"] = %h1_blackout_flashlightguy_moment2death;
        level.scr_anim["flashlight_guy"]["fire_loop"][0] = %h1_blackout_flashlightguy_loop;
        maps\_anim::addnotetrack_animsound( "price", "rescue", "scn_price_rescue_get_flashlight", "scn_price_rescue_get_flashlight" );
        maps\_anim::addnotetrack_animsound( "price", "rescue", "scn_price_rescue_get_vip", "scn_price_rescue_get_vip" );
        maps\_anim::addnotetrack_animsound( "price", "rescue", "scn_price_rescue_get_weapon", "scn_price_rescue_get_weapon" );
    }

    maps\_anim::addnotetrack_customfunction( "flashlight_guy", "fire", maps\blackout_code::flashlight_fire );
    level.scr_anim["generic"]["casual_patrol_jog"] = %patrol_jog;
    level.scr_anim["generic"]["casual_patrol_walk"] = %patrolwalk_tired;
    level.scr_anim["generic"]["combat_jog"] = %combat_jog;
    level.scr_anim["generic"]["smoke"] = %patrol_bored_idle_smoke;
    level.scr_anim["generic"]["smoke_idle"][0] = %patrol_bored_idle_smoke;
    level.scr_anim["generic"]["moveout_cqb"] = %cqb_stand_signal_move_out;
    level.scr_anim["generic"]["moveup_cqb"] = %cqb_stand_signal_move_up;
    level.scr_anim["generic"]["stop_cqb"] = %cqb_stand_signal_stop;
    level.scr_anim["generic"]["onme_cqb"] = %cqb_stand_wave_on_me;
    level.scr_anim["generic"]["signal_moveup"] = %cqb_stand_signal_move_up;
    level.scr_anim["generic"]["signal_onme"] = %cqb_stand_wave_on_me;
    level.scr_anim["generic"]["signal_go"] = %cqb_stand_wave_go_v1;
    level.scr_anim["generic"]["signal_stop"] = %cqb_stand_signal_stop;
    level.scr_anim["generic"]["bored_idle_reach"] = %patrol_bored_idle;
    level.scr_anim["generic"]["bored_idle"][0] = %patrol_bored_idle;
    level.scr_anim["generic"]["bored_idle"][1] = %patrol_bored_twitch_bug;
    level.scr_anim["generic"]["bored_idle"][2] = %patrol_bored_twitch_stretch;
    level.scr_anim["generic"]["bored_alert"] = %exposed_idle_twitch_v4;
    level.scr_anim["generic"]["bored_smoke"] = %patrol_bored_idle_smoke;
    level.scr_anim["generic"]["bored_cell"] = %patrol_bored_idle_cellphone;
    level.scr_anim["generic"]["bored_salute"] = %patrol_bored_twitch_salute;
    level.scr_anim["generic"]["bored_checkphone"] = %patrol_bored_twitch_checkphone;
    level.scr_anim["generic"]["bored_cell_loop"][0] = %patrol_bored_idle_cellphone;
    level.scr_anim["generic"]["sleep_idle"][0] = %parabolic_guard_sleeper_idle;
    level.scr_anim["generic"]["sleep_react"] = %parabolic_guard_sleeper_react_v2;
    level.scr_anim["generic"]["stealth_jog"] = %patrol_jog;
    level.scr_anim["generic"]["stealth_walk"] = %patrol_bored_patrolwalk;
    level.scr_anim["generic"]["combat_jog"] = %combat_jog;
    level.scr_anim["generic"]["prone_to_stand_1"] = %hunted_pronehide_2_stand_v1;
    level.scr_anim["generic"]["prone_to_stand_2"] = %hunted_pronehide_2_stand_v2;
    level.scr_anim["generic"]["prone_to_stand_3"] = %hunted_pronehide_2_stand_v3;
    level.scr_anim["generic"]["smoking_reach"] = %parabolic_leaning_guy_smoking_idle;
    level.scr_anim["generic"]["smoking"][0] = %parabolic_leaning_guy_smoking_idle;
    level.scr_anim["generic"]["smoking"][1] = %parabolic_leaning_guy_smoking_twitch;
    level.scr_anim["generic"]["smoking_react"] = %parabolic_leaning_guy_react;
    level.scr_anim["generic"]["prone_dive"] = %hunted_dive_2_pronehide_v1;
    level.scr_anim["generic"]["_stealth_behavior_whizby_0"] = %exposed_idle_reacta;
    level.scr_anim["generic"]["_stealth_behavior_whizby_1"] = %exposed_idle_reactb;
    level.scr_anim["generic"]["_stealth_behavior_whizby_2"] = %exposed_idle_twitch;
    level.scr_anim["generic"]["_stealth_behavior_whizby_3"] = %exposed_idle_twitch_v4;
    level.scr_anim["generic"]["_stealth_behavior_whizby_4"] = %run_pain_stumble;
    level.scr_anim["generic"]["_stealth_behavior_spotted_short"] = %exposed_idle_twitch_v4;
    level.scr_anim["generic"]["_stealth_behavior_spotted_long"] = %exposed_idle_twitch_v4;
    level.scr_anim["generic"]["_stealth_behavior_heard_scream"] = %exposed_idle_twitch_v4;
    level.scr_anim["generic"]["patrol_walk"] = %patrol_bored_patrolwalk;
    level.scr_anim["generic"]["patrol_walk_twitch"] = %patrol_bored_patrolwalk_twitch;
    level.scr_anim["generic"]["patrol_stop"] = %patrol_bored_walk_2_bored;
    level.scr_anim["generic"]["patrol_start"] = %patrol_bored_2_walk;
    level.scr_anim["generic"]["patrol_turn180"] = %patrol_bored_2_walk_180turn;
    level.scr_anim["generic"]["blind_fire_pistol"] = %blackout_blind_fire_pistol;
    level.scr_anim["generic"]["blind_fire_pistol_death"] = %blackout_blind_fire_pistol_death;
    maps\_anim::addonstart_animsound( "generic", "blind_hide_fire", "blackout_ru1_scream" );
    level.scr_anim["generic"]["blind_hide_fire"] = %blackout_blind_hide_fire;
    level.scr_anim["generic"]["blind_hide_fire_death"] = %blackout_blind_hide_fire_death;
    maps\_anim::addonstart_animsound( "generic", "blind_lightswitch", "blackout_ru1_electrician" );
    level.scr_anim["generic"]["blind_lightswitch"] = %blackout_blind_lightswitch;
    level.scr_anim["generic"]["blind_lightswitch_death"] = %blackout_blind_lightswitch_death;
    maps\_anim::addnotetrack_sound( "generic", "switch_up", "blind_lightswitch", "scn_blackout_lightswitch_on" );
    maps\_anim::addnotetrack_sound( "generic", "switch_down", "blind_lightswitch", "scn_blackout_lightswitch_off" );
    maps\_anim::addonstart_animsound( "generic", "blind_wall_feel", "blackout_ru1_sasha" );
    level.scr_anim["generic"]["blind_wall_feel"] = %blackout_blind_wall_feel;
    level.scr_anim["generic"]["blind_wall_feel_death"] = %blackout_blind_wall_feel_death;
    level.scr_sound["generic"]["breathing"] = "blackout_ru4_breathing";
    level.scr_anim["generic"]["smooth_door_open"] = %hunted_open_barndoor_flathand;
    level.scr_anim["generic"]["standup"] = %exposed_crouch_2_stand;
    level.scr_sound["price"]["do_it"] = "villagedef_pri_doit";
    level.scr_sound["price"]["this_night_vision"] = "blackout_pri_nightvision";
    level.scr_sound["price"]["lets_go"] = "blackout_pri_letsgo2";
    level.scr_anim["price"]["captainpricebrief"] = %h1_blackout_captainpricebrief_price;
    level.scr_anim["gaz"]["captainpricebrief"] = %h1_blackout_captainpricebrief_gaz;
    level.scr_sound["price"]["expecting_us"] = "blackout_pri_halfaclick";

    if ( getdvarint( "use_old_captainprice_briefing" ) == 1 )
        level.scr_face["price"]["expecting_us"] = %blackout_price_facial_moveout;
    else
        maps\_anim::addnotetrack_dialogue( "price", "dialog", "captainpricebrief", "blackout_pri_halfaclick" );

    level.scr_sound["price"]["wont_shoot_us"] = "blackout_pri_shootatus";
    level.scr_sound["price"]["lets_get_to_it"] = "blackout_pri_gettoit";
    level.scr_sound["price"]["over_here"] = "blackout_pri_overhere";
    level.scr_sound["price"]["in_position"] = "blackout_pri_leftflank";
    level.scr_sound["price"]["machine_gunners_in_windows"] = "blackout_pri_takeoutmgs";
    level.scr_sound["price"]["not_a_problem"] = "blackout_pri_takecare";
    level.scr_sound["price"]["watch_bmp"] = "blackout_pri_watchbmp";
    level.scr_sound["price"]["go_go_go"] = "blackout_pri_gogogo";
    level.scr_sound["price"]["cover_cliff"] = "blackout_pri_edgeofcliff";
    level.scr_sound["price"]["nice_work"] = "blackout_pri_nicework";
    level.scr_sound["price"]["where_is_informant"] = "blackout_pri_ourbargain";
    level.scr_sound["price"]["lets_move"] = "blackout_pri_stillbealive";
    level.scr_sound["price"]["cut_the_power"] = "blackout_pri_cutpower";
    level.scr_sound["price"]["its_him"] = "blackout_pri_itshim";
    level.scr_sound["price"]["have_the_package"] = "blackout_pri_meetatlz";
    level.scr_sound["price"]["lets_go_lets_go"] = "blackout_pri_letsgo";
    level.scr_sound["gaz"]["loyalists_eh"] = "blackout_gaz_loyalistseh";
    level.scr_sound["gaz"]["good_enough"] = "blackout_gaz_goodenough";
    level.scr_sound["gaz"]["cover_left_flank"] = "blackout_gaz_leftflank";
    level.scr_sound["gaz"]["got_a_bmp"] = "blackout_gaz_opportunity";
    level.scr_sound["gaz"]["helicopter_troops"] = "blackout_gaz_helitroops";
    level.scr_sound["gaz"]["tangos_neutralized"] = "blackout_gaz_allclear";
    level.scr_sound["gaz"]["hate_bargaining"] = "blackout_gaz_maybealive";
    level.scr_sound["gaz"]["regroup_with_price"] = "blackout_gaz_regroupprice";
    level.scr_sound["gaz"]["are_you_all_right"] = "blackout_gaz_allright";
    level.scr_sound["price"]["gaz_do_it"] = "blackout_pri_gazdoit";
    level.scr_sound["gaz"]["i_cut_the_power"] = "blackout_gaz_ivecutthepower";
    level.scr_radio["on_our_way"] = "blackout_mhp_onourway";
    level.scr_sound["vip"]["yes_can_still_fight"] = "blackout_nkd_icanstillfight";
    level.scr_sound["kamarov"]["moving_into_position"] = "blackout_ru2_movingintoposition";
    level.scr_sound["kamarov"]["welcome_to_new_russia"] = "blackout_kmr_newrussia";
    level.scr_sound["kamarov"]["provide_sniper"] = "blackout_kmr_snipersupprt";
    level.scr_sound["kamarov"]["bm21s_on_other_side"] = "blackout_kmr_valleybelow";
    level.scr_sound["kamarov"]["give_informant_location"] = "blackout_kmr_givelocation";
    level.scr_sound["kamarov"]["this_way"] = "blackout_kmr_thisway";
    level.scr_sound["kamarov"]["prepare_to_attack"] = "blackout_kmr_prepareattack";
    level.scr_sound["kamarov"]["find_good_vantage"] = "blackout_kmr_beready";
    level.scr_sound["kamarov"]["standby_to_attack"] = "blackout_kmr_sniperteam";
    level.scr_sound["kamarov"]["commence_attack"] = "blackout_kmr_commence";
    level.scr_sound["kamarov"]["enemy_heli_circling"] = "blackout_kmr_holdthemoff";
    level.scr_radio["informant_held_in_house"] = "blackout_kmr_deadoralive";
    level.scr_sound["price"]["tango_down"] = "UK_pri_inform_killfirm_generic_s";
    level.scr_sound["gaz"]["tango_down"] = "UK_2_inform_killfirm_generic_s";
    new_dialogue();
    maps\_breach_explosive_left::main();
    script_models();
    player_rappel();
    blackhawk_anims();
    radio_prec();
    animated_model_setup();
}

#using_animtree("script_model");

script_models()
{
    level.scr_anim["chair"]["sleep_react"] = %parabolic_guard_sleeper_react_chair;
    level.scr_animtree["chair"] = #animtree;
    level.scr_model["chair"] = "com_folding_chair";
    maps\_anim::addnotetrack_customfunction( "chair", "scn_relaxed_guard_chair_death", ::play_relaxed_guard_chair_death, "sleep_react" );
    level.scr_animtree["rope"] = #animtree;
    level.scr_model["rope"] = "rappelrope100_ri";
    level.scr_anim["player_rope"]["rappel_for_player"] = %sniper_escape_player_start_rappelrope100;
    level.scr_animtree["player_rope"] = #animtree;
    level.scr_model["player_rope"] = "rappelrope100_le";
    level.scr_anim["rope"]["rappel_end"] = %sniper_escape_rappel_finish_rappelrope100;
    level.scr_anim["rope"]["rappel_start"] = %blackout_rappel_start_rappelrope100;
    level.scr_anim["rope"]["rappel_idle"][0] = %sniper_escape_rappel_idle_rappelrope100;

    if ( getdvarint( "use_old_nikolai_rescue" ) == 1 )
    {
        level.scr_anim["flashlight"]["rescue"] = %blackout_rescue_price_flashlight;
        level.scr_anim["flashlight"]["search"] = %blackout_flashlightguy_moment2death_flashlight;
        level.scr_sound["flashlight"]["search"] = "scn_blackout_drop_flashlight_draw";
        level.scr_anim["flashlight"]["fl_death"] = %blackout_flashlightguy_death_flashlight;
        level.scr_sound["flashlight"]["fl_death"] = "scn_blackout_drop_flashlight";
    }
    else
    {
        level.scr_anim["flashlight"]["rescue"] = %h1_blackout_rescue_price_flashlight;
        level.scr_anim["flashlight"]["search"] = %h1_blackout_flashlightguy_moment2death_flashlight;
        level.scr_sound["flashlight"]["search"] = "scn_blackout_drop_flashlight_draw";
        level.scr_anim["flashlight"]["fire_loop"][0] = %h1_blackout_flashlightguy_loop_flashlight;
        level.scr_anim["flashlight"]["fl_death"] = %h1_blackout_flashlightguy_death_flashlight;
        level.scr_sound["flashlight"]["fl_death"] = "scn_blackout_drop_flashlight";
    }

    level.scr_animtree["flashlight"] = #animtree;
    level.scr_model["flashlight"] = "com_flashlight_on";
    level.scr_anim["player_rope_obj"]["rappel_for_player"] = %sniper_escape_player_start_rappelrope100;
    level.scr_animtree["player_rope_obj"] = #animtree;
    level.scr_model["player_rope_obj"] = "rappelrope100_le_obj";
    level.scr_animtree["electrical_box_animated"] = #animtree;
    level.scr_model["electrical_box_animated"] = "me_electricbox4_dirty_rus_animated";
    level.scr_anim["electrical_box_animated"]["idle"][0] = %h1_blackout_electric_box_animated_1_idle;
    level.scr_anim["electrical_box_animated"]["powercut"] = %h1_blackout_electric_box_animated_2_cutting_power;
    level.scr_anim["electrical_box_animated"]["idle_cut"][0] = %h1_blackout_electric_box_animated_3_idle_cut;
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

play_relaxed_guard_chair_death( var_0 )
{
    var_0 thread common_scripts\utility::play_sound_in_space( "scn_relaxed_guard_chair_fall", var_0.origin + ( 0.0, 0.0, 30.0 ) );
}

#using_animtree("player");

player_rappel()
{
    level.scr_animtree["player_rig"] = #animtree;
    level.scr_model["player_rig"] = "h2_gfl_m4_sopmod_ii_viewbody";
    level.scr_anim["player_rig"]["rappel"] = %sniper_escape_player_rappel;

    if ( getdvarint( "use_old_evac" ) == 1 )
        level.scr_anim["player_rig"]["player_evac"] = %blackout_bh_evac_player;
    else
    {
        level.scr_animtree["evac_rig"] = #animtree;
        level.scr_model["evac_rig"] = "h2_gfl_m4_sopmod_ii_viewbody";
        level.scr_anim["evac_rig"]["player_evac"] = %h1_blackout_bh_evac_player;
    }
}

#using_animtree("vehicles");

blackhawk_anims()
{
    level.scr_anim["blackhawk"]["idle"][0] = %blackout_bh_evac_heli_idle;
    level.scr_anim["blackhawk"]["landing"] = %h1_blackout_bh_evac_heli_land;
    level.scr_anim["blackhawk"]["take_off"] = %blackout_bh_evac_heli_takeoff;
    maps\_anim::addnotetrack_customfunction( "blackhawk", "fade", ::blackout_missionsuccess );
    level.scr_anim["blackhawk"]["rotors"] = %bh_rotors;
    level.scr_animtree["blackhawk"] = #animtree;
}

blackout_missionsuccess( var_0 )
{
    maps\_utility::nextmission();
}

radio_prec()
{
    level.scr_radio["weapons_free"] = "cargoship_pri_weaponsfree";
    level.scr_radio["roger_that"] = "cargoship_grg_rogerthatradio";
    level.scr_radio["go!"] = "cargoship_pri_go";
    level.scr_radio["watch_for_movement"] = "cargoship_pri_watchmovement";
    level.scr_radio["whats_noise"] = "cargoship_grg_whatsnoise";
}

new_dialogue()
{
    level.scr_sound["price"]["guard_posts_ahead"] = "blackout_pri_guardpostsahead";
    level.scr_sound["price"]["smell_that"] = "blackout_pri_smellthatgaz";
    level.scr_sound["gaz"]["yeah_kam"] = "blackout_gaz_yeahkamarov";
    level.scr_sound["gaz"]["bloody_right"] = "blackout_gaz_bloodyrightyoudo";
    level.scr_sound["price"]["what_target"] = "blackout_pri_whattarget";
    level.scr_sound["kamarov"]["good_spot"] = "blackout_kmr_goodspot";
    level.scr_sound["price"]["switch_sniper"] = "blackout_pri_switchtosniper";
    level.scr_sound["price"]["mg_windows"] = "blackout_pri_mgwindows";
    level.scr_sound["price"]["mg_walls"] = "blackout_pri_mgwalls";
    level.scr_sound["price"]["other_mg_wall"] = "blackout_pri_othermgwall";
    level.scr_sound["price"]["mg_low"] = "blackout_pri_mglow";
    level.scr_sound["price"]["macmillan_impressed"] = "blackout_pri_impressed";
    level.scr_sound["kamarov"]["damn_helis"] = "blackout_kmr_damnhelis";
    level.scr_sound["price"]["you_didnt_say"] = "blackout_pri_youdidntsay";
    level.scr_sound["kamarov"]["need_protect"] = "blackout_kmr_needtoprotect";
    level.scr_sound["price"]["make_quick"] = "blackout_pri_makeitquick";
    level.scr_sound["kamarov"]["nothing_to_worry"] = "blackout_kmr_nothingtoworry";
    level.scr_sound["gaz"]["beat_it_out"] = "blackout_gaz_beatitoutofhim";
    level.scr_sound["price"]["not_yet"] = "blackout_pri_notyet";
    level.scr_sound["kamarov"]["stalling"] = "blackout_kmr_stalling";
    level.scr_sound["kamarov"]["heavy_resistance"] = "blackout_kmr_heavyresistance";
    level.scr_sound["price"]["our_informant"] = "blackout_pri_ourinformant";
    level.scr_sound["kamarov"]["then_help"] = "blackout_kmr_thenhelpus";
    level.scr_sound["kamarov"]["making_progress"] = "blackout_kmr_makingprogress";
    level.scr_sound["kamarov"]["final_assault"] = "blackout_kmr_finalassault";
    level.scr_sound["gaz"]["enough_sniping"] = "blackout_gaz_enoughsniping";
    level.scr_sound["kamarov"]["russian_out_of_mind"] = "blackout_kmr_outofmind";
    level.scr_sound["kamarov"]["english_out_of_mind"] = "blackout_kmr_areyououteng";
    level.scr_sound["gaz"]["where_is"] = "blackout_gaz_whereishe";
    level.scr_sound["kamarov"]["the_house"] = "blackout_kmr_thehouse";
    level.scr_sound["gaz"]["wasnt_that_hard"] = "blackout_gaz_thatwasntsohard";
    level.scr_sound["price"]["reach_that_house"] = "blackout_pri_reachthathouse";
    level.scr_sound["price"]["get_down_here"] = "blackout_pri_getdownhere";
    level.scr_sound["gaz"]["plant_claymore"] = "blackout_gaz_plantsomeclaymores";
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
    level.scr_anim["exploder_script_model"]["h1_blackout_burning_house_01_anim"] = %h1_blackout_burning_house_01_anim;
    level.scr_anim["exploder_script_model"]["h1_blackout_burning_house_02_anim"] = %h1_blackout_burning_house_02_anim;
    level.scr_anim["exploder_script_model"]["h1_blackout_burning_house_03_0_anim"] = %h1_blackout_burning_house_03_0_anim;
    level.scr_anim["exploder_script_model"]["h1_blackout_burning_house_03_1_anim"] = %h1_blackout_burning_house_03_1_anim;
    level.scr_anim["exploder_script_model"]["h1_blackout_burning_house_03_2_anim"] = %h1_blackout_burning_house_03_2_anim;
    level.scr_anim["exploder_script_model"]["h1_blackout_burning_house_03_3_anim"] = %h1_blackout_burning_house_03_3_anim;
}
