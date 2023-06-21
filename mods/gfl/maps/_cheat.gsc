// H1 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

init()
{
    precacheshader( "h1_hud_tutorial_blur" );
    precacheshader( "h1_hud_tutorial_border" );
    precachestring( &"SCRIPT_PLATFORM_CHEAT_USETOSLOWMO" );
    precacheshellshock( "chaplincheat" );
    precachemodel( "com_junktire" );
    level.random_tire_model = "com_junktire";
    level.vision_cheat_enabled = 0;
    setsaveddvar( "using_vision_cheat", 0 );
    level.tire_explosion = 0;
    level.cheatstates = [];
    level.cheatfuncs = [];
    level.cheatdvars = [];
    level.cheatbobamporiginal = getdvar( "bg_bobAmplitudeStanding" );
    level.cheatshowslowmohint = 0;
    level.cheattires = [];
    level.cheattires_max = 90;
    level.cheat_super_ragdoll = 0;
    thread melonhead_mode_init();
    thread lemonade_mode_init();
    thread tracksuit_mode_init();
    thread tire_explosionmode_init();

    if ( !isdefined( level._effect ) )
        level._effect = [];

    level._effect["grain_test"] = loadfx( "fx/misc/grain_test" );
    common_scripts\utility::flag_init( "has_cheated" );
    level.visionsets["bw"] = 0;
    level.visionsets["invert"] = 0;
    level.visionsets["contrast"] = 0;
    level.visionsets["chaplin"] = 0;
    slowmo_system_init();
    thread death_monitor();
    common_scripts\utility::flag_init( "disable_slowmo_cheat" );

    if ( getdvar( "credits_active" ) == "1" )
        return;

    level.player thread specialfeaturesmenu();
}

death_monitor()
{
    setdvars_based_on_varibles();

    for (;;)
    {
        if ( issaverecentlyloaded() )
            setdvars_based_on_varibles();

        wait 0.1;
    }
}

setdvars_based_on_varibles()
{
    for ( var_0 = 0; var_0 < level.cheatdvars.size; var_0++ )
        setdvar( level.cheatdvars[var_0], level.cheatstates[level.cheatdvars[var_0]] );

    if ( !isdefined( level.credits_active ) || !level.credits_active )
    {
        setdvar( "credits_active", "0" );
        setdvar( "credits_load", "0" );
    }
}

getcheatvalue( var_0 )
{
    var_1 = getdvarint( var_0, 0 ) && getdvar( "arcademode" ) != "1";
    return var_1;
}

addcheat( var_0, var_1 )
{
    setdvarifuninitialized( var_0, 0 );
    level.cheatstates[var_0] = getcheatvalue( var_0 );
    level.cheatfuncs[var_0] = var_1;

    if ( level.cheatstates[var_0] )
        [[ var_1 ]]( level.cheatstates[var_0] );
}

checkcheatchanged( var_0 )
{
    var_1 = getcheatvalue( var_0 );

    if ( level.cheatstates[var_0] == var_1 )
        return;

    if ( var_1 )
        common_scripts\utility::flag_set( "has_cheated" );

    level.cheatstates[var_0] = var_1;
    [[ level.cheatfuncs[var_0] ]]( var_1 );
}

specialfeaturesmenu()
{
    level waittill( "load_finished" );
    addcheat( "sf_use_contrast", ::contrastmode );
    addcheat( "sf_use_bw", ::bwmode );
    addcheat( "sf_use_invert", ::invertmode );
    addcheat( "sf_use_slowmo", ::slowmomode );
    addcheat( "sf_use_chaplin", ::chaplinmode );
    addcheat( "sf_use_ignoreammo", ::ignore_ammomode );
    addcheat( "sf_use_clustergrenade", ::clustergrenademode );
    addcheat( "sf_use_tire_explosion", ::tire_explosionmode );
    addcheat( "sf_use_melon_mode", ::melonhead_mode_update );
    addcheat( "sf_use_ragdoll_mode", ::ragdoll_mode );
    addcheat( "sf_use_lemonade_mode", ::lemonade_mode_update );
    addcheat( "sf_use_tracksuit_mode", ::tracksuit_mode_update );
    level.cheatdvars = getarraykeys( level.cheatstates );

    if ( is_cheating() )
        common_scripts\utility::flag_set( "has_cheated" );

    for (;;)
    {
        for ( var_0 = 0; var_0 < level.cheatdvars.size; var_0++ )
            checkcheatchanged( level.cheatdvars[var_0] );

        wait 0.05;
    }
}

tire_explosionmode_init()
{
    maps\_utility::add_global_spawn_function( "axis", ::tirecheat_dogs_enemy_spawned );
    common_scripts\utility::array_thread( getaiarray( "axis" ), ::tirecheat_dogs_enemy_spawned );
}

tirecheat_dogs_enemy_spawned()
{
    if ( !isdefined( self.classname ) )
        return;

    if ( self.classname != "actor_enemy_dog" )
        return;

    self waittill( "death" );

    if ( isremovedentity( self ) )
        return;

    if ( level.tire_explosion )
    {
        var_0 = self.origin;
        var_1 = self geteye();
        waittillframeend;

        for ( var_2 = 0; var_2 < 15; var_2++ )
            thread maps\_spawner::random_tire( var_0, var_1 );

        if ( isdefined( self ) && !isremovedentity( self ) )
            self delete();
    }
}

tire_explosionmode( var_0 )
{
    if ( var_0 )
        level.tire_explosion = 1;
    else
        level.tire_explosion = 0;
}

clustergrenademode( var_0 )
{
    if ( var_0 )
        level.player thread wait_for_grenades();
    else
        level notify( "end_cluster_grenades" );
}

wait_for_grenades()
{
    level endon( "end_cluster_grenades" );

    for (;;)
    {
        self waittill( "grenade_fire", var_0, var_1 );

        if ( isdefined( var_0.cluster_grenade ) && var_0.cluster_grenade )
            continue;

        if ( var_1 == "fraggrenade" || var_1 == level.cheat_lemonade_weaponname )
            var_0 thread create_clustergrenade( "fraggrenade" );
    }
}

create_clustergrenade( var_0 )
{
    var_1 = self.origin;

    for (;;)
    {
        if ( !isdefined( self ) )
            break;

        var_1 = self.origin;
        wait 0.1;
    }

    var_1 += ( 0.0, 0.0, 5.0 );
    var_2 = 8;

    for ( var_3 = 0; var_3 < var_2; var_3++ )
    {
        var_4 = getclustergrenadevelocity();
        var_5 = 1.5 + var_3 / 6 + randomfloat( 0.1 );
        var_6 = magicgrenademanual( var_0, var_1, var_4, var_5, level.player );
        var_6.cluster_grenade = 1;
    }
}

getclustergrenadevelocity()
{
    var_0 = randomfloat( 360 );
    var_1 = randomfloatrange( 65, 85 );
    var_2 = sin( var_1 );
    var_3 = cos( var_1 );
    var_4 = cos( var_0 ) * var_3;
    var_5 = sin( var_0 ) * var_3;
    var_6 = randomfloatrange( 400, 600 );
    var_7 = ( var_4, var_5, var_2 ) * var_6;
    return var_7;
}

ignore_ammomode( var_0 )
{
    if ( level.script == "ac130" )
        return;

    if ( var_0 )
        setsaveddvar( "player_sustainAmmo", 1 );
    else
        setsaveddvar( "player_sustainAmmo", 0 );
}

contrastmode( var_0 )
{
    if ( var_0 )
        level.visionsets["contrast"] = 1;
    else
        level.visionsets["contrast"] = 0;

    applyvisionsets();
}

bwmode( var_0 )
{
    if ( var_0 )
        level.visionsets["bw"] = 1;
    else
        level.visionsets["bw"] = 0;

    applyvisionsets();
}

invertmode( var_0 )
{
    if ( var_0 )
        level.visionsets["invert"] = 1;
    else
        level.visionsets["invert"] = 0;

    applyvisionsets();
}

applyvisionsets()
{
    if ( level.script == "ac130" )
        return;

    var_0 = 0;
    var_1 = "";

    if ( level.visionsets["bw"] )
        var_1 += "_bw";

    if ( level.visionsets["invert"] )
    {
        var_1 += "_invert";

        if ( isdefined( level.cheat_invert_override ) )
            var_1 += level.cheat_invert_override;
    }

    if ( level.visionsets["contrast"] )
    {
        var_1 += "_contrast";

        if ( isdefined( level.cheat_highcontrast_override ) )
            var_1 += level.cheat_highcontrast_override;
    }

    if ( level.visionsets["chaplin"] )
    {
        level.vision_cheat_enabled = 1;
        setsaveddvar( "using_vision_cheat", 1 );
        visionsetnaked( "sepia", var_0 );
    }
    else if ( var_1 != "" )
    {
        level.vision_cheat_enabled = 1;
        setsaveddvar( "using_vision_cheat", 1 );
        visionsetnaked( "cheat" + var_1, var_0 );
    }
    else
    {
        level.vision_cheat_enabled = 0;
        setsaveddvar( "using_vision_cheat", 0 );
        maps\_utility::set_vision_set( level.lvl_visionset, var_0 );
    }
}

slowmo_system_init()
{
    level.slowmo = spawnstruct();
    slowmo_system_defaults();
    notifyoncommand( "_cheat_player_press_slowmo", "+melee" );
    notifyoncommand( "_cheat_player_press_slowmo", "+melee_breath" );
    notifyoncommand( "_cheat_player_press_slowmo", "+melee_zoom" );
}

slowmo_system_defaults()
{
    level.slowmo.lerp_time_in = 0.0;
    level.slowmo.lerp_time_out = 0.25;
    level.slowmo.speed_slow = 0.4;
    level.slowmo.speed_norm = 1.0;
}

slowmo_check_system()
{
    return 1;
}

slowmo_hintprint()
{
    common_scripts\utility::flag_wait( "introscreen_complete" );

    if ( level.cheatshowslowmohint != 0 )
    {
        level.cheatshowslowmohint = 0;
        return;
    }

    if ( level.console )
        var_0 = 5;
    else
        var_0 = 6;

    level.cheatshowslowmohint = 1;
    var_1 = 180;
    var_2 = maps\_hud_util::createicon( "h1_hud_tutorial_blur", 400, 25 );
    var_3 = maps\_hud_util::createicon( "h1_hud_tutorial_border", 400, 1 );
    var_4 = maps\_hud_util::createicon( "h1_hud_tutorial_border", 400, 1 );
    var_2 maps\_hud_util::setpoint( "TOP", undefined, 0, var_1 );
    var_2.sort = 1;
    var_2.hidewheninmenu = 1;
    var_2.hidewhendead = 1;
    var_2.alpha = 0.9;
    var_3 maps\_hud_util::setpoint( "TOP", undefined, 0, var_1 );
    var_3.sort = 1;
    var_3.hidewheninmenu = 1;
    var_3.hidewhendead = 1;
    var_3.alpha = 0.05;
    var_4 maps\_hud_util::setpoint( "TOP", undefined, 0, var_1 + 24 );
    var_4.sort = 1;
    var_4.hidewheninmenu = 1;
    var_4.hidewhendead = 1;
    var_4.alpha = 0.05;
    var_5 = maps\_hud_util::createfontstring( "timer", 0.5 );
    var_5.hidewheninmenu = 1;
    var_5 maps\_hud_util::setpoint( "TOP", undefined, 0, var_1 + var_0 );
    var_5.sort = 0.5;
    var_5 settext( &"SCRIPT_PLATFORM_CHEAT_USETOSLOWMO" );

    for ( var_6 = 0; var_6 < 100; var_6++ )
    {
        if ( level.cheatshowslowmohint != 1 )
            break;

        wait 0.1;
    }

    level.cheatshowslowmohint = 0;
    var_2 fadeovertime( 0.5 );
    var_2.alpha = 0;
    var_3 fadeovertime( 0.5 );
    var_3.alpha = 0;
    var_4 fadeovertime( 0.5 );
    var_4.alpha = 0;
    var_5 fadeovertime( 0.5 );
    var_5.alpha = 0;
    wait 0.5;
    var_2 destroy();
    var_3 destroy();
    var_4 destroy();
    var_5 destroy();
}

slowmomode( var_0 )
{
    level.slowmo_mode_enabled = common_scripts\utility::ter_op( var_0, 1, 0 );

    if ( level.slowmo_mode_enabled )
    {
        level.slowmo thread gamespeed_proc();
        level.player allowmelee( 0 );
        thread slowmo_hintprint();
    }
    else
    {
        level notify( "disable_slowmo" );
        level.player allowmelee( 1 );
        level.slowmo thread gamespeed_reset();
        level.cheatshowslowmohint = 0;
    }
}

gamespeed_proc()
{
    level endon( "disable_slowmo" );
    thread gamespeed_reset_on_death();

    for (;;)
    {
        level.player waittill( "_cheat_player_press_slowmo" );
        level.cheatshowslowmohint = 0;
        slowmo_system_defaults();

        if ( !common_scripts\utility::flag( "disable_slowmo_cheat" ) )
        {
            if ( gettimescale() < level.slowmo.speed_norm )
                thread gamespeed_reset();
            else
                thread gamespeed_slowmo();
        }

        waittillframeend;
    }
}

gamespeed_reset_on_death()
{
    level notify( "gamespeed_reset_on_death" );
    level endon( "gamespeed_reset_on_death" );
    level.player waittill( "death" );
    thread gamespeed_reset();
}

gamespeed_slowmo()
{
    level.player thread common_scripts\utility::play_loop_sound_on_entity( "h1_slowmo_cheat_heartbeat" );
    setslowmotion( self.speed_norm, self.speed_slow, self.lerp_time_in );
}

gamespeed_reset()
{
    level.player thread common_scripts\utility::stop_loop_sound_on_entity( "h1_slowmo_cheat_heartbeat" );

    if ( !common_scripts\utility::flag( "disable_slowmo_cheat" ) )
        setslowmotion( self.speed_slow, self.speed_norm, self.lerp_time_out );
}

slowmomodesuspend()
{
    level endon( "slowmo_resume" );

    if ( gettimescale() < level.slowmo.speed_norm )
        level.sloweddown = 1;

    for (;;)
    {
        if ( isdefined( level.slowmo_mode_enabled ) && level.slowmo_mode_enabled )
        {
            level notify( "disable_slowmo" );
            level.slowmo thread gamespeed_reset();
            level.player allowmelee( 1 );
        }

        wait 0.05;
    }
}

slowmomoderesume()
{
    if ( isdefined( level.slowmo_mode_enabled ) && level.slowmo_mode_enabled )
    {
        level notify( "slowmo_resume" );

        if ( isdefined( level.sloweddown ) )
            level.slowmo thread gamespeed_slowmo();

        level.slowmo thread gamespeed_proc();
        level.player allowmelee( 0 );
        level.sloweddown = undefined;
    }
}

chaplinmode( var_0 )
{
    if ( level.script == "ac130" )
        return;

    if ( var_0 )
    {
        setsaveddvar( "chaplincheat", "1" );
        level.cheatbobamporiginal = getdvar( "bg_weaponBobAmplitudeStanding" );
        setsaveddvar( "bg_weaponBobAmplitudeStanding", "0.08 0.04" );
        setomnvar( "ui_ragtimewarefare_overlay", 1 );
        level.visionsets["chaplin"] = 1;
        visionsetnight( "cheat_chaplinnight" );
        chaplin_grain_start();
        thread chaplin_proc();
    }
    else
    {
        level notify( "disable_chaplin" );
        level notify( "disable_chaplin_grain" );
        chaplin_grain_end();
        level.player stopshellshock();
        visionsetnight( "default_night" );
        setomnvar( "ui_ragtimewarefare_overlay", 0 );
        level.visionsets["chaplin"] = 0;
        soundscripts\_snd::snd_message( "aud_stop_ragtime_warfare" );
        setsaveddvar( "bg_weaponBobAmplitudeStanding", level.cheatbobamporiginal );
        setsaveddvar( "chaplincheat", "0" );

        if ( !common_scripts\utility::flag( "disable_slowmo_cheat" ) )
            settimescale( 1.0 );
    }

    applyvisionsets();
}

chaplin_titlecard_create_background()
{
    var_0 = newhudelem();
    var_0.x = 0;
    var_0.y = 0;
    var_0 setshader( "black", 640, 480 );
    var_0.alignx = "left";
    var_0.aligny = "top";
    var_0.horzalign = "fullscreen";
    var_0.vertalign = "fullscreen";
    var_0.alpha = 1;
    var_0.foreground = 1;
    var_0.sort = 0;
    return var_0;
}

chaplin_titlecard_create_text( var_0 )
{
    var_1 = newhudelem();
    var_1.x = 0;
    var_1.y = -40;
    var_1.alignx = "center";
    var_1.aligny = "middle";
    var_1.horzalign = "center";
    var_1.vertalign = "middle";
    var_1.foreground = 1;
    var_1 settext( var_0 );
    var_1.fontscale = 3;
    var_1.alpha = 1;
    var_1.sort = 1;
    var_1.color = ( 0.976, 0.796, 0.412 );
    return var_1;
}

chaplin_titlecard( var_0 )
{
    if ( getdvar( "chaplincheat" ) != "1" )
        return;

    if ( getdvar( "cheat_chaplin_titlecardshowing" ) == "1" )
        return;

    if ( common_scripts\utility::flag( "disable_slowmo_cheat" ) )
        return;

    setdvar( "cheat_chaplin_titlecardshowing", 1 );
    var_1 = chaplin_titlecard_create_background();
    var_2 = chaplin_titlecard_create_text( var_0 );
    settimescale( 0.05 );
    wait 0.15;
    settimescale( 1 );
    var_1 destroy();
    var_2 destroy();
    setdvar( "cheat_chaplin_titlecardshowing", 0 );
}

chaplin_proc()
{
    level endon( "disable_chaplin" );
    soundscripts\_snd::snd_message( "aud_start_ragtime_warfare" );

    for (;;)
    {
        level.player shellshock( "chaplincheat", 60, 1 );
        wait 0.5;

        if ( !common_scripts\utility::flag( "disable_slowmo_cheat" ) )
        {
            if ( getdvar( "cheat_chaplin_titlecardshowing" ) == "1" )
            {
                settimescale( 0.05 );
                continue;
            }

            settimescale( 1.7 );
        }
    }
}

chaplin_grain_start()
{
    level.cheatgrainlooper = spawn( "script_model", level.player geteye() );
    level.cheatgrainlooper setmodel( "tag_origin" );
    level.cheatgrainlooper hide();
    playfxontag( level._effect["grain_test"], level.cheatgrainlooper, "tag_origin" );
    thread chaplin_grain_proc();
}

chaplin_grain_end()
{
    if ( !isdefined( level.cheatgrainlooper ) )
        return;

    level.cheatgrainlooper delete();
}

chaplin_grain_proc()
{
    level endon( "disable_chaplin_grain" );

    for (;;)
    {
        level.cheatgrainlooper.origin = level.player geteye() + 50 * anglestoforward( level.player getplayerangles() );
        wait 0.01;
    }
}

is_cheating()
{
    for ( var_0 = 0; var_0 < level.cheatdvars.size; var_0++ )
    {
        if ( level.cheatstates[level.cheatdvars[var_0]] )
            return 1;
    }

    return 0;
}

ragdoll_mode( var_0 )
{
    level.cheat_super_ragdoll = common_scripts\utility::ter_op( var_0, 1, 0 );
}

melonhead_mode_init()
{
    level.melonhead_mode_enabled = 0;
    level.melonhead_mode_fx = loadfx( "fx/props/watermelon" );
    level.melonhead_mode_attachtag = "j_head";
    level.melonhead_mode_model = "me_fruit_watermelon_oblong";
    precachemodel( level.melonhead_mode_model );
    maps\_utility::add_global_spawn_function( "axis", ::melonhead_monitor );
    common_scripts\utility::array_thread( getaiarray( "axis" ), ::melonhead_monitor );
}

melonhead_mode_update( var_0 )
{
    level.melonhead_mode_enabled = common_scripts\utility::ter_op( var_0, 1, 0 );
    level notify( "melonhead_mode_updated" );
}

melonhead_monitor()
{
    self endon( "death" );
    self notify( "melonhead_monitor" );
    self endon( "melonhead_monitor" );
    waitframe();

    if ( isdefined( self.melonhead_ignore ) && self.melonhead_ignore )
        return;

    for (;;)
    {
        if ( level.melonhead_mode_enabled )
            melonhead_add_melon();
        else
            melonhead_remove_melon();

        level waittill( "melonhead_mode_updated" );
    }
}

melonhead_add_melon()
{
    if ( isremovedentity( self ) )
        return;

    if ( isdefined( self.melonhead_disabled ) && self.melonhead_disabled )
        return;

    if ( isdefined( self.melonhead_attached ) )
        return;

    self attach( level.melonhead_mode_model, level.melonhead_mode_attachtag, 1 );
    self.melonhead_attached = 1;
    thread melonhead_detect_death();
    thread melonhead_detect_hit();
}

melonhead_remove_melon( var_0, var_1 )
{
    if ( isremovedentity( self ) )
        return;

    if ( isdefined( var_1 ) && var_1 )
        self.melonhead_disabled = 1;

    if ( !isdefined( self.melonhead_attached ) )
        return;

    self detach( level.melonhead_mode_model, level.melonhead_mode_attachtag );
    self.melonhead_attached = undefined;

    if ( isdefined( var_0 ) && var_0 )
    {
        playfx( level.melonhead_mode_fx, self gettagorigin( level.melonhead_mode_attachtag ), anglestoforward( self.angles ) );
        thread common_scripts\utility::play_sound_in_space( "h1_hit_watermelon", self gettagorigin( level.melonhead_mode_attachtag ) );
    }

    self notify( "melonhead_removed" );
}

melonhead_detect_death()
{
    self endon( "melonhead_removed" );
    self waittill( "death" );
    melonhead_remove_melon( 1 );
}

melonhead_detect_hit()
{
    self endon( "melonhead_removed" );

    for (;;)
    {
        self waittill( "damage", var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7, var_8, var_9 );

        if ( !isdefined( self.damagelocation ) )
            continue;

        if ( ( self.damagelocation == "head" || self.damagelocation == "helmet" ) && var_4 != "MOD_IMPACT" )
        {
            melonhead_remove_melon( 1 );
            break;
        }
    }
}

handgun_mode_init()
{
    level.cheat_handgun = 0;
    level.cheat_handgun_weaponname = "h1_cheathandgun";
    level.cheat_handgun_currentweapon = undefined;
    precacheitem( level.cheat_handgun_weaponname );
    level waittill( "load_finished" );
}

handgun_mode_update( var_0 )
{
    if ( level.script == "ac130" )
        return;

    level.cheat_handgun = common_scripts\utility::ter_op( var_0, 1, 0 );
    level notify( "handgun_mode_updated" );

    if ( level.cheat_handgun )
        givehandgun();
    else
        takehandgun();
}

handgun_monitor()
{
    self endon( "handgun_removed" );
    self endon( "death" );

    for (;;)
    {
        if ( level.player weaponpickupenabled() == 1 && level.player getcurrentweapon() == level.cheat_handgun_weaponname )
            level.player maps\_utility::playerallowweaponpickup( 0, "cheat_handgun" );
        else if ( level.player weaponpickupenabled() == 0 && level.player getcurrentweapon() != level.cheat_handgun_weaponname )
            level.player maps\_utility::playerallowweaponpickup( 1, "cheat_handgun" );

        wait 0.05;
    }
}

handgun_monitor_reload()
{
    self endon( "handgun_removed" );
    self endon( "death" );

    for (;;)
    {
        if ( level.player isreloading() )
        {
            level.player givemaxammo( level.cheat_handgun_weaponname );
            level.player setweaponammoclip( level.cheat_handgun_weaponname, weaponclipsize( level.cheat_handgun_weaponname ) );
        }

        wait 0.05;
    }
}

givehandgun()
{
    level.cheat_handgun_currentweapon = level.player getcurrentweapon();
    level.player giveweapon( level.cheat_handgun_weaponname );
    level.player givemaxammo( level.cheat_handgun_weaponname );
    level.player switchtoweaponimmediate( level.cheat_handgun_weaponname );
    thread handgun_monitor();
    thread handgun_monitor_reload();
}

takehandgun()
{
    if ( level.player weaponpickupenabled() == 0 )
        level.player maps\_utility::playerallowweaponpickup( 1, "cheat_handgun" );

    var_0 = level.player getcurrentweapon();
    var_1 = 0;

    if ( var_0 == level.cheat_handgun_weaponname && level.cheat_handgun_currentweapon != "none" )
    {
        var_2 = level.player getweaponslistall();

        foreach ( var_4 in var_2 )
        {
            if ( var_4 == level.cheat_handgun_currentweapon )
            {
                level.player switchtoweaponimmediate( var_4 );
                var_1 = 1;
                break;
            }
        }

        if ( !var_1 && var_2.size > 0 )
            level.player switchtoweaponimmediate( var_2[0] );
    }

    level.player takeweapon( level.cheat_handgun_weaponname );
    self notify( "handgun_removed" );
}

lemonade_mode_init()
{
    level.cheat_lemonade = 0;
    level.cheat_lemonade_weaponname = "h1_cheatlemonade";
    level.cheat_lemonade_currentlethal = undefined;
    precacheitem( level.cheat_lemonade_weaponname );
    level waittill( "load_finished" );
}

lemonade_mode_update( var_0 )
{
    level.cheat_lemonade = common_scripts\utility::ter_op( var_0, 1, 0 );

    if ( level.cheat_lemonade )
        givelemonade();
    else
        takelemonade();
}

givelemonade()
{
    level.cheat_lemonade_currentlethal = level.player getlethalweapon();

    if ( isdefined( level.cheat_lemonade_currentlethal ) && level.cheat_lemonade_currentlethal != "none" )
    {
        var_0 = level.player getweaponammoclip( level.cheat_lemonade_currentlethal );
        level.player takeweapon( level.cheat_lemonade_currentlethal );
        level.player setlethalweapon( level.cheat_lemonade_weaponname );
        level.player giveweapon( level.cheat_lemonade_weaponname );
        level.player setweaponammoclip( level.cheat_lemonade_weaponname, var_0 );
    }
}

takelemonade()
{
    var_0 = level.player getweaponammoclip( level.cheat_lemonade_weaponname );
    level.player takeweapon( level.cheat_lemonade_weaponname );

    if ( isdefined( level.cheat_lemonade_currentlethal ) )
    {
        level.player setlethalweapon( level.cheat_lemonade_currentlethal );
        level.player giveweapon( level.cheat_lemonade_currentlethal );
        level.player setweaponammoclip( level.cheat_lemonade_currentlethal, var_0 );
    }
}

randomize()
{
    level.tracksuit_mode_model = undefined;
    level.tracksuit_mode_head = undefined;
    level.accessorymodels_cheat = undefined;

	switch( randomint(29) )
	{
	case 0:
        level.tracksuit_mode_model = "h1_gfl_negev_body";
        level.tracksuit_mode_head = "h1_gfl_negev_head";
        level.accessorymodels_cheat = [ "h1_gfl_negev_hair" ];
		break;
	case 1:
        level.tracksuit_mode_model = "h1_gfl_m16a1_prime_body";
        level.tracksuit_mode_head = "h1_gfl_m16a1_prime_head";
        level.accessorymodels_cheat = [ "h1_gfl_m16a1_prime_outline" ];
		break;
	case 2:
        level.tracksuit_mode_model = "h2_gfl_m4a1_body";
        level.tracksuit_mode_head = "h2_gfl_m4a1_head";
        level.accessorymodels_cheat = [ "h2_gfl_m4a1_hair", "h2_gfl_m4a1_outline" ];
		break;
	case 3:
        level.tracksuit_mode_model = "h1_gfl_m16a1_prime_body";
        level.tracksuit_mode_head = "h1_gfl_m16a1_prime_head";
        level.accessorymodels_cheat = [ "h1_gfl_m16a1_prime_outline" ];
		break;
	case 4:
        level.tracksuit_mode_model = "h1_gfl_super_sass_body";
        level.tracksuit_mode_head = "h1_gfl_super_sass_head";
        level.accessorymodels_cheat = [ "h1_gfl_super_sass_clothes" ];
		break;
	case 5:
        level.tracksuit_mode_model = "h1_gfl_ppsh41_body";
        level.tracksuit_mode_head = "h1_gfl_ppsh41_head";
		break;
	case 6:
        level.tracksuit_mode_model = "h2_gfl_suomi_body";
        level.tracksuit_mode_head = "h2_gfl_suomi_head";
        level.accessorymodels_cheat = [ "h2_gfl_suomi_hair" ];
		break;
	case 7:
        level.tracksuit_mode_model = "h2_gfl_dima_body";
        level.tracksuit_mode_head = "h2_gfl_dima_head";
        level.accessorymodels_cheat = [ "h2_gfl_dima_outline" ];
		break;
	case 8:
        level.tracksuit_mode_model = "h2_gfl_ak12_body";
        level.tracksuit_mode_head = "h2_gfl_ak12_head";
        level.accessorymodels_cheat = [ "h2_gfl_ak12_hair", "h2_gfl_ak12_outline" ];
		break;
	case 9:
        level.tracksuit_mode_model = "h2_gfl_p90_body";
        level.tracksuit_mode_head = "h2_gfl_p90_head";
        level.accessorymodels_cheat = [ "h2_gfl_p90_clothes" ];
		break;
	case 10:
        level.tracksuit_mode_model = "h2_gfl_9a91_body";
        level.tracksuit_mode_head = "h2_gfl_9a91_head";
        level.accessorymodels_cheat = [ "h2_gfl_9a91_hair" ];
		break;
	case 11:
        level.tracksuit_mode_model = "h2_gfl_rfb_body";
        level.tracksuit_mode_head = "h2_gfl_rfb_head";
        level.accessorymodels_cheat = [ "h2_gfl_rfb_hair", "h2_gfl_rfb_clothes" ];
		break;
	case 12:
        level.tracksuit_mode_model = "h2_gfl_type97_body";
        level.tracksuit_mode_head = "h2_gfl_type97_head";
        level.accessorymodels_cheat = [ "h2_gfl_type97_hair" ];
		break;
	case 13:
        level.tracksuit_mode_model = "h2_gfl_saiga12_body";
        level.tracksuit_mode_head = "h2_gfl_saiga12_head";
        level.accessorymodels_cheat = [ "h2_gfl_saiga12_clothes" ];
		break;
	case 14:
        level.tracksuit_mode_model = "h2_gfl_fnc_body";
        level.tracksuit_mode_head = "h2_gfl_fnc_head";
        level.accessorymodels_cheat = [ "h2_gfl_fnc_clothes" ];
		break;
	case 15:
        level.tracksuit_mode_model = "h2_gfl_sten_body";
        level.tracksuit_mode_head = "h2_gfl_sten_head";
		break;
	case 16:
        level.tracksuit_mode_model = "h2_gfl_ak74m_body";
        level.tracksuit_mode_head = "h2_gfl_ak74m_head";
        level.accessorymodels_cheat = [ "h2_gfl_ak74m_hair", "h2_gfl_ak74m_outline" ];
		break;
	case 17:
        level.tracksuit_mode_model = "h1_gfl_sp9_v2_body";
        level.tracksuit_mode_head = "h1_gfl_sp9_v2_head";
        level.accessorymodels_cheat = [ "h1_gfl_sp9_v2_hair" ];
		break;
	case 18:
        level.tracksuit_mode_model = "h2_gfl_tac50_body";
        level.tracksuit_mode_head = "h2_gfl_tac50_head";
        level.accessorymodels_cheat = [ "h2_gfl_tac50_clothes", "h2_gfl_tac50_outline" ];
		break;
	case 19:
        level.tracksuit_mode_model = "h2_gfl_commander_body";
        level.tracksuit_mode_head = "h2_gfl_commander_head";
		break;
	case 20:
        level.tracksuit_mode_model = "h2_gfl_ouroboros_body";
        level.tracksuit_mode_head = "h2_gfl_ouroboros_head";
		break;
	case 21:
        level.tracksuit_mode_model = "h2_gfl_vespid_fb";
		break;
	case 22:
        level.tracksuit_mode_model = "h2_gfl_jaeger_fb";
        level.accessorymodels_cheat = [ "h2_gfl_jaeger_goggle_up" ];
		break;
	case 23:
        level.tracksuit_mode_model = "h2_gfl_ripper_fb";
		break;
	case 24:
        level.tracksuit_mode_model = "h2_gfl_guard_fb";
        level.accessorymodels_cheat = [ "h2_gfl_guard_visor_up" ];
		break;
	case 25:
        level.tracksuit_mode_model = "h1_gfl_destroyer_body";
        level.tracksuit_mode_head = "h1_gfl_destroyer_head";
		break;
	case 26:
        level.tracksuit_mode_model = "h1_gfl_dreamer_body";
        level.tracksuit_mode_head = "h1_gfl_dreamer_head";
		break;
	case 27:
        level.tracksuit_mode_model = "s1_gfl_mp7_body_tights";
        level.tracksuit_mode_head = "s1_gfl_mp7_head";
        level.accessorymodels_cheat = [ "s1_gfl_mp7_jacket", "s1_gfl_mp7_hat", "s1_gfl_mp7_headset" ];
		break;
	case 28:
        level.tracksuit_mode_model = "s1_gfl_g36c_body";
        level.tracksuit_mode_head = "s1_gfl_g36c_head";
        level.accessorymodels_cheat = [ "s1_gfl_g36c_vest" ];
		break;
	}
}

tracksuit_mode_init()
{
    level.tracksuit_mode_enabled = 0;

    if ( level.script == "ac130" )
    {
        level.tracksuit_mode_model = "body_zakhaev_viktor_collar_ac130";
        level.tracksuit_mode_head = "head_zakhaev_viktor_ac130";
    }
    else
    {
        level.tracksuit_mode_model = "body_zakhaev_viktor_collar";
        level.tracksuit_mode_head = "head_zakhaev_viktor";
    }

    level.tracksuit_mode_weapon = "rpg";
    level.gacha = true;
    maps\gfl\_utility::precache_all_characters();
    precachemodel( level.tracksuit_mode_model );
    precachemodel( level.tracksuit_mode_head );
    precacheitem( level.tracksuit_mode_weapon );
    precacheitem( "rpg_player" );
    maps\_utility::add_global_spawn_function( "axis", ::tracksuit_monitor );
    common_scripts\utility::array_thread( getaiarray( "axis" ), ::tracksuit_monitor );
}

tracksuit_mode_update( var_0 )
{
    level.tracksuit_mode_enabled = common_scripts\utility::ter_op( var_0, 1, 0 );
    level notify( "tracksuit_mode_updated" );
}

tracksuit_monitor()
{
    self endon( "death" );
    waitframe();

    if ( isdefined( self.tracksuit_ignore ) && self.tracksuit_ignore )
        return;

    if ( isdefined( self.animtree ) && self.animtree == "dog.atr" )
        return;

    for (;;)
    {
        if ( level.tracksuit_mode_enabled )
            add_tracksuit();
        else
            remove_tracksuit();

        level waittill( "tracksuit_mode_updated" );
    }
}

add_tracksuit()
{
    if ( isremovedentity( self ) )
        return;

    self.tracksuitmode = 1;

    if ( isdefined( self.weapon ) && !isdefined( self.ignoreweaponintracksuitmode ) && self.classname != "script_model" )
    {
        if ( isdefined( self.a ) && isdefined( self.a.aimidlethread ) )
            animscripts\combat_utility::endfireandanimidlethread();

        self.tracksuitmode_previousprimary = animscripts\utility::getaiprimaryweapon();
        var_0 = tracksuit_should_equipweapon();
        maps\_utility::forceuseweapon( level.tracksuit_mode_weapon, "primary" );

        if ( !var_0 )
            maps\_utility::gun_remove();

        self.tracksuitmode_previousneverlean = self.a.neverlean;
        self.a.neverlean = 1;
        self.tracksuitmode_previousrocketvisible = self.a.rocketvisible;
        self.a.rocketvisible = 1;
        thread animscripts\shared::rpgplayerrepulsor();
        self.primaryweapon = level.tracksuit_mode_weapon;
        self.weapon = level.tracksuit_mode_weapon;
        self.lastweapon = level.tracksuit_mode_weapon;
        self.tracksuitmode_previoussecondary = self.secondaryweapon;
        self.secondaryweapon = "none";
    }

    if ( self.model == level.tracksuit_mode_model || self.model == "body_zakhaev_viktor" )
        return;

    if ( isdefined( self.accessorymodels ) )
    {
        self.accessorymodels_prev = self.accessorymodels;
        foreach ( acc in self.accessorymodels ) 
        {
            self detach( acc );
        }
        
        self.accessorymodels = undefined;
    }

    if ( isdefined( self.hatmodel ) )
    {
        self.tracksuitmode_previoushatmodel = self.hatmodel;
        self detach( self.hatmodel );
        self.hatmodel = undefined;
    }

    if ( isdefined( self.headmodel ) )
    {
        self.tracksuitmode_previousheadmodel = self.headmodel;
        self detach( self.headmodel );
    }

    if ( level.gacha ) 
    {
        randomize();
        level.gacha = false;
    }

    self.tracksuitmode_previousmodel = self.model;
    self setmodel( level.tracksuit_mode_model );
    self attach( level.tracksuit_mode_head );
    self.headmodel = level.tracksuit_mode_head;

    self.accessorymodels = level.accessorymodels_cheat;
    if ( isdefined( level.accessorymodels_cheat ) )
    {
        foreach ( acc in self.accessorymodels ) 
        {
            self attach( acc, "", true );
        }
    }
}

remove_tracksuit()
{
    if ( isremovedentity( self ) )
        return;

    if ( !isdefined( self.tracksuitmode ) )
        return;

    if ( !level.gacha ) 
    {
        level.gacha = true;
    }

    if ( isdefined( self.accessorymodels ) )
    {
        foreach ( acc in self.accessorymodels ) 
        {
            self detach( acc );
        }

        self.accessorymodels = undefined;
    }

    if ( isdefined( self.accessorymodels_prev ) )
    {
        self.accessorymodels = self.accessorymodels_prev;
        foreach ( acc in self.accessorymodels ) 
        {
            self attach( acc, "", true );
        }

        self.accessorymodels_prev = undefined;
    }

    if ( isdefined( self.tracksuitmode_previousmodel ) )
    {
        self detach( self.headmodel );
        self.headmodel = undefined;
        self setmodel( self.tracksuitmode_previousmodel );
        self.tracksuitmode_previousmodel = undefined;
    }

    if ( isdefined( self.tracksuitmode_previousheadmodel ) )
    {
        self attach( self.tracksuitmode_previousheadmodel );
        self.headmodel = self.tracksuitmode_previousheadmodel;
        self.tracksuitmode_previousheadmodel = undefined;
    }

    if ( isdefined( self.tracksuitmode_previoushatmodel ) )
    {
        self attach( self.tracksuitmode_previoushatmodel );
        self.hatmodel = self.tracksuitmode_previoushatmodel;
        self.tracksuitmode_previoushatmodel = undefined;
    }

    if ( isdefined( self.tracksuitmode_previousprimary ) && !isdefined( self.ignoreweaponintracksuitmode ) )
    {
        if ( isdefined( self.a ) && isdefined( self.a.aimidlethread ) )
            animscripts\combat_utility::endfireandanimidlethread();

        if ( tracksuit_should_equipweapon() )
            maps\_utility::forceuseweapon( self.tracksuitmode_previousprimary, "primary" );

        self.secondaryweapon = self.tracksuitmode_previoussecondary;
        self.a.neverlean = self.tracksuitmode_previousneverlean;
        self.a.rocketvisible = self.tracksuitmode_previousrocketvisible;
    }

    self.tracksuitmode = 0;
    self notify( "tracksuit_removed" );
}

tracksuit_should_equipweapon()
{
    foreach ( var_1 in self.weaponinfo )
    {
        if ( var_1.position != "none" )
            return 1;
    }

    return 0;
}
