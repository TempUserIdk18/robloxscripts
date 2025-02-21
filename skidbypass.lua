local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local player = Players.LocalPlayer
local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")
local letterReplacements = {
    ["u"] = {"น"},
    ["s"] = {"ร"},
    ["i"] = {"ί", "Ϊ"},
    ["I"] = {"l"},
    ["U"] = {"U"}
}
local screenGui = Instance.new("ScreenGui")
screenGui.Parent = game.CoreGui
screenGui.Name = "NotificationGui"
local function createNotification(title, content, duration)
    duration = duration or 5
    local notification = Instance.new("Frame")
    notification.Size = UDim2.new(0, 300, 0, 80)
    notification.Position = UDim2.new(1, 310, 1, -100)
    notification.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
    notification.BorderSizePixel = 0
    notification.Parent = screenGui
    notification.AnchorPoint = Vector2.new(1, 1)
    notification.BackgroundTransparency = 0.2
    local uiCorner = Instance.new("UICorner")
    uiCorner.CornerRadius = UDim.new(0, 8)
    uiCorner.Parent = notification
    local titleLabel = Instance.new("TextLabel")
    titleLabel.Size = UDim2.new(1, -10, 0, 25)
    titleLabel.Position = UDim2.new(0, 5, 0, 5)
    titleLabel.BackgroundTransparency = 1
    titleLabel.Text = title
    titleLabel.TextSize = 18
    titleLabel.Font = Enum.Font.GothamBold
    titleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
    titleLabel.TextXAlignment = Enum.TextXAlignment.Left
    titleLabel.Parent = notification
    local contentLabel = Instance.new("TextLabel")
    contentLabel.Size = UDim2.new(1, -10, 0, 40)
    contentLabel.Position = UDim2.new(0, 5, 0, 30)
    contentLabel.BackgroundTransparency = 1
    contentLabel.Text = content
    contentLabel.TextSize = 14
    contentLabel.Font = Enum.Font.Gotham
    contentLabel.TextColor3 = Color3.fromRGB(200, 200, 200)
    contentLabel.TextWrapped = true
    contentLabel.TextXAlignment = Enum.TextXAlignment.Left
    contentLabel.TextYAlignment = Enum.TextYAlignment.Top
    contentLabel.Parent = notification
    local slideInTween = TweenService:Create(notification, TweenInfo.new(0.5, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {Position = UDim2.new(1, -10, 1, -100)})
    slideInTween:Play()
    slideInTween.Completed:Wait()
    task.delay(duration, function()
        local slideOutTween = TweenService:Create(notification, TweenInfo.new(0.5, Enum.EasingStyle.Quint, Enum.EasingDirection.In), {Position = UDim2.new(1, 310, 1, -100)})
        slideOutTween:Play()
        slideOutTween.Completed:Wait()
        notification:Destroy()
    end)
end
local function replaceLetters(message)
    for original, replacements in pairs(letterReplacements) do
        -- Replace only lowercase letters
        message = message:gsub(original, function()
            if #replacements == 1 then
                return replacements[1]
            else
                return replacements[math.random(#replacements)]
            end
        end)
    end
    return message
end
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Parent = game.CoreGui
ScreenGui.ResetOnSpawn = false
local Frame = Instance.new("Frame")
Frame.Size = UDim2.new(0, 320, 0, 140)
Frame.Position = UDim2.new(0.5, -160, 0.8, -70)
Frame.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
Frame.BorderSizePixel = 0
Frame.Parent = ScreenGui
local UICorner = Instance.new("UICorner")
UICorner.CornerRadius = UDim.new(0, 10)
UICorner.Parent = Frame
local TitleBar = Instance.new("Frame")
TitleBar.Size = UDim2.new(1, 0, 0, 25)
TitleBar.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
TitleBar.BorderSizePixel = 0
TitleBar.Parent = Frame
local UICorner2 = Instance.new("UICorner")
UICorner2.CornerRadius = UDim.new(0, 10)
UICorner2.Parent = TitleBar
local TitleText = Instance.new("TextLabel")
TitleText.Size = UDim2.new(1, -30, 1, 0)
TitleText.Position = UDim2.new(0, 10, 0, 0)
TitleText.Text = "SkidBypass"
TitleText.TextColor3 = Color3.new(1, 1, 1)
TitleText.Font = Enum.Font.GothamBold
TitleText.TextSize = 14
TitleText.BackgroundTransparency = 1
TitleText.TextXAlignment = Enum.TextXAlignment.Left
TitleText.Parent = TitleBar
local CloseButton = Instance.new("TextButton")
CloseButton.Size = UDim2.new(0, 25, 1, 0)
CloseButton.Position = UDim2.new(1, -25, 0, 0)
CloseButton.Text = "X"
CloseButton.TextColor3 = Color3.fromRGB(255, 0, 0)
CloseButton.Font = Enum.Font.GothamBold
CloseButton.TextSize = 14
CloseButton.BackgroundTransparency = 1
CloseButton.Parent = TitleBar
CloseButton.MouseButton1Click:Connect(function()
    ScreenGui:Destroy()
end)
createNotification("Note", "Set your language to Казак Тiлi if you didnt!", 5)
local TextBox = Instance.new("TextBox")
TextBox.Size = UDim2.new(1, -20, 0.5, -5)
TextBox.Position = UDim2.new(0, 10, 0, 35)
TextBox.PlaceholderText = "Enter message..."
TextBox.Text = ""
TextBox.Font = Enum.Font.Gotham
TextBox.TextSize = 14
TextBox.TextColor3 = Color3.new(1, 1, 1)
TextBox.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
TextBox.BorderSizePixel = 0
TextBox.Parent = Frame
TextBox.ClearTextOnFocus = false
local TextBoxCorner = Instance.new("UICorner")
TextBoxCorner.CornerRadius = UDim.new(0, 6)
TextBoxCorner.Parent = TextBox
local SendButton = Instance.new("TextButton")
SendButton.Size = UDim2.new(1, -20, 0.2, -5)
SendButton.Position = UDim2.new(0, 10, 0.75, 0)
SendButton.Text = "Send"
SendButton.Font = Enum.Font.GothamBold
SendButton.TextSize = 14
SendButton.TextColor3 = Color3.new(1, 1, 1)
SendButton.BackgroundColor3 = Color3.fromRGB(80, 160, 255)
SendButton.BorderSizePixel = 0
SendButton.Parent = Frame
local SendButtonCorner = Instance.new("UICorner")
SendButtonCorner.CornerRadius = UDim.new(0, 6)
SendButtonCorner.Parent = SendButton
SendButton.MouseEnter:Connect(function()
    SendButton.BackgroundColor3 = Color3.fromRGB(100, 180, 255)
end)
SendButton.MouseLeave:Connect(function()
    SendButton.BackgroundColor3 = Color3.fromRGB(80, 160, 255)
end)
local dragging
local dragInput
local dragStart
local startPos
TitleBar.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        dragging = true
        dragStart = input.Position
        startPos = Frame.Position
        input.Changed:Connect(function()
            if input.UserInputState == Enum.UserInputState.End then
                dragging = false
            end
        end)
    end
end)
TitleBar.InputChanged:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseMovement then
        dragInput = input
    end
end)
UserInputService.InputChanged:Connect(function(input)
    if input == dragInput and dragging then
        local delta = input.Position - dragStart
        Frame.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
    end
end)
local function sendMessage()
    local message = TextBox.Text
    if message and message ~= "" then
        local filteredMessage = replaceLetters(message)
        game.TextChatService.TextChannels:FindFirstChild("RBXGeneral"):SendAsync(filteredMessage)
    end
end
SendButton.MouseButton1Click:Connect(sendMessage)
TextBox.FocusLost:Connect(function(enterPressed)
    if enterPressed then
        sendMessage()
    end
end)
