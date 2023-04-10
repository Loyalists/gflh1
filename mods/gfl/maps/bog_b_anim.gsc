// H1 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

#using_animtree("generic_human");

main()
{
    animated_model_setup();
    setup_exploder_anims();
    exploder_script_model_anims();
    level.scr_anim["dumpsterGuy"]["dumpster_idle1"][0] = %bog_b_dumpster_guy1_idle;
    level.scr_anim["dumpsterGuy"]["dumpster_peek"] = %bog_b_dumpster_guy1_peek;
    level.scr_anim["dumpsterGuy"]["dumpster_idle2_reach"] = %bog_b_dumpster_guy1_push_idle;
    level.scr_anim["dumpsterGuy"]["dumpster_idle2"][0] = %bog_b_dumpster_guy1_push_idle;
    level.scr_anim["dumpsterGuy"]["dumpster_push"] = %bog_b_dumpster_guy1_push;
    level.scr_anim["price"]["dumpster_push"] = %bog_b_dumpster_guy2_push;
    level.scr_goaltime["price"]["dumpster_push"] = 0.25;
    level.scr_anim["alley_door_kicker_left"]["idle"][0] = %breach_kick_stackl1_idle;
    level.scr_anim["alley_door_kicker_left"]["idle_reach"] = %breach_kick_stackl1_idle;
    level.scr_anim["alley_door_kicker_left"]["enter"] = %breach_kick_stackl1_enter;
    level.scr_anim["alley_door_kicker_right"]["enter"] = %breach_kick_kickerr1_enter;
    level.scr_sound["alley_door_kicker_right"]["enter"] = "bog_gm1_breaching";
    maps\_anim::addnotetrack_customfunction( "alley_door_kicker_right", "kick", maps\bog_b::alley_dooropen );
    level.scr_anim["price"]["alley_breach"] = %h1_bog_b_vasquez_door_breach_vasquez;
    maps\_anim::addnotetrack_customfunction( "price", "door_kick", maps\bog_b::alley_dooropen, "alley_breach" );
    level.scr_anim["alley_breach_buddy"]["alley_breach"] = %h1_bog_b_vasquez_door_breach_soldier;
    level.scr_sound["alley_breach_buddy"]["alley_breach"] = "bog_gm1_breaching";
    level.scr_anim["guard"]["stop"] = %bog_b_guard_stop;
    level.scr_sound["guard"]["stop_snd"] = "bog_gm4_holdhere";
    level.scr_anim["guard"]["react"] = %bog_b_guard_react;
    level.scr_anim["guard"]["celebrate"] = %hunted_celebrate;
    level.scr_anim["gm1"]["celebrate"] = %hunted_celebrate;
    level.scr_anim["gm2"]["celebrate"] = %hunted_celebrate;
    level.scr_anim["gm3"]["celebrate"] = %hunted_celebrate;
    level.scr_anim["gm4"]["celebrate"] = %hunted_celebrate;
    level.scr_anim["gm5"]["celebrate"] = %hunted_celebrate;
    level.scr_anim["price"]["casual_2_spot"] = %bog_b_spotter_casual_2_spot;
    level.scr_anim["price"]["spot_2_casual"] = %bog_b_spotter_spot_2_casual;
    level.scr_anim["price"]["spot"][0] = %bog_b_spotter_spot_idle;
    level.scr_anim["price"]["spot"][1] = %bog_b_spotter_spot_twitch;
    level.scr_anim["price"]["react"] = %bog_b_spotter_react;
    level.scr_anim["casualcrouch"]["react"] = %bog_b_casualcrouch_react;
    level.scr_anim["price"]["new_react"] = %h1_bog_b_cheers_vasquez_react;
    maps\_anim::addnotetrack_dialogue( "price", "dialog", "new_react", "bog_pri_niceshootingpig" );
    maps\_anim::addnotetrack_customfunction( "price", "radio", maps\bog_b::docomingthroughaudio, "new_react" );
    level.scr_anim["guard"]["new_react"] = %h1_bog_b_cheers_soldier_left;
    maps\_anim::addnotetrack_dialogue( "guard", "dialog", "new_react", "bog_gm1_wooyeah" );
    level.scr_anim["casualcrouch"]["new_react"] = %h1_bog_b_cheers_soldier_right;
    maps\_anim::addnotetrack_dialogue( "casualcrouch", "dialog", "new_react", "bog_gm4_talkinabout" );

    if ( !isdefined( level.scr_animtree ) )
        level.scr_animtree = [];

    dumpster_anims();
    tank_crush_anims();
    tank_explode_anims();
    dialog();
}

#using_animtree("script_model");

dumpster_anims()
{
    level.scr_animtree["dumpster"] = #animtree;
    level.scr_anim["dumpster"]["dumpster_idle1"][0] = %bog_b_dumpster_guy1_idle_dumpster;
    level.scr_anim["dumpster"]["dumpster_peek"] = %bog_b_dumpster_guy1_peek_dumpster;
    level.scr_anim["dumpster"]["dumpster_idle2"][0] = %bog_b_dumpster_guy1_push_idle_dumpster;
    level.scr_anim["dumpster"]["dumpster_push"] = %bog_b_dumpster_guy1_push_dumpster;
}

#using_animtree("vehicles");

tank_crush_anims()
{
    level.scr_animtree["tank_crush"] = #animtree;
    level.scr_anim["truck"]["tank_crush"] = %pickup_tankcrush_front;
    level.scr_anim["tank"]["tank_crush"] = %tank_tankcrush_front;
    level.scr_sound["tank_crush"] = "bog_tank_crush_truck";
    level.scr_animtree["tank_crush2"] = #animtree;
    level.scr_anim["truck"]["tank_crush2"] = %pickup_tankcrush_front;
    level.scr_anim["tank"]["tank_crush2"] = %tank_tankcrush_front;
    level.scr_sound["tank_crush2"] = "bog_tank_crush_truck2";
}

tank_explode_anims()
{
    level.scr_animtree["tank_explosion"] = #animtree;

    if ( getdvarint( "use_old_explosion" ) == 1 )
    {
        level.scr_anim["tank"]["explosion1"] = %bog_b_tank_explosion;
        level.scr_anim["tank"]["explosion2"] = %bog_b_tank_explosion2;
    }
    else
    {
        level.scr_anim["tank"]["explosion1"] = %bog_b_tank_new_explosion;
        level.scr_anim["tank"]["explosion2"] = %bog_b_tank_new_explosion2;
    }
}

dialog()
{
    level.scr_sound["marine1"]["getyourass"] = "bog_gm1_getyourass";
    level.scr_sound["marine1"]["rightflank"] = "bog_gm1_rightflank";
    level.scr_sound["marine2"]["enemyair"] = "bog_gm2_enemyair";
    level.scr_sound["tank_commander"]["wereclear"] = "bog_tcm_wereclear";
    level.scr_sound["tank_commander"]["possibleambush"] = "bog_tcm_possibleambush";
    level.scr_sound["tank_commander"]["standclear"] = "bog_tcm_standclear";
    level.scr_sound["tank_commander"]["cleartoadvance"] = "bog_tcm_cleartoadvance";
    level.scr_sound["tank_commander"]["rogermoving"] = "bog_tcm_rogermoving";
    level.scr_sound["tank_commander"]["movingup"] = "bog_tcm_movingup";
    level.scr_sound["tank_commander"]["3story11_2ndfloor"] = "bog_tcm_3story11_2ndfloor";
    level.scr_sound["tank_commander"]["3story1130_2ndfloor"] = "bog_tcm_3story1130_2ndfloor";
    level.scr_sound["tank_commander"]["2story1_ground"] = "bog_tcm_2story1_ground";
    level.scr_sound["tank_commander"]["2story1_2ndfloor"] = "bog_tcm_2story1_2ndfloor";
    level.scr_sound["tank_commander"]["3story1230_2ndfloor"] = "bog_tcm_3story1230_2ndfloor";
    level.scr_sound["tank_commander"]["fire"] = "bog_tcm_fire1";
    level.scr_sound["tank_commander"]["switchmanual"] = "bog_tcm_switchmanual";
    level.scr_sound["tank_commander"]["takeshot"] = "bog_tcm_takeshot";
    level.scr_sound["tank_loader"]["up1"] = "bog_tld_up1";
    level.scr_sound["tank_loader"]["up2"] = "bog_tld_up2";
    level.scr_sound["tank_loader"]["up3"] = "bog_tld_up3";
    level.scr_sound["tank_loader"]["up4"] = "bog_tld_up4";
    level.scr_sound["tank_gunner"]["targetacquired1"] = "bog_tgn_targetacquired1";
    level.scr_sound["tank_gunner"]["targetacquired2"] = "bog_tgn_targetacquired2";
    level.scr_sound["tank_gunner"]["targetacquired3"] = "bog_tgn_targetacquired3";
    level.scr_sound["price"]["grabrpg"] = "bog_pri_grabrpg";
    level.scr_sound["price"]["watchrooftops"] = "bog_pri_watchrooftops";
    level.scr_sound["price"]["rogermoveup"] = "bog_pri_rogermoveup";
    level.scr_sound["price"]["roger"] = "bog_pri_roger";
    level.scr_sound["price"]["keeppinned"] = "bog_pri_keeppinned";
    level.scr_sound["grigsby"]["staysharp"] = "bog_grg_staysharp";
    level.scr_sound["mgkiller_right"]["comingleft"] = "bog_gm1_comingleft";
    level.scr_sound["price"]["rogerthat"] = "bog_pri_rogerthat";
    level.scr_sound["price"]["t72behind"] = "bog_pri_t72behind";
    level.scr_sound["gm1"]["callit"] = "bog_gm1_callit";
    level.scr_sound["gm2"]["afterlast"] = "bog_gm2_afterlast";
    level.scr_sound["gm1"]["youreon"] = "bog_gm1_youreon";
    level.scr_sound["gm1"]["wooyeah"] = "bog_gm1_wooyeah";
    level.scr_sound["gm2"]["holyshit"] = "bog_gm2_holyshit";
    level.scr_sound["gm3"]["hellyeah"] = "bog_gm3_hellyeah";
    level.scr_sound["gm4"]["yeahwoo"] = "bog_gm4_yeahwoo";
    level.scr_sound["gm5"]["talkinabout"] = "bog_gm4_talkinabout";
    level.scr_sound["price"]["niceshootingpig"] = "bog_pri_niceshootingpig";
    level.scr_sound["tank_commander"]["wethereyet"] = "bog_tcm_wethereyet";
    level.scr_sound["tank_commander"]["comingthrough"] = "bog_tcm_comingthrough";
    level.scr_sound["hq_radio"]["statusover"] = "bog_hqr_statusover";
    level.scr_sound["price"]["cargo"] = "bog_pri_cargo";
    level.scr_sound["saknight"]["getonboard"] = "bog_mhp_getonboard";
    level.scr_sound["price"]["fixonposition"] = "bog_pri_fixonposition";
}

#using_animtree("animated_props");

animated_model_setup()
{
    level.anim_prop_models["foliage_tree_palm_tall_3"]["still"] = %palmtree_tall3_still;
    level.anim_prop_models["foliage_tree_palm_tall_3"]["strong"] = %palmtree_tall3_sway;
    level.anim_prop_models["foliage_tree_palm_med_2"]["still"] = %palmtree_med2_still;
    level.anim_prop_models["foliage_tree_palm_med_2"]["strong"] = %palmtree_med2_sway;
    level.anim_prop_models["foliage_tree_palm_bushy_1"]["still"] = %palmtree_bushy1_still;
    level.anim_prop_models["foliage_tree_palm_bushy_1"]["strong"] = %palmtree_bushy1_sway;
    level.anim_prop_models["foliage_tree_palm_bushy_2"]["still"] = %palmtree_bushy2_still;
    level.anim_prop_models["foliage_tree_palm_bushy_2"]["strong"] = %palmtree_bushy2_sway;
    level.anim_prop_models["foliage_tree_palm_tall_2"]["still"] = %palmtree_tall2_still;
    level.anim_prop_models["foliage_tree_palm_tall_2"]["strong"] = %palmtree_tall2_sway;
    level.anim_prop_models["foliage_tree_palm_bushy_3"]["still"] = %palmtree_bushy3_still;
    level.anim_prop_models["foliage_tree_palm_bushy_3"]["strong"] = %palmtree_bushy3_sway;
    level.anim_prop_models["foliage_tree_palm_med_1"]["still"] = %palmtree_med1_still;
    level.anim_prop_models["foliage_tree_palm_med_1"]["strong"] = %palmtree_med1_sway;
    level.anim_prop_models["foliage_tree_palm_tall_1"]["still"] = %palmtree_tall1_still;
    level.anim_prop_models["foliage_tree_palm_tall_1"]["strong"] = %palmtree_tall1_sway;
    level.anim_prop_models["foliage_afr_tree_fanpalm_01a"]["still"] = %afr_tree_fanpalm_still;
    level.anim_prop_models["foliage_afr_tree_fanpalm_01a"]["strong"] = %afr_tree_fanpalm_sway;
    level.anim_prop_models["foliage_afr_tree_fanpalm_01a_v2"]["still"] = %afr_tree_fanpalm_still;
    level.anim_prop_models["foliage_afr_tree_fanpalm_01a_v2"]["strong"] = %afr_tree_fanpalm_sway;
    level.anim_prop_models["h1_foliage_backlot_palm_tree_02_hero"]["still"] = %h1_foliage_backlot_palm_tree_02_hero_still;
    level.anim_prop_models["h1_foliage_backlot_palm_tree_02_hero"]["strong"] = %h1_foliage_backlot_palm_tree_02_hero_sway;
    level.anim_prop_models["h1_foliage_backlot_palm_tree_02_hero"]["heli"] = %h1_foliage_backlot_palm_tree_02_hero_heliwash;
    level.anim_prop_models["h1_foliage_backlot_palm_tree_03_hero"]["still"] = %h1_foliage_backlot_palm_tree_03_hero_still;
    level.anim_prop_models["h1_foliage_backlot_palm_tree_03_hero"]["strong"] = %h1_foliage_backlot_palm_tree_03_hero_sway;
    level.anim_prop_models["h1_foliage_backlot_palm_tree_03_hero"]["heli"] = %h1_foliage_backlot_palm_tree_03_hero_heliwash;
}

setup_exploder_anims()
{
    level.exploder_animtrees = [];
    level.exploder_animtrees[0] = "exploder_script_model";
}

#using_animtree("script_model");

exploder_script_model_anims()
{
    level.scr_animtree["exploder_script_model"] = #animtree;
    level.scr_anim["exploder_script_model"]["wallshot_all0_anim"] = %wallshot_all0_anim;
    level.scr_anim["exploder_script_model"]["wallshot_all1_anim"] = %wallshot_all1_anim;
    level.scr_anim["exploder_script_model"]["wallshot_all2_anim"] = %wallshot_all2_anim;
    level.scr_anim["exploder_script_model"]["wallshot_all3_anim"] = %wallshot_all3_anim;
    level.scr_anim["exploder_script_model"]["wallshot_all4_anim"] = %wallshot_all4_anim;
    level.scr_anim["exploder_script_model"]["wallshot_all5_anim"] = %wallshot_all5_anim;
    level.scr_anim["exploder_script_model"]["bog_b_wallshot_b0_anim"] = %bog_b_wallshot_b0_anim;
    level.scr_anim["exploder_script_model"]["bog_b_wallshot_b1_anim"] = %bog_b_wallshot_b1_anim;
    level.scr_anim["exploder_script_model"]["h1_bog_b_tankdeath_wallshot0_anim"] = %h1_bog_b_tankdeath_wallshot0_anim;
    level.scr_anim["exploder_script_model"]["h1_bog_b_tankdeath_wallshot1_anim"] = %h1_bog_b_tankdeath_wallshot1_anim;
    level.scr_anim["exploder_script_model"]["h1_bog_b_tankdeath_wallshot2_anim"] = %h1_bog_b_tankdeath_wallshot2_anim;
    level.scr_anim["exploder_script_model"]["h1_bogb_wallshot_c0_anim"] = %h1_bogb_wallshot_c0_anim;
    level.scr_anim["exploder_script_model"]["h1_bogb_wallshot_c1_anim"] = %h1_bogb_wallshot_c1_anim;
    level.scr_anim["exploder_script_model"]["h1_bogb_wallshot_c2_anim"] = %h1_bogb_wallshot_c2_anim;
    level.scr_anim["exploder_script_model"]["h1_bogb_wallshot_c3_anim"] = %h1_bogb_wallshot_c3_anim;
    level.scr_anim["exploder_script_model"]["h1_bogb_wallshot_c4_anim"] = %h1_bogb_wallshot_c4_anim;
}

#using_animtree("vehicles");

shoot_m1a1_anim()
{
    self clearanim( %abrams_shoot_kick, 0 );
    self setanimrestart( %abrams_shoot_kick );
}

shoot_t72_anim()
{
    self clearanim( %t72_shoot_kick, 0 );
    self setanimrestart( %t72_shoot_kick );
}
