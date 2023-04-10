// H1 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

stairs()
{

}

escape_debri()
{
    var_0 = undefined;
    var_1 = undefined;
    var_2 = undefined;

    switch ( self.script_noteworthy )
    {
        case "panel_mid":
            var_0 = "lead";
            var_1 = 500;
            var_2 = 1;
            self.target = undefined;
            break;
        case "panel_high":
            var_0 = "last";
            var_1 = 300;
            var_2 = 2;
            break;
        case "pole_mid":
            var_0 = "lead";
            var_1 = 768;
            var_2 = 1;
            break;
        default:
            return;
    }

    var_3 = var_1 * var_1;

    if ( !isdefined( self.target ) )
    {
        self delete();
        return;
    }

    escape_debri_wait( var_0, var_3 );
    thread escape_debri_launch( var_2 );
}

escape_debri_wait( var_0, var_1 )
{
    var_2 = [];
    var_2[var_2.size] = level.heroes3["price"];
    var_2[var_2.size] = level.heroes3["alavi"];
    var_2[var_2.size] = level.heroes3["grigsby"];

    for (;;)
    {
        var_3 = escape_heroes_findorder( var_2 );

        if ( distancesquared( var_3[var_0].origin, self getorigin() ) < var_1 )
            break;

        wait 0.05;
    }
}

escape_debri_launch( var_0 )
{
    wait(randomfloat( var_0 ));
    var_1 = anglestoright( ( 0.0, 180.0, 50.0 ) );
    var_1 = maps\_utility::vector_multiply( var_1, 10000 );
    var_2 = getent( self.target, "targetname" );
    var_2 show();
    self delete();
    thread common_scripts\utility::play_sound_in_space( "cgoship_panel_break_away", var_2.origin );
    var_2 physicslaunchclient( var_2.origin, var_1 );
}

escape_event()
{
    var_0 = "fx";
    var_1 = undefined;
    var_2 = undefined;
    var_3 = undefined;
    var_4 = undefined;
    var_5 = undefined;
    var_6 = 0;
    var_7 = undefined;
    var_8 = 0;
    var_9 = undefined;
    var_10 = undefined;
    var_11 = undefined;
    var_12 = undefined;
    var_13 = undefined;
    var_14 = -500;
    var_15 = strtok( self.script_parameters, ":;,= " );

    for ( var_16 = 0; var_16 < var_15.size; var_16++ )
    {
        switch ( tolower( var_15[var_16] ) )
        {
            case "type":
                var_16++;
                var_0 = var_15[var_16];
                continue;
            case "quake":
                var_16++;

                if ( tolower( var_15[var_16] ) == "true" )
                    var_6 = 1;
                else if ( tolower( var_15[var_16] ) == "playeronly" )
                    var_6 = 2;

                continue;
            case "fx":
                var_16++;
                var_1 = var_15[var_16];
                continue;
            case "exploder_id":
                var_16++;
                var_2 = var_15[var_16];
                continue;
            case "snd":
                var_16++;
                var_4 = var_15[var_16];
                continue;
            case "sndloop":
                var_16++;
                var_4 = var_15[var_16];
                continue;
            case "sndoneshot":
                var_16++;
                var_3 = var_15[var_16];
                continue;
            case "sndobj":
                var_16++;
                var_5 = var_15[var_16];
                continue;
            case "flag":
                var_16++;
                var_7 = var_15[var_16];
                continue;
            case "rotang":
                var_16++;
                var_9 = ( int( var_15[var_16] ), int( var_15[var_16 + 1] ), int( var_15[var_16 + 2] ) );
                var_16 += 2;
                continue;
            case "delay":
                var_16++;
                var_17 = int( var_15[var_16] );
                var_8 = var_17 * 0.001;
                continue;
            case "rottime":
                var_16++;
                var_17 = int( var_15[var_16] );
                var_10 = var_17 * 0.001;
                continue;
            case "rotacc":
                var_16++;
                var_17 = int( var_15[var_16] );
                var_11 = var_17 * 0.001;
                continue;
            case "rotdec":
                var_16++;
                var_17 = int( var_15[var_16] );
                var_12 = var_17 * 0.001;
                continue;
        }
    }

    self waittill( "trigger" );
    wait(var_8);

    switch ( var_0 )
    {
        case "fx":
            var_13 = common_scripts\utility::getstructarray( self.target, "targetname" );

            for ( var_16 = 0; var_16 < var_13.size; var_16++ )
            {
                var_18 = spawn( "script_model", var_13[var_16].origin );
                var_18.angles = var_13[var_16].angles;
                var_18 setmodel( "tag_origin" );
                var_18 hide();

                switch ( var_1 )
                {
                    case "event_waterleak":
                        if ( isdefined( var_13[var_16].target ) )
                        {
                            var_19 = getent( var_13[var_16].target, "targetname" );
                            var_19 thread escape_event_waterleak_blur();
                        }

                        break;
                }

                var_18 thread escape_event_fx( var_1, var_3, var_4, var_7, var_2, var_5 );
            }

            break;
        case "cargocontainer":
            var_20 = getent( self.target, "targetname" );
            var_21 = var_14;
            var_22 = ( 0.0, 0.0, 90.0 );
            var_23 = undefined;
            var_24 = undefined;

            if ( var_20.angles != ( 0.0, 90.0, 0.0 ) && var_20.angles != ( 0.0, 270.0, 0.0 ) )
            {
                var_25 = maps\_utility::vector_multiply( anglestoup( ( 0.0, 360.0, 0.0 ) ), 4 );
                var_26 = maps\_utility::vector_multiply( anglestoright( ( 0.0, 360.0, 0.0 ) ), -1 );
                var_24 = vectornormalize( var_25 + var_26 );
                var_21 *= 800;
                var_27 = anglestoright( ( 0.0, 360.0, 0.0 ) );
                var_27 = maps\_utility::vector_multiply( var_27, 64 );
                var_23 = var_20.origin + var_27;
            }
            else
            {
                var_25 = anglestoup( level._sea_org.angles );
                var_26 = maps\_utility::vector_multiply( anglestoright( level._sea_org.angles ), -1 );
                var_23 = var_20.origin + var_22;
                var_24 = vectornormalize( var_25 + var_26 );
            }

            var_24 *= ( var_21 * 0.75 );
            var_20 physicslaunchclient( var_23, var_24 );
            break;
        case "physics":
            var_13 = getentarray( self.target, "targetname" );

            for ( var_16 = 0; var_16 < var_13.size; var_16++ )
            {
                var_21 = var_14;
                var_22 = ( randomfloat( 20 ), randomfloat( 20 ), randomfloat( 20 ) );
                var_23 = var_13[var_16].origin + var_22;
                var_24 = anglestoup( level._sea_org.angles );
                var_24 *= var_21;
                var_13[var_16] physicslaunchclient( var_23, var_24 );
            }

            break;
        case "rotate":
            var_13 = getentarray( self.target, "targetname" );

            for ( var_16 = 0; var_16 < var_13.size; var_16++ )
            {
                if ( isdefined( var_13[var_16].target ) )
                {
                    var_28 = getentarray( var_13[var_16].target, "targetname" );

                    for ( var_29 = 0; var_29 < var_28.size; var_29++ )
                        var_28[var_29] linkto( var_13[var_16] );
                }

                var_3 = var_4;
                var_13[var_16] thread escape_event_rotate( var_3, var_12, var_11, var_9, var_10, var_5 );
            }

            break;
    }

    if ( !var_6 )
        return;

    if ( var_6 > 1 )
    {
        earthquake( 0.25, 0.75, level.player.origin, 1024 );
        level.player playrumbleonentity( "tank_rumble" );
        return;
    }

    if ( distance( level.player.origin, self.origin ) < 770 )
    {
        earthquake( 0.4, 1.25, level.player.origin, 1024 );
        thread escape_event_player();
    }

    if ( !isdefined( level.escape_stumble_num ) )
        level.escape_stumble_num = 1;

    var_30 = getarraykeys( level.heroes3 );

    for ( var_16 = 0; var_16 < var_30.size; var_16++ )
    {
        var_31 = var_30[var_16];
        level.heroes3[var_31] thread escape_event_ai( level.escape_stumble_num );

        if ( level.escape_stumble_num < 3 )
        {
            level.escape_stumble_num++;
            continue;
        }

        level.escape_stumble_num = 1;
    }

    maps\_utility::array_wait( level.heroes3, "done_stumbling" );
    level notify( "let player up" );
}

escape_event_rotate( var_0, var_1, var_2, var_3, var_4, var_5 )
{
    if ( isdefined( var_0 ) )
    {
        var_6 = escape_event_get_snd_entity_obj( var_5 );
        var_6 thread maps\_utility::play_sound_on_entity( var_0 );
    }

    var_7 = self.angles;

    if ( isdefined( var_1 ) )
        self rotateto( var_3, var_4, var_2, var_1 );
    else if ( isdefined( var_2 ) )
        self rotateto( var_3, var_4, var_2 );
    else
    {
        self rotateto( var_3, var_4 );

        if ( isdefined( self.script_noteworthy ) )
        {
            wait(var_4 * 0.75);
            thread escape_event_wobble_pipe();
        }
        else
        {
            wait(var_4);
            var_8 = var_7 + maps\_utility::vector_multiply( var_3, 0.3 );
            var_9 = var_4 * 0.5;
            self rotateto( var_8, var_9, 0, var_9 );
            wait(var_9);
            self rotateto( var_3, var_9, var_9, 0 );
        }
    }
}

escape_event_wobble_pipe()
{
    var_0 = self.angles;
    var_1 = 45;
    var_2 = 720;
    var_3 = 0.75;
    var_4 = 0.8;
    var_5 = float( self.script_noteworthy );

    for (;;)
    {
        self rotateto( ( var_0[0], var_0[1], var_0[2] + var_5 * sin( var_1 ) * -1 ), 0.1 );

        if ( var_1 >= var_2 )
        {
            var_1 = 0;
            var_5 *= var_3;

            if ( var_5 < var_4 )
                return;
        }

        var_1 += var_1;
        wait 0.1;
    }
}

escape_event_waterleak_blur()
{
    self endon( "death" );
    var_0 = 32;
    var_1 = var_0 * var_0;

    for (;;)
    {
        self waittill( "trigger" );
        setblur( 2.4, 0.15 );

        while ( level.player istouching( self ) )
            wait 0.1;

        wait 0.1;
        setblur( 0, 0.15 );
    }
}

escape_event_fx( var_0, var_1, var_2, var_3, var_4, var_5 )
{
    if ( isdefined( var_4 ) )
        common_scripts\_exploder::exploder( var_4 );
    else
        playfxontag( level._effect[var_0], self, "tag_origin" );

    thread escape_event_sndfx( var_1, var_2, var_5 );

    if ( !isdefined( var_3 ) )
        return;

    if ( var_0 == "event_waterleak" )
        _playloopsound( "cgo_water_breach_large_loop" );

    common_scripts\utility::flag_wait( var_3 );

    if ( isdefined( var_4 ) )
        maps\_utility::stop_exploder( var_4 );

    self stoploopsound();
    waittillframeend;
    self delete();
}

escape_event_sndfx( var_0, var_1, var_2 )
{
    var_3 = escape_event_get_snd_entity_obj( var_2 );

    if ( isdefined( var_0 ) )
        var_3 thread maps\_utility::play_sound_on_entity( var_0 );

    if ( isdefined( var_1 ) )
        var_3 thread common_scripts\utility::play_loop_sound_on_entity( var_1 );
}

escape_event_get_snd_entity_obj( var_0 )
{
    var_1 = self;

    if ( isdefined( var_0 ) )
    {
        var_2 = maps\_utility::getent_or_struct( var_0, "targetname" );

        if ( isdefined( var_2 ) )
            var_1 = var_2;
    }

    return var_1;
}

escape_event_ai( var_0 )
{
    var_1 = "stumble" + var_0;
    self.springleak = 1;
    var_2 = getanimlength( level.scr_anim[self.animname][var_1] );
    thread maps\_anim::anim_single_solo( self, var_1 );
    wait(var_2 - 0.2);
    self stopanimscripted();
    self notify( "single_anim_done" );
    self notify( "done_stumbling" );
    self.springleak = 0;
}

escape_event_player()
{
    level.player allowstand( 0 );
    level.player allowprone( 0 );
    level.player setstance( "crouch" );
    level.player setvelocity( ( 0.0, 1.0, 0.0 ) );
    player_speed_set_cargoship( 135, 0.1 );
    maps\_utility::delaythread( 0.5, ::player_speed_set_cargoship, 185, 2.5 );
    level.player playrumbleonentity( "tank_rumble" );
    maps\_utility::delaythread( 0.05, ::blur_overlay, 2.4, 0.25 );
    maps\_utility::delaythread( 0.3, ::blur_overlay, 0, 0.5 );
    level.player maps\_utility::delaythread( 0.1, maps\_utility::play_sound_on_entity, "breathing_hurt" );
    level waittill( "let player up" );
    level.player maps\_utility::delaythread( 0.1, maps\_utility::play_sound_on_entity, "breathing_better" );
    level.player allowstand( 1 );
    level.player allowprone( 1 );
    level.player setstance( "stand" );
}

escape_player_last_quake()
{
    level.player setvelocity( ( 0.0, 90.0, 0.0 ) );
    earthquake( 0.25, 1.5, level.player.origin, 1024 );
    player_speed_set_cargoship( 100, 0.1 );
    maps\_utility::delaythread( 0.25, ::player_speed_set_cargoship, 140, 2 );
    level.player playrumbleonentity( "tank_rumble" );
}

misc_light_flicker( var_0, var_1, var_2 )
{
    var_3 = 0.25;
    var_4 = 0.45;
    var_5 = self getlightintensity();
    var_6 = 0;
    var_7 = undefined;
    var_8 = undefined;
    var_9 = var_5;
    var_10 = 0;
    var_11 = 0;
    var_12 = 0;
    var_13 = undefined;

    if ( isdefined( var_0 ) )
    {
        var_14 = maps\_utility::getfxarraybyid( var_0 );
        var_13 = maps\_utility::getclosestfx( self.origin, var_14 );
        var_12 = 1;
    }

    var_15 = getentarray( "script_lightmodel", "targetname" );
    var_16 = common_scripts\utility::getclosest( self.origin, var_15, 32 );

    if ( isdefined( var_16 ) )
    {
        var_8 = var_16.model;
        var_11 = 1;

        switch ( var_8 )
        {
            case "com_lightbox_on":
                var_7 = "com_lightbox";
                break;
            case "ch_industrial_light_02_on":
                var_7 = "ch_industrial_light_02_off";
                break;
            case "me_lightfluohang_on":
                var_7 = "me_lightfluohang";
                break;
        }
    }

    if ( isdefined( var_2 ) )
        common_scripts\utility::flag_wait( var_2 );

    for (;;)
    {
        for ( var_10 = randomintrange( 1, 10 ); var_10; var_10-- )
        {
            wait(randomfloatrange( 0.05, 0.1 ));

            if ( var_9 == var_5 )
            {
                var_9 = var_6;
                self setlightintensity( var_6 );

                if ( var_12 )
                    var_13 common_scripts\utility::pauseeffect();

                if ( var_11 )
                    var_16 setmodel( var_7 );

                continue;
            }

            if ( common_scripts\utility::flag( var_1 ) )
            {
                var_9 = var_5;
                self setlightintensity( var_5 );

                if ( var_12 )
                    var_13 maps\_utility::restarteffect();

                if ( var_11 )
                    var_16 setmodel( var_8 );

                continue;
            }

            common_scripts\utility::flag_wait( var_1 );
        }

        wait(randomfloatrange( var_3, var_4 ));
    }
}

escape_heroes_holdtheline_run_or_walk_asone( var_0 )
{
    if ( var_0["last"].run_speed_state == "sprint" )
    {
        switch ( self.position )
        {
            case "lead":
                if ( distance( self.origin, var_0["middle"].origin ) < self.aimaxdist )
                    self.dist = var_0["last"].dist;

                break;
            case "middle":
                if ( distance( self.origin, var_0["last"].origin ) < self.aimaxdist )
                    self.dist = var_0["last"].dist;

                break;
        }
    }
    else if ( var_0["lead"].run_speed_state == "jog" )
    {
        switch ( self.position )
        {
            case "middle":
                if ( distance( self.origin, var_0["lead"].origin ) < self.aimaxdist )
                    self.dist = var_0["lead"].dist;

                break;
            case "last":
                if ( distance( self.origin, var_0["middle"].origin ) < self.aimaxdist )
                    self.dist = var_0["lead"].dist;

                break;
        }
    }
}

escape_heroes_holdtheline_stay_in_single_file( var_0, var_1 )
{
    var_2 = undefined;

    switch ( self.position )
    {
        case "lead":
            var_2 = var_0["middle"];
            break;
        case "middle":
            var_2 = var_0["last"];
            break;
    }

    escape_heroes_holdtheline_adjust_rate_vs_ai( var_2, var_1 );
}

escape_heroes_holdtheline_adjust_rate_vs_ai( var_0, var_1 )
{
    if ( var_1 )
        wait 5.0;

    if ( isdefined( var_0 ) )
    {
        if ( distance( self.origin, var_0.origin ) < self.aimindist )
        {
            if ( self.moveplaybackrate < 1.2 )
                self.moveplaybackrate += 0.005;
        }
        else if ( distance( self.origin, var_0.origin ) > self.aimaxdist )
        {
            if ( self.moveplaybackrate > 0.9 )
                self.moveplaybackrate -= 0.005;
        }
    }
    else if ( self.run_speed_state == "sprint" && self.moveplaybackrate < self.aimaxsprintrate )
        self.moveplaybackrate = self.aimaxsprintrate;
    else if ( self.run_speed_state == "jog" && self.moveplaybackrate > self.aiminjograte )
        self.moveplaybackrate -= 0.005;
    else if ( self.moveplaybackrate < 1 )
        self.moveplaybackrate += 0.005;
    else if ( self.moveplaybackrate > 1 )
        self.moveplaybackrate -= 0.005;
}

escape_heroes_holdtheline_decide_jog_run_sprint( var_0, var_1 )
{
    if ( self.dist < var_1 )
    {
        if ( self.run_speed_state == "sprint" || self.springleak == 1 )
            return;

        self.run_speed_state = "sprint";

        if ( isdefined( self.escape_run_section ) )
            maps\_utility::set_generic_run_anim( level.current_run[self.escape_run_section][self.run_speed_state] );
        else
            maps\_utility::clear_run_anim();

        if ( self.moveplaybackrate < self.aimaxsprintrate )
            self.moveplaybackrate = self.aimaxsprintrate;
    }
    else if ( self.dist < var_0 )
    {
        if ( self.run_speed_state == "run" )
            return;

        self.run_speed_state = "run";

        if ( isdefined( self.escape_run_section ) )
            maps\_utility::set_generic_run_anim( level.current_run[self.escape_run_section][self.run_speed_state] );
        else
            maps\_utility::clear_run_anim();

        self.moveplaybackrate = 1;
    }
    else if ( self.dist < var_0 * 2 )
    {
        if ( self.run_speed_state == "jog" || self.springleak == 1 )
            return;

        self.run_speed_state = "jog";

        if ( isdefined( self.escape_run_section ) )
            maps\_utility::set_generic_run_anim( level.current_run[self.escape_run_section][self.run_speed_state] );
        else
            maps\_utility::clear_run_anim();

        if ( self.moveplaybackrate > self.aiminjograte )
            self.moveplaybackrate = self.aiminjograte;
    }
}

escape_heroes_holdtheline( var_0, var_1, var_2, var_3, var_4, var_5 )
{
    self notify( "stop_dynamic_run_speed" );
    self endon( "stop_dynamic_run_speed" );
    self.oldwalkdist = self.walkdist;
    self.old_moveplaybackrate = self.moveplaybackrate;
    self.run_speed_state = "run";
    self.oldanimname = self.animname;
    self.animname = "escape";
    self.dist = 0;
    self.springleak = 0;
    self.disableexits = 1;
    self.disablearrivals = 1;

    if ( !isdefined( var_2 ) )
        var_2 = var_0 * 0.5;

    self.aimaxdist = 150;
    self.aimindist = 75;

    if ( isdefined( var_3 ) )
        self.aimaxsprintrate = var_3;
    else
        self.aimaxsprintrate = 1.25;

    self.aiminjograte = 0.85;
    self.movestand_moveoverride_overrideanimrate = 1.0;
    var_6 = isdefined( var_5 );

    for (;;)
    {
        wait 0.05;
        var_7 = escape_heroes_findorder( var_1 );

        if ( isdefined( var_4 ) )
            self.dist = var_2 - 5;
        else
        {
            switch ( self.position )
            {
                case "lead":
                    var_8 = var_7["middle"];
                    break;
                case "middle":
                    var_8 = var_7["last"];
                    break;
                default:
                    var_8 = level.player;
                    break;
            }

            self.dist = distance( self.origin, var_8.origin );
        }

        escape_heroes_holdtheline_run_or_walk_asone( var_7 );
        escape_heroes_holdtheline_stay_in_single_file( var_7, var_6 );
        escape_heroes_holdtheline_decide_jog_run_sprint( var_0, var_2 );
        var_6 = 0;
    }
}

escape_heroes_findorder( var_0 )
{
    var_1 = [];
    var_2 = 0;
    var_1["last"] = var_0[0];

    for ( var_2 = 1; var_2 < var_0.size; var_2++ )
    {
        var_3 = distancesquared( var_1["last"].origin, level.player.origin );
        var_4 = distancesquared( var_0[var_2].origin, level.player.origin );

        if ( var_3 > var_4 )
            var_1["last"] = var_0[var_2];
    }

    var_1[2] = var_1["last"];
    var_1["last"].position = "last";
    var_1["lead"] = var_0[0];

    for ( var_2 = 1; var_2 < var_0.size; var_2++ )
    {
        var_3 = distancesquared( var_1["lead"].origin, level.player.origin );
        var_4 = distancesquared( var_0[var_2].origin, level.player.origin );

        if ( var_3 < var_4 )
            var_1["lead"] = var_0[var_2];
    }

    var_1[0] = var_1["lead"];
    var_1["lead"].position = "lead";

    for ( var_2 = 0; var_2 < var_0.size; var_2++ )
    {
        if ( var_0[var_2] != var_1["lead"] && var_0[var_2] != var_1["last"] )
        {
            var_1["middle"] = var_0[var_2];
            var_1[1] = var_0[var_2];
            var_0[var_2].position = "middle";
            break;
        }
    }

    return var_1;
}

escape_heroes_run_wait( var_0 )
{
    var_1 = var_0 + "_flag";
    level endon( var_1 );
    var_2 = getnodearray( var_0 + "_end", "targetname" );
    var_3 = [];

    for ( var_4 = 0; var_4 < var_2.size; var_4++ )
        var_3[int( var_2[var_4].script_noteworthy )] = var_2[var_4];

    var_5 = [];
    var_5[var_5.size] = level.heroes3["price"];
    var_5[var_5.size] = level.heroes3["alavi"];
    var_5[var_5.size] = level.heroes3["grigsby"];
    var_6 = escape_heroes_findorder( var_5 );

    for ( var_4 = 0; var_4 < 3; var_4++ )
    {
        if ( var_6[var_4].script_noteworthy == self.script_noteworthy )
        {
            thread maps\_utility::enable_arrivals();
            self setgoalnode( var_3[var_4 + 1] );
            self.goalradius = 16;
            break;
        }
    }
}

escape_waterlevel_parts( var_0 )
{
    switch ( self.script_noteworthy )
    {
        case "path":
            var_0.path = self;
            break;
    }
}

escape_quake()
{
    level.player endon( "stopquake" );

    while ( !common_scripts\utility::flag( "escape_tilt_30" ) )
    {
        wait 0.1;
        earthquake( 0.15, 0.1, level.player.origin, 256 );
    }

    while ( !common_scripts\utility::flag( "escape_cargohold1_enter" ) )
    {
        wait 0.1;
        earthquake( 0.175, 0.1, level.player.origin, 256 );
    }

    while ( !common_scripts\utility::flag( "escape_hallway_lower_flag" ) )
    {
        wait 0.1;
        earthquake( 0.2, 0.1, level.player.origin, 256 );
    }

    while ( !common_scripts\utility::flag( "end_start_player_anim" ) )
    {
        wait 0.1;
        earthquake( 0.225, 0.1, level.player.origin, 256 );
    }
}

escape_explosion_drops()
{
    var_0 = getent( "escape_first_falling_container", "targetname" );
    var_1 = getentarray( "escape_first_fallen_container", "targetname" );
    var_2 = 2;
    var_3 = 0;
    var_4 = 0;
    var_0 rotateto( ( 0.0, 45.0, 0.0 ), 2 );
    wait(var_2);
    var_0 delete();

    for ( var_5 = 0; var_5 < var_1.size; var_5++ )
    {
        var_1[var_5] solid();
        var_1[var_5] show();
    }

    var_6 = getentarray( "escape_big_blocker_before", "targetname" );
    var_7 = getentarray( "escape_big_blocker", "targetname" );

    for ( var_5 = 0; var_5 < var_6.size; var_5++ )
        var_6[var_5] delete();

    for ( var_5 = 0; var_5 < var_7.size; var_5++ )
    {
        var_7[var_5] show();
        var_7[var_5] solid();

        if ( var_7[var_5].spawnflags & 1 )
            var_7[var_5] disconnectpaths();
    }
}

escape_shellshock_blinking()
{
    level endon( "escape_unlink_player" );
    var_0 = create_overlay_element( "black", 0 );
    var_0 h1_fade_overlay( 1, 0.5, 0, 0.5 );
    var_0 h1_fade_overlay( 0.5, 0.25, 0, 0.25 );
    var_0 h1_fade_overlay( 1, 0.5, 0, 0.5 );
    var_0 h1_fade_overlay( 1, 0.5, 0, 0.5 );
    var_0 h1_fade_overlay( 1, 0.5, 0, 0.5 );
    common_scripts\utility::flag_wait( "escape_get_to_catwalks" );
    var_0 destroy();
}

escape_shellshock_blur()
{
    level endon( "escape_unlink_player" );
    wait 2.2;
    setblur( 4.0, 0.5 );
    wait 2.0;
    setblur( 0.0, 3.0 );
    wait 4.75;
    setblur( 3.0, 2.0 );
    wait 4.5;
    setblur( 0.0, 0.6 );
}

escape_shellshock_breathing()
{
    level.player maps\_utility::delaythread( 1.5, maps\_utility::play_sound_on_entity, "breathing_hurt_start" );
    level.player maps\_utility::delaythread( 2.5, maps\_utility::play_sound_on_entity, "breathing_hurt" );
    level.player maps\_utility::delaythread( 4, maps\_utility::play_sound_on_entity, "breathing_hurt" );
    level.player maps\_utility::delaythread( 5, maps\_utility::play_sound_on_entity, "breathing_hurt" );
    level.player maps\_utility::delaythread( 8.5, maps\_utility::play_sound_on_entity, "breathing_hurt" );
    level.player maps\_utility::delaythread( 11, maps\_utility::play_sound_on_entity, "breathing_hurt" );
    level.player maps\_utility::delaythread( 13, maps\_utility::play_sound_on_entity, "breathing_better" );
    level.player maps\_utility::delaythread( 16, maps\_utility::play_sound_on_entity, "breathing_better" );
    level.player maps\_utility::delaythread( 21, maps\_utility::play_sound_on_entity, "breathing_better" );
    level.player maps\_utility::delaythread( 24, maps\_utility::play_sound_on_entity, "breathing_better" );
}

escape_shellshock_vision()
{
    var_0 = create_overlay_element( "black", 0 );
    var_0 maps\_utility::delaythread( 1.5, ::exp_fade_overlay, 1, 0.5 );
    var_0 maps\_utility::delaythread( 2.25, ::exp_fade_overlay, 0, 0.5 );
    var_0 maps\_utility::delaythread( 3, ::exp_fade_overlay, 0.5, 0.25 );
    var_0 maps\_utility::delaythread( 3.25, ::exp_fade_overlay, 0, 0.25 );
    var_0 maps\_utility::delaythread( 5, ::exp_fade_overlay, 1, 0.5 );
    var_0 maps\_utility::delaythread( 6, ::exp_fade_overlay, 0, 0.5 );
    var_0 maps\_utility::delaythread( 10, ::exp_fade_overlay, 1, 0.5 );
    var_0 maps\_utility::delaythread( 10.75, ::exp_fade_overlay, 0, 0.5 );
    var_0 maps\_utility::delaythread( 13, ::exp_fade_overlay, 1, 0.5 );
    var_0 maps\_utility::delaythread( 13.75, ::exp_fade_overlay, 0, 0.5 );
    maps\_utility::delaythread( 0.75, ::blur_overlay, 4.8, 0.5 );
    maps\_utility::delaythread( 1.25, ::blur_overlay, 0, 4 );
    maps\_utility::delaythread( 7.25, ::blur_overlay, 4.8, 2 );
    maps\_utility::delaythread( 9.25, ::blur_overlay, 0, 2 );
    maps\_utility::delaythread( 13, ::blur_overlay, 7.2, 1 );
    maps\_utility::delaythread( 14, ::blur_overlay, 0, 1 );
    level.player maps\_utility::delaythread( 1.5, maps\_utility::play_sound_on_entity, "breathing_hurt_start" );
    level.player maps\_utility::delaythread( 2.5, maps\_utility::play_sound_on_entity, "breathing_hurt" );
    level.player maps\_utility::delaythread( 4, maps\_utility::play_sound_on_entity, "breathing_hurt" );
    level.player maps\_utility::delaythread( 5, maps\_utility::play_sound_on_entity, "breathing_hurt" );
    level.player maps\_utility::delaythread( 8.5, maps\_utility::play_sound_on_entity, "breathing_hurt" );
    level.player maps\_utility::delaythread( 11, maps\_utility::play_sound_on_entity, "breathing_hurt" );
    level.player maps\_utility::delaythread( 13, maps\_utility::play_sound_on_entity, "breathing_better" );
    level.player maps\_utility::delaythread( 16, maps\_utility::play_sound_on_entity, "breathing_better" );
    level.player maps\_utility::delaythread( 21, maps\_utility::play_sound_on_entity, "breathing_better" );
    level.player maps\_utility::delaythread( 24, maps\_utility::play_sound_on_entity, "breathing_better" );
    common_scripts\utility::flag_wait( "escape_get_to_catwalks" );
    var_0 destroy();
}

escape_shellshock_heartbeat()
{
    level endon( "stop_heartbeat_sound" );
    var_0 = -0.5;

    for (;;)
    {
        level.player maps\_utility::play_sound_on_entity( "breathing_heartbeat" );

        if ( var_0 > 0 )
            wait(var_0);

        var_0 += 0.1;
    }
}

escape_shellshock_depthoffield()
{
    level.player enablephysicaldepthoffieldscripting();
    setsaveddvar( "r_mbEnable", 2 );
    wait 1.34;
    level.player setphysicaldepthoffield( 0.7, 50, 4.0, 4.0 );
    wait 2.5;
    level.player setphysicaldepthoffield( 1.5, 56, 1.6, 1.6 );
    wait 6.5;
    level.player setphysicaldepthoffield( 1.0, 50, 1.6, 1.6 );
    wait 2.5;
    level.player setphysicaldepthoffield( 2.0, 24, 2.8, 2.8 );
    wait 1.66;
    level.player setphysicaldepthoffield( 1.0, 56, 4.0, 4.0 );
    wait 1.16;
    level.player setphysicaldepthoffield( 0.9, 74, 1.3, 1.3 );
    wait 3.34;
    setsaveddvar( "r_mbEnable", 0 );
    level.player setphysicaldepthoffield( 1.0, 70, 2.0, 2.0 );
    wait 1.16;
    level.player setphysicaldepthoffield( 3.0, 28, 3.5, 3.5 );
    wait 1.16;
    level.player setphysicaldepthoffield( 5.0, 10, 1.7, 1.7 );
    wait 1.1;
    level.player setphysicaldepthoffield( 4.0, 300, 3.0, 3.0 );
    wait 4.0;
    level.player disablephysicaldepthoffieldscripting();
}

escape_shellshock()
{
    thread escape_shellshock_blinking();
    thread escape_shellshock_blur();
    thread escape_shellshock_breathing();
    thread escape_shellshock_heartbeat();
    thread escape_shellshock_depthoffield();
    level.player playrumbleonentity( "tank_rumble" );
    level thread maps\_utility::notify_delay( "stop_heartbeat_sound", 18 );
    clearallcorpses();
    var_0 = ( 600.0, -296.0, -360.0 );
    var_1 = maps\_utility::spawn_anim_model( "player_viewbody" );
    var_1.origin = level.player maps\_utility::get_player_feet_from_view();
    level.player setstance( "stand" );
    var_1.angles = level.player getplayerangles();
    var_1 hide();
    level.player playerlinktoabsolute( var_1, "tag_player", 1 );
    var_2 = spawn( "script_model", level.player.origin );
    var_2.angles = level.player getplayerangles();
    var_2 setmodel( "tag_origin" );
    var_1 linkto( var_2, "tag_origin" );
    var_2 thread common_scripts\utility::play_loop_sound_on_entity( "shellshock_loop" );
    maps\mo_tools::playerweapontake();
    var_3 = getentarray();

    for ( var_4 = 0; var_4 < var_3.size; var_4++ )
    {
        if ( isdefined( var_3[var_4].classname ) && getsubstr( var_3[var_4].classname, 0, 7 ) == "weapon_" )
            var_3[var_4] delete();
    }

    var_5 = getent( "hallways_door", "targetname" );
    var_6 = getent( var_5.target, "targetname" );
    var_5 delete();
    var_6 delete();
    var_7 = ( 358.273, 286.02, -89.0164 );
    var_8 = maps\_utility::spawn_anim_model( "player_viewbody" );
    var_8 hide();
    var_9 = spawn( "script_origin", var_0 );
    var_9.angles = ( 0.0, 180.0, 0.0 );
    var_9 maps\_anim::anim_first_frame_solo( var_8, "player_explosion" );
    waittillframeend;
    var_7 = var_8 gettagangles( "tag_player" );
    var_10 = var_8 gettagorigin( "tag_player" );
    var_9 delete();
    var_8 delete();
    var_2 thread maps\_anim::anim_single_solo( var_1, "player_explosion_start" );
    var_2 moveto( var_10, 1 );
    var_2 waittill( "movedone" );
    thread escape_new_explosion_scene( var_2, var_1, var_0 );
    wait 9.45;
    level notify( "escape_show_waterlevel" );
    wait 13.74;
    var_2 common_scripts\utility::stop_loop_sound_on_entity( "shellshock_loop" );
    wait 0.3;
}

escape_new_explosion_scene( var_0, var_1, var_2 )
{
    level.heroes3["price"] common_scripts\utility::hide_friendname_until_flag_or_notify( "escape_unlink_player" );
    level.heroes3["grigsby"] common_scripts\utility::hide_friendname_until_flag_or_notify( "escape_unlink_player" );
    level.heroes3["alavi"] common_scripts\utility::hide_friendname_until_flag_or_notify( "escape_unlink_player" );
    var_1 unlink();
    var_3 = level.heroes3["price"];
    var_4 = level.heroes3["grigsby"];
    var_5 = spawn( "script_origin", var_2 );
    var_5.angles = ( 0.0, 180.0, 0.0 );
    var_6 = getstartorigin( var_5.origin, var_5.angles, var_1 maps\_utility::getanim( "player_explosion" ) );
    var_7 = var_1.origin - var_6;
    var_5.origin = ( var_5.origin[0], var_5.origin[1], -360 );
    var_1 show();
    var_5 maps\_anim::anim_first_frame_solo( var_1, "player_explosion" );
    var_3 stopanimscripted();
    var_3 unlink();
    var_5 thread maps\_anim::anim_generic( var_3, "price_explosion" );
    var_4 stopanimscripted();
    var_4 unlink();
    var_5 thread maps\_anim::anim_generic( var_4, "grigsby_explosion" );
    var_5 maps\_anim::anim_single_solo( var_1, "player_explosion" );
    level notify( "escape_unlink_player" );
    level.player unlink();
    var_0 delete();
    var_5 delete();
    var_1 delete();
}

escape_old_explosion_scene( var_0, var_1 )
{
    var_0 rotateto( ( 344.064, 286.67, -93.2207 ), 0.2, 0, 0.2 );
    var_0 moveto( var_1, 0.2, 0, 0.2 );
    wait 0.1;
    var_0 rotateto( ( 358.273, 286.02, -89.0164 ), 0.3, 0.3, 0 );
    var_0 moveto( var_0.origin + ( 0.0, 0.0, -12.0 ), 0.3, 0.3, 0 );
    wait 0.3;
    var_0 rotateto( ( 344.064, 286.67, -93.2207 ), 2.05, 0, 2.05 );
    var_0 moveto( var_0.origin + ( 0.0, 0.0, 0.0 ), 2.05, 0, 2.05 );
    wait 2.05;
    var_0 rotateto( ( 321.374, 134.198, 58.7419 ), 6, 3, 3 );
    var_0 moveto( var_0.origin + ( 0.0, 0.0, -32.0 ), 3, 3, 0 );
    wait 3;
    var_0 moveto( var_0.origin + ( 0.0, 0.0, 32.0 ), 3, 0, 3 );
    wait 3;
    var_0 rotateto( ( 344.064, 286.67, -93.2207 ), 6, 3, 3 );
    var_0 moveto( var_0.origin + ( 0.0, 0.0, -32.0 ), 3, 3, 0 );
    wait 3;
    var_0 moveto( var_0.origin + ( 0.0, 0.0, 36.0 ), 3, 0, 3 );
    wait 3;
    var_0 rotateto( ( 321.374, 134.198, 58.7419 ), 4, 2, 2 );
    var_0 moveto( var_0.origin + ( 0.0, 0.0, -32.0 ), 2, 2, 0 );
    wait 2;
    var_0 moveto( var_0.origin + ( 0.0, 0.0, 36.0 ), 2, 0, 2 );
    wait 2;
    var_0 rotateto( ( 330.674, 192.977, -13.8899 ), 2, 1, 1 );
    var_0 moveto( var_0.origin + ( 0.0, 0.0, -16.0 ), 2, 2, 0 );
    wait 2;
    var_0 rotateto( ( 327.722, 180.996, -2.2776 ), 0.5, 0.25, 0.25 );
    wait 0.5;
    wait 0.25;
    var_0 rotateto( ( -10.0, 180.0, 0.0 ), 0.5 );
    var_0 moveto( var_0.origin + ( 0.0, 0.0, 0.0 ), 0.5 );
    wait 0.5;
    var_0 rotateto( ( 0.0, 75.0, 10.0 ), 1.5 );
    wait 0.35;
    var_0 moveto( var_0.origin + ( 0.0, 0.0, 10.0 ), 0.75 );
    wait 0.4;
    wait 0.74;
    wait 0.3;
}

playermaskputon()
{
    if ( isdefined( level.player.ropecamera ) )
    {
        level.player lerpviewangleclamp( 1, 0.1, 0.1, 25, 30, 20, 0 );
        wait 1;
    }

    var_0 = getdvar( "nightVisionFadeInOutTime" );
    var_1 = getdvar( "nightVisionPowerOnTime" );
    setsaveddvar( "nightVisionPowerOnTime", 0.5 );
    setsaveddvar( "nightVisionFadeInOutTime", 0.5 );
    setsaveddvar( "overrideNVGModelWithKnife", 1 );
    setsaveddvar( "nightVisionDisableEffects", 1 );
    wait 0.01;
    level.player giveweapon( "facemask" );
    level.player forceviewmodelanimation( "facemask", "nvg_down" );
    wait 1.7;
    setomnvar( "ui_gasmask", 1 );
    thread breath();
    wait 3.0;

    if ( isdefined( level.player.ropecamera ) )
        level.player lerpviewangleclamp( 1, 0.1, 0.1, 65, 65, 30, 35 );

    setsaveddvar( "nightVisionDisableEffects", 0 );
    setsaveddvar( "overrideNVGModelWithKnife", 0 );
    setsaveddvar( "nightVisionPowerOnTime", var_1 );
    setsaveddvar( "nightVisionFadeInOutTime", var_0 );
}

hidegasmaskthink()
{
    level endon( "end_finished" );

    for (;;)
    {
        var_0 = getdvarint( "hideGasMask" ) != 0;
        var_1 = getomnvar( "ui_gasmask" ) == 0;

        if ( var_0 != var_1 )
            setomnvar( "ui_gasmask", !var_0 );

        wait 0.5;
    }
}

showgasmaskcracks()
{
    wait 1.3;
    level.maskiscracked = 1;

    if ( getdvarint( "showGasMaskCracks" ) != 0 )
    {
        level.maskcracksfx = spawnfx( level._effect["goggles_cracks"], level.player.origin );
        triggerfx( level.maskcracksfx );
        level.player thread maps\_utility::play_sound_on_entity( "scn_cargo_explosion_mask_crack" );
    }
}

breath()
{
    for (;;)
    {
        while ( shouldshowbreath() )
        {
            var_0 = randomintrange( 1, 3 );
            var_1 = spawnfx( level._effect["goggles_breath"], level.player.origin );
            triggerfx( var_1 );
            wait(var_0);
            var_1 delete();
        }

        wait 0.5;
    }
}

shouldshowbreath()
{
    return level.player issprinting() && getdvarint( "showBreath" ) != 0;
}

pricecigardelete()
{
    wait 26;
    self delete();
}

pricecigarexhalefx( var_0 )
{
    var_0 endon( "death" );

    for (;;)
    {
        self waittillmatch( "single anim", "exhale" );
        playfxontag( level._effect["cigar_exhale"], self, "J_Head", level.heli.vehicle );
        playfxontag( level._effect["cigarsmoke_exhale_thin"], self, "J_Head" );
    }
}

pricecigarpufffx( var_0 )
{
    var_0 endon( "death" );

    for (;;)
    {
        self waittillmatch( "single anim", "puff" );
        playfxontag( level._effect["cigar_glow_puff"], var_0, "tag_cigarglow" );
        wait 1;
        playfxontag( level._effect["cigar_smoke_puff"], self, "J_Head", level.heli.vehicle );
    }
}

cigar_embers_burst( var_0 )
{
    wait 8.7;
    playfxontag( level._effect["cigar_embers_wind"], var_0, "tag_cigarglow", level.heli.vehicle );
    wait 1.8;
    playfxontag( level._effect["cigar_embers_burst"], var_0, "tag_cigarglow", level.heli.vehicle );
    wait 0.2;
    playfxontag( level._effect["cigar_embers_burst"], var_0, "tag_cigarglow", level.heli.vehicle );
    wait 12.847;
    playfxontag( level._effect["cigar_embers_wind"], var_0, "tag_cigarglow", level.heli.vehicle );
}

execute_ai_solo( var_0, var_1, var_2, var_3, var_4 )
{
    var_5 = [];
    var_5[0] = var_0;

    if ( !isdefined( var_3 ) )
        var_3 = 0;

    execute_ai( var_5, var_1, var_2, var_3, var_4 );
}

execute_ai( var_0, var_1, var_2, var_3, var_4 )
{
    level endon( "quarters_sleepers_dead" );
    var_5 = 0;

    if ( !isdefined( var_1 ) )
        var_1 = 0;

    if ( !isdefined( var_3 ) )
        var_3 = 0;

    var_6 = isdefined( var_4 );

    while ( isdefined( self.execute_mode ) && self.execute_mode == 1 )
        self waittill( "execute_mode" );

    self.execute_mode = 1;
    var_7 = 1;

    if ( isdefined( self.cqbwalking ) && self.cqbwalking )
        var_7 = 0;

    for ( var_8 = 0; var_8 < var_0.size; var_8++ )
    {
        if ( !isalive( var_0[var_8] ) || isdefined( var_0[var_8].execute_target ) )
            continue;

        var_0[var_8].execute_target = 1;
        var_9 = spawn( "script_origin", var_0[var_8] gettagorigin( "j_spine4" ) );
        var_9 linkto( var_0[var_8], "j_spine4" );
        maps\mo_tools::enable_cqbwalk_ign_demo_wrapper();
        maps\_utility::cqb_aim( var_9 );

        if ( var_3 )
        {
            while ( isdefined( var_0[var_8] ) && abs( vectordot( vectornormalize( self gettagangles( "tag_flash" ) ), vectornormalize( var_9.origin - self gettagorigin( "tag_flash" ) ) ) ) < 0.85 )
                wait 0.1;
        }

        wait(var_1);

        while ( var_6 )
        {
            var_10 = bullettrace( self gettagorigin( "tag_flash" ), var_9.origin, 1, self );

            if ( !isdefined( var_10["entity"] ) || !isplayer( var_10["entity"] ) )
                break;

            wait 0.1;
        }

        if ( isdefined( var_2 ) )
            var_5 = var_2;
        else
            var_5 = randomintrange( 3, 6 );

        burstshot( var_5, var_9.origin );

        if ( isdefined( var_0[var_8] ) )
            var_0[var_8] kill( self gettagorigin( "tag_flash" ) );

        var_9 delete();
        wait 0.1;
    }

    maps\_utility::cqb_aim( undefined );

    if ( var_7 )
        maps\mo_tools::disable_cqbwalk_ign_demo_wrapper();

    self.execute_mode = 0;
    self notify( "execute_mode" );
}

burstshot( var_0, var_1 )
{
    if ( self.bulletsinclip < var_0 )
        self.bulletsinclip = var_0;

    for ( var_2 = 0; var_2 < var_0; var_2++ )
    {
        if ( isdefined( var_1 ) )
        {
            self.shootpos = var_1;
            self shoot( 1.0, var_1 );
        }
        else
            self shoot();

        wait 0.1;
    }
}

patrol()
{
    thread patrol2();
    self allowedstances( "stand" );
    self.disablearrivals = 1;
    self endon( "patrol_stop" );
    self endon( "damage" );
    self.animname = "patrol";
    maps\_utility::set_run_anim( "walk" + randomintrange( 1, 5 ) );
    var_0 = [];

    for ( var_0[var_0.size] = getnode( self.target, "targetname" ); isdefined( var_0[var_0.size - 1].target ); var_0[var_0.size] = getnode( var_0[var_0.size - 1].target, "targetname" ) )
    {

    }

    self attach( "com_flashlight_on", "tag_inhand", 1 );
    flashlight_light( 1 );
    self waittill( "goal" );
    var_1 = 0;

    for (;;)
    {
        var_1++;

        if ( var_1 < var_0.size )
        {
            var_2 = var_0[var_1];
            self setgoalnode( var_2 );

            if ( isdefined( var_2.radius ) && var_2.radius > 0 )
                self.goalradius = var_2.radius;
            else
                self.radius = 16;

            self waittill( "goal" );
            continue;
        }

        maps\_anim::anim_single_solo( self, "turn" );
        var_1 = 0;
        var_0 = common_scripts\utility::array_reverse( var_0 );
    }
}

patrol2()
{
    common_scripts\utility::waittill_either( "damage", "patrol_stop" );
    self notify( "stopanimscripted" );
    self stopanimscripted();
    maps\_utility::clear_run_anim();
    thread maps\_utility::enable_arrivals();
    flashlight_light( 0 );
    self detach( "com_flashlight_on", "tag_inhand" );
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
    else
        self notify( "flashlight_off" );
}

flashlight_light_death( var_0 )
{
    common_scripts\utility::waittill_either( "death", "flashlight_off" );
    var_0 delete();
}

door_opens( var_0 )
{
    self playsound( "wood_door_kick" );
    var_1 = -160;

    if ( isdefined( var_0 ) )
        var_1 *= var_0;

    self rotateyaw( var_1, 0.4, 0, 0.3 );
}

txt_voice( var_0, var_1, var_2, var_3, var_4, var_5, var_6 )
{
    self endon( "death" );
    var_7 = ( 0.0, 1.0, 0.0 );
    var_8 = 0.5;

    if ( isdefined( var_6 ) )
        var_8 = var_6;

    if ( isdefined( var_1 ) )
    {
        switch ( var_1 )
        {
            case "r":
                var_7 = ( 1.0, 0.0, 0.0 );
                break;
            case "b":
                var_7 = ( 0.0, 0.0, 1.0 );
                break;
            case "g":
                var_7 = ( 0.0, 1.0, 0.0 );
                break;
            case "y":
                var_7 = ( 1.0, 1.0, 0.0 );
                break;
        }
    }

    var_9 = [];

    if ( isdefined( var_5 ) )
        var_9[var_9.size] = var_5;

    if ( isdefined( var_4 ) )
        var_9[var_9.size] = var_4;

    if ( isdefined( var_3 ) )
        var_9[var_9.size] = var_3;

    if ( isdefined( var_2 ) )
        var_9[var_9.size] = var_2;

    var_10 = int( var_0 * 20 );

    if ( isplayer( self ) )
    {
        while ( var_10 )
        {
            var_11 = level.player getplayerangles();
            var_12 = anglestoforward( var_11 );
            var_12 = maps\_utility::vector_multiply( var_12, 96 );
            var_13 = level.player.origin + var_12 + ( 0.0, 0.0, 64.0 );
            var_8 = 0.25;
            var_7 = ( 1.0, 1.0, 0.0 );

            for ( var_14 = 0; var_14 < var_9.size; var_14++ )
                var_13 += ( 0, 0, 10 * var_8 );

            wait 0.05;
            var_10--;
        }
    }
    else
    {
        while ( var_10 )
        {
            var_13 = self.origin + ( 0.0, 0.0, 64.0 );

            for ( var_14 = 0; var_14 < var_9.size; var_14++ )
                var_13 += ( 0, 0, 10 * var_8 );

            wait 0.05;
            var_10--;
        }
    }
}

heli_flypath( var_0 )
{
    level.heli notify( "heli_flypath" );
    level.heli endon( "heli_flypath" );

    while ( isdefined( var_0 ) )
    {
        var_1 = 1;

        if ( isdefined( var_0.target ) )
            var_1 = 0;

        handle_heli_audio( var_0 );
        level.heli.vehicle setvehgoalpos( var_0.origin + ( 0.0, 0.0, 150.0 ), var_1 );
        level.heli.vehicle setneargoalnotifydist( 150 );
        level.heli.vehicle waittill( "near_goal" );

        if ( isdefined( var_0.target ) )
        {
            var_0 = common_scripts\utility::getstruct( var_0.target, "targetname" );
            continue;
        }

        heli_in_tempest( var_0.origin );
        var_0 = undefined;
    }
}

heli_in_tempest( var_0 )
{
    level.heli endon( "heli_flypath" );
    level.heli endon( "heli_end" );
    level.player endon( "death" );
    level.heli.vehicle vehicle_setspeed( 7, 6, 6 );
    level.heli.lastheightsea = level.heli.heightsea;

    while ( isdefined( level.heli.vehicle ) )
    {
        level._sea_org common_scripts\utility::waittill_any( "sway1", "sway2" );
        level.heli.lastheightsea = level.heli.heightsea;
        set_heli_tempest_goal( var_0 );
        level.heli.vehicle waittill( "near_goal" );
    }
}

set_heli_tempest_goal( var_0 )
{
    var_1 = 10;
    var_2 = 15;
    var_3 = randomintrange( var_1, var_2 );
    var_4 = randomintrange( var_1, var_2 );

    if ( randomint( 2 ) )
        var_3 *= -1;

    if ( randomint( 2 ) )
        var_4 *= -1;

    level.heli.vehicle setvehgoalpos( var_0 + ( var_3, var_4, level.heli.heightsea ), 1 );
    level.heli.vehicle setneargoalnotifydist( 50 );
}

handle_heli_audio( var_0 )
{
    switch ( var_0.targetname )
    {
        case "heli_bridge_node":
            thread maps\cargoship_aud::start_blackhawk_move( level.heli.vehicle, "cgo_helicopter_linear_01" );
            break;
        case "auto2686":
            thread maps\cargoship_aud::stop_blackhawk_move();
            break;
        case "heli_deck_landing_node":
            thread maps\cargoship_aud::start_blackhawk_move( level.heli.vehicle, "cgo_helicopter_linear_02" );
            break;
        case "auto2699":
            thread maps\cargoship_aud::stop_blackhawk_move();
            break;
        case "deck_helinode_1b":
            thread maps\cargoship_aud::start_blackhawk_move( level.heli.vehicle, "cgo_helicopter_linear_03" );
            break;
        case "auto2732":
            thread maps\cargoship_aud::stop_blackhawk_move();
            break;
        case "deck_helinode_2b":
            thread maps\cargoship_aud::start_blackhawk_move( level.heli.vehicle, "cgo_helicopter_linear_04" );
            break;
        case "auto2723":
            thread maps\cargoship_aud::stop_blackhawk_move();
            break;
        case "deck_helinode_win":
            thread maps\cargoship_aud::start_blackhawk_move( level.heli.vehicle, "cgo_helicopter_linear_05" );
            break;
        case "auto2736":
            thread maps\cargoship_aud::stop_blackhawk_move();
            break;
        case "deck_helinode_gohome":
            thread maps\cargoship_aud::start_blackhawk_move( level.heli.vehicle, "cgo_helicopter_linear_06" );
            break;
        case "auto2775":
            thread maps\cargoship_aud::stop_blackhawk_move();
            break;
    }
}

heli_circle_area_start( var_0 )
{
    self.vehicle vehicle_setspeed( 20, 8, 8 );
    self.vehicle sethoverparams( 16, 10, 3 );
    self.vehicle cleartargetyaw();
    self.vehicle cleargoalyaw();
    self.vehicle clearlookatent();
    self endon( "stop_circling_area" );
    var_1 = common_scripts\utility::getstruct( var_0, "targetname" );
    thread heli_circle_area_gun();

    for (;;)
    {
        self.vehicle setvehgoalpos( var_1.origin, 1 );
        self.vehicle setneargoalnotifydist( 64 );
        self.vehicle settargetyaw( var_1.angles[1] );
        self.vehicle waittill( "near_goal" );
        wait 5;

        if ( isdefined( var_1.target ) )
        {
            var_1 = common_scripts\utility::getstruct( var_1.target, "targetname" );
            continue;
        }

        var_1 = common_scripts\utility::getstruct( var_0, "targetname" );
    }
}

heli_circle_area_gun()
{
    self endon( "stop_circling_area" );
    self.model.minigun[self.model.minigun_control] setplayerspread( 15 );
    self.model.minigun[self.model.minigun_control] setaispread( 15 );

    for (;;)
    {
        if ( isdefined( self.model.spotlight.targetobj ) )
        {
            self.model.minigun[self.model.minigun_control] settargetentity( self.model.spotlight.targetobj );
            self.model heli_minigun_burstfire();
        }

        wait 5;
        self.model heli_minigun_stopfire();
        self.model.minigun[self.model.minigun_control] cleartargetentity();
        wait 6;
    }
}

heli_circle_area_stop()
{
    self notify( "stop_circling_area" );
    self.model heli_minigun_stopfire();
    self.model.minigun[self.model.minigun_control] cleartargetentity();
}

heli_minigun_fake_deck_fire()
{
    self.minigun[self.minigun_control] thread heli_minigun_fake_deck_fire_fx();
    common_scripts\_exploder::exploder( "702" );
    self.minigun[self.minigun_control] thread common_scripts\utility::play_loop_sound_on_entity( "hind_gatling_fire" );
    thread common_scripts\utility::play_loopsound_in_space_with_end( "hind_shells_loop", ( -1990.82, -182.443, 16.125 ), "stop_shell_snd" );
    wait 3.2;
    common_scripts\_exploder::exploder( "703" );
    earthquake( 0.25, 0.7, level.player.origin, 500 );

    if ( getdvarint( "ragdoll_enable" ) )
        thread deck_explosion_guy();

    common_scripts\utility::flag_wait( "hallways_lower_runners1" );
    common_scripts\_exploder::kill_exploder( "703" );
}

heli_minigun_fake_deck_fire_fx()
{
    self endon( "stop_firing" );

    for (;;)
    {
        playfxontag( level._effect["heli_minigun_muzzleflash"], self, "tag_flash" );
        var_0 = randomfloatrange( 0.1, 0.3 );
        wait(var_0);
    }
}

heli_minigun_fire()
{
    self.minigun[self.minigun_control] thread heli_minigun_firethread( 0 );
}

heli_minigun_burstfire()
{
    self.minigun[self.minigun_control] thread heli_minigun_firethread( 1 );
}

heli_minigun_stopfire()
{
    self.minigun[self.minigun_control] notify( "stop_firing" );
}

heli_minigun_fake_deck_stopfire()
{
    self.minigun[self.minigun_control] notify( "stop_firing" );
    self.minigun[self.minigun_control] common_scripts\utility::stop_loop_sound_on_entity( "hind_gatling_fire" );
    self.minigun[self.minigun_control] thread maps\_utility::play_sound_on_entity( "hind_gatling_cooldown" );
    self notify( "stop_deck_glass_monitoring" );
    self notify( "stop_shell_snd" );
    thread common_scripts\utility::play_sound_in_space( "hind_shells_tail", ( -1990.82, -182.443, 16.125 ) );
}

heli_minigun_firethread( var_0 )
{
    self endon( "stop_firing" );

    for (;;)
    {
        var_1 = randomfloatrange( 0.2, 0.7 ) * 20;

        for ( var_2 = 0; var_2 < var_1; var_2++ )
        {
            self shootturret();
            wait 0.05;
        }

        if ( isdefined( var_0 ) && var_0 == 1 )
            wait(randomfloat( 0.5, 2 ));
    }
}

deck_delete_destroyed_glass_pieces()
{
    self endon( "stop_deck_glass_monitoring" );
    self endon( "stop_damage" );
    self endon( "death" );
    var_0 = getglassarray( "deck_glass" );

    for (;;)
    {
        var_1 = [];

        foreach ( var_3 in var_0 )
        {
            if ( isglassdestroyed( var_3 ) )
            {
                deleteglass( var_3 );
                var_1 = common_scripts\utility::array_add( var_1, var_3 );
                continue;
            }
        }

        if ( var_1.size > 0 )
            var_0 = common_scripts\utility::array_remove_array( var_0, var_1 );

        wait 0.05;
    }
}

deck_minigun_dodamage()
{
    self endon( "stop_damage" );
    self endon( "death" );
    var_0 = getglassarray( "deck_glass" );
    var_1 = 64;
    var_2 = var_1 * var_1;
    var_3 = 64;
    var_4 = var_3 * var_3;

    for (;;)
    {
        var_5 = self.origin;
        var_6 = [];

        foreach ( var_8 in var_0 )
        {
            if ( isglassdestroyed( var_8 ) )
            {
                var_6 = common_scripts\utility::array_add( var_6, var_8 );
                continue;
            }

            var_9 = getglassorigin( var_8 );

            if ( distancesquared( var_9, var_5 ) < var_2 )
            {
                var_10 = var_9 - var_5;
                destroyglass( var_8, var_10 );
                var_6 = common_scripts\utility::array_add( var_6, var_8 );
                break;
            }
        }

        for ( var_12 = 0; var_12 < level.aftdeck_enemies.size; var_12++ )
        {
            if ( !isdefined( level.aftdeck_enemies[var_12] ) )
                continue;

            if ( !isalive( level.aftdeck_enemies[var_12] ) )
                continue;

            if ( distancesquared( level.aftdeck_enemies[var_12] getorigin(), var_5 ) < var_4 )
            {
                level.aftdeck_enemies[var_12] thread deck_minigun_dodamage_to_ent( "generic_death_russian_" + randomintrange( 1, 8 ) );
                level.aftdeck_enemies = common_scripts\utility::array_remove( level.aftdeck_enemies, level.aftdeck_enemies[var_12] );
                break;
            }
        }

        if ( var_6.size > 0 )
            var_0 = common_scripts\utility::array_remove_array( var_0, var_6 );

        level.aftdeck_enemies = maps\_utility::array_removedead( level.aftdeck_enemies );
        level.aftdeck_enemies = common_scripts\utility::array_removeundefined( level.aftdeck_enemies );
        wait 0.05;
    }
}

deck_minigun_dodamage_to_ent( var_0 )
{
    wait 0.25;

    if ( !isdefined( self ) )
        return;

    self dodamage( 1000, level.heli.model.origin );

    if ( isdefined( var_0 ) )
        thread common_scripts\utility::play_sound_in_space( var_0, self.origin );
}

deck_explosion_guy()
{
    var_0 = getent( "aftdeck_explosion_enemy", "targetname" );
    var_0 maps\_utility::add_spawn_function( ::deck_explosion_guy_spawn );
    var_1 = var_0 maps\_utility::spawn_ai( 1 );
    var_1.ignoreme = 1;
    wait 0.05;
    var_1 thread maps\_utility::play_sound_on_entity( "scn_cargo_heli_minigun_explosion_layer_guy" );
    var_1.animname = "guy";
    var_1 thread maps\_anim::anim_single_solo( var_1, "explosion" );
    wait(getanimlength( var_1 maps\_utility::getanim( "explosion" ) ) - 0.2);
    var_1 kill();
}

deck_explosion_guy_spawn()
{
    self.grenadeammo = 0;
    thread maps\_utility::ignoreallenemies( 1 );
    maps\_utility::gun_remove();
}

deck_enemies_see( var_0 )
{
    setthreatbias( self.script_noteworthy, var_0.cgogroup, 0 );
    var_0 notify( "stop_smoking" );
    var_0 notify( "patrol_stop" );
    var_0 notify( "see_enemy" );
    var_0 stopanimscripted();
}

enemies_death_msg( var_0 )
{
    self waittill( "damage", var_1, var_2 );

    if ( isalive( self ) )
        self waittill( "death" );

    maps\mo_tools::radio_msg_stack( var_0 );
}

deck_enemies_herokill()
{
    self endon( "death" );
    self endon( "marked_for_death" );

    if ( self.ignoreme )
        self waittill( "in_range" );

    var_0 = level.heroes5;
    var_1 = getarraykeys( var_0 );
    var_2 = 700;
    var_3 = var_2 * var_2;
    var_4 = 1;

    while ( var_4 )
    {
        for ( var_5 = 0; var_5 < var_1.size; var_5++ )
        {
            var_6 = var_1[var_5];
            var_7 = distancesquared( var_0[var_6].origin, self.origin ) < var_3;

            if ( var_7 )
            {
                var_4 = 0;

                if ( !isplayer( var_0[var_6] ) )
                {
                    var_0[var_6] thread execute_ai_solo( self, 0, undefined, 1 );
                    self notify( "marked_for_death" );
                }
            }
        }

        wait 0.1;
    }
}

deck_enemies_behavior()
{
    self endon( "death" );
    thread deck_enemies_behavior2();
    self.cgogroup = "deck_enemy" + self.unique_id;
    createthreatbiasgroup( self.cgogroup );
    self setthreatbiasgroup( self.cgogroup );
    var_0 = [];
    var_0[var_0.size] = level.player;
    var_0 = common_scripts\utility::array_combine( var_0, level.heroes5 );

    for ( var_1 = 0; var_1 < var_0.size; var_1++ )
        setignoremegroup( var_0[var_1].script_noteworthy, self.cgogroup );

    var_2 = 700;
    var_3 = var_2 * var_2;
    var_4 = 1;

    while ( var_4 )
    {
        for ( var_1 = 0; var_1 < var_0.size; var_1++ )
        {
            var_5 = distancesquared( var_0[var_1].origin, self.origin ) < var_3;

            if ( var_5 )
            {
                var_4 = 0;

                if ( !isplayer( var_0[var_1] ) )
                {
                    var_0[var_1] thread execute_ai_solo( self, 0, undefined, 1 );
                    self notify( "marked_for_death" );
                }

                break;
            }
        }

        wait 0.25;
    }

    self notify( "in_range" );
    var_2 = 350;
    var_3 = var_2 * var_2;

    for (;;)
    {
        for ( var_1 = 0; var_1 < var_0.size; var_1++ )
        {
            if ( distancesquared( var_0[var_1].origin, self.origin ) < var_3 && self cansee( var_0[var_1] ) )
                var_0[var_1] thread deck_enemies_see( self );
        }

        wait 0.25;
    }
}

deck_enemies_behavior2()
{
    self endon( "death" );
    self waittill( "doFlashBanged" );
    level.player.ignoreme = 0;
    setthreatbias( self.cgogroup, level.player.script_noteworthy, 200 );
    level.player thread deck_enemies_see( self );
}

deck_heli_minigun_fx()
{
    self endon( "death" );

    for (;;)
    {
        playfxontag( level._effect["heli_minigun_shells"], self, "tag_origin" );
        wait 0.1;
    }
}

deck_heroes_holdtheline()
{
    common_scripts\utility::flag_wait( "walk_deck" );
    var_0 = 1.13;
    var_1 = 1;
    var_2 = 0.9;
    var_3 = 140;
    var_4 = [];
    var_5 = getarraykeys( level.heroes5 );

    for ( var_6 = 0; var_6 < var_5.size; var_6++ )
    {
        var_7 = var_5[var_6];
        var_4[var_4.size] = level.heroes5[var_7];
    }

    for ( var_6 = 0; var_6 < var_4.size; var_6++ )
    {
        var_4[var_6].oldmoveplaybackrate = var_4[var_6].moveplaybackrate;
        var_4[var_6].moveplaybackrate = var_1;
    }

    while ( !common_scripts\utility::flag( "deck_windows" ) )
    {
        var_8 = var_4[0];

        for ( var_6 = 0; var_6 < var_4.size; var_6++ )
        {
            if ( var_8.origin[0] > var_4[var_6].origin[0] )
                var_8 = var_4[var_6];
        }

        for ( var_6 = 0; var_6 < var_4.size; var_6++ )
        {
            var_9 = var_4[var_6].origin[0] - var_8.origin[0];

            if ( var_9 > var_3 && var_4[var_6].moveplaybackrate < var_0 )
            {
                var_4[var_6].moveplaybackrate += 0.05;
                continue;
            }

            if ( var_4[var_6].moveplaybackrate > var_1 )
                var_4[var_6].moveplaybackrate -= 0.05;
        }

        wait 0.1;
    }

    for ( var_6 = 0; var_6 < var_4.size; var_6++ )
        var_4[var_6].moveplaybackrate = var_4[var_6].oldmoveplaybackrate;
}

deck_kill_lights()
{
    var_0 = getentarray( "aftdeck_light_off", "script_noteworthy" );
    var_1 = [];
    var_2 = [];
    var_3 = [];
    var_4 = [];
    var_5 = [];

    foreach ( var_7 in var_0 )
    {
        if ( var_7.script_parameters == "a" )
        {
            var_1[var_1.size] = var_7;
            continue;
        }

        if ( var_7.script_parameters == "b" )
        {
            var_2[var_2.size] = var_7;
            continue;
        }

        if ( var_7.script_parameters == "c" )
        {
            var_3[var_3.size] = var_7;
            continue;
        }

        if ( var_7.script_parameters == "d" )
        {
            var_4[var_4.size] = var_7;
            continue;
        }

        if ( var_7.script_parameters == "e" )
            var_5[var_5.size] = var_7;
    }

    wait 0.5;
    deck_lights_off( var_1 );
    wait 0.5;
    deck_lights_off( var_2 );
    wait 0.5;
    deck_lights_off( var_3 );
    maps\cargoship_lighting::aftdeck_lights_flickering();
    wait 0.5;
    deck_lights_off( var_4 );
    wait 0.6;
    deck_lights_off( var_5 );
}

deck_lights_off( var_0 )
{
    foreach ( var_2 in var_0 )
        var_2 maps\_utility::_setlightintensity( 0 );
}

heli_minigun_attach( var_0 )
{
    self.minigun = [];
    var_1 = undefined;

    switch ( tolower( var_0 ) )
    {
        case "right":
            var_1 = "_r";
            break;
        case "left":
            var_1 = "_l";
            break;
    }

    self.minigun[tolower( var_0 )] = spawnturret( "misc_turret", self gettagorigin( "tag_gun" + var_1 ), "heli_minigun_noai" );
    self.minigun[tolower( var_0 )].angles = self gettagangles( "tag_gun" + var_1 );
    self.minigun[tolower( var_0 )] setmodel( "weapon_minigun" );
    self.minigun[tolower( var_0 )] linkto( self, "tag_gun" + var_1 );
    self.minigun[tolower( var_0 )] makeunusable();
    self.minigun[tolower( var_0 )] setmode( "manual" );
    self.minigun[tolower( var_0 )] setturretteam( "allies" );
    self.minigun_control = tolower( var_0 );
}

heli_searchlight_on()
{
    self.spotlight = spawnturret( "misc_turret", self gettagorigin( "tag_barrel" ), "heli_spotlight" );
    self.spotlight.angles = self gettagangles( "tag_barrel" );
    self.spotlight setmodel( "com_blackhawk_spotlight_on_mg_setup" );
    self.spotlight linkto( self, "tag_barrel", ( 0.0, 0.0, -16.0 ), ( 0.0, 0.0, 0.0 ) );
    self.spotlight makeunusable();
    self.spotlight setmode( "manual" );
    self.spotlight settoparc( 5 );
    common_scripts\utility::flag_set( "heli_light_on" );
    self.spotlight thread h1_searchlight_light_manager();
    self.spotlight thread heli_searchlight_dlight();
    thread heli_searchlight_target( "default" );
}

h1_searchlight_light_manager()
{
    self endon( "death" );
    common_scripts\utility::flag_set( "heli_light_triggers" );

    for (;;)
    {
        common_scripts\utility::flag_wait( "heli_light_on" );
        var_0 = level._effect["heli_spotlight"];

        if ( common_scripts\utility::flag( "heli_light_optimize" ) )
            var_0 = level._effect["heli_spotlight_noshadow"];

        self setmodel( "com_blackhawk_spotlight_on_mg_setup" );
        self.dlight = spawn( "script_model", level.heli.model gettagorigin( "tag_barrel" ) );
        self.dlight setmodel( "tag_origin" );
        playfxontag( var_0, self, "tag_flash" );
        common_scripts\utility::flag_waitopen( "heli_light_on" );
        self setmodel( "com_blackhawk_spotlight_off_mg_setup" );
        stopfxontag( var_0, self, "tag_flash" );
        self.dlight delete();
    }
}

heli_searchlight_off()
{
    self.spotlight_default_target delete();
    self.spotlight notify( "death" );
    var_0 = spawn( "script_model", self.spotlight.origin );
    var_0 setmodel( "tag_origin" );
    self.spotlight linkto( var_0 );
    var_0 moveto( ( 0.0, 0.0, -10000.0 ), 0.05 );
    wait 0.25;
    self.spotlight delete();
    var_0 delete();
}

heli_searchlight_dlight()
{
    self endon( "death" );

    for (;;)
    {
        var_0 = anglestoforward( self gettagangles( "tag_flash" ) );
        var_1 = physicstrace( self gettagorigin( "tag_flash" ), self gettagorigin( "tag_flash" ) + maps\_utility::vector_multiply( var_0, 1500 ) );
        var_2 = maps\_utility::vector_multiply( var_0, -64 );
        var_1 += var_2;

        if ( isdefined( self.dlight ) )
            self.dlight moveto( var_1, 0.1 );

        wait 0.1;
    }
}

heli_searchlight_target_calcai( var_0 )
{
    var_1 = level.player getplayerangles();
    var_1 = anglestoforward( var_1 );
    var_2 = 0;
    var_3 = var_0[0];

    for ( var_4 = 1; var_4 < var_0.size; var_4++ )
    {
        var_5 = var_0[var_4].origin - level.player.origin;
        vectornormalize( var_5 );
        var_6 = vectordot( var_5, var_1 );

        if ( var_6 > var_2 )
        {
            var_3 = var_0[var_4];
            var_2 = var_6;
        }
    }

    return var_3;
}

heli_searchlight_target( var_0, var_1 )
{
    var_2 = undefined;

    switch ( var_0 )
    {
        case "aiarray":
            var_3 = getaiarray( var_1 );

            if ( var_1 == "allies" )
            {
                var_3 = common_scripts\utility::array_remove( var_3, level.heroes7["pilot"] );
                var_3 = common_scripts\utility::array_remove( var_3, level.heroes7["copilot"] );
            }

            var_2 = heli_searchlight_target_calcai( var_3 );
            break;
        case "player":
            var_2 = level.player;
            break;
        case "targetname":
            var_2 = getent( var_1, var_0 );
            break;
        case "script_noteworthy":
            var_2 = getent( var_1, var_0 );
            break;
        case "hero":
            var_2 = level.heroes5[var_1];
            break;
        case "default":
            var_2 = self.spotlight_default_target;
            break;
    }

    if ( !isdefined( var_2 ) )
        return;

    self notify( "new_searchlight_target" );
    thread heli_searchlight_think( var_2 );
    self endon( "new_searchlight_target" );

    switch ( var_0 )
    {
        case "aiarray":
            wait(randomfloatrange( 2, 4 ));
            thread heli_searchlight_target( var_0, var_1 );
            break;
    }
}

heli_searchlight_think( var_0 )
{
    self endon( "new_searchlight_target" );
    self.spotlight settargetentity( var_0 );
    self.spotlight.targetobj = var_0;
    var_0 waittill( "death" );
    self.spotlight cleartargetentity();
}

heli_searchlight_bridge()
{
    level endon( "price_wait_at_stairs" );
    var_0 = getentarray( "heli_bridge_spottarget", "targetname" );
    var_1 = 1;
    var_2 = 0;

    for (;;)
    {
        level.heli.model.spotlight_default_target = var_0[var_2];
        level.heli.model thread heli_searchlight_target( "default" );
        var_2 += var_1;

        if ( var_2 == var_0.size )
            var_1 = -1;
        else if ( var_2 == -1 )
            var_1 = 1;

        wait 1.5;
    }
}

heli_deckdrop_target()
{
    common_scripts\utility::flag_wait( "walk_deck" );
    var_0 = getent( "heli_deck_spottarget", "targetname" );
    level.heli.model.spotlight_default_target = var_0;
    level.heli.model thread heli_searchlight_target( "heli_deck_spottarget" );
    var_0 linkto( level.heli.model, "tag_turret", ( 0.0, 0.0, 0.0 ), ( 0.0, 0.0, 0.0 ) );
}

player_speed_set_cargoship( var_0, var_1 )
{
    var_2 = int( getdvar( "g_speed" ) );
    var_3 = var_0;

    if ( !isdefined( level.player.g_speed ) )
        level.player.g_speed = var_2;

    var_4 = var_3 - var_2;
    var_5 = 0.05;
    var_6 = var_1 / var_5;
    var_7 = var_4 / var_6;

    while ( abs( var_3 - var_2 ) > abs( var_7 * 1.1 ) )
    {
        var_2 += var_7;
        setsaveddvar( "g_speed", int( var_2 ) );
        wait(var_5);
    }

    setsaveddvar( "g_speed", var_3 );
}

player_speed_reset( var_0 )
{
    if ( !isdefined( level.player.g_speed ) )
        return;

    player_speed_set_cargoship( level.player.g_speed, var_0 );
    level.player.g_speed = undefined;
}

cargohold_1_light_sway( var_0 )
{
    var_1 = spawn( "script_origin", self.origin );
    var_1 linkto( var_0 );

    for (;;)
    {
        self moveto( var_1.origin, 0.1 );
        wait 0.1;
    }
}

misc_light_sway()
{
    if ( isdefined( self.script_noteworthy ) && self.script_noteworthy == "nosway" )
        return;

    var_0 = self.angles;
    var_1 = self.origin;
    var_0 += ( 0.0, 90.0, 0.0 );

    for (;;)
    {
        level._sea_org waittill( "sway1" );
        var_2 = level._sea_org.time;
        var_3 = var_2 * 0.5;
        self moveto( var_1 + ( 0.0, 20.0, 0.0 ), var_2, var_3, var_3 );
        level._sea_org waittill( "sway2" );
        var_2 = level._sea_org.time;
        var_3 = var_2 * 0.5;
        self moveto( var_1 + ( 0.0, -20.0, 0.0 ), var_2, var_3, var_3 );
    }
}

misc_tv_stairs_on()
{
    wait 1;
    self.usetrig notify( "trigger" );
    var_0 = getent( "start_bridge_standoff", "targetname" );
    var_0 waittill( "trigger" );
    self.usetrig notify( "trigger" );
}

misc_tv()
{
    self setcandamage( 1 );
    self.damagemodel = undefined;
    self.offmodel = undefined;

    switch ( self.model )
    {
        case "com_tv2_testpattern":
            self.damagemodel = "com_tv2_d";
            self.offmodel = "com_tv2";
            self.onmodel = "com_tv2_testpattern";
            break;
        case "com_tv1_testpattern":
            self.damagemodel = "com_tv2_d";
            self.offmodel = "com_tv1";
            self.onmodel = "com_tv1_testpattern";
            break;
    }

    self.glow = undefined;
    self.gloworg = self.origin + ( 0.0, 0.0, 14.0 ) + maps\_utility::vector_multiply( anglestoforward( self.angles ), 55 );
    self.usetrig = getent( self.target, "targetname" );
    self.usetrig usetriggerrequirelookat();
    self.usetrig setcursorhint( "HINT_NOICON" );

    if ( isdefined( self.usetrig.target ) )
    {
        self.lite = getent( self.usetrig.target, "targetname" );

        if ( isdefined( self.lite ) )
            self.liteintensity = self.lite getlightintensity();
    }

    thread misc_tv_damage();
    thread misc_tv_off();
}

misc_tv_off()
{
    self.usetrig endon( "death" );

    for (;;)
    {
        self.glow = spawn( "script_model", self.gloworg );
        self.glow setmodel( "tag_origin" );
        self.glow hide();
        playfxontag( level._effect["aircraft_light_cockpit_blue"], self.glow, "tag_origin" );

        if ( isdefined( self.lite ) )
            self.lite setlightintensity( self.liteintensity );

        wait 0.2;
        self.usetrig waittill( "trigger" );
        self setmodel( self.offmodel );
        self.glow delete();
        self.glow = undefined;

        if ( isdefined( self.lite ) )
            self.lite setlightintensity( 0 );

        wait 0.2;
        self.usetrig waittill( "trigger" );
        self setmodel( self.onmodel );
    }
}

misc_tv_damage()
{
    self waittill( "damage", var_0, var_1, var_2, var_3, var_4 );
    self.usetrig notify( "death" );

    if ( isdefined( self.glow ) )
        self.glow delete();

    if ( isdefined( self.lite ) )
        self.lite setlightintensity( 0 );

    playfxontag( level.misc_tv_damage_fx["tv_explode"], self, "tag_fx" );
    self playsound( "tv_shot_burst" );
    self.usetrig delete();
    self setmodel( self.damagemodel );
}

misc_vision()
{
    var_0 = strtok( self.script_parameters, ":;, " );
    var_1 = 5;

    for ( var_2 = 0; var_2 < var_0.size; var_2++ )
    {
        if ( var_0[var_2] == "time" )
        {
            var_2++;
            var_1 = int( var_0[var_2] );
        }
    }

    for (;;)
    {
        self waittill( "trigger" );
        maps\_utility::set_vision_set( self.script_noteworthy, var_1 );
    }
}

misc_fx_handler_trig()
{
    if ( !isdefined( level.fx_handlers ) )
        level.fx_handlers = [];

    level.fx_handlers[level.fx_handlers.size] = self.script_noteworthy;

    for (;;)
    {
        self waittill( "trigger" );

        for ( var_0 = 0; var_0 < level.fx_handlers.size; var_0++ )
        {
            if ( level.fx_handlers[var_0] == self.script_noteworthy )
            {
                common_scripts\utility::flag_set( self.script_noteworthy );
                continue;
            }

            common_scripts\utility::flag_clear( level.fx_handlers[var_0] );
        }
    }
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
    return var_2;
}

create_credit_element( var_0 )
{
    var_1 = newhudelem();
    var_1.x = 0;
    var_1.y = 0;
    var_1 setshader( var_0, 512, 256 );
    var_1.alignx = "center";
    var_1.aligny = "middle";
    var_1.horzalign = "center";
    var_1.vertalign = "middle";
    var_1.alpha = 0;
    return var_1;
}

fade_overlay( var_0, var_1 )
{
    self fadeovertime( var_1 );
    self.alpha = var_0;
    wait(var_1);
}

h1_fade_overlay( var_0, var_1, var_2, var_3 )
{
    common_scripts\utility::flag_wait( "shellshock_blinking" );
    exp_fade_overlay( var_0, var_1 );
    common_scripts\utility::flag_waitopen( "shellshock_blinking" );
    exp_fade_overlay( var_2, var_3 );
}

exp_fade_overlay( var_0, var_1 )
{
    self notify( "exp_fade_overlay" );
    self endon( "exp_fade_overlay" );
    var_2 = 4;
    var_3 = 90 / var_2;
    var_4 = 0;
    var_5 = var_1 / var_2;
    var_6 = self.alpha;
    var_7 = var_6 - var_0;

    for ( var_8 = 0; var_8 < var_2; var_8++ )
    {
        var_4 += var_3;
        self fadeovertime( var_5 );

        if ( var_0 > var_6 )
        {
            var_9 = 1 - cos( var_4 );
            self.alpha = var_6 - var_7 * var_9;
        }
        else
        {
            var_9 = sin( var_4 );
            self.alpha = var_6 - var_7 * var_9;
        }

        wait(var_5);
    }
}

h1_blur_overlay( var_0, var_1, var_2, var_3 )
{
    common_scripts\utility::flag_wait( "shellshock_blur" );
    setblur( var_0, var_1 );
    common_scripts\utility::flag_waitopen( "shellshock_blur" );
    setblur( var_2, var_3 );
}

blur_overlay( var_0, var_1 )
{
    setblur( var_0, var_1 );
}

#using_animtree("vehicles");

seaknight_spawn( var_0 )
{
    var_1 = spawnstruct();
    var_1.modelname = "vehicle_ch46e_opened_door_interior_a";
    var_1.type = "seaknight";
    var_1.targetname = "escape_seaknight";
    var_2 = getstartorigin( var_0.origin, var_0.angles, level.scr_anim["bigbird"]["in"] );
    var_3 = getstartangles( var_0.origin, var_0.angles, level.scr_anim["bigbird"]["in"] );
    var_1.model = spawn( "script_model", var_2 );
    var_1.model setmodel( var_1.modelname );
    var_1.model.angles = var_3;
    var_1.model.animname = "bigbird";
    var_1.model.vehicletype = var_1.type;
    var_1.model thread maps\_vehicle::aircraft_wash();
    var_1.model thread maps\mo_fastrope::fastrope_player_quake();
    var_1.model useanimtree( #animtree );
    var_1.model setanim( %ch46_turret_idle );
    return var_1;
}

seaknight_playlightfx()
{
    playfxontag( level._effect["aircraft_light_wingtip_green"], self, "tag_light_L_wing1" );
    playfxontag( level._effect["aircraft_light_wingtip_green"], self, "tag_light_L_wing2" );
    playfxontag( level._effect["aircraft_light_wingtip_red"], self, "tag_light_R_wing1" );
    playfxontag( level._effect["aircraft_light_wingtip_red"], self, "tag_light_R_wing2" );
    wait 0.25;
    playfxontag( level._effect["aircraft_light_red_blink"], self, "tag_light_belly" );
    playfxontag( level._effect["aircraft_light_red_blink"], self, "tag_light_tail" );
    playfxontag( level._effect["aircraft__spot_light_escape_cargoship"], self, "tag_light_cargo02" );
    playfxontag( level._effect["aircraft_light_escape_cargoship"], self, "tag_light_cargo02" );
    common_scripts\utility::flag_wait( "end_start_player_anim" );
    wait 4.7;
    killfxontag( level._effect["aircraft_light_escape_cargoship"], self, "tag_light_cargo02" );
    playfxontag( level._effect["aircraft_light_escape_cargoship_2"], self, "tag_light_cargo02" );
    thread common_scripts\utility::play_sound_in_space( "scn_heli_final_price_face_thunder", level.player.origin );
    wait 4.2;
    killfxontag( level._effect["aircraft_light_escape_cargoship_2"], self, "tag_light_cargo02" );
    killfxontag( level._effect["aircraft__spot_light_escape_cargoship"], self, "tag_light_cargo02" );
    wait 0.2;
    killfxontag( level._effect["aircraft_light_wingtip_green"], self, "tag_light_L_wing1" );
    killfxontag( level._effect["aircraft_light_wingtip_green"], self, "tag_light_L_wing2" );
    wait 0.2;
    killfxontag( level._effect["aircraft_light_wingtip_red"], self, "tag_light_R_wing1" );
    killfxontag( level._effect["aircraft_light_wingtip_red"], self, "tag_light_R_wing2" );
    wait 0.2;
    killfxontag( level._effect["aircraft_light_red_blink"], self, "tag_light_belly" );
    killfxontag( level._effect["aircraft_light_red_blink"], self, "tag_light_tail" );
}

hallways_heroes( var_0, var_1, var_2, var_3, var_4 )
{
    if ( common_scripts\utility::flag( var_1 ) )
        return;

    level endon( var_1 );

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

    var_5 = getarraykeys( level.heroes3 );

    for ( var_6 = 0; var_6 < var_5.size; var_6++ )
    {
        var_7 = var_5[var_6];
        level.heroes3[var_7] maps\_utility::delaythread( var_3[var_7], ::hallways_heroes_solo, var_0, var_1, var_2[var_7], var_4[var_7] );
    }

    maps\_utility::array_wait( level.heroes3, "hallways_heroes_ready" );
    common_scripts\utility::flag_wait( var_0 );
}

wtfhack()
{
    wait 0.25;
    self.disableexits = 0;
}

hallways_heroes_solo( var_0, var_1, var_2, var_3 )
{
    if ( !isdefined( self.dontpushplayer ) )
        self pushplayer( 1 );

    if ( common_scripts\utility::flag( var_1 ) )
        return;

    level endon( var_1 );
    self notify( "hallways_heroes_solo" );
    self endon( "hallways_heroes_solo" );
    var_4 = hallways_heroes_get_node( var_0 );

    while ( isdefined( var_4 ) )
    {
        self setgoalnode( var_4 );

        if ( isdefined( var_4.radius ) && var_4.radius > 0 )
            self.goalradius = var_4.radius;
        else
            self.goalradius = 80;

        if ( isdefined( var_3 ) )
        {
            var_5 = 1;

            if ( isdefined( self.disableexits ) && self.disableexits == 1 )
                var_5 = 0;

            self.disableexits = 1;
            var_6 = undefined;

            if ( var_3 == "stand2run180" )
                var_6 = self;
            else if ( isdefined( self.node ) && distance( self.node.origin, self.origin ) < 4 )
                var_6 = self.node;
            else if ( isdefined( self.goodnode ) && distance( self.goodnode.origin, self.origin ) < 4 )
                var_6 = self.goodnode;
            else
                var_6 = self;

            var_7 = spawn( "script_origin", var_6.origin );
            var_7.angles = var_6.angles;
            self.hackexit = var_7;

            if ( var_3 == "stand2run180" )
                var_7.angles += ( 0.0, 32.0, 0.0 );

            if ( var_6 != self )
            {
                if ( issubstr( var_3, "cornerleft" ) )
                    var_7.angles += ( 0.0, 90.0, 0.0 );
                else if ( issubstr( var_3, "cornerright" ) )
                    var_7.angles -= ( 0.0, 90.0, 0.0 );
            }

            self.animname = "guy";
            var_8 = getanimlength( level.scr_anim[self.animname][var_3] );
            self orientmode( "face motion" );
            var_7 thread maps\_anim::anim_single_solo( self, var_3 );
            wait(var_8 - 0.2);
            self stopanimscripted();
            var_7 delete();
            var_3 = undefined;

            if ( var_5 )
                thread wtfhack();
        }

        self waittill( "goal" );

        if ( isdefined( var_4.script_parameters ) )
        {
            var_9 = strtok( var_4.script_parameters, ":;, " );

            for ( var_10 = 0; var_10 < var_9.size; var_10++ )
            {
                switch ( var_9[var_10] )
                {
                    case "disable_cqb":
                        if ( isdefined( var_4.target ) )
                            maps\mo_tools::disable_cqbwalk_ign_demo_wrapper();
                        else
                            maps\_utility::delaythread( 1.5, maps\mo_tools::disable_cqbwalk_ign_demo_wrapper );

                        continue;
                    case "enable_cqb":
                        if ( isdefined( var_4.target ) )
                            maps\mo_tools::enable_cqbwalk_ign_demo_wrapper();
                        else
                            maps\_utility::delaythread( 1.5, maps\mo_tools::enable_cqbwalk_ign_demo_wrapper );

                        continue;
                }
            }
        }

        if ( isdefined( var_4.target ) )
        {
            var_4 = getnode( var_4.target, "targetname" );
            continue;
        }

        var_4 = undefined;
    }

    self notify( "hallways_heroes_atgoal" );

    if ( isdefined( var_2 ) )
        maps\mo_tools::radio_msg_stack( var_2 );

    self notify( "hallways_heroes_ready" );
}

hallways_heroes_get_node( var_0 )
{
    var_1 = getnodearray( var_0, "targetname" );
    var_2 = undefined;

    for ( var_3 = 0; var_3 < var_1.size; var_3++ )
    {
        if ( var_1[var_3].script_noteworthy == self.script_noteworthy )
        {
            var_2 = var_1[var_3];
            break;
        }
    }

    return var_2;
}

cargohold_flashthrow( var_0, var_1, var_2 )
{
    self.animname = "guy";

    if ( isdefined( self.node ) )
        self.goodnode = self.node;
    else
    {
        var_3 = getallnodes();
        var_4 = [];

        for ( var_5 = 0; var_5 < var_3.size; var_5++ )
        {
            if ( issubstr( tolower( var_3[var_5].type ), "cover left" ) )
                var_4[var_4.size] = var_3[var_5];
        }

        self.goodnode = common_scripts\utility::getclosest( self.origin, var_4, 90 );
    }

    var_6 = spawn( "script_origin", self.goodnode.origin );
    var_6.angles = self.goodnode.angles + ( 0.0, 90.0, 0.0 );
    var_6 thread maps\_anim::anim_single_solo( self, "grenade_throw" );
    thread animscripts\shared::donotetracks( "single anim", animscripts\combat_utility::h1_grenade_attach_detach_listener );
    var_7 = self.grenadeweapon;
    self.grenadeweapon = "flash_grenade";
    self.grenadeammo++;
    wait 3.5;
    var_8 = self.origin + ( 30.0, 25.0, 30.0 );
    var_9 = var_8 + var_0;

    if ( isdefined( var_1 ) )
    {
        var_9 += ( 0.0, 0.0, 200.0 );
        var_10 = vectornormalize( var_9 - var_8 );

        if ( !isdefined( var_2 ) )
            var_2 = 350;

        var_10 = maps\_utility::vector_multiply( var_10, var_2 );
        self magicgrenademanual( var_8, var_10, 1.1 );
    }
    else
        self magicgrenade( var_8, var_9, 1.1 );

    self.grenadeweapon = var_7;
    self.grenadeammo = 0;
    wait 2;
}

caroghold_remove_flash_grenade( var_0 )
{
    common_scripts\utility::flag_wait( var_0 );

    if ( isdefined( self.h1_scripted_grenade ) )
        animscripts\combat_utility::h1_grenade_attach_detach_listener( "grenade_throw" );
}

jumptoinit()
{
    if ( getdvar( "jumpto" ) == "" )
        setdvar( "jumpto", "" );

    if ( !isdefined( getdvar( "jumpto" ) ) )
        setdvar( "jumpto", "" );

    var_0 = getdvar( "start" );
    var_1 = getdvar( "jumpto" );
    level.jumpto = "start";
    level.jumptosection = "bridge";

    if ( isdefined( var_0 ) && !( var_0 == "" || issubstr( var_0, " ** " ) ) )
        level.jumpto = var_0;

    if ( isdefined( var_1 ) && var_1 != "" )
        level.jumpto = var_1;

    var_2 = 1;

    if ( level.jumpto == "bridge" || level.jumpto == "" + var_2 )
    {
        level.jumptosection = "bridge";
        level.jumpto = "bridge";
        return;
    }

    var_2++;

    if ( level.jumpto == "quarters" || level.jumpto == "" + var_2 )
    {
        level.jumptosection = "quarters";
        level.jumpto = "quarters";
        return;
    }

    var_2++;

    if ( level.jumpto == "deck" || level.jumpto == "" + var_2 )
    {
        level.jumptosection = "deck";
        level.jumpto = "deck";
        return;
    }

    var_2++;

    if ( level.jumpto == "hallways" || level.jumpto == "" + var_2 )
    {
        level.jumptosection = "hallways";
        level.jumpto = "hallways";
        return;
    }

    var_2++;

    if ( level.jumpto == "cargohold" || level.jumpto == "" + var_2 )
    {
        level.jumptosection = "cargohold";
        level.jumpto = "cargohold";
        return;
    }

    var_2++;

    if ( level.jumpto == "cargohold2" || level.jumpto == "" + var_2 )
    {
        level.jumptosection = "cargohold2";
        level.jumpto = "cargohold2";
        return;
    }

    var_2++;

    if ( level.jumpto == "laststand" || level.jumpto == "" + var_2 )
    {
        level.jumptosection = "laststand";
        level.jumpto = "laststand";
        return;
    }

    var_2++;

    if ( level.jumpto == "package" || level.jumpto == "" + var_2 )
    {
        level.jumptosection = "package";
        level.jumpto = "package";
        return;
    }

    var_2++;

    if ( level.jumpto == "escape" || level.jumpto == "" + var_2 )
    {
        level.jumptosection = "escape";
        level.jumpto = "escape";
        return;
    }

    var_2++;

    if ( level.jumpto == "end" || level.jumpto == "" + var_2 )
    {
        level.jumptosection = "end";
        level.jumpto = "end";
        return;
    }

    var_2++;
}

jumptothink()
{
    jumptorandomtrig( level.jumpto );
    var_0 = [];

    if ( level.jumpto != "start" )
    {
        setomnvar( "ui_gasmask", 1 );
        thread hidegasmaskthink();
        thread breath();
    }

    switch ( level.jumpto )
    {
        case "start":
            break;
        case "bridge":
            soundscripts\_snd::snd_message( "aud_bridge_checkpoint" );
            common_scripts\utility::flag_set( "_sea_viewbob" );
            common_scripts\utility::flag_wait( "heroes_ready" );
            level.heli maps\mo_fastrope::fastrope_heli_overtake_now();
            level.heli.vehicle vehicle_setspeed( 700, 700 );
            level.heli.vehicle setvehgoalpos( common_scripts\utility::getstruct( "intro_ride_node", "targetname" ).origin + ( 0.0, 0.0, 920.0 ), 1 );
            level.heli.vehicle settargetyaw( 220 );
            wait 5.5;
            maps\_utility::delaythread( 2.5, soundscripts\_snd::snd_message, "aud_stop_intro_mix" );
            level.player.time = 3;
            level.heli maps\mo_fastrope::fastrope_player_unload();
            level notify( "bridge_jumpto_done" );
            break;
        case "deck":
            soundscripts\_snd::snd_message( "aud_deck_checkpoint" );
            common_scripts\utility::flag_set( "_sea_viewbob" );
            common_scripts\utility::flag_set( "_sea_waves" );
            common_scripts\utility::flag_clear( "_sea_bob" );
            common_scripts\utility::flag_wait( "heroes_ready" );
            maps\_utility::set_vision_set( "cargoship_exterior", 0 );
            maps\_utility::vision_set_fog_changes( "cargoship_exterior", 0 );
            level.player maps\_utility::set_light_set_player( "cargoship_exterior" );
            level.heli maps\mo_fastrope::fastrope_heli_overtake_now();
            level.heli.vehicle vehicle_setspeed( 300, 300, 250 );
            level.heli.vehicle setvehgoalpos( common_scripts\utility::getstruct( "heli_deck_landing_node", "targetname" ).origin + ( 0.0, 0.0, 146.0 ), 1 );
            var_1 = getnode( "quarters_price_2", "targetname" );
            level.heroes5["price"] thread jumptoactor( var_1.origin );
            var_1 = getnode( "quarters_alavi_2", "targetname" );
            level.heroes5["alavi"] thread jumptoactor( var_1.origin );
            level.heli.model heli_searchlight_on();
            wait 1;
            common_scripts\utility::flag_set( "deck_drop" );
            common_scripts\utility::flag_set( "deck_heli" );
            common_scripts\utility::flag_set( "deck" );
            break;
        case "hallways":
            soundscripts\_snd::snd_message( "aud_hallways_checkpoint" );
            common_scripts\utility::flag_set( "_sea_viewbob" );
            common_scripts\utility::flag_set( "_sea_waves" );
            maps\_utility::set_vision_set( "cargoship_exterior", 0 );
            maps\_utility::vision_set_fog_changes( "cargoship_exterior", 0 );
            level.player maps\_utility::set_light_set_player( "cargoship_exterior" );
            common_scripts\utility::flag_wait( "heroes_ready" );
            level.heli maps\mo_fastrope::fastrope_heli_overtake_now();
            var_2 = getnodearray( "hallways_door_open_guard", "targetname" );
            var_1 = [];

            for ( var_3 = 0; var_3 < var_2.size; var_3++ )
                var_1[var_2[var_3].script_noteworthy] = var_2[var_3];

            level.heroes5["price"] thread jumptoactor( var_1["alavi"].origin + ( -100.0, 0.0, 0.0 ) );
            level.heroes5["grigsby"] thread jumptoactor( var_1["alavi"].origin + ( 250.0, 0.0, 0.0 ) );
            level.heroes5["alavi"] thread jumptoactor( var_1["alavi"].origin );
            level.heroes5["seat5"] thread jumptoactor( var_1["seat5"].origin );
            level.heroes5["seat6"] thread jumptoactor( var_1["seat6"].origin );
            level.heroes5["price"] maps\mo_tools::disable_cqbwalk_ign_demo_wrapper();
            level.heroes5["grigsby"] maps\mo_tools::disable_cqbwalk_ign_demo_wrapper();
            level.heroes5["alavi"] maps\mo_tools::disable_cqbwalk_ign_demo_wrapper();
            level.heroes5["seat5"] maps\mo_tools::disable_cqbwalk_ign_demo_wrapper();
            level.heroes5["seat6"] maps\mo_tools::disable_cqbwalk_ign_demo_wrapper();
            level.heli notify( "heli_end" );
            wait 0.1;
            level.heli.model delete();
            level.heli.vehicle delete();
            level.heroes7["pilot"] delete();
            level.heroes7["copilot"] delete();
            common_scripts\utility::flag_set( "hallways" );
            common_scripts\utility::flag_set( "hallways_moveup" );
            break;
        case "cargohold":
            soundscripts\_snd::snd_message( "aud_cargohold_checkpoint" );
            common_scripts\utility::flag_clear( "_sea_waves" );
            common_scripts\utility::flag_clear( "topside_fx" );
            common_scripts\utility::flag_set( "_sea_viewbob" );
            common_scripts\utility::flag_set( "cargohold_fx" );
            thread maps\_weather::rainnone( 1 );
            maps\_utility::set_vision_set( "cargoship_interior_upperdeck", 0 );
            maps\_utility::vision_set_fog_changes( "cargoship_interior_upperdeck", 0 );
            level.player maps\_utility::set_light_set_player( "cargoship_interior_upperdeck" );
            common_scripts\utility::flag_wait( "heroes_ready" );
            level.heli maps\mo_fastrope::fastrope_heli_overtake_now();
            var_2 = getnodearray( "hallways_door_open_guard", "targetname" );
            var_1 = [];

            for ( var_3 = 0; var_3 < var_2.size; var_3++ )
                var_1[var_2[var_3].script_noteworthy] = var_2[var_3];

            level.heroes5["seat5"] thread jumptoactor( var_1["seat5"].origin );
            level.heroes5["seat6"] thread jumptoactor( var_1["seat6"].origin );
            var_2 = getnodearray( "hallways_lowerhall2", "targetname" );
            var_1 = [];

            for ( var_3 = 0; var_3 < var_2.size; var_3++ )
                var_1[var_2[var_3].script_noteworthy] = var_2[var_3];

            level.heroes5["alavi"] thread jumptoactor( var_1["alavi"].origin );
            level.heroes5["price"] thread jumptoactor( var_1["price"].origin );
            level.heroes5["grigsby"] thread jumptoactor( var_1["grigsby"].origin );
            level.heroes5["price"] maps\mo_tools::enable_cqbwalk_ign_demo_wrapper();
            level.heroes5["grigsby"] maps\mo_tools::enable_cqbwalk_ign_demo_wrapper();
            level.heroes5["alavi"] maps\mo_tools::enable_cqbwalk_ign_demo_wrapper();
            level.heroes5["seat5"] maps\mo_tools::disable_cqbwalk_ign_demo_wrapper();
            level.heroes5["seat6"] maps\mo_tools::disable_cqbwalk_ign_demo_wrapper();
            level.heroes5["price"].baseaccuracy = level.heroes5["price"].cgo_old_baseaccuracy;
            level.heroes5["alavi"].baseaccuracy = level.heroes5["price"].cgo_old_baseaccuracy;
            level.heroes5["grigsby"].baseaccuracy = level.heroes5["price"].cgo_old_baseaccuracy;
            level.heroes5["price"].accuracy = level.heroes5["price"].cgo_old_accuracy;
            level.heroes5["alavi"].accuracy = level.heroes5["price"].cgo_old_accuracy;
            level.heroes5["grigsby"].accuracy = level.heroes5["price"].cgo_old_accuracy;
            thread player_speed_set_cargoship( 137, 1 );
            getent( "hallways_lower_runners", "target" ) common_scripts\utility::trigger_off();
            getent( "hallways_lower_runners2", "target" ) common_scripts\utility::trigger_off();
            common_scripts\utility::flag_set( "hallways_lowerhall2" );
            break;
        case "cargohold2":
            soundscripts\_snd::snd_message( "aud_cargohold2_checkpoint" );
            common_scripts\utility::flag_clear( "_sea_waves" );
            common_scripts\utility::flag_clear( "topside_fx" );
            common_scripts\utility::flag_set( "_sea_viewbob" );
            common_scripts\utility::flag_set( "cargohold_fx" );
            thread maps\_weather::rainnone( 1 );
            maps\_utility::set_vision_set( "cargoship_interior_cargohold", 0 );
            maps\_utility::vision_set_fog_changes( "cargoship_interior_cargohold", 0 );
            level.player maps\_utility::set_light_set_player( "cargoship_interior_cargohold" );
            common_scripts\utility::flag_wait( "heroes_ready" );
            level.heli maps\mo_fastrope::fastrope_heli_overtake_now();
            var_2 = getnodearray( "hallways_door_open_guard", "targetname" );
            var_1 = [];

            for ( var_3 = 0; var_3 < var_2.size; var_3++ )
                var_1[var_2[var_3].script_noteworthy] = var_2[var_3];

            level.heroes5["seat5"] thread jumptoactor( var_1["seat5"].origin );
            level.heroes5["seat6"] thread jumptoactor( var_1["seat6"].origin );
            var_2 = getnodearray( "cargoholds_1_part5", "targetname" );
            var_1 = [];

            for ( var_3 = 0; var_3 < var_2.size; var_3++ )
                var_1[var_2[var_3].script_noteworthy] = var_2[var_3];

            level.heroes5["alavi"] thread jumptoactor( var_1["alavi"].origin );
            level.heroes5["price"] thread jumptoactor( var_1["price"].origin );
            level.heroes5["grigsby"] thread jumptoactor( var_1["grigsby"].origin );
            level.heroes5["price"] maps\mo_tools::enable_cqbwalk_ign_demo_wrapper();
            level.heroes5["grigsby"] maps\mo_tools::enable_cqbwalk_ign_demo_wrapper();
            level.heroes5["alavi"] maps\mo_tools::enable_cqbwalk_ign_demo_wrapper();
            level.heroes5["seat5"] maps\mo_tools::disable_cqbwalk_ign_demo_wrapper();
            level.heroes5["seat6"] maps\mo_tools::disable_cqbwalk_ign_demo_wrapper();
            level.heroes5["price"].baseaccuracy = level.heroes5["price"].cgo_old_baseaccuracy;
            level.heroes5["alavi"].baseaccuracy = level.heroes5["price"].cgo_old_baseaccuracy;
            level.heroes5["grigsby"].baseaccuracy = level.heroes5["price"].cgo_old_baseaccuracy;
            level.heroes5["price"].accuracy = level.heroes5["price"].cgo_old_accuracy;
            level.heroes5["alavi"].accuracy = level.heroes5["price"].cgo_old_accuracy;
            level.heroes5["grigsby"].accuracy = level.heroes5["price"].cgo_old_accuracy;
            level.heroes5["grigsby"].wantshotgun = 1;
            thread player_speed_set_cargoship( 137, 1 );
            getent( "hallways_lower_runners", "target" ) common_scripts\utility::trigger_off();
            getent( "hallways_lower_runners2", "target" ) common_scripts\utility::trigger_off();
            getent( "cargohold1_flashed_enemies", "target" ) common_scripts\utility::trigger_off();
            common_scripts\utility::array_thread( getentarray( "pulp_fiction_trigger", "targetname" ), common_scripts\utility::trigger_off );
            common_scripts\utility::flag_set( "cargoholds2" );
            break;
        case "laststand":
            soundscripts\_snd::snd_message( "aud_laststand_checkpoint" );
            common_scripts\utility::flag_clear( "_sea_waves" );
            common_scripts\utility::flag_clear( "topside_fx" );
            common_scripts\utility::flag_set( "_sea_viewbob" );
            common_scripts\utility::flag_set( "cargohold_fx" );
            thread maps\_weather::rainnone( 1 );
            maps\_utility::set_vision_set( "cargoship_interior_cargohold", 0 );
            maps\_utility::vision_set_fog_changes( "cargoship_interior_cargohold", 0 );
            level.player maps\_utility::set_light_set_player( "cargoship_interior_cargohold" );
            common_scripts\utility::flag_wait( "heroes_ready" );
            level.heli maps\mo_fastrope::fastrope_heli_overtake_now();
            var_2 = getnodearray( "hallways_door_open_guard", "targetname" );
            var_1 = [];

            for ( var_3 = 0; var_3 < var_2.size; var_3++ )
                var_1[var_2[var_3].script_noteworthy] = var_2[var_3];

            level.heroes5["seat5"] thread jumptoactor( var_1["seat5"].origin );
            level.heroes5["seat6"] thread jumptoactor( var_1["seat6"].origin );
            var_2 = getnodearray( "cargohold2_door", "targetname" );
            var_1 = [];

            for ( var_3 = 0; var_3 < var_2.size; var_3++ )
                var_1[var_2[var_3].script_noteworthy] = var_2[var_3];

            level.heroes5["alavi"] thread jumptoactor( var_1["alavi"].origin );
            level.heroes5["price"] thread jumptoactor( var_1["price"].origin );
            level.heroes5["grigsby"] thread jumptoactor( var_1["grigsby"].origin );
            level.heroes5["price"] maps\mo_tools::enable_cqbwalk_ign_demo_wrapper();
            level.heroes5["grigsby"] maps\mo_tools::enable_cqbwalk_ign_demo_wrapper();
            level.heroes5["alavi"] maps\mo_tools::enable_cqbwalk_ign_demo_wrapper();
            level.heroes5["seat5"] maps\mo_tools::disable_cqbwalk_ign_demo_wrapper();
            level.heroes5["seat6"] maps\mo_tools::disable_cqbwalk_ign_demo_wrapper();
            level.heroes5["price"].baseaccuracy = level.heroes5["price"].cgo_old_baseaccuracy;
            level.heroes5["alavi"].baseaccuracy = level.heroes5["price"].cgo_old_baseaccuracy;
            level.heroes5["grigsby"].baseaccuracy = level.heroes5["price"].cgo_old_baseaccuracy;
            level.heroes5["price"].accuracy = level.heroes5["price"].cgo_old_accuracy;
            level.heroes5["alavi"].accuracy = level.heroes5["price"].cgo_old_accuracy;
            level.heroes5["grigsby"].accuracy = level.heroes5["price"].cgo_old_accuracy;
            level.heroes5["grigsby"].wantshotgun = 1;
            level.heroes5["price"].ignoreme = 0;
            level.heroes5["alavi"].ignoreme = 0;
            level.heroes5["grigsby"].ignoreme = 0;
            thread player_speed_set_cargoship( 137, 1 );
            getent( "hallways_lower_runners", "target" ) common_scripts\utility::trigger_off();
            getent( "hallways_lower_runners2", "target" ) common_scripts\utility::trigger_off();
            getent( "cargohold1_flashed_enemies", "target" ) common_scripts\utility::trigger_off();
            getent( "cargohold2_catwalk_enemies2", "target" ) common_scripts\utility::trigger_off();
            getent( "cargohold2_catwalk_enemies", "target" ) common_scripts\utility::trigger_off();
            common_scripts\utility::array_thread( getentarray( "pulp_fiction_trigger", "targetname" ), common_scripts\utility::trigger_off );
            common_scripts\utility::flag_set( "laststand" );
            break;
        case "package":
            soundscripts\_snd::snd_message( "aud_package_checkpoint" );
            common_scripts\utility::flag_clear( "_sea_waves" );
            common_scripts\utility::flag_clear( "topside_fx" );
            common_scripts\utility::flag_set( "_sea_viewbob" );
            common_scripts\utility::flag_set( "cargohold_fx" );
            thread maps\_weather::rainnone( 1 );
            maps\_utility::set_vision_set( "cargoship_interior_cargohold", 0 );
            maps\_utility::vision_set_fog_changes( "cargoship_interior_cargohold", 0 );
            level.player maps\_utility::set_light_set_player( "cargoship_interior_cargohold" );
            common_scripts\utility::flag_wait( "heroes_ready" );
            level.heli maps\mo_fastrope::fastrope_heli_overtake_now();
            var_2 = getnodearray( "hallways_door_open_guard", "targetname" );
            var_1 = [];

            for ( var_3 = 0; var_3 < var_2.size; var_3++ )
                var_1[var_2[var_3].script_noteworthy] = var_2[var_3];

            level.heroes5["seat5"] thread jumptoactor( var_1["seat5"].origin );
            level.heroes5["seat6"] thread jumptoactor( var_1["seat6"].origin );
            var_2 = getnodearray( "package1", "targetname" );
            var_1 = [];

            for ( var_3 = 0; var_3 < var_2.size; var_3++ )
                var_1[var_2[var_3].script_noteworthy] = var_2[var_3];

            level.heroes5["alavi"] thread jumptoactor( var_1["alavi"].origin );
            level.heroes5["price"] thread jumptoactor( var_1["price"].origin );
            level.heroes5["grigsby"] thread jumptoactor( var_1["grigsby"].origin );
            level.heroes5["price"] maps\mo_tools::disable_cqbwalk_ign_demo_wrapper();
            level.heroes5["grigsby"] maps\mo_tools::disable_cqbwalk_ign_demo_wrapper();
            level.heroes5["alavi"] maps\mo_tools::disable_cqbwalk_ign_demo_wrapper();
            level.heroes5["seat5"] maps\mo_tools::disable_cqbwalk_ign_demo_wrapper();
            level.heroes5["seat6"] maps\mo_tools::disable_cqbwalk_ign_demo_wrapper();
            level.heroes5["grigsby"].wantshotgun = 1;
            getent( "hallways_lower_runners", "target" ) common_scripts\utility::trigger_off();
            getent( "hallways_lower_runners2", "target" ) common_scripts\utility::trigger_off();
            getent( "cargohold1_flashed_enemies", "target" ) common_scripts\utility::trigger_off();
            getent( "cargohold3_enemies1", "target" ) common_scripts\utility::trigger_off();
            getent( "cargohold3_enemies2", "target" ) common_scripts\utility::trigger_off();
            getent( "cargohold3_enemies3", "target" ) common_scripts\utility::trigger_off();
            getent( "cargohold2_catwalk_enemies2", "target" ) common_scripts\utility::trigger_off();
            getent( "cargohold2_catwalk_enemies", "target" ) common_scripts\utility::trigger_off();
            common_scripts\utility::array_thread( getentarray( "pulp_fiction_trigger", "targetname" ), common_scripts\utility::trigger_off );
            common_scripts\utility::flag_set( "package" );
            break;
        case "escape":
            soundscripts\_snd::snd_message( "aud_escape_checkpoint" );
            common_scripts\utility::flag_clear( "_sea_waves" );
            common_scripts\utility::flag_clear( "topside_fx" );
            common_scripts\utility::flag_set( "_sea_viewbob" );
            common_scripts\utility::flag_set( "cargohold_fx" );
            thread maps\_weather::rainnone( 1 );
            maps\_utility::set_vision_set( "cargoship_interior_cargohold", 0 );
            maps\_utility::vision_set_fog_changes( "cargoship_interior_cargohold", 0 );
            level.player maps\_utility::set_light_set_player( "cargoship_interior_cargohold" );
            common_scripts\utility::flag_wait( "heroes_ready" );
            level.heli maps\mo_fastrope::fastrope_heli_overtake_now();
            var_2 = getnodearray( "escape_nodes", "targetname" );
            var_1 = [];

            for ( var_3 = 0; var_3 < var_2.size; var_3++ )
                var_1[var_2[var_3].script_noteworthy] = var_2[var_3];

            level.heroes3["price"] thread jumptoactor( var_1["price"].origin );
            level.heroes3["grigsby"] thread jumptoactor( var_1["grigsby"].origin );
            level.heroes3["alavi"] thread jumptoactor( var_1["alavi"].origin );
            level.heroes3["price"] maps\mo_tools::disable_cqbwalk_ign_demo_wrapper();
            level.heroes3["grigsby"] maps\mo_tools::disable_cqbwalk_ign_demo_wrapper();
            level.heroes3["alavi"] maps\mo_tools::disable_cqbwalk_ign_demo_wrapper();
            level.heroes5["grigsby"].wantshotgun = 1;
            wait 0.1;
            level.heli.model delete();
            level.heli.vehicle delete();
            var_2 = getnodearray( "hallways_door_open_guard", "targetname" );
            var_1 = [];

            for ( var_3 = 0; var_3 < var_2.size; var_3++ )
                var_1[var_2[var_3].script_noteworthy] = var_2[var_3];

            level.heroes5["seat5"] thread jumptoactor( var_1["seat5"].origin );
            level.heroes5["seat6"] thread jumptoactor( var_1["seat6"].origin );
            level.heroes7["pilot"] delete();
            level.heroes7["copilot"] delete();
            getent( "hallways_lower_runners", "target" ) common_scripts\utility::trigger_off();
            getent( "hallways_lower_runners2", "target" ) common_scripts\utility::trigger_off();
            getent( "cargohold1_flashed_enemies", "target" ) common_scripts\utility::trigger_off();
            getent( "cargohold3_enemies1", "target" ) common_scripts\utility::trigger_off();
            getent( "cargohold3_enemies2", "target" ) common_scripts\utility::trigger_off();
            getent( "cargohold3_enemies3", "target" ) common_scripts\utility::trigger_off();
            getent( "cargohold2_catwalk_enemies2", "target" ) common_scripts\utility::trigger_off();
            getent( "cargohold2_catwalk_enemies", "target" ) common_scripts\utility::trigger_off();
            common_scripts\utility::array_thread( getentarray( "pulp_fiction_trigger", "targetname" ), common_scripts\utility::trigger_off );
            common_scripts\utility::flag_set( "escape" );
            thread maps\_utility::flag_set_delayed( "package_secure", 1 );
            break;
        case "end":
            soundscripts\_snd::snd_message( "aud_end_checkpoint" );
            common_scripts\utility::flag_clear( "_sea_waves" );
            common_scripts\utility::flag_clear( "cargohold_fx" );
            common_scripts\utility::flag_set( "topside_fx" );
            common_scripts\utility::flag_set( "_sea_viewbob" );
            common_scripts\utility::flag_clear( "_sea_bob" );
            thread maps\_weather::rainnone( 1 );
            maps\_utility::set_vision_set( "cargoship_interior_upperdeck", 0 );
            maps\_utility::vision_set_fog_changes( "cargoship_interior_upperdeck", 0 );
            level.player maps\_utility::set_light_set_player( "cargoship_interior_upperdeck" );
            common_scripts\utility::flag_wait( "heroes_ready" );
            level.heli maps\mo_fastrope::fastrope_heli_overtake_now();
            var_4 = getarraykeys( level.heroes5 );

            for ( var_3 = 0; var_3 < var_4.size; var_3++ )
            {
                var_5 = var_4[var_3];
                var_6 = level.heroes5[var_5];
                var_6 notify( "stop_" + var_6.index );
                level.heli.model notify( "stop_" + var_6.index );
            }

            waittillframeend;
            var_2 = getnodearray( "hallway_attack", "targetname" );
            var_1 = [];

            for ( var_3 = 0; var_3 < var_2.size; var_3++ )
                var_1[var_2[var_3].script_noteworthy] = var_2[var_3];

            level.heroes3["price"] thread jumptoactor( var_1["price"].origin );
            level.heroes3["grigsby"] thread jumptoactor( var_1["grigsby"].origin );
            level.heroes3["alavi"] thread jumptoactor( var_1["alavi"].origin );
            level.heroes3["price"] maps\mo_tools::disable_cqbwalk_ign_demo_wrapper();
            level.heroes3["grigsby"] maps\mo_tools::disable_cqbwalk_ign_demo_wrapper();
            level.heroes3["alavi"] maps\mo_tools::disable_cqbwalk_ign_demo_wrapper();
            level.heli.model delete();
            level.heli.vehicle delete();
            var_2 = getnodearray( "hallways_door_open_guard", "targetname" );
            var_1 = [];

            for ( var_3 = 0; var_3 < var_2.size; var_3++ )
                var_1[var_2[var_3].script_noteworthy] = var_2[var_3];

            level.heroes5["seat5"] thread jumptoactor( var_1["seat5"].origin );
            level.heroes5["seat6"] thread jumptoactor( var_1["seat6"].origin );
            level.heroes7["pilot"] delete();
            level.heroes7["copilot"] delete();
            getent( "hallways_lower_runners", "target" ) common_scripts\utility::trigger_off();
            getent( "hallways_lower_runners2", "target" ) common_scripts\utility::trigger_off();
            getent( "cargohold1_flashed_enemies", "target" ) common_scripts\utility::trigger_off();
            getent( "cargohold3_enemies1", "target" ) common_scripts\utility::trigger_off();
            getent( "cargohold3_enemies2", "target" ) common_scripts\utility::trigger_off();
            getent( "cargohold3_enemies3", "target" ) common_scripts\utility::trigger_off();
            getent( "cargohold2_catwalk_enemies2", "target" ) common_scripts\utility::trigger_off();
            getent( "cargohold2_catwalk_enemies", "target" ) common_scripts\utility::trigger_off();
            common_scripts\utility::array_thread( getentarray( "pulp_fiction_trigger", "targetname" ), common_scripts\utility::trigger_off );
            common_scripts\utility::flag_set( "escape" );
            common_scripts\utility::flag_set( "package_secure" );
            common_scripts\utility::flag_set( "escape_hallway_lower_flag" );
            common_scripts\utility::flag_set( "cargoship_end_music" );
            common_scripts\utility::array_thread( getentarray( "escape_flags", "script_noteworthy" ), common_scripts\utility::trigger_on );
            common_scripts\utility::flag_set( "escape_exterior_visionset" );
            waittillframeend;
            maps\mo_tools::playerweapontake();
            level.heroes3["alavi"].animname = "escape";
            level.heroes3["grigsby"].animname = "escape";
            level.heroes3["price"].animname = "escape";
            var_7 = [];
            var_7[var_7.size] = level.heroes3["price"];
            var_7[var_7.size] = level.heroes3["alavi"];
            var_7[var_7.size] = level.heroes3["grigsby"];
            level.heroes3["price"] maps\_utility::ent_flag_init( "turning" );
            level.heroes3["grigsby"] maps\_utility::ent_flag_init( "turning" );
            level.heroes3["alavi"] maps\_utility::ent_flag_init( "turning" );
            level.heroes3["alavi"] thread escape_heroes_holdtheline( 500, var_7, 200 );
            level.heroes3["grigsby"] thread escape_heroes_holdtheline( 400, var_7, 150 );
            level.heroes3["price"] thread escape_heroes_holdtheline( 350, var_7, 150 );
            wait 0.5;
            escape_heroes_turn_setup();
            escape_heroes_runanim_setup();
            thread maps\cargoship::escape_seaknight();
            thread maps\cargoship::end_main();
            level.heroes3["alavi"] thread maps\_utility::function_stack( ::escape_heroes_run, "escape_aftdeck" );
            level.heroes3["grigsby"] maps\_utility::delaythread( 2, maps\_utility::function_stack, ::escape_heroes_run, "escape_aftdeck" );
            level.heroes3["price"] maps\_utility::delaythread( 3, maps\_utility::function_stack, ::escape_heroes_run, "escape_aftdeck" );
            thread maps\_utility::flag_set_delayed( "escape_hallway_upper_flag", 3.75 );
            level._sea_org notify( "tilt_40_degrees" );
            level._sea_org.sway = "sway1";
            level._sea_org notify( "sway1" );
            level._sea_org.time = 0.1;
            level._sea_org.acctime = level._sea_org.time * 0.5;
            level._sea_org.dectime = level._sea_org.time * 0.5;
            level._sea_org.rotation = ( 0.0, 0.0, -40.0 );
            level._sea_link rotateto( level._sea_org.rotation, level._sea_org.time, level._sea_org.acctime, level._sea_org.dectime );
            level._sea_org rotateto( level._sea_org.rotation, level._sea_org.time, level._sea_org.acctime, level._sea_org.dectime );
            level._sea_link movez( -300, 0.1 );
            level._sea_org movez( -300, 0.1 );
            break;
    }

    switch ( level.jumpto )
    {
        case "package":
        case "escape":
        case "end":
            var_8 = getent( "cargohold1_door", "targetname" );
            var_9 = getent( var_8.target, "targetname" );
            var_9 notsolid();
            var_9 connectpaths();
            var_8 door_opens();
        case "cargohold":
            var_8 = getent( "hallways_door", "targetname" );
            var_9 = getent( var_8.target, "targetname" );
            var_9 notsolid();
            var_9 connectpaths();
            var_8 door_opens();
    }

    common_scripts\utility::array_thread( var_0, ::jumptorandomtrigthink );

    if ( level.jumpto != "end" )
        maps\mo_tools::playerweapongive();

    var_1 = common_scripts\utility::getstruct( "jumpto_" + level.jumpto, "targetname" );

    if ( !isdefined( var_1 ) )
        return;

    level.player unlink();
    level.player allowlean( 1 );
    level.player allowcrouch( 1 );
    level.player allowprone( 1 );
    level.player setorigin( var_1.origin + ( 0.0, 0.0, 8.0 ) );
    level.player setplayerangles( var_1.angles );
}

jumptoactor( var_0 )
{
    self notify( "overtakenow" );
    self unlink();
    self stopanimscripted();
    var_1 = spawn( "script_origin", self.origin );
    self linkto( var_1 );
    var_1 moveto( var_0, 0.2 );
    wait 0.25;
    self unlink();
    var_1 delete();
    self.loops = 0;
    self setgoalpos( var_0 );
    self.goalradius = 16;
    common_scripts\utility::waittill_notify_or_timeout( "goal", 1.25 );
    wait 0.1;
    self setgoalpos( var_0 );
    self.goalradius = 16;
}

jumptorandomtrig( var_0 )
{
    var_1 = getentarray( "jumptoRandomTrig", "script_noteworthy" );

    for ( var_2 = 0; var_2 < var_1.size; var_2++ )
    {
        var_3 = strtok( var_1[var_2].script_parameters, ":;, " );

        for ( var_4 = 0; var_4 < var_3.size; var_4++ )
        {
            if ( var_3[var_4] == var_0 )
            {
                var_1[var_2].jumptorandomtype = tolower( var_3[var_4 + 1] );
                var_1[var_2] thread jumptorandomtrigthink();
                break;
            }
        }
    }
}

jumptorandomtrigthink()
{
    if ( self.classname != "trigger_multiple" && self.classname != "trigger_radius" && !isdefined( self.jumptorandomtype ) )
        return;

    if ( !isdefined( self.jumptorandomtype ) )
        self.jumptorandomtype = "trigger";

    switch ( self.jumptorandomtype )
    {
        case "trigger":
            wait 0.1;
            self notify( "trigger" );
            break;
        case "off":
            common_scripts\utility::trigger_off();
            break;
        case "open":
            maps\mo_tools::door_breach_door();
            break;
    }
}

escape_catwalk()
{
    var_0 = getent( "escape_catwalk", "targetname" );
    var_1 = getentarray( var_0.targetname, "target" );

    for ( var_2 = 0; var_2 < var_1.size; var_2++ )
        var_1[var_2] linkto( var_0 );

    common_scripts\utility::flag_wait( "escape_catwalk" );
    var_0 movez( -4, 0.25, 0, 0 );
    var_0 movey( -2, 0.25, 0, 0 );
    var_0 rotateto( ( 0.0, 0.0, 5.0 ), 0.25, 0, 0 );
    var_0 waittill( "rotatedone" );
    var_0 thread escape_catwalk_sway();
    var_0 thread maps\_utility::play_sound_on_entity( "cgo_escape_catwalk_breaks" );
    var_0 thread common_scripts\utility::play_loop_sound_on_entity( "cgo_escape_catwalk_creaks_loop" );
    common_scripts\utility::flag_wait_either( "escape_death_cargohold1", "escape_catwalk_fall" );
    var_3 = create_overlay_element( "overlay_hunted_red", 0 );
    thread escape_catwalk_live( var_3 );
    var_3 thread exp_fade_overlay( 1, 6 );
    var_0 notify( "stop_swaying" );
    var_4 = 2.5;

    if ( level.gameskill == 0 )
        var_4 = 3.5;

    wait(var_4);
    var_0 common_scripts\utility::stop_loop_sound_on_entity( "cgo_escape_catwalk_creaks_loop" );
    var_0 thread maps\_utility::play_sound_on_entity( "cgo_escape_catwalk_collapse" );
    var_0 movez( -16, 1.5, 0, 1.5 );
    var_0 rotateto( ( 10.0, 0.0, 90.0 ), 1.5, 0, 1.5 );
    wait 2;

    if ( !common_scripts\utility::flag( "escape_catwalk_madeit" ) )
        escape_mission_failed();
}

escape_catwalk_live( var_0 )
{
    common_scripts\utility::flag_wait( "escape_catwalk_madeit" );
    var_0 exp_fade_overlay( 0, 0.5 );
    var_0 destroy();
}

escape_catwalk_sway()
{
    self endon( "stop_swaying" );
    var_0 = 0.7;

    for (;;)
    {
        self rotateto( ( 0, -2 * var_0, -2 * var_0 ), 1, 0.5, 0.5 );
        self waittill( "rotatedone" );
        self rotateto( ( 0, 2 * var_0, 2 * var_0 ), 1, 0.5, 0.5 );
        self waittill( "rotatedone" );
    }
}

escape_heroes_turn_setup()
{
    var_0 = getentarray( "escape_turn_animations", "targetname" );
    level.escape_turns = [];

    for ( var_1 = 0; var_1 < var_0.size; var_1++ )
        level.escape_turns[var_0[var_1].script_noteworthy] = var_0[var_1];
}

#using_animtree("generic_human");

escape_turn( var_0 )
{
    level endon( "killanimscript" );
    self orientmode( "face angle", self.turn_anim["angle"][1] );
    self setflaggedanimknoball( "custom_anim", self.turn_anim["anim"], %body, 1, 0.2, self.turn_anim["rate"] );
    wait(self.turn_anim["wait"]);
}

escape_heroes_run( var_0 )
{
    self allowedstances( "stand", "crouch" );
    self pushplayer( 1 );
    self.goalradius = 116;
    self.ignoreme = 1;
    self.ignoresuppression = 1;
    self.interval = 0;
    self.disablearrivals = 1;

    if ( isdefined( level.escape_turns[var_0] ) )
    {
        var_1 = level.escape_turns[var_0];
        var_2 = var_1.script_parameters;
        var_3 = maps\_utility::getanim( var_2 );
        var_4 = getanimlength( var_3 );
        var_5 = getstartorigin( var_1.origin, var_1.angles, var_3 );
        self setgoalpos( var_5 );
        self.goalradius = 20;
        self waittill( "goal" );
        self.escape_run_section = var_0;

        switch ( var_0 )
        {
            case "escape_cargohold2b":
                var_6 = 1;
                break;
            case "escape_hallway_lowerb":
                var_6 = 1;
                break;
            case "escape_hallway_lowerc":
                var_6 = 1;
                break;
            case "escape_hallway_lowerd":
                var_6 = 1;
                break;
            case "escape_hallway_lowere":
                var_6 = 1;
                break;
            case "escape_hallway_upper":
                var_6 = 1;
                break;
            case "escape_aftdeck":
                var_6 = 1;
                break;
            default:
                var_6 = 0;
                break;
        }

        if ( self.script_noteworthy == "price" )
            var_7 = common_scripts\utility::ter_op( var_0 == "escape_hallway_lower", 1.5, 1.2 );
        else
            var_7 = 2.1;

        self.turn_anim = [];
        self.turn_anim["anim"] = var_3;
        self.turn_anim["angle"] = var_1.angles;
        self.turn_anim["length"] = var_4;
        self.turn_anim["rate"] = var_7;
        self.turn_anim["wait"] = var_4 / self.turn_anim["rate"] - 0.2;

        if ( self.script_noteworthy == "price" && var_6 == 1 )
            maps\_utility::set_generic_run_anim( level.current_run[var_0][self.run_speed_state] );
        else
        {
            self animcustom( ::escape_turn );
            maps\_utility::delaythread( self.turn_anim["wait"] - 0.2, maps\_utility::set_generic_run_anim, level.current_run[var_0][self.run_speed_state] );
            wait(self.turn_anim["wait"]);
        }
    }
    else
        maps\_utility::delaythread( 0.75, maps\_utility::set_generic_run_anim, level.current_run[var_0][self.run_speed_state] );

    var_8 = getnodearray( var_0 + "_start", "targetname" );

    if ( isdefined( var_8 ) && var_8.size )
    {
        var_9 = undefined;

        for ( var_10 = 0; var_10 < var_8.size; var_10++ )
        {
            if ( var_8[var_10].script_noteworthy == self.script_noteworthy )
            {
                var_9 = var_8[var_10];
                break;
            }
        }

        while ( isdefined( var_9 ) )
        {
            self setgoalnode( var_9 );

            if ( isdefined( var_9.radius ) && var_9.radius > 0 )
                self.goalradius = var_9.radius;
            else
                self.goalradius = 116;

            self waittill( "goal" );

            if ( isdefined( var_9.target ) )
            {
                var_9 = getnode( var_9.target, "targetname" );
                continue;
            }

            var_9 = undefined;
        }
    }

    if ( self.script_noteworthy == "price" )
    {
        switch ( var_0 )
        {
            case "escape_cargohold2":
                var_11 = "price_escape_1";
                var_12 = getent( "escape_cargohold2b", "script_noteworthy" );
                var_13 = undefined;
                var_14 = getent( "newpos_price_escape_cargohold2b", "targetname" );
                var_15 = undefined;
                break;
            case "escape_hallway_lower":
                var_11 = "price_escape_2";
                var_12 = getent( "escape_hallway_lowerb", "script_noteworthy" );
                var_13 = undefined;
                var_14 = getent( "newpos_price_escape_hallway_lowerb", "targetname" );
                var_15 = undefined;
                break;
            case "escape_hallway_lowerb":
                var_11 = "price_escape_3";
                var_12 = getent( "escape_hallway_lowerc", "script_noteworthy" );
                var_13 = getent( "escape_hallway_lowerd", "script_noteworthy" );
                var_14 = getent( "newpos_price_escape_hallway_lowerc", "targetname" );
                var_15 = getent( "newpos_price_escape_hallway_lowerd", "targetname" );
                break;
            case "escape_hallway_lowerd":
                var_11 = "price_escape_4";
                var_12 = getent( "escape_hallway_lowere", "script_noteworthy" );
                var_13 = getent( "escape_hallway_upper", "script_noteworthy" );
                var_14 = getent( "newpos_price_escape_hallway_lowere", "targetname" );
                var_15 = getent( "newpos_price_escape_hallway_upper", "targetname" );
                break;
            case "escape_hallway_upperb":
                var_11 = "price_escape_5";
                self.a.animreachcustomradius = 15;
                var_12 = getent( "escape_aftdeck", "script_noteworthy" );
                var_13 = undefined;
                var_14 = getent( "newpos_price_escape_aftdeck", "targetname" );
                var_15 = undefined;
                break;
            default:
                var_11 = undefined;
                var_12 = undefined;
                var_13 = undefined;
                var_14 = undefined;
                var_15 = undefined;
                break;
        }

        if ( isdefined( var_11 ) )
        {
            var_16 = getent( "price_escapeanims_refpos", "targetname" );
            var_16 maps\_anim::anim_reach_solo( self, var_11 );
            self.a.animreachcustomradius = undefined;

            if ( isdefined( var_14 ) )
            {
                var_12.origin = var_14.origin;

                if ( isdefined( var_15 ) )
                    var_13.origin = var_15.origin;
            }

            maps\_utility::set_goal_pos( var_12.origin );
            self.goalradius = 40;
            var_16 maps\_anim::anim_single_solo( self, var_11 );
        }
    }

    self notify( "end_escape_run" );
}

escape_sneakyslowplayer_underwaterfall()
{
    common_scripts\utility::flag_wait( "bottom_1st_stairs" );

    if ( distance2d( level.player.origin, level.heroes3["price"].origin ) < 150 )
        player_speed_set_cargoship( 110, 0.3 );

    maps\_utility::delaythread( 0.6, ::player_speed_set_cargoship, 185, 1.5 );
    common_scripts\utility::flag_wait( "inside_1st_waterfall" );

    if ( distance2d( level.player.origin, level.heroes3["price"].origin ) < 250 )
    {
        level.player setvelocity( ( 0.0, 1.0, 0.0 ) );
        player_speed_set_cargoship( 135, 0.1 );
        maps\_utility::delaythread( 0.5, ::player_speed_set_cargoship, 185, 1.25 );
    }

    common_scripts\utility::flag_wait( "inside_2nd_waterfall" );

    if ( distance2d( level.player.origin, level.heroes3["price"].origin ) < 250 )
    {
        level.player setvelocity( ( 0.0, 1.0, 0.0 ) );
        player_speed_set_cargoship( 135, 0.1 );
        maps\_utility::delaythread( 0.5, ::player_speed_set_cargoship, 180, 1.5 );
    }

    common_scripts\utility::flag_wait( "waterleak_machine_room" );

    if ( distance2d( level.player.origin, level.heroes3["price"].origin ) < 200 )
    {
        player_speed_set_cargoship( 140, 0.2 );
        maps\_utility::delaythread( 0.75, ::player_speed_set_cargoship, 170, 1.25 );
    }

    common_scripts\utility::flag_wait( "on_flooded_stairs" );

    if ( distance2d( level.player.origin, level.heroes3["price"].origin ) < 175 )
    {
        player_speed_set_cargoship( 110, 0.2 );
        maps\_utility::delaythread( 1, ::player_speed_set_cargoship, 170, 3 );
    }
}

escape_heroes2()
{
    self.animplaybackrate = 1.0;
    self.moveplaybackrate = 1.0;
    var_0 = spawn( "script_origin", self.origin );
    var_0.angles = ( 0.0, 180.0, 0.0 );
    self.oldanimname = self.animname;
    self.animname = "escape";
    self allowedstances( "crouch", "stand" );
    self stopanimscripted();
    self linkto( var_0 );
    var_0 thread maps\_anim::anim_single_solo( self, "blowback" );
    var_1 = undefined;

    switch ( self.script_noteworthy )
    {
        case "alavi":
            var_1 = ( 600.0, -160.0, -359.0 );
            break;
        case "grigsby":
            var_1 = ( 520.0, -320.0, -359.0 );
            break;
        case "price":
            self allowedstances( "prone" );
            var_1 = ( 442.0, -230.0, -359.0 );
            break;
    }

    var_0 moveto( var_1, 1, 0, 0.5 );

    if ( self.script_noteworthy == "price" || self.script_noteworthy == "grigsby" )
        wait 5;
    else
        self waittillmatch( "single anim", "end" );

    switch ( self.script_noteworthy )
    {
        case "alavi":
            var_1 = self.origin;
            break;
        case "grigsby":
            var_0 delete();
            self allowedstances( "stand" );
            break;
        case "price":
            var_0 delete();
            self allowedstances( "stand" );
            break;
    }

    if ( self.script_noteworthy == "price" || self.script_noteworthy == "grigsby" )
        return;

    self stopanimscripted();
    self unlink();
    self setgoalpos( var_1 );
    self.goalradius = 16;
    self.animname = self.oldanimname;

    switch ( self.script_noteworthy )
    {
        case "price":
            wait 2;
            var_0.origin = self.origin;
            var_0.angles = ( 0.0, 230.0, 0.0 );
            var_0 maps\_anim::anim_single_solo( self, "standup" );
            break;
        case "grigsby":
            wait 0.5;
            var_0.origin += ( 0.0, -35.0, 0.0 );
            var_0.angles = ( 0.0, 360.0, 0.0 );
            var_0 maps\_anim::anim_single_solo( self, "stumble3" );
            break;
    }

    var_0 delete();
    self allowedstances( "stand" );
}

escape_heroes()
{
    level endon( "escape_explosion" );
    var_0 = getent( "escape_door", "targetname" );
    var_1 = getent( var_0.target, "targetname" );
    var_1 notsolid();
    var_1 connectpaths();
    var_0 thread door_opens( 0.6 );

    if ( self.script_noteworthy == "price" )
        level.heroes3["price"].moveplaybackrate = 1.0816;
    else if ( self.script_noteworthy == "alavi" )
    {
        level.heroes3["alavi"].moveplaybackrate = 1;
        wait 0.75;
    }
    else if ( self.script_noteworthy == "grigsby" )
    {
        level.heroes3["grigsby"].moveplaybackrate = 1;
        wait 1.5;
    }

    var_2 = getnodearray( "escape_nodes", "targetname" );
    var_3 = undefined;

    for ( var_4 = 0; var_4 < var_2.size; var_4++ )
    {
        if ( var_2[var_4].script_noteworthy == self.script_noteworthy )
        {
            var_3 = var_2[var_4];
            break;
        }
    }

    self allowedstances( "crouch", "stand" );
    var_5 = 0;

    switch ( self.script_noteworthy )
    {
        case "grigsby":
            var_5 = 0;
            break;
        case "price":
            var_5 = 0.4;
            break;
        case "alavi":
            var_5 = 1;
            break;
    }

    self pushplayer( 1 );
    self.goalradius = 80;
    self.ignoreme = 1;
    self.ignoresuppression = 1;
    self.oldinterval = self.interval;
    self.interval = 0;

    while ( isdefined( var_3 ) )
    {
        self setgoalnode( var_3 );

        if ( isdefined( var_3.radius ) && var_3.radius > 0 )
            self.goalradius = var_3.radius;
        else
            self.goalradius = 80;

        self waittill( "goal" );
        var_6 = common_scripts\utility::getstruct( var_3.targetname, "target" );

        if ( isdefined( var_6 ) )
        {
            var_7 = getent( var_6.targetname, "target" );

            if ( !common_scripts\utility::flag( var_7.script_flag ) )
            {
                common_scripts\utility::flag_wait( var_7.script_flag );

                if ( var_7.script_flag == "escape_moveup1" )
                    wait(var_5);
            }
        }

        if ( isdefined( var_3.target ) )
        {
            var_3 = getnode( var_3.target, "targetname" );
            continue;
        }

        var_3 = undefined;
    }
}

escape_waterlevel()
{
    level waittill( "escape_show_waterlevel" );
    maps\_utility::geo_on();
    var_0 = self.path;
    self show();
    self moveto( var_0.origin, 0.5 );
    self rotateto( var_0.angles, 0.5 );
    wait 0.5;
    self notify( "show" );
    level._sea_org waittill( "tilt_20_degrees" );
    var_0 = common_scripts\utility::getstruct( var_0.target, "targetname" );
    self moveto( var_0.origin, level._sea_org.time, level._sea_org.acctime, level._sea_org.dectime );
    self rotateto( var_0.angles, level._sea_org.time, level._sea_org.acctime, level._sea_org.dectime );
    level._sea_org waittill( "tilt_30_degrees" );
    var_0 = common_scripts\utility::getstruct( var_0.target, "targetname" );
    self moveto( var_0.origin, level._sea_org.time, level._sea_org.acctime, level._sea_org.dectime );
    self rotateto( var_0.angles, level._sea_org.time, level._sea_org.acctime, level._sea_org.dectime );
}

escape_tilt_gravity( var_0 )
{
    level endon( "stop_escape_tilt_gravity" );

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
        var_2 = maps\_utility::vector_multiply( anglestoup( level._sea_org.angles ), -1 );
        var_3 = maps\_utility::vector_multiply( anglestoright( level._sea_org.angles ), 0.25 );
        var_4 = var_2 + var_3;
        setphysicsgravitydir( var_4 );
    }
}

escape_tiltboat()
{
    var_0 = [];
    var_0["stage_0"] = -8;
    var_0["stage_1"] = -16;
    var_0["stage_2"] = -26;
    var_0["stage_3"] = -23;
    var_0["stage_4"] = -33;
    var_0["stage_5"] = -30;
    common_scripts\utility::flag_wait( "start_sinking_boat" );
    setsaveddvar( "phys_gravityChangeWakeupRadius", 1600 );
    var_1 = getentarray( "boat_sway", "script_noteworthy" );

    for ( var_2 = 0; var_2 < var_1.size; var_2++ )
        var_1[var_2].link.setscale = 1.0;

    level waittill( "escape_show_waterlevel" );
    thread escape_tilt_gravity();
    level._sea_org.time = 1;
    level._sea_org.rotation = ( 0, 0, var_0["stage_0"] );

    if ( level._sea_org.sway == "sway2" )
    {
        level._sea_org.sway = "sway1";
        level._sea_org notify( "sway1" );
        wait 0.05;
    }

    level._sea_org.sway = "sway2";
    level._sea_org notify( "sway2" );
    level._sea_link rotateto( level._sea_org.rotation, level._sea_org.time, 1, 0 );
    level._sea_org rotateto( level._sea_org.rotation, level._sea_org.time, 1, 0 );
    wait(level._sea_org.time);
    level notify( "stop_escape_tilt_gravity" );
    level waittill( "escape_unlink_player" );
    thread escape_tilt_gravity();
    level._sea_org.time = 3.5;
    level._sea_org.acctime = 0;
    level._sea_org.dectime = 1.75;
    level._sea_org.rotation = ( 0, 0, var_0["stage_1"] );
    level._sea_org notify( "tilt_20_degrees" );
    level._sea_org.sway = "sway1";
    level._sea_org notify( "sway1" );
    level._sea_link rotateto( level._sea_org.rotation, level._sea_org.time, level._sea_org.acctime, level._sea_org.dectime );
    level._sea_org rotateto( level._sea_org.rotation, level._sea_org.time, level._sea_org.acctime, level._sea_org.dectime );
    wait(level._sea_org.time);
    level notify( "stop_escape_tilt_gravity" );
    common_scripts\utility::flag_wait( "escape_tilt_30" );
    thread escape_tilt_gravity( -40 );
    level._sea_org.time = 3.5;
    level._sea_org.acctime = 1.75;
    level._sea_org.dectime = 1.75;
    level._sea_org.rotation = ( 0, 0, var_0["stage_2"] );
    level._sea_org notify( "tilt_30_degrees" );
    level._sea_org.sway = "sway2";
    level._sea_org notify( "sway2" );
    level._sea_link rotateto( level._sea_org.rotation, level._sea_org.time, level._sea_org.acctime, level._sea_org.dectime );
    level._sea_org rotateto( level._sea_org.rotation, level._sea_org.time, level._sea_org.acctime, level._sea_org.dectime );
    wait(level._sea_org.time);
    level._sea_org.time = 1;
    level._sea_org.acctime = level._sea_org.time * 0.5;
    level._sea_org.dectime = level._sea_org.time * 0.5;
    level._sea_org.rotation = ( 0, 0, var_0["stage_3"] );
    level._sea_link rotateto( level._sea_org.rotation, level._sea_org.time, level._sea_org.acctime, level._sea_org.dectime );
    level._sea_org rotateto( level._sea_org.rotation, level._sea_org.time, level._sea_org.acctime, level._sea_org.dectime );
    wait(level._sea_org.time);
    level notify( "stop_escape_tilt_gravity" );
    common_scripts\utility::flag_wait( "escape_cargohold1_enter" );
    thread escape_tilt_gravity();
    level._sea_org.time = 3.5;
    level._sea_org.acctime = 1.75;
    level._sea_org.dectime = 1.75;
    level._sea_org.rotation = ( 0, 0, var_0["stage_4"] );
    level._sea_org notify( "tilt_40_degrees" );
    level._sea_org.sway = "sway1";
    level._sea_org notify( "sway1" );
    level._sea_link rotateto( level._sea_org.rotation, level._sea_org.time, level._sea_org.acctime, level._sea_org.dectime );
    level._sea_org rotateto( level._sea_org.rotation, level._sea_org.time, level._sea_org.acctime, level._sea_org.dectime );
    wait(level._sea_org.time);
    level._sea_org.time = 1;
    level._sea_org.acctime = level._sea_org.time * 0.5;
    level._sea_org.dectime = level._sea_org.time * 0.5;
    level._sea_org.rotation = ( 0, 0, var_0["stage_5"] );
    level._sea_link rotateto( level._sea_org.rotation, level._sea_org.time, level._sea_org.acctime, level._sea_org.dectime );
    level._sea_org rotateto( level._sea_org.rotation, level._sea_org.time, level._sea_org.acctime, level._sea_org.dectime );
    wait(level._sea_org.time);
    level notify( "stop_escape_tilt_gravity" );
    level._sea_link movez( -300, 1, 0.5, 0.5 );
    level._sea_org movez( -300, 1, 0.5, 0.5 );
    common_scripts\utility::flag_wait( "escape_hallway_lower_enter" );
    wait 0.5;
    var_3 = maps\_utility::vector_multiply( anglestoup( level._sea_org.angles ), -1 );
    setphysicsgravitydir( var_3 );
    setsaveddvar( "phys_gravityChangeWakeupRadius", 1000 );
}

escape_fx_setup()
{
    var_0 = maps\_utility::getfxarraybyid( "cargo_vl_red_thin" );
    var_0 = common_scripts\utility::array_combine( var_0, maps\_utility::getfxarraybyid( "cargo_vl_red_lrg" ) );
    var_0 = common_scripts\utility::array_combine( var_0, maps\_utility::getfxarraybyid( "cargo_steam" ) );
    var_0 = common_scripts\utility::array_combine( var_0, maps\_utility::getfxarraybyid( "cargo_steam_single" ) );
    var_0 = common_scripts\utility::array_combine( var_0, maps\_utility::getfxarraybyid( "cargo_steam_single_2" ) );
    var_0 = common_scripts\utility::array_combine( var_0, maps\_utility::getfxarraybyid( "cargo_steam_single_strong" ) );
    var_1 = maps\_utility::getfxarraybyid( "sparks_runner" );
    var_1 = common_scripts\utility::array_combine( var_1, maps\_utility::getfxarraybyid( "escape_waterdrips" ) );
    var_1 = common_scripts\utility::array_combine( var_1, maps\_utility::getfxarraybyid( "escape_caustics" ) );
    common_scripts\utility::flag_wait( "start_sinking_boat" );
    common_scripts\utility::array_thread( var_0, common_scripts\utility::pauseeffect );
    common_scripts\utility::flag_wait( "escape_explosion" );
    common_scripts\utility::array_thread( var_1, maps\_utility::restarteffect );
    var_2 = getentarray( "escape_pipe_hide", "targetname" );
    var_3 = getentarray( "pipe_shootable", "targetname" );
    var_4 = spawn( "script_origin", ( 0.0, 0.0, 0.0 ) );

    for ( var_5 = 0; var_5 < var_2.size; var_5++ )
    {
        var_6 = [];

        for ( var_7 = 0; var_7 < var_3.size; var_7++ )
        {
            var_4.origin = var_3[var_7].origin;

            if ( var_2[var_5] istouching( var_4 ) )
            {
                var_6[var_6.size] = var_3[var_7];
                var_3[var_7] = undefined;
            }
        }

        for ( var_8 = 0; var_8 < var_6.size; var_8++ )
            var_6[var_8] delete();

        var_3 = common_scripts\utility::array_removeundefined( var_3 );
    }

    var_4 delete();
    var_9 = getentarray( "escape_container", "targetname" );

    for ( var_5 = 0; var_5 < var_9.size; var_5++ )
    {
        var_10 = getent( var_9[var_5].target, "targetname" );
        var_10 show();
        var_9[var_5] delete();
    }

    var_11 = getentarray( "escape_container_col", "targetname" );

    for ( var_5 = 0; var_5 < var_11.size; var_5++ )
        var_11[var_5] delete();

    var_12 = [];
    var_12[var_12.size] = spawn( "script_origin", ( 520.0, 596.0, -90.0 ) );
    var_12[var_12.size] = spawn( "script_origin", ( -1376.0, 596.0, -90.0 ) );
    var_12[var_12.size] = spawn( "script_origin", ( -2640.0, 32.0, -80.0 ) );

    for ( var_5 = 0; var_5 < var_12.size; var_5++ )
        var_12[var_5] playloopsound( "emt_alarm_ship_sinking" );

    common_scripts\utility::flag_wait( "escape_hallway_lower_enter" );
    wait 1;
    var_0 = maps\_utility::getfxarraybyid( "cargo_vl_white" );
    var_0 = common_scripts\utility::array_combine( var_0, maps\_utility::getfxarraybyid( "cargo_vl_white_soft" ) );
    var_0 = common_scripts\utility::array_combine( var_0, maps\_utility::getfxarraybyid( "cargo_vl_white_eql" ) );
    var_0 = common_scripts\utility::array_combine( var_0, maps\_utility::getfxarraybyid( "cargo_vl_white_eql_flare" ) );
    var_0 = common_scripts\utility::array_combine( var_0, maps\_utility::getfxarraybyid( "cargo_vl_white_sml" ) );
    var_0 = common_scripts\utility::array_combine( var_0, maps\_utility::getfxarraybyid( "cargo_vl_white_sml_a" ) );
    var_1 = maps\_utility::getfxarraybyid( "sinking_stair" );
    var_1 = common_scripts\utility::array_combine( var_1, maps\_utility::getfxarraybyid( "escape_water_drip_stairs" ) );
    var_1 = common_scripts\utility::array_combine( var_1, maps\_utility::getfxarraybyid( "escape_water_nodrip_stairs" ) );
    var_1 = common_scripts\utility::array_combine( var_1, maps\_utility::getfxarraybyid( "escape_water_side_stairs" ) );
    var_1 = common_scripts\utility::array_combine( var_1, maps\_utility::getfxarraybyid( "escape_water_gush_stairs" ) );
    common_scripts\utility::array_thread( var_0, common_scripts\utility::pauseeffect );
    common_scripts\utility::array_thread( var_1, maps\_utility::restarteffect );
    common_scripts\utility::flag_wait( "escape_hallway_lower_flag" );
    setphysicsgravitydir( ( 0.0, -0.5, -0.866025 ) );
    var_13 = ( -2804.0, -32.0, 96.0 );
    var_14 = 8;
    maps\_utility::delaythread( 0.25, ::escape_fx_setup_throw_obj, "com_soup_can", var_13, var_14 );
    maps\_utility::delaythread( 0.5, ::escape_fx_setup_throw_obj, "com_pipe_coupling_metal", var_13, var_14 );
    maps\_utility::delaythread( 0.75, ::escape_fx_setup_throw_obj, "com_pipe_4_coupling_ceramic", var_13, var_14 );
    maps\_utility::delaythread( 1, ::escape_fx_setup_throw_obj, "h1_cs_container_jug_water_gallon_b", var_13, var_14 );
    maps\_utility::delaythread( 1.25, ::escape_fx_setup_throw_obj, "com_soup_can", var_13, var_14 );
    maps\_utility::delaythread( 1.5, ::escape_fx_setup_throw_obj, "h1_cs_container_jug_water_gallon_b", var_13, var_14 );
    maps\_utility::delaythread( 1.75, ::escape_fx_setup_throw_obj, "com_soup_can", var_13, var_14 );
    maps\_utility::delaythread( 2, ::escape_fx_setup_throw_obj, "h1_cs_container_jug_water_gallon_b", var_13, var_14 );
    common_scripts\utility::flag_wait( "escape_topofstairs" );
    setphysicsgravitydir( ( 0.0, -0.5, -0.866025 ) );
    var_13 = ( -2420.0, 176.0, 110.0 );
    var_14 = 8;
    thread escape_fx_setup_throw_obj( "com_fire_extinguisher", var_13, var_14 );
    thread escape_fx_setup_throw_obj( "com_pipe_4_coupling_ceramic", var_13, var_14 );
    thread escape_fx_setup_throw_obj( "me_plastic_crate7", var_13, var_14 );
    maps\_utility::delaythread( 0.25, ::escape_fx_setup_throw_obj, "h1_cs_pan_metalpot", var_13, var_14 );
    maps\_utility::delaythread( 0.25, ::escape_fx_setup_throw_obj, "h1_cs_container_jug_water_gallon_b", var_13, var_14 );
    maps\_utility::delaythread( 0.25, ::escape_fx_setup_throw_obj, "me_plastic_crate6", var_13, var_14 );
    maps\_utility::delaythread( 0.4, ::escape_fx_setup_throw_obj, "me_plastic_crate7", var_13, var_14 );
    maps\_utility::delaythread( 0.4, ::escape_fx_setup_throw_obj, "h1_cs_pan_metal_sauce_sm", var_13, var_14 );
    maps\_utility::delaythread( 0.4, ::escape_fx_setup_throw_obj, "me_plastic_crate1", var_13, var_14 );
    maps\_utility::delaythread( 0.5, ::escape_fx_setup_throw_obj, "com_pipe_4_coupling_ceramic", var_13, var_14 );
    maps\_utility::delaythread( 0.75, ::escape_fx_setup_throw_obj, "com_fire_extinguisher", var_13, var_14 );
    maps\_utility::delaythread( 0.75, ::escape_fx_setup_throw_obj, "h1_cs_container_jug_water_gallon_b", var_13, var_14 );
    maps\_utility::delaythread( 0.75, ::escape_fx_setup_throw_obj, "me_plastic_crate1", var_13, var_14 );
    maps\_utility::delaythread( 1.25, ::escape_fx_setup_throw_obj, "com_plastic_bucket", var_13, var_14 );
    maps\_utility::delaythread( 1.25, ::escape_fx_setup_throw_obj, "h1_cs_pan_metalpot", var_13, var_14 );
    maps\_utility::delaythread( 1.5, ::escape_fx_setup_throw_obj, "com_plastic_bucket", var_13, var_14 );
    common_scripts\utility::flag_wait( "escape_hallway_upper_flag" );
    var_15 = maps\_utility::getfxarraybyid( "escape_water_gush_stairs" );
    var_15 = common_scripts\utility::array_combine( var_15, maps\_utility::getfxarraybyid( "sinking_stair" ) );
    var_15 = common_scripts\utility::array_combine( var_15, maps\_utility::getfxarraybyid( "escape_water_drip_stairs" ) );
    var_15 = common_scripts\utility::array_combine( var_15, maps\_utility::getfxarraybyid( "escape_water_nodrip_stairs" ) );
    var_15 = common_scripts\utility::array_combine( var_15, maps\_utility::getfxarraybyid( "escape_water_side_stairs" ) );
    var_15 = common_scripts\utility::array_combine( var_15, maps\_utility::getfxarraybyid( "escape_caustics" ) );
    var_16 = maps\_utility::getfxarraybyid( "cgoshp_drips_a" );
    common_scripts\utility::array_thread( var_15, common_scripts\utility::pauseeffect );
    common_scripts\utility::array_thread( var_16, common_scripts\utility::pauseeffect );
    maps\_utility::delaythread( 1, maps\_weather::lightningflash, maps\cargoship_fx::normal, maps\cargoship_fx::flash );
    maps\_utility::delaythread( 2, maps\_weather::lightningflash, maps\cargoship_fx::normal, maps\cargoship_fx::flash );
    maps\_utility::delaythread( 1, common_scripts\utility::play_sound_in_space, "elm_wave_crash_ext", ( -2304.0, -864.0, -128.0 ) );
    maps\_utility::delaythread( 1, common_scripts\_exploder::exploder, 126 );
    common_scripts\utility::flag_wait( "escape_aftdeck_flag" );
    maps\_utility::delaythread( 0.1, maps\_weather::lightningflash, maps\cargoship_fx::normal, maps\cargoship_fx::flash );
    maps\_utility::delaythread( 2, maps\_weather::lightningflash, maps\cargoship_fx::normal, maps\cargoship_fx::flash );
    maps\_utility::delaythread( 5, maps\_weather::lightningflash, maps\cargoship_fx::normal, maps\cargoship_fx::flash );
    maps\_utility::delaythread( 7, maps\_weather::lightningflash, maps\cargoship_fx::normal, maps\cargoship_fx::flash );
    maps\_utility::delaythread( 9, maps\_weather::lightningflash, maps\cargoship_fx::normal, maps\cargoship_fx::flash );
    maps\_utility::delaythread( 0.5, common_scripts\utility::play_sound_in_space, "elm_wave_crash_ext", ( -2304.0, -864.0, -128.0 ) );
    maps\_utility::delaythread( 0.5, common_scripts\_exploder::exploder, 126 );
    maps\_utility::delaythread( 1.25, common_scripts\utility::play_sound_in_space, "elm_wave_crash_ext", ( -2848.0, -800.0, -64.0 ) );
    maps\_utility::delaythread( 1.25, common_scripts\_exploder::exploder, 300 );
    maps\_utility::delaythread( 4, common_scripts\utility::play_sound_in_space, "elm_wave_crash_ext", ( -3808.0, -368.0, -64.0 ) );
    maps\_utility::delaythread( 4, common_scripts\_exploder::exploder, 302 );
}

escape_fx_setup_throw_obj( var_0, var_1, var_2, var_3 )
{
    var_4 = ( randomfloatrange( -32, 32 ), randomfloatrange( -32, 32 ), randomfloatrange( -32, 32 ) );
    var_5 = spawn( "script_model", var_1 + var_4 );
    var_5 setmodel( var_0 );
    var_4 = ( randomfloatrange( -10, 10 ), randomfloatrange( -10, 10 ), randomfloatrange( -10, 10 ) );
    var_6 = anglestoright( ( 0.0, 180.0, 0.0 ) );

    if ( !isdefined( var_3 ) )
        var_3 = randomintrange( 500, 1000 );

    var_6 = maps\_utility::vector_multiply( var_6, var_3 );
    var_5 physicslaunchclient( var_5.origin + var_4, var_6 );
}

escape_explosion()
{
    var_0 = getent( "escape_sink_start", "targetname" );
    var_0 waittill( "trigger" );
    common_scripts\utility::flag_clear( "_sea_bob" );
    common_scripts\utility::flag_set( "start_sinking_boat" );
    level._sea_org notify( "manual_override" );
    level notify( "sinking the ship" );
    level notify( "cargoship_escape_music" );
    musicstop( 0.1 );
    wait 0.2;
    soundscripts\_snd::snd_message( "aud_start_mix_scn_explosion" );
    maps\_utility::musicplaywrapper( "cargoship_end_music" );
    thread maps\_utility::flag_set_delayed( "cargoship_end_music", 93 );
    common_scripts\utility::flag_set( "escape_explosion" );
    thread escape_explosion_drops();
    earthquake( 0.3, 0.5, level.player.origin, 256 );
    var_1 = spawn( "script_model", ( 8.0, -360.0, -216.0 ) );
    var_1.angles = ( 0.0, 45.0, 0.0 );
    var_1 setmodel( "tag_origin" );
    thread common_scripts\utility::play_sound_in_space( "scn_cargo_explosion", ( 8.0, -360.0, -216.0 ) );
    playfxontag( level._effect["sinking_explosion"], var_1, "tag_origin" );
    common_scripts\_exploder::exploder( "601" );
    thread maps\cargoship_lighting::apply_lighting_pass_cargoship( "cargoship_explosion" );
    setsaveddvar( "compass", 0 );
    setsaveddvar( "ammoCounterHide", "1" );
    setsaveddvar( "hud_showStance", 0 );
    wait 0.2;
    level.player allowsprint( 0 );
    thread player_speed_set_cargoship( 185, 0.5 );
    thread escape_shellshock();
    wait 0.3;
    var_1.origin = ( 100.0, -600.0, -70.0 );
    var_1.angles = ( 0.0, -90.0, 0.0 );
    common_scripts\_exploder::exploder( "400" );
    var_1 _playloopsound( "cgo_water_breach_large_loop" );
    wait 21.5;
    level.player thread escape_quake();

    if ( level.gameskill < 2 )
        setsaveddvar( "compass", 1 );

    setsaveddvar( "hud_showStance", 1 );
    var_2 = spawn( "script_origin", ( -2808.0, -199.0, 0.0 ) );
    var_2 playloopsound( "cgo_water_stairs_large_loop" );
    soundscripts\_snd::snd_message( "aud_start_mix_escape" );
    common_scripts\utility::flag_wait( "escape_hallway_lower_enter" );
    wait 2.0;
    maps\_utility::stop_exploder( "601" );
    maps\_utility::stop_exploder( "400" );
    var_1 stoploopsound();
    waittillframeend;
    var_1 delete();
}

escape_heroes_runanim_setup()
{
    level.current_run = [];
    level.current_run["escape_cargohold2"] = [];
    level.current_run["escape_cargohold2b"] = [];
    level.current_run["escape_cargohold1"] = [];
    level.current_run["escape_hallway_lower"] = [];
    level.current_run["escape_hallway_lowerb"] = [];
    level.current_run["escape_hallway_lowerc"] = [];
    level.current_run["escape_hallway_lowerd"] = [];
    level.current_run["escape_hallway_lowere"] = [];
    level.current_run["escape_hallway_upper"] = [];
    level.current_run["escape_hallway_upperb"] = [];
    level.current_run["escape_aftdeck"] = [];
    level.current_run["escape_aftdeckb"] = [];
    level.current_run["escape_cargohold2"]["run"] = "lean_none";
    level.current_run["escape_cargohold2b"]["run"] = "lean_right";
    level.current_run["escape_cargohold1"]["run"] = "lean_right";
    level.current_run["escape_hallway_lower"]["run"] = "lean_back";
    level.current_run["escape_hallway_lowerb"]["run"] = "lean_right";
    level.current_run["escape_hallway_lowerc"]["run"] = "lean_none";
    level.current_run["escape_hallway_lowerd"]["run"] = "lean_left";
    level.current_run["escape_hallway_lowere"]["run"] = "lean_forward";
    level.current_run["escape_hallway_upper"]["run"] = "lean_left";
    level.current_run["escape_hallway_upperb"]["run"] = "lean_back";
    level.current_run["escape_aftdeck"]["run"] = "lean_right";
    level.current_run["escape_aftdeckb"]["run"] = "lean_forward";
    level.current_run["escape_cargohold2"]["sprint"] = "lean_none";
    level.current_run["escape_cargohold2b"]["sprint"] = "lean_right";
    level.current_run["escape_cargohold1"]["sprint"] = "lean_right";
    level.current_run["escape_hallway_lower"]["sprint"] = "lean_back";
    level.current_run["escape_hallway_lowerb"]["sprint"] = "lean_right";
    level.current_run["escape_hallway_lowerc"]["sprint"] = "lean_none";
    level.current_run["escape_hallway_lowerd"]["sprint"] = "lean_left";
    level.current_run["escape_hallway_lowere"]["sprint"] = "lean_forward";
    level.current_run["escape_hallway_upper"]["sprint"] = "lean_left";
    level.current_run["escape_hallway_upperb"]["sprint"] = "lean_back";
    level.current_run["escape_aftdeck"]["sprint"] = "lean_right";
    level.current_run["escape_aftdeckb"]["sprint"] = "lean_forward";
    level.current_run["escape_cargohold2"]["jog"] = "lean_none_jog";
    level.current_run["escape_cargohold2b"]["jog"] = "lean_right_jog";
    level.current_run["escape_cargohold1"]["jog"] = "lean_right_jog";
    level.current_run["escape_hallway_lower"]["jog"] = "lean_back_jog";
    level.current_run["escape_hallway_lowerb"]["jog"] = "lean_right_jog";
    level.current_run["escape_hallway_lowerc"]["jog"] = "lean_none_jog";
    level.current_run["escape_hallway_lowerd"]["jog"] = "lean_left_jog";
    level.current_run["escape_hallway_lowere"]["jog"] = "lean_forward_jog";
    level.current_run["escape_hallway_upper"]["jog"] = "lean_left_jog";
    level.current_run["escape_hallway_upperb"]["jog"] = "lean_back_jog";
    level.current_run["escape_aftdeck"]["jog"] = "lean_right_jog";
    level.current_run["escape_aftdeckb"]["jog"] = "lean_forward_jog";
}

escape_hallways_lower_flood()
{
    thread escape_hallways_lower_flood_vfx( "escape_hallway_lower_flag", ( -2985.0, -401.0, 15.0 ), ( 300.0, -90.0, 0.0 ), "escape_hallway_upper_flag", 0.0, 404 );
    thread escape_hallways_lower_flood_vfx( "escape_hallway_lower_flag", ( -2434.0, 117.0, 197.0 ), ( 300.0, 90.0, 0.0 ), "escape_aftdeck_flag", 2.5, 405 );
    common_scripts\utility::flag_wait( "escape_hallway_lower_enter" );
    common_scripts\utility::flag_wait_or_timeout( "escape_hallway_lower_flood_save", level.escape_timer["escape_hallway_lower_flood_save"] + level.timer_grace_period );

    if ( common_scripts\utility::flag( "escape_hallway_lower_flood_save" ) )
        common_scripts\utility::flag_wait_or_timeout( "escape_hallway_lower_flood", 3 );

    if ( common_scripts\utility::flag( "escape_hallway_lower_flood" ) )
        wait 0.5;

    wait 1;

    if ( !common_scripts\utility::flag( "escape_hallway_lower_flood" ) )
        thread escape_mission_failed();

    common_scripts\utility::flag_wait( "escape_hallway_upper_flag" );
    wait 1;
}

escape_hallways_lower_flood_vfx( var_0, var_1, var_2, var_3, var_4, var_5 )
{
    common_scripts\utility::flag_wait( var_0 );
    wait(var_4);
    var_6 = spawn( "script_model", var_1 );
    var_6.angles = var_2;
    var_6 setmodel( "tag_origin" );
    var_6 hide();
    var_6 playsound( "h1_cgo_escape_water_breach_explosion" );
    common_scripts\_exploder::exploder( var_5 );
    var_6 _playloopsound( "cgo_water_breach_large_loop" );
    common_scripts\utility::flag_wait( var_3 );
    maps\_utility::stop_exploder( var_5 );
    var_6 stoploopsound();
    waittillframeend;
    var_6 delete();
}

_playloopsound( var_0 )
{
    thread _playloopsound_proc( var_0 );
}

_playloopsound_proc( var_0 )
{
    wait 0.5;

    if ( !isdefined( self ) )
        return;

    var_1 = spawn( "script_origin", self.origin );
    var_1 playloopsound( var_0 );
    self waittill( "death" );
    var_1 stoploopsound();
    waittillframeend;
    var_1 delete();
}

escape_invisible_timer()
{
    level.timer_grace_period = undefined;

    switch ( level.gameskill )
    {
        case 0:
            level.timer_grace_period = 6;
            break;
        case 1:
            level.timer_grace_period = 2.5;
            break;
        case 2:
            level.timer_grace_period = 1.25;
            break;
        case 3:
            level.timer_grace_period = 0.5;
            break;
    }

    thread escape_handle_wrongway();
    level.escape_timer = [];
    level.escape_timer["escape_cargohold1_enter"] = 20;
    level.escape_timer["escape_catwalk_madeit"] = 12;
    level.escape_timer["escape_hallway_lower_flood_save"] = 15;
    level.escape_timer["escape_aftdeck_flag"] = 10;
    level.escape_timer["end_no_jump"] = 12.5;

    if ( getdvar( "no_escape" ) == "1" )
    {
        level.escape_timer = [];
        level.escape_timer["escape_cargohold1_enter"] = 9999;
        level.escape_timer["escape_catwalk_madeit"] = 9999;
        level.escape_timer["escape_hallway_lower_flood_save"] = 9999;
        level.escape_timer["escape_aftdeck_flag"] = 9999;
        level.escape_timer["end_no_jump"] = 9999;
    }

    common_scripts\utility::flag_wait( "escape_get_to_catwalks" );
    escape_timer_section( "escape_cargohold1_enter" );
    thread maps\_utility::flag_set_delayed( "escape_death_cargohold1", level.escape_timer["escape_catwalk_madeit"] - 2.5 + level.timer_grace_period );
    escape_timer_section( "escape_catwalk_madeit" );
    escape_timer_section( "escape_hallway_lower_flood_save" );
    escape_timer_section( "escape_aftdeck_flag" );
    escape_timer_section( "end_no_jump" );
}

escape_timer_section( var_0 )
{
    if ( common_scripts\utility::flag( var_0 ) )
        return;

    level endon( var_0 );
    level endon( "mission_failed" );
    wait(level.escape_timer[var_0] + level.timer_grace_period);

    if ( !common_scripts\utility::flag( var_0 ) )
        thread escape_mission_failed();
}

escape_autosaves()
{
    level endon( "mission_failed" );
    var_0 = undefined;
    var_1 = getentarray( "escape_flags", "script_noteworthy" );

    for ( var_2 = 0; var_2 < var_1.size; var_2++ )
    {
        if ( !isdefined( var_1[var_2].script_flag ) )
            continue;

        if ( var_1[var_2].script_flag == "escape_seaknight_flag" )
        {
            var_0 = var_1[var_2];
            break;
        }
    }

    common_scripts\utility::flag_wait( "escape_get_to_catwalks" );
    wait 0.5;
    maps\_utility::delaythread( 0.5, maps\_utility::autosave_now );
    var_0 common_scripts\utility::trigger_off();
    common_scripts\utility::flag_wait( "escape_catwalk_madeit" );
    wait 0.5;
    maps\_utility::autosave_now();
    common_scripts\utility::flag_wait( "escape_hallway_lower_flood_save" );
    wait 0.1;
    maps\_utility::autosave_now();
    common_scripts\utility::flag_wait( "escape_aftdeck_flag" );
    maps\_utility::autosave_now();
    var_0 common_scripts\utility::trigger_on();
    common_scripts\utility::flag_wait( "player_rescued" );
    maps\_utility::autosave_now();
}

escape_mission_failed()
{
    if ( common_scripts\utility::flag( "end_start_player_anim" ) )
        return;

    level notify( "mission_failed" );
    setdvar( "ui_deadquote", level.missionfailedquote["escape"] );
    maps\_utility::missionfailedwrapper();
}

end_handle_player_fall()
{
    common_scripts\utility::flag_wait( "escape_aftdeck_flag" );
    var_0 = getent( "end_player_clip", "targetname" );
    var_0 delete();
    level endon( "end_start_player_anim" );
    var_1 = getent( "end_player_fall", "targetname" );
    var_1 waittill( "trigger" );

    if ( getdvar( "cargoship_jump" ) == "" )
        setdvar( "cargoship_jump", "1" );

    switch ( int( getdvar( "cargoship_jump" ) ) )
    {
        case 1:
            level.missionfailedquote["escape"] = level.missionfailedquote["jump1"];
            setdvar( "cargoship_jump", "2" );
            break;
        default:
            level.missionfailedquote["escape"] = level.missionfailedquote["jump"];
            break;
    }

    escape_mission_failed();
}

escape_handle_wrongway()
{
    if ( getdvar( "no_escape" ) == "1" )
        return;

    common_scripts\utility::flag_wait( "escape_explosion" );
    common_scripts\utility::array_thread( getentarray( "end_wrongway_kill", "targetname" ), ::escape_handle_wrongway_kill );
    var_0 = getent( "end_wrongway", "targetname" );

    for (;;)
    {
        var_0 waittill( "trigger" );
        level.missionfailedquote["escape"] = level.missionfailedquote["wrongway"];

        while ( level.player istouching( var_0 ) )
            wait 0.1;

        level.missionfailedquote["escape"] = level.missionfailedquote["slow"];
    }
}

escape_handle_wrongway_kill()
{
    self waittill( "trigger" );
    level.missionfailedquote["escape"] = level.missionfailedquote["wrongway"];
    escape_mission_failed();
}

water_stuff_for_art1( var_0 )
{
    var_1 = "cargoship_water_hole";
    var_2 = "cargoship_water";
    var_3 = 0;
    var_4 = ( 0.0, 0.0, 1000.0 );

    if ( isdefined( var_0 ) )
    {
        var_1 = "cargoship_water_black_static";
        var_2 = "cargoship_water_static";
        var_3 = 1;
    }

    var_5 = getent( "sea_black", "targetname" );
    var_6 = var_5 getorigin();
    var_5 delete();
    var_5 = spawn( "script_model", var_6 );
    var_5 setmodel( var_1 );
    var_5 overridelightingorigin( var_4 );
    var_5.targetname = "sea_black";

    if ( var_3 )
        level.sea_black = var_5;

    var_5 = getent( "sea_foam", "targetname" );
    var_5 delete();
    var_5 = spawn( "script_model", var_6 );
    var_5 setmodel( var_2 );
    var_5 overridelightingorigin( var_4 );
    var_5.targetname = "sea_foam";

    if ( var_3 )
        level.sea_foam = var_5;

    if ( var_3 )
    {
        level.sea_black hide();
        level.sea_black.angles = level._sea_link.angles;
        level.sea_black linkto( level._sea_link );
        level.sea_foam hide();
        level.sea_foam.angles = level._sea_link.angles;
        level.sea_foam linkto( level._sea_link );
    }
}

water_stuff_for_art2( var_0 )
{
    wait(var_0);
    level.sea_foam thread maps\_sea::sea_animate();
    level.sea_black thread maps\_sea::sea_animate();
}

centerlinethread( var_0, var_1, var_2 )
{
    level notify( "new_introscreen_element" );

    if ( !isdefined( level.intro_offset ) )
        level.intro_offset = 0;
    else
        level.intro_offset++;

    var_3 = maps\_introscreen::_cornerlinethread_height();
    var_4 = newhudelem();
    var_4.x = 0;
    var_4.y = 0;
    var_4.alignx = "center";
    var_4.aligny = "middle";
    var_4.horzalign = "center";
    var_4.vertalign = "middle";
    var_4.sort = 1;
    var_4.foreground = 1;
    var_4 settext( var_0 );
    var_4.alpha = 0;
    var_4 fadeovertime( 0.2 );
    var_4.alpha = 1;
    var_4.hidewheninmenu = 1;
    var_4.fontscale = 1.6;
    var_4.color = ( 0.8, 1.0, 0.8 );
    var_4.font = "objective";
    var_4.glowcolor = ( 0.26, 0.65, 0.32 );
    var_4.glowalpha = 0.2;
    var_5 = int( var_1 * var_2 * 1000 + 3000 );
    var_4 setpulsefx( 30, var_5, 700 );
    thread maps\_introscreen::hudelem_destroy( var_4 );
}

cargoship_hack_animreach_grigsby( var_0, var_1, var_2, var_3, var_4 )
{
    maps\_anim::anim_reach_and_idle_solo( var_0, var_1, var_2, var_3 );
    common_scripts\utility::flag_set( var_4 );
}

cargoship_waitscriptend( var_0, var_1 )
{
    self endon( var_1 );

    while ( self.script == var_0 )
        waitframe();

    self notify( var_1 );
}

cargoship_waitanimend( var_0, var_1 )
{
    self endon( var_1 );
    animscripts\shared::donotetracks( var_0 );
    self notify( var_1 );
}

cargoship_hack_animreach_price( var_0, var_1, var_2, var_3, var_4 )
{
    var_0.scriptedarrivalent = self;
    maps\_anim::anim_reach_and_approach_solo( var_0, var_1 );
    var_0.scriptedarrivalent = undefined;

    if ( var_0.script == "cover_arrival" )
    {
        var_5 = "cover_arrival_ended";
        var_0 thread cargoship_waitscriptend( "cover_arrival", var_5 );
        var_0 thread cargoship_waitanimend( "coverArrival", var_5 );
        var_0 waittill( var_5 );
    }

    maps\_anim::anim_reach_and_idle_solo( var_0, var_1, var_2, var_3 );
    common_scripts\utility::flag_set( var_4 );
}

cargoship_breach2_setup( var_0, var_1, var_2, var_3, var_4 )
{
    maps\_anim::anim_generic_reach( var_0, var_1 );
    maps\_anim::anim_generic( var_0, var_1 );
    thread maps\_anim::anim_generic_loop( var_0, var_2, undefined, var_3 );
    common_scripts\utility::flag_set( var_4 );
}

carogship_shotgunpulla( var_0 )
{
    var_1 = "none";
    var_0 animscripts\shared::placeweaponon( var_0.weapon, var_1 );
    var_0 playsound( "scn_cargo_hallway_breaching_gaz_foley" );
}

carogship_shotgunpullb( var_0 )
{
    var_0.lastweapon = var_0.weapon;
    var_0 animscripts\shared::placeweaponon( var_0.secondaryweapon, "right" );
    var_0.bulletsinclip = weaponclipsize( var_0.weapon );
}

player_noprone()
{
    for (;;)
    {
        self waittill( "trigger" );
        level.player allowprone( 0 );

        while ( level.player istouching( self ) )
            wait 0.2;

        level.player allowprone( 1 );
    }
}

nadehint()
{
    level.player endon( "kill_nade_hint" );
    level.player endon( "death" );
    notifyoncommand( "kill_nade_hint", "+frag" );
    common_scripts\utility::flag_wait( "nade_hint" );
    thread keyhint( "frag", 8 );
}

crouchhint()
{
    level.player endon( "kill_crouch_hint" );
    level.player endon( "death" );
    notifyoncommand( "kill_crouch_hint", "+stance" );
    notifyoncommand( "kill_crouch_hint", "gocrouch" );
    notifyoncommand( "kill_crouch_hint", "togglecrouch" );

    if ( !level.console )
    {
        notifyoncommand( "kill_crouch_hint", "+togglecrouch" );
        notifyoncommand( "kill_crouch_hint", "+movedown" );
    }

    common_scripts\utility::flag_wait( "crouch_hint" );
    thread keyhint( "crouch", 8 );
}

standhint()
{
    level.player endon( "kill_stand_hint" );
    level.player endon( "death" );
    common_scripts\utility::flag_wait( "crouch_hint" );
    maps\_utility::delaythread( 2, ::standhint_kill );
    common_scripts\utility::flag_wait( "stand_hint" );

    while ( level.player getstance() == "stand" )
        return;

    thread keyhint( "stand", 8 );
}

standhint_kill()
{
    level endon( "stand_hint" );

    while ( level.player getstance() != "crouch" )
        wait 0.05;

    while ( level.player getstance() != "stand" )
        wait 0.05;

    level.player notify( "kill_stand_hint" );
}

hint_setup()
{
    if ( maps\_utility::arcademode() )
        return;

    maps\_utility::set_console_status();
    level.actionbinds = [];
    registeractionbinding( "frag", "+frag", &"CARGOSHIP_HINT_FRAG" );
    registeractionbinding( "crouch", "+stance", &"CARGOSHIP_HINT_CROUCH_STANCE" );

    if ( !level.console )
    {
        registeractionbinding( "crouch", "+togglecrouch", &"PLATFORM_HINT_CROUCH_TOGGLE_COVER_PC" );
        registeractionbinding( "crouch", "+movedown", &"PLATFORM_HINT_HOLD_CROUCH_COVER" );
    }

    registeractionbinding( "crouch", "gocrouch", &"CARGOSHIP_HINT_CROUCH" );
    registeractionbinding( "crouch", "togglecrouch", &"CARGOSHIP_HINT_CROUCH_TOGGLE" );
    registeractionbinding( "stand", "+gostand", &"CARGOSHIP_HINT_STAND" );
    registeractionbinding( "stand", "+stance", &"CARGOSHIP_HINT_STAND_STANCE" );
    initkeys();
    updatekeysforbindings();
    thread nadehint();
    thread crouchhint();
    thread standhint();
}

keyhint( var_0, var_1 )
{
    if ( getdvar( "chaplincheat" ) == "1" )
        return;

    if ( getdvar( "limited_mode" ) == "1" )
        return;

    clear_hints();
    level endon( "clearing_hints" );
    var_2 = getactionbind( var_0 );
    maps\_utility::hint( var_2.hint );
    var_3 = "did_action_" + var_0;

    for ( var_4 = 0; var_4 < level.actionbinds[var_0].size; var_4++ )
    {
        var_2 = level.actionbinds[var_0][var_4];
        notifyoncommand( var_3, var_2.binding );
    }

    if ( isdefined( var_1 ) )
        level.player thread notifyontimeout( var_3, var_1 );

    level.player waittill( var_3 );
    maps\_utility::hint_fade( 0.5 );
}

clear_hints()
{
    maps\_utility::hint_fade( 0 );
    level notify( "clearing_hints" );
}

getactionbind( var_0 )
{
    for ( var_1 = 0; var_1 < level.actionbinds[var_0].size; var_1++ )
    {
        var_2 = level.actionbinds[var_0][var_1];
        var_3 = getkeybinding( var_2.binding );

        if ( !var_3["count"] )
            continue;

        return level.actionbinds[var_0][var_1];
    }

    return level.actionbinds[var_0][0];
}

notifyontimeout( var_0, var_1 )
{
    self endon( var_0 );
    wait(var_1);
    self notify( var_0 );
}

registeractionbinding( var_0, var_1, var_2 )
{
    if ( !isdefined( level.actionbinds[var_0] ) )
        level.actionbinds[var_0] = [];

    var_3 = spawnstruct();
    var_3.binding = var_1;
    var_3.hint = var_2;
    var_3.keytext = undefined;
    var_3.hinttext = undefined;
    precachestring( var_2 );
    level.actionbinds[var_0][level.actionbinds[var_0].size] = var_3;
}

initkeys()
{
    level.kbkeys = "1234567890-=qwertyuiop[]asdfghjkl;'zxcvbnm,./";
    level.specialkeys = [];
    level.specialkeys[level.specialkeys.size] = "TAB";
    level.specialkeys[level.specialkeys.size] = "ENTER";
    level.specialkeys[level.specialkeys.size] = "ESCAPE";
    level.specialkeys[level.specialkeys.size] = "SPACE";
    level.specialkeys[level.specialkeys.size] = "BACKSPACE";
    level.specialkeys[level.specialkeys.size] = "UPARROW";
    level.specialkeys[level.specialkeys.size] = "DOWNARROW";
    level.specialkeys[level.specialkeys.size] = "LEFTARROW";
    level.specialkeys[level.specialkeys.size] = "RIGHTARROW";
    level.specialkeys[level.specialkeys.size] = "ALT";
    level.specialkeys[level.specialkeys.size] = "CTRL";
    level.specialkeys[level.specialkeys.size] = "SHIFT";
    level.specialkeys[level.specialkeys.size] = "CAPSLOCK";
    level.specialkeys[level.specialkeys.size] = "F1";
    level.specialkeys[level.specialkeys.size] = "F2";
    level.specialkeys[level.specialkeys.size] = "F3";
    level.specialkeys[level.specialkeys.size] = "F4";
    level.specialkeys[level.specialkeys.size] = "F5";
    level.specialkeys[level.specialkeys.size] = "F6";
    level.specialkeys[level.specialkeys.size] = "F7";
    level.specialkeys[level.specialkeys.size] = "F8";
    level.specialkeys[level.specialkeys.size] = "F9";
    level.specialkeys[level.specialkeys.size] = "F10";
    level.specialkeys[level.specialkeys.size] = "F11";
    level.specialkeys[level.specialkeys.size] = "F12";
    level.specialkeys[level.specialkeys.size] = "INS";
    level.specialkeys[level.specialkeys.size] = "DEL";
    level.specialkeys[level.specialkeys.size] = "PGDN";
    level.specialkeys[level.specialkeys.size] = "PGUP";
    level.specialkeys[level.specialkeys.size] = "HOME";
    level.specialkeys[level.specialkeys.size] = "END";
    level.specialkeys[level.specialkeys.size] = "MOUSE1";
    level.specialkeys[level.specialkeys.size] = "MOUSE2";
    level.specialkeys[level.specialkeys.size] = "MOUSE3";
    level.specialkeys[level.specialkeys.size] = "MOUSE4";
    level.specialkeys[level.specialkeys.size] = "MOUSE5";
    level.specialkeys[level.specialkeys.size] = "MWHEELUP";
    level.specialkeys[level.specialkeys.size] = "MWHEELDOWN";
    level.specialkeys[level.specialkeys.size] = "AUX1";
    level.specialkeys[level.specialkeys.size] = "AUX2";
    level.specialkeys[level.specialkeys.size] = "AUX3";
    level.specialkeys[level.specialkeys.size] = "AUX4";
    level.specialkeys[level.specialkeys.size] = "AUX5";
    level.specialkeys[level.specialkeys.size] = "AUX6";
    level.specialkeys[level.specialkeys.size] = "AUX7";
    level.specialkeys[level.specialkeys.size] = "AUX8";
    level.specialkeys[level.specialkeys.size] = "AUX9";
    level.specialkeys[level.specialkeys.size] = "AUX10";
    level.specialkeys[level.specialkeys.size] = "AUX11";
    level.specialkeys[level.specialkeys.size] = "AUX12";
    level.specialkeys[level.specialkeys.size] = "AUX13";
    level.specialkeys[level.specialkeys.size] = "AUX14";
    level.specialkeys[level.specialkeys.size] = "AUX15";
    level.specialkeys[level.specialkeys.size] = "AUX16";
    level.specialkeys[level.specialkeys.size] = "KP_HOME";
    level.specialkeys[level.specialkeys.size] = "KP_UPARROW";
    level.specialkeys[level.specialkeys.size] = "KP_PGUP";
    level.specialkeys[level.specialkeys.size] = "KP_LEFTARROW";
    level.specialkeys[level.specialkeys.size] = "KP_5";
    level.specialkeys[level.specialkeys.size] = "KP_RIGHTARROW";
    level.specialkeys[level.specialkeys.size] = "KP_END";
    level.specialkeys[level.specialkeys.size] = "KP_DOWNARROW";
    level.specialkeys[level.specialkeys.size] = "KP_PGDN";
    level.specialkeys[level.specialkeys.size] = "KP_ENTER";
    level.specialkeys[level.specialkeys.size] = "KP_INS";
    level.specialkeys[level.specialkeys.size] = "KP_DEL";
    level.specialkeys[level.specialkeys.size] = "KP_SLASH";
    level.specialkeys[level.specialkeys.size] = "KP_MINUS";
    level.specialkeys[level.specialkeys.size] = "KP_PLUS";
    level.specialkeys[level.specialkeys.size] = "KP_NUMLOCK";
    level.specialkeys[level.specialkeys.size] = "KP_STAR";
    level.specialkeys[level.specialkeys.size] = "KP_EQUALS";
    level.specialkeys[level.specialkeys.size] = "PAUSE";
    level.specialkeys[level.specialkeys.size] = "SEMICOLON";
    level.specialkeys[level.specialkeys.size] = "COMMAND";
    level.specialkeys[level.specialkeys.size] = "181";
    level.specialkeys[level.specialkeys.size] = "191";
    level.specialkeys[level.specialkeys.size] = "223";
    level.specialkeys[level.specialkeys.size] = "224";
    level.specialkeys[level.specialkeys.size] = "225";
    level.specialkeys[level.specialkeys.size] = "228";
    level.specialkeys[level.specialkeys.size] = "229";
    level.specialkeys[level.specialkeys.size] = "230";
    level.specialkeys[level.specialkeys.size] = "231";
    level.specialkeys[level.specialkeys.size] = "232";
    level.specialkeys[level.specialkeys.size] = "233";
    level.specialkeys[level.specialkeys.size] = "236";
    level.specialkeys[level.specialkeys.size] = "241";
    level.specialkeys[level.specialkeys.size] = "242";
    level.specialkeys[level.specialkeys.size] = "243";
    level.specialkeys[level.specialkeys.size] = "246";
    level.specialkeys[level.specialkeys.size] = "248";
    level.specialkeys[level.specialkeys.size] = "249";
    level.specialkeys[level.specialkeys.size] = "250";
    level.specialkeys[level.specialkeys.size] = "252";
}

updatekeysforbindings()
{
    if ( level.console )
    {
        setkeyforbinding( getcommandfromkey( "BUTTON_START" ), "BUTTON_START" );
        setkeyforbinding( getcommandfromkey( "BUTTON_A" ), "BUTTON_A" );
        setkeyforbinding( getcommandfromkey( "BUTTON_B" ), "BUTTON_B" );
        setkeyforbinding( getcommandfromkey( "BUTTON_X" ), "BUTTON_X" );
        setkeyforbinding( getcommandfromkey( "BUTTON_Y" ), "BUTTON_Y" );
        setkeyforbinding( getcommandfromkey( "BUTTON_LSTICK" ), "BUTTON_LSTICK" );
        setkeyforbinding( getcommandfromkey( "BUTTON_RSTICK" ), "BUTTON_RSTICK" );
        setkeyforbinding( getcommandfromkey( "BUTTON_LSHLDR" ), "BUTTON_LSHLDR" );
        setkeyforbinding( getcommandfromkey( "BUTTON_RSHLDR" ), "BUTTON_RSHLDR" );
        setkeyforbinding( getcommandfromkey( "BUTTON_LTRIG" ), "BUTTON_LTRIG" );
        setkeyforbinding( getcommandfromkey( "BUTTON_RTRIG" ), "BUTTON_RTRIG" );
    }
    else
    {
        for ( var_0 = 0; var_0 < level.kbkeys.size; var_0++ )
            setkeyforbinding( getcommandfromkey( level.kbkeys[var_0] ), level.kbkeys[var_0] );

        for ( var_0 = 0; var_0 < level.specialkeys.size; var_0++ )
            setkeyforbinding( getcommandfromkey( level.specialkeys[var_0] ), level.specialkeys[var_0] );
    }
}

setkeyforbinding( var_0, var_1 )
{
    if ( var_0 == "" )
        return;

    var_2 = getarraykeys( level.actionbinds );

    for ( var_3 = 0; var_3 < var_2.size; var_3++ )
    {
        var_4 = level.actionbinds[var_2[var_3]];

        for ( var_5 = 0; var_5 < var_4.size; var_5++ )
        {
            if ( var_4[var_5].binding != var_0 )
                continue;

            var_4[var_5].key = var_1;
        }
    }
}

orient_cameraviewangles_helicopterstart()
{
    level.player lerpviewangleclamp( 0, 0, 0, -9, 9, -5, 5 );
    wait 0.05;
    level.player lerpviewangleclamp( 0, 0, 0, 65, 74, 30, 35 );
}

deck_light_shadow_hack()
{
    var_0 = getent( "deck_light_hack", "script_noteworthy" );

    for (;;)
    {
        common_scripts\utility::flag_wait( "deck_light_shadow" );
        var_0 setlightshadowstate( "force_fully_on" );
        common_scripts\utility::flag_waitopen( "deck_light_shadow" );
        var_0 setlightshadowstate( "normal" );
    }
}
