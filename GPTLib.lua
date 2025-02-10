local UserInputService = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")

local GPTLib = {}

-- Function to create smooth animations
local function Tween(obj, property, goal, time)
    TweenService:Create(obj, TweenInfo.new(time, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {[property] = goal}):Play()
end

-- Function to make the title bar draggable
local function MakeDraggable(frame, titleBar)
    local dragging, dragInput, dragStart, startPos

    titleBar.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            dragging = true
            dragStart = input.Position
            startPos = frame.Position

            input.Changed:Connect(function()
                if input.UserInputState == Enum.UserInputState.End then
                    dragging = false
                end
            end)
        end
    end)

    titleBar.InputChanged:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseMovement then
            dragInput = input
        end
    end)

    UserInputService.InputChanged:Connect(function(input)
        if input == dragInput and dragging then
            local delta = input.Position - dragStart
            frame.Position = UDim2.new(
                startPos.X.Scale, startPos.X.Offset + delta.X,
                startPos.Y.Scale, startPos.Y.Offset + delta.Y
            )
        end
    end)
end

function GPTLib:CreateWindow(title)
    local player = game.Players.LocalPlayer
    local screenGui = Instance.new("ScreenGui")
    screenGui.Parent = player:FindFirstChild("PlayerGui") or player:WaitForChild("PlayerGui")

    local frame = Instance.new("Frame")
    frame.Size = UDim2.new(0.3, 0, 0.4, 0)
    frame.Position = UDim2.new(0.35, 0, 0.3, 0)
    frame.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
    frame.BorderSizePixel = 0
    frame.Parent = screenGui

    -- Rounded corners
    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0, 10)
    corner.Parent = frame

    -- Title Bar
    local titleBar = Instance.new("Frame")
    titleBar.Size = UDim2.new(1, 0, 0.1, 0)
    titleBar.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
    titleBar.Parent = frame

    local titleText = Instance.new("TextLabel")
    titleText.Text = title
    titleText.Size = UDim2.new(1, -60, 1, 0)
    titleText.TextXAlignment = Enum.TextXAlignment.Left
    titleText.TextColor3 = Color3.fromRGB(255, 255, 255)
    titleText.Font = Enum.Font.SourceSansBold
    titleText.BackgroundTransparency = 1
    titleText.Position = UDim2.new(0, 10, 0, 0)
    titleText.Parent = titleBar

    -- Close Button
    local closeButton = Instance.new("TextButton")
    closeButton.Text = "X"
    closeButton.Size = UDim2.new(0, 30, 1, 0)
    closeButton.Position = UDim2.new(1, -35, 0, 0)
    closeButton.BackgroundColor3 = Color3.fromRGB(200, 50, 50)
    closeButton.TextColor3 = Color3.fromRGB(255, 255, 255)
    closeButton.Font = Enum.Font.SourceSansBold
    closeButton.Parent = titleBar

    closeButton.MouseButton1Click:Connect(function()
        Tween(frame, "Size", UDim2.new(0.3, 0, 0, 0), 0.3)
        wait(0.3)
        screenGui:Destroy()
    end)

    -- Minimize Button
    local minimizeButton = Instance.new("TextButton")
    minimizeButton.Text = "-"
    minimizeButton.Size = UDim2.new(0, 30, 1, 0)
    minimizeButton.Position = UDim2.new(1, -70, 0, 0)
    minimizeButton.BackgroundColor3 = Color3.fromRGB(50, 150, 200)
    minimizeButton.TextColor3 = Color3.fromRGB(255, 255, 255)
    minimizeButton.Font = Enum.Font.SourceSansBold
    minimizeButton.Parent = titleBar

    minimizeButton.MouseButton1Click:Connect(function()
        frame.Visible = not frame.Visible
    end)

    -- Tab Container
    local tabContainer = Instance.new("Frame")
    tabContainer.Size = UDim2.new(1, 0, 0.1, 0)
    tabContainer.Position = UDim2.new(0, 0, 0.1, 0)
    tabContainer.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
    tabContainer.Parent = frame

    local contentFrame = Instance.new("Frame")
    contentFrame.Size = UDim2.new(1, 0, 0.8, 0)
    contentFrame.Position = UDim2.new(0, 0, 0.2, 0)
    contentFrame.BackgroundTransparency = 1
    contentFrame.Parent = frame

    -- Function to add tabs
    function GPTLib:CreateTab(name)
        local tabButton = Instance.new("TextButton")
        tabButton.Text = name
        tabButton.Size = UDim2.new(0.3, -10, 1, 0)
        tabButton.Position = UDim2.new(#tabContainer:GetChildren() * 0.3, 5, 0, 0)
        tabButton.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
        tabButton.TextColor3 = Color3.fromRGB(255, 255, 255)
        tabButton.Parent = tabContainer

        local tabContent = Instance.new("Frame")
        tabContent.Size = UDim2.new(1, 0, 1, 0)
        tabContent.BackgroundTransparency = 1
        tabContent.Visible = false
        tabContent.Parent = contentFrame

        tabButton.MouseButton1Click:Connect(function()
            for _, child in pairs(contentFrame:GetChildren()) do
                child.Visible = false
            end
            tabContent.Visible = true
        end)

        return tabContent
    end

    MakeDraggable(frame, titleBar)

    return frame, GPTLib
end

return GPTLib
