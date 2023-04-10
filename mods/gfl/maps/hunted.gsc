// H1 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

dead_script()
{
    common_scripts\_ca_blockout::init();
    common_scripts\utility::flag_init( "aa_flight" );
    common_scripts\utility::flag_init( "blackhawk_hit" );
    common_scripts\utility::flag_init( "aa_crash" );
    common_scripts\utility::flag_init( "wakeup_done" );
    common_scripts\utility::flag_init( "aa_farm" );
    maps\createart\hunted_art::main();
    maps\hunted_fx::main();
    maps\hunted_precache::main();
    maps\_load::main();
    maps\hunted_anim::main();
    level thread maps\hunted_amb::main();
    maps\hunted_lighting::main();
    maps\hunted_windmill::main();
}

main()
{
    if ( getdvar( "r_reflectionProbeGenerate" ) == "1" )
        return;

    if ( getdvar( "beautiful_corner" ) == "1" )
    {
        dead_script();
        return;
    }

    maps\_utility::add_start( "crash", ::start_crash, &"STARTS_CRASH" );
    maps\_utility::add_start( "path", ::start_dirt_path, &"STARTS_PATH" );
    maps\_utility::add_start( "barn", ::start_barn, &"STARTS_BARN" );
    maps\_utility::add_start( "field", ::start_field, &"STARTS_FIELD2" );
    maps\_utility::add_start( "basement", ::start_basement, &"STARTS_BASEMENT" );
    maps\_utility::add_start( "dogs", ::start_farm, &"STARTS_DOGS" );
    maps\_utility::add_start( "farm", ::start_farm, &"STARTS_FARM" );
    maps\_utility::add_start( "creek", ::start_creek, &"STARTS_CREEK" );
    maps\_utility::add_start( "greenhouse", ::start_greenhouse, &"STARTS_GREENHOUSE" );
    maps\_utility::add_start( "ac130", ::start_ac130, &"STARTS_AC130" );
    precachemodel( "com_flashlight_on" );
    precachemodel( "h1_prop_dogtag" );
    precachemodel( "vehicle_blackhawk_hero_interior" );
    character\character_sp_pilot_zack_woodland::precache();
    precacheitem( "hunted_crash_missile_hunted" );
    precacherumble( "tank_rumble" );
    precacherumble( "generic_attack_medium_500" );
    precacherumble( "generic_attack_heavy_500" );
    precacherumble( "generic_attack_heavy_750" );
    createthreatbiasgroup( "player" );
    createthreatbiasgroup( "dogs" );
    createthreatbiasgroup( "oblivious" );
    createthreatbiasgroup( "heli_guy" );
    setup_flags();
    maps\_utility::default_start( ::start_default );
    maps\hunted_precache::main();
    maps\_vehicle::build_aianims_with_classname( "script_vehicle_blackhawk_hero", ::blackhawk_overrides, vehicle_scripts\_blackhawk::set_vehicle_anims );
    maps\_load::set_player_viewhand_model( "h2_gfl_m4_sopmod_ii_worldhands" );
    animscripts\dog\dog_init::initdoganimations();
    setsaveddvar( "r_reactiveMotionWindAmplitudeScale", 3 );
    setsaveddvar( "r_reactiveMotionWindStrength", 1 );
    setsaveddvar( "r_reactiveMotionWindFrequencyScale", 3 );
    setsaveddvar( "r_reactiveMotionWindAreaScale", 33.3 );
    setsaveddvar( "r_reactiveMotionHelicopterRadius", 800 );
    setsaveddvar( "r_reactiveMotionHelicopterStrength", 8 );
    setsaveddvar( "r_lodFOVScaleOverride", 1 );
    setsaveddvar( "r_lodFOVScaleOverrideAmount", 0.85 );
    setsaveddvar( "r_lodFOVScaleOverrideStopMaxAngle", 30 );
    setsaveddvar( "r_lodFOVScaleOverrideStopMinAngle", 35 );
    setsaveddvar( "r_lodFOVScaleOverrideStartMaxAngle", 65 );
    setsaveddvar( "r_lodFOVScaleOverrideStartMinAngle", 55 );
    level.weaponclipmodels = [];
    level.weaponclipmodels[0] = "weapon_ak74u_clip";
    level.weaponclipmodels[1] = "weapon_g36_clip";
    level.weaponclipmodels[2] = "weapon_m16_clip";
    level.weaponclipmodels[3] = "weapon_ak47_clip";
    level.weaponclipmodels[4] = "weapon_mp5_clip";
    level.weaponclipmodels[5] = "weapon_g3_clip";
    maps\createart\hunted_art::main();
    maps\hunted_fx::main();
    maps\_load::main();
    maps\_drone_ai::init();
    maps\_stinger::init();
    maps\hunted_anim::main();
    maps\hunted_lighting::main();
    maps\hunted_aud::main();
    maps\hunted_windmill::main();
    level.player setthreatbiasgroup( "player" );
    setignoremegroup( "allies", "oblivious" );
    setignoremegroup( "axis", "oblivious" );
    setignoremegroup( "player", "oblivious" );
    setignoremegroup( "oblivious", "allies" );
    setignoremegroup( "oblivious", "axis" );
    setignoremegroup( "oblivious", "oblivious" );
    setignoremegroup( "heli_guy", "allies" );
    setthreatbias( "player", "heli_guy", 1000000 );
    level.ai_friendlyfireblockduration = getdvarfloat( "ai_friendlyFireBlockDuration" );
    level thread maps\hunted_amb::main();
    maps\_compass::setupminimap( "compass_map_hunted" );
    setup_setgoalvolume_trigger();
    setup_enemies();
    maps\hunted_lighting::setup_visionset_trigger();
    setup_heli_guy();
    setup_spot_target();
    setup_helicopter_delete_node();
    setup_tmp_detour_node();
    setup_gas_station();
    setup_basement_door();
    var_0 = getent( "farmer_front_door", "targetname" );
    var_0 thread front_door_linked_ent();
    level.player thread grenade_notifies();
    level thread dynamic_dog_threat();
    level.cos90 = cos( 90 );
    common_scripts\utility::array_thread( getentarray( "noprone", "targetname" ), ::noprone );
    level.animated_door_clip_brushes = [];
    common_scripts\utility::array_thread( getentarray( "doorpart", "targetname" ), ::doorpart );
    thread maps\_utility::ai_team_run_twitch_think( "allies", "aa_crash", undefined, "crash", undefined );
    maps\_utility::battlechatter_off( "allies" );
    maps\_utility::battlechatter_off( "axis" );
    common_scripts\utility::run_thread_on_targetname( "dead_body", ::spawn_dead_body );
    thread hunted_wibble_think();
}

player_sprint_check()
{
    level endon( "player_interruption" );

    if ( !isdefined( level.player.movespeedscale ) )
        level.player.movespeedscale = 1;

    var_0 = level.player.origin;
    var_1 = 0;

    for (;;)
    {
        wait 0.1;
        var_2 = level.player.origin;
        var_3 = int( 25 * level.player.movespeedscale );

        if ( int( distance2d( var_0, var_2 ) ) > var_3 )
            var_1++;
        else
            var_1 = 0;

        if ( var_1 > 5 )
            common_scripts\utility::flag_set( "player_sprint" );
        else
            common_scripts\utility::flag_clear( "player_sprint" );

        var_0 = var_2;
    }
}

setup_flags()
{
    common_scripts\utility::flag_init( "aa_flight" );
    common_scripts\utility::flag_init( "aa_crash" );
    common_scripts\utility::flag_init( "aa_dirt_path" );
    common_scripts\utility::flag_init( "aa_barn" );
    common_scripts\utility::flag_init( "aa_field" );
    common_scripts\utility::flag_init( "aa_basement" );
    common_scripts\utility::flag_init( "aa_farm" );
    common_scripts\utility::flag_init( "aa_creek" );
    common_scripts\utility::flag_init( "aa_second_field" );
    common_scripts\utility::flag_init( "aa_greenhouse" );
    common_scripts\utility::flag_init( "aa_stinger" );
    common_scripts\utility::flag_init( "aa_ac130" );
    common_scripts\utility::flag_init( "player_sprint" );
    common_scripts\utility::flag_init( "flight_missile_warning" );
    common_scripts\utility::flag_init( "blackhawk_hit" );
    common_scripts\utility::flag_init( "blackhawk_down" );
    common_scripts\utility::flag_init( "price_help" );
    common_scripts\utility::flag_init( "wakeup_start" );
    common_scripts\utility::flag_init( "wakeup_done" );
    common_scripts\utility::flag_init( "wounded_check" );
    common_scripts\utility::flag_init( "wounded_check_done" );
    common_scripts\utility::flag_init( "crash_dialogue_done" );
    maps\_utility::flag_trigger_init( "path_trigger", getent( "path_trigger", "targetname" ) );
    maps\_utility::flag_trigger_init( "truck_alert", getent( "truck_alert", "targetname" ) );
    common_scripts\utility::flag_init( "mark_at_goal" );
    common_scripts\utility::flag_init( "trucks_warning" );
    common_scripts\utility::flag_init( "tunnel_rush" );
    common_scripts\utility::flag_init( "spawn_tunnel_helicopter" );
    common_scripts\utility::flag_init( "helicopter_fly_over" );
    common_scripts\utility::flag_init( "price_in_tunnel" );
    common_scripts\utility::flag_init( "mark_in_tunnel" );
    common_scripts\utility::flag_init( "barn_truck_arrived" );
    maps\_utility::flag_trigger_init( "barn_moveup", getent( "tunnel_trigger", "script_noteworthy" ) );
    common_scripts\utility::flag_init( "barn_interrogation_start" );
    common_scripts\utility::flag_init( "barn_rear_open" );
    common_scripts\utility::flag_init( "barn_front_open" );
    common_scripts\utility::flag_init( "interrogation_done" );
    common_scripts\utility::flag_init( "start_scene" );
    common_scripts\utility::flag_init( "save_farmer" );
    common_scripts\utility::flag_init( "farmer_gone" );
    common_scripts\utility::flag_init( "field_open" );
    maps\_utility::flag_trigger_init( "field_cross", getent( "field_cross", "targetname" ) );
    maps\_utility::flag_trigger_init( "field_cover", getent( "field_cover", "targetname" ) );
    common_scripts\utility::flag_init( "field_spoted" );
    common_scripts\utility::flag_init( "field_moveon" );
    common_scripts\utility::flag_init( "field_truck" );
    common_scripts\utility::flag_init( "field_defend" );
    maps\_utility::flag_trigger_init( "field_basement", getent( "field_basement", "targetname" ) );
    common_scripts\utility::flag_init( "field_open_basement" );
    common_scripts\utility::flag_init( "hit_the_deck_music" );
    common_scripts\utility::flag_init( "basement_door_open" );
    common_scripts\utility::flag_init( "heli_field_stragler_attack" );
    common_scripts\utility::flag_init( "basement_open" );
    maps\_utility::flag_trigger_init( "basement_enter", getent( "basement_enter", "targetname" ) );
    maps\_utility::flag_trigger_init( "basement_light_1", getent( "basement_light_1", "targetname" ) );
    maps\_utility::flag_trigger_init( "basement_light_2", getent( "basement_light_2", "targetname" ) );
    maps\_utility::flag_trigger_init( "basement_light_3", getent( "basement_light_3", "targetname" ) );
    maps\_utility::flag_trigger_init( "basement_light_4", getent( "basement_light_4", "targetname" ) );
    maps\_utility::flag_trigger_init( "basement_light_5", getent( "basement_light_5", "targetname" ) );
    maps\_utility::flag_trigger_init( "basement_light_6", getent( "basement_light_6", "targetname" ) );
    maps\_utility::flag_trigger_init( "trim_field", getent( "trim_field", "targetname" ) );
    maps\_utility::flag_trigger_init( "basement_heli_takeoff", getent( "basement_heli_takeoff", "targetname" ) );
    maps\_utility::flag_trigger_init( "basement_flash", getent( "basement_flash", "targetname" ) );
    common_scripts\utility::flag_init( "squad_in_basement" );
    common_scripts\utility::flag_init( "basement_secure" );
    maps\_utility::flag_trigger_init( "farm_start", getent( "farm_start", "targetname" ) );
    maps\_utility::flag_trigger_init( "farm_alert", getent( "farm_alert", "targetname" ) );
    maps\_utility::flag_trigger_init( "farm_enemies_timer", getent( "farm_enemies_timer", "targetname" ) );
    common_scripts\utility::flag_init( "farm_clear" );
    maps\_utility::flag_trigger_init( "creek_helicopter", getent( "creek_helicopter", "targetname" ) );
    maps\_utility::flag_trigger_init( "creek_start", getent( "creek_start", "targetname" ) );
    maps\_utility::flag_trigger_init( "creek_bridge", getent( "creek_bridge", "targetname" ) );
    common_scripts\utility::flag_init( "creek_gate_open" );
    common_scripts\utility::flag_init( "creek_truck_on_bridge" );
    maps\_utility::flag_trigger_init( "road_start", getent( "road_start", "targetname" ) );
    common_scripts\utility::flag_init( "road_open_field" );
    maps\_utility::flag_trigger_init( "roadblock", getent( "roadblock", "targetname" ) );
    common_scripts\utility::flag_init( "roadblock_start" );
    common_scripts\utility::flag_init( "roadblock_done" );
    maps\_utility::flag_trigger_init( "road_field_search", getent( "road_field_search", "targetname" ) );
    common_scripts\utility::flag_init( "road_field_end" );
    maps\_utility::flag_trigger_init( "road_field_cleanup", getent( "road_field_cleanup", "targetname" ) );
    common_scripts\utility::flag_init( "road_field_clear_helicopter" );
    common_scripts\utility::flag_init( "road_field_clear" );
    common_scripts\utility::flag_init( "road_helicopter_cleared" );
    maps\_utility::flag_trigger_init( "greenhouse_area", getent( "greenhouse_area", "targetname" ) );
    common_scripts\utility::flag_init( "helicopter_down" );
    maps\_utility::flag_trigger_init( "greenhouse_rear_exit", getent( "greenhouse_rear_exit", "targetname" ), 1 );
    common_scripts\utility::flag_init( "greenhouse_done" );
    maps\_utility::flag_trigger_init( "greenhouse_heli_light_off", getent( "greenhouse_heli_light_off", "targetname" ), 1 );
    maps\_utility::flag_trigger_init( "gasstation_start", getent( "gasstation_start", "targetname" ) );
    maps\_utility::flag_trigger_init( "ac130_inplace", getent( "ac130_inplace", "targetname" ) );
    common_scripts\utility::flag_init( "ac130_barrage" );
    common_scripts\utility::flag_init( "go_dazed" );
    common_scripts\utility::flag_init( "ac130_barrage_over" );
    maps\_utility::flag_trigger_init( "ac130_defend_gasstation", getent( "ac130_gasstation_defend", "targetname" ) );
    maps\_utility::flag_trigger_init( "mission_end_trigger", getent( "mission_end_trigger", "targetname" ) );
    common_scripts\utility::flag_init( "helicopter_unloading" );
    common_scripts\utility::flag_init( "player_interruption" );
}

objective_lz()
{
    var_0 = common_scripts\utility::getstruct( "bridge_origin", "targetname" );
    objective_add( 1, "active", &"HUNTED_OBJ_EXTRACTION_POINT", var_0.origin );
    objective_current( 1 );
}

objective_stinger()
{
    if ( !common_scripts\utility::flag( "helicopter_down" ) )
    {
        var_0 = getent( "stinger_objective", "targetname" );
        objective_add( 2, "active", &"HUNTED_OBJ_DESTROY_HELICOPTER", var_0.origin );
        objective_indentlevel( 2, 1 );
        objective_current( 2 );
        common_scripts\utility::flag_wait( "helicopter_down" );
        wait 1;
        objective_state( 2, "done" );
    }
    else
    {
        objective_add( 2, "done", &"HUNTED_OBJ_DESTROY_HELICOPTER" );
        objective_indentlevel( 2, 1 );
    }

    objective_add( 3, "active", &"HUNTED_OBJ_FOLLOW_PRICE", level.price.origin );
    objective_indentlevel( 3, 1 );
    objective_current( 3 );
    level thread my_objective_onentity( 3, level.price );
    common_scripts\utility::flag_wait( "ac130_barrage_over" );
    level notify( "release_objective" );
    objective_state( 3, "done" );
    objective_current( 1 );
}

my_objective_onentity( var_0, var_1 )
{
    level endon( "release_objective" );
    objective_onentity( var_0, var_1 );

    for (;;)
        wait 0.05;
}

area_flight_init()
{
    thread hud_hide( 1 );
    common_scripts\utility::flag_set( "aa_flight" );
    level.player allowcrouch( 0 );
    level.player allowprone( 0 );
    level.player enableinvulnerability();
    var_0 = getent( "crash_mask", "targetname" );
    var_0.origin += ( -3000.0, 64.0, -436.0 );
    level.player disableweapons();
    level thread fligth_missile();
    flight_helicopter();
    level.player disableinvulnerability();
    common_scripts\utility::flag_clear( "aa_flight" );
    thread area_crash_init();
}

flight_dialogue( var_0 )
{
    var_0 waittillmatch( "animontagdone", "dialog" );
    var_0 playsound( "hunted_pri_whatthebloody" );
    common_scripts\utility::flag_set( "flight_missile_warning" );
    var_0 waittillmatch( "animontagdone", "dialog" );
    var_0 playsound( "hunted_pri_incomingmissile" );
    maps\_utility::play_sound_on_tag( "hunted_hp1_missileinbound", "tag_driver" );
    common_scripts\utility::flag_wait( "blackhawk_hit" );
    wait 1;
    maps\_utility::play_sound_on_tag( "hunted_hp1_maydaymayday", "tag_driver" );
}

bnb()
{
    wait 0.7;
    maps\_utility::play_sound_on_tag( "hunted_bnb_missilelock", "tag_driver" );
    maps\_utility::play_sound_on_tag( "hunted_bnb_warning", "tag_driver" );
    common_scripts\utility::flag_wait( "blackhawk_hit" );
    wait 5;
    maps\_utility::play_sound_on_tag( "hunted_bnb_altitude", "tag_driver" );
}

fligth_missile()
{
    var_0 = common_scripts\utility::getstruct( "missile_point", "script_noteworthy" );
    var_0 waittill( "trigger", var_1 );
    var_2 = getent( "missile_source", "targetname" );
    var_2 hide();
    var_2 setvehweapon( "hunted_crash_missile_hunted" );
    var_2 setturrettargetent( var_1 );
    wait 1.5;
    var_3 = getent( "dummy_target", "targetname" );
    level.blackhawk_down_missile = var_2 fireweapon( "tag_gun_r", var_3, ( 0.0, 0.0, 0.0 ) );
    level notify( "missile_fired" );

    while ( distance2d( level.blackhawk_down_missile.origin, var_3.origin ) > 350 && isdefined( level.blackhawk_down_missile ) )
        wait 0.05;

    var_2 delete();
    level.blackhawk_down_missile missile_settargetent( var_1, ( 80.0, 20.0, -200.0 ) );
    wait 2;
    level.blackhawk_down_missile playsound( "blackhawk_down_missile_inbound" );
    var_4 = distancesquared( level.blackhawk_down_missile.origin, var_1.origin );
    wait 0.05;

    while ( distancesquared( level.blackhawk_down_missile.origin, var_1.origin ) < var_4 )
    {
        var_4 = distancesquared( level.blackhawk_down_missile.origin, var_1.origin );
        wait 0.1;
    }

    soundscripts\_snd::snd_message( "aud_heli_slomo" );
    var_5 = level.blackhawk_down_missile.origin;
    level.blackhawk_down_missile delete();
    playfx( level._effect["missile_explosion"], var_5 );
    level thread common_scripts\utility::play_sound_in_space( "blackhawk_down_missile_impact", var_5 );
    common_scripts\utility::flag_set( "blackhawk_hit" );
}

kill_missile( var_0 )
{
    var_0 delete();
}

flight_crash()
{
    wait 6;
    thread bnb();
    self playsound( "alarm_missile_incoming" );
    common_scripts\utility::flag_wait( "blackhawk_hit" );
    thread flight_crash_rotate();
    var_0 = common_scripts\utility::getstruct( "crash_location", "targetname" );
    thread heli_path_speed( var_0 );
    self playsound( "h1_blackhawk_down_msl_swt" );
    self playsound( "h1_blackhawk_down_trbn_frnt" );
    self playsound( "blackhawk_helicopter_hit" );
    wait 0.5;
    self playsound( "blackhawk_helicopter_dying_loop" );
    wait 8.5;
    self playsound( "h1_blackhawk_down_crash" );
    soundscripts\_snd::snd_message( "aud_heli_crash_fade_out" );
    self notify( "stop_rotate" );
    wait 7;
    common_scripts\utility::flag_set( "blackhawk_down" );
    self delete();
}

flight_crash_rotate()
{
    self setturningability( 1 );
    self setyawspeed( 1200, 100 );
    self endon( "stop_rotate" );

    for (;;)
    {
        if ( getdvarint( "use_original_crash_view" ) == 1 )
        {
            earthquake( 0.4, 0.35, self.origin, 256 );
            level.player playrumbleonentity( "tank_rumble" );
        }

        self settargetyaw( self.angles[1] - 170 );
        wait 0.1;
    }
}

flight_helicopter()
{
    var_0 = maps\_vehicle::spawn_vehicle_from_targetname_and_drive( "crash_blackhawk" );
    var_1 = spawn( "script_model", var_0 gettagorigin( "body_animate_jnt" ) );
    var_1 setmodel( "vehicle_blackhawk_hero_interior" );
    var_1.angles = var_0.angles;
    var_1 linkto( var_0, "body_animate_jnt" );
    var_1.animname = "blackhawk";
    var_1 maps\_anim::setanimtree();
    var_1 thread maps\_anim::anim_loop_solo( var_1, "interiorwires" );
    var_0 setturningability( 0.2 );
    var_0 thread flight_crash();
    var_0 maps\_vehicle::godon();
    var_2 = undefined;

    for ( var_3 = 0; var_3 < var_0.riders.size; var_3++ )
    {
        if ( issubstr( var_0.riders[var_3].classname, "vip" ) )
        {
            var_0.riders[var_3].has_ir = undefined;
            continue;
        }

        if ( !issubstr( var_0.riders[var_3].classname, "price" ) )
        {
            var_0.riders[var_3].name = "Gaz";
            continue;
        }

        var_2 = var_0.riders[var_3];
    }

    var_0 thread flight_dialogue( var_2 );
    var_0 thread flight_helicopter_dlight();

    if ( getdvarint( "use_original_crash_view" ) == 1 )
    {
        var_0.tag_ent = var_0 fake_tag( "tag_origin", ( -10.0, 32.0, -132.0 ), ( 0.0, 140.0, 0.0 ) );
        level.player playerlinktodelta( var_0.tag_ent, "tag_origin", 0.5, 80, 80, 30, 20 );
        level.player setplayerangles( ( 0.0, 35.0, 0.0 ) );
        maps\_utility::enable_scuff_footsteps_sound( 0 );
        common_scripts\utility::flag_wait( "blackhawk_down" );
        level.player unlink();
        maps\_utility::enable_scuff_footsteps_sound( 1 );
    }
    else
    {
        var_4 = maps\_utility::spawn_anim_model( "player_flight_helicopter" );
        var_4 linkto( var_0, "tag_detach" );
        var_0 thread maps\_anim::anim_single_solo( var_4, "flight_crash_player", "tag_detach", var_0 );
        level.player playerlinktodelta( var_4, "tag_player", 0.75, 42, 60, 15, 20, 0 );
        thread h1_flightcrash_viewclamp_seq();
        maps\_utility::enable_scuff_footsteps_sound( 0 );
        common_scripts\utility::flag_wait( "blackhawk_down" );
        var_4 delete();
        maps\_utility::enable_scuff_footsteps_sound( 1 );
    }

    var_1 delete();
}

h1_flightcrash_viewclamp_seq()
{
    wait 6.0;
    level.player lerpviewangleclamp( 1.5, 0, 0, 35, 45, 15, 15 );
    common_scripts\utility::flag_wait( "blackhawk_hit" );
    wait 0.5;
    level.player lerpviewangleclamp( 1.0, 0, 0, 10, 65, 10, 10 );
}

flight_helicopter_dlight()
{
    self.dlight_ent1 = fake_tag( "tag_light_cargo01", ( 10.0, -25.0, -60.0 ), ( 0.0, 0.0, 0.0 ) );
    playfxontag( level._effect["heli_dlight_blue"], self.dlight_ent1, "tag_origin" );
    common_scripts\utility::flag_wait( "flight_missile_warning" );
    self.dlight_ent3 = fake_tag( "tag_light_cargo01", ( 0.0, 0.0, 0.0 ), ( 0.0, 0.0, 0.0 ) );
    playfxontag( level._effect["heli_dlight_red"], self.dlight_ent3, "tag_origin" );
}

fake_tag( var_0, var_1, var_2 )
{
    var_3 = spawn( "script_model", self.origin );
    var_3 setmodel( "tag_origin" );
    var_3 hide();
    var_3 linkto( self, var_0, var_1, var_2 );
    thread fake_tag_destroy( var_3 );
    return var_3;
}

tmp_point()
{
    var_0 = spawn( "script_model", self.origin );
    var_0 setmodel( "fx" );
    var_0 linkto( self );
    wait 2;
    var_0 delete();
}

fake_tag_destroy( var_0 )
{
    self waittill( "death" );
    var_0 delete();
}

#using_animtree("generic_human");

blackhawk_overrides()
{
    var_0 = vehicle_scripts\_blackhawk::setanims();
    var_0[2].idle = %bh_1_idle;
    var_0[3].idle = %hunted_bh2_crash;
    var_0[4].idle = %bh_4_idle;
    var_0[5].idle = %bh_5_idle;
    var_0[6].idle = %hunted_bh8_crash;
    var_0[7].idle = %hunted_bh6_crash;
    return var_0;
}

area_crash_init()
{
    soundscripts\_snd::snd_message( "aud_set_exterior_level_2" );
    common_scripts\utility::flag_set( "aa_crash" );
    setup_friendlies();
    common_scripts\utility::array_thread( level.squad, ::set_fixednode, 0 );
    level thread crash_player();
    level.price thread crash_price();
    level.steve thread crash_steve();
    level thread crash_wounded_dialogue();
    level thread music();

    if ( !getdvarint( "use_old_opening" ) == 1 )
        level.mark thread crash_mark();

    common_scripts\utility::flag_set( "price_help" );
    soundscripts\_snd::snd_message( "aud_heli_crash_fade_in" );
    common_scripts\utility::flag_wait( "wakeup_done" );
    hud_hide( 0 );
    common_scripts\utility::flag_wait( "wounded_check_done" );
    common_scripts\utility::flag_clear( "aa_crash" );
    level thread area_dirt_path_init();
}

crash_wounded_dialogue()
{
    common_scripts\utility::flag_wait( "wakeup_done" );

    if ( getdvarint( "use_old_opening" ) == 1 )
    {
        wait 1;
        level.price maps\_anim::anim_single_queue( level.price, "casualtyreport" );
        level.mark maps\_anim::anim_single_queue( level.mark, "bothpilotsdead" );
        level.price maps\_anim::anim_single_queue( level.price, "bugger" );
        wait 3;
        level.price maps\_anim::anim_single_queue( level.price, "extractionpoint" );
    }
    else
    {
        level.price waittillmatch( "single anim", "dialog" );
        wait 1.2;
        level.mark thread maps\_anim::anim_single_queue( level.mark, "bothpilotsdead" );
        level.price waittillmatch( "single anim", "dialog" );
        level.price waittillmatch( "single anim", "dialog" );
    }

    common_scripts\utility::flag_wait( "path_trigger" );
    maps\_utility::radio_dialogue( "hunted_price_ac130_inbound" );
    level.price maps\_anim::anim_single_queue( level.price, "hunted_pri_copy" );
    level.mark maps\_anim::anim_single_queue( level.mark, "hunted_uk2_ac130" );
    common_scripts\utility::flag_set( "crash_dialogue_done" );
}

crash_price()
{
    var_0 = getent( "start_animent", "targetname" );
    common_scripts\utility::flag_wait( "price_help" );
    self notify( "stop_going_to_node" );

    if ( getdvarint( "use_old_opening" ) == 1 )
        wait 7.5;

    thread fuel_explosion();
    var_0 maps\_anim::anim_reach_solo( self, "hunted_opening_price" );
    common_scripts\utility::flag_set( "wakeup_start" );
    var_0 maps\_anim::anim_single_solo( self, "hunted_opening_price" );

    if ( getdvarint( "use_old_opening" ) == 1 )
        maps\_utility::set_force_color( "c" );
}

fuel_explosion()
{
    self waittillmatch( "single anim", "fuel_ignition" );
    maps\hunted_fx::fuel_explosion();
}

crash_steve()
{
    maps\_utility::set_run_anim( "path_slow" );

    if ( getdvarint( "use_old_opening" ) == 1 )
        var_0 = getent( "wounded_animent", "targetname" );
    else
        var_0 = getent( "start_animent", "targetname" );

    var_1 = crash_setup_wounded( var_0 );
    common_scripts\utility::flag_wait( "wounded_check" );

    if ( getdvarint( "use_old_opening" ) == 1 )
    {
        wait 15.5;
        level notify( "mark_anim_reach_start" );
        self notify( "stop_going_to_node" );
        var_0 maps\_anim::anim_reach_solo( self, "hunted_dying" );
    }
    else
    {
        common_scripts\utility::flag_wait( "wakeup_start" );
        var_0 maps\_anim::anim_single_solo( level.steve, "hunted_opening_nikolai" );
        wait 7;
    }

    var_2 = spawn( "script_model", var_1.origin );
    var_2 setmodel( "h1_prop_dogtag" );
    var_2 maps\_utility::assign_animtree( "dogtags" );
    var_3[0] = level.steve;
    var_3[1] = var_1;
    var_3[2] = var_2;
    var_0 maps\_anim::anim_single( var_3, "hunted_dying" );
    common_scripts\utility::flag_set( "wounded_check_done" );
    var_0 thread maps\_anim::anim_loop_solo( var_1, "hunted_dying_endidle", undefined, "stop_idle" );
    common_scripts\utility::flag_wait( "tunnel_rush" );
    var_1 delete();
}

crash_mark()
{
    var_0 = getent( "start_animent", "targetname" );
    level waittill( "mark_anim_reach_start" );
    self notify( "stop_going_to_node" );
    var_0 maps\_anim::anim_reach_solo( self, "mark_hunted_dying" );
    var_0 maps\_anim::anim_single_solo( self, "mark_hunted_dying" );
}

crash_setup_wounded( var_0 )
{
    var_1 = getent( "dead_guy_spawner", "targetname" );
    var_2 = maps\_utility::dronespawn( var_1 );
    var_2.animname = "dead_guy";
    var_0 maps\_anim::anim_first_frame_solo( var_2, "hunted_dying" );

    if ( getdvarint( "use_old_opening" ) == 1 )
    {
        var_3 = getent( "crash_gun_new", "targetname" );
        var_3 delete();
    }
    else
    {
        var_2 maps\_utility::gun_remove();
        var_3 = getent( "crash_gun_old", "targetname" );
        var_3 delete();
    }

    return var_2;
}

crash_player()
{
    if ( getdvarint( "use_old_opening" ) == 1 )
    {
        level thread crash_wakeup_preh1();
        level.player allowcrouch( 1 );
        level.player allowprone( 1 );
    }
    else
        level thread crash_wakeup();

    level.player set_playerspeed( 130 );
    common_scripts\utility::flag_set( "wounded_check" );
    level.price common_scripts\utility::hide_friendname_until_flag_or_notify( "wakeup_done" );
    common_scripts\utility::flag_wait( "wakeup_done" );
    level.player enableweapons();
    setsaveddvar( "r_mbEnable", 0 );
}

crash_wakeup()
{
    level.player freezecontrols( 1 );
    level.player allowprone( 0 );
    level.player allowcrouch( 0 );
    var_0 = getent( "start_animent", "targetname" );
    setsaveddvar( "r_mbEnable", 2 );
    var_1 = maps\_utility::spawn_anim_model( "opening_player_model" );
    var_1.origin = var_0.origin;
    var_1.angles = var_0.angles;
    level.player playerlinktodelta( var_1, "tag_player", 1, 0, 0, 0, 0, 0 );
    var_0 thread maps\_anim::anim_first_frame_solo( var_1, "opening_player" );
    level thread crash_player_sound();
    common_scripts\utility::flag_wait( "wakeup_start" );

    if ( getdvarint( "use_old_opening" ) == 1 )
        var_0 maps\_anim::anim_single_solo( var_1, "opening_player" );
    else
    {
        var_0 thread maps\_anim::anim_single_solo( level.steve, "hunted_opening_nikolai" );
        var_0 maps\_anim::anim_single_solo( var_1, "opening_player" );
    }

    var_1 delete();
    level.player freezecontrols( 0 );
    level.player allowprone( 1 );
    level.player allowcrouch( 1 );
    common_scripts\utility::flag_set( "wakeup_done" );
}

#using_animtree("player");

crash_wakeup_preh1()
{
    var_0 = getent( "start_animent", "targetname" );
    var_1 = getstartorigin( var_0.origin, var_0.angles, %hunted_opening_player );
    var_2 = getstartangles( var_0.origin, var_0.angles, %hunted_opening_player );
    var_3 = playerview_spawn( var_1, var_2 );
    level.player setorigin( var_1 );
    level.player setplayerangles( var_2 );
    level.player playerlinktoabsolute( var_3, "tag_player" );
    var_3 setflaggedanimrestart( "viewanim", %hunted_opening_player_idle );
    level thread crash_player_sound();
    common_scripts\utility::flag_wait( "wakeup_start" );
    var_3 clearanim( %hunted_opening_player_idle, 0 );
    var_3 setflaggedanimrestart( "viewanim", %hunted_opening_player );
    var_3 animscripts\shared::donotetracks( "viewanim" );
    var_3 clearanim( %hunted_opening_player, 0 );
    level.player unlink();
    var_3 delete();
    common_scripts\utility::flag_set( "wakeup_done" );
}

playerview_spawn( var_0, var_1 )
{
    var_2 = spawn( "script_model", var_0 );
    var_2.angles = var_1;
    var_2 setmodel( "h2_gfl_m4_sopmod_ii_viewbody" );
    var_2 useanimtree( #animtree );
    var_2 hide();
    return var_2;
}

crash_player_sound()
{
    wait 3.5;
    level.player maps\_utility::play_sound_on_entity( "breathing_better" );
}

area_dirt_path_init()
{
    maps\_utility::autosave_by_name( "dirt_path" );

    if ( !common_scripts\utility::flag( "path_trigger" ) )
        maps\_utility::activate_trigger_with_targetname( "dirt_path_color_init" );

    common_scripts\utility::flag_set( "aa_dirt_path" );
    level thread objective_lz();
    level thread dirt_path_truck();
    level thread dirt_path_barn_truck();
    level thread dirt_path_helicopter();
    level thread dirt_path_allies();
    level thread dirt_path_player_speed();
    level thread dirt_path_player();
    level thread player_interruption();
    thread door_anim_first_frame_solo();
    common_scripts\utility::flag_wait( "price_in_tunnel" );
    common_scripts\utility::flag_wait( "mark_in_tunnel" );
    common_scripts\utility::flag_wait( "barn_moveup" );
    common_scripts\utility::flag_clear( "aa_dirt_path" );
    level thread area_barn_init();
}

dirt_path_allies()
{
    level.price thread dirt_path_price();
    level.steve thread dirt_path_steve();
    level.charlie thread dirt_path_charlie();
    level.mark thread dirt_path_mark();
}

dirt_path_player()
{
    common_scripts\utility::flag_wait( "tunnel_rush" );
    wait 1;
    level.player set_playerspeed( 190, 2 );
}

dirt_path_price_dialogue()
{
    common_scripts\utility::flag_wait( "crash_dialogue_done" );
    wait 2;

    if ( !common_scripts\utility::flag( "truck_alert" ) )
        level.price maps\_anim::anim_single_queue( level.price, "lowprofile" );
}

dirt_path_price()
{
    thread dirt_path_price_dialogue();
    self notify( "stop_going_to_node" );
    maps\_utility::set_force_color( "c" );
    common_scripts\utility::flag_wait( "truck_alert" );
    var_0 = getent( "truck_warning_animent", "targetname" );
    var_0 maps\_anim::anim_reach_solo( self, "hunted_wave_chat" );
    common_scripts\utility::flag_set( "trucks_warning" );
    var_0 maps\_anim::anim_single_solo( self, "hunted_wave_chat" );
    thread maps\_anim::anim_single_queue( self, "hunted_wave_chat_snd" );
    self.disablearrivals = 0;
    var_0 = getent( "tunnel_animent", "targetname" );
    var_0 maps\_anim::anim_reach_solo( self, "hunted_tunnel_guy2_runin" );
    var_0 maps\_anim::anim_single_solo( self, "hunted_tunnel_guy2_runin" );
    var_0 thread maps\_anim::anim_loop_solo( self, "hunted_tunnel_guy2_idle", undefined, "price_stop_idle" );
    wait 3;
    common_scripts\utility::flag_wait( "helicopter_fly_over" );
    common_scripts\utility::flag_set( "price_in_tunnel" );
    getent( "tunnel_trigger", "script_noteworthy" ) thread trigger_timeout( 8 );
    common_scripts\utility::flag_wait_either( "barn_moveup", "player_interruption" );
    common_scripts\utility::flag_set( "barn_moveup" );
    var_0 notify( "price_stop_idle" );

    if ( common_scripts\utility::flag( "player_interruption" ) )
        var_0 maps\_anim::anim_single_solo( self, "hunted_tunnel_guy2_runout_interrupt" );
    else
        var_0 maps\_anim::anim_single_solo( self, "hunted_tunnel_guy2_runout" );
}

dirt_path_charlie()
{
    var_0 = getent( "truck_warning_animent", "targetname" );
    var_0 maps\_anim::anim_reach_and_idle_solo( self, "hunted_wave_chat", "hunted_spotter_idle", "charlie_stop_idle" );
    common_scripts\utility::flag_wait( "trucks_warning" );
    level thread maps\_utility::flag_set_delayed( "tunnel_rush", 3 );
    var_0 notify( "charlie_stop_idle" );
    thread maps\_anim::anim_single_queue( self, "hunted_wave_chat_snd" );
    var_0 maps\_anim::anim_single_solo( self, "hunted_wave_chat" );
    var_1 = getnode( "charlie_tunnel", "targetname" );
    self setgoalnode( var_1 );
    self.goalradius = 0;
    self waittill( "goal" );
    maps\_utility::clear_run_anim();
}

dirt_path_mark()
{
    self notify( "stop_going_to_node" );
    maps\_utility::set_force_color( "g" );
    common_scripts\utility::flag_wait( "tunnel_rush" );
    self pushplayer( 1 );
    var_0 = getent( "tunnel_animent", "targetname" );
    var_0 maps\_anim::anim_reach_solo( self, "hunted_tunnel_guy1_runin" );
    var_0 maps\_anim::anim_single_solo( self, "hunted_tunnel_guy1_runin" );

    if ( !common_scripts\utility::flag( "helicopter_fly_over" ) )
    {
        var_0 thread maps\_anim::anim_loop_solo( self, "hunted_tunnel_guy1_idle", undefined, "mark_stop_idle" );
        common_scripts\utility::flag_wait( "helicopter_fly_over" );
        var_0 notify( "mark_stop_idle" );
        var_0 maps\_anim::anim_single_solo( self, "hunted_tunnel_guy1_lookup" );
    }

    var_0 thread maps\_anim::anim_loop_solo( self, "hunted_tunnel_guy1_idle", undefined, "mark_stop_idle" );
    common_scripts\utility::flag_set( "mark_in_tunnel" );
    common_scripts\utility::flag_wait( "barn_moveup" );
    wait 2;
    var_0 notify( "mark_stop_idle" );
    var_0 maps\_anim::anim_single_solo( self, "hunted_tunnel_guy1_runout" );
    self pushplayer( 0 );
}

dirt_path_mark_path_end()
{
    self endon( "stop_path" );
    self waittill( "path_end_reached" );
    common_scripts\utility::flag_set( "mark_at_goal" );
}

dirt_path_steve()
{
    self notify( "stop_going_to_node" );
    maps\_utility::set_force_color( "g" );
    maps\_utility::clear_run_anim();
    common_scripts\utility::flag_wait( "trucks_warning" );
    self.disablearrivals = 0;
    var_0 = getnode( "steve_tunnel", "targetname" );
    self setgoalnode( var_0 );
    self.goalradius = 0;
    self pushplayer( 0 );
}

dirt_path_helicopter()
{
    common_scripts\utility::flag_wait( "spawn_tunnel_helicopter" );
    var_0 = maps\_vehicle::spawn_vehicle_from_targetname( "tunnel_heli" );
    var_0 sethoverparams( 128, 10, 3 );
    var_0 thread heli_path_speed();
    var_0 common_scripts\utility::waittill_either( "near_goal", "goal" );
    wait 0.05;
    var_1 = level.move_time;
    var_2 = common_scripts\utility::getstruct( "fly_over_point", "script_noteworthy" );
    var_3 = distance( var_0.origin, var_2.origin );
    var_4 = var_3 / var_1 / 17.6;
    var_0 vehicle_setspeed( var_4, var_4 );
    var_0 helicopter_searchlight_on();
    var_2 waittill( "trigger" );
    common_scripts\utility::flag_set( "helicopter_fly_over" );
    var_0 thread dirt_path_helicopter_react();
    var_5 = getent( "heli_away", "targetname" );
    var_5 waittill( "trigger" );
    var_0 notify( "heli_away" );
}

dirt_path_helicopter_react()
{
    level endon( "barn_rear_open" );
    thread impact_trigger_attach();
    common_scripts\utility::waittill_either( "impact", "heli_away" );
    var_0 = common_scripts\utility::getstruct( "heli_away_path", "targetname" );
    thread heli_path_speed( var_0 );
    self notify( "spot_target_path" );
    helicopter_setturrettargetent( self.spotlight_default_target );
}

impact_trigger_attach()
{
    var_0 = getent( "heli_damage_trigger", "targetname" );

    if ( isdefined( var_0.inuse ) )
        var_0 unlink();
    else
        var_0 enablelinkto();

    var_0.inuse = 1;
    var_0 linkto( self, "tag_origin", ( 0.0, 0.0, 0.0 ), ( 0.0, 0.0, 0.0 ) );
    var_0 thread notify_impact( self );
}

notify_impact( var_0 )
{
    var_0 endon( "death" );

    for (;;)
    {
        self waittill( "damage" );
        var_0 notify( "impact" );
    }
}

dirt_path_player_speed()
{
    var_0 = getent( "calc_speed_trigger", "script_noteworthy" );
    var_1 = getent( "helicopter_trigger", "script_noteworthy" );
    var_0 waittill( "trigger" );
    var_2 = gettime();
    var_1 waittill( "trigger" );
    var_3 = gettime();
    var_4 = ( var_3 - var_2 ) / 1000;

    if ( var_4 > 0.75 )
        var_4 = 0.75;

    var_4 = 1 + var_4 * 4;
    level.move_time = var_4;
    common_scripts\utility::flag_wait( "tunnel_rush" );
    common_scripts\utility::flag_set( "spawn_tunnel_helicopter" );
}

dirt_path_truck()
{
    common_scripts\utility::flag_wait( "trucks_warning" );
    var_0 = maps\_vehicle::spawn_vehicle_from_targetname( "path_truck" );
    thread maps\_vehicle::gopath( var_0 );
    var_0 turn_headlights_on();
    var_0 maps\_vehicle::godon();
}

player_interruption()
{
    common_scripts\utility::flag_wait( "tunnel_rush" );
    wait 3;
    level thread set_flag_on_player_action( "player_interruption", 0, 1, 1 );
}

dirt_path_barn_truck()
{
    common_scripts\utility::flag_wait( "trucks_warning" );
    wait 2;
    var_0 = maps\_vehicle::spawn_vehicle_from_targetname( "barn_truck" );
    var_0 maps\_vehicle::godon();
    wait 0.1;
    var_1 = var_0.riders;

    for ( var_2 = 0; var_2 < var_1.size; var_2++ )
    {
        var_1[var_2] thread maps\_utility::magic_bullet_shield();
        var_1[var_2] setthreatbiasgroup( "oblivious" );
    }

    thread maps\_vehicle::gopath( var_0 );
    var_0 turn_headlights_on( 1 );
    var_0 thread barn_truck_add_dynamic_light();
    var_0 thread barn_russian_joke( var_1 );
    var_0 waittill( "reached_end_node" );
    var_0 thread h1_first_frame_anim_guys_on_unload();
    wait 1;
    common_scripts\utility::flag_set( "barn_truck_arrived" );
    common_scripts\utility::array_thread( var_1, maps\_utility::stop_magic_bullet_shield );
    var_0 connectpaths();

    if ( !common_scripts\utility::flag( "player_interruption" ) )
    {
        maps\_utility::activate_trigger_with_targetname( "barn_truck_color_init" );
        common_scripts\utility::flag_wait_any( "interrogation_done", "player_interruption" );
    }

    var_0 dirt_path_disable_truck();

    if ( isdefined( level.barn_truck_dummy ) )
        level.barn_truck_dummy setanim( level.bm21_custom["explosion"] );
}

get_interrogation_badguys()
{
    var_0 = getaiarray( "axis" );
    var_1 = undefined;
    var_2 = undefined;
    var_3 = undefined;

    for ( var_4 = 0; var_4 < var_0.size; var_4++ )
    {
        if ( isdefined( var_0[var_4].script_noteworthy ) && var_0[var_4].script_noteworthy == "leader" )
            var_1 = var_0[var_4];

        if ( isdefined( var_0[var_4].script_noteworthy ) && var_0[var_4].script_noteworthy == "thug" )
            var_2 = var_0[var_4];

        if ( isdefined( var_0[var_4].script_noteworthy ) && var_0[var_4].script_noteworthy == "thug2" )
            var_3 = var_0[var_4];
    }

    var_1.animname = "leader";
    var_2.animname = "thug";
    var_3.animname = "thug2";
    var_5 = [];
    var_5[0] = var_1;
    var_5[1] = var_2;
    var_5[2] = var_3;
    return var_5;
}

h1_first_frame_anim_guys_on_unload()
{
    maps\_utility::ent_flag_wait( "unloaded" );

    if ( !common_scripts\utility::flag( "player_interruption" ) )
    {
        var_0 = get_interrogation_badguys();
        var_1 = getent( "barnfarm_animent", "targetname" );
        var_1 maps\_anim::anim_first_frame( var_0, "hunted_farmsequence" );
        level endon( "interrogation_done" );
        common_scripts\utility::flag_wait( "player_interruption" );

        foreach ( var_3 in var_0 )
            var_3 notify( "stop_first_frame" );
    }
}

barn_russian_joke( var_0 )
{
    var_0[0] endon( "death" );
    var_0[1] endon( "death" );
    level endon( "player_interruption" );
    common_scripts\utility::flag_wait( "barn_truck_arrived" );
    maps\_anim::anim_generic( var_0[0], "hunted_ru1_isadump" );
    thread maps\_anim::anim_generic( var_0[0], "laugh1" );
    maps\_anim::anim_generic( var_0[1], "laugh2" );
}

dirt_path_disable_truck()
{
    self endon( "death" );
    wait 2;
    maps\_vehicle_code::lights_off( "headlights" );
    self vehicle_turnengineoff();
    maps\_vehicle::godoff();
    self.script_bulletshield = 0;
    wait 0.5;
    level.barn_truck_dummy = maps\_vehicle::vehicle_to_dummy();

    for (;;)
    {
        playfx( level._effect["truck_smoke"], self gettagorigin( "tag_engine_left" ) );
        wait 0.5;
    }
}

barn_truck_add_dynamic_light()
{
    var_0 = getent( "tunnel_trigger", "script_noteworthy" );
    var_0 waittill( "trigger" );
    var_1 = getent( "tunnel_animent", "targetname" );
    var_2 = distancesquared( level.player.origin, var_1.origin );
    var_3 = 1;
    var_4 = 0;

    for (;;)
    {
        if ( level.player istouching( var_0 ) )
        {
            var_3 = 1;
            waitframe();
            continue;
        }

        if ( var_3 )
        {
            var_4 = distancesquared( level.player.origin, var_1.origin );
            var_3 = 0;
        }

        if ( var_4 > var_2 )
            break;
        else
            waitframe();
    }

    var_0 common_scripts\utility::trigger_off();

    if ( common_scripts\utility::flag( "interrogation_done" ) || common_scripts\utility::flag( "player_interruption" ) )
        return;

    maps\_vehicle::build_light( self.classname, "headlight_truck_left3", "tag_headlight_left", "vfx/lights/hunted/hunted_headlight_spotlight_alone", "headlights" );
    maps\_vehicle::build_light( self.classname, "headlight_truck_right3", "tag_headlight_right", "vfx/lights/hunted/hunted_headlight_spotlight_alone", "headlights" );
    turn_headlights_on( 1 );
}

area_barn_init()
{
    if ( !common_scripts\utility::flag( "player_interruption" ) )
    {
        maps\_utility::autosave_by_name( "barn" );
        level thread set_flag_on_player_action( "player_interruption", 1, 1, 1 );
        level thread glass_shatter_wait();
    }

    common_scripts\utility::flag_set( "aa_barn" );
    level thread barn_early_interruption();
    level thread barn_interrogation_wait();
    level.price thread barn_price_moveup();
    level.mark thread barn_mark_moveup();
    level.steve maps\_utility::set_force_color( "r" );
    level.charlie maps\_utility::set_force_color( "r" );
    common_scripts\utility::flag_wait( "barn_front_open" );
    maps\_utility::waittill_aigroupcleared( "barn_enemies" );
    level.mark maps\_utility::disable_ai_color();
    level.price maps\_utility::disable_ai_color();
    level.steve maps\_utility::disable_ai_color();
    level.charlie maps\_utility::disable_ai_color();
    level.price set_goalnode( getnode( "price_barn_exterior", "targetname" ) );
    level.mark set_goalnode( getnode( "mark_barn_exterior2", "targetname" ) );
    level.steve set_goalnode( getnode( "steve_barn_exterior", "targetname" ) );
    level.charlie set_goalnode( getnode( "charlie_barn_exterior", "targetname" ) );
    level.mark waittill( "goal" );
    common_scripts\utility::flag_clear( "aa_barn" );
    level thread area_field_init();
}

glass_shatter_wait()
{
    level endon( "kill_action_flag" );
    level endon( "player_interruption" );
    level waittill( "glass_shatter" );
    common_scripts\utility::flag_set( "player_interruption" );
}

barn_interrogation_wait()
{
    level endon( "player_interruption" );
    common_scripts\utility::flag_wait( "barn_interrogation_start" );
    level notify( "stop_barn_early_interruption" );
    level thread barn_interrogation();
}

barn_interrogation()
{
    var_0 = getent( "barnfarm_animent", "targetname" );
    var_1 = scripted_spawn( "farmer", "targetname", 1 );
    var_1.health = 1000000;
    var_1.a.disablepain = 1;
    var_1 maps\_utility::set_battlechatter( 0 );
    var_1 maps\_utility::setflashbangimmunity( 1 );
    var_1.grenadeawareness = 0;
    var_1.animname = "farmer";
    var_1 maps\_utility::set_run_anim( "walk" );
    var_1 setthreatbiasgroup( "oblivious" );
    var_1.name = "";
    level.farmer = var_1;
    var_1 maps\_utility::gun_remove();
    var_2 = get_interrogation_badguys();
    var_3 = var_2[0];
    var_2 = common_scripts\utility::array_add( var_2, var_1 );
    setsaveddvar( "ai_friendlyFireBlockDuration", 0 );
    level thread barn_interrogation_interruption( var_3 );
    common_scripts\utility::array_thread( var_2, ::barn_abort_actors );
    maps\_utility::autosave_by_name( "interrogation" );
    var_3 thread farmer_death_fx( var_1 );
    var_1 thread barn_farmer( var_0 );
    barn_interrogation_anim( var_0, var_2, var_1 );
    maps\_utility::activate_trigger_with_targetname( "barn_ambush_color_init" );
    setthreatbiasgroup_on_array( "axis", maps\_utility::get_ai_group_ai( "barn_enemies" ) );

    if ( isalive( var_1 ) && common_scripts\utility::flag( "player_interruption" ) )
    {
        var_1 stopanimscripted();
        var_1 stopsounds();
        var_1 barn_interrogation_farmer_anim_reaction();

        if ( isalive( var_1 ) )
        {
            var_1 set_goalnode( getnode( "hide", "targetname" ) );
            var_1 thread delete_on_goal();
        }
    }

    if ( isalive( var_3 ) && !common_scripts\utility::flag( "player_interruption" ) )
        var_3 setthreatbiasgroup( "axis" );

    var_3 common_scripts\utility::waittill_notify_or_timeout( "damage", 1.5 );
    common_scripts\utility::flag_set( "player_interruption" );
    wait 1;
    common_scripts\utility::flag_set( "interrogation_done" );
    setsaveddvar( "ai_friendlyFireBlockDuration", level.ai_friendlyfireblockduration );
}

barn_interrogation_farmer_anim_reaction()
{
    if ( getdvarint( "use_old_interrogation" ) )
        return;

    self endon( "death" );
    var_0 = getmovedelta( level.scr_anim["farmer"]["farmer_surprised"], 0, 1 );
    var_1 = self localtoworldcoords( var_0 );
    var_2 = undefined;
    var_3 = undefined;

    if ( isdefined( var_1 ) )
    {
        var_2 = self aiphysicstrace( self.origin + ( 0.0, 0.0, 10.0 ), self.origin - ( 0.0, 0.0, 10.0 ), 0, 0, 1, 1, 0, 1, 2 );
        var_3 = self aiphysicstrace( var_1 + ( 0.0, 0.0, 10.0 ), var_1 - ( 0.0, 0.0, 10.0 ), 0, 0, 1, 1, 0, 1, 2 );
    }

    if ( !isdefined( var_2 ) || !isdefined( var_3 ) || var_2["fraction"] == 1 && var_3["fraction"] == 1 )
    {
        var_4 = common_scripts\utility::spawn_tag_origin();
        var_4 maps\_anim::anim_single_solo( self, "farmer_surprised" );
    }

    maps\_utility::set_run_anim( "runaway" );
}

farmer_death_fx( var_0 )
{
    if ( getdvarint( "use_old_noblood" ) == 1 )
        return;

    level endon( "player_interruption" );
    self waittillmatch( "single anim", "fire" );
    var_1 = var_0 gettagorigin( "tag_eye" );
    var_2 = var_0 gettagangles( "tag_eye" );
    var_2 = invertangles( var_2 );
    var_3 = anglestoforward( var_2 );
    var_1 += var_3 * 9;
    var_1 -= ( -5.0, 0.0, 0.0 );
    playfx( level._effect["head_fatal"], var_1, anglestoforward( var_2 ), anglestoup( var_2 ) );
}

barn_price_dialogue()
{
    level endon( "player_interruption" );

    if ( getdvarint( "use_old_interrogation" ) == 1 )
    {
        wait 13;
        common_scripts\utility::flag_set( "save_farmer" );
        wait 2;
        level.price thread maps\_anim::anim_single_queue( level.price, "killoldman" );
    }
    else
    {
        wait 16.15;
        common_scripts\utility::flag_set( "save_farmer" );
        wait 2;
        level.price thread maps\_anim::anim_single_queue( level.price, "killoldman" );
    }
}

barn_interrogation_interruption( var_0 )
{
    level endon( "interrogation_done" );
    level endon( "kill_action_flag" );
    common_scripts\utility::flag_wait( "player_interruption" );
    level notify( "interrogation_interrupted" );

    if ( !isalive( var_0 ) )
        return;

    var_1 = var_0 animscripts\utility::getpreferredweapon();

    if ( var_1 != var_0.weapon )
    {
        var_0 animscripts\shared::placeweaponon( var_0.weapon, "none" );
        var_0.weapon = var_1;
        var_0.bulletsinclip = weaponclipsize( var_0.weapon );
    }

    var_0 animscripts\shared::placeweaponon( var_0.weapon, "right" );
}

front_door_linked_ent()
{
    var_0 = getentarray( "doorknob", "targetname" );

    foreach ( var_2 in var_0 )
        var_2 linkto( self );
}

barn_interrogation_anim( var_0, var_1, var_2 )
{
    level endon( "interrogation_interrupted" );
    var_3 = getent( "farmer_front_door", "targetname" );
    var_3 thread barn_interrogation_anim_door();
    var_0 maps\_anim::anim_reach_solo( var_2, "hunted_farmsequence" );
    common_scripts\utility::flag_set( "start_scene" );
    level.price thread barn_price_dialogue();
    var_0 thread maps\_anim::anim_single( var_1, "hunted_farmsequence" );
    var_1[0] waittillmatch( "single anim", "fire" );
    var_2.deadfarmer = 1;
    level notify( "kill_farmer_thread" );
    thread common_scripts\utility::play_sound_in_space( "hunted_famer_shot", var_1[0].origin );
}

barn_interrogation_anim_door()
{
    if ( getdvarint( "use_old_interrogation" ) )
        self rotateyaw( 95, 0.7, 0.5, 0.2 );
    else
    {
        common_scripts\utility::flag_wait( "start_scene" );
        wait 0.25;
        self rotateyaw( 95, 1.5, 0.7, 0.5 );
    }

    self connectpaths();
}

barn_abort_actors()
{
    level endon( "interrogation_done" );
    self.flashbangstopsscriptedanim = 1;
    var_0 = wait_for_player_interruption_or_damage();

    if ( isdefined( self ) && !isdefined( self.deadfarmer ) && level.farmer != self )
    {
        self stopanimscripted();
        self notify( "single anim", "end" );
        self stopsounds();
    }

    if ( isdefined( var_0 ) && var_0 > self.health )
    {
        self.allowdeath = 1;
        self kill();
    }
}

wait_for_player_interruption_or_damage()
{
    level endon( "player_interruption" );
    self waittill( "damage", var_0 );
    return var_0;
}

barn_farmer( var_0 )
{
    level endon( "interrupt_farmer" );
    self endon( "death" );
    thread barn_farmer_interrupt();
    maps\_utility::set_ignoresuppression( 1 );
    self waittillmatch( "single anim", "end" );
    var_0 thread maps\_anim::anim_loop_solo( self, "farmer_deathpose" );
    self.a.nodeath = 1;
    self.allowdeath = 1;
    wait 0.1;
    maps\_utility::die();
}

barn_farmer_interrupt()
{
    level endon( "kill_farmer_thread" );
    common_scripts\utility::flag_wait( "player_interruption" );
    level notify( "interrupt_farmer" );
}

barn_early_interruption()
{
    level endon( "stop_barn_early_interruption" );
    common_scripts\utility::flag_wait( "player_interruption" );
    setthreatbiasgroup_on_array( "axis", maps\_utility::get_ai_group_ai( "barn_enemies" ) );
    level.price notify( "end_wait" );

    if ( common_scripts\utility::flag( "barn_interrogation_start" ) )
        return;

    wait 0.5;
    common_scripts\utility::array_thread( level.squad, maps\_utility::set_force_color, "y" );
    maps\_utility::activate_trigger_with_targetname( "barn_early_interruption" );

    while ( maps\_utility::get_ai_group_count( "barn_enemies" ) > 2 )
        wait 0.05;

    level.mark maps\_utility::disable_ai_color();
    level.price maps\_utility::disable_ai_color();
    level.steve maps\_utility::set_force_color( "r" );
    level.charlie maps\_utility::set_force_color( "r" );

    if ( !common_scripts\utility::flag( "barn_interrogation_start" ) )
        level.price thread barn_early_interruption_price();
}

barn_early_interruption_price()
{
    barn_price_move_to_door();
    barn_price_open_door();
    price_enter_barn();
}

barn_price_moveup()
{
    barn_price_move_to_door();

    if ( common_scripts\utility::flag( "player_interruption" ) )
        return;

    barn_price_wait_at_door();
    maps\_utility::set_ignoresuppression( 1 );
    var_0 = getent( "barn_rear_trigger", "script_noteworthy" );
    var_0 waittill( "trigger" );
    common_scripts\utility::flag_wait( "barn_truck_arrived" );

    if ( common_scripts\utility::flag( "player_interruption" ) )
        return;

    common_scripts\utility::flag_set( "barn_interrogation_start" );
    barn_price_open_door();
    price_enter_barn();
}

price_enter_barn()
{
    maps\_utility::enable_cqbwalk();
    make_ai_move();
    set_goalnode( getnode( "price_barn_interior", "targetname" ) );
    self waittill( "goal" );
    make_ai_normal();
    maps\_utility::disable_cqbwalk();
}

barn_price_move_to_door()
{
    var_0 = getnode( "price_barn_rear", "targetname" );
    self pushplayer( 1 );
    var_0 maps\_anim::anim_reach_and_approach_node_solo( self, "hunted_open_barndoor_stop" );
    self pushplayer( 0 );
}

barn_price_wait_at_door()
{
    var_0 = getnode( "price_barn_rear", "targetname" );
    var_0 maps\_anim::anim_single_solo( self, "hunted_open_barndoor_stop" );
    thread barn_price_wait_at_door_idle();
}

barn_price_wait_at_door_idle()
{
    var_0 = getnode( "price_barn_rear", "targetname" );
    var_0 thread maps\_anim::anim_loop_solo( self, "hunted_open_barndoor_idle", undefined, "stop_idle" );
    self waittill( "end_wait" );
    var_0 notify( "stop_idle" );
}

barn_price_open_door()
{
    self notify( "end_wait" );
    var_0 = getnode( "price_barn_rear", "targetname" );

    if ( !common_scripts\utility::flag( "player_interruption" ) )
        var_1 = "hunted_open_barndoor";
    else
        var_1 = "hunted_open_barndoor_nodialogue";

    var_2 = getanimlength( level.scr_anim["price"][var_1] );
    var_0 thread maps\_anim::anim_single_solo( self, var_1 );
    var_3 = getent( "barn_rear_door", "targetname" );

    if ( getdvarint( "use_old_door_openings" ) == 1 )
        var_3 maps\_utility::hunted_style_door_open( "door_wood_slow_creaky_open" );
    else
    {
        var_3 thread h1_play_door_sound( 0, "door_wood_slow_creaky_open" );
        var_0 thread maps\_anim::anim_single_solo( var_3, "open" );
        wait(var_2 - 0.5);
        var_3 h1_connectanimateddoorpaths();
    }

    common_scripts\utility::flag_set( "barn_rear_open" );
    level thread barn_close_rear_door( var_3, var_3.old_angles );
}

h1_play_door_sound( var_0, var_1 )
{
    if ( isdefined( var_0 ) )
        wait(var_0);

    if ( isdefined( var_1 ) )
        self playsound( var_1 );
    else
        self playsound( "door_wood_slow_open" );
}

barn_close_rear_door( var_0, var_1 )
{
    common_scripts\utility::flag_wait( "field_cross" );
    var_0 rotateto( var_1, 1 );
}

barn_mark_moveup()
{
    var_0 = getnode( "mark_barn_rear", "targetname" );
    level.mark set_goalnode( var_0 );
    common_scripts\utility::flag_wait( "barn_rear_open" );
    var_0 = getnode( "mark_barn_interior", "targetname" );
    set_goalnode( var_0 );

    if ( !common_scripts\utility::flag( "player_interruption" ) )
        common_scripts\utility::flag_wait( "interrogation_done" );

    level.mark barn_front_door();
    level.mark set_goalnode( getnode( "mark_barn_exterior", "targetname" ) );
    common_scripts\utility::flag_set( "barn_front_open" );
    level.price maps\_utility::set_ignoresuppression( 0 );
}

barn_front_door()
{
    make_ai_move();
    maps\_utility::enable_cqbwalk();
    var_0 = getentarray( "barn_main_door", "targetname" );
    var_1 = getentarray( "barn_main_door_model", "targetname" );

    for ( var_2 = 0; var_2 < var_1.size; var_2++ )
    {
        for ( var_3 = 0; var_3 < var_0.size; var_3++ )
        {
            if ( var_1[var_2].script_noteworthy == var_0[var_3].script_noteworthy )
                var_1[var_2] linkto( var_0[var_3] );
        }
    }

    var_4 = getent( "front_door_animent", "targetname" );
    var_4 maps\_anim::anim_reach_solo( self, "door_kick_in" );
    var_4 thread maps\_anim::anim_single_solo( self, "door_kick_in" );
    self waittillmatch( "single anim", "kick" );
    var_0[0] playsound( "door_wood_double_kick" );

    for ( var_2 = 0; var_2 < var_0.size; var_2++ )
    {
        var_0[var_2] connectpaths();

        if ( var_0[var_2].script_noteworthy == "right" )
        {
            var_0[var_2] rotateto( var_0[var_2].angles + ( 0.0, -160.0, 0.0 ), 0.6, 0, 0.1 );
            continue;
        }

        var_0[var_2] rotateto( var_0[var_2].angles + ( 0.0, 175.0, 0.0 ), 0.75, 0, 0.1 );
    }

    make_ai_normal();
    maps\_utility::disable_cqbwalk();
}

area_field_init()
{
    maps\_utility::autosave_by_name( "field" );
    maps\_utility::arcademode_checkpoint( 6, 1 );
    common_scripts\utility::flag_set( "aa_field" );
    soundscripts\_snd::snd_message( "aud_set_exterior_level_1" );
    var_0 = level.vehicle_aianims["script_vehicle_bm21_mobile_cover"][0].vehicle_getoutanim_clear;
    var_1 = level.vehicle_aianims["script_vehicle_bm21_mobile_cover"][1].vehicle_getoutanim_clear;
    level.vehicle_aianims["script_vehicle_bm21_mobile_cover"][0].vehicle_getoutanim_clear = 0;
    level.vehicle_aianims["script_vehicle_bm21_mobile_cover"][1].vehicle_getoutanim_clear = 0;
    wait 2;
    level thread field_dialgue();
    thread field_open();
    level thread set_playerspeed( 150, 3 );
    level.field_fence_origin = getent( "field_clip", "targetname" ).origin;
    var_2 = common_scripts\utility::array_sort_by_handler( level.squad, ::field_sort_squad );
    level.field_fence_origin = undefined;

    for ( var_3 = 0; var_3 < level.squad.size; var_3++ )
        var_2[var_3] thread field_allies( var_3 * 0.75 );

    level thread field_helicopter();
    level thread field_truck();
    level thread field_basement();
    common_scripts\utility::flag_wait( "field_moveon" );
    maps\_utility::activate_trigger_with_targetname( "field_defend_color_init" );
    level thread set_playerspeed( 190, 3 );
    common_scripts\utility::flag_wait_or_timeout( "field_basement", 7 );
    maps\_utility::autosave_by_name( "field_basement" );
    common_scripts\utility::flag_wait( "basement_open" );
    level.vehicle_aianims["script_vehicle_bm21_mobile_cover"][0].vehicle_getoutanim_clear = var_0;
    level.vehicle_aianims["script_vehicle_bm21_mobile_cover"][1].vehicle_getoutanim_clear = var_1;
    common_scripts\utility::flag_clear( "aa_field" );
    level thread area_basement_init();
}

field_sort_squad()
{
    return distancesquared( self.origin, level.field_fence_origin );
}

field_dialgue()
{
    level.mark thread maps\_anim::anim_single_queue( level.mark, "areaclear" );
    level.price maps\_utility::delaythread( 1, maps\_utility::dialogue_queue, "keepmoving" );
    var_0 = common_scripts\utility::getstruct( "field_go_prone", "script_noteworthy" );
    var_0 waittill( "trigger" );
    common_scripts\utility::flag_set( "hit_the_deck_music" );
    level.price maps\_anim::anim_single_queue( level.price, "hitdeck" );
    level.price thread field_stay_down();
    common_scripts\utility::flag_wait_or_timeout( "field_spoted", 23 );
    common_scripts\utility::flag_set( "field_moveon" );
    var_1 = getaiarray( "allies" );

    if ( !common_scripts\utility::flag( "field_spoted" ) )
    {
        level.price maps\_anim::anim_single_queue( level.price, "helismoving" );
        common_scripts\utility::flag_wait( "field_truck" );
        level.mark maps\_anim::anim_single_queue( level.mark, "contact6oclock" );
        wait 2;
        level.price maps\_anim::anim_single_queue( level.price, "returnfire2" );
    }
    else
    {
        level.price maps\_anim::anim_single_queue( level.price, "ontous" );
        common_scripts\utility::flag_wait( "field_defend" );
        wait 4.5;
        level.mark maps\_anim::anim_single_queue( level.mark, "contact6oclock" );
        level.price maps\_anim::anim_single_queue( level.price, "returnfire2" );
    }

    foreach ( var_3 in var_1 )
        var_3.ignoreall = 0;

    level notify( "kill_action_flag" );
    common_scripts\utility::flag_wait( "field_open_basement" );
    level.price maps\_anim::anim_single_queue( level.price, "basementdooropen2" );
    level.mark maps\_anim::anim_single_queue( level.mark, "imonit" );
    common_scripts\utility::flag_wait( "basement_open" );

    foreach ( var_6 in level.squad )
    {
        if ( isdefined( var_6 ) )
            var_6.disablebulletwhizbyreaction = 1;
    }

    level.mark maps\_anim::anim_single_queue( level.mark, "doorsopen" );
    level.price maps\_anim::anim_single_queue( level.price, "getinhouse" );

    if ( !common_scripts\utility::flag( "squad_in_basement" ) )
        level thread field_basement_nag();
}

field_stay_down()
{
    level endon( "field_spoted" );
    wait 2;
    level thread set_flag_on_player_action( "field_spoted", 1, 1, 0 );
    wait 3;
    level.price maps\_anim::anim_single_queue( level.price, "staydown" );
}

field_basement_nag()
{
    for (;;)
    {
        wait 6;

        if ( common_scripts\utility::flag( "squad_in_basement" ) )
            return;

        level.price maps\_anim::anim_single_queue( level.price, "whatwaitingfor" );
        wait 4;

        if ( common_scripts\utility::flag( "squad_in_basement" ) )
            return;

        level.price maps\_anim::anim_single_queue( level.price, "getinbasement" );
        wait 6;

        if ( common_scripts\utility::flag( "squad_in_basement" ) )
            return;

        level.price maps\_anim::anim_single_queue( level.price, "getinhouse" );
        wait 4;
    }
}

field_open()
{
    common_scripts\utility::flag_set( "field_open" );
    wait 3.5;
    var_0 = getent( "field_clip", "targetname" );
    var_0 delete();
}

field_allies( var_0 )
{
    var_1 = self.animname;
    common_scripts\utility::flag_wait( "field_open" );
    wait(randomfloatrange( 0.5, 1 ) + var_0);
    var_2 = getnode( var_1 + "_field_path", "targetname" );
    set_goalnode( var_2 );
    common_scripts\utility::flag_wait( "field_cross" );
    wait(randomfloat( 0.25 ));
    thread follow_path_hunted( var_2 );
    common_scripts\utility::flag_wait( "field_cover" );
    self notify( "stop_path" );
    wait(randomfloat( 0.25 ));
    var_3 = self.moveplaybackrate;
    self.moveplaybackrate = 1.15;
    var_2 = getnode( var_1 + "_field_cover", "targetname" );
    field_prone_goal( var_2 );
    var_4 = get_prone_ent( var_2 );
    var_4 maps\_anim::anim_reach_solo( self, "hunted_dive_2_pronehide" );
    var_4 maps\_anim::anim_single_solo( self, "hunted_dive_2_pronehide" );
    var_4 thread maps\_anim::anim_loop_solo( self, "hunted_pronehide_idle", undefined, "stop_all_idle" );
    maps\_utility::set_force_color( "r" );
    common_scripts\utility::flag_wait( "field_moveon" );
    self.ignoreall = 1;
    self.moveplaybackrate = var_3;
    self.disablearrivals = 0;
    var_4 notify( "stop_all_idle" );
    waittillframeend;
    var_4 maps\_anim::anim_single_solo( self, "hunted_pronehide_2_stand" );
}

get_prone_ent( var_0 )
{
    var_1 = getentarray( "prone_ent", "targetname" );
    var_2 = vectornormalize( var_0.origin - self.origin );
    var_3 = vectortoangles( var_2 )[1];
    var_1 = common_scripts\utility::get_array_of_closest( self.origin, var_1 );

    for ( var_4 = 0; var_4 < var_1.size; var_4++ )
    {
        var_5 = var_1[var_4].origin - self.origin;
        var_6 = vectortoangles( var_5 )[1];
        var_7 = abs( var_3 - var_6 );

        if ( var_7 < 22.5 && !isdefined( var_1[var_4].inuse ) )
        {
            var_1[var_4].inuse = 1;
            return var_1[var_4];
        }
    }

    return var_0;
}

field_prone_goal( var_0 )
{
    set_goalnode( var_0 );
    self endon( "goal" );
    var_1 = common_scripts\utility::getstruct( "field_go_prone", "script_noteworthy" );
    var_1 waittill( "trigger" );
}

field_helicopter()
{
    common_scripts\utility::flag_wait( "field_cover" );
    soundscripts\_snd::snd_message( "aud_heli_field_pass" );
    var_0 = maps\_vehicle::spawn_vehicle_from_targetname( "field_heli" );
    var_0 sethoverparams( 128, 10, 3 );
    var_0 maps\_vehicle::show_rigs( 4 );
    var_0 maps\_vehicle::show_rigs( 5 );
    level.helicopter = var_0;
    level.helicopter maps\_vehicle::godon();
    wait 0.1;
    common_scripts\utility::array_thread( var_0.riders, ::field_axis );
    var_0 thread heli_path_speed();
    var_0 helicopter_searchlight_on();
    var_0 thread field_helicopter_spot();
    common_scripts\utility::flag_wait_either( "field_spoted", "field_truck" );
    var_1 = common_scripts\utility::getstruct( "field_unload_node", "targetname" );
    var_0 thread heli_path_speed( var_1 );
    var_0 waittill( "unloading" );
    common_scripts\utility::flag_set( "field_defend" );
}

field_helicopter_spot()
{
    level endon( "field_spoted" );

    for (;;)
    {
        wait 0.1;

        if ( distance2d( level.player.origin, self.dlight.origin ) > 400 )
            continue;

        if ( level.player getstance() != "prone" )
            break;
    }

    common_scripts\utility::flag_set( "field_spoted" );
}

helicopter_setturrettargetent( var_0 )
{
    if ( !isdefined( var_0 ) )
        var_0 = self.spotlight_default_target;

    self.current_turret_target = var_0;
    self setturrettargetent( var_0 );
}

helicopter_getturrettargetent()
{
    return self.current_turret_target;
}

setup_spot_target()
{
    var_0 = common_scripts\utility::getstructarray( "spot_target", "script_noteworthy" );
    common_scripts\utility::array_thread( var_0, ::spot_target_node );
}

spot_target_node()
{
    for (;;)
    {
        self waittill( "trigger", var_0 );
        var_1 = common_scripts\utility::get_links();
        var_2 = getent( var_1[0], "script_linkname" );
        var_0 thread spot_target_path( var_2 );
    }
}

spot_target_path( var_0 )
{
    var_1 = 350;
    self notify( "spot_target_path" );
    self endon( "spot_target_path" );

    if ( !isdefined( self.spot_target_ent ) )
        self.spot_target_ent = spawn( "script_model", self.spotlight_default_target.origin );

    var_2 = self.spot_target_ent;
    helicopter_setturrettargetent( var_2 );
    self.spot_target_ent moveto( var_0.origin, 0.5 );
    self.spot_target_ent waittill( "movedone" );
    var_3 = var_2.origin;

    for (;;)
    {
        if ( isdefined( var_0.speed ) )
            var_1 = var_0.speed;

        var_4 = distance( var_0.origin, var_3 ) / var_1 + 0.1;

        if ( isdefined( var_0.radius ) )
            var_2.spot_radius = var_0.radius;
        else
            var_2.spot_radius = undefined;

        var_2 moveto( var_0.origin, var_4 );
        var_2 waittill( "movedone" );
        var_0 maps\_utility::script_delay();

        if ( isdefined( var_0.script_flag_wait ) )
            common_scripts\utility::flag_wait( var_0.script_flag_wait );

        if ( !isdefined( var_0.target ) )
            break;

        var_3 = var_0.origin;
        var_0 = getent( var_0.target, "targetname" );
    }

    helicopter_setturrettargetent( self.spotlight_default_target );
    self.spot_target_ent delete();
}

spot_target_path_end()
{
    self notify( "spot_target_path" );
    self endon( "spot_target_path" );

    while ( isdefined( self.spot_target_ent ) && distance2d( self.spot_target_ent.origin, self.spotlight_default_target.origin ) > 100 )
    {
        self.spot_target_ent moveto( self.spotlight_default_target.origin, 1 );
        self.spot_target_ent waittill( "movedone" );
    }

    helicopter_setturrettargetent( self.spotlight_default_target );

    if ( isdefined( self.spot_target_ent ) )
        self.spot_target_ent delete();
}

setup_tmp_detour_node()
{
    var_0 = common_scripts\utility::getstructarray( "tmp_detour_node", "script_noteworthy" );
    common_scripts\utility::array_thread( var_0, ::tmp_detour_node );
}

tmp_detour_node()
{
    for (;;)
    {
        self waittill( "trigger", var_0 );
        var_1 = common_scripts\utility::getstruct( "tmp_detour_node2", "script_noteworthy" );
        var_0 thread heli_path_speed( var_1 );
    }
}

setup_helicopter_delete_node()
{
    var_0 = common_scripts\utility::getstructarray( "delete_helicopter", "script_noteworthy" );
    common_scripts\utility::array_thread( var_0, ::helicopter_delete_node );
}

helicopter_delete_node()
{
    for (;;)
    {
        self waittill( "trigger", var_0 );
        var_0 delete();
    }
}

field_flyby_speed()
{
    var_0 = level.player.origin;
    wait 2;
    var_1 = level.player.origin;
    var_2 = distance( var_0, var_1 );

    if ( var_2 < 250 )
        var_3 = 9;
    else
        var_3 = 7;

    var_2 = distance( self.origin, level.player.origin );
    var_4 = var_2 / var_3 / 17.6;
    var_5 = var_4 / 2;

    if ( var_5 < 30 )
        var_5 = 30;

    self vehicle_setspeed( var_4, var_5 );
}

field_truck()
{
    common_scripts\utility::flag_wait( "field_moveon" );

    if ( common_scripts\utility::flag( "field_spoted" ) )
        wait 3;

    soundscripts\_snd::snd_message( "aud_barnyard_sequence" );
    var_0 = maps\_vehicle::spawn_vehicle_from_targetname( "field_truck" );
    thread maps\_vehicle::gopath( var_0 );
    wait 0.1;
    common_scripts\utility::array_thread( var_0.riders, ::field_axis );
    var_0 turn_headlights_on( 0 );
    var_0 waittill( "unloading" );
    var_1 = maps\_utility::get_closest_ai( var_0.origin, "axis" );
    maps\_anim::anim_generic( var_1, "bythehouse" );
    common_scripts\utility::flag_set( "field_truck" );
}

field_axis()
{
    if ( !issentient( self ) )
        return;

    self endon( "death" );
    self setthreatbiasgroup( "oblivious" );
    self waittill( "jumpedout" );
    self setthreatbiasgroup( "axis" );
    maps\_utility::battlechatter_on( "allies" );
    maps\_utility::battlechatter_on( "axis" );
    self waittill( "goal" );
    common_scripts\utility::flag_wait( "field_basement" );
    wait(randomfloatrange( 4, 9 ) * 3);
    var_0 = getnode( "field_attack_node", "targetname" );
    set_goalnode( var_0 );
    var_1 = getent( "basement_building", "targetname" );
    var_2 = getent( "field_basement", "targetname" );
    var_3 = getent( "stair_volume", "targetname" );
    common_scripts\utility::flag_wait( "basement_door_open" );

    while ( level.player istouching( var_1 ) || level.player istouching( var_2 ) || level.player istouching( var_3 ) )
        wait 0.5;

    self setgoalentity( level.player );
    self.health *= 2;
    self.baseaccuracy = 2;
    common_scripts\utility::flag_wait( "basement_door_open" );
    self clearenemy();
    self.baseaccuracy = 1;
    self setgoalnode( var_0 );
}

field_basement()
{
    if ( !common_scripts\utility::flag( "field_spoted" ) )
    {
        common_scripts\utility::flag_wait( "field_defend" );
        wait 8;
    }
    else
    {
        common_scripts\utility::flag_wait( "field_truck" );
        wait 4;
    }

    common_scripts\utility::flag_set( "field_open_basement" );
    wait 2;
    level.mark make_ai_move();
    setsaveddvar( "ai_friendlyFireBlockDuration", 0 );
    var_0 = getentarray( "basement_animent", "targetname" )[0];
    var_0 maps\_anim::anim_reach_and_arrive_facing_anim_solo( level.mark, "hunted_open_basement_door_kick", "exposed", 0.6 );
    var_0 thread maps\_anim::anim_single_solo( level.mark, "hunted_open_basement_door_kick" );
    getent( "basement_player_block", "targetname" ) notsolid();
    common_scripts\utility::flag_set( "basement_door_open" );
    level.mark make_ai_normal();
    level.mark maps\_utility::enable_ai_color();
}

setup_basement_door()
{
    getent( "field_basement_door_open_clip", "targetname" ) notsolid();
    var_0 = getent( "basement_door", "targetname" );
    var_0 thread field_basement_door();
    level thread door_pusher();
    var_0 = getent( "basement_inner_door", "targetname" );
    var_1 = getent( var_0.target, "targetname" );
    var_0.handle = getent( "basement_door_handle", "targetname" );
    var_0.handle linkto( var_0 );
    var_0.origin = var_1.origin;
}

door_pusher()
{
    var_0 = getent( "door_pusher", "targetname" );
    var_1 = getent( var_0.target, "targetname" );
    var_2 = getent( "basement_door_volume", "targetname" );
    var_0 notsolid();
    common_scripts\utility::flag_wait( "basement_door_open" );
    wait 8.2;

    if ( !level.player istouching( var_2 ) )
        return;

    var_0 solid();
    var_0 moveto( var_1.origin, 1 );
    wait 2;
    var_0 delete();
}

#using_animtree("door");

field_basement_door()
{
    var_0 = getent( "basement_animent", "targetname" );
    var_1 = getstartorigin( var_0.origin, var_0.angles, %hunted_open_basement_door_kick_door );
    var_2 = getstartangles( var_0.origin, var_0.angles, %hunted_open_basement_door_kick_door );
    self.angles = var_2;
    self.origin = var_1;
    self useanimtree( #animtree );
    self.animname = "door";
    level.scr_anim["door"]["door_kick_door"] = %hunted_open_basement_door_kick_door;
    var_0 maps\_anim::anim_first_frame_solo( self, "door_kick_door" );
    common_scripts\utility::flag_wait( "basement_door_open" );
    thread field_basement_door_sound();
    self setflaggedanim( "door_anim", %hunted_open_basement_door_kick_door );
    var_3 = getanimlength( %hunted_open_basement_door_kick_door );
    wait(var_3 - 1);
    var_4 = getent( self.target, "targetname" );
    var_4 connectpaths();
    var_4 delete();
    common_scripts\utility::flag_set( "basement_open" );
    var_5 = getent( "basement_door_volume", "targetname" );

    while ( level.player istouching( var_5 ) )
        wait 0.1;

    getent( "field_basement_door_open_clip", "targetname" ) solid();
}

field_basement_door_sound()
{
    level.mark waittillmatch( "single anim", "kick" );
    self playsound( "scn_hunted_cellar_door_open" );
}

area_basement_init()
{
    common_scripts\utility::flag_set( "aa_basement" );
    level.price thread basement_price();
    level thread basement_allies();
    level thread basement_helicopter();
    level thread basement_trim_field();
    level thread basement_flash();
    common_scripts\utility::flag_wait( "basement_secure" );
    maps\_utility::autosave_by_name( "basement" );
    maps\_utility::battlechatter_off( "allies" );
    common_scripts\utility::flag_wait( "farm_start" );
    common_scripts\utility::flag_clear( "aa_basement" );
    level thread area_farm_init();
}

basement_allies()
{
    var_0 = getent( "basement_building", "targetname" );
    var_1 = getent( "stair_volume", "targetname" );
    common_scripts\utility::array_thread( level.squad, ::make_ai_move );
    common_scripts\utility::array_thread( level.squad, ::set_grenadeawareness, 0 );
    maps\_utility::activate_trigger_with_targetname( "basement_color_init" );
    var_2 = common_scripts\utility::array_remove( level.squad, level.price );
    var_2 = common_scripts\utility::array_add( var_2, level.player );
    var_3 = 0;
    var_4 = 0;

    while ( !var_4 )
    {
        var_3++;

        if ( var_3 > 240.0 && !level.player istouching( var_0 ) && !level.player istouching( var_1 ) )
            level.player magic_kill();

        var_4 = 1;

        for ( var_5 = 0; var_5 < var_2.size; var_5++ )
        {
            if ( !var_2[var_5] istouching( var_0 ) )
                var_4 = 0;
        }

        wait 0.05;
    }

    if ( common_scripts\utility::flag( "heli_field_stragler_attack" ) )
    {
        var_6 = common_scripts\utility::getstruct( "heli_basement_restart_path", "targetname" );
        level.helicopter thread deactivate_heli_guy();
        level.helicopter thread heli_path_speed( var_6 );
    }

    common_scripts\utility::flag_set( "squad_in_basement" );
    common_scripts\utility::flag_wait( "basement_secure" );
    common_scripts\utility::array_thread( level.squad, ::make_ai_normal );
    common_scripts\utility::array_thread( level.squad, ::set_grenadeawareness );
    common_scripts\utility::array_thread( level.squad, ::make_walk );
    common_scripts\utility::flag_wait( "farm_start" );
    level notify( "stop_walk" );
}

basement_price()
{
    maps\_utility::disable_ai_color();
    var_0 = self.grenadeawareness;
    self.grenadeawareness = 0;
    set_goalnode( getnode( "basement_enter_price", "targetname" ) );
    common_scripts\utility::flag_wait( "squad_in_basement" );

    foreach ( var_2 in level.squad )
    {
        if ( isdefined( var_2 ) )
            var_2.disablebulletwhizbyreaction = 0;
    }

    var_4 = getent( "basement_player_block", "targetname" );
    var_4 solid();
    var_5 = getentarray( "basement_animent", "targetname" )[0];
    var_5 maps\_anim::anim_reach_solo( self, "hunted_basement_door_block" );
    var_5 thread maps\_anim::anim_single_solo( self, "hunted_basement_door_block" );
    var_6 = getent( "basement_inner_door", "targetname" );
    thread basement_door_sound( var_6 );
    wait 1;
    var_6 notsolid();
    var_6 rotateyaw( -180, 1.5, 0.25, 0 );
    var_6 waittill( "rotatedone" );
    var_6 solid();
    var_6 disconnectpaths();
    wait 0.5;
    var_6.handle unlink();
    var_6.handle rotatepitch( 130, 0.35 );
    maps\_utility::set_force_color( "y" );
    common_scripts\utility::flag_set( "basement_secure" );
    var_4 delete();
    wait 1;
    thread maps\_anim::anim_single_queue( self, "takepoint" );
    self.grenadeawareness = var_0;
    common_scripts\utility::flag_wait( "farm_start" );
}

basement_door_sound( var_0 )
{
    self waittillmatch( "single anim", "scn_hunted_metal_door_closed" );
    var_0 playsound( "scn_hunted_metal_door_closed" );
}

basement_helicopter()
{
    var_0 = level.helicopter;
    common_scripts\utility::flag_wait( "basement_door_open" );
    var_1 = common_scripts\utility::getstruct( "heli_basement_path", "targetname" );
    var_0 thread heli_path_speed( var_1 );
    var_0 deactivate_heli_guy();
}

basement_trim_field()
{
    common_scripts\utility::flag_wait( "trim_field" );
    var_0 = getaiarray( "axis" );
    var_0 = maps\_utility::array_exclude( var_0, maps\_utility::get_ai_group_ai( "basement_field_guy" ) );

    if ( var_0.size < 4 )
        maps\_utility::activate_trigger_with_targetname( "field_clear_killspawner" );

    for ( var_1 = 0; var_1 < var_0.size; var_1++ )
        var_0[var_1] delete();

    while ( !common_scripts\utility::flag( "basement_flash" ) && maps\_utility::get_ai_group_count( "basement_field_guy" ) > 3 )
        wait 0.05;

    var_0 = maps\_utility::get_ai_group_ai( "basement_field_guy" );
    var_2 = getnode( "field_retreat_node", "targetname" );
    common_scripts\utility::array_thread( var_0, ::set_goalnode, var_2 );
    common_scripts\utility::array_thread( var_0, ::delete_on_goal );
}

basement_flash()
{
    common_scripts\utility::flag_wait( "basement_flash" );
    scripted_array_spawn( "basement_flash_guy", "targetname", 1 );
    wait 2;
    var_0 = getaiarray( "axis" );
    common_scripts\utility::array_thread( var_0, ::flash_immunity, 2 );

    if ( isdefined( var_0[0] ) )
    {
        var_1 = var_0[0];
        var_2 = var_1.grenadeweapon;
        var_1.grenadeweapon = "flash_grenade";
        var_1.grenadeammo++;
        var_3 = getent( "enemy_flash_bang", "targetname" );
        var_4 = getent( var_3.target, "targetname" );
        var_1 magicgrenade( var_3.origin, var_4.origin, 1 );
        var_1.grenadeweapon = var_2;
    }

    level.mark thread maps\_anim::anim_single_queue( level.mark, "warn_flashbang" );

    while ( !common_scripts\utility::flag( "farm_start" ) && maps\_utility::get_ai_group_count( "basement_flash_guy" ) )
        wait 0.05;

    common_scripts\utility::flag_set( "farm_start" );
    var_0 = maps\_utility::get_ai_group_ai( "basement_flash_guy" );

    for ( var_5 = 0; var_5 < var_0.size; var_5++ )
        var_0[var_5] setgoalentity( level.player );
}

area_farm_init()
{
    common_scripts\utility::flag_set( "aa_farm" );
    maps\_utility::arcademode_checkpoint( 6, 2 );
    setsaveddvar( "ai_friendlyFireBlockDuration", level.ai_friendlyfireblockduration );
    common_scripts\utility::array_thread( getentarray( "farm_dog", "script_noteworthy" ), maps\_utility::add_spawn_function, ::farm_dog_spawn_function );
    common_scripts\utility::array_thread( getentarray( "farm_forerunners", "script_noteworthy" ), maps\_utility::add_spawn_function, ::farm_forerunners );
    common_scripts\utility::array_thread( getentarray( "farm_defenders", "script_noteworthy" ), maps\_utility::add_spawn_function, ::farm_defenders );
    level thread farm_enemies_timer();
    level thread farm_dialogue();
    level thread farm_push();
    level.player.maxflashedseconds = 3;
    level.price maps\_utility::set_force_color( "y" );
    level.mark maps\_utility::set_force_color( "y" );
    level.steve maps\_utility::set_force_color( "r" );
    level.charlie maps\_utility::set_force_color( "r" );
    level.price.interval = 120;
    level.mark.interval = 120;
    level.steve.interval = 120;
    level.charlie.interval = 120;
    wait 1;
    maps\_utility::activate_trigger_with_targetname( "farm_color_init" );
    common_scripts\utility::flag_wait( "farm_alert" );
    maps\_utility::battlechatter_on( "allies" );
    maps\_utility::battlechatter_on( "axis" );
    maps\_utility::autosave_by_name( "dogs" );
    var_0 = getent( "cistern_color_trigger", "script_noteworthy" );

    if ( isdefined( var_0 ) )
        var_0 common_scripts\utility::trigger_off();

    maps\_utility::activate_trigger_with_targetname( "farm_advance_color_init" );
    level thread farm_clear_enemies();
    maps\_utility::waittill_aigroupcleared( "farm_forerunners" );
    maps\_utility::waittill_aigroupcleared( "farm_defenders" );
    common_scripts\utility::flag_set( "farm_clear" );
    var_1 = getentarray( "farm_color_trigger", "script_noteworthy" );
    common_scripts\utility::array_thread( var_1, common_scripts\utility::trigger_off );
    maps\_utility::activate_trigger_with_targetname( "farm_cleared_color_init" );
    common_scripts\utility::flag_clear( "aa_farm" );
    level thread area_creek_init();
}

farm_push()
{
    level endon( "farm_clear" );
    var_0 = 100;

    while ( var_0 > 4 )
    {
        var_0 = maps\_utility::get_ai_group_count( "farm_forerunners" );
        var_0 += maps\_utility::get_ai_group_count( "farm_defenders" );
        wait 1;
    }

    maps\_utility::activate_trigger_with_targetname( "farm_push_color_init" );
}

dynamic_dog_threat()
{
    for (;;)
    {
        setthreatbias( "dogs", "allies", -4000 );
        level.player waittill( "dog_attacks_player" );
        setthreatbias( "dogs", "allies", 0 );
        level.player waittill( "player_saved_from_dog" );
    }
}

farm_enemies_timer()
{
    var_0 = getent( "farm_enemies", "script_noteworthy" );
    var_0 endon( "trgger" );
    common_scripts\utility::flag_wait( "farm_enemies_timer" );
    wait(randomfloatrange( 13, 17 ));
    maps\_utility::activate_trigger_with_noteworthy( "farm_enemies" );
    maps\_utility::activate_trigger_with_noteworthy( "farm_enemy_dogs" );
}

farm_dialogue()
{
    var_0 = getent( "quiet_dialogue", "targetname" );
    var_0 waittill( "trigger" );
    level.charlie maps\_anim::anim_single_queue( level.charlie, "tooquiet" );
    level.mark maps\_anim::anim_single_queue( level.mark, "regrouping" );
    wait 2;
    level.price thread maps\_anim::anim_single_queue( level.price, "staysharp" );
    maps\_utility::autosave_by_name( "farm" );
}

farm_forerunners()
{
    self endon( "death" );

    if ( randomint( 100 ) > 60 )
        self.grenadeweapon = "flash_grenade";

    while ( 3 < maps\_utility::get_ai_group_count( "farm_forerunners" ) )
        wait 0.1;

    set_goalvolume( "farm_volume" );
    common_scripts\utility::flag_set( "farm_alert" );
}

farm_defenders()
{
    self endon( "death" );

    if ( randomint( 100 ) > 60 )
        self.grenadeweapon = "flash_grenade";

    while ( 4 < maps\_utility::get_ai_group_count( "farm_defenders" ) )
        wait 0.1;

    set_goalvolume( "farm_volume" );
}

farm_dog_spawn_function()
{
    self endon( "death" );

    if ( !isdefined( level.farm_dogs ) )
    {
        level.farm_dogs = [];
        level thread farm_dogs_delete();
    }

    level.farm_dogs[level.farm_dogs.size] = self;

    if ( level.farm_dogs.size == 3 )
        level notify( "dogs_loaded" );

    if ( isdefined( self.target ) )
        self waittill( "goal" );

    self setgoalentity( level.player );
    self.goalradius = 300;
}

farm_dogs_delete()
{
    level waittill( "dogs_loaded" );
    level.farm_dogs = common_scripts\utility::array_randomize( level.farm_dogs );

    switch ( level.gameskill )
    {
        case 0:
            var_0 = 2;
            break;
        case 1:
            var_0 = 2;
            break;
        default:
            var_0 = 3;
            break;
    }

    for ( var_1 = 0; var_1 < level.farm_dogs.size; var_1++ )
    {
        if ( var_1 < var_0 )
            continue;

        level.farm_dogs[var_1] delete();
    }
}

farm_clear_enemies()
{
    var_0 = getent( "farm_clear_enemies", "targetname" );
    var_0 waittill( "trigger" );
    var_1 = maps\_utility::get_ai_group_ai( "farm_forerunners" );
    var_2 = maps\_utility::get_ai_group_ai( "farm_defenders" );
    var_3 = common_scripts\utility::array_combine( var_1, var_2 );
    var_4 = getent( "farm_volume", "targetname" );

    for ( var_5 = 0; var_5 < var_3.size; var_5++ )
    {
        if ( var_3[var_5] istouching( var_4 ) )
            continue;

        var_3[var_5] setgoalentity( level.player );
        var_3[var_5].goalradius = 450;
    }
}

area_creek_init()
{
    maps\_utility::autosave_by_name( "creek" );
    common_scripts\utility::flag_set( "aa_creek" );
    maps\_utility::arcademode_checkpoint( 5, 3 );
    var_0 = getent( "creek_gate", "targetname" );
    var_1 = getent( "gate_model", "targetname" );
    var_2 = getent( "creek_gate_animent", "targetname" );
    var_0.old_angles = var_0.angles;

    if ( getdvarint( "use_old_door_openings" ) == 1 )
        var_1 linkto( var_0 );
    else
    {
        var_0 linkto( var_1, "door_open_jnt" );
        var_1 maps\_utility::assign_animtree( "creekgate" );
        var_2 maps\_anim::anim_first_frame_solo( var_1, "open" );
    }

    maps\_utility::battlechatter_off( "allies" );
    maps\_utility::battlechatter_off( "axis" );
    common_scripts\utility::flag_clear( "player_interruption" );
    var_3 = getentarray( "creek_bridge_guy", "script_noteworthy" );
    common_scripts\utility::array_thread( var_3, maps\_utility::add_spawn_function, ::creek_bridge_guy );
    common_scripts\utility::array_thread( getnodearray( "patroll_animation", "script_noteworthy" ), ::creek_guard_node );
    common_scripts\utility::flag_wait( "creek_helicopter" );
    level thread set_playerspeed( 130, 6 );
    level.player thread player_sprint_check();
    level thread creek_axis_dialogue();
    level thread creek_dialogue();
    level thread creek_truck();
    level thread creek_helicopter();
    level thread creek_gate();
    level thread creek_cqb_setup();
    common_scripts\utility::flag_wait( "creek_truck_on_bridge" );
    level thread set_flag_on_player_action( "player_interruption", 1, 1, 0 );
    common_scripts\utility::flag_wait_either( "road_start", "player_interruption" );
    common_scripts\utility::flag_clear( "aa_creek" );
    level thread area_road_init();
}

creek_gate()
{
    wait 6;
    var_0 = getent( "creek_gate", "targetname" );
    var_1 = getent( "gate_model", "targetname" );
    var_2 = getent( "creek_gate_animent", "targetname" );
    level.price maps\_utility::disable_ai_color();
    maps\_utility::activate_trigger_with_targetname( "creek_gate_color_init" );
    level.price.scriptedarrivalent = var_2;
    level.price.scriptedarrivalent.type = "Cover Right";
    var_2 maps\_anim::anim_reach_and_approach_solo( level.price, "hunted_open_creek_gate" );
    level.price.scriptedarrivalent = undefined;

    if ( getdvarint( "use_old_door_openings" ) == 1 )
    {
        var_2 thread maps\_anim::anim_single_solo( level.price, "hunted_open_creek_gate" );
        level.price maps\_utility::enable_cqbwalk();
        common_scripts\utility::flag_set( "creek_gate_open" );
        var_0 maps\_utility::hunted_style_door_open( "door_gate_chainlink_slow_open" );
        level.price maps\_utility::set_force_color( "y" );
        level.price waittill( "done_setting_new_color" );
        maps\_utility::activate_trigger_with_targetname( "creek_color_init" );
    }
    else
    {
        var_0 thread h1_play_door_sound( 0, "door_gate_chainlink_slow_open" );
        wait 0.25;
        var_2 thread maps\_anim::anim_single_solo( level.price, "hunted_open_creek_gate" );
        level.price maps\_utility::enable_cqbwalk();
        common_scripts\utility::flag_set( "creek_gate_open" );
        level.price maps\_utility::set_force_color( "y" );
        maps\_utility::activate_trigger_with_targetname( "creek_color_init" );
        var_2 maps\_anim::anim_single_solo( var_1, "open" );
        var_0 connectpaths();
    }

    common_scripts\utility::flag_wait( "creek_bridge" );
    var_1 rotateto( var_0.old_angles, 0.1 );
    var_1 waittill( "rotatedone" );
}

h1_connectanimateddoorpaths()
{
    foreach ( var_1 in level.animated_door_clip_brushes )
    {
        if ( var_1["door"] == self )
            var_1["clip"] connectpaths();
    }
}

creek_dialogue()
{
    wait 6;
    level.mark maps\_anim::anim_single_queue( level.mark, "helicoptersback" );
    wait 3;
    level.price maps\_anim::anim_single_queue( level.price, "keepitthatway" );
    common_scripts\utility::flag_wait( "creek_gate_open" );
    wait 0.5;
    level.price maps\_anim::anim_single_queue( level.price, "presson" );
    level endon( "player_interruption" );
    var_0 = common_scripts\utility::getstruct( "creek_heli_warning", "script_noteworthy" );
    var_0 waittill( "trigger" );
    level.price thread maps\_anim::anim_single_queue( level.price, "sentriesatbridge" );
}

creek_truck()
{
    common_scripts\utility::flag_wait( "creek_start" );
    var_0 = maps\_vehicle::spawn_vehicle_from_targetname( "creek_truck" );
    thread maps\_vehicle::gopath( var_0 );
    var_0 turn_headlights_on( 0 );
    var_0 maps\_vehicle::godon();
    var_0 waittill( "unloading" );
    common_scripts\utility::flag_set( "creek_truck_on_bridge" );
}

creek_helicopter()
{
    wait 3;
    var_0 = maps\_vehicle::spawn_vehicle_from_targetname( "creek_heli" );
    var_0 sethoverparams( 128, 35, 25 );
    wait 0.1;

    for ( var_1 = 0; var_1 < var_0.riders.size; var_1++ )
        var_0.riders[var_1] setthreatbiasgroup( "oblivious" );

    level.helicopter = var_0;
    level.helicopter maps\_vehicle::godon();
    var_0 thread heli_path_speed();
    var_0 helicopter_searchlight_on();
    common_scripts\utility::flag_wait( "creek_bridge" );
    var_2 = common_scripts\utility::getstruct( "creek_flyover_struct", "targetname" );
    var_0 thread heli_path_speed( var_2 );
}

creek_bridge_guy()
{
    self endon( "death" );
    self notify( "stop_going_to_node" );
    self setthreatbiasgroup( "oblivious" );
    thread maps\_utility::magic_bullet_shield();
    self.animname = "axis";
    self.disablearrivals = 1;
    maps\_utility::set_run_anim( "patrolwalk_" + ( randomint( 5 ) + 1 ) );
    self.alwaysrunforward = 1;
    self waittill( "jumpedout" );
    var_0 = getnode( self.target, "targetname" );
    thread follow_path_hunted( var_0, 1 );
    wait 2;
    attach_flashlight( 1 );
    thread road_axis_interrupt();
    wait 5;
    maps\_utility::stop_magic_bullet_shield();
    level endon( "player_interruption" );
    common_scripts\utility::flag_wait( "road_field_end" );
    wait(randomfloatrange( 5, 10 ));
    self notify( "stop_interrupt" );
    var_1 = getnode( "road_delete_node", "targetname" );
    set_goalnode( var_1 );
    thread delete_on_goal();
}

creek_axis_dialogue()
{
    level endon( "road_field_clear" );
    common_scripts\utility::flag_wait( "player_interruption" );
    var_0 = maps\_utility::get_closest_ai( level.player.origin, "axis" );

    if ( !common_scripts\utility::flag( "road_field_search" ) )
    {
        maps\_anim::anim_generic( var_0, "hunted_ru2_bythecreek" );
        wait(randomfloat( 3 ) + 2);
    }

    var_0 = maps\_utility::get_closest_ai( level.player.origin, "axis" );
    maps\_anim::anim_generic( var_0, "hunted_ru1_inthefield" );
    wait(randomfloat( 3 ) + 2);
    var_0 = maps\_utility::get_closest_ai( level.player.origin, "axis" );
    maps\_anim::anim_generic( var_0, "hunted_ru4_outonfield" );
}

creek_guard_node()
{
    level endon( "player_interruption" );

    for (;;)
    {
        self waittill( "trigger", var_0 );
        thread interrupt_guard_node( var_0 );
        maps\_anim::anim_single_solo( var_0, self.script_animation );
        self notify( "guard_anim_done" );
    }
}

interrupt_guard_node( var_0 )
{
    var_0 endon( "death" );
    self endon( "guard_anim_done" );
    level waittill( "player_interruption" );
    var_0 stopanimscripted();
    var_0 notify( "single anim", "end" );
}

creek_cqb_setup()
{
    common_scripts\utility::array_thread( getentarray( "creek_cqb_start", "targetname" ), ::creek_cqb_start );
    common_scripts\utility::array_thread( getentarray( "creek_cqb_end", "targetname" ), ::creek_cqb_start );
}

creek_cqb_start()
{
    for (;;)
    {
        self waittill( "trigger", var_0 );
        var_0 thread maps\_utility::ignore_triggers( 1 );
        var_0 maps\_utility::enable_cqbwalk();
    }
}

creek_cqb_end()
{
    for (;;)
    {
        self waittill( "trigger", var_0 );
        var_0 thread maps\_utility::ignore_triggers( 1 );
        var_0 maps\_utility::disable_cqbwalk();
    }
}

area_road_init()
{
    common_scripts\utility::flag_set( "aa_second_field" );
    level thread road_allies();
    level thread road_axis();
    level thread road_helicopter();
    level thread road_reset_speed();
    level thread road_field_cleanup();
    level thread road_field_clear();

    if ( !common_scripts\utility::flag( "player_interruption" ) )
    {
        maps\_utility::autosave_by_name( "road" );
        level thread road_field();
        level thread road_roadblock();
    }
    else
    {
        maps\_utility::battlechatter_on( "allies" );
        maps\_utility::battlechatter_on( "axis" );
        common_scripts\utility::flag_wait( "road_start" );
        common_scripts\utility::flag_set( "road_open_field" );
    }

    common_scripts\utility::flag_wait( "greenhouse_area" );

    if ( !common_scripts\utility::flag( "player_interruption" ) )
        common_scripts\utility::flag_set( "player_interruption" );

    common_scripts\utility::flag_wait( "road_field_clear" );
    common_scripts\utility::flag_clear( "aa_second_field" );
    level thread area_greenhouse_init();
}

road_field_clear()
{
    while ( maps\_utility::get_ai_group_count( "road_group" ) > 3 )
        wait 0.1;

    common_scripts\utility::flag_set( "road_field_clear_helicopter" );
    wait 0.5;
    maps\_utility::waittill_aigroupcleared( "road_group" );
    common_scripts\utility::flag_set( "road_field_clear" );
}

road_field_cleanup()
{
    common_scripts\utility::flag_wait( "road_field_cleanup" );
    var_0 = getnode( "road_field_cleanup_node", "targetname" );
    var_1 = maps\_utility::get_ai_group_ai( "road_group" );
    common_scripts\utility::array_thread( var_1, maps\_utility::disable_ai_color );
    common_scripts\utility::array_thread( var_1, ::set_goalnode, var_0 );
    common_scripts\utility::array_thread( var_1, ::delete_on_goal );
    common_scripts\utility::flag_set( "road_field_clear_helicopter" );
    wait 0.5;
    common_scripts\utility::flag_set( "road_field_clear" );
}

road_reset_speed()
{
    common_scripts\utility::flag_wait( "player_interruption" );
    level thread set_playerspeed( 190, 6 );
}

road_helicopter()
{
    level thread road_helicopter_clear();
    common_scripts\utility::flag_wait( "player_interruption" );
    wait 2;
    level.helicopter notify( "stop_path" );
    setthreatbias( "player", "heli_guy", 10000 );
    setthreatbias( "heli_guy", "player", 20000 );

    if ( level.gameskill > 1 && !common_scripts\utility::flag( "road_field_clear_helicopter" ) )
    {
        level.heli_guy_accuracy = 2;
        level.heli_guy_health_multiplier = 1;
        level.heli_guy_respawn_delay = 10;
        level.helicopter thread activate_heli_guy();
    }
    else
    {
        level.heli_guy_accuracy = 2;
        level.heli_guy_health_multiplier = 0.8;
        level.heli_guy_respawn_delay = 10;
    }

    level.helicopter heli_path_speed( common_scripts\utility::getstruct( "road_heli_start", "targetname" ) );

    if ( !common_scripts\utility::flag( "road_field_clear_helicopter" ) )
    {
        level.helicopter thread helicopter_attack( 15, "attack_helicopter" );
        wait 4;
    }

    if ( level.gameskill < 2 && !common_scripts\utility::flag( "road_field_clear_helicopter" ) )
        level.helicopter thread activate_heli_guy();

    level.price maps\_anim::anim_single_queue( level.price, "watchhelicopter" );
}

road_helicopter_clear()
{
    common_scripts\utility::flag_wait( "road_field_clear_helicopter" );
    level.helicopter stop_helicopter_attack();
    level.helicopter deactivate_heli_guy();
    level.helicopter spot_target_path_end();
    level.helicopter thread heli_path_speed( common_scripts\utility::getstruct( "greenhouse_startpath", "targetname" ) );
    common_scripts\utility::flag_set( "road_helicopter_cleared" );
}

road_field()
{
    common_scripts\utility::flag_wait_or_timeout( "player_interruption", 8 );
    common_scripts\utility::flag_set( "road_open_field" );
}

road_allies()
{
    level endon( "road_field_cleanup" );
    common_scripts\utility::flag_wait( "road_open_field" );

    for ( var_0 = 0; var_0 < level.squad.size; var_0++ )
        level.squad[var_0] pushplayer( 1 );

    road_bridge_wait();
    common_scripts\utility::flag_set( "roadblock" );
    wait 2;

    if ( !common_scripts\utility::flag( "player_interruption" ) )
    {
        level.price thread maps\_anim::anim_single_queue( level.price, "staylow" );
        level thread road_allies_exposed();
    }
    else
        level.price maps\_anim::anim_single_queue( level.price, "moveit" );

    maps\_utility::activate_trigger_with_targetname( "road_color_stage_1" );
    wait 1;
    level.price waittill( "goal" );
    wait 6;
    maps\_utility::activate_trigger_with_targetname( "road_color_stage_2" );
    wait 1;
    level.price waittill( "goal" );
    wait 6;
    maps\_utility::activate_trigger_with_targetname( "road_color_stage_3" );
    wait 1;
    level.steve waittill( "goal" );
    common_scripts\utility::flag_wait( "road_field_search" );
    wait 4;
    maps\_utility::activate_trigger_with_targetname( "road_color_stage_4" );
    wait 1;
    level.price waittill( "goal" );
    wait 2;
    maps\_utility::activate_trigger_with_targetname( "road_color_stage_5" );
    common_scripts\utility::flag_set( "road_field_end" );
    level.price waittill( "goal" );
    common_scripts\utility::flag_wait( "player_interruption" );

    while ( maps\_utility::get_ai_group_count( "road_group" ) > 4 )
        wait 0.05;

    maps\_utility::activate_trigger_with_targetname( "road_color_stage_6" );

    for ( var_0 = 0; var_0 < level.squad.size; var_0++ )
        level.squad[var_0] pushplayer( 0 );
}

road_allies_exposed()
{
    common_scripts\utility::flag_wait( "player_interruption" );
    maps\_utility::battlechatter_on( "axis" );
    wait 2;
    level.mark maps\_anim::anim_single_queue( level.mark, "hunted_uk2_werecompromised" );

    if ( !common_scripts\utility::flag( "road_field_end" ) )
        level.price maps\_anim::anim_single_queue( level.price, "endoffield" );

    maps\_utility::battlechatter_on( "allies" );
}

road_bridge_wait()
{
    level endon( "player_interruption" );
    level endon( "roadblock" );

    if ( common_scripts\utility::flag( "player_interruption" ) )
        return;

    var_0 = getent( "bridge_volume", "targetname" );
    level.price maps\_anim::anim_single_queue( level.price, "outofspotlight" );
    wait 2;
}

road_axis()
{
    common_scripts\utility::flag_wait( "roadblock" );

    if ( !common_scripts\utility::flag( "player_interruption" ) )
    {
        common_scripts\utility::array_thread( getentarray( "road_idle_guy", "targetname" ), maps\_utility::add_spawn_function, ::road_idle_guy );
        common_scripts\utility::array_thread( getentarray( "road_guy", "targetname" ), maps\_utility::add_spawn_function, ::road_guy );
        var_0 = scripted_array_spawn( "road_idle_guy", "targetname", 1 );
        var_0 = scripted_array_spawn( "road_guy", "targetname", 1 );
    }
    else
    {
        common_scripts\utility::array_thread( getentarray( "road_idle_guy", "targetname" ), maps\_utility::add_spawn_function, ::road_guy_attack );
        common_scripts\utility::array_thread( getentarray( "road_guy", "targetname" ), maps\_utility::add_spawn_function, ::road_guy_attack );
        var_0 = scripted_array_spawn( "road_guy", "targetname", 1 );
        wait 10;
        var_0 = scripted_array_spawn( "road_idle_guy", "targetname", 1 );
    }
}

road_guy_attack()
{
    self notify( "stop_going_to_node" );
    maps\_utility::set_force_color( "p" );
}

road_guy()
{
    self endon( "death" );
    level endon( "player_interruption" );
    self setthreatbiasgroup( "oblivious" );
    self.disablearrivals = 1;
    self.alwaysrunforward = 1;
    self.animname = "axis";
    maps\_utility::set_run_anim( "patrolwalk_" + ( randomint( 5 ) + 1 ) );
    attach_flashlight( 1 );
    thread road_axis_interrupt();
    self notify( "stop_going_to_node" );
    var_0 = getnode( self.target, "targetname" );
    thread follow_path_hunted( var_0, 1 );
    self waittill( "path_end_reached" );
    common_scripts\utility::flag_set( "player_interruption" );
}

road_idle_guy()
{
    self endon( "death" );
    level endon( "player_interruption" );
    self setthreatbiasgroup( "oblivious" );
    self.disablearrivals = 1;
    self.animname = "axis";
    maps\_utility::set_run_anim( "patrolwalk_nolight" );
    thread road_axis_interrupt();
    self.alwaysrunforward = 1;
    common_scripts\utility::flag_wait( "road_field_search" );
    wait(randomfloat( 20 ));
    self notify( "stop_interrupt" );
    var_0 = getnode( "road_field_cleanup_node", "targetname" );
    set_goalnode( var_0 );
    thread delete_on_goal();
}

road_roadblock()
{
    level endon( "player_interruption" );
    common_scripts\utility::flag_wait( "roadblock" );
    var_0 = scripted_array_spawn( "roadblock_guy", "script_noteworthy", 1 );
    level thread road_roadblock_anim( var_0 );
    var_1 = getvehiclenode( "roadblock_start", "script_noteworthy" );
    var_2 = getvehiclenode( "roadblock_stop", "script_noteworthy" );
    var_3 = maps\_vehicle::spawn_vehicle_from_targetname( "road_pickup" );
    thread maps\_vehicle::gopath( var_3 );
    var_1 waittill( "trigger" );
    common_scripts\utility::flag_set( "roadblock_start" );
    var_2 waittill( "trigger" );
    var_3 vehicle_setspeed( 0, 15 );
    common_scripts\utility::flag_wait( "roadblock_done" );
    var_3 resumespeed( 35 );
}

road_roadblock_anim( var_0 )
{
    level endon( "player_interruption" );
    var_1 = getnodearray( "roadblock_path", "targetname" );
    var_0[0] thread road_roadblock_guy( "guard1", var_1[1] );
    var_0[1] thread road_roadblock_guy( "guard2", var_1[0] );
    var_2 = getent( "roadblock_animent", "targetname" );
    level thread road_roadblock_interrupt( var_0, var_2 );
    var_2 maps\_anim::anim_reach( var_0, "roadblock_sequence" );

    if ( !common_scripts\utility::flag( "roadblock_start" ) && !common_scripts\utility::flag( "player_interruption" ) )
        var_2 maps\_anim::anim_loop( var_0, "roadblock_startidle", "stop_idle" );

    common_scripts\utility::flag_wait( "roadblock_start" );
    var_2 notify( "stop_idle" );
    var_2 maps\_anim::anim_single( var_0, "roadblock_sequence" );
    common_scripts\utility::flag_set( "roadblock_done" );
}

road_roadblock_interrupt( var_0, var_1 )
{
    common_scripts\utility::flag_wait( "player_interruption" );
    var_1 notify( "stop_idle" );

    if ( !common_scripts\utility::flag( "roadblock_start" ) )
        return;

    var_0[0] stopanimscripted();
    var_0[0] notify( "single anim", "end" );
    var_0[1] stopanimscripted();
    var_0[1] notify( "single anim", "end" );
    common_scripts\utility::flag_set( "roadblock_done" );
}

road_roadblock_guy( var_0, var_1 )
{
    self endon( "death" );
    level endon( "player_interruption" );
    self.animname = var_0;
    self.disablearrivals = 1;
    maps\_utility::set_run_anim( "patrolwalk" );
    self setthreatbiasgroup( "oblivious" );
    attach_flashlight( 1 );
    thread road_axis_interrupt();
    common_scripts\utility::flag_wait( "roadblock_done" );
    self.disablearrivals = 1;
    self.animname = "axis";
    thread follow_path_hunted( var_1, 1 );
}

road_axis_interrupt()
{
    self endon( "death" );
    self endon( "stop_interrupt" );
    thread road_axis_proximity();
    common_scripts\utility::flag_wait( "player_interruption" );

    if ( !self.spotter )
        wait(randomfloat( 2 ) + 0.5);

    self notify( "stop_path" );
    flashlight_light( 0 );
    self.disablearrivals = 0;
    maps\_utility::clear_run_anim();
    self.alwaysrunforward = undefined;
    self setthreatbiasgroup( "axis" );
    maps\_utility::set_force_color( "p" );
    detach_flashlight();
}

road_axis_proximity()
{
    level endon( "player_interruption" );
    self endon( "death" );
    self.spotter = 0;
    wait(randomfloat( 1 ));

    for (;;)
    {
        var_0 = cos( 65 );
        wait 0.25;
        var_1 = distance2d( level.player.origin, self.origin );

        if ( var_1 > 1000 )
            continue;

        if ( var_1 < 400 && level.player getstance() != "prone" )
            var_0 = cos( 120 );

        if ( var_1 < 900 && common_scripts\utility::flag( "player_sprint" ) )
        {
            self.spotter = 1;
            common_scripts\utility::flag_set( "player_interruption" );
        }

        if ( !common_scripts\utility::within_fov( self.origin, self.angles, level.player.origin, var_0 ) )
            continue;

        var_2 = var_1 / 1000;

        if ( var_2 > level.player scripted_sightconetrace( self geteye(), self ) )
            continue;

        self.spotter = 1;
        common_scripts\utility::flag_set( "player_interruption" );
    }
}

area_greenhouse_init()
{
    common_scripts\utility::flag_set( "aa_greenhouse" );
    maps\_utility::arcademode_checkpoint( 6, 4 );
    var_0 = getent( "big_barn_door", "targetname" );
    var_1 = getent( "big_barn_animent", "targetname" );

    if ( getdvarint( "use_old_door_openings" ) == 1 )
    {
        var_2 = getent( "big_barn_door_model", "targetname" );
        var_2 linkto( var_0 );
    }
    else
    {
        var_0 maps\_utility::assign_animtree( "barndoor_02" );
        var_1 maps\_anim::anim_first_frame_solo( var_0, "open" );
    }

    for ( var_3 = 0; var_3 < level.squad.size; var_3++ )
        level.squad[var_3] pushplayer( 0 );

    common_scripts\utility::flag_wait( "road_helicopter_cleared" );
    level.helicopter thread helicopter_attack( 8, "greenhouse_attack_helicopter" );
    maps\_utility::activate_trigger_with_targetname( "greenhouse_color_init" );
    level thread greenhouse_heli_light_off();
    level thread greenhouse_stinger();
    level thread greenhouse_fake_target();
    level thread greenhouse_barn_door();
    level thread infinite_stinger_h1();
    common_scripts\utility::flag_wait( "road_field_cleanup" );
    var_4 = getscreenwidth();
    var_5 = getscreenheight();

    if ( var_4 / var_5 > 2 )
    {
        if ( getdvarfloat( "r_lodScaleRigid" ) < 1.2 )
            setsaveddvar( "r_lodScaleRigid", "1.2" );
    }

    maps\_utility::autosave_by_name( "greenhouse" );
    common_scripts\utility::flag_wait( "greenhouse_done" );
    common_scripts\utility::flag_clear( "aa_greenhouse" );
    level thread area_ac130_init();
}

greenhouse_heli_light_off()
{
    common_scripts\utility::flag_wait( "greenhouse_heli_light_off" );
    helicopter_searchlight_off();
}

infinite_stinger()
{
    var_0 = getent( "infinite_stinger", "targetname" );
    var_1 = getentarray( var_0.target, "targetname" );

    for ( var_2 = 0; var_2 < var_1.size; var_2++ )
        var_1[var_2] hide();

    var_0 hide();
    var_2 = 0;

    for (;;)
    {
        var_3 = var_0.origin + ( 0.0, 0.0, 5.0 );
        var_4 = spawn( "weapon_stinger", var_3 );
        var_4.angles = var_0.angles;
        wait 1;
        var_4.origin = var_0.origin + ( 0.0, 0.0, -2.0 );
        var_4 waittill( "trigger", var_5, var_6 );

        if ( isdefined( var_6 ) )
        {
            var_6.origin = var_1[var_2].origin;
            var_6.angles = var_1[var_2].angles;
            var_2++;

            if ( var_2 > var_1.size )
                var_2 = 0;
        }

        level.player waittill( "stinger_fired" );
    }
}

infinite_stinger_h1()
{
    var_0 = getent( "infinite_stinger", "targetname" );
    var_1 = [];
    var_2 = [];
    var_3 = var_0.origin;
    var_4 = var_0.angles;
    var_5 = getentarray( var_0.target, "targetname" );

    for ( var_6 = 0; var_6 < var_5.size; var_6++ )
    {
        var_1[var_1.size] = var_5[var_6].origin;
        var_2[var_2.size] = var_5[var_6].angles;
        var_5[var_6] delete();
    }

    var_0 delete();
    var_6 = 0;

    for (;;)
    {
        var_7 = var_3 + ( 0.0, 0.0, 5.0 );
        var_8 = spawn( "weapon_stinger", var_7 );
        var_8.angles = var_4;
        wait 1;
        var_8.origin = var_3 + ( 0.0, 0.0, -2.0 );
        var_8 waittill( "trigger", var_9, var_10 );

        if ( isdefined( var_10 ) )
        {
            var_10.origin = var_1[var_6];
            var_10.angles = var_2[var_6];
            var_6++;

            if ( var_6 > var_1.size )
                var_6 = 0;
        }

        level.player waittill( "stinger_fired" );
    }
}

greenhouse_stinger()
{
    while ( maps\_utility::get_ai_group_count( "greenhouse_group" ) > 10 )
    {
        wait 0.05;

        if ( !isdefined( level.helicopter ) )
        {
            common_scripts\utility::flag_set( "helicopter_down" );
            common_scripts\utility::flag_clear( "aa_stinger" );
            level thread objective_stinger();
            return;
        }
    }

    maps\_utility::autosave_by_name( "greenhouse" );
    common_scripts\utility::flag_set( "aa_stinger" );
    maps\_utility::battlechatter_off( "axis" );
    maps\_utility::battlechatter_off( "allies" );

    if ( level.gameskill > 1 )
    {
        level.heli_guy_accuracy = 4;
        level.heli_guy_health_multiplier = 1;
        level.heli_guy_respawn_delay = 10;
    }
    else
    {
        level.heli_guy_accuracy = 1.5;
        level.heli_guy_health_multiplier = 0.8;
        level.heli_guy_respawn_delay = 15;
    }

    level.helicopter thread activate_heli_guy();
    level.price thread maps\_anim::anim_single_queue( level.price, "anotherpass" );
    maps\_utility::waittill_aigroupcleared( "greenhouse_group" );
    maps\_utility::activate_trigger_with_targetname( "stinger_color_init" );

    if ( !isdefined( level.helicopter ) || !isalive( level.helicopter ) || isdefined( level.helicopter.crashing ) && level.helicopter.crashing )
    {
        common_scripts\utility::flag_set( "helicopter_down" );
        common_scripts\utility::flag_clear( "aa_stinger" );
        level thread objective_stinger();
        return;
    }

    level.helicopter stop_helicopter_attack();
    wait 1;

    if ( level.gameskill > 1 )
    {
        level.heli_guy_accuracy = 8;
        level.heli_guy_health_multiplier = 2;
        level.heli_guy_respawn_delay = 6;
    }
    else
    {
        level.heli_guy_accuracy = 4;
        level.heli_guy_health_multiplier = 2;
        level.heli_guy_respawn_delay = 6;
    }

    if ( isalive( level.helicopter.heli_guy ) )
        level.helicopter.heli_guy.baseaccuracy = level.heli_guy_accuracy;

    level.helicopter thread heli_path_speed( common_scripts\utility::getstruct( "stinger_path", "targetname" ) );
    level.mark waittill( "goal" );
    maps\_utility::autosave_by_name( "stinger" );
    maps\_utility::arcademode_checkpoint( 3, 5 );
    level.mark maps\_anim::anim_single_queue( level.mark, "missilesinbarn" );

    if ( !isalive( level.helicopter ) || isdefined( level.helicopter.crashing ) && level.helicopter.crashing )
    {
        common_scripts\utility::flag_set( "helicopter_down" );
        common_scripts\utility::flag_clear( "aa_stinger" );
        level thread objective_stinger();
        return;
    }

    level.price thread maps\_anim::anim_single_queue( level.price, "takeoutchopper" );
    maps\_utility::delaythread( 3, maps\_utility::activate_trigger_with_targetname, "heli_fight_color_init" );
    level thread objective_stinger();
    level.helicopter waittill( "death" );
    level.helicopter deactivate_heli_guy();
    helicopter_searchlight_off();
    wait 1;
    level.mark maps\_anim::anim_single_queue( level.mark, "niceshooting" );
    wait 5;
    level.price thread maps\_anim::anim_single_queue( level.price, "everyoneonme" );
    common_scripts\utility::flag_clear( "aa_stinger" );
    common_scripts\utility::flag_set( "helicopter_down" );
}

greenhouse_fake_target()
{
    level.helicopter endon( "death" );
    var_0 = spawn( "script_model", level.helicopter.origin );
    var_0 linkto( level.helicopter, "tag_origin", ( 0.0, 0.0, -80.0 ), ( 0.0, 0.0, 0.0 ) );
    target_set( var_0, ( 0.0, 0.0, -80.0 ) );
    target_setjavelinonly( var_0, 1 );
    level.player waittill( "stinger_fired" );

    if ( isalive( level.heli_guy ) )
        level.heli_guy setthreatbiasgroup( "oblivious" );

    greenhouse_helicopter_reaction_wait( 2 );
    level.helicopter thread evasion_path( "evasion_pattern" );
    wait 0.5;
    level thread hunted_flares_fire_burst( level.helicopter, 8, 6, 5.0 );
    wait 0.5;
    thread stinger_nag();
    var_0 unlink();
    var_1 = get_vehicle_velocity( level.helicopter, ( 0.0, 0.0, 10.0 ) );
    var_0 movegravity( var_1, 8 );
    var_0 thread ent_delete();
    target_set( level.helicopter, ( 0.0, 0.0, -80.0 ) );
    target_setjavelinonly( level.helicopter, 1 );

    if ( isalive( level.heli_guy ) )
        level.heli_guy setthreatbiasgroup( "heli_guy" );

    level.player waittill( "stinger_fired" );
    level.helicopter maps\_vehicle::godoff();

    if ( isalive( level.heli_guy ) )
        level.heli_guy setthreatbiasgroup( "oblivious" );

    greenhouse_helicopter_reaction_wait( 3 );
    level.helicopter thread evasion_path( "evasion_pattern" );
    hunted_flares_fire_burst( level.helicopter, 8, 1, 5.0 );
}

get_vehicle_velocity( var_0, var_1 )
{
    var_2 = var_0.origin + var_1;
    wait 0.05;
    var_3 = var_0.origin - var_2;
    return maps\_utility::vector_multiply( var_3, 20 );
}

ent_delete()
{
    wait 3;
    self delete();
}

stinger_nag()
{
    level.helicopter endon( "death" );
    level.player endon( "stinger_fired" );
    wait 0.5;
    level.mark thread maps\_anim::anim_single_queue( level.mark, "hunted_uk2_poppingflares" );
    wait 2;
    level.mark thread maps\_anim::anim_single_queue( level.mark, "hunted_uk2_fireagain" );
}

greenhouse_helicopter_reaction_wait( var_0 )
{
    var_1 = 1100;
    var_2 = distance( level.player.origin, level.helicopter.origin );
    var_3 = var_2 / var_1 - var_0;

    if ( var_3 > 0 )
        wait(var_3);
}

hunted_flares_fire_burst( var_0, var_1, var_2, var_3 )
{
    for ( var_4 = 0; var_4 < var_1; var_4++ )
    {
        playfx( level.flare_fx[var_0.vehicletype], var_0 gettagorigin( "tag_light_belly" ) );

        if ( var_0 == level.playervehicle )
        {
            level.stats["flares_used"]++;
            level.player playlocalsound( "weap_flares_fire" );
        }

        wait 0.25;
    }
}

evasion_path( var_0 )
{
    self endon( "death" );

    if ( isdefined( self.currentnode.target ) )
        var_1 = common_scripts\utility::getstruct( self.currentnode.target, "targetname" );
    else
        var_1 = self.currentnode;

    var_2 = make_evasion_path( var_0 );
    heli_path_speed( var_2 );

    if ( isdefined( var_1 ) )
        heli_path_speed( var_1 );
}

make_evasion_path( var_0 )
{
    var_1 = common_scripts\utility::getstruct( var_0, "targetname" );
    var_2 = spawnstruct();
    var_3 = var_1.origin;
    var_4 = var_2;
    var_5 = undefined;

    if ( !isdefined( level.evasion_index ) )
        level.evasion_index = 0;

    for (;;)
    {
        var_1 = common_scripts\utility::getstruct( var_1.target, "targetname" );
        var_2.origin = self localtoworldcoords( var_1.origin - var_3 );

        if ( isdefined( var_1.angles ) )
            var_2.angles = self.angles + var_1.angles;

        if ( isdefined( var_5 ) )
            var_2.targetname = var_5;

        var_5 = "evasion_" + level.evasion_index;

        if ( isdefined( var_1.target ) )
        {
            var_2.target = var_5;
            var_2 add_struct_to_level_array();
        }
        else
        {
            var_2 add_struct_to_level_array();
            break;
        }

        var_2 = spawnstruct();
        level.evasion_index++;
    }

    return var_4;
}

add_struct_to_level_array()
{
    level.struct[level.struct.size] = self;

    if ( isdefined( self.targetname ) )
        add_struct( self.targetname, "targetname" );

    if ( isdefined( self.target ) )
        add_struct( self.target, "target" );

    if ( isdefined( self.script_noteworthy ) )
        add_struct( self.script_noteworthy, "script_noteworthy" );
}

add_struct( var_0, var_1 )
{
    if ( !isdefined( level.struct_class_names[var_1][var_0] ) )
        level.struct_class_names[var_1][var_0] = [];

    var_2 = level.struct_class_names[var_1][var_0].size;
    level.struct_class_names[var_1][var_0][var_2] = self;
}

greenhouse_barn_door()
{
    common_scripts\utility::flag_wait( "helicopter_down" );
    maps\_utility::activate_trigger_with_targetname( "greenhouse_exit_stuckup_color_init" );
    common_scripts\utility::flag_wait( "greenhouse_rear_exit" );
    var_0 = getaiarray( "allies" );
    var_1 = undefined;

    foreach ( var_3 in var_0 )
    {
        if ( var_3 != level.price && var_3 != level.mark )
        {
            var_3 maps\_utility::disable_ai_color();

            if ( var_3 != level.steve )
                var_1 = var_3;
        }
    }

    var_5 = getent( "big_barn_door", "targetname" );
    var_6 = getent( "big_barn_animent", "targetname" );
    level.price maps\_utility::disable_ai_color();
    var_6 maps\_anim::anim_reach_solo( level.price, "hunted_open_big_barn_gate" );

    if ( getdvarint( "use_old_door_openings" ) == 1 )
    {
        var_6 maps\_anim::anim_single_solo( level.price, "hunted_open_big_barn_gate_stop" );
        var_6 thread maps\_anim::anim_single_solo( level.price, "hunted_open_big_barn_gate" );
        var_5 maps\_utility::hunted_style_door_open( "door_metal_slow_open" );
    }
    else
    {
        var_5 thread h1_play_door_sound( 0, "door_metal_slow_open" );
        wait 0.25;
        var_6 thread maps\_anim::anim_single_solo( level.price, "hunted_open_big_barn_gate" );
        var_6 maps\_anim::anim_single_solo( var_5, "open" );
        var_5 h1_connectanimateddoorpaths();
    }

    maps\_utility::activate_trigger_with_targetname( "barn_exit_y_color_init" );
    level.price maps\_utility::set_force_color( "o" );
    level.price maps\_utility::enable_cqbwalk();
    wait 0.5;
    maps\_utility::activate_trigger_with_targetname( "barn_exit_r_color_init" );
    var_7 = distancesquared( var_5.origin, var_1.origin );
    var_8 = distancesquared( var_5.origin, level.steve.origin );

    if ( var_7 < var_8 )
    {
        var_1 maps\_utility::enable_ai_color();
        wait 0.9;
        level.steve maps\_utility::enable_ai_color();
    }
    else
    {
        level.steve maps\_utility::enable_ai_color();
        wait 0.9;
        var_1 maps\_utility::enable_ai_color();
    }

    level.price common_scripts\utility::waittill_notify_or_timeout( "goal", 3 );
    level.price maps\_utility::disable_cqbwalk();
    common_scripts\utility::flag_set( "greenhouse_done" );
}

ac130_rumble()
{
    common_scripts\utility::flag_wait( "ac130_barrage" );
    var_0 = [];
    var_0 = maps\_utility::rumble_sequence_add_key( var_0, 1, "generic_attack_heavy_500" );
    var_0 = maps\_utility::rumble_sequence_add_key( var_0, 2, "generic_attack_medium_500" );
    var_0 = maps\_utility::rumble_sequence_add_key( var_0, 2.55, "generic_attack_medium_500" );
    var_0 = maps\_utility::rumble_sequence_add_key( var_0, 3.05, "generic_attack_heavy_750" );
    var_0 = maps\_utility::rumble_sequence_add_key( var_0, 6.5, "generic_attack_heavy_500" );
    var_0 = maps\_utility::rumble_sequence_add_key( var_0, 7.0, "generic_attack_heavy_750" );
    var_0 = maps\_utility::rumble_sequence_add_key( var_0, 10.05, "generic_attack_heavy_500" );
    var_0 = maps\_utility::rumble_sequence_add_key( var_0, 12.0, "generic_attack_medium_500" );
    var_0 = maps\_utility::rumble_sequence_add_key( var_0, 12.8, "generic_attack_heavy_500" );
    var_0 = maps\_utility::rumble_sequence_add_key( var_0, 15.05, "generic_attack_heavy_500" );
    level.player thread maps\_utility::rumble_sequence_play( var_0 );
}

area_ac130_init()
{
    maps\_utility::autosave_by_name( "ac130" );
    maps\_utility::arcademode_checkpoint( 3, 6 );
    common_scripts\utility::flag_set( "aa_ac130" );
    level thread set_playerspeed( 130, 5 );
    level thread ac130_allies();
    level thread ac130_devastation();
    level thread ac130_gas_station();
    level thread ac130_enemy_vehicles();
    level thread ac130_rumble();
    common_scripts\utility::flag_wait( "go_dazed" );
    level thread set_playerspeed( 190, 4 );
    common_scripts\utility::flag_wait_or_timeout( "mission_end_trigger", 30 );
    common_scripts\utility::flag_clear( "aa_ac130" );
    maps\_utility::nextmission();
}

ac130_dazed_guy()
{
    self endon( "death" );
    self setthreatbiasgroup( "oblivious" );
    self.animname = "axis";
    maps\_utility::set_run_anim( "patrolwalk_nolight" );
    self.alwaysrunforward = 1;
    thread ac130_defend_gasstation();
    common_scripts\utility::flag_wait( "ac130_barrage" );
    maps\_utility::clear_run_anim();
    self.alwaysrunforward = undefined;

    if ( isdefined( self.script_noteworthy ) && self.script_noteworthy == "runners" )
    {
        if ( self.export == 210 )
        {
            maps\_utility::set_run_anim( "dazed_0" );
            self.alwaysrunforward = 1;
        }

        common_scripts\utility::flag_wait( "ac130_barrage_over" );
        self waittill( "damage" );
        self setthreatbiasgroup( "axis" );

        if ( self.export == 210 )
        {
            maps\_utility::clear_run_anim();
            self.alwaysrunforward = undefined;
        }
    }
    else
    {
        self.skipdeathanim = 1;
        thread throw_on_death( ( 6432.0, 11312.0, 200.0 ), "MOD_EXPLOSIVE" );
        common_scripts\utility::flag_wait( "go_dazed" );
        self setthreatbiasgroup( "oblivious" );
        var_0 = common_scripts\utility::mod( self.export, 5 );
        maps\_utility::set_run_anim( "dazed_" + var_0 );
        self.alwaysrunforward = 1;
        wait 7;
        maps\_utility::ai_ignore_everything();
        self.health = 1;
        self.skipdeathanim = undefined;
        thread track_player_proximity();
        common_scripts\utility::waittill_either( "damage", "proximity" );
        self.alwaysrunforward = undefined;
        wait 1;
        self setthreatbiasgroup( "axis" );
    }
}

track_player_proximity()
{
    self endon( "death" );
    wait(randomfloat( 0.5 ));

    while ( distance2d( level.player.origin, self.origin ) > 350 )
        wait 0.25;

    self notify( "proximity" );
}

throw_on_death( var_0, var_1 )
{
    self waittill( "death", var_2, var_3, var_4, var_5, var_6, var_7, var_8 );

    if ( !isdefined( self ) || !isdefined( var_3 ) || var_3 != var_1 )
        return;

    var_9 = self.origin;
    var_10 = vectornormalize( var_9 - var_0 );
    self startragdoll();
    wait 0.1;
    physicsexplosionsphere( var_9 + maps\_utility::vector_multiply( var_10, -50 ), 100, 90, 4 );
}

ac130_allies()
{
    setignoremegroup( "axis", "allies" );
    common_scripts\utility::flag_wait_either( "ac130_defend_gasstation", "ac130_barrage" );
    wait 3;
    setthreatbias( "axis", "allies", 0 );
}

ac130_defend_gasstation()
{
    self endon( "death" );
    level endon( "ac130_barrage" );
    common_scripts\utility::flag_wait( "ac130_defend_gasstation" );
    maps\_utility::clear_run_anim();
    self setthreatbiasgroup( "axis" );
    level thread ac130_kill_player();
}

ac130_kill_player()
{
    for (;;)
    {
        if ( !common_scripts\utility::flag( "ac130_barrage" ) )
        {
            if ( distance2d( ( 6264.0, 12264.0, 232.0 ), level.player.origin ) < 1200 )
                break;
        }
        else if ( !common_scripts\utility::flag( "go_dazed" ) )
        {
            if ( distance2d( ( 5928.0, 12952.0, 200.0 ), level.player.origin ) < 1600 )
                break;
        }

        wait 0.05;
    }

    level.player enablehealthshield( 0 );
    var_0 = getdvarfloat( "player_damagemultiplier" );
    var_1 = 25 / var_0;

    for (;;)
    {
        level.player dodamage( var_1, ( 6896.0, 12118.0, 328.0 ) );
        wait 0.05;
    }
}

ac130_devastation()
{
    common_scripts\utility::flag_set( "gasstation_start" );
    maps\_utility::radio_dialogue( "requestfire" );
    common_scripts\utility::flag_wait( "ac130_inplace" );
    soundscripts\_snd::snd_message( "aud_ac130_sequence" );
    maps\_utility::radio_dialogue( "usesomehelp" );
    level thread set_flag_on_player_action( "ac130_defend_gasstation", 1, 1, 0 );

    if ( getdvarint( "use_old_price_talk_control" ) == 1 )
        level.price maps\_anim::anim_single_queue( level.price, "100metres" );
    else
    {
        if ( distance( level.price.origin, level.price.goalpos ) > level.price.goalradius )
        {
            level.price pushplayer( 1 );
            level.price waittill( "goal" );
            level.price pushplayer( 0 );
        }

        var_0 = spawn( "script_origin", ( 7395.0, 10012.0, 211.0 ) );
        var_0.angles = ( 0.0, 180.0, 0.0 );
        var_0 maps\_anim::anim_custom_animmode_solo( level.price, "zonly_physics", "talk_to_control" );
    }

    maps\_utility::radio_dialogue( "comindown" );
    wait 0.5;
    common_scripts\utility::flag_set( "ac130_barrage" );
    level notify( "kill_action_flag" );
    wait 1;
    maps\_utility::activate_trigger_with_targetname( "cover_color_init" );
    wait 4;
    level.mark.alwaysrunforward = 1;
    level.steve.alwaysrunforward = 1;
    level.charlie.alwaysrunforward = 1;
    level.mark.disablearrivals = 1;
    level.steve.disablearrivals = 1;
    level.charlie.disablearrivals = 1;
    level.mark maps\_utility::set_run_anim( "path_slow" );
    level.steve maps\_utility::set_run_anim( "path_slow" );
    level.charlie maps\_utility::set_run_anim( "path_slow" );
    maps\_utility::activate_trigger_with_targetname( "celebrate_color_init" );
    level.mark thread anim_on_goal( "hunted_celebrate", 2.5 );
    level.steve thread anim_on_goal( "hunted_celebrate", 0 );
    level.charlie thread anim_on_goal( "hunted_celebrate", 1 );
    wait 2;
    maps\_utility::activate_trigger_with_targetname( "dazed_color_init" );
    common_scripts\utility::flag_set( "go_dazed" );
    wait 10;
    maps\_utility::radio_dialogue( "getmovin" );
    level.price thread maps\_anim::anim_single_queue( level.price, "comeonletsgo" );
    level thread set_playerspeed( 190, 3 );
    level.mark.alwaysrunforward = undefined;
    level.steve.alwaysrunforward = undefined;
    level.charlie.alwaysrunforward = undefined;
    level.mark maps\_utility::clear_run_anim();
    level.steve maps\_utility::clear_run_anim();
    level.charlie maps\_utility::clear_run_anim();
    maps\_utility::activate_trigger_with_targetname( "mission_end_color_init" );
    common_scripts\utility::flag_set( "ac130_barrage_over" );
}

anim_on_goal( var_0, var_1 )
{
    wait 0.5;
    self waittill( "goal" );
    wait(var_1);
    thread maps\_anim::anim_single_queue( self, var_0 );
}

ac130_enemy_vehicles()
{
    var_0 = getentarray( "dazed_guy", "targetname" );
    common_scripts\utility::array_thread( var_0, maps\_utility::add_spawn_function, ::ac130_dazed_guy );
    maps\_utility::activate_trigger_with_targetname( "gas_station_color_init" );
    common_scripts\utility::flag_wait( "gasstation_start" );
    var_1 = maps\_vehicle::spawn_vehicles_from_targetname_and_drive( "gasstation_truck" );
    gassstation_truck_add_dynamic_light( var_1 );
    var_2 = undefined;

    for ( var_3 = 0; var_3 < var_1.size; var_3++ )
    {
        if ( var_1[var_3].model == "vehicle_t72_tank" )
            var_2 = var_1[var_3];
    }

    common_scripts\utility::flag_wait( "ac130_defend_gasstation" );

    if ( common_scripts\utility::flag( "ac130_barrage" ) )
        return;

    maps\_utility::battlechatter_on( "axis" );
    maps\_utility::battlechatter_on( "allies" );
    maps\_utility::activate_trigger_with_targetname( "gas_station_defend_color_init" );
    var_2 maps\_vehicle::mgon();
    var_2 setturrettargetent( level.player );
}

ac130_vehicle_die()
{
    self endon( "death" );
    common_scripts\utility::flag_wait( "ac130_barrage" );

    switch ( self.script_noteworthy )
    {
        case "1":
            wait 1;
            break;
        case "2":
            wait 2.5;
            break;
        case "3":
            wait 9;
            break;
        default:
    }

    self notify( "death" );
}

gassstation_truck_add_dynamic_light( var_0 )
{
    foreach ( var_2 in var_0 )
    {
        if ( isdefined( var_2.script_vehicle_lights_on ) && var_2.script_vehicle_lights_on == "headlights" )
        {
            if ( var_2.classname == "script_vehicle_pickup_4door" )
                maps\_vehicle::build_light( var_2.classname, "headlight_truck_dynamic", "tag_headlight_left", "vfx/lights/hunted/hunted_headlight_omni_offset", "headlights" );
            else if ( var_2.classname == "script_vehicle_bm21_mobile_cover" )
            {
                if ( var_2.script_noteworthy == "3" )
                    maps\_vehicle::build_light( var_2.classname, "headlight_truck_dynamic", "tag_headlight_left", "vfx/lights/hunted/hunted_headlight_spotlight_offset", "headlights" );

                var_2.maxlightstopsperframe = 1;
            }

            var_2 turn_headlights_on( 1 );
        }
    }
}

ac130_gas_station()
{
    common_scripts\utility::flag_wait( "ac130_barrage" );
    var_0 = getentarray( "gas_station", "targetname" );
    var_1 = getentarray( "gas_station_d", "targetname" );
    common_scripts\_exploder::exploder( 66 );
    wait 1.0;
    common_scripts\utility::array_thread( var_0, ::hide_ent );
    common_scripts\utility::array_thread( var_1, ::swap_ent, ( 7680.0, 0.0, 0.0 ) );
}

hide_ent( var_0 )
{
    if ( isdefined( self.script_delay ) && !isdefined( var_0 ) )
        wait(self.script_delay + 0.1);

    self hide();
}

swap_ent( var_0 )
{
    if ( isdefined( self.script_delay ) )
        wait(self.script_delay);

    self.origin += var_0;
    wait 0.1;
    self show();
}

setup_gas_station()
{
    var_0 = getentarray( "gas_station_d", "targetname" );
    common_scripts\utility::array_thread( var_0, ::hide_ent, 1 );
}

setup_friendlies()
{
    level.squad = [];
    level.price = scripted_spawn( "price", "script_noteworthy", 1 );
    level.price.animname = "price";
    level.price.name = "Captain Price";
    level.price thread squad_init();
    level.mark = scripted_spawn( "mark", "script_noteworthy", 1 );
    level.mark.animname = "mark";
    level.mark.name = "Gaz";
    level.mark thread squad_init();
    level.steve = scripted_spawn( "steve", "script_noteworthy", 1 );
    level.steve.animname = "steve";
    level.steve.name = "Nikolai";
    level.steve thread squad_init();
    level.steve.has_ir = undefined;
    level.charlie = scripted_spawn( "charlie", "script_noteworthy", 1 );
    level.charlie.animname = "charlie";
    level.charlie thread squad_init();
}

squad_init()
{
    thread maps\_utility::magic_bullet_shield();
    level.squad[level.squad.size] = self;
    self waittill( "death" );
    level.squad = common_scripts\utility::array_remove( level.squad, self );
}

setup_enemies()
{
    var_0 = getspawnerteamarray( "axis" );

    for ( var_1 = 0; var_1 < var_0.size; var_1++ )
    {
        if ( var_0[var_1].classname == "actor_enemy_dog" )
        {
            var_0[var_1] maps\_utility::add_spawn_function( ::dog_settings );
            continue;
        }

        var_0[var_1] maps\_utility::add_spawn_function( ::axis_settings );
    }
}

axis_settings()
{
    self setengagementmindist( 300, 200 );
    self setengagementmaxdist( 512, 720 );
}

dog_settings()
{
    self setthreatbiasgroup( "dogs" );
    self.battlechatter = 0;
}

start_default()
{
    area_flight_init();
}

start_flight_cleanup()
{
    var_0 = getent( "crash_mask", "targetname" );
    var_0 delete();
    var_1 = getent( "missile_source", "targetname" );
    var_1 delete();
}

start_crash()
{
    soundscripts\_snd::snd_message( "aud_start_crash_checkpoint" );
    start_flight_cleanup();
    thread hud_hide( 1 );
    level.player disableweapons();
    area_crash_init();
}

start_dirt_path()
{
    soundscripts\_snd::snd_message( "aud_start_path_checkpoint" );
    setup_friendlies();
    start_teleport_squad( "path" );
    start_flight_cleanup();
    level.player set_playerspeed( 130 );
    area_dirt_path_init();
}

start_barn()
{
    soundscripts\_snd::snd_message( "aud_start_barn_checkpoint" );
    setup_friendlies();
    start_teleport_squad( "barn" );
    thread door_anim_first_frame_solo();
    start_flight_cleanup();
    level thread set_flag_on_player_action( "player_interruption", 1, 1, 1 );
    level thread objective_lz();
    common_scripts\utility::flag_set( "trucks_warning" );
    level thread dirt_path_barn_truck();
    getent( "calc_speed_trigger", "script_noteworthy" ) delete();
    common_scripts\utility::flag_wait( "barn_moveup" );
    area_barn_init();
}

start_field()
{
    soundscripts\_snd::snd_message( "aud_start_field_checkpoint" );
    setup_friendlies();
    start_teleport_squad( "field" );
    start_flight_cleanup();
    level thread objective_lz();
    area_field_init();
}

start_basement()
{
    soundscripts\_snd::snd_message( "aud_start_basement_checkpoint" );
    setup_friendlies();
    start_teleport_squad( "basement" );
    start_flight_cleanup();
    level thread objective_lz();

    for ( var_0 = 0; var_0 < level.squad.size; var_0++ )
        level.squad[var_0] maps\_utility::set_force_color( "r" );

    common_scripts\utility::flag_set( "basement_enter" );
    common_scripts\utility::flag_set( "basement_door_open" );
    common_scripts\utility::flag_set( "squad_in_basement" );
    var_1 = maps\_vehicle::spawn_vehicle_from_targetname( "field_heli" );
    level.helicopter = var_1;
    level.helicopter maps\_vehicle::godon();
    var_1 helicopter_searchlight_on();
    area_basement_init();
}

start_farm()
{
    soundscripts\_snd::snd_message( "aud_start_farm_checkpoint" );
    setup_friendlies();
    start_teleport_squad( "farm" );
    start_flight_cleanup();
    level thread objective_lz();
    area_farm_init();
}

start_creek()
{
    soundscripts\_snd::snd_message( "aud_start_creek_checkpoint" );
    setup_friendlies();
    start_teleport_squad( "creek" );
    start_flight_cleanup();
    level.price maps\_utility::set_force_color( "y" );
    level.mark maps\_utility::set_force_color( "y" );
    level.steve maps\_utility::set_force_color( "r" );
    level.charlie maps\_utility::set_force_color( "r" );
    var_0 = getentarray( "farm_color_trigger", "script_noteworthy" );
    common_scripts\utility::array_thread( var_0, common_scripts\utility::trigger_off );
    maps\_utility::activate_trigger_with_targetname( "farm_cleared_color_init" );
    common_scripts\utility::flag_set( "farm_clear" );
    common_scripts\utility::flag_set( "creek_helicopter" );
    level thread objective_lz();
    area_creek_init();
}

start_greenhouse()
{
    soundscripts\_snd::snd_message( "aud_start_greenhouse_checkpoint" );
    setup_friendlies();
    start_teleport_squad( "greenhouse" );
    start_flight_cleanup();
    level.price maps\_utility::set_force_color( "y" );
    level.mark maps\_utility::set_force_color( "y" );
    level.steve maps\_utility::set_force_color( "r" );
    level.charlie maps\_utility::set_force_color( "r" );
    level.price maps\_utility::enable_cqbwalk();
    level.mark maps\_utility::enable_cqbwalk();
    level.steve maps\_utility::enable_cqbwalk();
    level.charlie maps\_utility::enable_cqbwalk();
    common_scripts\utility::flag_set( "player_interruption" );
    thread start_greenhouse_helicopter();
    common_scripts\utility::flag_set( "road_helicopter_cleared" );
    level thread objective_lz();
    wait 1;
    area_greenhouse_init();
}

start_greenhouse_helicopter()
{
    var_0 = maps\_vehicle::spawn_vehicle_from_targetname( "creek_heli" );
    var_0 sethoverparams( 128, 35, 25 );
    wait 0.1;

    for ( var_1 = 0; var_1 < var_0.riders.size; var_1++ )
        var_0.riders[var_1] setthreatbiasgroup( "oblivious" );

    var_0 helicopter_searchlight_on();
    level.helicopter = var_0;
    level.helicopter maps\_vehicle::godon();
    setthreatbias( "player", "heli_guy", 10000 );
    setthreatbias( "heli_guy", "player", 20000 );
    level.heli_guy_accuracy = 1;
    level.heli_guy_health_multiplier = 2;
    level.heli_guy_respawn_delay = 20;
    level.helicopter heli_path_speed( common_scripts\utility::getstruct( "greenhouse_startpath", "targetname" ) );
}

start_ac130()
{
    soundscripts\_snd::snd_message( "aud_start_ac130_checkpoint" );
    setup_friendlies();
    start_teleport_squad( "ac130" );
    start_flight_cleanup();
    level.price maps\_utility::set_force_color( "o" );
    level.mark maps\_utility::set_force_color( "y" );
    level.steve maps\_utility::set_force_color( "r" );
    level.charlie maps\_utility::set_force_color( "r" );
    level thread objective_lz();
    maps\_utility::activate_trigger_with_targetname( "barn_exit_y_color_init" );
    maps\_utility::activate_trigger_with_targetname( "barn_exit_r_color_init" );
    area_ac130_init();
}

start_teleport_squad( var_0 )
{
    var_1 = getnode( "startnodeplayer_" + var_0, "targetname" );
    level.player setorigin( var_1.origin );
    level.player setplayerangles( var_1.angles );

    for ( var_2 = 0; var_2 < level.squad.size; var_2++ )
    {
        level.squad[var_2] notify( "stop_going_to_node" );
        var_3 = "startnode" + level.squad[var_2].animname + "_" + var_0;
        var_1 = getnode( var_3, "targetname" );
        level.squad[var_2] start_teleport( var_1 );
    }
}

start_teleport( var_0 )
{
    if ( !isdefined( var_0 ) )
        return;

    self teleport( var_0.origin, var_0.angles );
    self setgoalpos( self.origin );
    self.goalradius = 0;

    if ( isdefined( var_0.radius ) )
        self.goalradius = var_0.radius;

    self setgoalnode( var_0 );
}

scripted_sightconetrace( var_0, var_1 )
{
    var_2 = level.player geteye();
    var_3[0] = var_2 + ( 14.0, 14.0, 0.0 );
    var_3[2] = var_2 + ( -14.0, 14.0, -10.0 );
    var_3[1] = var_2 + ( -14.0, -14.0, -20.0 );
    var_3[3] = var_2 + ( 14.0, -14.0, -30.0 );
    var_4 = 0;

    for ( var_5 = 0; var_5 < var_3.size; var_5++ )
    {
        if ( bullettracepassed( var_0, var_3[var_5], 0, var_1 ) )
            var_4 += 0.25;
    }

    return var_4;
}

attach_flashlight( var_0 )
{
    self attach( "com_flashlight_on", "tag_inhand", 1 );
    self.have_flashlight = 1;
    flashlight_light( var_0 );
    thread detach_flashlight_on_death();
}

detach_flashlight_on_death()
{
    self waittill( "death" );

    if ( isdefined( self ) )
        detach_flashlight();
}

detach_flashlight()
{
    if ( !isdefined( self.have_flashlight ) )
        return;

    self detach( "com_flashlight_on", "tag_inhand" );
    flashlight_light( 0 );
    self.have_flashlight = undefined;
}

flashlight_light( var_0 )
{
    var_1 = "tag_light";

    if ( var_0 )
    {
        var_2 = spawn( "script_model", ( 0.0, 0.0, 0.0 ) );
        var_2 setmodel( "tag_origin" );
        var_2 hide();
        var_2 linkto( self, var_1, ( 0.0, 0.0, 0.0 ), ( 0.0, 0.0, 0.0 ) );
        thread flashlight_light_death( var_2 );
        playfxontag( level._effect["flashlight"], var_2, "tag_origin" );
    }
    else if ( isdefined( self.have_flashlight ) )
        self notify( "flashlight_off" );
}

flashlight_light_death( var_0 )
{
    common_scripts\utility::waittill_either( "death", "flashlight_off" );
    var_0 delete();
    self.have_flashlight = undefined;
}

hud_hide( var_0 )
{
    wait 1;

    if ( var_0 )
    {
        setsaveddvar( "compass", "0" );
        setsaveddvar( "ammoCounterHide", "1" );
        setsaveddvar( "hud_showstance", "0" );
        level.nocompass = 1;
    }
    else
    {
        setsaveddvar( "compass", "1" );
        setsaveddvar( "ammoCounterHide", "0" );
        setsaveddvar( "hud_showstance", "1" );
        level.nocompass = undefined;
    }
}

grenade_notifies()
{
    for (;;)
    {
        level.player waittill( "grenade_fire", var_0, var_1 );
        var_0 thread notify_on_detonation( var_1 );
    }
}

notify_on_detonation( var_0 )
{
    while ( isdefined( self ) )
        wait 0.1;

    level.player notify( var_0 );
}

set_flag_on_player_action( var_0, var_1, var_2, var_3 )
{
    level notify( "kill_action_flag" );
    level endon( "kill_action_flag" );
    level endon( var_0 );

    if ( common_scripts\utility::flag( var_0 ) )
        return;

    for (;;)
    {
        var_4 = level.player common_scripts\utility::waittill_any_return( "weapon_fired", "fraggrenade", "flash_grenade", "h1_cheatlemonade" );

        if ( !isdefined( var_4 ) )
            break;

        if ( var_4 == "weapon_fired" )
            break;

        if ( var_4 == "fraggrenade" && isdefined( var_2 ) )
            break;

        if ( var_4 == "flash_grenade" && isdefined( var_1 ) )
            break;

        if ( var_4 == "h1_cheatlemonade" && isdefined( var_2 ) )
            break;
    }

    if ( var_3 )
        waitframe();

    common_scripts\utility::flag_set( var_0 );
}

set_fixednode( var_0 )
{
    self.fixednode = var_0;
}

make_walk()
{
    var_0 = self.walkdist;
    self.walkdist = 1000;
    level waittill( "stop_walk" );
    self.walkdist = var_0;
}

flash_immunity( var_0 )
{
    self endon( "death" );
    maps\_utility::setflashbangimmunity( 1 );
    wait(var_0);
    maps\_utility::setflashbangimmunity( 0 );
}

make_ai_move()
{
    self pushplayer( 1 );
    maps\_utility::set_ignoresuppression( 1 );
    self.a.disablepain = 1;
    self setthreatbiasgroup( "oblivious" );
}

make_ai_normal()
{
    self pushplayer( 0 );
    maps\_utility::set_ignoresuppression( 0 );
    self.a.disablepain = 0;
    self setthreatbiasgroup( "allies" );
}

delete_on_goal()
{
    self endon( "death" );
    self waittill( "goal" );

    while ( self cansee( level.player ) )
        wait 1;

    if ( isdefined( self ) && isdefined( level.farmer ) && self == level.farmer && common_scripts\utility::flag( "save_farmer" ) )
        maps\_utility::giveachievement_wrapper( "MAN_OF_THE_PEOPLE" );

    self delete();
}

magic_kill()
{
    if ( common_scripts\utility::flag( "heli_field_stragler_attack" ) )
        return;

    common_scripts\utility::flag_set( "heli_field_stragler_attack" );
    var_0 = common_scripts\utility::getstruct( "heli_stragler_attack_path", "targetname" );
    level.helicopter thread heli_path_speed( var_0 );
    level.heli_guy_accuracy = 2;
    level.heli_guy_health_multiplier = 2;
    level.heli_guy_respawn_delay = 5;
    level.helicopter thread activate_heli_guy();
}

setthreatbiasgroup_on_array( var_0, var_1, var_2 )
{
    if ( isdefined( var_2 ) )
        var_1 = maps\_utility::array_exclude( var_1, var_2 );

    for ( var_3 = 0; var_3 < var_1.size; var_3++ )
        var_1[var_3] setthreatbiasgroup( var_0 );
}

setup_heli_guy()
{
    var_0 = getent( "heli_guy", "targetname" );
    var_0 maps\_utility::add_spawn_function( ::heli_guy );
    var_1 = common_scripts\utility::getstructarray( "activate_heli_guy", "script_noteworthy" );
    common_scripts\utility::array_thread( var_1, ::activate_heli_guy_trigger );
    var_2 = common_scripts\utility::getstructarray( "deactivate_heli_guy", "script_noteworthy" );
    common_scripts\utility::array_thread( var_2, ::deactivate_heli_guy_trigger );
}

activate_heli_guy_trigger()
{
    for (;;)
    {
        self waittill( "trigger", var_0 );
        var_0 activate_heli_guy();
    }
}

activate_heli_guy()
{
    self endon( "death" );
    self endon( "deactivate_heli_guy" );

    if ( !isdefined( level.heli_guy_respawn_delay ) )
        level.heli_guy_respawn_delay = 6;

    for (;;)
    {
        var_0 = scripted_spawn( "heli_guy", "targetname" );
        var_0 waittill( "death" );
        wait(randomfloat( 3 ) + level.heli_guy_respawn_delay);
    }
}

deactivate_heli_guy_trigger()
{
    for (;;)
    {
        self waittill( "trigger", var_0 );
        var_0 deactivate_heli_guy();
    }
}

deactivate_heli_guy()
{
    self notify( "deactivate_heli_guy" );
    helicopter_close_door();
    wait 1;

    if ( isalive( self.heli_guy ) )
        self.heli_guy delete();

    self.heli_guy = undefined;
}

#using_animtree("generic_human");

heli_guy()
{
    if ( !isdefined( level.helicopter ) )
        return;

    if ( !isdefined( level.heli_guy_accuracy ) )
        level.heli_guy_accuracy = 1;

    if ( !isdefined( level.heli_guy_health_multiplier ) )
        level.heli_guy_health_multiplier = 1.5;

    self.a.disablelongdeath = 1;
    self.ignoreweaponintracksuitmode = 1;
    self linkto( level.helicopter, "tag_origin", ( 120.0, 30.0, -140.0 ), ( 0.0, 90.0, 0.0 ) );
    self allowedstances( "crouch" );
    self.health = int( self.health * level.heli_guy_health_multiplier );
    self.baseaccuracy = level.heli_guy_accuracy;
    self setthreatbiasgroup( "heli_guy" );
    level.helicopter notify( "dont_clear_anim" );
    level.helicopter helicopter_open_door();
    level.helicopter.heli_guy = self;
    level.helicopter notify( "heli_guy_spawned" );
    death_monitor();

    if ( isdefined( self ) )
    {
        if ( getdvarint( "ragdoll_enable" ) )
        {
            self.a.nodeath = 1;
            var_0 = spawn( "script_origin", self.origin );
            var_0.angles = level.helicopter.angles + ( 0.0, 90.0, 0.0 );
            level.scr_anim["generic"]["heli_fall"] = %helicopter_death_fall;
            thread common_scripts\utility::play_sound_in_space( "generic_death_falling", level.helicopter.origin );
            var_0 maps\_anim::anim_generic( self, "heli_fall" );
            var_0 delete();

            if ( isalive( self ) )
                maps\_utility::die();
        }
        else
        {
            maps\_utility::die();
            thread common_scripts\utility::play_sound_in_space( "generic_death_falling", level.helicopter.origin );
            self waittillmatch( "deathanim", "end" );
            self delete();
        }
    }

    if ( isdefined( level.helicopter ) )
        level.helicopter.heli_guy_died = 1;
}

death_monitor()
{
    var_0 = 1000000;
    self.health += var_0;
    self endon( "death" );

    for (;;)
    {
        self waittill( "damage", var_1, var_2, var_3, var_4, var_5, var_6 );

        if ( self.health < var_0 )
            break;
    }
}

delete_dude()
{
    wait 10;
    self delete();
}

#using_animtree("vehicles");

helicopter_open_door()
{
    wait 0.5;
    self useanimtree( #animtree );
    self setanim( %mi17_heli_idle, 1, 1 );
}

helicopter_close_door()
{
    if ( isdefined( self ) )
        self clearanim( %mi17_heli_idle, 1 );
}

expand_goalradius_ongoal()
{
    self endon( "death" );
    self waittill( "goal" );
    self.goalradius = 1000;
}

setthreatbiasgroup_on_notify( var_0, var_1 )
{
    self endon( "death" );
    self waittill( var_0 );
    self setthreatbiasgroup( var_1 );
}

set_goalnode( var_0 )
{
    self setgoalnode( var_0 );

    if ( isdefined( var_0.radius ) )
        self.goalradius = var_0.radius;
}

set_goalvolume( var_0 )
{
    var_1 = getent( var_0, "targetname" );

    if ( isdefined( var_1.target ) )
    {
        var_2 = getnode( var_1.target, "targetname" );
        set_goalnode( var_2 );
    }

    self setgoalvolume( var_1 );
}

trigger_timeout( var_0 )
{
    self endon( "trigger" );
    wait(var_0);
    self notify( "trigger" );
}

setup_setgoalvolume_trigger()
{
    common_scripts\utility::array_thread( getentarray( "setgoalvolume", "targetname" ), ::setgoalvolume_trigger );
}

setgoalvolume_trigger()
{
    var_0 = getent( self.target, "targetname" );
    var_1 = getnode( var_0.target, "targetname" );
    self waittill( "trigger" );
    var_2 = getaiarray( "axis" );

    for ( var_3 = 0; var_3 < var_2.size; var_3++ )
    {
        var_2[var_3] set_goalnode( var_1 );
        var_2[var_3] setgoalvolume( var_0 );
    }
}

helicopter_attack( var_0, var_1 )
{
    self endon( "death" );
    self endon( "stop_helicopter_attack" );
    var_2 = setup_helicopter_attack_points( var_1 );
    var_3 = 10000;
    self sethoverparams( 200, 30, 30 );

    if ( !isdefined( self.look_at_ent ) )
        self.look_at_ent = spawn( "script_model", ( 0.0, 0.0, 0.0 ) );

    var_4 = anglestoforward( self.angles );
    self.look_at_ent.origin = self.origin + maps\_utility::vector_multiply( var_4, 3000 );
    var_5 = undefined;

    for (;;)
    {
        wait 0.05;

        if ( isdefined( self.heli_guy_died ) )
        {
            var_3 += 8;
            self.heli_guy_died = undefined;
        }
        else if ( distance2d( self.origin, level.player.origin ) < 900 )
            var_3 += 0.2;
        else if ( isalive( self.heli_guy ) && !sighttracepassed( self.heli_guy geteye(), level.player geteye(), 0, self.heli_guy ) )
            var_3 += 0.2;
        else
            var_3 += 0.05;

        if ( var_3 < var_0 && !isdefined( var_2.new_selection ) )
            continue;

        if ( isdefined( var_2.new_selection ) )
            thread spot_target_path_end();

        var_5 = helicopter_attack_pick_points( var_2, var_5 );
        var_2.new_selection = undefined;
        var_4 = anglestoforward( var_5.angles );
        var_6 = var_5.origin + maps\_utility::vector_multiply( var_4, 3000 );
        var_7 = distance2d( var_5.origin, self.origin ) / 350;
        self.look_at_ent moveto( var_6, var_7, var_7 / 2, var_7 / 2 );
        self setlookatent( self.look_at_ent );
        heli_path_speed( var_5 );
        self clearlookatent();
        var_3 = 0;
        self.heli_guy_died = undefined;
    }
}

stop_helicopter_attack()
{
    self clearlookatent();
    self notify( "stop_helicopter_attack" );
}

helicopter_attack_pick_points( var_0, var_1 )
{
    var_2 = common_scripts\utility::array_randomize( var_0.attack_points );

    if ( isdefined( var_1 ) )
        var_2 = common_scripts\utility::array_remove( var_2, var_1 );

    for ( var_3 = 0; var_3 < var_2.size; var_3++ )
    {
        if ( distance2d( var_2[var_3].origin, level.player.origin ) < 900 )
            continue;

        if ( sighttracepassed( var_2[var_3].origin, level.player geteye(), 0, undefined ) )
            return var_2[var_3];
    }

    return var_2[0];
}

setup_helicopter_attack_points( var_0 )
{
    var_1 = spawnstruct();
    var_2 = getentarray( var_0, "targetname" );
    common_scripts\utility::array_thread( var_2, ::helicopter_attack_points, var_1 );
    var_1 waittill( "new_trigger" );
    return var_1;
}

helicopter_attack_points( var_0 )
{
    self endon( "stop_helicopter_attack" );

    for (;;)
    {
        self waittill( "trigger" );

        if ( isdefined( var_0.current_trigger ) && level.player istouching( var_0.current_trigger ) )
            continue;

        var_0 notify( "new_trigger" );
        var_0.current_trigger = self;
        var_0.new_selection = 1;
        var_0.attack_points = common_scripts\utility::getstructarray( self.target, "targetname" );
        var_0 waittill( "new_trigger" );
    }
}

follow_path_hunted( var_0, var_1 )
{
    self endon( "death" );
    self endon( "stop_path" );
    self.path_halt = 0;

    for ( var_2 = var_0; isdefined( var_2 ); var_2 = var_2[randomint( var_2.size )] )
    {
        if ( var_2.radius != 0 )
            self.goalradius = var_2.radius;

        if ( isdefined( var_2.height ) && var_2.height != 0 )
            self.goalheight = var_2.height;

        self setgoalnode( var_2 );

        if ( isdefined( var_1 ) && !var_1 )
            self.disablearrivals = 1;
        else if ( var_2 node_have_delay() )
            self.disablearrivals = 0;
        else
            disablearrivals_delayed();

        self waittill( "goal" );
        var_2 notify( "trigger", self );

        if ( !isdefined( var_2.target ) )
            break;

        var_2 maps\_utility::script_delay();

        if ( isdefined( var_2.script_flag_wait ) )
            common_scripts\utility::flag_wait( var_2.script_flag_wait );

        if ( self.path_halt )
            self waittill( "path_resume" );

        var_2 = getnodearray( var_2.target, "targetname" );
    }

    self notify( "path_end_reached" );
    self.path_halt = undefined;
}

node_have_delay()
{
    if ( !isdefined( self.target ) )
        return 1;

    if ( isdefined( self.script_noteworthy ) && self.script_noteworthy == "spot_target" )
    {
        var_0 = common_scripts\utility::getstructarray( self.target, "targetname" );

        if ( !isdefined( var_0 ) )
            return 1;
    }

    if ( isdefined( self.script_delay ) && self.script_delay > 0 )
        return 1;

    if ( isdefined( self.script_delay_max ) && self.script_delay_max > 0 )
        return 1;

    if ( isdefined( self.script_flag_wait ) && !common_scripts\utility::flag( self.script_flag_wait ) )
        return 1;

    return 0;
}

disablearrivals_delayed()
{
    self endon( "death" );
    self endon( "stop_path" );
    self endon( "goal" );
    wait 0.5;
    self.disablearrivals = 1;
}

scripted_spawn( var_0, var_1, var_2, var_3 )
{
    if ( !isdefined( var_3 ) )
        var_3 = getent( var_0, var_1 );

    if ( isdefined( var_2 ) )
        var_4 = var_3 stalingradspawn();
    else
        var_4 = var_3 dospawn();

    maps\_utility::spawn_failed( var_4 );
    return var_4;
}

scripted_array_spawn( var_0, var_1, var_2 )
{
    var_3 = getentarray( var_0, var_1 );
    var_4 = [];

    for ( var_5 = 0; var_5 < var_3.size; var_5++ )
        var_4[var_5] = scripted_spawn( var_0, var_1, var_2, var_3[var_5] );

    return var_4;
}

waittill_vehicle_group_spawn( var_0 )
{
    level waittill( "vehiclegroup spawned" + var_0, var_1 );
    return var_1;
}

spawn_ent_on_tag( var_0 )
{
    var_1 = spawn( "script_model", self gettagorigin( var_0 ) );
    var_1.angles = self.angles;
    var_1 setmodel( "tag_origin" );
    var_1 linkto( self, var_0 );
    return var_1;
}

heli_path_speed( var_0 )
{
    if ( isdefined( var_0 ) && isdefined( var_0.speed ) )
    {
        var_1 = 25;
        var_2 = undefined;

        if ( isdefined( var_0.script_decel ) )
            var_2 = var_0.script_decel;

        var_3 = var_0.speed;

        if ( isdefined( var_0.script_accel ) )
            var_1 = var_0.script_accel;
        else
        {
            var_4 = var_3 / 4;

            if ( var_1 > var_4 )
                var_1 = var_4;
        }

        if ( isdefined( var_2 ) )
            self vehicle_setspeed( var_3, var_1, var_2 );
        else
            self vehicle_setspeed( var_3, var_1 );
    }

    maps\_vehicle::vehicle_paths( var_0 );
}

helicopter_searchlight_on()
{
    while ( distance( level.player.origin, self.origin ) > 7000 )
        wait 0.2;

    helicopter_searchlight_off();
    self startignoringspotlight();
    spawn_searchlight_target();
    helicopter_setturrettargetent( self.spotlight_default_target );
    self.dlight = spawn( "script_model", self gettagorigin( "tag_barrel" ) );
    self.dlight setmodel( "tag_origin" );
    thread helicopter_searchlight_effect();
    level.fx_ent = spawn( "script_model", self gettagorigin( "tag_barrel" ) );
    level.fx_ent setmodel( "tag_origin" );
    level.fx_ent linkto( self, "tag_barrel", ( 0.0, 0.0, 0.0 ), ( 0.0, 0.0, 0.0 ) );
    wait 0.5;

    if ( isdefined( level.fx_ent ) )
        playfxontag( level._effect["spotlight"], level.fx_ent, "tag_origin" );
}

turn_headlights_on( var_0 )
{
    if ( isdefined( var_0 ) && var_0 == 1 )
        helicopter_searchlight_off();

    maps\_utility::delaythread( 0.5, maps\_vehicle::vehicle_lights_on, "headlights" );
}

helicopter_searchlight_off()
{
    if ( isdefined( level.fx_ent ) )
    {
        stopfxontag( level._effect["spotlight"], level.fx_ent, "tag_origin" );
        level.fx_ent delete();
    }
}

helicopter_searchlight_effect()
{
    self endon( "death" );
    self.dlight.spot_radius = 256;
    thread spotlight_interruption();
    var_0 = 0;

    for (;;)
    {
        var_1 = helicopter_getturrettargetent();

        if ( isdefined( var_1.spot_radius ) )
            self.dlight.spot_radius = var_1.spot_radius;
        else
            self.dlight.spot_radius = 256;

        var_2 = anglestoforward( self gettagangles( "tag_barrel" ) );
        var_3 = self gettagorigin( "tag_barrel" );
        var_4 = self gettagorigin( "tag_barrel" ) + maps\_utility::vector_multiply( var_2, 3000 );
        var_5 = bullettrace( var_3, var_4, 0, self );
        var_6 = var_5["position"];
        var_6 += maps\_utility::vector_multiply( var_2, -96 );
        self.dlight moveto( var_6, 0.5 );
        wait 0.5;
    }
}

spotlight_interruption()
{
    self endon( "death" );
    level endon( "player_interruption" );

    while ( distance( level.player.origin, self.dlight.origin ) > self.dlight.spot_radius )
        wait 0.25;

    common_scripts\utility::flag_set( "player_interruption" );
}

spawn_searchlight_target()
{
    var_0 = self gettagorigin( "tag_ground" );
    var_1 = spawn( "script_origin", var_0 );
    var_1 linkto( self, "tag_ground", ( 320.0, 0.0, -256.0 ), ( 0.0, 0.0, 0.0 ) );
    self.spotlight_default_target = var_1;
    thread searchlight_target_death();
}

searchlight_target_death()
{
    var_0 = self.spotlight_default_target;
    self waittill( "death" );
    var_0 delete();
}

noprone()
{
    for (;;)
    {
        self waittill( "trigger" );
        level.player allowprone( 0 );

        while ( level.player istouching( self ) )
            wait 0.05;

        level.player allowprone( 1 );
    }
}

doorpart()
{
    var_0 = getent( self.target, "targetname" );
    self linkto( var_0, "door_open_jnt" );

    if ( self.classname == "script_brushmodel" )
    {
        level.animated_door_clip_brushes[level.animated_door_clip_brushes.size] = [];
        level.animated_door_clip_brushes[level.animated_door_clip_brushes.size - 1]["clip"] = self;
        level.animated_door_clip_brushes[level.animated_door_clip_brushes.size - 1]["door"] = var_0;
    }
}

set_grenadeawareness( var_0 )
{
    if ( !isdefined( self.old_grenadeawareness ) )
        self.old_grenadeawareness = self.grenadeawareness;

    if ( isdefined( var_0 ) )
        self.grenadeawareness = var_0;

    if ( isdefined( var_0 ) )
        self.grenadeawareness = self.old_grenadeawareness;
}

set_playerspeed( var_0, var_1 )
{
    var_2 = 190;

    if ( !isdefined( level.player.movespeedscale ) )
        level.player.movespeedscale = 1;

    if ( !isdefined( var_1 ) )
        var_1 = 0;

    var_3 = abs( int( var_1 * 4 ) );
    var_4 = var_0 / var_2;
    var_5 = level.player.movespeedscale - var_4;

    for ( var_6 = 0; var_6 < var_3; var_6++ )
    {
        level.player.movespeedscale -= var_5 / var_3;
        level.player setmovespeedscale( level.player.movespeedscale );
        wait 0.5;
    }

    level.player.movespeedscale = var_4;
    level.player setmovespeedscale( level.player.movespeedscale );
}

spawn_dead_body()
{
    if ( !isdefined( level.dead_body_count ) )
        level.dead_body_count = 0;

    var_0 = undefined;

    if ( isdefined( self.script_index ) )
        var_0 = self.script_index;
    else
    {
        level.dead_body_count++;

        if ( level.dead_body_count > 3 )
            level.dead_body_count = 1;

        var_0 = level.dead_body_count;
    }

    var_1 = spawn( "script_model", ( 0.0, 0.0, 0.0 ) );
    var_1.origin = self.origin;
    var_1.angles = self.angles;
    var_1.animname = "dead_guy";
    var_1 maps\_utility::assign_animtree();
    var_1 disablerootmotion();
    var_1 character\character_sp_pilot_zack_woodland::main();

    if ( !isdefined( self.script_trace ) )
    {
        var_2 = bullettrace( var_1.origin + ( 0.0, 0.0, 5.0 ), var_1.origin + ( 0.0, 0.0, -64.0 ), 0, undefined );
        var_1.origin = var_2["position"];
    }

    var_1 setflaggedanim( "flag", var_1 maps\_utility::getanim( self.script_noteworthy ), 1, 0, 1 );
    var_1 waittillmatch( "flag", "end" );

    if ( !isdefined( self.script_start ) )
        var_1 startragdoll();

    common_scripts\utility::flag_wait( "tunnel_rush" );
    var_1 delete();
}

music()
{
    maps\_utility::musicplaywrapper( "hunted_crash_recovery_music" );
    common_scripts\utility::flag_wait( "trucks_warning" );
    musicstop( 5 );
    common_scripts\utility::flag_wait( "hit_the_deck_music" );
    wait 2;
    maps\_utility::musicplaywrapper( "hunted_spotlight_music" );
}

hunted_wibble_think()
{
    maps\_wibble::set_cloth_wibble( 0.0 );
    common_scripts\utility::flag_wait( "aa_flight" );
    maps\_wibble::set_cloth_wibble( 0.5 );
    common_scripts\utility::flag_wait( "blackhawk_down" );
    maps\_wibble::set_cloth_wibble( 0.0 );
}

door_anim_first_frame_solo()
{
    var_0 = getent( "barn_rear_door", "targetname" );
    var_0.old_angles = var_0.angles;

    if ( getdvarint( "use_old_door_openings" ) != 1 )
    {
        var_1 = getnode( "price_barn_rear", "targetname" );
        var_0 maps\_utility::assign_animtree( "barndoor_01" );
        var_1 maps\_anim::anim_first_frame_solo( var_0, "open" );
    }
}
