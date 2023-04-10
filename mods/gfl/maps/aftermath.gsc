// H1 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

dead_script()
{
    common_scripts\_ca_blockout::init();
    maps\aftermath_fx::main();
    maps\createart\aftermath_art::main();
    maps\aftermath_precache::main();
    maps\_load::main();
    thread maps\aftermath_amb::main();
    maps\aftermath_lighting::main();
    thread maps\aftermath_anim::main();
    maps\aftermath_wobblers::main();
    level thread radio_chatter();
    setup_dead_bodies();
    common_scripts\utility::flag_init( "fall" );
    common_scripts\utility::flag_init( "collapse" );
    common_scripts\utility::flag_init( "collapse_done" );
    level.ground_ref_ent = spawn( "script_model", ( 0.0, 0.0, 0.0 ) );
    level.player playersetgroundreferenceent( level.ground_ref_ent );
    building_collapse_h1();
    player_start();
}

player_start()
{
    var_0 = ( -989.0, 8433.0, 666.0 );
    var_1 = ( -18.0, 25.0, 0.0 );
    level.player setstance( "prone" );
    level.player setorigin( var_0 );
    level.player setplayerangles( var_1 );
}

main()
{
    if ( getdvar( "beautiful_corner" ) == "1" )
    {
        dead_script();
        return;
    }

    maps\aftermath_fx::main();
    maps\createart\aftermath_art::main();
    level.start_point = "default";
    level.weaponclipmodels = [];
    level.playerbreathalias = "h1_plr_breath_injured_low";
    thread hud_hide();
    maps\aftermath_precache::main();
    maps\_load::main();
    thread maps\aftermath_amb::main();
    maps\aftermath_lighting::main();
    maps\aftermath_aud::main();
    thread maps\aftermath_wobblers::main();
    thread maps\aftermath_anim::main();
    setup_dead_bodies();
    precacheshellshock( "slowview" );
    precacheshellshock( "aftermath" );
    precacheshellshock( "aftermath_fall" );
    precacheshader( "overlay_hunted_black" );
    precacheshader( "overlay_hunted_white" );
    precachemodel( "com_airduct_square" );
    common_scripts\utility::flag_init( "awake" );
    common_scripts\utility::flag_init( "fall" );
    common_scripts\utility::flag_init( "fall_complete" );
    common_scripts\utility::flag_init( "collapse" );
    common_scripts\utility::flag_init( "collapse_done" );
    maps\_utility::flag_trigger_init( "radiation_death", getent( "death_point", "targetname" ) );
    common_scripts\utility::flag_init( "helicopterfall_bodysense" );
    level.allow_fall = 1;

    if ( getdvarint( "aftermath_body_sense", 1 ) != 1 )
        setup_force_fall();

    level.player_speed = 50;
    level.ground_ref_ent = spawn( "script_model", ( 0.0, 0.0, 0.0 ) );
    level.player playersetgroundreferenceent( level.ground_ref_ent );
    level.player thread player_speed_over_time();
    level.player thread player_heartbeat();
    level thread countdown_to_death();
    level.player thread radiation_death();
    level thread radio_chatter();
    level.player allowsprint( 0 );
    level thread slowview();
    thread building_collapse_h1();

    if ( getdvarint( "aftermath_body_sense", 1 ) == 1 )
        body_sense_init();

    player_wakeup();
    level common_scripts\utility::flag_wait( "awake" );

    if ( getdvarint( "aftermath_body_sense", 1 ) == 1 )
        setup_force_fall();

    level.player allowjump( 0 );
    level.player thread limp();
    level thread playground();
    maps\_wibble::setup_wibble_triggers( 0, "awake", "interior", 0, 1 );
    maps\_wibble::set_cloth_wibble( 0.0 );
}

setup_dead_bodies()
{
    level.dead_bodies_ignore_ragdoll_settings = 1;
    level.scr_deadbody[1] = character\character_sp_usmc_james::main;
    level.scr_deadbody[2] = character\character_sp_usmc_ryan::main;
    level.scr_deadbody[3] = character\character_sp_usmc_zach::main;
    level.scr_deadbody[4] = character\character_sp_pilot_velinda_desert::main;
    maps\_deadbody::main();
}

playground()
{
    var_0 = getent( "playground", "targetname" );
    var_0 waittill( "trigger" );
    common_scripts\utility::play_sound_in_space( "playground_memory", var_0.origin );
}

slowview()
{
    for (;;)
    {
        level waittill( "slowview", var_0 );

        if ( isdefined( var_0 ) )
            wait(var_0);

        thread restart_slowview();
        level.player shellshock( "slowview", 15 );
    }
}

restart_slowview()
{
    level endon( "slowview" );
    wait 10;
    level notify( "slowview" );
}

radio_chatter()
{
    thread common_scripts\utility::play_sound_in_space( "snc_intro_stinger", ( 0.0, 0.0, 0.0 ) );
    var_0 = ( -1144.0, 8506.0, 660.3 );
    wait 4;
    soundscripts\_audio_mix_manager::mm_clear_submix( "mix_intro_stinger" );
    thread maps\aftermath_aud::aud_player_dying_slowly();
    thread common_scripts\utility::play_sound_in_space( "aftermath_mmr_romeo_ext", var_0 );
    common_scripts\utility::play_sound_in_space( "aftermath_mmr_romeo", var_0 );
    wait 3;
    thread common_scripts\utility::play_sound_in_space( "aftermath_fmr_epicenter_ext", var_0 );
    common_scripts\utility::play_sound_in_space( "aftermath_fmr_epicenter", var_0 );
    thread common_scripts\utility::play_sound_in_space( "aftermath_fmr_evacuation_ext", var_0 );
    common_scripts\utility::play_sound_in_space( "aftermath_fmr_evacuation", var_0 );
    thread common_scripts\utility::play_sound_in_space( "aftermath_fmr_contcenters_ext", var_0 );
    common_scripts\utility::play_sound_in_space( "aftermath_fmr_contcenters", var_0 );
    thread common_scripts\utility::play_sound_in_space( "aftermath_fmr_dosimeter_ext", var_0 );
    common_scripts\utility::play_sound_in_space( "aftermath_fmr_dosimeter", var_0 );
    thread common_scripts\utility::play_sound_in_space( "aftermath_fmr_elevatedlevels_ext", var_0 );
    common_scripts\utility::play_sound_in_space( "aftermath_fmr_elevatedlevels", var_0 );
}

countdown_to_death()
{
    level endon( "dying" );
    var_0 = getent( "outside", "targetname" );
    var_0 maps\_utility::wait_for_trigger_or_timeout( 50 );
    wait 30;

    if ( !common_scripts\utility::flag( "collapse_done" ) )
    {
        var_1 = getent( "raze", "targetname" );
        var_1 notify( "trigger" );
        common_scripts\utility::flag_wait_or_timeout( "collapse_done", 10 );
    }

    wait 15;
    common_scripts\utility::flag_set( "radiation_death" );
}

objective()
{
    common_scripts\utility::flag_wait( "awake" );
    wait 4;
    var_0 = getent( "radiac_equipment", "targetname" );
    objective_add( 1, "active", &"AFTERMATH_OBJ_OFFICER", var_0.origin );
    objective_current( 1 );
    var_1 = getent( "officer", "targetname" );
    var_1 waittill( "trigger" );
    objective_state( 1, "done" );
    level.player thread player_jump_punishment();
    wait 3;
    var_0 = getent( "overhead_cover", "targetname" );
    objective_add( 2, "active", &"AFTERMATH_OBJ_SECURE_COVER", var_0.origin );
    objective_current( 2 );
    var_1 = getent( "death_point", "targetname" );
    var_1 waittill( "trigger" );
    var_2 = cos( 30 );

    while ( !common_scripts\utility::within_fov( level.player.origin, level.player getplayerangles(), var_0.origin, var_2 ) )
        wait 0.05;

    level.player radiation_death();
}

radiation_death()
{
    common_scripts\utility::flag_wait( "radiation_death" );
    soundscripts\_snd::snd_message( "aud_start_mix_player_dying" );
    level notify( "dying" );
    thread hud_hide();
    level.player setstance( "prone" );
    setblur( 0, 0.5 );
    level.player freezecontrols( 1 );
    level.player thread maps\_utility::play_sound_on_entity( "h1_plr_fall_near_death_sfx" );
    level.ground_ref_ent thread stumble( ( 20.0, 10.0, 30.0 ), 0.2, 1.5, 1 );
    wait 0.2;
    level waittill( "recovered" );
    level.player playrumbleonentity( "grenade_rumble" );
    level.player allowstand( 0 );
    level.player allowcrouch( 0 );
    var_0 = level.player getplayerangles();
    var_1 = adjust_angles_to_player( ( 0, 90 - var_0[1], -25 - var_0[0] ) );
    level.ground_ref_ent rotateto( var_1, 6, 3, 1 );
    wait 4.5;
    var_2 = getent( "collapse_extra", "targetname" );
    var_2 notify( "trigger", 1 );
    level notify( "aftermath_lighting_glow", 6 );
    wait 3;
    level notify( "stop_heart" );
    var_3 = create_overlay_element( "overlay_hunted_white", 0 );
    var_3 fadeovertime( 5 );
    var_3.alpha = 1;
    wait 5;
    setsaveddvar( "hud_showStance", 0 );
    maps\_utility::nextmission();
}

building_collapse_h1()
{
    level.collapse_delay_min = 2;
    level.collapse_delay_mid = 4;
    level.collapse_delay_max = 8;
    thread building_collapse_back();
    thread building_collapse_side();
    thread building_collapse_extra();
}

building_collapse_back()
{
    common_scripts\utility::flag_init( "building_collapse_back" );
    level endon( "building_collapse_side" );
    var_0 = getent( "collapse_back", "targetname" );
    var_0 waittill( "trigger" );
    building_collapse_wait_for_ready( "collapse_center_2" );
    building_collapse_active( "building_collapse_back" );
    building_collapse_explode( 2 );
    wait(randomintrange( level.collapse_delay_min, level.collapse_delay_mid ));
    building_collapse_explode( 5 );
    wait(randomintrange( level.collapse_delay_mid, level.collapse_delay_max ));
    building_collapse_explode( 4 );
    building_collapse_complete( "building_collapse_back" );
}

building_collapse_explode( var_0 )
{
    common_scripts\_exploder::exploder( var_0 );
    level notify( "building_collapse", var_0 );
}

building_collapse_side()
{
    common_scripts\utility::flag_init( "building_collapse_side" );
    level endon( "building_collapse_back" );
    var_0 = getent( "collapse_side", "targetname" );
    var_0 waittill( "trigger" );
    building_collapse_wait_for_ready( "collapse_center_4" );
    building_collapse_active( "building_collapse_side" );
    building_collapse_explode( 4 );
    wait(randomintrange( level.collapse_delay_min, level.collapse_delay_mid ));
    building_collapse_explode( 5 );
    wait(randomintrange( level.collapse_delay_mid, level.collapse_delay_max ));
    building_collapse_explode( 2 );
    building_collapse_complete( "building_collapse_side" );
}

building_collapse_extra()
{
    common_scripts\utility::flag_init( "building_collapse_extra" );
    var_0 = getent( "collapse_extra", "targetname" );
    var_0 waittill( "trigger", var_1 );

    while ( common_scripts\utility::flag( "building_collapse_side" ) || common_scripts\utility::flag( "building_collapse_back" ) )
        wait 0.05;

    if ( !isdefined( var_1 ) && !var_1 )
        building_collapse_wait_for_ready( "collapse_center_1" );

    building_collapse_active( "building_collapse_extra" );
    building_collapse_explode( 1 );
    wait(randomintrange( level.collapse_delay_mid, level.collapse_delay_max ));
    building_collapse_explode( 3 );
    building_collapse_complete( "building_collapse_extra" );
}

building_collapse_active( var_0 )
{
    common_scripts\utility::flag_set( var_0 );
    common_scripts\utility::flag_set( "collapse" );

    if ( var_0 != "building_collapse_extra" )
        level notify( "stop_stumble" );

    thread soundscripts\_audio_mix_manager::mm_add_submix( "mix_building_collapse" );
    thread common_scripts\utility::play_sound_in_space( "exp_building_collapse_dist", level.player.origin );
}

building_collapse_complete( var_0 )
{
    level notify( "building_collapse_final_wait", level.collapse_delay_min );
    wait(level.collapse_delay_min);
    common_scripts\utility::flag_clear( var_0 );
    common_scripts\utility::flag_clear( "collapse" );
    common_scripts\utility::flag_set( "collapse_done" );
    level notify( "recovered" );
    maps\_utility::delaythread( max( 0, 5 - level.collapse_delay_min ), soundscripts\_audio_mix_manager::mm_clear_submix, "mix_building_collapse" );
}

building_collapse_wait_for_ready( var_0 )
{
    var_1 = getent( var_0, "targetname" );
    var_2 = cos( 45 );

    for (;;)
    {
        while ( !common_scripts\utility::within_fov( level.player.origin, level.player getplayerangles(), var_1.origin, var_2 ) )
            wait 0.05;

        if ( common_scripts\utility::flag( "fall" ) )
        {
            wait 0.05;
            continue;
        }

        break;
    }
}

building_collapse_pull_view( var_0, var_1 )
{
    self endon( "helicopterfall_bodysense" );
    var_2 = getent( "collapse_center_" + var_0, "targetname" );
    var_3 = level.player getplayerangles();
    var_4 = vectortoangles( var_2.origin - level.player.origin );
    var_5 = spawn( "script_origin", level.player.origin );
    var_5.angles = var_4;
    var_6 = 1.75;
    level.player playerlinktoblend( var_5, undefined, var_6, var_6 * 0.333, var_6 * 0.333, 1 );
    level.ground_ref_ent rotateto( ( 0.0, 0.0, 0.0 ), var_6, var_6 * 0.333, var_6 * 0.333 );
    wait(var_6);
    wait 1.0;
    level.player setplayerangles( var_4 );
    level.player unlink();
}

building_collapse_recenter_view( var_0 )
{
    level.ground_ref_ent rotateto( ( 0, var_0, 0 ), 4, 2, 2 );
    level waittill( "building_collapse_final_wait", var_1 );
    var_2 = var_1 * 0.5;
    var_3 = var_1 * 0.25;
    wait(var_2);
    level.ground_ref_ent rotateto( ( 0.0, 0.0, 0.0 ), var_2, var_3, var_3 );
}

building_collapse()
{
    getent( "raze", "targetname" ) waittill( "trigger" );
    var_0 = getent( "building_collapse", "targetname" );
    var_1 = cos( 45 );

    while ( !common_scripts\utility::within_fov( level.player.origin, level.player getplayerangles(), var_0.origin + ( 0.0, 0.0, -1000.0 ), var_1 ) )
        wait 0.05;

    common_scripts\utility::flag_waitopen( "fall" );
    common_scripts\utility::flag_set( "collapse" );
    level notify( "stop_stumble" );
    thread common_scripts\utility::play_sound_in_space( "exp_building_collapse_dist", level.player.origin );
    var_2 = getentarray( var_0.target, "targetname" );
    common_scripts\utility::array_thread( var_2, ::collapse, var_0 );
    var_0 moveto( var_0.origin + ( 0.0, 0.0, -3000.0 ), 7, 4, 0 );
    wait 0.5;
    common_scripts\_exploder::exploder( 1 );
    var_3 = adjust_angles_to_player( ( 0.0, 0.0, -20.0 ) );
    level.ground_ref_ent rotateto( var_3, 2, 1, 1 );
    level.ground_ref_ent waittill( "rotatedone" );
    wait 1;
    level.ground_ref_ent rotateto( ( 0.0, 0.0, 0.0 ), 3, 1.5, 1.5 );
    wait 2;
    common_scripts\utility::flag_clear( "collapse" );
    common_scripts\utility::flag_set( "collapse_done" );
    level notify( "recovered" );
}

collapse( var_0 )
{
    var_1 = distance( var_0.origin, self.origin );

    while ( distance( var_0.origin, self.origin ) <= var_1 )
    {
        var_1 = distance( var_0.origin, self.origin );
        wait 0.05;
    }

    if ( !isdefined( self.script_delay ) )
        self.script_delay = 0;

    wait(randomfloat( 0.1 ) + self.script_delay);
    var_2 = vectornormalize( common_scripts\utility::flat_origin( var_0.origin ) - common_scripts\utility::flat_origin( self.origin ) );
    var_3 = maps\_utility::vector_multiply( vector_switch( vectornormalize( var_2 ) ), randomintrange( 80, 100 ) );
    var_2 = random_vector( ( 1.0, 1.0, 0.1 ) );
    var_2 = maps\_utility::vector_multiply( var_2, randomintrange( 100, 150 ) );
    self rotatevelocity( var_3, 2, 0.2, 0 );
    self movegravity( var_2, 2 );
    wait 2;
    self delete();
}

vector_switch( var_0 )
{
    return ( var_0[0], var_0[2], var_0[1] * -1 );
}

random_vector( var_0 )
{
    return ( ( randomfloat( 2 ) - 1 ) * var_0[0], ( randomfloat( 2 ) - 1 ) * var_0[1], ( randomfloat( 2 ) - 1 ) * var_0[2] );
}

player_speed_over_time()
{
    for (;;)
    {
        level.player setmovespeedscale( level.player_speed / 190 );
        wait 10;
        level.player_speed--;

        if ( level.player_speed < 30 )
            return;
    }
}

player_heartbeat()
{
    level endon( "stop_heart" );
    wait 3;

    if ( !isdefined( level.heartbeat_ent ) )
    {
        level.heartbeat_ent = spawn( "script_origin", level.player.origin );
        level.heartbeat_ent linkto( level.player );
    }

    level.heartbeat_ent playloopsound( "aftermath_heartbeat" );

    for (;;)
    {
        if ( common_scripts\utility::flag( "helicopterfall_bodysense" ) )
        {
            level.player thread common_scripts\utility::stop_loop_sound_on_entity( level.playerbreathalias );
            level.heartbeat_ent stoploopsound();
            level.player playsound( "h1_heartbeat_fall" );
            wait 3.5;
            level.heartbeat_ent playloopsound( "aftermath_heartbeat" );

            if ( level.playerbreathalias == "h1_plr_breath_injured_low" )
                level.playerbreathalias = "h1_plr_breath_injured_heavy";

            level.player thread common_scripts\utility::play_loop_sound_on_entity( level.playerbreathalias );
            var_0 = 1.0;

            while ( var_0 >= 0.95 )
            {
                level.heartbeat_ent scalepitch( var_0, 0.5 );
                var_0 -= 0.05;
                wait 2;
            }

            return;
        }

        wait 0.05;
    }
}

player_wakeup()
{
    if ( getdvarint( "aftermath_body_sense", 1 ) == 1 )
    {
        thread player_wakeup_body_sense();
        return;
    }

    level notify( "aftermath_lighting_glow", 0 );
    level.player setstance( "prone" );
    level.player shellshock( "aftermath", 18 );
    level notify( "slowview" );
    level.player disableweapons();
    level.player freezecontrols( 1 );
    level.player allowstand( 0 );
    level.player allowcrouch( 0 );
    var_0 = ( -989.0, 8433.0, 666.0 );
    var_1 = ( -18.0, 25.0, 0.0 );
    level.player setorigin( var_0 );
    level.player setplayerangles( var_1 );
    var_2 = create_overlay_element( "overlay_hunted_black", 1 );
    wait 5;
    wait 0.5;
    var_2 fadeovertime( 12 );
    var_2.alpha = 0;
    wait 1;
    level.player freezecontrols( 0 );
    wait 7;
    wait 0.5;
    thread recover();
    setsaveddvar( "cg_footsteps", 0 );
    level.player setstance( "prone" );
    wait 2;
    level.player allowcrouch( 1 );
    common_scripts\utility::flag_set( "awake" );
    level notify( "aftermath_lighting_default", 10 );
    wait 10;
    level.player allowstand( 1 );
    var_2 destroy();
}

player_wakeup_body_sense()
{
    level notify( "aftermath_lighting_glow", 0 );
    level.player shellshock( "aftermath", 18 );
    level notify( "slowview" );
    level.player disableweapons();
    level.player freezecontrols( 1 );
    body_sense_wakeup_setup();
    var_0 = create_overlay_element( "overlay_hunted_black", 1 );
    wait 5;
    thread body_sense_wakeup_start();
    wait 0.5;
    var_0 fadeovertime( 12 );
    var_0.alpha = 0;
    wait 1;
    wait 7;
    wait 0.5;
    setsaveddvar( "cg_footsteps", 0 );
    wait 2;
    common_scripts\utility::flag_set( "awake" );
    level notify( "aftermath_lighting_default", 10 );
    wait 10;
    var_0 destroy();
}

body_sense_init()
{
    level.player_body_node = spawn( "script_origin", ( -702.964, 8432.29, 635.475 ) );
    level.player_body = maps\_utility::spawn_anim_model( "player_body", level.player.origin, level.player getplayerangles() );
    level.player_body hide();
}

body_sense_wakeup_setup()
{
    level.player allowprone( 1 );
    level.player allowcrouch( 0 );
    level.player allowstand( 0 );
    level.player setstance( "prone" );
    level.player_body_node maps\_anim::anim_first_frame_solo( level.player_body, "jackson_wakeup" );
    var_0 = level.player_body gettagorigin( "tag_camera" );
    var_0 -= ( 0.0, 0.0, 11.0 );
    level.player setorigin( var_0 );
    var_1 = level.player_body gettagangles( "tag_camera" );
    var_1 = ( 0, var_1[1], 0 );
    level.player setplayerangles( var_1 );
}

body_sense_wakeup_start()
{
    setsaveddvar( "bg_allowProneWhileLinked", 1 );
    level.ground_ref_ent.angles += ( 0.0, 0.0, -5.27285 );
    level.player_body show();
    level.player playerlinktodelta( level.player_body, "tag_player", 1, 0, 0, 0, 0, 1 );
    level.player_body_node thread maps\_anim::anim_single_solo( level.player_body, "jackson_wakeup" );
    thread h1_aftermathwakeupseq_dof();
    var_0 = 0.333;
    wait(getanimlength( level.scr_anim["player_body"]["jackson_wakeup"] ) - var_0);
    level.ground_ref_ent rotateto( ( 0.0, 0.0, 0.0 ), var_0, var_0 * 0.333, var_0 * 0.333 );
    level.ground_ref_ent waittill( "rotatedone" );
    level.player unlink();
    level.player_body hide();
    wait 2;
    setsaveddvar( "bg_allowProneWhileLinked", 0 );
    level.player thread common_scripts\utility::play_loop_sound_on_entity( level.playerbreathalias );
    level.player allowcrouch( 1 );
    wait 10;
    level.player allowstand( 1 );
}

h1_aftermathwakeupseq_dof()
{
    wait 1.35;
    level.player setphysicaldepthoffield( 2.4, 140, 9.0, 9.0 );
    setsaveddvar( "r_mbEnable", 2 );
    level.player enablephysicaldepthoffieldscripting();
    level.player setphysicaldepthoffield( 2.4, 21, 1.0, 1.0 );
    wait 8.5;
    level.player setphysicaldepthoffield( 3.4, 14, 2.0, 2.0 );
    wait 2.3;
    level.player setphysicaldepthoffield( 4.4, 11.5, 3.0, 3.0 );
    wait 1.5;
    wait 1.5;
    setsaveddvar( "r_mbEnable", 0 );
}

adjust_angles_to_player( var_0 )
{
    var_1 = var_0[0];
    var_2 = var_0[2];
    var_3 = anglestoright( level.player.angles );
    var_4 = anglestoforward( level.player.angles );
    var_5 = ( var_3[0], 0, var_3[1] * -1 );
    var_6 = ( var_4[0], 0, var_4[1] * -1 );
    var_7 = maps\_utility::vector_multiply( var_5, var_1 );
    var_7 += maps\_utility::vector_multiply( var_6, var_2 );
    return var_7 + ( 0, var_0[1], 0 );
}

limp()
{
    if ( getdvarint( "no_cinematic_fx" ) != 1 )
        level.player thread maps\aftermath_lighting::player_random_blur();

    var_0 = 0;
    var_1 = 0;
    var_2 = 1.0;

    for (;;)
    {
        var_3 = level.player getvelocity();
        var_4 = abs( var_3[0] ) + abs( var_3[1] );

        if ( var_4 < 4 )
        {
            wait 0.05;
            continue;
        }

        var_5 = level.player getstance();

        if ( var_5 == "crouch" )
            var_2 = 0.1;
        else if ( var_5 == "prone" )
            var_2 = 0.6;
        else
            var_2 = 1.0;

        var_6 = var_4 / level.player_speed;
        var_7 = randomfloatrange( 3, 5 );

        if ( randomint( 100 ) < 20 )
            var_7 *= 3;

        var_8 = randomfloatrange( 3, 7 );
        var_9 = randomfloatrange( -8, -2 );
        var_10 = ( var_7, var_9, var_8 );
        var_10 *= var_2;
        var_10 = maps\_utility::vector_multiply( var_10, var_6 );
        var_11 = randomfloatrange( 0.35, 0.45 );
        var_12 = randomfloatrange( 0.65, 0.8 );
        var_0++;

        if ( var_6 > 1.3 )
            var_0++;

        thread stumble( var_10, var_11, var_12, var_2 );
        thread maps\aftermath_aud::aud_player_walking_foley( var_5 );
        level waittill( "recovered" );
    }
}

player_jump_punishment()
{
    wait 1;

    for (;;)
    {
        wait 0.05;

        if ( getdvarint( "aftermath_body_sense", 1 ) == 1 )
        {
            if ( !level.player isjumping() )
                continue;
        }
        else
        {
            if ( level.player isonground() )
                continue;

            wait 0.2;

            if ( level.player isonground() )
                continue;
        }

        level notify( "stop_stumble" );
        wait 0.2;
        level.player fall();
    }
}

setup_force_fall()
{
    if ( getdvarint( "aftermath_body_sense", 1 ) == 1 )
        var_0 = getentarray( "force_fall_body_sense", "targetname" );
    else
        var_0 = getentarray( "force_fall", "targetname" );

    common_scripts\utility::array_thread( var_0, ::force_fall );
}

force_fall()
{
    self waittill( "trigger" );

    if ( self.script_noteworthy == "lower_fall" )
    {
        level.lower_fall_used = 1;
        return;
    }

    if ( self.script_noteworthy == "upper_fall" )
    {
        if ( isdefined( level.lower_fall_used ) && level.lower_fall_used == 1 )
            return;
    }

    level.player fall();
}

fall()
{
    level endon( "stop_stumble" );

    if ( !level.allow_fall )
        return;

    common_scripts\utility::flag_set( "fall" );
    level.player setstance( "prone" );
    thread maps\aftermath_aud::aud_player_falls();
    level.ground_ref_ent thread stumble( ( 20.0, 10.0, 30.0 ), 0.2, 1.5, 1, 1 );
    wait 0.2;
    level notify( "aftermath_lighting_pain", 0 );
    level.player playrumbleonentity( "grenade_rumble" );
    level.player allowstand( 0 );
    level.player allowcrouch( 0 );

    if ( !common_scripts\utility::flag( "collapse" ) )
        level.player viewkick( 127, level.player.origin );

    level notify( "slowview", 3.5 );
    wait 1.5;
    common_scripts\utility::flag_set( "fall" );
    thread recover();
    thread maps\aftermath_aud::aud_player_recover();
    level notify( "aftermath_lighting_default", 5 );
    common_scripts\utility::flag_clear( "fall" );
    common_scripts\utility::flag_set( "fall_complete" );
    level.player allowstand( 1 );
    level.player allowcrouch( 1 );
    level notify( "recovered" );
}

stumble( var_0, var_1, var_2, var_3, var_4 )
{
    level endon( "stop_stumble" );
    var_0 = adjust_angles_to_player( var_0 );
    level.ground_ref_ent rotateto( var_0, var_1, var_1 / 4 * 3, var_1 / 4 );
    level.ground_ref_ent waittill( "rotatedone" );
    var_5 = ( randomfloat( 4 ) - 4, randomfloat( 5 ), 0 );
    var_5 *= var_3;
    var_5 = adjust_angles_to_player( var_5 );
    level.ground_ref_ent rotateto( var_5, var_2, 0, var_2 / 2 );
    level.ground_ref_ent waittill( "rotatedone" );

    if ( !isdefined( var_4 ) )
        level notify( "recovered" );
}

recover()
{
    level endon( "collapse" );

    if ( common_scripts\utility::flag( "collapse" ) )
        return;

    var_0 = adjust_angles_to_player( ( -5.0, -5.0, 0.0 ) );
    level.ground_ref_ent rotateto( var_0, 0.6, 0.6, 0 );
    level.ground_ref_ent waittill( "rotatedone" );
    var_0 = adjust_angles_to_player( ( -15.0, -20.0, 0.0 ) );
    level.ground_ref_ent rotateto( var_0, 2.5, 0, 2.5 );
    level.ground_ref_ent waittill( "rotatedone" );
    var_0 = adjust_angles_to_player( ( 5.0, 5.0, 0.0 ) );
    level.ground_ref_ent rotateto( var_0, 2.5, 2, 0.5 );
    level.ground_ref_ent waittill( "rotatedone" );
    level.ground_ref_ent rotateto( ( 0.0, 0.0, 0.0 ), 1, 0.2, 0.8 );
}

create_overlay_element( var_0, var_1 )
{
    var_2 = newhudelem();
    var_2.x = 0;
    var_2.y = 0;
    var_2 setshader( var_0, 640, 480 );
    var_2.alignx = "left";
    var_2.aligny = "top";
    var_2.horzalign = "fullscreen";
    var_2.vertalign = "fullscreen";
    var_2.alpha = var_1;
    var_2.foreground = 1;
    return var_2;
}

hud_hide( var_0 )
{
    wait 0.1;
    setsaveddvar( "hud_showStance", 0 );
    setsaveddvar( "compass", "0" );
    setsaveddvar( "ammoCounterHide", "1" );
}
