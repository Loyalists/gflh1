// H1 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

print3dthreadzip( var_0 )
{
    self notify( "stop_3dprint" );
    self endon( "stop_3dprint" );
    self endon( "death" );

    for (;;)
    {
        if ( isdefined( self ) )
        {

        }

        wait 0.05;
    }
}

bm21_think( var_0 )
{
    var_1 = maps\_vehicle::spawn_vehicle_from_targetname( var_0 );
    var_1 thread bm21_artillery_think();
    var_1 thread bm21_hill_artillery_think();
}

bm21_artillery_think()
{
    self endon( "death" );
    var_0 = [];
    var_1 = strtok( self.script_linkto, " " );

    for ( var_2 = 0; var_2 < var_1.size; var_2++ )
        var_0[var_0.size] = getent( var_1[var_2], "script_linkname" );

    var_0 = common_scripts\utility::array_randomize( var_0 );
    self setturrettargetent( var_0[0] );
    self waittill( "turret_rotate_stopped" );
    common_scripts\utility::flag_wait( "bm21s_attack" );
    var_3 = [];
    var_3["bm21_01"] = 0;
    var_3["bm21_02"] = 2.2;
    var_3["bm21_03"] = 3.4;
    wait(var_3[self.vehicle_spawner.targetname]);

    for ( var_2 = 0; var_2 < var_0.size; var_2++ )
    {
        var_4 = 5;

        for ( var_5 = 0; var_5 < var_4; var_5++ )
        {
            self setturrettargetent( var_0[var_2] );
            self notify( "shoot_target", var_0[var_2] );
            wait 0.45;
        }

        wait(randomfloatrange( 0.3, 0.7 ));
    }

    for (;;)
    {
        common_scripts\utility::flag_wait( "bm21s_fire" );
        bm21_fires_until_flagged( var_0 );
    }
}

bm21_hill_artillery_think()
{
    level endon( "bm21s_attack" );
    var_0 = [];
    var_1 = strtok( self.script_linkto, " " );

    for ( var_2 = 0; var_2 < var_1.size; var_2++ )
        var_0[var_0.size] = getent( var_1[var_2], "script_linkname" );

    common_scripts\utility::flag_wait( "bm21_hill_artillery_start" );
    var_3 = [];
    var_3["bm21_01"] = 1;
    var_3["bm21_02"] = 0;
    var_3["bm21_03"] = 2;
    wait(var_3[self.vehicle_spawner.targetname]);

    for ( var_2 = 0; var_2 < var_0.size; var_2++ )
    {
        var_4 = 3;

        for ( var_5 = 0; var_5 < var_4; var_5++ )
        {
            self setturrettargetent( var_0[var_2] );
            self notify( "shoot_target", var_0[var_2] );
            wait 0.45;
        }

        wait(randomfloatrange( 0.3, 0.7 ));
    }
}

bm21_fires_until_flagged( var_0 )
{
    level endon( "bm21s_fire" );
    var_0 = common_scripts\utility::array_randomize( var_0 );
    wait(randomfloatrange( 2, 3 ));

    for ( var_1 = 0; var_1 < var_0.size; var_1++ )
    {
        var_2 = 2 + randomint( 2 );

        for ( var_3 = 0; var_3 < var_2; var_3++ )
        {
            if ( var_3 == 0 )
            {
                self setturrettargetent( var_0[var_1] );
                self waittill( "turret_rotate_stopped" );
                wait 1;
            }

            self notify( "shoot_target", var_0[var_1] );
            wait 0.25;
        }
    }
}

die_soon()
{
    self endon( "death" );
    wait(randomfloatrange( 0.5, 1.5 ));
    maps\_utility::die();
}

kill_player()
{
    self endon( "death" );
    self.baseaccuracy = 10;
    self.goalradius = 256;

    for (;;)
    {
        self setgoalpos( level.player.origin );
        wait 2;
    }
}

second_shack_trigger()
{
    self waittill( "trigger" );
    thread chess_guys();
    thread sleepy_shack();
    common_scripts\utility::flag_set( "second_shacks" );
}

sleepy_shack()
{
    var_0 = getentarray( "shack_guy", "targetname" );
    common_scripts\utility::array_thread( var_0, maps\_utility::spawn_ai );
    var_1 = getent( "shack_light", "targetname" );
    var_2 = var_1 getlightintensity();
    var_1 setlightintensity( 0 );
    common_scripts\utility::flag_wait( "second_shacks" );
    common_scripts\utility::flag_wait( "high_alert" );
    wait 1.5;
    var_3 = getent( "sleep_alert_trigger", "targetname" );

    if ( level.player istouching( var_3 ) )
        return;

    var_4 = getent( "shack_lightbulb", "targetname" );

    if ( isdefined( var_4 ) )
        var_4 setmodel( "dt_light_on_hunted" );

    var_5 = 2;
    var_5 *= 20;

    for ( var_6 = 0; var_6 < var_5; var_6++ )
    {
        var_7 = var_2 * 1 / ( var_5 - var_6 );
        var_7 *= randomfloatrange( 0.3, 1.7 );
        var_1 setlightintensity( var_7 );
        wait 0.05;
    }

    var_1 setlightintensity( var_2 );
}

guy_stops_animating_on_high_alert( var_0, var_1, var_2 )
{
    self endon( "death" );
    level waittill( "high_alert" );
    var_0 notify( "stop_loop" );

    if ( isdefined( var_2 ) )
        return;

    if ( isdefined( var_1 ) )
        maps\_anim::anim_generic( self, var_1 );
    else
        self stopanimscripted();
}

chess_guys_drop_weapon()
{
    var_0 = spawn( "script_model", ( 0.0, 0.0, 0.0 ) );
    var_0 setmodel( "weapon_" + self.weapon );
    var_0 linkto( self, "TAG_WEAPON_RIGHT", ( 0.0, 0.0, 0.0 ), ( 0.0, 0.0, 0.0 ) );
    wait 1;
    var_0 unlink();
    maps\_utility::gun_remove();
    common_scripts\utility::waittill_either( "stop_loop", "death" );

    if ( isalive( self ) )
        maps\_utility::gun_recall();

    var_0 delete();
}

chess_guys()
{
    var_0 = maps\_utility::get_guy_with_script_noteworthy_from_spawner( "chess_guy_1" );
    var_1 = maps\_utility::get_guy_with_script_noteworthy_from_spawner( "chess_guy_2" );
    var_0.flashbangstopsscriptedanim = 1;
    var_1.flashbangstopsscriptedanim = 1;

    if ( common_scripts\utility::flag( "high_alert" ) )
        return;

    level._stealth.logic.ai_event["ai_eventDistBullet"] = [];
    level._stealth.logic.ai_event["ai_eventDistBullet"]["spotted"] = getdvar( "ai_eventDistBullet" );
    level._stealth.logic.ai_event["ai_eventDistBullet"]["alert"] = 200;
    level._stealth.logic.ai_event["ai_eventDistBullet"]["hidden"] = 200;
    maps\_stealth_logic::stealth_detect_ranges_set( undefined, undefined, undefined );
    var_0.animname = "chess_guy1";
    var_1.animname = "chess_guy2";
    var_2 = [];
    var_2[var_2.size] = var_0;
    var_2[var_2.size] = var_1;
    common_scripts\utility::array_thread( var_2, maps\_utility::set_deathanim, "death" );
    common_scripts\utility::array_thread( var_2, maps\_utility::set_allowdeath, 1 );
    var_3 = getent( "chess_ent", "targetname" );
    var_4 = spawn( "script_origin", var_3.origin );
    var_4.angles = var_3.angles;
    var_3 thread maps\_stealth_logic::stealth_ai_idle_and_react( var_0, "idle_1", "surprise_1" );
    var_4 thread maps\_stealth_logic::stealth_ai_idle_and_react( var_1, "idle_2", "surprise_2" );
    common_scripts\utility::array_thread( var_2, ::alert_on_grenade_body_impact );
    common_scripts\utility::array_thread( var_2, ::chess_guys_drop_weapon );

    foreach ( var_6 in var_2 )
        var_6 thread wait_to_investigate( var_2 );
}

wait_to_investigate( var_0 )
{
    maps\_utility::add_wait( ::player_got_close );
    maps\_utility::add_wait( maps\_utility::waittill_msg, "death" );
    maps\_utility::add_wait( maps\_utility::waittill_msg, "stop_loop" );
    maps\_utility::do_wait_any();
    var_0 = maps\_utility::remove_dead_from_array( var_0 );
    maps\_utility::clear_deathanim();
    chess_guys_investigate();
}

player_got_close()
{
    self endon( "death" );

    for (;;)
    {
        if ( distance( level.player.origin, self.origin ) < 46 )
            return;

        wait 0.05;
    }
}

chess_guys_investigate()
{
    self notify( "event_awareness", "explosion" );

    if ( !isdefined( self.target ) )
        return;

    var_0 = getnode( self.target, "targetname" );
    self setgoalnode( var_0 );
    self.goalradius = var_0.radius;
}

meeting_reach_think( var_0, var_1, var_2 )
{
    self endon( "death" );
    var_0 maps\_anim::anim_reach_and_arrive_facing_anim_solo( self, "meeting" );
    common_scripts\utility::flag_set( var_1 );
}

chess_guy_init( var_0 )
{
    self.allowdeath = 1;
    thread custom_stealth_ai();
    thread guy_stops_animating_on_high_alert( var_0, undefined, 1 );
}

descriptions()
{
    var_0 = getentarray( "description", "targetname" );

    for ( var_1 = 0; var_1 < var_0.size; var_1++ )
        var_0[var_1] thread print3dthreadzip( var_0[var_1].script_noteworthy );
}

aa_town_init()
{
    thread bm21_spawn_and_think();
}

bm21_spawn_and_think()
{
    common_scripts\utility::flag_set( "bm21s_fire" );
    var_0 = [];
    var_0[var_0.size] = "bm21_01";
    var_0[var_0.size] = "bm21_02";
    var_0[var_0.size] = "bm21_03";

    for ( var_1 = 0; var_1 < var_0.size; var_1++ )
        thread bm21_think( var_0[var_1] );
}

empty( var_0 )
{

}

custom_stealth_ai()
{
    var_0 = [];
    var_1 = [];
    thread maps\_stealth_logic::stealth_ai( undefined, var_1, undefined, var_0 );
}

enemy_attacks( var_0 )
{
    self endon( "death" );
    self endon( "pain_death" );
    thread maps\_stealth_behavior::enemy_announce_spotted( self.origin );
    self.goalradius = 2048;
}

enemy_hears_explosion( var_0 )
{
    var_1 = "_stealth_behavior_whizby_" + randomint( 5 );
    maps\_utility::ent_flag_set( "_stealth_behavior_first_reaction" );
    maps\_utility::ent_flag_set( "_stealth_behavior_reaction_anim" );
    self stopanimscripted();
    self notify( "stop_animmode" );
    self notify( "end_patrol" );
    waittillframeend;
    self.allowdeath = 1;
    maps\_anim::anim_generic_custom_animmode( self, "gravity", "bored_alert" );
    maps\_utility::ent_flag_clear( "_stealth_behavior_reaction_anim" );
    self.goalradius = 1024;
}

enemy_awareness_reaction_whizby( var_0 )
{
    self endon( "death" );
    var_1 = self._stealth.logic.event.awareness[var_0];

    if ( maps\_utility::ent_flag( "_stealth_behavior_first_reaction" ) )
        return;

    var_2 = "_stealth_behavior_whizby_" + randomint( 5 );
    maps\_utility::ent_flag_set( "_stealth_behavior_first_reaction" );
    maps\_utility::ent_flag_set( "_stealth_behavior_reaction_anim" );
    self stopanimscripted();
    self notify( "stop_animmode" );
    self notify( "end_patrol" );
    waittillframeend;
    self.allowdeath = 1;
    maps\_anim::anim_generic_custom_animmode( self, "gravity", self.stealth_whizby_reaction );
    maps\_utility::ent_flag_clear( "_stealth_behavior_reaction_anim" );
}

hut_think()
{
    maps\_utility::set_generic_run_anim( "casual_patrol_walk" );
    custom_stealth_ai();
    self.disablearrivals = 1;
}

pier_trigger_think()
{
    self waittill( "trigger", var_0 );
    var_0.allowdeath = 1;
    var_0 thread maps\_anim::anim_generic( var_0, "smoke" );
    var_0 endon( "death" );
    var_0 waittill( "damage" );
    var_0 stopanimscripted();
}

reach_and_idle_relative_to_target( var_0, var_1, var_2 )
{
    var_3 = getent( self.target, "targetname" );
    var_3 thread maps\_stealth_logic::stealth_ai_reach_idle_and_react( self, var_0, var_1, var_2 );
}

idle_relative_to_target( var_0, var_1 )
{
    var_2 = getent( self.target, "targetname" );
    var_2 thread maps\_stealth_logic::stealth_ai_idle_and_react( self, var_0, var_1 );
}

hut_sentry()
{

}

signal_stop()
{
    self waittill( "trigger", var_0 );

    if ( common_scripts\utility::flag( "high_alert" ) )
        return;

    var_0 maps\_utility::handsignal( "stop" );
}

bored_guy()
{
    self endon( "death" );
    var_0 = getent( self.target, "targetname" );
    var_0 thread maps\_anim::anim_generic_loop( self, "bored_idle", undefined, "stop_idle" );
    common_scripts\utility::flag_wait( "high_alert" );
    var_0 notify( "stop_idle" );
    self stopanimscripted();
}

hut_tv()
{
    if ( getdvarint( "use_old_bbc_voice" ) )
        thread bbc_voice_preh1();

    var_0 = getent( "interactive_tv_light", "targetname" );
    var_0 thread maps\_lights::television();
    var_1 = common_scripts\utility::getclosest( var_0.origin, getentarray( "interactive_tv", "targetname" ), 500 );
    var_1 waittill( "off" );
    var_0 notify( "light_off" );
    var_0 setlightintensity( 0 );

    if ( getdvarint( "use_old_bbc_voice" ) )
    {
        level.bbc_voice stopsounds();
        level.bbc_voice notify( "stopsounds" );
        wait 0.05;
        level.bbc_voice delete();
    }
}

bbc_voice_preh1()
{
    var_0 = spawn( "script_origin", ( -13630.8, -8353.29, 28.5023 ) );
    var_0 endon( "death" );
    var_0 endon( "stopsounds" );
    level.bbc_voice = var_0;
    var_1 = [];
    var_1[var_1.size] = "blackout_bbc_lessthanday";
    var_1[var_1.size] = "blackout_bbc_foreigninterest";
    var_1[var_1.size] = "blackout_bbc_exacttime";
    var_2 = 0;

    for (;;)
    {
        var_0 playsound( var_1[var_2], "done" );
        var_0 waittill( "done" );
        wait(randomfloatrange( 1, 2 ));
        var_2++;

        if ( var_2 >= var_1.size )
            var_2 = 0;
    }
}

bbc_voice()
{
    if ( self.model != "com_tv1" )
        return;

    var_0 = [];
    var_0[var_0.size] = "blackout_bbc_lessthanday";
    var_0[var_0.size] = "blackout_bbc_foreigninterest";
    var_0[var_0.size] = "blackout_bbc_exacttime";
    var_1 = -1;
    var_2 = spawn( "script_origin", self.origin );
    var_2 endon( "death" );
    thread monitor_bbc_stop( var_2 );
    var_3 = 810000;
    var_4 = 0;

    for (;;)
    {
        var_5 = distancesquared( level.player.origin, self.origin );

        if ( var_5 > var_3 )
        {
            var_4 = 0;
            wait 0.1;
            continue;
        }

        if ( !var_4 )
        {
            var_2 thread maps\_utility::notify_delay( "play_bbc", 0.1 );
            var_4 = 1;
        }

        var_6 = var_2 common_scripts\utility::waittill_any_return( "done", "play_bbc" );

        switch ( var_6 )
        {
            case "play_bbc":
                var_1 = ( var_1 + 1 ) % var_0.size;
                var_2 playsound( var_0[var_1], "done" );
                continue;
            case "done":
                var_2 thread maps\_utility::notify_delay( "play_bbc", randomfloatrange( 1, 2 ) );
                continue;
        }
    }
}

monitor_bbc_stop( var_0 )
{
    for (;;)
    {
        var_1 = common_scripts\utility::waittill_any_return( "off", "death" );

        switch ( var_1 )
        {
            case "off":
                if ( self.model != self.offmodel )
                    var_0 scalevolume( 0, 0.1 );
                else
                    var_0 scalevolume( 1, 0.1 );

                continue;
            case "death":
                var_0 stopsounds();
                var_0 notify( "death" );
                wait 0.5;
                var_0 delete();
                return;
        }
    }
}

friendly_think()
{
    self.maxvisibledist = 480;
    self.ignoreme = 1;

    for (;;)
    {
        self.ignoreall = 1;
        common_scripts\utility::flag_wait_either( "high_alert", "recent_flashed" );
        wait 0.5;
        self.ignoreme = 0;

        if ( !isdefined( self.force_ignoreall ) )
            self.ignoreall = 0;

        common_scripts\utility::flag_waitopen( "high_alert" );
        common_scripts\utility::flag_waitopen( "recent_flashed" );
    }
}

shack_sleeper()
{
    self.allowdeath = 1;
    thread alert_on_grenade_body_impact();
    self.flashbangstopsscriptedanim = 1;
    var_0 = maps\_utility::spawn_anim_model( "chair" );
    self.has_delta = 1;
    self.anim_props = maps\_utility::make_array( var_0 );
    thread idle_relative_to_target( "sleep_idle", "sleep_react" );
    var_1 = getent( self.target, "targetname" );
    var_1 thread maps\_anim::anim_first_frame_solo( var_0, "sleep_react" );

    if ( 1 )
        return;

    common_scripts\utility::flag_wait( "high_alert" );
    var_0 notify( "stop_first_frame" );
    var_0 playsound( "scn_relaxed_guard_chair_fall" );
    var_1 thread maps\_anim::anim_single_solo( var_0, "sleep_react" );
    wait 2.8721;

    if ( isalive( self ) )
    {
        self stopanimscripted();
        self notify( "single anim", "end" );
    }
}

high_alert_on_death()
{
    self waittill( "death" );
    common_scripts\utility::flag_set( "_stealth_spotted" );
}

outpost_objectives()
{
    thread hut_friendlies_chats_about_russians();
    wait 6;
    var_0 = getent( "hut_obj_org", "targetname" );
    var_1 = getent( "field_org", "targetname" );
    objective_add( 1, "active", &"BLACKOUT_MEET_THE_RUSSIAN_LOYALISTS", var_1.origin );
    objective_add( 2, "current", &"BLACKOUT_ELIMINATE_THE_OUTER_GUARD", var_0.origin );
    objective_indentlevel( 2, 1 );
    common_scripts\utility::flag_wait( "hut_cleared" );
    var_2 = getent( "chess_obj_org", "targetname" );
    objective_position( 2, var_2.origin );
    common_scripts\utility::flag_wait( "chess_cleared" );
    var_3 = getent( "shack_obj_org", "targetname" );
    objective_position( 2, var_3.origin );
    common_scripts\utility::flag_wait( "shack_cleared" );
    maps\_utility::objective_complete( 2 );
    maps\_utility::autosave_by_name( "other_huts_cleared" );
    objective_state( 1, "current" );
    common_scripts\utility::flag_wait( "russians_stand_up" );
    maps\_utility::objective_complete( 1 );
}

field_russian_think()
{
    level.field_russians[level.field_russians.size] = self;
    self endon( "death" );
    self allowedstances( "prone" );
    self.fixednode = 0;
    self.drawoncompass = 0;
    self.goalradius = 16;
    common_scripts\utility::flag_wait( "russians_stand_up" );
    wait(randomfloat( 1 ));

    if ( common_scripts\utility::cointoss() )
        self allowedstances( "stand" );
    else
        self allowedstances( "crouch" );

    thread maps\_utility::play_sound_on_entity( "scn_blackout_reveal_russian_soldier" );

    if ( isdefined( self.script_linkto ) )
    {
        self allowedstances( "stand" );
        var_0 = getent( self.script_linkto, "script_linkname" );
        self.disablearrivals = 1;
        self.disableexits = 1;
        maps\_spawner::go_to_origin( var_0 );
        self.disablearrivals = 0;
        self.disableexits = 0;
    }

    self.goalradius = 16;
    self waittill( "go_up_hill" );
    self allowedstances( "stand", "crouch", "prone" );
    wait(randomfloatrange( 0.1, 1.7 ));
    self.drawoncompass = 1;
    var_1 = getnodearray( "hilltop_delete_node", "targetname" );
    var_2 = undefined;

    for ( var_3 = 0; var_3 < var_1.size; var_3++ )
    {
        if ( !isdefined( var_1[var_3].taken ) )
        {
            var_2 = var_1[var_3];
            break;
        }
    }

    var_2.taken = 1;
    go_up_hill_wait();

    if ( isdefined( self.script_noteworthy ) )
    {
        var_4 = getnode( self.script_noteworthy, "targetname" );
        self setgoalnode( var_4 );
        self.goalradius = 8;
        self.interval = 0;
        self waittill( "goal" );

        for (;;)
        {
            if ( common_scripts\utility::flag( "field_go" ) )
                break;

            var_5 = vectortoangles( level.price.origin - self.origin );
            var_6 = var_5[1];
            self orientmode( "face angle", var_6 );
            wait 0.05;
        }

        self.interval = 96;
        var_7["stopper_1"] = 1.4;
        var_7["stopper_2"] = 1.6;
        var_7["stopper_3"] = 1.8;
        wait(var_7[self.script_noteworthy]);
        common_scripts\utility::flag_wait( "field_go" );
        self orientmode( "face default" );
        self setgoalnode( var_2 );
    }
    else
        self setgoalnode( var_2 );

    thread hill_head_tracking();
    self.fixednode = 1;
    self.goalradius = 16;
    common_scripts\utility::flag_wait( "player_at_overlook" );
    self delete();
}

hill_head_tracking()
{
    self waittill( "goal" );
    thread maps\_headtracking::player_head_tracking();
    common_scripts\utility::flag_wait( "player_at_overlook" );
    maps\_headtracking::head_tracking_end();
}

go_up_hill_wait()
{
    if ( !isdefined( self.export ) )
        return;

    var_0 = 0.0;

    switch ( self.export )
    {
        case 20:
            var_0 = 0.75;
            break;
        case 16:
            var_0 = 1.0;
            break;
        case 18:
            var_0 = 1.25;
            break;
        case 21:
            var_0 = 0.5;
            break;
        case 13:
        case 22:
            var_0 = 1.0;
            break;
        case 17:
            var_0 = 1.5;
            break;
    }

    wait(var_0);
}

hilltop_mortar_team( var_0 )
{
    var_1 = getent( var_0, "targetname" );
    self.goalradius = 16;
    self setgoalpos( var_1.origin );
}

russian_leader_think( var_0 )
{
    level.kamarov = self;
    self.drawoncompass = 0;
    self.animname = "kamarov";

    if ( isdefined( var_0 ) )
    {
        self setgoalpos( self.origin );
        self.goalradius = 8;
    }

    common_scripts\utility::flag_wait( "russians_stand_up" );
    self.drawoncompass = 1;
}

kamarov()
{
    return level.kamarov.script_friendname;
}

setup_sas_buddies()
{
    level.price = getent( "price", "targetname" );
    level.price.animname = "price";
    level.gaz = getent( "gaz", "targetname" );
    level.gaz.animname = "gaz";
    level.price thread maps\_utility::waterfx( "shack_cleared" );
    level.gaz thread maps\_utility::waterfx( "shack_cleared" );
    level.player thread maps\_utility::waterfx( "shack_cleared" );
    level.price maps\_utility::forceuseweapon( "m4m203_silencer_reflex", "primary" );
    level.gaz maps\_utility::forceuseweapon( "m4m203_silencer_reflex", "primary" );
    level.price maps\_utility::make_hero();
    level.gaz maps\_utility::make_hero();
    var_0 = getaiarray( "allies" );
    common_scripts\utility::array_thread( var_0, ::sas_main_think );
}

aim_at_overlook_fight()
{
    self waittill( "goal" );
    var_0 = getent( "friendly_cliff_target", "targetname" );
    maps\_utility::cqb_walk( "on" );
    maps\_utility::cqb_aim( var_0 );
    common_scripts\utility::flag_wait( "overlook_attack_begins" );
    maps\_utility::cqb_aim();
    maps\_utility::cqb_walk( "off" );
}

player_push_toggle()
{
    common_scripts\utility::flag_wait( "burning_door_open" );
    common_scripts\utility::flag_wait( "player_reaches_cliff_area" );
}

sas_main_think()
{
    self.battlechatter = 0;
    self.baseaccuracy = 10000;
    self.grenadeammo = 0;
    maps\_utility::ent_flag_init( "rappelled" );
    thread maps\_utility::magic_bullet_shield();
    thread player_push_toggle();
    var_0 = 0;
    var_1 = undefined;

    if ( !common_scripts\utility::flag( "go_up_hill" ) )
    {
        var_0 = 1;
        maps\_utility::enable_cqbwalk();
        common_scripts\utility::flag_wait( "gaz_and_price_go_up_hill" );
        maps\_utility::disable_cqbwalk();
        var_2 = getentarray( "hilltop_friendly_org", "targetname" );

        for ( var_3 = 0; var_3 < var_2.size; var_3++ )
        {
            if ( !isdefined( var_2[var_3].used ) )
            {
                var_2[var_3].used = 1;
                self setgoalpos( var_2[var_3].origin );
                self.goalradius = 16;
                break;
            }
        }
    }

    self notify( "stop_going_to_node" );
    self.baseaccuracy = 1;

    if ( !common_scripts\utility::flag( "go_to_overlook" ) || var_0 )
    {
        common_scripts\utility::flag_wait( "go_to_overlook" );
        self.maxvisibledist = 8000;

        if ( self == level.gaz )
            self.ignoreall = 1;

        var_4 = [];
        var_4["price"] = "price_overlook_node";
        var_4["gaz"] = "gaz_overlook_node";
        self.ignoreall = 1;
        self.ignoreme = 1;
        self notify( "stop_going_to_node" );

        if ( self != level.kamarov )
        {
            var_1 = getnode( var_4[self.animname], "targetname" );
            self setgoalnode( var_1 );
        }
        else if ( getdvarint( "use_old_kamarov_overlook" ) == 1 )
        {
            var_1 = getent( "kaz_overlook_org", "targetname" );
            self setgoalpos( var_1.origin );
        }
        else
        {
            var_1 = spawn( "script_origin", ( -7603.46, -2327.64, 801.256 ) );
            var_1.angles = ( 0.0, 82.128, 0.0 );
            var_1 maps\_anim::anim_reach_solo( self, "overlook_gunaway" );
        }

        self.goalradius = 16;

        if ( self == level.price )
            thread aim_at_overlook_fight();

        if ( self == level.kamarov )
        {
            self pushplayer( 1 );
            self waittill( "goal" );

            if ( getdvarint( "use_old_kamarov_overlook" ) == 1 )
            {
                wait 1;
                level.binocs = get_prop( "binocs" );
                var_1 thread maps\_anim::anim_loop_solo( self, "binoc_idle" );
            }
            else
            {
                var_1 thread maps\_anim::anim_single_solo( self, "overlook_gunaway" );
                self waittillmatch( "single anim", "binoculars in hand" );
                level.binocs = get_prop( "binocs" );
                self waittillmatch( "single anim", "end" );
                var_1 thread maps\_anim::anim_loop_solo( self, "overlook_idle", undefined, "stop_loop" );
            }
        }
    }

    if ( !common_scripts\utility::flag( "overlook_attack_begins" ) )
    {
        self.ignoreall = 1;
        self.ignoreme = 1;
        common_scripts\utility::flag_wait( "overlook_attack_begins" );

        if ( self == level.gaz )
        {
            self.ignoreall = 1;
            self.force_ignoreall = 1;
        }
        else
            self.ignoreall = 0;

        self.ignoreme = 0;
    }

    if ( is_overlook_or_earlier_start() )
    {
        if ( self == level.kamarov )
        {
            common_scripts\utility::flag_wait( "kam_go_through_burning_house" );

            if ( getdvarint( "use_old_kamarov_overlook" ) == 1 )
                var_1 = getent( "kaz_overlook_org", "targetname" );

            var_1 notify( "stop_loop" );
            thread delete_binocs();
            level.kamarov maps\_utility::set_force_color( "y" );

            if ( getdvarint( "use_old_burning_house" ) != 1 )
            {
                level.scripted_node_burninghouse = spawn( "script_origin", ( -7690.17, -370.126, 812.081 ) );
                thread kamarov_wait_burning_house_pathing();
                level.scripted_node_burninghouse maps\_anim::anim_reach_solo( self, "walk_burning_house_idle", "scripted_node" );
                self animmode( "zonly_physics" );
                self _meth_8570( 1 );
                level.scripted_node_burninghouse thread maps\_anim::anim_loop_solo( self, "walk_burning_house_idle", "scripted_node", "stop_loop" + self.animname );
                common_scripts\utility::flag_set( "h1_burninghouse_kam" );
                common_scripts\utility::flag_wait_all( "h1_burninghouse_price", "h1_burninghouse_gaz" );
                level.scripted_node_burninghouse notify( "stop_loop" + self.animname );
                level.scripted_node_burninghouse thread maps\_anim::anim_single_solo( self, "walk_burning_house", "scripted_node" );
                self waittillmatch( "single anim", "door_kicked" );
                thread h1_burning_house_kick_door( "burning" );
                self waittillmatch( "single anim", "end" );
                self animmode( "none" );
                self _meth_8570( 0 );
            }
        }
        else
            common_scripts\utility::flag_wait( "go_through_burning_house" );

        if ( self == level.gaz )
        {
            self.ignoreall = 0;
            self.force_ignoreall = undefined;

            if ( getdvarint( "use_old_burning_house" ) != 1 )
            {
                self pushplayer( 1 );
                level.scripted_node_burninghouse maps\_anim::anim_reach_solo( self, "walk_burning_house_idle" );
                common_scripts\utility::flag_set( "h1_burninghouse_gaz" );
                self animmode( "zonly_physics" );
                self _meth_8570( 1 );
                level.scripted_node_burninghouse thread maps\_anim::anim_loop_solo( self, "walk_burning_house_idle", undefined, "stop_loop" + self.animname );
                common_scripts\utility::flag_wait_all( "h1_burninghouse_price", "h1_burninghouse_kam" );
                level.scripted_node_burninghouse notify( "stop_loop" + self.animname );
                level.scripted_node_burninghouse maps\_anim::anim_single_solo( self, "walk_burning_house" );
                self pushplayer( 0 );
                self animmode( "none" );
                self _meth_8570( 0 );
            }
            else
                wait 1.2;

            level.gaz maps\_utility::set_force_color( "o" );
        }

        if ( self == level.price )
        {
            if ( getdvarint( "use_old_burning_house" ) != 1 )
            {
                self pushplayer( 1 );
                level.scripted_node_burninghouse maps\_anim::anim_reach_solo( self, "walk_burning_house_idle" );
                self animmode( "zonly_physics" );
                self _meth_8570( 1 );
                level.scripted_node_burninghouse thread maps\_anim::anim_loop_solo( self, "walk_burning_house_idle", undefined, "stop_loop" + self.animname );

                while ( distancesquared( level.player.origin, level.price.origin ) > 30000 )
                    waitframe();

                common_scripts\utility::flag_set( "h1_burninghouse_price" );
                common_scripts\utility::flag_wait_all( "h1_burninghouse_kam", "h1_burninghouse_gaz" );
                level.scripted_node_burninghouse notify( "stop_loop" + self.animname );
                level.scripted_node_burninghouse thread maps\_anim::anim_single_solo( self, "walk_burning_house" );
                self waittillmatch( "single anim", "debris_room1" );
                thread common_scripts\_exploder::exploder( 76 );
                self waittillmatch( "single anim", "debris_room2" );
                thread common_scripts\_exploder::exploder( 77 );
                self waittillmatch( "single anim", "end" );
                self pushplayer( 0 );
                self animmode( "none" );
                self _meth_8570( 0 );
            }
            else
                wait 0.5;

            level.price maps\_utility::set_force_color( "r" );
        }

        if ( getdvarint( "use_old_burning_house" ) == 1 )
            self.ignoreall = 1;
    }

    if ( is_rappel_or_earlier_start() )
    {
        common_scripts\utility::flag_wait( "power_plant_cleared" );

        if ( !maps\_utility::ent_flag( "rappelled" ) )
        {
            if ( self == level.price )
                thread cliff_dialogue();

            common_scripts\utility::flag_wait( "head_to_the_cliff" );
            maps\_utility::set_force_color( "g" );
            self.ignoreme = 1;

            if ( self == level.kamarov )
            {
                common_scripts\utility::flag_wait( "kam_heads_to_rappel_spot" );
                maps\_utility::disable_ai_color();
                var_1 = getnode( "kam_power_node", "targetname" );
                self setgoalnode( var_1 );
                self.goalradius = 16;
            }
            else
            {
                self.doaimidlethread = 0;
                common_scripts\utility::flag_wait( "head_to_rappel_spot" );
                self.doaimidlethread = 1;

                if ( self == level.gaz )
                    wait 1;

                self.interval = 48;
                maps\_utility::set_force_color( "p" );
            }

            self.ignoreall = 1;

            if ( self.animname == "kamarov" )
            {
                common_scripts\utility::flag_wait( "player_finishes_rappel" );
                maps\_utility::stop_magic_bullet_shield();
                self delete();
                return;
            }

            maps\_utility::ent_flag_wait( "rappelled" );

            if ( self == level.price )
                self endon( "death" );

            self.ignoreall = 0;
        }
    }

    sas_handle_farm();
}

kamarov_wait_burning_house_pathing()
{
    self endon( "death" );
    var_0 = self.origin;

    while ( distancesquared( self.origin, var_0 ) < 5000 )
        waitframe();

    common_scripts\utility::flag_set( "kamarov_moving_burning_house" );
}

h1_burning_house_kick_door( var_0 )
{
    var_1 = getent( var_0 + "_door", "targetname" );
    var_2 = getent( var_0 + "_door_org", "targetname" );
    var_3 = getent( "burning_door_model", "targetname" );
    var_3 linkto( var_1 );
    var_1 rotateto( var_1.angles + ( 0.0, 110.0, 0.0 ), 0.7, 0.4, 0.3 );
    var_4 = 0.7;
    soundscripts\_snd::snd_message( "aud_open_door_meeting" );
    wait(var_4 - 0.3);
    var_1 notsolid();
    common_scripts\utility::flag_set( var_0 + "_door_open" );
    common_scripts\utility::flag_set( "mission_chatter" );
    wait 0.5;
    var_1 solid();
    wait 1;
    level.kamarov maps\_utility::dialogue_queue( "stalling" );
    wait 0.25;
    level.gaz maps\_utility::dialogue_queue( "beat_it_out" );
    wait 0.8;
    level.price maps\_utility::dialogue_queue( "not_yet" );
    common_scripts\utility::flag_clear( "mission_chatter" );
}

delete_binocs()
{
    var_0 = level.binocs.origin;

    while ( distancesquared( var_0, level.binocs.origin ) < 25 )
    {
        var_0 = level.binocs.origin;
        wait 0.05;
    }

    wait 0.2;
    level.binocs delete();
    level.kamarov animscripts\shared::placeweaponon( level.kamarov.primaryweapon, "right" );
}

sas_handle_farm()
{
    maps\_utility::set_force_color( "r" );
    common_scripts\utility::flag_wait( "rpg_guy_attacks_bm21s" );
    maps\_utility::set_force_color( "o" );
}

blackout_stealth_settings()
{
    var_0 = [];
    var_0["prone"] = 70;
    var_0["crouch"] = 260;
    var_0["stand"] = 380;
    var_1 = [];
    var_1["prone"] = 140;
    var_1["crouch"] = 900;
    var_1["stand"] = 1500;
    var_2 = [];
    var_2["prone"] = 512;
    var_2["crouch"] = 5000;
    var_2["stand"] = 8000;
    maps\_stealth_logic::stealth_detect_ranges_set( var_0, var_1, var_2 );
}

setup_player()
{
    level.player thread maps\_stealth_logic::stealth_ai();
    level.player._stealth_move_detection_cap = 100;
}

hilltop_sniper()
{
    var_0 = maps\_utility::get_guys_with_targetname_from_spawner( "hilltop_sniper" );
    common_scripts\utility::array_thread( var_0, ::hilltop_sniper_moves_in );
    common_scripts\utility::array_thread( var_0, ::ground_allied_forces );
}

hilltop_sniper_moves_in()
{
    self endon( "death" );
    self.ignoreall = 1;
    self.ignoreme = 1;
    self.nododgemove = 1;
    var_0 = getent( self.target, "targetname" );
    var_0 maps\_anim::anim_generic_reach( self, "prone_dive" );
    self allowedstances( "prone" );
    var_0 thread maps\_anim::anim_generic_custom_animmode( self, "gravity", "prone_dive" );
    wait 1.2;
    self notify( "stop_animmode" );
    var_0 = getnode( var_0.target, "targetname" );
    self setgoalpos( var_0.origin );
    self.goalradius = 32;
    common_scripts\utility::flag_wait( "overlook_attack_begins" );
    self allowedstances( "prone", "crouch" );
    self.nododgemove = 0;
    self.ignoreall = 0;
    self.ignoreme = 0;
}

alert_on_grenade_body_impact()
{
    self endon( "death" );
    self endon( "event_awareness" );
    self waittill( "damage", var_0, var_1, var_2, var_3, var_4, var_5, var_6 );

    if ( var_4 == "MOD_IMPACT" )
        maps\_stealth_logic::enemy_alert_level_change( "alerted_again", var_1 );
}

hut_cleared()
{
    common_scripts\utility::flag_wait( "hut_guys" );
    common_scripts\utility::flag_wait( "pier_guys" );
    common_scripts\utility::flag_set( "hut_cleared" );
}

set_high_alert_on_alarm()
{
    self endon( "death" );
    maps\_stealth_logic::stealth_enemy_waittill_alert();
    common_scripts\utility::flag_set( "high_alert" );
}

set_high_alert()
{
    level endon( "overlook_attack_begins" );
    level endon( "instant_high_alert" );
    common_scripts\utility::array_thread( level.deathflags["hut_guys"]["ai"], ::set_high_alert_on_alarm );

    for (;;)
    {
        level maps\_utility::add_wait( common_scripts\utility::flag_wait, "high_alert" );
        level maps\_utility::add_wait( common_scripts\utility::flag_wait, "_stealth_spotted" );
        level maps\_utility::add_wait( maps\_utility::_waittillmatch, "event_awareness", "heard_corpse" );
        level maps\_utility::add_wait( maps\_utility::_waittillmatch, "event_awareness", "heard_scream" );
        level maps\_utility::add_wait( maps\_utility::_waittillmatch, "event_awareness", "explode" );
        level maps\_utility::add_wait( maps\_utility::_waittillmatch, "event_awareness", "doFlashBanged" );
        maps\_utility::do_wait_any();
        common_scripts\utility::flag_set( "high_alert" );

        for (;;)
        {
            var_0 = getaiarray( "axis" );

            if ( !var_0.size )
                break;

            if ( common_scripts\utility::flag( "hut_cleared" ) )
            {
                wait 0.05;
                continue;
            }

            var_1 = 0;

            for ( var_2 = 0; var_2 < var_0.size; var_2++ )
            {
                if ( !isalive( var_0[var_2].enemy ) )
                    continue;

                var_1 = 1;
                break;
            }

            if ( !var_1 )
                break;

            wait 0.05;
        }

        common_scripts\utility::flag_clear( "high_alert" );
        wait 0.05;
    }
}

overlook_runner_think()
{
    self endon( "death" );
    overlook_enemy_waits_for_player();
    overlook_enemy_leaves_stealth();
}

street_walker_think()
{
    self endon( "death" );
    overlook_enemy_waits_for_player();

    if ( !isdefined( level.street_walker_delay ) )
        level.street_walker_delay = 0.0;
    else
        level.street_walker_delay += randomfloatrange( 0.2, 0.4 );

    wait(level.street_walker_delay);
    maps\_patrol::patrol( self.target );
    overlook_enemy_leaves_stealth();
}

overlook_enemy_waits_for_player()
{
    thread custom_stealth_ai();
    common_scripts\utility::flag_wait( "player_at_overlook" );
}

overlook_enemy_leaves_stealth()
{
    common_scripts\utility::flag_wait( "_stealth_spotted" );
    level.attention_getter = 1;
    var_0 = getent( "overlook_attention", "targetname" );
    self setgoalpos( var_0.origin );
    self.goalradius = var_0.radius;
    self waittill( "goal" );

    if ( !common_scripts\utility::flag( "overlook_attention" ) )
    {
        common_scripts\utility::flag_set( "overlook_attention" );
        wait 3;
    }

    set_goalpos_and_volume_from_targetname( "enemy_overlook_defense" );
}

breach_first_building()
{
    var_0 = maps\_utility::get_guys_with_targetname_from_spawner( "breach_spawner" );

    for ( var_1 = 0; var_1 < var_0.size; var_1++ )
        maps\_utility::spawn_failed( var_0[var_1] );

    common_scripts\utility::array_thread( var_0, ::pre_breach );
    var_2 = getent( "first_breach_volume", "targetname" );
    var_2 maps\_breach::breach_think( var_0, "explosive_breach_left" );
    common_scripts\utility::array_thread( var_0, ::post_breach );
    common_scripts\utility::flag_set( "breach_complete" );
}

pre_breach()
{
    thread maps\_utility::magic_bullet_shield();
    self.ignoreall = 1;
    self.ignoreme = 1;
}

post_breach()
{
    maps\_utility::stop_magic_bullet_shield();
    self.ignoreall = 0;
    self.ignoreme = 0;
    self delete();
}

spawn_replacement_baddies()
{
    level endon( "cliff_fighting" );
    var_0 = 10;
    var_1 = getentarray( "enemy_reinforce_spawner", "targetname" );
    var_1 = common_scripts\utility::array_randomize( var_1 );
    common_scripts\utility::array_thread( var_1, maps\_utility::add_spawn_function, ::fall_back_to_defensive_position );
    var_2 = 0;

    for (;;)
    {
        var_3 = getaiarray( "axis" );

        if ( var_3.size > 10 )
        {
            wait 1;
            continue;
        }

        var_4 = var_1[var_2];
        var_4.count = 1;
        var_4 maps\_utility::spawn_ai();
        var_2++;

        if ( var_2 >= var_1.size )
            var_2 = 0;

        wait 0.5;
    }
}

fall_back_to_defensive_position()
{
    self endon( "death" );
    self endon( "long_death" );
    thread macmillan_proud_hook();

    if ( !common_scripts\utility::flag( "mgs_cleared" ) )
    {
        set_goalpos_and_volume_from_targetname( "enemy_overlook_defense" );
        common_scripts\utility::flag_wait( "mgs_cleared" );
    }

    if ( !common_scripts\utility::flag( "player_reaches_cliff_area" ) )
    {
        set_goalpos_and_volume_from_targetname( "enemy_first_defense" );
        common_scripts\utility::flag_wait( "player_reaches_cliff_area" );
    }

    defend_second_area();
}

teleport_and_take_node_by_targetname( var_0 )
{
    var_1 = getnodearray( var_0, "targetname" );

    for ( var_2 = 0; var_2 < var_1.size; var_2++ )
    {
        var_3 = var_1[var_2];

        if ( isdefined( var_3.taken ) )
            continue;

        var_3.taken = 1;
        self teleport( var_3.origin );
        self.goalradius = 32;
        self setgoalnode( var_3 );
        return;
    }
}

set_flag_on_player_damage( var_0 )
{
    common_scripts\utility::flag_assert( var_0 );
    level endon( var_0 );
    self endon( "death" );

    for (;;)
    {
        self waittill( "damage", var_1, var_2, var_3, var_4 );

        if ( !isalive( var_2 ) )
            continue;

        if ( !isplayer( var_2 ) )
            continue;

        thread set_flag_and_die( var_0, var_4 );
    }
}

set_flag_and_die( var_0, var_1 )
{
    common_scripts\utility::flag_set( var_0 );
    self kill( var_1 );
}

ground_allied_forces()
{
    self endon( "death" );
    self endon( "damage_notdone" );

    if ( !common_scripts\utility::flag( "breach_complete" ) )
    {
        common_scripts\utility::flag_wait( "breach_complete" );
        wait 0.1;

        if ( isdefined( self.targetname ) && self.targetname == "hilltop_sniper_AI" )
            hilltop_sniper_delay();

        set_goalpos_and_volume_from_targetname( "ally_first_offense" );
        self.ranit = 1;
    }

    if ( !common_scripts\utility::flag( "player_reaches_cliff_area" ) )
    {
        common_scripts\utility::flag_wait( "player_reaches_cliff_area" );
        maps\_utility::set_force_color( "c" );
        teleport_and_take_node_by_targetname( "ally_cliff_start_node" );
        self.baseaccuracy = 0;
    }

    if ( !common_scripts\utility::flag( "cliff_look" ) )
    {
        maps\_utility::set_force_color( "c" );
        thread maps\_utility::deletable_magic_bullet_shield();
        common_scripts\utility::flag_wait( "cliff_look" );
        maps\_utility::stop_magic_bullet_shield();
    }

    if ( !common_scripts\utility::flag( "cliff_moveup" ) )
    {
        maps\_utility::set_force_color( "c" );
        common_scripts\utility::flag_wait( "cliff_moveup" );
        common_scripts\utility::flag_wait( "cliff_complete" );
    }
}

hilltop_sniper_delay()
{
    var_0 = 0;

    switch ( self.export )
    {
        case 41:
            var_0 = 0;
            break;
        case 63:
            var_0 = 1.5;
            break;
        case 64:
            var_0 = 3.2;
            break;
        case 40:
            var_0 = 0;
            break;
        case 62:
            var_0 = 2.5;
            break;
    }

    wait(var_0);
}

rocket_guy_targets_bmp()
{
    self endon( "death" );

    if ( !isalive( level.enemy_bmp ) )
        waittillframeend;

    if ( !isalive( level.enemy_bmp ) )
        return;

    self setentitytarget( level.enemy_bmp, 0.6 );
    level.enemy_bmp maps\_vehicle::godoff();
    level.enemy_bmp waittill( "death" );
    self clearentitytarget();
}

set_goalpos_and_volume_from_targetname( var_0 )
{
    var_1 = getent( var_0, "targetname" );
    var_2 = getent( var_1.target, "targetname" );
    self.fixednode = 0;
    self.goalheight = 512;
    self allowedstances( "stand", "prone", "crouch" );
    self setgoalpos( var_1.origin );
    self.goalradius = var_1.radius;
    self setgoalvolume( var_2 );
}

turn_off_stealth()
{
    level waittill( "_stealth_spotted" );
    level notify( "_stealth_stop_stealth_logic" );
}

blackout_guy_leaves_ignore( var_0 )
{
    var_0 endon( "death" );
    self waittill( "trigger" );
    var_0.ignoreme = 0;
}

blackout_guy_animates_once( var_0, var_1, var_2, var_3 )
{
    if ( !isdefined( level.flag[var_2] ) )
        common_scripts\utility::flag_init( var_2 );

    var_4 = maps\_utility::get_guy_with_script_noteworthy_from_spawner( var_0 );
    var_4 endon( "death" );
    var_5 = getent( var_4.target, "targetname" );
    var_4 maps\_utility::set_generic_deathanim( var_1 + "_death" );
    var_4.ignoreme = 1;

    if ( isdefined( var_4.script_linkto ) )
    {
        var_6 = var_4 common_scripts\utility::get_linked_ents();
        common_scripts\utility::array_thread( var_6, ::blackout_guy_leaves_ignore, var_4 );
    }

    var_4.allowdeath = 1;
    var_4.health = 1;
    var_5 thread maps\_anim::anim_generic_first_frame( var_4, var_1 + "_ff" );
    common_scripts\utility::flag_wait( var_2 );
    var_7 = getanimlength( var_4 maps\_utility::getgenericanim( var_1 + "_ff" ) );
    var_5 thread maps\_anim::anim_generic( var_4, var_1 + "_ff" );
    wait(var_3);
    var_4.ignoreme = 0;
}

blackout_guy_animates( var_0, var_1, var_2, var_3 )
{
    if ( !isdefined( level.flag[var_2] ) )
        common_scripts\utility::flag_init( var_2 );

    var_4 = maps\_utility::get_guy_with_script_noteworthy_from_spawner( var_0 );
    var_4 endon( "death" );
    var_5 = getent( var_4.target, "targetname" );
    var_4 maps\_utility::set_generic_deathanim( var_1 + "_death" );
    var_4.ignoreme = 1;

    if ( isdefined( var_4.script_linkto ) )
    {
        var_6 = var_4 common_scripts\utility::get_linked_ents();
        common_scripts\utility::array_thread( var_6, ::blackout_guy_leaves_ignore, var_4 );
    }

    var_4.allowdeath = 1;
    var_4.health = 1;
    var_5 thread maps\_anim::anim_generic_first_frame( var_4, var_1 + "_ff" );
    common_scripts\utility::flag_wait( var_2 );
    var_7 = getanimlength( var_4 maps\_utility::getgenericanim( var_1 + "_ff" ) );
    var_5 thread maps\_anim::anim_generic_loop( var_4, var_1 );
    wait(var_3);
    var_4.ignoreme = 0;
    wait 1;
    var_4 maps\_utility::die();
}

blackout_guy_animates_loop( var_0, var_1, var_2, var_3 )
{
    if ( !isdefined( level.flag[var_2] ) )
        common_scripts\utility::flag_init( var_2 );

    var_4 = maps\_utility::get_guy_with_script_noteworthy_from_spawner( var_0 );
    var_4 endon( "death" );
    var_5 = getent( var_4.target, "targetname" );
    var_4 maps\_utility::set_generic_deathanim( var_1 + "_death" );
    var_4.ignoreme = 1;

    if ( isdefined( var_4.script_linkto ) )
    {
        var_6 = var_4 common_scripts\utility::get_linked_ents();
        common_scripts\utility::array_thread( var_6, ::blackout_guy_leaves_ignore, var_4 );
    }

    var_4.allowdeath = 1;
    var_4.health = 1;

    if ( isdefined( var_3 ) )
    {
        var_5 thread maps\_anim::anim_generic_first_frame( var_4, var_1 + "_ff" );
        common_scripts\utility::flag_wait( var_3 );
    }

    var_5 thread maps\_anim::anim_generic_loop( var_4, var_1 );
    level waittill( "price_aims_at" + var_2 );
    level.price waittill( "goal" );
    wait 10;
    var_4.ignoreme = 0;
}

price_checks_goal_for_noteworthy()
{
    self endon( "stop_checking_node_noteworthy" );
    var_0 = [];

    for (;;)
    {
        self waittill( "goal" );

        while ( !isdefined( self.node ) )
            wait 0.05;

        var_1 = self.node;

        if ( isdefined( var_0[var_1.origin + ""] ) )
            continue;

        var_0[var_1.origin + ""] = 1;

        if ( distance( var_1.origin, self.origin ) > self.goalradius )
            continue;

        if ( !isdefined( var_1.script_noteworthy ) )
            continue;

        if ( var_1.script_noteworthy == "signal_moveup" )
        {
            var_2 = getent( "CQB_stand_signal_move_up", "targetname" );
            price_signals_moveup();
        }
    }
}

price_signals_moveup()
{
    while ( isalive( level.price.enemy ) )
        wait 0.05;

    level.price maps\_utility::handsignal( "moveup", 1, "enemy" );
}

price_cqb_aims_at_target( var_0 )
{
    level notify( "price_gets_new_cqb_targ" );
    level endon( "price_gets_new_cqb_targ" );

    for (;;)
    {
        if ( var_0 == "hide" )
        {
            var_1 = getent( "hide_target", "targetname" );
            level.price maps\_utility::cqb_aim( var_1 );
            level notify( "price_aims_at" + var_0 );
            wait 0.05;
            continue;
        }

        var_2 = getarraykeys( level.deathflags[var_0]["ai"] );

        if ( var_2.size )
        {
            level.price maps\_utility::cqb_aim( level.deathflags[var_0]["ai"][var_2[0]] );
            level notify( "price_aims_at" + var_0 );
            return;
        }

        wait 0.05;
    }
}

price_attack_hunt()
{
    for (;;)
    {
        self.noshoot = 1;

        if ( !isalive( self.enemy ) )
        {
            wait 0.05;
            continue;
        }

        if ( !isdefined( self.enemy.dont_hit_me ) )
            self.noshoot = undefined;
        else
        {

        }

        wait 0.05;
    }
}

spawn_replacement_cliff_baddies()
{
    level endon( "cliff_complete" );
    var_0 = 10;
    var_1 = getentarray( "later_spawner", "targetname" );
    var_1 = common_scripts\utility::array_randomize( var_1 );
    common_scripts\utility::array_thread( var_1, maps\_utility::add_spawn_function, ::defend_second_area );
    var_2 = 0;

    for (;;)
    {
        var_3 = getaiarray( "axis" );

        if ( var_3.size > 10 )
        {
            wait 1;
            continue;
        }

        var_4 = var_1[var_2];
        var_4.count = 1;
        var_4 maps\_utility::spawn_ai();
        var_2++;

        if ( var_2 >= var_1.size )
            var_2 = 0;

        wait 0.5;
    }
}

defend_second_area()
{
    self endon( "death" );
    self endon( "long_death" );
    teleport_and_take_node_by_targetname( "enemy_cliff_start_node" );

    if ( !common_scripts\utility::flag( "cliff_look" ) )
    {
        self.health = 50000;
        thread set_flag_on_player_damage( "cliff_look" );
        common_scripts\utility::flag_wait( "cliff_look" );
        self.health = 100;
    }

    thread track_defender_deaths();
    self.baseaccuracy = 0;
    common_scripts\utility::flag_wait( "cliff_moveup" );
    set_goalpos_and_volume_from_targetname( "enemy_cliff_defense" );
    common_scripts\utility::flag_wait( "cliff_complete" );
    var_0 = getent( "cliff_enemy_delete_org", "targetname" );
    wait(randomfloatrange( 1, 5 ));
    self setgoalpos( var_0.origin );
    self.goalradius = 32;
    self waittill( "goal" );
    self delete();
}

roof_spawner_think()
{
    self endon( "death" );
    self.ignoreme = 1;
    wait(randomintrange( 30, 60 ));
    maps\_utility::die();
}

track_defender_deaths()
{
    self waittill( "death" );
    level.defenders_killed++;

    if ( level.defenders_killed >= 3 )
        common_scripts\utility::flag_set( "cliff_moveup" );
}

swarm_hillside()
{
    self endon( "death" );
    var_0 = 5000;
    var_1 = 0;
    var_2 = getentarray( "power_station_attack_org", "targetname" );

    for ( var_3 = 0; var_3 < var_2.size; var_3++ )
    {
        var_4 = var_2[var_3];

        if ( !isdefined( var_4.script_count ) )
            var_4.script_count = 0;

        if ( var_4.script_count < var_0 )
        {
            var_0 = var_4.script_count;
            var_1 = var_3;
        }
    }

    var_4 = var_2[var_1];
    var_4.script_count++;
    self setgoalpos( var_4.origin );
    self.goalradius = var_4.radius;
    self waittill( "goal" );
    var_5 = getnode( "power_plant_fight_node", "targetname" );
    self setgoalnode( var_5 );
    self.goalradius = 2048;

    for (;;)
    {
        wait(randomfloatrange( 7, 10 ));
        self.goalradius -= 128;

        if ( self.goalradius < 650 )
            self.goalradius = 650;
    }
}

power_plant_spawner()
{
    self endon( "death" );
    self setgoalpos( self.origin );
    self.goalradius = 64;
    common_scripts\utility::flag_wait( "player_reaches_cliff_area" );
    thread swarm_hillside();
}

overlook_turret_think()
{
    self.turret_function = set_turret_manual();
    self endon( "death" );
    self.ignoreme = 1;
    maps\_utility::delaythread( 32, maps\_utility::set_ignoreme, 0 );
    maps\_utility::delaythread( randomfloatrange( 50, 55 ), maps\_utility::die );
    var_0 = getentarray( "mg_overlook_target", "targetname" );

    for (;;)
    {
        self setentitytarget( common_scripts\utility::random( var_0 ) );
        wait(randomfloatrange( 1, 2 ));
    }
}

set_turret_manual( var_0 )
{

}

power_plant_org()
{
    var_0 = getent( "power_plant", "targetname" );
    return var_0.origin;
}

cliff_org()
{
    var_0 = getent( "cliff_org", "targetname" );
    return var_0.origin;
}

overlook_player_mortarvision()
{
    level endon( "mgs_cleared" );
    var_0 = [];
    var_1 = undefined;

    for ( var_2 = 0; var_2 < level.createfxent.size; var_2++ )
    {
        if ( !isdefined( level.createfxent[var_2].v["exploder"] ) )
            continue;

        if ( level.createfxent[var_2].v["exploder"] != "70" )
            continue;

        var_1 = level.createfxent[var_2];
        var_3 = spawnstruct();
        var_3.origin = var_1.v["origin"];
        var_0[var_0.size] = var_3;
    }

    common_scripts\utility::flag_wait( "overlook_attack_begins" );
    wait 5;
    var_4 = undefined;

    for (;;)
    {
        wait_for_player_to_ads_for_time( 1.5 );

        for (;;)
        {
            wait 0.5;

            if ( !player_is_ads() )
                break;

            var_5 = getaiarray( "axis" );
            var_6 = level.player geteye();
            var_7 = level.player getplayerangles();
            var_8 = anglestoforward( var_7 );
            var_9 = var_6 + maps\_utility::vector_multiply( var_8, 5000 );
            var_10 = bullettrace( var_6, var_9, 1, level.player );
            var_11 = var_10["position"];
            var_12 = common_scripts\utility::getclosest( var_11, var_5, 500 );

            if ( !isdefined( var_12 ) )
                continue;

            var_13 = common_scripts\utility::getclosest( var_12.origin, var_0, 500 );

            if ( !isdefined( var_13 ) )
                continue;

            if ( isdefined( var_4 ) )
            {
                if ( var_13 == var_4 )
                    continue;
            }

            var_4 = var_13;
            var_1.v["origin"] = var_13.origin;
            common_scripts\utility::play_sound_in_space( "mortar_incoming", var_1.v["origin"] );
            wait 1.5;
            var_1 common_scripts\utility::activate_individual_exploder();
            wait(randomfloat( 8 ));
        }
    }
}

wait_for_player_to_ads_for_time( var_0 )
{
    var_1 = gettime();

    for (;;)
    {
        if ( player_is_ads() )
        {
            if ( gettime() > var_1 + var_0 )
                return;
        }
        else
            var_1 = gettime();

        wait 0.05;
    }
}

player_is_ads()
{
    return level.player playerads() > 0.5;
}

physics_launch_think()
{
    self hide();
    self setcandamage( 1 );

    for (;;)
    {
        self waittill( "damage", var_0, var_1, var_2, var_3, var_4, var_5, var_6 );

        if ( !isdefined( var_1 ) )
            continue;

        if ( !isdefined( var_1.model ) )
            continue;

        if ( !issubstr( var_1.model, "vehicle" ) )
            continue;

        break;
    }

    var_7 = getent( self.target, "targetname" );
    var_8 = var_7.origin;
    var_9 = var_7.origin - self.origin;
    var_9 = maps\_utility::vector_multiply( var_9, 100 );
    var_10 = spawn( "script_model", ( 0.0, 0.0, 0.0 ) );
    var_10.angles = self.angles;
    var_10.origin = self.origin;
    var_10 setmodel( self.model );
    var_10 physicslaunchclient( var_10.origin, var_9 );
    self delete();
}

ally_rappels( var_0, var_1 )
{
    if ( self == level.price )
    {

    }

    var_2 = getnode( var_0, "targetname" );
    var_3 = level.rope[var_0];
    var_2 thread maps\_anim::anim_first_frame_solo( var_3, "rappel_start" );

    if ( getdvarint( "use_old_rappel_fight" ) == 1 || self != level.gaz || !common_scripts\utility::flag( "player_at_rappel" ) )
        var_2 maps\_anim::anim_generic_reach( self, "rappel_start" );

    if ( !common_scripts\utility::flag( "player_rappels" ) )
    {
        common_scripts\utility::flag_wait( "player_at_rappel" );
        common_scripts\utility::flag_set( "gaz_rappels" );
    }

    if ( self.animname == "kamarov" )
        return;

    var_4 = [];
    var_4[var_4.size] = self;
    var_4[var_4.size] = var_3;
    var_2 thread maps\_anim::anim_single_solo( var_3, "rappel_start" );
    var_2 maps\_anim::anim_generic( self, "rappel_start" );

    if ( !common_scripts\utility::flag( "player_rappels" ) )
    {
        var_2 thread maps\_anim::anim_loop_solo( var_3, "rappel_idle" );
        var_2 thread maps\_anim::anim_generic_loop( self, "rappel_idle" );
        common_scripts\utility::flag_wait( "player_rappels" );
        wait(var_1);
        var_2 notify( "stop_loop" );
    }

    var_2 thread maps\_anim::anim_single_solo( var_3, "rappel_end" );
    var_2 maps\_anim::anim_generic( self, "rappel_end" );
    level notify( "shack_cleared" );
    maps\_utility::ent_flag_set( "rappelled" );
    maps\_utility::clear_run_anim();
    self.walkdist = 16;
    self.disableexits = 0;
    self.disablearrivals = 0;
    self.interval = 96;
    self.disableexits = 0;
}

price_swap()
{
    for (;;)
    {
        if ( maps\_utility::player_looking_at( level.price geteye(), 0.7 ) )
        {
            wait 0.1;
            continue;
        }

        break;
    }

    var_0 = getent( "price_nvg_spawner", "targetname" );
    var_0.origin = self.origin;
    var_0.angles = self.angles;
    var_1 = var_0 stalingradspawn();

    if ( maps\_utility::spawn_failed( var_1 ) )
        return;

    level.price maps\_utility::stop_magic_bullet_shield();
    level.price delete();
    level.price = var_1;
    var_1.animname = "price";
    var_1 thread maps\_utility::magic_bullet_shield();
    var_1 sas_handle_farm();
}

trigger_monitor_player_lean()
{
    self endon( "stop_monitor_lean" );

    for (;;)
    {
        if ( level.player isleaning() )
            common_scripts\utility::trigger_off();
        else
            common_scripts\utility::trigger_on();

        waitframe();
    }
}

player_rappel_think()
{
    var_0 = getnode( "player_rappel_node", "targetname" );
    var_1 = maps\_utility::spawn_anim_model( "player_rope" );
    var_0 thread maps\_anim::anim_first_frame_solo( var_1, "rappel_for_player" );
    var_2 = maps\_utility::spawn_anim_model( "player_rope_obj" );
    var_0 thread maps\_anim::anim_first_frame_solo( var_2, "rappel_for_player" );
    var_2 hide();
    var_3 = maps\_utility::spawn_anim_model( "player_rig" );
    var_3 hide();
    var_0 maps\_anim::anim_first_frame_solo( var_3, "rappel" );
    common_scripts\utility::flag_wait( "gaz_rappels" );
    var_4 = getent( "player_rappel_trigger", "targetname" );
    var_2 show();
    var_4 sethintstring( &"BLACKOUT_RAPPEL_HINT" );
    var_4 thread trigger_monitor_player_lean();

    for (;;)
    {
        var_4 waittill( "trigger" );
        waitframe();

        if ( !level.player isleaning() )
        {
            var_4 notify( "stop_monitor_lean" );
            break;
        }
    }

    var_5 = getent( "cliffhanger", "targetname" );
    var_5 delete();
    var_2 hide();
    var_4 delete();
    common_scripts\utility::flag_set( "player_rappels" );
    maps\_utility::enable_scuff_footsteps_sound( 0 );
    level.player allowprone( 0 );
    level.player allowcrouch( 0 );
    level.player allowlean( 0 );
    level.player disableweapons();
    var_3 maps\_utility::lerp_player_view_to_tag( "tag_player", 0.5, 0.9, 35, 35, 45, 0 );
    level.player playerlinktodelta( var_3, "tag_player", 1.0, 0, 0, 0, 0 );
    var_3 show();
    thread rappel_rumble();
    thread common_scripts\_exploder::exploder( 200 );
    var_0 thread maps\_anim::anim_single_solo( var_3, "rappel" );
    var_0 thread maps\_anim::anim_single_solo( var_1, "rappel_for_player" );
    var_0 waittill( "rappel" );
    level.player unlink();
    var_3 delete();
    level.player enableweapons();
    common_scripts\utility::flag_set( "player_finishes_rappel" );
    maps\_utility::enable_scuff_footsteps_sound( 1 );
    level.player allowprone( 1 );
    level.player allowcrouch( 1 );
    level.player.ignoreme = 0;
    level.player allowlean( 1 );
    soundscripts\_snd::snd_message( "aud_start_post_rappel_mix" );
    common_scripts\_exploder::exploder( 300 );
    wait 15;
    var_6 = getentarray( "mg_gunner", "script_noteworthy" );

    for ( var_7 = 0; var_7 < var_6.size; var_7++ )
    {
        if ( isalive( var_6[var_7] ) )
            continue;

        var_6[var_7] delete();
    }
}

rappel_rumble()
{
    var_0 = [];
    var_0 = maps\_utility::rumble_sequence_add_key( var_0, 0.8, "generic_attack_light_500" );
    var_0 = maps\_utility::rumble_sequence_add_key( var_0, 3.02, "generic_attack_light_2000" );
    var_0 = maps\_utility::rumble_sequence_add_key( var_0, 4.35, "generic_attack_light_1500" );
    var_0 = maps\_utility::rumble_sequence_add_key( var_0, 5.65, "generic_attack_light_2000" );
    var_0 = maps\_utility::rumble_sequence_add_key( var_0, 6.95, "generic_attack_light_1500" );
    var_0 = maps\_utility::rumble_sequence_add_key( var_0, 7.75, "generic_attack_medium_500" );
    level.player thread maps\_utility::rumble_sequence_play( var_0 );
}

cliff_bm21_blows_up()
{
    common_scripts\utility::flag_wait( "saw_first_bm21" );
    var_0 = maps\_vehicle::get_vehicle_from_targetname( "bm21_03" );
    radiusdamage( var_0.origin, 250, 5000, 2500 );
}

farm_rpg_guy_attacks_bm21s()
{
    thread maps\_utility::magic_bullet_shield();
    self.ignoreme = 1;
    self.ignorerandombulletdamage = 1;
    self waittill( "goal" );
    var_0 = getent( "underground_bm21_target", "targetname" );
    self setentitytarget( var_0 );
    common_scripts\utility::flag_wait( "rpg_guy_attacks_bm21s" );
    maps\_utility::autosave_by_name( "farm_raid" );
    self.a.rockets = 5000;
    var_1 = maps\_vehicle::get_vehicle_from_targetname( "bm21_01" );

    if ( isalive( var_1 ) )
    {
        self setentitytarget( var_1 );
        var_2 = missile_createattractororigin( var_1.origin + ( 0.0, 0.0, 50.0 ), 5000, 500 );
        var_1.health = 500;
        var_1 waittill( "death" );
        var_1 thread maps\_utility::play_sound_on_entity( "scn_blackout_bmp_explosion" );
        missile_deleteattractor( var_2 );
    }

    var_3 = maps\_vehicle::get_vehicle_from_targetname( "bm21_02" );

    if ( isalive( var_3 ) )
    {
        self setentitytarget( var_3 );
        var_2 = missile_createattractororigin( var_3.origin + ( 0.0, 0.0, 50.0 ), 5000, 500 );
        var_3.health = 500;
        var_3 waittill( "death" );
        var_3 thread maps\_utility::play_sound_on_entity( "scn_blackout_bmp_explosion" );
        missile_deleteattractor( var_2 );
    }

    self.ignorerandombulletdamage = 0;
    self.ignoreme = 0;
    maps\_utility::stop_magic_bullet_shield();
    self.a.rockets = 1;
    self.goalradius = 2048;
    self clearentitytarget();
}

rappel_org()
{
    var_0 = getent( "player_rappel", "targetname" );
    return var_0.origin;
}

prep_for_rappel_think()
{
    var_0 = [];
    var_0[1] = 0;
    var_0[2] = 0;
    var_0[3] = 0;
    var_1[1] = 0.4;
    var_1[2] = 0.8;
    var_1[3] = 1.3;
    create_rope( "ally1_rappel_node" );
    create_rope( "ally2_rappel_node" );

    for (;;)
    {
        self waittill( "trigger", var_2 );
        soundscripts\_snd::snd_message( "start_gaz_kam_fight_mix" );
        var_2 thread gaz_and_kamarov_fight();
    }
}

create_rope( var_0 )
{
    var_1 = getnode( var_0, "targetname" );
    var_2 = maps\_utility::spawn_anim_model( "rope" );
    var_1 thread maps\_anim::anim_first_frame_solo( var_2, "rappel_start" );
    level.rope[var_0] = var_2;
}

gaz_and_kamarov_fight()
{
    self.ignoretriggers = 1;
    self.kam_gaz_fight = 1;

    if ( self == level.price || self == level.gaz )
        self.interval = 0;

    var_0 = getent( "gaz_kam_org", "targetname" );

    if ( getdvarint( "use_old_rappel_fight" ) != 1 )
    {
        if ( self == level.kamarov )
        {
            var_0 maps\_anim::anim_reach_solo( self, "cliff_runin" );
            var_0 maps\_anim::anim_single_solo( self, "cliff_runin" );
        }
        else
        {
            if ( self == level.price )
                price_pre_power_station_goal();

            var_0 maps\_anim::anim_reach_solo( self, "cliff_runin" );
            var_0 maps\_anim::anim_single_solo( self, "cliff_runin" );
        }
    }
    else
        var_0 maps\_anim::anim_reach_and_approach_solo( self, "cliff_start" );

    common_scripts\utility::flag_set( "final_raid_begins" );
    setsaveddvar( "ai_friendlyFireBlockDuration", "0" );

    if ( self == level.price )
    {
        common_scripts\utility::flag_set( "price_at_fight" );

        if ( getdvarint( "use_old_rappel_fight" ) != 1 )
        {
            var_0 thread maps\_anim::anim_loop_solo( self, "cliff_start_idle", undefined, "stop_loop" + self.animname );
            common_scripts\utility::flag_wait( "rappel_kamarov_ready" );
            common_scripts\utility::flag_wait( "rappel_gaz_ready" );
            common_scripts\utility::flag_wait( "gaz_kam_fight_begins" );
            var_0 notify( "stop_loop" + self.animname );
        }
        else
        {
            common_scripts\utility::flag_wait( "rappel_kamarov_ready" );
            common_scripts\utility::flag_wait( "rappel_gaz_ready" );
            common_scripts\utility::flag_wait( "gaz_kam_fight_begins" );
        }

        maps\_utility::delaythread( 24, ::ally_rappels, "ally2_rappel_node", 0.5 );
        common_scripts\utility::waittillend( "single anim" );
        self setgoalpos( self.origin );
        self.goalradius = 16;
        self.ignoretriggers = 0;
        self.rappelling = 1;
        soundscripts\_snd::snd_message( "stop_gaz_kam_fight_mix" );
        return;
    }

    common_scripts\utility::flag_set( "rappel_" + self.animname + "_ready" );
    common_scripts\utility::flag_set( "gaz_fight_preps" );

    if ( self == level.gaz )
        common_scripts\utility::flag_set( "gaz_at_fight" );
    else
    {
        common_scripts\utility::flag_set( "kam_at_fight" );
        level.binocs = get_prop( "binocs" );
        thread binocs_delete();

        if ( getdvarint( "use_old_rappel_fight" ) != 1 )
            var_0 maps\_anim::anim_single_solo( self, "cliff_prestart" );

        common_scripts\utility::flag_set( "power_station_dialogue_begins" );
    }

    if ( !common_scripts\utility::flag( "gaz_kam_fight_begins" ) )
    {
        var_0 thread maps\_anim::anim_loop_solo( self, "cliff_start_idle", undefined, "stop_loop" + self.animname );
        common_scripts\utility::flag_wait( "gaz_kam_fight_begins" );
        var_0 notify( "stop_loop" + self.animname );
    }

    common_scripts\utility::waittillend( "single anim" );

    if ( self == level.kamarov )
    {
        var_0 thread maps\_anim::anim_loop_solo( self, "cliff_end_idle" );
        return;
    }

    self.ignoretriggers = 0;
    thread ally_rappels( "ally1_rappel_node", 0.25 );
    setsaveddvar( "ai_friendlyFireBlockDuration", "2000" );
}

price_pre_power_station_goal()
{
    self endon( "death" );
    var_0 = getnode( "price_pre_power_station_goal", "targetname" );
    self setgoalnode( var_0 );

    if ( isdefined( var_0.radius ) )
        self.goalradius = var_0.radius;

    self waittill( "goal" );
}

take_out_pier_guy( var_0 )
{
    if ( common_scripts\utility::flag( "high_alert" ) )
        return;

    level endon( "high_alert" );
    var_0.threatbias = 35000;
    maps\_utility::radio_dialogue_queue( "weapons_free" );

    if ( !isalive( var_0 ) )
        return;

    var_0.ignoreme = 0;
    level.gaz.ignoreall = 0;
    var_0 waittill( "death" );
    level.price.ignoreall = 1;
    level.gaz.ignoreall = 1;
}

kill_hut_patrol( var_0 )
{
    var_0 endon( "death" );
    level endon( "high_alert" );
    common_scripts\utility::flag_assert( "high_alert" );
    level maps\_utility::add_wait( maps\_utility::_waittillmatch, "event_awareness", "found_corpse" );
    level maps\_utility::add_wait( maps\_utility::_waittillmatch, "event_awareness", "heard_corpse" );
    level maps\_utility::add_wait( maps\_utility::_waittillmatch, "event_awareness", "heard_scream" );
    level maps\_utility::add_wait( maps\_utility::waittill_msg, "_stealth_no_corpse_announce" );
    maps\_utility::do_wait_any();
    wait 1.62;
    level.price.ignoreall = 0;
    level.gaz.ignoreall = 0;
}

hut_friendlies_chats_about_russians()
{
    var_0 = [];
    var_0["prone"] = 70;
    var_0["crouch"] = 260;
    var_0["stand"] = 380;
    level._stealth.logic.ai_event["ai_eventDistDeath"] = [];
    level._stealth.logic.ai_event["ai_eventDistDeath"]["spotted"] = 1024;
    level._stealth.logic.ai_event["ai_eventDistDeath"]["alert"] = 200;
    level._stealth.logic.ai_event["ai_eventDistDeath"]["hidden"] = 200;
    level._stealth.logic.ai_event["ai_eventDistPain"] = [];
    level._stealth.logic.ai_event["ai_eventDistPain"]["spotted"] = 512;
    level._stealth.logic.ai_event["ai_eventDistPain"]["alert"] = 200;
    level._stealth.logic.ai_event["ai_eventDistPain"]["hidden"] = 200;
    level._stealth.logic.ai_event["ai_eventDistBullet"] = [];
    level._stealth.logic.ai_event["ai_eventDistBullet"]["spotted"] = getdvar( "ai_eventDistBullet" );
    level._stealth.logic.ai_event["ai_eventDistBullet"]["alert"] = 64;
    level._stealth.logic.ai_event["ai_eventDistBullet"]["hidden"] = 64;
    maps\_stealth_logic::stealth_detect_ranges_set( undefined, var_0, undefined );
    var_1 = getent( "hut_patrol", "targetname" );
    var_1 thread custom_stealth_ai();
    var_1.goalradius = 4;
    var_1.no_corpse_announce = 1;
    thread kill_hut_patrol( var_1 );
    var_2 = getaiarray( "axis" );

    for ( var_3 = 0; var_3 < var_2.size; var_3++ )
        var_2[var_3].no_corpse_caring = 1;

    var_1.no_corpse_caring = undefined;
    var_1.found_corpse_wait = 15.0;
    maps\_utility::activate_trigger_with_targetname( "first_pier_trigger" );

    if ( getdvarint( "use_old_captainprice_briefing" ) != 1 )
    {
        var_4 = spawn( "script_origin", ( -15989.4, -10084.1, -163.0 ) );
        var_4.angles = ( 0.0, -65.663, 0.0 );
        var_5 = maps\_utility::make_array( level.gaz, level.price );
        var_4 thread maps\_anim::anim_first_frame( var_5, "captainpricebrief" );
        common_scripts\utility::flag_wait( "introscreen_complete" );
        level.price maps\_utility::set_force_color( "r" );
        level.gaz maps\_utility::delaythread( 0.5, maps\_utility::set_force_color, "r" );
        var_4 maps\_anim::anim_single( var_5, "captainpricebrief" );
    }
    else
    {
        common_scripts\utility::flag_wait( "introscreen_complete" );
        level.price maps\_utility::dialogue_queue( "expecting_us" );
        level.price maps\_utility::set_force_color( "r" );
        level.gaz maps\_utility::delaythread( 0.5, maps\_utility::set_force_color, "r" );
    }

    level.gaz maps\_utility::dialogue_queue( "loyalists_eh" );
    level.price maps\_utility::dialogue_queue( "wont_shoot_us" );
    level.gaz maps\_utility::dialogue_queue( "good_enough" );
    var_6 = getent( "pier_guy", "targetname" );

    if ( isalive( var_6 ) )
    {
        var_6.health = 20;
        level.price thread maps\_utility::cqb_aim( var_6 );
        level.gaz thread maps\_utility::cqb_aim( var_6 );
    }

    if ( isalive( var_1 ) )
        var_1 patrol_soon();

    maps\_utility::add_wait( maps\_utility::_wait, 8.4 );
    maps\_utility::add_wait( common_scripts\utility::flag_wait, "high_alert" );
    maps\_utility::add_wait( common_scripts\utility::flag_wait, "weapons_free" );
    var_1 maps\_utility::add_wait( maps\_utility::waittill_msg, "death" );
    maps\_utility::do_wait_any();

    if ( isalive( var_6 ) )
    {
        take_out_pier_guy( var_6 );
        level.price maps\_utility::cqb_aim();
        level.gaz maps\_utility::cqb_aim();
    }

    if ( isalive( var_1 ) && !common_scripts\utility::flag( "high_alert" ) )
    {
        level.price maps\_utility::cqb_aim( var_1 );
        level.gaz maps\_utility::cqb_aim( var_1 );
        level.price.ignoreall = 1;
        level.gaz.ignoreall = 1;
    }

    common_scripts\utility::flag_wait( "pier_guys" );
    level.price maps\_utility::cqb_aim();
    level.gaz maps\_utility::cqb_aim();

    if ( !common_scripts\utility::flag( "high_alert" ) )
    {
        level.price.ignoreall = 1;
        level.gaz.ignoreall = 1;
    }

    common_scripts\utility::flag_wait( "hut_cleared" );
    maps\_utility::autosave_by_name( "hut_cleared" );
    wait 0.05;

    if ( !common_scripts\utility::flag( "high_alert" ) )
    {
        level.price.ignoreall = 1;
        level.gaz.ignoreall = 1;
    }
}

price_tells_player_to_come_over()
{
    level endon( "breach_complete" );
    common_scripts\utility::flag_assert( "breach_complete" );
    common_scripts\utility::flag_wait( "over_here" );
    wait 2;
    level.price waittill( "goal" );

    for (;;)
    {
        if ( common_scripts\utility::flag( "player_near_overlook" ) )
            break;

        over_here();
        waitframe();
    }
}

overlook_price_tells_you_to_shoot_mgs()
{
    wait 8;
    level.price maps\_utility::dialogue_queue( "machine_gunners_in_windows" );

    if ( common_scripts\utility::flag( "mgs_cleared" ) )
        return;

    level endon( "mgs_cleared" );
    wait 3;
    mg_window_reminder_in_sight_guy();
    common_scripts\utility::flag_waitopen( "visible_mg_gunner_alive" );
    wait 4;
    level.price maps\_utility::dialogue_queue( "other_mg_wall" );
}

mg_window_reminder_in_sight_guy()
{
    level endon( "mgs_cleared" );

    if ( !common_scripts\utility::flag( "visible_mg_gunner_alive" ) )
        return;

    level.price maps\_utility::dialogue_queue( "mg_windows" );
    wait 4;

    if ( !common_scripts\utility::flag( "visible_mg_gunner_alive" ) )
        return;

    level.price maps\_utility::dialogue_queue( "mg_low" );
}

clear_target_radius()
{
    self waittill( "trigger" );
    var_0 = getent( self.target, "targetname" );
    var_1 = getaispeciesarray( "axis", "all" );
    common_scripts\utility::array_thread( var_1, ::die_if_near, var_0 );
}

die_if_near( var_0 )
{
    if ( distance( self.origin, var_0.origin ) > var_0.radius )
        return;

    maps\_utility::die();
}

price_finishes_farm()
{
    for (;;)
    {
        self waittill( "trigger", var_0 );

        if ( !isalive( var_0 ) )
            continue;

        if ( var_0 != level.price )
        {
            var_0 thread maps\_utility::ignore_triggers( 1.0 );
            continue;
        }

        break;
    }

    common_scripts\utility::flag_set( "farm_complete" );
}

informant_org()
{
    if ( !common_scripts\utility::flag( "player_in_house" ) )
    {
        var_0 = getent( "blackout_door", "targetname" );
        return var_0.origin + ( 0.0, 0.0, 100.0 );
    }

    var_1 = getent( "informant_org", "targetname" );

    if ( !common_scripts\utility::flag( "farm_complete" ) )
        return var_1.origin;

    var_1 = getent( var_1.target, "targetname" );
    return var_1.origin;
}

vip_death()
{
    self waittill( "death" );
    setdvar( "ui_deadquote", &"BLACKOUT_THE_INFORMANT_WAS_KILLED" );
    maps\_utility::missionfailedwrapper();
}

blackout_flashlight_guy()
{
    level.spotlight = [];
    var_0 = getent( "vip_spawner", "targetname" );
    var_1 = var_0 maps\_utility::spawn_ai();
    var_1 endon( "death" );
    var_1.animname = "vip";
    var_1.allowdeath = 1;
    var_1.ignoreme = 1;
    var_1.ignoreall = 1;
    var_1 thread vip_death();
    var_1.has_ir = undefined;
    var_1 thread maps\_utility::magic_bullet_shield();
    level.vip = var_1;
    var_2 = getnode( "vip_node", "targetname" );
    var_2 thread maps\_anim::anim_loop_solo( var_1, "idle" );
    wait 0.1;
    var_3 = spawn( "script_model", ( -1604.57, -2693.95, 538.5 ) );
    var_3.angles = ( 294.019, 248.305, -90.0576 );
    var_3 setmodel( "weapon_ak74u" );
    var_1 maps\_utility::gun_remove();
    var_4 = getent( "flashlight_spawner", "targetname" );
    var_4 maps\_utility::add_spawn_function( ::add_to_no_delete_group );
    var_5 = var_4 maps\_utility::spawn_ai();

    if ( maps\_utility::spawn_failed( var_5 ) )
        return;

    var_5 thread blind_guy_gets_flashed();
    var_5.animname = "flashlight_guy";
    var_6 = maps\_utility::spawn_anim_model( "flashlight" );
    level.flashlight = var_6;
    var_7 = [];
    var_7[var_7.size] = var_5;
    var_7[var_7.size] = var_6;
    var_8 = 0.15;
    var_2 thread maps\_anim::anim_single( var_7, "search" );
    maps\_utility::delaythread( 0.05, maps\_anim::anim_set_rate, var_7, "search", 0 );
    maps\_utility::delaythread( 0.05, maps\_anim::anim_set_time, var_7, "search", var_8 );
    var_5.health = 50000;
    var_5.allowdeath = 1;
    var_5.a.nodeath = 1;
    var_5.dontshootstraight = 1;
    thread blackout_flashlight_death( var_2, var_5, var_6, var_7 );
    common_scripts\utility::flag_wait( "blackout_flashlight_guy" );
    level.player.end_nightvision_hint = 1;
    level.price.ignoreme = 1;
    level.gaz.ignoreme = 1;
    var_9 = [];
    var_9[var_9.size] = var_1;
    var_9[var_9.size] = level.price;
    var_9[var_9.size] = var_6;
    level.flash_timer = gettime();
    maps\_utility::delaythread( 2, common_scripts\utility::flag_set, "price_and_gaz_attack_flashlight_guy" );

    if ( var_5 is_healthy() )
    {
        var_5 startignoringspotlight();
        blackout_flashlight_guy_attacks( var_2, var_5, var_6, var_7, var_8 );
    }

    common_scripts\utility::flag_set( "blackout_flashlightguy_dead" );

    if ( var_5 is_healthy() )
        var_5 stopignoringspotlight();

    if ( getdvarint( "use_old_nikolai_rescue" ) == 1 )
        level.price startignoringspotlight();

    common_scripts\utility::flag_wait( "door" );
    common_scripts\utility::flag_wait( "price_rescues_vip" );
    var_2 thread maps\_anim::anim_reach_solo( level.price, "rescue" );
    common_scripts\utility::flag_wait( "price_and_gaz_attack_flashlight_guy" );
    common_scripts\utility::flag_wait( "gaz_opens_door" );
    level.price waittill( "goal" );
    var_2 notify( "stop_loop" );
    level.vip playsound( "blackout_nkd_whoareyou" );
    var_2 thread maps\_anim::anim_single( var_9, "rescue" );
    level.vip waittillmatch( "single anim", "grab_gun" );
    level.vip maps\_utility::gun_recall();
    var_3 delete();
    level.vip waittillmatch( "single anim", "end" );
    level.vip setgoalpos( level.vip.origin );
    self.walkdist = 5000;
    level.price stopignoringspotlight();
    common_scripts\utility::flag_set( "blackout_rescue_complete" );
    var_10 = getaiarray( "allies" );
    common_scripts\utility::array_thread( var_10, maps\_headtracking::player_head_tracking );
    var_11 = getent( "blackout_path_block", "targetname" );
    var_11 solid();
    var_11 disconnectpaths();
    var_11 notsolid();
}

vip_rescue_dialogue( var_0 )
{
    if ( isdefined( level.rescue_dialogue ) )
        return;

    level.rescue_dialogue = 1;
    level.price maps\_utility::dialogue_queue( "its_him" );
    level.price.walkdist = 5800;
    level.gaz maps\_utility::dialogue_queue( "are_you_all_right" );
    level.vip thread vip_can_still_fight();
    wait 5.1;
    var_1 = getnode( "price_rescue_node", "targetname" );
    level.price setgoalnode( var_1 );
    level.price maps\_utility::dialogue_queue( "have_the_package" );
    maps\_utility::radio_dialogue( "on_our_way" );
    level.price maps\_utility::cqb_walk( "off" );
    common_scripts\utility::flag_set( "friendly_head_to_LZ" );
    level.price maps\_utility::dialogue_queue( "lets_go_lets_go" );
    level.price.walkdist = 16;
    level.vip maps\_utility::cqb_walk( "on" );
    level.gaz maps\_utility::delaythread( 2.5, maps\_utility::cqb_walk, "off" );
    level.vip maps\_utility::delaythread( 3, maps\_utility::cqb_walk, "off" );
    level.gaz maps\_utility::set_force_color( "p" );
    var_2 = getnode( "vip_rescue_node", "targetname" );
    level.vip setgoalnode( var_2 );
}

vip_can_still_fight()
{
    level.vip.disablefacialfilleranims = 1;
    maps\_utility::dialogue_queue( "yes_can_still_fight" );
    level.vip.disablefacialfilleranims = 0;
}

vip_talks_to_price()
{
    level.vip maps\_utility::dialogue_queue( "have_americans_attacked" );
    level.price maps\_utility::dialogue_queue( "invasion_begins" );
    level.vip maps\_utility::dialogue_queue( "making_a_mistake" );
}

flashlight_fx_change( var_0 )
{
    level.spotlight_caster delete();
    level.spotlight_caster = level.flashlight spawn_flashlighfx( "spotlight", 0 );
}

blackout_flashlight_guy_attacks( var_0, var_1, var_2, var_3, var_4 )
{
    var_1 endon( "damage" );
    var_1 endon( "doFlashBanged" );
    maps\_anim::anim_set_rate( var_3, "search", 1 );
    var_1 thread blackout_flashlight_kill_player();
    level.flashlight maps\_utility::delaythread( 0.5, ::spawn_flashlighfx, "spotlight", 8 );
    level.flashlight maps\_utility::delaythread( 0.5, ::spawn_flashlighfx, "flashlight", 8 );
    level.flashlight maps\_utility::delaythread( 0.5, maps\_utility::play_sound_on_entity, "scn_blackout_flashlight_on" );
    maps\_anim::anim_set_rate( var_3, "search", 2 );
    wait 1.2;
    var_1 notify( "flashlight_guy_attacks" );
    maps\_anim::anim_set_rate( var_3, "search", 1 );
    wait 1.25;
    maps\_anim::anim_set_rate( var_3, "search", 0 );
    var_2 stopanimscripted();
    var_2 notify( "single anim", "end" );
    wait 0.2;
    var_0 thread maps\_anim::anim_loop( var_3, "fire_loop", "stop_loop" );
    var_1 common_scripts\utility::waittill_either( "damage", "doFlashBanged" );
}

blackout_flashlight_kill_player()
{
    self endon( "death" );
    self waittill( "flashlight_guy_attacks" );
    var_0 = [];
    var_0[var_0.size] = 0.65;
    var_0[var_0.size] = 0.3;
    var_0[var_0.size] = 0.35;
    var_0[var_0.size] = 0.6;
    var_0[var_0.size] = 0.3;
    var_0[var_0.size] = 0.55;
    var_1 = 0;

    for (;;)
    {
        if ( !bullettracepassed( self gettagorigin( "tag_flash" ), level.player geteye(), 0, undefined ) )
        {
            wait 0.05;
            continue;
        }

        magicbullet( self.weapon, self gettagorigin( "tag_flash" ), level.player geteye() );
        playfxontag( common_scripts\utility::getfx( "pistol_muzzleflash" ), self, "tag_flash" );
        thread maps\_utility::play_sound_on_entity( "weap_m9_fire_npc" );
        wait(var_0[var_1]);
        var_1++;

        if ( var_1 >= var_0.size )
            var_1 = 0;
    }
}

blackout_flashlight_death( var_0, var_1, var_2, var_3 )
{
    var_1 common_scripts\utility::waittill_either( "damage", "doFlashBanged" );
    var_1.died = 1;

    if ( !isdefined( level.spotlight["spotlight"] ) )
    {
        level.flashlight maps\_utility::delaythread( 0.5, ::spawn_flashlighfx, "spotlight", 8 );
        level.flashlight maps\_utility::delaythread( 0.5, maps\_utility::play_sound_on_entity, "scn_blackout_flashlight_on" );
    }

    if ( isdefined( level.spotlight["flashlight"] ) )
        level.spotlight["flashlight"] delete();

    var_4 = getstartorigin( var_0.origin, var_0.angles, var_1 maps\_utility::getanim( "fl_death" ) );
    var_2 stopanimscripted();
    var_2 notify( "single anim", "end" );
    wait 0.2;
    var_0 thread maps\_anim::anim_single_solo( var_2, "fl_death" );

    if ( var_1.health == 50000 )
        var_1 waittill( "damage" );
    else
    {
        if ( distance( var_4, var_1.origin ) > 8 )
            var_1 thread maps\_anim::anim_single_solo( var_1, "fl_death_local" );
        else
            var_0 thread maps\_anim::anim_single_solo( var_1, "fl_death" );

        wait 0.3;
    }

    var_1 maps\_utility::die();
}

spawn_flashlighfx( var_0, var_1 )
{
    if ( isdefined( level.spotlight[var_0] ) )
        return;

    var_2 = spawn( "script_model", ( 0.0, 0.0, 0.0 ) );
    level.spotlight[var_0] = var_2;
    var_2 setmodel( "tag_origin" );
    var_2 linkto( self, "tag_light", ( var_1, 0, 0 ), ( 0.0, 0.0, 0.0 ) );
    playfxontag( common_scripts\utility::getfx( var_0 ), var_2, "tag_origin" );
}

drawanimtime( var_0 )
{
    for (;;)
        wait 0.05;
}

compare_animtime( var_0, var_1, var_2 )
{
    for (;;)
    {
        var_3 = var_1 getanimtime( var_1 maps\_utility::getanim( var_0 ) );
        var_4 = var_2 getanimtime( var_2 maps\_utility::getanim( var_0 ) );
        wait 0.05;
    }
}

flashlight_fire( var_0 )
{
    var_0.a.lastshoottime = gettime();
}

blind_guy_gets_flashed()
{
    self waittill( "doFlashBanged" );
    self.isflashed = 1;
    self stopanimscripted();
    self notify( "stop_first_frame" );
}

blind_corner_spawner_sound()
{
    self endon( "death" );
    common_scripts\utility::flag_wait( "blind_triggerwall_spawner" );
    self playsound( level.scr_sound["generic"]["breathing"] );
}

blind_guy_think()
{
    var_0 = [];
    var_0["lightswitch_spawner"] = "blind_lightswitch";
    var_0["wall_spawner"] = "blind_wall_feel";
    var_0["corner_spawner"] = "blind_fire_pistol";
    var_0["hide_spawner"] = "blind_hide_fire";
    common_scripts\utility::flag_init( "blind_trigger" + self.script_noteworthy );
    common_scripts\utility::flag_init( "blind" + self.script_noteworthy );
    maps\_utility::add_wait( maps\_utility::waittill_msg, "death" );
    level maps\_utility::add_func( common_scripts\utility::flag_set, "blind" + self.script_noteworthy );
    thread maps\_utility::do_wait();
    var_1 = [];
    var_1["lightswitch_spawner"] = 5.0;
    var_1["wall_spawner"] = 3.4;
    var_1["corner_spawner"] = 2;
    var_1["hide_spawner"] = 0.9;
    var_2 = [];
    var_2["lightswitch_spawner"] = 2.5;
    var_2["wall_spawner"] = 1.5;
    var_2["corner_spawner"] = 3;
    var_2["hide_spawner"] = 1.9;
    var_3 = var_1[self.script_noteworthy];
    var_4 = var_2[self.script_noteworthy];
    var_5 = var_0[self.script_noteworthy];
    var_6 = var_0[self.script_noteworthy] + "_death";

    if ( self.script_noteworthy == "corner_spawner" )
    {
        while ( !common_scripts\utility::flag_exist( "blind_triggerwall_spawner" ) )
            wait 0.05;

        thread blind_corner_spawner_sound();
    }

    var_7 = get_linked_trigger();
    self.ignoreme = 1;
    self.allowdeath = 1;
    self.health = 8;
    thread blind_guy_gets_flashed();
    var_8 = getent( self.target, "targetname" );
    var_8 thread maps\_anim::anim_generic_first_frame( self, var_5 );

    if ( self.script_noteworthy == "hide_spawner" )
    {
        self.a.pose = "crouch";
        var_7 waittill( "trigger" );

        if ( isalive( self ) )
        {
            maps\_utility::delaythread( 0.693, maps\_utility::set_generic_deathanim, var_6 );

            if ( !common_scripts\utility::isflashed() )
                var_8 thread maps\_anim::anim_generic( self, var_5 );

            wait(var_3);

            if ( isalive( self ) )
                thread blind_guy_dies_soon( var_4 );
        }

        return;
    }

    maps\_utility::set_generic_deathanim( var_6 );
    var_9 = getent( var_7.script_linkto, "script_linkname" );
    var_10 = get_linked_node();
    var_11 = getnode( var_10.script_linkto, "script_linkname" );
    var_12 = getnode( var_11.script_linkto, "script_linkname" );
    var_10 thread price_signals_on_arrival();
    var_13 = self.script_noteworthy;
    var_7 waittill( "trigger" );
    common_scripts\utility::flag_set( "blind_trigger" + var_13 );

    if ( isalive( self ) )
    {
        if ( !common_scripts\utility::isflashed() )
        {
            var_8 thread maps\_anim::anim_generic( self, var_5 );
            var_9 maps\_utility::wait_for_trigger_or_timeout( var_3 );
        }

        level.price advances_to_node( var_11 );

        if ( isalive( self ) )
            thread blind_guy_dies_soon( var_4 );
    }

    level.price advances_to_node( var_12 );
    level.price node_notifies_on_arrival( var_12 );
}

advances_to_node( var_0 )
{
    if ( isdefined( var_0.already_advanced ) )
        return;

    var_0.already_advanced = 1;
    self.goalradius = 16;
    self setgoalnode( var_0 );
}

price_signals_on_arrival()
{
    self waittill( "price_reaches_signal_node" );

    for (;;)
    {
        level.price maps\_utility::waittill_player_lookat();
        wait 0.5;

        if ( !isdefined( level.price.node ) )
            return;

        if ( level.price.node != self )
            return;

        var_0 = isdefined( level.price.node.script_noteworthy ) && level.price.node.script_noteworthy == "bottom_stairs_node";

        if ( var_0 )
        {
            level.price.aimblendtime = 0.5;
            level.scr_goaltime["generic"]["signal_go"] = 0.5;
        }

        level.price maps\_utility::handsignal( "go", 1 );
        wait(randomfloatrange( 1.5, 3.5 ));

        if ( var_0 )
        {
            level.price.aimblendtime = undefined;
            level.scr_goaltime["generic"]["signal_go"] = undefined;
        }
    }
}

node_notifies_on_arrival( var_0 )
{
    self waittill( "goal" );

    if ( !isdefined( self.node ) )
        return;

    if ( self.node != var_0 )
        return;

    var_0 notify( "price_reaches_signal_node" );
}

blind_guy_dies_soon( var_0 )
{
    self endon( "death" );
    self.ignoreme = 0;
    wait(var_0);
    level.price shoot();
    maps\_utility::die();
}

get_linked_trigger()
{
    var_0 = common_scripts\utility::get_links();

    for ( var_1 = 0; var_1 < var_0.size; var_1++ )
    {
        var_2 = getent( var_0[var_1], "script_linkname" );

        if ( !isdefined( var_2 ) )
            continue;

        if ( issubstr( var_2.classname, "trigger" ) )
            return var_2;
    }
}

get_linked_node()
{
    var_0 = common_scripts\utility::get_links();

    for ( var_1 = 0; var_1 < var_0.size; var_1++ )
    {
        var_2 = getnode( var_0[var_1], "script_linkname" );

        if ( !isdefined( var_2 ) )
            continue;

        return var_2;
    }
}

gaz_teleports_upstairs()
{
    var_0 = getnode( "gaz_teleport_node", "targetname" );
    level.gaz teleport( var_0.origin );
    level.gaz setgoalnode( var_0 );
    level.gaz maps\_utility::cqb_walk( "on" );
}

record_old_intensity()
{
    self.old_intensity = self getlightintensity();
}

blackout_lights_go_out()
{
    common_scripts\utility::flag_set( "lights_out" );
    var_0 = getnode( "power_node_switch", "targetname" );
    level.gaz setgoalnode( var_0 );
    level.gaz playsound( "scn_blackout_breaker_box" );
    wait 2.5;
    common_scripts\utility::flag_set( "turn_off_blackout_spotlights" );
    var_1 = getent( "blackout_spotlight_model", "targetname" );
    var_1 setmodel( "ch_street_wall_light_01_off" );
    var_2 = getent( "blackout_lamp_model", "targetname" );
    var_2 setmodel( "greece_gaslamp" );
    soundscripts\_snd::snd_message( "aud_start_power_off_sfx" );
}

blackout_lights_go_out_h1()
{
    common_scripts\utility::flag_set( "lights_out" );
    common_scripts\utility::flag_set( "turn_off_blackout_spotlights" );
    var_0 = getent( "blackout_spotlight_model", "targetname" );
    var_0 setmodel( "ch_street_wall_light_01_off" );
    soundscripts\_snd::snd_message( "aud_start_power_off_sfx" );
}

blackout_fence_swap()
{
    var_0 = getent( "blackout_fence_up", "targetname" );
    var_1 = getent( "blackout_fence_up_model", "targetname" );
    var_0 connectpaths();
    var_0 delete();
    var_1 delete();
    var_2 = getent( "blackout_fence_down", "targetname" );
    var_3 = getent( "blackout_fence_down_model", "targetname" );
    var_3 show();
    var_2 show();
    var_2 solid();
}

gaz_runs_by_window()
{
    var_0 = getnode( "gaz_teleport_node", "targetname" );
    var_1 = getnode( var_0.target, "targetname" );
    level.gaz maps\_spawner::go_to_node( var_1 );
    common_scripts\utility::flag_set( "gaz_got_to_blackout_door" );
}

gaz_opens_door_and_enters()
{
    level endon( "blackout_rescue_complete" );
    common_scripts\utility::flag_wait( "gaz_got_to_blackout_door" );
    var_0 = getent( "gaz_door", "targetname" );
    var_1 = getent( "exit_door", "targetname" );
    var_2 = getent( "exit_door_model", "targetname" );
    var_2 linkto( var_1 );
    var_1 thread maps\_utility::palm_style_door_open();
    soundscripts\_snd::snd_message( "aud_gaz_open_door_rescue" );

    if ( getdvarint( "use_old_gaz_blackout_door" ) == 1 )
        var_0 maps\_anim::anim_generic( level.gaz, "smooth_door_open" );
    else
        var_0 maps\_anim::anim_single_solo( level.gaz, "open_blackout_door" );

    var_3 = getnode( "gaz_door_dead_node", "targetname" );
    level.gaz setgoalnode( var_3 );
    common_scripts\utility::flag_set( "gaz_opens_door" );
    common_scripts\utility::flag_wait( "price_and_gaz_attack_flashlight_guy" );
    var_3 = getnode( var_3.target, "targetname" );
    level.gaz setgoalnode( var_3 );
}

gaz_goes_to_cut_the_power()
{
    setsaveddvar( "ai_friendlyFireBlockDuration", "0" );
    var_0 = getnode( "power_node", "targetname" );
    level.gaz setgoalnode( var_0 );
    level endon( "lights_out" );
    level.gaz.goalradius = 32;
    level.gaz waittill( "goal" );
    common_scripts\utility::flag_wait( "player_bugs_gaz" );
    level.gaz maps\_utility::dialogue_queue( "regroup_with_price" );
}

gaz_goes_to_cut_the_power_h1()
{
    setsaveddvar( "ai_friendlyFireBlockDuration", "0" );
    var_0 = getnode( "power_node", "targetname" );
    level.gaz setgoalnode( var_0 );
    var_1 = spawn( "script_origin", ( -1042.69, -3254.42, 361.123 ) );
    var_1.angles = ( 0.0, -45.133, 0.0 );
    var_2 = getent( "house_electric_box_animated", "targetname" );
    var_2 maps\_utility::assign_animtree( "electrical_box_animated" );
    var_1 thread maps\_anim::anim_loop_solo( var_2, "idle", undefined, "stop_loop_box" );
    level.gaz.goalradius = 120;
    level.gaz waittill( "goal" );
    var_1 maps\_anim::anim_reach_and_arrive_facing_anim_solo( level.gaz, "powercut_idle" );
    var_1 thread maps\_anim::anim_loop_solo( level.gaz, "powercut_idle", undefined, "stop_loop_gaz" );
    level.gaz thread maps\_headtracking::player_head_tracking();
    common_scripts\utility::flag_wait( "gaz_do_it" );
    maps\_utility::delaythread( 4.5, common_scripts\_exploder::exploder, 25 );
    level.gaz maps\_headtracking::head_tracking_end( 1 );
    var_1 notify( "stop_loop_gaz" );
    var_1 notify( "stop_loop_box" );
    level.gaz thread maps\_utility::play_sound_on_entity( "scn_blackout_breaker_box_new" );
    var_3 = [];
    var_3[0] = level.gaz;
    var_3[1] = var_2;
    var_1 thread maps\_anim::anim_single( var_3, "powercut" );
    level.gaz waittillmatch( "single anim", "powercut" );
    blackout_lights_go_out_h1();
    var_2 waittillmatch( "single anim", "end" );
    var_1 maps\_anim::anim_loop_solo( var_2, "idle_cut", undefined, "stop_loop_box" );
}

gaz_play_powercut_generic_facial_anim( var_0 )
{
    level.gaz thread maps\_utility::dialogue_queue( "powercut_dialog" );
}

price_approaches_door()
{
    level.price.fixednode = 0;
    var_0 = getent( "blackout_door", "targetname" );
    var_0 maps\_anim::anim_generic_reach_and_arrive( level.price, "smooth_door_open" );
    level.price.goalradius = 32;
    level.price.grenadeammo = 0;
    level.price.baseaccuracy = 1000;
    level.price.noreload = 1;
}

price_opens_door_and_goes_in()
{
    level.price.fixednode = 1;
    var_0 = getent( "blackout_door", "targetname" );
    var_1 = getent( "slow_door", "targetname" );
    var_2 = getent( "slow_door_model", "targetname" );
    var_2 linkto( var_1 );
    var_1 thread maps\_utility::palm_style_door_open();
    var_0 thread maps\_anim::anim_generic( level.price, "smooth_door_open" );
    var_3 = getnode( "blackout_first_price_node", "targetname" );
    level.price advances_to_node( var_3 );
    level.price thread node_notifies_on_arrival( var_3 );
}

price_attacks_door_guy()
{
    var_0 = getnode( "price_door_attack_node", "targetname" );
    level.price setgoalnode( var_0 );
    thread last_signal_node( var_0 );
    common_scripts\utility::flag_wait( "price_and_gaz_attack_flashlight_guy" );
    var_0 = getnode( var_0.target, "targetname" );
    level.price setgoalnode( var_0 );
    common_scripts\utility::flag_wait( "blackout_flashlightguy_dead" );
    level.price.fixednode = 1;
    var_1 = getnode( "price_rescue_room_node", "targetname" );
    level.price setgoalnode( var_1 );
}

last_signal_node( var_0 )
{
    level endon( "price_and_gaz_attack_flashlight_guy" );
    common_scripts\utility::flag_wait( "door" );
    var_0 thread price_signals_on_arrival();
    level.price.goalradius = 8;
    level.price waittill( "goal" );
    var_0 notify( "price_reaches_signal_node" );
}

get_evac_org()
{
    var_0 = getent( "rescue_heli_org", "targetname" );
    return var_0.origin;
}

open_door_trigger( var_0 )
{
    common_scripts\utility::flag_init( var_0 + "_door_open" );
    self waittill( "trigger", var_1 );
    wait 0.8;
    var_2 = getent( var_0 + "_door_org", "targetname" );
    var_3 = getent( var_0 + "_door", "targetname" );
    var_4 = getentarray( var_0 + "_door_extra_model", "targetname" );

    if ( isdefined( var_4 ) )
    {
        foreach ( var_6 in var_4 )
            var_6 linkto( var_3 );
    }

    var_3 thread maps\_utility::palm_style_door_open();
    var_8 = getanimlength( var_1 maps\_utility::getanim_generic( "smooth_door_open" ) );
    var_2 thread maps\_anim::anim_generic( var_1, "smooth_door_open" );
    soundscripts\_snd::snd_message( "aud_open_door_meeting" );
    wait(var_8 - 0.3);
    var_3 notsolid();
    common_scripts\utility::flag_set( var_0 + "_door_open" );
    wait 0.5;
    var_3 solid();
}

price_evac_idle()
{
    self waittill( "evac" );
    maps\_anim::anim_loop_solo( level.price, "evac_idle", "tag_detach" );
}

should_break_grenade_launcher_hint( var_0 )
{
    var_1 = self getweaponslistall();
    var_2 = [];

    for ( var_3 = 0; var_3 < var_1.size; var_3++ )
    {
        var_4 = var_1[var_3];
        var_2[var_4] = self getweaponammoclip( var_4 );
    }

    if ( !isdefined( var_2["alt_m4m203_silencer_reflex"] ) )
        return 1;

    var_4 = self getcurrentweapon();

    if ( var_4 == "alt_m4m203_silencer_reflex" )
        return 1;

    if ( common_scripts\utility::flag( "power_plant_cleared" ) )
        return 1;

    return var_2["alt_m4m203_silencer_reflex"] == 0;
}

should_break_sniper_rifle_hint( var_0 )
{
    var_1 = self getweaponslistall();
    var_2 = [];

    for ( var_3 = 0; var_3 < var_1.size; var_3++ )
    {
        var_4 = var_1[var_3];
        var_2[var_4] = 1;
    }

    if ( !isdefined( var_2["m14_scoped_silencer_woodland"] ) )
        return 1;

    if ( common_scripts\utility::flag( "overlook_attack_begins" ) )
        return 1;

    return self getcurrentweapon() == "m14_scoped_silencer_woodland";
}

attack_player()
{
    self endon( "death" );
    self.goalradius = 1200;

    for (;;)
    {
        self.goalradius -= 128;

        if ( self.goalradius < 750 )
            self.goalradius = 750;

        self setgoalpos( level.player.origin );
        wait 5;
    }
}

grenade_hint_logic()
{
    level endon( "farm_complete" );
    common_scripts\utility::flag_wait( "m203_hint" );
    level.player thread maps\_utility::display_hint( "grenade_launcher" );
}

swamp_sprint_protection()
{
    common_scripts\utility::flag_wait( "play_nears_meeting" );
    var_0 = [];
    var_0[var_0.size] = "pier_guys";
    var_0[var_0.size] = "hut_guys";
    var_0[var_0.size] = "chess_cleared";
    var_0[var_0.size] = "shack_cleared";
    var_1 = 0;

    for ( var_2 = 0; var_2 < var_0.size; var_2++ )
    {
        if ( !common_scripts\utility::flag( var_0[var_2] ) )
            break;

        var_1++;
    }

    if ( var_1 == var_0.size )
        return;

    var_3 = getentarray( "meeting_catchup_org", "targetname" );
    level.price teleport( var_3[0].origin );
    level.gaz teleport( var_3[1].origin );
    level.price maps\_utility::set_force_color( "c" );
    level.gaz maps\_utility::set_force_color( "c" );
    common_scripts\utility::array_levelthread( var_0, ::kill_all_ai_of_deathflag );
}

kill_all_ai_of_deathflag( var_0 )
{
    common_scripts\utility::array_levelthread( level.deathflags[var_0]["ai"], ::kill_myself_shortly );
}

kill_myself_shortly( var_0 )
{
    if ( !isalive( var_0 ) )
        return;

    var_0 endon( "death" );
    wait(randomfloatrange( 0.1, 3.5 ));
    var_0 maps\_utility::die();
}

price_and_gaz_catchup_to_bridge()
{
    var_0 = getentarray( "friendly_catchup_org_1", "targetname" );

    for ( var_1 = 0; var_1 < var_0.size; var_1++ )
    {
        level.gaz teleport( var_0[var_1].origin );
        level.price teleport( var_0[var_1].origin );
    }
}

blackhawk_sound()
{
    thread play_heli_scripted_sfx();
}

play_heli_scripted_sfx()
{
    thread maps\_utility::play_loop_sound_on_tag( "h1r_blackout_bh_helicopter_wind", "body_animate_jnt" );
    thread maps\_utility::play_sound_on_tag_endon_death( "scn_rescue_bh_landing", "body_animate_jnt" );
    wait 4;
    thread maps\_utility::play_loop_sound_on_tag( "scn_rescue_bh_landed", "body_animate_jnt", 1, 1, 5, 3.0 );
    common_scripts\utility::flag_wait( "player_gets_on_heli" );
    thread maps\_utility::play_sound_on_tag_endon_death( "scn_rescue_bh_takes_off", "body_animate_jnt" );
}

player_jumps_into_heli()
{
    level endon( "player_gets_on_heli" );

    for (;;)
    {
        level.hud_mantle["text"].alpha = 0;
        common_scripts\utility::flag_wait( "player_near_heli" );
        detect_player_mantle();
    }
}

detect_player_mantle()
{
    level endon( "player_gets_on_heli" );

    for (;;)
    {
        if ( !common_scripts\utility::flag( "player_near_heli" ) )
        {
            level.hud_mantle["text"].alpha = 0;
            level.player allowjump( 1 );
            return;
        }

        level.player allowjump( 0 );
        level.hud_mantle["text"].font = "timer";
        level.hud_mantle["text"].fontscale = 0.5;
        level.hud_mantle["text"].alpha = 1;

        if ( level.player jumpbuttonpressed() )
            common_scripts\utility::flag_set( "player_gets_on_heli" );

        wait 0.05;
    }
}

first_rpg_spawner_think()
{
    thread maps\_utility::magic_bullet_shield();
    self.ignoreme = 1;
    self.ignorerandombulletdamage = 1;
    self waittill( "goal" );
    self.a.rockets = 5000;
    var_0 = maps\_vehicle::get_vehicle_from_targetname( "bm21_03" );

    if ( isalive( var_0 ) )
    {
        self setentitytarget( var_0 );
        var_1 = missile_createattractororigin( var_0.origin + ( 0.0, 0.0, 50.0 ), 5000, 500 );
        var_0.health = 500;
        var_0 maps\_utility::add_wait( maps\_utility::waittill_msg, "death" );
        maps\_utility::add_wait( maps\_utility::_wait, 30 );
        maps\_utility::do_wait_any();

        if ( isalive( var_0 ) )
            radiusdamage( var_0.origin, 250, 5000, 2500 );

        missile_deleteattractor( var_1 );
    }

    self.ignorerandombulletdamage = 0;
    self.ignoreme = 0;
    maps\_utility::stop_magic_bullet_shield();
    self.a.rockets = 1;
    var_0 thread maps\_utility::play_sound_on_entity( "scn_blackout_bmp_explosion" );
    wait 1;
    maps\_utility::die();
    common_scripts\utility::flag_set( "first_bmp_destroyed" );
}

bmp_killer_spawner_think()
{
    level.bmp_killer = self;
    thread maps\_utility::magic_bullet_shield();
    self.ignoreme = 1;
    self.ignorerandombulletdamage = 1;
    self waittill( "goal" );
    self.a.rockets = 5000;

    if ( isalive( level.enemy_bmp ) )
    {
        self setentitytarget( level.enemy_bmp );
        var_0 = missile_createattractororigin( level.enemy_bmp.origin + ( 0.0, 0.0, 0.0 ), 5000, 500 );
        level.enemy_bmp maps\_vehicle::godoff();
        level.enemy_bmp.health = 500;
        level.enemy_bmp maps\_utility::add_wait( maps\_utility::waittill_msg, "death" );
        maps\_utility::add_wait( maps\_utility::_wait, 30 );
        maps\_utility::do_wait_any();

        if ( isalive( level.enemy_bmp ) )
            radiusdamage( level.enemy_bmp.origin, 250, 5000, 2500 );

        missile_deleteattractor( var_0 );
    }

    self.ignorerandombulletdamage = 0;
    self.ignoreme = 0;
    maps\_utility::stop_magic_bullet_shield();
    self.a.rockets = 1;
    var_1 = getnode( "cliff_remove_node", "targetname" );
    self setgoalnode( var_1 );
    self.goalradius = 32;
    self waittill( "goal" );
    self delete();
}

waittill_on_node( var_0 )
{
    self waittill( "goal" );

    for (;;)
    {
        if ( !isdefined( self.node ) )
        {
            wait 0.05;
            continue;
        }

        if ( self.node != var_0 )
        {
            wait 0.05;
            continue;
        }

        if ( distance( self.origin, var_0.origin ) > 12 )
        {
            wait 0.05;
            continue;
        }

        break;
    }
}

first_signal_on_node( var_0, var_1 )
{
    level endon( "high_alert" );
    var_2 = getent( "hut_patrol", "targetname" );

    if ( !isalive( var_2 ) )
        return;

    var_2 endon( "death" );
    waittill_on_node( var_0 );
    common_scripts\utility::flag_wait( "player_near_pier" );
    thread maps\_anim::anim_generic( self, var_1 );
    wait 2.0;
    common_scripts\utility::flag_set( "weapons_free" );
}

shack_signal( var_0 )
{
    level endon( "high_alert" );
    level endon( "chess_cleared" );
    level.price waittill_on_node( var_0 );
    level.price thread maps\_anim::anim_generic( level.price, "go_exposed" );
    level.gaz thread maps\_utility::dialogue_queue( "plant_claymore" );
    var_1 = getent( "hut_approach_clip", "targetname" );
    var_1 connectpaths();
    var_1 delete();
    wait 4;
    level.player thread maps\_utility::display_hint( "claymore_plant" );

    for (;;)
    {
        if ( level.player should_break_claymores() )
            break;

        wait 0.05;
    }

    wait 3.0;
    level.player thread maps\_utility::display_hint( "claymore_placement" );
}

signal_on_node( var_0, var_1 )
{
    level endon( "high_alert" );
    waittill_on_node( var_0 );
    maps\_anim::anim_generic( self, var_1 );
}

price_and_gaz_flash_hut()
{
    if ( common_scripts\utility::flag( "hut_guys" ) )
        return;

    level endon( "hut_guys" );
    level endon( "high_alert" );
    level endon( "recent_flashed" );
    common_scripts\utility::flag_wait( "price_throws_flash" );
    common_scripts\utility::flag_wait( "gaz_flash_ready" );
    level.friendly_flashbangimmunity = 1;
    level.price maps\_utility::setflashbangimmunity( 1 );
    level.gaz maps\_utility::setflashbangimmunity( 1 );
    var_0 = getent( "price_door_flash", "script_noteworthy" );

    for (;;)
    {
        if ( !isdefined( level.price.node ) )
        {
            wait 0.05;
            continue;
        }

        if ( !level.price istouching( var_0 ) )
        {
            wait 0.05;
            continue;
        }

        break;
    }

    wait 0.5;
    var_1 = spawn( "script_origin", level.price.node.origin );
    var_1.angles = level.price.node.angles + ( 0.0, 90.0, 0.0 );
    var_1 thread maps\_anim::anim_generic( level.price, "grenade_throw" );
    level.price thread animscripts\shared::donotetracks( "single anim", animscripts\combat_utility::h1_grenade_attach_detach_listener );
    var_2 = level.price.grenadeweapon;
    level.price.grenadeweapon = "flash_grenade";
    level.price.grenadeammo++;
    wait 3.5;
    var_3 = getent( "flash_throw_offset", "targetname" );
    var_4 = getent( var_3.target, "targetname" );
    var_5 = var_3.origin;
    var_6 = var_5 + var_4.origin - var_3.origin;
    var_7 = var_4.origin - var_3.origin;
    var_8 = vectornormalize( var_6 - var_5 );
    var_9 = 350;
    var_8 = maps\_utility::vector_multiply( var_8, var_9 );
    level.price magicgrenademanual( var_5, var_8, 1.1 );
    level.price.grenadeweapon = var_2;
    level.price.grenadeammo = 0;
    wait 0.8;
    common_scripts\utility::flag_set( "gaz_rushes_hut" );
}

should_break_claymores()
{
    if ( common_scripts\utility::flag( "high_alert" ) )
        return 1;

    if ( common_scripts\utility::flag( "chess_cleared" ) )
        return 1;

    var_0 = maps\_utility::getplayerclaymores();

    if ( var_0 <= 0 )
        return 1;

    return self getcurrentweapon() == "claymore";
}

should_break_claymore_placement()
{
    if ( common_scripts\utility::flag( "high_alert" ) )
        return 1;

    if ( common_scripts\utility::flag( "chess_cleared" ) )
        return 1;

    var_0 = maps\_utility::getplayerclaymores();

    if ( var_0 < 2 )
        return 1;

    return self getcurrentweapon() != "claymore";
}

sniper_remove_trigger()
{
    self waittill( "trigger" );
    common_scripts\utility::flag_set( "bm21s_attack" );
    soundscripts\_snd::snd_message( "aud_start_sniping_mix" );

    if ( !player_has_weapon_substr( "m14" ) )
        return;

    var_0 = getent( self.target, "targetname" );
    var_0 delete();
}

player_has_weapon_substr( var_0 )
{
    var_1 = level.player getweaponslistall();

    for ( var_2 = 0; var_2 < var_1.size; var_2++ )
    {
        if ( issubstr( var_1[var_2], var_0 ) )
            return 1;
    }

    return 0;
}

add_to_no_delete_group()
{
    if ( !isdefined( level.blackout_house_no_delete_group ) )
        level.blackout_house_no_delete_group = [];

    level.blackout_house_no_delete_group[level.blackout_house_no_delete_group.size] = self;
}

player_in_house()
{
    var_0 = getaiarray( "axis" );
    var_0 = common_scripts\utility::array_remove_array( var_0, level.blackout_house_no_delete_group );
    common_scripts\utility::array_levelthread( var_0, maps\_utility::deleteent );
    objective_position( 7, informant_org() );
    objective_ring( 7 );
    level.player thread maps\_utility::display_hint( "nvg" );
    common_scripts\utility::flag_waitopen( "player_in_house" );
    level.player thread maps\_utility::display_hint( "disable_nvg" );
}

watch_for_movement()
{
    if ( getaiarray( "axis" ).size > 0 )
        return;

    wait 0.5;

    if ( common_scripts\utility::flag( "high_alert" ) )
        return;

    level endon( "high_alert" );
    wait 8;
    maps\_utility::radio_dialogue( "watch_for_movement" );
    wait 2;
}

lightswitch_response()
{
    common_scripts\utility::flag_wait( "lightswitch" );
    wait 1.2;
    level.price maps\_anim::anim_single_queue( level.price, "this_night_vision" );
}

get_prop( var_0 )
{
    var_1 = undefined;

    if ( var_0 == "binocs" )
    {
        var_1 = spawn( "script_model", ( 0.0, 0.0, 0.0 ) );
        var_1 setmodel( level.scr_model["binocs"] );
        var_1 linkto( self, "TAG_INHAND", ( 0.0, 0.0, 0.0 ), ( 0.0, 0.0, 0.0 ) );
    }

    return var_1;
}

tango_down_detection()
{
    self waittill( "death" );
    wait 1;

    if ( gettime() < level.next_tango_timer )
        return;

    level.next_tango_timer = gettime() + 4000;

    if ( randomint( 100 ) > 50 )
        level.price maps\_anim::anim_single_queue( level.price, "tango_down" );
    else
        level.gaz maps\_anim::anim_single_queue( level.gaz, "tango_down" );
}

patrol_soon()
{
    self endon( "death" );

    if ( common_scripts\utility::flag( "high_alert" ) )
        return;

    level endon( "high_alert" );
    common_scripts\utility::flag_wait( "player_near_pier" );
    thread maps\_patrol::patrol( self.target );
}

ignore_until_high_alert()
{
    self endon( "death" );
    self.ignoreme = 1;
    common_scripts\utility::flag_wait( "high_alert" );
    self.ignoreme = 0;
}

activate_farmhouse_defenders()
{
    wait 4;
    var_0 = getent( "farmhouse_defender", "target" );

    for ( var_1 = 0; var_1 < 20; var_1++ )
    {
        var_0 maps\_utility::activate_trigger();
        wait 2;
    }
}

set_allowed_stances( var_0, var_1, var_2 )
{
    if ( isdefined( var_2 ) )
    {
        self allowedstances( var_0, var_1, var_2 );
        return;
    }

    if ( isdefined( var_1 ) )
    {
        self allowedstances( var_0, var_1 );
        return;
    }

    self allowedstances( var_0 );
}

field_russians_go_up_hill()
{
    common_scripts\utility::flag_wait( "go_up_hill" );
    var_0 = getent( "mortar_setup_1", "targetname" );
    var_1 = common_scripts\utility::get_array_of_closest( var_0.origin, level.field_russians );

    for ( var_2 = 0; var_2 < var_1.size; var_2++ )
    {
        var_1[var_2] notify( "go_up_hill" );

        if ( !isdefined( var_1[var_2].script_noteworthy ) )
            wait(0.3 + randomfloat( 0.1 ));
    }
}

delete_meeting_clip( var_0 )
{
    var_0 connectpaths();
    var_0 delete();
}

hut_runner_think()
{
    self endon( "death" );
    common_scripts\utility::flag_wait( "high_alert" );
    var_0 = getent( "hut_runner_dest", "targetname" );

    for (;;)
    {
        self notify( "_stealth_stop_stealth_behavior" );
        self setgoalpos( var_0.origin );
        self.goalradius = 128;
        self.pathenemyfightdist = 32;
        self.pathenemylookahead = 32;
        wait 0.05;
    }
}

smell_kamarov()
{
    common_scripts\utility::flag_wait( "smell_kamarov" );
    level.price maps\_utility::dialogue_queue( "smell_that" );
    wait 0.8;
    level.gaz maps\_utility::dialogue_queue( "yeah_kam" );
}

kam_and_price_chat()
{
    if ( getdvarint( "use_old_meeting" ) == 1 )
        level.gaz maps\_utility::delaythread( 25.4, maps\_anim::anim_single_solo, level.gaz, "bloody_right" );

    level.kamarov maps\_utility::delaythread( 33.3, maps\_utility::dialogue_queue, "prepare_to_attack" );
    level.kamarov maps\_utility::delaythread( 39.3, maps\_utility::dialogue_queue, "good_spot" );
    level maps\_utility::delaythread( 43, common_scripts\utility::flag_set, "ready_to_commence_attack" );
}

display_sniper_hint()
{
    if ( level.player should_break_sniper_rifle_hint() )
        return;

    level.price maps\_utility::dialogue_queue( "switch_sniper" );
    wait 4;
    level.player thread maps\_utility::display_hint( "sniper_rifle" );
}

macmillan_proud_hook()
{
    self waittill( "death", var_0, var_1, var_2 );

    if ( isdefined( level.mac_proud ) )
        return;

    wait 0.35;

    if ( common_scripts\utility::flag( "mission_chatter" ) )
        return;

    if ( !isalive( var_0 ) )
        return;

    if ( !isplayer( var_0 ) )
        return;

    if ( !isdefined( var_2 ) )
        return;

    if ( !issubstr( var_2, "m14" ) )
        return;

    if ( distance( self.origin, var_0.origin ) < 3000 )
        return;

    level.mac_proud = 1;
    level.price maps\_utility::dialogue_queue( "macmillan_impressed" );
}

visible_mgguy_think()
{
    common_scripts\utility::flag_set( "visible_mg_gunner_alive" );
    self waittill( "death" );
    common_scripts\utility::flag_clear( "visible_mg_gunner_alive" );
}

damn_helicopters()
{
    common_scripts\utility::flag_set( "mission_chatter" );
    level.kamarov maps\_utility::dialogue_queue( "damn_helis" );
    level.price maps\_utility::dialogue_queue( "you_didnt_say" );

    if ( getdvarint( "use_old_burning_house" ) == 1 )
        level.kamarov maps\_utility::dialogue_queue( "need_protect" );

    thread damn_helicopters_followup();
}

damn_helicopters_followup()
{
    if ( getdvarint( "use_old_burning_house" ) != 1 )
        level.kamarov maps\_utility::dialogue_queue( "need_protect" );

    wait 1;
    level.price maps\_utility::dialogue_queue( "make_quick" );
    level.kamarov maps\_utility::dialogue_queue( "nothing_to_worry" );

    if ( getdvarint( "use_old_burning_house" ) == 1 )
    {
        wait 1.5;
        level.kamarov maps\_utility::dialogue_queue( "stalling" );
        wait 1;
        level.gaz maps\_utility::dialogue_queue( "beat_it_out" );
        wait 0.8;
        level.price maps\_utility::dialogue_queue( "not_yet" );
        common_scripts\utility::flag_clear( "mission_chatter" );
    }
    else if ( !common_scripts\utility::flag( "h1_burninghouse_price" ) )
        common_scripts\utility::flag_clear( "mission_chatter" );
}

cliff_dialogue()
{
    maps\_utility::delaythread( 2, common_scripts\utility::flag_set, "head_to_the_cliff" );
    level.kamarov maps\_utility::dialogue_queue( "heavy_resistance" );
    level.price maps\_utility::dialogue_queue( "our_informant" );
    level.kamarov maps\_utility::dialogue_queue( "then_help" );
}

power_station_dialogue()
{
    common_scripts\utility::flag_wait( "power_station_dialogue_begins" );
    common_scripts\utility::flag_wait( "kam_starts_talking" );
    thread price_and_gaz_arrive_at_fight_check();
    level.kamarov thread maps\_utility::dialogue_queue( "final_assault" );
    maps\_utility::delaythread( 5, common_scripts\utility::flag_set, "kam_wants_more_sniping" );
    common_scripts\utility::flag_wait( "gaz_at_fight" );
    common_scripts\utility::flag_wait( "price_at_fight" );
    common_scripts\utility::flag_wait( "kam_at_fight" );
    common_scripts\utility::flag_wait_or_timeout( "player_at_rappel", 5 );
    common_scripts\utility::flag_set( "gaz_kam_fight_begins" );
    var_0 = [];
    var_0[var_0.size] = level.price;
    var_0[var_0.size] = level.gaz;
    var_0[var_0.size] = level.kamarov;
    level.kamarov thread maps\_utility::gun_remove();
    var_1 = getent( "gaz_kam_org", "targetname" );
    var_1 thread maps\_anim::anim_single( var_0, "cliff_start" );
    var_2 = 5.5;
    level.timer = gettime();

    if ( getdvarint( "use_old_rappel_fight" ) == 1 )
    {
        level.gaz maps\_utility::delaythread( 10 - var_2, maps\_anim::anim_single_solo, level.gaz, "enough_sniping" );
        level.kamarov maps\_utility::delaythread( 10.2 - var_2, ::_stopsounds );
        level.kamarov maps\_utility::delaythread( 16.2 - var_2, ::_stopsounds );
        level.kamarov maps\_utility::delaythread( 12.25 - var_2, maps\_anim::anim_single_solo, level.kamarov, "russian_out_of_mind" );
        level.gaz maps\_utility::delaythread( 14.8 - var_2, maps\_anim::anim_single_solo, level.gaz, "where_is" );
        level.kamarov maps\_utility::delaythread( 16.6 - var_2, maps\_anim::anim_single_solo, level.kamarov, "the_house" );
        level.gaz maps\_utility::delaythread( 21.0 - var_2, maps\_anim::anim_single_solo, level.gaz, "wasnt_that_hard" );
        level.price maps\_utility::delaythread( 24 - var_2, maps\_anim::anim_single_solo, level.price, "reach_that_house" );
    }
    else
        level.kamarov maps\_utility::delaythread( 10 - var_2, ::_stopsounds );

    maps\_utility::delaythread( 24 - var_2, common_scripts\utility::flag_set, "price_got_to_go" );
    wait(26 - var_2);
    common_scripts\utility::flag_set( "gaz_convinces_kam_otherwise" );

    if ( common_scripts\utility::flag( "player_rappels" ) )
        return;

    level endon( "player_rappels" );
    wait 12;
    level.price maps\_utility::dialogue_queue( "get_down_here" );
}

_stopsounds()
{
    self stopsounds();
}

bmp_targets_stuff()
{
    self endon( "death" );
    level.timer = gettime();
    wait 15.2;
    var_0 = getentarray( "cliff_tank_target", "targetname" );
    thread bmp_aims_at_targets();
    wait 1.5;

    for (;;)
    {
        var_1 = randomintrange( 4, 7 );

        for ( var_2 = 0; var_2 < var_1; var_2++ )
        {
            self fireweapon();
            wait 0.35;
        }

        wait(randomfloatrange( 1.5, 3 ));
    }
}

bmp_aims_at_targets()
{
    self endon( "death" );
    var_0 = getentarray( "cliff_tank_target", "targetname" );

    for (;;)
    {
        for ( var_1 = 0; var_1 < var_0.size; var_1++ )
        {
            self setturrettargetent( var_0[var_1] );
            self waittill( "turret_on_target" );
            wait(randomfloat( 1.5 ));
        }
    }
}

is_healthy()
{
    if ( !isalive( self ) )
        return 0;

    if ( isdefined( self.isflashed ) )
        return 0;

    return self.health == 50000;
}

music_control()
{
    wait 1;

    if ( !common_scripts\utility::flag( "smell_kamarov" ) )
        thread music_playback( "blackout_deadpool", 121, 1 );

    common_scripts\utility::flag_wait( "smell_kamarov" );
    level notify( "next_music_track" );
    musicstop( 18 );
    common_scripts\utility::flag_wait( "bm21s_attack" );
    wait 12;
    thread music_playback( "blackout_danger", 124, 1 );
    common_scripts\utility::flag_wait( "overlook_attack_begins" );
    level notify( "next_music_track" );
    musicstop( 6 );
    common_scripts\utility::flag_wait( "cliff_complete" );
    level notify( "next_music_track" );
    musicstop();
    wait 6;
    thread music_playback( "blackout_danger", 124, 1 );
    common_scripts\utility::flag_wait( "price_got_to_go" );
    level notify( "next_music_track" );
    musicstop( 3.7 );
    wait 3.8;
    maps\_utility::musicplaywrapper( "blackout_hurry" );
    common_scripts\utility::flag_wait( "blackout_house_begins" );
    soundscripts\_snd::snd_message( "aud_stop_post_rappel_mix" );
    level notify( "next_music_track" );
    musicstop( 4 );
    level.player playsound( "blackout_hurry_end" );
    wait 5.1;
    common_scripts\utility::flag_wait( "lights_out" );
    thread music_playback( "blackout_nightvision", 43, 1 );
    common_scripts\utility::flag_wait( "price_rescues_vip" );
    level notify( "next_music_track" );
    musicstop( 7 );
    wait 8;
    common_scripts\utility::flag_wait( "player_gets_on_heli" );
    level notify( "next_music_track" );
    musicstop();
    wait 0.1;
    thread music_playback( "blackout_outro", 24 );
}

music_playback( var_0, var_1, var_2, var_3 )
{
    level endon( "next_music_track" );

    if ( !isdefined( var_2 ) )
        var_2 = 0;

    if ( !isdefined( var_3 ) )
        var_3 = 1;

    if ( var_2 )
    {
        for (;;)
        {
            maps\_utility::musicplaywrapper( var_0 );
            wait(var_1);
            musicstop();
            wait(var_3);
        }
    }
    else
        maps\_utility::musicplaywrapper( var_0 );
}

cliff_reminder()
{
    if ( common_scripts\utility::flag( "player_reaches_cliff_area" ) )
        return;

    level endon( "player_reaches_cliff_area" );

    if ( !common_scripts\utility::flag( "h1_burninghouse_price" ) )
        level endon( "h1_burninghouse_price" );

    for (;;)
    {
        if ( distance( level.player.origin, level.price.origin ) > 600 )
            over_here();

        wait 1;
    }
}

over_here()
{
    level endon( "h1_burninghouse_price" );

    if ( common_scripts\utility::flag( "mission_chatter" ) )
        return;

    level.price maps\_utility::dialogue_queue( "over_here" );
    wait(randomfloatrange( 9, 14 ));

    if ( distance( level.player.origin, level.price.origin ) > 600 && !common_scripts\utility::flag( "mission_chatter" ) )
        level.price maps\_utility::dialogue_queue( "get_down_here" );
}

binocs_delete()
{
    common_scripts\utility::flag_wait( "kamarov_drops_binocs" );
    level.binocs delete();
}

breach_door()
{
    var_0 = getent( "breach1_door", "targetname" );
    var_1 = getent( "breach1_bmodel_door", "targetname" );
    var_1 linkto( var_0 );
    var_0 hide();
}

trigger_deletes_children()
{
    self endon( "death" );
    var_0 = common_scripts\utility::get_linked_ents();
    self waittill( "trigger" );

    for ( var_1 = 0; var_1 < var_0.size; var_1++ )
    {
        if ( isdefined( var_0[var_1] ) )
            var_0[var_1] delete();
    }

    self delete();
}

price_and_gaz_arrive_at_fight_check()
{
    var_0 = getent( "price_gaz_cliff_trigger", "targetname" );

    for (;;)
    {
        if ( level.price istouching( var_0 ) && level.gaz istouching( var_0 ) )
            break;

        wait 0.05;
    }

    wait 3.5;
    common_scripts\utility::flag_set( "price_and_gaz_arrive_at_fight" );
}

commence_attack_on_death()
{
    self waittill( "death" );
    common_scripts\utility::flag_set( "player_near_overlook" );
}

overlook_alarm()
{
    var_0 = getent( "alarm_org", "targetname" );
    var_0 playsound( "emt_alarm_base_alert" );
    wait 15;
    var_0 delete();
}

instant_high_alert()
{
    self waittill( "damage" );
    wait 2;
    common_scripts\utility::flag_set( "high_alert" );
    level notify( "instant_high_alert" );
}

detect_recent_flashed()
{
    for (;;)
    {
        level maps\_utility::add_wait( maps\_utility::_waittillmatch, "event_awareness", "explode" );
        level maps\_utility::add_wait( maps\_utility::_waittillmatch, "event_awareness", "doFlashBanged" );
        maps\_utility::do_wait_any();
        common_scripts\utility::flag_set( "recent_flashed" );
        wait 6;
        common_scripts\utility::flag_clear( "recent_flashed" );
    }
}

is_overlook_or_earlier_start()
{
    if ( maps\_utility::is_default_start() )
        return 1;

    if ( level.start_point == "overlook" )
        return 1;

    if ( level.start_point == "field" )
        return 1;

    return level.start_point == "chess";
}

is_rappel_or_earlier_start()
{
    if ( level.start_point == "cliff" )
        return 1;

    if ( level.start_point == "rappel" )
        return 1;

    return is_overlook_or_earlier_start();
}

shoot_magic_rocket( var_0 )
{
    var_1 = getent( var_0, "targetname" );
    var_2 = spawn( "script_model", ( 0.0, 0.0, 0.0 ) );
    var_2 setmodel( "tag_origin" );
    var_2.origin = var_1.origin;
    var_1 maps\_utility::script_delay();
    playfx( common_scripts\utility::getfx( "magic_rocket_launch" ), var_2.origin );
    var_2 playloopsound( "h1_scn_se_rocket_trail" );
    playfxontag( common_scripts\utility::getfx( "magic_rocket_geo" ), var_2, "tag_origin" );

    if ( !isdefined( var_1.speed ) )
        var_2.units_per_second = 2000;
    else
        var_2.units_per_second = var_1.speed;

    for (;;)
    {
        if ( isdefined( var_1.script_noteworthy ) && isdefined( int( var_1.script_noteworthy ) ) )
            thread common_scripts\_exploder::exploder( int( var_1.script_noteworthy ) );

        if ( !isdefined( var_1.target ) )
            break;

        var_3 = getent( var_1.target, "targetname" );
        var_4 = distance( var_1.origin, var_3.origin );
        var_5 = var_4 / var_2.units_per_second;
        var_2 moveto( var_3.origin, var_5, 0, 0 );
        var_1 = var_3;
        wait(var_5);
    }

    var_2 delete();
}

helicopter_searchlight_setup()
{
    self.spotlight = spawnturret( "misc_turret", self gettagorigin( "tag_barrel" ), "heli_spotlight" );
    self.spotlight.angles = self gettagangles( "tag_barrel" );
    self.spotlight setmodel( "com_blackhawk_spotlight_off_mg_setup" );
    self.spotlight linkto( self, "tag_barrel", ( 0.0, 0.0, -16.0 ), ( 0.0, 0.0, 0.0 ) );
    self.spotlight makeunusable();
    self.spotlight setmode( "manual" );
    self.spotlight settoparc( 25 );
    self.spotlight.enabled = 0;
    var_0 = spawn( "script_origin", self gettagorigin( "tag_ground" ) );
    var_0 linkto( self, "tag_ground", ( 320.0, 0.0, -256.0 ), ( 0.0, 0.0, 0.0 ) );
    self.spotlight.default_target = var_0;
}

helicopter_searchlight_on()
{
    if ( !isdefined( self.spotlight ) )
        helicopter_searchlight_setup();

    self.spotlight.enabled = 1;
    self.spotlight setmodel( "com_blackhawk_spotlight_on_mg_setup" );
    helicopter_set_spotlight_target( self.spotlight.default_target );
    wait 0.5;
    playfxontag( level._effect["heli_spotlight"], self.spotlight, "tag_flash" );
}

helicopter_searchlight_off()
{
    self.spotlight.enabled = 0;
    self.spotlight setmodel( "com_blackhawk_spotlight_off_mg_setup" );
    stopfxontag( level._effect["heli_spotlight"], self.spotlight, "tag_flash" );
}

helicopter_set_spotlight_target( var_0 )
{
    if ( !isdefined( var_0 ) )
        var_0 = self.spotlight.default_target;

    self.spotlight settargetentity( var_0 );
}

spot_target( var_0, var_1, var_2 )
{
    if ( !isdefined( var_1 ) )
        var_1 = ( 0.0, 0.0, 0.0 );

    if ( !isdefined( var_2 ) )
        var_2 = 350;

    self notify( "stop_spot" );
    self endon( "stop_spot" );

    if ( !isdefined( self.spot_target_ent ) )
        self.spot_target_ent = spawn( "script_model", self.spotlight.default_target.origin );

    helicopter_set_spotlight_target( self.spot_target_ent );

    for (;;)
    {
        var_3 = distance( var_0.origin, self.spot_target_ent.origin ) / var_2 + 0.1;
        self.spot_target_ent moveto( var_0.origin, var_3 );
        self.spot_target_ent waittill( "movedone" );

        if ( isdefined( var_0.script_noteworthy ) )
        {
            switch ( var_0.script_noteworthy )
            {
                case "on":
                    helicopter_searchlight_on();
                case "off":
                    helicopter_searchlight_off();
            }
        }

        if ( isdefined( var_0.target ) )
            var_0 = getent( var_0.target, "targetname" );
    }
}

buring_house_exploder_think( var_0, var_1, var_2 )
{
    var_3 = getentarray( var_0, "script_noteworthy" );
    common_scripts\utility::array_thread( var_3, maps\_utility::hide_entity );
    common_scripts\utility::flag_wait( var_1 );
    common_scripts\utility::array_thread( var_3, maps\_utility::show_entity );
    common_scripts\utility::flag_wait( var_2 );

    foreach ( var_5 in var_3 )
    {
        if ( isdefined( var_5 ) )
            var_5 delete();
    }
}
