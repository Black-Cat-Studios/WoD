--!strict
local module = {}
local TextService = game:GetService("TextService")
local LocalizationService = game:GetService("LocalizationService")

function module.ProcessText(Text:string,UserId:number):string
	
end

function module.GetTextSize(Text:string,FontSize:number,Font:Enum.Font,FrameSize:Vector2):Vector2
	return TextService:GetTextSize(Text,FontSize,Font,FrameSize)
end

return module