local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local SoundService = game:GetService("SoundService")
local StarterGui = game:GetService("StarterGui")
local HttpService = game:GetService("HttpService")

local LocalPlayer = Players.LocalPlayer

-- Sound Effects
local function playSound(soundId)
    local sound = Instance.new("Sound")
    sound.SoundId = "rbxassetid://" .. soundId
    sound.Parent = SoundService
    sound:Play()
    sound.Ended:Connect(function()
        sound:Destroy()
    end)
end

-- Play initial sound
playSound("2865227271")

-- GUI Creation
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "SuperRingPartsGUI"
ScreenGui.ResetOnSpawn = false
ScreenGui.Parent = LocalPlayer:WaitForChild("PlayerGui")

local MainFrame = Instance.new("Frame")
MainFrame.Size = UDim2.new(0, 350, 0, 550)
MainFrame.Position = UDim2.new(0.5, -175, 0.5, -275)
MainFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
MainFrame.BorderSizePixel = 0
MainFrame.Parent = ScreenGui

-- Make the GUI round
local UICorner = Instance.new("UICorner")
UICorner.CornerRadius = UDim.new(0, 15)
UICorner.Parent = MainFrame

local Title = Instance.new("TextLabel")
Title.Size = UDim2.new(1, 0, 0, 50)
Title.Position = UDim2.new(0, 0, 0, 0)
Title.Text = "Super Ring Parts V7"
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.BackgroundColor3 = Color3.fromRGB(0, 120, 215)
Title.Font = Enum.Font.GothamBold
Title.TextSize = 24
Title.Parent = MainFrame

-- Round the title
local TitleCorner = Instance.new("UICorner")
TitleCorner.CornerRadius = UDim.new(0, 15)
TitleCorner.Parent = Title

local ToggleButton = Instance.new("TextButton")
ToggleButton.Size = UDim2.new(0.9, 0, 0, 50)
ToggleButton.Position = UDim2.new(0.05, 0, 0.1, 0)
ToggleButton.Text = "Ring Off"
ToggleButton.BackgroundColor3 = Color3.fromRGB(200, 50, 50)
ToggleButton.TextColor3 = Color3.fromRGB(255, 255, 255)
ToggleButton.Font = Enum.Font.Gotham
ToggleButton.TextSize = 20
ToggleButton.Parent = MainFrame

-- Round the toggle button
local ToggleCorner = Instance.new("UICorner")
ToggleCorner.CornerRadius = UDim.new(0, 8)
ToggleCorner.Parent = ToggleButton

-- Configuration table
local config = {
    radius = 50,
    height = 100,
    rotationSpeed = 10,
    attractionStrength = 1000,
}

-- Save and load functions
local function saveConfig()
    local configStr = HttpService:JSONEncode(config)
    writefile("SuperRingPartsConfig.txt", configStr)
end

local function loadConfig()
    if isfile("SuperRingPartsConfig.txt") then
        local configStr = readfile("SuperRingPartsConfig.txt")
        config = HttpService:JSONDecode(configStr)
    end
end

loadConfig()

-- Function to create control buttons and textboxes
local function createControl(name, positionY, color, labelText, defaultValue, callback)
    local ControlFrame = Instance.new("Frame")
    ControlFrame.Size = UDim2.new(0.9, 0, 0, 80)
    ControlFrame.Position = UDim2.new(0.05, 0, positionY, 0)
    ControlFrame.BackgroundTransparency = 1
    ControlFrame.Parent = MainFrame

    local Label = Instance.new("TextLabel")
    Label.Size = UDim2.new(1, 0, 0, 25)
    Label.Text = labelText
    Label.BackgroundTransparency = 1
    Label.TextColor3 = Color3.fromRGB(200, 200, 200)
    Label.Font = Enum.Font.Gotham
    Label.TextSize = 16
    Label.TextXAlignment = Enum.TextXAlignment.Left
    Label.Parent = ControlFrame

    local DecreaseButton = Instance.new("TextButton")
    DecreaseButton.Size = UDim2.new(0.15, 0, 0, 40)
    DecreaseButton.Position = UDim2.new(0, 0, 0.4, 0)
    DecreaseButton.Text = "-"
    DecreaseButton.BackgroundColor3 = color
    DecreaseButton.TextColor3 = Color3.fromRGB(255, 255, 255)
    DecreaseButton.Font = Enum.Font.Gotham
    DecreaseButton.TextSize = 20
    DecreaseButton.Parent = ControlFrame

    local DecreaseCorner = Instance.new("UICorner")
    DecreaseCorner.CornerRadius = UDim.new(0, 8)
    DecreaseCorner.Parent = DecreaseButton

    local TextBox = Instance.new("TextBox")
    TextBox.Size = UDim2.new(0.65, 0, 0, 40)
    TextBox.Position = UDim2.new(0.175, 0, 0.4, 0)
    TextBox.Text = tostring(defaultValue)
    TextBox.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
    TextBox.TextColor3 = Color3.fromRGB(255, 255, 255)
    TextBox.Font = Enum.Font.Gotham
    TextBox.TextSize = 18
    TextBox.Parent = ControlFrame

    local TextBoxCorner = Instance.new("UICorner")
    TextBoxCorner.CornerRadius = UDim.new(0, 8)
    TextBoxCorner.Parent = TextBox

    local IncreaseButton = Instance.new("TextButton")
    IncreaseButton.Size = UDim2.new(0.15, 0, 0, 40)
    IncreaseButton.Position = UDim2.new(0.85, 0, 0.4, 0)
    IncreaseButton.Text = "+"
    IncreaseButton.BackgroundColor3 = color
    IncreaseButton.TextColor3 = Color3.fromRGB(255, 255, 255)
    IncreaseButton.Font = Enum.Font.Gotham
    IncreaseButton.TextSize = 20
    IncreaseButton.Parent = ControlFrame

    local IncreaseCorner = Instance.new("UICorner")
    IncreaseCorner.CornerRadius = UDim.new(0, 8)
    IncreaseCorner.Parent = IncreaseButton

    DecreaseButton.MouseButton1Click:Connect(function()
        local value = tonumber(TextBox.Text) or defaultValue
        value = math.max(0, value - 10)
        TextBox.Text = tostring(value)
        callback(value)
        playSound("12221967")
        saveConfig()
    end)

    IncreaseButton.MouseButton1Click:Connect(function()
        local value = tonumber(TextBox.Text) or defaultValue
        value = math.min(10000, value + 10)
        TextBox.Text = tostring(value)
        callback(value)
        playSound("12221967")
        saveConfig()
    end)

    TextBox.FocusLost:Connect(function(enterPressed)
        if enterPressed then
            local newValue = tonumber(TextBox.Text)
            if newValue then
                newValue = math.clamp(newValue, 0, 10000)
                TextBox.Text = tostring(newValue)
                callback(newValue)
                playSound("12221967")
                saveConfig()
            else
                TextBox.Text = tostring(defaultValue)
            end
        end
    end)
end

createControl("Radius", 0.2, Color3.fromRGB(0, 120, 215), "Radius", config.radius, function(value)
    config.radius = value
    saveConfig()
end)

createControl("Height", 0.35, Color3.fromRGB(0, 120, 215), "Height", config.height, function(value)
    config.height = value
    saveConfig()
end)

createControl("RotationSpeed", 0.5, Color3.fromRGB(0, 120, 215), "Rotation Speed", config.rotationSpeed, function(value)
    config.rotationSpeed = value
    saveConfig()
end)

createControl("AttractionStrength", 0.65, Color3.fromRGB(0, 120, 215), "Attraction Strength", config.attractionStrength, function(value)
    config.attractionStrength = value
    saveConfig()
end)

-- Add minimize button
local MinimizeButton = Instance.new("TextButton")
MinimizeButton.Size = UDim2.new(0, 40, 0, 40)
MinimizeButton.Position = UDim2.new(1, -50, 0, 5)
MinimizeButton.Text = "─"
MinimizeButton.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
MinimizeButton.TextColor3 = Color3.fromRGB(255, 255, 255)
MinimizeButton.Font = Enum.Font.Gotham
MinimizeButton.TextSize = 20
MinimizeButton.Parent = MainFrame

-- Round the minimize button
local MinimizeCorner = Instance.new("UICorner")
MinimizeCorner.CornerRadius = UDim.new(0, 20)
MinimizeCorner.Parent = MinimizeButton

-- Minimize functionality
local minimized = false
MinimizeButton.MouseButton1Click:Connect(function()
    minimized = not minimized
    if minimized then
        MainFrame:TweenSize(UDim2.new(0, 350, 0, 50), "Out", "Quad", 0.3, true)
        MinimizeButton.Text = "+"
        for _, child in pairs(MainFrame:GetChildren()) do
            if child:IsA("GuiObject") and child ~= Title and child ~= MinimizeButton then
                child.Visible = false
            end
        end
    else
        MainFrame:TweenSize(UDim2.new(0, 350, 0, 550), "Out", "Quad", 0.3, true)
        MinimizeButton.Text = "─"
        for _, child in pairs(MainFrame:GetChildren()) do
            if child:IsA("GuiObject") then
                child.Visible = true
            end
        end
    end
    playSound("12221967")
end)
-- Add Disaster Label
local DisasterLabel = Instance.new("TextLabel")
DisasterLabel.Size = UDim2.new(0.9, 0, 0, 30)
DisasterLabel.Position = UDim2.new(0.05, 0, 0.93, 0)
DisasterLabel.Text = "Disaster: None"
DisasterLabel.BackgroundTransparency = 1
DisasterLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
DisasterLabel.Font = Enum.Font.Gotham
DisasterLabel.TextSize = 18
DisasterLabel.TextXAlignment = Enum.TextXAlignment.Center
DisasterLabel.Parent = MainFrame

-- Function to update Disaster Label
local function updateDisasterLabel()
    local character = LocalPlayer.Character
    if character then
        local survivalTag = character:FindFirstChild("SurvivalTag")
        if survivalTag then
            DisasterLabel.Text = "Disaster: " .. survivalTag.Value
        else
            DisasterLabel.Text = "Disaster: None"
        end
    else
        DisasterLabel.Text = "Disaster: None"
    end
end

-- Constantly update label
RunService.Heartbeat:Connect(updateDisasterLabel)

-- Update label when character changes
LocalPlayer.CharacterAdded:Connect(function(character)
    updateDisasterLabel()
end)

-- Initial update
updateDisasterLabel()
-- Make GUI draggable
local dragging
local dragInput
local dragStart
local startPos

local function update(input)
    local delta = input.Position - dragStart
    MainFrame.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
end

MainFrame.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
        dragging = true
        dragStart = input.Position
        startPos = MainFrame.Position
        
        input.Changed:Connect(function()
            if input.UserInputState == Enum.UserInputState.End then
                dragging = false
            end
        end)
    end
end)

MainFrame.InputChanged:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
        dragInput = input
    end
end)

UserInputService.InputChanged:Connect(function(input)
    if input == dragInput and dragging then
        update(input)
    end
end)

-- Utility Buttons
local UtilityFrame = Instance.new("Frame")
UtilityFrame.Size = UDim2.new(0.9, 0, 0, 60)
UtilityFrame.Position = UDim2.new(0.05, 0, 0.82, 0)
UtilityFrame.BackgroundTransparency = 1
UtilityFrame.Parent = MainFrame

local utilityButtons = {
    {Name = "Fly", Color = Color3.fromRGB(0, 200, 100), Script = "https://pastebin.com/raw/YSL3xKYU"},
    {Name = "NoFall", Color = Color3.fromRGB(200, 50, 50), Script = [[
        local runsvc = game:GetService("RunService")
        local heartbeat = runsvc.Heartbeat
        local rstepped = runsvc.RenderStepped
        local lp = game.Players.LocalPlayer
        local novel = Vector3.zero
        local function nofalldamage(chr)
            local root = chr:WaitForChild("HumanoidRootPart")
            if root then
                local con
                con = heartbeat:Connect(function()
                    if not root.Parent then
                        con:Disconnect()
                    end
                    local oldvel = root.AssemblyLinearVelocity
                    root.AssemblyLinearVelocity = novel
                    rstepped:Wait()
                    root.AssemblyLinearVelocity = oldvel
                end)
            end
        end
        nofalldamage(lp.Character)
        lp.CharacterAdded:Connect(nofalldamage)
    ]]},
    {Name = "Noclip", Color = Color3.fromRGB(100, 100, 100), Script = [[
        local Noclip = nil
        local Clip = nil
        function noclip()
            Clip = false
            local function Nocl()
                if Clip == false and game.Players.LocalPlayer.Character ~= nil then
                    for _,v in pairs(game.Players.LocalPlayer.Character:GetDescendants()) do
                        if v:IsA('BasePart') and v.CanCollide and v.Name ~= floatName then
                            v.CanCollide = false
                        end
                    end
                end
                wait(0.21)
            end
            Noclip = game:GetService('RunService').Stepped:Connect(Nocl)
        end
        function clip()
            if Noclip then Noclip:Disconnect() end
            Clip = true
        end
        noclip()
    ]]},
    {Name = "InfJump", Color = Color3.fromRGB(50, 200, 200), Script = [[
        local InfiniteJumpEnabled = true
        game:GetService("UserInputService").JumpRequest:connect(function()
            if InfiniteJumpEnabled then
                game:GetService"Players".LocalPlayer.Character:FindFirstChildOfClass'Humanoid':ChangeState("Jumping")
            end
        end)
    ]]},
    {Name = "InfYield", Color = Color3.fromRGB(200, 100, 200), Script = "https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source"},
    {Name = "Nameless", Color = Color3.fromRGB(150, 150, 150), Script = "https://scriptblox.com/raw/Universal-Script-Nameless-Admin-FE-11243"},
    {Name = "FPS", Color = Color3.fromRGB(255, 200, 50), Script = "https://pastebin.com/raw/ySHJdZpb"}
}

for i, btnData in ipairs(utilityButtons) do
    local Button = Instance.new("TextButton")
    Button.Size = UDim2.new(0.13, 0, 0, 40)
    Button.Position = UDim2.new((i-1)*0.15, 0, 0.2, 0)
    Button.Text = btnData.Name
    Button.BackgroundColor3 = btnData.Color
    Button.TextColor3 = Color3.fromRGB(255, 255, 255)
    Button.Font = Enum.Font.Gotham
    Button.TextSize = 14
    Button.Parent = UtilityFrame
    Button.TextScaled=true
    local ButtonCorner = Instance.new("UICorner")
    ButtonCorner.CornerRadius = UDim.new(0, 8)
    ButtonCorner.Parent = Button

    Button.MouseButton1Click:Connect(function()
        if btnData.Script:find("http") then
            loadstring(game:HttpGet(btnData.Script))()
        else
            loadstring(btnData.Script)()
        end
        playSound("12221967")
    end)
end

-- Ring Parts Claim
local Workspace = game:GetService("Workspace")

local character = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
local humanoidRootPart = character:WaitForChild("HumanoidRootPart")

local Folder = Instance.new("Folder", Workspace)
local Part = Instance.new("Part", Folder)
local Attachment1 = Instance.new("Attachment", Part)
Part.Anchored = true
Part.CanCollide = false
Part.Transparency = 1

if not getgenv().Network then
    getgenv().Network = {
        BaseParts = {},
        Velocity = Vector3.new(14.46262424, 14.46262424, 14.46262424)
    }

    Network.RetainPart = function(Part)
        if typeof(Part) == "Instance" and Part:IsA("BasePart") and Part:IsDescendantOf(Workspace) then
            table.insert(Network.BaseParts, Part)
            Part.CustomPhysicalProperties = PhysicalProperties.new(0, 0, 0, 0, 0)
            Part.CanCollide = false
        end
    end

    local function EnablePartControl()
        LocalPlayer.ReplicationFocus = Workspace
        RunService.Heartbeat:Connect(function()
            sethiddenproperty(LocalPlayer, "SimulationRadius", math.huge)
            for _, Part in pairs(Network.BaseParts) do
                if Part:IsDescendantOf(Workspace) then
                    Part.Velocity = Network.Velocity
                end
            end
        end)
    end

    EnablePartControl()
end

local function ForcePart(v)
    if v:IsA("Part") and not v.Anchored and not v.Parent:FindFirstChild("Humanoid") and not v.Parent:FindFirstChild("Head") and v.Name ~= "Handle" then
        for _, x in next, v:GetChildren() do
            if x:IsA("BodyAngularVelocity") or x:IsA("BodyForce") or x:IsA("BodyGyro") or x:IsA("BodyPosition") or x:IsA("BodyThrust") or x:IsA("BodyVelocity") or x:IsA("RocketPropulsion") then
                x:Destroy()
            end
        end
        if v:FindFirstChild("Attachment") then
            v:FindFirstChild("Attachment"):Destroy()
        end
        if v:FindFirstChild("AlignPosition") then
            v:FindFirstChild("AlignPosition"):Destroy()
        end
        if v:FindFirstChild("Torque") then
            v:FindFirstChild("Torque"):Destroy()
        end
        v.CanCollide = false
        local Torque = Instance.new("Torque", v)
        Torque.Torque = Vector3.new(100000, 100000, 100000)
        local AlignPosition = Instance.new("AlignPosition", v)
        local Attachment2 = Instance.new("Attachment", v)
        Torque.Attachment0 = Attachment2
        AlignPosition.MaxForce = 9999999999999999999999999999999
        AlignPosition.MaxVelocity = math.huge
        AlignPosition.Responsiveness = 200
        AlignPosition.Attachment0 = Attachment2
        AlignPosition.Attachment1 = Attachment1
    end
end

-- Edits
local ringPartsEnabled = false

local function RetainPart(Part)
    if Part:IsA("BasePart") and not Part.Anchored and Part:IsDescendantOf(workspace) then
        if Part.Parent == LocalPlayer.Character or Part:IsDescendantOf(LocalPlayer.Character) then
            return false
        end

        Part.CustomPhysicalProperties = PhysicalProperties.new(0, 0, 0, 0, 0)
        Part.CanCollide = false
        return true
    end
    return false
end

local parts = {}
local function addPart(part)
    if RetainPart(part) then
        if not table.find(parts, part) then
            table.insert(parts, part)
        end
    end
end

local function removePart(part)
    local index = table.find(parts, part)
    if index then
        table.remove(parts, index)
    end
end

for _, part in pairs(workspace:GetDescendants()) do
    addPart(part)
end

workspace.DescendantAdded:Connect(addPart)
workspace.DescendantRemoving:Connect(removePart)

RunService.Heartbeat:Connect(function()
    if not ringPartsEnabled then return end
    
    local humanoidRootPart = LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
    if humanoidRootPart then
        local tornadoCenter = humanoidRootPart.Position
        for _, part in pairs(parts) do
            if part.Parent and not part.Anchored then
                local pos = part.Position
                local distance = (Vector3.new(pos.X, tornadoCenter.Y, pos.Z) - tornadoCenter).Magnitude
                local angle = math.atan2(pos.Z - tornadoCenter.Z, pos.X - tornadoCenter.X)
                local newAngle = angle + math.rad(config.rotationSpeed)
                local targetPos = Vector3.new(
                    tornadoCenter.X + math.cos(newAngle) * math.min(config.radius, distance),
                    tornadoCenter.Y + (config.height * (math.abs(math.sin((pos.Y - tornadoCenter.Y) / config.height)))),
                    tornadoCenter.Z + math.sin(newAngle) * math.min(config.radius, distance)
                )
                local directionToTarget = (targetPos - part.Position).unit
                part.Velocity = directionToTarget * config.attractionStrength
            end
        end
    end
end)

-- Button functionality
ToggleButton.MouseButton1Click:Connect(function()
    ringPartsEnabled = not ringPartsEnabled
    ToggleButton.Text = ringPartsEnabled and "Ring On" or "Ring Off"
    ToggleButton.BackgroundColor3 = ringPartsEnabled and Color3.fromRGB(50, 205, 50) or Color3.fromRGB(200, 50, 50)
    playSound("12221967")
end)

-- Get player thumbnail
local userId = Players:GetUserIdFromNameAsync("ServerSideK1ng")
local thumbType = Enum.ThumbnailType.HeadShot
local thumbSize = Enum.ThumbnailSize.Size420x420
local content, isReady = Players:GetUserThumbnailAsync(userId, thumbType, thumbSize)

StarterGui:SetCore("SendNotification", {
    Title = "Hey",
    Text = "Original by Lukas. V7 by ServerSideK1ng. Enjoy!",
    Icon = content,
    Duration = 5
})
-- Enjoy skidding this
