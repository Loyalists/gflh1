[![Discord](https://img.shields.io/discord/725057886958387393?label=Discord&logo=discord)](https://discord.gg/yYQDxkUtkV)
# gflh1
![](https://github.com/Loyalists/gflh1/blob/main/assets/github/logo.png?raw=true)

## Requirements
[Call of Duty: Modern Warfare Remastered](https://store.steampowered.com/app/393080/Call_of_Duty_Modern_Warfare_Remastered_2017/) (Steam - PC)  
[h1-mod (DEVELOP BUILD)](https://github.com/h1-mod/h1-mod)

## Installation
1. Prepare a copy of MWR. Read the [h1-mod manual](https://docs.h1.gg/install) for more information.

2. Install the [DEVELOP BUILD of h1-mod](https://github.com/h1-mod/h1-mod/actions?query=branch%3Adevelop)  
The current release of h1-mod doesn't work properly with the mod and using the develop build is a must for the time being.   
Take [this](https://github.com/h1-mod/h1-mod/actions/runs/5270194043) as an example. Just hit the "**Release binaries**" to download it when in doubt.  
Also note that a github account is required for this, login or register one when needed.

3. Download the latest [release](https://github.com/Loyalists/gflh1/releases/latest).  
**Do NOT download the repository as ZIP, that won't work, make sure you download the LATEST RELEASE.**

4. Extract the archive and copy the files from the latest release into root folder of the game, where h1_sp64_ship.exe is located.

5. Launch the game with h1-mod-gfl.bat, or alternatively h1-mod.exe and load **GFL** mod in game.

If it still refuses to work (checkerboard background...etc) please follow the [Alternative Installation](https://github.com/Loyalists/gflh1#alternative-installation) section.

## Alternative Installation
Before proceeding, disable **Shader Preload** in graphics settings while the game can be launched without crashing.   
The method below uses English as an example. If your game is using other languages some adjustments are to be made.  

1. Rename mod.ff inside mods/gfl/zone to eng_h1_mod_common.ff
2. Navigate to C:/Users/[YOUR USERNAME]/AppData/Local/h1-mod/cdata/zone/english
3. Move the renamed mod.ff to the folder above to replace the original eng_h1_mod_common.ff

If you have already followed the three steps above and some fatal errors pop up on starting the game, try to:

1. Go to players2/config.cfg. Locate the parameters below.
```
seta 0x2950CB6D "1"
seta 0x8BF035B2 "0"
```
2. Change them into:
```
seta 0x2950CB6D "0"
seta 0x8BF035B2 "1"
```

## Wiki   
[Credits](https://github.com/Loyalists/gflh1/wiki/Credits)   

## Showcase
[Gallery](https://github.com/Loyalists/gflh1/wiki/Gallery)  
[Playlist](https://www.youtube.com/playlist?list=PLHUTPjEfLLEKv1Z3CTZfLMDq3d0J3W4h8)   

## Useful links
[h1-gsc-dump](https://github.com/mjkzy/h1-gsc-dump)   
[x64-zt](https://github.com/Joelrau/x64-zt)   
[zonetool](https://github.com/Joelrau/zonetool)   
[Greyhound](https://github.com/Scobalula/Greyhound)   
[Developer console](https://callofduty.fandom.com/wiki/Developer_console)   

## Disclaimer
The mod is provided as-is and the contributors are not liable for any damage resulting from it. USE IT AT YOUR OWN RISK.
