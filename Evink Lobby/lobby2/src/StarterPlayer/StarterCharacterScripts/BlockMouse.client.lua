local UserInputService = game:GetService("UserInputService")
local Camera = game.Workspace.CurrentCamera
local mouseInput = {
	Enum.UserInputType.MouseButton2,
}

local function toggleMouse(lastInputType)
    local pressed = UserInputService:IsMouseButtonPressed(Enum.UserInputType.MouseButton2)
	if pressed then
		UserInputService.MouseIconEnabled = false
		UserInputService.MouseBehavior = Enum.MouseBehavior.LockCenter
        Camera.CameraType = Enum.CameraType.Track
        return pressed 
	end

	for _, mouse in pairs(mouseInput) do
		if lastInputType == mouse then
			UserInputService.MouseIconEnabled = true
            UserInputService.MouseBehavior = Enum.MouseBehavior.Default
            Camera.CameraType = Enum.CameraType.Custom
		end
	end
end

UserInputService.LastInputTypeChanged:Connect(toggleMouse)