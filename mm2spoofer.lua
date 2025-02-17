local OreoLib = loadstring(game:HttpGet("https://raw.githubusercontent.com/TempUserIdk18/OreoLib/refs/heads/main/OreoLibSource.lua"))()

local Window = OreoLib:MakeWindow({
    Name = "Murder Mystery ROLE SPOOFER",
    HidePremium = false,
    SaveConfig = false,
    ConfigFolder = "mm2spoof",
    IntroEnabled = false,
    Icon = "rbxassetid://4483345998"
})
local Tab = Window:MakeTab({
    Name = "Main",
    Icon = "rbxassetid://4483345998",
    PremiumOnly = false
})
Window:SetTheme("Ocean")                
local Tab2 = Window:MakeTab({
    Name = "Info",
    Icon = "rbxassetid://4483345998",
    PremiumOnly = false
})
Tab2:AddLabel("spoofs when round starts")
Tab2:AddLabel("btw it works with MM2 copies!!!")
Tab2:AddLabel("  ")
Tab2:AddLabel("0.2 updatelog:")
Tab2:AddLabel("esp now shows the gun as green")
Tab2:AddLabel("made floating ui round")

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
    Frame.BackgroundColor3 = Color3.fromRGB(30,30,30)
    Frame.Size = UDim2.new(0, 300, 0, 150)
    Frame.Position = UDim2.new(0.5, -150, 0.1, 0)
    Frame.BorderSizePixel = 0

    -- UIStroke
    UIStroke.Parent = Frame
    UIStroke.Color = Color3.fromRGB(255, 255, 255)
    UIStroke.Thickness = 2
    UIStroke.Transparency = 0.5

    -- UICorner
    UICorner.Parent = Frame

    -- TitleBar
    TitleBar.Parent = Frame
    TitleBar.Size = UDim2.new(1, 0, 0, 30)
    TitleBar.BackgroundColor3 = Color3.fromRGB(32, 53, 245)
    TitleBar.Text = "Info"
    TitleBar.TextColor3 = Color3.new(1, 1, 1)
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
    Name = "Floating UI",
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
local highlightEnabled = false
Tab:AddToggle({
    Name = "ESP",
    Default = false,
    Callback = function(value)
        highlightEnabled = value
    end    
})
while true do
    updateLabels()
    
    if highlightEnabled then
        for _, player in pairs(game:GetService("Players"):GetPlayers()) do
            if player.Character then
                local highlight = player.Character:FindFirstChildOfClass("Highlight")
                if not highlight then
                    highlight = Instance.new("Highlight")
                    highlight.Parent = player.Character
                    highlight.FillTransparency = 1
                    highlight.OutlineColor = Color3.fromRGB(255, 255, 255)
                    highlight.OutlineTransparency = 0
                    highlight.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
                end
            end
        end
    else
        for _, player in pairs(game:GetService("Players"):GetPlayers()) do
            if player.Character then
                local highlight = player.Character:FindFirstChildOfClass("Highlight")
                if highlight then
                    highlight:Destroy()
                end
            end
        end
    end
    
    wait(1)
end
