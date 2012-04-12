-------------------------------------------------------------------------------
--  Author: siriusjs
--  Date: 4/8/12
--  Description: This is file contains the logic of the addon TabardAlert.
-------------------------------------------------------------------------------

----------------------
-- Welcome the User --
-------------------------------------------------------------------------------
-- This function welcomes the user.
function WelcomePlayer() 
    print("|cFF00FF33 Tabard Alert: |r Howdy!"); 

    -- If this is the first time seeing this character, initialize the settings.
    if TabardAlert_armed == nil then
        TabardAlert_armed = true
    end
    if TabardAlert_sound == nil then
    	TabardAlert_sound = true
    end
    if TabardAlert_maxExalted == nil then
    	TabardAlert_maxExalted = true
    end
end 
-------------------------------------------------------------------------------

--------------------
-- Slash Commands --
-------------------------------------------------------------------------------
-- This registers my slash command and takes one argument. 
SLASH_TABARDALERT1 = '/tbal';
SLASH_TABARDALERT2 = '/tabardalert';
SLASH_TABARDALERT3 = '/TabardAlert';

-- This variable contains the color formatting for the output.
local color = "|cFF00FF33";

-- This function handles the string argument received after the slash command.
local function handler(msg, editbox)
    if msg == 'on' then
	print(color .. "Tabard Alert: |r Addon is now armed.");
	TabardAlert_armed = true
    elseif msg == 'off' then
	print(color .."Tabard Alert: |r Addon is now disarmed.");
	TabardAlert_armed = false
    else
	print(color .. "Tabard Alert: |r Unknown Command.");
	print(color .. "Usage: |r /tbal [on/off]");
    end
end

-- This registers my handler with blizzards global list of slash commands. 
SlashCmdList["TABARDALERT"] = handler;
-------------------------------------------------------------------------------

----------------------
-- Watch for events --
-------------------------------------------------------------------------------
-- To watch for an event, you first need to create a frame.
local EventFrame = CreateFrame("Frame")

-- For the newly created frame, register the event we are interested in.
EventFrame:RegisterEvent("COMBAT_LOG_EVENT_UNFILTERED")

-- Create a function to handle when this event happens.
EventFrame:SetScript("OnEvent", function(_, _, _, event)
    -- If the addon is armed, and an enemy is killed.
    if TabardAlert_armed == true and event == 'UNIT_DIED' then
        -- Check that we are in a place where reputation gain from tabards is possible.
    	if inReputationPossibleLocation() then
    	    -- Get the faction id for the current tabard.
    	    local tabardFac = getTabardFaction() 
    	    -- Check if we are exalted with our tabard faction.
    	    if tabardFac ~= nil and isExalted( tabardFac ) then
    	        -- Reputation was wasted! Tell the player.
    	        alertPlayer()
            end
        end
    end
end)
-------------------------------------------------------------------------------

----------------------
-- Helper Functions --
-------------------------------------------------------------------------------
-- @brief: Find out whether the current location is a place where the player could
--          possibly gain reputation from kills. 
-- @return: type bool - true: the player could gain reputation from kills in this location.
--                      false: it is impossible to gain reputation from kills here.
-- TODO: Possibly add a more complex/accurate logic for this.
function inReputationPossibleLocation()
    local maxPlayers
    -- Find the number of players for the area we are in.
    _, _, _, _, maxPlayers = GetInstanceInfo()
    -- For now, if we are in a 5-man, assume we could gain reputation here.
    if maxPlayers ~= nil and maxPlayers == 5 then
        return true
    else
    	return false
    end
end

-- @brief: Let the player know that he is currently wasting possible reputation 
--          on each kill.
function alertPlayer()
    -- Print a text alert in the chat log.
    print(color .. "TabardAlert: |r You are wasting reputation!")

    -- If the player wanted sound warnings, play them.
    if  TabardAlert_sound ~= nil and  TabardAlert_sound == true then
        PlaySoundFile("Interface\\addons\\TabardAlert\\Media\\cartoon_whistle.ogg", "Master")
    else
    	-- Do nothing. They player did not want sound warnings.
    end
end

-- @brief: This function is used to find the faction that the player is currently
--      representing with his tabard.
-- @return: factionId - The ID of the faction that the player's tabard represents.
function getTabardFaction()
    -- Find the id for the tabard the player is currently wearing.
    local itemId = GetInventoryItemID("player", GetInventorySlotInfo("TabardSlot"));
    if itemId ~= nil then 
        -- Convert the tabard id to a string to look it up in the hash table.
        local itemId_str = string.format("%d", itemId)
        -- This table is defined in TabardAlertLists.lua.
        local factionId = TabardAlert_TabardToFaction[itemId_str]
        if factionId ~= nil then
            return factionId
        end
    end
end

-- @brief: This simply returns true if the player is exalted with the given faction.
-- @param: factionId - the unique id for a given faction.
-- @return: type bool - true: the player is deemed exalted. false: the player is deemed not yet exalted.
function isExalted( factionId )
    -- Grab faction information about the player.
    _, _, standingId, _, _, currentRep = GetFactionInfoByID( factionId );
    -- This variable is an option set by the user.
    if TabardAlert_maxExalted == nil or TabardAlert_maxExalted == false then  
        if standingId ~= nil and standingId == 8 then
            return true
	else 
    	    return false
	end
    -- If we are here, then the player wants to max out the rep bar.
    else 
    	if currentRep ~= nil and currentRep == 42999 then 
    	    return true
    	else
    	    return false
        end
    end
end
-----------------------------------------------------------------------------
