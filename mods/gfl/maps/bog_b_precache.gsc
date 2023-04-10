// H1 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

main()
{
    common_scripts\utility::add_destructible_type_function( "vehicle_80s_hatch1_brn", destructible_scripts\vehicle_80s_hatch1_brn::main );
    common_scripts\utility::add_destructible_type_function( "vehicle_80s_sedan1_red", destructible_scripts\vehicle_80s_sedan1_red::main );
    common_scripts\utility::add_destructible_type_function( "vehicle_80s_sedan1_silv", destructible_scripts\vehicle_80s_sedan1_silv::main );
    common_scripts\utility::add_destructible_type_function( "vehicle_80s_wagon1_green", destructible_scripts\vehicle_80s_wagon1_green::main );
    common_scripts\utility::add_destructible_type_function( "vehicle_80s_wagon1_tan", destructible_scripts\vehicle_80s_wagon1_tan::main );
    common_scripts\utility::add_destructible_type_function( "vehicle_bus_destructible", destructible_scripts\vehicle_bus_destructible::main );
    common_scripts\utility::add_destructible_type_function( "vehicle_pickup", destructible_scripts\vehicle_pickup::main );
    vehicle_scripts\_seaknight::main( "vehicle_ch46e", undefined, "script_vehicle_ch46e" );
    vehicle_scripts\_m1a1::main( "vehicle_m1a1_abrams", undefined, "script_vehicle_m1a1_abrams" );
    vehicle_scripts\_mi17::main( "vehicle_mi17_woodland_fly_cheap", undefined, "script_vehicle_mi17_woodland_fly_cheap" );
    vehicle_scripts\_t72::main( "vehicle_t72_tank", undefined, "script_vehicle_t72_tank" );
}
