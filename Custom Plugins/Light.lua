
--      @Description: Synchronized Admin Commands // Core Command Plugins
--      @Author: VolcanoINC, DataSynchronized
--      @Date of Creation: 26th, September, 2015
--		@Updated: 30th, September, 2015

local command = {}
command.PermissionLevel = 2 -- Allow only admin or higher to run (0: Everyone; 1: Admin; 2: Superadmin 3: Root)
command.Shorthand = nil -- Rather than typing out the full command name, this can be a quick alternative
command.Params = {"PlayerList","String"}
command.Usage = "light Player1,Player2,Player3,... R,G,B/off"
command.Description = [[Creates a light around the player]] 

--// Implement string split function
function strSplit(inputstr,sep)
	local t,i = {},1
	for str in string.gmatch(inputstr, "([^"..sep.."]+)") do
		t[i] = str
		i = i + 1
	end
	return t
end

--// Now to the actual command
command.Init = function(main)
end

command.Run = function(main,user,users,color)
	if (user == nil) then error("No user found") end
	if (users == nil) then error("Users is required") end
	if (color == nil) then error("Color is required") end
	
	
	if (color == "off") then
		local list = {}
		for _,player in pairs(users) do
			if (player.Character and player.Character:findFirstChild("Torso") and player.Character.Torso:findFirstChild("PointLight")) then
				player.Character.Torso.PointLight:Destroy()
			end
			table.insert(list,player.Name)
		end
		return true,"Removed lights from: " .. table.concat(list,", ")
	else
		local color = strSplit(color,",")
		local r,g,b = tonumber(color[1]),tonumber(color[2]),tonumber(color[3])
		if (r == nil or g == nil or b == nil) then error("Invalid color value") end
		local color = Color3.new(r/255,g/255,b/255)
		local list = {}
		for _,player in pairs(users) do
			table.insert(list,player.Name)
			if (player.Character and player.Character:findFirstChild("Torso")) then
				if (player.Character.Torso:findFirstChild("PointLight")) then
					player.Character.Torso.PointLight.Brightness = 2
					player.Character.Torso.PointLight.Color = color
				else
					Instance.new("PointLight",player.Character.Torso).Color = color
				end
			end
		end
		return true,"Given light to players: " .. table.concat(list,", "),list,user.Name .. " has given you a light."
	end
end

return command
