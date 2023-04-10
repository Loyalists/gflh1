// H1 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

main()
{
    setup_exploder_anims();
    main_anim();
    animated_palm_trees_setup();
}

#using_animtree("generic_human");

main_anim()
{
    level.scr_sound["price"]["stand_down"] = "armada_pri_allteamsstanddown";
    level.scr_sound["price"]["roger_hq"] = "armada_pri_rogerhq";
    level.scr_sound["price"]["heads_up"] = "armada_pri_headsup";
    level.scr_sound["generic"]["tvstation"] = "armada_gm1_tvstation";
    level.scr_sound["generic"]["breaching_breaching"] = "armada_gm1_breachingbreaching";
    level.scr_sound["price"]["jeepride_pri_helistatus"] = "jeepride_pri_helistatus";
    level.scr_sound["price"]["jeepride_pri_notgood"] = "jeepride_pri_notgood";
    level.scr_sound["price"]["jeepride_pri_lockandload"] = "jeepride_pri_lockandload";
    level.scr_sound["price"]["jeepride_pri_bmprear"] = "jeepride_pri_bmprear";
    level.scr_sound["price"]["jeepride_pri_bmpright"] = "jeepride_pri_bmpright";
    level.scr_sound["price"]["jeepride_pri_bmpleft"] = "jeepride_pri_bmpleft";
    level.scr_sound["price"]["jeepride_pri_bmpfront"] = "jeepride_pri_bmpfront";
    level.scr_sound["price"]["jeepride_pri_hind6oclock"] = "jeepride_pri_hind6oclock";
    level.scr_sound["price"]["jeepride_pri_hind9oclock"] = "jeepride_pri_hind9oclock";
    level.scr_sound["price"]["jeepride_pri_hind3oclock"] = "jeepride_pri_hind3oclock";
    level.scr_sound["price"]["jeepride_pri_hinddeadahead"] = "jeepride_pri_hinddeadahead";
    level.scr_sound["price"]["jeepride_pri_grabrpg"] = "jeepride_pri_grabrpg";
    level.scr_sound["price"]["jeepride_pri_letsgetfire"] = "jeepride_pri_letsgetfire";
    level.scr_sound["price"]["jeepride_pri_openfire"] = "jeepride_pri_openfire";
    level.scr_sound["price"]["jeepride_pri_takehimout"] = "jeepride_pri_takehimout";
    level.scr_sound["price"]["jeepride_pri_firefire"] = "jeepride_pri_firefire";
    level.scr_sound["price"]["jeepride_pri_takehimdown"] = "jeepride_pri_takehimdown";
    level.scr_sound["price"]["jeepride_pri_company"] = "jeepride_pri_company";
    level.scr_sound["price"]["jeepride_pri_truckleft"] = "jeepride_pri_truckleft";
    level.scr_sound["price"]["jeepride_pri_truckright"] = "jeepride_pri_truckright";
    level.scr_sound["price"]["jeepride_pri_truck12oclock"] = "jeepride_pri_truck12oclock";
    level.scr_sound["price"]["jeepride_pri_getoffyour"] = "jeepride_pri_getoffyour";
    level.scr_sound["price"]["jeepride_pri_fireontruck"] = "jeepride_pri_fireontruck";
    level.scr_sound["price"]["jeepride_pri_shootthattruck"] = "jeepride_pri_shootthattruck";
    level.scr_sound["price"]["jeepride_pri_goodshot"] = "jeepride_pri_goodshot";
    level.scr_sound["price"]["jeepride_pri_wegothim"] = "jeepride_pri_wegothim";
    level.scr_sound["price"]["jeepride_pri_damaged"] = "jeepride_pri_damaged";
    level.scr_sound["price"]["jeepride_pri_watchyour6"] = "jeepride_pri_watchyour6";
    level.scr_sound["price"]["jeepride_pri_coverfront"] = "jeepride_pri_coverfront";
    level.scr_sound["price"]["jeepride_pri_coverflanks"] = "jeepride_pri_coverflanks";
    level.scr_sound["price"]["jeepride_pri_coverrear"] = "jeepride_pri_coverrear";
    level.scr_sound["price"]["jeepride_pri_buggered"] = "jeepride_pri_buggered";
    level.scr_sound["price"]["jeepride_pri_sitreponhelis"] = "jeepride_pri_sitreponhelis";
    level.scr_sound["price"]["jeepride_pri_thebridge"] = "jeepride_pri_thebridge";
    level.scr_sound["friendguy"]["jeepride_gaz_boxingin"] = "jeepride_gaz_boxingin";
    level.scr_sound["friendguy"]["jeepride_gaz_takecareofit"] = "jeepride_gaz_takecareofit";
    level.scr_sound["hq"]["jeepride_hqr_griggsisnthere"] = "jeepride_hqr_griggsisnthere";
    level.scr_sound["griggs"]["jeepride_grg_hangon"] = "jeepride_grg_hangon";
    level.scr_sound["griggs"]["jeepride_grg_bmpbehind"] = "jeepride_grg_bmpbehind";
    level.scr_sound["griggs"]["jeepride_grg_bmpright"] = "jeepride_grg_bmpright";
    level.scr_sound["griggs"]["jeepride_grg_bmpleft"] = "jeepride_grg_bmpleft";
    level.scr_sound["griggs"]["jeepride_grg_bmp12oclock"] = "jeepride_grg_bmp12oclock";
    level.scr_sound["griggs"]["jeepride_grg_hindbehind"] = "jeepride_grg_hindbehind";
    level.scr_sound["griggs"]["jeepride_grg_hind9oclock"] = "jeepride_grg_hind9oclock";
    level.scr_sound["griggs"]["jeepride_grg_hind3oclock"] = "jeepride_grg_hind3oclock";
    level.scr_sound["griggs"]["jeepride_grg_hind12oclock"] = "jeepride_grg_hind12oclock";
    level.scr_sound["griggs"]["jeepride_grg_rpgfirehind"] = "jeepride_grg_rpgfirehind";
    level.scr_sound["griggs"]["jeepride_grg_hithelicopter"] = "jeepride_grg_hithelicopter";
    level.scr_sound["griggs"]["jeepride_grg_rpgontruck"] = "jeepride_grg_rpgontruck";
    level.scr_sound["griggs"]["jeepride_grg_takemout"] = "jeepride_grg_takemout";
    level.scr_sound["griggs"]["jeepride_grg_anotherrpg"] = "jeepride_grg_anotherrpg";
    level.scr_sound["griggs"]["jeepride_grg_hostilerpg"] = "jeepride_grg_hostilerpg";
    level.scr_sound["griggs"]["jeepride_grg_truck6oclock"] = "jeepride_grg_truck6oclock";
    level.scr_sound["griggs"]["jeepride_grg_truck3oclock"] = "jeepride_grg_truck3oclock";
    level.scr_sound["griggs"]["jeepride_grg_truck9oclock"] = "jeepride_grg_truck9oclock";
    level.scr_sound["griggs"]["jeepride_grg_truckdeadahead"] = "jeepride_grg_truckdeadahead";
    level.scr_sound["griggs"]["jeepride_grg_killfirm"] = "jeepride_grg_killfirm";
    level.scr_sound["griggs"]["jeepride_grg_niceshootin"] = "jeepride_grg_niceshootin";
    level.scr_sound["griggs"]["jeepride_grg_success"] = "jeepride_grg_success";
    level.scr_sound["griggs"]["jeepride_grg_thatsahit"] = "jeepride_grg_thatsahit";
    level.scr_sound["griggs"]["jeepride_grg_devastation"] = "jeepride_grg_devastation";
    level.scr_sound["griggs"]["jeepride_grg_bouttocollapse"] = "jeepride_grg_bouttocollapse";
    level.scr_sound["griggs"]["jeepride_grg_tankabouttoblow"] = "jeepride_grg_tankabouttoblow";
    level.scr_sound["griggs"]["jeepride_grg_takeoutbridge"] = "jeepride_grg_takeoutbridge";
    level.scr_sound["gaz"]["jeepride_gaz_heavyattackbridge"] = "jeepride_gaz_heavyattackbridge";
    level.scr_sound["gaz"]["jeepride_gaz_uselesswanker"] = "jeepride_gaz_uselesswanker";
    level.scr_sound["gaz"]["jeepride_gaz_wereonourown"] = "jeepride_gaz_wereonourown";
    level.scr_sound["gaz"]["jeepride_gaz_goodtohear"] = "jeepride_gaz_goodtohear";
    level.scr_sound["gaz"]["jeepride_gaz_goodenough"] = "jeepride_gaz_goodenough";
    level.scr_sound["gaz"]["jeepride_gaz_stopbloodytruck"] = "jeepride_gaz_stopbloodytruck";
    level.scr_sound["griggs"]["jeepride_grg_devastation"] = "jeepride_grg_devastation";
    level.scr_sound["griggs"]["jeepride_grg_devastation"] = "jeepride_grg_devastation";
    level.scr_anim["price"]["jeepride_ending_price01"] = %jeepride_ending_price;
    level.scr_anim["price"]["jeepride_ending_price02"] = %jeepride_ending_price;
    level.scr_anim["price"]["wave_player_over"] = %h1_jeepride_bridgecollapse_price;
    maps\_anim::addnotetrack_animsound( "price", "jeepride_ending_price02", "scn_price_throw_colt_to_player", "scn_price_throw_colt_to_player" );
    level.scr_anim["medic"]["jeepride_CPR_medic"] = %jeepride_cpr_medic;
    level.scr_anim["price"]["jeepride_CPR_price"] = %jeepride_cpr_price;
    level.scr_animtree["price"] = #animtree;
    level.scr_anim["griggs"]["drag_player"] = %jeepride_drag_grigsby;
    level.scr_anim["price"]["drag_player"] = %jeepride_ending_price;
    level.scr_animtree["griggs"] = #animtree;
    maps\_anim::addnotetrack_customfunction( "griggs", "drop_pistol", ::drop_pistol );
    maps\_anim::addnotetrack_customfunction( "griggs", "fire", maps\jeepride::shoot_loc );
    maps\_anim::addnotetrack_customfunction( "griggs", "scripted_weaponswitch", ::scripted_weaponswitch );
    maps\_anim::addnotetrack_customfunction( "griggs", "brain_splatter", maps\jeepride_code::shot_in_the_head );
    maps\_anim::addnotetrack_customfunction( "griggs", "brain_splatter_sfx", ::play_griggs_brain_splatter_sfx, "drag_player" );
    maps\_anim::addnotetrack_customfunction( "griggs", "fire", ::play_griggs_custom_fire_sfx, "drag_player" );
    maps\_anim::addnotetrack_startfxontag( "vehicles", "start_cabin_fire", "bettle_Crash", "fire_crash_jeepride", "tag_deathfx" );
    maps\_anim::addnotetrack_startfxontag( "vehicles", "explosion_02", "bettle_Crash", "vehicle_explosion_generic", "tag_deathfx" );
    maps\_anim::addnotetrack_customfunction( "griggs", "scn_griggs_drag_colt_empty", ::play_griggs_custom_fire_empty_sfx, "drag_player" );
    level.scr_anim["zakhaev"]["end_scene_01"] = %jeepride_zak_approach;
    level.scr_anim["zakhaev_buddy1"]["end_scene_01"] = %jeepride_lguy_approach;
    level.scr_anim["zakhaev_buddy2"]["end_scene_01"] = %jeepride_rguy_approach;
    level.scr_anim["end_friend_1"]["end_scene_01"] = %jeepride_dying_approach;
    level.scr_anim["end_friend_2"]["intopain"] = %dying_stand_2_crawl_v1;
    level.scr_anim["end_friend_3"]["intopain"] = %dying_stand_2_back_v3;
    level.scr_anim["end_friend_2"]["pain_pose"] = %dying_crawl_death_v1;
    level.scr_anim["end_friend_2"]["pain_loop"][0] = %h1_jeepride_ending_dyingsoldier;
    level.scr_anim["end_friend_3"]["pain_loop"][0] = %jeepride_dying_back_idle;
    level.scr_anim["end_friend_3"]["pain_loop"][1] = %jeepride_dying_back_idle;
    level.scr_anim["ru1"]["player_pickup"] = %jeepride_player_pickup_guy1;
    level.scr_anim["ru2"]["player_pickup"] = %jeepride_player_pickup_guy2;
    maps\_anim::addnotetrack_dialogue( "ru2", "dialog", "player_pickup", "jeepride_ru2_allrightmyfriend" );
    maps\_anim::addnotetrack_dialogue( "ru2", "dialog", "player_pickup", "jeepride_ru2_gethimoutofhere" );
    maps\_anim::addnotetrack_sound( "ru1", "scn_jeepride_player_pickup_guy1_foley", "player_pickup", "scn_jeepride_player_pickup_guy1_foley" );
    maps\_anim::addnotetrack_sound( "ru2", "scn_jeepride_player_pickup_guy2_foley", "player_pickup", "scn_jeepride_player_pickup_guy2_foley" );
    level.scr_anim["zakhaev"]["end_scene_02"] = %jeepride_zak_end;
    level.scr_anim["zakhaev_buddy1"]["end_scene_02"] = %jeepride_lguy_end;
    level.scr_anim["zakhaev_buddy2"]["end_scene_02"] = %jeepride_rguy_end;
    level.scr_anim["generic"]["patrol_walk"] = %patrol_bored_patrolwalk;
    level.scr_anim["generic"]["patrol_walk_twitch"] = %patrol_bored_patrolwalk_twitch;
    level.scr_anim["generic"]["patrol_stop"] = %patrol_bored_walk_2_bored;
    level.scr_anim["generic"]["patrol_start"] = %patrol_bored_2_walk;
    level.scr_anim["generic"]["patrol_turn180"] = %patrol_bored_2_walk_180turn;
    level.scr_anim["generic"]["patrol_idle_1"] = %patrol_bored_idle;
    level.scr_anim["generic"]["patrol_idle_2"] = %patrol_bored_idle_smoke;
    level.scr_anim["generic"]["patrol_idle_3"] = %patrol_bored_idle_cellphone;
    level.scr_anim["generic"]["patrol_idle_4"] = %patrol_bored_twitch_bug;
    level.scr_anim["generic"]["patrol_idle_5"] = %patrol_bored_twitch_checkphone;
    level.scr_anim["generic"]["patrol_idle_6"] = %patrol_bored_twitch_stretch;
    level.scr_anim["generic"]["patrol_idle_smoke"] = %patrol_bored_idle_smoke;
    level.scr_anim["generic"]["patrol_idle_checkphone"] = %patrol_bored_twitch_checkphone;
    level.scr_anim["generic"]["patrol_idle_stretch"] = %patrol_bored_twitch_stretch;
    level.scr_anim["generic"]["patrol_idle_phone"] = %patrol_bored_idle_cellphone;
    level.scr_anim["generic"]["patrol_jog"] = %patrol_jog;
    level.scr_anim["generic"]["combat_jog"] = %combat_jog;
    level.scr_anim["generic"]["patrol_jog_turn180"] = %patrol_jog_360;
    level.scr_anim["generic"]["stealth_jog"] = %patrol_jog;
    level.scr_anim["generic"]["stealth_walk"] = %patrol_bored_patrolwalk;
    level.scr_anim["price"]["rpgfromgriggs_price"] = %h1_jeepride_rpgfromgriggs_price;
    level.scr_anim["generic"]["rpgfromgriggs_price_idle"] = %uaz_lguy_idle_hide;
    level.scr_anim["griggs"]["rpgfromgriggs_griggs"] = %h1_jeepride_rpgfromgriggs_griggs;
    level.scr_anim["generic"]["rpgfromgriggs_griggs_idle"] = %uaz_rguy_idle;
    maps\_anim::addnotetrack_customfunction( "griggs", "drop_rpg", maps\jeepride::remove_rpg_models, "rpgfromgriggs_griggs" );
    vehicle_anims();
    player_anims();
    thread cliff_collapse_anim();
    bridge_animation();
}

setup_exploder_anims()
{
    level.exploder_animtrees = [];
    level.exploder_animtrees[0] = "exploder_script_model";
}

scripted_weaponswitch( var_0 )
{
    var_0 attach( "weapon_saw", "tag_weapon_right" );
    var_0.scriptedweapon = "saw";
}

drop_pistol( var_0 )
{
    var_1 = "tag_weapon_right";
    var_2 = var_0 gettagorigin( var_1 );
    wait 0.2;
    var_3 = spawn( "script_model", var_0 gettagorigin( var_1 ) );
    var_3 setmodel( "weapon_colt1911_white" );
    var_3.angles = var_0 gettagorigin( var_1 );
    var_3 physicslaunchclient( var_3.origin + ( 0.0, 0.0, 0.0 ), maps\_utility::vector_multiply( var_3.origin - var_2, 25 ) );
}

play_griggs_brain_splatter_sfx( var_0 )
{
    var_0 thread maps\_utility::play_sound_on_tag( "scn_griggs_shot_in_the_head", "TAG_EYE" );
}

play_griggs_custom_fire_sfx( var_0 )
{
    if ( isdefined( var_0.scriptedweapon ) && var_0.scriptedweapon == "wpn_h1_pst_m1911_vm" )
        var_0.scriptedweaponmodel thread maps\_utility::play_sound_on_tag( "scn_griggs_drag_colt_shot", "TAG_FLASH" );
    else
        var_0 thread maps\_utility::play_sound_on_tag( "scn_griggs_drag_saw_shot", "TAG_FLASH" );
}

play_griggs_custom_fire_empty_sfx( var_0 )
{
    var_0.scriptedweaponmodel thread maps\_utility::play_sound_on_tag( "scn_griggs_drag_colt_empty", "TAG_FLASH" );
}

#using_animtree("player");

player_anims()
{
    level.scr_anim["playerview"]["drag_player"] = %jeepride_drag_player;
    level.scr_anim["playerview"]["player_pickup"] = %jeepride_player_pickup_player;
    level.scr_anim["playerview"]["drag_player_wait"] = %h1_jeepride_drag_player_wait;
    level.scr_model["playerview"] = "h2_gfl_m4_sopmod_ii_viewbody";
    level.scr_animtree["playerview"] = #animtree;
    level.scr_anim["playerview"]["player_bridge"] = %h1_jeepride_bridgeexplosion_wakeup;
    level.scr_anim["playerview"]["player_bridgeexplosion"] = %h1_jeepride_beforeexplosion_player;
    level.scr_anim["playerview"]["player_bridge_mantle"] = %h1_jeepride_bridgecollapse_mantle;
}

#using_animtree("vehicles");

vehicle_anims()
{
    level.scr_anim["mi28"]["end_scene_01"] = %jeepride_mi28_flyby;
    level.scr_animtree["mi28"] = #animtree;
    level.jeepride_crash_model = [];
    level.jeepride_crash_anim["Jeepride_crash_tunnel_pickup"] = %jeepride_crash_pillar;
    level.jeepride_crash_model["Jeepride_crash_tunnel_pickup"] = "vehicle_pickup_tankcrush";
    level.jeepride_crash_animtree["Jeepride_crash_tunnel_pickup"] = #animtree;
    level.jeepride_crash_anim["Jeepride_crash_tunnel_pickup2"] = %jeepride_flip_pickup;
    level.jeepride_crash_model["Jeepride_crash_tunnel_pickup2"] = "vehicle_pickup_4door";
    level.jeepride_crash_animtree["Jeepride_crash_tunnel_pickup2"] = #animtree;
    level.scr_animtree["vehicles"] = #animtree;
    level.scr_anim["vehicles"]["crossroad_crash"] = %h1_jeepride_truck_crash_woodbeam;
    level.scr_anim["vehicles"]["truck_tanker_crash"] = %h1_jeepride_truck_crash_tanker_bm21;
    level.scr_anim["vehicles"]["tanker_tanker_crash"] = %h1_jeepride_truck_crash_tanker_tanker;
    level.scr_anim["vehicles"]["tunnel_crash_truck01"] = %h1_jeepride_truck_crash_tunnel_truck01;
    level.scr_anim["vehicles"]["tunnel_crash_truck02"] = %h1_jeepride_truck_crash_tunnel_truck02;
    level.scr_anim["vehicles"]["drift_01"] = %h1_jeepride_civillian_car_drift01;
    level.scr_anim["vehicles"]["three_crash"] = %h1_civilian_car_treecrash;
    level.scr_anim["vehicles"]["heli_crash"] = %h1_jeepride_crashheli_ending;
    level.scr_anim["vehicles"]["bettle_Crash"] = %h1_civilian_beetle_explosion;
    level.scr_anim["vehicles"]["rock_Crash"] = %h1_civilian_pickup_rockcrash;
    level.scr_anim["vehicles"]["concrete_Crash"] = %h1_civilian_pickup_concretecrash;
    maps\_anim::addnotetrack_customfunction( "vehicles", "scripted_sfx", maps\jeepride_aud::crossroad_crash, "crossroad_crash" );
    maps\_anim::addnotetrack_customfunction( "vehicles", "explosion_end", maps\jeepride_aud::play_anim_vehicle_explosion_sfx, "crossroad_crash", "scn_bm21_explode" );
    maps\_anim::addnotetrack_customfunction( "vehicles", "scripted_sfx", maps\jeepride_aud::truck_tanker_crash, "truck_tanker_crash" );
    maps\_anim::addnotetrack_customfunction( "vehicles", "explosion_end_FX", maps\jeepride_aud::play_anim_vehicle_explosion_sfx, "truck_tanker_crash", "scn_bm21_explode" );
    maps\_anim::addnotetrack_customfunction( "vehicles", "scripted_sfx", maps\jeepride_aud::tanker_tanker_crash, "tanker_tanker_crash" );
    maps\_anim::addnotetrack_customfunction( "vehicles", "scripted_sfx", maps\jeepride_aud::tunnel_crash_truck01, "tunnel_crash_truck01" );
    maps\_anim::addnotetrack_customfunction( "vehicles", "explosion_fx", maps\jeepride_aud::play_anim_vehicle_explosion_sfx, "tunnel_crash_truck01", "scn_bm21_explode" );
    maps\_anim::addnotetrack_customfunction( "vehicles", "scripted_sfx", maps\jeepride_aud::tunnel_crash_truck02, "tunnel_crash_truck02" );
    maps\_anim::addnotetrack_startfxontag( "vehicles", "hit_three_crash", "three_crash", "sedan_impact_civilian_treecrash", "rear_door_left_jnt" );
    maps\_anim::addnotetrack_startfxontag( "vehicles", "rock_hit", "rock_Crash", "pickuptruck_civilian_rockcrash", "door_open_r2_jnt" );
    maps\_anim::addnotetrack_startfxontag( "vehicles", "HitConcrete", "crossroad_crash", "offroad_truck_tire_hit_concrete", "tag_wheel_front_left" );
    maps\_anim::addnotetrack_startfxontag( "vehicles", "impact_water", "crossroad_crash", "offroad_truck_hit_water", "tag_wheel_front_left" );
    maps\_anim::addnotetrack_startfxontag( "vehicles", "explosion_end", "crossroad_crash", "offroad_truck_explosion", "tag_wheel_front_left" );
    maps\_anim::addnotetrack_flag( "vehicles", "explosion_fx", "tunnel_explosion_fx_flag", "tunnel_crash_truck01" );
    maps\_anim::addnotetrack_startfxontag( "vehicles", "gaz_leak", "tanker_tanker_crash", "tanker_gaz_leak_jeepride", "tag_fx_top_ladder" );
    maps\_anim::addnotetrack_startfxontag( "vehicles", "HitRock", "truck_tanker_crash", "jeep_tire_hit_cliff", "tag_wheel_front_right" );
    maps\_anim::addnotetrack_startfxontag( "vehicles", "HitTanker_FX", "truck_tanker_crash", "jeep_tire_hit_tanker", "tag_parkinglight_left_f" );
    maps\_anim::addnotetrack_startfxontag( "vehicles", "gaz_leak", "tanker_tanker_crash", "tanker_gaz_small_leak_jeepride", "tag_fx_right_side1" );
    maps\_anim::addnotetrack_startfxontag( "vehicles", "gaz_leak", "tanker_tanker_crash", "tanker_gaz_small_leak_jeepride", "tag_fx_right_side2" );
    maps\_anim::addnotetrack_startfxontag( "vehicles", "gaz_leak", "tanker_tanker_crash", "tanker_gaz_small_leak_jeepride", "tag_fx_right_side3" );
    maps\_anim::addnotetrack_startfxontag( "vehicles", "explosion_end_FX", "truck_tanker_crash", "tanker_truck_explosion_end", "tag_wheel_middle_right" );
    maps\_anim::addnotetrack_startfxontag( "vehicles", "hit_concrete", "concrete_Crash", "pickuptruck_civilian_concretecrash", "tag_headlight_right" );
    maps\_anim::addnotetrack_customfunction( "vehicles", "HitFence", maps\jeepride_code::anim_throw_junk_and_kill_all_guys, "crossroad_crash" );
    maps\_anim::addnotetrack_customfunction( "vehicles", "HitWall", maps\jeepride_code::anim_throw_junk_and_kill_all_guys, "tunnel_crash_truck01" );
    maps\_anim::addnotetrack_customfunction( "vehicles", "Flip", maps\jeepride_code::anim_throw_junk_and_kill_all_guys, "tunnel_crash_truck02" );
    maps\_anim::addnotetrack_customfunction( "vehicles", "HitTanker", maps\jeepride_code::anim_throw_junk_and_kill_all_guys, "truck_tanker_crash" );
    level.scr_goaltime["vehicles"]["crossroad_crash"] = 0;
    level.scr_goaltime["vehicles"]["tunnel_crash_truck01"] = 0;
    level.scr_goaltime["vehicles"]["tunnel_crash_truck02"] = 0;
    level.scr_goaltime["vehicles"]["truck_tanker_crash"] = 0;
    level.scr_goaltime["vehicles"]["tanker_tanker_crash"] = 0;
    maps\_anim::addnotetrack_customfunction( "vehicles", "sparks_on", maps\jeepride_code::anim_spark_on );
    maps\_anim::addnotetrack_customfunction( "vehicles", "sparks_off", maps\jeepride_code::anim_spark_off );
    precache_crash_models();
}

precache_crash_models()
{
    if ( !isdefined( level.jeepride_crash_model ) )
        return;

    var_0 = getarraykeys( level.jeepride_crash_model );

    for ( var_1 = 0; var_1 < var_0.size; var_1++ )
        precachemodel( level.jeepride_crash_model[var_0[var_1]] );
}

#using_animtree("generic_human");

uaz_overrides()
{
    var_0 = vehicle_scripts\_uaz::setanims();
    var_0[0].sittag = "tag_driver";
    var_0[1].sittag = "tag_passenger";
    var_0[2].sittag = "tag_guy0";
    var_0[3].sittag = "tag_guy1";
    var_0[4].sittag = "tag_guy2";
    var_0[5].sittag = "tag_guy3";
    var_0[0].idle = %uaz_driver_idle;
    var_0[1].idle = %uaz_rguy_idle;
    var_0[2].getout = %uaz_driver_exit_into_run;
    var_0[3].getout = %uaz_passenger_exit_into_run;
    var_0[2].idle = [];
    var_0[2].idle[0] = %uaz_lguy_idle_hide;
    var_0[2].idle[1] = %uaz_lguy_idle_react;
    var_0[2].idleoccurrence[0] = 1000;
    var_0[2].idleoccurrence[1] = 100;
    var_0[3].idle = %uaz_rguy_idle;
    var_0[4].idle = undefined;
    var_0[5].idle = undefined;
    var_0[2].hidetoback = %uaz_lguy_trans_hide2back;
    var_0[2].back_attack = %uaz_lguy_fire_back;
    var_0[2].backtohide = %uaz_lguy_trans_back2hide;
    var_0[2].hide_attack_forward = %uaz_lguy_fire_hide_forward;
    var_0[2].hide_attack_left[0] = %uaz_lguy_fire_side_v1;
    var_0[2].hide_attack_left[1] = %uaz_lguy_fire_side_v2;
    var_0[2].hide_attack_left_occurrence[0] = 500;
    var_0[2].hide_attack_left_occurrence[1] = 500;
    var_0[2].hide_attack_left_standing[0] = %uaz_lguy_standfire_side_v3;
    var_0[2].hide_attack_left_standing[1] = %uaz_lguy_standfire_side_v4;
    var_0[2].hide_attack_left_standing_occurrence[0] = 100;
    var_0[2].hide_attack_left_standing_occurrence[1] = 100;
    var_0[2].hide_attack_back[0] = %uaz_lguy_fire_hide_back_v1;
    var_0[2].hide_attack_back[1] = %uaz_lguy_fire_hide_back_v2;
    var_0[2].hide_attack_back_occurrence[0] = 500;
    var_0[2].hide_attack_back_occurrence[1] = 500;
    var_0[2].react = %uaz_lguy_idle_react;
    var_0[1].hide_attack_back[0] = %uaz_rguy_fire_back_v2;
    var_0[1].hide_attack_back[1] = %uaz_rguy_fire_back_v1;
    var_0[1].hide_attack_back_occurrence[0] = 500;
    var_0[1].hide_attack_back_occurrence[1] = 500;
    var_0[1].hide_attack_left[0] = %h1_uaz_rguy_fire_side_v1_l;
    var_0[1].hide_attack_left[1] = %h1_uaz_rguy_fire_side_v2_l;
    var_0[1].hide_attack_left_occurrence[0] = 500;
    var_0[1].hide_attack_left_occurrence[1] = 500;
    var_0[0].duck_once = %uaz_driver_duck;
    var_0[0].turn_right = %uaz_driver_turnright;
    var_0[0].turn_left = %uaz_driver_turnleft;
    var_0[0].weave = %uaz_driver_weave;
    return var_0;
}

#using_animtree("vehicles");

override_roto_anim()
{
    self endon( "death" );
    var_0 = getanimlength( %mi28_rotors_add );

    for (;;)
    {
        self setanim( %mi28_rotors_add, 1, 0.2, 1 );
        wait(var_0);
    }
}

uaz_override_vehicle( var_0 )
{
    var_0 = vehicle_scripts\_uaz::set_vehicle_anims( var_0 );
    var_0[0].vehicle_idle = %uaz_steeringwheel_idle;
    var_0[0].vehicle_duck_once = %uaz_steeringwheel_duck;
    var_0[0].vehicle_turn_left = %uaz_steeringwheel_turnleft;
    var_0[0].vehicle_turn_right = %uaz_steeringwheel_turnright;
    var_0[0].vehicle_weave = %uaz_steeringwheel_weave;
    var_0[2].vehicle_getoutanim = %uaz_rear_driver_exit_into_run_door;
    var_0[3].vehicle_getoutanim = %uaz_passenger2_exit_into_run_door;
    return var_0;
}

#using_animtree("animated_props");

bridge_animation()
{
    level.scr_animtree["bridge_collapse"] = #animtree;
    level.scr_anim["bridge_collapse"]["bridge_collapsing"] = %h1_jeepride_bridgecollapse;
    maps\_anim::addnotetrack_customfunction( "bridge_collapse", "scn_bridge_collapse_01", maps\jeepride_aud::play_bridge_collapse_sfx, "bridge_collapsing", "01" );
    maps\_anim::addnotetrack_customfunction( "bridge_collapse", "scn_bridge_collapse_02", maps\jeepride_aud::play_bridge_collapse_sfx, "bridge_collapsing", "02" );
    maps\_anim::addnotetrack_customfunction( "bridge_collapse", "scn_bridge_collapse_03", maps\jeepride_aud::play_bridge_collapse_sfx, "bridge_collapsing", "03" );
    maps\_anim::addnotetrack_customfunction( "bridge_collapse", "scn_bridge_collapse_04", maps\jeepride_aud::play_bridge_collapse_sfx, "bridge_collapsing", "04" );
    maps\_anim::addnotetrack_customfunction( "bridge_collapse", "scn_bridge_collapse_05", maps\jeepride_aud::play_bridge_collapse_sfx, "bridge_collapsing", "05" );
    maps\_anim::addnotetrack_customfunction( "bridge_collapse", "scn_bridge_collapse_06", maps\jeepride_aud::play_bridge_collapse_sfx, "bridge_collapsing", "06" );
    maps\_anim::addnotetrack_customfunction( "bridge_collapse", "scn_bridge_collapse_07", maps\jeepride_aud::play_bridge_collapse_sfx, "bridge_collapsing", "07" );
    maps\_anim::addnotetrack_customfunction( "bridge_collapse", "scn_bridge_collapse_08", maps\jeepride_aud::play_bridge_collapse_sfx, "bridge_collapsing", "08" );
    maps\_anim::addnotetrack_customfunction( "bridge_collapse", "scn_bridge_collapse_09", maps\jeepride_aud::play_bridge_collapse_sfx, "bridge_collapsing", "09" );
    maps\_anim::addnotetrack_customfunction( "bridge_collapse", "scn_bridge_collapse_10", maps\jeepride_aud::play_bridge_collapse_sfx, "bridge_collapsing", "10" );
    maps\_anim::addnotetrack_customfunction( "bridge_collapse", "scn_bridge_collapse_11", maps\jeepride_aud::play_bridge_collapse_sfx, "bridge_collapsing", "11" );
    maps\_anim::addnotetrack_customfunction( "bridge_collapse", "vfx_vehicle_build_up", maps\jeepride::play_bridge_vehicle_collapse_vfx, "bridge_collapsing" );
    maps\_anim::addnotetrack_startfxontag( "bridge_collapse", "vfx_vehicle_explosion", "bridge_collapsing", "bridge_small_exp_cin", "tag_fx_wagon_explosion_1" );

    for ( var_0 = 1; var_0 <= 4; var_0++ )
    {
        maps\_anim::addnotetrack_customfunction( "bridge_collapse", "vfx_wagon_spark_on_" + var_0, maps\jeepride::play_bridge_wagon_spark_vfx, "bridge_collapsing", var_0 );
        maps\_anim::addnotetrack_customfunction( "bridge_collapse", "vfx_wagon_spark_off_" + var_0, maps\jeepride::stop_bridge_wagon_spark_vfx, "bridge_collapsing", var_0 );
    }

    for ( var_0 = 1; var_0 <= 5; var_0++ )
    {
        maps\_anim::addnotetrack_customfunction( "bridge_collapse", "vfx_uaz_spark_on_" + var_0, maps\jeepride::play_bridge_uaz_spark_vfx, "bridge_collapsing", var_0 );
        maps\_anim::addnotetrack_customfunction( "bridge_collapse", "vfx_uaz_spark_off_" + var_0, maps\jeepride::stop_bridge_uaz_spark_vfx, "bridge_collapsing", var_0 );
    }

    for ( var_0 = 1; var_0 <= 14; var_0++ )
        maps\_anim::addnotetrack_startfxontag( "bridge_collapse", "vfx_falling_dust_" + var_0, "bridge_collapsing", "bridge_collapse_dust", "tag_fx_falling_dust_" + var_0 );

    for ( var_0 = 1; var_0 <= 17; var_0++ )
        maps\_anim::addnotetrack_startfxontag( "bridge_collapse", "vfx_falling_dust_os_" + var_0, "bridge_collapsing", "bridge_collapse_dust_os", "tag_fx_falling_dust_os_" + var_0 );

    for ( var_0 = 1; var_0 <= 14; var_0++ )
        maps\_anim::addnotetrack_startfxontag( "bridge_collapse", "vfx_stone_impact_" + var_0, "bridge_collapsing", "bridge_collapse_stone_impact", "tag_fx_stone_impact_" + var_0 );

    for ( var_0 = 1; var_0 <= 3; var_0++ )
        maps\_anim::addnotetrack_startfxontag( "bridge_collapse", "vfx_stone_detach_" + var_0, "bridge_collapsing", "bridge_collapse_stone_detach", "tag_fx_stone_detach_" + var_0 );

    for ( var_0 = 1; var_0 <= 2; var_0++ )
        maps\_anim::addnotetrack_startfxontag( "bridge_collapse", "vfx_frame_spark_" + var_0, "bridge_collapsing", "bridge_collapse_spark", "tag_fx_frame_spark_" + var_0 );

    for ( var_0 = 1; var_0 <= 2; var_0++ )
        maps\_anim::addnotetrack_startfxontag( "bridge_collapse", "vfx_frame_impact_" + var_0, "bridge_collapsing", "bridge_collapse_frame_hit", "tag_fx_frame_impact_" + var_0 );

    for ( var_0 = 1; var_0 <= 7; var_0++ )
        maps\_anim::addnotetrack_startfxontag( "bridge_collapse", "vfx_dust_ambient_" + var_0, "bridge_collapsing", "bridge_leftovers_2", "tag_fx_dust_ambient_" + var_0 );

    level.scr_animtree["rpgfromgriggs"] = #animtree;
    level.scr_anim["rpgfromgriggs"]["rpgfromgriggs_rpg"] = %h1_jeepride_rpgfromgriggs_rpg;
    level.scr_animtree["pistol_griggs"] = #animtree;
    level.scr_anim["pistol_griggs"]["drag_pistol"] = %h1_jeepride_drag_pistol;
}

#using_animtree("script_model");

cliff_collapse_anim()
{
    level.scr_animtree["exploder_script_model"] = #animtree;
    level.scr_anim["exploder_script_model"]["h1_jeepride_cliff_collapse_1_anim"] = %h1_jeepride_cliff_collapse_1_anim;
    level.scr_anim["exploder_script_model"]["h1_jeepride_cliff_collapse_2_anim"] = %h1_jeepride_cliff_collapse_2_anim;
    level.scr_anim["exploder_script_model"]["h1_jeepride_cliff_collapse_3_anim"] = %h1_jeepride_cliff_collapse_3_anim;
    level.scr_anim["exploder_script_model"]["h1_jeepride_cliff_collapse_4_anim"] = %h1_jeepride_cliff_collapse_4_anim;
    level.scr_anim["exploder_script_model"]["h1_jeepride_cliff_collapse_5_anim"] = %h1_jeepride_cliff_collapse_5_anim;
}

#using_animtree("animated_props");

animated_palm_trees_setup()
{
    level.anim_prop_models["foliage_sequoia_tree_cut_12_animated"]["still"] = %foliage_sequoia_cut_12_still;
    level.anim_prop_models["foliage_sequoia_tree_cut_12_animated"]["strong"] = %foliage_sequoia_cut_12_sway;
    level.anim_prop_models["foliage_sequoia_tree_cut_12_animated"]["heli"] = %foliage_sequoia_cut_12_heliwash;
    level.anim_prop_models["h1_foliage_jr_pine_01_animated"]["still"] = %jr_pine_01_still;
    level.anim_prop_models["h1_foliage_jr_pine_01_animated"]["strong"] = %jr_pine_01_sway;
    level.anim_prop_models["h1_foliage_jr_pine_01_animated"]["heli"] = %jr_pine_01_heliwash;
    level.anim_prop_models["h1_foliage_jr_pine_02_animated"]["still"] = %jr_pine_02_still;
    level.anim_prop_models["h1_foliage_jr_pine_02_animated"]["strong"] = %jr_pine_02_sway;
    level.anim_prop_models["h1_foliage_jr_pine_02_animated"]["heli"] = %jr_pine_02_heliwash;
}
