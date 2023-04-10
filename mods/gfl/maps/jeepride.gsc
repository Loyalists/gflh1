// H1 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

dead_script()
{
    common_scripts\_ca_blockout::init();
    maps\jeepride_precache::main();
    maps\jeepride_fx::main();
    maps\_load::main();
    maps\jeepride_anim::main_anim();
    level thread maps\jeepride_amb::main();
    maps\createart\jeepride_art::main();
    maps\jeepride_lighting::main();
}

main()
{
    if ( getdvar( "beautiful_corner" ) == "1" )
    {
        dead_script();
        return;
    }

    level.startdelay = 0;
    level.sparksclaimed = 0;
    level.whackamolethread = maps\jeepride_code::whackamole;
    level.playerlinkinfluence = 0.5;
    level.exploder_fast = [];
    level.cosine = [];
    level.cosine["180"] = cos( 180 );
    level.minbmpexplosiondmg = 50;
    level.maxbmpexplosiondmg = 100;
    level.bmpcannonrange = 4096;
    level.bmpmgrange = 4000;
    level.bmpmgrangesquared = level.bmpmgrange * level.bmpmgrange;
    level.potentialweaponitems = maps\jeepride_code::alltheweapons();
    level.notanksquish = 1;
    level.vehicles_with_drones = [];
    level.drone_unloader = 0;
    level.ai_in_boundry = 0;
    level.last_layer_of_death = 0;
    level.nocompass = 1;
    common_scripts\utility::array_levelthread( getentarray( "delete_on_load", "targetname" ), maps\_utility::deleteent );
    common_scripts\utility::array_levelthread( getentarray( "delete_on_load", "target" ), maps\_utility::deleteent );
    level.defaultragdolltime = getdvarint( "ragdoll_max_life" );
    precacherumble( "tank_rumble" );
    precacherumble( "jeepride_bridgesink" );
    precacherumble( "jeepride_cliffblow" );
    precacherumble( "jeepride_pillarblow" );
    precacheitem( "hind_FFAR_jeepride" );
    precacheitem( "crash_missile_jeepride" );
    precacheitem( "rpg" );
    precacheitem( "colt45_zak_killer" );
    precacheshader( "black" );
    precacheshader( "white" );
    precacheshellshock( "jeepride_bridgebang" );
    precacheshellshock( "jeepride_action" );
    precacheshellshock( "jeepride_zak" );
    precacheshellshock( "jeepride_zak_killing" );
    precacheshellshock( "jeepride_rescue" );
    precachemodel( "worldbody_h1_sas_woodland_nopistol" );
    precachemodel( "worldhands_h1_usmc_woodland" );
    precachemodel( "weapon_colt1911_white" );
    precachemodel( "weapon_colt1911_black" );
    precachemodel( "weapon_saw" );
    precachemodel( "weapon_rpg7_no_rocket" );
    setomnvar( "ui_jeepride_init", 1 );
    maps\_utility::default_start( ::ride_start );
    maps\_utility::add_start( "start", ::ride_start, &"STARTS_START" );
    maps\_utility::add_start( "first_hind", ::start_first_hind, &"STARTS_FIRSTHIND" );
    maps\_utility::add_start( "against_traffic", ::wip_start, &"STARTS_AGAINSTTRAFFIC" );
    maps\_utility::add_start( "final_stretch", ::wip_start, &"STARTS_FINALSTRETCH" );
    maps\_utility::add_start( "bridge_explode", ::bridge_explode_start, &"STARTS_BRIDGEEXPLODE" );
    maps\_utility::add_start( "bridge_combat", ::bridge_combat, &"STARTS_BRIDGECOMBAT" );
    maps\_utility::add_start( "bridge_zak", ::bridge_zak, &"STARTS_BRIDGEZAK" );
    maps\_utility::add_start( "bridge_rescue", ::bridge_rescue_start, &"STARTS_BRIDGERESCUE" );
    maps\_utility::add_start( "nowhere", ::start_nowhere, &"STARTS_NOWHERE" );

    if ( getdvar( "jeepride_smoke_shadow" ) == "" )
        setdvar( "jeepride_smoke_shadow", "off" );

    if ( getdvar( "jeepride_crashrepro" ) == "" )
        setdvar( "jeepride_crashrepro", "off" );

    if ( getdvar( "jeepride_showhelitargets" ) == "" )
        setdvar( "jeepride_showhelitargets", "off" );

    if ( getdvar( "jeepride_recordeffects" ) == "" )
        setdvar( "jeepride_recordeffects", "off" );

    if ( getdvar( "jeepride_startgen" ) == "" )
        setdvar( "jeepride_startgen", "off" );

    if ( getdvar( "jeepride_rpgbox" ) == "" )
        setdvar( "jeepride_rpgbox", "off" );

    if ( getdvar( "jeepride_nobridgefx" ) == "" )
        setdvar( "jeepride_nobridgefx", "off" );

    if ( getdvar( "jeepride_tirefx" ) == "" )
        setdvar( "jeepride_tirefx", "off" );

    if ( getdvar( "jeepride_player_pickup" ) == "" )
        setdvar( "jeepride_player_pickup", "off" );

    if ( getdvar( "jeepride_multi_shot" ) == "" )
        setdvar( "jeepride_multi_shot", "off" );

    setdvar( "use_old_uaz_anims", 1 );
    setsaveddvar( "g_DisableAntilagOnLinkedVehicles", 1 );
    setsaveddvar( "ragdoll_use_linear_velocity", 1 );

    if ( getdvar( "jeepride_crashrepro" ) == "off" && getdvar( "jeepride_recordeffects" ) == "off" )
        thread maps\jeepride_fx::jeepride_fxline();

    common_scripts\utility::array_thread( getentarray( "bridge_triggers", "script_noteworthy" ), common_scripts\utility::trigger_off );
    common_scripts\utility::array_thread( getentarray( "bridge_triggers2", "script_noteworthy" ), common_scripts\utility::trigger_off );
    common_scripts\utility::array_thread( getentarray( "ambient_setter", "targetname" ), maps\jeepride_code::ambient_setter );
    common_scripts\utility::array_thread( getentarray( "sound_emitter", "targetname" ), maps\jeepride_code::sound_emitter );
    maps\jeepride_precache::main();
    maps\jeepride_fx::main();
    level.weaponclipmodels[0] = "weapon_ak47_clip";
    level.weaponclipmodels[1] = "weapon_m16_clip";
    level.weaponclipmodels[2] = "weapon_saw_clip";
    level.weaponclipmodels[3] = "weapon_g36_clip";
    maps\_vehicle::build_deathquake_with_classname( "script_vehicle_truck", 0.7, 1.6, 1500 );
    maps\_vehicle::build_deathquake_with_classname( "script_vehicle_luxurysedan", 0.7, 1.6, 1000 );
    maps\_vehicle::build_deathquake_with_classname( "script_vehicle_tanker_truck_civ", 0.7, 1.6, 1000 );
    maps\_vehicle::build_deathquake_with_classname( "script_vehicle_80s_wagon1", 0.7, 1.6, 1000 );
    maps\_vehicle::build_deathquake_with_classname( "script_vehicle_80s_hatch1", 0.7, 1.6, 1000 );
    maps\_vehicle::build_deathquake_with_classname( "script_vehicle_small_wagon", 0.7, 1.6, 1000 );
    maps\_vehicle::build_deathquake_with_classname( "script_vehicle_bus", 0.7, 1.6, 1000 );
    maps\_vehicle::build_deathquake_with_classname( "script_vehicle_small_hatchback", 0.5, 1.6, 1000 );
    maps\_vehicle::build_aianims_with_classname( "script_vehicle_uaz_open_destructible", maps\jeepride_anim::uaz_overrides, maps\jeepride_anim::uaz_override_vehicle );
    maps\_vehicle::build_aianims_with_classname( "script_vehicle_uaz_hardtop_destructible", maps\jeepride_anim::uaz_overrides, maps\jeepride_anim::uaz_override_vehicle );
    maps\_vehicle::build_aianims_with_classname( "script_vehicle_uaz_fabric_destructible", maps\jeepride_anim::uaz_overrides, maps\jeepride_anim::uaz_override_vehicle );
    maps\_vehicle::build_aianims_with_classname( "script_vehicle_uaz_open_for_ride", maps\jeepride_anim::uaz_overrides, maps\jeepride_anim::uaz_override_vehicle );
    maps\createart\jeepride_art::main();
    maps\jeepride_anim::main();
    maps\_load::main();
    level.player takeweapon( "fraggrenade" );
    level.player thread shock_ondeath_loc();
    maps\_drone_ai::init();
    maps\jeepride_lighting::main();
    maps\jeepride_aud::main();
    level.vehicle_aianimthread["hide_attack_forward"] = maps\jeepride_code::guy_hide_attack_forward;
    level.vehicle_aianimcheck["hide_attack_forward"] = maps\jeepride_code::guy_hide_attack_forward_check;
    level.vehicle_aianimthread["hidetoback_attack"] = maps\jeepride_code::guy_hidetoback_startingback;
    level.vehicle_aianimcheck["hidetoback_attack"] = maps\jeepride_code::guy_hidetoback_check;
    level.vehicle_aianimthread["back_attack"] = maps\jeepride_code::guy_back_attack;
    level.vehicle_aianimcheck["back_attack"] = maps\jeepride_code::guy_hidetoback_check;
    level.vehicle_aianimthread["hide_attack_left"] = maps\jeepride_code::guy_hide_attack_left;
    level.vehicle_aianimcheck["hide_attack_left"] = maps\jeepride_code::guy_hide_attack_left_check;
    level.vehicle_aianimthread["hide_attack_left_standing"] = maps\jeepride_code::guy_hide_attack_left_standing;
    level.vehicle_aianimcheck["hide_attack_left_standing"] = maps\jeepride_code::guy_hidetoback_check;
    level.vehicle_aianimthread["hide_attack_back"] = maps\jeepride_code::guy_hide_attack_back;
    level.vehicle_aianimcheck["hide_attack_back"] = maps\jeepride_code::guy_hide_attack_back_check;
    level.vehicle_aianimthread["hide_starting_back"] = maps\jeepride_code::guy_hide_starting_back;
    level.vehicle_aianimcheck["hide_starting_back"] = maps\jeepride_code::guy_hidetoback_check;
    level.vehicle_aianimthread["hide_starting_left"] = maps\jeepride_code::guy_hide_startingleft;
    level.vehicle_aianimcheck["hide_starting_left"] = maps\jeepride_code::guy_backtohide_check;
    level.vehicle_aianimthread["backtohide"] = maps\jeepride_code::guy_backtohide;
    level.vehicle_aianimcheck["backtohide"] = maps\jeepride_code::guy_backtohide_check;
    level.vehicle_aianimthread["react"] = maps\jeepride_code::guy_react;
    level.vehicle_aianimcheck["react"] = maps\jeepride_code::guy_react_check;

    if ( !isdefined( level.fxplay_model ) || getdvar( "jeepride_crashrepro" ) != "off" )
    {
        common_scripts\utility::array_thread( common_scripts\utility::getstructarray( "ghetto_tag", "targetname" ), maps\jeepride_code::ghetto_tag );
        common_scripts\utility::array_thread( getvehiclenodearray( "sparks_on", "script_noteworthy" ), maps\jeepride_code::trigger_sparks_on );
        common_scripts\utility::array_thread( getvehiclenodearray( "sparks_off", "script_noteworthy" ), maps\jeepride_code::trigger_sparks_off );
    }

    getent( "gaz", "script_noteworthy" ) maps\_utility::add_spawn_function( ::setup_gaz );
    getent( "price", "script_noteworthy" ) maps\_utility::add_spawn_function( ::setup_price );
    getent( "griggs", "script_noteworthy" ) maps\_utility::add_spawn_function( ::setup_griggs );
    getent( "medic", "script_noteworthy" ) maps\_utility::add_spawn_function( ::setup_medic );
    getent( "ru1", "script_noteworthy" ) maps\_utility::add_spawn_function( ::setup_ru1 );
    getent( "ru2", "script_noteworthy" ) maps\_utility::add_spawn_function( ::setup_ru2 );
    level.lock_on_player_ent = spawn( "script_model", level.player.origin + ( 0.0, 0.0, 24.0 ) );
    level.lock_on_player_ent setmodel( "fx" );
    level.lock_on_player_ent linkto( level.player );
    level.lock_on_player_ent hide();
    level.lock_on_player_ent.script_attackmetype = "missile";
    level.lock_on_player_ent.script_shotcount = 4;
    level.lock_on_player_ent.oldmissiletype = 0;
    level.lock_on_player = 0;
    maps\_utility::battlechatter_off( "allies" );
    thread objectives();
    maps\jeepride_amb::main();
    level.player allowprone( 0 );
    level.player allowsprint( 0 );
    common_scripts\utility::array_thread( maps\_vehicle_code::_getvehiclespawnerarray(), maps\jeepride_code::process_vehicles_spawned );
    common_scripts\utility::array_thread( getentarray( "missile_offshoot", "targetname" ), maps\jeepride_code::missile_offshoot );
    maps\jeepride_code::crashed_vehicles_setup();
    common_scripts\utility::array_thread( common_scripts\utility::getstructarray( "fliptruck_ghettoanimate", "targetname" ), maps\jeepride_code::fliptruck_ghettoanimate );

    if ( isdefined( level.fxplay_model ) )
    {
        common_scripts\utility::array_thread( common_scripts\utility::getstructarray( "attack_dummy_path", "targetname" ), maps\jeepride_code::attack_dummy_path );
        common_scripts\utility::array_thread( common_scripts\utility::getstructarray( "vehicle_badplacer", "targetname" ), maps\jeepride_code::vehicle_badplacer );
        common_scripts\utility::array_thread( getentarray( "exploder", "targetname" ), maps\jeepride_code::exploder_animate );
        common_scripts\utility::array_thread( getentarray( "exploder", "targetname" ), maps\jeepride_code::exploder_phys );
    }

    level.struct_remove = undefined;
    level.struct = [];
    level.struct_class_names = undefined;
    level.struct_class_names = [];
    level.struct_class_names["target"] = [];
    level.struct_class_names["targetname"] = [];
    level.struct_class_names["script_noteworthy"] = [];

    if ( isdefined( level.fxplay_model ) )
    {
        common_scripts\utility::array_thread( getvehiclenodearray( "nodisconnectpaths", "script_noteworthy" ), maps\jeepride_code::nodisconnectpaths );
        common_scripts\utility::array_thread( getvehiclenodearray( "crazy_bmp", "script_noteworthy" ), maps\jeepride_code::crazy_bmp );
        common_scripts\utility::array_thread( getvehiclenodearray( "do_or_die", "script_noteworthy" ), maps\jeepride_code::do_or_die );
        common_scripts\utility::array_thread( getvehiclenodearray( "hillbump", "script_noteworthy" ), maps\jeepride_code::hillbump );
        common_scripts\utility::array_thread( getvehiclenodearray( "honker_initiate", "script_noteworthy" ), maps\jeepride_code::honker_initiate );
    }

    common_scripts\utility::array_thread( getvehiclenodearray( "bm21_unloader", "script_noteworthy" ), ::bm21_unloader );
    common_scripts\utility::array_thread( getvehiclenodearray( "attacknow", "script_noteworthy" ), maps\jeepride_code::attacknow );
    common_scripts\utility::array_thread( getvehiclenodearray( "sideswipe", "script_noteworthy" ), maps\jeepride_code::sideswipe );
    common_scripts\utility::array_thread( getvehiclenodearray( "destructible_assistance", "script_noteworthy" ), maps\jeepride_code::destructible_assistance );
    common_scripts\utility::array_thread( getvehiclenodearray( "no_godmoderiders", "script_noteworthy" ), maps\jeepride_code::no_godmoderiders );
    common_scripts\utility::array_thread( getvehiclenodearray( "jolter", "script_noteworthy" ), maps\jeepride_code::jolter );

    if ( isdefined( level.fxplay_model ) )
    {
        common_scripts\utility::array_thread( getvehiclenodearray( "clouds_off", "script_noteworthy" ), maps\jeepride_code::clouds_off );
        common_scripts\utility::array_thread( getvehiclenodearray( "clouds_on", "script_noteworthy" ), maps\jeepride_code::clouds_on );
        common_scripts\utility::array_thread( getvehiclenodearray( "unloadmanager", "script_noteworthy" ), maps\jeepride_code::unloadmanager );
    }

    common_scripts\utility::array_thread( getentarray( "hindset", "script_noteworthy" ), ::hindset );
    common_scripts\utility::array_thread( getentarray( "hindset_hindbombplayer", "script_noteworthy" ), ::hindset );
    common_scripts\utility::array_thread( getentarray( "hindset_hindbombplayer", "script_noteworthy" ), maps\jeepride_code::hind_bombplayer );
    getent( "end_hind_action", "script_noteworthy" ) thread end_hind_action();
    getvehiclenode( "end_bmp_action", "script_noteworthy" ) thread end_bmp_action();
    var_1 = getent( "AI_Stop_shooting", "targetname" );
    var_1 thread maps\jeepride_code::ai_rpg_tunnel_stop();
    var_2 = getent( "mountain_spawn", "targetname" );
    var_2 hide();
    var_2 maps\_utility::delaythread( 140, maps\jeepride_code::mountain_bridge );
    common_scripts\utility::array_thread( getentarray( "Guardrail_Model", "targetname" ), maps\jeepride_code::guardrail_think );

    if ( isdefined( level.fxplay_model ) )
    {
        common_scripts\utility::array_thread( getentarray( "magic_missileguy_spawner", "targetname" ), maps\jeepride_code::magic_missileguy_spawner );
        common_scripts\utility::array_thread( getentarray( "stinger_me", "script_noteworthy" ), maps\jeepride_code::stinger_me );
        common_scripts\utility::array_thread( getentarray( "stinger_me_nolock", "script_noteworthy" ), maps\jeepride_code::stinger_me, 0 );
        common_scripts\utility::array_thread( getentarray( "all_allies_targetme", "script_noteworthy" ), maps\jeepride_code::all_allies_targetme );
        common_scripts\utility::array_thread( getentarray( "heli_focusonplayer", "script_noteworthy" ), maps\jeepride_code::heli_focusonplayer );
        common_scripts\utility::array_thread( getentarray( "exploder", "targetname" ), maps\jeepride_code::exploder_hack );
        common_scripts\utility::array_thread( getentarray( "hidemeuntilflag", "script_noteworthy" ), maps\jeepride_code::hidemeuntilflag );
        common_scripts\utility::array_thread( getspawnerarray(), maps\jeepride_code::spawners_setup );
        common_scripts\utility::array_thread( getentarray( "layer_of_death0", "targetname" ), maps\jeepride_code::layer_of_death, 0 );
        common_scripts\utility::array_thread( getentarray( "layer_of_death1", "targetname" ), maps\jeepride_code::layer_of_death, 1 );
        common_scripts\utility::array_thread( getentarray( "layer_of_death2", "targetname" ), maps\jeepride_code::layer_of_death, 2 );
        common_scripts\utility::array_thread( getentarray( "layer_of_death3", "targetname" ), maps\jeepride_code::layer_of_death, 3 );
        common_scripts\utility::array_thread( getentarray( "layer_of_death4", "targetname" ), maps\jeepride_code::layer_of_death, 4 );
        common_scripts\utility::array_thread( getentarray( "falltrigger", "targetname" ), maps\jeepride_code::bridge_fall );
    }
    else
        level.createfxent = [];

    if ( getdvar( "jeepride_startgen" ) != "off" )
        common_scripts\utility::array_thread( getvehiclenodearray( "startgen", "script_noteworthy" ), maps\jeepride_code::startgen );

    maps\_utility::delaythread( 185, maps\jeepride_code::falling_bridge_price );
    thread maps\jeepride_code::bridge_bumper();
    thread maps\jeepride_code::bridge_uaz_crash();
    common_scripts\utility::flag_init( "end_action_bmp" );
    common_scripts\utility::flag_init( "end_action_hind" );
    common_scripts\utility::flag_init( "rpg_shot" );
    common_scripts\utility::flag_init( "rpg_taken" );
    common_scripts\utility::flag_init( "cover_from_heli" );
    common_scripts\utility::flag_init( "all_end_scene_guys_dead" );
    common_scripts\utility::flag_init( "kamarov_runs" );
    common_scripts\utility::flag_init( "bridge_zakhaev_setup" );
    common_scripts\utility::flag_init( "no_more_drone_unloaders" );
    common_scripts\utility::flag_init( "murdering_player" );
    common_scripts\utility::flag_init( "cpr_finished" );
    common_scripts\utility::flag_init( "slomo_done" );
    common_scripts\utility::flag_init( "slam_zoom_done" );
    common_scripts\utility::flag_init( "bridge_section_start" );
    common_scripts\utility::flag_init( "stop_limp" );
    getent( "ai_spot1", "script_noteworthy" ) hide();
    getent( "ai_spot2", "script_noteworthy" ) hide();
    getent( "ai_spot3", "script_noteworthy" ) hide();
    thread getplayersride();
    thread maps\jeepride_code::player_death();
    setsaveddvar( "sm_sunSampleSizeNear", 0.4 );
    setsaveddvar( "sm_sunShadowScale", 0.5 );
    thread music();
    thread maps\jeepride_code::jeepride_start_dumphandle();
    thread maps\jeepride_code::speedbumps_setup();
    thread end_ride();
    thread time_triggers();
    level.intro_offsets_dialog_time = 10;
    thread dialog_ride_price();
    thread dialog_ride_griggs();
    thread dialog_get_off_your_ass();
    thread maps\jeepride_code::dialog_killconfirm();
    thread maps\jeepride_code::dialog_rpg();
    thread end_action();
    thread maps\jeepride_code::bridge_vehiclde_drone_unloader();
    thread maps\jeepride_code::bridge_defence_bounds();
    thread beam_me_up();
    level.earthquake["cliff_blow"]["magnitude"] = 0.7;
    level.earthquake["cliff_blow"]["duration"] = 1;
    level.earthquake["cliff_blow"]["radius"] = 1200;
    level.earthquake["brace_fall"]["magnitude"] = 0.3;
    level.earthquake["brace_fall"]["duration"] = 1.5;
    level.earthquake["brace_fall"]["radius"] = 2200;
    thread bridge_save();
    common_scripts\utility::array_thread( getentarray( "notvehicle", "script_noteworthy" ), maps\jeepride_code::deleteme );
    wait 0.05;
    setsaveddvar( "compass", "0" );
    thread bx_scripted_events_flags_vfx();
    thread bx_warmup_vfx_bridge();
    thread bx_performance_vfx_count();
    thread rpg_from_griggs();
    level.player maps\_utility::delaythread( 161, ::bodysense_bridgeexplosion );
    maps\jeepride_code::helicopter_hide_crash_seq();
    maps\jeepride_code::bloodtrail_hide();
    maps\jeepride_code::disable_light_finalseq();
    setup_bridge_mi17();
}

rpg_from_griggs()
{
    var_0 = getent( "rpg_animation", "targetname" );
    var_0 waittill( "trigger" );
    level.rpg = spawn( "script_model", ( 0.0, 0.0, 1.0 ) );
    level.rpg.origin = level.griggs gettagorigin( "tag_weapon_right" );
    level.rpg.angles = level.griggs gettagangles( "tag_weapon_right" );
    level.rpg linkto( level.griggs, "tag_weapon_right" );
    level.rpg common_scripts\utility::delaycall( 1, ::setmodel, "weapon_rpg7_no_rocket" );
    level.griggs attach( "projectile_rpg7", "tag_inhand" );
    level.price thread hide_weapons();
    level.griggs thread hide_weapons();
    level.price thread maps\_anim::anim_single_solo( level.price, "rpgfromgriggs_price", "tag_guy0" );
    level.griggs maps\_anim::anim_single_solo( level.griggs, "rpgfromgriggs_griggs", "tag_passenger" );
    level.griggs notify( "show_weapon" );
}

remove_rpg_models( var_0 )
{
    level.player disableweaponpickup();
    level notify( "newrpg" );
    wait 0.1;
    level.rpg delete();
    level.griggs detach( "projectile_rpg7", "tag_inhand" );
    level.griggs waittill( "rpgfromgriggs_griggs" );
    level.player enableweaponpickup();
}

hide_weapons( var_0 )
{
    animscripts\shared::detachallweaponmodels();
    level.price.npcname = "price";
    level.price.jeeptag = "tag_guy0";
    level.griggs.npcname = "griggs";
    level.griggs.jeeptag = "tag_passenger";
    maps\_utility::set_generic_idle_anim( "rpgfromgriggs_" + self.npcname + "_idle" );
    level.griggs waittill( "show_weapon" );
    wait 0.2;
    animscripts\shared::updateattachedweaponmodels();
    wait 2;
    maps\_utility::clear_generic_idle_anim();
}

bodysense_bridgeexplosion()
{
    setsaveddvar( "ragdoll_use_linear_velocity", 0 );
    level.player disableweapons();
    var_0 = maps\_utility::spawn_anim_model( "playerview" );
    var_1 = level.player getorigin();
    var_2 = level.player getplayerangles();
    var_0.origin = var_1;
    var_0.angles = var_2;
    var_0 linktoplayerview( level.player, "tag_origin", ( 0.0, 0.0, -50.0 ), ( 0.0, 0.0, 0.0 ), 1 );
    var_0 maps\_anim::anim_single_solo( var_0, "player_bridgeexplosion" );
    level.player unlink();
    level.player freezecontrols( 1 );
    var_0 delete();
    level.player enableweapons();
}

slam_zoom_sound()
{
    wait 0.05;
    level.player playsound( "ui_camera_whoosh_in" );
}

slam_zoom_intro()
{
    waittillframeend;
    maps\_utility::slowmo_start();
    maps\_utility::slowmo_setlerptime_in( 0.25 );
    maps\_utility::slowmo_setlerptime_out( 0.25 );
    level.player freezecontrols( 1 );
    level.player disableweapons();
    level.player setplayerangles( ( 0.0, 0.0, 0.0 ) );
    level.player allowcrouch( 0 );
    level.player allowprone( 0 );
    var_0 = getent( "slam_zoom_start", "targetname" );
    var_1 = getent( var_0.target, "targetname" ).origin;
    var_2 = var_0.origin;
    var_3 = spawn( "script_model", var_2 );
    var_3 setmodel( "tag_origin" );
    var_3.angles = vectortoangles( var_1 - var_2 );
    level.player playerlinktodelta( var_3, "tag_origin", 1, 0, 0, 0, 0 );
    wait 0.05;
    setsaveddvar( "cg_fov", 55 );
    var_4 = 4.5;
    thread maps\_utility::lerp_fov_overtime( 5.5, 65 );
    var_3 moveto( var_1, var_4, 2.5, 1 );
    wait 1;
    soundscripts\_snd::snd_message( "remove_intro_mute" );
    wait 2;
    wait 0.525;
    wait 0.25;
    thread whitescreen();
    common_scripts\utility::array_levelthread( getentarray( "slam_zoom_backdrop", "targetname" ), maps\_utility::deleteent );
    wait 0.45;
    level.player setplayerangles( ( -8.4547, 171.59, 0.0 ) );
    maps\jeepride_code::player_link_update();
    level.player allowcrouch( 1 );
    wait 0.05;
    maps\_utility::slowmo_end();
    common_scripts\utility::flag_set( "slam_zoom_done" );
    thread common_scripts\utility::play_sound_in_space( "ui_screen_trans_in", level.player.origin );
    wait 0.2;
    level.player enableweapons();
    thread common_scripts\utility::play_sound_in_space( "ui_screen_trans_out", level.player.origin );
    wait 2.2;
    level notify( "destroy_hud_elements" );
    var_3 delete();
    maps\_utility::autosave_by_name( "levelstart" );
}

whitescreen()
{
    wait 0.2;
    var_0 = newhudelem();
    var_0.x = 0;
    var_0.y = 0;
    var_0 setshader( "white", 640, 480 );
    var_0.alignx = "left";
    var_0.aligny = "top";
    var_0.horzalign = "fullscreen";
    var_0.vertalign = "fullscreen";
    var_0.alpha = 0;
    var_0 fadeovertime( 0.15 );
    var_0.alpha = 1;
    wait 0.35;
    soundscripts\_snd::snd_message( "clear_whitescreen_mix" );
    var_0 fadeovertime( 0.15 );
    var_0.alpha = 0;
    wait 0.15;
    var_0 destroy();
}

end_ride()
{
    common_scripts\utility::flag_wait( "bx_end_bridge_transition" );
    thread bridge_transition();
    common_scripts\utility::flag_wait( "end_ride" );
    setsaveddvar( "sm_sunsamplesizenear", 0.25 );

    if ( level.start_point == "bridge_combat" || level.start_point == "bridge_zak" || level.start_point == "bridge_rescue" )
        return;

    common_scripts\utility::array_thread( getentarray( "bridge_triggers", "script_noteworthy" ), common_scripts\utility::trigger_on );
}

getplayersride()
{
    common_scripts\utility::flag_init( "playersride_init" );
    level.playersride = maps\_vehicle::waittill_vehiclespawn( "playersride" );
    level.playersride.dontunloadonend = 1;
    level.playersride maps\_vehicle::godon();
    level.lock_on_player_ent unlink();
    level.lock_on_player_ent.origin = level.playersride.origin + ( 0.0, 0.0, 24.0 );
    level.lock_on_player_ent linkto( level.playersride );
    common_scripts\utility::flag_set( "playersride_init" );
    level.playersride thread maps\jeepride_aud::start_player_jeep_sfx();
}

ride_start()
{
    setsaveddvar( "ragdoll_max_life", 30000 );
    soundscripts\_snd::snd_message( "aud_start_checkpoint" );
    thread maps\_vehicle::create_vehicle_from_spawngroup_and_gopath( 44 );
    thread maps\_vehicle::create_vehicle_from_spawngroup_and_gopath( 46 );
    thread maps\_vehicle::scripted_spawn( 45 );
    common_scripts\utility::flag_wait( "playersride_init" );
    level.playersride.target = "playerspath";
    level.playersride maps\_vehicle_code::getonpath();
    thread slam_zoom_intro();
    thread maps\_vehicle::gopath( level.playersride );
}

wip_start()
{
    soundscripts\_snd::snd_message( "aud_against_traffic_checkpoint" );
    common_scripts\utility::array_thread( getvehiclenodearray( level.start_point, "script_noteworthy" ), maps\jeepride_code::sync_vehicle );
    common_scripts\utility::flag_wait( "playersride_init" );
    maps\jeepride_code::player_link_update();
}

music_zak_timing()
{
    wait 2.75;
    common_scripts\utility::flag_set( "music_zak" );
}

music()
{
    common_scripts\utility::flag_init( "music_chase_end" );
    common_scripts\utility::flag_init( "music_bridge" );
    common_scripts\utility::flag_init( "music_zak" );
    common_scripts\utility::flag_init( "music_lastman" );
    common_scripts\utility::flag_init( "music_rescue" );
    waittillframeend;
    wait 0.8;
    music_flagged( "jeepride_chase_music", "music_chase_end", undefined, 0 );
    music_flagged( "jeepride_chase_end_music", "music_bridge" );
    music_flagged( "jeepride_defend_music", "music_zak" );
    music_flagged( "jeepride_showdown_music", "music_rescue", 0 );
    maps\_utility::musicplaywrapper( "jeepride_rescue_music", 0 );
}

music_flagged( var_0, var_1, var_2, var_3 )
{
    var_4 = 0.2;

    if ( isdefined( var_3 ) )
        var_4 = var_3;

    if ( !isdefined( var_2 ) )
        var_2 = 1;

    if ( common_scripts\utility::flag( var_1 ) )
        return;

    maps\_utility::musicplaywrapper( var_0, var_2 );
    common_scripts\utility::flag_wait( var_1 );
    musicstop();
    wait(var_4);
}

music_defend()
{
    maps\_utility::musicplaywrapper( "jeepride_defend_music" );
    var_0 = 43;
    wait(var_0);
}

time_triggers()
{
    common_scripts\utility::flag_init( "aa_riding_rpg_attackers" );
    common_scripts\utility::flag_init( "aa_riding_hind_attacker" );
    common_scripts\utility::flag_init( "aa_bridge_forth" );
    common_scripts\utility::flag_init( "aa_riding_pre_rpg_attackers" );
    waittillframeend;
    waittillframeend;
    common_scripts\utility::flag_set( "aa_riding_pre_rpg_attackers" );
    thread maps\jeepride_code::delaythread_loc( 51, common_scripts\utility::flag_set, "aa_riding_rpg_attackers" );
    thread maps\jeepride_code::delaythread_loc( 101, common_scripts\utility::flag_set, "aa_riding_hind_attacker" );
    thread maps\jeepride_code::delaythread_loc( 159, common_scripts\utility::flag_set, "aa_bridge_forth" );

    if ( level.start_point == "nowhere" )
        return;

    if ( getdvar( "start" ) != "wip" )
    {
        thread maps\jeepride_code::delaythread_loc( 12, ::autosave_now_loc, "down_the_hill" );
        thread maps\jeepride_code::delaythread_loc( 57, ::autosave_now_loc, "First Tunnel Exit" );
        thread maps\jeepride_code::delaythread_loc( 100, maps\jeepride_code::reset_autosave_condition );
        thread maps\jeepride_code::delaythread_loc( 100, maps\jeepride_code::player_link_update );
        thread maps\jeepride_code::delaythread_loc( 102, ::autosave_now_loc, "Hind Chase" );
        thread maps\jeepride_code::delaythread_loc( 160, ::autosave_now_loc, "Bridge Blown" );
    }

    thread maps\jeepride_code::delaythread_loc( 36, maps\jeepride_code::player_link_update_delta );
    thread maps\jeepride_code::delaythread_loc( 42, maps\jeepride_code::player_link_update );
    level.player thread maps\jeepride_code::delaythread_loc( 0.5, maps\_utility::play_sound_on_entity, "scn_jeepride_dirt1_opening" );
    level.player thread maps\jeepride_code::delaythread_loc( 37, maps\_utility::play_sound_on_entity, "scn_jeepride_dirt2_roadside" );
    level.player thread maps\jeepride_code::delaythread_loc( 82, maps\_utility::play_sound_on_entity, "scn_jeepride_dirt3_medianskid" );
    level.player thread maps\jeepride_code::delaythread_loc( 94, maps\_utility::play_sound_on_entity, "scn_jeepride_dirt4_medianslide" );
    level.player thread maps\jeepride_code::delaythread_loc( 113, maps\_utility::play_sound_on_entity, "scn_jeepride_dirt5_mediancross" );
    level.player thread maps\jeepride_code::delaythread_loc( 91, maps\jeepride_code::player_link_update, 0.3 );
    thread maps\jeepride_code::delaythread_loc( 122, maps\jeepride_code::fake_water_tread );
    thread maps\jeepride_code::delaythread_loc( 128, maps\jeepride_code::stop_fake_water_tread );
    level.player thread maps\jeepride_code::delaythread_loc( 96, common_scripts\utility::play_sound_in_space, "exp_tanker_vehicle" );
}

dialog_ride_price()
{
    if ( level.start_point == "nowhere" )
        return;

    wait 1;
    level.price maps\jeepride_code::delaythread_loc( 6.5 + level.intro_offsets_dialog_time, maps\_anim::anim_single_queue, level.price, "jeepride_pri_helistatus" );
    level.player maps\jeepride_code::delaythread_loc( 10 + level.intro_offsets_dialog_time, maps\_utility::play_sound_on_entity, "jeepride_hqr_griggsisnthere" );
    level.price maps\jeepride_code::delaythread_loc( 15 + level.intro_offsets_dialog_time, maps\_anim::anim_single_queue, level.price, "jeepride_pri_notgood" );
    level.price maps\jeepride_code::delaythread_loc( 16 + level.intro_offsets_dialog_time, maps\_anim::anim_single_queue, level.price, "jeepride_pri_truckleft" );
    level.price maps\jeepride_code::delaythread_loc( 48, maps\_anim::anim_single_queue, level.price, "jeepride_pri_coverrear" );
    level.price maps\jeepride_code::delaythread_loc( 78, maps\_anim::anim_single_queue, level.price, "jeepride_pri_company" );
    level.price maps\jeepride_code::delaythread_loc( 100, maps\_anim::anim_single_queue, level.price, "jeepride_pri_hind6oclock" );
    level.price maps\jeepride_code::delaythread_loc( 152, maps\_anim::anim_single_queue, level.price, "jeepride_pri_buggered" );
    level.gaz maps\jeepride_code::delaythread_loc( 155, maps\_anim::anim_single_queue, level.gaz, "jeepride_gaz_goodenough" );
    level.gaz maps\jeepride_code::delaythread_loc( 161, maps\_anim::anim_single_queue, level.gaz, "jeepride_gaz_stopbloodytruck" );
}

dialog_bridge_radio()
{
    level.player endon( "death" );
    maps\_utility::battlechatter_on( "axis" );
    maps\_utility::battlechatter_off( "allies" );
    level.gaz maps\_anim::anim_single_solo( level.gaz, "jeepride_gaz_heavyattackbridge" );
    level.griggs maps\_utility::play_sound_on_entity( "jeepride_hqr_workinonit" );
    level.gaz maps\_anim::anim_single_solo( level.gaz, "jeepride_gaz_uselesswanker" );
    wait 2;
    level.price maps\_anim::anim_single_solo( level.price, "jeepride_pri_sitreponhelis" );
    level.gaz maps\_anim::anim_single_solo( level.gaz, "jeepride_gaz_wereonourown" );
    wait 3;
    maps\_utility::battlechatter_on( "allies" );
    wait 7.5;
    maps\_utility::battlechatter_off( "allies" );
    wait 0.5;
    level.griggs maps\_utility::play_sound_on_entity( "jeepride_kmr_couldusehelp" );
    level.gaz maps\_anim::anim_single_solo( level.gaz, "jeepride_gaz_goodtohear" );
    wait 1;
    level.griggs maps\_utility::play_sound_on_entity( "jeepride_kmr_standbyalmostthere" );
    wait 1;
    maps\_utility::battlechatter_on( "allies" );
    wait 3;
    level.griggs maps\_utility::play_sound_on_entity( "jeepride_grg_tankabouttoblow" );
}

dialog_ride_griggs()
{
    if ( level.start_point == "nowhere" )
        return;

    maps\_utility::delaythread( 145, ::end_print_fx );
    wait 1;
    level.griggs maps\jeepride_code::delaythread_loc( 9.5, maps\_anim::anim_single_queue, level.griggs, "jeepride_grg_hangon" );
    level.griggs maps\jeepride_code::delaythread_loc( 12.5, maps\_anim::anim_single_queue, level.griggs, "jeepride_grg_truck6oclock" );
    level.griggs maps\jeepride_code::delaythread_loc( 107, maps\_anim::anim_single_queue, level.griggs, "jeepride_grg_rpgfirehind" );
    level.griggs maps\jeepride_code::delaythread_loc( 122, maps\_anim::anim_single_queue, level.griggs, "jeepride_grg_hind9oclock" );
    level.griggs maps\jeepride_code::delaythread_loc( 127, maps\_anim::anim_single_queue, level.griggs, "jeepride_grg_hangon" );
    level.griggs maps\jeepride_code::delaythread_loc( 132, maps\_anim::anim_single_queue, level.griggs, "jeepride_grg_rpgfirehind" );
    level.griggs maps\jeepride_code::delaythread_loc( 147, maps\_anim::anim_single_queue, level.griggs, "jeepride_grg_hind12oclock" );
    level.griggs maps\jeepride_code::delaythread_loc( 157, maps\_anim::anim_single_queue, level.griggs, "jeepride_grg_takeoutbridge" );
}

end_print_fx()
{

}

blown_bridge( var_0 )
{
    while ( isdefined( var_0 ) && distance2d( self.origin, var_0.origin ) > 350 && isdefined( self ) )
        wait 0.05;

    blow_bridge();
}

blow_bridge()
{
    level notify( "bridge_blower" );

    if ( isdefined( level.bridgeblown ) )
        return;

    level.bridgeblown = 1;
    level.player thread maps\_utility::play_sound_on_tag_endon_death( "scn_player_jeep_bridge_crash" );
    thread bridge_blow_fx();
}

bridge_blow_fx()
{
    earthquake( 1.5, 0.35, ( -35893.6, -15878.5, 460.0 ), 5000 );
    level.player playrumbleonentity( "tank_rumble" );
    thread bridge_blow_blur();
    common_scripts\_exploder::exploder( 54 );
    wait 0.55;
    maps\jeepride_code::exploder_loc( 3 );
    earthquake( 0.6, 0.3, ( -35893.6, -15878.5, 460.0 ), 5000 );
    level.player playrumbleonentity( "tank_rumble" );
    earthquake( 0.3, 1.0, ( -35893.6, -15878.5, 460.0 ), 5000 );
}

bridge_blow_blur()
{
    setblur( 1.5, 0.1 );
    wait 0.1;
    setblur( 0, 0.5 );
}

setup_gaz()
{
    level.gaz = self;
    level.gaz.animname = "gaz";
    level.gaz thread maps\_utility::magic_bullet_shield();
    level.gaz thread maps\_utility::make_hero();
}

setup_price()
{
    level.price = self;
    level.price.animname = "price";
    level.price thread maps\_utility::magic_bullet_shield();
    level.price thread maps\_utility::make_hero();
}

setup_griggs()
{
    level.griggs = self;
    level.griggs.animname = "griggs";
    level.griggs thread maps\_utility::magic_bullet_shield();
    level.griggs thread maps\_utility::make_hero();
}

setup_medic()
{
    level.medic = self;
    level.medic.animname = "medic";
    level.medic thread maps\_utility::magic_bullet_shield();
    level.medic thread maps\_utility::make_hero();
}

setup_ru1()
{
    level.ru1 = self;
    level.ru1.animname = "ru1";
    level.ru1.script_char_index = 1;
}

setup_ru2()
{
    level.ru2 = self;
    level.ru2.animname = "ru2";
}

dialog_get_off_your_ass()
{
    var_0 = gettime();
    var_1 = gettime();
    level.player endon( "death" );
    var_2 = 10000;
    var_3 = 4000;
    level endon( "newrpg" );
    level endon( "bridge_sequence" );

    for (;;)
    {
        if ( level.player getstance() == "stand" )
            var_0 = gettime();

        var_4 = gettime();

        if ( var_4 - var_0 > var_3 && var_4 - var_1 > var_2 )
        {
            var_1 = gettime();
            level.price maps\_anim::anim_single_queue( level.price, "jeepride_pri_getoffyour" );
        }

        wait 0.05;
    }
}

allowallstances()
{
    self allowedstances( "stand", "crouch", "prone" );
}

bodysense_bridgecollapse()
{
    setomnvar( "ui_jeepride_crash_recover", 1 );
    level.player allowcrouch( 0 );
    level.player allowprone( 0 );
    maps\_utility::vision_set_fog_changes( "jeepride_end", 0 );
    level.player maps\_utility::set_light_set_player( "jeepride_end" );
    var_0 = maps\_utility::spawn_anim_model( "playerview" );
    var_1 = getent( "endpos", "targetname" );
    var_0.origin = var_1.origin;
    var_0.angles = var_1.angles;
    level.player playerlinktodelta( var_0, "tag_player", 0, 0, 0, 0, 0, 0 );
    var_0 thread maps\_anim::anim_single_solo( var_0, "player_bridge" );
    soundscripts\_snd::snd_message( "start_post_bridge_explosion" );
    bridge_visual_transition_phase2();
    h1_bridgecollapserumbleseq();
    wait 8;
    soundscripts\_snd::snd_message( "stop_post_bridge_explosion" );
    wait 8;
    setomnvar( "ui_jeepride_crash_recover", 0 );
    level.player unlink();
    var_0 delete();
    level.player allowcrouch( 1 );
    level.player allowprone( 1 );
    level.player freezecontrols( 0 );
    thread checkmantle();
}

checkmantle()
{
    level.player endon( "death" );
    level endon( "stop_mantle" );

    while ( !level.player ismantling() )
        waitframe();

    var_0 = maps\_utility::spawn_anim_model( "playerview", level.player.origin, level.player.angles );
    var_0 dontcastshadows();
    var_1 = level.player getplayerviewheight() * -1.0;
    var_0 linktoplayerview( level.player, "tag_origin", ( 0, 0, var_1 ), ( 0.0, 0.0, 0.0 ), 0 );
    var_0 maps\_anim::anim_single_solo( var_0, "player_bridge_mantle" );
    var_0 delete();
    wait 0.2;
    checkmantle();
}

bridge_transition()
{
    var_0 = 2.0;
    var_1 = 0.5;
    var_2 = 2.0;
    var_3 = getent( "bridge_startspot", "targetname" );
    wait 0.3;
    earthquake( 0.5, 0.4, var_3.origin, 10000 );
    level.player takeallweapons();
    wait 0.3;
    earthquake( 0.3, 1, var_3.origin, 10000 );
    wait 0.75;
    earthquake( 0.5, 0.5, var_3.origin, 10000 );
    wait 0.1;
    thread maps\jeepride_aud::start_bridge_uaz_crash();
    var_4 = maps\jeepride_code::create_overlay_element( "black", 0 );
    var_4 thread maps\jeepride_code::exp_fade_overlay( 1, 0.001 );
    setblur( 5.0, 0.02 );
    common_scripts\utility::flag_wait( "end_ride" );
    thread bridge_setupguys( var_0 );
    wait(var_0);
    bridge_visual_transition_phase1();
    common_scripts\utility::array_thread( getaiarray( "allies" ), maps\jeepride_code::clearenemy_loc );
    maps\jeepride_code::clear_all_vehicles_but_heros_and_hind();
    level.player unlink();
    var_5 = spawnstruct();
    var_5 thread maps\_utility::function_stack( maps\_utility::player_fudge_moveto, var_3.origin, 280 );
    thread maps\jeepride_code::player_fudge_rotateto( var_3.angles, var_1 );
    setblur( 8.0, var_1 );
    wait(var_1);
    level.player allowstand( 1 );
    level.player allowprone( 1 );
    level.player allowsprint( 1 );
    common_scripts\utility::flag_set( "bridge_section_start" );
    wait 3;
    thread play_bridge_collapse_vfx();
    wait 1;
    soundscripts\_snd::snd_message( "start_bridge_collapse_mix" );
    thread h1_bridgewakeup_dof_seq();
    thread h1_bridgewakeup_fade_seq();
    var_4 thread maps\jeepride_code::exp_fade_overlay( 0, var_2 * 2 );
    bodysense_bridgecollapse();
    thread maps\jeepride_code::limp();
    thread maps\jeepride_code::player_speedscaling_bridge_seq();
    setblur( 0.0, var_2 * 0.5 );
    wait(var_2 * 0.7);
    level.player freezecontrols( 0 );
    wait(var_2 * 0.3);
    setsaveddvar( "compass", "1" );
    wait 0.1;
    common_scripts\utility::array_thread( getentarray( "bridge_triggers", "script_noteworthy" ), common_scripts\utility::trigger_on );
    thread autosave_now_loc();
    maps\_utility::activate_trigger_with_targetname( "bridge_enemies" );
}

h1_bridgewakeup_dof_seq()
{
    setblur( 0.0, 0.0 );
    level.player setphysicaldepthoffield( 2.0, 26, 9.0, 9.0 );
    level.player enablephysicaldepthoffieldscripting();
    setsaveddvar( "r_mbEnable", 2 );
    wait 3.65;
    level.player setphysicaldepthoffield( 2.5, 15.5, 0.5, 0.5 );
    wait 1.5;
    level.player setphysicaldepthoffield( 1.5, 180, 3.0, 3.0 );
    wait 4.15;
    level.player setphysicaldepthoffield( 1.5, 150, 0.5, 0.5 );
    wait 5.85;
    level.player setphysicaldepthoffield( 16.0, 500, 0.5, 0.5 );
    wait 3.0;
    level.player disablephysicaldepthoffieldscripting();
    setsaveddvar( "r_mbEnable", 0 );
}

h1_bridgecollapserumbleseq()
{
    var_0 = "j_chunk_09";
    maps\_utility::delaythread( 16.5, ::h1_bridgecollapserumblesystem, var_0, "SmallRumbleSustain", 0.7 );
    maps\_utility::delaythread( 16.85, ::h1_bridgecollapserumblesystem, var_0, "BigRumbleFadeOut" );
    maps\_utility::delaythread( 22.75, ::h1_bridgecollapserumblesystem, var_0, "SmallRumbleSustain", 0.9 );
    maps\_utility::delaythread( 28.85, ::h1_bridgecollapserumblesystem, var_0, "BigRumbleFadeOut" );
    var_0 = "j_chunk_07";
    maps\_utility::delaythread( 11.65, ::h1_bridgecollapserumblesystem, var_0, "SmallRumbleSustain", 0.9 );
    maps\_utility::delaythread( 16.65, ::h1_bridgecollapserumblesystem, var_0, "BigRumbleFadeOut" );
    maps\_utility::delaythread( 17.75, ::h1_bridgecollapserumblesystem, var_0, "MediumRumbleFadeOut" );
    maps\_utility::delaythread( 18.8, ::h1_bridgecollapserumblesystem, var_0, "MediumRumbleFadeOut" );
    maps\_utility::delaythread( 19.65, ::h1_bridgecollapserumblesystem, var_0, "BigRumbleFadeOut" );
    maps\_utility::delaythread( 20.2, ::h1_bridgecollapserumblesystem, var_0, "SmallRumbleSustain", 0.8 );
    maps\_utility::delaythread( 21.2, ::h1_bridgecollapserumblesystem, var_0, "BigRumbleFadeOut" );
    var_0 = "j_chunk_08";
    maps\_utility::delaythread( 17.0, ::h1_bridgecollapserumblesystem, var_0, "SmallRumbleSustain", 0.7 );
    maps\_utility::delaythread( 17.85, ::h1_bridgecollapserumblesystem, var_0, "MediumRumbleFadeOut" );
    maps\_utility::delaythread( 24.95, ::h1_bridgecollapserumblesystem, var_0, "BigRumbleFadeOut" );
    var_0 = "j_chunk_06";
    maps\_utility::delaythread( 17.0, ::h1_bridgecollapserumblesystem, var_0, "OneMediumRumble" );
    maps\_utility::delaythread( 17.45, ::h1_bridgecollapserumblesystem, var_0, "OneMediumRumble" );
    maps\_utility::delaythread( 17.9, ::h1_bridgecollapserumblesystem, var_0, "OneBigRumble" );
    maps\_utility::delaythread( 18.8, ::h1_bridgecollapserumblesystem, var_0, "OneMediumRumble" );
    maps\_utility::delaythread( 19.35, ::h1_bridgecollapserumblesystem, var_0, "MediumRumbleFadeOut" );
    maps\_utility::delaythread( 20.0, ::h1_bridgecollapserumblesystem, var_0, "BigRumbleFadeOut" );
    maps\_utility::delaythread( 29.4, ::h1_bridgecollapserumblesystem, var_0, "SmallRumbleSustain", 1.25 );
    maps\_utility::delaythread( 30.95, ::h1_bridgecollapserumblesystem, var_0, "MediumRumbleFadeOut" );
    var_0 = "j_chunk_10";
    maps\_utility::delaythread( 24.75, ::h1_bridgecollapserumblesystem, var_0, "SmallRumbleSustain", 0.6 );
    maps\_utility::delaythread( 26.35, ::h1_bridgecollapserumblesystem, var_0, "SmallRumbleSustain", 1.85 );
    maps\_utility::delaythread( 28.35, ::h1_bridgecollapserumblesystem, var_0, "OneMediumRumble" );
    maps\_utility::delaythread( 28.5, ::h1_bridgecollapserumblesystem, var_0, "SmallRumbleSustain", 1.35 );
    maps\_utility::delaythread( 30.0, ::h1_bridgecollapserumblesystem, var_0, "OneMediumRumble" );
    var_0 = "j_chunk_02";
    maps\_utility::delaythread( 21.6, ::h1_bridgecollapserumblesystem, var_0, "OneMediumRumble" );
    maps\_utility::delaythread( 22.0, ::h1_bridgecollapserumblesystem, var_0, "BigRumbleFadeOut" );
    maps\_utility::delaythread( 22.85, ::h1_bridgecollapserumblesystem, var_0, "SmallRumbleSustain", 1.0 );
    maps\_utility::delaythread( 24.0, ::h1_bridgecollapserumblesystem, var_0, "BigRumbleFadeOut" );
    maps\_utility::delaythread( 39.15, ::h1_bridgecollapserumblesystem, var_0, "SmallRumbleSustain", 0.85 );
    maps\_utility::delaythread( 40.15, ::h1_bridgecollapserumblesystem, var_0, "OneBigRumble" );
    maps\_utility::delaythread( 40.5, ::h1_bridgecollapserumblesystem, var_0, "OneMediumRumble" );
    maps\_utility::delaythread( 40.65, ::h1_bridgecollapserumblesystem, var_0, "SmallRumbleSustain", 1.45 );
    maps\_utility::delaythread( 42.6, ::h1_bridgecollapserumblesystem, var_0, "BigRumbleFadeOut" );
    maps\_utility::delaythread( 42.65, ::h1_bridgecollapserumblesystem, var_0, "MediumRumbleSustain", 0.85 );
    var_0 = "j_chunk_04";
    maps\_utility::delaythread( 6.55, ::h1_bridgecollapserumblesystem, var_0, "OneMediumRumble" );
    maps\_utility::delaythread( 7.2, ::h1_bridgecollapserumblesystem, var_0, "OneMediumRumble" );
    maps\_utility::delaythread( 8.0, ::h1_bridgecollapserumblesystem, var_0, "OneMediumRumble" );
    maps\_utility::delaythread( 8.15, ::h1_bridgecollapserumblesystem, var_0, "SmallRumbleSustain", 2.65 );
    maps\_utility::delaythread( 17.85, ::h1_bridgecollapserumblesystem, var_0, "OneMediumRumble" );
    maps\_utility::delaythread( 18.5, ::h1_bridgecollapserumblesystem, var_0, "OneSmallRumble" );
    maps\_utility::delaythread( 19.5, ::h1_bridgecollapserumblesystem, var_0, "SmallRumbleSustain", 0.9 );
    maps\_utility::delaythread( 20.5, ::h1_bridgecollapserumblesystem, var_0, "OneMediumRumble" );
    maps\_utility::delaythread( 20.65, ::h1_bridgecollapserumblesystem, var_0, "SmallRumbleSustain", 0.9 );
    maps\_utility::delaythread( 20.85, ::h1_bridgecollapserumblesystem, var_0, "OneMediumRumble" );
    maps\_utility::delaythread( 21.95, ::h1_bridgecollapserumblesystem, var_0, "OneMediumRumble" );
    maps\_utility::delaythread( 22.0, ::h1_bridgecollapserumblesystem, var_0, "SmallRumbleSustain", 0.9 );
    maps\_utility::delaythread( 22.35, ::h1_bridgecollapserumblesystem, var_0, "OneMediumRumble" );
}

h1_bridgecollapserumblesystem( var_0, var_1, var_2 )
{
    var_3 = "";
    var_4 = 0.0;
    var_5 = 0.0;
    var_6 = "";
    var_7 = 0.09;
    var_8 = 0.13;
    var_9 = 0.25;
    var_10 = getent( "bridgecollapsing", "targetname" );
    var_0 = var_10 gettagorigin( var_0 );

    switch ( var_1 )
    {
        case "OneSmallRumble":
            var_3 = "normal";
            var_4 = var_7;
            var_5 = 0.3;
            var_6 = "damage_light";
            break;
        case "OneMediumRumble":
            var_3 = "normal";
            var_4 = var_8;
            var_5 = 0.4;
            var_6 = "damage_light";
            break;
        case "OneBigRumble":
            var_3 = "normal";
            var_4 = var_9;
            var_5 = 0.5;
            var_6 = "tank_rumble";
            break;
        case "SmallRumbleFadeOut":
            var_3 = "fade";
            var_4 = var_7;
            var_5 = 1.0;
            var_6 = "damage_light";
            break;
        case "MediumRumbleFadeOut":
            var_3 = "fade";
            var_4 = var_8;
            var_5 = 2.0;
            var_6 = "damage_light";
            break;
        case "BigRumbleFadeOut":
            var_3 = "fade";
            var_4 = var_9;
            var_5 = 3.0;
            var_6 = "tank_rumble";
            break;
        case "SmallRumbleSustain":
            var_3 = "sustain";
            var_4 = var_7;
            var_5 = var_2 * 2;
            break;
        case "MediumRumbleSustain":
            var_3 = "sustain";
            var_4 = var_8;
            var_5 = var_2 * 2;
            break;
        case "BigRumbleSustain":
            var_3 = "sustain";
            var_4 = var_9;
            var_5 = var_2 * 2;
            break;
    }

    if ( var_3 == "normal" || var_3 == "sustain" )
    {
        if ( var_6 != "" )
            level.player playrumbleonentity( var_6 );

        earthquake( var_4, var_5, var_0, 10000 );
        wait(var_5);

        if ( var_6 == "tank_rumble" )
            level.player stoprumble( "tank_rumble" );
    }
    else if ( var_3 == "fade" )
    {
        if ( var_6 != "" )
            level.player playrumbleonentity( var_6 );

        earthquake( var_4 * 0.6, var_5 / 4.0, var_0, 10000 );
        wait(var_5 / 4.0);
        earthquake( var_4 * 1.0, var_5 / 4.0, var_0, 10000 );
        wait(var_5 / 4.0);

        if ( var_6 == "tank_rumble" )
            level.player stoprumble( "tank_rumble" );

        earthquake( var_4 * 0.5, var_5 / 4.0, var_0, 10000 );
        wait(var_5 / 4.0);
        earthquake( var_4 * 0.2, var_5 / 4.0, var_0, 10000 );
        wait(var_5 / 4.0);
    }
}

bridge_visual_transition_phase1()
{
    maps\jeepride_code::exploder_loc( 71 );
    maps\jeepride_code::exploder_loc( 73 );
    maps\jeepride_code::exploder_loc( 74 );
    maps\jeepride_code::exploder_loc( 14002 );
}

bridge_visual_transition_phase2()
{
    common_scripts\utility::flag_set( "bridge_sequence" );
    maps\jeepride_code::exploder_loc( 72 );
    var_0 = getent( "bridgecollapsing", "targetname" );
    var_1 = getent( "left_car", "script_noteworthy" );
    var_2 = getent( "right_car", "script_noteworthy" );
    var_1.origin = var_0 gettagorigin( "j_uaz_goat" );
    var_1.angles = var_0 gettagangles( "j_uaz_goat" );
    var_2.origin = var_0 gettagorigin( "j_wagon" );
    var_2.angles = var_0 gettagangles( "j_wagon" );
    var_1 linkto( var_0, "j_uaz_goat" );
    var_2 linkto( var_0, "j_wagon" );
    var_0 maps\jeepride_code::bridge_linkto( "chunk_10", "j_chunk_10" );
    var_0 maps\jeepride_code::bridge_linkto( "chunk_7", "j_chunk_07" );
    var_0 maps\jeepride_code::bridge_linkto( "chunk_8", "j_chunk_08" );
    var_0 maps\jeepride_code::bridge_linkto( "chunk_9", "j_chunk_09" );
    var_0 maps\jeepride_code::bridge_linkto( "chunk_6", "j_chunk_06" );
    var_0 maps\jeepride_code::bridge_linkto( "chunk_5", "j_chunk_05" );
    var_0 maps\jeepride_code::bridge_linkto( "chunk_4", "j_chunk_04" );
    var_0 maps\jeepride_code::bridge_linkto( "chunk_3", "j_chunk_03" );
    var_0 maps\jeepride_code::bridge_linkto( "chunk_2", "j_chunk_02" );
    var_0 maps\jeepride_code::bridge_linkto( "chunk_27", "joint27" );
    var_0 maps\_utility::assign_animtree( "bridge_collapse" );
    var_0 thread maps\_anim::anim_single_queue( var_0, "bridge_collapsing" );
    reconnect_bridge_paths();
}

bridge_setupguys( var_0 )
{
    var_1 = getnode( "platform1", "targetname" );
    var_2 = getnode( "platform2", "targetname" );
    var_3 = getnode( "platform3", "targetname" );
    var_4 = getent( "ai_spot1", "script_noteworthy" );
    var_5 = getent( "ai_spot2", "script_noteworthy" );
    var_6 = getent( "ai_spot3", "script_noteworthy" );
    var_4 hide();
    var_5 hide();
    var_6 hide();
    level.price unlink();
    maps\jeepride_code::guy_force_remove_from_vehicle( level.price.ridingvehicle, level.price, var_4.origin );
    level.price linkto( var_4, "polySurface1", ( 0.0, 0.0, 0.0 ), ( 0.0, 0.0, 0.0 ) );
    level.price teleport( var_4.origin, ( 0.0, 0.0, 0.0 ) );
    level.price hide();
    setsaveddvar( "ai_friendlyFireBlockDuration", 0 );
    level.price.a.disablepain = 1;
    level.price.ignoresuppression = 1;
    maps\jeepride_code::guy_force_remove_from_vehicle( level.griggs.ridingvehicle, level.griggs, var_5.origin );
    level.griggs unlink();
    level.griggs linkto( var_5, "polySurface1", ( 0.0, 0.0, 0.0 ), ( 0.0, 0.0, 0.0 ) );
    level.griggs thread force_position( var_5.origin );
    level.griggs unlink();
    maps\jeepride_code::guy_force_remove_from_vehicle( level.gaz.ridingvehicle, level.gaz, var_6.origin );
    level.gaz unlink();
    level.gaz linkto( var_6, "polySurface1", ( 0.0, 0.0, 0.0 ), ( 0.0, 0.0, 0.0 ) );
    level.gaz thread force_position( var_6.origin );
    level.gaz unlink();
    var_7 = [];
    var_7[var_7.size] = getent( "auto4018", "targetname" );
    var_7[var_7.size] = getent( "auto4130", "targetname" );
    var_7[var_7.size] = getent( "auto4133", "targetname" );
    var_7[var_7.size] = getent( "auto4042", "targetname" );
    var_7[var_7.size] = getent( "auto4040", "targetname" );
    var_7[var_7.size] = getent( "auto4044", "targetname" );
    var_7[var_7.size] = getent( "auto4184", "targetname" );
    var_7[var_7.size] = getent( "auto4300", "targetname" );
    common_scripts\utility::array_thread( var_7, ::removetreadfx );
    var_8 = getaiarray( "allies" );

    for ( var_9 = 0; var_9 < var_8.size; var_9++ )
    {
        if ( var_8[var_9] maps\jeepride_code::ishero() )
            continue;

        if ( isdefined( var_8[var_9].magic_bullet_shield ) && var_8[var_9].magic_bullet_shield )
        {
            var_8[var_9] maps\_utility::stop_magic_bullet_shield();
            var_8[var_9] delete();
        }
    }

    wait 5.5;
    var_10 = var_0 - 1;
    wait(var_10);
    thread price_bridge_crawl_anims( var_4 );
    wait(var_0 - var_10);
    level.price show();
    wait 3;
    level.price thread maps\_anim::anim_single_queue( level.price, "jeepride_pri_thebridge" );
    wait 14;
    level.griggs unlink();
    level.price pushplayer( 1 );
    level.price unlink();
    wait 2;
    level.price pushplayer( 1 );
    level.price thread maps\_spawner::go_to_node( var_1 );
    wait 2;
    common_scripts\utility::flag_set( "stop_limp" );

    if ( !isalive( level.player ) )
        return;

    level.player endon( "death" );
    level.griggs thread maps\_anim::anim_single_queue( level.griggs, "jeepride_grg_bouttocollapse" );
    common_scripts\_exploder::exploder( 11 );
    maps\_utility::activate_trigger_with_targetname( "allies_startcolor" );
    common_scripts\utility::flag_set( "music_bridge" );
    maps\_vehicle::create_vehicle_from_spawngroup_and_gopath( 66 );
    thread maps\jeepride_aud::play_mi17_scripted_sequence();
    thread maps\jeepride_aud::play_bm21_unload_troops_sequence();
    wait 5;
    wait 5;
    setup_bridge_defense();
}

removetreadfx()
{
    self waittill( "spawned", var_0 );
    var_0 notify( "kill_treads_forever" );
}

bridge_explode_start()
{
    soundscripts\_snd::snd_message( "aud_bridge_explode_checkpoint" );
    thread bridge_explode_onstart();
    wip_start();
}

bridge_explode_onstart()
{
    getvehiclenode( "bridge_explode_onstart", "script_noteworthy" ) waittill( "trigger" );
    blow_bridge();
}

setup_bridge_defense()
{
    var_0 = getnode( "bridge_defendnode", "targetname" );
    thread dialog_bridge_radio();
    remove_non_hero_shields();
    thread maps\jeepride_code::encroacher();
    common_scripts\utility::array_thread( getaiarray(), ::allowallstances );
    wait 3;
    maps\_utility::activate_trigger_with_targetname( "bridgealliesinplace" );
    common_scripts\utility::flag_wait_or_timeout( "no_more_drone_unloaders", 45 );
    var_1 = maps\_vehicle::create_vehicle_from_spawngroup_and_gopath( 72 );
    var_1 thread maps\jeepride_aud::play_last_hind_flyby();
    wait 9.8;
    maps\jeepride_code::exploder_loc( 14001 );
}

bridge_combat()
{
    soundscripts\_snd::snd_message( "aud_bridge_combat_checkpoint" );
    common_scripts\utility::flag_set( "music_bridge" );
    level.startdelay = 250000;
    var_0 = getent( "bridge_combat_price", "targetname" );
    var_1 = getent( "bridge_combat_griggs", "targetname" );
    var_2 = getent( "bridge_combat_player", "targetname" );
    spawn_heros_for_start( var_0.origin, var_1.origin, var_1.origin + ( 0.0, 128.0, 0.0 ) );
    level.player setorigin( var_2.origin );
    maps\_vehicle::create_vehicle_from_spawngroup_and_gopath( 66 );
    thread maps\jeepride_aud::play_mi17_unload_ennemies( "auto4413", "auto4416", 1 );
    thread maps\jeepride_aud::play_mi17_unload_ennemies( "auto5018", "auto5020", 2 );
    maps\jeepride_code::exploder_loc( 3, 1 );
    maps\jeepride_code::exploder_loc( 71, 1 );
    maps\jeepride_code::exploder_loc( 72, 1 );
    maps\jeepride_code::exploder_loc( 73 );
    common_scripts\utility::array_thread( getentarray( "bridge_triggers", "script_noteworthy" ), common_scripts\utility::trigger_on );
    common_scripts\utility::flag_set( "end_ride" );
    common_scripts\utility::flag_set( "bridge_sequence" );
    common_scripts\utility::flag_set( "bridge_section_start" );
    level.player allowstand( 1 );
    level.player allowprone( 1 );
    level.player allowsprint( 1 );
    wait 1;
    setup_bridge_defense();
    wait 0.1;
}

spawn_heros_for_start( var_0, var_1, var_2 )
{
    var_3 = getent( "price", "script_noteworthy" );
    var_3.origin = var_0;
    var_4 = var_3 stalingradspawn();
    maps\_utility::spawn_failed( var_4 );
    var_3 = getent( "griggs", "script_noteworthy" );
    var_3.origin = var_1;
    var_4 = var_3 stalingradspawn();
    maps\_utility::spawn_failed( var_4 );
    var_3 = getent( "gaz", "script_noteworthy" );
    var_3.origin = var_2;
    var_4 = var_3 stalingradspawn();
    maps\_utility::spawn_failed( var_4 );
}

bridge_zak()
{
    soundscripts\_snd::snd_message( "aud_bridge_zak_checkpoint" );
    level.startdelay = 250000;
    var_0 = getent( "zak_price_spot", "targetname" );
    var_1 = getent( "zak_griggs_spot", "targetname" );
    var_2 = getent( "zak_player_spot", "targetname" );
    level.player setorigin( var_2.origin );
    spawn_heros_for_start( var_0.origin, var_1.origin, var_2.origin );
    common_scripts\utility::flag_set( "end_ride" );
    common_scripts\utility::flag_set( "bridge_sequence" );
    common_scripts\utility::flag_set( "van_smash" );
    common_scripts\utility::flag_set( "music_bridge" );
    common_scripts\utility::flag_set( "music_zak" );
    maps\jeepride_code::exploder_loc( 73, 1 );
    wait 4.5;
    var_3 = getaiarray();

    for ( var_4 = 0; var_4 < var_3.size; var_4++ )
    {
        if ( var_3[var_4] maps\jeepride_code::ishero() )
            continue;

        if ( isdefined( var_3[var_4].magic_bullet_shield ) && var_3[var_4].magic_bullet_shield )
            var_3[var_4] maps\_utility::stop_magic_bullet_shield();

        var_3[var_4] delete();
    }

    level.hind = maps\_vehicle::create_vehicle_from_spawngroup_and_gopath( 70 )[0];
    bridge_zakhaev();
}

hindset()
{
    self waittill( "trigger", var_0 );
    level.hind = var_0;
}

spawn_vehiclegroup_and_go_to_end_node_quick_and_then_blow_up_boy_this_function_name_is_sure_going_to_make_mackey_smile( var_0 )
{
    var_1 = maps\_vehicle::create_vehicle_from_spawngroup_and_gopath( var_0 );

    for ( var_2 = 0; var_2 < var_1.size; var_2++ )
    {
        var_1[var_2] vehicle_setspeed( 200, 200 );
        var_1[var_2] thread blow_up_at_end_node();
    }
}

disable_bridge_triggers_for_zak_start()
{
    var_0 = getentarray( "bridge_triggers", "script_noteworthy" );

    for ( var_1 = 0; var_1 < var_0.size; var_1++ )
        var_0[var_1] common_scripts\utility::trigger_off();
}

blow_up_at_end_node()
{
    self waittill( "reached_end_node" );
    self.godmode = 0;

    if ( common_scripts\utility::isdestructible() )
        common_scripts\_destructible::force_explosion();
    else
        self notify( "death" );
}

switch_team_fordamage()
{
    if ( self.vehicletype == "hind" || self.vehicletype == "bmp" )
        return;

    self.script_team = "allies";

    for (;;)
    {
        self waittill( "damage", var_0, var_1, var_2, var_3, var_4, var_5, var_6 );

        if ( isdefined( var_1.classname ) && var_1.classname == "misc_turret" )
            break;

        if ( isdefined( var_1.vehicletype ) && ( var_1.vehicletype == "hind" || var_1.vehicletype == "bmp" ) )
            break;
    }

    maps\_vehicle::godoff();

    if ( common_scripts\utility::isdestructible() )
        common_scripts\_destructible::force_explosion();

    self notify( "death" );
}

destructible_crumble( var_0 )
{
    var_1 = level.destructible_type[self.destuctableinfo].parts;

    for ( var_2 = 1; var_2 < var_1.size; var_2++ )
    {
        var_3 = var_1[var_2];

        for ( var_4 = 0; var_4 < var_3.size; var_4++ )
        {
            if ( !isdefined( var_1[var_2][var_4].v["tagName"] ) || !isdefined( var_1[var_2][var_4].v["modelName"] ) )
                continue;

            self notify( "damage", 300, var_0, self gettagangles( var_1[var_2][var_4].v["tagName"] ), self gettagorigin( var_1[var_2][var_4].v["tagName"] ), "bullet", var_1[var_2][var_4].v["modelName"], var_1[var_2][var_4].v["tagName"] );
            wait 0.05;
        }
    }
}

remove_non_hero_shields()
{
    var_0 = getaiarray( "allies" );

    for ( var_1 = 0; var_1 < var_0.size; var_1++ )
    {
        if ( !var_0[var_1] maps\jeepride_code::ishero() && isdefined( var_0[var_1].magic_bullet_shield ) && var_0[var_1].magic_bullet_shield )
            var_0[var_1] maps\_utility::stop_magic_bullet_shield();
    }
}

end_hind_action()
{
    self waittill( "trigger", var_0 );
    level.hind = var_0;
    var_0 setlookatent( level.player );
    var_0 setturrettargetent( level.player );
    var_0 sethoverparams( 40, 20, 15 );
    common_scripts\utility::flag_set( "end_action_hind" );
    level.lock_on_player_ent.script_attackmetype = "mg_burst";
    level.lock_on_player_ent unlink();
    level.lock_on_player_ent.origin = level.player geteye();
    level.lock_on_player_ent linkto( level.player );
    var_0 endon( "stop_killing_theplayer" );
    wait 2;
    var_0 maps\jeepride_code::shootnearest_non_hero_friend();
    var_0 maps\jeepride_code::shootnearest_non_hero_friend();
}

refresh_burst( var_0 )
{
    var_0 endon( "death" );
    self endon( "death" );

    for (;;)
    {
        var_0.script_attackmetype = "mg_burst";
        wait 2;
    }
}

random_around_player( var_0 )
{
    var_1 = -1 * var_0 + randomfloat( 2 * var_0 );
    var_2 = -1 * var_0 + randomfloat( 2 * var_0 );
    var_3 = 0;
    return level.player.origin + ( var_1, var_2, var_3 );
}

ignoreall_for_running_away()
{
    self endon( "death" );
    self.ignoresuppression = 1;
    self.ignoreall = 1;
    wait 3;
    self.ignoresuppression = 0;
    self.ignoreall = 0;
}

objectives()
{
    common_scripts\utility::flag_init( "objective_off_the_bridge" );
    common_scripts\utility::flag_init( "objective_finishedthelevel" );
    objective_add( 1, "active", &"JEEPRIDE_SURVIVE_THE_ESCAPE" );
    objective_current( 1 );
    common_scripts\utility::flag_wait( "objective_finishedthelevel" );
    objective_state( 1, "done" );
}

enemys_run_to_safety()
{
    var_0 = getaiarray( "axis" );
    var_1 = getentarray( "endenemypile", "targetname" );
    var_2 = 0;

    for ( var_3 = 0; var_3 < var_0.size; var_3++ )
    {
        var_0[var_3] maps\_utility::disable_ai_color();
        var_0[var_3].goalradius = 32;
        var_0[var_3] setgoalpos( var_1[var_2].origin );
        var_0[var_3] thread ignoreall_for_running_away();
        var_2++;

        if ( var_2 == var_1.size )
            var_2 = 0;
    }
}

end_action()
{
    common_scripts\utility::flag_wait( "end_action_bmp" );
    remove_non_hero_shields();
    common_scripts\utility::flag_wait( "end_action_hind" );
    maps\_utility::activate_trigger_with_targetname( "friends_fall_back" );
    enemys_run_to_safety();
    common_scripts\utility::array_thread( maps\_vehicle::get_script_vehicles(), ::switch_team_fordamage );
    common_scripts\utility::array_thread( getentarray( "bridge_triggers", "script_noteworthy" ), common_scripts\utility::trigger_off );
    common_scripts\utility::array_thread( getaiarray( "allies" ), ::ignoreall_for_running_away );
    common_scripts\utility::array_thread( getentarray( "bridge_triggers2", "script_noteworthy" ), common_scripts\utility::trigger_on );
    thread bridge_blow_trigger();
}

end_bmp_action()
{
    level endon( "bridge_zakhaev_setup" );
    self waittill( "trigger", var_0 );
    common_scripts\utility::flag_set( "end_action_bmp" );
    var_0 thread maps\jeepride_code::vehicle_turret_think();
}

bridge_blow_trigger()
{
    wait 0.5;
    thread bridge_zakhaev();
    wait 4.5;
    setomnvar( "ui_jeepride_firefight_recover", 1 );
}

trigger_set_cover_from_heli()
{
    level endon( "cover_from_heli" );

    if ( !level.player istouching( self ) )
        self waittill( "trigger" );

    common_scripts\utility::flag_set( "cover_from_heli" );
}

attack_origin_with_targetname( var_0 )
{
    var_1 = getent( var_0, "targetname" ).origin;
    badplace_cylinder( "tanktarget", 4, var_1, 750, 300, "allies", "axis" );
    self setturrettargetvec( var_1 );
    self waittill( "turret_on_target" );
    maps\jeepride_code::vehicle_fire_main_cannon( 24 );
}

#using_animtree("generic_human");

force_position( var_0, var_1 )
{
    if ( !isdefined( var_1 ) )
        var_1 = ( 0.0, 0.0, 0.0 );

    self dontinterpolate();
    self animscripted( "forcemove", var_0, ( 0.0, 88.0, 0.0 ), %dying_crawl );
}

dying_crawl()
{
    self endon( "death" );
    self.holdingweapon = 0;
    animscripts\shared::placeweaponon( self.weapon, "none" );

    for (;;)
    {
        self animscripted( "dieingcrawl", self.origin, ( 0.0, 88.0, 0.0 ), %dying_crawl );
        self waittillmatch( "dieingcrawl", "end" );
    }
}

angletoplayer()
{
    return vectortoangles( level.player.origin - self.origin );
}

escape_shellshock_heartbeat()
{
    level endon( "stop_heartbeat_sound" );
    var_0 = -0.5;

    for (;;)
    {
        level.player maps\_utility::play_sound_on_entity( "breathing_heartbeat" );

        if ( var_0 > 0 )
            wait(var_0);

        var_0 += 0.1;
    }
}

escape_shellshock_thing( var_0 )
{
    maps\jeepride_code::exploder_loc( 14000 );
    level.player maps\_utility::delaythread( 1.5, maps\_utility::play_sound_on_entity, "breathing_hurt_start" );
    level.player maps\_utility::delaythread( 2.5, maps\_utility::play_sound_on_entity, "breathing_hurt" );
    level.player maps\_utility::delaythread( 4, maps\_utility::play_sound_on_entity, "breathing_hurt" );
    level.player maps\_utility::delaythread( 5, maps\_utility::play_sound_on_entity, "breathing_hurt" );
    level.player maps\_utility::delaythread( 13, maps\_utility::play_sound_on_entity, "breathing_better" );
    level.player maps\_utility::delaythread( 16, maps\_utility::play_sound_on_entity, "breathing_better" );
    thread overlaysmoke();
    var_1 = maps\jeepride_code::create_overlay_element( "black", 0 );
    var_1 thread maps\jeepride_code::exp_fade_overlay( 1, 0.55 );
    earthquake( 0.65, 1, level.player.origin, 1000 );
    level.player playrumbleonentity( "tank_rumble" );
    level thread maps\_utility::notify_delay( "stop_heartbeat_sound", 18 );
    level.player freezecontrols( 1 );
    level.player disableweapons();
    waittillframeend;
    wait 1;
    level.player playerlinktodelta( var_0, "tag_player", 1, 5, 5, 5, 5, 1 );
    level.player freezecontrols( 0 );
    delete_all_non_heros();
    maps\jeepride_code::remove_all_weapons();
    clearallcorpses();
    maps\jeepride_code::remove_all_weapons();
    wait 1;
    var_2 = 0.5;
    wait 1;
    wait 0.5;
    maps\jeepride_code::remove_all_weapons();
    level.player takeallweapons();
    var_1 thread maps\jeepride_code::exp_fade_overlay( 0, 3 );
    maps\_utility::delaythread( 3.1, ::_destroy, var_1 );
    soundscripts\_snd::snd_message( "aud_start_slowmo_mix" );
}

_destroy( var_0 )
{
    var_0 destroy();
}

delete_all_non_heros()
{
    var_0 = getaiarray();

    for ( var_1 = 0; var_1 < var_0.size; var_1++ )
    {
        if ( var_0[var_1] maps\jeepride_code::ishero() )
            continue;

        if ( isdefined( var_0[var_1].magic_bullet_shield ) )
            var_0[var_1] maps\_utility::stop_magic_bullet_shield();

        var_0[var_1] delete();
    }
}

set_player_eye_target()
{
    var_0 = spawn( "script_origin", level.player geteye() );
    var_0 thread maintain_player_eye_target();
    return var_0;
}

maintain_player_eye_target()
{
    for (;;)
    {
        self.origin = level.player geteye();
        wait 0.05;
    }
}

stop_anim_scripted_on_death()
{
    self waittill( "death" );
    self stopanimscripted();
}

killguy( var_0 )
{
    var_0 kill();
}

hold_fordeath( var_0 )
{
    self.origin = var_0.origin;
    self.angles = var_0.angles;
    maps\_anim::anim_first_frame_solo( var_0, "pain_pose" );
}

end_scene_actor_unlink_on_death()
{
    self waittill( "death" );
    self unlink();
}

zakhaev_buddy2_execute_guy( var_0 )
{
    self waittillmatch( "single anim", "fire" );
    wait 0.05;

    if ( !isalive( var_0 ) )
        return;

    magicbullet( self.weapon, self gettagorigin( "tag_flash" ), var_0 geteye() );
}

bridge_zakhaev()
{
    if ( !isalive( level.price ) || !isalive( level.griggs ) || !isalive( level.gaz ) || !isalive( level.player ) )
        return;

    setsaveddvar( "compass", "0" );
    common_scripts\utility::flag_set( "bridge_zakhaev_setup" );
    var_0 = getent( "zak_price_spot", "targetname" );
    var_1 = getent( "zak_gaz_spot", "targetname" );
    var_2 = getent( "zak_griggs_spot", "targetname" );
    var_3 = getent( "zak_price_spot_hide", "targetname" );
    maps\jeepride_code::kill_unload_que();
    maps\_utility::delaythread( 1, maps\_utility::arcademode_stop_timer );
    maps\_utility::activate_trigger_with_targetname( "clear_fastropers" );
    level.price maps\_utility::disable_ai_color();
    level.gaz maps\_utility::disable_ai_color();
    level.griggs maps\_utility::disable_ai_color();
    level.price.goalradius = 32;
    level.gaz.goalradius = 32;
    level.griggs.goalradius = 32;
    level.price setgoalpos( var_3.origin );
    level.gaz setgoalpos( var_1.origin );
    level.griggs setgoalpos( var_2.origin );

    if ( !isdefined( level.price.magic_bullet_shield ) )
        level.price thread maps\_utility::magic_bullet_shield();

    if ( !isdefined( level.griggs.magic_bullet_shield ) )
        level.griggs thread maps\_utility::magic_bullet_shield();

    if ( !isdefined( level.gaz.magic_bullet_shield ) )
        level.gaz thread maps\_utility::magic_bullet_shield();

    level.player allowcrouch( 0 );
    level.player allowprone( 0 );
    level.player allowjump( 0 );
    var_4 = maps\_utility::spawn_anim_model( "playerview" );
    var_5 = getent( "player_drag_node", "targetname" );
    var_5 maps\_anim::anim_first_frame_solo( var_4, "drag_player" );
    setsaveddvar( "nightVisionDisableEffects", 1 );
    common_scripts\utility::array_thread( maps\_utility::getfxarraybyid( "hawks" ), common_scripts\utility::pauseeffect );
    thread music_zak_timing();
    hind_shoots_the_tanker( var_4.origin );
    setsaveddvar( "hud_showstance", 0 );
    common_scripts\utility::array_thread( maps\_utility::getfxarraybyid( "cloud_bank_far" ), common_scripts\utility::pauseeffect );
    waittillframeend;
    escape_shellshock_thing( var_4 );
    thread maps\_utility::autosave_now();
    maps\jeepride_code::exploder_loc( 142 );
    maps\jeepride_code::exploder_loc( 143 );
    thread bx_warmup_vfx_end();

    if ( level.start_point != "bridge_zak" )
        level.hind notify( "gunner_new_target" );

    common_scripts\utility::array_thread( maps\_vehicle::get_script_vehicles(), ::stop_thinking );
    thread h1_jeepride_bridgeending_dof_seq();
    thread h1_jeepride_bridgeending_rumbles();
    thread h1_finalsequence_fade_seq();
    setsaveddvar( "sM_sunSampleSizeNear", 0.16 );
    setsaveddvar( "sm_sunShadowScale", 1 );
    level.gaz maps\_utility::stop_magic_bullet_shield();
    var_6 = level.gaz maps\_vehicle_aianim::convert_guy_to_drone( level.gaz );
    var_6.origin = var_1.origin;
    var_6 fakeout_donotetracks_animscripts();
    maps\_vehicle_aianim::detach_models_with_substr( var_6, "weapon_" );
    level.griggs maps\_utility::stop_magic_bullet_shield();
    var_7 = level.griggs maps\_vehicle_aianim::convert_guy_to_drone( level.griggs );
    var_7.animname = "griggs";
    var_7 maps\_anim::setanimtree();
    level.price maps\_utility::stop_magic_bullet_shield();
    thread maps\jeepride_code::bloodtrail_spawn();
    thread maps\jeepride_code::set_final_visionset();
    var_8 = spawn( "script_model", level.price.origin );
    var_8.origin = level.price.origin;
    // var_8 setmodel( level.price.model );

    // if ( isdefined( level.price.headmodel ) )
    //     var_8 attach( level.price.headmodel, "", 1 );
    var_8 character\gfl\character_gfl_m4a1::main();

    level.price delete();
    level.pricedummy = var_8;
    var_8.animname = "price";
    var_8 maps\_anim::setanimtree();
    maps\_vehicle_aianim::detach_models_with_substr( var_8, "weapon_" );
    var_8 attach( "weapon_colt1911_black", "tag_weapon_right" );
    var_9 = getent( "end_friend_2", "targetname" ) stalingradspawn();
    maps\_utility::spawn_failed( var_9 );
    var_9.animname = "end_friend_2";
    var_9.anim_node = getent( var_9.target, "targetname" );
    var_9.dropweapon = 0;
    var_10 = getent( "end_friend_3", "targetname" ) stalingradspawn();
    maps\_utility::spawn_failed( var_10 );
    var_10.dropweapon = 0;
    var_10.animname = "end_friend_3";
    var_10.anim_node = getent( var_10.target, "targetname" );
    var_11[0] = var_8;
    var_12[0] = var_7;
    var_12[1] = var_4;
    maps\jeepride_code::remove_all_weapons();
    maps\_utility::delaythread( 2, maps\_utility::lerp_fov_overtime, 5, 55 );
    thread bridge_zak_friendly_attack_heli();
    waittillframeend;
    var_5 thread maps\_anim::anim_single( var_12, "drag_player" );
    var_7 thread maps\jeepride_code::spawn_griggs_pistol();
    thread maps\jeepride_code::light_sequence_00();
    thread maps\jeepride_code::light_sequence_01();
    var_13 = var_6;
    var_13.animname = "end_friend_1";
    var_5 maps\_anim::anim_first_frame_solo( var_13, "end_scene_01" );
    var_9 thread maps\jeepride_code::blead_on_death();
    var_9.deathanim = %dying_crawl_death_v1;
    var_9.anim_node thread maps\_utility::function_stack( maps\_anim::anim_loop_solo, var_9, "pain_loop" );
    var_10 thread maps\jeepride_code::blead_on_death();
    var_10.deathanim = %dying_back_death_v2;
    var_10.anim_node thread maps\_utility::function_stack( maps\_anim::anim_single_solo, var_10, "intopain" );
    var_10.anim_node thread maps\_utility::function_stack( maps\_anim::anim_loop_solo, var_10, "pain_loop" );
    var_9 hide();
    var_10 hide();
    maps\_utility::delaythread( 0.25, maps\_anim::anim_set_rate_single, var_9, "intopain", 20 );
    maps\_utility::delaythread( 0.25, maps\_anim::anim_set_rate_single, var_10, "intopain", 20 );
    var_0 thread maps\_anim::anim_single( var_11, "drag_player" );

    if ( getdvar( "chaplincheat" ) == "1" )
        thread bridge_zak_slomo_script_timed_chaplincheat();
    else
        thread bridge_zak_slomo_script_timed();

    level.player thread end_slowmo_on_death();
    var_9 maps\_utility::delaythread( 1.3, ::_show );
    var_10 maps\_utility::delaythread( 1.3, ::_show );
    common_scripts\_exploder::exploder( "2001" );
    var_4 waittillmatch( "single anim", "start_price" );
    var_0 thread maps\_anim::anim_single( var_11, "jeepride_ending_price01" );
    var_4 waittillmatch( "single anim", "start_approach" );
    level notify( "stop_drag_shots" );
    level.hind thread maps\jeepride_aud::play_zak_enemy_heli_sfx();
    var_14 = getent( "zakhaev", "targetname" ) stalingradspawn();
    maps\_utility::spawn_failed( var_14 );
    var_14.animname = "zakhaev";
    var_14.dropweapon = 0;
    var_14.noragdoll = 1;
    var_14.nodrop = 1;
    var_14.tracksuit_ignore = 1;
    var_15 = getent( "zakhaev_buddy1", "targetname" ) stalingradspawn();
    maps\_utility::spawn_failed( var_15 );
    var_15.animname = "zakhaev_buddy1";
    var_15.tracksuit_ignore = 1;
    var_15.noragdoll = 1;
    var_15.nodrop = 1;
    var_16 = getent( "zakhaev_buddy2", "targetname" ) stalingradspawn();
    maps\_utility::spawn_failed( var_16 );
    var_16.animname = "zakhaev_buddy2";
    var_16.tracksuit_ignore = 1;
    var_16.noragdoll = 1;
    var_16.nodrop = 1;
    var_16 thread zakhaev_buddy2_execute_guy( var_10 );
    var_17 = set_player_eye_target();
    var_18 = [];
    var_18[0] = var_14;
    var_18[1] = var_15;
    var_18[2] = var_16;
    thread bridge_zak_guys_dead( var_18 );
    var_14 thread maps\jeepride_code::blead_on_death( 5 );
    var_15 thread maps\jeepride_code::blead_on_death();
    var_16 thread maps\jeepride_code::blead_on_death();
    level.nextgrenadedrop = 800;

    for ( var_19 = 0; var_19 < var_18.size; var_19++ )
    {
        var_20 = spawn( "script_origin", var_18[var_19].origin );
        var_18[var_19] maps\_utility::disable_ai_color();
        var_18[var_19] setgoalpos( var_18[var_19].origin );
        var_18[var_19].goalradius = 32;
        var_18[var_19] linkto( var_20 );
        var_18[var_19] thread end_scene_actor_unlink_on_death();

        if ( getdvar( "jeepride_multi_shot" ) == "off" )
            var_18[var_19].health = 1;
        else
            var_18[var_19] thread stop_animscripted_on_damage();

        var_18[var_19].allowdeath = 1;
        var_18[var_19].grenadeammo = 0;
    }

    var_18[3] = var_13;
    level.attack_helidummy notsolid();
    var_9.allowdeath = 1;
    var_10.allowdeath = 1;
    var_9.health = 1;
    var_10.health = 1;
    var_5 thread maps\_anim::anim_single_solo( level.attack_helidummy, "end_scene_01" );
    var_5 thread maps\_anim::anim_single( var_18, "end_scene_01" );
    maps\_utility::delaythread( 8.15, maps\jeepride_code::shot_in_the_head_point_blank, var_13, ( 3.0, -4.0, 6.0 ), ( 105.0, -80.0, 0.0 ) );
    maps\_utility::delaythread( 13.1, maps\jeepride_code::shot_in_the_head_point_blank, var_9, ( -5.0, 2.0, 2.0 ), ( 42.0, -8.0, 0.0 ) );
    maps\_utility::delaythread( 8.65, maps\jeepride_code::shot_in_the_head_point_blank, var_10, ( -2.0, 3.0, 4.0 ), ( 100.0, 42.0, 0.0 ) );
    maps\_utility::delaythread( 0.72, common_scripts\utility::flag_set, "attack_heli" );
    var_4 waittillmatch( "single anim", "start_price" );
    thread maps\_utility::autosave_now();
    setomnvar( "ui_jeepride_firefight_recover", 0 );
    var_0 thread maps\_anim::anim_single( var_11, "jeepride_ending_price02" );
    var_4 waittillmatch( "single anim", "start_end_badguys" );
    var_18 = common_scripts\utility::array_remove( var_18, var_13 );
    level.player_takes_shots = 0;
    anim.fire_notetrack_functions["scripted"] = ::shot_counter;
    anim.shootenemywrapper_func = ::shot_counter;
    var_5 thread maps\_anim::anim_single( var_18, "end_scene_02" );
    var_4 waittillmatch( "single anim", "start_end" );
    level.player playerlinktodelta( var_4, "tag_player", 1, 45, 45, 45, 7 );
    level.player disableinvulnerability();
    level.player giveweapon( "colt45_zak_killer" );
    level.player givemaxammo( "colt45_zak_killer" );
    level.player switchtoweapon( "colt45_zak_killer" );
    level.player enableweapons();
    level.player allowmelee( 0 );
    level.player setviewmodel( "h2_gfl_m4_sopmod_ii_viewhands" );
    setsaveddvar( "hud_drawhud", "1" );
    var_8 detach( "weapon_colt1911_black", "tag_weapon_right" );
    level.attack_helidummy hide();
    var_4 waittillmatch( "single anim", "end" );
    common_scripts\utility::flag_wait( "all_end_scene_guys_dead" );
    bridge_rescue( var_4 );
}

h1_jeepride_bridgeending_dof_seq()
{
    level.player setphysicaldepthoffield( 1.0, 50, 9.0, 9.0 );
    level.player enablephysicaldepthoffieldscripting();
    setsaveddvar( "r_mbEnable", 2 );
    wait 0.5;
    level.player setphysicaldepthoffield( 2.5, 16, 1.0, 1.0 );
    wait 2.0;
    level.player setphysicaldepthoffield( 3.0, 40, 2.5, 2.5 );
    wait 1.0;
    wait 4.5;
    level.player setphysicaldepthoffield( 3.5, 60, 1.0, 1.0 );
    wait 5.5;
    level.player setphysicaldepthoffield( 3.8, 58, 2.0, 2.0 );
    wait 1.5;
    level.player setphysicaldepthoffield( 1.5, 175, 1.5, 1.5 );
    wait 0.75;
    thread maps\_utility::lerp_fov_overtime( 1.25, 50 );
    wait 4.0;
    thread maps\_utility::lerp_fov_overtime( 2.4, 55 );
    common_scripts\utility::flag_wait( "attack_heli" );
    level.player setphysicaldepthoffield( 1.5, 480, 1.0, 1.0 );
    wait 2.75;
    level.player setphysicaldepthoffield( 1.8, 370, 0.5, 0.5 );
    wait 4.5;
    level.player setphysicaldepthoffield( 1.5, 360, 4.5, 4.5 );
    wait 1.0;
    level.player setphysicaldepthoffield( 1.8, 370, 4.5, 4.5 );
    wait 1.0;
    level.player setphysicaldepthoffield( 1.2, 210, 0.7, 0.7 );
    wait 3.5;
    level.player setphysicaldepthoffield( 2.0, 1500, 2.0, 2.0 );
    wait 3.5;
    level.player setphysicaldepthoffield( 2.0, 1600, 2.0, 2.0 );
    wait 1.0;
    thread maps\_utility::lerp_fov_overtime( 1.35, 47 );
    wait 0.5;
    level.player setphysicaldepthoffield( 1.5, 180, 4.0, 4.0 );
    wait 2.65;
    level.player setphysicaldepthoffield( 4.0, 23, 0.7, 0.7 );
    thread maps\_utility::lerp_fov_overtime( 2.0, 55 );
    wait 1.0;
    level.player setphysicaldepthoffield( 12.5, 205, 2.0, 2.0 );
    wait 1.5;
    setsaveddvar( "r_mbEnable", 0 );
    common_scripts\utility::flag_wait( "all_end_scene_guys_dead" );
    level.player setphysicaldepthoffield( 4.5, 500, 0.3, 0.3 );
    setsaveddvar( "r_mbEnable", 2 );
    wait 17.0;
    level.player setphysicaldepthoffield( 4.0, 250, 0.8, 0.8 );
    common_scripts\utility::flag_wait( "kamarov_runs" );
    h1_endingrescuehidenames();
    wait 0.5;
    level.player setphysicaldepthoffield( 3.5, 24, 0.2, 0.2 );
    wait 4.0;
    level.player setphysicaldepthoffield( 4.5, 13, 1.0, 1.0 );
    wait 3.5;
    level.player setphysicaldepthoffield( 4.5, 50, 2.5, 2.5 );
    wait 2.5;
    level.player setphysicaldepthoffield( 4.5, 60, 2.0, 2.0 );
    wait 1.0;
    level.player setphysicaldepthoffield( 3.0, 600, 2.0, 2.0 );
    wait 1.5;
    level.player setphysicaldepthoffield( 4.5, 40, 2.0, 2.0 );
    wait 2.0;
    thread maps\_utility::lerp_fov_overtime( 2.0, 70 );
    wait 3.5;
    thread maps\_utility::lerp_fov_overtime( 2.5, 65 );
    wait 2.0;
    level.player setphysicaldepthoffield( 3.0, 135, 1.2, 1.2 );
    wait 10.0;
    level.player setphysicaldepthoffield( 3.5, 70, 1.0, 1.0 );
    wait 3.0;
    level.player setphysicaldepthoffield( 2.5, 300, 1.0, 1.0 );
    wait 10.0;
    level.player disablephysicaldepthoffieldscripting();
    setsaveddvar( "r_mbEnable", 0 );
}

h1_endingrescuehidenames()
{
    level.ru2 maps\_utility::delaythread( 2.5, common_scripts\utility::hide_friendname_until_flag_or_notify, "" );
    level.ru1 maps\_utility::delaythread( 9.0, common_scripts\utility::hide_friendname_until_flag_or_notify, "" );
}

h1_jeepride_bridgeending_rumbles()
{
    wait 1.0;
    thread h1_endingcutsceneshakesystem( "Touch" );
    wait 12.4;
    thread h1_endingcutsceneshakesystem( "Gunshot" );
    wait 0.85;
    thread h1_endingcutsceneshakesystem( "Touch" );
    wait 0.25;
    thread h1_endingcutsceneshakesystem( "Touch" );
    thread maps\jeepride_code::set_final_visionset_griggsdeath();
    thread maps\jeepride_code::set_final_visionset_zakaev();
    common_scripts\utility::flag_wait( "attack_heli" );
    wait 7.5;
    thread h1_endingcutsceneshakesystem( "Gunshot" );
    wait 0.5;
    thread h1_endingcutsceneshakesystem( "Gunshot" );
    wait 4.35;
    thread h1_endingcutsceneshakesystem( "Gunshot" );
    wait 0.5;
    thread h1_endingcutsceneshakesystem( "Explosion" );
    wait 0.5;
    thread h1_endingcutsceneshakesystem( "Touch" );
    wait 7.85;
    thread h1_endingcutsceneshakesystem( "Touch" );
    common_scripts\utility::flag_wait( "all_end_scene_guys_dead" );
    thread maps\jeepride_code::set_final_visionset_rescue();
    common_scripts\utility::flag_wait( "kamarov_runs" );
    wait 3.65;
    thread h1_endingcutsceneshakesystem( "Touch" );
    wait 6.15;
    thread h1_endingcutsceneshakesystem( "Touch" );
    wait 2.5;
    thread h1_endingcutsceneshakesystem( "Touch" );
    wait 16.15;
    thread h1_endingcutsceneshakesystem( "Touch" );
}

h1_endingcutsceneshakesystem( var_0 )
{
    var_1 = "";
    var_2 = 0.0;
    var_3 = 0.0;
    var_4 = "";
    var_5 = 0.07;
    var_6 = 0.11;
    var_7 = 0.2;
    var_8 = level.player getorigin();

    switch ( var_0 )
    {
        case "Heartbeat":
            var_1 = "normal";
            var_2 = var_5;
            var_3 = 0.3;
            var_4 = "damage_light";
            break;
        case "Touch":
            var_1 = "normal";
            var_2 = var_6;
            var_3 = 0.4;
            var_4 = "damage_light";
            break;
        case "Explosion":
            var_1 = "fade";
            var_2 = var_7;
            var_3 = 1.0;
            var_4 = "tank_rumble";
            break;
        case "Gunshot":
            var_1 = "normal";
            var_2 = var_6;
            var_3 = 0.5;
            var_4 = "damage_light";
            break;
    }

    if ( var_1 == "normal" )
    {
        if ( var_4 != "" )
            level.player playrumbleonentity( var_4 );

        earthquake( var_2, var_3, var_8, 100 );
        wait(var_3);

        if ( var_4 == "tank_rumble" )
            level.player stoprumble( "tank_rumble" );
    }
    else if ( var_1 == "fade" )
    {
        if ( var_4 != "" )
            level.player playrumbleonentity( var_4 );

        earthquake( var_2 * 0.6, var_3 / 4.0, var_8, 10000 );
        wait(var_3 / 4.0);
        earthquake( var_2 * 1.0, var_3 / 4.0, var_8, 10000 );
        wait(var_3 / 4.0);

        if ( var_4 == "tank_rumble" )
            level.player stoprumble( "tank_rumble" );

        earthquake( var_2 * 0.5, var_3 / 4.0, var_8, 10000 );
        wait(var_3 / 4.0);
        earthquake( var_2 * 0.2, var_3 / 4.0, var_8, 10000 );
        wait(var_3 / 4.0);
    }
}

stop_animscripted_on_damage()
{
    self waittill( "damage" );
    self stopanimscripted();
}

_show()
{
    self show();
}

player_janxed_end_shot( var_0 )
{
    level endon( "all_end_scene_guys_dead" );

    for (;;)
    {
        while ( !level.player isfiring() )
            wait 0.05;

        var_1 = undefined;

        for ( var_2 = 0; var_2 < var_0.size; var_2++ )
        {
            if ( janxed_end_shot( var_0[var_2] ) )
                var_1 = var_0[var_2];
        }

        if ( isdefined( var_1 ) )
        {
            var_1 kill( var_1 geteye(), level.player );
            var_0 = common_scripts\utility::array_remove( var_0, var_1 );
        }

        if ( !var_0.size )
            break;

        while ( level.player isfiring() )
            wait 0.05;
    }
}

janxed_end_shot( var_0 )
{
    return common_scripts\utility::within_fov( level.player geteye(), level.player getplayerangles(), var_0 geteye(), cos( 5 ) );
}

arrival_disable()
{
    self.disablearrivals = 1;
    self.disableexits = 1;
}

offset_ent()
{
    self.origin += level.rescue_scene_offset;
}

h1_rescue_viewclamplerp()
{
    level.player lerpviewangleclamp( 7, 0, 0, 33, 33, 33, 3 );
    wait 6.5;
    level.player lerpviewangleclamp( 7, 0, 0, 19, 19, 19, 3 );
    wait 6.5;
    level.player lerpviewangleclamp( 7, 0, 0, 5, 5, 5, 5 );
}

bridge_rescue( var_0 )
{
    setsaveddvar( "hud_drawhud", "1" );
    setsaveddvar( "hud_showstance", "0" );
    thread h1_rescue_viewclamplerp();
    maps\_utility::delaythread( 1, maps\_utility::lerp_fov_overtime, 8, 65 );
    level.player disableweapons();
    common_scripts\utility::flag_set( "music_rescue" );
    var_1 = getent( "rescue_price_spot", "targetname" );
    var_1 thread maps\_anim::anim_first_frame_solo( level.pricedummy, "jeepride_CPR_price" );
    maps\_utility::delaythread( 3, common_scripts\utility::flag_set, "slomo_done" );
    maps\jeepride_code::light_sequence_02();
    var_2 = getent( "player_drag_node", "targetname" );
    var_2 thread maps\_anim::anim_single_solo( var_0, "drag_player_wait" );
    var_3 = getent( "rescuenode", "script_noteworthy" );
    var_3 waittill( "trigger", var_4 );
    soundscripts\_snd::snd_message( "start_rescue_mix" );
    thread bx_vfx_wind_kill();
    var_4 waittill( "unloaded" );
    var_4 sethoverparams( 50, 15, 15 );
    var_5 = maps\jeepride_code::create_overlay_element( "black", 0 );
    level.ru1 maps\_utility::stop_magic_bullet_shield();
    level.ru2 maps\_utility::stop_magic_bullet_shield();
    var_6 = level.ru1;
    var_7 = level.ru2;
    level.ru1 thread maps\_utility::play_sound_on_tag( "jeepride_ru1_barelybreathing" );
    var_8 = [];
    var_8[0] = var_6;
    var_8[1] = var_7;
    common_scripts\utility::array_thread( var_8, ::arrival_disable );
    thread movenlinkh1( var_2, var_0 );
    var_2 thread maps\_anim::anim_reach_solo( var_6, "player_pickup" );
    common_scripts\utility::array_thread( getentarray( "rescue_scene_patrol_01", "targetname" ), maps\jeepride_code::rescue_scene_patrol_01 );
    common_scripts\utility::flag_set( "kamarov_runs" );
    var_4 sethoverparams( 0, 0, 0 );
    var_4 maps\_utility::delaythread( 6, maps\_vehicle::vehicle_paths, getent( "chopper_rescuer", "targetname" ) );
    var_5 thread maps\jeepride_code::exp_fade_overlay( 0, 1 );
    var_8 = [];
    var_8[0] = var_6;
    var_8[1] = var_7;
    var_8[2] = var_0;
    thread dof_focuser_tag( var_7, 30 );
    var_2 thread maps\_anim::anim_single( var_8, "player_pickup" );
    wait 9.7;
    var_6 setgoalpos( var_6.origin );
    var_7 setgoalpos( var_7.origin );
    var_9 = level.medic;
    var_1 thread maps\_anim::anim_first_frame_solo( var_9, "jeepride_CPR_medic" );
    thread dof_focuser_tag( var_9, 30 );
    maps\_utility::delaythread( 3, common_scripts\utility::flag_set, "rescue_chopper_adjust" );
    wait 4;
    var_1 maps\_utility::delaythread( 3.5, maps\_anim::anim_single_solo, var_9, "jeepride_CPR_medic" );
    var_1 maps\_utility::delaythread( 3.5, maps\_anim::anim_single_solo, level.pricedummy, "jeepride_CPR_price" );
    maps\_utility::delaythread( 20, ::dof_focuser_tag, var_4, 100, "tag_ground", 7 );
    maps\_utility::delaythread( 13, ::beam_me_up_to_the_chopper, var_0 );
    maps\_utility::delaythread( 15, ::earthquaker_small );
    maps\_utility::delaythread( 5, ::dialog_bbc );
    common_scripts\utility::array_thread( maps\_vehicle::get_script_vehicles(), maps\_vehicle::volume_down, 20 );
    overlay_cpr( var_5 );
    common_scripts\utility::flag_set( "cpr_finished" );
    wait 19;
    maps\_utility::nextmission();
}

dialog_bbc()
{
    wait 13;
    level.player maps\_utility::play_sound_on_entity( "jeepride_bbc_missiletest" );
    wait 0.5;
    level.player maps\_utility::play_sound_on_entity( "jeepride_bbc_unprotocols" );
    wait 0.5;
    level.player maps\_utility::play_sound_on_entity( "jeepride_bbc_rumors" );
    wait 1;
    level.player maps\_utility::play_sound_on_entity( "jeepride_bbc_calledoff" );
}

set_rescue_guy_pos()
{
    level.medic thread rescue_guy_pos( getent( "end_stander_medic", "targetname" ) );
    level.ru1 thread rescue_guy_pos( getent( "end_stander_ru1", "targetname" ) );
    level.ru2 thread rescue_guy_pos( getent( "end_stander_ru2", "targetname" ) );
}

rescue_guy_pos( var_0 )
{
    var_1 = spawn( "script_model", var_0.origin );
    var_1 setmodel( "tag_origin" );
    var_1.origin = var_0.origin;
    var_1.angles = var_0.angles;
    self linkto( var_1, "tag_origin", ( 0.0, 0.0, 0.0 ), ( 0.0, 0.0, 0.0 ) );
    self allowedstances( "stand" );
    self animscripted( "animscripted", var_1.origin, var_1.angles, %crouch2stand );
    animscripts\shared::donotetracks( "animscripted" );
}

stand_up()
{
    self allowedstances( "stand" );
    self animscripted( "animscripted", self.origin, self.angles, %crouch2stand );
    animscripts\shared::donotetracks( "animscripted" );
}

movenlink( var_0, var_1 )
{
    lerp_player_view_to_position_oldstyle_loc( var_1 gettagorigin( "tag_player" ), var_1 gettagangles( "tag_camera" ), 0.9, 1, 0, 0, 0, 0 );
    level.player playerlinktodelta( var_1, "tag_player", 1, 5, 5, 5, 5 );
}

movenlinkh1( var_0, var_1 )
{

}

lerp_player_view_to_position_oldstyle_loc( var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7, var_8 )
{
    var_9 = spawn( "script_origin", ( 0.0, 0.0, 0.0 ) );
    var_9.origin = level.player maps\_utility::get_player_feet_from_view();
    var_9.angles = level.player getplayerangles();

    if ( isdefined( var_8 ) )
        level.player playerlinktodelta( var_9, "", var_3, var_4, var_5, var_6, var_7, var_8 );
    else if ( isdefined( var_4 ) )
        level.player playerlinktodelta( var_9, "", var_3, var_4, var_5, var_6, var_7 );
    else if ( isdefined( var_3 ) )
        level.player playerlinktodelta( var_9, "", var_3 );
    else
        level.player playerlinktodelta( var_9 );

    var_9 moveto( var_0, var_2, var_2 * 0.25, var_2 * 0.25 );
    var_9 rotateto( var_1, var_2, var_2 * 0.25, var_2 * 0.25 );
    wait(var_2 - 0.05);
}

overlay_cpr( var_0 )
{
    wait 22.3;
    var_1 = var_0;
    var_1 setshader( "white", 640, 480 );
    var_1 maps\_utility::delaythread( 7.55, maps\jeepride_code::exp_fade_overlay, 1, 2 );
    maps\_utility::delaythread( 3.25, ::_setblur, 2.4, 6 );
    soundscripts\_snd::snd_message( "start_last_whitescreen_mix" );
    maps\_utility::set_vision_set( "jeepride_flyaway", 8 );
    wait 8;
}

h1_bridgewakeup_fade_seq()
{
    maps\_utility::delaythread( 1.0, ::h1_blinkblursystem, 1.5, 0.2, "noblur" );
    maps\_utility::delaythread( 8.5, ::h1_blinkblursystem, 1.5, 0.3, "noblur" );
    maps\_utility::delaythread( 14.0, ::h1_blinkblursystem, 1.5, 0.4 );
    maps\_utility::delaythread( 18.5, ::h1_blinkblursystem, 1.5, 0.3 );
    maps\_utility::delaythread( 21.0, ::h1_blinkblursystem, 1.5, 0.2 );
}

h1_finalsequence_fade_seq()
{
    thread h1_blinkblursystem( 2.0, 0.8, "noblur" );
    maps\_utility::delaythread( 3.5, ::h1_blinkblursystem, 2.0, 0.4 );
    maps\_utility::delaythread( 8.5, ::h1_blinkblursystem, 1.5, 0.4, "noblur" );
    maps\_utility::delaythread( 13.3, ::h1_blinkblursystem, 1.0, 0.2 );
    maps\_utility::delaythread( 15.2, ::h1_blinkblursystem, 1.8, 0.5 );
    maps\_utility::delaythread( 18.5, ::h1_blinkblursystem, 1.0, 0.2 );
    maps\_utility::delaythread( 19.8, ::h1_blinkblursystem, 1.8, 0.3 );
    common_scripts\utility::flag_wait( "all_end_scene_guys_dead" );
    maps\_utility::delaythread( 4.0, ::h1_blinkblursystem, 3.0, 0.3 );
    maps\_utility::delaythread( 8.0, ::h1_blinkblursystem, 3.0, 0.4 );
    maps\_utility::delaythread( 13.7, ::h1_blinkblursystem, 3.7, 0.3 );
    common_scripts\utility::flag_wait( "kamarov_runs" );
    maps\_utility::delaythread( 1.3, ::h1_blinkblursystem, 2.7, 0.4 );
    maps\_utility::delaythread( 7.0, ::h1_blinkblursystem, 2.0, 0.3, "noblur" );
    maps\_utility::delaythread( 15.3, ::h1_blinkblursystem, 2.6, 0.3 );
    maps\_utility::delaythread( 22.0, ::h1_blinkblursystem, 2.8, 0.4 );
    maps\_utility::delaythread( 26.2, ::h1_blinkblursystem, 2.8, 0.4 );
    maps\_utility::delaythread( 29.6, ::h1_blinkblursystem, 4.0, 0.6 );
}

h1_blinkblursystem( var_0, var_1, var_2 )
{
    var_3 = var_0 * 0.4;
    var_4 = var_0 * 0.2;
    var_5 = var_0 * 0.4;
    var_6 = var_1 * 4 + 0.5;
    thread h1_onefade( var_3, var_4, var_5, var_1 );

    if ( isdefined( var_2 ) )
        return;

    thread h1_blur_overlay( var_6, var_3 * 0.5, 0, var_5, var_4 );
    return;
}

h1_onefade( var_0, var_1, var_2, var_3 )
{
    var_4 = newhudelem();
    var_4.x = 0;
    var_4.y = 0;
    var_4 setshader( "black", 640, 480 );
    var_4.alignx = "left";
    var_4.aligny = "top";
    var_4.horzalign = "fullscreen";
    var_4.vertalign = "fullscreen";
    var_4.alpha = 0;
    var_4.sort = 1;
    var_4.foreground = 1;
    var_4 fadeovertime( var_0 );
    var_4.alpha = var_3;
    wait(var_1 + 0.15);
    var_4 fadeovertime( var_2 );
    var_4.alpha = 0;
    wait(var_2 + 0.15);
    var_4 destroy();
}

h1_blur_overlay( var_0, var_1, var_2, var_3, var_4 )
{
    setblur( var_0, var_1 );
    wait(var_1 + var_4);
    setblur( var_2, var_3 );
}

earthquaker_small()
{
    thread common_scripts\_exploder::exploder( 192 );
    var_0 = 0.12;

    for (;;)
    {
        earthquake( var_0, randomfloatrange( 0.8, 1.0 ), level.player.origin, 150 );
        wait(randomfloatrange( 0.2, 0.4 ));
    }
}

_setblur( var_0, var_1 )
{
    if ( getdvar( "jeepride_player_pickup" ) == "off" )
        setblur( var_0, var_1 );
}

dof_focuser_tag( var_0, var_1, var_2, var_3, var_4 )
{
    level notify( "new_dof_focus" );
    level endon( "new_dof_focus" );

    if ( !isdefined( var_3 ) )
        var_3 = 4;

    if ( !isdefined( var_4 ) )
        var_4 = 4;

    if ( !isdefined( var_2 ) )
        var_2 = "J_Head";

    for (;;)
    {
        var_5 = distance( level.player geteye(), var_0 gettagorigin( var_2 ) );
        var_6 = 0;
        var_7 = var_5 - var_1;

        if ( var_7 <= 0 )
            var_7 = 1;

        var_8 = var_5 + var_1;
        var_9 = var_8 + 35000;
        var_3 = 4;
        var_4 = 4;
        level.player setdepthoffield( var_6, var_7, var_8, var_9, var_3, var_4 );
        wait 0.05;
    }
}

medic_focus( var_0 )
{
    var_1 = spawn( "script_model", level.player.origin );
    var_1 setmodel( "tag_origin" );

    for (;;)
    {
        var_1.angles = level.player getplayerangles();
        var_2 = vectortoangles( vectornormalize( level.pricedummy.origin - var_1.origin ) );
        var_0 linkto( var_1 );
        var_0 rotateto( var_2, 0.05, 0, 0 );
        wait 0.05;
        var_0 unlink();
    }
}

player_takes_shots()
{
    level.player_takes_shots = 0;

    while ( level.player_takes_shots < 2 )
        level waittill( "player_takes_shot" );

    maps\jeepride_code::player_kill();
}

shot_counter( var_0 )
{
    var_1 = common_scripts\utility::within_fov( self gettagorigin( "tag_flash" ), self gettagangles( "tag_flash" ), level.player geteye(), cos( 10 ) );

    if ( !var_1 )
    {
        self shootblank();
        return;
    }

    level.player_takes_shots++;
    var_2 = 0;

    if ( level.gameskill == 0 )
    {
        if ( level.player_takes_shots > 3 )
            var_2 = 1;
    }
    else if ( level.gameskill == 1 )
    {
        if ( level.player_takes_shots > 3 )
            var_2 = 1;
    }
    else if ( level.player_takes_shots > 2 )
        var_2 = 1;

    if ( var_2 )
        level.player enablehealthshield( 0 );

    self shoot( 1, level.player geteye() );
}

bridge_zak_friendly_attack_heli()
{
    level.hind thread maps\_vehicle::vehicle_paths( getent( "hind_roll_in", "script_noteworthy" ) );
    level.hind setlookatent( level.player );
    var_0 = maps\_vehicle::create_vehicle_from_spawngroup_and_gopath( 71 );
    level.attack_heli = undefined;

    for ( var_1 = 0; var_1 < var_0.size; var_1++ )
    {
        if ( var_0[var_1].vehicletype == "mi28" )
        {
            level.attack_heli = var_0[var_1];
            break;
        }
    }

    level.attack_heli vehicle_turnengineoff();
    level.attack_helidummy = level.attack_heli maps\_vehicle::vehicle_to_dummy();
    level.attack_helidummy hide();
    level.attack_helidummy.animname = "mi28";
    level.attack_helidummy maps\_anim::setanimtree();
    level.attack_helidummy thread maps\jeepride_anim::override_roto_anim();
    common_scripts\utility::flag_wait( "attack_heli" );
    level.attack_helidummy show();
    wait 2.25;
    maps\jeepride_code::exploder_loc( 14020 );
    wait 10;
    level.attack_heli setlookatent( level.hind );
    level.hind setlookatent( level.attack_heli );
    level.hind maps\_vehicle::godoff();
    level.hind clearlookatent();
    level.attack_helidummy thread maps\jeepride_aud::play_zak_ally_heli_sfx();
    level.attack_heli fake_missile( level.hind );
    thread bx_helicopter_death_vfx();
    thread maps\jeepride_code::helicopter_show_crash_seq();
    thread common_scripts\utility::play_sound_in_space( "scn_hind_missile_boom", level.hind.origin );
    level.hind notify( "death" );
    wait 0.35;
    level.hind delete();
}

fake_missile( var_0 )
{
    var_1 = self.origin + ( 0.0, 0.0, -34.0 );
    var_2 = self.angles;
    var_3 = spawn( "script_model", var_1 );
    var_3.angles = ( 180.0, 0.0, 0.0 );
    var_3 thread maps\_utility::play_sound_on_tag( "scn_hind_missile_incomming" );
    var_3 setmodel( "projectile_sidewinder_missile" );
    playfxontag( level._effect["rocket_trail"], var_3, "TAG_FX" );
    var_4 = 7500;
    var_5 = var_0.origin + ( 0.0, 0.0, -34.0 );
    var_6 = var_1;
    var_3 notsolid();
    var_3 maps\jeepride_code::movewithrate( var_5, var_3.angles, var_4 );
    wait 0.1;
    var_3 delete();
}

bridge_zak_guys_dead( var_0 )
{
    maps\_utility::waittill_dead_or_dying( var_0 );
    level.player playsound( "scn_jeepride_last_gunshot" );
    common_scripts\utility::flag_set( "all_end_scene_guys_dead" );
}

bridge_zak_slomo_script_timed()
{
    maps\_utility::slowmo_start();
    maps\_utility::slowmo_setspeed_slow( 0.4 );
    maps\_utility::slowmo_lerp_in();
    wait 13.4;
    maps\_utility::slowmo_setspeed_slow( 0.25 );
    maps\_utility::slowmo_lerp_in();
    wait 1.2;
    maps\_utility::slowmo_setspeed_slow( 0.4 );
    maps\_utility::slowmo_lerp_in();
    wait 6.7;
    maps\_utility::slowmo_setspeed_slow( 0.8 );
    maps\_utility::slowmo_lerp_in();
    wait 11.2;
    maps\_utility::slowmo_setspeed_slow( 0.45 );
    maps\_utility::slowmo_lerp_in();
    wait 6.2;
    maps\_utility::slowmo_setspeed_slow( 0.35 );
    maps\_utility::slowmo_lerp_in();
    wait 2.1;
    maps\_utility::slowmo_setspeed_slow( 0.45 );
    maps\_utility::slowmo_lerp_in();
    common_scripts\utility::flag_wait( "all_end_scene_guys_dead" );
    common_scripts\utility::flag_set( "rescue_choppers" );
    common_scripts\utility::flag_set( "music_lastman" );
    maps\_utility::slowmo_setspeed_slow( 0.55 );
    maps\_utility::slowmo_lerp_in();
    common_scripts\utility::flag_wait( "slomo_done" );
    maps\_utility::slowmo_setlerptime_out( 8.75 );
    maps\_utility::delaythread( 3, maps\_utility::slowmo_lerp_out );
    wait 5;
    level.player disableweapons();
    common_scripts\utility::flag_set( "objective_finishedthelevel" );
    maps\_utility::set_vision_set( "jeepride", 10 );
    maps\_utility::slowmo_end();
    common_scripts\utility::flag_set( "disable_slowmo_cheat" );
}

bridge_zak_slomo_script_timed_chaplincheat()
{
    wait 13.4;
    wait 1.2;
    wait 6.7;
    wait 11.2;
    wait 6.2;
    wait 2.1;
    common_scripts\utility::flag_wait( "all_end_scene_guys_dead" );
    common_scripts\utility::flag_set( "rescue_choppers" );
    common_scripts\utility::flag_set( "music_lastman" );
    wait 5;
    level.player disableweapons();
    common_scripts\utility::flag_set( "objective_finishedthelevel" );
}

fakeout_donotetracks_animscripts()
{
    self.a = spawnstruct();
    self.a.lastshoottime = gettime();
    self.a.bulletsinclip = 500;
    self.weapon = "colt45";
    self.primaryweapon = "colt45";
    self.secondaryweapon = "colt45";
    self.a.issniper = 0;
    self.a.misstime = 0;
    self.weapon = "none";
}

shoot_loc( var_0 )
{
    if ( isdefined( var_0.scriptedweapon ) && var_0.scriptedweapon == "wpn_h1_pst_m1911_vm" )
    {
        playfxontag( level._effect["griggs_pistol"], var_0.scriptedweaponmodel, "TAG_FLASH" );
        var_0.scriptedweaponmodel thread maps\_utility::play_sound_on_tag( "weap_m1911colt45_fire_npc", "TAG_FLASH" );
        wait 0.05;
        playfxontag( level._effect["griggs_pistol_bullet"], var_0.scriptedweaponmodel, "TAG_FLASH" );
    }
    else
    {
        var_1 = var_0 gettagorigin( "TAG_FLASH" );
        bullettracer( var_1, var_1 + maps\_utility::vector_multiply( anglestoforward( var_0 gettagangles( "TAG_FLASH" ) ), 3000 ) );
        playfxontag( level._effect["griggs_saw"], var_0, "TAG_FLASH" );
        var_0 thread maps\_utility::play_sound_on_tag( "weap_m249saw_fire_npc", "TAG_FLASH" );
        wait 0.02;
        playfxontag( level._effect["griggs_saw_bullet"], var_0, "TAG_FLASH" );
    }
}

price_bridge_crawl_anims( var_0 )
{
    var_0 maps\_anim::anim_single_solo( level.price, "wave_player_over" );
    level.price animscripted( "animscripted", level.price.origin, level.price.angles, %stand2crouch_attack );
    level.price waittillmatch( "animscripted", "end" );
    level.price animscripted( "animscripted", level.price.origin, level.price.angles, %crouch2stand );
    level.price waittillmatch( "animscripted", "end" );
}

stop_thinking()
{
    self notify( "stop_thinking" );
    maps\_vehicle::mgoff();
}

hind_shoots_the_tanker( var_0 )
{
    level.hind notify( "gunner_new_target" );
    var_1 = spawn( "script_origin", ( -36282.6, -16678.1, 451.0 ) );
    var_1.script_attackmetype = "missile_bridgebuster";
    var_1.script_shotcount = 2;
    var_1.oldmissiletype = 0;
    thread earthquaker( 10 );

    if ( !maps\jeepride_code::player_in_blastradius() )
        level.player enableinvulnerability();

    level.player thread maps\_utility::play_sound_on_entity( "scn_last_hind_flyby_stinger" );
    level.hind thread maps\jeepride_code::shootenemytarget( var_1 );
    level waittill( "bridge_blower" );

    if ( maps\jeepride_code::player_in_blastradius() )
        maps\jeepride_code::player_kill();

    soundscripts\_snd::snd_message( "start_hind_shoots_the_tanker_mix" );
    musicstop( 3.5 );
    level.player freezecontrols( 0 );
    level.hind notify( "stop_killing_theplayer" );
    level.hind notify( "gunner_new_target" );
    thread rumbler();
    wait 0.25;
    thread earthquaker( 4 );
    maps\jeepride_code::exploder_loc( 13 );
}

rumbler()
{
    var_0 = 5;

    for ( var_1 = 0; var_1 < var_0; var_1++ )
    {
        level.player playrumbleonentity( "tank_rumble" );
        wait(randomfloatrange( 0.2, 0.5 ));
    }
}

earthquaker( var_0 )
{
    for ( var_1 = 0; var_1 < var_0; var_1++ )
    {
        earthquake( 0.2, randomfloatrange( 1, 1.5 ), level.player.origin, 50 );
        wait(randomfloatrange( 1, 1.5 ));
    }
}

player_trackmissile( var_0, var_1 )
{
    level endon( "bridge_blower" );
    level waittill( "missile_tracker", var_2 );
    wait 0.5;
    var_3 = spawn( "script_model", level.player.origin );
    var_3 setmodel( "tag_origin" );
    var_3.angles = level.player getplayerangles();
    level.player playerlinktoabsolute( var_3, "tag_origin", ( 0.0, 0.0, 0.0 ), ( 0.0, 0.0, 0.0 ) );
    level.player freezecontrols( 1 );
    var_4 = vectortoangles( vectornormalize( var_1.origin - level.player geteye() ) );
    var_5 = 0.5;
    var_3 rotateto( var_4, var_5, 0.2, 0.2 );
    wait(var_5);
}

overlaysmoke()
{
    var_0 = spawn( "script_model", level.player geteye() );
    var_0.origin = level.player geteye();
    var_0.angles = ( 0.0, 0.0, 0.0 );
    var_0 setmodel( "axis" );
    var_0 hide();
    wait 10;
    var_0 delete();
}

bridge_save()
{
    var_0 = getent( "bridge_save", "targetname" );
    var_0 waittill( "trigger" );
    level.special_autosavecondition = ::bridge_save_check;
    maps\_loadout::give_loadout();

    if ( level.cheat_lemonade )
        maps\_cheat::givelemonade();

    level notify( "stop_mantle" );
    maps\_utility::vision_set_fog_changes( "jeepride_end_2", 6 );
    level.player maps\_utility::set_light_set_player( "jeepride_end_2" );
    setsaveddvar( "ai_friendlyFireBlockDuration", 250 );
    level.price.a.disablepain = 0;
    level.price.ignoresuppression = 0;
    thread maps\_utility::autosave_by_name( "bridge_save" );

    while ( !common_scripts\utility::flag( "game_saving" ) )
        level waittill( "game_saving" );

    level.special_autosavecondition = undefined;
}

bridge_save_check()
{
    var_0 = getent( "bridge_save", "targetname" );
    return distance( common_scripts\utility::flat_origin( level.player.origin ), common_scripts\utility::flat_origin( var_0.origin ) ) < var_0.radius;
}

shock_ondeath_loc()
{
    precacheshellshock( "jeepride_ridedeath" );
    self.specialdeath = 1;
    self waittill( "death" );

    if ( getdvar( "r_texturebits" ) == "16" )
        return;

    self shellshock( "jeepride_ridedeath", 3 );
}

bridge_rescue_start()
{
    soundscripts\_snd::snd_message( "aud_bridge_rescue_checkpoint" );
    level.startdelay = 350000;
    var_0 = getent( "zak_price_spot", "targetname" );
    var_1 = getent( "zak_griggs_spot", "targetname" );
    var_2 = getent( "zak_player_spot", "targetname" );
    level.player setorigin( var_2.origin );
    spawn_heros_for_start( var_0.origin, var_1.origin, var_2.origin );
    common_scripts\utility::flag_set( "end_ride" );
    common_scripts\utility::flag_set( "bridge_sequence" );
    common_scripts\utility::flag_set( "van_smash" );
    common_scripts\utility::flag_set( "music_bridge" );
    common_scripts\utility::flag_set( "music_zak" );
    common_scripts\utility::flag_set( "bridge_zakhaev_setup" );
    maps\jeepride_code::exploder_loc( 3, 1 );
    maps\jeepride_code::exploder_loc( 71, 1 );
    maps\jeepride_code::exploder_loc( 72, 1 );
    maps\jeepride_code::exploder_loc( 73, 1 );
    wait 4.5;
    var_3 = getaiarray();

    for ( var_4 = 0; var_4 < var_3.size; var_4++ )
    {
        if ( var_3[var_4] maps\jeepride_code::ishero() )
            continue;

        if ( isdefined( var_3[var_4].magic_bullet_shield ) && var_3[var_4].magic_bullet_shield )
            var_3[var_4] maps\_utility::stop_magic_bullet_shield();

        var_3[var_4] delete();
    }

    thread maps\_vehicle::create_vehicle_from_spawngroup_and_gopath( 71 );
    level.price maps\_utility::stop_magic_bullet_shield();
    var_5 = maps\_vehicle_aianim::convert_guy_to_drone( level.price );
    var_5.animname = "price";
    level.pricedummy = var_5;
    var_6 = maps\_utility::spawn_anim_model( "playerview" );
    var_7 = getent( "player_drag_node", "targetname" );
    var_7 thread maps\_anim::anim_single_solo( var_6, "drag_player" );
    var_7 thread maps\_anim::anim_set_rate_single( var_6, "drag_player", 15 );
    level.level_specific_dof = 1;
    level.player setdepthoffield( 0, 100, 3100, 19999, 8, 1.65 );
    level.player allowstand( 1 );
    level.player allowprone( 0 );
    level.player allowsprint( 0 );
    wait 5;
    common_scripts\utility::flag_set( "rescue_choppers" );
    common_scripts\utility::flag_set( "music_rescue" );
    level.player playerlinktodelta( var_6, "tag_player", 1, 45, 45, 45, 3 );
    bridge_rescue( var_6 );
}

bm21_unloader()
{
    var_0 = getvehiclenode( self.targetname, "target" );
    var_1 = getvehiclenode( var_0.targetname, "target" );
    var_1 waittill( "trigger", var_2 );
    var_2 notify( "unload", "passengers" );
    self waittill( "trigger", var_2 );
    var_2 vehicle_setspeed( 0, 200 );
    var_2 waittill( "unloaded" );
    var_2 resumespeed( 15 );
}

autosave_now_loc( var_0 )
{
    if ( !isalive( level.player ) )
        return;

    if ( level.missionfailed )
        return;

    level.player.attackeraccuracy = 0;
    thread maps\_utility::autosave_now();
    level.player.attackeraccuracy = 1;
}

start_first_hind()
{
    setsaveddvar( "ragdoll_max_life", level.defaultragdolltime );
    soundscripts\_snd::snd_message( "aud_first_hind_checkpoint" );
    common_scripts\utility::array_thread( getvehiclenodearray( "attacknow_firsthind", "script_noteworthy" ), maps\jeepride_code::attacknow );
    wip_start();
}

start_nowhere()
{
    soundscripts\_snd::snd_message( "aud_nowhere_checkpoint" );
}

bm21_setanims_override()
{
    var_0 = vehicle_scripts\_bm21_troops::setanims();
    var_0[0].idle = [];
    var_0[0].idle[0] = %uaz_driver_idle;
    var_0[0].idle[1] = %uaz_driver_duck;
    var_0[0].idle[2] = %uaz_driver_weave;
    var_0[0].idleoccurrence[0] = 100;
    var_0[0].idleoccurrence[1] = 100;
    var_0[0].idleoccurrence[2] = 100;
    return var_0;
}

fx_thing()
{
    var_0 = loadfx( "fx/explosions/small_vehicle_explosion" );

    for (;;)
    {
        while ( !level.player usebuttonpressed() )
            wait 0.05;

        playfx( var_0, level.player geteye() );

        while ( level.player usebuttonpressed() )
            wait 0.05;
    }
}

framer( var_0, var_1 )
{
    var_2 = spawn( "script_model", var_0 );
    var_2.angles = var_1;
    var_2 setmodel( "tag_origin" );
    level.player unlink();
    level.player playerlinktodelta( var_2, "tag_origin", 1, 5, 5, 5, 5 );
    return var_2;
}

beam_me_up()
{
    var_0 = getent( "beam_me_up", "targetname" );
    var_0 hide();
    var_1 = getentarray( var_0.target, "targetname" );

    for ( var_2 = 0; var_2 < var_1.size; var_2++ )
    {
        var_1[var_2] hide();
        var_1[var_2] linkto( var_0 );
    }

    var_0.beam_me_uppers = var_1;
}

beam_me_up_to_the_chopper( var_0 )
{
    var_1 = getent( "beam_me_up", "targetname" );
    var_2 = var_1.beam_me_uppers;
    var_1 show();
    level.player playrumbleonentity( "tank_rumble" );

    for ( var_3 = 0; var_3 < var_2.size; var_3++ )
        var_2[var_3] show();

    wait 1;
    var_1 ghettolinkto( level.player );
}

ghettolinkto( var_0 )
{
    self endon( "death" );
    var_1 = spawn( "script_origin", level.player.origin );
    self linkto( var_1 );

    for (;;)
    {
        var_1.origin = var_0.origin;
        wait 0.05;
    }
}

bx_scripted_events_flags_vfx()
{
    common_scripts\utility::flag_wait( "bx_start_level" );
    common_scripts\_exploder::exploder( "1001" );
    wait 5.0;
    common_scripts\_exploder::exploder( "1002" );
    common_scripts\utility::flag_wait( "bx_start_to_1st_car_crashes" );
    common_scripts\utility::flag_wait( "bx_start_to_1st_player_offtrack" );
    common_scripts\utility::flag_wait( "bx_start_to_1st_tanker_crash" );
    common_scripts\utility::flag_wait( "bx_1st_player_collision" );
    common_scripts\utility::flag_wait( "bx_1st_enemy_jeep_explosions" );
    common_scripts\utility::flag_wait( "tunnel_explosion_fx_flag" );
    common_scripts\_exploder::exploder( "680" );
    common_scripts\utility::flag_wait( "bx_2nd_civil_car_crash" );
    wait 0.35;
    common_scripts\_exploder::exploder( "7001" );
    wait 0.4;
    common_scripts\_exploder::exploder( "7002" );
    common_scripts\utility::flag_wait( "bx_2nd_to_3rd_civil_truck_crashes" );
    common_scripts\utility::flag_wait( "bx_2nd_to_3rd_enemy_jeep_leap" );
    common_scripts\utility::flag_wait( "bx_2nd_to_3rd_enemy_jeep_collision" );
    thread impact_sedan_car_vfx();
    wait 1.5;
    common_scripts\_exploder::exploder( "10000" );
    wait 3.01;
    common_scripts\_exploder::exploder( "10002" );
    wait 0.0;
    common_scripts\_exploder::exploder( "10001" );
    common_scripts\_exploder::exploder( "10003" );
    common_scripts\utility::flag_wait( "bx_3rd_civil_truck_crash" );
    common_scripts\utility::flag_wait( "bx_end_bridge_transition" );
    common_scripts\utility::flag_wait( "bridge_sequence" );
    wait 6.1;
    common_scripts\_exploder::exploder( "14003" );
}

bx_warmup_vfx_bridge()
{
    var_0 = maps\_utility::getfxarraybyid( "smoke_column" );
    var_0 = common_scripts\utility::array_combine( var_0, maps\_utility::getfxarraybyid( "smoke_column_black_far_jeepride" ) );
    var_0 = common_scripts\utility::array_combine( var_0, maps\_utility::getfxarraybyid( "bridge_amb_smk" ) );
    var_0 = common_scripts\utility::array_combine( var_0, maps\_utility::getfxarraybyid( "bridge_amb_smk_2" ) );
    var_0 = common_scripts\utility::array_combine( var_0, maps\_utility::getfxarraybyid( "bridge_amb_smk_3" ) );
    var_0 = common_scripts\utility::array_combine( var_0, maps\_utility::getfxarraybyid( "bridge_amb_smk_4" ) );
    var_0 = common_scripts\utility::array_combine( var_0, maps\_utility::getfxarraybyid( "cloud_mountain_liar" ) );
    var_1 = maps\_utility::getfxarraybyid( "cloud_bank_far" );

    for ( var_2 = 0; var_2 < var_0.size; var_2++ )
        var_0[var_2] common_scripts\utility::pauseeffect();

    common_scripts\utility::flag_wait( "bx_start_level" );
    maps\jeepride_fx::heli_tread_fx_swap( "fx/treadfx/heli_dust_jeepride", "fx/treadfx/heli_water_jeepride" );
    common_scripts\utility::flag_wait( "bridge_section_start" );

    for ( var_2 = 0; var_2 < var_0.size; var_2++ )
        var_0[var_2] maps\_utility::restarteffect();

    for ( var_2 = 0; var_2 < var_1.size; var_2++ )
        var_1[var_2] common_scripts\utility::pauseeffect();

    maps\jeepride_fx::heli_tread_fx_swap( "fx/treadfx/heli_dust_jeepride2" );
}

bx_warmup_vfx_end()
{
    var_0 = maps\_utility::getfxarraybyid( "bridge_amb_smk_2" );
    var_0 = common_scripts\utility::array_combine( var_0, maps\_utility::getfxarraybyid( "bridge_amb_smk_4" ) );

    for ( var_1 = 0; var_1 < var_0.size; var_1++ )
        var_0[var_1] common_scripts\utility::pauseeffect();

    common_scripts\_exploder::kill_exploder( "74" );
    common_scripts\_exploder::kill_exploder( "14001" );
    common_scripts\_exploder::kill_exploder( "14003" );
    maps\jeepride_fx::heli_tread_fx_swap( "fx/treadfx/heli_dust_jeepride3" );
}

bx_vfx_wind_kill()
{
    var_0 = maps\_utility::getfxarraybyid( "bridge_amb_smk_3" );

    for ( var_1 = 0; var_1 < var_0.size; var_1++ )
        var_0[var_1] common_scripts\utility::pauseeffect();

    maps\_utility::stop_exploder( "142" );
    maps\_utility::stop_exploder( "14004" );
}

bx_helicopter_death_vfx()
{
    wait 0.15;
    earthquake( 0.6, 0.45, level.player.origin, 2500 );
    maps\jeepride_code::exploder_loc( 14010 );
    maps\_utility::stop_exploder( 14020 );
    setblur( 1.6, 0.05 );
    wait 0.05;
    setblur( 0, 0.3 );
    wait 5.8;
    maps\jeepride_code::exploder_loc( 18001 );
}

bx_performance_vfx_count()
{
    var_0 = maps\_utility::getfxarraybyid( "cloud_bank_road_2" );
    var_0 = common_scripts\utility::array_combine( var_0, maps\_utility::getfxarraybyid( "cloud_bank_road_3" ) );
    var_0 = common_scripts\utility::array_combine( var_0, maps\_utility::getfxarraybyid( "cloud_bank_road_4" ) );
    var_0 = common_scripts\utility::array_combine( var_0, maps\_utility::getfxarraybyid( "cloud_bank_road_5" ) );
    var_0 = common_scripts\utility::array_combine( var_0, maps\_utility::getfxarraybyid( "leaves_fall_2" ) );
    var_0 = common_scripts\utility::array_combine( var_0, maps\_utility::getfxarraybyid( "leaves_fall_3" ) );
    var_0 = common_scripts\utility::array_combine( var_0, maps\_utility::getfxarraybyid( "leaves_fall_4" ) );
    var_0 = common_scripts\utility::array_combine( var_0, maps\_utility::getfxarraybyid( "leaves_fall_5" ) );

    for ( var_1 = 0; var_1 < var_0.size; var_1++ )
        var_0[var_1] common_scripts\utility::pauseeffect();

    thread bx_performance_vfx_out( "cloud_bank_road", "leaves_fall", "bx_perf_section_1_out" );
    thread bx_performance_vfx_out( "cloud_bank_road_2", "leaves_fall_2", "bx_perf_section_2_out" );
    thread bx_performance_vfx_out( "cloud_bank_road_3", "leaves_fall_3", "bx_perf_section_3_out" );
    thread bx_performance_vfx_out( "cloud_bank_road_4", "leaves_fall_4", "bx_perf_section_4_out" );
    thread bx_performance_vfx_out( "cloud_bank_road_5", "leaves_fall_5", "end_ride" );
    thread bx_performance_vfx_in( "cloud_bank_road_2", "leaves_fall_2", "bx_perf_section_2_in" );
    thread bx_performance_vfx_in( "cloud_bank_road_3", "leaves_fall_3", "bx_perf_section_3_in" );
    thread bx_performance_vfx_in( "cloud_bank_road_4", "leaves_fall_4", "bx_perf_section_4_in" );
    thread bx_performance_vfx_in( "cloud_bank_road_5", "leaves_fall_5", "bx_perf_section_5_in" );
}

bx_performance_vfx_out( var_0, var_1, var_2 )
{
    var_3 = maps\_utility::getfxarraybyid( var_0 );
    var_3 = common_scripts\utility::array_combine( var_3, maps\_utility::getfxarraybyid( var_1 ) );
    common_scripts\utility::flag_wait( var_2 );

    for ( var_4 = 0; var_4 < var_3.size; var_4++ )
        var_3[var_4] common_scripts\utility::pauseeffect();
}

bx_performance_vfx_in( var_0, var_1, var_2 )
{
    var_3 = maps\_utility::getfxarraybyid( var_0 );
    var_3 = common_scripts\utility::array_combine( var_3, maps\_utility::getfxarraybyid( var_1 ) );
    common_scripts\utility::flag_wait( var_2 );

    for ( var_4 = 0; var_4 < var_3.size; var_4++ )
        var_3[var_4] maps\_utility::restarteffect();
}

play_bridge_collapse_vfx()
{
    maps\jeepride_code::exploder_loc( 144 );
}

impact_sedan_car_vfx()
{
    var_0 = getvehiclenode( "auto3649", "targetname" );
    var_0 waittill( "trigger", var_1 );
    playfxontag( level._effect["jeep_tire_hit_sedan"], var_1, "tag_headlight_left" );
    wait 0.35;
    earthquake( 0.5, 0.5, level.player.origin, 2500 );
}

reconnect_bridge_paths()
{
    var_0 = getentarray( "reconnect_path", "script_noteworthy" );

    foreach ( var_2 in var_0 )
        var_2 connectpaths();
}

play_bridge_vehicle_collapse_vfx( var_0 )
{
    playfxontag( level._effect["bridge_idle_fire_cin"], var_0, "tag_fx_wagon_fire1_1" );
    playfxontag( level._effect["bridge_idle_fire_2_cin"], var_0, "tag_fx_wagon_fire3_1" );
    playfxontag( level._effect["bridge_idle_fire_cin"], var_0, "tag_fx_uaz_fire2_1" );
    playfxontag( level._effect["bridge_idle_fire_2_cin"], var_0, "tag_fx_uaz_fire3_1" );
}

play_bridge_wagon_spark_vfx( var_0, var_1 )
{
    playfxontag( level._effect["bridge_sparks_wagon_cin"], var_0, "tag_fx_wagon_spark_" + var_1 );
}

play_bridge_uaz_spark_vfx( var_0, var_1 )
{
    playfxontag( level._effect["bridge_grind_cin"], var_0, "tag_fx_uaz_spark_" + var_1 );
    wait 0.35;
    playfxontag( level._effect["bridge_sparks_uaz_cin"], var_0, "tag_fx_uaz_spark_" + var_1 );
}

stop_bridge_wagon_spark_vfx( var_0, var_1 )
{
    stopfxontag( level._effect["bridge_sparks_wagon_cin"], var_0, "tag_fx_wagon_spark_" + var_1 );
}

stop_bridge_uaz_spark_vfx( var_0, var_1 )
{
    stopfxontag( level._effect["bridge_grind_cin"], var_0, "tag_fx_uaz_spark_" + var_1 );
    stopfxontag( level._effect["bridge_sparks_uaz_cin"], var_0, "tag_fx_uaz_spark_" + var_1 );
}

setup_bridge_mi17()
{
    level.vehicle_attachedmodels["script_vehicle_mi17_woodland_fly_cheap"]["TAG_FastRope_LE"].dropanim = %h1_mi17_rope_drop_le_fastrope_80ft;
    level.vehicle_attachedmodels["script_vehicle_mi17_woodland_fly_cheap"]["TAG_FastRope_RI"].dropanim = %h1_mi17_rope_drop_ri_fastrope_80ft;
}

end_slowmo_on_death()
{
    self waittill( "death" );
    maps\_utility::slowmo_lerp_out();
}
