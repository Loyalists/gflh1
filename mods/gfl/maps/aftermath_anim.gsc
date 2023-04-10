// H1 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

main()
{
    animated_model_setup();
    setup_exploder_anims();
    exploder_script_model_anims();
    deadbody__anims();
    player_body_sense();
}

setup_exploder_anims()
{
    level.exploder_animtrees = [];
    level.exploder_animtrees[0] = "exploder_script_model";
}

#using_animtree("animated_props");

animated_model_setup()
{
    level.anim_prop_models["h1_aftermath_swing"]["idle"] = %h1_aftermath_swing_anim;
    level.anim_prop_models["h1_aftermath_playground_horse"]["idle1"] = %h1_aftermath_horse_rocking1;
    level.anim_prop_models["h1_aftermath_playground_horse"]["idle2"] = %h1_aftermath_horse_rocking2;
    level.anim_prop_models["h1_aftermath_playground_horse"]["idle3"] = %h1_aftermath_horse_rocking3;
    level.anim_prop_models["vehicle_bus_animated"]["still"] = %vehicle_animated_bus_still;
    level.anim_prop_models["vehicle_bus_animated"]["strong"] = %vehicle_animated_bus_sway;
}

#using_animtree("script_model");

exploder_script_model_anims()
{
    level.scr_animtree["exploder_script_model"] = #animtree;
    level.scr_anim["exploder_script_model"]["h1_aftermath_build_sm0_anim"] = %h1_aftermath_build_sm0_anim;
    level.scr_anim["exploder_script_model"]["h1_aftermath_build_sm1_anim"] = %h1_aftermath_build_sm1_anim;
    level.scr_anim["exploder_script_model"]["h1_aftermath_build_sm2_anim"] = %h1_aftermath_build_sm2_anim;
    level.scr_anim["exploder_script_model"]["h1_aftermath_build_sm3_anim"] = %h1_aftermath_build_sm3_anim;
    level.scr_anim["exploder_script_model"]["h1_aftermath_build_sm2_0_anim"] = %h1_aftermath_build_sm2_0_anim;
    level.scr_anim["exploder_script_model"]["h1_aftermath_build_sm2_1_anim"] = %h1_aftermath_build_sm2_1_anim;
    level.scr_anim["exploder_script_model"]["h1_aftermath_build_sm2_2_anim"] = %h1_aftermath_build_sm2_2_anim;
    level.scr_anim["exploder_script_model"]["h1_aftermath_build_sm2_3_anim"] = %h1_aftermath_build_sm2_3_anim;
    level.scr_anim["exploder_script_model"]["h1_aftermath_build_tall_0_anim"] = %h1_aftermath_build_tall_0_anim;
    level.scr_anim["exploder_script_model"]["h1_aftermath_build_tall_1_anim"] = %h1_aftermath_build_tall_1_anim;
    level.scr_anim["exploder_script_model"]["h1_aftermath_build_tall_2_anim"] = %h1_aftermath_build_tall_2_anim;
    level.scr_anim["exploder_script_model"]["h1_aftermath_build_tall_3_anim"] = %h1_aftermath_build_tall_3_anim;
    level.scr_anim["exploder_script_model"]["h1_aftermath_build_tall_4_anim"] = %h1_aftermath_build_tall_4_anim;
    level.scr_anim["exploder_script_model"]["h1_aftermath_build_a_0_anim"] = %h1_aftermath_build_a_0_anim;
    level.scr_anim["exploder_script_model"]["h1_aftermath_build_a_1_anim"] = %h1_aftermath_build_a_1_anim;
    level.scr_anim["exploder_script_model"]["h1_aftermath_build_a_2_anim"] = %h1_aftermath_build_a_2_anim;
    level.scr_anim["exploder_script_model"]["h1_aftermath_build_a_3_anim"] = %h1_aftermath_build_a_3_anim;
    level.scr_anim["exploder_script_model"]["h1_aftermath_build_a_4_anim"] = %h1_aftermath_build_a_4_anim;
    level.scr_anim["exploder_script_model"]["h1_aftermath_build_a_5_anim"] = %h1_aftermath_build_a_5_anim;
    level.scr_anim["exploder_script_model"]["h1_aftermath_build_a_6_anim"] = %h1_aftermath_build_a_6_anim;
    level.scr_anim["exploder_script_model"]["h1_aftermath_build_a_7_anim"] = %h1_aftermath_build_a_7_anim;
}

#using_animtree("generic_human");

deadbody__anims()
{
    level.scr_anim["dead_guy"]["pelayo_dying"] = %h1_aftermath_dyingbodies_pelayo;
    level.scr_anim["dead_guy"]["soldierA_dying"] = %h1_aftermath_dyingbodies_soldiera;
    level.scr_anim["dead_guy"]["soldierB_dying"] = %h1_aftermath_dyingbodies_soldierb;
    maps\_anim::addnotetrack_animsound( "dead_guy", "pelayo_dying", "scn_dying_soldier_b", "h1_vo_female_dying_breath_02" );
    maps\_anim::addnotetrack_animsound( "dead_guy", "soldierB_dying", "scn_dyin_pelayo_dying", "h1_male_crew_helico_suffering_02" );
    maps\_anim::addnotetrack_animsound( "dead_guy", "soldierA_dying", "scn_dying_soldier_a", "h1_male_crew_helico_suffering_01" );
}

#using_animtree("player");

player_body_sense()
{
    precachemodel( "worldbody_h1_usmc_desert" );
    level.scr_anim["player_body"]["jackson_wakeup"] = %h1_aftermath_jackson_wakeup;
    level.scr_anim["player_body"]["jackson_helicopterfall"] = %h1_aftermath_jackson_helicopterfall;
    level.scr_anim["player_body"]["jackson_fall"] = %h1_aftermath_jackson_fall;
    level.scr_anim["player_body"]["jackson_death"] = %h1_aftermath_jackson_death;
    level.scr_model["player_body"] = "h1_gfl_ump40_viewbody";
    level.scr_animtree["player_body"] = #animtree;
    maps\_anim::addnotetrack_animsound( "player_body", "jackson_death", "body_hit_ground", "bodyfall_gravel_large" );
}
