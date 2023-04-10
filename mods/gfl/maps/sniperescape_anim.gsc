// H1 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

#using_animtree("generic_human");

main()
{
    if ( !level.sniperescape_fastload )
    {
        maps\_props::add_smoking_notetracks( "generic" );
        maps\_props::add_cellphone_notetracks( "generic" );
    }

    level.scr_model["stone_block_1"] = "me_stone_block01";
    level.scr_model["stone_block_2"] = "me_stone_block02";
    level.scr_model["stone_block_3"] = "me_stone_block03";
    level.scr_anim["price"]["run_to_rappel"] = %h1_sniper_escape_macmillan_run_to_rappel;
    level.scr_anim["price"]["rappel_end"] = %sniper_escape_rappel_finish;
    level.scr_anim["price"]["rappel_start"] = %sniper_escape_rappel_start;
    level.scr_anim["price"]["rappel_idle"][0] = %sniper_escape_rappel_idle;
    level.scr_anim["dead_guy"]["pool_death"] = %exposed_death_nerve;
    level.scr_animtree["dead_guy"] = #animtree;
    level.scr_sound["price"]["rappel_start"] = "sniperescape_mcm_shortcut";
    level.scr_anim["generic"]["pilot_idle_ff"] = %helicopter_pilot1_idle;
    level.scr_anim["price"]["smooth_door_open_init"] = %hunted_open_barndoor_stop;
    level.scr_anim["price"]["smooth_door_open"] = %hunted_open_barndoor_flathand;
    level.scr_anim["price"]["chopper_point"] = %h1_sniper_escape_macmillan_chopper_point;
    maps\_anim::addnotetrack_dialogue( "price", "dialog", "chopper_point", "sniperescape_mcm_incomingheli" );

    if ( getdvarint( "use_old_crash_pickup" ) == 1 )
    {
        level.scr_anim["price"]["precrash_idle"][0] = %sniper_escape_crash_macmillan_aim;
        level.scr_anim["price"]["fire_idle"][0] = %sniper_escape_crash_macmillan_fire;
        level.scr_anim["price"]["fire_idle"][1] = %sniper_escape_crash_macmillan_aim;
        level.scr_anim["price"]["crash"] = %sniper_escape_crash_macmillan_runaway;
        level.scr_anim["price"]["crash_idle"][0] = %sniper_escape_crash_macmillan_wounded_idle;
    }
    else
    {
        level.scr_anim["price"]["precrash_idle"][0] = %h1_sniper_escape_crash_macmillan_aim;
        level.scr_anim["price"]["fire_idle"][0] = %h1_sniper_escape_crash_macmillan_fire;
        level.scr_anim["price"]["fire_idle"][1] = %h1_sniper_escape_crash_macmillan_aim;
        level.scr_anim["price"]["crash"] = %h1_sniper_escape_crash_macmillan_runaway;
        level.scr_anim["price"]["crash_idle"][0] = %h1_sniper_escape_crash_macmillan_wounded_idle;
    }

    level.scr_anim["generic"]["pilot_idle"][0] = %helicopter_pilot1_idle;
    level.scr_anim["generic"]["pilot_idle"][1] = %helicopter_pilot1_twitch_clickpannel;
    level.scr_anim["generic"]["pilot_idle"][2] = %helicopter_pilot1_twitch_lookback;
    level.scr_anim["generic"]["pilot_idle"][3] = %helicopter_pilot1_twitch_lookoutside;
    level.scr_anim["generic"]["gunner_idle"][0] = %helicopter_pilot2_idle;
    level.scr_anim["generic"]["gunner_idle"][1] = %helicopter_pilot2_twitch_clickpannel;
    level.scr_anim["generic"]["gunner_idle"][2] = %helicopter_pilot2_twitch_radio;
    level.scr_anim["generic"]["gunner_idle"][3] = %helicopter_pilot2_twitch_lookoutside;
    level.scr_anim["zakhaev"]["zak_pain"] = %sniper_escape_meeting_zakhaev_hit_front;
    level.scr_anim["zakhaev"]["zak_pain_back"] = %sniper_escape_meeting_zakhaev_hit_back;
    level.scr_anim["zakhaev"]["run"] = %unarmed_run_russian;
    level.scr_anim["zakhaev"]["exchange"] = %sniper_escape_meeting_zakhaev;
    level.scr_anim["guard"]["exchange"] = %sniper_escape_meeting_guard;
    level.scr_anim["dealer"]["exchange"] = %sniper_escape_meeting_dealer;
    level.scr_anim["guard"]["exchange_idle"][0] = %sniper_escape_meeting_guard_idle;
    level.scr_anim["dealer"]["exchange_idle"][0] = %sniper_escape_meeting_dealer_idle;
    maps\_anim::addnotetrack_flag( "zakhaev", "zak_front", "zak_is_facing_player", "exchange" );
    maps\_anim::addnotetrack_flag_clear( "zakhaev", "zak_back", "zak_is_facing_player", "exchange" );
    level.scr_anim["price"]["spin"] = %combatwalk_f_spin;
    level.scr_anim["price"]["halt"] = %stand_exposed_wave_halt_v2;
    level.scr_anim["price"]["wounded_turn_left"] = %sniper_escape_price_turn_l;
    level.scr_anim["price"]["wounded_turn_right"] = %sniper_escape_price_turn_r;
    level.scr_anim["price"]["spotter_exit"] = %sniper_escape_spotter_exit;
    level.scr_anim["price"]["spotter_idle"][0] = %sniper_escape_spotter_idle;
    level.scr_anim["price"]["spotter_wave"] = %sniper_escape_spotter_wave;
    level.scr_anim["price"]["intro_spotter"] = %sniper_escape_macmillanintro_macmillan;
    level.scr_anim["price"]["behind_turn"] = %h1_exposed_stand_180_l;
    maps\_anim::addnotetrack_dialogue( "price", "dialog", "wounded_begins", "sniperescape_mcm_choppergetback" );
    level.scr_anim["price"]["wounded_begins"] = %sniper_escape_price_hit;
    level.scr_anim["price"]["wounded_idle_reach"] = %sniper_escape_price_hit_idle;
    level.scr_anim["price"]["wounded_idle"][0] = %sniper_escape_price_hit_idle;
    level.scr_anim["price"]["wounded_idleweight"][0] = 100;
    level.scr_anim["price"]["wounded_idle"][1] = %sniper_escape_price_hit_idle;
    level.scr_anim["price"]["wounded_idleweight"][1] = 35;
    level.scr_anim["price"]["wounded_fire"] = %sniper_escape_price_hit_fire;
    level.scr_anim["price"]["wounded_crawl_start"] = %sniper_escape_price_crawl_start;
    level.scr_anim["price"]["wounded_crawl_end"] = %sniper_escape_price_crawl_end;
    level.scr_anim["price"]["wounded_crawl"] = %sniper_escape_price_crawl;
    level.scr_anim["generic"]["stealth_jog"] = %patrol_jog;
    level.scr_anim["generic"]["stealth_walk"] = %patrol_bored_patrolwalk;
    level.scr_anim["generic"]["combat_jog"] = %combat_jog;
    level.scr_anim["generic"]["patrol_walk"] = %patrol_bored_patrolwalk;
    level.scr_anim["generic"]["patrol_walk_twitch"] = %patrol_bored_patrolwalk;
    level.scr_anim["generic"]["patrol_turn180"] = %patrol_bored_2_walk_180turn;
    level.scr_anim["price"]["wounded_death"] = %sniper_escape_price_killed;
    level.scr_anim["price"]["wounded_base"] = %wounded_aim;
    level.scr_anim["price"]["wounded_aim_left"] = %sniper_escape_price_aim_l;
    level.scr_anim["price"]["wounded_aim_right"] = %sniper_escape_price_aim_r;
    level.scr_anim["price"]["wounded_carry"][0] = %sniper_escape_price_walk;
    level.scr_anim["player"]["wounded_carry"][0] = %sniper_escape_playerview_walk;

    if ( getdvarint( "use_old_crash_pickup" ) == 1 )
    {
        level.scr_anim["price"]["crash_pickup"] = %sniper_escape_crash_pickup_macmillan;
        level.scr_anim["price"]["wounded_pickup"] = %sniper_escape_price_getup;
        level.scr_anim["price"]["wounded_putdown"] = %sniper_escape_price_putdown;
    }
    else
    {
        level.scr_anim["price"]["crash_pickup"] = %h1_sniper_escape_crash_pickup_macmillan;
        maps\_anim::addnotetrack_animsound( "price", "crash_pickup", "start", "h1_macmillan_initial" );
        level.scr_anim["price"]["wounded_pickup"] = %h1_sniper_escape_price_getup;
        level.scr_anim["price"]["wounded_putdown"] = %h1_sniper_escape_price_putdown;
        maps\_anim::addnotetrack_animsound( "price", "wounded_pickup", "start", "h1_macmillan_up" );
        maps\_anim::addnotetrack_animsound( "price", "wounded_putdown", "start", "h1_macmillan_down" );
        level.scr_animtree["carry_price"] = #animtree;
        level.scr_model["carry_price"] = "h2_gfl_tac50_body";
        level.scr_anim["carry_price"]["carry_idle"] = [ %h1_sniper_escape_price_carry_idle ];
        level.scr_anim["carry_price"]["carry_run"] = [ %h1_sniper_escape_price_carry ];
        level.scr_anim["carry_price"]["ladder_on"] = %h1_sniper_escape_price_ladder_takeoff;
        level.scr_anim["carry_price"]["ladder_off"] = %h1_sniper_escape_price_ladder_puton;
    }

    level.scr_anim["price"]["wounded_seaknight_putdown"] = %h1_sniperescape_macmillan_putdown;
    level.scr_anim["price"]["pickup_idle"][0] = %sniper_escape_price_wounded_idle;
    level.scr_anim["generic"]["patrol_look_up"] = %patrol_jog_look_up;
    level.scr_anim["generic"]["patrol_360"] = %patrol_jog_360;
    level.scr_anim["generic"]["patrol_jog"] = %patrol_jog;
    level.scr_anim["generic"]["patrol_orders"] = %patrol_jog_orders;
    level.scr_anim["generic"]["patrol_look_up_once"] = %patrol_jog_look_up_once;
    level.scr_anim["generic"]["patrol_360_once"] = %patrol_jog_360_once;
    level.scr_anim["generic"]["patrol_jog_once"] = %patrol_jog_once;
    level.scr_anim["generic"]["patrol_orders_once"] = %patrol_jog_orders_once;
    level.scr_anim["generic"]["exchange_surprise_zakhaev"] = %unarmed_cowerstand_react;
    level.scr_anim["generic"]["exchange_surprise_0"] = %exposed_idle_reacta;
    level.scr_anim["generic"]["exchange_surprise_1"] = %exposed_idle_reactb;
    level.scr_anim["generic"]["exchange_surprise_2"] = %exposed_idle_twitch;
    level.scr_anim["generic"]["exchange_surprise_3"] = %exposed_idle_twitch_v4;
    maps\_anim::addnotetrack_customfunction( "generic", "ready_to_run", maps\sniperescape_exchange::exchange_ready_to_run );
    level.surprise_anims = 4;
    level.scr_anim["generic"]["_stealth_behavior_whizby_0"] = %exposed_idle_reacta;
    level.scr_anim["generic"]["_stealth_behavior_whizby_1"] = %exposed_idle_reactb;
    level.scr_anim["generic"]["_stealth_behavior_whizby_2"] = %exposed_idle_twitch;
    level.scr_anim["generic"]["_stealth_behavior_whizby_3"] = %exposed_idle_twitch_v4;
    level.scr_anim["generic"]["_stealth_behavior_whizby_4"] = %run_pain_stumble;
    level.scr_anim["generic"]["_stealth_behavior_spotted_short"] = %exposed_idle_twitch_v4;
    level.scr_anim["generic"]["_stealth_behavior_spotted_long"] = %exposed_idle_twitch_v4;
    level.scr_anim["generic"]["sprint"] = %sprint1_loop;
    level.scr_anim["generic"]["prone_dive"] = %hunted_dive_2_pronehide_v1;
    level.scr_anim["generic"]["prone_idle"][0] = %hunted_pronehide_idle_relative;
    level.scr_anim["generic"]["bored_cell_loop"][0] = %patrol_bored_idle_cellphone;
    level.scr_anim["generic"]["smoking"][0] = %parabolic_leaning_guy_smoking_idle;
    level.scr_anim["generic"]["smoking"][1] = %parabolic_leaning_guy_smoking_twitch;
    level.scr_anim["generic"]["bored_idle"][0] = %patrol_bored_idle;
    level.scr_anim["generic"]["bored_idle"][1] = %patrol_bored_twitch_bug;
    level.scr_anim["generic"]["bored_idle"][2] = %patrol_bored_twitch_stretch;
    level.scr_anim["generic"]["smoke_idle"][0] = %patrol_bored_idle_smoke;
    level.scr_anim["guy1"]["load"] = %ch46_load_1;
    level.scr_anim["guy1"]["unload"] = %ch46_unload_1;
    level.scr_anim["guy2"]["load"] = %ch46_load_2;
    level.scr_anim["guy2"]["unload"] = %ch46_unload_2;
    level.scr_anim["guy3"]["load"] = %ch46_load_3;
    level.scr_anim["guy3"]["unload"] = %ch46_unload_3;
    level.scr_anim["guy4"]["load"] = %ch46_load_4;
    level.scr_anim["guy4"]["unload"] = %ch46_unload_4;
    level.scr_anim["victim"]["shot"] = %h1_helicopter_pilot2_death;
    level.scr_anim["copilot"]["shot"][0] = %h1_helicopter_pilot1_reaction;
    level.scr_anim["makarov"]["talking"] = %dubai_finale_draw_makarov_face;
    level.scr_anim["price"]["crouch"] = %exposed_stand_2_crouch;
    level.scr_radio["incoming_helicopter"] = "sniperescape_mcm_incomingheli";
    level.scr_radio["hit_the_rotor"] = "sniperescape_mcm_hittherotor";
    level.scr_radio["shoot_the_helicopter"] = "sniperescape_mcm_downtogether";
    level.scr_radio["fire_fire"] = "sniperescape_mcm_firefire";
    level.scr_radio["goodnight_ya_bastard"] = "sniperescape_mcm_goodnight";
    level.scr_radio["aw_shite"] = "sniperescape_mcm_run";
    level.scr_radio["ahh_crap"] = "sniperescape_mcm_run";
    level.scr_radio["cant_move_1"] = "sniperescape_mcm_cantmove";
    level.scr_radio["cant_move_2"] = "sniperescape_mcm_cantmove";
    level.scr_radio["cant_move_3"] = "sniperescape_mcm_cantmove";
    maps\_anim::addnotetrack_customfunction( "price", "fire", maps\sniperescape_code::price_fires, "wounded_fire" );
    level.scr_radio["transport_sighted"] = "sniperescape_mcm_enemysighted";
    level.scr_radio["get_on_barrett"] = "sniperescape_mcm_getonbarrett";
    level.scr_radio["remember_my_teaching"] = "sniperescape_mcm_corioliseffect";
    level.scr_radio["prepare_for_ranging"] = "sniperescape_mcm_prepranging";
    level.scr_radio["white_truck"] = "sniperescape_mcm_whitetruck";
    level.scr_radio["range_to_bmp"] = "sniperescape_mcm_bmprange";
    level.scr_radio["table_with_case"] = "sniperescape_mcm_table";
    level.scr_radio["i_see_him"] = "sniperescape_mcm_mymark";
    level.scr_radio["target_acquired"] = "sniperescape_mcm_positiveid";
    level.scr_radio["where_did_he_come_from"] = "sniperescape_mcm_clearshot";
    level.scr_radio["wind_picked_up"] = "sniperescape_mcm_eyeonflag";
    level.scr_radio["take_the_shot"] = "sniperescape_mcm_taketheshot";
    level.scr_radio["did_you_take_him_out"] = "sniperescape_mcm_armflyoff";
    level.scr_radio["take_out_that_heli"] = "sniperescape_mcm_buysometime";
    level.scr_radio["great_shot_now_go"] = "sniperescape_mcm_greatshot";
    level.scr_radio["compromised"] = "sniperescape_mcm_comrpomised";
    level.scr_radio["eta_20_min"] = "sniperescape_hqr_stretchingourfuel";
    level.scr_sound["price"]["follow_me"] = "sniperescape_mcm_followme";
    level.scr_radio["head_for_extract"] = "sniperescape_mcm_headforpoint";
    level.scr_sound["price"]["more_behind"] = "sniperescape_mcm_morebehind";
    level.scr_sound["price"]["bushes_north"] = "sniperescape_mcm_bushesnorth";
    level.scr_sound["price"]["bushes_northwest"] = "sniperescape_mcm_bushesNW";
    level.scr_sound["price"]["woods_north"] = "sniperescape_mcm_inthewoods";
    level.scr_sound["price"]["woods_northeast"] = "sniperescape_mcm_woodsNE";
    level.scr_sound["price"]["woods_east"] = "sniperescape_mcm_woodseast";
    level.scr_sound["price"]["woods_southeast"] = "sniperescape_mcm_inthewoods";
    level.scr_sound["price"]["woods_south"] = "sniperescape_mcm_woodssouth";
    level.scr_sound["price"]["woods_southwest"] = "sniperescape_mcm_woodsSW";
    level.scr_sound["price"]["woods_west"] = "sniperescape_mcm_inthewoods";
    level.scr_sound["price"]["woods_northwest"] = "sniperescape_mcm_inthewoods";
    level.scr_sound["price"]["bushes_west"] = "sniperescape_mcm_busheswest";
    level.scr_sound["price"]["enemies_north"] = "sniperescape_mcm_comingnorth";
    level.scr_sound["price"]["enemies_northeast"] = "sniperescape_mcm_movementNE";
    level.scr_sound["price"]["enemies_east"] = "sniperescape_mcm_tangoseast";
    level.scr_sound["price"]["enemies_southeast"] = "sniperescape_mcm_targetsSE";
    level.scr_sound["price"]["enemies_south"] = "sniperescape_mcm_morefromsouth";
    level.scr_sound["price"]["enemies_southwest"] = "sniperescape_mcm_contactSW";
    level.scr_sound["price"]["enemies_west"] = "sniperescape_mcm_hostileswest";
    level.scr_sound["price"]["enemies_northwest"] = "sniperescape_mcm_tangosNW";
    level.scr_sound["price"]["lose_them_in_apartment"] = "sniperescape_mcm_apartmentcomeon";
    level.scr_sound["price"]["place_claymore"] = "sniperescape_mcm_plantclaymore";
    level.scr_sound["price"]["standby"] = "sniperescape_mcm_standby";
    level.scr_sound["price"]["now"] = "sniperescape_mcm_now";
    level.scr_sound["price"]["im_hit"] = "sniperescape_mcm_imhit";
    level.scr_sound["price"]["carry_me"] = "sniperescape_mcm_sorrymate";
    level.scr_radio["put_me_down_1"] = "sniperescape_mcm_coveryou";
    level.scr_radio["put_me_down_2"] = "sniperescape_mcm_oisit";
    level.scr_radio["put_me_down_quick"] = "sniperescape_mcm_fightback";
    level.scr_sound["price"]["dont_go_far"] = "sniperescape_mcm_toofarahead";
    level.scr_radio["extraction_is_southwest"] = "sniperescape_mcm_makeithurry";
    level.scr_sound["price"]["got_one"] = "sniperescape_mcm_gotone";
    level.scr_sound["price"]["tango_down"] = "sniperescape_mcm_tangodown";
    level.scr_sound["price"]["he_is_down"] = "sniperescape_mcm_hesdown";
    level.scr_sound["price"]["got_another"] = "sniperescape_mcm_gotanother";
    level.scr_sound["price"]["got_him"] = "sniperescape_mcm_gothim";
    level.scr_sound["price"]["target_neutralized"] = "sniperescape_mcm_targetneutralized";
    level.scr_sound["price"]["head_for_apartment"] = "sniperescape_mcm_headforapartment";
    level.scr_radio["almost_there"] = "sniperescape_mcm_otherside";
    level.scr_sound["price"]["transport_inbound"] = "sniperescape_mcm_enemysighted";
    level.scr_sound["price"]["cut_through_woods"] = "sniperescape_mcm_cutthruwoods";
    level.scr_sound["price"]["extract_southwest"] = "sniperescape_mcm_makeithurry";
    level.scr_radio["head_for_apartment"] = "sniperescape_mcm_headforapartment";
    level.scr_sound["price"]["alright_go"] = "sniperescape_mcm_alrightgo";
    level.scr_sound["price"]["get_ready"] = "sniperescape_mcm_getready";
    level.scr_sound["price"]["go!"] = "sniperescape_mcm_go";
    level.scr_sound["price"]["come_on_lets_go"] = "sniperescape_mcm_comeon";
    level.scr_sound["price"]["time_to_move"] = "sniperescape_mcm_timetomove";
    level.scr_sound["price"]["spotter_exit"] = "sniperescape_mcm_timetomove";
    level.scr_radio["sweep_the_rooms"] = "sniperescape_mcm_putmedown";
    level.scr_sound["price"]["put_down_1"] = "sniperescape_mcm_easydoesit";
    level.scr_sound["price"]["put_down_2"] = "sniperescape_mcm_easynow";
    level.scr_sound["price"]["put_down_3"] = "sniperescape_mcm_careful";
    level.scr_sound["price"]["lets_get_moving_1"] = "sniperescape_mcm_givemealift";
    level.scr_sound["price"]["lets_get_moving_2"] = "sniperescape_mcm_intheclear";
    level.scr_sound["price"]["good_sniping_position"] = "sniperescape_mcm_snipingposition";
    level.scr_radio["new_put_me_down_1"] = "sniperescape_mcm_enemytroops";
    level.scr_radio["new_put_me_down_2"] = "sniperescape_mcm_closingin";
    level.scr_radio["new_put_me_down_3"] = "sniperescape_mcm_tangosfast";
    level.scr_radio["new_put_me_down_4"] = "sniperescape_mcm_movingin";
    level.scr_radio["find_good_spot"] = "sniperescape_mcm_findgoodspot";
    level.scr_radio["waiting_for_signal"] = "sniperescape_hp1_yoursignal";
    level.scr_radio["find_sniping_spot"] = "sniperescape_mcm_overrunlz";
    level.scr_radio["use_claymores"] = "sniperescape_mcm_claymores";
    level.scr_radio["find_spot_go_prone"] = "sniperescape_mcm_goprone";
    level.scr_radio["activated_beacon"] = "sniperescape_mcm_beacon";
    level.scr_radio["have_a_fix"] = "sniperescape_hp1_hangtight";
    level.scr_radio["let_them_get_closer"] = "sniperescape_mcm_getcloser";
    level.scr_radio["standby_to_engage"] = "sniperescape_mcm_standbyengage";
    level.scr_radio["open_fire"] = "sniperescape_mcm_openfire";
    level.scr_radio["where_is_he"] = "sniperescape_sas2_wheresmac";
    level.scr_radio["heli_at_the_lz"] = "sniperescape_hp1_atthelz";
    level.scr_radio["heli_got_thirty_seconds"] = "sniperescape_hp1_bingofuel";
    level.scr_radio["heli_goodbye"] = "sniperescape_hp1_toolow";
    level.scr_sound["price"]["gotta_go_1"] = "sniperescape_mcm_leftbehind";
    level.scr_sound["price"]["gotta_go_2"] = "sniperescape_mcm_outoftime";
    level.scr_sound["price"]["gotta_go_3"] = "sniperescape_mcm_gettrapped";
    level.scr_sound["price"]["gotta_go_4"] = "sniperescape_mcm_gettolz";
    level.scr_sound["price"]["gotta_go_5"] = "sniperescape_mcm_keepmoving";
    level.scr_sound["price"]["gotta_go_6"] = "sniperescape_mcm_wastingtime";
    level.scr_sound["price"]["gotta_go_7"] = "sniperescape_mcm_gottogo";
    level.scr_sound["price"]["gotta_go_8"] = "sniperescape_mcm_coverrear";
    level.scr_sound["price"]["gotta_go_9"] = "sniperescape_mcm_coverback";
    level.scr_sound["price"]["gotta_go_10"] = "sniperescape_mcm_forgetit";
    level.scr_sound["price"]["fifteen_minutes"] = "sniperescape_mcm_15mins";
    level.scr_sound["price"]["ten_minuets"] = "sniperescape_mcm_10mins";
    level.scr_sound["price"]["eight_minutes"] = "sniperescape_mcm_8mins";
    level.scr_sound["price"]["six_minutes"] = "sniperescape_mcm_6mins";
    level.scr_sound["price"]["five_minutes"] = "sniperescape_mcm_5mins";
    level.scr_sound["price"]["wait_make_sure"] = "sniperescape_mcm_makesureclear";
    level.scr_sound["price"]["signal_transport"] = "sniperescape_mcm_signaltransport";
    level.scr_sound["price"]["put_down_behind_wheel"] = "sniperescape_mcm_snipersupport";
    level.scr_sound["price"]["this_is_fine"] = "sniperescape_mcm_thisllbefine";
    level.scr_sound["price"]["a_bit_farther_north"] = "sniperescape_mcm_getaclearshot";
    level.scr_sound["price"]["over_to_that_hill"] = "sniperescape_mcm_clearview";
    level.scr_sound["price"]["find_a_good_snipe"] = "sniperescape_mcm_enterthisarea";
    level.scr_sound["price"]["i_will_signal_in_30"] = "sniperescape_mcm_thirtysec";
    level.scr_sound["price"]["prep_the_killzone"] = "sniperescape_mcm_prepkillzone";
    level.scr_sound["price"]["helicopter_is_standing_by"] = "sniperescape_mcm_safedistance";
    level.scr_sound["price"]["move_me"] = "sniperescape_mcm_betterposition";
    level.scr_sound["price"]["check_your_compass"] = "sniperescape_mcm_checkcompass";
    level.scr_sound["price"]["pick_me_up_and_move_me"] = "sniperescape_mcm_pickupnorth";
    level.scr_sound["price"]["a_bit_farther_north_2"] = "sniperescape_mcm_farthernorth";
    level.scr_sound["price"]["over_there_behind_ferris_wheel"] = "sniperescape_mcm_behindferris";
    level.heli_flag["cant_pick_up_price"] = "near_pool";
    level.scr_sound["heli"]["near_pool"] = "sniperescape_rul_nearpool";
    level.heli_flag["player_abandon_protection"] = "amusement_park";
    level.scr_sound["heli"]["amusement_park"] = "sniperescape_rul_amusementpk";
    level.heli_flag["start_heat_spawners"] = "hotel_police";
    level.scr_sound["heli"]["hotel_police"] = "sniperescape_rul_hotelpolissa";
    level.heli_flag["stop_east_spawners"] = "cut_exits";
    level.scr_sound["heli"]["cut_exits"] = "sniperescape_rul_cutoffexits";
    level.heli_flag["enter_burnt"] = "snipers_in_area";
    level.scr_sound["heli"]["snipers_in_area"] = "sniperescape_rul_snipersinarea";
    level.heli_flag["to_the_pool"] = "south_of_city";
    level.scr_sound["heli"]["south_of_city"] = "sniperescape_rul_southofcity";
    level.heli_flag["player_leaves_price_wounding"] = "cover_woods";
    level.scr_sound["heli"]["cover_woods"] = "sniperescape_rul_coverwoods";
    level.heli_flag["plant_claymore"] = "move_move";
    level.scr_sound["heli"]["move_move"] = "sniperescape_rul_movemove";
    level.scr_radio["plant_claymore_by_door"] = "sniperescape_mcm_bydoor";
    level.scr_radio["enemy_left_flank"] = "snescape_mcm_movinglt";
    level.scr_radio["enemy_right_flank"] = "snescape_mcm_movingrt";
    level.scr_radio["enemy_left_flank_2"] = "snescape_mcm_ltflank";
    level.scr_radio["enemy_right_flank_2"] = "snescape_mcm_rtflank";
    level.scr_radio["went_wide"] = "snescape_mcm_wentwide";
    level.scr_radio["target_still_standing"] = "snescape_mcm_stillstand";
    level.scr_radio["target_down_1"] = "snescape_mcm_wegothim";
    level.scr_radio["target_down_2"] = "snescape_mcm_shock";
    level.scr_radio["target_down_3"] = "snescape_mcm_niceshotlt";
    level.scr_radio["now_or_never"] = "snescape_mcm_nownever";
    level.scr_radio["pickup_breathing"] = "sniperescape_mcm_breathing";
    level.scr_radio["take_my_claymores"] = "snescape_mcm_takemy";
    level.scr_radio["enemy_choppers"] = "snescape_mcm_enemychop";
    level.scr_radio["watch_out_1"] = "snescape_mcm_watchout";
    level.scr_radio["watch_out_2"] = "snescape_mcm_payattention";
    level.scr_radio["where_are_you"] = "sniperescape_mcm_bigbird";
    level.scr_radio["be_there_asap"] = "sniperescape_hp1_holdtight";
    level.scr_radio["are_you_insane"] = "scoutsniper_mcm_youinsane";
    level.scr_radio["scoutsniper_mcm_youdaft"] = "scoutsniper_mcm_youdaft";
    setup_exploder_anims();
    player_rappel();
    dog_anims();
    seaknight_anims();
    script_models();
}

setup_exploder_anims()
{
    level.exploder_animtrees = [];
    level.exploder_animtrees[0] = "exploder_script_model";
}

#using_animtree("player");

player_rappel()
{
    level.scr_anim["player_grab_barret"]["grab_barret_idle"][0] = %sniper_escape_macmillanintro_player_idle;
    level.scr_anim["player_grab_barret"]["grab_barret_prep"] = %sniper_escape_macmillanintro_player_idle;
    level.scr_anim["player_grab_barret"]["grab_barret"] = %sniper_escape_macmillanintro_player;
    level.scr_animtree["player_grab_barret"] = #animtree;
    level.scr_model["player_grab_barret"] = "h2_gfl_m4a1_worldhands";
    level.scr_anim["player_rappel"]["rappel"] = %sniper_escape_player_rappel;
    level.scr_animtree["player_rappel"] = #animtree;
    level.scr_model["player_rappel"] = "h2_gfl_m4a1_viewbody";
    level.scr_animtree["player_carry"] = #animtree;

    if ( getdvarint( "use_old_crash_pickup" ) == 1 )
    {
        level.scr_model["player_carry"] = "h2_gfl_m4a1_worldhands";
        level.scr_anim["player_carry"]["crash_pickup"] = %sniper_escape_crash_pickup_player;
        level.scr_anim["player_carry"]["wounded_putdown"] = %sniper_escape_player_putdown;
        level.scr_anim["player_carry"]["wounded_pickup"] = %sniper_escape_player_getup;
        level.scr_anim["player_carry"]["wounded_seaknight_putdown"] = %h1_sniperescape_player_putdown;
    }
    else
    {
        level.scr_model["player_carry"] = "h2_gfl_m4a1_viewbody";
        level.scr_anim["player_carry"]["crash_pickup"] = %h1_sniper_escape_crash_pickup_player;
        level.scr_animtree["wounded_carry"] = #animtree;
        level.scr_model["wounded_carry"] = "h2_gfl_m4a1_worldhands";
        level.scr_anim["wounded_carry"]["wounded_putdown"] = %h1_sniper_escape_player_putdown;
        level.scr_anim["wounded_carry"]["wounded_pickup"] = %h1_sniper_escape_player_getup;
        level.scr_anim["wounded_carry"]["carry_idle"] = [ %h1_sniper_escape_player_carry_idle ];
        level.scr_anim["wounded_carry"]["carry_run"] = [ %h1_sniper_escape_player_carry ];
        maps\_anim::addnotetrack_animsound( "player_carry", "carry_run", "drag_step_right", "sniperescape_plr_footstep_dragR" );
        maps\_anim::addnotetrack_animsound( "player_carry", "carry_run", "drag_step_left", "sniperescape_plr_footstep_dragL" );
        level.scr_anim["wounded_carry"]["ladder_on"] = %h1_sniper_escape_player_ladder_takeoff;
        level.scr_anim["wounded_carry"]["ladder_off"] = %h1_sniper_escape_player_ladder_puton;
        level.scr_anim["wounded_carry"]["wounded_seaknight_putdown"] = %h1_sniperescape_player_putdown;
    }
}

#using_animtree("dog");

dog_anims()
{
    level.scr_anim["dog"]["fence_attack"] = %sniper_escape_dog_fence;
    level.scr_anim["generic"]["dog_food"][0] = %german_shepherd_eating;
    level.scr_anim["generic"]["dog_food_w_sound"][0] = %german_shepherd_eating;
    level.scr_anim["generic"]["dog_food_nonidle"] = %german_shepherd_eating;
    level.scr_sound["generic"]["dog_food_w_sound"][0] = "anml_dog_eating_body";
    maps\_anim::addnotetrack_sound( "dog", "fence", "fence_attack", "fence_smash" );
}

#using_animtree("vehicles");

seaknight_anims()
{
    level.scr_anim["seaknight"]["idle"][0] = %sniper_escape_ch46_idle;
    level.scr_anim["seaknight"]["landing"] = %sniper_escape_ch46_land;
    level.scr_anim["seaknight"]["take_off"] = %sniper_escape_ch46_take_off;
    maps\_anim::addnotetrack_customfunction( "seaknight", "fade", maps\sniperescape::end_level, "take_off" );
    maps\_anim::addnotetrack_customfunction( "mi28", "rotor", maps\sniperescape_wounding::rotor_blades );
    maps\_anim::addnotetrack_customfunction( "mi28", "rotor", maps\sniperescape_wounding::rotor_hub );
    level.scr_anim["seaknight"]["rotors"] = %sniper_escape_ch46_rotors;
    level.scr_animtree["seaknight"] = #animtree;
    level.scr_anim["mi28"]["entrance"] = %sniper_escape_crash_mi28_entrance;
    level.scr_anim["mi28"]["idle"][0] = %sniper_escape_crash_mi28_idle;
    level.scr_anim["mi28"]["crash"] = %sniper_escape_crash_mi28_crash;
}

#using_animtree("script_model");

script_models()
{
    level.scr_anim["zak_script_model"]["zak_pain"] = %sniper_escape_meeting_zakhaev_hit_front;
    level.scr_anim["zak_script_model"]["zak_pain_back"] = %sniper_escape_meeting_zakhaev_hit_back;
    level.scr_animtree["zak_script_model"] = #animtree;
    level.scr_anim["curtain"]["curtain_right"] = %chechnya_curtain_sway_le;
    level.scr_anim["curtain"]["curtain_left"] = %chechnya_curtain_sway_ri;
    level.scr_animtree["curtain"] = #animtree;
    level.scr_model["curtain"] = "ch_curtain01";
    level.scr_anim["rappel_chair"]["run_to_rappel"] = %h1_sniper_escape_macmillan_run_to_rappel_chair;
    level.scr_animtree["rappel_chair"] = #animtree;
    level.scr_model["rappel_chair"] = "afr_restaurantchair_2";
    level.scr_animtree["rope"] = #animtree;
    level.scr_model["rope"] = "rappelrope100_ri";
    level.scr_anim["player_rope"]["rappel_for_player"] = %sniper_escape_player_start_rappelrope100;
    level.scr_animtree["player_rope"] = #animtree;
    level.scr_model["player_rope"] = "rappelrope100_le";
    level.scr_anim["player_rope_obj"]["rappel_for_player"] = %sniper_escape_player_start_rappelrope100;
    level.scr_animtree["player_rope_obj"] = #animtree;
    level.scr_model["player_rope_obj"] = "rappelrope100_le_obj";
    level.scr_anim["rope"]["rappel_end"] = %sniper_escape_rappel_finish_rappelrope100;
    level.scr_anim["rope"]["rappel_start"] = %sniper_escape_rappel_start_rappelrope100;
    level.scr_anim["rope"]["rappel_idle"][0] = %sniper_escape_rappel_idle_rappelrope100;
    level.scr_animtree["exploder_script_model"] = #animtree;
    level.scr_anim["exploder_script_model"]["h1_sniperescape_building01_anim"] = %h1_sniperescape_building01_anim;
    level.scr_anim["exploder_script_model"]["h1_sniperescape_building010_anim"] = %h1_sniperescape_building010_anim;
    level.scr_anim["exploder_script_model"]["h1_sniperescape_building011_anim"] = %h1_sniperescape_building011_anim;
    level.scr_anim["exploder_script_model"]["h1_sniperescape_building012_anim"] = %h1_sniperescape_building012_anim;
    level.scr_anim["briefcase"]["exchange"] = %sniper_escape_meeting_briefcase;
    level.scr_animtree["briefcase"] = #animtree;
    level.scr_anim["brick"]["exchange"] = %sniper_escape_meeting_briefcase;
    level.scr_animtree["brick"] = #animtree;
    level.scr_anim["flag"]["up"] = %sniper_escape_flag_wave_up;
    level.scr_anim["flag"]["down"] = %sniper_escape_flag_wave_down;
    level.scr_animtree["flag"] = #animtree;

    if ( !level.sniperescape_fastload )
    {
        level.scr_model["binocs"] = "weapon_binocular";
        level.scr_model["flag"] = "prop_car_flag";
        level.scr_model["brick"] = "com_golden_brick";
        level.scr_model["briefcase"] = "com_gold_brick_case";
        level.scr_model["zak_one_arm"] = "body_zakhaev_imran_onearm";
        level.scr_model["zak_left_arm"] = "spawn_zakhaev_imran_l_arm";
    }

    level.scr_animtree["zak_left_arm"] = #animtree;
    level.scr_anim["zak_left_arm"]["zak_pain"] = %sniper_escape_meeting_zakhaev_hit_arm_front;
    level.scr_anim["zak_left_arm"]["zak_pain_back"] = %sniper_escape_meeting_zakhaev_hit_arm_back;
    maps\_anim::addnotetrack_flag( "briefcase", "dust", "briefcase_placed", "exchange" );
    level.scr_model["tag_gunner"] = "vehicle_mi-28_window_front";
    level.scr_model["tag_pilot"] = "vehicle_mi-28_window_back";
    level.scr_model["blade1"] = "vehicle_mi-28_hub";
    level.scr_model["blade2"] = "vehicle_mi-28_blade1";
    level.scr_model["blade3"] = "vehicle_mi-28_blade2";
    level.scr_model["blade4"] = "vehicle_mi-28_blade3";
    level.scr_model["blade5"] = "vehicle_mi-28_blade4";
    maps\_anim::addnotetrack_customfunction( "blade1", "blade", maps\sniperescape_wounding::remove_blade );
    maps\_anim::addnotetrack_customfunction( "blade2", "blade", maps\sniperescape_wounding::remove_blade );
    maps\_anim::addnotetrack_customfunction( "blade3", "blade", maps\sniperescape_wounding::remove_blade );
    maps\_anim::addnotetrack_customfunction( "blade4", "blade", maps\sniperescape_wounding::remove_blade );
    maps\_anim::addnotetrack_customfunction( "blade5", "blade", maps\sniperescape_wounding::remove_blade );
    level.scr_animtree["blade1"] = #animtree;
    level.scr_animtree["blade2"] = #animtree;
    level.scr_animtree["blade3"] = #animtree;
    level.scr_animtree["blade4"] = #animtree;
    level.scr_animtree["blade5"] = #animtree;
    level.scr_anim["blade1"]["spin"] = %sniper_escape_crash_mi28_rotor_1;
    level.scr_anim["blade2"]["spin"] = %sniper_escape_crash_mi28_rotor_2;
    level.scr_anim["blade3"]["spin"] = %sniper_escape_crash_mi28_rotor_3;
    level.scr_anim["blade4"]["spin"] = %sniper_escape_crash_mi28_rotor_4;
    level.scr_anim["blade5"]["spin"] = %sniper_escape_crash_mi28_rotor_5;
    level.scr_anim["generic"]["dead_pilot"] = %sniper_escape_crash_mi28_pilot;
    level.scr_anim["generic"]["dead_gunner"] = %sniper_escape_crash_mi28_copilot;
    level.scr_animtree["dead_heli_pilot"] = #animtree;
}

#using_animtree("generic_human");

uaz_anims()
{
    var_0 = vehicle_scripts\_uaz::setanims();
    var_0[2].idle = %uaz_rear_driver_idle;
    var_0[3].idle = %uaz_passenger2_idle;
    var_0[2].getin = %uaz_rear_driver_enter_from_huntedrun;
    var_0[0].getout = undefined;
    var_0[1].nodeath = 1;
    var_0[3].getout = undefined;
    var_0[0].talk = %h1_sniper_escape_flashback_makarov;
    var_0[0].talk_transition = %h1_sniper_escape_flashback_makarov_transition;
    var_0[3].talk = %h1_sniper_escape_flashback_yuri;
    var_0[0].panic = %h1_sniper_escape_flashback_makarov_transition_back;
    var_0[3].panic = %technical_passenger_duck;
    return var_0;
}

#using_animtree("vehicles");

uaz_vehicle_anims( var_0 )
{
    var_0 = vehicle_scripts\_uaz::set_vehicle_anims( var_0 );
    var_0[2].vehicle_getinanim = %uaz_rear_driver_enter_from_huntedrun_door;
    var_0[3].vehicle_getinanim = %uaz_passenger2_enter_from_huntedrun_door;
    var_0[2].vehicle_getoutanim = %uaz_rear_driver_exit_into_run_door;
    return var_0;
}
