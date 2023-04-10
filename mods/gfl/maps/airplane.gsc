// H1 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

dead_script()
{
    common_scripts\_ca_blockout::init();
    maps\airplane_fx::main();
    maps\airplane_anim::main();
    maps\airplane_precache::main();
    maps\createart\airplane_art::main();
    maps\_load::main();
    level thread maps\airplane_amb::main();
    maps\airplane_lighting::main();
    player_start();
}

player_start()
{
    var_0 = getent( "player_intro_start", "targetname" );
    level.player setorigin( var_0.origin );
    level.player setplayerangles( var_0.angles );
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

    setsaveddvar( "r_specularcolorscale", "1.2" );
    initprecache();

    if ( getdvar( "alt_music" ) == "" )
        setdvar( "alt_music", "0" );

    if ( getdvar( "airmasks" ) == "" )
        setdvar( "airmasks", "1" );

    if ( getdvar( "notimer" ) == "" )
        setdvar( "notimer", "0" );

    if ( getdvar( "airplane_debug" ) == "" )
        setdvar( "airplane_debug", "0" );

    setsaveddvar( "g_friendlyNameDist", 0 );

    if ( getdvar( "humanshield_magicbullet_shots" ) == "" )
        setdvar( "humanshield_magicbullet_shots", 4 );

    level.peoplespeaking = 0;
    level.firstaxiskilled = 0;
    level.timebetweenhostiledown = 5;
    level.hostiledownbeingspoken = 0;
    level.playergotheadshot = 0;
    level.sightdetectdistance = 512;
    level.alertdistance = 128;
    level.spawnercallbackthread = ::ai_think;
    level.dronecallbackthread = ::ai_drone_think;
    level.acolornodetriggers = [];
    var_0 = getentarray( "trigger_multiple", "classname" );

    for ( var_1 = 0; var_1 < var_0.size; var_1++ )
    {
        if ( isdefined( var_0[var_1].script_noteworthy ) && getsubstr( var_0[var_1].script_noteworthy, 0, 10 ) == "colornodes" )
            level.acolornodetriggers = common_scripts\utility::array_add( level.acolornodetriggers, var_0[var_1] );
    }

    maps\_utility::add_start( "breach", ::start_breach, &"STARTS_BREACH" );
    maps\_utility::add_start( "vip", ::start_vip, &"STARTS_VIP" );
    maps\_utility::add_start( "freefall", ::start_freefall, &"STARTS_FREEFALL" );
    maps\_utility::add_start( "demo", ::start_demo, &"STARTS_DEMO" );
    maps\_utility::default_start( ::start_default );
    thread no_grenade_death_hack();
    thread breach_compartment_setup();
    maps\createart\airplane_art::main();
    level thread maps\airplane_fx::main();
    maps\airplane_anim::main();
    level.weaponclipmodels = [];
    level.weaponclipmodels[0] = "weapon_m16_clip";
    level.weaponclipmodels[1] = "weapon_mp5_clip";
    level.weaponclipmodels[2] = "weapon_ak47_clip";
    thread common_scripts\_pipes::main();
    thread maps\_leak::main();
    maps\airplane_precache::main();
    maps\_load::main();
    level thread maps\airplane_amb::main();
    maps\airplane_lighting::main();
    maps\airplane_aud::main();

    if ( getdvar( "use_old_intro_fade_in" ) == "1" )
        thread intro_fade_in();
    else
        thread intro_fade_in_h1();

    maps\_utility::battlechatter_off( "allies" );
    thread player_breach_jump();
    common_scripts\utility::flag_init( "obj_rescue_vip_given" );
    common_scripts\utility::flag_init( "obj_rescue_vip_complete" );
    common_scripts\utility::flag_init( "obj_freefall_given" );
    common_scripts\utility::flag_init( "obj_freefall_complete" );
    common_scripts\utility::flag_init( "aa_first_floor_section" );
    common_scripts\utility::flag_init( "aa_second_floor_section" );
    common_scripts\utility::flag_init( "aa_humanshield_section" );
    common_scripts\utility::flag_init( "timer_expired" );
    common_scripts\utility::flag_init( "destabilize_level_2" );
    common_scripts\utility::flag_init( "enemies_alerted" );
    common_scripts\utility::flag_init( "intro_fade_in_complete" );
    common_scripts\utility::flag_init( "bathroom_guy_dead" );
    common_scripts\utility::flag_init( "bathroom_dude_clear" );
    common_scripts\utility::flag_init( "fuselage_about_to_blow" );
    common_scripts\utility::flag_init( "fuselage_breached" );
    common_scripts\utility::flag_init( "human_shield_starting" );
    common_scripts\utility::flag_init( "player_looking_at_human_shield" );
    common_scripts\utility::flag_init( "hostage_timer_expired" );
    common_scripts\utility::flag_init( "human_shield_actors_spawned" );
    common_scripts\utility::flag_init( "terrorist_killed" );
    common_scripts\utility::flag_init( "terrorist_wounded" );
    common_scripts\utility::flag_init( "human_shield_over" );
    common_scripts\utility::flag_init( "friendlies_killed_human_shield" );
    common_scripts\utility::flag_init( "restore_timescale" );
    common_scripts\utility::flag_init( "hostage_idling_for_freefall" );
    common_scripts\utility::flag_init( "exit_door_about_to_blow" );
    common_scripts\utility::flag_init( "exit_door_blown" );
    common_scripts\utility::flag_init( "freefallers_jumping" );
    common_scripts\utility::flag_init( "friendlies_jumped" );
    common_scripts\utility::flag_init( "hostage_jumped_out" );
    common_scripts\utility::flag_init( "player_jumped_out" );
    common_scripts\utility::flag_init( "white_done" );
    common_scripts\utility::flag_init( "plane_explodes" );
    common_scripts\utility::flag_init( "cut_to_black" );
    setomnvar( "ui_airplane_init", 1 );
    thread dialogue_move();
    thread dialogue_clear();
    level.playerspeed = 0.85;
    level.player setmovespeedscale( level.playerspeed );
    common_scripts\utility::array_thread( getentarray( "civilian", "script_noteworthy" ), ::ai_civilian_think );
    level.org_view_roll = getent( "org_view_roll", "targetname" );
    level.arollers = [];
    level.arollers = common_scripts\utility::array_add( level.arollers, level.org_view_roll );
    thread airmasks();
    thread plane_tilt();
    createthreatbiasgroup( "player" );
    createthreatbiasgroup( "ignored" );
    createthreatbiasgroup( "oblivious" );
    level.player setthreatbiasgroup( "player" );
    setignoremegroup( "allies", "oblivious" );
    setignoremegroup( "axis", "oblivious" );
    setignoremegroup( "player", "oblivious" );
    setignoremegroup( "oblivious", "allies" );
    setignoremegroup( "oblivious", "axis" );
    setignoremegroup( "oblivious", "oblivious" );
    common_scripts\utility::array_thread( getentarray( "human_shield", "targetname" ), maps\_utility::add_spawn_function, ::ai_human_shield_think );
    common_scripts\utility::array_thread( getentarray( "patroller", "script_noteworthy" ), maps\_utility::add_spawn_function, ::ai_patroller );
    common_scripts\utility::array_thread( getentarray( "scripted_node_dummies", "targetname" ), maps\jake_tools::hide_geo );
    thread airplane_destabilize();
    thread fx_management();
    thread maps\jake_tools::hideall();
    thread airplane_wibble_setup();
    thread conference_shotgun_guy();
}

start_default()
{
    aa_intro_init();
    var_0 = getent( "plane_shell", "targetname" );
    var_0 hide();
}

start_breach()
{
    initfriendlies( "breach" );
    aa_breach_init();
}

start_vip()
{
    initfriendlies( "vip" );
    aa_vip_init();
}

start_freefall()
{
    initfriendlies( "freefall" );
    thread door_open_double( getentarray( "door_bar", "targetname" ) );
    common_scripts\utility::flag_set( "human_shield_over" );
    aa_freefall_init();
}

start_demo()
{
    thread demo_setup();
    demo_walkthrough();
}

aa_intro_init()
{
    initfriendlies( "intro" );
    thread music();
    thread intro_setup();
    thread stealth_intro();
    thread airplane_timer();
    thread obj_rescue_vip();
    thread flashbang_detect();
    thread weapon_detect();
    level thread aa_breach_init();
    level thread aa_vip_init();
    soundscripts\_snd::snd_message( "aud_start_intro_checkpoint" );
    common_scripts\utility::flag_set( "aa_first_floor_section" );
}

intro_fade_in()
{
    var_0 = maps\jake_tools::create_overlay_element( "black", 1 );
    var_1 = getent( "cutaway_geo_floor", "targetname" );
    var_1 hide();
    var_2 = maps\jake_tools::create_overlay_element( "airplane_hole_overlay", 1 );
    level.player disableweapons();
    var_3 = getent( "cutaway_geo", "targetname" );
    var_4 = getent( "org_intro_playerview", "targetname" );
    level.player.origin = var_4.origin;
    level.player playerlinkto( var_4, undefined, 0, 0, 0, 0 );
    var_4.origin += ( 0.0, 20.0, -52.0 );
    level.player freezecontrols( 1 );
    var_5 = spawn( "script_origin", var_4.origin );
    var_5.angles = var_4.angles;
    level.player playersetgroundreferenceent( var_5 );
    var_5 rotatepitch( 65, 0.05 );
    var_4 rotateroll( -10, 0.05 );
    var_3.origin += ( 15.0, 20.0, -10.0 );
    wait 0.2;
    level.price hide();
    var_0.alpha = 0;
    thread cutaway_geo( var_3 );
    wait 0.3;
    var_0 = maps\jake_tools::create_overlay_element( "black", 0 );
    var_0 fadeovertime( 1 );
    var_0.alpha = 1;
    wait 1;
    var_2 destroy();
    setomnvar( "ui_gasmask", 1 );
    level.player playersetgroundreferenceent( level.org_view_roll );
    level.price show();
    level.player unlink();
    var_6 = getent( "player_intro_start", "targetname" );
    thread common_scripts\utility::play_sound_in_space( "gear_rattle_plr_run", level.player.origin );
    level.player setorigin( var_6.origin );
    level.player setplayerangles( var_6.angles );
    level.player.angles = var_6.angles;
    common_scripts\utility::flag_set( "intro_fade_in_complete" );
    var_1 show();
    var_0 fadeovertime( 2 );
    var_0.alpha = 0;
    var_3 hide();
    var_3 notsolid();
    level.player enableweapons();
    level.player freezecontrols( 0 );
    maps\_utility::autosave_now_silent();
    wait 2;
    var_0 destroy();
}

intro_fade_in_h1()
{
    var_0 = maps\jake_tools::create_overlay_element( "black", 1 );
    var_1 = getent( "player_intro_start", "targetname" );
    level.player setorigin( var_1.origin );
    level.player setplayerangles( var_1.angles );
    level.player.angles = var_1.angles;
    level.player disableweapons();
    level.player freezecontrols( 1 );
    var_2 = getent( "cutaway_geo", "targetname" );
    var_2 hide();
    var_2 notsolid();
    wait 0.1;
    thread maps\_utility::autosave_now_silent();
    common_scripts\utility::flag_set( "intro_fade_in_complete" );
    setomnvar( "ui_gasmask", 1 );
    var_0 fadeovertime( 1 );
    var_0.alpha = 0;
    level.player enableweapons();
    wait 1.0;
    level.player freezecontrols( 0 );
    wait 1.0;
    var_0 destroy();
}

cutaway_geo( var_0 )
{
    level.player thread maps\_utility::play_sound_on_entity( "airplane_panel_drop" );
    var_0 rotateroll( -10, 0.3, 0.1, 0.1 );
    var_0 movez( -110, 0.7, 0.2 );
    wait 0.3;
    wait 0.2;
    var_0 rotateroll( 10, 0.15, 0.05, 0.05 );
    wait 0.15;
    wait 0.15;
    earthquake( 0.1, 0.5, level.player.origin, 500 );
    level.player playrumbleonentity( "generic_attack_light_500" );
}

intro_fade_in2()
{
    var_0 = getent( "cutaway_geo", "targetname" );
    var_0 hide();
    var_0 notsolid();
    level.player disableweapons();
    level.player freezecontrols( 1 );
    var_1 = maps\jake_tools::create_overlay_element( "black", 1 );
    wait 2;
    setomnvar( "ui_gasmask", 1 );
    var_1 fadeovertime( 2 );
    var_1.alpha = 0;
    level.player enableweapons();
    level.player freezecontrols( 0 );
    maps\_utility::autosave_now_silent();
    wait 2;
    var_1 destroy();
    common_scripts\utility::flag_set( "intro_fade_in_complete" );
    level.player playersetgroundreferenceent( level.org_view_roll );
}

airplane_timer()
{
    common_scripts\utility::flag_wait( "intro_fade_in_complete" );
    level thread timer_start();
    common_scripts\utility::flag_set( "obj_rescue_vip_given" );
}

music()
{
    common_scripts\utility::flag_wait_either( "bathroom_guy_dead", "enemies_alerted" );
    maps\_utility::musicplaywrapper( "airplane_alt_music" );
    common_scripts\utility::flag_wait( "human_shield_starting" );
    musicstop( 2 );
}

stealth_intro()
{
    maps\_utility::battlechatter_off( "axis" );
    level.player.ignoreme = 1;

    for ( var_0 = 0; var_0 < level.squad.size; var_0++ )
    {
        level.squad[var_0].ignoreme = 1;
        level.squad[var_0] setthreatbiasgroup( "oblivious" );
    }

    common_scripts\utility::flag_wait_or_timeout( "enemies_alerted", 10 );

    if ( !common_scripts\utility::flag( "enemies_alerted" ) )
        common_scripts\utility::flag_set( "enemies_alerted" );

    level thread maps\_utility::radio_dialogue_queue( "airplane_first_hostile_killed_2" );
    maps\_utility::battlechatter_on( "axis" );
    var_1 = getent( "colornodes_intro", "script_noteworthy" );
    var_1 notify( "trigger", level.player );
    level.player.ignoreme = 0;

    for ( var_0 = 0; var_0 < level.squad.size; var_0++ )
    {
        level.squad[var_0].ignoreme = 0;
        level.squad[var_0] setthreatbiasgroup( "allies" );
    }

    wait 1;
}

intro_setup()
{
    common_scripts\utility::flag_wait( "intro_fade_in_complete" );
    maps\jake_tools::triggeractivate( "trig_spawn_patrollers" );
    level.price thread maps\_anim::anim_generic( level.price, "enemy_cornerR" );
    var_0 = getent( "hostile_bathroom", "targetname" );
    var_0.script_forcespawn = 1;
    level.hostile_bathroom = var_0 maps\_utility::spawn_ai();
    level.hostile_bathroom thread hostile_bathroom_think();
    var_1 = getent( "bathroom_flush", "targetname" );
    thread common_scripts\utility::play_sound_in_space( "airplane_toiletflush", var_1.origin );
    wait 1;
    thread bathroom_door_open( "bathroomdoor_01", "bathroomdoor_02" );
}

hostile_bathroom_think()
{
    self waittill( "damage" );
    common_scripts\utility::flag_set( "bathroom_guy_dead" );
}

conference_shotgun_guy()
{
    var_0 = getentarray( "auto18", "targetname" );

    foreach ( var_2 in var_0 )
    {
        if ( var_2.classname == "actor_enemy_merc_SHTGN_m1014" )
        {
            var_2 waittill( "spawned", var_3 );
            var_4 = var_3.interval;
            var_3.interval = 10;
            wait 5;
            var_3.interval = var_4;
        }
    }
}

aa_breach_init()
{
    level thread dialogue_breach();
    level thread fuselage_breached();
    level thread breach_kill_ai();
}

dialogue_breach()
{
    common_scripts\utility::flag_wait( "player_approaching_breach" );
    level.peoplespeaking = 1;
    level maps\_utility::radio_dialogue( "airplane_gaz_hullbreach" );
    common_scripts\utility::flag_wait( "fuselage_breached" );
    wait 1;
    level.peoplespeaking = 0;
    common_scripts\utility::flag_wait( "player_up_breach_stairs" );
    level.peoplespeaking = 1;
    level maps\_utility::radio_dialogue( "airplane_gaz_stairwayclear" );
    level maps\_utility::radio_dialogue( "airplane_sas4_multiplecont" );
    level.peoplespeaking = 0;
    common_scripts\utility::flag_wait( "player_approach_bar" );
    level.peoplespeaking = 1;
    level maps\_utility::radio_dialogue( "airplane_gaz_watchyourfire" );
    level.peoplespeaking = 0;
}

hull_breach_rumble( var_0, var_1 )
{
    level.player playrumbleonentity( "generic_attack_heavy_1500" );
    var_0 playrumblelooponentity( "breach_loop" );

    if ( !var_1 )
    {
        common_scripts\utility::flag_wait( "player_up_breach_stairs" );
        var_0 stoprumble( "breach_loop" );
    }
    else
    {
        common_scripts\utility::flag_wait( "player_jumped_out" );
        var_0 stoprumble( "breach_loop" );
        level.player playrumblelooponentity( "generic_quake_loop" );
        common_scripts\utility::flag_wait( "plane_explodes" );
        level.player stoprumble( "generic_quake_loop" );
        level.player playrumbleonentity( "generic_attack_heavy_1500" );
        level.player playrumblelooponentity( "generic_quake_loop" );
        common_scripts\utility::flag_wait( "cut_to_black" );
        level.player stoprumble( "generic_quake_loop" );
    }
}

fuselage_breached()
{
    common_scripts\utility::array_thread( getentarray( "animated_air_masks_breach", "targetname" ), ::animated_breach_entity, "air_mask", "air_masks_breach_fall", "air_masks_breach_loop", 1, 0, 0.9 );
    common_scripts\utility::array_thread( getentarray( "animated_air_masks", "targetname" ), ::animated_breach_entity, "air_mask", "air_masks_fall", "air_masks_loop", 1, 0, 0.9 );
    var_0 = getent( "breach_org1", "targetname" );
    var_1 = getent( "breach_org2", "targetname" );
    common_scripts\utility::flag_wait( "player_approaching_breach" );

    if ( isdefined( level.macey.magic_bullet_shield ) )
        level.macey maps\_utility::stop_magic_bullet_shield();

    common_scripts\utility::array_thread( getentarray( "breach_seats", "targetname" ), ::breach_seat, "fuselage_breached" );
    level.player thread maps\_utility::play_sound_on_entity( "fuselage_stress" );
    level.player playrumblelooponentity( "generic_ambient_loop" );
    wait 0.5;
    common_scripts\_exploder::exploder( 7 );
    wait 1.5;
    level.player thread maps\_utility::play_sound_on_entity( "fuselage_stress" );
    common_scripts\utility::flag_set( "fuselage_about_to_blow" );
    wait 0.5;
    level.player playlocalsound( "airplane_seatbelt", "airplane_seatbelt_done" );
    common_scripts\utility::array_thread( getentarray( "animated_center_console", "targetname" ), ::animated_breach_entity, "center_console", "center_console_open", "center_console_shake", 0, 1 );
    level.player waittill( "airplane_seatbelt_done" );
    wait 0.5;
    level.player stoprumble( "generic_ambient_loop" );
    common_scripts\_exploder::exploder( 666 );
    earthquake( 0.5, 3, level.player.origin, 8000 );
    soundscripts\_audio_mix_manager::mm_clear_submix( "first_floor_mix" );
    level.player thread maps\_utility::play_sound_on_entity( "fuselage_breach_explosion_in" );
    level.player thread maps\_utility::play_sound_on_entity( "fuselage_breach_explosion" );
    thread maps\airplane_aud::aud_explosion_event();
    common_scripts\utility::flag_set( "wind_zone_active" );
    common_scripts\utility::flag_set( "fuselage_breached" );

    if ( getdvar( "goggle_crack_during_breach" ) == "1" )
        thread addgasmaskcracks();

    thread hull_breach_rumble( var_0, 0 );
    var_2 = getentarray( "animated_compartment", "targetname" );
    common_scripts\utility::array_thread( var_2, ::animated_breach_entity, "bin", "bin_open", "bin_shake", 0, 0 );
    common_scripts\utility::array_thread( var_2, maps\airplane_aud::aud_animated_luggage );
    common_scripts\utility::array_thread( getentarray( "animated_bathroom_door", "targetname" ), ::animated_bathroom_door );
    thread breach_gravity_shift();
    thread airplane_tirescheat();
    var_0 playloopsound( "airplane_wind_loop" );
    thread maps\_utility::set_ambient( "amb_int_airplane_intensity5" );
    wait 1.5;
    common_scripts\utility::flag_wait( "player_jumped_out" );
    var_0 stoploopsound( "airplane_wind_loop" );
    wait 0.5;
}

animated_breach_entity( var_0, var_1, var_2, var_3, var_4, var_5 )
{
    if ( var_3 )
    {
        self hide();
        common_scripts\utility::flag_wait( "fuselage_about_to_blow" );
    }

    if ( isdefined( var_5 ) )
        wait(var_5);

    self.animname = var_0;
    maps\_utility::assign_animtree();

    if ( isdefined( self.script_noteworthy ) )
        common_scripts\utility::flag_wait( self.script_noteworthy );

    if ( isdefined( self.target ) )
    {
        var_6 = getent( self.target, "targetname" );

        if ( isdefined( var_6 ) && issubstr( var_6.classname, "trigger_multiple" ) )
            var_6 waittill( "trigger" );
    }

    if ( var_4 )
    {
        maps\_utility::script_delay();
        self show();
        thread maps\_utility::play_sound_on_entity( "scn_cargoship_mask_down" );
        maps\_anim::anim_single_solo( self, var_1 );
        common_scripts\utility::flag_wait( "fuselage_breached" );
        maps\_utility::script_delay();
        maps\_anim::anim_loop_solo( self, var_2 );
    }
    else
    {
        maps\_utility::script_delay();
        self show();
        maps\_anim::anim_single_solo( self, var_1 );
        maps\_anim::anim_loop_solo( self, var_2 );
    }
}

animated_bathroom_door()
{
    self.animname = "bathroom_door";
    maps\_utility::assign_animtree();
    maps\_anim::anim_loop_solo( self, "bathroom_door_shake" );
}

breach_kill_ai()
{
    common_scripts\utility::flag_wait( "fuselage_breached" );
    var_0 = maps\jake_tools::getaiarraytouchingvolume( "axis", "badplace_breach" );

    for ( var_1 = 0; var_1 < var_0.size; var_1++ )
        var_0[var_1] thread breach_kill_ai_logic();
}

breach_kill_ai_logic()
{
    self.ignoreme = 1;
    self.skipdeathanim = 1;
    self kill();
    var_0 = self.origin;
}

breach_compartment_setup()
{
    var_0 = getentarray( "compartment", "script_noteworthy" );

    for ( var_1 = 0; var_1 < var_0.size; var_1++ )
        var_0[var_1] movez( 24, 0.1 );
}

breach_compartment_open( var_0, var_1 )
{
    var_2 = getent( self.target, "targetname" );

    if ( isdefined( var_0 ) )
        common_scripts\utility::flag_wait( var_0 );

    thread common_scripts\utility::play_sound_in_space( "airplane_overhead_compartment_open", var_2.origin );
    self rotateroll( var_1, 0.4, 0.1, 0.1 );
    wait 0.4;
    physicsexplosionsphere( var_2.origin, 60, 30, 0.2 );
}

breach_seat( var_0 )
{
    var_1 = getent( self.target, "targetname" );
    var_2 = getent( var_1.target, "targetname" );
    var_3 = undefined;
    var_4 = undefined;
    var_5 = undefined;
    var_6 = undefined;
    var_7 = undefined;

    if ( isdefined( var_0 ) )
        common_scripts\utility::flag_wait( var_0 );

    switch ( self.script_noteworthy )
    {
        case "seat_1":
            var_4 = 75;
            var_5 = 1.2;
            var_6 = 0.65;
            var_7 = 0.25;
            var_3 = 0.5;
            break;
        case "seat_2":
            var_4 = -75;
            var_5 = 1.2;
            var_6 = 0.65;
            var_7 = 0.25;
            var_3 = 0.75;
            break;
        default:
            break;
    }

    wait(var_3);
    self rotateyaw( var_4, var_5, var_5 / 3 );
    wait(var_5);
    self moveto( var_1.origin, var_6 );
    self rotateto( var_1.angles, var_6 );
    wait(var_6);
    self moveto( var_2.origin, var_7 );
    self rotateto( var_2.angles, var_7 );
    wait(var_7);
    self delete();
}

breach_gravity_shift()
{
    var_0 = getent( "org_breach_push", "targetname" );
    wait 1;
    thread gravity_shift( 25 );
    var_1 = getent( "breach_physics", "targetname" );
    var_2 = getent( "breach_org1", "targetname" );
    var_1 thread maps\_utility::physicsjolt_proximity( 5000, 2500, ( 0.0, 0.0, 0.25 ) );
    common_scripts\utility::flag_wait( "player_up_breach_stairs" );
    common_scripts\utility::flag_clear( "aa_first_floor_section" );
    common_scripts\utility::flag_set( "aa_second_floor_section" );
    var_1 notify( "stop_physicsjolt" );
    common_scripts\utility::flag_wait( "exit_door_blown" );
    thread final_roll();
    var_3 = getent( "shake_org", "targetname" );
    var_3 thread maps\_utility::physicsjolt_proximity( 5000, 2500, ( 0.0, 0.0, 0.25 ) );
    common_scripts\utility::flag_wait( "player_jumped_out" );
    var_3 notify( "stop_physicsjolt" );
}

airplane_tirescheat()
{
    var_0 = common_scripts\utility::getstruct( "airplane_tires_destination", "targetname" );

    if ( !isdefined( var_0 ) )
        return;

    for (;;)
    {
        if ( isdefined( level.cheattires ) && !common_scripts\utility::flag( "aa_second_floor_section" ) )
        {
            foreach ( var_2 in level.cheattires )
            {
                if ( distancesquared( var_0.origin, var_2.origin ) < 320 )
                    continue;

                var_3 = var_0.origin - var_2.origin;
                var_3 = vectornormalize( var_3 );
                var_3 += ( 0.0, 0.0, 1.0 );
                var_3 = maps\_utility::vector_multiply( var_3, randomintrange( 1600, 3200 ) );
                applyaccelerationonentity( var_2, ( 0.0, 0.0, 0.0 ), var_3 );
            }
        }

        wait 0.05;
    }
}

final_roll()
{
    thread gravity_shift( -25 );
    common_scripts\utility::array_thread( level.arollers, ::rotate_rollers, -13 );
    wait 6;
    common_scripts\utility::array_thread( level.arollers, ::rotate_rollers, 13 );
}

physicsshake()
{
    level endon( "stop_physics_shake" );

    for (;;)
    {
        wait 0.1;
        physicsjitter( level.player.origin, 5000, 2500, 0.45, 0.9 );
    }
}

plane_tilt()
{
    common_scripts\utility::flag_wait( "fuselage_breached" );
    common_scripts\utility::array_thread( level.arollers, ::rotate_rollers, 15 );
    wait 6;
    common_scripts\utility::array_thread( level.arollers, ::rotate_rollers, -13 );
    wait 5;
    common_scripts\utility::array_thread( level.arollers, ::rotate_rollers, 10 );
    wait 5;
    common_scripts\utility::array_thread( level.arollers, ::rotate_rollers, -12 );
    wait 5;
    common_scripts\utility::flag_wait( "player_up_breach_stairs" );
}

rotate_rollers( var_0 )
{
    self rotateroll( var_0, 5, 2, 2 );
}

aa_vip_init()
{
    thread friendly_human_shield_setup();
    thread restore_timescale();
    thread dialogue_humanshield();
    thread humanshield();
    thread blood_pool();
    thread humanshield_timer_kill();
    aa_freefall_init();
}

restore_timescale()
{
    common_scripts\utility::flag_wait_either( "terrorist_killed", "terrorist_wounded" );
    wait 1.3;
    common_scripts\utility::flag_set( "restore_timescale" );
}

dialogue_humanshield()
{
    common_scripts\utility::flag_wait( "human_shield_actors_spawned" );
    level.terrorist thread maps\jake_tools::dialogue_execute( "airplane_ter_illkillhim" );
    wait 1;
    level thread maps\_utility::radio_dialogue( "airplane_gaz_downonfloor" );
}

blood_pool()
{
    var_0 = getent( "blood_pool", "targetname" );
    common_scripts\utility::flag_wait( "human_shield_over" );

    if ( level.playergotheadshot )
        playfx( common_scripts\utility::getfx( "blood_pool" ), var_0.origin + ( 5.0, 15.0, 0.0 ), ( 0.0, 0.0, 1.0 ) );
}

humanshield_timer_kill()
{
    common_scripts\utility::flag_wait_either( "terrorist_killed", "terrorist_wounded" );
    killtimer();
}

friendly_human_shield_setup()
{
    var_0 = getnodearray( "nodeStart_vip", "targetname" );
    var_1 = undefined;
    var_2 = undefined;

    for ( var_3 = 0; var_3 < var_0.size; var_3++ )
    {
        if ( isdefined( var_0[var_3].script_noteworthy ) )
        {
            if ( var_0[var_3].script_noteworthy == "nodePrice" )
                var_1 = var_0[var_3];

            if ( var_0[var_3].script_noteworthy == "nodeGrigsby" )
                var_2 = var_0[var_3];
        }
    }

    common_scripts\utility::flag_wait( "player_looking_at_human_shield" );
    level.price thread teleport_human_shield( var_1 );
    level.grigsby thread teleport_human_shield( var_2 );
}

teleport_human_shield( var_0 )
{
    maps\_utility::disable_ai_color();
    self forceteleport( var_0.origin, var_0.angles );
    self setgoalpos( self.origin );
    maps\jake_tools::setgoalradius( var_0.radius );
    self setgoalnode( var_0 );
}

humanshield()
{
    common_scripts\utility::flag_wait( "player_approach_human_shield" );
    thread kill_ai();
    common_scripts\utility::flag_clear( "aa_second_floor_section" );
    common_scripts\utility::flag_set( "aa_humanshield_section" );
    level.nodeshield = getnode( "node_freefall", "targetname" );
    level.hostage = maps\_utility::spawn_script_noteworthy( "hostage" );
    level.terrorist = maps\_utility::spawn_script_noteworthy( "terrorist" );
    common_scripts\utility::flag_set( "human_shield_actors_spawned" );
    common_scripts\utility::flag_set( "human_shield_starting" );
    level notify( "stop_airplane_destabilize" );
    thread hostage_timer( 5 );
    thread door_open_double( getentarray( "door_bar", "targetname" ) );
    maps\_utility::delaythread( 1, ::player_hearbeat );
    thread humanshield_player_weapon();
    var_0 = getent( "org_humanshield_playerview", "targetname" );
    var_0.origin = level.player.origin;
    create_playerview( var_0 );
    var_1 = 0.5;
    level.player thread maps\_utility::play_sound_on_entity( "scn_slomo_in_front" );
    maps\_utility::set_vision_set( "airplane_slomo", 2 );
    level.player setclutforplayer( "clut_airplane_slomo", 2.0 );
    level.player lightsetforplayer( "airplane_slomo" );
    level.eplayerview maps\_utility::lerp_player_view_to_tag( "tag_player", var_1, 1, 35, 35, 45, 45 );
    wait(var_1);
    common_scripts\utility::flag_set( "player_looking_at_human_shield" );
    soundscripts\_snd::snd_message( "aud_start_vip_checkpoint" );
    level.slowmooverlay = spawnfx( level._effect["slow_mo_overlay"], level.player.origin );
    triggerfx( level.slowmooverlay );
    setomnvar( "ui_airplane_slowmo_overlay", 1 );

    if ( getdvar( "chaplincheat" ) == "1" )
    {
        level.player setmovespeedscale( 0.2 );
        level.eplayerview delete();
        common_scripts\utility::flag_wait( "restore_timescale" );
        common_scripts\utility::flag_set( "obj_rescue_vip_complete" );
        common_scripts\utility::flag_clear( "aa_humanshield_section" );
    }
    else
    {
        var_2 = gettimescale() < level.slowmo.speed_norm;
        maps\_utility::slowmo_start();
        enablesoundcontextoverride( "slomo" );
        soundscripts\_snd::snd_message( "aud_add_slowmo_mix" );
        maps\_utility::slowmo_setspeed_slow( 0.3 );
        maps\_utility::slowmo_setlerptime_in( 0.05 );
        maps\_utility::slowmo_lerp_in();
        level.player setmovespeedscale( 0.2 );
        level.eplayerview delete();
        common_scripts\utility::flag_wait( "restore_timescale" );
        common_scripts\utility::flag_set( "obj_rescue_vip_complete" );
        common_scripts\utility::flag_clear( "aa_humanshield_section" );
        var_3 = 0.05;
        maps\_utility::slowmo_setlerptime_out( var_3 );
        maps\_utility::slowmo_lerp_out();
        disablesoundcontextoverride( "slomo" );
        soundscripts\_snd::snd_message( "aud_remove_slowmo_mix" );
        wait(var_3);
        maps\_utility::slowmo_end();

        if ( var_2 )
            level.player notify( "_cheat_player_press_slowmo" );
    }

    level.slowmooverlay delete();
    setomnvar( "ui_airplane_slowmo_overlay", 0 );
    thread airplane_destabilize();
    level.player setmovespeedscale( level.playerspeed );
    level.player thread maps\_utility::play_sound_on_entity( "scn_slomo_out_front" );
    maps\_utility::set_vision_set( "airplane", 2 );
    level.player setclutforplayer( "clut_airplane_top", 2.0 );
    level.player lightsetforplayer( "airplane" );
    level notify( "stop_player_heartbeat" );
}

kill_ai()
{
    var_0 = getaiarray( "axis" );

    for ( var_1 = 0; var_1 < var_0.size; var_1++ )
        var_0[var_1] kill();
}

kill_all_ai()
{
    var_0 = getaiarray( "axis", "allies" );

    foreach ( var_2 in var_0 )
    {
        if ( isdefined( var_2.magic_bullet_shield ) )
            var_2 maps\_utility::stop_magic_bullet_shield();

        var_2 kill();
    }
}

player_hearbeat()
{
    level endon( "stop_player_heartbeat" );

    for (;;)
    {
        level.player thread maps\_utility::play_sound_on_entity( "breathing_heartbeat" );
        wait 0.5;
    }
}

humanshield_player_weapon()
{
    var_0 = level.player getcurrentweapon();
    level.player takeweapon( var_0 );
    wait 1;
    level.player giveweapon( "usp_silencer" );
    level.player givemaxammo( "usp_silencer" );
    level.player switchtoweapon( "usp_silencer" );
}

ai_human_shield_think()
{
    common_scripts\utility::flag_wait( "human_shield_actors_spawned" );
    self endon( "death" );
    self.ignoreme = 1;
    maps\_utility::setflashbangimmunity( 1 );
    self setthreatbiasgroup( "oblivious" );
    self setgoalpos( self.origin );
    maps\_utility::setflashbangimmunity( 1 );
    thread human_shield_death_monitor();
    thread human_shield_pain_monitor();
    var_0 = undefined;

    switch ( self.script_noteworthy )
    {
        case "terrorist":
            self.allowdeath = 0;
            self.animname = "terrorist";
            var_0 = level.hostage;
            break;
        case "hostage":
            self.allowdeath = 1;
            self.disablearrivals = 1;
            self.disableexits = 1;
            self.team = "neutral";
            self.animname = "hostage";
            maps\_utility::set_run_anim( "unarmed_run2" );
            self.deathanim = level.scr_anim["hostage"]["human_shield_death"];
            var_0 = level.terrorist;
            maps\_utility::gun_remove();
            break;
    }

    self setgoalpos( self.origin );
    level.nodeshield thread maps\_anim::anim_loop_solo( self, "human_shield_idle", undefined, "stop_idle" );
    common_scripts\utility::flag_wait( "human_shield_over" );

    if ( isdefined( self ) )
        self.deathanim = undefined;
}

human_shield_ter_wounded_failsafe()
{
    self endon( "death" );
    var_0 = getentarray( "org_humanshield_magicbullet", "targetname" );
    var_1 = undefined;
    wait 1.5;
    var_2 = [];
    var_3[0] = level.price gettagorigin( "TAG_FLASH" );
    var_3[1] = level.grigsby gettagorigin( "TAG_FLASH" );

    for ( var_4 = 0; var_4 < var_2.size; var_4++ )
    {
        var_5 = bullettracepassed( var_2[0].origin, self gettagorigin( "TAG_EYE" ), 1, self );

        if ( var_5 == 1 )
        {
            var_1 = var_2[0];
            break;
        }
    }

    if ( !isdefined( var_1 ) )
        var_1 = common_scripts\utility::getfarthest( level.player.origin, var_0 );

    var_6 = self gettagorigin( "TAG_EYE" );
    thread humanshield_magicbullet_h1( var_1 );
    wait 0.1;
    common_scripts\utility::flag_set( "friendlies_killed_human_shield" );
    self kill( var_6 );
}

humanshield_magicbullet_h1( var_0 )
{
    var_1 = 1;

    if ( getdvar( "humanshield_magicbullet_shots" ) != "" && getdvarint( "humanshield_magicbullet_shots" ) > 0 )
        var_1 = getdvarint( "humanshield_magicbullet_shots" );

    for ( var_2 = 0; var_2 < var_1; var_2++ )
    {
        var_3 = self gettagorigin( "TAG_EYE" );
        bullettracer( var_0.origin, var_3, 1 );
        thread common_scripts\utility::play_sound_in_space( "weap_usp45sd_fire_plr", level.player.origin );
        wait 0.05;
    }
}

headshot_fx()
{
    var_0 = level.player.angles;
    var_1 = anglestoforward( var_0 );
    var_2 = maps\_utility::vector_multiply( var_1, 5000 );
    var_3 = level.player geteye();
    var_4 = var_3 + var_2;
    var_5 = bullettrace( var_3, var_4, 0, undefined );
    playfx( common_scripts\utility::getfx( "flesh_hit" ), var_5["position"], ( 0.0, 0.0, 1.0 ) );
    playfx( common_scripts\utility::getfx( "headshot1" ), var_5["position"], ( 0.0, 0.0, 1.0 ) );
    playfx( common_scripts\utility::getfx( "headshot1" ), var_5["position"], ( -25.0, 10.0, -10.0 ) );
    playfx( common_scripts\utility::getfx( "headshot2" ), var_5["position"], ( 0.0, 0.0, 1.0 ) );
    playfx( common_scripts\utility::getfx( "headshot3" ), var_5["position"], ( 0.0, 0.0, 1.0 ) );
    thread common_scripts\utility::play_sound_in_space( "bullet_large_flesh", level.player.origin );
    thread suitcase_splatter();
}

suitcase_splatter()
{
    var_0 = getent( "splatter", "targetname" );
    var_1 = getent( "bomb_flash", "targetname" );
    var_2 = var_0.angles;
    var_3 = anglestoforward( var_2 );
    var_4 = maps\_utility::vector_multiply( var_3, 10000 );
    var_5 = var_0.origin;
    var_6 = var_1.origin;
    var_7 = bullettrace( var_5, var_6, 0, undefined );
    playfx( common_scripts\utility::getfx( "headshot1" ), var_6 + ( 100.0, -10.0, 10.0 ), var_4, ( 0.0, 10.0, 1.0 ) );
}

human_shield_death_monitor()
{
    level endon( "hostage_jumped_out" );
    self waittill( "death" );
    var_0 = self.origin;

    if ( self == level.hostage )
        thread maps\_friendlyfire::missionfail();
}

human_shield_pain_monitor()
{
    level.hostage endon( "death" );

    while ( isdefined( self ) )
    {
        self waittill( "damage", var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7, var_8 );

        if ( isdefined( var_4 ) && var_4 == "MOD_IMPACT" )
            continue;

        if ( self == level.hostage )
        {
            if ( isdefined( var_1 ) && isplayer( var_1 ) )
            {
                self kill();
                break;
            }
        }
        else if ( isdefined( var_7 ) && var_7 == "j_head" )
        {
            common_scripts\utility::flag_set( "terrorist_killed" );
            level.playergotheadshot = 1;

            if ( level.tire_explosion )
            {
                self.allowdeath = 1;
                level.nodeshield notify( "stop_idle" );
                thread headshot_fx();
                self kill();
            }
            else
            {
                var_9 = maps\_vehicle_aianim::convert_guy_to_drone( self );
                var_9.animname = "terrorist";
                level.nodeshield notify( "stop_idle" );
                var_9 thread headshot_fx();
                level.nodeshield thread maps\_anim::anim_single_solo( var_9, "human_shield_death" );
                var_9.animname = "terrorist";
                var_9 setcontents( 0 );
            }

            level.nodeshield maps\_anim::anim_single_solo( level.hostage, "human_shield_breakfree_partner_dead" );
            break;
        }
        else if ( !common_scripts\utility::flag( "terrorist_wounded" ) )
        {
            common_scripts\utility::flag_set( "terrorist_wounded" );

            if ( level.gameskill == 3 )
                thread mission_failed_veteran_no_headshot();

            self.allowdeath = 1;
            thread human_shield_ter_wounded_failsafe();
            level.nodeshield notify( "stop_idle" );
            level.nodeshield thread maps\_anim::anim_single_solo( self, "human_shield_pain" );
            level.nodeshield maps\_anim::anim_single_solo( level.hostage, "human_shield_breakfree_partner_wounded" );
            break;
        }
    }

    common_scripts\utility::flag_set( "human_shield_over" );
}

mission_failed_veteran_no_headshot()
{
    level notify( "mission failed" );
    thread killtimer();
    level notify( "kill_timer" );
    setdvar( "ui_deadquote", &"AIRPLANE_HOSTAGE_NO_HEADSHOT" );
    maps\_utility::missionfailedwrapper();
}

dummy_kill()
{
    self waittillmatch( "single anim", "end" );
    self kill();
}

aa_freefall_init()
{
    thread dialogue_freefall();
    thread dialogue_jumped_out();
    thread freefall();
    thread freefall_ai_setup();
    thread obj_freefall();
}

dialogue_freefall()
{
    common_scripts\utility::flag_wait( "human_shield_over" );

    if ( isdefined( level.hostage ) )
        level.hostage thread maps\jake_tools::dialogue_execute( "airplane_ru4_donthurtme" );

    wait 1;
    soundscripts\_snd::snd_message( "aud_add_armed_bomb_vo_mix" );
    level maps\_utility::radio_dialogue( "airplane_sas4_armedbomb" );
    level maps\_utility::radio_dialogue( "airplane_gaz_preptobreach" );
    common_scripts\utility::flag_wait( "freefallers_jumping" );

    if ( !common_scripts\utility::flag( "player_jumped_out" ) )
        level thread maps\_utility::radio_dialogue( "airplane_gaz_onyourfeet" );

    if ( !common_scripts\utility::flag( "player_jumped_out" ) )
        level.hostage maps\jake_tools::dialogue_execute( "airplane_ru4_noparachute" );

    wait 3;

    if ( !common_scripts\utility::flag( "player_jumped_out" ) )
        level thread maps\_utility::radio_dialogue( "airplane_sas1_letsgo" );
}

dialogue_jumped_out()
{
    common_scripts\utility::flag_wait( "player_jumped_out" );
    level maps\_utility::radio_dialogue( "airplane_gaz_seeya" );
}

bomb_think()
{
    var_0 = getent( "bomb_flash", "targetname" );
    level waittill( "timer_tick" );
    playfx( common_scripts\utility::getfx( "c4_light_blink" ), var_0.origin + ( 0.0, 0.0, 0.0 ) );
}

freefall_ai_setup()
{
    common_scripts\utility::flag_wait( "human_shield_over" );

    if ( !isdefined( level.hostage ) )
    {
        level.hostage = maps\_utility::spawn_script_noteworthy( "hostage2" );
        level.hostage.animname = "hostage";
        level.hostage maps\_utility::gun_remove();
    }

    level.nodefreefall = getnode( "node_freefall", "targetname" );
    level.freefallersready = 0;
    level.hostage thread ai_freefall_think();
    wait 1.5;
    level.price thread ai_freefall_think();
}

ai_freefall_think( var_0 )
{
    self endon( "death" );
    self pushplayer( 1 );
    self setthreatbiasgroup( "oblivious" );

    if ( self == level.hostage )
        self.disablearrivals = 1;
    else
    {
        maps\_utility::disable_ai_color();
        self.disablearrivals = 1;
    }

    self setgoalpos( self.origin );

    if ( self == level.hostage )
    {
        level.nodefreefall thread maps\_anim::anim_loop_solo( self, "airplane_end_VIP_idle", undefined, "stop_idle" );
        common_scripts\utility::flag_set( "hostage_idling_for_freefall" );
    }
    else
    {
        level.nodefreefall maps\_anim::anim_reach_solo( self, "airplane_end_VIP_start" );
        self setisforcedincombat( 1 );
        self allowedstances( "crouch" );
    }

    level.freefallersready++;
    common_scripts\utility::flag_wait( "hostage_idling_for_freefall" );
    common_scripts\utility::flag_wait( "exit_door_blown" );

    if ( self != level.hostage )
        self allowedstances( "crouch", "stand", "prone" );

    while ( level.freefallersready < 2 )
        wait 0.05;

    common_scripts\utility::flag_wait_or_timeout( "player_near_freefall", 3 );
    common_scripts\utility::flag_set( "freefallers_jumping" );

    if ( self == level.hostage )
        level.nodefreefall notify( "stop_idle" );

    level.nodefreefall maps\_anim::anim_single_solo( self, "airplane_end_VIP" );
    common_scripts\utility::flag_set( "hostage_jumped_out" );

    if ( isdefined( self.magic_bullet_shield ) )
        maps\_utility::stop_magic_bullet_shield();

    self delete();
}

freefall()
{
    common_scripts\utility::flag_wait( "human_shield_over" );
    thread friendly_blows_door();
    wait 1;
    maps\_utility::musicplaywrapper( "airplane_freefall_prep_music" );
    level thread timer_logic( 30, &"AIRPLANE_TIME_TILL_EXPLOSION", 1 );
    thread bomb_think();
    common_scripts\utility::flag_wait( "exit_door_blown" );
    common_scripts\utility::flag_set( "obj_freefall_given" );
    thread exit_door_fx();
    var_0 = getent( "trig_exit_door", "targetname" );
    var_0 waittill( "trigger" );

    if ( getdvarint( "use_old_airplane_jump" ) != 1 )
    {
        level.player allowlean( 0 );

        while ( level.player isleaning() )
            waitframe();
    }

    var_1 = undefined;

    if ( getdvarint( "use_old_airplane_jump" ) == 1 )
    {
        thread white_flash();
        level.player disableweapons();
        setsaveddvar( "compass", 0 );
    }
    else
    {
        level.player disableweapons();
        level.player setstance( "stand" );
        setsaveddvar( "compass", 0 );
        var_1 = maps\_utility::spawn_anim_model( "worldbody" );
        var_1 hide();
        thread maps\airplane_aud::aud_final_jump_mix_and_sounds();
        level.nodefreefall maps\_anim::anim_first_frame_solo( var_1, "airplane_end_player" );
        var_1 maps\_utility::lerp_player_view_to_tag_smoothly( "tag_player", 0.5, 1, 0, 0, 0, 0 );
        var_1 show();
        level.nodefreefall thread maps\_anim::anim_single_solo( var_1, "airplane_end_player" );
        wait 0.45;
        level.player playrumbleonentity( "generic_attack_heavy_1500" );
    }

    thread freefall_camerashake();
    common_scripts\utility::flag_set( "player_jumped_out" );
    thread killtimer();
    thread savetime();
    ambientstop( 1 );
    level.player thread maps\_utility::play_sound_on_entity( "airplane_jump_whoosh" );

    if ( getdvarint( "use_old_airplane_jump" ) != 1 )
        var_1 waittillmatch( "single anim", "switchplane" );
    else
        wait 0.5;

    var_2 = getent( "plane_shell", "targetname" );
    var_2 show();
    var_3 = getent( "plane_wings", "targetname" );
    var_3 hide();
    level.player_sound_org = spawn( "script_origin", level.player.origin + ( 0.0, 0.0, 32.0 ) );
    level.player_sound_org linkto( level.player );
    level.player_sound_org playloopsound( "airplane_wind_loop" );
    var_4 = 1;
    var_5 = 1;
    var_6 = 1;
    var_7 = 1;
    var_8 = 1;
    var_9 = getent( "org_player_freefall", "targetname" );
    var_10 = 0.2;

    if ( getdvarint( "use_old_airplane_jump" ) == 1 )
    {
        common_scripts\utility::flag_wait( "white_done" );
        level.player setplayerangles( var_9.angles );
        level.player setorigin( var_9.origin );
        level.player playerlinkto( var_9 );
        var_11 = getent( var_9.target, "targetname" );
        var_10 = 4;
        thread plane_explodes();
        level.player unlink();
        maps\_utility::lerp_player_view_to_position( var_11.origin, var_11.angles, var_10, var_4, var_5, var_6, var_7, var_8 );
        level.player playerlinkto( var_11 );
    }
    else
    {
        wait 0.3;
        thread plane_explodes();
    }
}

savetime()
{
    if ( isdefined( level.timetovipmessage ) )
        logstring( level.timetovipmessage );
}

white_flash( var_0 )
{
    if ( !isdefined( var_0 ) )
        var_0 = 0.5;

    var_1 = maps\jake_tools::create_overlay_element( "white", 0 );
    var_1 fadeovertime( var_0 );
    var_1.alpha = 1;
    wait 1;
    common_scripts\utility::flag_set( "white_done" );
    var_1 fadeovertime( 1 );
    var_1.alpha = 0;
}

exit_door_fx()
{
    common_scripts\utility::array_thread( level.fxexitdoor, maps\_utility::restarteffect );
    var_0 = getent( "exit_org1", "targetname" );
    var_1 = getent( "exit_org2", "targetname" );
    var_0 playloopsound( "airplane_wind_loop" );
    wait 1;
    var_1 playloopsound( "airplane_wind_loop" );
    common_scripts\utility::flag_wait( "plane_explodes" );
    var_0 stoploopsound( "airplane_wind_loop" );
    var_1 stoploopsound( "airplane_wind_loop" );
    level.player_sound_org stoploopsound( "airplane_wind_loop" );
}

end_music()
{
    musicstop( 1 );
    wait 1.5;
    maps\_utility::musicplaywrapper( "airplane_end_music" );
}

plane_explodes()
{
    wait 0.8;
    common_scripts\utility::flag_set( "plane_explodes" );
    common_scripts\_exploder::exploder( 1 );
    thread end_sound_start();
    musicstop( 1 );
    wait 2.25;
    common_scripts\utility::flag_set( "cut_to_black" );
    var_0 = maps\jake_tools::create_overlay_element( "black", 0 );
    var_0 fadeovertime( 1 );
    var_0.alpha = 1;
    thread soundscripts\_audio_mix_manager::mm_add_submix( "end_mix" );
    level.player_sound_org stopsounds();
    wait 0.1;
    level.player_sound_org delete();
    wait 2.5;
    level.player freezecontrols( 1 );
    level.player shellshock( "nosound", 60, 0 );

    if ( !maps\_utility::arcademode() )
    {
        wait 4.0;
        level.player luiopenmenu( &"AIRPLANE_CAMPAIGN_COMPLETED" );
        level.player waittill( "menuresponse" );
    }

    maps\_utility::nextmission();
}

end_sound_start()
{
    thread end_sound_stop();
    level.player playlocalsound( "scn_final_explosion_front" );
}

end_sound_stop()
{
    common_scripts\utility::flag_wait( "cut_to_black" );
    ambientstop();

    if ( getdvar( "arcademode" ) != "1" )
        level.player shellshock( "nosound", 60, 0 );
}

friendly_blows_door()
{
    var_0 = getent( "org_exit_door", "targetname" );
    var_1 = getnode( "node_door", "targetname" );
    var_2 = spawn( "script_origin", var_1.origin );
    var_2.origin += ( 0.0, -50.0, 0.0 );
    var_2.angles += ( 0.0, 90.0, 0.0 );
    var_3 = getent( "c4_door", "targetname" );
    level.grigsby maps\_utility::disable_ai_color();
    level.grigsby.ignoreme = 1;
    level.grigsby.goalradius = 32;
    level.grigsby pushplayer( 1 );
    var_2 maps\_anim::anim_reach_solo( level.grigsby, "C4_plant_start" );
    common_scripts\utility::flag_set( "exit_door_about_to_blow" );
    level.grigsby allowedstances( "crouch" );
    var_3 common_scripts\utility::delaycall( 1.8, ::show );
    var_3 thread maps\_utility::play_sound_on_entity( "scn_bomb_plant" );
    var_2 thread maps\_anim::anim_single_solo( level.grigsby, "C4_plant" );
    wait 3.5;
    level.grigsby allowedstances( "crouch", "stand", "prone" );
    level.grigsby.goalradius = 32;
    var_1 = getnode( "node_door_cover", "targetname" );
    level.grigsby setgoalnode( var_1 );
    level.grigsby common_scripts\utility::waittill_notify_or_timeout( "goal", 3 );
    wait 1;
    common_scripts\_exploder::exploder( 100 );
    earthquake( 0.5, 3, var_0.origin, 3000 );
    var_3 delete();
    var_0 thread maps\airplane_aud::aud_end_breach_sounds();
    level.player thread common_scripts\utility::play_loop_sound_on_entity( "end_wind_loop" );
    thread hull_breach_rumble( var_0, 1 );
    soundscripts\_snd::snd_message( "aud_add_wind_door_mix" );
    common_scripts\utility::flag_set( "exit_door_blown" );
}

freefall_camerashake()
{
    level notify( "stop_airplane_destabilize" );

    while ( !common_scripts\utility::flag( "plane_explodes" ) )
    {
        earthquake( 0.2, 0.05, level.player.origin, 80000 );
        wait 0.05;
    }

    for (;;)
    {
        earthquake( 0.35, 0.05, level.player.origin, 80000 );
        wait 0.05;
    }
}

aa_utility()
{

}

dialogue_move()
{
    common_scripts\utility::flag_wait( "bathroom_guy_dead" );
    wait 10;

    while ( !common_scripts\utility::flag( "player_approach_human_shield" ) )
    {
        sas_dialogue_random( "keepmoving" );
        wait(randomintrange( 10, 20 ));
    }
}

dialogue_clear()
{

}

sas_dialogue_random( var_0 )
{
    if ( level.peoplespeaking == 1 )
        return;

    var_1 = undefined;
    var_2 = undefined;
    var_3 = undefined;
    var_4 = 1;

    switch ( var_0 )
    {
        case "keepmoving":
            var_2 = "airplane_gaz_keepmoving_";
            var_3 = randomintrange( 1, level.dialoguemovelines + 1 );
            break;
        case "hostiledown":
            var_2 = "airplane_killfirm_";
            var_3 = randomintrange( 1, level.dialoguehostiledown + 1 );
            var_4 = can_say_hostiledown();
            break;
        case "areaclear":
            var_2 = "airplane_areaclear_";
            var_3 = randomintrange( 1, level.dialogueareaclear + 1 );
            break;
        default:
    }

    var_1 = var_2 + var_3;

    if ( var_4 == 1 )
        level thread maps\_utility::radio_dialogue_queue( var_1 );
}

can_say_hostiledown()
{
    if ( level.hostiledownbeingspoken == 1 )
        return 0;
    else
    {
        thread hostile_down_timer();
        return 1;
    }
}

hostile_down_timer()
{
    if ( level.hostiledownbeingspoken == 1 )
        return;

    level.hostiledownbeingspoken = 1;
    wait(level.timebetweenhostiledown);
    level.hostiledownbeingspoken = 0;
}

airmasks()
{
    var_0 = getentarray( "airmask", "targetname" );
    common_scripts\utility::array_thread( var_0, ::airmask_think );
    var_1 = getentarray( "airmask_breach", "targetname" );
    common_scripts\utility::array_thread( var_1, ::airmask_breach_think );
}

airmask_think()
{
    self.dummy = spawn( "script_origin", self.origin + ( 0.0, 0.0, 30.0 ) );
    self.dummy.angles = level.org_view_roll.angles;
    level.arollers = common_scripts\utility::array_add( level.arollers, self.dummy );
    self linkto( self.dummy );
    self.dummy movez( 45, 0.1 );
    self hide();
    common_scripts\utility::flag_wait( "fuselage_breached" );

    if ( getdvar( "airmasks" ) == "0" )
        return;

    self show();
    var_0 = randomfloatrange( 0.75, 1.2 );
    self.dummy movez( -55, var_0, var_0 / 3, var_0 / 3 );
    wait(var_0);
    self.dummy movez( 10, var_0 / 2 );
    wait(var_0 / 2);
    wait(randomfloatrange( 0.3, 0.9 ));
    var_1 = -0.5;

    for (;;)
    {
        wait 0.05;
        self.dummy movez( var_1, 0.05 );

        if ( var_1 == -0.5 )
        {
            var_1 = 0.5;
            continue;
        }

        var_1 = -0.5;
    }
}

airmask_breach_think()
{
    self.dummy = spawn( "script_origin", self.origin );
    self.dummy.angles = level.org_view_roll.angles;
    self linkto( self.dummy );
    self.dummy movez( 45, 0.1 );
    self hide();
    common_scripts\utility::flag_wait( "fuselage_breached" );

    if ( getdvar( "airmasks" ) == "0" )
        return;

    self show();
    var_0 = randomfloatrange( 0.75, 1.2 );
    self.dummy movez( -45, var_0, var_0 / 3, var_0 / 3 );
    wait(randomfloatrange( 0.3, 0.9 ));
    var_1 = -5;

    for (;;)
    {
        wait 0.05;
        self.dummy rotateroll( var_1, 0.05 );

        if ( var_1 == -5 )
        {
            var_1 = 5;
            continue;
        }

        var_1 = -5;
    }
}

obj_rescue_vip()
{
    common_scripts\utility::flag_wait( "obj_rescue_vip_given" );
    var_0 = 1;
    var_1 = getent( "obj_rescue_vip1", "targetname" );
    objective_add( var_0, "active", &"AIRPLANE_OBJ_RESCUE_VIP", var_1.origin );
    objective_current( var_0 );
    common_scripts\utility::flag_wait( "player_up_breach_stairs" );
    var_2 = getent( "obj_rescue_vip2", "targetname" );
    objective_position( var_0, var_2.origin );
    common_scripts\utility::flag_wait( "obj_rescue_vip_complete" );
    objective_state( var_0, "done" );
}

obj_freefall()
{
    common_scripts\utility::flag_wait( "obj_freefall_given" );
    var_0 = 2;
    var_1 = getent( "obj_freefall", "targetname" );
    objective_add( var_0, "active", &"AIRPLANE_OBJ_FREEFALL", var_1.origin );
    objective_current( var_0 );
    common_scripts\utility::flag_wait( "obj_freefall_complete" );
    objective_state( var_0, "done" );
}

weapon_detect()
{
    level endon( "enemies_alerted" );
    var_0 = getent( "intro_damage", "targetname" );
    var_0 waittill( "trigger" );

    if ( !common_scripts\utility::flag( "enemies_alerted" ) )
        common_scripts\utility::flag_set( "enemies_alerted" );
}

flashbang_detect()
{
    level endon( "enemies_alerted" );

    for (;;)
    {
        wait 0.05;
        var_0 = getentarray( "grenade", "classname" );

        for ( var_1 = 0; var_1 < var_0.size; var_1++ )
        {
            if ( var_0[var_1].model == "projectile_us_smoke_grenade" || var_0[var_1].model == "projectile_m84_flashbang_grenade" )
            {
                wait 2;

                if ( !common_scripts\utility::flag( "enemies_alerted" ) )
                    common_scripts\utility::flag_set( "enemies_alerted" );
            }
        }
    }
}

player_breach_jump()
{
    level.player endon( "death" );
    common_scripts\utility::flag_wait( "player_breach_jump" );
    level notify( "mission failed" );
    thread white_flash( 0.35 );
    var_0 = getent( "plane_shell", "targetname" );
    var_0 show();
    var_1 = getent( "plane_wings", "targetname" );
    var_1 hide();
    thread killtimer();
    level notify( "kill_timer" );
    setdvar( "ui_deadquote", &"AIRPLANE_FAILED_JUMPED_OUT" );
    maps\_utility::missionfailedwrapper();
    level.player kill();
}

no_grenade_death_hack()
{
    for (;;)
    {
        anim.nextcornergrenadedeathtime = gettime() + 300000;
        wait 60;
    }
}

gravity_shift( var_0 )
{
    level endon( "stop_gravity_shift" );
    setsaveddvar( "phys_gravityChangeWakeupRadius", 1600 );

    if ( isdefined( var_0 ) )
    {
        var_1 = ( 0, 0, var_0 );
        var_2 = maps\_utility::vector_multiply( anglestoup( var_1 ), -1 );
        var_3 = maps\_utility::vector_multiply( anglestoright( var_1 ), 0.25 );
        var_4 = var_2 + var_3;
        setphysicsgravitydir( var_4 );
    }
}

gravity_shift2( var_0 )
{
    level endon( "stop_gravity_shift" );
    setsaveddvar( "phys_gravityChangeWakeupRadius", 1600 );

    if ( isdefined( var_0 ) )
    {
        var_1 = ( 0, 0, var_0 );
        var_2 = maps\_utility::vector_multiply( anglestoup( var_1 ), -1 );
        var_3 = maps\_utility::vector_multiply( anglestoright( var_1 ), 0.25 );
        var_4 = var_2 + var_3;
        setphysicsgravitydir( var_4 );
    }

    for (;;)
    {
        wait 0.05;
        var_2 = maps\_utility::vector_multiply( anglestoup( level.org_view_roll.angles ), -1 );
        var_3 = maps\_utility::vector_multiply( anglestoright( level.org_view_roll.angles ), 0.25 );
        var_4 = var_2 + var_3;
        setphysicsgravitydir( var_4 );
    }
}

create_playerview( var_0 )
{
    if ( isdefined( level.eplayerview ) )
        level.eplayerview delete();

    level.eplayerview = maps\_utility::spawn_anim_model( "player_view" );
    level.eplayerview hide();
    level.eplayerview.origin = var_0.origin;
    level.eplayerview.angles = var_0.angles;
    level.eplayerview linkto( var_0 );
}

door_open_double( var_0 )
{
    var_1 = undefined;
    var_2 = undefined;
    var_3 = undefined;
    var_4 = undefined;
    var_5 = undefined;

    for ( var_6 = 0; var_6 < var_0.size; var_6++ )
    {
        var_7 = var_0[var_6];

        switch ( var_7.script_noteworthy )
        {
            case "left":
                var_1 = var_7;
                continue;
            case "right":
                var_2 = var_7;
                continue;
            case "left_door_model":
                var_3 = var_7;
                continue;
            case "right_door_model":
                var_4 = var_7;
                continue;
            case "door_fx":
                var_5 = var_7;
                continue;
        }
    }

    var_3 linkto( var_1 );
    var_4 linkto( var_2 );
    thread common_scripts\utility::play_sound_in_space( "wood_door_kick", var_5.origin );
    playfx( common_scripts\utility::getfx( "door_kick_dust" ), var_5.origin );
    var_8 = 0.6;
    var_1 rotateyaw( -165, var_8, 0, var_8 / 2 );
    var_2 rotateyaw( 175, var_8, 0, var_8 / 2 );
    var_1 connectpaths();
    var_2 connectpaths();
    var_1 movex( 2, var_8 );
    var_2 movex( 2, var_8 );
}

bathroom_door_open( var_0, var_1 )
{
    thread bathroom_dude_clear();
    var_2 = getent( "blocker_bathroom_door", "targetname" );
    var_2 hide();
    var_2 notsolid();
    var_2 connectpaths();
    var_3 = getent( var_0, "targetname" );
    var_4 = getent( var_1, "targetname" );
    var_5 = getent( var_0 + "_model", "targetname" );
    var_6 = getent( var_1 + "_model", "targetname" );
    var_5 linkto( var_3 );
    var_6 linkto( var_4 );
    thread common_scripts\utility::play_sound_in_space( "airplane_bathroom_door_open", var_3.origin );
    var_7 = 1;
    var_3 rotateyaw( 90, var_7, var_7 / 2, var_7 / 2 );
    var_3 movey( 1, var_7 );
    var_3 connectpaths();
    var_4 rotateyaw( -90, var_7, var_7 / 2, var_7 / 2 );
    var_4 connectpaths();
    var_4 movex( 25, var_7 );
    wait 2;
    common_scripts\utility::flag_wait( "bathroom_dude_clear" );
    var_8 = getent( "bathroom_volume", "targetname" );
    badplace_brush( "badplace_bathroom", 0, var_8, "allies", "axis" );

    for (;;)
    {
        wait 0.05;

        if ( !level.player istouching( var_8 ) )
            break;
    }

    thread common_scripts\utility::play_sound_in_space( "airplane_bathroom_door_close", var_3.origin );
    var_2 show();
    var_2 solid();
    var_2 disconnectpaths();
    var_3 rotateyaw( -90, var_7, var_7 / 2, var_7 / 2 );
    var_3 disconnectpaths();
    var_4 rotateyaw( 90, var_7, var_7 / 2, var_7 / 2 );
    var_4 disconnectpaths();
    var_4 movex( -25, var_7 );
    badplace_delete( "badplace_bathroom" );
}

bathroom_dude_clear()
{
    var_0 = getent( "bathroom_dude_clear", "targetname" );

    while ( !common_scripts\utility::flag( "bathroom_dude_clear" ) )
    {
        var_0 waittill( "trigger", var_1 );

        if ( isdefined( var_1 ) && var_1 == level.hostile_bathroom )
            common_scripts\utility::flag_set( "bathroom_dude_clear" );
    }
}

airplane_destabilize()
{
    level endon( "stop_airplane_destabilize" );
    common_scripts\utility::flag_wait( "fuselage_breached" );

    for (;;)
    {
        earthquake( 0.15, 0.05, level.player.origin, 80000 );
        wait 0.05;
    }
}

fx_management()
{
    level.fxexitdoor = maps\_utility::getfxarraybyid( "exit_door_dust" );
    level.fxexitdoor = common_scripts\utility::array_combine( level.fxexitdoor, maps\_utility::getfxarraybyid( "exit_door_wind_suck" ) );
    wait 0.5;
    common_scripts\utility::array_thread( level.fxexitdoor, common_scripts\utility::pauseeffect );
}

timer_start()
{
    maps\_gameskill::updategameskill();

    if ( getdvar( "notimer" ) == "1" )
        return;

    var_0 = undefined;
    var_1 = undefined;

    switch ( level.gameskill )
    {
        case 0:
            var_1 = 180;
            break;
        case 1:
            var_1 = 150;
            break;
        case 2:
            var_1 = 105;
            break;
        case 3:
            var_1 = 60;
            break;
    }

    level thread timer_logic( var_1, &"AIRPLANE_TIME_TO_LOCATE_VIP" );
    level.timer_start_time = gettime();
}

timer_logic( var_0, var_1, var_2 )
{
    if ( getdvar( "notimer" ) == "1" )
        return;

    if ( !isdefined( var_2 ) )
        var_2 = 0;

    killtimer();
    level endon( "kill_timer" );
    level.hudtimerindex = 20;
    level.timer = maps\_hud_util::get_countdown_hud( undefined, undefined, undefined, undefined, var_0 );
    level.timer setpulsefx( 30, 900000, 700 );
    level.timer.text.label = var_1;
    level.timer settenthstimer( var_0 );
    level.start_time = gettime();

    if ( var_2 == 1 )
        thread timer_tick();

    wait(var_0);
    common_scripts\utility::flag_set( "timer_expired" );
    thread kill_all_ai();
    maps\_hud_util::destroy_countdown_hud( level.timer );
    level thread mission_failed_out_of_time( &"AIRPLANE_TIMER_EXPIRED" );
}

hostage_timer_cleanup()
{
    common_scripts\utility::flag_wait_either( "terrorist_killed", "terrorist_wounded" );
    killtimer();
}

hostage_timer( var_0 )
{
    if ( getdvar( "notimer" ) == "1" )
        return;

    if ( isdefined( level.start_time ) )
    {
        level.timetoreachvip = ( gettime() - level.start_time ) / 1000;
        level.timetovipmessage = "Airplane - difficulty " + level.gameskill + ": Time to hostage sequence: ( " + level.timetoreachvip + " seconds )";

        if ( getdvar( "airplane_debug" ) == "1" )
        {

        }
    }

    if ( level.gameskill != 3 )
        thread maps\_utility::autosave_now( 1 );

    level endon( "human_shield_over" );
    killtimer();
    level endon( "kill_timer" );
    level.hudtimerindex = 20;
    level.timer = maps\_hud_util::get_countdown_hud( undefined, undefined, undefined, undefined, var_0 );
    level.timer setpulsefx( 30, 900000, 700 );
    level.timer.text.label = &"AIRPLANE_TIME_TILL_HOSTAGE_KILL";
    level.timer settenthstimer( var_0 );
    level.start_time = gettime();
    thread hostage_timer_cleanup();
    thread timer_tick();
    wait(var_0 + 0.15);
    common_scripts\utility::flag_set( "hostage_timer_expired" );
    maps\_hud_util::destroy_countdown_hud( level.timer );
    level thread mission_failed_out_of_time( &"AIRPLANE_HOSTAGE_TIMER_EXPIRED" );
}

timer_tick()
{
    level endon( "stop_timer_tick" );
    level endon( "kill_timer" );

    for (;;)
    {
        wait 1;
        level.player thread maps\_utility::play_sound_on_entity( "countdown_beep" );
        level notify( "timer_tick" );
    }
}

mission_failed_out_of_time( var_0 )
{
    level.player endon( "death" );
    level endon( "kill_timer" );
    level notify( "mission failed" );
    level.player freezecontrols( 1 );
    level.player thread player_death_effect();
    level.player thread maps\_utility::play_sound_on_entity( "airplane_final_explosion" );
    musicstop( 1 );
    setdvar( "ui_deadquote", var_0 );
    thread timer_death_hud();
    maps\_utility::missionfailedwrapper();
    level notify( "kill_timer" );
}

timer_death_hud()
{
    soundscripts\_snd::snd_message( "mission_failed_fade_out" );
    var_0 = newclienthudelem( level.player );
    var_0.x = 0;
    var_0.y = 15;
    var_0 setshader( "hud_death_timeout", 50, 50 );
    var_0.alignx = "center";
    var_0.aligny = "middle";
    var_0.horzalign = "center";
    var_0.vertalign = "middle";
    var_0.foreground = 1;
    var_0.alpha = 0;
    wait 0.65;
    var_0 fadeovertime( 1 );
    var_0.alpha = 1;
}

player_death_effect()
{
    var_0 = level.player;
    playfx( level._effect["player_death_explosion"], var_0.origin );
    earthquake( 1, 1, level.player.origin, 100 );
}

killtimer()
{
    level notify( "kill_timer" );

    if ( isdefined( level.timer ) )
        maps\_hud_util::destroy_countdown_hud( level.timer );
}

ai_think( var_0 )
{
    if ( isdefined( var_0.script_parameters ) && var_0.script_parameters == "scripted" )
        return;

    if ( var_0.team == "axis" )
        var_0 thread ai_axis_think();

    if ( var_0.team == "allies" )
        var_0 thread ai_allies_think();
}

ai_allies_think()
{
    self.animname = "frnd";
    maps\_utility::setflashbangimmunity( 1 );
    maps\_utility::enable_cqbwalk();
    maps\_utility::disable_bulletwhizbyreaction();
    self.disablefriendlyfirereaction = 1;

    if ( !isdefined( self.magic_bullet_shield ) )
        thread maps\_utility::magic_bullet_shield();

    self.a.disablepain = 1;

    switch ( level.gameskill )
    {
        case 0:
            break;
        case 1:
            break;
        case 2:
            break;
        case 3:
            break;
    }
}

ai_civilian_think()
{
    var_0 = getent( self.target, "targetname" );
    var_1 = var_0.script_noteworthy;
    var_2 = maps\_vehicle_aianim::convert_guy_to_drone( self );
    var_2.allowdeath = 0;
    var_2.nofriendlyfire = 1;
    maps\_vehicle_aianim::detach_models_with_substr( var_2, "weapon_" );
    var_2.ignoreme = 1;

    if ( !isdefined( var_2.magic_bullet_shield ) )
        var_2 thread maps\_utility::magic_bullet_shield();

    var_0 thread maps\_anim::anim_generic_loop( var_2, var_1, undefined, "stop_idle" );
}

ai_patroller()
{
    self endon( "death" );
    thread ai_patroller_damage();
    thread ai_patroller_death();
    level endon( "enemies_alerted" );

    while ( !common_scripts\utility::flag( "enemies_alerted" ) )
    {
        wait 0.05;

        if ( common_scripts\utility::flag( "enemies_alerted" ) )
            break;

        maps\jake_tools::waittill_player_in_range( self.origin, level.sightdetectdistance );

        if ( common_scripts\utility::flag( "enemies_alerted" ) )
            break;

        if ( self cansee( level.player ) )
        {
            if ( !common_scripts\utility::flag( "enemies_alerted" ) )
                common_scripts\utility::flag_set( "enemies_alerted" );
        }

        if ( distance( self.origin, level.player.origin ) <= level.alertdistance )
        {
            if ( bullettracepassed( level.player geteye(), self.origin + ( 0.0, 0.0, 48.0 ), 0, undefined ) )
            {
                if ( !common_scripts\utility::flag( "enemies_alerted" ) )
                    common_scripts\utility::flag_set( "enemies_alerted" );
            }
        }
    }
}

ai_patroller_damage()
{
    level endon( "enemies_alerted" );
    self endon( "death" );
    self waittill( "damage" );

    if ( !common_scripts\utility::flag( "enemies_alerted" ) )
        common_scripts\utility::flag_set( "enemies_alerted" );
}

ai_patroller_death()
{
    level endon( "enemies_alerted" );
    self waittill( "death" );

    if ( !common_scripts\utility::flag( "enemies_alerted" ) )
        common_scripts\utility::flag_set( "enemies_alerted" );
}

ai_axis_think()
{
    self.animname = "hostile";
    thread ai_flashbang_detect();

    if ( !common_scripts\utility::flag( "player_approach_human_shield" ) )
        thread ai_axis_death_think();
}

ai_axis_death_think()
{
    if ( isdefined( level.hostile_bathroom ) && self == level.hostile_bathroom )
        return;

    self waittill( "death" );
    wait 1;

    if ( level.firstaxiskilled == 0 )
    {
        level.firstaxiskilled = 1;
        level thread maps\_utility::radio_dialogue_queue( "airplane_first_hostile_killed_1" );
    }
    else
        level thread sas_dialogue_random( "hostiledown" );
}

ai_flashbang_detect()
{
    self endon( "death" );

    if ( common_scripts\utility::flag( "enemies_alerted" ) )
        return;

    self waittill( "flashbang" );

    if ( !common_scripts\utility::flag( "enemies_alerted" ) )
        common_scripts\utility::flag_set( "enemies_alerted" );
}

ai_drone_think()
{

}

initprecache()
{
    precacheshellshock( "nosound" );
    precachestring( &"AIRPLANE_TIME_TILL_EXPLOSION" );
    precachestring( &"AIRPLANE_TIME_TO_LOCATE_VIP" );
    precachestring( &"AIRPLANE_TIMER_EXPIRED" );
    precachestring( &"AIRPLANE_FAILED_JUMPED_OUT" );
    precachestring( &"AIRPLANE_OBJ_RESCUE_VIP" );
    precachestring( &"AIRPLANE_OBJ_FREEFALL" );
    precachestring( &"AIRPLANE_TIME_TILL_HOSTAGE_KILL" );
    precachestring( &"AIRPLANE_HOSTAGE_NO_HEADSHOT" );
    precachestring( &"AIRPLANE_CAMPAIGN_COMPLETED" );
    precachemodel( "viewhands_player_usmc" );
    precachemodel( "worldbody_h1_sas_ct" );
    precacheitem( "facemask" );
    precacheshader( "black" );
    precacheshader( "white" );
    precacheshader( "h1_hud_timer_blur" );
    precacheshader( "h1_hud_timer_border" );
    precacheshader( "h1_timer_on_flare" );
    precacheshader( "h1_timer_warning_flare" );
    precacheshader( "hud_death_timeout" );
    precacherumble( "generic_attack_heavy_1500" );
    precacherumble( "breach_loop" );
    precacherumble( "generic_quake_loop" );
    precacherumble( "generic_ambient_loop" );
    precacherumble( "generic_attack_light_500" );
}

disable_color_trigs()
{
    common_scripts\utility::array_thread( level.acolornodetriggers, common_scripts\utility::trigger_off );
}

initfriendlies( var_0 )
{
    waittillframeend;
    level.squad = [];
    level.price = maps\_utility::spawn_script_noteworthy( "price" );
    level.grigsby = maps\_utility::spawn_script_noteworthy( "grigsby" );
    level.grigsby character\gfl\randomizer_sas::main();
    level.macey = maps\_utility::spawn_script_noteworthy( "macey" );
    level.squad[0] = level.price;
    level.squad[1] = level.grigsby;
    level.squad[2] = level.macey;

    for ( var_1 = 0; var_1 < level.squad.size; var_1++ )
    {
        level.squad[var_1].a.bdisablemovetwitch = 1;
        level.squad[var_1].usemuzzleforaim = 1;
    }

    var_2 = level.squad;
    var_3 = getnodearray( "nodeStart_" + var_0, "targetname" );
    var_4 = 0;
    var_5 = undefined;

    while ( var_4 < 4 )
    {
        wait 0.05;

        for ( var_1 = 0; var_1 < var_3.size; var_1++ )
        {
            if ( isdefined( var_3[var_1].script_noteworthy ) )
            {
                switch ( var_3[var_1].script_noteworthy )
                {
                    case "nodePrice":
                        level.price maps\jake_tools::start_teleport( var_3[var_1] );
                        var_2 = common_scripts\utility::array_remove( var_2, level.price );
                        var_3 = common_scripts\utility::array_remove( var_3, var_3[var_1] );
                        var_4++;
                        continue;
                    case "nodeGrigsby":
                        level.grigsby maps\jake_tools::start_teleport( var_3[var_1] );
                        var_2 = common_scripts\utility::array_remove( var_2, level.grigsby );
                        var_3 = common_scripts\utility::array_remove( var_3, var_3[var_1] );
                        var_4++;
                        continue;
                    case "nodeMacey":
                        level.macey maps\jake_tools::start_teleport( var_3[var_1] );
                        var_2 = common_scripts\utility::array_remove( var_2, level.macey );
                        var_3 = common_scripts\utility::array_remove( var_3, var_3[var_1] );
                        var_4++;
                        continue;
                    case "nodePlayer":
                        var_5 = var_3[var_1];
                        var_3 = common_scripts\utility::array_remove( var_3, var_3[var_1] );
                        var_4++;
                        continue;
                    default:
                        continue;
                }
            }
        }
    }

    common_scripts\utility::flag_wait( "intro_fade_in_complete" );
    level.player setorigin( var_5.origin );
    level.player setplayerangles( var_5.angles );
}

demo_setup()
{
    common_scripts\utility::flag_init( "heroes_ready" );
    common_scripts\utility::flag_init( "part1" );
    common_scripts\utility::flag_init( "part2" );
    common_scripts\utility::flag_init( "part3" );
    common_scripts\utility::flag_init( "part4" );
    common_scripts\utility::flag_init( "part5" );
    common_scripts\utility::flag_set( "part1" );
    common_scripts\utility::flag_set( "part2" );
    common_scripts\utility::flag_set( "part3" );
    common_scripts\utility::flag_set( "part4" );
    common_scripts\utility::flag_set( "part5" );
    var_0 = getent( "demo_spawners", "target" );
    var_0 notify( "trigger" );
    wait 0.1;
    var_1 = getaiarray( "allies" );
    level.heroes = [];

    for ( var_2 = 0; var_2 < var_1.size; var_2++ )
    {
        switch ( var_1[var_2].script_noteworthy )
        {
            case "demo_alavi":
                level.heroes["alavi"] = var_1[var_2];
                continue;
            case "demo_price":
                level.heroes["price"] = var_1[var_2];
                continue;
            case "demo_grigsby":
                level.heroes["grigsby"] = var_1[var_2];
                continue;
        }
    }

    maps\_utility::battlechatter_off();
    common_scripts\utility::flag_set( "heroes_ready" );
}

demo_walkthrough()
{
    common_scripts\utility::flag_wait( "heroes_ready" );
    var_0 = getarraykeys( level.heroes );

    for ( var_1 = 0; var_1 < var_0.size; var_1++ )
    {
        var_2 = var_0[var_1];
        level.heroes[var_2] maps\_utility::enable_cqbwalk();
        level.heroes[var_2].interval = 60;
        level.heroes[var_2].disableexits = 1;
    }

    var_3 = [];
    var_3["alavi"] = 0.85;
    var_3["grigsby"] = 0;
    var_3["price"] = 0.5;
    thread hallways_heroes( "part1", "nothing", undefined, var_3 );
    wait 4.25;
    level.heroes["price"] maps\_utility::handsignal( "onme" );
}

hallways_heroes( var_0, var_1, var_2, var_3, var_4 )
{
    if ( !isdefined( var_2 ) )
    {
        var_2 = [];
        var_2["alavi"] = undefined;
        var_2["grigsby"] = undefined;
        var_2["price"] = undefined;
    }

    if ( !isdefined( var_4 ) )
    {
        var_4 = [];
        var_4["alavi"] = undefined;
        var_4["grigsby"] = undefined;
        var_4["price"] = undefined;
    }

    if ( !isdefined( var_3 ) )
    {
        var_3 = [];
        var_3["alavi"] = 0;
        var_3["grigsby"] = 1;
        var_3["price"] = 2;
    }

    var_5 = getarraykeys( level.heroes );

    for ( var_6 = 0; var_6 < var_5.size; var_6++ )
    {
        var_7 = var_5[var_6];
        level.heroes[var_7] maps\_utility::delaythread( var_3[var_7], ::hallways_heroes_solo, var_0, var_1, var_2[var_7], var_4[var_7] );
    }

    level endon( var_1 );
    maps\_utility::array_wait( level.heroes, "hallways_heroes_ready" );
    common_scripts\utility::flag_wait( var_0 );
}

hallways_heroes_solo( var_0, var_1, var_2, var_3 )
{
    self pushplayer( 1 );
    level endon( var_1 );
    var_4 = getnodearray( var_0, "targetname" );
    var_5 = undefined;

    for ( var_6 = 0; var_6 < var_4.size; var_6++ )
    {
        if ( var_4[var_6].script_noteworthy == self.script_noteworthy )
        {
            var_5 = var_4[var_6];
            break;
        }
    }

    while ( isdefined( var_5 ) )
    {
        self setgoalnode( var_5 );

        if ( var_5.radius )
            self.goalradius = var_5.radius;
        else
            self.goalradius = 80;

        if ( isdefined( var_3 ) )
        {
            var_7 = 1;

            if ( isdefined( self.disableexits ) && self.disableexits == 1 )
                var_7 = 0;

            self.disableexits = 1;
            var_8 = undefined;

            if ( var_3 == "stand2run180" )
                var_8 = self;
            else if ( isdefined( self.node ) && distance( self.node.origin, self.origin ) < 4 )
                var_8 = self.node;
            else if ( isdefined( self.goodnode ) && distance( self.goodnode.origin, self.origin ) < 4 )
                var_8 = self.goodnode;
            else
                var_8 = self;

            var_9 = spawn( "script_origin", var_8.origin );
            var_9.angles = var_8.angles;
            self.hackexit = var_9;

            if ( var_3 == "stand2run180" )
                var_9.angles += ( 0.0, 32.0, 0.0 );

            if ( var_8 != self )
            {
                if ( issubstr( var_3, "cornerleft" ) )
                    var_9.angles += ( 0.0, 90.0, 0.0 );
                else if ( issubstr( var_3, "cornerright" ) )
                    var_9.angles -= ( 0.0, 90.0, 0.0 );
            }

            self.animname = "guy";
            var_10 = getanimlength( level.scr_anim[self.animname][var_3] );
            var_9 thread maps\_anim::anim_single_solo( self, var_3 );
            wait(var_10 - 0.2);
            self stopanimscripted();
            var_9 delete();
            var_3 = undefined;

            if ( var_7 )
                self.disableexits = 0;
        }

        self waittill( "goal" );

        if ( isdefined( var_5.script_parameters ) )
        {
            var_11 = strtok( var_5.script_parameters, ":;, " );

            for ( var_12 = 0; var_12 < var_11.size; var_12++ )
            {
                switch ( var_11[var_12] )
                {
                    case "disable_cqb":
                        if ( isdefined( var_5.target ) )
                            disable_cqbwalk_ign_demo_wrapper();
                        else
                            maps\_utility::delaythread( 1.5, ::disable_cqbwalk_ign_demo_wrapper );

                        continue;
                    case "enable_cqb":
                        if ( isdefined( var_5.target ) )
                            enable_cqbwalk_ign_demo_wrapper();
                        else
                            maps\_utility::delaythread( 1.5, ::enable_cqbwalk_ign_demo_wrapper );

                        continue;
                }
            }
        }

        if ( isdefined( var_5.target ) )
        {
            var_5 = getnode( var_5.target, "targetname" );
            continue;
        }

        var_5 = undefined;
    }

    self notify( "hallways_heroes_ready" );
}

decanim( var_0 )
{
    while ( self.animplaybackrate != var_0 )
    {
        self.animplaybackrate -= 0.05;
        wait 0.1;
    }
}

disable_cqbwalk_ign_demo_wrapper()
{
    maps\_utility::disable_cqbwalk();
    self.interval = 96;
}

enable_cqbwalk_ign_demo_wrapper()
{
    maps\_utility::enable_cqbwalk();
    self.interval = 50;
}

addgasmaskcracks()
{
    var_0 = 250;
    var_1 = getent( "breach_physics", "targetname" );

    if ( distancesquared( level.player.origin, var_1.origin ) < var_0 * var_0 )
    {
        level.maskcracksfx = spawnfx( level._effect["goggles_cracks"], level.player.origin );
        triggerfx( level.maskcracksfx );
        level.player thread maps\_utility::play_sound_on_entity( "scn_airplane_explosion_mask_crack" );
    }
}

airplane_wibble_setup()
{
    level endon( "game_ended" );
    maps\_wibble::set_cloth_wibble( 0.0 );

    for (;;)
    {
        if ( common_scripts\utility::flag( "fuselage_breached" ) )
            maps\_wibble::set_cloth_wibble( 0.5 );
        else
            maps\_wibble::set_cloth_wibble( 0.0 );

        wait 0.1;
    }
}
