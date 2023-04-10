// H1 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

#using_animtree("generic_human");

main()
{
    level.scr_anim["dead_guy"]["death1"] = %exposed_death_nerve;
    level.scr_anim["dead_guy"]["death2"] = %exposed_death_falltoknees;
    level.scr_anim["dead_guy"]["death3"] = %exposed_death_headtwist;
    level.scr_anim["dead_guy"]["death4"] = %exposed_crouch_death_twist;
    level.scr_anim["dead_guy"]["death5"] = %exposed_crouch_death_fetal;
    level.scr_anim["dead_guy"]["death6"] = %death_sitting_pose_v1;
    level.scr_anim["dead_guy"]["death7"] = %death_sitting_pose_v2;
    level.scr_anim["dead_guy"]["death8"] = %death_pose_on_desk;
    level.scr_anim["dead_guy"]["death9"] = %death_pose_on_window;
    level.scr_anim["dead_guy"]["death6_aftermath"] = %death_sitting_pose_v1_alt_aftermath;
    level.scr_animtree["dead_guy"] = #animtree;
    level.dead_body_count = 1;
    var_0 = getdvarint( "ragdoll_max_simulating" ) - 6;

    if ( var_0 > 0 )
        level.max_number_of_dead_bodies = var_0;
    else
        level.max_number_of_dead_bodies = 0;

    var_1 = spawnstruct();
    var_1.bodies = [];
    common_scripts\utility::run_thread_on_targetname( "trigger_body", ::trigger_body, var_1 );
    common_scripts\utility::run_thread_on_targetname( "dead_body", ::spawn_dead_body, var_1 );
}

trigger_body( var_0 )
{
    self waittill( "trigger" );
    var_1 = getentarray( self.target, "targetname" );
    common_scripts\utility::array_thread( var_1, ::spawn_dead_body, var_0 );
}

spawn_dead_body( var_0 )
{
    set_deadbody_info();

    if ( !h1_ragdollspecialcase( self ) && !getdvarint( "ragdoll_enable" ) && isdefined( self.require_ragdoll ) && self.require_ragdoll )
        return;

    if ( !h1_ragdollspecialcase( self ) && level.max_number_of_dead_bodies == 0 )
        return;

    var_1 = undefined;

    if ( isdefined( self.script_index ) )
        var_1 = self.script_index;
    else
    {
        level.dead_body_count++;

        if ( level.dead_body_count > 3 )
            level.dead_body_count = 1;

        var_1 = level.dead_body_count;
    }

    var_2 = spawn( "script_model", ( 0.0, 0.0, 0.0 ) );
    var_2.origin = self.origin;
    var_2.angles = self.angles;
    var_2.animname = "dead_guy";
    var_2 maps\_utility::assign_animtree();

    if ( maps\_utility::is_h1_level() )
        var_2 disablerootmotion();

    if ( !h1_ragdollspecialcase( self ) )
        var_0 que_body( var_2 );

    if ( isdefined( self.custom_deadbody ) )
    {
        precache_custom_deadbody();
        custom_deadbody( var_2 );
    }
    else
        var_2 [[ level.scr_deadbody[var_1] ]]();

    if ( !isdefined( self.script_trace ) )
    {
        var_3 = bullettrace( var_2.origin + ( 0.0, 0.0, 5.0 ), var_2.origin + ( 0.0, 0.0, -64.0 ), 0, undefined );
        var_2.origin = var_3["position"];
    }

    if ( isdefined( self.custom_death_anim ) )
    {
        if ( isdefined( self.link_corpse_clip ) )
        {
            var_4 = getent( "corpse_clip_" + self.script_noteworthy, "targetname" );

            if ( isdefined( var_4 ) )
            {
                var_4.origin = var_2.origin;
                var_4 linkto( var_2, "tag_origin" );
            }
        }

        var_2 thread lookat_custom_death_anim( self.script_noteworthy );
    }
    else
    {
        var_2 setflaggedanim( "flag", var_2 maps\_utility::getanim( self.script_noteworthy ), 1, 0, 1 );
        var_2 waittillmatch( "flag", "end" );

        if ( !isdefined( self.script_start ) )
            var_2 startragdoll();
    }
}

que_body( var_0 )
{
    self.bodies[self.bodies.size] = var_0;

    if ( self.bodies.size <= level.max_number_of_dead_bodies )
        return;

    self.bodies[0] delete();
    self.bodies = common_scripts\utility::array_removeundefined( self.bodies );
}

lookat_custom_death_anim( var_0 )
{
    maps\_anim::anim_first_frame_solo( self, var_0 );
    wait 0.5;
    var_1 = cos( 45 );
    var_2 = 0;

    for (;;)
    {
        if ( distancesquared( level.player.origin, self.origin ) > 5000 && ( !checksighttrace( self ) || !common_scripts\utility::within_fov( level.player geteye(), level.player getplayerangles(), self.origin + ( 0.0, 0.0, 12.0 ), var_1 ) ) )
            var_2 = 0;
        else
            var_2++;

        if ( var_2 > 5 )
            break;

        waitframe();
    }

    maps\_anim::anim_single_solo( self, var_0 );
}

checksighttrace( var_0 )
{
    var_1 = var_0 gettagorigin( "J_Ankle_LE" ) + ( 0.0, 0.0, 3.0 );
    var_2 = var_0 gettagorigin( "J_Hip_RI" );
    var_3 = var_0 gettagorigin( "J_HEAD" );
    return sighttracepassed( level.player geteye(), var_1, 0, level.player, self ) || sighttracepassed( level.player geteye(), var_2, 0, level.player, self ) || sighttracepassed( level.player geteye(), var_3, 0, level.player, self );
}

set_deadbody_info()
{
    if ( !isdefined( self.script_parameters ) )
        return;

    var_0 = strtok( self.script_parameters, "|" );

    foreach ( var_2 in var_0 )
    {
        if ( issubstr( var_2, "custom_deadbody" ) )
        {
            self.custom_deadbody = get_custom_deadbody( var_2 );
            continue;
        }

        if ( issubstr( var_2, "custom_death_anim" ) )
        {
            self.custom_death_anim = 1;
            continue;
        }

        if ( issubstr( var_2, "require_ragdoll" ) )
        {
            self.require_ragdoll = 1;
            continue;
        }

        if ( issubstr( var_2, "link_corpse_clip" ) )
            self.link_corpse_clip = 1;
    }
}

get_custom_deadbody( var_0 )
{
    var_1 = strtok( var_0, ":, " );
    var_1 = common_scripts\utility::array_remove( var_1, var_1[0] );
    var_2 = spawnstruct();
    var_2.body = var_1[0];
    var_2.head = var_1[1];
    var_2.voice = var_1[2];
    var_2.clothtype = var_1[3];
    return var_2;
}

precache_custom_deadbody()
{
    precachemodel( self.custom_deadbody.body );
    precachemodel( self.custom_deadbody.head );
}

custom_deadbody( var_0 )
{
    if ( level.script == "aftermath" && self.custom_deadbody.body == "body_sp_cobra_pilot_desert_velinda_burned" ) 
    {
        character\gfl\randomizer_usmc::precache();
        var_0 character\gfl\randomizer_usmc::main();
        return;
    }

    var_0 setmodel( self.custom_deadbody.body );
    var_0 attach( self.custom_deadbody.head, "", 1 );
    var_0.headmodel = self.custom_deadbody.head;
    var_0.voice = self.custom_deadbody.voice;
    var_0 setclothtype( self.custom_deadbody.clothtype );
}

h1_ragdollspecialcase( var_0 )
{
    return isdefined( level.dead_bodies_ignore_ragdoll_settings ) || isdefined( var_0.custom_death_anim );
}
