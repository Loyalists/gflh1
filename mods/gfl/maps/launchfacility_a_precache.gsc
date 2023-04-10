// H1 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

main()
{
    vehicle_scripts\_blackhawk::main( "vehicle_blackhawk", undefined, "script_vehicle_blackhawk" );
    vehicle_scripts\_bm21::main( "vehicle_bm21_mobile", undefined, "script_vehicle_bm21_mobile" );
    vehicle_scripts\_bmp::main( "vehicle_bmp_woodland", undefined, "script_vehicle_bmp_woodland" );
    vehicle_scripts\_hind::main( "vehicle_mi24p_hind_woodland", undefined, "script_vehicle_mi24p_hind_woodland" );
    vehicle_scripts\_mig29::main( "vehicle_mig29_desert", undefined, "script_vehicle_mig29_desert" );

    precachemodel( "h2_gfl_m4_sopmod_ii_viewbody" );
    precachemodel( "h2_gfl_m4_sopmod_ii_viewhands" );
    precachemodel( "h2_gfl_m4_sopmod_ii_viewhands_player" );
    precachemodel( "h2_gfl_m4_sopmod_ii_worldhands" );
}
