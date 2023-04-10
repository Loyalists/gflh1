// H1 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

main()
{
    setup_exploder_anims();
    anims();
    dialogue();
    player_rappel();
    script_models();
    animated_model_setup();
}

#using_animtree("generic_human");

anims()
{
    level.scr_anim["frnd"]["spin"] = %combatwalk_f_spin;
    level.scr_anim["frnd"]["AT4_fire_start"] = %launchfacility_a_at4_fire;
    level.scr_anim["frnd"]["AT4_fire"] = %launchfacility_a_at4_fire;
    level.scr_anim["frnd"]["AT4_idle"][0] = %corner_standr_alert_idle;
    level.scr_anim["frnd"]["RPG_conceal_idle_start"] = %rpg_conceal_idle;
    level.scr_anim["frnd"]["RPG_conceal_idle"][0] = %rpg_conceal_idle;
    level.scr_anim["frnd"]["RPG_conceal_2_standR"] = %rpg_conceal_2_standr;
    level.scr_anim["frnd"]["RPG_stand_idle"][0] = %rpg_stand_idle;
    level.scr_anim["frnd"]["RPG_stand_fire"] = %rpg_stand_fire;
    level.scr_anim["frnd"]["RPG_standR_2_conceal"] = %rpg_standr_2_conceal;
    level.scr_anim["frnd"]["RPG_stand_aim_2"] = %rpg_stand_aim_2;
    level.scr_anim["frnd"]["RPG_stand_aim_4"] = %rpg_stand_aim_4;
    level.scr_anim["frnd"]["RPG_stand_aim_5"] = %rpg_stand_aim_5;
    level.scr_anim["frnd"]["RPG_stand_aim_6"] = %rpg_stand_aim_6;
    level.scr_anim["frnd"]["RPG_stand_aim_8"] = %rpg_stand_aim_8;
    level.scr_anim["frnd"]["C4_gate_plant_start"] = %launchfacility_a_c4_plant;
    level.scr_anim["frnd"]["C4_gate_plant"] = %launchfacility_a_c4_plant;
    level.scr_anim["frnd"]["C4_plant_start"] = %explosive_plant_knee;
    level.scr_anim["frnd"]["C4_plant"] = %explosive_plant_knee;
    level.scr_anim["frnd"]["saw_1_start"] = %launchfacility_a_saw_1;
    level.scr_anim["frnd"]["saw_2_start"] = %launchfacility_a_saw_2;
    level.scr_anim["frnd"]["saw_1"] = %launchfacility_a_saw_1;
    level.scr_anim["frnd"]["saw_2"] = %launchfacility_a_saw_2;
    level.scr_anim["frnd"]["saw_1_object"] = %launchfacility_a_saw_1_object;
    level.scr_anim["frnd"]["saw_2_object"] = %launchfacility_a_saw_2_object;
    maps\_anim::addnotetrack_customfunction( "frnd", "saw_pickup", maps\launchfacility_a::saw_notify_pickup, "saw_1" );
    maps\_anim::addnotetrack_customfunction( "frnd", "start_sparks", maps\launchfacility_a::saw_notify_start, "saw_1" );
    maps\_anim::addnotetrack_customfunction( "frnd", "stop", maps\launchfacility_a::saw_notify_stop, "saw_1" );
    maps\_anim::addnotetrack_customfunction( "frnd", "switch", maps\launchfacility_a::saw_notify_switch, "saw_1" );
    maps\_anim::addnotetrack_customfunction( "frnd", "saw_pickup", maps\launchfacility_a::saw_notify_pickup, "saw_2" );
    maps\_anim::addnotetrack_customfunction( "frnd", "start_sparks", maps\launchfacility_a::saw_notify_start, "saw_2" );
    maps\_anim::addnotetrack_customfunction( "frnd", "stop", maps\launchfacility_a::saw_notify_stop, "saw_2" );
    maps\_anim::addnotetrack_customfunction( "frnd", "switch", maps\launchfacility_a::saw_notify_switch, "saw_2" );
    level.scr_anim["frnd"]["rappel_setup_start"] = %launchfacility_a_setup_idle_1;
    level.scr_anim["frnd"]["rappel_setup_to_stand_1"] = %launchfacility_a_setup_2_rappel_1;
    level.scr_anim["frnd"]["rappel_setup_to_stand_2"] = %launchfacility_a_setup_2_rappel_2;
    level.scr_anim["frnd"]["rappel_stand_idle_1"][0] = %launchfacility_a_rappel_idle_1;
    level.scr_anim["frnd"]["rappel_stand_idle_2"][0] = %launchfacility_a_rappel_idle_2;
    level.scr_anim["frnd"]["rappel_stand_idle_3"][0] = %launchfacility_a_rappel_idle_3;
    level.scr_anim["frnd"]["rappel_drop"] = %launchfacility_a_rappel_1;
}

dialogue()
{
    level.scr_sound["launchfacility_a_rul_highalert"] = "launchfacility_a_rul_highalert";
    level.scr_sound["launchfacility_a_rul_underattack"] = "launchfacility_a_rul_underattack";
    level.scr_sound["launchfacility_a_rul_redspentznaz"] = "launchfacility_a_rul_redspentznaz";
    level.scr_sound["launchfacility_a_rul_preptubes"] = "launchfacility_a_rul_preptubes";
    level.scr_sound["launchfacility_a_rul_motherland"] = "launchfacility_a_rul_motherland";
    level.scr_sound["launchfacility_a_rul_avengefallen"] = "launchfacility_a_rul_avengefallen";
    level.scr_sound["launchfacility_a_rul_restorehonor"] = "launchfacility_a_rul_restorehonor";
    level.scr_radio["launchfacility_a_hqr_stillworking"] = "launchfacility_a_hqr_stillworking";
    level.scr_radio["launchfacility_a_hqradio_activity"] = "launchfacility_a_hqr_heavyactivity";
    level.scr_sound["frnd"]["launchfacility_a_price_tarfu"] = "launchfacility_a_us_lead_statustarfu";
    level.scr_sound["frnd"]["launchfacility_a_price_at4_prep"] = "launchfacility_a_us_lead_coversblown";
    level.scr_radio["launchfacility_a_marine_01_at4_prep"] = "launchfacility_a_gm2_lastround";
    level.scr_radio["launchfacility_a_cmd_highalert"] = "launchfacility_a_hqr_stillworking";
    level.scr_sound["frnd"]["launchfacility_a_marine1_chopper"] = "launchfacility_a_gm1_hind12oclock";
    level.scr_radio["launchfacility_a_marine2_killchopper"] = "launchfacility_a_gm2_igothim";
    level.scr_sound["frnd"]["launchfacility_a_price_gogogo1"] = "launchfacility_a_us_lead_gogogo";
    level.scr_sound["frnd"]["launchfacility_a_griggs_moreground"] = "launchfacility_a_grg_groundsupport";
    level.scr_sound["frnd"]["launchfacility_a_price_alreadygot"] = "launchfacility_a_us_lead_alreadygot";
    level.scr_radio["launchfacility_a_recon_sniperteamtwo"] = "launchfacility_a_gm4_team2inposition";
    level.scr_sound["frnd"]["launchfacility_a_price_keepposted"] = "launchfacility_a_us_lead_keepposted";
    level.scr_radio["launchfacility_a_recon_enemiestonorth"] = "launchfacility_a_gm4_hostileslightarmor";
    level.scr_sound["frnd"]["launchfacility_a_price_smoke_nag_01"] = "launchfacility_a_us_lead_throwsmoke";
    level.scr_sound["frnd"]["launchfacility_a_grigsby_smoke_nag_01"] = "launchfacility_a_grg_popsmoke";
    level.scr_sound["frnd"]["launchfacility_a_marine_01_throwing_smoke"] = "launchfacility_a_gm2_poppinsmoke";
    level.scr_radio["launchfacility_a_marine_01_blowing_bmp"] = "launchfacility_a_gm1_chargesplaced";
    level.scr_radio["launchfacility_a_recon_enemies_coming"] = "launchfacility_a_gm4_fullplatoon";
    level.scr_radio["launchfacility_a_cmd_sitrep"] = "launchfacility_a_hqr_sitrep";
    level.scr_sound["frnd"]["launchfacility_a_price_were_inside"] = "launchfacility_a_us_lead_wereinside";
    level.scr_sound["frnd"]["launchfacility_a_pri_breachgate"] = "launchfacility_a_pri_breachgate";
    level.scr_sound["frnd"]["launchfacility_a_marine1_gate_blow"] = "launchfacility_a_gm1_coverme";
    level.scr_sound["frnd"]["launchfacility_a_marine2_gate_getback"] = "launchfacility_a_gm1_getback";
    level.scr_sound["frnd"]["launchfacility_a_marine2_fireinhole"] = "launchfacility_a_gm1_fireinthehole";
    level.scr_sound["frnd"]["launchfacility_a_price_tothetarmac"] = "launchfacility_a_us_lead_throughthegate";
    level.scr_sound["frnd"]["launchfacility_a_griggs_morebmps"] = "launchfacility_a_grg_morebmps";
    level.scr_sound["frnd"]["launchfacility_a_price_knockemout"] = "launchfacility_a_us_lead_knockemout";
    level.scr_sound["frnd"]["launchfacility_a_griggs_userpghint"] = "launchfacility_a_grg_eyesopen";
    level.scr_sound["frnd"]["launchfacility_a_griggs_vehicles_hint_01"] = "launchfacility_a_grg_takeoutbmps";
    level.scr_radio["launchfacility_a_friendlies_east"] = "launchfacility_a_gm3_checktargets";
    level.scr_sound["frnd"]["launchfacility_a_price_copyteamthree"] = "launchfacility_a_us_lead_northtarmac";
    level.scr_radio["launchfacility_a_gm3_cutvents"] = "launchfacility_a_gm3_cutvents";
    level.scr_radio["launchfacility_a_gm1_cutting"] = "launchfacility_a_gm1_cutting";
    level.scr_sound["frnd"]["launchfacility_a_gm1_incoming"] = "launchfacility_a_gm1_incoming";
    level.scr_radio["launchfacility_a_recon_two_helis"] = "launchfacility_a_gm4_getouttasight";
    level.scr_sound["frnd"]["launchfacility_a_price_ropesout_01"] = "launchfacility_a_us_lead_hookup";
    level.scr_radio["launchfacility_a_marine2_rappelling"] = "launchfacility_a_gm2_rappellingnow";
    level.scr_radio["launchfacility_a_marine3_teamin"] = "launchfacility_a_gm3_teaminside";
    level.scr_radio["launchfacility_a_gm3_rapellingnow"] = "launchfacility_a_gm3_rapellingnow";
    level.launchfacility_a_price_bmp_nag_max = 8;
    level.launchfacility_a_price_bmp_nag_number = randomintrange( 1, level.launchfacility_a_price_bmp_nag_max + 1 );
    level.scr_sound["frnd"]["launchfacility_a_price_bmp_nag_01"] = "launchfacility_a_us_lead_c4chargebmp";
    level.scr_sound["frnd"]["launchfacility_a_price_bmp_nag_02"] = "launchfacility_a_us_lead_takeoutbmp";
    level.scr_sound["frnd"]["launchfacility_a_price_bmp_nag_03"] = "launchfacility_a_pri_pinneddown";
    level.scr_sound["frnd"]["launchfacility_a_price_bmp_nag_04"] = "launchfacility_a_sas1_killingus";
    level.scr_sound["frnd"]["launchfacility_a_price_bmp_nag_05"] = "launchfacility_a_pri_c4onarmor";
    level.scr_sound["frnd"]["launchfacility_a_price_bmp_nag_06"] = "launchfacility_a_pri_findrpg";
    level.scr_sound["frnd"]["launchfacility_a_price_bmp_nag_07"] = "launchfacility_a_grg_bulletsgrenades";
    level.scr_sound["frnd"]["launchfacility_a_price_bmp_nag_08"] = "launchfacility_a_grg_getclose";
    level.launchfacility_a_price_ropenag_max = 6;
    level.launchfacility_a_price_ropenag_number = randomintrange( 1, level.launchfacility_a_price_ropenag_max + 1 );
    level.scr_sound["frnd"]["launchfacility_a_price_ropenag_01"] = "launchfacility_a_us_lead_hookupgo";
    level.scr_sound["frnd"]["launchfacility_a_price_ropenag_02"] = "launchfacility_a_pri_hookupmidvent";
    level.scr_sound["frnd"]["launchfacility_a_price_ropenag_03"] = "launchfacility_a_pri_letsmovemidvent";
    level.scr_sound["frnd"]["launchfacility_a_price_ropenag_04"] = "launchfacility_a_pri_overhere";
    level.scr_sound["frnd"]["launchfacility_a_price_ropenag_05"] = "launchfacility_a_pri_hookupsecvent";
    level.scr_sound["frnd"]["launchfacility_a_price_ropenag_06"] = "launch_a_gaz_downvents";
    level.scr_radio["launchfacility_a_sas2_bloodyhell"] = "launchfacility_a_sas2_bloodyhell";
    level.scr_radio["launchfacility_a_price_inside_facility"] = "launchfacility_a_us_lead_okwerein";
    level.dialoguesniperconfirm_max = 6;
    level.dialoguesniperconfirm_number = randomintrange( 1, level.dialoguesniperconfirm_max + 1 );
    level.scr_radio["launchfacility_a_sniper_confirm_01"] = "launchfacility_a_sn1_gothim";
    level.scr_radio["launchfacility_a_sniper_confirm_02"] = "launchfacility_a_sn1_gotyourback";
    level.scr_radio["launchfacility_a_sniper_confirm_03"] = "launchfacility_a_sn1_thatsakill";
    level.scr_radio["launchfacility_a_sniper_confirm_04"] = "launchfacility_a_sn2_targetdown";
    level.scr_radio["launchfacility_a_sniper_confirm_05"] = "launchfacility_a_sn2_keepyoucovered";
    level.scr_radio["launchfacility_a_sniper_confirm_06"] = "launchfacility_a_sn2_confirmed";
    level.dialoguegatehint_max = 9;
    level.dialoguegatehint_number = randomintrange( 1, level.dialoguegatehint_max + 1 );
    level.scr_radio["launchfacility_a_gate_hint_01"] = "launchfacility_a_gm1_gateblocked";
    level.scr_radio["launchfacility_a_gate_hint_02"] = "launchfacility_a_gm1_gateblocked";
    level.scr_radio["launchfacility_a_gate_hint_03"] = "launchfacility_a_gm1_headright";
    level.scr_radio["launchfacility_a_gate_hint_04"] = "launchfacility_a_sas1_headright";
    level.scr_radio["launchfacility_a_gate_hint_05"] = "launchfacility_a_pri_uprightside";
    level.scr_radio["launchfacility_a_gate_hint_06"] = "launchfacility_a_gm1_wayisblocked";
    level.scr_radio["launchfacility_a_gate_hint_07"] = "launchfacility_a_sas1_leftblocked";
    level.scr_radio["launchfacility_a_gate_hint_08"] = "launchfacility_a_pri_throughgate";
    level.scr_radio["launchfacility_a_gate_hint_09"] = "launchfacility_a_pri_leftgateblocked";
    level.dialoguerpghit_max = 2;
    level.dialoguerpghit_number = randomintrange( 1, level.dialoguerpghit_max + 1 );
    level.scr_radio["launchfacility_a_rpg_hit_01"] = "launchfacility_a_gm2_thatsahit";
    level.scr_radio["launchfacility_a_rpg_hit_02"] = "launchfacility_a_gm3_hitagain";
    level.dialoguerpggoodshot_max = 4;
    level.dialoguerpggoodshot_number = randomintrange( 1, level.dialoguerpghit_max + 1 );
    level.scr_radio["launchfacility_a_rpg_kill_01"] = "launchfacility_a_gm1_nicework";
    level.scr_radio["launchfacility_a_rpg_kill_02"] = "launchfacility_a_gm2_bmpshistory";
    level.scr_radio["launchfacility_a_rpg_kill_03"] = "launch_a_gaz_goodshot";
    level.scr_radio["launchfacility_a_rpg_kill_04"] = "launch_a_gaz_niceone";
    level.dialoguejavelingoodshot_max = 2;
    level.dialoguejavelingoodshot_number = randomintrange( 1, level.dialoguejavelingoodshot_max + 1 );
    level.scr_radio["launchfacility_a_javelin_kill_01"] = "launchfacility_a_gm3_hellyeah";
    level.scr_radio["launchfacility_a_javelin_kill_02"] = "launchfacility_a_gm3_fniceshot";
}

setup_exploder_anims()
{
    level.exploder_animtrees = [];
    level.exploder_animtrees[0] = "exploder_script_model";
}

#using_animtree("player");

player_rappel()
{
    level.scr_anim["player_rappel"]["rappel"] = %launchfacility_a_player_rappel;
    level.scr_animtree["player_rappel"] = #animtree;
    level.scr_model["player_rappel"] = "h2_gfl_m4_sopmod_ii_viewbody";
    maps\_anim::addnotetrack_animsound( "player_rappel", "rappel", "start", "rappel_liftrope_clipin_npc" );
}

#using_animtree("script_model");

script_models()
{
    precachemodel( "rappelrope100_le" );
    level.scr_anim["player_rope"]["rappel_for_player_start"] = %launchfacility_a_player_rappel_100ft_rope;
    level.scr_anim["player_rope"]["rappel_idle_for_player"][0] = %launchfacility_a_player_rappel_idle_100ft_rope;
    level.scr_anim["player_rope"]["rappel_for_player"] = %launchfacility_a_player_rappel_100ft_rope;
    level.scr_animtree["player_rope"] = #animtree;
    level.scr_model["player_rope"] = "rappelrope100_le";
    precachemodel( "rappelrope100_ri" );
    level.scr_animtree["rope"] = #animtree;
    level.scr_model["rope"] = "rappelrope100_ri";
    level.scr_anim["rope"]["rappel_setup_start"] = %launchfacility_a_setup_2_rappel_1_100ft_rope;
    level.scr_anim["rope"]["rappel_setup_to_stand_1"] = %launchfacility_a_setup_2_rappel_1_100ft_rope;
    level.scr_anim["rope"]["rappel_setup_to_stand_2"] = %launchfacility_a_setup_2_rappel_2_100ft_rope;
    level.scr_anim["rope"]["rappel_stand_idle_1"][0] = %launchfacility_a_rappel_idle_1_100ft_rope;
    level.scr_anim["rope"]["rappel_stand_idle_2"][0] = %launchfacility_a_rappel_idle_2_100ft_rope;
    level.scr_anim["rope"]["rappel_stand_idle_3"][0] = %launchfacility_a_rappel_idle_3_100ft_rope;
    level.scr_anim["rope"]["rappel_drop"] = %launchfacility_a_rappel_1_100ft_rope;
    level.scr_animtree["exploder_script_model"] = #animtree;
    level.scr_anim["exploder_script_model"]["h1_wall_breach_truck0_anim"] = %h1_wall_breach_truck0_anim;
    level.scr_anim["exploder_script_model"]["h1_wall_breach_truck1_anim"] = %h1_wall_breach_truck1_anim;
    level.scr_anim["exploder_script_model"]["h1_wall_breach_truck2_anim"] = %h1_wall_breach_truck2_anim;
    level.scr_anim["exploder_script_model"]["h1_launchfacility_a_gate_broken_anim"] = %h1_launchfacility_a_gate_broken_anim;
}

#using_animtree("animated_props");

animated_model_setup()
{
    level.anim_prop_models["foliage_birch_tree_b_green_hero"]["still"] = %foliage_birch_tree_hero_still;
    level.anim_prop_models["foliage_birch_tree_b_green_hero"]["strong"] = %foliage_birch_tree_hero_sway;
    level.anim_prop_models["foliage_birch_tree_b_green_hero"]["heli"] = %foliage_birch_tree_hero_heliwash;
    level.anim_prop_models["h1_tree_pine_evergreen_03_hero"]["still"] = %h1_tree_pine_evergreen_03_hero_still;
    level.anim_prop_models["h1_tree_pine_evergreen_03_hero"]["strong"] = %h1_tree_pine_evergreen_03_hero_sway;
    level.anim_prop_models["h1_tree_pine_evergreen_03_hero"]["heli"] = %h1_tree_pine_evergreen_03_hero_heliwash;
}
