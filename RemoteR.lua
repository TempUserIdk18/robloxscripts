-- RemoteR 0.01 🌙



































































































































































































local Converted = {
	["_RemoteR"] = Instance.new("ScreenGui");
	["_Frame"] = Instance.new("Frame");
	["_Title"] = Instance.new("Frame");
	["_TextLabel"] = Instance.new("TextLabel");
	["_UIDrag"] = Instance.new("LocalScript");
	["_C"] = Instance.new("TextButton");
	["_LocalScript"] = Instance.new("LocalScript");
	["_LocalScript1"] = Instance.new("LocalScript");
	["_ScrollingFrame"] = Instance.new("ScrollingFrame");
	["_UIStroke"] = Instance.new("UIStroke");
	["_UIListLayout"] = Instance.new("UIListLayout");
	["_Template"] = Instance.new("TextButton");
	["_Remote"] = Instance.new("Frame");
	["_ScrollingFrame1"] = Instance.new("ScrollingFrame");
	["_TextBox"] = Instance.new("TextBox");
	["_UIStroke1"] = Instance.new("UIStroke");
	["_Run"] = Instance.new("TextButton");
	["_UICorner"] = Instance.new("UICorner");
	["_UIStroke2"] = Instance.new("UIStroke");
	["_Clear"] = Instance.new("TextButton");
	["_UIStroke3"] = Instance.new("UIStroke");
	["_UICorner1"] = Instance.new("UICorner");
	["_TextBox1"] = Instance.new("TextBox");
}

-- Properties:

Converted["_RemoteR"].DisplayOrder = 99999
Converted["_RemoteR"].IgnoreGuiInset = true
Converted["_RemoteR"].ScreenInsets = Enum.ScreenInsets.DeviceSafeInsets
Converted["_RemoteR"].ResetOnSpawn = false
Converted["_RemoteR"].ZIndexBehavior = Enum.ZIndexBehavior.Sibling
Converted["_RemoteR"].Name = "RemoteR"
Converted["_RemoteR"].Parent = game:GetService("CoreGui")

Converted["_Frame"].AnchorPoint = Vector2.new(0.5, 0.5)
Converted["_Frame"].BackgroundColor3 = Color3.fromRGB(55.000004321336746, 55.000004321336746, 62.00000390410423)
Converted["_Frame"].BorderColor3 = Color3.fromRGB(0, 0, 0)
Converted["_Frame"].BorderSizePixel = 0
Converted["_Frame"].Position = UDim2.new(0.5, 0, 0.5, 0)
Converted["_Frame"].Size = UDim2.new(0, 363, 0, 200)
Converted["_Frame"].Parent = Converted["_RemoteR"]

Converted["_Title"].AnchorPoint = Vector2.new(0.5, 0.5)
Converted["_Title"].BackgroundColor3 = Color3.fromRGB(38.0000015348196, 38.0000015348196, 38.0000015348196)
Converted["_Title"].BorderColor3 = Color3.fromRGB(0, 0, 0)
Converted["_Title"].BorderSizePixel = 0
Converted["_Title"].Position = UDim2.new(0.5, 0, 0.0500000007, 0)
Converted["_Title"].Size = UDim2.new(0, 363, 0, 21)
Converted["_Title"].Name = "Title"
Converted["_Title"].Parent = Converted["_Frame"]

Converted["_TextLabel"].Font = Enum.Font.GothamBold
Converted["_TextLabel"].Text = " RemoteR"
Converted["_TextLabel"].TextColor3 = Color3.fromRGB(255, 255, 255)
Converted["_TextLabel"].TextSize = 15
Converted["_TextLabel"].TextWrapped = true
Converted["_TextLabel"].TextXAlignment = Enum.TextXAlignment.Left
Converted["_TextLabel"].BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Converted["_TextLabel"].BackgroundTransparency = 1
Converted["_TextLabel"].BorderColor3 = Color3.fromRGB(0, 0, 0)
Converted["_TextLabel"].BorderSizePixel = 0
Converted["_TextLabel"].Size = UDim2.new(1, 0, 1, 0)
Converted["_TextLabel"].Parent = Converted["_Title"]

Converted["_C"].Font = Enum.Font.SourceSans
Converted["_C"].Text = "×"
Converted["_C"].TextColor3 = Color3.fromRGB(255, 255, 255)
Converted["_C"].TextScaled = true
Converted["_C"].TextSize = 14
Converted["_C"].TextWrapped = true
Converted["_C"].AutoButtonColor = false
Converted["_C"].BackgroundColor3 = Color3.fromRGB(38.0000015348196, 38.0000015348196, 38.0000015348196)
Converted["_C"].BorderColor3 = Color3.fromRGB(0, 0, 0)
Converted["_C"].BorderSizePixel = 0
Converted["_C"].Position = UDim2.new(0.944903553, 0, -0.0238095243, 0)
Converted["_C"].Size = UDim2.new(0, 20, 0, 20)
Converted["_C"].Name = "C"
Converted["_C"].Parent = Converted["_Title"]

Converted["_ScrollingFrame"].AutomaticCanvasSize = Enum.AutomaticSize.XY
Converted["_ScrollingFrame"].CanvasSize = UDim2.new(0, 0, 5, 0)
Converted["_ScrollingFrame"].ScrollBarImageColor3 = Color3.fromRGB(9.000000413507223, 9.000000413507223, 13.00000112503767)
Converted["_ScrollingFrame"].Active = true
Converted["_ScrollingFrame"].BackgroundColor3 = Color3.fromRGB(32.00000189244747, 32.00000189244747, 42.000001296401024)
Converted["_ScrollingFrame"].BorderColor3 = Color3.fromRGB(0, 0, 0)
Converted["_ScrollingFrame"].BorderSizePixel = 0
Converted["_ScrollingFrame"].Position = UDim2.new(0.0220385678, 0, 0.140714109, 0)
Converted["_ScrollingFrame"].Size = UDim2.new(0, 143, 0, 165)
Converted["_ScrollingFrame"].Parent = Converted["_Frame"]

Converted["_UIStroke"].Color = Color3.fromRGB(60.00000402331352, 64.00000378489494, 83.00000265240669)
Converted["_UIStroke"].Thickness = 2
Converted["_UIStroke"].Parent = Converted["_ScrollingFrame"]

Converted["_UIListLayout"].SortOrder = Enum.SortOrder.LayoutOrder
Converted["_UIListLayout"].Parent = Converted["_ScrollingFrame"]

Converted["_Template"].Font = Enum.Font.Gotham
Converted["_Template"].TextColor3 = Color3.fromRGB(255, 255, 255)
Converted["_Template"].TextScaled = true
Converted["_Template"].TextSize = 14
Converted["_Template"].TextWrapped = true
Converted["_Template"].TextXAlignment = Enum.TextXAlignment.Left
Converted["_Template"].AutoButtonColor = false
Converted["_Template"].BackgroundColor3 = Color3.fromRGB(32.00000189244747, 32.00000189244747, 42.000001296401024)
Converted["_Template"].BorderColor3 = Color3.fromRGB(0, 0, 0)
Converted["_Template"].BorderSizePixel = 0
Converted["_Template"].Size = UDim2.new(1, 0, 0, 20)
Converted["_Template"].Visible = false
Converted["_Template"].Name = "Template"
Converted["_Template"].Parent = Converted["_ScrollingFrame"]

Converted["_Remote"].BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Converted["_Remote"].BackgroundTransparency = 1
Converted["_Remote"].BorderColor3 = Color3.fromRGB(0, 0, 0)
Converted["_Remote"].BorderSizePixel = 0
Converted["_Remote"].Position = UDim2.new(0.415977955, 0, 0.140000001, 0)
Converted["_Remote"].Size = UDim2.new(0, 211, 0, 165)
Converted["_Remote"].Name = "Remote"
Converted["_Remote"].Parent = Converted["_Frame"]

Converted["_ScrollingFrame1"].AutomaticCanvasSize = Enum.AutomaticSize.XY
Converted["_ScrollingFrame1"].ScrollBarImageColor3 = Color3.fromRGB(0, 0, 0)
Converted["_ScrollingFrame1"].Active = true
Converted["_ScrollingFrame1"].BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Converted["_ScrollingFrame1"].BackgroundTransparency = 1
Converted["_ScrollingFrame1"].BorderColor3 = Color3.fromRGB(0, 0, 0)
Converted["_ScrollingFrame1"].BorderSizePixel = 0
Converted["_ScrollingFrame1"].Position = UDim2.new(0.0331753567, 0, 0, 0)
Converted["_ScrollingFrame1"].Size = UDim2.new(0, 194, 0, 114)
Converted["_ScrollingFrame1"].Parent = Converted["_Remote"]

Converted["_TextBox"].ClearTextOnFocus = false
Converted["_TextBox"].CursorPosition = -1
Converted["_TextBox"].Font = Enum.Font.Code
Converted["_TextBox"].PlaceholderText = "type args here..."
Converted["_TextBox"].Text = ""
Converted["_TextBox"].TextColor3 = Color3.fromRGB(255, 255, 255)
Converted["_TextBox"].TextSize = 14
Converted["_TextBox"].TextXAlignment = Enum.TextXAlignment.Left
Converted["_TextBox"].TextYAlignment = Enum.TextYAlignment.Top
Converted["_TextBox"].AutomaticSize = Enum.AutomaticSize.XY
Converted["_TextBox"].BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Converted["_TextBox"].BackgroundTransparency = 1
Converted["_TextBox"].BorderColor3 = Color3.fromRGB(0, 0, 0)
Converted["_TextBox"].BorderSizePixel = 0
Converted["_TextBox"].Size = UDim2.new(1, 0, 1, 0)
Converted["_TextBox"].Parent = Converted["_ScrollingFrame1"]

Converted["_UIStroke1"].ApplyStrokeMode = Enum.ApplyStrokeMode.Border
Converted["_UIStroke1"].Color = Color3.fromRGB(30.00000201165676, 30.00000201165676, 30.00000201165676)
Converted["_UIStroke1"].LineJoinMode = Enum.LineJoinMode.Miter
Converted["_UIStroke1"].Parent = Converted["_ScrollingFrame1"]

Converted["_Run"].Font = Enum.Font.SourceSans
Converted["_Run"].Text = "Run"
Converted["_Run"].TextColor3 = Color3.fromRGB(255, 255, 255)
Converted["_Run"].TextSize = 20
Converted["_Run"].TextWrapped = true
Converted["_Run"].BackgroundColor3 = Color3.fromRGB(40.00000141561031, 39.00000147521496, 57.00000420212746)
Converted["_Run"].BackgroundTransparency = 0.05000000074505806
Converted["_Run"].BorderColor3 = Color3.fromRGB(0, 0, 0)
Converted["_Run"].BorderSizePixel = 0
Converted["_Run"].Position = UDim2.new(0.0663507134, 0, 0.75757575, 0)
Converted["_Run"].Size = UDim2.new(0, 66, 0, 30)
Converted["_Run"].Name = "Run"
Converted["_Run"].Parent = Converted["_Remote"]

Converted["_UICorner"].CornerRadius = UDim.new(0, 5)
Converted["_UICorner"].Parent = Converted["_Run"]

Converted["_UIStroke2"].ApplyStrokeMode = Enum.ApplyStrokeMode.Border
Converted["_UIStroke2"].Color = Color3.fromRGB(41.00000135600567, 42.000001296401024, 67.00000360608101)
Converted["_UIStroke2"].Thickness = 1.5
Converted["_UIStroke2"].Parent = Converted["_Run"]

Converted["_Clear"].Font = Enum.Font.SourceSans
Converted["_Clear"].Text = "Clear"
Converted["_Clear"].TextColor3 = Color3.fromRGB(255, 255, 255)
Converted["_Clear"].TextSize = 20
Converted["_Clear"].TextWrapped = true
Converted["_Clear"].BackgroundColor3 = Color3.fromRGB(40.00000141561031, 39.00000147521496, 57.00000420212746)
Converted["_Clear"].BackgroundTransparency = 0.05000000074505806
Converted["_Clear"].BorderColor3 = Color3.fromRGB(0, 0, 0)
Converted["_Clear"].BorderSizePixel = 0
Converted["_Clear"].Position = UDim2.new(0.407582939, 0, 0.75757575, 0)
Converted["_Clear"].Size = UDim2.new(0, 66, 0, 30)
Converted["_Clear"].Name = "Clear"
Converted["_Clear"].Parent = Converted["_Remote"]

Converted["_UIStroke3"].ApplyStrokeMode = Enum.ApplyStrokeMode.Border
Converted["_UIStroke3"].Color = Color3.fromRGB(41.00000135600567, 42.000001296401024, 67.00000360608101)
Converted["_UIStroke3"].Thickness = 1.5
Converted["_UIStroke3"].Parent = Converted["_Clear"]

Converted["_UICorner1"].CornerRadius = UDim.new(0, 5)
Converted["_UICorner1"].Parent = Converted["_Clear"]

Converted["_TextBox1"].ClearTextOnFocus = false
Converted["_TextBox1"].CursorPosition = -1
Converted["_TextBox1"].Font = Enum.Font.Code
Converted["_TextBox1"].PlaceholderText = "Arg Index"
Converted["_TextBox1"].Text = ""
Converted["_TextBox1"].TextColor3 = Color3.fromRGB(255, 255, 255)
Converted["_TextBox1"].TextScaled = true
Converted["_TextBox1"].TextSize = 14
Converted["_TextBox1"].TextWrapped = true
Converted["_TextBox1"].BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Converted["_TextBox1"].BackgroundTransparency = 1
Converted["_TextBox1"].BorderColor3 = Color3.fromRGB(0, 0, 0)
Converted["_TextBox1"].BorderSizePixel = 0
Converted["_TextBox1"].Position = UDim2.new(0.734597147, 0, 0.727272749, 0)
Converted["_TextBox1"].Size = UDim2.new(-0.68246448, 194, 0.218181819, 0)
Converted["_TextBox1"].Parent = Converted["_Remote"]

-- Fake Module Scripts:

local fake_module_scripts = {}


-- Fake Local Scripts:

local function EIWGARN_fake_script() -- Fake Script: StarterGui.RemoteR.Frame.Title.UIDrag
    local script = Instance.new("LocalScript")
    script.Name = "UIDrag"
    script.Parent = Converted["_Title"]
    local req = require
    local require = function(obj)
        local fake = fake_module_scripts[obj]
        if fake then
            return fake()
        end
        return req(obj)
    end

	-- Made by Real_IceyDev (@lceyDex) --
	-- Edited to drag script.Parent.Parent only when clicking script.Parent --
	
	local UIS = game:GetService('UserInputService')
	local dragTarget = script.Parent.Parent
	local clickDetector = script.Parent
	local dragToggle = nil
	local dragSpeed = 0.15
	local dragStart = nil
	local startPos = nil
	
	local function updateInput(input)
		local delta = input.Position - dragStart
		local position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X,
			startPos.Y.Scale, startPos.Y.Offset + delta.Y)
		game:GetService('TweenService'):Create(dragTarget, TweenInfo.new(dragSpeed), {Position = position}):Play()
	end
	
	clickDetector.InputBegan:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then 
			dragToggle = true
			dragStart = input.Position
			startPos = dragTarget.Position
			input.Changed:Connect(function()
				if input.UserInputState == Enum.UserInputState.End then
					dragToggle = false
				end
			end)
		end
	end)
	
	UIS.InputChanged:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
			if dragToggle then
				updateInput(input)
			end
		end
	end)
	
end
local function DKCUMG_fake_script() -- Fake Script: StarterGui.RemoteR.Frame.Title.C.LocalScript
    local script = Instance.new("LocalScript")
    script.Name = "LocalScript"
    script.Parent = Converted["_C"]
    local req = require
    local require = function(obj)
        local fake = fake_module_scripts[obj]
        if fake then
            return fake()
        end
        return req(obj)
    end

	script.Parent.MouseEnter:Connect(function()
		script.Parent.BackgroundColor3=Color3.fromRGB(141, 0, 0)
	end)
	script.Parent.MouseLeave:Connect(function()
		script.Parent.BackgroundColor3=Color3.fromRGB(38, 38, 38)
	end)
	script.Parent.MouseButton1Click:Connect(function()
		script.Parent.Parent.Parent.Parent:Destroy()
	end)
end
local function DBTNRH_fake_script() -- Fake Script: StarterGui.RemoteR.Frame.LocalScript
    local script = Instance.new("LocalScript")
    script.Name = "LocalScript"
    script.Parent = Converted["_Frame"]
    local req = require
    local require = function(obj)
        local fake = fake_module_scripts[obj]
        if fake then
            return fake()
        end
        return req(obj)
    end

	local Players = game:GetService("Players")
	local player = Players.LocalPlayer
	local gui = script.Parent
	local scrollingFrame = gui.ScrollingFrame
	local remoteFrame = gui.Remote
	local argTextBox = remoteFrame.TextBox
	local codeTextBox = remoteFrame.ScrollingFrame.TextBox
	local runButton = remoteFrame.Run
	
	gui.MouseEnter:Connect(function()
		player:GetMouse().Icon = "rbxassetid://18609419171"
	end)
	
	gui.MouseLeave:Connect(function()
		player:GetMouse().Icon = ""
	end)
	
	local selectedRemote = nil
	local selectedButton = nil
	
	local function createRemoteButton(remote)
		local template = scrollingFrame.Template
		if not template then return end
	
		local button = template:Clone()
		button.Name = remote.Name
		button.Text = remote.Name
		button.Visible = true
		button.Parent = scrollingFrame
	
		button.MouseButton1Click:Connect(function()
			selectedRemote = remote
			if selectedButton then
				selectedButton.BackgroundColor3 = Color3.fromRGB(32, 32, 42)
			end
			button.BackgroundColor3 = Color3.fromRGB(47, 47, 62)
			selectedButton = button
		end)
	end
	
	for _, remote in ipairs(game:GetDescendants()) do
		if remote:IsA("RemoteEvent") then
			createRemoteButton(remote)
		end
	end
	
	local argUse = 1
	argTextBox:GetPropertyChangedSignal("Text"):Connect(function()
		local input = argTextBox.Text:gsub("%D", "")
		if input == "" then
			argUse = nil -- or set it to smth else if u want
			return
		end
	
		local num = tonumber(input)
		if not num or num < 1 then
			num = 1
			input = "1"
		end
	
		argTextBox.Text = input
		argUse = num
	end)
	
	
	
	runButton.MouseButton1Click:Connect(function()
		if not selectedRemote then return end
	
		local codeText = codeTextBox.Text
		local lines = string.split(codeText, "\n")
		local cleanedLines = {}
	
		for _, line in ipairs(lines) do
			if line ~= nil then
				table.insert(cleanedLines, line)
			end
		end
		while #cleanedLines > 0 and cleanedLines[#cleanedLines] == "" do
			table.remove(cleanedLines, #cleanedLines)
		end
		lines = cleanedLines
	
		local code
		if #lines == 0 then
			code = ""
		elseif argUse > #lines then
			code = lines[1]
		else
			code = lines[argUse] or ""
		end
		if code == nil then code = "" end
	
		local args = {}
		for i = 1, argUse do
			args[i] = i == argUse and code or ""
		end
	
		selectedRemote:FireServer(unpack(args))
	end)
	game.DescendantAdded:Connect(function(desc)
		if desc:IsA("RemoteEvent") then
			createRemoteButton(desc)
		end
	end)
	
	game.DescendantRemoving:Connect(function(desc)
		if desc:IsA("RemoteEvent") then
			local btn = scrollingFrame:FindFirstChild(desc.Name)
			if btn then
				if selectedRemote == desc then
					selectedRemote = nil
					selectedButton = nil
					codeTextBox.Text = ""
				end
				btn:Destroy()
			end
		end
	end)
	
end

coroutine.wrap(EIWGARN_fake_script)()
coroutine.wrap(DKCUMG_fake_script)()
coroutine.wrap(DBTNRH_fake_script)()
