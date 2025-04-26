local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")

local player = Players.LocalPlayer

-- create gui
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "PlayerInfoUI"
screenGui.Parent = game.CoreGui
screenGui.ResetOnSpawn = false

local frame = Instance.new("Frame")
frame.Size = UDim2.new(0, 350, 0, 500)
frame.Position = UDim2.new(0.5, -175, 0.5, -250)
frame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
frame.BorderSizePixel = 0
frame.Parent = screenGui

local uiCorner = Instance.new("UICorner")
uiCorner.CornerRadius = UDim.new(0, 12)
uiCorner.Parent = frame

local uiGradient = Instance.new("UIGradient")
uiGradient.Color = ColorSequence.new({
    ColorSequenceKeypoint.new(0, Color3.fromRGB(60, 60, 60)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(30, 30, 30))
})
uiGradient.Rotation = 45
uiGradient.Parent = frame

local titleBar = Instance.new("Frame")
titleBar.Size = UDim2.new(1, 0, 0, 40)
titleBar.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
titleBar.BorderSizePixel = 0
titleBar.Parent = frame

local titleCorner = Instance.new("UICorner")
titleCorner.CornerRadius = UDim.new(0, 12)
titleCorner.Parent = titleBar

local titleLabel = Instance.new("TextLabel")
titleLabel.Size = UDim2.new(1, -10, 1, 0)
titleLabel.Position = UDim2.new(0, 5, 0, 0)
titleLabel.BackgroundTransparency = 1
titleLabel.Text = "InfoStation"
titleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
titleLabel.TextSize = 20
titleLabel.Font = Enum.Font.GothamBold
titleLabel.TextXAlignment = Enum.TextXAlignment.Center
titleLabel.Parent = titleBar

local closeButton = Instance.new("TextButton")
closeButton.Size = UDim2.new(0, 30, 0, 30)
closeButton.Position = UDim2.new(1, -35, 0, 5)
closeButton.BackgroundColor3 = Color3.fromRGB(200, 50, 50)
closeButton.Text = "X"
closeButton.TextColor3 = Color3.fromRGB(255, 255, 255)
closeButton.TextSize = 16
closeButton.Font = Enum.Font.Gotham
closeButton.Parent = titleBar

local closeCorner = Instance.new("UICorner")
closeCorner.CornerRadius = UDim.new(0, 8)
closeCorner.Parent = closeButton

local scrollingFrame = Instance.new("ScrollingFrame")
scrollingFrame.Size = UDim2.new(1, -20, 1, -60)
scrollingFrame.Position = UDim2.new(0, 10, 0, 50)
scrollingFrame.BackgroundTransparency = 1
scrollingFrame.ScrollBarThickness = 4
scrollingFrame.ScrollBarImageColor3 = Color3.fromRGB(100, 100, 100)
scrollingFrame.Parent = frame

local uiListLayout = Instance.new("UIListLayout")
uiListLayout.Padding = UDim.new(0, 12)
uiListLayout.SortOrder = Enum.SortOrder.LayoutOrder
uiListLayout.Parent = scrollingFrame

-- easy functions
local function createSectionHeader(text)
    local header = Instance.new("TextLabel")
    header.Size = UDim2.new(1, 0, 0, 30)
    header.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
    header.Text = "  " .. text
    header.TextColor3 = Color3.fromRGB(200, 200, 200)
    header.TextSize = 18
    header.Font = Enum.Font.GothamBold
    header.TextXAlignment = Enum.TextXAlignment.Left
    header.Parent = scrollingFrame
    
    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0, 6)
    corner.Parent = header
end

local function createInfoLabel(name, text)
    local label = Instance.new("TextLabel")
    label.Name = name
    label.Size = UDim2.new(1, 0, 0, 25)
    label.BackgroundTransparency = 1
    label.Text = text
    label.TextColor3 = Color3.fromRGB(220, 220, 220)
    label.TextSize = 16
    label.Font = Enum.Font.SourceSans
    label.TextXAlignment = Enum.TextXAlignment.Left
    label.Parent = scrollingFrame
    return label
end

local function createImageLabel(name, imageId, size)
    local img = Instance.new("ImageLabel")
    img.Name = name
    img.Size = size
    img.BackgroundTransparency = 1
    img.Image = imageId
    img.Parent = scrollingFrame

    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0, 8)
    corner.Parent = img

    return img
end

-- labels we update live
local healthLabel
local walkSpeedLabel
local positionLabel
local timeLabel
local teamLabel

-- build static gui once
local function setupPlayerInfo()
    createSectionHeader("Profile")

    local thumbType = Enum.ThumbnailType.HeadShot
    local thumbSize = Enum.ThumbnailSize.Size420x420
    local content = Players:GetUserThumbnailAsync(player.UserId, thumbType, thumbSize)
    createImageLabel("ProfilePicture", content, UDim2.new(0, 120, 0, 120))

    local avatarContent = "rbxthumb://type=Avatar&id=" .. player.UserId .. "&w=420&h=420"
    createImageLabel("Avatar", avatarContent, UDim2.new(0, 120, 0, 120))

    createSectionHeader("Basic Info")
    createInfoLabel("Username", "Username: " .. player.Name)
    createInfoLabel("DisplayName", "Display Name: " .. player.DisplayName)
    createInfoLabel("UserId", "User ID: " .. player.UserId)

    createSectionHeader("Account Details")
    local accountAge = player.AccountAge
    createInfoLabel("AccountAge", "Account Age: " .. accountAge .. " days")
    local joinDate = os.date("!%Y-%m-%d", os.time() - (accountAge * 86400))
    createInfoLabel("JoinDate", "Join Date: " .. joinDate)
    createInfoLabel("Membership", "Membership: " .. player.MembershipType.Name)

    createSectionHeader("Game Info")
    timeLabel = createInfoLabel("CurrentTime", "Current Time: " .. os.date("%H:%M:%S"))
    if player.Team then
        teamLabel = createInfoLabel("Team", "Team: " .. player.Team.Name)
    else
        teamLabel = createInfoLabel("Team", "Team: None")
    end
    createInfoLabel("Locale", "Locale: " .. player.LocaleId)

    if player.Character then
        createSectionHeader("Character Info")
        local humanoid = player.Character:FindFirstChildOfClass("Humanoid")
        if humanoid then
            healthLabel = createInfoLabel("Health", "Health: " .. math.floor(humanoid.Health) .. "/" .. humanoid.MaxHealth)
            walkSpeedLabel = createInfoLabel("WalkSpeed", "Walk Speed: " .. humanoid.WalkSpeed)
        end
        local root = player.Character:FindFirstChild("HumanoidRootPart")
        if root then
            local pos = root.Position
            positionLabel = createInfoLabel("Position", string.format("Position: %.1f, %.1f, %.1f", pos.X, pos.Y, pos.Z))
        end
        if game.PlaceId == 189707 then
    createSectionHeader("NDS Info")

    if player.Character then
        local survivalTag = player.Character:FindFirstChild("SurvivalTag")
        if survivalTag and survivalTag:IsA("StringValue") then
            createInfoLabel("SurvivalTag", "Disaster: " .. survivalTag.Value)
        else
            createInfoLabel("SurvivalTag", "Disaster: None")
        end
    end
end


    end

    scrollingFrame.CanvasSize = UDim2.new(0, 0, 0, uiListLayout.AbsoluteContentSize.Y + 30)
end

setupPlayerInfo()

-- way better dragging
local dragging = false
local dragStart
local startPos

titleBar.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        dragging = true
        dragStart = input.Position
        startPos = frame.Position
    end
end)

titleBar.InputEnded:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        dragging = false
    end
end)

UserInputService.InputChanged:Connect(function(input)
    if dragging and input.UserInputType == Enum.UserInputType.MouseMovement then
        local delta = input.Position - dragStart
        frame.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
    end
end)

-- close btn
closeButton.MouseButton1Click:Connect(function()
    screenGui:Destroy()
end)

-- live update dynamic labels
RunService.Heartbeat:Connect(function()
    if timeLabel then
        timeLabel.Text = "Current Time: " .. os.date("%H:%M:%S")
    end
    if player.Character then
        local humanoid = player.Character:FindFirstChildOfClass("Humanoid")
        if humanoid and healthLabel then
            healthLabel.Text = "Health: " .. math.floor(humanoid.Health) .. "/" .. humanoid.MaxHealth
            walkSpeedLabel.Text = "Walk Speed: " .. humanoid.WalkSpeed
        end
        local root = player.Character:FindFirstChild("HumanoidRootPart")
        if root and positionLabel then
            local pos = root.Position
            positionLabel.Text = string.format("Position: %.1f, %.1f, %.1f", pos.X, pos.Y, pos.Z)
        end
    end
    if teamLabel then
        if player.Team then
            teamLabel.Text = "Team: " .. player.Team.Name
        else
            teamLabel.Text = "Team: None"
        end
    end
end)

-- toggle gui with E
UserInputService.InputBegan:Connect(function(input, gameProcessed)
    if not gameProcessed and input.KeyCode == Enum.KeyCode.E then
        screenGui.Enabled = not screenGui.Enabled
    end
end)
