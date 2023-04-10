// H1 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

main()
{
    anim_human();
    anim_playerview();
    anim_vehicles();
    anim_door();
    anim_trashcan();
    anim_dumpster();
    anim_props();
    anim_chickens();
    anim_dogs();
    maps\_props::add_smoking_notetracks( "human" );
}

#using_animtree("player");

anim_playerview()
{
    level.scr_animtree["playerview"] = #animtree;
    level.scr_model["playerview"] = "h2_gfl_commander_worldbody";
    level.scr_anim["playerview"]["intro"] = %coup_opening_playerview;
    level.scr_anim["playerview"]["car_idle_fullbody"] = %h1_coup_player_idle;
    level.scr_anim["playerview"]["car_idle"][0] = %coup_opening_playerview_idle;
    level.scr_anim["playerview"]["car_idle_firstframe"] = %coup_opening_playerview_idle;
    level.scr_anim["playerview"]["carexit"] = %coup_ending_drag_playerview;
    level.scr_anim["playerview"]["endtaunt"] = %coup_ending_zakhaev_intro_playerview;
    level.scr_anim["playerview"]["ending"] = %coup_ending_player;
    level.scr_anim["playerview"]["playerview_idle_normal"] = %coup_opening_playerview_idle_normal;
    level.scr_anim["playerview"]["playerview_idle_smooth"] = %coup_opening_playerview_idle_smooth;
    level.scr_anim["playerview"]["playerview_idle_bumpy"] = %coup_opening_playerview_idle_bumpy;
    level.scr_anim["playerview"]["playerview_idle_static"] = %coup_opening_playerview_idle_static;
    maps\_anim::addnotetrack_flag( "playerview", "start_car_rearview_mirror_video", "start_car_rearview_mirror_video" );
    maps\_anim::addnotetrack_customfunction( "playerview", "throw_in_car", ::playerthrownincar, "intro" );
    maps\_anim::addnotetrack_customfunction( "playerview", "hit", ::playerhit, "intro" );
    maps\_anim::addnotetrack_customfunction( "playerview", "pulled_from_car", ::playerpulledfromcar, "carexit" );
    maps\_anim::addnotetrack_customfunction( "playerview", "kick", ::playerkicked, "carexit" );
}

#using_animtree("generic_human");

anim_human()
{
    level.scr_animtree["human"] = #animtree;
    level.scr_anim["human"]["stand_and_crouch"] = %stand_and_crouch;
    level.scr_anim["human"]["cardriver_idle"][0] = %coup_driver_idle;
    level.scr_anim["human"]["cardriver_bigleft2center"] = %coup_driver_bigleft2center;
    level.scr_anim["human"]["cardriver_bigleft_idle"][0] = %coup_driver_bigleft_idle;
    level.scr_anim["human"]["cardriver_bigleftloop"] = %coup_driver_bigleft_loop;
    level.scr_anim["human"]["cardriver_center2smallleft"] = %coup_driver_center2smallleft;
    level.scr_anim["human"]["cardriver_center2smallright"] = %coup_driver_center2smallright;
    level.scr_anim["human"]["cardriver_lookright"] = %coup_driver_lookright;
    level.scr_anim["human"]["cardriver_smallleft2bigleft"] = %coup_driver_smallleft2bigleft;
    level.scr_anim["human"]["cardriver_smallleft2center"] = %coup_driver_smallleft2center;
    level.scr_anim["human"]["cardriver_smallleft_idle"][0] = %coup_driver_smallleft_idle;
    level.scr_anim["human"]["cardriver_smallright2center"] = %coup_driver_smallright2center;
    level.scr_anim["human"]["cardriver_smallright_idle"][0] = %coup_driver_smallright_idle;
    level.scr_anim["human"]["cardriver_wave1"] = %coup_driver_wave1;
    level.scr_anim["human"]["cardriver_wave2"] = %coup_driver_wave2;
    level.scr_anim["human"]["cardriver_fulldrive"] = %h1_coup_03_driver_idle;
    level.scr_anim["human"]["carpassenger_idle"][0] = %coup_passenger_idle;
    level.scr_anim["human"]["carpassenger_phone"] = %coup_passenger_phone;
    level.scr_anim["human"]["carpassenger_point"] = %coup_passenger_point;
    level.scr_anim["human"]["carpassenger_pointturn"] = %coup_passenger_pointturn;
    level.scr_anim["human"]["carpassenger_lookback"] = %coup_passenger_lookback;
    level.scr_anim["human"]["carpassenger_lookright"] = %coup_passenger_lookright;
    level.scr_anim["human"]["carpassenger_shiftweight"] = %coup_passenger_shiftweight;
    level.scr_anim["human"]["carpassenger_fulldrive"] = %h1_coup_03_passenger_idle;
    level.scr_anim["human"]["intro_leftguard"] = %coup_opening_guyl;
    level.scr_anim["human"]["intro_rightguard"] = %coup_opening_guyr;
    level.scr_anim["human"]["intro_idle_soldier_left"] = %h1_coup_01_soldieraidlestanding_left;
    level.scr_anim["human"]["intro_idle_soldier_right"] = %h1_coup_01_soldierbidlestanding_right;
    level.scr_anim["human"]["intro_cardriver"] = %h1_coup_01_driver;
    level.scr_anim["human"]["intro_carpassenger"] = %h1_coup_01_zakhaevson;
    level.scr_anim["human"]["intro_spittingguard"] = %h1_coup_01_soldierdspitting;
    level.scr_anim["human"]["intro_soldierholdcivilian"] = %h1_coup_01_soldiercholdcivilian;
    level.scr_anim["human"]["intro_civilianliesdown"] = %h1_coup_01_civilianliesdown;
    level.scr_anim["human"]["carexit_leftguard"] = %coup_ending_drag_guyl;
    level.scr_anim["human"]["carexit_rightguard"] = %coup_ending_drag_guyr;
    level.scr_anim["human"]["carexit_driver"] = %h1_coup_24_driver;
    level.scr_anim["human"]["carexit_passenger"] = %h1_coup_24_zakhaevson;
    level.scr_anim["human"]["close_garage_a"] = %unarmed_close_garage;
    level.scr_anim["human"]["close_garage_b"] = %unarmed_close_garage_v2;
    level.scr_anim["human"]["window_shout_a"] = %unarmed_shout_window;
    level.scr_anim["human"]["window_shout_b"] = %unarmed_shout_window_v2;
    level.scr_anim["human"]["leaning_smoking_idle"][0] = %parabolic_leaning_guy_smoking_idle;
    level.scr_anim["human"]["radio"] = %casual_stand_v2_twitch_radio;
    level.scr_anim["human"]["talkingguards_leftguard"] = %coup_talking_patrol_guy1;
    level.scr_anim["human"]["talkingguards_rightguard"] = %coup_talking_patrol_guy2;
    level.scr_anim["human"]["ending_leftguard"] = %coup_ending_guyl;
    level.scr_anim["human"]["ending_rightguard"] = %coup_ending_guyr;
    level.scr_anim["human"]["ending_alasad"] = %coup_ending_alasad;
    level.scr_anim["human"]["ending_zakhaev"] = %coup_ending_zakhaev;
    level.scr_anim["human"]["endtaunt"] = %coup_ending_zakhaev_intro;
    level.scr_anim["human"]["ziptie_civilian_idle"][0] = %ziptie_suspect_idle;
    level.scr_anim["human"]["crowdmember_gunup_idle"] = %coup_guard1_idle;
    level.scr_anim["human"]["crowdmember_gunup_fire"] = %coup_guard1_jeer;
    level.scr_anim["human"]["crowdmember_gundown_idle"] = %coup_guard2_idle;
    level.scr_anim["human"]["crowdmember_gundown_jeer"] = %coup_guard2_jeera;
    level.scr_anim["human"]["crowdmember_gundown_fire_a"] = %coup_guard2_jeerb;
    level.scr_anim["human"]["crowdmember_gundown_fire_b"] = %coup_guard2_jeerc;
    level.scr_anim["human"]["crowdmember_witnessing_arrival_gunup"][0] = %h1_coup_26_witnessingthearrival_soldier_01;
    level.scr_anim["human"]["crowdmember_witnessing_arrival_taunt"][0] = %h1_coup_26_witnessingthearrival_soldier_02;
    level.scr_anim["human"]["crowdmember_witnessing_arrival_cutroat_1"][0] = %h1_coup_26_witnessingthearrival_soldier_03;
    level.scr_anim["human"]["crowdmember_witnessing_arrival_cutroat_2"][0] = %h1_coup_26_witnessingthearrival_soldier_04;
    level.scr_anim["human"]["crowdmember_witnessing_arrival_spitting"][0] = %h1_coup_26_witnessingthearrival_soldier_05;
    level.scr_anim["human"]["crowdmember_witnessing_arrival_crossedarms"][0] = %h1_coup_26_witnessingthearrival_soldier_06;
    level.scr_anim["human"]["crowdmember_soldier_welcome_1"][0] = %h1_coup_soldiers_welcome_01;
    level.scr_anim["human"]["crowdmember_soldier_welcome_2"][0] = %h1_coup_soldiers_welcome_02;
    level.scr_anim["human"]["crowdmember_soldier_welcome_3"] = %h1_coup_soldiers_welcome_03;
    level.scr_anim["human"]["crowdmember_soldier_welcome_4"][0] = %h1_coup_soldiers_welcome_04;
    level.scr_anim["human"]["run_panicked1"] = %unarmed_panickedrun_loop_v1;
    level.scr_anim["human"]["run_panicked2"] = %unarmed_panickedrun_loop_v2;
    level.scr_anim["human"]["civilians_running_garage"] = %h1_coup_13_twocivilians_running_civil01;
    level.scr_anim["human"]["civilians_running_02"] = %h1_coup_13_twocivilians_running_civil02;
    level.scr_anim["human"]["civilians_running_03"] = %h1_coup_13_twocivilians_running_civil03;
    level.scr_anim["human"]["civilians_running_04"] = %h1_coup_13_twocivilians_running_civil04;
    level.scr_anim["human"]["runinto_garage_left"] = %unarmed_runinto_garage_left;
    level.scr_anim["human"]["runinto_garage_right"] = %unarmed_runinto_garage_right;
    level.scr_anim["human"]["spraypainting"] = %coup_spraypainting_sequence;
    maps\_anim::addnotetrack_customfunction( "human", "start_spray", ::fx_paint_spray_coup, "spraypainting" );
    maps\_anim::addnotetrack_customfunction( "human", "end_spray", ::fx_stop_paint_spray_coup, "spraypainting" );
    maps\_anim::addnotetrack_customfunction( "human", "drop_can", ::detach_paint_spray_coup, "spraypainting" );
    level.scr_anim["human"]["civiliankilled_tumblesoncar"] = %h1_coup_opening_car_driving_civiliangetskilled_runner;
    level.scr_anim["human"]["civiliankilled_guard_a"] = %h1_coup_opening_car_driving_civiliangetskilled_soldiera;
    level.scr_anim["human"]["civiliankilled_guard_b"] = %h1_coup_opening_car_driving_civiliangetskilled_soldierb;
    level.scr_anim["human"]["wall_climb"] = %h1_coup_19_dogthreat;
    level.scr_anim["human"]["sneakattack_attack_side"] = %melee_l_attack;
    level.scr_anim["human"]["sneakattack_defend_side"] = %melee_l_defend;
    level.scr_anim["human"]["sneakattack_attack_behind"] = %melee_b_attack;
    level.scr_anim["human"]["sneakattack_defend_behind"] = %melee_b_defend;
    level.scr_anim["human"]["patrol_walk"] = %patrol_bored_patrolwalk;
    level.scr_anim["human"]["aim_straight"][0] = %stand_aim_straight;
    level.scr_anim["human"]["cowerstand_idle"][0] = %unarmed_cowerstand_idle;
    level.scr_anim["human"]["cowerstand_pointidle"][0] = %unarmed_cowerstand_pointidle;
    level.scr_anim["human"]["cowerstand_point_to_idle"] = %unarmed_cowerstand_point2idle;
    level.scr_anim["human"]["cowerstand_idle_to_point"] = %unarmed_cowerstand_idle2point;
    level.scr_anim["human"]["cowerstand_react"] = %unarmed_cowerstand_react;
    level.scr_anim["human"]["cowerstand_react_to_crouch"] = %unarmed_cowerstand_react_2_crouch;
    level.scr_anim["human"]["cowercrouch_idle"][0] = %unarmed_cowercrouch_idle;
    level.scr_anim["human"]["cowercrouch_idle_duck"] = %unarmed_cowercrouch_idle_duck;
    level.scr_anim["human"]["cowercrouch_react_a"] = %unarmed_cowercrouch_react_a;
    level.scr_anim["human"]["cowercrouch_react_b"] = %unarmed_cowercrouch_react_b;
    level.scr_anim["human"]["cowercrouch_to_stand"] = %unarmed_cowercrouch_crouch_2_stand;
    level.scr_anim["human"]["ziptie_guard"] = %ziptie_soldier;
    level.scr_anim["human"]["ziptie_civilian"] = %ziptie_suspect;
    level.scr_anim["human"]["doorkick_left_idle"] = %shotgunbreach_v1_shoot_hinge_idle;
    level.scr_anim["human"]["doorkick_left_stepout"] = %shotgunbreach_v1_shoot_hinge;
    level.scr_anim["human"]["doorkick_left_runin"] = %shotgunbreach_v1_shoot_hinge_runin;
    level.scr_anim["human"]["doorkick_right_idle"] = %shotgunbreach_v1_stackb_idle;
    level.scr_anim["human"]["doorkick_right_stepout_runin"] = %shotgunbreach_v1_stackb;
    level.scr_anim["human"]["carjack_victim"] = %ac130_carjack_driver_1a;
    level.scr_anim["human"]["carjack_driver"] = %ac130_carjack_1a;
    level.scr_anim["human"]["carjack_frontright"] = %ac130_carjack_2;
    level.scr_anim["human"]["carjack_backright"] = %ac130_carjack_3;
    level.scr_anim["human"]["carjack_backleft"] = %ac130_carjack_4;
    level.scr_anim["human"]["stand_idle"][0] = %casual_stand_idle;
    level.scr_anim["human"]["dumpster_open"] = %coup_dumpster_man;
    level.scr_anim["human"]["interrogation_suspect_a"] = %coup_civilians_interrogated_civilian_v1;
    level.scr_anim["human"]["interrogation_suspect_b"] = %coup_civilians_interrogated_civilian_v2;
    level.scr_anim["human"]["interrogation_suspect_c"] = %coup_civilians_interrogated_civilian_v3;
    level.scr_anim["human"]["interrogation_suspect_d"] = %coup_civilians_interrogated_civilian_v4;
    level.scr_anim["human"]["interrogation_guard_a"] = %coup_civilians_interrogated_guard_v1;
    level.scr_anim["human"]["interrogation_guard_b"] = %coup_civilians_interrogated_guard_v2;
    level.scr_anim["human"]["interrogation_civilian_4"] = %h1_coup_civilians_interrogated_civilian_v1;
    level.scr_anim["human"]["interrogation_civilian_5b"] = %h1_coup_civilians_interrogated_civilian_v2;
    level.scr_anim["human"]["interrogation_civilian_5"] = %h1_coup_civilians_interrogated_civilian_v3;
    level.scr_anim["human"]["interrogation_guard_4"] = %h1_coup_civilians_interrogated_guard_v1;
    level.scr_anim["human"]["interrogation_guard_5b"] = %h1_coup_civilians_interrogated_guard_v2;
    level.scr_anim["human"]["interrogation_guard_5"] = %h1_coup_civilians_interrogated_guard_v3;
    maps\_anim::addnotetrack_animsound( "human", "interrogation_guard_5b", "scream", "coup_scream_female" );
    maps\_anim::addnotetrack_animsound( "human", "interrogation_guard_5b", "death", "coup_death_female" );
    level.scr_animtree["generic"] = #animtree;
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
    level.scr_anim["generic"]["npcline_run_wavearm"][0] = %coup_09_soldiers_front;
    level.scr_anim["generic"]["npcline_run_headdown"][0] = %coup_09_soldiers_middle;
    level.scr_anim["generic"]["npcline_run_lookback"][0] = %coup_09_soldiers_last;
    level.scr_anim["generic"]["npcline_run_generic"][0] = %coup_09_soldiers_oldone;
    level.scr_anim["generic"]["death_runners1"] = %s1_run_death_facedown;
    level.scr_anim["human"]["execution_victim_captain"] = %h1_coup_21_execution_captain;
    level.scr_anim["human"]["execution_victim_female_01"] = %h1_coup_21_execution_female_01;
    level.scr_anim["human"]["execution_victim_female_02"] = %h1_coup_21_execution_female_02;
    level.scr_anim["human"]["execution_victim_male_01_L"] = %h1_coup_21_execution_male_01_l;
    level.scr_anim["human"]["execution_victim_male_01_R"] = %h1_coup_21_execution_male_01_r;
    level.scr_anim["human"]["execution_victim_male_02_L"] = %h1_coup_21_execution_male_02_l;
    level.scr_anim["human"]["execution_victim_male_02_R"] = %h1_coup_21_execution_male_02_r;
    level.scr_anim["human"]["execution_victim_male_03_L"] = %h1_coup_21_execution_male_03_l;
    level.scr_anim["human"]["execution_victim_male_03_R"] = %h1_coup_21_execution_male_03_r;
    level.scr_anim["human"]["execution_victim_male_04_L"] = %h1_coup_21_execution_male_04_l;
    level.scr_anim["human"]["execution_victim_male_04_R"] = %h1_coup_21_execution_male_04_r;
    level.scr_anim["human"]["execution_soldier_01"] = %h1_coup_21_execution_soldiers_01;
    level.scr_anim["human"]["execution_soldier_02"] = %h1_coup_21_execution_soldiers_02;
    level.scr_anim["human"]["execution_soldier_03"] = %h1_coup_21_execution_soldiers_03;
    level.scr_anim["human"]["execution_soldier_04"] = %h1_coup_21_execution_soldiers_04;
    level.scr_anim["human"]["execution_soldier_05"] = %h1_coup_21_execution_soldiers_05;
    level.scr_anim["human"]["execution_soldier_06"] = %h1_coup_21_execution_soldiers_06;
    maps\_anim::addnotetrack_customfunction( "human", "execution_fire", ::shootcivilianexecution );
    maps\_anim::addnotetrack_customfunction( "human", "melee", ::melee_kill, "sneakattack_attack_side" );
    maps\_anim::addnotetrack_customfunction( "human", "no death", ::rag_doll_death, "sneakattack_defend_side" );
    maps\_anim::addnotetrack_customfunction( "human", "end", ::kill_self, "sneakattack_defend_side" );
    maps\_anim::addnotetrack_customfunction( "human", "melee", ::melee_kill, "sneakattack_attack_behind" );
    maps\_anim::addnotetrack_customfunction( "human", "no death", ::rag_doll_death, "sneakattack_defend_behind" );
    maps\_anim::addnotetrack_customfunction( "human", "end", ::kill_self, "sneakattack_defend_behind" );
    maps\_anim::addnotetrack_detach( "human", "detach gun", "weapon_desert_eagle_silver_HR_promo", "tag_inhand", "ending_zakhaev" );
    maps\_anim::addnotetrack_attach( "human", "attach gun", "weapon_desert_eagle_silver_HR_promo", "tag_inhand", "ending_alasad" );
    maps\_anim::addnotetrack_attach( "human", "attach_cellphone", "com_cellphone_on", "tag_inhand", "carpassenger_phone" );
    maps\_anim::addnotetrack_detach( "human", "detach_cellphone", "com_cellphone_on", "tag_inhand", "carpassenger_phone" );
    maps\_anim::addnotetrack_attach( "human", "attach_cellphone", "com_cellphone_on", "tag_inhand", "carpassenger_fulldrive" );
    maps\_anim::addnotetrack_detach( "human", "detach_cellphone", "com_cellphone_on", "tag_inhand", "carpassenger_fulldrive" );
    maps\_anim::addnotetrack_customfunction( "human", "detach_cellphone", ::attach_phone_to_car, "carpassenger_fulldrive" );
    maps\_anim::addnotetrack_customfunction( "human", "phone_ring", ::play_soz_ringtone, "carpassenger_fulldrive", "scn_coup_mobile_ring" );
    maps\_anim::addnotetrack_customfunction( "human", "phone_dialog", ::play_soz_vo, "carpassenger_fulldrive", "coup_ab4_wehavetraitor" );
    maps\_anim::addnotetrack_customfunction( "human", "turn_left", ::play_soz_vo, "carpassenger_fulldrive", "coup_ab4_turnlefthere" );
    maps\_anim::addnotetrack_customfunction( "human", "turn_right", ::play_soz_vo, "carpassenger_fulldrive", "coup_ab4_rightatintersection" );
    maps\_anim::addnotetrack_customfunction( "human", "answer_phone", ::play_soz_foley, "carpassenger_fulldrive", "scn_coup_car_soz_foley_02" );
    maps\_anim::addnotetrack_customfunction( "human", "look_back_phone", ::play_soz_foley, "carpassenger_fulldrive", "scn_coup_car_soz_foley_03" );
    maps\_anim::addnotetrack_customfunction( "human", "throws_phone", ::play_soz_foley, "carpassenger_fulldrive", "scn_coup_car_soz_foley_04" );
    maps\_anim::addnotetrack_customfunction( "human", "fire_renamed", ::crowdfireweapon, "crowdmember_gunup_fire" );
    maps\_anim::addnotetrack_customfunction( "human", "fire_renamed", ::crowdfireweapon, "crowdmember_gundown_fire_a" );
    maps\_anim::addnotetrack_customfunction( "human", "fire_renamed", ::crowdfireweapon, "crowdmember_gundown_fire_b" );
    maps\_anim::addnotetrack_customfunction( "human", "fire_renamed", ::crowdfireweapon, "crowdmember_soldier_welcome_3" );
    maps\_anim::addnotetrack_customfunction( "human", "soz_foley", ::passengerlookback, "intro_leftguard" );
    maps\_anim::addnotetrack_customfunction( "human", "closing_door", ::ambientcarinterior, "intro_leftguard" );
    maps\_anim::addnotetrack_customfunction( "human", "door_open", ::ambientcarexterior, "carexit_leftguard" );
    maps\_anim::addnotetrack_customfunction( "human", "fire_gun", ::playerdeath, "ending_alasad" );
    maps\_anim::addnotetrack_flag( "car", "civiliankilled_tumblesoncar", "drive_trashstumble" );
    maps\_anim::addnotetrack_flag( "car", "civilians_running_to_garage", "drive_runtogarage" );
    maps\_anim::addnotetrack_customfunction( "human", "fire", ::shootciviliantrashstumble, "civiliankilled_guard_a" );
    maps\_anim::addnotetrack_customfunction( "human", "fire", ::shootciviliantrashstumble, "civiliankilled_guard_b" );
    maps\_anim::addnotetrack_flag( "human", "spawn_operator", "spawn_garage_operator", "civilians_running_garage" );
    maps\_anim::addnotetrack_flag( "human", "animate_operator", "animate_garage_operator", "civilians_running_garage" );
    maps\_anim::addnotetrack_customfunction( "human", "fire", ::shootcivilianinterrogation1, "interrogation_guard_5b" );
}

play_soz_vo( var_0, var_1 )
{
    level.car.passenger.head thread maps\_utility::play_sound_on_entity( var_1 );
}

play_soz_foley( var_0, var_1 )
{
    level.car.passenger.body thread maps\_utility::play_sound_on_entity( var_1 );
}

play_soz_ringtone( var_0, var_1 )
{
    level.car.passenger.phone thread maps\_utility::play_sound_on_entity( var_1 );
}

#using_animtree("vehicles");

anim_vehicles()
{
    level.scr_animtree["car"] = #animtree;
    level.scr_model["car"] = "vehicle_luxurysedan_viewmodel";
    level.scr_anim["car"]["intro"] = %coup_opening_car;
    level.scr_anim["car"]["coup_car_driving"] = %coup_opening_car_driving;
    level.scr_anim["car"]["car_idle_normal"] = %coup_opening_car_driving_idle_normal;
    level.scr_anim["car"]["car_idle_smooth"] = %coup_opening_car_driving_idle_smooth;
    level.scr_anim["car"]["car_idle_bumpy"] = %coup_opening_car_driving_idle_bumpy;
    level.scr_anim["car"]["car_idle_static"] = %coup_opening_car_driving_idle_static;
    level.scr_anim["car"]["carexit"] = %coup_ending_drag_cardoor;
    maps\_anim::addnotetrack_animsound( "car", "coup_car_driving", "bump_front_01", "scn_coup_car_bump_front_01" );
    maps\_anim::addnotetrack_animsound( "car", "coup_car_driving", "big_turn_left_01", "scn_coup_car_turn_01" );
    maps\_anim::addnotetrack_animsound( "car", "coup_car_driving", "brake_civilian", "scn_coup_car_brake_01" );
    maps\_anim::addnotetrack_animsound( "car", "coup_car_driving", "big_turn_left_02", "scn_coup_car_turn_02" );
    maps\_anim::addnotetrack_animsound( "car", "coup_car_driving", "suspension_rattle_01", "scn_coup_car_suspension_rattle_front_01" );
    maps\_anim::addnotetrack_animsound( "car", "coup_car_driving", "big_turn_left_03", "scn_coup_car_turn_02" );
    maps\_anim::addnotetrack_animsound( "car", "coup_car_driving", "brake_end", "scn_coup_car_brake_02" );
    maps\_anim::addnotetrack_customfunction( "car", "start_ride", ::play_engine, "coup_car_driving", "01" );
    maps\_anim::addnotetrack_customfunction( "car", "start_ride", ::car_event, "coup_car_driving", "start_ride" );
    maps\_anim::addnotetrack_customfunction( "car", "restart_ride", ::play_engine, "coup_car_driving", "02" );
    maps\_anim::addnotetrack_customfunction( "car", "big_turn_left_01", ::car_event, "coup_car_driving", "big_turn_left_01" );
    maps\_anim::addnotetrack_customfunction( "car", "brake_civilian", ::car_event, "coup_car_driving", "brake_civilian" );
    maps\_anim::addnotetrack_customfunction( "car", "big_turn_left_02", ::car_event, "coup_car_driving", "big_turn_left_02" );
    maps\_anim::addnotetrack_customfunction( "car", "big_turn_left_03", ::car_event, "coup_car_driving", "big_turn_left_03" );
    maps\_anim::addnotetrack_customfunction( "car", "slowdown", ::car_event, "coup_car_driving", "slowdown" );
    level.scr_anim["car"]["wheel_bigleft2center"] = %coup_driver_bigleft2center_car;
    level.scr_anim["car"]["wheel_bigleft_idle"] = %coup_driver_bigleft_idle_car;
    level.scr_anim["car"]["wheel_bigleftloop_idle"] = %coup_driver_bigleftloop_idle_car;
    level.scr_anim["car"]["wheel_bigleftloop"] = %coup_driver_bigleft_loop_car;
    level.scr_anim["car"]["wheel_bigleftloop2center"] = %coup_driver_bigleftloop2center_car;
    level.scr_anim["car"]["wheel_center2smallleft"] = %coup_driver_center2smallleft_car;
    level.scr_anim["car"]["wheel_center2smallright"] = %coup_driver_center2smallright_car;
    level.scr_anim["car"]["wheel_idle"] = %coup_driver_idle_car;
    level.scr_anim["car"]["wheel_smallleft2bigleft"] = %coup_driver_smallleft2bigleft_car;
    level.scr_anim["car"]["wheel_smallleft2center"] = %coup_driver_smallleft2center_car;
    level.scr_anim["car"]["wheel_smallleft_idle"] = %coup_driver_smallleft_idle_car;
    level.scr_anim["car"]["wheel_smallright2center"] = %coup_driver_smallright2center_car;
    level.scr_anim["car"]["wheel_smallright_idle"] = %coup_driver_smallright_idle_car;
    level.scr_animtree["uaz"] = #animtree;
    level.scr_anim["uaz"]["carjack_driver_door"] = %ac130_carjack_door_1a;
    level.scr_anim["uaz"]["carjack_others_door"] = %ac130_carjack_door_others;
}

play_engine( var_0, var_1 )
{
    level.car_move_engine_sound_node thread maps\coup_aud::aud_play_engine( var_0, var_1 );
}

car_event( var_0, var_1 )
{
    switch ( var_1 )
    {
        case "start_ride":
            level.car_move_engine_sound_node thread maps\coup_aud::aud_car_event_handler( 0.65, 0, 0, 1, 2, undefined );
            break;
        case "big_turn_left_01":
            level.car_move_engine_sound_node thread maps\coup_aud::aud_car_event_handler( 0.75, 2, 1, 0.94, 2, "first_turn_mix" );
            break;
        case "brake_civilian":
            level.car_move_engine_sound_node thread maps\coup_aud::aud_car_event_handler( 0.71, 1, 0.6, 1, 1, "brake_civilian_mix" );
            level.car_move_engine_sound_node thread maps\coup_aud::aud_stop_engine( "01", 1 );
            break;
        case "big_turn_left_02":
            level.car_move_engine_sound_node thread maps\coup_aud::aud_car_event_handler( 0.71, 2, 1.5, 0.94, 1, "second_turn_mix" );
            break;
        case "big_turn_left_03":
            level.car_move_engine_sound_node thread maps\coup_aud::aud_car_event_handler( 0.63, 2, 2, 1, 1.5, "third_turn_mix" );
            break;
        case "slowdown":
            level.car_move_engine_sound_node thread maps\coup_aud::aud_car_event_handler( 0.79, 2, 1, 0.79, 0, "stop_car_mix" );
            break;
    }
}

#using_animtree("door");

anim_door()
{
    level.scr_animtree["door"] = #animtree;
    level.scr_anim["door"]["doorkick"] = %shotgunbreach_door_immediate;
    level.scr_model["door"] = "com_door_01_handleright";
}

#using_animtree("trash_can");

anim_trashcan()
{
    level.scr_animtree["trashcan_rig"] = #animtree;
    level.scr_model["trashcan_rig"] = "prop_rig";
}

#using_animtree("script_model");

anim_dumpster()
{
    level.scr_animtree["dumpster"] = #animtree;
    level.scr_anim["dumpster"]["dumpster_open"] = %coup_dumpster_lid;
}

#using_animtree("animated_props");

anim_props()
{
    level.anim_prop_models["foliage_tree_palm_bushy_2"]["still"] = %palmtree_bushy2_still;
    level.anim_prop_models["foliage_tree_palm_bushy_2"]["strong"] = %palmtree_bushy2_sway;
    level.anim_prop_models["foliage_tree_palm_bushy_2"]["heli"] = %palmtree_bushy2_sway;
    level.anim_prop_models["foliage_tree_palm_bushy_1"]["still"] = %palmtree_bushy1_still;
    level.anim_prop_models["foliage_tree_palm_bushy_1"]["strong"] = %palmtree_bushy1_sway;
    level.anim_prop_models["foliage_tree_palm_bushy_1"]["heli"] = %palmtree_bushy1_sway;
    level.anim_prop_models["foliage_tree_palm_bushy_3"]["still"] = %palmtree_bushy3_still;
    level.anim_prop_models["foliage_tree_palm_bushy_3"]["strong"] = %palmtree_bushy3_sway;
    level.anim_prop_models["foliage_tree_palm_bushy_3"]["heli"] = %palmtree_bushy3_sway;
    level.anim_prop_models["foliage_tree_palm_med_2"]["still"] = %palmtree_med2_still;
    level.anim_prop_models["foliage_tree_palm_med_2"]["strong"] = %palmtree_med2_sway;
    level.anim_prop_models["foliage_tree_palm_med_2"]["heli"] = %palmtree_med2_sway;
    level.anim_prop_models["foliage_tree_palm_med_1"]["still"] = %palmtree_med1_still;
    level.anim_prop_models["foliage_tree_palm_med_1"]["strong"] = %palmtree_med1_sway;
    level.anim_prop_models["foliage_tree_palm_med_1"]["heli"] = %palmtree_med1_sway;
    level.anim_prop_models["foliage_tree_palm_tall_1"]["still"] = %palmtree_tall1_still;
    level.anim_prop_models["foliage_tree_palm_tall_1"]["strong"] = %palmtree_tall1_sway;
    level.anim_prop_models["foliage_tree_palm_tall_1"]["heli"] = %palmtree_tall1_sway;
    level.anim_prop_models["foliage_tree_palm_tall_3"]["still"] = %palmtree_tall3_still;
    level.anim_prop_models["foliage_tree_palm_tall_3"]["strong"] = %palmtree_tall3_sway;
    level.anim_prop_models["foliage_tree_palm_tall_3"]["heli"] = %palmtree_tall3_sway;
    level.anim_prop_models["foliage_tree_palm_tall_2"]["still"] = %palmtree_tall2_still;
    level.anim_prop_models["foliage_tree_palm_tall_2"]["strong"] = %palmtree_tall2_sway;
    level.anim_prop_models["foliage_tree_palm_tall_2"]["heli"] = %palmtree_tall2_sway;
    level.anim_prop_models["foliage_afr_tree_fanpalm_01a"]["still"] = %afr_tree_fanpalm_still;
    level.anim_prop_models["foliage_afr_tree_fanpalm_01a"]["strong"] = %afr_tree_fanpalm_sway;
    level.anim_prop_models["foliage_afr_tree_fanpalm_01a"]["heli"] = %afr_tree_fanpalm_sway;
    level.anim_prop_models["foliage_afr_tree_fanpalm_01a_v2"]["still"] = %afr_tree_fanpalm_still;
    level.anim_prop_models["foliage_afr_tree_fanpalm_01a_v2"]["strong"] = %afr_tree_fanpalm_sway;
    level.anim_prop_models["foliage_afr_tree_fanpalm_01a_v2"]["heli"] = %afr_tree_fanpalm_sway;
    level.scr_animtree["rope_hands"] = #animtree;
    level.scr_model["rope_hands"] = "h1_president_rope";
    level.scr_anim["rope_hands"]["intro_ropehands"] = %h1_coup_president_rope_opening;
    level.scr_anim["rope_hands"]["car_idle_fullbody_ropehands"] = %h1_coup_president_rope;
    level.scr_anim["rope_hands"]["carexit_ropehands"] = %h1_coup_president_rope_ending;
}

#using_animtree("animals");

anim_chickens()
{
    level.scr_animtree["chicken"] = #animtree;
    level.scr_model["chicken"] = "chicken";
    level.scr_anim["chicken"]["walk_basic"] = %chicken_walk_basic;
    level.scr_anim["chicken"]["cage_freakout"] = %chicken_cage_freakout;
}

#using_animtree("dog");

anim_dogs()
{
    level.scr_animtree["dog"] = #animtree;
    level.scr_anim["dog"]["idle"] = %german_shepherd_idle;
    level.scr_anim["dog"]["walk"] = %german_shepherd_walk;
    level.scr_anim["dog"]["eating"][0] = %german_shepherd_eating_loop;
    level.scr_anim["dog"]["sleeping"][0] = %german_shepherd_sleeping;
    level.scr_anim["dog"]["wakeup_slow"] = %german_shepherd_wakeup_slow;
    level.scr_anim["dog"]["wakeup_fast"] = %german_shepherd_wakeup_fast;
    level.scr_anim["dog"]["fence_attack"] = %sniper_escape_dog_fence;
    level.scr_anim["dog"]["attackidle_growl"][0] = %german_shepherd_attackidle_growl;
    level.scr_anim["dog"]["attackidle_bark"][0] = %german_shepherd_attackidle_bark;
    level.scr_anim["dog"]["attackidle"][0] = %german_shepherd_attackidle;
    maps\_anim::addnotetrack_sound( "dog", "fence", "fence_attack", "fence_smash" );
}

car_normal( var_0 )
{
    var_0 setanimknob( var_0 maps\_utility::getanim( "car_idle_normal" ), 1, 0, 1 );
    var_0.playerview setanimknob( var_0.playerview maps\_utility::getanim( "playerview_idle_normal" ), 1, 0, 1 );
}

car_smooth( var_0 )
{
    var_0 setanimknob( var_0 maps\_utility::getanim( "car_idle_smooth" ), 1, 0, 1 );
    var_0.playerview setanimknob( var_0.playerview maps\_utility::getanim( "playerview_idle_smooth" ), 1, 0, 1 );
}

car_bumpy( var_0 )
{
    var_0 setanimknob( var_0 maps\_utility::getanim( "car_idle_bumpy" ), 1, 0, 1 );
    var_0.playerview setanimknob( var_0.playerview maps\_utility::getanim( "playerview_idle_bumpy" ), 1, 0, 1 );
}

car_static( var_0 )
{
    var_0 setanimknob( var_0 maps\_utility::getanim( "car_idle_static" ), 1, 0, 1 );
    var_0.playerview setanimknob( var_0.playerview maps\_utility::getanim( "playerview_idle_static" ), 1, 0, 1 );
}

driver_turnright1( var_0 )
{
    printturnanim( " --- STARTED  turnright1" );
    var_0 playdriveranim( "center2smallright", "turnright1" );
    var_0 loopdriveranim( "smallright_idle", "turnright1", "return" );
    var_0 playdriveranim( "smallright2center", "turnright1" );
    var_0 loopdriveranim( "idle", "turnright1" );
    printturnanim( " --- FINISHED turnright1" );
}

driver_turnleft1( var_0 )
{
    printturnanim( " --- STARTED  turnleft1" );
    var_0 playdriveranim( "center2smallleft", "turnleft1" );
    var_0 loopdriveranim( "smallleft_idle", "turnleft1", "return" );
    var_0 playdriveranim( "smallleft2center", "turnleft1" );
    var_0 loopdriveranim( "idle", "turnleft1" );
    printturnanim( " --- FINISHED turnleft1" );
}

driver_turnleft2( var_0 )
{
    printturnanim( " --- STARTED  turnleft2" );
    var_0 playdriveranim( "center2smallleft", "turnleft2" );
    var_0 playdriveranim( "smallleft2bigleft", "turnleft2" );
    var_0 loopdriveranim( "bigleft_idle", "turnleft2", "return" );
    var_0 playdriveranim( "bigleft2center", "turnleft2" );
    var_0 loopdriveranim( "idle", "turnleft2" );
    printturnanim( " --- FINISHED turnleft2" );
}

driver_turnleft3( var_0 )
{
    printturnanim( " --- STARTED  turnleft3" );
    var_0 playdriveranim( "center2smallleft", "turnleft3" );
    var_0 playdriveranim( "smallleft2bigleft", "turnleft3" );
    var_0 playdriveranim( "bigleftloop", "turnleft3" );
    var_0 loopdriveranim( "bigleft_idle", "turnleft3", "return" );
    var_0 playdriveranim( "bigleft2center", "turnleft3" );
    var_0 loopdriveranim( "idle", "turnleft3" );
    printturnanim( " --- FINISHED turnleft3" );
}

driver_turnspecial( var_0 )
{
    printturnanim( " --- STARTED  turnspecial" );
    var_0 playdriveranim( "center2smallleft", "turnspecial" );
    var_0 loopdriveranim( "smallleft_idle", "turnspecial", "turnleft_2_special" );
    var_0 playdriveranim( "smallleft2bigleft", "turnspecial" );
    var_0 loopdriveranim( "bigleft_idle", "turnspecial", "return" );
    var_0 playdriveranim( "bigleft2center", "turnspecial" );
    var_0 loopdriveranim( "idle", "turnspecial" );
    printturnanim( " --- FINISHED turnspecial" );
}

playerdeath( var_0 )
{
    playfxontag( common_scripts\utility::getfx( "execution_muzzleflash" ), var_0, "tag_flash" );
    playfxontag( common_scripts\utility::getfx( "execution_shell_eject" ), var_0, "tag_brass" );
    level.player playrumbleonentity( "grenade_rumble" );
    level.player thread maps\_utility::play_sound_on_entity( "assassination_shot" );
    wait 0.1;
    var_1 = newhudelem();
    var_1.x = 0;
    var_1.y = 0;
    var_1 setshader( "black", 640, 480 );
    var_1.alignx = "left";
    var_1.aligny = "top";
    var_1.horzalign = "fullscreen";
    var_1.vertalign = "fullscreen";
    var_1.alpha = 1;
    var_1.sort = 1;
    level notify( "player_death" );
    level.player shellshock( "coup_death", 10 );
    soundscripts\_snd::snd_message( "start_coup_player_death_mix" );
    wait 4.5;
    maps\_utility::nextmission();
}

playerthrownincar( var_0 )
{
    wait 0.3;
    soundscripts\_snd::snd_message( "aud_coup_car_open" );
    wait 0.25;
    level.player playrumbleonentity( "grenade_rumble" );
    wait 1.8;
    level.leftguard maps\_utility::play_sound_on_entity( "coup_ab0_move_generic_custom" );
}

playerhit( var_0 )
{
    wait 0.15;
    soundscripts\_snd::snd_message( "aud_add_stunned_car_event" );
    level.player playrumbleonentity( "grenade_rumble" );
    setblur( 40, 0.1 );
    maps\_utility::set_vision_set( "coup_hit", 0 );
    setsaveddvar( "r_glow_allowed_script_forced", "0" );
    wait 0.1;
    maps\_utility::set_vision_set( "coup_ride", 0.2 );
    setblur( 0, 0.75 );
    thread playerbreathingsound( 35.0, 25 );
    wait 5;
    soundscripts\_snd::snd_message( "aud_stop_stunned_car_event" );
}

playerpulledfromcar( var_0 )
{
    wait 2.15;
    soundscripts\_snd::snd_message( "aud_coup_car_thrown_out" );
    wait 2.0;
    level.player playrumbleonentity( "grenade_rumble" );
}

playerkicked( var_0 )
{
    wait 0.65;
    level.player playrumbleonentity( "grenade_rumble" );
}

playerhitdamage( var_0 )
{
    var_1 = level.player.health * 0.1;
    var_2 = level.player.health - var_1;
    var_3 = var_2 / getdvarfloat( "player_damageMultiplier" );
    level.player dodamage( var_3, level.player.origin );
}

playerbreathingsound( var_0, var_1 )
{
    wait 2;

    for (;;)
    {
        wait 0.2;

        if ( var_1 <= 0 )
            return;

        var_2 = var_1 / var_0;

        if ( var_2 > level.player.gs.healthoverlaycutoff )
            continue;

        level.player maps\_utility::play_sound_on_entity( "breathing_hurt" );
        wait(0.1 + randomfloat( 0.8 ));
    }
}

melee_kill( var_0 )
{
    var_0 playsound( "melee_swing_large" );
    var_0.favoriteenemy playsound( "melee_hit" );
    var_0.favoriteenemy.allowdeath = 0;
    var_0.favoriteenemy notify( "anim_death" );
    thread kill_self( var_0.favoriteenemy );
}

rag_doll_death( var_0 )
{
    var_0 thread killed_by_player( 1 );
}

kill_self( var_0 )
{
    var_0 endon( "death" );
    wait 0.1;
    var_0.allowdeath = 1;
    var_0 kill();
}

killed_by_player( var_0 )
{
    self endon( "anim_death" );
    self notify( "killed_by_player_func" );
    self endon( "killed_by_player_func" );

    for (;;)
    {
        self waittill( "death", var_1 );

        if ( isdefined( var_1 ) && isplayer( var_1 ) )
            break;
    }

    self notify( "killed_by_player" );

    if ( isdefined( var_0 ) )
    {
        animscripts\shared::dropallaiweapons();
        self startragdoll();
    }
}

playdriveranim( var_0, var_1 )
{
    if ( isdefined( var_1 ) )
        printturnanim( " ---          " + var_1 + ", " + var_0 );
    else
        printturnanim( " ---          , " + var_0 );

    if ( var_0 == "bigleft2center" && var_1 == "turnleft3" )
        self setanimknob( maps\_utility::getanim( "wheel_bigleftloop2center" ), 1, 0, 1 );
    else
        self setanimknob( maps\_utility::getanim( "wheel_" + var_0 ), 1, 0, 1 );

    maps\_anim::anim_single_solo( self.driver, "cardriver_" + var_0, "tag_driver" );
}

loopdriveranim( var_0, var_1, var_2 )
{
    if ( isdefined( var_1 ) )
        printturnanim( " --- ( loop ) " + var_1 + ", " + var_0 );
    else
        printturnanim( " --- ( loop ) , " + var_0 );

    self notify( "stop_driver_loop" );

    if ( var_0 == "bigleft_idle" && var_1 == "turnleft3" )
        self setanimknob( maps\_utility::getanim( "wheel_bigleftloop_idle" ), 1, 0, 1 );
    else
        self setanimknob( maps\_utility::getanim( "wheel_" + var_0 ), 1, 0, 1 );

    thread maps\_anim::anim_loop_solo( self.driver, "cardriver_" + var_0, "tag_driver", "stop_driver_loop" );

    if ( isdefined( var_2 ) )
    {
        self waittillmatch( "single anim", var_2 );
        printturnanim( " --- MATCHED  " + var_1 + ", " + var_0 + ", " + var_2 );
    }
}

playpassengeranim( var_0 )
{
    maps\_anim::anim_single_solo( self.passenger, var_0, "tag_passenger" );
}

looppassengeranim( var_0, var_1 )
{
    self notify( "stop_passenger_loop" );
    thread maps\_anim::anim_loop_solo( self.passenger, var_0, "tag_passenger", "stop_passenger_loop" );

    if ( isdefined( var_1 ) )
        self waittillmatch( "single anim", var_1 );
}

printturnanim( var_0 )
{
    if ( isdefined( level.debug_turnanims ) && level.debug_turnanims )
        return;
}

printpassengeranim( var_0 )
{
    if ( isdefined( level.debug_passengeranims ) && level.debug_passengeranims )
        return;
}

ambientcarinterior( var_0 )
{
    wait 0.6;
    soundscripts\_snd::snd_message( "aud_coup_enter_car" );
}

ambientcarexterior( var_0 )
{
    wait 0.1;
    soundscripts\_snd::snd_message( "aud_coup_exit_car" );
}

passengerlookback( var_0 )
{
    wait 2.5;
    level.car.passenger.body thread maps\_utility::play_sound_on_entity( "scn_coup_car_soz_foley_01" );
}

crowdfireweapon( var_0 )
{
    var_0 thread maps\_utility::play_sound_on_tag( "weap_ak47_fire_npc", "tag_flash" );
    playfxontag( common_scripts\utility::getfx( "ak47_muzzleflash" ), var_0, "tag_flash" );
}

shootciviliantrashstumble( var_0 )
{
    magicbullet( var_0.weapon, var_0 gettagorigin( "tag_flash" ), level.runner geteye() );
}

shootcivilianinterrogation1( var_0 )
{
    magicbullet( var_0.weapon, var_0 gettagorigin( "tag_flash" ), level.suspect_5b gettagorigin( "tag_stowed_back" ) );
}

shootcivilianexecution( var_0 )
{
    var_1 = common_scripts\utility::get_noteworthy_ent( "target_" + var_0.target );

    for ( var_2 = 0; var_2 < 6; var_2++ )
    {
        magicbullet( var_0.weapon, var_0 gettagorigin( "tag_flash" ), var_1.origin );
        wait(randomfloatrange( 0.1, 0.3 ));
    }
}

fx_paint_spray_coup( var_0 )
{
    playfxontag( common_scripts\utility::getfx( "paint_spray_coup" ), var_0, "tag_spraycan_fx" );
}

fx_stop_paint_spray_coup( var_0 )
{
    stopfxontag( common_scripts\utility::getfx( "paint_spray_coup" ), var_0, "tag_spraycan_fx" );
}

detach_paint_spray_coup( var_0 )
{
    var_0 detach( "com_spray_can01", "tag_inhand" );
}

attach_phone_to_car( var_0 )
{
    level.car attach( "com_cellphone_on", "tag_cellphone" );
    common_scripts\utility::flag_wait( "start_dragged_aftercarexit" );
    level.car detach( "com_cellphone_on", "tag_cellphone" );
}
