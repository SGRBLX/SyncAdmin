
--[[
									Verified SyncAdmin Command
	======================================================================================
	Authors 				Hannah Jane [DataSynchronized], Dominik [VolcanoINC]
	Description				Views tools from the selected player.
	--------------------------------------------------------------------------------------
--]]

local command = {}
command.PermissionLevel = 1
command.Shorthand = {"vtools","seetools","invsee","listools"}
command.Params = {"Player"}
command.Usage = "viewtools Player"
command.Description = [[View tools from the selelcted players]] 

--// Now to the actual command
command.Init = function(main)
end

command.Run = function(main,user,player)
	if (player) then
		local toolList = {}
		local backpack = player.Backpack
		if (backpack) then
			for _,tool in pairs(backpack:children()) do
				if (toolList[tool.Name] == nil) then
					toolList[tool.Name] = 1
				else
					toolList[tool.Name] = toolList[tool.Name] + 1
				end
			end
			
			local output = "Tools for " .. player.Name .. "\n"
				.. "--------------------------------------------\n"
			
			for name,amount in pairs(toolList) do
				output = output .. name .. ", " .. amount .. "x\n"
			end
			return true,SyncAPI.DisplayScrollMessage(user,"Tools List",output)
		else
			return false,"Player has no backpack"
		end
	else
		return false,"Player was not found"
	end
end

return command
