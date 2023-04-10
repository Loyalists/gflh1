// H1 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

main()
{
    if ( getdvar( "r_reflectionProbeGenerate" ) == "1" )
        return;

    if ( maps\bog_b_beautiful_corner::beautiful_corner() )
        return;

    if ( getdvar( "bog_camerashake" ) == "" )
        setdvar( "bog_camerashake", "1" );

    if ( getdvar( "bog_disableenemies" ) == "" )
        setdvar( "bog_disableenemies", "0" );

    if ( getdvar( "bog_debug_tank" ) == "" )
        setdvar( "bog_debug_tank", "0" );

    if ( getdvar( "bog_debug_flyby" ) == "" )
        setdvar( "bog_debug_flyby", "0" );

    if ( getdvar( "bog_b_min_spec" ) == "1" )
        makeminspec();

    maps\_utility::add_start( "arch", ::start_arch );
    maps\_utility::add_start( "alley", ::start_alley );
    maps\_utility::add_start( "ch46", ::start_ch46 );
    maps\_utility::default_start( ::start_bog );
    level.disallowlegswingwallhop = 1;
    level.weaponclipmodels = [];
    level.weaponclipmodels[0] = "weapon_ak47_clip";
    level.weaponclipmodels[1] = "weapon_m16_clip";
    level.weaponclipmodels[2] = "weapon_saw_clip";
    level.weaponclipmodels[3] = "weapon_ak74u_clip";
    level.weaponclipmodels[4] = "weapon_g3_clip";
    level.weaponclipmodels[5] = "weapon_dragunov_clip";
    common_scripts\utility::flag_init( "tank_clear_to_shoot" );
    common_scripts\utility::flag_init( "door_idle_guy_idling" );
    common_scripts\utility::flag_init( "price_at_spotter" );
    common_scripts\utility::flag_init( "ok_to_do_spotting" );
    common_scripts\utility::flag_init( "arrived_at_spotting" );
    common_scripts\utility::flag_init( "tank_in_final_position" );
    common_scripts\utility::flag_init( "tank_turret_aimed_at_t72" );
    common_scripts\utility::flag_init( "friendly_reactions_over" );
    common_scripts\utility::flag_init( "t72_in_final_position" );
    common_scripts\utility::flag_init( "t72_exploded" );
    common_scripts\utility::flag_init( "abrams_move_shoot_t72" );
    common_scripts\utility::flag_init( "abrams_advance_to_end_level" );
    common_scripts\utility::flag_init( "allowTankFire" );
    common_scripts\utility::flag_init( "aa_bog_b_zone_bog" );
    common_scripts\utility::flag_init( "aa_bog_b_zone_streets" );
    common_scripts\utility::flag_init( "aa_bog_b_zone_alley" );
    common_scripts\utility::flag_init( "dumpster_pushed" );
    common_scripts\utility::flag_init( "seaknight_dialog_done" );
    common_scripts\utility::flag_init( "alley_cleared" );
    common_scripts\utility::flag_init( "start_dumpster_push" );
    common_scripts\utility::flag_init( "player_passed_dumpster" );
    common_scripts\utility::flag_init( "at_alley_breach_price" );
    common_scripts\utility::flag_init( "at_alley_breach_alley_breach_buddy" );
    common_scripts\utility::flag_init( "doorblocker_reach_door" );
    common_scripts\utility::flag_init( "seaknight_start" );
    thread maps\_wibble::setup_wibble_triggers( 1, "seaknight_start", "interior", 0, 0 );
    level.radioforcedtransmissionqueue = [];
    precachemodel( "com_computer_monitor_d" );
    precachemodel( "vehicle_av8b_harrier_jet" );
    precachemodel( "vehicle_ch46e_opened_door_interior_b" );
    precachemodel( "vehicle_ch46e_wires" );
    precachemodel( "vehicle_ch46e_opened_door_interior_a" );
    precachemodel( "vehicle_t72_tank_d_animated_sequence" );
    precacheitem( "m1a1_turret_blank" );
    precacheitem( "remote_missile_detonator" );
    precacheitem( "remote_missile" );
    precachestring( &"BOG_B_OBJ_ESCORT_TANK" );
    precachestring( &"BOG_B_OBJ_SEAKNIGHT" );
    precachestring( &"BOG_B_T72_MG_DEATH" );
    precacherumble( "tank_fire" );
    precacherumble( "tank_impact" );
    precachemodel( "h1_bog_b_patch_concrete_slab" );
    maps\bog_b_precache::main();
    maps\_vehicle::build_template( "bog_mortar", "vehicle_m1a1_abrams", undefined, "script_vehicle" );
    maps\_vehicle::build_life( 999, 500, 1500 );
    maps\createart\bog_b_art::main();
    maps\bog_b_fx::main();
    maps\_hiding_door_anims::main();
    maps\_load::main();
    maps\_hiding_door::init_hiding_door();
    maps\_remotemissile::init();
    maps\bog_b_anim::main();
    maps\bog_b_lighting::main();
    maps\bog_b_aud::main();
    maps\_compass::setupminimap( "compass_map_bog_b" );
    thread maps\bog_b_amb::main();
    thread maps\_mortar::bog_style_mortar();
    thread teamssplitup();
    thread lastsequence();
    thread alley_dumpster_sequence();
    thread alley_cleared();
    thread player_passed_dumpster();
    thread rotate_fans();
    thread common_scripts\_pipes::main();
    level.cosine = [];
    level.cosine["35"] = cos( 35 );
    level.cosine["65"] = cos( 65 );
    level.cosine["80"] = cos( 80 );
    level.customautosavecheck = ::savegame_redundancy_check;
    level.minimumtimebetweenautosaves = 15;
    level.exploderarray = [];
    level.exploderarray[0][0] = setupexploder( 105 );
    level.exploderarray[0][1] = setupexploder( 104 );
    level.exploderarray[0][2] = setupexploder( 102 );
    level.exploderarray[0][3] = setupexploder( 103 );
    level.exploderarray[1][0] = setupexploder( 100, ::killspawner, 7 );
    level.exploderarray[1][1] = setupexploder( 101 );
    level.exploderarray[2][0] = setupexploder( 200 );
    level.exploderarray[2][1] = setupexploder( 201 );
    common_scripts\utility::flag_set( "respawn_friendlies" );
    maps\_utility::set_promotion_order( "r", "y" );
    maps\_utility::set_empty_promotion_order( "y" );
    maps\_utility::set_empty_promotion_order( "g" );
    thread archway_color_trigger();
    common_scripts\utility::array_thread( getentarray( "stragglers_chase", "targetname" ), ::stragglers_chase );
    common_scripts\utility::array_thread( getentarray( "flyby", "targetname" ), ::flyby );
    common_scripts\utility::array_thread( getentarray( "chain_and_home", "script_noteworthy" ), maps\_utility::add_spawn_function, ::chain_and_home );
    common_scripts\utility::array_thread( getentarray( "archway_bog_reinforcer", "targetname" ), maps\_utility::add_spawn_function, ::ignored_by_tank_cannon );
    common_scripts\utility::array_thread( getentarray( "rpg_tank_shooter", "script_noteworthy" ), maps\_utility::add_spawn_function, ::rpg_tank_shooter );
    common_scripts\utility::array_thread( getentarray( "rpg_tank_shooter_fall", "script_noteworthy" ), maps\_utility::add_spawn_function, ::rpg_tank_shooter );
    common_scripts\utility::array_thread( getentarray( "rpg_tank_shooter_noignore", "script_noteworthy" ), maps\_utility::add_spawn_function, ::rpg_tank_shooter );
    common_scripts\utility::array_thread( getentarray( "vehicle_path_disconnector", "targetname" ), ::vehicle_path_disconnector );
    common_scripts\utility::array_thread( getentarray( "delete_ai", "targetname" ), ::delete_ai_in_zone );
    common_scripts\utility::array_thread( getentarray( "autosave_when_trigger_cleared", "targetname" ), ::autosave_when_trigger_cleared );
    common_scripts\utility::array_thread( getentarray( "delete_all_axis", "script_noteworthy" ), ::delete_all_axis );
    common_scripts\utility::array_thread( getentarray( "computer_des", "targetname" ), ::computer_destruct );
    thread maps\_utility::ai_team_run_twitch_think( "allies", "alley_cleared", undefined, "ch46", undefined );
    level.abrams = maps\_vehicle::waittill_vehiclespawn( "abrams" );
    var_0 = getent( "abrams_top_clip", "targetname" );
    var_0 linkto( level.abrams, "tag_turret", ( -10.0, 0.0, 10.0 ), ( 0.0, -90.0, 0.0 ) );
    thread seaknight_player_door_clip();
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
    level.abrams.vehicle_treadfx_min_speed = 5;
    wait 0.05;
    var_1 = getent( "alley_volume", "targetname" );
    var_2 = getentarray( "destructible", "targetname" );

    for ( var_3 = 0; var_3 < var_2.size; var_3++ )
    {
        if ( var_2[var_3] istouching( var_1 ) )
            var_2[var_3].disablebadplace = 1;
    }

    var_4 = getent( "dumpster", "targetname" );
    var_5 = getent( "dumpster_clip", "targetname" );
    var_5.origin = var_4.origin;
    var_5.angles = ( 0, var_4.angles[1], 0 );
    var_0 = getent( "truck_clip_before", "targetname" );
    var_0 notsolid();
    var_0 delete();
    var_6 = spawn( "script_model", ( 3900.0, -1500.0, 100.0 ) );
    var_6 setmodel( "h1_bog_b_patch_concrete_slab" );
    level.abrams.issquad = 1;
    level.abrams.forwardent = spawn( "script_origin", level.abrams gettagorigin( "tag_flash" ) );
    level.abrams.forwardent linkto( level.abrams );
    level.tire_fire = getent( "tire_fire", "targetname" );
    playfxontag( level._effect["fire_wreckage_ground"], level.tire_fire, "tag_origin" );
    common_scripts\utility::flag_set( "aa_bog_b_zone_bog" );
    wait 6.5;
    getent( "player_spawn_safety_brush", "targetname" ) delete();
    wait 3.0;
    objective_add( 1, "current", &"BOG_B_OBJ_ESCORT_TANK", ( 4347.0, -4683.0, 130.0 ) );
}

makeminspec()
{
    var_0 = getspawnerarray();

    for ( var_1 = 0; var_1 < var_0.size; var_1++ )
    {
        if ( !isdefined( var_0[var_1].script_minspec_level ) )
        {
            if ( isdefined( var_0[var_1].baseaccuracy ) )
                var_0[var_1].baseaccuracy *= 1.3;
            else
                var_0[var_1].baseaccuracy = 1.2;

            continue;
        }

        switch ( var_0[var_1].script_minspec_level )
        {
            case 0:
                var_0[var_1] delete();
                continue;
        }
    }
}

bog_dialog()
{
    wait 4;
    maps\_utility::battlechatter_off( "allies" );
    var_0 = [];
    var_0[0] = level.price;
    var_1 = maps\_utility::get_closest_ai_exclude( level.player.origin, "allies", var_0 );
    var_0[1] = var_1;
    var_2 = maps\_utility::get_closest_ai_exclude( level.player.origin, "allies", var_0 );

    if ( !var_2 ishero() )
        var_2 thread maps\_utility::magic_bullet_shield( undefined, undefined, 5.0 );

    var_1.animname = "marine1";
    var_2.animname = "marine2";
    var_1 maps\_anim::anim_single_solo( var_1, "getyourass" );
    wait 1;
    level.player playradiosound( level.scr_sound["tank_commander"]["wereclear"] );
    common_scripts\utility::flag_wait( "evemy_helicopter_reinforcement_spawned" );
    wait 8;
    var_2 maps\_anim::anim_single_solo( var_2, "enemyair" );
    wait 0.05;
    level.price maps\_anim::anim_single_solo( level.price, "grabrpg" );
    wait 10;

    if ( isdefined( level.alleyfriends ) )
    {
        foreach ( var_4 in level.alleyfriends )
            common_scripts\utility::array_add( var_0, var_4 );
    }

    var_6 = maps\_utility::get_closest_ai_exclude( level.player.origin, "allies", var_0 );
    var_6.animname = "marine1";
    var_6 maps\_anim::anim_single_solo( var_6, "rightflank" );

    if ( !var_2 ishero() )
        var_2 maps\_utility::stop_magic_bullet_shield();

    maps\_utility::battlechatter_on( "allies" );
}

ishero()
{
    if ( !isdefined( self ) )
        return 0;

    if ( !isdefined( self.script_noteworthy ) )
        return 0;

    if ( self.script_noteworthy == "hero" )
        return 1;

    return 0;
}

fog_adjust()
{
    var_0 = getent( "fog_in", "targetname" );
    var_1 = getent( "fog_out", "targetname" );

    for (;;)
    {
        var_0 waittill( "trigger" );
        setexpfog( 0, 2842, 0.642709, 0.626383, 0.5, 1, 3.0, 0.642709, 0.626383, 0.3, ( 0.0, 1.0, 0.4 ), 0.0, 180.0, 2.0 );
        var_1 waittill( "trigger" );
        setexpfog( 0, 3842, 0.642709, 0.626383, 0.5, 1, 3.0, 0.642709, 0.626383, 0.3, ( 0.0, 1.0, 0.4 ), 0.0, 180.0, 2.0 );
    }
}

start_bog()
{
    soundscripts\_snd::snd_message( "start_default_checkpoint" );
    spawn_starting_friendlies( "friendly_starting_spawner" );
    thread ignored_till_fastrope( "introchopper1" );
    thread ignored_till_fastrope( "introchopper2" );
    thread bog_enemies_retreat();

    while ( !isdefined( level.abrams ) )
        wait 0.05;

    thread tank_advancement_bog();
    thread first_friendly_advancement_trigger();
    thread bog_dialog();
    level.player.ignoreme = 1;
    wait 6;
    level.player.ignoreme = 0;
}

first_friendly_advancement_trigger()
{
    var_0 = getent( "first_friendly_advancement_trigger", "script_noteworthy" );
    var_0 endon( "trigger" );
    wait 3;

    if ( !isdefined( var_0 ) )
        return;

    var_0 notify( "trigger" );
}

start_arch()
{
    soundscripts\_snd::snd_message( "aud_start_arch_checkpoint" );
    spawn_starting_friendlies( "friendly_starting_spawner_arch" );
    var_0 = getent( "playerstart_arch", "targetname" );
    level.player setorigin( var_0.origin );
    level.player setplayerangles( ( 0, var_0.angles[1], 0 ) );
    wait 0.05;
    var_1 = getaiarray( "axis" );

    for ( var_2 = 0; var_2 < var_1.size; var_2++ )
    {
        if ( isdefined( var_1[var_2].magic_bullet_shield ) && var_1[var_2].magic_bullet_shield )
            var_1[var_2] maps\_utility::stop_magic_bullet_shield();

        var_1[var_2] delete();
    }

    while ( !isdefined( level.abrams ) )
        wait 0.05;

    var_3 = getvehiclenode( "tank_path_2", "targetname" );
    level.abrams attachpath( var_3 );
    thread tank_advancement_arch();
}

start_alley()
{
    soundscripts\_snd::snd_message( "aud_start_alley_checkpoint" );
    spawn_starting_friendlies( "friendly_starting_spawner_alley" );
    var_0 = getent( "playerstart_alley", "targetname" );
    level.player setorigin( var_0.origin );
    level.player setplayerangles( ( 0, var_0.angles[1], 0 ) );
    waittillframeend;
    var_1 = getaiarray( "axis" );

    for ( var_2 = 0; var_2 < var_1.size; var_2++ )
    {
        if ( isdefined( var_1[var_2].magic_bullet_shield ) && var_1[var_2].magic_bullet_shield )
        {
            var_1[var_2] maps\_utility::stop_magic_bullet_shield();
            var_1[var_2] delete();
        }
    }

    thread friendlies_become_invulnerable();

    while ( !isdefined( level.abrams ) )
        wait 0.05;

    var_3 = getvehiclenode( "tank_path_2", "targetname" );
    level.abrams attachpath( var_3 );
    wait 0.05;
    var_4 = getvehiclenode( "stop_for_city_fight3", "script_noteworthy" );
    level.abrams setwaitnode( var_4 );
    level.abrams waittill( "reached_wait_node" );
    level.abrams vehicle_setspeed( 0, 10 );
    thread tank_advancement_alley();
}

friendlies_become_invulnerable()
{
    thread friendly_reinforcements_magic_bullet();
    var_0 = getaiarray( "allies" );

    for ( var_1 = 0; var_1 < var_0.size; var_1++ )
    {
        if ( isdefined( var_0[var_1].magic_bullet_shield ) && var_0[var_1].magic_bullet_shield )
            continue;

        var_0[var_1] thread maps\_utility::magic_bullet_shield( undefined, undefined, 5.0 );
    }
}

start_ch46()
{
    soundscripts\_snd::snd_message( "aud_start_ch46_checkpoint" );
    var_0 = getent( "seaknight_land_location", "script_noteworthy" );
    level.player setorigin( var_0.origin );
    level.player setplayerangles( ( 0, var_0.angles[1], 0 ) );
    waittillframeend;
    var_1 = getaiarray( "axis" );

    for ( var_2 = 0; var_2 < var_1.size; var_2++ )
    {
        if ( isdefined( var_1[var_2].magic_bullet_shield ) && var_1[var_2].magic_bullet_shield )
            var_1[var_2] maps\_utility::stop_magic_bullet_shield();

        var_1[var_2] delete();
    }

    thread seaknight();
}

spawn_starting_friendlies( var_0 )
{
    var_1 = getentarray( var_0, "targetname" );

    for ( var_2 = 0; var_2 < var_1.size; var_2++ )
    {
        var_3 = var_1[var_2] stalingradspawn();

        if ( maps\_utility::spawn_failed( var_3 ) )
        {

        }

        var_3.goalradius = 32;

        if ( issubstr( var_3.classname, "vasquez" ) )
            level.price = var_3;

        if ( issubstr( var_3.classname, "mark" ) )
            level.grigsby = var_3;

        if ( var_3 ishero() )
            var_3 thread maps\_utility::magic_bullet_shield( undefined, undefined, 5.0 );
    }

    level.price.animname = "price";
    level.price maps\_utility::make_hero();
    level.grigsby.animname = "grigsby";
    level.grigsby maps\_utility::make_hero();
    level.grigsby.suppressionthreshold = 1.0;
    common_scripts\utility::array_thread( getaiarray( "allies" ), maps\_utility::replace_on_death );
}

ignored_till_fastrope( var_0 )
{
    var_1 = undefined;
    var_1 = getent( var_0, "targetname" );

    if ( isspawner( var_1 ) )
        var_1 = maps\_vehicle::waittill_vehiclespawn( var_0 );

    soundscripts\_snd::snd_message( "start_mi17_sequence" );

    for ( var_2 = 0; var_2 < var_1.riders.size; var_2++ )
    {
        var_1.riders[var_2].ignoreme = 1;
        var_1.riders[var_2] thread ignored_by_tank_cannon();
    }

    var_1 waittill( "unloading" );
    wait 5;

    if ( !isdefined( var_1 ) )
        return;

    for ( var_2 = 0; var_2 < var_1.riders.size; var_2++ )
    {
        if ( !isdefined( var_1.riders[var_2] ) )
            continue;

        if ( !isalive( var_1.riders[var_2] ) )
            continue;

        var_1.riders[var_2].ignoreme = 0;
        var_1.riders[var_2] thread ignored_by_tank_cannon( 0 );
    }
}

stragglers_chase()
{
    var_0 = getent( self.target, "targetname" );
    self waittill( "trigger" );
    var_1 = getaiarray( "axis" );

    for ( var_2 = 0; var_2 < var_1.size; var_2++ )
    {
        if ( !var_1[var_2] istouching( var_0 ) )
            continue;

        var_1[var_2].goalradius = 600;
        var_1[var_2] setgoalentity( level.player );
    }
}

truck_crush_tank_in_position()
{
    var_0 = getvehiclenode( "truck_crush_node", "script_noteworthy" );
    var_0 waittill( "trigger" );
    level.abrams vehicle_setspeed( 0, 999999999, 999999999 );
    common_scripts\utility::flag_set( "truck_crush_tank_in_position" );
}

truck_tank_collide_think( var_0, var_1, var_2 )
{
    var_3 = getvehiclenode( var_1, "script_noteworthy" );
    var_3 waittill( "trigger" );

    if ( isdefined( var_2 ) )
        wait(var_2);

    level endon( var_0 + "_stop_collide_think" );
    var_4 = getent( var_0 + "_tank_collide_trigger", "targetname" );

    for (;;)
    {
        var_4 waittill( "trigger", var_5 );

        if ( var_5 == level.player )
        {
            level.player kill();
            break;
        }
    }
}

chain_and_home()
{
    self endon( "death" );
    self waittill( "reached_path_end" );
    var_0 = distance( self.origin, level.player.origin );

    if ( var_0 > 1024 )
        var_0 = 1024;

    for (;;)
    {
        wait 5;
        self.goalradius = var_0;
        self setgoalentity( level.player );
        var_0 -= 175;

        if ( var_0 < 512 )
        {
            var_0 = 512;
            return;
        }
    }
}

rpg_tank_shooter()
{
    self endon( "death" );

    if ( isdefined( self.script_noteworthy ) && self.script_noteworthy != "rpg_tank_shooter_noignore" )
        self.ignoreme = 1;

    self waittill( "goal" );

    if ( isdefined( self.script_noteworthy ) && self.script_noteworthy == "rpg_tank_shooter_fall" )
    {
        if ( getdvar( "ragdoll_enable" ) == "1" )
            thread roof_guy_fall_on_death();
    }

    self setentitytarget( level.abrams );
    wait 10;

    if ( isdefined( self ) )
        self clearenemy();
}

#using_animtree("generic_human");

roof_guy_fall_on_death()
{
    self endon( "death" );
    self.health = 10;

    for (;;)
    {
        self.deathanim = %bog_b_rpg_fall_death;
        wait 0.05;
    }
}

attack_troops()
{
    self notify( "stop_attacking_troops" );
    self endon( "stop_attacking_troops" );
    self endon( "death" );
    wait 1;

    for (;;)
    {
        wait(randomfloatrange( 2, 5 ));
        var_0 = maps\_helicopter_globals::getenemytarget( 10000, level.cosine["80"], 1, 0, 0, 1 );

        if ( !isdefined( var_0 ) )
            continue;

        var_1 = abs( var_0.origin[2] - self.origin[2] );
        var_2 = distance( var_0.origin, self.origin );
        var_3 = asin( var_1 / var_2 );

        if ( var_3 > 15 )
            continue;

        var_4 = var_0.origin + ( 0.0, 0.0, 32.0 );
        self setturrettargetvec( var_4 );

        if ( getdvar( "bog_debug_tank" ) == "1" )
            thread maps\_utility::draw_line_until_notify( level.abrams.origin + ( 0.0, 0.0, 32.0 ), var_4, 1, 0, 0, self, "stop_drawing_line" );

        common_scripts\utility::waittill_notify_or_timeout( "turret_rotate_stopped", 3.0 );
        self clearturrettarget();

        if ( getdvar( "bog_debug_tank" ) == "1" )
        {
            self notify( "stop_drawing_line" );
            thread maps\_utility::draw_line_until_notify( level.abrams.origin + ( 0.0, 0.0, 32.0 ), var_4, 0, 1, 0, self, "stop_drawing_line" );
        }

        if ( getdvar( "bog_debug_tank" ) == "1" )
            self notify( "stop_drawing_line" );
    }
}

tank_turret_forward()
{
    getent( "tank_turret_forward", "targetname" ) waittill( "trigger" );
    self notify( "stop_attacking_troops" );
    self setturrettargetent( self.forwardent );
    common_scripts\utility::waittill_notify_or_timeout( "turret_rotate_stopped", 4.0 );
    self clearturrettarget();
}

ambush_ahead_dialog()
{
    maps\_utility::battlechatter_off( "allies" );
    level.player playradiosound( level.scr_sound["tank_commander"]["possibleambush"] );
    wait 1;
    level.price maps\_anim::anim_single_solo( level.price, "watchrooftops" );
    level.player playradiosound( level.scr_sound["tank_commander"]["standclear"] );
    maps\_utility::battlechatter_on( "allies" );
    common_scripts\utility::flag_set( "tank_clear_to_shoot" );
}

playradiosound( var_0 )
{
    if ( !isdefined( level.radio_in_use ) )
        level.radio_in_use = 0;

    var_1 = 0;
    var_1 = playaliasoverradio( var_0 );

    if ( var_1 )
        return;

    level.radioforcedtransmissionqueue[level.radioforcedtransmissionqueue.size] = var_0;

    while ( !var_1 )
    {
        if ( level.radio_in_use )
            level waittill( "radio_not_in_use" );

        var_1 = playaliasoverradio( level.radioforcedtransmissionqueue[0] );

        if ( !level.radio_in_use && !var_1 )
        {

        }
    }

    level.radioforcedtransmissionqueue = maps\_utility::array_remove_index( level.radioforcedtransmissionqueue, 0 );
}

playaliasoverradio( var_0 )
{
    if ( level.radio_in_use )
        return 0;

    level.radio_in_use = 1;
    level.player playlocalsound( var_0, "playSoundOverRadio_done" );
    level.player waittill( "playSoundOverRadio_done" );
    level.radio_in_use = 0;
    level.lastradiotransmission = gettime();
    level notify( "radio_not_in_use" );
    return 1;
}

shoot_buildings( var_0 )
{
    self notify( "stop_attacking_troops" );
    common_scripts\utility::flag_wait( "tank_clear_to_shoot" );

    for (;;)
    {
        if ( level.exploderarray[var_0].size <= 0 )
            break;

        var_1 = undefined;
        var_1 = getnextexploder( var_0 );

        if ( !isdefined( var_1 ) )
        {
            wait(randomfloat( 2 ));
            continue;
        }

        shoot_exploder( level.exploderarray[var_0][var_1] );
        level.exploderarray[var_0] = maps\_utility::array_remove_index( level.exploderarray[var_0], var_1 );
        wait(randomfloat( 6 ));
    }

    self notify( "abrams_shot_explodergroup" );
}

setupexploder( var_0, var_1, var_2 )
{
    var_3 = spawnstruct();
    var_3.inumber = int( var_0 );
    var_3.snumber = maps\_utility::string( var_0 );
    var_4 = getentarray( "exploder_tank_target", "targetname" );

    for ( var_5 = 0; var_5 < var_4.size; var_5++ )
    {
        if ( var_4[var_5].script_noteworthy == var_3.snumber )
            var_3.origin = var_4[var_5].origin;
    }

    var_6 = getentarray( "exploder_area", "targetname" );

    for ( var_5 = 0; var_5 < var_6.size; var_5++ )
    {
        if ( var_6[var_5].script_noteworthy == var_3.snumber )
            var_3.areatrig = var_6[var_5];
    }

    var_3.impact_detector = getent( "exploder_detectimpact_" + var_3.snumber, "targetname" );

    if ( isdefined( var_3.impact_detector ) )
        var_3.impact_detector notsolid();

    var_3.explodedfunction = var_1;
    var_3.parm1 = var_2;
    return var_3;
}

getnextexploder( var_0 )
{
    var_1 = [];

    for ( var_2 = 0; var_2 < level.exploderarray[var_0].size; var_2++ )
    {
        if ( isdefined( level.exploderarray[var_0][var_2].areatrig ) && level.player istouching( level.exploderarray[var_0][var_2].areatrig ) )
            continue;

        var_1[var_1.size] = var_2;
    }

    if ( var_1.size == 0 )
        return undefined;

    for ( var_2 = 0; var_2 < var_1.size; var_2++ )
    {
        var_3 = common_scripts\utility::within_fov( level.player geteye(), level.player getplayerangles(), level.exploderarray[var_0][var_1[var_2]].origin, level.cosine["35"] );

        if ( var_3 )
            return var_1[var_2];
    }

    return var_1[0];
}

shoot_exploder( var_0 )
{
    level.abrams thread tank_shooting_exploder_dialog( var_0.inumber );
    level.abrams waittill( "target_aquired" );
    level.abrams setturrettargetvec( var_0.origin );
    level.abrams common_scripts\utility::waittill_notify_or_timeout( "turret_rotate_stopped", 3.0 );
    level.abrams clearturrettarget();
    level.abrams.readytofire = 1;
    common_scripts\utility::flag_wait( "allowTankFire" );
    level.abrams.readytofire = undefined;
    level.abrams fireweapon();
    level.abrams maps\bog_b_anim::shoot_m1a1_anim();
    playrumbleonposition( "tank_fire", level.abrams.origin );
    common_scripts\utility::flag_clear( "allowTankFire" );

    if ( getdvarint( "use_old_exploderdelay" ) )
        wait 0.2;
    else
        shoot_exploder_wait( var_0 );

    common_scripts\_exploder::exploder( var_0.inumber );
    playrumbleonposition( "tank_impact", var_0.origin );

    if ( isdefined( var_0.explodedfunction ) )
    {
        if ( isdefined( var_0.parm1 ) )
            level thread [[ var_0.explodedfunction ]]( var_0.parm1 );
        else
            level thread [[ var_0.explodedfunction ]]();
    }

    wait 0.05;
    setplayerignoreradiusdamage( 1 );
    radiusdamage( var_0.origin, 300, 5000, 1000 );
    wait 0.2;
    setplayerignoreradiusdamage( 0 );
}

shoot_exploder_wait( var_0 )
{
    var_1 = distance( var_0.origin, level.abrams.origin );
    var_2 = var_1 / 10000.0;
    var_2 += 0.05;
    thread shoot_exploder_detect_impact( var_0 );
    level common_scripts\utility::waittill_any_timeout( var_2, "shoot_exploder_detected_impact" );
    level notify( "shoot_exploder_wait_complete" );
}

shoot_exploder_detect_impact( var_0 )
{
    level endon( "shoot_exploder_wait_complete" );

    if ( !isdefined( var_0.impact_detector ) )
        return;

    shoot_exploder_detect_damage( var_0.impact_detector, "script_vehicle_m1a1_abrams" );
    var_0.impact_detector delete();
    level notify( "shoot_exploder_detected_impact" );
}

shoot_exploder_detect_damage( var_0, var_1 )
{
    for (;;)
    {
        var_0 solid();
        var_0 setcandamage( 1 );
        var_0 waittill( "damage", var_2, var_3, var_4, var_5, var_6 );

        if ( !isdefined( var_3 ) )
            continue;

        if ( var_3.classname != var_1 )
            continue;

        if ( var_6 != "MOD_PROJECTILE" )
            continue;

        if ( var_2 < 1000 )
            continue;

        break;
    }
}

tank_shooting_exploder_dialog( var_0 )
{
    if ( var_0 == 105 )
    {
        self.haltfire = 1;
        level.player playradiosound( level.scr_sound["tank_loader"]["up1"] );
        level.player playradiosound( level.scr_sound["tank_commander"]["2story1_ground"] );
        self notify( "target_aquired" );

        while ( !isdefined( self.readytofire ) )
            wait 0.05;

        level.player playradiosound( level.scr_sound["tank_gunner"]["targetacquired1"] );
        level.player playradiosound( level.scr_sound["tank_commander"]["fire"] );
    }
    else if ( var_0 == 104 )
    {
        self.haltfire = 1;
        level.player playradiosound( level.scr_sound["tank_loader"]["up2"] );
        level.player playradiosound( level.scr_sound["tank_commander"]["2story1_2ndfloor"] );
        self notify( "target_aquired" );

        while ( !isdefined( self.readytofire ) )
            wait 0.05;

        level.player playradiosound( level.scr_sound["tank_gunner"]["targetacquired2"] );
        level.player playradiosound( level.scr_sound["tank_commander"]["fire"] );
    }
    else if ( var_0 == 102 )
    {
        self.haltfire = 1;
        level.player playradiosound( level.scr_sound["tank_loader"]["up3"] );
        level.player playradiosound( level.scr_sound["tank_commander"]["3story11_2ndfloor"] );
        self notify( "target_aquired" );

        while ( !isdefined( self.readytofire ) )
            wait 0.05;

        level.player playradiosound( level.scr_sound["tank_gunner"]["targetacquired3"] );
        level.player playradiosound( level.scr_sound["tank_commander"]["fire"] );
    }
    else if ( var_0 == 103 )
    {
        self.haltfire = 1;
        level.player playradiosound( level.scr_sound["tank_loader"]["up4"] );
        level.player playradiosound( level.scr_sound["tank_commander"]["3story1130_2ndfloor"] );
        self notify( "target_aquired" );

        while ( !isdefined( self.readytofire ) )
            wait 0.05;

        level.player playradiosound( level.scr_sound["tank_gunner"]["targetacquired1"] );
        level.player playradiosound( level.scr_sound["tank_commander"]["fire"] );
    }
    else if ( var_0 == 100 )
    {
        self.haltfire = 1;
        level.player playradiosound( level.scr_sound["tank_loader"]["up1"] );
        level.player playradiosound( level.scr_sound["tank_commander"]["3story11_2ndfloor"] );
        self notify( "target_aquired" );

        while ( !isdefined( self.readytofire ) )
            wait 0.05;

        level.player playradiosound( level.scr_sound["tank_gunner"]["targetacquired2"] );
        level.player playradiosound( level.scr_sound["tank_commander"]["fire"] );
    }
    else if ( var_0 == 101 )
    {
        self.haltfire = 1;
        level.player playradiosound( level.scr_sound["tank_loader"]["up1"] );
        level.player playradiosound( level.scr_sound["tank_commander"]["3story1230_2ndfloor"] );
        self notify( "target_aquired" );

        while ( !isdefined( self.readytofire ) )
            wait 0.05;

        level.player playradiosound( level.scr_sound["tank_gunner"]["targetacquired2"] );
        level.player playradiosound( level.scr_sound["tank_commander"]["fire"] );
    }
    else if ( var_0 == 200 )
    {
        self.haltfire = 1;
        level.player playradiosound( level.scr_sound["tank_loader"]["up1"] );
        self notify( "target_aquired" );

        while ( !isdefined( self.readytofire ) )
            wait 0.05;

        level.player playradiosound( level.scr_sound["tank_gunner"]["targetacquired2"] );
        level.player playradiosound( level.scr_sound["tank_commander"]["fire"] );
    }
    else if ( var_0 == 201 )
    {
        self.haltfire = 1;
        level.player playradiosound( level.scr_sound["tank_loader"]["up3"] );
        self notify( "target_aquired" );

        while ( !isdefined( self.readytofire ) )
            wait 0.05;

        level.player playradiosound( level.scr_sound["tank_gunner"]["targetacquired1"] );
        level.player playradiosound( level.scr_sound["tank_commander"]["fire"] );
    }
    else
    {
        wait 0.05;
        self notify( "target_aquired" );
        wait 0.05;
    }

    self.readytofire = 1;
    common_scripts\utility::flag_set( "allowTankFire" );
}

killspawner( var_0 )
{
    thread maps\_spawner::kill_spawnernum( var_0 );
}

alley_dumpster_sequence()
{
    var_0 = getent( "start_dumpster_sequence", "script_noteworthy" );
    var_0 waittill( "trigger" );
    var_1 = getent( "post_archway_color_trigger", "targetname" );
    var_1 common_scripts\utility::trigger_off();
    wait 0.05;
    var_2 = getnode( "vasquez_dumpster_node", "targetname" );
    level.price setgoalnode( var_2 );
    level.price.force_crouch = 1;
    wait 0.05;
    level.price thread wait_to_reach_dumpster_node();
    level.price maps\_utility::disable_ai_color();
    maps\_utility::arcademode_checkpoint( 2.0, "alley" );
    thread friendlies_become_invulnerable();
    wait 0.05;
    level.alleyfriends = maps\_utility::get_force_color_guys( "allies", "r" );

    foreach ( var_4 in level.alleyfriends )
    {
        var_4.grenadeawareness = 0;
        var_4.ignorerandombulletdamage = 1;
        var_4.disablebulletwhizbyreaction = 1;
        var_4.ignoreexplosionevents = 1;
        var_4.dontmelee = 1;
        var_4.a.disablepain = 1;
        var_4.allowpain = 0;
        var_4.flashbangimmunity = 1;
        var_4 pushplayer( 1 );
    }

    var_6 = undefined;

    for ( var_7 = 0; var_7 < level.alleyfriends.size; var_7++ )
    {
        if ( level.alleyfriends[var_7] == level.price )
            continue;

        var_6 = level.alleyfriends[var_7];
        break;
    }

    var_6.animname = "dumpsterGuy";
    var_6 maps\_utility::disable_ai_color();
    var_6 maps\_utility::make_hero();

    if ( !isdefined( var_6.magic_bullet_shield ) )
        var_6 thread maps\_utility::magic_bullet_shield();

    var_8 = getent( "dumpster", "targetname" );
    var_8.animname = "dumpster";
    var_8 useanimtree( level.scr_animtree["dumpster"] );
    var_9 = getent( "dumpster_clip", "targetname" );
    var_2 = spawn( "script_origin", var_8.origin );
    var_2.angles = var_8.angles;
    var_8 thread updateclippos( var_9 );
    var_10 = getent( "dumpster_new_model", "targetname" );

    if ( isdefined( var_10 ) )
    {
        var_8 hide();
        var_10 linkto( var_8 );
    }

    var_6 thread maps\_utility::set_ignoresuppression( 1 );
    level.price thread maps\_utility::set_ignoresuppression( 1 );
    var_6 allowedstances( "crouch" );
    var_2 maps\_anim::anim_reach_solo( var_6, "dumpster_peek" );
    var_11 = [];
    var_11[var_11.size] = var_6;
    var_11[var_11.size] = var_8;
    var_8 thread maps\_utility::play_sound_on_entity( "scn_bog_dumpster_peek" );
    var_2 maps\_anim::anim_single( var_11, "dumpster_peek" );
    var_2 thread maps\_anim::anim_loop_solo( var_6, "dumpster_idle2", undefined, "stop_idle" );
    level thread dumpsterguy_push_condition1( var_6 );
    level thread dumpsterguy_push_condition2( var_6 );
    level thread dumpsterguy_push_condition3( var_6 );
    common_scripts\utility::flag_wait( "start_dumpster_push" );
    common_scripts\utility::flag_wait( "vasquez_in_position" );
    level.price.overridemovemode = "run";
    var_8 maps\_anim::anim_reach_solo( level.price, "dumpster_push" );
    var_11[var_11.size] = level.price;
    var_8 thread maps\_utility::play_sound_on_entity( "scn_bog_dumpster_push" );
    var_8 thread maps\_anim::anim_single_solo( level.price, "dumpster_push" );
    var_12 = 0.35;
    wait(var_12);
    var_6 notify( "stop_idle" );
    var_2 notify( "stop_idle" );
    var_8 thread maps\_anim::anim_single_solo( var_8, "dumpster_push" );
    var_8 maps\_anim::anim_single_solo( var_6, "dumpster_push" );
    level.price.overridemovemode = undefined;
    level.price.force_crouch = undefined;
    var_8 notify( "stop_updating_clip" );
    var_9 disconnectpaths();
    var_6 allowedstances( "crouch", "stand", "prone" );
    level.price setgoalnode( getnode( "dumpster_push_afternode_dumpsterguy", "targetname" ) );
    var_6 setgoalnode( getnode( "dumpster_push_afternode_vasquez", "targetname" ) );
    level.price maps\_utility::enable_ai_color();
    var_6 maps\_utility::enable_ai_color();
    remove_alley_seperation_clip();
    common_scripts\utility::flag_set( "dumpster_pushed" );
}

remove_alley_seperation_clip()
{
    var_0 = getent( "alley_seperation_clip", "targetname" );

    if ( !isdefined( var_0 ) )
        return;

    var_0 connectpaths();
    var_0 delete();
}

dumpsterguy_push_condition1( var_0 )
{
    var_0 endon( "start_dumpster_push" );
    var_0 maps\_utility::waittill_player_lookat( level.cosine["65"] );
    common_scripts\utility::flag_set( "start_dumpster_push" );
    var_0 notify( "start_dumpster_push" );
}

dumpsterguy_push_condition2( var_0 )
{
    var_0 endon( "start_dumpster_push" );
    common_scripts\utility::flag_wait( "alley_cleared" );
    common_scripts\utility::flag_set( "start_dumpster_push" );
    var_0 notify( "start_dumpster_push" );
}

dumpsterguy_push_condition3( var_0 )
{
    var_0 endon( "start_dumpster_push" );
    common_scripts\utility::flag_wait( "player_passed_dumpster" );
    common_scripts\utility::flag_set( "start_dumpster_push" );
    var_0 notify( "start_dumpster_push" );
}

updateclippos( var_0 )
{
    self endon( "stop_updating_clip" );
    var_0.origin = self.origin;
    var_0.angles = self.angles;

    for (;;)
    {
        var_0 moveto( self.origin, 0.1 );
        var_0 rotateto( ( 0, self.angles[1], 0 ), 0.1 );
        wait 0.1;
    }
}

wait_to_reach_dumpster_node()
{
    common_scripts\utility::flag_init( "vasquez_in_position" );
    var_0 = getnode( "vasquez_dumpster_node", "targetname" );

    while ( distancesquared( self.origin, var_0.origin ) > 250000 )
        wait 0.05;

    self.pushplayer = 1;
    self.ignoreall = 1;

    while ( distancesquared( self.origin, var_0.origin ) > 100 )
        wait 0.05;

    self.pushplayer = undefined;
    self.ignoreall = 0;
    wait 1.5;
    common_scripts\utility::flag_set( "vasquez_in_position" );
}

alley_cleared()
{
    maps\_utility::waittill_aigroupcleared( "0" );
    common_scripts\utility::flag_set( "alley_cleared" );
    soundscripts\_snd::snd_message( "start_decrease_ambiance" );
    common_scripts\utility::flag_wait( "dumpster_pushed" );
    getent( "alley_protect_door_breech_color_trigger", "targetname" ) notify( "trigger" );
    var_0 = level.alleyfriends[0];

    if ( var_0 == level.price )
        var_0 = level.alleyfriends[1];

    alley_door_kick( var_0 );
    thread advancealleyfriendliestoend( level.alleyfriends[0], level.alleyfriends[1], level.alleyfriends[2] );
    common_scripts\utility::flag_clear( "aa_bog_b_zone_alley" );
    soundscripts\_snd::snd_message( "lastSequence_submix" );
}

alley_door_kick( var_0 )
{
    var_1[0] = var_0;
    var_1[1] = level.price;
    var_1[0].animname = "alley_door_kicker_left";
    var_1[1].animname = "alley_door_kicker_right";
    var_2 = getent( "alley_door_scripted_node", "targetname" );

    if ( getdvarint( "use_old_door_breach" ) == 1 )
    {
        thread alley_door_guy1_idle( var_2, var_1[0] );
        alley_door_vasquez_wait_on_other( var_1[0], var_2.origin );
        var_1[1].animname = "alley_door_kicker_right";
        var_2 maps\_anim::anim_reach_solo( var_1[1], "enter" );
        common_scripts\utility::flag_wait( "door_idle_guy_idling" );
        var_1[0] notify( "stop_door_idle" );
        var_1[0].animname = "alley_door_kicker_left";
        var_1[1].animname = "alley_door_kicker_right";
        var_2 maps\_anim::anim_single( var_1, "enter" );
    }
    else
    {
        level.price.animname = "price";
        var_0.animname = "alley_breach_buddy";
        var_3 = spawn( "script_origin", ( 3966.0, -4898.0, -111.97 ) );
        var_4 = [];
        var_4[0] = "at_alley_breach_price";
        var_4[1] = "at_alley_breach_alley_breach_buddy";
        var_3 thread anim_reach_orient_and_play( level.price, "alley_breach", var_4, "exposed" );
        var_3 anim_reach_orient_and_play( var_0, "alley_breach", var_4, "right" );
    }

    getent( "last_color_order_trigger", "targetname" ) notify( "trigger" );
    thread alley_door_remove_player_clip();
}

anim_reach_orient_and_play( var_0, var_1, var_2, var_3 )
{
    var_0 maps\_utility::disable_ai_color();
    var_0 thread breach_cqb_wait();
    maps\_anim::anim_reach_and_arrive_facing_anim_solo( var_0, var_1, var_3, 0.3 );
    common_scripts\utility::flag_set( "at_" + var_1 + "_" + var_0.animname );

    while ( !common_scripts\utility::flags( var_2 ) )
        waitframe();

    maps\_anim::anim_single_solo( var_0, var_1 );
    var_0 maps\_utility::disable_cqbwalk();
}

breach_cqb_wait()
{
    var_0 = 122500;

    for ( var_1 = distancesquared( self.origin, ( 3966.0, -4898.0, -111.97 ) ); var_1 > var_0; var_1 = distancesquared( self.origin, ( 3966.0, -4898.0, -111.97 ) ) )
        wait 0.2;

    maps\_utility::enable_cqbwalk();
}

alley_door_vasquez_wait_on_other( var_0, var_1 )
{
    level.price waittill( "goal" );
    var_2 = 400;
    var_3 = distancesquared( var_0.origin, var_1 );

    while ( var_3 > var_2 * var_2 )
    {
        var_3 = distancesquared( var_0.origin, var_1 );
        wait 0.2;
    }
}

alley_door_remove_player_clip( var_0 )
{
    if ( isdefined( var_0 ) )
        wait(var_0);

    getent( "alley_door_player_clip", "targetname" ) delete();
}

alley_door_guy1_idle( var_0, var_1 )
{
    var_0 maps\_anim::anim_reach_and_idle_solo( var_1, "idle_reach", "idle", "stop_door_idle" );
    common_scripts\utility::flag_set( "door_idle_guy_idling" );
}

alley_dooropen( var_0 )
{
    var_1 = getent( "alley_door", "targetname" );
    var_1 connectpaths();
    var_1 thread common_scripts\utility::play_sound_in_space( "metal_door_kick" );
    var_1 rotateyaw( -140, 0.5, 0, 0 );
    wait 0.5;
    var_1 disconnectpaths();
}

flyby()
{
    if ( getdvar( "bog_b_min_spec" ) == "1" )
        return;

    var_0 = getentarray( self.target, "targetname" );

    for ( var_1 = 0; var_1 < var_0.size; var_1++ )
        thread flyby_go( var_0[var_1] );
}

flyby_go( var_0 )
{
    var_1 = getent( var_0.target, "targetname" );
    var_2 = ( ( var_0.origin[0] + var_1.origin[0] ) / 2, ( var_0.origin[1] + var_1.origin[1] ) / 2, 0 );
    var_3 = vectortoangles( var_1.origin - var_0.origin );
    var_4 = ( 0, var_3[1], 0 );
    var_5 = -20000;
    var_6 = 20000;
    var_7 = 4000;
    var_8 = var_2 + anglestoforward( var_4 ) * var_5;
    var_8 += ( 0, 0, var_0.origin[2] );
    var_9 = var_2 + anglestoforward( var_4 ) * var_6;
    var_9 += ( 0, 0, var_1.origin[2] );
    self waittill( "trigger" );
    var_10 = spawn( "script_model", var_8 );
    var_10 setmodel( "vehicle_av8b_harrier_jet" );
    var_10.angles = var_4;
    var_11 = abs( var_5 - var_6 );
    var_12 = var_11 / var_7;
    var_10 moveto( var_9, var_12, 0, 0 );
    playfxontag( level._effect["contrail"], var_10, "tag_right_wingtip" );
    playfxontag( level._effect["contrail_02"], var_10, "tag_left_wingtip" );
    thread flyby_planesound( var_10 );
    wait(var_12);
    var_10 notify( "delete" );
    var_10 delete();
}

flyby_afterburner( var_0 )
{
    var_0 endon( "delete" );
    wait(randomfloatrange( 0.5, 2.5 ));
    playfxontag( level._effect["afterburner"], var_0, "tag_engine_right" );
    playfxontag( level._effect["afterburner"], var_0, "tag_engine_left" );
}

flyby_planesound( var_0 )
{
    var_0 thread common_scripts\utility::play_loop_sound_on_entity( "veh_mig29_dist_loop" );

    while ( !vehicle_scripts\_mig29::playerisclose( var_0 ) )
        wait 0.05;

    var_0 notify( "stop soundveh_mig29_dist_loop" );
    var_0 thread common_scripts\utility::play_loop_sound_on_entity( "veh_mig29_close_loop" );
    var_0 thread maps\_utility::play_sound_on_entity( "veh_mig29_passby" );

    while ( vehicle_scripts\_mig29::playerisinfront( var_0 ) )
        wait 0.05;

    wait 0.5;
    var_0 thread common_scripts\utility::play_sound_in_space( "veh_mig29_sonic_boom" );
    thread flyby_afterburner( var_0 );

    while ( vehicle_scripts\_mig29::playerisclose( var_0 ) )
        wait 0.05;

    var_0 notify( "stop soundveh_mig29_close_loop" );
    var_0 thread common_scripts\utility::play_loop_sound_on_entity( "veh_mig29_dist_loop" );
    var_0 waittill( "delete" );
    var_0 notify( "stop soundveh_mig29_dist_loop" );
}

teamssplitup()
{
    getent( "teams_split_up", "script_noteworthy" ) waittill( "trigger" );
    var_0 = getent( "price_inside_split_up_house", "targetname" );

    for (;;)
    {
        var_0 waittill( "trigger", var_1 );

        if ( !isdefined( var_1 ) )
            continue;

        if ( var_1 == level.price )
            break;
    }

    level.price.animname = "price";
    maps\_anim::anim_single_solo( level.price, "keeppinned" );

    if ( isdefined( level.grigsby ) )
    {
        level.grigsby.animname = "grigsby";
        thread maps\_anim::anim_single_solo( level.grigsby, "staysharp" );
    }

    thread friendly_reinforcements_magic_bullet();
    var_2 = getaiarray( "allies" );

    for ( var_3 = 0; var_3 < var_2.size; var_3++ )
    {
        var_2[var_3] maps\_utility::set_ignoresuppression( 1 );

        if ( isdefined( var_2[var_3].magic_bullet_shield ) && var_2[var_3].magic_bullet_shield )
            continue;

        var_2[var_3] thread maps\_utility::magic_bullet_shield( undefined, undefined, 5.0 );
    }

    common_scripts\utility::flag_clear( "aa_bog_b_zone_streets" );
    common_scripts\utility::flag_set( "aa_bog_b_zone_alley" );
}

lastsequence()
{
    thread t72_kill_player_trigger();

    if ( getdvarint( "use_old_t72battle" ) )
        thread t72_in_final_position_preh1();
    else
        thread t72_in_final_position();

    common_scripts\utility::flag_wait( "price_at_spotter" );
    level.price.noreload = 1;
    common_scripts\utility::flag_wait( "ok_to_do_spotting" );
    maps\_utility::arcademode_checkpoint( 3.0, "t72" );
    level.price.animname = "price";
    level.price maps\_anim::anim_single_solo( level.price, "casual_2_spot" );
    level.price thread maps\_anim::anim_loop_solo( level.price, "spot", undefined, "stop_idle" );
    level.price thread maps\_anim::anim_single_solo( level.price, "t72behind" );
    wait 3;
    common_scripts\utility::flag_set( "abrams_move_shoot_t72" );

    if ( getdvarint( "use_old_t72battle" ) )
    {
        wait 3.0;
        level.player playradiosound( level.scr_sound["tank_commander"]["switchmanual"] );
    }
    else
    {
        wait 4.0;
        level.player thread playradiosound( level.scr_sound["tank_commander"]["switchmanual"] );
        wait 2.5;
        level.abrams setturrettargetent( level.t72, ( 0.0, 0.0, 50.0 ) );
    }

    if ( getdvarint( "use_old_celebration" ) == 1 )
        thread finalgenericdialog();
    else
        thread finalgenericdialog_h1();

    common_scripts\utility::flag_wait( "tank_in_final_position" );
    common_scripts\utility::flag_wait( "tank_turret_aimed_at_t72" );
    level.player playradiosound( level.scr_sound["tank_commander"]["takeshot"] );
    level.abrams clearturrettarget();
    level.abrams setvehweapon( "m1a1_turret_blank" );
    wait 0.05;
    level.t72 notify( "exploding" );
    level.t72 maps\_vehicle::mgoff();
    level.abrams fireweapon();
    level.abrams maps\bog_b_anim::shoot_m1a1_anim();
    level notify( "t72_exploded" );
    common_scripts\_exploder::exploder( 400 );
    soundscripts\_snd::snd_message( "start_t72_wall_explode_mix" );
    level.player.ignoreme = 0;

    for ( var_0 = 0; var_0 < level.alleyfriends.size; var_0++ )
        level.alleyfriends[var_0].ignoreme = 0;

    var_1 = getentarray( "end_sequence_physics_explosion", "targetname" );

    for ( var_0 = 0; var_0 < var_1.size; var_0++ )
        physicsexplosionsphere( var_1[var_0].origin, 550, 100, 1.2 );

    wait 0.2;
    level thread t72_explosion_explode();
    level thread enemies_fall_back();
    common_scripts\utility::flag_wait( "friendly_reactions_over" );
    level.price.animname = "price";

    if ( getdvarint( "use_old_celebration" ) == 1 )
    {
        maps\_anim::anim_single_solo( level.price, "niceshootingpig" );
        level.player playradiosound( level.scr_sound["tank_commander"]["comingthrough"] );
        common_scripts\utility::flag_set( "abrams_advance_to_end_level" );
        wait 2;
    }
    else
    {
        level.price waittillmatch( "single anim", "end" );
        common_scripts\utility::flag_set( "abrams_advance_to_end_level" );
    }

    level.player playradiosound( level.scr_sound["tank_commander"]["wethereyet"] );
    level.player playradiosound( level.scr_sound["hq_radio"]["statusover"] );
    level.price.animname = "price";
    maps\_anim::anim_single_solo( level.price, "cargo" );
    level.price notify( "stop_idle" );
    level.price.noreload = undefined;
    thread seaknight();
}

t72_kill_player_trigger()
{
    level endon( "t72_exploded" );
    var_0 = getent( "t72_kill_player_trigger", "targetname" );

    for (;;)
    {
        var_0 waittill( "trigger", var_1 );

        if ( !isplayer( var_1 ) )
            continue;

        var_2 = level.player.health / 3;

        while ( isalive( level.player ) )
        {
            wait 0.1;

            if ( isdefined( level.t72 ) )
            {
                level.t72 thread maps\_utility::play_sound_on_entity( "t72_fire" );
                level.player dodamage( var_2, level.t72.origin );
                continue;
            }

            thread common_scripts\utility::play_sound_in_space( "t72_fire", ( 6105.0, -3475.0, -60.0 ) );
            level.player dodamage( var_2, level.player.origin );
        }

        level notify( "new_quote_string" );
        setdvar( "ui_deadquote", "@BOG_B_T72_MG_DEATH" );
    }
}

t72_explosion_explode()
{
    level.t72 hide();
    var_0 = level.t72.mgturret;
    var_1 = spawn( "script_model", level.t72.origin );
    var_1.angles = level.t72.angles;
    var_1 setmodel( level.t72.model );
    level.t72 = var_1;
    var_1 = undefined;
    soundscripts\_snd::snd_message( "start_t72_hit_mix" );
    level.t72 overridematerial( "mtl_h1_t72_tread", "mtl_h1_t72_tread_static" );
    level.t72 thread common_scripts\utility::play_sound_in_space( "bog_scn_tankturret_brew" );
    level.t72 thread t72_explosionfx();
    level.t72 useanimtree( level.scr_animtree["tank_explosion"] );
    level.t72 setflaggedanim( "tank_explosion_anim1", level.scr_anim["tank"]["explosion1"], 1, 0.1, 1 );
    level.t72 waittillmatch( "tank_explosion_anim1", "end" );
    level.t72 setmodel( "vehicle_t72_tank_d_animated_sequence" );
    earthquake( 0.6, 1.0, level.t72.origin, 8000 );
    common_scripts\utility::array_thread( var_0, ::turret_deleteme );
    level.t72 setflaggedanimknobrestart( "tank_explosion_anim2", level.scr_anim["tank"]["explosion2"], 1, 0.1, 1 );
    level.t72 waittillmatch( "tank_explosion_anim2", "turret_explosion" );
    soundscripts\_snd::snd_message( "start_t72_explode_mix" );
}

t72_explosionfx()
{
    physicsexplosionsphere( level.t72.origin, 1000, 20, 2 );
    playfxontag( level._effect["t72_ammo_breach"], level.t72, "tag_deathfx" );
    radiusdamage( level.t72.origin, 550, 30, 10 );
    wait 3.5;
    thread friendlyreactionanims();
    common_scripts\utility::flag_set( "t72_exploded" );
    playfxontag( level._effect["t72_ammo_explosion"], level.t72, "tag_deathfx" );
    wait 0.15;
    physicsexplosionsphere( level.t72.origin, 1000, 100, 2 );
    radiusdamage( level.t72.origin, 750, 100, 20 );
    wait 1.4;
    playfxontag( level._effect["firelp_large_pm"], level.t72, "tag_deathfx" );
    level.t72 thread common_scripts\utility::play_loop_sound_on_entity( "fire_metal_large" );
}

turret_deleteme()
{
    self delete();
}

abrams_setup_t72()
{
    thread abrams_moveto_t72();
    thread abrams_aimat_t72();
}

abrams_moveto_t72()
{
    common_scripts\utility::flag_set( "abrams_start_moving_after_city_fight" );
    thread abrams_moveto_t72_clearturret();
    level.abrams.wheeldir = 1;
    level.abrams resumespeed( 3 );
    level.abrams setwaitnode( getvehiclenode( "tank_shoots_t72_node", "script_noteworthy" ) );
    level.abrams waittill( "reached_wait_node" );
    level.abrams vehicle_setspeed( 0, 1000, 1000 );
    common_scripts\utility::flag_set( "tank_in_final_position" );
}

abrams_moveto_t72_clearturret()
{
    level.abrams notify( "stop_attacking_troops" );
    wait 0.05;
    level.abrams setturrettargetent( level.abrams.forwardent );
    level.abrams common_scripts\utility::waittill_notify_or_timeout( "turret_rotate_stopped", 4.0 );
    level.abrams clearturrettarget();
}

abrams_aimat_t72()
{
    common_scripts\utility::flag_wait( "t72_in_final_position" );
    common_scripts\utility::flag_wait( "tank_in_final_position" );
    level.abrams notify( "stop_attacking_troops" );
    level.abrams setturrettargetvec( level.t72.origin + ( 0.0, 0.0, 50.0 ) );

    if ( getdvarint( "use_old_t72battle" ) )
        level.abrams common_scripts\utility::waittill_notify_or_timeout( "turret_rotate_stopped", 3.0 );
    else
        wait 0.25;

    common_scripts\utility::flag_set( "tank_turret_aimed_at_t72" );
}

enemies_fall_back()
{
    thread killspawner( 8 );
    var_0 = getnode( "enemy_fallback_node", "targetname" );
    common_scripts\utility::array_thread( getaiarray( "axis" ), ::enemies_fall_back_thread, var_0 );
    common_scripts\utility::array_thread( getaiarray( "allies" ), ::friendlies_become_awesome );
}

enemies_fall_back_thread( var_0 )
{
    self.goalradius = var_0.radius;
    self.health = 1;
    self setgoalnode( var_0 );
}

friendlies_become_awesome()
{
    self.baseaccuracy = 5000;
    self.grenadeammo = 0;
}

friendly_reinforcements_magic_bullet()
{
    level notify( "friendly_reinforcements_magic_bullet" );
    level endon( "friendly_reinforcements_magic_bullet" );

    for (;;)
    {
        level waittill( "reinforcement_spawned", var_0 );

        if ( !isdefined( var_0 ) )
            continue;

        if ( !isalive( var_0 ) )
            continue;

        var_0 thread maps\_utility::magic_bullet_shield( undefined, undefined, 5.0 );
    }
}

getfivefriendliestimeout( var_0 )
{
    level endon( "got 5 friendlies" );
    wait(var_0);
}

finalgenericdialog()
{
    var_0 = getaiarray( "allies" );
    var_1 = [];

    for ( var_2 = 0; var_2 < var_0.size; var_2++ )
    {
        if ( var_0[var_2] == level.price )
            continue;

        var_1[var_1.size] = var_0[var_2];
    }

    level thread getfivefriendliestimeout( 8.0 );

    for (;;)
    {
        if ( var_1.size >= 5 )
            break;

        level waittill( "reinforcement_spawned", var_3 );

        if ( !isdefined( var_3 ) )
            continue;

        if ( !isalive( var_3 ) )
            continue;

        var_1[var_1.size] = var_3;
    }

    level notify( "got 5 friendlies" );
    var_1[0].animname = "gm1";
    var_1[1].animname = "gm2";
    var_1[2].animname = "gm3";
    var_1[3].animname = "gm4";
    var_1[4].animname = "gm5";
    common_scripts\utility::flag_wait( "t72_exploded" );
    soundscripts\_snd::snd_message( "lastSequence_celebration_submix" );
    wait 2;
    var_1[0].animname = "gm1";
    var_1[1].animname = "gm2";
    var_1[2].animname = "gm3";
    var_1[3].animname = "gm4";
    var_1[4].animname = "gm5";
    thread maps\_anim::anim_single_solo( var_1[0], "wooyeah" );
    wait 1.5;
    thread maps\_anim::anim_single_solo( var_1[1], "holyshit" );
    wait 1.75;
    thread maps\_anim::anim_single_solo( var_1[3], "yeahwoo" );
    wait 1.5;
    thread maps\_anim::anim_single_solo( var_1[4], "talkinabout" );
    wait 2.3;
    common_scripts\utility::flag_set( "friendly_reactions_over" );
}

finalgenericdialog_h1()
{
    var_0 = getaiarray( "allies" );
    var_1 = [];

    for ( var_2 = 0; var_2 < var_0.size; var_2++ )
    {
        if ( var_0[var_2] == level.price )
            continue;

        if ( isdefined( var_0[var_2].script_noteworthy ) && var_0[var_2].script_noteworthy == "doorblocker" )
            continue;

        if ( isdefined( var_0[var_2].script_noteworthy ) && var_0[var_2].script_noteworthy == "third_soldier" )
            continue;

        var_1[var_1.size] = var_0[var_2];
    }

    for (;;)
    {
        if ( var_1.size >= 2 )
            break;

        level waittill( "reinforcement_spawned", var_3 );

        if ( !isdefined( var_3 ) )
            continue;

        if ( !isalive( var_3 ) )
            continue;

        var_1[var_1.size] = var_3;
    }

    var_1[0].animname = "gm2";
    var_1[1].animname = "gm4";
    common_scripts\utility::flag_wait( "t72_exploded" );
    soundscripts\_snd::snd_message( "lastSequence_celebration_submix" );
    wait 2;
    var_1[0].animname = "gm2";
    var_1[1].animname = "gm4";
    wait 1.5;
    thread maps\_anim::anim_single_solo( var_1[0], "holyshit" );
    wait 1.75;
    thread maps\_anim::anim_single_solo( var_1[1], "yeahwoo" );
    wait 3.8;
    common_scripts\utility::flag_set( "friendly_reactions_over" );
}

friendlyreactionanims()
{
    var_0 = getaiarray( "allies" );

    for ( var_1 = 0; var_1 < var_0.size; var_1++ )
    {
        if ( !isalive( var_0[var_1] ) )
            continue;

        if ( var_0[var_1] == level.price )
        {
            var_0[var_1] thread price_react_and_loop();
            continue;
        }

        if ( isdefined( var_0[var_1].script_noteworthy ) && var_0[var_1].script_noteworthy == "doorblocker" )
        {
            var_0[var_1] thread guard_react_and_celebrate();
            continue;
        }

        var_0[var_1].animname = "casualcrouch";

        if ( getdvarint( "use_old_celebration" ) == 1 )
        {
            var_0[var_1] thread maps\_anim::anim_single_solo( var_0[var_1], "react" );
            continue;
        }

        if ( isdefined( var_0[var_1].script_noteworthy ) && var_0[var_1].script_noteworthy == "third_soldier" )
        {
            var_0[var_1] thread maps\_anim::anim_single_solo( var_0[var_1], "new_react" );
            continue;
        }

        var_0[var_1] thread maps\_anim::anim_single_solo( var_0[var_1], "react" );
    }
}

guard_react_and_celebrate()
{
    self.animname = "guard";

    if ( getdvarint( "use_old_celebration" ) == 1 )
    {
        maps\_anim::anim_single_solo( self, "react" );
        wait 1.0;
        thread maps\_anim::anim_single_solo( self, "celebrate" );
    }
    else
        maps\_anim::anim_single_solo( self, "new_react" );
}

price_react_and_loop()
{
    self notify( "stop_idle" );

    if ( getdvarint( "use_old_celebration" ) == 1 )
        maps\_anim::anim_single_solo( self, "react" );
    else
        maps\_anim::anim_single_solo( self, "new_react" );

    thread maps\_anim::anim_loop_solo( self, "spot", undefined, "stop_idle" );
}

advancealleyfriendliestoend( var_0, var_1, var_2 )
{
    var_3 = undefined;

    if ( var_0 != level.price )
        var_3 = var_0;
    else if ( var_1 != level.price )
        var_3 = var_1;

    var_4 = undefined;

    if ( var_0 != level.price && var_0 != var_3 )
        var_4 = var_0;
    else if ( var_1 != level.price && var_1 != var_3 )
        var_4 = var_1;
    else if ( isdefined( var_2 ) && var_2 != level.price && var_2 != var_3 )
        var_4 = var_2;

    if ( isdefined( var_4 ) )
        var_4.script_noteworthy = "third_soldier";

    level.player.ignoreme = 1;

    for ( var_5 = 0; var_5 < level.alleyfriends.size; var_5++ )
        level.alleyfriends[var_5].ignoreme = 1;

    remove_alley_seperation_clip();
    var_3 maps\_utility::set_force_color( "b" );
    var_3.goalradius = 16;
    var_6 = getnode( "door_blocker_node", "targetname" );
    var_3 setgoalnode( var_6 );
    var_3 thread doorblocker_anim_on_trigger( var_6 );
    var_3 thread doorblocker_reach_door();
    var_3.script_noteworthy = "doorblocker";
    var_7 = getent( "doorblocker_clip", "targetname" );
    var_7.origin = var_3 gettagorigin( "tag_origin" );
    var_7.angles = var_3 gettagangles( "tag_origin" );
    var_7 linkto( var_3, "tag_origin" );
    var_3.player_clip = var_7;
    thread doorblocker_slow_trigger();
    level.price maps\_utility::set_force_color( "o" );
    level.price.goalradius = 16;
    level.price setgoalnode( getnode( "price_last_node1", "targetname" ) );
    level.price waittill( "goal" );

    if ( isdefined( var_4 ) )
        vasquez_wait_on_other_marine( var_4 );
    else
        wait 4.0;

    level.price setgoalnode( getnode( "price_last_node2", "targetname" ) );
    level.price waittill( "goal" );
    common_scripts\utility::flag_set( "price_at_spotter" );
}

vasquez_wait_on_other_marine( var_0 )
{
    wait 2.0;
    var_1 = 22500;
    var_2 = distancesquared( level.price.origin, var_0.origin );
    var_3 = var_2;
    var_4 = gettime();

    while ( var_2 <= var_3 && var_2 < var_1 )
    {
        wait 0.2;

        if ( !isdefined( var_0 ) )
            break;

        var_3 = var_2;
        var_2 = distancesquared( level.price.origin, var_0.origin );

        if ( gettime() - var_4 > 6000 )
            break;
    }
}

doorblocker_anim_on_trigger( var_0 )
{
    var_1 = getent( "door_block_trigger", "targetname" );
    var_1 waittill( "trigger" );
    self.animname = "guard";
    var_0 maps\_anim::anim_reach_solo( self, "stop" );
    common_scripts\utility::flag_set( "arrived_at_spotting" );
    thread disable_door_block_clip( getanimlength( level.scr_anim["guard"]["stop"] ) );
    maps\_utility::delaythread( 0.8, maps\_anim::anim_single_queue, self, "stop_snd" );
    var_0 maps\_anim::anim_single_solo( self, "stop" );
    getent( "last_color_order_trigger2", "targetname" ) notify( "trigger" );
    common_scripts\utility::flag_set( "ok_to_do_spotting" );
}

doorblocker_reach_door()
{
    self endon( "death" );
    self waittill( "goal" );
    common_scripts\utility::flag_set( "doorblocker_reach_door" );

    if ( isdefined( self.player_clip ) )
        self.player_clip delete();
}

disable_door_block_clip( var_0 )
{
    wait(var_0 - 2.0);
    var_1 = getent( "door_block_clip", "targetname" );
    var_1 delete();
}

doorblocker_slow_trigger()
{
    var_0 = getent( "doorblocker_slow_trig", "targetname" );

    while ( !common_scripts\utility::flag( "doorblocker_reach_door" ) )
    {
        if ( level.player istouching( var_0 ) )
        {
            if ( !isdefined( level.player.g_speed ) )
                thread maps\_utility::player_speed_set( 124, 1 );
        }
        else if ( isdefined( level.player.g_speed ) )
        {
            maps\_utility::player_speed_set( level.player.g_speed, 0.5 );
            level.player.g_speed = undefined;
        }

        waitframe();
    }

    if ( isdefined( level.player.g_speed ) )
    {
        maps\_utility::player_speed_set( level.player.g_speed, 0.5 );
        level.player.g_speed = undefined;
    }
}

t72_in_final_position_preh1()
{
    level.t72 = maps\_vehicle::waittill_vehiclespawn( "t72" );
    level.t72 waittill( "reached_end_node" );
    var_0 = getent( "exploder_300_target", "targetname" );
    level.t72 setturrettargetent( var_0 );
    level.t72 common_scripts\utility::waittill_notify_or_timeout( "turret_rotate_stopped", 4.0 );
    level.t72 clearturrettarget();
    level.t72 fireweapon();
    level.t72 maps\bog_b_anim::shoot_t72_anim();
    common_scripts\_exploder::exploder( 300 );
    wait 2.0;
    var_1 = getent( "t72_aim_at_final_building_location", "targetname" );
    level.t72 setturrettargetent( var_1 );
    level.t72 common_scripts\utility::waittill_notify_or_timeout( "turret_rotate_stopped", 4.0 );
    level.t72 clearturrettarget();

    if ( getdvar( "bog_debug_tank" ) == "1" )
    {
        var_2 = level.t72 gettagorigin( "tag_flash" );
        var_3 = level.t72 gettagorigin( "tag_turret" );
        var_1 = getent( "t72_aim_at_final_building_location", "targetname" );
        var_4 = abs( var_2[2] - var_3[2] );
        var_5 = distance( var_2, var_3 );
        var_6 = asin( var_4 / var_5 );
        iprintlnbold( "UP: " + var_6 );
        var_7 = anglestoforward( level.t72.angles );
        var_8 = vectornormalize( var_1.origin - level.t72.origin );
        var_9 = acos( vectordot( var_7, var_8 ) );
        iprintlnbold( "LEFT: " + var_9 );
    }

    common_scripts\utility::flag_set( "t72_in_final_position" );
}

t72_in_final_position()
{
    thread t72_exploder_detect_impact_init();
    level.t72 = maps\_vehicle::waittill_vehiclespawn( "t72" );
    wait 8;
    var_0 = getent( "t72_entry_target", "targetname" );
    level.t72 setturrettargetent( var_0 );
    level.t72 waittill( "reached_end_node" );

    if ( !common_scripts\utility::flag( "arrived_at_spotting" ) )
    {
        common_scripts\utility::flag_wait( "arrived_at_spotting" );
        wait 1.5;
    }

    var_1 = getent( "exploder_300_target", "targetname" );
    level.t72 setturrettargetent( var_1 );
    level.t72 common_scripts\utility::waittill_notify_or_timeout( "turret_rotate_stopped", 4.0 );
    level.t72 clearturrettarget();
    wait 1;
    level.t72 fireweapon();
    level.t72 maps\bog_b_anim::shoot_t72_anim();
    t72_exploder_detect_impact_delay();
    common_scripts\_exploder::exploder( 300 );
    thread sustain_fire();
    common_scripts\utility::flag_wait( "tank_in_final_position" );
    wait 0.8;
    var_2 = getent( "t72_aim_at_final_building_location", "targetname" );
    level.t72 setturrettargetent( var_2 );
    common_scripts\utility::flag_set( "t72_in_final_position" );
}

t72_exploder_detect_impact_init()
{
    if ( getdvarint( "use_old_exploderdelay" ) )
        return;

    level.t72_impact_detector = getent( "exploder_detectimpact_300", "targetname" );

    if ( !isdefined( level.t72_impact_detector ) )
        return;

    level.t72_impact_detector notsolid();
}

t72_exploder_detect_impact_delay()
{
    if ( getdvarint( "use_old_exploderdelay" ) )
        return;

    if ( !isdefined( level.t72_impact_detector ) )
        return;

    shoot_exploder_detect_damage( level.t72_impact_detector, "script_vehicle_t72_tank" );
    level.t72_impact_detector delete();
}

sustain_fire()
{
    while ( !common_scripts\utility::flag( "tank_in_final_position" ) )
    {
        wait(randomintrange( 7, 10 ));

        if ( !common_scripts\utility::flag( "tank_in_final_position" ) )
        {
            level.t72 fireweapon();
            common_scripts\_exploder::exploder( 300 );
        }
    }
}

vehicle_path_disconnector()
{
    var_0 = getent( self.target, "targetname" );
    var_0 notsolid();
    var_0.origin -= ( 0.0, 0.0, 1024.0 );
    var_1 = "tank_bad_place_brush_" + var_0 getentitynumber();

    for (;;)
    {
        self waittill( "trigger", var_2 );

        if ( var_2 vehicle_getspeed() == 0 )
            continue;

        if ( !isdefined( var_0.pathsdisconnected ) )
        {
            var_0 solid();
            badplace_brush( var_1, 0, var_0, "allies", "axis" );
            var_0 notsolid();
            var_0.pathsdisconnected = 1;
        }

        thread vehicle_reconnects_paths( var_0, var_1 );
    }
}

vehicle_reconnects_paths( var_0, var_1 )
{
    var_0 notify( "waiting_for_path_reconnection" );
    var_0 endon( "waiting_for_path_reconnection" );
    wait 0.25;
    var_0 solid();
    badplace_delete( var_1 );
    var_0 notsolid();
    var_0.pathsdisconnected = undefined;
}

delete_ai_in_zone()
{
    var_0 = getent( self.target, "targetname" );
    self waittill( "trigger" );
    var_1 = getaiarray( "axis" );

    for ( var_2 = 0; var_2 < var_1.size; var_2++ )
    {
        if ( var_1[var_2] istouching( var_0 ) )
            var_1[var_2] delete();
    }
}

delete_all_axis()
{
    self waittill( "trigger" );
    var_0 = getaiarray( "axis" );

    for ( var_1 = 0; var_1 < var_0.size; var_1++ )
    {
        if ( isdefined( var_0[var_1].magic_bullet_shield ) && var_0[var_1].magic_bullet_shield )
            var_0[var_1] maps\_utility::stop_magic_bullet_shield();

        var_0[var_1] delete();
    }
}

autosave_when_trigger_cleared()
{
    for (;;)
    {
        self waittill( "trigger" );

        if ( !ai_touching_area( self ) )
            break;

        wait 3;
    }

    if ( !common_scripts\utility::flag( "reached_alley_autosave" ) )
        thread dosavegame( self.script_noteworthy );
}

dosavegame( var_0 )
{
    if ( !savegame_redundancy_check() )
        return;

    maps\_utility::autosave_by_name( var_0 );
}

savegame_redundancy_check()
{
    if ( !isdefined( level.lastsavetime ) )
        return 1;

    if ( level.lastsavetime + level.minimumtimebetweenautosaves * 1000 > gettime() )
        return 0;

    return 1;
}

waittill_zone_clear( var_0 )
{
    var_1 = getent( var_0, "targetname" );

    while ( ai_touching_area( var_1 ) )
        wait 2;
}

ai_touching_area( var_0 )
{
    var_1 = getaiarray( "axis" );

    for ( var_2 = 0; var_2 < var_1.size; var_2++ )
    {
        if ( var_1[var_2] istouching( var_0 ) )
            return 1;
    }

    return 0;
}

tank_advancement_bog()
{
    common_scripts\utility::flag_init( "truck_crush_tank_in_position" );
    thread truck_crush_tank_in_position();
    thread truck_tank_collide_think( "truck1", "truck_tank_collide_node", 0.7 );
    level.abrams thread tank_turret_forward();
    level.abrams thread attack_troops();
    common_scripts\utility::flag_wait( "truck_crush_tank_in_position" );
    common_scripts\utility::flag_wait( "truck_crush_player_in_position" );
    thread dosavegame( "tank_crush" );
    var_0 = getent( "crunch_truck_1", "targetname" );
    var_1 = 10;

    for ( var_2 = 0; var_2 < var_1 * 20; var_2++ )
    {
        if ( common_scripts\utility::within_fov( level.player geteye(), level.player getplayerangles(), var_0.origin, level.cosine["65"] ) )
            break;

        wait 0.05;
    }

    var_3 = getvehiclenode( "tank_path_2", "targetname" );
    level.abrams resumespeed( 5 );
    level.abrams notify( "newpath" );
    level thread maps\_utility::notify_delay( "truck1_stop_collide_think", 2.5 );
    var_0 thread swap_crush_material( level.scr_anim["truck"]["tank_crush"] );
    level.abrams maps\_vehicle::tank_crush( var_0, var_3, level.scr_anim["tank"]["tank_crush"], level.scr_anim["truck"]["tank_crush"], level.scr_animtree["tank_crush"], level.scr_sound["tank_crush"], 1, ::rotate_crushed_truck_clip );
    common_scripts\utility::flag_clear( "aa_bog_b_zone_bog" );
    common_scripts\utility::flag_set( "aa_bog_b_zone_streets" );
    maps\_utility::arcademode_checkpoint( 7.0, "streets" );
    thread tank_advancement_arch();
}

archway_color_trigger()
{
    var_0 = getent( "pre_archway_color_trigger", "targetname" );
    var_1 = getent( "post_archway_color_trigger", "targetname" );
    var_0 common_scripts\utility::trigger_off();
    var_1 common_scripts\utility::trigger_off();
    var_2 = getvehiclenode( "truck_approach_crush_node", "script_noteworthy" );
    var_2 waittill( "trigger" );
    var_3 = getentarray( "pre_arch_friendly_advancement_trigger", "targetname" );
    common_scripts\utility::array_thread( var_3, common_scripts\utility::trigger_off );
    var_0 common_scripts\utility::trigger_on();
    var_0 maps\_utility::activate_trigger();
    var_2 = getvehiclenode( "stop_for_city_fight1", "script_noteworthy" );
    var_2 waittill( "trigger" );
    var_0 common_scripts\utility::trigger_off();
    var_1 common_scripts\utility::trigger_on();
}

tank_advancement_arch()
{
    level.abrams thread ambush_ahead_dialog();
    var_0 = getvehiclenode( "stop_for_city_fight1", "script_noteworthy" );
    level.abrams setwaitnode( var_0 );
    level.abrams waittill( "reached_wait_node" );
    level.abrams vehicle_setspeed( 0, 10 );
    level.abrams thread shoot_buildings( 0 );
    level.abrams waittill( "abrams_shot_explodergroup" );
    soundscripts\_snd::snd_message( "start_increase_ambiance" );
    level.abrams thread attack_troops();
    waittill_zone_clear( "tank_zone_1" );
    maps\_utility::battlechatter_off( "allies" );
    level.player playradiosound( level.scr_sound["tank_commander"]["movingup"] );
    wait 0.1;
    level.price.animname = "price";
    level.price thread maps\_anim::anim_single_solo( level.price, "roger" );
    maps\_utility::battlechatter_on( "allies" );
    level.abrams resumespeed( 3 );
    common_scripts\utility::flag_set( "abrams_start_moving_after_city_fight" );
    var_0 = getvehiclenode( "stop_for_city_fight2", "script_noteworthy" );
    level.abrams setwaitnode( var_0 );
    level.abrams waittill( "reached_wait_node" );
    level.abrams vehicle_setspeed( 0, 10 );
    level.abrams thread shoot_buildings( 1 );
    level.abrams waittill( "abrams_shot_explodergroup" );
    level.abrams thread attack_troops();
    waittill_zone_clear( "tank_zone_2" );
    thread dosavegame( "tank_progress_corner" );
    maps\_utility::battlechatter_off( "allies" );
    level.player playradiosound( level.scr_sound["tank_commander"]["cleartoadvance"] );
    wait 0.1;
    level.price.animname = "price";
    level.price maps\_anim::anim_single_solo( level.price, "rogermoveup" );
    wait 0.1;
    level.player thread playradiosound( level.scr_sound["tank_commander"]["rogermoving"] );
    maps\_utility::battlechatter_on( "allies" );
    common_scripts\utility::flag_set( "abrams_start_moving_after_city_fight" );
    level.abrams resumespeed( 3 );
    var_0 = getvehiclenode( "stop_for_city_fight3", "script_noteworthy" );
    level.abrams setwaitnode( var_0 );
    level.abrams waittill( "reached_wait_node" );
    level.abrams vehicle_setspeed( 0, 10 );
    level.abrams thread shoot_buildings( 2 );
    level.abrams waittill( "abrams_shot_explodergroup" );
    level.abrams thread attack_troops();
    thread tank_advancement_alley();
}

tank_advancement_alley()
{
    common_scripts\utility::flag_wait( "abrams_move_shoot_t72" );
    thread abrams_setup_t72();
    common_scripts\utility::flag_wait( "abrams_advance_to_end_level" );
    var_0 = getvehiclenode( "tank_crush_truck2", "script_noteworthy" );
    var_1 = getent( "crunch_truck_2", "targetname" );
    var_2 = getvehiclenode( "tank_path_4", "targetname" );
    level.abrams notify( "stop_attacking_troops" );
    wait 0.05;
    level.abrams setturrettargetent( level.abrams.forwardent );
    level.abrams common_scripts\utility::waittill_notify_or_timeout( "turret_rotate_stopped", 4.0 );
    level.abrams clearturrettarget();
    common_scripts\utility::flag_set( "abrams_start_moving_after_city_fight" );
    thread truck_tank_collide_think( "truck2", "tank_crush_truck2" );
    level.abrams resumespeed( 3 );
    level.abrams setwaitnode( var_0 );
    level.abrams waittill( "reached_wait_node" );
    level thread maps\_utility::notify_delay( "truck2_stop_collide_think", 2.5 );
    var_1 thread swap_crush_material( level.scr_anim["truck"]["tank_crush"] );
    level.abrams maps\_vehicle::tank_crush( var_1, var_2, level.scr_anim["tank"]["tank_crush2"], level.scr_anim["truck"]["tank_crush2"], level.scr_animtree["tank_crush2"], level.scr_sound["tank_crush2"], 1, ::rotate_crushed_truck_clip );
    level.abrams.wheeldir = 1;
    level.abrams setturrettargetent( getent( "final_abrams_aim_spot", "targetname" ) );
    level.abrams vehicle_setspeed( 0, 10, 10 );
}

seaknight()
{
    soundscripts\_snd::snd_message( "seaknight_rescue_submix" );
    var_0 = getent( "seaknight_path", "targetname" );
    var_1 = getent( "seaknight_land_location", "script_noteworthy" );
    objective_state( 1, "done" );
    wait 1.0;
    var_2 = getent( "seaknight_wait_location", "script_noteworthy" );
    objective_add( 2, "current", &"BOG_B_OBJ_SEAKNIGHT", var_2.origin );
    thread dosavegame( "seaknight" );
    common_scripts\utility::flag_set( "seaknight_start" );
    thread disperse_allies_unevenly_to_seaknight();
    getent( "seaknight_friendly_trigger", "targetname" ) notify( "trigger" );
    level.seaknight = maps\_vehicle::spawn_vehicle_from_targetname_and_drive( "seaknight" );
    level.seaknight setmodel( "vehicle_ch46e_opened_door_interior_a" );
    var_3 = spawn( "script_model", level.seaknight gettagorigin( "body_animate_jnt" ) );
    var_3 setmodel( "vehicle_ch46e_opened_door_interior_b" );
    var_3.angles = level.seaknight.angles;
    var_3 linkto( level.seaknight, "body_animate_jnt" );
    var_4 = spawn( "script_model", level.seaknight gettagorigin( "body_animate_jnt" ) );
    var_4 setmodel( "vehicle_ch46e_wires" );
    var_4.angles = level.seaknight.angles;
    var_4 linkto( level.seaknight, "body_animate_jnt" );
    maps\_wibble::wibble_add_heli_to_track( level.seaknight );
    maps\_utility::playerwatch_register_crusher( level.seaknight );
    wait 0.05;
    var_5 = level.seaknight.riders;
    thread seaknight_dialog();
    var_1 waittill( "trigger", var_6 );
    objective_position( 2, var_1.origin );
    var_6.dontdisconnectpaths = 1;
    var_6 maps\_utility::vehicle_detachfrompath();
    var_6 maps\_utility::vehicle_land();
    var_6 sethoverparams( 0, 0, 0 );
    var_6 thread seaknight_doors_open();
    getent( "player_in_seaknight", "targetname" ) waittill( "trigger" );
    wait 5.0;
    common_scripts\utility::flag_wait( "seaknight_dialog_done" );
    maps\_utility::nextmission();
}

disperse_allies_unevenly_to_seaknight()
{
    var_0 = getaiarray( "allies" );

    if ( var_0.size > 0 )
    {
        for ( var_1 = 1; var_1 <= 3; var_1++ )
        {
            var_2 = getnodearray( "overlook_jumpdown_" + var_1, "script_noteworthy" );
            var_3 = get_traverse_node_start( var_2 );
            var_3 disconnectnode();
        }

        wait 0.05;

        for ( var_1 = 0; var_1 < level.alleyfriends.size; var_1++ )
        {
            if ( isdefined( level.alleyfriends[var_1] ) && isalive( level.alleyfriends[var_1] ) )
            {
                level.alleyfriends[var_1].ignoreall = 1;
                var_2 = getnodearray( "overlook_jumpdown_" + ( var_1 + 1 ), "script_noteworthy" );
                var_3 = get_traverse_node_start( var_2 );
                var_3 connectnode();
                wait 0.05;
                level.alleyfriends[var_1] maps\_utility::set_force_color( "c" );
                level.alleyfriends[var_1] waittill( "traverse_started" );
                wait 1;
                wait(randomfloatrange( 0.05, 0.15 ));
                var_3 disconnectnode();
            }
        }

        for ( var_1 = 1; var_1 <= 3; var_1++ )
        {
            var_2 = getnodearray( "overlook_jumpdown_" + var_1, "script_noteworthy" );
            var_3 = get_traverse_node_start( var_2 );
            var_3 connectnode();
        }

        for ( var_1 = 0; var_1 < var_0.size; var_1++ )
        {
            if ( !common_scripts\utility::array_contains( level.alleyfriends, var_0[var_1] ) )
                var_0[var_1] thread maps\_utility::set_force_color( "c" );
        }

        common_scripts\utility::array_thread( var_0, ::look_at_player );
    }
}

look_at_player()
{
    self waittill( "goal" );
    thread maps\_headtracking::player_head_tracking();
}

get_traverse_node_start( var_0 )
{
    var_1 = undefined;

    if ( var_0[0].type == "Begin" )
        var_1 = var_0[0];
    else
        var_1 = var_0[1];

    return var_1;
}

seaknight_doors_open()
{
    var_0 = maps\_vehicle_aianim::anim_pos( self, 1 );
    thread maps\_vehicle_aianim::setanimrestart_once( var_0.vehicle_getoutanim, var_0.vehicle_getoutanim_clear );
    thread common_scripts\utility::play_sound_in_space( var_0.vehicle_getoutsound, self.origin );
}

seaknight_player_door_clip()
{
    var_0 = getent( "seaknight_player_door_clip", "targetname" );
    var_0 notsolid();
    var_1 = getent( "seaknight_almost_land_location", "script_noteworthy" );
    var_1 waittill( "trigger", var_2 );
    wait 12;
    var_0 solid();
    var_3 = getent( "seaknight_land_location", "script_noteworthy" );
    var_3 waittill( "trigger", var_2 );
    wait 4;
    var_0 notsolid();
}

seaknight_dialog()
{
    var_0 = getent( "seaknight_almost_land_location", "script_noteworthy" );
    var_0 waittill( "trigger", var_1 );
    wait 5.0;
    level.player playradiosound( level.scr_sound["saknight"]["getonboard"] );
    level.price.animname = "price";
    maps\_anim::anim_single_solo( level.price, "fixonposition" );
    common_scripts\utility::flag_set( "seaknight_dialog_done" );
}

bog_enemies_retreat()
{
    getent( "bog_enemies_retreat", "targetname" ) waittill( "trigger" );
    thread killspawner( 9 );
    var_0 = getaiarray( "axis" );
    var_1 = getnodearray( "bog_enemies_retreat_node", "targetname" );

    for ( var_2 = 0; var_2 < var_0.size; var_2++ )
    {
        if ( !isdefined( var_0[var_2] ) )
            continue;

        if ( !isalive( var_0[var_2] ) )
            continue;

        var_3 = var_1[randomint( var_1.size )];
        var_0[var_2] thread enemy_retreat_think( var_3 );
    }

    var_4 = getent( "chopper_guy_pre_crush_trig", "targetname" );
    var_4 maps\_utility::activate_trigger();
}

enemy_retreat_think( var_0 )
{
    self endon( "death" );

    if ( isdefined( self.script_noteworthy ) && issubstr( self.script_noteworthy, "introchopper" ) )
    {
        if ( issubstr( self.script_noteworthy, "introchopper1" ) )
            maps\_utility::set_force_color( "p" );
        else
            maps\_utility::set_force_color( "c" );

        common_scripts\utility::flag_wait( "aa_bog_b_zone_streets" );
        maps\_utility::clear_force_color();
    }

    thread go_to_node_delayed( var_0, var_0.radius, randomfloat( 5.0 ) );
    thread ignored_by_tank_cannon();
}

go_to_node_delayed( var_0, var_1, var_2 )
{
    wait(var_2);

    if ( !isdefined( self ) )
        return;

    if ( !isalive( self ) )
        return;

    self.goalradius = var_1;
    maps\_utility::set_goal_node( var_0 );
}

ignored_by_tank_cannon( var_0 )
{
    if ( !isdefined( var_0 ) )
        var_0 = 1;

    if ( var_0 )
        self.ignored_by_tank_cannon = 1;
    else
        self.ignored_by_tank_cannon = undefined;
}

player_passed_dumpster()
{
    getent( "player_passed_dumpster", "targetname" ) waittill( "trigger" );
    common_scripts\utility::flag_set( "player_passed_dumpster" );
}

rotate_fans()
{
    var_0 = getentarray( "rotate", "targetname" );

    foreach ( var_2 in var_0 )
        var_2 thread rotate_fan();
}

rotate_fan()
{
    var_0 = 360;

    if ( isdefined( self.turn_time ) )
    {
        if ( randomfloat( 1.0 ) > 0.5 )
            var_0 *= -1;
    }
    else
    {
        var_1 = abs( ( self.origin[0] + self.origin[1] ) * 0.1 );
        var_1 -= floor( var_1 );

        if ( var_1 > 0.5 )
            var_0 *= -1;

        var_2 = 0.5;
        var_3 = 23.0;
        self.turn_time = var_2 + var_1 * var_3;
    }

    if ( !isdefined( self.script_noteworthy ) )
        self.script_noteworthy = "z";

    switch ( self.script_noteworthy )
    {
        case "x":
            thread rotate_fan_loop( ( 0, 0, var_0 ), self.turn_time );
            break;
        case "y":
            thread rotate_fan_loop( ( var_0, 0, 0 ), self.turn_time );
            break;
        case "z":
            thread rotate_fan_loop( ( 0, var_0, 0 ), self.turn_time );
            break;
    }
}

rotate_fan_loop( var_0, var_1 )
{
    for (;;)
    {
        self rotatevelocity( var_0, var_1 );
        wait(var_1 - 0.05);
    }
}

swap_crush_material( var_0 )
{
    var_1 = getanimlength( var_0 );
    var_2 = getnotetracktimes( var_0, "crush_material" );
    var_1 *= var_2[0];
    wait(var_1);
    self overridematerial( "mtl_h1_pickup_ext_a", "mtl_h1_pickup_ext_a_crushed" );
    self overridematerial( "mtl_h1_pickup_ext_b", "mtl_h1_pickup_ext_b_crushed" );
    self overridematerial( "mtl_h1_pickup_int_elements", "mtl_h1_pickup_int_elements_crushed" );
}

rotate_crushed_truck_clip( var_0 )
{
    var_1 = getent( var_0.targetname + "_precrushed_clip", "targetname" );
    var_1 rotateyaw( -15, 1.5 );
}

docomingthroughaudio( var_0 )
{
    level.player playradiosound( level.scr_sound["tank_commander"]["comingthrough"] );
}

setasdestructible( var_0, var_1, var_2 )
{
    self setcandamage( 1 );
    self waittill( "damage", var_3, var_4 );
    self setmodel( var_0 );
    var_5 = self getorigin();
    var_6 = var_5 + var_2;
    playfx( level._effect[var_1], var_6 );
}

computer_destruct()
{
    setasdestructible( "com_computer_monitor_d", "tv_explosion", ( 0.0, 0.0, 10.0 ) );
}
