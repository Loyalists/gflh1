main()
{
	character\gfl\_utility::detach_all_attachments();

	switch( codescripts\character::get_random_character(13) )
	{
	case 0:
		character\gfl\character_gfl_p90::main();
		break;
	case 1:
		character\gfl\character_gfl_9a91::main();
		break;
	case 2:
		character\gfl\character_gfl_rfb::main();
		break;
	case 3:
		character\gfl\character_gfl_type97::main();
		break;
	case 4:
		character\gfl\character_gfl_saiga12::main();
		break;
	case 5:
		character\gfl\character_gfl_fnc::main();
		break;
	case 6:
		character\gfl\character_gfl_sten::main();
		break;
	case 7:
		character\gfl\character_gfl_ak74m::main();
		break;
	case 8:
		character\gfl\character_gfl_sp9_v2::main();
		break;
	case 9:
		character\gfl\character_gfl_suomi::main();
		break;
	case 10:
		character\gfl\character_gfl_super_sass::main();
		break;
	case 11:
		character\gfl\character_gfl_mp7_tights::main();
		break;
	case 12:
		character\gfl\character_gfl_g36c::main();
		break;
	}
	self.voice = "russian";
}

precache()
{
	character\gfl\character_gfl_p90::precache();
	character\gfl\character_gfl_9a91::precache();
	character\gfl\character_gfl_rfb::precache();
	character\gfl\character_gfl_type97::precache();
	character\gfl\character_gfl_saiga12::precache();
	character\gfl\character_gfl_fnc::precache();
	character\gfl\character_gfl_sten::precache();
	character\gfl\character_gfl_ak74m::precache();
	character\gfl\character_gfl_sp9_v2::precache();
	character\gfl\character_gfl_suomi::precache();
	character\gfl\character_gfl_super_sass::precache();
	character\gfl\character_gfl_mp7_tights::precache();
	character\gfl\character_gfl_g36c::precache();
}