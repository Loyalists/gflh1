// H1 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

main()
{
    common_scripts\utility::add_destructible_type_function( "vehicle_80s_hatch1_brn", destructible_scripts\vehicle_80s_hatch1_brn::main );
    common_scripts\utility::add_destructible_type_function( "vehicle_80s_sedan1_green", destructible_scripts\vehicle_80s_sedan1_green::main );
    common_scripts\utility::add_destructible_type_function( "vehicle_bus_destructible", destructible_scripts\vehicle_bus_destructible::main );
    common_scripts\utility::add_destructible_type_function( "vehicle_pickup", destructible_scripts\vehicle_pickup::main );
    vehicle_scripts\_seaknight::main( "vehicle_ch46e_low", undefined, "script_vehicle_ch46e_low" );
    vehicle_scripts\_cobra::main( "vehicle_cobra_helicopter_fly_low", undefined, "script_vehicle_cobra_helicopter_fly_low" );
    vehicle_scripts\_m1a1::main( "vehicle_m1a1_abrams", undefined, "script_vehicle_m1a1_abrams" );
    vehicle_scripts\_t72::main( "vehicle_t72_tank", undefined, "script_vehicle_t72_tank" );
}
