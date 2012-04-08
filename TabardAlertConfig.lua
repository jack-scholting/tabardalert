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

---------------------------
-- Create the checkboxes --
-------------------------------------------------------------------------------
-- Create a Checkbutton.
local frame = CreateFrame("CheckButton", "UICheckButtonTemplateTest", TabardAlertPanel, "UICheckButtonTemplate")
frame:ClearAllPoints()
frame:SetPoint("CENTER", 0, 0)
_G[frame:GetName() .. "Text"]:SetText("Example checkbutton")
-------------------------------------------------------------------------------
        
