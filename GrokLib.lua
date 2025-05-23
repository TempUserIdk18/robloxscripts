local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local player = Players.LocalPlayer

local UILib = {}
UILib.__index = UILib

-- Initialize the library
function UILib.new()
    local self = setmetatable({}, UILib)
    self.Windows = {}
    self.Notifications = {}
    return self
end

-- Create a new window
function UILib:NewWindow(titleText)
    local window = {}
    setmetatable(window, {__index = self})
    
    -- Create ScreenGui
    window.ScreenGui = Instance.new("ScreenGui")
    window.ScreenGui.Name = "SpBUI_" .. titleText
    window.ScreenGui.ResetOnSpawn = false
    window.ScreenGui.IgnoreGuiInset = true
    window.ScreenGui.Parent = player:WaitForChild("PlayerGui")
    
    -- Create main frame
    window.MainFrame = Instance.new("Frame")
    window.MainFrame.Size = UDim2.new(0, 350, 0, 450)
    window.MainFrame.Position = UDim2.new(0.5, -175, 0.5, -225)
    window.MainFrame.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
    window.MainFrame.BackgroundTransparency = 0.3
    window.MainFrame.BorderSizePixel = 0
    window.MainFrame.Active = true
    window.MainFrame.Draggable = true
    window.MainFrame.Parent = window.ScreenGui
    
    -- Glassmorphism effect
    local gradient = Instance.new("UIGradient")
    gradient.Color = ColorSequence.new({
        ColorSequenceKeypoint.new(0, Color3.fromRGB(50, 50, 50)),
        ColorSequenceKeypoint.new(1, Color3.fromRGB(20, 20, 20))
    })
    gradient.Rotation = 45
    gradient.Parent = window.MainFrame
    
    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0, 12)
    corner.Parent = window.MainFrame
    
    local stroke = Instance.new("UIStroke")
    stroke.Color = Color3.fromRGB(0, 255, 255)
    stroke.Thickness = 1.5
    stroke.Transparency = 0.4
    stroke.Parent = window.MainFrame
    
    -- Title bar
    window.Title = Instance.new("Frame")
    window.Title.Size = UDim2.new(1, 0, 0, 50)
    window.Title.BackgroundColor3 = Color3.fromRGB(10, 10, 10)
    window.Title.BackgroundTransparency = 0.2
    window.Title.Parent = window.MainFrame
    
    local titleGradient = Instance.new("UIGradient")
    titleGradient.Color = ColorSequence.new({
        ColorSequenceKeypoint.new(0, Color3.fromRGB(0, 255, 255)),
        ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 0, 255))
    })
    titleGradient.Rotation = 90
    titleGradient.Parent = window.Title
    
    local titleLabel = Instance.new("TextLabel")
    titleLabel.Size = UDim2.new(1, -60, 1, 0)
    titleLabel.Position = UDim2.new(0, 10, 0, 0)
    titleLabel.BackgroundTransparency = 1
    titleLabel.Text = titleText
    titleLabel.Font = Enum.Font.SourceSansPro
    titleLabel.TextSize = 20
    titleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
    titleLabel.TextXAlignment = Enum.TextXAlignment.Left
    titleLabel.Parent = window.Title
    
    -- Close button
    window.CloseBtn = Instance.new("TextButton")
    window.CloseBtn.Size = UDim2.new(0, 36, 0, 36)
    window.CloseBtn.Position = UDim2.new(1, -45, 0, 7)
    window.CloseBtn.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
    window.CloseBtn.BackgroundTransparency = 0.3
    window.CloseBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
    window.CloseBtn.Text = "×"
    window.CloseBtn.Font = Enum.Font.SourceSansPro
    window.CloseBtn.TextSize = 22
    window.CloseBtn.Parent = window.Title
    local closeCorner = Instance.new("UICorner")
    closeCorner.CornerRadius = UDim.new(0, 18)
    closeCorner.Parent = window.CloseBtn
    
    local closeStroke = Instance.new("UIStroke")
    closeStroke.Color = Color3.fromRGB(255, 0, 0)
    closeStroke.Thickness = 1
    closeStroke.Transparency = 0.5
    closeStroke.Parent = window.CloseBtn
    
    -- Close button hover effect
    window.CloseBtn.MouseEnter:Connect(function()
        TweenService:Create(window.CloseBtn, TweenInfo.new(0.2), {
            BackgroundColor3 = Color3.fromRGB(255, 50, 50),
            BackgroundTransparency = 0.1
        }):Play()
    end)
    window.CloseBtn.MouseLeave:Connect(function()
        TweenService:Create(window.CloseBtn, TweenInfo.new(0.2), {
            BackgroundColor3 = Color3.fromRGB(255, 0, 0),
            BackgroundTransparency = 0.3
        }):Play()
    end)
    
    window.CloseBtn.MouseButton1Click:Connect(function()
        window:Destroy()
    end)
    
    -- Scrolling frame
    window.Scroll = Instance.new("ScrollingFrame")
    window.Scroll.Size = UDim2.new(1, -20, 1, -70)
    window.Scroll.Position = UDim2.new(0, 10, 0, 60)
    window.Scroll.BackgroundTransparency = 1
    window.Scroll.CanvasSize = UDim2.new(0, 0, 0, 0)
    window.Scroll.ScrollBarThickness = 4
    window.Scroll.ScrollBarImageColor3 = Color3.fromRGB(0, 255, 255)
    window.Scroll.Parent = window.MainFrame
    
    window.Layout = Instance.new("UIListLayout")
    window.Layout.Padding = UDim.new(0, 10)
    window.Layout.SortOrder = Enum.SortOrder.LayoutOrder
    window.Layout.HorizontalAlignment = Enum.HorizontalAlignment.Center
    window.Layout.Parent = window.Scroll
    
    -- Auto-update canvas size
    window.Scroll.ChildAdded:Connect(function()
        task.wait()
        window.Scroll.CanvasSize = UDim2.new(0, 0, 0, window.Layout.AbsoluteContentSize.Y + 30)
    end)
    
    -- Window spawn animation
    window.MainFrame.Size = UDim2.new(0, 0, 0, 0)
    window.MainFrame.BackgroundTransparency = 1
    TweenService:Create(window.MainFrame, TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
        Size = UDim2.new(0, 350, 0, 450),
        BackgroundTransparency = 0.3
    }):Play()
    
    table.insert(self.Windows, window)
    return window
end

-- Notification function
function UILib:Notify(title, content, duration, bgColor, borderColor)
    local notification = Instance.new("Frame")
    notification.Size = UDim2.new(0, 320, 0, 90)
    notification.Position = UDim2.new(1, -330, 0, -100) -- Start off-screen
    notification.BackgroundColor3 = bgColor or Color3.fromRGB(30, 30, 30)
    notification.BackgroundTransparency = 0.2
    notification.BorderSizePixel = 0
    notification.Parent = player:WaitForChild("PlayerGui"):FindFirstChild("SpBUI_" .. (self.Title and self.Title.Text or "Notification")) or self.ScreenGui
    
    -- Glossy effect
    local gradient = Instance.new("UIGradient")
    gradient.Color = ColorSequence.new({
        ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 255, 255)),
        ColorSequenceKeypoint.new(0.5, bgColor or Color3.fromRGB(30, 30, 30)),
        ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 255, 255))
    })
    gradient.Rotation = 45
    gradient.Parent = notification
    
    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0, 10)
    corner.Parent = notification
    
    local stroke = Instance.new("UIStroke")
    stroke.Color = borderColor or Color3.fromRGB(0, 255, 255)
    stroke.Thickness = 1.5
    stroke.Transparency = 0.3
    stroke.Parent = notification
    
    -- Title
    local titleLabel = Instance.new("TextLabel")
    titleLabel.Size = UDim2.new(1, -20, 0, 25)
    titleLabel.Position = UDim2.new(0, 10, 0, 10)
    titleLabel.BackgroundTransparency = 1
    titleLabel.Text = title or "Notification"
    titleLabel.Font = Enum.Font.SourceSansPro
    titleLabel.TextSize = 18
    titleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
    titleLabel.TextXAlignment = Enum.TextXAlignment.Left
    titleLabel.Parent = notification
    
    -- Content
    local contentLabel = Instance.new("TextLabel")
    contentLabel.Size = UDim2.new(1, -20, 0, 45)
    contentLabel.Position = UDim2.new(0, 10, 0, 35)
    contentLabel.BackgroundTransparency = 1
    contentLabel.Text = content or ""
    contentLabel.Font = Enum.Font.SourceSansPro
    contentLabel.TextSize = 14
    contentLabel.TextColor3 = Color3.fromRGB(200, 200, 200)
    contentLabel.TextXAlignment = Enum.TextXAlignment.Left
    contentLabel.TextWrapped = true
    contentLabel.Parent = notification
    
    -- Animation
    notification.Size = UDim2.new(0, 320, 0, 0)
    local tweenIn = TweenService:Create(notification, TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
        Position = UDim2.new(1, -330, 0, 30), -- Slide to top with 30px padding
        Size = UDim2.new(0, 320, 0, 90)
    })
    local tweenOut = TweenService:Create(notification, TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.In), {
        Position = UDim2.new(1, -330, 0, -100),
        Size = UDim2.new(0, 320, 0, 0)
    })
    
    -- Play animation and handle lifetime
    tweenIn:Play()
    table.insert(self.Notifications, notification)
    
    task.spawn(function()
        task.wait(duration or 3)
        tweenOut:Play()
        tweenOut.Completed:Wait()
        notification:Destroy()
        table.remove(self.Notifications, table.find(self.Notifications, notification))
    end)
    
    return notification
end

-- Create a label
function UILib:CreateLabel(text, textColor)
    local label = Instance.new("TextLabel")
    label.Size = UDim2.new(0, 310, 0, 30)
    label.BackgroundTransparency = 1
    label.Text = text
    label.Font = Enum.Font.SourceSansPro
    label.TextSize = 16
    label.TextColor3 = textColor or Color3.fromRGB(255, 255, 255)
    label.TextXAlignment = Enum.TextXAlignment.Left
    label.Parent = self.Scroll
    
    local stroke = Instance.new("UIStroke")
    stroke.Color = Color3.fromRGB(0, 255, 255)
    stroke.Thickness = 0.5
    stroke.Transparency = 0.7
    stroke.Parent = label
    
    return label
end

-- Create a button
function UILib:CreateButton(text, callback)
    local btn = Instance.new("TextButton")
    btn.Size = UDim2.new(0, 310, 0, 45)
    btn.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
    btn.BackgroundTransparency = 0.3
    btn.TextColor3 = Color3.fromRGB(255, 255, 255)
    btn.Text = text
    btn.Font = Enum.Font.SourceSansPro
    btn.TextSize = 16
    btn.AutoButtonColor = false
    btn.Parent = self.Scroll
    
    local gradient = Instance.new("UIGradient")
    gradient.Color = ColorSequence.new({
        ColorSequenceKeypoint.new(0, Color3.fromRGB(0, 255, 255)),
        ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 0, 255))
    })
    gradient.Rotation = 90
    gradient.Parent = btn
    
    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0, 10)
    corner.Parent = btn
    
    local stroke = Instance.new("UIStroke")
    stroke.Color = Color3.fromRGB(0, 255, 255)
    stroke.Thickness = 1
    stroke.Transparency = 0.5
    stroke.Parent = btn
    
    -- Hover effect
    btn.MouseEnter:Connect(function()
        TweenService:Create(btn, TweenInfo.new(0.2), {
            BackgroundTransparency = 0.1,
            Size = UDim2.new(0, 315, 0, 48)
        }):Play()
        TweenService:Create(stroke, TweenInfo.new(0.2), {
            Transparency = 0.3
        }):Play()
    end)
    btn.MouseLeave:Connect(function()
        TweenService:Create(btn, TweenInfo.new(0.2), {
            BackgroundTransparency = 0.3,
            Size = UDim2.new(0, 310, 0, 45)
        }):Play()
        TweenService:Create(stroke, TweenInfo.new(0.2), {
            Transparency = 0.5
        }):Play()
    end)
    
    btn.MouseButton1Click:Connect(callback)
    return btn
end

-- Create a textbox
function UILib:CreateTextbox(placeholder, callback, numbersOnly)
    local box = Instance.new("TextBox")
    box.Size = UDim2.new(0, 310, 0, 45)
    box.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
    box.BackgroundTransparency = 0.4
    box.TextColor3 = Color3.fromRGB(255, 255, 255)
    box.PlaceholderText = placeholder
    box.PlaceholderColor3 = Color3.fromRGB(150, 150, 150)
    box.Text = ""
    box.Font = Enum.Font.SourceSansPro
    box.TextSize = 16
    box.ClearTextOnFocus = false
    box.Parent = self.Scroll
    
    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0, 10)
    corner.Parent = box
    
    local stroke = Instance.new("UIStroke")
    stroke.Color = Color3.fromRGB(0, 255, 255)
    stroke.Thickness = 1
    stroke.Transparency = 0.5
    stroke.Parent = box
    
    -- Focus animation
    box.Focused:Connect(function()
        TweenService:Create(stroke, TweenInfo.new(0.2), {
            Color = Color3.fromRGB(255, 0, 255),
            Transparency = 0.3
        }):Play()
    end)
    box.FocusLost:Connect(function()
        TweenService:Create(stroke, TweenInfo.new(0.2), {
            Color = Color3.fromRGB(0, 255, 255),
            Transparency = 0.5
        }):Play()
    end)
    
    if numbersOnly then
        box:GetPropertyChangedSignal("Text"):Connect(function()
            box.Text = box.Text:gsub("[^%d.]", "")
        end)
    end
    
    box.FocusLost:Connect(function(enterPressed)
        if enterPressed then
            callback(box.Text)
        end
    end)
    return box
end

-- Create a checkbox (modern toggle switch)
function UILib:CreateCheckbox(text, callback)
    local chk = Instance.new("Frame")
    chk.Size = UDim2.new(0, 310, 0, 45)
    chk.BackgroundTransparency = 1
    chk.Parent = self.Scroll
    
    local label = Instance.new("TextLabel")
    label.Size = UDim2.new(0, 250, 1, 0)
    label.BackgroundTransparency = 1
    label.Text = text
    label.Font = Enum.Font.SourceSansPro
    label.TextSize = 16
    label.TextColor3 = Color3.fromRGB(255, 255, 255)
    label.TextXAlignment = Enum.TextXAlignment.Left
    label.Parent = chk
    
    local toggle = Instance.new("Frame")
    toggle.Size = UDim2.new(0, 50, 0, 24)
    toggle.Position = UDim2.new(1, -50, 0.5, -12)
    toggle.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
    toggle.Parent = chk
    
    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0, 12)
    corner.Parent = toggle
    
    local knob = Instance.new("Frame")
    knob.Size = UDim2.new(0, 20, 0, 20)
    knob.Position = UDim2.new(0, 4, 0, 2)
    knob.BackgroundColor3 = Color3.fromRGB(150, 150, 150)
    knob.Parent = toggle
    
    local knobCorner = Instance.new("UICorner")
    knobCorner.CornerRadius = UDim.new(0, 10)
    knobCorner.Parent = knob
    
    local stroke = Instance.new("UIStroke")
    stroke.Color = Color3.fromRGB(0, 255, 255)
    stroke.Thickness = 1
    stroke.Transparency = 0.5
    stroke.Parent = toggle
    
    local checked = false
    local button = Instance.new("TextButton")
    button.Size = UDim2.new(1, 0, 1, 0)
    button.BackgroundTransparency = 1
    button.Text = ""
    button.Parent = chk
    
    button.MouseButton1Click:Connect(function()
        checked = not checked
        local newPos = checked and UDim2.new(0, 26, 0, 2) or UDim2.new(0, 4, 0, 2)
        local newColor = checked and Color3.fromRGB(0, 255, 255) or Color3.fromRGB(150, 150, 150)
        local newBgColor = checked and Color3.fromRGB(30, 30, 30) or Color3.fromRGB(50, 50, 50)
        TweenService:Create(knob, TweenInfo.new(0.2), {
            Position = newPos,
            BackgroundColor3 = newColor
        }):Play()
        TweenService:Create(toggle, TweenInfo.new(0.2), {
            BackgroundColor3 = newBgColor
        }):Play()
        callback(checked)
    end)
    
    return chk
end

-- Destroy window
function UILib:Destroy()
    if self.ScreenGui then
        self.ScreenGui:Destroy()
    end
    setmetatable(self, nil)
end

return UILib
