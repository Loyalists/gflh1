// H1 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

dead_script()
{
    common_scripts\_ca_blockout::init();
    maps\scoutsniper_precache::main();
    maps\createart\scoutsniper_art::main();
    maps\scoutsniper_fx::main();
    maps\_load::main();
    maps\scoutsniper_anim::main();
    thread maps\scoutsniper_amb::main();
    common_scripts\utility::flag_init( "intro" );
    maps\scoutsniper_lighting::main();
}

main()
{
    precacheshellshock( "scoutsniper_church_explo" );
    setsaveddvar( "r_lodFOVScaleOverride", 1 );
    setsaveddvar( "r_lodFOVScaleOverrideAmount", 0.75 );
    setsaveddvar( "r_lodFOVScaleOverrideStopMaxAngle", 5 );
    setsaveddvar( "r_lodFOVScaleOverrideStopMinAngle", 0.0 );

    if ( getdvar( "beautiful_corner" ) == "1" )
    {
        dead_script();
        return;
    }

    common_scripts\utility::flag_init( "initial_setup_done" );
    common_scripts\utility::flag_init( "intro" );
    common_scripts\utility::flag_init( "intro_patrol_guy_down" );
    common_scripts\utility::flag_init( "intro_patrol_guys_dead" );
    common_scripts\utility::flag_init( "intro_last_patrol_dead" );
    common_scripts\utility::flag_init( "intro_leave_area" );
    common_scripts\utility::flag_init( "intro_safezone" );
    common_scripts\utility::flag_init( "intro_left_area" );
    common_scripts\utility::flag_init( "church_dialogue_done" );
    common_scripts\utility::flag_init( "church_patroller_dead" );
    common_scripts\utility::flag_init( "church_patroller_faraway" );
    common_scripts\utility::flag_init( "church_lookout_dead" );
    common_scripts\utility::flag_init( "church_area_clear" );
    common_scripts\utility::flag_init( "church_guess_he_cant_see" );
    common_scripts\utility::flag_init( "church_run_for_it" );
    common_scripts\utility::flag_init( "church_door_open" );
    common_scripts\utility::flag_init( "church_and_intro_killed" );
    common_scripts\utility::flag_init( "church_ladder_slide" );
    common_scripts\utility::flag_init( "church_sneakup_dialogue_help" );
    common_scripts\utility::flag_init( "church_start_patroller_line" );
    common_scripts\utility::flag_init( "church_run_for_it_commit" );
    common_scripts\utility::flag_init( "graveyard" );
    common_scripts\utility::flag_init( "graveyard_moveup" );
    common_scripts\utility::flag_init( "graveyard_church_ladder" );
    common_scripts\utility::flag_init( "graveyard_hind_ready" );
    common_scripts\utility::flag_init( "graveyard_price_entered" );
    common_scripts\utility::flag_init( "graveyard_price_at_wall" );
    common_scripts\utility::flag_init( "graveyard_hear_that" );
    common_scripts\utility::flag_init( "graveyard_get_down" );
    common_scripts\utility::flag_init( "graveyard_hind_gone" );
    common_scripts\utility::flag_init( "graveyard_hind_down" );
    common_scripts\utility::flag_init( "graveyard_hind_flare" );
    common_scripts\utility::flag_init( "graveyard_church_breakable" );
    common_scripts\utility::flag_init( "field" );
    common_scripts\utility::flag_init( "price_reach_field" );
    common_scripts\utility::flag_init( "field_getdown" );
    common_scripts\utility::flag_init( "field_start" );
    common_scripts\utility::flag_init( "field_price_done" );
    common_scripts\utility::flag_init( "field_price_prone_first_stop" );
    common_scripts\utility::flag_init( "field_start_running" );
    common_scripts\utility::flag_init( "field_stop_bmps" );
    common_scripts\utility::flag_init( "pond_enemies_dead" );
    common_scripts\utility::flag_init( "pond_patrol_spawned" );
    common_scripts\utility::flag_init( "pond_thrower_spawned" );
    common_scripts\utility::flag_init( "pond_backup_spawned" );
    common_scripts\utility::flag_init( "pond_patrol_dead" );
    common_scripts\utility::flag_init( "pond_thrower_dead" );
    common_scripts\utility::flag_init( "pond_thrower_kill" );
    common_scripts\utility::flag_init( "cargo_enemy_ready_to_defend1" );
    common_scripts\utility::flag_init( "cargo_enemy_defend_moment_past" );
    common_scripts\utility::flag_init( "cargo_started_defend_moment" );
    common_scripts\utility::flag_init( "cargo_patrol_defend1_dead" );
    common_scripts\utility::flag_init( "cargo_defender1_away" );
    common_scripts\utility::flag_init( "cargo_patrol_away" );
    common_scripts\utility::flag_init( "cargo_patrol_danger" );
    common_scripts\utility::flag_init( "cargo_patrol_dead" );
    common_scripts\utility::flag_init( "cargo_enemies_dead" );
    common_scripts\utility::flag_init( "cargo_price_ready_to_kill_patroller" );
    common_scripts\utility::flag_init( "cargo_price_ready_to_attack1" );
    common_scripts\utility::flag_init( "cargo_smokers_spawned" );
    common_scripts\utility::flag_init( "dash" );
    common_scripts\utility::flag_init( "dash_spawn" );
    common_scripts\utility::flag_init( "dash_start" );
    common_scripts\utility::flag_init( "dash_last" );
    common_scripts\utility::flag_init( "dash_hind_down" );
    common_scripts\utility::flag_init( "dash_guard_check1" );
    common_scripts\utility::flag_init( "dash_guard_check2" );
    common_scripts\utility::flag_init( "dash_guard_check3" );
    common_scripts\utility::flag_init( "dash_sniper" );
    common_scripts\utility::flag_init( "dash_sniper_dead" );
    common_scripts\utility::flag_init( "dash_stealth_unsure" );
    common_scripts\utility::flag_init( "dash_door_R_open" );
    common_scripts\utility::flag_init( "dash_door_L_open" );
    common_scripts\utility::flag_init( "dash_heli_agro" );
    common_scripts\utility::flag_init( "dash_hind_deleted" );
    common_scripts\utility::flag_init( "dash_crawl_patrol_spawned" );
    common_scripts\utility::flag_init( "dash_reset_stealth_to_default" );
    common_scripts\utility::flag_init( "dash_work_as_team" );
    common_scripts\utility::flag_init( "dash_killed_by_price" );
    common_scripts\utility::flag_init( "heli_gun" );
    common_scripts\utility::flag_init( "heli_rocket" );
    common_scripts\utility::flag_init( "hind_spotted" );
    common_scripts\utility::flag_init( "town" );
    common_scripts\utility::flag_init( "dogs" );
    common_scripts\utility::flag_init( "dogs_dog_dead" );
    common_scripts\utility::flag_init( "dogs_backup" );
    common_scripts\utility::flag_init( "dogs_delete_dogs" );
    common_scripts\utility::flag_init( "center" );
    common_scripts\utility::flag_init( "end" );
    common_scripts\utility::flag_init( "end_start_music" );
    setsaveddvar( "compassmaxrange", 8000 );
    common_scripts\utility::flag_init( "prone_hint" );
    common_scripts\utility::flag_init( "broke_stealth" );
    level.hearing_distance = 512;
    level.macmillan_exposed_cqb_radius = 8;
    maps\_utility::default_start( ::start_intro );
    maps\_utility::add_start( "church", ::start_church, &"STARTS_CHURCH" );
    maps\_utility::add_start( "church_x", ::start_church_x, &"STARTS_CHURCHX" );
    maps\_utility::add_start( "graveyard", ::start_graveyard, &"STARTS_GRAVEYARD" );
    maps\_utility::add_start( "graveyard_x", ::start_graveyard_x, &"STARTS_GRAVEYARDX" );
    maps\_utility::add_start( "field", ::start_field, &"STARTS_FIELD" );
    maps\_utility::add_start( "pond", ::start_pond, &"STARTS_POND" );
    maps\_utility::add_start( "cargo", ::start_cargo, &"STARTS_CARGO" );
    maps\_utility::add_start( "dash", ::start_dash, &"STARTS_DASH" );
    maps\_utility::add_start( "town", ::start_town, &"STARTS_TOWN" );
    maps\_utility::add_start( "dogs", ::start_dogs, &"STARTS_DOGS" );
    maps\_utility::add_start( "center", ::start_center, &"STARTS_CENTER" );
    maps\_utility::add_start( "end", ::start_end, &"STARTS_END" );
    setsaveddvar( "ai_friendlyFireBlockDuration", 0 );
    maps\createart\scoutsniper_art::main();
    maps\_drone_ai::init();
    maps\_drone_civilian::init();
    maps\scoutsniper_precache::main();
    level.weaponclipmodels = [];
    level.weaponclipmodels[0] = "weapon_m14_clip";
    level.weaponclipmodels[1] = "weapon_ak47_clip";
    level.weaponclipmodels[2] = "weapon_g36_clip";
    level.weaponclipmodels[3] = "weapon_dragunov_clip";
    level.weaponclipmodels[4] = "weapon_g3_clip";
    maps\scoutsniper_fx::main();
    thread common_scripts\_pipes::main();
    thread maps\_leak::main();
    maps\_load::main();
    maps\scoutsniper_anim::main();
    maps\scoutsniper_lighting::main();
    maps\scoutsniper_aud::main();
    maps\_stealth_logic::stealth_init();
    maps\_stealth_behavior::main();
    maps\_load::set_player_viewhand_model( "h2_gfl_m4a1_worldhands" );
    animscripts\dog\dog_init::initdoganimations();
    maps\_stinger::init();
    maps\_compass::setupminimap( "compass_map_scoutsniper" );
    thread maps\scoutsniper_amb::main();
    maps\_wibble::set_cloth_wibble( 0.0 );
    thread maps\_wibble::setup_wibble_helis( 1, "graveyard_hind_ready" );
    waittillframeend;
    level.price thread maps\_props::ghillie_leaves();
    thread objective_main();
    thread level_complete();

    switch ( level.start_point )
    {
        case "default":
            thread intro_main();
        case "church":
        case "church_x":
            church_main();
        case "graveyard":
        case "graveyard_x":
            graveyard_main();
        case "field":
            thread field_main();
        case "pond":
            thread pond_main();
        case "cargo":
            thread cargo_main();
        case "dash":
            dash_main();
        case "town":
            thread town_main();
        case "dogs":
            thread dogs_main();
        case "center":
            center_main();
        case "end":
            end_main();
    }
}

intro_main()
{
    if ( !isalive( level.price ) )
        return;

    level.price endon( "death" );
    common_scripts\utility::flag_wait( "initial_setup_done" );
    level.player disableweapons();
    var_0 = getent( "price_start_node", "targetname" );
    var_0 thread maps\_anim::anim_first_frame_solo( level.price, "scoutsniper_opening_price" );
    wait 4;
    common_scripts\utility::flag_set( "intro" );
    maps\_utility::delaythread( 12.5, ::giveweapons );
    maps\_utility::delaythread( 1, maps\scoutsniper_code::scoutsniper_music_loop, "scoutsniper_pripyat_music", 143, "field_clean_ai" );
    common_scripts\utility::array_thread( getentarray( "patrollers", "script_noteworthy" ), maps\_utility::add_spawn_function, maps\_stealth_logic::stealth_ai );
    common_scripts\utility::array_thread( getentarray( "patrollers", "script_noteworthy" ), maps\_utility::add_spawn_function, maps\scoutsniper_code::mission_dialogue_kill );
    common_scripts\utility::array_thread( getentarray( "patrollers", "script_noteworthy" ), maps\_utility::add_spawn_function, maps\_patrol::enable_patrol_turn );
    common_scripts\utility::array_thread5( getentarray( "patrollers", "script_noteworthy" ), maps\_utility::add_spawn_function, maps\_stealth_behavior::ai_create_behavior_function, "alert", "attack", maps\scoutsniper_code::intro_attack_logic );
    common_scripts\utility::array_thread( getentarray( "tableguards", "script_noteworthy" ), maps\_utility::add_spawn_function, maps\_stealth_logic::stealth_ai );
    common_scripts\utility::array_thread( getentarray( "tableguards", "script_noteworthy" ), maps\_utility::add_spawn_function, maps\scoutsniper_code::idle_anim_think );
    common_scripts\utility::array_thread( getentarray( "tableguards", "script_noteworthy" ), maps\_utility::add_spawn_function, maps\scoutsniper_code::mission_dialogue_kill );
    common_scripts\utility::array_thread( getentarray( "tableguards", "script_noteworthy" ), maps\_utility::add_spawn_function, maps\_patrol::enable_patrol_turn );
    common_scripts\utility::array_thread5( getentarray( "tableguards", "script_noteworthy" ), maps\_utility::add_spawn_function, maps\_stealth_behavior::ai_create_behavior_function, "alert", "attack", maps\scoutsniper_code::intro_attack_logic );
    common_scripts\utility::array_thread( getentarray( "tableguard_last_patrol", "targetname" ), maps\_utility::add_spawn_function, ::intro_lastguy_think );
    thread intro_handle_leave_area_flag();
    thread intro_handle_safezone_flag();
    thread intro_handle_last_patrol_clip();
    thread intro_handle_leave_area_clip();
    thread intro_handle_spotted_dialogue();
    thread intro_to_church_spotted();
    maps\_utility::delaythread( 1, maps\_stealth_behavior::default_event_awareness, maps\scoutsniper_code::default_event_awareness_dialogue );
    maps\_utility::delaythread( randomfloatrange( 3, 7 ), maps\scoutsniper_code::scripted_array_spawn, "patrollers", "script_noteworthy", 1 );
    maps\_utility::delaythread( 1, maps\scoutsniper_code::scripted_array_spawn, "tableguards", "script_noteworthy", 1 );
    maps\_utility::delaythread( 1, maps\scoutsniper_code::scripted_array_spawn, "intro_dogs", "script_noteworthy", 1 );
    wait 13.5;

    if ( getdvarint( "use_old_scoutsniper_intro" ) == 1 )
    {
        level thread maps\_utility::function_stack( maps\_utility::radio_dialogue, "scoutsniper_mcm_radiation" );
        level maps\_utility::delaythread( 5, maps\_utility::function_stack, maps\_utility::radio_dialogue, "scoutsniper_mcm_followme" );
    }

    wait 1;
    maps\scoutsniper_code::try_save( "intro" );
    level.price.keepnodeduringscriptedanim = 1;
    thread intro_sneakup_patrollers_death();
    level.price intro_runup( var_0 );
    level.price notify( "stop_dynamic_run_speed" );
    level.price intro_holdup();
    maps\scoutsniper_code::try_save( "intro_shack" );
    level.price.crouchtransitionoverridewait = 1.5;
    level.price intro_cqb_into_shack();
    level.price maps\_utility::ent_flag_set( "_stealth_stance_handler" );
    level.price intro_sneakup_patrollers();
    level.price maps\_utility::ent_flag_clear( "_stealth_stance_handler" );
    level.price allowedstances( "prone", "crouch", "stand" );
    level.price.crouchtransitionoverridewait = undefined;
    maps\scoutsniper_code::try_save( "intro_patrollers_killed" );
    level.price notify( "stop_path" );
    level.price maps\_utility::disable_cqbwalk();
    level.price pushplayer( 0 );
    thread maps\scoutsniper_code::intro_tableguys_event_awareness();
    level.price intro_sneakup_tableguys();
    level.price thread maps\scoutsniper_code::price_custom_detection( 120, undefined, 1 );
    level.price intro_avoid_tableguys();
    level.price allowedstances( "stand", "crouch", "prone" );
    level.price intro_leave_area();
    maps\scoutsniper_code::try_save( "intro_last_patroller_killed" );
    level.price thread intro_cleanup();
}

intro_handle_spotted_dialogue()
{
    level endon( "intro_left_area" );
    common_scripts\utility::flag_wait( "_stealth_spotted" );
    wait 2;
    level maps\_utility::function_stack( maps\_utility::radio_dialogue, "scoutsniper_mcm_dogsingrass" );
}

intro_handle_leave_area_clip()
{
    var_0 = getent( "intro_leave_area_clip", "targetname" );
    var_0 thread intro_handle_leave_area_clip_spotted();
    var_0 endon( "death" );
    level endon( "_stealth_spotted" );
    level endon( "church_intro" );

    for (;;)
    {
        common_scripts\utility::flag_waitopen( "intro_safezone" );
        var_0 maps\_utility::geo_off();
        common_scripts\utility::flag_wait( "intro_safezone" );
        var_0 maps\_utility::geo_on();
    }
}

intro_handle_leave_area_clip_spotted()
{
    common_scripts\utility::flag_wait_either( "_stealth_spotted", "church_intro" );
    self delete();
}

intro_handle_last_patrol_clip()
{
    var_0 = getent( "intro_last_patrol_clip", "targetname" );
    var_0 connectpaths();
    var_0 maps\_utility::geo_off();
    level endon( "_stealth_spotted" );
    common_scripts\utility::flag_wait( "intro_patrol_guys_dead" );
    var_0 thread intro_handle_last_patrol_clip_spotted();
    var_0 maps\_utility::geo_on();
    var_0 disconnectpaths();
}

intro_handle_last_patrol_clip_spotted()
{
    common_scripts\utility::flag_wait( "_stealth_spotted" );
    self connectpaths();
    self delete();
}

intro_handle_leave_area_flag()
{
    level endon( "_stealth_spotted" );
    level endon( "intro_last_patrol_dead" );
    level endon( "intro_left_area" );
    var_0 = getent( "intro_leave_area", "script_noteworthy" );
    var_0 common_scripts\utility::trigger_off();
    common_scripts\utility::flag_wait( "intro_last_patrol" );
    level.intro_last_patrol waittill( "goal" );
    var_0 common_scripts\utility::trigger_on();

    for (;;)
    {
        var_0 waittill( "trigger", var_1 );

        if ( var_1 == level.intro_last_patrol )
            break;
    }

    common_scripts\utility::flag_set( "intro_leave_area" );
}

intro_handle_safezone_flag()
{
    level endon( "_stealth_spotted" );
    level endon( "church_intro" );
    var_0 = getent( "intro_leave_area_safe_zone", "targetname" );

    for (;;)
    {
        var_1 = 1;
        var_2 = getaiarray( "axis" );

        for ( var_3 = 0; var_3 < var_2.size; var_3++ )
        {
            if ( !var_2[var_3] istouching( var_0 ) )
                continue;

            var_1 = 0;
            break;
        }

        if ( var_1 )
        {
            if ( !common_scripts\utility::flag( "intro_safezone" ) )
                common_scripts\utility::flag_set( "intro_safezone" );
        }
        else if ( common_scripts\utility::flag( "intro_safezone" ) )
            common_scripts\utility::flag_clear( "intro_safezone" );

        wait 0.1;
    }
}

intro_runup( var_0 )
{
    if ( common_scripts\utility::flag( "_stealth_spotted" ) )
        return;

    level endon( "_stealth_spotted" );
    self allowedstances( "stand" );
    var_0 thread maps\_anim::anim_single_solo( self, "scoutsniper_opening_price" );
    var_1 = getent( "price_intro_path", "targetname" );
    var_2 = getanimlength( maps\_utility::getanim( "scoutsniper_opening_price" ) );
    wait(var_2 - 0.2);
    self stopanimscripted();
    level maps\_utility::delaythread( 2, maps\_utility::function_stack, maps\_utility::radio_dialogue, "scoutsniper_mcm_deadman" );
    maps\_utility::delaythread( 0.1, maps\scoutsniper_code::dynamic_run_speed );
    maps\scoutsniper_code::scoutsniper_follow_path( var_1 );
}

intro_holdup()
{
    if ( common_scripts\utility::flag( "_stealth_spotted" ) )
        return;

    level endon( "_stealth_spotted" );

    if ( common_scripts\utility::flag( "intro_patrol_guys_dead" ) )
        return;

    level endon( "intro_patrol_guys_dead" );
    var_0 = getnode( "price_intro_holdup", "targetname" );
    var_0 maps\_anim::anim_generic_reach_and_arrive( self, "stop2_exposed" );
    level thread maps\_utility::function_stack( maps\_utility::radio_dialogue, "scoutsniper_mcm_standby" );
    var_0 thread maps\_anim::anim_generic( self, "stop2_exposed" );
    var_0 waittill( "stop2_exposed" );
    self.a.movement = "stop";
}

intro_cqb_into_shack()
{
    if ( common_scripts\utility::flag( "_stealth_spotted" ) )
        return;

    level endon( "_stealth_spotted" );

    if ( common_scripts\utility::flag( "intro_patrol_guys_dead" ) )
        return;

    level endon( "intro_patrol_guys_dead" );
    self pushplayer( 1 );
    maps\_utility::enable_cqbwalk();
    var_0 = getnode( "price_intro_holdup2", "targetname" );
    self setgoalnode( var_0 );
    self.goalradius = level.macmillan_exposed_cqb_radius;
    self waittill( "goal" );
    level thread maps\_utility::function_stack( maps\_utility::radio_dialogue, "scoutsniper_mcm_deadahead" );
    var_0 thread maps\_anim::anim_generic( self, "enemy_exposed" );
    var_0 waittill( "enemy_exposed" );
    level thread maps\_utility::function_stack( maps\_utility::radio_dialogue, "scoutsniper_mcm_staylow" );
    var_0 thread maps\_anim::anim_generic( self, "down_exposed" );
    var_0 waittill( "down_exposed" );
    self pushplayer( 0 );
}

intro_sneakup_patrollers()
{
    if ( common_scripts\utility::flag( "_stealth_spotted" ) )
        return;

    level endon( "_stealth_spotted" );

    if ( common_scripts\utility::flag( "intro_patrol_guys_dead" ) )
        return;

    var_0 = [];
    var_0[var_0.size] = "scoutsniper_ru1_wandering";
    var_0[var_0.size] = "scoutsniper_ru2_notwandering";
    var_0[var_0.size] = "scoutsniper_ru1_wasteland";
    var_0[var_0.size] = "scoutsniper_ru2_zahkaevspayinggood";
    var_1 = maps\_utility::get_living_ai_array( "patrollers", "script_noteworthy" );

    if ( var_1.size == 2 )
        maps\scoutsniper_code::mission_dialogue_array( var_1, var_0 );

    thread intro_sneakup_patrollers_kill();
    thread intro_sneakup_patrollers_dialogue();
    maps\_utility::disable_cqbwalk();
    self.disablearrivals = 1;
    self.disableexits = 1;
    level endon( "intro_patrol_guys_dead" );
    var_2 = getnode( "price_intro_sneakup", "targetname" );
    thread maps\scoutsniper_code::scoutsniper_follow_path( var_2 );
    wait 3;
    maps\_utility::ent_flag_clear( "_stealth_stance_handler" );
    wait 0.1;
    self allowedstances( "prone" );
    wait 6.9;
    thread intro_sneakup_patrollers_kill_dialogue();
    common_scripts\utility::flag_wait( "intro_patrol_guys_dead" );
}

intro_sneakup_patrollers_kill_dialogue()
{
    if ( common_scripts\utility::flag( "intro_patrol_guys_dead" ) )
        return;

    level endon( "intro_patrol_guys_dead" );

    if ( common_scripts\utility::flag( "_stealth_spotted" ) )
        return;

    level endon( "_stealth_spotted" );

    if ( common_scripts\utility::flag( "_stealth_found_corpse" ) )
        return;

    level endon( "_stealth_found_corpse" );

    while ( !common_scripts\utility::flag( "intro_patrol_guy_down" ) )
    {
        common_scripts\utility::flag_waitopen( "_stealth_event" );
        level maps\_utility::function_stack( maps\_utility::radio_dialogue, "scoutsniper_mcm_notlooking" );
        wait 30;
    }
}

intro_sneakup_patrollers_dialogue()
{
    if ( common_scripts\utility::flag( "_stealth_spotted" ) )
        return;

    level endon( "_stealth_spotted" );

    if ( !common_scripts\utility::flag( "intro_patrol_guy_down" ) )
    {
        common_scripts\utility::flag_wait( "intro_patrol_guy_down" );
        maps\_utility::radio_dialogue_stop();
        level maps\_utility::function_stack( maps\_utility::radio_dialogue, "scoutsniper_mcm_hesdown" );
    }

    common_scripts\utility::flag_wait( "intro_patrol_guys_dead" );
    maps\_utility::radio_dialogue_stop();
    level thread maps\_utility::function_stack( maps\_utility::radio_dialogue, "scoutsniper_mcm_goodnight" );
}

intro_sneakup_patrollers_death()
{
    var_0 = maps\_utility::get_living_ai_array( "patrollers", "script_noteworthy" );
    maps\_utility::waittill_dead( var_0 );
    common_scripts\utility::flag_set( "intro_patrol_guys_dead" );
}

intro_sneakup_patrollers_kill()
{
    if ( common_scripts\utility::flag( "_stealth_spotted" ) )
        return;

    level endon( "_stealth_spotted" );
    var_0 = maps\_utility::get_living_ai_array( "patrollers", "script_noteworthy" );

    if ( var_0.size > 1 )
        maps\_utility::waittill_dead( var_0, 1 );

    common_scripts\utility::flag_set( "intro_patrol_guy_down" );
    level endon( "intro_patrol_guys_dead" );
    wait 0.5;

    while ( maps\_utility::ent_flag( "_stealth_stay_still" ) )
        self waittill( "_stealth_stay_still" );

    var_1 = maps\_utility::get_living_ai( "patrollers", "script_noteworthy" );
    var_1 endon( "death" );
    wait(randomfloatrange( 0.75, 1.25 ));
    magicbullet( self.weapon, self gettagorigin( "tag_flash" ), var_1 getshootatpos() );
    wait 0.05;
    var_1 kill( self.origin );
}

intro_sneakup_tableguys()
{
    if ( common_scripts\utility::flag( "_stealth_spotted" ) )
        return;

    level endon( "_stealth_spotted" );

    if ( common_scripts\utility::flag( "intro_last_patrol" ) )
        return;

    level endon( "intro_last_patrol" );
    self.favoriteenemy = undefined;
    self.ignoreall = 1;
    self.disablearrivals = 0;
    self.disableexits = 0;
    self allowedstances( "stand" );
    level maps\_utility::delaythread( 0.75, maps\_utility::function_stack, maps\_utility::radio_dialogue, "scoutsniper_mcm_move" );
    var_0 = getnode( "price_intro_tableguys_node1", "targetname" );
    var_1 = vectornormalize( var_0.origin - self.origin );
    maps\_stealth_behavior::friendly_spotted_getup_from_prone( vectortoangles( var_1 ) );
    maps\_utility::delaythread( 0.25, maps\scoutsniper_code::dynamic_run_speed );
    var_0 maps\_anim::anim_generic_reach_and_arrive( self, "stop_cornerR" );
    self notify( "stop_dynamic_run_speed" );
    level thread maps\_utility::function_stack( maps\_utility::radio_dialogue, "scoutsniper_mcm_holdup" );
    self.ref_node.origin = var_0.origin;
    self.ref_node.angles = var_0.angles + ( 0.0, -90.0, 0.0 );
    self.ref_node thread maps\_anim::anim_generic( self, "stop_cornerR" );
    self.ref_node waittill( "stop_cornerR" );
    level thread maps\_utility::function_stack( maps\_utility::radio_dialogue, "scoutsniper_mcm_goaround" );
    self.ref_node thread maps\_anim::anim_generic( self, "onme_cornerR" );
    self.ref_node waittill( "onme_cornerR" );
    self.custommovetransition = ::stand2run180r;
    var_0 = getnode( "price_intro_tableguys_node2", "targetname" );
    maps\_utility::set_goal_node( var_0 );
    self.goalradius = var_0.radius;
    self waittill( "goal" );
    var_2 = [];
    var_2[var_2.size] = "scoutsniper_ru1_passcig";
    var_2[var_2.size] = "scoutsniper_ru2_whoseturnisit";
    var_2[var_2.size] = "scoutsniper_ru1_wakeup";
    var_2[var_2.size] = "scoutsniper_ru4_tooexpensive";
    var_2[var_2.size] = "scoutsniper_ru1_tooexpensive";
    var_3 = maps\_utility::get_living_ai_array( "tableguards", "script_noteworthy" );

    if ( var_3.size == 4 )
        maps\scoutsniper_code::mission_dialogue_array( var_3, var_2 );

    var_0 = getnode( "price_intro_tableguys_node3", "targetname" );
    self.ref_node.origin = var_0.origin;
    self.ref_node.angles = var_0.angles + ( 0.0, -90.0, 0.0 );
    self setgoalnode( var_0 );
    self.goalradius = level.macmillan_exposed_cqb_radius;
    self waittill( "goal" );
    level thread maps\_utility::function_stack( maps\_utility::radio_dialogue, "scoutsniper_mcm_4tangos" );
    self.ref_node thread maps\_anim::anim_generic( self, "enemy_cornerR" );
    self setgoalpos( self.origin );
    self.goalradius = level.macmillan_exposed_cqb_radius;
    level maps\_utility::function_stack( maps\_utility::radio_dialogue, "scoutsniper_mcm_donteven" );
}

#using_animtree("generic_human");

stand2run180r()
{
    animscripts\exit_node::donodeexitanimation_impl( %stand_2_run_180r );
}

cornerright_exitforwards()
{
    animscripts\exit_node::donodeexitanimation_impl( %corner_standr_trans_cqb_out_8 );
}

dashsniper_exit()
{
    animscripts\exit_node::donodeexitanimation_impl( %corner_standr_trans_out_4 );
}

cargo_exit()
{
    animscripts\exit_node::donodeexitanimation_impl( %corner_standr_trans_cqb_out_9 );
}

center_exit()
{
    animscripts\exit_node::donodeexitanimation_impl( %corner_standr_trans_cqb_out_9 );
}

clearpathturnanimblendtime()
{
    self.pathturnanimblendtime = undefined;
}

intro_avoid_tableguys()
{
    if ( common_scripts\utility::flag( "_stealth_spotted" ) )
        return;

    level endon( "_stealth_spotted" );

    if ( common_scripts\utility::flag( "intro_last_patrol_dead" ) )
        return;

    level endon( "intro_last_patrol_dead" );
    self allowedstances( "stand" );
    self.disablearrivals = 0;
    self.disableexits = 0;
    var_0 = getnode( "price_intro_tableguys_node4", "targetname" );
    self.ref_node.origin = var_0.origin;
    self.ref_node.angles = var_0.angles + ( 0.0, -90.0, 0.0 );
    self.ref_node maps\_anim::anim_generic_reach_and_arrive( self, "stop_cornerR" );
    level thread maps\_utility::function_stack( maps\_utility::radio_dialogue, "scoutsniper_mcm_tangobycar" );
    intro_corpse_hide();
    self.ref_node thread maps\_anim::anim_generic( self, "stop_cornerR" );
    self.ref_node waittill( "stop_cornerR" );
    self.ref_node thread maps\_anim::anim_generic( self, "enemy_cornerR" );
    self.ref_node waittill( "enemy_cornerR" );
    self.goalradius = level.macmillan_exposed_cqb_radius;
    wait 2;
    level thread maps\_utility::function_stack( maps\_utility::radio_dialogue, "scoutsniper_mcm_yourcall" );
}

intro_corpse_hide()
{
    if ( !level._stealth.logic.corpse.array.size )
        return;

    var_0 = level._stealth.logic.corpse.array.size;

    for ( var_1 = 0; var_1 < var_0; var_1++ )
        level._stealth.logic.corpse.array[var_1].origin -= ( 0.0, 0.0, 10.0 );
}

intro_leave_area()
{
    if ( common_scripts\utility::flag( "_stealth_spotted" ) )
        return;

    level endon( "_stealth_spotted" );
    common_scripts\utility::flag_wait_either( "intro_leave_area", "intro_last_patrol_dead" );
    level notify( "price_stop_custom_detection" );

    if ( common_scripts\utility::flag( "intro_leave_area" ) && !common_scripts\utility::flag( "intro_last_patrol_dead" ) )
        level maps\_utility::function_stack( maps\_utility::radio_dialogue, "scoutsniper_mcm_backinside" );

    var_0 = getnode( "price_intro_tableguys_node4", "targetname" );
    self.ref_node.origin = var_0.origin;
    self.ref_node.angles = var_0.angles + ( 0.0, -90.0, 0.0 );
    self.ref_node maps\_anim::anim_generic_reach_and_arrive( self, "stop_cornerR" );

    if ( common_scripts\utility::flag( "intro_last_patrol_dead" ) )
        maps\_utility::radio_dialogue_stop();

    level thread maps\_utility::function_stack( maps\_utility::radio_dialogue, "scoutsniper_mcm_okgo" );
    wait 1.1;
    self.ref_node thread maps\_anim::anim_generic( self, "moveout_cornerR" );
    self.ref_node waittill( "moveout_cornerR" );
    var_0 = getnode( "price_intro_leave_node", "targetname" );
    thread maps\scoutsniper_code::scoutsniper_follow_path( var_0 );
    thread intro_leave_area_dialogue();
}

intro_leave_area_dialogue()
{
    if ( common_scripts\utility::flag( "_stealth_spotted" ) )
        return;

    level endon( "_stealth_spotted" );
    self waittill( "goal" );
    self waittill( "goal" );
    self waittill( "goal" );
    wait 1;
    level maps\_utility::function_stack( maps\_utility::radio_dialogue, "scoutsniper_mcm_moveup" );
}

intro_lastguy_think()
{
    level.intro_last_patrol = self;
    thread intro_lastguy_death();
    self endon( "death" );
    common_scripts\utility::flag_wait_either( "intro_last_patrol", "_stealth_spotted" );

    if ( !common_scripts\utility::flag( "_stealth_spotted" ) )
    {
        self.disablestairsanims = 1;
        maps\_stealth_logic::stealth_ai_clear_custom_idle_and_react();
        self.target = "intro_last_patrol_smoke";
        thread maps\_patrol::patrol();
    }
}

intro_lastguy_death()
{
    level.intro_last_patroller_corpse_name = "corpse_" + self.ai_number;
    self waittill( "death" );
    common_scripts\utility::flag_set( "intro_last_patrol_dead" );
}

intro_cleanup()
{
    thread intro_cleanup2();

    if ( common_scripts\utility::flag( "_stealth_spotted" ) )
        return;

    level endon( "_stealth_spotted" );
    self waittill( "scoutsniper_path_end_reached" );
    common_scripts\utility::flag_set( "intro_left_area" );
}

intro_cleanup2()
{
    level endon( "intro_left_area" );
    common_scripts\utility::flag_wait( "_stealth_spotted" );
    self notify( "stop_path" );
    maps\_utility::waittill_dead_or_dying( getaispeciesarray( "axis", "all" ) );
    common_scripts\utility::flag_waitopen( "_stealth_spotted" );
    common_scripts\utility::flag_set( "intro_left_area" );
}

church_main()
{
    if ( !isalive( level.price ) )
        return;

    level.price endon( "death" );
    common_scripts\utility::flag_wait( "initial_setup_done" );
    thread church_patroller();
    thread church_lookout();
    thread maps\scoutsniper_code::church_event_awareness();
    thread church_handle_area_killed();
    common_scripts\utility::flag_wait( "intro_left_area" );
    level.price church_runup();
    common_scripts\utility::flag_wait( "church_intro" );
    level.price church_runup2();
    maps\scoutsniper_code::try_save( "at_church" );
    level.price notify( "stop_dynamic_run_speed" );
    level.price church_holdup();
    level.price maps\_utility::ent_flag_set( "_stealth_stance_handler" );
    level.price church_sneakup();
    level.price allowedstances( "stand", "crouch", "prone" );
    level.price church_moveup_car();
    level.price church_run_for_it();
    level.price maps\_utility::ent_flag_clear( "_stealth_stance_handler" );
    level.price allowedstances( "stand", "crouch", "prone" );

    if ( common_scripts\utility::flag( "_stealth_spotted" ) )
    {
        common_scripts\utility::flag_waitopen( "_stealth_spotted" );
        wait 0.75;
        common_scripts\utility::flag_waitopen( "_stealth_spotted" );
    }

    common_scripts\utility::flag_waitopen( "church_run_for_it_commit" );

    while ( !common_scripts\utility::flag( "church_door_open" ) )
        level.price church_open_door();

    level.price thread church_walkthrough();
}

church_handle_area_killed()
{
    common_scripts\utility::flag_wait( "church_intro" );
    wait 0.5;
    getaispeciesarray( "axis", "all" );
    maps\_utility::waittill_dead_or_dying( getaiarray( "axis" ) );
    common_scripts\utility::flag_set( "church_and_intro_killed" );
}

church_runup()
{
    if ( common_scripts\utility::flag( "_stealth_spotted" ) )
        return;

    level endon( "_stealth_spotted" );
    self allowedstances( "stand", "crouch", "prone" );

    if ( common_scripts\utility::flag( "church_area_clear" ) )
        return;

    level endon( "church_area_clear" );
    var_0 = getnode( "church_price_node1", "targetname" );

    if ( common_scripts\utility::flag( "church_intro" ) )
        return;

    level endon( "church_intro" );
    var_1 = getaiarray( "axis" );

    if ( ( !isdefined( var_1 ) || var_1.size == 0 ) && level.start_point != "church_x" )
        maps\_utility::delaythread( 0.1, maps\scoutsniper_code::dynamic_run_speed );
    else if ( distance( var_0.origin, self.origin ) > 512 )
    {
        level thread maps\_utility::function_stack( maps\_utility::radio_dialogue, "scoutsniper_mcm_letsgo" );
        maps\_utility::delaythread( 0.1, maps\scoutsniper_code::dynamic_run_speed );
    }

    maps\scoutsniper_code::scoutsniper_follow_path( var_0 );
}

intro_to_church_spotted()
{
    level endon( "graveyard_hind_ready" );

    for (;;)
    {
        common_scripts\utility::flag_wait( "_stealth_spotted" );
        common_scripts\utility::flag_waitopen( "_stealth_spotted" );
        common_scripts\utility::flag_waitopen( "_stealth_alert" );
        common_scripts\utility::flag_waitopen( "_stealth_event" );
        wait 0.5;
        common_scripts\utility::flag_waitopen( "_stealth_spotted" );
        common_scripts\utility::flag_waitopen( "_stealth_alert" );
        common_scripts\utility::flag_waitopen( "_stealth_event" );

        if ( level.player.health )
            level thread maps\_utility::function_stack( maps\_utility::radio_dialogue, "scoutsniper_mcm_getuskilled" );
    }
}

church_runup2()
{
    if ( common_scripts\utility::flag( "_stealth_spotted" ) )
        return;

    level endon( "_stealth_spotted" );

    if ( common_scripts\utility::flag( "church_area_clear" ) )
        return;

    level endon( "church_area_clear" );

    if ( common_scripts\utility::flag( "church_run_for_it" ) )
        return;

    level endon( "church_run_for_it" );
    level endon( "event_awareness" );
    self allowedstances( "stand", "crouch", "prone" );
    var_0 = getnode( "church_price_node2", "targetname" );
    maps\scoutsniper_code::scoutsniper_follow_path( var_0 );
}

church_holdup()
{
    if ( common_scripts\utility::flag( "_stealth_spotted" ) )
        return;

    level endon( "_stealth_spotted" );

    if ( common_scripts\utility::flag( "church_area_clear" ) )
        return;

    level endon( "church_area_clear" );

    if ( common_scripts\utility::flag( "_stealth_found_corpse" ) )
        return;

    level endon( "_stealth_found_corpse" );

    if ( common_scripts\utility::flag( "church_run_for_it" ) )
        return;

    level endon( "church_run_for_it" );
    level endon( "event_awareness" );
    var_0 = getnode( "church_price_node2", "targetname" );
    var_0 maps\_anim::anim_generic_reach_and_arrive( self, "stop_exposed" );
    thread church_holdup_dialogue( var_0 );
    var_0 thread maps\_anim::anim_generic( self, "stop_exposed" );
    var_0 waittill( "stop_exposed" );
    common_scripts\utility::flag_wait_either( "church_start_patroller_line", "church_patroller_dead" );

    if ( !common_scripts\utility::flag( "church_patroller_dead" ) )
    {
        var_0 thread maps\_anim::anim_generic( self, "enemy_exposed" );
        var_0 waittill( "enemy_exposed" );
    }

    var_0 thread maps\_anim::anim_generic( self, "onme2_exposed" );
    var_0 waittill( "onme2_exposed" );
}

church_holdup_dialogue( var_0 )
{
    if ( common_scripts\utility::flag( "_stealth_spotted" ) )
        return;

    level endon( "_stealth_spotted" );

    if ( common_scripts\utility::flag( "church_area_clear" ) )
        return;

    level endon( "church_area_clear" );

    if ( common_scripts\utility::flag( "_stealth_found_corpse" ) )
        return;

    level endon( "_stealth_found_corpse" );

    if ( common_scripts\utility::flag( "church_run_for_it" ) )
        return;

    level endon( "church_run_for_it" );
    level endon( "event_awareness" );

    if ( !( common_scripts\utility::flag( "church_patroller_dead" ) && common_scripts\utility::flag( "church_lookout_dead" ) ) )
        level maps\_utility::function_stack( maps\_utility::radio_dialogue, "scoutsniper_mcm_dontmove" );

    var_0 waittill( "stop_exposed" );

    if ( !common_scripts\utility::flag( "church_lookout_dead" ) )
    {
        if ( common_scripts\utility::flag( "church_patroller_dead" ) )
            level maps\_utility::function_stack( maps\_utility::radio_dialogue, "scoutsniper_mcm_inthetower" );
        else
            level maps\_utility::function_stack( maps\_utility::radio_dialogue, "scoutsniper_mcm_churchtower" );

        if ( !common_scripts\utility::flag( "church_patroller_dead" ) )
        {
            common_scripts\utility::flag_set( "church_start_patroller_line" );

            if ( common_scripts\utility::flag( "church_lookout_dead" ) )
                level thread maps\_utility::function_stack( maps\_utility::radio_dialogue, "scoutsniper_mcm_niceshot" );
            else
                level thread maps\_utility::function_stack( maps\_utility::radio_dialogue, "scoutsniper_mcm_patrolnorth" );
        }
    }
    else if ( !common_scripts\utility::flag( "church_patroller_dead" ) )
    {
        common_scripts\utility::flag_set( "church_start_patroller_line" );
        level thread maps\_utility::function_stack( maps\_utility::radio_dialogue, "scoutsniper_mcm_niceshot" );
    }

    var_0 waittill( "enemy_exposed" );

    if ( !common_scripts\utility::flag( "church_patroller_dead" ) )
        level maps\_utility::function_stack( maps\_utility::radio_dialogue, "scoutsniper_mcm_betterview" );

    common_scripts\utility::flag_set( "church_dialogue_done" );
}

church_sneakup()
{
    if ( common_scripts\utility::flag( "_stealth_spotted" ) )
        return;

    level endon( "_stealth_spotted" );

    if ( common_scripts\utility::flag( "church_area_clear" ) )
        return;

    level endon( "church_area_clear" );
    maps\_utility::enable_cqbwalk();
    maps\_utility::walkdist_force_walk();
    maps\_utility::delaythread( 3, maps\_utility::walkdist_reset );
    maps\_utility::delaythread( 3, maps\_utility::disable_cqbwalk );
    maps\_anim::anim_generic( self, "exposed_tracking_turn45R" );
    var_0 = getnode( "church_price_sneakup", "targetname" );
    thread maps\scoutsniper_code::scoutsniper_follow_path( var_0 );

    if ( common_scripts\utility::flag( "church_run_for_it" ) )
        return;

    level endon( "church_run_for_it" );
    self waittill( "scoutsniper_path_end_reached" );
    maps\_utility::ent_flag_clear( "_stealth_stance_handler" );
    waittillframeend;
    self allowedstances( "prone" );
    thread church_sneakup_dialogue_nag();
    thread church_sneakup_dialogue_nag2();
    common_scripts\utility::flag_wait( "church_patroller_faraway" );
    common_scripts\utility::flag_set( "church_run_for_it" );
}

church_sneakup_dialogue_nag()
{
    if ( common_scripts\utility::flag( "_stealth_spotted" ) )
        return;

    level endon( "_stealth_spotted" );

    if ( common_scripts\utility::flag( "church_area_clear" ) )
        return;

    level endon( "church_area_clear" );

    if ( common_scripts\utility::flag( "church_run_for_it" ) )
        return;

    level endon( "church_run_for_it" );

    if ( common_scripts\utility::flag( "church_lookout_dead" ) )
        return;

    level endon( "church_lookout_dead" );

    if ( common_scripts\utility::flag( "church_patroller_dead" ) )
        return;

    level endon( "church_patroller_dead" );

    if ( common_scripts\utility::flag( "_stealth_found_corpse" ) )
        return;

    level endon( "_stealth_found_corpse" );
    level endon( "event_awareness" );
    var_0 = 0;
    var_1 = [];
    var_1[0] = "scoutsniper_mcm_haveashot";
    var_1[1] = "scoutsniper_mcm_inthetower";
    level maps\_utility::function_stack( maps\_utility::radio_dialogue, var_1[var_0] );
    var_0++;
    thread church_sneakup_dialogue_help();

    while ( !common_scripts\utility::flag( "church_lookout_dead" ) )
    {
        level common_scripts\utility::waittill_notify_or_timeout( "church_sneakup_dialogue_help", 10 );

        if ( common_scripts\utility::flag( "church_sneakup_dialogue_help" ) )
        {
            common_scripts\utility::flag_waitopen( "church_sneakup_dialogue_help" );
            continue;
        }

        level maps\_utility::function_stack( maps\_utility::radio_dialogue, var_1[var_0] );
        var_0++;

        if ( var_0 >= var_1.size )
            var_0 = 0;
    }
}

church_sneakup_dialogue_help()
{
    if ( common_scripts\utility::flag( "_stealth_spotted" ) )
        return;

    level endon( "_stealth_spotted" );

    if ( common_scripts\utility::flag( "church_area_clear" ) )
        return;

    level endon( "church_area_clear" );

    if ( common_scripts\utility::flag( "church_run_for_it" ) )
        return;

    level endon( "church_run_for_it" );

    if ( common_scripts\utility::flag( "church_lookout_dead" ) )
        return;

    level endon( "church_lookout_dead" );

    if ( common_scripts\utility::flag( "church_patroller_dead" ) )
        return;

    level endon( "church_patroller_dead" );

    if ( common_scripts\utility::flag( "_stealth_found_corpse" ) )
        return;

    level endon( "_stealth_found_corpse" );
    level endon( "event_awareness" );
    var_0 = common_scripts\utility::getstruct( "church_wrong_tower", "targetname" );

    while ( !common_scripts\utility::flag( "church_lookout_dead" ) )
    {
        while ( level.player playerads() < 0.85 )
            wait 0.05;

        while ( level.player playerads() > 0.85 )
        {
            var_1 = anglestoforward( level.player getplayerangles() );
            var_2 = vectornormalize( var_0.origin - level.player.origin );

            if ( vectordot( var_1, var_2 ) > 0.996 )
                break;

            wait 0.05;
        }

        if ( level.player playerads() > 0.85 )
        {
            common_scripts\utility::flag_set( "church_sneakup_dialogue_help" );
            level maps\_utility::function_stack( maps\_utility::radio_dialogue, "scoutsniper_mcm_wrongtower" );
            common_scripts\utility::flag_clear( "church_sneakup_dialogue_help" );
            wait 5;
        }
    }
}

church_sneakup_dialogue_nag2()
{
    if ( common_scripts\utility::flag( "_stealth_spotted" ) )
        return;

    level endon( "_stealth_spotted" );

    if ( common_scripts\utility::flag( "church_area_clear" ) )
        return;

    level endon( "church_area_clear" );

    if ( common_scripts\utility::flag( "church_run_for_it" ) )
        return;

    level endon( "church_run_for_it" );

    if ( common_scripts\utility::flag( "church_patroller_dead" ) )
        return;

    level endon( "church_patroller_dead" );
    common_scripts\utility::flag_wait( "church_lookout_dead" );
    wait 0.5;
    level maps\_utility::function_stack( maps\_utility::radio_dialogue, "scoutsniper_mcm_targetnorth" );
    level maps\_utility::function_stack( maps\_utility::radio_dialogue, "scoutsniper_mcm_yourcall" );
}

church_moveup_car()
{
    if ( common_scripts\utility::flag( "_stealth_spotted" ) )
        return;

    level endon( "_stealth_spotted" );

    if ( common_scripts\utility::flag( "church_run_for_it" ) )
        return;

    if ( common_scripts\utility::flag( "church_and_intro_killed" ) )
        return;

    level thread maps\_utility::function_stack( maps\_utility::radio_dialogue, "scoutsniper_mcm_go" );
    var_0 = getnode( "church_price_node_car", "targetname" );
    var_1 = vectornormalize( var_0.origin - self.origin );
    maps\_utility::ent_flag_clear( "_stealth_stance_handler" );
    maps\_stealth_behavior::friendly_spotted_getup_from_prone( vectortoangles( var_1 ), 1 );
    maps\scoutsniper_code::scoutsniper_follow_path( var_0 );
    level thread maps\_utility::function_stack( maps\_utility::radio_dialogue, "scoutsniper_mcm_forwardclear" );
}

church_run_for_it()
{
    if ( !common_scripts\utility::flag( "church_run_for_it" ) )
        return;

    if ( common_scripts\utility::flag( "_stealth_spotted" ) )
        return;

    level endon( "_stealth_spotted" );

    if ( common_scripts\utility::flag( "church_and_intro_killed" ) )
        return;

    thread church_run_for_it_dead_dialogue();

    if ( !common_scripts\utility::flag( "church_lookout_dead" ) )
    {
        if ( common_scripts\utility::flag( "church_guess_he_cant_see" ) )
        {
            level maps\_utility::function_stack( maps\_utility::radio_dialogue, "scoutsniper_mcm_closeone" );
            wait 0.65;
        }
    }

    if ( common_scripts\utility::flag( "church_patroller_faraway" ) )
        level maps\_utility::function_stack( maps\_utility::radio_dialogue, "scoutsniper_mcm_ourchance" );

    maps\_utility::ent_flag_clear( "_stealth_stance_handler" );
    wait 0.05;
    waittillframeend;

    if ( !common_scripts\utility::flag( "church_lookout_dead" ) )
    {
        self allowedstances( "prone" );
        level maps\_utility::function_stack( maps\_utility::radio_dialogue, "scoutsniper_mcm_turnaround" );
        var_0 = ( 0.0, 45.0, 0.0 );
        var_1 = anglestoforward( var_0 );
        var_2 = maps\_utility::get_living_ai( "church_lookout", "script_noteworthy" );

        while ( isalive( var_2 ) )
        {
            var_3 = anglestoforward( var_2.angles );

            if ( vectordot( var_1, var_3 ) > 0.9 )
                break;

            wait 0.05;
        }
    }

    if ( common_scripts\utility::flag( "church_lookout_dead" ) )
        return;

    level endon( "church_lookout_dead" );
    thread church_run_for_it_commit();
    self waittill( "scoutsniper_path_end_reached" );
}

church_run_for_it_commit()
{
    common_scripts\utility::flag_set( "church_run_for_it_commit" );
    self allowedstances( "crouch", "stand", "prone" );
    self pushplayer( 1 );
    maps\_utility::set_generic_run_anim( "sprint", 1, 0 );
    level thread maps\_utility::function_stack( maps\_utility::radio_dialogue, "scoutsniper_mcm_readygo" );
    self notify( "scoutsniper_mcm_readygo" );
    var_0 = getnode( "church_price_runforit", "targetname" );
    var_1 = vectornormalize( var_0.origin - self.origin );
    maps\_stealth_behavior::friendly_spotted_getup_from_prone( vectortoangles( var_1 ), 1 );
    thread maps\scoutsniper_code::scoutsniper_follow_path( var_0 );
    self waittill( "scoutsniper_path_end_reached" );
    self pushplayer( 0 );
    maps\_utility::clear_run_anim();
    common_scripts\utility::flag_clear( "church_run_for_it_commit" );
}

church_run_for_it_dead_dialogue()
{
    self endon( "scoutsniper_mcm_readygo" );
    common_scripts\utility::flag_wait( "church_lookout_dead" );
    level maps\_utility::delaythread( 0.1, maps\_utility::function_stack, maps\_utility::radio_dialogue, "scoutsniper_mcm_onme" );
}

church_lookout()
{
    var_0 = getent( "church_lookout", "script_noteworthy" );
    var_1 = [];
    var_1["saw"] = maps\scoutsniper_code::church_lookout_stealth_behavior_saw_corpse;
    var_1["found"] = maps\scoutsniper_code::church_lookout_stealth_behavior_found_corpse;
    var_2 = [];
    var_2["alerted_once"] = maps\scoutsniper_code::church_lookout_stealth_behavior_alert_level_investigate;
    var_2["alerted_again"] = maps\scoutsniper_code::church_lookout_stealth_behavior_alert_level_attack;
    var_2["attack"] = maps\scoutsniper_code::church_lookout_stealth_behavior_alert_level_attack;
    var_3 = [];
    var_3["explode"] = maps\scoutsniper_code::church_lookout_stealth_behavior_explosion;
    var_0 thread maps\_utility::add_spawn_function( maps\_stealth_logic::stealth_ai, undefined, var_2, var_1, var_3 );
    var_0 thread maps\_utility::add_spawn_function( ::church_lookout_death );
    common_scripts\utility::flag_wait( "church_intro" );
    maps\scoutsniper_code::scripted_array_spawn( "church_lookout", "script_noteworthy", 1 );
    waittillframeend;
    var_4 = maps\_utility::get_living_ai( "church_lookout", "script_noteworthy" );
    var_4.a.disablelongdeath = 1;
    var_4 endon( "death" );
    common_scripts\utility::flag_wait( "church_ladder_slide" );
    var_4 thread church_lookout_cleanup();
    wait 1;
    var_4.ignoreall = 1;
    var_4.allowdeath = 1;
    var_4.goalradius = 1024;
    var_4 maps\_stealth_behavior::ai_change_behavior_function( "alert", "alerted_once", maps\scoutsniper_code::church_lookout_stealth_behavior_alert_level_attack );
    var_4 notify( "_stealth_stop_stealth_logic" );
    var_5 = getent( "church_ladder_slide_node", "targetname" );
    var_5 maps\_anim::anim_generic( var_4, "ladder_slide" );
    var_4 setgoalpos( var_4.origin );
    var_4 thread maps\_stealth_behavior::enemy_announce_huh();
    level.price.ignoreme = 0;
    level.price.ignoreall = 0;
    var_4.ignoreall = 0;
    var_4.favoriteenemy = level.player;
}

church_lookout_cleanup()
{
    self waittill( "death" );
    level.price.ignoreme = 1;
    level.price.ignoreall = 1;
}

church_lookout_wait()
{
    self endon( "_stealth_running_to_corpse" );
    self endon( "_stealth_saw_corpse" );
    self endon( "_stealth_found_corpse" );
    level endon( "_stealth_found_corpse" );
    level endon( "_stealth_spotted" );
    self waittill( "enemy_alert_level_change" );
}

church_lookout_death()
{
    var_0 = "corpse_" + self.ai_number;
    self waittill( "death" );
    var_1 = getent( "doggie_clip", "targetname" );
    var_1 solid();
    var_1 disconnectpaths();
    waittillframeend;
    var_2 = getent( var_0, "script_noteworthy" );

    if ( isdefined( var_2 ) )
    {
        var_2 delete();
        level._stealth.logic.corpse.array = common_scripts\utility::array_removeundefined( level._stealth.logic.corpse.array );
    }

    common_scripts\utility::flag_set( "church_lookout_dead" );

    if ( common_scripts\utility::flag( "church_patroller_dead" ) )
        common_scripts\utility::flag_set( "church_area_clear" );

    if ( !common_scripts\utility::flag( "intro_patrol_guys_dead" ) )
        return;

    var_3 = !common_scripts\utility::flag( "_stealth_spotted" ) && common_scripts\utility::flag( "church_dialogue_done" );
    var_4 = !common_scripts\utility::flag( "_stealth_spotted" ) && common_scripts\utility::flag( "church_door_open" );

    if ( var_3 || var_4 )
        level thread maps\_utility::function_stack( maps\_utility::radio_dialogue, "scoutsniper_mcm_beautiful" );
}

church_patroller()
{
    var_0 = getent( "church_smoker", "script_noteworthy" );
    var_0 thread maps\_utility::add_spawn_function( maps\_stealth_logic::stealth_ai );
    var_0 thread maps\_utility::add_spawn_function( ::church_patroller_death );
    var_0 thread maps\_utility::add_spawn_function( ::church_patroller_faraway_trig );
    common_scripts\utility::flag_wait( "church_intro" );
    thread maps\scoutsniper_code::scripted_array_spawn( "church_smoker", "script_noteworthy", 1 );
}

church_patroller_faraway_trig()
{
    self endon( "death" );

    if ( common_scripts\utility::flag( "_stealth_spotted" ) )
        return;

    level endon( "_stealth_spotted" );
    var_0 = getent( "church_patrol_faraway_trig", "targetname" );

    for (;;)
    {
        var_0 waittill( "trigger", var_1 );

        if ( var_1 == self )
            break;
    }

    common_scripts\utility::flag_set( "church_patroller_faraway" );
}

church_patroller_death()
{
    level endon( "graveyard" );
    self waittill( "death" );
    var_0 = self.origin;

    if ( !common_scripts\utility::flag( "_stealth_spotted" ) && common_scripts\utility::flag( "church_dialogue_done" ) && common_scripts\utility::flag( "church_lookout_dead" ) )
    {
        maps\_utility::radio_dialogue_stop();
        level thread maps\_utility::function_stack( maps\_utility::radio_dialogue, "scoutsniper_mcm_tangodown" );
    }

    common_scripts\utility::flag_set( "church_patroller_dead" );

    if ( common_scripts\utility::flag( "church_lookout_dead" ) )
        common_scripts\utility::flag_set( "church_area_clear" );
    else
    {
        var_1 = maps\_utility::get_living_ai( "church_lookout", "script_noteworthy" );

        if ( distance( var_0, var_1.origin ) > level._stealth.logic.corpse.sight_dist + 150 && !common_scripts\utility::flag( "_stealth_spotted" ) )
            common_scripts\utility::flag_set( "church_run_for_it" );
        else if ( common_scripts\utility::flag( "_stealth_spotted" ) )
            return;
        else
        {
            if ( common_scripts\utility::flag( "intro_patrol_guys_dead" ) )
                level thread maps\_utility::function_stack( maps\_utility::radio_dialogue, "scoutsniper_mcm_seethebody" );

            wait 12;

            if ( !common_scripts\utility::flag( "_stealth_spotted" ) && !common_scripts\utility::flag( "_stealth_found_corpse" ) )
            {
                common_scripts\utility::flag_set( "church_run_for_it" );
                common_scripts\utility::flag_set( "church_guess_he_cant_see" );
            }
        }
    }
}

church_open_door()
{
    var_0 = undefined;
    var_1 = undefined;
    var_2 = undefined;

    if ( common_scripts\utility::flag( "_stealth_spotted" ) )
    {
        self notify( "stop_first_frame" );
        common_scripts\utility::flag_waitopen( "_stealth_spotted" );
    }

    waittillframeend;
    level endon( "_stealth_spotted" );
    self.disableexits = 0;
    self.disablearrivals = 0;
    self.animname = "generic";
    self setisignoringgrenades( 1 );

    if ( common_scripts\utility::flag( "church_and_intro_killed" ) )
    {
        level maps\_utility::delaythread( 0.1, maps\_utility::function_stack, maps\_utility::radio_dialogue, "scoutsniper_mcm_onme" );
        var_0 = "church_price_door_kick_node";
        var_3 = getnode( var_0, "targetname" );
        maps\scoutsniper_code::scoutsniper_follow_path( var_3 );
        var_1 = "open_door_kick";
        var_2 = maps\scoutsniper_code::door_open_kick;
        var_3 maps\_anim::anim_generic_reach_and_arrive( self, var_1 );
        self.goalradius = 16;
    }
    else
    {
        var_0 = "church_door_front_node";
        var_1 = "open_door_slow";
        var_2 = maps\scoutsniper_code::door_open_slow;
        var_3 = getent( var_0, "targetname" );
        var_3 maps\_anim::anim_generic_reach_and_arrive( self, var_1 );
        var_3 maps\_anim::anim_first_frame_solo( self, var_1 );
    }

    while ( distance( level.player.origin, self.origin ) > 200 )
        wait 0.1;

    thread church_open_door_commit( var_3, var_1, var_2 );
    var_3 waittill( var_1 );
}

church_open_door_commit( var_0, var_1, var_2 )
{
    if ( common_scripts\utility::flag( "_stealth_spotted" ) )
        return;

    common_scripts\utility::flag_set( "church_door_open" );
    var_0 thread maps\_anim::anim_single_solo( self, var_1 );
    maps\_utility::enable_cqbwalk();
    var_3 = getent( "church_door_front", "targetname" );
    var_4 = getent( "church_door_model", "targetname" );
    var_4 linkto( var_3 );
    var_3 [[ var_2 ]]();
}

church_walkthrough()
{
    self.a.bdisablemovetwitch = 1;
    church_walkthrough_lookaround();
    common_scripts\utility::flag_waitopen( "_stealth_spotted" );
    common_scripts\utility::flag_wait( "church_lookout_dead" );
    var_0 = getnode( "church_price_backdoor_node", "targetname" );
    self.ref_node.origin = var_0.origin;
    self.ref_node.angles = var_0.angles + ( 0.0, -90.0, 0.0 );
    self.ref_node maps\_anim::anim_generic_reach_and_arrive( self, "exposed_2_alert_cornerR" );
    self setisignoringgrenades( 0 );
    self.moveplaybackrate = 1.0;

    if ( !common_scripts\utility::flag( "graveyard_get_down" ) && !common_scripts\utility::flag( "graveyard_hear_that" ) )
        level thread maps\_utility::function_stack( maps\_utility::radio_dialogue, "scoutsniper_mcm_coastclear" );

    self.ref_node maps\_anim::anim_generic( self, "moveout_cornerR" );
    maps\_utility::disable_cqbwalk();
    self.a.bdisablemovetwitch = 0;
    self.goalradius = 90;
    common_scripts\utility::flag_set( "graveyard_moveup" );
}

church_walkthrough_lookaround()
{
    if ( common_scripts\utility::flag( "_stealth_spotted" ) )
        return;

    level endon( "_stealth_spotted" );
    var_0 = getent( "church_price_look_around_node", "targetname" );
    maps\_utility::set_goal_pos( var_0.origin );
    self.goalradius = 72;
    self waittill( "goal" );
    maps\_utility::enable_cqbwalk();
    common_scripts\utility::flag_set( "church_ladder_slide" );
    maps\_anim::anim_generic_run( self, "cqb_look_around" );
    self.moveplaybackrate = 0.75;
    var_1 = getnode( "church_price_backdoor_node", "targetname" );
    maps\_utility::set_goal_pos( var_1.origin );
}

graveyard_main()
{
    if ( !isalive( level.price ) )
        return;

    level.price endon( "death" );
    common_scripts\utility::flag_wait( "initial_setup_done" );
    common_scripts\utility::flag_set( "graveyard" );
    maps\scoutsniper_code::try_save( "graveyard" );
    common_scripts\utility::array_thread( getentarray( "church_breakable", "targetname" ), maps\scoutsniper_code::graveyard_church_breakable );
    thread graveyard_hind();
    thread field_endmission();
    level.price thread graveyard_waithind();
    level.price thread graveyard_deadhind();

    while ( !common_scripts\utility::flag( "graveyard_hind_ready" ) )
    {
        level.price graveyard_moveup();
        common_scripts\utility::flag_waitopen( "_stealth_spotted" );
    }

    level.price notify( "stop_loop" );
    level.price allowedstances( "prone", "crouch", "stand" );
    thread graveyard_backhalf();
}

graveyard_backhalf()
{
    common_scripts\utility::flag_wait_either( "graveyard_hind_gone", "graveyard_hind_down" );

    if ( !common_scripts\utility::flag( "graveyard_hind_down" ) )
        level thread maps\_utility::function_stack( maps\_utility::radio_dialogue, "scoutsniper_mcm_letsgo2" );

    common_scripts\utility::flag_set( "field" );
}

graveyard_moveup()
{
    common_scripts\utility::flag_wait( "graveyard_moveup" );

    if ( common_scripts\utility::flag( "_stealth_spotted" ) )
        return;

    level endon( "_stealth_spotted" );
    level endon( "graveyard_get_down" );
    var_0 = getnode( "graveyard_price_node", "targetname" );
    self.custommovetransition = ::cornerright_exitforwards;
    maps\_utility::delaythread( 0.25, maps\scoutsniper_code::dynamic_run_speed );
    self.ref_node.origin = var_0.origin;
    self.ref_node.angles = var_0.angles + ( 0.0, -90.0, 0.0 );
    self.disablestairsanims = 1;
    maps\_utility::enable_cqbwalk();
    maps\_utility::delaythread( 5, ::cleanup_graveyard_moveup );

    if ( getdvarint( "use_old_heli_coming" ) == 1 )
        self.ref_node maps\_anim::anim_generic_reach_and_arrive( self, "stop_cornerR" );
    else
    {
        if ( !isdefined( level.graveyard_price_hind_node ) )
            level.graveyard_price_hind_node = spawn( "script_origin", ( -8864.0, -4410.0, -167.0 ) );

        self.animname = "price";

        if ( !isdefined( self.did_not_get_to_wall ) )
            level.graveyard_price_hind_node thread maps\_anim::anim_reach_solo( self, "heli_coming_02_long" );

        common_scripts\utility::flag_wait( "graveyard_hind_ready" );

        if ( !isdefined( self.did_not_get_to_wall ) )
        {
            level.price notify( "stop_dynamic_run_speed" );
            self.animname = "price";
            self waittill( "goal" );
        }
    }

    common_scripts\utility::flag_set( "graveyard_price_at_wall" );
}

cleanup_graveyard_moveup()
{
    maps\_utility::disable_cqbwalk();
    self.disablestairsanims = undefined;
}

graveyard_waithind()
{
    common_scripts\utility::flag_wait( "graveyard_hind_ready" );

    if ( common_scripts\utility::flag( "_stealth_spotted" ) )
        return;

    level endon( "_stealth_spotted" );

    if ( getdvarint( "use_old_heli_coming" ) == 1 )
        old_macmillan_heli_sequence();
    else
        h1_macmillan_heli_sequence();

    self allowedstances( "prone", "crouch", "stand" );
    wait 0.5;
    common_scripts\utility::flag_set( "graveyard_hind_gone" );
}

old_macmillan_heli_sequence()
{
    level endon( "_stealth_spotted" );

    while ( distance( level.hind.origin, level.player.origin ) > 7500 )
        wait 0.05;

    common_scripts\utility::flag_set( "graveyard_get_down" );
    level thread maps\_utility::function_stack( maps\_utility::radio_dialogue, "scoutsniper_mcm_enemyheli" );
    self notify( "stop_dynamic_run_speed" );

    if ( common_scripts\utility::flag( "graveyard_price_at_wall" ) )
    {
        self allowedstances( "crouch" );
        maps\_anim::anim_generic( self, "corner_crouch" );
        thread maps\_anim::anim_generic_loop( self, "corner_idle", undefined, "stop_loop" );
    }
    else
    {
        self allowedstances( "prone" );
        maps\_anim::anim_generic_custom_animmode( self, "gravity", "pronehide_dive" );
    }

    self setgoalpos( self.origin );
    self.goalradius = level.macmillan_exposed_cqb_radius;
    level thread maps\_utility::function_stack( maps\_utility::radio_dialogue, "scoutsniper_mcm_inshadows" );

    while ( distance( level.hind.origin, self.origin ) < 7500 )
        wait 0.05;

    while ( distance( level.hind.origin, level.player.origin ) < 7500 )
        wait 0.05;

    self notify( "stop_loop" );
}

h1_macmillan_in_graveyard()
{
    level endon( "_stealth_spotted" );
    level endon( "graveyard_price_at_wall" );
    level endon( "graveyard_hind_gone" );

    for (;;)
    {
        var_0 = getent( "field_hind_flyover", "targetname" );
        var_0 waittill( "trigger", var_1 );

        if ( var_1 == self )
        {
            common_scripts\utility::flag_set( "graveyard_price_entered" );
            break;
        }

        wait 0.1;
    }
}

h1_macmillan_heli_sequence()
{
    common_scripts\utility::flag_wait( "graveyard_hind_ready" );
    thread h1_macmillan_in_graveyard();
    level endon( "_stealth_spotted" );
    level notify( "h1_kill_default_spotted_dialogue" );
    maps\_stealth_behavior::ai_create_behavior_function( "state", "spotted", ::h1_macmillan_graveyard_spotted );
    common_scripts\utility::flag_wait_or_timeout( "graveyard_price_at_wall", 5 );

    if ( common_scripts\utility::flag( "graveyard_price_at_wall" ) )
    {
        self.animname = "price";
        level.graveyard_price_hind_node maps\_anim::anim_single_solo( self, "heli_coming_02_long" );
        self.animname = "price";
        thread h1_macmillan_heli_idle();
    }
    else
    {
        self.did_not_get_to_wall = 1;
        self notify( "stop_dynamic_run_speed" );

        if ( !isdefined( level.graveyard_price_hind_node ) )
            level.graveyard_price_hind_node = spawn( "script_origin", ( -8864.0, -4410.0, -167.0 ) );

        level thread maps\_utility::function_stack( maps\_utility::radio_dialogue, "scoutsniper_mcm_enemyheli" );

        if ( !common_scripts\utility::flag( "graveyard_price_entered" ) )
        {
            var_0 = getnode( "macmillan_heli_prone_node", "targetname" );
            level.price setgoalnode( var_0 );
            level.price waittill( "goal" );
        }

        self stopanimscripted();
        self allowedstances( "prone" );
        self.animname = "generic";
        maps\_anim::anim_generic_custom_animmode( self, "gravity", "pronehide_dive" );
        thread maps\_anim::anim_generic_custom_animmode( self, "gravity", "pronehide_idle" );
    }

    self setgoalpos( self.origin );
    self.goalradius = level.macmillan_exposed_cqb_radius;
    wait 1;
    level thread maps\_utility::function_stack( maps\_utility::radio_dialogue, "scoutsniper_mcm_inshadows" );

    while ( distance( level.hind.origin, self.origin ) < 7500 )
        wait 0.05;

    while ( distance( level.hind.origin, level.player.origin ) < 7500 )
        wait 0.05;

    if ( isdefined( self.did_not_get_to_wall ) )
        maps\_anim::anim_generic_custom_animmode( self, "gravity", "prone_2_stand" );
    else
    {
        self notify( "stop_heli_loop" );
        self.animname = "price";
        level.graveyard_price_hind_node thread maps\_anim::anim_single_solo( self, "heli_coming_cover_exit" );
    }

    self.animname = "generic";
    maps\_stealth_behavior::ai_create_behavior_function( "state", "spotted", maps\_stealth_behavior::friendly_state_spotted );
    thread maps\scoutsniper_code::default_spotted_dialogue();

    if ( isdefined( self.did_not_get_to_wall ) )
        self.did_not_get_to_wall = undefined;
}

h1_macmillan_graveyard_spotted()
{
    level.price notify( "stop_heli_loop" );
    self.baseaccuracy = self._stealth.behavior.badaccuracy;
    self.accuracy = self._stealth.behavior.badaccuracy;
    self.grenadeammo = self._stealth.behavior.oldgrenadeammo;
    self allowedstances( "prone", "crouch", "stand" );
    self stopanimscripted();
    self.ignoreall = 0;
    self.ignoreme = 0;
    maps\_utility::disable_cqbwalk();
    maps\_utility::enable_ai_color();
    self.disablearrivals = 1;
    self.disableexits = 1;
    self pushplayer( 0 );

    if ( isdefined( level.price.did_not_get_to_wall ) )
    {
        maps\_utility::radio_dialogue_stop();
        self allowedstances( "stand", "crouch", "prone" );
        thread maps\_anim::anim_generic_custom_animmode( self, "gravity", "prone_2_stand" );
        maps\_utility::radio_dialogue( "scoutsniper_mcm_spotted" );
    }
    else
    {
        level.price.animname = "price";
        level.graveyard_price_hind_node maps\_anim::anim_single_solo( level.price, "heli_coming_spotted" );
    }

    level.price.animname = "generic";

    if ( !common_scripts\utility::flag( "_stealth_spotted" ) )
        wait 5;

    common_scripts\utility::flag_waitopen( "_stealth_spotted" );
    common_scripts\utility::flag_waitopen( "_stealth_event" );
    common_scripts\utility::flag_waitopen( "_stealth_alert" );
    maps\_stealth_behavior::ai_create_behavior_function( "state", "spotted", maps\_stealth_behavior::friendly_state_spotted );
    thread maps\scoutsniper_code::default_spotted_dialogue();
}

h1_macmillan_heli_idle()
{
    self endon( "stop_heli_loop" );

    for (;;)
    {
        if ( randomint( 3 ) == 0 )
        {
            level.graveyard_price_hind_node maps\_anim::anim_single_solo( self, "heli_coming_cover_idle_v2" );
            continue;
        }

        level.graveyard_price_hind_node maps\_anim::anim_single_solo( self, "heli_coming_cover_idle" );
    }
}

graveyard_deadhind()
{
    common_scripts\utility::flag_wait( "graveyard_hind_ready" );
    level endon( "field_spawn" );
    level endon( "price_reach_field" );
    level.hind waittill( "death", var_0 );

    if ( isdefined( level.hind ) )
        level.hind clearlookatent();

    common_scripts\utility::flag_set( "graveyard_hind_down" );

    if ( isdefined( var_0 ) && var_0 == level.player )
        maps\_utility::giveachievement_wrapper( "MAN_VERSUS_MACHINE" );
}

graveyard_hind_death_dialogue()
{
    level endon( "cargo" );
    common_scripts\utility::flag_wait( "_stealth_spotted" );
    common_scripts\utility::flag_wait( "graveyard_hind_down" );

    if ( !common_scripts\utility::flag( "_stealth_spotted" ) )
        wait 5;

    common_scripts\utility::flag_waitopen( "_stealth_spotted" );
    common_scripts\utility::flag_waitopen( "_stealth_event" );
    common_scripts\utility::flag_waitopen( "_stealth_alert" );
    wait 0.5;
    common_scripts\utility::flag_waitopen( "_stealth_spotted" );
    common_scripts\utility::flag_waitopen( "_stealth_alert" );
    common_scripts\utility::flag_waitopen( "_stealth_event" );

    if ( level.player.health )
        level thread maps\_utility::function_stack( maps\_utility::radio_dialogue, "scoutsniper_mcm_showinoff" );
}

graveyard_hind()
{
    var_0 = getent( "field_hind_flyover", "targetname" );
    var_0 waittill( "trigger" );
    common_scripts\utility::flag_set( "graveyard_hear_that" );
    level thread maps\_utility::function_stack( maps\_utility::radio_dialogue, "scoutsniper_mcm_hearthat" );
    var_1 = maps\_vehicle::spawn_vehicle_from_targetname_and_drive( "field_hind" );
    maps\_wibble::wibble_add_heli_to_track( var_1 );
    var_2 = getent( "hind_restart_avm", "script_noteworthy" );
    var_1 thread maps\scoutsniper_aud::aud_start_graveyard_heli_scripted_sequence( var_2 );
    level.hind = var_1;
    common_scripts\utility::flag_set( "graveyard_hind_ready" );
    var_1 endon( "death" );
    var_1 thread graveyard_hind_death_dialogue();
    var_1 thread graveyard_hind_spot_enemy();
    var_1 thread graveyard_hind_spot_behavior();
    var_1 thread graveyard_hind_detect_damage();
    var_1 thread maps\scoutsniper_code::graveyard_hind_stinger_logic();
    common_scripts\utility::flag_wait( "_stealth_spotted" );
    var_1 thread graveyard_hind_attack_enemy();
}

graveyard_hind_spot_behavior()
{
    self endon( "death" );

    if ( common_scripts\utility::flag( "_stealth_spotted" ) )
        return;

    level endon( "_stealth_spotted" );
    self waittill( "enemy" );
    thread maps\scoutsniper_code::graveyard_hind_find_best_perimeter( "graveyard_hind_circle_path", 1 );
    level thread maps\_utility::function_stack( maps\_utility::radio_dialogue, "scoutsniper_mcm_circlingback" );
    self waittill( "enemy" );
    common_scripts\utility::flag_set( "_stealth_spotted" );
    var_0 = level.player.origin;
    maps\_stealth_behavior::enemy_announce_spotted_bring_team( var_0 );
}

graveyard_hind_spot_enemy()
{
    self endon( "death" );

    if ( common_scripts\utility::flag( "_stealth_spotted" ) )
        return;

    level endon( "_stealth_spotted" );
    var_0 = getent( "graveyard_inside_church_trig", "targetname" );
    var_1 = 0;
    var_2 = 0.05;

    for (;;)
    {
        wait(var_2);

        if ( level.player istouching( var_0 ) )
            continue;

        var_3 = 1300;
        var_4 = level.player.origin;
        var_5 = ( self.origin[0], self.origin[1], var_4[2] );
        var_6 = length( level.player getvelocity() );
        var_7 = var_6 > 10 && level.player._stealth.logic.stance == "crouch";
        var_8 = var_6 > 25 && level.player._stealth.logic.stance == "prone";

        if ( distance( var_4, var_5 ) < var_3 && ( var_7 || var_8 ) )
        {
            var_1 += var_2;

            if ( var_1 < 0.5 )
                continue;

            var_9 = bullettrace( self.origin + ( 0.0, 0.0, -128.0 ), level.player.origin, 1, level.price );

            if ( !isdefined( var_9["entity"] ) || !isplayer( var_9["entity"] ) )
                continue;
        }
        else if ( level.player._stealth.logic.stance == "prone" || level.player._stealth.logic.stance == "crouch" )
        {
            var_1 = 0;
            continue;
        }
        else
        {
            var_1 = 0;
            var_10 = level.player.maxvisibledist;
            var_10 += 3500;

            if ( distance( self.origin, level.player.origin ) > var_10 )
                continue;

            var_9 = bullettrace( self.origin + ( 0.0, 0.0, -128.0 ), level.player.origin, 1, level.price );

            if ( !isdefined( var_9["entity"] ) || !isplayer( var_9["entity"] ) )
                continue;
        }

        self notify( "enemy" );
        level.disablepassby = 1;
        var_1 = 0;
        var_11 = distance( self.origin, level.player.origin ) * 0.0005;
        var_12 = 0.5 + var_11;
        wait(var_12);
    }
}

graveyard_hind_kill_body( var_0 )
{
    maps\_utility::add_wait( maps\_utility::waittill_msg, "death" );
    level maps\_utility::add_wait( maps\_utility::waittill_msg, "_stealth_spotted" );
    maps\_utility::do_wait_any();

    if ( isdefined( self ) )
        self show();

    if ( isdefined( var_0 ) )
        var_0 delete();
}

graveyard_hind_attack_enemy()
{
    self endon( "death" );
    thread maps\scoutsniper_code::graveyard_hind_find_best_perimeter( "graveyard_hind_circle_path" );
    wait 1;
    thread maps\scoutsniper_code::chopper_ai_mode( level.player );
    thread maps\scoutsniper_code::chopper_ai_mode_missiles( level.player );
}

field_main()
{
    if ( !isalive( level.price ) )
        return;

    level.price endon( "death" );
    common_scripts\utility::flag_wait( "initial_setup_done" );
    thread field_handle_enemys();
    thread maps\scoutsniper_code::field_handle_special_nodes();
    thread field_handle_flags();
    thread maps\scoutsniper_code::field_handle_cleanup();
    common_scripts\utility::flag_wait( "field" );
    common_scripts\utility::flag_waitopen( "_stealth_spotted" );
    common_scripts\utility::flag_waitopen( "_stealth_event" );
    maps\scoutsniper_code::try_save( "field" );
    level.price allowedstances( "stand", "crouch", "prone" );
    level.price thread field_getdown();
    level.price thread field_handle_price_spotted();

    while ( !common_scripts\utility::flag( "price_reach_field" ) )
    {
        level.price field_moveup();

        if ( isdefined( level.hind ) )
            common_scripts\utility::flag_wait( "graveyard_hind_down" );

        common_scripts\utility::flag_waitopen( "_stealth_spotted" );
        common_scripts\utility::flag_waitopen( "_stealth_event" );
    }

    level.price field_moveup2();
    level.price thread scoutsniper_cleanup_field_prone_transitions();
    level.price thread field_creep();
    level.disablepassby = undefined;
}

field_handle_price_spotted()
{
    level endon( "field_price_done" );
    level.player endon( "death" );
    level.price endon( "death" );
    common_scripts\utility::flag_wait_any( "field_spawn", "price_reach_field" );
    common_scripts\utility::flag_wait( "_stealth_spotted" );
    wait 10;
    maps\_utility::stop_magic_bullet_shield();
    self kill();
}

field_endmission()
{
    common_scripts\utility::flag_wait( "field_close_church_door" );

    if ( common_scripts\utility::flag( "_stealth_spotted" ) && distance( level.player.origin, level.price.origin ) > 1500 )
        level thread maps\_utility::function_stack( maps\_utility::radio_dialogue, "scoutsniper_mcm_ateam" );

    common_scripts\utility::flag_wait_any( "field_spawn", "price_reach_field" );

    if ( common_scripts\utility::flag( "_stealth_spotted" ) && distance( level.player.origin, level.price.origin ) > 3500 )
        maps\scoutsniper_code::price_left_behind();
}

field_handle_flags()
{
    var_0 = getent( "field_price_getdown", "targetname" );
    var_0 waittill( "trigger" );
    common_scripts\utility::flag_set( "field_getdown" );
}

field_road()
{
    if ( common_scripts\utility::flag( "_stealth_spotted" ) )
        return;

    level endon( "_stealth_spotted" );

    if ( common_scripts\utility::flag( "field_player_way_ahead" ) )
        return;

    level endon( "field_player_way_ahead" );
    var_0 = getnode( "field_before_road_node", "targetname" );
    maps\_utility::delaythread( 0.25, maps\scoutsniper_code::dynamic_run_speed );
    maps\scoutsniper_code::scoutsniper_follow_path( var_0 );
    self notify( "stop_dynamic_run_speed" );
    level thread maps\_utility::function_stack( maps\_utility::radio_dialogue, "scoutsniper_mcm_stop" );
    wait 2;
    level maps\_utility::function_stack( maps\_utility::radio_dialogue, "scoutsniper_mcm_clearleft" );
    level maps\_utility::function_stack( maps\_utility::radio_dialogue, "scoutsniper_mcm_clearright" );
    level maps\_utility::function_stack( maps\_utility::radio_dialogue, "scoutsniper_mcm_staylow2" );
    level maps\_utility::function_stack( maps\_utility::radio_dialogue, "scoutsniper_mcm_go" );
    var_0 = getnode( "field_after_road_node", "targetname" );
    var_0 maps\_anim::anim_generic_reach( level.price, "pronehide_dive" );
    self allowedstances( "prone" );
    maps\_anim::anim_generic_custom_animmode( self, "gravity", "pronehide_dive" );
    self setgoalpos( self.origin );
    wait 1;
    level maps\_utility::function_stack( maps\_utility::radio_dialogue, "scoutsniper_mcm_areaclear" );
    self allowedstances( "stand", "crouch" );
    maps\_stealth_behavior::friendly_spotted_getup_from_prone();
}

field_moveup()
{
    if ( common_scripts\utility::flag( "_stealth_spotted" ) )
        return;

    level endon( "_stealth_spotted" );
    level endon( "field_cutting_it_close" );
    var_0 = getent( "field_price_node1", "targetname" );
    var_1 = getdvarfloat( "scoutsniper_macmillan_sprintwait_field", 4 );
    maps\_utility::delaythread( var_1, maps\scoutsniper_code::dynamic_run_speed );
    thread maps\scoutsniper_code::scoutsniper_follow_path( var_0 );
    self pushplayer( 1 );
    var_0 = getent( "field_price_stop_dynamic", "targetname" );
    var_0 waittill( "trigger" );
    self notify( "stop_dynamic_run_speed" );
    waittillframeend;
    self.moveplaybackrate = 1;

    if ( isdefined( level.hind ) )
        level.hind delete();

    common_scripts\utility::flag_set( "price_reach_field" );
}

field_custom_stop()
{
    self.a.pose = "prone";
    self.a.movement = "stop";
}

field_custom_prone_to_prone()
{
    self.a.movement = "run";
}

field_moveup2()
{
    if ( common_scripts\utility::flag( "_stealth_spotted" ) )
        return;

    level endon( "_stealth_spotted" );
    level endon( "field_cutting_it_close" );
    var_0 = getent( "field_price_decide_start", "targetname" );
    var_0 waittill( "trigger" );
    common_scripts\utility::flag_set( "field_start" );
    self waittill( "scoutsniper_path_end_reached" );
    self allowedstances( "prone" );
    maps\_anim::anim_generic_custom_animmode( self, "gravity", "pronehide_dive", undefined, undefined, 1 );
    self.custom_animscript["stop"] = ::field_custom_stop;
    self.custompronetopronetransitionfunc = ::field_custom_prone_to_prone;
    thread maps\_utility::flag_set_delayed( "prone_hint", 2 );
}

field_getdown()
{
    common_scripts\utility::flag_wait( "field_getdown" );
    maps\scoutsniper_code::try_save( "field2" );

    if ( !common_scripts\utility::flag( "_stealth_spotted" ) )
        level thread maps\_utility::function_stack( maps\_utility::radio_dialogue, "scoutsniper_mcm_getdown" );

    maps\_utility::delaythread( 1, maps\scoutsniper_code::scoutsniper_music_play, "scoutsniper_surrounded_music" );
    level.play_additionnal_fs_sfx = 1;
}

scoutsniper_cleanup_field_prone_transitions()
{
    wait 2.0;
    self.custom_animscript["stop"] = undefined;
    self.custompronetopronetransitionfunc = undefined;
}

field_creep()
{
    if ( common_scripts\utility::flag( "_stealth_spotted" ) )
        return;

    level endon( "_stealth_spotted" );
    var_0 = getent( "field_price_prone_node", "targetname" );
    thread maps\scoutsniper_code::scoutsniper_follow_path( var_0 );
    maps\_utility::delaythread( 12, ::field_creep_dialogue );
    self.moveplaybackrate = 1;
    wait 18;
    self.moveplaybackrate = 0.9;
    wait 2;
    self.moveplaybackrate = 0.8;
    wait 2;
    self.moveplaybackrate = 0.7;
    wait 2;
    self.moveplaybackrate = 0.6;
    wait 2;
    self.moveplaybackrate = 0.5;
    common_scripts\utility::flag_wait( "field_price_prone_first_stop" );
    thread maps\_stealth_behavior::friendly_stance_handler_stay_still();
    wait 40;
    maps\_stealth_behavior::friendly_stance_handler_resume_path();
    wait 0.5;
    self.moveplaybackrate = 0.6;
    wait 0.5;
    self.moveplaybackrate = 0.7;
    wait 0.5;
    self.moveplaybackrate = 0.8;
    wait 0.5;
    self.moveplaybackrate = 0.9;
    wait 0.4;
    self.moveplaybackrate = 1;
    thread maps\_stealth_behavior::friendly_stance_handler_stay_still();
    maps\scoutsniper_code::field_waittill_player_passed_guards();
    level thread maps\_utility::function_stack( maps\_utility::radio_dialogue, "scoutsniper_mcm_niceandslow" );
    maps\scoutsniper_code::field_waittill_player_near_price();
    maps\_stealth_behavior::friendly_stance_handler_resume_path();
    wait 0.5;
    maps\_utility::ent_flag_set( "_stealth_stance_handler" );
    var_0 = getent( "field_price_clear", "targetname" );
    var_0 waittill( "trigger" );
    maps\_utility::ent_flag_clear( "_stealth_stance_handler" );
    self allowedstances( "prone", "crouch", "stand" );
    common_scripts\utility::flag_set( "field_price_done" );
    level.play_additionnal_fs_sfx = undefined;
}

field_creep_dialogue()
{
    if ( common_scripts\utility::flag( "_stealth_spotted" ) )
        return;

    level endon( "_stealth_spotted" );
    level maps\_utility::function_stack( maps\_utility::radio_dialogue, "scoutsniper_mcm_holdyourfire" );
    wait 3;
    level maps\_utility::function_stack( maps\_utility::radio_dialogue, "scoutsniper_mcm_anticipatepaths" );
    wait 2;
    level maps\_utility::function_stack( maps\_utility::radio_dialogue, "scoutsniper_mcm_slowandsteady" );
}

field_creep_player()
{
    if ( common_scripts\utility::flag( "_stealth_spotted" ) )
        return;

    level endon( "_stealth_spotted" );

    if ( common_scripts\utility::flag( "pond" ) )
        return;

    level endon( "pond" );
    thread field_creep_player_cleanup();
    var_0 = [];
    var_0["stand"] = 2;
    var_0["crouch"] = 1;
    var_0["prone"] = 0.5;
    level.player maps\_stealth_logic::stealth_friendly_movespeed_scale_set( var_0, var_0 );
}

field_creep_player_cleanup()
{
    common_scripts\utility::flag_wait_either( "_stealth_spotted", "pond" );
    level.player maps\_stealth_logic::stealth_friendly_movespeed_scale_default();
}

field_handle_enemys()
{
    var_0 = maps\_vehicle::spawn_vehicle_from_targetname( "bmp1" );
    var_1 = maps\_vehicle::spawn_vehicle_from_targetname( "bmp2" );
    var_2 = maps\_vehicle::spawn_vehicle_from_targetname( "bmp3" );
    var_3 = maps\_vehicle::spawn_vehicle_from_targetname( "bmp4" );
    level.bmps = [];
    level.bmps[level.bmps.size] = var_0;
    level.bmps[level.bmps.size] = var_1;
    level.bmps[level.bmps.size] = var_2;
    level.bmps[level.bmps.size] = var_3;

    for ( var_4 = 0; var_4 < level.bmps.size; var_4++ )
    {
        level.bmps[var_4] maps\scoutsniper_code::field_bmp_make_followme();
        level.bmps[var_4] thread maps\scoutsniper_code::field_bmp_quake();
        level.bmps[var_4] thread maps\scoutsniper_code::execvehiclestealthdetection();
        level.bmps[var_4] thread maps\scoutsniper_code::bmp_field_start_running_detection();
        level.bmps[var_4] maps\scoutsniper_aud::aud_field_bmp_engine_handle();
    }

    var_5 = [];
    var_5["hidden"] = maps\scoutsniper_code::dash_state_hidden;
    var_5["alert"] = maps\_stealth_behavior::enemy_state_alert;
    var_5["spotted"] = maps\_stealth_behavior::enemy_state_spotted;
    var_6 = [];
    var_6["heard_scream"] = maps\scoutsniper_code::field_enemy_awareness;
    var_6["explode"] = maps\scoutsniper_code::field_enemy_awareness;
    var_7 = [];
    var_7["saw"] = maps\scoutsniper_code::field_enemy_awareness;
    var_7["found"] = maps\scoutsniper_code::field_enemy_awareness;
    common_scripts\utility::array_thread5( getentarray( "field_guard", "script_noteworthy" ), maps\_utility::add_spawn_function, maps\_stealth_logic::stealth_ai, var_5, undefined, var_7, var_6 );
    common_scripts\utility::array_thread5( getentarray( "field_guard2", "script_noteworthy" ), maps\_utility::add_spawn_function, maps\_stealth_logic::stealth_ai, var_5, undefined, var_7, var_6 );
    common_scripts\utility::array_thread( getentarray( "field_guard", "script_noteworthy" ), maps\_utility::add_spawn_function, ::field_enemy_think );
    common_scripts\utility::array_thread( getentarray( "field_guard2", "script_noteworthy" ), maps\_utility::add_spawn_function, ::field_enemy_think );
    common_scripts\utility::flag_wait_any( "field_spawn", "price_reach_field" );

    if ( !common_scripts\utility::flag( "_stealth_spotted" ) )
        maps\_utility::battlechatter_off( "axis" );

    thread maps\scoutsniper_code::scripted_array_spawn( "field_guard2", "script_noteworthy", 1 );
    thread maps\scoutsniper_code::scripted_array_spawn( "field_guard", "script_noteworthy", 1 );
    common_scripts\utility::flag_wait( "field_start" );
    soundscripts\_snd::snd_message( "start_field_mix" );
    thread field_bmps_stop();
    thread maps\_vehicle::gopath( var_0 );
    maps\_utility::delaythread( 1, maps\_vehicle::gopath, var_1 );
    maps\_utility::delaythread( 3, maps\_vehicle::gopath, var_2 );
    maps\_utility::delaythread( 3.5, maps\_vehicle::gopath, var_3 );
    var_8 = maps\_utility::get_living_ai_array( "field_guard", "script_noteworthy" );

    for ( var_4 = 0; var_4 < var_8.size; var_4++ )
    {
        if ( issubstr( var_8[var_4].target, "bmp" ) )
        {
            var_8[var_4] thread maps\scoutsniper_code::field_enemy_walk_behind_bmp();
            continue;
        }

        var_8[var_4] thread maps\_patrol::patrol();
        var_8[var_4] maps\_utility::ent_flag_set( "field_walk" );
    }

    wait 11;
    var_8 = maps\_utility::get_living_ai_array( "field_guard2", "script_noteworthy" );

    for ( var_4 = 0; var_4 < var_8.size; var_4++ )
    {
        if ( issubstr( var_8[var_4].target, "bmp" ) )
        {
            var_8[var_4] thread maps\scoutsniper_code::field_enemy_walk_behind_bmp();
            continue;
        }

        var_8[var_4] thread maps\_patrol::patrol();
        var_8[var_4] maps\_utility::ent_flag_set( "field_walk" );
    }

    level endon( "_stealth_spotted" );
    wait 140;
    thread maps\scoutsniper_aud::aud_field_handle_bmps_engine();
    common_scripts\utility::flag_set( "field_start_running" );

    for ( var_4 = 0; var_4 < level.bmps.size; var_4++ )
        level.bmps[var_4] thread bmp_badplace( var_4 );
}

bmp_badplace( var_0 )
{
    var_1 = "tank" + var_0;
    var_2 = isdefined( level.vehicle_hasmainturret[self.model] ) && level.vehicle_hasmainturret[self.model];
    var_3 = 0.25;
    var_4 = 300;
    var_5 = 17;
    var_6 = 17;
    var_7 = 150;

    for (;;)
    {
        if ( var_2 )
            var_8 = anglestoforward( self gettagangles( "tag_turret" ) );
        else
            var_8 = anglestoforward( self.angles );

        badplace_arc( var_1, var_3, self.origin, var_7 * 1.9, var_4, var_8, var_5, var_6, "allies", "axis" );
        badplace_cylinder( var_1, var_3, self.origin, var_7, var_4, "allies", "axis" );
        wait(var_3 + 0.05);
    }
}

field_bmps_stop()
{
    level endon( "dash_spawn" );
    common_scripts\utility::flag_wait( "field_stop_bmps" );

    for ( var_0 = 0; var_0 < level.bmps.size; var_0++ )
    {
        if ( isdefined( level.bmps[var_0] ) )
        {
            level.bmps[var_0] vehicle_setspeed( 0, 5 );
            level.bmps[var_0] thread maps\scoutsniper_aud::aud_field_bmp_to_idle();
        }
    }
}

field_enemy_custom_patrol_anim( var_0 )
{
    if ( !isdefined( level.field_patrol_anims ) )
    {
        level.field_patrol_anims = [];
        level.field_patrol_anims = common_scripts\utility::array_add( level.field_patrol_anims, "h1_patrol_walk_01" );
        level.field_patrol_anims = common_scripts\utility::array_add( level.field_patrol_anims, "h1_patrol_walk_02" );
        level.field_patrol_anims = common_scripts\utility::array_add( level.field_patrol_anims, "h1_patrol_walk_03" );
        level.field_patrol_anims = common_scripts\utility::array_add( level.field_patrol_anims, "h1_patrol_walk_04" );
        level.field_patrol_anims = common_scripts\utility::array_add( level.field_patrol_anims, "h1_patrol_walk_05" );
        level.field_patrol_anims = common_scripts\utility::array_add( level.field_patrol_anims, "patrol_walk" );
    }

    var_1 = common_scripts\utility::mod( var_0, level.field_patrol_anims.size );
    return level.field_patrol_anims[var_1];
}

field_enemy_think()
{
    self endon( "death" );
    maps\_utility::ent_flag_init( "field_walk" );
    thread maps\scoutsniper_code::field_enemy_avoid_bmp();
    thread field_enemy_think2();
    thread maps\scoutsniper_code::field_enemy_death();
    self.ignoreme = 1;

    if ( getdvarint( "field_patrol_original" ) == 0 )
    {
        if ( isdefined( self.export ) )
            self.patrol_walk_anim = field_enemy_custom_patrol_anim( self.export );
        else
            self.patrol_walk_anim = "patrol_walk";

        if ( self.patrol_walk_anim == "patrol_walk" )
            self.patrol_walk_twitch = "patrol_walk_twitch";
    }

    waittillframeend;
    maps\_stealth_behavior::ai_change_behavior_function( "alert", "alerted_once", maps\scoutsniper_code::field_enemy_alert_level_1 );
    maps\_stealth_behavior::ai_change_behavior_function( "alert", "alerted_again", maps\scoutsniper_code::field_enemy_alert_level_2 );
    thread maps\scoutsniper_code::field_enemy_patrol_thread();
    wait 0.05;
    self setgoalpos( self.origin );
    self.goalradius = 4;
    wait 0.05;
    self.fixednode = 0;
    common_scripts\utility::flag_wait( "field_start" );
    var_0 = getent( "field_turn_around_trig", "targetname" );

    for (;;)
    {
        var_0 waittill( "trigger", var_1 );

        if ( var_1 == self )
            break;
    }

    maps\_stealth_behavior::ai_change_behavior_function( "alert", "alerted_once", maps\_stealth_behavior::enemy_alert_level_alerted_again );
    maps\_stealth_behavior::ai_change_behavior_function( "alert", "alerted_again", maps\_stealth_behavior::enemy_alert_level_alerted_again );
    var_2 = 700;
    var_3 = var_2 * var_2;

    for (;;)
    {
        if ( distancesquared( level.player.origin, self.origin ) < var_3 )
            break;

        wait 0.25;
    }

    self.favoriteenemy = level.player;
}

field_enemy_think2()
{
    level endon( "field_stop_bmps" );
    self endon( "death" );
    common_scripts\utility::flag_wait( "field_start_running" );
    self notify( "_stealth_stop_stealth_logic" );
    self notify( "_stealth_stop_corpse_logic" );
    self notify( "end_patrol" );

    if ( getdvar( "old_field_enemy_run" ) == "1" )
    {
        if ( self.export == 47 )
            wait 2;
    }
    else
        field_enemy_wait_to_run();

    var_0 = getnode( "field_endup_node", "targetname" );
    self setgoalnode( var_0 );
    self.goalradius = 64;
    maps\_utility::clear_run_anim();
    maps\scoutsniper_code::waitontruegoal( var_0 );
    self delete();
}

field_enemy_wait_to_run()
{
    if ( !isdefined( self.export ) )
        return;

    var_0 = 0;

    switch ( self.export )
    {
        case 47:
        case 60:
        case 61:
        case 62:
            var_0 = 0;
            break;
        case 41:
            var_0 = 0.6;
            break;
        case 55:
            var_0 = 1.2;
            break;
        case 46:
            var_0 = 1.8;
            break;
        case 39:
        case 49:
        case 53:
        case 59:
            var_0 = 2.4;
            break;
        case 56:
            var_0 = 3.0;
            break;
        case 45:
        case 51:
        case 57:
        case 58:
        case 63:
            var_0 = 3.6;
            break;
        case 54:
            var_0 = 4.8;
            break;
        case 40:
            var_0 = 5.4;
            break;
        case 42:
        case 50:
            var_0 = 7.0;
            break;
        case 48:
            var_0 = 9.0;
            break;
        default:
            var_0 = 0;
            break;
    }

    wait(var_0);
}

disable_cqb_and_start_stealth_stance()
{
    level.price maps\_utility::disable_cqbwalk();

    if ( !common_scripts\utility::flag( "pond_enemies_dead" ) )
        level.price maps\_utility::ent_flag_set( "_stealth_stance_handler" );
}

pond_main()
{
    if ( !isalive( level.price ) )
        return;

    level.price endon( "death" );
    var_0 = [];
    var_0["heard_scream"] = maps\scoutsniper_code::field_enemy_awareness;
    var_0["explode"] = maps\scoutsniper_code::field_enemy_awareness;
    var_1 = [];
    var_1["saw"] = maps\scoutsniper_code::field_enemy_awareness;
    var_1["found"] = maps\scoutsniper_code::field_enemy_awareness;
    common_scripts\utility::array_thread5( getentarray( "pond_patrol", "script_noteworthy" ), maps\_utility::add_spawn_function, maps\_stealth_logic::stealth_ai, undefined, undefined, var_1, var_0 );
    common_scripts\utility::array_thread5( getentarray( "pond_throwers", "script_noteworthy" ), maps\_utility::add_spawn_function, maps\_stealth_logic::stealth_ai, undefined, undefined, var_1, var_0 );
    common_scripts\utility::array_thread( getentarray( "pond_throwers", "script_noteworthy" ), maps\_utility::add_spawn_function, maps\scoutsniper_code::mission_dialogue_kill );
    common_scripts\utility::array_thread5( getentarray( "pond_backup", "script_noteworthy" ), maps\_utility::add_spawn_function, maps\_stealth_logic::stealth_ai, undefined, undefined, var_1, var_0 );
    common_scripts\utility::array_thread( getentarray( "pond_backup", "script_noteworthy" ), maps\_utility::add_spawn_function, maps\scoutsniper_code::mission_dialogue_kill );
    common_scripts\utility::array_thread( getentarray( "pond_backup", "script_noteworthy" ), maps\_utility::add_spawn_function, common_scripts\utility::flag_set, "pond_backup_spawned" );
    common_scripts\utility::array_thread( getentarray( "pond_patrol", "script_noteworthy" ), maps\_utility::add_spawn_function, ::pond_patrol );
    common_scripts\utility::array_thread( getentarray( "pond_throwers", "script_noteworthy" ), maps\_utility::add_spawn_function, ::pond_thrower );
    common_scripts\utility::array_thread( getentarray( "pond_patrol", "script_noteworthy" ), maps\_utility::add_spawn_function, maps\scoutsniper_code::alert_on_grenade_body_impact );
    common_scripts\utility::array_thread( getentarray( "pond_throwers", "script_noteworthy" ), maps\_utility::add_spawn_function, maps\scoutsniper_code::alert_on_grenade_body_impact );
    thread pond_handle_kills( "pond_patrol_spawned", "pond_patrol", "pond_patrol_dead", "scoutsniper_mcm_toppedhim" );
    thread pond_handle_kills( "pond_thrower_spawned", "pond_throwers", "pond_thrower_dead", "scoutsniper_mcm_goodnight" );
    thread pond_handle_clear();
    thread maps\scoutsniper_code::pond_handle_backup();
    thread maps\scoutsniper_code::pond_handle_behavior_change();
    thread maps\scoutsniper_code::pond_dump_bodies();
    thread pond_card_game();
    common_scripts\utility::flag_wait( "initial_setup_done" );
    common_scripts\utility::flag_wait( "pond" );
    soundscripts\_snd::snd_message( "start_pond_mix" );
    thread maps\_stealth_behavior::default_event_awareness( maps\scoutsniper_code::default_event_awareness_dialogue );
    level.player._stealth_move_detection_cap = 0;
    level.price maps\_utility::ent_flag_init( "pond_in_position" );
    common_scripts\utility::flag_wait( "field_price_done" );
    maps\scoutsniper_code::try_save( "pond" );
    level.price pond_moveup();
    common_scripts\utility::trigger_on( "field_clean", "script_noteworthy" );

    if ( isalive( level.price ) && !isdefined( level.price.magic_bullet_shield ) )
        level.price maps\_utility::delaythread( 0.1, maps\_utility::magic_bullet_shield );

    level.price pond_betterview();
    level.player._stealth_move_detection_cap = undefined;
    maps\scoutsniper_code::try_save( "pond2" );
    level.price allowedstances( "prone", "crouch", "stand" );
    level.price maps\_utility::enable_cqbwalk();
    level.price thread pond_kill_patrol();
    level.price thread pond_kill_thrower();
    maps\_utility::delaythread( 1.0, ::disable_cqb_and_start_stealth_stance );
    level.price pond_sneakup();
    maps\scoutsniper_code::try_save( "pond3" );
    level.price pond_inposition();

    if ( common_scripts\utility::flag( "pond_enemies_dead" ) )
    {
        level.price maps\_utility::ent_flag_clear( "_stealth_stance_handler" );
        level.price allowedstances( "prone", "crouch", "stand" );
    }

    level.price maps\_utility::disable_cqbwalk();

    if ( common_scripts\utility::flag( "_stealth_spotted" ) || common_scripts\utility::flag( "_stealth_event" ) )
    {
        common_scripts\utility::flag_waitopen( "_stealth_spotted" );
        common_scripts\utility::flag_waitopen( "_stealth_event" );
        common_scripts\utility::flag_waitopen( "_stealth_alert" );

        if ( level.player.health > 0 )
            level thread maps\_utility::function_stack( maps\_utility::radio_dialogue, "scoutsniper_mcm_thewordstealth" );
    }
    else
    {
        common_scripts\utility::flag_wait_either( "pond_enemies_dead", "cargo" );

        if ( common_scripts\utility::flag( "pond_enemies_dead" ) )
        {
            level.price maps\_utility::ent_flag_clear( "_stealth_stance_handler" );
            level.price allowedstances( "prone", "crouch", "stand" );
        }

        if ( common_scripts\utility::flag( "pond_enemies_dead" ) )
            level thread maps\_utility::function_stack( maps\_utility::radio_dialogue, "scoutsniper_mcm_moveup" );
        else if ( distance( level.player.origin, level.price.origin ) > 256 )
            level thread maps\_utility::function_stack( maps\_utility::radio_dialogue, "scoutsniper_mcm_ateam" );
        else
            level thread maps\_utility::function_stack( maps\_utility::radio_dialogue, "scoutsniper_mcm_moveup" );
    }

    level.price.script_pushable = 0;
    common_scripts\utility::flag_set( "cargo" );
    level.price.enableproneexitnode = undefined;
    level.price.enablepronetocombattransition = undefined;
}

pond_card_game()
{
    common_scripts\utility::flag_wait( "pond_backup_spawned" );
    level endon( "dash" );
    level endon( "_stealth_spotted" );
    level endon( "_stealth_found_corpse" );
    wait 1;
    var_0 = [];
    var_0[var_0.size] = "scoutsniper_ru1_fivedollars";
    var_0[var_0.size] = "scoutsniper_ru4_twentydollars";
    var_0[var_0.size] = "scoutsniper_ru1_pairofjacks";
    var_0[var_0.size] = "scoutsniper_ru4_threekings";
    var_0[var_0.size] = "scoutsniper_ru2_youidiot";
    var_0[var_0.size] = "scoutsniper_ru4_wellplayedcomrade";
    var_0[var_0.size] = "scoutsniper_ru1_ownmoney";
    var_0[var_0.size] = "scoutsniper_ru4_seeaboutthat";
    var_0[var_0.size] = "scoutsniper_ru2_call";
    var_0[var_0.size] = "scoutsniper_ru4_raise";
    var_0[var_0.size] = "scoutsniper_ru4_ifold";
    var_0[var_0.size] = "scoutsniper_ru1_cantbelieve";
    var_0[var_0.size] = "scoutsniper_ru1_paytheman";
    var_1 = maps\_utility::get_living_ai_array( "pond_backup", "script_noteworthy" );
    var_2 = 300;
    var_3 = var_2 * var_2;

    if ( !isalive( var_1[0] ) )
        return;

    var_1[0] endon( "death" );

    while ( distancesquared( var_1[0].origin, level.player.origin ) > var_3 )
        wait 0.2;

    maps\scoutsniper_code::mission_dialogue_array( var_1, var_0 );
}

pond_patrol()
{
    common_scripts\utility::flag_set( "pond_patrol_spawned" );
    self.ignoreme = 1;
    self waittill( "jumpedout" );

    if ( !isalive( self ) )
        return;

    self.goalradius = 4;
    self setgoalpos( self.origin );

    if ( common_scripts\utility::flag( "_stealth_spotted" ) )
        return;

    level endon( "_stealth_spotted" );
    common_scripts\utility::flag_wait( "field_price_done" );

    if ( !isalive( self ) )
        return;

    thread maps\_patrol::patrol();

    while ( isalive( self ) )
    {
        self waittill( "damage", var_0, var_1 );

        if ( var_1 == level.price && isalive( self ) )
            self kill( level.price.origin );
    }
}

pond_thrower()
{
    common_scripts\utility::flag_set( "pond_thrower_spawned" );
    self.ignoreme = 1;
    self waittill( "jumpedout" );

    if ( common_scripts\utility::flag( "_stealth_spotted" ) )
        return;

    level endon( "_stealth_spotted" );

    while ( isalive( self ) )
    {
        self waittill( "damage", var_0, var_1 );

        if ( var_1 == level.price && isalive( self ) )
            self kill( level.price.origin );
    }
}

pond_moveup()
{
    if ( common_scripts\utility::flag( "_stealth_spotted" ) )
        return;

    level endon( "_stealth_spotted" );

    if ( common_scripts\utility::flag( "pond_enemies_dead" ) )
        return;

    level endon( "pond_enemies_dead" );

    if ( common_scripts\utility::flag( "cargo" ) )
        return;

    level endon( "cargo" );
    self pushplayer( 1 );
    level thread maps\_utility::function_stack( maps\_utility::radio_dialogue, "scoutsniper_mcm_followme2" );
    var_0 = getnode( "pond_price_moveup_node", "targetname" );
    self.ref_node.origin = var_0.origin;
    self.ref_node.angles = var_0.angles;
    self setgoalnode( var_0 );
    self.goalradius = level.macmillan_exposed_cqb_radius;
    self waittill( "goal" );
    wait 1;
    self.ref_node thread maps\_anim::anim_generic( self, "look_up_stand" );
    self.ref_node waittill( "look_up_stand" );
    thread pond_price_hack();
    thread maps\_anim::anim_generic_loop( self, "look_idle_stand", undefined, "stop_loop" );
    maps\_utility::delaythread( 0.1, maps\scoutsniper_code::scoutsniper_music_loop, "scoutsniper_deadpool_music", 119, "dash_spawn" );
    level maps\_utility::function_stack( maps\_utility::radio_dialogue, "scoutsniper_mcm_buyout" );
    var_1 = [];
    var_1[var_1.size] = "scoutsniper_ru2_sendsomeonetocheck";
    var_1[var_1.size] = "scoutsniper_ru4_thisonesheavy";
    var_1[var_1.size] = "scoutsniper_ru2_andreibringingfood";
    var_1[var_1.size] = "scoutsniper_ru4_didnteatbreakfast";
    var_1[var_1.size] = "scoutsniper_ru2_quicklyaspossible";
    var_1[var_1.size] = "scoutsniper_ru4_takenzakhaevsoffer";
    var_2 = maps\_utility::get_living_ai_array( "pond_throwers", "script_noteworthy" );

    if ( var_2.size == 2 )
        maps\scoutsniper_code::mission_dialogue_array( var_2, var_1 );

    self notify( "stop_loop" );
    thread maps\_anim::anim_generic( self, "look_down_stand" );
    self waittill( "look_down_stand" );
    level thread maps\_utility::function_stack( maps\_utility::radio_dialogue, "scoutsniper_mcm_betterview" );
    wait 1;
}

pond_price_hack()
{
    self endon( "stop_loop" );
    level endon( "_stealth_spotted" );
    common_scripts\utility::flag_wait( "cargo" );
    self notify( "stop_loop" );
}

pond_betterview()
{
    if ( common_scripts\utility::flag( "_stealth_spotted" ) )
        return;

    if ( common_scripts\utility::flag( "pond_enemies_dead" ) )
        return;

    level endon( "pond_enemies_dead" );
    level endon( "_stealth_spotted" );

    if ( common_scripts\utility::flag( "cargo" ) )
        return;

    level endon( "cargo" );
    level endon( "event_awareness" );
    var_0 = getnode( "price_pond_better_node", "targetname" );
    self.ref_node.origin = var_0.origin;
    self.ref_node.angles = var_0.angles + ( 0.0, 90.0, 0.0 );
    self.disablearrivals = 0;
    self setgoalnode( var_0 );
    self.goalradius = 100;
    wait 1;
    self allowedstances( "crouch" );
    self waittill( "goal" );
    self allowedstances( "crouch", "stand" );
    self setgoalnode( var_0 );
    self.goalradius = level.macmillan_exposed_cqb_radius;
    self waittill( "goal" );
    common_scripts\utility::waittill_any_timeout( 1.0, "cover_arrival_finished" );
    self.ref_node thread maps\_anim::anim_generic( self, "alert2look_cornerL" );
    self.ref_node waittill( "alert2look_cornerL" );
    thread maps\_anim::anim_generic_loop( self, "look_idle_cornerL", undefined, "stop_loop" );
    level maps\_utility::function_stack( maps\_utility::radio_dialogue, "scoutsniper_mcm_withoutalerting" );
    level thread maps\_utility::function_stack( maps\_utility::radio_dialogue, "scoutsniper_mcm_sneakingpast" );
    self notify( "stop_loop" );
    thread maps\_anim::anim_generic( self, "look2alert_cornerL" );
    self waittill( "look2alert_cornerL" );
    level maps\_utility::function_stack( maps\_utility::radio_dialogue, "scoutsniper_mcm_yourcall2" );
}

pond_sneakup()
{
    if ( common_scripts\utility::flag( "_stealth_spotted" ) )
        return;

    level endon( "_stealth_spotted" );

    if ( common_scripts\utility::flag( "pond_enemies_dead" ) )
        return;

    level endon( "pond_enemies_dead" );

    if ( common_scripts\utility::flag( "pond_patrol_dead" ) )
        return;

    level endon( "pond_patrol_dead" );

    if ( common_scripts\utility::flag( "cargo" ) )
        return;

    level endon( "cargo" );

    while ( distance( level.player.origin, self.origin ) < 96 )
        wait 0.05;

    self.enableproneexitnode = 1;
    self.enablepronetocombattransition = 1;
    var_0 = getnode( "price_pond_sneak_node", "targetname" );
    maps\scoutsniper_code::scoutsniper_follow_path( var_0, 128 );
}

pond_inposition()
{
    if ( common_scripts\utility::flag( "_stealth_spotted" ) )
        return;

    level endon( "_stealth_spotted" );

    if ( common_scripts\utility::flag( "pond_enemies_dead" ) )
        return;

    level endon( "pond_enemies_dead" );

    if ( common_scripts\utility::flag( "pond_thrower_dead" ) )
        return;

    level endon( "pond_thrower_dead" );

    if ( common_scripts\utility::flag( "cargo" ) )
        return;

    level endon( "cargo" );
    common_scripts\utility::flag_wait( "pond_patrol_dead" );

    if ( !common_scripts\utility::flag( "_stealth_event" ) )
        level maps\_utility::function_stack( maps\_utility::radio_dialogue, "scoutsniper_mcm_dontfire" );

    if ( !common_scripts\utility::flag( "_stealth_event" ) )
        level maps\_utility::function_stack( maps\_utility::radio_dialogue, "scoutsniper_mcm_sametime" );

    var_0 = getnodearray( "pond_in_position", "script_noteworthy" );
    var_0 = common_scripts\utility::get_array_of_closest( self.origin, var_0 );
    var_1 = var_0[0];
    maps\_utility::delaythread( 0.05, maps\scoutsniper_code::scoutsniper_follow_path, var_1, 1 );
    var_2 = 1;
    var_3 = "scoutsniper_mcm_whenyoureready";

    while ( isdefined( var_1 ) )
    {
        self waittill( "follow_path_new_goal" );
        maps\_utility::disable_cqbwalk();
        maps\_utility::ent_flag_set( "_stealth_stance_handler" );
        maps\_utility::ent_flag_clear( "pond_in_position" );

        if ( var_2 )
        {
            if ( distance( var_1.origin, self.origin ) < 8 )
                var_3 = undefined;
            else if ( !common_scripts\utility::flag( "_stealth_event" ) )
                level thread maps\_utility::function_stack( maps\_utility::radio_dialogue, "scoutsniper_mcm_waitforme" );

            var_2 = 0;
        }
        else if ( !common_scripts\utility::flag( "_stealth_event" ) )
            level thread maps\_utility::function_stack( maps\_utility::radio_dialogue, "scoutsniper_mcm_holdyourfiremoving" );

        var_1 waittill( "trigger" );
        thread maps\scoutsniper_code::pond_inposition_takeshot( var_1, var_3 );
        var_3 = undefined;

        if ( isdefined( var_1.target ) )
        {
            var_1 = getnode( var_1.target, "targetname" );
            continue;
        }

        var_1 = undefined;
    }
}

pond_handle_kills( var_0, var_1, var_2, var_3 )
{
    level endon( "dash_spawn" );
    common_scripts\utility::flag_wait( var_0 );
    waittillframeend;
    var_4 = maps\_utility::get_living_ai_array( var_1, "script_noteworthy" );
    maps\_utility::waittill_dead( var_4 );
    common_scripts\utility::flag_set( var_2 );

    if ( common_scripts\utility::flag( "_stealth_spotted" ) )
        return;

    level thread maps\_utility::function_stack( maps\_utility::radio_dialogue, var_3 );
}

pond_handle_clear()
{
    common_scripts\utility::flag_wait( "pond_patrol_dead" );
    common_scripts\utility::flag_wait( "pond_thrower_dead" );
    common_scripts\utility::flag_set( "pond_enemies_dead" );
}

pond_kill_patrol()
{
    self endon( "death" );

    if ( common_scripts\utility::flag( "_stealth_spotted" ) )
        return;

    level endon( "_stealth_spotted" );

    if ( common_scripts\utility::flag( "cargo" ) )
        return;

    level endon( "cargo" );

    if ( common_scripts\utility::flag( "pond_enemies_dead" ) )
        return;

    level endon( "pond_enemies_dead" );

    if ( common_scripts\utility::flag( "pond_patrol_dead" ) )
        return;

    level endon( "pond_patrol_dead" );

    if ( common_scripts\utility::flag( "dash_spawn" ) )
        return;

    level endon( "dash_spawn" );
    var_0 = maps\_utility::get_living_ai_array( "pond_patrol", "script_noteworthy" );

    if ( var_0.size > 1 )
    {
        maps\_utility::waittill_dead( var_0, 1 );
        level thread maps\_utility::function_stack( maps\_utility::radio_dialogue, "scoutsniper_mcm_targetelim" );
    }

    wait 0.25;

    while ( maps\_utility::ent_flag( "_stealth_stay_still" ) )
        self waittill( "_stealth_stay_still" );

    var_1 = maps\_utility::get_living_ai( "pond_patrol", "script_noteworthy" );
    var_1 endon( "death" );

    while ( isalive( var_1 ) )
    {
        var_2 = maps\_utility::get_living_ai_array( "pond_throwers", "script_noteworthy" );

        if ( var_2.size && isalive( var_2[0] ) )
        {
            if ( distance( var_1.origin, var_2[0].origin ) < 550 )
            {
                wait 0.5;
                continue;
            }
        }

        break;
    }

    self.ignoreall = 0;
    var_1.ignoreme = 0;
    self.favoriteenemy = var_1;
    wait 1;
}

pond_kill_thrower()
{
    if ( common_scripts\utility::flag( "cargo" ) )
        return;

    level endon( "cargo" );
    self endon( "death" );

    if ( common_scripts\utility::flag( "pond_enemies_dead" ) )
        return;

    level endon( "pond_enemies_dead" );

    if ( common_scripts\utility::flag( "pond_thrower_dead" ) )
        return;

    level endon( "pond_thrower_dead" );
    var_0 = maps\_utility::get_living_ai_array( "pond_throwers", "script_noteworthy" );

    if ( var_0.size > 1 )
        maps\_utility::waittill_dead( var_0, 1 );

    common_scripts\utility::flag_set( "pond_thrower_kill" );
    wait 0.15;
    var_1 = maps\_utility::get_living_ai( "pond_throwers", "script_noteworthy" );

    if ( !isdefined( var_1 ) )
        return;

    self.ignoreall = 0;
    var_1.ignoreme = 0;
    var_1 endon( "death" );

    if ( common_scripts\utility::flag( "pond_patrol_dead" ) )
    {
        maps\_utility::ent_flag_wait( "pond_in_position" );
        magicbullet( self.weapon, self gettagorigin( "tag_flash" ), var_1 getshootatpos() );
        wait 0.05;
        var_1 kill( self.origin );
    }
    else
    {
        while ( isalive( var_1 ) )
        {
            self.favoriteenemy = var_1;
            wait 1;
        }
    }
}

cargo_main()
{
    if ( !isalive( level.price ) )
        return;

    level.price endon( "death" );
    var_0 = [];
    var_0["attack"] = maps\scoutsniper_code::cargo_enemy_attack;
    common_scripts\utility::array_thread( getentarray( "cargo_guys", "targetname" ), maps\_utility::add_spawn_function, maps\_stealth_logic::stealth_ai, undefined, var_0 );
    common_scripts\utility::array_thread( getentarray( "cargo_guys", "targetname" ), maps\_utility::add_spawn_function, maps\scoutsniper_code::alert_on_grenade_body_impact );
    common_scripts\utility::array_thread( getentarray( "cargo_smokers", "script_noteworthy" ), maps\_utility::add_spawn_function, maps\scoutsniper_code::idle_anim_think );
    common_scripts\utility::array_thread( getentarray( "cargo_smokers", "script_noteworthy" ), maps\_utility::add_spawn_function, common_scripts\utility::flag_set, "cargo_smokers_spawned" );
    common_scripts\utility::array_thread( getentarray( "cargo_smokers", "script_noteworthy" ), maps\_utility::add_spawn_function, maps\scoutsniper_code::mission_dialogue_kill );
    common_scripts\utility::array_thread( getentarray( "cargo_sleeper", "script_noteworthy" ), maps\_utility::add_spawn_function, maps\scoutsniper_code::idle_anim_think );
    common_scripts\utility::array_thread( getentarray( "cargo_patrol_defend2", "script_noteworthy" ), maps\_utility::add_spawn_function, maps\scoutsniper_code::idle_anim_think );
    common_scripts\utility::array_thread( getentarray( "cargo_sleeper", "script_noteworthy" ), maps\_utility::add_spawn_function, ::cargo_sleeper );
    common_scripts\utility::array_thread( getentarray( "cargo_patrol", "script_noteworthy" ), maps\_utility::add_spawn_function, ::cargo_patrol_death );
    common_scripts\utility::array_thread( getentarray( "cargo_patrol_defend1", "script_noteworthy" ), maps\_utility::add_spawn_function, ::cargo_patrol_defend1_death );
    thread cargo_enemies_death();
    thread maps\scoutsniper_code::cargo_handle_patroller();
    thread cargo_handle_defend1_flag();
    thread cargo_dialogue();
    common_scripts\utility::flag_wait( "initial_setup_done" );
    common_scripts\utility::flag_wait( "cargo" );
    common_scripts\utility::flag_wait( "field_price_done" );
    soundscripts\_snd::snd_message( "start_cargo_mix" );

    if ( !common_scripts\utility::flag( "_stealth_spotted" ) )
    {
        level.price.ignoreall = 1;
        maps\scoutsniper_code::try_save( "cargo" );

        if ( common_scripts\utility::flag( "pond_enemies_dead" ) )
        {
            level.price allowedstances( "prone", "crouch", "stand" );
            level.price maps\_utility::ent_flag_clear( "_stealth_stance_handler" );
            level.price thread maps\scoutsniper_code::dynamic_run_speed();
        }
    }

    for (;;)
    {
        level.price cargo_moveup();
        level.price allowedstances( "prone", "crouch", "stand" );
        level.price maps\_utility::ent_flag_clear( "_stealth_stance_handler" );
        level.price notify( "stop_dynamic_run_speed" );
        level.price cargo_sneakup();

        if ( common_scripts\utility::flag( "cargo_smokers_spawned" ) )
            break;

        level maps\_utility::add_wait( common_scripts\utility::flag_waitopen, "_stealth_spotted" );
        level maps\_utility::add_wait( common_scripts\utility::flag_wait, "cargo_smokers_spawned" );
        level maps\_utility::do_wait_any();
        level.price thread maps\scoutsniper_code::dynamic_run_speed();
    }

    level.price setisforcedincombat( 1 );
    level.price pushplayer( 1 );
    level.price cargo_attack1();
    level.price setisforcedincombat( 0 );
    level.price pushplayer( 0 );
    level.price allowedstances( "prone", "crouch", "stand" );
    level.price cargo_waitmove();
    level.price maps\_utility::ent_flag_clear( "_stealth_stance_handler" );
    level.price allowedstances( "prone", "crouch", "stand" );
    level.price notify( "stop_dynamic_run_speed" );
    maps\_utility::delaythread( 1, maps\scoutsniper_code::try_save, "cargo2" );
    level.price cargo_slipby();
    level.price maps\_utility::disable_cqbwalk();
    level.price cargo_leave();

    while ( common_scripts\utility::flag( "_stealth_spotted" ) || common_scripts\utility::flag( "_stealth_event" ) )
    {
        common_scripts\utility::flag_waitopen( "_stealth_spotted" );
        common_scripts\utility::flag_waitopen( "_stealth_event" );
        level.price cargo_leave();
    }

    level.dash_section = 1;
    common_scripts\utility::flag_set( "dash" );
}

cargo_dialogue()
{
    common_scripts\utility::flag_wait( "cargo_smokers_spawned" );

    if ( common_scripts\utility::flag( "_stealth_spotted" ) )
        return;

    level endon( "_stealth_spotted" );

    if ( common_scripts\utility::flag( "_stealth_found_corpse" ) )
        return;

    level endon( "_stealth_found_corpse" );
    wait 1;
    var_0 = [];
    var_0[var_0.size] = "scoutsniper_ru2_anyoneseedogs";
    var_0[var_0.size] = "scoutsniper_ru1_mercenaries";
    var_0[var_0.size] = "scoutsniper_ru4_radiationdogs";
    var_0[var_0.size] = "scoutsniper_ru2_buymotorbike";
    var_0[var_0.size] = "scoutsniper_ru2_americagoingtostartwar";
    var_1 = maps\_utility::get_living_ai_array( "cargo_smokers", "script_noteworthy" );
    maps\scoutsniper_code::mission_dialogue_array( var_1, var_0 );
}

cargo_patrol_death()
{
    self.fixednode = 0;
    self waittill( "death" );
    common_scripts\utility::flag_set( "cargo_patrol_dead" );

    if ( common_scripts\utility::flag( "_stealth_spotted" ) )
        return;

    level endon( "_stealth_spotted" );

    if ( common_scripts\utility::flag( "dash_spawn" ) )
        return;

    level endon( "dash_spawn" );

    if ( !isdefined( self ) || !isalive( level.price ) )
        return;

    if ( level.price cansee( self ) )
        level maps\_utility::function_stack( maps\_utility::radio_dialogue, "scoutsniper_mcm_tangodown" );
}

cargo_enemies_death()
{
    var_0 = getent( "cargo_guys", "target" );
    var_0 waittill( "trigger" );
    wait 0.1;
    var_1 = maps\_utility::get_living_ai_array( "cargo_smokers", "script_noteworthy" );
    var_1 = common_scripts\utility::array_combine( var_1, maps\_utility::get_living_ai_array( "cargo_sleeper", "script_noteworthy" ) );
    var_1 = common_scripts\utility::array_combine( var_1, maps\_utility::get_living_ai_array( "cargo_patrol", "script_noteworthy" ) );
    var_1 = common_scripts\utility::array_combine( var_1, maps\_utility::get_living_ai_array( "cargo_patrol_defend1", "script_noteworthy" ) );
    var_1 = common_scripts\utility::array_combine( var_1, maps\_utility::get_living_ai_array( "cargo_patrol_defend2", "script_noteworthy" ) );
    maps\_utility::waittill_dead( var_1 );
    common_scripts\utility::flag_set( "cargo_enemies_dead" );
}

cargo_sleeper()
{
    self endon( "death" );
    self.ignoreall = 1;
    maps\scoutsniper_code::cargo_sleeper_wait_wakeup();
    self.ignoreall = 0;
}

cargo_patrol_defend1_death()
{
    self settalktospecies();
    var_0 = "corpse_" + self.ai_number;
    self waittill( "death" );
    common_scripts\utility::flag_set( "cargo_patrol_defend1_dead" );
    waittillframeend;
    var_1 = getent( var_0, "script_noteworthy" );

    if ( !isdefined( var_1 ) )
        return;

    var_1 delete();
    level._stealth.logic.corpse.array = common_scripts\utility::array_removeundefined( level._stealth.logic.corpse.array );
}

cargo_handle_defend1_flag()
{
    level endon( "cargo_started_defend_moment" );
    var_0 = getent( "cargo_defend1_node", "targetname" );
    var_0 waittill( "trigger" );
    common_scripts\utility::flag_set( "cargo_enemy_ready_to_defend1" );
    var_1 = getanimlength( %patrol_bored_idle_smoke );
    wait(var_1 - 1.25);
    common_scripts\utility::flag_clear( "cargo_enemy_ready_to_defend1" );
    common_scripts\utility::flag_set( "cargo_enemy_defend_moment_past" );
}

cargo_moveup()
{
    if ( common_scripts\utility::flag( "_stealth_spotted" ) )
        return;

    level endon( "_stealth_spotted" );
    var_0 = getnode( "cargo_price_node1", "targetname" );
    maps\scoutsniper_code::scoutsniper_follow_path( var_0 );

    if ( !common_scripts\utility::flag( "cargo_patrol_defend1_dead" ) )
        level maps\_utility::function_stack( maps\_utility::radio_dialogue, "scoutsniper_mcm_inshadows" );
}

cargo_sneakup()
{
    if ( common_scripts\utility::flag( "_stealth_spotted" ) )
        return;

    level endon( "_stealth_spotted" );

    if ( !common_scripts\utility::flag( "cargo_patrol_defend1_dead" ) )
    {
        var_0 = getent( "cargo_price_sneakup_node", "targetname" );
        self allowedstances( "crouch" );
        maps\scoutsniper_code::scoutsniper_follow_path( var_0 );
    }

    thread cargo_sneakup_dialogue();
}

cargo_sneakup_dialogue()
{
    if ( common_scripts\utility::flag( "_stealth_spotted" ) )
        return;

    level endon( "_stealth_spotted" );

    if ( common_scripts\utility::flag( "cargo_enemies_dead" ) )
        return;

    level endon( "cargo_enemies_dead" );

    if ( common_scripts\utility::flag( "cargo_enemy_defend_moment_past" ) )
        return;

    level endon( "cargo_enemy_defend_moment_past" );

    if ( !common_scripts\utility::flag( "cargo_patrol_defend1_dead" ) )
    {
        if ( !common_scripts\utility::flag( "cargo_enemy_ready_to_defend1" ) )
            level maps\_utility::function_stack( maps\_utility::radio_dialogue, "scoutsniper_mcm_stayback" );

        common_scripts\utility::flag_wait_either( "cargo_enemy_ready_to_defend1", "cargo_patrol_defend1_dead" );

        if ( !common_scripts\utility::flag( "cargo_patrol_defend1_dead" ) )
        {
            maps\_utility::radio_dialogue_stop();
            level thread maps\_utility::function_stack( maps\_utility::radio_dialogue, "scoutsniper_mcm_hesmine" );
            wait 1.5;
            common_scripts\utility::flag_set( "cargo_price_ready_to_attack1" );
        }
        else if ( level.price cansee( level.player ) )
            level maps\_utility::function_stack( maps\_utility::radio_dialogue, "scoutsniper_mcm_move" );
    }
    else if ( level.price cansee( level.player ) )
        level maps\_utility::function_stack( maps\_utility::radio_dialogue, "scoutsniper_mcm_move" );
}

cargo_attack1()
{
    if ( common_scripts\utility::flag( "_stealth_spotted" ) )
        return;

    level endon( "_stealth_spotted" );

    if ( common_scripts\utility::flag( "cargo_patrol_defend1_dead" ) )
        return;

    level endon( "cargo_patrol_defend1_dead" );

    if ( common_scripts\utility::flag( "cargo_enemy_defend_moment_past" ) )
        return;

    level endon( "cargo_enemy_defend_moment_past" );
    var_0 = maps\_utility::get_living_ai( "cargo_patrol_defend1", "script_noteworthy" );

    if ( !isdefined( var_0 ) )
        return;

    common_scripts\utility::flag_wait( "cargo_enemy_ready_to_defend1" );
    common_scripts\utility::flag_set( "cargo_started_defend_moment" );
    var_0 endon( "death" );
    common_scripts\utility::flag_wait( "cargo_price_ready_to_attack1" );
    var_1 = spawn( "script_origin", var_0.origin );
    var_1.angles = var_0.angles;
    var_1 maps\_anim::anim_reach_and_arrive_facing_anim_solo( self, "cargo_attack_1", "exposed_crouch_crouchwalk", undefined, "generic" );
    animscripts\setposemovement::playtransitionanimation( %exposed_crouch_2_stand, "stand", "stop", undefined, 1.5 );
    thread cargo_attack1_commit( var_1, var_0 );
    var_1 waittill( "cargo_attack_1" );
}

cargo_attack1_commit( var_0, var_1 )
{
    var_1 endon( "death" );
    var_1 notify( "end_patrol" );
    var_1 notify( "_stealth_stop_stealth_logic" );
    waittillframeend;
    var_1.ignoreall = 1;
    var_1.allowdeath = 1;
    maps\_utility::delaythread( 0.15, maps\_utility::radio_dialogue_stop );
    level.price maps\_utility::delaythread( 0.2, maps\_utility::function_stack, maps\_utility::play_sound_on_entity, "scoutsniper_mcm_oisuzy" );
    soundscripts\_snd::snd_message( "start_taking_guard_mix" );
    var_2 = "scoutsniper_ru" + var_1._stealth.behavior.sndnum + "_huh";
    var_1 maps\_utility::delaythread( 1, maps\_utility::play_sound_on_entity, var_2 );
    self.favoriteenemy = var_1;
    var_0 thread maps\_anim::anim_generic_custom_animmode( var_1, "gravity", "cargo_defend_1" );
    thread cargo_attack_commit_fail( var_1, var_0, "cargo_attack_1" );
    var_0 thread maps\_anim::anim_generic_custom_animmode( self, "gravity", "cargo_attack_1" );
}

cargo_attack_commit_fail( var_0, var_1, var_2 )
{
    var_1 endon( var_2 );
    var_0 thread maps\scoutsniper_code::killed_by_player();
    var_0 waittill( "killed_by_player" );
    self stopanimscripted();
    self notify( "stop_animmode" );
    var_1 notify( "stop_animmode" );
    var_3 = "run_2_stop";
    maps\_anim::anim_generic_custom_animmode( self, "gravity", var_3 );
}

cargo_waitmove()
{
    soundscripts\_snd::snd_message( "stop_taking_guard_mix" );

    if ( common_scripts\utility::flag( "_stealth_spotted" ) )
        return;

    level endon( "_stealth_spotted" );

    if ( common_scripts\utility::flag( "cargo_enemies_dead" ) )
        return;

    level endon( "cargo_enemies_dead" );

    if ( !common_scripts\utility::flag( "cargo_enemy_defend_moment_past" ) )
        return;

    self allowedstances( "crouch" );
    maps\_utility::ent_flag_set( "_stealth_stance_handler" );
    var_0 = common_scripts\utility::flag( "cargo_defender1_away" ) || common_scripts\utility::flag( "cargo_patrol_defend1_dead" );

    if ( !var_0 )
        level maps\_utility::function_stack( maps\_utility::radio_dialogue, "scoutsniper_mcm_observe" );
    else
    {
        level thread maps\_utility::function_stack( maps\_utility::radio_dialogue, "scoutsniper_mcm_go" );
        return;
    }

    for (;;)
    {
        common_scripts\utility::flag_wait_any( "cargo_defender1_away", "cargo_patrol_defend1_dead" );
        var_0 = common_scripts\utility::flag( "cargo_defender1_away" ) || common_scripts\utility::flag( "cargo_patrol_defend1_dead" );

        if ( var_0 )
            break;
        else
            level thread maps\_utility::function_stack( maps\_utility::radio_dialogue, "scoutsniper_mcm_standby" );
    }

    level thread maps\_utility::function_stack( maps\_utility::radio_dialogue, "scoutsniper_mcm_ourchance" );
}

cargo_slipby()
{
    if ( common_scripts\utility::flag( "_stealth_spotted" ) )
        return;

    level endon( "_stealth_spotted" );

    if ( common_scripts\utility::flag( "cargo_enemies_dead" ) )
        return;

    level endon( "cargo_enemies_dead" );
    thread cargo_insane();
    maps\_utility::enable_cqbwalk();
    var_0 = 300;
    var_1 = getnode( "cargo_price_slipby_1", "targetname" );
    maps\scoutsniper_code::scoutsniper_follow_path( var_1 );
    maps\scoutsniper_code::cargo_slipby_part1( var_0 );
    var_0 = 450;
    var_1 = getnode( "cargo_price_slipby_3", "targetname" );
    self.ref_node.origin = var_1.origin;
    self.ref_node.angles = var_1.angles + ( 0.0, -90.0, 0.0 );
    self.ref_node maps\_anim::anim_generic_reach_and_arrive( self, "stop_cornerR" );
    self.goalradius = level.macmillan_exposed_cqb_radius;

    while ( !maps\scoutsniper_code::wait_for_player( var_1, maps\scoutsniper_code::follow_path_get_node, var_0 ) )
        wait 0.05;

    maps\scoutsniper_code::cargo_slipby_part2( var_0 );
    self.custommovetransition = ::cargo_exit;
    self.pathturnanimblendtime = 0.2;
    var_0 = 500;
    var_1 = getnode( "cargo_price_slipby_4", "targetname" );
    self.ref_node.origin = var_1.origin;
    self.ref_node.angles = var_1.angles;
    var_1 maps\_anim::anim_reach_and_approach_node_solo( self, "stop_cqb", undefined, undefined, "stand" );
    self.goalradius = level.macmillan_exposed_cqb_radius;
    self.pathturnanimblendtime = undefined;

    for (;;)
    {
        wait 0.05;

        if ( !common_scripts\utility::flag( "cargo_patrol_away" ) && !common_scripts\utility::flag( "cargo_patrol_dead" ) )
            break;

        if ( maps\scoutsniper_code::wait_for_player( var_1, maps\scoutsniper_code::follow_path_get_node, var_0 ) )
            break;
    }

    maps\scoutsniper_code::cargo_slipby_part3( var_0 );
}

cargo_insane()
{
    var_0 = getent( "cargo_insane", "targetname" );
    var_1 = getentarray( "intelligence_item", "targetname" );
    var_1 = common_scripts\utility::get_array_of_closest( var_0 getorigin(), var_1 );
    var_1[0] thread maps\scoutsniper_code::cargo_insane_handle_use();

    if ( common_scripts\utility::flag( "_stealth_spotted" ) )
        return;

    level endon( "_stealth_spotted" );

    if ( common_scripts\utility::flag( "cargo_enemies_dead" ) )
        return;

    level endon( "cargo_enemies_dead" );
    var_0 waittill( "trigger" );
    level thread maps\_utility::function_stack( maps\_utility::radio_dialogue, "scoutsniper_mcm_youinsane" );
    var_1[0] waittill( "trigger" );
    level thread maps\_utility::function_stack( maps\_utility::radio_dialogue, "scoutsniper_mcm_gotminerals" );
}

cargo_leave()
{
    if ( common_scripts\utility::flag( "_stealth_spotted" ) )
        return;

    level endon( "_stealth_spotted" );
    thread cargo_leave_dialogue();
    var_0 = getnode( "cargo_price_leave_node", "targetname" );
    maps\scoutsniper_code::scoutsniper_follow_path( var_0, 160 );
}

cargo_leave_dialogue()
{
    if ( common_scripts\utility::flag( "_stealth_spotted" ) )
        return;

    level endon( "_stealth_spotted" );
    wait 2;
    level thread maps\_utility::function_stack( maps\_utility::radio_dialogue, "scoutsniper_mcm_letsgo" );
}

dash_main()
{
    if ( !isalive( level.price ) )
        return;

    level.price endon( "death" );
    var_0 = [];
    var_0["hidden"] = maps\scoutsniper_code::dash_state_hidden;
    var_0["alert"] = maps\_stealth_behavior::enemy_state_alert;
    var_0["spotted"] = maps\_stealth_behavior::enemy_state_spotted;
    var_1 = [];
    var_1["saw"] = maps\scoutsniper_code::field_enemy_awareness;
    var_1["found"] = maps\scoutsniper_code::field_enemy_awareness;
    var_2 = [];
    var_2["heard_scream"] = maps\scoutsniper_code::field_enemy_awareness;
    var_2["explode"] = maps\scoutsniper_code::field_enemy_awareness;
    common_scripts\utility::array_thread( getentarray( "dash_intro_guy", "targetname" ), maps\_utility::add_spawn_function, ::dash_kill_nosave );
    common_scripts\utility::array_thread( getentarray( "dash_intro_guy2", "targetname" ), maps\_utility::add_spawn_function, ::dash_kill_nosave );
    common_scripts\utility::array_thread( getentarray( "dash_stander", "targetname" ), maps\_utility::add_spawn_function, ::dash_kill_nosave );
    common_scripts\utility::array_thread5( getentarray( "dash_intro_guy", "targetname" ), maps\_utility::add_spawn_function, maps\_stealth_logic::stealth_ai, var_0, undefined, var_1, var_2 );
    common_scripts\utility::array_thread( getentarray( "dash_intro_runner", "script_noteworthy" ), maps\_utility::add_spawn_function, maps\scoutsniper_code::dash_intro_runner );
    common_scripts\utility::array_thread( getentarray( "dash_intro_patroller", "script_noteworthy" ), maps\_utility::add_spawn_function, maps\scoutsniper_code::dash_intro_patrol );
    common_scripts\utility::array_thread5( getentarray( "dash_intro_guy2", "targetname" ), maps\_utility::add_spawn_function, maps\_stealth_logic::stealth_ai, var_0, undefined, var_1, var_2 );
    common_scripts\utility::array_thread5( getentarray( "dash_stander", "targetname" ), maps\_utility::add_spawn_function, maps\_stealth_logic::stealth_ai, var_0, undefined, var_1, var_2 );
    common_scripts\utility::array_thread( getentarray( "dash_stander", "targetname" ), maps\_utility::add_spawn_function, maps\scoutsniper_code::dash_stander );
    common_scripts\utility::array_thread( getentarray( "dash_bus_guys", "targetname" ), maps\_utility::add_spawn_function, ::dash_kill_nosave );
    common_scripts\utility::array_thread5( getentarray( "dash_bus_guys", "targetname" ), maps\_utility::add_spawn_function, maps\_stealth_logic::stealth_ai, var_0, undefined, var_1, var_2 );
    common_scripts\utility::array_thread( getentarray( "dash_bus_idler", "script_noteworthy" ), maps\_utility::add_spawn_function, maps\scoutsniper_code::dash_idler );
    common_scripts\utility::array_thread( getentarray( "dash_bus_runner", "script_noteworthy" ), maps\_utility::add_spawn_function, maps\scoutsniper_code::deleteontruegoal );
    common_scripts\utility::array_thread( getentarray( "dash_crawl_patroller", "script_noteworthy" ), maps\_utility::add_spawn_function, ::dash_kill_nosave );
    common_scripts\utility::array_thread5( getentarray( "dash_crawl_patroller", "script_noteworthy" ), maps\_utility::add_spawn_function, maps\_stealth_logic::stealth_ai, var_0, undefined, var_1, var_2 );
    common_scripts\utility::array_thread( getentarray( "dash_crawl_patroller", "script_noteworthy" ), maps\_utility::add_spawn_function, maps\scoutsniper_code::dash_crawl_patrol );
    common_scripts\utility::array_thread( getentarray( "dash_crawl_patroller", "script_noteworthy" ), maps\_utility::add_spawn_function, maps\scoutsniper_code::mission_dialogue_kill );
    common_scripts\utility::array_thread( getentarray( "dash_on_road_guy", "targetname" ), maps\_utility::add_spawn_function, ::dash_kill_nosave );
    common_scripts\utility::array_thread( getentarray( "dash_on_road_guy2", "targetname" ), maps\_utility::add_spawn_function, ::dash_kill_nosave );
    common_scripts\utility::array_thread5( getentarray( "dash_on_road_guy", "targetname" ), maps\_utility::add_spawn_function, maps\_stealth_logic::stealth_ai, var_0, undefined, var_1, var_2 );
    common_scripts\utility::array_thread( getentarray( "dash_on_road_guy", "targetname" ), maps\_utility::add_spawn_function, maps\scoutsniper_code::deleteontruegoal );
    common_scripts\utility::array_thread5( getentarray( "dash_on_road_guy2", "targetname" ), maps\_utility::add_spawn_function, maps\_stealth_logic::stealth_ai, var_0, undefined, var_1, var_2 );
    common_scripts\utility::array_thread( getentarray( "dash_on_road_guy2", "targetname" ), maps\_utility::add_spawn_function, maps\scoutsniper_code::deleteontruegoal );
    common_scripts\utility::array_thread( getentarray( "dash_last_runner", "targetname" ), maps\_utility::add_spawn_function, ::dash_kill_nosave );
    common_scripts\utility::array_thread( getentarray( "dash_last_runner", "targetname" ), maps\_utility::add_spawn_function, maps\_stealth_logic::stealth_ai );
    common_scripts\utility::array_thread( getentarray( "dash_last_runner", "targetname" ), maps\_utility::add_spawn_function, maps\scoutsniper_code::deleteontruegoal );
    common_scripts\utility::array_thread( getentarray( "dash_patroller", "targetname" ), maps\_utility::add_spawn_function, ::dash_kill_nosave );
    common_scripts\utility::array_thread( getentarray( "dash_idler", "targetname" ), maps\_utility::add_spawn_function, ::dash_kill_nosave );
    common_scripts\utility::array_thread5( getentarray( "dash_patroller", "targetname" ), maps\_utility::add_spawn_function, maps\_stealth_logic::stealth_ai, var_0, undefined, var_1, var_2 );
    common_scripts\utility::array_thread5( getentarray( "dash_idler", "targetname" ), maps\_utility::add_spawn_function, maps\_stealth_logic::stealth_ai, var_0, undefined, var_1, var_2 );
    common_scripts\utility::array_thread( getentarray( "dash_patroller", "targetname" ), maps\_utility::add_spawn_function, maps\scoutsniper_code::dash_ai );
    common_scripts\utility::array_thread( getentarray( "dash_idler", "targetname" ), maps\_utility::add_spawn_function, maps\scoutsniper_code::dash_ai );
    var_3 = [];
    var_3["reset"] = maps\scoutsniper_code::dash_sniper_alert;
    var_3["alerted_once"] = maps\scoutsniper_code::dash_sniper_alert;
    var_3["alerted_again"] = maps\scoutsniper_code::dash_sniper_attack;
    var_3["attack"] = maps\scoutsniper_code::dash_sniper_attack;
    common_scripts\utility::array_thread5( getentarray( "dash_sniper", "targetname" ), maps\_utility::add_spawn_function, maps\_stealth_logic::stealth_ai, undefined, var_3, var_1, var_2 );
    common_scripts\utility::array_thread( getentarray( "dash_sniper", "targetname" ), maps\_utility::add_spawn_function, maps\scoutsniper_code::dash_sniper_death );
    common_scripts\utility::array_thread( getentarray( "dash_sniper", "targetname" ), maps\_utility::add_spawn_function, ::dash_sniper_approach );
    common_scripts\utility::array_thread( getentarray( "dash_guard_check", "script_noteworthy" ), maps\scoutsniper_code::dash_run_check );
    var_4 = getent( "dash_intro_guy", "target" );
    thread maps\_utility::set_flag_on_trigger( var_4, "dash_spawn" );
    thread maps\scoutsniper_code::dash_handle_price_stop_bullet_shield();
    thread maps\scoutsniper_code::dash_handle_doors_blowopen();
    thread maps\scoutsniper_code::dash_handle_nosight_clip();
    thread maps\scoutsniper_code::dash_handle_heli();
    thread dash_hind_death_dialogue();
    thread maps\scoutsniper_code::dash_handle_stealth_unsure();
    thread dash_dialogue();
    common_scripts\utility::flag_wait( "initial_setup_done" );
    common_scripts\utility::flag_wait( "dash" );
    soundscripts\_snd::snd_message( "start_dash_mix" );
    level.play_additionnal_fs_sfx = 1;
    level.price.script_pushable = 1;
    level.price dash_holdup();

    if ( !common_scripts\utility::flag( "dash_stealth_unsure" ) )
        maps\scoutsniper_code::try_save( "dash_start" );

    level.price dash_run();

    if ( !common_scripts\utility::flag( "dash_stealth_unsure" ) )
        maps\scoutsniper_code::try_save( "dash_run" );

    level.price dash_crawl();
    level.price dash_last();
    maps\scoutsniper_code::dash_reset_stealth_to_default();
    level.price dash_sniper();
    thread dash_delay_save();
    level.price.moveplaybackrate = 1;
    level.price maps\_utility::clear_run_anim();
    level.price allowedstances( "stand", "crouch", "prone" );

    if ( common_scripts\utility::flag( "_stealth_spotted" ) || common_scripts\utility::flag( "_stealth_event" ) )
    {
        common_scripts\utility::flag_waitopen( "_stealth_spotted" );
        common_scripts\utility::flag_waitopen( "_stealth_event" );
        common_scripts\utility::flag_waitopen( "_stealth_alert" );

        if ( level.player.health )
            level thread maps\_utility::function_stack( maps\_utility::radio_dialogue, "scoutsniper_mcm_getuskilled" );
    }
    else
    {
        if ( common_scripts\utility::flag( "dash_killed_by_price" ) )
            level thread maps\_utility::function_stack( maps\_utility::radio_dialogue, "scoutsniper_mcm_goodnight" );

        level thread maps\_utility::function_stack( maps\_utility::radio_dialogue, "scoutsniper_mcm_moveout" );
    }

    common_scripts\utility::flag_set( "town" );
    level.dash_section = 0;
}

dash_kill_nosave()
{
    level endon( "dash_reset_stealth_to_default" );
    self waittill( "death", var_0 );

    if ( !isdefined( var_0 ) )
        return;

    if ( isplayer( var_0 ) )
        common_scripts\utility::flag_set( "dash_stealth_unsure" );
}

dash_delay_save()
{
    wait 0.5;

    if ( !common_scripts\utility::flag( "dash_stealth_unsure" ) )
        maps\scoutsniper_code::try_save( "dash_run" );
}

dash_dialogue()
{
    common_scripts\utility::flag_wait( "dash_door_R_open" );
    level endon( "_stealth_spotted" );
    level endon( "_stealth_found_corpse" );
    var_0 = [];
    var_0[var_0.size] = "scoutsniper_ru1_readytomove";
    var_0[var_0.size] = "scoutsniper_ru2_yescomrade";
    var_0[var_0.size] = "scoutsniper_ru1_helicopteronway";
    var_0[var_0.size] = "scoutsniper_ru1_zonesafe";
    var_0[var_0.size] = "scoutsniper_ru1_okbringin";
    var_0[var_0.size] = "scoutsniper_ru2_clearrotorblades";
    var_0[var_0.size] = "scoutsniper_ru1_checkthewoods";
    var_1 = common_scripts\utility::get_array_of_closest( level.player.origin, maps\_utility::get_living_ai_array( "dash_intro_patroller", "script_noteworthy" ) );

    if ( var_1.size )
    {
        var_2 = [];
        var_2[0] = var_1[0];
        var_2[0] thread maps\scoutsniper_code::mission_dialogue_kill();
        maps\scoutsniper_code::mission_dialogue_array( var_2, var_0 );
    }

    common_scripts\utility::flag_wait( "dash_crawl_patrol_spawned" );
    wait 1;
    var_0 = [];
    var_0[var_0.size] = "scoutsniper_ru2_radiationdosimeters";
    var_0[var_0.size] = "scoutsniper_ru1_replacedbatteries";
    var_0[var_0.size] = "scoutsniper_ru1_getsworse";
    var_0[var_0.size] = "scoutsniper_ru2_dontbelieveatall";
    var_0[var_0.size] = "scoutsniper_ru1_dogsdontgetclose";
    var_0[var_0.size] = "scoutsniper_ru2_ok";
    var_0[var_0.size] = "scoutsniper_ru4_mayhaveproblem";
    var_0[var_0.size] = "scoutsniper_ru1_whathappened";
    var_0[var_0.size] = "scoutsniper_ru2_professionaljob";
    var_0[var_0.size] = "scoutsniper_ru1_specialforces";
    var_0[var_0.size] = "scoutsniper_ru2_possiblyspetznaz";
    var_0[var_0.size] = "scoutsniper_ru4_canceltransactions";
    var_0[var_0.size] = "scoutsniper_ru1_nuclearreactor";
    var_2 = maps\_utility::get_living_ai_array( "dash_crawl_patroller", "script_noteworthy" );

    if ( !var_2.size )
        return;

    maps\scoutsniper_code::mission_dialogue_array( var_2, var_0 );
}

dash_holdup()
{
    self.disableexits = 0;
    self.disablearrivals = 0;
    self pushplayer( 1 );
    var_0 = getnode( "dash_price_start_node", "targetname" );
    var_1 = spawn( "script_origin", ( 637.617, 340.97, -123.545 ) );

    if ( getdvarint( "use_old_container_dash" ) == 1 )
        maps\scoutsniper_code::scoutsniper_follow_path( var_0, 200 );
    else
    {
        level.price.animname = "price";
        var_1 maps\_anim::anim_reach_solo( self, "container_runin" );
        var_1 maps\_anim::anim_single_solo( self, "container_runin" );
        var_1 thread maps\_anim::anim_loop_solo( self, "container_idle", undefined, "stop_loop_price" );

        while ( distancesquared( level.player.origin, self.origin ) > 17000 )
            waitframe();

        var_1 notify( "stop_loop_price" );
    }

    thread maps\scoutsniper_code::dash_fake_easy_mode();
    common_scripts\utility::flag_set( "dash_start" );

    if ( common_scripts\utility::flag( "_stealth_spotted" ) )
        return;

    level endon( "_stealth_spotted" );

    if ( getdvarint( "use_old_container_dash" ) == 1 )
    {
        wait 1;
        var_2 = getent( "dash_door_right", "script_noteworthy" );
        var_3 = getent( "dash_door_left", "script_noteworthy" );
        common_scripts\utility::flag_set( "dash_door_R_open" );
        var_2 playsound( "door_cargo_container_push_open" );
        var_2 maps\scoutsniper_code::dash_door_slow( 1 );
        level thread maps\_utility::function_stack( maps\_utility::radio_dialogue, "scoutsniper_mcm_mysignal" );
    }
    else
        var_1 maps\_anim::anim_single_solo( self, "container" );
}

dash_run()
{
    if ( common_scripts\utility::flag( "_stealth_spotted" ) )
        return;

    level endon( "_stealth_spotted" );
    maps\_utility::set_generic_run_anim( "sprint_h1", 1, 0 );

    if ( getdvarint( "use_old_container_dash" ) == 1 )
    {
        var_0 = getent( "dash_door_right", "script_noteworthy" );
        var_1 = getent( "dash_door_left", "script_noteworthy" );
        wait 9.5;
        level thread maps\_utility::function_stack( maps\_utility::radio_dialogue, "scoutsniper_mcm_hoooold" );
        wait 4;
        maps\_utility::delaythread( 2.25, maps\scoutsniper_code::scoutsniper_music_play, "scoutsniper_dash_music" );
        level thread maps\_utility::function_stack( maps\_utility::radio_dialogue, "scoutsniper_mcm_okgo" );
        wait 2;
        common_scripts\utility::flag_set( "dash_door_L_open" );
        var_0 thread maps\scoutsniper_code::dash_door_fast( 0.35 );
        var_1 thread maps\scoutsniper_code::dash_door_fast( -1.35 );
        var_1 playsound( "door_cargo_container_burst_open" );
        var_2 = getnode( "dash_price_node2", "targetname" );
        maps\scoutsniper_code::scoutsniper_follow_path( var_2 );
        wait 2;
    }
}

dash_crawl()
{
    if ( common_scripts\utility::flag( "_stealth_spotted" ) )
        return;

    level endon( "_stealth_spotted" );
    var_0 = getent( "dash_price_crawl_start", "targetname" );

    if ( getdvarint( "use_old_jeep_cover" ) != 1 )
    {
        self waittill( "anim_reach_complete" );
        var_0 = getent( var_0.target, "targetname" );
    }

    self.moveplaybackrate = 1;
    maps\_utility::clear_run_anim();

    if ( getdvarint( "use_old_jeep_cover" ) == 1 )
    {
        if ( distance( level.player.origin, self.origin ) < level.hearing_distance )
            level thread maps\_utility::function_stack( maps\_utility::radio_dialogue, "scoutsniper_mcm_letsgo2" );

        thread maps\scoutsniper_code::crawl_path( var_0 );
    }
    else
    {
        level.jeep_cover_node maps\_anim::anim_single_solo( self, "jeep_cover_run_to_idle" );
        level.jeep_cover_node thread maps\_anim::anim_loop_solo( self, "jeep_cover_idle", undefined, "stop_loop_price" );

        while ( distancesquared( level.player.origin, self.origin ) > 90000 )
            waitframe();

        level.jeep_cover_node notify( "stop_loop_price" );
        self allowedstances( "prone" );
        level.jeep_cover_node maps\_anim::anim_single_solo( self, "jeep_cover" );
        thread maps\scoutsniper_code::crawl_path( var_0, 300, 1 );
    }

    maps\_stealth_behavior::ai_create_behavior_function( "state", "spotted", maps\scoutsniper_code::dash_state_spotted );
    var_1 = getent( "dash_first_truck_player_clip", "targetname" );
    var_1 notsolid();
    var_2 = getent( "dash_crawl_patroller1", "target" );
    var_2 waittill( "trigger" );
    soundscripts\_snd::snd_message( "aud_start_dash_convoy_sequence" );
    var_2 = getent( "dash_crawl_firsttruck", "targetname" );
    var_2 waittill( "trigger" );

    if ( distance( level.player.origin, level.price.origin ) < level.hearing_distance )
        level thread maps\_utility::function_stack( maps\_utility::radio_dialogue, "scoutsniper_mcm_useascover" );

    self waittill( "scoutsniper_path_end_reached" );
    common_scripts\utility::flag_set( "dash_last" );

    if ( common_scripts\utility::flag( "town_no_turning_back" ) )
        return;

    level endon( "town_no_turning_back" );

    if ( distance( level.player.origin, level.price.origin ) < level.hearing_distance )
        level thread maps\_utility::function_stack( maps\_utility::radio_dialogue, "scoutsniper_mcm_crawlout" );

    wait 13.5;

    if ( distance( level.player.origin, level.price.origin ) < level.hearing_distance )
        level thread maps\_utility::function_stack( maps\_utility::radio_dialogue, "scoutsniper_mcm_anythingstupid" );

    wait 17;

    if ( distance( level.player.origin, level.price.origin ) < level.hearing_distance )
        level thread maps\_utility::function_stack( maps\_utility::radio_dialogue, "scoutsniper_mcm_standbygo" );

    maps\_stealth_behavior::ai_create_behavior_function( "state", "spotted", maps\_stealth_behavior::friendly_state_spotted );
    wait 4;
    var_3 = getent( "dash_last_truck_player_clip", "targetname" );
    var_3 notsolid();
}

dash_last()
{
    if ( common_scripts\utility::flag( "_stealth_spotted" ) )
        return;

    level endon( "_stealth_spotted" );
    var_0 = getnode( "dash_last_stretch1", "targetname" );
    self notify( "stop_loop" );
    maps\_anim::anim_generic( self, "crawl_loop" );
    maps\_anim::anim_generic( self, "pronecrawl2prone" );
    var_1 = getanimlength( maps\_utility::getanim_generic( "prone2stand" ) );
    thread maps\_anim::anim_generic( self, "prone2stand" );
    wait(var_1 - 0.2);
    self stopanimscripted();
    self allowedstances( "stand", "crouch", "prone" );
    maps\_utility::delaythread( 0.5, maps\scoutsniper_code::scoutsniper_follow_path, var_0, 100 );
    thread maps\scoutsniper_code::price_custom_detection( 300, "price_run_to_dash_last_stretch2" );
    var_1 = getanimlength( maps\_utility::getanim_generic( "stand2run" ) );
    thread maps\_anim::anim_generic( self, "stand2run" );
    wait(var_1 - 0.2);
    self stopanimscripted();

    if ( common_scripts\utility::flag( "town_no_turning_back" ) )
    {
        if ( !common_scripts\utility::flag( "dash_work_as_team" ) )
            level thread maps\_utility::function_stack( maps\_utility::radio_dialogue, "scoutsniper_mcm_ateam" );

        return;
    }

    level endon( "town_no_turning_back" );
    self waittill( "scoutsniper_path_end_reached" );
    level notify( "price_run_to_dash_last_stretch2" );

    if ( !common_scripts\utility::flag( "dash_stealth_unsure" ) )
        maps\scoutsniper_code::try_save( "dash_last" );

    maps\_utility::set_generic_run_anim( "sprint_h1", 1, 0 );
    var_0 = getnode( "dash_last_stretch2", "targetname" );

    if ( distance( level.player.origin, level.price.origin ) < level.hearing_distance )
        level thread maps\_utility::function_stack( maps\_utility::radio_dialogue, "scoutsniper_mcm_readygo" );

    wait 1;

    if ( common_scripts\utility::flag( "dash_sniper_dead" ) )
        return;

    level endon( "dash_sniper_dead" );
    maps\_utility::delaythread( 0.1, maps\scoutsniper_code::scoutsniper_music_play, "scoutsniper_dash_music" );
    level.play_additionnal_fs_sfx = undefined;
    maps\scoutsniper_aud::moving_to_town_submix_handler();
    maps\scoutsniper_code::scoutsniper_follow_path( var_0, 400 );
    self.moveplaybackrate = 1;
    maps\_utility::clear_run_anim();
    wait 1;
    self.ref_node.origin = var_0.origin;
    self.ref_node.angles = var_0.angles + ( 0.0, -90.0, 0.0 );

    if ( distance( level.player.origin, level.price.origin ) < level.hearing_distance )
        level thread maps\_utility::function_stack( maps\_utility::radio_dialogue, "scoutsniper_mcm_holdfast" );

    self.ref_node thread maps\_anim::anim_generic( self, "stop_cornerR" );
    self.ref_node waittill( "stop_cornerR" );
    wait 0.5;

    if ( distance( level.player.origin, level.price.origin ) < level.hearing_distance )
        level thread maps\_utility::function_stack( maps\_utility::radio_dialogue, "scoutsniper_mcm_noonesaw" );

    wait 2.0;
    self.ref_node thread maps\_anim::anim_generic( self, "onme_cornerR" );
    self.ref_node waittill( "onme_cornerR" );
}

dash_sniper()
{
    if ( common_scripts\utility::flag( "_stealth_spotted" ) )
        return;

    level endon( "_stealth_spotted" );

    if ( common_scripts\utility::flag( "dash_sniper_dead" ) )
        return;

    level endon( "dash_sniper_dead" );
    var_0 = getnode( "dash_lookout_node", "targetname" );
    self.custommovetransition = ::dashsniper_exit;
    maps\_utility::delaythread( 1, maps\scoutsniper_code::dynamic_run_speed );
    maps\scoutsniper_code::scoutsniper_follow_path( var_0 );
    self notify( "stop_dynamic_run_speed" );
    var_1 = maps\_utility::get_vehicle( "dash_hind", "targetname" );

    if ( isdefined( var_1 ) )
        var_1 thread maps\_vehicle::lerp_enginesound( 4, 1, 0.75 );

    wait 0.5;
    self.ref_node.origin = var_0.origin;
    self.ref_node.angles = var_0.angles + ( 0.0, -90.0, 0.0 );
    level thread maps\_utility::function_stack( maps\_utility::radio_dialogue, "scoutsniper_mcm_dontmove" );
    self.ref_node thread maps\_anim::anim_generic( self, "stop_cornerR" );
    self.ref_node waittill( "stop_cornerR" );
    self.ref_node thread maps\_anim::anim_generic( self, "enemy_cornerR" );
    level maps\_utility::function_stack( maps\_utility::radio_dialogue, "scoutsniper_mcm_sniperahead" );
    level maps\_utility::function_stack( maps\_utility::radio_dialogue, "scoutsniper_mcm_giveaway" );

    while ( !common_scripts\utility::flag( "dash_sniper_dead" ) )
    {
        wait(randomfloatrange( 12, 15 ));
        level maps\_utility::function_stack( maps\_utility::radio_dialogue, "scoutsniper_mcm_topbalcony" );
    }
}

dash_sniper_approach()
{
    self endon( "death" );

    while ( distance( level.player.origin, self.origin ) > 500 )
        wait 0.1;

    if ( common_scripts\utility::flag( "dash_last" ) )
    {
        common_scripts\utility::flag_set( "dash_killed_by_price" );
        magicbullet( level.price.weapon, level.price gettagorigin( "tag_flash" ), self getshootatpos() );
    }
}

dash_hind_death_dialogue()
{
    level endon( "end" );
    level endon( "dash_hind_deleted" );
    common_scripts\utility::flag_wait( "_stealth_spotted" );
    common_scripts\utility::flag_wait( "dash_hind_down" );
    common_scripts\utility::flag_waitopen( "_stealth_spotted" );
    common_scripts\utility::flag_waitopen( "_stealth_event" );
    common_scripts\utility::flag_waitopen( "_stealth_alert" );
    wait 0.5;
    common_scripts\utility::flag_waitopen( "_stealth_spotted" );
    common_scripts\utility::flag_waitopen( "_stealth_event" );
    common_scripts\utility::flag_waitopen( "_stealth_alert" );

    if ( level.player.health )
        level thread maps\_utility::function_stack( maps\_utility::radio_dialogue, "scoutsniper_mcm_getuskilled" );
}

town_main()
{
    if ( !isalive( level.price ) )
        return;

    level.price endon( "death" );
    common_scripts\utility::flag_wait( "initial_setup_done" );
    thread maps\scoutsniper_code::town_kill_dash_heli();
    level maps\_utility::add_wait( common_scripts\utility::flag_wait, "town_no_turning_back" );
    level maps\_utility::add_func( maps\scoutsniper_code::scoutsniper_music_loop, "scoutsniper_abandoned_music", 117, "end_kill_music" );
    thread maps\_utility::do_wait();
    common_scripts\utility::flag_wait( "town" );
    soundscripts\_snd::snd_message( "start_town_mix" );
    thread maps\scoutsniper_code::dash_fake_easy_mode();
    level.price town_moveup();
    level.price notify( "stop_dynamic_run_speed" );
    level.price town_moveup2();
    level.price notify( "stop_dynamic_run_speed" );
    level.player maps\_stealth_logic::stealth_friendly_movespeed_scale_default();
    maps\_stealth_logic::stealth_detect_ranges_default();
    level.price town_moveup3();
    level.price notify( "stop_dynamic_run_speed" );

    if ( !common_scripts\utility::flag( "_stealth_spotted" ) && !common_scripts\utility::flag( "dash_heli_agro" ) )
        level maps\_utility::delaythread( 1, maps\_utility::function_stack, maps\_utility::radio_dialogue, "scoutsniper_mcm_notthereyet" );

    if ( !common_scripts\utility::flag( "dash_heli_agro" ) )
        maps\scoutsniper_code::try_save( "town" );

    common_scripts\utility::flag_set( "dogs" );
}

town_moveup()
{
    if ( common_scripts\utility::flag( "_stealth_spotted" ) )
        return;

    level endon( "_stealth_spotted" );

    if ( common_scripts\utility::flag( "dash_heli_agro" ) )
        return;

    level endon( "dash_heli_agro" );

    if ( common_scripts\utility::flag( "town_no_turning_back" ) )
        return;

    level endon( "town_no_turning_back" );
    var_0 = getnode( "town_moveup_node", "targetname" );
    maps\_utility::delaythread( 0.5, maps\scoutsniper_code::dynamic_run_speed, undefined, 80 );
    maps\scoutsniper_code::scoutsniper_follow_path( var_0 );
    level thread maps\_utility::function_stack( maps\_utility::radio_dialogue, "scoutsniper_mcm_go" );
}

town_moveup2()
{
    if ( common_scripts\utility::flag( "_stealth_spotted" ) )
        return;

    level endon( "_stealth_spotted" );

    if ( common_scripts\utility::flag( "dash_heli_agro" ) )
        return;

    level endon( "dash_heli_agro" );

    if ( common_scripts\utility::flag( "town_no_turning_back" ) )
        return;

    level endon( "town_no_turning_back" );
    var_0 = getnode( "town_moveup_node2", "targetname" );
    maps\scoutsniper_code::scoutsniper_follow_path( var_0, 180 );
    common_scripts\utility::flag_wait( "town_jumpdown" );
    self notify( "stop_dynamic_run_speed" );
    wait 0.5;
    self.ref_node.origin = var_0.origin;
    self.ref_node.angles = var_0.angles + ( 0.0, -90.0, 0.0 );
    level thread maps\_utility::function_stack( maps\_utility::radio_dialogue, "scoutsniper_mcm_areaclear" );
}

town_moveup3()
{
    if ( common_scripts\utility::flag( "_stealth_spotted" ) )
        return;

    level endon( "_stealth_spotted" );

    if ( common_scripts\utility::flag( "dash_heli_agro" ) )
        return;

    level endon( "dash_heli_agro" );
    var_0 = getnode( "town_moveup_node3", "targetname" );
    thread maps\scoutsniper_code::dynamic_run_speed( undefined, 80 );
    maps\scoutsniper_code::scoutsniper_follow_path( var_0, 400 );
    self notify( "stop_dynamic_run_speed" );
}

dogs_main()
{
    if ( !isalive( level.price ) )
        return;

    level.price endon( "death" );
    common_scripts\utility::array_thread( getentarray( "dogs_backup", "targetname" ), maps\_utility::add_spawn_function, maps\_stealth_logic::stealth_ai );
    common_scripts\utility::array_thread( getentarray( "dogs_backup", "targetname" ), maps\_utility::add_spawn_function, ::dogs_backup );
    common_scripts\utility::array_thread( getentarray( "dogs_food", "script_noteworthy" ), maps\_utility::add_spawn_function, ::dogs_food );
    common_scripts\utility::array_thread( getentarray( "dogs_eater", "script_noteworthy" ), maps\_utility::add_spawn_function, ::dogs_eater );
    common_scripts\utility::array_thread( getentarray( "dogs_eater", "script_noteworthy" ), maps\_utility::add_spawn_function, ::dogs_eater_death );
    common_scripts\utility::flag_wait( "initial_setup_done" );
    common_scripts\utility::flag_wait( "dogs" );
    soundscripts\_snd::snd_message( "start_dogs_mix" );
    level.price dogs_moveup();

    if ( !common_scripts\utility::flag( "_stealth_spotted" ) && !common_scripts\utility::flag( "dogs_dog_dead" ) && !common_scripts\utility::flag( "dogs_backup" ) )
        maps\scoutsniper_code::try_save( "dogs1" );

    level.price dogs_sneakpast();
    common_scripts\utility::flag_waitopen( "_stealth_spotted" );
    common_scripts\utility::flag_waitopen( "_stealth_event" );
    common_scripts\utility::flag_waitopen( "dogs_dog_dead" );
    common_scripts\utility::flag_waitopen( "dogs_backup" );
    common_scripts\utility::flag_waitopen( "dash_heli_agro" );
    wait 0.5;
    common_scripts\utility::flag_waitopen( "_stealth_spotted" );
    common_scripts\utility::flag_waitopen( "_stealth_event" );
    common_scripts\utility::flag_waitopen( "dogs_dog_dead" );
    common_scripts\utility::flag_waitopen( "dogs_backup" );
    common_scripts\utility::flag_waitopen( "dash_heli_agro" );
    common_scripts\utility::flag_set( "center" );
    level.price.ignoreme = 1;
}

dogs_food()
{
    self.diequietly = 1;
    self.deathanim = %covercrouch_death_1;
    maps\_utility::gun_remove();
    self kill();
}

dogs_eater()
{
    self endon( "death" );
    var_0 = getent( "dogs_eat_node", "targetname" );
    self.ref_node = var_0;
    self.ref_angles = var_0.angles;
    self.mode = "none";
    self.health = 1;
    self.maxhealth = 1;
    var_1 = self.goalradius;
    self.goalradius = 4;
    self linkto( var_0 );
    thread dog_eater_unlink_on_death();

    for (;;)
    {
        if ( distance( self.origin, level.player.origin ) > 500 )
            thread maps\scoutsniper_code::dogs_eater_eat();
        else if ( distance( self.origin, level.player.origin ) > 350 )
            thread maps\scoutsniper_code::dogs_eater_growl();
        else if ( distance( self.origin, level.player.origin ) > 200 )
            thread maps\scoutsniper_code::dogs_eater_bark();
        else
            break;

        wait 0.1;
    }

    self unlink();
    self.goalradius = var_1;
    self notify( "stop_loop" );
    self.ref_node notify( "stop_loop" );
    self stopanimscripted();
    self.favoriteenemy = level.player;
}

dog_eater_unlink_on_death()
{
    self waittill( "death" );

    if ( isdefined( self ) )
        self unlink();
}

dogs_eater_death()
{
    level endon( "dogs_delete_dogs" );
    self waittill( "death" );

    if ( isdefined( self ) )
        self stoploopsound();

    common_scripts\utility::flag_set( "dogs_dog_dead" );
    common_scripts\utility::trigger_on( "dogs_backup", "target" );
    common_scripts\utility::flag_wait( "dogs_backup" );
    level.price maps\_utility::stop_magic_bullet_shield();
    thread maps\scoutsniper_code::scoutsniper_music_play( "scoutsniper_surrounded_music" );
    wait 3;
    level thread maps\_utility::function_stack( maps\_utility::radio_dialogue, "scoutsniper_mcm_soundgood" );
    common_scripts\utility::flag_wait( "_stealth_spotted" );
    common_scripts\utility::flag_waitopen( "_stealth_spotted" );
    common_scripts\utility::flag_waitopen( "_stealth_event" );
    common_scripts\utility::flag_clear( "dogs_backup" );

    if ( isalive( level.price ) && !isdefined( level.price.magic_bullet_shield ) )
        level.price maps\_utility::delaythread( 0.1, maps\_utility::magic_bullet_shield );

    if ( !isalive( level.price ) )
        return;

    level thread maps\_utility::function_stack( maps\_utility::radio_dialogue, "scoutsniper_mcm_whew" );
    maps\_utility::delaythread( 0.1, maps\scoutsniper_code::scoutsniper_music_loop, "scoutsniper_abandoned_music", 117, "end_kill_music" );
}

dogs_backup()
{
    common_scripts\utility::flag_set( "dogs_backup" );
    common_scripts\utility::flag_clear( "dogs_dog_dead" );

    if ( !isalive( self ) )
        return;

    self endon( "death" );

    if ( isdefined( self.script_animation ) )
    {
        maps\_utility::script_delay();
        self playsound( "anml_dog_excited_distant" );
        wait(randomfloatrange( 1.5, 3 ));
    }
    else
        wait(randomfloatrange( 4, 6 ));

    self.ignoreall = 0;
    self setthreatbiasgroup();

    if ( randomint( 100 ) > 65 && isalive( level.price ) )
        self.favoriteenemy = level.price;
    else if ( isalive( level.player ) )
        self.favoriteenemy = level.player;

    if ( isalive( level.price ) )
        level.price.ignoreme = 0;
}

dogs_moveup()
{
    if ( common_scripts\utility::flag( "_stealth_spotted" ) )
        return;

    level endon( "_stealth_spotted" );

    if ( common_scripts\utility::flag( "dogs_backup" ) )
        return;

    level endon( "dogs_backup" );

    if ( common_scripts\utility::flag( "dogs_dog_dead" ) )
        return;

    level endon( "dogs_dog_dead" );

    if ( common_scripts\utility::flag( "dash_heli_agro" ) )
        return;

    level endon( "dash_heli_agro" );
    var_0 = getnode( "dogs_moveup_node1", "targetname" );
    thread maps\scoutsniper_code::dynamic_run_speed( undefined, 140 );
    thread maps\scoutsniper_code::scoutsniper_follow_path( var_0, undefined, 0.8 );
    self waittill( "scoutsniper_path_end_reached" );
    self notify( "stop_dynamic_run_speed" );
    wait 0.5;
    maps\_utility::enable_cqbwalk();
    self.ref_node.origin = self.origin;
    self.ref_node.angles = self.angles;
    level thread maps\_utility::function_stack( maps\_utility::radio_dialogue, "scoutsniper_mcm_stop" );
    self.ref_node thread maps\_anim::anim_generic( self, "stop2_exposed" );
    self.ref_node waittill( "stop2_exposed" );
    level thread maps\_utility::function_stack( maps\_utility::radio_dialogue, "scoutsniper_mcm_wilddog" );
    self.ref_node thread maps\_anim::anim_generic( self, "enemy_exposed" );
    self.ref_node waittill( "enemy_exposed" );
    self.a.bdisablemovetwitch = 1;
    var_0 = getent( "dogs_moveup_node2", "targetname" );
    var_0 maps\_anim::anim_generic_reach( self, "cqb_look_around" );
    var_0 thread maps\_anim::anim_generic( self, "cqb_look_around" );
    self.a.bdisablemovetwitch = 0;
    wait 1;
    var_0 = getnode( "dogs_moveup_node3", "targetname" );
    maps\scoutsniper_code::scoutsniper_follow_path( var_0 );
}

dogs_sneakpast()
{
    if ( common_scripts\utility::flag( "_stealth_spotted" ) )
        return;

    level endon( "_stealth_spotted" );

    if ( common_scripts\utility::flag( "dogs_backup" ) )
        return;

    level endon( "dogs_backup" );

    if ( common_scripts\utility::flag( "dogs_dog_dead" ) )
        return;

    level endon( "dogs_dog_dead" );

    if ( common_scripts\utility::flag( "dash_heli_agro" ) )
        return;

    level endon( "dash_heli_agro" );
    level maps\_utility::function_stack( maps\_utility::radio_dialogue, "scoutsniper_mcm_pooch" );
    level maps\_utility::delaythread( 1, maps\_utility::function_stack, maps\_utility::radio_dialogue, "scoutsniper_mcm_noneed" );
    var_0 = getnode( "dogs_sneakpast", "targetname" );
    maps\scoutsniper_code::scoutsniper_follow_path( var_0, 200 );
    var_0 = self.last_set_goalnode;
    self.ref_node.origin = var_0.origin;
    self.ref_node.angles = var_0.angles + ( 0.0, -90.0, 0.0 );
    level maps\_utility::function_stack( maps\_utility::radio_dialogue, "scoutsniper_mcm_clearright" );
    level thread maps\_utility::function_stack( maps\_utility::radio_dialogue, "scoutsniper_mcm_go" );
    self.ref_node thread maps\_anim::anim_generic( self, "moveout_cornerR" );
    self.ref_node waittill( "moveout_cornerR" );
}

center_main()
{
    if ( !isalive( level.price ) )
        return;

    level.price endon( "death" );
    common_scripts\utility::flag_wait( "initial_setup_done" );
    common_scripts\utility::flag_wait( "center" );
    soundscripts\_snd::snd_message( "start_center_mix" );
    level.player playsound( "playground_memory" );
    thread center_handle_heli();
    level.price.custommovetransition = ::center_exit;
    level.price center_moveup();
    common_scripts\utility::flag_waitopen( "_stealth_spotted" );
    common_scripts\utility::flag_waitopen( "dogs_dog_dead" );
    common_scripts\utility::flag_waitopen( "dogs_backup" );
    level.price center_moveup2();
    common_scripts\utility::flag_waitopen( "_stealth_spotted" );
    common_scripts\utility::flag_waitopen( "dogs_dog_dead" );
    common_scripts\utility::flag_waitopen( "dogs_backup" );
    common_scripts\utility::flag_set( "dogs_delete_dogs" );
    common_scripts\utility::trigger_off( "dogs_backup", "target" );
    level.price center_moveup3();
    level.price center_moveup4();
    common_scripts\utility::flag_set( "end" );
}

center_handle_heli()
{
    var_0 = "kill_center_handle_heli_thread";
    level endon( var_0 );
    var_1 = getent( "trigger_school_heli", "script_noteworthy" );
    var_1 waittill( "trigger" );
    soundscripts\_snd::snd_message( "start_school_heli_mix" );
    var_2 = getent( "center_heli_path", "targetname" );
    var_2 waittill( "trigger", var_3 );
    var_4 = getent( "heli_restart_avm", "script_noteworthy" );
    var_3 thread maps\scoutsniper_aud::aud_start_school_heli_scripted_sequence( var_4 );
    thread maps\scoutsniper_aud::aud_school_heli_rumble();
    var_3 endon( "death" );
    target_set( var_3, ( 0.0, 0.0, -80.0 ) );
    target_setjavelinonly( var_3, 1 );
    var_3 thread maps\scoutsniper_code::center_heli_quake( var_0 );
    var_3 playrumblelooponentity( "heli_loop" );
    var_3 common_scripts\utility::delaycall( 10, ::stoprumble, "heli_loop" );
    level thread maps\_utility::notify_delay( var_0, 10 );
}

center_moveup()
{
    if ( common_scripts\utility::flag( "_stealth_spotted" ) )
        return;

    level endon( "_stealth_spotted" );

    if ( common_scripts\utility::flag( "dogs_backup" ) )
        return;

    level endon( "dogs_backup" );

    if ( common_scripts\utility::flag( "dogs_dog_dead" ) )
        return;

    level endon( "dogs_dog_dead" );
    maps\_utility::disable_cqbwalk();
    maps\_utility::delaythread( 0.5, maps\scoutsniper_code::dynamic_run_speed, undefined, 80 );
    var_0 = getnode( "center_node1", "targetname" );
    maps\scoutsniper_code::scoutsniper_follow_path( var_0 );
    level thread maps\_utility::function_stack( maps\_utility::radio_dialogue, "scoutsniper_mcm_forwardclear" );
}

center_moveup2()
{
    if ( common_scripts\utility::flag( "_stealth_spotted" ) )
        return;

    level endon( "_stealth_spotted" );

    if ( common_scripts\utility::flag( "dogs_backup" ) )
        return;

    level endon( "dogs_backup" );

    if ( common_scripts\utility::flag( "dogs_dog_dead" ) )
        return;

    level endon( "dogs_dog_dead" );
    var_0 = getnode( "center_node2", "targetname" );
    thread maps\scoutsniper_code::scoutsniper_follow_path( var_0 );

    if ( distance( self.origin, var_0.origin ) > 700 )
    {
        maps\_utility::disable_cqbwalk();
        maps\_utility::delaythread( 0.5, maps\scoutsniper_code::dynamic_run_speed, undefined, 80 );
    }
    else
        maps\_utility::enable_cqbwalk();

    var_0 waittill( "trigger" );
    self notify( "stop_dynamic_run_speed" );
    maps\_utility::enable_cqbwalk();
    self waittill( "scoutsniper_path_end_reached" );
    level thread maps\_utility::function_stack( maps\_utility::radio_dialogue, "scoutsniper_mcm_moveup" );
}

center_moveup3()
{
    maps\_utility::disable_cqbwalk();
    var_0 = getnode( "center_node4", "targetname" );
    thread maps\scoutsniper_code::scoutsniper_follow_path( var_0, 325 );
    var_0 waittill( "trigger" );
    self notify( "stop_dynamic_run_speed" );
    maps\_utility::enable_cqbwalk();
    wait 2;
    level thread maps\_utility::function_stack( maps\_utility::radio_dialogue, "scoutsniper_mcm_ghosttown" );
    self waittill( "scoutsniper_path_end_reached" );
}

center_moveup4()
{
    maps\_utility::disable_cqbwalk();
    var_0 = getnode( "center_node5", "targetname" );
    maps\scoutsniper_code::scoutsniper_follow_path( var_0, 200 );
    wait 0.25;
    self.ref_node.origin = var_0.origin;
    self.ref_node.angles = var_0.angles + ( 0.0, -90.0, 0.0 );
    level thread maps\_utility::function_stack( maps\_utility::radio_dialogue, "scoutsniper_mcm_move" );
    self.ref_node thread maps\_anim::anim_generic( self, "moveout_cornerR" );
    self.ref_node waittill( "moveout_cornerR" );
    maps\_utility::enable_cqbwalk();
    var_0 = getnode( "center_node6", "targetname" );
    maps\scoutsniper_code::scoutsniper_follow_path( var_0 );
}

end_main()
{
    if ( !isalive( level.price ) )
        return;

    level.price endon( "death" );
    common_scripts\utility::flag_wait( "initial_setup_done" );
    common_scripts\utility::flag_wait( "end" );
    soundscripts\_snd::snd_message( "start_end_mix" );
    level.price end_moveup();
    common_scripts\utility::flag_set( "level_complete" );
}

end_moveup()
{
    var_0 = getnode( "end_node_look", "targetname" );
    level thread maps\_utility::function_stack( maps\_utility::radio_dialogue, "scoutsniper_mcm_letsgo" );
    maps\_utility::disable_cqbwalk();
    var_1 = getdvarfloat( "scoutsniper_macmillan_sprintwait_end", 2.5 );
    maps\_utility::delaythread( var_1, maps\scoutsniper_code::dynamic_run_speed, undefined, 80 );

    if ( getdvarint( "use_old_outtro" ) == 1 )
    {
        maps\scoutsniper_code::scoutsniper_follow_path( var_0, 200 );
        level thread maps\_utility::function_stack( maps\_utility::radio_dialogue, "scoutsniper_mcm_thereshotel" );
        var_2 = var_0.origin;
        var_3 = anglestoforward( var_0.angles );
        var_3 = maps\_utility::vector_multiply( var_3, 100 );
        var_2 += var_3;
        var_2 += ( 0.0, 0.0, 80.0 );
        var_4 = spawn( "script_origin", var_2 );
        var_4 movez( 30, 2.5 );
        maps\_utility::enable_cqbwalk();
        maps\_utility::cqb_aim( var_4 );
        wait 2.5;
        var_4 moveto( var_4.origin + ( 0.0, 100.0, 60.0 ), 2.5 );
        wait 2.5;
        maps\_utility::disable_cqbwalk();
        var_4 delete();
        var_0 = getnode( "end_node_end", "targetname" );
        self setgoalnode( var_0 );
        self.goalradius = 16;
        wait 3;
    }
    else
    {
        wait 0.5;
        var_5 = spawn( "script_origin", ( 12681.0, 8698.45, -150.532 ) );
        var_5 maps\_anim::anim_reach_solo( level.price, "outtro" );
        self notify( "stop_dynamic_run_speed" );
        var_6 = getanimlength( maps\_utility::getanim( "outtro" ) );
        var_5 thread maps\_anim::anim_single_solo( level.price, "outtro" );
        wait(var_6 - 1.5);
    }
}

level_complete()
{
    common_scripts\utility::flag_wait( "level_complete" );

    if ( !common_scripts\utility::flag( "broke_stealth" ) )
        maps\_utility::giveachievement_wrapper( "GHILLIES_IN_THE_MIST" );

    maps\_loadout_code::saveplayerweaponstatepersistent( "scoutsniper" );
    maps\_utility::nextmission();
}

objective_main()
{
    waittillframeend;

    if ( level.start_point == "default" )
    {
        common_scripts\utility::flag_wait( "intro" );
        wait 14;
    }

    objective_add( 1, "active", &"SCOUTSNIPER_FOLLOW_CPT_MACMILLAN" );
    objective_current( 1 );
    objective_onentity( 1, level.price );
}

start_intro()
{
    soundscripts\_snd::snd_message( "aud_start_intro_checkpoint" );
    start_common();
    common_scripts\utility::flag_set( "initial_setup_done" );
}

start_church()
{
    soundscripts\_snd::snd_message( "aud_start_church_checkpoint" );
    start_church_x();
    common_scripts\utility::array_thread( getentarray( "tableguards", "script_noteworthy" ), maps\_utility::add_spawn_function, maps\_stealth_logic::stealth_ai );
    common_scripts\utility::array_thread( getentarray( "tableguards", "script_noteworthy" ), maps\_utility::add_spawn_function, maps\scoutsniper_code::idle_anim_think );
    common_scripts\utility::array_thread5( getentarray( "tableguards", "script_noteworthy" ), maps\_utility::add_spawn_function, maps\_stealth_behavior::ai_create_behavior_function, "alert", "attack", maps\scoutsniper_code::intro_attack_logic );
    common_scripts\utility::array_thread( getentarray( "tableguard_last_patrol", "targetname" ), maps\_utility::add_spawn_function, ::intro_lastguy_think );
    maps\_utility::delaythread( 0.1, maps\scoutsniper_code::scripted_array_spawn, "tableguards", "script_noteworthy", 1 );
    maps\_utility::delaythread( 0.1, maps\scoutsniper_code::scripted_array_spawn, "intro_dogs", "script_noteworthy", 1 );
    common_scripts\utility::flag_set( "initial_setup_done" );
}

start_church_x()
{
    start_common();
    thread intro_to_church_spotted();
    level.price maps\scoutsniper_code::teleport_actor( getnode( "church_price_node1", "targetname" ) );
    maps\scoutsniper_code::teleport_player_to_start_point( "church" );
    common_scripts\utility::flag_set( "initial_setup_done" );
    thread maps\_utility::flag_set_delayed( "intro_last_patrol", 2 );
    thread maps\_utility::flag_set_delayed( "intro_left_area", 0.5 );
}

start_graveyard()
{
    soundscripts\_snd::snd_message( "aud_start_graveyard_checkpoint" );
    start_graveyard_x();
    common_scripts\utility::array_thread( getentarray( "tableguards", "script_noteworthy" ), maps\_utility::add_spawn_function, maps\_stealth_logic::stealth_ai );
    common_scripts\utility::array_thread( getentarray( "tableguards", "script_noteworthy" ), maps\_utility::add_spawn_function, maps\scoutsniper_code::idle_anim_think );
    common_scripts\utility::array_thread( getentarray( "tableguard_last_patrol", "targetname" ), maps\_utility::add_spawn_function, ::intro_lastguy_think );
    maps\_utility::delaythread( 0.1, maps\scoutsniper_code::scripted_array_spawn, "tableguards", "script_noteworthy", 1 );
    maps\_utility::delaythread( 0.1, maps\scoutsniper_code::scripted_array_spawn, "intro_dogs", "script_noteworthy", 1 );
}

start_graveyard_x()
{
    start_common();
    var_0 = getent( "church_door_front", "targetname" );
    var_0 thread maps\scoutsniper_code::door_open_slow();
    level.price maps\scoutsniper_code::teleport_actor( getnode( "church_price_backdoor_node", "targetname" ) );
    maps\scoutsniper_code::teleport_player_to_start_point( "graveyard" );
    common_scripts\utility::flag_set( "initial_setup_done" );
    thread maps\_utility::flag_set_delayed( "graveyard_moveup", 1 );
}

start_field()
{
    soundscripts\_snd::snd_message( "aud_start_field_checkpoint" );
    start_common();
    level.price maps\scoutsniper_code::teleport_actor( getnode( "price_field_start", "targetname" ) );
    maps\scoutsniper_code::teleport_player_to_start_point();
    waittillframeend;
    common_scripts\utility::flag_set( "initial_setup_done" );
    common_scripts\utility::flag_set( "field" );
}

start_pond()
{
    soundscripts\_snd::snd_message( "aud_start_pond_checkpoint" );
    start_common();
    waittillframeend;
    var_0 = getent( "pond_guys_trig", "targetname" );
    var_0 notify( "trigger" );
    level.price maps\scoutsniper_code::teleport_actor( getent( "field_price_clear", "targetname" ) );
    waittillframeend;
    maps\scoutsniper_code::teleport_player_to_start_point();
    common_scripts\utility::flag_set( "initial_setup_done" );
    common_scripts\utility::flag_set( "field_price_done" );
    common_scripts\utility::flag_set( "pond" );
}

start_cargo()
{
    soundscripts\_snd::snd_message( "aud_start_cargo_checkpoint" );
    start_common();
    common_scripts\utility::trigger_off( "pond_backup", "target" );
    waittillframeend;
    level.price maps\scoutsniper_code::teleport_actor( getnode( "cargo_price_node1", "targetname" ) );
    maps\scoutsniper_code::teleport_player_to_start_point();
    waittillframeend;
    thread maps\_stealth_behavior::default_event_awareness( maps\scoutsniper_code::default_event_awareness_dialogue );
    common_scripts\utility::flag_set( "initial_setup_done" );
    common_scripts\utility::flag_set( "cargo" );
    common_scripts\utility::flag_set( "field_price_done" );
}

start_dash()
{
    soundscripts\_snd::snd_message( "aud_start_dash_checkpoint" );
    start_common();
    level.price maps\scoutsniper_code::teleport_actor( getnode( "dash_price_start_node", "targetname" ) );
    maps\scoutsniper_code::teleport_player_to_start_point();
    waittillframeend;
    thread maps\_stealth_behavior::default_event_awareness( maps\scoutsniper_code::default_event_awareness_dialogue );
    level.dash_section = 1;
    common_scripts\utility::flag_set( "initial_setup_done" );
    common_scripts\utility::flag_set( "dash" );
}

start_town()
{
    soundscripts\_snd::snd_message( "aud_start_town_checkpoint" );
    start_common();
    common_scripts\utility::trigger_off( "dash_sniper", "target" );
    waittillframeend;
    level.price maps\scoutsniper_code::teleport_actor( getnode( "town_moveup_node", "targetname" ) );
    maps\scoutsniper_code::teleport_player_to_start_point();
    waittillframeend;
    common_scripts\utility::flag_set( "initial_setup_done" );
    common_scripts\utility::flag_set( "town" );
}

start_dogs()
{
    soundscripts\_snd::snd_message( "aud_start_dogs_checkpoint" );
    start_common();
    level.price maps\scoutsniper_code::teleport_actor( getnode( "dogs_moveup_node1", "targetname" ) );
    maps\scoutsniper_code::teleport_player_to_start_point();
    common_scripts\utility::flag_set( "initial_setup_done" );
    common_scripts\utility::flag_set( "dogs" );
}

start_center()
{
    soundscripts\_snd::snd_message( "aud_start_center_checkpoint" );
    start_common();
    level.price maps\scoutsniper_code::teleport_actor( getnode( "center_node1", "targetname" ) );
    maps\scoutsniper_code::teleport_player_to_start_point();
    common_scripts\utility::flag_set( "initial_setup_done" );
    common_scripts\utility::flag_set( "center" );
}

start_end()
{
    soundscripts\_snd::snd_message( "aud_start_end_checkpoint" );
    start_common();
    level.price maps\scoutsniper_code::teleport_actor( getnode( "center_node_last", "targetname" ) );
    maps\scoutsniper_code::teleport_player_to_start_point();
    common_scripts\utility::flag_set( "initial_setup_done" );
    common_scripts\utility::flag_set( "end" );
}

start_common()
{
    initlevel();
    initplayer();
    initprice();
    maps\scoutsniper_code::initdogs();
    miscprecache();
    thread maps\scoutsniper_code::clean_previous_ai( "field_clean_ai", "patrollers", "script_noteworthy" );
    thread maps\scoutsniper_code::clean_previous_ai( "field_clean_ai", "tableguards", "script_noteworthy" );
    thread maps\scoutsniper_code::clean_previous_ai( "field_clean_ai", "intro_dogs", "script_noteworthy" );
    thread maps\scoutsniper_code::clean_previous_ai( "field_clean_ai", "church_smoker", "script_noteworthy" );
    thread maps\scoutsniper_code::clean_previous_ai( "field_clean_ai", "church_lookout", "script_noteworthy" );
    thread maps\scoutsniper_code::clean_corpse( "field_start" );
    thread maps\scoutsniper_code::clean_previous_ai( "cargo", "field_guard", "script_noteworthy" );
    thread maps\scoutsniper_code::clean_previous_ai( "cargo", "field_guard2", "script_noteworthy" );
    thread maps\scoutsniper_code::clean_previous_ai( "dash_spawn", "pond_patrol", "script_noteworthy" );
    thread maps\scoutsniper_code::clean_previous_ai( "dash_spawn", "pond_throwers", "script_noteworthy" );
    thread maps\scoutsniper_code::clean_previous_ai( "dash_spawn", "pond_backup", "script_noteworthy" );
    thread maps\scoutsniper_code::clean_previous_ai( "dash_clean_ai", "cargo_smokers", "script_noteworthy" );
    thread maps\scoutsniper_code::clean_previous_ai( "dash_clean_ai", "cargo_patrol_defend1", "script_noteworthy" );
    thread maps\scoutsniper_code::clean_previous_ai( "dash_clean_ai", "cargo_patrol_defend2", "script_noteworthy" );
    thread maps\scoutsniper_code::clean_previous_ai( "dash_clean_ai", "cargo_sleeper", "script_noteworthy" );
    thread maps\scoutsniper_code::clean_previous_ai( "town_no_turning_back" );
    thread maps\scoutsniper_code::clean_previous_ai( "dogs_delete_dogs" );
    common_scripts\utility::array_thread( getentarray( "fake_radiation", "targetname" ), maps\scoutsniper_code::fake_radiation );
    common_scripts\utility::trigger_off( "dogs_backup", "target" );
    common_scripts\utility::trigger_off( "dash_bus_guys", "target" );
    common_scripts\utility::trigger_off( "dash_last_runner", "target" );
    common_scripts\utility::trigger_off( "dash_on_road_guy", "target" );
}

miscprecache()
{
    precacheitem( "flash_grenade" );
    precacheitem( "hind_FFAR" );
    precachemodel( "tag_origin" );
    precachemodel( "com_folding_chair" );
    precachemodel( "vehicle_bm21_mobile_cover" );
    precachestring( &"SCRIPT_ARMOR_DAMAGE" );
    precachestring( &"SCOUTSNIPER_FRIENDLY_FIRE_WILL_NOT" );
    precachestring( &"SCOUTSNIPER_YOUR_ACTIONS_GOT_CPT" );
    precachestring( &"SCOUTSNIPER_LEFT_BEHIND" );
    precacherumble( "bmp_rumble" );
    precacherumble( "heli_loop" );
}

initlevel()
{
    level.cosine["180"] = cos( 180 );
    level.minbmpexplosiondmg = 50;
    level.maxbmpexplosiondmg = 100;
    level.bmpcannonrange = 2048;
    level.bmpmgrange = 850;
    level.bmpmgrangesquared = level.bmpmgrange * level.bmpmgrange;
    thread stealth_achievement();
    thread maps\_radiation::main();
    maps\scoutsniper_code::initpronedof();
    thread maps\scoutsniper_code::player_grenade_check();
    maps\_utility::battlechatter_off( "allies" );
    maps\_utility::battlechatter_off( "axis" );
    common_scripts\utility::array_thread( getentarray( "clip_nosight", "targetname" ), maps\scoutsniper_code::clip_nosight_logic );
    common_scripts\utility::trigger_off( "field_clean", "script_noteworthy" );
    createthreatbiasgroup( "price" );
    createthreatbiasgroup( "dog" );
    setignoremegroup( "price", "dog" );
    maps\_utility::delaythread( 0.5, ::initlevel2 );
    var_0 = getent( "doggie_clip", "targetname" );
    var_0 notsolid();
    var_0 connectpaths();
    maps\scoutsniper_code::hint_setup();
}

initlevel2()
{
    anim.shootenemywrapper_func = maps\scoutsniper_code::shootenemywrapper_ssnotify;
}

stealth_achievement()
{
    common_scripts\utility::flag_wait( "_stealth_spotted" );
    common_scripts\utility::flag_set( "broke_stealth" );
}

initplayer()
{
    level.player initplayer_proc();
}

initplayer_proc()
{
    self setthreatbiasgroup( "allies" );
    thread maps\_stealth_logic::stealth_ai();
    thread maps\scoutsniper_code::player_noprone_water();
}

giveweapons()
{
    level.player enableweapons();
    level.player maps\_utility::play_sound_on_entity( "scn_scoutsniper_sniper_raise" );
}

player_health_shield()
{
    level.player enablehealthshield( 0 );

    for (;;)
    {
        level.player waittill( "death" );
        level.player enablehealthshield( 1 );
    }
}

initprice()
{
    var_0 = getent( "price", "script_noteworthy" );
    level.price = var_0 dospawn();
    level.price.ref_node = spawn( "script_origin", level.price.origin );
    maps\_utility::spawn_failed( level.price );
    level.price.fixednode = 0;
    level.price.ignoreall = 1;
    level.price.ignoreme = 1;
    level.price maps\_utility::disable_ai_color();
    level.price setthreatbiasgroup( "allies" );
    level.price thread maps\_stealth_logic::stealth_ai();
    level.price.animname = "price";
    level.price thread maps\_utility::magic_bullet_shield();
    level.price maps\_utility::make_hero();
    level.price thread maps\scoutsniper_code::price_death();
    level.price setthreatbiasgroup( "price" );
    level.price thread maps\scoutsniper_code::shootenemywrapper_price();
    thread maps\scoutsniper_code::default_corpse_dialogue();
    thread maps\scoutsniper_code::default_spotted_dialogue();
    level.price thread monitor_macmellon();
}

monitor_macmellon()
{
    thread maps\_cheat::melonhead_monitor();

    for (;;)
    {
        if ( level.melonhead_mode_enabled )
            self.name = "Cpt. MacMellon";
        else
            self.name = "Cpt. MacMillan";

        level waittill( "melonhead_mode_updated" );
    }
}

#using_animtree("vehicles");

graveyard_hind_detect_damage()
{
    self endon( "death" );
    level endon( "_stealth_spotted" );
    var_0 = spawn( "script_model", self.origin );
    var_0.angles = self.angles;
    var_0 setmodel( self.model );
    var_0 linkto( self );
    self.body = var_0;
    self hide();
    var_0 useanimtree( #animtree );
    var_0 setanim( %bh_rotors );
    thread graveyard_hind_kill_body( var_0 );
    var_0 setcandamage( 1 );
    var_0 waittill( "damage" );

    if ( isdefined( self ) )
        self show();

    if ( isdefined( var_0 ) )
        var_0 delete();

    self notify( "enemy" );
    wait 0.25;
    self notify( "enemy" );

    if ( isdefined( var_0 ) )
        var_0 delete();
}

dash_hind_detect_damage()
{
    self endon( "death" );
    level endon( "_stealth_spotted" );
    var_0 = spawn( "script_model", self.origin );
    var_0.angles = self.angles;
    var_0 setmodel( self.model );
    var_0 linkto( self );
    var_0 hide();
    self.body = var_0;
    var_0 useanimtree( #animtree );
    var_0 setanim( %bh_rotors );
    thread graveyard_hind_kill_body( var_0 );
    var_0 setcandamage( 1 );
    var_0 waittill( "damage" );

    if ( isdefined( self ) )
        self show();

    if ( isdefined( var_0 ) )
        var_0 delete();

    common_scripts\utility::flag_set( "_stealth_spotted" );

    if ( isdefined( var_0 ) )
        var_0 delete();
}
