--[[
	Description: This plugin is part of the "Titan Panel [Currencies] Multi" addon.
	Site: http://www.curse.com/addons/wow/titan-panel-currencies-multi
	Author: Canettieri
	Special Thanks to Eliote.
--]]

local ADDON_NAME, L = ...;
local ACE = LibStub("AceLocale-3.0"):GetLocale("Titan", true)

function formatNumber(amount, sep)
	local formatted = amount
	while true do
		formatted, k = string.gsub(formatted, "^(-?%d+)(%d%d%d)", '%1' .. sep .. '%2')
		if (k==0) then
			break
		end
	end
	return formatted
end

local function ToggleRightSideDisplay(self, id) -- Right side display
	TitanToggleVar(id, "DisplayOnRightSide");
	TitanPanel_InitPanelButtons();
end

local function ToggleShowBarBalance(self, id) -- Show Balance in Titan Bar
	TitanToggleVar(id, "ShowBarBalance");
	TitanPanelButton_UpdateButton(id)
end

local function ToggleShowAltText(self, id) -- Show Alt Text
	TitanToggleVar(id, "ShowAltText");
	TitanPanelButton_UpdateButton(id)
end

function L.PrepareCurrenciesMenu(self, id)
	TitanPanelRightClickMenu_AddTitle(TitanPlugins[id].menuText)

	info = {};
	info.text = L["buttonText"];
	info.notClickable = true
	info.notCheckable = true
	info.isTitle = true
	L_UIDropDownMenu_AddButton(info);

	info = {};
	info.text = L["showbb"];
	info.func = ToggleShowBarBalance;
	info.arg1 = id
	info.checked = TitanGetVar(id, "ShowBarBalance");
	info.keepShownOnClick = true
	L_UIDropDownMenu_AddButton(info);

	info = {};
	info.text = ACE["TITAN_CLOCK_MENU_DISPLAY_ON_RIGHT_SIDE"];
	info.func = ToggleRightSideDisplay;
	info.arg1 = id
	info.checked = TitanGetVar(id, "DisplayOnRightSide");
	info.keepShownOnClick = true
	L_UIDropDownMenu_AddButton(info);

	info = {};
	info.text = L["tooltip"];
	info.notClickable = true
	info.notCheckable = true
	info.isTitle = true
	L_UIDropDownMenu_AddButton(info);

	info = {};
	info.text = L["showAltText"];
	info.func = ToggleShowAltText;
	info.arg1 = id
	info.checked = TitanGetVar(id, "ShowAltText");
	info.keepShownOnClick = true
	L_UIDropDownMenu_AddButton(info);

	TitanPanelRightClickMenu_AddSpacer();
	TitanPanelRightClickMenu_AddCommand(ACE["TITAN_PANEL_MENU_HIDE"], id, TITAN_PANEL_MENU_FUNC_HIDE);
	L_UIDropDownMenu_AddSeparator()

	info = {};
	info.text = CLOSE;
	info.notCheckable = true
	info.keepShownOnClick = false
	L_UIDropDownMenu_AddButton(info);
end
