// H1 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

#using_animtree("generic_human");

main()
{
    if ( getdvarint( "use_old_intro" ) == 1 )
    {
        level.scr_anim["price"]["opening"] = %village_intro_price;
        level.scr_anim["opening_guy"]["opening"] = %village_intro_contact;
    }
    else
    {
        level.scr_anim["price"]["opening"] = %h1_village_intro_price;
        level.scr_anim["opening_guy"]["opening"] = %h1_village_intro_contact;
        maps\_anim::addnotetrack_dialogue( "price", "dialog", "opening", "vassault_pri_kamarovsman" );
        maps\_anim::addnotetrack_dialogue( "price", "dialog", "opening", "vassault_pri_perfect" );
        maps\_anim::addnotetrack_dialogue( "opening_guy", "dialog", "opening", "vassault_ru4_asadinvillage" );
    }

    level.scr_sound["price"]["kamarovsman"] = "vassault_pri_kamarovsman";
    level.scr_sound["opening_guy"]["asadinvillage"] = "vassault_ru4_asadinvillage";
    level.scr_sound["price"]["perfect"] = "vassault_pri_perfect";
    level.scr_sound["gaz"]["whatsgoingon"] = "vassault_gaz_whatsgoingon";
    level.scr_sound["opening_guy"]["killingvillagers"] = "vassault_ru4_killingvillagers";
    level.scr_sound["gaz"]["notforlong"] = "vassault_gaz_notforlong";

    if ( getdvarint( "use_old_interrogation" ) == 1 )
    {
        level.scr_anim["price"]["interrogationA"] = %village_interrogationa_price;
        level.scr_anim["alasad"]["interrogationA"] = %village_interrogationa_zak;
        maps\_anim::addnotetrack_customfunction( "price", "gun_2_chest", maps\village_assault_code::alasad_notetracks, "interrogationA" );
        level.scr_anim["price"]["interrogationB"] = %village_interrogationb_price;
        level.scr_anim["gaz"]["interrogationB"] = %village_interrogationb_gaz;
        level.scr_anim["alasad"]["interrogationB"] = %village_interrogationb_zak;
    }
    else
    {
        level.scr_anim["price"]["interrogationA_run_in"] = %h1_village_interrogationa_price_run_in;
        level.scr_anim["price"]["interrogationA_idle"][0] = %h1_village_interrogationa_price_idle;
        level.scr_anim["price"]["interrogationA"] = %h1_village_interrogationa_price;
        level.scr_anim["alasad"]["interrogationA"] = %h1_village_interrogationa_zak;
        maps\_anim::addnotetrack_customfunction( "price", "gun_2_chest", maps\village_assault_code::alasad_notetracks, "interrogationA" );
        maps\_anim::addnotetrack_customfunction( "price", "dialog", ::price_interrogation_voiceover_genericfacial, "interrogationA" );
        maps\_anim::addnotetrack_customfunction( "price", "punch", ::price_interrogation_punch_fx, "interrogationA" );
        level.scr_anim["price"]["interrogationB"] = %h1_village_interrogationb_price;
        maps\_anim::addnotetrack_customfunction( "price", "punch", ::price_interrogation_punch_fx, "interrogationB" );
        level.scr_anim["gaz"]["interrogationB"] = %h1_village_interrogationb_gaz;
        level.scr_anim["alasad"]["interrogationB"] = %h1_village_interrogationb_zak;
        maps\_anim::addnotetrack_dialogue( "gaz", "dialog", "interrogationB", "vassault_gaz_cellphone" );
    }

    script_model_anims();
    animated_model_setup();
    dialog();
}

#using_animtree("script_model");

script_model_anims()
{
    if ( getdvarint( "use_old_interrogation" ) == 1 )
    {
        level.scr_anim["door"]["interrogationA"] = %village_interrogationa_door;
        level.scr_animtree["door"] = #animtree;
        level.scr_model["door"] = "com_door_01_handleleft_brown";
        level.scr_anim["phone"]["interrogationA"] = %village_interrogationa_phone;
        level.scr_animtree["phone"] = #animtree;
        level.scr_model["phone"] = "com_cellphone_on_ANIM";
        level.scr_anim["chair"]["interrogationB"] = %village_interrogationb_chair;
        level.scr_animtree["chair"] = #animtree;
        level.scr_model["chair"] = "com_folding_chair";
        level.scr_anim["phone"]["interrogationB"] = %village_interrogationb_phone;
        level.scr_animtree["phone"] = #animtree;
        level.scr_model["phone"] = "com_cellphone_on_ANIM";
    }
    else
    {
        level.scr_anim["door"]["interrogationA"] = %h1_village_interrogationa_door;
        level.scr_animtree["door"] = #animtree;
        level.scr_model["door"] = "com_door_01_handleleft_brown";
        level.scr_anim["phone"]["interrogationA"] = %h1_village_interrogationa_phone;
        level.scr_animtree["phone"] = #animtree;
        level.scr_model["phone"] = "com_cellphone_on_ANIM";
        level.scr_anim["rope"]["interrogationA"] = %h1_village_interrogationa_rope;
        level.scr_animtree["rope"] = #animtree;
        level.scr_model["rope"] = "h1_choke_rope";
        level.scr_anim["chair"]["interrogationB"] = %h1_village_interrogationb_chair;
        level.scr_animtree["chair"] = #animtree;
        level.scr_model["chair"] = "com_folding_chair";
        level.scr_anim["phone"]["interrogationB"] = %h1_village_interrogationb_phone;
        level.scr_animtree["phone"] = #animtree;
        level.scr_model["phone"] = "com_cellphone_on_ANIM";
        level.scr_anim["rope"]["interrogationB"] = %h1_village_interrogationb_rope;
        level.scr_animtree["rope"] = #animtree;
        level.scr_model["rope"] = "h1_choke_rope";
        level.scr_anim["handrope"]["interrogationB"] = %h1_village_interrogationb_handrope;
        level.scr_animtree["handrope"] = #animtree;
        level.scr_model["handrope"] = "h1_alasad_rope";
    }
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

dialog()
{
    level.scr_sound["price"]["nogooddead"] = "vassault_pri_nogooddead";
    level.scr_sound["price"]["airsupport"] = "vassault_pri_airsupport";
    level.scr_sound["price"]["softenup"] = "vassault_pri_softenup";
    level.scr_sound["gaz"]["nosign"] = "vassault_gaz_nosign";
    level.scr_sound["gaz"]["nextone"] = "vassault_gaz_nextone";
    level.scr_sound["gaz"]["checkother"] = "vassault_gaz_checkother";
    level.scr_sound["gaz"]["checknext"] = "vassault_gaz_checknext";
    level.scr_radio["ontheway"] = "vassault_rhp_ontheway";
    level.scr_radio["helicopteronway"] = "vassault_rhp_helicopteronway";
    level.scr_radio["wehavetarget"] = "vassault_rhp_wehavetarget";
    level.scr_radio["refuelandrearm"] = "vassault_rhp_refuelandrearm";
    level.scr_radio["readytoattack"] = "vassault_rhp_readytoattack";
    level.scr_radio["refueling"] = "vassault_rhp_refueling";
    level.scr_radio["rearming"] = "vassault_rhp_rearming";
    level.scr_sound["price"]["whydyoudoit"] = "vassault_pri_whydyoudoit";
    level.scr_sound["alasad"]["wasntme1"] = "vassault_kaa_wasntme1";
    level.scr_sound["price"]["whothen"] = "vassault_pri_whothen";
    level.scr_sound["alasad"]["wasntme2"] = "vassault_kaa_wasntme2";
    level.scr_sound["price"]["givemeaname"] = "vassault_pri_givemeaname";
    level.scr_sound["price"]["aname"] = "vassault_pri_aname";
    level.scr_sound["gaz"]["cellphone"] = "vassault_gaz_cellphone";
    level.scr_sound["gaz"]["whowasthat"] = "vassault_gaz_whowasthat";
    level.scr_sound["price"]["zakhaev"] = "vassault_pri_zakhaev";
    level.scr_sound["price"]["imran"] = "vassault_pri_imran";
}

price_interrogation_voiceover_genericfacial( var_0 )
{
    var_0 maps\_anim::anim_single_queue( var_0, "nogooddead" );
}

price_interrogation_punch_fx( var_0 )
{
    if ( !isdefined( level.price.interrogation_punch_counter ) )
        level.price.interrogation_punch_counter = 0;

    var_1 = "va_";

    if ( level.price.interrogation_punch_counter == 0 )
        var_1 += "pistol_whip";
    else
        var_1 += ( "punch_0" + level.price.interrogation_punch_counter );

    var_2 = level.alasad gettagorigin( "j_head" );
    var_3 = level.alasad gettagangles( "j_head" );
    playfx( level._effect[var_1], var_2, anglestoforward( var_3 ) );
    level.price.interrogation_punch_counter++;
}
