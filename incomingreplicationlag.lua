local screenGui = Instance.new("ScreenGui")
screenGui.Parent = game.CoreGui
screenGui.ResetOnSpawn = false
local frame = Instance.new("Frame")
frame.Parent = screenGui
frame.Size = UDim2.new(0, 320, 0, 75)
frame.Position = UDim2.new(0, 20, 0, 20)
frame.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
frame.BorderSizePixel = 0
frame.Active = true
frame.Draggable = true
frame.BackgroundTransparency = 0.2
local uiCorner = Instance.new("UICorner")
uiCorner.CornerRadius = UDim.new(0, 10)
uiCorner.Parent = frame
local titleBar = Instance.new("TextLabel")
titleBar.Parent = frame
titleBar.Size = UDim2.new(1, 0, 0, 20)
titleBar.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
titleBar.Text = "IncomingReplicationLag"
titleBar.TextColor3 = Color3.fromRGB(255, 255, 255)
titleBar.Font = Enum.Font.SourceSansBold
titleBar.TextSize = 18
titleBar.BackgroundTransparency = 0.2
local titleCorner = Instance.new("UICorner")
titleCorner.CornerRadius = UDim.new(0, 10)
titleCorner.Parent = titleBar
local closeButton = Instance.new("TextButton")
closeButton.Parent = frame
closeButton.Size = UDim2.new(0, 20, 0, 20)
closeButton.Position = UDim2.new(1, -25, 0, 0)
closeButton.BackgroundColor3 = Color3.fromRGB(200, 50, 50)
closeButton.Text = "X"
closeButton.TextColor3 = Color3.fromRGB(255, 255, 255)
closeButton.Font = Enum.Font.SourceSansBold
closeButton.TextSize = 14
local closeCorner = Instance.new("UICorner")
closeCorner.CornerRadius = UDim.new(0, 10)
closeCorner.Parent = closeButton
closeButton.MouseEnter:Connect(function()
    closeButton.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
end)
closeButton.MouseLeave:Connect(function()
    closeButton.BackgroundColor3 = Color3.fromRGB(200, 50, 50)
end)
closeButton.MouseButton1Click:Connect(function()
    screenGui:Destroy()
end)
local spawnButton = Instance.new("TextButton")
spawnButton.Parent = frame
spawnButton.Size = UDim2.new(1, -10, 0, 35)
spawnButton.Position = UDim2.new(0, 5, 0, 30)
spawnButton.Text = "IncomingReplicationLag:FireClient('start')"
spawnButton.TextColor3 = Color3.fromRGB(255, 255, 255)
spawnButton.BackgroundColor3 = Color3.fromRGB(200, 50, 50)
spawnButton.Font = Enum.Font.SourceSansBold
spawnButton.TextSize = 18
spawnButton.AutoButtonColor = false
local buttonCorner = Instance.new("UICorner")
buttonCorner.CornerRadius = UDim.new(0, 8)
buttonCorner.Parent = spawnButton
spawnButton.MouseEnter:Connect(function()
    spawnButton.BackgroundColor3 = Color3.fromRGB(50, 50, 200)
end)
spawnButton.MouseLeave:Connect(function()
    if not lagRunning then
        spawnButton.BackgroundColor3 = Color3.fromRGB(200, 50, 50)
    end
end)
local lagParts = {}
local lagRunning = false
local function createLagLoop()
    lagRunning = true
    spawnButton.Text = "IncomingReplicationLag:FireClient('stop')"
    spawnButton.BackgroundColor3 = Color3.fromRGB(50, 50, 200)
    while lagRunning do
        for i = 1, 50000 do
            if not lagRunning then break end
            local part = Instance.new("Part")
            part.Parent = game.Workspace
            part.Size = Vector3.new(0.01, 0.01, 0.01)
            part.Name = "LAGPARTTT"
            part.Position = Vector3.new(
                math.random(-500, 500),
                math.random(200, 300),
                math.random(-500, 500)
            )
            part.Anchored = false
            part.CanCollide = true
            table.insert(lagParts, part)
            if i % 100 == 0 then
                wait(0.05)
            end
        end
        for _, part in pairs(lagParts) do
            if part and part.Parent then
                part:Destroy()
            end
        end
        lagParts = {}
        wait(0.05)
    end
end
spawnButton.MouseButton1Click:Connect(function()
    if lagRunning then
        lagRunning = false
        for _, part in pairs(lagParts) do
            if part and part.Parent then
                part:Destroy()
            end
        end
        lagParts = {}
        spawnButton.Text = "IncomingReplicationLag:FireClient('start')"
        spawnButton.BackgroundColor3 = Color3.fromRGB(200, 50, 50)
    else
        createLagLoop()
    end
end)
