------------------------------
-- SERVICES & LOCAL REFERENCES
------------------------------
local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")
local localPlayer = Players.LocalPlayer

------------------------------
-- UI CREATION
------------------------------
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "TeleportGui"
screenGui.Parent = game.CoreGui

local container = Instance.new("Frame")
container.Name = "Container"
container.Size = UDim2.new(0, 250, 0, 160)
container.Position = UDim2.new(0.5, -125, 0.5, -80)
container.BackgroundTransparency = 0.2
container.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
container.BorderSizePixel = 0
container.Parent = screenGui

local containerCorner = Instance.new("UICorner")
containerCorner.CornerRadius = UDim.new(0, 10)
containerCorner.Parent = container

-- Title Bar
local titleBar = Instance.new("Frame")
titleBar.Name = "TitleBar"
titleBar.Size = UDim2.new(1, 0, 0, 25)
titleBar.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
titleBar.BorderSizePixel = 0
titleBar.Parent = container



local titleLabel = Instance.new("TextLabel")
titleLabel.Size = UDim2.new(1, -30, 1, 0)
titleLabel.Position = UDim2.new(0, 10, 0, 0)
titleLabel.BackgroundTransparency = 1
titleLabel.Text = "Rizz Master"
titleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
titleLabel.Font = Enum.Font.GothamBold
titleLabel.TextSize = 14
titleLabel.TextXAlignment = Enum.TextXAlignment.Left
titleLabel.Parent = titleBar

-- Close Button
local closeButton = Instance.new("TextButton")
closeButton.Size = UDim2.new(0, 20, 1, 0)
closeButton.Position = UDim2.new(1, -25, 0, 0)
closeButton.BackgroundColor3 = Color3.fromRGB(200, 50, 50)
closeButton.Text = "X"
closeButton.TextColor3 = Color3.fromRGB(255, 255, 255)
closeButton.Font = Enum.Font.GothamBold
closeButton.TextSize = 14
closeButton.Parent = titleBar
closeButton.BorderSizePixel = 0
-- Main Frame
local frame = Instance.new("Frame")
frame.Name = "TeleportFrame"
frame.Size = UDim2.new(1, 0, 0, 135)
frame.Position = UDim2.new(0, 0, 0, 25)
frame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
frame.BorderSizePixel = 0
frame.Parent = container



local frameGradient = Instance.new("UIGradient")
frameGradient.Color = ColorSequence.new{
    ColorSequenceKeypoint.new(0, Color3.fromRGB(40, 40, 40)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(20, 20, 20))
}
frameGradient.Parent = frame

-- TextBox
local textBox = Instance.new("TextBox")
textBox.Size = UDim2.new(1, -20, 0, 35)
textBox.Position = UDim2.new(0, 10, 0, 10)
textBox.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
textBox.TextColor3 = Color3.fromRGB(255, 255, 255)
textBox.PlaceholderText = "Enter username"
textBox.Font = Enum.Font.Gotham
textBox.TextSize = 16
textBox.Text = ""
textBox.ClearTextOnFocus = false
textBox.Parent = frame

local textBoxCorner = Instance.new("UICorner")
textBoxCorner.CornerRadius = UDim.new(0, 6)
textBoxCorner.Parent = textBox

-- Toggle Button
local toggleButton = Instance.new("TextButton")
toggleButton.Size = UDim2.new(1, -20, 0, 35)
toggleButton.Position = UDim2.new(0, 10, 0, 55)
toggleButton.BackgroundColor3 = Color3.fromRGB(80, 80, 80)
toggleButton.TextColor3 = Color3.fromRGB(255, 255, 255)
toggleButton.Text = "Toggle Rizz: OFF"
toggleButton.Font = Enum.Font.GothamBold
toggleButton.TextSize = 16
toggleButton.Parent = frame

local toggleButtonCorner = Instance.new("UICorner")
toggleButtonCorner.CornerRadius = UDim.new(0, 6)
toggleButtonCorner.Parent = toggleButton

------------------------------
-- TELEPORTATION & ANIMATION FUNCTIONALITY
------------------------------
local teleportLoopRunning = false
local dragging = false
local dragStart, startPos
local isToggled = false
local animationPlaying = false
local track, track2

-- Load animations when the character is added
game.Players.LocalPlayer.CharacterAdded:Connect(function()
    local anim = Instance.new("Animation")
    local anim2 = Instance.new("Animation")
    anim.AnimationId = "rbxassetid://259438880"
    anim2.AnimationId = "rbxassetid://148840371"
    track = localPlayer.Character.Humanoid:LoadAnimation(anim)
    track2 = localPlayer.Character.Humanoid:LoadAnimation(anim2)
    track:AdjustSpeed(100)
    track2:AdjustSpeed(3)
end)

-- Load animations if the character already exists
if localPlayer.Character then
    local anim = Instance.new("Animation")
    local anim2 = Instance.new("Animation")
    anim.AnimationId = "rbxassetid://259438880"
    anim2.AnimationId = "rbxassetid://148840371"
    track = localPlayer.Character.Humanoid:LoadAnimation(anim)
    track2 = localPlayer.Character.Humanoid:LoadAnimation(anim2)
    track:AdjustSpeed(100)
    track2:AdjustSpeed(3)
end

local function teleportBehindPlayer(targetPlayer)
    if not targetPlayer or not targetPlayer.Character or not targetPlayer.Character:FindFirstChild("HumanoidRootPart") then
        return
    end

    local targetRootPart = targetPlayer.Character.HumanoidRootPart
    local targetCFrame = targetRootPart.CFrame

    -- Calculate the position 1.3 studs behind the target player
    local offset = targetCFrame.LookVector * -1.3 -- 1.3 studs behind the player
    local newPosition = targetCFrame.Position + offset

    -- Teleport the local player
    localPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(newPosition, targetCFrame.Position)
end

local function startTeleportLoop(targetName)
    teleportLoopRunning = true
    while teleportLoopRunning do
        local targetPlayer = Players:FindFirstChild(targetName)
        if targetPlayer then
            teleportBehindPlayer(targetPlayer)
        end
        wait(0.001) -- Adjust the delay as needed
    end
end

local function stopTeleportLoop()
    teleportLoopRunning = false
end

toggleButton.MouseButton1Click:Connect(function()
    isToggled = not isToggled
    toggleButton.Text = "Toggle Rizz: " .. (isToggled and "ON" or "OFF")

    if isToggled then
        spawn(function()
            startTeleportLoop(textBox.Text)
            if not animationPlaying then
                track:Play()
                track2:Play()
                animationPlaying = true
            end
        end)
    else
        stopTeleportLoop()
        animationPlaying = false
        
    end
end)

titleBar.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        dragging = true
        dragStart = input.Position
        startPos = container.Position
        input.Changed:Connect(function()
            if input.UserInputState == Enum.UserInputState.End then
                dragging = false
            end
        end)
    end
end)

UserInputService.InputChanged:Connect(function(input)
    if dragging and input.UserInputType == Enum.UserInputType.MouseMovement then
        local delta = input.Position - dragStart
        container.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
    end
end)

closeButton.MouseButton1Click:Connect(function()
    screenGui:Destroy()
end)
