local screenGui = Instance.new("ScreenGui")
screenGui.Parent = game.CoreGui
screenGui.ResetOnSpawn = false
local frame = Instance.new("Frame")
frame.Parent = screenGui
frame.Size = UDim2.new(0, 340, 0, 90)
frame.Position = UDim2.new(0, 20, 0, 20)
frame.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
frame.BorderSizePixel = 0
frame.Active = true
frame.Draggable = true
frame.BackgroundTransparency = 0.15
local uiCorner = Instance.new("UICorner")
uiCorner.CornerRadius = UDim.new(0, 12)
uiCorner.Parent = frame
local titleBar = Instance.new("TextLabel")
titleBar.Parent = frame
titleBar.Size = UDim2.new(1, 0, 0, 25)
titleBar.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
titleBar.Text = "IncomingReplicationLag"
titleBar.TextColor3 = Color3.fromRGB(255, 255, 255)
titleBar.Font = Enum.Font.GothamBold
titleBar.TextSize = 16
titleBar.BackgroundTransparency = 0.15
local uiCorner2 = Instance.new("UICorner")
uiCorner2.CornerRadius = UDim.new(0, 12)
uiCorner2.Parent = titleBar
local closeButton = Instance.new("TextButton")
closeButton.Parent = frame
closeButton.Size = UDim2.new(0, 22, 0, 22)
closeButton.Position = UDim2.new(1, -30, 0, 2)
closeButton.BackgroundColor3 = Color3.fromRGB(220, 60, 60)
closeButton.Text = "X"
closeButton.TextColor3 = Color3.fromRGB(255, 255, 255)
closeButton.Font = Enum.Font.GothamBold
closeButton.TextSize = 14
local closeCorner = Instance.new("UICorner")
closeCorner.CornerRadius = UDim.new(0, 6)
closeCorner.Parent = closeButton
closeButton.MouseEnter:Connect(function()
    closeButton.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
end)
closeButton.MouseLeave:Connect(function()
    closeButton.BackgroundColor3 = Color3.fromRGB(220, 60, 60)
end)
closeButton.MouseButton1Click:Connect(function()
    screenGui:Destroy()
end)
local spawnButton = Instance.new("TextButton")
spawnButton.Parent = frame
spawnButton.Size = UDim2.new(1, -20, 0, 40)
spawnButton.Position = UDim2.new(0, 10, 0, 35)
spawnButton.Text = "IncomingReplicationLag:FireClient('start')"
spawnButton.TextColor3 = Color3.fromRGB(255, 255, 255)
spawnButton.BackgroundColor3 = Color3.fromRGB(0, 122, 255)
spawnButton.Font = Enum.Font.GothamBold
spawnButton.TextSize = 16
local buttonCorner = Instance.new("UICorner")
buttonCorner.CornerRadius = UDim.new(0, 10)
buttonCorner.Parent = spawnButton
local lagRunning = false
spawnButton.MouseButton1Click:Connect(function()
    lagRunning = not lagRunning
    if lagRunning then
        settings():GetService("NetworkSettings").IncomingReplicationLag = 999
        spawnButton.Text = "IncomingReplicationLag:FireClient('stop')"
        spawnButton.BackgroundColor3 = Color3.fromRGB(220, 60, 60)
    else
        settings():GetService("NetworkSettings").IncomingReplicationLag = 0
        spawnButton.Text = "IncomingReplicationLag:FireClient('start')"
        spawnButton.BackgroundColor3 = Color3.fromRGB(0, 122, 255)
    end
end)
