# TabardAlert #

This is the text alert shown when you waste reputation. A audible sound also plays at this time.
![Alert](/../resources/alert_msg.png?raw=true)

These are the responses you receive if you arm/disarm the addon using the slash command "/tbal [on/off]".
![ArmAndDisarm](/../resources/arm_and_disarm.png?raw=true)

This menu is found at Interface->Addons->TabardAlert.
![Configuration](/../resources/config_menu.png?raw=true)

## Overview ##

* TabardAlert is a World of Warcraft (MMORPG) addon.
* It has received around 700 downloads.
* It was created to solve a specific problem my friends and I were having while playing the game.
* It is a handy little addon that ensures you don't waste reputation in a dungeon. Whenever you kill a mob in a dungeon, it checks the tabard you are wearing. If you are already exalted with them, it will alert you that you are wasting potential rep.
* The idea was generated because I have lots of alts and I like to do a lot of dungeons. I was always forgetting to swap tabards when I hit exalted, and I wanted some way to remind myself.
* It was also a way to explore WoW's API and get some experience with Lua.
* It is now out-of-date. It was created during the Wrath of the Lich King expansion at the time I was playing the game.

## Usage ##

### Slash Command Interface ###

To enable: "/tbal on" To disable: "/tbal off"

### Interface Options Panel ###

If you go to Interface->Addons->TabardAlert while in-game, you can change several settings.

* Enable/Disable addon
* Enable/Disable sound alert
* Change whether you want to be warned the minute you hit exalted, or wait until the bar is maxed at 999/1000
