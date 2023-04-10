// H1 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

dead_script()
{
    common_scripts\_ca_blockout::init();
    level.jumpto = "";
    maps\cargoship_precache::main();
    maps\createfx\cargoship_fx::main();
    maps\createfx\cargoship_sound::main();
    maps\createfx\cargoship_audio::main();
    maps\_load::main();
    maps\cargoship_anim::main();
    level thread maps\cargoship_amb::main();
    maps\cargoship_lighting::main();
    fastrope_start();
}

fastrope_start()
{
    var_0 = getnode( "seat1", "targetname" );
    level.player setorigin( var_0.origin );
    level.player setplayerangles( var_0.angles );
}

hacks_for_e3_gameplay_video()
{
    if ( getdvarint( "e3_cargoship_gameplay_video", 0 ) == 0 )
        return;

    setsaveddvar( "g_friendlyNameDist", 0 );

    if ( level.player getlocalplayerprofiledata( "subtitles" ) != 0 )
        return;
}

main()
{
    if ( getdvar( "beautiful_corner" ) == "1" )
    {
        dead_script();
        return;
    }

    level.fogvalue["near"] = 100;
    level.fogvalue["half"] = 15000;
    level.fogvalue["r"] = 0.0;
    level.fogvalue["g"] = 0.0;
    level.fogvalue["b"] = 0.0;
    level.fogvalue["near"] = 100;
    level.fogvalue["half"] = 4000;
    maps\_utility::add_start( "bridge", ::misc_dummy, &"STARTS_BRIDGE" );
    maps\_utility::add_start( "deck", ::misc_dummy, &"STARTS_DECK" );
    maps\_utility::add_start( "hallways", ::misc_dummy, &"STARTS_HALLWAYS" );
    maps\_utility::add_start( "cargohold", ::misc_dummy, &"STARTS_CARGOHOLD" );
    maps\_utility::add_start( "cargohold2", ::misc_dummy, &"STARTS_CARGOHOLD2" );
    maps\_utility::add_start( "laststand", ::misc_dummy, &"STARTS_LASTSTAND" );
    maps\_utility::add_start( "package", ::misc_dummy, &"STARTS_PACKAGE" );
    maps\_utility::add_start( "escape", ::misc_dummy, &"STARTS_ESCAPE" );
    maps\_utility::add_start( "end", ::misc_dummy, &"STARTS_END" );
    setsaveddvar( "compassmaxrange", 1500 );
    level.missionfailedquote = [];
    level.missionfailedquote["slow"] = &"CARGOSHIP_YOU_WERENT_FAST_ENOUGH";
    level.missionfailedquote["wrongway"] = &"CARGOSHIP_YOU_WENT_THE_WRONG_WAY";
    level.missionfailedquote["jump1"] = &"CARGOSHIP_NOBODY_MAKES_THEIR_FIRST";
    level.missionfailedquote["jump2"] = &"CARGOSHIP_NOBODY_MAKES_THEIR_SECOND";
    level.missionfailedquote["jump3"] = &"CARGOSHIP_NOBODY_MAKES_THEIR_THIRD";
    level.missionfailedquote["jump"] = &"CARGOSHIP_NOBODY_MAKES_THEIR_JUMP";
    level.missionfailedquote["escape"] = level.missionfailedquote["slow"];

    if ( getdvar( "limited_mode" ) == "1" )
        setdvar( "ui_deadquote", "" );

    level.maskiscracked = 0;
    setdvarifuninitialized( "showGasMaskCracks", "1" );
    var_0 = getarraykeys( level.missionfailedquote );

    for ( var_1 = 0; var_1 < var_0.size; var_1++ )
        precachestring( level.missionfailedquote[var_0[var_1]] );

    precachestring( &"CARGOSHIP_INFINITY_WARD_PRESENTS" );
    level.start_point = "default";
    maps\cargoship_code::jumptoinit();
    vehicle_scripts\_seaknight::main( "vehicle_ch46e_opened_door_interior_a", "seaknight", "script_vehicle_seaknight" );
    vehicle_scripts\_blackhawk::main( "vehicle_blackhawk_hero_sas_night", undefined, "script_vehicle_blackhawk" );
    level.weaponclipmodels = [];
    level.weaponclipmodels[0] = "weapon_mp5_clip";
    level.weaponclipmodels[1] = "weapon_m16_clip";
    level.weaponclipmodels[2] = "weapon_ak47_clip";
    level.weaponclipmodels[3] = "weapon_ak74u_clip";
    level.maskcracksfx = undefined;
    maps\cargoship_precache::main();
    maps\cargoship_fx::main();
    maps\createfx\cargoship_audio::main();
    thread common_scripts\_pipes::main();
    thread maps\_leak::main();
    thread misc_pipe_fx_maximum();
    var_2 = getent( "sea", "targetname" );
    var_3 = getentarray( "sink_waterlevel", "targetname" );

    if ( getdvar( "r_reflectionProbeGenerate" ) == "1" )
    {
        var_2 hide();

        for ( var_1 = 0; var_1 < var_3.size; var_1++ )
            var_3[var_1] hide();
    }

    maps\createart\cargoship_art::main();
    maps\createfx\cargoship_fx::main();
    maps\createfx\cargoship_sound::main();
    maps\_load::main();
    initflags();
    maps\cargoship_anim::main();
    maps\cargoship_aud::main();
    maps\cargoship_lighting::main();
    maps\_compass::setupminimap( "compass_map_cargoship" );
    maps\mo_globals::main( "cargoship" );
    maps\cargoship_code::water_stuff_for_art1();
    maps\_sea::main();
    maps\mo_fastrope::main();
    level thread maps\cargoship_amb::main();
    hacks_for_e3_gameplay_video();
    thread boxes_in_the_wind();
    var_4 = getentarray( "fryingpanfall", "targetname" );
    common_scripts\utility::array_thread( var_4, ::frying_pan_fall );
    common_scripts\utility::array_thread( getentarray( "stairs", "targetname" ), maps\cargoship_code::stairs );
    common_scripts\utility::array_thread( getentarray( "computer_des", "targetname" ), ::computer_destructible );
    thread maps\_wibble::setup_wibble_triggers( 0, "at_bridge", "exterior", 1, 1 );
    maps\_utility::set_console_status();
    misc_precacheinit();
    misc_setup();
    maps\_hud_util::create_mantle();
    thread initial_setup();
    thread objective_main();
    thread maps\cargoship_code::jumptothink();
    thread maps\cargoship_code::deck_light_shadow_hack();
    thread desert_storm_init();
    thread maps\cargoship_code::water_stuff_for_art2( 2 );

    switch ( level.jumptosection )
    {
        case "bridge":
            bridge_main();
        case "deck":
            deck_main();
        case "hallways":
            hallways_main();
        case "cargohold":
            cargohold_main();
        case "cargohold2":
            thread cargohold2_main();
        case "laststand":
            laststand_main();
        case "package":
            package_main();
        case "escape":
            escape_main();
    }
}

cargoship_disablealliesreload()
{
    level.heroes3["alavi"].noreload = 1;
    level.heroes3["price"].noreload = 1;
    level.heroes3["grigsby"].noreload = 1;
}

cargoship_enablealliesreload()
{
    level.heroes3["alavi"].noreload = undefined;
    level.heroes3["price"].noreload = undefined;
    level.heroes3["grigsby"].noreload = undefined;
}

cargoship_heroes5_disablepain()
{
    level.heroes5["alavi"].a.disablepain = 1;
    level.heroes5["alavi"].allowpain = 0;
    level.heroes5["alavi"] setisignoringgrenades( 1 );
    level.heroes5["alavi"].ignoresuppression = 1;
    level.heroes5["price"].a.disablepain = 1;
    level.heroes5["price"].allowpain = 0;
    level.heroes5["price"] setisignoringgrenades( 1 );
    level.heroes5["price"].ignoresuppression = 1;
    level.heroes5["grigsby"].a.disablepain = 1;
    level.heroes5["grigsby"].allowpain = 0;
    level.heroes5["grigsby"] setisignoringgrenades( 1 );
    level.heroes5["grigsby"].ignoresuppression = 1;
    level.heroes5["seat5"].a.disablepain = 1;
    level.heroes5["seat5"].allowpain = 0;
    level.heroes5["seat5"] setisignoringgrenades( 1 );
    level.heroes5["seat5"].ignoresuppression = 1;
    level.heroes5["seat6"].a.disablepain = 1;
    level.heroes5["seat6"].allowpain = 0;
    level.heroes5["seat6"] setisignoringgrenades( 1 );
    level.heroes5["seat6"].ignoresuppression = 1;
}

cargoship_heroes5_enablepain()
{
    level.heroes5["alavi"].a.disablepain = 0;
    level.heroes5["alavi"].allowpain = 1;
    level.heroes5["alavi"] setisignoringgrenades( 0 );
    level.heroes5["alavi"].ignoresuppression = 0;
    level.heroes5["price"].a.disablepain = 0;
    level.heroes5["price"].allowpain = 1;
    level.heroes5["price"] setisignoringgrenades( 0 );
    level.heroes5["price"].ignoresuppression = 0;
    level.heroes5["grigsby"].a.disablepain = 0;
    level.heroes5["grigsby"].allowpain = 1;
    level.heroes5["grigsby"] setisignoringgrenades( 0 );
    level.heroes5["grigsby"].ignoresuppression = 0;
    level.heroes5["seat5"].a.disablepain = 0;
    level.heroes5["seat5"].allowpain = 1;
    level.heroes5["seat5"] setisignoringgrenades( 0 );
    level.heroes5["seat5"].ignoresuppression = 0;
    level.heroes5["seat6"].a.disablepain = 0;
    level.heroes5["seat6"].allowpain = 1;
    level.heroes5["seat6"] setisignoringgrenades( 0 );
    level.heroes5["seat6"].ignoresuppression = 0;
}

filterzone()
{
    for (;;)
    {
        self waittill( "trigger", var_0 );

        if ( isalive( var_0 ) && isdefined( self ) && var_0 istouching( self ) )
        {
            soundscripts\_audio_zone_manager::azm_set_filter_bypass( 1 );
            soundscripts\_snd_filters::snd_fade_in_filter( "deck_rain_filter", 0.5 );
            soundscripts\_audio_mix_manager::mm_add_submix( "mix_deck_rain", 0.5 );
        }

        while ( isalive( var_0 ) && isdefined( self ) && var_0 istouching( self ) )
            wait 0.25;

        soundscripts\_snd_filters::snd_fade_out_filter( 2 );
        soundscripts\_audio_zone_manager::azm_set_filter_bypass( 0 );
        soundscripts\_audio_mix_manager::mm_clear_submix( "mix_deck_rain", 0.5 );
    }
}

initflags()
{
    common_scripts\utility::flag_init( "at_bridge" );
    common_scripts\utility::flag_init( "bridge_landing" );
    common_scripts\utility::flag_init( "bridgefight" );
    common_scripts\utility::flag_init( "sweet_dreams" );
    common_scripts\utility::flag_init( "quarters" );
    common_scripts\utility::flag_init( "quarters_drunk_spawned" );
    common_scripts\utility::flag_init( "quarters_drunk_ready" );
    common_scripts\utility::flag_init( "price_at_top_of_stairs" );
    common_scripts\utility::flag_init( "quarters_price_says_clear" );
    common_scripts\utility::flag_init( "quarters_sleepers_dead" );
    common_scripts\utility::flag_init( "deck_heli" );
    common_scripts\utility::flag_init( "walk_deck" );
    common_scripts\utility::flag_init( "deck_enemies_spawned" );
    common_scripts\utility::flag_init( "deck_windows" );
    common_scripts\utility::flag_init( "windows_got_company_line_before" );
    common_scripts\utility::flag_init( "windows_got_company_line" );
    common_scripts\utility::flag_init( "heli_shoot_deck_windows" );
    common_scripts\utility::flag_init( "hallways" );
    common_scripts\utility::flag_init( "hallways_lower_runners1" );
    common_scripts\utility::flag_init( "hallways_lower_runners2" );
    common_scripts\utility::flag_init( "hallways_lowerhall_guys" );
    common_scripts\utility::flag_init( "hallways_moveup" );
    common_scripts\utility::flag_init( "cargoholds_1_enter_clear" );
    common_scripts\utility::flag_init( "pulp_fiction_guy" );
    common_scripts\utility::flag_init( "cargoholds2" );
    common_scripts\utility::flag_init( "cargoholds2_breach" );
    common_scripts\utility::flag_init( "cargohold2_enemies" );
    common_scripts\utility::flag_init( "cargohold2_enemies2" );
    common_scripts\utility::flag_init( "cargohold2_enemies_dead" );
    common_scripts\utility::flag_init( "laststand" );
    common_scripts\utility::flag_init( "laststand_3left" );
    common_scripts\utility::flag_init( "package" );
    common_scripts\utility::flag_init( "package_enter" );
    common_scripts\utility::flag_init( "package_report" );
    common_scripts\utility::flag_init( "package_reading" );
    common_scripts\utility::flag_init( "found_package" );
    common_scripts\utility::flag_init( "package_orders" );
    common_scripts\utility::flag_init( "package_secure" );
    common_scripts\utility::flag_init( "package_open_doors" );
    common_scripts\utility::flag_init( "strong_reading" );
    common_scripts\utility::flag_init( "escape" );
    common_scripts\utility::flag_init( "escape_cargohold2_fx" );
    common_scripts\utility::flag_init( "start_sinking_boat" );
    common_scripts\utility::flag_init( "escape_explosion" );
    common_scripts\utility::flag_init( "escape_get_to_catwalks" );
    common_scripts\utility::flag_init( "escape_get_to_catwalks_gaz_alavi" );
    common_scripts\utility::flag_init( "escape_get_to_catwalks_price" );
    common_scripts\utility::flag_init( "escape_death_cargohold2" );
    common_scripts\utility::flag_init( "escape_death_cargohold1" );
    common_scripts\utility::flag_init( "escape_death_hallways_lower" );
    common_scripts\utility::flag_init( "escape_death_hallways_upper" );
    common_scripts\utility::flag_init( "escape_death_deck" );
    common_scripts\utility::flag_init( "escape_player_rescue" );
    common_scripts\utility::flag_init( "escape_seaknight_ready" );
    common_scripts\utility::flag_init( "cargoship_end_music" );
    common_scripts\utility::flag_init( "end_start_player_anim" );
    common_scripts\utility::flag_init( "end_linked_player_to_rig" );
    common_scripts\utility::flag_init( "end_seaknight_leaving" );
    common_scripts\utility::flag_init( "end_price_rescue_anim" );
    common_scripts\utility::flag_init( "end_no_jump" );
    common_scripts\utility::flag_init( "end_finished" );
    common_scripts\utility::flag_init( "end_screen_done" );
    common_scripts\utility::flag_init( "gotcha" );
    common_scripts\utility::flag_init( "player_rescued" );
    common_scripts\utility::flag_init( "nothing" );
    common_scripts\utility::flag_init( "topside_fx" );
    common_scripts\utility::flag_set( "topside_fx" );
    common_scripts\utility::flag_init( "cargohold_fx" );
    common_scripts\utility::flag_init( "heroes_ready" );
    common_scripts\utility::flag_init( "nade_hint" );
    common_scripts\utility::flag_init( "crouch_hint" );
    common_scripts\utility::flag_init( "stand_hint" );
    common_scripts\utility::flag_init( "music_tension_notime" );
    common_scripts\utility::flag_init( "shellshock_blinking" );
    common_scripts\utility::flag_init( "shellshock_blur" );
    common_scripts\utility::flag_init( "heli_light_on" );
    common_scripts\utility::flag_init( "heli_light_triggers" );
    common_scripts\utility::flag_init( "heli_light_optimize" );
    common_scripts\utility::flag_init( "price_package_ready" );
    common_scripts\utility::flag_init( "radiomessage_notime" );
    common_scripts\utility::flag_init( "escape_exterior_visionset" );
    common_scripts\utility::flag_init( "escape_alavi_start_rescue" );
    common_scripts\utility::flag_init( "escape_gaz_start_rescue" );
    common_scripts\utility::flag_init( "escape_price_start_rescue" );
    common_scripts\utility::flag_init( "escape_alavi_loading" );
    common_scripts\utility::flag_init( "final_sun_direction" );
    common_scripts\utility::flag_init( "deck_light_shadow" );
}

#using_animtree("generic_human");

initial_setup()
{
    soundscripts\_snd::snd_message( "aud_start_checkpoint" );
    var_0 = getentarray( "intro_spawners", "target" );
    var_1 = var_0[0].targetname;
    level.heli = level.fastrope_globals.helicopters[maps\mo_fastrope::fastrope_heliname( var_1 )];
    level.heli.heightsea = 150;
    level.heli initial_setup_vehicle_override();
    level.heli maps\mo_fastrope::fastrope_ropeanimload( undefined, undefined, "right", %h1_cargoship_blackhawk_opening_fastrope_80ft );
    level.heli maps\mo_fastrope::fastrope_ropeanimload( %bh_rope_idle_le, %h1_cargoship_blackhawk_drop_fastrope_80ft, "left" );

    if ( level.jumpto != "start" )
    {
        level.heli maps\mo_fastrope::fastrope_override( 1, undefined, %cs_bh_1_idle_start, %cs_bh_1_drop );
        level.heli maps\mo_fastrope::fastrope_override( 2, undefined, %cs_bh_2_idle_start, %cs_bh_2_drop );
    }
    else
    {
        level.heli maps\mo_fastrope::fastrope_override( 1, %cargoship_opening_position1 );
        level.heli maps\mo_fastrope::fastrope_override( 2, %cargoship_opening_price );
    }

    level.heli maps\mo_fastrope::fastrope_override( 4, undefined, %bh_idle_start_guy2, %bh_4_drop );
    level.heli maps\mo_fastrope::fastrope_override( 5, undefined, undefined, %bh_5_drop );
    level.heli maps\mo_fastrope::fastrope_override( 6, undefined, %bh_idle_start_guy1, %bh_6_drop );
    level.heli maps\mo_fastrope::fastrope_override( 9, undefined, %bh_crew_idle_guy1 );
    level.heli maps\mo_fastrope::fastrope_override( 10, undefined, %bh_crew_idle_guy2 );
    var_2 = getentarray( "deck_rain_filter", "targetname" );
    common_scripts\utility::array_thread( var_2, ::filterzone );
    var_3 = getent( "intro_spawners", "targetname" );
    var_3 notify( "trigger" );
    wait 0.1;
    level notify( "level heli ready" );
    level.heli.model maps\cargoship_code::heli_minigun_attach( "left" );
    var_4 = spawn( "script_model", level.heli.model gettagorigin( "body_animate_jnt" ) );
    var_4 setmodel( "vehicle_blackhawk_hero_sas_night_interior" );
    var_4.angles = level.heli.model.angles;
    var_4 linkto( level.heli.model, "body_animate_jnt" );
    var_4.animname = "blackhawk";
    var_4 maps\_anim::setanimtree();
    var_4 thread maps\_anim::anim_loop_solo( var_4, "interiorwires" );
    var_5 = getaiarray( "allies" );
    level.heroes7 = [];
    level.heroes5 = [];
    level.heroes3 = [];

    for ( var_6 = 0; var_6 < var_5.size; var_6++ )
    {
        switch ( var_5[var_6].seat_pos )
        {
            case 1:
                level.heroes7["alavi"] = var_5[var_6];
                continue;
            case 2:
                level.heroes7["price"] = var_5[var_6];
                continue;
            case 4:
                level.heroes7["grigsby"] = var_5[var_6];
                continue;
            case 9:
                level.heroes7["pilot"] = var_5[var_6];
                continue;
            case 10:
                level.heroes7["copilot"] = var_5[var_6];
                continue;
            case 5:
                level.heroes7["seat5"] = var_5[var_6];
                continue;
            case 6:
                level.heroes7["seat6"] = var_5[var_6];
                continue;
        }
    }

    level.heroes7["copilot"] maps\_utility::gun_remove();
    level.heroes7["copilot"] maps\_utility::disable_ai_color();
    level.heroes7["pilot"] maps\_utility::gun_remove();
    level.heroes7["pilot"] maps\_utility::disable_ai_color();
    level.heroes7["pilot"] common_scripts\utility::hide_friendname_until_flag_or_notify( "end_screen_done" );
    level.heroes7["copilot"] common_scripts\utility::hide_friendname_until_flag_or_notify( "end_screen_done" );
    level.heroes5["alavi"] = level.heroes7["alavi"];
    level.heroes5["price"] = level.heroes7["price"];
    level.heroes5["grigsby"] = level.heroes7["grigsby"];
    level.heroes5["seat5"] = level.heroes7["seat5"];
    level.heroes5["seat6"] = level.heroes7["seat6"];
    level.heroes3["alavi"] = level.heroes5["alavi"];
    level.heroes3["price"] = level.heroes5["price"];
    level.heroes3["grigsby"] = level.heroes5["grigsby"];
    createthreatbiasgroup( "price" );
    createthreatbiasgroup( "alavi" );
    createthreatbiasgroup( "grigsby" );
    createthreatbiasgroup( "seat5" );
    createthreatbiasgroup( "seat6" );
    createthreatbiasgroup( "player" );
    level.heroes5["price"].cgo_old_accuracy = level.heroes5["price"].accuracy;
    level.heroes5["price"].cgo_old_baseaccuracy = level.heroes5["price"].baseaccuracy;
    level.heroes5["price"].accuracy = 1000;
    level.heroes5["price"].baseaccuracy = 1000;
    level.heroes5["price"].fixednode = 0;
    level.heroes5["price"].script_noteworthy = "price";
    level.heroes5["price"] setthreatbiasgroup( "price" );
    level.heroes5["price"].grenadeammo = 0;
    level.heroes5["price"].ignoresuppression = 1;
    level.heroes5["price"] maps\_utility::setflashbangimmunity( 1 );
    level.price_normal_headmodel = level.heroes5["price"].headmodel;
    level.heroes5["alavi"].cgo_old_accuracy = level.heroes5["alavi"].accuracy;
    level.heroes5["alavi"].cgo_old_baseaccuracy = level.heroes5["alavi"].baseaccuracy;
    level.heroes5["alavi"].accuracy = 1000;
    level.heroes5["alavi"].baseaccuracy = 1000;
    level.heroes5["alavi"].fixednode = 0;
    level.heroes5["alavi"].script_noteworthy = "alavi";
    level.heroes5["alavi"] setthreatbiasgroup( "alavi" );
    level.heroes5["alavi"].grenadeammo = 0;
    level.heroes5["alavi"].ignoresuppression = 1;
    level.heroes5["alavi"] maps\_utility::setflashbangimmunity( 1 );
    level.heroes5["grigsby"].cgo_old_accuracy = level.heroes5["grigsby"].accuracy;
    level.heroes5["grigsby"].cgo_old_baseaccuracy = level.heroes5["grigsby"].baseaccuracy;
    level.heroes5["grigsby"].accuracy = 1000;
    level.heroes5["grigsby"].baseaccuracy = 1000;
    level.heroes5["grigsby"].fixednode = 0;
    level.heroes5["grigsby"].script_noteworthy = "grigsby";
    level.heroes5["grigsby"] setthreatbiasgroup( "grigsby" );
    level.heroes5["grigsby"].grenadeammo = 0;
    level.heroes5["grigsby"].ignoresuppression = 1;
    level.heroes5["grigsby"] maps\_utility::setflashbangimmunity( 1 );
    level.heroes5["seat5"].accuracy = 1000;
    level.heroes5["seat5"].baseaccuracy = 1000;
    level.heroes5["seat5"].fixednode = 0;
    level.heroes5["seat5"].script_noteworthy = "seat5";
    level.heroes5["seat5"] setthreatbiasgroup( "seat5" );
    level.heroes5["seat5"].grenadeammo = 0;
    level.heroes5["seat5"].ignoresuppression = 1;
    level.heroes5["seat5"] maps\_utility::disable_ai_color();
    level.heroes5["seat5"] maps\_utility::setflashbangimmunity( 1 );
    level.heroes5["seat5"].name = "Sgt. Wallcroft";
    level.heroes5["seat6"].accuracy = 1000;
    level.heroes5["seat6"].baseaccuracy = 1000;
    level.heroes5["seat6"].fixednode = 0;
    level.heroes5["seat6"].script_noteworthy = "seat6";
    level.heroes5["seat6"] setthreatbiasgroup( "seat6" );
    level.heroes5["seat6"].grenadeammo = 0;
    level.heroes5["seat6"].ignoresuppression = 1;
    level.heroes5["seat6"] maps\_utility::disable_ai_color();
    level.heroes5["seat6"] maps\_utility::setflashbangimmunity( 1 );
    thread intro_movie_hack();
    level.player.script_noteworthy = "player";
    level.player setthreatbiasgroup( "player" );
    common_scripts\utility::flag_set( "heroes_ready" );
}

intro_movie_hack()
{
    level.heroes5["seat6"].name = "";
    level waittill( "intro_movie_done" );
    level.heroes5["seat6"].name = "Pvt. Griffen";
}

#using_animtree("vehicles");

initial_setup_vehicle_override()
{
    var_0 = common_scripts\utility::getstruct( "intro_ride_node", "targetname" );
    maps\mo_fastrope::fastrope_override_vehicle( %bh_cargo_path, var_0 );
}

bridge_main()
{
    switch ( level.jumpto )
    {
        case "start":
            maps\_utility::musicplaywrapper( "cargoship_intro_music" );
            thread common_scripts\utility::play_sound_in_space( "scn_cargoship_intro_helicopter", level.player.origin );
            setsaveddvar( "ai_friendlyFireBlockDuration", 250 );
            thread bridge_intro();
            thread bridge_intro_thunder();
            thread bridge_heroes();
            thread bridge_heli_1();
            thread start_physical_dof();
        case "bridge":
            thread bridge_setup();
            thread bridge_heli_2();
            thread bridge_standoff();
        case "quarters":
            quarters_prepare_door_for_breach();
            common_scripts\utility::flag_wait( "quarters" );
            common_scripts\utility::flag_set( "_sea_waves" );
            thread quarters_sleeping();
            thread quarters_dialogue();
            thread quarters_player_speed();
            quarters();
    }
}

bridge_intro_thunder()
{
    thread maps\cargoship_fx::normal();
    wait 5;
    thread maps\_weather::lightningflash( maps\cargoship_fx::normal, maps\cargoship_fx::flash );
    wait 10;
    thread maps\_weather::lightningflash( maps\cargoship_fx::normal, maps\cargoship_fx::flash );
    wait 4;
    maps\_weather::lightningflash( maps\cargoship_fx::normal, maps\cargoship_fx::flash );
    wait 1;
    maps\_weather::lightningflash( maps\cargoship_fx::normal, maps\cargoship_fx::flash );
    wait 0.5;
    maps\_weather::lightningflash( maps\cargoship_fx::normal, maps\cargoship_fx::flash );
}

bridge_intro()
{
    thread intro_heli_rain_fx();
    common_scripts\utility::flag_set( "cargoship_ocean_scenario_start" );
    level._sea_scale = 2;
    wait 10;
    wait 12;
    level._sea_scale = 1.5;
    wait 4;
    common_scripts\utility::flag_clear( "_sea_bob" );
    wait 12;
    common_scripts\utility::flag_set( "_sea_viewbob" );
    common_scripts\utility::flag_set( "_sea_bob" );
}

intro_heli_rain_fx()
{
    common_scripts\utility::flag_wait( "heroes_ready" );
    var_0 = level.heli.model;
    var_0 maps\mo_fastrope::fastrope_heli_playinteriorlightgreenfx( 1 );
    common_scripts\utility::flag_wait( "topside_fx" );
    wait 1;
    common_scripts\utility::flag_clear( "player_weather_enabled" );
    playfxontag( level._effect["rain_heavy_mist_heli_hack"], var_0, "tag_deathfx" );
    common_scripts\utility::flag_wait( "player_weather_enabled" );
    stopfxontag( level._effect["rain_heavy_mist_heli_hack"], var_0, "tag_deathfx" );
}

start_global_rain()
{
    wait 3.6;
    common_scripts\utility::flag_set( "player_weather_enabled" );
}

bridge_setup()
{
    var_0 = [];
    var_0[var_0.size] = getent( "stair_bottom_save", "script_noteworthy" );
    var_0 = common_scripts\utility::array_combine( var_0, getentarray( "bridge_flags", "script_noteworthy" ) );
    common_scripts\utility::array_thread( var_0, common_scripts\utility::trigger_off );
    level waittill( "level heli ready" );
    thread maps\_utility::battlechatter_off();
    var_1 = getaiarray( "allies" );

    for ( var_2 = 0; var_2 < var_1.size; var_2++ )
    {
        if ( isdefined( var_1[var_2].spawner.nounload ) && var_1[var_2].spawner.nounload == 1 )
            continue;

        var_3 = getnode( "seat" + var_1[var_2].seat_pos, "targetname" );
        var_1[var_2] setgoalnode( var_3 );
        var_1[var_2].goalradius = 32;
        var_1[var_2].ignoresuppression = 1;
        var_1[var_2].suppressionwait = 0;
    }

    level.heli.vehicle waittill( "reached_wait_node" );
    common_scripts\utility::flag_set( "at_bridge" );
    thread maps\cargoship_fx::flash( 2, 4, 2, 3, ( -25.0, -160.0, 0.0 ) );
    level.player thread maps\_utility::play_sound_on_entity( "elm_thunder_distant" );
    level.player thread maps\_utility::play_sound_on_entity( "elm_thunder_strike" );
    wait 4.5;
    thread maps\cargoship_fx::flash( 3, 4, 2, 3, ( -25.0, -110.0, 0.0 ) );
    level.player thread maps\_utility::play_sound_on_entity( "elm_thunder_distant" );
    level.player thread maps\_utility::play_sound_on_entity( "elm_thunder_strike" );
}

bridge_heli_1()
{
    level waittill( "level heli ready" );
    var_0 = spawn( "script_model", level.heli.model gettagorigin( "main_rotor_jnt" ) );
    var_0 setmodel( level.heli.modelname );
    var_0.angles = level.heli.model.angles;
    var_0 linkto( level.heli.model );
    var_0 hide();
    var_0 setcontents( 0 );
    var_0 thread maps\mo_fastrope::fastrope_heli_playexteriorlightfx();
    var_0 maps\mo_fastrope::fastrope_heli_playinteriorlightfx();
    level waittill( "going_dark" );
    wait 0.5;
    var_0 delete();
    wait 1.5;
    level.heli.vehicle waittill( "reached_wait_node" );
    wait 5;
}

bridge_heli_2()
{
    level waittill( "level heli ready" );

    if ( level.jumpto == "start" )
    {
        wait 29;
        level.heli.vehicle notify( "fake_wait_node" );
        maps\_utility::delaythread( 7.8, soundscripts\_snd::snd_message, "aud_stop_intro_mix" );
    }

    level.heli.model thread maps\mo_fastrope::fastrope_heli_playexteriorlightfx();
    level.heli.model thread maps\mo_fastrope::fastrope_heli_playinteriorlightfx2();
    thread start_global_rain();

    if ( level.jumpto == "start" )
        level.heli maps\mo_fastrope::fastrope_heli_overtake();
    else
        level waittill( "bridge_jumpto_done" );

    thread bridge_heli_3();
    common_scripts\utility::flag_set( "cargoship_rain_on" );
    common_scripts\utility::flag_set( "cargoship_ocean_scenario_end" );
    wait 4;
    level.heli.model maps\cargoship_code::heli_searchlight_on();
    var_0 = spawn( "script_origin", ( 3184.0, 152.0, 364.0 ) );
    var_0.targetname = "bridge_fake_spottarget";
    level.heli.model thread maps\cargoship_code::heli_searchlight_target( "targetname", "bridge_fake_spottarget" );
    wait 1;
    var_0 moveto( ( 2896.0, -232.0, 364.0 ), 4, 1, 1 );
    thread maps\cargoship_code::heli_searchlight_bridge();
}

bridge_heli_3()
{
    level endon( "price_wait_at_stairs" );
    level.heli.vehicle sethoverparams( 32, 10, 3 );
    level.heli.vehicle clearlookatent();
    var_0 = common_scripts\utility::getstruct( "heli_bridge_node", "targetname" );
    level.heli.vehicle vehicle_setspeed( 15, 10, 10 );
    level.heli.vehicle setlookatent( level.heroes5["price"] );
    maps\cargoship_code::heli_flypath( var_0 );
}

grigs_clip_handoff( var_0 )
{
    self attach( "weapon_mp5_clip", "tag_inhand" );
    self waittillmatch( "single anim", "clip delete" );
    self detach( "weapon_mp5_clip", "tag_inhand" );
    var_0 attach( "weapon_mp5_clip", "tag_inhand" );
    wait 2;
    var_0 detach( "weapon_mp5_clip", "tag_inhand" );
}

bridge_heroes()
{
    common_scripts\utility::flag_wait( "heroes_ready" );
    var_0 = spawn( "script_model", level.heroes5["price"] gettagorigin( "tag_inhand" ) );
    var_0.angles = level.heroes5["price"] gettagangles( "tag_inhand" );
    var_0 linkto( level.heroes5["price"], "tag_inhand" );
    var_0 setmodel( "prop_price_cigar" );
    playfxontag( level._effect["cigar_glow"], var_0, "tag_cigarglow", level.heli.vehicle );
    playfxontag( level._effect["cigarsmoke_wind_vf"], level.heli.model, "tag_deathfx" );
    level.heroes5["price"] thread maps\cargoship_code::pricecigarpufffx( var_0 );
    level.heroes5["price"] thread maps\cargoship_code::pricecigarexhalefx( var_0 );
    thread maps\cargoship_code::cigar_embers_burst( var_0 );
    var_0 thread maps\cargoship_code::pricecigardelete();
    level.heroes5["grigsby"] thread grigs_clip_handoff( level.heroes7["seat6"] );
    wait 1;
    maps\_utility::delaythread( 1, maps\cargoship_code::orient_cameraviewangles_helicopterstart );
    maps\mo_tools::radio_msg_stack( "cargoship_hp1_baseplatehammertwo" );
    maps\mo_tools::radio_msg_stack( "cargoship_hqr_copytwofour" );
    wait 5;
    level notify( "going_dark" );
    maps\mo_tools::radio_msg_stack( "cargoship_hp1_thirtysecdark" );
    wait 8;
    maps\mo_tools::radio_msg_stack( "cargoship_hp1_tensecondsradio" );
    wait 1;
    thread maps\mo_tools::radio_msg_stack( "cargoship_hp1_radiocheck" );
    wait 1;
    maps\_utility::autosave_by_name( "fastrope" );
    thread maps\cargoship_code::playermaskputon();
    wait 1;
    maps\_utility::delaythread( 1.4, maps\cargoship_lighting::apply_lighting_pass_cargoship, "cargoship_exterior_helitrans_vision", 2 );
    // level.heroes5["price"] maps\_utility::delaythread( 1.5, ::setheadmodel, "head_sas_ct_assault_price_mask_down_nobeard" );
    maps\_utility::delaythread( 9.5, maps\cargoship_lighting::apply_lighting_pass_cargoship, "cargoship_exterior", 0 );
    wait 1.7;
    thread maps\mo_tools::radio_msg_stack( "cargoship_pri_crewexpend" );
    level.heli.vehicle waittill( "reached_wait_node" );
    thread maps\mo_tools::radio_msg_stack( "cargoship_hp1_greenlightgoradio" );
    wait 4.5;
    soundscripts\_snd::snd_message( "aud_get_out_blackhawk" );
}

bridge_standoff()
{
    var_0 = getent( "bridge_standoff_guys", "target" );
    var_1 = getent( "start_bridge_standoff", "targetname" );
    var_2 = getent( "bridge_damage_trig", "targetname" );
    var_2 thread bridge_standoff_damage();
    common_scripts\utility::array_thread( getentarray( "bridge_standoff_guys", "targetname" ), maps\_utility::add_spawn_function, ::bridge_standoff_behavior );
    level.enemies = [];
    var_0 notify( "trigger" );
    var_1 waittill( "trigger" );
    level.heroes5["price"].disableplayeradsloscheck = 1;
    level.heroes5["price"].grenadeawareness = 0;
    common_scripts\utility::flag_set( "bridge_landing" );
    setsaveddvar( "sm_sunSampleSizeNear", ".25" );
    wait 0.1;
    thread maps\mo_tools::ai_clear_dialog( undefined, undefined, undefined, level.player, "cargoship_gm1_bridgesecure" );
    var_2 maps\_utility::wait_for_trigger_or_timeout( 0.75 );
    maps\_utility::delaythread( 1.25, maps\mo_tools::radio_msg_stack, "cargoship_pri_weaponsfree" );
    level.enemies["bridge_capt"] notify( "bridge_react" );
    wait 0.5;
    level.enemies["bridge_clipboard"] notify( "bridge_react" );
    wait 0.25;
    wait 0.85;
    level.enemies["bridge_tv"] notify( "bridge_react" );
    wait 0.45;
    level.enemies["bridge_stand1"] notify( "bridge_react" );
    common_scripts\utility::array_thread( getentarray( "bridge_standoff_paperstacks", "targetname" ), ::bridge_standoff_paperstacks_damage );
    level waittill( "ai_clear_dialog_done" );
    level.heroes5["price"].disableplayeradsloscheck = 0;
    level.heroes5["price"].grenadeawareness = 1;
    common_scripts\utility::flag_set( "quarters" );
}

bridge_standoff_paperstacks_damage()
{
    var_0 = ( 0.0, 0.0, 15.0 );
    var_1 = self.origin + var_0;
    var_2 = spawnfx( level._effect["destp_office_paper_stack_cgoshp"], var_1 );
    triggerfx( var_2 );
    wait 0.1;
    self delete();
}

bridge_standoff_damage()
{
    for (;;)
    {
        self waittill( "trigger", var_0 );

        if ( isplayer( var_0 ) )
            break;
    }

    common_scripts\utility::flag_set( "bridgefight" );
}

#using_animtree("chair");

bridge_standoff_chair( var_0 )
{
    var_1 = spawn( "script_model", var_0.origin );
    var_1 setmodel( "com_restaurantchair_2" );
    var_1.animname = "chair";
    var_1 useanimtree( #animtree );
    var_0 thread maps\_anim::anim_loop_solo( var_1, "start", undefined, "stoploop" );
    common_scripts\utility::waittill_either( "damage", "already_dying" );
    var_0 notify( "stoploop" );
    thread bridge_standoff_mug();
    var_0 maps\_anim::anim_single_solo( var_1, "fall" );
    var_0 thread maps\_anim::anim_loop_solo( var_1, "end" );
}

bridge_standoff_mug()
{
    wait 0.15;

    if ( !isdefined( self ) )
        return;

    playfx( level._effect["coffee_mug"], self gettagorigin( "tag_inhand" ) );
    self detach( "cs_coffeemug01", "tag_inhand" );
}

bridge_standoff_behavior()
{
    self.ignoreweaponintracksuitmode = 1;
    var_0 = getnode( self.target, "targetname" );
    self.animname = self.script_noteworthy;
    self.deathanim = level.scr_anim[self.animname]["death"];
    level.enemies[self.script_noteworthy] = self;
    self.grenadeammo = 0;
    var_1 = undefined;

    if ( self.animname == "bridge_stand1" )
        var_0 = getent( self.target, "targetname" );

    var_0 thread maps\_anim::anim_loop_solo( self, "idle", undefined, "stoploop" );

    if ( self.animname == "bridge_capt" )
    {
        thread bridge_standoff_chair( var_0 );
        self attach( "cs_coffeemug01", "tag_inhand", 1 );
        // setheadmodel( "head_spetsnaz_assault_vlad" );
    }

    thread maps\_utility::ignoreallenemies( 1 );
    maps\_utility::gun_remove();
    thread bridge_standoff_behavior_earlydeath( var_0 );
    self endon( "death_by_player" );
    self waittill( "bridge_react" );
    var_2 = getanimlength( level.scr_anim[self.animname]["react"] );
    var_3 = var_2 - 0.5;

    switch ( self.animname )
    {
        case "bridge_clipboard":
            var_0 thread maps\_utility::notify_delay( "stoploop", 0.25 );
            var_0 maps\_utility::delaythread( 0.25, maps\_anim::anim_single_solo, self, "react" );
            break;
        default:
            var_0 notify( "stoploop" );
            var_0 thread maps\_anim::anim_single_solo( self, "react" );
            break;
    }

    switch ( self.animname )
    {
        case "bridge_capt":
            maps\_utility::delaythread( 1.5, maps\_utility::play_sound_on_entity, "cargoship_rus_huh2" );
            break;
    }

    wait(var_3);
    level.heroes5["alavi"] maps\_utility::ai_ignore_everything();

    switch ( self.animname )
    {
        case "bridge_capt":
            level.heroes5["alavi"] thread maps\cargoship_code::execute_ai_solo( self, 0.1, 6, 1 );
            wait 0.5;
            break;
        case "bridge_tv":
            level.heroes5["alavi"] thread maps\cargoship_code::execute_ai_solo( self, 0, 6, 1 );
            wait 0.5;
            break;
        case "bridge_stand1":
            wait 0.25;
            level.heroes5["price"] thread maps\cargoship_code::execute_ai_solo( self, 0.1, 6, 1 );
            level.heroes5["alavi"] maps\_utility::delaythread( 0.25, maps\cargoship_code::execute_ai_solo, self, 0, 6, 1 );
            wait 0.25;
            break;
        case "bridge_clipboard":
            level.heroes5["price"] thread maps\cargoship_code::execute_ai_solo( self, 0, 6, 1 );
            wait 0.75;
            break;
    }

    self notify( "already_dying" );
    self stopanimscripted();
    self kill();
    thread common_scripts\utility::play_sound_in_space( "generic_death_russian_" + randomintrange( 1, 8 ), var_0.origin );
}

bridge_standoff_behavior_earlydeath( var_0 )
{
    self endon( "already_dying" );
    self.health = 10000;

    for (;;)
    {
        self waittill( "damage", var_1, var_2 );

        if ( isplayer( var_2 ) )
            break;
    }

    self.allowdeath = 1;
    self notify( "death_by_player" );
    self stopanimscripted();
    self kill();
    thread common_scripts\utility::play_sound_in_space( "generic_death_russian_" + randomintrange( 1, 8 ), var_0.origin );
}

quarters_sleeping()
{
    var_0 = getentarray( "sleeping_nodes", "targetname" );
    var_1 = getentarray( "quarters_sleepers", "targetname" );
    var_2 = [];

    for ( var_3 = 0; var_3 < var_0.size; var_3++ )
    {
        var_2[var_3] = var_1[var_3] stalingradspawn();
        maps\_utility::spawn_failed( var_2[var_3] );
        var_2[var_3].animname = "sleeper_" + var_3;
        var_2[var_3].ignoreme = 1;
        var_2[var_3].grenadeammo = 0;
        var_2[var_3].health = 1;
        var_2[var_3].maxhealth = 1;
        var_2[var_3].allowdeath = 1;
        var_2[var_3].script_noteworthy = "sleeper";
        var_0[var_3] thread maps\_anim::anim_loop_solo( var_2[var_3], "sleep", undefined, "stop_sleeping" );
        var_2[var_3] thread quarters_sleeping_death( var_0[var_3] );
        var_2[var_3] thread quarters_sleeping_player();
        var_2[var_3].ignoreweaponintracksuitmode = 1;
    }

    if ( common_scripts\utility::flag( "deck_drop" ) )
        return;

    level endon( "deck_drop" );
    maps\_utility::waittill_dead( var_2 );
    common_scripts\utility::flag_set( "quarters_sleepers_dead" );
    common_scripts\utility::flag_set( "deck" );

    if ( randomint( 100 ) > 50 )
        maps\_utility::radio_dialogue( "cargoship_sas4_sweetdreams" );
    else
        maps\_utility::radio_dialogue( "cargoship_sas4_sleeptight" );

    common_scripts\utility::flag_set( "sweet_dreams" );
}

quarters_sleeping_player()
{
    level endon( "deck" );
    self endon( "death" );

    for (;;)
    {
        if ( self cansee( level.player ) )
            break;

        wait 0.1;
    }

    wait 1;
    common_scripts\utility::flag_set( "deck" );
}

#using_animtree("generic_human");

quarters_sleeping_death( var_0 )
{
    maps\_utility::gun_remove();
    thread maps\_utility::ignoreallenemies( 1 );
    self waittill( "damage", var_1, var_2, var_3, var_4, var_5 );
    level notify( "sleeping_guys_wake" );
    self notify( "death", var_2, var_5 );
    thread common_scripts\utility::play_sound_in_space( "generic_pain_russian_" + randomintrange( 1, 8 ), self.origin );

    if ( isdefined( level.cheatstates ) && isdefined( level.cheatstates["sf_use_tire_explosion"] ) && level.cheatstates["sf_use_tire_explosion"] == 1 )
        return;

    waittillframeend;
    var_6 = spawn( "script_model", self.origin );
    var_6.angles = self.angles;
    var_6 setmodel( self.model );
    var_7 = self getattachsize();

    for ( var_8 = 0; var_8 < var_7; var_8++ )
    {
        var_9 = self getattachmodelname( var_8 );
        var_10 = self getattachtagname( var_8 );
        var_6 attach( var_9, var_10, 1 );
    }

    var_6.animname = self.animname;
    var_6 useanimtree( #animtree );
    var_0 thread maps\_anim::anim_single_solo( var_6, "death" );
    waittillframeend;

    if ( isdefined( self ) )
        self delete();
}

quarters_dialogue()
{
    wait 1;
    maps\_utility::radio_dialogue( "cargoship_pri_holdyourfire" );
    maps\_utility::radio_dialogue( "cargoship_grg_rogerthat" );
    maps\_vehicle::switch_vehicle_fx( "script_vehicle_blackhawk", "fx/treadfx/heli_dust_cargoship" );
}

quarters_heli()
{
    level endon( "deck" );
    level endon( "deck_heli" );
    common_scripts\utility::flag_wait( "price_wait_at_stairs" );
    level.heli.model thread maps\cargoship_code::heli_searchlight_target( "targetname", "heli_deck_spottarget" );
    var_0 = common_scripts\utility::getstruct( "heli_deck_landing_node", "targetname" );
    var_1 = var_0.angles[1];
    level.heli.vehicle vehicle_setspeed( 20, 10, 10 );
    level.heli.vehicle sethoverparams( 32, 10, 3 );
    level.heli.vehicle clearlookatent();
    level.heli.vehicle cleargoalyaw();
    var_0 = common_scripts\utility::getstruct( "heli_quarters_node", "targetname" );
    level.heli.vehicle setvehgoalpos( var_0.origin, 1 );
    level.heli.vehicle setgoalyaw( var_1 );
    level.heli.vehicle settargetyaw( var_1 );

    while ( isdefined( var_0 ) )
    {
        var_2 = 0;

        if ( !isdefined( var_0.target ) )
            var_2 = 1;

        level.heli.vehicle setvehgoalpos( var_0.origin + ( 0.0, 0.0, 150.0 ), var_2 );
        level.heli.vehicle setneargoalnotifydist( 150 );
        level.heli.vehicle waittill( "near_goal" );

        if ( isdefined( var_0.target ) )
        {
            var_0 = common_scripts\utility::getstruct( var_0.target, "targetname" );
            continue;
        }

        var_0 = undefined;
    }

    common_scripts\utility::flag_set( "deck_heli" );
}

quarters_redlightatstairs()
{
    var_0 = spawn( "script_model", ( 2811.0, -346.0, 299.0 ) );
    var_0 setmodel( "tag_origin" );
    var_0 hide();
    playfxontag( level._effect["aircraft_light_cockpit_red"], var_0, "tag_origin" );
    common_scripts\utility::flag_wait( "deck" );
    var_0 delete();
}

quarters_prepare_door_for_breach()
{
    level.bridge_door_anim = getent( "bridge_door", "targetname" );
    level.bridge_door_anim.animname = "bridge_door_anim";
    level.bridge_door_anim maps\_anim::setanimtree();
    var_0 = common_scripts\utility::getstruct( "PriceBridgeDoorBreach", "targetname" );
    var_0 maps\_anim::anim_first_frame_solo( level.bridge_door_anim, "bridge_breach" );
}

quarters()
{
    level.heroes5["alavi"] maps\_utility::ai_unignore_everything( 0 );
    thread quarters_heli();
    var_0 = [];
    var_0 = common_scripts\utility::array_combine( var_0, getentarray( "bridge_flags", "script_noteworthy" ) );
    common_scripts\utility::array_thread( var_0, common_scripts\utility::trigger_on );
    level.heroes5["price"] pushplayer( 1 );
    level.heroes5["price"].animname = "price";
    level.heroes5["price"].moveplaybackrate = 1.0816;
    level.heroes5["alavi"] pushplayer( 1 );
    level.heroes5["alavi"].animname = "alavi";
    level.heroes5["alavi"].moveplaybackrate = 1.0816;
    var_1 = common_scripts\utility::getstruct( "PriceBridgeDoorBreach", "targetname" );
    var_2 = [];
    var_2[var_2.size] = level.heroes5["price"];
    var_2[var_2.size] = level.heroes5["alavi"];
    var_2[var_2.size] = level.bridge_door_anim;
    var_3 = getent( level.bridge_door_anim.target, "targetname" );
    var_3 connectpaths();
    var_3 linkto( level.bridge_door_anim, "hinge_jnt", ( 0.0, 0.0, 0.0 ), ( 0.0, 90.0, 0.0 ) );
    var_1 maps\_anim::anim_single( var_2, "bridge_breach" );
    level.heroes5["price"].animplaybackrate = 1.0816;
    level.heroes5["alavi"].animplaybackrate = 1.0816;
    level.heroes5["price"] maps\mo_tools::enable_cqbwalk_ign_demo_wrapper();
    level.heroes5["alavi"] maps\mo_tools::enable_cqbwalk_ign_demo_wrapper();
    level.heroes5["alavi"] thread quarters_alavi();
    level.heroes5["price"] thread quarters_price();
    common_scripts\utility::flag_wait( "quarters_killem" );
    common_scripts\utility::flag_clear( "_sea_bob" );
    getent( "quarters_drunk", "targetname" ) quarters_drunk();
}

quarters_player_speed()
{
    common_scripts\utility::flag_wait( "quarters_start" );
    thread maps\cargoship_code::player_speed_set_cargoship( 137, 1 );
    common_scripts\utility::flag_wait( "deck_drop" );
    thread maps\cargoship_code::player_speed_reset( 0.5 );
}

quarters_drunk()
{
    var_0 = self stalingradspawn();
    level.quartersdrunk = var_0;
    maps\_utility::spawn_failed( var_0 );
    var_0.ignoreme = 1;
    var_0.grenadeammo = 0;
    level.player.ignoreme = 1;
    var_0 thread maps\_utility::ignoreallenemies( 1 );
    var_0 maps\_utility::gun_remove();
    var_0.ignoreweaponintracksuitmode = 1;
    common_scripts\utility::flag_set( "quarters_drunk_spawned" );
    var_0.animname = "drunk";
    var_0.deathanim = level.scr_anim[var_0.animname]["death"];
    var_0.health = 1;
    var_0.maxhealth = 1;
    var_0.allowdeath = 1;
    var_1 = getnode( self.target, "targetname" );
    var_2 = spawn( "script_model", var_0 gettagorigin( "tag_inhand" ) );
    var_2.angles = var_0 gettagangles( "tag_inhand" );
    var_2 linkto( var_0, "tag_inhand" );
    var_2 setmodel( "cs_vodkabottle01" );
    var_0 thread quarters_drunk_bottle( var_2 );
    var_0 thread quarters_drunk_earlydeath( var_1 );
    var_0 endon( "death_by_player" );
    // var_0 setheadmodel( "head_spetsnaz_assault_geoff" );
    var_0 playsound( "cargoship_rud_3sec" );
    var_1 thread maps\_anim::anim_single_solo( var_0, "walk" );
    var_0.spinetarget = spawn( "script_origin", var_0 gettagorigin( "j_spine4" ) );
    var_0.spinetarget linkto( var_0, "j_spine4" );
    cargoship_disablealliesreload();
    level.heroes3["price"] setisignoringgrenades( 1 );
    level.heroes3["alavi"] setisignoringgrenades( 1 );
    level.heroes3["price"] maps\_utility::cqb_aim( var_0.spinetarget );
    level.heroes3["alavi"] maps\_utility::cqb_aim( var_0.spinetarget );
    var_3 = getanimlength( level.scr_anim[var_0.animname]["walk"] );
    wait 5;
    var_0.ignoreme = 0;
    common_scripts\utility::flag_set( "quarters_drunk_ready" );
    wait 1.5;
    var_0 notify( "already_dying" );
    var_0 quarters_drunk_death( var_1 );
    cargoship_enablealliesreload();
    level.heroes3["price"] setisignoringgrenades( 0 );
    level.heroes3["alavi"] setisignoringgrenades( 0 );
}

quarters_drunk_bottle( var_0 )
{
    common_scripts\utility::flag_init( "vodka_falling" );
    var_0 endon( "vodka_broken" );
    var_0 setcandamage( 1 );
    thread quarter_drunk_bottle_think( var_0 );
    thread quarters_drunk_bottle_falling( var_0 );
    self waittill( "damage", var_1, var_2 );

    if ( var_2 == level.player )
        common_scripts\utility::flag_set( "vodka_falling" );
    else
    {
        level notify( "drunk_guy_killed_by_ai" );
        quarter_drunk_bottle_brokefx( self gettagorigin( "tag_inhand" ), var_0 );
    }
}

quarter_drunk_bottle_think( var_0 )
{
    var_0 waittill( "damage", var_1 );
    var_0 notify( "vodka_broken" );
    quarter_drunk_bottle_brokefx( self gettagorigin( "tag_inhand" ), var_0 );
}

quarter_drunk_bottle_brokefx( var_0, var_1 )
{
    var_1 delete();
    var_2 = vectornormalize( level.player.origin - self gettagorigin( "tag_inhand" ) );
    playfx( level._effect["vodka_bottle"], var_0, var_2 );
    common_scripts\utility::play_sound_in_space( "cgo_glass_bottle_break", var_0 );
}

quarters_drunk_bottle_falling( var_0 )
{
    level endon( "drunk_guy_killed_by_ai" );
    var_0 endon( "vodka_broken" );
    var_1 = ( 0.0, 0.0, 0.0 );

    while ( !common_scripts\utility::flag( "vodka_falling" ) )
    {
        var_1 = self gettagorigin( "tag_inhand" );
        wait 0.2;
    }

    var_2 = 0;
    var_3 = ( 0.0, 0.0, 1.0 );
    var_4 = 0.5;
    var_0 unlink();
    var_5 = vectornormalize( self gettagorigin( "tag_inhand" ) - level.player.origin );
    var_6 = var_1 - var_0.origin;
    var_6 *= var_4;
    var_7 = common_scripts\utility::drop_to_ground( var_0.origin, 0 );
    var_7 = ( 0, 0, var_7[2] );

    for (;;)
    {
        var_8 = var_0.origin + var_6 - var_2 * var_3;

        if ( var_8[2] < var_7[2] )
        {
            var_8 = ( var_8[0], var_8[1], var_7[2] );
            var_0 moveto( var_8, 0.1 );
            wait 0.1;
            break;
        }

        var_0 moveto( var_8, 0.1 );
        var_2 += 3;
        wait 0.1;
    }

    quarter_drunk_bottle_brokefx( var_0.origin, var_0 );
}

quarters_drunk_earlydeath( var_0 )
{
    self endon( "already_dying" );
    self endon( "quarters_drunk_earlydeath2" );
    thread quarters_drunk_earlydeath2( var_0 );

    for (;;)
    {
        self waittill( "damage", var_1, var_2 );

        if ( isplayer( var_2 ) )
            break;
    }

    self notify( "quarters_drunk_earlydeath1" );
    quarters_drunk_earlydeath_proc( var_0 );
}

quarters_drunk_earlydeath2( var_0 )
{
    self endon( "already_dying" );
    self endon( "quarters_drunk_earlydeath1" );
    self waittill( "death", var_1 );

    if ( !isplayer( var_1 ) )
        return;

    self notify( "quarters_drunk_earlydeath2" );
    quarters_drunk_earlydeath_proc( var_0 );
}

quarters_drunk_earlydeath_proc( var_0 )
{
    self notify( "death_by_player" );
    common_scripts\utility::flag_set( "quarters_drunk_ready" );
    quarters_drunk_death( var_0, 0 );
}

quarters_drunk_death( var_0, var_1 )
{
    if ( !isdefined( var_1 ) )
        var_1 = 1;

    self stopanimscripted();

    if ( var_1 )
        self kill();

    thread common_scripts\utility::play_sound_in_space( "generic_death_russian_" + randomintrange( 1, 8 ), var_0.origin );
}

quarters_price()
{
    maps\_utility::delaythread( 0.6, maps\_utility::radio_dialogue, "cargoship_pri_squadonme" );
    level notify( "bridge_secured" );
    var_0 = getnode( "quarters_price_0", "targetname" );
    var_1 = getnode( "quarters_price_1", "targetname" );
    var_2 = getnode( "quarters_price_2", "targetname" );
    self.ignoreme = 1;
    self.ignoresuppression = 1;

    if ( !common_scripts\utility::flag( "price_wait_at_stairs" ) )
    {
        self setgoalnode( var_0 );
        self.goalradius = var_0.radius;
        self.disableexits = 1;
        common_scripts\utility::flag_wait( "price_wait_at_stairs" );
        thread maps\_utility::radio_dialogue( "cargoship_pri_stairsclear" );
        wait 0.4;
    }

    thread quarters_price_safety();
    level endon( "deck_drop" );
    thread quarters_price_force_disable_approach();
    self setgoalnode( var_1 );
    self.goalradius = var_1.radius;

    if ( lengthsquared( self.origin - var_0.origin ) < 25 )
    {
        var_3 = common_scripts\utility::getstruct( "PriceKillsDrunkGuy", "targetname" );
        var_3 thread maps\_anim::anim_single_solo( self, "stair_cover_exit" );
    }

    common_scripts\utility::flag_wait( "quarters_drunk_spawned" );
    self.disableexits = 0;
    maps\_utility::cqb_aim( level.quartersdrunk );
    common_scripts\utility::flag_wait( "quarters_drunk_ready" );

    while ( isalive( level.quartersdrunk ) )
    {
        if ( lengthsquared( self.origin - var_1.origin ) < 25 )
        {
            var_4 = randomintrange( 3, 6 );
            maps\cargoship_code::burstshot( var_4, level.quartersdrunk.spinetarget.origin );
        }

        wait 0.2;
    }

    maps\_utility::cqb_aim( undefined );
    wait 0.25;
    maps\_utility::radio_dialogue( "cargoship_pri_lastcall" );
    thread maps\_utility::radio_dialogue( "cargoship_pri_hallwayclear" );
    common_scripts\utility::flag_set( "quarters_price_says_clear" );
    maps\_utility::handsignal( "onme" );
    self pushplayer( 1 );
    quarters_price_restore_disable_approach();
    self setgoalnode( var_2 );
    self.goalradius = var_2.radius;
}

quarters_price_force_disable_approach()
{
    self.olddisableapproach = self.disableapproach;
    self.disableapproach = 1;
    self.disableapproachforced = 1;
    common_scripts\utility::flag_wait( "deck_drop" );
    quarters_price_restore_disable_approach();
}

quarters_price_restore_disable_approach()
{
    if ( isdefined( self.disableapproachforced ) && self.disableapproachforced )
    {
        self.disableapproach = self.olddisableapproach;
        self.disableapproachforced = 0;
    }
}

quarters_price_safety()
{
    level endon( "quarters_price_says_clear" );
    common_scripts\utility::flag_wait( "deck_drop" );
    thread common_scripts\utility::flag_set( "quarters_price_says_clear" );
}

quarters_alavi_stairs()
{
    for (;;)
    {
        self waittill( "trigger", var_0 );

        if ( var_0 == level.heroes5["price"] )
            break;
    }

    common_scripts\utility::flag_set( "price_at_top_of_stairs" );
}

quarters_alavi()
{
    maps\_utility::ent_flag_init( "at_sleeper" );
    var_0 = getnode( "quarters_price_0", "targetname" );
    var_1 = getnode( "quarters_alavi_1", "targetname" );
    var_2 = getnode( "quarters_alavi_2", "targetname" );
    self.ignoreme = 1;
    self.ignoresuppression = 1;
    getent( "price_at_top_of_stairs", "targetname" ) thread quarters_alavi_stairs();

    if ( !common_scripts\utility::flag( "price_at_top_of_stairs" ) )
    {
        self setgoalnode( var_0 );
        self.goalradius = var_0.radius;
        common_scripts\utility::flag_wait( "price_at_top_of_stairs" );
    }

    self setgoalnode( var_1 );
    self.goalradius = var_1.radius;
    common_scripts\utility::flag_wait( "quarters_drunk_spawned" );
    maps\_utility::cqb_aim( level.quartersdrunk );
    common_scripts\utility::flag_wait( "quarters_drunk_ready" );
    level endon( "deck_drop" );
    self waittill( "goal" );
    wait 0.5;

    while ( isalive( level.quartersdrunk ) )
    {
        var_3 = randomintrange( 3, 6 );
        maps\cargoship_code::burstshot( var_3, level.quartersdrunk.spinetarget.origin );
        wait 0.2;
    }

    if ( common_scripts\utility::flag( "deck_drop" ) )
        return;

    if ( !common_scripts\utility::flag( "deck" ) )
    {
        common_scripts\utility::flag_wait( "quarters_price_says_clear" );
        wait 0.25;
    }

    self setgoalnode( var_2 );
    self.goalradius = var_2.radius;
    var_4 = common_scripts\utility::getstruct( "PriceKillsDrunkGuy", "targetname" );
    var_4 thread maps\_anim::anim_single_solo( self, "bunkbed_approach" );
    self waittill( "goal" );
    maps\_utility::ent_flag_set( "at_sleeper" );
    var_5 = getaiarray( "axis" );
    maps\_utility::cqb_aim( var_5[0] );
}

computer_destructible()
{
    self setcandamage( 1 );
    self waittill( "damage", var_0, var_1 );
    self setmodel( "com_computer_monitor_d" );
    var_2 = self getorigin();
    var_3 = var_2 + ( 0.0, 0.0, 10.0 );
    playfx( level._effect["tv_explosion"], var_3 );
}

deck_main()
{
    var_0 = level.jumpto;

    if ( level.jumptosection != "deck" )
        var_0 = "deck";

    switch ( var_0 )
    {
        case "deck":
            thread deck_heli();
            common_scripts\utility::flag_wait( "deck" );
            setsaveddvar( "ai_friendlyFireBlockDuration", 2000 );
            common_scripts\utility::flag_set( "deck_heli" );
            thread deck_start();
            common_scripts\utility::array_thread( getentarray( "aftdeck_level2_enemies", "targetname" ), maps\_utility::add_spawn_function, ::deck_aftdeck_enemies );
            common_scripts\utility::array_thread( getentarray( "aftdeck_level3_runners", "targetname" ), maps\_utility::add_spawn_function, ::deck_aftdeck_runners );
            common_scripts\utility::array_thread( getentarray( "deck2_platform", "targetname" ), maps\_utility::add_spawn_function, ::deck_enemies_logic );
            common_scripts\utility::array_thread( getentarray( "deck_flags", "script_noteworthy" ), common_scripts\utility::trigger_on );
            deck_dialogue1();
            common_scripts\utility::flag_wait( "windows_got_company_line_before" );
            level.player.ignoreme = 1;
            common_scripts\utility::flag_wait( "windows_got_company_line" );
            wait 2;
            var_1 = getent( "aftdeck_level3_runners", "target" );
            var_1 notify( "trigger" );
    }
}

deck_wave()
{
    common_scripts\utility::flag_wait( "deck_wave" );
    level._sea_org notify( "manual_override" );

    if ( level._sea_org.sway == "sway1" )
    {
        level._sea_org.sway = "sway2";
        level._sea_org notify( "sway2" );
        wait 0.05;
    }

    level._sea_org.time = 2.5;
    level._sea_org.acctime = 0.1;
    level._sea_org.dectime = 0.5;
    level._sea_org.rotation = ( 10.0, 0.0, 20.0 );
    level._sea_org.sway = "sway1";
    level._sea_org notify( "sway1" );
    level._sea_link rotateto( level._sea_org.rotation, level._sea_org.time, level._sea_org.acctime, level._sea_org.dectime );
    level._sea_org rotateto( level._sea_org.rotation, level._sea_org.time, level._sea_org.acctime, level._sea_org.dectime );
    wait(level._sea_org.time);
    level._sea_org.time = 1.5;
    level._sea_org.acctime = 0.5;
    level._sea_org.dectime = 0.25;
    level._sea_org.rotation = ( -5.0, 0.0, -5.0 );
    level._sea_org.sway = "sway2";
    level._sea_org notify( "sway2" );
    level._sea_link rotateto( level._sea_org.rotation, level._sea_org.time, level._sea_org.acctime, level._sea_org.dectime );
    level._sea_org rotateto( level._sea_org.rotation, level._sea_org.time, level._sea_org.acctime, level._sea_org.dectime );
    wait(level._sea_org.time);
    level._sea_org thread maps\_sea::sea_bob();
}

deck_aftdeck_enemies()
{
    maps\_utility::delaythread( 5, common_scripts\utility::flag_set, "crouch_hint" );
    self endon( "death" );
    self.ignoreme = 1;
    self.ignoresuppression = 1;
    self setisignoringgrenades( 1 );
    self.allowpain = 0;

    if ( !isdefined( level.aftdeck_enemies ) )
        level.aftdeck_enemies = [];

    level.aftdeck_enemies[level.aftdeck_enemies.size] = self;
    var_0 = getentarray( "deck_window_targets1", "targetname" );
    var_0 = common_scripts\utility::array_combine( var_0, getentarray( "deck_window_targets2", "targetname" ) );
    var_1 = getnode( self.target, "targetname" );

    if ( !isdefined( var_1.target ) )
    {
        for (;;)
        {
            wait 0.5;
            self setentitytarget( common_scripts\utility::random( var_0 ), 0.8 );
        }
    }
}

deck_aftdeck_runners()
{
    self endon( "death" );
    self.animname = "sprinter";
    self.moveplaybackrate = 1.2;
    maps\_utility::set_run_anim( "sprint" );
    self waittill( "goal" );
    self delete();
}

deck_kill_off_sleepers()
{
    if ( common_scripts\utility::flag( "deck_drop" ) )
        return;

    level endon( "deck_drop" );
    cargoship_disablealliesreload();

    if ( !common_scripts\utility::flag( "quarters_sleepers_dead" ) )
    {
        level.heroes5["alavi"] maps\_utility::ent_flag_wait( "at_sleeper" );
        var_0 = getaiarray( "axis" );
        var_1 = [];

        foreach ( var_3 in var_0 )
        {
            if ( var_3.script_noteworthy == "sleeper" )
                var_1[var_1.size] = var_3;
        }

        level.heroes5["alavi"] maps\cargoship_code::execute_ai( var_1, 0.7, undefined, 1, 1 );
    }

    wait 0.25;
    thread deck_kill_off_sleepers_dialogue();
    cargoship_enablealliesreload();
}

deck_kill_off_sleepers_dialogue()
{
    level endon( "deck_drop" );
    common_scripts\utility::flag_wait( "sweet_dreams" );
    thread maps\_utility::radio_dialogue( "cargoship_pri_crewquarters" );
}

deck_start()
{
    level.heroes5["alavi"] maps\_utility::disable_ai_color();
    level.heroes5["price"] pushplayer( 1 );
    level.heroes5["alavi"] pushplayer( 0 );
    level.heroes5["price"].ignoreme = 0;
    level.heroes5["alavi"].ignoreme = 0;
    level.heroes5["price"] maps\mo_tools::disable_cqbwalk_ign_demo_wrapper();

    if ( level.jumpto != "deck" )
        deck_kill_off_sleepers();

    level.heroes5["alavi"] maps\_utility::cqb_aim( undefined );
    var_0 = getallnodes();
    var_1 = [];

    for ( var_2 = 0; var_2 < var_0.size; var_2++ )
    {
        if ( issubstr( tolower( var_0[var_2].type ), "cover" ) || issubstr( tolower( var_0[var_2].type ), "guard" ) )
            var_1[var_1.size] = var_0[var_2];
    }

    var_0 = getnodearray( "decknodes", "targetname" );
    var_3 = [];

    for ( var_2 = 0; var_2 < var_0.size; var_2++ )
        var_3[var_0[var_2].script_noteworthy] = var_0[var_2];

    var_4 = getarraykeys( level.heroes5 );

    for ( var_2 = 0; var_2 < var_4.size; var_2++ )
    {
        var_5 = var_4[var_2];

        if ( !common_scripts\utility::flag( "deck_drop" ) && level.heroes5[var_5] == level.heroes5["alavi"] )
        {
            level.heroes5[var_5] thread deck_alavi_wait_for_player( var_3[var_5], var_1 );
            continue;
        }

        level.heroes5[var_5] thread deck_heroes( var_3[var_5], var_1 );
    }

    thread maps\cargoship_code::deck_heroes_holdtheline();
    cargoship_heroes5_disablepain();
    common_scripts\utility::flag_wait( "moveup_deck1a" );
    maps\_utility::autosave_by_name( "deck" );
    thread maps\cargoship_code::player_speed_set_cargoship( 137, 2 );
    common_scripts\utility::flag_wait( "deck_windows" );
    maps\_utility::autosave_by_name( "aftdeck" );
    thread maps\cargoship_code::player_speed_reset( 1 );
}

deck_alavi_wait_for_player( var_0, var_1 )
{
    if ( !common_scripts\utility::flag( "deck_drop" ) )
    {
        self.ignoreme = 0;
        self pushplayer( 1 );
        var_2 = getnode( "quarters_alavi_wait", "targetname" );
        self setgoalnode( var_2 );
        self.goalradius = var_2.radius;
        common_scripts\utility::flag_wait( "deck_drop" );
    }

    thread deck_heroes( var_0, var_1 );
}

deck_dialogue1_kill()
{
    common_scripts\utility::flag_wait( "deck_enemies_spawned" );
    wait 0.1;
    var_0 = getaiarray( "axis" );
    maps\_utility::waittill_dead( var_0 );
    level notify( "kill_deck_dialogue" );
}

deck_dialogue1()
{
    thread deck_dialogue1_kill();
    level endon( "kill_deck_dialogue" );
    common_scripts\utility::flag_wait( "moveup_deck1b" );
    wait 0.5;
    maps\_utility::radio_dialogue( "cargoship_grg_gottwo" );
    maps\_utility::radio_dialogue( "cargoship_pri_iseeem" );
    common_scripts\utility::flag_wait( "moveup_deck2a" );
    maps\_utility::radio_dialogue( "cargoship_pri_weaponsfree" );
    maps\_utility::radio_dialogue( "cargoship_grg_rogerthat" );
}

deck_heroes( var_0, var_1 )
{
    self.goalradius = 64;
    self.ignoreme = 0;
    self pushplayer( 1 );

    if ( self.script_noteworthy == "grigsby" )
    {
        self waittillmatch( "single_anim_done" );
        self setgoalpos( self.origin );
        self.goalradius = 16;
        thread maps\mo_tools::radio_msg_stack( "cargoship_grg_readysir" );
        self.animname = "guy";
        var_2 = spawn( "script_origin", self.origin );
        var_2.angles = ( 0.0, 0.0, 0.0 );
        var_2 thread maps\_anim::anim_single_solo( self, "grigsturn" );
        wait(getanimlength( maps\_utility::getanim( "grigsturn" ) ) - 0.2);
        self stopanimscripted();
        var_2.origin = self.origin;
        var_2.angles = ( 0.0, 180.0, 0.0 );
        var_2 thread maps\_anim::anim_single_solo( self, "grigstop" );
        common_scripts\utility::flag_set( "_sea_bob" );
        thread maps\_utility::flag_set_delayed( "walk_deck", 1.5 );
        thread maps\mo_tools::radio_msg_stack( "cargoship_pri_fanout" );
        wait(getanimlength( maps\_utility::getanim( "grigstop" ) ) - 0.2);
        self stopanimscripted();
        self setgoalpos( self.origin );
        self.goalradius = 4;
        wait 1.5;
        var_2.origin = self.origin;
        var_2 thread maps\_anim::anim_single_solo( self, "grigsgo" );
        wait(getanimlength( maps\_utility::getanim( "grigsgo" ) ) - 0.2);
        self stopanimscripted();
        maps\mo_tools::enable_cqbwalk_ign_demo_wrapper();
        var_2 delete();
    }

    self setgoalnode( var_0 );

    if ( isdefined( var_0.radius ) && var_0.radius > 0 )
        self.goalradius = var_0.radius;
    else
        self.goalradius = 80;

    var_0 = getnode( var_0.target, "targetname" );

    if ( self.script_noteworthy == "alavi" )
        wait 15.5;

    if ( self.script_noteworthy == "seat6" )
        level.heroes5["seat6"].moveplaybackrate = 1;

    self waittill( "goal" );
    common_scripts\utility::flag_wait( "walk_deck" );
    maps\mo_tools::enable_cqbwalk_ign_demo_wrapper();

    while ( isdefined( var_0.target ) )
    {
        self setgoalnode( var_0 );

        if ( isdefined( var_0.radius ) && var_0.radius > 0 )
            self.goalradius = var_0.radius;
        else
            self.goalradius = 80;

        self waittill( "goal" );
        var_3 = common_scripts\utility::getstruct( var_0.targetname, "target" );

        if ( isdefined( var_3 ) )
        {
            var_4 = getent( var_3.targetname, "target" );

            if ( !common_scripts\utility::flag( var_4.script_flag ) )
            {
                if ( isdefined( var_0.radius ) && var_0.radius > 0 )
                {
                    var_5 = common_scripts\utility::getclosest( var_0.origin, var_1, var_0.radius );

                    if ( isdefined( var_5 ) )
                        self setgoalnode( var_5 );

                    self.goalradius = 16;
                }

                common_scripts\utility::flag_wait( var_4.script_flag );
            }
        }

        var_0 = getnode( var_0.target, "targetname" );

        if ( self.script_noteworthy == "grigsby" )
            self pushplayer( 1 );
    }

    common_scripts\utility::flag_set( "deck_windows" );
    self setgoalnode( var_0 );
    self.goalradius = 16;
    maps\mo_tools::disable_cqbwalk_ign_demo_wrapper();

    if ( self.script_noteworthy != "price" && self.script_noteworthy != "grigsby" )
        self pushplayer( 0 );

    if ( self.script_noteworthy == "price" )
    {
        self waittill( "goal" );
        common_scripts\utility::flag_wait( "windows_got_company_line" );
        maps\_utility::radio_dialogue( "cargoship_pri_tangos2ndfl" );
        common_scripts\utility::flag_set( "heli_shoot_deck_windows" );
    }
    else if ( !common_scripts\utility::flag( "windows_got_company_line_before" ) )
    {
        common_scripts\utility::flag_set( "windows_got_company_line_before" );
        maps\_utility::radio_dialogue( "cargoship_grg_gotcompany" );
        common_scripts\utility::flag_set( "windows_got_company_line" );
    }
}

deck_heli()
{
    common_scripts\utility::flag_wait( "deck_heli" );
    var_0 = common_scripts\utility::getstruct( "heli_deck_landing_node", "targetname" );
    level.heli.vehicle vehicle_setspeed( 40, 30, 20 );
    level.heli.vehicle sethoverparams( 0, 0, 0 );
    level.heli.vehicle setgoalyaw( var_0.angles[1] );
    level.heli.vehicle settargetyaw( var_0.angles[1] );
    level.heli.vehicle setvehgoalpos( var_0.origin + ( 0.0, 0.0, 146.0 ), 1 );
    level.heli.vehicle setneargoalnotifydist( 32 );
    level.heli.vehicle waittill( "near_goal" );
    common_scripts\utility::flag_wait( "deck_drop" );
    thread maps\_utility::radio_dialogue( "cargoship_hp1_forwarddeckradio" );
    level.heli.model.spotlight_default_target = spawn( "script_origin", level.heli.model gettagorigin( "tag_barrel" ) );
    level.heli.model.spotlight_default_target linkto( level.heli.model, "tag_turret", ( 0.0, 0.0, -256.0 ), ( 0.0, 0.0, 0.0 ) );
    level.heli.model thread maps\cargoship_code::heli_deckdrop_target();
    level.heli notify( "unload_rest" );
    wait 2;
    maps\cargoship_fx::flash( 3, 4, 2, 3 );
    level.player thread maps\_utility::play_sound_on_entity( "elm_thunder_distant" );
    level.player thread maps\_utility::play_sound_on_entity( "elm_thunder_strike" );
    wait 1;
    maps\cargoship_fx::flash( 3, 4, 2, 3 );
    level.player thread maps\_utility::play_sound_on_entity( "elm_thunder_distant" );
    level.player thread maps\_utility::play_sound_on_entity( "elm_thunder_strike" );
    wait 2;
    maps\cargoship_fx::flash( 3, 4, 2, 3 );
    level.player thread maps\_utility::play_sound_on_entity( "elm_thunder_distant" );
    wait 3.5;
    level.heli.vehicle vehicle_setspeed( 15, 5, 5 );
    level.heli.vehicle sethoverparams( 32, 10, 3 );
    level.heli.vehicle clearlookatent();
    level.heli.vehicle cleargoalyaw();
    level.heli.vehicle cleartargetyaw();
    level.heli.vehicle setlookatent( level.heroes5["price"] );
    common_scripts\utility::flag_wait( "moveup_deck1a" );
    maps\_vehicle::switch_vehicle_fx( "script_vehicle_blackhawk", "fx/treadfx/heli_dust_cargoship_shooting" );
    level.heli.model thread maps\cargoship_code::heli_searchlight_target( "aiarray", "allies" );
    thread maps\cargoship_code::heli_flypath( common_scripts\utility::getstruct( "heli_deck_landing_node", "targetname" ) );
    common_scripts\utility::flag_clear( "heli_light_on" );
    common_scripts\utility::flag_clear( "heli_light_triggers" );
    common_scripts\utility::flag_set( "heli_light_optimize" );
    level.heli.model thread maps\cargoship_code::deck_delete_destroyed_glass_pieces();
    common_scripts\utility::flag_wait( "moveup_deck1b" );
    thread maps\cargoship_code::heli_flypath( common_scripts\utility::getstruct( "deck_helinode_1b", "targetname" ) );
    common_scripts\utility::flag_wait( "moveup_deck2b" );
    thread maps\cargoship_code::heli_flypath( common_scripts\utility::getstruct( "deck_helinode_2b", "targetname" ) );
    common_scripts\utility::flag_wait( "heli_shoot_deck_windows" );
    level.heli.vehicle vehicle_setspeed( 20, 10, 10 );
    level.heli.vehicle clearlookatent();
    level.heli.vehicle settargetyaw( 110 );
    level.heli.vehicle setgoalyaw( 110 );
    thread maps\_utility::radio_dialogue( "cargoship_hp1_copyengaging" );
    var_1 = spawn( "script_origin", ( -2324.0, 32.0, 256.0 ) );
    var_1.targetname = "aftdeck_helispot_target";
    var_2 = spawn( "script_origin", ( -2324.0, -416.0, 270.0 ) );
    var_2.targetname = "attack_target";
    level.heli.model thread maps\cargoship_code::heli_searchlight_target( "targetname", "attack_target" );
    thread maps\cargoship_code::heli_flypath( common_scripts\utility::getstruct( "deck_helinode_win", "targetname" ) );
    thread maps\_utility::flag_set_delayed( "heli_light_on", 2 );
    wait 1.5;
    level.heli.vehicle vehicle_setspeed( 2, 7, 7 );
    soundscripts\_snd::snd_message( "aud_start_mix_heli_shoot_window" );
    wait 1;
    var_3 = 3.5;
    var_2 moveto( ( -2368.0, 592.0, 270.0 ), var_3 );
    var_2 thread maps\cargoship_code::deck_minigun_dodamage();
    level.heli.model.minigun["left"] settargetentity( var_2 );
    level.heli.model thread maps\cargoship_code::heli_minigun_fake_deck_fire();
    var_4 = spawn( "script_model", level.heli.model.minigun["left"] gettagorigin( "tag_flash" ) );
    var_4 setmodel( "tag_origin" );
    var_4 linkto( level.heli.model.minigun["left"], "tag_flash", ( -30.0, 0.0, 0.0 ), ( 0.0, 0.0, 0.0 ) );
    var_4 thread maps\cargoship_code::deck_heli_minigun_fx();
    thread maps\cargoship_code::deck_kill_lights();
    wait(var_3);
    level.heli.model maps\cargoship_code::heli_minigun_fake_deck_stopfire();
    var_4 delete();
    level.heli.vehicle vehicle_setspeed( 10, 7, 7 );
    soundscripts\_snd::snd_message( "aud_stop_mix_heli_shoot_window" );
    wait 1;
    level.heli.model.minigun["left"] cleartargetentity();
    level.heli.model thread maps\cargoship_code::heli_searchlight_target( "targetname", "aftdeck_helispot_target" );
    var_2 delete();
    level.heli.vehicle setgoalyaw( 225 );
    level.heli.vehicle cleartargetyaw();
    common_scripts\utility::flag_set( "hallways" );
    maps\_utility::radio_dialogue( "cargoship_hp1_bingofuel" );
    common_scripts\utility::flag_set( "hallways_moveup" );
    common_scripts\utility::flag_clear( "heli_light_on" );
    level.heli.model maps\cargoship_code::heli_searchlight_off();
    level.heli.model thread maps\cargoship_code::heli_searchlight_target( "default" );
    level.heli.vehicle vehicle_setspeed( 35, 10, 10 );
    maps\cargoship_code::heli_flypath( common_scripts\utility::getstruct( "deck_helinode_gohome", "targetname" ) );
    level.heli.model.minigun["left"] delete();
    level.heli maps\mo_fastrope::fastrope_heli_cleanup();
    level.heroes7["pilot"] maps\_utility::stop_magic_bullet_shield();
    level.heroes7["pilot"] delete();
    level.heroes7["copilot"] maps\_utility::stop_magic_bullet_shield();
    level.heroes7["copilot"] delete();
}

deck_enemies_logic()
{
    common_scripts\utility::flag_set( "deck_enemies_spawned" );
    self.ignoreme = 1;
    self.health = 10;
    self.maxhealth = 10;
    var_0 = getnode( self.target, "targetname" );
    self.disablebulletwhizbyreaction = 1;
    self.disablestairsanims = 1;
    thread maps\cargoship_code::patrol();
    thread maps\cargoship_code::deck_enemies_herokill();
    thread maps\cargoship_code::deck_enemies_behavior();

    if ( !isdefined( level.deck_enemy_die ) )
    {
        level.deck_enemy_die = 1;
        thread maps\cargoship_code::enemies_death_msg( "cargoship_grg_tangodown" );
    }
    else
        thread maps\cargoship_code::enemies_death_msg( "cargoship_gm2_targetneutralized" );

    self endon( "death" );
    self waittill( "in_range" );
    self.ignoreme = 0;
}

hallways_main()
{
    var_0 = level.jumpto;

    if ( level.jumptosection != "hallways" )
        var_0 = "hallways";

    switch ( var_0 )
    {
        case "hallways":
            common_scripts\utility::flag_wait( "hallways" );
            level.player.ignoreme = 0;
            var_1 = getaiarray( "axis" );

            for ( var_2 = 0; var_2 < var_1.size; var_2++ )
                var_1[var_2] kill();

            thread hallways_player_speed();
            maps\_utility::autosave_by_name( "hallways_breach" );
            level.heroes5["price"].baseaccuracy = level.heroes5["price"].cgo_old_baseaccuracy;
            level.heroes5["alavi"].baseaccuracy = level.heroes5["price"].cgo_old_baseaccuracy;
            level.heroes5["grigsby"].baseaccuracy = level.heroes5["price"].cgo_old_baseaccuracy;
            level.heroes5["price"].accuracy = level.heroes5["price"].cgo_old_accuracy;
            level.heroes5["alavi"].accuracy = level.heroes5["price"].cgo_old_accuracy;
            level.heroes5["grigsby"].accuracy = level.heroes5["price"].cgo_old_accuracy;
            level.heroes5["price"].ignoreme = 0;
            level.heroes5["alavi"].ignoreme = 0;
            level.heroes5["grigsby"].ignoreme = 0;
            hallways_breach();
            common_scripts\utility::array_thread( getentarray( "hallways_lower_runners", "targetname" ), maps\_utility::add_spawn_function, ::hallways_lower_runners );
            common_scripts\utility::array_thread( getentarray( "hallways_lower_runners2", "targetname" ), maps\_utility::add_spawn_function, ::hallways_lower_runners2 );
            thread hallways_lower_runners1_death();
            thread hallways_lower_runners_deathnotify();
            thread hallways_dialogue();
            var_3 = [];
            var_3["alavi"] = "cargoship_gm1_clearleft";
            var_3["grigsby"] = "cargoship_grg_clearright";
            var_3["price"] = undefined;
            maps\_utility::autosave_by_name( "hallways" );
            maps\cargoship_code::hallways_heroes( "hallways_enter", "hallways_corner", var_3 );
            thread maps\mo_tools::radio_msg_stack( "cargoship_pri_hallwayclear" );
            level.heroes3["price"] maps\_utility::delaythread( 1, maps\_utility::handsignal, "go", 1 );
            thread maps\mo_tools::radio_msg_stack( "cargoship_pri_moveup" );
            var_3["alavi"] = "cargoship_gm1_clearright";
            var_3["grigsby"] = undefined;
            var_3["price"] = undefined;
            wait 2;
            maps\cargoship_code::hallways_heroes( "hallways_corner", "hallways_stairs", var_3 );
            thread maps\mo_tools::radio_msg_stack( "cargoship_pri_stairsclear" );
            common_scripts\utility::flag_wait( "hallways_bottom_stairs" );
            setsaveddvar( "ai_friendlyFireBlockDuration", 0 );
            maps\_utility::autosave_by_name( "hallways_stairs" );
            level.heroes3["grigsby"] maps\mo_tools::disable_cqbwalk_ign_demo_wrapper();
            level.heroes3["price"] maps\mo_tools::disable_cqbwalk_ign_demo_wrapper();
            level.heroes3["alavi"] maps\mo_tools::disable_cqbwalk_ign_demo_wrapper();
            thread maps\cargoship_code::hallways_heroes( "hallways_stairs", "hallways_lowerhall_guys" );
            cargoship_enablealliesreload();
            var_4 = spawn( "script_origin", ( -2740.0, -20.0, -116.0 ) );
            var_5 = spawn( "script_origin", ( -2740.0, -20.0, -98.0 ) );
            level.heroes3["grigsby"] setentitytarget( var_5 );
            level.heroes3["price"] setentitytarget( var_4 );
            common_scripts\utility::flag_wait( "hallways_lowerhall" );
            level.heroes3["grigsby"] clearentitytarget();
            level.heroes3["price"] clearentitytarget();
            var_4 delete();
            var_5 delete();
            common_scripts\utility::flag_wait( "hallways_lowerhall_guys" );
            cargoship_disablealliesreload();
            thread maps\_utility::battlechatter_off( "axis" );
            maps\_utility::delaythread( 2, maps\_utility::autosave_by_name, "hallways_lowerhall" );
            maps\_utility::delaythread( 0.5, maps\mo_tools::radio_msg_stack, "cargoship_grg_tangodown" );
            maps\_utility::delaythread( 1, maps\mo_tools::radio_msg_stack, "cargoship_pri_hallwayclear" );
            maps\_utility::delaythread( 6, maps\mo_tools::radio_msg_stack, "cargoship_pri_checkcorners" );
            var_3["alavi"] = "cargoship_gm1_clearleft";
            var_3["grigsby"] = "cargoship_grg_readysir";
            var_3["price"] = undefined;
            var_6["alavi"] = "crouch2run";
            var_6["grigsby"] = undefined;
            var_6["price"] = undefined;
            maps\cargoship_code::hallways_heroes( "hallways_lowerhall", "hallways_lowerhall2", var_3 );
            thread maps\mo_tools::radio_msg_stack( "cargoship_pri_moveup" );
            common_scripts\utility::flag_set( "hallways_lowerhall2" );
            thread disable_ik_trigger();
    }
}

hallways_player_speed()
{
    common_scripts\utility::flag_wait( "hallways_enter" );
    thread maps\cargoship_code::player_speed_set_cargoship( 137, 1 );
}

hallways_dialogue()
{
    var_0 = getent( "hallways_lower_runners", "target" );
    var_0 waittill( "trigger" );
    wait 1.75;
    maps\mo_tools::radio_msg_stack( "cargoship_gm1_movementright" );
    thread maps\_utility::battlechatter_on( "axis" );
}

hallways_lower_runners_deathnotify()
{
    common_scripts\utility::flag_wait( "hallways_lower_runners2" );
    wait 0.2;
    var_0 = getaiarray( "axis" );
    thread hallways_lower_runners_instakill( var_0 );
    maps\_utility::waittill_dead( var_0 );
    common_scripts\utility::flag_set( "hallways_lowerhall_guys" );
    common_scripts\utility::flag_set( "hallways_lowerhall" );
}

hallways_lower_runners_instakill( var_0 )
{
    common_scripts\utility::flag_wait( "cargoholds_1_enter" );
    var_0 = maps\_utility::array_removedead( var_0 );

    if ( !var_0.size )
        return;

    for ( var_1 = 0; var_1 < var_0.size; var_1++ )
        var_0[var_1] kill( level.player.origin );
}

hallways_lower_runners1_death()
{
    common_scripts\utility::flag_wait( "hallways_lower_runners1" );
    wait 0.1;
    var_0 = getaiarray( "axis" );
    maps\_utility::waittill_dead( var_0 );
    var_1 = getent( "hallways_lower_runners2", "target" );
    var_1 notify( "trigger" );
}

hallways_lower_runners()
{
    self endon( "death" );
    self.ignoreme = 1;
    self.ignoreall = 1;
    self.goalradius = 64;
    common_scripts\utility::flag_set( "hallways_lower_runners1" );
    thread hallways_lower_runners_common();
    self.animname = "sprinter";
    self.moveplaybackrate = 1;
    maps\_utility::set_run_anim( "sprint" );
    self waittill( "goal" );
    self.ignoreall = 0;
    maps\_utility::clear_run_anim();
}

hallways_lower_runners2()
{
    self endon( "death" );
    common_scripts\utility::flag_set( "hallways_lower_runners2" );
    thread hallways_lower_runners_common();
}

hallways_lower_runners_common()
{
    self endon( "death" );
    self.a.disablelongdeath = 1;
    self waittill( "goal" );
    self.ignoreme = 0;
    self.ignoresuppression = 1;
    waittillframeend;
    self.goalradius = 16;
    common_scripts\utility::flag_wait( "hallways_lower_runners2" );
    wait 0.5;
    self.goalradius = 512;
}

hallways_breach_moveout( var_0, var_1 )
{
    var_2 = "nothing_at_all";

    if ( level.jumpto != "hallways" )
        var_2 = "stop_loop";

    self notify( var_2 );
    self.animname = "guy";

    if ( var_0 != "" )
    {
        var_3 = getanimlength( maps\_utility::getanim( var_0 ) );
        thread maps\_anim::anim_single_solo( self, var_0 );
        wait(var_3 - 0.2);
    }

    self setgoalnode( var_1 );
    self.goalradius = 16;
    self stopanimscripted();
    self pushplayer( 1 );
}

hallways_breach()
{
    level endon( "hallways_enter" );
    cargoship_disablealliesreload();
    maps\cargoship_lighting::activate_lights( "lights_cabin_stern_side", 1, "force_fully_on" );
    maps\cargoship_lighting::activate_lights( "lights_cabin_stern_side2", 1, "normal" );
    var_0 = getnodearray( "hallways_door_open_guard", "targetname" );
    var_1 = [];

    for ( var_2 = 0; var_2 < var_0.size; var_2++ )
        var_1[var_0[var_2].script_noteworthy] = var_0[var_2];

    level.heroes3["price"].moveplaybackrate = 1;
    level.heroes3["alavi"].moveplaybackrate = 1;
    level.heroes3["grigsby"].moveplaybackrate = 1;
    level.heroes3["price"].animplaybackrate = 1;
    level.heroes3["alavi"].animplaybackrate = 1;
    level.heroes3["grigsby"].animplaybackrate = 1;
    level.heroes5["seat5"].moveplaybackrate = 0.9;
    level.heroes5["seat6"].moveplaybackrate = 1;
    var_3 = getnode( "hallways_door_open", "targetname" );
    var_4 = spawn( "script_origin", var_3.origin );
    var_4.angles = var_3.angles;
    var_5 = spawn( "script_origin", var_4.origin );
    var_5.angles = var_4.angles;
    var_6 = spawn( "script_origin", var_4.origin );
    var_6.angles = var_4.angles;
    var_7 = "hallways_grigs_doorbreach";
    var_8 = "hallways_price_doorbreach";
    var_9 = "hallways_alavi_doorbreach";
    common_scripts\utility::flag_init( var_8 );
    common_scripts\utility::flag_init( var_7 );
    common_scripts\utility::flag_init( var_9 );

    if ( level.jumpto != "hallways" )
    {
        wait 2;
        level.heroes5["alavi"] pushplayer( 1 );
        level.heroes5["alavi"].a.forceapproachfacenodeyaw = 1;
        var_6 thread maps\cargoship_code::cargoship_breach2_setup( level.heroes5["alavi"], "breach2_alavi_arrival", "breach2_alavi_idle", "stop_loop", var_9 );
        common_scripts\utility::flag_wait( "hallways_moveup" );
        thread maps\mo_tools::radio_msg_stack( "cargoship_pri_copyhammer" );
        thread maps\mo_tools::radio_msg_stack( "cargoship_pri_restonme" );
        thread maps\mo_tools::radio_msg_stack( "cargoship_grg_rogerthat" );
        level.heroes5["seat5"] thread hallways_breach_moveout( "", var_1["seat5"] );
        wait 0.8;
    }

    if ( level.jumpto != "hallways" )
    {
        level.heroes5["price"] hallways_breach_moveout( "", var_3 );
        level.heroes5["grigsby"] hallways_breach_moveout( "", var_3 );
    }

    level.heroes5["price"].animname = "price";
    level.heroes5["grigsby"].animname = "grigsby";
    level.heroes5["alavi"].a.forceapproachfacenodeyaw = 0;
    wait 0.5;
    var_4 thread maps\cargoship_code::cargoship_breach2_setup( level.heroes5["price"], "breach2_price_arrival", "breach2_price_idle", "stop_loop", var_8 );
    level.heroes5["seat6"] thread hallways_breach_moveout( "", var_1["seat6"] );
    wait 0.8;
    var_5 thread maps\cargoship_code::cargoship_breach2_setup( level.heroes5["grigsby"], "breach2_grigsby_arrival", "breach2_grigsby_idle", "stop_loop", var_7 );
    common_scripts\utility::flag_wait_all( var_8, var_7, var_9 );
    wait 0.1;
    common_scripts\utility::flag_wait( "hallways_ready_to_breach" );
    common_scripts\utility::flag_set( "stand_hint" );
    maps\_utility::delaythread( 2, maps\_utility::radio_dialogue, "cargoship_grg_closeencounters" );
    var_5 notify( "stop_loop" );
    var_6 notify( "stop_loop" );
    level.heroes5["grigsby"].wantshotgun = 1;
    var_4 thread maps\_anim::anim_generic( level.heroes5["alavi"], "breach2_alavi_breach" );
    var_5 maps\_anim::anim_generic( level.heroes5["grigsby"], "breach2_grigsby_talk" );
    thread maps\_utility::radio_dialogue( "cargoship_gm1_tooright" );
    var_4 notify( "stop_loop" );
    var_5 notify( "stop_loop" );
    var_10 = getent( "hallways_door", "targetname" );
    var_11 = getent( "door_shadow_cabin_stern_side", "targetname" );
    var_11 linkto( var_10, "hinge_jnt" );
    var_12 = getent( var_10.target, "targetname" );
    var_12 connectpaths();
    var_10 useanimtree( #animtree );
    var_3 thread maps\_anim::anim_generic( var_10, "breach2_door_breach" );
    var_5 thread maps\_anim::anim_generic( level.heroes5["grigsby"], "breach2_grigsby_breach" );
    var_4 thread maps\_anim::anim_generic( level.heroes5["price"], "breach2_price_breach" );
    wait 1.8;
    thread maps\_utility::radio_dialogue( "cargoship_pri_onmymark" );
    var_12 rotateyaw( -80, 1, 0, 0.3 );
    var_12 thread hallways_breach_clip();
    thread door_breach_godray();
    wait 2.2;
    maps\cargoship_lighting::activate_lights( "lights_cabin_stern_side", 1, "normal" );
    maps\_utility::delaythread( 0.5, maps\_utility::radio_dialogue, "cargoship_pri_checkcorners" );
    maps\_utility::delaythread( 6, maps\mo_tools::radio_msg_stack, "cargoship_pri_checkthose" );
    maps\_utility::delaythread( 1, soundscripts\_snd::snd_message, "aud_stop_mix_moving_to_hallway" );
    level.heroes5["price"] maps\mo_tools::enable_cqbwalk_ign_demo_wrapper();
    level.heroes5["grigsby"] maps\mo_tools::enable_cqbwalk_ign_demo_wrapper();
    wait 0.2;
    level.heroes5["alavi"] thread maps\cargoship_code::hallways_heroes_solo( "hallway_attack", "hallways_enter" );
    wait 0.2;
    level.heroes5["grigsby"] thread maps\cargoship_code::hallways_heroes_solo( "hallway_attack", "hallways_enter" );
    level.heroes5["price"] waittillmatch( "single anim", "end" );
    level.heroes3["price"].animname = "guy";
    maps\_utility::delaythread( 0.5, maps\_utility::radio_dialogue, "cargoship_pri_move" );
    level.heroes3["price"] setgoalpos( level.heroes3["price"].origin );
    level.heroes3["price"].goalradius = 16;
    level.heroes3["price"] pushplayer( 1 );
    level.heroes3["price"] maps\_utility::handsignal( "onme", 1 );
    level.heroes3["price"] pushplayer( 1 );
    level.heroes5["price"] thread maps\cargoship_code::hallways_heroes_solo( "hallway_attack", "hallways_enter" );
    cargoship_heroes5_enablepain();
}

hallways_breach_clip()
{
    self waittill( "rotatedone" );
    door_player_clip();
}

door_player_clip()
{
    if ( level.player istouching( self ) )
        self notsolid();
    else
        return;

    while ( level.player istouching( self ) )
        wait 0.05;

    self solid();
}

hallways_breach_alavi_hack( var_0 )
{
    maps\_anim::anim_generic( var_0, "standidle2aim" );
    thread maps\_anim::anim_generic_loop( var_0, "standaim" );
    var_0 waittill( "exit" );
    self notify( "stop_loop" );
    thread maps\_anim::anim_generic( var_0, "stand2run" );
    var_1 = getanimlength( maps\_utility::getanim_generic( "stand2run" ) );
    wait(var_1 - 0.2);
    var_0 stopanimscripted();
}

door_breach_godray()
{
    for (;;)
    {
        common_scripts\_exploder::exploder( "701" );
        common_scripts\utility::flag_wait( "cargohold_fx" );
        common_scripts\_exploder::kill_exploder( "701" );
        common_scripts\utility::flag_wait( "topside_fx" );
    }
}

cargohold_flash()
{
    if ( common_scripts\utility::flag( "cargoholds_1_enter" ) || common_scripts\utility::flag( "cargoholds_1_enter_clear" ) )
        return;

    level endon( "cargoholds_1_enter" );
    level endon( "cargoholds_1_enter_clear" );
    cargohold_main_alavi_reach_flash();
    thread maps\mo_tools::radio_msg_stack( "cargoship_pri_standby" );
    thread maps\mo_tools::radio_msg_stack( "cargoship_gm1_standingby" );
    level.heroes3["price"] waittill( "goal" );
    common_scripts\utility::flag_wait( "cargohold1_flashmoment" );
    thread cargohold_flash2();
    level.heroes3["price"] thread maps\cargoship_code::caroghold_remove_flash_grenade( "cargoholds_1_enter" );
    level.heroes3["price"] maps\cargoship_code::cargohold_flashthrow( ( 155.0, 130.0, 5.0 ), 1 );
    level notify( "flashbang" );
    thread maps\mo_tools::radio_msg_stack( "cargoship_pri_go" );
}

cargohold_flash2()
{
    level endon( "cargoholds_1_enter" );
    level endon( "cargoholds_1_enter_clear" );
    wait 3;
    maps\mo_tools::radio_msg_stack( "cargoship_pri_flashbangout" );
    thread maps\_utility::battlechatter_on( "axis" );
}

disable_turns_until_duration_or_flag( var_0, var_1 )
{
    if ( level common_scripts\utility::flag( var_1 ) )
        return;

    maps\_utility::disable_turnanims();
    level common_scripts\utility::waittill_any_timeout( var_0, var_1 );
    maps\_utility::enable_turnanims();
}

cargohold_main()
{
    var_0 = level.jumpto;

    if ( level.jumptosection != "cargohold" )
        var_0 = "cargohold";

    switch ( var_0 )
    {
        case "cargohold":
            heroes_remove_bullet_whiz();
            thread cargohold1_pulp_fiction_think();
            var_1 = getentarray( "pulp_fiction_guy", "script_noteworthy" );
            common_scripts\utility::array_thread( var_1, maps\_utility::add_spawn_function, ::cargohold1_pulp_fiction_guy );
            common_scripts\utility::flag_wait( "hallways_lowerhall2" );
            level.heroes3["grigsby"].wantshotgun = 1;
            thread maps\cargoship_code::player_speed_set_cargoship( 137, 1 );
            level.heroes3["price"] pushplayer( 1 );
            level.heroes3["alavi"] pushplayer( 1 );
            level.heroes3["grigsby"] pushplayer( 1 );
            var_2 = [];
            var_3 = [];
            var_4 = [];
            var_2["alavi"] = undefined;

            if ( level.jumpto == "cargohold" )
                var_2["grigsby"] = undefined;
            else
                var_2["grigsby"] = "stand2run";

            var_2["price"] = undefined;
            var_1 = getentarray( "cargohold1_flashed_enemies", "targetname" );
            common_scripts\utility::array_thread( var_1, maps\_utility::add_spawn_function, ::cargohold1_flashed_enemies );
            thread cargohold1_flashed_enemies_death();
            var_3["price"] = 2.25;
            var_3["alavi"] = 0;
            var_3["grigsby"] = 1.25;
            thread maps\cargoship_code::hallways_heroes( "hallways_lowerhall2", "cargoholds_1_enter", undefined, var_3, var_2 );
            setsaveddvar( "ai_friendlyFireBlockDuration", 2000 );
            common_scripts\utility::array_thread( level.heroes3, maps\mo_tools::disable_cqbwalk_ign_demo_wrapper );
            level.heroes3["price"].a.cqbchangedontmodifyinterval = 1;
            level.heroes3["price"].interval = 0;
            level.heroes3["price"].a.disablepain = 1;
            level.heroes3["alavi"].a.disablepain = 1;
            level.heroes3["grigsby"].a.disablepain = 1;
            level.heroes3["price"] setisignoringgrenades( 1 );
            level.heroes3["alavi"] setisignoringgrenades( 1 );
            level.heroes3["grigsby"] setisignoringgrenades( 1 );
            level.heroes3["alavi"] thread disable_turns_until_duration_or_flag( 3, "cargoholds_1_enter" );
            cargohold_flash();
            level.heroes3["price"].a.cqbchangedontmodifyinterval = 0;
            level.heroes3["price"].interval = 96;
            level.heroes3["grigsby"] pushplayer( 0 );
            level.heroes3["grigsby"].dontpushplayer = 1;
            level.heroes3["price"].ignoreme = 0;
            level.heroes3["alavi"].ignoreme = 0;
            level.heroes3["grigsby"].ignoreme = 0;

            if ( common_scripts\utility::flag( "cargoholds_1_enter" ) )
            {
                var_2["alavi"] = undefined;
                var_2["grigsby"] = undefined;
                var_2["price"] = undefined;
                var_3["price"] = 0.1;
                var_3["alavi"] = 0;
                var_3["grigsby"] = 1.5;
            }
            else
            {
                var_2["alavi"] = "cornerleft8";
                var_2["grigsby"] = undefined;
                var_2["price"] = "cornerleft8";
                var_3["price"] = 0.35;
                var_3["alavi"] = 0;
                var_3["grigsby"] = 1.7;
            }

            level.heroes3["alavi"] notify( "stop_loop" );
            level.heroes3["price"] notify( "stop_loop" );
            level.heroes3["alavi"] stopanimscripted();
            level.heroes3["price"] stopanimscripted();
            thread maps\cargoship_code::hallways_heroes( "cargoholds_1_enter", "cargoholds_1_enter_clear", undefined, var_3, var_2 );

            if ( common_scripts\utility::flag( "cargoholds_1_enter_clear" ) )
            {
                var_3["price"] = 0.35;
                var_3["alavi"] = 0;
                var_3["grigsby"] = 1.7;
            }
            else
            {
                common_scripts\utility::flag_wait( "cargoholds_1_enter_clear" );
                var_3["alavi"] = 0;
                var_3["grigsby"] = 0;
                var_3["price"] = 2;
            }

            thread maps\mo_tools::radio_msg_stack( "cargoship_gm1_moveup" );
            level.heroes3["grigsby"].dontpushplayer = undefined;
            level.heroes3["grigsby"] pushplayer( 1 );
            maps\cargoship_code::hallways_heroes( "cargoholds_1_enter_clear", "cargoholds_1_cross", undefined, var_3 );
            thread maps\mo_tools::radio_msg_stack( "cargoship_pri_squadonme" );
            var_3["price"] = 0;
            var_3["alavi"] = 1;
            var_3["grigsby"] = 2;
            var_4["alavi"] = "cargoship_gm1_notangos";
            var_4["grigsby"] = "cargoship_grg_forwardclear";
            var_4["price"] = undefined;
            level.heroes3["alavi"] maps\mo_tools::disable_cqbwalk_ign_demo_wrapper();
            maps\cargoship_code::hallways_heroes( "cargoholds_1_cross", "cargoholds_1_part3", var_4, var_3 );
            level.heroes3["price"] thread maps\_utility::handsignal( "go", 1 );
            thread maps\mo_tools::radio_msg_stack( "cargoship_pri_moveup" );
            var_3["price"] = 1.75;
            var_3["alavi"] = 2.5;
            var_3["grigsby"] = 1.25;
            var_2["alavi"] = undefined;
            var_2["grigsby"] = undefined;
            var_2["price"] = "crouch2run";
            thread cargohold1_dialogue1();
            maps\cargoship_code::hallways_heroes( "cargoholds_1_part3", "cargoholds_1_cross2", undefined, var_3 );
            var_3["price"] = 0;
            var_3["alavi"] = 2.0;
            var_3["grigsby"] = 3.5;
            var_2["alavi"] = "cornerleft6";
            var_2["grigsby"] = undefined;
            var_2["price"] = undefined;
            thread cargohold1_dialogue2();
            thread cargohold1_dialogue3();
            maps\cargoship_code::hallways_heroes( "cargoholds_1_cross2", "cargoholds_1_part5", undefined, var_3, var_2 );
            var_3["price"] = 1;
            var_3["alavi"] = 0;
            var_3["grigsby"] = 0;
            maps\cargoship_code::hallways_heroes( "cargoholds_1_part5", "nothing", undefined, var_3 );
            common_scripts\utility::flag_set( "cargoholds2" );
    }
}

heroes_remove_bullet_whiz()
{
    level.heroes3["price"].disablebulletwhizbyreaction = 1;
    level.heroes3["alavi"].disablebulletwhizbyreaction = 1;
    level.heroes3["grigsby"].disablebulletwhizbyreaction = 1;
}

cargohold1_pulp_fiction_guy_add_spawn_stuff()
{
    maps\_utility::add_spawn_function( ::cargohold1_pulp_fiction_guy );
    self.script_forcespawn = 1;
}

cargohold1_dialogue1()
{
    if ( common_scripts\utility::flag( "cargoholds_1_cross2" ) )
        return;

    level endon( "cargoholds_1_cross2" );
    wait 2.25;
    thread maps\mo_tools::radio_msg_stack( "cargoship_pri_keepittight" );
    wait 2.75;

    if ( common_scripts\utility::flag( "pulp_fiction_guy" ) )
        return;

    thread maps\mo_tools::radio_msg_stack( "cargoship_grg_zeromovement" );
}

cargohold1_dialogue2()
{
    if ( common_scripts\utility::flag( "cargoholds_1_part5" ) )
        return;

    level endon( "cargoholds_1_part5" );
    wait 2.5;
    thread maps\mo_tools::radio_msg_stack( "cargoship_pri_rightside" );
    wait 0.2;
    thread maps\mo_tools::radio_msg_stack( "cargoship_grg_onit" );
    wait 3.8;

    if ( common_scripts\utility::flag( "pulp_fiction_guy" ) )
        return;

    thread maps\mo_tools::radio_msg_stack( "cargoship_gm1_looksquiet" );
    wait 0.5;
    thread maps\mo_tools::radio_msg_stack( "cargoship_pri_stayfrosty" );
}

cargohold1_dialogue3()
{
    wait 10.5;

    if ( common_scripts\utility::flag( "pulp_fiction_guy" ) )
        return;

    thread maps\mo_tools::radio_msg_stack( "cargoship_grg_notangos" );
}

cargohold1_pulp_fiction_think()
{
    if ( getdvar( "pulp_fiction_guy" ) == "" )
        setdvar( "pulp_fiction_guy", "" );

    if ( !isdefined( getdvar( "pulp_fiction_guy" ) ) )
        setdvar( "pulp_fiction_guy", "" );

    common_scripts\utility::flag_wait( "cargoholds_1_enter" );
    maps\_utility::autosave_by_name_thread( "cargoholds_1_enter" );
    common_scripts\utility::flag_wait( "cargoholds_1_cross" );
    var_0 = getentarray( "pulp_fiction_trigger", "targetname" );
    var_1 = getentarray( "absolute", "script_noteworthy" );
    var_0 = maps\_utility::array_exclude( var_0, var_1 );
    common_scripts\utility::array_thread( var_0, common_scripts\utility::trigger_off );
    var_0 = getentarray( "pulp_fiction_trigger", "targetname" );
    var_2 = getdvar( "pulp_fiction_guy" );
    var_3 = randomint( var_0.size );

    if ( isdefined( var_2 ) )
    {
        var_0[int( var_2 )] common_scripts\utility::trigger_off();

        while ( int( var_2 ) == var_3 )
        {
            var_3 = randomint( var_0.size );
            wait 0.05;
        }
    }

    setdvar( "pulp_fiction_guy", var_3 );
    var_4 = var_0[var_3];
    var_4 common_scripts\utility::trigger_on();
    common_scripts\utility::flag_wait_any( "cargoholds2", "pulp_fiction_guy", "laststand" );
    var_0 = getentarray( "pulp_fiction_trigger", "targetname" );
    common_scripts\utility::array_thread( var_0, common_scripts\utility::trigger_off );
}

cargohold1_pulp_fiction_guy()
{
    var_0 = getarraykeys( level.heroes3 );

    for ( var_1 = 0; var_1 < var_0.size; var_1++ )
    {
        var_2 = var_0[var_1];
        var_3 = distance( self.origin, level.heroes3[var_2].origin );

        if ( var_3 < 128 )
        {
            if ( var_3 < distance( self.origin, level.player.origin ) )
            {
                self delete();
                return;
            }
        }
    }

    common_scripts\utility::flag_set( "pulp_fiction_guy" );
    self endon( "death" );
    self.ignoreweaponintracksuitmode = 1;
    anim.shootenemywrapper_func = animscripts\utility::shootenemywrapper_shootnotify;
    thread cargohold1_pulp_fiction_guy_ignore();
    thread cargohold1_pulp_fiction_guy_healthshield();
    thread cargohold1_pulp_fiction_guy_kill();
    animscripts\utility::setalwaysusepistol( 1 );
    animscripts\shared::attachweapon( self.secondaryweapon, "chest" );
    animscripts\shared::updateattachedweaponmodels();
    self.favoriteenemy = level.player;
    self.disablearrivals = 1;
    self.disableexits = 1;
    self.dontmelee = 1;
    self.disablestairsanims = 1;
    self.animname = "pulp_fiction_guy";
    self.baseaccuracy = 1;
    self.accuracy = 1;
    self.health = 2;
    self.maxhealth = 2;
    self.goalradius = 90;
    self setgoalpos( level.player.origin );
    maps\_utility::radio_dialogue_stop();
    self playsound( "generic_meleecharge_russian_" + randomintrange( 1, 8 ) );

    while ( level.player.health > 0 )
    {
        level waittill( "an_enemy_shot", var_4 );

        if ( var_4 != self )
            continue;

        for ( var_5 = 1; var_5; var_5-- )
        {
            wait 0.25;
            self shoot();
        }
    }

    self.ignoreme = 1;
}

cargohold1_pulp_fiction_guy_healthshield()
{
    var_0 = 1;

    while ( var_0 )
    {
        level.player waittill( "damage", var_1, var_2 );

        if ( !isalive( self ) )
            return;

        if ( var_2 == self )
            var_0--;
    }

    if ( !isalive( self ) )
        return;

    level.player enablehealthshield( 0 );
    self waittill( "death" );
    level.player enablehealthshield( 1 );
}

cargohold1_pulp_fiction_guy_ignore()
{
    self endon( "death" );
    self.ignoreme = 1;
    wait 2;
    self.ignoreme = 0;
}

cargohold1_pulp_fiction_guy_kill()
{
    self endon( "death" );
    common_scripts\utility::flag_wait( "kill_pulpfictionguy" );
    self kill();
}

cargohold1_flashed_enemies_death()
{
    common_scripts\utility::flag_wait( "cargohold1_flashmoment" );
    wait 0.1;
    maps\mo_tools::ai_clear_dialog( undefined, undefined, undefined, level.player, "cargoship_gm1_catwalkclear" );
    common_scripts\utility::flag_set( "cargoholds_1_enter_clear" );
    thread maps\_utility::battlechatter_off( "axis" );
    level.heroes3["price"].a.disablepain = 0;
    level.heroes3["alavi"].a.disablepain = 0;
    level.heroes3["grigsby"].a.disablepain = 0;
    level.heroes3["price"] setisignoringgrenades( 0 );
    level.heroes3["alavi"] setisignoringgrenades( 0 );
    level.heroes3["grigsby"] setisignoringgrenades( 0 );
}

cargohold1_flashed_enemies()
{
    self endon( "death" );
    self.grenadeammo = 0;
    wait 0.15;
    self.goalradius = 64;
    self.health = 2;
    self.disablelongdeath = 1;
    var_0 = spawn( "script_origin", ( -2176.0, 540.0, -140.0 ) );
    level waittill( "alavi_looked" );
    self setentitytarget( var_0 );
    level waittill( "flashbang" );
    var_0 delete();
    self clearentitytarget();
    cargoship_disablealliesreload();
}

cargohold_main_alavi_reach_flash()
{
    level endon( "cargoholds_1_enter" );
    wait 0.1;
    level.heroes3["alavi"].goalradius = 8;
    level.heroes3["alavi"] waittill( "hallways_heroes_ready" );
    level.heroes3["alavi"] thread cargohold_main_alavi_reach_flash2();
}

cargohold_main_alavi_reach_flash2()
{
    level endon( "cargoholds_1_enter" );
    common_scripts\utility::flag_wait( "cargohold1_flashmoment" );
    wait 0.5;
    self.animname = "guy";
    self.ignoresuppression = 1;
    self.oldsuppression = self.suppressionwait;
    self.suppressionwait = 0;
    maps\_anim::anim_single_solo( self, "corner_l_look" );
    level notify( "alavi_looked" );
    maps\_anim::anim_single_solo( self, "corner_l_quickreact" );
    thread maps\_anim::anim_loop_solo( self, "corner_l_idle", undefined, "stop_loop" );
    level waittill( "flashbang" );
    self notify( "stop_loop" );
    wait 2;
    self.suppressionwait = self.oldsuppression;
}

cargohold1_breach2( var_0, var_1 )
{
    wait 3;
    level.heroes5["alavi"] pushplayer( 1 );
    var_0 maps\_anim::anim_reach_and_idle_solo( level.heroes5["alavi"], "door_breach", "door_breach_setup_idle", "stop_loop" );
    level.heroes5["alavi"] maps\mo_tools::enable_cqbwalk_ign_demo_wrapper();
    common_scripts\utility::flag_set( var_1 );
}

cargohold1_breach()
{
    var_0 = getnode( "cargohold1_door", "targetname" );
    level.heroes5["alavi"] maps\mo_tools::disable_cqbwalk_ign_demo_wrapper();
    cargoship_disablealliesreload();
    level.heroes3["price"].a.disablepain = 1;
    level.heroes3["alavi"].a.disablepain = 1;
    level.heroes3["grigsby"].a.disablepain = 1;
    level.heroes3["price"] setisignoringgrenades( 1 );
    level.heroes3["alavi"] setisignoringgrenades( 1 );
    level.heroes3["grigsby"] setisignoringgrenades( 1 );
    level.heroes3["price"] maps\_utility::set_ignoresuppression( 1 );
    level.heroes3["alavi"] maps\_utility::set_ignoresuppression( 1 );
    level.heroes3["grigsby"] maps\_utility::set_ignoresuppression( 1 );
    level.heroes5["grigsby"] maps\mo_tools::disable_cqbwalk_ign_demo_wrapper();
    level.heroes5["price"].animname = "price";
    level.heroes5["grigsby"].animname = "grigsby";
    level.heroes5["alavi"].animname = "alavi";
    var_1 = getnode( "cargohold1_door_open", "targetname" );
    var_2 = spawn( "script_origin", var_1.origin + ( 15.0, -40.0, 0.0 ) );
    var_2.angles = var_1.angles;
    var_2.type = "Cover Right";
    var_3 = spawn( "script_origin", var_2.origin );
    var_3.angles = var_2.angles + ( 0.0, -13.0, 0.0 );
    var_3.type = "Guard";
    var_4 = "cargohold1_grigsby_doorbreach";
    var_5 = "cargohold1_price_doorbreach";
    var_6 = "cargohold1_alavi_doorbreach";
    common_scripts\utility::flag_init( var_4 );
    common_scripts\utility::flag_init( var_5 );
    common_scripts\utility::flag_init( var_6 );
    var_2 thread maps\cargoship_code::cargoship_hack_animreach_price( level.heroes5["price"], "door_breach_setup", "door_breach_setup_idle", "stop_loop", var_5 );
    wait 1.5;
    thread cargohold1_breach2( var_2, var_6 );
    var_3 thread maps\cargoship_code::cargoship_hack_animreach_grigsby( level.heroes5["grigsby"], "door_breach_setup", "door_breach_setup_idle", "stop_loop", var_4 );
    common_scripts\utility::flag_wait_all( var_4, var_5, var_6 );
    maps\mo_tools::radio_msg_stack( "cargoship_grg_readysir" );
    maps\_utility::autosave_by_name( "cargohold2_breach" );
    var_2 notify( "stop_loop" );
    var_3 notify( "stop_loop" );
    var_2 thread maps\_anim::anim_single_solo( level.heroes5["price"], "door_breach_setup" );
    var_3 maps\_anim::anim_single_solo( level.heroes5["grigsby"], "door_breach_setup" );
    var_2 thread maps\_anim::anim_single_solo( level.heroes5["price"], "door_breach" );
    var_3 thread maps\_anim::anim_single_solo( level.heroes5["grigsby"], "door_breach" );
    var_2 thread maps\_anim::anim_single_solo( level.heroes5["alavi"], "door_breach" );
    level.heroes5["price"] waittillmatch( "single anim", "kick" );
    maps\_utility::delaythread( 0.5, maps\mo_tools::radio_msg_stack, "cargoship_pri_go" );
    var_7 = getent( "cargohold1_door", "targetname" );
    var_8 = getent( var_7.target, "targetname" );
    var_8 connectpaths();
    var_8 linkto( var_7 );
    var_7 maps\cargoship_code::door_opens( 0.8 );
    level.heroes5["price"] maps\mo_tools::enable_cqbwalk_ign_demo_wrapper();
    level.heroes5["grigsby"] maps\mo_tools::enable_cqbwalk_ign_demo_wrapper();
    wait 1;
    level.heroes3["alavi"] pushplayer( 1 );
    level.heroes3["alavi"].ignoreme = 1;
    wait 0.2;
    level.heroes5["grigsby"] stopanimscripted();
    level.heroes3["grigsby"] pushplayer( 1 );
    level.heroes3["grigsby"].ignoreme = 1;
    level.heroes3["grigsby"].moveplaybackrate = 1.0816;
    level.heroes5["grigsby"] thread maps\cargoship_code::hallways_heroes_solo( "cargohold2_enter", "cargohold2_catwalk2", "cargoship_grg_clearleft" );
    level.heroes5["price"] waittillmatch( "single anim", "end" );
    common_scripts\utility::flag_set( "cargoholds2_breach" );
    level.heroes3["price"].animname = "guy";
    level.heroes3["price"] maps\_anim::anim_single_solo( level.heroes3["price"], "onme_back" );
    level.heroes3["price"] maps\_anim::anim_single_solo( level.heroes3["price"], "cqbstart4" );
    level.heroes3["price"] pushplayer( 1 );
    level.heroes3["price"].ignoreme = 1;
    var_3 delete();
    var_2 delete();
    cargoship_enablealliesreload();
    level.heroes3["price"].a.disablepain = 0;
    level.heroes3["alavi"].a.disablepain = 0;
    level.heroes3["grigsby"].a.disablepain = 0;
    level.heroes3["price"] setisignoringgrenades( 0 );
    level.heroes3["alavi"] setisignoringgrenades( 0 );
    level.heroes3["grigsby"] setisignoringgrenades( 0 );
    level.heroes3["price"] maps\_utility::set_ignoresuppression( 0 );
    level.heroes3["alavi"] maps\_utility::set_ignoresuppression( 0 );
    level.heroes3["grigsby"] maps\_utility::set_ignoresuppression( 0 );
}

cargohold2_main()
{
    var_0 = getentarray( "cargohold2_catwalk_enemies", "targetname" );
    var_1 = getentarray( "cargohold2_catwalk_enemies2", "targetname" );
    common_scripts\utility::array_thread( var_0, maps\_utility::add_spawn_function, ::cargohold2_enemies1 );
    common_scripts\utility::array_thread( var_1, maps\_utility::add_spawn_function, ::cargohold2_enemies2 );
    thread cargohold2_enemies1_death();
    thread cargohold2_enemies2_death();
    common_scripts\utility::flag_wait( "cargoholds2" );
    maps\_utility::delaythread( 1, maps\mo_tools::radio_msg_stack, "cargoship_pri_stackup" );
    thread cargohold1_breach();
    common_scripts\utility::flag_wait( "cargoholds2_breach" );
    level.heroes5["alavi"] maps\mo_tools::enable_cqbwalk_ign_demo_wrapper();
    maps\_utility::delaythread( 0.25, maps\mo_tools::radio_msg_stack, "cargoship_pri_move" );
    var_2["price"] = 1.0;
    var_2["alavi"] = 0.8;
    var_2["grigsby"] = 0;
    level.heroes3["alavi"] maps\_utility::delaythread( 0.5, ::cargohold_catwalk_shuffle );
    level.heroes3["grigsby"] maps\_utility::delaythread( 0.5, ::cargohold_catwalk_shuffle );
    level.heroes3["price"] maps\_utility::delaythread( 0.5, ::cargohold_catwalk_shuffle );
    maps\cargoship_code::hallways_heroes( "cargohold2_catwalk", "cargohold2_catwalk2", undefined, var_2 );
    common_scripts\utility::flag_wait( "cargohold2_catwalk2a" );
    level.heroes3["grigsby"].moveplaybackrate = 1;
    level.heroes3["grigsby"].ignoreme = 0;
    level.heroes3["alavi"].ignoreme = 0;
    level.heroes3["price"].ignoreme = 0;
    thread maps\cargoship_code::player_speed_reset( 1 );

    if ( common_scripts\utility::flag( "package_enter" ) )
    {
        thread manifest_light_hack();
        return;
    }

    level endon( "package_enter" );
    thread maps\mo_tools::radio_msg_stack( "cargoship_pri_moveup" );
    var_2["price"] = 0;
    var_2["alavi"] = 0;
    var_2["grigsby"] = 0;
    maps\cargoship_code::hallways_heroes( "cargohold2_catwalk2a", "cargohold2_door", undefined, var_2 );
    common_scripts\utility::flag_wait( "cargohold2_catwalk2" );
    thread manifest_light_hack();

    if ( common_scripts\utility::flag( "cargohold2_enemies_dead" ) )
    {
        cargoship_disablealliesreload();
        thread maps\mo_tools::radio_msg_stack( "cargoship_gm1_forwardclear" );
        thread maps\mo_tools::radio_msg_stack( "cargoship_pri_move" );
    }

    var_2["price"] = 3;
    var_2["alavi"] = 2;
    var_2["grigsby"] = 1;
    common_scripts\utility::flag_wait( "cargohold2_enemies_dead" );
    maps\_utility::autosave_by_name( "cargohold2_enemies_dead" );
    var_3["alavi"] = "cargoship_gm1_clearleft";
    var_3["grigsby"] = "cargoship_grg_clearright";
    var_3["price"] = undefined;
    wait 0.1;
    maps\cargoship_code::hallways_heroes( "cargohold2_catwalk2", "cargohold2_door", var_3, var_2 );
    thread maps\mo_tools::radio_msg_stack( "cargoship_pri_stackup" );
    wait 1;
    level.heroes3["price"] thread maps\_utility::handsignal( "go", 1 );
    common_scripts\utility::flag_set( "laststand" );
}

cargohold2_enemies1_death()
{
    common_scripts\utility::flag_wait( "cargohold2_enemies" );
    thread maps\mo_tools::radio_msg_stack( "cargoship_grg_movementright" );
    thread maps\_utility::battlechatter_on( "axis" );
    wait 0.25;
    var_0 = getaiarray( "axis" );
    maps\_utility::waittill_dead( var_0 );
    common_scripts\utility::flag_set( "cargohold2_catwalk2a" );
}

cargohold2_enemies2_death()
{
    common_scripts\utility::flag_wait( "cargohold2_enemies2" );
    wait 0.25;
    var_0 = getaiarray( "axis" );
    maps\_utility::waittill_dead( var_0 );
    common_scripts\utility::flag_set( "cargohold2_catwalk2" );
    common_scripts\utility::flag_set( "cargohold2_enemies_dead" );
}

cargohold2_enemies2()
{
    self endon( "death" );
    common_scripts\utility::flag_set( "cargohold2_enemies2" );
    thread cargohold2_enemies_common();
    self waittill( "goal" );
    waittillframeend;
    self.goalradius = 275;
}

cargohold2_enemies1()
{
    self endon( "death" );
    common_scripts\utility::flag_set( "cargohold2_enemies" );
    thread cargohold2_enemies_common();
    self waittill( "goal" );
    waittillframeend;
    self.goalradius = 64;
    common_scripts\utility::flag_wait( "cargohold2_catwalk2a" );
    self setgoalnode( getnode( "cargohold2_enemynode2", "targetname" ) );
    self.goalradius = 275;
}

cargohold2_enemies_common()
{
    self endon( "death" );
    self.grenadeammo = 0;
    self.suppressionwait = 0;
    self.suppressionthreshold = 0.75;
    self.baseaccuracy *= 0.8;
    self.a.disablelongdeath = 1;
    common_scripts\utility::flag_wait( "package_enter" );
    self setgoalnode( getnode( "laststand_friendlynode", "targetname" ) );
    self.goalradius = 800;
}

cargohold_catwalk_shuffle_clean_up( var_0 )
{
    self.shuffling = 0;
    self.a.disablepain = 0;
    self setisignoringgrenades( 0 );
    self.allowpain = 1;
    maps\_utility::disable_cqbwalk();

    if ( isdefined( var_0 ) && var_0 == 1 )
    {
        common_scripts\utility::flag_set( "cargohold2_catwalk_end_grigsby" );
        common_scripts\utility::flag_set( "cargohold2_catwalk_end_alavi" );
        common_scripts\utility::flag_set( "cargohold2_catwalk_end_price" );
        self pushplayer( 0 );
    }
}

cargohold_catwalk_shuffle()
{
    self.a.disablepain = 1;
    self setisignoringgrenades( 1 );
    self.allowpain = 0;
    common_scripts\utility::flag_init( "cargohold2_catwalk_end_" + self.script_noteworthy );
    common_scripts\utility::waittill_any_ents( self, "hallways_heroes_ready", level, "cargohold2_catwalk2" );

    if ( common_scripts\utility::flag( "cargohold2_catwalk2" ) )
    {
        cargohold_catwalk_shuffle_clean_up( 1 );
        return;
    }

    self.animname = "shuffle";
    var_0 = spawn( "script_origin", self.origin );
    var_0.angles = ( 0.0, 0.0, 0.0 );
    var_1 = getanimlength( level.scr_anim["shuffle"]["arrival"] );
    var_0 thread maps\_anim::anim_single_solo( self, "arrival" );
    wait(var_1);
    self stopanimscripted();
    var_0.origin = self.origin;
    var_0.angles = ( 0.0, 270.0, 0.0 );
    var_2 = 5;
    self.shuffling = 1;
    self.ignoreme = 0;
    self notify( "shuffling" );
    self orientmode( "face angle", var_0.angles[1] );
    var_3 = maps\_utility::getanim( "loop" );
    var_1 = getanimlength( var_3 );
    var_4 = 1.25;
    var_1 *= 1 / var_4;
    self animcustom( ::cargohold_catwalk_shuffle_aim );

    while ( var_2 && !common_scripts\utility::flag( "cargohold2_catwalk_end_" + self.script_noteworthy ) )
    {
        self setanim( var_3, 1, 0.2, var_4 );
        self setanim( %exposed_aiming, 1 );
        wait(var_1);
        var_0.origin = self.origin;

        if ( !common_scripts\utility::flag( "cargohold2_catwalk2a" ) )
            self setgoalpos( self.origin );

        var_2--;

        if ( self.script_noteworthy == "grigsby" && common_scripts\utility::flag( "cargohold2_catwalk2a" ) )
        {
            common_scripts\utility::flag_set( "cargohold2_catwalk_end_" + self.script_noteworthy );
            common_scripts\utility::flag_set( "cargohold2_catwalk_end_alavi" );
            continue;
        }

        if ( self.script_noteworthy == "alavi" && common_scripts\utility::flag( "cargohold2_catwalk_end_" + self.script_noteworthy ) )
            common_scripts\utility::flag_set( "cargohold2_catwalk_end_price" );
    }

    cargohold_catwalk_shuffle_clean_up();
    common_scripts\utility::flag_set( "cargohold2_catwalk2a" );
    var_1 = getanimlength( level.scr_anim["shuffle"]["exit"] );
    var_0 thread maps\_anim::anim_single_solo( self, "exit" );
    var_5 = getnotetracktimes( level.scr_anim["shuffle"]["exit"], "finish" );

    if ( var_5.size > 0 )
        var_1 *= var_5[0];

    wait(var_1);
    self stopanimscripted();
    self pushplayer( 0 );
    var_0 delete();
}

cargohold_catwalk_shuffle_aim()
{
    self endon( "killanimscript" );
    common_scripts\utility::flag_wait( "cargohold2_enemies" );
    thread cargohold_catwalk_shuffle_shoot();

    while ( self.shuffling )
    {
        var_0 = getaiarray( "axis" );

        if ( !var_0.size )
        {
            wait 0.05;
            continue;
        }

        var_1 = common_scripts\utility::random( var_0 );
        self.shootent = var_1;

        while ( self.shuffling && isalive( var_1 ) )
            animscripts\track::trackshootentorpos();
    }
}

cargohold_catwalk_shuffle_shoot()
{
    while ( self.shuffling )
    {
        if ( self.script_noteworthy == "grigsby" )
        {
            wait(randomfloatrange( 0.6, 1 ));
            self shoot();
            continue;
        }

        wait(randomfloatrange( 0.3, 1 ));
        maps\cargoship_code::burstshot( randomintrange( 6, 10 ) );
    }
}

manifest_light_hack()
{
    var_0 = getent( "manifest_light", "targetname" );
    var_0 setlightshadowstate( "force_off" );
    var_0 setlightfovrange( 6, 0 );
    common_scripts\utility::flag_wait( "package_open_doors" );
    var_0 setlightshadowstate( "force_fully_on" );
    var_0 setlightfovrange( 80, 0 );
    common_scripts\utility::flag_wait( "escape_explosion" );
    var_0 setlightshadowstate( "normal" );
}

laststand_main()
{
    var_0 = level.jumpto;

    if ( level.jumptosection != "laststand" )
        var_0 = "laststand";

    switch ( var_0 )
    {
        case "laststand":
            common_scripts\utility::array_thread( getentarray( "cargohold3_enemies1", "targetname" ), maps\_utility::add_spawn_function, ::laststand_enemies1 );
            common_scripts\utility::array_thread( getentarray( "cargohold3_enemies2", "targetname" ), maps\_utility::add_spawn_function, ::laststand_enemies2 );
            common_scripts\utility::array_thread( getentarray( "cargohold3_enemies3", "targetname" ), maps\_utility::add_spawn_function, ::laststand_enemies3 );
            thread laststand_enemyspawn( "cargohold3_enemies1", "cargohold3_enemies2", 1 );
            thread laststand_enemyspawn( "cargohold3_enemies2", "cargohold3_enemies3", 2 );
            common_scripts\utility::flag_wait( "laststand" );
            common_scripts\utility::array_thread( level.heroes3, ::laststand_hero_think );
            thread laststand_clear();
            laststand_breach();
            maps\_utility::delaythread( 15, common_scripts\utility::flag_set, "nade_hint" );
            common_scripts\utility::flag_set( "package_enter" );
            maps\_utility::autosave_by_name( "package_enter" );
            thread maps\cargoship_code::player_speed_reset( 1 );
            var_1 = getent( "laststand_red1", "targetname" );
            var_1 notify( "trigger" );
            wait 3;
            setsaveddvar( "ai_friendlyFireBlockDuration", 2000 );
    }
}

laststand_hero_think()
{
    thread maps\_utility::disable_ai_color();
    common_scripts\utility::flag_wait( "package_enter" );
    self.a.disablepain = 0;
    self.ignoreme = 0;
    self pushplayer( 0 );
    var_0["grigsby"] = 0;
    var_0["alavi"] = 3.5;
    var_0["price"] = 2;
    self.fixednode = 1;
    maps\_utility::delaythread( var_0[self.script_noteworthy], maps\cargoship_code::hallways_heroes_solo, "package_enter", "nothing", undefined, undefined );
    self waittill( "hallways_heroes_ready" );
    self.disablestepout = undefined;
    self.ignoresuppression = 0;
    cargoship_enablealliesreload();
    self setisforcedincombat( 0 );

    switch ( self.script_noteworthy )
    {
        case "price":
            wait 2;
            break;
        case "grigsby":
            wait 5;
            break;
        case "alavi":
            wait 10;
            break;
    }

    setsaveddvar( "ai_threatUpdateInterval", 1000 );
    setsaveddvar( "ai_coversearchinterval", 5000 );
    maps\_utility::disable_ai_color();
    var_1 = getnode( "laststand_friendlynode", "targetname" );
    self setgoalnode( var_1 );
    self.goalradius = var_1.radius;
    self waittill( "goal" );
    self.fixednode = 0;
    wait(randomfloatrange( 10, 15 ));
    self.goalradius = 500;

    while ( !common_scripts\utility::flag( "laststand_3left" ) )
    {
        var_2 = getaiarray( "axis" );
        var_3 = common_scripts\utility::getclosest( self.origin, var_2 );
        var_4 = clamp( var_3.origin[1], -330, 330 );
        self setgoalpos( ( var_3.origin[0], var_4, self.origin[2] ) );
        wait(randomfloatrange( 4, 8 ));
    }

    switch ( self.script_noteworthy )
    {
        case "price":
            self.goalradius = 400;

            while ( !common_scripts\utility::flag( "package" ) )
            {
                var_2 = getaiarray( "axis" );

                if ( !isdefined( var_2 ) || var_2.size == 0 )
                    break;

                var_3 = common_scripts\utility::getclosest( self.origin, var_2 );
                self.favoriteenemy = var_3;
                var_4 = clamp( var_3.origin[1], -330, 330 );
                self setgoalpos( ( var_3.origin[0], var_4, self.origin[2] ) );
                wait(randomfloatrange( 1, 5 ));
            }

            break;
        default:
            self.goalradius = 400;

            while ( !common_scripts\utility::flag( "package" ) )
            {
                self setgoalpos( level.heroes3["price"].origin );
                wait 1;
            }

            break;
    }

    common_scripts\utility::flag_wait( "package" );
    setsaveddvar( "ai_threatUpdateInterval", 500 );
    setsaveddvar( "ai_coversearchinterval", 2000 );
    self setgoalpos( self.origin );
    self.goalradius = 64;
}

laststand_breach()
{
    if ( common_scripts\utility::flag( "package_enter" ) )
        return;

    level endon( "package_enter" );
    level.heroes3["price"].a.disablepain = 1;
    level.heroes3["alavi"].a.disablepain = 1;
    level.heroes3["grigsby"].a.disablepain = 1;
    level.heroes3["price"] setisforcedincombat( 1 );
    level.heroes3["alavi"] setisforcedincombat( 1 );
    level.heroes3["grigsby"] setisforcedincombat( 1 );
    level.heroes3["price"].disablestepout = 1;
    var_0["price"] = 2;
    var_0["alavi"] = 1;
    var_0["grigsby"] = 0;
    level.heroes3["price"].ignoreme = 1;
    level.heroes3["price"].ignoresuppression = 1;
    level.heroes3["alavi"].ignoreme = 1;
    level.heroes3["alavi"].ignoresuppression = 1;
    level.heroes3["grigsby"].ignoreme = 1;
    level.heroes3["grigsby"].ignoresuppression = 1;
    thread maps\mo_tools::radio_msg_stack( "cargoship_pri_standby" );
    level.heroes3["alavi"] thread laststand_msg( "cargoship_gm1_twoready" );
    level.heroes3["grigsby"] thread laststand_msg( "cargoship_grg_oneready" );
    maps\cargoship_code::hallways_heroes( "cargohold2_door", "nothing", undefined, var_0, undefined );
    maps\_utility::autosave_by_name( "cargohold2b" );
    wait 1;
    maps\_utility::delaythread( 3.4, maps\mo_tools::radio_msg_stack, "cargoship_pri_onmymark" );
    setsaveddvar( "ai_friendlyFireBlockDuration", 0 );
    level.heroes3["price"] maps\cargoship_code::cargohold_flashthrow( ( 500.0, 10.0, 300.0 ), 1, 500 );
}

laststand_msg( var_0 )
{
    self waittill( "hallways_heroes_atgoal" );
    maps\mo_tools::radio_msg_stack( var_0 );
}

laststand_enemies_common()
{
    self endon( "death" );
    self.grenadeammo = 0;
    common_scripts\utility::flag_wait( "laststand_3left" );
    wait(randomfloatrange( 0.25, 1.25 ));
    self setgoalpos( ( 2221.0, 230.0, -320.0 ) );
    self.goalradius = 300;
}

laststand_enemies3()
{
    thread laststand_enemies_common();
}

laststand_enemies2()
{
    thread laststand_enemies_common();
    common_scripts\utility::flag_set( "package_enter" );
    common_scripts\utility::flag_set( "laststand" );
}

laststand_enemies1()
{
    thread laststand_enemies_common();
    self endon( "death" );
    self.ignoreme = 1;
    self waittill( "goal" );
    waittillframeend;
    self.oldradius = self.goalradius;
    self.goalradius = 90;
    common_scripts\utility::flag_wait( "package_enter" );
    self.goalradius = self.oldradius;
    self.ignoreme = 0;
}

laststand_enemyspawn( var_0, var_1, var_2, var_3 )
{
    var_4 = getent( var_0, "target" );
    var_5 = getent( var_1, "target" );
    var_6 = getentarray( var_0, "targetname" );
    var_5 endon( "trigger" );
    var_4 waittill( "trigger" );
    wait 0.25;
    var_7 = getaiarray( "axis" );
    maps\_utility::waittill_dead( var_7, var_6.size - var_2, var_3 );
    var_5 notify( "trigger" );
}

laststand_clear()
{
    var_0 = getent( "cargohold3_enemies3", "target" );
    var_0 waittill( "trigger" );
    common_scripts\utility::flag_set( "package_enter" );
    wait 0.5;
    var_1 = getaiarray( "axis" );
    maps\_utility::waittill_dead( var_1, var_1.size - 3 );
    common_scripts\utility::flag_set( "laststand_3left" );
    var_1 = getaiarray( "axis" );

    for ( var_2 = 0; var_2 < var_1.size; var_2++ )
        var_1[var_2].a.disablelongdeath = 1;

    maps\mo_tools::ai_clear_dialog( undefined, undefined, undefined, level.player, "cargoship_gm1_tangodown" );
    thread maps\_utility::battlechatter_off( "axis" );
    common_scripts\utility::flag_set( "package" );
}

package_main()
{
    var_0 = level.jumpto;

    if ( level.jumptosection != "package" )
        var_0 = "package";

    switch ( var_0 )
    {
        case "package":
            common_scripts\utility::flag_wait( "package" );
            cargoship_disablealliesreload();
            wait 1;
            thread package_dialogue();
            thread package_music();
            common_scripts\utility::flag_wait( "package_report" );
            thread package_grigs();
            thread package_price();
            var_1 = getarraykeys( level.heroes3 );

            for ( var_2 = 0; var_2 < var_1.size; var_2++ )
            {
                var_3 = var_1[var_2];
                level.heroes3[var_3].animname = "escape";
            }

            level.heroes3["price"] pushplayer( 1 );
            level.heroes3["grigsby"] pushplayer( 1 );
            level.heroes3["alavi"] pushplayer( 1 );
            var_4 = level.heroes3["alavi"] maps\cargoship_code::hallways_heroes_get_node( "package1" );
            level.heroes3["alavi"] thread package_notify_on_position_reached( var_4 );
            level.heroes3["alavi"] maps\cargoship_code::hallways_heroes_solo( "package1", "nothing" );
            level.heroes3["alavi"].grenadeawareness = 0;
            common_scripts\utility::flag_set( "package_reading" );
            level.heroes3["price"].goalradius = 4;
            level.heroes3["price"].goalradius = 4;
            common_scripts\utility::flag_wait( "package_orders" );
            thread maps\cargoship_code::player_speed_set_cargoship( 185, 1 );
            common_scripts\utility::array_thread( level.heroes3, maps\_utility::clear_run_anim );
            common_scripts\utility::flag_set( "escape" );
            common_scripts\utility::flag_wait( "package_secure" );
            level.heroes3["alavi"].grenadeawareness = 1;
    }
}

package_notify_on_position_reached( var_0 )
{
    while ( distance2d( self.origin, var_0.origin ) > 25 )
        wait 0.75;

    self notify( "goal" );
}

package_grigs()
{
    var_0 = level.heroes3["grigsby"];
    var_0.animname = "escape";
    var_1 = getent( "package_dooranim_node", "targetname" );
    var_2 = "package_grigs";
    thread package_grigs2( var_0 );
    var_3 = var_0.animplaybackrate;
    var_0.animplaybackrate = 1;
    var_4 = var_0 maps\cargoship_code::hallways_heroes_get_node( "package1" );
    var_0 thread package_notify_on_position_reached( var_4 );

    while ( distance2d( var_0.origin, var_4.origin ) > 25 )
    {
        var_0.arrivalstance = "cover_stand";
        var_0 maps\cargoship_code::hallways_heroes_solo( "package1", "nothing" );
        wait 0.75;
    }

    var_0 thread maps\_anim::anim_generic_loop( var_0, "package_idle_waitinggundown", undefined, "stop_loop_grigs_1st" );
    common_scripts\utility::flag_wait( "package_reading" );
    common_scripts\utility::flag_wait( "strong_reading" );
    var_5 = getent( "h1_player_proximity", "targetname" );
    var_5 common_scripts\utility::trigger_on();
    var_5 waittill( "trigger" );
    common_scripts\utility::flag_wait( "price_package_ready" );
    wait 0.25;
    common_scripts\utility::flag_set( "package_open_doors" );
    var_0 thread maps\_anim::anim_single_queue( var_0, "cargoship_gaz_takealook" );
    var_0 notify( "stop_loop_grigs_1st" );
    var_1 maps\_anim::anim_generic( var_0, var_2 );
    var_0.animplaybackrate = var_3;
    var_1 thread maps\_anim::anim_generic_loop( var_0, "package_idle_grigs", undefined, "stop_loop_grigs_2nd" );
    common_scripts\utility::flag_wait( "package_secure" );
    var_1 notify( "stop_loop_grigs_2nd" );
    var_0 stopanimscripted();
}

package_grigs2( var_0 )
{
    wait 1.25;
    var_0 maps\_anim::anim_single_queue( var_0, "cargoship_grg_strongreading" );
    common_scripts\utility::flag_set( "strong_reading" );
    common_scripts\utility::flag_wait( "package_open_doors" );
    wait 10.37;
    var_0 pushplayer( 1 );
    var_0 setgoalpos( var_0.origin );
    var_0.goalradius = 4;
    common_scripts\utility::flag_set( "found_package" );
}

package_price()
{
    var_0 = level.heroes3["price"];
    var_1 = getent( "package_dooranim_node", "targetname" );
    var_2 = var_0.animplaybackrate;
    var_0.animplaybackrate = 1;
    var_3 = var_0 maps\cargoship_code::hallways_heroes_get_node( "package1" );
    var_0 thread package_notify_on_position_reached( var_3 );

    while ( distance2d( var_0.origin, var_3.origin ) > 25 )
    {
        var_0.arrivalstance = "cover_stand";
        var_0 maps\cargoship_code::hallways_heroes_solo( "package1", "nothing" );
        wait 0.75;
    }

    var_0 thread maps\_anim::anim_generic_loop( var_0, "package_idle_waitinggundown", undefined, "stop_loop_price_1st" );
    wait 0.25;
    common_scripts\utility::flag_set( "price_package_ready" );
    common_scripts\utility::flag_wait( "package_open_doors" );
    var_0 notify( "stop_loop_price_1st" );
    // var_0 setheadmodel( level.price_normal_headmodel );
    var_1 maps\_anim::anim_generic( var_0, "package_opendoor_price" );
    var_0.animplaybackrate = var_2;
    var_1 thread maps\_anim::anim_generic_loop( var_0, "package_idle_price", undefined, "stop_loop_price_2nd" );
    common_scripts\utility::flag_wait( "package_secure" );
    var_1 notify( "stop_loop_price_2nd" );
    var_0 stopanimscripted();
    var_0 setanimlimited( %price_mask_up, 1 );
    var_0 setanimlimited( %h1_cargoship_price_mask_outloop, 1 );
}

package_open_doors( var_0 )
{
    var_1 = getent( "package_door_left", "targetname" );
    var_1 thread package_doorsetup();
    var_2 = getent( "package_door_right", "targetname" );
    var_2 thread package_doorsetup();
    wait 0.1;
    var_3 = spawn( "script_model", var_1.link.origin );
    var_3.angles = ( 0.0, 0.0, 0.0 );
    var_3 setmodel( "cs_container_door_joint" );
    var_3 useanimtree( #animtree );
    var_1 linkto( var_3, "tag_animate" );
    var_4 = spawn( "script_model", var_2.link.origin );
    var_4.angles = ( 0.0, 0.0, 0.0 );
    var_4 setmodel( "cs_container_door_joint" );
    var_4 useanimtree( #animtree );
    var_2 linkto( var_4, "tag_animate" );
    var_3.animname = "generic";
    var_4.animname = "generic";
    var_0 thread maps\_anim::anim_first_frame_solo( var_3, "package_doorL" );
    var_0 thread maps\_anim::anim_first_frame_solo( var_4, "package_doorR" );
    common_scripts\utility::flag_wait( "package_open_doors" );
    var_2 connectpaths();
    var_1 connectpaths();
    var_0 thread maps\_anim::anim_generic( var_3, "package_doorL" );
    var_0 maps\_anim::anim_generic( var_4, "package_doorR" );
    var_2 thread door_player_clip();
    var_1 thread door_player_clip();
    var_2 unlink();
    var_1 unlink();
    var_3 delete();
    var_4 delete();
    waittillframeend;
    var_1 notify( "sway" );
    var_2 notify( "sway" );
    common_scripts\utility::flag_set( "aud_package_door_creaks" );
    var_0 delete();
}

package_dialogue()
{
    var_0 = level.heroes3["price"];
    var_1 = level.heroes3["grigsby"];
    thread package_radiation();
    maps\mo_tools::radio_msg_stack( "cargoship_pri_report" );
    maps\mo_tools::radio_msg_stack( "cargoship_grg_rogerthat" );
    common_scripts\utility::flag_set( "package_report" );
    common_scripts\utility::flag_wait( "found_package" );
    common_scripts\utility::flag_wait( "radiomessage_notime" );
    common_scripts\utility::flag_set( "music_tension_notime" );
    maps\mo_tools::radio_msg_stack( "cargoship_hqr_notime" );
}

package_music()
{
    level endon( "cargoship_escape_music" );
    common_scripts\utility::flag_wait( "music_tension_notime" );
    soundscripts\_snd::snd_message( "aud_start_mix_npc_pre_explosion" );
    musicstop();
    wait 2;

    for (;;)
    {
        maps\_utility::musicplaywrapper( "tension_maintheme_groove" );
        wait 47;
    }
}

package_radiation()
{
    var_0 = spawn( "script_origin", ( 2477.2, 198.0, -311.0 ) );
    var_1 = "none";

    while ( !common_scripts\utility::flag( "escape_explosion" ) )
    {
        var_2 = distance( level.player.origin, var_0.origin );

        if ( var_2 > 300 )
        {
            var_1 = "none";
            var_0 stoploopsound();
        }
        else if ( var_2 < 150 && var_1 != "item_geigercouner_level2" )
        {
            var_0 stoploopsound();
            var_1 = "item_geigercouner_level2";
            var_0 playloopsound( var_1 );
        }
        else if ( var_1 != "item_geigercouner_level1" )
        {
            var_0 stoploopsound();
            var_1 = "item_geigercouner_level1";
            var_0 playloopsound( var_1 );
        }

        wait 0.1;
    }

    var_0 stoploopsound();
    waittillframeend;
    var_0 delete();
}

package_doorsetup()
{
    var_0 = getentarray( self.targetname, "target" );

    for ( var_1 = 0; var_1 < var_0.size; var_1++ )
        var_0[var_1] linkto( self );

    var_2 = common_scripts\utility::getstruct( self.target, "targetname" );
    var_3 = spawn( "script_origin", ( 0.0, 0.0, 0.0 ) );
    var_3.axial = 1;
    var_4 = var_2.origin;
    var_5 = undefined;
    var_6 = anglestoup( var_2.angles );
    var_6 = maps\_utility::vector_multiply( var_6, 10 );

    if ( issubstr( self.target, "right" ) )
        var_5 = var_4 - var_6;
    else
        var_5 = var_4 + var_6;

    var_7 = ( 0.0, 360.0, 0.0 );
    var_8 = var_2.angles;
    var_3.origin = var_4;
    var_3.angles = vectortoangles( var_5 - var_4 );
    var_3.pratio = 1;
    var_3.rratio = -1;
    var_3.sway1max = 20;
    var_3.sway2max = 20;
    var_3.setscale = undefined;
    self.link = var_3;
    self waittill( "sway" );
    self linkto( var_3 );
    maps\_sea::sea_objectbob_logic( level._sea_org, var_3 );
}

escape_main()
{
    common_scripts\utility::flag_wait( "escape" );
    setsaveddvar( "cl_NoWeaponBobAmplitudeVertical", 3.0 );
    setsaveddvar( "cl_NoWeaponBobAmplitudeHorizontal", 3.0 );
    level.heroes5["price"].grenadeawareness = 0;
    level.heroes5["price"] setisignoringgrenades( 1 );
    level.heroes5["price"].a.disablepain = 1;
    level.heroes5["price"].allowpain = 0;
    level.heroes5["grigsby"].grenadeawareness = 0;
    level.heroes5["grigsby"] setisignoringgrenades( 1 );
    level.heroes5["grigsby"].a.disablepain = 1;
    level.heroes5["grigsby"].allowpain = 0;
    level.heroes5["alavi"].grenadeawareness = 0;
    level.heroes5["alavi"] setisignoringgrenades( 1 );
    level.heroes5["alavi"].a.disablepain = 1;
    level.heroes5["alavi"].allowpain = 0;
    maps\cargoship_code::water_stuff_for_art1( 1 );
    thread maps\cargoship_code::water_stuff_for_art2( 0 );
    common_scripts\utility::flag_set( "escape_cargohold2_fx" );
    common_scripts\utility::flag_set( "final_sun_direction" );
    maps\cargoship_code::escape_heroes_turn_setup();
    maps\cargoship_code::escape_heroes_runanim_setup();
    thread maps\cargoship_code::escape_fx_setup();
    thread maps\cargoship_code::escape_tiltboat();
    thread escape_dialogue();
    thread maps\cargoship_code::escape_catwalk();
    thread maps\cargoship_code::escape_hallways_lower_flood();
    thread escape_seaknight();
    thread maps\cargoship_code::escape_autosaves();
    thread maps\cargoship_code::escape_invisible_timer();
    common_scripts\utility::array_thread( getentarray( "cargohold_debri", "targetname" ), maps\cargoship_code::escape_debri );
    common_scripts\utility::array_thread( getentarray( "escape_event", "targetname" ), maps\cargoship_code::escape_event );
    common_scripts\utility::array_thread( getentarray( "light_cargohold", "targetname" ), maps\cargoship_code::misc_light_flicker, "cargo_vl_white", "cargohold_fx", "escape_explosion" );
    common_scripts\utility::array_thread( getentarray( "lights_cargohold_up", "targetname" ), maps\cargoship_code::misc_light_flicker, "cargo_vl_white_soft", "cargohold_fx", "escape_explosion" );
    common_scripts\utility::array_thread( getentarray( "lights_hallway_lower", "targetname" ), maps\cargoship_code::misc_light_flicker, undefined, "cargohold_fx", "escape_explosion" );
    common_scripts\utility::flag_wait( "package_secure" );
    level.heroes3["price"].animname = "escape";
    level.heroes3["grigsby"].animname = "escape";
    level.heroes3["alavi"].animname = "escape";
    level.heroes3["price"] thread maps\mo_tools::anim_single_stack( level.heroes3["price"], "cargoship_pri_topside" );
    var_0 = [];
    var_0[var_0.size] = level.heroes3["price"];
    var_0[var_0.size] = level.heroes3["alavi"];
    var_0[var_0.size] = level.heroes3["grigsby"];
    level.heroes3["price"] maps\_utility::ent_flag_init( "turning" );
    level.heroes3["grigsby"] maps\_utility::ent_flag_init( "turning" );
    level.heroes3["alavi"] maps\_utility::ent_flag_init( "turning" );
    level.heroes3["price"] thread maps\cargoship_code::escape_heroes_holdtheline( 350, var_0, 100, undefined, undefined, 1 );
    level.heroes3["grigsby"] thread maps\cargoship_code::escape_heroes_holdtheline( 450, var_0, 100, undefined, undefined, 1 );
    level.heroes3["alavi"] thread maps\cargoship_code::escape_heroes_holdtheline( 300, var_0, 100, undefined, undefined, 1 );
    common_scripts\utility::array_thread( level.heroes3, maps\cargoship_code::escape_heroes );
    common_scripts\utility::array_thread( getentarray( "sink_waterlevel", "targetname" ), maps\cargoship_code::escape_waterlevel );
    common_scripts\utility::array_thread( getentarray( "escape_flags", "script_noteworthy" ), common_scripts\utility::trigger_on );
    thread maps\cargoship_code::escape_explosion();
    common_scripts\utility::flag_set( "escape_exterior_visionset" );
    var_1 = getentarray( "escape_stair_blocker", "targetname" );

    for ( var_2 = 0; var_2 < var_1.size; var_2++ )
    {
        var_1[var_2] show();
        var_1[var_2] solid();

        if ( var_1[var_2].spawnflags & 1 )
            var_1[var_2] disconnectpaths();
    }

    var_3 = getent( "player_end_water_clip", "targetname" );
    var_3 solid();
    common_scripts\utility::flag_wait( "escape_explosion" );
    // level.heroes3["price"] maps\_utility::delaythread( 14, ::setheadmodel, "head_sas_ct_assault_price_mask_up_wrinkle" );
    thread end_sinking_scenario_vfx();
    level.heroes3["price"] setanimlimited( %price_mask_up, 0 );
    thread maps\cargoship_code::showgasmaskcracks();
    thread maps\cargoship_lighting::activate_emergency_lights();
    common_scripts\utility::array_thread( level.heroes3, maps\cargoship_code::escape_heroes2 );
    common_scripts\utility::flag_wait( "escape_get_to_catwalks_gaz_alavi" );
    level.heroes3["alavi"] thread maps\_utility::function_stack( maps\cargoship_code::escape_heroes_run, "escape_cargohold2" );
    level.heroes3["grigsby"] thread maps\_utility::function_stack( maps\cargoship_code::escape_heroes_run, "escape_cargohold2" );
    common_scripts\utility::flag_wait( "escape_get_to_catwalks_price" );
    // level.heroes3["price"] maps\_utility::delaythread( 4, ::setheadmodel, level.price_normal_headmodel );
    maps\cargoship_code::player_speed_set_cargoship( 80, 0.25 );
    maps\_utility::delaythread( 0.5, maps\cargoship_code::player_speed_set_cargoship, 175, 3.5 );
    thread maps\cargoship_lighting::apply_lighting_pass_cargoship( "cargoship_escape" );
    wait 1;
    level.heroes3["price"] thread maps\_utility::function_stack( maps\cargoship_code::escape_heroes_run, "escape_cargohold2" );
    level.heroes3["alavi"] thread maps\cargoship_code::escape_heroes_holdtheline( 500, var_0, 200 );
    level.heroes3["grigsby"] thread maps\cargoship_code::escape_heroes_holdtheline( 400, var_0, 150 );
    level.heroes3["price"] thread maps\cargoship_code::escape_heroes_holdtheline( 350, var_0, 150 );
    var_4 = getarraykeys( level.heroes3 );

    for ( var_2 = 0; var_2 < var_4.size; var_2++ )
    {
        var_5 = var_4[var_2];
        level.heroes3[var_5] thread maps\_utility::function_stack( maps\cargoship_code::escape_heroes_run, "escape_cargohold2b" );
        level.heroes3[var_5] thread maps\_utility::function_stack( maps\cargoship_code::escape_heroes_run, "escape_cargohold1" );
        level.heroes3[var_5] thread maps\_utility::function_stack( maps\cargoship_code::escape_heroes_run, "escape_hallway_lower" );
        level.heroes3[var_5] thread maps\_utility::function_stack( maps\cargoship_code::escape_heroes_run, "escape_hallway_lowerb" );
        level.heroes3[var_5] thread maps\_utility::function_stack( maps\cargoship_code::escape_heroes_run, "escape_hallway_lowerc" );
        level.heroes3[var_5] thread maps\_utility::function_stack( maps\cargoship_code::escape_heroes_run, "escape_hallway_lowerd" );
        level.heroes3[var_5] thread maps\_utility::function_stack( maps\cargoship_code::escape_heroes_run, "escape_hallway_lowere" );
        level.heroes3[var_5] thread maps\_utility::function_stack( maps\cargoship_code::escape_heroes_run, "escape_hallway_upper" );
        level.heroes3[var_5] thread maps\_utility::function_stack( maps\cargoship_code::escape_heroes_run, "escape_hallway_upperb" );
        level.heroes3[var_5] thread maps\_utility::function_stack( maps\cargoship_code::escape_heroes_run, "escape_aftdeck" );
    }

    wait 0.55;
    level.heroes3["price"] setanimlimited( %price_mask_up, 1 );
    maps\cargoship_code::escape_sneakyslowplayer_underwaterfall();
    thread end_main();
}

setheadmodel( var_0 )
{
    if ( isdefined( self.headmodel ) )
        self detach( self.headmodel );

    self attach( var_0, "", 1 );
    self.headmodel = var_0;
}

end_main()
{
    var_0 = getent( "escape_end_anim_node", "targetname" );
    thread end_jump();
    thread end_nojump();
    thread end_anim_thread();
    thread maps\cargoship_code::end_handle_player_fall();
    common_scripts\utility::flag_wait( "escape_hallway_upper_flag" );
    var_1 = level.seaknight.model;
    var_2 = level.heroes3["price"];
    thread end_dialogue();
    common_scripts\utility::flag_wait( "escape_aftdeck_flag" );

    while ( distance( level.player.origin, var_2.origin ) > 800 )
        wait 0.05;

    level.heroes3["alavi"] thread maps\_utility::function_stack( ::escape_heroes_rescue );
    level.heroes3["grigsby"] maps\_utility::delaythread( 0.5, maps\_utility::function_stack, ::escape_heroes_rescue );
    level.heroes3["price"] maps\_utility::delaythread( 1.0, maps\_utility::function_stack, ::escape_heroes_rescue );
    var_3 = [];
    var_3[var_3.size] = level.heroes3["price"];
    var_3[var_3.size] = level.heroes3["alavi"];
    var_3[var_3.size] = level.heroes3["grigsby"];
    level.heroes3["alavi"] thread maps\cargoship_code::escape_heroes_holdtheline( 500, var_3, 200, 1.1 );
    level.heroes3["grigsby"] thread maps\cargoship_code::escape_heroes_holdtheline( 400, var_3, 150, 1.1 );
    level.heroes3["price"] thread maps\cargoship_code::escape_heroes_holdtheline( 350, var_3, 150, 1.1, 1 );
    thread maps\cargoship_code::player_speed_set_cargoship( 165, 1 );
    level endon( "mission_failed" );
    common_scripts\utility::flag_wait( "end_start_player_anim" );
    thread seaknight_rescue_dof();
    level.heroes5["price"] common_scripts\utility::hide_friendname_until_flag_or_notify( "end_screen_done" );
    level.heroes5["alavi"] common_scripts\utility::hide_friendname_until_flag_or_notify( "end_screen_done" );
    level.heroes5["grigsby"] common_scripts\utility::hide_friendname_until_flag_or_notify( "end_screen_done" );
    level.heroes5["seat5"] common_scripts\utility::hide_friendname_until_flag_or_notify( "end_screen_done" );
    level.heroes5["seat6"] common_scripts\utility::hide_friendname_until_flag_or_notify( "end_screen_done" );
    level.player freezecontrols( 1 );
    level.fogvalue["near"] = 500;
    level.fogvalue["half"] = 15000;
    var_4 = maps\_utility::spawn_anim_model( "end_hands" );
    var_4 hide();
    var_1 maps\_anim::anim_first_frame_solo( var_4, "player_rescue", "tag_detach" );
    var_4 linkto( var_1, "tag_detach" );
    var_5 = 0.25;
    level._sea_org rotateto( ( 0.0, 0.0, 0.0 ), var_5 );
    thread maps\_utility::flag_clear_delayed( "_sea_viewbob", var_5 );
    var_6 = spawn( "script_origin", level.player.origin );
    var_6.origin = level.player maps\_utility::get_player_feet_from_view();
    var_6.angles = level.player getgunangles();
    level.player playerlinktoabsolute( var_6, undefined );
    var_7 = var_4 gettagorigin( "tag_player" );
    var_8 = var_4 gettagangles( "tag_player" );
    var_6 moveto( var_7, var_5 );
    var_6 rotateto( var_8, var_5 );
    wait(var_5);
    var_6 delete();
    var_4 show();
    level.player playerlinktoabsolute( var_4, "tag_player", 1 );
    common_scripts\utility::flag_set( "end_linked_player_to_rig" );
    maps\cargoship_lighting::apply_lighting_pass_cargoship( "cargoship_outro", 1 );
    end_reduce_all_dynamic_lights();
    var_0 notify( "stop_loop_heli" );
    var_0 thread maps\_anim::anim_single_solo( var_1, "out" );
    var_2 linkto( var_1, "tag_detach" );
    var_1 thread maps\_anim::anim_generic( var_2, "help_price", "tag_detach" );
    var_1 thread maps\_anim::anim_single_solo( var_4, "player_rescue", "tag_detach" );
    level.heroes3["alavi"] linkto( var_1, "tag_detach" );
    var_1 thread maps\_anim::anim_generic( level.heroes3["alavi"], "help_alavi", "tag_detach" );
    level.heroes3["grigsby"] linkto( var_1, "tag_detach" );
    var_1 thread maps\_anim::anim_generic( level.heroes3["grigsby"], "help_grigsby", "tag_detach" );
    setsaveddvar( "compass", 0 );
    setsaveddvar( "ammoCounterHide", "1" );
    setsaveddvar( "hud_showStance", 0 );
    common_scripts\utility::flag_wait( "gotcha" );
    end_scene_setup();
    common_scripts\utility::flag_wait( "end_finished" );
    thread end_screen();
}

end_anim_thread()
{
    common_scripts\utility::flag_wait( "escape_seaknight_ready" );
    var_0 = level.seaknight.model;
    var_1 = level.heroes3["price"];
    var_2 = getent( "escape_end_anim_node", "targetname" );
    common_scripts\utility::flag_wait( "escape_seaknight_flag" );
    var_0 maps\_utility::delaythread( 1, common_scripts\utility::play_loop_sound_on_entity, "seaknight_idle_high" );
    var_0 thread maps\cargoship_code::seaknight_playlightfx();
    var_2 maps\_anim::anim_single_solo( var_0, "in" );

    if ( !common_scripts\utility::flag( "end_price_rescue_anim" ) )
        var_2 thread maps\_anim::anim_loop_solo( var_0, "idle", undefined, "stop_loop_heli" );

    common_scripts\utility::flag_wait( "escape_player_near_end" );
    common_scripts\utility::flag_wait( "escape_alavi_loading" );
    wait 1.6;

    if ( distance( level.player.origin, var_1.origin ) < 512 )
        thread maps\cargoship_code::escape_player_last_quake();

    thread end_heli_drift_anim_thread( var_0, var_2 );
    var_1 setanimlimited( %price_mask_up, 0 );
    common_scripts\utility::flag_wait( "end_price_rescue_anim" );
    common_scripts\utility::flag_wait( "escape_price_start_rescue" );
    var_2 maps\_anim::anim_generic( var_1, "rescue_price" );
    var_1 linkto( var_0, "tag_detach" );

    if ( !common_scripts\utility::flag( "end_start_player_anim" ) )
        var_0 thread maps\_anim::anim_generic_loop( var_1, "rescue_price_idle", "tag_detach", "stop_loop_price" );

    common_scripts\utility::flag_wait_or_timeout( "end_start_player_anim", 3 );

    if ( common_scripts\utility::flag( "end_start_player_anim" ) )
    {
        common_scripts\utility::flag_wait( "end_linked_player_to_rig" );
        return;
    }

    common_scripts\utility::flag_set( "end_seaknight_leaving" );
    maps\_utility::delaythread( 5, maps\cargoship_code::escape_mission_failed );
    thread common_scripts\utility::play_sound_in_space( "elm_wave_crash_ext", ( -3392.0, 656.0, -64.0 ) );
    common_scripts\_exploder::exploder( "900" );
    level.hud_mantle["text"].alpha = 0;
    var_2 notify( "stop_loop_heli" );
    var_0 notify( "stop_loop_price" );
    var_2 thread maps\_anim::anim_single_solo( var_0, "out" );
}

end_heli_drift_anim_thread( var_0, var_1 )
{
    level endon( "end_start_player_anim" );
    var_1 notify( "stop_loop_heli" );
    var_1 maps\_anim::anim_single_solo( var_0, "drift" );
    var_1 thread maps\_anim::anim_loop_solo( var_0, "drift_idle", undefined, "stop_loop_heli" );
}

end_scene_setup()
{
    if ( getdvar( "new_end_scene" ) == "1" )
        return;
}

seaknight_rescue_dof()
{
    level.player enablephysicaldepthoffieldscripting();
    level.player setphysicaldepthoffield( 1.0, 180, 2.0, 2.0 );
    wait 0.65;
    setsaveddvar( "r_mbEnable", 2 );
    wait 0.7;
    level.player setphysicaldepthoffield( 1.0, 180, 9.0, 9.0 );
    wait 0.76;
    level.player setphysicaldepthoffield( 0.8, 85, 4.0, 4.0 );
    wait 0.6;
    level.player setphysicaldepthoffield( 1.6, 36, 1.0, 1.0 );
    wait 1.1;
    level.player setphysicaldepthoffield( 2.4, 22, 8.0, 8.0 );
    wait 0.56;
    level.player setphysicaldepthoffield( 2.0, 17.5, 6.0, 6.0 );
    wait 0.74;
    level.player setphysicaldepthoffield( 0.8, 35.0, 8.0, 8.0 );
    wait 1.0;
    level.player setphysicaldepthoffield( 24, 7.0, 0.5, 0.5 );
    wait 1.16;
    level.player setphysicaldepthoffield( 0.7, 800, 8.0, 8.0 );
    wait 18.0;
    level.player disablephysicaldepthoffieldscripting();
    setsaveddvar( "r_mbEnable", 0 );
}

escape_heroes_rescue()
{
    thread escape_heroes_rescuing_order();
    maps\_utility::clear_run_anim();
    var_0 = getent( "escape_end_anim_node", "targetname" );
    var_1 = level.seaknight.model;
    var_2 = "rescue_" + self.script_noteworthy;
    var_3 = var_2 + "_idle";
    var_4 = "stop_loop" + self.script_noteworthy;

    if ( self.script_noteworthy == "price" )
    {
        var_0 maps\_anim::anim_generic_reach( self, "reach_price" );
        common_scripts\utility::flag_set( "end_price_rescue_anim" );
    }
    else
    {
        var_0 maps\_anim::anim_generic_reach( self, var_2 );

        if ( self.script_noteworthy == "alavi" )
        {
            common_scripts\utility::flag_wait( "escape_alavi_start_rescue" );
            common_scripts\utility::flag_set( "escape_alavi_loading" );
        }
        else if ( self.script_noteworthy == "grigsby" )
            common_scripts\utility::flag_wait( "escape_gaz_start_rescue" );

        var_0 maps\_anim::anim_generic( self, var_2 );
        self linkto( var_1, "tag_detach" );
        var_1 thread maps\_anim::anim_generic_loop( self, var_3, "tag_detach", var_4 );
    }
}

escape_heroes_rescuing_order()
{
    common_scripts\utility::flag_wait( "escape_player_near_end" );
    common_scripts\utility::flag_set( "escape_alavi_start_rescue" );
    wait 0.7;
    common_scripts\utility::flag_set( "escape_gaz_start_rescue" );
    wait 0.1;
    common_scripts\utility::flag_set( "escape_price_start_rescue" );
}

#using_animtree("vehicles");

escape_seaknight()
{
    common_scripts\utility::flag_wait( "escape_hallway_lower_flag" );
    var_0 = getent( "escape_end_anim_node", "targetname" );
    level.seaknight = maps\cargoship_code::seaknight_spawn( var_0 );
    var_1 = spawn( "script_model", level.seaknight.model gettagorigin( "body_animate_jnt" ) );
    var_1 setmodel( "vehicle_ch46e_opened_door_interior_b" );
    var_1.angles = level.seaknight.model.angles;
    var_1 linkto( level.seaknight.model, "body_animate_jnt" );
    var_2 = spawn( "script_model", level.seaknight.model gettagorigin( "body_animate_jnt" ) );
    var_2 setmodel( "vehicle_ch46e_wires" );
    var_2.angles = level.seaknight.model.angles;
    var_2 linkto( level.seaknight.model, "body_animate_jnt" );
    var_3 = spawn( "script_model", level.seaknight.model gettagorigin( "tag_cs_alarm" ) );
    var_3 setmodel( "h1_cs_light_alarm_short" );
    var_3.angles = level.seaknight.model.angles;
    var_3 addroll( 180 );
    var_3 linkto( level.seaknight.model, "tag_cs_alarm" );
    var_4 = level.heroes5["seat5"];
    var_4.animname = var_4.script_noteworthy;
    var_4 linkto( level.seaknight.model, "tag_detach" );
    level.seaknight.model thread maps\_anim::anim_loop_solo( var_4, "rescue", "tag_detach", "never_stop" );
    var_4 = level.heroes5["seat6"];
    var_4.animname = var_4.script_noteworthy;
    var_4 linkto( level.seaknight.model, "tag_detach" );
    level.seaknight.model thread maps\_anim::anim_loop_solo( var_4, "rescue", "tag_detach", "never_stop" );
    level.seaknight.model useanimtree( #animtree );
    level.seaknight.model setanim( %sniper_escape_ch46_rotors );
    common_scripts\utility::flag_set( "escape_seaknight_ready" );
}

end_jump()
{
    level endon( "player_rescued" );
    level endon( "end_seaknight_leaving" );
    var_0 = getent( "escape_player_jump", "targetname" );
    notifyoncommand( "jump", "+gostand" );
    notifyoncommand( "jump", "+moveup" );
    var_0 thread end_jump_mantle();
    var_0 waittill( "trigger" );

    for (;;)
    {
        level.player waittill( "jump" );

        if ( level.player istouching( var_0 ) && level.player getstance() == "stand" && end_mantle_angle() )
            break;
    }

    level.hud_mantle["text"].alpha = 0;
    common_scripts\utility::flag_set( "end_start_player_anim" );
    soundscripts\_snd::snd_message( "start_mix_final_jump" );
}

end_mantle_angle()
{
    var_0 = level.player getplayerangles();
    var_1 = anglestoforward( var_0 );
    var_2 = vectornormalize( level.seaknight.model.origin - level.player.origin );

    if ( vectordot( var_1, var_2 ) > 0.75 )
        return 1;
    else
        return 0;
}

end_jump_mantle()
{
    level endon( "end_start_player_anim" );
    level endon( "end_seaknight_leaving" );

    if ( getdvarint( "e3_cargoship_gameplay_video", 0 ) != 0 )
    {
        level.hud_mantle["text"].alpha = 0;
        return;
    }

    for (;;)
    {
        self waittill( "trigger" );

        if ( end_mantle_angle() )
        {
            level.hud_mantle["text"].font = "timer";
            level.hud_mantle["text"].fontscale = 0.5;
            level.hud_mantle["text"].alpha = 1;
        }

        while ( level.player istouching( self ) && end_mantle_angle() )
            wait 0.05;

        level.hud_mantle["text"].alpha = 0;
    }
}

end_nojump()
{
    level endon( "player_rescued" );
    level endon( "end_seaknight_leaving" );
    var_0 = getent( "escape_player_nojump", "targetname" );

    for (;;)
    {
        var_0 waittill( "trigger" );
        common_scripts\utility::flag_set( "end_no_jump" );
        level.player allowjump( 0 );

        while ( level.player istouching( var_0 ) )
            wait 0.05;

        level.player allowjump( 1 );
    }
}

end_music()
{
    common_scripts\utility::flag_wait( "cargoship_end_music" );
    musicstop();
    soundscripts\_snd::snd_message( "start_mix_finale_music" );
    wait 0.1;
    maps\_utility::musicplaywrapper( "cargoship_finale_music" );
}

end_dialogue()
{
    var_0 = level.heroes3["grigsby"];
    var_1 = level.heroes3["price"];
    common_scripts\utility::flag_wait( "escape_seaknight_flag" );
    wait 1;
    var_0 maps\mo_tools::anim_single_stack( var_0, "cargoship_grg_whereisit" );
    common_scripts\utility::flag_wait( "end_no_jump" );
    maps\mo_tools::radio_msg_stack( "cargoship_gm2_jumpforit" );
    common_scripts\utility::flag_wait( "end_linked_player_to_rig" );
    wait 3.7;
    thread end_music();
    common_scripts\utility::flag_set( "gotcha" );
    thread end_sink_ship();
    wait 2;
    soundscripts\_snd::snd_message( "aud_get_in_seaknight" );
    maps\mo_tools::radio_msg_stack( "cargoship_pri_allaboard" );
    common_scripts\utility::flag_set( "player_rescued" );
    maps\mo_tools::radio_msg_stack( "cargoship_hp3_outtahere" );
    maps\mo_tools::radio_msg_stack( "cargoship_hp3_returntobase" );
    thread common_scripts\utility::play_sound_in_space( "scn_heli_jump_final_thunder_lr", ( 0.0, 0.0, 0.0 ) );
    maps\_utility::flag_set_delayed( "end_finished", 2 );
}

end_sinking_scenario_vfx()
{
    var_0 = maps\_utility::getfxarraybyid( "falling_drip_faucet" );
    var_0 = common_scripts\utility::array_combine( var_0, maps\_utility::getfxarraybyid( "water_pipe_leak_interior_loop" ) );
    var_0 = common_scripts\utility::array_combine( var_0, maps\_utility::getfxarraybyid( "water_pipe_leak_interior_loop_cgoshp" ) );
    var_0 = common_scripts\utility::array_combine( var_0, maps\_utility::getfxarraybyid( "steam_pipe_leak_interior_loop_sml" ) );
    var_0 = common_scripts\utility::array_combine( var_0, maps\_utility::getfxarraybyid( "steam_pipe_leak_interior_loop_med" ) );
    var_0 = common_scripts\utility::array_combine( var_0, maps\_utility::getfxarraybyid( "steam_pipe_leak_interior_loop_lrg" ) );
    var_0 = common_scripts\utility::array_combine( var_0, maps\_utility::getfxarraybyid( "steam_pipe_leak_interior_loop_cgoshp_red" ) );
    var_0 = common_scripts\utility::array_combine( var_0, maps\_utility::getfxarraybyid( "light_mist_ceiling_cgoshp" ) );
    var_0 = common_scripts\utility::array_combine( var_0, maps\_utility::getfxarraybyid( "cargo_door_grays_white_stairs_cgoshp" ) );
    var_0 = common_scripts\utility::array_combine( var_0, maps\_utility::getfxarraybyid( "heavy_mist_cgoshp" ) );

    for ( var_1 = 0; var_1 < var_0.size; var_1++ )
        var_0[var_1] common_scripts\utility::pauseeffect();

    wait 6.0;
    common_scripts\_exploder::exploder( "602" );
    wait 5.0;
    common_scripts\_exploder::exploder( "452" );
    common_scripts\utility::flag_wait( "escape_hallway_lower_enter" );
    common_scripts\_exploder::exploder( "451" );
    common_scripts\_exploder::exploder( "453" );
    wait 2.0;
    maps\_utility::stop_exploder( "400" );
    maps\_utility::stop_exploder( "401" );
    maps\_utility::stop_exploder( "402" );
    maps\_utility::stop_exploder( "602" );
    common_scripts\utility::flag_wait( "escape_hallway_lower_flood" );
    common_scripts\_exploder::exploder( "454" );
    common_scripts\_exploder::exploder( "455" );
    maps\_utility::stop_exploder( "451" );
    maps\_utility::stop_exploder( "452" );
    common_scripts\utility::flag_wait( "escape_hallway_upper_flag" );
    common_scripts\utility::flag_clear( "_weather_lightning_enabled" );
    maps\_utility::stop_exploder( "453" );
    var_2 = maps\_utility::getfxarraybyid( "cgoshp_drips_a" );
    var_2 = common_scripts\utility::array_combine( var_2, maps\_utility::getfxarraybyid( "cgoshp_drips_b" ) );
    var_2 = common_scripts\utility::array_combine( var_2, maps\_utility::getfxarraybyid( "water_sweeping_cgoshp" ) );
    var_2 = common_scripts\utility::array_combine( var_2, maps\_utility::getfxarraybyid( "water_sweeping_cgoshp_sml" ) );
    var_3 = maps\_utility::getfxarraybyid( "escape_waterdrips_exterior" );

    for ( var_1 = 0; var_1 < var_2.size; var_1++ )
        var_2[var_1] common_scripts\utility::pauseeffect();

    for ( var_1 = 0; var_1 < var_3.size; var_1++ )
        var_3[var_1] maps\_utility::restarteffect();

    common_scripts\utility::flag_wait( "escape_aftdeck_flag" );
    common_scripts\_exploder::exploder( "456" );
    var_4 = 2.4;
    maps\_utility::delaythread( var_4, maps\_weather::lightningflash, maps\cargoship_fx::normal, maps\cargoship_fx::flash );
    wait(var_4);
    common_scripts\_exploder::exploder( "20" );
    common_scripts\utility::flag_wait( "escape_seaknight_flag" );
    maps\_utility::stop_exploder( "455" );
    var_4 = 5.2;
    maps\_utility::delaythread( var_4, maps\_weather::lightningflash, maps\cargoship_fx::normal, maps\cargoship_fx::flash );
    wait(var_4);
    common_scripts\_exploder::exploder( "21" );
    common_scripts\utility::flag_wait( "end_start_player_anim" );
    maps\_utility::stop_exploder( "454" );
    maps\_utility::stop_exploder( "456" );
    common_scripts\_exploder::exploder( "901" );
    common_scripts\utility::flag_clear( "player_weather_enabled" );
    playfxontag( level._effect["rain_heavy_mist_heli_hack_2"], level.seaknight.model, "tag_light_cargo01" );
    wait 0.8;
    common_scripts\utility::flag_set( "cargoship_rain_off" );
    common_scripts\utility::flag_clear( "cargoship_rain_on" );
    common_scripts\utility::flag_wait( "gotcha" );
    var_5 = 10.6;
    var_6 = 0.15;
    var_7 = 0.2;
    var_8 = 0.1;
    var_9 = 0.05;
    var_10 = 0.1;
    var_11 = 0.12;
    var_12 = maps\_utility::getfxarraybyid( "cgoshp_light_tip_red" );
    var_12 = common_scripts\utility::array_combine( var_12, maps\_utility::getfxarraybyid( "cgoshp_light_tip_green" ) );
    var_12 = common_scripts\utility::array_combine( var_12, maps\_utility::getfxarraybyid( "cgoshp_light_tip_white" ) );
    common_scripts\utility::array_thread( common_scripts\utility::getstructarray( "spotlights", "targetname" ), ::end_sinking_spotlight_fx, var_5, var_6, var_7, var_8, var_9, var_10, var_11 );
    common_scripts\utility::array_thread( maps\_utility::getfxarraybyid( "cgoshp_lights_cr_fly_light" ), ::end_sinking_light_fx, var_5, var_6, var_7, var_8, var_9, var_10, var_11 );
    common_scripts\utility::array_thread( var_12, ::end_sinking_light_fx, var_5, var_6, var_7, var_8, var_9, var_10, 0.05 );
    wait 3.0;
    common_scripts\_exploder::exploder( "902" );
    wait 0.3;
    common_scripts\_exploder::exploder( "1001" );
    earthquake( 0.25, 0.5, level.player.origin, 80000 );
    thread common_scripts\utility::play_sound_in_space( "cargoship_jumpforheli_end_explo", level.player.origin );
    wait 0.4;
    common_scripts\_exploder::exploder( "1002" );
    wait 0.15;
    earthquake( 0.15, 0.8, level.player.origin, 80000 );
    var_4 = 0.65;
    maps\_utility::delaythread( var_4, maps\_weather::lightningflash, maps\cargoship_fx::normal, maps\cargoship_fx::flash );
    wait(var_4);
    common_scripts\_exploder::exploder( "25" );
    wait 0.2;
    common_scripts\_exploder::exploder( "24" );
    wait 1.4;
    common_scripts\_exploder::exploder( "1003" );
    wait 0.3;
    common_scripts\_exploder::exploder( "1005" );
    wait 0.15;
    earthquake( 0.1, 1, level.player.origin, 80000 );
    wait 0.85;
    common_scripts\_exploder::exploder( "1004" );
    wait 4.2;
    common_scripts\_exploder::exploder( "903" );
}

end_sinking_spotlight_fx( var_0, var_1, var_2, var_3, var_4, var_5, var_6 )
{
    killfxontag( common_scripts\utility::getfx( "cgoshp_lights_cr" ), self.tagent, "tag_origin" );
    playfxontag( common_scripts\utility::getfx( "cgoshp_lights_cr_fly" ), self.tagent, "tag_origin" );
    wait(var_0);
    wait(randomfloat( var_6 ));
    playfxontag( common_scripts\utility::getfx( "cgoshp_lights_cr_high" ), self.tagent, "tag_origin" );
    wait(var_1);
    killfxontag( common_scripts\utility::getfx( "cgoshp_lights_cr_fly" ), self.tagent, "tag_origin" );
    wait(var_2);
    playfxontag( common_scripts\utility::getfx( "cgoshp_lights_cr_fly" ), self.tagent, "tag_origin" );
    wait(var_3);
    killfxontag( common_scripts\utility::getfx( "cgoshp_lights_cr_fly" ), self.tagent, "tag_origin" );
    wait(var_4);
    playfxontag( common_scripts\utility::getfx( "cgoshp_lights_cr_low" ), self.tagent, "tag_origin" );
    wait(var_5);
    killfxontag( common_scripts\utility::getfx( "cgoshp_lights_cr_low" ), self.tagent, "tag_origin" );
}

end_sinking_light_fx( var_0, var_1, var_2, var_3, var_4, var_5, var_6 )
{
    maps\_utility::restarteffect();
    wait(var_0);
    wait(randomfloat( var_6 ));
    wait(var_1);
    common_scripts\utility::pauseeffect();
    wait(var_2);
    maps\_utility::restarteffect();
    wait(var_3);
    common_scripts\utility::pauseeffect();
    wait(var_4);
    maps\_utility::restarteffect();
    wait(var_5);
    common_scripts\utility::pauseeffect();
}

end_reduce_all_dynamic_lights()
{
    var_0 = getentarray( "light_spot", "classname" );
    var_1 = getentarray( "light_omni", "classname" );
    var_2 = common_scripts\utility::array_combine( var_0, var_1 );

    foreach ( var_4 in var_2 )
    {
        var_4 setlightintensity( 1 );
        var_4 setlightradius( 12 );
        var_4 setlightfovrange( 6, 0 );
    }
}

escape_dialogue()
{
    var_0 = level.heroes3["grigsby"];
    var_1 = level.heroes3["price"];
    common_scripts\utility::flag_wait( "escape_moveup1" );
    var_1 maps\mo_tools::anim_single_stack( var_1, "cargoship_pri_status" );
    var_2 = spawn( "script_origin", level.player.origin );
    var_2 linkto( level.player );
    var_2 thread maps\_utility::play_sound_on_tag_endon_death( "cargoship_gm2_aircraftinbound2" );
    common_scripts\utility::flag_wait( "escape_explosion" );
    thread maps\_utility::flag_set_delayed( "escape_get_to_catwalks_gaz_alavi", 20 );
    thread maps\_utility::flag_set_delayed( "escape_get_to_catwalks_price", 22.25 );
    thread maps\_utility::flag_set_delayed( "escape_get_to_catwalks", 22.25 );
    var_2 delete();
    wait 3;
    thread maps\mo_tools::radio_msg_stack( "cargoship_hp3_yourstatus" );
    wait 4;
    thread maps\mo_tools::radio_msg_stack( "cargoship_grg_whathappened" );
    wait 4;
    wait 3.5;
    thread maps\mo_tools::radio_msg_stack( "cargoship_hp3_comein" );
    var_1 maps\_utility::delaythread( 10, maps\mo_tools::anim_single_stack, var_1, "cargoship_pri_gettocatwalks" );
    var_0 maps\_utility::delaythread( 11, maps\mo_tools::anim_single_stack, var_0, "cargoship_grg_movego" );
    common_scripts\utility::flag_wait( "escape_dialogue1" );
    var_1 maps\_utility::delaythread( 0.5, maps\mo_tools::anim_single_stack, var_1, "cargoship_pri_backonfeet" );
    maps\_utility::delaythread( 5, maps\mo_tools::radio_msg_stack, "cargoship_gm1_watchyerhead" );
    common_scripts\utility::flag_wait( "escape_dialogue2" );
    var_0 thread maps\mo_tools::anim_single_stack( var_0, "cargoship_grg_keepmoving" );
    common_scripts\utility::flag_wait( "escape_catwalk" );
    var_0 thread maps\mo_tools::anim_single_stack( var_0, "cargoship_grg_breakinaway" );
    var_1 thread maps\mo_tools::anim_single_stack( var_1, "cargoship_pri_comeoncomeon" );
    common_scripts\utility::flag_wait( "escape_hallway_lower_enter" );
    common_scripts\utility::flag_clear( "hallways_lowerhall2" );
    var_0 maps\_utility::delaythread( 1, maps\mo_tools::anim_single_stack, var_0, "cargoship_grg_watchpipes" );
    common_scripts\utility::flag_wait( "hallways_lowerhall2" );
    maps\mo_tools::radio_msg_stack( "cargoship_hp3_talktome" );
    var_1 maps\mo_tools::anim_single_stack( var_1, "cargoship_pri_almostthere" );
    common_scripts\utility::flag_wait( "escape_hallway_lower_flag" );
    maps\mo_tools::radio_msg_stack( "cargoship_gm1_whichway" );
    var_1 maps\mo_tools::anim_single_stack( var_1, "cargoship_pri_totheright" );
    common_scripts\utility::flag_wait( "escape_hallway_upper_flag" );
    var_0 maps\mo_tools::anim_single_stack( var_0, "cargoship_grg_outtatime" );
    var_1 maps\_utility::delaythread( 2, maps\mo_tools::anim_single_stack, var_1, "cargoship_pri_keepmoving" );
}

end_sink_ship()
{
    level._sea_link movez( 550, 0.5 );
    level._sea_org movez( 550, 0.5 );
    var_0 = ( -10.0, 0.0, -40.0 );
    level._sea_link rotateto( var_0, 0.5 );
    level._sea_org rotateto( var_0, 0.5 );
    wait 0.5;
    level._sea_link movez( 1400, 15 );
    level._sea_org movez( 1400, 15 );
    level.heroes5["price"].grenadeawareness = 1;
    level.heroes5["grigsby"].grenadeawareness = 1;
    level.heroes5["alavi"].grenadeawareness = 1;
}

end_screen()
{
    var_0 = maps\cargoship_code::create_overlay_element( "black", 0 );
    var_0.sort = 3;
    level.player shellshock( "cargoship", 50 );
    var_0 maps\cargoship_code::exp_fade_overlay( 1, 4 );

    if ( getdvar( "limited_mode" ) == "1" )
        wait 0.5;
    else
    {
        level.intro_offset = 0;
        var_1 = [];
        var_1[var_1.size] = &"CARGOSHIP_INFINITY_WARD_PRESENTS";

        for ( var_2 = 0; var_2 < var_1.size; var_2++ )
        {
            var_3 = 1;
            var_4 = var_2 * var_3 + 1;
            maps\_utility::delaythread( var_4, maps\cargoship_code::centerlinethread, var_1[var_2], var_1.size - var_2 - 1, var_3 );
        }

        setomnvar( "ui_gasmask", 0 );
        wait 5.5;
    }

    cinematicingamesync( "Title_Logo_Slam" );
    soundscripts\_snd::snd_message( "start_title_logo_mix" );
    wait 8;
    common_scripts\utility::flag_set( "end_screen_done" );
}

misc_dummy()
{
    level._sea_scale = 1.5;
}

misc_setup()
{
    common_scripts\utility::array_thread( common_scripts\utility::getstructarray( "spotlights", "targetname" ), ::misc_spotlight_fx );
    thread cargohold_lights_logic();
    common_scripts\utility::array_thread( getentarray( "falling_water_heavydoor_cgoshp", "targetname" ), ::misc_drip_sway_fx );
    common_scripts\utility::array_thread( getentarray( "falling_water_heavydoor_cgoshp_noripple", "targetname" ), ::misc_drip_sway_fx );
    common_scripts\utility::array_thread( getentarray( "falling_water_sidedoor_cgoshp", "targetname" ), ::misc_drip_sway_fx );
    common_scripts\utility::array_thread( getentarray( "falling_water_sidedoor_cgoshp_noripple", "targetname" ), ::misc_drip_sway_fx );
    common_scripts\utility::array_thread( getentarray( "fx_handler", "targetname" ), maps\cargoship_code::misc_fx_handler_trig );
    thread misc_fx_handlers();
    thread misc_hide_sea_trigger();
    thread misc_radar();
    common_scripts\utility::array_thread( getentarray( "tv", "targetname" ), maps\cargoship_code::misc_tv );
    common_scripts\utility::array_thread( getentarray( "tv", "targetname" ), maps\cargoship_code::misc_tv_stairs_on );
    common_scripts\utility::array_thread( getentarray( "light_flicker", "targetname" ), maps\cargoship_code::misc_light_flicker, undefined, "topside_fx" );
    common_scripts\utility::array_thread( getentarray( "light_cargohold", "targetname" ), maps\cargoship_code::misc_light_sway );
    common_scripts\utility::array_thread( getentarray( "escape_flags", "script_noteworthy" ), common_scripts\utility::trigger_off );
    common_scripts\utility::array_thread( getentarray( "deck_flags", "script_noteworthy" ), common_scripts\utility::trigger_off );
    common_scripts\utility::array_thread( getentarray( "sink_waterlevel", "targetname" ), ::misc_setup_waterlevel );
    var_0 = getentarray( "escape_stair_blocker", "targetname" );

    for ( var_1 = 0; var_1 < var_0.size; var_1++ )
    {
        var_0[var_1] hide();
        var_0[var_1] notsolid();

        if ( var_0[var_1].spawnflags & 1 )
            var_0[var_1] connectpaths();
    }

    var_2 = getent( "player_end_water_clip", "targetname" );
    var_2 notsolid();
    var_3 = getent( "cargohold1_utilitylight", "targetname" );
    var_4 = getent( "cargohold1_utilitylight_model", "targetname" );
    var_3 thread maps\cargoship_code::cargohold_1_light_sway( var_4 );
    var_5 = getentarray( "sink_waterlevel", "targetname" );

    for ( var_1 = 0; var_1 < var_5.size; var_1++ )
        var_5[var_1] hide();

    var_6 = getentarray( "escape_first_fallen_container", "targetname" );

    for ( var_1 = 0; var_1 < var_6.size; var_1++ )
    {
        var_6[var_1] notsolid();
        var_6[var_1] hide();

        if ( var_6[var_1].spawnflags & 1 )
            var_6[var_1] connectpaths();
    }

    var_7 = getentarray( "escape_big_blocker", "targetname" );

    for ( var_1 = 0; var_1 < var_7.size; var_1++ )
    {
        var_7[var_1] hide();
        var_7[var_1] notsolid();

        if ( var_7[var_1].spawnflags & 1 )
            var_7[var_1] connectpaths();
    }

    var_8 = getentarray( "cargohold_debri", "targetname" );

    for ( var_1 = 0; var_1 < var_8.size; var_1++ )
    {
        if ( !isdefined( var_8[var_1].target ) )
            continue;

        var_9 = getent( var_8[var_1].target, "targetname" );
        var_9 hide();
    }

    var_10 = maps\_utility::getfxarraybyid( "sparks_runner" );
    var_10 = common_scripts\utility::array_combine( var_10, maps\_utility::getfxarraybyid( "escape_waterdrips" ) );
    var_10 = common_scripts\utility::array_combine( var_10, maps\_utility::getfxarraybyid( "escape_waterdrips_exterior" ) );
    var_10 = common_scripts\utility::array_combine( var_10, maps\_utility::getfxarraybyid( "sinking_stair" ) );
    var_10 = common_scripts\utility::array_combine( var_10, maps\_utility::getfxarraybyid( "escape_water_drip_stairs" ) );
    var_10 = common_scripts\utility::array_combine( var_10, maps\_utility::getfxarraybyid( "escape_water_nodrip_stairs" ) );
    var_10 = common_scripts\utility::array_combine( var_10, maps\_utility::getfxarraybyid( "escape_water_side_stairs" ) );
    var_10 = common_scripts\utility::array_combine( var_10, maps\_utility::getfxarraybyid( "escape_water_gush_stairs" ) );
    var_10 = common_scripts\utility::array_combine( var_10, maps\_utility::getfxarraybyid( "escape_caustics" ) );

    for ( var_1 = 0; var_1 < var_10.size; var_1++ )
        var_10[var_1] maps\_utility::delaythread( 0.1, common_scripts\utility::pauseeffect );

    var_11 = getentarray( "escape_container", "targetname" );

    for ( var_1 = 0; var_1 < var_11.size; var_1++ )
    {
        var_12 = getent( var_11[var_1].target, "targetname" );
        var_12 hide();
        var_12 notsolid();
    }

    var_13 = getent( "package_dooranim_node", "targetname" );
    var_14 = spawn( "script_origin", var_13.origin + ( 0.0, 0.0, 10.0 ) );
    var_14.angles = var_13.angles;
    thread package_open_doors( var_14 );
    common_scripts\utility::array_thread( getentarray( "no_prone", "targetname" ), maps\cargoship_code::player_noprone );
    var_15 = getent( "h1_player_proximity", "targetname" );
    var_15 common_scripts\utility::trigger_off();
    maps\cargoship_code::hint_setup();
}

misc_setup_waterlevel()
{
    common_scripts\utility::array_thread( common_scripts\utility::getstructarray( self.target, "targetname" ), maps\cargoship_code::escape_waterlevel_parts, self );
    wait 1;
    maps\_utility::geo_off();
}

misc_fx_handlers()
{
    wait 0.1;
    var_0 = maps\_utility::getfxarraybyid( "cargo_vl_red_thin" );
    var_0 = common_scripts\utility::array_combine( var_0, maps\_utility::getfxarraybyid( "cargo_vl_white" ) );
    var_0 = common_scripts\utility::array_combine( var_0, maps\_utility::getfxarraybyid( "cargo_vl_white_soft" ) );
    var_0 = common_scripts\utility::array_combine( var_0, maps\_utility::getfxarraybyid( "cargo_vl_white_eql" ) );
    var_0 = common_scripts\utility::array_combine( var_0, maps\_utility::getfxarraybyid( "cargo_vl_white_eql_flare" ) );
    var_0 = common_scripts\utility::array_combine( var_0, maps\_utility::getfxarraybyid( "cargo_vl_white_sml" ) );
    var_0 = common_scripts\utility::array_combine( var_0, maps\_utility::getfxarraybyid( "cargo_vl_white_sml_a" ) );
    var_0 = common_scripts\utility::array_combine( var_0, maps\_utility::getfxarraybyid( "cargo_vl_red_lrg" ) );
    var_0 = common_scripts\utility::array_combine( var_0, maps\_utility::getfxarraybyid( "cargo_steam" ) );
    var_0 = common_scripts\utility::array_combine( var_0, maps\_utility::getfxarraybyid( "cargo_steam_single" ) );
    var_0 = common_scripts\utility::array_combine( var_0, maps\_utility::getfxarraybyid( "cargo_steam_single_strong" ) );
    var_0 = common_scripts\utility::array_combine( var_0, maps\_utility::getfxarraybyid( "chains" ) );
    var_0 = common_scripts\utility::array_combine( var_0, maps\_utility::getfxarraybyid( "light_mist_wall_cgoshp" ) );
    var_0 = common_scripts\utility::array_combine( var_0, maps\_utility::getfxarraybyid( "light_mist_ceiling_cgoshp" ) );
    var_1 = maps\_utility::getfxarraybyid( "cgoshp_lights_cr" );
    var_1 = common_scripts\utility::array_combine( var_1, maps\_utility::getfxarraybyid( "heavy_mist_cgoshp" ) );
    var_1 = common_scripts\utility::array_combine( var_1, maps\_utility::getfxarraybyid( "cgoshp_drips_a" ) );
    var_1 = common_scripts\utility::array_combine( var_1, maps\_utility::getfxarraybyid( "cgoshp_drips_b" ) );
    var_1 = common_scripts\utility::array_combine( var_1, maps\_utility::getfxarraybyid( "water_sweeping_cgoshp" ) );
    var_1 = common_scripts\utility::array_combine( var_1, maps\_utility::getfxarraybyid( "water_sweeping_cgoshp_sml" ) );
    var_1 = common_scripts\utility::array_combine( var_1, maps\_utility::getfxarraybyid( "cgoshp_light_tip_red" ) );
    var_1 = common_scripts\utility::array_combine( var_1, maps\_utility::getfxarraybyid( "cgoshp_light_tip_green" ) );
    var_1 = common_scripts\utility::array_combine( var_1, maps\_utility::getfxarraybyid( "cgoshp_light_tip_white" ) );
    var_2 = maps\_utility::getfxarraybyid( "cgoshp_lights_cr_fly_light" );

    for ( var_3 = 0; var_3 < var_2.size; var_3++ )
        var_2[var_3] common_scripts\utility::pauseeffect();

    for (;;)
    {
        if ( common_scripts\utility::flag( "cargohold_fx" ) )
        {
            for ( var_3 = 0; var_3 < var_1.size; var_3++ )
                var_1[var_3] common_scripts\utility::pauseeffect();

            for ( var_3 = 0; var_3 < var_0.size; var_3++ )
                var_0[var_3] maps\_utility::restarteffect();

            common_scripts\utility::flag_clear( "_sea_waves" );
            common_scripts\utility::flag_clear( "player_weather_enabled" );
            common_scripts\utility::flag_clear( "_weather_lightning_enabled" );
            thread maps\_weather::rainnone( 1 );
            misc_hidesea();
            maps\_compass::setupminimap( "compass_map_cargoship_2" );
            thread maps\_utility::set_ambient( "interior" );
            setsunlight( 0.001, 0.001, 0.001 );
            common_scripts\utility::flag_wait( "topside_fx" );
        }

        if ( common_scripts\utility::flag( "topside_fx" ) )
        {
            for ( var_3 = 0; var_3 < var_0.size; var_3++ )
                var_0[var_3] common_scripts\utility::pauseeffect();

            for ( var_3 = 0; var_3 < var_1.size; var_3++ )
                var_1[var_3] maps\_utility::restarteffect();

            if ( level.jumpto != "start" || common_scripts\utility::flag( "quarters" ) )
                common_scripts\utility::flag_set( "_sea_waves" );

            common_scripts\utility::flag_set( "player_weather_enabled" );
            common_scripts\utility::flag_set( "_weather_lightning_enabled" );
            thread maps\_weather::rainhard( 1 );
            misc_showsea();
            maps\_compass::setupminimap( "compass_map_cargoship" );
            thread maps\_utility::set_ambient( "exterior" );
            resetsunlight();
            common_scripts\utility::flag_wait( "cargohold_fx" );
        }
    }
}

misc_hidesea()
{
    level.sea_model hide();
    level.sea_black hide();
    level.sea_foam hide();
}

misc_showsea()
{
    level.sea_model show();
    level.sea_black show();
}

misc_hide_sea_trigger()
{
    var_0 = getent( "hide_sea_hack", "targetname" );

    for (;;)
    {
        var_0 waittill( "trigger" );
        misc_hidesea();
        wait 0.5;
    }
}

misc_radar()
{
    var_0 = getent( "radar", "targetname" );
    var_1 = 5000;

    for (;;)
    {
        var_0 rotatevelocity( ( 0.0, 120.0, 0.0 ), var_1 );
        wait(var_1);
    }
}

misc_spotlight_fx()
{
    self.tagent = common_scripts\utility::spawn_tag_origin();
    self.tagent.origin = self.origin;
    self.tagent.angles = self.angles;
    self.tagent linkto( getent( self.target, "targetname" ) );

    for (;;)
    {
        playfxontag( common_scripts\utility::getfx( "cgoshp_lights_cr" ), self.tagent, "tag_origin" );
        common_scripts\utility::flag_wait( "cargohold_fx" );
        stopfxontag( common_scripts\utility::getfx( "cgoshp_lights_cr" ), self.tagent, "tag_origin" );
        common_scripts\utility::flag_wait( "topside_fx" );
    }
}

cargohold_lights_logic()
{
    cargohold_lights_getlights();
    common_scripts\utility::array_thread( level.cargohold_lights, ::cargohold_lights_movelights );
    common_scripts\utility::flag_wait( "escape_explosion" );
    wait 1;

    foreach ( var_1 in level.cargohold_lights )
        var_1.lamp_off_model show();

    maps\cargoship_lighting::cargohold_lights_flickering();
}

cargohold_lights_getlights()
{
    level.cargohold_lights = common_scripts\utility::getstructarray( "cargohold_lightsway", "script_noteworthy" );

    foreach ( var_1 in level.cargohold_lights )
    {
        var_1.light = undefined;
        var_1.lamp_on_model = undefined;
        var_1.lamp_off_model = undefined;
        var_2 = getentarray( var_1.target, "targetname" );

        foreach ( var_4 in var_2 )
        {
            var_5 = var_4.script_parameters;

            if ( isdefined( var_5 ) )
            {
                if ( var_5 == "lamp_on" )
                {
                    var_1.lamp_on_model = var_4;
                    continue;
                }

                if ( var_5 == "lamp_off" )
                {
                    var_1.lamp_off_model = var_4;
                    var_1.lamp_off_model hide();
                    continue;
                }

                if ( var_5 == "light" )
                    var_1.light = var_4;
            }
        }
    }
}

cargohold_lights_movelights()
{
    var_0 = spawn( "script_origin", self.light.origin );
    var_0 linkto( self.lamp_on_model );

    for (;;)
    {
        self.light moveto( var_0.origin, 0.1 );
        wait 0.1;
    }
}

misc_cargohold_light()
{
    var_0 = undefined;
    var_1 = undefined;
    var_2 = getentarray( self.target, "targetname" );

    for ( var_3 = 0; var_3 < var_2.size; var_3++ )
    {
        var_4 = var_2[var_3];

        if ( isdefined( var_4.script_noteworthy ) )
        {
            if ( var_4.script_noteworthy == "lamp" )
            {
                var_1 = var_4;
                continue;
            }

            if ( var_4.script_noteworthy == "light" )
                var_0 = var_4;
        }
    }

    if ( isdefined( var_0 ) && isdefined( var_1 ) )
    {
        var_5 = spawn( "script_origin", var_0.origin );
        var_5 linkto( var_1 );

        for (;;)
        {
            var_0 moveto( var_5.origin, 0.1 );
            wait 0.1;
        }
    }
    else
    {

    }
}

misc_drip_sway_fx()
{
    var_0 = common_scripts\utility::spawn_tag_origin();
    var_0.origin = self.origin;
    var_0.angles = self.angles;
    var_0 linkto( self );
    var_1 = self.targetname;

    for (;;)
    {
        common_scripts\utility::flag_wait( "cargohold_fx" );
        playfxontag( common_scripts\utility::getfx( var_1 ), var_0, "tag_origin" );
        common_scripts\utility::flag_wait( "topside_fx" );
        stopfxontag( common_scripts\utility::getfx( var_1 ), var_0, "tag_origin" );
    }
}

misc_precacheinit()
{
    level.strings["intro1"] = &"CARGOSHIP_TITLE";
    level.strings["intro2"] = &"CARGOSHIP_DATE";
    level.strings["intro3"] = &"CARGOSHIP_PLACE";
    level.strings["intro4"] = &"CARGOSHIP_INFO";
    level.strings["hint_laptop"] = &"CARGOSHIP_LAPTOP_HINT";
    level.strings["obj_package"] = &"CARGOSHIP_OBJ_PACKAGE";
    level.strings["obj_laptop"] = &"CARGOSHIP_OBJ_LAPTOP";
    level.strings["obj_exit"] = &"CARGOSHIP_OBJ_EXIT";
    level.strings["mantle"] = &"CARGOSHIP_MANTLE";
    var_0 = getarraykeys( level.strings );

    for ( var_1 = 0; var_1 < var_0.size; var_1++ )
    {
        var_2 = var_0[var_1];
        precachestring( level.strings[var_2] );
    }

    precachemodel( "com_blackhawk_spotlight_on_mg_setup" );
    precachemodel( "com_blackhawk_spotlight_off_mg_setup" );
    precacheitem( "rpg" );
    precacheitem( "rpg_straight" );
    precacheitem( "facemask" );
    precacheturret( "heli_spotlight" );
    precacheturret( "heli_minigun_noai" );
    precachemodel( "vehicle_blackhawk_hero_sas_night" );
    precachemodel( "vehicle_blackhawk_hero_sas_night_interior" );
    precachemodel( "vehicle_ch46e_opened_door_interior_a" );
    precachemodel( "vehicle_ch46e_opened_door_interior_b" );
    precachemodel( "vehicle_ch46e_wires" );
    precachemodel( "h1_cs_light_alarm_short" );
    precachemodel( "tag_flash" );
    precachemodel( "tag_origin" );
    precachemodel( "weapon_saw_MG_setup" );
    precachemodel( "weapon_minigun" );
    precachemodel( "prop_price_cigar" );
    precachemodel( "ch_industrial_light_02_off" );
    precachemodel( "com_lightbox" );
    precachemodel( "me_lightfluohang" );
    precachemodel( "com_flashlight_on" );
    precachemodel( "cs_vodkabottle01" );
    precachemodel( "cs_coffeemug01" );
    precachemodel( "h1_cs_manifest_obj" );
    precachemodel( "com_restaurantchair_2" );
    precacheshellshock( "cargoship" );
    precacherumble( "tank_rumble" );
    precacherumble( "damage_heavy" );
    precachemodel( "head_sas_ct_assault_price_mask_up_wrinkle" );
    precachemodel( "head_sas_ct_assault_price_mask_down_nobeard" );
    precachemodel( "head_spetsnaz_assault_vlad" );
    precachemodel( "head_spetsnaz_assault_geoff" );
    precachemodel( "com_computer_monitor_d" );
    precachemodel( "h1_cs_airconditioner" );
    precachemodel( "h1_cs_pan_metal_sauce_sm" );
    precachemodel( "h1_cs_container_jug_water_gallon_b" );
    precachemodel( "me_plastic_crate7" );
    precachemodel( "me_plastic_crate6" );
    precachemodel( "me_plastic_crate1" );
    precachemodel( "com_fire_extinguisher" );
    precachemodel( "com_pipe_4_coupling_ceramic" );
    precachemodel( "com_pipe_coupling_metal" );
    precachemodel( "h1_cs_pan_metalpot" );
    precachemodel( "com_soup_can" );
    precachemodel( "com_propane_tank" );
    precachemodel( "com_plastic_bucket" );
    precachemodel( "cargoship_water" );
    precachemodel( "cargoship_water_hole" );
    precachemodel( "cargoship_water_static" );
    precachemodel( "cargoship_water_black_static" );
    precacheshader( "hint_mantle" );
    precachemodel( "cs_container_door_joint" );
    precachemodel( "weapon_mp5_clip" );
    precacheshader( "h1_hud_tutorial_blur" );
    precacheshader( "h1_hud_tutorial_border" );
    precacheshader( "popmenu_bg" );
    precachestring( &"CARGOSHIP_HINT_FRAG" );
    precachestring( &"CARGOSHIP_HINT_CROUCH_STANCE" );
    precachestring( &"CARGOSHIP_HINT_CROUCH" );
    precachestring( &"CARGOSHIP_HINT_CROUCH_TOGGLE" );
    precachestring( &"CARGOSHIP_HINT_STAND" );
    precachestring( &"CARGOSHIP_HINT_STAND_STANCE" );

    if ( !level.console )
    {
        precachestring( &"PLATFORM_HINT_HOLD_CROUCH_COVER" );
        precachestring( &"PLATFORM_HINT_CROUCH_TOGGLE_COVER_PC" );
    }

    level.misc_tv_damage_fx["tv_explode"] = loadfx( "fx/explosions/tv_explosion" );
}

misc_pipe_fx_maximum()
{
    while ( !isdefined( level.limit_pipe_fx ) )
        wait 0.1;

    level.limit_pipe_fx = 8;
}

objective_main()
{
    var_0 = 1;

    if ( level.jumpto != "start" )
    {
        objective_add( var_0, "active", level.strings["obj_package"], ( 3052.0, 15.0, 407.0 ) );
        objective_current( var_0 );
    }

    switch ( level.jumpto )
    {
        case "start":
            common_scripts\utility::flag_wait( "at_bridge" );
        case "bridge":
            objective_add( var_0, "active", level.strings["obj_package"], ( 3052.0, 15.0, 407.0 ) );
            objective_current( var_0 );
            level waittill( "bridge_secured" );
            objective_position( var_0, ( 2640.0, 624.0, 208.0 ) );
            common_scripts\utility::flag_wait( "deck" );
        case "deck":
            objective_position( var_0, ( -2116.0, 0.0, 80.0 ) );
            common_scripts\utility::flag_wait( "hallways_moveup" );
        case "hallways":
            objective_position( var_0, ( -2506.0, -496.0, 96.0 ) );
            common_scripts\utility::flag_wait( "hallways_enter" );
            objective_position( var_0, ( -2806.0, -122.0, 96.0 ) );
            common_scripts\utility::flag_wait( "hallways_stairs" );
            objective_position( var_0, ( -3292.0, -248.0, -65.0 ) );
            common_scripts\utility::flag_wait( "hallways_bottom_stairs" );
        case "cargohold":
        case "cargohold2":
        case "laststand":
        case "package":
            thread objective_laptop();
            objective_position( var_0, ( 2254.0, 197.0, -320.0 ) );
            common_scripts\utility::flag_set( "package_reading" );
            objective_position( var_0, ( 2254.0, 197.0, -320.0 ) );
            common_scripts\utility::flag_wait( "package_orders" );
            objective_state( var_0, "done" );
            var_0++;
            var_1 = getent( "objective_package", "targetname" );
            waittillframeend;
            objective_add( var_0, "active", level.strings["obj_laptop"], var_1 getorigin() );
            objective_current( var_0 );
            common_scripts\utility::flag_wait( "package_secure" );
        case "escape":
        case "end":
            objective_state( var_0, "done" );
            var_0++;
            objective_add( var_0, "active", level.strings["obj_exit"] );
            thread objective_price( var_0 );
            objective_current( var_0 );
            common_scripts\utility::flag_wait( "player_rescued" );
            maps\_utility::arcademode_stop_timer();
            objective_state( var_0, "done" );
            common_scripts\utility::flag_wait( "end_screen_done" );
            maps\_utility::nextmission();
    }
}

objective_price( var_0 )
{
    common_scripts\utility::flag_wait( "heroes_ready" );
    level endon( "player_rescued" );
    objective_onentity( var_0, level.heroes3["price"] );

    for (;;)
        wait 0.05;
}

objective_laptop_nag()
{
    level endon( "package_secure" );
    var_0 = getentarray( "escape_flags", "script_noteworthy" );

    for ( var_1 = 0; var_1 < var_0.size; var_1++ )
    {
        if ( !isdefined( var_0[var_1].script_flag ) || var_0[var_1].script_flag != "escape_gotlaptop" )
            continue;

        var_0[var_1] common_scripts\utility::trigger_on();
        break;
    }

    common_scripts\utility::flag_wait_or_timeout( "escape_gotlaptop", 10 );
    var_2 = 1;
    var_3 = level.heroes3["price"];

    for (;;)
    {
        switch ( var_2 )
        {
            case 1:
                maps\mo_tools::anim_single_stack( var_3, "cargoship_pri_macgetmanifest" );
                break;
            case 2:
                maps\mo_tools::anim_single_stack( var_3, "cargoship_pri_donthavetime" );
                maps\mo_tools::anim_single_stack( var_3, "cargoship_pri_getmanifest" );
                break;
            case 3:
                maps\mo_tools::anim_single_stack( var_3, "cargoship_pri_gottamove" );
                maps\mo_tools::anim_single_stack( var_3, "cargoship_pri_manifestletsgo" );
                break;
        }

        var_2++;

        if ( var_2 > 3 )
            var_2 = 1;

        wait 10;
    }
}

objective_laptop()
{
    var_0 = getent( "objective_package", "targetname" );
    var_0 common_scripts\utility::trigger_off();
    common_scripts\utility::flag_wait( "package_orders" );
    thread objective_laptop_nag();
    var_0 common_scripts\utility::trigger_on();
    var_0 sethintstring( level.strings["hint_laptop"] );
    var_0 usetriggerrequirelookat();
    var_1 = getent( var_0.target, "targetname" );
    var_2 = spawn( "script_model", var_1.origin );
    var_2.angles = var_1.angles;
    var_2 setmodel( "h1_cs_manifest_obj" );
    var_0 waittill( "trigger" );
    thread common_scripts\utility::play_sound_in_space( "intelligence_pickup_clipboard", var_2.origin );
    var_1 delete();
    var_2 delete();
    var_0 delete();
    common_scripts\utility::flag_set( "package_secure" );
}

objective_move( var_0, var_1, var_2, var_3 )
{
    if ( isdefined( var_2 ) && level.jumpto != var_2 )
        return;

    if ( !isdefined( level.objective_position ) )
        level.objective_position = [];

    if ( isdefined( var_3 ) )
        level waittill( var_3 );

    level notify( "objective_move_" + var_1 );
    level endon( "objective_move_" + var_1 );
    var_4 = getent( "objective_move_" + var_0, "targetname" );

    while ( isdefined( var_4 ) )
    {
        objective_position( var_1, var_4.origin );
        level.objective_position[var_1] = var_4.origin;
        var_4 waittill( "trigger" );

        if ( !isdefined( var_4.target ) )
        {
            var_4 = undefined;
            continue;
        }

        var_4 = getent( var_4.target, "targetname" );
    }
}

boxes_in_the_wind()
{
    common_scripts\utility::flag_init( "BoxesInTheWindDetect" );
    common_scripts\utility::flag_init( "BoxesInTheWindStart" );
    common_scripts\utility::flag_init( "BoxesInTheWindStop" );
    self endon( "BoxesInTheWindStop" );
    common_scripts\utility::flag_wait( "BoxesInTheWindDetect" );
    var_0 = getentarray( "windboxes", "targetname" );

    foreach ( var_2 in var_0 )
        thread movewindbox( var_2 );

    var_4 = gettime();

    for (;;)
    {
        wait 0.1;
        var_5 = gettime();

        if ( var_5 - var_4 > 4800 )
            common_scripts\utility::flag_set( "BoxesInTheWindStop" );
    }
}

detect_windboxes( var_0 )
{
    self endon( "BoxesInTheWindStart" );

    for (;;)
    {
        foreach ( var_2 in var_0 )
        {
            wait 0.1;

            if ( sighttracepassed( level.player geteye(), var_2.origin, 0, undefined ) )
                common_scripts\utility::flag_set( "BoxesInTheWindStart" );
        }
    }
}

movewindbox( var_0 )
{
    self endon( "BoxesInTheWindStop" );
    var_0 physicslaunchclient( var_0.origin, ( 0.0, 0.0, 0.0 ) );
    var_1 = -2400;

    for (;;)
    {
        if ( randomintrange( 0, 100 ) > 75 && var_1 < 0 )
            applyaccelerationonentity( var_0, ( 0.0, -6.0, 0.0 ), ( 0, 0, randomintrange( 1200, 3600 ) ) );

        applyaccelerationonentity( var_0, ( 0.0, 0.0, 0.0 ), ( 0, var_1, 0 ) );
        var_1 += randomintrange( 36, 120 );

        if ( var_1 > 0 )
            var_1 = 0;

        wait 0.01;
        waittillframeend;
    }
}

start_physical_dof()
{
    level waittill( "level heli ready" );
    var_0 = ( 0.0, 0.0, 0.0 );
    var_1 = ( 0.0, 0.0, 0.0 );
    var_2 = set_dof_value( 2.6, 30, 2.0, 2.0 );
    var_3 = set_dof_value( 2.4, 46, 2.0, 2.0 );
    var_4 = set_dof_value( 1.2, 800, 3.0, 3.0 );
    level.player enablephysicaldepthoffieldscripting();
    level.player setphysicaldepthoffield( var_2.fstop, var_2.focusdistance, var_2.focusspeed, var_2.aperturespeed );
    var_5 = 0;
    var_6 = 26;
    var_7 = 0;
    var_8 = -33;
    var_9 = -30;
    var_10 = 25;

    for ( var_11 = 28; var_5 < var_6; var_5 += 0.1 )
    {
        var_0 = level.heli.model gettagorigin( "tag_guy4" ) - level.heli.model gettagorigin( "tag_guy7" );
        var_0 = vectornormalize( var_0 );
        var_1 = level.player getplayerangles();
        var_1 = anglestoforward( var_1 );
        var_12 = atan2( var_1[1], var_1[0] ) - atan2( var_0[1], var_0[0] );

        if ( var_5 < 2.1 )
            var_12 = 0;
        else if ( var_12 < var_8 )
        {
            level.player setphysicaldepthoffield( var_4.fstop, var_4.focusdistance, var_4.focusspeed, var_4.aperturespeed );
            var_7 = 1;
        }
        else if ( var_12 > var_9 && var_12 < var_10 )
        {
            var_13 = var_2.focusspeed;
            var_14 = var_2.aperturespeed;

            if ( var_7 == 1 )
            {
                var_13 = 9;
                var_14 = 9;
                var_7 = 0;
            }

            level.player setphysicaldepthoffield( var_2.fstop, var_2.focusdistance, var_13, var_14 );
        }
        else if ( var_12 > var_11 )
        {
            var_13 = var_3.focusspeed;
            var_14 = var_3.aperturespeed;

            if ( var_7 == 1 )
            {
                var_13 = 11;
                var_14 = 11;
                var_7 = 0;
            }

            level.player setphysicaldepthoffield( var_3.fstop, var_3.focusdistance, var_13, var_14 );
        }

        wait 0.1;
    }

    level.player setphysicaldepthoffield( 3.6, var_2.focusdistance, var_2.focusspeed, var_2.aperturespeed );
    wait 6.5;
    level.player setphysicaldepthoffield( 1.0, 720, 1.0, 1.0 );
    level.player setphysicaldepthoffield( 2.8, 180, 4.0, 4.0 );
    wait 1.8;
    setsaveddvar( "r_mbEnable", 2 );
    wait 2.7;
    level.player disablephysicaldepthoffieldscripting();
    wait 0.5;
    setsaveddvar( "r_mbEnable", 0 );
}

set_dof_value( var_0, var_1, var_2, var_3 )
{
    var_4 = spawnstruct();
    var_4.fstop = var_0;
    var_4.focusdistance = var_1;
    var_4.focusspeed = var_2;
    var_4.aperturespeed = var_3;
    return var_4;
}

items_sway_roll()
{
    var_0 = getentarray( "item_sway_roll", "targetname" );

    foreach ( var_2 in var_0 )
        thread roll_sway_item( var_2 );
}

roll_sway_item( var_0 )
{
    var_0 physicslaunchclientwithimpulse();

    for (;;)
    {
        var_0 thread roll_item( 1 );
        level._sea_org waittill( "sway1" );
        var_0 notify( "swaystop" );
        var_0 thread roll_item( 0 );
        level._sea_org waittill( "sway2" );
        var_0 notify( "swaystop" );
        wait 0.1;
    }
}

roll_item( var_0 )
{
    self endon( "swaystop" );
    var_1 = common_scripts\utility::ter_op( var_0, -1, 1 );
    var_2 = var_1 * 30;
    var_3 = var_1 * 30;

    for (;;)
    {
        applyaccelerationonentity( self, ( 0.0, 0.0, 0.0 ), ( 0, var_2, 0 ) );
        var_2 += var_3;
        wait 0.01;
        waittillframeend;
    }
}

roll_item_damage()
{
    self setcandamage( 1 );

    for (;;)
    {
        self waittill( "damage", var_0, var_1, var_2, var_3, var_4 );

        if ( var_4 != "MOD_MELEE" && var_4 != "MOD_IMPACT" )
        {
            self delete();
            return;
        }

        wait 0.01;
    }
}

frying_pan_fall()
{
    self setcandamage( 1 );
    self waittill( "damage", var_0, var_1, var_2, var_3, var_4 );

    if ( var_4 != "MOD_MELEE" && var_4 != "MOD_IMPACT" )
    {
        self unlink();
        self physicslaunchclient();
    }
}

desert_storm_init()
{
    maps\_utility::add_global_spawn_function( "axis", ::desert_storm_enemy_spawned );
    common_scripts\utility::array_thread( getaiarray( "axis" ), ::desert_storm_enemy_spawned );
}

desert_storm_enemy_spawned()
{
    level endon( "desert_storm_done" );
    self waittill( "death", var_0, var_1, var_2 );

    if ( isdefined( var_1 ) && var_1 == "MOD_RIFLE_BULLET" && ( isdefined( var_0 ) && var_0 == level.player ) && ( isdefined( var_2 ) && ( var_2 == "desert" || var_2 == "deserteagle_cgoship" ) ) )
        desert_storm_achievement();
}

desert_storm_achievement()
{
    if ( !isdefined( level.playerdeserteaglekill ) )
        level.playerdeserteaglekill = 0;

    level.playerdeserteaglekill++;

    if ( level.playerdeserteaglekill >= 5 )
    {
        maps\_utility::giveachievement_wrapper( "DESERT_STORM" );
        maps\_utility::remove_global_spawn_function( "axis", ::desert_storm_enemy_spawned );
        level notify( "desert_storm_done" );
    }
}

disable_ik_trigger()
{
    level.player endon( "death" );
    var_0 = getent( "disable_ik", "targetname" );
    var_1 = getaiarray( "allies" );

    for (;;)
    {
        foreach ( var_3 in var_1 )
        {
            if ( var_3 istouching( var_0 ) )
            {
                if ( !isdefined( var_3.disabledik ) )
                {
                    var_3.disabledik = 1;
                    var_3 _meth_856F();
                }

                continue;
            }

            if ( isdefined( var_3.disabledik ) )
            {
                var_3.disabledik = undefined;
                var_3 _meth_856E();
            }
        }

        wait 0.1;
    }
}
