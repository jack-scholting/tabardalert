-------------------------------------------------------------------------------
--	Author: Jack Scholting
--	Description: This contains the functions that allow configuration under
--      Interface->Addons->TabardAlert.
-------------------------------------------------------------------------------

TabardAlertPanel = CreateFrame( "Frame", "TabardAlertPanel", UIParent );
TabardAlertPanel.name = "TabardAlert";
InterfaceOptions_AddCategory(TabardAlertPanel);

local frame = CreateFrame("CheckButton", "UICheckButtonTemplateTest", TabardAlertPanel, "UICheckButtonTemplate")
frame:ClearAllPoints()
frame:SetPoint("CENTER", 0, 0)
_G[frame:GetName() .. "Text"]:SetText("Example checkbutton")
        
function TabardAlertConfig_OnLoad(panel)
        -- Set the name for the Category for the Panel
        panel.name = "TabardAlert";
        

        -- When the player clicks okay, run this function.
        --
        -- panel.okay = function (self) SC_ChaChingPanel_Close(); end;

        -- -- When the player clicks cancel, run this function.
        -- --
        -- panel.cancel = function (self)  SC_ChaChingPanel_CancelOrLoad();  end;

        -- Add the panel to the Interface Options
        --
        InterfaceOptions_AddCategory(panel);
end