--[[




  _____  _ _                 ______               
 |  __ \(_) |               |  ____|              
 | |__) |_| |__   __ _      | |__  __  _____  ___ 
 |  _  /| | '_ \ / _` |     |  __| \ \/ / _ \/ __|
 | | \ \| | |_) | (_| |     | |____ >  <  __/ (__ 
 |_|  \_\_|_.__/ \__,_|     |______/_/\_\___|\___|
                                                  
                                                  


]]

local RibaExec = Instance.new("ScreenGui")
local MainFrame = Instance.new("Frame")
local Icon = Instance.new("ImageLabel")
local Title = Instance.new("TextLabel")
local Close = Instance.new("TextButton")
local CodeBox = Instance.new("TextBox")
local Execute = Instance.new("ImageButton")
local Clear = Instance.new("ImageButton")
local ExitDialog = Instance.new("Frame")
local Title_2 = Instance.new("TextLabel")
local Yes = Instance.new("TextButton")
local No = Instance.new("TextButton")

RibaExec.Name = "RibaExec"
RibaExec.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
RibaExec.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

MainFrame.Name = "MainFrame"
MainFrame.Parent = RibaExec
MainFrame.BackgroundColor3 = Color3.fromRGB(16, 16, 16)
MainFrame.BackgroundTransparency = 0.300
MainFrame.BorderColor3 = Color3.fromRGB(0, 0, 0)
MainFrame.BorderSizePixel = 0
MainFrame.Position = UDim2.new(0.258518517, 0, 0.290201008, 0)
MainFrame.Size = UDim2.new(0, 535, 0, 333)

Icon.Name = "Icon"
Icon.Parent = MainFrame
Icon.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Icon.BackgroundTransparency = 1.000
Icon.BorderColor3 = Color3.fromRGB(0, 0, 0)
Icon.BorderSizePixel = 0
Icon.Position = UDim2.new(0.0242990647, 0, 0.00600600615, 0)
Icon.Size = UDim2.new(0, 65, 0, 65)
Icon.Image = "http://www.roblox.com/asset/?id=5246846179"

Title.Name = "Title"
Title.Parent = MainFrame
Title.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Title.BackgroundTransparency = 1.000
Title.BorderColor3 = Color3.fromRGB(0, 0, 0)
Title.BorderSizePixel = 0
Title.Position = UDim2.new(0.145794392, 0, 0.0510510504, 0)
Title.Size = UDim2.new(0, 120, 0, 50)
Title.Font = Enum.Font.Unknown
Title.Text = "Riba Exec"
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.TextScaled = true
Title.TextSize = 14.000
Title.TextWrapped = true

Close.Name = "Close"
Close.Parent = MainFrame
Close.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Close.BackgroundTransparency = 1.000
Close.BorderColor3 = Color3.fromRGB(0, 0, 0)
Close.BorderSizePixel = 0
Close.Position = UDim2.new(0.897196233, 0, 0.033033032, 0)
Close.Size = UDim2.new(0, 47, 0, 47)
Close.Font = Enum.Font.FredokaOne
Close.Text = "X"
Close.TextColor3 = Color3.fromRGB(135, 9, 0)
Close.TextScaled = true
Close.TextSize = 14.000
Close.TextStrokeTransparency = 0.000
Close.TextWrapped = true

CodeBox.Name = "CodeBox"
CodeBox.Parent = MainFrame
CodeBox.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
CodeBox.BackgroundTransparency = 1.000
CodeBox.BorderColor3 = Color3.fromRGB(0, 0, 0)
CodeBox.BorderSizePixel = 0
CodeBox.Position = UDim2.new(0.0242990647, 0, 0.219219223, 0)
CodeBox.Size = UDim2.new(0, 508, 0, 200)
CodeBox.ClearTextOnFocus = false
CodeBox.Font = Enum.Font.Nunito
CodeBox.MultiLine = true
CodeBox.PlaceholderText = "-- code here"
CodeBox.Text = ""
CodeBox.TextColor3 = Color3.fromRGB(255, 255, 255)
CodeBox.TextSize = 20.000
CodeBox.TextWrapped = true
CodeBox.TextXAlignment = Enum.TextXAlignment.Left
CodeBox.TextYAlignment = Enum.TextYAlignment.Top

Execute.Name = "Execute"
Execute.Parent = MainFrame
Execute.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Execute.BackgroundTransparency = 1.000
Execute.BorderColor3 = Color3.fromRGB(0, 0, 0)
Execute.BorderSizePixel = 0
Execute.Position = UDim2.new(0.041121494, 0, 0.840840816, 0)
Execute.Size = UDim2.new(0, 46, 0, 46)
Execute.Image = "rbxassetid://18684345702"

Clear.Name = "Clear"
Clear.Parent = MainFrame
Clear.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Clear.BackgroundTransparency = 1.000
Clear.BorderColor3 = Color3.fromRGB(0, 0, 0)
Clear.BorderSizePixel = 0
Clear.Position = UDim2.new(0.145794392, 0, 0.840840816, 0)
Clear.Size = UDim2.new(0, 46, 0, 46)
Clear.Image = "rbxassetid://14002627157"

ExitDialog.Name = "ExitDialog"
ExitDialog.Parent = RibaExec
ExitDialog.BackgroundColor3 = Color3.fromRGB(16, 16, 16)
ExitDialog.BackgroundTransparency = 0.300
ExitDialog.BorderColor3 = Color3.fromRGB(0, 0, 0)
ExitDialog.BorderSizePixel = 0
ExitDialog.Position = UDim2.new(0.258518517, 0, 0.290201008, 0)
ExitDialog.Size = UDim2.new(0, 535, 0, 333)
ExitDialog.Visible = false

Title_2.Name = "Title"
Title_2.Parent = ExitDialog
Title_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Title_2.BackgroundTransparency = 1.000
Title_2.BorderColor3 = Color3.fromRGB(0, 0, 0)
Title_2.BorderSizePixel = 0
Title_2.Position = UDim2.new(0.0242990647, 0, 0.0510510504, 0)
Title_2.Size = UDim2.new(0, 508, 0, 50)
Title_2.Font = Enum.Font.Unknown
Title_2.Text = "Are you sure you wanna exit?"
Title_2.TextColor3 = Color3.fromRGB(255, 255, 255)
Title_2.TextScaled = true
Title_2.TextSize = 14.000
Title_2.TextWrapped = true

Yes.Name = "Yes"
Yes.Parent = ExitDialog
Yes.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Yes.BackgroundTransparency = 1.000
Yes.BorderColor3 = Color3.fromRGB(0, 0, 0)
Yes.BorderSizePixel = 0
Yes.Position = UDim2.new(0.041121494, 0, 0.813813806, 0)
Yes.Size = UDim2.new(0, 81, 0, 47)
Yes.Font = Enum.Font.FredokaOne
Yes.Text = "Yes"
Yes.TextColor3 = Color3.fromRGB(255, 255, 255)
Yes.TextScaled = true
Yes.TextSize = 14.000
Yes.TextStrokeTransparency = 0.000
Yes.TextWrapped = true

No.Name = "No"
No.Parent = ExitDialog
No.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
No.BackgroundTransparency = 1.000
No.BorderColor3 = Color3.fromRGB(0, 0, 0)
No.BorderSizePixel = 0
No.Position = UDim2.new(0.822429895, 0, 0.813813806, 0)
No.Size = UDim2.new(0, 81, 0, 47)
No.Font = Enum.Font.FredokaOne
No.Text = "No"
No.TextColor3 = Color3.fromRGB(255, 255, 255)
No.TextScaled = true
No.TextSize = 14.000
No.TextStrokeTransparency = 0.000
No.TextWrapped = true

-- Scripts:

local function BHETRB_fake_script() -- Close.LocalScript 
	local script = Instance.new('LocalScript', Close)

	script.Parent.MouseButton1Click:Connect(function()
		script.Parent.Parent.Visible = false
		script.Parent.Parent.Parent.ExitDialog.Visible = true
		script.Parent.Parent.Parent.ExitDialog.Position = script.Parent.Parent.Position
	end)
	
	script.Parent.MouseEnter:Connect(function()
		script.Parent.BackgroundTransparency = 0.6
	end)
	
	script.Parent.MouseLeave:Connect(function()
		script.Parent.BackgroundTransparency = 1
	end)
end
coroutine.wrap(BHETRB_fake_script)()
local function FSGAPWX_fake_script() -- MainFrame.Drag 
	local script = Instance.new('LocalScript', MainFrame)

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
coroutine.wrap(FSGAPWX_fake_script)()
local function TGWJV_fake_script() -- Execute.LocalScript 
	local script = Instance.new('LocalScript', Execute)

	script.Parent.MouseEnter:Connect(function()
		script.Parent.BackgroundTransparency = 0.6
	end)
	
	script.Parent.MouseLeave:Connect(function()
		script.Parent.BackgroundTransparency = 1
	end)
	
	script.Parent.MouseButton1Click:Connect(function()
		loadstring(script.Parent.Parent.CodeBox.Text)()
	end)
end
coroutine.wrap(TGWJV_fake_script)()
local function HWAMBE_fake_script() -- Clear.LocalScript 
	local script = Instance.new('LocalScript', Clear)

	script.Parent.MouseEnter:Connect(function()
		script.Parent.BackgroundTransparency = 0.6
	end)
	
	script.Parent.MouseLeave:Connect(function()
		script.Parent.BackgroundTransparency = 1
	end)
	
	script.Parent.MouseButton1Click:Connect(function()
		script.Parent.Parent.CodeBox.Text = ""
	end)
end
coroutine.wrap(HWAMBE_fake_script)()
local function MRXNDEU_fake_script() -- Yes.LocalScript 
	local script = Instance.new('LocalScript', Yes)

	script.Parent.MouseButton1Click:Connect(function()
		script.Parent.Parent.Parent:Destroy()
	end)
end
coroutine.wrap(MRXNDEU_fake_script)()
local function EVQG_fake_script() -- No.LocalScript 
	local script = Instance.new('LocalScript', No)

	script.Parent.MouseButton1Click:Connect(function()
		script.Parent.Parent.Visible = false
		script.Parent.Parent.Parent.MainFrame.Visible = true
	end)
end
coroutine.wrap(EVQG_fake_script)()
