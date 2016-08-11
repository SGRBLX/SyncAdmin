Joints = {
	["Neck"] = {
		Part0 = "Torso",
		Part1 = "Head",
		C0 = CFrame.new(0, 1, 0, -1, -0, -0, 0, 0, 1, 0, 1, 0),
		C1 = CFrame.new(0, -0.5, 0, -1, -0, -0, 0, 0, 1, 0, 1, 0),
		MaxVelocity = 0.1,
		Parent = "Torso",
	},
	["RootJoint"] = {
		Part0 = "HumanoidRootPart",
		Part1 = "Torso",
		C0 = CFrame.new(0, 0, 0, -1, -0, -0, 0, 0, 1, 0, 1, 0),
		C1 = CFrame.new(0, 0, 0, -1, -0, -0, 0, 0, 1, 0, 1, 0),
		MaxVelocity = 0.1,
		Parent = "HumanoidRootPart",
	},
	["Left Shoulder"] = {
		Part0 = "Torso",
		Part1 = "Left Arm",
		C0 = CFrame.new(-1, 0.5, 0, -0, -0, -1, 0, 1, 0, 1, 0, 0),
		C1 = CFrame.new(0.5, 0.5, 0, -0, -0, -1, 0, 1, 0, 1, 0, 0),
		MaxVelocity = 0.1,
		Parent = "Torso",
	},
	["Right Shoulder"] = {
		Part0 = "Torso",
		Part1 = "Right Arm",
		C0 = CFrame.new(1, 0.5, 0, 0, 0, 1, 0, 1, 0, -1, -0, -0),
		C1 = CFrame.new(-0.5, 0.5, 0, 0, 0, 1, 0, 1, 0, -1, -0, -0),
		MaxVelocity = 0.1,
		Parent = "Torso",
	},
	["Left Hip"] = {
		Part0 = "Torso",
		Part1 = "Left Leg",
		C0 = CFrame.new(-1, -1, 0, -0, -0, -1, 0, 1, 0, 1, 0, 0),
		C1 = CFrame.new(-0.5, 1, 0, -0, -0, -1, 0, 1, 0, 1, 0, 0),
		MaxVelocity = 0.1,
		Parent = "Torso",
	},
	["Right Hip"] = {
		Part0 = "Torso",
		Part1 = "Right Leg",
		C0 = CFrame.new(1, -1, 0, 0, 0, 1, 0, 1, 0, -1, -0, -0),
		C1 = CFrame.new(0.5, 1, 0, 0, 0, 1, 0, 1, 0, -1, -0, -0),
		MaxVelocity = 0.1,
		Parent = "Torso",
	},
}

return Joints