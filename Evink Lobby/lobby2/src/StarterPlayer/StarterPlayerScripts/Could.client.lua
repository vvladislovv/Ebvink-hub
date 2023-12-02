local TweenService = game:GetService("TweenService")
local CloudAnim = game.Workspace:WaitForChild("CloudAnim")

local CouldMin = CloudAnim:WaitForChild("CouldMin")
local CouldMax = CloudAnim:WaitForChild("CouldMax")
local CouldStand = CloudAnim:WaitForChild("CouldStand")
local CouldStarMax = CloudAnim:WaitForChild("CouldStarMax")
local CouldMAXSTART = CloudAnim:WaitForChild("CouldMAXSTART")

local Info = TweenInfo.new(400, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut, -1, false)

local Tween1 = TweenService:Create(CouldMin, Info, {
	Orientation = Vector3.new(0,360,0)
})
local Tween2 = TweenService:Create(CouldMax, Info, {
	Orientation = Vector3.new(0,-360,0)
})
local Tween3 = TweenService:Create(CouldStand, Info, {
	Orientation = Vector3.new(0,360,0)
})
local Tween4 = TweenService:Create(CouldStarMax, Info, {
	Orientation = Vector3.new(0,-360,0)
})
local Tween5 = TweenService:Create(CouldMAXSTART, Info, {
	Orientation = Vector3.new(0,360,0)
})



	Tween1:Play()
	Tween2:Play()
	Tween3:Play()
	Tween4:Play()
	Tween5:Play()
