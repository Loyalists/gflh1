// H1 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

#using_animtree("generic_human");

main()
{
    if ( getdvarint( "use_old_tank_dialogue" ) == 1 )
    {
        level.scr_anim["price"]["tank_talk"] = %bog_a_tank_dialogue;
        level.scr_anim["left_guy"]["tank_talk"] = %bog_a_tank_dialogue_guyl;
        level.scr_anim["right_guy"]["tank_talk"] = %bog_a_tank_dialogue_guyr;
        level.scr_anim["price"]["tank_talk_idle"][0] = %bog_a_tank_dialogue_idle;
        level.scr_anim["left_guy"]["tank_talk_idle"][0] = %bog_a_tank_dialogue_guyl_idle;
        level.scr_anim["right_guy"]["tank_talk_idle"][0] = %bog_a_tank_dialogue_guyr_idle;
    }
    else
    {
        level.scr_anim["price"]["tank_talk"] = %h1_bog_a_tank_dialogue;
        level.scr_anim["left_guy"]["tank_talk"] = %h1_bog_a_tank_dialogue_guyl;
        level.scr_anim["right_guy"]["tank_talk"] = %h1_bog_a_tank_dialogue_guyr;
        level.scr_anim["price"]["tank_talk_idle"][0] = %h1_bog_a_tank_dialogue_idle;
        level.scr_anim["left_guy"]["tank_talk_idle"][0] = %h1_bog_a_tank_dialogue_guyl_idle;
        level.scr_anim["right_guy"]["tank_talk_idle"][0] = %h1_bog_a_tank_dialogue_guyr_idle;
    }

    maps\_anim::addnotetrack_dialogue( "price", "dialog", "tank_talk", "bog_vsq_listenup" );
    maps\_anim::addnotetrack_dialogue( "price", "dialog", "tank_talk", "bog_vsq_donthavemuchtime" );
    maps\_anim::addnotetrack_dialogue( "price", "dialog", "tank_talk", "bog_vsq_defensivepositions" );
    maps\_anim::addnotetrack_dialogue( "price", "dialog", "tank_talk", "bog_vsq_oorah" );
    maps\_anim::addnotetrack_animsound( "price", "tank_talk", "scn_vsq_tank_dialog_foley", "scn_vsq_tank_dialog_foley" );
    level.scr_radio["alphasixstatus"] = "bog_a_vsq_alphasixstatus";
    level.scr_sound["price"]["letsmoveout"] = "bog_a_vsq_letsmoveout";
    level.scr_sound["price"]["twocharliebravosix"] = "bog_a_vsq_twocharliebravosix";
    level.scr_sound["price"]["jacksonfindzpu"] = "bog_a_vsq_Jacksonfindzpu";
    level.scr_sound["price"]["plantbeacon"] = "bog_a_vsq_plantbeacon";
    level.scr_sound["price"]["securewest"] = "bog_a_vsq_securewest";
    level.scr_sound["marine"]["rogerthat"] = "bog_a_gm1_rogerthat";
    level.scr_sound["marine"]["plantc4"] = "bog_gm1_plantc4";
    level.scr_sound["marine"]["goodjob"] = "bog_gm1_goodjob";
    level.scr_sound["marine"]["jacksondoit"] = "bog_gm1_Jacksondoit";
    level.scr_sound["price"]["vampiresixfour"] = "bog_vsq_vampiresixfour";
    level.scr_sound["price"]["lzissecure"] = "bog_vsq_lzissecure";
    level.scr_sound["left_guy"]["regroupattank"] = "bog_blk_regroupattank";
    level.scr_sound["price"]["donthavemuchtime"] = "bog_vsq_donthavemuchtime";
    level.scr_sound["price"]["listen_up"] = "bog_vsq_listenup";
    level.scr_sound["price"]["dont_have_much_time"] = "bog_vsq_donthavemuchtime";
    level.scr_sound["price"]["defensive_positions"] = "bog_vsq_defensivepositions";
    level.scr_sound["price"]["oorah"] = "bog_vsq_oorah";
    level.scr_sound["gm1"]["oorah"] = "bog_gm1_oorah";
    level.scr_sound["gm2"]["oorah"] = "bog_gm2_oorah";
    level.scr_sound["gm3"]["oorah"] = "bog_gm3_oorah";
    level.scr_sound["price"]["allrightmoveout"] = "bog_vsq_allrightmoveout";
    level.scr_radio["stillsurrounded"] = "bog_a_gm1_stillsurrounded";
    level.scr_radio["contactseast"] = "bog_a_vsq_contactseast";
    level.scr_radio["movingindetpacks"] = "bog_a_vsq_movingindetpacks";
    level.scr_radio["maingunsoffline"] = "bog_tcm_maingunsoffline";
    level.scr_radio["dangeroverrun"] = "bog_a_vsq_dangeroverrun";
    level.scr_radio["jacksonawol"] = "bog_a_vsq_Jacksonawol";
    level.scr_radio["fallbacktank"] = "bog_a_vsq_fallbacktank";
    level.scr_radio["morewest"] = "bog_a_hqr_morewest";
    level.scr_radio["negativebravo"] = "bog_a_hqr_negativebravo";
    level.scr_radio["buttonedup"] = "bog_a_vsq_buttonedup";
    level.scr_radio["whereistheairsupport"] = "bog_gm1_airsupport";
    level.scr_radio["canttakebuilding"] = "bog_gm2_plantbeacon";
    level.scr_radio["rippingusapart"] = "bog_a_vsq_rippingusapart";
    level.scr_radio["standby"] = "bog_plt_standby";
    level.scr_radio["cominhot"] = "bog_plt_cominhot";
    level.scr_radio["seeanyoneleft"] = "bog_cop_negative";
    level.scr_radio["negative"] = "bog_plt_seeanyoneleft";
    level.scr_radio["alltargetsdestroyed"] = "bog_plt_alltargetsdestroyed";
    level.scr_radio["goodworkout"] = "bog_hqr_goodworkout";
}
