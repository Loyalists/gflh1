// H1 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

dead_script()
{
    common_scripts\_ca_blockout::init();
    common_scripts\utility::flag_init( "player_in_house" );
    maps\createart\blackout_art::main();
    maps\blackout_precache::main();
    level thread maps\blackout_fx::main();
    maps\_load::main();
    level thread maps\blackout_amb::main();
    maps\blackout_anim::main();
    maps\blackout_lighting::main();
}

main()
{
    if ( getdvar( "beautiful_corner" ) == "1" )
    {
        dead_script();
        return;
    }

    level.next_tango_timer = 0;
    maps\createart\blackout_art::main();
    precachemodel( "weapon_mp5" );
    precachemodel( "weapon_saw_MG_setup" );
    precachemodel( "weapon_rpd_MG_setup" );
    precachemodel( "com_folding_chair" );
    precachemodel( "ch_street_wall_light_01_off" );
    precachemodel( "greece_gaslamp" );
    precachemodel( "dt_light_on_hunted" );
    precachemodel( "weapon_skorpion" );
    precachemodel( "weapon_ak47" );
    precachemodel( "weapon_ak74u" );
    precachemodel( "weapon_dragunov" );
    precachemodel( "weapon_beretta" );
    precachemodel( "weapon_g3" );
    precachemodel( "weapon_m4gre_sp_silencer_reflex" );
    precachemodel( "weapon_m21sd_woodland" );
    precachemodel( "vehicle_blackhawk_sas_night_interior" );
    precacheturret( "heli_spotlight" );
    precachemodel( "com_blackhawk_spotlight_on_mg_setup" );
    precachemodel( "com_blackhawk_spotlight_off_mg_setup" );
    precachestring( &"BLACKOUT_THE_INFORMANT_WAS_KILLED" );
    precachestring( &"SCRIPT_LEARN_CLAYMORES" );
    precachestring( &"BLACKOUT_PROVIDE_SNIPER_SUPPORT" );
    precachestring( &"BLACKOUT_CUT_OFF_ENEMY_REINFORCEMENTS" );
    precachestring( &"BLACKOUT_PROVIDE_SNIPER_SUPPORT1" );
    precachestring( &"BLACKOUT_FOLLOW_KAMAROV_TO_POWER_STATION" );
    precachestring( &"BLACKOUT_PROVIDE_MORE_SNIPER_SUPPORT" );
    precachestring( &"BLACKOUT_RAPPEL_DOWN_FROM_THE" );
    precachestring( &"BLACKOUT_RESCUE_THE_INFORMANT" );
    precachestring( &"BLACKOUT_EVAC_WITH_THE_INFORMANT" );
    precachestring( &"BLACKOUT_ELIMINATE_THE_OUTER_GUARD" );
    precachestring( &"BLACKOUT_MEET_THE_RUSSIAN_LOYALISTS" );
    precachestring( &"BLACKOUT_RAPPEL_HINT" );
    precachestring( &"BLACKOUT_THE_INFORMANT_WAS_KILLED" );
    precacheshader( "h1_hud_tutorial_blur" );
    precacheshader( "h1_hud_tutorial_border" );
    precacherumble( "generic_attack_light_500" );
    precacherumble( "generic_attack_light_1500" );
    precacherumble( "generic_attack_light_2000" );
    precacherumble( "generic_attack_medium_500" );
    thread maps\blackout_code::breach_door();
    maps\_stealth_logic::stealth_init();
    maps\_stealth_behavior::main();
    maps\_breach::main();
    maps\blackout_precache::main();
    level thread maps\blackout_fx::main();
    maps\_hud::init();
    maps\_hiding_door_anims::main();
    maps\_utility::default_start( ::start_normal );
    maps\_utility::add_start( "chess", ::start_chess, &"STARTS_CHESS" );
    maps\_utility::add_start( "field", ::start_field, &"STARTS_FIELD1" );
    maps\_utility::add_start( "overlook", ::start_overlook, &"STARTS_OVERLOOK" );
    maps\_utility::add_start( "cliff", ::start_cliff, &"STARTS_CLIFF" );
    maps\_utility::add_start( "rappel", ::start_rappel, &"STARTS_RAPPEL" );
    maps\_utility::add_start( "farmhouse", ::start_farmhouse, &"STARTS_FARMHOUSE" );
    maps\_utility::add_start( "blackout", ::start_blackout, &"STARTS_BLACKOUT" );
    maps\_utility::add_start( "rescue", ::start_rescue, &"STARTS_RESCUE" );
    level.strings["mantle"] = &"BLACKOUT_MANTLE";
    maps\_hud_util::create_mantle();
    setsaveddvar( "ai_eventDistProjImpact", "0" );
    setsaveddvar( "r_reactiveMotionWindAmplitudeScale", 3 );
    setsaveddvar( "r_reactiveMotionWindStrength", 1 );
    setsaveddvar( "r_reactiveMotionWindFrequencyScale", 3 );
    setsaveddvar( "r_reactiveMotionWindAreaScale", 33.3 );
    setsaveddvar( "r_reactiveMotionHelicopterRadius", 1000 );
    setsaveddvar( "r_reactiveMotionHelicopterStrength", 5 );
    setsaveddvar( "r_lodFOVScaleOverride", 1 );
    setsaveddvar( "r_lodFOVScaleOverrideAmount", 0.85 );
    setsaveddvar( "r_lodFOVScaleOverrideStopMaxAngle", 30 );
    setsaveddvar( "r_lodFOVScaleOverrideStopMinAngle", 35 );
    setsaveddvar( "r_lodFOVScaleOverrideStartMaxAngle", 65 );
    setsaveddvar( "r_lodFOVScaleOverrideStartMinAngle", 55 );
    level.weaponclipmodels = [];
    level.weaponclipmodels[0] = "weapon_mp5_clip";
    level.weaponclipmodels[1] = "weapon_ak47_clip";
    level.weaponclipmodels[2] = "weapon_dragunov_clip";
    level.weaponclipmodels[3] = "weapon_g36_clip";
    level.weaponclipmodels[4] = "weapon_g3_clip";
    level.weaponclipmodels[5] = "weapon_m16_clip";
    maps\_load::main();
    maps\_hiding_door::init_hiding_door();
    maps\_compass::setupminimap( "compass_map_blackout" );
    var_0 = getaiarray( "allies" );
    common_scripts\utility::array_thread( var_0, maps\_stealth_logic::friendly_init );
    maps\_utility::add_global_spawn_function( "allies", maps\_stealth_logic::friendly_init );
    maps\_nightvision::main();
    maps\_load::set_player_viewhand_model( "h2_gfl_m4_sopmod_ii_viewhands" );
    level thread maps\blackout_amb::main();
    maps\blackout_anim::main();
    maps\blackout_lighting::main();
    maps\blackout_aud::main();
    common_scripts\utility::flag_init( "high_alert" );
    common_scripts\utility::flag_init( "second_shacks" );
    common_scripts\utility::flag_init( "russians_stand_up" );
    common_scripts\utility::flag_init( "go_up_hill" );
    common_scripts\utility::flag_init( "go_to_overlook" );
    common_scripts\utility::flag_init( "overlook_attack_begins" );
    common_scripts\utility::flag_init( "overlook_attention" );
    common_scripts\utility::flag_init( "hut_cleared" );
    common_scripts\utility::flag_init( "cliff_fighting" );
    common_scripts\utility::flag_init( "cliff_moveup" );
    common_scripts\utility::flag_init( "recent_flashed" );
    common_scripts\utility::flag_init( "on_to_the_farm" );
    common_scripts\utility::flag_init( "player_rappels" );
    common_scripts\utility::flag_init( "head_to_rappel_spot" );
    common_scripts\utility::flag_init( "gaz_and_price_go_up_hill" );
    common_scripts\utility::flag_init( "kam_heads_to_rappel_spot" );
    common_scripts\utility::flag_init( "gaz_opens_door" );
    common_scripts\utility::flag_init( "farm_complete" );
    common_scripts\utility::flag_init( "blackout_rescue_complete" );
    common_scripts\utility::flag_init( "blackout_flashlightguy_dead" );
    common_scripts\utility::flag_init( "blackhawk_lands" );
    common_scripts\utility::flag_init( "blackhawk_spawn_start" );
    common_scripts\utility::flag_init( "kam_go_through_burning_house" );
    common_scripts\utility::flag_init( "kamarov_moving_burning_house" );
    common_scripts\utility::flag_init( "h1_burninghouse_kam" );
    common_scripts\utility::flag_init( "h1_burninghouse_gaz" );
    common_scripts\utility::flag_init( "h1_burninghouse_price" );
    common_scripts\utility::flag_init( "gaz_goes_by_other_window" );
    common_scripts\utility::flag_init( "price_and_gaz_attack_flashlight_guy" );
    common_scripts\utility::flag_init( "gaz_got_to_blackout_door" );
    common_scripts\utility::flag_init( "player_finishes_rappel" );
    common_scripts\utility::flag_init( "gaz_do_it" );
    common_scripts\utility::flag_init( "lights_out" );
    common_scripts\utility::flag_init( "commence_attack" );
    common_scripts\utility::flag_init( "player_enters_burning_house" );
    common_scripts\utility::flag_init( "player_near_heli" );
    common_scripts\utility::flag_init( "meeting_reached_price" );
    common_scripts\utility::flag_init( "meeting_reached_gaz" );
    common_scripts\utility::flag_init( "meeting_begins" );
    common_scripts\utility::flag_init( "rappel_kamarov_ready" );
    common_scripts\utility::flag_init( "rappel_gaz_ready" );
    common_scripts\utility::flag_init( "ready_to_commence_attack" );
    common_scripts\utility::flag_init( "start_cliff_scene_gaz" );
    common_scripts\utility::flag_init( "start_cliff_scene_kamarov" );
    common_scripts\utility::flag_init( "kamarov_drops_binocs" );
    common_scripts\utility::flag_init( "first_bmp_destroyed" );
    common_scripts\utility::flag_init( "bm21s_attack" );
    common_scripts\utility::flag_init( "weapons_free" );
    common_scripts\utility::flag_init( "gaz_rappels" );
    common_scripts\utility::flag_init( "hurry_to_nikolai" );
    common_scripts\utility::flag_init( "go_through_burning_house" );
    common_scripts\utility::flag_init( "player_near_pier" );
    common_scripts\utility::flag_init( "shack_signal" );
    common_scripts\utility::flag_init( "field_stop" );
    common_scripts\utility::flag_init( "field_go" );
    common_scripts\utility::flag_init( "gaz_rushes_hut" );
    common_scripts\utility::flag_init( "visible_mg_gunner_alive" );
    common_scripts\utility::flag_init( "head_to_the_cliff" );
    common_scripts\utility::flag_init( "power_station_dialogue_begins" );
    common_scripts\utility::flag_init( "kam_wants_more_sniping" );
    common_scripts\utility::flag_init( "gaz_convinces_kam_otherwise" );
    common_scripts\utility::flag_init( "gaz_fight_preps" );
    common_scripts\utility::flag_init( "gaz_kam_fight_begins" );
    common_scripts\utility::flag_init( "final_raid_begins" );
    common_scripts\utility::flag_init( "price_got_to_go" );
    common_scripts\utility::flag_init( "mission_chatter" );
    common_scripts\utility::flag_init( "price_and_gaz_arrive_at_fight" );
    common_scripts\utility::flag_init( "price_at_fight" );
    common_scripts\utility::flag_init( "gaz_at_fight" );
    common_scripts\utility::flag_init( "kam_at_fight" );
    common_scripts\utility::flag_init( "friendly_head_to_LZ" );
    common_scripts\utility::flag_init( "enemy_heli_unloaded" );
    common_scripts\utility::flag_set( "no_ai_tv_damage" );
    thread maps\_utility::do_in_order( common_scripts\utility::flag_wait, "power_plant_cleared", common_scripts\utility::flag_clear, "aa_power_plant" );
    common_scripts\utility::flag_set( "gaz_goes_by_other_window" );
    thread maps\blackout_code::set_high_alert();
    thread maps\blackout_code::hut_cleared();
    maps\_utility::add_hint_string( "nvg", &"SCRIPT_NIGHTVISION_USE", maps\_nightvision::shouldbreaknvghintprint );
    maps\_utility::add_hint_string( "grenade_launcher", &"SCRIPT_LEARN_GRENADE_LAUNCHER", maps\blackout_code::should_break_grenade_launcher_hint );
    maps\_utility::add_hint_string( "sniper_rifle", &"SCRIPT_LEARN_M14_SWITCH", maps\blackout_code::should_break_sniper_rifle_hint );
    maps\_utility::add_hint_string( "claymore_plant", &"SCRIPT_LEARN_CLAYMORES", maps\blackout_code::should_break_claymores );
    maps\_utility::add_hint_string( "disable_nvg", &"SCRIPT_NIGHTVISION_STOP_USE", maps\_nightvision::should_break_disable_nvg_print );
    maps\_utility::add_hint_string( "claymore_placement", &"SCRIPT_LEARN_CLAYMORE_PLACEMENT", maps\blackout_code::should_break_claymore_placement );
    thread maps\blackout_code::grenade_hint_logic();
    common_scripts\utility::run_thread_on_targetname( "second_shack_trigger", maps\blackout_code::second_shack_trigger );
    common_scripts\utility::run_thread_on_targetname( "physics_launch", maps\blackout_code::physics_launch_think );
    common_scripts\utility::run_thread_on_targetname( "prep_for_rappel", maps\blackout_code::prep_for_rappel_think );
    common_scripts\utility::run_thread_on_targetname( "price_finishes_farm", maps\blackout_code::price_finishes_farm );
    common_scripts\utility::run_thread_on_targetname( "delete", maps\_utility::_delete );

    if ( getdvarint( "use_old_burning_house" ) == 1 )
        common_scripts\utility::run_thread_on_targetname( "burning_door_trigger", maps\blackout_code::open_door_trigger, "burning" );
    else
        common_scripts\utility::flag_init( "burning_door_open" );

    common_scripts\utility::run_thread_on_targetname( "meeting_door_trigger", maps\blackout_code::open_door_trigger, "meeting" );
    common_scripts\utility::run_thread_on_targetname( "sniper_remove_trigger", maps\blackout_code::sniper_remove_trigger );
    common_scripts\utility::run_thread_on_targetname( "trigger_deletes_children", maps\blackout_code::trigger_deletes_children );
    common_scripts\utility::run_thread_on_noteworthy( "shack_sleeper", maps\_utility::add_spawn_function, maps\blackout_code::shack_sleeper );
    common_scripts\utility::run_thread_on_noteworthy( "power_plant_spawner", maps\_utility::add_spawn_function, maps\blackout_code::power_plant_spawner );
    common_scripts\utility::run_thread_on_noteworthy( "power_plant_second_wave", maps\_utility::add_spawn_function, maps\blackout_code::swarm_hillside );
    common_scripts\utility::run_thread_on_noteworthy( "clear_target_radius", maps\blackout_code::clear_target_radius );
    common_scripts\utility::run_thread_on_noteworthy( "visible_mgguy", maps\_utility::add_spawn_function, maps\blackout_code::visible_mgguy_think );
    common_scripts\utility::run_thread_on_noteworthy( "bored_guy", maps\blackout_code::ignore_until_high_alert );
    var_1 = getent( "hut_runner", "script_linkname" );
    var_1 thread maps\blackout_code::hut_runner_think();
    common_scripts\utility::run_thread_on_noteworthy( "hut_sentry", maps\blackout_code::tango_down_detection );
    common_scripts\utility::run_thread_on_targetname( "hut_patrol", maps\blackout_code::tango_down_detection );
    common_scripts\utility::run_thread_on_noteworthy( "chess_guy_1", maps\_utility::add_spawn_function, maps\blackout_code::tango_down_detection );
    common_scripts\utility::run_thread_on_noteworthy( "chess_guy_2", maps\_utility::add_spawn_function, maps\blackout_code::tango_down_detection );
    common_scripts\utility::run_thread_on_noteworthy( "shack_sleeper", maps\_utility::add_spawn_function, maps\blackout_code::tango_down_detection );
    common_scripts\utility::run_thread_on_noteworthy( "instant_high_alert", maps\_utility::add_spawn_function, maps\blackout_code::instant_high_alert );
    thread maps\blackout_code::buring_house_exploder_think( "burning_house_balcony_exploder", "field_trigger", "player_finishes_rappel" );
    thread maps\blackout_code::buring_house_exploder_think( "burning_house_interior_exploder", "kamarov_moving_burning_house", "player_finishes_rappel" );
    thread maps\blackout_code::smell_kamarov();
    thread maps\blackout_code::power_station_dialogue();
    thread maps\blackout_code::descriptions();
    thread maps\blackout_code::blackout_stealth_settings();
    level.respawn_spawner = getent( "ally_respawn", "targetname" );
    common_scripts\utility::flag_set( "respawn_friendlies" );
    var_2 = getentarray( "assault_spawner", "targetname" );
    common_scripts\utility::array_thread( var_2, maps\_utility::add_spawn_function, maps\_utility::replace_on_death );
    common_scripts\utility::array_thread( var_2, maps\_utility::add_spawn_function, maps\blackout_code::ground_allied_forces );
    var_3 = getentarray( "assault_second_wave", "targetname" );
    common_scripts\utility::array_thread( var_3, maps\_utility::add_spawn_function, maps\_utility::replace_on_death );
    common_scripts\utility::array_thread( var_3, maps\_utility::add_spawn_function, maps\blackout_code::ground_allied_forces );
    var_4 = getentarray( "color_spawner", "targetname" );
    common_scripts\utility::array_thread( var_4, maps\_utility::add_spawn_function, maps\blackout_code::ground_allied_forces );
    var_5 = getent( "heli_rescue_trigger", "script_noteworthy" );
    var_5 common_scripts\utility::trigger_off();
    var_6 = getent( "blackout_fence_down", "targetname" );
    var_6 hide();
    var_6 notsolid();
    var_7 = getent( "blackout_fence_down_model", "targetname" );
    var_7 hide();
    level.friendlynamedist = getdvarint( "g_friendlynamedist" );
    thread maps\blackout_code::player_rappel_think();
    thread maps\blackout_code::detect_recent_flashed();
    maps\_utility::battlechatter_off( "allies" );
    thread maps\_utility::ai_team_run_twitch_think( "allies", "player_finishes_rappel", "blackout_rescue_complete", "farmhouse", undefined );
    thread maps\blackout_aud::start_scripted_uaz_audio();
    thread burning_house_exploders_init();
    thread maps\blackout_code::music_control();
    thread maps\_wibble::setup_wibble_helis( 1, "blackhawk_spawn_start" );

    if ( !getdvarint( "use_old_bbc_voice" ) )
    {
        var_8 = getentarray( "interactive_tv", "targetname" );
        common_scripts\utility::array_thread( var_8, maps\blackout_code::bbc_voice );
    }

    wait 5;
    setsaveddvar( "cg_cinematicFullScreen", "0" );

    for (;;)
    {
        common_scripts\utility::flag_wait( "hut_tv_on" );
        thread loop_cinematic();
        common_scripts\utility::flag_waitopen( "hut_tv_on" );
        level notify( "stop_cinematic" );
        stopcinematicingame();
    }
}

loop_cinematic()
{
    level endon( "stop_cinematic" );

    for (;;)
    {
        cinematicingameloopresident( "asad_speech_180" );
        wait 5;

        while ( iscinematicplaying() )
            wait 1;
    }
}

burning_house_exploders_init()
{
    common_scripts\utility::flag_wait( "mgs_cleared" );
    var_0 = getent( "burning_house_exploder_78", "targetname" );
    var_0 waittill( "trigger" );
    thread common_scripts\_exploder::exploder( 78 );
    thread maps\blackout_code::shoot_magic_rocket( "overlook_magic_rocket_02" );

    if ( getdvarint( "use_old_burning_house" ) == 1 )
    {
        var_0 = getent( "burning_house_exploder_76", "targetname" );
        var_0 waittill( "trigger" );
        thread common_scripts\_exploder::exploder( 76 );
        var_0 = getent( "burning_house_exploder_77", "targetname" );
        var_0 waittill( "trigger" );
        thread common_scripts\_exploder::exploder( 77 );
    }
}

start_normal()
{
    soundscripts\_snd::snd_message( "start_default_checkpoint" );
    common_scripts\utility::flag_set( "start_swamp_fog" );
    thread maps\blackout_code::aa_town_init();
    maps\blackout_code::setup_sas_buddies();
    maps\blackout_code::setup_player();
    walking_the_stream();
}

start_chess()
{
    soundscripts\_snd::snd_message( "start_chess_checkpoint" );
    var_0 = getent( "player_chess_org", "targetname" );
    level.player setorigin( var_0.origin );
    maps\_utility::activate_trigger_with_targetname( "second_shack_trigger" );
    start_normal();
}

walking_the_stream()
{
    thread maps\blackout_code::outpost_objectives();
    thread field_meeting();
    var_0 = getnode( "signal1", "script_noteworthy" );
    level.price thread maps\blackout_code::first_signal_on_node( var_0, "stop2_exposed" );
    var_1 = getaiarray( "allies" );
    common_scripts\utility::array_thread( var_1, maps\blackout_code::friendly_think );
    thread maps\blackout_code::hut_tv();
    var_2 = getent( "hut_sentry", "script_noteworthy" );
    var_2 thread maps\blackout_code::idle_relative_to_target( "smoke_idle", "bored_alert" );
    var_2 thread maps\blackout_code::alert_on_grenade_body_impact();
    var_3 = getentarray( "bored_guy", "script_noteworthy" );
    common_scripts\utility::array_thread( var_3, maps\blackout_code::alert_on_grenade_body_impact );
    common_scripts\utility::array_thread( var_3, maps\blackout_code::reach_and_idle_relative_to_target, "bored_idle_reach", "bored_idle", "bored_alert" );

    foreach ( var_5 in var_3 )
        var_5.flashbangstopsscriptedanim = 1;

    var_3 = getentarray( "hut_hanger", "script_noteworthy" );
    common_scripts\utility::array_thread( var_3, maps\blackout_code::alert_on_grenade_body_impact );
    common_scripts\utility::array_thread( var_3, maps\blackout_code::reach_and_idle_relative_to_target, "bored_idle_reach", "bored_cell_loop", "bored_alert" );
    maps\_utility::add_wait( common_scripts\utility::flag_wait, "play_nears_second_shacks" );
    maps\_utility::add_func( maps\_utility::autosave_by_name, "claymore_save" );
    thread maps\_utility::do_wait();
    maps\_utility::add_wait( common_scripts\utility::flag_wait, "pier_guys" );
    maps\_utility::add_wait( common_scripts\utility::flag_wait, "hut_cleared" );
    maps\_utility::add_wait( common_scripts\utility::flag_wait, "play_nears_second_shacks" );
    maps\_utility::do_wait_any();

    if ( common_scripts\utility::flag( "play_nears_second_shacks" ) )
    {
        maps\blackout_code::kill_all_ai_of_deathflag( "pier_guys" );
        maps\blackout_code::kill_all_ai_of_deathflag( "hut_guys" );
        maps\blackout_code::price_and_gaz_catchup_to_bridge();
    }
    else if ( !common_scripts\utility::flag( "high_alert" ) )
    {
        wait(randomfloatrange( 0.6, 1.2 ));
        level.price maps\_utility::set_force_color( "b" );
        level.gaz maps\_utility::set_force_color( "o" );
        thread maps\blackout_code::price_and_gaz_flash_hut();
        maps\_utility::add_wait( common_scripts\utility::flag_wait, "gaz_rushes_hut" );
        maps\_utility::add_wait( common_scripts\utility::flag_wait, "high_alert" );
        maps\_utility::add_wait( common_scripts\utility::flag_wait, "hut_cleared" );
        maps\_utility::add_wait( common_scripts\utility::flag_wait, "recent_flashed" );
        maps\_utility::do_wait_any();

        if ( isdefined( level.price.h1_scripted_grenade ) )
            level.price animscripts\combat_utility::h1_grenade_attach_detach_listener( "grenade_throw" );

        level.price stopanimscripted();
        var_7 = getnode( "gaz_hut_node", "targetname" );
        level.gaz maps\_utility::disable_ai_color();
        level.gaz.fixednodesaferadius = 0;
        level.gaz setgoalnode( var_7 );
        level.gaz pushplayer( 1 );
        level.gaz.ignoreall = 0;
        level.price.ignoreall = 0;
    }

    common_scripts\utility::flag_wait( "hut_cleared" );

    if ( isdefined( level.friendly_flashbangimmunity ) )
    {
        level.friendly_flashbangimmunity = undefined;
        level.price maps\_utility::setflashbangimmunity( 0 );
        level.gaz maps\_utility::setflashbangimmunity( 0 );
    }

    level.gaz pushplayer( 0 );

    if ( !common_scripts\utility::flag( "high_alert" ) )
    {
        level.gaz.fixednodesaferadius = 32;
        level.price.ignoreall = 1;
        level.gaz.ignoreall = 1;
    }

    wait 0.4;
    level.price thread maps\_utility::dialogue_queue( "guard_posts_ahead" );
    wait 0.3;
    level.price maps\_utility::set_force_color( "y" );
    level.gaz maps\_utility::set_force_color( "p" );
    common_scripts\utility::flag_wait_either( "shack_signal", "chess_cleared" );

    if ( !common_scripts\utility::flag( "high_alert" ) && !common_scripts\utility::flag( "chess_cleared" ) )
    {
        var_0 = getnode( "shack_node", "targetname" );
        thread maps\blackout_code::shack_signal( var_0 );
        var_0 = getnode( "shack_node2", "targetname" );
        thread maps\blackout_code::shack_signal( var_0 );
    }

    common_scripts\utility::flag_wait_either( "chess_cleared", "high_alert" );

    if ( common_scripts\utility::flag( "high_alert" ) )
        maps\_utility::activate_trigger_with_targetname( "hide_from_shack" );
    else
        maps\_utility::activate_trigger_with_targetname( "sneak_up_on_shack" );

    common_scripts\utility::flag_wait( "shack_cleared" );
    common_scripts\utility::flag_wait( "chess_cleared" );
    wait 1.5;
    level.price maps\_utility::set_force_color( "c" );
    level.gaz maps\_utility::set_force_color( "g" );
    maps\_utility::add_global_spawn_function( "axis", maps\blackout_code::commence_attack_on_death );
    var_8 = getaiarray( "axis" );
    common_scripts\utility::array_thread( var_8, maps\blackout_code::commence_attack_on_death );
    common_scripts\utility::flag_wait( "meeting_door_open" );
    maps\_utility::activate_trigger_with_targetname( "meeting_trigger" );
    common_scripts\utility::flag_set( "meeting_begins" );
    setsaveddvar( "g_friendlynamedist", "0" );
    common_scripts\utility::flag_wait( "commence_attack" );
    maps\_utility::remove_global_spawn_function( "axis", maps\blackout_code::commence_attack_on_death );
}

start_field()
{
    soundscripts\_snd::snd_message( "start_field_checkpoint" );
    common_scripts\utility::flag_set( "meeting_begins" );
    thread maps\blackout_code::aa_town_init();
    thread field_meeting();
    maps\blackout_code::setup_sas_buddies();
    maps\blackout_code::setup_player();
    var_0 = getaiarray( "axis" );
    common_scripts\utility::array_levelthread( var_0, maps\_utility::deleteent );
    var_1 = getaiarray( "allies" );
    common_scripts\utility::flag_set( "second_shacks" );
    var_2 = getent( "player_meeting_org", "targetname" );
    level.player setorigin( var_2.origin + ( 0.0, 0.0, -27000.0 ) );
    var_3 = getent( "price_meeting_org", "targetname" );
    var_4 = getent( "price_meeting_org", "targetname" );
    level.price teleport( var_3.origin, var_3.angles );
    level.gaz teleport( var_4.origin, var_4.angles );
    level.player setorigin( var_2.origin );
    maps\_utility::activate_trigger_with_targetname( "meet_at_field" );
    level.gaz maps\_utility::set_force_color( "y" );
}

field_meeting()
{
    var_0 = getnode( "farm_meet_node", "targetname" );
    var_0 = getent( "farm_meet_org", "targetname" );
    common_scripts\utility::flag_wait( "second_shacks" );
    thread overlook_sniping();
    maps\_utility::fail_on_friendly_fire();
    level.field_russians = [];
    var_1 = getentarray( "field_russian", "targetname" );
    common_scripts\utility::array_thread( var_1, maps\_utility::add_spawn_function, maps\blackout_code::field_russian_think );
    common_scripts\utility::array_thread( var_1, maps\_utility::spawn_ai );
    var_2 = getent( "russian_leader", "targetname" );
    var_2 thread maps\_utility::add_spawn_function( maps\blackout_code::russian_leader_think, 1 );
    var_2 thread maps\_utility::add_spawn_function( maps\_utility::magic_bullet_shield );
    var_2 thread maps\_utility::add_spawn_function( maps\blackout_code::set_allowed_stances, "crouch" );
    var_2 thread maps\_utility::spawn_ai();

    if ( getdvarint( "use_old_meeting" ) != 1 )
    {
        wait 1;
        var_0 thread maps\_anim::anim_loop_solo( level.kamarov, "meeting_idle", undefined, "stop_kam_loop" );
    }

    var_3 = getent( "meeting_clip", "targetname" );
    common_scripts\utility::flag_wait( "meeting_begins" );
    maps\_utility::arcademode_checkpoint( 6, "a" );
    level.price maps\_utility::disable_ai_color();
    level.gaz maps\_utility::disable_ai_color();

    if ( getdvarint( "use_old_meeting" ) == 1 )
    {
        var_0 thread maps\_anim::anim_reach_solo( level.price, "meeting" );
        var_4 = getnode( "gaz_field_node", "targetname" );
        level.gaz setgoalnode( var_4 );
        var_5 = maps\_utility::make_array( level.price, level.kamarov );
        level.price.goalradius = 180;
        level.price waittill( "goal" );
        level.price.goalradius = 8;
        level.kamarov maps\_anim::anim_generic( level.kamarov, "standup" );
        level.kamarov allowedstances( "stand", "crouch", "prone" );
        common_scripts\utility::flag_wait( "field_trigger" );
        level.price waittill( "goal" );
    }
    else
    {
        var_5 = maps\_utility::make_array( level.price, level.kamarov, level.gaz );
        var_6 = maps\_utility::make_array( "meeting_reached_price", "meeting_reached_gaz", "field_trigger" );
        level.price thread maps\blackout_code::meeting_reach_think( var_0, "meeting_reached_price", var_6 );
        level.gaz thread maps\blackout_code::meeting_reach_think( var_0, "meeting_reached_gaz", var_6 );
        common_scripts\utility::flag_wait_all( "meeting_reached_price", "meeting_reached_gaz", "field_trigger" );
    }

    var_0 = getent( "farm_meet_org", "targetname" );
    thread maps\blackout_code::field_russians_go_up_hill();
    thread maps\blackout_code::kam_and_price_chat();
    level.price.a.movement = "run";
    level.kamarov.a.movement = "run";
    level.kamarov.a.pose = "stand";
    var_3 disconnectpaths();
    var_3 solid();
    setsaveddvar( "g_friendlynamedist", "0" );
    maps\_utility::delaythread( 7, common_scripts\utility::flag_set, "russians_stand_up" );
    maps\_utility::delaythread( 9, maps\_utility::_setsaveddvar, "g_friendlynamedist", level.friendlynamedist );

    if ( getdvarint( "use_old_meeting" ) == 1 )
    {
        maps\_utility::delaythread( 16.0, common_scripts\utility::flag_set, "go_up_hill" );
        maps\_utility::delaythread( 25.3, common_scripts\utility::flag_set, "field_go" );
        maps\_utility::delaythread( 19.2, common_scripts\utility::flag_set, "field_stop" );
        level.kamarov maps\_utility::delaythread( 25.5, maps\_utility::anim_stopanimscripted );
        level.price maps\_utility::delaythread( 26.0, maps\_utility::anim_stopanimscripted );
        maps\_utility::delaythread( 25.2, common_scripts\utility::flag_set, "gaz_and_price_go_up_hill" );
    }
    else
    {
        level.gaz.a.movement = "jog";
        level.kamarov allowedstances( "stand", "crouch", "prone" );
        maps\_utility::delaythread( 18.3, common_scripts\utility::flag_set, "go_up_hill" );
        maps\_utility::delaythread( 26, common_scripts\utility::flag_set, "field_go" );
    }

    level.timer = gettime();
    var_7 = getent( "kaz_overlook_org", "targetname" );
    level.kamarov setgoalpos( var_7.origin );

    if ( getdvarint( "use_old_meeting" ) != 1 )
        var_0 notify( "stop_kam_loop" );

    soundscripts\_snd::snd_message( "aud_start_meeting" );
    var_0 maps\_anim::anim_single( var_5, "meeting" );

    if ( getdvarint( "use_old_meeting" ) != 1 )
        common_scripts\utility::flag_set( "gaz_and_price_go_up_hill" );

    soundscripts\_snd::snd_message( "aud_stop_meeting" );
    maps\_utility::autosave_by_name( "follow_me" );
    level.hilltop_mortar_team_1 = [];
    level.hilltop_mortar_team_2 = [];
    level.kamarov maps\_utility::stop_magic_bullet_shield();
    level.kamarov thread maps\blackout_code::sas_main_think();
    var_8 = getaiarray( "allies" );
    common_scripts\utility::array_thread( var_8, maps\_utility::set_ignoreall, 1 );
    common_scripts\utility::array_thread( var_8, maps\_utility::set_ignoreme, 1 );
    common_scripts\utility::flag_set( "go_to_overlook" );
    thread overlook_mortars();
    objective_add( 3, "current", &"BLACKOUT_PROVIDE_SNIPER_SUPPORT", ( -7587.0, -2233.0, 857.0 ) );

    if ( getdvarint( "use_old_meeting" ) != 1 )
    {
        level.gaz.run_speed_state = "jog";
        wait 1;
        level.gaz.run_speed_state = "";
        level.gaz.a.movement = "run";
    }

    common_scripts\utility::flag_wait( "over_here" );
    common_scripts\utility::flag_wait( "player_near_overlook" );
    maps\_utility::normal_friendly_fire_penalty();

    if ( common_scripts\utility::flag( "high_alert" ) )
    {
        common_scripts\utility::flag_set( "commence_attack" );
        return;
    }

    level endon( "high_alert" );
    level.price maps\_utility::dialogue_queue( "in_position" );
    level.gaz maps\_utility::dialogue_queue( "cover_left_flank" );
    wait 1;
    common_scripts\utility::flag_wait_either( "player_at_overlook", "high_alert" );
    common_scripts\utility::flag_set( "commence_attack" );
}

overlook_mortars()
{
    common_scripts\utility::flag_wait_either( "commence_attack", "high_alert" );
    common_scripts\utility::flag_wait( "ready_to_commence_attack" );
    wait 1;
    level.kamarov maps\_utility::dialogue_queue( "commence_attack" );
    wait 1.5;
    thread common_scripts\_exploder::exploder( 60 );
    wait 3;
    common_scripts\utility::flag_set( "overlook_attack_begins" );
}

start_overlook()
{
    soundscripts\_snd::snd_message( "start_overlook_checkpoint" );
    thread maps\blackout_code::aa_town_init();
    common_scripts\utility::flag_set( "go_up_hill" );
    common_scripts\utility::flag_set( "second_shacks" );
    common_scripts\utility::flag_set( "bm21s_attack" );
    common_scripts\utility::flag_set( "ready_to_commence_attack" );
    thread overlook_mortars();
    maps\blackout_code::setup_sas_buddies();
    var_0 = getent( "russian_leader", "targetname" );
    var_0 thread maps\_utility::add_spawn_function( maps\blackout_code::russian_leader_think );
    var_0 thread maps\_utility::add_spawn_function( maps\blackout_code::sas_main_think );
    var_0 thread maps\_utility::spawn_ai();
    maps\blackout_code::setup_player();
    maps\_utility::delaythread( 0.05, common_scripts\utility::flag_set, "go_to_overlook" );
    var_1 = getaiarray( "axis" );
    common_scripts\utility::array_levelthread( var_1, maps\_utility::deleteent );
    var_2 = getaiarray( "allies" );
    var_3 = getent( "player_overlook_org", "targetname" );
    level.player setorigin( var_3.origin + ( 0.0, 0.0, -27000.0 ) );
    var_4 = getentarray( "friendly_overlook_org", "targetname" );

    for ( var_5 = 0; var_5 < var_2.size; var_5++ )
    {
        var_2[var_5].ignoreall = 1;
        var_2[var_5] teleport( var_4[var_5].origin, var_4[var_5].angles );
    }

    thread overlook_sniping();
    level.player setorigin( var_3.origin );
    wait 2;
    common_scripts\utility::flag_set( "commence_attack" );
}

overlook_sniping()
{
    common_scripts\utility::flag_wait( "go_up_hill" );
    thread maps\blackout_code::price_tells_player_to_come_over();
    var_0 = getent( "village_blocker", "targetname" );
    var_0 connectpaths();
    var_0 notsolid();
    var_1 = getentarray( "overlook_runner", "script_noteworthy" );
    common_scripts\utility::array_thread( var_1, maps\_utility::add_spawn_function, maps\blackout_code::overlook_runner_think );
    var_2 = getentarray( "smoker_spawner", "targetname" );
    common_scripts\utility::array_thread4( var_2, maps\_utility::add_spawn_function, maps\blackout_code::reach_and_idle_relative_to_target, "smoking_reach", "smoking", "smoking_react" );
    common_scripts\utility::array_thread( var_2, maps\_utility::add_spawn_function, maps\_props::attach_cig_self );
    common_scripts\utility::array_thread( var_2, maps\_utility::spawn_ai );
    var_3 = getentarray( "wall_idler", "targetname" );
    common_scripts\utility::array_thread4( var_3, maps\_utility::add_spawn_function, maps\blackout_code::reach_and_idle_relative_to_target, "bored_idle_reach", "bored_cell_loop", "bored_alert" );
    common_scripts\utility::array_thread( var_3, maps\_utility::spawn_ai );
    var_4 = getentarray( "street_walker", "targetname" );
    common_scripts\utility::array_thread( var_4, maps\_utility::add_spawn_function, maps\blackout_code::street_walker_think );
    common_scripts\utility::array_thread( var_4, maps\_utility::spawn_ai );
    common_scripts\utility::flag_wait( "player_at_overlook" );
    common_scripts\utility::flag_set( "bm21s_attack" );
    maps\_utility::autosave_by_name( "overlook" );
    maps\_utility::delaythread( 2, maps\blackout_code::display_sniper_hint );
    level.player.threatbias = -350;
    thread maps\blackout_code::turn_off_stealth();
    thread maps\blackout_code::hilltop_sniper();
    thread maps\blackout_code::overlook_player_mortarvision();
    common_scripts\utility::flag_wait( "overlook_attack_begins" );
    thread maps\blackout_code::shoot_magic_rocket( "overlook_magic_rocket_01" );
    maps\_utility::battlechatter_on( "allies" );
    var_5 = getaiarray( "allies" );
    common_scripts\utility::array_thread( var_5, maps\_utility::set_ignoreme, 0 );
    maps\_utility::activate_trigger_with_targetname( "overlook_charge" );
    var_6 = getentarray( "assault_spawner", "targetname" );
    common_scripts\utility::array_thread( var_6, maps\_utility::spawn_ai );
    var_7 = getentarray( "first_mg_guys", "targetname" );
    common_scripts\utility::array_thread( var_7, maps\_utility::add_spawn_function, maps\blackout_code::overlook_turret_think );
    common_scripts\utility::array_thread( var_7, maps\_utility::spawn_ai );
    thread maps\blackout_code::overlook_price_tells_you_to_shoot_mgs();
    thread overlook_badguys_pour_in();
    var_8 = getent( "first_rpg_spawner", "targetname" );
    var_8 thread maps\_utility::add_spawn_function( maps\blackout_code::first_rpg_spawner_think );
    var_8 maps\_utility::spawn_ai();
    common_scripts\utility::flag_wait( "first_bmp_destroyed" );
    common_scripts\utility::flag_wait( "mgs_cleared" );
    thread maps\blackout_code::breach_first_building();
    thread maps\_vehicle::spawn_vehicles_from_targetname_and_drive( "enemy_heli" );
    var_9 = getentarray( "enemy_heli", "targetname" );
    common_scripts\utility::array_thread( var_9, ::enemy_heli_riders );
    thread common_scripts\_exploder::exploder( 61 );
    soundscripts\_snd::snd_message( "aud_start_enemy_heli_mix" );
    wait 4.5;
    common_scripts\utility::flag_wait( "begin_the_breach" );
    level.player.threatbias = 0;
    level.player.maxvisibledist = 2048;

    if ( getdvarint( "use_old_burning_house" ) == 1 )
    {
        common_scripts\utility::flag_set( "kam_go_through_burning_house" );
        maps\_utility::activate_trigger_with_targetname( "to_the_cliff" );
        maps\blackout_code::damn_helicopters();
    }
    else
    {
        maps\blackout_code::damn_helicopters();
        maps\_utility::activate_trigger_with_targetname( "to_the_cliff" );
        common_scripts\utility::flag_set( "kam_go_through_burning_house" );
    }

    maps\_utility::objective_complete( 3 );
    objective_add( 4, "current", &"BLACKOUT_CUT_OFF_ENEMY_REINFORCEMENTS", maps\blackout_code::power_plant_org() );
    common_scripts\utility::flag_wait( "kamarov_moving_burning_house" );
    common_scripts\utility::flag_set( "go_through_burning_house" );
    maps\_utility::arcademode_checkpoint( 8, "b" );
    wait 1.2;
    maps\_utility::autosave_by_name( "to_the_cliff" );
    maps\_utility::delaythread( 20, maps\blackout_code::cliff_reminder );
    common_scripts\utility::flag_wait( "player_reaches_cliff_area" );
    level.gaz maps\_utility::delaythread( 1.5, maps\_utility::dialogue_queue, "helicopter_troops" );
    maps\_utility::activate_trigger_with_targetname( "cliff_ground_forces" );
    level.price.ignoreall = 0;
    level.gaz.ignoreall = 0;
    level.kamarov.ignoreall = 0;
    thread cliff_sniping();
    thread player_battles_towards_power_plant();
    common_scripts\utility::flag_wait( "power_plant_cleared" );
    level.price.baseaccuracy = 1;
    level.gaz.baseaccuracy = 1;
    level.kamarov.baseaccuracy = 1;
    maps\_utility::objective_complete( 4 );
    objective_add( 5, "current", &"BLACKOUT_PROVIDE_SNIPER_SUPPORT1", maps\blackout_code::cliff_org() );
}

enemy_heli_riders()
{
    var_0 = self.last_spawned_vehicle;

    foreach ( var_2 in var_0.riders )
        var_2 thread rider_damaged();
}

rider_damaged()
{
    self waittill( "damage", var_0, var_1, var_2, var_3, var_4 );

    if ( isdefined( var_1 ) && var_1 == level.player )
        maps\_utility::arcademode_kill( self.origin, var_4, 60 );
}

player_battles_towards_power_plant()
{
    level endon( "power_plant_cleared" );
    common_scripts\utility::flag_assert( "power_plant_cleared" );
    common_scripts\utility::flag_wait( "heroes_high_accuracy" );
    common_scripts\utility::array_thread( level.deathflags["power_plant_cleared"]["ai"], maps\blackout_code::attack_player );
    level.price.baseaccuracy = 1000;
    level.gaz.baseaccuracy = 1000;
    level.kamarov.baseaccuracy = 1000;
    common_scripts\utility::flag_wait( "player_approaches_power_plant" );
    common_scripts\utility::array_thread( level.deathflags["power_plant_cleared"]["spawners"], maps\_utility::_delete );
    common_scripts\utility::array_thread( level.deathflags["power_plant_cleared"]["ai"], maps\blackout_code::kill_player );
}

overlook_badguys_pour_in()
{
    level endon( "breach_complete" );
    common_scripts\utility::flag_assert( "breach_complete" );
    common_scripts\utility::flag_wait_or_timeout( "overlook_attention", 20 );
    thread maps\blackout_code::overlook_alarm();
    var_0 = getentarray( "east_spawner", "targetname" );
    common_scripts\utility::array_thread( var_0, maps\_utility::add_spawn_function, maps\blackout_code::fall_back_to_defensive_position );
    common_scripts\utility::array_thread( var_0, maps\_utility::spawn_ai );
    wait 15;
    var_1 = getentarray( "mid_spawner", "targetname" );
    common_scripts\utility::array_thread( var_1, maps\_utility::add_spawn_function, maps\blackout_code::fall_back_to_defensive_position );
    common_scripts\utility::array_thread( var_1, maps\_utility::spawn_ai );
    thread maps\blackout_code::spawn_replacement_baddies();
    var_2 = getentarray( "assault_second_wave", "targetname" );
    common_scripts\utility::array_thread( var_2, maps\_utility::spawn_ai );
}

haunted_sniping()
{
    var_0 = getent( "bmp_trigger", "targetname" );
    var_0 waittill( "trigger" );
    var_1 = maps\_vehicle::spawn_vehicle_from_targetname_and_drive( "bmp" );
}

start_cliff()
{
    soundscripts\_snd::snd_message( "start_cliff_checkpoint" );
    thread maps\blackout_code::aa_town_init();
    common_scripts\utility::flag_set( "go_through_burning_house" );
    common_scripts\utility::flag_set( "go_up_hill" );
    common_scripts\utility::flag_set( "go_to_overlook" );
    common_scripts\utility::flag_set( "overlook_attack_begins" );
    common_scripts\utility::flag_set( "breach_complete" );
    common_scripts\utility::flag_set( "bm21s_attack" );
    maps\_utility::delaythread( 1, common_scripts\utility::flag_set, "power_plant_cleared" );
    var_0 = getent( "russian_leader", "targetname" );
    var_0 thread maps\_utility::add_spawn_function( maps\blackout_code::russian_leader_think );
    var_0 thread maps\_utility::spawn_ai();
    var_1 = getaiarray( "allies" );
    maps\blackout_code::setup_sas_buddies();
    maps\blackout_code::setup_player();
    var_2 = getaiarray( "axis" );
    common_scripts\utility::array_levelthread( var_2, maps\_utility::deleteent );
    thread cliff_sniping();
    var_3 = maps\_utility::get_guys_with_targetname_from_spawner( "assault_spawner" );
    var_4 = maps\_utility::get_guys_with_targetname_from_spawner( "assault_second_wave" );
    var_3 = common_scripts\utility::array_combine( var_3, var_4 );
    wait 0.05;
    var_5 = getentarray( "ally_cliff_start_org", "targetname" );

    for ( var_6 = 0; var_6 < var_3.size; var_6++ )
        var_3[var_6] teleport( var_5[var_6].origin );

    common_scripts\utility::flag_set( "player_reaches_cliff_area" );
    wait 0.5;
    var_7 = getent( "player_cliff_org", "targetname" );
    level.player setorigin( var_7.origin + ( 0.0, 0.0, -27000.0 ) );
    var_8 = getentarray( "friendly_cliff_org", "targetname" );

    for ( var_6 = 0; var_6 < var_1.size; var_6++ )
        var_1[var_6] teleport( var_8[var_6].origin, var_8[var_6].angles );

    level.player setorigin( var_7.origin );
}

cliff_sniping()
{
    maps\_utility::activate_trigger_with_targetname( "cliff_trigger" );
    level.price.norunngun = 1;
    level.gaz.norunngun = 1;
    level.kamarov.norunngun = 1;
    level.respawn_spawner = getent( "ally_cliff_spawner", "targetname" );
    common_scripts\utility::flag_set( "cliff_fighting" );
    thread maps\blackout_code::spawn_replacement_cliff_baddies();
    level.enemy_bmp = maps\_vehicle::spawn_vehicle_from_targetname_and_drive( "enemy_bmp" );
    level.enemy_bmp thread maps\blackout_code::bmp_targets_stuff();
    level.enemy_bmp maps\_vehicle::godon();
    level.defenders_killed = 0;
    thread maps\blackout_code::cliff_bm21_blows_up();
    common_scripts\utility::flag_wait( "cliff_look" );
    thread maps\_utility::do_in_order( common_scripts\utility::flag_wait, "power_plant_cleared", maps\_utility::autosave_by_name, "power_plant_cleared" );
    common_scripts\utility::flag_set( "cliff_tanks_move" );
    level.player.ignoreme = 1;
    common_scripts\utility::flag_wait( "cliff_moveup" );
    maps\_utility::activate_trigger_with_targetname( "cliff_allies_advance" );
    common_scripts\utility::flag_wait( "cliff_tank_path_end" );
    wait 3;
    var_0 = getent( "bmp_killer_spawner", "targetname" );
    var_0 thread maps\_utility::add_spawn_function( maps\blackout_code::bmp_killer_spawner_think );
    var_0 thread maps\_utility::spawn_ai();
    wait 0.05;

    if ( !common_scripts\utility::flag( "power_plant_cleared" ) )
    {
        common_scripts\utility::array_thread( level.deathflags["power_plant_cleared"]["ai"], maps\blackout_code::attack_player );
        common_scripts\utility::array_thread( level.deathflags["power_plant_cleared"]["spawners"], maps\_utility::_delete );
        common_scripts\utility::flag_wait( "power_plant_cleared" );
    }

    var_1 = getentarray( "roof_sniper_spawner", "targetname" );
    common_scripts\utility::array_thread( var_1, maps\_utility::add_spawn_function, maps\blackout_code::roof_spawner_think );
    common_scripts\utility::array_thread( var_1, maps\_utility::spawn_ai );
    common_scripts\utility::flag_wait( "cliff_roof_snipers_cleared" );
    level.price.norunngun = 0;
    level.gaz.norunngun = 0;
    level.kamarov.norunngun = 0;
    level.kamarov thread maps\_utility::dialogue_queue( "making_progress" );
    common_scripts\utility::flag_set( "kam_heads_to_rappel_spot" );
    wait 4;
    common_scripts\utility::flag_set( "cliff_complete" );
    maps\_utility::activate_trigger_with_targetname( "friendlies_charge_farmhouse" );
    soundscripts\_snd::snd_message( "aud_stop_sniping_mix" );
    maps\_utility::objective_complete( 5 );
    objective_add( 6, "current", &"BLACKOUT_FOLLOW_KAMAROV_TO_POWER_STATION", maps\blackout_code::rappel_org() );
    common_scripts\utility::flag_set( "head_to_rappel_spot" );
    maps\_utility::arcademode_checkpoint( 10, "c" );
    common_scripts\utility::flag_wait( "final_raid_begins" );
    thread raid_farmhouse();
    common_scripts\utility::flag_wait( "kam_starts_talking" );
    maps\_utility::objective_complete( 6 );
    common_scripts\utility::flag_wait( "kam_wants_more_sniping" );
    common_scripts\utility::flag_wait( "gaz_convinces_kam_otherwise" );
    objective_add( 6, "current", &"BLACKOUT_RAPPEL_DOWN_FROM_THE", maps\blackout_code::rappel_org() );
    common_scripts\utility::flag_wait( "player_rappels" );
    maps\_utility::objective_complete( 6 );
    objective_add( 7, "current", &"BLACKOUT_RESCUE_THE_INFORMANT", maps\blackout_code::informant_org() );
    maps\_utility::autosave_by_name( "attack_farmhouse" );
}

start_rappel()
{
    soundscripts\_snd::snd_message( "start_rappel_checkpoint" );
    common_scripts\utility::flag_set( "cliff_look" );
    common_scripts\utility::flag_set( "cliff_moveup" );
    common_scripts\utility::flag_set( "cliff_roof_snipers_cleared" );
    common_scripts\utility::flag_set( "go_through_burning_house" );
    common_scripts\utility::flag_set( "bm21s_attack" );
    common_scripts\utility::flag_set( "kam_heads_to_rappel_spot" );
    common_scripts\utility::flag_set( "head_to_rappel_spot" );
    common_scripts\utility::flag_set( "cliff_complete" );
    thread start_cliff();
}

start_farmhouse()
{
    soundscripts\_snd::snd_message( "start_farmhouse_checkpoint" );
    thread maps\blackout_code::aa_town_init();
    common_scripts\utility::flag_set( "saw_first_bm21" );
    thread maps\blackout_code::cliff_bm21_blows_up();
    common_scripts\utility::flag_set( "go_up_hill" );
    common_scripts\utility::flag_set( "go_to_overlook" );
    common_scripts\utility::flag_set( "overlook_attack_begins" );
    common_scripts\utility::flag_set( "breach_complete" );
    common_scripts\utility::flag_set( "on_to_the_farm" );
    common_scripts\utility::flag_set( "power_plant_cleared" );
    common_scripts\utility::flag_set( "go_through_burning_house" );
    common_scripts\utility::flag_set( "kam_go_through_burning_house" );
    common_scripts\utility::flag_set( "bm21s_attack" );
    var_0 = getaiarray( "allies" );
    maps\blackout_code::setup_sas_buddies();
    maps\blackout_code::setup_player();
    var_1 = getaiarray( "axis" );
    common_scripts\utility::array_levelthread( var_1, maps\_utility::deleteent );
    common_scripts\utility::flag_set( "player_reaches_cliff_area" );
    wait 0.5;
    var_2 = getent( "player_farmhouse_org", "targetname" );
    level.player setorigin( var_2.origin + ( 0.0, 0.0, -27000.0 ) );
    var_3 = getentarray( "ally_farmhouse_org", "targetname" );

    for ( var_4 = 0; var_4 < var_0.size; var_4++ )
        var_0[var_4] teleport( var_3[var_4].origin, var_3[var_4].angles );

    level.player setorigin( var_2.origin );
    thread raid_farmhouse();
    common_scripts\_exploder::exploder( 300 );
}

raid_farmhouse()
{
    maps\_utility::activate_trigger_with_targetname( "friendlies_charge_farmhouse" );
    var_0 = getentarray( "ally_forced_farm_spawner", "targetname" );
    common_scripts\utility::array_thread( var_0, maps\_utility::add_spawn_function, maps\_utility::replace_on_death );
    common_scripts\utility::array_thread( var_0, maps\_utility::spawn_ai );
    var_1 = getent( "ally_farm_spawner", "targetname" );
    level.respawn_spawner = var_1;
    maps\_utility::clear_promotion_order();
    maps\_utility::set_promotion_order( "c", "r" );
    maps\_utility::instantly_promote_nearest_friendly( "r", "c" );
    maps\_utility::instantly_promote_nearest_friendly( "r", "c" );
    maps\_utility::instantly_promote_nearest_friendly( "r", "c" );
    thread maps\blackout_code::activate_farmhouse_defenders();
    var_2 = getent( "farm_rpg_spawner", "targetname" );
    var_2 thread maps\_utility::add_spawn_function( maps\blackout_code::farm_rpg_guy_attacks_bm21s );
    var_2 maps\_utility::spawn_ai();
    common_scripts\utility::flag_wait( "rpg_guy_attacks_bm21s" );
    common_scripts\utility::flag_wait( "farm_complete" );
    level.price maps\_utility::dialogue_queue( "lets_move" );
    level.price maps\_utility::set_force_color( "y" );
    wait 0.6;
    level.gaz maps\_utility::set_force_color( "y" );
    thread blackout_house();
}

start_blackout()
{
    soundscripts\_snd::snd_message( "start_blackout_checkpoint" );
    common_scripts\utility::flag_set( "go_up_hill" );
    common_scripts\utility::flag_set( "go_to_overlook" );
    common_scripts\utility::flag_set( "overlook_attack_begins" );
    common_scripts\utility::flag_set( "farm_complete" );
    common_scripts\utility::flag_set( "blackout_house_begins" );
    common_scripts\utility::flag_set( "go_through_burning_house" );
    thread maps\_wibble::setup_wibble_helis( 1, "blackhawk_spawn_start" );
    maps\blackout_code::setup_sas_buddies();
    maps\blackout_code::setup_player();
    var_0 = getaiarray( "axis" );
    common_scripts\utility::array_levelthread( var_0, maps\_utility::deleteent );
    var_1 = getent( "player_blackout_org", "targetname" );
    level.player setorigin( var_1.origin + ( 0.0, 0.0, -27000.0 ) );
    var_2 = getaiarray( "allies" );
    var_3 = getentarray( "ally_blackout_org", "targetname" );

    for ( var_4 = 0; var_4 < var_2.size; var_4++ )
        var_2[var_4] teleport( var_3[var_4].origin, var_3[var_4].angles );

    level.player setorigin( var_1.origin );
    thread blackout_house();
    common_scripts\_exploder::exploder( 300 );
}

blackout_house()
{
    maps\_utility::battlechatter_off( "allies" );
    objective_position( 7, maps\blackout_code::informant_org() );
    objective_ring( 7 );
    var_0 = getent( "blackout_path_block", "targetname" );
    var_0 connectpaths();
    var_0 notsolid();
    common_scripts\utility::flag_wait( "blackout_house_begins" );
    var_1 = getentarray( "blind_guy_spawner", "targetname" );
    common_scripts\utility::array_thread( var_1, maps\_utility::add_spawn_function, maps\blackout_code::blind_guy_think );
    common_scripts\utility::array_thread( var_1, maps\_utility::add_spawn_function, maps\blackout_code::add_to_no_delete_group );
    common_scripts\utility::array_thread( var_1, maps\_utility::spawn_ai );
    level.price.baseaccuracy = 5000;
    level.gaz.baseaccuracy = 5000;
    level.price.grenadeammo = 0;
    level.gaz.grenadeammo = 0;
    level.price setisignoringgrenades( 1 );
    level.gaz setisignoringgrenades( 1 );
    level.price maps\_utility::dialogue_queue( "cut_the_power" );

    if ( getdvarint( "use_old_power_cut" ) == 1 )
        thread maps\blackout_code::gaz_goes_to_cut_the_power();
    else
        thread maps\blackout_code::gaz_goes_to_cut_the_power_h1();

    level.price maps\_utility::disable_ai_color();
    level.gaz maps\_utility::disable_ai_color();
    maps\_utility::add_wait( common_scripts\utility::flag_wait, "player_in_house" );
    maps\_utility::add_func( maps\blackout_code::player_in_house );
    thread maps\_utility::do_wait();
    maps\blackout_code::price_approaches_door();
    maps\_utility::autosave_by_name( "blackout" );
    level.gaz.goalradius = 120;
    level.gaz waittill( "goal" );

    if ( getdvarint( "use_old_power_cut" ) == 1 )
        common_scripts\utility::flag_wait( "player_at_blackout_door" );
    else
    {
        while ( !common_scripts\utility::flag( "player_at_blackout_door" ) && distancesquared( level.gaz.origin, level.player.origin ) > 62500 )
            wait 0.1;
    }

    level.price maps\_anim::anim_single_queue( level.price, "gaz_do_it" );

    if ( getdvarint( "use_old_power_cut" ) == 1 )
    {
        maps\blackout_code::blackout_lights_go_out();
        wait 0.5;
        level.gaz thread maps\_anim::anim_single_queue( level.gaz, "i_cut_the_power" );
    }
    else
    {
        common_scripts\utility::flag_set( "gaz_do_it" );
        level.gaz waittillmatch( "single anim", "dialog" );
    }

    wait 0.25;
    level.price maps\_utility::cqb_walk( "on" );
    thread maps\blackout_code::lightswitch_response();
    maps\blackout_code::price_opens_door_and_goes_in();
    common_scripts\utility::flag_wait( "player_in_house" );
    maps\blackout_code::gaz_teleports_upstairs();
    thread blackout_rescue();
    common_scripts\utility::flag_wait( "gaz_runs_by_window" );
    maps\_utility::autosave_by_name( "blackout_inside" );
    common_scripts\utility::flag_set( "blackout_upstairs_spotlight_turn_on" );
    maps\blackout_code::blackout_fence_swap();
    thread maps\blackout_code::gaz_runs_by_window();
    common_scripts\utility::flag_wait_either( "turned_corner", "heli_flies_by" );
    common_scripts\utility::flag_set( "turned_corner" );

    if ( !common_scripts\utility::flag( "door" ) )
    {
        maps\_utility::delaythread( 2, maps\blackout_code::price_attacks_door_guy );
        common_scripts\utility::flag_wait( "door" );
        wait 0.75;
    }
    else
        thread maps\blackout_code::price_attacks_door_guy();

    thread maps\blackout_code::gaz_opens_door_and_enters();
    common_scripts\utility::flag_wait( "blackout_rescue_complete" );
}

start_rescue()
{
    soundscripts\_snd::snd_message( "start_rescue_checkpoint" );
    common_scripts\utility::flag_set( "door" );
    common_scripts\utility::flag_set( "go_up_hill" );
    common_scripts\utility::flag_set( "go_to_overlook" );
    common_scripts\utility::flag_set( "overlook_attack_begins" );
    common_scripts\utility::flag_set( "farm_complete" );
    common_scripts\utility::flag_set( "blackout_house_begins" );
    common_scripts\utility::flag_set( "player_in_house" );
    common_scripts\utility::flag_set( "go_through_burning_house" );
    common_scripts\utility::flag_set( "gaz_opens_door" );
    maps\blackout_code::setup_sas_buddies();
    maps\blackout_code::setup_player();
    var_0 = getaiarray( "axis" );
    common_scripts\utility::array_levelthread( var_0, maps\_utility::deleteent );
    var_1 = getent( "rescue_player_org", "targetname" );
    level.player setorigin( var_1.origin + ( 0.0, 0.0, -27000.0 ) );
    var_2 = getent( "rescue_price_org", "targetname" );
    level.price teleport( var_2.origin );
    level.player setorigin( var_1.origin );
    level.player setplayerangles( var_1.angles );
    var_3 = getnode( "gaz_door_dead_node", "targetname" );
    level.gaz teleport( var_3.origin );
    thread blackout_rescue();
    level.price.baseaccuracy = 5000;
    level.gaz.baseaccuracy = 5000;
    level.price.grenadeammo = 0;
    level.gaz.grenadeammo = 0;
    maps\blackout_code::blackout_fence_swap();
    wait 1;
    level.price setgoalpos( level.price.origin );
    level.price.goalradius = 32;
    level.gaz setgoalnode( var_3 );
    level.gaz.goalradius = 32;
    var_4 = getent( "exit_door", "targetname" );
    var_4 thread maps\_utility::palm_style_door_open();
    common_scripts\_exploder::exploder( 300 );
}

blackout_rescue()
{
    thread maps\blackout_code::blackout_flashlight_guy();
    common_scripts\utility::flag_wait( "door" );
    common_scripts\utility::flag_wait( "blackout_flashlightguy_dead" );
    common_scripts\utility::flag_clear( "heli_flies_by" );
    maps\_utility::objective_complete( 7 );
    objective_add( 8, "current", &"BLACKOUT_EVAC_WITH_THE_INFORMANT", maps\blackout_code::get_evac_org() );
    common_scripts\utility::flag_set( "blackhawk_spawn_start" );
    var_0 = maps\_vehicle::spawn_vehicle_from_targetname( "rescue_blackhawk" );
    var_0.script_disablevehicleaudio = 1;
    var_1 = getent( "rescue_heli_org", "targetname" );
    var_2 = spawn( "script_model", var_0 gettagorigin( "body_animate_jnt" ) );
    var_2 setmodel( "vehicle_blackhawk_sas_night_interior" );
    var_2.angles = var_0.angles;
    var_2 linkto( var_0, "body_animate_jnt" );
    var_3 = getent( "blackhawk_collision", "targetname" );
    var_3 linkto( var_0, "tag_origin", ( 0.0, 0.0, 0.0 ), ( 0.0, 0.0, 0.0 ) );
    var_4 = getent( "blackhawk_death_trigger", "targetname" );
    var_4 thread maps\_utility::manual_linkto( var_0, ( 0.0, 0.0, -50.0 ) );
    var_4 thread maps\_vehicle::heli_squashes_stuff( "blackhawk_lands" );
    var_0.animname = "blackhawk";
    var_0 thread maps\_vehicle_code::rotor_anim();
    level.blackhawk = var_0;
    var_0 maps\_utility::assign_animtree();
    maps\_wibble::wibble_add_heli_to_track( var_0 );
    playfxontag( level._effect["blackout_heli_cockpit_red"], var_0, "tag_light_cargo01" );
    common_scripts\utility::flag_waitopen( "player_in_house" );
    var_1 maps\_anim::anim_first_frame_solo( var_0, "landing" );
    var_0 thread maps\blackout_code::blackhawk_sound();
    thread common_scripts\_exploder::exploder( 400 );
    setsaveddvar( "cg_skipDObjFilterIntoCells", 1 );
    var_1 maps\_anim::anim_single_solo( var_0, "landing" );
    setsaveddvar( "cg_skipDObjFilterIntoCells", 0 );
    var_1 thread maps\_anim::anim_loop_solo( var_0, "idle" );
    common_scripts\utility::flag_set( "blackhawk_lands" );

    if ( getdvarint( "use_old_evac" ) != 1 )
        var_5 = maps\_utility::spawn_anim_model( "evac_rig" );
    else
        var_5 = maps\_utility::spawn_anim_model( "player_rig" );

    var_5 hide();
    var_0 maps\_anim::anim_first_frame_solo( var_5, "player_evac", "tag_detach" );
    var_5 linkto( var_0, "tag_detach" );
    common_scripts\utility::flag_wait( "friendly_head_to_LZ" );
    var_0 maps\_anim::anim_reach_solo( level.price, "evac", "tag_detach" );
    level.price linkto( var_0, "tag_detach" );
    level.price maps\_headtracking::head_tracking_end();
    var_0 thread maps\_anim::anim_single_solo( level.price, "evac", "tag_detach" );
    var_0 thread maps\blackout_code::price_evac_idle();
    var_6 = getent( "heli_rescue_trigger", "script_noteworthy" );
    var_6 common_scripts\utility::trigger_on();
    thread maps\blackout_code::player_jumps_into_heli();
    common_scripts\utility::flag_wait( "player_gets_on_heli" );
    var_7 = getaiarray( "allies" );
    common_scripts\utility::array_thread( var_7, maps\_headtracking::head_tracking_end );
    soundscripts\_snd::snd_message( "start_player_gets_on_heli_mix" );

    if ( isdefined( level.player.nightvision_started ) )
        thread maps\_nightvision::force_remove_nightvision();

    var_6 delete();
    level.hud_mantle["text"].alpha = 0;
    level.player allowcrouch( 0 );
    level.player disableweapons();
    var_8 = [];
    var_8[var_8.size] = level.gaz;
    var_8[var_8.size] = level.vip;

    if ( getdvarint( "use_old_evac" ) != 1 )
    {
        var_5 attach( "viewmodel_m4m203_silencer_reflex", "tag_weapon_right" );
        var_5 maps\_utility::lerp_player_view_to_tag_oldstyle( level.player, "tag_player", 0.5, 0.9, 70, 60, 40, 30 );
        wait 0.5;
        var_5 show();
        var_0 thread maps\_anim::anim_single_solo( var_5, "player_evac", "tag_detach" );
        thread h1_rescueclimbheli_viewclamp_seq();
        var_0 maps\_anim::anim_first_frame( var_8, "evac", "tag_detach" );
        level.gaz linkto( var_0, "tag_detach" );
        level.vip linkto( var_0, "tag_detach" );
        wait 1.5;
        var_0 thread maps\_anim::anim_single( var_8, "evac", "tag_detach" );
        wait 5.5;
        common_scripts\utility::flag_clear( "blackhawk_lands" );
        var_0 notify( "stop_loop" );
        var_0 thread maps\_anim::anim_single_solo( level.price, "evac_flyaway", "tag_detach" );
        wait 2.5;
    }
    else
    {
        var_5 maps\_utility::lerp_player_view_to_tag_oldstyle( level.player, "tag_player", 0.5, 0.9, 90, 90, 90, 90 );
        var_0 thread maps\_anim::anim_single_solo( var_5, "player_evac", "tag_detach" );
        wait 2.5;
        common_scripts\utility::array_thread( var_8, maps\_utility::_linkto, var_0, "tag_detach" );
        var_0 thread maps\_anim::anim_single( var_8, "evac", "tag_detach" );
        wait 8;
        common_scripts\utility::flag_clear( "blackhawk_lands" );
        var_0 notify( "stop_loop" );
        var_0 thread maps\_anim::anim_single_solo( level.price, "evac_flyaway", "tag_detach" );
    }

    var_1 notify( "stop_loop" );
    var_1 thread maps\_anim::anim_single_solo( var_0, "take_off" );
    maps\_utility::objective_complete( 8 );
}

h1_rescueclimbheli_viewclamp_seq()
{
    level.player lerpviewangleclamp( 0.7, 0, 0, 0, 0, 0, 0 );
    wait 1.7;
    level.player lerpviewangleclamp( 1.0, 0, 0, 0, 30, 0, 25 );
    wait 1.8;
    level.player lerpviewangleclamp( 1.0, 0, 0, 0, 60, 0, 25 );
    wait 16.5;
}

rescue_blackhawk_spotlight()
{
    maps\blackout_code::helicopter_searchlight_on();

    if ( distancesquared( self.origin, level.player.origin ) < 25000000 )
    {
        self waittillmatch( "single anim", "spot_player" );
        thread maps\blackout_code::spot_target( level.player, undefined, 700 );
    }

    self waittillmatch( "single anim", "spot_path" );
    var_0 = getent( "first_spotlight_org", "targetname" );
    thread maps\blackout_code::spot_target( var_0 );
}
