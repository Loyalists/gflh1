// H1 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

#using_animtree("generic_human");

anim_main()
{
    maps\_anim::addnotetrack_customfunction( "generic", "fire", maps\armada::kill_during_breach, "detcord_stack_leftbreach_02" );
    anim_blackhawk();
    level.scr_anim["generic"]["jog"] = %combat_jog;
    level.scr_anim["generic"]["walk"] = %patrol_bored_patrolwalk;
    level.scr_anim["generic"]["patrol_stop"] = %patrol_bored_walk_2_bored;
    level.scr_anim["price"]["hunted_open_barndoor"] = %h1_armada_vasquez_open_door;
    level.scr_anim["price"]["hunted_open_barndoor_stop"] = %h1_armada_vasquez_open_door_stop;
    level.scr_anim["price"]["hunted_open_barndoor_idle"][0] = %h1_armada_vasquez_open_door_idle;
    animated_model_setup();
    level.scr_anim["razorwire_guy"]["razor_setup"] = %armada_wire_setup_guy;
    level.scr_anim["barbed_wire_long"]["razor_setup"] = %armada_wire_setup_wire;
    level.scr_anim["razorwire_guy"]["razor_idle"] = %armada_wire_setup_guy_startidle;
    level.scr_anim["barbed_wire_long"]["razor_idle"] = %armada_wire_setup_wire_startidle;
    level.scr_anim["razorwire_guy"]["razor_endidle"] = %armada_wire_setup_guy;
    level.scr_anim["barbed_wire_long"]["razor_endidle"] = %armada_wire_setup_wire_endidle;
    level.scr_animtree["barbed_wire_long"] = #animtree;
    level.scr_anim["griggs"]["enter"] = %armada_grigs_enter;
    maps\_anim::addnotetrack_dialogue( "griggs", "dialog", "enter", "armada_grg_scoreone" );
    maps\_anim::addnotetrack_dialogue( "griggs", "dialog", "enter", "armada_grg_rogerMS" );
    maps\_anim::addnotetrack_dialogue( "griggs", "dialog", "enter", "armada_grg_yeahoorah" );
    maps\_anim::addnotetrack_attach( "griggs", "attach_usbkey", "h1_me_armada_usb_device", "tag_weapon_chest", "enter" );
    maps\_anim::addnotetrack_detach( "griggs", "detach_usbkey", "h1_me_armada_usb_device", "tag_weapon_chest", "enter" );
    maps\_anim::addnotetrack_notify( "griggs", "Grab_USB", "trash_asad_usb", "enter" );
    maps\_anim::addnotetrack_notify( "griggs", "Throw_USB", "grounded_asad_usb", "enter" );
    maps\_anim::addnotetrack_customfunction( "griggs", "detach_usbkey", maps\armada::ending_griggs_usbkey_think, "enter" );
    level.scr_anim["final_breacher_shotgun"]["react"] = %armada_left_guy_react;
    level.scr_anim["final_breacher_right"]["react"] = %armada_right_guy_react;
    level.scr_anim["price"]["enter"] = %armada_sarge_enter;
    maps\_anim::addnotetrack_dialogue( "price", "dialog", "enter", "armada_vsq_griggsmusic" );
    maps\_anim::addnotetrack_dialogue( "price", "dialog", "enter", "armada_vsq_recording" );
    maps\_anim::addnotetrack_dialogue( "price", "dialog", "enter", "armada_vsq_rogercommand" );
    maps\_anim::addnotetrack_dialogue( "price", "dialog", "enter", "armada_vsq_rallyup" );
    anim_props();
    level.scr_sound["price"]["targetbuilding"] = "armada_vsq_targetbuilding";
    level.scr_sound["price"]["throwflash"] = "armada_vsq_throwflash";
    level.scr_sound["griggs"]["watchsix"] = "armada_grg_watchsix";
    level.scr_sound["price"]["allcallsigns"] = "armada_vsq_allcallsigns";
    level.scr_sound["generic"]["negid"] = "armada_gm1_negid";
    level.scr_sound["generic"]["nosign"] = "armada_gm2_nosign";
    level.scr_sound["generic"]["oorah1"] = "armada_gm2_oorah";
    level.scr_sound["generic"]["oorah2"] = "armada_gm3_oorah";
    level.scr_sound["generic"]["armada_gm1_clear"] = "armada_gm1_clear";
    level.scr_sound["generic"]["armada_gm2_clear"] = "armada_gm2_clear";
    level.scr_sound["generic"]["armada_gm3_roomclear"] = "armada_gm3_roomclear";
    level.scr_sound["generic"]["armada_gm2_nothere"] = "armada_gm2_nothere";
    level.scr_sound["generic"]["armada_gm1_onaloop"] = "armada_gm1_onaloop";
    level.scr_sound["price"]["jacksonpoint"] = "armada_vsq_jacksonpoint";
    level.scr_sound["price"]["stand_down"] = "armada_vsq_donthavealasad";
    level.scr_sound["price"]["roger_hq"] = "armada_vsq_rogerthat";
    level.scr_sound["price"]["heads_up"] = "armada_vsq_halfclickeast";
    level.scr_sound["price"]["move_out"] = "armada_vsq_moveout";
    level.scr_sound["generic"]["tvstation"] = "armada_gm1_tvstation";
    level.scr_sound["price"]["get_into_pos"] = "armada_vsq_getintoposition";
    level.scr_sound["price"]["do_it"] = "armada_vsq_doit";
    level.scr_sound["generic"]["breaching_breaching"] = "armada_gm1_breachingbreaching";
    level.scr_sound["price"]["room_clear"] = "armada_vsq_roomclear";
    level.scr_sound["generic"]["goesourboys"] = "armada_gm1_goesourboys";
    level.scr_sound["griggs"]["hold_fire"] = "armada_grg_holdfire";
    level.scr_sound["griggs"]["no_sign"] = "armada_grg_nosign";
    level.scr_sound["price"]["fall_in"] = "armada_vsq_fallin";
    level.scr_sound["griggs"]["I_hear_him"] = "armada_grg_ihearhim";
    level.scr_sound["griggs"]["score_one"] = "armada_grg_scoreone";
    level.scr_sound["price"]["grigs_music"] = "armada_vsq_griggsmusic";
    level.scr_sound["griggs"]["roger_that"] = "armada_grg_rogerMS";
    level.scr_sound["price"]["recording"] = "armada_vsq_recording";
    level.scr_sound["griggs"]["yeahhh"] = "armada_grg_yeahoorah";
    level.scr_sound["price"]["roger_command"] = "armada_vsq_rogercommand";
    level.scr_sound["price"]["new_assign"] = "armada_vsq_rallyup";
}

guy_snipe( var_0, var_1 )
{
    var_2 = maps\_vehicle_aianim::anim_pos( self, var_1 );
    var_0 endon( "newanim" );
    self endon( "death" );
    var_0 endon( "death" );
    self notify( "ropeidleend" );

    if ( var_1 == 2 )
        maps\_vehicle_aianim::animontag( var_0, var_2.sittag, %armada_blackhawk_sniper_idle );

    thread maps\_vehicle_aianim::guy_idle( var_0, var_1 );
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
}

#using_animtree("vehicles");

anim_blackhawk()
{
    level.scr_animtree["blackhawk"] = #animtree;
    level.scr_anim["blackhawk"]["interiorwires"][0] = %h1_blackhawk_interiorwires;
}

player_heli_ropeanimoverride()
{
    var_0 = "TAG_FastRope_RI";
    var_1 = "rope_test_ri";
    var_2 = %armada_blackhawk_sniper_idle_fastrope80;
    var_3 = %armada_blackhawk_sniper_idle_loop_fastrope80;
    var_4 = %armada_blackhawk_sniper_drop_fastrope80;
    var_5 = [];
    var_5["TAG_FastRope_RI"] = spawnstruct();
    self.attach_model_override = var_5;
    var_6 = spawn( "script_model", level.player.origin );
    var_6 setmodel( var_1 );
    var_6 linkto( self, var_0, ( 0.0, 0.0, 0.0 ), ( 0.0, 0.0, 0.0 ) );
    var_6 useanimtree( #animtree );
    thread player_heli_ropeanimoverride_idle( var_6, var_0, var_3 );
    self waittill( "unloading" );
    level.player thread maps\_utility::play_sound_on_entity( "scn_armada_intro_foley" );
    thread maps\_vehicle_aianim::animontag( var_6, var_0, var_4 );
    wait(getanimlength( var_4 ) - 1.8);
    var_6 unlink();
    wait 10;
    var_6 delete();
}

player_heli_ropeanimoverride_idle( var_0, var_1, var_2 )
{
    self endon( "unloading" );

    for (;;)
        maps\_vehicle_aianim::animontag( var_0, var_1, var_2 );
}

#using_animtree("animated_props");

anim_props()
{
    level.anim_prop_models["h1_foliage_backlot_palm_tree_02_hero"]["still"] = %h1_foliage_backlot_palm_tree_02_hero_still;
    level.anim_prop_models["h1_foliage_backlot_palm_tree_02_hero"]["strong"] = %h1_foliage_backlot_palm_tree_02_hero_sway;
    level.anim_prop_models["h1_foliage_backlot_palm_tree_02_hero"]["heli"] = %h1_foliage_backlot_palm_tree_02_hero_heliwash;
    level.anim_prop_models["h1_foliage_backlot_palm_tree_03_hero"]["still"] = %h1_foliage_backlot_palm_tree_03_hero_still;
    level.anim_prop_models["h1_foliage_backlot_palm_tree_03_hero"]["strong"] = %h1_foliage_backlot_palm_tree_03_hero_sway;
    level.anim_prop_models["h1_foliage_backlot_palm_tree_03_hero"]["heli"] = %h1_foliage_backlot_palm_tree_03_hero_heliwash;
    level.scr_animtree["asad_usbkey"] = #animtree;
    level.scr_model["asad_usbkey"] = "h1_me_armada_usb_device";
    level.scr_anim["asad_usbkey"]["enter"] = %h1_armada_grigs_enter_usbdevice;
}
