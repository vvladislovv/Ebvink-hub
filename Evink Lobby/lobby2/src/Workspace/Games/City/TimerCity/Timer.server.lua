local PromtProxi = script.Parent.Parent.Proxi.ProximityPrompt
local TeleportServis = game:GetService("TeleportService")
local Player = game:GetService("Players")
local mFloor = math.floor
local Stop = 0 

local WaspPlaycdId = 14660173760

function TeleportPlacDI(Plr)

	if PromtProxi.Triggered then
		TeleportServis:TeleportAsync(WaspPlaycdId, {Plr})
	end
end
--PromtProxi.Enabled = true
PromtProxi.Triggered:Connect(TeleportPlacDI)






