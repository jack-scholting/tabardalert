-------------------------------------------------------------------------------
--  Author: siriusjs
--  Date: 4/8/12
--  Description: This contains the functions that allow configuration under
--      Interface->Addons->TabardAlert.
-------------------------------------------------------------------------------

------------------------------
-- Create the overall frame --
-------------------------------------------------------------------------------
-- Create the frame that will exist in the Interface Options Panel.
TabardAlertPanel = CreateFrame( "Frame", "TabardAlertPanel", UIParent );
-- Give the frame a name in the listing on the left.
TabardAlertPanel.name = "TabardAlert";
-- Add this frame inside the Interface Options Panel.
InterfaceOptions_AddCategory(TabardAlertPanel);
-------------------------------------------------------------------------------

-----------
-- Title --
-------------------------------------------------------------------------------
local title = TabardAlertPanel:CreateFontString(nil, "ARTWORK", "GameFontNormalLarge")
title:SetPoint("TOPLEFT", 16, -16)
title:SetText("TabardAlert Configuration")
-------------------------------------------------------------------------------

----------------
-- Checkboxes --
-------------------------------------------------------------------------------
local color = "|cFFFFFFFF"
-- Create the Checkbutton.
local checkButton1 = CreateFrame("CheckButton", "EnabledConfigCheckbutton", TabardAlertPanel, "UICheckButtonTemplate")
-- Clear any points that may have been set.
checkButton1:ClearAllPoints()
-- Set the position to be at the top left. 5 pixels to the right, 60 pixels down from the parent.
checkButton1:SetPoint("TOPLEFT", 5, -60)
-- Set the text for the checkbutton.
_G[checkButton1:GetName() .. "Text"]:SetText(color .. "Enable Addon")

local checkButton2 = CreateFrame("CheckButton", "EnableSoundConfigCheckbutton", TabardAlertPanel, "UICheckButtonTemplate")
checkButton2:ClearAllPoints()
checkButton2:SetPoint("TOPLEFT", 5, -100)
_G[checkButton2:GetName() .. "Text"]:SetText(color .. "Enable Sound - Play an audible sound when reputation is wasted.")

local checkButton3 = CreateFrame("CheckButton", "MaxExaltedConfigCheckbutton", TabardAlertPanel, "UICheckButtonTemplate")
checkButton3:ClearAllPoints()
checkButton3:SetPoint("TOPLEFT", 5, -140)
_G[checkButton3:GetName() .. "Text"]:SetText(color .. "Max Exalted - Do not give alerts until the exalted bar is maxed at 999/1000.")
-------------------------------------------------------------------------------

------------------------------------------------
-- Check the boxes according to the settings. --
-------------------------------------------------------------------------------
TabardAlertPanel:SetScript("OnShow", function(frame)
    if TabardAlert_armed == true then
        checkButton1:SetChecked(true)
    else 
    	checkButton1:SetChecked(false)
    end

    if TabardAlert_sound == true then
        checkButton2:SetChecked(true)
    else
    	checkButton2:SetChecked(false)
    end

    if TabardAlert_maxExalted == true then
        checkButton3:SetChecked(true) 
    else
    	checkButton3:SetChecked(false)
    end
end)
-------------------------------------------------------------------------------

--------------------------------
-- Logic for Built-in Buttons --
-------------------------------------------------------------------------------
-- When the player clicks okay, run this function.
TabardAlertPanel.okay = function (self) 

    -- Save the state of checkButton1.
    local checked1 = checkButton1:GetChecked()
    if checked1 == nil then
        TabardAlert_armed = false;
    elseif checked1 == 1 then
        TabardAlert_armed = true;
    end
    
    -- Save the state of checkButton2.
    local checked2 = checkButton2:GetChecked()
    if checked2 == nil then
        TabardAlert_sound = false;
    elseif checked2 == 1 then
        TabardAlert_sound = true;
    end
    
    -- Save the state of checkButton3.
    local checked3 = checkButton3:GetChecked()
    if checked3 == nil then
        TabardAlert_maxExalted = false;
    elseif checked3 == 1 then
        TabardAlert_maxExalted = true;
    end
end

-- When the player clicks cancel, run this function.
TabardAlertPanel.cancel = function (self)  
    -- Do nothing. If the player cancelled, they did not want to save their changes.
end
-------------------------------------------------------------------------------




        
