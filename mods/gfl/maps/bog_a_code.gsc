// H1 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

start_court()
{
    level.player setorigin( getnode( "start_leaving_apartment", "targetname" ).origin );
}

start_melee()
{
    soundscripts\_snd::snd_message( "start_melee_checkpoint" );
    var_0 = getaiarray( "axis" );
    common_scripts\utility::array_thread( var_0, ::delete_me );
    thread melee_sequence();
    level.player setplayerangles( ( 0.0, 240.0, 0.0 ) );
    level.player setorigin( ( 10181.9, 708.265, 100.567 ) );
}

start_breach()
{
    soundscripts\_snd::snd_message( "start_breach_checkpoint" );
    common_scripts\utility::flag_set( "second_floor_door_breach_initiated" );
    var_0 = getaiarray( "axis" );
    common_scripts\utility::array_thread( var_0, ::delete_me );
    thread melee_sequence();
    level.player setplayerangles( ( 0.0, 180.0, 0.0 ) );
    level.player setorigin( ( 9976.2, 423.6, 236.0 ) );
    thread second_floor_door_breach_setup();

    for (;;)
    {
        var_1 = getent( "second_floor_door_breach_trigger", "script_noteworthy" );
        var_1 notify( "trigger" );
        wait 1;
    }
}

second_floor_door_breach_setup()
{
    for (;;)
    {
        second_floor_door_breach_guys( 1 );
        var_0 = getent( "apartment_second_floor_door_breach", "targetname" );
        var_0 connectpaths();
        var_0 door_opens( -1 );
    }
}

start_apart()
{
    thread melee_sequence();
    level.player setplayerangles( ( 0.0, 240.0, 0.0 ) );
    level.player setorigin( ( 10181.9, 708.265, 100.567 ) );
}

spawn_guys_that_run_away( var_0 )
{
    var_1 = getentarray( var_0, "targetname" );
    common_scripts\utility::array_thread( var_1, ::spawn_guy_that_runs_away );
}

spawn_guy_that_runs_away()
{
    self.count = 1;
    var_0 = maps\_utility::spawn_ai();

    if ( maps\_utility::spawn_failed( var_0 ) )
        return;

    var_0 endon( "death" );
    var_1 = var_0.pathenemyfightdist;
    var_0.pathenemyfightdist = 0;
    var_0 waittill( "goal" );
    var_0.pathenemyfightdist = var_1;
}

delayed_spawn_and_kill( var_0, var_1 )
{
    wait(var_1);
    var_2 = getent( var_0, "targetname" );
    var_3 = var_2 maps\_utility::spawn_ai();

    if ( maps\_utility::spawn_failed( var_3 ) )
        return;

    var_3 kill();
}

ai_walk_trigger()
{
    for (;;)
    {
        self waittill( "trigger", var_0 );

        if ( var_0.team == "axis" )
            return;

        var_0 maps\_utility::cqb_walk( "on" );

        if ( !common_scripts\utility::flag( "night_vision" ) )
        {
            common_scripts\utility::flag_set( "night_vision" );
            var_1 = getent( "green_friendly", "targetname" );
            var_1 maps\_anim::anim_single_solo( var_1, "night_vision" );
        }
    }
}

friendlies_wait_for_ambush_then_fight_back()
{
    self endon( "death" );
    self.pacifist = 1;
    self.goalheight = 48;
    common_scripts\utility::flag_wait( "friendlies_take_fire" );
    self.pacifist = 0;
}

rooftop_damage_trigger()
{
    var_0 = getent( "rooftop_damage_trigger", "targetname" );
    var_0 waittill( "trigger" );
    var_0 delete();
    common_scripts\utility::flag_set( "rooftop_guys_fall_back" );
}

bridge_truck_pauses_then_leaves()
{
    var_0 = maps\_vehicle::spawn_vehicle_from_targetname( "bridge_truck_pause" );
    var_0 drives();
    getvehiclenode( "bridge_pause_node", "script_noteworthy" ) waittill( "trigger" );
    var_0 vehicle_setspeed( 0, 12 );
    wait 10;
    var_0 vehicle_setspeed( 25, 10 );
}

bridge_damage_trigger()
{
    var_0 = getent( "bridge_damage_trigger", "targetname" );

    for (;;)
    {
        var_0 waittill( "trigger", var_1 );

        if ( isplayer( var_1 ) )
            break;

        if ( !isdefined( var_1.team ) )
            continue;

        if ( var_1.team == "axis" )
            common_scripts\utility::flag_set( "bridge_walkers_attack" );
    }

    common_scripts\utility::flag_set( "bridge_damage_trigger" );
}

bridge_runners()
{
    wait 3;
    var_0 = maps\_utility::spawn_ai();

    if ( maps\_utility::spawn_failed( var_0 ) )
        return;

    var_0 endon( "death" );
    var_1 = getnode( var_0.target, "targetname" );
    var_0 setgoalnode( var_1 );
    var_0.interval = 0;
    var_0.ignoresuppression = 1;
    var_0.goalradius = 64;
    var_0 waittill( "goal" );

    if ( level.bridge_damage_trigger == "cleared" )
    {
        level.bridge_damage_trigger = "set";
        thread bridge_damage_trigger();
    }

    maps\_utility::wait_for_flag_or_timeout( "bridge_damage_trigger", 13 );
    common_scripts\utility::flag_set( "bridge_runners_flee" );
    maps\_utility::waitspread( 1, 5 );
    var_1 = getnode( "early_bridge_node", "targetname" );
    var_0 setgoalnode( var_1 );
}

bridge_truck_drives( var_0 )
{
    maps\_vehicle::create_vehicle_from_spawngroup_and_gopath( var_0 );
}

vehicle_delete_trigger()
{
    level endon( "player_enters_laundrymat" );
    var_0 = getent( "vehicle_delete_trigger", "targetname" );

    for (;;)
    {
        var_0 waittill( "trigger", var_1 );
        var_1 delete();
    }
}

bad_infantry_attack()
{
    level.bad_infantry_count = 0;
    var_0 = getentarray( "tank_killing_guy", "targetname" );
}

bad_infantry_spawner()
{
    self endon( "death" );

    for (;;)
    {
        wait(randomfloatrange( 1, 2 ));

        if ( level.bad_infantry_count >= 10 )
        {
            level waittill( "bad_infantry_died" );
            continue;
        }

        self.count = 1;
        var_0 = self stalingradspawn();

        if ( maps\_utility::spawn_failed( var_0 ) )
            continue;

        var_0 thread bad_infantry_think();
    }
}

bad_infantry_think()
{
    level.bad_infantry_count++;
    var_0 = getnode( "tank_kill_node", "targetname" );

    if ( isalive( level.goodtank ) )
        self setentitytarget( level.goodtank );

    self setgoalnode( var_0 );
    self.goalradius = 384;
    thread bad_infantry_reaches_goal_and_deletes();
    self waittill( "death" );
    level.bad_infantry_count--;
    level notify( "bad_infantry_died" );
}

bad_infantry_reaches_goal_and_deletes()
{
    self endon( "death" );
    self waittill( "goal" );
    self delete();
}

stop_at_node( var_0 )
{
    self notify( "new_stop_node" );
    thread stop_at_node_thread( var_0 );
}

stop_at_node_thread( var_0 )
{
    self endon( "new_stop_node" );
    self endon( "death" );
    getvehiclenode( var_0, "script_noteworthy" ) waittill( "trigger" );
    self vehicle_setspeed( 0, 100 );
}

opens_fire()
{
    thread open_fire_thread();
}

open_fire_thread()
{
    self endon( "death" );
    self endon( "stop_firing" );
    self.current_target endon( "death" );

    for (;;)
    {
        self fireweapon();
        wait(randomfloatrange( 5, 12 ));
    }
}

stop_firing_when_target_dies()
{
    thread stop_firing_when_target_dies_thread();
}

stop_firing_when_target_dies_thread()
{
    self.current_target waittill( "death" );
    stops_firing();
}

stops_firing()
{
    self notify( "stop_firing" );
}

targets_tank( var_0 )
{
    thread targets_tank_thread( var_0 );
}

targets_tank_thread( var_0 )
{
    wait 0.11;
    self setturrettargetent( var_0, ( 0.0, 0.0, 60.0 ) );
    self.current_target = var_0;
}

becomes_vulnerable()
{
    maps\_vehicle::godoff();
    self.health = 1;
}

drives()
{
    thread maps\_vehicle::gopath( self );
}

heli_riders_spawn_and_delete()
{
    self waittill( "spawned", var_0 );

    if ( maps\_utility::spawn_failed( var_0 ) )
        return;

    var_0 endon( "death" );
    level waittill( "heli_gone" );
    var_0 delete();
}

heli_guys_run_in()
{
    wait 3;
    var_0 = getentarray( "heli_squad_spawner", "targetname" );

    for ( var_1 = 0; var_1 < var_0.size; var_1++ )
    {
        var_2 = var_0[var_1] maps\_utility::spawn_ai();

        if ( maps\_utility::spawn_failed( var_2 ) )
            continue;

        var_2.goalradius = 200;
        var_2 setgoalpos( ( 8131.3, 2652.8, 87.8 ) );
    }
}

helicopter_drops_off_guys()
{
    var_0 = getentarray( "heli_squad", "targetname" );
    common_scripts\utility::array_thread( var_0, ::heli_riders_spawn_and_delete );
    var_1 = getent( "heli_path", "targetname" );
    var_2 = maps\_vehicle::spawn_vehicle_from_targetname( "heli" );
    var_2.health = 10000000;
    var_2 vehicle_setspeed( 150, 35, 35 );
    var_2 setneargoalnotifydist( 500 );

    for (;;)
    {
        if ( !isdefined( var_1.target ) )
            break;

        var_1 = getent( var_1.target, "targetname" );
        var_2 setgoalyaw( var_1.angles[1] );
        var_2 setvehgoalpos( var_1.origin, 1 );

        while ( distance( var_2.origin, var_1.origin ) >= 500 )
            wait 0.05;
    }

    var_2 setneargoalnotifydist( 50 );
    var_2 waittill( "near_goal" );
    var_2 notify( "unload" );
    wait 8;
    thread heli_guys_run_in();
    var_2 vehicle_setspeed( 50, 15, 15 );
    var_2 setneargoalnotifydist( 500 );
    var_1 = getent( "heli_retreat_path", "targetname" );

    for (;;)
    {
        var_2 setvehgoalpos( var_1.origin, 1 );

        while ( distance( var_2.origin, var_1.origin ) >= 500 )
            wait 0.05;

        var_2 vehicle_setspeed( 150, 25, 15 );

        if ( !isdefined( var_1.target ) )
            break;

        var_1 = getent( var_1.target, "targetname" );
        var_2 setgoalyaw( var_1.angles[1] );
    }

    var_2 delete();
    level notify( "heli_gone" );
}

draw_dest_line( var_0 )
{
    self notify( "new_dest_line" );
    self endon( "new_dest_line" );

    for (;;)
        wait 0.05;
}

helicopter_flies_by_overhead( var_0, var_1, var_2, var_3 )
{
    if ( isdefined( var_1 ) )
        wait(var_1);

    var_4 = maps\_vehicle::spawn_vehicle_from_targetname( var_0 );

    if ( var_0 == "alley_heli" )
    {
        var_4 setmaxpitchroll( 25, 45 );
        var_4 setyawspeed( 50, 25 );
    }

    var_4 heli_flies( var_2, var_3 );
}

helicopters_flies_by_overhead( var_0, var_1, var_2, var_3 )
{
    if ( isdefined( var_1 ) )
        wait(var_1);

    var_4 = maps\_vehicle::spawn_vehicles_from_targetname( var_0 );
    var_4 = common_scripts\utility::array_randomize( var_4 );
    var_5 = 3;

    for ( var_6 = 0; var_6 < var_4.size - var_5; var_6++ )
        var_4[var_6] thread heli_flies( var_2, var_3 );

    for ( var_6 = var_4.size - var_5; var_6 < var_4.size; var_6++ )
        var_4[var_6] delete();
}

heli_flies( var_0, var_1 )
{
    self endon( "death" );
    self.script_turretmg = 0;
    self.health = 10000000;
    self setturningability( 1 );
    maps\_vehicle_code::helipath( self.target, var_0, var_1 );
    self delete();
}

lookatpath( var_0 )
{
    var_1 = getent( var_0, "targetname" );
    self setlookatent( var_1 );
    wait 1.5;
}

aim_trigger_think()
{
    var_0 = [];

    for (;;)
    {
        self waittill( "trigger", var_1 );

        if ( isdefined( var_0[var_1.unique_id] ) )
            continue;

        var_0[var_1.unique_id] = 1;
        thread aimsatself( var_1 );
    }
}

aimsatself( var_0 )
{
    var_1 = getent( self.target, "targetname" );
    var_0 endon( "death" );
    var_0 maps\_utility::cqb_aim( var_1 );

    while ( var_0 istouching( self ) )
    {
        wait 0.05;
        continue;
    }

    var_0 maps\_utility::cqb_aim();
}

acquire_ai()
{
    var_0 = [];

    for (;;)
    {
        self waittill( "trigger", var_1 );

        if ( isdefined( var_0[var_1.unique_id] ) )
            continue;

        var_0[var_1.unique_id] = 1;
        var_1 thread ai_tells_trigger_he_died( self );
    }
}

ai_tells_trigger_he_died( var_0 )
{
    self waittill( "death" );

    if ( self istouching( var_0 ) )
    {
        var_0.deaths++;
        var_0 notify( "died" );
    }
}

street_guys_run_for_it()
{
    self endon( "death" );
    var_0 = getnode( self.target, "targetname" );
    self setgoalnode( var_0 );
    self.goalradius = 32;
    self.ignoresuppression = 1;
    self setthreatbiasgroup( "street_guys" );
    common_scripts\utility::flag_wait( "street_guys_run" );
    maps\_utility::waitspread( 0, 3 );

    for (;;)
    {
        self waittill( "goal" );

        if ( !isdefined( var_0.target ) )
            break;

        var_0 = getnode( var_0.target, "targetname" );
        self setgoalnode( var_0 );
    }

    if ( !self cansee( level.player ) )
        self delete();
}

ai_enters_apartment( var_0 )
{
    level.apartment_reach++;
    var_1 = getnode( "right_house_node", "targetname" );
    maps\_utility::waitspread( 0.01, 2.5 );
    self setgoalnode( var_1 );
    self.ignoresuppression = 1;
    self.goalradius = 32;
    self waittill( "goal" );
    var_1 = getnode( var_1.target, "targetname" );
    self setgoalnode( var_1 );
    self waittill( "goal" );
    var_1 = getnode( var_0, "targetname" );
    self setgoalnode( var_1 );
    self waittill( "goal" );
    self.ignoresuppression = 0;
    level.apartment_reach--;

    if ( !level.apartment_reach )
        common_scripts\utility::flag_set( "reached_apartment" );
}

door_opens( var_0 )
{
    self playsound( "wood_door_kick" );
    var_1 = -140;

    if ( isdefined( var_0 ) )
        var_1 *= var_0;

    self rotateyaw( var_1, 0.3, 0, 0.3 );
    self connectpaths();
}

wave()
{
    thread waveproc();
}

waveproc()
{
    self notify( "do_a_wave" );
    self endon( "do_a_wave" );
    self setflaggedanimrestart( "wave", level.scr_anim[self.animname]["wave"], 1, 0.1, 1 );
    wait 3;
    self clearanim( level.scr_anim[self.animname]["wave"], 0.1 );
}

notetrackprinter( var_0 )
{
    self endon( "death" );
    self notify( "notetrackprinter" + var_0 );
    self endon( "notetrackprinter" + var_0 );

    for (;;)
        self waittill( var_0, var_1 );
}

target_spot_delayed( var_0, var_1 )
{
    self endon( "death" );
    wait(var_1);
    maps\_utility::cqb_aim( var_0 );
}

melee_sequence()
{
    var_0 = getent( "start_melee", "targetname" );
    var_1 = getent( var_0.target, "targetname" );
    var_2 = getent( var_1.target, "targetname" );
    var_2.script_moveoverride = 1;
    var_3 = getent( "melee_enemy_spawner", "targetname" );
    var_3.script_moveoverride = 1;
    var_4 = getnode( var_2.target, "targetname" );
    var_5 = getent( "player_breaks_melee_sequence", "targetname" );
    var_6 = getent( "melee_ai_trigger", "targetname" );
    var_7 = getnode( var_3.target, "targetname" );
    var_0 waittill( "trigger" );
    var_8 = var_2 maps\_utility::spawn_ai();

    if ( maps\_utility::spawn_failed( var_8 ) )
        return;

    var_8.ignoreall = 1;
    var_8.ignoreme = 1;
    var_8.pathenemyfightdist = 0;
    var_8.pathenemylookahead = 0;
    var_8.goalheight = 64;
    var_8.goalradius = 32;
    var_8.ignorerandombulletdamage = 1;
    var_9 = var_3 maps\_utility::spawn_ai();

    if ( maps\_utility::spawn_failed( var_9 ) )
        return;

    var_9.ignoreme = 1;
    var_9.ignoreall = getdvarint( "use_old_meleestruggle" ) == 0;
    var_9.goalradius = 32;
    var_9.health = 1;
    var_9 pushplayer( 1 );
    var_9.dontavoidplayer = 1;
    var_9 setthreatbiasgroup( "melee_struggle_guy" );
    var_9 thread achievement( var_8 );
    var_1 waittill( "trigger" );

    if ( level.start_point != "melee" )
    {

    }

    common_scripts\utility::flag_set( "melee_sequence_begins" );
    maps\_utility::autosave_by_name( "melee_sequence" );
    var_8 setgoalnode( var_7 );
    var_8.dontshootstraight = 1;
    var_8.goalradius = 4;
    var_6 waittill( "trigger", var_10 );

    if ( getdvarint( "use_old_meleestruggle" ) == 1 )
    {
        if ( var_10 == var_8 && !common_scripts\utility::flag( "player_interupts_melee_struggle" ) )
        {
            var_8.ignorerandombulletdamage = 0;
            melee_sequence_plays_out( var_8, var_9 );

            if ( isdefined( var_8 ) )
            {
                var_8 stopsound( level.scr_sound["paulsen"]["melee"] );
                var_8 playsound( "bog_scn_melee_struggle_end" );
            }

            if ( isalive( var_9 ) && !var_9 cansee( level.player ) )
                var_9 kill();
        }
        else if ( isalive( var_8 ) )
            var_8.dontshootstraight = 0;
    }
    else
    {
        var_8.ignorerandombulletdamage = 0;
        melee_sequence_plays_out( var_8, var_9 );

        if ( isdefined( var_8 ) )
        {
            var_8 stopsound( level.scr_sound["paulsen"]["melee"] );
            var_8 playsound( "bog_scn_melee_struggle_end" );
        }

        if ( isalive( var_8 ) )
            var_8.dontshootstraight = 0;

        if ( isalive( var_9 ) )
            var_9.ignoreall = 0;
    }

    if ( isalive( var_9 ) )
    {
        var_9.deathanim = undefined;
        var_9.ignoreme = 0;
        var_9 stopanimscripted();
    }

    if ( isalive( var_8 ) )
    {
        level.saved_friendly = var_8;
        level.saved_friendly thread maps\_utility::magic_bullet_shield();
        var_8 setthreatbiasgroup( "friendlies_under_unreachable_enemies" );
        var_8 maps\_utility::set_default_pathenemy_settings();
        var_8 maps\_utility::set_force_color( "p" );
        var_8.a.nodeath = 0;
        var_8.ignoreall = 0;
        var_8.ignorerandombulletdamage = 0;
        var_8.ignoresuppression = 1;
    }
    else
        maps\_utility::instantly_promote_nearest_friendly( "b", "p" );

    common_scripts\utility::flag_set( "melee_sequence_complete" );
}

achievement( var_0 )
{
    self waittill( "death", var_1 );

    if ( !isalive( var_0 ) )
        return;

    if ( !isalive( var_1 ) )
        return;

    if ( !isplayer( var_1 ) )
        return;

    maps\_utility::giveachievement_wrapper( "RESCUE_ROYCEWICZ" );
}

melee_sequence_plays_out( var_0, var_1 )
{
    level endon( "stop_melee_sequence" );

    if ( !isalive( var_0 ) )
        return;

    if ( !isalive( var_1 ) )
        return;

    var_0 endon( "death" );
    var_1 endon( "death" );
    var_0.animname = "paulsen";
    var_1.animname = "emslie";
    var_1.deathanim = var_1 maps\_utility::getanim( "death" );
    var_2 = [];
    var_2[0] = var_0;
    var_2[1] = var_1;
    var_3 = spawn( "script_origin", ( 0.0, 0.0, 0.0 ) );
    var_3.origin = ( 9705.0, 1207.0, 112.0 );
    var_3.angles = ( 0.0, 294.0, 0.0 );
    var_0.allowdeath = 1;
    var_1.allowdeath = 1;
    var_0.end_melee_animation = "stand_death";
    var_0 thread saved_from_melee( var_1 );
    var_0.health = 1;
    var_0 thread maps\_anim::anim_single_solo( var_0, "gah" );
    var_3 maps\_anim::anim_single( var_2, "melee" );
}

paulsen_end_standdeath( var_0 )
{
    var_0.end_melee_animation = undefined;
}

paulsen_start_backdeath1( var_0 )
{
    var_0.end_melee_animation = "back_death1";
    var_0.a.nodeath = 1;
    var_0 notify( "new_end_melee_animation" );
}

paulsen_start_backdeath2( var_0 )
{
    var_0.end_melee_animation = "back_death2";
    var_0.a.nodeath = 1;
    var_0 notify( "new_end_melee_animation" );
}

paulsen_end_fire( var_0 )
{
    var_0.a.lastshoottime = gettime();
    var_0 thread maps\_utility::play_sound_on_tag( "scn_melee_custom_m4carbine_fire", "tag_flash" );
    playfxontag( common_scripts\utility::getfx( "special_fire" ), var_0, "tag_flash" );
    var_1 = var_0 gettagangles( "tag_flash" );
    var_2 = anglestoforward( var_1 );
    var_3 = maps\_utility::vector_multiply( var_2, 5000 );
    var_4 = var_0 gettagorigin( "tag_flash" );
    var_5 = var_4 + var_3;
    var_6 = bullettrace( var_4, var_5, 0, undefined );
    playfx( common_scripts\utility::getfx( "flesh_hit" ), var_6["position"], ( 0.0, 0.0, 1.0 ) );
    thread common_scripts\utility::play_sound_in_space( "bullet_large_flesh", var_6["position"] );
    var_7 = var_6["position"];
    var_2 = anglestoforward( ( 0, self.angles[1], 0 ) );
    var_3 = maps\_utility::vector_multiply( var_2, -5 );
    var_7 += var_3;
    var_6 = bullettrace( var_7 + ( 0.0, 0.0, 5.0 ), var_7 + ( 0.0, 0.0, -50.0 ), 0, undefined );
    playfx( common_scripts\utility::getfx( "blood_pool" ), var_6["position"], ( 0.0, 0.0, 1.0 ) );
}

orient_to_guy( var_0 )
{
    self endon( "stop_orienting" );
    var_1 = var_0.origin;

    for (;;)
    {
        if ( isdefined( var_0 ) && isdefined( var_0.origin ) )
            var_1 = var_0.origin;

        var_2 = vectortoangles( var_1 - self.origin );
        var_3 = var_2[1] - 20;
        self orientmode( "face angle", var_3 );
        wait 0.05;
    }
}

saved_from_melee( var_0 )
{
    self endon( "death" );
    var_0 waittill( "death" );
    var_1 = var_0.origin;

    if ( !isdefined( self.end_melee_animation ) )
        self waittill( "new_end_melee_animation" );

    if ( self.end_melee_animation == "stand_death" )
    {
        thread maps\_anim::anim_custom_animmode_solo( self, "gravity", self.end_melee_animation );
        thread orient_to_guy( var_0 );
    }
    else
        thread maps\_anim::anim_single_solo( self, self.end_melee_animation );

    common_scripts\utility::waittill_either( self.end_melee_animation, "damage" );
    self notify( "stop_orienting" );
    self.dontshootstraight = 0;
}

threatbias_lower_trigger()
{
    self endon( "death" );

    for (;;)
    {
        self waittill( "trigger", var_0 );

        if ( !isdefined( var_0.normal_threatbias ) )
            var_0.normal_threatbias = var_0.threatbias;
        else if ( var_0.normal_threatbias != var_0.threatbias )
            continue;

        var_0.threatbias -= 1500;
        wait 2;
    }
}

threatbias_normal_trigger()
{
    self endon( "death" );

    for (;;)
    {
        self waittill( "trigger", var_0 );

        if ( !isdefined( var_0.normal_threatbias ) )
            continue;

        var_0.threatbias = var_0.normal_threatbias;
        wait 2;
    }
}

spawn_guy_from_targetname( var_0 )
{
    var_1 = spawn_guys_from_targetname( var_0 );
    return var_1[0];
}

spawn_guys_from_targetname( var_0 )
{
    var_1 = [];
    var_2 = getentarray( var_0, "targetname" );

    for ( var_3 = 0; var_3 < var_2.size; var_3++ )
    {
        var_4 = var_2[var_3];
        var_4.count = 1;
        var_5 = var_4 maps\_utility::spawn_ai();
        maps\_utility::spawn_failed( var_5 );
        var_1[var_1.size] = var_5;
    }

    return var_1;
}

force_spawn_guys_from_targetname( var_0 )
{
    var_1 = [];
    var_2 = getentarray( var_0, "targetname" );

    for ( var_3 = 0; var_3 < var_2.size; var_3++ )
    {
        var_4 = var_2[var_3];
        var_4.count = 1;
        var_5 = var_4 stalingradspawn();
        maps\_utility::spawn_failed( var_5 );
        var_1[var_1.size] = var_5;
    }

    return var_1;
}

vis_blocker_waits_for_deletion()
{
    var_0 = getent( "vis_blocker_delete_trigger", "targetname" );
    var_0 waittill( "trigger" );
    var_1 = getent( "vis_blocking_brush", "targetname" );
    var_1 delete();
}

enable_pacifists_to_attack_me()
{
    self endon( "death" );

    for (;;)
    {
        self waittill( "trigger", var_0 );

        if ( isplayer( var_0 ) )
            continue;

        var_0 setthreatbiasgroup( "friendlies_under_unreachable_enemies" );
    }
}

ignores_unreachable_enemies()
{
    self setthreatbiasgroup( "friendlies_flanking_apartment" );
    self.ignoresuppression = 1;
}

set_threatbias_group( var_0 )
{
    self setthreatbiasgroup( var_0 );
}

wait_until_its_time_to_flank()
{
    var_0 = getent( "moveup_trigger", "targetname" );
    var_1 = getent( var_0.target, "targetname" );
    var_1 maps\_utility::wait_for_trigger_or_timeout( 10 );
}

waittill_triggered_by_ai( var_0 )
{
    for (;;)
    {
        self waittill( "trigger", var_1 );

        if ( isplayer( var_1 ) )
            continue;

        if ( !isdefined( var_0 ) )
            return;

        if ( var_1.classname == "worldspawn" )
            continue;

        if ( var_0 == var_1.team )
            return;
    }
}

tally_pacifists()
{
    waittillframeend;
    var_0 = getaiarray();
    var_1["axis"] = 0;
    var_1["allies"] = 0;

    for ( var_2 = 0; var_2 < var_0.size; var_2++ )
    {
        var_3 = var_0[var_2];

        if ( var_3.pacifist )
            var_1[var_3.team]++;
    }
}

put_function_on_spawners( var_0, var_1 )
{
    common_scripts\utility::array_thread( var_0, ::spawner_runs_function_on_spawn, var_1 );
}

spawner_runs_function_on_spawn( var_0 )
{
    self endon( "death" );

    for (;;)
    {
        self waittill( "spawned", var_1 );

        if ( maps\_utility::spawn_failed( var_1 ) )
            continue;

        var_1 [[ var_0 ]]();
    }
}

alley_roof_guy()
{
    self endon( "death" );
    common_scripts\utility::flag_wait( "player_enters_roof" );
    var_0 = getnodearray( "roof_node", "targetname" );
    var_0 = common_scripts\utility::array_randomize( var_0 );

    for ( var_1 = 0; var_1 < var_0.size; var_1++ )
    {
        var_2 = var_0[var_1];

        if ( isdefined( var_2.roof_occupied ) )
            continue;

        var_2.roof_occupied = 1;
        self setgoalnode( var_2 );
        self.goalradius = 64;
        return;
    }
}

alley_smg_playerseeker()
{
    self setthreatbiasgroup( "player_seeker" );
    self setengagementmindist( randomintrange( 100, 225 ), 0 );
    var_0 = randomintrange( 300, 400 );
    self setengagementmaxdist( var_0, var_0 + 200 );
    self.pathenemyfightdist = 185;
    self.pathenemylookahead = 185;
}

alley_sniper_engagementdistance()
{
    self setengagementmindist( 450, 450 );
    self setengagementmaxdist( 1500, 2500 );
}

alley_smg_engagementdistance()
{
    self setengagementmindist( 350, 0 );
    self setengagementmaxdist( 450, 550 );
}

alley_close_smg_engagementdistance()
{
    self setengagementmindist( 0, 0 );
    self setengagementmaxdist( 200, 300 );
}

toggle_alley_badplace()
{
    var_0 = getent( "friendly_badplace_arc", "targetname" );
    var_1 = getent( var_0.target, "targetname" );
    var_2 = var_0.origin;
    var_3 = var_2 - var_1.origin;
    var_0 delete();
    var_1 delete();

    for (;;)
    {
        common_scripts\utility::flag_wait( "player_near_alley_building" );
        badplace_arc( "alley_badplace", 0, var_2, 0, 64, var_3, 5, 5, "allies" );
        common_scripts\utility::flag_waitopen( "player_near_alley_building" );
        badplace_delete( "alley_badplace" );
    }
}

ambush_clear()
{
    common_scripts\utility::flag_set( "friendlies_take_fire" );
    common_scripts\utility::flag_set( "respawn_friendlies" );
    var_0 = getentarray( "pacifist_rubble_guys", "targetname" );
    maps\_utility::array_delete( var_0 );
}

start_bog()
{
    soundscripts\_snd::snd_message( "start_bog_checkpoint" );
    ambush_clear();
    maps\_utility::clear_promotion_order();
    maps\_utility::set_promotion_order( "r", "y" );
    level.respawn_spawner = getent( "auto2840", "targetname" );
    level.price = getent( "price", "targetname" );
    level.price teleport( ( 6782.4, 336.4, 66.0 ) );
    maps\_utility::spawn_failed( level.price );
    level.price setgoalpos( level.price.origin );
    level.price.animname = "price";
    level.price thread maps\_utility::magic_bullet_shield();
    level.price maps\_utility::set_force_color( "y" );
    var_0 = getaiarray( "allies" );
    var_0 = common_scripts\utility::array_remove( var_0, level.price );
    maps\_utility::array_delete( var_0 );
    var_1 = force_spawn_guys_from_targetname( "bog_friendly_start" );
    common_scripts\utility::array_thread( var_1, maps\_utility::replace_on_death );
    level.player setplayerangles( ( 0.0, 241.0, 0.0 ) );
    level.player setorigin( ( 6872.2, 547.4, 93.0 ) );
    bog_is_under_attack();
}

bog_fight_until_flag()
{
    thread maps\_utility::magic_bullet_shield();
    common_scripts\utility::flag_wait( "entered_bog" );
    maps\_utility::stop_magic_bullet_shield();
}

bog_is_under_attack()
{
    var_0 = getentarray( "initial_bog_fighters", "targetname" );
    common_scripts\utility::array_thread( var_0, maps\_utility::add_spawn_function, ::bog_fight_until_flag );
}

start_alley()
{
    soundscripts\_snd::snd_message( "start_alley_checkpoint" );
    ambush_clear();
    level.respawn_spawner = getent( "alley_respawn", "targetname" );
    level.price = getent( "price", "targetname" );
    level.price teleport( ( 9695.2, 372.3, 76.0 ) );
    level.price.animname = "price";
    level.price thread maps\_utility::magic_bullet_shield();
    level.price maps\_utility::set_force_color( "c" );
    level.price maps\_utility::make_hero();
    var_0 = getaiarray( "allies" );
    var_0 = maps\_utility::remove_heroes_from_array( var_0 );
    maps\_utility::array_delete( var_0 );
    var_1 = force_spawn_guys_from_targetname( "alley_friendly_spawners" );
    var_1 = maps\_utility::remove_color_from_array( var_1, "g" );
    common_scripts\utility::array_thread( var_1, maps\_utility::replace_on_death );
    level.player setplayerangles( ( 0.0, 255.0, 0.0 ) );
    level.player setorigin( ( 9838.94, 960.646, 76.0 ) );
    thread maps\bog_a::open_laundrymat();
    common_scripts\utility::flag_set( "alley_enemies_spawn" );
}

start_javelin()
{
    ambush_clear();
    maps\_utility::clear_promotion_order();
    maps\_utility::set_promotion_order( "r", "y" );
    level.respawn_spawner = getent( "alley_respawn", "targetname" );
    level.price = getent( "price", "targetname" );
    level.price teleport( ( 8812.1, -557.4, 212.0 ) );
    level.price.animname = "price";
    level.price thread maps\_utility::magic_bullet_shield();
    level.price maps\_utility::set_force_color( "y" );
    getent( "playerseeker_spawn_trigger", "script_noteworthy" ) delete();
    level.player setplayerangles( ( 0.0, 255.0, 0.0 ) );
    level.player setorigin( ( 8636.5, -578.8, 190.9 ) );
    var_0 = getaiarray( "allies" );
    var_0 = common_scripts\utility::array_remove( var_0, level.price );
    maps\_utility::array_delete( var_0 );
    var_1 = force_spawn_guys_from_targetname( "start_alley_spawn" );
    common_scripts\utility::array_thread( var_1, maps\_utility::replace_on_death );
    maps\_utility::promote_nearest_friendly( "y", "r" );
    maps\bog_a::defend_the_roof_with_javelin();
}

announce_backblast()
{
    level endon( "bmps_are_dead" );
    common_scripts\utility::flag_assert( "bmps_are_dead" );

    for (;;)
    {
        while ( !player_fires_javelin() )
            wait 0.05;

        wait 1.5;
        level.javelin_helper thread maps\_anim::anim_single_queue( level.javelin_helper, "backblast_clear" );
    }
}

set_flag_when_bmps_are_dead()
{
    var_0 = spawnstruct();
    var_0.count = 0;
    level.bmps_killed_by_player = 0;

    for ( var_1 = 1; var_1 <= 4; var_1++ )
        thread bridge_bmp_rolls_in( "bridge_bmp" + var_1, var_0 );

    var_0 waittill( "bmps_are_dead" );
    common_scripts\utility::flag_set( "bmps_are_dead" );
}

bmps_target_stuff_until_they_flee()
{
    level endon( "overpass_baddies_flee" );
    common_scripts\utility::flag_assert( "overpass_baddies_flee" );

    for (;;)
    {
        var_0 = getentarray( "new_bmp_target", "targetname" );
        var_1 = common_scripts\utility::random( var_0 );
        self setturrettargetent( var_1 );
        wait(randomfloatrange( 2, 3 ));
        self fireweapon();
        wait(randomfloatrange( 3, 5 ));
    }
}

bmp_drives_for_awhile()
{
    self endon( "death" );
    drives();
    maps\_vehicle::vehicle_flag_arrived( "bmp_in_position" );
    self vehicle_setspeed( 0, 925 );

    if ( !common_scripts\utility::flag( "overpass_baddies_flee" ) )
        bmps_target_stuff_until_they_flee();

    common_scripts\utility::flag_wait( "overpass_baddies_flee" );
    self vehicle_setspeed( 15, 2 );
}

bridge_bmp_is_shot_at()
{
    self endon( "death" );

    for (;;)
    {
        if ( !isalive( self ) )
            break;

        var_0 = self.health;
        self waittill( "damage", var_1, var_2, var_3, var_4, var_5 );

        if ( isdefined( var_2.classname ) && !isplayer( var_2 ) )
        {
            self.health = var_0;
            continue;
        }

        if ( var_5 != "MOD_PROJECTILE" )
            continue;

        if ( var_1 < 800 )
            continue;

        level.bmps_killed_by_player++;
        maps\_utility::arcademode_kill( self.origin, "explosive", 500 );
        level.javelin_helper maps\_utility::delaythread( 1, maps\_anim::anim_single_queue, level.javelin_helper, "hit_target_" + level.bmps_killed_by_player );
        maps\_vehicle::godoff();
        radiusdamage( self.origin, 150, self.health + 500, self.health + 500 );
    }
}

bridge_bmp_rolls_in( var_0, var_1 )
{
    var_1.count++;
    var_2 = maps\_vehicle::spawn_vehicle_from_targetname( var_0 );
    var_3 = ( 0.0, 0.0, 60.0 );
    target_set( var_2, var_3 );
    target_setattackmode( var_2, "top" );
    target_setjavelinonly( var_2, 1 );
    var_2.health = 20000;
    var_2 maps\_vehicle::godon();
    var_2 thread bmp_drives_for_awhile();
    var_2 bridge_bmp_is_shot_at();
    common_scripts\utility::flag_set( "bmp_got_killed" );
    var_1.count--;

    if ( var_1.count <= 2 )
    {
        common_scripts\utility::flag_set( "overpass_baddies_flee" );
        var_1 notify( "bmps_are_dead" );
    }

    if ( var_1.count <= 0 )
    {
        if ( level.bmps_killed_by_player == 4 )
            maps\_utility::giveachievement_wrapper( "FEEL_THE_HEAT" );

        common_scripts\utility::flag_set( "all_bmps_dead" );
    }

    if ( isdefined( var_2 ) )
        target_remove( var_2 );
}

wait_until_alley_is_clear_of_enemies()
{
    var_0 = getent( "alley_enemy_volume", "targetname" );

    for (;;)
    {
        var_1 = getaiarray( "axis" );
        var_2 = [];

        for ( var_3 = 0; var_3 < var_1.size; var_3++ )
        {
            var_4 = var_1[var_3];

            if ( var_0 istouching( var_4 ) )
                var_2[var_2.size] = var_4;
        }

        if ( !var_2.size )
            break;

        var_5 = spawnstruct();
        common_scripts\utility::array_thread( var_2, ::toucher_dies, var_5 );
        ent_waits_for_death_or_timeout( var_5, 5 );
    }
}

ent_waits_for_death_or_timeout( var_0, var_1 )
{
    var_0 endon( "toucher_died" );
    wait(var_1);
    var_0 waittill( "toucher_died" );
}

toucher_dies( var_0 )
{
    self waittill( "death" );
    var_0 notify( "toucher_died" );
}

set_all_ai_ignoreme( var_0 )
{
    var_1 = getaiarray();

    for ( var_2 = 0; var_2 < var_1.size; var_2++ )
        var_1[var_2].ignoreme = var_0;
}

wait_until_mortars_are_dead()
{
    var_0 = spawnstruct();
    var_0.count = 0;
    var_1 = getentarray( "mortar_trigger", "targetname" );
    common_scripts\utility::array_thread( var_1, ::mortar_trigger, var_0 );
    var_0 waittill( "mortars_complete" );
    objective_state( 5, "done" );
}

mortar_trigger( var_0 )
{
    var_0.count++;
    self waittill( "trigger" );
    self.count = 0;
    var_1 = getentarray( self.target, "targetname" );
    common_scripts\utility::array_thread( var_1, maps\_utility::add_spawn_function, ::mortar_guys, self );
    common_scripts\utility::array_thread( var_1, maps\_utility::spawn_ai );
    self waittill( "mortar_guys_are_dead" );
    var_0.count--;

    if ( !var_0.count )
        var_0 notify( "mortars_complete" );
}

mortar_guys( var_0 )
{
    var_0.count++;
    self setgoalpos( self.origin );
    self.goalradius = 64;
    self waittill( "death" );
    var_0.count--;

    if ( !var_0.count )
        var_0 notify( "mortar_guys_are_dead" );
}

wait_until_its_time_to_breach_the_third_floor_room( var_0 )
{
    while ( distance( var_0.origin, level.player.origin ) > 250 )
    {
        wait 0.05;

        if ( level.player.origin[2] < var_0.origin[2] - 32 )
            return 0;
    }

    return 1;
}

verify_that_allies_are_undeletable()
{

}

assign_the_two_closest_friendlies_to_the_player()
{
    for ( var_0 = 0; var_0 < 2; var_0++ )
        maps\_utility::promote_nearest_friendly( "y", "r" );
}

magic_laser_light_show()
{
    var_0 = getentarray( "magic_laser", "targetname" );
    common_scripts\utility::array_thread( var_0, ::magic_laser_lights );
}

magic_laser_lights()
{
    var_0 = getentarray( self.target, "targetname" );
    var_1 = var_0.size - 3;
    var_2 = getent( self.script_linkto, "script_linkname" );

    for ( var_3 = 0; var_3 < var_1; var_3++ )
    {
        var_4 = spawn( "script_model", ( 0.0, 0.0, 0.0 ) );
        var_4.origin = self.origin;
        var_4 setmodel( "tag_laser" );
        var_4 thread laser_targets_points( var_0, "lasers_shift_fire", var_2.origin, 0.75, 1.25 );
    }

    var_2 delete();
    self delete();
}

street_laser_light_show()
{
    for (;;)
    {
        common_scripts\utility::flag_wait( "player_nears_first_building" );
        common_scripts\utility::flag_clear( "stop_street_lasers" );
        var_0 = getentarray( "street_laser", "targetname" );
        common_scripts\utility::array_thread( var_0, ::street_laser_lights );
        common_scripts\utility::flag_waitopen( "player_nears_first_building" );
        common_scripts\utility::flag_set( "stop_street_lasers" );
    }
}

street_laser_lights()
{
    var_0 = getentarray( self.target, "targetname" );
    var_1 = 4;

    if ( var_1 > var_0.size )
        var_1 = var_0.size;

    for ( var_2 = 0; var_2 < var_1; var_2++ )
    {
        var_3 = spawn( "script_model", ( 0.0, 0.0, 0.0 ) );
        var_3.origin = self.origin;
        var_3 setmodel( "tag_laser" );
        var_3 thread laser_targets_points( var_0, "stop_street_lasers", undefined, 0.15, 0.9 );
    }
}

laser_targets_points( var_0, var_1, var_2, var_3, var_4 )
{
    var_5 = spawn( "script_origin", ( 0.0, 0.0, 0.0 ) );
    thread draw_laser_line( var_5 );
    var_6 = undefined;
    var_7 = 0;

    for ( var_8 = -1; !common_scripts\utility::flag( var_1 ); var_6.used = undefined )
    {
        var_9 = randomint( var_0.size );

        for (;;)
        {
            var_6 = var_0[var_9];

            if ( var_9 != var_8 && !isdefined( var_6.used ) )
            {
                var_8 = var_9;
                break;
            }

            var_9++;

            if ( var_9 >= var_0.size )
                var_9 = 0;
        }

        if ( !var_7 )
        {
            var_5.origin = var_6.origin;
            var_7 = 1;
        }
        else
        {
            var_10 = distance( var_5.origin, var_6.origin ) * 0.015;
            var_10 *= randomfloatrange( var_3, var_4 );
            var_5 moveto( var_6.origin, var_10, var_10 * 0.3, var_10 * 0.3 );
            laser_waits( var_1, var_10 );
        }

        var_5 thread laser_jitters();
        laser_waits( var_1, randomfloatrange( 1, 5 ) );
        var_5 notify( "stop_jitter" );
    }

    var_5 thread laser_jitters();
    maps\_utility::waitspread( 2 );
    var_5 notify( "stop_jitter" );

    if ( isdefined( var_2 ) )
    {
        var_2 += common_scripts\utility::randomvector( 25 );
        var_2 = ( var_2[0], var_2[1], var_5.origin[2] );
        var_10 = distance( var_5.origin, var_2 ) * 0.002;
        var_10 *= randomfloatrange( var_3, var_4 );
        var_5 moveto( var_2, var_10, var_10 * 0.3, var_10 * 0.3 );
        wait(var_10);
    }
    else
        wait(randomfloat( 0.1 ));

    self notify( "stop_line" );
    self laseroff();
    var_5 delete();
    self delete();
}

laser_waits( var_0, var_1 )
{
    if ( common_scripts\utility::flag( var_0 ) )
        return;

    level endon( var_0 );
    wait(var_1);
}

laser_jitters()
{
    self endon( "stop_jitter" );
    var_0 = self.origin;

    for (;;)
    {
        var_1 = var_0 + common_scripts\utility::randomvector( 3 );
        var_2 = randomfloatrange( 0.05, 0.2 );
        self moveto( var_1, var_2 );
        wait(var_2);
    }
}

modulate_laser()
{
    self.dolaser = 0;
    self endon( "stop_line" );

    for (;;)
    {
        level.player maps\_utility::ent_flag_wait( "nightvision_on" );
        self.dolaser = 1;
        self laseron();
        level.player maps\_utility::ent_flag_waitopen( "nightvision_on" );
        self.dolaser = 0;
        self laseroff();
    }
}

get_laser()
{
    var_0 = spawn( "script_model", ( 0.0, 0.0, 0.0 ) );
    var_0.origin = self.origin;
    var_0 setmodel( "tag_laser" );
    return var_0;
}

draw_laser_line( var_0 )
{
    self endon( "stop_line" );
    thread modulate_laser();
    wait 0.05;
    self.angles = vectortoangles( var_0.origin - self.origin );
    wait 0.05;

    for (;;)
    {
        self rotateto( vectortoangles( var_0.origin - self.origin ), 0.1 );

        if ( self.dolaser )
        {

        }

        wait 0.1;
    }
}

enemies_respond_to_attack( var_0, var_1, var_2 )
{
    common_scripts\utility::flag_clear( var_2 );
    var_3 = getentarray( var_0, "script_noteworthy" );
    common_scripts\utility::array_thread( var_3, ::attack_player_when_attacked, var_2 );
    setignoremegroup( "player", var_1 );
    common_scripts\utility::flag_wait( var_2 );
    setthreatbias( "player", var_1, 50000 );
}

upstairs_enemies_respond_to_attack()
{
    enemies_respond_to_attack( "upper_floor_enemies", "upstairs_unreachable_enemies", "unreachable_enemies_under_attack" );

    if ( common_scripts\utility::flag( "lasers_have_moved" ) )
    {
        setthreatbias( "player", "upstairs_unreachable_enemies", 0 );
        setthreatbias( "friendlies_under_unreachable_enemies", "upstairs_unreachable_enemies", 0 );
    }
}

window_enemies_respond_to_attack()
{
    enemies_respond_to_attack( "window_enemies", "upstairs_window_enemies", "window_enemies_under_attack" );
}

second_floor_laser_light_show()
{
    common_scripts\utility::flag_wait( "magic_lasers_turn_on" );
    thread magic_laser_light_show();
    wait_until_its_time_to_move_lasers();
    common_scripts\utility::flag_set( "lasers_shift_fire" );
    wait 2;
    common_scripts\utility::flag_set( "lasers_have_moved" );
}

attack_player_when_attacked( var_0 )
{
    if ( common_scripts\utility::flag( var_0 ) )
        return;

    if ( isspawner( self ) )
    {
        maps\_utility::add_spawn_function( ::attack_player_when_attacked, var_0 );
        return;
    }

    level endon( var_0 );
    self waittill( "death", var_1 );

    if ( !isdefined( self ) )
        return;

    if ( isplayer( var_1 ) )
        common_scripts\utility::flag_set( var_0 );
}

wait_until_its_time_to_move_lasers()
{
    level endon( "magic_lasers_turn_off" );
    level.price maps\_anim::anim_single_queue( level.price, "watch_your_fire" );
    maps\_utility::radio_dialogue( "shifting_fire" );
}

set_talker()
{
    for (;;)
    {
        self.index++;

        if ( self.index >= self.guys.size )
            self.index = 0;

        if ( isalive( self.guys[self.index] ) )
        {
            self.talker = self.guys[self.index];
            return;
        }
    }
}

wait_until_player_goes_into_second_floor_or_melee_sequence_completes()
{
    level endon( "melee_sequence_complete" );
    maps\_utility::wait_for_targetname_trigger( "hint_guy_trigger" );
}

wait_then_go()
{
    self setgoalpos( self.origin );
    self.goalheight = 64;
    self.goalradius = 32;
    wait 0.5;
    var_0 = getnode( self.target, "targetname" );
    self setgoalnode( var_0 );
}

die_shortly()
{
    if ( !isalive( self ) )
        return;

    self endon( "death" );
    maps\_utility::waitspread( 0, 8 );
    self kill( ( 0.0, 0.0, 0.0 ) );
}

wait_while_enemies_are_alive_near_player()
{
    for (;;)
    {
        var_0 = 0;
        var_1 = getaiarray( "axis" );

        if ( !var_1.size )
            return;

        for ( var_2 = 0; var_2 < var_1.size; var_2++ )
        {
            var_3 = var_1[var_2];

            if ( distance( var_3.origin, level.player.origin ) < 240 )
            {
                var_0 = 1;
                break;
            }
        }

        if ( !var_0 )
            return;

        wait 0.05;
    }
}

aim_at_target()
{
    self endon( "death" );
    var_0 = 0;

    for (;;)
    {
        if ( isdefined( self.enemy ) )
        {
            if ( var_0 )
            {
                self clearenemy();
                var_0 = 0;
            }

            wait 1;
            continue;
        }

        var_0 = 1;
        self setentitytarget( common_scripts\utility::random( level.aim_targets ) );
        wait(randomfloatrange( 1, 4.5 ));
    }
}

clear_player_threatbias_vs_apartment_enemies()
{
    setthreatbias( "player", "upstairs_unreachable_enemies", 0 );
    setthreatbias( "player", "upstairs_window_enemies", 0 );
}

stick_me_to_my_spot()
{
    self.maxsightdistsqrd = 0;
    self setgoalpos( self.origin );
    self.goalradius = 16;
}

ignore_suppression_until_ambush()
{
    self endon( "death" );
    self.ignoresuppression = 1;
    self.pacifist = 1;
    common_scripts\utility::flag_wait( "friendlies_take_fire" );
    self.pacifist = 0;
    self.ignoresuppression = 0;
}

increase_goal_radius_when_friendlies_flank()
{
    self endon( "death" );
    self.goalheight = 60;
    self.goalradius = 128;
    common_scripts\utility::flag_wait( "pacifist_guys_move_up" );
    self.goalradius = 3050;
    self setengagementmindist( randomintrange( 0, 125 ), 0 );
    var_0 = randomintrange( 250, 350 );
    self setengagementmaxdist( var_0, var_0 + 100 );
    self setthreatbiasgroup( "pacifist_lower_level_enemies" );
    self.ignoresuppression = 1;
}

debug_player_damage()
{
    for (;;)
    {
        level.player waittill( "damage", var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7 );
        level.hitenemy = var_1;
        var_8 = 5;
    }
}

initial_friendly_setup()
{
    maps\_utility::spawn_failed( self );
    self.animname = "generic";
    self.moveplaybackrate = 1;
    self.goalradius = 16;
    self setgoalpos( self.origin );
    self.pacifist = 1;
}

bridge_friendly_spawns()
{
    self endon( "death" );

    if ( !isdefined( self.script_forcecolor ) )
        maps\_utility::set_force_color( "y" );

    set_engagement_to_closer();
    self.ignoresuppression = 1;
    self.ignorerandombulletdamage = 1;
    self.pacifist = 1;
    common_scripts\utility::flag_wait( "friendlies_move_up_the_bridge" );
    self.pacifist = 0;
}

small_pathenemy()
{
    self.pathenemyfightdist = 50;
    self.pathenemylookahead = 50;
}

magic_rpgs_fire()
{
    var_0 = getentarray( self.target, "targetname" );

    for ( var_1 = 0; var_1 < var_0.size; var_1++ )
    {
        magicbullet( "rpg_straight", self.origin, var_0[var_1].origin );
        wait(randomfloatrange( 1.5, 5 ));
    }
}

magic_rpg_fires( var_0 )
{
    var_1 = getent( var_0, "targetname" );
    var_1 magic_rpgs_fire();
}

delete_me()
{
    self delete();
}

set_engagement_to_closer()
{
    self setengagementmindist( 0, 0 );
    self setengagementmaxdist( 1000, 3000 );
}

set_min_engagement_distance( var_0, var_1 )
{
    self setengagementmindist( var_0, var_1 );
}

set_max_engagement_distance( var_0, var_1 )
{
    self setengagementmaxdist( var_0, var_1 );
}

incoming_rpg()
{
    magic_rpg_fires( "magic_rpg1" );
    wait 2.5;
    magic_rpg_fires( "magic_rpg2" );
}

ambushed_guys_die()
{
    wait 1.5;
    var_0 = getentarray( "ambushed_guy", "targetname" );
    common_scripts\utility::array_thread( var_0, ::killme );
}

killme()
{
    self kill( ( 0.0, 0.0, 0.0 ) );
}

waitspread_death( var_0 )
{
    if ( !isalive( self ) )
        return;

    self endon( "death" );
    maps\_utility::waitspread( var_0 );
    killme();
}

slowdown()
{
    self endon( "death" );
    self.walkdist = 5000;
    wait 0.4;
    self setgoalpos( self.origin );
}

set_ignore_suppression( var_0 )
{
    self.ignoresuppression = var_0;
}

wait_until_price_triggers_or_player_reaches_bridge_end()
{
    level endon( "player_reaches_end_of_bridge" );

    if ( common_scripts\utility::flag( "player_reaches_end_of_bridge" ) )
        return;

    for (;;)
    {
        self waittill( "trigger", var_0 );

        if ( !isalive( var_0 ) )
            continue;

        if ( var_0 != level.price )
            continue;

        break;
    }
}

promoted_cyan_guy_leads_player_to_apartment( var_0 )
{
    if ( self.script_forcecolor != "c" )
        return;

    thread cyan_guys_lead_player_to_apartment();
}

wait_until_player_gets_close_or_enters_apartment()
{
    level endon( "friendlies_move_into_apartment" );

    while ( distance( self.origin, level.player.origin ) > 128 )
    {
        if ( self cansee( level.player ) )
        {
            var_0 = level.player getplayerangles();
            var_1 = anglestoforward( var_0 );
            var_2 = vectornormalize( self.origin - level.player.origin );
            var_3 = vectordot( var_1, var_2 );

            if ( var_3 > 0.8 )
                return;
        }

        wait 1;
    }
}

cyan_guys_lead_player_to_apartment()
{
    self endon( "death" );
    self endon( "damage_notdone" );
    wait_until_player_gets_close_or_enters_apartment();
    maps\_utility::set_force_color( "b" );

    if ( self == level.price )
        thread price_signals_player_into_apartment();

    if ( !maps\_utility::is_hero() )
        thread maps\_utility::magic_bullet_shield();

    common_scripts\utility::flag_wait( "pit_guys_cleared" );
    self.ignoreall = 1;
    common_scripts\utility::flag_wait( "friendlies_storm_second_floor" );
    self.ignoreall = 0;
}

price_signals_player_into_apartment()
{
    if ( common_scripts\utility::flag( "friendlies_storm_second_floor" ) )
        return;

    level endon( "friendlies_storm_second_floor" );
    var_0 = getnode( "price_underground_node", "targetname" );

    while ( !var_0 maps\_anim::anim_reach_solo( level.price, "wait_approach" ) )
    {

    }

    var_0 maps\_anim::anim_single_solo( level.price, "wait_approach" );
    thread price_waits_at_node_and_waves( var_0, "vas_stops_leading" );
    thread price_recovers_from_waving( var_0 );
}

price_recovers_from_waving( var_0 )
{
    common_scripts\utility::flag_wait( "friendlies_storm_second_floor" );
    level notify( "vas_stops_leading" );
    level common_scripts\utility::flag_set( "vas_stops_leading" );
}

wait_for_player_to_disrupt_second_floor_or_leave()
{
    level endon( "player_leaves_second_floor" );
    common_scripts\utility::flag_wait( "player_disrupts_second_floor" );
}

manual_mg_fire()
{
    self endon( "stop_firing" );
    self.turret_fires = 1;

    for (;;)
    {
        var_0 = randomfloatrange( 0.2, 0.7 ) * 20;

        if ( self.turret_fires )
        {
            for ( var_1 = 0; var_1 < var_0; var_1++ )
            {
                self shootturret();
                wait 0.05;
            }
        }

        wait(randomfloat( 0.5 ));
    }
}

wait_for_death( var_0 )
{
    if ( !isalive( var_0 ) )
        return;

    var_0 waittill( "death" );
}

scr_setmode( var_0 )
{
    self setmode( var_0 );
}

flank_guy()
{
    level.flank_guy = getent( "flank_guy", "targetname" );
    maps\_utility::spawn_failed( level.flank_guy );
    level.flank_guy.goalradius = 8;
    level.flank_guy.pacifist = 1;
    level.flank_guy allowedstances( "crouch" );
    level.flank_guy thread maps\_utility::magic_bullet_shield();
    level.flank_guy.ignoreme = 1;
    level.flank_guy maps\_utility::make_hero();
    level.flank_guy.ignoresuppression = 1;
}

rooftop_guys_attack()
{
    self endon( "death" );
    maps\_utility::waitspread( 5 );

    for ( var_0 = 0; var_0 < self.count; var_0++ )
    {
        var_1 = maps\_utility::spawn_ai();

        if ( maps\_utility::spawn_failed( var_1 ) )
            return;

        var_1 waittill( "death" );
    }
}

hint_guy_gets_the_players_attention()
{
    self.ignoreme = 1;
    self.ignoresuppression = 1;
    self endon( "death" );
    wait 2.5;
    maps\_spawner::go_to_node();
    wait 3;
    self.ignoreme = 0;
    self.goalradius = 2048;
}

upstairs_unreachable_enemies()
{
    maps\_utility::add_spawn_function( ::ignore_suppression_until_ambush );
    maps\_utility::add_spawn_function( ::small_pathenemy );
    maps\_utility::add_spawn_function( ::set_threatbias_group, "upstairs_unreachable_enemies" );
}

upstairs_window_enemies()
{
    maps\_utility::add_spawn_function( ::ignore_suppression_until_ambush );
    maps\_utility::add_spawn_function( ::set_threatbias_group, "upstairs_window_enemies" );
}

teleport_purple_guys_closer()
{
    var_0 = maps\_utility::get_force_color_guys( "allies", "p" );
    var_1 = getentarray( "purple_teleport_org", "targetname" );

    for ( var_2 = 0; var_2 < var_0.size; var_2++ )
    {
        var_3 = var_0[var_2];

        if ( isalive( level.saved_friendly ) && var_3 == level.saved_friendly )
            continue;

        if ( var_3.origin[2] + 37 > var_1[var_2].origin[2] )
            continue;

        var_3 teleport( var_1[var_2].origin );
    }
}

remove_corner_ai_blocker()
{
    var_0 = getent( "corner_ai_blocker", "targetname" );

    if ( isdefined( var_0 ) )
    {
        var_0 connectpaths();
        var_0 delete();
    }
}

wait_until_price_nears_balcony()
{
    var_0 = getent( "price_gap_trigger", "targetname" );

    for (;;)
    {
        var_0 waittill( "trigger", var_1 );

        if ( var_1 == level.price )
            return;

        var_1 thread maps\_utility::ignore_triggers();
    }
}

wait_until_player_nears_balcony()
{
    level.balcony_objective_org = ( 10216.3, 174.7, 239.5 );
    var_0 = ( level.balcony_objective_org[0], level.balcony_objective_org[1], 0 );

    while ( distance( var_0, ( level.player.origin[0], level.player.origin[1], 0 ) ) > 200 )
        wait 0.25;
}

price_congrates()
{
    self waittill( "death", var_0 );

    if ( isalive( var_0 ) && isplayer( var_0 ) )
    {
        wait 2.5;
        level.price thread maps\_anim::anim_single_queue( level.price, "good_job" );
    }
}

player_is_on_mg()
{
    var_0 = getent( "apartment_window_mg_1", "targetname" );
    var_1 = var_0 getturretowner();

    if ( !isalive( var_1 ) )
        return 0;

    return isplayer( var_1 );
}

debug_pain()
{
    self endon( "death" );

    for (;;)
    {
        self waittill( "pain", var_0, var_1, var_2, var_3, var_4, var_5 );
        var_6 = undefined;
    }
}

shoot_mg_targets()
{
    thread maps\_utility::do_in_order( common_scripts\utility::flag_wait, "player_enters_apartment_rubble_area", maps\_utility::send_notify, "stop_firing" );
    thread stop_firing_when_shot();
    var_0 = getentarray( self.target, "targetname" );

    for (;;)
    {
        var_1 = common_scripts\utility::random( var_0 );
        self settargetentity( var_1 );
        wait(randomfloatrange( 1, 5 ));
    }
}

explosive_damage( var_0 )
{
    return issubstr( var_0, "GRENADE" );
}

stop_firing_when_shot()
{
    level endon( "player_enters_apartment_rubble_area" );
    var_0 = getent( self.script_linkto, "script_linkname" );
    var_1 = randomintrange( 2, 3 );

    for (;;)
    {
        var_0 waittill( "damage", var_2, var_3, var_4, var_5, var_6 );

        if ( !isplayer( var_3 ) )
            continue;

        if ( explosive_damage( var_6 ) )
        {
            self.turret_fires = 0;
            thread maps\_utility::arcademode_kill( self.origin, var_6, 100 );
            return;
        }

        var_1--;

        if ( var_1 > 0 )
            continue;

        var_1 = randomintrange( 3, 4 );
        self.turret_fires = 0;
        wait(randomfloatrange( 7, 10 ));
        self.turret_fires = 1;
    }
}

price_waits_at_node_and_waves( var_0, var_1 )
{
    common_scripts\utility::flag_assert( var_1 );
    var_2 = 1;

    for (;;)
    {
        var_0 thread maps\_anim::anim_loop_solo( level.price, "wait_idle", undefined, "stop_idle" );
        wait(randomfloat( 0.1 ));
        var_0 notify( "stop_idle" );

        if ( var_2 )
            var_0 maps\_anim::anim_single_solo( level.price, "wave1" );
        else
        {
            if ( common_scripts\utility::flag( "friendlies_move_up_the_bridge" ) )
                objective_ring( 2 );

            var_0 maps\_anim::anim_single_solo( level.price, "wave2" );
        }

        if ( level common_scripts\utility::flag( var_1 ) )
        {
            level.price stopanimscripted();
            return;
        }

        var_2 = !var_2;
    }
}

#using_animtree("vehicles");

cobra_crash()
{
    for (;;)
    {
        self waittill( "trigger", var_0 );

        if ( isdefined( var_0.vehicle_spawner ) )
        {
            if ( var_0.vehicle_spawner.targetname != "heli_crash" )
                continue;
        }

        soundscripts\_snd::snd_message( "start_cobra_crash_sequence" );
        var_1 = spawn( "script_model", ( 0.0, 0.0, 0.0 ) );
        var_1.origin = var_0.origin;
        var_1.angles = var_0.angles;
        var_1 setmodel( var_0.model );
        var_1 useanimtree( #animtree );
        var_1 animscripted( "blah", var_1.origin, var_1.angles, %cobra_crash );
        var_0 delete();
        playfxontag( common_scripts\utility::getfx( "heli_aerial_explosion_large" ), var_1, "tag_body" );
        var_1 playsound( "helicopter_hit" );
        maps\_utility::delaythread( 0.1, maps\_utility::_earthquake, 0.4, 1.2, var_1.origin, 6000 );
        var_1 playloopsound( "helicopter_dying_loop" );
        var_1 thread maps\_utility::play_sound_on_tag_endon_death( "helicopter_dying_layer" );
        var_1 thread tailfx();
        wait 2;
        playfxontag( common_scripts\utility::getfx( "heli_aerial_explosion" ), var_1, "tail_rotor_jnt" );
        var_1 playsound( "helicopter_hit" );
        wait 1;
        playfxontag( common_scripts\utility::getfx( "heli_aerial_explosion" ), var_1, "tag_deathfx" );
        var_1 playsound( "helicopter_hit" );
        wait 2;
        common_scripts\_exploder::exploder( 2 );
        thread floating_crash_heli();
        var_1 notify( "stop_tail_fx" );
        var_1 delete();
        wait 2;
        soundscripts\_snd::snd_message( "stop_cobra_crash_sequence" );
        wait 3;
    }
}

floating_crash_heli()
{
    thread floating_object( "floating_crash_heli", 5, 3.5, 5, 0.2, 0.25 );
}

floating_object( var_0, var_1, var_2, var_3, var_4, var_5, var_6 )
{
    level endon( "stop_all_floating_objects" );
    var_7 = getent( var_0, "script_noteworthy" );
    var_7 endon( "stop_floating" );

    if ( isdefined( var_6 ) )
        playfx( var_6, var_7.origin );

    for (;;)
    {
        var_1 *= -1;
        var_8 = randomfloatrange( var_2, var_3 );
        var_7 movez( var_1, var_8, var_4, var_5 );
        wait(var_8);
    }
}

tailfx()
{
    self endon( "stop_tail_fx" );
    var_0 = [];
    var_0[var_0.size] = "tail_rotor_jnt";
    var_1 = getarraykeys( var_0 );
    var_2 = undefined;

    for (;;)
    {
        for ( var_3 = 0; var_3 < var_1.size; var_3++ )
        {
            var_4 = self gettagorigin( var_0[var_1[var_3]] );
            playfx( common_scripts\utility::getfx( "smoke_trail_heli" ), var_4 );
        }

        wait 0.05;
    }
}

helis_ambient()
{
    thread helicopter_flies_by_overhead( "intro_heli", 5, 95, 95 );
    thread helicopter_flies_by_overhead( "intro_helib", 5.85, 95, 95 );
    thread helicopter_flies_by_overhead( "intro_heli2", 9, 95, 95 );
    thread helicopter_flies_by_overhead( "intro_heli2b", 9.95, 95, 95 );
    thread helicopter_flies_by_overhead( "intro_heli3", 14, 135, 95 );
    thread helicopter_flies_by_overhead( "intro_heli3b", 14.95, 135, 95 );
    common_scripts\utility::flag_wait( "armada_passes_by" );
    var_0 = [];
    var_0 = add_heli_set( "intro_heli", 95, 95 );
    var_0 = add_heli_set( "intro_heli2", 95, 95 );
    var_0 = add_heli_set( "intro_heli3", 135, 95 );
    var_0 = add_heli_set( "intro_heli4", 165, 95 );

    for (;;)
    {
        var_0 = common_scripts\utility::array_randomize( var_0 );

        for ( var_1 = 0; var_1 < var_0.size; var_1++ )
        {
            var_2 = var_0[var_1];
            thread helicopter_flies_by_overhead( var_2["heli1"], 0, var_2["maxspeed"], var_2["accell"] );
            thread helicopter_flies_by_overhead( var_2["heli2"], 0.8, var_2["maxspeed"], var_2["accell"] );
            wait(randomfloatrange( 8, 12 ));
        }
    }
}

add_heli_set( var_0, var_1, var_2 )
{
    var_3 = [];
    var_3["heli1"] = var_0;
    var_3["heli2"] = var_0 + "b";
    var_3["maxspeed"] = var_1;
    var_3["accell"] = var_2;
    return var_3;
}

die_soon( var_0 )
{
    if ( !isalive( self ) )
        return;

    self endon( "death" );
    wait(var_0);
    self kill( ( 0.0, 0.0, 0.0 ) );
}

player_has_javelin()
{
    var_0 = level.player getweaponslistprimaries();

    for ( var_1 = 0; var_1 < var_0.size; var_1++ )
    {
        if ( issubstr( var_0[var_1], "avelin" ) )
            return 1;
    }

    return 0;
}

player_using_javelin()
{
    return issubstr( level.player getcurrentweapon(), "avelin" );
}

player_fires_javelin()
{
    return level.player isfiring() && issubstr( level.player getcurrentweapon(), "avelin" );
}

overpass_baddies_attack()
{
    level endon( "overpass_baddies_flee" );
    wait 5;
    var_0 = getentarray( "bridge_spawner", "targetname" );

    for (;;)
    {
        if ( getaiarray( "axis" ).size >= 18 )
        {
            wait 180;
            continue;
        }

        var_1 = common_scripts\utility::random( var_0 );
        var_1.count = 3;
        var_1 thread maps\_spawner::flood_spawner_think();
        wait 5;
    }
}

die_asap()
{
    self endon( "death" );

    while ( self cansee( level.player ) )
        wait 0.2;

    self delete();
}

shanty_run()
{
    if ( isdefined( self.target ) )
    {
        var_0 = getent( self.target, "targetname" );
        var_0.trigger_num = self.trigger_num + 1;
        var_0 thread shanty_run();
    }

    for (;;)
    {
        self waittill( "trigger", var_1 );

        if ( !isalive( var_1 ) )
            continue;

        var_1.trigger_num = self.trigger_num;

        if ( isplayer( var_1 ) )
        {
            level notify( "new_player_trigger_num" );
            continue;
        }

        var_1 notify( "new_trigger_num" );
    }
}

waittill_new_trigger_num()
{
    self endon( "new_trigger_num" );
    level waittill( "new_player_trigger_num" );
}

shanty_allies_cqb_through()
{
    self endon( "death" );
    maps\_colors::assign_nodes_intelligently_for_squad( 1 );
    common_scripts\utility::flag_wait( "start_shanty_run" );
    maps\_colors::assign_nodes_intelligently_for_squad( 0 );
    var_0 = getentarray( "shanty_destination", "targetname" );
    var_1 = common_scripts\utility::random( var_0 );
    self.goalradius = 128;
    self.interval = 0;
    maps\_utility::disable_ai_color();
    maps\_spawner::go_to_origin( var_1 );
    self.interval = 96;

    if ( self == level.price )
    {
        var_2 = getent( "price_spawner", "targetname" );
        level.price maps\_utility::set_force_color( var_2.script_forcecolor );
    }
    else
    {
        if ( self == level.mark )
        {
            var_3 = getent( "mark_spawner", "targetname" );
            level.mark maps\_utility::set_force_color( var_3.script_forcecolor );
            return;
        }

        if ( level.ending_bog_redshirts >= 2 )
        {
            var_4 = getent( "ally_charge_bog_org", "targetname" ).origin;
            self setgoalpos( var_4 );

            if ( isdefined( self.magic_bullet_shield ) )
                maps\_utility::stop_magic_bullet_shield();

            self.health = 1;
            return;
        }

        level.ending_bog_redshirts++;

        if ( level.ending_bog_redshirts == 1 )
        {
            maps\_utility::set_force_color( "r" );
            return;
        }

        maps\_utility::set_force_color( "b" );
    }
}

shanty_allies_cqb_end()
{
    self endon( "death" );
    var_0 = getent( "end_cqb_walk", "targetname" );

    for (;;)
    {
        var_0 waittill( "trigger", var_1 );

        if ( var_1 == self )
            break;
    }

    wait(randomfloatrange( 0.5, 3.5 ));
    var_1 maps\_utility::disable_cqbwalk();
    var_1.wantshotgun = 0;
}

shanty_ai_think()
{
    maps\_utility::disable_ai_color();
    self.trigger_num = 0;
    self endon( "death" );
    self.interval = 0;
    self endon( "reached_shanty_end" );

    if ( self != level.price )
        self.animname = "generic";

    for (;;)
    {
        waittill_new_trigger_num();

        if ( level.player.trigger_num - self.trigger_num >= 2 )
        {
            self.moveplaybackrate = 1.21;
            continue;
        }

        if ( level.player.trigger_num - self.trigger_num == 1 )
        {
            self.moveplaybackrate = 1.1;
            continue;
        }

        if ( level.player.trigger_num - self.trigger_num == 0 )
        {
            self.moveplaybackrate = 1.0;
            continue;
        }

        if ( level.player.trigger_num - self.trigger_num == -1 )
        {
            self.moveplaybackrate = 1.0;
            continue;
        }

        if ( level.player.trigger_num - self.trigger_num == -2 )
        {
            self.moveplaybackrate = 1.0;
            continue;
        }

        if ( level.player.trigger_num - self.trigger_num <= -3 )
        {
            var_0 = ( gettime() - level.shanty_timer ) * 0.001;
            var_1 = var_0 + randomfloatrange( 2, 3 );
            level.shanty_timer = gettime();

            if ( var_1 > 0 )
                wait(var_1);

            if ( level.player.trigger_num - self.trigger_num <= -3 )
                self setgoalpos( self.origin );
        }
    }
}

shanty_ai_sprint()
{
    maps\_utility::disable_ai_color();
    self.trigger_num = 0;

    if ( self != level.price )
        self.animname = "generic";

    maps\_utility::set_run_anim( "sprint" );
}

showplaybackrate()
{
    self endon( "death" );

    for (;;)
        wait 0.05;
}

magic_rpgs_fire_randomly()
{
    maps\_utility::waitspread( 1, 6 );
    magic_rpgs_fire();
}

magic_rpg_trigger()
{
    level endon( "stop_shanty_rockets" );
    self waittill( "trigger" );
    var_0 = getentarray( self.target, "targetname" );

    for ( var_1 = 0; var_1 < var_0.size; var_1++ )
    {
        var_0[var_1] magic_rpgs_fire();
        wait(randomfloatrange( 1.5, 5 ));
    }
}

bog_ambient_fighting()
{
    self endon( "death" );
    thread maps\_utility::magic_bullet_shield();
    self.goalradius = 1450;
    common_scripts\utility::flag_wait( "kill_bog_ambient_fighting" );
    maps\_utility::stop_magic_bullet_shield();
    self delete();
}

take_cover_against_overpass()
{
    if ( isdefined( self.fence_guy ) )
        return;

    self endon( "death" );
    maps\_utility::disable_ai_color();
    self setgoalpos( self.origin );
    maps\_utility::waitspread( 2 );
    self.fixednode = 0;
    self.goalradius = 2048;
}

alley_balcony_guy()
{
    self endon( "death" );
    common_scripts\utility::flag_wait( "price_in_alley_position" );
    magicbullet( "rpg_straight", self.origin + ( 0.0, 0.0, 10.0 ), self.origin );
}

lose_goal_volume()
{
    for (;;)
    {
        self waittill( "trigger", var_0 );

        if ( !isalive( var_0 ) )
            continue;

        var_0 thread maps\_utility::ignore_triggers();
        var_0.dont_use_goal_volume = 1;
    }
}

wait_until_javelin_guy_died_or_must_die()
{
    if ( !isalive( self ) )
        return;

    self waittill( "death" );
}

die_after_spawn( var_0 )
{
    self endon( "death" );
    wait(var_0);
    self kill( ( 0.0, 0.0, 0.0 ) );
}

wait_until_price_reaches_his_trigger()
{
    var_0 = getent( "price_alley_trig", "targetname" );

    for (;;)
    {
        var_0 waittill( "trigger", var_1 );

        if ( !isalive( var_1 ) )
            continue;

        if ( var_1 != level.price )
            continue;

        return;
    }
}

wait_for_friendlies_to_reach_alley_goal()
{
    var_0 = gettime() + 15000;

    for (;;)
    {
        if ( check_allies_in_position() )
            return;

        if ( gettime() > var_0 )
            return;

        wait 0.1;
    }
}

check_allies_in_position()
{
    var_0 = maps\_utility::get_force_color_guys( "allies", "y" );
    var_1 = maps\_utility::get_force_color_guys( "allies", "o" );
    var_2 = common_scripts\utility::array_combine( var_0, var_1 );
    var_3 = var_2.size - 2;

    for ( var_4 = 0; var_4 < var_2.size; var_4++ )
    {
        var_5 = var_2[var_4];

        if ( !isdefined( var_5.goalpos ) )
            continue;

        if ( distance( var_5.origin, var_5.goalpos ) > 60 )
            continue;

        var_3--;

        if ( var_3 <= 0 )
            return 1;
    }

    return 0;
}

shanty_fence_cut_setup()
{
    var_0 = maps\_utility::spawn_anim_model( "fence" );
    var_1 = getent( "shanty_fence_org", "targetname" );
    var_1 thread maps\_anim::anim_first_frame_solo( var_0, "fence_cut" );
    level.shanty_fence = var_0;
}

shanty_fence_cut()
{
    var_0 = level.shanty_fence;
    var_1 = getent( "shanty_fence_org", "targetname" );
    var_2 = getent( "shanty_fence_clip", "targetname" );
    var_2 connectpaths();
    var_0.animname = "fence";
    var_0 maps\_utility::assign_animtree();
    var_3 = level.fence_guys[0];
    var_4 = level.fence_guys[1];
    var_3.animname = "fence_guy1";
    var_4.animname = "fence_guy2";
    var_5 = [];
    var_5[var_5.size] = var_3;
    var_5[var_5.size] = var_4;

    if ( getdvarint( "use_old_fence_cutting" ) == 1 )
        var_1 maps\_anim::anim_reach_and_plant( var_5, "fence_cut" );
    else
        var_1 maps\_anim::anim_reach( var_5, "fence_cut" );

    common_scripts\utility::array_thread( var_5, ::set_allowpain, 0 );
    common_scripts\utility::array_thread( var_5, maps\_utility::setflashbangimmunity, 1 );
    var_1 thread maps\_anim::anim_single_solo( var_0, "fence_cut" );

    if ( getdvarint( "use_old_fence_cutting" ) == 1 )
    {
        var_2 maps\_utility::delaythread( 12.45, maps\_utility::self_delete );
        maps\_utility::delaythread( 12.45, maps\_utility::activate_trigger_with_targetname, "shanty_after_fence" );
    }

    var_3 pushplayer( 1 );

    if ( getdvarint( "use_old_fence_cutting" ) == 1 )
        var_1 thread maps\_anim::anim_custom_animmode( var_5, "gravity", "fence_cut" );
    else
        var_1 thread maps\_anim::anim_single( var_5, "fence_cut" );

    common_scripts\utility::array_thread( var_5, maps\_utility::set_force_color, "r" );
    var_1 waittill( "fence_cut" );
    var_3 pushplayer( 0 );

    if ( getdvarint( "use_old_fence_cutting" ) != 1 )
    {
        var_4 waittillmatch( "single anim", "anim_movement = \"run\"" );
        var_2 delete();
        maps\_utility::activate_trigger_with_targetname( "shanty_after_fence_r" );
        wait 2;
        maps\_utility::activate_trigger_with_targetname( "shanty_after_fence_o" );
    }

    common_scripts\utility::array_thread( var_5, maps\_utility::stop_magic_bullet_shield );
    common_scripts\utility::array_thread( var_5, ::set_allowpain, 1 );
    common_scripts\utility::array_thread( var_5, maps\_utility::setflashbangimmunity, 0 );
}

set_allowpain( var_0 )
{
    self.allowpain = var_0;
}

wait_until_deathflag_enemies_remaining( var_0, var_1 )
{
    var_2 = getaiarray( "axis" );

    for (;;)
    {
        var_3 = 0;
        var_4 = level.deathflags[var_0]["spawners"];
        var_5 = getarraykeys( var_4 );

        for ( var_6 = 0; var_6 < var_5.size; var_6++ )
        {
            if ( isdefined( var_4[var_5[var_6]] ) )
                var_3 += var_4[var_5[var_6]].count;
        }

        var_3 += level.deathflags[var_0]["ai"].size;
        level.temp_deathflagcount = var_3;

        if ( var_3 <= var_1 )
            break;

        wait 1;
    }
}

friendlies_charge_alley_early()
{
    wait_until_deathflag_enemies_remaining( "alley_cleared", 6 );
    common_scripts\utility::flag_set( "friendlies_charge_alley" );
}

second_floor_door_breach_guys( var_0 )
{
    var_1 = getent( "apartment_second_floor_door_breach", "targetname" );
    var_2 = maps\_utility::spawn_anim_model( "door" );
    var_1 hide();
    var_1 linkto( var_2, "door_jnt", ( 0.0, 0.0, 0.0 ), ( 0.0, 0.0, 0.0 ) );
    var_3 = getnode( "second_floor_door_breach_node", "targetname" );
    level.door_mod = ( -20.0, -5.35, 0.0 );
    var_4 = spawn( "script_origin", var_3.origin + level.door_mod );
    level.door_ent = var_4;
    var_4.angles = var_3.angles + ( 0.0, 270.0, 0.0 );
    var_4 thread maps\_anim::anim_first_frame_solo( var_2, "door_breach" );
    var_5 = spawn( "script_origin", var_3.origin + ( -20.0, -13.0, 0.0 ) );
    var_5.angles = var_3.angles;
    common_scripts\utility::flag_wait( "second_floor_door_breach_initiated" );
    remove_corner_ai_blocker();

    if ( var_0 )
    {
        var_6 = maps\_utility::get_guy_with_script_noteworthy_from_spawner( "second_floor_right_door_breach_guy" );
        var_7 = maps\_utility::get_guy_with_script_noteworthy_from_spawner( "second_floor_left_door_breach_guy" );
    }
    else
    {
        var_7 = maps\_utility::get_closest_colored_friendly( "p" );
        var_7 maps\_utility::make_hero();
        var_7 maps\_utility::clear_force_color();
        var_6 = maps\_utility::get_closest_colored_friendly_with_classname( "b", "shotgun" );

        if ( !isalive( var_6 ) )
            var_6 = maps\_utility::get_closest_colored_friendly_with_classname( "p", "shotgun" );

        if ( !isalive( var_6 ) )
        {
            var_8 = getent( "player_sees_breach_spawner", "targetname" );

            while ( level.player istouching( var_8 ) )
                wait 0.1;

            var_6 = maps\_utility::get_guy_with_script_noteworthy_from_spawner( "second_floor_left_door_breach_guy" );
        }

        var_6 maps\_utility::make_hero();
        var_6 maps\_utility::clear_force_color();
    }

    var_7.goalheight = 64;
    var_6.goalheight = 64;
    var_7.animname = "second_floor_left_guy";
    var_6.animname = "second_floor_right_guy";

    if ( !isdefined( var_7.magic_bullet_shield ) )
        var_7 thread maps\_utility::magic_bullet_shield();

    if ( !isdefined( var_6.magic_bullet_shield ) )
        var_6 thread maps\_utility::magic_bullet_shield();

    var_9 = [];
    var_9[var_9.size] = var_7;
    var_9[var_9.size] = var_6;
    var_5 maps\_anim::anim_reach_and_idle( var_9, "door_breach_setup", "door_breach_setup_idle", "stop_door_breach_idle" );
    var_5 notify( "stop_door_breach_idle" );
    var_5 maps\_anim::anim_single( var_9, "door_breach_setup" );
    var_5 thread maps\_anim::anim_loop( var_9, "door_breach_idle", "stop_loop" );
    second_floor_waittill_breach( var_9 );

    if ( common_scripts\utility::flag( "player_enters_laundrymat" ) )
    {
        common_scripts\utility::array_thread( var_9, maps\_utility::stop_magic_bullet_shield );
        common_scripts\utility::array_thread( var_9, maps\_utility::_delete );
        return;
    }

    var_5 notify( "stop_loop" );
    var_5 thread maps\_anim::anim_single( var_9, "door_breach" );
    var_6 waittillmatch( "single anim", "kick" );
    var_4 thread maps\_anim::anim_single_solo( var_2, "door_breach" );
    var_1 connectpaths();
    var_1 playsound( "wood_door_kick" );
    var_7.goalradius = 32;
    var_6.goalradius = 32;
    var_7.threatbias = 5500;
    var_7.baseaccuracy = 1000;
    var_6.baseaccuracy = 1000;
    var_10 = spawn_guys_from_targetname( var_3.target );

    for ( var_11 = 0; var_11 < var_10.size; var_11++ )
    {
        var_12 = var_10[var_11];
        var_12.baseaccuracy = 0;
        var_12.goalradius = 8;
        var_12.health = 1;
        var_12.pathenemyfightdist = 0;
        var_12.pathenemylookahead = 0;
        var_12 allowedstances( "stand" );

        if ( isdefined( var_12.target ) )
            var_12 thread maps\bog_a::wait_then_go_to_target();
    }

    wait 2;
    var_7 setgoalpos( var_7.origin );
    var_5 waittill( "door_breach" );

    for ( var_11 = 0; var_11 < var_10.size; var_11++ )
    {
        if ( isalive( var_10[var_11] ) )
            var_10[var_11] waittill( "death" );
    }

    var_6.baseaccuracy = 1;
    var_13 = getnode( "left_guy_breach_node", "targetname" );
    var_14 = getnode( "right_guy_breach_node", "targetname" );
    var_7.baseaccuracy = 1;
    var_7 setgoalpos( var_7.origin );
    var_7.goalradius = 64;
    var_6 maps\_anim::anim_single_solo( var_6, "clear" );
    var_3 = getnode( "second_floor_clear_node", "targetname" );
    var_7 setgoalnode( var_3 );
    var_7.goalradius = 32;
    var_3 = getnode( "second_floor_wait_node", "targetname" );
    var_6 setgoalnode( var_3 );
    var_7 waittill( "goal" );
    var_7.threatbias = 0;
    var_7 maps\_anim::anim_single_solo( var_7, "clear" );
    var_7 maps\_anim::anim_single_solo( var_7, "three_coming_out" );
    wait 1;
    var_7 maps\_utility::scrub();
    var_7 setgoalnode( var_13 );
    var_7.goalradius = 32;

    if ( !var_0 )
        level.price thread maps\_anim::anim_single_queue( level.price, "roger_that" );

    var_6 maps\_anim::anim_single_solo( var_6, "clear" );
    var_6 maps\_utility::scrub();
    var_6 setgoalnode( var_14 );
    var_6.goalradius = 32;

    if ( var_0 )
    {
        var_7 waittill( "goal" );

        for ( var_11 = 0; var_11 < var_9.size; var_11++ )
            var_9[var_11] delete();

        return;
    }

    common_scripts\utility::flag_wait( "alley_enemies_spawn" );
    var_6 thread door_breach_guy_leaves( "right_leave_node" );
    var_7 thread door_breach_guy_leaves( "left_leave_node" );
}

door_breach_guy_leaves( var_0 )
{
    self endon( "death" );
    var_1 = getnode( var_0, "targetname" );
    self setgoalnode( var_1 );
    maps\_utility::add_wait( maps\_utility::waittill_player_lookat );
    maps\_utility::add_wait( common_scripts\utility::flag_wait, "player_enters_laundrymat" );
    maps\_utility::do_wait_any();
    wait(randomfloat( 2 ));
    maps\_utility::set_force_color( "g" );
    self.ignoreall = 1;
}

second_floor_waittill_breach( var_0 )
{
    maps\_utility::add_wait( maps\_utility::wait_for_targetname_trigger, "second_floor_door_breach_trigger" );
    maps\_utility::add_wait( common_scripts\utility::flag_wait, "player_enters_laundrymat" );

    for ( var_1 = 0; var_1 < var_0.size; var_1++ )
        var_0[var_1] maps\_utility::add_wait( maps\_utility::waittill_player_lookat_for_time, 0.3 );

    maps\_utility::do_wait_any();
}

waittill_player_not_looking( var_0 )
{
    for (;;)
    {
        if ( !maps\_utility::player_looking_at( var_0, 0.7 ) )
            break;

        wait 0.1;
    }
}

update_obj_on_dropped_jav( var_0 )
{
    level endon( "overpass_baddies_flee" );
    common_scripts\utility::flag_assert( "overpass_baddies_flee" );

    for (;;)
    {
        var_1 = getentarray( "weapon_javelin", "classname" );

        if ( !var_1.size )
        {
            wait 0.05;
            continue;
        }

        var_2 = var_1[0];
        var_2 thread maps\_utility::add_jav_glow( "overpass_baddies_flee" );
        objective_position( 4, var_2.origin );

        for (;;)
        {
            var_1 = getentarray( "weapon_javelin", "classname" );

            if ( !var_1.size )
                break;

            wait 0.05;
        }

        objective_position( 4, var_0 );
    }
}

wait_for_fence_guys_to_be_drafted()
{
    if ( !isdefined( level.fence_guys ) )
        level.fence_guys = [];

    if ( level.fence_guys.size >= 2 )
        return;

    level notify( "drafting_fence_guys" );
    level endon( "drafting_fence_guys" );

    for (;;)
    {
        var_0 = getaiarray( "allies" );
        var_0 = maps\_utility::remove_heroes_from_array( var_0 );

        if ( !var_0.size )
        {
            wait 0.5;
            continue;
        }

        var_1 = var_0[0];
        var_1 thread maps\_utility::magic_bullet_shield();
        var_1 maps\_utility::make_hero();
        var_1 maps\_utility::set_force_color( "r" );
        var_1.fence_guy = 1;
        level.fence_guys[level.fence_guys.size] = var_1;

        if ( level.fence_guys.size >= 2 )
            break;
    }
}

disable_nvg()
{
    common_scripts\utility::flag_wait( "player_enters_laundrymat" );
    wait 4.0;
    level.player maps\_utility::display_hint( "disable_nvg" );
}

update_apartment_objective_position()
{
    self waittill( "trigger" );
    var_0 = getent( self.target, "targetname" );
    objective_position( 2, var_0.origin );
}
