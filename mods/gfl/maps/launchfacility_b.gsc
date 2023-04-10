// H1 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

dead_script()
{
    common_scripts\_ca_blockout::init();
    thread maps\createart\launchfacility_b_art::main();
    thread maps\launchfacility_b_fx::main();
    maps\launchfacility_b_precache::main();
    maps\_load::main();
    thread maps\launchfacility_b_amb::main();
    maps\launchfacility_b_anim::main();
    maps\launchfacility_b_lighting::main();
}

main()
{
    if ( getdvar( "beautiful_corner" ) == "1" )
    {
        dead_script();
        return;
    }

    setsaveddvar( "compassmaxrange", 1200 );
    precachemodel( "com_computer_keyboard_obj" );
    precachemodel( "com_computer_keyboard" );
    precachemodel( "weapon_c4_obj" );
    precachemodel( "weapon_c4" );
    precacheshader( "white" );
    precacheshader( "black" );
    precacheshader( "h1_hud_upload_codes_blur" );
    precacheshader( "h1_hud_upload_codes_border" );
    precachestring( &"LAUNCHFACILITY_B_PLANT_THE_C4" );
    precachestring( &"LAUNCHFACILITY_B_GET_TO_THE_TELEMETRY" );
    precachestring( &"LAUNCHFACILITY_B_CLEAR_ROOM" );
    precachestring( &"LAUNCHFACILITY_B_UPLOAD_THE_ABORT_CODES" );
    precachestring( &"LAUNCHFACILITY_B_BOMBS_GO_BOOM" );
    precachestring( &"LAUNCHFACILITY_B_TIME_TILL_ICBM_IMPACT" );
    precachestring( &"LAUNCHFACILITY_B_HINT_UPLOAD_CODES" );
    precachestring( &"LAUNCHFACILITY_B_FOLLOW_PRICE" );
    precachestring( &"LAUNCHFACILITY_B_UPLOADING_CODES" );
    precacheshader( "h1_hud_timer_blur" );
    precacheshader( "h1_hud_timer_border" );
    precacheshader( "h1_timer_on_flare" );
    precacheshader( "h1_timer_warning_flare" );
    maps\_utility::add_start( "warehouse", ::start_warehouse, &"STARTS_WAREHOUSE" );
    maps\_utility::add_start( "launchtubes", ::start_launchtubes, &"STARTS_LAUNCHTUBES" );
    maps\_utility::add_start( "vaultdoors", ::start_vaultdoors, &"STARTS_VAULTDOORS" );
    maps\_utility::add_start( "controlroom", ::start_controlroom, &"STARTS_CONTROLROOM" );
    maps\_utility::add_start( "escape", ::start_escape, &"STARTS_ESCAPE1" );
    maps\_utility::add_start( "elevator", ::start_elevator, &"STARTS_ELEVATOR" );
    maps\_utility::default_start( ::start_default );
    level thread maps\createart\launchfacility_b_art::main();
    level thread maps\launchfacility_b_fx::main();
    level.weaponclipmodels = [];
    level.weaponclipmodels[0] = "weapon_m16_clip";
    level.weaponclipmodels[1] = "weapon_saw_clip";
    level.weaponclipmodels[2] = "weapon_ak47_clip";
    level.weaponclipmodels[3] = "weapon_mp5_clip";
    level.weaponclipmodels[4] = "weapon_g36_clip";
    thread common_scripts\_pipes::main();
    thread maps\_leak::main();
    maps\launchfacility_b_precache::main();
    maps\_load::main();
    maps\_nightvision::main();
    level thread maps\launchfacility_b_amb::main();
    maps\_c4::main();
    maps\launchfacility_b_anim::main();
    maps\launchfacility_b_lighting::main();
    maps\launchfacility_b_aud::main();
    maps\_deadbody::main();
    maps\_compass::setupminimap( "compass_map_launchfacility_b" );
    createthreatbiasgroup( "player" );
    precachemodel( "com_computer_keyboard_obj" );
    precachemodel( "com_computer_keyboard" );
    precachemodel( "body_russian_loyalist_a_dead" );
    precachemodel( "head_russian_loyalist_a_dead" );
    precachemodel( "body_russian_loyalist_b_dead" );
    precachemodel( "body_russian_loyalist_c_dead" );
    precachemodel( "weapon_c4_obj" );
    precachemodel( "weapon_c4" );
    precacheshader( "white" );
    precacheshader( "black" );
    precachestring( &"LAUNCHFACILITY_B_PLANT_THE_C4" );
    precachestring( &"LAUNCHFACILITY_B_GET_TO_THE_TELEMETRY" );
    precachestring( &"LAUNCHFACILITY_B_UPLOAD_THE_ABORT_CODES" );
    precachestring( &"LAUNCHFACILITY_B_BOMBS_GO_BOOM" );
    precachestring( &"LAUNCHFACILITY_B_TIME_TILL_ICBM_IMPACT" );
    precachestring( &"LAUNCHFACILITY_B_HINT_UPLOAD_CODES" );
    precachestring( &"LAUNCHFACILITY_B_FOLLOW_PRICE" );
    precachestring( &"LAUNCHFACILITY_B_UPLOADING_CODES" );
    maps\_utility::battlechatter_off( "allies" );
    level.secondaryprogressbary = 75;
    level.secondaryprogressbarx = 0;
    level.secondaryprogressbarheight = 14;
    level.secondaryprogressbarwidth = 152;
    level.secondaryprogressbartexty = 55;
    level.secondaryprogressbarfontsize = 1;
    level.usetimer = 1;
    level.missionfailedquote = &"LAUNCHFACILITY_B_BOMBS_GO_BOOM";
    level.c4 = getent( "c4", "targetname" );
    level.keyboard = getent( "keyboard", "targetname" );
    level.elevator_upper = getent( "elevator_upper", "targetname" );
    level.wallexplosionsmall_fx = loadfx( "fx/explosions/wall_explosion_small" );
    var_0 = getent( "price", "script_noteworthy" );
    var_0 maps\_utility::add_spawn_function( ::price_think );
    var_1 = getent( "grigsby", "script_noteworthy" );
    var_1 maps\_utility::add_spawn_function( ::grigsby_think );
    var_2 = getent( "team1", "script_noteworthy" );
    var_2 maps\_utility::add_spawn_function( ::team1_think );
    var_3 = getentarray( "vent_friendlies_group1", "script_noteworthy" );
    common_scripts\utility::array_thread( var_3, maps\_utility::add_spawn_function, ::vent_friendlies_group1_spawner_think );
    var_4 = getentarray( "vent_enemies_group1", "script_noteworthy" );
    common_scripts\utility::array_thread( var_4, maps\_utility::add_spawn_function, ::vent_enemies_group1_spawner_think );
    var_5 = getentarray( "vent_friendlies_group2", "script_noteworthy" );
    common_scripts\utility::array_thread( var_5, maps\_utility::add_spawn_function, ::vent_friendlies_group2_spawner_think );
    var_6 = getentarray( "vent_enemies_group2", "script_noteworthy" );
    common_scripts\utility::array_thread( var_6, maps\_utility::add_spawn_function, ::vent_enemies_group2_spawner_think );
    var_7 = getentarray( "gassed_runners", "script_noteworthy" );
    common_scripts\utility::array_thread( var_7, maps\_utility::add_spawn_function, ::warehouse_retreating_enemies_think );
    common_scripts\utility::flag_init( "aa_countdown_started" );
    common_scripts\utility::flag_init( "aa_first_floor" );
    common_scripts\utility::flag_init( "aa_warehouse" );
    common_scripts\utility::flag_init( "aa_launchtubes" );
    common_scripts\utility::flag_init( "aa_blow_the_wall" );
    common_scripts\utility::flag_init( "aa_upload_them_codes" );
    common_scripts\utility::flag_init( "aa_follow_price_end_level" );
    common_scripts\utility::flag_init( "speakers_active" );
    common_scripts\utility::flag_init( "control_room" );
    common_scripts\utility::flag_init( "location_change_stairs" );
    common_scripts\utility::flag_init( "10min_left" );
    common_scripts\utility::flag_init( "8min_left" );
    common_scripts\utility::flag_init( "6min_left" );
    common_scripts\utility::flag_init( "5min_left" );
    common_scripts\utility::flag_init( "4min_left" );
    common_scripts\utility::flag_init( "3min_left" );
    common_scripts\utility::flag_init( "2min_left" );
    common_scripts\utility::flag_init( "1min_left" );
    common_scripts\utility::flag_init( "timer_expired" );
    common_scripts\utility::flag_init( "countdown_started" );
    common_scripts\utility::flag_init( "walk" );
    common_scripts\utility::flag_init( "begin_countdown" );
    common_scripts\utility::flag_init( "grisby_jump" );
    common_scripts\utility::flag_init( "move_faster" );
    common_scripts\utility::flag_init( "start_missile_alarm" );
    common_scripts\utility::flag_init( "10sec_till_blastoff" );
    common_scripts\utility::flag_init( "price_close_door" );
    common_scripts\utility::flag_init( "blast_door_player_clip_on" );
    common_scripts\utility::flag_init( "blast_door_player_clip_off" );
    common_scripts\utility::flag_init( "open_vault_doors" );
    common_scripts\utility::flag_init( "vault_doors_unlocked" );
    common_scripts\utility::flag_init( "vault_door_opened" );
    common_scripts\utility::flag_init( "update_objectives" );
    common_scripts\utility::flag_init( "wall_destroyed" );
    common_scripts\utility::flag_init( "change_films" );
    common_scripts\utility::flag_init( "zakhaev_leaving" );
    common_scripts\utility::flag_init( "codes_uploaded" );
    common_scripts\utility::flag_init( "delete_team2" );
    common_scripts\utility::flag_init( "elevator_player_clip_on" );
    common_scripts\utility::flag_init( "elevator_dialogue" );
    common_scripts\utility::flag_init( "at_the_jeep" );
    common_scripts\utility::flag_init( "level_end" );
    common_scripts\utility::flag_init( "music_start_countdown" );
    common_scripts\utility::flag_init( "successful_confirmation" );
    common_scripts\utility::flag_init( "player_in_elevator" );
    common_scripts\utility::flag_init( "all_in_elevator" );
    common_scripts\utility::flag_init( "player_out_of_vents" );
    level thread airduct_fan_large();
    level thread airduct_fan_medium();
    level thread airduct_fan_small();
    level thread redlights();
    level thread redlight_spinner();
    level thread wall_lights();
    level thread wall_light_spinner();
    level thread compass_maps();
    level thread obj_control_room();
    level thread obj_which_way_to_control_room();
    level thread obj_upload_the_abort_codes();
    level thread obj_plant_the_c4();
    level thread countdown_begins();
    level thread grigsby_countdown_spam();
    level thread vent_trigger_move_out();
    level thread vent_trigger_air_raid_siren();
    level thread vent_dialogue1();
    level thread vent_dialogue2();
    level thread vent_trigger_friendlies_vent_jump();
    level thread vent_trigger_team1_vent_jump();
    level thread barracks_dialogue();
    level thread team1_walk_trigger();
    level thread team1_run_trigger();
    level thread hide_triggers_1st_floor();
    level thread warehouse_trigger_kill_allied_teammate();
    level thread warehouse_trigger_kill_enemies();
    level thread launchtubes_missile_alarm();
    level thread launchtubes_effects();
    level thread launch_tube_dialogue();
    level thread launchtubes_teleport_friendlies();
    level thread rocket_powering_up();
    level thread keep_price_griggs_distance_hallway_after_staircase();
    level thread run_to_the_door();
    level thread in_volume();
    level thread blast_door_clip();
    level thread vault_doors_dialogue();
    level thread vault_doors_open();
    level thread spawn_utility_enemies();
    level thread preparing_to_breach();

    if ( getdvarint( "use_old_control_room_screen" ) == 1 )
    {
        level thread control_room_noradscreen();
        level thread control_room_bigscreen();
    }
    else
        level thread control_room_screen_h1();

    level thread update_keyboard_monitor_screen( "monitor_8", "all_in_elevator" );
    level thread update_keyboard_monitor_screen( "monitor_9", "all_in_elevator" );
    level thread spawn_telemetry_enemies();
    level thread spawn_telemetry_friendlies();

    if ( getdvarint( "use_old_keyboard_typing" ) == 1 )
        level thread upload_codes();
    else
        level thread upload_codes_h1();

    level thread control_room_dialogue();
    level thread elevator();
    level thread elevator_player_clip();
    level thread elevator_dialogue();
    level thread music();
    level thread hide_triggers( "escape" );
    level thread vehical_depot();
    level thread end_of_level();
    var_8 = getentarray( "autosave", "targetname" );

    for ( var_9 = 0; var_9 < var_8.size; var_9++ )
        var_8[var_9] thread my_autosave();
}

h1_typing_dof_start()
{
    level.player setphysicaldepthoffield( 16.0, 150, 9.0, 9.0 );
    level.player enablephysicaldepthoffieldscripting();
    level.player setphysicaldepthoffield( 2.5, 25, 4.0, 4.0 );
}

h1_typing_dof_stop()
{
    level.player setphysicaldepthoffield( 16.0, 150, 4.0, 4.0 );
    wait 0.5;
    level.player disablephysicaldepthoffieldscripting();
}

start_default()
{
    soundscripts\_snd::snd_message( "start_default_checkpoint" );
}

start_warehouse()
{
    soundscripts\_snd::snd_message( "start_warehouse_checkpoint" );
    common_scripts\utility::flag_set( "begin_countdown" );
    level notify( "use_start" );
    var_0 = getent( "warehouse_price", "targetname" );
    level.price teleport( var_0.origin, var_0.angles );
    var_1 = getent( "warehouse_grigsby", "targetname" );
    level.grigsby teleport( var_1.origin, var_1.angles );
    var_2 = getent( "warehouse_player", "targetname" );
    level.player setorigin( var_2.origin );
    level.player setplayerangles( var_2.angles );
    common_scripts\utility::flag_set( "walk" );
    common_scripts\utility::flag_set( "move_faster" );
    maps\_utility::activate_trigger_with_targetname( "warehouse_color_init" );
    wait 1;
    level.team1[0] delete();
}

start_launchtubes()
{
    soundscripts\_snd::snd_message( "start_launchtubes_checkpoint" );
    common_scripts\utility::flag_set( "begin_countdown" );
    level notify( "use_start" );
    var_0 = getent( "launchtubes_price", "targetname" );
    level.price teleport( var_0.origin, var_0.angles );
    var_1 = getent( "launchtubes_grigsby", "targetname" );
    level.grigsby teleport( var_1.origin, var_1.angles );
    var_2 = getent( "launchtubes_player", "targetname" );
    level.player setorigin( var_2.origin );
    level.player setplayerangles( var_2.angles );
    common_scripts\utility::flag_set( "walk" );
    common_scripts\utility::flag_set( "move_faster" );
    wait 1;
    level.team1[0] delete();
}

start_vaultdoors()
{
    soundscripts\_snd::snd_message( "start_vaultdoors_checkpoint" );
    common_scripts\utility::flag_set( "begin_countdown" );
    level notify( "use_start" );
    var_0 = getent( "vaultdoors_price", "targetname" );
    level.price teleport( var_0.origin, var_0.angles );
    var_1 = getent( "vaultdoors_grigsby", "targetname" );
    level.grigsby teleport( var_1.origin, var_1.angles );
    var_2 = getent( "vaultdoors_player", "targetname" );
    level.player setorigin( var_2.origin );
    level.player setplayerangles( var_2.angles );
    common_scripts\utility::flag_set( "walk" );
    common_scripts\utility::flag_set( "move_faster" );
    common_scripts\utility::flag_set( "open_vault_doors" );
    level.price maps\_utility::set_force_color( "r" );
    maps\_utility::activate_trigger_with_targetname( "setup_for_vault_doors" );
    wait 1;
    level.team1[0] delete();
}

start_controlroom()
{
    soundscripts\_snd::snd_message( "start_controlroom_checkpoint" );
    common_scripts\utility::flag_set( "begin_countdown" );
    level notify( "use_start" );
    var_0 = getent( "controlroom_price", "targetname" );
    level.price teleport( var_0.origin, var_0.angles );
    var_1 = getent( "controlroom_grigsby", "targetname" );
    level.grigsby teleport( var_1.origin, var_1.angles );
    var_2 = getent( "controlroom_player", "targetname" );
    level.player setorigin( var_2.origin );
    level.player setplayerangles( var_2.angles );
    common_scripts\utility::flag_set( "walk" );
    common_scripts\utility::flag_set( "move_faster" );
    level thread hide_triggers( "attacking" );
    maps\_utility::activate_trigger_with_targetname( "protect_the_c4" );
    common_scripts\utility::flag_set( "update_objectives" );
    thread plant_the_c4();
    var_3 = getentarray( "team2", "script_noteworthy" );
    common_scripts\utility::array_thread( var_3, maps\_utility::spawn_ai );
    maps\_utility::activate_trigger_with_targetname( "control_room_friendlies_attack" );
    wait 1;
    level.team1[0] delete();
    var_4 = getent( "vault_door_left", "targetname" );
    var_5 = getent( var_4.target, "targetname" );
    var_5 linkto( var_4 );
    var_6 = getent( "vault_door_right", "targetname" );
    var_7 = getent( var_6.target, "targetname" );
    var_7 linkto( var_6 );
    var_4 rotateyaw( -103, 1, 0, 1 );
    var_6 rotateyaw( 103, 1, 0, 1 );
    var_5 connectpaths();
    var_7 connectpaths();
}

start_escape()
{
    soundscripts\_snd::snd_message( "start_escape_checkpoint" );
    level notify( "use_start" );
    level thread hide_triggers( "attacking" );
    var_0 = getent( "vault_door_left", "targetname" );
    var_1 = getent( var_0.target, "targetname" );
    var_1 linkto( var_0 );
    var_2 = getent( "vault_door_right", "targetname" );
    var_3 = getent( var_2.target, "targetname" );
    var_3 linkto( var_2 );
    var_0 rotateyaw( -103, 1, 0, 1 );
    var_2 rotateyaw( 103, 1, 0, 1 );
    var_1 connectpaths();
    var_3 connectpaths();
    var_4 = getent( "blasted_wall", "targetname" );
    var_4 connectpaths();
    common_scripts\_exploder::exploder( 100 );
    var_5 = getent( "escape_price", "targetname" );
    level.price teleport( var_5.origin, var_5.angles );
    var_6 = getent( "escape_grigsby", "targetname" );
    level.grigsby teleport( var_6.origin, var_6.angles );
    var_7 = getent( "escape_player", "targetname" );
    level.player setorigin( var_7.origin );
    level.player setplayerangles( var_7.angles );
    common_scripts\utility::flag_set( "walk" );
    common_scripts\utility::flag_set( "move_faster" );
    var_8 = getentarray( "team2", "script_noteworthy" );
    common_scripts\utility::array_thread( var_8, maps\_utility::spawn_ai );
    maps\_utility::activate_trigger_with_targetname( "control_room_friendlies_attack" );
    level thread show_triggers( "escape" );
    thread telemetry_doors_open();
    thread escape_doors_open();
    thread grigsby_warning();
    thread delete_controlroom_friendlies();
    level.price maps\_anim::anim_single_queue( level.price, "vehicledepot" );
    thread follow_price();
    wait 1;
    level.team1[0] delete();
}

start_elevator()
{
    soundscripts\_snd::snd_message( "start_elevator_checkpoint" );
    level notify( "use_start" );
    var_0 = getent( "elevator_player", "targetname" );
    level.player setorigin( var_0.origin );
    level.player setplayerangles( var_0.angles );
    var_1 = getent( "elevator_grigsby", "targetname" );
    level.price forceteleport( var_1.origin, var_1.angles );
    var_2 = getent( "elevator_price", "targetname" );
    level.grigsby forceteleport( var_2.origin, var_2.angles );
    common_scripts\utility::flag_set( "walk" );
    common_scripts\utility::flag_set( "move_faster" );
    level thread show_triggers( "escape" );
    maps\_utility::autosave_by_name( "start_elevator" );
    wait 1;
    level.team1[0] delete();
}

my_autosave()
{
    self waittill( "trigger" );
    autosave_by_name_wraper( "save", self.script_savetrigger_timer );
}

get_remaining_seconds()
{
    var_0 = gettime();
    var_1 = ( var_0 - level.timer_start_time ) / 1000 / 60;
    return ( level.stopwatch - var_1 ) * 60;
}

autosave_by_name_wraper( var_0, var_1 )
{
    if ( isdefined( level.timer_start_time ) )
    {
        var_2 = gettime();
        var_3 = ( var_2 - level.timer_start_time ) / 1000 / 60;
        var_4 = level.stopwatch - var_3;
        var_1 *= level.requried_time_scale;

        if ( var_4 < var_1 )
            return;
    }

    maps\_utility::autosave_or_timeout( var_0, 12 );
}

price_think()
{
    level.price = self;
    level.price.animname = "price";
    level.price thread maps\_utility::magic_bullet_shield();
    level.price.disablebulletwhizbyreaction = 1;
    thread ai_duct();
}

grigsby_think()
{
    level.grigsby = self;
    level.grigsby.animname = "grigsby";
    level.grigsby thread maps\_utility::magic_bullet_shield();
    level.grigsby.disablebulletwhizbyreaction = 1;
    thread ai_duct();
}

team1_think()
{
    if ( !isdefined( level.team1 ) )
        level.team1 = [];

    self.animname = "steve";
    level.team1[level.team1.size] = self;
    self.disablebulletwhizbyreaction = 1;
    thread ai_duct();
}

vent_trigger_move_out()
{
    wait 3;
    maps\_utility::activate_trigger_with_targetname( "move_out" );
    common_scripts\utility::flag_set( "aa_first_floor" );
    wait 1;
    maps\_utility::activate_trigger_with_targetname( "h1_move_out" );
}

vent_trigger_air_raid_siren()
{
    var_0 = getent( "trigger_air_raid", "targetname" );
    var_0 waittill( "trigger" );
    var_1 = getent( "air_raid", "targetname" );
    var_1 playloopsound( "emt_alarm_missile_siren" );
}

vent_dialogue1()
{
    level endon( "use_start" );
    wait 3;
    maps\_utility::radio_dialogue( "letsmove" );
    wait 3;
    maps\_utility::radio_dialogue( "basesecurity" );
    wait 1;
    maps\_utility::radio_dialogue( "invents" );
    maps\_utility::radio_dialogue( "gm1_copythat" );
    wait 1;
    play_sound_on_speaker( "launchfacility_b_rul_alert" );
}

vent_dialogue2()
{
    var_0 = getent( "yankee_six_regroup", "script_noteworthy" );
    var_0 thread vent_dialogue2_01();
}

vent_dialogue2_01()
{
    self waittill( "trigger" );
    maps\_utility::radio_dialogue( "heavyresistance" );
    maps\_utility::radio_dialogue( "gaincontrol" );
    maps\_utility::radio_dialogue( "regroup" );
    common_scripts\utility::flag_set( "begin_countdown" );
}

barracks_dialogue()
{
    var_0 = getent( "barracks_warning", "targetname" );
    var_0 waittill( "trigger" );
    play_sound_on_speaker( "launchfacility_b_rul_barracks" );
}

team1_walk_trigger()
{
    var_0 = getent( "team1_walk", "script_noteworthy" );
    var_0 waittill( "trigger" );
    common_scripts\utility::flag_set( "walk" );
}

team1_run_trigger()
{
    var_0 = getent( "team1_run", "script_noteworthy" );
    var_0 waittill( "trigger" );
    common_scripts\utility::flag_set( "move_faster" );
}

obj_control_room()
{
    level endon( "use_start" );
    var_0 = 0;
    var_1 = getent( "origin_obj_stairs", "targetname" );
    wait 6;
    objective_add( var_0, "active", &"LAUNCHFACILITY_B_GET_TO_THE_TELEMETRY", var_1.origin );
    objective_current( var_0 );
    common_scripts\utility::flag_wait( "location_change_stairs" );
    var_1 = getent( "origin_obj_breach_telemetry_room", "targetname" );
    objective_position( var_0, var_1.origin );
    common_scripts\utility::flag_wait( "control_room" );
    wait 1;
    objective_state( var_0, "done" );
}

obj_which_way_to_control_room()
{
    var_0 = getent( "pointing_to_control_room", "targetname" );
    var_0 waittill( "trigger" );
    common_scripts\utility::flag_set( "location_change_stairs" );
    thread obj_player_reached_control_room();
}

obj_player_reached_control_room()
{
    var_0 = getent( "control_room", "targetname" );
    var_0 waittill( "trigger" );
    common_scripts\utility::flag_set( "control_room" );
}

obj_plant_the_c4()
{
    common_scripts\utility::flag_wait( "update_objectives" );
    var_0 = 1;
    var_1 = getent( "wall_explosives", "targetname" );
    objective_add( var_0, "active", &"LAUNCHFACILITY_B_PLANT_THE_C4", var_1.origin );
    objective_indentlevel( var_0, 1 );
    objective_current( var_0 );
    common_scripts\utility::flag_wait( "wall_destroyed" );
    wait 1;
    objective_state( var_0, "done" );
    var_0 = 2;
    objective_add( var_0, "active", &"LAUNCHFACILITY_B_CLEAR_ROOM", var_1.origin );
    objective_indentlevel( var_0, 1 );
    objective_current( var_0 );
    maps\_utility::waittill_aigroupcleared( "control_room" );
    objective_state( var_0, "done" );
}

obj_upload_the_abort_codes()
{
    maps\_utility::waittill_aigroupcleared( "control_room" );
    soundscripts\_snd::snd_message( "start_code_input_mix" );
    var_0 = getent( "control_room_friendlies_group", "targetname" );

    if ( isdefined( var_0 ) )
        var_0 maps\_utility::activate_trigger();

    hide_triggers( "control_room_friendlies_group" );
    maps\_utility::radio_dialogue( "grg_clearR" );
    maps\_utility::radio_dialogue( "entercodes" );
    var_1 = 3;
    wait 0.5;
    var_2 = ( 0.0, 0.0, 0.0 );

    if ( !common_scripts\utility::flag( "codes_uploaded" ) )
    {
        var_3 = getent( "keyboard_use_trigger", "targetname" );
        var_2 = var_3.origin;
    }

    objective_add( var_1, "active", &"LAUNCHFACILITY_B_UPLOAD_THE_ABORT_CODES", var_2 );
    objective_current( var_1 );
    common_scripts\utility::flag_wait( "codes_uploaded" );
    var_4 = "Codes uploaded with " + get_remaining_seconds() + " seconds remaining on gameskill " + level.gameskill;
    logstring( var_4 );
    objective_state( var_1, "done" );

    if ( level.usetimer )
        level thread killtimer();

    wait 1;
}

obj_follow_price()
{
    var_0 = 4;
    var_1 = level.price.origin;
    objective_add( var_0, "active", &"LAUNCHFACILITY_B_FOLLOW_PRICE", var_1 );
    objective_current( var_0 );
    level.price thread lock_obj_location( var_0 );
    common_scripts\utility::flag_wait( "at_the_jeep" );
    objective_state( var_0, "done" );
    level notify( "unlock_obj" );
    wait 1;
}

lock_obj_location( var_0 )
{
    level endon( "unlock_obj" );

    for (;;)
    {
        objective_position( var_0, self.origin + ( 0.0, 0.0, 48.0 ) );
        wait 0.5;
    }
}

countdown_begins()
{
    if ( maps\_utility::is_default_start() )
        maps\_utility::wait_for_targetname_trigger( "countdown_start" );

    var_0 = undefined;

    switch ( level.gameskill )
    {
        case 1:
            level.stopwatch = 11;
            level.requried_time_scale = 1.25;
            var_0 = "11mins";
            break;
        case 2:
            level.stopwatch = 11;
            level.requried_time_scale = 1;
            var_0 = "11mins";
            break;
        case 3:
            level.stopwatch = 9;
            level.requried_time_scale = 1;
            var_0 = "9mins";
            break;
        default:
            level.stopwatch = 15;
            level.requried_time_scale = 1.36;
            var_0 = "15mins";
            break;
    }

    common_scripts\utility::flag_wait( "begin_countdown" );

    if ( maps\_utility::is_default_start() )
        maps\_utility::radio_dialogue( var_0 );

    common_scripts\utility::flag_set( "countdown_started" );
    common_scripts\utility::flag_set( "aa_countdown_started" );
    maps\_utility::arcademode_checkpoint( 2, "a" );
    level.price thread maps\_anim::anim_single_queue( level.price, "pri_copythat" );
    level thread starttimer();
    common_scripts\utility::flag_set( "music_start_countdown" );
    level.timer_start_time = gettime();
    soundscripts\_snd::snd_message( "start_hallway_combat_mix" );
}

grigsby_countdown_spam()
{
    common_scripts\utility::flag_wait( "countdown_started" );

    if ( level.stopwatch > 10 )
        thread maps\_utility::flag_set_delayed( "10min_left", level.stopwatch * 60 - 602 );

    thread maps\_utility::flag_set_delayed( "8min_left", level.stopwatch * 60 - 482 );
    thread maps\_utility::flag_set_delayed( "6min_left", level.stopwatch * 60 - 362 );
    thread maps\_utility::flag_set_delayed( "5min_left", level.stopwatch * 60 - 302 );
    thread maps\_utility::flag_set_delayed( "4min_left", level.stopwatch * 60 - 242 );
    thread maps\_utility::flag_set_delayed( "3min_left", level.stopwatch * 60 - 182 );
    thread maps\_utility::flag_set_delayed( "2min_left", level.stopwatch * 60 - 122 );
    thread maps\_utility::flag_set_delayed( "1min_left", level.stopwatch * 60 - 62 );
    level thread grigsby_countdown_dialogue();
}

grigsby_countdown_dialogue()
{
    level endon( "codes_uploaded" );
    common_scripts\utility::flag_wait( "10min_left" );
    maps\_utility::radio_dialogue( "grg_10" );
    common_scripts\utility::flag_wait( "8min_left" );
    maps\_utility::radio_dialogue( "grg_8" );
    common_scripts\utility::flag_wait( "6min_left" );
    maps\_utility::radio_dialogue( "grg_6" );
    common_scripts\utility::flag_wait( "5min_left" );
    maps\_utility::radio_dialogue( "grg_5" );
    common_scripts\utility::flag_wait( "4min_left" );
    maps\_utility::radio_dialogue( "grg_4" );
    common_scripts\utility::flag_wait( "3min_left" );
    maps\_utility::radio_dialogue( "grg_3" );
}

starttimer()
{
    killtimer();
    level endon( "kill_timer" );
    level.hudtimerindex = 20;
    level.timer = maps\_hud_util::get_countdown_hud( undefined, undefined, undefined, undefined, level.stopwatch * 60 );
    level.timer setpulsefx( 30, 900000, 700 );
    level.timer.text.label = &"LAUNCHFACILITY_B_TIME_TILL_ICBM_IMPACT";
    level.timer settenthstimer( level.stopwatch * 60 );
    wait(level.stopwatch * 60);
    common_scripts\utility::flag_set( "timer_expired" );
    maps\_hud_util::destroy_countdown_hud( level.timer );
    soundscripts\_snd::snd_message( "mission_failed" );
    level thread mission_failed_out_of_time();
}

mission_failed_out_of_time()
{
    level.player endon( "death" );
    level endon( "kill_timer" );
    level notify( "mission failed" );
    setdvar( "ui_deadquote", level.missionfailedquote );
    maps\_utility::missionfailedwrapper();
}

killtimer()
{
    level notify( "kill_timer" );

    if ( isdefined( level.timer ) )
        maps\_hud_util::destroy_countdown_hud( level.timer );
}

ai_duct()
{
    self.flashbangimmunity = 1;
    self.interval = 24;
    self allowedstances( "crouch" );
    self.approachconditioncheckfunc = ::air_duct_check_cover_transition;
    self.approachtypefunc = ::air_duct_get_transition_type;
    self.exitconditioncheckfunc = ::air_duct_check_cover_transition;
    self.exittypefunc = ::air_duct_get_transition_type;
    common_scripts\utility::flag_wait( "walk" );
    maps\_utility::cqb_walk( "on" );
    self allowedstances( "stand", "crouch", "prone" );
    self.approachconditioncheckfunc = undefined;
    self.approachtypefunc = undefined;
    self.exitconditioncheckfunc = undefined;
    self.exittypefunc = undefined;
    common_scripts\utility::flag_wait( "move_faster" );
    maps\_utility::cqb_walk( "off" );
    self.interval = 60;
}

air_duct_check_cover_transition( var_0 )
{
    return 1;
}

air_duct_get_transition_type( var_0 )
{
    return "exposed_crouch_crouchwalk";
}

vent_friendlies_group1_spawner_think()
{
    thread maps\_utility::magic_bullet_shield();
    self.grenadeammo = 0;
    maps\_utility::cqb_walk( "on" );
    self allowedstances( "stand", "crouch", "prone" );
    maps\_utility::waittill_aigroupcleared( "vent_enemies_group1" );
    maps\_utility::activate_trigger_with_targetname( "vent_friendlies_group1_move" );
    maps\_utility::cqb_walk( "off" );
    wait 1;
    common_scripts\utility::waittill_any_ents( self, "goal", level, "player_out_of_vents" );
    maps\_utility::stop_magic_bullet_shield();
    self delete();
}

vent_enemies_group1_spawner_think()
{
    self endon( "death" );
    self.grenadeammo = 0;
    thread delete_on_damage();
    wait 10;
    self delete();
}

delete_on_damage()
{
    self endon( "death" );
    self waittill( "damage" );
    self delete();
}

vent_friendlies_group2_spawner_think()
{
    thread maps\_utility::magic_bullet_shield();
    maps\_utility::waittill_aigroupcleared( "vent_enemies_group2" );
    maps\_utility::activate_trigger_with_targetname( "vent_friendlies_group2_move" );
    wait 1;
    common_scripts\utility::waittill_any_ents( self, "goal", level, "player_out_of_vents" );
    maps\_utility::stop_magic_bullet_shield();
    self delete();
}

vent_enemies_group2_spawner_think()
{
    self.health = 2;
    wait 10;

    if ( isalive( self ) )
        self kill();
}

vent_trigger_friendlies_vent_jump()
{
    var_0 = getent( "price_grigsby_jump", "targetname" );
    var_0 waittill( "trigger" );
    thread vent_friendlies_vent_jump();
    thread vent_grisby_vent_jump();
}

vent_trigger_team1_vent_jump()
{
    var_0 = getent( "team1_jump", "targetname" );
    var_0 waittill( "trigger" );
    wait 1;
    thread vent_team1_vent_jump();
}

vent_friendlies_vent_jump()
{
    common_scripts\utility::flag_set( "grisby_jump" );
    var_0 = getent( "vent_jump_animent", "targetname" );
    var_0 maps\_anim::anim_reach_solo( level.price, "vent_drop_l" );
    var_0 maps\_anim::anim_single_solo( level.price, "vent_drop_l" );
    level.price maps\_utility::set_force_color( "r" );
    wait 0.5;
    maps\_utility::activate_trigger_with_targetname( "grigsby_price_setup_shower" );
}

vent_grisby_vent_jump()
{
    common_scripts\utility::flag_wait( "grisby_jump" );
    var_0 = getent( "vent_jump_animent", "targetname" );
    var_0 maps\_anim::anim_reach_solo( level.grigsby, "vent_drop_r" );
    var_0 maps\_anim::anim_single_solo( level.grigsby, "vent_drop_r" );
    level.grigsby maps\_utility::set_force_color( "o" );
}

vent_team1_vent_jump()
{
    var_0 = getent( "vent_jump_animent", "targetname" );
    var_0 maps\_anim::anim_single_solo( level.team1[0], "vent_drop_team1" );
    level.team1[0] maps\_utility::set_force_color( "y" );
    maps\_utility::activate_trigger_with_targetname( "team1_setup_shower" );
}

hide_triggers_1st_floor()
{
    var_0 = getent( "attacking_1st_floor", "targetname" );
    var_0 waittill( "trigger" );
    level thread hide_triggers( "attacking_1st_floor" );
    common_scripts\utility::flag_clear( "aa_first_floor" );
    common_scripts\utility::flag_set( "aa_warehouse" );
    maps\_utility::arcademode_checkpoint( 3, "b" );
}

warehouse_retreating_enemies_think()
{
    self endon( "death" );
    self waittill( "goal" );
    self delete();
}

warehouse_trigger_kill_allied_teammate()
{
    var_0 = getent( "kill_yellow_allied", "targetname" );
    var_0 waittill( "trigger" );

    if ( isalive( level.team1[0] ) )
        level.team1[0] kill();
}

warehouse_trigger_kill_enemies()
{
    var_0 = getent( "warehouse_killer", "targetname" );
    var_0 waittill( "trigger" );
    thread warehouse_kill_all_enemy();
    common_scripts\utility::flag_clear( "aa_warehouse" );
    common_scripts\utility::flag_set( "aa_launchtubes" );
    maps\_utility::arcademode_checkpoint( 3, "c" );
}

warehouse_kill_all_enemy()
{
    var_0 = getent( "killer_warehouse", "targetname" );
    var_1 = getaiarray( "axis" );

    for ( var_2 = 0; var_2 < var_1.size; var_2++ )
    {
        if ( var_1[var_2] istouching( var_0 ) )
            var_1[var_2] dodamage( var_1[var_2].health + 1000, var_1[var_2].origin );
    }
}

play_sound_on_speaker( var_0, var_1 )
{
    var_2 = getentarray( "speaker", "targetname" );

    if ( isdefined( var_1 ) )
    {
        level notify( "speaker_interrupt" );

        for ( var_3 = 0; var_3 < var_2.size; var_3++ )
            var_2[var_3] stopsounds();

        wait 0.5;
    }
    else if ( common_scripts\utility::flag( "speakers_active" ) )
        return;

    level endon( "speaker_interrupt" );
    common_scripts\utility::flag_set( "speakers_active" );
    var_2 = common_scripts\utility::get_array_of_closest( level.player.origin, var_2, undefined, 2 );
    var_2[0] playsound( var_0, "sounddone", 1 );
    var_2[1] playsound( var_0 );
    var_2[0] waittill( "sounddone" );
    common_scripts\utility::flag_clear( "speakers_active" );
}

launch_tube_dialogue()
{
    var_0 = getent( "times_running_out", "targetname" );
    var_0 waittill( "trigger" );
    maps\_utility::radio_dialogue( "grg_gottamove" );
    level endon( "speaker_interrupt" );
    wait 2;
    play_sound_on_speaker( "launchfacility_b_rul_storagearea" );
    play_sound_on_speaker( "launchfacility_b_rul_primaryinititated" );
    play_sound_on_speaker( "launchfacility_b_rul_securemissilebay" );
    maps\_utility::radio_dialogue( "grg_goinon" );
    maps\_utility::radio_dialogue( "startedcountdown" );
}

rocket_powering_up()
{
    var_0 = getent( "rocket_power_up", "targetname" );
    var_0 waittill( "trigger" );
    play_sound_on_speaker( "launchfacility_b_rul_30secs" );
    soundscripts\_snd::snd_message( "start_missile_silo_mix" );
    wait(randomfloatrange( 0.2, 1.2 ));

    while ( !common_scripts\utility::flag( "blast_door_player_clip_off" ) )
    {
        earthquake( 0.05, 1, level.player.origin, 1024 );
        wait 0.2;
    }
}

launchtubes_teleport_friendlies()
{
    var_0 = getent( "teleport_the_team", "targetname" );
    var_0 waittill( "trigger" );
    common_scripts\utility::flag_set( "10sec_till_blastoff" );
    level.player setthreatbiasgroup( "player" );
    setignoremegroup( "allies", "axis" );
    setignoremegroup( "axis", "allies" );
    thread launchtubes_clear();
    hide_triggers( "countdown_remove" );
    var_1 = getent( "launchtubes_teleport_price", "targetname" );
    level.price.a.disablepain = 1;
    level.price forceteleport( var_1.origin, var_1.angles );
    level.price.grenadeawareness = 0;
    var_2 = getent( "launchtubes_teleport_grigsby", "targetname" );
    level.grigsby.a.disablepain = 1;
    level.grigsby forceteleport( var_2.origin, var_2.angles );
    level.grigsby pushplayer( 1 );
    level.grigsby.grenadeawareness = 0;
    setsaveddvar( "ai_friendlyFireBlockDuration", 0 );
    common_scripts\utility::flag_set( "price_close_door" );
    level.grigsby thread guard_the_vaultdoors_grigsby();
    common_scripts\utility::flag_set( "start_missile_alarm" );
    thread rocket_powering_up_dialogue();
    maps\_utility::radio_dialogue( "pri_gogogo1" );
}

launchtubes_effects()
{
    common_scripts\utility::flag_wait( "10sec_till_blastoff" );
    common_scripts\_exploder::exploder( 1 );
}

launchtubes_clear()
{
    var_0 = getent( "kill_hallway_enemies", "targetname" );
    var_1 = getaiarray( "axis" );

    for ( var_2 = 0; var_2 < var_1.size; var_2++ )
    {
        if ( var_1[var_2] istouching( var_0 ) )
            var_1[var_2] dodamage( var_1[var_2].health + 1000, var_1[var_2].origin );
    }
}

rocket_powering_up_dialogue()
{
    wait 1;
    play_sound_on_speaker( "launchfacility_b_rul_ten", 1 );
    play_sound_on_speaker( "launchfacility_b_rul_nine" );
    play_sound_on_speaker( "launchfacility_b_rul_eight" );
    play_sound_on_speaker( "launchfacility_b_rul_seven" );
    play_sound_on_speaker( "launchfacility_b_rul_six" );
    play_sound_on_speaker( "launchfacility_b_rul_five" );
    wait 0.3;
    play_sound_on_speaker( "launchfacility_b_rul_four" );
    wait 0.3;
    play_sound_on_speaker( "launchfacility_b_rul_three" );
    wait 0.3;
    play_sound_on_speaker( "launchfacility_b_rul_two" );
    wait 0.3;
    play_sound_on_speaker( "launchfacility_b_rul_one" );
    play_sound_on_speaker( "launchfacility_b_rul_launchcomplete" );
    wait 1;
    thread kill_player_in_tubes();
}

launchtubes_missile_alarm()
{
    common_scripts\utility::flag_wait( "start_missile_alarm" );
    var_0 = getent( "alarm_missile_warning", "targetname" );
    var_0 playsound( "emt_alarm_missile_warning" );
}

in_volume()
{
    var_0 = getent( "shut_blast_door", "targetname" );

    for (;;)
    {
        var_0 waittill( "trigger" );
        var_1 = getaiarray( "allies" );
        var_2 = 0;

        for ( var_3 = 0; var_3 < var_1.size; var_3++ )
        {
            if ( var_1[var_3] istouching( var_0 ) )
                var_2++;
        }

        if ( var_2 == var_1.size )
            return;
    }
}

run_to_the_door()
{
    level thread guard_the_vaultdoors();
    var_0 = getent( "close_blastdoor_animent", "targetname" );
    var_1 = getent( "blast_door_slam", "targetname" );
    var_2 = getent( "blast_door_col", "targetname" );
    var_2 linkto( var_1, "hinge_jnt", ( 0.0, 0.0, 0.0 ), ( 0.0, 0.0, 0.0 ) );
    var_3 = getent( "shut_blast_door", "targetname" );
    wait 2;
    var_1.animname = "door";
    var_1 maps\_anim::setanimtree();
    var_0 maps\_anim::anim_first_frame_on_guy( var_1, "blast_door_close", var_0.origin, var_0.angles );
    wait 2;
    common_scripts\utility::flag_wait( "price_close_door" );
    var_0 maps\_anim::anim_reach_solo( level.price, "blast_door_runto" );
    var_0 maps\_anim::anim_single_solo( level.price, "blast_door_runto" );
    var_0 thread maps\_anim::anim_loop_solo( level.price, "blast_door_wave", undefined, "stop_idle" );
    thread price_warning();
    level.player in_volume();
    var_0 notify( "stop_idle" );
    common_scripts\utility::flag_set( "blast_door_player_clip_on" );
    common_scripts\utility::flag_set( "walk" );
    var_4 = [];
    var_4[0] = var_1;
    var_4[1] = level.price;
    level thread launchtubes_hatch_close_sound();
    var_0 maps\_anim::anim_single( var_4, "blast_door_close" );
    common_scripts\utility::flag_set( "blast_door_player_clip_off" );
    common_scripts\utility::flag_set( "open_vault_doors" );
    soundscripts\_snd::snd_message( "start_vault_doors_mix" );

    switch ( level.gameskill )
    {
        case 1:
            autosave_by_name_wraper( "escaped_the_silos", 3.25 );
            break;
        case 2:
            autosave_by_name_wraper( "escaped_the_silos", 3.5 );
            break;
        case 3:
            autosave_by_name_wraper( "escaped_the_silos", 3 );
            break;
        default:
            autosave_by_name_wraper( "escaped_the_silos", 3.75 );
            break;
    }

    level thread hide_triggers( "kill_tube_volume" );
    level thread kill_enemy_in_tubes();
    var_2 disconnectpaths();
}

price_warning()
{
    maps\_utility::radio_dialogue( "pri_movemove" );
}

launchtubes_hatch_close_sound()
{
    wait 0.5;
    level.price playsound( "scn_door_launchb_hatch_close" );
    level.player playsound( "scn_launchb_missile_launch" );
    common_scripts\_exploder::exploder( 2 );
    maps\_utility::stop_exploder( 1 );
    var_0 = getent( "inc_fireball_sfx", "targetname" );
    var_0 playsound( "h1_launchtube_fireball" );
    level thread fireballdlight();
    level thread kill_launchtube_steam_fx();
    thread rockets_launch();
}

rockets_launch()
{
    for ( var_0 = 0.15; var_0 > 0; var_0 -= 0.001 )
    {
        earthquake( var_0, 0.1, level.player.origin, 256 );
        wait 0.1;
    }
}

fireballdlight()
{
    var_0 = 2;
    var_1 = spawn( "script_model", ( 395.177, 2955.42, -300.614 ) );
    var_1 setmodel( "tag_origin" );
    playfxontag( level._effect["launchtube_fire_light"], var_1, "tag_origin" );
    var_1 moveto( ( -524.0, 3898.0, -292.0 ), var_0, 0, 1 );
    wait(var_0);
    var_1 delete();
}

kill_player_in_tubes()
{
    var_0 = getent( "kill_player_tubes", "targetname" );

    if ( level.player istouching( var_0 ) )
    {
        level.player playsound( "scn_launchb_missile_launch" );
        level.player enablehealthshield( 0 );
        level.player thread player_death_effect();
        wait 1;
        level.player dodamage( level.player.health + 1000, level.player.origin );
    }
}

player_death_effect()
{
    var_0 = getent( "player", "classname" );
    playfx( level._effect["player_death_explosion"], var_0.origin );
    earthquake( 1, 1, level.player.origin, 100 );
}

kill_launchtube_steam_fx()
{
    var_0 = maps\_utility::getfxarraybyid( "steam_jet_med_loop" );
    var_0 = common_scripts\utility::array_combine( var_0, maps\_utility::getfxarraybyid( "hallway_steam_loop" ) );
    var_0 = common_scripts\utility::array_combine( var_0, maps\_utility::getfxarraybyid( "steam_jet_med_loop_rand" ) );

    for ( var_1 = 0; var_1 < var_0.size; var_1++ )
        var_0[var_1] common_scripts\utility::pauseeffect();
}

blast_door_clip()
{
    var_0 = getent( "blast_player_clip", "targetname" );
    var_0 notsolid();
    common_scripts\utility::flag_wait( "blast_door_player_clip_on" );
    var_0 solid();
    common_scripts\utility::flag_wait( "blast_door_player_clip_off" );
    var_0 notsolid();
}

kill_enemy_in_tubes()
{
    var_0 = getent( "killer_tubes", "targetname" );
    var_1 = getaiarray( "axis" );

    for ( var_2 = 0; var_2 < var_1.size; var_2++ )
    {
        if ( var_1[var_2] istouching( var_0 ) )
            var_1[var_2] dodamage( var_1[var_2].health + 1000, var_1[var_2].origin );
    }
}

guard_the_vaultdoors()
{
    var_0 = getent( "guard_vaultdoors", "targetname" );
    common_scripts\utility::flag_wait( "open_vault_doors" );
    var_1[0] = level.price;
    var_1[1] = level.grigsby;
    level.grigsby setisforcedincombat( 0 );
    var_0 maps\_anim::anim_reach( var_1, "guard_vaultdoors" );
    var_0 maps\_anim::anim_single( var_1, "guard_vaultdoors" );
}

returnexposedcrouch()
{
    return "exposed_crouch";
}

guard_the_vaultdoors_grigsby_wait_for_approach( var_0 )
{
    self endon( "killanimscript" );
    self endon( "abort_approach" );
    animscripts\shared::donotetracks( "coverArrival" );
    self setisforcedincombat( 1 );
    common_scripts\utility::flag_set( "vaultdoors_grigs_approach_done" );
}

guard_the_vaultdoors_grigsby()
{
    level endon( "open_vault_doors" );
    var_0 = getent( "guard_vaultdoors", "targetname" );
    level.grigsby.approachtypefunc = ::returnexposedcrouch;
    level.grigsby.a.dontstartaim = 1;
    var_0 maps\_anim::anim_reach_and_approach_solo( level.grigsby, "guard_vaultdoors" );
    common_scripts\utility::flag_init( "vaultdoors_grigs_approach_done" );
    level.grigsby thread guard_the_vaultdoors_grigsby_wait_for_approach( var_0 );

    while ( level.grigsby.script == "cover_arrival" )
        wait 0.05;

    level.grigsby.a.dontstartaim = undefined;
    level.grigsby.approachtypefunc = undefined;

    if ( !common_scripts\utility::flag( "vaultdoors_grigs_approach_done" ) )
        self setisforcedincombat( 1 );
}

vault_doors_dialogue()
{
    common_scripts\utility::flag_wait( "open_vault_doors" );

    if ( getdvarint( "use_old_vaultdoors" ) != 1 )
        wait 3;

    maps\_utility::radio_dialogue( "controlbasesec" );

    if ( getdvarint( "use_old_vaultdoors" ) != 1 )
        return;

    level.price maps\_anim::anim_single_queue( level.price, "pri_atdoor" );
    maps\_utility::radio_dialogue( "workinonit" );
    wait 2;
    maps\_utility::radio_dialogue( "almostthere" );
    wait 2;
    maps\_utility::radio_dialogue( "gotit" );
    thread vault_doors_team_ready();
    wait 0.5;
    common_scripts\utility::flag_set( "vault_doors_unlocked" );
    wait 8;
    level.grigsby maps\_anim::anim_single_queue( level.grigsby, "grg_shittinme" );
    maps\_utility::radio_dialogue( "pri_faster" );
    maps\_utility::radio_dialogue( "gm1_trypulling" );
    level.price thread maps\_anim::anim_single_queue( level.price, "pri_cheeky" );
    vault_door_scene_completed();
}

vault_door_scene_completed()
{
    switch ( level.gameskill )
    {
        case 1:
            autosave_by_name_wraper( "vault_doors_are_opening", 2.4 );
            break;
        case 2:
            autosave_by_name_wraper( "vault_doors_are_opening", 2.75 );
            break;
        case 3:
            autosave_by_name_wraper( "vault_doors_are_opening", 2.1 );
            break;
        default:
            autosave_by_name_wraper( "vault_doors_are_opening", 2.4 );
            break;
    }

    setsaveddvar( "ai_friendlyFireBlockDuration", 2000 );
    level.price.a.disablepain = 0;
    level.price.grenadeawareness = 0.9;
    level.grigsby.a.disablepain = 0;
    level.grigsby.grenadeawareness = 0.9;
    setthreatbias( "allies", "axis", 0 );
    setthreatbias( "axis", "allies", 0 );
}

vault_doors_open()
{
    common_scripts\utility::flag_wait( "vault_doors_unlocked" );
    var_0 = getent( "vault_door_left", "targetname" );
    var_1 = getent( var_0.target, "targetname" );
    var_1 linkto( var_0 );
    var_2 = getent( "vault_door_sfx", "targetname" );
    var_2 playsound( "scn_vault_door_open" );
    var_3 = getent( "vault_door_right", "targetname" );
    var_4 = getent( var_3.target, "targetname" );
    var_4 linkto( var_3 );
    wait 1;
    var_0 rotateyaw( -0.3, 0.05 );
    var_3 rotateyaw( 0.3, 0.05 );
    var_0 playsound( "mtl_steam_pipe_burst" );
    var_3 playsound( "expl_steam_pipe_body" );
    wait 1;
    var_0 playsound( "expl_steam_pipe_body" );
    wait 2;
    var_3 playsound( "expl_steam_pipe_body" );
    var_0 playsound( "gate_open" );
    var_0 rotateyaw( -50, 40, 0, 40 );
    var_3 rotateyaw( 50, 40, 0, 40 );
    wait 20;
    var_0 rotateyaw( -50, 30, 0, 30 );
    var_3 rotateyaw( 50, 30, 0, 30 );
    common_scripts\utility::flag_clear( "aa_launchtubes" );
    maps\_utility::arcademode_checkpoint( 5, "d" );
    common_scripts\utility::flag_set( "vault_door_opened" );
    common_scripts\utility::flag_set( "move_faster" );
    common_scripts\utility::flag_set( "aa_blow_the_wall" );
    var_1 connectpaths();
    var_4 connectpaths();
}

vault_doors_team_ready()
{
    level.price maps\_utility::set_force_color( "r" );
    level.grigsby maps\_utility::set_force_color( "o" );
    maps\_utility::activate_trigger_with_targetname( "setup_for_vault_doors_opening" );
}

spawn_utility_enemies()
{
    common_scripts\utility::flag_wait( "vault_door_opened" );
    var_0 = getentarray( "utility_enemies", "script_noteworthy" );
    common_scripts\utility::array_thread( var_0, maps\_utility::spawn_ai );
    thread blow_the_wall_dialogue();
}

preparing_to_breach()
{
    level.player endon( "death" );
    maps\_utility::waittill_aigroupcleared( "utility_badies" );
    level thread hide_triggers( "attacking" );
    maps\_utility::activate_trigger_with_targetname( "protect_the_c4" );
}

blow_the_wall_dialogue()
{
    var_0 = getent( "plant_explosives_dialogue", "targetname" );
    var_0 waittill( "trigger" );
    level.price maps\_anim::anim_single_queue( level.price, "status" );
    maps\_utility::radio_dialogue( "gm2_inposition" );
    level.price thread maps\_anim::anim_single_queue( level.price, "pri_plantexplos" );
    common_scripts\utility::flag_set( "update_objectives" );
    thread plant_the_c4();

    switch ( level.gameskill )
    {
        case 1:
            autosave_by_name_wraper( "time_to_breach_war_room", 1 );
            break;
        case 2:
            autosave_by_name_wraper( "time_to_breach_war_room", 1.15 );
            break;
        case 3:
            autosave_by_name_wraper( "time_to_breach_war_room", 0.75 );
            break;
        default:
            autosave_by_name_wraper( "time_to_breach_war_room", 1.3 );
            break;
    }
}

plant_the_c4()
{
    level.player endon( "death" );
    var_0 = getent( "wall_explosives", "targetname" );
    var_0 maps\_c4::c4_location( undefined, ( 0.0, 0.0, 0.0 ), ( 0.0, 0.0, 0.0 ), var_0.origin );
    var_0 waittill( "c4_planted" );
    level notify( "wall_c4_planted" );
    thread griggs_c4_take_cover_path();
    maps\_utility::activate_trigger_with_targetname( "take_cover" );
    var_0 waittill( "c4_detonation" );
    thread blow_the_wall();
}

griggs_c4_take_cover_path()
{
    level.grigsby endon( "death" );
    level.grigsby maps\_utility::disable_ai_color();
    var_0 = getnode( "griggs_c4_take_cover_start", "targetname" );
    level.grigsby thread maps\_utility::follow_path( var_0 );
    level.grigsby waittill( "reached_path_end" );
    level.grigsby maps\_utility::enable_ai_color();
    level.grigsby.disable_tight_turn = 1;
    var_1 = getnode( var_0.target, "targetname" );

    for (;;)
    {
        if ( distancesquared( level.grigsby.origin, var_1.origin ) > 90000 )
            break;

        wait 0.05;
    }

    level.grigsby.disable_tight_turn = undefined;
}

blow_the_wall()
{
    var_0 = getent( "blasted_wall", "targetname" );
    var_0 connectpaths();
    common_scripts\_exploder::exploder( 100 );
    var_1 = getent( "wall_explosives", "targetname" );
    playfx( level.wallexplosionsmall_fx, var_1.origin );
    thread common_scripts\utility::play_sound_in_space( "h1_c4_explosion_main", var_1.origin );
    radiusdamage( var_1.origin, 256, 200, 50 );
    earthquake( 0.4, 1, var_1.origin, 1000 );
    common_scripts\utility::flag_set( "wall_destroyed" );
    common_scripts\utility::flag_clear( "aa_blow_the_wall" );
    common_scripts\utility::flag_set( "aa_upload_them_codes" );
    wait 1;
    maps\_utility::activate_trigger_with_targetname( "breaching_control_room" );
    maps\_utility::radio_dialogue( "pri_gogogo2" );
    maps\_utility::radio_dialogue( "movingin" );
    soundscripts\_snd::snd_message( "start_control_room_mix" );
}

spawn_telemetry_enemies()
{
    common_scripts\utility::flag_wait( "wall_destroyed" );
    var_0 = getentarray( "telemetry_enemies", "script_noteworthy" );
    common_scripts\utility::array_thread( var_0, maps\_utility::spawn_ai );
}

spawn_telemetry_friendlies()
{
    var_0 = getentarray( "team2", "script_noteworthy" );
    common_scripts\utility::array_thread( var_0, maps\_utility::add_spawn_function, ::telemetry_friendlies_think );
    common_scripts\utility::flag_wait( "wall_destroyed" );
    common_scripts\utility::array_thread( var_0, maps\_utility::spawn_ai );
    maps\_utility::activate_trigger_with_targetname( "control_room_friendlies_attack" );
}

telemetry_friendlies_think()
{
    self endon( "death" );
    thread maps\_utility::magic_bullet_shield();
    common_scripts\utility::flag_wait( "delete_team2" );
    maps\_utility::stop_magic_bullet_shield();
    self delete();
}

upload_codes_h1()
{
    var_0 = getent( "keyboard_use_trigger", "targetname" );
    var_0 common_scripts\utility::trigger_off();
    var_1 = getent( "keyboard_use_trigger_h1", "targetname" );
    var_2 = spawn( "script_model", level.keyboard.origin );
    var_2.angles = ( 0.0, 315.0, 0.0 );
    var_2 setmodel( "com_computer_keyboard" );
    maps\_utility::waittill_aigroupcleared( "control_room" );
    var_3 = 0.05;
    var_4 = 0;
    var_5 = 3;
    var_6 = spawn( "script_model", level.keyboard.origin );
    var_6.angles = ( 0.0, 315.0, 0.0 );
    var_6 setmodel( "com_computer_keyboard_obj" );
    var_7 = spawn( "script_origin", ( -2662.0, 4452.0, -387.0 ) );
    var_7.angles = ( 0.0, 138.0, 0.0 );
    var_8 = ( -2647.0, 4430.0, -391.0 );
    var_9 = ( 0.0, 138.0, 0.0 );
    var_10 = cos( 30 );

    for (;;)
    {
        var_11 = level.player getvieworigin();
        var_12 = level.player getplayerangles();

        if ( level.player isleaning() || !level.player istouching( var_1 ) || !common_scripts\utility::within_fov( var_11, var_12, var_0.realorigin, var_10 ) )
        {
            var_1 sethintstring( " " );
            waitframe();
            continue;
        }

        var_1 sethintstring( &"LAUNCHFACILITY_B_HINT_UPLOAD_CODES" );

        if ( !level.player usebuttonpressed() )
        {
            waitframe();
            continue;
        }

        var_1 sethintstring( " " );
        level.player allowcrouch( 0 );
        level.player allowprone( 0 );
        level.player disableweapons();
        level.player freezecontrols( 1 );
        level.player allowlean( 0 );
        var_13 = maps\_utility::spawn_anim_model( "player" );
        var_13 hide();
        var_7 maps\_anim::anim_first_frame_solo( var_13, "typing_abort_codes" );
        var_13 maps\_utility::lerp_player_view_to_tag_smoothly( "tag_player", 0.5, 1, 0, 0, 0, 0 );
        var_13 show();
        level.player playsound( "scn_enter_code_typing" );
        var_7 thread maps\_anim::anim_single_solo( var_13, "typing_abort_codes" );
        level.player startprogressbar( var_5 );
        level.player.progresstext settext( &"LAUNCHFACILITY_B_UPLOADING_CODES" );
        var_14 = 0;
        level thread h1_typing_dof_start();

        for (;;)
        {
            if ( !level.player usebuttonpressed() )
                break;

            var_4 += var_3;
            level.player setprogressbarprogress( var_4 / var_5 );

            if ( var_4 >= var_5 )
            {
                var_14 = 1;
                break;
            }

            wait(var_3);
        }

        level thread h1_typing_dof_stop();
        level.player endprogressbar();
        level.player stopsounds( "scn_enter_code_typing" );
        level.player freezecontrols( 0 );
        level.player enableweapons();
        var_13 hide();
        maps\_utility::lerp_player_view_to_position_oldstyle( var_8, var_9, 0.5, 1, 0, 0, 0, 0 );
        var_13 delete();
        level.player allowcrouch( 1 );
        level.player allowprone( 1 );
        level.player allowlean( 1 );

        if ( var_14 )
            break;

        waitframe();
    }

    level.player playsound( "h1_scn_enter_press" );
    soundscripts\_snd::snd_message( "start_missile_stopped_mix" );
    var_0 delete();
    var_6 delete();
    common_scripts\utility::flag_set( "codes_uploaded" );
    common_scripts\utility::flag_clear( "aa_countdown_started" );
    common_scripts\utility::flag_clear( "aa_upload_them_codes" );
    maps\_utility::autosave_by_name( "Codes have been uploaded" );
    maps\_utility::arcademode_checkpoint( 4, "e" );
}

upload_codes()
{
    var_0 = getent( "keyboard_use_trigger", "targetname" );
    var_0 common_scripts\utility::trigger_off();
    maps\_utility::waittill_aigroupcleared( "control_room" );
    var_1 = 0.05;
    var_2 = 0;
    var_3 = 3;
    var_0 common_scripts\utility::trigger_on();
    var_0 sethintstring( &"LAUNCHFACILITY_B_HINT_UPLOAD_CODES" );
    var_0 usetriggerrequirelookat();
    var_4 = spawn( "script_model", level.keyboard.origin );
    var_4.angles = ( 0.0, 315.0, 0.0 );
    var_4 setmodel( "com_computer_keyboard_obj" );

    for (;;)
    {
        var_0 waittill( "trigger" );
        level.player disableweapons();
        level.player freezecontrols( 1 );
        level.player playsound( "scn_enter_code_typing" );
        var_0 common_scripts\utility::trigger_off();
        level.player startprogressbar( var_3 );
        level.player.progresstext settext( &"LAUNCHFACILITY_B_UPLOADING_CODES" );
        var_5 = 0;

        for (;;)
        {
            if ( !level.player usebuttonpressed() )
                break;

            var_2 += var_1;
            level.player setprogressbarprogress( var_2 / var_3 );

            if ( var_2 >= var_3 )
            {
                var_5 = 1;
                break;
            }

            wait(var_1);
        }

        level.player endprogressbar();

        if ( var_5 )
            break;

        level.player stopsounds( "scn_enter_code_typing" );
        var_0 common_scripts\utility::trigger_on();
        level.player freezecontrols( 0 );
        level.player enableweapons();
    }

    level.player enableweapons();
    level.player freezecontrols( 0 );
    level.player stopsounds( "scn_enter_code_typing" );
    level.player playsound( "h1_scn_enter_press" );
    soundscripts\_snd::snd_message( "start_missile_stopped_mix" );
    var_0 delete();
    var_4 delete();
    var_6 = spawn( "script_model", level.keyboard.origin );
    var_6.angles = ( 0.0, 315.0, 0.0 );
    var_6 setmodel( "com_computer_keyboard" );
    common_scripts\utility::flag_set( "codes_uploaded" );
    common_scripts\utility::flag_clear( "aa_countdown_started" );
    common_scripts\utility::flag_clear( "aa_upload_them_codes" );
    maps\_utility::autosave_by_name( "Codes have been uploaded" );
    maps\_utility::arcademode_checkpoint( 4, "e" );
}

startprogressbar( var_0 )
{
    self.progresstext = createsecondaryprogressbartext();
    self.progressbar = createsecondaryprogressbar();
}

setprogressbarprogress( var_0 )
{
    if ( var_0 > 1 )
        var_0 = 1;

    self.progressbar maps\_hud_util::updatebar( var_0 );
}

endprogressbar()
{
    self notify( "progress_bar_ended" );
    self.progresstext maps\_hud_util::destroyelem();
    self.progressbar maps\_hud_util::destroyelem();
}

createsecondaryprogressbar()
{
    var_0 = maps\_hud_util::h1_createbar( level.secondaryprogressbarx, level.secondaryprogressbary, 114, 14, "h1_hud_upload_codes_border", "h1_hud_upload_codes_blur", "white" );
    var_0 maps\_hud_util::setpoint( "CENTER", undefined, 0, level.secondaryprogressbary );
    return var_0;
}

createsecondaryprogressbartext()
{
    var_0 = maps\_hud_util::createfontstring( "objective", level.secondaryprogressbarfontsize );
    var_0 maps\_hud_util::setpoint( "CENTER", undefined, 0, level.secondaryprogressbartexty );
    return var_0;
}

control_room_dialogue()
{
    common_scripts\utility::flag_wait( "codes_uploaded" );
    level thread show_triggers( "escape" );
    thread telemetry_doors_open();
    thread escape_doors_open();
    thread grigsby_warning();
    thread delete_controlroom_friendlies();
    maps\_utility::radio_dialogue( "hqr_confirm" );
    wait 2;
    maps\_utility::radio_dialogue( "hqr_standby" );
    wait 1;
    common_scripts\utility::flag_set( "successful_confirmation" );
    maps\_utility::radio_dialogue( "hqr_confdest" );
    common_scripts\utility::flag_set( "zakhaev_leaving" );
    maps\_utility::radio_dialogue( "checkfeed2" );
    maps\_utility::radio_dialogue( "sendcoordinates" );
    level.price thread maps\_anim::anim_single_queue( level.price, "vehicledepot" );
    thread follow_price();
    level.price maps\_anim::anim_single_queue( level.price, "pri_outtahere" );
    common_scripts\utility::flag_set( "aa_follow_price_end_level" );
    maps\_utility::radio_dialogue( "exfilfromarea" );
}

control_room_noradscreen()
{
    common_scripts\utility::flag_wait( "change_films" );
    var_0 = getent( "noradscreen", "targetname" );
    var_0 delete();
}

control_room_bigscreen()
{
    common_scripts\utility::flag_wait( "zakhaev_leaving" );
    common_scripts\utility::flag_set( "change_films" );
    setsaveddvar( "cg_cinematicFullScreen", "0" );
    cinematicingame( "zakhaev_escape" );
}

control_room_screen_h1()
{
    var_0 = getent( "display_name_sfx", "targetname" );
    var_1 = getent( "noradscreen", "targetname" );
    var_1 delete();
    level waittill( "wall_c4_planted" );
    setsaveddvar( "cg_cinematicFullScreen", "0" );
    cinematicingameloop( "h1_icbm_norad_screen" );
    common_scripts\utility::flag_wait( "codes_uploaded" );
    cinematicingameloop( "h1_icbm_norad_screen_abort" );
    common_scripts\utility::flag_wait( "zakhaev_leaving" );
    common_scripts\utility::flag_set( "change_films" );
    cinematicingame( "zakhaev_escape" );
    var_0 maps\_utility::play_sound_on_entity( "h1_Inchb_display_on" );
    maps\_utility::delaythread( 8.5, ::play_display_change_sfx );
    maps\_utility::delaythread( 13.75, ::play_display_change_sfx );
    maps\_utility::delaythread( 24.25, ::play_display_change_sfx );
    maps\_utility::delaythread( 28.25, ::play_display_change_sfx );

    while ( iscinematicplaying() )
        wait 0.05;

    cinematicingameloop( "h1_icbm_norad_screen_abort" );
    var_0 maps\_utility::play_sound_on_entity( "h1_Inchb_display_off" );
}

play_display_change_sfx()
{
    var_0 = getent( "display_name_sfx", "targetname" );
    var_0 maps\_utility::play_sound_on_entity( "h1_Inchb_display_on" );
}

update_keyboard_monitor_screen( var_0, var_1 )
{
    level endon( "stop_update_monitor_material" );

    if ( isdefined( var_1 ) )
        level endon( var_1 );

    level waittill( "wall_c4_planted" );
    var_2 = getent( var_0, "targetname" );
    var_3 = 0;
    var_4 = [];

    switch ( var_0 )
    {
        case "monitor_8":
            var_4[var_4.size] = "mtl_h1_mwr_ch_icbm_consolemonitor8_1";
            var_4[var_4.size] = "mtl_h1_mwr_ch_icbm_consolemonitor8_2";
            var_4[var_4.size] = "mtl_h1_mwr_ch_icbm_consolemonitor8_3";
            var_4[var_4.size] = "mtl_h1_mwr_ch_icbm_consolemonitor8_4";
            break;
        case "monitor_9":
            var_4[var_4.size] = "mtl_h1_mwr_ch_icbm_consolemonitor9_1";
            var_4[var_4.size] = "mtl_h1_mwr_ch_icbm_consolemonitor9_2";
            var_4[var_4.size] = "mtl_h1_mwr_ch_icbm_consolemonitor9_3";
            var_4[var_4.size] = "mtl_h1_mwr_ch_icbm_consolemonitor9_4";
            var_4[var_4.size] = "mtl_h1_mwr_ch_icbm_consolemonitor9_5";
            var_4[var_4.size] = "mtl_h1_mwr_ch_icbm_consolemonitor9_6";
            var_4[var_4.size] = "mtl_h1_mwr_ch_icbm_consolemonitor9_7";
            break;
    }

    for (;;)
    {
        var_2 overridematerial( "mtl_h1_mwr_ch_icbm_consolemonitor5", var_4[var_3] );
        var_3++;

        if ( var_3 == var_4.size )
            var_3 = 0;

        waitframe();
    }
}

telemetry_doors_open()
{
    var_0 = getent( "open_telemetry_door", "targetname" );
    var_0 waittill( "trigger" );
    var_1 = getent( "telemetry_room_door", "targetname" );
    var_1 rotateyaw( -70, 1, 1, 0 );
    var_1 playsound( "gate_open" );
    var_1 connectpaths();
}

escape_doors_open()
{
    var_0 = getent( "open_escape_door", "targetname" );
    var_0 waittill( "trigger" );
    var_1 = getent( "escape_door_right", "targetname" );
    var_2 = getent( var_1.target, "targetname" );
    var_1 moveto( var_2.origin, 3, 1, 2 );
    var_1 connectpaths();
}

follow_price()
{
    soundscripts\_snd::snd_message( "start_escape_facility_mix" );
    maps\_utility::activate_trigger_with_targetname( "escape" );
    level thread obj_follow_price();
    maps\_utility::autosave_by_name( "let's get out of here" );
    maps\_utility::waittill_aigroupcleared( "hallway_escape" );
    maps\_utility::activate_trigger_with_targetname( "escape_hallway" );
}

grigsby_warning()
{
    var_0 = getent( "incoming_enemy", "script_noteworthy" );
    var_0 waittill( "spawned" );
    wait 1;
    level.grigsby maps\_anim::anim_single_queue( level.grigsby, "grg_company" );
}

delete_controlroom_friendlies()
{
    var_0 = getent( "delete_team2", "targetname" );
    var_0 waittill( "trigger" );
    common_scripts\utility::flag_set( "delete_team2" );
}

elevator()
{
    if ( level.start_point != "elevator" )
        maps\_utility::waittill_aigroupcleared( "elevator" );
    else
        wait 1;

    level.price maps\_anim::anim_single_queue( level.price, "pri_movemove" );
    level.anim_ent = getent( "tunnel_animent", "targetname" );

    if ( getdvarint( "use_old_elevator" ) == 1 )
    {
        level.price thread ai_to_elevator( "r" );
        level.grigsby thread ai_to_elevator( "o" );
        level.player in_the_elevator();
    }
    else
    {
        level.anim_ent = common_scripts\utility::spawn_tag_origin();
        level.anim_ent.origin = ( -1145.0, 5781.0, -390.0 );
        level.price thread price_to_elevator( "r" );
        level.grigsby thread griggs_to_elevator( "o" );
        level.player check_elevator();
    }

    level thread elevator_think();
    var_0 = getent( "elevator", "targetname" );
    level.anim_ent linkto( var_0 );
}

elevator_player_clip()
{
    var_0 = getent( "elevator_player_clip", "targetname" );
    var_0 notsolid();
    common_scripts\utility::flag_wait( "elevator_player_clip_on" );
    var_0 solid();
}

price_to_elevator( var_0 )
{
    wait 2;
    level.anim_ent maps\_anim::anim_reach_solo( self, "h1_elevator_run_to_idle1" );
    level.anim_ent maps\_anim::anim_single_solo( self, "h1_elevator_run_to_idle1" );

    if ( !common_scripts\utility::flag( "player_in_elevator" ) )
        level.anim_ent thread maps\_anim::anim_loop_solo( self, "h1_elevator_idle1", undefined, "stop_price_idle1" );

    common_scripts\utility::flag_wait( "player_in_elevator" );
    level.anim_ent notify( "stop_price_idle1" );
    level.anim_ent maps\_anim::anim_single_solo( self, "h1_elevator_runin" );
    level.anim_ent maps\_anim::anim_single_solo( self, "h1_elevator_entering" );
    level.anim_ent thread maps\_anim::anim_loop_solo( self, "h1_elevator_idle2", undefined, "stop_price_idle2" );
    common_scripts\utility::flag_wait( "all_in_elevator" );
    self linkto( level.anim_ent );
    common_scripts\utility::flag_wait( "elevator_dialogue" );
    level.anim_ent notify( "stop_price_idle2" );
    level.anim_ent thread maps\_anim::anim_single_solo( self, "h1_elevator_elevator" );
    var_1 = getent( "elevator_top", "targetname" );
    var_1 waittill( "trigger" );
    wait 2;
    self unlink( level.anim_ent );
    level.anim_ent maps\_anim::anim_single_solo( self, "h1_elevator_runout" );
    maps\_utility::set_force_color( var_0 );
}

griggs_to_elevator( var_0 )
{
    level.anim_ent maps\_anim::anim_reach_solo( self, "h1_elevator_runin" );
    level.anim_ent maps\_anim::anim_single_solo( self, "h1_elevator_runin" );
    level.anim_ent thread maps\_anim::anim_loop_solo( self, "h1_elevator_idle1", undefined, "stop_griggs_idle1" );
    common_scripts\utility::flag_wait( "all_in_elevator" );
    level.anim_ent notify( "stop_griggs_idle1" );
    level.anim_ent thread maps\_anim::anim_loop_solo( self, "h1_elevator_idle2", undefined, "stop_griggs_idle2" );
    self linkto( level.anim_ent );
    common_scripts\utility::flag_wait( "elevator_dialogue" );
    level.anim_ent notify( "stop_griggs_idle2" );
    level.anim_ent thread maps\_anim::anim_single_solo( self, "h1_elevator_elevator" );
    var_1 = getent( "elevator_top", "targetname" );
    var_1 waittill( "trigger" );
    wait 2.5;
    self unlink( level.anim_ent );
    level.anim_ent maps\_anim::anim_single_solo( self, "h1_elevator_runout" );
    maps\_utility::set_force_color( var_0 );
}

check_elevator()
{
    var_0 = getent( "standing_in_elevator", "targetname" );

    for (;;)
    {
        wait 0.05;

        if ( level.player istouching( var_0 ) )
        {
            if ( !common_scripts\utility::flag( "player_in_elevator" ) )
                common_scripts\utility::flag_set( "player_in_elevator" );
        }
        else if ( common_scripts\utility::flag( "player_in_elevator" ) )
            common_scripts\utility::flag_clear( "player_in_elevator" );

        if ( level.player istouching( var_0 ) && level.price istouching( var_0 ) && level.grigsby istouching( var_0 ) )
        {
            common_scripts\utility::flag_set( "all_in_elevator" );
            return;
        }
    }
}

ai_to_elevator( var_0 )
{
    level.anim_ent maps\_anim::anim_reach_solo( self, "elevator_runin" );
    level.anim_ent maps\_anim::anim_single_solo( self, "elevator_runin" );
    level.anim_ent thread maps\_anim::anim_loop_solo( self, "elevator_idle", undefined, "stop_idle" );
    self linkto( level.anim_ent );
    var_1 = getent( "elevator_top", "targetname" );
    var_1 waittill( "trigger" );
    wait 2;
    self unlink( level.anim_ent );
    level.anim_ent notify( "stop_idle" );
    level.anim_ent maps\_anim::anim_single_solo( self, "elevator_runout" );
    maps\_utility::set_force_color( var_0 );
}

in_the_elevator()
{
    var_0 = getent( "standing_in_elevator", "targetname" );

    for (;;)
    {
        var_0 waittill( "trigger" );

        if ( level.price istouching( var_0 ) && level.grigsby istouching( var_0 ) )
            return;
    }
}

linkto_elevator( var_0 )
{
    self linkto( var_0 );
}

elevator_think()
{
    common_scripts\utility::flag_set( "elevator_player_clip_on" );
    var_0 = getent( "elevator", "targetname" );
    var_1 = getentarray( "elevator_lights", "targetname" );
    common_scripts\utility::array_thread( var_1, ::linkto_elevator, var_0 );
    var_2 = getentarray( "elevator_detail", "targetname" );
    common_scripts\utility::array_thread( var_2, ::linkto_elevator, var_0 );
    level.elevator_door_inner_top = getent( "elevator_door_inner_top", "targetname" );
    level.elevator_door_inner_top linkto( var_0 );
    level.elevator_door_inner_bottom = getent( "elevator_door_inner_bottom", "targetname" );
    var_3 = getent( "elevator_door_inner_bottom", "targetname" );
    var_3 movez( -102, 2, 1, 1 );
    var_3 playsound( "scn_elevator_door_close" );
    var_3 maps\_utility::play_sound_on_entity( "scn_launchb_elevator_sequence" );
    var_3 waittill( "movedone" );
    level.elevator_door_inner_bottom linkto( var_0 );
    var_4 = getent( "elevator_door_outside1_bottom", "targetname" );
    var_5 = getent( var_4.target, "targetname" );
    var_4 moveto( var_5.origin, 2, 1, 1 );
    var_6 = getent( "elevator_door_outside2_bottom", "targetname" );
    var_5 = getent( var_6.target, "targetname" );
    var_6 moveto( var_5.origin, 2, 1, 1 );
    var_4 waittill( "movedone" );
    var_0 moveto( level.elevator_upper.origin, 15, 0.5, 0.1 );
    var_0 playsound( "scn_elevator_move" );
    common_scripts\utility::flag_set( "elevator_dialogue" );
    var_0 waittill( "movedone" );
    maps\_utility::autosave_by_name( "On our way" );
    maps\_utility::arcademode_checkpoint( 3, "f" );
    level.elevator_door_inner_top = getent( "elevator_door_inner_top", "targetname" );
    level.elevator_door_inner_top unlink( var_0 );
    level.elevator_door_inner_top = getent( "elevator_door_inner_top", "targetname" );
    var_7 = getent( "elevator_door_inner_top", "targetname" );
    var_7 movez( 102, 2, 1, 1 );
    var_7 connectpaths();
    var_7 playsound( "scn_elevator_door_open" );
    var_7 waittill( "movedone" );
    var_8 = getent( "elevator_door_outside1_top", "targetname" );
    var_5 = getent( var_8.target, "targetname" );
    var_8 moveto( var_5.origin, 2, 1, 1 );
    var_8 connectpaths();
    var_9 = getent( "elevator_door_outside2_top", "targetname" );
    var_5 = getent( var_9.target, "targetname" );
    var_9 moveto( var_5.origin, 2, 1, 1 );
    var_9 connectpaths();
}

elevator_dialogue()
{
    common_scripts\utility::flag_wait( "elevator_dialogue" );
    var_0 = getent( "the_gaz_man", "script_noteworthy" );
    var_0 maps\_utility::add_spawn_function( ::protect_gaz );

    if ( getdvarint( "use_old_elevator" ) == 1 )
    {
        wait 1.5;
        maps\_utility::radio_dialogue( "takinfire" );
        maps\_utility::radio_dialogue( "upthelift" );
        wait 1;
        level.grigsby maps\_anim::anim_single_queue( level.grigsby, "grg_ashot" );
        level.price maps\_anim::anim_single_queue( level.price, "pri_getinline" );
    }
}

protect_gaz()
{
    thread maps\_utility::magic_bullet_shield();
}

vehical_depot()
{
    maps\_utility::waittill_aigroupcleared( "garage" );
    common_scripts\utility::flag_set( "at_the_jeep" );
    wait 1.5;
    level.price maps\_anim::anim_single_queue( level.price, "letsgo" );
    level.grigsby maps\_anim::anim_single_queue( level.grigsby, "grg_move" );
    common_scripts\utility::flag_set( "level_end" );
    common_scripts\utility::flag_clear( "aa_follow_price_end_level" );
    maps\_utility::arcademode_checkpoint( 2, "g" );
}

end_of_level()
{
    common_scripts\utility::flag_wait( "level_end" );
    maps\_utility::nextmission();
}

compass_maps()
{
    var_0 = getent( "compass_map_upper", "targetname" );
    var_1 = getent( "compass_map_lower", "targetname" );
    var_0 thread map_change( "compass_map_launchfacility_b" );
    var_1 thread map_change( "compass_map_launchfacility_b_2" );
}

map_change( var_0 )
{
    for (;;)
    {
        self waittill( "trigger" );
        maps\_compass::setupminimap( var_0 );
    }
}

#using_animtree("animated_props");

airduct_fan_large()
{
    var_0 = getent( "airduct_fan_large", "targetname" );
    var_0 useanimtree( #animtree );
    var_0 setanim( %icbm_turbofan176_spin, 1, 0.1, 1 );
}

airduct_fan_medium()
{
    var_0 = getentarray( "airduct_fan_medium", "targetname" );
    common_scripts\utility::array_thread( var_0, ::medium_fans_think );
}

medium_fans_think()
{
    self useanimtree( #animtree );
    self setanim( %icbm_turbofan64_spin, 1, 0.1, 1.5 );
}

airduct_fan_small()
{
    var_0 = getentarray( "airduct_fan_small", "targetname" );
    common_scripts\utility::array_thread( var_0, ::small_fans_think );
}

small_fans_think()
{
    self useanimtree( #animtree );
    self setanim( %icbm_turbofan50_spin, 1, 0.1, 1 );
}

redlights()
{
    var_0 = getentarray( "redlight", "targetname" );
    common_scripts\utility::array_thread( var_0, ::redlights_think );
}

redlights_think()
{
    var_0 = 5000;

    for (;;)
    {
        self rotatevelocity( ( 0.0, 360.0, 0.0 ), var_0 );
        wait(var_0);
    }
}

redlight_spinner()
{
    var_0 = getentarray( "horizonal_spinner", "targetname" );
    common_scripts\utility::array_thread( var_0, ::horizonal_spinners_think );
}

horizonal_spinners_think()
{
    self useanimtree( #animtree );
    self setanim( %launchfacility_b_emergencylight, 1, 0.1, 1.0 );
}

wall_lights()
{
    var_0 = getentarray( "wall_light", "targetname" );
    common_scripts\utility::array_thread( var_0, ::wall_lights_think );
}

wall_lights_think()
{
    var_0 = 5000;

    for (;;)
    {
        self rotatevelocity( ( 360.0, 0.0, 0.0 ), var_0 );
        wait(var_0);
    }
}

wall_light_spinner()
{
    var_0 = getentarray( "vertical_spinner", "targetname" );
    common_scripts\utility::array_thread( var_0, ::vertical_spinners_think );
}

vertical_spinners_think()
{
    self useanimtree( #animtree );
    self setanim( %launchfacility_b_emergencylight, 1, 0.1, 1.0 );
}

music()
{
    wait 0.1;
    thread music_vents();
    common_scripts\utility::flag_wait( "music_start_countdown" );
    musicstop( 5 );
    wait 5.15;
    thread music_countdown( level.gameskill );
    common_scripts\utility::flag_wait( "codes_uploaded" );
    musicstop( 8 );
    wait 8.1;
    common_scripts\utility::flag_wait( "successful_confirmation" );
    maps\_utility::musicplaywrapper( "launch_b_victory_music" );
    wait 19;
    musicstop( 1 );
    wait 1.1;

    for (;;)
    {
        maps\_utility::musicplaywrapper( "tension_maintheme_groove" );
        wait 46;
        musicstop( 1 );
        wait 1.1;
    }
}

music_vents()
{
    level endon( "music_start_countdown" );

    for (;;)
    {
        maps\_utility::musicplaywrapper( "tension_maintheme_groove" );
        wait 46;
        musicstop( 1 );
        wait 1.1;
    }
}

music_countdown( var_0 )
{
    level endon( "codes_uploaded" );

    if ( var_0 == 0 )
    {
        for ( var_1 = 0; var_1 < 2; var_1++ )
        {
            maps\_utility::musicplaywrapper( "launch_b_count_01" );
            wait 36;
            musicstop( 1 );
            wait 1.1;
            maps\_utility::musicplaywrapper( "launch_b_count_02" );
            wait 94;
            musicstop( 1 );
            wait 1.1;
            maps\_utility::musicplaywrapper( "launch_b_count_03" );
            wait 140;
            musicstop( 3 );
            wait 3.1;
            maps\_utility::musicplaywrapper( "launch_b_count_04" );
            wait 54;
            musicstop( 0.1 );
            wait 0.15;
        }

        maps\_utility::musicplaywrapper( "launch_b_count_01" );
        wait 36;
        musicstop( 1 );
        wait 1.1;
        maps\_utility::musicplaywrapper( "launch_b_count_05" );
        wait 192;
        musicstop( 4 );
        wait 4.1;
    }
    else if ( var_0 == 1 || var_0 == 2 )
    {
        maps\_utility::musicplaywrapper( "launch_b_count_01" );
        wait 36;
        musicstop( 1 );
        wait 1.1;
        maps\_utility::musicplaywrapper( "launch_b_count_02" );
        wait 92;
        musicstop( 2 );
        wait 2.1;
        maps\_utility::musicplaywrapper( "launch_b_count_03" );
        wait 138;
        musicstop( 3 );
        wait 3.1;
        maps\_utility::musicplaywrapper( "launch_b_count_04" );
        wait 54;
        musicstop( 0.1 );
        wait 0.15;
        maps\_utility::musicplaywrapper( "launch_b_count_01" );
        wait 36;
        musicstop( 1 );
        wait 1.1;
        maps\_utility::musicplaywrapper( "launch_b_count_02" );
        wait 92;
        musicstop( 2 );
        wait 2.1;
        maps\_utility::musicplaywrapper( "launch_b_count_05" );
        wait 192;
        musicstop( 4 );
        wait 4.1;
    }
    else if ( var_0 == 3 )
    {
        wait 13;
        maps\_utility::musicplaywrapper( "launch_b_count_01" );
        wait 36;
        musicstop( 1 );
        wait 1.1;
        maps\_utility::musicplaywrapper( "launch_b_count_02" );
        wait 94;
        musicstop( 2 );
        wait 2.1;
        maps\_utility::musicplaywrapper( "launch_b_count_03" );
        wait 140;
        musicstop( 3 );
        wait 3.1;
        maps\_utility::musicplaywrapper( "launch_b_count_04" );
        wait 54;
        musicstop( 0.1 );
        wait 0.15;
        maps\_utility::musicplaywrapper( "launch_b_count_05" );
        wait 194;
        musicstop( 2 );
        wait 2.1;
    }
}

hide_triggers( var_0 )
{
    var_1 = getentarray( var_0, "script_noteworthy" );

    for ( var_2 = 0; var_2 < var_1.size; var_2++ )
        var_1[var_2] common_scripts\utility::trigger_off();
}

show_triggers( var_0 )
{
    var_1 = getentarray( var_0, "script_noteworthy" );

    for ( var_2 = 0; var_2 < var_1.size; var_2++ )
        var_1[var_2] common_scripts\utility::trigger_on();
}

keep_price_griggs_distance_hallway_after_staircase()
{
    getent( "kill_yellow_allied", "targetname" ) waittill( "trigger" );
    var_0 = [ level.price, level.grigsby ];
    level thread maps\_utility::keep_distance( var_0 );
    getent( "trigger_big_blast_door", "targetname" ) waittill( "trigger" );
    level thread maps\_utility::stop_keep_distance( var_0 );
}
