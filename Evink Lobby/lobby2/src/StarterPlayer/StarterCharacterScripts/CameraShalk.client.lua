local RunService = game:GetService("RunService")

local playerModel = script.Parent
local humanoid = playerModel:WaitForChild("Humanoid")

local function updateBobbleEffect()
	local now = tick()
	if humanoid.MoveDirection.Magnitude > 0 then -- Is the character walking?
		local velocity = humanoid.RootPart.Velocity
		local bobble_X = math.cos(now * 10) / 5
		local bobble_Y = math.abs(math.sin(now * 13)) / 5

		local bobble = Vector3.new(bobble_X, bobble_Y, 0) * math.min(1, velocity.Magnitude / humanoid.WalkSpeed)
		humanoid.CameraOffset = humanoid.CameraOffset:lerp(bobble, 0.25)
	else
		-- Scale down the CameraOffset so that it shifts back to its regular position.
		humanoid.CameraOffset = humanoid.CameraOffset * 0.75
	end
end

RunService.RenderStepped:Connect(updateBobbleEffect)