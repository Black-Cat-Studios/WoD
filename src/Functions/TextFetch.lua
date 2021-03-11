--!strict
local module = {}

local TextProcessing = require(script.Parent.TextProcessing)
local HttpService = game:GetService("HttpService")

function module.FetchData(URLPath:string,TranslateText:boolean,UserId:any):any
	local Data = HttpService:JSONDecode(HttpService:GetAsync(URLPath,false))
	
	if TranslateText then
		local DataTable = {}
		if type(Data) == "table" then
			for i,v in pairs(Data) do
				table.insert(DataTable,TextProcessing.ProcessText(v,UserId))
			end
			Data	 = DataTable
		end
	end
	
	return Data
end



return module


