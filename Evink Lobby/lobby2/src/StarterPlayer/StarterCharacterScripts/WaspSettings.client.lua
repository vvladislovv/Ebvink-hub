local Wasp = game.Workspace.Games:WaitForChild("Wasp")
local Plr = game:GetService("Players").LocalPlayer
local Char = script.Parent

local Cam  = game.Workspace.CurrentCamera
local CameraWasps = game.Workspace.CutCamera.Cameras:WaitForChild("WaspCamera")
local PlatformTouched = game.Workspace.CutCamera.PlatformWasp:WaitForChild("WaspCut")
local TweenServer = game:GetService("TweenService")

local player = game.Players.LocalPlayer
local FrameStart = player:WaitForChild("PlayerGui"):WaitForChild("TextCutSceen")
local FrameText = player:WaitForChild("PlayerGui"):WaitForChild("TextCutSceen").Frame.Frame1.TextButton -- может быть из-за это 
local Platform = game.Workspace.CutCamera.PlatformWasp:WaitForChild("WaspCut")
local Req = game:GetService("ReplicatedStorage")
--local AnimBook = Req:WaitForChild("AnimBook")
--local AnimBookStop = Req:WaitForChild("AnimBookStop")
local anim = script:WaitForChild('Animation')
local Hum = game.Workspace.Games.Wasp.Model:WaitForChild('Humanoid')
local AnimP = Hum:LoadAnimation(anim)



Char.Humanoid.Touched:Connect(function(hit:Instance)
	if hit:FindFirstAncestor("Wasp") then
		hit = Wasp
		if not hit:FindFirstChild("HighWasp") then
			local HighWasp = Instance.new("Highlight")
			HighWasp.Parent = Wasp
			HighWasp.Name = "HighWasp"

			HighWasp.FillTransparency = 1
			HighWasp.FillColor = Color3.fromRGB(255,255,255)
			HighWasp.OutlineTransparency = 0.8
		elseif hit:FindFirstChild("HighWasp") then
			hit.HighWasp.Enabled = true
			wait(1)
			hit.Block.TouchEnded:Connect(function()
				hit.HighWasp.Enabled = false
			end)
		end
	end
end)

function Tween(Camer1, Camer2, Time)

	local Teewin = TweenInfo.new(
		15,
		Enum.EasingStyle.Quad,
		Enum.EasingDirection.InOut,
		0,
		false
	)

	Cam.CameraType = Enum.CameraType.Scriptable
	Cam.CFrame = Camer1.CFrame

	local Tween = TweenServer:Create(Cam, Teewin, {CFrame = Camer2.CFrame})
	Tween:Play()
	wait(15)
	Cam.CameraType = Enum.CameraType.Custom
end

function TypeWtiteGui(Obiject, Text)
	for i = 1, #Text, 1 do
		Obiject.Text = string.sub(Text,1,i)
		wait(0.1)
	end
end

function UpFramer()
	FrameStart.Frame.Position = UDim2.new(0.274, 0,1, 0)

	if FrameStart.Frame.Visible == false then
		FrameStart.Frame.Visible = true
		FrameStart.Frame:TweenPosition(
			UDim2.new(0.274, 0,0.777, 0),
			"Out",
			"Quint",
			4, 
			true
		)
	else
		FrameStart.Frame.Position = UDim2.new(0.274, 0,1, 0)
		FrameStart.Frame.Visible = true
	end
	Platform:Destroy()

end

function OffFramer()
	FrameStart.Frame.Position = UDim2.new(0.274, 0,0.777, 0)

	if FrameStart.Frame.Visible == true then
		FrameStart.Frame:TweenPosition(
			UDim2.new(0.274, 0,3, 0),
			"Out",
			"Quint",
			4, 
			true
		)

	else
		FrameStart.Frame.Position = UDim2.new(0.274, 0,0.777, 0)
		FrameStart.Frame.Visible = true
	end
	Platform:Destroy()

end



Char.Humanoid.Touched:Connect(function(hit:Instance)
	if hit:FindFirstAncestor("PlatformWasp") then
		UpFramer()
		Char.HumanoidRootPart.Anchored = true
		Char.Humanoid.WalkSpeed = 0
			TypeWtiteGui(FrameText, "???")
			wait(5)
			TypeWtiteGui(FrameText, "WASP? WASP? WASP?")
			wait(5)
			TypeWtiteGui(FrameText, "##>##<####")
			wait(3)
			OffFramer()
		AnimP:Play()
			Char.Humanoid.PlatformStand = true
			Char.HumanoidRootPart.Anchored = true
			Tween(CameraWasps.Camera1, CameraWasps.Camera2, 1)
			Tween(CameraWasps.Camera2, CameraWasps.Camera3, 1)
			Tween(CameraWasps.Camera3, CameraWasps.Camera4, 1)
			Tween(CameraWasps.Camera4, CameraWasps.Camera5, 1)
			Char.HumanoidRootPart.Anchored = false
			Char.Humanoid.PlatformStand = false
		AnimP:Stop()

		PlatformTouched:Destroy()
	end
end)


