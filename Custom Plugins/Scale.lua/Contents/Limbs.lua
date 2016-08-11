Limbs = {
	["Head"] = {
		Joint = "Neck",
		Properties = {
			BrickColor = BrickColor.new("Bright yellow"),
			Size = Vector3.new(2, 1, 1),
			BackSurface = Enum.SurfaceType.Smooth,
			BottomSurface = Enum.SurfaceType.Inlet,
			FrontSurface = Enum.SurfaceType.Smooth,
			LeftSurface = Enum.SurfaceType.Smooth,
			RightSurface = Enum.SurfaceType.Smooth,
			TopSurface = Enum.SurfaceType.Smooth,
		},
		DefaultInstances = {
			{
				ClassName = "SpecialMesh",
				Properties = {
					Name = "Mesh",
					MeshType = Enum.MeshType.Head,
					Scale = Vector3.new(1.25, 1.25, 1.25),
					Offset = Vector3.new(0, 0, 0),
					VertexColor = Vector3.new(1, 1, 1)
				},
			},
			{
				ClassName = "Decal",
				Properties = {
					Name = "face",
					Shiny = 20,
					Specular = 0,
					Face = Enum.NormalId.Front,
					Texture = "rbxasset://textures/face.png"
				},
			},
		},
	},
	["Torso"] = {
		Joint = "Neck",
		Properties = {
			BrickColor = BrickColor.new("Bright blue"),
			Size = Vector3.new(2, 2, 1),
			BackSurface = Enum.SurfaceType.Smooth,
			BottomSurface = Enum.SurfaceType.Inlet,
			FrontSurface = Enum.SurfaceType.Smooth,
			LeftSurface = Enum.SurfaceType.Weld,
			RightSurface = Enum.SurfaceType.Weld,
			TopSurface = Enum.SurfaceType.Studs,
			LeftParamA = 0,
			LeftParamB = 0,
			RightParamA = 0,
			RightParamB = 0,
		},
		DefaultInstances = {
			{
				ClassName = "Decal",
				Properties = {
					Name = "roblox",
					Shiny = 20,
					Specular = 0,
					Face = Enum.NormalId.Front,
					Texture = ""
				},
			},
		},
	},
	["HumanoidRootPart"] = {
		Joint = "RootJoint",
		Properties = {
			BrickColor = BrickColor.new("Bright blue"),
			Size = Vector3.new(2, 2, 1),
			Transparency = 1,
			BackSurface = Enum.SurfaceType.Smooth,
			BottomSurface = Enum.SurfaceType.Smooth,
			FrontSurface = Enum.SurfaceType.Smooth,
			LeftSurface = Enum.SurfaceType.Smooth,
			RightSurface = Enum.SurfaceType.Smooth,
			TopSurface = Enum.SurfaceType.Smooth,
			LeftParamA = 0,
			LeftParamB = 0,
			RightParamA = 0,
			RightParamB = 0,
		},
	},
	["Left Arm"] = {
		Joint = "Left Shoulder",
		Properties = {
			BrickColor = BrickColor.new("Bright yellow"),
			Size = Vector3.new(1, 2, 1),
			BackSurface = Enum.SurfaceType.Smooth,
			BottomSurface = Enum.SurfaceType.Inlet,
			FrontSurface = Enum.SurfaceType.Smooth,
			LeftSurface = Enum.SurfaceType.Smooth,
			RightSurface = Enum.SurfaceType.Smooth,
			TopSurface = Enum.SurfaceType.Studs,
		},
	},
	["Right Arm"] = {
		Joint = "Right Shoulder",
		Properties = {
			BrickColor = BrickColor.new("Bright yellow"),
			Size = Vector3.new(1, 2, 1),
			BackSurface = Enum.SurfaceType.Smooth,
			BottomSurface = Enum.SurfaceType.Inlet,
			FrontSurface = Enum.SurfaceType.Smooth,
			LeftSurface = Enum.SurfaceType.Smooth,
			RightSurface = Enum.SurfaceType.Smooth,
			TopSurface = Enum.SurfaceType.Studs,
		},
	},
	["Left Leg"] = {
		Joint = "Left Hip",
		Properties = {
			BrickColor = BrickColor.new("Br. yellowish green"),
			Size = Vector3.new(1, 2, 1),
			BackSurface = Enum.SurfaceType.Smooth,
			BottomSurface = Enum.SurfaceType.Smooth,
			FrontSurface = Enum.SurfaceType.Smooth,
			LeftSurface = Enum.SurfaceType.Smooth,
			RightSurface = Enum.SurfaceType.Smooth,
			TopSurface = Enum.SurfaceType.Studs,
		},
	},
	["Right Leg"] = {
		Joint = "Right Hip",
		Properties = {
			BrickColor = BrickColor.new("Br. yellowish green"),
			Size = Vector3.new(1, 2, 1),
			BackSurface = Enum.SurfaceType.Smooth,
			BottomSurface = Enum.SurfaceType.Smooth,
			FrontSurface = Enum.SurfaceType.Smooth,
			LeftSurface = Enum.SurfaceType.Smooth,
			RightSurface = Enum.SurfaceType.Smooth,
			TopSurface = Enum.SurfaceType.Studs,
		},
	},
}

return Limbs