// H1 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

dead_script()
{
    common_scripts\utility::flag_init( "player_is_on_turret" );
    common_scripts\utility::flag_init( "player_made_it_to_seaknight" );
    common_scripts\utility::flag_init( "heli_shot_down" );
    common_scripts\utility::flag_init( "heli_comes_to_rest" );
    common_scripts\_ca_blockout::init();
    maps\createart\sniperescape_art::main();
    maps\createfx\sniperescape_audio::main();
    maps\sniperescape_fx::main();
    maps\sniperescape_precache::main();
    maps\_load::main();
    maps\sniperescape_aud::main();
    maps\sniperescape_anim::main();
    level thread maps\sniperescape_amb::main();
    maps\sniperescape_lighting::main();
}

main()
{
    precacheitem( "cobra_seeker" );
    precacheitem( "hind_turret_penetration" );
    level.sniperescape_fastload = 0;

    if ( getdvar( "beautiful_corner" ) == "1" )
    {
        dead_script();
        return;
    }

    setdvar( "enable_flashback_guy_nameplate", "1" );

    maps\sniperescape_precache::main();
    precacheitem( "barrett_fake" );
    maps\_vehicle::build_aianims_with_classname( "script_vehicle_uaz_hardtop_destructible", maps\sniperescape_anim::uaz_anims, maps\sniperescape_anim::uaz_vehicle_anims );
    level.vehicle_aianimthread["talk"] = maps\sniperescape_exchange::guy_talk;
    level.vehicle_aianimcheck["talk"] = maps\sniperescape_exchange::guy_talk_check;
    level.vehicle_aianimthread["panic"] = maps\sniperescape_exchange::guy_panic;
    level.vehicle_aianimcheck["panic"] = maps\sniperescape_exchange::guy_panic_check;
    maps\createart\sniperescape_art::main();
    maps\createfx\sniperescape_audio::main();
    maps\sniperescape_fx::main();
    maps\_stealth_logic::stealth_init();
    maps\_stealth_behavior::main();
    maps\_load::set_player_viewhand_model( "h2_gfl_m4a1_worldhands" );
    setsaveddvar( "sv_znear", "1.0" );
    level.player allowstand( 0 );
    animscripts\dog\dog_init::initdoganimations();
    setsaveddvar( "ai_eventDistFootstep", "32" );
    setsaveddvar( "ai_eventDistFootstepWalk", "32" );
    precacheshader( "h1_hud_timer_blur" );
    precacheshader( "h1_hud_timer_border" );
    precacheshader( "h1_timer_on_flare" );
    precacheshader( "h1_timer_warning_flare" );
    precachemodel( "temp" );
    precachemodel( "afr_restaurantchair_2" );
    precachemodel( "weapon_c4" );
    precachemodel( "body_complete_usmc_ghillie_price_damaged" );
    precachemodel( "vehicle_mi28_center_hub" );
    precachemodel( "vehicle_ch46e_opened_door_interior_b" );
    precachemodel( "vehicle_ch46e_wires" );
    precachemodel( "vehicle_ch46e_opened_door_interior_a" );
    precachemodel( "body_force_assault_pilot_woodland" );
    precacheitem( "cobra_seeker" );
    precacheitem( "flash_grenade" );
    precacheshellshock( "barrett" );
    precachestring( &"SNIPERESCAPE_ELIMINATE_IMRAN_ZAKHAEV" );
    precachestring( &"SNIPERESCAPE_CHANGE_THE_FUTURE" );
    precachestring( &"SNIPERESCAPE_TAKE_OUT_THE_ATTACK_CHOPPER" );
    precachestring( &"SNIPERESCAPE_GET_OUT_OF_THE_HOTEL" );
    precachestring( &"SNIPERESCAPE_REACH_THE_EXTRACTION" );
    precachestring( &"SNIPERESCAPE_FOLLOW_CPT_MACMILLAN" );
    precachestring( &"SNIPERESCAPE_DRAG_MACMILLAN_BODILY" );
    precachestring( &"SNIPERESCAPE_PUT_CPT_MACMILLAN_DOWN" );
    precachestring( &"SNIPERESCAPE_PREP_AREA_FOR_FIGHT" );
    precachestring( &"SNIPERESCAPE_HOLD_OUT_UNTIL_EVAC" );
    precachestring( &"SNIPERESCAPE_SEAKNIGHT_INCOMING" );
    precachestring( &"SNIPERESCAPE_GET_CPT_MACMILLAN_TO" );
    precachestring( &"SNIPERESCAPE_PICK_UP_CPT_MACMILLAN" );
    precachestring( &"SNIPERESCAPE_CARRY_MACMILLAN_TO_THE" );
    precachestring( &"SNIPERESCAPE_CLAYMORE_HELP" );
    precachestring( &"SNIPERESCAPE_PRESS_FORWARDS_OR_BACKWARDS" );
    precachestring( &"SNIPERESCAPE_YOU_FAILED_TO_REACH_THE" );
    precachestring( &"SNIPERESCAPE_HOLD_1_TO_PUT_CPT_MACMILLAN" );
    precachestring( &"SNIPERESCAPE_HOLD_1_TO_PICK_UP_CPT" );
    precachestring( &"SNIPERESCAPE_YOU_LEFT_YOUR_SPOTTER" );
    precachestring( &"SNIPERESCAPE_CPT_MACMILLAN_DIED" );
    precachestring( &"SNIPERESCAPE_TOO_FAR_FROM_MACMILLAN" );
    precachestring( &"SNIPERESCAPE_HOLD_1_TO_RAPPEL" );
    precachestring( &"SNIPERESCAPE_TIME_REMAINING" );
    precachestring( &"SNIPERESCAPE_TARGET" );
    precachestring( &"SNIPERESCAPE_ZAKHAEV" );
    precachestring( &"SNIPERESCAPE_DISTANCE" );
    precachestring( &"SNIPERESCAPE_M" );
    precachestring( &"SNIPERESCAPE_BULLET_TRAVEL" );
    precachestring( &"SNIPERESCAPE_S" );
    precachestring( &"SCRIPT_HINT_C4_THROW" );
    precacherumble( "crash_heli_rumble" );
    precacherumble( "crash_heli_rumble_rest" );
    precacherumble( "generic_attack_light_500" );
    precacherumble( "generic_attack_light_1500" );
    precacherumble( "generic_attack_light_2000" );
    precacherumble( "generic_attack_medium_500" );
    precacheshader( "h1_hud_tutorial_blur" );
    precacheshader( "h1_hud_tutorial_border" );
    level.heli_objective = precacheshader( "objective_heli" );
    level.last_price_kill = 0;
    maps\_utility::add_start( "rappel", ::rappel_out_of_hotel, &"STARTS_RAPPEL" );
    maps\_utility::add_start( "run", ::start_run, &"STARTS_RUN" );
    maps\_utility::add_start( "apart", ::start_apartment, &"STARTS_APART" );
    maps\_utility::add_start( "wounding", ::start_wounding, &"STARTS_WOUNDING" );
    maps\_utility::add_start( "crash", ::start_crash, &"STARTS_CRASH" );
    maps\_utility::add_start( "wounded", ::start_wounded, &"STARTS_WOUNDED" );
    maps\_utility::add_start( "burnt", ::start_burnt, &"STARTS_BURNT" );
    maps\_utility::add_start( "pool", ::start_pool, &"STARTS_POOL" );
    maps\_utility::add_start( "fair", ::start_fair, &"STARTS_FAIR" );
    maps\_utility::add_start( "fair_battle", ::start_fair_battle, &"STARTS_FAIRBATTLE" );
    maps\_utility::add_start( "fair_battle2", ::start_fair_battle, &"STARTS_FAIRBATTLE" );
    maps\_utility::add_start( "seaknight", ::start_seaknight, &"STARTS_SEAKNIGHT" );
    maps\_utility::default_start( ::snipe );
    createthreatbiasgroup( "price" );
    createthreatbiasgroup( "dog" );
    setignoremegroup( "price", "dog" );
    createthreatbiasgroup( "dog_allies" );
    setignoremegroup( "dog", "dog_allies" );
    setignoremegroup( "dog_allies", "dog" );
    setsaveddvar( "r_reactiveMotionWindAmplitudeScale", 3 );
    setsaveddvar( "r_reactiveMotionWindStrength", 1 );
    setsaveddvar( "r_reactiveMotionWindFrequencyScale", 3 );
    setsaveddvar( "r_reactiveMotionWindAreaScale", 33.3 );
    setsaveddvar( "r_reactiveMotionHelicopterRadius", 1000 );
    setsaveddvar( "r_reactiveMotionHelicopterStrength", 8 );
    level.weaponclipmodels = [];
    level.weaponclipmodels[0] = "weapon_dragunov_clip";
    level.weaponclipmodels[1] = "weapon_ak47_clip";
    level.weaponclipmodels[2] = "weapon_m16_clip";
    level.weaponclipmodels[3] = "weapon_m14_clip";
    level.weaponclipmodels[4] = "weapon_g3_clip";
    level.weaponclipmodels[5] = "weapon_mp5_clip";
    maps\sniperescape_code::set_legit_weapons_for_sniper_escape();
    maps\_load::main();
    maps\sniperescape_code::force_player_to_use_legit_sniper_escape_weapon();
    maps\sniperescape_lighting::main();
    maps\sniperescape_aud::main();
    maps\_compass::setupminimap( "compass_map_sniperescape" );
    var_0 = getaiarray( "allies" );
    common_scripts\utility::array_thread( var_0, maps\_stealth_logic::friendly_init );
    var_1 = getentarray( "actor_enemy_dog", "classname" );
    common_scripts\utility::array_thread( var_1, maps\_utility::add_spawn_function, maps\sniperescape_wounding::set_dog_threatbias_group );
    level.objectives = [];
    maps\sniperescape_wounding::addobj( "zakhaev" );
    maps\sniperescape_wounding::addobj( "future" );
    maps\sniperescape_wounding::addobj( "heli" );
    maps\sniperescape_wounding::addobj( "hotel" );
    maps\sniperescape_wounding::addobj( "heat" );
    maps\sniperescape_wounding::addobj( "wounded" );
    maps\sniperescape_wounding::addobj( "putdown" );
    maps\sniperescape_wounding::addobj( "prep" );
    maps\sniperescape_wounding::addobj( "holdout" );
    maps\sniperescape_wounding::addobj( "seaknight" );
    level.objectives["wounded"] = level.objectives["heat"];
    maps\_utility::add_hint_string( "claymore_plant", &"SCRIPT_LEARN_CLAYMORES", maps\sniperescape_exchange::should_break_claymores );
    maps\_utility::add_hint_string( "c4", &"SCRIPT_C4_USE", maps\sniperescape_exchange::should_break_c4 );
    maps\_utility::add_hint_string( "barrett", &"SNIPERESCAPE_PRESS_FORWARDS_OR_BACKWARDS", maps\sniperescape_exchange::should_break_zoom_hint );
    maps\_utility::add_hint_string( "where_is_he", &"SNIPERESCAPE_WHERE_IS_HE", maps\sniperescape_code::should_break_where_is_he );
    maps\sniperescape_code::set_c4_throw_binding();

    if ( level.start_point != "sunset" )
        thread maps\_radiation::main();

    maps\sniperescape_anim::main();
    level thread maps\sniperescape_amb::main();
    var_2 = getentarray( "curtain_left", "targetname" );
    common_scripts\utility::array_thread( var_2, maps\sniperescape_code::curtain, "curtain_left" );
    var_3 = getentarray( "curtain_right", "targetname" );
    common_scripts\utility::array_thread( var_3, maps\sniperescape_code::curtain, "curtain_right" );
    level.price = getent( "price", "targetname" );
    level.price thread priceinit();
    level.price pushplayer( 1 );
    level.price.dontavoidplayer = 1;
    level.price.interval = 0;
    level.price_sticky_target_time = 5000;
    maps\_utility::battlechatter_off( "allies" );
    thread maps\_utility::do_in_order( common_scripts\utility::flag_wait, "player_looks_through_skylight", common_scripts\_exploder::exploder, 1 );
    level.engagement_dist_func = [];
    maps\sniperescape_code::add_engagement_func( "actor_enemy_merc_SHTGN_winchester", maps\sniperescape_code::engagement_shotgun );
    maps\sniperescape_code::add_engagement_func( "actor_enemy_merc_AR_ak47", maps\sniperescape_code::engagement_rifle );
    maps\sniperescape_code::add_engagement_func( "actor_enemy_merc_LMG_rpd", maps\sniperescape_code::engagement_gun );
    maps\sniperescape_code::add_engagement_func( "actor_enemy_merc_SNPR_dragunov", maps\sniperescape_code::engagement_sniper );
    maps\sniperescape_code::add_engagement_func( "actor_enemy_merc_SMG_skorpion", maps\sniperescape_code::engagement_smg );
    var_4 = getaiarray( "axis" );
    common_scripts\utility::array_thread( var_4, maps\sniperescape_code::enemy_override );
    maps\_utility::add_global_spawn_function( "axis", maps\sniperescape_code::enemy_override );
    maps\_utility::add_global_spawn_function( "axis", maps\sniperescape_code::dog_check );
    maps\_utility::add_global_spawn_function( "axis", maps\sniperescape_code::price_kill_check );
    common_scripts\utility::flag_init( "player_on_barret" );
    common_scripts\utility::flag_init( "launch_zak" );
    common_scripts\utility::flag_init( "player_is_on_turret" );
    common_scripts\utility::flag_init( "player_rappels" );
    common_scripts\utility::flag_init( "exchange_heli_alerted" );
    common_scripts\utility::flag_init( "wounding_sight_blocker_deleted" );
    common_scripts\utility::flag_init( "heli_destroyed" );
    common_scripts\utility::flag_init( "player_gets_off_turret_fade" );
    common_scripts\utility::flag_init( "player_gets_off_turret" );
    common_scripts\utility::flag_init( "wounded_zak_runs_for_car" );
    common_scripts\utility::flag_init( "player_can_rappel" );
    common_scripts\utility::flag_init( "price_starts_rappel" );
    common_scripts\utility::flag_init( "price_comments_on_zak_miss" );
    common_scripts\utility::flag_init( "price_comments_on_zak_hit" );
    common_scripts\utility::flag_init( "makarov_killed" );
    common_scripts\utility::flag_init( "zak_uaz_leaves" );
    common_scripts\utility::flag_init( "zak_spawns" );
    common_scripts\utility::flag_init( "player_used_zoom" );
    common_scripts\utility::flag_init( "player_attacks_exchange" );
    common_scripts\utility::flag_init( "exchange_success" );
    common_scripts\utility::flag_init( "hotel_destroyed" );
    common_scripts\utility::flag_init( "apartment_explosion" );
    common_scripts\utility::flag_init( "heat_area_cleared" );
    common_scripts\utility::flag_init( "player_defends_heat_area" );
    common_scripts\utility::flag_init( "price_is_safe_after_wounding" );
    common_scripts\utility::flag_init( "price_was_hit_by_heli" );
    common_scripts\utility::flag_init( "price_picked_up" );
    common_scripts\utility::flag_init( "stop_adjusting_vision" );
    common_scripts\utility::flag_init( "beacon_placed" );
    common_scripts\utility::flag_init( "beacon_ready" );
    common_scripts\utility::flag_init( "seaknight_flies_in" );
    common_scripts\utility::flag_init( "enemy_choppers_incoming" );
    common_scripts\utility::flag_init( "first_pickup" );
    common_scripts\utility::flag_init( "seaknight_prepares_to_leave" );
    common_scripts\utility::flag_init( "seaknight_leaves" );
    common_scripts\utility::flag_init( "price_cuts_to_woods" );
    common_scripts\utility::flag_init( "player_moves_through_burnt_apartment" );
    common_scripts\utility::flag_init( "fairbattle_detected" );
    common_scripts\utility::flag_init( "price_can_be_left" );
    common_scripts\utility::flag_init( "fair_hold_fire" );
    common_scripts\utility::flag_init( "fairbattle_high_intensity" );
    common_scripts\utility::flag_init( "seaknight_lands" );
    common_scripts\utility::flag_init( "faiground_battle_begins" );
    common_scripts\utility::flag_init( "fairbattle_gunshot" );
    common_scripts\utility::flag_init( "price_wants_apartment_cleared" );
    common_scripts\utility::flag_init( "heli_comes_to_rest" );
    common_scripts\utility::flag_init( "heli_swap_dirt" );
    common_scripts\utility::flag_init( "can_manage_price" );
    common_scripts\utility::flag_set( "can_manage_price" );
    common_scripts\utility::flag_init( "price_moves_to_position" );
    common_scripts\utility::flag_init( "break_for_apartment" );
    common_scripts\utility::flag_init( "player_looked_in_pool" );
    common_scripts\utility::flag_init( "player_made_it_to_seaknight" );
    common_scripts\utility::flag_init( "player_putting_down_price_seaknight" );
    common_scripts\utility::flag_init( "price_calls_out_kills" );
    common_scripts\utility::flag_set( "price_calls_out_kills" );
    common_scripts\utility::flag_init( "price_calls_out_enemy_location" );
    common_scripts\utility::flag_set( "price_calls_out_enemy_location" );
    common_scripts\utility::flag_init( "price_told_player_to_go_prone" );
    common_scripts\utility::flag_init( "seaknight_leaves_prematurely" );
    common_scripts\utility::flag_init( "exchange_uazs_arrive" );
    common_scripts\utility::flag_init( "fence_dog_dies" );
    common_scripts\utility::flag_init( "heat_heli_transport" );
    common_scripts\utility::flag_init( "price_opens_door" );
    common_scripts\utility::flag_init( "kill_heli_attacks" );
    common_scripts\utility::flag_init( "price_is_put_down_near_wheel" );
    common_scripts\utility::flag_init( "fairbattle_threat_visible" );
    common_scripts\utility::flag_init( "put_price_near_wheel" );
    common_scripts\utility::flag_init( "heli_shot_down" );
    common_scripts\utility::flag_init( "can_use_turret" );
    common_scripts\utility::flag_init( "crash_heli_shows_up" );
    common_scripts\utility::flag_init( "price_arrives_wait_more_behind_node" );
    common_scripts\utility::flag_init( "aa_snipe" );
    common_scripts\utility::flag_init( "aa_heat" );
    common_scripts\utility::flag_init( "aa_wounded" );
    common_scripts\utility::flag_init( "aa_burnt_apartment" );
    common_scripts\utility::flag_init( "aa_seaknight_rescue" );
    common_scripts\utility::flag_init( "wounding_enemy_detected" );
    common_scripts\utility::flag_init( "carry_me_music_resume" );
    common_scripts\utility::flag_init( "music_fairgrounds_fade" );
    common_scripts\utility::flag_init( "havoc_hits_ground" );
    common_scripts\utility::flag_init( "rescue_music_start" );
    common_scripts\utility::flag_init( "zak_is_facing_player" );
    level.firstplay = 1;
    maps\_utility::add_wait( common_scripts\utility::flag_wait, "apartment_explosion" );
    maps\_utility::add_func( maps\sniperescape_exchange::blow_up_hotel );
    thread maps\_utility::do_wait();
    maps\_utility::add_wait( common_scripts\utility::flag_wait, "player_enters_fairgrounds" );
    maps\_utility::add_func( maps\sniperescape_wounding::check_for_price );
    thread maps\_utility::do_wait();
    var_5 = getentarray( "group_1", "script_noteworthy" );
    var_6 = spawnstruct();
    var_6.count = 0;
    common_scripts\utility::array_thread( var_5, maps\sniperescape_code::group1_enemies_think, var_6 );
    level.debounce_triggers = [];
    common_scripts\utility::run_thread_on_targetname( "leave_one", maps\sniperescape_code::leave_one_think );
    common_scripts\utility::run_thread_on_targetname( "heli_trigger", maps\sniperescape_code::heli_trigger );
    common_scripts\utility::run_thread_on_targetname( "block_path", maps\sniperescape_code::block_path );
    common_scripts\utility::run_thread_on_targetname( "debounce_trigger", maps\sniperescape_code::debounce_think );
    common_scripts\utility::run_thread_on_targetname( "set_go_line", maps\sniperescape_code::set_go_line );
    common_scripts\utility::run_thread_on_targetname( "enemy_door_trigger", maps\sniperescape_code::enemy_door_trigger );

    if ( getdvar( "use_old_obj_grass" ) == "1" )
        common_scripts\utility::run_thread_on_targetname( "grass_obj", maps\sniperescape_wounding::grass_obj );
    else
        thread maps\sniperescape_wounding::ferris_wheel_placement_objective();

    level.kill_heli_last_warning_refresh_time = 0;
    level.kill_heli_index = 0;
    level.kill_heli_progression = 0;
    level.kill_heli_progression_triggers = [];
    level.kill_heli_progression_triggers[0] = 0;
    level.kill_heli_progression_warnings = [];
    level.kill_heli_progression_warnings[0] = 0;
    level.kill_heli_triggers = [];
    common_scripts\utility::run_thread_on_targetname( "heat_progression", maps\sniperescape_code::heat_progression_summons_kill_heli );
    common_scripts\utility::run_thread_on_targetname( "uaz_placeholder", maps\sniperescape_code::deleteme );
    common_scripts\utility::run_thread_on_targetname( "deleteme", maps\sniperescape_code::deleteme );
    common_scripts\utility::run_thread_on_targetname( "bus_grenade_trigger", maps\sniperescape_wounding::bus_grenade_think );
    common_scripts\utility::run_thread_on_targetname( "fair_grenade_trigger", maps\sniperescape_wounding::fair_grenade_trigger_think );
    common_scripts\utility::run_thread_on_targetname( "script_animator", maps\sniperescape_wounding::script_animator );
    common_scripts\utility::run_thread_on_targetname( "merry_go_round_bottom", maps\sniperescape_wounding::merry_go_round_bottom );
    common_scripts\utility::run_thread_on_targetname( "merry_grass_delete", maps\sniperescape_wounding::merry_grass_delete );
    common_scripts\utility::run_thread_on_targetname( "final_heli_clip", maps\sniperescape_wounding::final_heli_clip );
    common_scripts\utility::run_thread_on_targetname( "heli_dirt_mesh", maps\sniperescape_wounding::heli_dirt_mesh );
    common_scripts\utility::run_thread_on_targetname( "heli_dirt_mesh_hide", maps\sniperescape_wounding::heli_dirt_mesh_hide );
    common_scripts\utility::run_thread_on_targetname( "heli_fence_clip", maps\sniperescape_wounding::heli_fence_clip_delete );
    common_scripts\utility::run_thread_on_noteworthy( "patrol_guy", maps\_utility::add_spawn_function, maps\sniperescape_code::patrol_guy );
    common_scripts\utility::run_thread_on_noteworthy( "chopper_guys", maps\_utility::add_spawn_function, maps\sniperescape_code::chopper_guys_land );
    common_scripts\utility::run_thread_on_noteworthy( "chase_chopper_guys", maps\_utility::add_spawn_function, maps\sniperescape_code::chase_chopper_guys_land );
    common_scripts\utility::run_thread_on_noteworthy( "house_chase_spawner", maps\_utility::add_spawn_function, maps\sniperescape_code::house_chase_spawner );
    thread maps\sniperescape_code::handle_radiation_warning();
    var_7 = getarraykeys( level.heli_flag );
    common_scripts\utility::array_levelthread( var_7, maps\sniperescape_wounding::helicopter_broadcast );
    maps\sniperescape_code::create_price_dialogue_master();
    wait 0.05;
    level.player setplayerturretfov( 70 );
    thread maps\sniperescape_exchange::player_learns_to_zoom();
    level.player allowstand( 1 );
    level.price thread monitor_macmellon();
    thread maps\_wibble::setup_wibble_triggers( 1, "seaknight_flies_in", "exterior", 0, 1 );
    thread set_combat_ads_lods_at_rappel();
}

monitor_macmellon()
{
    thread maps\_cheat::melonhead_monitor();
    self endon( "death" );
    self endon( "melonhead_monitor" );

    for (;;)
    {
        if ( level.melonhead_mode_enabled )
            self.name = "Cpt. MacMellon";
        else
            self.name = "Cpt. MacMillan";

        level waittill( "melonhead_mode_updated" );
    }
}

music()
{
    level endon( "music_fairgrounds_fade" );
    level endon( "havoc_hits_ground" );
    level endon( "rescue_music_start" );
    musicstop( 0.05 );
    wait 0.2;

    for (;;)
    {
        maps\_utility::musicplaywrapper( "sniperescape_secondary_run_music" );

        if ( !common_scripts\utility::flag( "fairbattle_detected" ) && common_scripts\utility::flag( "heat_enemies_back_off" ) )
            wait 56;
        else
            wait 24;

        if ( level.firstplay )
        {
            level.firstplay = 0;
            musicstop( 3 );
            wait 3.5;
            maps\_utility::musicplaywrapper( "sniperescape_secondary_run_music" );
            wait 24;
        }

        musicstop( 4 );
        wait 4.5;
        maps\_utility::musicplaywrapper( "sniperescape_run_music" );
        wait 134;
        musicstop( 2 );
        wait 2.5;
    }
}

music_helicrash()
{
    common_scripts\utility::flag_wait( "havoc_hits_ground" );
    wait 12;
    musicstop( 1 );
    common_scripts\utility::flag_wait( "carry_me_music_resume" );
    wait 0.1;
    thread music();
}

music_fairgrounds()
{
    level endon( "fairbattle_detected" );
    common_scripts\utility::flag_wait( "music_fairgrounds_fade" );
    musicstop( 8 );
    wait 8.5;

    for (;;)
    {
        maps\_utility::musicplaywrapper( "sniperescape_fairgrounds_music" );
        wait 101;
        musicstop( 1 );
        wait 1;
    }
}

music_fairground_battle()
{
    common_scripts\utility::flag_wait( "fairbattle_detected" );
    wait 15;
    musicstop( 6 );
    wait 6.1;
    thread music();
}

music_rescue()
{
    common_scripts\utility::flag_wait( "seaknight_flies_in" );
    wait 36;
    common_scripts\utility::flag_set( "rescue_music_start" );
    musicstop( 6 );
    wait 6.5;
    maps\_utility::musicplaywrapper( "sniperescape_rescue_music" );
}

priceinit()
{
    maps\_utility::spawn_failed( self );
    self.providecoveringfire = 0;
    thread maps\_utility::magic_bullet_shield();
    self.baseaccuracy = 1000;
    self.moveplaybackrate = 1.21;
    self.ignoresuppression = 1;
    self.animname = "price";
    self.ignorerandombulletdamage = 1;
    thread maps\_props::ghillie_leaves();
}

playerangles()
{
    for (;;)
        wait 0.05;
}

snipe()
{
    soundscripts\_snd::snd_message( "start_default_checkpoint" );
    objective_add( maps\sniperescape_wounding::getobj( "zakhaev" ), "active", &"SNIPERESCAPE_ELIMINATE_IMRAN_ZAKHAEV", maps\sniperescape_exchange::exchange_turret_org() );
    setsaveddvar( "xanim_disableFootIKOutsidePlayerView", 0 );
    level.player setplayerangles( ( 9.8, -104.0, 0.0 ) );
    maps\_utility::enable_scuff_footsteps_sound( 0 );
    thread maps\sniperescape_exchange::exchange_wind_flunctuates();
    thread maps\sniperescape_exchange::exchange_heli();
    thread maps\sniperescape_exchange::exchange_trace_converter();
    h1_set_up_mac_run_rappel();
    level.price thread price_watches();
    thread price_talks();
    thread maps\sniperescape_lighting::snipe_vision_adjust();
    thread maps\sniperescape_wounding::player_gets_on_barret();
    common_scripts\utility::run_thread_on_targetname( "flag_org", maps\sniperescape_exchange::exchange_flag );
    common_scripts\utility::run_thread_on_targetname( "uaz_clip_brush", maps\sniperescape_exchange::exchange_vehicle_clip );
    thread maps\sniperescape_exchange::barrett_intro();
    thread maps\sniperescape_exchange::exchange_claymore();
    thread exchange_uaz();
    thread maps\sniperescape_exchange::exchange_turret();
    thread maps\sniperescape_exchange::exchange_barrett_trigger();
    thread maps\sniperescape_exchange::exchange_vehicles_flee_conflict();
    thread maps\sniperescape_exchange::exchange_dof();
    thread maps\sniperescape_exchange::exchange_uaz_that_backs_up();
    thread maps\sniperescape_exchange::exchange_wind_flag();
    thread maps\sniperescape_exchange::exchange_wind_generator();
    thread maps\sniperescape_exchange::exchange_mission_failure();
    thread maps\sniperescape_exchange::flashback_guys_anim();
    thread maps\sniperescape_exchange::flashback_guys_failure();
    thread maps\sniperescape_exchange::flashback_time_paradox_monitor();
    common_scripts\utility::flag_set( "aa_snipe" );
    common_scripts\utility::run_thread_on_noteworthy( "leaning_smoker", maps\_utility::add_spawn_function, maps\sniperescape_exchange::lean_and_smoke );
    common_scripts\utility::run_thread_on_noteworthy( "standing_smoker", maps\_utility::add_spawn_function, maps\sniperescape_exchange::stand_and_smoke );
    var_0 = getentarray( "exchange_rider", "targetname" );
    common_scripts\utility::array_thread( var_0, maps\_utility::add_spawn_function, maps\_utility::set_ignoreall, 1 );
    common_scripts\utility::array_thread( var_0, maps\_utility::add_spawn_function, maps\sniperescape_exchange::exchange_baddie_main_think );
    common_scripts\utility::run_thread_on_targetname( "exchange_makarov", maps\_utility::add_spawn_function, maps\sniperescape_exchange::flashback_guy_setup );
    common_scripts\utility::run_thread_on_targetname( "exchange_yuri", maps\_utility::add_spawn_function, maps\sniperescape_exchange::flashback_guy_setup );
    var_1 = getentarray( "exchange_guard", "targetname" );
    common_scripts\utility::array_thread( var_1, maps\_utility::add_spawn_function, maps\_utility::set_ignoreall, 1 );
    common_scripts\utility::array_thread( var_1, maps\_utility::add_spawn_function, maps\sniperescape_exchange::exchange_baddie_main_think );
    common_scripts\utility::array_thread( var_1, maps\_utility::add_spawn_function, maps\sniperescape_exchange::exchange_bored_idle );
    common_scripts\utility::array_thread( var_1, maps\_utility::spawn_ai );
    var_2 = getentarray( "exchange_baddy", "targetname" );
    common_scripts\utility::array_thread( var_2, maps\_utility::add_spawn_function, maps\_utility::set_ignoreall, 1 );
    common_scripts\utility::array_thread( var_2, maps\_utility::add_spawn_function, maps\sniperescape_exchange::exchange_baddie_main_think );
    var_3 = maps\_utility::array_spawn( var_2 );
    level.exchanger_surprise_time = 0.5;
    var_4 = var_3[0];
    var_5 = var_3[1];
    var_4.animname = "guard";
    var_5.animname = "dealer";
    var_4.main_baddie = 1;
    var_5.main_baddie = 1;
    var_6 = getent( "exchange_org", "targetname" );
    var_6 thread maps\_anim::anim_loop( var_3, "exchange_idle" );
    maps\sniperescape_exchange::exchange_zak_and_guards_jab_it_up( var_6, var_3 );
    var_6 notify( "stop_loop" );
    level.price allowedstances( "prone", "crouch", "stand" );
    common_scripts\utility::flag_wait_either( "player_attacks_exchange", "zakhaev_escaped" );
    musicstop( 3 );
    wait 0.25;
    maps\sniperescape_code::price_clears_dialogue();

    if ( !common_scripts\utility::flag( "exchange_success" ) )
        common_scripts\utility::flag_wait( "exchange_success" );

    maps\_utility::objective_complete( maps\sniperescape_wounding::getobj( "zakhaev" ) );
    wait 2;

    if ( !common_scripts\utility::flag( "heli_destroyed" ) )
    {
        maps\sniperescape_code::price_line( "take_out_that_heli" );
        objective_add( maps\sniperescape_wounding::getobj( "heli" ), "active", &"SNIPERESCAPE_TAKE_OUT_THE_ATTACK_CHOPPER", maps\sniperescape_exchange::exchange_turret_org() );
        common_scripts\utility::flag_wait( "heli_destroyed" );
        maps\_utility::objective_complete( maps\sniperescape_wounding::getobj( "heli" ) );
    }

    thread maps\sniperescape_exchange::exchange_heli_second_wave();
    objective_add( maps\sniperescape_wounding::getobj( "hotel" ), "active", &"SNIPERESCAPE_GET_OUT_OF_THE_HOTEL", maps\sniperescape_wounding::rappel_obj_org() );
    objective_current( maps\sniperescape_wounding::getobj( "hotel" ) );
    maps\sniperescape_code::price_line( "great_shot_now_go" );
    thread music();
    thread music_helicrash();
    thread music_fairgrounds();
    thread music_fairground_battle();
    thread music_rescue();
    wait 2.0;
    common_scripts\utility::flag_set( "player_gets_off_turret_fade" );
    wait 0.5;
    common_scripts\utility::flag_set( "player_gets_off_turret" );
    setomnvar( "ui_barret", 0 );
    soundscripts\_snd::snd_message( "escape_hotel_mix" );
    var_7 = getent( "inc_heli_sfx_1", "targetname" );
    var_8 = getent( "inc_heli_sfx_2", "targetname" );
    var_7 thread common_scripts\utility::play_sound_in_space( "scn_se_havoc_inbound1", var_7.origin );
    var_8 thread common_scripts\utility::play_sound_in_space( "scn_se_havoc_inbound2", var_8.origin );
    maps\_utility::enable_scuff_footsteps_sound( 1 );
    thread rappel_out_of_hotel();
    setsaveddvar( "xanim_disableFootIKOutsidePlayerView", 1 );
}

exchange_uaz()
{
    var_0 = getentarray( "base_uaz", "targetname" );
    common_scripts\utility::array_thread( var_0, maps\sniperescape_exchange::exchange_uaz_preps_for_escape );
    var_1 = maps\_vehicle::spawn_vehicles_from_targetname( "uaz" );
    common_scripts\utility::array_thread( var_1, maps\sniperescape_exchange::exchange_uaz_preps_for_escape );
    var_2 = maps\sniperescape_wounding::get_ent_with_key_from_array( var_1, "zaks_ride", "script_noteworthy" );
    level.flashback_guys_uaz = maps\sniperescape_wounding::get_ent_with_key_from_array( var_1, "flashback_guys_uaz", "script_noteworthy" );
    level.flashback_guys_uaz thread maps\sniperescape_exchange::flashback_uaz_stop_while_driverdead();
    var_3 = getent( "jeep_window", "targetname" );
    var_3 linkto( var_2, "body_animate_jnt", ( -20.0, 0.0, 54.0 ), ( 0.0, 180.0, 0.0 ) );
    wait 2;
    common_scripts\utility::flag_wait( "player_on_barret" );
    common_scripts\utility::array_levelthread( var_1, maps\_vehicle::gopath );
    common_scripts\utility::flag_wait( "zak_arrives" );
    wait 2;
    common_scripts\utility::flag_set( "exchange_uazs_arrive" );
}

price_watches( var_0 )
{
    self.animname = "price";
    var_1 = spawn( "script_model", ( 0.0, 0.0, 0.0 ) );
    var_1 setmodel( level.scr_model["binocs"] );
    var_1 linkto( self, "TAG_INHAND", ( 0.0, 0.0, 0.0 ), ( 0.0, 0.0, 0.0 ) );
    level.binocs = var_1;
    var_2 = getent( self.target, "targetname" );
    var_2 maps\_anim::anim_single_solo( self, "intro_spotter" );
    var_2 thread maps\_anim::anim_loop_solo( self, "spotter_idle" );
}

price_talks()
{
    level endon( "player_attacks_exchange" );
    maps\sniperescape_code::price_line( "transport_sighted" );
    common_scripts\utility::flag_wait( "player_on_barret" );
    maps\_utility::musicplaywrapper( "sniperescape_exchange_music" );
    wait 1.25;
    thread maps\sniperescape_code::price_line( "get_on_barrett" );
    maps\sniperescape_code::price_line( "remember_my_teaching" );
    common_scripts\utility::flag_wait( "zak_is_seen" );
    common_scripts\utility::flag_set( "launch_zak" );
    level.wind_setting = "middle";
    maps\_utility::delaythread( 25.8, common_scripts\utility::flag_set, "block_heli_starts" );
    wait 5.6;
    maps\sniperescape_code::price_line( "i_see_him" );
    thread maps\sniperescape_code::price_line( "target_acquired" );
    thread maps\sniperescape_code::price_line( "wind_picked_up" );
    common_scripts\utility::flag_wait( "block_heli_arrives" );
    level.helitimer = gettime();
    wait 1.2;
    thread maps\sniperescape_code::price_line( "where_did_he_come_from" );
    common_scripts\utility::flag_wait( "block_heli_moves" );
    wait 13;
    level.wind_setting = "start";
    wait 3;
    level notify( "wind_stops_flunctuating" );
    level.wind_vel = 0;
    level.wind_setting = "end";
    wait 5;
    maps\sniperescape_code::price_line( "now_or_never" );
    musicstop( 3 );
}

barline()
{
    for (;;)
        wait 0.05;
}

setup_rappel()
{
    var_0 = getent( "rappel_trigger", "targetname" );
    var_0 common_scripts\utility::trigger_off();
    var_1 = maps\_utility::spawn_anim_model( "rope" );
    level.rope = var_1;
    var_2 = getnode( "price_rappel_node", "targetname" );
    var_2 thread maps\_anim::anim_first_frame_solo( var_1, "rappel_start" );
    var_3 = getent( "bullet_block", "targetname" );
    var_3 delete();
    var_4 = getent( level.price.target, "targetname" );
    var_4 notify( "stop_loop" );
    level.price stopanimscripted();
    common_scripts\utility::flag_clear( "aa_snipe" );
    var_4 maps\_anim::anim_single_solo( level.price, "spotter_exit" );

    if ( isdefined( level.binocs ) )
        level.binocs delete();
}

trigger_monitor_player_lean()
{
    self endon( "stop_monitor_lean" );

    for (;;)
    {
        if ( level.player isleaning() )
            common_scripts\utility::trigger_off();
        else
            common_scripts\utility::trigger_on();

        waitframe();
    }
}

player_rappel()
{
    var_0 = getnode( "player_rappel_node", "targetname" );
    var_1 = maps\_utility::spawn_anim_model( "player_rope" );
    var_0 thread maps\_anim::anim_first_frame_solo( var_1, "rappel_for_player" );
    var_2 = maps\_utility::spawn_anim_model( "player_rope_obj" );
    var_0 thread maps\_anim::anim_first_frame_solo( var_2, "rappel_for_player" );
    var_2 hide();
    var_3 = maps\_utility::spawn_anim_model( "player_rappel" );
    var_3 hide();
    var_0 maps\_anim::anim_first_frame_solo( var_3, "rappel" );
    var_4 = getent( "rappel_trigger", "targetname" );
    var_4.origin = ( 481.4, -10823.2, 1068.9 );
    var_4 sethintstring( &"SNIPERESCAPE_HOLD_1_TO_RAPPEL" );
    var_2 show();
    var_4 thread trigger_monitor_player_lean();

    for (;;)
    {
        var_4 waittill( "trigger" );
        waitframe();

        if ( !level.player isleaning() )
        {
            var_4 notify( "stop_monitor_lean" );
            break;
        }
    }

    var_4 delete();
    thread maps\sniperescape_lighting::vision_glow_change();
    var_2 hide();
    common_scripts\utility::flag_set( "player_rappels" );
    soundscripts\_snd::snd_message( "rappel_foley_mix" );
    level.rappel_buffer = gettime();
    level.timer = gettime();
    level.player thread maps\sniperescape_code::take_weapons();
    thread rappel_rumble();
    maps\_utility::delaythread( 1.2, common_scripts\utility::flag_set, "apartment_explosion" );
    setsaveddvar( "bg_scriptFullPitchRange", 1 );
    var_3 maps\_utility::lerp_player_view_to_tag( "tag_player", 0.5, 0.9, 5, 5, 45, 0 );
    level.player allowcrouch( 0 );
    level.player allowprone( 0 );
    level.player allowlean( 0 );
    level.player playerlinktodelta( var_3, "tag_player", 1.0, 0, 0, 0, 0 );
    var_3 show();
    var_0 thread maps\_anim::anim_single_solo( var_3, "rappel" );
    var_0 thread maps\_anim::anim_single_solo( var_1, "rappel_for_player" );
    var_0 waittill( "rappel" );
    level.player unlink();
    setsaveddvar( "cg_drawCrosshair", getdvar( "cg_drawCrosshairOption", 1 ) );
    setsaveddvar( "bg_scriptFullPitchRange", 0 );
    level.player allowcrouch( 1 );
    level.player allowprone( 1 );
    level.player allowlean( 1 );
    var_3 delete();
    common_scripts\utility::flag_set( "can_save" );
    maps\_utility::objective_complete( maps\sniperescape_wounding::getobj( "hotel" ) );
    level.player maps\sniperescape_code::give_back_weapons();
    maps\_utility::delaythread( 1.5, common_scripts\utility::flag_set, "heli_moves_on" );
}

rappel_rumble()
{
    var_0 = [];
    var_0 = maps\_utility::rumble_sequence_add_key( var_0, 1.02, "generic_attack_light_500" );
    var_0 = maps\_utility::rumble_sequence_add_key( var_0, 3.36, "generic_attack_light_1500" );
    var_0 = maps\_utility::rumble_sequence_add_key( var_0, 4.81, "generic_attack_light_2000" );
    var_0 = maps\_utility::rumble_sequence_add_key( var_0, 6.13, "generic_attack_light_2000" );
    var_0 = maps\_utility::rumble_sequence_add_key( var_0, 7.45, "generic_attack_light_2000" );
    var_0 = maps\_utility::rumble_sequence_add_key( var_0, 8.37, "generic_attack_medium_500" );
    level.player thread maps\_utility::rumble_sequence_play( var_0, 0 );
}

rappel_out_of_hotel()
{
    soundscripts\_snd::snd_message( "start_rappel_checkpoint" );
    wait 0.05;
    thread setup_rappel();
    thread player_rappel();
    var_0 = getnode( "price_rappel_node", "targetname" );
    common_scripts\utility::flag_set( "player_can_rappel" );

    if ( getdvarint( "use_old_macmillan_rappel" ) == 1 )
        var_0 thread maps\_anim::anim_reach_solo( level.price, "rappel_start" );
    else
        h1_handle_mac_run_past_chair();

    maps\_utility::delaythread( 2, common_scripts\_exploder::exploder, 6 );
    var_1 = [];
    var_1[var_1.size] = level.price;
    var_1[var_1.size] = level.rope;

    if ( !common_scripts\utility::flag( "player_rappels" ) )
        price_climbs_until_player_rappels( var_1, var_0 );

    if ( !common_scripts\utility::flag( "price_starts_rappel" ) )
    {
        level.price_anim_start_time = gettime() + 100;
        var_0 maps\_utility::delaythread( 0.1, maps\_anim::anim_single, var_1, "rappel_start" );
    }

    wait 0.15;
    var_2 = 1;

    if ( !isdefined( level.rappel_buffer ) )
        wait(var_2);
    else
        maps\_utility::wait_for_buffer_time_to_pass( level.rappel_buffer, var_2 );

    var_3 = getanimlength( level.price maps\_utility::getanim( "rappel_start" ) );
    var_4 = gettime() - level.price_anim_start_time;
    var_5 = var_4 * 0.001 / var_3;
    var_6 = 0.51;

    if ( var_5 < var_6 )
    {
        level.price maps\_anim::anim_self_set_time( "rappel_start", var_6 );
        level.rope maps\_anim::anim_self_set_time( "rappel_start", var_6 );
    }

    level.price common_scripts\utility::waittillend( "single anim" );
    level.price.a.pose = "stand";
    level.move_in_trigger_used = [];
    common_scripts\utility::run_thread_on_targetname( "move_in_trigger", maps\sniperescape_code::move_in );
    var_3 = getanimlength( level.price maps\_utility::getanim( "rappel_end" ) );
    var_0 thread maps\_anim::anim_single( var_1, "rappel_end" );
    wait(var_3 - 0.5);
    level.price maps\_anim::anim_self_set_time( "rappel_end", 1 );
    setsaveddvar( "phys_bulletspinscale", "3" );
    level.price maps\_utility::set_force_color( "r" );
    thread battle_through_heat_area();
}

activate_chair_clip()
{
    level endon( "player_rappels" );

    while ( level.player istouching( self ) )
        waitframe();

    self solid();
}

price_climbs_until_player_rappels( var_0, var_1 )
{
    level endon( "player_rappels" );
    level.price waittill( "goal" );
    thread apartment_explosion();
    common_scripts\utility::flag_set( "price_starts_rappel" );
    level.price_anim_start_time = gettime();
    var_1 maps\_anim::anim_single( var_0, "rappel_start" );

    if ( !common_scripts\utility::flag( "player_rappels" ) )
    {
        var_1 thread maps\_anim::anim_loop( var_0, "rappel_idle", "stop_idle" );
        common_scripts\utility::flag_wait( "player_rappels" );
        var_1 notify( "stop_idle" );
    }

    maps\_utility::arcademode_checkpoint( 5, "a" );
    var_1 thread maps\_anim::anim_single( var_0, "rappel_end" );
}

apartment_explosion()
{
    wait 4.0;
    common_scripts\utility::flag_set( "apartment_explosion" );
}

start_run()
{
    soundscripts\_snd::snd_message( "start_run_checkpoint" );
    thread music();
    thread maps\sniperescape_lighting::vision_glow_change();
    var_0 = getaispeciesarray( "axis", "all" );
    common_scripts\utility::array_thread( var_0, maps\sniperescape_code::delete_living );
    var_1 = getnode( "tele_node", "targetname" );
    var_2 = getent( "tele_org", "targetname" );
    level.move_in_trigger_used = [];
    common_scripts\utility::run_thread_on_targetname( "move_in_trigger", maps\sniperescape_code::move_in );
    level.player setplayerangles( ( 0.0, 0.0, 0.0 ) );
    level.player setorigin( var_2.origin + ( 0.0, 0.0, -34341.0 ) );
    level.price teleport( var_1.origin );
    maps\sniperescape_wounding::plant_price();
    level.player setorigin( var_2.origin );
    thread battle_through_heat_area();
}

battle_through_heat_area()
{
    thread maps\sniperescape_code::kill_heli_logic();
    level.price.dontshootwhilemoving = 1;
    thread maps\sniperescape_wounding::heat_helis_transport_guys_in();
    var_0 = getentarray( "weapons_dealer", "targetname" );
    common_scripts\utility::array_thread( var_0, maps\sniperescape_code::delete_living );
    thread maps\sniperescape_code::enemy_accuracy_assignment();
    var_1 = getentarray( "east_spawner", "targetname" );
    thread maps\sniperescape_code::heat_spawners_attack( var_1, "start_heat_spawners", "stop_heat_spawners" );
    var_2 = getentarray( "west_spawner", "targetname" );
    thread maps\sniperescape_code::heat_spawners_attack( var_2, "start_heat_spawners", "stop_heat_spawners" );
    wait 1;
    common_scripts\utility::flag_set( "aa_heat" );
    level.price maps\_anim::anim_single_queue( level.price, "follow_me" );
    objective_add( maps\sniperescape_wounding::getobj( "heat" ), "active", &"SNIPERESCAPE_REACH_THE_EXTRACTION", maps\sniperescape_code::extraction_point() );
    objective_current( maps\sniperescape_wounding::getobj( "heat" ) );
    thread maps\sniperescape_wounding::modify_objective_destination_babystep( maps\sniperescape_wounding::getobj( "heat" ) );
    level.timer = gettime();
    maps\_utility::delaythread( 1, maps\sniperescape_code::price_line, "compromised" );
    maps\_utility::delaythread( 3, maps\sniperescape_code::price_line, "eta_20_min" );
    maps\_utility::delaythread( 9.35, maps\_utility::autosave_by_name, "eta_20_min" );
    maps\_utility::delaythread( 5.5, maps\sniperescape_code::countdown, 20 );
    thread price_runs_for_woods_on_contact();
    common_scripts\utility::flag_wait( "start_heat_spawners" );
    maps\_vehicle::spawn_vehicle_from_targetname_and_drive( "introchopper1" );
    common_scripts\utility::flag_wait( "heat_enemies_back_off" );
    waittillframeend;
    maps\_utility::activate_trigger_with_targetname( "price_heads_for_apartment" );
    thread maps\sniperescape_code::defend_heat_area_until_enemies_leave();
    level.price maps\_utility::set_force_color( "y" );
    thread the_apartment();
}

price_runs_for_woods_on_contact()
{
    common_scripts\utility::flag_wait( "start_heat_spawners" );
    level.price maps\_utility::set_force_color( "b" );
    level.price.dontshootwhilemoving = undefined;
    common_scripts\utility::flag_set( "price_cuts_to_woods" );
}

start_apartment()
{
    soundscripts\_snd::snd_message( "start_apart_checkpoint" );
    thread music();
    thread maps\sniperescape_lighting::vision_glow_change();
    thread maps\sniperescape_code::countdown( 18 );
    objective_add( maps\sniperescape_wounding::getobj( "heat" ), "active", &"SNIPERESCAPE_FOLLOW_CPT_MACMILLAN", maps\sniperescape_code::extraction_point() );
    objective_current( maps\sniperescape_wounding::getobj( "heat" ) );
    var_0 = getaispeciesarray( "axis", "all" );
    common_scripts\utility::array_thread( var_0, maps\sniperescape_code::delete_living );
    var_1 = getent( "price_apartment_org", "targetname" );
    var_2 = getent( "player_apartment_org", "targetname" );
    level.player setplayerangles( ( 0.0, 0.0, 0.0 ) );
    level.player setorigin( var_2.origin + ( 0.0, 0.0, -34341.0 ) );
    level.price teleport( var_1.origin );
    maps\sniperescape_wounding::plant_price();
    level.player setorigin( var_2.origin );
    level.price maps\_utility::set_force_color( "y" );
    thread the_apartment();
}

the_apartment()
{
    thread maps\sniperescape_code::set_min_time_remaining( 8 );
    common_scripts\utility::flag_set( "break_for_apartment" );
    common_scripts\utility::flag_clear( "aa_heat" );
    thread maps\sniperescape_wounding::apartment_price_waits_for_dog_death();
    level notify( "stop_adjusting_enemy_accuracy" );
    level.price thread maps\_anim::anim_single_queue( level.price, "lose_them_in_apartment" );
    var_0 = getent( "price_explore_trigger", "targetname" );
    var_0 waittill( "trigger" );
    var_1 = getent( var_0.target, "targetname" );
    maps\_utility::autosave_by_name( "into_the_apartment" );
    maps\_utility::arcademode_checkpoint( 4, "b" );
    common_scripts\utility::flag_set( "price_opens_door" );
    thread maps\sniperescape_code::player_touches_wounded_blocker();
    maps\_utility::activate_trigger_with_targetname( "price_opens_door" );
    var_1 maps\_anim::anim_reach_solo( level.price, "spin" );
    var_2 = getanimlength( level.price maps\_utility::getanim( "spin" ) );
    var_2 *= 0.87;
    var_1 thread maps\_anim::anim_single_solo( level.price, "spin" );
    wait(var_2);
    level.price stopanimscripted();
    level.price clearenemy();
    level.price thread maps\_utility::set_ignoreall( 1 );
    var_3 = getnode( "slow_door_macmillan_node", "targetname" );
    var_3 maps\_anim::anim_reach_solo( level.price, "smooth_door_open_init" );
    var_3 maps\_anim::anim_single_solo( level.price, "smooth_door_open_init" );
    var_4 = getent( "slow_door", "targetname" );
    var_5 = getent( "slow_door_model", "targetname" );
    var_5 linkto( var_4 );
    var_4 thread maps\_utility::palm_style_door_open();
    var_3 maps\_anim::anim_single_solo( level.price, "smooth_door_open" );
    level.price maps\_utility::set_force_color( "y" );
    thread window_mantle_transition();
    common_scripts\utility::flag_wait( "fence_dog_attacks" );
    level.price clearenemy();
    level.price thread maps\_utility::set_ignoreall( 0 );
    thread maps\sniperescape_code::dog_attacks_fence();
    thread the_wounding();
}

window_mantle_transition()
{
    var_0 = getent( "mantle_disable_cqb", "targetname" );

    for (;;)
    {
        var_0 waittill( "trigger", var_1 );

        if ( var_1 == level.price )
            break;
    }

    level.price maps\_utility::disable_cqbwalk();
    var_0 = getent( "mantle_enable_cqb", "targetname" );

    for (;;)
    {
        var_0 waittill( "trigger", var_1 );

        if ( var_1 == level.price )
            break;
    }

    level.price maps\_utility::enable_cqbwalk();
}

start_wounding()
{
    soundscripts\_snd::snd_message( "start_wounding_checkpoint" );
    thread music();
    thread maps\sniperescape_lighting::vision_glow_change();
    objective_add( maps\sniperescape_wounding::getobj( "heat" ), "active", &"SNIPERESCAPE_FOLLOW_CPT_MACMILLAN", maps\sniperescape_code::extraction_point() );
    objective_current( maps\sniperescape_wounding::getobj( "heat" ) );
    thread maps\sniperescape_code::countdown( 16 );
    var_0 = getaispeciesarray( "axis", "all" );
    common_scripts\utility::array_thread( var_0, maps\sniperescape_code::delete_living );
    var_1 = getent( "price_apart_org", "targetname" );
    var_2 = getent( "player_apart_org", "targetname" );
    level.player setplayerangles( var_2.angles );
    level.player setorigin( var_2.origin + ( 0.0, 0.0, -34341.0 ) );
    level.price teleport( var_1.origin );
    maps\sniperescape_wounding::plant_price();
    level.player setorigin( var_2.origin );
    level.price setgoalpos( level.price.origin );
    level.price maps\_utility::enable_cqbwalk();
    level.price maps\_utility::set_force_color( "y" );
    thread the_wounding();
    thread maps\sniperescape_code::player_touches_wounded_blocker();
}

start_crash()
{
    soundscripts\_snd::snd_message( "start_crash_checkpoint" );
    thread music();
    thread maps\sniperescape_lighting::vision_glow_change();
    objective_add( maps\sniperescape_wounding::getobj( "heat" ), "active", &"SNIPERESCAPE_FOLLOW_CPT_MACMILLAN", maps\sniperescape_code::extraction_point() );
    objective_current( maps\sniperescape_wounding::getobj( "heat" ) );
    thread maps\sniperescape_code::countdown( 16 );
    var_0 = getaispeciesarray( "axis", "all" );
    common_scripts\utility::array_thread( var_0, maps\sniperescape_code::delete_living );
    var_1 = getent( "price_apart_org", "targetname" );
    var_2 = getent( "player_wounding_org", "targetname" );
    level.player setplayerangles( var_2.angles );
    level.player setorigin( var_2.origin + ( 0.0, 0.0, -34341.0 ) );
    level.price teleport( var_1.origin );
    var_3 = getnode( "price_wounding_node", "targetname" );
    var_3 maps\_anim::anim_teleport_solo( level.price, "crash" );
    maps\sniperescape_wounding::plant_price();
    level.player setorigin( var_2.origin );
    level.price setgoalpos( level.price.origin );
    level.price maps\_utility::enable_cqbwalk();
    level.price maps\_utility::set_force_color( "y" );
    thread maps\sniperescape_code::player_touches_wounded_blocker();
    thread maps\sniperescape_wounding::heli_attacks_price_new();
    wait 1;
    common_scripts\utility::array_thread( level.deathflags["surprise_guys_dead"]["ai"], maps\_utility::self_delete );
    common_scripts\utility::array_thread( level.deathflags["surprise_guys_dead"]["spawners"], maps\_utility::self_delete );
    common_scripts\utility::flag_set( "surprise_guys_dead" );
    common_scripts\utility::flag_set( "patrol_guys_dead" );
    level waittill( "start_continues" );
    common_scripts\utility::flag_set( "heli_shot_down" );
}

the_wounding()
{
    thread maps\sniperescape_code::set_min_time_remaining( 7 );
    common_scripts\utility::flag_set( "price_calls_out_kills" );
    common_scripts\utility::flag_wait( "price_signals_holdup" );

    if ( !maps\sniperescape_wounding::player_is_enemy() && !common_scripts\utility::flag( "wounding_enemy_detected" ) )
    {
        maps\sniperescape_wounding::price_goes_to_window_to_shoot();
        level.price.ignoreme = 0;
    }

    level.price pushplayer( 1 );
    level.price maps\_utility::enable_ai_color();
    maps\_utility::activate_trigger_with_targetname( "price_moves_to_window_trigger" );
    level.price.ignoreall = 0;
    maps\sniperescape_code::delete_wounding_sight_blocker();
    wait 2.5;
    common_scripts\utility::flag_wait_either( "patrol_guys_dead", "player_touches_wounding_clip" );
    level.price maps\_utility::disable_ai_color();
    level.price.fixednodesaferadius = 32;
    level.price.fixednode = 1;
    level.price.goalradius = 32;
    var_0 = getnode( "price_wait_more_behind_node", "targetname" );
    level.price setgoalnode( var_0 );
    thread confirm_price_at_goal();
    common_scripts\utility::flag_wait( "player_touches_wounding_clip" );
    var_1 = getentarray( "surprise_spawner", "targetname" );
    common_scripts\utility::array_thread( var_1, maps\_utility::add_spawn_function, ::surprisers_interval );
    common_scripts\utility::array_thread( var_1, maps\_utility::add_spawn_function, ::surprisers_goal );
    common_scripts\utility::array_thread( var_1, maps\_utility::spawn_ai );
    level.price maps\_utility::delaythread( 2, maps\_anim::anim_single_queue, level.price, "more_behind" );
    level.price maps\_utility::delaythread( 2, ::fight_enemies_behind );
    common_scripts\utility::flag_wait( "price_arrives_wait_more_behind_node" );
    level.price.maxvisibledist = 8000;
    thread maps\sniperescape_wounding::heli_attacks_price_new();
}

confirm_price_at_goal()
{
    level.price waittill( "goal" );
    common_scripts\utility::flag_set( "price_arrives_wait_more_behind_node" );
}

fight_enemies_behind()
{
    level endon( "crash_heli_shows_up" );

    if ( common_scripts\utility::flag( "price_arrives_wait_more_behind_node" ) )
        maps\_anim::anim_single_solo( self, "behind_turn" );

    var_0 = getnode( "price_more_behind_node", "targetname" );
    self setgoalnode( var_0 );
}

surprisers_interval()
{
    self.interval = 128;
}

surprisers_goal()
{
    var_0 = getnode( "surprise_guys_goal", "script_noteworthy" );

    if ( isdefined( var_0 ) )
        maps\_utility::set_goal_node( var_0 );
}

heli_attacks_price()
{
    var_0 = getnode( "price_apartment_destination_node", "targetname" );
    var_1 = maps\_vehicle::spawn_vehicle_from_targetname_and_drive( "heli_price" );
    level.price_heli = var_1;
    var_1 thread maps\_vehicle_code::helipath( var_1.target, 70, 70 );
    wait 1;
    level.price endon( "death" );
    level.price thread maps\_anim::anim_single_queue( level.price, "more_behind" );
    var_0 maps\_anim::anim_reach_solo( level.price, "wounded_begins" );
    common_scripts\utility::flag_wait( "price_heli_in_position" );
    var_0 maps\_anim::anim_reach_solo( level.price, "wounded_begins" );
    maps\_utility::delaythread( 5.5, common_scripts\utility::flag_set, "price_heli_moves_on" );
    var_2 = getent( "wounding_target", "targetname" );
    var_1 maps\_utility::delaythread( 6.5, maps\sniperescape_code::heli_shoots_rockets_at_ent, var_2 );
    maps\_utility::delaythread( 7.2, common_scripts\_exploder::exploder, 500 );
    var_0 maps\_anim::anim_single_solo( level.price, "wounded_begins" );
    thread wounded_combat();
}

price_waits_for_enemies_to_walk_past()
{
    if ( common_scripts\utility::flag( "enemies_walked_past" ) )
        return;

    if ( common_scripts\utility::flag( "wounding_sight_blocker_deleted" ) )
        return;

    level endon( "wounding_sight_blocker_deleted" );
    common_scripts\utility::flag_wait( "price_says_wait" );
    maps\_utility::autosave_by_name( "standby" );
    common_scripts\utility::flag_wait( "walked_past_price" );
    level.price thread maps\_anim::anim_single_queue( level.price, "now" );
}

start_wounded()
{
    soundscripts\_snd::snd_message( "start_wounded_checkpoint" );
    thread music();
    thread maps\sniperescape_lighting::vision_glow_change();
    objective_add( maps\sniperescape_wounding::getobj( "heat" ), "active", &"SNIPERESCAPE_FOLLOW_CPT_MACMILLAN", maps\sniperescape_code::extraction_point() );
    objective_current( maps\sniperescape_wounding::getobj( "heat" ) );
    var_0 = getent( "wounding_sight_blocker", "targetname" );
    var_0 connectpaths();
    var_0 delete();
    thread maps\sniperescape_code::countdown( 13 );
    var_1 = getaispeciesarray( "axis", "all" );
    common_scripts\utility::array_thread( var_1, maps\sniperescape_code::delete_living );
    var_2 = getnode( "price_apartment_destination_node", "targetname" );
    var_3 = getent( "player_post_wound_org", "targetname" );
    level.player setplayerangles( var_3.angles );
    level.player setorigin( var_3.origin + ( 0.0, 0.0, -34341.0 ) );
    level.price teleport( var_2.origin );
    maps\sniperescape_wounding::plant_price();
    level.player setorigin( var_3.origin );
    level.price maps\_utility::disable_ai_color();
    thread wounded_combat();
}

wounded_combat()
{
    level.price endon( "death" );
    maps\_spawner::kill_spawnernum( 10 );
    common_scripts\utility::run_thread_on_noteworthy( "flee_guy", maps\_utility::add_spawn_function, maps\sniperescape_code::flee_guy_runs );
    common_scripts\utility::run_thread_on_noteworthy( "force_patrol", maps\_utility::add_spawn_function, maps\sniperescape_code::force_patrol_think );
    maps\_utility::add_global_spawn_function( "axis", maps\sniperescape_code::on_the_run_enemies );
    common_scripts\utility::run_thread_on_targetname( "wounded_combat_trigger", maps\sniperescape_code::wounded_combat_trigger );
    thread maps\sniperescape_code::second_apartment_line();
    common_scripts\utility::flag_set( "price_is_safe_after_wounding" );
    maps\_utility::autosave_by_name( "carry_price" );
    maps\sniperescape_code::kill_all_enemies();
    thread maps\sniperescape_code::price_line( "cant_move_3" );
    objective_string( maps\sniperescape_wounding::getobj( "wounded" ), &"SNIPERESCAPE_PICK_UP_CPT_MACMILLAN" );
    objective_position( maps\sniperescape_wounding::getobj( "wounded" ), level.price.origin );
    level notify( "stop_updating_objective" );
    thread escort_to_park();
}

escort_to_park()
{
    thread maps\sniperescape_code::set_min_time_remaining( 5 );
    thread maps\sniperescape_code::price_wounded_logic();
    thread maps\sniperescape_code::price_followup_line();
    soundscripts\_snd::snd_message( "carrying_macmillan_mix" );
    thread maps\_utility::do_in_order( common_scripts\utility::flag_wait, "price_picked_up", maps\sniperescape_code::price_line, "extraction_is_southwest" );
    common_scripts\utility::flag_wait( "price_picked_up" );
    maps\_utility::arcademode_checkpoint( 10, "c" );
    common_scripts\utility::flag_set( "aa_wounded" );
    thread maps\_utility::do_in_order( common_scripts\utility::flag_wait, "enter_burnt", common_scripts\utility::flag_clear, "aa_wounded" );
    objective_string( maps\sniperescape_wounding::getobj( "wounded" ), &"SNIPERESCAPE_CARRY_MACMILLAN_TO_THE" );
    maps\sniperescape_code::set_objective_pos_to_extraction_point( maps\sniperescape_wounding::getobj( "wounded" ) );
    thread maps\sniperescape_code::enemy_zone_spawner();
    common_scripts\utility::flag_wait( "enter_burnt" );
    maps\_utility::autosave_by_name( "entered_burnt" );
    thread enter_burnt_apartment();
}

start_burnt()
{
    soundscripts\_snd::snd_message( "start_burnt_checkpoint" );
    thread music();
    common_scripts\utility::flag_set( "first_pickup" );
    maps\_utility::add_global_spawn_function( "axis", maps\sniperescape_code::on_the_run_enemies );
    thread maps\sniperescape_lighting::vision_glow_change();
    objective_add( maps\sniperescape_wounding::getobj( "wounded" ), "active", &"SNIPERESCAPE_DRAG_MACMILLAN_BODILY", maps\sniperescape_code::extraction_point() );
    objective_current( maps\sniperescape_wounding::getobj( "wounded" ) );
    maps\sniperescape_code::set_objective_pos_to_extraction_point( maps\sniperescape_wounding::getobj( "wounded" ) );
    var_0 = getent( "wounding_sight_blocker", "targetname" );
    var_0 connectpaths();
    var_0 delete();
    thread maps\sniperescape_code::countdown( 6 );
    var_1 = getaispeciesarray( "axis", "all" );
    common_scripts\utility::array_thread( var_1, maps\sniperescape_code::delete_living );
    var_2 = getent( "player_burnt_org", "targetname" );
    var_3 = getent( "price_burnt_org", "targetname" );
    level.player setorigin( var_2.origin + ( 0.0, 0.0, -5150.0 ) );
    level.price teleport( var_3.origin );
    maps\sniperescape_wounding::plant_price();
    level.player setplayerangles( var_2.angles );
    level.player setorigin( var_2.origin );
    wait 0.05;
    thread maps\sniperescape_code::price_wounded_logic();
    thread enter_burnt_apartment();
}

enter_burnt_apartment()
{
    thread maps\sniperescape_code::burnt_blocker();
    thread maps\sniperescape_code::spooky_sighting();
    thread maps\sniperescape_code::spooky_dog();
    thread maps\_utility::do_in_order( common_scripts\utility::flag_wait, "spawn_spooky_dog", common_scripts\utility::flag_set, "aa_burnt_apartment" );
    thread maps\_utility::do_in_order( common_scripts\utility::flag_wait, "apartment_cleared", common_scripts\utility::flag_clear, "aa_burnt_apartment" );
    setdvar( "player_sees_pool_dogs", "" );
    common_scripts\utility::run_thread_on_noteworthy( "apartment_guard", maps\_utility::add_spawn_function, maps\_utility::set_fixednode_true );
    common_scripts\utility::run_thread_on_noteworthy( "apartment_guard", maps\_utility::add_spawn_function, maps\_utility::set_baseaccuracy, 100 );
    thread maps\_utility::do_in_order( common_scripts\utility::flag_wait, "enter_burnt", maps\_utility::clear_dvar, "player_hasnt_been_spooked" );
    thread maps\sniperescape_code::player_navigates_burnt_apartment();
    thread pool();
    var_0 = getent( "level_end", "targetname" );
    var_0.origin += ( 0.0, 150.0, 0.0 );
    thread fairgrounds_before_battle();
}

start_pool()
{
    soundscripts\_snd::snd_message( "start_pool_checkpoint" );
    thread music();
    common_scripts\utility::flag_set( "first_pickup" );
    thread maps\sniperescape_lighting::vision_glow_change();
    objective_add( maps\sniperescape_wounding::getobj( "wounded" ), "active", &"SNIPERESCAPE_DRAG_MACMILLAN_BODILY", maps\sniperescape_code::extraction_point() );
    objective_current( maps\sniperescape_wounding::getobj( "wounded" ) );
    maps\sniperescape_code::set_objective_pos_to_extraction_point( maps\sniperescape_wounding::getobj( "wounded" ) );
    var_0 = getent( "wounding_sight_blocker", "targetname" );
    var_0 connectpaths();
    var_0 delete();
    thread maps\sniperescape_code::countdown( 8 );
    var_1 = getaispeciesarray( "axis", "all" );
    common_scripts\utility::array_thread( var_1, maps\sniperescape_code::delete_living );
    var_2 = getent( "player_pool_org", "targetname" );
    var_3 = getent( "price_pool_org", "targetname" );
    level.player setorigin( var_2.origin + ( 0.0, 0.0, -5150.0 ) );
    level.price teleport( var_3.origin );
    maps\sniperescape_wounding::plant_price();
    level.player setplayerangles( var_2.angles );
    level.player setorigin( var_2.origin );
    setdvar( "player_sees_pool_dogs", "" );
    wait 0.05;
    common_scripts\utility::flag_set( "to_the_pool" );
    thread maps\sniperescape_code::price_wounded_logic();
    thread fairgrounds_before_battle();
    thread pool();
}

pool()
{
    thread maps\sniperescape_code::set_min_time_remaining( 4 );
    common_scripts\utility::flag_wait( "to_the_pool" );
    common_scripts\utility::flag_set( "price_calls_out_enemy_location" );
    maps\_utility::arcademode_checkpoint( 20, "d" );
    thread maps\_utility::do_in_order( common_scripts\utility::flag_wait, "pool_lookat", common_scripts\utility::flag_set, "player_looked_in_pool" );
    var_0 = level.player.maxvisibledist;
    level.player.maxvisibledist = 168;
    maps\_utility::autosave_by_name( "to_the_pool" );
    thread maps\sniperescape_code::price_line( "almost_there" );
    common_scripts\utility::flag_set( "music_fairgrounds_fade" );
    thread maps\sniperescape_wounding::pool_have_body();
    common_scripts\utility::flag_init( "pool_dogs_flee" );

    if ( getdvar( "player_sees_pool_dogs" ) == "" )
        setdvar( "player_sees_pool_dogs", "1" );
    else
        common_scripts\utility::flag_set( "pool_dogs_flee" );

    if ( !common_scripts\utility::flag( "fairbattle_high_intensity" ) )
    {
        var_1 = maps\_utility::get_guys_with_targetname_from_spawner( "eating_dog" );

        for ( var_2 = 0; var_2 < var_1.size; var_2++ )
            var_1[var_2] thread maps\sniperescape_wounding::pool_dog_think( var_2 );
    }

    common_scripts\utility::flag_wait( "player_enters_fairgrounds" );
    level.player.maxvisibledist = var_0;
}

start_fair()
{
    soundscripts\_snd::snd_message( "start_fair_checkpoint" );
    thread music();
    common_scripts\utility::flag_set( "first_pickup" );
    thread maps\sniperescape_lighting::vision_glow_change();
    objective_add( maps\sniperescape_wounding::getobj( "wounded" ), "active", &"SNIPERESCAPE_DRAG_MACMILLAN_BODILY", maps\sniperescape_code::extraction_point() );
    objective_current( maps\sniperescape_wounding::getobj( "wounded" ) );
    maps\sniperescape_code::set_objective_pos_to_extraction_point( maps\sniperescape_wounding::getobj( "wounded" ) );
    var_0 = getent( "wounding_sight_blocker", "targetname" );
    var_0 connectpaths();
    var_0 delete();
    thread maps\sniperescape_code::countdown( 20 );
    var_1 = getaispeciesarray( "axis", "all" );
    common_scripts\utility::array_thread( var_1, maps\sniperescape_code::delete_living );
    var_2 = getent( "player_fair_org", "targetname" );
    var_3 = getent( "price_fair_org", "targetname" );
    level.player setorigin( var_2.origin + ( 0.0, 0.0, -5150.0 ) );
    level.price teleport( var_3.origin );
    maps\sniperescape_wounding::plant_price();
    level.player setplayerangles( var_2.angles );
    level.player setorigin( var_2.origin );
    wait 0.05;
    thread maps\sniperescape_code::price_wounded_logic();
    common_scripts\utility::flag_wait( "price_picked_up" );
    thread fairgrounds_before_battle();
    common_scripts\utility::flag_set( "player_enters_fairgrounds" );
    common_scripts\utility::flag_set( "to_the_pool" );
    common_scripts\utility::flag_set( "fair_snipers_died" );
}

start_fair_battle()
{
    soundscripts\_snd::snd_message( "start_fair_battle_checkpoint" );
    thread music();
    common_scripts\utility::flag_set( "first_pickup" );
    thread maps\sniperescape_lighting::vision_glow_change();
    objective_add( maps\sniperescape_wounding::getobj( "wounded" ), "active", &"SNIPERESCAPE_DRAG_MACMILLAN_BODILY", maps\sniperescape_code::extraction_point() );
    objective_current( maps\sniperescape_wounding::getobj( "wounded" ) );
    maps\sniperescape_code::set_objective_pos_to_extraction_point( maps\sniperescape_wounding::getobj( "wounded" ) );
    var_0 = getent( "wounding_sight_blocker", "targetname" );
    var_0 connectpaths();
    var_0 delete();
    var_1 = getaispeciesarray( "axis", "all" );
    common_scripts\utility::array_thread( var_1, maps\sniperescape_code::delete_living );
    var_2 = getent( "player_fair_org", "targetname" );
    var_3 = getent( "price_gnoll", "targetname" );
    level.player setorigin( var_2.origin + ( 0.0, 0.0, -5150.0 ) );
    level.price teleport( var_3.origin, var_3.angles );
    maps\sniperescape_wounding::plant_price();
    level.player setplayerangles( var_2.angles );
    level.player setorigin( var_2.origin );
    wait 0.05;
    common_scripts\utility::flag_set( "price_can_be_left" );
    thread maps\sniperescape_code::price_wounded_logic();
    thread fairgrounds_after_prep();
    common_scripts\utility::flag_set( "player_enters_fairgrounds" );
    common_scripts\utility::flag_set( "to_the_pool" );
}

fairgrounds_before_battle()
{
    thread maps\sniperescape_wounding::fairground_patrollers();
    level.price_gnoll_dist = 250;
    common_scripts\utility::flag_wait( "player_enters_fairgrounds" );

    for (;;)
    {
        common_scripts\utility::flag_wait( "player_reaches_extraction_point" );

        if ( common_scripts\utility::flag( "price_picked_up" ) )
            break;

        common_scripts\utility::flag_clear( "player_reaches_extraction_point" );
    }

    common_scripts\utility::array_thread( level.deathflags["fair_snipers_died"]["ai"], maps\sniperescape_code::fair_spawner_seeks_player );
    common_scripts\utility::flag_wait( "fair_snipers_died" );
    maps\sniperescape_code::price_line( "waiting_for_signal" );
    wait 0.35;
    maps\sniperescape_code::price_line( "helicopter_is_standing_by" );
    maps\sniperescape_code::price_line( "put_down_behind_wheel" );
    wait 2;
    maps\_utility::objective_complete( maps\sniperescape_wounding::getobj( "wounded" ) );
    common_scripts\utility::flag_set( "put_price_near_wheel" );
    objective_add( maps\sniperescape_wounding::getobj( "putdown" ), "active", &"SNIPERESCAPE_PUT_CPT_MACMILLAN_DOWN", maps\sniperescape_code::price_fair_defendspot() );
    objective_current( maps\sniperescape_wounding::getobj( "putdown" ) );
    thread maps\sniperescape_wounding::update_objective_position_for_fairground( maps\sniperescape_wounding::getobj( "putdown" ) );
    thread maps\sniperescape_code::price_says_this_is_fine();
    thread maps\sniperescape_wounding::price_says_a_bit_farther();
    var_0 = getent( "price_placement_trigger", "targetname" );

    for (;;)
    {
        common_scripts\utility::flag_waitopen( "price_picked_up" );

        if ( level.price istouching( var_0 ) )
            break;

        if ( distance( level.price.origin, maps\sniperescape_code::price_fair_defendspot() ) <= level.price_gnoll_dist )
            break;

        common_scripts\utility::flag_wait( "price_picked_up" );
    }

    common_scripts\utility::flag_set( "price_is_put_down_near_wheel" );
    maps\_utility::objective_complete( maps\sniperescape_wounding::getobj( "putdown" ) );
    soundscripts\_snd::snd_message( "clear_carrying_mix" );
    thread fairgrounds_prep_objective();
    thread fairgrounds_after_prep();
}

fairgrounds_prep_objective()
{
    objective_add( maps\sniperescape_wounding::getobj( "prep" ), "active", &"SNIPERESCAPE_PREP_AREA_FOR_FIGHT" );
    objective_current( maps\sniperescape_wounding::getobj( "prep" ) );
    level waittill( "prep_complete" );
    maps\_utility::objective_complete( maps\sniperescape_wounding::getobj( "prep" ) );
}

fairgrounds_after_prep()
{
    common_scripts\utility::flag_set( "price_moves_to_position" );
    common_scripts\utility::flag_clear( "can_manage_price" );
    common_scripts\utility::flag_set( "fair_hold_fire" );
    common_scripts\utility::flag_set( "price_can_be_left" );
    common_scripts\utility::flag_set( "first_pickup" );
    common_scripts\utility::flag_clear( "price_calls_out_enemy_location" );
    var_0 = getentarray( "chase_chopper_spawner", "script_noteworthy" );
    common_scripts\utility::array_thread( var_0, maps\_utility::add_spawn_function, maps\sniperescape_code::fairground_enemies );
    maps\_utility::autosave_by_name( "the_fairgrounds" );
    wait 2;
    maps\sniperescape_code::sniper_escape_initial_secondary_weapon_loadout();

    if ( level.gameskill <= 1 )
        maps\sniperescape_code::max_ammo_on_legit_sniper_escape_weapon();

    if ( getdvar( "claymore_hint" ) == "" )
    {
        setdvar( "claymore_hint", "claymore" );
        var_1 = level.player maps\_utility::getplayerclaymores();

        if ( var_1 )
        {
            if ( var_1 < 9 )
                thread maps\sniperescape_code::price_line( "take_my_claymores" );
            else
                thread maps\sniperescape_code::price_line( "use_claymores" );

            level.player thread maps\_utility::display_hint( "claymore_plant" );
            wait 4;
        }
    }
    else if ( getdvar( "claymore_hint" ) == "claymore" )
    {
        setdvar( "claymore_hint", "c4" );
        level.player thread maps\sniperescape_code::c4_hint();
    }

    thread maps\sniperescape_code::price_line( "find_a_good_snipe" );
    thread maps\sniperescape_code::price_line( "i_will_signal_in_30" );
    wait 4;
    var_1 = level.player maps\_utility::getplayerclaymores();
    maps\sniperescape_wounding::wait_for_player_to_place_claymores();

    if ( maps\sniperescape_wounding::autosave_on_good_claymore_placement( var_1 ) )
    {

    }

    level notify( "prep_complete" );
    objective_add( maps\sniperescape_wounding::getobj( "holdout" ), "active", &"SNIPERESCAPE_HOLD_OUT_UNTIL_EVAC", level.price.origin );
    objective_current( maps\sniperescape_wounding::getobj( "holdout" ) );
    maps\sniperescape_code::price_line( "activated_beacon" );
    wait 2.2;
    thread maps\sniperescape_code::price_line( "have_a_fix" );
    common_scripts\utility::flag_set( "beacon_placed" );
    var_2 = getent( "price_putdown_hint_trigger", "targetname" );
    var_2 delete();
    thread maps\sniperescape_code::fairground_battle();
    thread seaknight_flies_in( 0 );
    wait 1;
    objective_add( maps\sniperescape_wounding::getobj( "holdout" ), "active", &"SNIPERESCAPE_SEAKNIGHT_INCOMING", level.seaknight.origin );
    objective_additionalcurrent( maps\sniperescape_wounding::getobj( "holdout" ) );
    objective_icon( maps\sniperescape_wounding::getobj( "holdout" ), "objective_heli" );
    thread maps\sniperescape_code::update_seaknight_objective_pos( maps\sniperescape_wounding::getobj( "holdout" ) );
}

start_seaknight()
{
    soundscripts\_snd::snd_message( "start_seaknight_checkpoint" );
    thread music();
    common_scripts\utility::flag_set( "price_can_be_left" );
    common_scripts\utility::flag_set( "first_pickup" );
    common_scripts\utility::flag_set( "faiground_battle_begins" );
    thread maps\sniperescape_lighting::vision_glow_change();
    objective_add( maps\sniperescape_wounding::getobj( "wounded" ), "active", &"SNIPERESCAPE_DRAG_MACMILLAN_BODILY", maps\sniperescape_code::extraction_point() );
    objective_current( maps\sniperescape_wounding::getobj( "wounded" ) );
    maps\sniperescape_code::set_objective_pos_to_extraction_point( maps\sniperescape_wounding::getobj( "wounded" ) );
    var_0 = getent( "wounding_sight_blocker", "targetname" );
    var_0 connectpaths();
    var_0 delete();
    thread maps\sniperescape_code::countdown( 8 );
    var_1 = getaispeciesarray( "axis", "all" );
    common_scripts\utility::array_thread( var_1, maps\sniperescape_code::delete_living );
    var_2 = getent( "player_fair_org", "targetname" );
    var_3 = getent( "price_gnoll", "targetname" );
    level.player setorigin( var_2.origin + ( 0.0, 0.0, -5150.0 ) );
    level.price teleport( var_3.origin, var_3.angles );
    maps\sniperescape_wounding::plant_price();
    level.player setplayerangles( var_2.angles );
    level.player setorigin( var_2.origin );
    wait 0.05;
    thread maps\sniperescape_code::price_wounded_logic();
    common_scripts\utility::flag_set( "player_enters_fairgrounds" );
    thread seaknight_flies_in( 1 );
    wait 1;
    objective_add( maps\sniperescape_wounding::getobj( "holdout" ), "active", &"SNIPERESCAPE_SEAKNIGHT_INCOMING", level.seaknight.origin );
    objective_additionalcurrent( maps\sniperescape_wounding::getobj( "holdout" ) );
    objective_icon( maps\sniperescape_wounding::getobj( "holdout" ), "objective_heli" );
    thread maps\sniperescape_code::update_seaknight_objective_pos( maps\sniperescape_wounding::getobj( "holdout" ) );
}

seaknight_flies_in( var_0 )
{
    var_1 = "seaknight_normal";

    if ( level.gameskill >= 1 )
        var_1 = "seaknight_hard";

    var_2 = maps\_vehicle::spawn_vehicle_from_targetname_and_drive( var_1 );
    level.seaknight = var_2;
    thread seaknight_pilot();

    if ( !var_0 )
        var_2 waittill( "reached_dynamic_path_end" );

    var_3 = getent( "seaknight_landing", "targetname" );
    var_4 = var_2;
    var_2 = var_2 maps\_vehicle::vehicle_to_dummy();
    var_2 setmodel( "vehicle_ch46e_opened_door_interior_a" );
    var_5 = spawn( "script_model", var_2 gettagorigin( "body_animate_jnt" ) );
    var_5 setmodel( "vehicle_ch46e_opened_door_interior_b" );
    var_5.angles = var_2.angles;
    var_5 linkto( var_2, "body_animate_jnt" );
    var_6 = spawn( "script_model", var_2 gettagorigin( "body_animate_jnt" ) );
    var_6 setmodel( "vehicle_ch46e_wires" );
    var_6.angles = var_2.angles;
    var_6 linkto( var_2, "body_animate_jnt" );

    if ( level.start_point == "seaknight" )
    {
        var_2 thread maps\_debug::drawtagforever( "tag_detach" );
        var_2 thread maps\_debug::drawtagforever( "tag_origin" );
        var_2 thread maps\_debug::draworiginforever();
    }

    var_2.animname = "seaknight";
    var_2 thread maps\_vehicle_code::rotor_anim();
    common_scripts\utility::flag_set( "seaknight_flies_in" );
    level.seaknight = var_2;
    var_2 thread maps\sniperescape_code::seaknight_badplace();
    var_2 maps\_utility::assign_animtree();
    var_7 = getent( "seaknight_collmap", "targetname" );
    var_7 linkto( var_2, "tag_origin", ( 0.0, 0.0, 0.0 ), ( 0.0, 0.0, 0.0 ) );
    maps\_wibble::wibble_add_heli_to_track( level.seaknight );
    var_2 thread maps\sniperescape_wounding::seaknight_sound();
    var_8 = getent( "seaknight_trigger", "targetname" );
    var_8 thread maps\_utility::manual_linkto( var_7 );
    var_9 = getent( "seaknight_death_trigger", "targetname" );
    var_9 thread maps\_utility::manual_linkto( var_2 );
    var_9 thread maps\_vehicle::heli_squashes_stuff( "seaknight_lands" );
    var_2 thread spawn_seaknight_crew();
    var_3 maps\_anim::anim_single_solo( var_2, "landing" );
    common_scripts\utility::flag_set( "seaknight_lands" );
    thread maps\sniperescape_code::fairbattle_autosave();
    thread maps\sniperescape_wounding::player_becomes_invul_on_pickup();
    thread maps\sniperescape_code::price_line( "heli_at_the_lz" );
    var_10 = 60;
    thread maps\sniperescape_wounding::seaknight_leaving_warning( var_10 );
    common_scripts\utility::flag_clear( "can_save" );
    maps\_utility::add_global_spawn_function( "axis", maps\sniperescape_wounding::no_grenades );
    var_11 = getaiarray( "axis" );
    common_scripts\utility::array_thread( var_11, maps\_utility::set_grenadeammo, 0 );
    var_3 thread maps\_anim::anim_loop_solo( var_2, "idle", undefined, "stop_idle" );
    var_9 delete();
    maps\_utility::objective_complete( maps\sniperescape_wounding::getobj( "holdout" ) );
    var_12 = spawn( "script_origin", ( 0.0, 0.0, 0.0 ) );
    var_12.origin = var_2 gettagorigin( "tag_door_rear" );
    var_12.radius = 27.7311;
    objective_add( maps\sniperescape_wounding::getobj( "seaknight" ), "active", &"SNIPERESCAPE_GET_CPT_MACMILLAN_TO", var_12.origin );
    objective_current( maps\sniperescape_wounding::getobj( "seaknight" ) );
    common_scripts\utility::flag_set( "can_manage_price" );
    thread maps\sniperescape_wounding::player_abandons_seaknight_protection();
    thread maps\sniperescape_wounding::player_boards_seaknight( var_2, var_12 );
    maps\_utility::delaythread( var_10, common_scripts\utility::flag_set, "seaknight_leaves_prematurely" );
    maps\sniperescape_wounding::wait_for_seaknight_to_take_off();

    if ( common_scripts\utility::flag( "player_made_it_to_seaknight" ) )
    {
        wait 5;
        thread bring_in_heli_spawners();
    }

    common_scripts\utility::flag_set( "seaknight_prepares_to_leave" );

    if ( !common_scripts\utility::flag( "player_made_it_to_seaknight" ) )
    {
        wait 1.5;
        thread maps\_hud_util::fade_in( 1.5 );
        setdvar( "ui_deadquote", &"SNIPERESCAPE_YOU_FAILED_TO_REACH_THE" );
        maps\_utility::missionfailedwrapper();
    }

    wait 12;
    var_3 notify( "stop_idle" );
    common_scripts\utility::flag_set( "seaknight_leaves" );
    var_7 delete();
    var_3 thread maps\_anim::anim_single_solo( var_2, "take_off" );

    if ( common_scripts\utility::flag( "player_made_it_to_seaknight" ) )
    {
        wait 2.5;
        common_scripts\utility::flag_clear( "aa_seaknight_rescue" );
        wait 2;

        if ( isalive( level.player ) )
            maps\_utility::objective_complete( maps\sniperescape_wounding::getobj( "seaknight" ) );

        return;
    }
}

end_level( var_0 )
{
    maps\_utility::nextmission();
}

bring_in_heli_spawners()
{
    wait 6;
    maps\_utility::remove_global_spawn_function( "axis", maps\sniperescape_wounding::no_accuracy );
    level notify( "stop_having_low_accuracy" );
    var_0 = getentarray( "heli_chaser_spawner", "targetname" );
    common_scripts\utility::array_thread( var_0, maps\_utility::add_spawn_function, ::heli_chaser_think );
    common_scripts\utility::array_thread( var_0, maps\_utility::spawn_ai );
    badplace_delete( "seaknight_badplace" );
}

heli_chaser_think()
{
    self endon( "death" );
    self.ignoreall = 1;
    self waittill( "goal" );
    self.ignoreall = 0;
}

spawn_seaknight_crew()
{
    var_0 = getentarray( "seaknight_spawner", "targetname" );
    common_scripts\utility::array_thread( var_0, maps\_utility::add_spawn_function, ::seaknight_defender );
    var_1 = self gettagorigin( "tag_detach" );
    var_2 = [];

    for ( var_3 = 0; var_3 < var_0.size; var_3++ )
    {
        var_0[var_3].origin = var_1;
        var_4 = var_0[var_3] stalingradspawn();
        var_4.animname = "guy" + ( var_3 + 1 );
        var_2[var_2.size] = var_4;
    }

    thread maps\_anim::anim_first_frame( var_2, "unload", "tag_detach" );

    for ( var_3 = 0; var_3 < var_2.size; var_3++ )
    {
        var_2[var_3] linkto( self, "tag_detach" );
        var_2[var_3].attackeraccuracy = 0;
    }

    common_scripts\utility::flag_wait( "seaknight_lands" );
    common_scripts\utility::array_thread( var_2, maps\_utility::send_notify, "stop_first_frame" );
    maps\_anim::anim_single( var_2, "unload", "tag_detach" );

    for ( var_3 = 0; var_3 < var_2.size; var_3++ )
        var_2[var_3] unlink();

    common_scripts\utility::flag_wait( "player_putting_down_price_seaknight" );

    for ( var_3 = 0; var_3 < var_2.size; var_3++ )
    {
        var_2[var_3] linkto( self, "tag_detach" );
        var_2[var_3] maps\_utility::ai_ignore_everything();
    }

    thread maps\_anim::anim_single( var_2, "load", "tag_detach" );
    wait 0.05;
    maps\_anim::anim_set_rate( var_2, "load", 0 );
    common_scripts\utility::flag_wait( "seaknight_prepares_to_leave" );
    maps\_anim::anim_set_rate( var_2, "load", 1 );
    common_scripts\utility::array_thread( var_2, ::seaknight_guys_cleanup );
    common_scripts\utility::flag_wait( "player_made_it_to_seaknight" );
    common_scripts\utility::flag_wait( "seaknight_leaves" );
}

seaknight_guys_cleanup()
{
    self waittillmatch( "single anim", "end" );
    maps\_utility::stop_magic_bullet_shield();
    self delete();
}

seaknight_pilot()
{
    if ( isdefined( level.seaknight.attachedguys[0] ) )
        level.seaknight.attachedguys[0] setmodel( "body_force_assault_pilot_woodland" );
}

seaknight_defender()
{
    thread maps\_utility::magic_bullet_shield();
    self setthreatbiasgroup( "price" );
    self allowedstances( "crouch" );
    wait 1;
    self.a.pose = "crouch";
    self waittillmatch( "single anim", "end" );
    self setgoalpos( self.origin );
    self.goalradius = 16;
}

h1_set_up_mac_run_rappel()
{
    level.scripted_node_mac_run_rappel = spawn( "script_origin", ( 630.813, -11560.4, 998.389 ) );
    level.rappel_chair = maps\_utility::spawn_anim_model( "rappel_chair" );
    level.scripted_node_mac_run_rappel maps\_anim::anim_first_frame_solo( level.rappel_chair, "run_to_rappel" );
}

h1_handle_mac_run_past_chair()
{
    level endon( "player_rappels" );

    if ( !isdefined( level.scripted_node_mac_run_rappel ) )
        h1_set_up_mac_run_rappel();

    var_0 = [];
    var_0[var_0.size] = level.price;
    var_0[var_0.size] = level.rappel_chair;
    var_1 = getent( "rappel_run_chair_clip", "targetname" );
    var_1 notsolid();
    level.scripted_node_mac_run_rappel thread maps\_anim::anim_single( var_0, "run_to_rappel" );
    level.rappel_chair waittillmatch( "single anim", "chair_out" );
    var_1 thread activate_chair_clip();
    level.price waittillmatch( "single anim", "end" );
}

set_combat_ads_lods_at_rappel()
{
    common_scripts\utility::flag_wait( "player_rappels" );
    setsaveddvar( "r_lodFOVScaleOverride", 1 );
    setsaveddvar( "r_lodFOVScaleOverrideAmount", 0.85 );
    setsaveddvar( "r_lodFOVScaleOverrideStopMaxAngle", 30 );
    setsaveddvar( "r_lodFOVScaleOverrideStopMinAngle", 35 );
    setsaveddvar( "r_lodFOVScaleOverrideStartMaxAngle", 65 );
    setsaveddvar( "r_lodFOVScaleOverrideStartMinAngle", 55 );
}
