// H1 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

orientmodehack_axis( var_0 )
{
    var_0 endon( "newanim" );
    self endon( "death" );
    var_0 endon( "death" );
    var_0 endon( "death" );
    self endon( "unloading" );

    for (;;)
    {
        var_0 orientmode( "face angle", vectortoangles( level.player.origin - var_0.origin )[1] );
        wait 0.05;
    }
}

player_fudge_move_rotate_to( var_0, var_1, var_2, var_3 )
{
    if ( !isdefined( var_2 ) )
        var_2 = 1;

    var_3 unlink();
    var_4 = distance( level.player.origin, var_0 );
    var_5 = var_4 / var_2;
    var_6 = var_5 * 0.05;
    var_7 = var_5 * 0.05;
    var_3 moveto( var_0, var_5, var_6, var_7 );
    var_3 rotateto( var_1, var_5, var_6, var_7 );
    wait(var_5);
    level.player unlink();
}

attacknow()
{
    self waittill( "trigger", var_0 );
    var_0.attacknow = 1;
    var_0 notify( "attacknow" );
}

player_link_update( var_0 )
{
    if ( !isdefined( var_0 ) )
        var_0 = level.playerlinkinfluence;

    level.player playerlinkto( level.playerlinkmodel, "polySurface1", var_0 );
}

player_link_update_delta( var_0 )
{
    if ( !isdefined( var_0 ) )
        var_0 = level.playerlinkinfluence;

    level.player playerlinktodelta( level.playerlinkmodel, "polySurface1", var_0 );
}

fake_position( var_0, var_1 )
{
    var_0 hide();

    if ( var_1 == 999 )
    {
        level.player unlink();
        level.playerlinkmodel = var_0;
    }
    else
    {
        if ( var_1 == 888 )
        {
            self.rpgguyspot = var_0;
            return;
        }

        if ( var_1 == 336 )
        {
            var_0 setcandamage( 1 );
            var_0 show();
            return;
        }

        if ( var_1 == 339 )
        {
            self hide();
            var_0 show();
            return;
        }

        if ( var_1 == 237 )
            return put_stinger_guy_here( var_0 );

        if ( var_1 == 532 )
        {
            var_0 thread rpg_spot( self );
            return;
        }

        if ( var_1 == 533 )
        {
            var_0 hide();
            self.rpgguyspotsecondary = var_0;
            return;
        }

        var_2 = undefined;

        for ( var_3 = 0; var_3 < self.riders.size; var_3++ )
        {
            if ( self.riders[var_3].vehicle_position == var_1 )
                var_2 = self.riders[var_3];
        }

        if ( !isdefined( var_2 ) )
            return;

        var_2 unlink();
        var_4 = "polySurface1";
        var_2 linkto( var_0, var_4, ( 0.0, 0.0, 0.0 ), ( 0.0, 0.0, 0.0 ) );
        wait 1;

        if ( !isai( var_2 ) )
        {
            guy_force_remove_from_vehicle( self, var_2 );
            var_2 thread rider_droneai( var_0, var_4, self );
            return;
        }

        guy_force_remove_from_vehicle( self, var_2 );
        thread whackamole( var_2 );
    }
}

put_stinger_guy_here( var_0 )
{
    var_1 = undefined;

    for ( var_2 = 0; var_2 < self.riders.size; var_2++ )
    {
        if ( issubstr( self.riders[var_2].classname, "stinger" ) )
        {
            var_1 = self.riders[var_2];
            break;
        }
    }

    if ( !isdefined( var_1 ) )
        return;

    waittillframeend;
    var_1 unlink();
    var_1 linkto( var_0, "polySurface1", ( 0.0, 0.0, 0.0 ), ( 0.0, 0.0, 0.0 ) );
}

in_getweaponslist( var_0 )
{
    var_1 = level.player getweaponslistall();

    for ( var_2 = 0; var_2 < var_1.size; var_2++ )
    {
        if ( var_0 == var_1[var_2] )
            return 1;
    }

    return 0;
}

rpg_spot( var_0 )
{
    self hide();
    level waittill( "newrpg" );
    var_1 = 0;
    var_2 = "rpg";
    var_3 = spawn( "weapon_" + var_2, self.origin, 1 );
    var_3 hide();
    var_3.angles = self.angles;
    var_3 linkto( self );
    var_0.jeepride_linked_weapon = var_3;
    wait 0.1;
    var_3 show();
    thread lookattopickup( var_3 );
    var_0 thread registerdroppedweapon();

    while ( !in_getweaponslist( var_2 ) )
        wait 0.05;

    level.player givemaxammo( var_2 );
    common_scripts\utility::flag_set( "rpg_taken" );
    var_4 = level.player getweaponammostock( "rpg" );

    if ( getdvar( "player_sustainAmmo" ) == "0" )
    {
        while ( level.player getweaponammostock( "rpg" ) == var_4 && var_4 )
            wait 0.05;
    }

    common_scripts\utility::flag_set( "rpg_shot" );
    var_5 = 0;
}

lookattopickup( var_0 )
{
    while ( isdefined( var_0 ) )
        waitframe();

    level.player disableweaponpickup();

    while ( isdefined( self ) )
    {
        if ( isdefined( level.player worldpointtoscreenpos( self.origin, 65 ) ) )
            level.player enableweaponpickup();
        else
            level.player disableweaponpickup();

        waitframe();
    }

    level.player enableweaponpickup();
}

registerdroppedweapon()
{
    self endon( "death" );

    for (;;)
    {
        level.player waittill( "pickup", var_0, var_1 );
        self.jeepride_linked_weapon = var_1;
    }
}

local_drone_animontag( var_0, var_1, var_2, var_3, var_4 )
{
    if ( isdefined( var_4 ) )
        var_4 endon( "attacknow" );

    if ( !isdefined( var_3 ) )
        var_3 = 0;

    var_5 = self gettagorigin( var_1 );
    var_6 = self gettagangles( var_1 );
    var_7 = "animontag";
    var_0 animscripted( var_7, var_5, var_6, var_2 );

    if ( !var_3 )
        var_0 waittillmatch( var_7, "end" );
    else
        wait 0.05;

    var_0 notify( "droneanimfinished" );
}

rider_drone_toai( var_0, var_1, var_2, var_3 )
{
    var_4 = maps\_utility::swap_drone_to_ai( var_0 );
    var_4 linkto( var_1, var_2, ( 0.0, 0.0, 0.0 ), ( 0.0, 0.0, 0.0 ) );
    var_1 thread local_drone_animontag( var_4, var_2, var_3 );
    var_4.desired_anim_pose = "crouch";
    var_4 allowedstances( "crouch" );
    var_4 thread animscripts\utility::updateanimpose();
    var_4 allowedstances( "stand", "crouch" );
    thread whackamole( var_4 );
}

#using_animtree("generic_human");

rider_droneai( var_0, var_1, var_2 )
{
    if ( !( isdefined( self.script_noteworthy ) && self.script_noteworthy == "whackamole_guy" ) )
        return;

    self endon( "death" );
    var_3 = "coverstand";
    var_4 = [];
    var_5 = "coverstand";
    var_4[var_5] = [];
    var_4[var_5][var_4[var_5].size] = %coverstand_hide_idle_twitch01;
    var_4[var_5][var_4[var_5].size] = %coverstand_hide_idle_twitch02;
    var_4[var_5][var_4[var_5].size] = %coverstand_hide_idle_twitch03;
    var_4[var_5][var_4[var_5].size] = %coverstand_hide_idle_twitch04;
    var_4[var_5][var_4[var_5].size] = %coverstand_hide_idle_twitch05;
    var_4[var_5][var_4[var_5].size] = %coverstand_look_quick;
    var_4[var_5][var_4[var_5].size] = %coverstand_look_quick;
    var_4[var_5][var_4[var_5].size] = %coverstand_look_quick;
    var_4[var_5][var_4[var_5].size] = %coverstand_hide_idle;
    var_5 = "crouch";
    var_4[var_5] = [];
    var_4[var_5][var_4[var_5].size] = %exposed_crouch_aim_5;
    var_4[var_5][var_4[var_5].size] = %exposed_crouch_reload;
    var_4[var_5][var_4[var_5].size] = %exposed_crouch_reload;
    var_6 = [];
    var_5 = "coverstand_up";
    var_6[var_5] = [];
    var_6[var_5][var_6[var_5].size] = %coverstand_hide_2_aim;
    var_5 = "crouch_up";
    var_6[var_5] = [];
    var_6[var_5][var_6[var_5].size] = %crouch2stand;
    var_7 = [];
    var_5 = "crouch_down";
    var_7[var_5] = [];
    var_7[var_5][var_7[var_5].size] = %stand2crouch_attack;
    var_5 = "crouch_down";
    var_7[var_5] = [];
    var_7[var_5][var_7[var_5].size] = %stand2crouch_attack;
    var_2 endon( "death" );
    var_2.attacknow = 0;
    var_8 = 0;

    while ( !var_2.attacknow )
    {
        var_9 = getarraykeys( var_4 );
        var_8 = randomint( var_9.size );
        var_5 = var_9[var_8];
        var_8 = randomint( var_4[var_5].size );
        var_0 local_drone_animontag( self, var_1, var_4[var_5][var_8], undefined, var_2 );
    }

    var_2 thread rider_drone_toai( self, var_0, var_1, var_4[var_5][var_8] );
}

apply_truckjunk_loc( var_0, var_1 )
{
    for ( var_2 = 0; var_2 < var_1.size; var_2++ )
    {
        var_3 = var_0.truckjunk[var_2];

        if ( isdefined( var_1[var_2].script_startingposition ) )
            var_0 thread fake_position( var_3, var_1[var_2].script_startingposition );

        if ( isdefined( var_1[var_2].script_noteworthy ) && var_1[var_2].script_noteworthy == "loosejunk" )
            var_3 thread loosejunk( var_0 );
    }
}

process_vehicles_spawned()
{
    for (;;)
    {
        self waittill( "spawned", var_0 );

        if ( var_0.vehicletype == "bmp" )
            continue;

        if ( var_0.script_team == "allies" )
            var_0 thread riders_godon();

        var_0 thread tire_deflate();
        var_0 thread maps\_vehicle::godon();

        if ( isdefined( var_0.truckjunk ) )
            apply_truckjunk_loc( var_0, self.truckjunk );

        var_0 thread kill_stupid_vehicle_threads();
        var_0 thread freeonend();
        var_0 thread joltonend();
        var_0 thread maps\jeepride_aud::stop_unimportant_vehicle();

        if ( isdefined( level.playersride ) )
            var_0 thread maps\jeepride_aud::passby_sfx();

        var_0.customvehicletodummytransferfunc = ::jeepride_custom_vehicle_to_dummy;
    }
}

joltonend()
{
    self waittill( "reached_end_node" );
    self joltbody( self.origin + ( 32.0, 32.0, 64.0 ), 1.5 );
}

kill_stupid_vehicle_threads()
{
    waittillframeend;
    maps\_vehicle_code::vehicle_kill_badplace_forever();
    maps\_vehicle::vehicle_kill_rumble_forever();
    maps\_vehicle_code::vehicle_kill_disconnect_paths_forever();
}

player_death()
{
    level.player waittill( "death" );
    common_scripts\utility::array_thread( maps\_vehicle::get_script_vehicles(), ::deadplayer_stop );
    level.player allowcrouch( 0 );
    level.player allowprone( 0 );
}

deadplayer_stop()
{
    if ( maps\_vehicle::ishelicopter() )
        return;

    self vehicle_setspeed( 0, 25 );
}

spawners_setup()
{
    self waittill( "spawned", var_0 );
    waittillframeend;

    if ( !isdefined( var_0 ) )
        return;

    remember_weaponsondeath( var_0 );
    var_0 add_death_function( ::remember_weaponsondeath );

    if ( common_scripts\utility::flag( "bridge_zakhaev_setup" ) )
    {
        var_0.a.disablelongdeath = 1;
        var_0.dropweapon = 0;
    }

    if ( common_scripts\utility::flag( "end_ride" ) )
        return;

    if ( isdefined( var_0.a.rockets ) && var_0.a.rockets && var_0.weapon == "stinger_speedy" )
        var_0 thread rocket_handle();

    var_0.a.disablelongdeath = 1;
    var_0 endon( "death" );
    var_0.dropweapon = 0;
}

sethindtarget( var_0 )
{
    if ( isdefined( var_0 ) )
        self.hindenemy = var_0;
    else
        var_0 = self.hindenemy;

    var_1 = spawn( "script_origin", var_0 gettagorigin( "tag_light_belly" ) );
    var_1.origin = var_0 gettagorigin( "tag_light_belly" ) + ( 0.0, 0.0, -24.0 );
    var_1 linkto( var_0 );
    var_1 thread attractorent_delete_on_vehicle_death( var_0 );
    self clearentitytarget();
    self setentitytarget( var_1 );
    self.shootent = var_1;
    self.shootpos = self.shootent getshootatpos();
    self.attractorent = var_1;
    self.shootstyle = "single";
    self.hindenemy = var_0;
}

attractorent_delete_on_vehicle_death( var_0 )
{
    self endon( "death" );
    var_0 waittill( "death" );
    self delete();
}

set_animarray_standing()
{
    self.a.array = [];
    self.a.array["add_aim_up"] = %rpg_stand_aim_8;
    self.a.array["add_aim_down"] = %rpg_stand_aim_2;
    self.a.array["add_aim_left"] = %rpg_stand_aim_4;
    self.a.array["add_aim_right"] = %rpg_stand_aim_6;
    self.a.array["fire"] = %rpg_stand_fire;
    self.a.array["straight_level"] = %rpg_stand_aim_5;
    self.a.array["reload"] = animscripts\utility::array( %rpg_stand_reload );
    self.a.array["reload_crouchhide"] = animscripts\utility::array();
    self.a.array["exposed_idle"] = animscripts\utility::array( %rpg_stand_idle );
    self.a.array["single"] = animscripts\utility::array( %exposed_shoot_semi1 );
    self.a.array["crouch_2_stand"] = %exposed_crouch_2_stand;
    self.a.array["crouch_2_prone"] = %crouch_2_prone;
    self.a.array["stand_2_crouch"] = %exposed_stand_2_crouch;
    self.a.array["stand_2_prone"] = %stand_2_prone;
    self.a.array["prone_2_crouch"] = %prone_2_crouch;
    self.a.array["prone_2_stand"] = %prone_2_stand;
    self.a.array["turn_left_45"] = %exposed_tracking_turn45l;
    self.a.array["turn_left_90"] = %exposed_tracking_turn90l;
    self.a.array["turn_left_135"] = %exposed_tracking_turn135l;
    self.a.array["turn_left_180"] = %exposed_tracking_turn180l;
    self.a.array["turn_right_45"] = %exposed_tracking_turn45r;
    self.a.array["turn_right_90"] = %exposed_tracking_turn90r;
    self.a.array["turn_right_135"] = %exposed_tracking_turn135r;
    self.a.array["turn_right_180"] = %exposed_tracking_turn180l;
    self.a.array["add_turn_aim_up"] = %exposed_turn_aim_8;
    self.a.array["add_turn_aim_down"] = %exposed_turn_aim_2;
    self.a.array["add_turn_aim_left"] = %exposed_turn_aim_4;
    self.a.array["add_turn_aim_right"] = %exposed_turn_aim_6;
    self.turnthreshold = 35;
    self.rightaimlimit = 45;
    self.leftaimlimit = -45;
    self.upaimlimit = 45;
    self.downaimlimit = -45;
    self.turnleft180limit = -130;
    self.turnright180limit = 130;
    self.turnleft90limit = -70;
    self.turnright90limit = 70;
}

rpg_guy_animcustom_setup()
{
    set_animarray_standing();
    self.a.movement = "stop";
    self.previouspitchdelta = 0.0;
    self clearanim( %root, 0.2 );
    self setanim( animscripts\utility::animarray( "straight_level" ) );
    self setanim( %add_idle );
    self clearanim( %aim_4, 0.2 );
    self clearanim( %aim_6, 0.2 );
    self clearanim( %aim_2, 0.2 );
    self clearanim( %aim_8, 0.2 );
    animscripts\combat_utility::setupaim( 0.2 );
    thread idlethread();
    self.a.meleestate = "aim";
    self.twitchallowed = 1;
}

watchshootentvelocity()
{
    self endon( "death" );
    self.shootentvelocity = ( 0.0, 0.0, 0.0 );
    var_0 = undefined;
    var_1 = self.origin;
    var_2 = 0.15;

    for (;;)
    {
        if ( isdefined( self.enemy ) && isdefined( var_0 ) && self.enemy == var_0 )
        {
            var_3 = self.enemy.origin;
            self.shootentvelocity = maps\_utility::vector_multiply( var_3 - var_1, 1 / var_2 );
            var_1 = var_3;
        }
        else
        {
            if ( isdefined( self.enemy ) )
                var_1 = self.enemy.origin;
            else
                var_1 = self.origin;

            var_0 = self.enemy;
            self.shootentvelocity = ( 0.0, 0.0, 0.0 );
        }

        wait(var_2);
    }
}

decidewhatandhowtoshoot()
{
    self notify( "stop_deciding_how_to_shoot" );
    self endon( "stop_deciding_how_to_shoot" );
    self endon( "death" );
    self.shootobjective = "normal";
    self.fastburst = 0;
    self.shouldreturntocover = undefined;
    self.changingcoverpos = 0;
    var_0 = self.shootent;
    var_1 = self.shootpos;
    var_2 = self.shootstyle;
}

idlethread()
{
    self endon( "kill_local_animcustoms" );

    for (;;)
    {
        var_0 = animscripts\utility::animarraypickrandom( "exposed_idle" );
        self setflaggedanimlimited( "idle", var_0 );
        self waittillmatch( "idle", "end" );
        self clearanim( var_0, 0.2 );
    }
}

trackshootentorpos()
{
    self endon( "killanimscript" );
    self endon( "death" );
    self endon( "kill_local_animcustoms" );
    animscripts\track::trackloop( %aim_2, %aim_4, %aim_6, %aim_8 );
}

suppress_animscripts()
{
    self endon( "death" );

    for (;;)
    {
        self notify( "killanimscript" );
        waittillframeend;
        self notify( "killanimscript" );
        wait 0.05;
    }
}

rpg_guy_animcustom()
{
    self endon( "death" );
    self endon( "kill_local_animcustoms" );
    rpg_guy_animcustom_setup();
    animscripts\track::setanimaimweight( 0 );
    thread trackshootentorpos();
    thread decidewhatandhowtoshoot();
    thread watchshootentvelocity();
    self animmode( "zonly_physics", 0 );
    self orientmode( "face angle", self.angles[1] );
    self.a.scriptstarttime = gettime();
    self.deathfunction = undefined;
    set_animarray_standing();
    self.shootent = self.enemy;
    self.shootpos = self.shootent.origin;

    while ( animscripts\combat::needtoturn() )
    {
        var_0 = 0.25;

        if ( isdefined( self.enemy ) && !issentient( self.enemy ) )
            var_0 = 1.5;

        var_1 = animscripts\shared::getpredictedaimyawtoshootentorpos( var_0 );

        if ( animscripts\combat::turntofacerelativeyaw( var_1 ) )
        {
            wait 0.05;
            continue;
        }

        wait 0.05;
    }

    if ( !has_hind_enemy() )
        return;

    self shoot();
    self.ignoreall = 1;
    self.shootent = self.enemy;
    self.shootpos = self.shootent.origin;
    level thread vehicle_dropflare( self.hindenemy, self.attractorent );
    self clearanim( %add_fire, 0.2 );
    wait(randomfloatrange( 5, 9 ));
    self.shootent = undefined;
    self.shootpos = undefined;
}

has_hind_enemy()
{
    return isdefined( self.hindenemy );
}

orientmodehack_axis_2( var_0 )
{
    self notify( "orientmodehack_axis_2" );
    self endon( "orientmodehack_axis_2" );
    self endon( "death" );
    self endon( "unloading" );
    var_0 endon( "death" );

    for (;;)
    {
        self orientmode( "face angle", vectortoangles( var_0.origin - self.origin )[1] );
        wait 0.05;
    }
}

attractorent_link( var_0 )
{

}

rocket_handle()
{
    self endon( "death" );
    wait 1;

    if ( !isdefined( self.ridingvehicle ) )
        return;

    var_0 = self.ridingvehicle;
    self.rocketattachpos = self.vehicle_position;
    guy_force_remove_from_vehicle( var_0, self );
    self allowedstances( "crouch", "stand" );

    if ( !isdefined( var_0.rocketmen ) )
        var_0.rocketmen = [];

    var_0.rocketmen[var_0.rocketmen.size] = self;
    self.ignoreall = 1;
    self.a.rockets = 400;
    var_1 = self.a.rockets;

    for (;;)
    {
        self.ignoreall = 1;

        while ( !isdefined( self.hindenemy ) )
            wait 0.05;

        self.ignoreall = 0;
        self animcustom( ::rpg_guy_animcustom );

        while ( isdefined( self.shootent ) && isdefined( self.hindenemy ) )
            wait 0.05;

        wait 0.05;
        self notify( "kill_local_animcustoms" );

        if ( isdefined( self.hindenemy ) )
            sethindtarget();
    }
}

donothing()
{
    for (;;)
        wait 1;
}

magic_missileguy_magiccrouch()
{
    self endon( "death" );
    self hide();
    self.desired_anim_pose = "crouch";
    self allowedstances( "crouch" );
    thread animscripts\utility::updateanimpose();
    wait 1.5;
    self show();
    self.desired_anim_pose = "stand";
    self allowedstances( "stand" );
    thread animscripts\utility::updateanimpose();
    wait 3;
    self notify( "missileready" );
}

magic_missileguy_spawner()
{
    var_0 = getvehiclenode( self.target, "targetname" );
    var_0 waittill( "trigger", var_1 );

    if ( isdefined( var_1.magic_missile_guy ) )
        return;

    level.special_autosavecondition = ::save_fail_on_rpgguy;
    var_2 = var_1.rpgguyspot;
    self.origin = var_2.origin;
    self.angles = vectortoangles( level.player geteye() - self.origin );
    var_3 = maps\_utility::dronespawn( self );
    var_4 = getentarray( "assist_brush", "targetname" )[0];
    var_4 notsolid();
    var_4 unlink();
    var_4 linkto( var_3, "J_Head", ( 0.0, 0.0, 0.0 ), ( 0.0, 0.0, 0.0 ) );
    var_4 enableaimassist();
    var_4 hide();
    var_5 = "polySurface1";
    var_3 linkto( var_2, var_5, ( 0.0, 0.0, 0.0 ), ( 0.0, 0.0, 0.0 ) );
    var_1.magic_missile_guy = var_3;
    var_6 = spawn( "script_model", level.player geteye() );
    var_6.origin = level.player geteye() + maps\_utility::vector_multiply( anglestoforward( self.angles ), 64 );
    var_6 hide();
    var_6 setmodel( "fx" );
    var_6 linkto( level.playersride );
    player_link_update( 0.1 );
    var_3.delayeddeath = 0;
    var_3 thread maps\_spawner::ai_damage_think();
    var_3 maps\_damagefeedback::monitordamage();
    var_3 thread magic_missileguy_takehits( var_1, var_6 );
    var_3 thread magic_missileguy_rpg( var_1, var_2, var_5, var_6 );
}

reset_autosave_condition()
{
    level.special_autosavecondition = undefined;
}

magic_missileguy_takehits( var_0, var_1 )
{
    self setcandamage( 1 );
    self.health = 4000;
    var_0 endon( "death" );
    var_2 = 100;

    for (;;)
    {
        self waittill( "damage", var_3, var_4 );

        if ( isplayer( var_4 ) )
            break;

        self.health = 4000;
    }

    player_link_update();
    level notify( "kill_confirm" );
    var_0.magic_missile_guy = undefined;
    self kill();

    if ( getdvar( "ragdoll_enable" ) != "0" )
        self unlink();

    self stopanimscripted();
    var_5 = %death_stand_dropinplace;
    self animscripted( "death_stand_dropinplac", self.origin, self.angles, var_5 );
    thread ragdoll_or_death_duringanimation( var_5 );
}

ragdoll_or_death_duringanimation( var_0 )
{
    var_1 = 0.2;
    var_2 = getanimlength( var_0 );
    var_3 = gettime() + var_2 * 1000;
    wait(var_2 * 0.2);

    if ( getdvar( "ragdoll_enable" ) == "0" )
    {
        wait(var_2 * 0.8);
        self delete();
        return;
    }

    while ( !self isragdoll() && gettime() < var_3 )
    {
        self startragdoll();
        wait 0.05;
    }

    if ( !self isragdoll() )
        self delete();

    wait 10;

    if ( isdefined( self ) )
        self delete();
}

dialog_rpg()
{
    var_0 = [];
    var_1 = [];
    var_1[var_1.size] = "jeepride_grg_hostilerpg";
    var_1[var_1.size] = "jeepride_grg_anotherrpg";
    var_1[var_1.size] = "jeepride_grg_takemout";
    var_0[var_0.size] = "jeepride_pri_fireontruck";
    var_0[var_0.size] = "jeepride_pri_openfire";
    var_0[var_0.size] = "jeepride_pri_shootthattruck";
    var_0 = common_scripts\utility::array_randomize( var_0 );
    var_0 = common_scripts\utility::array_randomize( var_0 );
    var_2 = 0;
    var_3 = 0;

    for (;;)
    {
        level waittill( "rpg_truck" );
        level.griggs thread maps\_anim::anim_single_queue( level.griggs, var_1[var_3] );
        var_3++;

        if ( var_3 == var_1.size )
            var_3 = 0;

        level waittill( "rpg_truck" );
        level.price thread maps\_anim::anim_single_queue( level.price, var_0[var_2] );
        var_2++;

        if ( var_2 == var_0.size )
            var_2 = 0;
    }
}

magic_missileguy_rpg( var_0, var_1, var_2, var_3 )
{
    var_0 endon( "death" );
    self endon( "death" );
    var_4 = %exposed_crouch_aim_5;
    var_5 = %crouch2stand;
    var_6 = %rpg_stand_aim_5;
    var_7 = %stand2crouch_attack;
    var_8 = 4000;
    var_9 = 2500;
    var_1 local_drone_animontag( self, var_2, var_4 );
    level notify( "rpg_truck" );
    var_1 local_drone_animontag( self, var_2, var_5 );

    for (;;)
    {
        var_10 = timer_set( var_8 );

        while ( !timer_past( var_10 ) )
            var_1 local_drone_animontag( self, var_2, var_6, 1 );

        thread fake_rpg_shot( var_3, var_0 );
        var_1 local_drone_animontag( self, var_2, var_7 );
        var_10 = timer_set( var_9 );

        while ( !timer_past( var_10 ) )
            var_1 local_drone_animontag( self, var_2, var_4 );

        level notify( "rpg_truck" );
        var_1 local_drone_animontag( self, var_2, var_5 );
    }
}

fake_rpg_shot( var_0, var_1 )
{
    var_2 = self gettagorigin( "tag_flash" );
    var_3 = self gettagangles( "tag_flash" );
    var_4 = spawn( "script_model", var_2 );
    var_4.angles = var_3;
    var_4 setmodel( "projectile_rpg7" );
    playfxontag( level._effect["rpg_flash"], var_4, "TAG_FX" );
    var_4 thread maps\_utility::play_sound_on_tag_endon_death( "magic_missile_guy_fire" );
    var_5 = 2400;
    var_6 = vectornormalize( var_0.origin - var_2 );
    var_7 = var_2 + maps\_utility::vector_multiply( var_6, 5000 );
    playfxontag( level._effect["rpg_trail"], var_4, "TAG_FX" );
    var_8 = var_2;
    var_4 notsolid();
    var_4 thread movewithrate( var_7, var_3, var_5 );
    var_9 = 450;

    for (;;)
    {
        wait 0.05;
        var_10 = bullettrace( var_8, var_4.origin, 0, var_1 );

        if ( var_4.movefinished )
        {
            var_4 delete();
            return;
        }

        if ( var_10["fraction"] != 1 && distance( var_2, var_4.origin ) > var_9 )
            break;

        var_8 = var_4.origin;
    }

    var_4 thread common_scripts\utility::play_sound_in_space( "magic_missile_guy_rocket_exp", var_4.origin );
    playfx( level._effect["rpg_explode"], var_4.origin );
    radiusdamage( var_4.origin, 400, 150, 26 );
    level.player playrumbleonentity( "tank_rumble" );
    earthquake( 0.8, 0.8, level.player.origin, 2000 );
    wait 0.01;
    var_4 delete();

    if ( !isalive( level.player ) )
        setomnvar( "ui_go_black", 1.0 );
}

timer_set( var_0 )
{
    return gettime() + var_0;
}

timer_past( var_0 )
{
    if ( gettime() > var_0 )
        return 1;

    return 0;
}

physicslaunch_loc( var_0, var_1, var_2 )
{
    if ( !isdefined( var_2 ) )
        var_2 = 0.1;

    var_3 = self.origin;
    wait(var_2);
    var_4 = vectornormalize( self.origin - var_3 );
    var_5 = anglestoup( self.angles );
    self unlink();

    if ( !isdefined( self.physlaunched ) )
        self physicslaunchclient( self.origin + maps\_utility::vector_multiply( var_5, var_0 ), maps\_utility::vector_multiply( var_4, var_1 ) );

    wait 10;
    self delete();
}

can_cannon()
{
    level.cannonpower = 100;
    precachemodel( "com_trashcan_metal" );

    for (;;)
    {
        if ( level.player usebuttonpressed() )
            fire_can();

        wait 0.05;
    }
}

fire_can()
{
    var_0 = spawn( "script_model", level.player geteye() );
    var_0 setmodel( "com_trashcan_metal" );
    var_1 = maps\_utility::vector_multiply( vectornormalize( anglestoforward( level.player getplayerangles() ) ), level.cannonpower );
    var_0 physicslaunchclient( var_0.origin + ( 0.0, 0.0, 17.0 ), var_1 + ( 0.0, 0.0, 17.0 ) );
    wait 0.05;
}

no_godmoderiders()
{
    for (;;)
    {
        self waittill( "trigger", var_0 );

        for ( var_1 = 0; var_1 < var_0.riders.size; var_1++ )
        {
            if ( issentient( var_0.riders[var_1] ) && isdefined( var_0.riders[var_1].magic_bullet_shield ) )
                var_0.riders[var_1] thread maps\_utility::stop_magic_bullet_shield();
        }

        if ( isdefined( var_0.rocketmen ) )
        {
            for ( var_1 = 0; var_1 < var_0.rocketmen.size; var_1++ )
            {
                if ( issentient( var_0.rocketmen[var_1] ) && isdefined( var_0.rocketmen[var_1].magic_bullet_shield ) )
                {
                    var_0.rocketmen[var_1] thread maps\_utility::stop_magic_bullet_shield();
                    var_0.rocketmen[var_1] delete();
                }
            }
        }
    }
}

all_allies_targetme()
{
    self waittill( "trigger", var_0 );

    if ( !isdefined( var_0.flaretargetents ) )
        var_0.flaretargetents = [];

    var_1 = getaiarray( "allies" );

    for ( var_2 = 0; var_2 < var_1.size; var_2++ )
    {
        if ( var_1[var_2].classname != "actor_ally_sas_woodland_stinger" )
            continue;

        var_1[var_2] thread sethindtarget( var_0 );
    }

    var_0 endon( "death" );
}

vehicle_dropflare( var_0, var_1 )
{
    if ( common_scripts\utility::flag( "bx_stop_flares" ) )
        return;

    wait(randomfloatrange( 0, 0.5 ));

    if ( !isdefined( var_0 ) )
    {
        if ( isdefined( var_1 ) )
            var_1 delete();

        return;
    }

    level thread jeepride_flares_fire_burst( var_0, 8, 6, 5.0 );
    var_0 thread vehicle_drop_single_flare( var_1 );
}

vehicle_drop_single_flare( var_0 )
{
    var_0 endon( "death" );
    var_0 unlink();
    var_1 = maps\_helicopter_globals::flares_get_vehicle_velocity( self );
    var_0 movegravity( var_1, 8 );
    wait 12;
    var_0 delete();
}

hind_lock_on_player_on()
{
    level.lock_on_player = 1;
    level endon( "lock_on_player_off" );
    level.lock_on_player_ent.script_shotcount = 1;

    for (;;)
    {
        while ( level.lock_on_player_ent.script_attackmetype == "missile" )
            wait 0.05;

        wait 2;
        level.lock_on_player_ent.script_shotcount = 1;
        level.lock_on_player_ent.script_attackmetype = "missile";
    }
}

hind_lock_on_player_off()
{
    level notify( "lock_on_player_off" );
    level.lock_on_player = 0;
}

stinger_me( var_0 )
{
    level endon( "clear_all_vehicles_but_heros" );
    self waittill( "trigger", var_1 );

    if ( !isdefined( var_0 ) )
        var_0 = 1;

    player_link_update( 0.1 );

    if ( var_0 )
        wait 3;

    if ( var_0 )
        wait 8;

    if ( var_0 )
        thread hind_lock_on_player_on();

    common_scripts\utility::flag_wait( "rpg_taken" );
    common_scripts\utility::flag_wait( "rpg_shot" );

    if ( var_0 )
        hind_lock_on_player_off();

    player_link_update();

    if ( !isdefined( var_1 ) )
        return;

    var_1 endon( "death" );
    level thread jeepride_flares_fire_burst( var_1, 8, 6, 5.0 );
}

jeepride_flares_fire_burst( var_0, var_1, var_2, var_3 )
{
    var_0 endon( "death" );

    for ( var_4 = 0; var_4 < var_1; var_4++ )
    {
        playfx( level.flare_fx[var_0.vehicletype], var_0 gettagorigin( "tag_light_belly" ) );
        wait 0.05;
    }
}

do_or_die()
{
    self waittill( "trigger" );

    if ( !level.lock_on_player )
        return;

    wait 0.45;
    playfx( level._effect["rpg_explode"], level.player.origin );
    level.playervehicle thread common_scripts\utility::play_sound_in_space( "explo_metal_rand", level.player geteye(), 1 );
    level.player enablehealthshield( 0 );
    radiusdamage( level.player.origin, 8, level.player.health + 5, level.player.health + 5 );
    level.player enablehealthshield( 1 );
}

loosejunk( var_0 )
{
    self.health = 700;
    self setcandamage( 1 );
    var_0 endon( "junk_throw" );

    for (;;)
    {
        self waittill( "damage", var_1, var_2, var_3, var_4 );

        if ( !isplayer( var_2 ) && self.health > 100 )
            continue;

        self unlink();
        var_5 = anglestoforward( var_0.angles );
        var_6 = maps\_utility::vector_multiply( vectornormalize( var_4 - self.origin ), randomfloat( 2 ) );
        self.origin += maps\_utility::vector_multiply( var_5, 32 );
        var_7 = maps\_utility::vector_multiply( var_5, 18000 );
        self.physlaunched = 1;
        self physicslaunchclient( self.origin + var_6, maps\_utility::vector_multiply( var_3, 10 ) + ( 0.0, 0.0, 20.0 ) + var_7 );

        if ( self.model == "me_corrugated_metal2x4" )
            thread maps\_utility::play_sound_on_entity( "scn_bmp21_metalplates" );

        return;
    }
}

junk_throw()
{
    if ( !isdefined( self.truckjunk ) )
        return;

    if ( self == level.playersride )
        return;

    if ( isdefined( self.junkthrown ) )
        return;

    self.junkthrown = 1;
    self notify( "junk_throw" );

    for ( var_0 = 0; var_0 < self.truckjunk.size; var_0++ )
    {
        if ( isdefined( self.truckjunk[var_0].script_startingposition ) || self.truckjunk[var_0].model == "axis" )
            continue;

        var_1 = 17;
        var_2 = 80000;
        var_3 = randomfloat( 0.7 );

        if ( self.truckjunk[var_0].model == "com_barrel_blue" || self.truckjunk[var_0].model == "com_barrel_black" || self.truckjunk[var_0].model == "com_plasticcase_beige_big" )
        {
            var_2 = 660000;
            var_1 = 23;
            var_3 = randomfloat( 1 );
        }
        else if ( self.truckjunk[var_0].model == "me_corrugated_metal2x4" )
        {
            var_2 = 1000;
            var_1 = 0;
        }

        self.truckjunk[var_0] maps\_utility::delaythread( var_3, ::physicslaunch_loc, var_1, var_2 );
    }
}

riders_godon()
{
    var_0 = 0;

    for ( var_1 = 0; var_1 < self.riders.size; var_1++ )
    {
        if ( issentient( self.riders[var_1] ) )
        {
            var_0 = 1;

            if ( !isdefined( self.riders[var_1].magic_bullet_shield ) && !self.riders[var_1] ishero() )
                self.riders[var_1] thread maps\_utility::magic_bullet_shield();
        }
    }

    if ( !var_0 )
        return;

    wait 0.2;
    self notify( "no_free_on_end" );
}

monitorvehiclecounts()
{
    for (;;)
    {
        if ( maps\_vehicle::get_script_vehicles().size > 60 )
            vehicle_dump();

        wait 0.05;
    }
}

vehicle_dump()
{

}

destructible_assistance()
{
    self waittill( "trigger", var_0 );
    var_0 maps\_vehicle::godoff();
    var_0 notify( "stop_friendlyfire_shield" );
    var_0.health = 1;

    if ( var_0 common_scripts\utility::isdestructible() )
        var_0 notify( "damage", 5000, level.player, ( 1.0, 1.0, 1.0 ), var_0.origin, "mod_explosive", var_0.model, undefined );
    else
        var_0 notify( "death" );
}

killthrow()
{
    wait(randomfloat( 0.5 ));

    if ( !isai( self ) )
    {
        thread ragdollragdollragdollragdollragdollragdoll();
        return;
    }

    if ( isdefined( self.magic_bullet_shield ) && self.magic_bullet_shield )
        return;

    if ( isdefined( self.vehicle_position ) )
    {
        if ( self.vehicle_position == 0 || self.vehicle_position == 1 )
        {
            self delete();
            return;
        }
    }

    self kill();
    wait 10;

    if ( isdefined( self ) )
        self delete();
}

heli_focusonplayer()
{
    self waittill( "trigger", var_0 );
    var_0 setlookatent( level.playersride );
    var_0 setturrettargetent( level.playersride );
}

heli_mg_burst( var_0 )
{
    var_1 = randomintrange( 25, 45 );

    for ( var_2 = 0; var_2 < var_1; var_2++ )
    {
        self setvehweapon( "hind_turret" );
        self fireweapon( "tag_flash" );
        wait 0.05;

        if ( var_0.script_attackmetype != "mg_burst" || playerinhelitargetsights_orrandom( var_0 ) )
            break;
    }

    wait(randomfloatrange( 0.5, 1 ));
}

playerinhelitargetsights_orrandom( var_0 )
{
    var_1 = distance( var_0.origin, level.player.origin ) < 32;

    if ( !var_1 && randomint( 25 ) > 18 )
        var_1 = 1;

    if ( var_1 )
        var_0.script_attackmetype = "missile";

    return var_1;
}

shoot_the_vehicles()
{
    var_0 = gettime() + 10000;
    var_1 = getentarray( "destroy_at_end", "script_noteworthy" );
    var_2 = [];

    for ( var_3 = 0; var_3 < var_1.size; var_3++ )
    {
        if ( var_1[var_3].code_classname == "script_vehicle" )
            var_2[var_2.size] = var_1[var_3];
    }

    for ( var_3 = 0; var_3 < var_2.size; var_3++ )
        shootspotoncewithmissile( var_2[var_3].origin + ( 0.0, 0.0, 34.0 ) );
}

shootnearest_non_hero_friend()
{
    var_0 = getaiarray( "allies" );
    var_1 = [];

    for ( var_2 = 0; var_2 < var_0.size; var_2++ )
    {
        if ( !isdefined( var_0[var_2].magic_bullet_shield ) || !var_0[var_2].magic_bullet_shield )
            var_1[var_1.size] = var_0[var_2];
    }

    if ( !var_1.size )
        return;

    var_3 = common_scripts\utility::getclosest( level.player.origin, var_1 );
    shootspotoncewithmissile( var_3 gettagorigin( "J_Head" ) );
}

shootspotoncewithmissile( var_0 )
{
    var_1 = spawn( "script_model", var_0 );
    badplace_cylinder( "missilespot", 2, var_0, 200, 300, "allies", "axis" );
    var_1.oldmissiletype = 0;
    var_1.script_attackmetype = "missile";
    var_1.script_shotcount = 1;
    thread shootenemytarget( var_1 );
    var_1 waittill( "shot_at" );
    var_1 delete();
}

shootenemytarget( var_0, var_1 )
{
    if ( !isdefined( var_1 ) )
        var_1 = 0;

    self endon( "death" );
    self endon( "mg_off" );
    var_0 endon( "death" );
    self endon( "gunner_new_target" );
    self setturrettargetent( var_0 );
    wait(var_1);
    var_2 = "mg";
    var_3 = var_0;
    var_4 = 0;

    while ( self.health > 0 )
    {
        if ( level.lock_on_player )
        {
            self setturrettargetent( var_0 );
            var_0 = level.lock_on_player_ent;
        }
        else if ( isdefined( var_0.offshoot_ent ) )
        {
            var_0 = var_0.offshoot_ent;
            var_4 = 1;
        }
        else
            var_0 = var_3;

        if ( isdefined( var_0.script_attackmetype ) )
            var_2 = var_0.script_attackmetype;

        if ( var_2 == "none" )
        {
            wait 0.05;
            continue;
        }

        if ( var_2 == "mg" )
        {
            self setvehweapon( "hind_turret" );
            self fireweapon( "tag_flash" );
            wait 0.05;
            continue;
        }

        if ( var_2 == "mg_burst" )
        {
            heli_mg_burst( var_0 );
            continue;
        }

        if ( var_2 == "missile" || var_2 == "missile_old" || var_2 == "missile_bridgebuster" )
        {
            var_5 = "hind_ffar_jeepride";

            if ( var_2 == "missile_bridgebuster" )
                var_5 = "crash_missile_jeepride";

            if ( var_2 == "missile_old" )
                var_0.oldmissiletype = 1;

            self setvehweapon( var_5 );
            var_6 = 6;

            if ( isdefined( var_0.script_shotcount ) )
                var_6 = var_0.script_shotcount;

            fire_missile( var_5, var_6, var_0, 0.2 );
            var_0 notify( "shot_at" );
            var_0.script_attackmetype = "mg";

            if ( var_2 == "missile_bridgebuster" )
                var_0.script_attackmetype = "none";

            if ( var_4 )
            {
                var_0 = var_3;
                var_4 = 0;
            }

            continue;
        }
    }
}

missile_offshoot()
{
    var_0 = common_scripts\utility::getstruct( self.target, "targetname" );
    self.script_attackmetype = "missile";
    var_0.offshoot_ent = self;
    self.oldmissiletype = 0;
    self.script_shotcount = 1;
    self hide();
}

sound_emitter()
{
    var_0 = common_scripts\utility::get_links();
    var_1 = undefined;
    var_2 = self.script_noteworthy;

    for ( var_3 = 0; var_3 < var_0.size; var_3++ )
    {
        var_1 = getvehiclenode( var_0[var_3], "script_linkname" );

        if ( !isdefined( var_1 ) )
            continue;

        var_1 thread sound_emitter_single( var_2 );
    }

    self delete();
}

sound_emitter_single( var_0 )
{
    self waittill( "trigger", var_1 );

    if ( var_0 == "truck_horn" && var_1 != level.playersride )
        return;

    var_1 thread maps\_utility::play_sound_on_entity( var_0 );
}

ambient_setter()
{
    var_0 = getvehiclenode( self.target, "targetname" );
    self hide();
    var_1 = self.ambient;
    var_0 waittill( "trigger" );
    var_2 = var_1;

    if ( var_2 == "interior" )
        maps\_utility::set_vision_set( "jeepride_tunnel", 2 );

    if ( var_2 == "exterior" )
        maps\_utility::set_vision_set( "jeepride", 2 );
}

whackamole_unload( var_0 )
{
    self endon( "death" );
    var_0 endon( "death" );
    self waittill( "unloading" );
    var_0.desired_anim_pose = undefined;
    var_0 allowedstances( "crouch", "stand", "prone" );
    var_0.ignoreall = 0;
    wait 1;
    var_0 unlink();
}

whackamole( var_0 )
{
    var_0 endon( "newanim" );
    self endon( "death" );
    self endon( "unloading" );
    var_0 endon( "death" );

    if ( !isdefined( self.whackamolecount ) )
        self.whackamolecount = 0;

    if ( !isdefined( self.whackamoleguys ) )
        self.whackamoleguys = [];

    var_0.whackamole_on = 0;

    if ( !isai( var_0 ) )
        return;

    thread whackamole_death( var_0 );
    thread whackamole_unload( var_0 );

    if ( var_0.team == "allies" )
    {
        var_0.desired_anim_pose = "crouch";
        var_0 allowedstances( "crouch" );
        var_0 thread animscripts\utility::updateanimpose();
        return;
    }

    var_0.forceaimtorwardsenemy = 1;
    thread orientmodehack_axis( var_0 );
    whackamole_off( var_0 );

    for (;;)
    {
        while ( self.whackamolecount > 2 )
            wait 0.05;

        whackamole_on( var_0 );
        wait(randomfloatrange( 3, 7 ));
        whackamole_off( var_0 );
        wait(randomfloatrange( 3, 5 ));
    }
}

whackamole_on( var_0 )
{
    var_0.whackamole_on = 1;
    var_0.desired_anim_pose = "stand";
    var_0 allowedstances( "stand" );
    var_0.ignoreall = 0;
    var_0 thread animscripts\utility::updateanimpose();
    self.whackamolecount++;
}

whackamole_off( var_0 )
{
    self endon( "death" );
    var_0 endon( "death" );
    var_0.whackamole_on = 0;
    var_0.desired_anim_pose = "crouch";
    var_0.ignoreall = 1;
    var_0 allowedstances( "crouch" );
    var_0 thread animscripts\utility::updateanimpose();
    var_0.bulletsinclip = 0;
    self.whackamolecount--;
}

whackamole_death( var_0 )
{
    if ( var_0.team == "allies" )
        return;

    self.whackamoleguys[self.whackamoleguys.size] = var_0;
    self endon( "death" );
    var_0 waittill( "death" );
    thread whackamole_dialog();
    self.whackamoleguys = common_scripts\utility::array_remove( self.whackamoleguys, var_0 );
    self.whackamolecount--;

    if ( !isdefined( var_0 ) )
        return;

    var_0 waittillmatch( "deathanim", "start_ragdoll" );

    if ( getdvar( "ragdoll_enable" ) != "0" )
        thread dropspeedbump( var_0.origin, self );
    else
        var_0 delete();
}

whackamole_dialog()
{
    if ( !isdefined( level.whackamole_lastspeak ) )
        level.whackamole_lastspeak = gettime() + 3005;

    if ( gettime() < level.whackamole_lastspeak + 10000 )
        return;

    level.whackamole_lastspeak = gettime();
}

dialog_killconfirm()
{
    var_0 = [];
    var_0[var_0.size] = "jeepride_grg_killfirm";
    var_0[var_0.size] = "jeepride_grg_niceshootin";
    var_0[var_0.size] = "jeepride_grg_success";
    var_0[var_0.size] = "jeepride_grg_thatsahit";
    var_0[var_0.size] = "jeepride_grg_devastation";

    for ( var_1 = 0; var_1 < var_0.size; var_1++ )
    {
        level waittill( "kill_confirm" );
        level.griggs maps\_anim::anim_single_queue( level.griggs, var_0[var_1] );
    }
}

ghetto_tag()
{
    if ( !isdefined( level.ghettotag ) )
        level.ghettotag = [];

    var_0 = getent( self.target, "targetname" );

    if ( !isdefined( level.ghettotag[var_0.model] ) )
        level.ghettotag[var_0.model] = [];

    level.ghettotag[var_0.model][level.ghettotag[var_0.model].size] = maps\_vehicle_code::ghetto_tag_create( var_0 );
}

trigger_sparks_on()
{
    for (;;)
    {
        self waittill( "trigger", var_0 );
        var_0 thread maps\jeepride_fx::apply_ghettotag();
    }
}

trigger_sparks_off()
{
    for (;;)
    {
        self waittill( "trigger", var_0 );
        var_0 thread maps\jeepride_fx::remove_ghettotag();
    }
}

attack_dummy_path()
{
    var_0 = setup_throwchain_dummy_path( self );
    var_1 = 0;

    if ( isdefined( self.script_delay ) )
        var_1 = self.script_delay;

    var_2 = getent( self.script_linkto, "script_linkname" );
    var_2 waittill( "trigger", var_3 );
    var_4 = spawn( "script_model", var_0[0].origin );
    var_4 setmodel( "fx" );

    if ( getdvar( "jeepride_showhelitargets" ) == "off" )
        var_4 hide();

    var_4 notsolid();
    var_4.oldmissiletype = 0;
    var_3 endon( "gunner_new_target" );
    var_3 endon( "death" );
    var_3 clearlookatent();
    var_3 setlookatent( var_4 );
    var_3 thread shootenemytarget( var_4, var_1 );
    ghetto_animate_through_chain( var_0, var_4, 500, 1 );
    var_3 clearlookatent();
    var_4 delete();
}

guardrail_think()
{
    self setcandamage( 1 );
    self waittill( "damage", var_0, var_1, var_2 );
    self physicslaunchclient( self.origin, 0, 0, 0 );
}

rpgers_to_dummy( var_0 )
{
    if ( !isdefined( self.rocketmen ) )
        return;

    for ( var_1 = 0; var_1 < self.rocketmen.size; var_1++ )
    {
        var_2 = maps\_vehicle_aianim::anim_pos( self, self.rocketmen[var_1].rocketattachpos );
        self.rocketmen[var_1] linkto( self.truckjunk[0], "polySurface1", ( 0.0, 0.0, 0.0 ), ( 0.0, 0.0, 0.0 ) );
    }
}

ai_rpg_tunnel_stop()
{
    self waittill( "trigger" );
    level endon( "bridge_zakhaev_setup" );
    var_0 = getaiarray( "allies", "neutral" );

    while ( level.player istouching( self ) )
    {
        foreach ( var_2 in var_0 )
        {
            if ( isdefined( var_2.hindenemy ) )
                var_2.hindenemy = undefined;
        }

        wait 0.5;
    }
}

falling_bridge_price()
{
    var_0 = level.price;
    var_0 _meth_856F( 0 );
    wait 15;
    var_0 _meth_856E();
}

fliptruck_ghettoanimate()
{
    var_0 = setup_throwchain( self );
    var_1 = getvehiclenode( self.script_linkto, "script_linkname" );
    var_2 = getvehiclenode( var_1.targetname, "target" );
    var_2 waittill( "trigger", var_3 );
    var_4 = gettime();
    var_5 = var_3.origin;
    var_1 waittill( "trigger", var_3 );
    var_6 = ( gettime() - var_4 ) / 1000;
    var_7 = distance( var_5, var_3.origin );
    var_8 = var_7 / var_6;
    var_9 = var_3 maps\_vehicle::vehicle_to_dummy();

    if ( var_3 == level.playersride )
    {
        level.player unlink();
        level.player playerlinktodelta( level.playerlinkmodel, "polySurface1", level.playerlinkinfluence );
    }

    if ( isdefined( level.fxplay_model ) )
        var_3 thread junk_throw();

    var_9 notsolid();
    var_3 maps\_vehicle_code::vehicle_dummy_add_collison();
    var_3 vehicle_removebrushmodelcollision();

    if ( animated_crash( var_9, var_8, var_3 ) )
        return;

    vehicle_killthrow_all_guys( var_3 );
    waittillframeend;
    var_3 ghetto_animate_through_chain( var_0, var_9, var_8 );
    var_9 maps\jeepride_fx::remove_ghettotag();
}

jeepride_custom_vehicle_to_dummy( var_0, var_1 )
{
    var_0.owner = self;
    rpgers_to_dummy( var_0 );
    self notify( "kill_treads_forever" );
    maps\jeepride_fx::transfer_ghettotag_to( var_0, undefined, var_1 );

    if ( self.vehicletype == "bm21_troops" )
    {
        self notify( "stop_tire_deflate" );
        var_0 thread kill_all_guys_on_animend();
    }
}

vehicle_killthrow_all_guys( var_0 )
{
    if ( !isdefined( var_0 ) )
        return;

    if ( isdefined( var_0.riders ) )
        common_scripts\utility::array_thread( var_0.riders, ::killthrow );

    if ( isdefined( var_0.whackamoleguys ) )
        common_scripts\utility::array_thread( var_0.whackamoleguys, ::killthrow );

    if ( isdefined( var_0.magic_missile_guy ) )
        var_0.magic_missile_guy thread killthrow();
}

kill_all_guys_on_animend()
{
    if ( !isdefined( self.owner ) )
        return;

    self.owner endon( "death" );
    self endon( "death" );
    self endon( "notetrack_killed_all_guys" );
    self waittillmatch( "single anim", "end" );
    vehicle_killthrow_all_guys( self.owner );
}

anim_throw_junk_and_kill_all_guys( var_0 )
{
    if ( !isdefined( var_0.owner ) )
        return;

    var_0.owner thread junk_throw();
    var_0 notify( "notetrack_killed_all_guys" );
    vehicle_killthrow_all_guys( var_0.owner );
}

anim_spark_on( var_0 )
{
    var_0 thread maps\jeepride_fx::apply_ghettotag();
}

anim_spark_off( var_0 )
{
    var_0 thread maps\jeepride_fx::remove_ghettotag();
}

show_ghetto_tags()
{
    for ( var_0 = 0; var_0 < self.ghettotags.size; var_0++ )
        self.ghettotags[var_0] show();
}

animated_crash( var_0, var_1, var_2 )
{
    if ( !isdefined( self.script_parameters ) || !isdefined( level.jeepride_crash_anim ) || !isdefined( level.jeepride_crash_anim[self.script_parameters] ) )
        return 0;

    var_3 = undefined;
    var_4 = isdefined( var_2.ghettotags ) && var_2.ghettotags.size > 0;

    if ( isdefined( level.jeepride_crash_model[self.script_parameters] ) )
    {
        var_5 = var_0.angles;
        var_6 = var_0.origin;
        var_7 = var_0.model;
        var_0 hide();
        var_8 = var_0;
        var_0 = spawn( "script_model", var_6 );
        var_0.angles = var_5;
        var_0 setmodel( level.jeepride_crash_model[self.script_parameters] );
        var_3 = spawn( "script_model", var_0.origin );
        var_3 setmodel( "tag_origin" );
        var_3.angles = var_0 gettagangles( "body_animate_jnt" );
        var_3.origin = var_0 gettagorigin( "body_animate_jnt" );
        var_3 dontinterpolate();
        var_3 notsolid();
        var_3 linkto( var_0, "body_animate_jnt", ( 0.0, 0.0, 0.0 ), ( 0.0, 0.0, 0.0 ) );
        var_0 useanimtree( level.jeepride_crash_animtree[self.script_parameters] );
        var_8 thread maps\jeepride_fx::transfer_ghettotag_to( var_3, var_7, "tag_origin" );
    }

    var_2 maps\_vehicle::move_riders_here( var_0 );
    var_2.riders = undefined;
    var_2 hide();
    var_0 movewithrate( self.origin, self.angles, var_1 );
    var_9 = "crashanim";
    var_0 thread animated_crashtracks( var_9 );
    var_0 animscripted( var_9, self.origin, self.angles, level.jeepride_crash_anim[self.script_parameters] );
    var_0 waittillmatch( var_9, "end" );
    var_2 delete();
    var_10 = common_scripts\utility::ter_op( isdefined( var_3 ), var_3, var_0 );
    var_10 maps\jeepride_fx::remove_ghettotag();
    return 1;
}

animated_crashtracks( var_0 )
{
    var_1 = [];
    var_1["slide"] = ::crashtrack_note_slide;
    var_1["breakwall"] = ::crashtrack_note_breakwall;
    var_1["splash"] = ::crashtrack_note_splash;

    for (;;)
    {
        self waittill( var_0, var_2 );

        if ( isdefined( var_1[var_2] ) )
            [[ var_1[var_2] ]]();

        if ( var_2 == "end" )
            break;
    }
}

crashtrack_note_slide()
{
    self playsound( "vehicle_skid_long" );
}

crashtrack_note_breakwall()
{

}

crashtrack_note_splash()
{

}

fire_missile( var_0, var_1, var_2, var_3 )
{
    self endon( "death" );
    self endon( "gunner_new_target" );

    if ( level.lock_on_player )
        var_2 = level.lock_on_player_ent;

    var_2 endon( "death" );

    if ( !isdefined( var_1 ) )
        var_1 = 1;

    if ( self.vehicletype == "hind" )
    {
        var_4[0] = "tag_missile_left";
        var_4[1] = "tag_missile_right";
    }
    else
    {
        var_4[0] = "tag_store_L_2_a";
        var_4[1] = "tag_store_R_2_a";
        var_4[2] = "tag_store_L_2_b";
        var_4[3] = "tag_store_R_2_b";
        var_4[4] = "tag_store_L_2_c";
        var_4[5] = "tag_store_R_2_c";
        var_4[6] = "tag_store_L_2_d";
        var_4[7] = "tag_store_R_2_d";
    }

    var_5 = weaponfiretime( var_0 );
    self setvehweapon( var_0 );
    var_6 = -1;
    var_7 = var_2;

    for ( var_8 = 0; var_8 < var_1; var_8++ )
    {
        if ( level.lock_on_player )
            var_2 = level.lock_on_player_ent;
        else
            var_2 = var_7;

        var_6++;

        if ( var_6 >= var_4.size )
            var_6 = 0;

        var_9 = self fireweapon( var_4[var_6] );

        if ( !isdefined( var_9 ) )
            continue;

        if ( var_0 == "crash_missile_jeepride" )
        {
            level notify( "missile_tracker", var_9 );
            var_9 thread maps\jeepride::blown_bridge( var_2 );
            thread maps\_utility::play_sound_on_tag( "scn_bridge_weap_hind_rocket_fire", var_4[var_6] );
        }

        if ( isdefined( var_2.vehicletype ) && var_2.vehicletype == "hind" )
            var_9 missile_settargetent( var_2, ( 0.0, 0.0, -56.0 ) );
        else if ( var_2.oldmissiletype )
            var_9 missile_settargetent( var_2, ( 80.0, 20.0, -200.0 ) );
        else
            var_9 missile_settargetent( var_2 );

        if ( var_8 < var_1 - 1 )
            wait(var_5);

        if ( isdefined( var_3 ) )
            wait(var_3);
    }
}

script_playerlink_org()
{
    if ( isdefined( level.player.script_linker_model ) )
        return level.player.script_linker_model;

    level.player.script_linker_model = spawn( "script_model", level.player.origin );
    level.player.script_linker_model setmodel( "axis" );
    return level.player.script_linker_model;
}

view_turn( var_0, var_1 )
{
    var_1 = 1;
    var_2 = script_playerlink_org();
    var_2.angles = level.player getplayerangles();
    var_3 = spawn( "script_origin", level.player.origin );
    var_3.origin = level.player geteye();
    var_3.angles = level.player getplayerangles();
    level.player playerlinktoabsolute( var_2, "polySurface1" );
    var_4 = vectortoangles( vectornormalize( var_0 - var_3.origin ) );
    var_5 = 0.5;
    var_2 rotateto( var_4, var_5, 0.2, 0.2 );
}

delaythread_loc( var_0, var_1, var_2, var_3, var_4, var_5 )
{
    var_0 *= 1000;

    if ( level.startdelay != 0 && level.startdelay > var_0 )
        return;

    while ( gettime() + level.startdelay < var_0 )
        wait 0.05;

    if ( isdefined( var_5 ) )
        thread [[ var_1 ]]( var_2, var_3, var_4, var_5 );
    else if ( isdefined( var_4 ) )
        thread [[ var_1 ]]( var_2, var_3, var_4 );
    else if ( isdefined( var_3 ) )
        thread [[ var_1 ]]( var_2, var_3 );
    else if ( isdefined( var_2 ) )
        thread [[ var_1 ]]( var_2 );
    else
        thread [[ var_1 ]]();
}

twobuttonspressed( var_0, var_1 )
{
    return level.player buttonpressed( var_0 ) && level.player buttonpressed( var_1 );
}

jeepride_start_dumphandle()
{
    var_0 = "h";
    var_1 = "CTRL";

    for (;;)
    {
        while ( !twobuttonspressed( var_0, var_1 ) )
            wait 0.05;

        while ( !jeepride_start_dump() )
            wait 0.05;

        while ( twobuttonspressed( var_0, var_1 ) )
            wait 0.05;
    }
}

get_vehicles_with_spawners()
{
    var_0 = maps\_vehicle::get_script_vehicles();
    var_1 = [];

    for ( var_2 = 0; var_2 < var_0.size; var_2++ )
    {
        if ( isdefined( var_0[var_2].unique_id ) && isdefined( var_0[var_2].currentnode ) )
            var_1[var_1.size] = var_0[var_2];
    }

    return var_1;
}

jeepride_start_dump( var_0 )
{
    if ( !isdefined( var_0 ) )
        var_0 = "wip";

    var_1 = [];
    iprintlnbold( "start: " + var_0 + " dumped!" );
    return 1;
}

origintostring( var_0 )
{
    var_1 = "" + var_0[0] + " " + var_0[1] + " " + var_0[2] + "";
    return var_1;
}

sync_vehicle()
{
    var_0 = level.vehicle_spawners[self.unique_id];
    var_1 = self;
    var_2 = getvehiclenode( self.target, "targetname" );
    var_3 = maps\_vehicle::vehicle_spawn( var_0 );
    var_3 notify( "newpath" );
    var_3.origin = self.origin + ( 0.0, 0.0, 555.0 );
    var_3.angles = self.angles;
    var_3 attachpath( var_1 );
    var_3 startpath();

    if ( isdefined( var_1.script_ghettotag ) )
        var_3 maps\jeepride_fx::apply_ghettotag();

    if ( isdefined( var_1.script_delay ) )
        level.startdelay = var_1.script_delay;

    var_4 = getvehiclenode( var_2.script_noteworthy, "targetname" );
    var_3 setswitchnode( var_2, var_4 );
    var_3.attachedpath = var_4;
    var_3 thread maps\_vehicle::vehicle_paths();
}

hillbump()
{
    self waittill( "trigger", var_0 );
    var_0 notify( "newjolt" );
    var_0 endon( "newjolt" );
    var_0 endon( "death" );

    if ( common_scripts\utility::flag( "slam_zoom_done" ) )
    {
        level.playersride playrumbleonentity( "tank_rumble" );
        thread common_scripts\utility::play_sound_in_space( "jeepride_grassride_thud", level.player.origin, 1 );
    }

    for ( var_1 = 0; var_1 < 6; var_1++ )
    {
        if ( !common_scripts\utility::flag( "slam_zoom_done" ) )
        {
            wait(0.2 + randomfloat( 0.2 ));
            continue;
        }

        var_0 joltbody( var_0.origin + ( 23.0, 33.0, 64.0 ), 0.6 );

        if ( var_0 == level.playersride )
            earthquake( 0.15, 1, level.player.origin, 1000 );

        wait(0.2 + randomfloat( 0.2 ));
        thread common_scripts\utility::play_sound_in_space( "jeepride_grassride_through", level.player.origin, 1 );
    }
}

bridge_uaz_crash()
{
    var_0 = getvehiclenode( "bridge_uaz_crash", "script_noteworthy" );
    var_0 waittill( "trigger", var_1 );
    var_1 joltbody( var_1.origin + maps\_utility::vector_multiply( anglestoforward( var_1.angles ), 48 ), 16 );
    thread common_scripts\utility::play_sound_in_space( "jeepride_sideswipe", var_1.origin, 1 );
    earthquake( 0.35, 0.3, var_1.origin, 2500 );
    exploder_loc( "14004" );
}

sideswipe()
{
    self waittill( "trigger", var_0 );
    var_0 notify( "newjolt" );
    level.playersride notify( "newjolt" );
    var_0 endon( "newjolt" );
    level.playersride endon( "newjolt" );
    var_0 joltbody( level.playersride.origin + ( 0.0, 0.0, 64.0 ), 16 );
    level.playersride joltbody( var_0.origin + ( 0.0, 0.0, 64.0 ), 16 );
    var_1 = distance( var_0.origin, level.playersride.origin );
    var_2 = maps\_utility::vector_multiply( vectornormalize( var_0.origin - level.playersride.origin ), var_1 / 2 ) + level.playersride.origin + ( 0.0, 0.0, 48.0 );
    level.playersride maps\_utility::play_sound_on_entity( "jeepride_sideswipe" );
    earthquake( 0.45, 1, level.player.origin, 1000 );
    level.player playrumbleonentity( "tank_rumble" );
}

jolter()
{
    self waittill( "trigger", var_0 );
    var_0 joltbody( self.origin + ( 32.0, 32.0, 64.0 ), 3.5 );
}

deleteme()
{
    self delete();
}

speedbumps_setup()
{
    level.speedbumpcurrent = 0;
    level.speedbumps = getentarray( "speedbump", "targetname" );
}

dropspeedbump( var_0, var_1 )
{
    if ( common_scripts\utility::flag( "end_ride" ) )
        return;

    level.speedbumpcurrent++;

    if ( level.speedbumpcurrent >= level.speedbumps.size )
        level.speedbumpcurrent = 0;

    var_2 = bullettrace( var_0 + ( 0.0, 0.0, -32.0 ), var_0 + ( 0.0, 0.0, -100000.0 ), 0, var_1 )["position"];
    wait 0.5;
    level.speedbumps[level.speedbumpcurrent].origin = var_2 + ( 0.0, 0.0, 4.0 );
}

ragdollragdollragdollragdollragdollragdoll()
{
    if ( getdvar( "ragdoll_enable" ) == "0" )
    {
        self delete();
        return;
    }

    self endon( "death" );
    var_0 = gettime() + 10000;

    while ( isdefined( self ) && gettime() < var_0 )
    {
        wait 0.05;
        self startragdoll();
    }

    if ( isdefined( self ) )
        self delete();
}

fx_wait_set( var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7 )
{
    _fx_wait_set( var_0, var_1, var_2, var_3 );
    _fx_wait_set( var_4, var_5, var_6, var_7 );
}

_fx_wait_set( var_0, var_1, var_2, var_3 )
{
    var_4 = "polySurface1";

    if ( var_0 < level.startdelay )
        return;

    while ( gettime() + level.startdelay < var_0 )
        wait 0.05;

    setfxplayer();
    level.fxplay_model.origin = var_1;
    level.fxplay_model.angles = var_2;
    playfxontag( level._effect[var_3], level.fxplay_model, var_4 );
}

createfxplayers( var_0 )
{
    level.fxplay_model_array = [];
    level.fxplay_index = 0;
    level.fxplay_indexmax = var_0;

    for ( var_1 = 0; var_1 < var_0; var_1++ )
    {
        var_2 = spawn( "script_model", ( 0.0, 0.0, 0.0 ) );
        var_2 setmodel( "axis" );
        var_2 hide();
        level.fxplay_model_array[var_1] = var_2;
    }

    return setfxplayer();
}

setfxplayer()
{
    level.fxplay_model = level.fxplay_model_array[level.fxplay_index];
    level.fxplay_index++;

    if ( level.fxplay_index >= level.fxplay_indexmax )
        level.fxplay_index = 0;
}

exploder_hack()
{
    if ( !isdefined( self.target ) )
        return;

    var_0 = self.script_exploder;
    var_1 = undefined;
    var_2 = getentarray( self.target, "targetname" );

    for ( var_3 = 0; var_3 < var_2.size; var_3++ )
    {
        if ( var_2[var_3].classname == "trigger_damage" )
            var_1 = var_2[var_3];

        break;
    }

    if ( !isdefined( var_1 ) )
        return;

    var_1 thread exploder_damager_trigger_by_hind();
    var_1 waittill( "trigger" );
    exploder_loc( var_0 );
}

exploder_damager_trigger_by_hind()
{
    self endon( "trigger" );

    for (;;)
    {
        self waittill( "damage", var_0, var_1 );

        if ( !isdefined( var_1 ) )
            continue;

        if ( isdefined( var_1.vehicletype ) && var_1.vehicletype == "hind" )
            self notify( "trigger" );
    }
}

exploder_loc( var_0, var_1 )
{
    if ( isdefined( var_1 ) && var_1 )
        level.exploder_fast[var_0] = 1;

    level notify( "exploded_" + var_0 );
    common_scripts\_exploder::exploder( var_0 );
}

exploder_animate()
{
    if ( !isdefined( self.target ) )
        return;

    var_0 = self.script_exploder;

    if ( !isdefined( var_0 ) )
        var_0 = self.script_prefab_exploder;

    exploder_linktargets();
    var_1 = common_scripts\utility::getstruct( self.target, "targetname" );

    if ( !isdefined( var_1 ) )
        return;

    self.target = undefined;
    var_2 = setup_throwchain( var_1 );
    level waittill( "exploded_" + var_0 );
    var_3 = spawn( "script_model", var_1.origin );
    var_3.angles = var_1.angles;
    self linkto( var_3 );
    exploder_showlinks();

    if ( isdefined( self.is_end_tanker ) )
        thread exploder_tankersparker_links();

    var_4 = 0;

    if ( isdefined( level.exploder_fast[var_0] ) && level.exploder_fast[var_0] )
        var_4 = 1;

    if ( isdefined( self.script_noteworthy ) && self.script_noteworthy == "movekiller" )
        thread enable_move_killer();

    ghetto_animate_through_chain( var_2, var_3, undefined, undefined, var_4 );
    disable_move_killer();
}

exploder_tankersparker_links()
{
    var_0 = [];

    for ( var_1 = 0; var_1 < self.linkedtargets.size; var_1++ )
    {
        if ( self.linkedtargets[var_1].model == "axis" )
            var_0[var_0.size] = self.linkedtargets[var_1];
    }

    var_2 = self.origin;
    wait 9;
    var_3 = 7;

    for ( var_4 = 0; var_2 != self.origin; var_0 = common_scripts\utility::array_randomize( var_0 ) )
    {
        for ( var_1 = 0; var_1 < var_0.size; var_1++ )
        {
            var_2 = self.origin;
            playfxontag( level._effect["tanker_sparker"], var_0[var_1], "polySurface1" );
            var_4++;

            if ( var_4 == var_3 )
            {
                var_4 = 0;
                wait 0.05;

                if ( var_2 != self.origin )
                    break;
            }
        }
    }
}

disable_move_killer()
{
    self notify( "stop_move_killer" );
}

enable_move_killer()
{
    self endon( "stop_move_killer" );

    for (;;)
    {
        if ( level.player istouching( self ) )
        {
            level.player enablehealthshield( 0 );
            radiusdamage( level.player.origin, 8, level.player.health + 5, level.player.health + 5 );
            level.player enablehealthshield( 1 );
        }

        wait 0.05;
    }
}

exploder_showlinks()
{
    if ( !self.linkedtargets.size )
        return;

    for ( var_0 = 0; var_0 < self.linkedtargets.size; var_0++ )
    {
        if ( isdefined( self.linkedtargets[var_0].script_noteworthy ) && self.linkedtargets[var_0].script_noteworthy == "tanker_sparkers" )
        {
            self.is_end_tanker = 1;
            continue;
        }
        else if ( self.linkedtargets[var_0].model == "axis" )
            continue;

        if ( self.model == "axis" )
            continue;

        self.linkedtargets[var_0] show();
    }
}

exploder_linktargets()
{
    var_0 = getentarray( self.target, "targetname" );

    for ( var_1 = 0; var_1 < var_0.size; var_1++ )
    {
        if ( var_0[var_1].classname != "script_model" )
            continue;

        var_0[var_1] linkto( self );
        var_0[var_1] hide();
    }

    self.linkedtargets = var_0;
}

smokey_transition( var_0, var_1, var_2 )
{
    var_3 = 100;
    var_4 = 2;
    var_5 = 1;
    var_6 = ( var_4 - 1 ) / 2 * var_3 * -1;

    for ( var_7 = 0; var_7 < var_4; var_7++ )
    {
        for ( var_8 = 0; var_8 < var_4; var_8++ )
        {
            var_9 = var_6 + var_7 * var_3;
            var_10 = var_6 + var_8 * var_3;
            thread smoke_transition_elem( var_9, var_10, var_0, var_1, var_2, 1, var_5 );
            var_5++;
        }
    }

    var_3 = 90;
    var_4 = 3;
    var_6 = ( var_4 - 1 ) / 2 * var_3 * -1;

    for ( var_7 = 0; var_7 < var_4; var_7++ )
    {
        for ( var_8 = 0; var_8 < var_4; var_8++ )
        {
            var_9 = var_6 + var_7 * var_3;
            var_10 = var_6 + var_8 * var_3;
            thread smoke_transition_elem( var_9, var_10, var_0, var_1, var_2, randomfloatrange( 0.1, 0.8 ), var_5 );
            var_5++;
        }
    }
}

smoke_transition_elem( var_0, var_1, var_2, var_3, var_4, var_5, var_6 )
{
    var_7 = newhudelem();
    var_7.sort = var_6;
    var_7.x = var_0;
    var_7.y = var_1;
    var_8 = 1;
    var_9 = 1;

    if ( var_7.x > 0 )
        var_8 = -1;

    if ( var_7.y > 0 )
        var_9 = -1;

    var_10 = randomintrange( 200, 1200 ) * var_8;
    var_11 = randomint( 200, 1200 ) * var_9;
    var_12 = randomfloatrange( 2, 4 );
    var_13 = randomintrange( 400, 1000 );
    var_7 setshader( "jeepride_smoke_transition_overlay", var_13, var_13 );
    var_7.alignx = "center";
    var_7.aligny = "middle";
    var_7.horzalign = "center";
    var_7.vertalign = "middle";
    var_7.alpha = 0;
    var_7.foreground = 1;
    var_7 moveovertime( var_2 + var_3 + var_4 );
    var_7.x += var_10;
    var_7.y += var_11;
    var_14 = randomfloatrange( 4, 6 );
    var_13 = int( var_13 * var_14 );

    if ( var_13 > 1000 )
        var_13 = 1000;

    var_7 scaleovertime( var_2 + var_3 + var_4, var_13, var_13 );
    var_7 fadeovertime( var_2 );
    var_7.alpha = var_5;
    wait(var_2 + var_4);
    var_7 fadeovertime( var_3 );
    var_7.alpha = 0;
    wait(var_3);
    var_7 destroy();
}

setup_throwchain_dummy_path( var_0 )
{
    var_1 = 0;
    var_2 = [];
    var_3 = [];

    while ( isdefined( var_0 ) )
    {
        var_3[var_1] = var_0;
        var_2[var_1] = var_0;
        var_1++;

        if ( isdefined( var_0.target ) )
        {
            var_0 = common_scripts\utility::getstructarray( var_0.target, "targetname" )[0];
            continue;
        }

        break;
    }

    for ( var_4 = 0; var_4 < var_2.size; var_4++ )
        var_2[var_4] setup_throwchain_dummy_path_clearjunkvars();

    return var_2;
}

setup_throwchain_dummy_path_clearjunkvars()
{
    self.angles = undefined;
    self.model = undefined;
}

setup_throwchain( var_0 )
{
    var_1 = 0;
    var_2 = [];
    var_3 = [];

    while ( isdefined( var_0 ) )
    {
        if ( !isdefined( var_0.angles ) )
            var_0.angles = ( 0.0, 0.0, 0.0 );

        var_3[var_1] = var_0;
        var_2[var_1] = var_0;
        var_1++;

        if ( isdefined( var_0.target ) )
        {
            var_0 = common_scripts\utility::getstructarray( var_0.target, "targetname" )[0];
            continue;
        }

        break;
    }

    for ( var_4 = 0; var_4 < var_2.size; var_4++ )
        var_2[var_4] setup_throwchain_clearjunkvars();

    return var_2;
}

setup_throwchain_clearjunkvars()
{
    self.model = undefined;
}

ghetto_animate_through_chain( var_0, var_1, var_2, var_3, var_4 )
{
    if ( !isdefined( var_4 ) )
        var_4 = 0;

    if ( !isdefined( var_3 ) )
        var_3 = 0;

    var_1 endon( "death" );

    if ( !isdefined( var_2 ) )
        var_2 = 500;

    var_5 = 0;

    if ( var_4 )
        var_3 = 1;

    var_1.linkedobject = self;

    for ( var_6 = 0; var_6 < var_0.size - 1; var_6++ )
    {
        var_7 = 0;
        var_8 = 0;
        var_9 = var_0[var_6];
        var_10 = var_0[var_6 + 1];
        var_11 = 0;

        if ( isdefined( var_9.speed ) )
            var_2 = var_9.speed;

        var_12 = var_2;

        if ( isdefined( var_9.script_attackmetype ) )
            var_1.script_attackmetype = var_9.script_attackmetype;
        else
            var_1.script_attackmetype = undefined;

        if ( isdefined( var_9.offshoot_ent ) )
            var_1.offshoot_ent = var_9.offshoot_ent;

        if ( isdefined( var_9.script_shotcount ) )
            var_1.script_shotcount = var_9.script_shotcount;

        if ( isdefined( var_9.script_exploder ) )
            thread exploder_loc( var_9.script_exploder );
        else if ( isdefined( var_9.script_prefab_exploder ) )
            thread exploder_loc( var_9.script_prefab_exploder );

        if ( isdefined( var_9.script_parameters ) && var_9.script_parameters == "badplace" )
        {
            if ( !isdefined( var_9.radius ) )
                var_9.radius = 600;

            badplace_cylinder( "dummypath_badplace", 1, var_9.origin, var_9.radius, 512, "allies", "axis" );
        }

        if ( isdefined( var_9.script_flag_wait ) )
            common_scripts\utility::flag_wait( var_9.script_flag_wait );

        if ( !var_3 )
        {
            if ( isdefined( var_9.script_delay ) )
                wait(var_9.script_delay);
        }

        if ( isdefined( var_9.script_sound ) )
        {
            if ( isdefined( var_9.script_parameters ) && var_9.script_parameters == "in_space" )
                var_1 thread common_scripts\utility::play_sound_in_space( var_9.script_sound, var_9.origin );
            else
                var_1 thread maps\_utility::play_sound_on_entity( var_9.script_sound );
        }

        if ( isdefined( var_9.script_noteworthy ) )
        {
            if ( var_9.script_noteworthy == "gravity" )
                var_5 = 1;
        }

        if ( var_1.model == "vehicle_uaz_open_for_ride" && var_6 == 0 )
            var_1 thread ride_smoker();

        if ( isdefined( var_9.script_accel_fraction ) )
            var_7 = var_9.script_accel_fraction;

        if ( isdefined( var_9.script_decel_fraction ) )
            var_8 = var_9.script_decel_fraction;

        var_13 = ( 0.0, 0.0, 0.0 );

        if ( isdefined( var_10.angles ) )
            var_13 = var_10.angles;

        if ( var_4 )
        {
            var_1.origin = var_10.origin;
            var_1.angles = var_13;
        }
        else
            var_1 movewithrate( var_10.origin, var_13, var_2, var_12, var_5, var_7, var_8 );

        if ( isdefined( var_10.script_disconnectpaths ) )
            script_disconnectpaths( var_10.script_disconnectpaths );

        if ( isdefined( var_10.script_noteworthy ) )
        {
            level notify( var_10.script_noteworthy );

            if ( var_10.script_noteworthy == "delete" )
            {
                self delete();
                return;
            }
        }

        if ( isdefined( var_10.script_flag_set ) )
            common_scripts\utility::flag_set( var_10.script_flag_set );
    }
}

script_disconnectpaths( var_0 )
{
    if ( self.classname == "script_model" )
        return;

    if ( var_0 )
    {
        self connectpaths();
        self disconnectpaths();
    }
    else
        self connectpaths();
}

bridge_bumper()
{
    var_0 = spawn( "script_origin", level.player.origin );
    var_0 linkto( level.player );

    for (;;)
    {
        level waittill( "bridge_bump" );
        var_0 playrumbleonentity( "jeepride_bridgesink" );
        earthquake( 0.25, 1, level.player.origin, 1000 );
    }
}

_notsolid()
{
    if ( isdefined( self ) )
        self notsolid();
}

movewithrate( var_0, var_1, var_2, var_3, var_4, var_5, var_6 )
{
    self notify( "newmove" );
    self endon( "newmove" );

    if ( !isdefined( var_4 ) )
        var_4 = 0;

    if ( !isdefined( var_5 ) )
        var_5 = 0;

    if ( !isdefined( var_6 ) )
        var_6 = 0;

    if ( !isdefined( var_3 ) )
        var_3 = var_2;

    self.movefinished = 0;

    if ( !isdefined( var_2 ) )
        var_2 = 200;

    var_7 = distance( self.origin, var_0 );
    var_8 = var_7 / var_2;
    var_9 = vectornormalize( var_0 - self.origin );
    var_10 = 0;
    var_11 = 0;

    if ( var_5 > 0 )
        var_10 = var_8 * var_5;

    if ( var_6 > 0 )
        var_11 = var_8 * var_6;

    if ( var_4 )
    {
        self movegravity( self.velocity, var_8 );
        self rotateto( var_1, var_8, var_10, var_11 );

        if ( isdefined( self.linkedobject.linkedtargets ) )
            common_scripts\utility::array_thread( self.linkedobject.linkedtargets, ::_notsolid );

        while ( self.origin[2] > var_0[2] + 512 )
            wait 0.05;

        for (;;)
        {
            var_12 = self.origin;
            wait 0.05;
            var_13 = bullettrace( var_12, self.origin, 0, self.linkedobject );

            if ( isdefined( var_13["entity"] ) )
                continue;

            if ( var_13["fraction"] != 1 )
                break;
        }

        if ( isdefined( self.linkedobject.linkedtargets ) )
        {
            foreach ( var_15 in self.linkedobject.linkedtargets )
            {
                if ( isdefined( var_15 ) )
                    var_15 deleteme();
            }
        }

        self moveto( self.origin + ( 0.0, 0.0, 24.0 ), 0.5, 0, 0 );
        self rotateto( var_1, 0.5, 0, 0 );
    }
    else
    {
        self moveto( var_0, var_8, var_10, var_11 );
        self rotateto( var_1, var_8, var_10, var_11 );
        wait(var_8);
    }

    if ( !isdefined( self ) )
        return;

    self.velocity = maps\_utility::vector_multiply( var_9, var_7 / var_8 );
    self.movefinished = 1;
}

clear_all_vehicles_but_heros_and_hind()
{
    level notify( "clear_all_vehicles_but_heros" );
    var_0 = maps\_vehicle::get_script_vehicles();
    var_1 = [];

    for ( var_2 = 0; var_2 < var_0.size; var_2++ )
    {
        if ( var_0[var_2].vehicletype == "hind" )
        {
            self notify( "gunner_new_target" );
            continue;
        }

        var_3 = var_0[var_2].riders;
        var_1 = [];

        for ( var_4 = 0; var_4 < var_3.size; var_4++ )
        {
            if ( var_3[var_4] ishero() )
            {
                var_1[var_1.size] = var_3[var_4];
                continue;
            }

            if ( isdefined( var_3[var_4].magic_bullet_shield ) && var_3[var_4].magic_bullet_shield )
                var_3[var_4] maps\_utility::stop_magic_bullet_shield();

            var_3[var_4] delete();
        }

        for ( var_4 = 0; var_4 < var_1.size; var_4++ )
            guy_force_remove_from_vehicle( var_0[var_2], var_1[var_4] );

        var_0[var_2] vehicle_clear_truckjunk();
        var_0[var_2] delete();
    }
}

vehicle_clear_truckjunk()
{
    var_0 = self.truckjunk;

    if ( isdefined( self.jeepride_linked_weapon ) )
        self.jeepride_linked_weapon delete();

    if ( !isdefined( var_0 ) )
        return;

    common_scripts\utility::array_thread( self.truckjunk, ::deleteme );
}

guy_force_remove_from_vehicle( var_0, var_1, var_2 )
{
    var_0 notify( "forcedremoval" );
    var_0.riders = common_scripts\utility::array_remove( var_0.riders, var_1 );
    var_0.usedpositions[var_1.vehicle_position] = 0;
    var_1 notify( "jumpedout" );
    var_1 notify( "newanim" );

    if ( isai( var_1 ) )
        var_1 allowedstances( "stand", "crouch", "prone" );

    var_1.ridingvehicle = undefined;
    var_1.drivingvehicle = undefined;
    var_1.vehicle_position = undefined;
}

startgen()
{
    self waittill( "trigger" );

    while ( !jeepride_start_dump( self.script_parameters ) )
        wait 0.05;
}

clearenemy_loc()
{
    self clearenemy();
}

tire_deflate()
{
    if ( self.vehicletype != "bm21_troops" )
        return;

    if ( common_scripts\utility::flag( "end_ride" ) )
        return;

    level endon( "end_ride" );
    level.tiredefeffectcount = 0;
    self endon( "death" );
    self endon( "stop_tire_deflate" );

    for (;;)
    {
        self waittill( "damage", var_0, var_1, var_2, var_3, var_4, var_5, var_6 );

        if ( !isdefined( var_6 ) || !isdefined( var_5 ) )
            return;

        if ( isplayer( var_1 ) && issubstr( var_6, "_wheel" ) )
            thread tire_deflater( var_2, var_3, var_6 );
    }
}

tire_deflater( var_0, var_1, var_2 )
{
    if ( level.tiredefeffectcount > 1 )
        return;

    level.tiredefeffectcount++;
    self endon( "stop_tire_deflate" );
    var_3 = spawn( "script_model", var_1 );
    var_3 setmodel( "axis" );
    var_3 hide();
    var_3 playsound( "mtl_steam_pipe_hit" );
    thread tire_deflater_interuptable( var_3 );
    var_3 linkto( self, var_2, ( 32.0, 0.0, 0.0 ), ( 0.0, 0.0, 0.0 ) );
    self joltbody( self.origin + ( 23.0, 33.0, 64.0 ), 1 );
    playfxontag( level._effect["tire_deflate"], var_3, "polySurface1" );
    wait 3;
    level.tiredefeffectcount--;
    var_3 delete();
}

tire_deflater_interuptable( var_0 )
{
    var_0 endon( "death" );
    self waittill( "stop_tire_deflate" );
    var_0 delete();
}

nodisconnectpaths()
{
    self waittill( "trigger", var_0 );
    var_0.dontdisconnectpaths = 1;
}

vehicle_mgmanage()
{
    self endon( "death" );
    self endon( "c4_detonation" );
    self endon( "stop_thinking" );
    self endon( "bridge_zakhaev_setup" );
    var_0 = self.mgturret[0];

    for (;;)
    {
        var_1 = getaiarray( "axis" );

        if ( mg_check_for_friends( var_0, var_1 ) )
            maps\_vehicle::mgoff();
        else
            maps\_vehicle::mgon();

        wait 0.05;
    }
}

mg_check_for_friends( var_0, var_1 )
{
    for ( var_2 = 0; var_2 < var_1.size; var_2++ )
    {
        if ( common_scripts\utility::within_fov( var_0 gettagorigin( "tag_flash" ), var_0 gettagangles( "tag_flash" ), var_1[var_2] geteye(), cos( 10 ) ) )
            return 1;
    }

    return 0;
}

vehicle_turret_think()
{
    self endon( "death" );
    self endon( "c4_detonation" );
    self endon( "stop_thinking" );
    self endon( "bridge_zakhaev_setup" );
    self.turretfiring = 0;
    var_0 = undefined;
    var_1 = [];
    var_1[0] = level.price;
    var_1[1] = level.griggs;
    var_1[2] = level.gaz;
    var_2 = undefined;
    self setturrettargetent( level.player );
    thread vehicle_mgmanage();

    for (;;)
    {
        wait 0.05;
        var_0 = level.player;

        if ( isdefined( var_0 ) && isplayer( var_0 ) )
        {
            var_3 = 0;
            var_3 = sighttracepassed( self gettagorigin( "tag_flash" ), level.player geteye(), 1, self );

            if ( !var_3 )
                var_0 = vehicle_get_target( var_1 );
        }

        if ( isalive( var_0 ) )
        {
            var_4 = var_0.origin + ( 0.0, 0.0, 32.0 );
            self setturrettargetvec( bulletspread( self gettagorigin( "tag_flash" ), var_4, 2.0 ) );

            if ( getdvar( "debug_bmp" ) == "1" )
                thread maps\_utility::draw_line_until_notify( self.origin + ( 0.0, 0.0, 32.0 ), var_4, 1, 0, 0, self, "stop_drawing_line" );

            var_5 = randomfloatrange( 2, 3 );
            common_scripts\utility::waittill_notify_or_timeout( "turret_rotate_stopped", var_5 );

            if ( isalive( var_0 ) )
            {
                if ( distancesquared( var_0.origin, self.origin ) <= level.bmpmgrangesquared )
                {
                    wait 0.5;

                    if ( !self.turretfiring )
                        thread vehicle_fire_main_cannon();
                }
                else if ( !self.turretfiring )
                    thread vehicle_fire_main_cannon();
            }
            else
                var_0 = vehicle_get_target( var_1 );
        }
    }
}

vehicle_fire_main_cannon( var_0 )
{
    self endon( "death" );
    self endon( "c4_detonation" );
    var_1 = weaponfiretime( "bmp_turret" );

    if ( !isdefined( var_0 ) )
        var_0 = randomintrange( 3, 8 );

    self.turretfiring = 1;
    var_2 = 0;

    while ( var_2 < var_0 )
    {
        var_2++;
        wait(var_1);
        self fireweapon();
    }

    self.turretfiring = 0;
}

vehicle_get_target( var_0 )
{
    var_1 = maps\_helicopter_globals::getenemytarget( level.bmpcannonrange, level.cosine["180"], 1, 1, 0, 0, var_0 );
    return var_1;
}

vehicle_badplacer()
{
    var_0 = getvehiclenode( self.target, "targetname" );
    var_0 waittill( "trigger", var_1 );
    var_2 = 500;

    if ( isdefined( self.radius ) )
        var_2 = self.radius;

    var_3 = 3;

    if ( isdefined( self.script_offtime ) )
        var_3 = self.script_offtime;

    badplace_cylinder( "badplacer_" + var_0.targetname, var_3, self.origin, var_2, 300, "allies", "axis" );
}

path_array_setup_loc( var_0 )
{
    var_1 = maps\_vehicle_code::get_from_entity;
    var_2 = 0;
    var_3 = [];

    while ( isdefined( var_0 ) )
    {
        var_3[var_2] = var_0;
        var_2++;

        if ( isdefined( var_0.target ) )
        {
            var_0 = [[ var_1 ]]( var_0.target );
            continue;
        }

        break;
    }

    return var_3;
}

stop_looping_deathfx()
{
    maps\_vehicle_code::deathfx_ent() delete();
}

guy_hidetoback_check( var_0, var_1 )
{
    return isdefined( maps\_vehicle_aianim::anim_pos( self, var_1 ).hidetoback );
}

guy_hidetoback_startingback( var_0, var_1 )
{
    var_2 = maps\_vehicle_aianim::anim_pos( self, var_1 );
    var_0 endon( "newanim" );
    self endon( "death" );
    var_0 endon( "death" );
    maps\_vehicle_aianim::animontag( var_0, var_2.sittag, var_2.hidetoback );
    thread guy_back_attack( var_0, var_1 );
}

guy_back_attack( var_0, var_1 )
{
    var_0 endon( "newanim" );
    self endon( "death" );
    var_0 endon( "death" );
    var_2 = maps\_vehicle_aianim::anim_pos( self, var_1 );

    for (;;)
        maps\_vehicle_aianim::animontag( var_0, var_2.sittag, var_2.back_attack );
}

guy_backtohide_check( var_0, var_1 )
{
    return isdefined( maps\_vehicle_aianim::anim_pos( self, var_1 ).backtohide );
}

guy_hide_starting_back( var_0, var_1 )
{
    var_0 endon( "newanim" );
    self endon( "death" );
    var_0 endon( "death" );
    var_2 = maps\_vehicle_aianim::anim_pos( self, var_1 );
    maps\_vehicle_aianim::animontag( var_0, var_2.sittag, var_2.backtohide );
    thread guy_hide_attack_back( var_0, var_1 );
}

guy_hide_startingleft( var_0, var_1 )
{
    var_0 endon( "newanim" );
    self endon( "death" );
    var_0 endon( "death" );
    var_2 = maps\_vehicle_aianim::anim_pos( self, var_1 );

    if ( !isdefined( var_2.backtohide ) )
        return maps\_vehicle_aianim::guy_idle( var_0, var_1 );

    maps\_vehicle_aianim::animontag( var_0, var_2.sittag, var_2.backtohide );
    thread guy_hide_attack_left( var_0, var_1 );
}

guy_backtohide( var_0, var_1 )
{
    var_0 endon( "newanim" );
    self endon( "death" );
    var_0 endon( "death" );
    var_2 = maps\_vehicle_aianim::anim_pos( self, var_1 );
    maps\_vehicle_aianim::animontag( var_0, var_2.sittag, var_2.backtohide );
    thread maps\_vehicle_aianim::guy_idle( var_0, var_1 );
}

guy_react( var_0, var_1 )
{
    var_0 endon( "newanim" );
    self endon( "death" );
    var_0 endon( "death" );
    var_2 = maps\_vehicle_aianim::anim_pos( self, var_1 );
    maps\_vehicle_aianim::animontag( var_0, var_2.sittag, var_2.react );
    thread maps\_vehicle_aianim::guy_idle( var_0, var_1 );
}

guy_react_check( var_0, var_1 )
{
    return isdefined( maps\_vehicle_aianim::anim_pos( self, var_1 ).react );
}

guy_hide_attack_back_check( var_0, var_1 )
{
    return isdefined( maps\_vehicle_aianim::anim_pos( self, var_1 ).hide_attack_back );
}

guy_hide_attack_back( var_0, var_1 )
{
    var_0 endon( "newanim" );
    self endon( "death" );
    var_0 endon( "death" );
    var_2 = maps\_vehicle_aianim::anim_pos( self, var_1 );

    for (;;)
    {
        if ( isdefined( var_2.hide_attack_back_occurrence ) )
        {
            var_3 = maps\_vehicle_aianim::randomoccurrance( var_0, var_2.hide_attack_back_occurrence );
            maps\_vehicle_aianim::animontag( var_0, var_2.sittag, var_2.hide_attack_back[var_3] );
            continue;
        }

        maps\_vehicle_aianim::animontag( var_0, var_2.sittag, var_2.hide_attack_back );
    }
}

guy_hide_attack_forward_check( var_0, var_1 )
{
    return isdefined( maps\_vehicle_aianim::anim_pos( self, var_1 ).hide_attack_forward );
}

guy_hide_attack_forward( var_0, var_1 )
{
    var_0 endon( "newanim" );
    self endon( "death" );
    var_0 endon( "death" );
    var_2 = maps\_vehicle_aianim::anim_pos( self, var_1 );

    for (;;)
        maps\_vehicle_aianim::animontag( var_0, var_2.sittag, var_2.hide_attack_forward );
}

guy_hide_attack_left_check( var_0, var_1 )
{
    return isdefined( maps\_vehicle_aianim::anim_pos( self, var_1 ).hide_attack_left );
}

guy_hide_attack_left( var_0, var_1 )
{
    var_0 endon( "newanim" );
    self endon( "death" );
    var_0 endon( "death" );
    var_2 = maps\_vehicle_aianim::anim_pos( self, var_1 );

    for (;;)
    {
        if ( isdefined( var_2.hide_attack_left_occurrence ) )
        {
            var_3 = maps\_vehicle_aianim::randomoccurrance( var_0, var_2.hide_attack_left_occurrence );
            maps\_vehicle_aianim::animontag( var_0, var_2.sittag, var_2.hide_attack_left[var_3] );
            continue;
        }

        maps\_vehicle_aianim::animontag( var_0, var_2.sittag, var_2.hide_attack_left );
    }
}

guy_hide_attack_left_standing( var_0, var_1 )
{
    var_0 endon( "newanim" );
    self endon( "death" );
    var_0 endon( "death" );
    var_2 = maps\_vehicle_aianim::anim_pos( self, var_1 );

    for (;;)
    {
        if ( isdefined( var_2.hide_attack_left_standing_occurrence ) )
        {
            var_3 = maps\_vehicle_aianim::randomoccurrance( var_0, var_2.hide_attack_left_standing_occurrence );
            maps\_vehicle_aianim::animontag( var_0, var_2.sittag, var_2.hide_attack_left_standing[var_3] );
            continue;
        }

        maps\_vehicle_aianim::animontag( var_0, var_2.sittag, var_2.hide_attack_left_standing );
    }
}

remember_weaponsondeath( var_0 )
{
    if ( !isdefined( self.weapon ) )
        return;

    var_1 = [];
    var_1[0] = "weapon_" + self.weapon;
    var_1[1] = "weapon_" + self.primaryweapon;
    var_1[2] = "weapon_" + self.secondaryweapon;
    level.potentialweaponitems = maps\_utility::array_merge( level.potentialweaponitems, var_1 );
}

remove_all_weapons()
{
    level.potentialweaponitems = common_scripts\utility::array_add( level.potentialweaponitems, "weapon_fraggrenade" );
    level.potentialweaponitems = common_scripts\utility::array_add( level.potentialweaponitems, "weapon_brick_bomb" );
    level.potentialweaponitems = common_scripts\utility::array_add( level.potentialweaponitems, "weapon_claymore" );
    level.potentialweaponitems = common_scripts\utility::array_add( level.potentialweaponitems, "weapon_flash_grenade" );
    level.potentialweaponitems = common_scripts\utility::array_add( level.potentialweaponitems, "weapon_smoke_grenade_american" );
    var_0 = undefined;

    for ( var_1 = 0; var_1 < level.potentialweaponitems.size; var_1++ )
    {
        var_0 = getentarray( level.potentialweaponitems[var_1], "classname" );

        if ( !var_0.size )
            continue;

        common_scripts\utility::array_levelthread( var_0, maps\_utility::deleteent );
    }
}

add_death_function( var_0, var_1, var_2, var_3 )
{
    var_4 = [];
    var_4["func"] = var_0;
    var_4["params"] = 0;

    if ( isdefined( var_1 ) )
    {
        var_4["param1"] = var_1;
        var_4["params"]++;
    }

    if ( isdefined( var_2 ) )
    {
        var_4["param2"] = var_2;
        var_4["params"]++;
    }

    if ( isdefined( var_3 ) )
    {
        var_4["param3"] = var_3;
        var_4["params"]++;
    }

    self.deathfuncs[self.deathfuncs.size] = var_4;
}

#using_animtree("vehicles");

freeonend()
{
    if ( common_scripts\utility::flag( "end_ride" ) )
        return;

    self endon( "end_ride" );
    self endon( "no_free_on_end" );
    self waittill( "reached_end_node" );
    self freevehicle();
    self clearanim( %root, 0.5 );

    if ( isdefined( self.modeldummyon ) && self.modeldummyon )
        self hide();
}

hidemeuntilflag()
{
    self waittill( "trigger", var_0 );

    for ( var_1 = 0; var_1 < var_0.riders.size; var_1++ )
        var_0.riders[var_1] hide();

    var_0 hide();
    common_scripts\utility::flag_wait( self.script_flag_wait );
    var_0 show();

    for ( var_1 = 0; var_1 < var_0.riders.size; var_1++ )
        var_0.riders[var_1] show();
}

ishero()
{
    if ( !isdefined( self.script_noteworthy ) )
        return 0;

    return self.script_noteworthy == "price" || self.script_noteworthy == "griggs" || self.script_noteworthy == "gaz" || self.script_noteworthy == "medic";
}

crazy_bmp()
{
    self waittill( "trigger", var_0 );

    if ( common_scripts\utility::flag( "bridge_zakhaev_setup" ) )
        return;

    level.crazy_bmp = var_0;
    var_0 thread vehicle_turret_think();
}

clouds_off()
{
    self waittill( "trigger" );
    common_scripts\utility::array_thread( maps\_utility::getfxarraybyid( "cloud_bank_far" ), common_scripts\utility::pauseeffect );
}

clouds_on()
{
    self waittill( "trigger" );
    common_scripts\utility::array_thread( maps\_utility::getfxarraybyid( "cloud_bank_far" ), maps\_utility::restarteffect );
}

shot_in_the_head_point_blank( var_0, var_1, var_2 )
{
    var_3 = var_0 gettagorigin( "j_head" );
    var_4 = var_0 gettagangles( "j_head" );
    var_3 += var_1;
    var_4 += var_2;

    if ( getdvarint( "cg_blood" ) != 0 )
        playfx( level._effect["bloodsplash"], var_3, anglestoforward( var_4 ) );

    var_0 blead();
}

blead_on_death( var_0 )
{
    if ( !isdefined( var_0 ) )
        var_0 = 45;

    self waittill( "death" );
    blead( var_0 );
}

blead( var_0 )
{
    if ( getdvarint( "cg_blood" ) == 0 )
        return;

    if ( !isdefined( var_0 ) )
        var_0 = 45;

    var_1 = maps\_utility::groundpos( self gettagorigin( "J_Head" ) );
    var_1 += maps\_utility::vector_multiply( vectornormalize( common_scripts\utility::flat_origin( level.player.origin ) - common_scripts\utility::flat_origin( var_1 ) ), var_0 );
    wait 0.5;
    playfx( level._effect["bloodpool"], var_1 + ( 15.0, 35.0, 0.0 ), ( 0.0, 0.0, 1.0 ) );
}

shot_in_the_head( var_0 )
{
    if ( getdvarint( "cg_blood" ) == 0 )
        return;

    var_1 = common_scripts\utility::spawn_tag_origin();
    var_1 linkto( var_0, "tag_eye", ( 0.0, 0.0, 0.0 ), ( 15.0, 180.0, 0.0 ) );
    playfxontag( level._effect["griggs_brains"], var_1, "tag_origin" );
}

save_fail_on_rpgguy()
{
    return 0;
}

alltheweapons()
{
    var_0 = [];
    var_0[var_0.size] = "weapon_ak47";
    var_0[var_0.size] = "weapon_ak74u";
    var_0[var_0.size] = "weapon_g36c";
    var_0[var_0.size] = "weapon_m16_basic";
    var_0[var_0.size] = "weapon_m16_grenadier";
    var_0[var_0.size] = "weapon_m4_grunt";
    var_0[var_0.size] = "weapon_m4_silencer_acog";
    var_0[var_0.size] = "weapon_m4_grenadier";
    var_0[var_0.size] = "weapon_g3";
    var_0[var_0.size] = "weapon_m4m203_silencer";
    var_0[var_0.size] = "weapon_m4m203_silencer_reflex";
    var_0[var_0.size] = "weapon_m4_silencer";
    var_0[var_0.size] = "weapon_ak47_grenadier";
    var_0[var_0.size] = "weapon_saw";
    var_0[var_0.size] = "weapon_rpd";
    var_0[var_0.size] = "weapon_at4";
    var_0[var_0.size] = "weapon_stinger";
    var_0[var_0.size] = "weapon_winchester1200";
    var_0[var_0.size] = "weapon_rpg";
    var_0[var_0.size] = "weapon_mp5";
    var_0[var_0.size] = "weapon_p90";
    var_0[var_0.size] = "weapon_beretta";
    var_0[var_0.size] = "weapon_dragunov";
    var_0[var_0.size] = "weapon_m14_scoped";
    var_0[var_0.size] = "weapon_m40a3";
    var_0[var_0.size] = "weapon_remington700";
    var_0[var_0.size] = "weapon_usp";
    var_0[var_0.size] = "weapon_uzi";
    var_0[var_0.size] = "weapon_uzi_sd";
    var_0[var_0.size] = "weapon_skorpion";
    var_0[var_0.size] = "weapon_m60e4";
    var_0[var_0.size] = "weapon_c4";
    var_0[var_0.size] = "weapon_claymore";
    var_0[var_0.size] = "weapon_mp5_silencer";
    var_0[var_0.size] = "weapon_p90_silencer";
    var_0[var_0.size] = "weapon_colt45";
    var_0[var_0.size] = "weapon_deserteagle";
    var_0[var_0.size] = "weapon_m1014";
    var_0[var_0.size] = "weapon_javelin";
    var_0[var_0.size] = "weapon_barrett";
    return var_0;
}

exploder_phys()
{
    if ( self.classname != "script_model" )
        return;

    if ( !issubstr( self.model, "com_debris" ) )
        return;

    level waittill( "exploded_" + self.script_exploder );
    wait 0.1;
    self physicslaunchclient( self.origin, ( 0.0, 0.0, 1.0 ) );
}

layer_of_death_ai_mode( var_0, var_1 )
{
    self.baseaccuracy = var_0;

    if ( var_1 )
        self.favoriteenemy = level.player;
    else
        self.favoriteenemy = undefined;
}

layer_of_death_getlayer( var_0 )
{
    var_1 = [];
    var_1[0] = [];
    var_1[1] = [];
    var_1[2] = [];
    var_1[3] = [];

    switch ( level.gameskill )
    {
        case 0:
            var_1[0]["baseaccuracy"] = 1;
            var_1[0]["threatbias"] = 150;
            var_1[0]["playerisfavoriteenemy"] = 0;
            var_1[1]["baseaccuracy"] = 1;
            var_1[1]["threatbias"] = 150;
            var_1[1]["playerisfavoriteenemy"] = 0;
            var_1[2]["baseaccuracy"] = 1.2;
            var_1[2]["threatbias"] = 150;
            var_1[2]["playerisfavoriteenemy"] = 0;
            var_1[3]["baseaccuracy"] = 2;
            var_1[3]["threatbias"] = 250;
            var_1[3]["playerisfavoriteenemy"] = 0;
            var_1[4]["baseaccuracy"] = 3;
            var_1[4]["threatbias"] = 400;
            var_1[4]["playerisfavoriteenemy"] = 1;
        case 1:
            var_1[0]["baseaccuracy"] = 1;
            var_1[0]["threatbias"] = 150;
            var_1[0]["playerisfavoriteenemy"] = 0;
            var_1[1]["baseaccuracy"] = 1.1;
            var_1[1]["threatbias"] = 165;
            var_1[1]["playerisfavoriteenemy"] = 0;
            var_1[2]["baseaccuracy"] = 1.7;
            var_1[2]["threatbias"] = 200;
            var_1[2]["playerisfavoriteenemy"] = 0;
            var_1[3]["baseaccuracy"] = 2;
            var_1[3]["threatbias"] = 250;
            var_1[3]["playerisfavoriteenemy"] = 0;
            var_1[4]["baseaccuracy"] = 3;
            var_1[4]["threatbias"] = 400;
            var_1[4]["playerisfavoriteenemy"] = 1;
            break;
        case 2:
            var_1[0]["baseaccuracy"] = 1;
            var_1[0]["threatbias"] = 150;
            var_1[0]["playerisfavoriteenemy"] = 0;
            var_1[1]["baseaccuracy"] = 1.3;
            var_1[1]["threatbias"] = 175;
            var_1[1]["playerisfavoriteenemy"] = 0;
            var_1[2]["baseaccuracy"] = 1.7;
            var_1[2]["threatbias"] = 200;
            var_1[2]["playerisfavoriteenemy"] = 0;
            var_1[3]["baseaccuracy"] = 2;
            var_1[3]["threatbias"] = 250;
            var_1[3]["playerisfavoriteenemy"] = 0;
            var_1[4]["baseaccuracy"] = 3;
            var_1[4]["threatbias"] = 400;
            var_1[4]["playerisfavoriteenemy"] = 1;
            break;
        case 3:
            var_1[0]["baseaccuracy"] = 1;
            var_1[0]["threatbias"] = 150;
            var_1[0]["playerisfavoriteenemy"] = 0;
            var_1[1]["baseaccuracy"] = 1.3;
            var_1[1]["threatbias"] = 175;
            var_1[1]["playerisfavoriteenemy"] = 0;
            var_1[2]["baseaccuracy"] = 1.7;
            var_1[2]["threatbias"] = 200;
            var_1[2]["playerisfavoriteenemy"] = 0;
            var_1[3]["baseaccuracy"] = 2;
            var_1[3]["threatbias"] = 250;
            var_1[3]["playerisfavoriteenemy"] = 0;
            var_1[4]["baseaccuracy"] = 3;
            var_1[4]["threatbias"] = 400;
            var_1[4]["playerisfavoriteenemy"] = 1;
            break;
        default:
    }

    return var_1[var_0];
}

layer_of_death( var_0 )
{
    level endon( "murdering_player" );

    for (;;)
    {
        self waittill( "trigger" );
        set_layer_of_death( var_0 );
    }
}

layer_of_death_timed_kill( var_0 )
{
    level endon( "layer_of_death" );
    wait(var_0);
    player_kill();
}

set_layer_of_death( var_0 )
{
    if ( level.ai_in_boundry )
        return;

    level.last_layer_of_death = var_0;
    var_1 = layer_of_death_getlayer( var_0 );
    common_scripts\utility::array_thread( getaiarray( "axis" ), ::layer_of_death_ai_mode, var_1["baseaccuracy"], var_1["playerisfavoriteenemy"] );
    level.player.threatbias = var_1["threatbias"];
    level notify( "layer_of_death" );

    if ( var_0 == 4 )
        thread layer_of_death_timed_kill( 4 );

    level waittill( "layer_of_death" );
}

encroacher()
{
    var_0 = 10;
    var_1 = [];
    var_1[0] = "bridge_encroach_03";
    var_1[1] = "bridge_encroach_02";
    var_1[2] = "bridge_encroach_01";
    level endon( "bridge_zakhaev_setup" );
    level endon( "murdering_player" );

    switch ( level.gameskill )
    {
        case 0:
            var_0 = 25;
            break;
        case 1:
            var_0 = 17;
            break;
        case 2:
            var_0 = 12;
            break;
        case 3:
            var_0 = 8;
            break;
    }

    var_0 = 20;

    for ( var_2 = 0; var_2 < var_1.size; var_2++ )
    {
        maps\_utility::activate_trigger_with_targetname( var_1[var_2] );
        wait(var_0);
    }
}

unload_single_guy()
{
    var_0 = undefined;

    for ( var_1 = 0; var_1 < self.riders.size; var_1++ )
    {
        if ( !isdefined( self.riders[var_1].ragdoll_getout_death ) )
        {
            var_0 = self.riders[var_1];
            break;
        }
    }

    if ( !isdefined( var_0 ) )
        return;

    self.groupedanim_pos = var_0.vehicle_position;
    thread maps\_vehicle::vehicle_ai_event( "unload" );
    return var_0;
}

unloadmanager()
{
    level.drone_unloader++;
    self waittill( "trigger", var_0 );
    var_0.dontunloadonend = 1;
    level.vehicles_with_drones[level.vehicles_with_drones.size] = var_0;
}

bridge_vehiclde_drone_unloader()
{
    level endon( "bridge_zakhaev_setup" );
    var_0 = 0;
    var_1 = 12;

    switch ( level.gameskill )
    {
        case 0:
            var_1 = 10;
            break;
        case 1:
            var_1 = 11;
            break;
        case 2:
            var_1 = 12;
            break;
        case 3:
            var_1 = 13;
            break;
    }

    for (;;)
    {
        while ( !level.vehicles_with_drones.size )
            wait 0.05;

        if ( getaiarray( "axis" ).size + count_unload_que() < var_1 && level.vehicles_with_drones.size )
            level.vehicles_with_drones[var_0] unload_single_guy();

        if ( !level.vehicles_with_drones[var_0].riders.size )
        {
            level.vehicles_with_drones = common_scripts\utility::array_remove( level.vehicles_with_drones, level.vehicles_with_drones[var_0] );
            level.drone_unloader--;
        }

        wait 0.1;
        var_0++;

        if ( var_0 >= level.vehicles_with_drones.size )
            var_0 = 0;

        if ( level.drone_unloader == 0 )
            break;
    }

    common_scripts\utility::flag_set( "no_more_drone_unloaders" );
}

count_unload_que()
{
    var_0 = 0;
    var_1 = maps\_vehicle::get_script_vehicles();

    for ( var_2 = 0; var_2 < var_1.size; var_2++ )
        var_0 += var_1[var_2].unloadque.size;

    return var_0;
}

kill_unload_que()
{
    common_scripts\utility::array_thread( maps\_vehicle::get_script_vehicles(), ::vehicle_enemies_with_drones_delete_on_unload );
    common_scripts\utility::array_thread( level.vehicles_with_drones, ::kill_unload_que_single_vehicle );
}

vehicle_enemies_with_drones_delete_on_unload()
{
    if ( self.script_team == "allies" )
        return;

    for ( var_0 = 0; var_0 < self.riders.size; var_0++ )
        self.riders[var_0].drone_delete_on_unload = 1;
}

kill_unload_que_single_vehicle()
{
    common_scripts\utility::array_levelthread( self.riders, maps\_utility::deleteent );
}

bridge_defence_bounds()
{
    level endon( "bridge_zakhaev_setup" );
    var_0 = getent( "defence_bounds", "targetname" );
    var_1 = 0;

    switch ( level.gameskill )
    {
        case 0:
            var_1 = 32;
            break;
        case 1:
            var_1 = 24;
            break;
        case 2:
            var_1 = 12;
            break;
        case 3:
            var_1 = 7;
            break;
    }

    var_2 = gettime() + var_1 * 1000;

    for (;;)
    {
        var_0 waittill( "trigger", var_3 );
        var_2 = gettime() + var_1 * 1000;

        while ( isalive( var_3 ) && gettime() < var_2 )
            wait 0.05;

        if ( !isalive( var_3 ) )
            continue;

        var_4 = 1;
        set_layer_of_death( 4 );
        level.ai_in_boundry = 1;

        while ( var_4 )
        {
            var_5 = getaiarray( "axis" );
            var_4 = 0;

            for ( var_6 = 0; var_6 < var_5.size; var_6++ )
            {
                if ( var_5[var_6] istouching( var_0 ) )
                {
                    var_4 = 1;
                    break;
                }
            }

            wait 0.05;
        }

        level.ai_in_boundry = 0;
        set_layer_of_death( level.last_layer_of_death );
    }
}

heros_shields_off()
{
    common_scripts\utility::array_thread( maps\_utility::get_heroes(), maps\_utility::stop_magic_bullet_shield );
}

heros_shields_on()
{
    common_scripts\utility::array_thread( maps\_utility::get_heroes(), maps\_utility::magic_bullet_shield );
}

hind_bombplayer()
{
    self waittill( "trigger", var_0 );
    var_0 endon( "stop_killing_theplayer" );
    wait 2;

    for (;;)
    {
        var_1 = randomint( 4 );

        for ( var_2 = 0; var_2 < var_1; var_2++ )
        {
            var_3 = nearby_destry_at_end_vehicle();
            var_4 = 200;
            var_5 = 300;

            if ( level.player.health != level.player.maxhealth )
            {
                var_4 = 400;
                var_5 = 600;
            }

            var_6 = undefined;

            if ( level.player.health == level.player.maxhealth )
                var_6 = nearby_non_hero();

            if ( isdefined( var_3 ) )
                var_7 = var_3.origin + ( 0.0, 0.0, 16.0 );
            else if ( isdefined( var_6 ) )
                var_7 = var_6[var_2].origin;
            else
                var_7 = random_outer_box( level.player.origin, var_4, var_5 );

            if ( player_in_blastradius() )
                var_7 = level.player geteye();

            var_0 shootspotoncewithmissile( var_7 );
        }

        wait(randomfloatrange( 0.5, 1 ));
    }
}

player_in_blastradius()
{
    if ( distance( ( -36286.3, -17573.5, 0.0 ), common_scripts\utility::flat_origin( level.player.origin ) ) < 962.438 )
        return 1;

    return 0;
}

random_outer_box( var_0, var_1, var_2 )
{
    var_3 = randomint( 50 ) > 25;
    var_4 = randomint( 50 ) > 25;

    if ( !var_3 )
        var_3 = -1;

    if ( !var_4 )
        var_4 = -1;

    var_5 = randomfloatrange( var_1, var_2 ) * var_3;
    var_5 += var_0[0];
    var_6 = randomfloatrange( var_1, var_2 ) * var_4;
    var_6 += var_0[1];
    var_7 = var_0[2];
    return ( var_5, var_6, var_7 );
}

nearby_destry_at_end_vehicle()
{
    var_0 = undefined;

    if ( level.player.health != level.player.maxhealth )
        return var_0;

    var_1 = gettime() + 10000;
    var_2 = getentarray( "destroy_at_end", "script_noteworthy" );
    var_3 = [];

    for ( var_4 = 0; var_4 < var_2.size; var_4++ )
    {
        if ( var_2[var_4].code_classname == "script_vehicle" && isalive( var_2[var_4] ) )
            var_3[var_3.size] = var_2[var_4];
    }

    if ( !var_3.size )
        return var_0;

    var_0 = common_scripts\utility::getclosest( level.player.origin, var_3, 500 );
    return var_0;
}

nearby_non_hero()
{

}

drag_shots()
{
    level endon( "stop_drag_shots" );
    var_0 = 4;
    var_1 = 0.4;
    var_2 = getent( self.target, "targetname" );
    var_3 = self.origin;
    var_4 = var_2.origin;

    for (;;)
    {
        var_0 = randomintrange( 3, 6 );
        var_1 = 0.4;

        for ( var_5 = 0; var_5 < var_0; var_5++ )
        {
            var_6 = bulletspread( var_3, var_4, 5 );
            var_7 = bullettrace( var_3, var_6, 1, undefined );

            if ( isdefined( var_7["entity"] ) && ( isai( var_7["entity"] ) || var_7["entity"].classname == "script_model" ) )
            {
                wait 0.05;
                continue;
            }

            var_6 = var_7["position"];
            bullettracer( var_3, var_6, 0 );
            var_8 = var_6 - maps\_utility::vector_multiply( vectornormalize( var_6 - var_3 ), 5 );
            magicbullet( "ak47", var_3, var_3 + ( 0.0, 0.0, 66.0 ) );
            var_9 = ak_fx_lookup( var_7["surfacetype"] );
            playfx( var_9, var_6, var_7["normal"] );
            wait 0.1;
        }

        wait(var_1);
    }
}

ak_fx_lookup( var_0 )
{
    var_1 = level._ak_impacts[var_0];

    if ( !isdefined( var_1 ) )
        var_1 = level._ak_impacts["concrete"];

    return var_1;
}

honker_initiate()
{
    for (;;)
    {
        self waittill( "trigger", var_0 );

        if ( isdefined( var_0.honker_thinking ) )
            continue;

        var_0 thread honker_think();
    }
}

honker_think()
{
    self.honker_thinking = 1;
    self endon( "death" );

    if ( !playervehicle_infront_of_honkingvehicle_vehicle( level.playersride, self ) )
        return;

    while ( playervehicle_infront_of_honkingvehicle_vehicle( level.playersride, self ) )
        wait 0.05;

    thread common_scripts\utility::draw_arrow_time( self.origin, level.playersride.origin, ( 1.0, 0.0, 0.0 ), 6 );
}

playervehicle_infront_of_honkingvehicle_vehicle( var_0, var_1 )
{
    var_2 = anglestoforward( common_scripts\utility::flat_angle( var_1.angles ) );
    var_3 = vectornormalize( common_scripts\utility::flat_origin( var_0.origin ) - common_scripts\utility::flat_origin( var_1.origin ) );
    var_4 = vectordot( var_2, var_3 );

    if ( var_4 > 0 )
        return 1;
    else
        return 0;
}

ride_smoker()
{

}

player_kill()
{
    level.player enablehealthshield( 0 );
    level.player disableinvulnerability();
    level.player kill();
    level.player enablehealthshield( 1 );
}

bridge_fall()
{
    self waittill( "trigger" );
    var_0 = 1.0;
    setomnvar( "ui_go_black", var_0 );
    wait(var_0);
    player_kill();
}

player_fudge_rotateto( var_0, var_1 )
{
    var_2 = spawn( "script_origin", level.player.origin );
    var_2.origin = level.player geteye();
    var_2.angles = level.player getplayerangles();

    if ( !isdefined( var_1 ) )
        var_1 = 0.5;

    var_2 rotateto( var_0, var_1, 0.2, 0.2 );
    var_3 = int( var_1 / 0.05 );

    for ( var_4 = 0; var_4 < var_3; var_4++ )
    {
        level.player setplayerangles( var_2.angles );
        wait 0.05;
    }
}

exp_fade_overlay( var_0, var_1 )
{
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

    self.alpha = var_0;
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
    var_2.foreground = 1;
    var_2.alpha = var_1;

    if ( !isdefined( level.overlays ) )
        level.overlays = [];

    level.overlays[level.overlays.size] = var_2;
    return var_2;
}

rescue_scene_patrol_01()
{
    wait 2;
    var_0 = getaiarray( "allies" );
    var_1 = [];

    if ( isdefined( level.medic ) )
        var_1[var_1.size] = level.medic;

    if ( isdefined( level.ru1 ) )
        var_1[var_1.size] = level.ru1;

    if ( isdefined( level.ru2 ) )
        var_1[var_1.size] = level.ru2;

    for ( var_2 = 0; var_2 < var_0.size; var_2++ )
    {
        if ( isdefined( var_0[var_2].rescue_patroler ) && var_0[var_2].rescue_patroler == self.targetname )
            var_1[var_1.size] = var_0[var_2];
    }

    var_3 = common_scripts\utility::get_array_of_closest( self.origin, var_0, var_1, 1 )[0];
    var_3.rescue_patroler = self.targetname;

    if ( isdefined( var_3.ridingvehicle ) )
    {
        var_3 waittill( "jumpedout" );
        wait 0.05;
    }

    var_3 forceteleport( self.origin, ( 0.0, 0.0, 0.0 ) );

    if ( isdefined( self.target ) )
        var_3 thread maps\_patrol::patrol( self.target );
}

flag_sound( var_0 )
{
    if ( common_scripts\utility::flag( "flag_sound" + var_0 ) )
        return;

    common_scripts\utility::flag_set( "flag_sound" + var_0 );
    maps\_utility::play_sound_on_entity( var_0 );
    common_scripts\utility::flag_clear( "flag_sound" + var_0 );
}

fake_water_tread()
{
    var_0 = maps\_vehicle::get_script_vehicles();
    var_1 = undefined;

    for ( var_2 = 0; var_2 < var_0.size; var_2++ )
    {
        if ( var_0[var_2].vehicletype == "hind" )
            var_1 = var_0[var_2];
    }

    if ( !isdefined( var_1 ) )
        return;

    level endon( "end_fake_water_tread" );

    for (;;)
    {
        var_3 = ( var_1.origin[0], var_1.origin[1], 375 );
        playfx( level._vehicle_effect[var_1.classname]["water"], var_3 );
        wait 0.1;
    }
}

stop_fake_water_tread()
{
    level notify( "end_fake_water_tread" );
}

crashed_vehicles_setup()
{
    var_0 = getentarray( "crash_trigger", "targetname" );

    foreach ( var_2 in var_0 )
    {
        var_3 = getentarray( var_2.script_noteworthy, "script_noteworthy" );
        var_3 = common_scripts\utility::array_remove_array( var_3, var_0 );
        common_scripts\utility::array_thread( var_3, maps\_utility::add_spawn_function, ::delete_crashed_vehicle, var_2 );
    }
}

delete_crashed_vehicle( var_0 )
{
    var_0 waittill( "trigger" );
    maps\_vehicle::godoff();
    self notify( "stop_friendlyfire_shield" );
    self.health = 1;

    if ( common_scripts\utility::isdestructible() )
        self notify( "damage", 5000, level.player, ( 1.0, 1.0, 1.0 ), self.origin, "mod_explosive", self.model, undefined );
    else
        self notify( "death" );
}

mountain_bridge()
{
    self show();
}

bridge_linkto( var_0, var_1 )
{
    var_2 = getentarray( var_0, "targetname" );

    foreach ( var_4 in var_2 )
        var_4 linkto( self, var_1 );
}

stumble( var_0, var_1, var_2, var_3 )
{
    level endon( "stop_stumble" );
    var_0 = adjust_angles_to_player( var_0 );
    level.ground_ref_ent rotateto( var_0, var_1, var_1 / 4 * 3, var_1 / 4 );
    level.ground_ref_ent waittill( "rotatedone" );
    var_4 = ( randomfloat( 4 ) - 4, randomfloat( 5 ), 0 );
    var_4 = adjust_angles_to_player( var_4 );
    level.ground_ref_ent rotateto( var_4, var_2, 0, var_2 / 2 );
    level.ground_ref_ent waittill( "rotatedone" );

    if ( !isdefined( var_3 ) )
        level notify( "recovered" );
}

limp()
{
    level endon( "stop_limp" );
    level.ground_ref_ent = spawn( "script_model", ( 0.0, 0.0, 0.0 ) );
    level.player playersetgroundreferenceent( level.ground_ref_ent );
    var_0 = 0;
    var_1 = 0;

    for (;;)
    {
        var_2 = level.player getvelocity();
        var_3 = abs( var_2[0] ) + abs( var_2[1] );

        if ( var_3 < 10 )
        {
            wait 0.05;
            continue;
        }

        var_4 = var_3 / level.player_speed;
        var_5 = randomfloatrange( 3, 5 );

        if ( randomint( 100 ) < 20 )
            var_5 *= 3;

        var_6 = randomfloatrange( 3, 7 );
        var_7 = randomfloatrange( -8, -2 );
        var_8 = ( var_5, var_7, var_6 );
        var_8 = maps\_utility::vector_multiply( var_8, var_4 );
        var_9 = randomfloatrange( 0.35, 0.45 );
        var_10 = randomfloatrange( 0.65, 0.8 );
        var_0++;

        if ( var_4 > 1.3 )
            var_0++;

        thread stumble( var_8, var_9, var_10 );
        level waittill( "recovered" );
    }
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

helicopter_hide_crash_seq()
{
    var_0 = getent( "heli_destroy", "targetname" );
    var_0 hide();
}

helicopter_show_crash_seq()
{
    var_0 = getent( "heli_destroy", "targetname" );
    var_0.animname = "vehicles";
    var_0 maps\_anim::setanimtree();
    wait 0.35;
    var_0 show();
    var_0 thread maps\_anim::anim_single_solo( var_0, "heli_crash" );
    playfxontag( level._effect["fire_trail_l_jeepride_rotor_tail"], var_0, "tag_fx_tail" );
    playfxontag( level._effect["fire_trail_l_jeepride"], var_0, "tag_fx_cabin" );
    playfxontag( level._effect["helicopter_rotor_damaged_fire_jeepride"], var_0, "tag_fx_cabin" );
    playfxontag( level._effect["mi24p_cockpite_fire_chd"], var_0, "tag_fx_cockpit" );
}

set_final_visionset()
{
    maps\_utility::vision_set_changes( "jeepride_end_3", 2 );
    level.player maps\_utility::set_light_set_player( "jeepride_end_3" );
}

set_final_visionset_griggsdeath()
{
    wait 2.1;
    level.player maps\_utility::set_light_set_player( "jeepride_end_2" );
}

set_final_visionset_zakaev()
{
    maps\_utility::vision_set_changes( "jeepride_end_2", 54 );
    level.player maps\_utility::set_light_set_player( "jeepride_end_2" );
}

set_final_visionset_rescue()
{
    maps\_utility::vision_set_changes( "jeepride_end_2", 2 );
    wait 28;
    level.player maps\_utility::set_light_set_player( "jeepride_end_3" );
}

bloodtrail_spawn()
{
    wait 7;
    var_0 = getent( "bloodspawn", "targetname" );
    var_0 show();
}

bloodtrail_hide()
{
    var_0 = getent( "bloodspawn", "targetname" );
    var_0 hide();
}

spawn_griggs_pistol()
{
    self.scriptedweapon = "wpn_h1_pst_m1911_vm";
    self.scriptedweaponmodel = spawn( "script_model", ( 0.0, 0.0, 2.0 ) );
    self.scriptedweaponmodel setmodel( "wpn_h1_pst_m1911_vm" );
    self.scriptedweaponmodel.animname = "pistol_griggs";
    self.scriptedweaponmodel maps\_utility::assign_animtree();
    var_0 = getent( "player_drag_node", "targetname" );
    var_0 thread maps\_anim::anim_single_solo( self.scriptedweaponmodel, "drag_pistol" );
}

light_sequence_00()
{
    var_0 = getent( "light_2_sequence_00", "targetname" );
    var_1 = getent( "light_3_sequence_00", "targetname" );
    var_2 = getent( "light_4_sequence_00", "targetname" );
    var_0 setlightintensity( 1 );
    var_2 setlightintensity( 200000 );
    wait 1;
    var_1 setlightintensity( 1000000 );
}

disable_light_finalseq()
{
    var_0 = getent( "light_2_sequence_00", "targetname" );
    var_1 = getent( "light_3_sequence_00", "targetname" );
    var_2 = getent( "light_4_sequence_00", "targetname" );
    var_3 = getent( "light_1_sequence_01", "targetname" );
    var_4 = getent( "light_1_sequence_02", "targetname" );
    var_0 setlightintensity( 1 );
    var_1 setlightintensity( 1 );
    var_2 setlightintensity( 1 );
    var_3 setlightintensity( 1 );
    var_4 setlightintensity( 1 );
}

light_sequence_01()
{
    var_0 = getent( "light_1_sequence_01", "targetname" );
    var_0 setlightintensity( 100000 );
}

light_sequence_02()
{
    var_0 = getent( "light_1_sequence_01", "targetname" );
    var_0 setlightintensity( 1 );
    var_1 = getent( "light_1_sequence_02", "targetname" );
    var_1 setlightintensity( 4000 );
}

player_speedscaling_bridge_seq()
{
    setsaveddvar( "cl_NoWeaponBobAmplitudeVertical", 2.0 );
    setsaveddvar( "cl_NoWeaponBobAmplitudeHorizontal", 2.0 );
    level.player_speed = 200;
    level.player setmovespeedscale( 0.3 );
    wait 7;
    level.player setmovespeedscale( 0.5 );
    wait 2;
    level.player setmovespeedscale( 0.6 );
    wait 2;
    level.player setmovespeedscale( 0.7 );
    wait 1;
    level.player setmovespeedscale( 0.8 );
    wait 1;
    level.player setmovespeedscale( 1 );
    setsaveddvar( "cl_NoWeaponBobAmplitudeVertical", 0 );
    setsaveddvar( "cl_NoWeaponBobAmplitudeHorizontal", 0 );
}
