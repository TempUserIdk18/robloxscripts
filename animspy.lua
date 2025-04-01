local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")

local LocalPlayer = Players.LocalPlayer
local spying = false
local targetPlayer = nil
local animations = {}
local animationConnections = {}
local animationTools = {}
local activeAnimationTracks = {}

-- Create GUI with improved styling
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "AnimationSpyGUI"
screenGui.Parent = LocalPlayer:WaitForChild("PlayerGui")

local frame = Instance.new("Frame")
frame.Size = UDim2.new(0, 350, 0, 300) -- Increased height
frame.Position = UDim2.new(0.5, -175, 0.2, 0)
frame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
frame.BorderSizePixel = 0
frame.Parent = screenGui

local uiCorner = Instance.new("UICorner")
uiCorner.CornerRadius = UDim.new(0, 10)
uiCorner.Parent = frame

-- Title label
local title = Instance.new("TextLabel")
title.Size = UDim2.new(0.8, 0, 0, 25)
title.Position = UDim2.new(0.1, 0, 0.05, 0)
title.BackgroundTransparency = 1
title.TextColor3 = Color3.fromRGB(255, 255, 255)
title.Text = "Animation Spy"
title.Font = Enum.Font.GothamBold
title.TextSize = 18
title.Parent = frame

-- Dragging functionality
local dragToggle = nil
local dragStart = nil
local startPos = nil

frame.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        dragToggle = true
        dragStart = input.Position
        startPos = frame.Position
        input.Changed:Connect(function()
            if input.UserInputState == Enum.UserInputState.End then
                dragToggle = false
            end
        end)
    end
end)

UserInputService.InputChanged:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseMovement then
        if dragToggle then
            local delta = input.Position - dragStart
            frame.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
        end
    end
end)

-- UI Elements with improved styling
local textBox = Instance.new("TextBox")
textBox.Size = UDim2.new(0.8, 0, 0, 30)
textBox.Position = UDim2.new(0.1, 0, 0.15, 0)
textBox.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
textBox.TextColor3 = Color3.fromRGB(255, 255, 255)
textBox.PlaceholderColor3 = Color3.fromRGB(180, 180, 180)
textBox.PlaceholderText = "Enter Username"
textBox.ClearTextOnFocus = false
textBox.TextXAlignment = Enum.TextXAlignment.Center
textBox.Parent = frame
uiCorner:Clone().Parent = textBox

local toggleButton = Instance.new("TextButton")
toggleButton.Size = UDim2.new(0.8, 0, 0, 35)
toggleButton.Position = UDim2.new(0.1, 0, 0.25, 5)
toggleButton.BackgroundColor3 = Color3.fromRGB(70, 140, 70)
toggleButton.TextColor3 = Color3.fromRGB(255, 255, 255)
toggleButton.Text = "Start Spying"
toggleButton.Font = Enum.Font.GothamSemibold
toggleButton.TextSize = 14
toggleButton.Parent = frame
uiCorner:Clone().Parent = toggleButton

local scrollFrame = Instance.new("ScrollingFrame")
scrollFrame.Size = UDim2.new(0.8, 0, 0.5, 0)
scrollFrame.Position = UDim2.new(0.1, 0, 0.35, 25)
scrollFrame.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
scrollFrame.CanvasSize = UDim2.new(0, 0, 0, 0)
scrollFrame.ScrollBarThickness = 5
scrollFrame.Parent = frame
uiCorner:Clone().Parent = scrollFrame

local list = Instance.new("UIListLayout")
list.Padding = UDim.new(0, 5)
list.Parent = scrollFrame

-- Update canvas size when list changes
list:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
    scrollFrame.CanvasSize = UDim2.new(0, 0, 0, list.AbsoluteContentSize.Y)
end)

-- Cleanup function
local function clearConnections()
    for _, conn in pairs(animationConnections) do
        if conn then
            conn:Disconnect()
        end
    end
    animationConnections = {}
end

-- Function to stop all playing animations
local function stopAllAnimationTracks()
    for _, track in pairs(activeAnimationTracks) do
        if track then
            track:Stop()
        end
    end
    activeAnimationTracks = {}
end

-- Function to create animation toggle tool
local function createAnimationTool(animationId)
    if animationTools[animationId] then return end
    
    local shortId = animationId:match("%d+$") or animationId
    local toolName = "Anim: " .. shortId
    
    -- Check if tool already exists in backpack
    for _, existingTool in ipairs(LocalPlayer.Backpack:GetChildren()) do
        if existingTool.Name == toolName then
            animationTools[animationId] = existingTool
            return
        end
    end
    
    local tool = Instance.new("Tool")
    tool.Name = toolName
    tool.ToolTip = "Toggle Animation (ID: "..shortId..")"
    tool.RequiresHandle = false
    tool.CanBeDropped = false
    
    local isPlaying = false
    local animationTrack = nil
    
    tool.Activated:Connect(function()
        local character = LocalPlayer.Character
        if not character then return end
        
        local humanoid = character:FindFirstChildOfClass("Humanoid")
        if not humanoid then return end
        
        local animator = humanoid:FindFirstChildOfClass("Animator")
        if not animator then return end
        
        if isPlaying then
            if animationTrack then
                animationTrack:Stop()
                activeAnimationTracks[animationId] = nil
            end
            isPlaying = false
        else
            stopAllAnimationTracks()
            
            local animation = Instance.new("Animation")
            animation.AnimationId = animationId
            
            animationTrack = animator:LoadAnimation(animation)
            animationTrack.Looped = true
            animationTrack.Priority = Enum.AnimationPriority.Action
            animationTrack:Play()
    
            activeAnimationTracks[animationId] = animationTrack
            isPlaying = true
            
            animationTrack.Stopped:Connect(function()
                isPlaying = false
                activeAnimationTracks[animationId] = nil
            end)
        end
    end)
    
    tool.Destroying:Connect(function()
        if animationTrack then
            animationTrack:Stop()
            activeAnimationTracks[animationId] = nil
        end
        animationTools[animationId] = nil
    end)
    
    tool.Parent = LocalPlayer.Backpack
    animationTools[animationId] = tool
end

local function addAnimationLabel(animationId)
    local shortId = animationId:match("%d+$") or animationId
    
    local label = Instance.new("TextButton")
    label.Size = UDim2.new(1, -10, 0, 30)
    label.Position = UDim2.new(0, 5, 0, 0)
    label.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
    label.TextColor3 = Color3.fromRGB(255, 255, 255)
    label.Text = "Animation: " .. shortId
    label.TextXAlignment = Enum.TextXAlignment.Left
    label.TextYAlignment = Enum.TextYAlignment.Center
    label.Font = Enum.Font.Gotham
    label.TextSize = 12
    label.AutoButtonColor = false
    label.Parent = scrollFrame
    uiCorner:Clone().Parent = label
    
    -- Highlight on hover
    label.MouseEnter:Connect(function()
        label.BackgroundColor3 = Color3.fromRGB(80, 80, 80)
    end)
    
    label.MouseLeave:Connect(function()
        label.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
    end)
    
    label.MouseButton1Click:Connect(function()
        createAnimationTool(animationId)
        label.BackgroundColor3 = Color3.fromRGB(100, 100, 100)
        task.wait(0.1)
        label.BackgroundColor3 = Color3.fromRGB(80, 80, 80)
    end)
end

local function scanCurrentAnimations(animator)
    if not animator then return end
    
    -- Get all currently playing animation tracks
    for _, track in ipairs(animator:GetPlayingAnimationTracks()) do
        if track.Animation then
            local animationId = track.Animation.AnimationId
            if animationId and animationId:match("^rbxassetid://%d+$") then
                animationId = animationId:gsub("%%", "")
                
                if not animations[animationId] then
                    animations[animationId] = true
                    addAnimationLabel(animationId)
                    print("Found currently playing: " .. animationId)
                    createAnimationTool(animationId)
                end
            end
        end
    end
end

local function trackAnimations(character)
    if not character then return end
    
    local humanoid = character:FindFirstChildOfClass("Humanoid")
    if not humanoid then return end
    
    -- Wait for humanoid to be ready (handles respawning)
    if humanoid:GetState() == Enum.HumanoidStateType.Dead then
        local conn
        conn = humanoid.StateChanged:Connect(function(oldState, newState)
            if newState == Enum.HumanoidStateType.Running then
                conn:Disconnect()
                trackAnimations(character)
            end
        end)
        return
    end
    
    local animator = humanoid:FindFirstChildOfClass("Animator")
    
    if animator then
        -- First scan for any currently playing animations
        scanCurrentAnimations(animator)
    else
        -- Wait for animator if not immediately available
        local conn
        conn = humanoid.ChildAdded:Connect(function(child)
            if child:IsA("Animator") then
                conn:Disconnect()
                trackAnimations(character)
            end
        end)
        return
    end
    
    -- Connect to future animation plays
    local conn = animator.AnimationPlayed:Connect(function(animationTrack)
        if animationTrack.Animation then
            local animationId = animationTrack.Animation.AnimationId
            if animationId and animationId:match("^rbxassetid://%d+$") then
                animationId = animationId:gsub("%%", "")
                
                if not animations[animationId] then
                    animations[animationId] = true
                    addAnimationLabel(animationId)
                    print(targetPlayer.Name .. " played: " .. animationId)
                    createAnimationTool(animationId)
                end
            end
        end
    end)
    
    table.insert(animationConnections, conn)
    
    -- Handle character respawning (clean up old connections)
    local humanoidConn
    humanoidConn = humanoid.Died:Connect(function()
        humanoidConn:Disconnect()
        -- When the character dies, we'll get a new one through CharacterAdded
    end)
    table.insert(animationConnections, humanoidConn)
end

local function spyOnPlayer()
    clearConnections()
    animations = {}
    
    -- Clear existing tools
    for _, tool in pairs(LocalPlayer.Backpack:GetChildren()) do
        if tool:IsA("Tool") and tool.Name:match("^Anim: %d+$") then
            tool:Destroy()
        end
    end
    animationTools = {}
    
    -- Clear scroll frame
    for _, child in ipairs(scrollFrame:GetChildren()) do
        if child:IsA("TextButton") then
            child:Destroy()
        end
    end
    
    targetPlayer = Players:FindFirstChild(textBox.Text)
    if not targetPlayer then
        warn("Player not found!")
        return
    end
    
    -- Track current character
    if targetPlayer.Character then
        trackAnimations(targetPlayer.Character)
    end
    
    -- Track future characters (including respawns)
    local conn = targetPlayer.CharacterAdded:Connect(function(character)
        trackAnimations(character)
    end)
    table.insert(animationConnections, conn)
    
    -- Cleanup if target leaves
    local leaveConn = targetPlayer.AncestryChanged:Connect(function()
        if not targetPlayer.Parent then
            clearConnections()
            spying = false
            toggleButton.Text = "Start Spying"
            toggleButton.BackgroundColor3 = Color3.fromRGB(70, 140, 70)
        end
    end)
    table.insert(animationConnections, leaveConn)
end

toggleButton.MouseButton1Click:Connect(function()
    spying = not spying
    toggleButton.Text = spying and "Stop Spying" or "Start Spying"
    toggleButton.BackgroundColor3 = spying and Color3.fromRGB(140, 70, 70) or Color3.fromRGB(70, 140, 70)
    
    if spying then
        coroutine.wrap(spyOnPlayer)()
    else
        clearConnections()
        stopAllAnimationTracks()
    end
end)

-- Handle local player respawning
LocalPlayer.CharacterAdded:Connect(function(character)
    -- Re-add animation tools to new character's backpack
    for animationId, tool in pairs(animationTools) do
        if tool and not tool.Parent then
            tool.Parent = LocalPlayer.Backpack
        end
    end
end)

-- Cleanup
LocalPlayer.CharacterRemoving:Connect(function()
    clearConnections()
    stopAllAnimationTracks()
end)
