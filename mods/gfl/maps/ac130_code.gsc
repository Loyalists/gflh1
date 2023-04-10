// H1 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

precachelevelstuff()
{
    precachestring( &"AC130_HINT_CYCLE_WEAPONS" );
    precachestring( &"AC130_DO_NOT_ENGAGE" );
    precachestring( &"AC130_CHURCH_DAMAGED" );
    precachestring( &"AC130_ESCAPEVEHICLE_DESTROYED" );
    precachestring( &"AC130_HUD_TOP_BAR" );
    precachestring( &"AC130_HUD_LEFT_BLOCK" );
    precachestring( &"AC130_HUD_RIGHT_BLOCK" );
    precachestring( &"AC130_HUD_BOTTOM_BLOCK" );
    precachestring( &"AC130_HUD_THERMAL_WHOT" );
    precachestring( &"AC130_HUD_THERMAL_BHOT" );
    precachestring( &"AC130_HUD_WEAPON_105MM" );
    precachestring( &"AC130_HUD_WEAPON_40MM" );
    precachestring( &"AC130_HUD_WEAPON_25MM" );
    precachestring( &"AC130_HUD_AGL" );
    precachestring( &"AC130_DEBUG_FRIENDLY_COUNT" );
    precachestring( &"AC130_FRIENDLIES_DEAD" );
    precachestring( &"AC130_FRIENDLY_FIRE" );
    precachestring( &"AC130_FRIENDLY_FIRE_HELICOPTER" );
    precachestring( &"AC130_CIVILIAN_FIRE" );
    precachestring( &"AC130_CIVILIAN_FIRE_VEHICLE" );
    precachestring( &"AC130_OBJECTIVE_SUPPORT_FRIENDLIES" );
    precachestring( &"SCRIPT_PLATFORM_AC130_HINT_ZOOM_AND_FIRE" );
    precachestring( &"SCRIPT_PLATFORM_AC130_HINT_TOGGLE_THERMAL" );
    precacheshader( "popmenu_bg" );
    precacheshader( "ac130_overlay_25mm_txt" );
    precacheshader( "ac130_overlay_40mm_txt" );
    precacheshader( "ac130_overlay_105mm_txt" );
    precacheshader( "ac130_overlay_whot_txt" );
    precacheshader( "ac130_overlay_whot_txt_frn" );
    precacheshader( "ac130_overlay_whot_txt_krn" );
    precacheshader( "ac130_overlay_bhot_txt_frn" );
    precacheshader( "ac130_overlay_bhot_txt_krn" );
    precacheshader( "ac130_overlay_top_left_txt" );
    precacheshader( "ac130_overlay_left_side_txt" );
    precacheshader( "ac130_overlay_right_side_txt" );
    precacheshader( "ac130_overlay_bottom_center_txt" );
    precacheshader( "ac130_overlay_bottom_center_txt_krn" );
    precacheshader( "ac130_overlay_agl_txt" );
    precacheshader( "ac130_overlay_agl_txt_krn" );
    precacheshader( "ac130_overlay_0_number" );
    precacheshader( "ac130_overlay_1_number" );
    precacheshader( "ac130_overlay_2_number" );
    precacheshader( "ac130_overlay_3_number" );
    precacheshader( "ac130_overlay_4_number" );
    precacheshader( "ac130_overlay_5_number" );
    precacheshader( "ac130_overlay_6_number" );
    precacheshader( "ac130_overlay_7_number" );
    precacheshader( "ac130_overlay_8_number" );
    precacheshader( "ac130_overlay_9_number" );
    precacheshader( "ac130_overlay_timer_txt" );
    precacheshader( "ac130_overlay_bhot_txt" );
    precacheshader( "h1_hud_tutorial_blur" );
    precacheshader( "h1_hud_tutorial_border" );
    precacheshader( "h1_ac130_blur_40mm" );
    precacheshader( "h1_ac130_blur_25mm" );
    precacheshader( "h1_ac130_blur_105mm" );
    level.nocompass = 1;
    level.weaponclipmodels = [];
    level.weaponclipmodels[0] = "weapon_saw_clip";
    level.weaponclipmodels[1] = "weapon_m16_clip";
    level.weaponclipmodels[2] = "weapon_ak47_clip";
    level.weaponclipmodels[3] = "weapon_g3_clip";
}

scriptcalls()
{
    maps\_vehicle::build_deathfx_override( "script_vehicle_luxurysedan", "luxurysedan", "vehicle_luxurysedan", "fx/explosions/large_vehicle_explosion_IR", "tag_deathfx", "explo_metal_rand" );
    maps\_vehicle::build_deathfx_override( "script_vehicle_truck", "truck", "vehicle_pickup_4door", "fx/explosions/large_vehicle_explosion_IR", "tag_origin", "explo_metal_rand" );
    maps\_vehicle::build_deathfx_override( "script_vehicle_truck", "pickup", "vehicle_pickup_4door", "fx/explosions/large_vehicle_explosion_IR", "tag_origin", "explo_metal_rand" );
    maps\_vehicle::build_deathfx_override( "script_vehicle_uaz_ac130", "uaz_ac130", "vehicle_uaz_fabric", "fx/explosions/large_vehicle_explosion_IR", "tag_origin", "explo_metal_rand" );
    maps\_vehicle::build_deathfx_override( "script_vehicle_bmp", "bmp", "vehicle_bmp", "fx/explosions/large_vehicle_explosion_IR", "tag_origin", "explo_metal_rand" );
    maps\ac130_precache::main();
    vehicle_scripts\_camera::main( "vehicle_camera", undefined, "script_vehicle_camera" );
    maps\createart\ac130_art::main();
    maps\ac130_fx::main();
    maps\_load::main();
    maps\ac130_snd::main();
    maps\ac130_anim::main();
    maps\ac130_lighting::main();
    maps\ac130_aud::main();
    maps\_ac130::init();
    maps\ac130_trees::main();
    thread exploderanimhide_setup();
    common_scripts\utility::array_thread( getentarray( "destructible_building", "targetname" ), ::destructible_building );
    common_scripts\utility::array_thread( getentarray( "sim_destruction", "targetname" ), ::sim_destruction );
    common_scripts\utility::array_thread( getentarray( "invulnerable", "script_noteworthy" ), maps\_utility::add_spawn_function, maps\_utility::magic_bullet_shield );
    common_scripts\utility::array_thread( getentarray( "damage_church", "targetname" ), ::damage_church );
    common_scripts\utility::array_thread( getentarray( "level_scripted_unloadnode", "script_noteworthy" ), ::level_scripted_unloadnode );
    thread helictoper_friendly_fire( "blackhawk1" );
    thread helictoper_friendly_fire( "blackhawk2" );
    thread helicopter_driver_beacons( "blackhawk1" );
    thread helicopter_driver_beacons( "blackhawk2" );
}

missionend( var_0 )
{
    if ( isdefined( var_0 ) && var_0 )
    {
        wait 6;
        maps\_utility::nextmission();
    }
}

spawn_enemies( var_0 )
{
    if ( getdvar( "ac130_gameplay_enabled" ) == "0" )
        return;

    var_1 = getent( var_0, "script_noteworthy" );
    var_1 notify( "trigger" );
}

stop_enemies( var_0 )
{
    if ( getdvar( "ac130_gameplay_enabled" ) == "0" )
        return;

    var_1 = getent( var_0, "script_noteworthy" );
    thread maps\_spawner::kill_spawnernum( var_1.script_killspawner_group );
}

spawn_friendlies( var_0 )
{
    var_1 = getentarray( var_0, "targetname" );
    level.friendlies = [];

    for ( var_2 = 0; var_2 < var_1.size; var_2++ )
    {
        var_3 = var_1[var_2] stalingradspawn();

        if ( !maps\_utility::spawn_failed( var_3 ) )
            level.friendlies[level.friendlies.size] = var_3;
    }

    common_scripts\utility::array_thread( level.friendlies, maps\ac130::friendly_health_init );
    common_scripts\utility::array_thread( level.friendlies, maps\_ac130::mission_fail_casualties );
    common_scripts\utility::array_thread( level.friendlies, maps\_ac130::debug_friendly_count );
    common_scripts\utility::array_thread( level.friendlies, maps\_ac130::add_beacon_effect );
}

spawn_ac130_vehicle( var_0 )
{
    var_1 = getent( var_0, "targetname" );
    var_1 notify( "trigger" );
}

move_friendlies( var_0 )
{
    var_1 = getent( var_0, "targetname" );

    if ( common_scripts\utility::flag( "ignore_friendly_move_commands" ) )
        return;

    var_1 notify( "trigger" );
}

damage_church()
{
    if ( getdvar( "ac130_gameplay_enabled" ) == "0" )
        return;

    for (;;)
    {
        self waittill( "damage", var_0, var_1, var_2, var_3, var_4 );

        if ( !isplayer( var_1 ) )
            continue;

        if ( issubstr( tolower( var_4 ), "splash" ) )
            continue;

        if ( !common_scripts\utility::flag( "mission_failed" ) )
            break;
    }

    thread missionfail_church();
}

autosavefriendlycountcheck( var_0 )
{
    if ( level.friendlycount >= level.minimumautosavefriendlycount )
        thread maps\_utility::autosave_by_name( var_0 );
}

missionfail_church()
{
    if ( common_scripts\utility::flag( "mission_failed" ) )
        return;

    common_scripts\utility::flag_set( "mission_failed" );
    setdvar( "ui_deadquote", "@AC130_CHURCH_DAMAGED" );
    maps\_utility::missionfailedwrapper();
}

mission_fail_vehicle_death()
{
    level endon( "getaway_vehicles_unloaded" );
    self waittill( "death", var_0 );

    if ( common_scripts\utility::flag( "mission_failed" ) )
        return;

    if ( isdefined( var_0 ) && isplayer( var_0 ) )
    {
        common_scripts\utility::flag_set( "mission_failed" );
        setdvar( "ui_deadquote", "@AC130_FRIENDLY_FIRE" );
        maps\_utility::missionfailedwrapper();
    }
    else
    {
        common_scripts\utility::flag_set( "mission_failed" );
        setdvar( "ui_deadquote", "@AC130_FRIENDLIES_DEAD" );
        maps\_utility::missionfailedwrapper();
    }
}

hintprint( var_0, var_1 )
{
    thread maps\_utility::hint( var_0, undefined, undefined, var_1 );
    wait(level.hintprintduration);
    maps\_utility::hint_fade( 0.5 );
}

getenemiesinzone( var_0 )
{
    var_1 = getent( var_0, "targetname" );
    var_2 = getaiarray( "axis" );
    var_3 = [];

    for ( var_4 = 0; var_4 < var_2.size; var_4++ )
    {
        if ( !var_2[var_4] istouching( var_1 ) )
            continue;

        var_3[var_3.size] = var_2[var_4];
    }

    return var_3;
}

level_scripted_unloadnode()
{
    self waittill( "trigger", var_0 );
    var_0 setcontents( 0 );
    var_0.dontdisconnectpaths = 1;
    var_0 maps\_utility::vehicle_detachfrompath();
    var_0 vehicle_setspeed( 20, 20 );
    var_0 maps\_utility::vehicle_land();

    if ( !isdefined( level.friendlies_told_to_load_choppers ) )
    {
        level.friendlies_told_to_load_choppers = 1;
        thread friendlies_into_choppers();
    }

    var_1 = [];

    for ( var_2 = 0; var_2 < var_0.riders.size; var_2++ )
    {
        if ( !isdefined( var_0.riders[var_2] ) )
            continue;

        if ( !isdefined( var_0.riders[var_2].vehicle_position ) )
            continue;

        if ( var_0.riders[var_2].vehicle_position >= 1 && var_0.riders[var_2].vehicle_position <= 4 )
            var_1[var_1.size] = var_0.riders[var_2];
    }

    var_0 notify( "unload" );
    var_0 maps\_utility::ent_flag_wait( "unloaded" );
    common_scripts\utility::array_thread( var_1, maps\_ac130::add_beacon_effect, "friendlies_in_choppers" );
    common_scripts\utility::flag_wait( "friendlies_in_choppers" );
    wait(randomfloatrange( 1.0, 5.0 ));
    var_0 thread seaknight_doors();
    var_0 thread maps\_vehicle::vehicle_load_ai( maps\_utility::array_removedead( var_1 ) );
    thread missionendfailsafe();
    var_0 maps\_utility::ent_flag_wait( "loaded" );
    wait 1.5;
    var_0 maps\_utility::vehicle_resumepath();
    var_3 = getaiarray( "axis" );
    common_scripts\utility::array_thread( var_3, ::attack_fleeing_helicopter, var_0 );
    wait 5;
    common_scripts\utility::flag_set( "choppers_flew_away" );
}

attack_fleeing_helicopter( var_0 )
{
    self endon( "death" );

    for (;;)
    {
        wait(randomfloatrange( 0.5, 2.5 ));
        animscripts\shoot_behavior::setshootstyle( "burst", 0 );
        self shoot( randomfloatrange( 0.2, 1.0 ), var_0.origin );
    }
}

seaknight_doors()
{
    if ( !isdefined( level.seaknight_doors_close_anim ) )
        level.seaknight_doors_close_anim = level.vehicle_aianims["script_vehicle_ch46e_opened_door"][1].vehicle_getinanim;

    level.vehicle_aianims["script_vehicle_ch46e_opened_door"][1].vehicle_getinanim = undefined;
    maps\_utility::ent_flag_wait( "loaded" );
    self setanimknobrestart( level.seaknight_doors_close_anim, 1, 0, 1 );
}

missionendfailsafe()
{
    wait 120;
    common_scripts\utility::flag_set( "choppers_flew_away" );
}

friendlies_into_choppers()
{
    common_scripts\utility::flag_set( "ignore_friendly_move_commands" );
    level notify( "stop_casualty_tracking" );
    var_0[0] = getnode( "chopper_ai_node1", "targetname" );
    var_0[1] = getnode( "chopper_ai_node2", "targetname" );
    var_1 = 1;
    level.friendlies_not_in_chopper = 0;

    for ( var_2 = 0; var_2 < level.friendlies.size; var_2++ )
    {
        if ( !isdefined( level.friendlies[var_2] ) )
            continue;

        if ( !isalive( level.friendlies[var_2] ) )
            continue;

        if ( var_1 == 0 )
            var_1 = 1;
        else if ( var_1 == 1 )
            var_1 = 0;

        level.friendlies[var_2] thread friendly_run_into_chopper( var_0[var_1] );
    }

    common_scripts\utility::flag_set( "friendlies_moving_to_choppers" );

    while ( level.friendlies_not_in_chopper > 0 )
        wait 0.05;

    common_scripts\utility::flag_set( "friendlies_in_choppers" );
}

friendly_run_into_chopper( var_0 )
{
    self endon( "death" );
    level.friendlies_not_in_chopper++;
    self.fixednode = 0;
    self.a.disablepain = 1;
    self.ignoreme = 1;
    self.ignoreall = 1;
    self.maxsightdistsqrd = 0;
    self.ignoresuppression = 1;
    thread maps\_utility::ignoreallenemies( 1 );
    self setcandamage( 0 );
    self.goalradius = 32;
    self setgoalnode( var_0 );
    self waittill( "goal" );

    if ( isdefined( self.magic_bullet_shield ) )
        maps\_utility::stop_magic_bullet_shield();

    self notify( "boarded_chopper" );
    level.friendlies_not_in_chopper--;
    waittillframeend;
    self delete();
}

friendly_run_into_chopper_death_handler()
{
    self endon( "boarded_chopper" );
    self waittill( "death" );
    level.friendlies_not_in_chopper--;
}

friendly_fire_vehicle_thread()
{
    level endon( "getaway_vehicles_unloaded" );

    for (;;)
    {
        self waittill( "damage", var_0, var_1 );

        if ( !isdefined( var_1 ) )
            continue;

        if ( !isplayer( var_1 ) )
            continue;

        if ( common_scripts\utility::flag( "mission_failed" ) )
            return;

        common_scripts\utility::flag_set( "mission_failed" );

        if ( common_scripts\utility::flag( "friendlies_loading_vehicles" ) )
            setdvar( "ui_deadquote", "@AC130_FRIENDLY_FIRE" );
        else
            setdvar( "ui_deadquote", "@AC130_CIVILIAN_FIRE_VEHICLE" );

        maps\_utility::missionfailedwrapper();
    }
}

helicopter_driver_beacons( var_0 )
{
    var_1 = maps\_vehicle::waittill_vehiclespawn( var_0 );

    for ( var_2 = 0; var_2 < var_1.riders.size; var_2++ )
    {
        if ( var_1.riders[var_2].vehicle_position == 0 || var_1.riders[var_2].vehicle_position == 5 )
            var_1.riders[var_2] thread maps\_ac130::add_beacon_effect( undefined, 1 );
    }
}

helictoper_friendly_fire( var_0 )
{
    var_1 = maps\_vehicle::waittill_vehiclespawn( var_0 );

    for (;;)
    {
        var_1 waittill( "damage", var_2, var_3 );

        if ( !isdefined( var_3 ) )
            continue;

        if ( !isplayer( var_3 ) )
            continue;

        if ( common_scripts\utility::flag( "mission_failed" ) )
            return;

        common_scripts\utility::flag_set( "mission_failed" );
        setdvar( "ui_deadquote", "@AC130_FRIENDLY_FIRE_HELICOPTER" );
        maps\_utility::missionfailedwrapper();
    }
}

resetplayerkillcount()
{
    level.enemieskilledbyplayer = 0;
}

waitforplayerkillcount( var_0 )
{
    while ( level.enemieskilledbyplayer < var_0 )
        wait 1;
}

civilian_car_riders_spawn_and_idle()
{
    var_0 = getentarray( "civilian_car_rider", "targetname" );
    thread civilian_car_riders_spawn_and_idle_start( level.getaway_vehicle_1, var_0[0], "civiliandriver_car1" );
    thread civilian_car_riders_spawn_and_idle_start( level.getaway_vehicle_2, var_0[1], "civiliandriver_car2" );
}

civilian_car_riders_spawn_and_idle_start( var_0, var_1, var_2 )
{
    var_0.edriver = var_1 stalingradspawn();
    maps\_utility::spawn_failed( var_0.edriver );
    var_0.edriver maps\_utility::gun_remove();
    var_0.edriver.ignoreme = 1;
    var_0.edriver.ignoreall = 1;
    var_0.edriver.maxsightdistsqrd = 0;
    var_0.edriver.ignoresuppression = 1;
    var_0.edriver thread maps\_utility::ignoreallenemies( 1 );
    var_0.edriver.civilian = 1;
    var_0.edriver.melonhead_ignore = 1;
    var_0.edriver.tracksuit_ignore = 1;
    var_0.edriver.animname = var_2;
    var_0.edriver maps\_utility::set_run_anim( "runaway", 1, 1 );
    var_0.edriver linkto( var_0 );
    var_0.edriver.animname = var_2;
    var_0.edriver thread maps\_anim::anim_loop_solo( var_0.edriver, "idle", "tag_driver", "stop_idle", var_0 );
    var_0.edriver thread civilian_car_riders_mission_fail();
    var_0.edriver endon( "death" );
    var_0.edriver waittill( "goal" );
    var_0.edriver delete();
}

civilian_car_riders_mission_fail()
{
    self endon( "goal" );

    while ( isdefined( self ) && isalive( self ) )
    {
        self waittill( "damage", var_0, var_1 );

        if ( !isdefined( var_1 ) )
            continue;

        if ( !isplayer( var_1 ) )
            continue;

        if ( common_scripts\utility::flag( "mission_failed" ) )
            return;

        common_scripts\utility::flag_set( "mission_failed" );
        setdvar( "ui_deadquote", "@AC130_CIVILIAN_FIRE" );
        maps\_utility::missionfailedwrapper();
    }
}

hijack_friendlies_force_position()
{
    self endon( "hijack_friendlies_in_position" );
    wait 15;
    self forceteleport( self.goalpos );
}

do_hijack( var_0, var_1, var_2, var_3 )
{
    common_scripts\utility::array_thread( var_1, maps\ac130::dontshoot, 1 );
    var_0 disconnectpaths();
    common_scripts\utility::array_thread( var_1, ::hijack_friendlies_force_position );
    var_0 maps\_anim::anim_reach( var_1, "hijack", "tag_detach", undefined, var_0 );
    maps\_utility::array_notify( var_1, "hijack_friendlies_in_position" );
    common_scripts\utility::array_thread( var_1, ::do_car_idle_after_hijack, var_0 );
    var_0.edriver notify( "stop_idle" );
    var_0.edriver unlink();
    var_4 = [];
    var_5 = [];

    for ( var_6 = 0; var_6 < var_1.size; var_6++ )
    {
        if ( var_6 == 0 )
        {
            var_4[var_4.size] = var_1[var_6];
            continue;
        }

        var_5[var_5.size] = var_1[var_6];
    }

    var_4[var_4.size] = var_0.edriver;
    var_0 thread maps\_anim::anim_single( var_4, "hijack", "tag_detach", undefined, var_0 );
    var_0 thread hijack_driver_flee();
    var_0 thread do_hijack_vehicle_anim( var_2 );
    var_4[0] waittill( "others_hijack_start" );
    var_0 thread do_hijack_vehicle_anim( var_3 );
    var_0 maps\_anim::anim_single( var_5, "hijack", "tag_detach", undefined, var_0 );
    var_0 notify( "hijack_done" );
    common_scripts\utility::array_thread( var_1, maps\ac130::dontshoot, 0 );
}

hijack_driver_flee()
{
    if ( self.edriver.animname == "civiliandriver_car2" )
        return;

    self.edriver waittillmatch( "single anim", "end" );
    self.edriver maps\_anim::anim_single_queue( self.edriver, "runaway" );
    var_0 = getnode( self.edriver.target, "targetname" );
    self.edriver stopanimscripted();
    self.edriver setgoalnode( var_0 );
}

do_hijack_others( var_0 )
{
    var_0 notify( "others_hijack_start" );
}

#using_animtree("vehicles");

do_hijack_vehicle_anim( var_0 )
{
    self useanimtree( #animtree );
    self setanim( var_0 );
}

do_car_idle_after_hijack( var_0 )
{
    self waittillmatch( "single anim", "end" );
    self linkto( var_0 );
    var_0 thread maps\_anim::anim_loop_solo( self, "idle", self.sittag, "stop_idle", var_0 );
    var_0 waittill( "getout" );
    maps\_utility::set_force_color( "r" );
    var_0 maps\_anim::anim_single_solo( self, "getout", self.sittag, undefined, var_0 );
    self unlink();
}

sim_destruction()
{
    if ( !isdefined( self.script_noteworthy ) )
        return;

    thread trigger_40mm_hit_timeframe();

    for (;;)
    {
        self waittill( "damage", var_0, var_1, var_2, var_3, var_4 );

        if ( !isdefined( level.credits_active ) )
        {
            if ( !isplayer( var_1 ) )
                continue;
        }

        if ( var_0 >= 999 )
            common_scripts\_exploder::exploder( self.script_noteworthy );

        if ( var_0 == 990 )
        {
            self notify( "40mm_damage" );
            continue;
        }

        if ( var_0 < 990 )
            continue;

        break;
    }

    self delete();
}

destructible_building()
{
    var_0 = getentarray( self.target, "targetname" );
    var_1 = [];
    var_2 = [];
    var_3 = undefined;

    for ( var_4 = 0; var_4 < var_0.size; var_4++ )
    {
        if ( var_0[var_4].classname == "script_origin" )
        {
            var_3 = var_0[var_4];
            continue;
        }

        var_5 = getentarray( var_0[var_4].target, "targetname" );

        for ( var_6 = 0; var_6 < var_5.size; var_6++ )
        {
            if ( isdefined( var_5[var_6].script_noteworthy ) && var_5[var_6].script_noteworthy == "exploderchunk" )
            {
                var_2[var_2.size] = var_5[var_6];
                continue;
            }

            var_1[var_1.size] = var_5[var_6];
        }
    }

    for ( var_4 = 0; var_4 < var_0.size; var_4++ )
        var_0[var_4] hide();

    for ( var_4 = 0; var_4 < var_2.size; var_4++ )
        var_2[var_4] hide();

    thread trigger_40mm_hit_timeframe();

    for (;;)
    {
        self waittill( "damage", var_7, var_8, var_9, var_10, var_11 );

        if ( !isdefined( level.credits_active ) )
        {
            if ( !isplayer( var_8 ) )
                continue;
        }

        if ( issubstr( tolower( var_11 ), "splash" ) )
            continue;

        if ( var_7 == 990 )
        {
            self notify( "40mm_damage" );
            continue;
        }

        if ( var_7 < 990 )
            continue;

        break;
    }

    thread maps\_utility::arcademode_kill( self.origin, "explosive", 1000 );

    for ( var_4 = 0; var_4 < var_0.size; var_4++ )
        var_0[var_4] show();

    if ( var_7 == 1000 )
    {
        for ( var_4 = 0; var_4 < var_2.size; var_4++ )
        {
            var_2[var_4] show();
            var_12 = var_2[var_4].origin;
            var_13 = var_2[var_4].angles;
            var_14 = getent( var_2[var_4].target, "targetname" );
            var_15 = var_14.origin - var_12;
            var_16 = var_15[0];
            var_17 = var_15[1];
            var_18 = var_15[2];
            var_2[var_4] rotatevelocity( ( var_16, var_17, var_18 ), 12 );
            var_2[var_4] movegravity( ( var_16, var_17, var_18 ), 12 );
            thread maps\_utility::delaythread( 12, maps\_utility::self_delete );
        }
    }

    for ( var_4 = 0; var_4 < var_1.size; var_4++ )
    {
        var_19 = -20 + randomfloat( 40 );
        var_20 = -5 + randomfloat( 10 );
        var_21 = -20 + randomfloat( 40 );
        var_22 = 5.0;
        var_23 = 2.0;
        var_24 = 2.0;
        var_1[var_4] moveto( var_1[var_4].origin - ( 0.0, 0.0, 512.0 ), var_22, var_23, var_24 );
        var_1[var_4] rotateto( var_1[var_4].angles + ( var_19, var_20, var_21 ), var_22 / 2, var_23 / 2, var_24 / 2 );
        var_1[var_4] thread maps\_utility::delaythread( 5.0, maps\_utility::self_delete );
    }

    self delete();
}

trigger_40mm_hit_timeframe()
{
    self endon( "deleting" );
    var_0 = 4.0;
    var_1 = 2;

    for (;;)
    {
        self waittill( "40mm_damage" );
        thread trigger_40mm_hit_timeframe_wait( var_0, var_1 );
    }
}

trigger_40mm_hit_timeframe_wait( var_0, var_1 )
{
    self endon( "deleting" );
    var_2 = gettime();
    var_1--;

    for ( var_3 = 0; var_3 < var_1; var_3++ )
        self waittill( "40mm_damage" );

    var_4 = gettime();
    var_5 = var_4 - var_2;

    if ( var_5 <= var_0 * 1000 )
    {
        self notify( "damage", 999, level.player, undefined, undefined, "MOD_PROJECTILE" );
        self notify( "deleting" );
    }
}

get_exploder_anim_name()
{
    var_0 = undefined;
    var_1 = strtok( self.targetname, ":;, " );

    if ( var_1.size > 1 && isdefined( var_1[1] ) )
        var_0 = var_1[1];
    else
        var_0 = self.model + "_anim";

    return var_0;
}

get_exploderanimhides_in_array( var_0 )
{
    var_1 = [];

    foreach ( var_3 in level.exploders[var_0] )
    {
        if ( isdefined( var_3.targetname ) && issubstr( var_3.targetname, "exploderanimhide" ) )
            var_1[var_1.size] = var_3;
    }

    return var_1;
}

exploderanimhide_setup()
{
    level.ac130_exploder_finalstates = [ "h1_ac130_1story_final", "h1_ac130_1story_house_d_final", "h1_ac130_2story_house_d_final", "h1_ac130_2story_d_final", "h1_ac130_barn_sm_final", "h1_ac130_crane_final", "h1_ac130_l2story_final", "h1_ac130_shed_sm_final", "h1_ac130_watertower_final" ];

    foreach ( var_1 in level.ac130_exploder_finalstates )
        precachemodel( var_1 );

    foreach ( var_4 in getarraykeys( level.exploders ) )
    {
        var_5 = get_exploderanimhides_in_array( var_4 );

        if ( isdefined( var_5 ) && var_5.size > 0 )
            thread exploderanimhide_think( var_5 );
    }
}

exploderanimhide_think( var_0 )
{
    var_1 = var_0[0];
    var_1 waittill( "play_exploder_anim" );
    wait 0.1;
    var_2 = var_1 get_exploder_anim_name();

    if ( isdefined( var_2 ) && common_scripts\utility::array_contains( getarraykeys( level.scr_anim["exploder_script_model"] ), var_2 ) )
    {
        var_3 = level.scr_anim["exploder_script_model"][var_2];
        var_4 = getanimlength( var_3 );
        wait(var_4);
        var_5 = getsubstr( var_1.model, 0, var_1.model.size - 1 ) + "_final";

        if ( common_scripts\utility::array_contains( level.ac130_exploder_finalstates, var_5 ) )
        {
            var_6 = spawn( "script_model", var_1.origin );
            var_6 hide();
            var_6 setmodel( var_5 );
            var_6.angles = var_1.angles;
            var_6 show();

            foreach ( var_8 in var_0 )
                var_8 delete();
        }
        else
        {

        }
    }
}
