local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")
local player = Players.LocalPlayer

local lagDuration = 0.3
local lagInterval = 0.05
local fakeLagEnabled = false

local screenGui = Instance.new("ScreenGui")
screenGui.Parent = game:GetService("CoreGui")

local frame = Instance.new("Frame")
frame.Size = UDim2.new(0, 220, 0, 180)
frame.Position = UDim2.new(0.5, -110, 0.5, -90)
frame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
frame.BackgroundTransparency = 0.2
frame.BorderSizePixel = 0
frame.Active = true
frame.Draggable = true
frame.Parent = screenGui

local uiCorner = Instance.new("UICorner")
uiCorner.CornerRadius = UDim.new(0, 10)
uiCorner.Parent = frame

local title = Instance.new("TextLabel")
title.Size = UDim2.new(1, 0, 0, 30)
title.BackgroundTransparency = 1
title.Text = "Fake Lag"
title.TextColor3 = Color3.fromRGB(255, 255, 255)
title.TextScaled = true
title.Font = Enum.Font.GothamBold
title.Parent = frame

local toggleButton = Instance.new("TextButton")
toggleButton.Size = UDim2.new(0, 200, 0, 35)
toggleButton.Position = UDim2.new(0, 10, 0, 40)
toggleButton.BackgroundColor3 = Color3.fromRGB(50, 150, 250)
toggleButton.TextColor3 = Color3.fromRGB(255, 255, 255)
toggleButton.Text = "Fake Lag: OFF"
toggleButton.TextScaled = true
toggleButton.Font = Enum.Font.Gotham
uiCorner:Clone().Parent = toggleButton
toggleButton.Parent = frame

local function createTextBox(labelText, positionY, defaultValue)
    local container = Instance.new("Frame")
    container.Size = UDim2.new(0, 200, 0, 35)
    container.Position = UDim2.new(0, 10, 0, positionY)
    container.BackgroundTransparency = 1
    container.Parent = frame
    
    local label = Instance.new("TextLabel")
    label.Size = UDim2.new(0.5, -5, 1, 0)
    label.Position = UDim2.new(0, 0, 0, 0)
    label.BackgroundTransparency = 1
    label.Text = labelText
    label.TextColor3 = Color3.fromRGB(200, 200, 200)
    label.Font = Enum.Font.Gotham
    label.TextScaled = true
    label.Parent = container
    
    local textBox = Instance.new("TextBox")
    textBox.Size = UDim2.new(0.5, -5, 1, 0)
    textBox.Position = UDim2.new(0.5, 5, 0, 0)
    textBox.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
    textBox.TextColor3 = Color3.fromRGB(255, 255, 255)
    textBox.Text = tostring(defaultValue)
    textBox.TextScaled = true
    textBox.Font = Enum.Font.Gotham
    uiCorner:Clone().Parent = textBox
    textBox.Parent = container
    
    return textBox
end

toggleButton.MouseButton1Click:Connect(function()
    fakeLagEnabled = not fakeLagEnabled
    toggleButton.Text = fakeLagEnabled and "Fake Lag: ON" or "Fake Lag: OFF"
end)

durationBox = createTextBox("Lag Duration:", 85, lagDuration)
durationBox.FocusLost:Connect(function()
    local num = tonumber(durationBox.Text)
    if num then
        lagDuration = math.max(0, num)
    else
        durationBox.Text = tostring(lagDuration)
    end
end)

intervalBox = createTextBox("Lag Interval:", 125, lagInterval)
intervalBox.FocusLost:Connect(function()
    local num = tonumber(intervalBox.Text)
    if num then
        lagInterval = math.max(0, num)
    else
        intervalBox.Text = tostring(lagInterval)
    end
end)

UserInputService.InputBegan:Connect(function(input, gameProcessed)
    if not gameProcessed and input.KeyCode == Enum.KeyCode.Z then
        fakeLagEnabled = not fakeLagEnabled
        toggleButton.Text = fakeLagEnabled and "Fake Lag: ON" or "Fake Lag: OFF"
    end
end)

local function setupCharacter()
    local character = player.Character or player.CharacterAdded:Wait()
    local humanoidRootPart = character:WaitForChild("HumanoidRootPart")
    while true do
        wait(lagInterval)
        if fakeLagEnabled then
            humanoidRootPart.Anchored = true
            wait(lagDuration)
            humanoidRootPart.Anchored = false
        end
    end
end

player.CharacterAdded:Connect(setupCharacter)
setupCharacter()
