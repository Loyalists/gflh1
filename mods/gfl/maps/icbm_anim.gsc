// H1 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

anim_main()
{
    level.scr_sound["price"]["wheresgriggs"] = "icbm_pri_wheresgriggs";
    level.scr_sound["gaz"]["noidea"] = "icbm_uk2_noidea";
    level.scr_sound["price"]["wereonourway"] = "icbm_pri_wereonourway";
    level.scr_sound["price"]["takealook"] = "icbm_pri_takealook";
    level.scr_sound["price"]["Charlie_status"] = "icbm_pri_status";
    level.scr_sound["price"]["charlie_towersdown"] = "icbm_pri_towersdown";
    level.scr_sound["price"]["scoutthrough"] = "icbm_pri_scoutthrough";
    level.scr_sound["price"]["alternateroute"] = "icbm_pri_alternateroute";
    maps\_props::add_smoking_notetracks( "generic" );
    maps\_props::add_cellphone_notetracks( "generic" );
    maps\_props::add_smoking_notetracks( "hostile" );
    maps\_props::add_cellphone_notetracks( "hostile" );
    anims();
    player_anims();
    patrol();
    tower_explode_anims();
    script_models();
    level.scr_sound["price"]["grigsby_landed"] = "icbm_pri_wherelanded";
    level.scr_sound["gaz"]["bybuildingseast"] = "icbm_uk2_buildingseast";
    level.scr_sound["price"]["abouttofindout"] = "icbm_pri_tofindout";
    level.scr_sound["gaz"]["yougotit"] = "icbm_uk2_yougotit";
    level.scr_sound["gaz"]["enemyvehicle"] = "icbm_uk2_contactfront";
    level.scr_sound["generic"]["insight"] = "icbm_sas3_insight";
    level.scr_sound["price"]["move"] = "icbm_pri_move";
    level.scr_sound["price"]["griggsinhouses"] = "icbm_pri_griggsinhouses";
    level.scr_sound["price"]["keepitquiet"] = "icbm_pri_basementdoor";
    level.scr_sound["gaz"]["proceedupstairs"] = "icbm_uk2_proceedupstairs";
    level.scr_sound["gaz"]["1clear"] = "icbm_uk2_1clear";
    level.scr_sound["gaz"]["griggsnothere"] = "icbm_uk2_griggsisnthere";
    level.scr_sound["price"]["regroupdownstairs"] = "icbm_pri_regroupdownstairs";
    level.scr_sound["gaz"]["copythat"] = "icbm_uk2_copythat";
    level.scr_sound["price"]["nexthouse"] = "icbm_pri_nexthouse";
    level.scr_sound["gaz"]["allclear"] = "icbm_uk2_allclear";
    level.scr_sound["generic"]["building2secured"] = "icbm_sas2_2secured";
    level.scr_sound["gaz"]["roomclear"] = "icbm_uk2_roomclear";
    level.scr_sound["gaz"]["roomclear2"] = "icbm_uk2_roomclear2";
    level.scr_sound["generic"]["neutralized"] = "icbm_sas2_neutralized";
    level.scr_sound["gaz"]["roger"] = "icbm_uk2_roger";
    level.scr_sound["gaz"]["floorsclear"] = "icbm_uk2_floorsclear";
    level.scr_sound["gaz"]["building1clear"] = "icbm_uk2_1clear";
    level.scr_sound["generic"]["tangodown"] = "icbm_sas2_tangodown";
    level.scr_sound["price"]["regrouponme"] = "icbm_pri_regrouponme";
    level.scr_sound["price"]["jacksonregroup"] = "icbm_pri_jacksonregroup";
    level.scr_sound["price"]["letsgo"] = "icbm_pri_letsgo";
    level.scr_sound["generic"]["contact"] = "icbm_sas2_contact";
    level.scr_sound["griggs"]["leavemebehind"] = "icbm_grg_leavemebehind";
    level.scr_sound["price"]["firstthought"] = "icbm_pri_firstthought";
    level.scr_sound["price"]["youallright"] = "icbm_pri_youallright";
    level.scr_sound["griggs"]["goodtogo"] = "icbm_grg_goodtogo";
    level.scr_sound["price"]["gotgriggs"] = "icbm_pri_gotgriggs";
    level.scr_sound["gaz"]["enemyhelicopters"] = "icbm_uk2_helicopters";
    level.scr_sound["price"]["slicksinbound"] = "icbm_pri_slicksinbound";
    level.scr_sound["price"]["status"] = "icbm_pri_team2status";
    level.scr_sound["price"]["killthepower"] = "icbm_gm4_inposition";
    level.scr_sound["price"]["jackgriggsplant"] = "icbm_pri_jacksonplant";
    level.scr_sound["griggs"]["chargesset"] = "icbm_grg_chargesset";
    level.scr_sound["price"]["doit"] = "icbm_pri_doit";
    level.scr_sound["price"]["towersdown"] = "icbm_pri_powersout";
    level.scr_sound["price"]["breachingperimeter"] = "icbm_gm4_breachperimeter";
    level.scr_sound["price"]["standby"] = "icbm_gm4_standby";
    level.scr_sound["griggs"]["backuppower"] = "icbm_grg_backuppower";
    level.scr_sound["griggs"]["fiveseconds"] = "icbm_grg_fiveseconds";
    level.scr_sound["price"]["rallypoint"] = "icbm_gm4_rallypoint";
    level.scr_sound["price"]["onourway"] = "icbm_pri_onourway";
    level.scr_sound["griggs"]["poweronline"] = "icbm_grg_poweronline";
    level.scr_sound["price"]["getfenceopen"] = "icbm_pri_getfenceopen";
    level.scr_sound["griggs"]["getbusy2"] = "icbm_grg_getbusy2";
    level.scr_sound["generic"]["truckswithshooters"] = "icbm_gm5_3trucks";
    level.scr_sound["price"]["rogerthat"] = "icbm_pri_rogerthat";
    level.scr_sound["price"]["approachingbase"] = "icbm_pri_oldbase";
    level.scr_sound["generic"]["haveavisual"] = "icbm_uk2_visualontrucks";
    level.scr_sound["price"]["youknowdrill"] = "icbm_pri_youknowdrill";
    level.scr_sound["price"]["flankingthrough"] = "icbm_pri_flankingthrough";
    level.scr_sound["gaz"]["rpgsonrooftop"] = "icbm_sas1_rpgsonrooftop";
    level.scr_sound["gaz"]["rpgsonrooftop2"] = "icbm_sas2_rpgsonrooftops";
    level.scr_sound["price"]["grabrpg"] = "icbm_pri_grabrpg";
    level.scr_sound["price"]["behindus"] = "icbm_pri_behindus";
    level.scr_sound["gaz"]["behindus2"] = "icbm_sas1_behindus";
    level.scr_sound["price"]["takeoutbmp"] = "icbm_pri_takeoutbmp";
    level.scr_sound["price"]["keepmoving"] = "icbm_pri_keepmoving";
    level.scr_sound["gaz"]["choppersinbound"] = "icbm_sas1_choppersinbound";
    level.scr_sound["price"]["droppingin"] = "icbm_pri_droppingin";
    level.scr_sound["gaz"]["whatthe"] = "icbm_uk2_looksoutheast";
    level.scr_sound["griggs"]["problemhere"] = "icbm_grg_problemhere";
    level.scr_sound["price"]["onemissile"] = "icbm_pri_onemissile";
    level.scr_sound["griggs"]["anotherone"] = "icbm_grg_anotherone";
    level.scr_sound["price"]["twomissiles"] = "icbm_pri_twomissiles";
    level.scr_sound["price"]["gettingabortcodes"] = "icbm_hqr_satellitestracking";
    level.scr_sound["griggs"]["itsonnow"] = "icbm_grg_itsonnow";
    level.scr_sound["price"]["youretellinme"] = "icbm_pri_gottomove";
    level.scr_sound["gm5"]["treeline"] = "icbm_gm5_treelineS";
    level.scr_sound["price"]["americanteams"] = "icbm_pri_americanteams";
    level.scr_sound["gm5"]["goodtosee"] = "icbm_gm5_whatthe";
    level.scr_sound["price"]["keepquiet"] = "icbm_pri_keepitquiet";
    level.scr_sound["price"]["sunsup"] = "icbm_pri_sunscomingup";
    level.scr_sound["price"]["blowuptower"] = "icbm_pri_knockouttower";
    level.scr_sound["price"]["flankingbehind"] = "icbm_pri_flankingbehind";
    level.scr_sound["ru1"]["whereothers"] = "icbm_ru1_whereothers";
    level.scr_sound["griggs"]["grg_678452056"] = "icbm_grg_678452056";
    level.scr_sound["ru1"]["tovarisch"] = "icbm_ru1_tovarisch";
    level.scr_sound["ru1"]["howmany"] = "icbm_ru1_howmany";
    level.scr_sound["griggs"]["grg_678"] = "icbm_grg_678";
    level.scr_sound["ru1"]["whoisofficer"] = "icbm_ru1_whoisofficer";
    level.scr_sound["griggs"]["blowme"] = "icbm_grg_getbusy";
    level.scr_sound["ru1"]["whereshacksaw"] = "icbm_ru1_whereshacksaw";
    level.scr_sound["ru1"]["youhadit"] = "icbm_ru2_youhadit";
    level.scr_sound["ru1"]["ifihad"] = "icbm_ru1_ifihad";
    level.scr_sound["price"]["thisisplace"] = "icbm_pri_thisisplace";
    level.scr_sound["price"]["readytobreach"] = "icbm_pri_readytobreach";
    level.scr_sound["price"]["gogogo"] = "icbm_pri_gogogo";
    level.scr_sound["price"]["cutloose"] = "icbm_pri_cutloose";
}

#using_animtree("generic_human");

patrol()
{
    level.scr_anim["generic"]["patrolwalk_1"] = %active_patrolwalk_v1;
    level.scr_anim["generic"]["patrolwalk_2"] = %active_patrolwalk_v2;
    level.scr_anim["generic"]["patrolwalk_3"] = %active_patrolwalk_v3;
    level.scr_anim["generic"]["patrolwalk_4"] = %active_patrolwalk_v4;
    level.scr_anim["generic"]["patrolwalk_5"] = %active_patrolwalk_v5;
    level.scr_anim["generic"]["patrolwalk_pause"] = %active_patrolwalk_pause;
    level.scr_anim["generic"]["patrolwalk_turn"] = %active_patrolwalk_turn_180;
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
}

anims()
{
    level.scr_anim["price"]["intro_briefing"] = %h1_icbm_introbrief_price;
    maps\_anim::addnotetrack_dialogue( "price", "dialog", "intro_briefing", "icbm_pri_regrouponme" );
    maps\_anim::addnotetrack_dialogue( "price", "dialog", "intro_briefing", "icbm_pri_wheresgriggs" );
    maps\_anim::addnotetrack_dialogue( "price", "dialog", "intro_briefing", "icbm_pri_wereonourway" );
    level.scr_anim["gaz"]["intro_briefing"] = %h1_icbm_introbrief_gaz;
    maps\_anim::addnotetrack_dialogue( "gaz", "dialog", "intro_briefing", "icbm_uk2_noidea" );
    level.scr_anim["generic"]["intro_briefing"] = %h1_icbm_introbrief_soldier;
    level.scr_anim["generic"]["pronehide_dive1"] = %hunted_dive_2_pronehide_v1;
    level.scr_anim["generic"]["pronehide_dive2"] = %hunted_dive_2_pronehide_v2;
    level.scr_anim["generic"]["pronehide_dive3"] = %hunted_dive_2_pronehide_v3;
    level.scr_anim["generic"]["pronehide_idle1"] = %hunted_pronehide_idle_v1;
    level.scr_anim["generic"]["pronehide_idle2"] = %hunted_pronehide_idle_v2;
    level.scr_anim["generic"]["pronehide_idle3"] = %hunted_pronehide_idle_v3;
    level.scr_anim["generic"]["pronehide_2_stand1"] = %hunted_pronehide_2_stand_v1;
    level.scr_anim["generic"]["pronehide_2_stand2"] = %hunted_pronehide_2_stand_v2;
    level.scr_anim["generic"]["pronehide_2_stand3"] = %hunted_pronehide_2_stand_v3;
    level.scr_anim["generic"]["_stealth_behavior_whizby_0"] = %exposed_idle_reacta;
    level.scr_anim["generic"]["_stealth_behavior_whizby_1"] = %exposed_idle_reactb;
    level.scr_anim["generic"]["_stealth_behavior_whizby_2"] = %exposed_idle_twitch;
    level.scr_anim["generic"]["_stealth_behavior_whizby_3"] = %exposed_idle_twitch_v4;
    level.scr_anim["generic"]["_stealth_behavior_whizby_4"] = %run_pain_stumble;
    level.scr_anim["generic"]["_stealth_behavior_spotted_short"] = %exposed_idle_twitch_v4;
    level.scr_anim["generic"]["_stealth_behavior_spotted_long"] = %exposed_idle_twitch_v4;
    level.scr_anim["generic"]["_stealth_behavior_heard_scream"] = %exposed_idle_twitch_v4;
    level.scr_anim["price"]["hunted_open_barndoor"] = %hunted_open_barndoor;
    level.scr_anim["price"]["hunted_open_barndoor_stop"] = %hunted_open_barndoor_idle;
    level.scr_anim["price"]["hunted_open_barndoor_idle"][0] = %hunted_open_barndoor_idle;
    level.scr_anim["hostile"]["patrol_twitch"] = %patrolstand_twitch;
    level.scr_anim["hostile"]["phoneguy_idle_start"] = %patrol_bored_idle_cellphone;
    level.scr_anim["hostile"]["phoneguy_idle"][0] = %patrol_bored_idle_cellphone;
    level.scr_anim["hostile"]["phoneguy_alerted"] = %parabolic_phoneguy_reaction;
    level.scr_anim["hostile"]["phoneguy_death"] = %icbm_patrol_knifekill_looser;
    level.scr_anim["hostile"]["patrol_bored_idle"][0] = %patrol_bored_idle;
    level.scr_anim["hostile"]["patrol_bored_idle_smoke"][0] = %patrol_bored_idle_smoke;
    level.scr_anim["hostile"]["patrol_bored_idle_cellphone"][0] = %patrol_bored_idle_cellphone;
    level.scr_anim["generic"]["cellphone_idle"][0] = %patrol_bored_idle_cellphone;
    level.scr_anim["generic"]["smoke_idle"][0] = %patrol_bored_idle_smoke;
    level.scr_anim["generic"]["lean_smoke_idle"][0] = %parabolic_leaning_guy_smoking_idle;
    level.scr_anim["generic"]["lean_smoke_idle"][1] = %parabolic_leaning_guy_smoking_twitch;
    level.scr_anim["generic"]["coffee_idle"][0] = %parabolic_guard_sleeper_idle;
    level.scr_anim["generic"]["sleep_idle"][0] = %parabolic_guard_sleeper_idle;
    level.scr_anim["generic"]["cellphone_reach"] = %patrol_bored_idle_cellphone;
    level.scr_anim["generic"]["smoke_reach"] = %patrol_bored_idle_smoke;
    level.scr_anim["generic"]["lean_smoke_reach"] = %parabolic_leaning_guy_smoking_idle;
    level.scr_anim["generic"]["coffee_reach"] = %parabolic_guard_sleeper_idle;
    level.scr_anim["generic"]["sleep_reach"] = %parabolic_guard_sleeper_idle;
    level.scr_anim["generic"]["cellphone_react"] = %patrol_bored_react_look_retreat;
    level.scr_anim["generic"]["smoke_react"] = %patrol_bored_react_look_advance;
    level.scr_anim["generic"]["lean_smoke_react"] = %patrol_bored_react_walkstop_short;
    level.scr_anim["generic"]["coffee_react"] = %parabolic_guard_sleeper_react;
    level.scr_anim["generic"]["sleep_react"] = %parabolic_guard_sleeper_react;
    maps\_anim::addnotetrack_customfunction( "generic", "fire", maps\icbm_code::kill_during_breach1, "detcord_stack_leftbreach_01" );
    maps\_anim::addnotetrack_customfunction( "generic", "fire", maps\icbm_code::kill_during_breach2, "detcord_stack_leftbreach_02" );
    maps\_anim::addnotetrack_animsound( "generic", "smoke_idle", "exhale", "h1_ru_smoker_exhale" );
    maps\_anim::addnotetrack_animsound( "generic", "smoke_idle", "puff", "h1_ru_smoker_inhale" );
    maps\_anim::addnotetrack_animsound( "generic", "smoke_idle", "openlighter", "h1_icbm_ru_lighter_open" );
    maps\_anim::addnotetrack_animsound( "generic", "smoke_idle", "closelighter", "h1_icbm_ru_lighter_close" );
    maps\_anim::addnotetrack_animsound( "generic", "smoke_idle", "rattle", "h1_scn_ru_rattle" );
    maps\_anim::addnotetrack_animsound( "generic", "sleep_idle", "start", "h1_icbm_ru_snore_loop" );
    level.scr_anim["price"]["knifekill_price"] = %icbm_patrol_knifekill_winner;
    maps\_anim::addnotetrack_customfunction( "price", "attach knife", ::show_prices_knife, "knifekill_price" );
    maps\_anim::addnotetrack_customfunction( "price", "detach knife", ::hide_prices_knife, "knifekill_price" );
    level.scr_anim["price"]["signal_assault_coverstand"] = %coverstand_hide_idle_wave02;
    level.scr_anim["price"]["signal_forward_coverstand"] = %coverstand_hide_idle_wave01;

    if ( getdvarint( "use_old_griggs_rescue" ) == 1 )
    {
        level.scr_anim["griggs"]["grigsby_rescue"] = %grigsby_rescue;
        maps\_anim::addnotetrack_customfunction( "griggs", "grab gun", maps\icbm_code::griggs_grab_gun, "grigsby_rescue" );
        level.scr_anim["griggs"]["grigsby_rescue_idle"][0] = %grigsby_rescue_idle;
        level.scr_anim["griggs"]["grigsby_rescue_react"] = %grigsby_rescue_react;
    }
    else
    {
        level.scr_anim["griggs"]["grigsby_rescue"] = %h1_grigsby_rescue;
        maps\_anim::addnotetrack_dialogue( "griggs", "dialog", "grigsby_rescue", "icbm_grg_leavemebehind" );
        maps\_anim::addnotetrack_dialogue( "griggs", "dialog", "grigsby_rescue", "icbm_grg_goodtogo" );
        maps\_anim::addnotetrack_customfunction( "griggs", "grab gun", maps\icbm_code::griggs_grab_gun, "grigsby_rescue" );
        level.scr_anim["griggs"]["grigsby_rescue_idle"][0] = %h1_grigsby_rescue_idle;
        level.scr_anim["price"]["grigsby_rescue_price_idle"][0] = %h1_grigsby_rescue_price_idle;
        level.scr_anim["price"]["grigsby_rescue_price"] = %h1_grigsby_rescue_price;
        level.scr_anim["price"]["grigsby_rescue_price_in"] = %h1_grigsby_rescue_price_in;
        maps\_anim::addnotetrack_dialogue( "price", "dialog", "grigsby_rescue_price_in", "icbm_pri_cutloose" );
        maps\_anim::addnotetrack_dialogue( "price", "dialog", "grigsby_rescue_price", "icbm_pri_firstthought" );
        maps\_anim::addnotetrack_dialogue( "price", "dialog", "grigsby_rescue_price", "icbm_pri_youallright" );
        level.scr_anim["griggs"]["grigsby_rescue_react"] = %grigsby_rescue_react;
    }

    if ( getdvarint( "use_old_fence_cutting" ) == 1 )
    {
        level.scr_anim["griggs"]["icbm_fence_cutting_guys"] = %icbm_fence_cutting_guy2;
        level.scr_anim["gaz"]["icbm_fence_cutting_guys"] = %icbm_fence_cutting_guy1;
    }
    else
    {
        level.scr_anim["griggs"]["icbm_fence_cutting_guys"] = %h1_icbm_fence_cutting_guy2;
        level.scr_anim["gaz"]["icbm_fence_cutting_guys"] = %h1_icbm_fence_cutting_guy1;
    }

    level.scr_anim["generic"]["fence_stand_idle"][0] = %cqb_stand_idle;
    maps\_anim::addnotetrack_attach( "gaz", "can_in_hand", "com_spray_can01", "tag_inhand", "icbm_fence_cutting_guys" );
    maps\_anim::addnotetrack_detach( "gaz", "can_out_hand", "com_spray_can01", "tag_inhand", "icbm_fence_cutting_guys" );
    maps\_anim::addnotetrack_animsound( "gaz", "icbm_fence_cutting_guys", "scn_icbm_fence_cut", "scn_icbm_fence_cut" );
    maps\_anim::addnotetrack_animsound( "gaz", "icbm_fence_cutting_guys", "scn_icbm_fence_pull", "scn_icbm_fence_pull" );
    maps\_anim::addnotetrack_customfunction( "gaz", "can_start_spray", maps\icbm_code::spraycan_fx, "icbm_fence_cutting_guys" );
    maps\_anim::addnotetrack_customfunction( "gaz", "can_stop_spray", maps\icbm_code::spraycan_fx_stop, "icbm_fence_cutting_guys" );

    if ( getdvarint( "use_old_endrun" ) == 1 )
    {
        level.scr_anim["price"]["icbm_end_price"] = %icbm_end_price;
        level.scr_anim["gm5"]["icbm_end_sniper"] = %icbm_end_sniper;
    }
    else
    {
        level.scr_anim["price"]["icbm_end_price_idle"][0] = %h1_icbm_end_price_idle;
        level.scr_anim["price"]["icbm_end_price"] = %h1_icbm_end_price;
        maps\_anim::addnotetrack_dialogue( "price", "dialog", "icbm_end_price", "icbm_pri_onemissile" );
        level.scr_anim["gm5"]["icbm_end_sniper"] = %h1_icbm_end_sniper;
        maps\_anim::addnotetrack_dialogue( "gm5", "dialog", "icbm_end_sniper", "icbm_gm5_whatthe" );
    }
}

#using_animtree("player");

player_anims()
{
    level.scr_animtree["player_rescue_griggs_model"] = #animtree;
    level.scr_model["player_rescue_griggs_model"] = "h2_gfl_m4_sopmod_ii_worldhands";
    level.scr_anim["player_rescue_griggs_model"]["grigsby_rescue_player"] = %h1_grigsby_rescue_player;
    maps\_anim::addnotetrack_animsound( "player_rescue_griggs_model", "grigsby_rescue_player", "start", "scn_icbm_rescue_griggs_cut" );
}

#using_animtree("icbm");

tower_explode_anims()
{
    level.scr_animtree["tower"] = #animtree;
    level.scr_anim["tower"]["explosion"] = %icbm_power_tower_crash;
    level.scr_animtree["wire"] = #animtree;
    level.scr_anim["wire"]["idle6"][0] = %icbm_power_tower_wire_idle_le4;
    level.scr_anim["wire"]["idle7"][0] = %icbm_power_tower_wire_idle_le5;
    level.scr_anim["wire"]["idle8"][0] = %icbm_power_tower_wire_idle_le6;
    level.scr_anim["wire"]["idle9"][0] = %icbm_power_tower_wire_idle_ri4;
    level.scr_anim["wire"]["idle10"][0] = %icbm_power_tower_wire_idle_ri5;
    level.scr_anim["wire"]["idle11"][0] = %icbm_power_tower_wire_idle_ri6;
    level.scr_anim["wire"]["idle0"][0] = %h1_icbm_power_tower_wire_idle_le1;
    level.scr_anim["wire"]["idle1"][0] = %h1_icbm_power_tower_wire_idle_le2;
    level.scr_anim["wire"]["idle2"][0] = %h1_icbm_power_tower_wire_idle_le3;
    level.scr_anim["wire"]["idle3"][0] = %h1_icbm_power_tower_wire_idle_ri1;
    level.scr_anim["wire"]["idle4"][0] = %h1_icbm_power_tower_wire_idle_ri2;
    level.scr_anim["wire"]["idle5"][0] = %h1_icbm_power_tower_wire_idle_ri3;
    level.scr_anim["wire"]["idle12"][0] = %h1_icbm_power_tower_wire_idle_ri4;
    level.scr_anim["wire"]["idle13"][0] = %h1_icbm_power_tower_wire_idle_ri5;
    level.scr_anim["wire"]["idle14"][0] = %h1_icbm_power_tower_wire_idle_ri6;
    level.scr_anim["wire"]["idle15"][0] = %h1_icbm_power_tower_wire_idle_le4;
    level.scr_anim["wire"]["idle16"][0] = %h1_icbm_power_tower_wire_idle_le5;
    level.scr_anim["wire"]["idle17"][0] = %h1_icbm_power_tower_wire_idle_le6;
    level.scr_anim["wire"]["explosion6"] = %icbm_power_tower_wire_le4;
    level.scr_anim["wire"]["explosion7"] = %icbm_power_tower_wire_le5;
    level.scr_anim["wire"]["explosion8"] = %icbm_power_tower_wire_le6;
    level.scr_anim["wire"]["explosion9"] = %icbm_power_tower_wire_ri4;
    level.scr_anim["wire"]["explosion10"] = %icbm_power_tower_wire_ri5;
    level.scr_anim["wire"]["explosion11"] = %icbm_power_tower_wire_ri6;
    level.scr_anim["wire"]["explosion0"] = %h1_icbm_power_tower_wire_le1;
    level.scr_anim["wire"]["explosion1"] = %h1_icbm_power_tower_wire_le2;
    level.scr_anim["wire"]["explosion2"] = %h1_icbm_power_tower_wire_le3;
    level.scr_anim["wire"]["explosion3"] = %h1_icbm_power_tower_wire_ri1;
    level.scr_anim["wire"]["explosion4"] = %h1_icbm_power_tower_wire_ri2;
    level.scr_anim["wire"]["explosion5"] = %h1_icbm_power_tower_wire_ri3;
    level.scr_anim["wire"]["explosion12"] = %h1_icbm_power_tower_wire_ri4;
    level.scr_anim["wire"]["explosion13"] = %h1_icbm_power_tower_wire_ri5;
    level.scr_anim["wire"]["explosion14"] = %h1_icbm_power_tower_wire_ri6;
    level.scr_anim["wire"]["explosion15"] = %h1_icbm_power_tower_wire_le4;
    level.scr_anim["wire"]["explosion16"] = %h1_icbm_power_tower_wire_le5;
    level.scr_anim["wire"]["explosion17"] = %h1_icbm_power_tower_wire_le6;
    maps\_anim::addnotetrack_sound( "wire", "wire_snap", "explosion0", "scn_icbm_tower_wire_snap" );
    maps\_anim::addnotetrack_sound( "wire", "wire_snap", "explosion1", "scn_icbm_tower_wire_snap" );
    maps\_anim::addnotetrack_sound( "wire", "wire_snap", "explosion2", "scn_icbm_tower_wire_snap" );
    maps\_anim::addnotetrack_sound( "wire", "wire_snap", "explosion3", "scn_icbm_tower_wire_snap" );
    maps\_anim::addnotetrack_sound( "wire", "wire_snap", "explosion4", "scn_icbm_tower_wire_snap" );
    maps\_anim::addnotetrack_sound( "wire", "wire_snap", "explosion5", "scn_icbm_tower_wire_snap" );
    maps\_anim::addnotetrack_sound( "wire", "wire_snap", "explosion6", "scn_icbm_tower_wire_snap" );
    maps\_anim::addnotetrack_sound( "wire", "wire_snap", "explosion7", "scn_icbm_tower_wire_snap" );
    maps\_anim::addnotetrack_customfunction( "tower", "powertower_break", maps\icbm_code::tower_legbreak_fx, "explosion" );
    maps\_anim::addnotetrack_customfunction( "tower", "powertower_sparks", maps\icbm_code::tower_spark_fx, "explosion" );
    maps\_anim::addnotetrack_customfunction( "tower", "powertower_crash", maps\icbm_code::tower_impact_fx, "explosion" );
    level.scr_animtree["fence"] = #animtree;

    if ( getdvarint( "use_old_fence_cutting" ) == 1 )
        level.scr_anim["fence"]["model_cut"] = %icbm_fence_cutting_guy1_fence;
    else
        level.scr_anim["fence"]["model_cut"] = %h1_icbm_fence_cutting_guy1_fence;
}

#using_animtree("generic_human");

uaz_overrides()
{
    var_0 = vehicle_scripts\_uaz::setanims();
    var_0[0].death = %uaz_rear_driver_death;
    var_0[1].death = %uaz_passenger_death;
    var_0[0].explosion_death = %death_explosion_left11;
    var_0[1].explosion_death = %death_explosion_right13;
    var_0[0].getout = %h1_driver_getout_2_run;
    var_0[1].getout = %h1_passenger_getout_2_run;
    var_0[0].getout = %h1_uaz_driver_exit_into_run;
    var_0[0].getout_ik = 1;
    var_0[1].getout = %h1_uaz_passenger_exit_into_run;
    var_0[1].getout_ik = 1;
    var_0[2].getout = %h1_uaz_driver_exit_into_run;
    var_0[2].getout_ik = 1;
    var_0[3].getout = %h1_uaz_passenger_exit_into_run;
    var_0[3].getout_ik = 1;
    return var_0;
}

#using_animtree("vehicles");

uaz_vehicle_overrides( var_0 )
{
    var_0 = vehicle_scripts\_uaz::set_vehicle_anims( var_0 );
    var_0[0].vehicle_getoutanim = %h1_uaz_driver_exit_into_run_door;
    var_0[1].vehicle_getoutanim = %h1_uaz_passenger_exit_into_run_door;
    var_0[2].vehicle_getoutanim = %h1_uaz_driver_exit_into_run_door;
    var_0[3].vehicle_getoutanim = %h1_uaz_passenger_exit_into_run_door;
    var_0[0].vehicle_getoutsound = "h1_icbm_jeep_door1";
    var_0[1].vehicle_getoutsound = "h1_icbm_jeep_door2";
    return var_0;
}

#using_animtree("script_model");

script_models()
{
    level.scr_anim["chair"]["sleep_react"] = %parabolic_guard_sleeper_react_chair;
    level.scr_animtree["chair"] = #animtree;
    level.scr_model["chair"] = "com_folding_chair";
    maps\_anim::addnotetrack_customfunction( "chair", "scn_relaxed_guard_chair_death", ::play_relaxed_guard_chair_death, "sleep_react" );
}

play_relaxed_guard_chair_death( var_0 )
{
    var_0 thread common_scripts\utility::play_sound_in_space( "scn_icbm_relaxed_chair_fall", var_0.origin );
}

show_prices_knife( var_0 )
{
    level.price_knife show();
}

hide_prices_knife( var_0 )
{
    level.price_knife hide();
}
