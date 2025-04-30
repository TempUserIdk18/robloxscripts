local OreoLib = loadstring(game:HttpGet("https://raw.githubusercontent.com/TempUserIdk18/OreoLib/refs/heads/main/OreoLibSource.lua"))()

local Window = OreoLib:MakeWindow({
    Name = "starlight | MM2",
    HidePremium = false,
    SaveConfig = false,
    ConfigFolder = "v3rmumm2",
    IntroEnabled = false,
    Icon = "rbxassetid://4483345998"
})
local Tab = Window:MakeTab({
    Name = "M@in",
    Icon = "rbxassetid://4483345998",
    PremiumOnly = false
})
Window:SetTheme("CoolKid")
Window:SetWatermark(false)              
local Tab2 = Window:MakeTab({
    Name = "Inf0",
    Icon = "rbxassetid://4483345998",
    PremiumOnly = false
})
Tab2:AddLabel("by v3rmu")
Tab2:AddLabel("w0rks w/ mm2 c0pies")

local MurdererLabel = Tab:AddLabel("murderer: None")
local GunHolderLabel = Tab:AddLabel("sheriff: None")

local function getPlayersWithItem(itemName)
    local playersWithItem = {}
    
    for _, player in pairs(game:GetService("Players"):GetPlayers()) do
        if player:WaitForChild("Backpack") then
            for _, item in pairs(player:WaitForChild("Backpack"):GetChildren()) do
                if item.Name == itemName then
                    table.insert(playersWithItem, player.Name)
                end
            end
        end
        if player.Character then
            for _, item in pairs(player.Character:GetChildren()) do
                if item:IsA("Tool") and item.Name == itemName then
                    table.insert(playersWithItem, player.Name)
                end
            end
        end
    end
    
    return playersWithItem
end

local function updateLabels()
    local murderers = getPlayersWithItem("Knife")
    local gunHolders = getPlayersWithItem("Gun")
    
    MurdererLabel:Set("murderer: " .. (#murderers > 0 and table.concat(murderers, ", ") or "None"))
    GunHolderLabel:Set("sheriff: " .. (#gunHolders > 0 and table.concat(gunHolders, ", ") or "None"))
end


local FloatingUIEnabled = false
local FloatingUIFrame

local function createFloatingUI()
    if FloatingUIFrame then
        FloatingUIFrame:Destroy()
    end

    FloatingUIFrame = Instance.new("ScreenGui")
    local Frame = Instance.new("Frame")
    local UICorner = Instance.new("UICorner")
    local UIGradient = Instance.new("UIGradient")
    local TitleBar = Instance.new("TextLabel")
    local MurdererText = Instance.new("TextLabel")
    local SheriffText = Instance.new("TextLabel")
    local MurdererIcon = Instance.new("ImageLabel")
    local SheriffIcon = Instance.new("ImageLabel")
    local UIStroke = Instance.new("UIStroke")

    -- ScreenGui
    FloatingUIFrame.Parent = game:GetService("CoreGui")
    FloatingUIFrame.Name = "FloatingUI"
    FloatingUIFrame.ResetOnSpawn = false

    -- Frame
    Frame.Parent = FloatingUIFrame
    Frame.BackgroundColor3 = Color3.fromRGB(45,45,45)
    Frame.Size = UDim2.new(0, 300, 0, 150)
    Frame.Position = UDim2.new(0.5, -150, 0.1, 0)
    Frame.BorderSizePixel = 0

    -- UIStroke
    UIStroke.Parent = Frame
    UIStroke.Color = Color3.fromRGB(255,0,0)
    UIStroke.Thickness = 2
    UIStroke.Transparency = 0

    -- TitleBar
    TitleBar.Parent = Frame
    TitleBar.Size = UDim2.new(1, 0, 0, 30)
    TitleBar.BackgroundColor3 = Color3.fromRGB(30,30,30)
    TitleBar.Text = "starlight"
    TitleBar.TextColor3 = Color3.new(255,255,255)
    TitleBar.Font = Enum.Font.GothamBold
    TitleBar.TextSize = 18
    TitleBar.BorderSizePixel = 0
    TitleBar.BackgroundTransparency = 0.5

    -- MurdererText
    MurdererText.Parent = Frame
    MurdererText.Size = UDim2.new(1, -30, 0, 40) -- Adjusted to leave space for the icon
    MurdererText.Position = UDim2.new(0, 30, 0.3, 0) -- Adjusted to align with the icon
    MurdererText.TextColor3 = Color3.new(255, 0, 0)
    MurdererText.TextSize = 16
    MurdererText.BackgroundTransparency = 1
    MurdererText.Font = Enum.Font.Gotham
    MurdererText.Text = "murderer: None"
    MurdererText.TextXAlignment = Enum.TextXAlignment.Left

    -- SheriffText
    SheriffText.Parent = Frame
    SheriffText.Size = UDim2.new(1, -30, 0, 40) -- Adjusted to leave space for the icon
    SheriffText.Position = UDim2.new(0, 30, 0.6, 0) -- Adjusted to align with the icon
    SheriffText.TextColor3 = Color3.new(0, 0, 255)
    SheriffText.TextSize = 16
    SheriffText.BackgroundTransparency = 1
    SheriffText.Font = Enum.Font.Gotham
    SheriffText.Text = "sheriff: None"
    SheriffText.TextXAlignment = Enum.TextXAlignment.Left

    -- MurdererIcon
    MurdererIcon.Parent = Frame
    MurdererIcon.Size = UDim2.new(0, 20, 0, 20)
    MurdererIcon.Position = UDim2.new(0, 5, 0.3, 10) -- Adjusted to be closer to the text
    MurdererIcon.Image = "rbxassetid://7349058170" -- Replace with your icon ID
    MurdererIcon.BackgroundTransparency = 1

    -- SheriffIcon
    SheriffIcon.Parent = Frame
    SheriffIcon.Size = UDim2.new(0, 20, 0, 20)
    SheriffIcon.Position = UDim2.new(0, 5, 0.6, 10) -- Adjusted to be closer to the text
    SheriffIcon.Image = "rbxassetid://14621026390" -- Replace with your icon ID
    SheriffIcon.BackgroundTransparency = 1

    -- Dragging Logic
    local Dragging, DragStart, StartPosition, DragInput
    TitleBar.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            Dragging = true
            DragStart = input.Position
            StartPosition = Frame.Position
        end
    end)

    TitleBar.InputChanged:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseMovement then
            DragInput = input
        end
    end)

    game:GetService("UserInputService").InputChanged:Connect(function(input)
        if input == DragInput and Dragging then
            local delta = input.Position - DragStart
            Frame.Position = UDim2.new(StartPosition.X.Scale, StartPosition.X.Offset + delta.X, StartPosition.Y.Scale, StartPosition.Y.Offset + delta.Y)
        end
    end)

    TitleBar.InputEnded:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            Dragging = false
        end
    end)

    return MurdererText, SheriffText
end

local function updateFloatingUI(MurdererText, SheriffText)
    local murderers = getPlayersWithItem("Knife")
    local gunHolders = getPlayersWithItem("Gun")
    
    MurdererText.Text = "murderer: " .. (#murderers > 0 and table.concat(murderers, ", ") or "None")
    SheriffText.Text = "sheriff: " .. (#gunHolders > 0 and table.concat(gunHolders, ", ") or "None")
end

Tab:AddToggle({
    Name = "mini UI",
    Default = false,
    Callback = function(value)
        FloatingUIEnabled = value
        if value then
            local MurdererText, SheriffText = createFloatingUI()
            while FloatingUIEnabled do
                updateFloatingUI(MurdererText, SheriffText)
                wait(1)
            end
        else
            if FloatingUIFrame then
                FloatingUIFrame:Destroy()
            end
        end
    end
})

Tab:AddButton({
    Name = "send info in chat",
    Callback = function()
        local murderers = getPlayersWithItem("Knife")
        local gunHolders = getPlayersWithItem("Gun")
        local murdererText = "murderer: " .. (#murderers > 0 and table.concat(murderers, ", ") or "None")
        local sheriffText = "sheriff: " .. (#gunHolders > 0 and table.concat(gunHolders, ", ") or "None")
        game:GetService("TextChatService").TextChannels.RBXGeneral:SendAsync(murdererText)
        wait(0.2)
        game:GetService("TextChatService").TextChannels.RBXGeneral:SendAsync(sheriffText)
    end    
})
Tab:AddButton({
    Name = "destroy UI",
    Callback = function()
        highlightEnabled = false
        FloatingUIEnabled = false
        wait(0.6)
        OreoLib:Destroy()
    end    
})
local player = game.Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local humanoidRootPart = character:WaitForChild("HumanoidRootPart")
local humanoid = character:WaitForChild("Humanoid")

local function getRandomPosition()
	local x = math.random(-500, 500)
	local y = math.random(10, 100)
	local z = math.random(-500, 500)
	return Vector3.new(x, y, z)
end
Tab:AddButton({
    Name = "God Mode (use in round)",
    Callback = function()
        local originalPosition = humanoidRootPart.Position

        -- Teleport far away
        humanoidRootPart.CFrame = CFrame.new(getRandomPosition())
        task.wait(0.1)

        -- Kill the player to trigger respawn
        humanoid:TakeDamage(humanoid.Health)

        -- Handle respawn and move back to the original position
        local respawnConnection
        respawnConnection = player.CharacterAdded:Connect(function(newCharacter)
            respawnConnection:Disconnect()
            local newHumanoidRootPart = newCharacter:WaitForChild("HumanoidRootPart")
            local newHumanoid = newCharacter:WaitForChild("Humanoid")
            
            -- Wait for character to fully load
            repeat task.wait() until newHumanoidRootPart and newHumanoid.Health > 0
            
            task.wait(0.5)
            newHumanoidRootPart.CFrame = CFrame.new(originalPosition)
        end)
    end
})

local highlightEnabled = false
local function updateESP()
    for _, player in pairs(game:GetService("Players"):GetPlayers()) do
        if player.Character then
            local highlight = player.Character:FindFirstChildOfClass("Highlight")
            if not highlight then
                highlight = Instance.new("Highlight")
                highlight.Parent = player.Character
                highlight.FillTransparency = 0.5
                highlight.OutlineTransparency = 0
                highlight.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
            end

            local hasKnife = false
            local hasGun = false

            -- Check backpack and character for items
            local function checkItems(container)
                for _, item in pairs(container:GetChildren()) do
                    if item:IsA("Tool") then
                        if item.Name == "Knife" then
                            hasKnife = true
                        elseif item.Name == "Gun" then
                            hasGun = true
                        end
                    end
                end
            end

            if player:FindFirstChild("Backpack") then
                checkItems(player.Backpack)
            end
            
            if player.Character then
                checkItems(player.Character)
            end

            -- Set highlight color based on item possession
            if hasKnife then
                highlight.FillColor = Color3.fromRGB(255, 0, 0) -- Red for knife
            elseif hasGun then
                highlight.FillColor = Color3.fromRGB(0, 0, 255) -- Blue for gun
            else
                highlight.FillColor = Color3.fromRGB(0, 255, 0) -- Green for nothing
            end
        end
    end
end
Tab:AddToggle({
        Name = "v3rmu ESP",
    Default = false,
    Callback = function(value)
        highlightEnabled = value
        
        if not value then
            -- Clean up highlights when toggling off
            for _, player in pairs(game:GetService("Players"):GetPlayers()) do
                if player.Character then
                    local highlight = player.Character:FindFirstChildOfClass("Highlight")
                    if highlight then
                        highlight:Destroy()
                    end
                end
            end
        end
    end    
})
while true do
    updateLabels()
    if highlightEnabled then
        updateESP()
    end
    wait(0.1)
end
