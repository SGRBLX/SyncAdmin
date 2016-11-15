
--      @Description: Synchronized Admin Plugin
--      @Author: skeletonarcher12
--		@Note: Check API documentation for more information regarding this.

local command = {}
command.PermissionLevel = 0 -- Set the plugin permission level
command.Shorthand = nil -- Set the plugin shorthand
command.Params = {} -- Set the plugin parameters
command.Usage = "donate" -- Set the plugin usage
command.Description = [[Donate to SyncAdmin!]]  -- Set the plugin description

--// Now to the actual command
command.Init = function(main)
end

command.Run = function(main,user)
	local ans = {
		{ Text = 'Yes, Donate!'; Color = Color3.new(0,1,0); },
        { Text = 'Nah, maybe later.'; Color = Color3.new(1,0,0); },
	}
	local resp = SyncAPI.DisplayQuestionMessage(user,"Donate to SyncAdmin!","SyncAdmin is a totally free service, we will never ask you for money to use our services. The only way we survive is your donations.","Check",ans)
	if resp == "Nah, maybe later." then
		return false, "You didn't want to donate. :("
	end
	game:GetService("MarketplaceService"):PromptPurchase(user, 494605703)
	return true, "Thanks for donating! :D"
end

return command
