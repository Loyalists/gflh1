// H1 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

main()
{
    anims();
    dialogue();
    setup_exploder_anims();
}

#using_animtree("generic_human");

anims()
{
    level.scr_anim["frnd"]["spin"] = %combatwalk_f_spin;
    level.scr_anim["drone"]["pilot_idle"][0] = %helicopter_pilot1_idle;
    level.scr_anim["drone"]["pilot_idle"][1] = %helicopter_pilot1_twitch_clickpannel;
    level.scr_anim["drone"]["pilot_idle"][2] = %helicopter_pilot1_twitch_lookback;
    level.scr_anim["drone"]["pilot_idle"][3] = %helicopter_pilot1_twitch_lookoutside;
    level.scr_anim["drone"]["copilot_idle"][0] = %helicopter_pilot2_idle;
    level.scr_anim["drone"]["copilot_idle"][1] = %helicopter_pilot2_twitch_clickpannel;
    level.scr_anim["drone"]["copilot_idle"][2] = %helicopter_pilot2_twitch_radio;
    level.scr_anim["drone"]["copilot_idle"][3] = %helicopter_pilot2_twitch_lookoutside;
    level.scr_anim["generic"]["ch46_load_1"] = %ch46_load_1;
    level.scr_anim["generic"]["ch46_load_2"] = %ch46_load_2;
    level.scr_anim["generic"]["ch46_load_3"] = %ch46_load_3;
    level.scr_anim["generic"]["ch46_load_4"] = %ch46_load_4;
    level.scr_anim["generic"]["ch46_unload_1_generic"] = %ch46_unload_1;
    level.scr_anim["generic"]["ch46_unload_2_generic"] = %ch46_unload_2;
    level.scr_anim["generic"]["ch46_unload_3_generic"] = %ch46_unload_3;
    level.scr_anim["generic"]["ch46_unload_4_generic"] = %ch46_unload_4;
    level.scr_anim["generic"]["ch46_unload_1_smoketown"] = %ch46_unload_1;
    level.scr_anim["generic"]["ch46_unload_2_smoketown"] = %ch46_unload_2;
    level.scr_anim["generic"]["ch46_unload_3_smoketown"] = %ch46_unload_3;
    level.scr_anim["generic"]["ch46_unload_4_smoketown"] = %ch46_unload_4;
    level.scr_anim["generic"]["ch46_unload_1_cobrastreets"] = %h1_airlift_landing_scene2_npc1;
    level.scr_anim["generic"]["ch46_unload_2_cobrastreets"] = %h1_airlift_landing_scene2_npc2;
    level.scr_anim["generic"]["ch46_unload_3_cobrastreets"] = %h1_airlift_landing_scene2_npc3;
    level.scr_anim["generic"]["ch46_unload_4_cobrastreets"] = %h1_airlift_landing_scene2_npc4;
    level.scr_anim["generic"]["ch46_unload_idle"][0] = %exposed_crouch_idle_alert_v1;
    level.scr_anim["frnd"]["AT4_fire_start"] = %launchfacility_a_at4_fire;
    level.scr_anim["frnd"]["AT4_fire"] = %launchfacility_a_at4_fire;
    level.scr_anim["frnd"]["AT4_idle"][0] = %corner_standr_alert_idle;
    level.scr_anim["frnd"]["RPG_conceal_idle_start"] = %rpg_conceal_idle;
    level.scr_anim["frnd"]["RPG_conceal_idle"][0] = %rpg_conceal_idle;
    level.scr_anim["frnd"]["RPG_conceal_2_standR"] = %rpg_conceal_2_standr;
    level.scr_anim["frnd"]["RPG_stand_idle"][0] = %rpg_stand_idle;
    level.scr_anim["frnd"]["RPG_stand_fire"] = %rpg_stand_fire;
    level.scr_anim["frnd"]["RPG_standR_2_conceal"] = %rpg_standr_2_conceal;
    level.scr_anim["frnd"]["AT4_fire_short_start"] = %launchfacility_a_at4_short;
    level.scr_anim["frnd"]["AT4_fire_short"] = %launchfacility_a_at4_short;
    level.scr_anim["frnd"]["AT4_idle_short"][0] = %corner_standr_alert_idle;
    level.scr_anim["frnd"]["crewchief_idle"][0] = %airlift_crewchief_idle;
    level.scr_anim["frnd"]["crewchief_getin"][0] = %airlift_crewchief_getin;
    level.scr_anim["frnd"]["crewchief_getin_lookback"][0] = %airlift_crewchief_getin_lookback;
    level.scr_anim["frnd"]["crewchief_getin_quick"][0] = %airlift_crewchief_getin_quick;
    level.scr_anim["frnd"]["crewchief_gun_idle"][0] = %airlift_crewchief_gun_idle;
    level.scr_anim["frnd"]["crewchief_gun_shoot"][0] = %airlift_crewchief_gun_shoot;
    level.scr_anim["frnd"]["crewchief_gun_getin"][0] = %airlift_crewchief_gun_getin;
    level.scr_anim["frnd"]["crewchief_sucked_out"] = %airlift_crewchief_sucked_out;
    maps\_anim::addnotetrack_animsound( "frnd", "crewchief_sucked_out", "foley_pilot_sucked_out", "scn_airlift_nuke_pilot_foley" );
    maps\_anim::addnotetrack_playersound( "frnd", "foley_pilot_slipping_from_hand", "crewchief_sucked_out", "scn_airlift_nuke_plr_foley" );
    level.scr_anim["frnd"]["crewchief_getout_generic"][0] = %airlift_crewchief_getout;
    level.scr_anim["frnd"]["crewchief_getout_cobrastreets"][0] = %h1_airlift_landing_scene2_crewchief;
    level.scr_anim["frnd"]["crewchief_getout_smoketown"][0] = %airlift_crewchief_getout;
    level.scr_anim["frnd"]["airlift_crewchief_stepout"] = %airlift_crewchief_stepout;
    level.scr_anim["frnd"]["airlift_crewchief_stepout_fire"] = %airlift_crewchief_stepout_fire;
    level.scr_anim["frnd"]["airlift_crewchief_stepout_fire_2_idle"] = %airlift_crewchief_stepout_fire_2_idle;
    level.scr_anim["frnd"]["airlift_crewchief_stepout_idle"][0] = %airlift_crewchief_stepout_idle;
    level.scr_anim["frnd"]["wounded_pullout"] = %airlift_pilot_getout;
    level.scr_anim["frnd"]["wounded_cockpit_shoot"][0] = %airlift_pilot_shooting;
    level.scr_anim["frnd"]["wounded_cockpit_wave_over"] = %airlift_pilot_seeyou;
    level.scr_anim["frnd"]["wounded_cockpit_idle"][0] = %airlift_pilot_idle;
    level.scr_anim["frnd"]["wounded_putdown"] = %airlift_pilot_putdown;
    level.scr_anim["frnd"]["carry_run"] = [ %h1_airlift_pilot_carry_run ];
    level.scr_anim["frnd"]["carry_idle"] = [ %h1_airlift_pilot_carry_idle ];
    level.scr_animtree["frnd"] = #animtree;
    level.scr_model["frnd"] = "body_sp_cobra_pilot_desert_velinda_burned";
    level.scr_anim["frnd"]["wounded_pullout_facial"] = %airlift_pilot_facial_getout;
    level.scr_anim["frnd"]["wounded_cockpit_shoot_facial"] = %airlift_pilot_facial_shooting;
    level.scr_anim["frnd"]["wounded_cockpit_wave_over_facial"] = %airlift_pilot_facial_seeyou;
    level.scr_anim["frnd"]["wounded_cockpit_idle_facial"] = %airlift_pilot_facial_idle;
    level.scr_anim["frnd"]["wounded_putdown_facial"] = %airlift_pilot_facial_putdown;
    level.scr_anim["frnd"]["deadpilot_idle"][0] = %airlift_copilot_dead;
}

setup_exploder_anims()
{
    level.exploder_animtrees = [];
    level.exploder_animtrees[0] = "exploder_script_model";
}

dialogue()
{
    level.scr_radio["airlift_mhp_information"] = "airlift_mhp_information";
    level.scr_radio["airlift_hqr_allcallsigns"] = "airlift_hqr_allcallsigns";
    level.scr_radio["airlift_fhp_bigtargets"] = "airlift_fhp_bigtargets";
    level.scr_radio["airlift_mhp_takingfire"] = "airlift_mhp_takingfire";
    level.scr_radio["airlift_mhp_rpgrooftops"] = "airlift_mhp_rpgrooftops";
    level.scr_radio["airlift_mhp_hostilesrpgs"] = "airlift_mhp_hostilesrpgs";
    level.scr_radio["airlift_mhp_groundinfantry"] = "airlift_mhp_groundinfantry";
    level.scr_radio["airlift_mhp_wevegotrpgs"] = "airlift_mhp_wevegotrpgs";
    level.scr_radio["airlift_mhp_lightarmor"] = "airlift_mhp_lightarmor";
    level.scr_radio["airlift_mhp_antiairrooftop"] = "airlift_mhp_antiairrooftop";
    level.scr_radio["airlift_mhp_antiairground"] = "airlift_mhp_antiairground";
    level.scr_radio["airlift_mhp_makingarun"] = "airlift_mhp_makingarun";
    level.scr_radio["airlift_hqr_getabramsfront"] = "airlift_hqr_getabramsfront";
    level.scr_sound["airlift_hcc_downramp"] = "airlift_hcc_downramp";
    level.scr_radio["airlift_hqr_2clickswest"] = "airlift_hqr_2clickswest";
    level.scr_radio["airlift_hqr_enroute"] = "airlift_hqr_enroute";
    level.scr_radio["airlift_fhp_refitandrefuel"] = "airlift_fhp_refitandrefuel";
    level.scr_radio["airlift_hqr_bluesmoke"] = "airlift_hqr_bluesmoke";
    level.scr_radio["airlift_mhp_havevisual"] = "airlift_mhp_havevisual";
    level.scr_sound["frnd"]["airlift_hcc_letsgo"] = "airlift_hcc_letsgo";
    level.scr_radio["airlift_vsq_forwardrecon"] = "airlift_vsq_forwardrecon";
    level.scr_radio["airlift_vsq_desevresaticket"] = "airlift_vsq_desevresaticket";
    level.scr_radio["airlift_vsq_escortback"] = "airlift_vsq_escortback";
    level.scr_radio["airlift_vsq_watchcoloredsmoke"] = "airlift_vsq_watchcoloredsmoke";
    level.scr_radio["airlift_vsq_greensmoke"] = "airlift_vsq_greensmoke";
    level.scr_sound["frnd"]["airlift_gm1_firebalcony"] = "airlift_gm1_firebalcony";
    level.scr_radio["airlift_mhp_lztoohot"] = "airlift_mhp_lztoohot";
    level.scr_radio["airlift_gm1_holdyourfire"] = "airlift_gm1_holdyourfire";
    level.scr_sound["frnd"]["airlift_gm2_firebalcony"] = "airlift_gm2_firebalcony";
    level.scr_sound["frnd"]["airlift_gm3_reinforcements"] = "airlift_gm3_reinforcements";
    level.scr_sound["frnd"]["airlift_gm4_reinforcements"] = "airlift_gm4_reinforcements";
    level.scr_radio["airlift_vsq_moveout"] = "airlift_vsq_moveout";
    level.scr_sound["frnd"]["airlift_vsq_wereit"] = "airlift_vsq_wereit";
    level.scr_radio["airlift_fhp_missme"] = "airlift_fhp_missme";
    level.scr_sound["frnd"]["airlift_gm3_hellyeah"] = "airlift_gm3_hellyeah";
    level.scr_sound["frnd"]["airlift_vsq_letsgo"] = "airlift_vsq_letsgo";
    level.scr_radio["airlift_vsq_gettolz"] = "airlift_vsq_gettolz";
    level.scr_radio["airlift_vsq_gettolz2"] = "airlift_vsq_gettolz2";
    level.scr_sound["frnd"]["airlift_hcc_wheelsup"] = "airlift_hcc_wheelsup";
    level.scr_sound["frnd"]["airlift_hcc_backonmark19"] = "airlift_hcc_backonmark19";
    level.scr_radio["airlift_gm4_hellyeah"] = "airlift_gm4_hellyeah";
    level.scr_radio["airlift_hqr_situation"] = "airlift_hqr_situation";
    level.scr_radio["airlift_mhp_goahead"] = "airlift_mhp_goahead";
    level.scr_radio["airlift_hqr_nestteams"] = "airlift_hqr_nestteams";
    level.scr_radio["airlift_hqr_nestteams"] = "airlift_hqr_nestteams";
    level.scr_radio["airlift_mhp_safedistance"] = "airlift_mhp_safedistance";
    level.scr_radio["airlift_mhp_safedistance"] = "airlift_mhp_safedistance";
    level.scr_radio["airlift_hqr_outtathere"] = "airlift_hqr_outtathere";
    level.scr_radio["airlift_hqr_outtathere"] = "airlift_hqr_outtathere";
    level.scr_radio["airlift_mhp_leadtheway"] = "airlift_mhp_leadtheway";
    level.scr_radio["airlift_mhp_leadtheway"] = "airlift_mhp_leadtheway";
    level.scr_radio["airlift_fhp_getoutta"] = "airlift_fhp_getoutta";
    level.scr_radio["airlift_fhp_werehit"] = "airlift_fhp_werehit";
    level.scr_radio["airlift_fhp_mayday"] = "airlift_fhp_mayday";
    level.scr_radio["airlift_fhp_goingdown"] = "airlift_fhp_goingdown";
    level.scr_radio["airlift_fhp_hangon"] = "airlift_fhp_hangon";
    level.scr_radio["airlift_fhp_hangon"] = "airlift_fhp_hangon";
    level.scr_radio["airlift_mhp_cobradown"] = "airlift_mhp_cobradown";
    level.scr_radio["airlift_mhp_doyoucopy"] = "airlift_mhp_doyoucopy";
    level.scr_radio["airlift_mhp_comein"] = "airlift_mhp_comein";
    level.scr_radio["airlift_mhp_smallarmsfire"] = "airlift_mhp_smallarmsfire";
    level.scr_radio["airlift_hqr_notsafe"] = "airlift_hqr_notsafe";
    level.scr_radio["airlift_mhp_weknow"] = "airlift_mhp_weknow";
    level.scr_radio["airlift_hqr_youcall"] = "airlift_hqr_youcall";
    level.scr_radio["airlift_mhp_youstatus"] = "airlift_mhp_youstatus";
    level.scr_radio["airlift_fhp_usesomehelp"] = "airlift_fhp_usesomehelp";
    level.scr_radio["airlift_mhp_werecoming"] = "airlift_mhp_werecoming";
    level.scr_radio["airlift_hqr_hostilesadvancing"] = "airlift_hqr_hostilesadvancing";
    level.scr_radio["airlift_vsq_90sec"] = "airlift_vsq_90sec";
    level.scr_radio["airlift_hqr_willbeoverrun"] = "airlift_hqr_willbeoverrun";
    level.scr_radio["airlift_vsq_crashsite"] = "airlift_vsq_crashsite";
    level.scr_sound["frnd"]["airlift_vsq_pullherout"] = "airlift_vsq_pullherout";
    level.scr_sound["frnd"]["airlift_vsq_getherout"] = "airlift_vsq_getherout";
    level.scr_sound["frnd"]["airlift_gm2_getpilot"] = "airlift_gm2_getpilot";
    level.scr_sound["frnd"]["airlift_gm2_outofhelo"] = "airlift_gm2_outofhelo";
    level.scr_sound["frnd"]["airlift_gm2_holdemoff"] = "airlift_gm2_holdemoff";
    level.scr_sound["frnd"]["airlift_gm2_coveryou"] = "airlift_gm2_coveryou";
    level.scr_radio["airlift_vsq_getpilot"] = "airlift_vsq_getpilot";
    level.scr_radio["airlift_vsq_outtacockpit"] = "airlift_vsq_outtacockpit";
    level.scr_radio["airlift_vsq_backtoseaknight"] = "airlift_vsq_backtoseaknight";
    level.scr_sound["frnd"]["airlift_vsq_holddown"] = "airlift_vsq_holddown";
    level.scr_sound["frnd"]["airlift_vsq_scuttlecobra"] = "airlift_vsq_scuttlecobra";
    level.scr_radio["airlift_vsq_gogo"] = "airlift_vsq_gogo";
    level.scr_radio["airlift_mhp_goodtime"] = "airlift_mhp_goodtime";
    level.scr_radio["airlift_vsq_onourway"] = "airlift_vsq_onourway";
    level.scr_radio["airlift_hqr_nuclearthreat"] = "airlift_hqr_nuclearthreat";
    level.scr_radio["airlift_mhp_inforchop"] = "airlift_mhp_inforchop";
    level.scr_radio["airlift_cop_rogerthat"] = "airlift_cop_rogerthat";
    level.scr_radio["airlift_hqr_confirmed"] = "airlift_hqr_confirmed";
    level.scr_radio["airlift_vsq_hangon"] = "airlift_vsq_hangon";
    level.scr_sound["airlift_fhp_pains"] = "airlift_fhp_pains";
    player_anims();
    tank_crush_anims();
    seaknight_anims();
    statue_anims();
    animated_palm_trees_setup();
    statue_shattering_anim();
    crane_anims();
    scaffold_collapse_anims();
    bmp_airlift_anims();
}

#using_animtree("player");

player_anims()
{
    level.scr_anim["player_carry"]["wounded_pullout"] = %airlift_player_getout;
    level.scr_anim["player_carry"]["wounded_putdown"] = %airlift_player_putdown;
    level.scr_anim["player_carry"]["carry_idle"] = [ %h1_airlift_player_carry_idle ];
    level.scr_anim["player_carry"]["carry_run"] = [ %h1_airlift_player_carry_run ];
    maps\_anim::addnotetrack_animsound( "player_carry", "carry_run", "drag_step_right", "airlift_plr_footstep_dragR" );
    maps\_anim::addnotetrack_animsound( "player_carry", "carry_run", "drag_step_left", "airlift_plr_footstep_dragL" );
    level.scr_animtree["player_carry"] = #animtree;
    level.scr_model["player_carry"] = "h1_gfl_ump40_worldhands";
    level.scr_animtree["player_viewbody"] = #animtree;
    level.scr_model["player_viewbody"] = "h1_gfl_ump40_viewbody";
    level.scr_anim["player_viewbody"]["player_nuke_crash"] = %h1_airlift_crash_player;
    level.scr_animtree["player_viewhands"] = #animtree;
    level.scr_model["player_viewhands"] = "h1_gfl_ump40_worldhands";
    level.scr_anim["player_viewhands"]["turret_intro_anim"] = %h1_airlift_intro_player;
    level.scr_anim["player_viewhands"]["turret_idle_anim"] = [ %h1_ch46_turret_player_idle ];
    level.scr_anim["player_viewhands"]["turret_fire_anim"] = %h1_ch46_turret_player_fire;
}

#using_animtree("vehicles");

tank_crush_anims()
{
    level.scr_animtree["tank_crush"] = #animtree;
    level.scr_anim["sedan"]["tank_crush"] = %sedan_tankcrush_side;
    level.scr_anim["tank"]["tank_crush"] = %tank_tankcrush_side;
    level.scr_sound["tank_crush"] = "airlift_tank_crush_car";
}

bmp_airlift_anims()
{
    level.scr_animtree["bmp"] = #animtree;
    level.scr_anim["bmp"]["stopping"] = %bmp_stopping;
}

seaknight_anims()
{
    level.scr_anim["seaknight"]["idle"][0] = %sniper_escape_ch46_idle;
    level.scr_anim["seaknight"]["landing"] = %sniper_escape_ch46_land;
    level.scr_anim["seaknight"]["take_off"] = %sniper_escape_ch46_take_off;
    level.scr_anim["seaknight"]["rotors"] = %sniper_escape_ch46_rotors;
    level.scr_anim["seaknight"]["turret_settle_anim"] = %ch46_turret_idle;
    level.scr_anim["seaknight"]["turret_fire_anim"] = %ch46_turret_fire;
    level.scr_anim["seaknight"]["doors_open"] = %ch46_doors_open;
    level.scr_anim["seaknight"]["turret_intro_anim"] = %h1_airlift_intro_turret;
    level.scr_anim["seaknight"]["h1_ch46r_liftoff"] = %h1_ch46r_liftoff;
    level.scr_animtree["seaknight"] = #animtree;
    level.scr_anim["wingman"]["h1_cobra_crash"] = %h1_cobra_crash;
    level.scr_animtree["wingman"] = #animtree;
}

seaknight_turret_anim_init()
{
    self useanimtree( #animtree );
    self setanim( %ch46_doors_close );
}

seaknight_turret_anim_idle()
{
    self useanimtree( #animtree );
    self setanim( %ch46_turret_idle );
}

seaknight_turret_anim()
{
    self endon( "death" );
    self endon( "turret_fire" );
    self useanimtree( #animtree );
    self setanimknobrestart( %ch46_turret_fire, 1, 0, 1 );
}

seaknight_turret_anim_intro()
{
    self endon( "death" );
    self useanimtree( #animtree );
    self setanim( %h1_airlift_intro_turret );
}

seaknight_open_doors()
{
    self useanimtree( #animtree );
    self playsound( "seaknight_door_open" );
    self setanimknobrestart( %ch46_doors_open, 1, 0, 1 );
}

seaknight_close_doors()
{
    self useanimtree( #animtree );
    self playsound( "seaknight_door_close" );
    self setanimknobrestart( %ch46_doors_close, 1, 0, 1 );
}

#using_animtree("animated_props");

statue_anims()
{
    level.scr_animtree["statue"] = #animtree;
    level.scr_anim["statue"]["statue_collapse"] = %me_statue_destroy_base_01;
}

animated_palm_trees_setup()
{
    level.anim_prop_models["foliage_tree_palm_bushy_3"]["still"] = %palmtree_bushy3_still;
    level.anim_prop_models["foliage_tree_palm_bushy_3"]["strong"] = %palmtree_bushy3_sway;
    level.anim_prop_models["foliage_tree_palm_bushy_3"]["heli"] = %palmtree_bushy3_sway;
    level.anim_prop_models["foliage_tree_palm_tall_2"]["still"] = %palmtree_tall2_still;
    level.anim_prop_models["foliage_tree_palm_tall_2"]["strong"] = %palmtree_tall2_sway;
    level.anim_prop_models["foliage_tree_palm_tall_2"]["heli"] = %palmtree_tall2_sway;
    level.anim_prop_models["qad_foliage_tree_palm_bushy_3"]["still"] = %palmtree_bushy3_still;
    level.anim_prop_models["qad_foliage_tree_palm_bushy_3"]["strong"] = %palmtree_bushy3_sway;
    level.anim_prop_models["qad_foliage_tree_palm_bushy_3"]["heli"] = %palmtree_bushy3_sway;
    level.anim_prop_models["h1_foliage_backlot_palm_tree_heliwash"]["still"] = %h1_foliage_backlot_palm_tree_heliwash_still;
    level.anim_prop_models["h1_foliage_backlot_palm_tree_heliwash"]["strong"] = %h1_foliage_backlot_palm_tree_heliwash_sway;
    level.anim_prop_models["h1_foliage_backlot_palm_tree_heliwash"]["heli"] = %h1_foliage_backlot_palm_tree_heliwash_wash;
    level.anim_prop_models["h1_mwr_foliage_tree_palm_tall_2_heliwash"]["still"] = %h1_foliage_backlot_palm_tree_02_hero_still;
    level.anim_prop_models["h1_mwr_foliage_tree_palm_tall_2_heliwash"]["strong"] = %h1_foliage_backlot_palm_tree_02_hero_sway;
    level.anim_prop_models["h1_mwr_foliage_tree_palm_tall_2_heliwash"]["heli"] = %h1_foliage_backlot_palm_tree_02_hero_heliwash;
}

#using_animtree("script_model");

statue_shattering_anim()
{
    level.scr_animtree["exploder_script_model"] = #animtree;
    level.scr_anim["exploder_script_model"]["h1_statue_shattering_anim"] = %h1_statue_shattering_anim;
}

#using_animtree("animated_props");

crane_anims()
{
    level.scr_animtree["crane"] = #animtree;
    level.scr_anim["crane"]["crane_idle"][0] = %h1_dam_chinese_crane_idle;
    level.scr_anim["crane"]["crane_fall"] = %h1_dam_chinese_crane_fall;
}

#using_animtree("script_model");

scaffold_collapse_anims()
{
    level.scr_animtree["exploder_script_model"] = #animtree;
    level.scr_anim["exploder_script_model"]["h1_airlift_scaffold_red_05_dest_anim"] = %h1_airlift_scaffold_red_05_dest_anim;
    level.scr_anim["exploder_script_model"]["h1_airlift_scaffold_red_04_dest_anim"] = %h1_airlift_scaffold_red_04_dest_anim;
    level.scr_anim["exploder_script_model"]["h1_airlift_scaffold_red_03_dest_anim"] = %h1_airlift_scaffold_red_03_dest_anim;
    level.scr_anim["exploder_script_model"]["h1_airlift_scaffold_red_02_dest_anim"] = %h1_airlift_scaffold_red_02_dest_anim;
    level.scr_anim["exploder_script_model"]["h1_airlift_scaffold_red_01_dest_anim"] = %h1_airlift_scaffold_red_01_dest_anim;
}
