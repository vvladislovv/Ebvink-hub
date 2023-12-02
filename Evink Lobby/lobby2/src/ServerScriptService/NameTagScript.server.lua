local rep = game:GetService("ReplicatedStorage") --You can change this to ServerStorage for more security.
local nametag = rep.NameTag 

local TableDev = {
	707163568,
	372974866
}


game.Players.PlayerAdded:Connect(function(player)
	player.CharacterAdded:Connect(function(char)

		local head = char:WaitForChild("HumanoidRootPart")
		local newtext = nametag:Clone() --Cloning the text.
		local uppertext = newtext.UpperText
		local lowertext = newtext.LowerText
		local humanoid = char.Humanoid

		humanoid.DisplayDistanceType = "None"

		--Main Text
		newtext.Parent = head
		newtext.Adornee = head
		uppertext.Text = player.Name

		for _, Tags in pairs(TableDev) do
			if table.find(TableDev, player.UserId) then 
				lowertext.Text = "Developer"
				lowertext.TextColor3 = Color3.fromRGB(60, 255, 109)
			else
				lowertext.Text = "Snail"
				lowertext.TextColor3 = Color3.fromRGB(234, 221, 170)
			end
		end
	end)
end)
