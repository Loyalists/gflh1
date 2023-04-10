// H1 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

fadeoverlay( var_0, var_1, var_2 )
{
    self fadeovertime( var_0 );
    self.alpha = var_1;
    setblur( var_2, var_0 );
    wait(var_0);
}

blackout( var_0, var_1 )
{
    fadeoverlay( var_0, 1, var_1 );
}

restorevision( var_0, var_1 )
{
    fadeoverlay( var_0, 0, var_1 );
}

initdof()
{
    setsaveddvar( "scr_dof_enable", 0 );

    for (;;)
    {
        setdefaultdepthoffield();
        wait 0.05;
    }
}

setdefaultdepthoffield()
{
    level.player setdepthoffield( level.dofdefault["nearStart"], level.dofdefault["nearEnd"], level.dofdefault["farStart"], level.dofdefault["farEnd"], level.dofdefault["nearBlur"], level.dofdefault["farBlur"] );
}

setdof( var_0, var_1, var_2, var_3, var_4, var_5, var_6 )
{
    if ( isdefined( var_6 ) && var_6 > 0 )
    {
        var_6 = int( var_6 * 1000 );
        var_7 = gettime();

        for ( var_8 = gettime(); var_8 <= var_7 + var_6; var_8 = gettime() )
        {
            var_9 = ( var_8 - var_7 ) / var_6;
            lerpdofvalue( "nearStart", var_0, var_9 );
            lerpdofvalue( "nearEnd", var_1, var_9 );
            lerpdofvalue( "nearBlur", var_2, var_9 );
            lerpdofvalue( "farStart", var_3, var_9 );
            lerpdofvalue( "farEnd", var_4, var_9 );
            lerpdofvalue( "farBlur", var_5, var_9 );
            wait 0.05;
        }
    }

    self.dof["nearStart"] = var_0;
    self.dof["nearEnd"] = var_1;
    self.dof["nearBlur"] = var_2;
    self.dof["farStart"] = var_3;
    self.dof["farEnd"] = var_4;
    self.dof["farBlur"] = var_5;
}

lerpdofvalue( var_0, var_1, var_2 )
{
    level.dofdefault[var_0] = self.dof[var_0] + ( var_1 - self.dof[var_0] ) * var_2;
}

scripted_array_spawn( var_0, var_1, var_2 )
{
    var_3 = getentarray( var_0, var_1 );
    var_4 = [];

    for ( var_5 = 0; var_5 < var_3.size; var_5++ )
        var_4[var_5] = scripted_spawn2( var_0, var_1, var_2, var_3[var_5] );

    return var_4;
}

scripted_spawn2( var_0, var_1, var_2, var_3 )
{
    if ( !isdefined( var_3 ) )
        var_3 = getent( var_0, var_1 );

    if ( isdefined( var_3.script_drone ) )
    {
        var_4 = maps\_utility::dronespawn( var_3, 1 );

        if ( var_3.classname == "actor_enemy_arab_AR_ak47" )
        {
            if ( var_3.targetname == "carexit_rightguard" )
                var_4 setcurbstompcharacter();
            else
                var_4 randomizeguardcharacter();
        }

        return var_4;
    }
    else
    {
        if ( isdefined( var_2 ) )
            var_5 = var_3 stalingradspawn();
        else
            var_5 = var_3 dospawn();

        maps\_utility::spawn_failed( var_5 );
        return var_5;
    }
}

deletecharactertriggers()
{
    var_0 = getentarray( "deleteai", "targetname" );

    for ( var_1 = 0; var_1 < var_0.size; var_1++ )
    {
        var_2 = var_0[var_1];

        if ( isdefined( var_2.script_deleteai ) )
            var_2 thread deletecharacter();
    }
}

deletecharacter()
{
    self waittill( "trigger" );
    var_0 = getaiarray();

    for ( var_1 = 0; var_1 < var_0.size; var_1++ )
    {
        var_2 = var_0[var_1];

        if ( isdefined( var_2.script_deleteai ) && var_2.script_deleteai == self.script_deleteai )
            var_2 delete();
    }

    var_3[0] = "axis";
    var_3[1] = "allies";
    var_3[2] = "neutral";

    for ( var_1 = 0; var_1 < var_3.size; var_1++ )
    {
        var_4 = level.drones[var_3[var_1]].array;

        for ( var_5 = 0; var_5 < var_4.size; var_5++ )
        {
            var_6 = var_4[var_5];

            if ( isdefined( var_6.script_deleteai ) && var_6.script_deleteai == self.script_deleteai )
                var_6 delete();
        }
    }
}

pulsefadevision( var_0, var_1 )
{
    level.player endon( "death" );
    level.vision_totalpercent = 100;
    thread updatepulsefadeamount( var_0, var_1 );
    var_2 = newhudelem();
    var_2.x = 0;
    var_2.y = 0;
    var_2 setshader( "black", 640, 480 );
    var_2.alignx = "left";
    var_2.aligny = "top";
    var_2.horzalign = "fullscreen";
    var_2.vertalign = "fullscreen";
    var_2.alpha = 0;
    var_3 = 1;
    var_4 = 4;
    var_5 = 0.25;
    var_6 = 1;
    var_7 = 0;
    var_8 = 100;
    var_9 = 0;

    for (;;)
    {
        while ( level.vision_totalpercent > var_7 )
        {
            var_10 = var_8 - var_7;
            var_9 = ( level.vision_totalpercent - var_7 ) / var_10;

            if ( var_9 < 0 )
                var_9 = 0;
            else if ( var_9 > 1 )
                var_9 = 1;

            var_11 = var_4 - var_3;
            var_12 = var_3 + var_11 * ( 1 - var_9 );
            var_13 = var_6 - var_5;
            var_14 = var_5 + var_13 * var_9;
            var_15 = 7.2 * var_14;
            var_16 = var_9 * 0.5;
            var_17 = 7.2 * var_16;
            var_0 = var_12 / 2;
            var_2 fadeoverlay( var_0, var_14, var_15 );
            var_2 fadeoverlay( var_0, var_16, var_17 );
            wait(var_9 * 0.5);
        }

        wait 0.05;
    }
}

updatepulsefadeamount( var_0, var_1 )
{
    var_2 = 0.05;
    var_3 = int( var_0 / var_2 );

    while ( var_3 > 1 )
    {
        level.vision_totalpercent += ( var_1 - level.vision_totalpercent ) / var_3;
        var_3--;
        wait(var_2);
    }

    level.vision_totalpercent = var_1;
}

dropdead()
{
    self waittill( "death", var_0 );
    animscripts\shared::dropallaiweapons();
    self startragdoll();
    var_1 = self.origin;
    var_1 += ( 0.0, 16.0, 0.0 );
    var_2 = anglestoforward( ( 0.0, 270.0, 0.0 ) );
    var_3 = maps\_utility::vector_multiply( var_2, 2 );
    physicsjolt( var_1, 250, 250, var_3 );
}

deleteentity( var_0 )
{
    if ( isdefined( var_0 ) )
    {
        if ( isdefined( var_0.magic_bullet_shield ) )
            var_0 maps\_utility::stop_magic_bullet_shield();

        var_0 delete();
    }
}

deleteongoal()
{
    self waittill( "goal" );
    deleteentity( self );
}

deleteonflag( var_0, var_1 )
{
    common_scripts\utility::flag_wait( var_0 );
    wait(var_1);
    self delete();
}

printslowmo( var_0 )
{
    if ( isdefined( level.debug_slowmo ) && level.debug_slowmo )
        return;
}

printspeech( var_0 )
{
    if ( isdefined( level.debug_speech ) && level.debug_speech )
        return;
}

playspeech( var_0, var_1 )
{
    if ( isdefined( var_1 ) )
        printspeech( var_1 );

    level.player thread maps\_utility::play_sound_on_entity( var_0 );
}

playspeechcarradio( var_0, var_1 )
{
    if ( isdefined( var_1 ) )
        printspeech( var_1 );

    var_2 = var_0 + "_r";
    level.car thread maps\_utility::play_sound_on_entity( var_2 );
}

playalasadspeech( var_0, var_1 )
{
    if ( isdefined( var_1 ) )
        printspeech( var_1 );

    level.alasad thread maps\_utility::play_sound_on_entity( var_0 );
}

randomizeguardcharacter()
{
    var_0 = self getattachsize();
    var_1 = [];
    var_2 = [];

    for ( var_3 = 0; var_3 < var_0; var_3++ )
    {
        var_1[var_3] = self getattachmodelname( var_3 );
        var_2[var_3] = self getattachtagname( var_3 );
    }

    for ( var_3 = 0; var_3 < var_0; var_3++ )
    {
        if ( var_2[var_3] != "tag_weapon_right" )
            self detach( var_1[var_3], var_2[var_3] );
    }

    self.hatmodel = undefined;
    self.headmodel = undefined;

    // switch ( randomint( 6 ) )
    // {
    //     case 0:
    //         character\character_sp_arab_regular_asad::main();
    //         break;
    //     case 1:
    //         character\character_sp_arab_regular_sadiq::main();
    //         break;
    //     case 2:
    //         character\character_sp_arab_regular_ski_mask::main();
    //         break;
    //     case 3:
    //         character\character_sp_arab_regular_ski_mask2::main();
    //         break;
    //     case 4:
    //         character\character_sp_arab_regular_suren::main();
    //         break;
    //     case 5:
    //         character\character_sp_arab_regular_yasir::main();
    //         break;
    // }
    character\gfl\randomizer_sf::main();
}

setcurbstompcharacter()
{
    var_0 = self getattachsize();
    var_1 = [];
    var_2 = [];

    for ( var_3 = 0; var_3 < var_0; var_3++ )
    {
        var_1[var_3] = self getattachmodelname( var_3 );
        var_2[var_3] = self getattachtagname( var_3 );
    }

    for ( var_3 = 0; var_3 < var_0; var_3++ )
    {
        if ( var_2[var_3] != "tag_weapon_right" )
            self detach( var_1[var_3], var_2[var_3] );
    }

    // character\character_sp_arab_regular_yasir::main();
    character\gfl\character_gfl_ouroboros::main();
}

lerpshadowdetail( var_0, var_1 )
{
    var_2 = getdvarint( "sm_sunSampleSizeNear" );
    var_1 *= 20;
    var_3 = [];

    for ( var_4 = 0; var_4 < var_1; var_4++ )
    {
        var_5 = var_4 / var_1;
        var_6 = var_0 * var_5 + var_2 * ( 1 - var_5 );
        setsaveddvar( "sm_sunSampleSizeNear", var_6 );
        wait 0.05;
    }

    setsaveddvar( "sm_sunSampleSizeNear", var_0 );
}

playlinkedsound( var_0 )
{
    var_1 = spawn( "script_origin", ( 0.0, 0.0, 0.0 ) );
    var_1.origin = self.origin;
    var_1.angles = self.angles;
    var_1 linkto( self );
    var_1 thread maps\_utility::play_sound_on_tag( var_0, undefined, 1 );
    return var_1;
}

fake_tag( var_0, var_1, var_2 )
{
    if ( !isdefined( var_1 ) )
        var_1 = ( 0.0, 0.0, 0.0 );

    if ( !isdefined( var_2 ) )
        var_2 = ( 0.0, 0.0, 0.0 );

    var_3 = spawn( "script_model", self.origin );
    var_3 setmodel( "tag_origin" );
    var_3 hide();
    var_3 linkto( self, var_0, var_1, var_2 );
    thread fake_tag_destroy( var_3 );
    return var_3;
}

fake_tag_destroy( var_0 )
{
    self waittill( "death" );
    var_0 delete();
}

opfor_swaphead_for_facialanim()
{
    // if ( isdefined( self.headmodel ) )
    // {
    //     if ( self.headmodel == "head_sp_arab_regular_ski_mask" || self.headmodel == "head_sp_arab_regular_mowrap" )
    //     {
    //         var_0 = [];
    //         var_0[0] = "head_sp_arab_regular_asad";
    //         var_0[1] = "head_sp_arab_regular_sadiq";
    //         var_0[2] = "head_sp_arab_regular_suren";
    //         var_1 = [];
    //         var_1[0] = "helmet_sp_arab_regular_asad";
    //         var_1[1] = "helmet_sp_arab_regular_sadiq";
    //         var_1[2] = "helmet_sp_arab_regular_suren";
    //         var_2 = randomint( 3 );
    //         self detach( self.headmodel );
    //         self attach( var_0[var_2], "", 1 );
    //         self.headmodel = var_0[var_2];
    //         self attach( var_1[var_2] );
    //         self.hatmodel = var_1[var_2];
    //     }
    // }
}

play_anim_on_ropehands( var_0, var_1 )
{
    var_2 = var_0 + "_ropehands";
    level.handsrope show();

    if ( var_1 )
        level.handsrope linkto( level.playerview );

    maps\_anim::anim_single_solo( level.handsrope, var_2 );

    if ( var_1 )
        level.handsrope unlink();
}

update_handsrope_lighting_origin()
{
    level endon( "handsrope_deleted" );

    for (;;)
    {
        var_0 = level.car.origin + ( 0.0, 0.0, 36.0 );
        level.handsrope overridelightingorigin( var_0 );
        wait 0.05;
    }
}
