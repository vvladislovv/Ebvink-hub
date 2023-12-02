local Camera = game.Workspace.CurrentCamera
local Button = script.Parent.Lobby.Lobby2.TextButton
local Lobby =  script.Parent.Lobby
local CameraGui = game.Workspace.CutCamera.Cameras:WaitForChild("CameraGui")
local TweenService = game:GetService("TweenService")
local BlurLoging = game.Lighting.BlurLoging
local Player = game:GetService("Players").LocalPlayer
local Char = Player.Character or Player.CharacterAdded:Wait()


local Black = TweenService:Create(script.Parent:WaitForChild("Black") ,TweenInfo.new(1, 
	Enum.EasingStyle.Linear,
	Enum.EasingDirection.Out),
	{Transparency = 0})
local UnBlack = TweenService:Create(script.Parent:WaitForChild("Black") ,TweenInfo.new(1, 
	Enum.EasingStyle.Linear,
	Enum.EasingDirection.Out),
	{Transparency = 1})

function UpCamera()
	Camera.CFrame = CameraGui.CFrame
	BlurLoging.Enabled = true
end

game:GetService("RunService").RenderStepped:Connect(UpCamera)

Button.MouseButton1Click:Connect(function()
	Black:Play()
	wait(3)
	Camera.CameraType = Enum.CameraType.Custom
	Black:Play()
	Button:Destroy()
	Lobby:Destroy()
	script.Parent.Frame1:Destroy()
	script:Destroy()
	BlurLoging.Enabled = false
	UnBlack:Play()
end)
