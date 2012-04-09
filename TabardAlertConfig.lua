-------------------------------------------------------------------------------
--	Author: siriusjs
--  Date: 4/8/12
--	Description: This contains the functions that allow configuration under
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

--------------------------------
-- Logic for Built-in Buttons --
-------------------------------------------------------------------------------
-- When the player clicks okay, run this function.
-- panel.okay = function (self) SC_ChaChingPanel_Close(); end;

-- -- When the player clicks cancel, run this function.
-- panel.cancel = function (self)  SC_ChaChingPanel_CancelOrLoad();  end;
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
-- Create the Checkbutton.
local frame1 = CreateFrame("CheckButton", "EnabledConfigCheckbutton", TabardAlertPanel, "UICheckButtonTemplate")
frame1:ClearAllPoints()
-- Set the position to be at the top left. 5 pixels to the right, 60 pixels down from the parent.
frame1:SetPoint("TOPLEFT", 5, -60)
-- Set the text for the checkbutton.
_G[frame1:GetName() .. "Text"]:SetText("Enable Addon")
-- Create an event handler to handle when the checkbutton is actually checked.
frame1:SetScript("PostClick", function(self, button, down)
    print("it worked");
end)

local frame2 = CreateFrame("CheckButton", "EnableSoundConfigCheckbutton", TabardAlertPanel, "UICheckButtonTemplate")
frame2:ClearAllPoints()
frame2:SetPoint("TOPLEFT", 5, -140)
_G[frame2:GetName() .. "Text"]:SetText("Enable Sound - Play an audible sound when reputation is wasted.")

local frame3 = CreateFrame("CheckButton", "MaxExaltedConfigCheckbutton", TabardAlertPanel, "UICheckButtonTemplate")
frame3:ClearAllPoints()
frame3:SetPoint("TOPLEFT", 5, -100)
_G[frame3:GetName() .. "Text"]:SetText("Max Exalted - Do not give alerts until the exalted bar is maxed at 999/1000.")
-------------------------------------------------------------------------------
        
