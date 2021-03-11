local TextFetch = require(script.Parent.Parent.Functions.TextFetch)
local Config = require(script.Parent.Parent.Config.Constants)

print(TextFetch.FetchData("https://blackcatstudios.xyz/WoD-Util/Demotivation-Words",true,plugin:GetStudioUserId()))

function MakeButton()
	local self = {}
	local Subsection = plugin:CreateToolbar(Config.PluginToolbarInfo.SubsectionName)
	local Button = Subsection:CreateButton(Config.PluginInfo.PluginVersion,Config.PluginToolbarInfo.AltText,Config.PluginToolbarInfo.ImgId,Config.PluginToolbarInfo.BtnText)

	local ClickedEvt = Instance.new("BindableEvent")


	Button.Click:Connect(function()
		ClickedEvt:Fire()
	end)

	self.Clicked = ClickedEvt.Event
	self.Subsection = Subsection
	self.Button = Button

	return self
end

local Button = MakeButton()

local Widget = plugin:CreateDockWidgetPluginGui(string.format("WoD:%s",Config.PluginInfo.PluginVersion),Config.WidgetParams)
local WidgetEnabled = false

Button.Clicked:Connect(function()
	Widget.Enabled = not WidgetEnabled
	WidgetEnabled 	= not WidgetEnabled
end)