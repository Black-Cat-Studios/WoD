local module = {}
local Players = game:GetService("Players")
local Random = require(script.Parent.RandomGenerator)

function module.GetFriendList(UserId:number):FriendPages
	return Players:GetFriendsAsync(UserId)
end

function module.GetRandomFriend(UserId:number)
	local FriendPage = module.GetFriendList(UserId)
	local FriendList = {}
	for i = 1,4 do
		local Page = FriendPage:GetCurrentPage()
		if FriendPage.IsFinished then
			for _,v in pairs(Page) do
				table.insert(FriendList,v)
			end
			break
		end
		if i ~= 1 then
			FriendPage:AdvanceToNextPageAsync()
		end
		Page = FriendPage:GetCurrentPage()
		for _,v in pairs(Page) do
			table.insert(FriendList,v)
		end
	end
	local NewFriend = FriendList[Random.Psuedorandom(1,#FriendList)]
	return NewFriend
end

return module