local head 			= script.Parent:WaitForChild("Head")
local rocket 		= Instance.new("Part")
rocket.Size 		= Vector3.new(1, 2, 1)
rocket.CanCollide 	= false

local mesh 			= Instance.new("SpecialMesh", rocket)
mesh.MeshId 		= "rbxassetid://31601976"
mesh.TextureId 		= "rbxassetid://31601599"
mesh.Scale 			= Vector3.new(.75, 1, .75)
mesh.Offset 		= Vector3.new(0, -1, 0)

local fire 			= Instance.new("Fire", rocket)
fire.Color 			= Color3.new(.5, .5, .5)
fire.SecondaryColor = Color3.new()
fire.Size 			= 2
fire.Heat 			= 25

local gyro 			= Instance.new("BodyGyro", rocket)
gyro.MaxTorque 		= Vector3.new(math.huge, math.huge, math.huge)

local force 		= Instance.new("BodyForce", rocket)
local gravity 		= Vector3.new(0, rocket:GetMass() * 196.2, 0)
rocket.CFrame 		= head.CFrame + Vector3.new(0, 5, 0)
rocket.Parent 		= head.Parent

while head.Parent do
	local h = head.Position + Vector3.new(0, 2, 0) + CFrame.Angles(0, math.pi * 2 * ((tick() / 2) % 1), 0).lookVector * 20
	local p1 = rocket.Position
	local p2 = h - rocket.Velocity + head.Velocity
	gyro.CFrame = CFrame.new(p1, p2 + Vector3.new(0, 10, 0)) * CFrame.Angles(math.pi / 2, 0, 0)
	force.Force = (p2 - p1).unit * ((p2 - p1).magnitude ^ 2 / 10 + 10) + gravity
	wait()
end
