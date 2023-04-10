// H2 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

main()
{
	character\gfl\_utility::detach_all_attachments();
	self.charactername = "Negev";
	self setmodel("h1_gfl_negev_body");
	self.headmodel = "h1_gfl_negev_head";
	self.accessorymodels = [ "h1_gfl_negev_hair" ];
	character\gfl\_utility::attach_all_attachments();
	self.voice = "american";
	self setclothtype( "vestlight" );
}

precache()
{
	precachemodel("h1_gfl_negev_body");
	precachemodel("h1_gfl_negev_head");
	precachemodel("h1_gfl_negev_hair");
}
