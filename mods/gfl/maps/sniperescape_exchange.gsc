// H1 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

exchange_turret_org()
{
    var_0 = getent( "turret2", "targetname" );
    return var_0.origin;
}

exchange_turret()
{
    var_0 = getent( "turret2", "targetname" );
    var_1 = getent( var_0.target, "targetname" );
    var_0 makeunusable();
    var_0 hide();
    var_0.origin = var_1.origin;

    for (;;)
    {
        if ( isdefined( var_0 getturretowner() ) )
            break;

        wait 0.05;
    }

    level.player_can_fire_turret_time = gettime() + 1000;
    common_scripts\utility::flag_set( "player_is_on_turret" );
    level.player allowcrouch( 0 );
    level.player allowstand( 0 );
    setsaveddvar( "r_lodFOVFixedScale", 0.6 );

    if ( !common_scripts\utility::flag( "player_used_zoom" ) )
        level.player thread maps\_utility::display_hint( "barrett" );

    level.level_specific_dof = 1;
    var_2 = level.player.origin + ( 0.0, 0.0, 60.0 );
    common_scripts\utility::flag_wait_any( "player_gets_off_turret_fade", "hotel_destroyed" );

    if ( !common_scripts\utility::flag( "hotel_destroyed" ) )
        thread blackscreendismountgun();

    common_scripts\utility::flag_wait( "player_gets_off_turret" );
    level.player enableturretdismount();
    var_3 = getent( "barrett_trigger", "targetname" );
    var_3 delete();
    var_0 delete();
    setsaveddvar( "compass", 1 );
    setsaveddvar( "ammoCounterHide", "0" );
    setsaveddvar( "ui_hideMap", "0" );
    setsaveddvar( "hud_showStance", 1 );
    common_scripts\utility::flag_clear( "player_is_on_turret" );
    level.player allowcrouch( 1 );
    level.player allowstand( 1 );
    level.level_specific_dof = 0;
    setsaveddvar( "r_lodFOVFixedScale", 1 );
    setblur( 0, 0.05 );
    level.player setorigin( level.player.original_org + ( 0.0, 0.0, 90.0 ) );
}

update_goal_yaw( var_0 )
{
    self endon( "death" );
    level endon( "stop_updating_goal_yaw" );

    for (;;)
    {
        var_1 = vectortoangles( var_0.origin - self.origin );
        self setgoalyaw( var_1[1] );
        wait 0.1;
    }
}

track_ent_chain( var_0 )
{
    var_1 = getent( var_0, "targetname" );
    var_2 = spawn( "script_model", var_1.origin );
    thread update_goal_yaw( var_2 );
    var_3 = 4926.53;
    var_4 = 2.5;

    for (;;)
    {
        if ( !isdefined( var_1.target ) )
            break;

        var_5 = getent( var_1.target, "targetname" );
        var_6 = distance( var_5.origin, var_1.origin );
        var_7 = var_6 * var_4 / var_3;

        if ( var_7 < 0.05 )
            var_7 = 0.05;

        var_2 moveto( var_5.origin, var_7 );
        wait(var_7);
        var_1 = var_5;
    }

    var_2 delete();
    level notify( "stop_updating_goal_yaw" );
}

exchange_heli_tracking()
{
    maps\_vehicle::vehicle_flag_arrived( "block_heli_arrives" );
    wait 1.5;
    track_ent_chain( "heli_search_org" );
    common_scripts\utility::flag_set( "block_heli_moves" );
}

exchange_trace_converter()
{
    var_0 = getent( "bullet_block", "targetname" );
    var_0 hide();
    var_1 = -5000;

    for (;;)
    {
        common_scripts\utility::flag_wait( "player_is_on_turret" );
        maps\_utility::wait_for_buffer_time_to_pass( var_1, 1.0 );

        if ( !level.player attackbuttonpressed() )
        {
            wait 0.05;
            continue;
        }

        thread exchange_player_fires();
        var_1 = gettime();

        while ( level.player attackbuttonpressed() )
            wait 0.05;
    }
}

exchange_player_fires()
{
    if ( gettime() < level.player_can_fire_turret_time )
        return;

    var_0 = 1.5;
    var_1 = 20;
    var_2 = 0.15;
    var_3 = 0.8;
    var_4 = getturretfov();
    var_5 = ( var_4 - var_0 ) * ( var_3 - var_2 ) / ( var_1 - var_0 );
    var_5 += var_2;
    level.player shellshock( "barrett", 1.3 );
    level.fired_barrett = 1;
    var_6 = level.player getplayerangles();
    var_7 = level.player geteye();
    var_8 = anglestoforward( var_6 );
    var_9 = var_7 + var_8 * 15000;
    var_10 = bullettrace( var_7, var_9, 0, undefined );
    level.trace = var_10;

    if ( var_10["surfacetype"] != "default" )
        return;

    var_7 = var_10["position"] + var_8 * 10;
    var_9 = var_10["position"] + var_8 * 15000;
    var_11 = [];
    var_11[0] = 0.03;
    var_11[1] = 0.07;
    var_11[2] = 0.085;
    var_11[3] = 0.1;
    var_11[0] = 0.025;
    var_11[1] = 0.025;
    var_11[2] = 0.025;
    var_11[3] = 0.025;
    var_12 = var_7;
    var_13 = 314.245;
    var_14 = var_8 * var_13;
    waittillframeend;
    var_15 = getent( "turret2", "targetname" );

    if ( !isdefined( var_15 ) )
        return;

    var_16 = var_15.origin + ( -0.1, 0.0, 15.0 );
    var_17 = spawn( "script_model", var_16 );
    var_17 setmodel( "tag_origin" );
    playfxontag( common_scripts\utility::getfx( "bullet_geo" ), var_17, "tag_origin" );
    var_18 = 10;
    var_19 = 0;
    var_20 = var_17.origin;
    var_10 = undefined;
    var_21 = 0;
    var_22 = undefined;
    var_23 = 0;
    var_24 = 0;
    var_25 = undefined;
    var_26 = ( 0.0, 0.0, 0.0 );

    for (;;)
    {
        if ( isalive( level.zakhaev ) && !var_21 )
        {
            var_25 = level.zakhaev gettagorigin( "J_Shoulder_LE" );
            var_27 = distance( var_25, var_17.origin );

            if ( var_27 < 3000 )
            {
                var_21 = 1;
                var_6 = vectortoangles( var_25 - var_17.origin );
                var_28 = anglestoforward( var_6 );
                var_6 = vectortoangles( var_17.origin - var_20 );
                var_8 = anglestoforward( var_6 );
                level.zak_dot = vectordot( var_28, var_8 );
                var_23 = level.zak_dot > 0.99998;
                var_22 = var_27 / var_13;
                var_23 = 0;
            }
        }

        var_29 = var_12 + var_14;

        if ( !var_21 || !var_23 )
            var_26 = level.wind_vec * var_11[level.gameskill];

        var_10 = bullettrace( var_12, var_29, 1, undefined );
        var_30 = var_10["position"];

        if ( var_10["fraction"] < 1 )
        {
            exchange_impact_alert( var_10["position"] );
            var_6 = vectortoangles( var_29 - var_12 );
            break;
        }

        var_31 = var_19 / var_18;

        if ( var_31 < 0 )
            var_31 = 0;

        if ( var_31 > 1.0 )
            var_31 = 1.0;

        var_19++;
        level.view_frac = var_31;
        var_32 = var_17.origin;
        var_33 = var_16;
        var_16 += var_14;

        if ( var_23 )
        {
            if ( isalive( level.zakhaev ) )
                var_25 = level.zakhaev gettagorigin( "J_Shoulder_LE" );

            var_34 = var_25;
            var_35 = var_24 / var_22;
            var_35 *= var_35;
            var_17.origin = var_30 * 1.0 - var_35 + var_34 * var_35;
            var_24++;

            if ( var_24 > var_22 )
            {
                var_23 = 0;
                var_12 = var_25;

                if ( isalive( level.zakhaev ) )
                    level.zakhaev notify( "fake_damage" );
            }
        }
        else
        {
            var_20 = var_17.origin;
            var_17.origin = var_30 * var_31 + var_16 * ( 1.0 - var_31 );
        }

        var_12 += ( var_14 + var_26 );
        wait 0.05;
    }

    var_8 = anglestoforward( var_6 );
    var_36 = var_8 * 5;
    var_14 = var_8 * 15000;
    magicbullet( "barrett_fake", var_12, var_12 + var_14 );
    wait 0.25;
    var_17 delete();

    if ( common_scripts\utility::flag( "exchange_success" ) )
    {
        if ( common_scripts\utility::flag( "price_comments_on_zak_hit" ) )
            return;

        maps\sniperescape_code::price_clears_dialogue();
        common_scripts\utility::flag_set( "price_comments_on_zak_hit" );
        var_37 = "target_down_" + ( randomint( 3 ) + 1 );
        maps\sniperescape_code::price_line( var_37 );
        return;
    }

    if ( common_scripts\utility::flag( "price_comments_on_zak_miss" ) )
        return;

    common_scripts\utility::flag_set( "price_comments_on_zak_miss" );
    maps\sniperescape_code::price_clears_dialogue();

    if ( price_thinks_you_are_insane( var_12 ) )
        maps\sniperescape_code::price_line( "are_you_insane" );
    else if ( level.wind_setting == "end" )
        maps\sniperescape_code::price_line( "target_still_standing" );
    else
        maps\sniperescape_code::price_line( "went_wide" );

    if ( 1 )
        return;

    var_38 = spawnstruct();
    var_38.traces = [];
    var_10 = bullettrace( var_7, var_9, 1, undefined );
    var_39 = distance( var_7, var_10["position"] );
    var_40 = var_39 * 1.432 / 9000;
    var_41 = var_39 / 9000;
    var_38 thread exchange_turret_traces( var_7, var_9, var_41 );
    var_38 thread exchange_sniper_windmod( var_9 );
    wait(var_40);
    var_38 notify( "stop_gathering_traces" );
    exchange_impact_alert( var_10["position"] );
    var_42 = var_38.sniper_shot;

    if ( common_scripts\utility::flag( "exchange_success" ) )
    {
        var_43 = var_38 exchange_get_safe_shot( var_7 );

        if ( !isdefined( var_43 ) )
            return;

        var_42 = var_43;
    }

    magicbullet( "barrett_fake", var_7, var_42 );
}

exchange_impact_alert( var_0 )
{
    common_scripts\utility::flag_set( "player_attacks_exchange" );
}

exchange_sniper_windmod( var_0 )
{
    self endon( "stop_gathering_traces" );
    self.sniper_shot = var_0;
    var_1 = var_0;

    for (;;)
    {
        var_2 = level.wind_vec * 0.2;
        self.sniper_shot += var_2;
        var_1 = var_0;
        wait 0.05;
    }
}

exchange_get_safe_shot( var_0 )
{
    for ( var_1 = 0; var_1 < self.traces.size; var_1++ )
    {
        var_2 = bullettrace( var_0, self.traces[var_1], 1, undefined );
        var_3 = 0;

        if ( isalive( level.zakhaev ) )
        {
            for (;;)
            {
                if ( !isalive( var_2["entity"] ) )
                    break;

                if ( var_2["entity"] == level.zakhaev )
                {
                    var_3 = 1;
                    break;
                }

                if ( isdefined( var_2["entity"].heli ) )
                    var_2["entity"] kill( ( 0.0, 0.0, 0.0 ) );

                var_2 = bullettrace( var_2["position"], self.traces[var_1], 1, var_2["entity"] );
            }
        }

        if ( var_3 )
            continue;

        return var_2["position"];
    }
}

exchange_turret_traces( var_0, var_1, var_2 )
{
    self endon( "stop_gathering_traces" );
    var_3 = bullettrace( var_0, var_1, 1, undefined );
    var_4 = var_3["position"];
    var_5 = spawn( "script_origin", ( 0.0, 0.0, 0.0 ) );
    level.trace_gather_ent = var_5;
    var_6 = level.wind_vec * var_2;
    var_5.origin = var_4 + var_6;
    var_5.angles = vectortoangles( var_0 - var_1 );
    var_7 = 0.5;
    var_8 = var_2 * 0.75;

    for (;;)
    {
        var_5 addroll( randomint( 360 ) );
        var_9 = anglestoup( var_5.angles );
        var_9 *= var_7;
        var_10 = vectortoangles( var_5.origin + var_9 - var_0 );
        var_9 = anglestoforward( var_10 );
        var_9 *= 25000;
        var_3 = bullettrace( var_0, var_0 + var_9, 1, undefined );

        if ( !hit_zak( var_3 ) )
            self.traces[self.traces.size] = var_0 + var_9;

        var_7 += var_8;
        wait 0.025;
    }
}

drawhit( var_0, var_1 )
{
    for (;;)
        wait 0.05;
}

hit_zak( var_0 )
{
    if ( !isalive( var_0["entity"] ) )
        return 0;

    if ( !isalive( level.zakhaev ) )
        return 0;

    return var_0["entity"] == level.zakhaev;
}

drawtrace( var_0, var_1 )
{
    var_2 = 120;

    for ( var_3 = 0; var_3 < var_2; var_3++ )
        wait 0.05;
}

exchange_bored_idle()
{
    if ( isdefined( self.script_noteworthy ) )
        return;

    maps\_anim::anim_generic_loop( self, "bored_idle" );
}

lean_and_smoke()
{
    var_0 = getent( self.target, "targetname" );
    var_0 maps\_anim::anim_generic_loop( self, "smoke_idle" );
}

stand_and_smoke()
{
    var_0 = getent( self.target, "targetname" );
    var_0 maps\_anim::anim_generic_loop( self, "smoking" );
}

exchange_barrett_trigger()
{
    common_scripts\utility::flag_init( "player_grabbing_barrett_start" );
    thread h1_playergrabbarrettlogic();
    common_scripts\utility::flag_wait( "can_use_turret" );
    var_0 = getent( "barrett_trigger", "targetname" );
    var_0 sethintstring( &"SNIPERESCAPE_BARRETT_USE" );
    var_1 = getent( "turret2", "targetname" );
    var_0 waittill( "trigger" );
    var_0 common_scripts\utility::trigger_off();
    common_scripts\utility::flag_set( "player_grabbing_barrett_start" );

    if ( !isdefined( level.barrett_intro_with_anim ) )
        player_attach_to_barret_with_script();
    else
        player_attach_to_barret_with_anim();

    level.view_org moveto( level.view_org.origin + ( 0.0, 0.0, 260.0 ), 0.1 );
    level.view_org delete();
    level.player setplayerangles( ( 5.5, -65.06, 0.0 ) );
    level.player.original_org = level.player.origin;
    var_1 useby( level.player );
    thread maps\_utility::autosave_now( 1 );
    wait 1;

    if ( getdvar( "use_old_sniper_text_style" ) == "1" )
    {
        if ( getdvarint( "loc_language", 0 ) == 12 )
        {
            thread sniper_text( &"SNIPERESCAPE_TARGET", 120, 0 );
            wait 0.5;
            thread sniper_text( &"SNIPERESCAPE_ZAKHAEV", 0, 0 );
            wait 1.5;
            thread sniper_text( &"SNIPERESCAPE_DISTANCE", 120, 1 );
            wait 0.85;
            thread sniper_text_countup( 896.7, &"SNIPERESCAPE_M", 0, 1 );
            wait 1.5;
            thread sniper_text( &"SNIPERESCAPE_BULLET_TRAVEL", 120, 2 );
            wait 0.8;
            thread sniper_text_countup( 1.05, &"SNIPERESCAPE_S", 0, 2 );
        }
        else
        {
            thread sniper_text( &"SNIPERESCAPE_TARGET", 0, 0 );
            wait 0.5;
            thread sniper_text( &"SNIPERESCAPE_ZAKHAEV", 70, 0 );
            wait 1.5;
            thread sniper_text( &"SNIPERESCAPE_DISTANCE", 0, 1 );
            wait 0.85;
            thread sniper_text_countup( 896.7, &"SNIPERESCAPE_M", 158, 1 );
            wait 1.5;
            thread sniper_text( &"SNIPERESCAPE_BULLET_TRAVEL", 0, 2 );
            wait 0.8;
            thread sniper_text_countup( 1.05, &"SNIPERESCAPE_S", 155, 2 );
        }
    }
    else
    {
        if ( getdvarint( "loc_language", 0 ) == 12 )
        {
            thread sniper_text( &"SNIPERESCAPE_TARGET", 120, 0, 4.45 );
            wait 0.25;
            thread sniper_text( &"SNIPERESCAPE_ZAKHAEV", 0, 0, 4.2 );
            wait 1.5;
            thread sniper_text( &"SNIPERESCAPE_DISTANCE", 120, 1, 2.7 );
            wait 0.6;
            thread sniper_text_countup( 896.7, &"SNIPERESCAPE_M", 0, 1, 2.1 );
            wait 1.5;
            thread sniper_text( &"SNIPERESCAPE_BULLET_TRAVEL", 120, 2, 0.6 );
            wait 0.6;
            thread sniper_text_countup( 1.05, &"SNIPERESCAPE_S", 0, 2, 0 );
        }
        else
        {
            thread sniper_text( &"SNIPERESCAPE_TARGET", 0, 0, 4.45 );
            wait 0.25;
            thread sniper_text( &"SNIPERESCAPE_ZAKHAEV", 70, 0, 4.2 );
            wait 1.5;
            thread sniper_text( &"SNIPERESCAPE_DISTANCE", 0, 1, 2.7 );
            wait 0.6;
            thread sniper_text_countup( 896.7, &"SNIPERESCAPE_M", 158, 1, 2.1 );
            wait 1.5;
            thread sniper_text( &"SNIPERESCAPE_BULLET_TRAVEL", 0, 2, 0.6 );
            wait 0.6;
            thread sniper_text_countup( 1.05, &"SNIPERESCAPE_S", 155, 2, 0 );
        }

        wait 11.5;
        level notify( "destroy_snipe_info_text" );
    }
}

player_attach_to_barret_with_anim()
{
    var_0 = getdvar( "r_znear" );
    setsaveddvar( "r_znear", 1.0 );
    level.player_intro_node thread maps\_anim::anim_single_solo( level.player_intro_model, "grab_barret" );
    thread blackscreengrabgun( 4.16 );
    level.player_intro_model thread common_scripts\utility::play_sound_in_space( "sniperescape_m82_foley", level.player_intro_model.origin );
    var_1 = 0.5;
    level.player lerpviewangleclamp( var_1 + 0.5, var_1 - 0.5, var_1 - 0.5, 0, 0, 0, 0 );
    wait(var_1);
    var_2 = 4.16 - var_1;
    level.player lerpviewangleclamp( 1.5, 1, 1, 0, 0, 0, 0 );
    wait(var_2);
    wait 0.125;
    level.player_intro_model delete();
    setsaveddvar( "r_znear", var_0 );
    level.player disablephysicaldepthoffieldscripting();
}

player_attach_to_barret_with_script()
{
    var_0 = 5;
    var_1 = 0.4;
    var_2 = 0.45;
    level.view_org moveto( ( 781.86, -11719.7, 953.57 ), var_0, var_0 * var_1, var_0 * var_2 );
    level.view_org rotateto( ( 8.48, -56.48, 0.0 ), var_0, var_0 * var_1, var_0 * var_2 );
    thread blackscreen( var_0 );
    wait(var_0);
}

h1_playergrabbarrettlogic()
{
    level.player enablephysicaldepthoffieldscripting();
    var_0 = 0.05;

    for (;;)
    {
        if ( common_scripts\utility::flag( "player_grabbing_barrett_start" ) )
            break;

        var_1 = level.player getplayerangles();
        var_2 = var_1[0];
        var_3 = var_1[1];
        var_2 = angleclamp180( var_2 );
        var_3 = angleclamp180( var_3 );

        if ( var_2 < 12 && var_3 > -85 )
            level.player setphysicaldepthoffield( 2.9, 1000, 3.0, 3.0 );
        else if ( var_2 > 14 || var_3 < -87 )
            level.player setphysicaldepthoffield( 3.4, 32, 2.5, 2.5 );

        wait(var_0);
    }

    level.player setphysicaldepthoffield( 4.4, 26, 2.0, 2.0 );
    wait 0.85;
    level.player setphysicaldepthoffield( 4.4, 24, 2.5, 2.5 );
    wait 0.65;
    level.player setphysicaldepthoffield( 4.9, 10, 0.5, 0.5 );
    wait 1.65;
    level.player setphysicaldepthoffield( 5.4, 1, 2.0, 2.0 );
    wait 1.0;
}

sniper_text_countup( var_0, var_1, var_2, var_3, var_4 )
{
    var_5 = sniper_text_init( var_1, var_2, var_3, var_4 );
    var_5 settext( var_1 );

    if ( 1 )
        return;

    var_5 = sniper_text_init( var_1, var_2, var_3, var_4 );
    var_6 = 0;
    var_7 = 0.11;

    if ( var_0 > 10 )
        var_7 = 110.11;

    for (;;)
    {
        level.player playsound( "ui_pulse_text_type" );
        var_6 += var_7;

        if ( var_6 > var_0 )
            var_6 = var_0;

        var_5 settext( var_6 );

        if ( var_6 == var_0 )
            return;

        wait 0.05;
    }

    wait 5;
}

sniper_text( var_0, var_1, var_2, var_3 )
{
    var_4 = sniper_text_init( var_0, var_1, var_2, var_3 );
    var_4 settext( var_0 );
}

sniper_text_init( var_0, var_1, var_2, var_3 )
{
    var_4 = 15 * var_2;
    var_5 = newhudelem();
    var_5.x = var_1 + 10;
    var_5.y = var_4 + 10;
    var_5.alignx = "left";
    var_5.aligny = "top";
    var_5.horzalign = "left";
    var_5.vertalign = "top";
    var_5.sort = 1;
    var_5.foreground = 1;
    var_5.alpha = 0;
    var_5 fadeovertime( 0.2 );
    var_5.alpha = 1;
    var_5.hidewheninmenu = 1;
    var_5.fontscale = 1;
    var_5.color = ( 0.8, 1.0, 0.8 );
    var_5.font = "objective";
    var_5.glowcolor = ( 0.26, 0.65, 0.32 );
    var_5.glowalpha = 0.2;

    if ( isdefined( var_3 ) )
        var_6 = int( 10000 + var_3 * 1000 );
    else
        var_6 = 10000;

    var_5 setpulsefx( 30, var_6, 700 );
    thread hudelem_destroyer( var_5 );
    return var_5;
}

hudelem_destroyer( var_0 )
{
    if ( getdvar( "use_old_sniper_text_style" ) == "1" )
        wait 10;
    else
        level waittill( "destroy_snipe_info_text" );

    var_0 destroy();
}

blackscreen( var_0 )
{
    var_1 = newhudelem();
    var_1.x = 0;
    var_1.y = 0;
    var_1 setshader( "black", 640, 480 );
    var_1.alignx = "left";
    var_1.aligny = "top";
    var_1.horzalign = "fullscreen";
    var_1.vertalign = "fullscreen";
    var_1.alpha = 0;
    wait(var_0 - 1);
    var_1 fadeovertime( 1 );
    var_1.alpha = 1;
    wait 1.2;
    var_1 fadeovertime( 1 );
    var_1.alpha = 0;
    wait 1;
    var_1 destroy();
}

blackscreengrabgun( var_0 )
{
    var_1 = newhudelem();
    var_1.x = 0;
    var_1.y = 0;
    var_1 setshader( "black", 640, 480 );
    var_1.alignx = "left";
    var_1.aligny = "top";
    var_1.horzalign = "fullscreen";
    var_1.vertalign = "fullscreen";
    var_1.alpha = 0;
    wait(var_0 - 0.15);
    var_1 fadeovertime( 0.15 );
    var_1.alpha = 1;
    wait 0.3;
    var_1 fadeovertime( 0.25 );
    var_1.alpha = 0;
    wait 1;
    var_1 destroy();
}

blackscreendismountgun()
{
    var_0 = newhudelem();
    var_0.x = 0;
    var_0.y = 0;
    var_0 setshader( "black", 640, 480 );
    var_0.alignx = "left";
    var_0.aligny = "top";
    var_0.horzalign = "fullscreen";
    var_0.vertalign = "fullscreen";
    var_0.alpha = 0;
    var_0 fadeovertime( 0.3 );
    var_0.alpha = 1;
    var_0.foreground = 1;
    wait 0.8;
    var_0 fadeovertime( 0.3 );
    var_0.alpha = 0;
    wait 1;
    var_0 destroy();
}

whitescreen()
{
    var_0 = newhudelem();
    var_0.x = 0;
    var_0.y = 0;
    var_0 setshader( "white", 640, 480 );
    var_0.alignx = "left";
    var_0.aligny = "top";
    var_0.horzalign = "fullscreen";
    var_0.vertalign = "fullscreen";
    var_0.alpha = 1;
    wait 0.05;
    setsaveddvar( "ui_hideMap", "1" );
    setsaveddvar( "compass", 0 );
    setsaveddvar( "ammoCounterHide", "1" );
    setsaveddvar( "hud_showStance", 0 );
    var_0 fadeovertime( 1 );
    var_0.alpha = 0;
    wait 1;
    var_0 destroy();
}

stop_loop()
{
    if ( !isdefined( self.target ) )
    {
        self notify( "stop_loop" );
        return;
    }

    var_0 = getent( self.target, "targetname" );

    if ( isdefined( var_0 ) )
    {
        var_0 notify( "stop_loop" );
        return;
    }

    var_0 = getnode( self.target, "targetname" );

    if ( isdefined( var_0 ) )
    {
        var_0 notify( "stop_loop" );
        return;
    }
}

exchange_baddie_main_think()
{
    self endon( "death" );

    if ( !isdefined( self.drivingvehicle ) )
        self.allowdeath = 1;

    maps\_utility::ent_flag_init( "run_to_car" );
    thread exchange_guy_dies();
    thread exchange_guy_patrol_path();

    if ( isdefined( self.ridingvehicle ) )
        exchange_rider_gets_out();

    if ( isdefined( self.script_linkto ) )
        thread exchange_baddie_runs_to_car();

    common_scripts\utility::flag_wait( "player_attacks_exchange" );
    self notify( "bulletwhizby", level.player );
    waitframe();

    if ( isdefined( self.ridingvehicle ) )
    {
        self notify( "riding_still" );
        return;
    }

    var_0 = "exchange_surprise_" + randomint( level.surprise_anims );

    if ( is_zak() )
    {
        var_0 = "exchange_surprise_zakhaev";
        maps\_utility::delaythread( 1.8, maps\_utility::send_notify, "stop_animmode" );
    }

    if ( !isdefined( self.zak_got_hit ) )
    {
        if ( isdefined( self.main_baddie ) )
            wait(level.exchanger_surprise_time);
        else
            wait(randomfloatrange( 0.05, 0.5 ));

        if ( !isdefined( self.drivingvehicle ) )
        {
            stop_loop();
            self stopanimscripted();
            maps\_anim::anim_generic_custom_animmode( self, "gravity", var_0 );
            maps\_utility::clear_run_anim();
            self.disableexits = 0;
        }

        maps\_utility::ent_flag_set( "run_to_car" );
    }

    self notify( "run_to_car" );
}

exchange_baddie_flags_on_death( var_0 )
{
    common_scripts\utility::waittill_either( "death", "riding_still" );
    var_0 maps\_utility::ent_flag_set( "passenger_got_in" );
}

exchange_waittill_time_to_go_to_car()
{
    self endon( "run_to_car" );
    level endon( "heli_moves_again" );
    common_scripts\utility::flag_wait( "player_attacks_exchange" );
}

exchange_baddie_runs_to_car()
{
    self endon( "death" );
    var_0 = getent( self.script_linkto, "script_linkname" );

    if ( !isdefined( var_0 ) )
    {
        var_1 = getnode( self.script_linkto, "script_linkname" );
        self setgoalnode( var_1 );
        self.goalradius = 32;
        return;
    }

    thread exchange_baddie_flags_on_death( var_0 );
    exchange_waittill_time_to_go_to_car();

    if ( common_scripts\utility::flag( "player_attacks_exchange" ) )
    {
        if ( is_zak() && isdefined( self.zak_got_hit ) )
            common_scripts\utility::flag_wait( "wounded_zak_runs_for_car" );
        else
            maps\_utility::ent_flag_wait( "run_to_car" );
    }
    else
    {
        self.disableexits = 1;

        if ( is_zak() )
            maps\_utility::set_generic_run_anim( "patrol_jog" );
        else
        {
            self.run_overrideanim = maps\_utility::getanim_generic( "stealth_walk" );
            maps\_utility::set_generic_run_anim( "stealth_walk" );
        }
    }

    if ( is_zak() )
    {
        self setgoalpos( var_0.origin );
        self.goalradius = 16;
        self waittill( "goal" );
    }

    var_2 = undefined;

    if ( isdefined( self.script_vehicleride ) )
        var_2 = maps\_vehicle_aianim::get_my_vehicleride();
    else
    {
        var_2 = get_shared_linkto();
        self.script_vehicleride = var_2.script_vehicleride;
    }

    var_3[0] = self;

    if ( is_zak() )
    {
        self notify( "got_in_car" );
        var_0 maps\_utility::ent_flag_set( "passenger_got_in" );
        self delete();
        return;
    }

    if ( var_2 == level.flashback_guys_uaz )
    {
        thread exchange_baddie_runs_to_cover();
        return;
    }

    var_2 maps\_vehicle_aianim::load_ai( var_3 );
    self waittill( "enteredvehicle" );
    var_0 maps\_utility::ent_flag_set( "passenger_got_in" );
    self notify( "got_in_car" );
    self waittill( "jumpedout" );
    self delete();
}

exchange_baddie_runs_to_cover()
{
    self endon( "death" );
    var_0 = getnode( self.script_linkto, "script_noteworthy" );

    if ( isdefined( var_0 ) )
        self setgoalnode( var_0 );
}

get_shared_linkto()
{
    var_0 = strtok( self.script_linkto, " " );
    var_1 = var_0[0];
    var_2 = getentarray( "script_vehicle", "code_classname" );

    for ( var_3 = 0; var_3 < var_2.size; var_3++ )
    {
        var_4 = var_2[var_3];

        if ( !isdefined( var_4.script_linkto ) )
            continue;

        var_5 = strtok( var_4.script_linkto, " " );

        for ( var_6 = 0; var_6 < var_5.size; var_6++ )
        {
            if ( var_5[var_6] == var_1 )
                return var_4;
        }
    }
}

is_zak()
{
    return isalive( level.zakhaev ) && self == level.zakhaev;
}

exchange_guy_dies()
{
    self endon( "got_in_car" );
    self waittill( "death" );
    common_scripts\utility::flag_set( "player_attacks_exchange" );
    level notify( "weapon_master_barrett_kill" );
}

exchange_guy_patrol_path()
{
    self endon( "got_in_car" );
    self endon( "death" );

    if ( isdefined( self.script_vehicleride ) )
        self waittill( "jumpedout" );

    for (;;)
    {
        self waittill( "goal" );

        if ( !isdefined( self.node ) )
            break;

        if ( !isdefined( self.node.target ) )
            break;

        var_0 = getnode( self.node.target, "targetname" );

        if ( var_0.radius )
            self.goalradius = var_0.radius;
        else
            self.goalradius = 16;

        self setgoalnode( var_0 );
    }
}

exchange_rider_gets_out()
{
    self endon( "death" );
    level endon( "player_attacks_exchange" );
    self waittill( "jumpedout" );
    var_0 = getnode( self.target, "targetname" );

    if ( !isdefined( var_0 ) )
        return;

    self.walkdist = 1000;
    self.fixednode = 1;
    self setgoalnode( var_0 );
    self.disableexits = 1;
    self.disablearrivals = 1;
    maps\_utility::set_generic_run_anim( "stealth_walk" );
    self.goalradius = 16;
}

exchange_uaz_preps_for_escape()
{
    maps\_utility::ent_flag_init( "driver_dead" );
    self endon( "driver_dead" );
    common_scripts\utility::flag_init( self.script_flag );
    maps\_utility::ent_flag_init( "time_to_go" );
    maps\_vehicle::godon();
    self.enter_count = 0;
    var_0 = strtok( self.script_linkto, " " );
    common_scripts\utility::array_levelthread( var_0, ::exchange_vehicle_waits_for_passengers );
    var_1 = undefined;

    if ( !isdefined( self.script_vehiclespawngroup ) )
    {
        var_1 = get_path_from_array( var_0 );
        self attachpath( var_1 );
    }

    if ( isdefined( self.script_noteworthy ) && self.script_noteworthy == "flashback_guys_uaz" )
    {
        common_scripts\utility::flag_wait( "player_attacks_exchange" );
        wait 9;
    }
    else
        maps\_utility::ent_flag_wait( "time_to_go" );

    if ( self.script_flag == "uaz4" )
        self vehicle_setspeed( 25, 10 );

    if ( isdefined( self.script_vehiclespawngroup ) )
    {
        var_2 = "vehicle_go_" + self.script_vehiclespawngroup;

        if ( isdefined( level.flag[var_2] ) )
        {
            exchange_wait_until_other_spawned_uazs_go();
            common_scripts\utility::flag_set( var_2 );
        }

        return;
    }

    exchange_wait_until_other_base_uazs_go();
    self startpath();
    self waittill( "reached_end_node" );
    var_3 = maps\_vehicle_aianim::vehicle_get_riders();
    common_scripts\utility::array_thread( var_3, maps\sniperescape_code::delete_living );
    self delete();
}

get_path_from_array( var_0 )
{
    for ( var_1 = 0; var_1 < var_0.size; var_1++ )
    {
        var_2 = getvehiclenode( var_0[var_1], "script_linkname" );

        if ( isdefined( var_2 ) )
            return var_2;
    }
}

exchange_vehicle_waits_for_passengers( var_0 )
{
    var_1 = getent( var_0, "script_linkname" );

    if ( !isdefined( var_1 ) )
        return;

    var_1 maps\_utility::ent_flag_init( "passenger_got_in" );
    self.enter_count++;
    var_1 maps\_utility::ent_flag_wait( "passenger_got_in" );
    self.enter_count--;

    if ( !self.enter_count )
    {
        wait 2;
        maps\_utility::ent_flag_set( "time_to_go" );
    }
}

draworg2()
{

}

exchange_zaks_car_door()
{
    level endon( "zak_spawns" );
    var_0 = getent( "zak_car_org", "script_noteworthy" );
    common_scripts\utility::flag_wait( "player_attacks_exchange" );
    var_0 maps\_utility::ent_flag_set( "passenger_got_in" );
}

arm_detach()
{
    self setmodel( maps\_utility::getmodel( "zak_one_arm" ) );
    self hidepart( "J_Shoulder_LE" );
    arm_goes_flying( self gettagorigin( "J_Shoulder_LE" ) );
}

arm_goes_flying( var_0 )
{
    var_1 = spawn( "script_model", ( 0.0, 0.0, 0.0 ) );
    var_1.origin = var_0;
    var_1 setmodel( maps\_utility::getmodel( "zak_left_arm" ) );

    if ( getdvar( "ax" ) == "" )
        setdvar( "ax", "-0.01" );

    if ( getdvar( "ay" ) == "" )
        setdvar( "ay", "-0.07" );

    if ( getdvar( "az" ) == "" )
        setdvar( "az", "0.2" );

    var_2 = -0.01;
    var_3 = -0.07;
    var_4 = 0.2;
    var_5 = ( var_2, var_3, var_4 );
    var_5 *= 50000;
    var_6 = var_1 gettagorigin( "J_Elbow_LE" );
    var_1 physicslaunchclient( var_6, var_5 );
}

zak_blood()
{
    level endon( "stop_zak_blood" );

    for (;;)
    {
        playfxontag( common_scripts\utility::getfx( "blood" ), self, "J_Shoulder_LE" );
        wait 0.1;
    }
}

zak_arm_blood()
{
    var_0 = 0.2;
    var_1 = 0.5;
    zak_arm_blood_pump( var_1, self, var_0 );
    wait 0.5;
    zak_arm_blood_pump( var_1, self, var_0 );
    wait 0.5;
    zak_arm_blood_pump( var_1, self, var_0 );
    wait 0.5;
    zak_arm_blood_pump( var_1, self, var_0 * 0.5 );
    wait 0.5;
    zak_arm_blood_pump( var_1, self, var_0 * 0.25 );
    wait 0.5;

    if ( 1 )
        return;

    var_2 = spawn( "script_model", ( 0.0, 0.0, 0.0 ) );
    var_2 setmodel( "tag_origin" );
    var_2 linkto( self, "J_Shoulder_LE", ( 0.0, 0.0, 0.0 ), ( 0.0, 0.0, 0.0 ) );
    var_2 thread maps\_debug::drawtagforever( "tag_origin" );

    for ( var_3 = 0; var_3 < var_1; var_3++ )
    {
        playfxontag( common_scripts\utility::getfx( "blood" ), var_2, "tag_origin" );
        wait(var_0);
    }

    wait 5;
    var_2 delete();
}

zak_arm_blood_pump( var_0, var_1, var_2 )
{
    var_0 *= 1 / var_2;

    for ( var_3 = 0; var_3 < var_0; var_3++ )
    {
        playfxontag( common_scripts\utility::getfx( "blood" ), var_1, "J_Shoulder_LE" );
        wait(var_2);
    }
}

zak_blood_pool()
{
    self endon( "stop_blood" );
    wait 1;
    var_0 = getent( "blood_pool", "targetname" );
    var_1 = var_0.origin[2];

    for (;;)
    {
        var_2 = self gettagorigin( "J_Shoulder_LE" ) + ( 0.0, 0.0, 50.0 );
        var_3 = var_2 + ( 0.0, 0.0, -250.0 );
        var_4 = bullettrace( var_2, var_3, 0, undefined );
        var_5 = ( var_4["position"][0], var_4["position"][1], var_1 );
        playfx( common_scripts\utility::getfx( "blood_pool" ), var_5, ( 0.0, 0.0, 1.0 ) );
        wait 0.35;
    }
}

blood_pool()
{
    var_0 = self;
    var_1 = 5;

    for (;;)
    {
        playfx( common_scripts\utility::getfx( "blood_pool" ), var_0.origin + ( 0.0, 0.0, 1.0 ), ( 0.0, 0.0, 1.0 ) );
        var_1--;

        if ( var_1 <= 0 )
            wait 0.3;

        if ( !isdefined( var_0.target ) )
            return;

        var_0 = getent( var_0.target, "targetname" );
    }
}

zak_dies()
{
    self.health = 50000;
    maps\_utility::disable_long_death();
    var_0 = spawn( "script_model", ( 0.0, 0.0, 0.0 ) );
    var_0 character\character_sp_zakhaev_onearm::main();
    var_0 hide();
    var_0.animname = "zak_script_model";
    var_0 maps\_utility::assign_animtree();
    var_0 linkto( self, "tag_origin", ( 0.0, 0.0, 0.0 ), ( 0.0, 0.0, 0.0 ) );
    common_scripts\utility::waittill_either( "damage", "fake_damage" );
    var_1 = "zak_pain";

    if ( getdvarint( "use_old_zak_death" ) != 1 )
        var_1 = common_scripts\utility::ter_op( common_scripts\utility::flag( "zak_is_facing_player" ), "zak_pain", "zak_pain_back" );

    playfxontag( common_scripts\utility::getfx( "blood" ), self, "J_Shoulder_LE" );

    if ( !isdefined( self ) )
        return;

    maps\_utility::arcademode_kill( self geteye(), "rifle", 2000 );

    if ( !common_scripts\utility::flag( "exchange_heli_alerted" ) )
        thread maps\_utility::autosave_now();

    common_scripts\utility::flag_set( "exchange_success" );
    var_0 unlink();
    var_2 = spawn( "script_origin", ( 0.0, 0.0, 0.0 ) );
    var_2.origin = self.origin;
    var_3 = 135;
    var_2.angles = ( 0, var_3, 0 );
    var_4 = getstartorigin( var_2.origin, var_2.angles, level.scr_anim["zak_left_arm"][var_1] );
    var_5 = maps\_utility::spawn_anim_model( "zak_left_arm", var_4 );
    var_6 = maps\_utility::make_array( var_0, var_5 );

    if ( getdvarint( "use_old_zak_death" ) == 1 )
    {
        var_2 maps\_anim::anim_first_frame_solo( var_5, var_1 );
        var_2 thread maps\_anim::anim_single_solo( var_0, var_1 );
        var_2 maps\_utility::delaythread( 0.05, maps\_anim::anim_single_solo, var_5, var_1 );
        var_0 thread zak_blood();
        var_0 show();
        self hide();
    }
    else
    {
        var_5 hide();
        var_2 thread maps\_anim::anim_single_solo( self, var_1 );
        var_2 maps\_anim::anim_first_frame( var_6, var_1 );
        var_2 maps\_utility::delaythread( 0.1, maps\_anim::anim_single, var_6, var_1 );
        wait 0.15;
        self hide();
        var_0 thread zak_blood();
        var_0 show();
        var_5 show();
    }

    var_2 waittill( "zak_pain" );
    level notify( "stop_zak_blood" );
    level waittill( "heli_blocking_crawling_zak" );
    var_0 delete();
}

exchange_zak_and_guards_jab_it_up( var_0, var_1 )
{
    if ( common_scripts\utility::flag( "player_attacks_exchange" ) )
        return;

    thread exchange_zaks_car_door();
    level endon( "player_attacks_exchange" );
    common_scripts\utility::flag_wait( "player_on_barret" );
    common_scripts\utility::flag_wait( "exchange_uazs_arrive" );
    common_scripts\utility::flag_wait( "launch_zak" );
    wait 2;
    var_2 = maps\_utility::spawn_anim_model( "briefcase" );
    var_2 hide();
    level.fake_case = var_2;
    var_0 thread maps\_anim::anim_single_solo( var_2, "exchange" );
    wait 0.25;
    common_scripts\utility::flag_set( "zak_spawns" );
    var_3 = maps\_utility::get_guy_with_targetname_from_spawner( "exchange_zak" );
    level.zakhaev = var_3;
    var_3 thread exchange_baddie_main_think();
    var_3.a.disablepain = 1;
    var_3 thread zak_dies();
    var_3.no_magic_death = 1;
    var_3.main_baddie = 1;
    var_3.tracksuit_ignore = 1;
    var_3.animname = "zakhaev";
    var_3 maps\_utility::set_run_anim( "run" );
    var_3.ignoreall = 1;
    var_3.disableexits = 1;
    var_3.disablearrivals = 1;
    var_3 maps\_utility::putgunaway();
    var_4 = maps\_utility::spawn_anim_model( "briefcase" );
    var_1[var_1.size] = var_3;
    var_4 thread exchange_brick_drop();
    common_scripts\utility::array_thread( var_1, maps\_utility::set_allowdeath, 1 );
    var_1[var_1.size] = var_4;
    common_scripts\utility::array_thread( var_1, ::set_exchange_timings, var_0 );
    var_0 notify( "stop_loop" );
    var_0 thread maps\_anim::anim_single( var_1, "exchange" );
    common_scripts\utility::flag_wait( "block_heli_arrives" );
    wait 2;
    var_5 = getent( "exchange_org2", "targetname" );

    if ( isdefined( var_4 ) )
        var_4 unlink();

    var_0 waittill( "exchange" );
}

set_exchange_timings( var_0 )
{
    self endon( "death" );
    level endon( "player_attacks_exchange" );
    common_scripts\utility::flag_wait( "block_heli_arrives" );
    wait 2;
    self setflaggedanim( "single anim", maps\_utility::getanim( "exchange" ), 1, 0, 0 );
    self linkto( var_0 );
    thread exchange_unlink();
    common_scripts\utility::flag_wait( "block_heli_moves" );
    self setflaggedanim( "single anim", maps\_utility::getanim( "exchange" ), 1, 0, 1 );
    self setanimtime( maps\_utility::getanim( "exchange" ), 0.49 );
    common_scripts\utility::flag_wait( "heli_moves_again" );
    self setanimtime( maps\_utility::getanim( "exchange" ), 0.9 );
}

exchange_unlink()
{
    self endon( "death" );
    common_scripts\utility::flag_wait( "block_heli_moves" );
    self unlink();
}

exchange_vehicles_flee_conflict()
{
    common_scripts\utility::flag_wait( "player_attacks_exchange" );
    var_0 = getvehiclenodearray( "unloading_node", "script_noteworthy" );
    common_scripts\utility::array_thread( var_0, ::clear_unload );
}

clear_unload()
{
    self.script_unload = undefined;
}

exchange_dof()
{
    for (;;)
    {
        common_scripts\utility::flag_wait( "player_is_on_turret" );

        if ( getdvarint( "use_old_turret_dof" ) == 1 )
            exchange_scale_dof_while_on_turret_preh1();
        else
            exchange_scale_dof_while_on_turret();

        common_scripts\utility::flag_waitopen( "player_is_on_turret" );
        level.player setdepthoffield( 0, 0, 0, 0, 8, 8 );
    }
}

exchange_scale_dof_while_on_turret()
{
    var_0 = maps\_cinematography::dyndof( "sniper_scope" ) maps\_cinematography::dyndof_values( 4, 50, 4, 1 ) maps\_cinematography::dyndof_autofocus( 1 ) maps\_cinematography::dyndof_view_pos( level.player geteye() );
    var_0 maps\_cinematography::dyndof_autofocus_add_ignore_entity( getent( "bullet_block", "targetname" ) );
    thread maps\_cinematography::dyndof_system_start( 1 );
    var_1 = 9000;
    var_2 = 1000;
    var_3 = 8;
    var_4 = 3.2;
    var_5 = getturretfov();
    var_6 = var_5;

    while ( common_scripts\utility::flag( "player_is_on_turret" ) )
    {
        var_7 = getturretfov();
        var_8 = 1 - var_7 / var_5;
        var_9 = ( var_1 - var_2 ) * var_8;
        var_9 += var_2;
        var_10 = ( var_3 - var_4 ) * var_8;
        var_10 += var_4;

        if ( var_7 < var_6 )
        {
            var_9 = 3000 * var_8;
            var_10 += -1.7;
        }

        var_0 maps\_cinematography::dyndof_focus_distance( var_9 ) maps\_cinematography::dyndof_fstop( var_10 );
        var_6 = var_7;
        wait 0.05;
    }

    maps\_cinematography::dyndof_system_clear_all();
    maps\_cinematography::dyndof_system_end();
}

exchange_scale_dof_while_on_turret_preh1()
{
    level.fired_barrett = 0;
    level endon( "player_is_on_turret" );
    var_0 = getturretfov();
    var_1[9] = 6750;
    var_2 = 500;
    var_3 = 24000;
    var_4 = 6500;
    var_5 = 300;
    var_6 = 300;
    var_7 = 1000;
    var_8 = 6000;
    var_9 = 14000;
    var_10 = 6500;
    level.blur = 0;
    var_11 = 8.0;
    var_12 = -0.2;
    var_13 = 0.1;
    var_14 = -0.25;
    var_15 = 0;

    for (;;)
    {
        var_16 = getturretfov();

        if ( var_16 < var_0 )
        {
            if ( var_16 >= var_9 )
                var_16 = var_9;

            var_2 -= var_7;
            level.blur += var_13;
            var_15 = 0;
        }
        else if ( var_16 == var_0 )
        {
            if ( var_15 )
            {
                var_2 += var_6;
                level.blur *= 0.9;

                if ( level.blur < 0.1 )
                    level.blur = 0;
            }

            var_15 = 1;
        }
        else
        {
            var_15 = 0;
            var_2 += var_5;
            level.blur += var_14;
        }

        if ( level.fired_barrett )
        {
            level.fired_barrett = 0;
            var_2 = var_10;
            level.blur = var_11;
        }

        if ( level.blur > 12 )
            level.blur = 12;

        if ( level.blur < 0 )
            level.blur = 0;

        var_17 = var_2 - var_8;

        if ( var_17 < 0 )
            var_17 = 0;

        if ( var_2 > var_3 )
            var_2 = var_3;
        else if ( var_2 < var_4 )
            var_2 = var_4;

        level.player setdepthoffield( 0, 0, var_17, var_2, 8, 8 );

        if ( getdvarint( "r_dof_enable" ) != 1 )
            setblur( level.blur, 0.05 );

        var_0 = var_16;
        wait 0.05;
    }
}

add_waiters( var_0, var_1, var_2, var_3, var_4 )
{
    if ( self.script_flag != var_1 )
        return var_0;

    var_0[var_0.size] = var_2;

    if ( isdefined( var_3 ) )
        var_0[var_0.size] = var_3;

    if ( isdefined( var_4 ) )
        var_0[var_0.size] = var_4;

    return var_0;
}

exchange_wait_until_other_spawned_uazs_go()
{
    var_0 = [];
    var_0 = add_waiters( var_0, "uaz6", "uaz5" );
    exchange_wait_until_other_uazs_go( var_0 );
}

exchange_wait_until_other_base_uazs_go()
{
    var_0 = [];
    var_0 = add_waiters( var_0, "uaz3", "uaz2", "uaz1" );
    var_0 = add_waiters( var_0, "uaz2", "uaz1" );
    exchange_wait_until_other_uazs_go( var_0 );
}

exchange_wait_until_other_uazs_go( var_0 )
{
    common_scripts\utility::flag_set( self.script_flag );

    if ( !var_0.size )
        return;

    var_1 = gettime();

    for ( var_2 = 0; var_2 < var_0.size; var_2++ )
        common_scripts\utility::flag_wait( var_0[var_2] );

    if ( gettime() != var_1 )
    {
        wait 0.4;

        if ( self.script_flag == "uaz6" )
            wait 2.2;
    }
}

exchange_uaz_that_backs_up()
{
    common_scripts\utility::flag_wait( "uaz_reaches_pause_spot" );
    wait 0.45;
    common_scripts\utility::flag_set( "uaz_pauses_a_sec" );
}

exchange_case_velcalc()
{
    level endon( "player_attacks_exchange" );
    self endon( "death" );

    for (;;)
        wait 0.05;
}

exchange_brick_drop()
{
    var_0 = spawn( "script_model", ( 0.0, 0.0, 0.0 ) );
    var_0 linkto( self, "J_Case", ( 0.0, 0.0, 0.0 ), ( 0.0, 0.0, 0.0 ) );
    var_1 = spawn( "script_model", ( 0.0, 0.0, 0.0 ) );
    var_1 linkto( self, "TAG_GOLD_BRICK", ( 0.0, 0.0, 0.0 ), ( 0.0, 0.0, 0.0 ) );
    common_scripts\utility::flag_wait( "player_attacks_exchange" );
    wait(level.exchanger_surprise_time);

    if ( !common_scripts\utility::flag( "briefcase_placed" ) )
    {
        var_2 = self gettagorigin( "J_Case" ) - level.fake_case gettagorigin( "J_Case" );
        var_2 *= -100;
        var_0 unlink();
        var_0 setmodel( "com_gold_brick_case" );
        var_0 physicslaunchclient( var_0.origin, var_2 );
        self delete();
    }
    else
    {
        var_2 = self gettagorigin( "TAG_GOLD_BRICK" ) - level.fake_case gettagorigin( "TAG_GOLD_BRICK" );
        var_2 *= -50;
        self hidepart( "TAG_GOLD_BRICK" );
        var_1 unlink();
        var_1 setmodel( "com_golden_brick" );
        var_1 physicslaunchclient( var_1.origin, var_2 );
        self setanim( maps\_utility::getanim( "exchange" ), 1, 0, 0 );
    }
}

wait_until_seaknight_gets_close( var_0 )
{
    var_1 = getent( "seaknight_landing", "targetname" );
    level.seanode = var_1;

    for (;;)
    {
        var_2 = distance( level.seaknight.origin, var_1.origin );

        if ( var_2 < var_0 )
            return;

        wait 0.05;
    }
}

should_break_prone_hint()
{
    var_0 = getent( "player_snipe_spot", "targetname" );

    if ( distance( self.origin, var_0.origin ) >= var_0.radius )
        return 1;

    return self getstance() == "prone";
}

should_break_claymores()
{
    var_0 = maps\_utility::getplayerclaymores();

    if ( var_0 <= 0 )
        return 1;

    if ( common_scripts\utility::flag( "beacon_placed" ) )
        return 1;

    return self getcurrentweapon() == "claymore";
}

should_break_c4()
{
    var_0 = getplayerc4();

    if ( var_0 <= 0 )
        return 1;

    if ( common_scripts\utility::flag( "beacon_placed" ) )
        return 1;

    return self getcurrentweapon() == "c4";
}

should_break_c4_throw()
{
    var_0 = getplayerc4();

    if ( level.new_c4count > var_0 )
        return 1;

    if ( common_scripts\utility::flag( "beacon_placed" ) )
        return 1;

    return self getcurrentweapon() != "c4";
}

clear_path_speed( var_0 )
{
    var_1 = undefined;

    if ( isdefined( self.target ) )
        var_1 = getvehiclenode( self.target, "targetname" );
    else
    {
        var_2 = strtok( self.script_linkto, " " );
        var_1 = get_path_from_array( var_2 );
    }

    for (;;)
    {
        if ( isdefined( var_1.speed ) )
        {
            if ( var_1.speed < var_0 )
                var_1.speed = var_0;
        }

        if ( !isdefined( var_1.target ) )
            break;

        var_1 = getvehiclenode( var_1.target, "targetname" );
    }
}

exchange_wind_flag()
{
    var_0 = getent( "wind_flag", "script_noteworthy" );
    var_0 endon( "death" );

    for (;;)
    {
        var_1 = anglestoforward( var_0.angles );
        level.wind_vec = var_1 * level.wind_vel;
        wait 0.05;
    }
}

exchange_flag_rotates()
{
    wait 0.1;
    self unlink();

    for (;;)
    {
        level waittill( "wind_flag_rotation", var_0, var_1 );
        self rotateyaw( var_0, var_1, var_1 * 0.25, var_1 * 0.25 );
    }
}

exchange_wind_generator()
{
    var_0 = 140;

    for (;;)
    {
        var_1 = randomfloatrange( 0.3, 0.9 );
        level notify( "wind_flag_rotation", randomint( var_0 ) - var_0 * 0.5, var_1 );
        wait(var_1);
    }
}

exchange_flag_relinks( var_0 )
{
    waittillframeend;
    var_0 maps\_utility::ent_flag_wait( "time_to_go" );
    common_scripts\utility::flag_wait_either( "zak_uaz_leaves", "player_attacks_exchange" );
    self.angles = ( 0, var_0.angles[1] + 180, 0 );
    self linkto( var_0 );
}

exchange_flag()
{
    var_0 = maps\_utility::spawn_anim_model( "flag" );
    var_0.origin = self.origin;
    var_0.angles = self.angles;
    var_1 = getent( self.script_linkto, "script_linkname" );
    self linkto( var_0 );
    var_0 linkto( var_1 );
    var_0 thread exchange_flag_rotates();
    var_0 thread exchange_flag_relinks( var_1 );
    var_2 = 0;
    var_3 = 0.5;

    for (;;)
    {
        var_4 = level.wind_vel / 100;

        if ( var_4 < 0 )
            var_4 = 0;
        else if ( var_4 > 0.99 )
            var_4 = 0.99;

        if ( var_2 < var_4 )
        {
            var_2 += var_3;

            if ( var_2 > var_4 )
                var_2 = var_4;
        }
        else
        {
            var_2 -= var_3;

            if ( var_2 < var_4 )
                var_2 = var_4;
        }

        var_5 = randomfloatrange( 0.1, 1 );
        var_0 setanim( var_0 maps\_utility::getanim( "up" ), var_2, var_5, 5 );
        var_0 setanim( var_0 maps\_utility::getanim( "down" ), 1 - var_2, var_5, 5 );
        wait(var_5);
    }
}

exchange_heli_second_wave()
{
    var_0 = maps\_vehicle::spawn_vehicles_from_targetname_and_drive( "hotel_attack_helis" );
    common_scripts\utility::array_thread( var_0, ::exchange_second_heli );
    common_scripts\utility::array_thread( var_0, ::exchange_followup_heli_shoots_hotel );
}

exchange_heli()
{
    var_0 = maps\_vehicle::spawn_vehicle_from_targetname_and_drive( "view_block_heli" );
    var_0 thread exchange_heli_tracking();
    var_0 thread exchange_heli_think( 35, 35 );
    var_0 thread exchange_heli_preps_missiles();
    var_0 thread exchange_block_view_on_attack();
    var_0 thread maps\_utility::do_in_order( maps\_utility::waittill_msg, "death_spiral", common_scripts\utility::flag_set, "block_heli_starts" );
    var_0.snd_disable_vehicle_system = 1;
    maps\_utility::add_wait( common_scripts\utility::flag_wait, "player_attacks_exchange" );
    maps\_utility::add_wait( common_scripts\utility::flag_wait, "block_heli_starts" );
    var_0 maps\_utility::add_func( maps\_vehicle::volume_up, 0 );
    maps\_utility::add_func( ::handle_block_heli_audio, var_0 );
    thread maps\_utility::do_wait_any();
    var_0 endon( "death" );
    level endon( "player_attacks_exchange" );
    common_scripts\utility::flag_wait( "block_heli_moves" );
    maps\_utility::delaythread( 8, soundscripts\_snd::snd_message, "start_heli_block_moves" );
    wait 22.0;
    common_scripts\utility::flag_set( "heli_blocks_zak" );
    common_scripts\utility::flag_wait( "zak_escape" );
    maps\_utility::delaythread( 4.5, common_scripts\utility::flag_set, "heli_moves_again" );
    wait 4.0;

    if ( isalive( level.zakhaev ) )
    {
        level.zakhaev notify( "run_to_car" );
        level.zakhaev maps\_utility::anim_stopanimscripted();
    }

    wait 10;
    common_scripts\utility::flag_set( "zak_uaz_leaves" );
}

handle_block_heli_audio( var_0 )
{
    soundscripts\_snd::snd_message( "start_heli_block_sequence" );
    var_0 thread maps\_utility::play_sound_on_entity( "scn_se_havoc_blocking_sniper" );
}

exchange_followup_heli_shoots_hotel()
{
    self endon( "death" );
    self endon( "death_spiral" );
    maps\_vehicle::vehicle_flag_arrived( "block_heli_followup" );
    var_0 = getent( "hotel_look_org", "targetname" );
    self setlookatent( var_0 );
    common_scripts\utility::flag_wait( "apartment_explosion" );
    wait 1.5;
    exchange_heli_shoots_hotel();

    for ( var_1 = 0; var_1 < 1; var_1++ )
    {
        exchange_heli_shoots_hotel();
        wait(randomfloatrange( 1, 3 ));
    }

    wait(randomfloatrange( 18, 22 ));
    common_scripts\utility::flag_set( "block_heli_followup" );
}

exchange_block_view_on_attack()
{
    self endon( "death" );
    common_scripts\utility::flag_wait( "player_attacks_exchange" );
    self notify( "newpath" );
    var_0 = getent( "heli_block_org", "targetname" );
    self setvehgoalpos( var_0.origin, 1 );
    var_1 = getent( "hotel_look_org", "targetname" );
    self setlookatent( var_1 );
    self waittill( "goal" );
    level notify( "heli_blocking_crawling_zak" );
    self.vehicle_flags["block_heli_starts"] = 1;
    self notify( "vehicle_flag_arrived", "block_heli_starts" );
}

exchange_heli_preps_missiles()
{
    self endon( "death" );
    self endon( "death_spiral" );
    common_scripts\utility::flag_wait( "player_attacks_exchange" );
    maps\_vehicle::vehicle_flag_arrived( "block_heli_starts" );
    maps\_utility::delaythread( 5, common_scripts\utility::flag_set, "exchange_heli_alerted" );
    maps\_utility::delaythread( 5, common_scripts\utility::flag_clear, "can_save" );
    wait 15;
    common_scripts\utility::flag_set( "apartment_explosion" );
    wait 1.5;
    thread exchange_heli_shoots_hotel();
}

exchange_heli_shoots_hotel()
{
    var_0 = common_scripts\utility::getstructarray( "hotel_org", "targetname" );
    var_1 = spawn( "script_origin", ( 0.0, 0.0, 0.0 ) );
    var_2 = common_scripts\utility::random( var_0 );
    var_1.origin = var_2.origin;
    maps\sniperescape_code::shoots_down( var_1, 25 );
    var_1 maps\_utility::delaythread( 5, maps\_utility::self_delete );
}

exchange_second_heli()
{
    thread maps\_vehicle_code::helipath( self.target, 45, 45 );
}

exchange_heli_think( var_0, var_1 )
{
    thread maps\_vehicle_code::helipath( self.target, var_0, var_1 );
    maps\_vehicle::godon();
    thread exchange_heli_death_spiral();
    var_2 = common_scripts\utility::get_linked_ents();
    self.pilots = [];
    thread exchange_heli_pilot( var_2[0], "tag_pilot", "gunner_idle", "tag_window_back" );
    thread exchange_heli_pilot( var_2[1], "tag_gunner", "pilot_idle", "tag_window_front" );
    waittillframeend;
    self.bloodmodels = [];
    var_3 = self.pilots;
    common_scripts\utility::waittill_either( "death_spiral", "death" );

    if ( isalive( self ) )
    {
        var_4 = self.bloodmodels;
        self waittill( "death" );
        common_scripts\utility::array_thread( var_4, maps\_utility::_delete );
    }

    common_scripts\utility::array_thread( var_3, maps\sniperescape_code::delete_living );
}

exchange_heli_pilot( var_0, var_1, var_2, var_3 )
{
    var_4 = var_0 maps\_utility::spawn_ai();

    if ( maps\_utility::spawn_failed( var_4 ) )
        return;

    self endon( "death" );
    var_4 linkto( self, var_1 );
    var_4.helitag = var_1;
    var_4.no_magic_death = 1;
    var_4.allowdeath = 0;
    var_4.a.nodeath = 1;
    var_4.health = 50000;
    var_4 maps\_utility::gun_remove();
    var_4.heli = self;
    self.pilots[self.pilots.size] = var_4;
    thread maps\_anim::anim_generic_loop( var_4, var_2, var_1, "stop_loop" + var_1 );

    for (;;)
    {
        var_4 waittill( "damage" );

        if ( !isdefined( var_4.damagelocation ) )
            continue;

        if ( var_4.damagelocation == "head" || var_4.damagelocation == "neck" )
        {
            level.pilot_headshot = 1;
            break;
        }

        if ( isdefined( level.pilot_headshot ) )
            return;

        if ( var_4.damagelocation == "torso_upper" )
            break;
    }

    maps\_utility::arcademode_kill( var_4 geteye(), "rifle", 100 );
    var_4.is_victim = 1;
    var_5 = spawn( "script_model", ( 0.0, 0.0, 0.0 ) );
    var_5 setmodel( level.scr_model[var_1] );
    var_5 linkto( self, var_3, ( 0.0, 0.0, 0.0 ), ( 0.0, 0.0, 0.0 ) );
    self.bloodmodels[self.bloodmodels.size] = var_5;
    self notify( "death_spiral" );
    thread common_scripts\utility::play_sound_in_space( "havoc_helicopter_pilot_shot_gls", self.origin );
    thread common_scripts\utility::play_sound_in_space( "havoc_helicopter_rotor_fail", self.origin );
}

heli_pilot_death_anims( var_0 )
{
    var_0 notify( "stop_loop" + self.helitag );
    waitframe();

    if ( isdefined( self.is_victim ) && self.is_victim )
    {
        self.animname = "victim";
        var_0 thread maps\_anim::anim_single_solo( self, "shot", self.helitag );
        var_1 = level.scr_anim["victim"]["shot"];
        wait(getanimlength( var_1 ) - 0.1);
        self setanimrate( var_1, 0 );
    }
    else
    {
        self.animname = "copilot";
        var_0 thread maps\_anim::anim_loop_solo( self, "shot", self.helitag );
    }
}

exchange_heli_death_spiral()
{
    self endon( "death" );
    self waittill( "death_spiral" );
    common_scripts\utility::array_thread( self.pilots, ::heli_pilot_death_anims, self );
    maps\_utility::delaythread( 0.5, common_scripts\utility::flag_set, "heli_destroyed" );
    wait 0.2;
    level notify( "weapon_master_barrett_kill" );
    thread maps\_vehicle::kill_fx( self.model, 0 );
    maps\_vehicle_code::helicopter_crash_move();
    maps\_utility::arcademode_kill( self.origin, "explosive", 1000 );
    playfx( common_scripts\utility::getfx( "heli_explosion" ), self.origin );
    thread common_scripts\utility::play_sound_in_space( "havoc_helicopter_crash", self.origin );
    wait 0.25;
    maps\_vehicle::godoff();
    self delete();
}

exchange_ready_to_run( var_0 )
{
    maps\_utility::anim_stopanimscripted();
}

exchange_claymore()
{
    var_0 = getent( "claymore_org", "targetname" );
    var_0.origin = ( 215.199, -10977.9, 1028.0 );
    var_0.angles = ( 0.0, 161.65, 0.0 );
    level.price.grenadeweapon = "claymore";
    level.price magicgrenademanual( var_0.origin, ( 0.0, 0.0, 0.0 ), 9000 );
    var_1 = getentarray( "grenade", "classname" );
    var_2 = var_1[0];
    var_2.angles = var_0.angles;
    var_2 maps\_detonategrenades::playclaymoreeffects();
    level.price.grenadeweapon = "fraggrenade";
}

exchange_wind_flunctuates()
{
    var_0 = [];
    var_1 = [];
    level.wind_setting = "start";
    var_0["start"][0] = 20;
    var_1["start"][0] = 50;
    var_0["start"][1] = 20;
    var_1["start"][1] = 50;
    var_0["start"][2] = 20;
    var_1["start"][2] = 50;
    var_0["start"][3] = 20;
    var_1["start"][3] = 50;
    var_0["middle"][0] = 80;
    var_1["middle"][0] = 100;
    var_0["middle"][1] = 80;
    var_1["middle"][1] = 100;
    var_0["middle"][2] = 80;
    var_1["middle"][2] = 100;
    var_0["middle"][3] = 80;
    var_1["middle"][3] = 100;
    var_0["end"][0] = 0;
    var_1["end"][0] = 10;
    var_0["end"][1] = 0;
    var_1["end"][1] = 10;
    var_0["end"][2] = 10;
    var_1["end"][2] = 20;
    var_0["end"][3] = 40;
    var_1["end"][3] = 60;
    var_2 = 10;
    var_3 = 0;
    var_4 = 0;
    level.wind_vel = 0;

    for (;;)
    {
        if ( level.wind_vel < var_4 )
        {
            level.wind_vel += var_2;

            if ( level.wind_vel > var_4 )
                level.wind_vel = var_4;
        }
        else if ( level.wind_vel > var_4 )
        {
            level.wind_vel -= var_2;

            if ( level.wind_vel < var_4 )
                level.wind_vel = var_4;
        }

        var_3--;

        if ( var_3 <= 0 )
        {
            var_3 = int( randomfloatrange( 1, 2 ) * 20 );
            var_5 = var_0[level.wind_setting][level.gameskill];
            var_6 = var_1[level.wind_setting][level.gameskill];

            if ( var_6 > var_5 )
                var_4 = randomfloatrange( var_5, var_6 );
            else
                var_4 = var_6;
        }

        wait 0.05;
    }
}

hotel_rumble()
{
    playrumbleonposition( "crash_heli_rumble", level.player.origin );
    earthquake( 0.6, 3.6, level.player.origin, 6000 );
}

blow_up_hotel()
{
    if ( common_scripts\utility::flag( "hotel_destroyed" ) )
        return;

    common_scripts\utility::flag_set( "hotel_destroyed" );
    maps\_utility::delaythread( 1.75, common_scripts\utility::flag_set, "player_gets_off_turret" );
    maps\_utility::delaythread( 1.8, common_scripts\_exploder::exploder, 3 );
    maps\_utility::delaythread( 2.3, ::hotel_rumble );
    maps\_utility::delaythread( 4.2, common_scripts\_exploder::exploder, 37 );
    wait 1.5;
    maps\sniperescape_code::price_clears_dialogue();
    wait 0.5;
    level.player endon( "death" );
    var_0 = 0.314286;
    var_1 = getent( "explosion_death_trigger", "targetname" );

    for (;;)
    {
        var_1 thread deathtouch();

        if ( !isdefined( var_1.target ) )
            break;

        var_1 = getent( var_1.target, "targetname" );
        wait(var_0);
    }
}

deathtouch()
{
    if ( !isalive( level.player ) )
        return;

    var_0 = 60;

    for ( var_1 = 0; var_1 < var_0; var_1++ )
    {
        if ( level.player istouching( self ) )
        {
            radiusdamage( level.player.origin + ( 0.0, 0.0, 15.0 ), 16, 35, 35, level.player );

            if ( level.player.health <= 1 )
            {
                level.player enablehealthshield( 0 );
                level.player unlink();
            }
        }

        wait 0.05;
    }
}

exchange_mission_failure()
{
    common_scripts\utility::flag_wait( "zakhaev_escaped" );

    if ( common_scripts\utility::flag( "exchange_success" ) )
        return;

    if ( common_scripts\utility::flag( "makarov_killed" ) )
        exchange_mission_failure_paradox_deadquote();
    else
        setdvar( "ui_deadquote", &"SNIPERESCAPE_ZAKHAEV_ESCAPED" );

    maps\_utility::missionfailedwrapper();
}

exchange_mission_failure_paradox_deadquote()
{
    level.paradox_quotes = [];
    level.paradox_quotes = common_scripts\utility::array_add( level.paradox_quotes, &"SNIPERESCAPE_PARADOXFAIL_01" );
    level.paradox_quotes = common_scripts\utility::array_add( level.paradox_quotes, &"SNIPERESCAPE_PARADOXFAIL_02" );
    level.paradox_quotes = common_scripts\utility::array_add( level.paradox_quotes, &"SNIPERESCAPE_PARADOXFAIL_03" );
    level.paradox_quotes = common_scripts\utility::array_add( level.paradox_quotes, &"SNIPERESCAPE_PARADOXFAIL_04" );
    setdvarifuninitialized( "paradox_fail_quote", 0 );
    var_0 = getdvarint( "paradox_fail_quote" );
    setdvar( "ui_deadquote", level.paradox_quotes[var_0] );
    var_0++;

    if ( var_0 >= level.paradox_quotes.size )
        var_0 = 0;

    setdvar( "paradox_fail_quote", var_0 );
}

exchange_vehicle_clip()
{
    self connectpaths();
    self delete();
}

wait_for_hint_destroy()
{

}

should_break_zoom_hint()
{
    if ( !common_scripts\utility::flag( "player_is_on_turret" ) )
        return 1;

    return common_scripts\utility::flag( "player_used_zoom" );
}

player_learns_to_zoom()
{
    var_0 = getturretfov();

    for (;;)
    {
        var_1 = getturretfov();

        if ( abs( var_1 - var_0 ) > 5 )
            break;

        wait 0.05;
    }

    common_scripts\utility::flag_set( "player_used_zoom" );
}

kill_ai_along_path( var_0, var_1, var_2 )
{
    var_3 = ( 0.0, 0.0, 0.0 );

    for (;;)
    {
        if ( var_0 == var_1 )
            return;

        var_4 = bullettrace( var_0, var_1, 1, undefined );

        if ( var_4["fraction"] == 1 )
            return;

        var_3 = var_0;
        var_0 = var_4["position"] + var_2;

        if ( var_0 == var_3 )
            return;

        if ( !isalive( var_4["entity"] ) )
            continue;

        var_5 = var_4["entity"];

        if ( !issentient( var_5 ) )
            continue;

        if ( isdefined( var_5.no_magic_death ) )
        {
            var_5 dodamage( 50, ( 0.0, 0.0, 0.0 ) );
            continue;
        }

        var_5 kill( ( 0.0, 0.0, 0.0 ) );
        wait 0.05;
        return;
    }
}

_hidepart( var_0 )
{
    self hidepart( var_0 );
}

barrett_intro()
{
    level.player disableturretdismount();
    thread whitescreen();
    level.player disableweapons();
    level.player allowcrouch( 0 );
    level.player allowstand( 1 );
    var_0 = spawn( "script_model", ( 0.0, 0.0, 0.0 ) );
    var_0.origin = ( 791.7, -11707.8, 957.11 );
    var_0.angles = ( 17.38, -104.33, 0.0 );
    var_0 setmodel( "tag_origin" );
    level.view_org = var_0;
    barrett_intro_with_anim();
    wait 2;
    setsaveddvar( "phys_bulletspinscale", "0.01" );
    common_scripts\utility::flag_set( "can_use_turret" );
}

barrett_intro_with_anim()
{
    level.barrett_intro_with_anim = 1;
    level.player_intro_node = getent( level.price.target, "targetname" );
    level.player_intro_model = maps\_utility::spawn_anim_model( "player_grab_barret" );
    level.player_intro_node maps\_anim::anim_first_frame_solo( level.player_intro_model, "grab_barret_prep" );
    level.player_intro_node thread maps\_anim::anim_loop_solo( level.player_intro_model, "grab_barret_idle" );
    level.player playerlinktodelta( level.player_intro_model, "tag_player", 1.0, 25, 30, 35, 50, 0 );
}

barrett_intro_with_script( var_0 )
{
    var_0 maps\_utility::lerp_player_view_to_tag( "tag_origin", 0.1, 1, 5, 15, 10, 10 );
}

armtest()
{
    var_0 = getent( "flying_arm", "targetname" );
    var_1 = spawn( "script_origin", ( 0.0, 0.0, 0.0 ) );
    var_1.origin = var_0.origin;
    var_2 = 135;
    var_1.angles = ( 0, var_2, 0 );

    for (;;)
    {
        var_3 = spawn( "script_model", ( 0.0, 0.0, 0.0 ) );
        var_3 character\character_sp_zakhaev_onearm::main();
        var_3.animname = "zakhaev";
        var_3 maps\_utility::assign_animtree();
        wait 0.5;
        var_1 thread maps\_anim::anim_generic_first_frame( var_3, "zak_pain" );
        wait 0.1;
        var_3 thread arm_detach();
        var_1 thread maps\_anim::anim_generic( var_3, "zak_pain" );
        wait 1;
        var_3 delete();
    }
}

price_thinks_you_are_insane( var_0 )
{
    if ( !common_scripts\utility::flag( "zak_spawns" ) )
        return 1;

    if ( level.wind_setting == "start" )
        return 1;

    return isalive( level.zakhaev ) && distance( level.zakhaev.origin, var_0 ) > 600;
}

getplayerc4()
{
    var_0 = level.player getweaponslistall();
    var_1 = [];

    for ( var_2 = 0; var_2 < var_0.size; var_2++ )
    {
        var_3 = var_0[var_2];
        var_1[var_3] = level.player getweaponammoclip( var_3 );
    }

    var_4 = 0;

    if ( isdefined( var_1["c4"] ) && var_1["c4"] > 0 )
        var_4 = var_1["c4"];

    return var_4;
}

#using_animtree("generic_human");

flashback_guy_setup()
{
    self endon( "death" );
    self.ignoreall = 1;
    self.allowdeath = 1;

    switch ( self.script_startingposition )
    {
        case 0:
            level.exchange_makarov = self;
            self.name = "Suomi";
            self.team = "axis";
            self.deathanim = %uaz_rear_driver_death;
            self.tracksuit_ignore = 1;
            character\gfl\character_gfl_suomi_nofacial::main();
            break;
        case 3:
            level.exchange_yuri = self;
            self.name = "AK-12";
            self.team = "allies";
            self.deathanim = %uaz_passenger_death;
            // thread codescripts\character::setheadmodel( "head_hero_yuri_a" );
            // self setmodel( "body_spetsnaz_assault_yuri" );
            character\gfl\character_gfl_ak12::main();
            break;
    }

    thread flashback_guy_death( self.name );

    if ( getdvar( "enable_flashback_guy_nameplate" ) == "1" )
        thread maps\_hud_util::display_custom_nameplate( ::can_display_flashback_guy_name );
}

flashback_face_anims()
{
    self endon( "death" );
    level endon( "player_attacks_exchange" );
    var_0 = level.scr_anim["makarov"]["talking"];

    if ( isdefined( self ) )
        self setanim( var_0 );

    for (;;)
    {
        wait(getanimlength( var_0 ));
        self setanimrestart( var_0 );
    }
}

flashback_guys_anim()
{
    common_scripts\utility::flag_wait( "player_on_barret" );
    level.flashback_guys_uaz maps\_utility::ent_flag_wait( "unloaded" );
    wait 1.5;
    level.flashback_guys_uaz maps\_vehicle::vehicle_ai_event( "talk" );
    level.exchange_makarov thread flashback_face_anims();
    common_scripts\utility::flag_wait( "player_attacks_exchange" );
    level.flashback_guys_uaz maps\_vehicle::vehicle_ai_event( "panic" );
}

guy_talk_check( var_0, var_1 )
{
    return isdefined( maps\_vehicle_aianim::anim_pos( self, var_1 ).talk );
}

guy_talk( var_0, var_1 )
{
    var_2 = maps\_vehicle_aianim::anim_pos( self, var_1 );

    if ( isdefined( var_2.talk_transition ) )
        do_flashback_anim( var_0, var_1, var_2.talk, var_2.sittag, 1, 0, var_2.talk_transition );
    else
        do_flashback_anim( var_0, var_1, var_2.talk, var_2.sittag, 1, 0 );
}

guy_panic( var_0, var_1 )
{
    var_2 = maps\_vehicle_aianim::anim_pos( self, var_1 );

    if ( var_1 == 3 )
        do_flashback_anim( var_0, var_1, var_2.panic, var_2.sittag, 0, 1 );
    else
        do_flashback_anim( var_0, var_1, var_2.panic, var_2.sittag, 0, 0 );
}

guy_panic_check( var_0, var_1 )
{
    return isdefined( maps\_vehicle_aianim::anim_pos( self, var_1 ).panic );
}

do_flashback_anim( var_0, var_1, var_2, var_3, var_4, var_5, var_6 )
{
    var_0 endon( "newanim" );
    self endon( "death" );
    var_0 endon( "death" );

    if ( !isdefined( var_5 ) || var_5 == 0 )
    {
        if ( isdefined( var_6 ) )
            maps\_vehicle_aianim::animontag( var_0, var_3, var_6 );

        maps\_vehicle_aianim::animontag( var_0, var_3, var_2 );

        while ( isdefined( var_4 ) && var_4 )
            maps\_vehicle_aianim::animontag( var_0, var_3, var_2 );
    }
    else
    {
        var_7 = self gettagorigin( var_3 );
        var_8 = self gettagangles( var_3 );
        var_7 = ( var_7[0] + 10, var_7[1] - 9, var_7[2] - 5 );
        var_8 = ( var_8[0], var_8[1] + 50, var_8[2] );
        animonorg( var_0, var_7, var_8, var_2 );
    }

    thread maps\_vehicle_aianim::guy_idle( var_0, var_1 );
}

flashback_uaz_stop_while_driverdead()
{
    self endon( "death" );
    common_scripts\utility::flag_wait( "makarov_killed" );
    maps\_utility::ent_flag_set( "driver_dead" );

    if ( isdefined( self.hasstarted ) && self.hasstarted )
    {
        self setwaitspeed( 0 );
        self vehicle_setspeed( 0, 10 );
        self waittill( "reached_wait_speed" );
    }
}

animonorg( var_0, var_1, var_2, var_3 )
{
    var_0 notify( "animontag_thread" );
    var_0 endon( "animontag_thread" );
    var_4 = "animontagdone";
    var_5 = self;
    var_0 animscripted( var_4, var_1, var_2, var_3 );
    thread maps\_vehicle_aianim::donotetracks( var_0, var_5, var_4 );
    wait(getanimlength( var_3 ) * 0.28);
    var_0 setanimknob( var_3, 1, 1, 0.1 );
    wait 4;
    var_0 setanimknob( var_3, 1, 1, 0.3 );
    wait 3;
    var_0 setanimknob( var_3, 1, 1, 0 );
    var_0 waittillmatch( var_4, "end" );
    var_0 notify( "anim_on_tag_done" );
    var_0.ragdoll_getout_death = undefined;
}

flashback_guy_death( var_0 )
{
    self endon( "player_gets_off_turret" );
    self waittill( "death" );
    level notify( "flashback_guy_dead", var_0 );
    common_scripts\utility::flag_set( "player_attacks_exchange" );
}

can_display_flashback_guy_name()
{
    var_0 = 5;

    if ( getturretfov() > var_0 )
        return 0;

    var_1 = 0.075;
    var_2 = ( 0.0, 0.0, -8.0 );
    var_3 = common_scripts\utility::within_fov( level.player geteye(), level.player getplayerangles(), self gettagorigin( "tag_eye" ) + var_2, cos( var_1 ) );

    if ( !var_3 )
        return 0;

    var_4 = getent( "bullet_block", "targetname" );
    var_5 = maps\_vehicle::get_vehicle_from_targetname( "view_block_heli" );
    var_6 = 0;
    var_7 = level.player geteye() + 10000 * anglestoforward( level.player getplayerangles() );
    var_8 = bullettrace( level.player geteye(), var_7, 1, var_4 );

    if ( isdefined( var_8["entity"] ) && var_8["entity"] != self )
    {
        if ( isdefined( var_5 ) && var_8["entity"] == var_5 )
            var_6 = 1;
        else if ( isdefined( var_8["entity"].team ) && var_8["entity"].team == "axis" )
            var_6 = 1;
    }

    return !var_6;
}

flashback_guys_failure()
{
    level endon( "player_gets_off_turret" );

    for (;;)
    {
        level waittill( "flashback_guy_dead", var_0 );

        if ( var_0 == "Makarov" )
        {
            level.flashback_guys_uaz maps\_utility::ent_flag_set( "driver_dead" );
            common_scripts\utility::flag_set( "makarov_killed" );
            objective_add( maps\sniperescape_wounding::getobj( "future" ), "active", &"SNIPERESCAPE_CHANGE_THE_FUTURE" );
            objective_indentlevel( maps\sniperescape_wounding::getobj( "future" ), 1 );
            maps\_utility::objective_complete( maps\sniperescape_wounding::getobj( "future" ) );
            continue;
        }

        if ( var_0 == "Yuri" )
        {
            setdvar( "ui_deadquote", &"SNIPERESCAPE_FRIENDLY_FIRE" );
            maps\_utility::missionfailedwrapper();
            return;
        }
    }
}

flashback_time_paradox_monitor()
{
    level endon( "player_gets_off_turret" );
    common_scripts\utility::flag_wait_all( "exchange_success", "makarov_killed" );
    maps\_utility::giveachievement_wrapper( "TIME_PARADOX" );
}
