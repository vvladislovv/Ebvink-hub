local Loging = script.Parent.Frame1
local TextLoging = Loging.TextLabel
Loging.Visible = true
local CouldTime = task.wait(0.3)
GuiScreen = true
local Lobby = script.Parent.Lobby

function Text()
	TextLoging.Text = "Loading."
	wait(CouldTime)
	TextLoging.Text = "Loading.."
	wait(CouldTime)
	TextLoging.Text = "Loading..."
	wait(CouldTime)
	TextLoging.Text = "Loading."
	wait(CouldTime)
	TextLoging.Text = "Loading.."
	wait(CouldTime)
	TextLoging.Text = "Loading..."
	wait(CouldTime)
	TextLoging.Text = "Loading."
	wait(CouldTime)
	TextLoging.Text = "Loading.."
	wait(CouldTime)
	TextLoging.Text = "Loading..."
	wait(CouldTime)
	TextLoging.Text = "Loading."
	wait(CouldTime)
	TextLoging.Text = "Loading.."
	wait(CouldTime)
	TextLoging.Text = "Loading..."
	wait(CouldTime)
	TextLoging.Text = "Loading."
	wait(CouldTime)
	TextLoging.Text = "Loading.."
	wait(CouldTime)
	TextLoging.Text = "Loading..."
	wait(CouldTime)
end
Text()
for i = 1,20 do
	Loging.Transparency += 0.1
	TextLoging.Transparency += 0.1
	wait()
	Lobby.Visible = true
end




	
	

