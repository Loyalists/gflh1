// H1 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

#using_animtree("generic_human");

main()
{
    level.scr_model["tank_draw"] = "vehicle_m1a1_abrams_drawing";
    precachemodel( maps\_utility::getmodel( "tank_draw" ) );
    level.scr_anim["paulsen"]["melee"] = %bog_melee_r_defend;
    level.scr_sound["paulsen"]["melee"] = "bog_scn_melee_struggle";
    level.scr_sound["paulsen"]["melee_sound_stop"] = "bog_scn_melee_struggle_end";
    level.scr_anim["paulsen"]["back_death1"] = %bog_melee_r_backdeath1;
    level.scr_anim["paulsen"]["back_death2"] = %bog_melee_r_backdeath2;
    level.scr_anim["paulsen"]["stand_death"] = %bog_melee_r_standdeath;
    maps\_anim::addnotetrack_customfunction( "paulsen", "fire", maps\bog_a_code::paulsen_end_fire, "stand_death" );
    maps\_anim::addnotetrack_customfunction( "paulsen", "end standdeath", maps\bog_a_code::paulsen_end_standdeath );
    maps\_anim::addnotetrack_customfunction( "paulsen", "start backdeath1", maps\bog_a_code::paulsen_start_backdeath1 );
    maps\_anim::addnotetrack_customfunction( "paulsen", "start backdeath2", maps\bog_a_code::paulsen_start_backdeath2 );
    level.scr_anim["price"]["tank_is_stuck"] = %bog_a_start_briefing;
    maps\_anim::addnotetrack_sound( "price", "dialog", "tank_is_stuck", "bog_vsq_halfaclick" );
    thread saw_ac_unit();
    level.scr_anim["saw"]["setup"] = %bog_a_saw_setup;
    level.scr_anim["saw"]["fire_loop"][0] = %bog_a_saw_fire;
    maps\_anim::addnotetrack_customfunction( "saw", "kick", maps\bog_a::kick_ac_unit );
    level.scr_anim["emslie"]["melee"] = %bog_melee_r_attack;
    level.scr_anim["emslie"]["melee_done"] = %pistol_stand_switch;
    level.scr_anim["emslie"]["death"] = %exposed_death_groin;
    maps\_anim::addnotetrack_customfunction( "emslie", "scn_melee_custom_pistol_fire", maps\bog_a_aud::play_melee_custom_pistol_fire_sfx, "melee" );
    level.scr_anim["generic"]["spin"] = %combatwalk_f_spin;
    level.scr_anim["price"]["wait_approach"] = %bog_price_wait_idle_approach;
    level.scr_anim["price"]["wait_idle"][0] = %bog_price_wait_idle;
    level.scr_anim["price"]["wave1"] = %bog_price_wait_wave_a;
    level.scr_anim["price"]["wave2"] = %bog_price_wait_wave_b;
    level.scr_sound["price"]["javelin_briefing"] = "bog_vsq_hitemwithjavelin";
    level.scr_anim["javelin_guy"]["hangout_arrival"] = %bog_a_javelin_jog_2_idle;
    level.scr_anim["javelin_guy"]["hangout_idle"][0] = %bog_a_javelin_idle;
    level.scr_anim["javelin_guy"]["run"] = %bog_a_javelin_jog;
    level.scr_anim["javelin_guy"]["death"] = %bog_a_javelin_death;
    level.scr_anim["generic"]["sprint"] = %sprint1_loop;
    level.scr_anim["price"]["sprint"] = %sprint1_loop;
    level.scr_sound["javelin_guy"]["right_away"] = "bog_gm2_rightaways_alt";
    level.scr_sound["price"]["get_jav"] = "bog_a_vsq_takeouttanks";
    level.scr_sound["price"]["jav_reminder_1"] = "bog_vsq_javelinsecondfloormove";
    level.scr_sound["price"]["jav_reminder_2"] = "bog_vsq_jacksonpickupjavelin";
    level.scr_anim["second_floor_right_guy"]["door_breach_setup"] = %shotgunbreach_v1_shoot_hinge;
    level.scr_anim["second_floor_right_guy"]["door_breach_setup_idle"][0] = %shotgunbreach_v1_shoot_hinge_idle;
    level.scr_anim["second_floor_right_guy"]["door_breach_idle"][0] = %shotgunbreach_v1_shoot_hinge_ready_idle;
    level.scr_anim["second_floor_right_guy"]["door_breach"] = %shotgunbreach_v1_shoot_hinge_runin;
    level.scr_anim["second_floor_left_guy"]["door_breach_setup"] = %shotgunbreach_v1_stackb;
    level.scr_anim["second_floor_left_guy"]["door_breach_setup_idle"][0] = %shotgunbreach_v1_stackb_idle;
    level.scr_anim["second_floor_left_guy"]["door_breach_idle"][0] = %shotgunbreach_v1_stackb_ready_idle;
    level.scr_anim["second_floor_left_guy"]["door_breach"] = %shotgunbreach_v1_stackb_runin;

    if ( getdvarint( "use_old_fence_cutting" ) == 1 )
    {
        level.scr_anim["fence_guy1"]["fence_cut"] = %icbm_fence_cutting_guy1;
        level.scr_anim["fence_guy2"]["fence_cut"] = %icbm_fence_cutting_guy2;
    }
    else
    {
        level.scr_anim["fence_guy1"]["fence_cut"] = %h1_bog_a_fence_cutting_guy1;
        level.scr_anim["fence_guy2"]["fence_cut"] = %h1_bog_a_fence_cutting_guy2;
    }

    maps\_anim::addnotetrack_animsound( "second_floor_right_guy", "door_breach_setup", "fire", "bog_a_doorbreach_scripted_gun" );
    maps\_anim::addnotetrack_animsound( "second_floor_right_guy", "door_breach", "fire", "bog_a_doorbreach_scripted_gun" );
    maps\_anim::addnotetrack_attach( "fence_guy1", "can_in_hand", "com_spray_can01", "tag_inhand", "fence_cut" );
    precachemodel( "com_spray_can01" );
    maps\_anim::addnotetrack_detach( "fence_guy1", "can_out_hand", "com_spray_can01", "tag_inhand", "fence_cut" );
    maps\_anim::addnotetrack_animsound( "fence_guy1", "fence_cut", "scn_icbm_fence_cut", "scn_bog_a_fence_cut" );
    maps\_anim::addnotetrack_animsound( "fence_guy1", "fence_cut", "scn_icbm_fence_pull", "scn_bog_a_fence_pull" );
    maps\_anim::addnotetrack_customfunction( "fence_guy1", "can_start_spray", ::spraycan_fx, "fence_cut" );
    maps\_anim::addnotetrack_customfunction( "fence_guy1", "can_stop_spray", ::spraycan_fx_stop, "fence_cut" );
    level.scr_sound["generic"]["move_it"] = "bog_gm2_moveit";
    level.scr_sound["generic"]["keep_moving_up"] = "bog_gm3_clearkeepmoving";
    level.scr_sound["generic"]["ambush1"] = "bog_gm2_ambush1";
    level.scr_sound["generic"]["ambush2"] = "bog_gm2_ambush2";
    level.scr_sound["guy_two"]["contact_left"] = "bog_gm2_contactleft";
    level.scr_sound["price"]["switch_to_night_vision"] = "bog_vsq_contactright";
    level.scr_sound["generic"]["contact_right"] = "bog_gm1_contactright";
    level.scr_sound["price"]["suppress_building"] = "bog_vsq_suppressionbuilding";
    level.scr_sound["price"]["keep_moving"] = "bog_vsq_keepforward";
    level.scr_sound["price"]["take_the_stairs"] = "bog_vsq_alphatakestairs";
    level.scr_sound["price"]["follow_me"] = "bog_vsq_letsgojackson";
    level.scr_sound["price"]["move_it"] = "bog_vsq_comeonjackson";
    level.scr_sound["price"]["this_way"] = "bog_vsq_jacksonthisway";
    level.scr_sound["price"]["head_upstairs"] = "bog_vsq_jacksonheadupstairs";
    level.scr_sound["price"]["hit_their_flank"] = "bog_vsq_hittheirflank";
    level.scr_sound["price"]["use_their_gun"] = "bog_vsq_usemachinegun";
    level.scr_sound["price"]["shoot_through_wall"] = "bog_vsq_cutemdown";
    level.scr_sound["price"]["good_job"] = "bog_vsq_goodjob";
    level.scr_sound["price"]["move_out"] = "bog_vsq_letsmoveout";
    level.scr_sound["price"]["flank_right"] = "bog_vsq_squadthisway";
    level.scr_sound["price"]["secure_the_upper_floors"] = "bog_vsq_gowithsgtpaulsen";
    level.scr_sound["second_floor_left_guy"]["clear"] = "bog_gm1_clear";
    level.scr_sound["second_floor_right_guy"]["clear"] = "bog_gm2_clear1";
    level.scr_sound["third_floor_left_guy"]["clear"] = "bog_gm2_clear2";
    level.scr_sound["third_floor_right_guy"]["clear"] = "bog_gm2_clear3";
    level.scr_sound["guy_one"]["more_holed_up"] = "bog_gm1_moreholedup";
    level.scr_sound["guy_three"]["coming_back_down"] = "bog_gm3_secondsquad";
    level.scr_sound["price"]["roger_that"] = "bog_gm2_rogerthat";
    level.scr_sound["price"]["working_on_it"] = "bog_vsq_workingonit";
    level.scr_sound["second_floor_left_guy"]["three_coming_out"] = "bog_gm1_threecomin";
    level.scr_sound["price"]["squad_regroup"] = "bog_vsq_squadregroup";
    level.scr_sound["guy_one"]["contact_overpass"] = "bog_gm1_contactoverpass";
    level.scr_sound["price"]["get_on_the_roof"] = "bog_vsq_skigettoroof";
    level.scr_sound["guy_two"]["got_the_javelin"] = "bog_gm2_ivegotjavelin";
    level.scr_sound["price"]["pickup_hint_1"] = "bog_a_vsq_takeouttanks";
    level.scr_sound["price"]["pickup_hint_2"] = "bog_a_vsq_pickupjavnow";
    level.scr_sound["price"]["pickup_hint_3"] = "bog_a_vsq_pickupjav";
    level.scr_sound["price"]["second_floor_hint_1"] = "bog_a_vsq_secondfloor";
    level.scr_sound["price"]["second_floor_hint_2"] = "bog_gm1_vehiclesbridge";
    level.scr_sound["price"]["right_away_s"] = "bog_gm2_rightaways";
    level.scr_sound["price"]["watch_your_fire"] = "bog_pls_onsecondfloor";
    level.scr_sound["paulsen"]["gah"] = "bog_pls_gah";
    level.scr_sound["paulsen"]["shoot_him"] = "bog_pls_shoothim";
    level.scr_sound["paulsen"]["thanks_jackson"] = "bog_pls_thanksjackson";
    level.scr_sound["saw"]["ton_of_them"] = "bog_ems_tonofem";
    level.scr_sound["price"]["shut_up"] = "bog_vsq_shutup";
    level.scr_sound["saw"]["suppressing_fire"] = "bog_ems_suppressingfire";
    level.scr_radio["shifting_fire"] = "bog_gm2_shiftingfire";
    level.scr_radio["get_there_asap"] = "bog_hqr_moreenemytroops";
    level.scr_radio["coming_from_south"] = "bog_vsq_cominginfromsouth";
    level.scr_radio["switch_off_nightvision"] = "bog_gm1_offnightvision";
    level.scr_radio["could_use_help"] = "bog_gm3_rogerthat";
    level.scr_sound["generic"]["hit_vehicles"] = "bog_gm2_hitvehicles";
    level.scr_sound["generic"]["backblast_clear"] = "bog_gm2_backblastclear";
    level.scr_sound["generic"]["hit_target_1"] = "bog_gm2_targetdestroyed";
    level.scr_sound["generic"]["hit_target_2"] = "bog_gm2_niceone";
    level.scr_sound["generic"]["hit_target_3"] = "bog_gm2_goodshotman";
    level.scr_sound["generic"]["hit_target_4"] = "bog_gm2_lastofem";
    level.scr_radio["where_are_you"] = "bog_gm3_bravosix";
    level.scr_sound["price"]["almost_there"] = "bog_vsq_almostthere";
    level.scr_sound["generic"]["other_side"] = "bog_gm2_tanksotherside";
    level.scr_sound["price"]["this_way"] = "bog_vsq_thiswayletsgo";
    door_setup();
    animated_model_setup();
    setup_exploder_anims();
    script_models();
}

#using_animtree("ac");

saw_ac_unit()
{
    level.scr_anim["ac"]["setup"] = %bog_a_ac_falldown;
    level.scr_animtree["ac"] = #animtree;
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

#using_animtree("door");

door_setup()
{
    level.scr_anim["door"]["door_breach"] = %shotgunbreach_door_immediate;
    level.scr_animtree["door"] = #animtree;
    level.scr_model["door"] = "com_door_01_handleleft2";
    precachemodel( level.scr_model["door"] );
}

setup_exploder_anims()
{
    level.exploder_animtrees = [];
    level.exploder_animtrees[0] = "exploder_script_model";
}

#using_animtree("script_model");

script_models()
{
    level.scr_animtree["fence"] = #animtree;

    if ( getdvarint( "use_old_fence_cutting" ) == 1 )
        level.scr_anim["fence"]["fence_cut"] = %icbm_fence_cutting_guy1_fence;
    else
        level.scr_anim["fence"]["fence_cut"] = %h1_bog_a_fence_cutting_guy1_fence;

    level.scr_model["fence"] = "icbm_fence_cut";
    precachemodel( maps\_utility::getmodel( "fence" ) );
    level.scr_animtree["exploder_script_model"] = #animtree;
    level.scr_anim["exploder_script_model"]["h1_boga_center0_anim"] = %h1_boga_center0_anim;
    level.scr_anim["exploder_script_model"]["h1_boga_center1_anim"] = %h1_boga_center1_anim;
    level.scr_anim["exploder_script_model"]["h1_boga_left0_anim"] = %h1_boga_left0_anim;
    level.scr_anim["exploder_script_model"]["h1_boga_left1_anim"] = %h1_boga_left1_anim;
    level.scr_anim["exploder_script_model"]["h1_boga_left2_anim"] = %h1_boga_left2_anim;
    level.scr_anim["exploder_script_model"]["h1_boga_left3_anim"] = %h1_boga_left3_anim;
}

spraycan_fx( var_0 )
{
    level endon( "stop_spray_fx" );
    level endon( "death" );

    for (;;)
    {
        playfxontag( common_scripts\utility::getfx( "freezespray" ), var_0, "tag_spraycan_fx" );
        wait 0.1;
    }
}

spraycan_fx_stop( var_0 )
{
    level notify( "stop_spray_fx" );
}
