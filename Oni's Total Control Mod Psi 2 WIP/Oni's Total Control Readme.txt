TOO MANY TERRORISTS MOD

VERSION Psi (I hope I'm close to the end.) 

1. Rename or move old files that are being replaced. Easiest to copy the whole config folder somewhere else.
2. Unzip into KellerGame/Config folder and replace files.
3. (OPTIONAL sound bug fix) use F7 to remove SMGs and LMGs from terrorists

KEYBINDS & FEATURES (will be tweaked to be more logical in next update)

F1 Cycles 10 AI modes (Mexico, Elite, Long Vision, Fixed Machine Gunner, Irena, etc.)
F2 Cycles 3 AI modes that modify spawning, player seeking, retreat, etc.  (Offensive, Defensive, Moderate)
F3 Berserker / Coward AI mode
F4 Cycles grenades and heat sensors for terrorists AND host
F5 Turns on/off weapon mods for terrorists
F6 Cycles terrorist weapons (shields, pistols. snipers, shotguns, random, No Machine Guns-sound bug fix)
F7 Spawns 32 terrorists immediately
F8 Cycles terrorist team size (they spawn around the map in teams of 2-8-16-32)
F9 Cycles down total wave size (2-8-16-32-64-128)
F10 Cycles up
F11 Sets terrorists to kill to 1
F12 Cycles terrorists to kill to (101-501-1001)

6 Rocket Launcher, Bouncy Ball, Regular Grenade
7 Cycles zero (ultra low) gravity and anti-gravity (floating and flying)
8 Cycles Earth, Moon, & Jupiter gravity
9 Nine lives, 99 lives
0 Zero respawns (realistic), 3 lives
Underscore - alternate between 90s respawn, 3s invulnerability | 10s, 12s | 3s, 18s

Insert - Cycles life modes (10x health, Over 9000 health, regular, realistic-1 to 2 shot deaths & 10 second wounded recovery period)
Delete - Enemy 10%, 100%, and 900% health

Home - Cycles speed modes (2x Usain Bolt, 10x Superman, regular)
End - Enemy speed: slow, regular, fast
Alt speed modes -> RightBracket (throw) LeftBracket (climb) Backslash (run)

o Tuns on/off bodies disappearing
k Turns on/off fall damage
l 1001 Enemy Low Processing Mode (tries to prevent crashes when doing 1001 enemies)
p Turns on/off unlimited ammo for pistols
m Cycles ammo modes (Iron Man-400x3 for Glock, MK47, M8 & 40 grenades; Regular, and Realistic) They only work on Realistic Difficulty & those 3 guns.
h Heat Vision: Realistic, Thru Walls, All Map 


PLAYER SUPERIOR
i - IRON MAN mode. 2x speed, super running/climbing/throws, no fall damage,  over 9000 health, 3 lives, antigravity, 400/40 ammo, AI offensive
SHIFT-i - THE ONE mode. 10x speed, super climbing/throws, no fall damage, 10x health, 9 lives, low Moon gravity, regular ammo, AI moderate
CONTROL-i - CAPTAIN AMERICA mode. (Glock 18 + Shield is faster, stronger, more accurate, little recoil)
ALT-i - ACTION MOVIE mode (Enemies highly inaccurate, spray bullets, narrow-vision)

PLAYER INFERIOR
j - REGULAR MAN.  Mostly normal. AI moderate. 3 lives.
SHIFT-j - REALISTIC MAN. Realistic ammo carrying capacity (mostly). 0 respawns. AI Defensive. Realistic Health. Longer wounded recovery time. Spawn in waves and teams of 2
CONTROL-j - SPEED DEMONS. Enemies 2x faster with 9x health. Player is 2x faster with 10x health. 9 lives. Short respawn,
ALT-j - PISTOL SLOWMO HUNT. Enemies are slow. You are also slow. Pistols only for enemies and players.


NOTICE
1. The commands will ouput a description to the console, which you can access with the tile (~) key. 
However, if you are hosting an online game, then they will not output if you press keys too soon after each other. You need to wait at around 2 seconds between presses.

2. Commands that change the ammunition directly edit game files while you're in-game and so will cause 1-10 second freezes depending on your computer.

3. Features that increase bodies on the map (players, dead bodies, enemies) stress the game and can cause instability issues like invisible enemies, "T-posing", and game crashes. 
Make sure that you apply an LAA 4GB patch to your game mod to (hopefully) make these issues more rare.

4. The Terrorist Grenade mod also affects what the host will have in their grenade slot 1. Make sure you put your most essential item in slot 2.

5. Player speed changes only work player (host and client)-side. 
Gravity modes can linger visually after set, whether host or client, but host controls the reality of the setting in-game. 
Finally, grenade modes (bouncy ball, rocket launcher) depend on host, but client visuals will differ, confusing them.
Ideally every command should be set by clients and host to be the same, to work fully, but the previously mentioned are most important to match.

FILES
PCKellerInput  - 80% of the mod. It determines all the key controls, but all may not work or work as intended without the other files.

KellerWeaponsConfig
DefaultWeaponsConfig - unneccessary. will be removed

KellerProjectilesConfig - modify bounce and explosion delay time 

KellerGadgetsConfig - number of grenades for each mode
DefaultGadgetsConfig - unneccessary. will be removed
PCKellerGadgetsConfig - may be unneccessary. may be removed

PCKellerGame - may be sound bug fix, and if so. will be removed in next version
DefaultGame - unneccessary. will be removed

KellerServerOptions - help with increasing players and max lives
DefaultServerOptions - unneccessary. will be removed

KellerDamageTypesConfig - increase impulse of weapons to push enemies more
DefaultDamageTypesConfig - unneccessary. will be removed

BaseEngine - sound bug fix, will be removed

PlatformSpecificConfigPC - for max enemies to spawn, also seems to make them more aggressive
PlatformSpecificConfigX360 - may be unneccessary. may be removed
PlatformSpecificConfigPS3 - may be unneccessary. may be removed
