// H1 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

dead_script()
{
    common_scripts\_ca_blockout::init();
    maps\armada_precache::main();
    maps\armada_fx::main();
    maps\_load::main();
    maps\createfx\armada_audio::main();
    maps\armada_anim::anim_main();
    thread maps\armada_amb::main();
    maps\createart\armada_art::main();
    maps\armada_lighting::main();
}

main()
{
    if ( getdvar( "beautiful_corner" ) == "1" )
    {
        dead_script();
        return;
    }

    vehicle_scripts\_mig29::setmig29fxoverride( "contrail", "fx/smoke/jet_contrail_airlift" );
    vehicle_scripts\_mig29::setmig29fxoverride( "contrail_02", "fx/smoke/jet_contrail_airlift" );

    if ( getdvar( "min_spec_ai" ) == "1" )
    {
        var_0 = getentarray( "drone_delete_on_unload", "script_noteworthy" );

        for ( var_1 = 0; var_1 < var_0.size; var_1++ )
            var_0[var_1] delete();
    }

    maps\_utility::default_start( ::ride_start );
    maps\_utility::add_start( "ride", ::ride_start, &"STARTS_RIDE" );
    maps\_utility::add_start( "landed", ::landed_start, &"STARTS_LANDED" );
    maps\_utility::add_start( "hq2tv", ::hq2tv_start, &"STARTS_HQ2TV" );
    maps\_utility::add_start( "intel", ::intel_start, &"STARTS_INTEL" );
    maps\_utility::add_start( "tv", ::tv_start, &"STARTS_TV" );
    maps\_utility::add_start( "tank", ::tank_start, &"STARTS_TANK" );
    maps\_utility::add_start( "end", ::end_start, &"STARTS_END" );
    precachemodel( "vb_generic_s1" );
    precachemodel( "vehicle_blackhawk_hero_sas_night_interior" );
    precachemodel( "h1_mwr_com_widescreen_monitor_des" );
    precachemodel( "h1_mwr_com_widescreen_monitor_2_des" );
    precachemodel( "h1_mwr_com_widescreen_monitor_3_des" );
    precachemodel( "com_widescreen_monitor_on_1_des" );
    precachemodel( "com_widescreen_monitor_on_2_des" );
    precachemodel( "com_widescreen_monitor_on_3_des" );
    precachemodel( "com_computer_monitor_d" );
    precachemodel( "me_news_ticker_video_screen" );
    precachemodel( "me_news_ticker_video_screen_des" );
    precachemodel( "me_news_ticker_video_screen_des2" );
    precachemodel( "com_widescreen_monitor_on_1_des_scaled" );
    precachemodel( "com_widescreen_monitor_on_2_des_scaled" );
    precachemodel( "btr_tv_smart_wall_02_sml_des01" );
    precachemodel( "btr_tv_smart_wall_02_sml_des02" );
    precacheturret( "heli_minigun_noai" );
    precachemodel( "weapon_saw_MG_setup" );
    precachemodel( "weapon_winchest1200" );
    precachemodel( "vehicle_pickup_rear_tailgate" );
    precachestring( &"ARMADA_INTRO" );
    precachestring( &"ARMADA_DATE" );
    precachestring( &"ARMADA_PLACE" );
    precachestring( &"ARMADA_INFO" );
    precachestring( &"ARMADA_HINT_FLASH" );
    precachestring( &"ARMADA_GET_INTO_POSITION_TO" );
    precachestring( &"ARMADA_SEARCH_THE_HQ_BUILDING" );
    precachestring( &"ARMADA_REGROUP_WITH_FIRST_SQUAD" );
    precachestring( &"ARMADA_MAKE_YOUR_WAY_TO_THE" );
    precachestring( &"ARMADA_MAKE_YOUR_WAY_TO_THE1" );
    precachestring( &"ARMADA_SEARCH_THE_TV_STATION" );
    precacheshader( "h1_hud_tutorial_blur" );
    precacheshader( "h1_hud_tutorial_border" );
    precachemodel( "body_usmc_desert_assault_zack" );
    maps\_drone_ai::init();
    level.override_breach_explosive_left_audio = 1;
    level.breach_play_door_animation = 1;
    maps\_breach_hinges_left_armada::main();
    maps\_breach_explosive_left::main();
    maps\_breach::main();
    level.weaponclipmodels = [];
    level.weaponclipmodels[0] = "weapon_ak47_clip";
    level.weaponclipmodels[1] = "weapon_ak74u_clip";
    level.weaponclipmodels[2] = "weapon_m16_clip";
    level.weaponclipmodels[3] = "weapon_dragunov_clip";
    level.weaponclipmodels[4] = "weapon_saw_clip";
    level.override_blackhawk_unload_audio = 1;
    level.mig29_near_distance_override = 11880;
    maps\armada_precache::main();
    maps\armada_fx::main();
    thread common_scripts\_pipes::main();
    maps\_load::main();
    maps\createfx\armada_audio::main();
    maps\armada_anim::anim_main();
    maps\createart\armada_art::main();
    maps\armada_lighting::main();
    maps\armada_aud::main();
    maps\_compass::setupminimap( "compass_map_armada" );
    thread maps\armada_amb::main();
    level.mortar_min_dist = 500;
    level thread maps\_mortar::bog_style_mortar();
    level.nomaxmortardist = 1;
    level.scr_sound["mortar"]["incomming"] = "mortar_incoming";
    level.scr_sound["mortar"]["dirt"] = "mortar_explosion_dirt";
    level.scr_sound["mortar"]["mud"] = "mortar_explosion_water";
    level._effect["mortar"]["dirt"] = loadfx( "fx/explosions/grenadeExp_dirt" );
    level.heli_delay = [ 1.2, 0.6, 2, 0, 5, 3.5, 1.8, 2.5, 0.7, 0.5, 1.5, 0, 2.8 ];
    maps\createart\armada_art::main();

    if ( getdvar( "tv_helper" ) == "" )
        setdvar( "tv_helper", "off" );

    common_scripts\utility::flag_init( "player_has_flashed" );
    common_scripts\utility::flag_init( "return_fire" );
    common_scripts\utility::flag_init( "kill_rpgs" );
    common_scripts\utility::flag_init( "start_first_obj" );
    common_scripts\utility::flag_init( "slam_zoom_done" );
    common_scripts\utility::flag_init( "hq_entered" );
    common_scripts\utility::flag_init( "end_water" );
    common_scripts\utility::flag_init( "snipefromheli" );
    common_scripts\utility::flag_init( "entered_atrium" );
    common_scripts\utility::flag_init( "breach_ready_flag" );
    common_scripts\utility::flag_init( "in_tv_station_lighting_zone_1" );
    common_scripts\utility::flag_init( "in_tv_station_lighting_zone_2" );
    common_scripts\utility::flag_init( "aa_hq_fight" );
    common_scripts\utility::flag_init( "aa_street_fight" );
    common_scripts\utility::flag_init( "aa_tv_fight" );
    common_scripts\utility::flag_init( "end_grg_ready" );
    common_scripts\utility::flag_init( "end_vaz_ready" );
    common_scripts\utility::array_thread( getvehiclenodearray( "plane_sound", "script_noteworthy" ), vehicle_scripts\_mig29::plane_sound_node );
    thread maps\armada_code::init_heli_turrets();
    thread razor_wire_setup();
    thread razor_wire_collision();
    thread hq_breach();
    thread tv_breach();
    thread objectives();
    thread hq_entered_wait();
    thread hq_finished();
    thread on_ground();
    thread barbed_wire_dialog();
    thread on_me_to_building();
    thread kill_rooftop_ignore_groups();
    thread achieve_tvs();
    thread armada_shadowlightbyzone();
    thread tv_station_reset_friendlyfire();
    createthreatbiasgroup( "left_rooftop_enemies" );
    createthreatbiasgroup( "right_rooftop_enemies" );
    createthreatbiasgroup( "players_group" );
    level.player setthreatbiasgroup( "players_group" );
    maps\_utility::ignoreeachother( "left_rooftop_enemies", "players_group" );
    maps\_utility::ignoreeachother( "right_rooftop_enemies", "players_group" );
    var_2 = getentarray( "final_breach_right", "script_noteworthy" );
    common_scripts\utility::array_thread( var_2, maps\_utility::add_spawn_function, ::final_breacher_right_think );
    var_3 = getentarray( "final_breach_shotgun", "script_noteworthy" );
    common_scripts\utility::array_thread( var_3, maps\_utility::add_spawn_function, ::final_breacher_shotgun_think );
    var_4 = getentarray( "price", "script_noteworthy" );
    common_scripts\utility::array_thread( var_4, maps\_utility::add_spawn_function, ::price_think );
    common_scripts\utility::array_thread( var_4, maps\_utility::add_spawn_function, ::set_threatbias_group, "players_group" );
    var_5 = getentarray( "breacher", "script_noteworthy" );
    common_scripts\utility::array_thread( var_5, maps\_utility::add_spawn_function, ::breacher_think );
    common_scripts\utility::array_thread( var_5, maps\_utility::add_spawn_function, ::set_threatbias_group, "players_group" );
    var_6 = getentarray( "hq_breachers", "script_noteworthy" );
    common_scripts\utility::array_thread( var_6, maps\_utility::add_spawn_function, ::hq_breachers_think );
    var_7 = getentarray( "ride_in_sniper", "script_noteworthy" );
    common_scripts\utility::array_thread( var_7, maps\_utility::add_spawn_function, ::hq_breachers_think );
    common_scripts\utility::array_thread( var_7, maps\_utility::add_spawn_function, ::ride_in_sniper_think );
    common_scripts\utility::array_thread( var_7, maps\_utility::add_spawn_function, ::immortal_rope_guy );
    var_8 = getentarray( "left_rooftop_enemies", "script_noteworthy" );
    common_scripts\utility::array_thread( var_8, maps\_utility::add_spawn_function, ::set_threatbias_group, "left_rooftop_enemies" );
    var_9 = getentarray( "right_rooftop_enemies", "script_noteworthy" );
    common_scripts\utility::array_thread( var_9, maps\_utility::add_spawn_function, ::set_threatbias_group, "right_rooftop_enemies" );
    var_10 = getent( "right_rooftop_enemies_d_trigger", "targetname" );
    var_10 thread player_breaks_ignore( "right_rooftop_enemies" );
    var_11 = getent( "left_rooftop_enemies_d_trigger", "targetname" );
    var_11 thread player_breaks_ignore( "left_rooftop_enemies" );
    thread maps\_wibble::setup_wibble_triggers( 1, "on_ground", "exterior", 1, 0 );
    var_12 = getent( "audio_set_ambiance_3", "targetname" );
    var_12 thread set_ambiance_level_03();
    var_13 = getent( "start_phone_ring", "targetname" );
    var_13 thread start_phone_call();
    var_14 = getentarray( "magic_grenade_trigger", "targetname" );
    common_scripts\utility::array_thread( var_14, ::magic_grenade_trigger_think );
    var_15 = getentarray( "purple_2_red", "targetname" );
    common_scripts\utility::array_thread( var_15, ::purple_2_red );
    var_16 = getentarray( "reinforcements_trigger", "targetname" );
    common_scripts\utility::array_thread( var_16, ::reinforcements_think );
    thread one_red_to_orange();
    var_17 = getentarray( "kill_enemies", "targetname" );
    common_scripts\utility::array_thread( var_17, ::kill_enemies );
    var_18 = getentarray( "turret_target", "targetname" );
    common_scripts\utility::array_thread( var_18, ::tank_turret_target_think );
    var_19 = getentarray( "fallingpainting", "targetname" );
    common_scripts\utility::array_thread( var_19, ::damage_on );
    var_20 = getentarray( "streets_start_spawners", "targetname" );

    // foreach ( var_22 in var_20 )
    //     var_22 maps\_utility::add_spawn_function( ::set_model_function, "body_usmc_desert_assault_zack" );

    thread get_tv_breacher();
    thread friendlies_coming_out();
    thread final_breach();
    var_24 = getentarray( "second_wave_counters", "script_noteworthy" );
    common_scripts\utility::array_thread( var_24, maps\_utility::add_spawn_function, ::second_wave_counters );
    level.second_wave_count = 0;
    level.hint_text_size = 1.6;
    thread maps\armada_code::flag_on_flash();

    if ( !maps\_utility::arcademode() )
        thread maps\armada_code::flashbang_hint();

    var_25 = getentarray( "flickering_lights", "targetname" );

    for ( var_1 = 0; var_1 < var_25.size; var_1++ )
        var_25[var_1] thread maps\_lights::flickerlightintensity( 0.2, 0.6 );

    var_26 = getentarray( "griggs", "script_noteworthy" );
    common_scripts\utility::array_thread( var_26, maps\_utility::add_spawn_function, ::griggs_think );
    common_scripts\utility::array_thread( getentarray( "monitor_destruct1", "targetname" ), ::monitor_destruct );
    common_scripts\utility::array_thread( getentarray( "monitor_destruct2", "targetname" ), ::monitor_destruct2 );
    common_scripts\utility::array_thread( getentarray( "monitor_destruct3", "targetname" ), ::monitor_destruct3 );
    common_scripts\utility::array_thread( getentarray( "monitor_on_destruct", "targetname" ), ::monitor_destruct_on );
    common_scripts\utility::array_thread( getentarray( "monitor_on_destruct2", "targetname" ), ::monitor_destruct_on_2 );
    common_scripts\utility::array_thread( getentarray( "monitor_on_destruct3", "targetname" ), ::monitor_destruct_on_3 );
    common_scripts\utility::array_thread( getentarray( "computer_des", "targetname" ), ::computer_destruct );
    common_scripts\utility::array_thread( getentarray( "news_des", "targetname" ), ::tv_news_destruct );
    common_scripts\utility::array_thread( getentarray( "monitor_destruct_scaled", "targetname" ), ::monitor_destruct_scaled );
    common_scripts\utility::array_thread( getentarray( "monitor_on_destruct_scaled", "targetname" ), ::monitor_destruct_scaled );
    common_scripts\utility::array_thread( getentarray( "monitor_on_destruct_scaled2", "targetname" ), ::monitor_destruct_on_scaled2 );
    common_scripts\utility::array_thread( getentarray( "tv_wall", "targetname" ), ::tv_wall );
    common_scripts\utility::flag_init( "near_tv" );
    common_scripts\utility::array_thread( getentarray( "near_tv", "targetname" ), maps\armada_code::near_tv );
    thread maps\armada_code::movies_on_tvs();
    level.recordings = getentarray( "asad_sound", "script_noteworthy" );
    common_scripts\utility::array_thread( level.recordings, ::ambient_asad_recordings );
    var_27 = getent( "al_assad_recording", "targetname" );
    var_27 thread ambient_asad_recordings( 1 );
    thread master_recording();

    if ( level.gameskill == 0 )
        thread remove_flash_bang_enemies();

    common_scripts\utility::array_thread( common_scripts\utility::getstructarray( "armada_tirefire_fx", "targetname" ), ::tirefire_fx );
    thread override_lighting_lobby();
    maps\armada_code::init_pickup_technical_badplace();
    level.office_tvs = getentarray( "isdestroyed", "script_noteworthy" );
    common_scripts\utility::array_thread( level.office_tvs, ::officelight_intensity );
}

reset_all_models() {
    aiarray = getaiarray("allies");
    foreach( ai in aiarray )
    {
        if ( isdefined( ai.animname ) ) {
            if ( ai.animname == "price" ) {
                continue;
            }

            if ( ai.animname == "griggs" ) {
                continue;
            }
        }
        
        ai character\gfl\randomizer_usmc::main();
    }
}

remove_flash_bang_enemies()
{
    var_0 = getspawnerteamarray( "axis" );

    for ( var_1 = 0; var_1 < var_0.size; var_1++ )
    {
        if ( isdefined( var_0[var_1].script_flashbangs ) )
            var_0[var_1].script_flashbangs = 0;
    }
}

starting_debug()
{
    maps\_utility::hint( "starting" );
    maps\_utility::hint_fade( 0.5 );
}

clear_hints()
{
    maps\_utility::hint_fade( 0 );
    level notify( "clearing_hints" );
    level notify( "clearing_hints" );
}

keyhint( var_0, var_1, var_2, var_3 )
{
    clear_hints();
    maps\_utility::hint( var_0 );
    var_4 = "did_action_" + var_1;
    notifyoncommand( var_4, var_2 );

    if ( isdefined( var_3 ) )
        thread notifyontimeout( var_4, var_3 );

    level.player waittill( var_4 );
    maps\_utility::hint_fade( 0.5 );
}

notifyontimeout( var_0, var_1 )
{
    level.player endon( var_0 );
    wait(var_1);
    level.player notify( var_0 );
}

second_wave_counters()
{
    self waittill( "death" );
    level.second_wave_count++;

    if ( level.second_wave_count > 3 )
    {
        wait 9;
        var_0 = getent( "second_wave", "script_noteworthy" );
        var_0 notify( "trigger" );
    }

    if ( level.second_wave_count > 6 )
    {
        wait 9;
        var_0 = getent( "third_wave", "script_noteworthy" );
        var_0 notify( "trigger" );
    }
}

friendlies_coming_out()
{
    var_0 = getent( "friendlies_coming_out", "targetname" );
    var_0 waittill( "trigger" );
    var_1 = getentarray( "griggs_squad", "targetname" );
    common_scripts\utility::array_thread( var_1, maps\_utility::add_spawn_function, maps\_utility::enable_cqbwalk );
    common_scripts\utility::array_thread( var_1, maps\_utility::spawn_ai );
    waittillframeend;
    level.griggs maps\_anim::anim_single_queue( level.griggs, "hold_fire" );
    var_2 = getent( "griggs_door", "targetname" );
    var_3 = getentarray( var_2.target, "targetname" );

    for ( var_4 = 0; var_4 < var_3.size; var_4++ )
        var_3[var_4] linkto( var_2 );

    var_2 thread maps\_utility::play_sound_on_entity( "scn_friendlies_door_open" );
    var_2 rotateto( var_2.angles + ( 0.0, -130.0, 0.0 ), 0.6, 0, 0 );
    var_2 connectpaths();
    var_2 waittill( "rotatedone" );
    var_5 = getent( "griggs_come_out", "targetname" );
    var_5 notify( "trigger" );
    wait 2;
    level.griggs maps\_anim::anim_single_queue( level.griggs, "no_sign" );
    thread fall_in_dialog();
    wait 2;
    var_6 = getent( "fall_in", "targetname" );
    var_6 notify( "trigger" );
    wait 3;
    var_7 = maps\_utility::get_force_color_guys( "allies", "c" );

    for ( var_4 = 0; var_4 < var_7.size; var_4++ )
        var_7[var_4] maps\_utility::set_force_color( "o" );

    thread dialog_devil_dog();
}

dialog_devil_dog()
{
    maps\_utility::trigger_wait( "dialog_devil_dog", "targetname" );
    level.griggs maps\_anim::anim_single_queue( level.griggs, "watchsix" );
}

fall_in_dialog()
{
    level.price maps\_anim::anim_single_queue( level.price, "fall_in" );
}

exit_news_room_door()
{
    common_scripts\utility::flag_wait( "news_room_clear" );
    common_scripts\utility::flag_clear( "aa_tv_fight" );
    var_0 = getnode( "opener_stack_node", "script_noteworthy" );
    var_0 maps\_anim::anim_reach_solo( level.price, "hunted_open_barndoor" );
    var_0 maps\_anim::anim_single_solo( level.price, "hunted_open_barndoor_stop" );
    var_0 thread maps\_anim::anim_loop_solo( level.price, "hunted_open_barndoor_idle", undefined, "stop_idle" );
    var_1 = getent( "open_door", "targetname" );
    var_1 waittill( "trigger" );
    var_0 notify( "stop_idle" );
    var_0 thread maps\_anim::anim_single_solo( level.price, "hunted_open_barndoor" );
    maps\_utility::battlechatter_off( "allies" );
    var_2 = getent( "news_room_exit_door", "targetname" );
    var_3 = getentarray( var_2.target, "targetname" );

    for ( var_4 = 0; var_4 < var_3.size; var_4++ )
        var_3[var_4] linkto( var_2 );

    var_2 maps\_utility::hunted_style_door_open();

    for ( var_4 = 0; var_4 < var_3.size; var_4++ )
    {
        if ( var_3[var_4].classname == "script_brushmodel" )
            var_3[var_4] connectpaths();
    }

    level.price maps\_utility::enable_ai_color();
    thread atrium_path_start();
    common_scripts\utility::flag_set( "entered_atrium" );
}

atrium_path_start()
{
    var_0 = getentarray( "script_vehicle_m1a1_abrams", "classname" );

    for ( var_1 = 0; var_1 < var_0.size; var_1++ )
        var_0[var_1].script_disablevehicleaudio = 1;

    var_2 = getvehiclenode( "auto2950", "targetname" );
    var_3 = getvehiclenode( "auto2960", "targetname" );
    var_4 = getvehiclenode( "auto2969", "targetname" );
    var_2 thread play_scripted_tank_sfx( 1 );
    var_3 thread play_scripted_tank_sfx( 4.5 );
    var_4 thread play_scripted_tank_sfx( 10.5 );
    var_5 = getent( "enter_atrium_trigger", "targetname" );
    var_5 notify( "trigger" );
    var_6 = getent( "tank_trigger", "targetname" );
    var_6 notify( "trigger" );
    var_7 = getent( "last_mig29_trigger", "targetname" );
    var_7 thread start_last_mig29_sequence();
    wait 2;
    thread dialog_goes_our_boys();
    wait 1;
    common_scripts\utility::flag_wait( "player_in_atrium" );
    var_8 = getnodearray( "atrium_nodes", "targetname" );
    var_9 = maps\_utility::get_force_color_guys( "allies", "o" );

    for ( var_1 = 0; var_1 < var_9.size; var_1++ )
    {
        var_10 = common_scripts\utility::getclosest( var_9[var_1].origin, var_8 );
        var_11 = getnode( var_10.script_noteworthy, "targetname" );
        var_9[var_1] thread maps\_spawner::go_to_node( var_11 );
    }
}

play_scripted_tank_sfx( var_0 )
{
    self waittill( "trigger", var_1 );
    var_1 endon( "death" );

    if ( isdefined( var_0 ) )
        wait(var_0);

    var_1 thread maps\_utility::play_sound_on_entity( "scn_armada_scripted_tanks" );
}

start_last_mig29_sequence()
{
    self waittill( "trigger", var_0 );
    soundscripts\_snd::snd_message( "start_last_mig29_mix" );
}

dialog_goes_our_boys()
{
    var_0 = [];
    var_0[0] = level.price;
    var_1 = maps\_utility::get_closest_ai_exclude( level.player.origin, "allies", var_0 );
    var_1.animname = "generic";
    var_1 maps\_anim::anim_single_queue( var_1, "goesourboys" );
    var_0[var_0.size] = var_1;
    var_2 = maps\_utility::get_closest_ai_exclude( level.player.origin, "allies", var_0 );

    if ( isalive( var_2 ) )
    {
        var_2.animname = "generic";
        var_2 maps\_anim::anim_single_queue( var_2, "oorah1" );
    }

    if ( isalive( var_1 ) )
        var_1 thread maps\_anim::anim_single_queue( var_1, "oorah2" );
}

news_room_clear()
{
    common_scripts\utility::flag_wait( "news_room_clear" );
    maps\_spawner::kill_spawnernum( 3 );
    maps\_spawner::kill_spawnernum( 4 );
    maps\_spawner::kill_spawnernum( 8 );
    maps\_spawner::kill_spawnernum( 9 );
    var_0 = getaiarray( "axis" );

    for ( var_1 = 0; var_1 < var_0.size; var_1++ )
        var_0[var_1] dodamage( var_0[var_1].health + 100, var_0[var_1].origin );

    wait 2.5;
    level.price maps\_anim::anim_single_queue( level.price, "room_clear" );
    wait 0.5;
    var_2 = getent( "move_up_trigger", "targetname" );
    var_2 notify( "trigger" );
}

#using_animtree("generic_human");

ride_in_sniper_think()
{
    wait 0.1;
    self.get_out_override = %armada_blackhawk_sniper_drop;
    self.vehicle_idle_override = %armada_blackhawk_sniper_idle_loop;
}

immortal_rope_guy()
{
    thread maps\_utility::magic_bullet_shield();
    common_scripts\utility::flag_wait( "on_ground" );
    thread maps\_utility::stop_magic_bullet_shield();
}

linked_deaths( var_0 )
{
    self waittill( "death" );
    var_0 = getentarray( "hq_breach_enemies", "script_noteworthy" );

    for ( var_1 = 0; var_1 < var_0.size; var_1++ )
    {
        if ( isalive( var_0[var_1] ) )
        {
            var_2 = var_0[var_1];
            wait 0.3;
            var_3 = getaiarray( "allies" );
            var_4 = common_scripts\utility::getclosest( var_2.origin, var_3 );
            var_5 = var_2 geteye();

            for ( var_1 = 0; var_1 < 3; var_1++ )
            {
                magicbullet( level.price.weapon, var_4 gettagorigin( "tag_flash" ), var_5 );
                wait 0.05;
            }
        }
    }
}

tank_turret_target_think()
{
    var_0 = maps\_vehicle::waittill_vehiclespawn( self.target );
    self linkto( var_0 );
    var_0 setturrettargetent( self );
}

subtitle_test()
{
    wait 3;
    level.player playsound( "armada_reinforcements1" );
    iprintlnbold( "subtitle should play" );
}

kill_enemies()
{
    self waittill( "trigger" );
    var_0 = getaiarray( "axis" );

    for ( var_1 = 0; var_1 < var_0.size; var_1++ )
        var_0[var_1] dodamage( var_0[var_1].health + 100, var_0[var_1].origin );
}

reinforcements_think()
{
    self waittill( "trigger" );
    var_0 = maps\_utility::get_force_color_guys( "allies", "r" );
    var_1 = 5 - var_0.size;

    if ( var_1 < 2 )
    {
        var_2 = maps\_utility::get_closest_ai( level.player getorigin(), "allies" );
        var_2 maps\_utility::custom_battlechatter( "move_generic" );
        return;
    }

    var_3 = [];
    var_3[0] = "armada_gm1_reinforcements";
    var_3[1] = "armada_gm2_friendliesmovinup";
    var_3[2] = "armada_gm3_checkfire";
    var_3[3] = "armada_gm4_headsup";
    var_3[4] = "armada_gm5_watchyourfire";
    var_4 = var_3[randomint( var_3.size )];
    var_2 = maps\_utility::get_closest_ai( level.player getorigin(), "allies" );
    var_2 playsound( var_4 );
    var_5 = getentarray( self.target, "targetname" );

    for ( var_6 = 0; var_6 < var_1; var_6++ )
        var_7 = var_5[var_6] maps\_utility::spawn_ai();
}

purple_2_red()
{
    self waittill( "trigger" );
    var_0 = maps\_utility::get_force_color_guys( "allies", "p" );
    common_scripts\utility::array_thread( var_0, maps\_utility::set_force_color, "r" );
}

one_red_to_orange()
{
    var_0 = getent( "one_red_to_orange", "targetname" );
    var_0 waittill( "trigger" );
    var_1 = maps\_utility::get_force_color_guys( "allies", "r" );

    for ( var_2 = 0; var_2 < var_1.size; var_2++ )
    {
        if ( isalive( var_1[var_2] ) )
        {
            var_3 = var_1[var_2];
            var_3 maps\_utility::set_force_color( "o" );
            var_3 thread maps\_utility::replace_on_death();
            break;
        }
    }
}

kill_rooftop_ignore_groups()
{
    common_scripts\utility::flag_wait( "regrouped" );
    setthreatbias( "players_group", "left_rooftop_enemies", 0 );
    setthreatbias( "players_group", "right_rooftop_enemies", 0 );
    var_0 = getentarray( "road_friendly", "script_noteworthy" );

    for ( var_1 = 0; var_1 < var_0.size; var_1++ )
        var_0[var_1] delete();
}

enemy_mass()
{
    var_0 = getent( "enemy_mass_trigger", "targetname" );
    var_0 waittill( "trigger" );
}

magic_grenade_trigger_think()
{
    self waittill( "trigger" );
    var_0 = getentarray( self.target, "targetname" );

    for ( var_1 = 0; var_1 < var_0.size; var_1++ )
        level.price magicgrenade( var_0[var_1].origin + ( 0.0, 0.0, 50.0 ), var_0[var_1].origin, randomfloatrange( 1, 2 ) );
}

player_breaks_ignore( var_0 )
{
    for (;;)
    {
        self waittill( "trigger", var_1 );

        if ( var_1 == level.player )
        {
            setthreatbias( "players_group", var_0, 0 );
            break;
        }
    }
}

armada_shadowlightbyzone()
{
    var_0 = getent( "tv_station_light_2", "targetname" );

    for (;;)
    {
        if ( common_scripts\utility::flag( "in_tv_station_lighting_zone_1" ) )
        {
            var_0 setlightshadowstate( "force_fully_on" );

            while ( common_scripts\utility::flag( "in_tv_station_lighting_zone_1" ) )
                wait 0.5;
        }
        else if ( common_scripts\utility::flag( "in_tv_station_lighting_zone_2" ) )
            var_0 setlightshadowstate( "normal" );

        wait 0.5;
    }
}

set_ambiance_level_03()
{
    self waittill( "trigger", var_0 );
    soundscripts\_snd::snd_message( "set_ambiance_level_03" );
}

start_phone_call()
{
    self waittill( "trigger", var_0 );
    wait(1.0 + randomfloat( 3.0 ));
    thread common_scripts\utility::play_sound_in_space( "armada_phonering", ( 4031.0, 22596.0, 0.0 ) );
}

sit_rep_dialog()
{
    common_scripts\utility::flag_wait( "hq_cleared" );
    var_0 = getent( "hq_cleared_move_up", "targetname" );
    var_0 notify( "trigger" );
    wait 2;
    level.price maps\_utility::play_sound_on_entity( "armada_vsq_allcallsigns" );
    level.player maps\_utility::play_sound_on_entity( "armada_gm1_negid" );
    level.player maps\_utility::play_sound_on_entity( "armada_gm2_nosign" );
    level.price maps\_anim::anim_single_queue( level.price, "stand_down" );
    wait 2;
    level.price maps\_anim::anim_single_queue( level.price, "roger_hq" );
    level.price maps\_anim::anim_single_queue( level.price, "heads_up" );
    level.price maps\_anim::anim_single_queue( level.price, "move_out" );
}

tank_start()
{
    soundscripts\_snd::snd_message( "start_tank_checkpoint" );
    var_0 = getent( "tank_start", "targetname" );
    level.player setorigin( var_0.origin );
    level.player setplayerangles( var_0.angles );
    var_1 = getentarray( "tank_start_spawners", "targetname" );
    common_scripts\utility::array_thread( var_1, maps\_utility::spawn_ai );
    common_scripts\utility::array_thread( var_1, maps\_utility::add_spawn_function, maps\_utility::enable_cqbwalk );
    waittillframeend;
    common_scripts\utility::flag_set( "start_first_obj" );
    common_scripts\utility::flag_set( "hq_entered" );
    common_scripts\utility::flag_set( "hq_cleared" );
    common_scripts\utility::flag_set( "on_ground" );
    common_scripts\utility::flag_set( "regrouped" );
    common_scripts\utility::flag_set( "tvstation_entered" );
    common_scripts\utility::flag_set( "news_room_clear" );
    thread exit_news_room_door();
    thread maps\_vehicle::create_vehicle_from_spawngroup_and_gopath( 9 );
}

intel_start()
{
    soundscripts\_snd::snd_message( "start_intel_checkpoint" );
    level.player setorigin( ( 3622.0, 29958.0, -168.0 ) );
}

tv_start()
{
    soundscripts\_snd::snd_message( "start_tv_checkpoint" );
    var_0 = getent( "tv_start", "targetname" );
    level.player setorigin( var_0.origin );
    level.player setplayerangles( var_0.angles );
    var_1 = getentarray( "tv_start_spawners", "targetname" );
    common_scripts\utility::array_thread( var_1, maps\_utility::spawn_ai );
    common_scripts\utility::flag_set( "start_first_obj" );
    common_scripts\utility::flag_set( "hq_entered" );
    common_scripts\utility::flag_set( "hq_cleared" );
    common_scripts\utility::flag_set( "on_ground" );
    common_scripts\utility::flag_set( "regrouped" );
    thread maps\_vehicle::create_vehicle_from_spawngroup_and_gopath( 9 );
}

hq2tv_start()
{
    soundscripts\_snd::snd_message( "start_hq2tv_checkpoint" );
    var_0 = getent( "hq2tv_start", "targetname" );
    level.player setorigin( var_0.origin );
    level.player setplayerangles( var_0.angles );
    var_1 = getentarray( "hq2tv_start_spawners", "targetname" );
    common_scripts\utility::array_thread( var_1, maps\_utility::spawn_ai );
    common_scripts\utility::flag_set( "start_first_obj" );
    common_scripts\utility::flag_set( "hq_entered" );
    common_scripts\utility::flag_set( "hq_cleared" );
    common_scripts\utility::flag_set( "on_ground" );
    thread maps\_vehicle::create_vehicle_from_spawngroup_and_gopath( 9 );
}

end_of_script()
{
    var_0 = getent( "end_of_scripting", "targetname" );
    var_0 waittill( "trigger" );
    iprintlnbold( &"SCRIPT_DEBUG_LEVEL_END" );
}

objectives()
{
    common_scripts\utility::flag_wait( "start_first_obj" );
    var_0 = getent( "outside_hq_obj", "targetname" );
    objective_add( 1, "active", &"ARMADA_GET_INTO_POSITION_TO", var_0.origin );
    objective_current( 1 );
    common_scripts\utility::flag_wait( "hq_entered" );
    var_1 = getent( "inside_hq_obj", "targetname" );
    objective_state( 1, "done" );
    objective_add( 2, "active", &"ARMADA_SEARCH_THE_HQ_BUILDING", var_1.origin );
    objective_current( 2 );
    common_scripts\utility::flag_wait( "hq_cleared" );
    wait 2;
    var_2 = getent( "regroup_obj", "targetname" );
    objective_state( 2, "done" );
    objective_add( 3, "active", &"ARMADA_REGROUP_WITH_FIRST_SQUAD", var_2.origin );
    objective_current( 3 );
    common_scripts\utility::flag_wait( "regrouped" );
    common_scripts\utility::flag_set( "aa_street_fight" );
    objective_state( 3, "done" );
    objective_add( 4, "active", &"ARMADA_MAKE_YOUR_WAY_TO_THE", ( 2808.0, 23672.0, -24.0 ) );
    objective_current( 4 );
    common_scripts\utility::flag_wait( "tvstation_entered" );
    var_3 = getent( "second_floor_obj", "targetname" );
    objective_state( 4, "done" );
    objective_add( 5, "active", &"ARMADA_MAKE_YOUR_WAY_TO_THE1", var_3.origin );
    objective_current( 5 );
    common_scripts\utility::flag_wait( "entered_atrium" );
    thread objective_on_friendly( 5, level.price, "end_obj5" );
    var_3 waittill( "trigger" );
    thread maps\_utility::autosave_by_name( "second_floor" );
    objective_state( 5, "done" );
    var_4 = getent( "final_room_obj", "targetname" );
    objective_add( 6, "active", &"ARMADA_SEARCH_THE_TV_STATION", level.price.origin );
    objective_current( 6 );
    thread objective_on_friendly( 6, level.price, "end_obj6" );
    var_5 = getent( "end_positions", "targetname" );
    var_5 waittill( "trigger" );
    level notify( "end_obj6" );
    objective_position( 6, var_4.origin );
    var_4 waittill( "trigger" );
    objective_state( 6, "done" );
}

objective_on_friendly( var_0, var_1, var_2 )
{
    level endon( var_2 );
    objective_onentity( var_0, var_1 );

    for (;;)
        wait 0.1;
}

hq_entered_wait()
{
    var_0 = getent( "trigger_volume_room01", "targetname" );
    var_0 waittill( "trigger" );
    common_scripts\utility::flag_set( "hq_entered" );
    var_1 = getentarray( "barbed_wire_guys", "script_noteworthy" );

    for ( var_2 = 0; var_2 < var_1.size; var_2++ )
        var_1[var_2] delete();
}

hq_finished()
{
    common_scripts\utility::flag_wait( "hq_cleared" );
    common_scripts\utility::flag_clear( "aa_hq_fight" );

    if ( isdefined( level.player.participation ) )
        level.player.participation = 0;

    soundscripts\_snd::snd_message( "set_ambiance_level_01" );
    thread maps\armada_code::circling_helis_fire();
    maps\_utility::battlechatter_on( "allies" );
    var_0 = getent( "hq_building_exit_door", "targetname" );
    var_0 delete();
    var_1 = getent( "hq_building_exit_door_col", "targetname" );
    var_1 connectpaths();
    var_1 delete();
    var_2 = getentarray( "hq_breachers", "script_noteworthy" );
    var_3 = getentarray( "ride_in_sniper", "script_noteworthy" );

    for ( var_4 = 0; var_4 < var_3.size; var_4++ )
    {
        if ( isalive( var_3[var_4] ) )
            var_3[var_4] dodamage( var_3[var_4].health + 100, var_3[var_4].origin );
    }

    var_5 = getent( "small_gate1", "targetname" );
    var_5 rotateyaw( -90, 0.1 );
    var_6 = getent( "small_gate2", "targetname" );
    var_6 rotateyaw( 90, 0.1 );
    var_7 = getent( "return_path_clip", "targetname" );
    var_7 delete();
    var_8 = getent( "return_path_clip1", "targetname" );
    var_8 delete();
    maps\armada_aud::play_technical_scripted_sfx_sequence();
}

get_abarbed_wire_ai()
{
    var_0 = getentarray( "barbed_wire_guys", "script_noteworthy" );

    for ( var_1 = 0; var_1 < var_0.size; var_1++ )
    {
        if ( isai( var_0[var_1] ) )
            return var_0[var_1];
    }
}

razor_wire_setup()
{
    var_0 = getent( "barbed_wire_trigger", "targetname" );
    var_1 = getnode( "barbed_wire_node", "targetname" );
    var_2 = getent( "barbed_wire_long", "targetname" );
    var_2.animname = "barbed_wire_long";
    var_2 maps\_anim::setanimtree();
    var_1 thread maps\_anim::anim_single_solo( var_2, "razor_idle", undefined, var_1 );
    common_scripts\utility::flag_wait( "on_ground" );

    if ( common_scripts\utility::flag( "hq_cleared" ) )
        return;

    level.barbedwireguy = get_abarbed_wire_ai();
    level.barbedwireguy.animname = "razorwire_guy";
    var_3 = [];
    var_3[0] = level.barbedwireguy;
    var_3[1] = var_2;
    var_1 thread maps\_anim::anim_single( var_3, "razor_idle", undefined, undefined );
    var_0 waittill( "trigger" );
    level.barbedwireguy maps\_utility::setflashbangimmunity( 1 );
    var_1 maps\_anim::anim_single( var_3, "razor_setup", undefined, undefined );
    level.barbedwireguy pushplayer( 1 );
    level.barbedwireguy maps\_utility::setflashbangimmunity( 0 );
    var_4 = getnode( "cover_razor", "script_noteworthy" );
    level.barbedwireguy maps\_utility::set_goal_pos( var_4.origin );
}

razor_wire_collision()
{
    var_0 = getent( "barbed_wire_scrunched", "targetname" );
    var_0 hide();
    var_1 = getent( "razorwire_scrunched_clip", "targetname" );
    var_1 notsolid();
    var_1 connectpaths();
    common_scripts\utility::flag_wait( "hq_cleared" );
    var_0 show();
    var_1 solid();
    var_1 disconnectpaths();
    var_2 = getent( "barbed_wire_long", "targetname" );
    var_2 delete();
    var_3 = getent( "barbed_wire_clip", "targetname" );
    var_3 connectpaths();
    var_3 delete();
}

draw_hud_on_death()
{
    level endon( "stop_draw_hud_on_death" );
    level waittill( "missionfailed" );
    setsaveddvar( "hud_drawhud", "1" );
}

#using_animtree("player");

loadplayer( var_0, var_1 )
{
    thread draw_hud_on_death();

    if ( !isdefined( var_1 ) )
        var_1 = 0;

    var_2 = undefined;

    for ( var_3 = 0; var_3 < self.riders.size; var_3++ )
    {
        if ( self.riders[var_3].script_startingposition == var_0 )
        {
            var_2 = self.riders[var_3];
            var_2.drone_delete_on_unload = 1;
            var_2.playerpiggyback = 1;
            var_2.script_stay_drone = 1;
            break;
        }
    }

    var_4 = maps\_vehicle_aianim::anim_pos( self, var_0 );
    var_2 notify( "newanim" );
    var_2 detachall();
    var_2 setmodel( "h1_gfl_ump40_viewbody" );
    var_2 useanimtree( #animtree );
    var_2.get_out_override = %h1_armada_blackhawk_player_drop;
    var_2.vehicle_idle_override = %h1_armada_blackhawk_player_idle_loop;
    thread maps\_vehicle_aianim::guy_idle( var_2, var_0 );
    level.player playerlinktodelta( var_2, "tag_player", 1.0, 90, 30, 40, 40, 1 );
    level.player freezecontrols( 0 );
    var_5 = getanimlength( var_4.getout );
    var_5 -= var_1;
    self waittill( "unloading" );
    thread rope_view_angles();
    level.player disableweapons();
    var_2 notsolid();
    wait(var_5);
    var_2 hide();
    level.player unlink();
    level.player enableweapons();
    level.player allowstand( 1 );
    setsaveddvar( "hud_drawhud", "1" );
    level notify( "stop_draw_hud_on_death" );
    common_scripts\utility::flag_set( "start_first_obj" );
}

rope_view_angles()
{
    level.player lerpviewangleclamp( 0.5, 0.1, 0.1, 30, 10, 10, 20 );
    wait 5;
    level.player lerpviewangleclamp( 0.5, 0.1, 0.1, 70, 60, 30, 20 );
}

heli_ride_player_quake()
{
    self endon( "death" );
    self endon( "stop_quake" );

    for (;;)
    {
        wait 0.1;
        earthquake( 0.05, 0.1, self.origin, 256 );
    }
}

ride_start()
{
    soundscripts\_snd::snd_message( "start_ride_checkpoint" );
    thread start_helicopters();
    setsaveddvar( "r_lodFOVFixedScale", "1.5" );
    level.player_heli = maps\_vehicle::waittill_vehiclespawn_noteworthy( "players_helicopter" );
    level.player_heli.script_disablevehicleaudio = 1;
    level.player_heli thread maps\_utility::play_sound_on_entity( "scn_armanda_intro" );
    level.player disableoffhandweapons( 1 );
    level.player disableoffhandsecondaryweapons( 1 );
    level.player_heli thread maps\armada_anim::player_heli_ropeanimoverride();
    level.player_heli thread loadplayer( 3, 1.0 );
    level.player_heli thread helicopter_residual_dust();
    thread player_control_during_ride();
    maps\_utility::musicplaywrapper( "music_armada_ride" );
    level.player disableweaponswitch();
    setsaveddvar( "sm_sunSampleSizeNear", 2 );
    thread technical_setup();
    thread end_water_visionset();
    maps\_utility::battlechatter_off( "allies" );
    thread return_fire_flag();
    thread feet_dry();
    thread taking_fire();
    thread was_close();
    thread target_in_view();
    thread five_seconds();
    thread down_ropes();
    thread turn_off_cull();
    thread maps\_utility::flag_set_delayed( "kill_rpgs", 40 );
    thread heli_ride_h1_dof();
    waittillframeend;
    common_scripts\utility::flag_set( "snipefromheli" );
    wait 6;
    level.player playsound( "armada_hp1_shorelineinview" );
    wait 2;
    level.player playsound( "armada_fhp_copystrikersixfour" );
}

heli_ride_h1_dof()
{
    level.player lerpviewangleclamp( 0, 0, 0, 85, 12, 30, 40 );
    wait 17.0;
    wait 6.0;
    wait 17.0;
    wait 8.0;
    wait 5.0;
    level.player enablephysicaldepthoffieldscripting();
    level.player setphysicaldepthoffield( 6.4, 1500, 0.5, 0.5 );
    wait 0.3;
    setsaveddvar( "r_mbEnable", 2 );
    wait 1.05;
    setsaveddvar( "r_mbEnable", 0 );
    wait 4.15;
    level.player disablephysicaldepthoffieldscripting();
}

return_fire_flag()
{
    wait 17;
    thread maps\armada_code::intro_helis_fire();
}

turn_off_cull()
{
    wait 42;
    var_0 = 2;
    var_1 = 2;
    var_2 = 0.25;
    var_3 = 2;
    var_4 = ( var_1 - var_2 ) / var_0 * 20;

    while ( var_3 > var_2 )
    {
        var_3 -= var_4;
        setsaveddvar( "sm_sunSampleSizeNear", var_3 );
        wait 0.05;
    }
}

feet_dry()
{
    wait 10;
    level.player playsound( "armada_hp1_feetdrytenseconds" );
    wait 1.5;
    level.player playsound( "armada_fhp_copy" );
}

taking_fire()
{
    wait 17;
    level.player playsound( "armada_hp1_takingfirehere" );
    wait 1.5;
    level.player playsound( "armada_fhp_rogerthat" );
}

was_close()
{
    wait 31;
    level.player playsound( "armada_hp1_thatwasclose" );
}

target_in_view()
{
    wait 35;
    level.player playsound( "armada_fhp_gotvisual" );
}

five_seconds()
{
    wait 43;
    level.player playsound( "armada_hp1_fiveseconds" );
    wait 5;
    level.player playsound( "armada_hp1_standbygreenlight" );
}

down_ropes()
{
    common_scripts\utility::flag_wait( "end_water" );
    level.player_heli waittill( "unloading" );
    level.price playsound( "armada_vsq_downtheropes" );
    wait 5;
    level.breacher playsound( "armada_gm1_gogogo" );
}

on_ground()
{
    common_scripts\utility::flag_wait( "on_ground" );
    var_0 = getentarray( "interactive_tv", "targetname" );
    common_scripts\utility::array_thread( var_0, ::bright_tv );
    setsaveddvar( "r_lodFOVFixedScale", "1" );
    level.player giveweapon( "claymore" );
    setsaveddvar( "sm_sunSampleSizeNear", 0.25 );
    level.player enableoffhandweapons( 1 );
    level.player enableoffhandsecondaryweapons( 1 );
    level.player enableweaponswitch();
    reset_all_models();
}

barbed_wire_dialog()
{
    var_0 = getent( "barbed_wire_dialog", "targetname" );
    var_0 waittill( "trigger" );
    level.barbedwireguy playsound( "armada_gm2_moveitmoveit" );
    wait 2;
    level.barbedwireguy playsound( "armada_gm3_blockingpositions" );
}

on_me_to_building()
{
    var_0 = getent( "on_me_to_building", "targetname" );
    var_0 waittill( "trigger" );
    level.price playsound( "armada_vsq_secondsquadonme" );
}

end_water_visionset()
{
    var_0 = getent( "end_water_visionset", "targetname" );
    var_0 waittill( "trigger" );
    common_scripts\utility::flag_set( "end_water" );
    maps\_utility::set_vision_set( "armada", 3 );
}

start_helicopters()
{
    waittillframeend;
    thread maps\_vehicle::create_vehicle_from_spawngroup_and_gopath( 0 );
    thread maps\_vehicle::create_vehicle_from_spawngroup_and_gopath( 2 );
    thread maps\_vehicle::create_vehicle_from_spawngroup_and_gopath( 3 );
    thread maps\_vehicle::create_vehicle_from_spawngroup_and_gopath( 4 );
    wait 0.25;
    level.helis_spawners = getentarray( "heli", "targetname" );
    level.helis = [];

    for ( var_0 = 0; var_0 < level.helis_spawners.size; var_0++ )
    {
        if ( isdefined( level.helis_spawners[var_0].last_spawned_vehicle ) )
            level.helis[level.helis.size] = level.helis_spawners[var_0].last_spawned_vehicle;
    }

    var_1 = getent( "first_fly_away_trigger", "targetname" );
    var_2 = getent( "fly_away_trigger", "targetname" );
    thread rpg_guys();

    for ( var_0 = 0; var_0 < level.helis.size; var_0++ )
    {
        level.helis[var_0].repulser = missile_createrepulsorent( level.helis[var_0], 5000, 100 );
        level.helis[var_0].exitpoint = level.helis[var_0].origin;
        level.helis[var_0] thread maps\_vehicle::godon();

        if ( isdefined( level.helis[var_0].script_noteworthy ) )
        {
            if ( level.helis[var_0].script_noteworthy == "ai_dropper" || level.helis[var_0].script_noteworthy == "players_helicopter" )
                level.helis[var_0] thread helicopters_fly_away( var_2 );

            if ( level.helis[var_0].script_noteworthy == "first_fly_away" )
                level.helis[var_0] thread helicopters_fly_away( var_1 );

            if ( level.helis[var_0].script_noteworthy == "players_helicopter" )
            {
                var_3 = spawn( "script_model", level.helis[var_0] gettagorigin( "body_animate_jnt" ) );
                var_3 setmodel( "vehicle_blackhawk_hero_sas_night_interior" );
                var_3.angles = level.helis[var_0].angles;
                var_3 linkto( level.helis[var_0], "body_animate_jnt" );
                var_3.animname = "blackhawk";
                var_3 maps\_anim::setanimtree();
                var_3 thread maps\_anim::anim_loop_solo( var_3, "interiorwires" );
            }
        }
    }

    var_4 = getentarray( "delete_heli", "script_noteworthy" );
}

unload_late( var_0 )
{
    common_scripts\utility::flag_wait( "on_ground" );
    maps\_utility::vehicle_detachfrompath();
    maps\_utility::vehicle_dynamicpath( var_0, 0 );
}

helicopters_fly_away( var_0 )
{
    var_1 = level.heli_delay[int( self.script_parameters )];
    thread wait_for_unload();
    common_scripts\utility::flag_wait( "on_ground" );
    var_0 maps\_utility::wait_for_trigger_or_timeout( 12 );

    if ( !isdefined( self.armada_unloaded ) )
        self waittill( "unloaded" );

    wait(var_1);
    maps\_utility::vehicle_detachfrompath();
    missile_deleteattractor( self.repulser );
    self cleargoalyaw();
    self clearlookatent();
    self cleartargetyaw();
    self setvehgoalpos( self.exitpoint, 1 );
    self waittill( "goal" );
    level.helis = common_scripts\utility::array_remove( level.helis, self );
    self delete();
}

wait_for_unload()
{
    if ( maps\_vehicle_aianim::riders_unloadable( "both" ) )
        self waittill( "unloaded" );

    self.armada_unloaded = 1;
}

delete_heli_think()
{
    self waittill( "trigger", var_0 );
    var_0 delete();
}

player_control_during_ride()
{
    setsaveddvar( "g_friendlyNameDist", 0 );
    setsaveddvar( "g_friendlyfireDist", 0 );
    level.player allowsprint( 0 );
    level.player allowprone( 0 );
    level.player allowcrouch( 0 );
    level.player enableinvulnerability();
    level.player.ignoreme = 1;
    wait 0.05;
    level.player setplayerangles( ( 0.0, 35.0, 0.0 ) );
    level.player_heli waittill( "unloading" );
    level.player notify( "stop_quake" );
    wait 4;
    level.player_heli.script_disablevehicleaudio = 0;
    soundscripts\_snd::snd_message( "stop_inside_blackhawk_mix" );
    wait 3;
    soundscripts\_snd::snd_message( "stop_intro_mix" );
    maps\_utility::autosave_by_name( "on_the_ground" );
    level.player allowprone( 0 );
    level.player allowstand( 1 );
    level.player allowcrouch( 0 );
    wait 0.05;
    level.player allowprone( 1 );
    level.player allowcrouch( 1 );
    level.player disableinvulnerability();
    level.player.ignoreme = 0;
    level.player allowsprint( 1 );
    wait 4;
    setsaveddvar( "g_friendlyNameDist", 15000 );
    setsaveddvar( "g_friendlyfireDist", 128 );
}

landed_start()
{
    soundscripts\_snd::snd_message( "start_landed_checkpoint" );
    var_0 = getent( "street_start", "targetname" );
    level.player setorigin( var_0.origin );
    level.player setplayerangles( var_0.angles );
    var_1 = getentarray( "streets_start_spawners", "targetname" );
    common_scripts\utility::array_thread( var_1, maps\_utility::spawn_ai );
    common_scripts\utility::flag_set( "return_fire" );
    common_scripts\utility::flag_set( "start_first_obj" );
    common_scripts\utility::flag_set( "on_ground" );
    maps\_utility::battlechatter_off( "allies" );
    thread maps\_vehicle::create_vehicle_from_spawngroup_and_gopath( 9 );
}

ambient_asad_recordings( var_0 )
{
    if ( self.model != "com_tv1" && !isdefined( var_0 ) )
        return;

    var_1 = "";

    if ( isdefined( var_0 ) && var_0 )
        var_1 = "_studio";

    var_2 = [];
    var_2[var_2.size] = "armada_kaa_onenation_TV" + var_1;
    var_2[var_2.size] = "armada_kaa_newera_TV" + var_1;
    var_2[var_2.size] = "armada_kaa_selfinterest_TV" + var_1;
    var_2[var_2.size] = "armada_kaa_notenslaved_TV" + var_1;
    var_2[var_2.size] = "armada_kaa_donotfear_TV" + var_1;
    var_2[var_2.size] = "armada_kaa_freefromyoke_TV" + var_1;
    var_2[var_2.size] = "armada_kaa_armiesstrong_TV" + var_1;
    var_2[var_2.size] = "armada_kaa_greatnation_TV" + var_1;
    var_2[var_2.size] = "armada_kaa_laywaste_TV" + var_1;
    var_2[var_2.size] = "armada_kaa_willperish_TV" + var_1;
    var_3 = 0;
    var_4 = spawn( "script_origin", self.origin );
    var_4 endon( "death" );
    thread ambient_asad_handler( var_4 );

    for (;;)
    {
        var_5 = level common_scripts\utility::waittill_any_return( "stop_asad_recording", "next_asad_sound" );

        switch ( var_5 )
        {
            case "stop_asad_recording":
                var_4 stopsounds();
                wait 0.5;
                var_4 delete();
                return;
            case "next_asad_sound":
                var_4 playsound( var_2[var_3], "done" );
                var_3 = ( var_3 + 1 ) % var_2.size;
                continue;
        }
    }
}

master_recording()
{
    common_scripts\utility::flag_wait( "hq_entered" );
    wait 2;
    var_0 = getent( "master_asad_sound", "script_noteworthy" );
    var_1 = [];
    var_1[0] = spawnstruct();
    var_1[1] = spawnstruct();
    var_1[2] = spawnstruct();
    var_1[3] = spawnstruct();
    var_1[4] = spawnstruct();
    var_1[5] = spawnstruct();
    var_1[6] = spawnstruct();
    var_1[7] = spawnstruct();
    var_1[8] = spawnstruct();
    var_1[9] = spawnstruct();
    var_1[0].sound = "armada_kaa_onenation_TV";
    var_1[1].sound = "armada_kaa_newera_TV";
    var_1[2].sound = "armada_kaa_selfinterest_TV";
    var_1[3].sound = "armada_kaa_notenslaved_TV";
    var_1[4].sound = "armada_kaa_donotfear_TV";
    var_1[5].sound = "armada_kaa_freefromyoke_TV";
    var_1[6].sound = "armada_kaa_armiesstrong_TV";
    var_1[7].sound = "armada_kaa_greatnation_TV";
    var_1[8].sound = "armada_kaa_laywaste_TV";
    var_1[9].sound = "armada_kaa_willperish_TV";
    var_1[0].sound_length = 9;
    var_1[1].sound_length = 11;
    var_1[2].sound_length = 14;
    var_1[3].sound_length = 6;
    var_1[4].sound_length = 13;
    var_1[5].sound_length = 8;
    var_1[6].sound_length = 5;
    var_1[7].sound_length = 13;
    var_1[8].sound_length = 5;
    var_1[9].sound_length = 8;
    var_2 = 0;

    for (;;)
    {
        level notify( "next_asad_sound" );
        var_0 playsound( var_1[var_2].sound );
        wait(var_1[var_2].sound_length);
        var_2++;

        if ( var_2 == var_1.size )
            var_2 = 0;
    }
}

ambient_asad_handler( var_0 )
{
    level endon( "stop_asad_recording" );

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
                wait 0.5;
                var_0 delete();
                return;
        }
    }
}

stop_all_asad_vo_on_tv()
{
    foreach ( var_1 in level.recordings )
        var_1 notify( "off" );
}

turn_off_videos()
{
    var_0 = getentarray( "interactive_tv", "targetname" );

    for ( var_1 = 0; var_1 < var_0.size; var_1++ )
    {
        if ( issubstr( var_0[var_1].model, "tv1_cinematic" ) )
            var_0[var_1] setmodel( "com_tv1_testpattern" );
    }

    stopcinematicingame();
}

flag_on_notify( var_0, var_1 )
{
    self waittill( var_1 );
    common_scripts\utility::flag_set( var_0 );
}

setasdestructible( var_0, var_1, var_2, var_3 )
{
    self setcandamage( 1 );

    for (;;)
    {
        self waittill( "damage", var_4, var_5, var_6, var_7, var_8, var_9, var_10 );

        if ( var_4 <= 0 )
            continue;

        if ( isdefined( var_3 ) && var_3 )
            self physicslaunchclient( self.origin, var_6 * var_4 );

        self setmodel( var_0 );
        var_11 = self getorigin();
        var_12 = var_11 + var_2;
        playfx( level._effect[var_1], var_12 );
        break;
    }
}

monitor_destruct()
{
    setasdestructible( "h1_mwr_com_widescreen_monitor_des", "tv_explosion", ( 0.0, 0.0, 25.0 ), 1 );
}

monitor_destruct2()
{
    setasdestructible( "h1_mwr_com_widescreen_monitor_2_des", "tv_explosion", ( 0.0, 0.0, 30.0 ), 1 );
}

monitor_destruct3()
{
    setasdestructible( "h1_mwr_com_widescreen_monitor_3_des", "tv_explosion", ( 0.0, 0.0, 28.0 ), 1 );
}

monitor_destruct_on()
{
    setasdestructible( "com_widescreen_monitor_on_1_des", "tv_explosion", ( 0.0, 0.0, 25.0 ), 1 );
}

monitor_destruct_on_2()
{
    setasdestructible( "com_widescreen_monitor_on_2_des", "tv_explosion", ( 0.0, 0.0, 30.0 ), 1 );
}

monitor_destruct_on_3()
{
    setasdestructible( "com_widescreen_monitor_on_3_des", "tv_explosion", ( 0.0, 0.0, 28.0 ), 1 );
}

computer_destruct()
{
    setasdestructible( "com_computer_monitor_d", "tv_explosion", ( 0.0, 0.0, 10.0 ) );
}

tv_news_destruct()
{
    setasdestructible( "me_news_ticker_video_screen_des", "tv_explosion", ( 0.0, 0.0, 25.0 ) );
    wait 2.0;
    setasdestructible( "me_news_ticker_video_screen_des2", "tv_explosion", ( 0.0, 0.0, 25.0 ) );
}

monitor_destruct_scaled()
{
    setasdestructible( "com_widescreen_monitor_on_1_des_scaled", "tv_explosion", ( 0.0, 0.0, 40.0 ) );
}

monitor_destruct_on_scaled2()
{
    setasdestructible( "com_widescreen_monitor_on_2_des_scaled", "tv_explosion", ( 0.0, 0.0, 50.0 ) );
}

tv_wall()
{
    setasdestructible( "btr_tv_smart_wall_02_sml_des01", "tv_explosion", ( 0.0, 0.0, 25.0 ) );
    wait 2.0;
    setasdestructible( "btr_tv_smart_wall_02_sml_des02", "tv_explosion", ( 0.0, 0.0, 25.0 ) );
}

final_breach()
{
    var_0 = getent( "end_positions", "targetname" );
    var_1 = getent( "trigger_start_final_breach", "targetname" );
    var_2 = getent( "final_volume", "targetname" );
    var_3 = getent( "final_breach_anim_ent", "targetname" );
    var_4 = getent( "enter_final_room", "targetname" );
    var_0 waittill( "trigger" );
    thread maps\armada_code::quiet_circling_helicopters();
    stop_all_asad_vo_on_tv();
    var_2 thread flag_on_notify( "breach_ready_flag", "ready_to_breach" );
    var_5 = [];
    level.final_breacher_shotgun.firstbreacher = 1;
    var_5 = common_scripts\utility::add_to_array( var_5, level.final_breacher_shotgun );
    var_5 = common_scripts\utility::add_to_array( var_5, level.final_breacher_right );
    var_6 = "shotgunhinges_breach_left";
    level.scr_sound["breach_wood_door_kick"] = "scn_doorbreach_metal_door_kick";
    var_2 thread maps\_breach::breach_think( var_5, var_6 );
    var_2.edoorpivot movez( -2, 0.1 );
    level.griggs maps\_utility::set_force_color( "p" );
    level.price maps\_utility::set_force_color( "g" );
    var_7 = [];
    var_7[var_7.size] = level.price;
    var_7[var_7.size] = level.griggs;
    var_7[var_7.size] = level.final_breacher_shotgun;
    var_7[var_7.size] = level.final_breacher_right;
    var_8 = maps\_utility::get_closest_ai_exclude( level.player.origin, "allies", var_7 );
    var_7[var_7.size] = var_8;
    var_9 = maps\_utility::get_closest_ai_exclude( level.player.origin, "allies", var_7 );

    if ( isalive( var_9 ) )
        var_9 maps\_utility::set_force_color( "b" );

    var_1 waittill( "trigger" );
    level notify( "helis_stop_firing" );
    common_scripts\utility::flag_wait( "breach_ready_flag" );
    level.griggs maps\_anim::anim_single_queue( level.griggs, "I_hear_him" );
    wait 0.5;
    common_scripts\utility::flag_set( "i_hear_him" );
    thread ending_asad_usbkey_think();
    var_2 waittill( "execute_the_breach" );
    teleport_on_distance( level.price, "vasquezteleport" );
    teleport_on_distance( level.griggs, "griggsteleport" );
    level.price thread maps\_anim::anim_single_queue( level.price, "do_it" );
    wait 7;
    var_10 = getent( "col_finalebreach", "targetname" );
    var_10 delete();

    if ( isalive( var_9 ) )
        var_9 thread room_clear( getnode( "room_clear2_node", "script_noteworthy" ), "armada_gm3_roomclear" );

    wait 2;

    if ( isalive( var_8 ) )
        var_8 thread room_clear( getnode( "room_clear4_node", "script_noteworthy" ), "armada_gm2_nothere" );

    thread dialog_on_a_loop();
    wait 8;
    trigger_price_n_griggs( var_3, var_2 );
}

dialog_on_a_loop()
{
    wait 9.5;
    var_0 = level.final_breacher_shotgun;
    var_0.animname = "generic";
    var_0 maps\_anim::anim_single_queue( var_0, "armada_gm1_onaloop" );
}

room_clear( var_0, var_1 )
{
    self setgoalnode( var_0 );
    self waittill( "goal" );
    self.dontavoidplayer = 1;
    self pushplayer( 1 );

    if ( isdefined( var_1 ) )
    {
        self.animname = "generic";
        maps\_anim::anim_single_queue( self, var_1 );
    }

    wait 2;
    var_2 = getnode( var_0.target, "targetname" );
    self setgoalnode( var_2 );
    self waittill( "goal" );
    level waittill( "rally_up" );
    wait(randomfloatrange( 0.2, 1.5 ));
    self waittill( "goal" );
}

final_breacher_right_think()
{
    level.final_breacher_right = self;
    thread maps\_utility::magic_bullet_shield();
    self waittill( "breach_complete" );
    room_clear( getnode( "room_clear1_node", "script_noteworthy" ), "armada_gm1_clear" );
}

final_breacher_shotgun_think()
{
    level.final_breacher_shotgun = self;
    thread maps\_utility::magic_bullet_shield();
    self waittill( "breach_complete" );
    room_clear( getnode( "room_clear3_node", "script_noteworthy" ), "armada_gm2_clear" );
}

walk_to( var_0 )
{
    maps\_utility::disable_cqbwalk();
    maps\_utility::set_generic_run_anim( "walk", 1 );
    self.disablearrivals = 1;
    self.disableexits = 1;
    self.goalradius = 32;
    self setgoalnode( var_0 );
    self waittill( "goal" );
    maps\_anim::anim_generic( self, "patrol_stop" );
    self setgoalpos( self.origin );
}

trigger_price_n_griggs( var_0, var_1 )
{
    thread final_griggs( var_0, var_1 );
    wait 0.25;
    thread final_price( var_0, var_1 );
}

final_price( var_0, var_1 )
{
    level.price.dontavoidplayer = 1;
    level.price pushplayer( 1 );
    var_0 maps\_anim::anim_reach_solo( level.price, "enter" );
    level.price pushplayer( 1 );
    common_scripts\utility::flag_set( "end_vaz_ready" );
    thread maps\_utility::battlechatter_off();
    var_0 maps\_anim::anim_single_solo( level.price, "enter" );
    level.price pushplayer( 1 );
    level.price setgoalpos( level.price.origin );
}

final_griggs( var_0, var_1 )
{
    level.griggs.dontavoidplayer = 1;
    level.griggs pushplayer( 1 );
    var_0 maps\_anim::anim_reach_solo( level.griggs, "enter" );
    level.griggs forceteleport( var_0.origin, var_0.angles );
    level.griggs pushplayer( 1 );
    common_scripts\utility::flag_set( "end_grg_ready" );
    thread end_dialog_sequence();
    var_0 maps\_anim::anim_single_solo( level.griggs, "enter" );
    level.griggs pushplayer( 1 );
}

end_dialog_sequence()
{
    wait 13.25;
    thread griggs_plays_music();
    wait 15;
    level notify( "rally_up" );
    wait 6.5;
    maps\_utility::nextmission();
}

griggs_plays_music()
{
    wait 0.5;
    level.griggs thread maps\_utility::play_sound_on_entity( "scn_armada_griggs_music" );
    wait 5;
    var_0 = getent( "al_assad_recording", "targetname" );
    var_0.stop = 1;
    var_0 stopsounds();
    level notify( "stop_asad_recording" );
    turn_off_videos();
    thread common_scripts\utility::play_sound_in_space( "armada_end_song", var_0.origin );
    wait 2;
}

end_start()
{
    soundscripts\_snd::snd_message( "start_end_checkpoint" );
    var_0 = getent( "end_start", "targetname" );
    level.player setorigin( var_0.origin );
    level.player setplayerangles( var_0.angles );
    var_1 = getentarray( "end_spawners", "targetname" );
    common_scripts\utility::array_thread( var_1, maps\_utility::spawn_ai );
    common_scripts\utility::array_thread( var_1, maps\_utility::add_spawn_function, maps\_utility::enable_cqbwalk );
    waittillframeend;
    common_scripts\utility::flag_set( "start_first_obj" );
    common_scripts\utility::flag_set( "hq_entered" );
    common_scripts\utility::flag_set( "hq_cleared" );
    common_scripts\utility::flag_set( "on_ground" );
    common_scripts\utility::flag_set( "regrouped" );
    common_scripts\utility::flag_set( "tvstation_entered" );
    common_scripts\utility::flag_set( "news_room_clear" );
    common_scripts\utility::flag_set( "entered_atrium" );
    wait 0.2;
    var_2 = getent( "end_positions", "targetname" );
    var_2 notify( "trigger" );
}

tv_breach_dialog( var_0 )
{
    var_0 waittill( "detpack_about_to_blow" );
    wait 1;
    level.price playsound( "armada_vsq_doit" );
    wait 2;
    level.tv_breacher playsound( "armada_gm1_breachingbreaching" );
    wait 1;
    level.price playsound( "armada_vsq_gogogo2" );
}

get_tv_breacher()
{
    common_scripts\utility::flag_wait( "tv_station_locked_down" );
    common_scripts\utility::flag_clear( "aa_street_fight" );
    level.price thread maps\_anim::anim_single_queue( level.price, "targetbuilding" );
    var_0 = maps\_utility::get_force_color_guys( "allies", "g" );

    if ( var_0.size > 0 )
    {
        var_1 = maps\_utility::get_force_color_guys( "allies", "r" );
        var_2 = 5 - var_1.size;

        for ( var_3 = 0; var_3 < var_2; var_3++ )
        {
            if ( isalive( var_0[var_3] ) )
                var_0[var_3] maps\_utility::set_force_color( "r" );
        }
    }

    var_4 = maps\_utility::get_force_color_guys( "allies", "g" );
    var_4[var_4.size] = level.price;
    level.tv_breacher = maps\_utility::get_closest_ai_exclude( level.player.origin, "allies", var_4 );
    level.tv_breacher thread maps\_utility::magic_bullet_shield();
}

#using_animtree("generic_human");

tv_breach()
{
    var_0 = getent( "trigger_tv_breach", "targetname" );
    var_0 waittill( "trigger" );
    var_1 = getentarray( "server_blink", "targetname" );
    common_scripts\utility::array_thread( var_1, ::server_blinking_lights );
    var_2 = getent( "trigger_after_tv_breach_volume", "targetname" );
    var_2 common_scripts\utility::trigger_off();
    thread news_room_clear();
    thread exit_news_room_door();
    dialog_tv_station_locked_down( var_0 );
    var_3 = getent( "breach_positions", "targetname" );
    var_3 notify( "trigger" );
    var_4 = getent( "tv_volume", "targetname" );
    level.tv_breacher thread maps\_utility::replace_on_death();

    if ( distancesquared( level.tv_breacher.origin, level.player.origin ) > 1690000 )
        level.tv_breacher forceteleport( ( 2294.8, 25157.0, -26.4 ), ( 0.0, 0.0, 0.0 ) );

    if ( distancesquared( level.price.origin, level.player.origin ) > 1690000 )
        level.price forceteleport( ( 2184.1, 25231.2, -47.9 ), ( 0.0, 0.0, 0.0 ) );

    thread tv_breach_dialog( var_4 );
    var_5 = [];
    var_5 = common_scripts\utility::add_to_array( var_5, level.price );
    var_5 = common_scripts\utility::add_to_array( var_5, level.tv_breacher );

    for ( var_6 = 0; var_6 < var_5.size; var_6++ )
        var_5[var_6].usebreachapproach = 0;

    var_7 = getaiarray( "allies" );

    foreach ( var_9 in var_7 )
    {
        if ( isdefined( var_9 ) )
            var_9 setisforcedincombat( 1 );
    }

    level.scr_anim["generic"]["detcord_stack_left_start_01"] = %h1_breach_explosive_stackl_tv_approach;
    level.scr_anim["generic"]["detcord_stack_left_start_02"] = %h1_breach_explosive_tv_approach;
    level.scr_anim["generic"]["detcord_stack_left_start_no_approach_01"] = %h1_breach_explosive_stackl_tv_idle;
    level.scr_anim["generic"]["detcord_stack_left_start_no_approach_02"] = %h1_breach_explosive_tv_idle;
    level.scr_anim["generic"]["detcord_stack_leftidle_01"][0] = %h1_breach_explosive_stackl_tv_idle;
    level.scr_anim["generic"]["detcord_stack_leftidle_02"][0] = %h1_breach_explosive_tv_idle;
    level.scr_anim["generic"]["detcord_stack_leftbreach_01"] = %h1_breach_explosive_stackl_tv;
    level.scr_anim["generic"]["detcord_stack_leftbreach_02"] = %h1_breach_explosive_tv;
    var_11 = "explosive_breach_left";
    var_12 = undefined;
    var_13 = 0;
    var_14 = 0;
    var_15 = 0;
    level.scr_sound["breach_wood_door_kick"] = "";

    if ( isdefined( level.price.new_force_color_being_set ) )
        level.price waittill( "done_setting_new_color" );

    if ( isdefined( level.tv_breacher.new_force_color_being_set ) )
        level.tv_breacher waittill( "done_setting_new_color" );

    var_4 thread maps\_breach::breach_think( var_5, var_11, var_12, var_13, var_14, var_15 );

    while ( !var_4.breached )
        wait 0.05;

    level.price maps\_utility::set_force_color( "o" );
    level.tv_breacher maps\_utility::set_force_color( "o" );
    var_2 common_scripts\utility::trigger_on();
    var_2 notify( "trigger" );

    for ( var_6 = 0; var_6 < var_5.size; var_6++ )
        var_5[var_6].usebreachapproach = 1;

    level.price maps\_utility::enable_ai_color();
    level.tv_breacher maps\_utility::enable_ai_color();
    level.tv_breacher maps\_utility::stop_magic_bullet_shield();
    common_scripts\utility::flag_set( "aa_tv_fight" );
    common_scripts\utility::flag_wait( "aa_tv_fight" );

    foreach ( var_9 in var_7 )
    {
        if ( isdefined( var_9 ) )
            var_9 setisforcedincombat( 0 );
    }
}

dialog_tv_station_locked_down( var_0 )
{
    var_1 = [];
    var_1[0] = level.price;
    var_2 = level.tv_breacher;
    var_2.animname = "generic";

    while ( distance( var_0.origin, level.price.origin ) > 1000 )
        wait 0.5;

    var_2 maps\_anim::anim_single_queue( var_2, "tvstation" );
    wait 0.5;
    level.price maps\_anim::anim_single_queue( level.price, "get_into_pos" );
}

hq_breach()
{
    var_0 = getent( "start_breach", "targetname" );
    var_0 waittill( "trigger" );
    level.breacher.wantshotgun = 1;
    var_1 = getent( "trigger_after_hq_breach_volume", "targetname" );
    var_1 common_scripts\utility::trigger_off();
    thread sit_rep_dialog();
    level.scr_anim["generic"]["detcord_stack_left_start_01"] = %h1_breach_explosive_stackl_hq_approach;
    level.scr_anim["generic"]["detcord_stack_left_start_02"] = %h1_breach_explosive_hq_approach;
    level.scr_anim["generic"]["detcord_stack_left_start_no_approach_01"] = %h1_breach_explosive_stackl_hq_idle;
    level.scr_anim["generic"]["detcord_stack_left_start_no_approach_02"] = %h1_breach_explosive_hq_idle;
    level.scr_anim["generic"]["detcord_stack_leftidle_01"][0] = %h1_breach_explosive_stackl_hq_idle;
    level.scr_anim["generic"]["detcord_stack_leftidle_02"][0] = %h1_breach_explosive_hq_idle;
    level.scr_anim["generic"]["detcord_stack_leftbreach_01"] = %h1_breach_explosive_stackl_hq;
    level.scr_anim["generic"]["detcord_stack_leftbreach_02"] = %h1_breach_explosive_hq;
    var_2 = getent( "volume_room01", "targetname" );
    thread breach_dialog( var_2 );
    var_3 = [];
    var_3 = common_scripts\utility::add_to_array( var_3, level.price );
    var_3 = common_scripts\utility::add_to_array( var_3, level.breacher );
    var_4 = "explosive_breach_left";
    var_5 = undefined;
    var_6 = 0;
    var_7 = 0;
    var_2 thread maps\_breach::breach_think( var_3, var_4, var_5, var_6, var_7 );
    var_8 = getent( "breach_enemy_trigger", "script_noteworthy" );
    var_8 notify( "trigger" );
    var_2 waittill( "detpack_detonated" );
    var_1 common_scripts\utility::trigger_on();
    var_1 notify( "trigger" );
    level.price maps\_utility::enable_ai_color();
    level.breacher maps\_utility::enable_ai_color();
    thread dialog_clear_on_hq_breach();
    level endon( "on_stairs" );
    var_9 = getent( "vasquez_in_pos", "targetname" );
    var_9 waittill( "trigger" );
    wait 2;
    level.price maps\_anim::anim_single_queue( level.price, "jacksonpoint" );
    common_scripts\utility::flag_set( "aa_hq_fight" );
}

dialog_clear_on_hq_breach()
{
    common_scripts\utility::flag_wait( "hq_breach_enemies_dead" );
    level.breacher playsound( "armada_gm1_clear" );
}

breach_dialog( var_0 )
{
    level.price playsound( "armada_vsq_sidedoorbreach" );
    var_0 waittill( "detpack_about_to_blow" );
    wait 1;
    level.price playsound( "armada_vsq_blowcharge" );
    wait 2;
    level.breacher playsound( "armada_gm1_breaching" );
    wait 1;
    level.price playsound( "armada_vsq_gogogo" );
}

price_think()
{
    level.price = self;
    level.price.animname = "price";
    level.price thread maps\_utility::magic_bullet_shield();
    level.price.interval = 50;
}

griggs_think()
{
    level.griggs = self;
    level.griggs.animname = "griggs";
    level.griggs thread maps\_utility::magic_bullet_shield();
}

breacher_think()
{
    level.breacher = self;
    level.breacher thread maps\_utility::magic_bullet_shield();
    level.breacher.interval = 50;
    common_scripts\utility::flag_wait( "hq_cleared" );
    wait 0.1;
    level.breacher thread maps\_utility::stop_magic_bullet_shield();
}

hq_breachers_think()
{
    self.interval = 50;
}

technical_setup()
{
    var_0 = getent( "technical_setup", "targetname" );
    var_0 waittill( "trigger" );
    wait 1;
    var_1 = getent( "canal_technical", "targetname" );
    var_2 = var_1.last_spawned_vehicle;

    if ( !isdefined( var_2 ) )
    {

    }

    var_2.mgturret[0] setmode( "manual_ai" );
    var_2.mgturret[0] settargetentity( level.player_heli );
    var_2 waittill( "start_vehiclepath" );
    var_2.mgturret[0] startfiring();
    wait 8;
    var_2 delete();
    maps\armada_code::init_pickup_technical();
}

rpg_guys()
{
    var_0 = getentarray( "rpg_guy", "script_noteworthy" );

    for ( var_1 = 0; var_1 < var_0.size; var_1++ )
        var_0[var_1].pacifist = 1;

    for (;;)
    {
        var_0 = getentarray( "rpg_guy", "script_noteworthy" );

        for ( var_1 = 0; var_1 < var_0.size; var_1++ )
        {
            if ( !isalive( var_0[var_1] ) )
                continue;

            var_2 = common_scripts\utility::getclosest( var_0[var_1].origin, level.helis );
            var_3 = distance( var_2.origin, var_0[var_1].origin );

            if ( var_3 < 2500 && var_0[var_1].pacifist )
            {
                var_0[var_1] setentitytarget( var_2 );
                var_0[var_1].pacifist = 0;
                var_0[var_1] thread kill_in_ten();
            }

            wait 0.05;
        }

        wait 0.05;
    }
}

kill_in_ten()
{
    common_scripts\utility::flag_wait_or_timeout( "kill_rpgs", 10 );

    if ( isalive( self ) )
        self dodamage( self.health + 100, self.origin );
}

helis_move()
{
    thread maps\_vehicle::gopath( self );
}

helis_move2()
{
    var_0 = undefined;

    if ( isdefined( self.target ) )
        var_0 = getent( self.target, "targetname" );
    else
    {

    }

    var_1 = 0;
    var_2 = [];

    while ( isdefined( var_0 ) )
    {
        var_2[var_1] = var_0;
        var_1++;

        if ( isdefined( var_0.target ) )
        {
            var_0 = getent( var_0.target, "targetname" );
            continue;
        }

        break;
    }

    var_3 = 512;

    for ( var_4 = 0; var_4 < var_2.size; var_4++ )
    {
        if ( isdefined( var_2[var_4].radius ) )
            var_3 = var_2[var_4].radius;

        self setneargoalnotifydist( 400 );
        var_5 = 0;

        if ( isdefined( var_2[var_4].script_stopnode ) )
            var_5 = var_2[var_4].script_stopnode;

        self setvehgoalpos( var_2[var_4].origin, var_5 );
        self waittill( "near_goal" );
    }
}

debug( var_0 )
{
    while ( isdefined( self.script_parameters ) )
        wait 0.05;
}

set_threatbias_group( var_0 )
{
    self setthreatbiasgroup( var_0 );
}

get_living( var_0 )
{
    var_1 = 0;
    var_2 = [];

    for ( var_3 = 0; var_3 < var_0.size; var_3++ )
    {
        if ( isalive( var_0[var_3] ) )
        {
            var_2[var_1] = var_0[var_3];
            var_1++;
        }
    }

    return var_2;
}

circling_helis_rpg_guy_think()
{
    while ( isalive( self ) )
    {
        var_0 = common_scripts\utility::getclosest( self.origin, level.circling_helis );
        self setentitytarget( var_0 );
        wait 1;
    }
}

helicopter_residual_dust()
{
    self waittill( "unloading" );
    common_scripts\_exploder::exploder( "heli_residual_rooftop" );
    wait 20;
    maps\_utility::stop_exploder( "heli_residual_rooftop" );
}

kill_during_breach( var_0, var_1 )
{
    var_2 = getentarray( "hq_breach_enemies", "script_noteworthy" );

    for ( var_3 = 0; var_3 < var_2.size; var_3++ )
    {
        if ( !isai( var_2[var_3] ) )
            continue;

        var_2[var_3] dodamage( var_2[var_3].health + 100, var_2[var_3].origin );
        var_2[var_3] animscripts\face::saygenericdialogue( "death" );
        wait 0.3;
    }
}

achieve_tvs()
{
    level.tv_count = 0;
    var_0 = getentarray( "interactive_tv", "targetname" );

    foreach ( var_2 in var_0 )
    {
        if ( var_2.model == "com_tv1" )
        {
            level.tv_count++;
            var_2.isachievementtv = 1;
        }
    }

    if ( getdvar( "tv_helper" ) != "off" )
        common_scripts\utility::array_thread( var_0, ::tv_helper );

    level.tvhook = ::achieve_tvs_hook;
}

tv_helper()
{
    if ( self.model == "com_tv1" )
        maps\_utility::draw_line_from_ent_to_ent_until_notify( level.player, self, 1, 1, 0, self, "tv_done" );
}

achieve_tvs_hook()
{
    if ( !isdefined( self.isachievementtv ) )
        return;

    level.tv_count--;
    self notify( "tv_done" );

    if ( !level.tv_count )
        maps\_utility::giveachievement_wrapper( "YOUR_SHOW_SUCKS" );
}

remove_non_cinematic_tvs_from_array( var_0 )
{
    var_1 = [];

    for ( var_2 = 0; var_2 < var_0.size; var_2++ )
    {
        if ( var_0[var_2].model != "com_tv1_cinematic" )
            continue;

        var_1[var_1.size] = var_0[var_2];
    }

    return var_1;
}

tirefire_fx()
{
    var_0 = common_scripts\utility::spawn_tag_origin();
    var_0.origin = self.origin;
    var_0.angles = self.angles;
    playfxontag( common_scripts\utility::getfx( "tire_fire" ), var_0, "tag_origin" );
    var_0 maps\_utility::play_loop_sound_on_tag( "armada_tire_fire", "tag_origin", 1, 1 );
}

damage_on()
{
    self setcandamage( 1 );

    for (;;)
    {
        self waittill( "damage", var_0, var_1, var_2, var_3, var_4 );

        if ( var_4 != "MOD_MELEE" && var_4 != "MOD_IMPACT" )
            self physicslaunchclient( self.origin, ( 0.0, 0.0, 0.0 ) );

        wait 0.01;
    }
}

teleport_on_distance( var_0, var_1 )
{
    var_2 = distancesquared( level.player.origin, var_0.origin );

    if ( var_2 > 640000 )
    {
        var_3 = getnode( var_1, "targetname" );
        var_0 forceteleport( var_3.origin, var_3.angles );
    }
}

override_lighting_lobby()
{
    var_0 = getent( "news_room_exit_door", "targetname" );
    var_1 = getnode( "door_shadow_pos", "targetname" );
    var_2 = getnode( "door_shadow_pos2", "targetname" );
    var_3 = getent( "trigger_inside_lobby", "targetname" );
    var_0 overridelightingorigin( var_1.origin );
    var_3 waittill( "trigger" );
    var_0 overridelightingorigin( var_2.origin );
}

tv_station_reset_friendlyfire()
{
    common_scripts\utility::flag_wait( "in_tv_station_lighting_zone_1" );

    if ( isdefined( level.player.participation ) )
        level.player.participation = 0;
}

server_blinking_lights()
{
    for (;;)
    {
        if ( distancesquared( self.origin, level.player.origin ) < 1000000 )
        {
            var_0 = randomfloatrange( 0.07, 0.15 );
            self overridematerial( "mtl_lab_server_rack_modular", "mtl_lab_server_rack_modular_off" );
            wait(var_0);
            self overridematerialreset();
            wait(var_0);
        }

        wait 0.1;
    }
}

set_model_function( var_0 )
{
    self setmodel( var_0 );
}

bright_tv()
{
    var_0 = undefined;
    var_1 = undefined;
    var_2 = self;

    if ( isdefined( var_2.script_parameters ) )
    {
        if ( var_2.script_parameters == "brighter_tv" )
            var_1 = "bright";
        else if ( var_2.script_parameters == "darker_tv" )
            var_1 = "darker";
    }

    if ( isdefined( var_1 ) )
    {
        var_3 = 1000000;

        for (;;)
        {
            var_0 = distancesquared( var_2.origin, level.player.origin );

            if ( var_0 < var_3 )
            {
                var_2 overridematerial( "cinematic_3d", "cinematic_3d_" + var_1 + "_armada" );
                break;
            }

            wait 0.5;
        }
    }
}

ending_asad_usbkey_think()
{
    var_0 = getent( "final_breach_anim_ent", "targetname" );
    var_1 = maps\_utility::spawn_anim_model( "asad_usbkey" );
    var_0 maps\_anim::anim_first_frame_solo( var_1, "enter" );
    level waittill( "trash_asad_usb" );
    var_0 thread maps\_anim::anim_single_solo( var_1, "enter" );
    level waittill( "grounded_asad_usb" );
    wait 0.35;
    var_1 delete();
}

ending_griggs_usbkey_think( var_0 )
{
    var_1 = spawn( "script_model", var_0 gettagorigin( "tag_weapon_chest" ) );
    var_1.angles = var_0 gettagangles( "tag_weapon_chest" );
    var_1 setmodel( "h1_me_armada_usb_device" );
}

officelight_intensity()
{
    self setcandamage( 1 );
    self waittill( "damage" );
    var_0 = getentarray( "officelight", "targetname" );
    var_1 = undefined;

    if ( level.office_tvs.size == 5 )
        var_1 = 1000;
    else if ( level.office_tvs.size <= 3 )
        var_1 = 300;

    foreach ( var_3 in var_0 )
    {
        if ( isdefined( var_1 ) )
            var_3 setlightintensity( var_1 );
    }

    level.office_tvs = common_scripts\utility::array_remove( level.office_tvs, self );
}
