# Chivalry Medieval Warfare: TK Punishment Mod #
================================================

This mod brings an automated team killing and team damaging punishment system into team-based game modes.

## Operation ##

The system will create an entry for each player that spawns into a team-based game. This entry will be kept until the game ends, even if the player is no longer around.
This entry will keep player-related information linked to his/her SteamID, such as TK points, team killer, etc.
When a player damages a teammate, he/she will receive TK points for it. How many depends on the server configuration.
When a player kills a teammate, he/she can be either punished or forgiven by his/her victim.
If punished, he/she will receive TK points for it. How many depends on the server configuration.
If forgiven, he/she will not receive TK points for it.
Once a player reaches the TK points limit, he/she will be kicked and banned.
Both limit and ban duration depend on the server configuration.
At every interval without team damaging, the player starts losing TK points.
Both interval and amount of points to be removed depend on the server configuration.

**NOTE:** Team damage and team kill done during the pre round and end game stages will not be counted.
**NOTE:** This mod will not work on LAN servers as it depends on SteamID.

#### Supported Modes ####

* Capture The Flag (TKPCTF)
* King Of The Hill (TKPKOTH)
* Last Team Standing (TKPLTS)
* Team Deathmatch (TKPTD)
* Team Objective (TKPTO)

#### Warnings ####

Each player will receive up to three TK-related warnings as he/she gains TK points.

1. (Green) This warning will be given as soon as the player reaches 25% on TK points.
2. (Orange) This warning will be given as soon as the player reaches 50% on TK points.
3. (Red) This final warning will be given as soon as the player reaches 75% on TK points.

#### Player Commands ####

**These are chat commands.**

* !f or !forgive: Forgives team killer after being teamkilled.
* !p or !punish: Punishes team killer after being teamkilled.

Team killer will be auto-punished when:

1. Victim failed to forgive or punish within 20 seconds.
2. Victim died for a second time.
3. Victim disconnected.

#### Admin Commands ####

**These are console commands.**

* SaveTKValues -> Saves current TK-related values to the ini.
* SetTKPointsPerDamage <new value> -> Sets a new integer value for TKPointsPerDamage.
* SetTKPointsPerPunish <new value> -> Sets a new integer value for TKPointsPerPunish.
* SetTKPointsPerAutoPunish <new value> -> Sets a new integer value for TKPointsPerAutoPunish.
* SetTKPointsRemoveInterval <new value> -> Sets a new floating point value for TKPointsRemoveInterval.
* SetTKPointsRemovedPerInterval <new value> -> Sets a new integer value for TKPointsRemovedPerInterval.
* SetTKPointsMax <new value> -> Sets a new integer value for TKPointsMax.
* SetTKBanDuration <new value> -> Sets a new floating point value for TKBanDuration.
* SetTKIgnoreKing <True/False> -> Sets a new boolean value for TKIgnoreKing (only available for Team Objective).
* GetTKValues <True/False> -> Shows the values for all TK system-related variables (console). The formatted string is in the same format used in the ini files. Optional argument tells whether it should copy to the clipboard or not.
* GetTKPlayerInfo <True/False> -> Shows every player that has an entry in the TK system and still have his/her PlayerReplicationInfo object around (console). Format is "PlayerName <SteamID>: X TK Points", where SteamID is the SteamID's hexadecimal representation (int64/QWORD), and X is the amount of TK Points this player has. Optional argument tells whether it should copy to the clipboard or not.

## Installing (Cooked) ##

#### Client ####

Simply put TKPMod directory into UDKGame/CookedSDK.

#### Server ####

For a server running without the dedicated server tool, do the same as you did for the client.
For a server running through the dedicated server tool, instead of UDKGame/CookedSDK, put TKPMod directory into chivalry_ded_server/UDKGame/CookedPCServer.

For a server running without the dedicated server tool, open My Documents/My Games/Chivalry Medieval Warfare Beta/UDKGame/Config/UDKGame.ini.
For a server running through the dedicated server tool, open chivalry_ded_server/UDKGame/Config/PCServer-UDKGame.ini.
Replace every GameType="<GAMEMODE>" with GameType="TKPMod.<GAMEMODE>".
Example: Replace GameType="AOC.AOCTeamObjective" with GameType="TKPMod.TKPTO" for Team Objective.

For a server running through the dedicated server tool, open chivalry_ded_server/UDKGame/Config/PCServer-UDKEngine.ini.
On [Engine.ScriptPackages] add NativePackages=TKPMod.

Run the server for the first time to generate its configuration.

###### Configuration Variables ######

* TKPointsPerDamage = Multiplier that multiplies X team damage dealt into TK points.
* TKPointsPerPunish = Value added to a team killer's TK points pool if he/she receives a !p/!punish from his/her victim.
* TKPointsPerAutoPunish = Value added to a team killer's TK points pool if his/her victim failed to forgive or punish.
* TKPointsRemoveInterval = Time interval in which a player, whom have not dealt any new team damage, starts losing TK points. Value in seconds.
* TKPointsRemovedPerInterval = Value subtracted from a player's TK points pool at every TKPointsRemoveInterval.
* TKPointsMax = Maximum number of TK points a player can have. Reaching or trespassing this value will result in an auto kickban.
* TKBanDuration = Duration of a ban caused by reaching or trespassing TKPointsMax. Value in seconds.
* TKIgnoreKing = True/False - Defines whether the "King" player should be receiving TK points for team damage and team kill (only available for Team Objective).

## Compiling and Cooking ##

If you intend to compile and cook this project yourself, do the following:

1. Clone the repository to your computer.
2. Put TKPMod directory into Development/Src.
3. Edit UDKGame/Config/UDKSDK.ini and change ModPackages to ModPackages=TKPMod.
4. Run: Binaries\Win64\UDK.exe make
5. Once compiled, create a dummy map or use one of the existing ones in UDKGame/ContentSDK/ExampleMaps.
6. Open it with the editor: Binaries\Win64\UDK.exe editor
7. Go to View -> World Properties.
8. On Game Type set a supported game type to TKP[CTF/KOTH/LTS/TD/TO], save and close.
9. Now cook: Binaries\Win64\UDK.exe CookPackages -log -nohomedir -platform=PC -SDKPackage=TKPMod <DummyMap> -multilanguagecook=int
10. Once cooked, go to UDKGame/CookedSDK/TKPMod and delete everything but TKPMod.u.
11. It's now ready for deployment.

## Dependencies ##

1. Chivalry: Medieval Warfare
2. Chivalry: Medieval Warfare Beta

## Contributing or using this code base ##

If you want to contribute to the project or use it for your own, do the following:

1. [Fork](https://github.com/GreatOldOne/CMWTKP/fork) the project on GitHub.
2. Create a new branch for your changes.
3. Make sure everything is properly tested and organized.
4. Send a [pull request](https://help.github.com/articles/creating-a-pull-request) to GreatOldOne/CMWTKP.

Steps 2, 3 and 4 are only required if you intend to contribute to this project.

## Maintainers ##

* Cthulhu

## Links ##

* [Official Thread](http://www.tornbanner.com/forums/viewtopic.php?f=51&t=16305)