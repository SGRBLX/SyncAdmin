game:GetService("Workspace").CurrentCamera:Destroy()
wait()

repeat wait() until game:GetService("Workspace"):FindFirstChild("CurrentCamera")~=nil
game:GetService("Workspace").CurrentCamera.CameraSubject = game.Players.LocalPlayer.Character.Humanoid
game:GetService("Workspace").CurrentCamera.CameraType = "Custom"
script:Destroy()
