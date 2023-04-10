// H1 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

dead_script()
{
    common_scripts\_ca_blockout::init();
    maps\createart\village_assault_art::main();
    maps\village_assault_fx::main();
    maps\village_assault_precache::main();
    maps\_load::main();
    maps\village_assault_anim::main();
    level thread maps\village_assault_amb::main();
    maps\village_assault_lighting::main();
}

main()
{
    if ( getdvar( "beautiful_corner" ) == "1" )
    {
        dead_script();
        return;
    }

    maps\village_assault_code::precachelevelstuff();
    maps\_utility::add_start( "town", ::start_town, &"STARTS_TOWN" );
    maps\_utility::add_start( "alasad_barn", ::start_alasad_barn, &"STARTS_ALASADBARN" );
    maps\_utility::add_start( "alasad_house", ::start_alasad_house, &"STARTS_ALASADHOUSE" );
    maps\_utility::default_start( ::start_start );
    maps\village_assault_precache::main();
    maps\createart\village_assault_art::main();
    maps\village_assault_fx::main();
    maps\_c4::main();
    maps\_hiding_door_anims::main();
    thread common_scripts\_pipes::main();
    thread maps\_leak::main();
    maps\_load::main();
    maps\_hiding_door::init_hiding_door();
    maps\_nightvision::main();
    maps\_load::set_player_viewhand_model( "h2_gfl_m4_sopmod_ii_worldhands" );
    maps\_javelin::init();
    maps\_drone_ai::init();
    animscripts\dog\dog_init::initdoganimations();
    maps\village_assault_code::setleveldvars();
    maps\village_assault_lighting::main();
    maps\village_assault_aud::main();
    thread maps\village_assault_code::scriptcalls();
    maps\_utility::add_hint_string( "armor_damage", &"SCRIPT_ARMOR_DAMAGE", undefined );
    thread maps\village_assault_code::add_objective_building( "1" );
    thread maps\village_assault_code::add_objective_building( "2" );
    thread maps\village_assault_code::add_objective_building( "3" );
    thread maps\village_assault_code::add_objective_building( "4" );
    thread maps\village_assault_code::add_objective_building( "5" );
    thread maps\village_assault_code::add_objective_building( "6" );
    thread maps\village_assault_code::objective_updatenextwaypoints();
    setsaveddvar( "r_reactiveMotionWindAmplitudeScale", 3 );
    setsaveddvar( "r_reactiveMotionWindStrength", 1 );
    setsaveddvar( "r_reactiveMotionWindFrequencyScale", 3 );
    setsaveddvar( "r_reactiveMotionWindAreaScale", 33.3 );
    setsaveddvar( "r_reactiveMotionHelicopterRadius", 1000 );
    setsaveddvar( "r_reactiveMotionHelicopterStrength", 5 );
    setsaveddvar( "r_lodFOVScaleOverride", 1 );
    setsaveddvar( "r_lodFOVScaleOverrideAmount", 0.75 );
    setsaveddvar( "r_lodFOVScaleOverrideStopMaxAngle", 30 );
    setsaveddvar( "r_lodFOVScaleOverrideStopMinAngle", 35 );
    setsaveddvar( "r_lodFOVScaleOverrideStartMaxAngle", 65 );
    setsaveddvar( "r_lodFOVScaleOverrideStartMinAngle", 55 );
    animscripts\utility::set_team_run_twitch_animation( "allies", 1 );
    wait 0.05;
    setsaveddvar( "compassObjectiveMaxHeight", "800" );
    setsaveddvar( "compassObjectiveMinHeight", "-800" );
}

start_start()
{
    maps\village_assault_code::spawn_starting_friendlies( "friendly_start" );
    thread gameplay_start();
}

start_town()
{
    maps\village_assault_code::spawn_starting_friendlies( "friendly_town" );
    maps\village_assault_code::moveplayertolocation( "player_start_town" );
}

start_alasad_barn()
{
    maps\village_assault_code::spawn_starting_friendlies( "friendly_alasad_barn" );
    maps\village_assault_code::moveplayertolocation( "player_start_alasad_barn" );
    thread maps\village_assault_code::do_alasad( "barn" );
}

start_alasad_house()
{
    maps\village_assault_code::spawn_starting_friendlies( "friendly_alasad_house" );
    maps\village_assault_code::moveplayertolocation( "player_start_alasad_house" );
    thread maps\village_assault_code::do_alasad( "house" );
}

gameplay_start()
{
    maps\village_assault_code::friendly_stance( "crouch" );
    thread battlechatter_trigger_on();
    maps\village_assault_code::opening_sequence();
    maps\village_assault_code::friendly_stance( "stand", "crouch", "prone" );
    var_0 = getent( "first_trigger_after_gas_station", "script_noteworthy" );

    if ( !isdefined( var_0.trigger_off ) || var_0.trigger_off == 0 )
        var_0 notify( "trigger" );

    for ( var_1 = 0; var_1 < level.friendlies.size; var_1++ )
        level.friendlies[var_1] pushplayer( 1 );

    getent( "pushplayer_off", "targetname" ) waittill( "trigger" );

    for ( var_1 = 0; var_1 < level.friendlies.size; var_1++ )
        level.friendlies[var_1] pushplayer( 0 );
}

battlechatter_trigger_on()
{
    maps\_utility::battlechatter_off( "allies" );
    maps\_utility::battlechatter_off( "axis" );
    getent( "battlechatter_on_trigger", "targetname" ) waittill( "trigger" );
    maps\_utility::battlechatter_on( "allies" );
    maps\_utility::battlechatter_on( "axis" );
    thread maps\village_assault_code::doautosave( "entered_town" );
    wait 60;
    thread maps\village_assault_code::air_support_hint_print_activate();
}
