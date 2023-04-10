// H1 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

idle_anim_think()
{
    self endon( "death" );

    if ( !isdefined( self.target ) )
        return;

    var_0 = getent( self.target, "targetname" );

    if ( !isdefined( var_0.script_animation ) )
        return;

    var_1 = undefined;

    switch ( var_0.script_animation )
    {
        case "coffee":
            var_1 = "coffee_";
            break;
        case "sleep":
            var_1 = "sleep_";
            break;
        case "phone":
            var_1 = "cellphone_";
            break;
        case "smoke":
            var_1 = "smoke_";
            break;
        case "lean_smoke":
            var_1 = "lean_smoke_";
            break;
        default:
            return;
    }

    self.allowdeath = 1;
    var_0 = getent( self.target, "targetname" );
    self.ref_node = var_0;

    if ( var_0.script_animation == "sleep" )
    {
        var_2 = maps\_utility::spawn_anim_model( "chair" );
        self.has_delta = 1;
        self.anim_props = maps\_utility::make_array( var_2 );
        var_0 thread maps\_anim::anim_first_frame_solo( var_2, "sleep_react" );
        var_0 maps\_stealth_logic::stealth_ai_idle_and_react( self, var_1 + "idle", var_1 + "react" );
    }
    else
        var_0 maps\_stealth_logic::stealth_ai_reach_and_arrive_idle_and_react( self, var_1 + "reach", var_1 + "idle", var_1 + "react" );
}

icbm_friendly_state_hidden()
{
    level endon( "_stealth_detection_level_change" );
    self.baseaccuracy = self._stealth.behavior.goodaccuracy;
    self.accuracy = self._stealth.behavior.goodaccuracy;
    self._stealth.behavior.oldgrenadeammo = self.grenadeammo;
    self.grenadeammo = 0;
    self.forcesidearm = undefined;
    self.ignoreall = 1;
    self.ignoreme = 1;
    maps\_utility::disable_ai_color();
    waittillframeend;
    self.fixednode = 0;
}

icbm_friendly_state_alert()
{
    level endon( "_stealth_detection_level_change" );
    icbm_friendly_state_hidden();
}

icbm_friendly_state_spotted()
{
    level endon( "_stealth_detection_level_change" );
    thread maps\_stealth_behavior::friendly_spotted_getup_from_prone();
    self.baseaccuracy = self._stealth.behavior.badaccuracy;
    self.accuracy = self._stealth.behavior.badaccuracy;
    self.grenadeammo = self._stealth.behavior.oldgrenadeammo;
    self allowedstances( "prone", "crouch", "stand" );
    self stopanimscripted();
    self.ignoreall = 0;
    self.ignoreme = 0;
    maps\_utility::disable_cqbwalk();
    maps\_utility::enable_ai_color();
    self.disablearrivals = 1;
    self.disableexits = 1;
    self pushplayer( 0 );
}

friendlies_stop_on_truck_spotted()
{
    self endon( "death" );
    common_scripts\utility::flag_wait( "truck_spotted" );

    if ( common_scripts\utility::flag( "truckguys dead" ) )
        return;

    maps\_utility::disable_ai_color();
    self setgoalpos( self.origin );
    self.goalradius = 30;
    common_scripts\utility::flag_wait( "truckguys dead" );
    wait 1;
    maps\_utility::enable_ai_color();
}

friendlies_stop_paths_to_fight()
{
    self endon( "death" );
    level common_scripts\utility::waittill_either( "_stealth_spotted", "at_range" );

    if ( common_scripts\utility::flag( "patrollers_dead" ) )
        return;

    self.fixednode = 0;
    self notify( "stop_going_to_node" );
    self.goalradius = 5000;
    common_scripts\utility::flag_wait( "patrollers_dead" );
    wait 3;
    make_friendies_not_cqb();
    maps\_utility::activate_trigger_with_targetname( "basement_door_nodes" );
    self.fixednode = 1;
}

disable_ignoreme_on_stealth_spotted()
{
    common_scripts\utility::flag_wait( "_stealth_spotted" );
    stop_make_friendies_ignored();
}

disable_deadlyness_on_stealth_spotted()
{
    common_scripts\utility::flag_wait( "_stealth_spotted" );
    disable_friendly_deadlyness();
}

disable_friendly_deadlyness()
{
    var_0 = getaiarray( "allies" );

    for ( var_1 = 0; var_1 < var_0.size; var_1++ )
    {
        if ( isdefined( var_0[var_1].normal_baseaccuracy ) )
            var_0[var_1].baseaccuracy = var_0[var_1].normal_baseaccuracy;
    }
}

stop_make_friendies_ignored()
{
    var_0 = getaiarray( "allies" );

    for ( var_1 = 0; var_1 < var_0.size; var_1++ )
        var_0[var_1].ignoreme = 0;
}

friendlies_fighting_nodes()
{
    level endon( "outside_cleared" );
    common_scripts\utility::flag_wait( "_stealth_spotted" );
    maps\_utility::activate_trigger_with_targetname( "friendlies_fighting_nodes" );
}

truck_setup()
{
    self waittill( "trigger" );
    var_0 = maps\_vehicle::waittill_vehiclespawn( "truck" );
    var_0.maxlightstopsperframe = 1;
    var_0 thread maps\icbm_aud::start_first_truck_audio();
    var_0 maps\_vehicle::vehicle_lights_on( "headlights" );
    wait 0.5;
    common_scripts\utility::flag_wait( "truck_stopped" );
    var_0 thread maps\icbm_aud::handle_first_truck_stop();
    var_0 maps\_vehicle::vehicle_lights_on( "brakelights" );
    common_scripts\utility::flag_set( "truck arived" );
    common_scripts\utility::flag_wait( "price_basement_door_anim_complete" );

    if ( var_0.health > 0 )
        var_0 maps\_vehicle::vehicle_lights_off( "all" );
}

truck_guys_think()
{
    self endon( "death" );
    level.truckguys[level.truckguys.size] = self;
    self.ignoreme = 1;
    common_scripts\utility::flag_wait( "truck_stopped" );
    wait 2;
    self.ignoreme = 0;
}

ignore_truck_guys_till_truck_stopped()
{
    var_0 = getentarray( "truck_guys", "script_noteworthy" );
    common_scripts\utility::flag_wait( "truck_stopped" );
}

music_tension_loop( var_0, var_1, var_2, var_3 )
{
    level endon( var_0 );

    if ( !isdefined( var_3 ) )
        var_3 = 1;

    musicstop( 3 );
    wait 3.1;

    for (;;)
    {
        maps\_utility::musicplaywrapper( var_1 );
        wait(var_2);
        musicstop( var_3 );
        wait(var_3 + 0.2);
    }
}

friendlies_start_paths()
{
    var_0 = getnode( "path_left", "targetname" );
    var_1 = getnode( "path_center", "targetname" );
    var_2 = getnode( "path_right", "targetname" );
    var_3 = get_a_generic_friendly();
    level.gaz thread maps\_spawner::go_to_node( var_1 );
    wait 0.5;
    level.price thread maps\_spawner::go_to_node( var_0 );

    if ( isalive( var_3 ) )
    {
        wait 0.5;
        var_3 thread maps\_spawner::go_to_node( var_2 );
    }
}

get_a_generic_friendly()
{
    var_0 = getaiarray( "allies" );
    var_0 = maps\_utility::remove_heroes_from_array( var_0 );
    return var_0[0];
}

attach_flashlight( var_0, var_1 )
{
    self endon( "death" );

    if ( isdefined( self.have_flashlight ) )
        return;

    if ( isdefined( var_1 ) )
        wait(randomfloatrange( 0, 5 ));

    self attach( "com_flashlight_on", "tag_inhand", 1 );
    self.have_flashlight = 1;
    flashlight_light( var_0 );
    thread dropflashlightondeath();
}

dropflashlightondeath()
{
    self waittill( "death" );

    if ( isdefined( self ) )
        detach_flashlight();
}

detach_flashlight_onspotted()
{
    self endon( "death" );
    self waittill( "drop_light" );
    detach_flashlight();
}

detach_flashlight()
{
    if ( !isdefined( self.have_flashlight ) )
        return;

    self detach( "com_flashlight_on", "tag_inhand" );
    flashlight_light( 0 );
    self.have_flashlight = undefined;
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
    else if ( isdefined( self.have_flashlight ) )
        self notify( "flashlight_off" );
}

flashlight_light_death( var_0 )
{
    common_scripts\utility::waittill_either( "death", "flashlight_off" );
    var_0 delete();
    self.have_flashlight = undefined;
}

min_spec_kill_fx()
{
    var_0 = [];
    var_0 = maps\_utility::getfxarraybyid( "fog_icbm" );
    var_0 = common_scripts\utility::array_combine( var_0, maps\_utility::getfxarraybyid( "fog_icbm_a" ) );
    var_0 = common_scripts\utility::array_combine( var_0, maps\_utility::getfxarraybyid( "fog_icbm_b" ) );
    var_0 = common_scripts\utility::array_combine( var_0, maps\_utility::getfxarraybyid( "fog_icbm_c" ) );
    var_0 = common_scripts\utility::array_combine( var_0, maps\_utility::getfxarraybyid( "cloud_bank" ) );
    var_0 = common_scripts\utility::array_combine( var_0, maps\_utility::getfxarraybyid( "cloud_bank_a" ) );
    var_0 = common_scripts\utility::array_combine( var_0, maps\_utility::getfxarraybyid( "cloud_bank_far" ) );

    for ( var_1 = 0; var_1 < var_0.size; var_1++ )
        var_0[var_1] common_scripts\utility::pauseeffect();
}

whitein()
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
    var_0.sort = 2;
    var_1 = getent( "cloud", "targetname" );
    var_1 waittill( "trigger" );
    wait 1;
    var_0 fadewhiteout( 2, 0, 6 );
}

fadewhiteout( var_0, var_1, var_2 )
{
    self fadeovertime( var_0 );
    self.alpha = var_1;
    wait(var_0);
}

make_friendies_cqb()
{
    var_0 = getaiarray( "allies" );

    for ( var_1 = 0; var_1 < var_0.size; var_1++ )
        var_0[var_1] maps\_utility::enable_cqbwalk();
}

make_friendies_not_cqb()
{
    var_0 = getaiarray( "allies" );

    for ( var_1 = 0; var_1 < var_0.size; var_1++ )
        var_0[var_1] maps\_utility::disable_cqbwalk();
}

make_friendies_pushplayer( var_0 )
{
    var_1 = getaiarray( "allies" );

    for ( var_2 = 0; var_2 < var_1.size; var_2++ )
        var_1[var_2] pushplayer( var_0 );
}

make_friendies_deadly()
{
    var_0 = getaiarray( "allies" );

    for ( var_1 = 0; var_1 < var_0.size; var_1++ )
    {
        var_0[var_1].normal_baseaccuracy = var_0[var_1].baseaccuracy;
        var_0[var_1].baseaccuracy = 1000;
    }
}

opforce_more_accurate()
{
    self.baseaccuracy = 5;
}

all_friendlies_turn_blue()
{
    var_0 = getaiarray( "allies" );

    for ( var_1 = 0; var_1 < var_0.size; var_1++ )
        var_0[var_1] maps\_utility::set_force_color( "b" );
}

clip_nosight_logic()
{
    self endon( "death" );
    common_scripts\utility::flag_wait( self.script_flag );
    thread clip_nosight_logic2();
    self setcandamage( 1 );
    clip_nosight_wait();
    self delete();
}

clip_nosight_wait()
{
    if ( common_scripts\utility::flag( "_stealth_spotted" ) )
        return;

    level endon( "_stealth_spotted" );
    self waittill( "damage" );
}

clip_nosight_logic2()
{
    self endon( "death" );
    common_scripts\utility::flag_wait_either( "_stealth_spotted", "_stealth_found_corpse" );
    self delete();
}

first_chopper_fly_over()
{
    wait 3;
    level.gaz maps\_anim::anim_single_queue( level.gaz, "enemyhelicopters" );
    var_0 = getaiarray( "allies" );
    var_1 = 0.0;

    for ( var_2 = 0; var_2 < var_0.size; var_2++ )
    {
        var_0[var_2] maps\_utility::delaythread( var_1, ::prone_till_flag, "chopper_gone" );
        var_1 += randomfloatrange( 0.1, 0.5 );
    }

    wait 1;
    level.player playsound( "h1_mi17_custom_flyby" );
    common_scripts\utility::flag_wait( "chopper_gone" );
    level.price maps\_anim::anim_single_queue( level.price, "move" );
    wait 1;
    maps\_utility::activate_trigger_with_targetname( "friendlies_at_tower" );
}

chopper_fail_mission()
{
    level endon( "chopper_gone" );
    var_0 = undefined;
    self waittill( "spawned", var_0 );
    var_1 = cos( 45 );
    var_2 = 16000000;

    if ( isdefined( var_0 ) )
    {
        for (;;)
        {
            var_3 = level.player getcurrentweapon();
            var_4 = distancesquared( level.player.origin, var_0.origin );

            if ( var_4 < var_2 && level.player attackbuttonpressed() && var_3 != "c4" )
            {
                var_5 = anglestoforward( level.player getplayerangles() );
                var_6 = vectornormalize( var_0.origin - level.player.origin );
                var_7 = vectordot( var_6, var_5 );

                if ( var_7 > var_1 )
                {
                    maps\_player_death::set_deadquote( &"ICBM_MISSIONFAIL_ICBM_CHOPPERS_SHOT" );
                    maps\_utility::missionfailedwrapper();
                    break;
                }
            }

            wait 0.05;
        }
    }
}

prone_till_flag( var_0 )
{
    self endon( "death" );
    var_1 = randomintrange( 1, 3 );
    maps\_anim::anim_generic_custom_animmode( self, "gravity", "pronehide_dive" + var_1 );
    thread maps\_anim::anim_generic_custom_animmode( self, "gravity", "pronehide_idle" + var_1 );
    common_scripts\utility::flag_wait( var_0 );
    wait(randomfloatrange( 0, 1 ));
    thread maps\_anim::anim_generic_custom_animmode( self, "gravity", "pronehide_2_stand" + var_1 );
}

make_friendies_ignored()
{
    var_0 = getaiarray( "allies" );

    for ( var_1 = 0; var_1 < var_0.size; var_1++ )
        var_0[var_1].ignoreme = 1;
}

turn_off_flashlights()
{
    var_0 = getaiarray( "axis" );

    for ( var_1 = 0; var_1 < var_0.size; var_1++ )
    {
        wait(randomfloatrange( 0.1, 0.3 ));
        var_0[var_1] detach_flashlight();
    }
}

ignoreme_till_close()
{
    self endon( "death" );
    self.ignoreme = 1;
    common_scripts\utility::array_thread( level.friendlies, ::notify_at_range, self, 1200, "at_range" );
    level common_scripts\utility::waittill_either( "_stealth_spotted", "at_range" );
    self.ignoreme = 0;
}

ignoreme_till_stealth_broken()
{
    self endon( "death" );
    self.ignoreme = 1;
    common_scripts\utility::flag_wait( "_stealth_spotted" );
    self.ignoreme = 0;
}

notify_at_range( var_0, var_1, var_2 )
{
    self endon( "death" );
    var_0 endon( "death" );

    while ( distance( var_0.origin, self.origin ) > var_1 )
        wait 1;

    level notify( var_2 );
}

second_squad_talker_think()
{
    level.gm5 = self;
    level.gm5.animname = "gm5";
}

price_think()
{
    level.price = self;
    level.price.animname = "price";
    level.price thread maps\_utility::magic_bullet_shield();
    level.price.interval = 100;
    level.friendlies[level.friendlies.size] = self;
    level.price maps\_utility::make_hero();
}

gaz_think()
{
    level.gaz = self;
    level.gaz.animname = "gaz";
    level.gaz thread maps\_utility::magic_bullet_shield();
    level.gaz.interval = 100;
    level.friendlies[level.friendlies.size] = self;
    level.gaz maps\_utility::make_hero();
}

griggs_think()
{
    level.griggs = self;
    level.griggs.animname = "griggs";
    level.griggs thread maps\_utility::magic_bullet_shield();
    level.griggs.interval = 100;
    level.friendlies[level.friendlies.size] = self;
    level.griggs maps\_utility::make_hero();
}

captured_griggs_think()
{
    self.pacifist = 1;
    maps\_utility::enable_cqbwalk();
    self.ignoreme = 1;
    level.griggs_node = getnode( "griggs_node", "targetname" );
    thread griggs_idle( level.griggs_node );
    wait 0.1;
    thread griggs_fake_gun();
    level.griggs attach( "prop_flex_cuff_obj", "tag_inhand", 1 );
    level.griggs attach( "prop_flex_cuff", "tag_inhand", 1 );
    level waittill( "griggs_loose" );
    level.griggs detach( "prop_flex_cuff_obj", "tag_inhand" );
    level.griggs detach( "prop_flex_cuff", "tag_inhand" );
}

griggs_grab_gun( var_0, var_1 )
{
    level.griggs.fake_gun delete();
    level.griggs maps\_utility::gun_recall();
}

griggs_fake_gun()
{
    var_0 = level.griggs gettagorigin( "TAG_WEAPON_RIGHT" );
    var_1 = level.griggs gettagangles( "TAG_WEAPON_RIGHT" );
    var_2 = spawn( "script_model", var_0 );
    var_2 setmodel( "weapon_saw" );
    var_2.angles = var_1;
    level.griggs.fake_gun = var_2;
    level.griggs maps\_utility::gun_remove();
}

griggs_idle( var_0 )
{
    self endon( "griggs_loose" );
    var_0 thread maps\_anim::anim_loop_solo( self, "grigsby_rescue_idle", undefined, "stop_idle" );
}

price_rescue_anims()
{
    level.griggs_node maps\_anim::anim_reach_solo( level.price, "grigsby_rescue_price_in" );
    level.griggs_node maps\_anim::anim_single_solo( level.price, "grigsby_rescue_price_in" );
    common_scripts\utility::flag_set( "price_ready_for_griggs_rescue" );
    level.griggs_node thread maps\_anim::anim_loop_solo( level.price, "grigsby_rescue_price_idle", undefined, "stop_price_idle" );
}

friendly_think()
{
    self.animname = "generic";
    self.interval = 100;
    thread maps\_utility::replace_on_death();
    level.friendlies[level.friendlies.size] = self;

    if ( self.spawner.targetname == "chute_start_spawners" )
        level.soldier = self;
}

respawned_friendly_think()
{
    self.animname = "generic";
    self.interval = 100;
    level.friendlies[level.friendlies.size] = self;
}

kill_during_breach1( var_0, var_1 )
{
    var_2 = getaiarray( "axis" );

    for ( var_3 = 0; var_3 < var_2.size; var_3++ )
    {
        if ( var_2[var_3].script_noteworthy == "interogation_buddy" )
            var_2[var_3] kill();
    }
}

kill_during_breach2( var_0, var_1 )
{
    var_2 = getaiarray( "axis" );

    for ( var_3 = 0; var_3 < var_2.size; var_3++ )
    {
        if ( var_2[var_3].script_noteworthy == "interogation_speaker" )
        {
            var_4 = level.price;

            if ( distancesquared( level.price.origin, var_2[var_3].origin ) > distancesquared( level.gaz.origin, var_2[var_3].origin ) )
                var_4 = level.gaz;

            magicbullet( var_4.weapon, var_4 gettagorigin( "tag_flash" ), var_2[var_3] gettagorigin( "tag_eye" ) );
            var_2[var_3] kill();
        }
    }
}

parachute_player()
{
    level thread maps\icbm_fx::playereffect();
    level.player disableweapons();
    level thread whitein();
    level.player allowprone( 0 );
    level.player allowcrouch( 0 );
    var_0 = getent( "para_start", "targetname" );
    var_1 = getent( "para_stop", "targetname" );
    level.player linkto( var_0 );
    var_0 moveto( var_1.origin, 3, 0, 0 );
    var_0 waittill( "movedone" );
    level.player unlink();
    level.player enableweapons();
    level.player allowprone( 1 );
    level.player allowcrouch( 1 );
}

trigger_wait_and_set_flag( var_0 )
{
    common_scripts\utility::flag_init( "trigger_" + var_0 );
    var_1 = getent( var_0, "targetname" );
    var_1 waittill( "trigger" );
    var_1 common_scripts\utility::trigger_off();
    common_scripts\utility::flag_set( "trigger_" + var_0 );
}

sound_fade_then_delete()
{
    self waittill( "trigger", var_0 );
    var_0 maps\_vehicle::volume_down( 2 );
    wait 2;

    if ( isdefined( var_0 ) )
        var_0 delete();
}

start_interogation()
{
    var_0 = getent( "interogation_speaker", "script_noteworthy" );
    var_0 maps\_utility::add_spawn_function( ::interogation_speaker_think );
    var_1 = getentarray( "interogators", "targetname" );
    common_scripts\utility::array_thread( var_1, maps\_utility::add_spawn_function, ::ignore_all_till_flag, "breach_started" );
    common_scripts\utility::array_thread( var_1, maps\_utility::spawn_ai );
    common_scripts\utility::flag_set( "start_interogation" );
    wait 0.5;
    thread maps\icbm_dialog::dialog_grigs_guys_jibjab();
}

ignore_all_till_flag( var_0 )
{
    self endon( "death" );
    self.ignoreall = 1;
    common_scripts\utility::flag_wait( var_0 );
    self.ignoreall = 0;
}

interogation_speaker_think()
{
    level.ru1 = self;
    self.animname = "ru1";
    self.a.disablelongdeath = 1;
}

knife_kill_setup()
{
    var_0 = getent( "price_knife_kill", "targetname" );
    var_0 waittill( "trigger" );
    var_0 common_scripts\utility::trigger_off();
    var_1 = getent( "house01_badguy01", "script_noteworthy" );
    level.knifekillnode = getnode( "knifeKillNode", "targetname" );
    createthreatbiasgroup( "victims" );
    setignoremegroup( "icbm_friendlies", "victims" );

    if ( !common_scripts\utility::flag( "_stealth_spotted" ) )
        var_1 maps\_utility::add_spawn_function( ::ai_hostile_think );

    var_1 maps\_utility::add_spawn_function( maps\_stealth_logic::stealth_ai );
    var_1 maps\_utility::add_spawn_function( ::set_threatbias_group, "victims" );
    var_2 = var_1 maps\_utility::spawn_ai();

    if ( !common_scripts\utility::flag( "knife_sequence_done" ) )
        var_2 thread ai_hostile_knife_kill_think();

    var_2 waittill( "death" );
    level.price maps\_utility::enable_ai_color();
    common_scripts\utility::flag_set( "knife_sequence_done" );
}

ai_hostile_think()
{
    self endon( "death" );
    self.animname = "hostile";
    self.allowdeath = 1;
    self.ignoreme = 1;
    self.health = 1;
    thread maps\_stealth_logic::stealth_enemy_endon_alert();
    level.knifekillnode maps\_anim::anim_reach_solo( self, "phoneguy_idle_start" );
    level.knifekillnode thread maps\_anim::anim_loop_solo( self, "phoneguy_idle", undefined, "stop_idle" );
    self waittill( "stealth_enemy_endon_alert" );
    self.phone delete();
    self setthreatbiasgroup();
    self.ignoreme = 0;
    level.knifekillnode notify( "stop_idle" );
}

ai_hostile_knife_kill_think()
{
    self endon( "death" );
    self endon( "stealth_enemy_endon_alert" );
    level.price setgoalpos( self.origin );
    common_scripts\utility::flag_set( "knife_sequence_starting" );
    level.knifekillnode maps\_anim::anim_reach_solo( level.price, "knifekill_price" );
    thread knife_kill_fx();
    thread ai_hostile_knife_kill_abort_think();
    level.price_knife = spawn( "script_model", level.price gettagorigin( "TAG_INHAND" ) );
    level.price_knife.angles = level.price gettagangles( "TAG_INHAND" );
    level.price_knife linkto( level.price, "TAG_INHAND", ( 0.0, 0.0, 0.0 ), ( 0.0, 0.0, 0.0 ) );
    level.price_knife setmodel( "weapon_parabolic_knife" );
    level.price_knife hide();
    level.price playsound( "scn_icbm_knife_melee" );
    level.knifekillnode thread maps\_anim::anim_single_solo( level.price, "knifekill_price" );
    level.knifekillnode thread maps\_anim::anim_single_solo( self, "phoneguy_death" );
    var_0 = getanimlength( maps\_utility::getanim( "phoneguy_death" ) );
    var_0 -= 2.75;
    maps\_utility::delaythread( var_0, ::ai_hostile_knife_kill_finish_anim );
    maps\_utility::delaythread( var_0, ::set_ignore_all );
    level.knifekillnode waittill( "phoneguy_death" );
    level notify( "knife_kill_done" );
    level.price setgoalpos( level.price.origin );
    level.price stopanimscripted();
    self.a.nodeath = 1;
    self.allowdeath = 1;
    animscripts\shared::dropallaiweapons();
    self kill( ( 0.0, 0.0, 0.0 ) );
}

ai_hostile_knife_kill_finish_anim()
{
    self endon( "stealth_enemy_endon_alert" );
    self notify( "_stealth_stop_stealth_logic" );
    self.allowdeath = 0;
    self.a.nodeath = 1;
}

set_ignore_all()
{
    self.ignoreall = 1;
}

ai_hostile_knife_kill_abort_think()
{
    common_scripts\utility::flag_wait( "knife_sequence_starting" );
    common_scripts\utility::waittill_either( "death", "stealth_enemy_endon_alert" );
    level.price stopsound( "scn_icbm_knife_melee" );
    level.price_knife unlink();
    level.price_knife delete();
    level.price stopanimscripted();
}

knife_kill_fx()
{
    self endon( "death" );
    self waittillmatch( "single anim", "knife hit" );
    playfxontag( level._effect["knife_stab"], self, "j_neck" );
}

dialogue_execute( var_0 )
{
    self endon( "death" );
    maps\_anim::anim_single_queue( self, var_0 );
}

friendlies_open_upstairs_door()
{

}

beehive_wait()
{
    level endon( "house1_upstairs_dead" );
    common_scripts\utility::flag_wait( "_stealth_spotted" );
    common_scripts\utility::flag_set( "beehive1_active" );
    common_scripts\utility::flag_set( "knife_sequence_done" );
    thread beehive_attack();
}

beehive_attack()
{
    var_0 = getentarray( "beehive_enemy", "targetname" );
    common_scripts\utility::array_thread( var_0, maps\_utility::spawn_ai );
    wait 4;
    var_1 = getent( "house1_upstairs_first_door", "targetname" );
    var_2 = getent( "house1_upstairs_first_door_model", "targetname" );
    var_2 linkto( var_1 );
    thread open_door( var_1, -178 );
    wait 1;
    var_3 = getent( "house1_upstairs_second_door", "targetname" );
    var_4 = getent( "house1_upstairs_second_door_model", "targetname" );
    var_4 linkto( var_3 );
    var_5 = getentarray( "beehive_enemy_second_door", "targetname" );
    open_door( var_3, 176, var_5 );
    wait 0.1;
    thread maps\_spawner::kill_spawnernum( 0 );
}

open_door( var_0, var_1, var_2 )
{
    while ( distance( level.player.origin, var_0.origin ) < 160 )
        wait 0.1;

    if ( isdefined( var_2 ) )
        common_scripts\utility::array_thread( var_2, maps\_utility::spawn_ai );

    var_0 rotateto( var_0.angles + ( 0, var_1, 0 ), 0.5, 0, 0 );
    var_0 connectpaths();
    var_0 playsound( "icbm_door_slams_open" );
}

beehive2_wait()
{
    level endon( "outside_dead" );
    common_scripts\utility::flag_wait( "_stealth_spotted" );
    common_scripts\utility::flag_set( "beehive2_active" );
    thread beehive2_attack();
}

beehive2_think()
{
    self endon( "death" );
    self.goalradius = 4;

    if ( !isdefined( self.script_noteworthy ) )
        return;

    if ( self.script_noteworthy == "door_dog_enemies" )
    {
        level waittill( "dog_door_open" );
        self.goalradius = 3000;
    }

    if ( self.script_noteworthy == "beehive2_enemies" )
    {
        self.ignoreall = 1;
        self.ignoreme = 1;
        level waittill( "beehive2_door_open" );
        self.goalradius = 3000;
        self.ignoreall = 0;
        self.ignoreme = 0;
    }
}

beehive2_attack()
{
    var_0 = getentarray( "beehive2_enemy", "targetname" );
    common_scripts\utility::array_thread( var_0, maps\_utility::add_spawn_function, ::beehive2_think );
    common_scripts\utility::array_thread( var_0, maps\_utility::spawn_ai );
    wait 4;
    level notify( "beehive2_door_open" );
    var_1 = getent( "beehive2_front_door", "targetname" );
    var_2 = getent( "beehive2_front_door_model", "targetname" );
    var_2 linkto( var_1 );
    var_3 = getent( "doorknob7", "targetname" );
    var_3 linkto( var_1 );
    var_3 = getent( "doorknob8", "targetname" );
    var_3 linkto( var_1 );
    var_1 rotateto( var_1.angles + ( 0.0, -92.0, 0.0 ), 0.5, 0, 0 );
    var_1 connectpaths();
    var_1 playsound( "icbm_door_slams_open" );
    wait 1;
    level notify( "dog_door_open" );
    var_4 = getent( "beehive1_front_door", "targetname" );
    var_5 = getent( "beehive1_front_door_model", "targetname" );
    var_5 linkto( var_4 );
    var_4 rotateto( var_4.angles + ( 0.0, -87.0, 0.0 ), 0.5, 0, 0 );
    var_4 connectpaths();
    var_4 playsound( "icbm_door_slams_open" );
}

price_gets_ready_to_open_door( var_0 )
{
    var_0 maps\_anim::anim_reach_and_approach_node_solo( level.price, "hunted_open_barndoor_stop" );
    var_0 thread maps\_anim::anim_loop_solo( level.price, "hunted_open_barndoor_idle", undefined, "stop_idle" );
    common_scripts\utility::flag_set( "price_ready" );
}

price_opens_door( var_0, var_1, var_2 )
{
    common_scripts\utility::flag_wait( "price_ready" );
    var_0 notify( "stop_idle" );
    var_0 thread maps\_anim::anim_single_solo( level.price, "hunted_open_barndoor" );

    if ( var_1.targetname == "house01_front_door" )
        soundscripts\_snd::snd_message( "aud_open_fisrt_door" );

    var_3 = getentarray( var_1.target, "targetname" );

    for ( var_4 = 0; var_4 < var_3.size; var_4++ )
        var_3[var_4] linkto( var_1 );

    var_1 maps\_utility::hunted_style_door_open();
    common_scripts\utility::flag_clear( "price_ready" );

    if ( isdefined( var_2 ) )
        common_scripts\utility::flag_set( var_2 );
}

base_lights()
{
    var_0 = getentarray( "windows_on", "targetname" );
    common_scripts\utility::array_thread( var_0, ::showwindow );
    common_scripts\utility::flag_wait( "lights_off" );
    common_scripts\utility::array_thread( var_0, ::hidewindow );
    common_scripts\utility::flag_wait( "lights_on" );
    common_scripts\utility::array_thread( var_0, ::showwindow );
}

base_fx_on()
{
    var_0 = common_scripts\utility::getstructarray( "icbm_post_FX_origin", "targetname" );
    var_1 = 0.05;
    var_2 = 1.5;

    for ( var_3 = 0; var_3 < var_0.size; var_3++ )
        var_0[var_3] thread base_fx_light( randomfloatrange( var_1, var_2 ) );

    common_scripts\utility::flag_wait( "lights_on" );

    for ( var_3 = 0; var_3 < var_0.size; var_3++ )
        var_0[var_3] thread base_fx_light( randomfloatrange( var_1, var_2 ) );
}

base_fx_light( var_0 )
{
    wait(var_0);
    var_1 = spawn( "script_model", self.origin );
    var_1 setmodel( "tag_origin" );
    playfxontag( level._effect["icbm_post_light_red"], var_1, "tag_origin" );
    common_scripts\utility::flag_wait( "lights_off" );
    var_1 delete();
}

hidewindow()
{
    self hide();
}

showwindow()
{
    wait(randomfloatrange( 0.05, 1.5 ));
    var_0 = randomint( 3 );

    for ( var_1 = 0; var_1 < var_0; var_1++ )
    {
        self show();
        wait(randomfloatrange( 0.05, 0.2 ));
        self hide();
        wait(randomfloatrange( 0.05, 0.2 ));
    }

    self show();
}

tower_rumble()
{
    var_0 = [];
    var_0 = maps\_utility::rumble_sequence_add_key( var_0, 0.0, "generic_attack_medium_500" );
    var_0 = maps\_utility::rumble_sequence_add_key( var_0, 4.0, "generic_attack_medium_1000" );
    var_0 = maps\_utility::rumble_sequence_add_key( var_0, 9.0, "generic_attack_heavy_1000" );
    level.player thread maps\_utility::rumble_sequence_play( var_0 );
    wait 6.0;
    level.player playrumblelooponentity( "generic_quake_loop" );
    wait 2.5;
    level.player stoprumble( "generic_quake_loop" );
}

tower_earthquakes()
{
    earthquake( 0.2, 0.5, level.player.origin, 8000 );
    wait 4;
    earthquake( 0.2, 1, level.player.origin, 8000 );
    wait 5;
    earthquake( 0.4, 3, level.player.origin, 8000 );
}

tower_legbreak_fx( var_0 )
{
    playfxontag( common_scripts\utility::getfx( "powerTower_leg" ), var_0, "tag_foot_left" );
    var_1 = getent( "tower_base_left", "targetname" );
    thread common_scripts\utility::play_sound_in_space( "scn_icbm_tower_base1", var_1.origin );
    wait 0.1;
    playfxontag( common_scripts\utility::getfx( "powerTower_leg" ), var_0, "tag_foot_right" );
    var_2 = getent( "tower_base_right", "targetname" );
    thread common_scripts\utility::play_sound_in_space( "scn_icbm_tower_base2", var_2.origin );
}

tower_collapse()
{
    common_scripts\utility::flag_wait( "house1_cleared" );
    var_0 = getent( "tower", "targetname" );
    var_0 maps\_utility::assign_animtree( "tower" );
    var_1 = 18;
    var_2 = [];
    var_2[0] = "h1_wire_le1";
    var_2[1] = "h1_wire_le2";
    var_2[2] = "h1_wire_le3";
    var_2[3] = "h1_wire_ri1";
    var_2[4] = "h1_wire_ri2";
    var_2[5] = "h1_wire_ri3";
    var_2[6] = "wire_le4";
    var_2[7] = "wire_le5";
    var_2[8] = "wire_le6";
    var_2[9] = "wire_ri4";
    var_2[10] = "wire_ri5";
    var_2[11] = "wire_ri6";
    var_2[12] = "h1_wire_ri4";
    var_2[13] = "h1_wire_ri5";
    var_2[14] = "h1_wire_ri6";
    var_2[15] = "h1_wire_le4";
    var_2[16] = "h1_wire_le5";
    var_2[17] = "h1_wire_le6";
    var_3 = [];

    for ( var_4 = 0; var_4 < var_1; var_4++ )
    {
        var_5 = var_2[var_4];
        var_3[var_4] = getent( var_5, "targetname" );
        var_3[var_4] maps\_utility::assign_animtree( "wire" );
    }

    var_6 = spawn( "script_origin", ( 0.0, 0.0, 0.0 ) );
    var_6.origin = var_0.origin;
    var_6.angles = var_0.angles + ( 0.0, -90.0, 0.0 );

    for ( var_4 = 0; var_4 < var_1; var_4++ )
        var_6 thread maps\_anim::anim_loop_solo( var_3[var_4], "idle" + var_4, undefined, "stop_idle" );

    common_scripts\utility::flag_wait( "tower_destroyed" );
    var_6 notify( "stop_idle" );
    var_0 setmodel( "com_powerline_tower_destroyed" );
    var_6 thread maps\_anim::anim_single_solo( var_0, "explosion" );

    for ( var_4 = 0; var_4 < var_1; var_4++ )
        var_6 thread maps\_anim::anim_single_solo( var_3[var_4], "explosion" + var_4 );

    radiusdamage( var_0.origin + ( 0.0, 0.0, 96.0 ), level.towerblastradius, 1000, 50 );
}

tower_impact_fx( var_0 )
{
    common_scripts\_exploder::exploder( 5 );
}

tower_spark_fx( var_0 )
{
    thread playsoundinspace( "scn_icbm_tower_sparks", var_0.origin + ( 0.0, 0.0, 512.0 ) );
    playfxontag( common_scripts\utility::getfx( "powerTower_spark_exp" ), var_0, "tag_fx_electric_left03" );
    playfxontag( common_scripts\utility::getfx( "powerTower_spark_exp" ), var_0, "tag_fx_electric_right03" );
    wait 0.1;
    playfxontag( common_scripts\utility::getfx( "powerTower_spark_exp" ), var_0, "tag_fx_electric_right02" );
    playfxontag( common_scripts\utility::getfx( "powerTower_spark_exp" ), var_0, "tag_fx_electric_left02" );
    wait 0.1;
    playfxontag( common_scripts\utility::getfx( "powerTower_spark_exp" ), var_0, "tag_fx_electric_left01" );
    playfxontag( common_scripts\utility::getfx( "powerTower_spark_exp" ), var_0, "tag_fx_electric_right01" );
}

spraycan_fx( var_0 )
{
    level endon( "stop_spray_fx" );
    level endon( "death" );

    for (;;)
    {
        playfxontag( common_scripts\utility::getfx( "freezespray" ), var_0, "tag_spraycan_fx" );
        wait 0.1;
    }
}

spraycan_fx_stop( var_0 )
{
    level notify( "stop_spray_fx" );
}

playsoundinspace( var_0, var_1, var_2 )
{
    var_3 = spawn( "script_origin", ( 0.0, 0.0, 1.0 ) );

    if ( !isdefined( var_1 ) )
        var_1 = self.origin;

    var_3.origin = var_1;

    if ( isdefined( var_2 ) && var_2 )
        var_3 playsoundasmaster( var_0 );
    else
        var_3 playsound( var_0 );

    wait 10.0;
    var_3 delete();
}

tower_interface()
{
    level endon( "tower_destroyed" );

    while ( !common_scripts\utility::flag( "tower_destroyed" ) )
    {
        var_0 = level.player getcurrentweapon();

        if ( var_0 != "c4" )
            level.player switchtoweapon( "c4" );

        wait 0.5;
    }
}

set_threatbias_group( var_0 )
{
    self setthreatbiasgroup( var_0 );
}

kill_enemies()
{
    var_0 = getaiarray( "axis" );

    for ( var_1 = 0; var_1 < var_0.size; var_1++ )
        var_0[var_1] kill();
}

anim_reach_and_approach_solo_set_flag( var_0, var_1, var_2 )
{
    maps\_anim::anim_reach_and_approach_node_solo( var_0, var_1 );
    common_scripts\utility::flag_set( var_2 );
}

anim_reach_solo_set_flag( var_0, var_1, var_2 )
{
    maps\_anim::anim_reach_solo( var_0, var_1 );
    common_scripts\utility::flag_set( var_2 );
}

missile_launch01()
{
    var_0 = getent( "missile01_start", "targetname" );
    var_1 = getent( "missile01_end", "targetname" );
    var_2 = getent( "icbm_missile01", "targetname" );
    common_scripts\utility::flag_wait( "launch_01" );
    common_scripts\_exploder::exploder( 1 );
    earthquake( 0.1, 8, level.player.origin, 8000 );
    var_2 linkto( var_0 );
    var_0 moveto( var_1.origin, 50, 10, 0 );
    playfxontag( level._effect["smoke_geotrail_icbm"], var_2, "tag_nozzle" );
    var_0 waittill( "movedone" );
    var_2 delete();
}

missile_launch02()
{
    var_0 = getent( "missile02_start", "targetname" );
    var_1 = getent( "missile02_end", "targetname" );
    var_2 = getent( "icbm_missile02", "targetname" );
    common_scripts\utility::flag_wait( "launch_02" );
    wait 1.5;
    common_scripts\_exploder::exploder( 2 );
    earthquake( 0.1, 8, level.player.origin, 8000 );
    var_2 linkto( var_0 );
    var_0 moveto( var_1.origin, 50, 10, 0 );
    playfxontag( level._effect["smoke_geotrail_icbm"], var_2, "tag_nozzle" );
    var_0 waittill( "movedone" );
    var_2 delete();
}

woods_patroller_think()
{
    var_0 = [];
    var_0[var_0.size] = "patrolwalk_1";
    var_0[var_0.size] = "patrolwalk_2";
    var_0[var_0.size] = "patrolwalk_3";
    var_0[var_0.size] = "patrolwalk_4";
    var_0[var_0.size] = "patrolwalk_5";
    self.patrol_walk_twitch = "patrolwalk_pause";
    self.patrol_walk_anim = var_0[randomint( var_0.size )];
    thread maps\_patrol::patrol();
    wait 0.05;
    maps\_stealth_behavior::ai_create_behavior_function( "animation", "wrapper", ::woods_animation_wrapper );
    thread woods_keep_patroling();
}

woods_animation_wrapper( var_0 )
{
    self endon( "death" );
    self endon( "pain_death" );

    if ( !isdefined( level.woods_pause ) )
        level.woods_pause = 0;
    else
        level.woods_pause += 0.2;

    wait(level.woods_pause);
    self notify( "drop_light" );

    if ( maps\_stealth_behavior::enemy_animation_pre_anim( var_0 ) )
        return;

    maps\_stealth_behavior::enemy_animation_do_anim( var_0 );
    maps\_stealth_behavior::enemy_animation_post_anim( var_0 );
}

woods_keep_patroling()
{
    self endon( "death" );
    self endon( "drop_light" );

    for (;;)
    {
        woods_keep_patrolling_wait();
        thread maps\_patrol::patrol();
    }
}

woods_keep_patrolling_wait()
{
    self endon( "death" );
    self endon( "end_patrol" );
    level endon( "_stealth_spotted" );
    level endon( "_stealth_found_corpse" );
    self waittill( "enemy" );
}

remove_vehicle_delete_trigger( var_0 )
{
    var_1 = getentarray( var_0, "targetname" );

    for ( var_2 = 0; var_2 < var_1.size; var_2++ )
    {
        if ( var_1[var_2].classname == "trigger_multiple" )
            var_1[var_2] delete();
    }
}
