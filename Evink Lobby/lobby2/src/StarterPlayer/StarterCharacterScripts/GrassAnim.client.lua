local char = script.Parent

local plr = game:GetService("Players").LocalPlayer

local rnd = Random.new()

local foliageTouching = {}

local shakeIterations = 1
local shakeSpeed = 0.1
local shakeScale = 0.5
char.Humanoid.Touched:Connect(function(hit:Instance, bodyPart:Instance)

	if hit:FindFirstAncestor("InteractiveFoliage") and not table.find(foliageTouching, hit) then
		table.insert(foliageTouching, hit)

		--hit.Name = rnd:NextNumber()

		if not hit:FindFirstChild("OriginalCFrame") then
			local originalCF = Instance.new("CFrameValue")
			originalCF.Name = "OriginalCFrame"
			originalCF.Value = hit.CFrame
			originalCF.Parent = hit
		end

		bodyPart.TouchEnded:Wait()
		table.remove(foliageTouching, table.find(foliageTouching, hit))

		if not hit:FindFirstChild("EffectGrass") then
			local Effect = Instance.new("ParticleEmitter")
			Effect.Parent = hit
			Effect.Name = "EffectGrass"
			
			Effect.Color = ColorSequence.new(Color3.fromRGB(115, 115, 115))
			Effect.Size = NumberSequence.new(1.5)
			Effect.Texture = "rbxassetid://14701667767"
			Effect.Transparency = NumberSequence.new
			{
				NumberSequenceKeypoint.new(0,0.119),
				NumberSequenceKeypoint.new(0.541,0.494,0.0375), 
				NumberSequenceKeypoint.new(0.747, 0.764,0.1), 
				NumberSequenceKeypoint.new(1, 0.831)
			}
			Effect.Lifetime = NumberRange.new(1,2)

			Effect.Rate = 40
			Effect.RotSpeed = NumberRange.new(360,360)
			Effect.Speed = NumberRange.new(2)
			Effect.SpreadAngle = Vector2.new(360,360)
			Effect.Shape = Enum.ParticleEmitterShape.Cylinder
			Effect.TimeScale = 1
			--Effect.Enabled = false
		
			
		elseif hit:FindFirstChild("EffectGrass") then
			hit.EffectGrass.Color = ColorSequence.new(Color3.fromRGB(115, 115, 115))
			hit.EffectGrass.Size = NumberSequence.new(1.5)
			hit.EffectGrass.Texture = "rbxassetid://14701667767"
			hit.EffectGrass.Transparency = NumberSequence.new
			{
				NumberSequenceKeypoint.new(0,0.119),
				NumberSequenceKeypoint.new(1, 0.831)
			}
			hit.EffectGrass.Lifetime = NumberRange.new(1,2)

			hit.EffectGrass.Rate = 40
			hit.EffectGrass.RotSpeed = NumberRange.new(360,360)
			hit.EffectGrass.Speed = NumberRange.new(2)
			hit.EffectGrass.SpreadAngle = Vector2.new(360,360)
			hit.EffectGrass.Shape = Enum.ParticleEmitterShape.Cylinder
			hit.EffectGrass.TimeScale = 1
			--hit.EffectGrass.Enabled = false
			
			hit.EffectGrass.Enabled = true
			wait(2)
			hit.EffectGrass.Enabled = false
				
		

	--[[
			hit.Touched:Connect(function(Hit)
				local Char = Hit:FindFirstAncestorOfClass("Model")
				if plr.Character == nil then return end
				if char ~= plr.Character then return end
				if char:FindFirstChild("Humanoid") then
				Effect.Enabled = true
				task.wait(2)
				Effect.Enabled = false
				hit.TouchEnded:Connect(function()
						Effect.Enabled = false
						
					end)
					end
			end)

				]]
	
		end	
		
	end

end)


game:GetService("RunService").Heartbeat:Connect(function()

	local v = char.HumanoidRootPart.AssemblyLinearVelocity.Magnitude
	
	if v > 0.1 then
		for _, foliage in pairs(foliageTouching) do
			shakeIterations += shakeSpeed

			local seed = tonumber(foliage.Name)

			local x = math.noise(tick() * shakeSpeed, shakeIterations, seed) * shakeScale
			local y = math.noise(tick() * shakeSpeed, shakeIterations + 1, seed) * shakeScale
			local z = math.noise(tick() * shakeSpeed, shakeIterations + 2, seed) * shakeScale

			local newCF = foliage.OriginalCFrame.Value
			newCF += Vector3.new(x, y, z)
			newCF *= CFrame.Angles(x, y, z)
			newCF = foliage.CFrame:Lerp(newCF, 0.1)
			
			foliage.CFrame = newCF
		end
	end
end)

