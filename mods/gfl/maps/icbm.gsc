// H1 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

dead_script()
{
    level.playerisinside = 0;
    var_0 = getentarray( "flag_set", "targetname" );

    foreach ( var_2 in var_0 )
    {
        if ( var_2.script_flag == "player_is_inside" )
            var_2.script_noteworthy = "skip_blockout_delete";
    }

    var_4 = getent( "sunrise2", "targetname" );
    var_5 = getent( "sunrise3", "targetname" );
    var_6 = getent( "sunrise4", "targetname" );
    var_4.script_noteworthy = "skip_blockout_delete";
    var_5.script_noteworthy = "skip_blockout_delete";
    var_6.script_noteworthy = "skip_blockout_delete";
    common_scripts\_ca_blockout::init();
    maps\icbm_precache::main();
    maps\icbm_fx::main();
    maps\createfx\icbm_audio::main();
    maps\createart\icbm_art::main();
    maps\_load::main();
    maps\icbm_anim::anim_main();
    level thread maps\icbm_amb::main();
    maps\icbm_lighting::main();
    level thread maps\icbm_lighting::beautiful_corner_lighting();
}

main()
{
    if ( getdvar( "beautiful_corner" ) == "1" )
    {
        dead_script();
        return;
    }

    setsaveddvar( "sm_sunShadowScale", "0.5" );
    level.friendlies = [];
    level.tango_down_dialog = 0;
    maps\_utility::default_start( ::landed_start );
    maps\_utility::add_start( "landed", ::landed_start, &"STARTS_LANDED" );
    maps\_utility::add_start( "basement", ::basement_start, &"STARTS_BASEMENT" );
    maps\_utility::add_start( "house2", ::house2_start, &"STARTS_HOUSE2" );
    maps\_utility::add_start( "rescued", ::rescued_start, &"STARTS_RESCUED" );
    maps\_utility::add_start( "tower", ::tower_start, &"STARTS_TOWER" );
    maps\_utility::add_start( "fense", ::fense_start, &"STARTS_FENSE" );
    maps\_utility::add_start( "base", ::base_start, &"STARTS_BASE" );
    maps\_utility::add_start( "base2", ::base2_start, &"STARTS_BASE2" );
    maps\_utility::add_start( "launch", ::launch_start, &"STARTS_LAUNCH" );
    precachemodel( "wpn_h1_melee_combat_knife_vm" );
    precacheitem( "m4m203_silencer_reflex" );
    precacheitem( "m4m203_silencer" );
    precacheitem( "usp_silencer" );
    precachemodel( "com_powerline_tower_destroyed" );
    precachemodel( "com_flashlight_on" );
    precachemodel( "weapon_parabolic_knife" );
    precachemodel( "com_spray_can01" );
    precachemodel( "prop_flex_cuff" );
    precachemodel( "prop_flex_cuff_obj" );
    precachemodel( "com_folding_chair" );
    precachemodel( "weapon_c4" );
    precachemodel( "weapon_c4_obj" );
    precachestring( &"ICBM_GRIGGSUSETRIGGER" );
    precachestring( &"ICBM_LOCATE_SSGTGRIGGS" );
    precachestring( &"ICBM_DESTROY_THE_POWER_TRANSMISSION" );
    precachestring( &"ICBM_REGROUP_WITH_SECOND_SQUAD" );
    precachestring( &"ICBM_PLANT_C4_ON_TOWER_LEGS" );
    precachestring( &"ICBM_GET_TO_A_SAFE_DISTANCE" );
    precachestring( &"ICBM_MISSIONFAIL_ICBM_CHOPPERS_SHOT" );
    maps\_utility::add_hint_string( "one_more_c4", &"ICBM_ONE_MORE_C4", undefined );
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
    precacheshader( "h1_hud_tutorial_blur" );
    precacheshader( "h1_hud_tutorial_border" );
    precacherumble( "generic_ambient_loop" );
    precacherumble( "generic_quake_loop" );
    precacherumble( "generic_attack_heavy_2000" );
    precacherumble( "generic_attack_heavy_1000" );
    precacherumble( "generic_attack_medium_500" );
    precacherumble( "generic_attack_medium_1000" );
    maps\icbm_precache::main();
    maps\_vehicle::build_aianims_with_classname( "script_vehicle_uaz_hardtop_destructible", maps\icbm_anim::uaz_overrides, maps\icbm_anim::uaz_vehicle_overrides );
    setup_bm21_deathanim();
    maps\icbm_fx::main();
    maps\createfx\icbm_audio::main();
    maps\_load::set_player_viewhand_model( "h2_gfl_m4_sopmod_ii_worldhands" );
    animscripts\dog\dog_init::initdoganimations();
    level.weaponclipmodels = [];
    level.weaponclipmodels[0] = "weapon_ak47_clip";
    level.weaponclipmodels[1] = "weapon_ak74u_clip";
    level.weaponclipmodels[2] = "weapon_saw_clip";
    level.weaponclipmodels[3] = "weapon_m16_clip";
    level.weaponclipmodels[4] = "weapon_mp5_clip";
    level.weaponclipmodels[5] = "weapon_m14_clip";
    level.weaponclipmodels[6] = "weapon_g36_clip";
    level.towerblastradius = 384;
    level.cosine = [];
    level.cosine["180"] = cos( 180 );
    level.minbmpexplosiondmg = 50;
    level.maxbmpexplosiondmg = 100;
    level.bmpcannonrange = 2048;
    level.bmpmgrange = 850;
    level.bmpmgrangesquared = level.bmpmgrange * level.bmpmgrange;
    level.playervehicledamagerange = 256;
    level.playervehicledamagerangesquared = level.playervehicledamagerange * level.playervehicledamagerange;
    level.playerisinside = 0;
    maps\createart\icbm_art::main();
    thread common_scripts\_pipes::main();
    maps\_load::main();
    maps\_nightvision::main();
    maps\icbm_anim::anim_main();
    maps\icbm_lighting::main();
    maps\icbm_aud::main();
    maps\_breach_explosive_left::main();
    maps\_breach::main();
    maps\_c4::main();
    level.default_goalheight = 512;
    maps\_stealth_logic::stealth_init();
    maps\_stealth_behavior::main();
    var_0 = 1024;
    level._stealth.logic.ai_event["ai_eventDistDeath"]["alert"] = var_0;
    level._stealth.logic.ai_event["ai_eventDistDeath"]["hidden"] = var_0;
    setsaveddvar( "ai_eventDistDeath", level._stealth.logic.ai_event["ai_eventDistDeath"]["hidden"] );
    level thread maps\icbm_amb::main();
    maps\_compass::setupminimap( "compass_map_icbm" );
    createthreatbiasgroup( "dogs" );
    createthreatbiasgroup( "icbm_friendlies" );
    level.player thread maps\_stealth_logic::stealth_ai();
    setignoremegroup( "icbm_friendlies", "dogs" );
    setignoremegroup( "dogs", "icbm_friendlies" );
    common_scripts\utility::flag_init( "first_obj" );
    common_scripts\utility::flag_init( "price_ready" );
    common_scripts\utility::flag_init( "intro_dialog_done" );
    common_scripts\utility::flag_init( "regroup01_done" );
    common_scripts\utility::flag_init( "landed" );
    common_scripts\utility::flag_init( "truck_spotted" );
    common_scripts\utility::flag_init( "add_driveway" );
    common_scripts\utility::flag_init( "driveway_done" );
    common_scripts\utility::flag_init( "bldg1_grigs_todo" );
    common_scripts\utility::flag_init( "sound alarm" );
    common_scripts\utility::flag_init( "truck arived" );
    common_scripts\utility::flag_init( "contacts_in_the_woods" );
    common_scripts\utility::flag_init( "enter_basement" );
    common_scripts\utility::flag_init( "price_basement_door_anim_complete" );
    common_scripts\utility::flag_init( "price_house2_door_anim_complete" );
    common_scripts\utility::flag_init( "knife_sequence_starting" );
    common_scripts\utility::flag_init( "knife_sequence_done" );
    common_scripts\utility::flag_init( "beehive1_active" );
    common_scripts\utility::flag_init( "house1_cleared" );
    common_scripts\utility::flag_init( "clear_bldg1_done" );
    common_scripts\utility::flag_init( "beehive2_active" );
    common_scripts\utility::flag_init( "outside_cleared" );
    common_scripts\utility::flag_init( "start_interogation" );
    common_scripts\utility::flag_init( "breach_ready_flag" );
    common_scripts\utility::flag_init( "breach_started" );
    common_scripts\utility::flag_init( "griggs_is_good" );
    common_scripts\utility::flag_init( "grigs_todo" );
    common_scripts\utility::flag_init( "attack_house2" );
    common_scripts\utility::flag_init( "grigs_guys_dead" );
    common_scripts\utility::flag_init( "breach_house02_done" );
    common_scripts\utility::flag_init( "ready_for_breach" );
    common_scripts\utility::flag_init( "courtyard_badguy01_dead" );
    common_scripts\utility::flag_init( "hq_entered" );
    common_scripts\utility::flag_init( "price_ready_for_griggs_rescue" );
    common_scripts\utility::flag_init( "griggs_loose" );
    common_scripts\utility::flag_init( "house02_clear" );
    common_scripts\utility::flag_init( "chopper_gone" );
    common_scripts\utility::flag_init( "lights_on" );
    common_scripts\utility::flag_init( "lights_off" );
    common_scripts\utility::flag_init( "c4_planted" );
    common_scripts\utility::flag_init( "tower_destroyed" );
    common_scripts\utility::flag_init( "tower_blown" );
    common_scripts\utility::flag_init( "cut_fence1" );
    common_scripts\utility::flag_init( "cut_fence2" );
    common_scripts\utility::flag_init( "area1_started" );
    common_scripts\utility::flag_init( "area2_started" );
    common_scripts\utility::flag_init( "unblock_path" );
    common_scripts\utility::flag_init( "add_kill_bmp" );
    common_scripts\utility::flag_init( "flankers2_dead" );
    common_scripts\utility::flag_init( "bmp_fire" );
    common_scripts\utility::flag_init( "bmp_dead" );
    common_scripts\utility::flag_init( "in_last_bldg" );
    common_scripts\utility::flag_init( "kill_area01_spawners" );
    common_scripts\utility::flag_init( "kill_area02_spawners" );
    common_scripts\utility::flag_init( "spawn_second_sqaud" );
    common_scripts\utility::flag_init( "fire_missile" );
    common_scripts\utility::flag_init( "launch_01" );
    common_scripts\utility::flag_init( "launch_02" );
    common_scripts\utility::flag_init( "start_launch_scene" );
    common_scripts\utility::flag_init( "lift_off_scene_done" );
    common_scripts\utility::flag_init( "meetup_todo" );
    common_scripts\utility::flag_init( "level_done" );
    common_scripts\utility::flag_init( "move_to_house02_breach" );
    common_scripts\utility::flag_init( "music_endon_start_rescue" );
    common_scripts\utility::flag_init( "music_endon_tower_approach" );
    common_scripts\utility::flag_init( "music_endon_tower_collapse" );
    common_scripts\utility::flag_init( "music_endon_oldbase_entered" );
    common_scripts\utility::flag_init( "gm5_reached_end_anim" );
    common_scripts\utility::flag_init( "price_reached_end_anim" );
    common_scripts\utility::flag_init( "second_fight_started" );
    common_scripts\utility::flag_init( "third_fight_started" );
    common_scripts\utility::flag_init( "dialog_holdfire_done" );
    common_scripts\utility::flag_init( "objective_regroup_complete" );
    common_scripts\utility::flag_init( "soap_take_look" );
    common_scripts\utility::flag_init( "run_to_gate" );
    common_scripts\utility::flag_init( "aa_base_fight" );
    common_scripts\utility::flag_init( "get_yer_ass" );
    var_1 = getentarray( "price", "script_noteworthy" );
    common_scripts\utility::array_thread( var_1, maps\_utility::add_spawn_function, maps\_stealth_logic::friendly_init );
    common_scripts\utility::array_thread( var_1, maps\_utility::add_spawn_function, maps\icbm_code::price_think );
    common_scripts\utility::array_thread( var_1, maps\_utility::add_spawn_function, maps\icbm_code::set_threatbias_group, "icbm_friendlies" );
    var_2 = getentarray( "mark", "script_noteworthy" );
    common_scripts\utility::array_thread( var_2, maps\_utility::add_spawn_function, maps\icbm_code::griggs_think );
    common_scripts\utility::array_thread( var_2, maps\_utility::add_spawn_function, maps\icbm_code::set_threatbias_group, "icbm_friendlies" );
    var_3 = getentarray( "gaz", "script_noteworthy" );
    common_scripts\utility::array_thread( var_3, maps\_utility::add_spawn_function, maps\_stealth_logic::friendly_init );
    common_scripts\utility::array_thread( var_3, maps\_utility::add_spawn_function, maps\icbm_code::gaz_think );
    common_scripts\utility::array_thread( var_3, maps\_utility::add_spawn_function, maps\icbm_code::set_threatbias_group, "icbm_friendlies" );
    var_4 = getentarray( "friendly", "script_noteworthy" );
    common_scripts\utility::array_thread( var_4, maps\_utility::add_spawn_function, maps\_stealth_logic::friendly_init );
    common_scripts\utility::array_thread( var_4, maps\_utility::add_spawn_function, maps\icbm_code::friendly_think );
    common_scripts\utility::array_thread( var_4, maps\_utility::add_spawn_function, maps\icbm_code::set_threatbias_group, "icbm_friendlies" );
    var_5 = getentarray( "respawned_friendly", "script_noteworthy" );
    common_scripts\utility::array_thread( var_5, maps\_utility::add_spawn_function, maps\_stealth_logic::friendly_init );
    common_scripts\utility::array_thread( var_5, maps\_utility::add_spawn_function, maps\icbm_code::respawned_friendly_think );
    common_scripts\utility::array_thread( var_5, maps\_utility::add_spawn_function, maps\icbm_code::set_threatbias_group, "icbm_friendlies" );
    var_6 = getentarray( "truck_guys", "script_noteworthy" );
    common_scripts\utility::array_thread( var_6, maps\_utility::add_spawn_function, maps\icbm_code::truck_guys_think );
    level notify( "setup_initial_level_lighting" );
    level thread objectives();
    level thread maps\icbm_code::missile_launch01();
    level thread maps\icbm_code::missile_launch02();
    level thread maps\icbm_code::tower_collapse();
    var_7 = getentarray( "patroller", "script_noteworthy" );
    common_scripts\utility::array_thread( var_7, maps\_utility::add_spawn_function, maps\_stealth_logic::stealth_ai );
    common_scripts\utility::array_thread( var_7, maps\_utility::add_spawn_function, maps\icbm_code::attach_flashlight, 1, 1 );
    common_scripts\utility::array_thread( var_7, maps\_utility::add_spawn_function, maps\icbm_code::detach_flashlight_onspotted );
    common_scripts\utility::array_thread( var_7, maps\_utility::add_spawn_function, maps\icbm_code::ignoreme_till_close );
    common_scripts\utility::array_thread( var_7, maps\_utility::add_spawn_function, maps\icbm_dialog::dialog_contacts_in_the_woods );
    common_scripts\utility::array_thread( var_7, maps\_utility::add_spawn_function, maps\icbm_dialog::dialog_tango_down );
    common_scripts\utility::array_thread( var_7, maps\_utility::add_spawn_function, maps\icbm_code::woods_patroller_think );
    var_8 = getentarray( "stealth_idles", "script_noteworthy" );
    common_scripts\utility::array_thread( var_8, maps\_utility::add_spawn_function, maps\_stealth_logic::stealth_ai );
    common_scripts\utility::array_thread( var_8, maps\_utility::add_spawn_function, maps\icbm_code::idle_anim_think );
    common_scripts\utility::array_thread( var_8, maps\_utility::add_spawn_function, maps\icbm_code::ignoreme_till_stealth_broken );
    var_9 = getentarray( "second_squad_talker", "script_noteworthy" );
    common_scripts\utility::array_thread( var_9, maps\_utility::add_spawn_function, maps\icbm_code::second_squad_talker_think );
    var_10 = getentarray( "base_fight_dogs", "script_noteworthy" );
    common_scripts\utility::array_thread( var_10, maps\_utility::add_spawn_function, maps\icbm_code::set_threatbias_group, "dogs" );
    var_11 = getentarray( "no_sight_brush", "targetname" );
    common_scripts\utility::array_thread( var_11, maps\icbm_code::clip_nosight_logic );
    var_12 = getentarray( "first_fight_guys", "script_noteworthy" );
    common_scripts\utility::array_thread( var_12, maps\_utility::add_spawn_function, ::first_fight_counter );
    var_13 = getentarray( "third_fight_counter", "script_noteworthy" );
    common_scripts\utility::array_thread( var_13, maps\_utility::add_spawn_function, ::third_fight_counter );
    maps\icbm_code::remove_vehicle_delete_trigger( "delete_choppers1" );
    maps\icbm_code::remove_vehicle_delete_trigger( "delete_choppers2" );
    maps\icbm_code::remove_vehicle_delete_trigger( "delete_choppers3" );
    var_14 = getentarray( "sound_fade_then_delete", "script_noteworthy" );
    common_scripts\utility::array_thread( var_14, maps\icbm_code::sound_fade_then_delete );
    thread maps\_utility::ai_team_run_twitch_think( "allies", "intro_dialog_done", undefined, "landed", undefined );
    wait 0.05;
    var_15 = [];
    var_15["prone"] = 512;
    var_15["crouch"] = 600;
    var_15["stand"] = 1024;
    var_16 = [];
    var_16["prone"] = 512;
    var_16["crouch"] = 900;
    var_16["stand"] = 1500;
    thread maps\_stealth_logic::stealth_detect_ranges_set( var_15, var_16, undefined );
}

#using_animtree("vehicles");

setup_bm21_deathanim()
{
    var_0 = level.vtmodel;
    var_1 = level.vttype;
    var_2 = level.vtclassname;
    level.vtmodel = "vehicle_bm21_mobile_cover_no_bench";
    level.vttype = "bm21_troops";
    level.vtclassname = "script_vehicle_bm21_mobile_cover_no_bench";
    maps\_vehicle::build_deathmodel( "vehicle_bm21_mobile_cover_no_bench", "vehicle_bm21_mobile_bed_dstry" );
    var_3 = spawnstruct();
    var_3.anims = [];
    var_3.anims[var_3.anims.size] = %vehicle_80s_sedan1_destroy;
    var_3.delay_crash = 1;
    var_3.need_dummy = 1;
    maps\_vehicle::build_deathanim( var_3 );
    level.vtmodel = var_0;
    level.vttype = var_1;
    level.vtclassname = var_2;
}

objectives()
{
    common_scripts\utility::flag_wait( "first_obj" );
    var_0 = getent( "obj_grigsby", "targetname" );
    objective_add( 2, "active", &"ICBM_LOCATE_SSGTGRIGGS", var_0.origin );
    objective_current( 2 );
    var_1 = getent( "house01_basement_door_model", "targetname" );
    objective_position( 2, var_1.origin + ( 50.0, 33.0, 0.0 ) );
    common_scripts\utility::flag_wait( "price_basement_door_anim_complete" );
    objective_position( 2, ( 0.0, 0.0, 0.0 ) );
    common_scripts\utility::flag_wait( "soap_take_look" );
    var_2 = getent( "house02_front_door", "targetname" );
    objective_position( 2, var_2.origin + ( 64.0, 51.0, 0.0 ) );
    common_scripts\utility::flag_wait( "price_house2_door_anim_complete" );
    objective_position( 2, var_0.origin );
    common_scripts\utility::flag_wait( "griggs_loose" );
    objective_state( 2, "done" );
    common_scripts\utility::flag_wait( "griggs_is_good" );
    var_0 = getent( "obj_tower", "targetname" );
    objective_add( 3, "active", &"ICBM_DESTROY_THE_POWER_TRANSMISSION", var_0.origin );
    objective_current( 3 );
    common_scripts\utility::flag_wait( "tower_destroyed" );
    objective_state( 3, "done" );
    common_scripts\utility::flag_wait( "tower_blown" );
    var_0 = getent( "second_squad", "targetname" );
    objective_add( 4, "active", &"ICBM_REGROUP_WITH_SECOND_SQUAD", var_0.origin );
    objective_current( 4 );
    common_scripts\utility::flag_wait( "objective_regroup_complete" );
    objective_state( 4, "done" );
}

landed_start()
{
    soundscripts\_snd::snd_message( "start_landed_checkpoint" );
    var_0 = getentarray( "chute_start_spawners", "targetname" );
    common_scripts\utility::array_thread( var_0, maps\_utility::spawn_ai );
    var_1 = getent( "landed_start", "targetname" );
    level.player setorigin( var_1.origin );
    level.player setplayerangles( var_1.angles );
    common_scripts\utility::flag_set( "landed" );
    wait 0.5;
    landed_to_basement_handler();
}

landed_to_basement_handler()
{
    level.truckguys = [];
    var_0 = getent( "truck_spawn", "targetname" );
    maps\_utility::activate_trigger_with_targetname( "start_colors" );
    maps\_utility::disable_trigger_with_targetname( "start_colors" );

    if ( 0 )
        thread maps\icbm_code::min_spec_kill_fx();
    else
        level thread maps\icbm_fx::playereffect();

    maps\_utility::battlechatter_off( "allies" );
    var_0 thread maps\icbm_code::truck_setup();
    var_0 thread maps\icbm_dialog::dialog_enemy_vehicle();
    thread maps\icbm_code::make_friendies_cqb();
    thread maps\icbm_code::make_friendies_deadly();
    thread maps\icbm_code::make_friendies_ignored();
    thread maps\icbm_code::disable_ignoreme_on_stealth_spotted();
    common_scripts\utility::array_thread( level.friendlies, maps\icbm_code::friendlies_stop_on_truck_spotted );
    thread maps\_utility::do_in_order( common_scripts\utility::flag_wait, "_stealth_spotted", maps\icbm_code::stop_make_friendies_ignored );

    if ( getdvarint( "use_old_intro" ) == 1 )
        maps\icbm_dialog::dialog_intro();
    else
        maps\icbm_dialog::dialog_intro_h1();

    common_scripts\utility::flag_set( "first_obj" );
    maps\_utility::autosave_by_name( "moveout02" );

    if ( !common_scripts\utility::flag( "truckguys dead" ) && !common_scripts\utility::flag( "spawned_woods_patrol" ) )
        maps\_utility::activate_trigger_with_targetname( "friendlies_moves_up_the_hill" );

    common_scripts\utility::flag_wait( "truckguys dead" );
    maps\icbm_dialog::dialog_ambush_finished();
    thread maps\icbm_code::friendlies_start_paths();
    common_scripts\utility::flag_wait( "spawned_woods_patrol" );
    common_scripts\utility::array_thread( level.friendlies, maps\icbm_code::friendlies_stop_paths_to_fight );
    common_scripts\utility::flag_wait( "patrollers_dead" );
    maps\icbm_code::disable_friendly_deadlyness();
    wait 4;
    level.gaz maps\_anim::anim_single_queue( level.gaz, "allclear" );
    common_scripts\utility::flag_wait( "close_to_basement" );
    thread maps\icbm_dialog::dialog_check_houses();
    thread basement_to_house1_handler();
}

basement_start()
{
    soundscripts\_snd::snd_message( "start_basement_checkpoint" );
    var_0 = getentarray( "basement_start_spawners", "targetname" );
    common_scripts\utility::array_thread( var_0, maps\_utility::spawn_ai );
    var_1 = getent( "basement_start", "targetname" );
    level.player setorigin( var_1.origin );
    level.player setplayerangles( var_1.angles );
    common_scripts\utility::flag_set( "first_obj" );
    common_scripts\utility::flag_set( "landed" );
    maps\_utility::activate_trigger_with_targetname( "basement_door_nodes" );
    thread maps\icbm_lighting::skip_to_sunrise2();
    wait 1;
    basement_to_house1_handler();
}

basement_to_house1_handler()
{
    maps\_utility::battlechatter_off( "allies" );
    thread maps\icbm_code::beehive_wait();
    var_0 = getnode( "price_basement_stack", "script_noteworthy" );
    var_1 = getent( "house01_basement_door", "targetname" );
    var_2 = getent( "house01_basement_door_model", "targetname" );
    var_2 linkto( var_1 );
    maps\icbm_code::make_friendies_pushplayer( 1 );
    thread maps\icbm_code::price_gets_ready_to_open_door( var_0 );
    soundscripts\_snd::snd_message( "first_house_mix" );
    common_scripts\utility::flag_wait( "open_basement" );

    while ( distance( level.gaz.origin, level.price.origin ) > 500 )
        wait 1;

    maps\icbm_code::price_opens_door( var_0, var_1, "price_basement_door_anim_complete" );
    level.price maps\_utility::enable_ai_color();
    level._stealth.logic.ai_event["ai_eventDistDeath"]["alert"] = 256;
    level._stealth.logic.ai_event["ai_eventDistDeath"]["hidden"] = 256;
    setsaveddvar( "ai_eventDistDeath", level._stealth.logic.ai_event["ai_eventDistDeath"]["hidden"] );
    maps\icbm_code::make_friendies_pushplayer( 0 );
    maps\icbm_code::make_friendies_cqb();
    maps\_utility::activate_trigger_with_targetname( "price_basement_node" );
    common_scripts\utility::flag_wait( "price_basement_door_anim_complete" );
    maps\_utility::delaythread( 1, maps\_utility::activate_trigger_with_targetname, "move_buddies_into_basement" );
    var_3 = getent( "spawn_house1_upstairs_guys", "targetname" );
    maps\_utility::activate_trigger_with_targetname( "spawn_house1_upstairs_guys" );
    var_3 common_scripts\utility::trigger_off();
    thread maps\icbm_code::knife_kill_setup();
    common_scripts\utility::flag_wait( "knife_sequence_done" );
    maps\_utility::activate_trigger_with_targetname( "post_knife_kill_nodes" );
    thread maps\icbm_dialog::dialog_post_knife_kill();
    thread friendlies_help_upstairs();
}

friendlies_help_upstairs()
{
    common_scripts\utility::flag_wait_either( "_stealth_spotted", "house1_upstairs_dead" );
    wait 4;
    maps\_utility::activate_trigger_with_targetname( "friendlies_help_upstairs" );

    if ( common_scripts\utility::flag( "beehive1_active" ) )
    {
        common_scripts\utility::flag_wait( "beehive1_dead" );
        wait 1;
    }

    maps\_utility::activate_trigger_with_targetname( "gaz_check_rooms" );
    wait 1;
    common_scripts\utility::flag_set( "house1_cleared" );
    thread house1_to_house2_handler();
}

house1_to_house2_handler()
{
    maps\_utility::trigger_wait( "gaz_checks_upstairs", "targetname" );
    level.gaz maps\_anim::anim_single_queue( level.gaz, "griggsnothere" );
    level.price maps\_anim::anim_single_queue( level.price, "regroupdownstairs" );
    var_0 = 1024;
    level._stealth.logic.ai_event["ai_eventDistDeath"]["alert"] = var_0;
    level._stealth.logic.ai_event["ai_eventDistDeath"]["hidden"] = var_0;
    setsaveddvar( "ai_eventDistDeath", level._stealth.logic.ai_event["ai_eventDistDeath"]["hidden"] );
    maps\_utility::activate_trigger_with_targetname( "house01_clear_regroup" );
    level.gaz maps\_anim::anim_single_queue( level.gaz, "copythat" );
    var_1 = getnode( "price_open_door01_node", "script_noteworthy" );
    thread maps\icbm_code::price_gets_ready_to_open_door( var_1 );
    maps\_utility::trigger_wait( "price_open_door01_trigger", "targetname" );
    maps\_utility::autosave_by_name( "leaving_house1" );
    thread maps\icbm_code::make_friendies_ignored();
    thread maps\icbm_code::disable_ignoreme_on_stealth_spotted();
    var_2 = getentarray( "outside_spawners", "targetname" );
    thread maps\icbm_code::friendlies_fighting_nodes();
    common_scripts\utility::array_thread( var_2, maps\_utility::spawn_ai );
    level.price maps\_anim::anim_single_queue( level.price, "keepquiet" );
    var_3 = getent( "house01_front_door", "targetname" );
    var_4 = getent( "house01_front_door_model", "targetname" );
    var_4 linkto( var_3 );
    maps\icbm_code::price_opens_door( var_1, var_3 );
    common_scripts\utility::flag_set( "soap_take_look" );
    level.price maps\_utility::enable_ai_color();
    maps\_utility::activate_trigger_with_targetname( "price_front_door_node" );
    level.price maps\_anim::anim_single_queue( level.price, "takealook" );
    thread maps\icbm_code::beehive2_wait();
    common_scripts\utility::flag_wait( "outside_dead" );

    if ( common_scripts\utility::flag( "beehive2_active" ) )
    {
        common_scripts\utility::flag_wait( "beehive2_dead" );
        wait 2;
    }

    common_scripts\utility::flag_set( "outside_cleared" );
    thread house2_to_griggs_handler();
}

house2_start()
{
    soundscripts\_snd::snd_message( "start_house2_checkpoint" );
    var_0 = getentarray( "house2_start_spawners", "targetname" );
    common_scripts\utility::array_thread( var_0, maps\_utility::spawn_ai );
    var_1 = getent( "house2_start", "targetname" );
    level.player setorigin( var_1.origin );
    level.player setplayerangles( var_1.angles );
    common_scripts\utility::flag_set( "first_obj" );
    common_scripts\utility::flag_set( "price_basement_door_anim_complete" );
    common_scripts\utility::flag_set( "soap_take_look" );
    common_scripts\utility::flag_set( "landed" );
    common_scripts\utility::flag_set( "house1_cleared" );
    common_scripts\utility::flag_set( "outside_cleared" );
    thread maps\icbm_lighting::skip_to_sunrise2();
    wait 1;
    house2_to_griggs_handler();
}

house2_to_griggs_handler()
{
    maps\_utility::activate_trigger_with_targetname( "house2_door_nodes" );
    var_0 = getnode( "price_open_door02_node", "script_noteworthy" );
    var_1 = getent( "house02_front_door", "targetname" );
    var_2 = getent( "house02_front_door_model", "targetname" );
    var_2 linkto( var_1 );
    thread maps\icbm_code::price_gets_ready_to_open_door( var_0 );
    wait 3;
    level.price thread maps\_anim::anim_single_queue( level.price, "sunsup" );
    maps\_utility::trigger_wait( "price_open_house2_trigger", "targetname" ) maps\icbm_code::price_opens_door( var_0, var_1, "price_house2_door_anim_complete" );
    level.price maps\_utility::enable_ai_color();
    maps\_utility::activate_trigger_with_targetname( "house2_inside_nodes" );
    thread maps\_utility::do_in_order( maps\_utility::trigger_wait_targetname, "gaz_h2_floor_clear", maps\icbm_dialog::dialog_proceed_upstairs );
    thread maps\icbm_code::start_interogation();
    thread maps\_utility::do_in_order( common_scripts\utility::flag_wait, "player_shooting_interogators", common_scripts\utility::flag_set, "get_yer_ass" );
    var_3 = getentarray( "captured_griggs", "targetname" );
    common_scripts\utility::array_thread( var_3, maps\_utility::add_spawn_function, maps\icbm_code::captured_griggs_think );
    common_scripts\utility::array_thread( var_3, maps\_utility::spawn_ai );
    thread rescue_breach_setup();
    thread rescue_sequence();
    thread griggs_to_flyover_handler();
}

rescue_breach_setup()
{
    var_0 = getent( "trigger_volume_room01", "targetname" );
    var_0 common_scripts\utility::trigger_off();
    var_1 = getent( "start_breach", "targetname" );
    var_1 waittill( "trigger" );
    var_1 common_scripts\utility::trigger_off();
    var_2 = getent( "doorknob4", "targetname" );
    var_3 = getent( var_2.target, "targetname" );
    var_2 linkto( var_3 );
    var_4 = getent( "door_safehouse_livingroom_model", "targetname" );
    var_4 linkto( var_3 );
    var_5 = getent( "volume_room01", "targetname" );
    var_6 = [];
    var_6 = common_scripts\utility::add_to_array( var_6, level.price );
    var_6 = common_scripts\utility::add_to_array( var_6, level.gaz );
    var_7 = "explosive_breach_left";
    var_5 thread maps\_breach::breach_think( var_6, var_7 );
    var_5 waittill( "ready_to_breach" );
    maps\icbm_dialog::dialog_rescue_breach();
    common_scripts\utility::flag_wait( "get_yer_ass" );
    var_0 common_scripts\utility::trigger_on();
    var_5 waittill( "detpack_detonated" );
    common_scripts\utility::flag_set( "breach_started" );
    level.griggs thread fail_on_damage();
    level.gaz maps\_utility::enable_ai_color();
    level.price maps\_utility::enable_ai_color();
    maps\_utility::activate_trigger_with_targetname( "post_breach_nodes" );
    level.player playsound( "icbm_pri_gogogo" );
}

fail_on_damage()
{
    level endon( "griggs_loose" );

    for (;;)
    {
        self waittill( "damage", var_0, var_1, var_2, var_3, var_4 );

        if ( isplayer( var_1 ) )
            maps\_friendlyfire::missionfail();
    }
}

rescue_sequence()
{
    common_scripts\utility::flag_wait( "breach_started" );
    common_scripts\utility::flag_wait( "interogators_dead" );
    maps\_utility::autosave_by_name( "house02_clear" );
    thread maps\icbm_code::disable_friendly_deadlyness();
    thread maps\icbm_dialog::dialog_rescue();

    if ( getdvarint( "use_old_griggs_rescue" ) == 1 )
        maps\_utility::trigger_wait( "player_is_behind_griggs", "targetname" );
    else
        level.player thread disable_weapon_when_near_griggs();

    var_0 = getent( "grigs_use_trigger", "targetname" );
    var_0 thread player_cut_grigs_loose();
    common_scripts\utility::flag_wait( "griggs_loose" );
    common_scripts\utility::flag_wait( "griggs_is_good" );
    maps\icbm_code::all_friendlies_turn_blue();
    maps\_colors::assign_nodes_intelligently_for_team( "allies", 1 );
    maps\_utility::activate_trigger_with_targetname( "griggs_loose_nodes" );
    wait 0.5;
    level.griggs.interval = 100;
    level.griggs maps\_utility::disable_cqbwalk();
}

disable_weapon_when_near_griggs()
{
    var_0 = 0;

    while ( !common_scripts\utility::flag( "griggs_loose" ) )
    {
        if ( !var_0 && distancesquared( level.player.origin, level.griggs.origin ) < 15000 )
        {
            level.player disableweapons();
            var_0 = 1;
        }
        else if ( var_0 && distancesquared( level.player.origin, level.griggs.origin ) > 15000 )
        {
            level.player enableweapons();
            var_0 = 0;
        }

        waitframe();
    }

    level.player enableweapons();
}

allow_free_griggs_when_looking_in_position()
{
    var_0 = cos( 30 );

    for (;;)
    {
        waitframe();
        var_1 = common_scripts\utility::within_fov( level.player geteye(), level.player getplayerangles(), level.griggs.origin, var_0 );

        if ( ( var_1 || level.player islookingat( level.griggs ) ) && level.player istouching( self ) && !level.player isleaning() )
        {
            self sethintstring( &"ICBM_GRIGGSUSETRIGGER" );

            if ( level.player usebuttonpressed() )
            {
                self notify( "griggs_trigger_used" );
                break;
            }
        }
        else
            self sethintstring( " " );
    }
}

player_cut_grigs_loose()
{
    if ( getdvarint( "use_old_griggs_rescue" ) == 1 )
    {
        self usetriggerrequirelookat();
        self sethintstring( &"ICBM_GRIGGSUSETRIGGER" );
        self waittill( "trigger" );
    }
    else
    {
        common_scripts\utility::flag_wait( "price_ready_for_griggs_rescue" );
        thread allow_free_griggs_when_looking_in_position();
        self waittill( "griggs_trigger_used" );
    }

    common_scripts\utility::trigger_off();

    if ( getdvarint( "use_old_griggs_rescue" ) == 1 )
    {
        common_scripts\utility::flag_set( "griggs_loose" );
        level.griggs_node thread maps\_anim::anim_single_solo( level.griggs, "grigsby_rescue" );
    }
    else
    {
        thread h1_cutgriggsloose_dof();
        level.player allowlean( 0 );
        level.player allowcrouch( 0 );
        level.player allowprone( 0 );
        level.player_rescue_model = maps\_utility::spawn_anim_model( "player_rescue_griggs_model" );
        level.player_rescue_model.origin = level.griggs_node.origin;
        level.player_rescue_model.angles = level.griggs_node.angles;
        level.player_rescue_model hide();
        var_0 = spawn( "script_model", level.player_rescue_model gettagorigin( "tag_weapon" ) );
        var_0 setmodel( "wpn_h1_melee_combat_knife_vm" );
        var_0.angles = level.player_rescue_model gettagangles( "tag_weapon" );
        var_0 linkto( level.player_rescue_model, "tag_weapon" );
        level.griggs_node maps\_anim::anim_first_frame_solo( level.player_rescue_model, "grigsby_rescue_player" );
        level.player_rescue_model maps\_utility::lerp_player_view_to_tag( "tag_player", 0.5, 1, 0, 0, 0, 0 );
        level.player playerlinktodelta( level.player_rescue_model, "tag_player", 1, 0, 0, 0, 0, 1 );
        level.player_rescue_model show();
        level.griggs_node thread maps\_anim::anim_single_solo( level.player_rescue_model, "grigsby_rescue_player" );
        level.griggs_node notify( "stop_idle" );
        level.griggs_node thread maps\_anim::anim_single_solo( level.griggs, "grigsby_rescue" );
        level.griggs_node notify( "stop_price_idle" );
        level.griggs_node thread maps\_anim::anim_single_solo( level.price, "grigsby_rescue_price" );
        level.player_rescue_model waittillmatch( "single anim", "end" );
        var_0 delete();
        level.player_rescue_model delete();
        level.player allowlean( 1 );
        level.player allowcrouch( 1 );
        level.player allowprone( 1 );
        common_scripts\utility::flag_set( "griggs_loose" );
    }

    level.griggs waittillmatch( "single anim", "end" );
    waittillframeend;
    level.griggs stopanimscripted();
    level.griggs maps\_utility::flashbangstop();
    common_scripts\utility::flag_set( "griggs_is_good" );
}

h1_cutgriggsloose_dof()
{
    level.player setphysicaldepthoffield( 16, 28, 9.0, 9.0 );
    level.player enablephysicaldepthoffieldscripting();
    level.player setphysicaldepthoffield( 4.4, 15, 1.0, 1.0 );
    wait 1.35;
    level.player setphysicaldepthoffield( 4.4, 14, 3.0, 3.0 );
    wait 0.5;
    level.player setphysicaldepthoffield( 3.4, 28, 2.0, 2.0 );
    wait 1.0;
    level.player setphysicaldepthoffield( 16, 200, 2.0, 2.0 );
    wait 1.35;
    level.player disablephysicaldepthoffieldscripting();
}

rescued_start()
{
    soundscripts\_snd::snd_message( "start_rescued_checkpoint" );
    var_0 = getentarray( "rescue_start_spawners", "targetname" );
    common_scripts\utility::array_thread( var_0, maps\_utility::spawn_ai );
    var_1 = getent( "rescue_start", "targetname" );
    level.player setorigin( var_1.origin );
    level.player setplayerangles( var_1.angles );
    thread maps\icbm_lighting::skip_to_sunrise2();
    common_scripts\utility::flag_set( "first_obj" );
    common_scripts\utility::flag_set( "price_basement_door_anim_complete" );
    common_scripts\utility::flag_set( "soap_take_look" );
    common_scripts\utility::flag_set( "price_house2_door_anim_complete" );
    common_scripts\utility::flag_set( "griggs_loose" );
    common_scripts\utility::flag_set( "griggs_is_good" );
    common_scripts\utility::flag_set( "landed" );
    common_scripts\utility::flag_set( "house1_cleared" );
    common_scripts\utility::flag_set( "outside_cleared" );
    common_scripts\utility::flag_set( "headed_for_tower" );
    wait 1;
    maps\_utility::activate_trigger_with_targetname( "friendlies_at_tower" );
    thread griggs_to_flyover_handler();
}

griggs_to_flyover_handler()
{
    common_scripts\utility::flag_wait( "headed_for_tower" );
    maps\icbm_lighting::set_global_sunrise2();
    thread maps\icbm_dialog::dialog_blow_up_tower();
    common_scripts\utility::flag_wait( "player_in_chopper_area" );
    common_scripts\_exploder::exploder( 8 );
    var_0 = getentarray( "mi_17_01", "targetname" );
    common_scripts\utility::array_thread( var_0, maps\icbm_code::chopper_fail_mission );
    maps\_utility::activate_trigger_with_targetname( "choppers" );
    soundscripts\_snd::snd_message( "start_tower_first_choppers_fly_by" );
    maps\_utility::autosave_by_name( "chopper_flyover" );
    thread maps\icbm_code::first_chopper_fly_over();
    common_scripts\utility::flag_wait( "chopper_gone" );
    thread flyover_to_tower_handler();
}

tower_start()
{
    soundscripts\_snd::snd_message( "start_tower_checkpoint" );
    var_0 = getent( "tower_start", "targetname" );
    level.player setorigin( var_0.origin );
    level.player setplayerangles( var_0.angles );
    var_1 = getentarray( "tower_start_spawners", "targetname" );
    common_scripts\utility::array_thread( var_1, maps\_utility::spawn_ai );
    thread maps\icbm_lighting::skip_to_sunrise2();
    common_scripts\utility::flag_set( "first_obj" );
    common_scripts\utility::flag_set( "house1_cleared" );
    common_scripts\utility::flag_set( "price_basement_door_anim_complete" );
    common_scripts\utility::flag_set( "soap_take_look" );
    common_scripts\utility::flag_set( "price_house2_door_anim_complete" );
    common_scripts\utility::flag_set( "griggs_loose" );
    common_scripts\utility::flag_set( "griggs_is_good" );
    wait 1;
    maps\_utility::activate_trigger_with_targetname( "friendlies_at_tower" );
    thread flyover_to_tower_handler();
}

dialog_plant_at_tower()
{
    wait 5;
    level.price maps\_anim::anim_single_queue( level.price, "Charlie_status" );
    wait 0.2;
    level.price maps\_anim::anim_single_queue( level.price, "killthepower" );

    if ( !common_scripts\utility::flag( "c4_planted" ) )
        level.price maps\_anim::anim_single_queue( level.price, "jackgriggsplant" );
}

flyover_to_tower_handler()
{
    var_0 = getent( "tower_c4", "targetname" );
    var_1 = getent( "tower_c4_2", "targetname" );
    var_2 = getent( "tower", "targetname" );
    var_2.multiple_c4 = 1;
    var_3 = var_2 maps\_c4::c4_location( "tag_origin", ( -185.75, -178.0, 57.87 ), ( 288.0, 270.0, 0.0 ) );
    var_4 = var_2 maps\_c4::c4_location( "tag_origin", ( 184.3, -178.1, 57.9 ), ( 288.0, 270.0, 0.0 ) );
    objective_string( 3, &"ICBM_PLANT_C4_ON_TOWER_LEGS", 2 );
    objective_position( 3, var_0.origin );
    objective_additionalposition( 3, 1, var_1.origin );
    level thread maps\icbm_code::base_lights();
    level thread maps\icbm_code::base_fx_on();
    thread dialog_plant_at_tower();
    level waittill( "c4_in_place", var_5 );
    var_6 = 0;

    if ( var_4 == var_5 )
    {
        objective_additionalposition( 3, 0, ( 0.0, 0.0, 0.0 ) );
        var_6 = 1;
    }
    else
        objective_additionalposition( 3, 1, ( 0.0, 0.0, 0.0 ) );

    objective_string( 3, &"ICBM_PLANT_C4_ON_TOWER_LEGS", 1 );
    thread second_c4_plant_check();
    level waittill( "c4_in_place", var_5 );
    common_scripts\utility::flag_set( "c4_planted" );
    var_7 = getent( "obj_get_clear", "targetname" );
    objective_additionalposition( 3, var_6, var_7.origin );
    objective_string( 3, &"ICBM_GET_TO_A_SAFE_DISTANCE" );
    level thread c4_set();
    var_2 waittill( "c4_detonation" );
    common_scripts\utility::flag_set( "music_endon_tower_collapse" );
    common_scripts\utility::flag_set( "tower_destroyed" );
    var_2 playsound( "scn_icbm_tower_crash" );
    wait 2;
    common_scripts\utility::flag_set( "lights_off" );
    common_scripts\utility::flag_clear( "lights_on" );
}

second_c4_plant_check()
{
    var_0 = 1;
    var_1 = 0;

    for (;;)
    {
        if ( common_scripts\utility::flag( "c4_planted" ) )
            break;

        var_2 = level.player getcurrentprimaryweapon() != "c4";

        if ( var_0 != var_2 )
        {
            var_0 = var_2;
            level.player allowfire( var_0 );
        }

        if ( level.player attackbuttonpressed() && !var_0 && gettime() > var_1 )
        {
            thread maps\_utility::hint( &"ICBM_ONE_MORE_C4", 3 );
            var_1 = gettime() + 4000;
        }

        wait 0.05;
    }

    thread maps\_utility::hint_fade();
    level.player allowfire( 1 );
}

c4_set()
{
    maps\_utility::activate_trigger_with_targetname( "c4_planted" );
    level.griggs maps\_anim::anim_single_queue( level.griggs, "chargesset" );
    thread maps\icbm_dialog::dialog_jackson_do_it();
    common_scripts\utility::flag_wait( "tower_destroyed" );
    thread maps\icbm_code::tower_earthquakes();
    thread maps\icbm_code::tower_rumble();
    common_scripts\_exploder::exploder( 6 );
    wait 5;
    maps\_utility::activate_trigger_with_targetname( "move_to_watch" );
    wait 6;
    level.price maps\_anim::anim_single_queue( level.price, "charlie_towersdown" );
    thread play_power_alarm();
    wait 0.5;
    level.price maps\_anim::anim_single_queue( level.price, "breachingperimeter" );
    wait 0.5;
    level.griggs maps\_anim::anim_single_queue( level.griggs, "backuppower" );
    wait 0.4;
    level.price maps\_anim::anim_single_queue( level.price, "standby" );
    wait 1;
    level.griggs maps\_anim::anim_single_queue( level.griggs, "fiveseconds" );
    wait 0.5;
    level.price maps\_anim::anim_single_queue( level.price, "rallypoint" );
    maps\_utility::activate_trigger_with_targetname( "move_to_fence01" );
    level.price maps\_anim::anim_single_queue( level.price, "onourway" );
    common_scripts\utility::flag_set( "tower_blown" );
    maps\_utility::autosave_by_name( "tower_destroyed" );
    thread fense_to_base_handler();
    wait 0.5;
    common_scripts\utility::flag_set( "lights_on" );
    common_scripts\utility::flag_clear( "lights_off" );
}

play_power_alarm()
{
    var_0 = getentarray( "emt_alarm_power_on", "targetname" );
    common_scripts\utility::flag_wait( "lights_on" );

    foreach ( var_2 in var_0 )
        var_2 thread common_scripts\utility::play_loopsound_in_space( "h1_emt_alarm_power_on", var_2.origin );
}

fense_start()
{
    soundscripts\_snd::snd_message( "start_fense_checkpoint" );
    var_0 = getent( "fense_start", "targetname" );
    level.player setorigin( var_0.origin );
    level.player setplayerangles( var_0.angles );
    var_1 = getentarray( "fense_start_spawners", "targetname" );
    common_scripts\utility::array_thread( var_1, maps\_utility::spawn_ai );
    thread maps\icbm_lighting::skip_to_sunrise2();
    common_scripts\utility::flag_set( "first_obj" );
    common_scripts\utility::flag_set( "house1_cleared" );
    common_scripts\utility::flag_set( "price_basement_door_anim_complete" );
    common_scripts\utility::flag_set( "soap_take_look" );
    common_scripts\utility::flag_set( "price_house2_door_anim_complete" );
    common_scripts\utility::flag_set( "griggs_loose" );
    common_scripts\utility::flag_set( "griggs_is_good" );
    wait 1;
    maps\_utility::activate_trigger_with_targetname( "move_to_fence01" );
    thread fense_to_base_handler();
}

fense_to_base_heli_exploder()
{
    var_0 = getent( "move_to_oldbase01", "targetname" );
    var_0 waittill( "trigger" );
    common_scripts\_exploder::exploder( 7 );
}

fense_to_base_handler()
{
    thread maps\icbm_dialog::dialog_enemy_helicopters();
    thread fense_to_base_heli_exploder();
    thread time_to_split_up();
    var_0 = getent( "fence_cut", "targetname" );
    var_0 maps\_utility::assign_animtree( "fence" );
    thread maps\icbm_dialog::dialog_get_fence_open();
    level.fence_cut_node = getnode( "fence_cut_node", "targetname" );
    var_1 = [];
    var_1[var_1.size] = level.griggs;
    var_1[var_1.size] = level.gaz;
    thread griggs_reach_fence_spot_and_idle();
    thread gaz_reach_fence_spot_and_idle();
    level.griggs_at_fence = 0;
    level.gaz_at_fence = 0;

    while ( !level.griggs_at_fence || !level.gaz_at_fence )
        wait 0.05;

    level.fence_cut_node thread maps\_anim::anim_single_solo( var_0, "model_cut" );
    level.griggs maps\_utility::enable_ai_color();
    level.gaz maps\_utility::enable_ai_color();
    level.fence_cut_node maps\_anim::anim_single( var_1, "icbm_fence_cutting_guys" );
    var_2 = getent( "fence01_clip", "targetname" );
    var_2 connectpaths();
    var_2 delete();
    var_3 = getent( "fence01_weap_clip", "targetname" );
    var_3 delete();
    common_scripts\utility::flag_set( "cut_fence1" );
    maps\_utility::activate_trigger_with_targetname( "fence01_moveout" );
    level.price maps\_anim::anim_single_queue( level.price, "move" );
    thread base_handler();
}

griggs_reach_fence_spot_and_idle()
{
    level.fence_cut_node maps\_anim::anim_reach_and_arrive_facing_anim_solo( level.griggs, "icbm_fence_cutting_guys" );
    level.griggs maps\_utility::set_goal_pos( level.griggs.origin );
    level.griggs_at_fence = 1;
    var_0 = spawn( "script_origin", level.griggs.origin );
    var_0.angles = level.griggs.angles;
    var_0 maps\_anim::anim_generic_loop( level.griggs, "fence_stand_idle" );
}

gaz_reach_fence_spot_and_idle()
{
    level.fence_cut_node maps\_anim::anim_reach_and_arrive_facing_anim_solo( level.gaz, "icbm_fence_cutting_guys" );
    level.gaz_at_fence = 1;
    level.gaz maps\_utility::set_goal_pos( level.gaz.origin );
    var_0 = spawn( "script_origin", level.gaz.origin );
    var_0.angles = level.gaz.angles;
    var_0 maps\_anim::anim_generic_loop( level.gaz, "fence_stand_idle" );
}

time_to_split_up()
{
    maps\_utility::trigger_wait( "time_to_split_up", "targetname" );
    level.price maps\_utility::set_force_color( "p" );
    level.griggs maps\_utility::set_force_color( "p" );
    common_scripts\utility::flag_set( "music_endon_oldbase_entered" );
    musicstop( 10 );
    level.price maps\_anim::anim_single_queue( level.price, "scoutthrough" );
    level.price maps\_anim::anim_single_queue( level.price, "alternateroute" );
}

base_start()
{
    soundscripts\_snd::snd_message( "start_base_checkpoint" );
    thread maps\icbm_lighting::skip_to_sunrise3();
    var_0 = getent( "base_start", "targetname" );
    level.player setorigin( var_0.origin );
    level.player setplayerangles( var_0.angles );
    var_1 = getentarray( "base_start_spawners", "targetname" );
    common_scripts\utility::array_thread( var_1, maps\_utility::spawn_ai );
    common_scripts\utility::flag_set( "first_obj" );
    common_scripts\utility::flag_set( "price_basement_door_anim_complete" );
    common_scripts\utility::flag_set( "soap_take_look" );
    common_scripts\utility::flag_set( "price_house2_door_anim_complete" );
    common_scripts\utility::flag_set( "griggs_loose" );
    common_scripts\utility::flag_set( "griggs_is_good" );
    common_scripts\utility::flag_set( "tower_blown" );
    thread base_handler();
}

base2_start()
{
    soundscripts\_snd::snd_message( "start_base2_checkpoint" );
    thread maps\icbm_lighting::skip_to_sunrise3();
    var_0 = getent( "base2_start", "targetname" );
    level.player setorigin( var_0.origin );
    level.player setplayerangles( var_0.angles );
    var_1 = getentarray( "base2_start_spawners", "targetname" );
    common_scripts\utility::array_thread( var_1, maps\_utility::spawn_ai );
    common_scripts\utility::flag_set( "first_obj" );
    common_scripts\utility::flag_set( "price_basement_door_anim_complete" );
    common_scripts\utility::flag_set( "soap_take_look" );
    common_scripts\utility::flag_set( "price_house2_door_anim_complete" );
    common_scripts\utility::flag_set( "griggs_loose" );
    common_scripts\utility::flag_set( "griggs_is_good" );
    common_scripts\utility::flag_set( "tower_blown" );
    thread base_handler();
    wait 0.1;
    maps\_utility::activate_trigger_with_targetname( "fence02_moveout" );
}

base_handler()
{
    maps\_utility::battlechatter_on( "allies" );
    maps\_utility::battlechatter_on( "axis" );
    level.first_fight_counter = 0;
    level.third_fight_counter = 0;
    common_scripts\utility::flag_set( "aa_base_fight" );
    maps\_utility::trigger_wait( "fence02_moveout", "targetname" );
    thread maps\icbm_dialog::dialog_rpgs_on_rooftops();
    thread maps\icbm_dialog::dialog_rpgs_on_rooftops2();
    thread maps\icbm_dialog::dialog_choppers_dropping();
    thread maps\icbm_dialog::dialog_first_fight_clear_and_move();
    thread maps\icbm_dialog::dialog_second_fight_clear_and_move();
    thread trucks_incoming();
    soundscripts\_snd::snd_message( "start_base_choppers_heli_drop" );
    maps\_utility::trigger_wait( "fastrope_spawn2", "targetname" );
    common_scripts\utility::flag_set( "second_fight_started" );
    maps\_utility::trigger_wait( "second_fight_friendly_nodes", "targetname" );
    common_scripts\utility::flag_set( "third_fight_started" );
    common_scripts\utility::flag_wait( "price_and_griggs_return" );
    var_0 = getent( "price_returns", "targetname" );
    level.price teleport( var_0.origin, var_0.angles );
    var_1 = getent( "griggs_returns", "targetname" );
    level.griggs teleport( var_1.origin, var_1.angles );
    level.price maps\_utility::set_force_color( "b" );
    level.griggs maps\_utility::set_force_color( "b" );
    thread base_to_second_squad_handler();
}

first_fight_counter()
{
    self waittill( "death" );
    level.first_fight_counter++;

    if ( level.first_fight_counter == 6 )
    {
        var_0 = getent( "roortop_guys_spawner", "targetname" );
        var_0 notify( "trigger" );
        var_0 common_scripts\utility::trigger_off();
    }

    if ( level.first_fight_counter == 10 )
    {
        var_0 = getent( "fastrope_spawn", "targetname" );
        var_0 notify( "trigger" );
        var_0 common_scripts\utility::trigger_off();
    }

    if ( level.first_fight_counter == 15 )
    {
        var_0 = getent( "first_first_end_spawner", "targetname" );
        var_0 notify( "trigger" );
        var_0 common_scripts\utility::trigger_off();
    }
}

third_fight_counter()
{
    self waittill( "death" );
    level.third_fight_counter++;

    if ( level.third_fight_counter == 10 )
    {
        var_0 = getent( "dog_spawner", "targetname" );
        var_0 notify( "trigger" );
        var_0 common_scripts\utility::trigger_off();
    }

    if ( level.third_fight_counter == 12 )
    {
        var_0 = getent( "second_fight_end_group", "targetname" );
        var_0 notify( "trigger" );
        var_0 common_scripts\utility::trigger_off();
    }
}

trucks_incoming()
{
    maps\_utility::trigger_wait( "incoming_oldbase", "targetname" );
    soundscripts\_snd::snd_message( "aud_start_bm21_scripted_sfx" );
    maps\_utility::autosave_by_name( "trucks_incoming" );
    level.player playsound( "icbm_gm5_3trucks" );
}

base_to_second_squad_handler()
{
    common_scripts\utility::flag_wait( "play_leaving_base" );
    maps\_utility::battlechatter_off( "allies" );
    common_scripts\utility::flag_clear( "aa_base_fight" );
    maps\_utility::autosave_by_name( "leave_base" );
    maps\icbm_code::make_friendies_not_cqb();
    var_0 = getent( "emt_alarm_missile_launch", "targetname" );
    var_0 thread common_scripts\utility::play_sound_in_space( "emt_alarm_missile_launch", var_0.origin );
    common_scripts\utility::flag_wait( "on_road" );
    maps\icbm_code::kill_enemies();
    thread meet_second_squad_handler();
}

launch_start()
{
    soundscripts\_snd::snd_message( "start_launch_checkpoint" );
    thread maps\icbm_lighting::skip_to_sunrise3();
    var_0 = getent( "launch_start", "targetname" );
    level.player setorigin( var_0.origin );
    level.player setplayerangles( var_0.angles );
    var_1 = getentarray( "launch_start_spawners", "targetname" );
    common_scripts\utility::array_thread( var_1, maps\_utility::spawn_ai );
    common_scripts\utility::flag_set( "first_obj" );
    common_scripts\utility::flag_set( "price_basement_door_anim_complete" );
    common_scripts\utility::flag_set( "soap_take_look" );
    common_scripts\utility::flag_set( "price_house2_door_anim_complete" );
    common_scripts\utility::flag_set( "griggs_loose" );
    common_scripts\utility::flag_set( "griggs_is_good" );
    common_scripts\utility::flag_set( "tower_blown" );
    common_scripts\utility::flag_set( "lift_off" );
    wait 1;
    thread meet_second_squad_handler();
}

meet_second_squad_handler()
{
    var_0 = getnode( "end_scene_node", "targetname" );
    maps\_utility::activate_trigger_with_targetname( "base_clear_moveout" );

    if ( getdvarint( "use_old_endrun" ) == 1 )
        var_0 thread maps\icbm_code::anim_reach_and_approach_solo_set_flag( level.price, "icbm_end_price", "price_reached_end_anim" );
    else
    {
        var_0 thread maps\icbm_code::anim_reach_solo_set_flag( level.price, "icbm_end_price_idle", "price_reached_end_anim" );
        thread final_anim_price_idle( var_0 );
    }

    level thread missile_launch();
    level.currentcolorforced["allies"]["r"] = undefined;
    var_1 = getentarray( "second_squad_spawner", "targetname" );
    common_scripts\utility::array_thread( var_1, maps\_utility::add_spawn_function, maps\_utility::magic_bullet_shield );
    common_scripts\utility::array_thread( var_1, maps\_utility::spawn_ai );
    maps\_utility::trigger_wait( "buddies_at_launch", "targetname" );
    common_scripts\utility::flag_wait( "lift_off" );
    musicstop( 0.5 );
    thread dialog_treeline_hold_fire();
    wait 1;
    maps\_utility::musicplaywrapper( "icbm_launch_music" );
    maps\_utility::activate_trigger_with_targetname( "second_squad_trigger" );

    if ( getdvarint( "use_old_endrun" ) == 1 )
        var_0 thread maps\icbm_code::anim_reach_and_approach_solo_set_flag( level.gm5, "icbm_end_sniper", "gm5_reached_end_anim" );
    else
        var_0 thread maps\icbm_code::anim_reach_solo_set_flag( level.gm5, "icbm_end_sniper", "gm5_reached_end_anim" );

    common_scripts\utility::flag_wait( "dialog_holdfire_done" );
    common_scripts\utility::flag_wait( "gm5_reached_end_anim" );
    common_scripts\utility::flag_wait( "price_reached_end_anim" );
    thread final_anim_then_run_off( var_0 );
    common_scripts\utility::flag_set( "start_launch_scene" );

    if ( getdvarint( "use_old_endrun" ) == 1 )
        level.gm5 maps\_anim::anim_single_queue( level.gm5, "goodtosee" );

    level.price maps\_utility::enable_ai_color();
    level.gm5 maps\_utility::enable_ai_color();
    maps\_utility::activate_trigger_with_targetname( "turn_us_around" );
}

final_anim_then_run_off( var_0 )
{
    if ( getdvarint( "use_old_endrun" ) == 1 )
        var_0 thread maps\_anim::anim_custom_animmode_solo( level.gm5, "gravity", "icbm_end_sniper" );
    else
    {
        wait 0.8;
        var_0 thread maps\_anim::anim_single_solo( level.gm5, "icbm_end_sniper" );
    }

    if ( getdvarint( "use_old_endrun" ) != 1 )
        var_0 notify( "stop_price_idle" );

    if ( getdvarint( "use_old_endrun" ) == 1 )
        var_0 maps\_anim::anim_custom_animmode_solo( level.price, "gravity", "icbm_end_price" );
    else
        var_0 maps\_anim::anim_single_solo( level.price, "icbm_end_price" );

    maps\_utility::activate_trigger_with_targetname( "run_to_gate_uk" );
    maps\_utility::activate_trigger_with_targetname( "run_to_gate_us" );
    common_scripts\utility::flag_set( "run_to_gate" );
}

final_anim_price_idle( var_0 )
{
    common_scripts\utility::flag_wait( "price_reached_end_anim" );

    if ( !common_scripts\utility::flag( "gm5_reached_end_anim" ) )
        var_0 thread maps\_anim::anim_loop_solo( level.price, "icbm_end_price_idle", undefined, "stop_price_idle" );
}

dialog_treeline_hold_fire()
{
    level.gm5 maps\_anim::anim_single_queue( level.gm5, "treeline" );
    wait 1;
    common_scripts\utility::flag_set( "objective_regroup_complete" );
    level.price maps\_anim::anim_single_queue( level.price, "americanteams" );
    common_scripts\utility::flag_set( "dialog_holdfire_done" );
}

missile_sounds()
{
    level.player playsound( "scn_icbm_missile_launch" );
    wait 4;
    var_0 = getent( "icbm_missile02", "targetname" );
    var_0 thread common_scripts\utility::play_loop_sound_on_entity( "scn_icbm_missile1_loop" );
    wait 10;
    var_1 = getent( "icbm_missile01", "targetname" );
    var_1 thread common_scripts\utility::play_loop_sound_on_entity( "scn_icbm_missile2_loop" );
}

missile_rumble()
{
    var_0 = [];
    var_0 = maps\_utility::rumble_sequence_add_key( var_0, 3.5, "generic_attack_heavy_2000" );
    var_0 = maps\_utility::rumble_sequence_add_key( var_0, 12.2, "generic_attack_heavy_2000" );
    level.player thread maps\_utility::rumble_sequence_play( var_0, 0 );
    wait 2.1;
    level.player playrumblelooponentity( "generic_ambient_loop" );
    wait 15.7;
    level.player stoprumble( "generic_ambient_loop" );
}

missile_launch()
{
    common_scripts\utility::flag_wait( "start_launch_scene" );
    soundscripts\_snd::snd_message( "start_missile_launch_mix" );
    thread missile_sounds();
    thread missile_rumble();
    wait 2;
    common_scripts\utility::flag_set( "launch_02" );
    thread maps\icbm_lighting::launchvision();
    wait 4;
    level.griggs maps\_anim::anim_single_queue( level.griggs, "problemhere" );
    common_scripts\utility::flag_set( "launch_01" );

    if ( getdvarint( "use_old_endrun" ) == 1 )
        level.price maps\_anim::anim_single_queue( level.price, "onemissile" );
    else
    {
        level.price waittillmatch( "single anim", "dialog" );
        wait 3;
    }

    wait 1;
    level.griggs maps\_anim::anim_single_queue( level.griggs, "anotherone" );
    wait 1;
    level.price maps\_anim::anim_single_queue( level.price, "twomissiles" );
    wait 0.5;
    level thread run_to_gate();
    level.price.disablefacialfilleranims = 1;
    level.price maps\_anim::anim_single_queue( level.price, "gettingabortcodes" );
    level.price.disablefacialfilleranims = 0;
    level.price maps\_anim::anim_single_queue( level.price, "rogerthat" );
}

run_to_gate()
{
    wait 3;
    wait 4;
    common_scripts\utility::flag_set( "lift_off_scene_done" );
    wait 5;
    level.griggs maps\_anim::anim_single_queue( level.griggs, "itsonnow" );
    wait 1;
    common_scripts\utility::flag_set( "level_done" );
    wait 1;
    wait 0.5;
    maps\_loadout_code::saveplayerweaponstatepersistent( "icbm" );
    maps\_utility::nextmission();
}
