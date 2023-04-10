// H1 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

dead_script()
{
    common_scripts\_ca_blockout::init();
    maps\ac130_precache::main();
    vehicle_scripts\_camera::main( "vehicle_camera", undefined, "script_vehicle_camera" );
    maps\createart\ac130_art::main();
    maps\ac130_fx::main();
    maps\_load::main();
    maps\ac130_snd::main();
    maps\ac130_anim::main();
    maps\ac130_aud::main();
    maps\ac130_lighting::main();
}

main()
{
    if ( getdvar( "beautiful_corner" ) == "1" )
    {
        dead_script();
        return;
    }

    if ( getdvar( "ac130_gameplay_enabled" ) == "" )
        setdvar( "ac130_gameplay_enabled", "1" );

    setexpfog( 1000, 17300, 0.0, 0.0, 0.0, 0, 0, 0 );
    setsaveddvar( "scr_dof_enable", "0" );
    maps\ac130_code::precachelevelstuff();
    common_scripts\utility::flag_init( "mission_failed" );
    common_scripts\utility::flag_init( "hijacked_vehicles_stopped" );
    common_scripts\utility::flag_init( "friendlies_loading_vehicles" );
    common_scripts\utility::flag_init( "choppers_inbound" );
    common_scripts\utility::flag_init( "friendlies_moving_to_choppers" );
    common_scripts\utility::flag_init( "ignore_friendly_move_commands" );
    common_scripts\utility::flag_init( "friendlies_in_choppers" );
    common_scripts\utility::flag_init( "choppers_flew_away" );
    level.hintprintduration = 4.5;
    level.minimumfriendlycount = 3;
    level.minimumautosavefriendlycount = 5;
    maps\_utility::add_start( "church", ::start_church, &"STARTS_CHURCH" );
    maps\_utility::add_start( "field", ::start_field, &"STARTS_FIELD" );
    maps\_utility::add_start( "hijack", ::start_hijack, &"STARTS_HIJACK" );
    maps\_utility::add_start( "junkyard", ::start_junkyard, &"STARTS_JUNKYARD" );
    maps\_utility::default_start( ::start_start );
    maps\ac130_code::scriptcalls();
    precachemodel( "vehicle_pickup_roobars_thermal" );
    precachemodel( "vehicle_ch46e_opened_door_ac130" );
    var_0 = maps\_vehicle_code::_getvehiclespawnerarray();
    common_scripts\utility::array_thread( var_0, maps\_utility::add_spawn_function, maps\_ac130::vehicle_thermal_models );
    common_scripts\utility::array_thread( vehicle_getarray(), maps\_ac130::vehicle_thermal_models );
    thread maps\_spawner::override_random_tire( "com_junktire_ac130" );
    wait 10;
    objective_add( 1, "current", &"AC130_OBJECTIVE_SUPPORT_FRIENDLIES", ( 0.0, 0.0, 0.0 ) );
}

start_start()
{
    level waittill( "introscreen_almost_complete" );
    maps\ac130_code::spawn_friendlies( "friends_start" );
    thread dialog_opening();
    thread gameplay_start();
}

start_church()
{
    maps\ac130_code::spawn_friendlies( "friends_church" );
    level.ac130.origin = getent( "ac130_waypoint_fight1", "targetname" ).origin;
    common_scripts\utility::flag_set( "clear_to_engage" );
    common_scripts\utility::flag_set( "allow_context_sensative_dialog" );
    thread dialog_cleared_to_engage();
    thread gameplay_chuch();
}

start_field()
{
    maps\ac130_code::spawn_friendlies( "friends_field1" );
    level.ac130.origin = getent( "ac130_waypoint_field1", "targetname" ).origin;
    common_scripts\utility::flag_set( "clear_to_engage" );
    common_scripts\utility::flag_set( "allow_context_sensative_dialog" );
    thread gameplay_fields();
}

start_hijack()
{
    maps\ac130_code::spawn_friendlies( "friends_hijack" );
    level.ac130.origin = getent( "ac130_waypoint_hijack", "targetname" ).origin;
    common_scripts\utility::flag_set( "clear_to_engage" );
    common_scripts\utility::flag_set( "allow_context_sensative_dialog" );
    wait 0.05;
    thread gameplay_hijack();
}

start_junkyard()
{
    maps\ac130_code::spawn_friendlies( "friends_junkyard" );
    level.ac130.origin = getent( "ac130_waypoint_junkyard1", "targetname" ).origin;
    common_scripts\utility::flag_set( "clear_to_engage" );
    common_scripts\utility::flag_set( "allow_context_sensative_dialog" );
    wait 0.05;
    thread gameplay_junkyard1();
}

gameplay_start()
{
    maps\ac130_code::move_friendlies( "friendly_location_01" );
    thread maps\_ac130::moveplanetowaypoint( "ac130_waypoint_fight1" );
    wait 27;
    thread gameplay_chuch();
}

gameplay_chuch()
{
    thread maps\ac130_code::autosavefriendlycountcheck( "church" );

    if ( getdvar( "ac130_gameplay_enabled" ) == "1" )
    {
        maps\ac130_code::resetplayerkillcount();
        maps\ac130_code::spawn_ac130_vehicle( "first_truck_spawn_trigger" );
        wait 5;
        maps\ac130_code::spawn_enemies( "first_truck_reinforcement_spawn_trigger" );
        wait 5;
        maps\ac130_code::spawn_enemies( "first_shack_spawner_trigger" );
        maps\ac130_code::spawn_enemies( "church_spawner_trigger" );
        maps\ac130_code::spawn_enemies( "church_spawner_trigger2" );
        maps\ac130_code::spawn_enemies( "house1_spawner_trigger" );
        wait 25;
        maps\ac130_code::move_friendlies( "friendly_location_02" );
        maps\ac130_code::waitforplayerkillcount( 7 );
        wait 15;
    }

    thread maps\_ac130::moveplanetowaypoint( "ac130_waypoint_fight2" );

    if ( getdvar( "ac130_gameplay_enabled" ) == "1" )
    {
        maps\ac130_code::resetplayerkillcount();
        maps\ac130_code::stop_enemies( "first_shack_spawner_trigger" );
        maps\ac130_code::spawn_enemies( "house2_spawner_trigger" );
        wait 10;
        maps\ac130_code::waitforplayerkillcount( 5 );
        maps\ac130_code::stop_enemies( "church_spawner_trigger2" );
    }

    maps\ac130_code::move_friendlies( "friendly_location_03" );

    if ( getdvar( "ac130_gameplay_enabled" ) == "1" )
    {
        wait 12;
        maps\ac130_code::stop_enemies( "church_spawner_trigger" );
    }

    maps\ac130_code::move_friendlies( "friendly_location_04" );

    if ( getdvar( "ac130_gameplay_enabled" ) == "1" )
    {
        maps\ac130_code::spawn_ac130_vehicle( "long_road_truck_spawn_trigger" );
        wait 12;
        maps\ac130_code::stop_enemies( "house1_spawner_trigger" );
        maps\ac130_code::stop_enemies( "house2_spawner_trigger" );
    }

    thread gameplay_fields();
}

gameplay_fields()
{
    thread dialog_passing_church();
    thread maps\ac130_code::autosavefriendlycountcheck( "fields" );
    thread maps\_ac130::moveplanetowaypoint( "ac130_waypoint_field1" );
    maps\ac130_code::move_friendlies( "friendly_location_05" );

    if ( getdvar( "ac130_gameplay_enabled" ) == "1" )
    {
        maps\ac130_code::resetplayerkillcount();
        wait 8;
        maps\ac130_code::spawn_enemies( "field1_spawner_trigger" );
        wait 8;
        maps\ac130_code::spawn_ac130_vehicle( "field1_truck_spawn_trigger" );
        wait 20;
        maps\ac130_code::waitforplayerkillcount( 10 );
        maps\ac130_code::stop_enemies( "field1_spawner_trigger" );
        maps\_utility::waittill_dead( maps\ac130_code::getenemiesinzone( "volume_field1" ), undefined, 30 );
    }

    thread gameplay_hijack();
}

driver_stop_anims()
{
    self.edriver notify( "stop_idle" );
    waittillframeend;
    thread maps\_anim::anim_loop_solo( self.edriver, "stop", "tag_driver", "stop_idle" );
}

#using_animtree("vehicles");

gameplay_hijack()
{
    thread maps\_ac130::ac130_move_in();
    thread maps\_ac130::moveplanetowaypoint( "ac130_waypoint_hijack" );
    maps\ac130_code::move_friendlies( "friendly_location_06" );
    wait 10;
    thread maps\ac130_code::autosavefriendlycountcheck( "hijack" );
    var_0 = [];
    var_0[0] = [];
    var_0[1] = [];

    if ( getdvar( "ac130_gameplay_enabled" ) == "1" )
    {
        var_1 = maps\_vehicle::create_vehicle_from_spawngroup_and_gopath( 5 );

        foreach ( var_3 in var_1 )
        {
            if ( var_3.vehicle_spawner.targetname == "getaway_vehicle_1" )
                level.getaway_vehicle_1 = var_3;

            if ( var_3.vehicle_spawner.targetname == "getaway_vehicle_2" )
                level.getaway_vehicle_2 = var_3;
        }

        level.getaway_vehicle_1 thread maps\ac130_code::friendly_fire_vehicle_thread();
        level.getaway_vehicle_2 thread maps\ac130_code::friendly_fire_vehicle_thread();
        thread maps\ac130_code::civilian_car_riders_spawn_and_idle();
        thread dialog_hijack();
        getvehiclenode( "vehicle_hijack_start_stop", "script_noteworthy" ) waittill( "trigger" );
        level.getaway_vehicle_1 vehicle_setspeed( 0, 10 );
        level.getaway_vehicle_2 vehicle_setspeed( 0, 10 );
        common_scripts\utility::flag_set( "hijacked_vehicles_stopped" );
        common_scripts\utility::array_thread( var_1, ::driver_stop_anims );
        wait 3;
        wait 2;

        for ( var_5 = 0; var_5 < level.friendlies.size; var_5++ )
        {
            if ( !isdefined( level.friendlies[var_5] ) )
                continue;

            if ( !isalive( level.friendlies[var_5] ) )
                continue;

            if ( var_0[0].size < 4 )
            {
                var_0[0][var_0[0].size] = level.friendlies[var_5];
                continue;
            }

            if ( var_0[1].size < 4 )
            {
                var_0[1][var_0[1].size] = level.friendlies[var_5];
                continue;
            }
        }

        for ( var_6 = 0; var_6 < 2; var_6++ )
        {
            for ( var_5 = 0; var_5 < var_0[var_6].size; var_5++ )
            {
                if ( var_6 == 0 )
                {
                    switch ( var_5 )
                    {
                        case 0:
                            var_0[var_6][var_5].animname = "hijacker_car1_guy1";
                            var_0[var_6][var_5].sittag = "tag_driver";
                            break;
                        case 1:
                            var_0[var_6][var_5].animname = "hijacker_car1_guy2";
                            var_0[var_6][var_5].sittag = "tag_passenger";
                            break;
                        case 2:
                            var_0[var_6][var_5].animname = "hijacker_car1_guy3";
                            var_0[var_6][var_5].sittag = "tag_guy1";
                            break;
                        case 3:
                            var_0[var_6][var_5].animname = "hijacker_car1_guy4";
                            var_0[var_6][var_5].sittag = "tag_guy0";
                            break;
                    }

                    continue;
                }

                switch ( var_5 )
                {
                    case 0:
                        var_0[var_6][var_5].animname = "hijacker_car2_guy1";
                        var_0[var_6][var_5].sittag = "tag_driver";
                        continue;
                    case 1:
                        var_0[var_6][var_5].animname = "hijacker_car2_guy2";
                        var_0[var_6][var_5].sittag = "tag_passenger";
                        continue;
                    case 2:
                        var_0[var_6][var_5].animname = "hijacker_car2_guy3";
                        var_0[var_6][var_5].sittag = "tag_guy1";
                        continue;
                    case 3:
                        var_0[var_6][var_5].animname = "hijacker_car2_guy4";
                        var_0[var_6][var_5].sittag = "tag_guy0";
                        continue;
                }
            }
        }

        thread maps\ac130_code::do_hijack( level.getaway_vehicle_1, var_0[0], %ac130_carjack_door_1a, %ac130_carjack_door_others );
        thread maps\ac130_code::do_hijack( level.getaway_vehicle_2, var_0[1], %ac130_carjack_door_1b, %ac130_carjack_door_others );
        common_scripts\utility::flag_set( "friendlies_loading_vehicles" );
        level.getaway_vehicle_1 thread maps\ac130_code::mission_fail_vehicle_death();
        level.getaway_vehicle_2 thread maps\ac130_code::mission_fail_vehicle_death();
    }

    if ( getdvar( "ac130_gameplay_enabled" ) == "1" )
    {
        if ( var_0[1].size > 0 )
            common_scripts\utility::waittill_multiple_ents( level.getaway_vehicle_1, "hijack_done", level.getaway_vehicle_2, "hijack_done" );
        else
            common_scripts\utility::waittill_multiple_ents( level.getaway_vehicle_1, "hijack_done" );
    }

    thread dialog_ambush();
    wait 17.0;
    thread gameplay_ambush();
    thread maps\_ac130::ac130_move_out();
    wait 17.0;

    if ( getdvar( "ac130_gameplay_enabled" ) == "1" )
    {
        level.getaway_vehicle_1 resumespeed( 5 );
        wait 1.3;
        level.getaway_vehicle_2 resumespeed( 5 );
    }
}

gameplay_ambush()
{
    thread maps\_ac130::moveplanetowaypoint( "ac130_waypoint_ambush" );

    if ( getdvar( "ac130_gameplay_enabled" ) == "1" )
    {
        wait 5;
        maps\ac130_code::spawn_ac130_vehicle( "ambush_truck1_spawn_trigger" );
        maps\ac130_code::spawn_enemies( "ambush_rooftop_spawn_trigger" );
        wait 5;
        maps\ac130_code::spawn_enemies( "ambush_rpg_spawn_trigger1" );
        maps\ac130_code::spawn_enemies( "ambush_rpg_spawn_trigger4" );
        wait 5;
    }

    thread maps\_ac130::ac130_move_in();
    thread maps\ac130_code::autosavefriendlycountcheck( "ambush" );

    if ( getdvar( "ac130_gameplay_enabled" ) == "1" )
    {
        maps\ac130_code::spawn_enemies( "ambush_rpg_spawn_trigger3" );
        wait 5;
        maps\ac130_code::spawn_enemies( "ambush_rpg_spawn_trigger2" );
        wait 20;
        maps\ac130_code::spawn_ac130_vehicle( "ambush_bmp_spawn_trigger" );
        wait 32;
    }

    thread maps\_ac130::moveplanetowaypoint( "ac130_waypoint_junkyard1" );
    getvehiclenode( "stop_at_junkyard", "script_noteworthy" ) waittill( "trigger" );
    thread dialog_junkyard1();
    level.getaway_vehicle_2 vehicle_setspeed( 0, 10 );
    wait 1;
    level.getaway_vehicle_1 vehicle_setspeed( 0, 10 );
    wait 3;
    level.getaway_vehicle_1 notify( "getout" );
    level.getaway_vehicle_2 notify( "getout" );
    level notify( "getaway_vehicles_unloaded" );
    waittillframeend;
    thread gameplay_junkyard1();
}

gameplay_junkyard1()
{
    thread maps\_ac130::moveplanetowaypoint( "ac130_waypoint_junkyard1" );
    maps\ac130_code::move_friendlies( "friendly_location_07" );
    wait 5;
    thread maps\ac130_code::autosavefriendlycountcheck( "junkyard" );

    if ( getdvar( "ac130_gameplay_enabled" ) == "1" )
    {
        maps\ac130_code::resetplayerkillcount();
        common_scripts\utility::array_thread( getaiarray( "axis" ), maps\_utility::self_delete );
        maps\ac130_code::spawn_enemies( "junkyard_spawn_trigger1" );
        wait 3;
        maps\ac130_code::spawn_enemies( "junkyard_spawn_trigger4" );
        wait 5;
        maps\ac130_code::spawn_enemies( "junkyard_spawn_trigger2" );
        wait 10;
        maps\ac130_code::spawn_enemies( "junkyard_spawn_trigger5" );
        wait 15;
        maps\ac130_code::spawn_enemies( "junkyard_spawn_trigger3" );
        wait 45;
        maps\ac130_code::waitforplayerkillcount( 12 );
    }

    thread gameplay_junkyard2();
}

gameplay_junkyard2()
{
    thread dialog_junkyard2();
    maps\ac130_code::stop_enemies( "junkyard_spawn_trigger1" );
    maps\ac130_code::stop_enemies( "junkyard_spawn_trigger2" );
    maps\ac130_code::stop_enemies( "junkyard_spawn_trigger3" );
    thread maps\_ac130::moveplanetowaypoint( "ac130_waypoint_junkyard2" );
    maps\ac130_code::move_friendlies( "friendly_location_08" );
    thread maps\ac130_code::autosavefriendlycountcheck( "junkyard2" );

    if ( getdvar( "ac130_gameplay_enabled" ) == "1" )
    {
        maps\ac130_code::resetplayerkillcount();
        maps\ac130_code::spawn_enemies( "junkyard2_spawn_trigger1" );
        maps\ac130_code::spawn_ac130_vehicle( "junkyard_truck2_spawn_trigger" );
        wait 10;
        maps\ac130_code::spawn_ac130_vehicle( "junkyard_truck1_spawn_trigger" );
        wait 10;
        maps\ac130_code::waitforplayerkillcount( 5 );
        maps\ac130_code::stop_enemies( "junkyard_spawn_trigger4" );
        maps\ac130_code::stop_enemies( "junkyard_spawn_trigger5" );
    }

    common_scripts\utility::flag_set( "choppers_inbound" );
    maps\ac130_code::spawn_ac130_vehicle( "blackhawks_spawn_trigger" );
    common_scripts\utility::flag_wait( "choppers_flew_away" );
    maps\ac130_code::missionend( 1 );
}

friendly_health_init()
{
    thread maps\_utility::magic_bullet_shield();
}

clear_to_engage( var_0 )
{
    if ( isdefined( var_0 ) )
        wait(var_0);

    common_scripts\utility::flag_set( "clear_to_engage" );
    common_scripts\utility::array_thread( getaiarray(), ::dontshoot, 0 );
}

dontshoot( var_0 )
{
    if ( var_0 )
    {
        self.ignoreme = 1;
        self.ignoreall = 1;
    }
    else
    {
        self.ignoreme = 0;
        self.ignoreall = 0;
    }
}

dialog_opening()
{
    if ( getdvar( "ac130_enabled" ) == "0" )
        return;

    common_scripts\utility::array_thread( getaiarray(), ::dontshoot, 1 );
    wait 2;
    maps\_ac130::playsoundoverradio( level.scr_sound["price"]["ac130_pri_towntoeast"], 1 );
    wait 1;
    maps\_ac130::playsoundoverradio( level.scr_sound["tvo"]["ac130_tvo_eyesonfriendlies"], 1 );
    wait 1;
    maps\_ac130::playsoundoverradio( level.scr_sound["fco"]["ac130_fco_nofirestrobe"], 1 );
    wait 0.5;
    maps\ac130_code::hintprint( &"SCRIPT_PLATFORM_AC130_HINT_TOGGLE_THERMAL", 1 );
    wait 0.5;
    maps\ac130_code::hintprint( &"AC130_HINT_CYCLE_WEAPONS" );
    thread dialog_church_spotted();
}

dialog_church_spotted()
{
    maps\_ac130::playsoundoverradio( level.scr_sound["nav"]["ac130_nav_confirmchurch"], 1 );
    wait 1;
    maps\_ac130::playsoundoverradio( level.scr_sound["tvo"]["ac130_tvo_weseeit"], 1 );
    level notify( "start_clock" );
    wait 1;
    maps\_ac130::playsoundoverradio( level.scr_sound["fco"]["ac130_fco_rogerwerethere"], 1 );
    wait 0.5;
    maps\_ac130::playsoundoverradio( level.scr_sound["nav"]["ac130_nav_notauthorizedchurch"], 1 );
    thread dialog_cleared_to_engage();
}

dialog_cleared_to_engage()
{
    if ( getdvar( "ac130_alternate_controls" ) == "1" )
        maps\ac130_code::hintprint( &"SCRIPT_PLATFORM_AC130_HINT_ZOOM_AND_FIRE" );

    maps\_ac130::playsoundoverradio( level.scr_sound["tvo"]["ac130_tvo_vehiclemovingnow"], 1 );
    wait 1;
    maps\_ac130::playsoundoverradio( level.scr_sound["fco"]["ac130_fco_onevehiclemoving"], 1 );
    wait 1;
    maps\_ac130::playsoundoverradio( level.scr_sound["tvo"]["ac130_tvo_personnelchurch"], 1 );
    wait 1;
    maps\_ac130::playsoundoverradio( level.scr_sound["fco"]["ac130_fco_armedpersonnelchurch"], 1 );
    wait 1;
    thread clear_to_engage( 1.5 );
    maps\_ac130::playsoundoverradio( level.scr_sound["pilot"]["ac130_plt_cleartoengage"], 1 );
    wait 1;
    common_scripts\utility::flag_set( "allow_context_sensative_dialog" );
    maps\_ac130::playsoundoverradio( level.scr_sound["fco"]["ac130_fco_cleartoengage"], 1 );
}

dialog_passing_church()
{
    common_scripts\utility::flag_clear( "allow_context_sensative_dialog" );
    maps\_ac130::playsoundoverradio( level.scr_sound["pri"]["ac130_pri_passingchurch"], 1 );
    maps\_ac130::playsoundoverradio( level.scr_sound["plt"]["ac130_plt_woutstrobe"], 1 );
    common_scripts\utility::flag_set( "allow_context_sensative_dialog" );
}

dialog_hijack()
{
    common_scripts\utility::flag_clear( "allow_context_sensative_dialog" );
    maps\_ac130::playsoundoverradio( level.scr_sound["fco"]["ac130_fco_movingvehicle"], 1 );
    maps\_ac130::playsoundoverradio( level.scr_sound["fco"]["ac130_fco_donoengage"], 1 );
    maps\_ac130::playsoundoverradio( level.scr_sound["pri"]["ac130_pri_coverus"], 1 );
    maps\_ac130::playsoundoverradio( level.scr_sound["fco"]["ac130_fco_civilianvehicles"], 1 );
    common_scripts\utility::flag_wait( "hijacked_vehicles_stopped" );
    maps\_ac130::playsoundoverradio( level.scr_sound["fco"]["ac130_fco_alttransport"], 1 );
    maps\_ac130::playsoundoverradio( level.scr_sound["tvo"]["ac130_tvo_nicetruck"], 1 );
    maps\_ac130::playsoundoverradio( level.scr_sound["fco"]["ac130_fco_nahscared"], 1 );
    maps\_ac130::playsoundoverradio( level.scr_sound["pri"]["ac130_pri_confirmyousee"], 1 );
    maps\_ac130::playsoundoverradio( level.scr_sound["fco"]["ac130_fco_seebeacons"], 1 );
    common_scripts\utility::flag_set( "allow_context_sensative_dialog" );
}

dialog_ambush()
{
    common_scripts\utility::flag_clear( "allow_context_sensative_dialog" );
    maps\_ac130::playsoundoverradio( level.scr_sound["nav"]["ac130_nav_ambushroad"], 1 );
    maps\_ac130::playsoundoverradio( level.scr_sound["fco"]["ac130_fco_whichcurved"], 1 );
    maps\_ac130::playsoundoverradio( level.scr_sound["nav"]["ac130_nav_seewatertower"], 1 );
    maps\_ac130::playsoundoverradio( level.scr_sound["fco"]["ac130_fco_confirmyousee"], 1 );
    maps\_ac130::playsoundoverradio( level.scr_sound["tvo"]["ac130_tvo_nearintersection"], 1 );
    maps\_ac130::playsoundoverradio( level.scr_sound["nav"]["ac130_nav_thatstheone"], 1 );
    maps\_ac130::playsoundoverradio( level.scr_sound["nav"]["ac130_nav_doyouseethat"], 1 );
    maps\_ac130::playsoundoverradio( level.scr_sound["fco"]["ac130_fco_rogerthat"], 1 );
    maps\_ac130::playsoundoverradio( level.scr_sound["nav"]["ac130_nav_trackthatroad"], 1 );
    maps\_ac130::playsoundoverradio( level.scr_sound["fco"]["ac130_fco_howfar"], 1 );
    maps\_ac130::playsoundoverradio( level.scr_sound["nav"]["ac130_nav_uhhangon"], 1 );
    maps\_ac130::playsoundoverradio( level.scr_sound["nav"]["ac130_nav_600meters"], 1 );
    maps\_ac130::playsoundoverradio( level.scr_sound["tvo"]["ac130_tvo_rogerthat"], 1 );
    maps\_ac130::playsoundoverradio( level.scr_sound["plt"]["ac130_plt_bankingtovillage"], 1 );
    maps\_ac130::playsoundoverradio( level.scr_sound["tvo"]["ac130_tvo_hostilescurved"], 1 );
    maps\_ac130::playsoundoverradio( level.scr_sound["fco"]["ac130_fco_partiallyconcealed"], 1 );
    maps\_ac130::playsoundoverradio( level.scr_sound["tvo"]["ac130_tvo_firedrpg"], 1 );
    maps\_ac130::playsoundoverradio( level.scr_sound["fco"]["ac130_fco_takeout"], 1 );
    maps\_ac130::playsoundoverradio( level.scr_sound["fco"]["ac130_fco_outofbarn"], 1 );
    maps\_ac130::playsoundoverradio( level.scr_sound["plt"]["ac130_plt_smokem"], 1 );
    maps\_ac130::playsoundoverradio( level.scr_sound["pri"]["ac130_pri_underattack"], 1 );
    maps\_ac130::playsoundoverradio( level.scr_sound["fco"]["ac130_fco_smoketrails"], 1 );
    maps\_ac130::playsoundoverradio( level.scr_sound["tvo"]["ac130_tvo_ushaped"], 1 );
    maps\_ac130::playsoundoverradio( level.scr_sound["fco"]["ac130_fco_ushaped"], 1 );
    maps\_ac130::playsoundoverradio( level.scr_sound["tvo"]["ac130_tvo_flatroof"], 1 );
    common_scripts\utility::flag_set( "allow_context_sensative_dialog" );
}

dialog_junkyard1()
{
    common_scripts\utility::flag_clear( "allow_context_sensative_dialog" );
    maps\_ac130::playsoundoverradio( level.scr_sound["pri"]["ac130_pri_junkyard"], 1 );
    maps\_ac130::playsoundoverradio( level.scr_sound["fco"]["ac130_fco_flashingstrobe"], 1 );
    maps\_ac130::playsoundoverradio( level.scr_sound["fco"]["ac130_fco_watchstrobe"], 1 );
    maps\_ac130::playsoundoverradio( level.scr_sound["tvo"]["ac130_tvo_enemyjunkyard"], 1 );
    maps\_ac130::playsoundoverradio( level.scr_sound["fco"]["ac130_fco_smokeem"], 1 );
    maps\_ac130::playsoundoverradio( level.scr_sound["fco"]["ac130_fco_gointotown"], 1 );
    common_scripts\utility::flag_set( "allow_context_sensative_dialog" );
}

dialog_junkyard2()
{
    common_scripts\utility::flag_clear( "allow_context_sensative_dialog" );
    maps\_ac130::playsoundoverradio( level.scr_sound["pri"]["ac130_pri_fireallsides"], 1 );
    maps\_ac130::playsoundoverradio( level.scr_sound["nav"]["ac130_nav_dangerclose"], 1 );
    common_scripts\utility::flag_set( "allow_context_sensative_dialog" );
    common_scripts\utility::flag_wait( "choppers_inbound" );
    common_scripts\utility::flag_clear( "allow_context_sensative_dialog" );
    maps\_ac130::playsoundoverradio( level.scr_sound["fco"]["ac130_fco_friendliesentering"], 1 );
    maps\_ac130::playsoundoverradio( level.scr_sound["tvo"]["ac130_tvo_copy"], 1 );
    common_scripts\utility::flag_wait( "friendlies_moving_to_choppers" );
    maps\_ac130::playsoundoverradio( level.scr_sound["pri"]["ac130_pri_thanksforassist"], 1 );
    maps\_ac130::playsoundoverradio( level.scr_sound["fco"]["ac130_fco_highlightreel"], 1 );
    maps\_ac130::playsoundoverradio( level.scr_sound["tvo"]["ac130_tvo_heardthat"], 1 );
    common_scripts\utility::flag_wait( "friendlies_in_choppers" );
    maps\_ac130::playsoundoverradio( level.scr_sound["nav"]["ac130_nav_vipsecure"], 1 );
    maps\_ac130::playsoundoverradio( level.scr_sound["plt"]["ac130_plt_returningbase"], 1 );
}
