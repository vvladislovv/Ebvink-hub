local City = game.Workspace.Games:WaitForChild("City")
local Plr = game:GetService("Players").LocalPlayer
local Char = script.Parent

local Cam  = game.Workspace.CurrentCamera
local HealtCamera = game.Workspace.CutCamera.Cameras:WaitForChild("HealtCamera")
local PlatformTouched = game.Workspace.CutCamera.PlatformCity:WaitForChild("HelatCut")
local TweenServer = game:GetService("TweenService")

local player = game.Players.LocalPlayer
local FrameStart = player:WaitForChild("PlayerGui"):WaitForChild("TextCutSceenHealt")
local FrameText = player:WaitForChild("PlayerGui"):WaitForChild("TextCutSceenHealt").Frame.Frame1.TextButton -- может быть из-за это 
local Platform = game.Workspace.CutCamera.PlatformCity:WaitForChild("HelatCut")

--local anim = script:WaitForChild('Animation')
--local Hum = game.Workspace.Games.Wasp.Model:WaitForChild('Humanoid')
--local Req = game:GetService("ReplicatedStorage")
--local AnimP = Hum:LoadAnimation(anim)



Char.Humanoid.Touched:Connect(function(hit:Instance)
	if hit:FindFirstAncestor("City") then
		hit = City
		if not hit:FindFirstChild("HighCity") then
			local HighCity = Instance.new("Highlight")
			HighCity.Parent = City
			HighCity.Name = "HighCity"

			HighCity.FillTransparency = 1
			HighCity.FillColor = Color3.fromRGB(255,255,255)
			HighCity.OutlineTransparency = 0.8
		elseif hit:FindFirstChild("HighCity") then
			hit.HighCity.Enabled = true
			wait(1)
			hit.Block.TouchEnded:Connect(function()
				hit.HighCity.Enabled = false
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
	if hit:FindFirstAncestor("PlatformCity") then
		UpFramer()
		Char.HumanoidRootPart.Anchored = true
		Char.Humanoid.WalkSpeed = 0
			TypeWtiteGui(FrameText, "Take away the trash!")
			wait(1)
			TypeWtiteGui(FrameText, "TAKE CARE OF OUR WORLD!")
			wait(1)
			TypeWtiteGui(FrameText, "##>##<####")
			wait(1)
			TypeWtiteGui(FrameText, "...")
			wait(1)
			OffFramer()
		--AnimP:Play()
			Char.Humanoid.PlatformStand = true
			Char.HumanoidRootPart.Anchored = true
		Tween(HealtCamera.Camera1, HealtCamera.Camera2, 1)
		Tween(HealtCamera.Camera2, HealtCamera.Camera3, 1)
		Tween(HealtCamera.Camera3, HealtCamera.Camera4, 1)
			Char.HumanoidRootPart.Anchored = false
			Char.Humanoid.PlatformStand = false
		--AnimP:Stop()

		PlatformTouched:Destroy()
	end
end)


-- Перестала рабоать именно для helatCut