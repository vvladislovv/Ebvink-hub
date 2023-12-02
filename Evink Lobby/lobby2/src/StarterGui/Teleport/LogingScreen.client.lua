local WaspGame = game.Workspace.Games:WaitForChild("Wasp")
local PromtProxi = WaspGame:WaitForChild("Proxi"):WaitForChild("ProximityPrompt")
local TeleportServis = game:GetService("TeleportService")
local Player = game:GetService("Players").LocalPlayer	
local mFloor = math.floor
local Stop = 0 
local BillboardGui = game.Workspace.Games.Wasp.TimerWasp:WaitForChild("BillboardGui")

local Teleporting = script.Parent.Frame
local TextTeleporting = Teleporting.TextLabel
local CouldTime = task.wait(0.3)

local WaspPlaycdId = 14660174723

function GuiStart()
	script.Parent.Frame.Visible = true
	for i = 1,50 do
		Teleporting.Transparency -= 0.1
		TextTeleporting.TextTransparency -= 0.1
		wait()
	end
	while true do 
		TextTeleporting.Text = "Teleporting."
		wait(CouldTime)
		TextTeleporting.Text = "Teleporting.."
		wait(CouldTime)
		TextTeleporting.Text = "Teleporting..."
		wait(CouldTime)
		end
	end
	function TeleportPlacDI(Plr)
	if PromtProxi.Triggered then
		TeleportServis:SetTeleportGui(GuiStart())
	end

end

while true do task.wait(1)
	task.wait()
	local Time = 1704095999 - tick	() 
	local Days = mFloor((Time/60/60/24) %(365 + 0.2425))
	local Hours = mFloor((Time/60/60) % 24)
	local Minutes = mFloor((Time/60) % 60)
	local Seconds = mFloor(Time % 60)

	if Stop == 0 then
		BillboardGui.TextLabel.Text = Days.."Days "..Hours.."Hour "..Minutes.."Min "..Seconds.."Sec "
	end
	if Days == 0 and Hours == 0 and  Minutes == 0 and Seconds == 0 then
		Stop = 1
		PromtProxi.Enabled = true
		PromtProxi.Triggered:Connect(TeleportPlacDI)
	end
end









