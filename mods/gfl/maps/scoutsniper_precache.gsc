// H1 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

main()
{
    common_scripts\utility::add_destructible_type_function( "vehicle_bus_destructible", destructible_scripts\vehicle_bus_destructible::main );
    common_scripts\utility::add_destructible_type_function( "vehicle_uaz_fabric", destructible_scripts\vehicle_uaz_fabric::main );
    vehicle_scripts\_bm21_troops::main( "vehicle_bm21_bed_under_destructible", undefined, "script_vehicle_bm21_bed_under_destructible" );
    vehicle_scripts\_bm21_troops::main( "vehicle_bm21_cover_under_destructible", undefined, "script_vehicle_bm21_cover_under_destructible" );
    vehicle_scripts\_bm21_troops::main( "vehicle_bm21_mobile_bed", undefined, "script_vehicle_bm21_mobile_bed" );
    vehicle_scripts\_bmp::main( "vehicle_bmp_woodland", undefined, "script_vehicle_bmp_woodland" );
    vehicle_scripts\_hind::main( "vehicle_mi24p_hind_woodland", undefined, "script_vehicle_mi24p_hind_woodland" );
    vehicle_scripts\_uaz::main( "vehicle_uaz_light_destructible", undefined, "script_vehicle_uaz_light_destructible" );

    precachemodel( "h2_gfl_m4a1_viewbody" );
    precachemodel( "h2_gfl_m4a1_worldbody" );
    precachemodel( "h2_gfl_m4a1_viewhands" );
    precachemodel( "h2_gfl_m4a1_viewhands_player" );
    precachemodel( "h2_gfl_m4a1_worldhands" );
}
