--!strict
local module = {}
local TextFetch = require(script.Parent.TextFetch)
local Random = require(script.Parent.RandomGenerator)

local QuotesArray
local URL = "https://blackcatstudios.xyz/WoD-Util/%s"
URL = string.format(URL,"Demotivation-Words.json")
QuotesArray = TextFetch.FetchData(URL,false)

function module.GetQuotes():string
    return QuotesArray[Random.Psuedorandom(1,#QuotesArray)]
end

return module