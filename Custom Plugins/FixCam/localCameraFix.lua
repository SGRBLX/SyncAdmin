workspace.CurrentCamera:Destroy() -- Please learn to reference workspace correctly.
wait()

repeat wait() until workspace.CurrentCamera ~= nil -- Please understand this is a property, not a child
workspace.CurrentCamera.CameraSubject = game.Players.LocalPlayer.Character.Humanoid
workspace.CurrentCamera.CameraType = "Custom"

script:Destroy()

-- I hope you understand what wiki.roblox.com is ~ Hannah (: