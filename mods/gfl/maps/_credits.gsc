// H1 GSC SOURCE
// Dumped by https://github.com/xensik/gsc-tool

initcredits()
{
    level.linesize = 1.0;
    level.headingsize = 1.75;
    level.linelist = [];
    maps\_utility::set_console_status();
    initiwcredits();
    initactivisioncredits();
}

initrmcredits()
{
    level.linesize = 1;
    level.headingsize = 1;
    level.linelist = [];
    level.remastertextsize = 0.8;
    level.remastertextcolorgrey = ( 0.5, 0.5, 0.5 );
    level.remastertextcolorwhite = ( 0.8, 0.8, 0.8 );
    level.remastertextcolorheading = ( 0.8, 0.8, 0.8 );
    level.delayscale = 0.8;
    level.destroydelayvalue = 18 * level.delayscale;
    level.moveovertimevalue = 18 * level.delayscale;
    maps\_utility::set_console_status();
    var_0 = 25;

    if ( level.pc )
        var_0 = 0;

    addcentergradientimage( "h1_deco_gradient_black", "bottom", var_0 );
    addcentergradientimage( "h1_deco_gradient_black_02", "top", -1 * var_0 );
    initiwpart1();
    initraven();
    initbeenox();
    inithms();
    initca();
    initnerve();
    initatvipart1();
    initiwpart2();
    initspecialthanks();
    initatvipart2();
}

initcredits_gflh1()
{
    addcenterheading("Girls' Frontline: Modern Warfare");
    addspace();

    addcenterheading("Producer");
    addspacesmall();
    addcentertriple("", "Loyalists", "");
    addspace();

    addcenterheading( "Cast" );
    addspacesmall();
    addcentertriple( "", "M4A1", "" );
    addcentertriple( "", "M4 SOPMOD II", "" );
    addcentertriple( "", "M16A1", "" );
    addcentertriple( "", "Negev", "" );
    addcentertriple( "", "SP9", "" );
    addcentertriple( "", "PPSh-41", "" );
    addcentertriple( "", "TAC-50", "" );
    addcentertriple( "", "AK-12", "" );
    addcentertriple( "", "Suomi", "" );
    addcentertriple( "", "Dima", "" );
    addcentertriple( "", "Commander", "" );
    addcentertriple( "", "Ouroboros", "" );
    addcentertriple( "", "Dreamer", "" );
    addcentertriple( "", "Destroyer", "" );
    addspace();

    addcenterheading( "Additional Cast" );
    addspacesmall();
    addcenternamedouble( "P90", "9A-91" );
    addcenternamedouble( "RFB", "Type-97" );
    addcenternamedouble( "Saiga-12", "FNC" );
    addcenternamedouble( "Sten MkII", "AK74M" );
    addcenternamedouble( "Super SASS", "MP7" );
    addcenternamedouble( "G36C", "" );
    addcenternamedouble( "Vespid", "Ripper" );
    addcenternamedouble( "Jaeger", "Guard" );
    addspace();

    addcenterheading("Special Thanks");
    addspacesmall();
    addcentertriple( "", "byb42", "" );
    addspace();
}

initiwpart1()
{
    addfunction( maps\simplecredits::music_original_wrapper );
    initcredits_gflh1();
    addcenterimage( "logo_infinityward", 256, 128, 3.875 );
    addspace();
    addspace();
    addcenternamecenter( &"CREDITS_ATVI_ORIGINAL_TEAM", level.remastertextsize );
    addspacesmall();
    addcenternamedouble( &"CREDITS_ATVI_ADRIENNE_ARRASMITH", &"CREDITS_ATVI_KEITH_BELL", level.remastertextsize );
    addcenternamedouble( &"CREDITS_ATVI_ALESSANDRO_BARTOLUCCI", &"CREDITS_ATVI_KRISTIN_COTTERELL", level.remastertextsize );
    addcenternamedouble( &"CREDITS_ATVI_ALEX_MEJIA", &"CREDITS_ATVI_LEI_YANG", level.remastertextsize );
    addcenternamedouble( &"CREDITS_ATVI_ALEXANDER_ROYCEWICZ", &"CREDITS_ATVI_LINDA_ROSEMEIER", level.remastertextsize );
    addcenternamedouble( &"CREDITS_ATVI_ALEXANDER_SHARRIGAN", &"CREDITS_ATVI_MACKEY_MCCANDLISH", level.remastertextsize );
    addcenternamedouble( &"CREDITS_ATVI_ANDREW_WANG", &"CREDITS_ATVI_MARK_GANUS", level.remastertextsize );
    addcenternamedouble( &"CREDITS_ATVI_BRAD_ALLEN", &"CREDITS_ATVI_MARK_GRIGSBY", level.remastertextsize );
    addcenternamedouble( &"CREDITS_ATVI_BRANDON_WILLIS", &"CREDITS_ATVI_MARK_RUBIN", level.remastertextsize );
    addcenternamedouble( &"CREDITS_ATVI_BRENT_MCLEOD", &"CREDITS_ATVI_MAX_VO", level.remastertextsize );
    addcenternamedouble( &"CREDITS_ATVI_BRIAN_ROYCEWICZ", &"CREDITS_ATVI_MICHAEL_BOON", level.remastertextsize );
    addcenternamedouble( &"CREDITS_ATVI_BRYAN_ANKER", &"CREDITS_ATVI_MOHAMMAD_ALAVI", level.remastertextsize );
    addcenternamedouble( &"CREDITS_ATVI_BRYAN_KUHN", &"CREDITS_ATVI_NATHAN_SILVERS", level.remastertextsize );
    addcenternamedouble( &"CREDITS_ATVI_CARLY_GILLIS", &"CREDITS_ATVI_NEEL_KAR", level.remastertextsize );
    addcenternamedouble( &"CREDITS_ATVI_CHAD_BARB", &"CREDITS_ATVI_NICOLE_SCATES", level.remastertextsize );
    addcenternamedouble( &"CREDITS_ATVI_CHAD_GRENIER", &"CREDITS_ATVI_NORMAN_OVANDO", level.remastertextsize );
    addcenternamedouble( &"CREDITS_ATVI_CHANCE_GLASCO", &"CREDITS_ATVI_OSCAR_LOPEZ", level.remastertextsize );
    addcenternamedouble( &"CREDITS_ATVI_CHENG_LOR", &"CREDITS_ATVI_PAUL_MESSERLY", level.remastertextsize );
    addcenternamedouble( &"CREDITS_ATVI_CHRIS_CHERUBINI", &"CREDITS_ATVI_PETE_BLUMEL", level.remastertextsize );
    addcenternamedouble( &"CREDITS_ATVI_CHRISSY_ARYA", &"CREDITS_ATVI_PETER_CHEN", level.remastertextsize );
    addcenternamedouble( &"CREDITS_ATVI_CHRISTIAN_MURILLO", &"CREDITS_ATVI_PRESTON_GLENN", level.remastertextsize );
    addcenternamedouble( &"CREDITS_ATVI_DANIEL_GERMANN", &"CREDITS_ATVI_RAYME_VINSON", level.remastertextsize );
    addcenternamedouble( &"CREDITS_ATVI_DIMITRI_DEL_CASTILLO", &"CREDITS_ATVI_REILLY_CAMPBELL", level.remastertextsize );
    addcenternamedouble( &"CREDITS_ATVI_DREW_MCCOY", &"CREDITS_ATVI_RENE_LARA", level.remastertextsize );
    addcenternamedouble( &"CREDITS_ATVI_EARL_HAMMON_JR", &"CREDITS_ATVI_RICHARD_BAKER", level.remastertextsize );
    addcenternamedouble( &"CREDITS_ATVI_ED_HARMER", &"CREDITS_ATVI_RICHARD_GARCIA", level.remastertextsize );
    addcenternamedouble( &"CREDITS_ATVI_EMILY_RULE", &"CREDITS_ATVI_RICHARD_KRIEGLER", level.remastertextsize );
    addcenternamedouble( &"CREDITS_ATVI_ERIC_PIERCE", &"CREDITS_ATVI_RICHARD_SMITH", level.remastertextsize );
    addcenternamedouble( &"CREDITS_ATVI_ESTEVAN_BECERRA", &"CREDITS_ATVI_ROBERT_BOWLING", level.remastertextsize );
    addcenternamedouble( &"CREDITS_ATVI_EVAN_HATCH", &"CREDITS_ATVI_ROBERT_FIELD", level.remastertextsize );
    addcenternamedouble( &"CREDITS_ATVI_FRANCESCO_GIGLIOTTI", &"CREDITS_ATVI_ROBERT_GAINES", level.remastertextsize );
    addcenternamedouble( &"CREDITS_ATVI_GAVIN_NIEBEL", &"CREDITS_ATVI_ROBERT_RITER", level.remastertextsize );
    addcenternamedouble( &"CREDITS_ATVI_GEOFFREY_SMITH", &"CREDITS_ATVI_ROGER_ABRAHAMSSON", level.remastertextsize );
    addcenternamedouble( &"CREDITS_ATVI_GRANT_COLLIER", &"CREDITS_ATVI_RYAN_LASTIMOSA", level.remastertextsize );
    addcenternamedouble( &"CREDITS_ATVI_HERBERT_LOWIS", &"CREDITS_ATVI_SAMI_ONUR", level.remastertextsize );
    addcenternamedouble( &"CREDITS_ATVI_JAKE_KEATING", &"CREDITS_ATVI_SHAMENE_CHILDRESS", level.remastertextsize );
    addcenternamedouble( &"CREDITS_ATVI_JANICE_TURNER", &"CREDITS_ATVI_SOMPOOM_TANGCHUPONG", level.remastertextsize );
    addcenternamedouble( &"CREDITS_ATVI_JASON_TOM", &"CREDITS_ATVI_STEPHEN_MILLER", level.remastertextsize );
    addcenternamedouble( &"CREDITS_ATVI_JASON_WEST", &"CREDITS_ATVI_STEVE_FUKUDA", level.remastertextsize );
    addcenternamedouble( &"CREDITS_ATVI_JEFF_HEATH", &"CREDITS_ATVI_STEVE_LOUIS", level.remastertextsize );
    addcenternamedouble( &"CREDITS_ATVI_JEMUEL_GARNETT", &"CREDITS_ATVI_STEVE_MASSEY", level.remastertextsize );
    addcenternamedouble( &"CREDITS_ATVI_JESSE_STERN", &"CREDITS_ATVI_TAEHOON_OH", level.remastertextsize );
    addcenternamedouble( &"CREDITS_ATVI_JIESANG_SONG", &"CREDITS_ATVI_TAN_LA", level.remastertextsize );
    addcenternamedouble( &"CREDITS_ATVI_JOEL_EMSLIE", &"CREDITS_ATVI_THEERAPOL_SRISUPHAN", level.remastertextsize );
    addcenternamedouble( &"CREDITS_ATVI_JOEL_GOMPERT", &"CREDITS_ATVI_TODD_ALDERMAN", level.remastertextsize );
    addcenternamedouble( &"CREDITS_ATVI_JOHN_HAGGERTY", &"CREDITS_ATVI_TODD_SUE", level.remastertextsize );
    addcenternamedouble( &"CREDITS_ATVI_JON_DAVIS", &"CREDITS_ATVI_TRISTEN_SAKURADA", level.remastertextsize );
    addcenternamedouble( &"CREDITS_ATVI_JON_PORTER", &"CREDITS_ATVI_VELINDA_PELAYO", level.remastertextsize );
    addcenternamedouble( &"CREDITS_ATVI_JON_SHIRING", &"CREDITS_ATVI_VINCE_ZAMPELLA", level.remastertextsize );
    addcenternamedouble( &"CREDITS_ATVI_JUAN_RAMIREZ", &"CREDITS_ATVI_WILLIAM_CHO", level.remastertextsize );
    addcenternamedouble( &"CREDITS_ATVI_JULIAN_LUO", &"CREDITS_ATVI_ZACH_VOLKER", level.remastertextsize );
    addcenternamedouble( &"CREDITS_ATVI_KEANE_TANOUYE", &"CREDITS_ATVI_ZIED_RIEKE", level.remastertextsize );
}

initraven()
{
    addstudiospacing();
    addcenterimage( "logo_raven", 256, 128, 3.875 );
    addspace();
    addspace();
    addcenternamedouble( &"CREDITS_ATVI_ADAM_DOYLE", &"CREDITS_ATVI_JEFF_NEWQUIST", level.remastertextsize );
    addcenternamedouble( &"CREDITS_ATVI_ADRIAN_CAMPOS", &"CREDITS_ATVI_JEFFREY_SKUBAL", level.remastertextsize );
    addcenternamedouble( &"CREDITS_ATVI_ALBERTO_NOTI", &"CREDITS_ATVI_JEREMIAH_BYCHOWSKI", level.remastertextsize );
    addcenternamedouble( &"CREDITS_ATVI_ALEX_KAUSAK", &"CREDITS_ATVI_JEREMY_SHOCKEY", level.remastertextsize );
    addcenternamedouble( &"CREDITS_ATVI_AMOS_HODGE", &"CREDITS_ATVI_JONATHAN_ALVARADO", level.remastertextsize );
    addcenternamedouble( &"CREDITS_ATVI_ANDREW_FALTH", &"CREDITS_ATVI_JONATHAN_GRAHAM", level.remastertextsize );
    addcenternamedouble( &"CREDITS_ATVI_ANDREW_GREENWOOD", &"CREDITS_ATVI_JONATHAN_WALKER", level.remastertextsize );
    addcenternamedouble( &"CREDITS_ATVI_ANDREW_OLSON", &"CREDITS_ATVI_JORGE_CORONA", level.remastertextsize );
    addcenternamedouble( &"CREDITS_ATVI_ANDY_BAYLESS", &"CREDITS_ATVI_JOSH_KIERZEK", level.remastertextsize );
    addcenternamedouble( &"CREDITS_ATVI_AUSTIN_ADAMSON", &"CREDITS_ATVI_KATHLEEN_MARTY", level.remastertextsize );
    addcenternamedouble( &"CREDITS_ATVI_BENJAMIN_ERICKSON", &"CREDITS_ATVI_KATHRYN_BOCK", level.remastertextsize );
    addcenternamedouble( &"CREDITS_ATVI_BENJAMIN_KURDZIEL", &"CREDITS_ATVI_KATIE_SABIN", level.remastertextsize );
    addcenternamedouble( &"CREDITS_ATVI_BERND_KREIMEIER", &"CREDITS_ATVI_KEITH_MATEJKA", level.remastertextsize );
    addcenternamedouble( &"CREDITS_ATVI_BRENNA_OLEARY", &"CREDITS_ATVI_KEITH_PLESHA", level.remastertextsize );
    addcenternamedouble( &"CREDITS_ATVI_BRENTON_MATHEWS", &"CREDITS_ATVI_KELE_CARRAHERQUINTEROS", level.remastertextsize );
    addcenternamedouble( &"CREDITS_ATVI_BRIAN_HACKBARTH", &"CREDITS_ATVI_KELSON_RAFFEL", level.remastertextsize );
    addcenternamedouble( &"CREDITS_ATVI_BRIAN_RAFFEL", &"CREDITS_ATVI_KEVIN_ECKSTEIN", level.remastertextsize );
    addcenternamedouble( &"CREDITS_ATVI_BRIAN_URBANEK", &"CREDITS_ATVI_KYLE_STEPHENS", level.remastertextsize );
    addcenternamedouble( &"CREDITS_ATVI_BUMJIN_LEE", &"CREDITS_ATVI_LILY_GUSTAFSON", level.remastertextsize );
    addcenternamedouble( &"CREDITS_ATVI_CAITLYN_FIFIELD", &"CREDITS_ATVI_LINDSAY_BERGER", level.remastertextsize );
    addcenternamedouble( &"CREDITS_ATVI_CALEB_ZART", &"CREDITS_ATVI_LUCAS_MEYER", level.remastertextsize );
    addcenternamedouble( &"CREDITS_ATVI_CHARLES_MOORE", &"CREDITS_ATVI_MARIO_BOTERO", level.remastertextsize );
    addcenternamedouble( &"CREDITS_ATVI_CHARLES_MORROW", &"CREDITS_ATVI_MARIO_GIOMBI", level.remastertextsize );
    addcenternamedouble( &"CREDITS_ATVI_CHARLES_WEISS", &"CREDITS_ATVI_MARK_KILBORN", level.remastertextsize );
    addcenternamedouble( &"CREDITS_ATVI_CHARLIE_BERNSTEIN", &"CREDITS_ATVI_MARK_KORNKVEN", level.remastertextsize );
    addcenternamedouble( &"CREDITS_ATVI_CHRIS_DIORIO", &"CREDITS_ATVI_MARK_MAXWELL", level.remastertextsize );
    addcenternamedouble( &"CREDITS_ATVI_CHRIS_FOSTER", &"CREDITS_ATVI_MARKUS_PEEKNA", level.remastertextsize );
    addcenternamedouble( &"CREDITS_ATVI_CHRISTINA_SEAMAN", &"CREDITS_ATVI_MARTIN_MCBAIN", level.remastertextsize );
    addcenternamedouble( &"CREDITS_ATVI_CHRISTOPHER_BEESE", &"CREDITS_ATVI_MATT_PINKSTON", level.remastertextsize );
    addcenternamedouble( &"CREDITS_ATVI_CHRISTOPHER_HARTMANN", &"CREDITS_ATVI_MATT_STYRWOLL", level.remastertextsize );
    addcenternamedouble( &"CREDITS_ATVI_CHRISTOPHER_OLSEN", &"CREDITS_ATVI_MATTHEW_NEWTON", level.remastertextsize );
    addcenternamedouble( &"CREDITS_ATVI_CORY_BILLETT", &"CREDITS_ATVI_MICHAEL_FLICKINGER", level.remastertextsize );
    addcenternamedouble( &"CREDITS_ATVI_CURTIS_HILL", &"CREDITS_ATVI_MIKE_BUTTON", level.remastertextsize );
    addcenternamedouble( &"CREDITS_ATVI_CURTIS_SMITH", &"CREDITS_ATVI_MIKE_EKBERG", level.remastertextsize );
    addcenternamedouble( &"CREDITS_ATVI_CURTIS_ZUEHLS", &"CREDITS_ATVI_MIKE_RENNER", level.remastertextsize );
    addcenternamedouble( &"CREDITS_ATVI_DALLAS_MIDDLETON", &"CREDITS_ATVI_NATHANIEL_JORGENSON", level.remastertextsize );
    addcenternamedouble( &"CREDITS_ATVI_DAN_MERBOTH", &"CREDITS_ATVI_NICHOLAS_RIDDLE", level.remastertextsize );
    addcenternamedouble( &"CREDITS_ATVI_DAN_TAFARO", &"CREDITS_ATVI_NICHOLAS_STEVENSON", level.remastertextsize );
    addcenternamedouble( &"CREDITS_ATVI_DAN_VONDRAK", &"CREDITS_ATVI_NICK_COMEAU", level.remastertextsize );
    addcenternamedouble( &"CREDITS_ATVI_DAVID_HAUPTMAN", &"CREDITS_ATVI_NIMAH_KELLY", level.remastertextsize );
    addcenternamedouble( &"CREDITS_ATVI_DAVID_OSEI", &"CREDITS_ATVI_PAT_WILLIAMS", level.remastertextsize );
    addcenternamedouble( &"CREDITS_ATVI_DAVID_PELLAS", &"CREDITS_ATVI_RACHEL_BERKOWITZ", level.remastertextsize );
    addcenternamedouble( &"CREDITS_ATVI_DEREK_LARSON", &"CREDITS_ATVI_RAQUEL_GARCIA", level.remastertextsize );
    addcenternamedouble( &"CREDITS_ATVI_DRAKE_DAHM", &"CREDITS_ATVI_REYMUNDO_SIERRA", level.remastertextsize );
    addcenternamedouble( &"CREDITS_ATVI_DWIGHT_LUETSCHER", &"CREDITS_ATVI_RICK_ZENG", level.remastertextsize );
    addcenternamedouble( &"CREDITS_ATVI_EMILY_KUYKENDALL", &"CREDITS_ATVI_ROSS_JACKSON", level.remastertextsize );
    addcenternamedouble( &"CREDITS_ATVI_EMMANUEL_APILADO", &"CREDITS_ATVI_RUSS_OLMSTEAD", level.remastertextsize );
    addcenternamedouble( &"CREDITS_ATVI_ERIC_BIESSMAN", &"CREDITS_ATVI_RYAN_BURNETT", level.remastertextsize );
    addcenternamedouble( &"CREDITS_ATVI_ERIC_SCHLAUTMAN", &"CREDITS_ATVI_RYAN_BUTTS", level.remastertextsize );
    addcenternamedouble( &"CREDITS_ATVI_ERIC_SCHMIDT", &"CREDITS_ATVI_RYAN_GILLES", level.remastertextsize );
    addcenternamedouble( &"CREDITS_ATVI_ERIC_WILLES", &"CREDITS_ATVI_RYAN_HUMMER", level.remastertextsize );
    addcenternamedouble( &"CREDITS_ATVI_ERICH_BORMANN", &"CREDITS_ATVI_RYAN_RIES", level.remastertextsize );
    addcenternamedouble( &"CREDITS_ATVI_ETHAN_FRAME", &"CREDITS_ATVI_SAM_WILLIAMS", level.remastertextsize );
    addcenternamedouble( &"CREDITS_ATVI_ETHAN_HILEY", &"CREDITS_ATVI_SCOTT_WARREN", level.remastertextsize );
    addcenternamedouble( &"CREDITS_ATVI_EUGENE_GEER", &"CREDITS_ATVI_SHANNON_ANDERSEN", level.remastertextsize );
    addcenternamedouble( &"CREDITS_ATVI_GABRIEL_CERVANTES", &"CREDITS_ATVI_SHAWN_PEEPLES", level.remastertextsize );
    addcenternamedouble( &"CREDITS_ATVI_GINA_LOHMAN", &"CREDITS_ATVI_SPENCER_NIGL", level.remastertextsize );
    addcenternamedouble( &"CREDITS_ATVI_GRADEN_MCCOOL", &"CREDITS_ATVI_STE_CORK", level.remastertextsize );
    addcenternamedouble( &"CREDITS_ATVI_GREG_DUNKELBERGER", &"CREDITS_ATVI_STEPHEN_JENKINS", level.remastertextsize );
    addcenternamedouble( &"CREDITS_ATVI_GUILLERMO_GARCIASAMPEDRO", &"CREDITS_ATVI_STEVE_RAFFEL", level.remastertextsize );
    addcenternamedouble( &"CREDITS_ATVI_IOANNIS_KARATHOMAS", &"CREDITS_ATVI_STEVEN_CRUMP", level.remastertextsize );
    addcenternamedouble( &"CREDITS_ATVI_ISAAC_OWENS", &"CREDITS_ATVI_TAYLOR_HOLZAPFEL", level.remastertextsize );
    addcenternamedouble( &"CREDITS_ATVI_JAMES_BRADFORD", &"CREDITS_ATVI_TERRY_RIZZI", level.remastertextsize );
    addcenternamedouble( &"CREDITS_ATVI_JAMES_LARA", &"CREDITS_ATVI_TIM_UTTECH", level.remastertextsize );
    addcenternamedouble( &"CREDITS_ATVI_JAMES_MONROE", &"CREDITS_ATVI_TOM_FUCHS", level.remastertextsize );
    addcenternamedouble( &"CREDITS_ATVI_JAMES_VAN_HORN", &"CREDITS_ATVI_TOM_HATCHER", level.remastertextsize );
    addcenternamedouble( &"CREDITS_ATVI_JAMIE_PARENT", &"CREDITS_ATVI_WAYNE_KOENIG", level.remastertextsize );
    addcenternamedouble( &"CREDITS_ATVI_JARROD_SHOWERS", &"CREDITS_ATVI_WILLIAM_CARANI", level.remastertextsize );
    addcenternamedouble( &"CREDITS_ATVI_JASON_HOLT", &"CREDITS_ATVI_WILLIAM_PETROSKY", level.remastertextsize );
    addcenternamedouble( &"CREDITS_ATVI_JEFF_DEGENHARDT", &"CREDITS_ATVI_ZACK_COOPER", level.remastertextsize );
}

initbeenox()
{
    addstudiospacing();
    addcenterimage( "logo_beenox", 256, 128, 3.875 );
    addspace();
    addspace();
    addcenternamedouble( &"CREDITS_ATVI_ADAM_BLANCHETMAINVILLE", &"CREDITS_ATVI_KARINE_BEDARD", level.remastertextsize );
    addcenternamedouble( &"CREDITS_ATVI_ADAM_ROSENHEK", &"CREDITS_ATVI_KARINE_WINDY_BOUDREAULT", level.remastertextsize );
    addcenternamedouble( &"CREDITS_ATVI_ALAIN_BELLEHUMEUR", &"CREDITS_ATVI_KEVEN_FORTIN", level.remastertextsize );
    addcenternamedouble( &"CREDITS_ATVI_ALEX_BOISJOLYMARTIN", &"CREDITS_ATVI_KEVIN_ROYER", level.remastertextsize );
    addcenternamedouble( &"CREDITS_ATVI_ALEX_MERCIER", &"CREDITS_ATVI_LAURIANE_BERTRANDCHARETTE", level.remastertextsize );
    addcenternamedouble( &"CREDITS_ATVI_ALEXANDRE_BERGERON", &"CREDITS_ATVI_LAURIE_LESPERANCE", level.remastertextsize );
    addcenternamedouble( &"CREDITS_ATVI_ALEXANDRE_LESSARD", &"CREDITS_ATVI_LOUISEMMANUEL_POTHIER", level.remastertextsize );
    addcenternamedouble( &"CREDITS_ATVI_ANDREANNE_DION_LANDRY", &"CREDITS_ATVI_LUCANDRE_MURRAY", level.remastertextsize );
    addcenternamedouble( &"CREDITS_ATVI_ANTONY_BOUDREAU", &"CREDITS_ATVI_MARCALEXANDRE_BOULANGERMILOT", level.remastertextsize );
    addcenternamedouble( &"CREDITS_ATVI_ARNAUD_SIMONLAFOREST", &"CREDITS_ATVI_MARCANDRE_GAGNE", level.remastertextsize );
    addcenternamedouble( &"CREDITS_ATVI_BENJAMINPIER_DUMAS", &"CREDITS_ATVI_MARCANDRE_DUCHARME", level.remastertextsize );
    addcenternamedouble( &"CREDITS_ATVI_BENOIT_RIVARD", &"CREDITS_ATVI_MARCANTOINE_JOLY", level.remastertextsize );
    addcenternamedouble( &"CREDITS_ATVI_BERTRAND_REMONDIN", &"CREDITS_ATVI_MARCANTOINE_SAINDON", level.remastertextsize );
    addcenternamedouble( &"CREDITS_ATVI_CASSIANO_FONTENELE_ROCHA", &"CREDITS_ATVI_MARIEELLA_PINSONNEAULT", level.remastertextsize );
    addcenternamedouble( &"CREDITS_ATVI_CATHERINE_BLOUIN", &"CREDITS_ATVI_MARIEEVE_TREMBLAY", level.remastertextsize );
    addcenternamedouble( &"CREDITS_ATVI_CATHERINE_SIMARD", &"CREDITS_ATVI_MARIEJOELLE_GINGRAS", level.remastertextsize );
    addcenternamedouble( &"CREDITS_ATVI_CHARLESETIENNE_DESBIENS", &"CREDITS_ATVI_MARIELLE_DIONROBIDOUX", level.remastertextsize );
    addcenternamedouble( &"CREDITS_ATVI_CHRISTIAN_AUGERMORIN", &"CREDITS_ATVI_MARIEPIER_DESMARAIS", level.remastertextsize );
    addcenternamedouble( &"CREDITS_ATVI_CINDY_VILLENEUVE", &"CREDITS_ATVI_MARIO_ALMAGUER", level.remastertextsize );
    addcenternamedouble( &"CREDITS_ATVI_CORENTIN_SIBRET", &"CREDITS_ATVI_MARIO_NOTARO", level.remastertextsize );
    addcenternamedouble( &"CREDITS_ATVI_CYNTHIA_VANDERMOUTEN", &"CREDITS_ATVI_MARTIN_RHEAUME", level.remastertextsize );
    addcenternamedouble( &"CREDITS_ATVI_DAMIEN_DOZIAS", &"CREDITS_ATVI_MATHIEU_BIBEAUMORIN", level.remastertextsize );
    addcenternamedouble( &"CREDITS_ATVI_DANIEL_BOULIANNE", &"CREDITS_ATVI_MATHIEU_BROUILLETTE", level.remastertextsize );
    addcenternamedouble( &"CREDITS_ATVI_DANIEL_DEMERS", &"CREDITS_ATVI_MATHIEU_DENIS", level.remastertextsize );
    addcenternamedouble( &"CREDITS_ATVI_DANIEL_VOYERLESSARD", &"CREDITS_ATVI_MATHIEU_FOURNIER", level.remastertextsize );
    addcenternamedouble( &"CREDITS_ATVI_DANNY_ANGELO_CARMINATI_GREIN", &"CREDITS_ATVI_MATHIEU_GOSSELIN", level.remastertextsize );
    addcenternamedouble( &"CREDITS_ATVI_DAVE_BERGERON", &"CREDITS_ATVI_MATHIEU_HUNTER", level.remastertextsize );
    addcenternamedouble( &"CREDITS_ATVI_DAVID_BLONDEAU", &"CREDITS_ATVI_MATHIEU_MERCIER", level.remastertextsize );
    addcenternamedouble( &"CREDITS_ATVI_DAVID_BOURDAGES", &"CREDITS_ATVI_MAXIM_TREMBLAY", level.remastertextsize );
    addcenternamedouble( &"CREDITS_ATVI_DAVID_COLINDOIRON", &"CREDITS_ATVI_MAXIME_BABIN", level.remastertextsize );
    addcenternamedouble( &"CREDITS_ATVI_DAVID_LALANCETTE", &"CREDITS_ATVI_MAXIME_CARRIER", level.remastertextsize );
    addcenternamedouble( &"CREDITS_ATVI_DELPHINE_AUBRY", &"CREDITS_ATVI_MAXIME_LANDRY", level.remastertextsize );
    addcenternamedouble( &"CREDITS_ATVI_DOMINIC_CHARRON", &"CREDITS_ATVI_MAXIME_PARADIS", level.remastertextsize );
    addcenternamedouble( &"CREDITS_ATVI_DOMINIC_MORIN", &"CREDITS_ATVI_MAXIME_PROULX", level.remastertextsize );
    addcenternamedouble( &"CREDITS_ATVI_DOMINIQUE_MAHE", &"CREDITS_ATVI_MELANIE_SIMARD", level.remastertextsize );
    addcenternamedouble( &"CREDITS_ATVI_EMILE_LAFRENIERE", &"CREDITS_ATVI_MICHAEL_BISSON", level.remastertextsize );
    addcenternamedouble( &"CREDITS_ATVI_ERIC_BERNARD", &"CREDITS_ATVI_MICHAEL_GUIMONT", level.remastertextsize );
    addcenternamedouble( &"CREDITS_ATVI_ERIC_POULIOT", &"CREDITS_ATVI_MITCH_FOURNIER", level.remastertextsize );
    addcenternamedouble( &"CREDITS_ATVI_ERIC_LAVOIE", &"CREDITS_ATVI_NATHAN_MORASSE", level.remastertextsize );
    addcenternamedouble( &"CREDITS_ATVI_ETIENNE_BEAULIEU", &"CREDITS_ATVI_NICOLAS_STPIERRE", level.remastertextsize );
    addcenternamedouble( &"CREDITS_ATVI_ETIENNE_BOISSEAU", &"CREDITS_ATVI_NICOLAS_TREMBLAY", level.remastertextsize );
    addcenternamedouble( &"CREDITS_ATVI_ETIENNE_POULIOT", &"CREDITS_ATVI_NICOLAS_VIGNEAULTGENDRON", level.remastertextsize );
    addcenternamedouble( &"CREDITS_ATVI_ETIENNE_GIGUERE", &"CREDITS_ATVI_NOUR_POLLONI", level.remastertextsize );
    addcenternamedouble( &"CREDITS_ATVI_EVERTON_FERNANDO_PATITUCCI", &"CREDITS_ATVI_OLIVIER_BEDARD", level.remastertextsize );
    addcenternamedouble( &"CREDITS_ATVI_FELIX_LALIBERTE", &"CREDITS_ATVI_OLIVIER_BELLETETE", level.remastertextsize );
    addcenternamedouble( &"CREDITS_ATVI_FELIXANTOINE_DESYGILLIES", &"CREDITS_ATVI_OLIVIER_GAGNEHOULE", level.remastertextsize );
    addcenternamedouble( &"CREDITS_ATVI_FLAVIE_GRATTON", &"CREDITS_ATVI_PASCAL_BRULOTTE", level.remastertextsize );
    addcenternamedouble( &"CREDITS_ATVI_FRANCIS_LAGRANGE", &"CREDITS_ATVI_PASCAL_GAGNON", level.remastertextsize );
    addcenternamedouble( &"CREDITS_ATVI_FRANCOIS_BOUTET", &"CREDITS_ATVI_PATRICK_RENAUD", level.remastertextsize );
    addcenternamedouble( &"CREDITS_ATVI_FRANCOIS_CASSISTAPROULX", &"CREDITS_ATVI_PHILIPPE_LAMARCHE", level.remastertextsize );
    addcenternamedouble( &"CREDITS_ATVI_FRANCOIS_DURAND", &"CREDITS_ATVI_PHILIPPE_RENE", level.remastertextsize );
    addcenternamedouble( &"CREDITS_ATVI_FRANCOIS_HAMEL", &"CREDITS_ATVI_PHILIPPE_STARNAUD", level.remastertextsize );
    addcenternamedouble( &"CREDITS_ATVI_FRANCOIS_TADDEI", &"CREDITS_ATVI_PHILIPPE_TROIE", level.remastertextsize );
    addcenternamedouble( &"CREDITS_ATVI_FREDERIC_FORTIN", &"CREDITS_ATVI_PHILIPPE_TURCOTTE", level.remastertextsize );
    addcenternamedouble( &"CREDITS_ATVI_FREDERIC_WILSON", &"CREDITS_ATVI_PHILIPPE_VALOIS", level.remastertextsize );
    addcenternamedouble( &"CREDITS_ATVI_FREDERICK_IMBEAULT", &"CREDITS_ATVI_PIERREDANTE_DELBOULLE", level.remastertextsize );
    addcenternamedouble( &"CREDITS_ATVI_GABRIEL_BLAIN", &"CREDITS_ATVI_PIERRELUC_CORMIER", level.remastertextsize );
    addcenternamedouble( &"CREDITS_ATVI_GABRIEL_BOUFFARD", &"CREDITS_ATVI_PIERRELUC_GRONDINES", level.remastertextsize );
    addcenternamedouble( &"CREDITS_ATVI_GABRIEL_DION", &"CREDITS_ATVI_RAPHAEL_GUAYPICARD", level.remastertextsize );
    addcenternamedouble( &"CREDITS_ATVI_GABRIEL_VEZINA", &"CREDITS_ATVI_REMI_GOSSELIN", level.remastertextsize );
    addcenternamedouble( &"CREDITS_ATVI_GILBERT_SAMSON", &"CREDITS_ATVI_RICHARD_DUBREUIL", level.remastertextsize );
    addcenternamedouble( &"CREDITS_ATVI_GUILLAUME_ALAIN", &"CREDITS_ATVI_RICHARD_HARVEYLEVERT", level.remastertextsize );
    addcenternamedouble( &"CREDITS_ATVI_GUILLAUME_AUBE", &"CREDITS_ATVI_ROBERT_SIMARD", level.remastertextsize );
    addcenternamedouble( &"CREDITS_ATVI_GUILLAUME_AUDET", &"CREDITS_ATVI_SACHA_MEUNIER", level.remastertextsize );
    addcenternamedouble( &"CREDITS_ATVI_GUILLAUME_GAUTHIER", &"CREDITS_ATVI_SAMUEL_CARRIER", level.remastertextsize );
    addcenternamedouble( &"CREDITS_ATVI_GUILLAUME_GAGNEGAUTHIER", &"CREDITS_ATVI_SAMUEL_DUBOIS", level.remastertextsize );
    addcenternamedouble( &"CREDITS_ATVI_GUILLAUME_GAGNE", &"CREDITS_ATVI_SAMUEL_FRADETTE", level.remastertextsize );
    addcenternamedouble( &"CREDITS_ATVI_IAN_LEVESQUEPERREAULT", &"CREDITS_ATVI_SAMUEL_VANDAL", level.remastertextsize );
    addcenternamedouble( &"CREDITS_ATVI_IRVIN_THOMAS", &"CREDITS_ATVI_SEBASTIEN_GIROUX", level.remastertextsize );
    addcenternamedouble( &"CREDITS_ATVI_JANNE_RICHARD", &"CREDITS_ATVI_SEBASTIEN_GREGOIRE", level.remastertextsize );
    addcenternamedouble( &"CREDITS_ATVI_JEANCHRISTOPHE_MARTIN", &"CREDITS_ATVI_SEBASTIEN_OUELLET", level.remastertextsize );
    addcenternamedouble( &"CREDITS_ATVI_JEANBENOIT_LACHANCE", &"CREDITS_ATVI_SEBASTIEN_ROY", level.remastertextsize );
    addcenternamedouble( &"CREDITS_ATVI_JEANFRANCOIS_TREMBLAY", &"CREDITS_ATVI_SIMON_CAUXBARGE", level.remastertextsize );
    addcenternamedouble( &"CREDITS_ATVI_JEANMICHEL_THERIAULT", &"CREDITS_ATVI_SIMON_CHARTIER", level.remastertextsize );
    addcenternamedouble( &"CREDITS_ATVI_JEANPHILIPPE_ROSS", &"CREDITS_ATVI_SIMON_COUTURE", level.remastertextsize );
    addcenternamedouble( &"CREDITS_ATVI_JEANPIERRE_LAPOINTE", &"CREDITS_ATVI_SIMON_DOMPIERRE", level.remastertextsize );
    addcenternamedouble( &"CREDITS_ATVI_JEROME_WAUTHY", &"CREDITS_ATVI_SIMON_GRELIER", level.remastertextsize );
    addcenternamedouble( &"CREDITS_ATVI_JESSY_JANE_BACON", &"CREDITS_ATVI_SIMON_LAROCHELLE", level.remastertextsize );
    addcenternamedouble( &"CREDITS_ATVI_JIM_LEPAGE", &"CREDITS_ATVI_SIMONPIERRE_LEPAGE", level.remastertextsize );
    addcenternamedouble( &"CREDITS_ATVI_JIMMY_LABERGE", &"CREDITS_ATVI_STEPHANE_BOURQUE", level.remastertextsize );
    addcenternamedouble( &"CREDITS_ATVI_JIMMY_SAMSON", &"CREDITS_ATVI_STEPHANE_GRAVEL", level.remastertextsize );
    addcenternamedouble( &"CREDITS_ATVI_JOEY_LENZ", &"CREDITS_ATVI_STEPHANIE_LAPOINTE", level.remastertextsize );
    addcenternamedouble( &"CREDITS_ATVI_JOHANN_RIEDL", &"CREDITS_ATVI_STEVE_FORTIER", level.remastertextsize );
    addcenternamedouble( &"CREDITS_ATVI_JONATHAN_BONIN", &"CREDITS_ATVI_SYLVAIN_MOREL", level.remastertextsize );
    addcenternamedouble( &"CREDITS_ATVI_JONATHAN_COOK", &"CREDITS_ATVI_TARIQ_BELLAOUI", level.remastertextsize );
    addcenternamedouble( &"CREDITS_ATVI_JONATHAN_FOURNIER", &"CREDITS_ATVI_THOMAS_WILSON", level.remastertextsize );
    addcenternamedouble( &"CREDITS_ATVI_JONATHAN_GOSSELIN", &"CREDITS_ATVI_VINCENT_AUGER", level.remastertextsize );
    addcenternamedouble( &"CREDITS_ATVI_JONATHAN_RANCOURT", &"CREDITS_ATVI_VINCENT_BEAUREGARD", level.remastertextsize );
    addcenternamedouble( &"CREDITS_ATVI_JONATHAN_STANDRE", &"CREDITS_ATVI_VINCENT_BEDARD", level.remastertextsize );
    addcenternamedouble( &"CREDITS_ATVI_JULES_RIOUBOURGEOIS", &"CREDITS_ATVI_VINCENT_HEBERT", level.remastertextsize );
    addcenternamedouble( &"CREDITS_ATVI_JULIEN_ALLARD", &"CREDITS_ATVI_VINCENT_PAGEAU", level.remastertextsize );
    addcenternamedouble( &"CREDITS_ATVI_JULIEN_GUILLEMLESSARD", &"CREDITS_ATVI_WILLIAM_PARENTLABONTE", level.remastertextsize );
    addcenternamedouble( &"CREDITS_ATVI_KAREN_POULIN", &"CREDITS_ATVI_YANICK_PICHE", level.remastertextsize );
    addcenternamedouble( &"CREDITS_ATVI_KARIM_IDRISSI", &"CREDITS_ATVI_YANNICK_FLEURIT", level.remastertextsize );
}

inithms()
{
    addstudiospacing();
    addcenterimage( "logo_highmoon", 256, 128, 3.875 );
    addspace();
    addspace();
    addcenternamedouble( &"CREDITS_ATVI_ADAM_SHIELDS", &"CREDITS_ATVI_JARKKO_HAEKKINEN", level.remastertextsize );
    addcenternamedouble( &"CREDITS_ATVI_ANDREW_ZAFERAKIS", &"CREDITS_ATVI_JASON_FLORES", level.remastertextsize );
    addcenternamedouble( &"CREDITS_ATVI_BRIAN_JOHNSON", &"CREDITS_ATVI_MARTIN_ECKER", level.remastertextsize );
    addcenternamedouble( &"CREDITS_ATVI_BRYAN_PURDY", &"CREDITS_ATVI_MATT_TIEGER", level.remastertextsize );
    addcenternamedouble( &"CREDITS_ATVI_CHRIS_DAVIDSON", &"CREDITS_ATVI_ORLANDO_SALVATORE", level.remastertextsize );
    addcenternamedouble( &"CREDITS_ATVI_CHRISTOPHER_LIU", &"CREDITS_ATVI_PETER_DELLA_PENNA", level.remastertextsize );
    addcenternamedouble( &"CREDITS_ATVI_CHUCK_YAGER", &"CREDITS_ATVI_ROBERT_MIDLIL", level.remastertextsize );
    addcenternamedouble( &"CREDITS_ATVI_DAN_MULKIEWICZ", &"CREDITS_ATVI_SALEEM_CRAWFORD", level.remastertextsize );
    addcenternamedouble( &"CREDITS_ATVI_DAVE_CRAVENS", &"CREDITS_ATVI_SCOTT_CONNARY", level.remastertextsize );
    addcenternamedouble( &"CREDITS_ATVI_DAVID_CHRISTIE", &"CREDITS_ATVI_STEPHANE_ETIENNE", level.remastertextsize );
}

initca()
{
    addstudiospacing();
    addcenterimage( "logo_certainaffinity", 256, 128, 3.875 );
    addspace();
    addspace();
    addcenternamedouble( &"CREDITS_ATVI_ALEKSEY_SPIVAK_", &"CREDITS_ATVI_LAURA_ZIMMERMAN", level.remastertextsize );
    addcenternamedouble( &"CREDITS_ATVI_ALEX_CHRISMAN", &"CREDITS_ATVI_LAYNE_JOHNSON", level.remastertextsize );
    addcenternamedouble( &"CREDITS_ATVI_ALEX_STODOLNIK", &"CREDITS_ATVI_LEO_GONZALEZ", level.remastertextsize );
    addcenternamedouble( &"CREDITS_ATVI_ALEX_TEEBAGY", &"CREDITS_ATVI_LINCOLN_LI", level.remastertextsize );
    addcenternamedouble( &"CREDITS_ATVI_ANDREW_MORRIS", &"CREDITS_ATVI_LORI_ZAWADA", level.remastertextsize );
    addcenternamedouble( &"CREDITS_ATVI_ANTHONY_TRAHAN", &"CREDITS_ATVI_LUIZ_KRUEL", level.remastertextsize );
    addcenternamedouble( &"CREDITS_ATVI_BEN_CLOSE", &"CREDITS_ATVI_LYNDSAY_LANE", level.remastertextsize );
    addcenternamedouble( &"CREDITS_ATVI_BILL_CAMPBELL", &"CREDITS_ATVI_MARK_AHLIN", level.remastertextsize );
    addcenternamedouble( &"CREDITS_ATVI_BILL_FOX", &"CREDITS_ATVI_MARK_ANDERSON", level.remastertextsize );
    addcenternamedouble( &"CREDITS_ATVI_BRETT_ACUFF", &"CREDITS_ATVI_MARK_FLETCHER", level.remastertextsize );
    addcenternamedouble( &"CREDITS_ATVI_BRIAN_HUDSON", &"CREDITS_ATVI_MARTIN_CABLE", level.remastertextsize );
    addcenternamedouble( &"CREDITS_ATVI_BRIAN_SHIAU", &"CREDITS_ATVI_MATT_OZTALAY", level.remastertextsize );
    addcenternamedouble( &"CREDITS_ATVI_BRYAN_MOSS", &"CREDITS_ATVI_MATTHEW_DEMARAY", level.remastertextsize );
    addcenternamedouble( &"CREDITS_ATVI_BYRON_WELCH", &"CREDITS_ATVI_MATTHEW_MCCREADY", level.remastertextsize );
    addcenternamedouble( &"CREDITS_ATVI_CHARLIE_WIEDERHOLD", &"CREDITS_ATVI_MAX_EBERLEIN", level.remastertextsize );
    addcenternamedouble( &"CREDITS_ATVI_CHIHHAN_HENRY_YU", &"CREDITS_ATVI_MAX_HOBERMAN", level.remastertextsize );
    addcenternamedouble( &"CREDITS_ATVI_CHRISTIAN_GALLEGO", &"CREDITS_ATVI_MICHAEL_PAVLOVICH", level.remastertextsize );
    addcenternamedouble( &"CREDITS_ATVI_COLIN_MCINERNEY", &"CREDITS_ATVI_MICHAEL_PEDRO", level.remastertextsize );
    addcenternamedouble( &"CREDITS_ATVI_COREY_MAY", &"CREDITS_ATVI_MIKA_ROBERTSON", level.remastertextsize );
    addcenternamedouble( &"CREDITS_ATVI_DAN_SCHOLTEN", &"CREDITS_ATVI_MIKE_CLOPPER", level.remastertextsize );
    addcenternamedouble( &"CREDITS_ATVI_DANIEL_SUTTON", &"CREDITS_ATVI_MIKE_SLEGEIR", level.remastertextsize );
    addcenternamedouble( &"CREDITS_ATVI_DAVID_ANCIRA", &"CREDITS_ATVI_MJ_JOHNS", level.remastertextsize );
    addcenternamedouble( &"CREDITS_ATVI_DAVID_LOWMILLER", &"CREDITS_ATVI_MOJDEH_GHARBI", level.remastertextsize );
    addcenternamedouble( &"CREDITS_ATVI_DAVID_MERTZ", &"CREDITS_ATVI_NATHAN_MATES", level.remastertextsize );
    addcenternamedouble( &"CREDITS_ATVI_DAVID_MIDGLEY", &"CREDITS_ATVI_NEIL_DAVIS", level.remastertextsize );
    addcenternamedouble( &"CREDITS_ATVI_DEAN_MCCALL", &"CREDITS_ATVI_OGNIAN_BONEV", level.remastertextsize );
    addcenternamedouble( &"CREDITS_ATVI_DEBORAH_BECKMAN", &"CREDITS_ATVI_PATRICK_BERGMAN", level.remastertextsize );
    addcenternamedouble( &"CREDITS_ATVI_DENNIS_PORTER", &"CREDITS_ATVI_PETE_PETRAITIS", level.remastertextsize );
    addcenternamedouble( &"CREDITS_ATVI_DYLAN_JOBE", &"CREDITS_ATVI_PHIL_WATTENBARGER", level.remastertextsize );
    addcenternamedouble( &"CREDITS_ATVI_ELISABETH_BEINKESCHWARTZ", &"CREDITS_ATVI_RAMOND_TORRES", level.remastertextsize );
    addcenternamedouble( &"CREDITS_ATVI_ERIC_MILLER", &"CREDITS_ATVI_RAY_ARRIAGA", level.remastertextsize );
    addcenternamedouble( &"CREDITS_ATVI_FRANCESA_CASTELLANOS", &"CREDITS_ATVI_REBECCA_WALLACE", level.remastertextsize );
    addcenternamedouble( &"CREDITS_ATVI_GARY_BERGERON", &"CREDITS_ATVI_RICHARD_SMITH", level.remastertextsize );
    addcenternamedouble( &"CREDITS_ATVI_GEOFF_TAYLOR", &"CREDITS_ATVI_RICK_KNOX", level.remastertextsize );
    addcenternamedouble( &"CREDITS_ATVI_HYUNG_KIM", &"CREDITS_ATVI_ROBERT_WALKER", level.remastertextsize );
    addcenternamedouble( &"CREDITS_ATVI_IAN_REICHERTWATTS", &"CREDITS_ATVI_RON_LAJOIE", level.remastertextsize );
    addcenternamedouble( &"CREDITS_ATVI_IAN_VILLAMIN", &"CREDITS_ATVI_RYAN_FOX", level.remastertextsize );
    addcenternamedouble( &"CREDITS_ATVI_ISAAC_OSTER", &"CREDITS_ATVI_RYAN_MANSFIELD", level.remastertextsize );
    addcenternamedouble( &"CREDITS_ATVI_JACOB_CROW", &"CREDITS_ATVI_RYAN_RUDE", level.remastertextsize );
    addcenternamedouble( &"CREDITS_ATVI_JAMES_WAHLQUIST", &"CREDITS_ATVI_RYAN_TREADWELL", level.remastertextsize );
    addcenternamedouble( &"CREDITS_ATVI_JAN_URSCHEL", &"CREDITS_ATVI_SAMUEL_INMAN", level.remastertextsize );
    addcenternamedouble( &"CREDITS_ATVI_JASON_BORNE", &"CREDITS_ATVI_SCOTT_DOWNEY", level.remastertextsize );
    addcenternamedouble( &"CREDITS_ATVI_JASON_BRETZ", &"CREDITS_ATVI_SCOTT_LEPANEN", level.remastertextsize );
    addcenternamedouble( &"CREDITS_ATVI_JASON_HUTCHINS", &"CREDITS_ATVI_SCOTT_STEVENS", level.remastertextsize );
    addcenternamedouble( &"CREDITS_ATVI_JASON_KUCHAR", &"CREDITS_ATVI_SEOK_KI_KWON", level.remastertextsize );
    addcenternamedouble( &"CREDITS_ATVI_JEFF_TRAN", &"CREDITS_ATVI_SEOKIN_CHUNG", level.remastertextsize );
    addcenternamedouble( &"CREDITS_ATVI_JOHN_GRUBNER", &"CREDITS_ATVI_STEEV_KOBRA_KELLY", level.remastertextsize );
    addcenternamedouble( &"CREDITS_ATVI_JOHN_PAUL_EATON", &"CREDITS_ATVI_STEVE_YOUNG", level.remastertextsize );
    addcenternamedouble( &"CREDITS_ATVI_JOHN_STAMOS", &"CREDITS_ATVI_SUSAN_BOLLINGER", level.remastertextsize );
    addcenternamedouble( &"CREDITS_ATVI_JOHN_ZAGORSKI", &"CREDITS_ATVI_THOMAS_MAUER_", level.remastertextsize );
    addcenternamedouble( &"CREDITS_ATVI_JOSH_WATSON", &"CREDITS_ATVI_TOM_POTTER", level.remastertextsize );
    addcenternamedouble( &"CREDITS_ATVI_JOSH_WHITMIRE", &"CREDITS_ATVI_TONY_REYNOLDS", level.remastertextsize );
    addcenternamedouble( &"CREDITS_ATVI_JUSTIN_WALTERS", &"CREDITS_ATVI_TRAPPER_MCFERRON", level.remastertextsize );
    addcenternamedouble( &"CREDITS_ATVI_KASHA_LISHMAN", &"CREDITS_ATVI_WILL_FULLER", level.remastertextsize );
    addcenternamedouble( &"CREDITS_ATVI_KYLE_UBERMAN", &"CREDITS_ATVI_WIMOLRAT_NIKKI_TANGTIPHONGKUL", level.remastertextsize );
}

initnerve()
{
    addstudiospacing();
    addcenterimage( "logo_nerve", 256, 128, 3.875 );
    addspace();
    addspace();
    addcenternamedouble( &"CREDITS_ATVI_BRANDON_JAMES", &"CREDITS_ATVI_MASON_LUCAS", level.remastertextsize );
    addcenternamedouble( &"CREDITS_ATVI_BRYAN_CAVETT", &"CREDITS_ATVI_MICHAEL_INNIS", level.remastertextsize );
    addcenternamedouble( &"CREDITS_ATVI_CHRIS_EDMISTON", &"CREDITS_ATVI_NICHOLAS_CLARK", level.remastertextsize );
    addcenternamedouble( &"CREDITS_ATVI_CODY_HEATH", &"CREDITS_ATVI_NOE_SERRANO", level.remastertextsize );
    addcenternamedouble( &"CREDITS_ATVI_EDWARD_FERGUSON", &"CREDITS_ATVI_PHIL_WOHR", level.remastertextsize );
    addcenternamedouble( &"CREDITS_ATVI_ETHAN_MCCAUGHEY", &"CREDITS_ATVI_STEVE_MAINES", level.remastertextsize );
    addcenternamedouble( &"CREDITS_ATVI_JAMES_GRESKO", &"CREDITS_ATVI_TIM_LEWIS", level.remastertextsize );
}

initatvipart1()
{
    addstudiospacing();
    addcenterimage( "logo_activision", 256, 128, 3.875 );
    addspace();
    addspace();
    addcentertriple( &"CREDITS_ATVI_AARON_CHAMBERS", &"CREDITS_ATVI_ERIK_NIKLAS", &"CREDITS_ATVI_MICHAEL_COOK", level.remastertextsize );
    addcentertriple( &"CREDITS_ATVI_AARON_SEEDS", &"CREDITS_ATVI_ERIK_RAYMAKERS", &"CREDITS_ATVI_MICHAEL_CORNFIELD", level.remastertextsize );
    addcentertriple( &"CREDITS_ATVI_ABBY_BRINKHAUS", &"CREDITS_ATVI_ERIKA_GEORIS", &"CREDITS_ATVI_MICHAEL_DE_LA_ROSA", level.remastertextsize );
    addcentertriple( &"CREDITS_ATVI_ABDULRAHMAN_SALIH", &"CREDITS_ATVI_ERNEST_WILLIAMS", &"CREDITS_ATVI_MICHAEL_DOUGHERTY", level.remastertextsize );
    addcentertriple( &"CREDITS_ATVI_ABE_WELLUMSON", &"CREDITS_ATVI_ETHAN_KING", &"CREDITS_ATVI_MICHAEL_EDWARDS", level.remastertextsize );
    addcentertriple( &"CREDITS_ATVI_ABUBAKR_ELSAYED", &"CREDITS_ATVI_EUNHEE_SHIM", &"CREDITS_ATVI_MICHAEL_FRATTO", level.remastertextsize );
    addcentertriple( &"CREDITS_ATVI_ADAM_DAY", &"CREDITS_ATVI_EUNICE_LEE", &"CREDITS_ATVI_MICHAEL_GALLOWAY", level.remastertextsize );
    addcentertriple( &"CREDITS_ATVI_ADAM_DUBOIS", &"CREDITS_ATVI_EVA_LARA", &"CREDITS_ATVI_MICHAEL_JANTZ", level.remastertextsize );
    addcentertriple( &"CREDITS_ATVI_ADAM_DUTCHER", &"CREDITS_ATVI_EVALINA_SHIN", &"CREDITS_ATVI_MICHAEL_METZLER", level.remastertextsize );
    addcentertriple( &"CREDITS_ATVI_ADAM_PENNER", &"CREDITS_ATVI_EVAN_BING", &"CREDITS_ATVI_MICHAEL_OHALLORAN", level.remastertextsize );
    addcentertriple( &"CREDITS_ATVI_ADRIAN_DEVALLY", &"CREDITS_ATVI_EVAN_BUTTON", &"CREDITS_ATVI_MICAHEL_RUTTEN", level.remastertextsize );
    addcentertriple( &"CREDITS_ATVI_ADRIAN_OLIVER", &"CREDITS_ATVI_EVAN_HARRIS", &"CREDITS_ATVI_MICHAEL_TOMWING", level.remastertextsize );
    addcentertriple( &"CREDITS_ATVI_AIMU_KIKUCHI", &"CREDITS_ATVI_EVAN_POPE", &"CREDITS_ATVI_MICHAEL_WILLIAMS", level.remastertextsize );
    addcentertriple( &"CREDITS_ATVI_AINA_KANAHELE", &"CREDITS_ATVI_EVANDRO_GOMEZ_QUINTINO", &"CREDITS_ATVI_MICHELE_IORIO", level.remastertextsize );
    addcentertriple( &"CREDITS_ATVI_AKSELI_ASIKAINEN", &"CREDITS_ATVI_FABIAN_CHAN", &"CREDITS_ATVI_MICHELLE_DALY", level.remastertextsize );
    addcentertriple( &"CREDITS_ATVI_ALAA_ALRAMLY", &"CREDITS_ATVI_FALLON_CHRISTIAN", &"CREDITS_ATVI_MICHELLE_GALLEGO", level.remastertextsize );
    addcentertriple( &"CREDITS_ATVI_ALAN_BURKE", &"CREDITS_ATVI_FERGUS_LINDSAY", &"CREDITS_ATVI_MICHELLE_KENNEDY", level.remastertextsize );
    addcentertriple( &"CREDITS_ATVI_ALAN_HALL", &"CREDITS_ATVI_FIONA_EBBS", &"CREDITS_ATVI_MICHELLE_SCOTT", level.remastertextsize );
    addcentertriple( &"CREDITS_ATVI_ALAN_JOHNSON", &"CREDITS_ATVI_FLORENT_DUCRET", &"CREDITS_ATVI_MIGUEL_NARANJO", level.remastertextsize );
    addcentertriple( &"CREDITS_ATVI_ALAN_SENGTIANE", &"CREDITS_ATVI_FRANCES_ONEILL", &"CREDITS_ATVI_MIKE_BLESKE", level.remastertextsize );
    addcentertriple( &"CREDITS_ATVI_ALAN_WEISSBROD", &"CREDITS_ATVI_FRANCESCA_SQUELLERIO", &"CREDITS_ATVI_MIKE_DANGERFIELD", level.remastertextsize );
    addcentertriple( &"CREDITS_ATVI_ALBERT_VILLENA", &"CREDITS_ATVI_FRANCESCO_DESSOLIS", &"CREDITS_ATVI_MIKE_HUNAU", level.remastertextsize );
    addcentertriple( &"CREDITS_ATVI_ALBERT_YAO", &"CREDITS_ATVI_FRANCIS_JIMENEZ", &"CREDITS_ATVI_MIKE_MANTARRO", level.remastertextsize );
    addcentertriple( &"CREDITS_ATVI_ALBERTO_CORREA_TOSTICROCE", &"CREDITS_ATVI_FRANCISCO_BERUMEN", &"CREDITS_ATVI_MIKE_MORITZ", level.remastertextsize );
    addcentertriple( &"CREDITS_ATVI_ALEJANDRO_FERNANDEZ", &"CREDITS_ATVI_FRANCK_MORISSEAU", &"CREDITS_ATVI_MIKE_PATTERSON", level.remastertextsize );
    addcentertriple( &"CREDITS_ATVI_ALEKSANDAR_TOPUZOVIC", &"CREDITS_ATVI_FRANK_LEUSINK", &"CREDITS_ATVI_MIKE_SANDERS", level.remastertextsize );
    addcentertriple( &"CREDITS_ATVI_ALEKSANDR_FIRJANS", &"CREDITS_ATVI_FRANKIE_BRIGGS", &"CREDITS_ATVI_MIKE_TRIENIS", level.remastertextsize );
    addcentertriple( &"CREDITS_ATVI_ALEKSEJS_RADCENKO", &"CREDITS_ATVI_GABOR_PARDIKIS", &"CREDITS_ATVI_MIKE_WAND_TETLEY", level.remastertextsize );
    addcentertriple( &"CREDITS_ATVI_ALESSANDRO_CILANO", &"CREDITS_ATVI_GABRIEL_BAROTT", &"CREDITS_ATVI_MIKE_WHITTY", level.remastertextsize );
    addcentertriple( &"CREDITS_ATVI_ALEX_BAEZA", &"CREDITS_ATVI_GARETH_DAVIES", &"CREDITS_ATVI_MIKEY_VEGA", level.remastertextsize );
    addcentertriple( &"CREDITS_ATVI_ALEX_BOYD", &"CREDITS_ATVI_GARRETT_BRODIE", &"CREDITS_ATVI_MIKOLAJ_GRZEGOWSKI", level.remastertextsize );
    addcentertriple( &"CREDITS_ATVI_ALEX_DUCKERT", &"CREDITS_ATVI_GARRETT_LYNCH", &"CREDITS_ATVI_MIRANDA_HUYBERS", level.remastertextsize );
    addcentertriple( &"CREDITS_ATVI_ALEX_GOMEZ", &"CREDITS_ATVI_GARY_ALPERT", &"CREDITS_ATVI_MIRIAM_XIMIL", level.remastertextsize );
    addcentertriple( &"CREDITS_ATVI_ALEX_HARTUNG", &"CREDITS_ATVI_GARY_QUAN", &"CREDITS_ATVI_MITCHELL_MARTINMORAN", level.remastertextsize );
    addcentertriple( &"CREDITS_ATVI_ALEX_HILL", &"CREDITS_ATVI_GARY_RAFTER", &"CREDITS_ATVI_MITCHELL_MORITZ", level.remastertextsize );
    addcentertriple( &"CREDITS_ATVI_ALEX_LEMNARU", &"CREDITS_ATVI_GENE_MESSERSCHMITT", &"CREDITS_ATVI_MIZUKI_AKIYAMA", level.remastertextsize );
    addcentertriple( &"CREDITS_ATVI_ALEX_MARQUEZ", &"CREDITS_ATVI_GEOFF_HARTL", &"CREDITS_ATVI_MOLLY_HINCHEY", level.remastertextsize );
    addcentertriple( &"CREDITS_ATVI_ALEX_REICHMAN", &"CREDITS_ATVI_GEOFFREY_WILLIAMS", &"CREDITS_ATVI_MONICA_PONTRELLI", level.remastertextsize );
    addcentertriple( &"CREDITS_ATVI_ALEX_SMITH", &"CREDITS_ATVI_GEORGE_PADILLA", &"CREDITS_ATVI_MONTE_LUTZ", level.remastertextsize );
    addcentertriple( &"CREDITS_ATVI_ALEX_YUAN", &"CREDITS_ATVI_GIACOMO_CASAROTTO", &"CREDITS_ATVI_MORGAN_BRICKLEY", level.remastertextsize );
    addcentertriple( &"CREDITS_ATVI_ALEX_ZUBAREV", &"CREDITS_ATVI_GINA_HOPE", &"CREDITS_ATVI_MORRIS_RAMSEY", level.remastertextsize );
    addcentertriple( &"CREDITS_ATVI_ALEXANDER_FRANDLE", &"CREDITS_ATVI_GLEN_POWLEY", &"CREDITS_ATVI_MOUSTAFA_HASSAN", level.remastertextsize );
    addcentertriple( &"CREDITS_ATVI_ALFIO_FEDERICO_DI_PINTO", &"CREDITS_ATVI_GLENN_VISTANTE", &"CREDITS_ATVI_MYO_KYAWSWAR", level.remastertextsize );
    addcentertriple( &"CREDITS_ATVI_ALI_MILLER", &"CREDITS_ATVI_GORDON_KLOK", &"CREDITS_ATVI_NADIA_ALRAMLI", level.remastertextsize );
    addcentertriple( &"CREDITS_ATVI_ALI_TIMNAK", &"CREDITS_ATVI_GORDON_SATNIK", &"CREDITS_ATVI_NATALIE_MURRAY", level.remastertextsize );
    addcentertriple( &"CREDITS_ATVI_ALICIA_HOPSON", &"CREDITS_ATVI_GORDON_SCHNEIDER", &"CREDITS_ATVI_NATE_TYLEY", level.remastertextsize );
    addcentertriple( &"CREDITS_ATVI_ALICIA_MANDEVILLE", &"CREDITS_ATVI_GRAHAM_CAMPBELL", &"CREDITS_ATVI_NATHAN_JOHNSON", level.remastertextsize );
    addcentertriple( &"CREDITS_ATVI_ALICIA_WENDT", &"CREDITS_ATVI_GRANT_CASEY", &"CREDITS_ATVI_NATHAN_SOOS", level.remastertextsize );
    addcentertriple( &"CREDITS_ATVI_ALISON_HARMATUK", &"CREDITS_ATVI_GRANT_DAVIS", &"CREDITS_ATVI_NEIL_WALSH", level.remastertextsize );
    addcentertriple( &"CREDITS_ATVI_ALLAN_JONES", &"CREDITS_ATVI_GRAZYNA_DOMANSKA", &"CREDITS_ATVI_NEIL_YANG", level.remastertextsize );
    addcentertriple( &"CREDITS_ATVI_ALLAN_KUMKA", &"CREDITS_ATVI_GREG_RESTITUITO", &"CREDITS_ATVI_NENG_VANG", level.remastertextsize );
    addcentertriple( &"CREDITS_ATVI_ALLEN_CORONA", &"CREDITS_ATVI_GREG_SMITH", &"CREDITS_ATVI_NEVEN_DRAVINSKI", level.remastertextsize );
    addcentertriple( &"CREDITS_ATVI_ALLEN_MERT", &"CREDITS_ATVI_GREG_WILSON", &"CREDITS_ATVI_NICHOLAS_BLANCHARD", level.remastertextsize );
    addcentertriple( &"CREDITS_ATVI_ALLEN_RAUSCH", &"CREDITS_ATVI_GREGORY_MAYER", &"CREDITS_ATVI_NICK_ALBRECHT", level.remastertextsize );
    addcentertriple( &"CREDITS_ATVI_ALLEN_ZHANG", &"CREDITS_ATVI_GRIFFIN_HAUCK", &"CREDITS_ATVI_NICK_MATSON", level.remastertextsize );
    addcentertriple( &"CREDITS_ATVI_AMANDA_OKEEFFE", &"CREDITS_ATVI_GUS_KNESS", &"CREDITS_ATVI_NICK_MURTAGH", level.remastertextsize );
    addcentertriple( &"CREDITS_ATVI_AMAURY_NEDEL", &"CREDITS_ATVI_GUSTAVO_VON_QUEDNOW", &"CREDITS_ATVI_NICOLAS_DICKER", level.remastertextsize );
    addcentertriple( &"CREDITS_ATVI_AMBER_HOLMES", &"CREDITS_ATVI_GUY_PERKINS", &"CREDITS_ATVI_NICOLE_WHERLEY", level.remastertextsize );
    addcentertriple( &"CREDITS_ATVI_AMBER_HUSTED", &"CREDITS_ATVI_HAO_QI", &"CREDITS_ATVI_NIKOHLAS_THAO", level.remastertextsize );
    addcentertriple( &"CREDITS_ATVI_AMY_LONGHI", &"CREDITS_ATVI_HARRY_CORR", &"CREDITS_ATVI_NIKOLA_RADOICIC", level.remastertextsize );
    addcentertriple( &"CREDITS_ATVI_AMY_SMITH", &"CREDITS_ATVI_HAYDEN_ONODI", &"CREDITS_ATVI_NOAH_BAKER", level.remastertextsize );
    addcentertriple( &"CREDITS_ATVI_AMY_UNDERWOOD", &"CREDITS_ATVI_HEATH_JANSSON", &"CREDITS_ATVI_NOAH_SARID_", level.remastertextsize );
    addcentertriple( &"CREDITS_ATVI_ANAR_RAHIMLI", &"CREDITS_ATVI_HEATHER_POLUBINSKI", &"CREDITS_ATVI_NOAH_THOMPSON", level.remastertextsize );
    addcentertriple( &"CREDITS_ATVI_ANAS_ALMAHROUM", &"CREDITS_ATVI_HOLLY_BECKER", &"CREDITS_ATVI_NOEL_FELICIANO", level.remastertextsize );
    addcentertriple( &"CREDITS_ATVI_ANASTASIA_SEREBRENNIK", &"CREDITS_ATVI_HONG_PAN", &"CREDITS_ATVI_NOELIA_HURTADO_GOMEZ", level.remastertextsize );
    addcentertriple( &"CREDITS_ATVI_ANDER_NICKELL", &"CREDITS_ATVI_HONG_YEW", &"CREDITS_ATVI_NOLAN_RAMSDEN", level.remastertextsize );
    addcentertriple( &"CREDITS_ATVI_ANDERSON_CAHET", &"CREDITS_ATVI_HOUA_YANG", &"CREDITS_ATVI_NORMA_CRIPPEN", level.remastertextsize );
    addcentertriple( &"CREDITS_ATVI_ANDRE_CARON", &"CREDITS_ATVI_HOWARD_LU", &"CREDITS_ATVI_OGUZ_ALBAYRAK", level.remastertextsize );
    addcentertriple( &"CREDITS_ATVI_ANDRE_LOPEZ", &"CREDITS_ATVI_HUGH_DUGGAN", &"CREDITS_ATVI_OKE_MUELLER", level.remastertextsize );
    addcentertriple( &"CREDITS_ATVI_ANDRE_SACHS", &"CREDITS_ATVI_HUGH_TIETZE", &"CREDITS_ATVI_OLE_GRAAEMICHELSEN", level.remastertextsize );
    addcentertriple( &"CREDITS_ATVI_ANDREA_SARCHIELLI", &"CREDITS_ATVI_IAN_JAMES", &"CREDITS_ATVI_OLIVER_BECK", level.remastertextsize );
    addcentertriple( &"CREDITS_ATVI_ANDREW_AGNO", &"CREDITS_ATVI_IAN_KISLENGER", &"CREDITS_ATVI_OLIVER_COOK", level.remastertextsize );
    addcentertriple( &"CREDITS_ATVI_ANDREW_CHAPMAN", &"CREDITS_ATVI_IAN_MUMFORD", &"CREDITS_ATVI_OLIVER_HSIA", level.remastertextsize );
    addcentertriple( &"CREDITS_ATVI_ANDREW_DRAKE", &"CREDITS_ATVI_IGOR_MANTOVANI", &"CREDITS_ATVI_OLIVER_VOLKMANN", level.remastertextsize );
    addcentertriple( &"CREDITS_ATVI_ANDREW_HENDRICKSON", &"CREDITS_ATVI_IMRE_LEEN", &"CREDITS_ATVI_OMER_SALIK", level.remastertextsize );
    addcentertriple( &"CREDITS_ATVI_ANDREW_HOFFACKER", &"CREDITS_ATVI_INDRA_YEE", &"CREDITS_ATVI_OMI_GAO", level.remastertextsize );
    addcentertriple( &"CREDITS_ATVI_ANDREW_MITCHELL", &"CREDITS_ATVI_INDY_YIP_NGOK_LAM", &"CREDITS_ATVI_OTTO_YIU", level.remastertextsize );
    addcentertriple( &"CREDITS_ATVI_ANDREW_MORGANROTH", &"CREDITS_ATVI_INDYA_JOHNSON", &"CREDITS_ATVI_OVUNC_ALLEN_MERT", level.remastertextsize );
    addcentertriple( &"CREDITS_ATVI_ANDREW_NELSON", &"CREDITS_ATVI_INHWA_SIM", &"CREDITS_ATVI_PADRAIC_HALLINAN", level.remastertextsize );
    addcentertriple( &"CREDITS_ATVI_ANDREW_RITCHIE", &"CREDITS_ATVI_ISAAC_DUNCAN", &"CREDITS_ATVI_PAOCHOUA_YANG", level.remastertextsize );
    addcentertriple( &"CREDITS_ATVI_ANDREW_ROWE", &"CREDITS_ATVI_ISAIAH_GRAY", &"CREDITS_ATVI_PAOLA_PALERMO", level.remastertextsize );
    addcentertriple( &"CREDITS_ATVI_ANDREW_SCHERER", &"CREDITS_ATVI_JAAK_PIETERSE", &"CREDITS_ATVI_PARIYA_RAOUFI", level.remastertextsize );
    addcentertriple( &"CREDITS_ATVI_ANDREW_YU", &"CREDITS_ATVI_JACK_MARTIN", &"CREDITS_ATVI_PARSA_SHABANI", level.remastertextsize );
    addcentertriple( &"CREDITS_ATVI_ANDREY_POLYAKOV", &"CREDITS_ATVI_JACKY_CHAN", &"CREDITS_ATVI_PAT_GRIFFITH", level.remastertextsize );
    addcentertriple( &"CREDITS_ATVI_ANDY_NGUYEN", &"CREDITS_ATVI_JACOB_JOHNSON", &"CREDITS_ATVI_PAT_LYNAM", level.remastertextsize );
    addcentertriple( &"CREDITS_ATVI_ANDY_SHIN", &"CREDITS_ATVI_JAEYOUNG_CHOI", &"CREDITS_ATVI_PAT_OH", level.remastertextsize );
    addcentertriple( &"CREDITS_ATVI_ANGEL_GARCIA", &"CREDITS_ATVI_JAIME_BUELTA", &"CREDITS_ATVI_PATRICK_BARRINGTON", level.remastertextsize );
    addcentertriple( &"CREDITS_ATVI_ANGEL_RAMBOI", &"CREDITS_ATVI_JAKE_ROEDER", &"CREDITS_ATVI_PATRICK_FRIEDRICH", level.remastertextsize );
    addcentertriple( &"CREDITS_ATVI_ANN_GREALY", &"CREDITS_ATVI_JAKE_XU", &"CREDITS_ATVI_PATRICK_KELLY", level.remastertextsize );
    addcentertriple( &"CREDITS_ATVI_ANTHONINO_BUTCH_RIONDA", &"CREDITS_ATVI_JAMES_CABELNEIL", &"CREDITS_ATVI_PATRICK_RODRIGUEZ", level.remastertextsize );
    addcentertriple( &"CREDITS_ATVI_ANTHONY_BOSCO", &"CREDITS_ATVI_JAMES_CATHCART", &"CREDITS_ATVI_PAUL_BOUSTANY", level.remastertextsize );
    addcentertriple( &"CREDITS_ATVI_ANTHONY_HOBBS", &"CREDITS_ATVI_JAMES_HENNESSEY", &"CREDITS_ATVI_PAUL_BUTCHER", level.remastertextsize );
    addcentertriple( &"CREDITS_ATVI_ANTHONY_KRAFT", &"CREDITS_ATVI_JAMES_HESLIN", &"CREDITS_ATVI_PAUL_DAVIDSON", level.remastertextsize );
    addcentertriple( &"CREDITS_ATVI_ANTHONY_REDMOND", &"CREDITS_ATVI_JAMES_HOULTON", &"CREDITS_ATVI_PAUL_EDELSTEIN", level.remastertextsize );
    addcentertriple( &"CREDITS_ATVI_ANTOINE_LEPINE", &"CREDITS_ATVI_JAMES_HUMPHREY", &"CREDITS_ATVI_PAUL_HOEFGEN", level.remastertextsize );
    addcentertriple( &"CREDITS_ATVI_ANTOINE_LEVERETT", &"CREDITS_ATVI_JAMES_LODATO", &"CREDITS_ATVI_PAUL_LEE", level.remastertextsize );
    addcentertriple( &"CREDITS_ATVI_ARABELLE_HOU", &"CREDITS_ATVI_JAMES_SLAVEN", &"CREDITS_ATVI_PAUL_LOPEZ", level.remastertextsize );
    addcentertriple( &"CREDITS_ATVI_ARIANA_JEZ", &"CREDITS_ATVI_JAMES_XIONG", &"CREDITS_ATVI_PAUL_ROBINSON", level.remastertextsize );
    addcentertriple( &"CREDITS_ATVI_ARIEL_GONZALEZ", &"CREDITS_ATVI_JAMIE_SEWARD", &"CREDITS_ATVI_PAUL_VIRGIN", level.remastertextsize );
    addcentertriple( &"CREDITS_ATVI_ARON_HARTIGAN", &"CREDITS_ATVI_JAMIE_VENABLE", &"CREDITS_ATVI_PAULBAPTISTE_GARNIER", level.remastertextsize );
    addcentertriple( &"CREDITS_ATVI_ASH_MATHESON", &"CREDITS_ATVI_JAMISON_HUBER", &"CREDITS_ATVI_PEDRO_AGUILAR", level.remastertextsize );
    addcentertriple( &"CREDITS_ATVI_ASHLEY_MAIDY", &"CREDITS_ATVI_JAN_VAN_VALBURG", &"CREDITS_ATVI_PEDRO_CALCAO", level.remastertextsize );
    addcentertriple( &"CREDITS_ATVI_ASIF_AVSHALUMOV", &"CREDITS_ATVI_JANICE_FRIEDEN", &"CREDITS_ATVI_PEDRO_PULIDO", level.remastertextsize );
    addcentertriple( &"CREDITS_ATVI_AUBREY_MCCLURE", &"CREDITS_ATVI_JANNELLE_SALCIDO", &"CREDITS_ATVI_PEKKO_AHLSTEN", level.remastertextsize );
    addcentertriple( &"CREDITS_ATVI_AUSTEN_LETOURNEAU", &"CREDITS_ATVI_JARED_CASTLE", &"CREDITS_ATVI_PENG_PHA", level.remastertextsize );
    addcentertriple( &"CREDITS_ATVI_AUSTIN_LOVOLD", &"CREDITS_ATVI_JAREK_PRZYBYLOWICZ", &"CREDITS_ATVI_PERCY_PINEDA", level.remastertextsize );
    addcentertriple( &"CREDITS_ATVI_AUSTIN_RUNNING", &"CREDITS_ATVI_JASON_HAGAO_WEI", &"CREDITS_ATVI_PETER_BOWMAN", level.remastertextsize );
    addcentertriple( &"CREDITS_ATVI_AVI_VARADARAJULU", &"CREDITS_ATVI_JASON_CHAN", &"CREDITS_ATVI_PETER_DAY", level.remastertextsize );
    addcentertriple( &"CREDITS_ATVI_AYA_SHIIHARA", &"CREDITS_ATVI_JASON_CORICA", &"CREDITS_ATVI_PETER_ELSLEY", level.remastertextsize );
    addcentertriple( &"CREDITS_ATVI_AYAKA_TABE", &"CREDITS_ATVI_JASON_LEIGH", &"CREDITS_ATVI_PETER_KIESER", level.remastertextsize );
    addcentertriple( &"CREDITS_ATVI_AYOKUNIE_ONAMUSI", &"CREDITS_ATVI_JASON_LEMBCKE", &"CREDITS_ATVI_PETER_NELSON", level.remastertextsize );
    addcentertriple( &"CREDITS_ATVI_AZIZ_JANAH", &"CREDITS_ATVI_JASON_RHODE", &"CREDITS_ATVI_PETER_ROYEA", level.remastertextsize );
    addcentertriple( &"CREDITS_ATVI_BARRY_KEHOE", &"CREDITS_ATVI_JASON_YOU", &"CREDITS_ATVI_PHARABA_HACKERWITT", level.remastertextsize );
    addcentertriple( &"CREDITS_ATVI_BARUD_TESFAYE", &"CREDITS_ATVI_JAVIER_FERNANDEZ_CORDOBA", &"CREDITS_ATVI_PHIL_HOFMAN", level.remastertextsize );
    addcentertriple( &"CREDITS_ATVI_BEN_BRUNS", &"CREDITS_ATVI_JAVIER_SASTRE", &"CREDITS_ATVI_PHIL_KECK", level.remastertextsize );
    addcentertriple( &"CREDITS_ATVI_BEN_GOYETTE", &"CREDITS_ATVI_JC_ZHANG", &"CREDITS_ATVI_PHIL_TERZIAN", level.remastertextsize );
    addcentertriple( &"CREDITS_ATVI_BEN_NICHOLS", &"CREDITS_ATVI_JEDIDIAH_KIMMONS", &"CREDITS_ATVI_PHILIP_EARL", level.remastertextsize );
    addcentertriple( &"CREDITS_ATVI_BEN_PERRY", &"CREDITS_ATVI_JEFF_PARKER", &"CREDITS_ATVI_PHILIPPE_PAQUET", level.remastertextsize );
    addcentertriple( &"CREDITS_ATVI_BEN_STRAGNELL", &"CREDITS_ATVI_JEFF_ROPER", &"CREDITS_ATVI_PRYIA_RAMJEE", level.remastertextsize );
    addcentertriple( &"CREDITS_ATVI_BEN_WATSON", &"CREDITS_ATVI_JEFF_WARD", &"CREDITS_ATVI_QUINTEN_BUI", level.remastertextsize );
    addcentertriple( &"CREDITS_ATVI_BENNETT_CUDAHY", &"CREDITS_ATVI_JEFFREY_DONALD_MOONEY", &"CREDITS_ATVI_RACHAEL_GRANT", level.remastertextsize );
    addcentertriple( &"CREDITS_ATVI_BENOIT_LEMARECHAL", &"CREDITS_ATVI_JEFFREY_SHIEH", &"CREDITS_ATVI_RACHEL_HOLLAND", level.remastertextsize );
    addcentertriple( &"CREDITS_ATVI_BENOIT_PIRET", &"CREDITS_ATVI_JEN_SULLIVAN", &"CREDITS_ATVI_RACHEL_NEWMAN_", level.remastertextsize );
    addcentertriple( &"CREDITS_ATVI_BERNADETTE_BENAVENTE", &"CREDITS_ATVI_JENNIFER_HOWELL", &"CREDITS_ATVI_RAFIK_BISHARA", level.remastertextsize );
    addcentertriple( &"CREDITS_ATVI_BLAKE_PREVEL", &"CREDITS_ATVI_JENNIFER_KALINOWSKI", &"CREDITS_ATVI_RALPH_HUNTER", level.remastertextsize );
    addcentertriple( &"CREDITS_ATVI_BOB_WHARTON", &"CREDITS_ATVI_JENNIFER_MALDONADO", &"CREDITS_ATVI_RANDY_DE_RAMA", level.remastertextsize );
    addcentertriple( &"CREDITS_ATVI_BOBBIE_MOUA", &"CREDITS_ATVI_JENNIFER_MALLETT", &"CREDITS_ATVI_RAPHAEL_THEBERGE", level.remastertextsize );
    addcentertriple( &"CREDITS_ATVI_BOBBY_KOTICK", &"CREDITS_ATVI_JENNIFER_VELAZQUEZ", &"CREDITS_ATVI_RASHID_BHAMJEE", level.remastertextsize );
    addcentertriple( &"CREDITS_ATVI_BOKYUNG_UM", &"CREDITS_ATVI_JENNY_TYLEY", &"CREDITS_ATVI_RAY_BRIGHAM", level.remastertextsize );
    addcentertriple( &"CREDITS_ATVI_BOTI_BERES", &"CREDITS_ATVI_JEREMIAH_LUEBKE", &"CREDITS_ATVI_REBECCA_YATES", level.remastertextsize );
    addcentertriple( &"CREDITS_ATVI_BOWEN_ZHAO", &"CREDITS_ATVI_JEREMY_ANDERSON", &"CREDITS_ATVI_REI_LIOU", level.remastertextsize );
    addcentertriple( &"CREDITS_ATVI_BRAD_KUSY", &"CREDITS_ATVI_JEREMY_DUPIRE", &"CREDITS_ATVI_RENSHAN_CHANG", level.remastertextsize );
    addcentertriple( &"CREDITS_ATVI_BRAD_SAAVEDRA", &"CREDITS_ATVI_JEREMY_KASENO", &"CREDITS_ATVI_RICARDO_ROMERO", level.remastertextsize );
    addcentertriple( &"CREDITS_ATVI_BRANDON_CEDERHOLM", &"CREDITS_ATVI_JEREMY_LEVI", &"CREDITS_ATVI_RICH_ELMORE", level.remastertextsize );
    addcentertriple( &"CREDITS_ATVI_BRANDON_HASLACH", &"CREDITS_ATVI_JEREMY_REIMER", &"CREDITS_ATVI_RICHARD_DELANEY", level.remastertextsize );
    addcentertriple( &"CREDITS_ATVI_BRANDON_HEDICAN", &"CREDITS_ATVI_JEROD_PARTIN", &"CREDITS_ATVI_RICHARD_LUBELL", level.remastertextsize );
    addcentertriple( &"CREDITS_ATVI_BRANDON_MADER", &"CREDITS_ATVI_JESSE_ETZLER", &"CREDITS_ATVI_RICHARD_TOM", level.remastertextsize );
    addcentertriple( &"CREDITS_ATVI_BRANDON_RUSS", &"CREDITS_ATVI_JESSICA_ALCARAZ", &"CREDITS_ATVI_ROB_HEINISCH", level.remastertextsize );
    addcentertriple( &"CREDITS_ATVI_BRANDON_SCHEBLER", &"CREDITS_ATVI_JESUS_ROSALES", &"CREDITS_ATVI_ROB_SCHONFELD", level.remastertextsize );
    addcentertriple( &"CREDITS_ATVI_BRANDON_ZIEN", &"CREDITS_ATVI_JI_HUN_LEE", &"CREDITS_ATVI_ROBERT_GRIFFIN", level.remastertextsize );
    addcentertriple( &"CREDITS_ATVI_BRENDAN_DILLON", &"CREDITS_ATVI_JIM_TILANDER", &"CREDITS_ATVI_ROBERT_KEIGHTLEY", level.remastertextsize );
    addcentertriple( &"CREDITS_ATVI_BRENDAN_FIELDS", &"CREDITS_ATVI_JO_SHELDON", &"CREDITS_ATVI_ROBERT_KIKABHAI", level.remastertextsize );
    addcentertriple( &"CREDITS_ATVI_BRENT_RUBY", &"CREDITS_ATVI_JOAO_VICTOR_QUEIROZ_BRASILIENSE", &"CREDITS_ATVI_ROBERT_KOSTICH", level.remastertextsize );
    addcentertriple( &"CREDITS_ATVI_BRETT_BROWN", &"CREDITS_ATVI_JOE_BRUNA", &"CREDITS_ATVI_ROBERT_SCHRADER", level.remastertextsize );
    addcentertriple( &"CREDITS_ATVI_BRETT_SCHANZENBACH", &"CREDITS_ATVI_JOEL_NELSON", &"CREDITS_ATVI_ROBERT_TAYLOR", level.remastertextsize );
    addcentertriple( &"CREDITS_ATVI_BRIAN_BENNETT", &"CREDITS_ATVI_JOEY_DERRICO", &"CREDITS_ATVI_ROBERT_WHARTON", level.remastertextsize );
    addcentertriple( &"CREDITS_ATVI_BRIAN_BENSI", &"CREDITS_ATVI_JOEY_SMITS", &"CREDITS_ATVI_ROBERTO_NABOR", level.remastertextsize );
    addcentertriple( &"CREDITS_ATVI_BRIAN_BOLLES", &"CREDITS_ATVI_JOHN_ALLEN", &"CREDITS_ATVI_RODRIGO_RODRIGUES", level.remastertextsize );
    addcentertriple( &"CREDITS_ATVI_BRIAN_EHRICH", &"CREDITS_ATVI_JOHN_BOJORQUEZ", &"CREDITS_ATVI_ROHIT_DHOLAKIA", level.remastertextsize );
    addcentertriple( &"CREDITS_ATVI_BRIAN_FELDSTEIN", &"CREDITS_ATVI_JOHN_HAMILL", &"CREDITS_ATVI_ROMALICE_SHAVERS", level.remastertextsize );
    addcentertriple( &"CREDITS_ATVI_BRIAN_HODOUS", &"CREDITS_ATVI_JOHN_KIRK", &"CREDITS_ATVI_RONNIE_LOU", level.remastertextsize );
    addcentertriple( &"CREDITS_ATVI_BRIAN_LUEVANO", &"CREDITS_ATVI_JOHN_WANG", &"CREDITS_ATVI_RONNO_HOLTSLAG", level.remastertextsize );
    addcentertriple( &"CREDITS_ATVI_BRIAN_MAZUROWSKI", &"CREDITS_ATVI_JOHN_YANG", &"CREDITS_ATVI_ROSSANA_TORRES", level.remastertextsize );
    addcentertriple( &"CREDITS_ATVI_BRIAN_MCCARTHY", &"CREDITS_ATVI_JON_BECKER", &"CREDITS_ATVI_RUAIDHRI_POWER", level.remastertextsize );
    addcentertriple( &"CREDITS_ATVI_BRIAN_STOLZ", &"CREDITS_ATVI_JON_BOWERS", &"CREDITS_ATVI_RUBEN_SILVA", level.remastertextsize );
    addcentertriple( &"CREDITS_ATVI_BRIAN_STRUMPF", &"CREDITS_ATVI_JON_ESCOBEDO", &"CREDITS_ATVI_RUI_JIANG", level.remastertextsize );
    addcentertriple( &"CREDITS_ATVI_BRIANNA_MARTIN", &"CREDITS_ATVI_JON_ESTANISLAO", &"CREDITS_ATVI_RUSS_MELANSON", level.remastertextsize );
    addcentertriple( &"CREDITS_ATVI_BRITNI_PUCCIO", &"CREDITS_ATVI_JONATHAN_BUTCHER", &"CREDITS_ATVI_RUTH_BERENJI", level.remastertextsize );
    addcentertriple( &"CREDITS_ATVI_BRITTANY_FRAZIER", &"CREDITS_ATVI_JONATHAN_DELEON", &"CREDITS_ATVI_RUTH_MURPHY", level.remastertextsize );
    addcentertriple( &"CREDITS_ATVI_BRUNO_CORDIERO", &"CREDITS_ATVI_JONATHAN_MURNANE", &"CREDITS_ATVI_RYAN_ANDERSON", level.remastertextsize );
    addcentertriple( &"CREDITS_ATVI_BRYAN_ANDERSON", &"CREDITS_ATVI_JORDAN_SMITH", &"CREDITS_ATVI_RYAN_CHAU", level.remastertextsize );
    addcentertriple( &"CREDITS_ATVI_BRYCE_PRITCHETT", &"CREDITS_ATVI_JORDAN_TAEKEMA", &"CREDITS_ATVI_RYAN_FORD", level.remastertextsize );
    addcentertriple( &"CREDITS_ATVI_BYRON_BEEDE", &"CREDITS_ATVI_JORGE_JIMENEZ", &"CREDITS_ATVI_RYAN_INWARDS", level.remastertextsize );
    addcentertriple( &"CREDITS_ATVI_BYRON_PILE", &"CREDITS_ATVI_JORIS_DE_HAER", &"CREDITS_ATVI_RYAN_KING", level.remastertextsize );
    addcentertriple( &"CREDITS_ATVI_CAMERON_CHAPMAN", &"CREDITS_ATVI_JOSEF_WILSON", &"CREDITS_ATVI_RYAN_RIGGS", level.remastertextsize );
    addcentertriple( &"CREDITS_ATVI_CARL_HUGHES", &"CREDITS_ATVI_JOSEPH_CORCORAN", &"CREDITS_ATVI_RYAN_STURZENBECHER", level.remastertextsize );
    addcentertriple( &"CREDITS_ATVI_CARL_JOHNSON", &"CREDITS_ATVI_JOSEPH_FREEMAN", &"CREDITS_ATVI_SALAH_KHALIL", level.remastertextsize );
    addcentertriple( &"CREDITS_ATVI_CARL_LEHMANN", &"CREDITS_ATVI_JOSEPH_KAM", &"CREDITS_ATVI_SALOME_VILLARRUEL", level.remastertextsize );
    addcentertriple( &"CREDITS_ATVI_CARLOS_GARCIA", &"CREDITS_ATVI_JOSEPH_MATHESON", &"CREDITS_ATVI_SAM_COOPER", level.remastertextsize );
    addcentertriple( &"CREDITS_ATVI_CARLOS_POSSE", &"CREDITS_ATVI_JOSEPH_ROEHRIG", &"CREDITS_ATVI_SAM_WINOTAI", level.remastertextsize );
    addcentertriple( &"CREDITS_ATVI_CAROLINE_MCNIEL", &"CREDITS_ATVI_JOSH_BRIDGE", &"CREDITS_ATVI_SAMI_ELTAIB", level.remastertextsize );
    addcentertriple( &"CREDITS_ATVI_CAROLINE_OGAWA", &"CREDITS_ATVI_JOSH_CAMPBELL", &"CREDITS_ATVI_SANG_KIM", level.remastertextsize );
    addcentertriple( &"CREDITS_ATVI_CAROLYN_WANG", &"CREDITS_ATVI_JOSH_HEMANN", &"CREDITS_ATVI_SANJAY_THIMMARAYAPPA", level.remastertextsize );
    addcentertriple( &"CREDITS_ATVI_CASEY_KWOCK", &"CREDITS_ATVI_JOSH_MENKE", &"CREDITS_ATVI_SASHA_REBECCA", level.remastertextsize );
    addcentertriple( &"CREDITS_ATVI_CATALINA_CICIOIU", &"CREDITS_ATVI_JOSH_NEGRIN", &"CREDITS_ATVI_SAVIK_FRAGUELA", level.remastertextsize );
    addcentertriple( &"CREDITS_ATVI_CATHAL_OHALLORAN", &"CREDITS_ATVI_JOSH_PLOUFFE", &"CREDITS_ATVI_SCHAEFFER_OLSON", level.remastertextsize );
    addcentertriple( &"CREDITS_ATVI_CATHERINE_GAVIN", &"CREDITS_ATVI_JOSHUA_GLASSMAN", &"CREDITS_ATVI_SCOTT_CUTLER", level.remastertextsize );
    addcentertriple( &"CREDITS_ATVI_CATHERINE_MCCARTHY", &"CREDITS_ATVI_JOSHUA_SELINGER", &"CREDITS_ATVI_SCOTT_HOLLAND", level.remastertextsize );
    addcentertriple( &"CREDITS_ATVI_CAYLIN_PETERSON", &"CREDITS_ATVI_JOSHUA_STRANZ", &"CREDITS_ATVI_SCOTT_MURATA", level.remastertextsize );
    addcentertriple( &"CREDITS_ATVI_CHAD_SCHMIDT", &"CREDITS_ATVI_JOSHUA_TAUB", &"CREDITS_ATVI_SCOTT_TOBIAS", level.remastertextsize );
    addcentertriple( &"CREDITS_ATVI_CHARLES_VINSON", &"CREDITS_ATVI_JOSHUA_THAO", &"CREDITS_ATVI_SEAN_CARGLE", level.remastertextsize );
    addcentertriple( &"CREDITS_ATVI_CHARLIE_MURPHY", &"CREDITS_ATVI_JOYCE_WU", &"CREDITS_ATVI_SEAN_DAILY", level.remastertextsize );
    addcentertriple( &"CREDITS_ATVI_CHASE_VIGAR", &"CREDITS_ATVI_JUAN_SARRIA", &"CREDITS_ATVI_SEAN_DARTER", level.remastertextsize );
    addcentertriple( &"CREDITS_ATVI_CHETAN_DESAI", &"CREDITS_ATVI_JUSTIN_DELGADO", &"CREDITS_ATVI_SEAN_DEXHEIMER", level.remastertextsize );
    addcentertriple( &"CREDITS_ATVI_CHEUNAO_VANG", &"CREDITS_ATVI_JUSTIN_GUTHRIE", &"CREDITS_ATVI_SEAN_FENG", level.remastertextsize );
    addcentertriple( &"CREDITS_ATVI_CHEYENNE_CABALLERO", &"CREDITS_ATVI_JUSTIN_MANFREDI", &"CREDITS_ATVI_SEAN_JOHNSON", level.remastertextsize );
    addcentertriple( &"CREDITS_ATVI_CHIHARU_TSUTSUI", &"CREDITS_ATVI_JUSTIN_MCFARLAND", &"CREDITS_ATVI_SEAN_OSULLIVAN", level.remastertextsize );
    addcentertriple( &"CREDITS_ATVI_CHONG_XIONG", &"CREDITS_ATVI_JUSTIN_SHACKLETTE", &"CREDITS_ATVI_SEOHYUN_CHO", level.remastertextsize );
    addcentertriple( &"CREDITS_ATVI_CHONGYANG_MA", &"CREDITS_ATVI_JUSTIN_SHEARER", &"CREDITS_ATVI_SERBAN_PETRE", level.remastertextsize );
    addcentertriple( &"CREDITS_ATVI_CHRIS_ARENDS", &"CREDITS_ATVI_JUSTIN_WESTPLATE", &"CREDITS_ATVI_SERGEI_ACUNA", level.remastertextsize );
    addcentertriple( &"CREDITS_ATVI_CHRIS_CARTWRIGHT", &"CREDITS_ATVI_JUSTIN_WOOD", &"CREDITS_ATVI_SERGII_MIKHTONIUK", level.remastertextsize );
    addcentertriple( &"CREDITS_ATVI_CHRIS_KIMBERLEY", &"CREDITS_ATVI_JUSTIN_XIONG", &"CREDITS_ATVI_SERGIO_DOSTE_BELTRAN", level.remastertextsize );
    addcentertriple( &"CREDITS_ATVI_CHRIS_REYNOLDS", &"CREDITS_ATVI_KAI_HSU", &"CREDITS_ATVI_SETH_COLEMAN", level.remastertextsize );
    addcentertriple( &"CREDITS_ATVI_CHRIS_SCAGLIONE", &"CREDITS_ATVI_KALE_STEDMAN", &"CREDITS_ATVI_SHAHAB_NAZEMI", level.remastertextsize );
    addcentertriple( &"CREDITS_ATVI_CHRIS_SCHNAKENBERG", &"CREDITS_ATVI_KAP_KANG", &"CREDITS_ATVI_SHANE_GAST", level.remastertextsize );
    addcentertriple( &"CREDITS_ATVI_CHRIS_WALTHER", &"CREDITS_ATVI_KAREN_SEGAWA", &"CREDITS_ATVI_SHANE_NEEDHAM", level.remastertextsize );
    addcentertriple( &"CREDITS_ATVI_CHRISTER_ERICSON", &"CREDITS_ATVI_KAREN_STARR", &"CREDITS_ATVI_SHANNON_CROSS", level.remastertextsize );
    addcentertriple( &"CREDITS_ATVI_CHRISTIAN_AARSRUD", &"CREDITS_ATVI_KAREN_YI", &"CREDITS_ATVI_SHANNON_GALLOWAY", level.remastertextsize );
    addcentertriple( &"CREDITS_ATVI_CHRISTIAN_AVILA", &"CREDITS_ATVI_KARI_HISCOX", &"CREDITS_ATVI_SHAUN_DUNNE", level.remastertextsize );
    addcentertriple( &"CREDITS_ATVI_CHRISTIAN_KIM", &"CREDITS_ATVI_KARL_GERMYN", &"CREDITS_ATVI_SHAWN_BELEW", level.remastertextsize );
    addcentertriple( &"CREDITS_ATVI_CHRISTIAN_MOLBACK", &"CREDITS_ATVI_KASTURI_DEY_HOSTA", &"CREDITS_ATVI_SHAWN_MALONY", level.remastertextsize );
    addcentertriple( &"CREDITS_ATVI_CHRISTIAN_WIDMER", &"CREDITS_ATVI_KATE_OGOSTA", &"CREDITS_ATVI_SHAWN_TAGSETH", level.remastertextsize );
    addcentertriple( &"CREDITS_ATVI_CHRISTIE_WILSON", &"CREDITS_ATVI_KATE_PANKRATZ", &"CREDITS_ATVI_SHELBY_MICKLOS", level.remastertextsize );
    addcentertriple( &"CREDITS_ATVI_CHRISTINA_BUTED", &"CREDITS_ATVI_KATE_ZIEGLER", &"CREDITS_ATVI_SHENGYUAN_CHRIS_CHUANG", level.remastertextsize );
    addcentertriple( &"CREDITS_ATVI_CHRISTINA_ZHANG", &"CREDITS_ATVI_KATHERINE_HARPER", &"CREDITS_ATVI_SHI_SHENYU", level.remastertextsize );
    addcentertriple( &"CREDITS_ATVI_CHRISTOPHE_COLLANGE", &"CREDITS_ATVI_KATHLEEN_OROURKE", &"CREDITS_ATVI_SHUN_MIZUTANI", level.remastertextsize );
    addcentertriple( &"CREDITS_ATVI_CHRISTOPHER_BRUENS", &"CREDITS_ATVI_KEEGAN_KNUDSON", &"CREDITS_ATVI_SIAN_CLARKE", level.remastertextsize );
    addcentertriple( &"CREDITS_ATVI_CHRISTOPHER_BUGNYLEROY", &"CREDITS_ATVI_KEITH_HAMMONS", &"CREDITS_ATVI_SIDD_RAMANUJ", level.remastertextsize );
    addcentertriple( &"CREDITS_ATVI_CHRISTOPHER_COSBY", &"CREDITS_ATVI_KELLY_SCHWARMHOUGHTON", &"CREDITS_ATVI_SIMON_VUE", level.remastertextsize );
    addcentertriple( &"CREDITS_ATVI_CHRISTOPHER_EADS", &"CREDITS_ATVI_KELVIN_LIU", &"CREDITS_ATVI_SIMON_WOLFE", level.remastertextsize );
    addcentertriple( &"CREDITS_ATVI_CHRISTOPHER_ELLIS", &"CREDITS_ATVI_KENNETH_AMAYA", &"CREDITS_ATVI_SIMONE_DEOCARESLENGYEL", level.remastertextsize );
    addcentertriple( &"CREDITS_ATVI_CHRISTOPHER_MCKNIGHT", &"CREDITS_ATVI_KENNETH_OFARRELL", &"CREDITS_ATVI_SINEAD_DEVEREUX", level.remastertextsize );
    addcentertriple( &"CREDITS_ATVI_CHRISTOPHER_SMITH", &"CREDITS_ATVI_KENNETH_TANAKA", &"CREDITS_ATVI_SPENCER_STIRLING", level.remastertextsize );
    addcentertriple( &"CREDITS_ATVI_CHRISTOPHER_TAYLOR", &"CREDITS_ATVI_KEVIN_CHESTER", &"CREDITS_ATVI_STEFAN_JONSSON", level.remastertextsize );
    addcentertriple( &"CREDITS_ATVI_CHRISTOPHER_WILSON", &"CREDITS_ATVI_KEVIN_FLYNN", &"CREDITS_ATVI_STEFAN_TJARKS", level.remastertextsize );
    addcentertriple( &"CREDITS_ATVI_CIPRIAN_CASCAVAL", &"CREDITS_ATVI_KEVIN_FRYERS", &"CREDITS_ATVI_STEFANIA_VANERIO", level.remastertextsize );
    addcentertriple( &"CREDITS_ATVI_CLADIU_TOPRICEANU", &"CREDITS_ATVI_KEVIN_HENDRICKSON", &"CREDITS_ATVI_STEPHANE_DUDZINSKI", level.remastertextsize );
    addcentertriple( &"CREDITS_ATVI_CLAUDIA_OKADA", &"CREDITS_ATVI_KEVIN_HENNESSY", &"CREDITS_ATVI_STEPHANIE_MILLER", level.remastertextsize );
    addcentertriple( &"CREDITS_ATVI_CLIVINS_DANTUS", &"CREDITS_ATVI_KEVIN_HIM", &"CREDITS_ATVI_STEPHEN_IMAMURA", level.remastertextsize );
    addcentertriple( &"CREDITS_ATVI_CODDY_JOHNSON", &"CREDITS_ATVI_KEVIN_JACKSON", &"CREDITS_ATVI_STEPHEN_MARKS", level.remastertextsize );
    addcentertriple( &"CREDITS_ATVI_CODY_ERICKSON", &"CREDITS_ATVI_KEVIN_JAMIESON", &"CREDITS_ATVI_STEPHEN_OSULLIVAN", level.remastertextsize );
    addcentertriple( &"CREDITS_ATVI_COLEMAN_PALM", &"CREDITS_ATVI_KEVIN_OSULLIVAN", &"CREDITS_ATVI_STEPHEN_RYAN", level.remastertextsize );
    addcentertriple( &"CREDITS_ATVI_COLIN_CASHIN", &"CREDITS_ATVI_KEVIN_PETERSON", &"CREDITS_ATVI_STERLING_HOEREE", level.remastertextsize );
    addcentertriple( &"CREDITS_ATVI_COLIN_COX", &"CREDITS_ATVI_KEVIN_VAN_SLOUN", &"CREDITS_ATVI_STEVE_ISOM", level.remastertextsize );
    addcentertriple( &"CREDITS_ATVI_COLIN_DEASY", &"CREDITS_ATVI_KEVIN_WATANA", &"CREDITS_ATVI_STEVE_LANG", level.remastertextsize );
    addcentertriple( &"CREDITS_ATVI_COLIN_KAWAKAMI", &"CREDITS_ATVI_KHALID_ASHER", &"CREDITS_ATVI_STEVE_PEARCE", level.remastertextsize );
    addcentertriple( &"CREDITS_ATVI_COLTON_DAWS", &"CREDITS_ATVI_KIMBERLY_CARRASCO", &"CREDITS_ATVI_STEVEN_EEAREAST", level.remastertextsize );
    addcentertriple( &"CREDITS_ATVI_CONNOR_GERDES", &"CREDITS_ATVI_KIRILL_VASSILJEV", &"CREDITS_ATVI_STEVEN_ERENST", level.remastertextsize );
    addcentertriple( &"CREDITS_ATVI_CONNOR_HAUCK", &"CREDITS_ATVI_KIRK_BILLINGS", &"CREDITS_ATVI_STEVEN_MENDOZA", level.remastertextsize );
    addcentertriple( &"CREDITS_ATVI_CONNOR_MURPHY", &"CREDITS_ATVI_KOLBY_ROWEN", &"CREDITS_ATVI_STEVEN_YOUNG", level.remastertextsize );
    addcentertriple( &"CREDITS_ATVI_CONOR_CONROY", &"CREDITS_ATVI_KORI_OROZCO", &"CREDITS_ATVI_SUBEOB_SO", level.remastertextsize );
    addcentertriple( &"CREDITS_ATVI_CONOR_HARLOW", &"CREDITS_ATVI_KRIS_MORKEN", &"CREDITS_ATVI_SUNG_YOO", level.remastertextsize );
    addcentertriple( &"CREDITS_ATVI_CONOR_STEPHENS", &"CREDITS_ATVI_KRZYSZTOF_KLAJA", &"CREDITS_ATVI_SUZANNE_BOYLAN", level.remastertextsize );
    addcentertriple( &"CREDITS_ATVI_CONSTANTIN_CATALIN_IGNAT", &"CREDITS_ATVI_KUIYING_MENG", &"CREDITS_ATVI_TACO_ELVERDING", level.remastertextsize );
    addcentertriple( &"CREDITS_ATVI_CORMAC_BLACKWELL", &"CREDITS_ATVI_KYLE_BERGMAN", &"CREDITS_ATVI_TANNER_ZIGRANG", level.remastertextsize );
    addcentertriple( &"CREDITS_ATVI_CORY_MULLEN", &"CREDITS_ATVI_KYLE_DIEKER", &"CREDITS_ATVI_TAO_SU", level.remastertextsize );
    addcentertriple( &"CREDITS_ATVI_CRAIG_DUFF", &"CREDITS_ATVI_KYLE_KLEVEN", &"CREDITS_ATVI_TARAN_BURKE", level.remastertextsize );
    addcentertriple( &"CREDITS_ATVI_CRAIG_OBOYLE", &"CREDITS_ATVI_KYLE_MESSERLI", &"CREDITS_ATVI_TARYN_HUTT", level.remastertextsize );
    addcentertriple( &"CREDITS_ATVI_CRAIG_WHITE", &"CREDITS_ATVI_KYLE_WALKER", &"CREDITS_ATVI_TATIANA_MIWA_ARIAS", level.remastertextsize );
    addcentertriple( &"CREDITS_ATVI_CRECEN_CARR", &"CREDITS_ATVI_LAETITIA_MEJASSON", &"CREDITS_ATVI_TCHALLA_JACKSON", level.remastertextsize );
    addcentertriple( &"CREDITS_ATVI_DAKOTA_GANGLOFF", &"CREDITS_ATVI_LARUE_CONLEY", &"CREDITS_ATVI_TEDDY_HWANG", level.remastertextsize );
    addcentertriple( &"CREDITS_ATVI_DAMIEN_MARSHALL", &"CREDITS_ATVI_LAURA_CATALA_GRIMALT", &"CREDITS_ATVI_TENDAYI_MAWUSHE", level.remastertextsize );
    addcentertriple( &"CREDITS_ATVI_DAN_VO", &"CREDITS_ATVI_LAURA_SIFFERLE", &"CREDITS_ATVI_TERRI_DURHAM", level.remastertextsize );
    addcentertriple( &"CREDITS_ATVI_DAN_WRIGHT", &"CREDITS_ATVI_LEAH_BOLIN", &"CREDITS_ATVI_TERY_KIEL", level.remastertextsize );
    addcentertriple( &"CREDITS_ATVI_DANIEL_ANGERS", &"CREDITS_ATVI_LEE_GODFREY", &"CREDITS_ATVI_THIAGO_SOTTO_DE_BRITO", level.remastertextsize );
    addcentertriple( &"CREDITS_ATVI_DANIEL_COBBAN", &"CREDITS_ATVI_LEWIS_BLACK", &"CREDITS_ATVI_THIEN_NGUYEN", level.remastertextsize );
    addcentertriple( &"CREDITS_ATVI_DANIEL_FLORES", &"CREDITS_ATVI_LEWIS_WILLIAMS", &"CREDITS_ATVI_THOMAS_NUSSBAUMER", level.remastertextsize );
    addcentertriple( &"CREDITS_ATVI_DANIEL_GREEN", &"CREDITS_ATVI_LIAM_MACINNES", &"CREDITS_ATVI_THOMAS_PIERSON", level.remastertextsize );
    addcentertriple( &"CREDITS_ATVI_DANIEL_KUNSMAN", &"CREDITS_ATVI_LIBAN_EGAL", &"CREDITS_ATVI_THOMAS_SHAW", level.remastertextsize );
    addcentertriple( &"CREDITS_ATVI_DANIEL_LIN", &"CREDITS_ATVI_LINDSAY_FRIEDMAN", &"CREDITS_ATVI_THOMAS_TIPPL", level.remastertextsize );
    addcentertriple( &"CREDITS_ATVI_DANIEL_PEZELY", &"CREDITS_ATVI_LIP_HO", &"CREDITS_ATVI_TIM_CZERNIAK", level.remastertextsize );
    addcentertriple( &"CREDITS_ATVI_DANIEL_SUAREZ", &"CREDITS_ATVI_LISA_REILLY", &"CREDITS_ATVI_TIM_LION", level.remastertextsize );
    addcentertriple( &"CREDITS_ATVI_DANIEL_VOGT", &"CREDITS_ATVI_LOGAN_ROGERS", &"CREDITS_ATVI_TIM_RONDEAU", level.remastertextsize );
    addcentertriple( &"CREDITS_ATVI_DARA_PRICE", &"CREDITS_ATVI_LOUIS_BLACKWELL", &"CREDITS_ATVI_TIM_TSCHIRNER", level.remastertextsize );
    addcentertriple( &"CREDITS_ATVI_DARASAVANH_NAVASAK", &"CREDITS_ATVI_LUCY_ANDONIAN", &"CREDITS_ATVI_TIMOTHY_ELLIS", level.remastertextsize );
    addcentertriple( &"CREDITS_ATVI_DARRELL_GALLAGHER", &"CREDITS_ATVI_LUIS_ARNIELLA", &"CREDITS_ATVI_TIMOTHY_FINK", level.remastertextsize );
    addcentertriple( &"CREDITS_ATVI_DAVE_JOHNSON", &"CREDITS_ATVI_LUIS_FLORES", &"CREDITS_ATVI_TIMOTHY_SEREN", level.remastertextsize );
    addcentertriple( &"CREDITS_ATVI_DAVID_ALCAIDE", &"CREDITS_ATVI_LUKE_HARRISON", &"CREDITS_ATVI_TODD_HARVEY", level.remastertextsize );
    addcentertriple( &"CREDITS_ATVI_DAVID_BALLANO_FERNANDEZ", &"CREDITS_ATVI_LUKE_MACKAY", &"CREDITS_ATVI_TODD_KONG", level.remastertextsize );
    addcentertriple( &"CREDITS_ATVI_DAVID_BLASER", &"CREDITS_ATVI_LUKE_TONNE", &"CREDITS_ATVI_TODD_MUELLER", level.remastertextsize );
    addcentertriple( &"CREDITS_ATVI_DAVID_BULLAT", &"CREDITS_ATVI_LYNN_BALLEW", &"CREDITS_ATVI_TODD_PRUYN", level.remastertextsize );
    addcentertriple( &"CREDITS_ATVI_DAVID_COLLINS", &"CREDITS_ATVI_LYNNE_FISHER", &"CREDITS_ATVI_TODD_SZALLA", level.remastertextsize );
    addcentertriple( &"CREDITS_ATVI_DAVID_COOPER", &"CREDITS_ATVI_MACIEJ_ANCZURA", &"CREDITS_ATVI_TOM_DRYER", level.remastertextsize );
    addcentertriple( &"CREDITS_ATVI_DAVID_CUSHMAN", &"CREDITS_ATVI_MAHDI_TAYARANI_NAJARAN", &"CREDITS_ATVI_TOM_FLYNN", level.remastertextsize );
    addcentertriple( &"CREDITS_ATVI_DAVID_DELANTY", &"CREDITS_ATVI_MALCOLM_DOWSE", &"CREDITS_ATVI_TOM_READ", level.remastertextsize );
    addcentertriple( &"CREDITS_ATVI_DAVID_FALLOON", &"CREDITS_ATVI_MANNIX_KELLY", &"CREDITS_ATVI_TOM_SZYMANSKI", level.remastertextsize );
    addcentertriple( &"CREDITS_ATVI_DAVID_KILLEN", &"CREDITS_ATVI_MANUEL_BRONNER", &"CREDITS_ATVI_TOMASZ_RUDZKI", level.remastertextsize );
    addcentertriple( &"CREDITS_ATVI_DAVID_LANDAU", &"CREDITS_ATVI_MARC_CHRYSTOJA", &"CREDITS_ATVI_TOMASZ_WOJKIEWICZ", level.remastertextsize );
    addcentertriple( &"CREDITS_ATVI_DAVID_RIEGER", &"CREDITS_ATVI_MARCEL_BEGIC", &"CREDITS_ATVI_TONY_HSU", level.remastertextsize );
    addcentertriple( &"CREDITS_ATVI_DAVID_SHOCHAT", &"CREDITS_ATVI_MARCELO_TERACINI", &"CREDITS_ATVI_TONY_YANG", level.remastertextsize );
    addcentertriple( &"CREDITS_ATVI_DAVID_STORER", &"CREDITS_ATVI_MARCO_ZAMORA", &"CREDITS_ATVI_TOUMENG_YANG", level.remastertextsize );
    addcentertriple( &"CREDITS_ATVI_DAVID_TYLER", &"CREDITS_ATVI_MARCUS_IREMONGER", &"CREDITS_ATVI_TRAVIS_STANSBURY", level.remastertextsize );
    addcentertriple( &"CREDITS_ATVI_DAVIDE_ROMANI", &"CREDITS_ATVI_MARCUS_SCHOOF", &"CREDITS_ATVI_TRENT_HAMMER", level.remastertextsize );
    addcentertriple( &"CREDITS_ATVI_DEAN_ADAMSON", &"CREDITS_ATVI_MARIA_CLEOFE_DE_MESA", &"CREDITS_ATVI_TREVOR_BRESAW", level.remastertextsize );
    addcentertriple( &"CREDITS_ATVI_DEAN_MAMNEV", &"CREDITS_ATVI_MARIA_ELOVIKOVA", &"CREDITS_ATVI_TREVOR_OSTERMAN", level.remastertextsize );
    addcentertriple( &"CREDITS_ATVI_DEBBIE_KAGY", &"CREDITS_ATVI_MARIA_SANIC", &"CREDITS_ATVI_TROY_BUSSE", level.remastertextsize );
    addcentertriple( &"CREDITS_ATVI_DEBBIE_LEE", &"CREDITS_ATVI_MARIA_VIRGINIA_CUBILLOS", &"CREDITS_ATVI_TYLER_BYLAND", level.remastertextsize );
    addcentertriple( &"CREDITS_ATVI_DEIVES_MICHELLIS", &"CREDITS_ATVI_MARIAN_CULLEN", &"CREDITS_ATVI_TYRONE_HARGE", level.remastertextsize );
    addcentertriple( &"CREDITS_ATVI_DENIS_ZAITCEV", &"CREDITS_ATVI_MARIE_BAGNELL_", &"CREDITS_ATVI_VASILY_SMAGIN", level.remastertextsize );
    addcentertriple( &"CREDITS_ATVI_DENISE_ROSU", &"CREDITS_ATVI_MARIO_ORANTES", &"CREDITS_ATVI_VICTORIA_HARKINS", level.remastertextsize );
    addcentertriple( &"CREDITS_ATVI_DENNIS_DURKIN", &"CREDITS_ATVI_MARIO_SGAMBELLURI", &"CREDITS_ATVI_VIDAR_NILSEN", level.remastertextsize );
    addcentertriple( &"CREDITS_ATVI_DEREK_BROWN", &"CREDITS_ATVI_MARIO_TAEKEMA", &"CREDITS_ATVI_VINCENT_COUCH", level.remastertextsize );
    addcentertriple( &"CREDITS_ATVI_DEVANN_HILL", &"CREDITS_ATVI_MARIS_MUKANS", &"CREDITS_ATVI_VINCENT_VESPA", level.remastertextsize );
    addcentertriple( &"CREDITS_ATVI_DEVIN_BOMBARD", &"CREDITS_ATVI_MARISA_MUSCARI", &"CREDITS_ATVI_VIRGINIA_VEGA", level.remastertextsize );
    addcentertriple( &"CREDITS_ATVI_DEVON_SCHAUT", &"CREDITS_ATVI_MARK_AUBREY", &"CREDITS_ATVI_VITOR_PACHECO_LEEPKALN", level.remastertextsize );
    addcentertriple( &"CREDITS_ATVI_DIANA_DILLER", &"CREDITS_ATVI_MARK_BURMEISTER", &"CREDITS_ATVI_VLADISLAV_TITOV", level.remastertextsize );
    addcentertriple( &"CREDITS_ATVI_DIANA_VINCENTY", &"CREDITS_ATVI_MARK_HAMLON", &"CREDITS_ATVI_WADE_CRUICKSHANK", level.remastertextsize );
    addcentertriple( &"CREDITS_ATVI_DILETTA_PALAGI", &"CREDITS_ATVI_MARY_TUCK", &"CREDITS_ATVI_WANCHUN_ALEX_MA", level.remastertextsize );
    addcentertriple( &"CREDITS_ATVI_DINO_VERANO", &"CREDITS_ATVI_MASON_BOXERCAPITANO", &"CREDITS_ATVI_WEI_TING_WENG", level.remastertextsize );
    addcentertriple( &"CREDITS_ATVI_DMYTRO_DYACHUK", &"CREDITS_ATVI_MATIAS_ALARCON_REGOLINI", &"CREDITS_ATVI_WENDY_ROBILLARD", level.remastertextsize );
    addcentertriple( &"CREDITS_ATVI_DOMINIK_MAKAJ", &"CREDITS_ATVI_MATIAS_ANDRES_ALARCON", &"CREDITS_ATVI_WESTON_LAST", level.remastertextsize );
    addcentertriple( &"CREDITS_ATVI_DOUGLAS_TAFOYA", &"CREDITS_ATVI_MATT_COX", &"CREDITS_ATVI_WILL_KIRWIN", level.remastertextsize );
    addcentertriple( &"CREDITS_ATVI_DOV_CARSON", &"CREDITS_ATVI_MATT_GRAHN", &"CREDITS_ATVI_WILLIAM_BRUESKE", level.remastertextsize );
    addcentertriple( &"CREDITS_ATVI_DREW_LYONS", &"CREDITS_ATVI_MATT_PISCITELLO", &"CREDITS_ATVI_WILLIAM_NIELSEN", level.remastertextsize );
    addcentertriple( &"CREDITS_ATVI_DREW_MILLER", &"CREDITS_ATVI_MATT_SCHURENKO", &"CREDITS_ATVI_WILLIAM_SHEPARD", level.remastertextsize );
    addcentertriple( &"CREDITS_ATVI_DUNCAN_MCNAB", &"CREDITS_ATVI_MATTHEW_BURNSIDE", &"CREDITS_ATVI_WILLIAM_WEI", level.remastertextsize );
    addcentertriple( &"CREDITS_ATVI_DUSTIN_CARTER", &"CREDITS_ATVI_MATTHEW_EDWARDS", &"CREDITS_ATVI_WONG_YU_YAN_AMY", level.remastertextsize );
    addcentertriple( &"CREDITS_ATVI_DUSTIN_LOUDON", &"CREDITS_ATVI_MATTHEW_ERDMAN", &"CREDITS_ATVI_WOODY_YANG", level.remastertextsize );
    addcentertriple( &"CREDITS_ATVI_DUSTIN_XIONG", &"CREDITS_ATVI_MATTHEW_GABRIELSON", &"CREDITS_ATVI_XANDER_BOTHA", level.remastertextsize );
    addcentertriple( &"CREDITS_ATVI_DWAYNE_SCHMOUS", &"CREDITS_ATVI_MATTHEW_JAHREN", &"CREDITS_ATVI_XAVIER_JACKSON", level.remastertextsize );
    addcentertriple( &"CREDITS_ATVI_DYLAN_KUIPER", &"CREDITS_ATVI_MATTHEW_MEUWISSEN", &"CREDITS_ATVI_XIAOMING_WU", level.remastertextsize );
    addcentertriple( &"CREDITS_ATVI_DYLAN_POLNIAK", &"CREDITS_ATVI_MATTHEW_REYNOLDS", &"CREDITS_ATVI_Y_NGUYEN", level.remastertextsize );
    addcentertriple( &"CREDITS_ATVI_DYLAN_ROGERSON", &"CREDITS_ATVI_MATTHEW_SPARKS", &"CREDITS_ATVI_YAFEI_QU", level.remastertextsize );
    addcentertriple( &"CREDITS_ATVI_EDDIE_CHAN", &"CREDITS_ATVI_MATTHEW_WOIDA", &"CREDITS_ATVI_YANBING_CHEN", level.remastertextsize );
    addcentertriple( &"CREDITS_ATVI_EDGAR_GUTIERREZ", &"CREDITS_ATVI_MATTIA_BOUNAIUTO", &"CREDITS_ATVI_YAPING_ZHANG", level.remastertextsize );
    addcentertriple( &"CREDITS_ATVI_EDUARDO_GUTIERREZ", &"CREDITS_ATVI_MATYLDA_GRODECKA", &"CREDITS_ATVI_YASCHA_FRIESEN", level.remastertextsize );
    addcentertriple( &"CREDITS_ATVI_EDWARD_KARASCH", &"CREDITS_ATVI_MAX_EISENBRAUN", &"CREDITS_ATVI_YAWAR_MOHAMMED_KHAN", level.remastertextsize );
    addcentertriple( &"CREDITS_ATVI_EJ_ALCANTARA", &"CREDITS_ATVI_MAX_MORAIS", &"CREDITS_ATVI_YESHUEL_KIMMONS", level.remastertextsize );
    addcentertriple( &"CREDITS_ATVI_ELIZABETH_HOLMAN", &"CREDITS_ATVI_MAX_VIZARD", &"CREDITS_ATVI_YIMING_HUANG", level.remastertextsize );
    addcentertriple( &"CREDITS_ATVI_EMANUEL_SILVA", &"CREDITS_ATVI_MAXWELL_BARR", &"CREDITS_ATVI_YIN_VANG", level.remastertextsize );
    addcentertriple( &"CREDITS_ATVI_EMMA_MCBREEN", &"CREDITS_ATVI_MAXWELL_BOMCHILL", &"CREDITS_ATVI_YOGESH_SOOD", level.remastertextsize );
    addcentertriple( &"CREDITS_ATVI_EMMANUEL_STONE", &"CREDITS_ATVI_MAYRA_HOLGUIN", &"CREDITS_ATVI_YONGYI_ZHU", level.remastertextsize );
    addcentertriple( &"CREDITS_ATVI_ENRICO_BONGO", &"CREDITS_ATVI_MEAVE_MCCARTHY", &"CREDITS_ATVI_YOUHUA_LI", level.remastertextsize );
    addcentertriple( &"CREDITS_ATVI_ENRIQUE_MENDOZA", &"CREDITS_ATVI_MEGHAN_HALTON", &"CREDITS_ATVI_YUTA_NOHARA", level.remastertextsize );
    addcentertriple( &"CREDITS_ATVI_ERIC_DAWSON", &"CREDITS_ATVI_MERI_MORGANOV", &"CREDITS_ATVI_ZACH_DRISCOLL", level.remastertextsize );
    addcentertriple( &"CREDITS_ATVI_ERIC_DIEZ", &"CREDITS_ATVI_MICHAEL_ATAVINE", &"CREDITS_ATVI_ZACHARY_MORAN", level.remastertextsize );
    addcentertriple( &"CREDITS_ATVI_ERIC_HIRSHBERG", &"CREDITS_ATVI_MICHAEL_AYOOB", &"CREDITS_ATVI_ZACHARY_ROCKHILL", level.remastertextsize );
    addcentertriple( &"CREDITS_ATVI_ERIC_SANDERS", &"CREDITS_ATVI_MICHAEL_BAROTT", &"CREDITS_ATVI_ZACK_VANDE_KROL", level.remastertextsize );
    addcentertriple( &"CREDITS_ATVI_ERICK_GANI", &"CREDITS_ATVI_MICHAEL_BENEDIKT", &"CREDITS_ATVI_ZHICHEN_ZHAO", level.remastertextsize );
}

initiwpart2()
{
    addgroupspacing();
    addcenterheading( &"CREDITS_ATVI_INFINITY_WARD" );
    addcenternamecenter( &"CREDITS_ATVI_ORIGINAL_TEAM_CONTINUED", level.remastertextsize );
    addspacesmall();
    addcenternamedouble( &"CREDITS_ATVI_ALDRIC_SAUCIER", &"CREDITS_ATVI_JORDAN_MARDER", level.remastertextsize );
    addcenternamedouble( &"CREDITS_ATVI_ANNA_GRAVES", &"CREDITS_ATVI_JASON_BOESCH", level.remastertextsize );
    addcenternamedouble( &"CREDITS_ATVI_ARMANDO_VALDESKENNEDY", &"CREDITS_ATVI_JESUS_ANGUIANO", level.remastertextsize );
    addcenternamedouble( &"CREDITS_ATVI_ARTURO_CABALLERO", &"CREDITS_ATVI_JOSE_RUBEN", level.remastertextsize );
    addcenternamedouble( &"CREDITS_ATVI_BILLY_MURRAY", &"CREDITS_ATVI_JOSH_GILMAN", level.remastertextsize );
    addcenternamedouble( &"CREDITS_ATVI_BORIS_KIEVSKY", &"CREDITS_ATVI_JOSHUA_LACROSSE", level.remastertextsize );
    addcenternamedouble( &"CREDITS_ATVI_CHAD_BAKKE", &"CREDITS_ATVI_JUSTIN_HARRIS", level.remastertextsize );
    addcenternamedouble( &"CREDITS_ATVI_CLIVE_HAWKINS", &"CREDITS_ATVI_KEVIN_COLLINS", level.remastertextsize );
    addcenternamedouble( &"CREDITS_ATVI_CRAIG_FAIRBRASS", &"CREDITS_ATVI_KRISTOF_KONRAD", level.remastertextsize );
    addcenternamedouble( &"CREDITS_ATVI_DANIEL_EDWARDS", &"CREDITS_ATVI_MARCUS_COLOMA", level.remastertextsize );
    addcenternamedouble( &"CREDITS_ATVI_DAVE_MALLOW", &"CREDITS_ATVI_MARK_IVANIR", level.remastertextsize );
    addcenternamedouble( &"CREDITS_ATVI_DAVID_KLEC", &"CREDITS_ATVI_MARTIN_RESOAGLI", level.remastertextsize );
    addcenternamedouble( &"CREDITS_ATVI_DAVID_NEIL_BLACK", &"CREDITS_ATVI_MICHAEL_ANDERSON", level.remastertextsize );
    addcenternamedouble( &"CREDITS_ATVI_DAVID_SOBOLOV", &"CREDITS_ATVI_MICHAEL_CUDLITZ", level.remastertextsize );
    addcenternamedouble( &"CREDITS_ATVI_DERRIC_EADY", &"CREDITS_ATVI_MICHAEL_GOUGH", level.remastertextsize );
    addcenternamedouble( &"CREDITS_ATVI_DESMOND_ASKEW", &"CREDITS_ATVI_MUNEER_ABDELHADI", level.remastertextsize );
    addcenternamedouble( &"CREDITS_ATVI_EID_TOLBA", &"CREDITS_ATVI_QUENTIN_JONES", level.remastertextsize );
    addcenternamedouble( &"CREDITS_ATVI_EUGENE_LAZAREB", &"CREDITS_ATVI_RJ_KNOLL", level.remastertextsize );
    addcenternamedouble( &"CREDITS_ATVI_FRED_TOMA", &"CREDITS_ATVI_SAM_SAKO", level.remastertextsize );
    addcenternamedouble( &"CREDITS_ATVI_GABRIEL_ALRAJHI", &"CREDITS_ATVI_SARKIS_ALBERT", level.remastertextsize );
    addcenternamedouble( &"CREDITS_ATVI_GIDEON_EMERY", &"CREDITS_ATVI_STEVEN_JONES", level.remastertextsize );
    addcenternamedouble( &"CREDITS_ATVI_GREG_ELLIS", &"CREDITS_ATVI_SUREN_GAZARYAN", level.remastertextsize );
    addcenternamedouble( &"CREDITS_ATVI_HARRY_VAN_GORKUM", &"CREDITS_ATVI_SVEN_HOLMBERG", level.remastertextsize );
    addcenternamedouble( &"CREDITS_ATVI_HENRY_YORK", &"CREDITS_ATVI_TOM_MINDER", level.remastertextsize );
    addcenternamedouble( &"CREDITS_ATVI_HUGH_DALY", &"CREDITS_ATVI_ZACH_HANKS", level.remastertextsize );
}

initatvipart2()
{
    addgroupspacing();
    addcenterheading( &"CREDITS_ATVI_MUSIC" );
    addspacesmall();
    addcenternamecenter( &"CREDITS_ATVI_ANATOLIJ_N_ALEXANDROV", level.remastertextsize );
    addcenternamecenter( &"CREDITS_ATVI_RED_ARMY_CHOIR", level.remastertextsize );
    addcenternamecenter( &"CREDITS_ATVI_G_SCHIRMER", level.remastertextsize );
    addcenternamecenter( &"CREDITS_ATVI_MUSIC_SALES", level.remastertextsize );
    addcenternamecenter( &"CREDITS_ATVI_SILVA_SCREEN_MUSIC_AMERICA", level.remastertextsize );
    addcenternamecenter( &"CREDITS_ATVI_ABRAHAM_LASS", level.remastertextsize );
    addcenternamecenter( &"CREDITS_ATVI_TRF_MUSIC_INC_ALPHA_MUSIC_INC", level.remastertextsize );
    addcenternamecenter( &"CREDITS_ATVI_HARRY_GREGSONWILLIAMS", level.remastertextsize );
    addcenternamecenter( &"CREDITS_ATVI_STEPHEN_BARTON", level.remastertextsize );
    addcenternamecenter( &"CREDITS_ATVI_ALLISON_WRIGHT_CLARK", level.remastertextsize );
    addcenternamecenter( &"CREDITS_ATVI_MEL_WESSON", level.remastertextsize );
    addcenternamecenter( &"CREDITS_ATVI_THE_LONDON_SYMPHONY_ORCHESTRA", level.remastertextsize );
    addcenternamecenter( &"CREDITS_ATVI_MALCOLM_LUKER", level.remastertextsize );
    addcenternamecenter( &"CREDITS_ATVI_JAMIE_LUKER", level.remastertextsize );
    addcenternamecenter( &"CREDITS_ATVI_SCRAP_MARSHALL", level.remastertextsize );
    addcenternamecenter( &"CREDITS_ATVI_ISOBEL_GRIFFITHS", level.remastertextsize );
    addcenternamecenter( &"CREDITS_ATVI_CHARLOTTE_MATTHEWS", level.remastertextsize );
    addcenternamecenter( &"CREDITS_ATVI_TODD_STANTON", level.remastertextsize );
    addcenternamecenter( &"CREDITS_ATVI_DAVID_BUCKLEY", level.remastertextsize );
    addcenternamecenter( &"CREDITS_ATVI_STEPHEN_BARTON", level.remastertextsize );
    addcenternamecenter( &"CREDITS_ATVI_LADD_MCINTOSH", level.remastertextsize );
    addcenternamecenter( &"CREDITS_ATVI_HALLI_CAUTHERY", level.remastertextsize );
    addcenternamecenter( &"CREDITS_ATVI_ANN_MILLER", level.remastertextsize );
    addcenternamecenter( &"CREDITS_ATVI_TED_MILLER", level.remastertextsize );
    addcenternamecenter( &"CREDITS_ATVI_THE_CZECH_PHILHARMONIC_ORCHESTRA", level.remastertextsize );
    addcenternamecenter( &"CREDITS_ATVI_PAVEL_PRANTL", level.remastertextsize );
    addcenternamecenter( &"CREDITS_ATVI_COSTA_KOTSELAS", level.remastertextsize );
    addcenternamecenter( &"CREDITS_ATVI_PETER_DISTEFANO", level.remastertextsize );
    addcenternamecenter( &"CREDITS_ATVI_JOHN_PARRICELLI", level.remastertextsize );
    addcenternamecenter( &"CREDITS_ATVI_TOBY_CHU", level.remastertextsize );
    addcenternamecenter( &"CREDITS_ATVI_HUGH_MARSH", level.remastertextsize );
    addcenternamecenter( &"CREDITS_ATVI_STUART_HALL", level.remastertextsize );
    addcenternamecenter( &"CREDITS_ATVI_NICHOLAS_PERRY", level.remastertextsize );
    addcenternamecenter( &"CREDITS_ATVI_RICHARD_WATKINS", level.remastertextsize );
    addcenternamecenter( &"CREDITS_ATVI_FRANK_RICOTTI", level.remastertextsize );
    addcenternamecenter( &"CREDITS_ATVI_GARY_KETTEL", level.remastertextsize );
    addcenternamecenter( &"CREDITS_ATVI_PAUL_CLARVIS", level.remastertextsize );
    addcenternamecenter( &"CREDITS_ATVI_NICK_TREMBLAY", level.remastertextsize );
    addcenternamecenter( &"CREDITS_ATVI_ABBEY_ROAD_STUDIOS", level.remastertextsize );
    addcenternamecenter( &"CREDITS_ATVI_BLUE_ROOM", level.remastertextsize );
    addgroupspacing();
    addcenterheading( &"CREDITS_ATVI_ADDITIONAL_SERVICES" );
    addspacesmall();
    addcenternamecenter( &"CREDITS_ATVI_LT_COL_HANK_KEIRSY_US_ARMY_RET", level.remastertextsize );
    addcenternamecenter( &"CREDITS_ATVI_MAJ_KEVIN_COLLINS_USMC_RET", level.remastertextsize );
    addcenternamecenter( &"CREDITS_ATVI_EMILIO_CUESTA_USMC", level.remastertextsize );
    addcenternamecenter( &"CREDITS_ATVI_MAJ_JAMES_DEVER_1_FORCE_INC", level.remastertextsize );
    addcenternamecenter( &"CREDITS_ATVI_M_SGT_TOM_MINDER_1_FORCE_INC", level.remastertextsize );
    addcenternamecenter( &"CREDITS_ATVI_JOHN_FASAL", level.remastertextsize );
    addcenternamecenter( &"CREDITS_ATVI_DREW_MCCOY", level.remastertextsize );
    addcenternamecenter( &"CREDITS_ATVI_BRIAN_GILMAN", level.remastertextsize );
    addcenternamecenter( &"CREDITS_ATVI_ANDREW_CLARK", level.remastertextsize );
    addcenternamecenter( &"CREDITS_ATVI_JAVIER_OJEDA", level.remastertextsize );
    addcenternamecenter( &"CREDITS_ATVI_JIWON_SON", level.remastertextsize );
    addcenternamecenter( &"CREDITS_ATVI_APPLIED_LANGUAGES", level.remastertextsize );
    addcenternamecenter( &"CREDITS_ATVI_WORLD_LINGO", level.remastertextsize );
    addcenternamecenter( &"CREDITS_ATVI_UNIQUE_ARTISTS", level.remastertextsize );
    addcenternamecenter( &"CREDITS_ATVI_GIBBONS_LTD", level.remastertextsize );
    addcenternamecenter( &"CREDITS_ATVI_LONG_MOUNTAIN_OUTFITTERS", level.remastertextsize );
    addcenternamecenter( &"CREDITS_ATVI_BOB_MAUPIN_RANCH", level.remastertextsize );
    addcenternamecenter( &"CREDITS_ATVI_PCB_PRODUCTIONS_ENCINO_CA", level.remastertextsize );
    addcenternamecenter( &"CREDITS_ATVI_SIDEUK_LONDON_UK", level.remastertextsize );
    addcenternamecenter( &"CREDITS_ATVI_KEITH_AREM", level.remastertextsize );
    addcenternamecenter( &"CREDITS_ATVI_ANT_HALES", level.remastertextsize );
    addcenternamecenter( &"CREDITS_ATVI_STEVE_FUKUDA", level.remastertextsize );
    addcenternamecenter( &"CREDITS_ATVI_MACKEY_MCCANDLISH", level.remastertextsize );
    addcenternamecenter( &"CREDITS_ATVI_KRISTINA_ADELMEYER", level.remastertextsize );
    addcenternamecenter( &"CREDITS_ATVI_KRISTIN_GALLAGHER", level.remastertextsize );
    addcenternamecenter( &"CREDITS_ATVI_JEFF_SWENTY", level.remastertextsize );
    addcenternamecenter( &"CREDITS_ATVI_JORGE_LOPEZ", level.remastertextsize );
    addcenternamecenter( &"CREDITS_ATVI_DANNY_HERNANDEZ", level.remastertextsize );
    addcenternamecenter( &"CREDITS_ATVI_ROBERT_ALONSO", level.remastertextsize );
    addcenternamecenter( &"CREDITS_ATVI_ALLEN_JO", level.remastertextsize );
    addcenternamecenter( &"CREDITS_ATVI_DAVID_LEITCH", level.remastertextsize );
    addcenternamecenter( &"CREDITS_ATVI_MIKE_MUKATIS", level.remastertextsize );
    addcenternamecenter( &"CREDITS_ATVI_RYAN_WATSON", level.remastertextsize );
    addspace();
    addcenternamecenter( &"CREDITS_ATVI_SPOTTV", level.remastertextsize );
    addcenternamecenter( &"CREDITS_ATVI_ARMY_TRUCKS_INC", level.remastertextsize );
    addcenternamecenter( &"CREDITS_ATVI_XPEC_AND_SHADOWS_IN_DARKNESS", level.remastertextsize );
    addcenternamecenter( &"CREDITS_ATVI_EARBASH_AUDIO_INC", level.remastertextsize );
    addcenternamecenter( &"CREDITS_ATVI_DIGITAL_SYNAPSE", level.remastertextsize );
    addcenternamecenter( &"CREDITS_ATVI_LOCALISATION_TOOLS_SUPPORT", level.remastertextsize );
    addcenternamecenter( &"CREDITS_ATVI_STEPHANIE_DEMING_XLOC_INC", level.remastertextsize );
    addcenternamecenter( &"CREDITS_ATVI_PACKAGING_DESIGN", level.remastertextsize );
    addcenternamecenter( &"CREDITS_ATVI_PETROL", level.remastertextsize );
    addcenternamecenter( &"CREDITS_ATVI_THE_CHARACTERS_AND_EVENTS", level.remastertextsize );
    addcenternamecenter( &"CREDITS_ATVI_ANY_SIMILARITY", level.remastertextsize );
    addcenternamecenter( &"CREDITS_ATVI_FONTS_PROVIDED_BY_MONOTYPE_IMAGING_INC", level.remastertextsize );
    addcenternamecenter( &"CREDITS_ATVI_FONTS_PROVIDED_BY_T26_INC", level.remastertextsize );
    addcenternamecenter( &"CREDITS_ATVI_BINK_VIDEO_2016", level.remastertextsize );
    addcenternamecenter( &"CREDITS_ATVI_HAVOK_2016", level.remastertextsize );
    addcenternamecenter( &"CREDITS_ATVI_SEE_WWWHAVOKCOM", level.remastertextsize );
    addcenternamecenter( &"CREDITS_ATVI_UMBRA_2016", level.remastertextsize );
    addcenternamecenter( &"CREDITS_ATVI_GETTY_IMAGES", level.remastertextsize );
    addcenternamecenter( &"CREDITS_ATVI_ANIMATION_VERTIGO", level.remastertextsize );
    addcenternamecenter( &"CREDITS_ATVI_AMC_PIXEL_FACTORY", level.remastertextsize );
    addcenternamecenter( &"CREDITS_ATVI_ART_BULLY_PRODUCTIONS_LLC", level.remastertextsize );
    addcenternamecenter( &"CREDITS_ATVI_CUBIC_MOTION_LTD", level.remastertextsize );
    addcenternamecenter( &"CREDITS_ATVI_ELITE3D", level.remastertextsize );
    addcenternamecenter( &"CREDITS_ATVI_MOTION_BURNER_LP", level.remastertextsize );
    addcenternamecenter( &"CREDITS_ATVI_RED_HOT_CG", level.remastertextsize );
    addcenternamecenter( &"CREDITS_ATVI_RINGTAIL_STUDIOS_LTD", level.remastertextsize );
    addcenternamecenter( &"CREDITS_ATVI_SUNNY_SIDE_UP_CREATIVE_INC", level.remastertextsize );
    addcenternamecenter( &"CREDITS_ATVI_ULYSSES_GRAPHICS", level.remastertextsize );
    addspace();
    addcenterimage( "dolby_havok_logos_01", 384, 48, 2 );
}

initspecialthanks()
{
    addgroupspacing();
    addcenterheading( &"CREDITS_ATVI_TITLE_SPECIAL_THANKS" );
    addspacesmall();
    addcenternamedouble( &"CREDITS_ATVI_ADAM_JENNINGS", &"CREDITS_ATVI_JOSHUA_CARRILLO", level.remastertextsize );
    addcenternamedouble( &"CREDITS_ATVI_ALAN_STERN", &"CREDITS_ATVI_JULIE_ANNE_PAIEMENT", level.remastertextsize );
    addcenternamedouble( &"CREDITS_ATVI_ALEJANDRO_ARREOLA", &"CREDITS_ATVI_JULIEN_ROCHEFORTDELSALLE", level.remastertextsize );
    addcenternamedouble( &"CREDITS_ATVI_ALEXANDRA_BEAULIEU", &"CREDITS_ATVI_KATIE_BOULET", level.remastertextsize );
    addcenternamedouble( &"CREDITS_ATVI_ALEXANDRE_BLANCHETDESLOGES", &"CREDITS_ATVI_KYLE_SMITH", level.remastertextsize );
    addcenternamedouble( &"CREDITS_ATVI_ALEXANDRE_COSSETTE", &"CREDITS_ATVI_LAIRD_MALAMED", level.remastertextsize );
    addcenternamedouble( &"CREDITS_ATVI_ALEXANDRE_OUELLET", &"CREDITS_ATVI_LARRY_ZANOFF", level.remastertextsize );
    addcenternamedouble( &"CREDITS_ATVI_ANA_RUBEL", &"CREDITS_ATVI_LARRY_ZENG", level.remastertextsize );
    addcenternamedouble( &"CREDITS_ATVI_ANAMARIA_WEILAND", &"CREDITS_ATVI_LAWRENCE_GREEN", level.remastertextsize );
    addcenternamedouble( &"CREDITS_ATVI_ANDREW_WEIR", &"CREDITS_ATVI_LIAM_COOK", level.remastertextsize );
    addcenternamedouble( &"CREDITS_ATVI_ANGEL_SANCHEZ", &"CREDITS_ATVI_LOUISPHILIPPE_LEBEL", level.remastertextsize );
    addcenternamedouble( &"CREDITS_ATVI_ANGEL_TORRES", &"CREDITS_ATVI_LUC_FERLAND", level.remastertextsize );
    addcenternamedouble( &"CREDITS_ATVI_ARMY_1ST_CAVALRY_DIVISION_MUSEUM", &"CREDITS_ATVI_BABY_LUKE_SMITH_AND_MOTHER_LISA", level.remastertextsize );
    addcenternamedouble( &"CREDITS_ATVI_ARTHUR_CANAL", &"CREDITS_ATVI_MANUELLA_COULOMBE", level.remastertextsize );
    addcenternamedouble( &"CREDITS_ATVI_ATSUSHI_HAMANO", &"CREDITS_ATVI_MARIA_GONZALEZ", level.remastertextsize );
    addcenternamedouble( &"CREDITS_ATVI_BENJAMIN_DESCAMPS", &"CREDITS_ATVI_MARIECHRISTINE_MARINEAU", level.remastertextsize );
    addcenternamedouble( &"CREDITS_ATVI_BENJAMIN_HECKENDORN", &"CREDITS_ATVI_MARIEPIER_FORTIER", level.remastertextsize );
    addcenternamedouble( &"CREDITS_ATVI_BERNARD_LANGLOIS", &"CREDITS_ATVI_MARINE_LIGHT_ATTACK_HELICOPTER_SQUADRON_775", level.remastertextsize );
    addcenternamedouble( &"CREDITS_ATVI_BILL_MAUER", &"CREDITS_ATVI_MARK_GORDON", level.remastertextsize );
    addcenternamedouble( &"CREDITS_ATVI_BRAD_JEANSONNE", &"CREDITS_ATVI_MARK_LAMIA", level.remastertextsize );
    addcenternamedouble( &"CREDITS_ATVI_BRIAN_MAYNARD", &"CREDITS_ATVI_MARTIN_DUBE", level.remastertextsize );
    addcenternamedouble( &"CREDITS_ATVI_CANADIAN_ARMED_FORCES", &"CREDITS_ATVI_MARUCHY_FERNANDEZ", level.remastertextsize );
    addcenternamedouble( &"CREDITS_ATVI_C_ANTHONY_MARQUEZ", &"CREDITS_ATVI_MATHIEU_BLANCHET", level.remastertextsize );
    addcenternamedouble( &"CREDITS_ATVI_CALEB_BARNHART", &"CREDITS_ATVI_MATT_SOELL", level.remastertextsize );
    addcenternamedouble( &"CREDITS_ATVI_CARLA_HAMILTON", &"CREDITS_ATVI_MAXIME_TURCOTTE", level.remastertextsize );
    addcenternamedouble( &"CREDITS_ATVI_CHARLES_DUFOUR", &"CREDITS_ATVI_MEGAN_BAIRD", level.remastertextsize );
    addcenternamedouble( &"CREDITS_ATVI_CHRIS_CHOWDHURY", &"CREDITS_ATVI_MICHAEL_GIBBONS", level.remastertextsize );
    addcenternamedouble( &"CREDITS_ATVI_CHRISTOPHER_DARE", &"CREDITS_ATVI_MICHAEL_LISCOTTI", level.remastertextsize );
    addcenternamedouble( &"CREDITS_ATVI_CHUCH_JONES", &"CREDITS_ATVI_MICHAEL_RETZLAFF", level.remastertextsize );
    addcenternamedouble( &"CREDITS_ATVI_CLARK_JANES", &"CREDITS_ATVI_MICHAEL_WASHBURN", level.remastertextsize );
    addcenternamedouble( &"CREDITS_ATVI_CLAUDE_LACHANCE", &"CREDITS_ATVI_MONICA_HILL", level.remastertextsize );
    addcenternamedouble( &"CREDITS_ATVI_CODY_MAUTER", &"CREDITS_ATVI_MONIQUE_POULIOT", level.remastertextsize );
    addcenternamedouble( &"CREDITS_ATVI_BABY_COLIN_ALDERMAN_AND_MOTHER_MARYANNE", &"CREDITS_ATVI_NATE_FRICKEL", level.remastertextsize );
    addcenternamedouble( &"CREDITS_ATVI_BABY_COURTNEY_ZAMPELLA_AND_MOTHER_BRIGITTE", &"CREDITS_ATVI_NATHAN_GIROUX", level.remastertextsize );
    addcenternamedouble( &"CREDITS_ATVI_DAN_BUNTING", &"CREDITS_ATVI_NICK_DUNCAN", level.remastertextsize );
    addcenternamedouble( &"CREDITS_ATVI_DAVE_DOUGLAS", &"CREDITS_ATVI_NICK_LAMIA", level.remastertextsize );
    addcenternamedouble( &"CREDITS_ATVI_DAVID_COFFEY", &"CREDITS_ATVI_OSCAR_VILLAMOR", level.remastertextsize );
    addcenternamedouble( &"CREDITS_ATVI_DAVID_FALICKI", &"CREDITS_ATVI_PATRICK_COTE", level.remastertextsize );
    addcenternamedouble( &"CREDITS_ATVI_DAVID_SALAIZ", &"CREDITS_ATVI_PATRICK_DESBIENSWRIGHT", level.remastertextsize );
    addcenternamedouble( &"CREDITS_ATVI_DEREK_RACCA", &"CREDITS_ATVI_PHILIP_LIU", level.remastertextsize );
    addcenternamedouble( &"CREDITS_ATVI_DEVIN_FLORA", &"CREDITS_ATVI_PHILIPPE_PELLETIERBARIBAULT", level.remastertextsize );
    addcenternamedouble( &"CREDITS_ATVI_DOMINIC_CARPENTIER", &"CREDITS_ATVI_PHILIPPE_STLAURENT", level.remastertextsize );
    addcenternamedouble( &"CREDITS_ATVI_DOMINIC_POIRIER", &"CREDITS_ATVI_PIERRE_BARMA", level.remastertextsize );
    addcenternamedouble( &"CREDITS_ATVI_DONOVAN_BYRNES", &"CREDITS_ATVI_PIERRE_BIBEAU", level.remastertextsize );
    addcenternamedouble( &"CREDITS_ATVI_DOUG_PEARSON", &"CREDITS_ATVI_RAPHAEL_COUTURE", level.remastertextsize );
    addcenternamedouble( &"CREDITS_ATVI_EDWARD_LYTTON", &"CREDITS_ATVI_RHETT_CHASSEREAU", level.remastertextsize );
    addcenternamedouble( &"CREDITS_ATVI_EMILIE_VIVIANNE_ALMAGUER_RENAUD", &"CREDITS_ATVI_ROBERT_MAUPIN", level.remastertextsize );
    addcenternamedouble( &"CREDITS_ATVI_ERIC_GIRARD", &"CREDITS_ATVI_ROBERT_OBRIEN", level.remastertextsize );
    addcenternamedouble( &"CREDITS_ATVI_ERIC_GUIGUE", &"CREDITS_ATVI_ROCK_GALLOTTI", level.remastertextsize );
    addcenternamedouble( &"CREDITS_ATVI_FAYE_WANG", &"CREDITS_ATVI_ROMAIN_LAVIGNE", level.remastertextsize );
    addcenternamedouble( &"CREDITS_ATVI_FRANCIS_COUTURE", &"CREDITS_ATVI_ROMAIN_MERCIER", level.remastertextsize );
    addcenternamedouble( &"CREDITS_ATVI_GENEVIEVE_JACQUES", &"CREDITS_ATVI_RYAN_FRENCH", level.remastertextsize );
    addcenternamedouble( &"CREDITS_ATVI_GEOFF_YETTER", &"CREDITS_ATVI_RYAN_GITTER", level.remastertextsize );
    addcenternamedouble( &"CREDITS_ATVI_GORDON_JAMES", &"CREDITS_ATVI_SAM_CHARCHIAN", level.remastertextsize );
    addcenternamedouble( &"CREDITS_ATVI_GRAHAM_HAGMAIER", &"CREDITS_ATVI_SAM_NOURIANI", level.remastertextsize );
    addcenternamedouble( &"CREDITS_ATVI_GREG_MESSINGER", &"CREDITS_ATVI_SAMANTHA_STAUFFER", level.remastertextsize );
    addcenternamedouble( &"CREDITS_ATVI_GUILLAUME_BORGIA", &"CREDITS_ATVI_SARAH_MILLIKEN", level.remastertextsize );
    addcenternamedouble( &"CREDITS_ATVI_GUILLAUME_ROBERGE", &"CREDITS_ATVI_SCOTT_CARPENTER", level.remastertextsize );
    addcenternamedouble( &"CREDITS_ATVI_JACOB_THOMPSON", &"CREDITS_ATVI_SISI_CASTRO_KRUEL", level.remastertextsize );
    addcenternamedouble( &"CREDITS_ATVI_JAMES_BONTI", &"CREDITS_ATVI_STEPHANE_RABATTU", level.remastertextsize );
    addcenternamedouble( &"CREDITS_ATVI_JAMES_WRENCH", &"CREDITS_ATVI_STEPHANIE_MARTINEZ", level.remastertextsize );
    addcenternamedouble( &"CREDITS_ATVI_JASMINE_ALLEN", &"CREDITS_ATVI_STEVE_ACKRICH", level.remastertextsize );
    addcenternamedouble( &"CREDITS_ATVI_JASON_ADES", &"CREDITS_ATVI_STEVE_GAUTHIER", level.remastertextsize );
    addcenternamedouble( &"CREDITS_ATVI_JASON_BLUNDELL", &"CREDITS_ATVI_SYLVAIN_CARON", level.remastertextsize );
    addcenternamedouble( &"CREDITS_ATVI_JASON_LYONS", &"CREDITS_ATVI_TANYA_BERG", level.remastertextsize );
    addcenternamedouble( &"CREDITS_ATVI_JD_KEIRSEY", &"CREDITS_ATVI_TEXAS_FILM_COMMISSION", level.remastertextsize );
    addcenternamedouble( &"CREDITS_ATVI_JEAN_FOURNIER", &"CREDITS_ATVI_THAINE_LYMAN", level.remastertextsize );
    addcenternamedouble( &"CREDITS_ATVI_JEANFRANCOIS_NADEAU", &"CREDITS_ATVI_THOMAS_GIBSON", level.remastertextsize );
    addcenternamedouble( &"CREDITS_ATVI_JENNIFER_CASINADER", &"CREDITS_ATVI_THOMAS_WHITLOW", level.remastertextsize );
    addcenternamedouble( &"CREDITS_ATVI_JENNIPHER_JUDGE", &"CREDITS_ATVI_TREVOR_COMPTON_REES", level.remastertextsize );
    addcenternamedouble( &"CREDITS_ATVI_JEREMY_HULL", &"CREDITS_ATVI_USMC_1ST_TANK_BATTALION", level.remastertextsize );
    addcenternamedouble( &"CREDITS_ATVI_JESSICA_MOREAUROBERGE", &"CREDITS_ATVI_USMC_5TH_BATTALION_14TH_MARINES", level.remastertextsize );
    addcenternamedouble( &"CREDITS_ATVI_JOE_CAMMORATA", &"CREDITS_ATVI_USMC_PUBLIC_AFFAIRS_OFFICE", level.remastertextsize );
    addcenternamedouble( &"CREDITS_ATVI_JOEY_DESROSIERS", &"CREDITS_ATVI_VICTOR_STLAURENT", level.remastertextsize );
    addcenternamedouble( &"CREDITS_ATVI_JOHN_BUDD", &"CREDITS_ATVI_VICTOR_STPIERRE", level.remastertextsize );
    addcenternamedouble( &"CREDITS_ATVI_BABY_JOHN_GALT_WEST_JACK_AND_MOTHER_ADRIANA", &"CREDITS_ATVI_VINCENT_FENNEL", level.remastertextsize );
    addcenternamedouble( &"CREDITS_ATVI_JOHNNY_KIM", &"CREDITS_ATVI_WINYAN_JAMES", level.remastertextsize );
    addcenternamedouble( &"CREDITS_ATVI_JOSE_GO", &"CREDITS_ATVI_YALE_MILLER", level.remastertextsize );
    addcenternamedouble( &"CREDITS_ATVI_JOSEPH_MCCREARY", &"CREDITS_ATVI_YANNICK_COUTURE", level.remastertextsize );
    addcenternamedouble( &"CREDITS_ATVI_JOSH_POWERS", &"CREDITS_ATVI_YVES_DESBIENS", level.remastertextsize );
    addcenternamedouble( &"CREDITS_ATVI_JOSH_TYRELL", "  ", level.remastertextsize );
}

initiwcredits()
{
    if ( getdvar( "mapname" ) == "ac130" )
    {
        addleftimage( "logo_infinityward", 256, 128, 4.375 );
        addspace();
        addspace();
        addlefttitle( &"CREDIT_PROJECT_LEAD" );
        addspacesmall();
        addleftname( &"CREDIT_JASON_WEST_CAPS" );
        addspace();
        addspace();
        addlefttitle( &"CREDIT_ENGINEERING_LEADS" );
        addspacesmall();
        addleftname( &"CREDIT_RICHARD_BAKER_CAPS" );
        addleftname( &"CREDIT_ROBERT_FIELD_CAPS" );
        addleftname( &"CREDIT_FRANCESCO_GIGLIOTTI_CAPS" );
        addleftname( &"CREDIT_EARL_HAMMON_JR_CAPS" );
        addspace();
        addlefttitle( &"CREDIT_ENGINEERING" );
        addspacesmall();
        addleftname( &"CREDIT_CHAD_BARB_CAPS" );
        addleftname( &"CREDIT_ALESSANDRO_BARTOLUCCI_CAPS" );
        addleftname( &"CREDIT_JON_DAVIS_CAPS" );
        addleftname( &"CREDIT_JOEL_GOMPERT_CAPS" );
        addleftname( &"CREDIT_JOHN_HAGGERTY_CAPS" );
        addleftname( &"CREDIT_JON_SHIRING_CAPS" );
        addleftname( &"CREDIT_JIESANG_SONG_CAPS" );
        addleftname( &"CREDIT_RAYME_VINSON_CAPS" );
        addleftname( &"CREDIT_ANDREW_WANG_CAPS" );
        addspace();
        addspace();
        addlefttitle( &"CREDIT_DESIGN_LEADS" );
        addspacesmall();
        addleftname( &"CREDIT_TODD_ALDERMAN_CAPS" );
        addleftname( &"CREDIT_STEVE_FUKUDA_CAPS" );
        addleftname( &"CREDIT_MACKEY_MCCANDLISH_CAPS" );
        addleftname( &"CREDIT_ZIED_RIEKE_CAPS" );
        addspace();
        addlefttitle( &"CREDIT_DESIGN_AND_SCRIPTING" );
        addspacesmall();
        addleftname( &"CREDIT_ROGER_ABRAHAMSSON_CAPS" );
        addleftname( &"CREDIT_MOHAMMAD_ALAVI_CAPS" );
        addleftname( &"CREDIT_KEITH_BELL_CAPS" );
        addleftname( &"CREDIT_PRESTON_GLENN_CAPS" );
        addleftname( &"CREDIT_CHAD_GRENIER_CAPS" );
        addleftname( &"CREDIT_JAKE_KEATING_CAPS" );
        addleftname( &"CREDIT_JULIAN_LUO_CAPS" );
        addleftname( &"CREDIT_STEVE_MASSEY_CAPS" );
        addleftname( &"CREDIT_BRENT_MCLEOD_CAPS" );
        addleftname( &"CREDIT_JON_PORTER_CAPS" );
        addleftname( &"CREDIT_ALEXANDER_ROYCEWICZ_CAPS" );
        addleftname( &"CREDIT_NATHAN_SILVERS_CAPS" );
        addleftname( &"CREDIT_GEOFFREY_SMITH_CAPS" );
        addspace();
        addspace();
        addlefttitle( &"CREDIT_ART_DIRECTOR" );
        addspacesmall();
        addleftname( &"CREDIT_RICHARD_KRIEGLER_CAPS" );
        addspace();
        addlefttitle( &"CREDIT_TECHNICAL_ART_DIRECTOR" );
        addspacesmall();
        addleftname( &"CREDIT_MICHAEL_BOON_CAPS" );
        addspace();
        addlefttitle( &"CREDIT_ART_LEADS" );
        addspacesmall();
        addleftname( &"CREDIT_CHRIS_CHERUBINI_CAPS" );
        addleftname( &"CREDIT_JOEL_EMSLIE_CAPS" );
        addleftname( &"CREDIT_ROBERT_GAINES_CAPS" );
        addspace();
        addlefttitle( &"CREDIT_ART" );
        addspacesmall();
        addleftname( &"CREDIT_BRAD_ALLEN_CAPS" );
        addleftname( &"CREDIT_PETER_CHEN_CAPS" );
        addleftname( &"CREDIT_JEFF_HEATH_CAPS" );
        addleftname( &"CREDIT_RYAN_LASTIMOSA_CAPS" );
        addleftname( &"CREDIT_OSCAR_LOPEZ_CAPS" );
        addleftname( &"CREDIT_HERBERT_LOWIS_CAPS" );
        addleftname( &"CREDIT_TAEHOON_OH_CAPS" );
        addleftname( &"CREDIT_SAMI_ONUR_CAPS" );
        addleftname( &"CREDIT_VELINDA_PELAYO_CAPS" );
        addleftname( &"CREDIT_RICHARD_SMITH_CAPS" );
        addleftname( &"CREDIT_THEERAPOL_SRISUPHAN_CAPS" );
        addleftname( &"CREDIT_TODD_SUE_CAPS" );
        addleftname( &"CREDIT_SOMPOOM_TANGCHUPONG_CAPS" );
        addspace();
        addspace();
        addlefttitle( &"CREDIT_ANIMATION_LEADS" );
        addspacesmall();
        addleftname( &"CREDIT_MARK_GRIGSBY_CAPS" );
        addleftname( &"CREDIT_PAUL_MESSERLY_CAPS" );
        addspace();
        addlefttitle( &"CREDIT_ANIMATION" );
        addspacesmall();
        addleftname( &"CREDIT_CHANCE_GLASCO_CAPS" );
        addleftname( &"CREDIT_EMILY_RULE_CAPS" );
        addleftname( &"CREDIT_ZACH_VOLKER_CAPS" );
        addleftname( &"CREDIT_LEI_YANG_CAPS" );
        addspace();
        addspace();
        addlefttitle( &"CREDIT_TECHNICAL_ANIMATION_LEAD" );
        addspacesmall();
        addleftname( &"CREDIT_ERIC_PIERCE_CAPS" );
        addspace();
        addlefttitle( &"CREDIT_TECHNICAL_ANIMATION" );
        addspacesmall();
        addleftname( &"CREDIT_NEEL_KAR_CAPS" );
        addleftname( &"CREDIT_CHENG_LOR_CAPS" );
        addspace();
        addspace();
        addlefttitle( &"CREDIT_AUDIO_LEAD" );
        addspacesmall();
        addleftname( &"CREDIT_MARK_GANUS_CAPS" );
        addspace();
        addlefttitle( &"CREDIT_AUDIO" );
        addspacesmall();
        addleftname( &"CREDIT_CHRISSY_ARYA_CAPS" );
        addleftname( &"CREDIT_STEPHEN_MILLER_CAPS" );
        addleftname( &"CREDIT_LINDA_ROSEMEIER_CAPS" );
        addspace();
        addspace();
        addlefttitle( &"CREDIT_WRITTEN_BY" );
        addspacesmall();
        addleftname( &"CREDIT_JESSE_STERN_CAPS" );
        addspace();
        addlefttitle( &"CREDIT_ADDITIONAL_WRITING" );
        addspacesmall();
        addleftname( &"CREDIT_STEVE_FUKUDA_CAPS" );
        addspace();
        addlefttitle( &"CREDIT_STORY_BY" );
        addspacesmall();
        addleftname( &"CREDIT_TODD_ALDERMAN_CAPS" );
        addleftname( &"CREDIT_STEVE_FUKUDA_CAPS" );
        addleftname( &"CREDIT_MACKEY_MCCANDLISH_CAPS" );
        addleftname( &"CREDIT_ZIED_RIEKE_CAPS" );
        addleftname( &"CREDIT_JESSE_STERN_CAPS" );
        addleftname( &"CREDIT_JASON_WEST_CAPS" );
        addspace();
        addspace();
        addlefttitle( &"CREDIT_STUDIO_HEADS" );
        addspacesmall();
        addleftname( &"CREDIT_GRANT_COLLIER_CAPS" );
        addleftname( &"CREDIT_JASON_WEST_CAPS" );
        addleftname( &"CREDIT_VINCE_ZAMPELLA_CAPS" );
        addspace();
        addlefttitle( &"CREDIT_PRODUCER" );
        addspacesmall();
        addleftname( &"CREDIT_MARK_RUBIN_CAPS" );
        addspace();
        addlefttitle( &"CREDIT_ASSOCIATE_PRODUCER" );
        addspacesmall();
        addleftname( &"CREDIT_PETE_BLUMEL_CAPS" );
        addspace();
        addlefttitle( &"CREDIT_OFFICE_MANAGER" );
        addspacesmall();
        addleftname( &"CREDIT_JANICE_TURNER_CAPS" );
        addspace();
        addlefttitle( &"CREDIT_HUMAN_RESOURCES_GENERALIST" );
        addspacesmall();
        addleftname( &"CREDIT_KRISTIN_COTTERELL_CAPS" );
        addspace();
        addlefttitle( &"CREDIT_EXECUTIVE_ASSISTANT" );
        addspacesmall();
        addleftname( &"CREDIT_NICOLE_SCATES_CAPS" );
        addspace();
        addlefttitle( &"CREDIT_ADMINISTRATIVE_ASSISTANT" );
        addspacesmall();
        addleftname( &"CREDIT_CARLY_GILLIS_CAPS" );
        addspace();
        addlefttitle( &"CREDIT_COMMUNITY_RELATIONS_MANAGER" );
        addspacesmall();
        addleftname( &"CREDIT_ROBERT_BOWLING_CAPS" );
        addspace();
        addspace();
        addlefttitle( &"CREDIT_INFORMATION_TECHNOLOGY_LEAD" );
        addspacesmall();
        addleftname( &"CREDIT_BRYAN_KUHN_CAPS" );
        addspace();
        addlefttitle( &"CREDIT_INFORMATION_TECHNOLOGY" );
        addspacesmall();
        addleftname( &"CREDIT_DREW_MCCOY_CAPS" );
        addleftname( &"CREDIT_ALEXANDER_SHARRIGAN_CAPS" );
        addspace();
        addspace();
        addlefttitle( &"CREDIT_QUALITY_ASSURANCE_LEADS" );
        addspacesmall();
        addleftname( &"CREDIT_JEMUEL_GARNETT_CAPS" );
        addleftname( &"CREDIT_ED_HARMER_CAPS" );
        addleftname( &"CREDIT_JUSTIN_HARRIS_CAPS" );
        addspace();
        addlefttitle( &"CREDIT_QUALITY_ASSURANCE" );
        addspacesmall();
        addleftname( &"CREDIT_BRYAN_ANKER_CAPS" );
        addleftname( &"CREDIT_ADRIENNE_ARRASMITH_CAPS" );
        addleftname( &"CREDIT_ESTEVAN_BECERRA_CAPS" );
        addleftname( &"CREDIT_REILLY_CAMPBELL_CAPS" );
        addleftname( &"CREDIT_DIMITRI_DEL_CASTILLO_CAPS" );
        addleftname( &"CREDIT_SHAMENE_CHILDRESS_CAPS" );
        addleftname( &"CREDIT_WILLIAM_CHO_CAPS" );
        addleftname( &"CREDIT_RICHARD_GARCIA_CAPS" );
        addleftname( &"CREDIT_DANIEL_GERMANN_CAPS" );
        addleftname( &"CREDIT_EVAN_HATCH_CAPS" );
        addleftname( &"CREDIT_TAN_LA_CAPS" );
        addleftname( &"CREDIT_RENE_LARA_CAPS" );
        addleftname( &"CREDIT_STEVE_LOUIS_CAPS" );
        addleftname( &"CREDIT_ALEX_MEJIA_CAPS" );
        addleftname( &"CREDIT_MATT_MILLER_CAPS" );
        addleftname( &"CREDIT_CHRISTIAN_MURILLO_CAPS" );
        addleftname( &"CREDIT_GAVIN_NIEBEL_CAPS" );
        addleftname( &"CREDIT_NORMAN_OVANDO_CAPS" );
        addleftname( &"CREDIT_JUAN_RAMIREZ_CAPS" );
        addleftname( &"CREDIT_ROBERT_RITER_CAPS" );
        addleftname( &"CREDIT_BRIAN_ROYCEWICZ_CAPS" );
        addleftname( &"CREDIT_TRISTEN_SAKURADA_CAPS" );
        addleftname( &"CREDIT_KEANE_TANOUYE_CAPS" );
        addleftname( &"CREDIT_JASON_TOM_CAPS" );
        addleftname( &"CREDIT_MAX_VO_CAPS" );
        addleftname( &"CREDIT_BRANDON_WILLIS_CAPS" );
        addspace();
        addspace();
        addlefttitle( &"CREDIT_INTERNS" );
        addspacesmall();
        addleftname( &"CREDIT_MICHAEL_ANDERSON_CAPS" );
        addleftname( &"CREDIT_JASON_BOESCH_CAPS" );
        addleftname( &"CREDIT_ARTURO_CABALLERO_CAPS" );
        addleftname( &"CREDIT_DERRIC_EADY_CAPS" );
        addleftname( &"CREDIT_DANIEL_EDWARDS_CAPS" );
        addleftname( &"CREDIT_ALDRIC_SAUCIER_CAPS" );
        addspace();
        addspace();
        addlefttitle( &"CREDIT_VOICE_TALENT" );
        addspacesmall();
        addleftname( &"CREDIT_BILLY_MURRAY_CAPS" );
        addleftname( &"CREDIT_CRAIG_FAIRBRASS_CAPS" );
        addleftname( &"CREDIT_DAVID_SOBOLOV_CAPS" );
        addleftname( &"CREDIT_MARK_GRIGSBY_CAPS" );
        addleftname( &"CREDIT_ZACH_HANKS_CAPS" );
        addleftname( &"CREDIT_FRED_TOMA_CAPS" );
        addleftname( &"CREDIT_EUGENE_LAZAREB_CAPS" );
        addspace();
        addlefttitle( &"CREDIT_ADDITIONAL_VOICE_TALENT" );
        addspacesmall();
        addleftname( &"CREDIT_GABRIEL_ALRAJHI_CAPS" );
        addleftname( &"CREDIT_SARKIS_ALBERT_CAPS" );
        addleftname( &"CREDIT_DESMOND_ASKEW_CAPS" );
        addleftname( &"CREDIT_DAVID_NEIL_BLACK_CAPS" );
        addleftname( &"CREDIT_MARCUS_COLOMA_CAPS" );
        addleftname( &"CREDIT_MICHAEL_CUDLITZ_CAPS" );
        addleftname( &"CREDIT_GREG_ELLIS_CAPS" );
        addleftname( &"CREDIT_GIDEON_EMERY_CAPS" );
        addleftname( &"CREDIT_JOSH_GILMAN_CAPS" );
        addleftname( &"CREDIT_MICHAEL_GOUGH_CAPS" );
        addleftname( &"CREDIT_ANNA_GRAVES_CAPS" );
        addleftname( &"CREDIT_SVEN_HOLMBERG_CAPS" );
        addleftname( &"CREDIT_MARK_IVANIR_CAPS" );
        addleftname( &"CREDIT_QUENTIN_JONES_CAPS" );
        addleftname( &"CREDIT_ARMANDO_VALDESKENNEDY_CAPS" );
        addleftname( &"CREDIT_BORIS_KIEVSKY_CAPS" );
        addleftname( &"CREDIT_RJ_KNOLL_CAPS" );
        addleftname( &"CREDIT_KRISTOF_KONRAD_CAPS" );
        addleftname( &"CREDIT_DAVE_MALLOW_CAPS" );
        addleftname( &"CREDIT_JORDAN_MARDER_CAPS" );
        addleftname( &"CREDIT_SAM_SAKO_CAPS" );
        addleftname( &"CREDIT_HARRY_VAN_GORKUM_CAPS" );
        addspace();
        addspace();
        addlefttitle( &"CREDIT_MODELS" );
        addspacesmall();
        addleftname( &"CREDIT_MUNEER_ABDELHADI_CAPS" );
        addleftname( &"CREDIT_MOHAMMAD_ALAVI_CAPS" );
        addleftname( &"CREDIT_JESUS_ANGUIANO_CAPS" );
        addleftname( &"CREDIT_CHAD_BAKKE_CAPS" );
        addleftname( &"CREDIT_PETER_CHEN_CAPS" );
        addleftname( &"CREDIT_KEVIN_COLLINS_CAPS" );
        addleftname( &"CREDIT_HUGH_DALY_CAPS" );
        addleftname( &"CREDIT_DERRIC_EADY_CAPS" );
        addleftname( &"CREDIT_SUREN_GAZARYAN_CAPS" );
        addleftname( &"CREDIT_CHAD_GRENIER_CAPS" );
        addleftname( &"CREDIT_MARK_GRIGSBY_CAPS" );
        addleftname( &"CREDIT_JUSTIN_HARRIS_CAPS" );
        addleftname( &"CREDIT_CLIVE_HAWKINS_CAPS" );
        addleftname( &"CREDIT_STEVEN_JONES_CAPS" );
        addleftname( &"CREDIT_DAVID_KLEC_CAPS" );
        addleftname( &"CREDIT_JOSHUA_LACROSSE_CAPS" );
        addleftname( &"CREDIT_RYAN_LASTIMOSA_CAPS" );
        addleftname( &"CREDIT_JAMES_LITTLEJOHN_CAPS" );
        addleftname( &"CREDIT_MACKEY_MCCANDLISH_CAPS" );
        addleftname( &"CREDIT_TOM_MINDER_CAPS" );
        addleftname( &"CREDIT_SAMI_ONUR_CAPS" );
        addleftname( &"CREDIT_VELINDA_PELAYO_CAPS" );
        addleftname( &"CREDIT_MARTIN_RESOAGLI_CAPS" );
        addleftname( &"CREDIT_ZIED_RIEKE_CAPS" );
        addleftname( &"CREDIT_ALEXANDER_ROYCEWICZ_CAPS" );
        addleftname( &"CREDIT_JOSE_RUBEN_AGUILAR_JR_CAPS" );
        addleftname( &"CREDIT_GEOFFREY_SMITH_CAPS" );
        addleftname( &"CREDIT_TODD_SUE_CAPS" );
        addleftname( &"CREDIT_EID_TOLBA_CAPS" );
        addleftname( &"CREDIT_ZACH_VOLKER_CAPS" );
        addleftname( &"CREDIT_JASON_WEST_CAPS" );
        addleftname( &"CREDIT_HENRY_YORK_CAPS" );
        addspace();
        addspace();
    }
    else
    {
        addfunction( maps\simplecredits::music_original_wrapper );
        addoriginalcreditsspacing();
        addcenterimage( "logo_infinityward", 256, 128, 4.375 );
        addspace();
        addspace();
        addspace();
        addspace();
        addcenterdual( &"CREDIT_PROJECT_LEAD", &"CREDIT_JASON_WEST_CAPS" );
        addspace();
        addspace();
        addcenterdual( &"CREDIT_ENGINEERING_LEADS", &"CREDIT_RICHARD_BAKER_CAPS" );
        addcentername( &"CREDIT_ROBERT_FIELD_CAPS" );
        addcentername( &"CREDIT_FRANCESCO_GIGLIOTTI_CAPS" );
        addcentername( &"CREDIT_EARL_HAMMON_JR_CAPS" );
        addspacesmall();
        addcenterdual( &"CREDIT_ENGINEERING", &"CREDIT_CHAD_BARB_CAPS" );
        addcentername( &"CREDIT_ALESSANDRO_BARTOLUCCI_CAPS" );
        addcentername( &"CREDIT_JON_DAVIS_CAPS" );
        addcentername( &"CREDIT_JOEL_GOMPERT_CAPS" );
        addcentername( &"CREDIT_JOHN_HAGGERTY_CAPS" );
        addcentername( &"CREDIT_JON_SHIRING_CAPS" );
        addcentername( &"CREDIT_JIESANG_SONG_CAPS" );
        addcentername( &"CREDIT_RAYME_VINSON_CAPS" );
        addcentername( &"CREDIT_ANDREW_WANG_CAPS" );
        addspace();
        addspace();
        addcenterdual( &"CREDIT_DESIGN_LEADS", &"CREDIT_TODD_ALDERMAN_CAPS" );
        addcentername( &"CREDIT_STEVE_FUKUDA_CAPS" );
        addcentername( &"CREDIT_MACKEY_MCCANDLISH_CAPS" );
        addcentername( &"CREDIT_ZIED_RIEKE_CAPS" );
        addspacesmall();
        addcenterdual( &"CREDIT_DESIGN_AND_SCRIPTING", &"CREDIT_ROGER_ABRAHAMSSON_CAPS" );
        addcentername( &"CREDIT_MOHAMMAD_ALAVI_CAPS" );
        addcentername( &"CREDIT_KEITH_BELL_CAPS" );
        addcentername( &"CREDIT_PRESTON_GLENN_CAPS" );
        addcentername( &"CREDIT_CHAD_GRENIER_CAPS" );
        addcentername( &"CREDIT_JAKE_KEATING_CAPS" );
        addcentername( &"CREDIT_JULIAN_LUO_CAPS" );
        addcentername( &"CREDIT_STEVE_MASSEY_CAPS" );
        addcentername( &"CREDIT_BRENT_MCLEOD_CAPS" );
        addcentername( &"CREDIT_JON_PORTER_CAPS" );
        addcentername( &"CREDIT_ALEXANDER_ROYCEWICZ_CAPS" );
        addcentername( &"CREDIT_NATHAN_SILVERS_CAPS" );
        addcentername( &"CREDIT_GEOFFREY_SMITH_CAPS" );
        addspace();
        addspace();
        addcenterdual( &"CREDIT_ART_DIRECTOR", &"CREDIT_RICHARD_KRIEGLER_CAPS" );
        addspacesmall();
        addcenterdual( &"CREDIT_TECHNICAL_ART_DIRECTOR", &"CREDIT_MICHAEL_BOON_CAPS" );
        addspacesmall();
        addcenterdual( &"CREDIT_ART_LEADS", &"CREDIT_CHRIS_CHERUBINI_CAPS" );
        addcentername( &"CREDIT_JOEL_EMSLIE_CAPS" );
        addcentername( &"CREDIT_ROBERT_GAINES_CAPS" );
        addspacesmall();
        addcenterdual( &"CREDIT_ART", &"CREDIT_BRAD_ALLEN_CAPS" );
        addcentername( &"CREDIT_PETER_CHEN_CAPS" );
        addcentername( &"CREDIT_JEFF_HEATH_CAPS" );
        addcentername( &"CREDIT_RYAN_LASTIMOSA_CAPS" );
        addcentername( &"CREDIT_OSCAR_LOPEZ_CAPS" );
        addcentername( &"CREDIT_HERBERT_LOWIS_CAPS" );
        addcentername( &"CREDIT_TAEHOON_OH_CAPS" );
        addcentername( &"CREDIT_SAMI_ONUR_CAPS" );
        addcentername( &"CREDIT_VELINDA_PELAYO_CAPS" );
        addcentername( &"CREDIT_RICHARD_SMITH_CAPS" );
        addcentername( &"CREDIT_THEERAPOL_SRISUPHAN_CAPS" );
        addcentername( &"CREDIT_TODD_SUE_CAPS" );
        addcentername( &"CREDIT_SOMPOOM_TANGCHUPONG_CAPS" );
        addspace();
        addspace();
        addcenterdual( &"CREDIT_ANIMATION_LEADS", &"CREDIT_MARK_GRIGSBY_CAPS" );
        addcentername( &"CREDIT_PAUL_MESSERLY_CAPS" );
        addspacesmall();
        addcenterdual( &"CREDIT_ANIMATION", &"CREDIT_CHANCE_GLASCO_CAPS" );
        addcentername( &"CREDIT_EMILY_RULE_CAPS" );
        addcentername( &"CREDIT_ZACH_VOLKER_CAPS" );
        addcentername( &"CREDIT_LEI_YANG_CAPS" );
        addspace();
        addspace();
        addcenterdual( &"CREDIT_TECHNICAL_ANIMATION_LEAD", &"CREDIT_ERIC_PIERCE_CAPS" );
        addspacesmall();
        addcenterdual( &"CREDIT_TECHNICAL_ANIMATION", &"CREDIT_NEEL_KAR_CAPS" );
        addcentername( &"CREDIT_CHENG_LOR_CAPS" );
        addspace();
        addspace();
        addcenterdual( &"CREDIT_AUDIO_LEAD", &"CREDIT_MARK_GANUS_CAPS" );
        addspacesmall();
        addcenterdual( &"CREDIT_AUDIO", &"CREDIT_CHRISSY_ARYA_CAPS" );
        addcentername( &"CREDIT_STEPHEN_MILLER_CAPS" );
        addcentername( &"CREDIT_LINDA_ROSEMEIER_CAPS" );
        addspace();
        addspace();
        addcenterdual( &"CREDIT_WRITTEN_BY", &"CREDIT_JESSE_STERN_CAPS" );
        addspacesmall();
        addcenterdual( &"CREDIT_ADDITIONAL_WRITING", &"CREDIT_STEVE_FUKUDA_CAPS" );
        addspacesmall();
        addcenterdual( &"CREDIT_STORY_BY", &"CREDIT_TODD_ALDERMAN_CAPS" );
        addcentername( &"CREDIT_STEVE_FUKUDA_CAPS" );
        addcentername( &"CREDIT_MACKEY_MCCANDLISH_CAPS" );
        addcentername( &"CREDIT_ZIED_RIEKE_CAPS" );
        addcentername( &"CREDIT_JESSE_STERN_CAPS" );
        addcentername( &"CREDIT_JASON_WEST_CAPS" );
        addspace();
        addspace();
        addcenterdual( &"CREDIT_STUDIO_HEADS", &"CREDIT_GRANT_COLLIER_CAPS" );
        addcentername( &"CREDIT_JASON_WEST_CAPS" );
        addcentername( &"CREDIT_VINCE_ZAMPELLA_CAPS" );
        addspacesmall();
        addcenterdual( &"CREDIT_PRODUCER", &"CREDIT_MARK_RUBIN_CAPS" );
        addspacesmall();
        addcenterdual( &"CREDIT_ASSOCIATE_PRODUCER", &"CREDIT_PETE_BLUMEL_CAPS" );
        addspacesmall();
        addcenterdual( &"CREDIT_OFFICE_MANAGER", &"CREDIT_JANICE_TURNER_CAPS" );
        addspacesmall();
        addcenterdual( &"CREDIT_HUMAN_RESOURCES_GENERALIST", &"CREDIT_KRISTIN_COTTERELL_CAPS" );
        addspacesmall();
        addcenterdual( &"CREDIT_EXECUTIVE_ASSISTANT", &"CREDIT_NICOLE_SCATES_CAPS" );
        addspacesmall();
        addcenterdual( &"CREDIT_ADMINISTRATIVE_ASSISTANT", &"CREDIT_CARLY_GILLIS_CAPS" );
        addspacesmall();
        addcenterdual( &"CREDIT_COMMUNITY_RELATIONS_MANAGER", &"CREDIT_ROBERT_BOWLING_CAPS" );
        addspace();
        addspace();
        addcenterdual( &"CREDIT_INFORMATION_TECHNOLOGY_LEAD", &"CREDIT_BRYAN_KUHN_CAPS" );
        addspacesmall();
        addcenterdual( &"CREDIT_INFORMATION_TECHNOLOGY", &"CREDIT_DREW_MCCOY_CAPS" );
        addcentername( &"CREDIT_ALEXANDER_SHARRIGAN_CAPS" );
        addspace();
        addspace();
        addcenterdual( &"CREDIT_QUALITY_ASSURANCE_LEADS", &"CREDIT_JEMUEL_GARNETT_CAPS" );
        addcentername( &"CREDIT_ED_HARMER_CAPS" );
        addcentername( &"CREDIT_JUSTIN_HARRIS_CAPS" );
        addspacesmall();
        addcenterdual( &"CREDIT_QUALITY_ASSURANCE", &"CREDIT_BRYAN_ANKER_CAPS" );
        addcentername( &"CREDIT_ADRIENNE_ARRASMITH_CAPS" );
        addcentername( &"CREDIT_ESTEVAN_BECERRA_CAPS" );
        addcentername( &"CREDIT_REILLY_CAMPBELL_CAPS" );
        addcentername( &"CREDIT_DIMITRI_DEL_CASTILLO_CAPS" );
        addcentername( &"CREDIT_SHAMENE_CHILDRESS_CAPS" );
        addcentername( &"CREDIT_WILLIAM_CHO_CAPS" );
        addcentername( &"CREDIT_RICHARD_GARCIA_CAPS" );
        addcentername( &"CREDIT_DANIEL_GERMANN_CAPS" );
        addcentername( &"CREDIT_EVAN_HATCH_CAPS" );
        addcentername( &"CREDIT_TAN_LA_CAPS" );
        addcentername( &"CREDIT_RENE_LARA_CAPS" );
        addcentername( &"CREDIT_STEVE_LOUIS_CAPS" );
        addcentername( &"CREDIT_ALEX_MEJIA_CAPS" );
        addcentername( &"CREDIT_MATT_MILLER_CAPS" );
        addcentername( &"CREDIT_CHRISTIAN_MURILLO_CAPS" );
        addcentername( &"CREDIT_GAVIN_NIEBEL_CAPS" );
        addcentername( &"CREDIT_NORMAN_OVANDO_CAPS" );
        addcentername( &"CREDIT_JUAN_RAMIREZ_CAPS" );
        addcentername( &"CREDIT_ROBERT_RITER_CAPS" );
        addcentername( &"CREDIT_BRIAN_ROYCEWICZ_CAPS" );
        addcentername( &"CREDIT_TRISTEN_SAKURADA_CAPS" );
        addcentername( &"CREDIT_KEANE_TANOUYE_CAPS" );
        addcentername( &"CREDIT_JASON_TOM_CAPS" );
        addcentername( &"CREDIT_MAX_VO_CAPS" );
        addcentername( &"CREDIT_BRANDON_WILLIS_CAPS" );
        addspace();
        addspace();
        addcenterdual( &"CREDIT_INTERNS", &"CREDIT_MICHAEL_ANDERSON_CAPS" );
        addcentername( &"CREDIT_JASON_BOESCH_CAPS" );
        addcentername( &"CREDIT_ARTURO_CABALLERO_CAPS" );
        addcentername( &"CREDIT_DERRIC_EADY_CAPS" );
        addcentername( &"CREDIT_DANIEL_EDWARDS_CAPS" );
        addcentername( &"CREDIT_ALDRIC_SAUCIER_CAPS" );
        addspace();
        addspace();
        addcenterdual( &"CREDIT_VOICE_TALENT", &"CREDIT_BILLY_MURRAY_CAPS" );
        addcentername( &"CREDIT_CRAIG_FAIRBRASS_CAPS" );
        addcentername( &"CREDIT_DAVID_SOBOLOV_CAPS" );
        addcentername( &"CREDIT_MARK_GRIGSBY_CAPS" );
        addcentername( &"CREDIT_ZACH_HANKS_CAPS" );
        addcentername( &"CREDIT_FRED_TOMA_CAPS" );
        addcentername( &"CREDIT_EUGENE_LAZAREB_CAPS" );
        addspacesmall();
        addcenterdual( &"CREDIT_ADDITIONAL_VOICE_TALENT", &"CREDIT_GABRIEL_ALRAJHI_CAPS" );
        addcentername( &"CREDIT_SARKIS_ALBERT_CAPS" );
        addcentername( &"CREDIT_DESMOND_ASKEW_CAPS" );
        addcentername( &"CREDIT_DAVID_NEIL_BLACK_CAPS" );
        addcentername( &"CREDIT_MARCUS_COLOMA_CAPS" );
        addcentername( &"CREDIT_MICHAEL_CUDLITZ_CAPS" );
        addcentername( &"CREDIT_GREG_ELLIS_CAPS" );
        addcentername( &"CREDIT_GIDEON_EMERY_CAPS" );
        addcentername( &"CREDIT_JOSH_GILMAN_CAPS" );
        addcentername( &"CREDIT_MICHAEL_GOUGH_CAPS" );
        addcentername( &"CREDIT_ANNA_GRAVES_CAPS" );
        addcentername( &"CREDIT_SVEN_HOLMBERG_CAPS" );
        addcentername( &"CREDIT_MARK_IVANIR_CAPS" );
        addcentername( &"CREDIT_QUENTIN_JONES_CAPS" );
        addcentername( &"CREDIT_ARMANDO_VALDESKENNEDY_CAPS" );
        addcentername( &"CREDIT_BORIS_KIEVSKY_CAPS" );
        addcentername( &"CREDIT_RJ_KNOLL_CAPS" );
        addcentername( &"CREDIT_KRISTOF_KONRAD_CAPS" );
        addcentername( &"CREDIT_DAVE_MALLOW_CAPS" );
        addcentername( &"CREDIT_JORDAN_MARDER_CAPS" );
        addcentername( &"CREDIT_SAM_SAKO_CAPS" );
        addcentername( &"CREDIT_HARRY_VAN_GORKUM_CAPS" );
        addspace();
        addspace();
        addcenterdual( &"CREDIT_MODELS", &"CREDIT_MUNEER_ABDELHADI_CAPS" );
        addcentername( &"CREDIT_MOHAMMAD_ALAVI_CAPS" );
        addcentername( &"CREDIT_JESUS_ANGUIANO_CAPS" );
        addcentername( &"CREDIT_CHAD_BAKKE_CAPS" );
        addcentername( &"CREDIT_PETER_CHEN_CAPS" );
        addcentername( &"CREDIT_KEVIN_COLLINS_CAPS" );
        addcentername( &"CREDIT_HUGH_DALY_CAPS" );
        addcentername( &"CREDIT_DERRIC_EADY_CAPS" );
        addcentername( &"CREDIT_SUREN_GAZARYAN_CAPS" );
        addcentername( &"CREDIT_CHAD_GRENIER_CAPS" );
        addcentername( &"CREDIT_MARK_GRIGSBY_CAPS" );
        addcentername( &"CREDIT_JUSTIN_HARRIS_CAPS" );
        addcentername( &"CREDIT_CLIVE_HAWKINS_CAPS" );
        addcentername( &"CREDIT_STEVEN_JONES_CAPS" );
        addcentername( &"CREDIT_DAVID_KLEC_CAPS" );
        addcentername( &"CREDIT_JOSHUA_LACROSSE_CAPS" );
        addcentername( &"CREDIT_RYAN_LASTIMOSA_CAPS" );
        addcentername( &"CREDIT_JAMES_LITTLEJOHN_CAPS" );
        addcentername( &"CREDIT_MACKEY_MCCANDLISH_CAPS" );
        addcentername( &"CREDIT_TOM_MINDER_CAPS" );
        addcentername( &"CREDIT_SAMI_ONUR_CAPS" );
        addcentername( &"CREDIT_VELINDA_PELAYO_CAPS" );
        addcentername( &"CREDIT_MARTIN_RESOAGLI_CAPS" );
        addcentername( &"CREDIT_ZIED_RIEKE_CAPS" );
        addcentername( &"CREDIT_ALEXANDER_ROYCEWICZ_CAPS" );
        addcentername( &"CREDIT_JOSE_RUBEN_AGUILAR_JR_CAPS" );
        addcentername( &"CREDIT_GEOFFREY_SMITH_CAPS" );
        addcentername( &"CREDIT_TODD_SUE_CAPS" );
        addcentername( &"CREDIT_EID_TOLBA_CAPS" );
        addcentername( &"CREDIT_ZACH_VOLKER_CAPS" );
        addcentername( &"CREDIT_JASON_WEST_CAPS" );
        addcentername( &"CREDIT_HENRY_YORK_CAPS" );
        addspace();
        addspace();
    }

    addcenterheading( &"CREDIT_ORIGINAL_SCORE" );
    addspacesmall();
    addcenterdual( &"CREDIT_THEME_BY", &"CREDIT_HARRY_GREGSONWILLIAMS_CAPS" );
    addspacesmall();
    addcenterdual( &"CREDIT_PRODUCED_BY", &"CREDIT_HARRY_GREGSONWILLIAMS_CAPS" );
    addspacesmall();
    addcenterdual( &"CREDIT_MUSIC_BY", &"CREDIT_STEPHEN_BARTON_CAPS" );
    addspacesmall();
    addcenterdual( &"CREDIT_SCORE_SUPERVISOR", &"CREDIT_ALLISON_WRIGHT_CLARK_CAPS" );
    addspacesmall();
    addcenterdual( &"CREDIT_AMBIENT_MUSIC_DESIGN", &"CREDIT_MEL_WESSON_CAPS" );
    addspacesmall();
    addcenterdual( &"CREDIT_SCORE_PERFORMED_BY", &"CREDIT_THE_LONDON_SESSION_ORCHESTRA_CAPS" );
    addspacesmall();
    addcenterdual( &"CREDIT_SCORING_ENGINEER", &"CREDIT_JONATHAN_ALLEN_CAPS" );
    addspacesmall();
    addcenterdual( &"CREDIT_SCORING_MIXER", &"CREDIT_MALCOLM_LUKER_CAPS" );
    addspacesmall();
    addcenterdual( &"CREDIT_PROTOOLS_ENGINEERS", &"CREDIT_JAMIE_LUKER_CAPS" );
    addcentername( &"CREDIT_SCRAP_MARSHALL_CAPS" );
    addspacesmall();
    addcenterdual( &"CREDIT_ORCHESTRA_CONTRACTORS", &"CREDIT_ISOBEL_GRIFFITHS_CAPS" );
    addcentername( &"CREDIT_CHARLOTTE_MATTHEWS_CAPS" );
    addcentername( &"CREDIT_TODD_STANTON_CAPS" );
    addspacesmall();
    addcenterdual( &"CREDIT_ORCHESTRATIONS_BY", &"CREDIT_DAVID_BUCKLEY_CAPS" );
    addcentername( &"CREDIT_STEPHEN_BARTON_CAPS" );
    addcentername( &"CREDIT_LADD_MCINTOSH_CAPS" );
    addcentername( &"CREDIT_HALLI_CAUTHERY_CAPS" );
    addspacesmall();
    addcenterdual( &"CREDIT_COPYISTS", &"CREDIT_ANN_MILLER_CAPS" );
    addcentername( &"CREDIT_TED_MILLER_CAPS" );
    addspacesmall();
    addcenterdual( &"CREDIT_STRING_OVERDUBS_BY", &"CREDIT_THE_CZECH_PHILHARMONIC_CAPS" );
    addspacesmall();
    addcenterdual( &"CREDIT_ARTISTIC_DIRECTOR", &"CREDIT_PAVEL_PRANTL_CAPS" );
    addspacesmall();
    addcenterdual( &"CREDIT_GUITARS", &"CREDIT_COSTA_KOTSELAS_CAPS" );
    addcentername( &"CREDIT_PETER_DISTEFANO_CAPS" );
    addcentername( &"CREDIT_JOHN_PARRICELLI_CAPS" );
    addcentername( &"CREDIT_TOBY_CHU_CAPS" );
    addspacesmall();
    addcenterdual( &"CREDIT_ELECTRIC_VIOLIN", &"CREDIT_HUGH_MARSH_CAPS" );
    addspacesmall();
    addcenterdual( &"CREDIT_OUD_BOUZOUKI", &"CREDIT_STUART_HALL_CAPS" );
    addspacesmall();
    addcenterdual( &"CREDIT_HURDY_GURDY", &"CREDIT_NICHOLAS_PERRY" );
    addspacesmall();
    addcenterdual( &"CREDIT_HORN_SOLOS", &"CREDIT_RICHARD_WATKINS_CAPS" );
    addspacesmall();
    addcenterdual( &"CREDIT_PERCUSSION", &"CREDIT_FRANK_RICOTTI_CAPS" );
    addcentername( &"CREDIT_GARY_KETTEL_CAPS" );
    addcentername( &"CREDIT_PAUL_CLARVIS_CAPS" );
    addspace();
    addcenterheading( &"CREDIT_SCORE_RECORDED_AT_ABBEY" );
    addspacesmall();
    addcenterheading( &"CREDIT_MUSIC_MIXED_AT_THE_BLUE" );
    addspace();
    addspace();
    addcenterdual( &"CREDIT_MILITARY_TECHNICAL_ADVISORS", &"CREDIT_LT_COL_HANK_KEIRSEY_US" );
    addcentername( &"CREDIT_MAJ_KEVIN_COLLINS_USMC" );
    addcentername( &"CREDIT_EMILIO_CUESTA_USMC_CAPS" );
    addcentername( &"CREDIT_SGT_MAJ_JAMES_DEVER_1" );
    addcentername( &"CREDIT_M_SGT_TOM_MINDER_1_FORCE" );
    addspace();
    addspace();
    addcenterdual( &"CREDIT_SOUND_EFFECTS_RECORDING", &"CREDIT_JOHN_FASAL_CAPS" );
    addspacesmall();
    addcenterdual( &"CREDIT_VIDEO_EDITING", &"CREDIT_PETE_BLUMEL_CAPS" );
    addcentername( &"CREDIT_DREW_MCCOY_CAPS" );
    addspacesmall();
    addcenterdual( &"CREDIT_ADDITIONAL_DESIGN_AND", &"CREDIT_BRIAN_GILMAN_CAPS" );
    addspacesmall();
    addcenterdual( &"CREDIT_ADDITIONAL_ART", &"CREDIT_ANDREW_CLARK_CAPS" );
    addcentername( &"CREDIT_JAVIER_OJEDA_CAPS" );
    addcentername( &"CREDIT_JIWON_SON_CAPS" );
    addspace();
    addspace();
    addcenterheading( &"CREDIT_TRANSLATIONS" );
    addspacesmall();
    addcenterheading( &"CREDIT_APPLIED_LANGUAGES" );
    addcenterheading( &"CREDIT_WORLD_LINGO" );
    addcenterheading( &"CREDIT_UNIQUE_ARTISTS" );
    addspace();
    addspace();
    addcenterheading( &"CREDIT_WEAPON_ARMORERS_AND_RANGE" );
    addspacesmall();
    addcenterheading( &"CREDIT_GIBBONS_LTD" );
    addcenterheading( &"CREDIT_LONG_MOUNTAIN_OUTFITTERS" );
    addcenterheading( &"CREDIT_BOB_MAUPIN_RANCH" );
    addspace();
    addspace();
    addcenterheading( &"CREDIT_ADDITIONAL_PROGRAMMING_DEMONWARE" );
    addspacesmall();
    addcenternamedouble( &"CREDIT_SEAN_BLANCHFIELD_CAPS", &"CREDIT_MORGAN_BRICKLEY_CAPS" );
    addcenternamedouble( &"CREDIT_DYLAN_COLLINS_CAPS", &"CREDIT_MICHAEL_COLLINS_CAPS" );
    addcenternamedouble( &"CREDIT_MALCOLM_DOWSE_CAPS", &"CREDIT_STEFFEN_HIGELS_CAPS" );
    addcenternamedouble( &"CREDIT_TONY_KELLY_CAPS", &"CREDIT_JOHN_KIRK_CAPS" );
    addcenternamedouble( &"CREDIT_CRAIG_MCINNES_CAPS", &"CREDIT_ALEX_MONTGOMERY_CAPS" );
    addcenternamedouble( &"CREDIT_EOIN_OFEARGHAIL_CAPS", &"CREDIT_RUAIDHRI_POWER_CAPS" );
    addcenternamedouble( &"CREDIT_TILMAN_SCHAFER_CAPS", &"CREDIT_AMY_SMITH_CAPS" );
    addcenternamedouble( &"CREDIT_EMMANUEL_STONE_CAPS", &"CREDIT_ROB_SYNNOTT_CAPS" );
    addcenternamedouble( &"CREDIT_VLAD_TITOV_CAPS", &"" );
    addspace();
    addspace();
    addcenterheading( &"CREDIT_ADDITIONAL_ART_PROVIDED_ANT_FARM" );
    addspacesmall();
    addcenterdual( &"CREDIT_PRODUCER", &"CREDIT_SCOTT_CARSON_CAPS" );
    addspacesmall();
    addcenterdual( &"CREDIT_SENIOR_EDITOR", &"CREDIT_SCOTT_COOKSON_CAPS" );
    addspacesmall();
    addcenterdual( &"CREDIT_ASSOCIATE_PRODUCER", &"CREDIT_SETH_HENDRIX_CAPS" );
    addspacesmall();
    addcenterdual( &"CREDIT_EXECUTIVE_CREATIVE_DIRECTORS", &"CREDIT_LISA_RIZNIKOVE_CAPS" );
    addcentername( &"CREDIT_ROB_TROY_CAPS" );
    addspace();
    addspace();
    addcenterheading( &"CREDIT_VOICE_RECORDING_FACILITIES" );
    addspacesmall();
    addcenterheading( &"CREDIT_PCB_PRODUCTIONS" );
    addcenterheading( &"CREDIT_SIDEUK" );
    addspacesmall();
    addcenterdual( &"CREDIT_VOICE_DIRECTIONDIALOG", &"CREDIT_KEITH_AREM_CAPS" );
    addspacesmall();
    addcenterdual( &"CREDIT_ADDITIONAL_DIALOG_ENGINEERING", &"CREDIT_ANT_HALES_CAPS" );
    addspacesmall();
    addcenterdual( &"CREDIT_ADDITIONAL_VOICE_DIRECTION", &"CREDIT_STEVE_FUKUDA_CAPS" );
    addcentername( &"CREDIT_MACKEY_MCCANDLISH_CAPS" );
    addspace();
    addspace();
    addcenterheading( &"CREDIT_MOTION_CAPTURE_PROVIDED" );
    addspacesmall();
    addcenterdual( &"CREDIT_MOTION_CAPTURE_LEAD", &"CREDIT_KRISTINA_ADELMEYER_CAPS" );
    addspacesmall();
    addcenterdual( &"CREDIT_MOTION_CAPTURE_TECHNICIANS", &"CREDIT_KRISTIN_GALLAGHER_CAPS" );
    addcentername( &"CREDIT_JEFF_SWENTY_CAPS" );
    addspacesmall();
    addcenterdual( &"CREDIT_MOTION_CAPTURE_INTERN", &"CREDIT_JORGE_LOPEZ_CAPS" );
    addspace();
    addspace();
    addcenterheading( &"CREDIT_STUNT_ACTION_DESIGNED" );
    addspacesmall();
    addcenterdual( &"CREDIT_STUNT_COORDINATOR", &"CREDIT_DANNY_HERNANDEZ_CAPS" );
    addspacesmall();
    addcenterdual( &"CREDIT_STUNTSMOTION_CAPTURE", &"CREDIT_ROBERT_ALONSO_CAPS" );
    addcentername( &"CREDIT_DANNY_HERNANDEZ_CAPS" );
    addcentername( &"CREDIT_ALLEN_JO_CAPS" );
    addcentername( &"CREDIT_DAVID_LEITCH_CAPS" );
    addcentername( &"CREDIT_MIKE_MUKATIS_CAPS" );
    addcentername( &"CREDIT_RYAN_WATSON_CAPS" );
    addspace();
    addspace();
    addcenterheading( &"CREDIT_CINEMATIC_MOVIES_PROVIDED" );
    addspace();
    addcenterheading( &"CREDIT_VEHICLES_PROVIDED_BY" );
    addspace();

    if ( !level.console )
    {
        addcenterheading( &"CREDIT_ADDITIONAL_PROGRAMMING_EVEN_BALANCE" );
        addspace();
    }

    addcenterheading( &"CREDIT_ADDITIONAL_ART_PROVIDED" );
    addspace();
    addcenterheading( &"CREDIT_ADDITIONAL_SOUND_DESIGN" );
    addspace();
    addcenterheading( &"CREDIT_ADDITIONAL_AUDIO_ENGINEERING_DIGITAL_SYNAPSE" );
    addspace();
    addspace();
    addcenterheading( &"CREDIT_PRODUCTION_BABIES" );
    addspacesmall();
    addcenterheading( &"CREDIT_BABY_COLIN_ALDERMAN" );
    addcenterheading( &"CREDIT_BABY_LUKE_SMITH" );
    addcenterheading( &"CREDIT_BABY_JOHN_GALT_WEST_JACK" );
    addcenterheading( &"CREDIT_BABY_COURTNEY_ZAMPELLA" );
    addspace();
    addspace();
    addcenterheading( &"CREDIT_INFINITY_WARD_SPECIAL" );
    addspacesmall();
    addcenterheading( &"CREDIT_USMC_PUBLIC_AFFAIRS_OFFICE" );
    addcenterheading( &"CREDIT_USMC_1ST_TANK_BATTALION" );
    addcenterheading( &"CREDIT_MARINE_LIGHT_ATTACK_HELICOPTER" );
    addcenterheading( &"CREDIT_USMC_5TH_BATTALION_14TH" );
    addcenterheading( &"CREDIT_ARMY_1ST_CAVALRY_DIVISION" );
    addspace();
    addcenternamedouble( &"CREDIT_DAVE_DOUGLAS_CAPS", &"CREDIT_DAVID_FALICKI_CAPS" );
    addcenternamedouble( &"CREDIT_ROCK_GALLOTTI_CAPS", &"CREDIT_MICHAEL_GIBBONS_CAPS" );
    addcenternamedouble( &"CREDIT_LAWRENCE_GREEN_CAPS", &"CREDIT_ANDREW_HOFFACKER_CAPS" );
    addcenternamedouble( &"CREDIT_JD_KEIRSEY_CAPS", &"CREDIT_ROBERT_MAUPIN_CAPS" );
    addcenternamedouble( &"CREDIT_BRIAN_MAYNARD_CAPS", &"CREDIT_LARRY_ZANOFF_CAPS" );
    addcenternamedouble( &"CREDIT_CALEB_BARNHART_CAPS", &"CREDIT_JOHN_BUDD_CAPS" );
    addcenternamedouble( &"CREDIT_SCOTT_CARPENTER_CAPS", &"CREDIT_JOSHUA_CARRILLO_CAPS" );
    addcenternamedouble( &"CREDIT_DAVID_COFFEY_CAPS", &"CREDIT_CHRISTOPHER_DARE_CAPS" );
    addcenternamedouble( &"CREDIT_NICK_DUNCAN_CAPS", &"CREDIT_JOSE_GO_JR_CAPS" );
    addcenternamedouble( &"CREDIT_JEREMY_HULL_CAPS", &"CREDIT_GORDON_JAMES_CAPS" );
    addcenternamedouble( &"CREDIT_STEVEN_JONES_CAPS", &"CREDIT_MICHAEL_LISCOTTI_CAPS" );
    addcenternamedouble( &"CREDIT_STEPHANIE_MARTINEZ_CAPS", &"CREDIT_C_ANTHONY_MARQUEZ_CAPS" );
    addcenternamedouble( &"CREDIT_CODY_MAUTER_CAPS", &"CREDIT_JOSEPH_MCCREARY_CAPS" );
    addcenternamedouble( &"CREDIT_GREG_MESSINGER_CAPS", &"CREDIT_MICHAEL_RETZLAFF_CAPS" );
    addcenternamedouble( &"CREDIT_ANGEL_SANCHEZ_CAPS", &"CREDIT_KYLE_SMITH_CAPS" );
    addcenternamedouble( &"CREDIT_ALAN_STERN_CAPS", &"CREDIT_ANGEL_TORRES_CAPS" );
    addcenternamedouble( &"CREDIT_OSCAR_VILLAMOR", &"CREDIT_LARRY_ZENG_CAPS" );
    addspace();
    addspace();
    addspace();
    addspace();
}

initactivisioncredits()
{
    addcenterimage( "logo_activision", 256, 128, 3.875 );
    addspace();
    addspace();
    addspace();
    addspace();
    addcenterheading( &"CREDIT_PRODUCTION" );
    addspacesmall();
    addcenterdual( &"CREDIT_PRODUCER", &"CREDIT_SAM_NOURIANI_CAPS" );
    addspacesmall();
    addcenterdual( &"CREDIT_ASSOCIATE_PRODUCERS", &"CREDIT_NEVEN_DRAVINSKI_CAPS" );
    addcentername( &"CREDIT_DEREK_RACCA_CAPS" );
    addspacesmall();
    addcenterdual( &"CREDIT_PRODUCTION_COORDINATORS", &"CREDIT_RHETT_CHASSEREAU_CAPS" );
    addcentername( &"CREDIT_VINCENT_FENNEL_CAPS" );
    addcentername( &"CREDIT_ANDREW_HOFFACKER_CAPS" );
    addspacesmall();
    addcenterdual( &"CREDIT_PRODUCTION_TESTER", &"CREDIT_WINYAN_JAMES_CAPS" );
    addspacesmall();
    addcenterdual( &"CREDIT_PRODUCTION_INTERN", &"CREDIT_JACOB_THOMPSON_CAPS" );
    addspacesmall();
    addcenterdual( &"CREDIT_EXECUTIVE_PRODUCER", &"CREDIT_MARCUS_IREMONGER_CAPS" );
    addspacesmall();
    addcenterdual( &"CREDIT_VICE_PRESIDENT_PRODUCTION", &"CREDIT_STEVE_ACKRICH_CAPS" );
    addcentername( &"CREDIT_THAINE_LYMAN_CAPS" );
    addspacesmall();
    addcenterdual( &"CREDIT_HEAD_OF_PRODUCTION", &"CREDIT_LAIRD_MALAMED_CAPS" );
    addspace();
    addspace();
    addcenterheading( &"CREDIT_GLOBAL_BRAND_MANAGEMENT" );
    addspacesmall();
    addcenterdual( &"CREDIT_SENIOR_BRAND_MANAGER", &"CREDIT_TABITHA_HAYES_CAPS" );
    addspacesmall();
    addcenterdual( &"CREDIT_ASSOCIATE_BRAND_MANAGER", &"CREDIT_JON_DELODDER_CAPS" );
    addspacesmall();
    addcenterdual( &"CREDIT_MARKETING_ASSOCIATE", &"CREDIT_MIKE_RUDIN_CAPS" );
    addspacesmall();
    addcenterdual( &"CREDIT_DIRECTOR_GLOBAL_BRAND_MANAGEMENT", &"CREDIT_TOM_SILK_CAPS" );
    addspace();
    addspace();
    addcenterheading( &"CREDIT_PUBLIC_RELATIONS" );
    addspacesmall();
    addcenterdual( &"CREDIT_SENIOR_PR_MANAGER", &"CREDIT_MIKE_MANTARRO_CAPS" );
    addspacesmall();
    addcenterdual( &"CREDIT_SENIOR_PUBLICIST", &"CREDIT_KATHY_BRICAUD_CAPS" );
    addspacesmall();
    addcenterdual( &"CREDIT_JUNIOR_PUBLICIST", &"CREDIT_ROBERT_TAYLOR_CAPS" );
    addspacesmall();
    addcenterdual( &"CREDIT_SENIOR_PR_DIRECTOR", &"CREDIT_MICHELLE_SCHRODER_CAPS" );
    addspacesmall();
    addcenterdual( &"CREDIT_EUROPEAN_PR_DIRECTOR", &"CREDIT_TIM_PONTING_CAPS" );
    addspacesmall();
    addcenterdual( &"CREDIT_STEP_3", &"CREDIT_WIEBKE_HESS_CAPS" );
    addcentername( &"CREDIT_JON_LENAWAY_CAPS" );
    addcentername( &"CREDIT_NEIL_WOOD_CAPS" );
    addspace();
    addspace();
    addcenterheading( &"CREDIT_CENTRAL_LOCALIZATIONS" );
    addspacesmall();
    addcenterdual( &"CREDIT_DIRECTOR_OF_PRODUCTION", &"CREDIT_BARRY_KEHOE_CAPS" );
    addspacesmall();
    addcenterdual( &"CREDIT_SENIOR_LOCALIZATION_PROJECT", &"CREDIT_FIONA_EBBS_CAPS" );
    addspacesmall();
    addcenterdual( &"CREDIT_LOCALIZATION_CONSULTANT", &"CREDIT_STEPHANIE_OMALLEY_DEMING_CAPS" );
    addspacesmall();
    addcenterdual( &"CREDIT_LOCALIZATION_COORDINATOR", &"CREDIT_CHRIS_OSBERG_CAPS" );
    addspacesmall();
    addcenterdual( &"CREDIT_LOCALIZATION_ENGINEER", &"CREDIT_PHIL_COUNIHAN_CAPS" );
    addspacesmall();
    addcenterdual( &"CREDIT_BRAND_MANAGER_EUROPE", &"CREDIT_STEFAN_SEIDEL_CAPS" );
    addspace();
    addcenterheading( &"CREDIT_LOCALIZATION_TOOLS" );
    addspace();
    addspace();
    addcenterheading( &"CREDIT_MARKETING_COMMUNICATIONS" );
    addspacesmall();
    addcenterdual( &"CREDIT_VICE_PRESIDENT_OF_MARKETING", &"CREDIT_DENISE_WALSH_CAPS" );
    addspacesmall();
    addcenterdual( &"CREDIT_DIRECTOR_OF_MARKETING", &"CREDIT_SUSAN_HALLOCK_CAPS" );
    addspacesmall();
    addcenterdual( &"CREDIT_MARKETING_COMMUNICATIONS_MANAGER", &"CREDIT_KAREN_STARR_CAPS" );
    addspacesmall();
    addcenterdual( &"CREDIT_MARKETING_COMMUNICATIONS_COORDINATOR", &"CREDIT_KRISTINA_JOLLY_CAPS" );
    addspace();
    addspace();
    addcenterheading( &"CREDIT_BUSINESS_AND_LEGAL_AFFAIRS" );
    addspacesmall();
    addcenterdual( &"CREDIT_DIRECTOR_GOVERNMENT_AND", &"CREDIT_PHIL_TERZIAN_CAPS" );
    addspacesmall();
    addcenterdual( &"CREDIT_TRANSACTIONAL_ATTORNEY", &"CREDIT_TRAVIS_STANSBURY_CAPS" );
    addspacesmall();
    addcenterdual( &"CREDIT_SENIOR_PARALEGAL", &"CREDIT_KAP_KANG_CAPS" );
    addspace();
    addspace();
    addcenterheading( &"CREDIT_OPERATIONS_AND_STUDIO" );
    addspacesmall();
    addcenterdual( &"CREDIT_SENIOR_DIRECTOR_OF_PRODUCTION", &"CREDIT_SUZAN_RUDE_CAPS" );
    addspace();
    addspace();
    addcenterheading( &"CREDIT_CENTRAL_TECHNOLOGY" );
    addspacesmall();
    addcenterdual( &"CREDIT_SENIOR_MANGER_CENTRAL", &"CREDIT_ED_CLUNE_CAPS" );
    addspacesmall();
    addcenterdual( &"CREDIT_JUNIOR_SOFTWARE_ENGINEER", &"CREDIT_RYAN_FORD_CAPS" );
    addspacesmall();
    addcenterdual( &"CREDIT_TECHNICAL_DIRECTOR", &"CREDIT_PAT_GRIFFITH_CAPS" );
    addspacesmall();
    addcenterdual( &"CREDIT_SENIOR_DIRECTOR_TECHNOLOGY", &"CREDIT_JOHN_BOJORQUEZ_CAPS" );
    addspace();
    addspace();
    addcenterheading( &"CREDIT_CENTRAL_AUDIO" );
    addspacesmall();
    addcenterdual( &"CREDIT_DIRECTOR_CENTRAL_AUDIO", &"CREDIT_ADAM_LEVENSON_CAPS" );
    addspace();
    addspace();
    addcenterheading( &"CREDIT_MUSIC_DEPARTMENT" );
    addspacesmall();
    addcenterdual( &"CREDIT_WORLDWIDE_EXECUTIVE", &"CREDIT_TIM_RILEY_CAPS" );
    addspacesmall();
    addcenterdual( &"CREDIT_MUSIC_SUPERVISORS", &"CREDIT_SCOTT_MCDANIEL_CAPS" );
    addcentername( &"CREDIT_BRANDON_YOUNG" );
    addspacesmall();
    addcenterdual( &"CREDIT_MUSIC_DEPARTMENT_COORDINATOR", &"CREDIT_JONATHAN_BODELL_CAPS" );
    addspace();
    addspace();
    addcenterheading( &"CREDIT_MUSIC" );
    addspace();
    addcenterheading( &"CREDIT_CHURCH" );
    addcenterheading( &"CREDIT_WRITTEN_BY_SEAN_PRICE" );
    addcenterheading( &"CREDIT_PERFORMED_BY_SEAN_PRICE" );
    addcenterheading( &"CREDIT_COURTESY_OF_DUCK_DOWN" );
    addspace();
    addcenterheading( &"CREDIT_NATIONAL_ANTHEM_OF_THE" );
    addcenterheading( &"CREDIT_WRITTEN_BY_ANATOLIJ_N" );
    addcenterheading( &"CREDIT_PERFORMED_BY_THE_RED" );
    addcenterheading( &"CREDIT_PUBLISHED_BY_G_SCHIRMER" );
    addcenterheading( &"CREDIT_COURTESY_OF_SILVA_SCREEN" );
    addspace();
    addcenterheading( &"CREDIT_RESCUED" );
    addcenterheading( &"CREDIT_WRITTEN_BY_ABRAHAM_LASS" );
    addcenterheading( &"CREDIT_PUBLISHED_BY_TRF_MUSIC" );
    addcenterheading( &"CREDIT_USED_BY_PERMISSION" );
    addspace();
    addcenterheading( &"CREDIT_DEEP_AND_HARD" );
    addcenterheading( &"CREDIT_WRITTEN_BY_MARK_GRIGSBY" );
    addcenterheading( &"CREDIT_PERFORMED_BY_MARK_GRIGSBY" );
    addcenterheading( &"CREDIT_MIXED_BY_STEPHEN_MILLER" );
    addspace();
    addspace();
    addcenterheading( &"CREDIT_FINANCE" );
    addspacesmall();
    addcenterdual( &"CREDIT_MANAGER_CONTROLLER", &"CREDIT_JASON_DALBOTTEN_CAPS" );
    addspacesmall();
    addcenterdual( &"CREDIT_FINANCE_MANAGER", &"CREDIT_HARJINDER_SINGH_CAPS" );
    addspacesmall();
    addcenterdual( &"CREDIT_FINANCE_ANALYST", &"CREDIT_ADRIAN_GOMEZ_CAPS" );
    addspace();
    addspace();
    addcenterheading( &"CREDIT_ACTIVISION_SPECIAL_THANKS" );
    addspacesmall();
    addcenternamedouble( &"CREDIT_MIKE_GRIFFITH_CAPS", &"CREDIT_ROBIN_KAMINSKY_CAPS" );
    addcenternamedouble( &"CREDIT_BRIAN_WARD_CAPS", &"CREDIT_DAVE_STOHL_CAPS" );
    addcenternamedouble( &"CREDIT_STEVE_PEARCE_CAPS", &"CREDIT_WILL_KASSOY_CAPS" );
    addcenternamedouble( &"CREDIT_DUSTY_WELCH_CAPS", &"CREDIT_LAIRD_MALAMED_CAPS" );
    addcenternamedouble( &"CREDIT_NOAH_HELLER_CAPS", &"CREDIT_GEOFF_CARROLL_CAPS" );
    addcenternamedouble( &"CREDIT_SASHA_GROSS_CAPS", &"CREDIT_JEN_FOX_CAPS" );
    addcenternamedouble( &"CREDIT_MARCHELE_HARDIN_CAPS", &"CREDIT_JB_SPISSO_CAPS" );
    addcenternamedouble( &"CREDIT_RIC_ROMERO_CAPS", &"" );
    addspace();
    addspace();
    addcenterheading( &"CREDIT_QUALITY_ASSURANCE" );
    addspacesmall();
    addcenterdual( &"CREDIT_LEAD_QA_FUNCTIONALITY", &"CREDIT_MARIO_HERNANDEZ_CAPS" );
    addcentername( &"CREDIT_ERIK_MELEN_CAPS" );
    addspacesmall();
    addcenterdual( &"CREDIT_SENIOR_LEAD_QA_FUNCTIONALITY", &"CREDIT_EVAN_BUTTON_CAPS" );
    addspacesmall();
    addcenterdual( &"CREDIT_MANAGER_QA_FUNCTIONALITY", &"CREDIT_GLENN_VISTANTE_CAPS" );
    addspacesmall();
    addcenterdual( &"CREDIT_FLOOR_LEADS_QA_FUNCTIONALITY", &"CREDIT_VICTOR_DURLING_CAPS" );
    addcentername( &"CREDIT_CHAD_SCHMIDT_CAPS" );
    addcentername( &"CREDIT_PETER_VON_OY_CAPS" );
    addspacesmall();
    addcenterdual( &"CREDIT_QA_DATABASE_ADMINISTRATORS", &"CREDIT_RICH_PEARSON_CAPS" );
    addcentername( &"CREDIT_CHRIS_SHANLEY_CAPS" );
    addspace();
    addspace();
    addcenterheading( &"CREDIT_QA_TEST_TEAM" );
    addspacesmall();
    addcentertriple( &"CREDIT_DANIEL_ALFARO_CAPS", &"CREDIT_STEVE_ARAUJO_CAPS", &"CREDIT_MIKE_AZAMI_CAPS" );
    addcentertriple( &"CREDIT_STEFFEN_BOEHME_CAPS", &"CREDIT_JORDAN_BONDHUS_CAPS", &"CREDIT_BRYAN_CHAMCHOUM_CAPS" );
    addcentertriple( &"CREDIT_DILLON_CHANCE_CAPS", &"CREDIT_RYAN_CHANN_CAPS", &"CREDIT_ERIC_CHEVEZ_CAPS" );
    addcentertriple( &"CREDIT_CHRISTOPHER_CODDING_CAPS", &"CREDIT_RYAN_DEAL_CAPS", &"CREDIT_JON_EARNEST_CAPS" );
    addcentertriple( &"CREDIT_ISAAC_FISCHER_CAPS", &"CREDIT_DEVIN_GEE_CAPS", &"CREDIT_GIOVANNI_FUNES_CAPS" );
    addcentertriple( &"CREDIT_MIKE_GENADRY_CAPS", &"CREDIT_MARC_GOGOSHIAN_CAPS", &"CREDIT_ERIC_GOLDIN_CAPS" );
    addcentertriple( &"CREDIT_SHON_GRAY_CAPS", &"CREDIT_JONATHON_HAMNER_CAPS", &"CREDIT_SHAWN_HESTLEY_CAPS" );
    addcentertriple( &"CREDIT_DEMETRIUS_HOSTON_CAPS", &"CREDIT_CARSON_KEENE_CAPS", &"CREDIT_NATE_KINNEY_CAPS" );
    addcentertriple( &"CREDIT_DEVIN_MCGOWAN_CAPS", &"CREDIT_MICHAEL_LOYD_CAPS", &"CREDIT_JULIO_MEDINA_CAPS" );
    addcentertriple( &"CREDIT_JULIAN_NAYDICHEV_CAPS", &"CREDIT_KENNETH_OLIPHANT_CAPS", &"CREDIT_RODOLFO_ORTEGA_CAPS" );
    addcentertriple( &"CREDIT_DAVID_PARKER_CAPS", &"CREDIT_ADRIAN_PEREZ_CAPS", &"CREDIT_BRIAN_PUSCHELL_CAPS" );
    addcentertriple( &"CREDIT_CRYSTAL_PUSCHELL_CAPS", &"CREDIT_JASON_RALYA_CAPS", &"CREDIT_JUSTIN_REID_CAPS" );
    addcentertriple( &"CREDIT_MATTHEW_RICHARDSON_CAPS", &"CREDIT_JOHN_RIGGS_CAPS", &"CREDIT_JESSE_RIOS_CAPS" );
    addcentertriple( &"CREDIT_ERNIE_RITTACCO_CAPS", &"CREDIT_HEATHER_RIVERA_CAPS", &"CREDIT_MARVIN_RIVERA_CAPS" );
    addcentertriple( &"CREDIT_HOWARD_RODELO_CAPS", &"CREDIT_PEDRO_RODRIGUEZ_CAPS", &"CREDIT_DAN_ROHAN_CAPS" );
    addcentertriple( &"CREDIT_JEFF_ROPER_CAPS", &"CREDIT_JONATHAN_SANCHEZ_CAPS", &"CREDIT_MICHAEL_SANCHEZ_CAPS" );
    addcentertriple( &"CREDIT_JUSTIN_SCHUBER_CAPS", &"CREDIT_ANTHONY_SEALES_CAPS", &"CREDIT_SPENCER_SHERMAN_CAPS" );
    addcentertriple( &"CREDIT_CHRISTOPHER_SIAPERAS_CAPS", &"CREDIT_JEREMY_SMITH_CAPS", &"CREDIT_MICHAEL_STEFFAN_CAPS" );
    addcentertriple( &"CREDIT_JASON_STRAUMAN_CAPS", &"CREDIT_BYRON_TAYLOR_CAPS", &"CREDIT_JASON_VEGA_CAPS" );
    addcentertriple( &"CREDIT_JOHN_VINSON_CAPS", &"CREDIT_BYRON_WEDDERBURN_CAPS", &"CREDIT_BRIAN_WILLIAMS_CAPS" );
    addcentertriple( &"CREDIT_CHRIS_WOLF_CAPS", &"CREDIT_ROSS_YANCEY_CAPS", &"CREDIT_ROBERT_YI_CAPS" );
    addcentertriple( &"CREDIT_MOISES_ZET_CAPS", "", &"CREDIT_GREG_ZHENG_CAPS" );
    addspace();
    addspace();
    addcenterdual( &"CREDIT_NIGHT_SHIFT_LEAD_QA_FUNCTIONALITY", &"CREDIT_BARO_JUNG_CAPS" );
    addspacesmall();
    addcenterdual( &"CREDIT_NIGHT_SHIFT_PROJECT_LEAD", &"CREDIT_TOM_CHUA_CAPS" );
    addspacesmall();
    addcenterdual( &"CREDIT_NIGHT_SHIFT_SENIOR_LEAD", &"CREDIT_PAUL_COLBERT_CAPS" );
    addspacesmall();
    addcenterdual( &"CREDIT_NIGHT_SHIFT_MANAGER_QA", &"CREDIT_ADAM_HARTSFIELD_CAPS" );
    addspacesmall();
    addcenterdual( &"CREDIT_NIGHT_SHIFT_FLOOR_LEADS", &"CREDIT_JULIUS_HIPOLITO_CAPS" );
    addcentername( &"CREDIT_ELIAS_JIMENEZ_CAPS" );
    addcentername( &"CREDIT_JAY_MENCONI_CAPS" );
    addspace();
    addspace();
    addcenterheading( &"CREDIT_NIGHT_SHIFT_QA_TEST_TEAM" );
    addspacesmall();
    addcenternamedouble( &"CREDIT_KEVIN_ARREAGA_CAPS", &"CREDIT_TIFFANY_BEHJOHN_ASGHARY" );
    addcenternamedouble( &"CREDIT_BENJAMIN_BARBER_CAPS", &"CREDIT_GERALD_BECKER_CAPS" );
    addcenternamedouble( &"CREDIT_NIYA_GREEN_CAPS", &"CREDIT_RANDALL_HERMAN_CAPS" );
    addcenternamedouble( &"CREDIT_ANDREW_JONES_CAPS", &"CREDIT_JEFF_MITCHELL_CAPS" );
    addcenternamedouble( &"CREDIT_JIMMIE_POTTS_CAPS", &"CREDIT_ARON_SCHOOLING_CAPS" );
    addcenternamedouble( &"CREDIT_AARON_SMITH_CAPS", &"CREDIT_DENNIS_SOH_CAPS" );
    addcenternamedouble( &"CREDIT_JORGE_VALLADARES_CAPS", &"CREDIT_JIMMY_YANG_CAPS" );
    addspace();
    addspace();
    addcenterdual( &"CREDIT_TRG_SENIOR_MANAGER", &"CREDIT_CHRISTOPHER_WILSON_CAPS" );
    addspacesmall();
    addcenterdual( &"CREDIT_TRG_SUBMISSIONS_LEAD", &"CREDIT_DAN_NICHOLS_CAPS" );
    addspacesmall();
    addcenterdual( &"CREDIT_TRG_PLATFORM_LEAD", &"CREDIT_MARC_VILLANUEVA_CAPS" );
    addspacesmall();
    addcenterdual( &"CREDIT_TRG_PROJECT_LEAD", &"CREDIT_JOAQUIN_MEZA_CAPS" );
    addspacesmall();
    addcenterdual( &"CREDIT_CRG_PROJECT_LEAD", &"CREDIT_JEF_SEDIVY_CAPS" );
    addspacesmall();
    addcenterdual( &"CREDIT_TRG_FLOOR_LEADS", &"CREDIT_JARED_BACA_CAPS" );
    addcentername( &"CREDIT_TEAK_HOLLEY_CAPS" );
    addcentername( &"CREDIT_DAVID_WILKINSON_CAPS" );
    addspace();
    addspace();
    addcenterheading( &"CREDIT_TRG_TESTERS" );
    addspacesmall();
    addcenternamedouble( &"CREDIT_WILLIAM_CAMACHO_CAPS", &"CREDIT_PISOTH_CHHAM_CAPS" );
    addcenternamedouble( &"CREDIT_JASON_GARZA_CAPS", &"CREDIT_CHRISTIAN_HAILE_CAPS" );
    addcenternamedouble( &"CREDIT_ALEX_HIRSCH_CAPS", &"CREDIT_MARTIN_QUINN_CAPS" );
    addcenternamedouble( &"CREDIT_RHONDA_RAMIREZ_CAPS", &"CREDIT_JAMES_ROSE_CAPS" );
    addcenternamedouble( &"CREDIT_MARK_RUZICKA_CAPS", &"CREDIT_JACOB_ZWIRN_CAPS" );
    addspace();
    addspace();
    addcenterdual( &"CREDIT_TRG_PLATFORM_LEAD", &"CREDIT_KYLE_CAREY_CAPS" );
    addspacesmall();
    addcenterdual( &"CREDIT_TRG_PROJECT_LEAD", &"CREDIT_JASON_HARRIS_CAPS" );
    addspacesmall();
    addcenterdual( &"CREDIT_TRG_FLOOR_LEADS", &"CREDIT_KEITH_KODAMA_CAPS" );
    addcentername( &"CREDIT_JON_SHELTMIRE_CAPS" );
    addcentername( &"CREDIT_TOMO_SHIKAMI_CAPS" );
    addspace();
    addspace();
    addcenterheading( &"CREDIT_TRG_TESTERS" );
    addspacesmall();
    addcenternamedouble( &"CREDIT_BENJAMIN_ABEL_CAPS", &"CREDIT_MELVIN_ALLEN_CAPS" );
    addcenternamedouble( &"CREDIT_ADAM_AZAMI_CAPS", &"CREDIT_BRIAN_BAKER_CAPS" );
    addcenternamedouble( &"CREDIT_BRYAN_BERRI_CAPS", &"CREDIT_SCOTT_BORAKOVE_CAPS" );
    addcenternamedouble( &"CREDIT_COLIN_KAWAKAMI_CAPS", &"CREDIT_RYAN_MCCULLOUGH_CAPS" );
    addcenternamedouble( &"CREDIT_JOHN_MCCURRY_CAPS", &"CREDIT_KIRT_SANCHEZ_CAPS" );
    addcenternamedouble( &"CREDIT_EDGAR_SUNGA_CAPS", &"" );
    addspace();
    addspace();
    addcenterdual( &"CREDIT_LEAD_MULTIPLAYER_LAB", &"CREDIT_GARRETT_OSHIRO_CAPS" );
    addspacesmall();
    addcenterdual( &"CREDIT_FLOOR_LEADS_MULTIPLAYER", &"CREDIT_DOV_CARSON_CAPS" );
    addcentername( &"CREDIT_LEONARD_RODRIGUEZ_CAPS" );
    addcentername( &"CREDIT_MICHAEL_THOMSEN_CAPS" );
    addspace();
    addspace();
    addcenterheading( &"CREDIT_MULTIPLAYER_LAB_TESTERS" );
    addspacesmall();
    addcenternamedouble( &"CREDIT_MIKE_ASHTON_CAPS", &"CREDIT_JAN_ERICKSON_CAPS" );
    addcenternamedouble( &"CREDIT_MATTHEW_FAWBUSH_CAPS", &"CREDIT_FRANCO_FERNANDO_CAPS" );
    addcenternamedouble( &"CREDIT_ARMOND_GOODIN_CAPS", &"CREDIT_MARIO_IBARRA_CAPS" );
    addcenternamedouble( &"CREDIT_JESSIE_JONES_CAPS", &"CREDIT_JAEMIN_KANG_CAPS" );
    addcenternamedouble( &"CREDIT_BRIAN_LAY_CAPS", &"CREDIT_LUKE_LOUDERBACK_CAPS" );
    addcenternamedouble( &"CREDIT_KAGAN_MAEVERS_CAPS", &"CREDIT_MATT_RYAN_CAPS" );
    addcenternamedouble( &"CREDIT_JONATHAN_SADKA_CAPS", &"" );
    addspace();
    addspace();
    addcenterdual( &"CREDIT_ASSISTED_NETWORK_LAB", &"CREDIT_SEAN_OLSON_CAPS" );
    addspacesmall();
    addcenterdual( &"CREDIT_LEAD_NETWORK_LAB", &"CREDIT_FRANCIS_JIMENEZ_CAPS" );
    addspacesmall();
    addcenterdual( &"CREDIT_SENIOR_LEAD_NETWORK_LAB", &"CREDIT_CHRIS_KEIM_CAPS" );
    addspacesmall();
    addcenterdual( &"CREDIT_COMPATIBILITY_TESTERS", &"CREDIT_KEITH_WEBER_CAPS" );
    addcentername( &"CREDIT_WILLIAM_WHALEY_CAPS" );
    addcentername( &"CREDIT_BRANDON_GILBRECH_CAPS" );
    addcentername( &"CREDIT_MIKE_SALWET_CAPS" );
    addcentername( &"CREDIT_DAMON_COLLAZO_CAPS" );
    addspacesmall();
    addcenterdual( &"CREDIT_COMPATIBILITY_SPECIALIST", &"CREDIT_JON_AN_CAPS" );
    addspacesmall();
    addcenterdual( &"CREDIT_SENIOR_COMPATIBILITY", &"CREDIT_NEAL_BARIZO_CAPS" );
    addspacesmall();
    addcenterdual( &"CREDIT_LEAD_COMPATIBILITY", &"CREDIT_CHRIS_NEAL_CAPS" );
    addspacesmall();
    addcenterdual( &"CREDIT_MANAGER_QA_LOCALIZATIONS", &"CREDIT_DAVID_HICKEY_CAPS" );
    addspacesmall();
    addcenterdual( &"CREDIT_QA_LOCALIZATION_LEAD", &"CREDIT_CONOR_HARLOW_CAPS" );
    addspace();
    addspace();
    addcenterheading( &"CREDIT_QA_LOCALIZATION_TESTERS" );
    addspacesmall();
    addcenternamedouble( &"CREDIT_ANDREA_APRILE_CAPS", &"CREDIT_SANDRO_ARAFA_CAPS" );
    addcenternamedouble( &"CREDIT_HUGO_BELLET_CAPS", &"CREDIT_DANIELE_CELEGHIN_CAPS" );
    addcenternamedouble( &"CREDIT_CARLOS_MARTIN_CHIRINO_CAPS", &"CREDIT_ADRIAN_ECHEGOYEN_CAPS" );
    addcenternamedouble( &"CREDIT_JORGE_FERNANDEZ_CAPS", &"CREDIT_DANIEL_GARCIA_CAPS" );
    addcenternamedouble( &"CREDIT_CHRISTOPHE_GEVERT_CAPS", &"CREDIT_FRANZ_HEINRICH_CAPS" );
    addcenternamedouble( &"CREDIT_CHRISTIAN_HELD_CAPS", &"CREDIT_JACK_OHARA_CAPS" );
    addcenternamedouble( &"CREDIT_CLEMENT_PRIM_CAPS", &"CREDIT_DENNIS_STIFFEL_CAPS" );
    addcenternamedouble( &"CREDIT_IGNAZIO_IVAN_VIRGILIO_CAPS", &"" );
    addspace();
    addspace();
    addcenterdual( &"CREDIT_BURN_ROOM_COORDINATOR", &"CREDIT_JOULE_MIDDLETON_CAPS" );
    addspacesmall();
    addcenterdual( &"CREDIT_BURN_ROOM_STAFF", &"CREDIT_DANNY_FENG_CAPS" );
    addcentername( &"CREDIT_KAI_HSU_CAPS" );
    addcentername( &"CREDIT_SEAN_KIM_CAPS" );
    addspacesmall();
    addcenterdual( &"CREDIT_MANAGER_CSQA_TECHNOLOGY", &"CREDIT_INDRA_YEE_CAPS" );
    addspacesmall();
    addcenterdual( &"CREDIT_SENIOR_LEAD_QA_MIS", &"CREDIT_DAVE_GARCIAGOMEZ_CAPS" );
    addspacesmall();
    addcenterdual( &"CREDIT_QA_MIS_TECHNICIANS", &"CREDIT_TEDDY_HWANG_CAPS" );
    addcentername( &"CREDIT_BRIAN_MARTIN_CAPS" );
    addcentername( &"CREDIT_JEREMY_TORRES_CAPS" );
    addcentername( &"CREDIT_LAWRENCE_WEI_CAPS" );
    addspacesmall();
    addcenterdual( &"CREDIT_EQUIPMENT_COORDINATORS", &"CREDIT_KARLENE_BROWN_CAPS" );
    addcentername( &"CREDIT_LONG_LE_CAPS" );
    addspacesmall();
    addcenterdual( &"CREDIT_PROJECT_LEAD_DATABASE", &"CREDIT_JEREMY_RICHARD_CAPS" );
    addspacesmall();
    addcenterdual( &"CREDIT_FLOOR_LEAD_DATABASE_GROUP", &"CREDIT_KELLY_HUFFINE_CAPS" );
    addspacesmall();
    addcenterdual( &"CREDIT_DATABASE_GROUP_ADMINISTRATORS", &"CREDIT_JACOB_PORTER_CAPS" );
    addcentername( &"CREDIT_TIMOTHY_TOLEDO_CAPS" );
    addcentername( &"CREDIT_GEOFF_OLSEN_CAPS" );
    addcentername( &"CREDIT_CHRISTOPHER_SHANLEY_CAPS" );
    addspacesmall();
    addcenterdual( &"CREDIT_STAFFING_SUPERVISOR", &"CREDIT_JENNIFER_VITIELLO_CAPS" );
    addspacesmall();
    addcenterdual( &"CREDIT_QA_OPERATIONS_COORDINATOR", &"CREDIT_JEREMY_SHORTELL_CAPS" );
    addspacesmall();
    addcenterdual( &"CREDIT_MANAGER_RESOURCE_ADMINISTRATION", &"CREDIT_NADINE_THEUZILLOT_CAPS" );
    addspacesmall();
    addcenterdual( &"CREDIT_ADMINISTRATIVE_ASSISTANT", &"CREDIT_NIKKI_GUILLOTE_CAPS" );
    addspacesmall();
    addcenterdual( &"CREDIT_STAFFING_ASSISTANT", &"CREDIT_LORI_LORENZO_CAPS" );
    addspacesmall();
    addcenterdual( &"CREDIT_VOLT_ONSITE_PROGRAM_MANAGER", &"CREDIT_RACHEL_OVERTON_CAPS" );
    addspacesmall();
    addcenterdual( &"CREDIT_VOLT_ONSITE_PROGRAM_COORDINATOR", &"CREDIT_AILEEN_GALEAS_CAPS" );
    addspacesmall();
    addcenterdual( &"CREDIT_CUSTOMER_SUPPORT_MANAGERS", &"CREDIT_GARY_BOLDUC_CAPS" );
    addcentername( &"CREDIT_MICHAEL_HILL_CAPS" );
    addspacesmall();
    addcenterdual( &"CREDIT_DIRECTOR_QA_FUNCTIONALITY", &"CREDIT_MARILENA_RIXFORD_CAPS" );
    addspacesmall();
    addcenterdual( &"CREDIT_DIRECTOR_TECHNICAL_REQUIREMENTS", &"CREDIT_JAMES_GALLOWAY_CAPS" );
    addspacesmall();
    addcenterdual( &"CREDIT_VICE_PRESIDENT_QUALITY", &"CREDIT_RICH_ROBINSON_CAPS" );
    addspace();
    addspace();
    addcenterheading( &"CREDIT_ACTIVISION_QA_SPECIAL" );
    addspacesmall();
    addcenternamedouble( &"CREDIT_MATT_MCCLURE_CAPS", &"CREDIT_JOHN_ROSSER_CAPS" );
    addcenternamedouble( &"CREDIT_ANTHONY_KOROTKO_CAPS", &"CREDIT_BRAD_SAAVEDRA_CAPS" );
    addcenternamedouble( &"CREDIT_JASON_POTTER_CAPS", &"CREDIT_HENRY_VILLANUEVA_CAPS" );
    addcenternamedouble( &"CREDIT_PAUL_WILLIAMS_CAPS", &"CREDIT_THOM_DENICK_CAPS" );
    addcenternamedouble( &"CREDIT_FRANK_SO_CAPS", &"CREDIT_WILLIE_BOLTON_CAPS" );
    addcenternamedouble( &"CREDIT_ALEX_COLEMAN_CAPS", &"CREDIT_JEREMY_SHORTELL_CAPS" );
    addspace();
    addspace();
    addcenterdual( &"CREDIT_MANUAL_DESIGN", &"CREDIT_IGNITED_MINDS_LLC" );
    addspacesmall();
    addcenterdual( &"CREDIT_PACKAGING_DESIGN", &"CREDIT_PETROL" );
    addspace();
    addspace();
    addcenterheading( &"CREDIT_USES_BINK_VIDEO_COPYRIGHT" );
    addspace();

    if ( level.console && !level.xenon )
        addcenterheading( &"CREDIT_THIS_PRODUCT_USES_FMOD" );
    else
        addcenterheading( &"CREDIT_USES_MILES_SOUND_SYSTEM" );

    addspace();
    addspace();
    addcenterheading( &"CREDIT_FONTS_LICENSED_FROM" );
    addspacesmall();
    addcenterheading( &"CREDIT_T26_DIGITAL_TYPE_FOUNDRY" );
    addcenterheading( &"CREDIT_INTERNATIONAL_TYPEFACE" );
    addcenterheading( &"CREDIT_MONOTYPE_IMAGING" );
    addspace();
    addspace();
    addspace();
    addspace();
    addcenterheading( &"CREDIT_THE_CHARACTERS_AND_EVENTS1" );
    addcenterheading( &"CREDIT_THE_CHARACTERS_AND_EVENTS2" );
    addspace();
    addspace();
    addspace();
    addspace();
    addcenterheading( &"CREDIT_LEGAL1" );
    addcenterheading( &"CREDIT_LEGAL2" );
}

addlefttitle( var_0, var_1 )
{
    precachestring( var_0 );

    if ( !isdefined( var_1 ) )
        var_1 = level.linesize;

    var_2 = spawnstruct();
    var_2.type = "lefttitle";
    var_2.title = var_0;
    var_2.textscale = var_1;
    level.linelist[level.linelist.size] = var_2;
}

addleftname( var_0, var_1 )
{
    precachestring( var_0 );

    if ( !isdefined( var_1 ) )
        var_1 = level.linesize;

    var_2 = spawnstruct();
    var_2.type = "leftname";
    var_2.name = var_0;
    var_2.textscale = var_1;
    level.linelist[level.linelist.size] = var_2;
}

addsublefttitle( var_0, var_1 )
{
    addleftname( var_0, var_1 );
}

addsubleftname( var_0, var_1 )
{
    precachestring( var_0 );

    if ( !isdefined( var_1 ) )
        var_1 = level.linesize;

    var_2 = spawnstruct();
    var_2.type = "subleftname";
    var_2.name = var_0;
    var_2.textscale = var_1;
    level.linelist[level.linelist.size] = var_2;
}

addrighttitle( var_0, var_1 )
{
    precachestring( var_0 );

    if ( !isdefined( var_1 ) )
        var_1 = level.linesize;

    var_2 = spawnstruct();
    var_2.type = "righttitle";
    var_2.title = var_0;
    var_2.textscale = var_1;
    level.linelist[level.linelist.size] = var_2;
}

addrightname( var_0, var_1 )
{
    precachestring( var_0 );

    if ( !isdefined( var_1 ) )
        var_1 = level.linesize;

    var_2 = spawnstruct();
    var_2.type = "rightname";
    var_2.name = var_0;
    var_2.textscale = var_1;
    level.linelist[level.linelist.size] = var_2;
}

addcenterheading( var_0, var_1 )
{
    precachestring( var_0 );

    if ( !isdefined( var_1 ) )
        var_1 = level.headingsize;

    var_2 = spawnstruct();
    var_2.type = "centerheading";
    var_2.heading = var_0;
    var_2.textscale = var_1;
    level.linelist[level.linelist.size] = var_2;
}

addcentername( var_0, var_1 )
{
    precachestring( var_0 );

    if ( !isdefined( var_1 ) )
        var_1 = level.linesize;

    var_2 = spawnstruct();
    var_2.type = "centername";
    var_2.name = var_0;
    var_2.textscale = var_1;
    level.linelist[level.linelist.size] = var_2;
}

addcenternamedouble( var_0, var_1, var_2 )
{
    precachestring( var_0 );
    precachestring( var_1 );

    if ( !isdefined( var_2 ) )
        var_2 = level.linesize;

    var_3 = spawnstruct();
    var_3.type = "centernamedouble";
    var_3.name1 = var_0;
    var_3.name2 = var_1;
    var_3.textscale = var_2;
    level.linelist[level.linelist.size] = var_3;
}

adddoublecenterdualgrey( var_0, var_1, var_2, var_3, var_4 )
{
    precachestring( var_0 );
    precachestring( var_1 );
    precachestring( var_2 );
    precachestring( var_3 );

    if ( !isdefined( var_4 ) )
        var_4 = level.linesize;

    var_5 = spawnstruct();
    var_5.type = "doublecenterdualgrey";
    var_5.name1 = var_0;
    var_5.title1 = var_1;
    var_5.name2 = var_2;
    var_5.title2 = var_3;
    var_5.textscale = var_4;
    level.linelist[level.linelist.size] = var_5;
}

addcenterdualgrey( var_0, var_1, var_2 )
{
    precachestring( var_0 );
    precachestring( var_1 );

    if ( !isdefined( var_2 ) )
        var_2 = level.linesize;

    var_3 = spawnstruct();
    var_3.type = "centerdualgrey";
    var_3.title = var_1;
    var_3.name = var_0;
    var_3.textscale = var_2;
    level.linelist[level.linelist.size] = var_3;
}

addcentertriplegrey( var_0, var_1, var_2, var_3 )
{
    precachestring( var_0 );
    precachestring( var_1 );
    precachestring( var_2 );

    if ( !isdefined( var_3 ) )
        var_3 = level.linesize;

    var_4 = spawnstruct();
    var_4.type = "centertriplegrey";
    var_4.name1 = var_0;
    var_4.name2 = var_1;
    var_4.name3 = var_2;
    var_4.textscale = var_3;
    level.linelist[level.linelist.size] = var_4;
}

addcenternamecenter( var_0, var_1 )
{
    precachestring( var_0 );

    if ( !isdefined( var_1 ) )
        var_1 = level.linesize;

    var_2 = spawnstruct();
    var_2.type = "centernamecenter";
    var_2.name = var_0;
    var_2.textscale = var_1;
    level.linelist[level.linelist.size] = var_2;
}

addcenterdual( var_0, var_1, var_2 )
{
    precachestring( var_0 );
    precachestring( var_1 );

    if ( !isdefined( var_2 ) )
        var_2 = level.linesize;

    var_3 = spawnstruct();
    var_3.type = "centerdual";
    var_3.title = var_0;
    var_3.name = var_1;
    var_3.textscale = var_2;
    level.linelist[level.linelist.size] = var_3;
}

addcentertriple( var_0, var_1, var_2, var_3 )
{
    precachestring( var_0 );
    precachestring( var_1 );
    precachestring( var_2 );

    if ( !isdefined( var_3 ) )
        var_3 = level.linesize;

    var_4 = spawnstruct();
    var_4.type = "centertriple";
    var_4.name1 = var_0;
    var_4.name2 = var_1;
    var_4.name3 = var_2;
    var_4.textscale = var_3;
    level.linelist[level.linelist.size] = var_4;
}

addspace()
{
    var_0 = spawnstruct();
    var_0.type = "space";
    level.linelist[level.linelist.size] = var_0;
}

addspacesmall()
{
    var_0 = spawnstruct();
    var_0.type = "spacesmall";
    level.linelist[level.linelist.size] = var_0;
}

addcentergradientimage( var_0, var_1, var_2 )
{
    precacheshader( var_0 );
    var_3 = spawnstruct();
    var_3.type = "centergradientimage";
    var_3.image = var_0;
    var_3.width = 1080;
    var_3.height = 126;
    var_3.aligny = var_1;
    var_3.vertalign = var_1;
    var_3.yoffset = var_2;
    level.linelist[level.linelist.size] = var_3;
}

addcenterimage( var_0, var_1, var_2, var_3 )
{
    precacheshader( var_0 );
    var_4 = spawnstruct();
    var_4.type = "centerimage";
    var_4.image = var_0;
    var_4.width = var_1;
    var_4.height = var_2;

    if ( isdefined( var_3 ) )
        var_4.delay = var_3;

    level.linelist[level.linelist.size] = var_4;
}

addleftimage( var_0, var_1, var_2, var_3 )
{
    precacheshader( var_0 );
    var_4 = spawnstruct();
    var_4.type = "leftimage";
    var_4.image = var_0;
    var_4.width = var_1;
    var_4.height = var_2;

    if ( isdefined( var_3 ) )
        var_4.delay = var_3;

    level.linelist[level.linelist.size] = var_4;
}

addfunction( var_0, var_1 )
{
    var_2 = spawnstruct();
    var_2.type = "function";
    var_2.function = var_0;

    if ( isdefined( var_1 ) )
        var_2.delay = var_1;

    level.linelist[level.linelist.size] = var_2;
}

addgroupspacing()
{
    addspace();
    addspacesmall();
}

addstudiospacing()
{
    addspace();
    addspace();
    addspace();
    addspace();
    addspace();
    addspace();
    addspace();
    addspace();
    addspace();
    addspace();
    addspace();
}

addoriginalcreditsspacing()
{
    addcenterheading( &"CREDITS_BEENOX_ORIGINAL_CREDITS" );
    addspace();
    addspace();
    addspace();
    addspace();
}

playcredits()
{
    for ( var_0 = 0; var_0 < level.linelist.size; var_0++ )
    {
        var_1 = 0.5;
        var_2 = level.linelist[var_0].type;

        if ( var_2 == "centerimage" )
        {
            var_3 = level.linelist[var_0].image;
            var_4 = level.linelist[var_0].width;
            var_5 = level.linelist[var_0].height;
            var_6 = newhudelem();
            var_6 setshader( var_3, var_4, var_5 );
            var_6.alignx = "center";
            var_6.horzalign = "center";
            var_6.x = 0;
            var_6.y = 480;
            var_6.sort = 2;
            var_6 thread delaydestroy( level.destroydelayvalue );
            var_6 moveovertime( level.moveovertimevalue );
            var_6.y = -120;

            if ( isdefined( level.linelist[var_0].delay ) )
                var_1 = level.linelist[var_0].delay;
            else
                var_1 = 0.037 * var_5;
        }
        else if ( var_2 == "centergradientimage" )
        {
            var_3 = level.linelist[var_0].image;
            var_4 = level.linelist[var_0].width;
            var_5 = level.linelist[var_0].height;
            var_7 = level.linelist[var_0].aligny;
            var_8 = level.linelist[var_0].vertalign;
            var_6 = newhudelem();
            var_6 setshader( var_3, var_4, var_5 );
            var_6.alignx = "center";
            var_6.aligny = var_7;
            var_6.horzalign = "center";
            var_6.vertalign = var_8;
            var_6.x = 0;
            var_6.y = level.linelist[var_0].yoffset;
            var_6.sort = 4;
            var_6.foreground = 1;
        }
        else if ( var_2 == "leftimage" )
        {
            var_3 = level.linelist[var_0].image;
            var_4 = level.linelist[var_0].width;
            var_5 = level.linelist[var_0].height;
            var_6 = newhudelem();
            var_6 setshader( var_3, var_4, var_5 );
            var_6.alignx = "center";
            var_6.horzalign = "left";
            var_6.x = 128;
            var_6.y = 480;
            var_6.sort = 2;
            var_6 thread delaydestroy( level.destroydelayvalue );
            var_6 moveovertime( level.moveovertimevalue );
            var_6.y = -120;
            var_1 = 0.037 * var_5;
        }
        else if ( var_2 == "lefttitle" )
        {
            var_9 = level.linelist[var_0].title;
            var_10 = level.linelist[var_0].textscale;
            var_6 = newhudelem();
            var_6 settext( var_9 );
            var_6.alignx = "left";
            var_6.horzalign = "left";
            var_6.x = 28;
            var_6.y = 480;
            var_6.font = "default";
            var_6.color = level.remastertextcolorwhite;
            var_6.fontscale = var_10;
            var_6.sort = 2;
            var_6 thread delaydestroy( level.destroydelayvalue );
            var_6 moveovertime( level.moveovertimevalue );
            var_6.y = -120;
        }
        else if ( var_2 == "leftname" )
        {
            var_11 = level.linelist[var_0].name;
            var_10 = level.linelist[var_0].textscale;
            var_6 = newhudelem();
            var_6 settext( var_11 );
            var_6.alignx = "left";
            var_6.horzalign = "left";
            var_6.x = 60;
            var_6.y = 480;
            var_6.font = "default";
            var_6.color = level.remastertextcolorwhite;
            var_6.fontscale = var_10;
            var_6.sort = 2;
            var_6 thread delaydestroy( level.destroydelayvalue );
            var_6 moveovertime( level.moveovertimevalue );
            var_6.y = -120;
        }
        else if ( var_2 == "subleftname" )
        {
            var_11 = level.linelist[var_0].name;
            var_10 = level.linelist[var_0].textscale;
            var_6 = newhudelem();
            var_6 settext( var_11 );
            var_6.alignx = "left";
            var_6.horzalign = "left";
            var_6.x = 92;
            var_6.y = 480;
            var_6.font = "default";
            var_6.color = level.remastertextcolorwhite;
            var_6.fontscale = var_10;
            var_6.sort = 2;
            var_6 thread delaydestroy( level.destroydelayvalue );
            var_6 moveovertime( level.moveovertimevalue );
            var_6.y = -120;
        }
        else if ( var_2 == "righttitle" )
        {
            var_9 = level.linelist[var_0].title;
            var_10 = level.linelist[var_0].textscale;
            var_6 = newhudelem();
            var_6 settext( var_9 );
            var_6.alignx = "left";
            var_6.horzalign = "right";
            var_6.x = -132;
            var_6.y = 480;
            var_6.font = "default";
            var_6.color = level.remastertextcolorwhite;
            var_6.fontscale = var_10;
            var_6.sort = 2;
            var_6 thread delaydestroy( level.destroydelayvalue );
            var_6 moveovertime( level.moveovertimevalue );
            var_6.y = -120;
        }
        else if ( var_2 == "rightname" )
        {
            var_11 = level.linelist[var_0].name;
            var_10 = level.linelist[var_0].textscale;
            var_6 = newhudelem();
            var_6 settext( var_11 );
            var_6.alignx = "left";
            var_6.horzalign = "right";
            var_6.x = -100;
            var_6.y = 480;
            var_6.font = "default";
            var_6.color = level.remastertextcolorwhite;
            var_6.fontscale = var_10;
            var_6.sort = 2;
            var_6 thread delaydestroy( level.destroydelayvalue );
            var_6 moveovertime( level.moveovertimevalue );
            var_6.y = -120;
        }
        else if ( var_2 == "centerheading" )
        {
            var_12 = level.linelist[var_0].heading;
            var_10 = level.linelist[var_0].textscale;
            var_6 = newhudelem();
            var_6 settext( var_12 );
            var_6.alignx = "center";
            var_6.horzalign = "center";
            var_6.x = 0;
            var_6.y = 480;
            var_6.font = "default";
            var_6.color = level.remastertextcolorheading;
            var_6.fontscale = var_10;
            var_6.sort = 2;
            var_6 thread delaydestroy( level.destroydelayvalue );
            var_6 moveovertime( level.moveovertimevalue );
            var_6.y = -120;
        }
        else if ( var_2 == "centerdual" )
        {
            var_9 = level.linelist[var_0].title;
            var_11 = level.linelist[var_0].name;
            var_10 = level.linelist[var_0].textscale;
            var_13 = newhudelem();
            var_13 settext( var_9 );
            var_13.alignx = "right";
            var_13.horzalign = "center";
            var_13.x = -8;
            var_13.y = 480;
            var_13.font = "default";
            var_13.color = level.remastertextcolorwhite;
            var_13.fontscale = var_10;
            var_13.sort = 2;
            var_14 = newhudelem();
            var_14 settext( var_11 );
            var_14.alignx = "left";
            var_14.horzalign = "center";
            var_14.x = 8;
            var_14.y = 480;
            var_14.font = "default";
            var_14.color = level.remastertextcolorwhite;
            var_14.fontscale = var_10;
            var_14.sort = 2;
            var_13 thread delaydestroy( level.destroydelayvalue );
            var_13 moveovertime( level.moveovertimevalue );
            var_13.y = -120;
            var_14 thread delaydestroy( level.destroydelayvalue );
            var_14 moveovertime( level.moveovertimevalue );
            var_14.y = -120;
        }
        else if ( var_2 == "centertriple" )
        {
            var_15 = level.linelist[var_0].name1;
            var_16 = level.linelist[var_0].name2;
            var_17 = level.linelist[var_0].name3;
            var_10 = level.linelist[var_0].textscale;
            var_13 = newhudelem();
            var_13 settext( var_15 );
            var_13.alignx = "center";
            var_13.horzalign = "center";
            var_13.x = -170;
            var_13.y = 480;
            var_13.font = "default";
            var_13.color = level.remastertextcolorwhite;
            var_13.fontscale = var_10;
            var_13.sort = 2;
            var_14 = newhudelem();
            var_14 settext( var_16 );
            var_14.alignx = "center";
            var_14.horzalign = "center";
            var_14.x = 0;
            var_14.y = 480;
            var_14.font = "default";
            var_14.color = level.remastertextcolorwhite;
            var_14.fontscale = var_10;
            var_14.sort = 2;
            var_18 = newhudelem();
            var_18 settext( var_17 );
            var_18.alignx = "center";
            var_18.horzalign = "center";
            var_18.x = 170;
            var_18.y = 480;
            var_18.font = "default";
            var_18.color = level.remastertextcolorwhite;
            var_18.fontscale = var_10;
            var_18.sort = 2;
            var_13 thread delaydestroy( level.destroydelayvalue );
            var_13 moveovertime( level.moveovertimevalue );
            var_13.y = -120;
            var_14 thread delaydestroy( level.destroydelayvalue );
            var_14 moveovertime( level.moveovertimevalue );
            var_14.y = -120;
            var_18 thread delaydestroy( level.destroydelayvalue );
            var_18 moveovertime( level.moveovertimevalue );
            var_18.y = -120;
        }
        else if ( var_2 == "centername" )
        {
            var_11 = level.linelist[var_0].name;
            var_10 = level.linelist[var_0].textscale;
            var_6 = newhudelem();
            var_6 settext( var_11 );
            var_6.alignx = "left";
            var_6.horzalign = "center";
            var_6.x = 8;
            var_6.y = 480;
            var_6.font = "default";
            var_6.color = level.remastertextcolorwhite;
            var_6.fontscale = var_10;
            var_6.sort = 2;
            var_6 thread delaydestroy( level.destroydelayvalue );
            var_6 moveovertime( level.moveovertimevalue );
            var_6.y = -120;
        }
        else if ( var_2 == "centernamedouble" )
        {
            var_15 = level.linelist[var_0].name1;
            var_16 = level.linelist[var_0].name2;
            var_10 = level.linelist[var_0].textscale;
            var_13 = newhudelem();
            var_13 settext( var_15 );
            var_13.alignx = "center";
            var_13.horzalign = "center";
            var_13.x = -90;
            var_13.y = 480;
            var_13.font = "default";
            var_13.color = level.remastertextcolorwhite;
            var_13.fontscale = var_10;
            var_13.sort = 2;
            var_14 = newhudelem();
            var_14 settext( var_16 );
            var_14.alignx = "center";
            var_14.horzalign = "center";
            var_14.x = 90;
            var_14.y = 480;
            var_14.font = "default";
            var_14.color = level.remastertextcolorwhite;
            var_14.fontscale = var_10;
            var_14.sort = 2;
            var_13 thread delaydestroy( level.destroydelayvalue );
            var_13 moveovertime( level.moveovertimevalue );
            var_13.y = -120;
            var_14 thread delaydestroy( level.destroydelayvalue );
            var_14 moveovertime( level.moveovertimevalue );
            var_14.y = -120;
        }
        else if ( var_2 == "spacesmall" )
            var_1 = 0.1875;
        else if ( var_2 == "function" )
        {
            if ( isdefined( level.linelist[var_0].function ) )
                [[ level.linelist[var_0].function ]]();
        }
        else if ( var_2 == "doublecenterdualgrey" )
        {
            var_15 = level.linelist[var_0].name1;
            var_19 = level.linelist[var_0].title1;
            var_16 = level.linelist[var_0].name2;
            var_20 = level.linelist[var_0].title2;
            var_10 = level.linelist[var_0].textscale;
            var_13 = newhudelem();
            var_13 settext( var_15 );
            var_13.alignx = "right";
            var_13.horzalign = "center";
            var_13.x = -160;
            var_13.y = 480;
            var_13.font = "default";
            var_13.color = level.remastertextcolorwhite;
            var_13.fontscale = var_10;
            var_13.sort = 2;
            var_14 = newhudelem();
            var_14 settext( var_19 );
            var_14.alignx = "left";
            var_14.horzalign = "center";
            var_14.x = -150;
            var_14.y = 480;
            var_14.font = "default";
            var_14.color = level.remastertextcolorgrey;
            var_14.fontscale = var_10;
            var_14.sort = 2;
            var_18 = newhudelem();
            var_18 settext( var_16 );
            var_18.alignx = "right";
            var_18.horzalign = "center";
            var_18.x = 150;
            var_18.y = 480;
            var_18.font = "default";
            var_18.color = level.remastertextcolorwhite;
            var_18.fontscale = var_10;
            var_18.sort = 2;
            var_21 = newhudelem();
            var_21 settext( var_20 );
            var_21.alignx = "left";
            var_21.horzalign = "center";
            var_21.x = 160;
            var_21.y = 480;
            var_21.font = "default";
            var_21.color = level.remastertextcolorgrey;
            var_21.fontscale = var_10;
            var_21.sort = 2;
            var_13 thread delaydestroy( level.destroydelayvalue );
            var_13 moveovertime( level.moveovertimevalue );
            var_13.y = -120;
            var_14 thread delaydestroy( level.destroydelayvalue );
            var_14 moveovertime( level.moveovertimevalue );
            var_14.y = -120;
            var_18 thread delaydestroy( level.destroydelayvalue );
            var_18 moveovertime( level.moveovertimevalue );
            var_18.y = -120;
            var_21 thread delaydestroy( level.destroydelayvalue );
            var_21 moveovertime( level.moveovertimevalue );
            var_21.y = -120;
        }
        else if ( var_2 == "centerdualgrey" )
        {
            var_11 = level.linelist[var_0].name;
            var_9 = level.linelist[var_0].title;
            var_10 = level.linelist[var_0].textscale;
            var_13 = newhudelem();
            var_13 settext( var_11 );
            var_13.alignx = "right";
            var_13.horzalign = "center";
            var_13.x = -8;
            var_13.y = 480;
            var_13.font = "default";
            var_13.color = level.remastertextcolorwhite;
            var_13.fontscale = var_10;
            var_13.sort = 2;
            var_14 = newhudelem();
            var_14 settext( var_9 );
            var_14.alignx = "left";
            var_14.horzalign = "center";
            var_14.x = 8;
            var_14.y = 480;
            var_14.font = "default";
            var_14.color = level.remastertextcolorgrey;
            var_14.fontscale = var_10;
            var_14.sort = 2;
            var_13 thread delaydestroy( level.destroydelayvalue );
            var_13 moveovertime( level.moveovertimevalue );
            var_13.y = -120;
            var_14 thread delaydestroy( level.destroydelayvalue );
            var_14 moveovertime( level.moveovertimevalue );
            var_14.y = -120;
        }
        else if ( var_2 == "centertriplegrey" )
        {
            var_15 = level.linelist[var_0].name1;
            var_16 = level.linelist[var_0].name2;
            var_17 = level.linelist[var_0].name3;
            var_10 = level.linelist[var_0].textscale;
            var_13 = newhudelem();
            var_13 settext( var_15 );
            var_13.alignx = "center";
            var_13.horzalign = "center";
            var_13.x = -160;
            var_13.y = 480;
            var_13.font = "default";
            var_13.color = level.remastertextcolorgrey;
            var_13.fontscale = var_10;
            var_13.sort = 2;
            var_14 = newhudelem();
            var_14 settext( var_16 );
            var_14.alignx = "center";
            var_14.horzalign = "center";
            var_14.x = 0;
            var_14.y = 480;
            var_14.font = "default";
            var_14.color = level.remastertextcolorgrey;
            var_14.fontscale = var_10;
            var_14.sort = 2;
            var_18 = newhudelem();
            var_18 settext( var_17 );
            var_18.alignx = "center";
            var_18.horzalign = "center";
            var_18.x = 160;
            var_18.y = 480;
            var_18.font = "default";
            var_18.color = level.remastertextcolorgrey;
            var_18.fontscale = var_10;
            var_18.sort = 2;
            var_13 thread delaydestroy( level.destroydelayvalue );
            var_13 moveovertime( level.moveovertimevalue );
            var_13.y = -120;
            var_14 thread delaydestroy( level.destroydelayvalue );
            var_14 moveovertime( level.moveovertimevalue );
            var_14.y = -120;
            var_18 thread delaydestroy( level.destroydelayvalue );
            var_18 moveovertime( level.moveovertimevalue );
            var_18.y = -120;
        }
        else if ( var_2 == "centernamecenter" )
        {
            var_11 = level.linelist[var_0].name;
            var_10 = level.linelist[var_0].textscale;
            var_6 = newhudelem();
            var_6 settext( var_11 );
            var_6.alignx = "center";
            var_6.horzalign = "center";
            var_6.x = 0;
            var_6.y = 480;
            var_6.font = "default";
            var_6.color = level.remastertextcolorwhite;
            var_6.fontscale = var_10;
            var_6.sort = 2;
            var_6 thread delaydestroy( level.destroydelayvalue );
            var_6 moveovertime( level.moveovertimevalue );
            var_6.y = -120;
        }
        else
        {

        }

        wait( var_1 * level.delayscale );
    }

    common_scripts\utility::flag_set( "credits_ended" );
}

delaydestroy( var_0 )
{
    wait( var_0 );
    self destroy();
}
