
--[[
									Verified SyncAdmin Plugin
	======================================================================================
	Authors 				Hannah Jane [DataSynchronized], Dominik [VolcanoINC]
	Description				Gives defined user a name.
	--------------------------------------------------------------------------------------
--]]

local command = {}
command.PermissionLevel = 1
command.Shorthand = nil
command.Params = {"PlayerList","..."}
command.Usage = "name Player Name"
command.Description = [[Changes the Players' character name to Name.]] 

--// Now to the actual command
command.Init = function(main)
end

command.Run = function(main,user,users,...)
	if (user == nil) then error("No user found") end
	local name = table.concat({...}," ")
	
	local list = {}
	for _,player in pairs(users) do
		table.insert(list,player.Name)
		local char = player.Character
		if (char) then
			if (char:findFirstChild("NameModel") and char.NameModel.Value) then
				char.NameModel.Value.Name = name
			else
				local m = Instance.new("Model")
				m.Name = name
				
				local head = char.Head:clone()
				head.Transparency = 0
				head.Parent = m
				
				local h = Instance.new("Humanoid")
				h.MaxHealth = 100
				h.Parent = m
				
				local v = Instance.new("ObjectValue")
				v.Value = m
				v.Name = "NameModel"
				v.Parent = char
				
				local w = Instance.new("Weld")
				w.C0 = CFrame.new(0,1.5,0)
				w.Part0 = char.Torso
				w.Part1 = head
				w.Parent = char
				
				char.Head.Transparency = 1
				m.Parent = char
			end
		end
	end
	return true,"Renamed players " .. table.concat(list,", ") .. " to " .. name,list,user.Name .. " has named you to: " .. name
end

return command
