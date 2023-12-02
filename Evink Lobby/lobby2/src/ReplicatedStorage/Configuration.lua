local Configuration = {} 

Configuration.RunKey = Enum.KeyCode.LeftShift or Enum.KeyCode.RightShift -- Change this to your key

Configuration.WalkSpeed = 18
Configuration.RunSpeed = 23

Configuration.WalkFov = 80
Configuration.RunFov = 80
Configuration.TweenFovDuration = 0 -- How long it will take to change from the WalkFov to RunFov

return Configuration
