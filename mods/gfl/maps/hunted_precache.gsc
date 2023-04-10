// H1 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

main()
{
    common_scripts\utility::add_destructible_type_function( "vehicle_80s_hatch1_brn", destructible_scripts\vehicle_80s_hatch1_brn::main );
    common_scripts\utility::add_destructible_type_function( "vehicle_80s_sedan1_silv", destructible_scripts\vehicle_80s_sedan1_silv::main );
    common_scripts\utility::add_destructible_type_function( "vehicle_80s_wagon1_tan", destructible_scripts\vehicle_80s_wagon1_tan::main );
    common_scripts\utility::add_destructible_type_function( "vehicle_bm21_cover", destructible_scripts\vehicle_bm21_cover::main );
    common_scripts\utility::add_destructible_type_function( "vehicle_bm21_mobile_bed", destructible_scripts\vehicle_bm21_mobile_bed::main );
    common_scripts\utility::add_destructible_type_function( "vehicle_pickup", destructible_scripts\vehicle_pickup::main );
    vehicle_scripts\_blackhawk::main( "vehicle_blackhawk_hero", undefined, "script_vehicle_blackhawk_hero" );
    vehicle_scripts\_bm21_troops::main( "vehicle_bm21_cover_destructible", undefined, "script_vehicle_bm21_cover_destructible" );
    vehicle_scripts\_bm21_troops::main( "vehicle_bm21_mobile_bed_destructible", undefined, "script_vehicle_bm21_mobile_bed_destructible" );
    vehicle_scripts\_bm21_troops::main( "vehicle_bm21_mobile_cover", undefined, "script_vehicle_bm21_mobile_cover" );
    vehicle_scripts\_mi17::main( "vehicle_mi17_woodland_fly", undefined, "script_vehicle_mi17_woodland_fly" );
    vehicle_scripts\_truck::main( "vehicle_pickup_4door", undefined, "script_vehicle_pickup_4door" );
    vehicle_scripts\_t72::main( "vehicle_t72_tank", undefined, "script_vehicle_t72_tank" );

    precachemodel( "h2_gfl_m4_sopmod_ii_viewbody" );
    precachemodel( "h2_gfl_m4_sopmod_ii_viewhands" );
    precachemodel( "h2_gfl_m4_sopmod_ii_viewhands_player" );
    precachemodel( "h2_gfl_m4_sopmod_ii_worldhands" );
}
