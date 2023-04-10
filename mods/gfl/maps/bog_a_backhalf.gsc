// H1 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

bog_backhalf_shell()
{

}

force_spawn()
{
    self stalingradspawn();
}

bog_backhalf_init()
{
    level.tankexplosion_fx = loadfx( "fx/explosions/javelin_explosion" );
    level.abrams = getent( "abrams", "targetname" );
    level.abrams.godmode = 1;
    level.abrams.forwardent = spawn( "script_origin", level.abrams gettagorigin( "tag_flash" ) );
    level.abrams.forwardent linkto( level.abrams );
    var_0 = getent( "abrams_top_clip", "targetname" );
    var_0 linkto( level.abrams, "tag_turret", ( -30.0, 0.0, 10.0 ), var_0.angles - level.abrams gettagangles( "tag_turret" ) + ( 0.0, 7.0, 0.0 ) );
    level.zpu = getent( "zpu", "targetname" );
    level.tankdefenderpop = 0;
    level.tankatkdead = 0;
    level.totalcount = 0;
    level.tankdefensefailsafetime = 900;
    level.encroacherinit = 3;
    level.encroacherdiv = 3;
    level.zpublastradius = 384;
    level.playeristargeted = 0;
    common_scripts\utility::flag_init( "tankoverrun" );
    common_scripts\utility::flag_init( "zpu_speech_started" );
    common_scripts\utility::flag_init( "zpu_orders_given" );
    common_scripts\utility::flag_init( "zpus_destroyed" );
    common_scripts\utility::flag_init( "activate_final_bldg" );
    common_scripts\utility::flag_init( "lower_health_of_tank_defense_stragglers" );
    common_scripts\utility::flag_init( "beacon_orders" );
    common_scripts\utility::flag_init( "beacon_planted" );
    common_scripts\utility::flag_init( "final_bldg_fired_upon" );
    common_scripts\utility::flag_init( "pilot_final_dialogue" );
    common_scripts\utility::flag_init( "cobra_success" );
    common_scripts\utility::flag_init( "reached_ending_area" );
    common_scripts\utility::flag_init( "ending_final_positions" );
    common_scripts\utility::flag_init( "clipped_off_dest" );
    level.c4_sound_override = 1;
    level.tankencroachsteps = 3;
    level.tankencroachinitradius = 1600;
    level.tankencroachrate = 0.8;
    level.tankencroachpausetime = 7;
    level.defensesuccessratio = 0.87;
    level.beacon = getent( "beacon", "targetname" );
    level.beacon.origin += ( 0.0, 0.0, 2.85 );
    thread maps\_utility::do_in_order( common_scripts\utility::flag_wait, "final_bldg_fired_upon", maps\_spawner::kill_spawnernum, 1008 );
    common_scripts\utility::array_thread( getentarray( "tank_defender", "script_noteworthy" ), maps\_utility::add_spawn_function, ::tank_defender_spawn_setup );
    common_scripts\utility::array_thread( getentarray( "tank_defender", "script_noteworthy" ), maps\_utility::add_spawn_function, maps\_utility::replace_on_death );
    common_scripts\utility::array_thread( getentarray( "tank_attack_enemy", "script_noteworthy" ), maps\_utility::add_spawn_function, ::enemy_infantry_spawn_setup );
    common_scripts\utility::array_thread( getentarray( "tank_attack_enemy", "script_noteworthy" ), maps\_utility::add_spawn_function, ::tank_attack_death_tally );
}

start_bog_backhalf()
{
    common_scripts\utility::flag_set( "tank_defense_activate" );
    thread objectives();
    thread bog_a_backhalf_autosaves();
    level.abrams thread tank_setup();
    level.abrams thread tank_turret_slewing();
    thread temp_friendly_boost();
    thread tank_defense_flares();
    thread tank_defender_deathmonitor();
    thread tank_defense_enforcement();
    thread tank_defense_victory_check();
    thread tank_defense_killspawner_check();
    thread zpu_battle_init();
    thread zpu_c4();
    thread zpu_dialogue();
    thread cobra_bldg_activate();
    thread cobra_bldg_mg();
    thread cobra_sequence();
    thread dialogue();
    var_0 = getent( "badplace_fires", "targetname" );
    badplace_cylinder( "hill_fires", -1, var_0.origin, var_0.radius, var_0.height, "allies" );
}

start_zpu()
{
    soundscripts\_snd::snd_message( "start_zpu_checkpoint" );
    common_scripts\utility::flag_set( "zpu_orders_given" );
    var_0 = getent( "zpu_player_org", "targetname" );
    level.player setorigin( var_0.origin );
    level.player setplayerangles( var_0.angles );
    thread objectives();
    thread bog_a_backhalf_autosaves();
    level.abrams thread tank_setup();
    thread temp_friendly_boost();
    thread zpu_battle_init();
    thread zpu_c4();
    thread zpu_dialogue();
    thread cobra_bldg_activate();
    thread cobra_bldg_mg();
    thread cobra_sequence();
    thread dialogue();
    wait 0.1;
    maps\_utility::activate_trigger_with_noteworthy( "zpu_trigger" );
}

start_cobras()
{
    soundscripts\_snd::snd_message( "start_cobra_checkpoint" );
    common_scripts\utility::flag_set( "tank_defense_completed" );
    common_scripts\utility::flag_set( "final_bldg_activate" );
    common_scripts\utility::flag_set( "zpu_orders_given" );
    common_scripts\utility::flag_set( "zpus_destroyed" );
    thread cobra_bldg_activate();
    thread cobra_bldg_mg();
    thread start_cobras_pos();
    thread objectives();
    thread bog_a_backhalf_autosaves();
    level.abrams thread tank_setup();
    thread temp_friendly_boost();
    thread cobra_sequence();
    thread dialogue();
    wait 5;
    level.zpu delete();
}

start_cobras_pos()
{
    var_0 = getent( "start_cobras_player", "targetname" );
    level.player setorigin( var_0.origin );
    var_1 = getent( "start_cobras_price", "targetname" );
    level.price = getent( "price", "targetname" );
    level.price teleport( var_1.origin );
}

start_end()
{
    soundscripts\_snd::snd_message( "start_end_checkpoint" );
    level.player setplayerangles( ( 0.0, 80.0, 0.0 ) );
    level.player setorigin( ( 4968.0, 1528.0, -12320.0 ) );
    var_0 = getaiarray();
    common_scripts\utility::array_thread( var_0, maps\_utility::set_ignoreme, 1 );
    level.abrams thread tank_setup();
    var_1 = getentarray( "tank_defender", "script_noteworthy" );
    common_scripts\utility::array_thread( var_1, maps\_utility::self_delete );
    wait 0.05;
    level notify( "begin_sunrise_after_tank_defend", 1 );
    abrams_gets_drawing();
    level.price = getent( "price", "targetname" );
    var_2 = getent( "price_spawner", "targetname" );
    level.price teleport( var_2.origin );
    var_3 = getent( "mark_spawner", "targetname" ) stalingradspawn();
    level.mark = var_3;
    maps\_utility::spawn_failed( var_3 );
    maps\_utility::spawn_failed( level.price );
    level.price maps\_utility::make_hero();
    var_3 maps\_utility::make_hero();
    var_4 = getaiarray( "allies" );
    var_4 = maps\_utility::remove_heroes_from_array( var_4 );
    maps\_utility::array_delete( var_4 );
    var_5 = getentarray( "main_friendly_unit", "script_noteworthy" );
    common_scripts\utility::array_thread( var_5, ::force_spawn );
    waittillframeend;
    thread ending_sequence();
    wait 0.05;
    level.player setplayerangles( ( 0.0, 80.0, 0.0 ) );
    level.player setorigin( ( 4777.0, 1491.0, 20.0 ) );
}

temp_friendly_boost()
{
    var_0 = getaiarray( "allies" );
    var_0 = maps\_utility::remove_heroes_from_array( var_0 );

    for ( var_1 = 0; var_1 < var_0.size; var_1++ )
    {
        var_2 = var_0[var_1];
        var_2.ignoresuppression = 1;
        var_2.health = 1000;
    }
}

tank_defense_flares()
{
    level endon( "tank_defense_completed" );
    level waittill( "detpack_rush_flare" );
    wait 10;
    maps\_flare::flare_from_targetname( "flare1" );
    wait 12;
    maps\_flare::flare_from_targetname( "flare2" );
    wait 14;
    maps\_flare::flare_from_targetname( "flare1" );
    wait 8;
    maps\_flare::flare_from_targetname( "flare2" );
    wait 18;
    maps\_flare::flare_from_targetname( "flare1" );
    wait 20;
    maps\_flare::flare_from_targetname( "flare1" );
    wait 7;
    maps\_flare::flare_from_targetname( "flare2" );
    wait 14;
    maps\_flare::flare_from_targetname( "flare1" );
    wait 8;
    maps\_flare::flare_from_targetname( "flare2" );
    wait 18;
    maps\_flare::flare_from_targetname( "flare1" );
    wait 20;
    maps\_flare::flare_from_targetname( "flare1" );
    wait 7;
    maps\_flare::flare_from_targetname( "flare2" );
}

tank_defender_spawn_setup()
{
    level.tankdefenderpop++;
    self.ignoresuppression = 1;
    self.health = 1000;
    thread tank_defender_deathnotify();
}

tank_defender_deathnotify()
{
    self waittill( "death" );
    level.tankdefenderpop--;
}

tank_defender_deathmonitor()
{
    var_0 = getent( "tank_battle_spawner", "targetname" );
    var_0 waittill( "trigger" );
    wait 10;
    level notify( "detpack_rush_flare" );
    maps\_utility::radio_dialogue_queue( "movingindetpacks" );
}

tank_defense_victory_check()
{
    var_0 = [];
    var_1 = [];
    var_1 = getspawnerteamarray( "axis" );

    for ( var_2 = 0; var_2 < var_1.size; var_2++ )
    {
        var_3 = var_1[var_2];

        if ( !isdefined( var_3.script_noteworthy ) )
            continue;

        if ( var_3.script_noteworthy == "tank_attack_enemy" )
            var_0[var_0.size] = var_3;
    }

    var_4 = 0;
    var_5 = 0;

    for ( var_6 = 0; var_6 < var_0.size; var_6++ )
    {
        if ( !isdefined( var_0[var_6].count ) )
            var_7 = 1;
        else
            var_7 = var_0[var_6].count;

        level.totalcount += var_7;
    }

    while ( !common_scripts\utility::flag( "tank_defense_completed" ) )
    {
        var_8 = level.tankatkdead / level.totalcount;

        if ( var_8 >= level.defensesuccessratio )
        {
            common_scripts\utility::flag_set( "tank_defense_completed" );
            thread tank_defense_stragglers();
            break;
        }

        var_5 = 0;
        wait 2;
    }
}

tank_defense_killspawner_check()
{
    var_0 = [];
    var_1 = getentarray( "tank_attack_killspawner", "targetname" );

    for ( var_2 = 0; var_2 < var_1.size; var_2++ )
        var_1[var_2] thread tank_defense_killspawner_monitor();
}

tank_defense_killspawner_monitor()
{
    level endon( "tank_defense_completed" );
    var_0 = [];
    var_1 = 0;
    var_2 = getspawnerteamarray( "axis" );

    for ( var_3 = 0; var_3 < var_2.size; var_3++ )
    {
        if ( !isdefined( var_2[var_3].script_killspawner ) )
            continue;

        if ( var_2[var_3].script_killspawner == self.script_killspawner )
            var_0[var_0.size] = var_2[var_3];
    }

    for ( var_3 = 0; var_3 < var_0.size; var_3++ )
    {
        if ( !isdefined( var_0[var_3].count ) )
            var_4 = 1;
        else
            var_4 = var_0[var_3].count;

        var_1 += var_4;
    }

    self waittill( "trigger" );
    level.totalcount -= var_1;

    if ( level.totalcount <= 0 )
        level.totalcount = 1;
}

bog_a_backhalf_autosaves()
{
    common_scripts\utility::flag_wait( "tank_defense_completed" );
    maps\_utility::autosave_by_name( "tank_defense_finished" );

    if ( !common_scripts\utility::flag( "zpus_destroyed" ) )
    {
        var_0 = getent( "zpuMidSaveTrig", "targetname" );
        var_0 waittill( "trigger" );
        maps\_utility::autosave_by_name( "zpu_midpoint_approach" );
        var_1 = getent( "zpu_autosave", "targetname" );
        var_1 waittill( "trigger" );
        maps\_utility::autosave_by_name( "zpu_dont_blow_yourself_up" );
    }

    common_scripts\utility::flag_wait( "zpus_destroyed" );
    maps\_utility::autosave_by_name( "airstrike_begin" );
}

tank_defense_stragglers()
{
    var_0 = getentarray( "tank_attack_killspawner", "targetname" );
    common_scripts\utility::array_thread( var_0, maps\_utility::activate_trigger );
    common_scripts\utility::flag_set( "lower_health_of_tank_defense_stragglers" );
}

tank_attack_death_tally()
{
    self waittill( "death" );
    level.tankatkdead++;
}

enemy_infantry_spawn_setup()
{
    self endon( "death" );
    self waittill( "reached_path_end" );
    thread enemy_infantry_tank_encroach();
    common_scripts\utility::flag_wait( "lower_health_of_tank_defense_stragglers" );
    self.health = 5;
}

enemy_infantry_tank_encroach()
{
    self endon( "death" );
    level endon( "tank_defense_completed" );
    level endon( "suicide_bomber_reached_tank" );
    enemy_tank_encroach_mvmt();
    var_0 = level.encroacherinit % level.encroacherdiv;
    level.encroacherinit++;

    if ( !var_0 )
    {
        self.goalradius = 64;
        self.pathenemyfightdist = 512;
        self.pathenemylookahead = 512;
        self waittill( "goal" );

        if ( !common_scripts\utility::flag( "tank_defense_completed" ) )
        {
            thread tank_destruction();
            waittillframeend;
            level notify( "suicide_bomber_reached_tank" );
        }
        else
        {
            self.goalradius = 1000;
            self setgoalentity( level.player );
        }
    }
}

enemy_tank_encroach_mvmt()
{
    self endon( "death" );
    var_0 = getnode( "tank_suicide_bomb_dest", "targetname" );
    self setgoalnode( var_0 );
    self.goalradius = level.tankencroachinitradius;
    self.pathenemyfightdist = 96;
    self.pathenemylookahead = 512;

    for ( var_1 = 0; var_1 < level.tankencroachsteps; var_1++ )
    {
        wait(level.tankencroachpausetime);
        self.goalradius *= level.tankencroachrate;
    }
}

objectives()
{
    objective_add( 1, "active", &"BOG_A_SECURE_THE_M1A1_ABRAMS", ( 4800.0, 1488.0, 32.0 ) );
    objective_add( 5, "active", &"BOG_A_INTERCEPT_THE_ENEMY_BEFORE", ( 4800.0, 1488.0, 32.0 ) );
    objective_indentlevel( 5, 1 );
    objective_current( 5 );
    common_scripts\utility::flag_wait( "tank_defense_completed" );
    common_scripts\utility::flag_clear( "aa_bog" );
    common_scripts\utility::flag_wait( "zpu_orders_given" );
    common_scripts\utility::flag_init( "aa_zpu" );
    common_scripts\utility::flag_set( "aa_zpu" );
    objective_state( 5, "done" );
    maps\_utility::arcademode_checkpoint( 4.5, "d" );
    objective_add( 6, "active", &"BOG_A_DESTROY_THE_ZPU_ANTI", level.zpu.origin );
    objective_indentlevel( 6, 1 );
    objective_current( 6 );
    common_scripts\utility::flag_wait( "zpus_destroyed" );
    common_scripts\utility::flag_clear( "aa_zpu" );
    objective_state( 6, "done" );
    var_0 = getent( "southern_area_objective", "targetname" );
    objective_add( 7, "active", &"BOG_A_SECURE_THE_SOUTHERN_SECTOR", var_0.origin );
    objective_indentlevel( 7, 1 );
    objective_current( 7 );
    common_scripts\utility::flag_wait( "beacon_orders" );
    objective_add( 7, "active", &"BOG_A_PLANT_THE_IR_BEACON_TO", level.beacon.origin );
    objective_indentlevel( 7, 1 );
    var_1 = spawnfx( common_scripts\utility::getfx( "beacon_glow" ), level.beacon.origin );
    triggerfx( var_1 );
    objective_current( 7 );
    maps\_utility::arcademode_checkpoint( 1.5, "e" );
    common_scripts\utility::flag_wait( "beacon_planted" );
    var_1 delete();
    maps\_utility::arcademode_checkpoint( 3, "f" );
    objective_delete( 7 );
    objective_add( 7, "active", &"BOG_A_WAIT_FOR_AIR_SUPPORT" );
    objective_indentlevel( 7, 1 );
    objective_current( 7 );
    common_scripts\utility::flag_wait( "cobra_success" );
    objective_state( 7, "done" );
    objective_state( 1, "done" );
    var_2 = ( 5099.6, 1602.45, -6.36579 );
    objective_add( 9, "active", &"BOG_A_REGROUP_WITH_THE_SQUAD", var_2 );
    objective_current( 9 );
    common_scripts\utility::flag_wait( "reached_ending_area" );
    objective_state( 9, "done" );
}

cobra_bldg_activate()
{
    common_scripts\utility::flag_wait( "activate_final_bldg" );
    var_0 = getentarray( "trigger_multiple", "classname" );

    foreach ( var_2 in var_0 )
    {
        if ( isdefined( var_2.script_linkname ) && issubstr( var_2.script_linkname, "post_zpu_final_bldg_spawn" ) )
            var_2 notify( "trigger" );
    }
}

cobra_bldg_mg()
{
    common_scripts\utility::flag_wait( "activate_final_bldg" );
    var_0 = getentarray( "backhalf_manual_mg", "targetname" );
    common_scripts\utility::array_thread( var_0, ::backhalf_mg_setmode, "manual" );
    common_scripts\utility::array_thread( var_0, ::cobra_bldg_mg_targeting );
    common_scripts\utility::array_thread( var_0, ::cobra_bldg_mg_cleanup );
}

cobra_bldg_mg_targeting()
{
    level endon( "final_bldg_fired_upon" );
    var_0 = getentarray( self.target, "targetname" );
    thread backhalf_manual_mg_fire();
    var_1 = 0;

    for (;;)
    {
        var_2 = common_scripts\utility::random( var_0 );
        wait(randomfloatrange( 1, 2 ));

        if ( var_1 > 6 && !common_scripts\utility::flag( "beacon_planted" ) && !level.playeristargeted )
        {
            level.playeristargeted = 1;
            self settargetentity( level.player );
            var_1 = 0;
        }
        else
            self settargetentity( var_2 );

        wait(randomfloatrange( 1, 5 ));
        level.playeristargeted = 0;
        var_1++;
    }
}

backhalf_mg_setmode( var_0 )
{
    self setmode( var_0 );
}

backhalf_manual_mg_fire()
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

cobra_bldg_mg_cleanup()
{
    thread maps\_utility::do_in_order( common_scripts\utility::flag_wait, "final_bldg_fired_upon", maps\_utility::send_notify, "stop_firing" );
    common_scripts\utility::flag_wait( "final_bldg_fired_upon" );
    self delete();
}

cobra_sequence()
{
    common_scripts\utility::flag_wait( "zpus_destroyed" );
    soundscripts\_snd::snd_message( "start_cobra_arrival_scripted_sfx" );
    wait 6;
    level.price maps\_anim::anim_single_queue( level.price, "plantbeacon" );
    thread cobra_sequence_reminder();
    common_scripts\utility::flag_set( "beacon_orders" );
    var_0 = spawn( "script_model", level.beacon.origin + ( 0.0, 0.0, -3.0 ) );
    var_0 setmodel( "com_night_beacon_obj" );
    common_scripts\utility::flag_set( "beacon_ready_to_use" );
    var_1 = getent( "beaconTrig", "targetname" );
    var_1 sethintstring( &"SCRIPT_PLATFORM_HINT_PLANTBEACON" );
    var_1 waittill( "trigger" );
    level.player thread maps\_utility::play_sound_on_entity( "scn_bog_a_beacon_plant" );
    var_1 delete();
    var_0 setmodel( "com_night_beacon" );
    common_scripts\utility::flag_set( "beacon_planted" );
    soundscripts\_snd::snd_message( "start_cobra_support_mix" );
    var_2 = maps\_vehicle::spawn_vehicle_from_targetname( "cobra1" );
    var_3 = maps\_vehicle::spawn_vehicle_from_targetname( "cobra2" );
    var_2 thread maps\_vehicle::mgon();
    var_3 thread maps\_vehicle::mgon();
    var_2 thread cobra_flightplan();
    var_3 thread cobra_flightplan( 1 );
    musicstop( 1.9 );
    wait 2;
    maps\_utility::musicplaywrapper( "bog_a_victory" );
    wait 1;
    maps\_utility::radio_dialogue_queue( "cominhot" );
    wait 2;
    maps\_utility::radio_dialogue_queue( "standby" );
}

cobra_sequence_reminder()
{
    level endon( "beacon_planted" );
    var_0 = 0;

    for (;;)
    {
        wait 40;

        if ( var_0 == 0 )
            maps\_utility::radio_dialogue_queue( "buttonedup" );
        else if ( var_0 == 1 )
            maps\_utility::radio_dialogue_queue( "whereistheairsupport" );
        else if ( var_0 == 2 )
            maps\_utility::radio_dialogue_queue( "canttakebuilding" );
        else if ( var_0 == 3 )
            maps\_utility::radio_dialogue_queue( "rippingusapart" );
        else if ( var_0 == 4 )
        {
            maps\_utility::radio_dialogue_queue( "plantbeacon" );
            var_0 = 0;
        }

        var_0++;
    }
}

cobra_flightplan( var_0 )
{
    var_1 = 50;
    var_2 = 25;
    self vehicle_setspeed( var_1, 50 );
    self setyawspeed( 45, var_2 );
    self setmaxpitchroll( 25, 50 );
    self sethoverparams( 128 );
    var_3 = undefined;

    if ( isdefined( self.target ) )
        var_3 = getent( self.target, "targetname" );
    else
    {

    }

    var_4 = [];

    while ( isdefined( var_3 ) )
    {
        var_4[var_4.size] = var_3;

        if ( isdefined( var_3.target ) )
        {
            var_3 = getent( var_3.target, "targetname" );
            continue;
        }

        break;
    }

    self playrumblelooponentity( "heli_loop" );
    var_5 = 0;
    var_6 = "alpha";
    var_7 = 256;
    var_8 = 20;
    var_9 = 20;

    for ( var_10 = 0; var_10 < var_4.size; var_10++ )
    {
        var_11 = 0;
        var_12 = var_4[var_10];

        if ( isdefined( var_12.radius ) )
            var_7 = var_12.radius;

        self setneargoalnotifydist( var_7 );

        if ( isdefined( var_12.script_engagedelay ) )
            var_11 = var_12.script_engagedelay;

        if ( isdefined( var_12.script_attackpattern ) )
            var_6 = var_12.script_attackpattern;

        if ( isdefined( var_12.script_engage ) )
            thread cobra_fire( var_11, var_6 );

        if ( isdefined( var_12.script_airspeed ) )
            var_1 = var_12.script_airspeed;

        if ( isdefined( var_12.script_accel ) )
            var_8 = var_12.script_accel;

        if ( isdefined( var_12.script_decel ) )
            self vehicle_setspeed( var_1, var_8, var_12.script_decel );
        else
            self vehicle_setspeed( var_1, var_8 );

        if ( isdefined( var_12.script_yawspeed ) )
            self setyawspeed( var_12.script_yawspeed, var_2 );

        if ( isdefined( var_12.script_forceyaw ) )
            self settargetyaw( var_12.angles[1] );

        if ( isdefined( var_12.script_cleartargetyaw ) )
            self cleartargetyaw();

        var_13 = 0;

        if ( isdefined( var_4[var_10].script_stopnode ) )
            var_13 = var_4[var_10].script_stopnode;

        maps\bog_a_aud::handle_cobra_waypoint_audio( var_12 );
        self setvehgoalpos( var_4[var_10].origin, var_13 );
        self waittill( "near_goal" );

        if ( var_13 )
        {
            if ( isdefined( var_0 ) && var_0 )
            {
                thread cobra_fire( 0, "alpha" );
                thread cobra_fire( 2, "gamma" );
                thread cobra_fire( 4, "delta" );
                thread cobra_fire( 7.5, "zeta" );
            }

            level common_scripts\utility::flag_wait( "cobra_missiles_done" );
            thread maps\_vehicle::mgoff();
            wait 3.75;
            level common_scripts\utility::flag_set( "pilot_final_dialogue" );
            wait 7.35;

            if ( isdefined( var_0 ) && var_0 )
                wait 1.25;
        }
    }

    self.script_disablevehicleaudio = 1;
    self stoprumble( "heli_loop" );
}

cobra_fire( var_0, var_1 )
{
    wait(var_0);

    switch ( var_1 )
    {
        case "alpha":
            common_scripts\_exploder::exploder( 500 );
            var_2 = getent( "ffar_1001", "targetname" );
            maps\_helicopter_globals::fire_missile( "ffar_bog_a_lite", 1, var_2 );
            thread cobra_missile_fired_earthquake();
            thread cobra_building_damage_fx( 1001 );
            var_3 = getentarray( "finalBldgKillSpawn", "targetname" );

            for ( var_4 = 0; var_4 < var_3.size; var_4++ )
            {
                var_5 = var_3[var_4];
                var_5 notify( "trigger" );
            }

            var_6 = [];
            var_6 = getentarray( "finalBldgGuys", "script_noteworthy" );

            for ( var_4 = 0; var_4 < var_6.size / 2; var_4++ )
            {
                var_7 = var_6[var_4];
                var_7 kill();
            }

            wait 0.5;
            common_scripts\utility::flag_set( "final_bldg_fired_upon" );
            var_2 = getent( "ffar_1002", "targetname" );
            maps\_helicopter_globals::fire_missile( "ffar_bog_a_lite", 2, var_2 );
            thread cobra_missile_fired_earthquake( 1 );
            thread cobra_building_damage_fx( 1002 );
            var_2 = getent( "ffar_1003", "targetname" );
            maps\_helicopter_globals::fire_missile( "ffar_bog_a_lite", 2, var_2 );
            thread cobra_missile_fired_earthquake( 1 );
            thread cobra_building_damage_fx( 1003 );

            if ( !common_scripts\utility::flag( "clipped_off_dest" ) )
                common_scripts\utility::flag_set( "clipped_off_dest" );

            break;
        case "gamma":
            var_2 = getent( "ffar_1008", "targetname" );
            maps\_helicopter_globals::fire_missile( "ffar_bog_a_lite", 2, var_2 );
            thread cobra_missile_fired_earthquake( 1 );
            thread cobra_building_damage_fx( 1008 );
            break;
        case "delta":
            var_2 = getent( "ffar_1000", "targetname" );
            maps\_helicopter_globals::fire_missile( "ffar_bog_a_lite", 2, var_2 );
            thread cobra_missile_fired_earthquake( 1 );
            thread cobra_building_damage_fx( 1000 );
            wait 2;
            var_2 = getent( "ffar_1004", "targetname" );
            maps\_helicopter_globals::fire_missile( "ffar_bog_a_lite", 1, var_2 );
            thread cobra_missile_fired_earthquake();
            thread cobra_building_damage_fx( 1004 );
            wait 2;
            var_2 = getent( "ffar_1005", "targetname" );
            maps\_helicopter_globals::fire_missile( "ffar_bog_a_lite", 1, var_2 );
            thread cobra_missile_fired_earthquake();
            thread cobra_building_damage_fx( 1005 );
            break;
        case "zeta":
            var_2 = getent( "ffar_1007", "targetname" );
            maps\_helicopter_globals::fire_missile( "ffar_bog_a_lite", 2, var_2 );
            thread cobra_missile_fired_earthquake( 1 );
            thread cobra_building_damage_fx( 1007 );
            wait 3;
            var_2 = getent( "ffar_1006", "targetname" );
            maps\_helicopter_globals::fire_missile( "ffar_bog_a_lite", 2, var_2 );
            thread cobra_missile_fired_earthquake( 1 );
            thread cobra_building_damage_fx( 1006 );
            level common_scripts\utility::flag_set( "cobra_missiles_done" );
            break;
    }
}

cobra_building_damage_fx( var_0 )
{
    wait 0.2;
    common_scripts\_exploder::exploder( var_0 );
}

cobra_missile_fired_earthquake( var_0 )
{
    earthquake( 0.3, 1.0, self.origin, 4000 );

    if ( isdefined( var_0 ) && var_0 == 1 )
        level.player playrumbleonentity( "generic_attack_heavy_500" );
    else
        level.player playrumbleonentity( "generic_attack_medium_500" );
}

tank_defense_enforcement()
{
    var_0 = getent( "tank_defense_warning", "targetname" );
    var_1 = getent( "tank_defense_failed", "targetname" );
    var_0 thread tank_defense_warning();
    var_1 thread tank_defense_failure();
}

tank_defense_warning()
{
    level endon( "zpu_speech_started" );
    level endon( "tank_was_overrun" );
    level endon( "tank_defense_completed" );
    var_0 = 0;
    var_1 = 0;

    while ( !common_scripts\utility::flag( "zpu_speech_started" ) )
    {
        self waittill( "trigger" );

        switch ( var_0 )
        {
            case 0:
                maps\_utility::radio_dialogue_queue( "dangeroverrun" );
                break;
            case 1:
                maps\_utility::radio_dialogue_queue( "jacksonawol" );
                break;
            case 2:
                maps\_utility::radio_dialogue_queue( "fallbacktank" );
                break;
        }

        wait 20;
        var_0++;

        if ( var_0 > 2 )
        {
            var_0 = 0;
            var_1++;
        }

        if ( var_1 == 2 )
            thread tank_destruction();
    }
}

tank_defense_failure()
{
    level endon( "zpu_speech_started" );
    level endon( "tank_defense_completed" );
    self waittill( "trigger" );
    thread tank_destruction();
}

tank_setup()
{
    var_0 = getvehiclenode( self.target, "targetname" );
    self attachpath( var_0 );
    self startpath();
}

tank_turret_slewing()
{
    level endon( "abrams_stop_slewing_turret" );
    self endon( "death" );
    var_0 = [];
    var_0 = getentarray( "abrams_targetref", "targetname" );
    var_1 = randomint( var_0.size );
    var_2 = var_1 + 1;
    var_3 = 0;

    for (;;)
    {
        if ( var_1 == var_2 )
        {
            wait 1;
            var_1 = randomint( var_0.size );
            continue;
        }
        else
        {
            self setturrettargetent( var_0[var_1] );
            self waittill( "turret_on_target" );
            wait(randomfloatrange( 1, 2 ));
            var_3++;

            if ( var_3 == 2 )
            {
                wait(randomfloatrange( 3, 5 ));
                var_3 = 0;
            }
        }

        var_2 = var_1;
        var_1 = randomint( var_0.size );
    }
}

tank_destruction()
{
    level endon( "tank_defense_completed" );
    level notify( "tank_was_overrun" );
    thread tank_missionfailure();
    common_scripts\utility::play_sound_in_space( "generic_meleecharge_arab_6", level.abrams.origin );
    level.player playsound( "explo_mine" );
    playfx( level.tankexplosion_fx, level.abrams.origin );
    earthquake( 0.5, 2, level.player.origin, 1250 );
    radiusdamage( level.abrams.origin, 512, 100500, 100500 );
}

tank_missionfailure()
{
    soundscripts\_snd::snd_message( "start_tank_mission_failure" );
    wait 2.25;
    setdvar( "ui_deadquote", &"BOG_A_THE_TANK_WAS_OVERRUN" );
    maps\_utility::missionfailedwrapper();
}

zpu_battle_init()
{
    common_scripts\utility::flag_wait( "zpu_orders_given" );
    common_scripts\utility::flag_set( "zpu_battle_started" );
    thread zpu_battle_friendly_advance();
    var_0 = getnode( "zpu_badplace", "targetname" );
    badplace_cylinder( "zpuNoAllies", -1, var_0.origin, var_0.radius, var_0.height, "allies" );
    var_1 = getent( "zpu_battle_seed", "targetname" );
    wait 2;
    var_1 notify( "trigger" );
}

zpu_battle_friendly_advance()
{
    var_0 = getentarray( "zpu_friendly_advance_trigger", "script_noteworthy" );

    for ( var_1 = 0; var_1 < var_0.size; var_1++ )
        var_0[var_1] thread zpu_battle_trigger_control();
}

zpu_battle_trigger_control()
{
    self endon( "deleted" );
    self waittill( "trigger" );
    var_0 = [];
    var_1 = undefined;

    if ( isdefined( self.target ) )
        var_1 = getent( self.target, "targetname" );

    while ( isdefined( var_1 ) )
    {
        var_0[var_0.size] = var_1;

        if ( isdefined( var_1.target ) )
        {
            var_1 = getent( var_1.target, "targetname" );
            continue;
        }

        break;
    }

    for ( var_2 = 0; var_2 < var_0.size; var_2++ )
    {
        var_3 = var_0[var_2];
        var_3 notify( "deleted" );
        var_3 delete();
    }
}

zpu_c4()
{
    var_0 = getent( "zpu", "targetname" );
    var_0 maps\_c4::c4_location( "tag_c4", ( 0.0, 0.0, 0.0 ), ( 0.0, 0.0, 0.0 ) );
    var_0 waittill( "c4_detonation" );
    var_0 notify( "death" );
    playfx( level.tankexplosion_fx, var_0.origin );
    thread common_scripts\utility::play_sound_in_space( "bog_aagun_explode", var_0.origin );
    var_0 setmodel( "vehicle_zpu4_burn" );
    radiusdamage( var_0.origin + ( 0.0, 0.0, 96.0 ), level.zpublastradius, 1000, 50 );
    maps\_utility::arcademode_kill( var_0.origin, "explosive", 2000 );
    common_scripts\utility::flag_set( "zpus_destroyed" );
    abrams_gets_drawing();
}

zpu_dialogue()
{
    var_0 = getent( "plantc4_dialogue", "targetname" );
    var_0 waittill( "trigger" );
    common_scripts\utility::flag_set( "activate_final_bldg" );
    var_1 = getnode( "zpuTalkingFriendly", "targetname" );
    var_2 = getaiarray( "allies" );
    var_2 = maps\_utility::remove_heroes_from_array( var_2 );
    var_3 = common_scripts\utility::getclosest( var_1.origin, var_2 );
    var_3 thread maps\_utility::magic_bullet_shield();
    var_3.animname = "marine";
    var_3 thread maps\_anim::anim_single_queue( var_3, "plantc4" );
    level waittill( "c4_in_place" );
    thread zpu_interface();
    maps\_utility::autosave_by_name( "zpu_c4_planted" );
    var_3 maps\_anim::anim_single_queue( var_3, "goodjob" );
    var_4 = getent( "zpu", "targetname" );
    var_5 = length( level.player.origin - var_4.origin );

    while ( var_5 <= level.zpublastradius * 1.05 )
    {
        var_5 = length( level.player.origin - var_4.origin );
        wait 0.05;
    }

    if ( !common_scripts\utility::flag( "zpus_destroyed" ) )
        var_3 maps\_anim::anim_single_queue( var_3, "jacksondoit" );

    var_3 maps\_utility::stop_magic_bullet_shield();
}

dont_show_c4_hint()
{
    if ( common_scripts\utility::flag( "zpus_destroyed" ) )
        return 0;

    var_0 = self getcurrentweapon();
    return var_0 == "c4";
}

zpu_interface()
{
    level endon( "zpus_destroyed" );
    wait 2;
    level.player thread maps\_utility::display_hint( "c4_use" );
}

dialogue()
{
    if ( !common_scripts\utility::flag( "tank_defense_completed" ) )
    {
        thread dialogue_south_tank_attack();
        var_0 = getent( "backhalf_dialogue", "targetname" );
        var_0 waittill( "trigger" );
        maps\_utility::radio_dialogue_queue( "alphasixstatus" );
        maps\_utility::battlechatter_on( "allies" );
        maps\_utility::battlechatter_on( "axis" );
        maps\_utility::radio_dialogue_queue( "stillsurrounded" );
        maps\_utility::radio_dialogue_queue( "maingunsoffline" );
    }

    common_scripts\utility::flag_wait( "tank_defense_completed" );

    if ( !common_scripts\utility::flag( "zpus_destroyed" ) )
    {
        thread zpu_player_followers();
        maps\_utility::radio_dialogue_queue( "morewest" );
        level.price maps\_anim::anim_single_queue( level.price, "twocharliebravosix" );
        common_scripts\utility::flag_set( "zpu_speech_started" );
        maps\_utility::radio_dialogue_queue( "negativebravo" );
        common_scripts\utility::flag_set( "zpu_orders_given" );

        if ( !common_scripts\utility::flag( "zpus_destroyed" ) )
            level.price maps\_anim::anim_single_queue( level.price, "jacksonfindzpu" );

        level.price maps\_anim::anim_single_queue( level.price, "securewest" );
        wait 2;
        level.scr_sound["price"]["letsmoveout"] = "bog_a_pri_letsmoveout";
    }

    common_scripts\utility::flag_wait( "pilot_final_dialogue" );
    soundscripts\_snd::snd_message( "set_bog_ambience_to_bog_end_ext0" );
    var_1 = getaiarray( "axis" );
    common_scripts\utility::array_thread( var_1, maps\_utility::die );
    var_2 = getspawnerteamarray( "axis" );
    common_scripts\utility::array_thread( var_2, maps\_utility::self_delete );
    maps\_utility::radio_dialogue_queue( "seeanyoneleft" );
    wait 0.5;
    maps\_utility::radio_dialogue_queue( "negative" );
    wait 0.3;
    maps\_utility::radio_dialogue_queue( "alltargetsdestroyed" );
    level notify( "begin_sunrise_after_tank_defend", 90 );
    wait 3;
    level.price maps\_anim::anim_single_queue( level.price, "lzissecure" );
    wait 0.15;
    common_scripts\utility::flag_set( "cobra_success" );
    soundscripts\_snd::snd_message( "stop_cobra_support_mix" );
    thread ending_sequence();
    level notify( "abrams_stop_slewing_turret" );
    thread abrams_turn_straight();
    maps\_utility::radio_dialogue_queue( "goodworkout" );
    level.mark.animname = "left_guy";
    level.mark maps\_anim::anim_single_queue( level.mark, "regroupattank" );
}

abrams_gets_drawing()
{
    level.abrams setmodel( maps\_utility::getmodel( "tank_draw" ) );
    level.vtmodel = maps\_utility::getmodel( "tank_draw" );
    level.abrams maps\_vehicle::build_exhaust( "fx/distortion/abrams_exhaust" );
    level.abrams maps\_vehicle::build_deckdust( "fx/dust/abrams_deck_dust" );
}

abrams_turn_straight()
{
    level.abrams setturrettargetent( level.abrams.forwardent );
}

zpu_player_followers()
{
    thread maps\_utility::promote_nearest_friendly( "c", "p" );
    thread maps\_utility::promote_nearest_friendly( "c", "p" );
}

ending_sequence()
{
    level.price maps\_utility::make_hero();
    var_0 = getaiarray( "allies" );
    var_0 = maps\_utility::remove_heroes_from_array( var_0 );
    level.price.animname = "price";
    var_0[0].animname = "right_guy";
    level.mark.animname = "left_guy";
    var_1 = [];

    for ( var_2 = 1; var_2 < var_0.size; var_2++ )
        var_1[var_1.size] = var_0[var_2];

    thread schoolcircle( "schoolcircle", var_1 );
    var_3 = [];
    var_3[var_3.size] = level.price;
    var_3[var_3.size] = var_0[0];
    var_3[var_3.size] = level.mark;
    var_4 = spawn( "script_origin", ( 0.0, 0.0, 0.0 ) );
    var_4.origin = level.abrams.origin;
    var_4.angles = level.abrams.angles;
    var_4 maps\_anim::anim_teleport( var_3, "tank_talk" );
    var_4 maps\_anim::anim_reach_and_idle( var_3, "tank_talk", "tank_talk_idle", "stop_loop" );

    if ( getdvarint( "use_old_tank_dialogue" ) == 1 )
        var_5 = 220;
    else
        var_5 = 300;

    while ( distance( level.player.origin, var_4.origin ) > var_5 )
        wait 0.05;

    common_scripts\utility::flag_set( "reached_ending_area" );
    soundscripts\_snd::snd_message( "start_ending_area_mix" );
    var_4 notify( "stop_loop" );
    level.price thread new_goal_at_scene_end();

    if ( getdvarint( "use_old_tank_dialogue" ) == 1 )
    {
        var_4 thread maps\_anim::anim_single( var_3, "tank_talk" );
        wait 14.95;
    }
    else
    {
        var_6 = getanimlength( level.scr_anim[var_3[0].animname]["tank_talk"] );
        var_4 thread maps\_anim::anim_single( var_3, "tank_talk" );
        wait(var_6 - 1);
    }

    soundscripts\_snd::snd_message( "start_end_black_screen_mix" );
    maps\_utility::nextmission();
}

new_goal_at_scene_end()
{
    common_scripts\utility::waittillend( "single anim" );
    self setgoalpos( self.origin );
    self.goalradius = 0;
    self.walkdist = 15010;
}

dialogue_south_tank_attack()
{
    var_0 = undefined;
    var_1 = getentarray( "flood_spawner", "targetname" );

    for ( var_2 = 0; var_2 < var_1.size; var_2++ )
    {
        if ( !isdefined( var_1[var_2].script_noteworthy ) )
            continue;

        if ( var_1[var_2].script_noteworthy == "south_tank_attack_wave" )
        {
            var_0 = var_1[var_2];
            break;
        }
    }

    if ( isdefined( var_0 ) )
        var_0 waittill( "trigger" );

    wait 4;
    maps\_utility::radio_dialogue_queue( "contactseast" );
}

heroshield()
{
    var_0 = getentarray( "hero", "script_noteworthy" );
    common_scripts\utility::array_thread( var_0, maps\_utility::add_spawn_function, ::hero );
}

hero()
{
    thread maps\_utility::magic_bullet_shield();
    self.ignorerandombulletdamage = 1;
}

schoolcircle( var_0, var_1 )
{
    var_2 = getnodearray( var_0, "targetname" );

    for ( var_3 = 0; var_3 < var_1.size; var_3++ )
        var_1[var_3] thread schoolcircle_nav( var_2, var_3 );
}

schoolcircle_nav( var_0, var_1 )
{
    self endon( "death" );
    wait 2.5;
    self setgoalnode( var_0[var_1] );
    self.goalradius = 32;
    self.dontavoidplayer = 1;
    self allowedstances( "stand" );

    if ( !isdefined( var_0[var_1].script_noteworthy ) )
        return;

    if ( var_0[var_1].script_noteworthy == "kneel" )
        thread schoolcircle_crouch( self );
}

schoolcircle_crouch( var_0 )
{
    var_0 waittill( "goal" );
    var_0 allowedstances( "crouch" );
}
