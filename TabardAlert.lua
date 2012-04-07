-------------------------------------------------------------------------------
--	Author: Jack Scholting
--	Description: This is the brains of my addon.
-------------------------------------------------------------------------------




WoWUnit:AddTestSuite("Test_isExalted", Test_isExalted)
 
-- This function welcomes the user.
function HelloWorld() 
  print("Tabard Alert: Howdy!"); 
end 

-- This registers my slash command and takes one argument. 
SLASH_TABARDALERT1 = '/tbal';
local function handler(msg, editbox)
	if msg == 'on' then
		print('Tabard Alert: Addon is now armed.');
		TabardAlert_armed = true
	elseif msg == 'off' then
		print('Tabard Alert: Addon is now disarmed.');
		TabardAlert_armed = false
	elseif msg == 'status' then
        if TabardAlert_armed == nil then
            print("Tabard Alert: Addon is currently armed.");
            TabardAlert_armed = true
        elseif TabardAlert_armed == true then 
            print("Tabard Alert: Addon is currently armed.");
        else
            print("Tabard Alert: Addon is currently disarmed.");
        end
    else
		print('Tabard Alert: Unknown Command.');
		print('Usage: /tbal [on/off]');
	end
end
SlashCmdList["TABARDALERT"] = handler;

-- Register for when you gain any reputation.
-- If that reputation matches the tabard, and you are exalted with that faction. Alert
-- TODO: also check if he is in a dungeon.
local EventFrame = CreateFrame("Frame")
EventFrame:RegisterEvent("COMBAT_TEXT_UPDATE")
EventFrame:SetScript("OnEvent", function(self, event, event_type, faction, rep_amount)
	if event_type == 'FACTION' then
        if rep_amount and faction ~= nil then 
            print('You gained ' .. rep_amount .. ' with ' .. faction)
            local faction_id = TabardAlert_getFactionId[faction]
            if faction_id ~= nil then 
                local cur_tabard_faction = getTabardFaction()
                if cur_tabard_faction ~= nil then
                --  and isExalted(cur_tabard_faction)
                    if cur_tabard_faction == faction_id then
                        print('You are wasting reputation!')
                        PlaySoundFile("Interface\\addons\\TabardAlert\\Media\\cartoon_whistle.ogg", "Master")
                    end
                end
            end
        end
    end
end)


-- Check for and return the id for the current tabard faction.
function getTabardFaction()
    -- Find the id for the tabard the player is currently wearing.
	local itemId = GetInventoryItemID("player", GetInventorySlotInfo("TabardSlot"));
    if itemId ~= nil then 
        local itemId_str = string.format("%d", itemId)
        local factionId = TabardAlert_TabardToFaction[itemId_str]
        if factionId ~= nil then
            return factionId
        end
    end
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

