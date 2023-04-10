// H1 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

minigun_player_anims()
{
    level.minigun_node = getent( "minigun_anim_node", "targetname" );
    maps\_anim::anim_first_frame_solo( self, "use" );

    for (;;)
    {
        self waittill( "turretownerchange" );
        minigun_player_use();
        self waittill( "turretownerchange" );
        minigun_player_drop();
    }
}

minigun_player_use()
{
    level.player allowprone( 0 );
    level.player allowcrouch( 1 );
    level.player allowstand( 0 );
    level.player disableweapons();
    level.player enablephysicaldepthoffieldscripting();
    level.player setphysicaldepthoffield( 12.0, 500, 1.0, 1.0 );
    level.eplayerview = maps\_utility::spawn_anim_model( "minigun_player", level.minigun_node.origin, level.minigun_node.angles );
    level.eplayerview hide();
    level.minigun_node maps\_anim::anim_first_frame_solo( level.eplayerview, "use_minigun" );
    level.player playerlinktodeltablendviewangle( level.eplayerview, "tag_player", 1, 0.7, 0, 0.4, 0, 0, 0, 0, 1 );
    level.minigun_previous_fov = getturretfov();
    level.player lerpfov( 55, 0.5 );
    wait 0.3;
    level.eplayerview show();
    maps\_anim::anim_first_frame_solo( self, "use" );
    thread maps\_anim::anim_single_solo( self, "use" );
    level.minigun_node maps\_anim::anim_single_solo( level.eplayerview, "use_minigun" );
    level.eplayerview hide();
    level.player unlink();
    level.minigun_eye_height = level.player getplayerviewheight();
    level.player setgravityoverride( 0 );
    self _meth_856C();
}

minigun_player_drop()
{
    var_0 = self gettagorigin( "tag_flash" );
    var_1 = self gettagangles( "tag_flash" );
    var_2 = anglestoaxis( var_1 );
    var_3 = level.player geteye();
    var_4 = level.player getplayerviewheight();
    var_5 = var_3 - var_0;
    var_6 = ( vectordot( var_5, var_2["forward"] ), vectordot( var_5, var_2["right"] ), vectordot( var_5, var_2["up"] ) );
    var_6 -= ( 0, 0, level.minigun_eye_height );
    level.eplayerview linkto( self, "tag_flash", var_6, ( 0.0, 0.0, 0.0 ) );
    level.player playerlinktoabsolute( level.eplayerview, undefined );
    waitframe();
    self _meth_856D();
    self waittill( "turret_returned_to_default" );
    level.player resetgravityoverride();
    maps\_anim::anim_first_frame_solo( self, "drop" );
    thread maps\_anim::anim_single_solo( self, "drop" );
    level.eplayerview unlink();
    level.player enableweapons();
    var_7 = level.player getplayerangles();
    var_8 = anglestoforward( var_7 );
    var_9 = level.player.origin + ( 0.0, 0.0, 20.0 );
    var_9 -= var_8 * 20;
    var_10 = var_9 - ( 0.0, 0.0, 100.0 );
    var_11 = playerphysicstrace( var_9, var_10 );
    level.eplayerview moveto( var_11, 0.5, 0.2, 0.2 );
    level.player lerpfov( level.minigun_previous_fov, 0.5 );
    level.player disablephysicaldepthoffieldscripting();
    wait 0.5;
    level.player unlink();
    level.eplayerview delete();
    level.player allowprone( 1 );
    level.player allowcrouch( 1 );
    level.player allowstand( 1 );
}

minigun_think()
{
    common_scripts\utility::flag_init( "player_on_minigun" );
    self.animname = "minigun";
    maps\_utility::assign_animtree();
    thread minigun_console_hint();
    thread minigun_player_anims();
    thread minigun_used();

    for (;;)
    {
        for (;;)
        {
            if ( isdefined( self getturretowner() ) )
                break;

            wait 0.05;
        }

        level thread overheat_enable();
        common_scripts\utility::flag_set( "player_on_minigun" );

        for (;;)
        {
            if ( !isdefined( self getturretowner() ) )
                break;

            wait 0.05;
        }

        common_scripts\utility::flag_clear( "player_on_minigun" );
        level thread overheat_disable();
        self.rumble_ent stoprumble( "minigun_rumble" );
    }
}

minigun_const()
{
    level.turret_heat_status = 1;
    level.turret_heat_max = 114;
    level.turret_cooldownrate = 15;
    level.overheat_hud_height_max = 110;
    var_0 = getent( "minigun", "targetname" );
    var_0 _meth_8569( 150 );
    var_0 setdefaultdroppitch( 0 );
    var_0 _meth_856B( 1 );
}

minigun_rumble()
{
    var_0 = 0;
    var_1 = 750;
    var_2 = var_1 - var_0;
    self.rumble_ent = spawn( "script_origin", self.origin );

    for (;;)
    {
        wait 0.05;

        if ( self.momentum <= 0 || !common_scripts\utility::flag( "player_on_minigun" ) )
            continue;

        self.rumble_ent.origin = level.player geteye() + ( 0, 0, var_1 - var_2 * self.momentum );
        self.rumble_ent playrumbleonentity( "minigun_rumble" );
    }
}

minigun_console_hint()
{
    var_0 = getent( "minigun", "targetname" );

    while ( !common_scripts\utility::flag( "minigun_lesson_learned" ) )
    {
        wait 0.05;
        var_1 = var_0 getturretowner();

        if ( isdefined( var_1 ) && level.player != var_1 || !isdefined( var_1 ) )
            continue;

        if ( isdefined( level.minigun_console_hint_displayed ) )
            continue;

        if ( level.player common_scripts\utility::is_player_gamepad_enabled() )
            level.player thread maps\_utility::display_hint( "minigun_spin_left_trigger" );
        else
            level.player thread maps\_utility::display_hint( "minigun_spin_keyboard" );

        level.minigun_console_hint_displayed = 1;
    }
}

minigun_used()
{
    common_scripts\utility::flag_wait( "player_on_minigun" );

    if ( level.console )
        var_0 = 6;
    else
        var_0 = 10;

    var_1 = 4;
    var_2 = 7;
    var_3 = 0.02;
    var_4 = 0.02;
    var_5 = 0.35;
    var_6 = 0;
    var_7 = 1 / var_0 * 20;
    var_8 = 1 / var_1 * 20;
    level.inuse = 0;
    var_9 = 0;
    self.momentum = 0;
    var_10 = 0;
    var_11 = 1;
    var_12 = 0;
    var_13 = 0;
    var_14 = undefined;
    var_15 = 0;
    var_16 = 0;
    var_17 = undefined;
    var_18 = 0;
    level.frames = 0;
    level.normframes = 0;
    var_19 = 0;
    thread minigun_rumble();

    for (;;)
    {
        level.normframes++;

        if ( common_scripts\utility::flag( "player_on_minigun" ) )
        {
            if ( !level.inuse )
            {
                if ( level.player common_scripts\utility::is_player_gamepad_enabled() )
                {
                    if ( level.player adsbuttonpressed() )
                    {
                        level.inuse = 1;
                        thread minigun_sound_spinup();
                    }
                }
                else if ( level.player attackbuttonpressed() )
                {
                    level.inuse = 1;
                    thread minigun_sound_spinup();
                }
            }
            else if ( level.player common_scripts\utility::is_player_gamepad_enabled() )
            {
                if ( !level.player adsbuttonpressed() )
                {
                    level.inuse = 0;
                    thread minigun_sound_spindown();
                }
                else if ( !level.player adsbuttonpressed() && level.player attackbuttonpressed() && var_15 )
                {
                    level.inuse = 0;
                    thread minigun_sound_spindown();
                }
            }
            else if ( !level.player attackbuttonpressed() )
            {
                level.inuse = 0;
                thread minigun_sound_spindown();
            }
            else if ( level.player attackbuttonpressed() && var_15 )
            {
                level.inuse = 0;
                thread minigun_sound_spindown();
            }

            if ( level.player common_scripts\utility::is_player_gamepad_enabled() )
            {
                if ( level.player adsbuttonpressed() )
                {
                    var_6 += 0.05;

                    if ( var_6 >= 2.75 )
                        common_scripts\utility::flag_set( "minigun_lesson_learned" );
                }
                else
                    var_6 = 0;
            }

            if ( !var_13 )
            {
                if ( level.player attackbuttonpressed() && !var_15 && var_12 )
                {
                    var_13 = 1;
                    var_17 = gettime();

                    if ( !level.player common_scripts\utility::is_player_gamepad_enabled() )
                        common_scripts\utility::flag_set( "minigun_lesson_learned" );
                }
                else if ( level.player attackbuttonpressed() && var_15 )
                {
                    var_13 = 0;
                    var_17 = undefined;
                }
            }
            else
            {
                if ( !level.player attackbuttonpressed() )
                {
                    var_13 = 0;
                    var_17 = undefined;
                }

                if ( level.player attackbuttonpressed() && !var_12 )
                {
                    var_13 = 0;
                    var_17 = undefined;
                }
            }
        }
        else
        {
            if ( var_13 || level.inuse == 1 )
                thread minigun_sound_spindown();

            var_13 = 0;
            level.inuse = 0;
        }

        if ( var_15 )
        {
            if ( !( var_10 >= var_11 ) )
            {
                var_15 = 0;
                var_17 = undefined;
                self turretfireenable();
            }
        }

        if ( level.inuse )
        {
            var_9 += var_3;
            self.momentum = var_9;
        }
        else
        {
            var_9 -= var_4;
            self.momentum = var_9;
        }

        if ( var_9 > var_11 )
        {
            var_9 = var_11;
            self.momentum = var_9;
        }

        if ( var_9 < 0 )
        {
            var_9 = 0;
            self.momentum = var_9;
            self notify( "done" );
        }

        if ( var_9 == var_11 )
        {
            var_12 = 1;
            var_14 = gettime();
            self turretfireenable();
        }
        else
        {
            var_12 = 0;
            self turretfiredisable();
        }

        if ( var_13 && !var_15 )
        {
            level.frames++;
            var_10 += var_7;
        }

        if ( gettime() > var_16 && !var_13 )
            var_10 -= var_8;

        if ( var_10 > var_11 )
            var_10 = var_11;

        if ( var_10 < 0 )
            var_10 = 0;

        level.heat = var_10;
        level.turret_heat_status = int( var_10 * 114 );

        if ( isdefined( level.overheat_status2 ) )
            thread overheat_hud_update();

        if ( var_10 >= var_11 && var_10 <= var_11 && ( var_18 < var_11 || var_18 > var_11 ) )
        {
            var_15 = 1;
            var_16 = gettime() + var_2 * 1000;
            var_19 = 0;
            thread overheat_overheated();
        }

        var_18 = var_10;

        if ( var_15 )
        {
            self turretfiredisable();
            var_13 = 0;

            if ( gettime() > var_19 )
            {
                playfxontag( common_scripts\utility::getfx( "turret_overheat_smoke" ), self, "tag_flash" );
                var_19 = gettime() + var_5 * 1000;
            }
        }

        self setanim( maps\_utility::getanim( "spin" ), 1, 0.2, var_9 );
        wait 0.05;
    }
}

minigun_sound_spinup()
{
    level notify( "stopMinigunSound" );
    level endon( "stopMinigunSound" );

    if ( self.momentum < 0.25 )
    {
        self playsound( "minigun_gatling_spinup1" );
        wait 0.6;
        self playsound( "minigun_gatling_spinup2" );
        wait 0.5;
        self playsound( "minigun_gatling_spinup3" );
        wait 0.5;
        self playsound( "minigun_gatling_spinup4" );
        wait 0.5;
    }
    else if ( self.momentum < 0.5 )
    {
        self playsound( "minigun_gatling_spinup2" );
        wait 0.5;
        self playsound( "minigun_gatling_spinup3" );
        wait 0.5;
        self playsound( "minigun_gatling_spinup4" );
        wait 0.5;
    }
    else if ( self.momentum < 0.75 )
    {
        self playsound( "minigun_gatling_spinup3" );
        wait 0.5;
        self playsound( "minigun_gatling_spinup4" );
        wait 0.5;
    }
    else if ( self.momentum < 1 )
    {
        self playsound( "minigun_gatling_spinup4" );
        wait 0.5;
    }

    thread minigun_sound_spinloop();
}

minigun_sound_spinloop()
{
    level notify( "stopMinigunSound" );
    level common_scripts\utility::play_loopsound_in_space_with_end( "minigun_gatling_spin", self.origin, "stopMinigunSound" );
}

minigun_sound_spindown()
{
    level notify( "stopMinigunSound" );
    level endon( "stopMinigunSound" );

    if ( self.momentum > 0.75 )
    {
        self stopsounds();
        self playsound( "minigun_gatling_spindown4" );
        wait 0.5;
        self playsound( "minigun_gatling_spindown3" );
        wait 0.5;
        self playsound( "minigun_gatling_spindown2" );
        wait 0.5;
        self playsound( "minigun_gatling_spindown1" );
        wait 0.65;
    }
    else if ( self.momentum > 0.5 )
    {
        self playsound( "minigun_gatling_spindown3" );
        wait 0.5;
        self playsound( "minigun_gatling_spindown2" );
        wait 0.5;
        self playsound( "minigun_gatling_spindown1" );
        wait 0.65;
    }
    else if ( self.momentum > 0.25 )
    {
        self playsound( "minigun_gatling_spindown2" );
        wait 0.5;
        self playsound( "minigun_gatling_spindown1" );
        wait 0.65;
    }
    else
    {
        self playsound( "minigun_gatling_spindown1" );
        wait 0.65;
    }
}

overheat_enable()
{
    level thread overheat_hud();
    common_scripts\utility::flag_clear( "disable_overheat" );
}

overheat_disable()
{
    common_scripts\utility::flag_set( "disable_overheat" );
    level.savehere = undefined;
    waittillframeend;

    if ( isdefined( level.overheat_bg ) )
        level.overheat_bg destroy();

    if ( isdefined( level.overheat_bg_distort ) )
        level.overheat_bg_distort destroy();

    if ( isdefined( level.overheat_icon ) )
        level.overheat_icon destroy();

    if ( isdefined( level.overheat_status ) )
        level.overheat_status destroy();

    if ( isdefined( level.overheat_status2 ) )
        level.overheat_status2 destroy();

    if ( isdefined( level.overheat_flashing ) )
        level.overheat_flashing destroy();
}

overheat_hud()
{
    level endon( "disable_overheat" );

    if ( !isdefined( level.overheat_bg ) )
    {
        level.overheat_bg = newhudelem();
        level.overheat_bg.alignx = "right";
        level.overheat_bg.aligny = "bottom";
        level.overheat_bg.horzalign = "right";
        level.overheat_bg.vertalign = "bottom";
        level.overheat_bg.x = -29;
        level.overheat_bg.y = -146;
        level.overheat_bg.alpha = 0.3;
        level.overheat_bg setshader( "h1_hud_temperature_border", 14, 114 );
        level.overheat_bg.sort = 5;
    }

    if ( !isdefined( level.overheat_bg_distort ) )
    {
        level.overheat_bg_distort = newhudelem();
        level.overheat_bg_distort.alignx = "right";
        level.overheat_bg_distort.aligny = "bottom";
        level.overheat_bg_distort.horzalign = "right";
        level.overheat_bg_distort.vertalign = "bottom";
        level.overheat_bg_distort.x = -29;
        level.overheat_bg_distort.y = -146;
        level.overheat_bg_distort.alpha = 0.9;
        level.overheat_bg_distort setshader( "h1_hud_temperature_blur", 14, 114 );
        level.overheat_bg_distort.sort = 4;
    }

    if ( !isdefined( level.overheat_icon ) )
    {
        level.overheat_icon = newhudelem();
        level.overheat_icon.alignx = "right";
        level.overheat_icon.aligny = "bottom";
        level.overheat_icon.horzalign = "right";
        level.overheat_icon.vertalign = "bottom";
        level.overheat_icon.x = -26;
        level.overheat_icon.y = -126;
        level.overheat_icon setshader( "h1_hud_temperature_icon", 28, 28 );
        level.overheat_icon.sort = 6;
    }

    var_0 = -31;
    var_1 = -149.5;

    if ( !isdefined( level.overheat_status ) )
    {
        level.overheat_status = newhudelem();
        level.overheat_status.alignx = "right";
        level.overheat_status.aligny = "bottom";
        level.overheat_status.horzalign = "right";
        level.overheat_status.vertalign = "bottom";
        level.overheat_status.x = var_0;
        level.overheat_status.y = var_1;
        level.overheat_status setshader( "white", 10, 0 );
        level.overheat_status.color = ( 1.0, 0.9, 0.0 );
        level.overheat_status.alpha = 0;
        level.overheat_status.sort = 1;
    }

    if ( !isdefined( level.overheat_status2 ) )
    {
        level.overheat_status2 = newhudelem();
        level.overheat_status2.alignx = "right";
        level.overheat_status2.aligny = "bottom";
        level.overheat_status2.horzalign = "right";
        level.overheat_status2.vertalign = "bottom";
        level.overheat_status2.x = var_0;
        level.overheat_status2.y = var_1;
        level.overheat_status2 setshader( "white", 10, 0 );
        level.overheat_status2.color = ( 1.0, 0.9, 0.0 );
        level.overheat_status2.alpha = 0;
        level.overheat_status2.sort = 2;
    }

    if ( !isdefined( level.overheat_flashing ) )
    {
        level.overheat_flashing = newhudelem();
        level.overheat_flashing.alignx = "right";
        level.overheat_flashing.aligny = "bottom";
        level.overheat_flashing.horzalign = "right";
        level.overheat_flashing.vertalign = "bottom";
        level.overheat_flashing.x = var_0;
        level.overheat_flashing.y = var_1;
        level.overheat_flashing setshader( "white", 10, level.overheat_hud_height_max );
        level.overheat_flashing.color = ( 0.8, 0.16, 0.0 );
        level.overheat_flashing.alpha = 0;
        level.overheat_flashing.sort = 3;
    }
}

overheat_overheated()
{
    level endon( "disable_overheat" );

    if ( !common_scripts\utility::flag( "disable_overheat" ) )
    {
        level.savehere = 0;
        level.player thread maps\_utility::play_sound_on_entity( "h1_wep_m134_overheat" );
        level.overheat_flashing.alpha = 1;
        level.overheat_status.alpha = 0;
        level.overheat_status2.alpha = 0;
        level notify( "stop_overheat_drain" );
        level.turret_heat_status = level.turret_heat_max;
        thread overheat_hud_update();

        for ( var_0 = 0; var_0 < 4; var_0++ )
        {
            level.overheat_flashing fadeovertime( 0.5 );
            level.overheat_flashing.alpha = 0.5;
            wait 0.5;
            level.overheat_flashing fadeovertime( 0.5 );
            level.overheat_flashing.alpha = 1.0;
        }

        level.overheat_flashing fadeovertime( 0.5 );
        level.overheat_flashing.alpha = 0.0;
        level.overheat_status.alpha = 1;
        wait 0.5;
        thread overheat_hud_drain();
        wait 2;
        level.savehere = undefined;
    }
}

overheat_hud_update()
{
    level endon( "disable_overheat" );
    level notify( "stop_overheat_drain" );

    if ( level.turret_heat_status > 1 )
        level.overheat_status.alpha = 1;
    else
    {
        level.overheat_status.alpha = 0;
        level.overheat_status fadeovertime( 0.25 );
    }

    if ( isdefined( level.overheat_status2 ) && level.turret_heat_status > 1 )
    {
        var_0 = int( level.turret_heat_status * level.overheat_hud_height_max / level.turret_heat_max );
        level.overheat_status2.alpha = 1;
        level.overheat_status2 setshader( "white", 10, int( var_0 ) );
        level.overheat_status scaleovertime( 0.05, 10, int( var_0 ) );
    }
    else
    {
        level.overheat_status2.alpha = 0;
        level.overheat_status2 fadeovertime( 0.25 );
    }

    overheat_setcolor( level.turret_heat_status );
    wait 0.05;

    if ( isdefined( level.overheat_status2 ) )
        level.overheat_status2.alpha = 0;

    if ( isdefined( level.overheat_status ) && level.turret_heat_status < level.turret_heat_max )
        thread overheat_hud_drain();
}

overheat_setcolor( var_0, var_1 )
{
    level endon( "disable_overheat" );
    var_2 = [];
    var_2[0] = 1.0;
    var_2[1] = 0.9;
    var_2[2] = 0.0;
    var_3 = [];
    var_3[0] = 1.0;
    var_3[1] = 0.5;
    var_3[2] = 0.0;
    var_4 = [];
    var_4[0] = 0.9;
    var_4[1] = 0.16;
    var_4[2] = 0.0;
    var_5 = [];
    var_5[0] = var_2[0];
    var_5[1] = var_2[1];
    var_5[2] = var_2[2];
    var_6 = 0;
    var_7 = level.turret_heat_max / 2;
    var_8 = level.turret_heat_max;
    var_9 = undefined;
    var_10 = undefined;
    var_11 = undefined;

    if ( var_0 > var_6 && var_0 <= var_7 )
    {
        var_9 = int( var_0 * 100 / var_7 );

        for ( var_12 = 0; var_12 < var_5.size; var_12++ )
        {
            var_10 = var_3[var_12] - var_2[var_12];
            var_11 = var_10 / 100;
            var_5[var_12] = var_2[var_12] + var_11 * var_9;
        }
    }
    else if ( var_0 > var_7 && var_0 <= var_8 )
    {
        var_9 = int( ( var_0 - var_7 ) * 100 / ( var_8 - var_7 ) );

        for ( var_12 = 0; var_12 < var_5.size; var_12++ )
        {
            var_10 = var_4[var_12] - var_3[var_12];
            var_11 = var_10 / 100;
            var_5[var_12] = var_3[var_12] + var_11 * var_9;
        }
    }

    if ( isdefined( var_1 ) )
        level.overheat_status fadeovertime( var_1 );

    if ( isdefined( level.overheat_status.color ) )
        level.overheat_status.color = ( var_5[0], var_5[1], var_5[2] );

    if ( isdefined( level.overheat_status2.color ) )
        level.overheat_status2.color = ( var_5[0], var_5[1], var_5[2] );
}

overheat_hud_drain()
{
    level endon( "disable_overheat" );
    level endon( "stop_overheat_drain" );
    var_0 = 1.0;

    for (;;)
    {
        if ( level.turret_heat_status > 1 )
            level.overheat_status.alpha = 1;

        var_1 = ( level.turret_heat_status - level.turret_cooldownrate ) * level.overheat_hud_height_max / level.turret_heat_max;
        thread overheat_status_rampdown( var_1, var_0 );

        if ( var_1 < 1 )
            var_1 = 1;

        overheat_setcolor( level.turret_heat_status, var_0 );
        wait(var_0);

        if ( isdefined( level.overheat_status ) && level.turret_heat_status <= 1 )
            level.overheat_status.alpha = 0;

        if ( isdefined( level.overheat_status2 ) && level.turret_heat_status <= 1 )
            level.overheat_status2.alpha = 0;
    }
}

overheat_status_rampdown( var_0, var_1 )
{
    level endon( "disable_overheat" );
    level endon( "stop_overheat_drain" );
    var_2 = 20 * var_1;
    var_3 = level.turret_heat_status - var_0;
    var_4 = var_3 / var_2;

    for ( var_5 = 0; var_5 < var_2; var_5++ )
    {
        level.turret_heat_status -= var_4;

        if ( level.turret_heat_status < 1 )
        {
            level.turret_heat_status = 1;
            return;
        }

        wait 0.05;
    }
}

seaknight()
{
    level.seaknight1 = maps\_vehicle::spawn_vehicle_from_targetname_and_drive( "rescue_chopper" );
    level.seaknight1 setmodel( "vehicle_ch46e_opened_door_interior_a" );
    var_0 = spawn( "script_model", level.seaknight1 gettagorigin( "body_animate_jnt" ) );
    var_0 setmodel( "vehicle_ch46e_opened_door_interior_b" );
    var_0.angles = level.seaknight1.angles;
    var_0 linkto( level.seaknight1, "body_animate_jnt" );
    var_1 = spawn( "script_model", level.seaknight1 gettagorigin( "body_animate_jnt" ) );
    var_1 setmodel( "vehicle_ch46e_wires" );
    var_1.angles = level.seaknight1.angles;
    var_1 linkto( level.seaknight1, "body_animate_jnt" );
    maps\_wibble::wibble_add_heli_to_track( level.seaknight1 );
    wait 0.05;
    var_2 = [];

    for ( var_3 = 0; var_3 < level.seaknight1.riders.size; var_3++ )
    {
        if ( level.seaknight1.riders[var_3].classname != "actor_ally_pilot_zach_woodland" )
            var_2[var_2.size] = level.seaknight1.riders[var_3];

        if ( level.seaknight1.riders[var_3].classname == "actor_ally_hero_mark_woodland" )
        {
            level.griggs = level.seaknight1.riders[var_3];
            level.griggs.animname = "griggs";
        }

        level.seaknight1.riders[var_3] common_scripts\utility::hide_friendname_until_flag_or_notify( "seaknight_show_names" );
    }

    for ( var_3 = 0; var_3 < var_2.size; var_3++ )
        var_2[var_3] thread seaknightriders_standinplace();

    common_scripts\utility::flag_set( "no_more_grenades" );
    var_4 = getaiarray( "axis" );

    for ( var_3 = 0; var_3 < var_4.size; var_3++ )
        var_4[var_3].grenadeammo = 0;

    common_scripts\utility::flag_wait( "open_bay_doors" );
    wait 11;
    var_5 = missile_createrepulsorent( level.seaknight1, 5000, 1500 );
    level.seaknight1.dontdisconnectpaths = 1;
    level.seaknight1 sethoverparams( 0, 0, 0 );
    level.seaknight1 setanim( maps\_utility::getanim_generic( "ch46_doors_open" ), 1 );
    level.seaknight1 playsound( "seaknight_door_open" );
    level.vehicle_aianims["script_vehicle_ch46e"][1].vehicle_getoutanim = undefined;
    level.vehicle_aianims["script_vehicle_ch46e"][2].getout = level.scr_anim["generic"]["ch46_unload_2"];
    level.vehicle_aianims["script_vehicle_ch46e"][3].getout = level.scr_anim["generic"]["ch46_unload_3"];
    level.seaknight1 notify( "unload" );
    wait 0.5;
    level notify( "seaknight_show_names" );
    wait 4.0;
    level.playersafetyblocker delete();
    common_scripts\utility::flag_set( "seaknight_can_be_boarded" );
    thread seaknight_griggs_speech();
    var_6 = 0;

    for ( var_3 = 0; var_3 < var_2.size; var_3++ )
    {
        var_6++;
        var_2[var_3] thread vehicle_seaknight_idle_and_load_think( var_6 );
        var_2[var_3] thread seaknight_riders_erase();
    }

    thread seaknight_departure_sequence();
    common_scripts\utility::flag_wait( "player_made_it" );

    if ( isalive( level.player ) )
    {
        level.player enableinvulnerability();
        level.player.attackeraccuracy = 0;
        maps\_utility::enable_scuff_footsteps_sound( 0 );
    }

    createthreatbiasgroup( "sas_evac_guy" );
    wait 0.25;
    var_7 = getent( "redshirt1", "targetname" );
    var_7 thread seaknight_sas_load();
    level.sasseaknightboarded++;
    var_8 = getent( "redshirt2", "targetname" );
    var_8 thread seaknight_sas_load();
    level.sasseaknightboarded++;
    level.sasgunner thread seaknight_sas_load();
    level.sasseaknightboarded++;
    level.price thread seaknight_sas_load();
    level.sasseaknightboarded++;

    while ( level.sasseaknightboarded > 0 )
        wait 0.1;

    common_scripts\utility::flag_set( "all_real_friendlies_on_board" );
    common_scripts\utility::flag_set( "seaknight_guards_boarding" );
    level.player maps\_utility::play_sound_on_entity( "scn_vd_seaknight_leaving" );
}

seaknight_departure_sequence()
{
    common_scripts\utility::flag_wait( "seaknight_guards_boarding" );
    wait 10;

    if ( !common_scripts\utility::flag( "player_made_it" ) )
        wait 2;

    common_scripts\utility::flag_set( "all_fake_friendlies_aboard" );

    if ( !common_scripts\utility::flag( "player_made_it" ) )
        wait 5;

    if ( common_scripts\utility::flag( "player_made_it" ) )
    {
        common_scripts\utility::flag_wait( "all_real_friendlies_on_board" );
        level.player playsound( "villagedef_grg_wereallaboard" );
        wait 1;
    }
    else
    {
        common_scripts\utility::flag_set( "seaknight_unboardable" );
        level.seaknight1 setcontents( 0 );
    }

    common_scripts\utility::flag_set( "outtahere" );
    wait 1.5;
    thread maps\village_defend::countdown_speech( "outtahere" );
}

seaknight_sas_load()
{
    self endon( "death" );
    maps\_utility::enable_trigger_with_noteworthy( "interval_trigger_seaknight" );
    self setthreatbiasgroup( "sas_evac_guy" );
    setignoremegroup( "axis", "sas_evac_guy" );
    self.goalradius = 60;
    self.disablearrivals = 1;
    self.ignoresuppression = 1;
    self.ignoreall = 1;
    wait(randomfloatrange( 1.5, 3.2 ));
    var_0 = getnode( "seaknight_fakeramp_startpoint", "targetname" );
    self setgoalnode( var_0 );
    self waittill( "goal" );
    self.nododgemove = 1;

    if ( isdefined( var_0.radius ) )
        self.goalradius = var_0.radius;

    var_1 = getnode( "seaknight_fakeramp_end", "targetname" );
    self setgoalnode( var_1 );
    self waittill( "goal" );
    level.sasseaknightboarded--;

    if ( isdefined( self.magic_bullet_shield ) )
        maps\_utility::stop_magic_bullet_shield();

    self delete();
}

seaknight_griggs_speech()
{
    common_scripts\utility::flag_wait( "seaknight_can_be_boarded" );

    if ( !common_scripts\utility::flag( "lz_reached" ) )
        common_scripts\utility::flag_wait( "lz_reached" );
    else
        wait 5.5;

    level.griggs maps\_anim::anim_single_queue( level.griggs, "needaride" );
    wait 0.45;
    level.griggs maps\_anim::anim_single_queue( level.griggs, "getonboard" );
    wait 2;
    level.griggs maps\_anim::anim_single_queue( level.griggs, "griggsletsgo" );
}

vehicle_seaknight_idle_and_load_think( var_0 )
{
    self endon( "death" );
    common_scripts\utility::flag_wait( "seaknight_guards_boarding" );
    var_1 = "ch46_load_" + var_0;
    level.seaknight1 maps\_anim::anim_generic( self, var_1, "tag_detach" );
    var_2 = getent( "seaknight_guards_loading_org_" + var_0, "targetname" );
    self setgoalpos( var_2.origin );
    self.goalradius = 4;

    if ( !common_scripts\utility::flag( "player_made_it" ) )
    {
        self waittill( "goal" );
        self linkto( level.seaknight1, "tag_detach" );
    }

    common_scripts\utility::flag_wait( "player_made_it" );
    wait 1;

    if ( isdefined( self.magic_bullet_shield ) )
        maps\_utility::stop_magic_bullet_shield();

    self delete();
}

seaknight_riders_erase()
{
    if ( isdefined( self.animname ) && self.animname == "griggs" )
        return;

    self endon( "death" );
    common_scripts\utility::flag_wait( "player_made_it" );
    wait 1;
    common_scripts\utility::flag_wait( "all_fake_friendlies_aboard" );

    if ( isdefined( self.magic_bullet_shield ) )
        maps\_utility::stop_magic_bullet_shield();

    self delete();
}

deleteme()
{
    self delete();
}

seaknightriders_standinplace()
{
    if ( !isai( self ) )
        return;

    self allowedstances( "crouch" );
    thread maps\village_defend::hero();
    self waittill( "jumpedout" );
    self allowedstances( "crouch" );
    waittillframeend;
    self allowedstances( "crouch" );
    self.goalradius = 4;
    self pushplayer( 1 );
    self.pushable = 0;
    self setgoalpos( self.origin );
    self.grenadeawareness = 0;
    self.grenadeammo = 0;
    self.ignoresuppression = 1;
}

friendly_pushplayer( var_0 )
{
    if ( !isdefined( var_0 ) )
        var_0 = 0;

    var_1 = getaiarray( "allies" );

    for ( var_2 = 0; var_2 < var_1.size; var_2++ )
    {
        if ( var_0 == "on" )
        {
            var_1[var_2] pushplayer( 1 );
            var_1[var_2].dontavoidplayer = 1;
            var_1[var_2].pushable = 0;
            continue;
        }

        var_1[var_2] pushplayer( 0 );
        var_1[var_2].dontavoidplayer = 0;
        var_1[var_2].pushable = 1;
    }
}

can_display_pvt_parity_name()
{
    var_0 = 400;

    if ( distancesquared( level.player.origin, self.origin ) > var_0 * var_0 )
        return 0;

    var_1 = level.player geteye() + 2000 * anglestoforward( level.player getplayerangles() );
    var_2 = bullettrace( level.player geteye(), var_1, 0, level.player );

    if ( isdefined( var_2["surfacetype"] ) && issubstr( var_2["surfacetype"], "water" ) )
    {
        var_3 = var_2["position"] + 2 * vectornormalize( anglestoforward( level.player getplayerangles() ) );
        var_2 = bullettrace( var_3, var_1, 0, level.player );
    }

    return isdefined( var_2["entity"] ) && var_2["entity"] == self;
}
