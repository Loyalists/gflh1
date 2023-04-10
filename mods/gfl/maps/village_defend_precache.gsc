// H1 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

main()
{
    common_scripts\utility::add_destructible_type_function( "vehicle_80s_sedan1_brn", destructible_scripts\vehicle_80s_sedan1_brn::main );
    common_scripts\utility::add_destructible_type_function( "vehicle_80s_sedan1_silv", destructible_scripts\vehicle_80s_sedan1_silv::main );
    vehicle_scripts\_seaknight::main( "vehicle_ch46e", undefined, "script_vehicle_ch46e" );
    vehicle_scripts\_mi17::main( "vehicle_mi17_woodland_fly_cheap", undefined, "script_vehicle_mi17_woodland_fly_cheap" );
    vehicle_scripts\_t72::main( "vehicle_t72_tank_woodland", undefined, "script_vehicle_t72_tank_woodland" );

    precachemodel( "h2_gfl_m4_sopmod_ii_viewbody" );
    precachemodel( "h2_gfl_m4_sopmod_ii_viewhands" );
    precachemodel( "h2_gfl_m4_sopmod_ii_viewhands_player" );
    precachemodel( "h2_gfl_m4_sopmod_ii_worldhands" );
}
