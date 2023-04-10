// H1 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

main()
{
    common_scripts\utility::add_destructible_type_function( "vehicle_80s_sedan1_red", destructible_scripts\vehicle_80s_sedan1_red::main );
    common_scripts\utility::add_destructible_type_function( "vehicle_80s_sedan1_tan", destructible_scripts\vehicle_80s_sedan1_tan::main );
    common_scripts\utility::add_destructible_type_function( "vehicle_pickup", destructible_scripts\vehicle_pickup::main );
    vehicle_scripts\_bmp::main( "vehicle_bmp_woodland", undefined, "script_vehicle_bmp_woodland" );
    vehicle_scripts\_mi28::main( "vehicle_mi-28_flying", undefined, "script_vehicle_mi28_flying" );

    precachemodel( "h2_gfl_m4_sopmod_ii_viewbody" );
    precachemodel( "h2_gfl_m4_sopmod_ii_viewhands" );
    precachemodel( "h2_gfl_m4_sopmod_ii_viewhands_player" );
    precachemodel( "h2_gfl_m4_sopmod_ii_worldhands" );
}
