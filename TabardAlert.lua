-------------------------------------------------------------------------------
--	Author: Jack Scholting
--	Description: This is the brains of my addon.
-------------------------------------------------------------------------------

-- Decides whether the addon is on or off.
isArmed = true

-- This function welcomes the user.
function HelloWorld() 
  print("Tabard Alert: Howdy!"); 
end 

-- This registers my slash command and takes one argument. 
SLASH_TABARDALERT1 = '/tbal';
local function handler(msg, editbox)
	if msg == 'on' then
		print('Tabard Alert: Addon is now armed.');
		isArmed = true
	elseif msg == 'off' then
		print('Tabard Alert: Addon is now disarmed.');
		isArmed = false
	else
		print('Tabard Alert: Unknown Command.');
		print('Usage: /tbal [on/off]');
	end
end
SlashCmdList["TABARDALERT"] = handler;

-- Register for when you gain any reputation.
-- CHAT_MSG_COMBAT_FACTION_CHANGE
-- If that reputation matches the tabard, and you are exalted with that faction. Alert

-- Check for current tabard.
-- Associate the id with a faction id?
function getTabardFaction()
	slotId = GetInventorySlotInfo("TabardSlot");
	itemLink = GetInventoryItemLink("player", slotId);
	print("You are wearing: " , itemLink);
	-- You probably need this.
	itemId = GetInventoryItemID("player", GetInventorySlotInfo("TabardSlot"));
	
	try = isExalted( 1171 );
	print("Are you exalted: " , try);
end

-- This simply returns true if the player is exalted with the given faction.
-- TODO: consider a user that wants to max the exalted bars to 999/1000.
function isExalted( factionId )
	_, _, standingId = GetFactionInfoByID( factionId );
	if standingId == 8 then
		return true;
	else 
		return false;
	end
end

-- This is a hash table of factions and their respective factionId.
local factions = {
   ["Alliance Vanguard"] = 1037,
   ["Argent Crusade"] = 1106,
   ["Argent Dawn"] = 529,
   ["Ashtongue Deathsworn"] = 1012,
   ["Baradin's Wardens"] = 1177,
   ["Bilgewater Cartel"] = 1133,
   ["Bloodsail Buccaneers"] = 87,
   ["Booty Bay"] = 21,
   ["Brood of Nozdormu"] = 910,
   ["Cenarion Circle"] = 609,
   ["Cenarion Expedition"] = 942,
   ["Darkmoon Faire"] = 909,
   ["Darkspear Trolls"] = 530,
   ["Darnassus"] = 69,
   ["Dragonmaw Clan"] = 1172,
   ["Everlook"] = 577,
   ["Exodar"] = 930,
   ["Explorers' League"] = 1068,
   ["Frenzyheart Tribe"] = 1104,
   ["Frostwolf Clan"] = 729,
   ["Gadgetzan"] = 369,
   ["Gelkis Clan Centaur"] = 92,
   ["Gilneas"] = 1134,
   ["Gnomeregan"] = 54,
   ["Guardians of Hyjal"] = 1158,
   ["Guild"] = 1168,
   ["Hellscream's Reach"] = 1178,
   ["Honor Hold"] = 946,
   ["Horde Expedition"] = 1052,
   ["Hydraxian Waterlords"] = 749,
   ["Ironforge"] = 47,
   ["Keepers of Time"] = 989,
   ["Kirin Tor"] = 1090,
   ["Knights of the Ebon Blade"] = 1098,
   ["Kurenai"] = 978,
   ["Lower City"] = 1011,
   ["Magram Clan Centaur"] = 93,
   ["Netherwing"] = 1015,
   ["Ogri'la"] = 1038,
   ["Orgrimmar"] = 76,
   ["Ramkahen"] = 1173,
   ["Ratchet"] = 470,
   ["Ravenholdt"] = 349,
   ["Sha'tari Skyguard"] = 1031,
   ["Shattered Sun Offensive"] = 1077,
   ["Shen'dralar"] = 809,
   ["Silvermoon City"] = 911,
   ["Silverwing Sentinels"] = 890,
   ["Sporeggar"] = 970,
   ["Stormpike Guard"] = 730,
   ["Stormwind"] = 72,
   ["Syndicate"] = 70,
   ["The Aldor"] = 932,
   ["The Ashen Verdict"] = 1156,
   ["The Consortium"] = 933,
   ["The Defilers"] = 510,
   ["The Earthen Ring"] = 1135,
   ["The Frostborn"] = 1126,
   ["The Hand of Vengeance"] = 1067,
   ["The Kalu'ak"] = 1073,
   ["The League of Arathor"] = 509,
   ["The Mag'har"] = 941,
   ["The Oracles"] = 1105,
   ["The Scale of the Sands"] = 990,
   ["The Scryers"] = 934,
   ["The Sha'tar"] = 935,
   ["The Silver Covenant"] = 1094,
   ["The Sons of Hodir"] = 1119,
   ["The Sunreavers"] = 1124,
   ["The Taunka"] = 1064,
   ["The Violet Eye"] = 967,
   ["The Wyrmrest Accord"] = 1091,
   ["Therazane"] = 1171,
   ["Thorium Brotherhood"] = 59,
   ["Thrallmar"] = 947,
   ["Thunder Bluff"] = 81,
   ["Timbermaw Hold"] = 576,
   ["Tranquillien"] = 922,
   ["Undercity"] = 68,
   ["Valiance Expedition"] = 1050,
   ["Warsong Offensive"] = 1085,
   ["Warsong Outriders"] = 889,
   ["Wildhammer Clan"] = 1174,
   ["Wintersaber Trainers"] = 589,
   ["Zandalar Tribe"] = 270
 }