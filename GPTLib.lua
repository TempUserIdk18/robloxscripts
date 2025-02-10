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
    local screenGui = Instance.new("ScreenGui")
    screenGui.Name = "GPTModernUI"
    screenGui.Parent = game.CoreGui

    local window = {} -- This table will hold our creation functions

    local frame = Instance.new("Frame")
    frame.Size = UDim2.new(0.35, 0, 0.45, 0)
    frame.Position = UDim2.new(0.325, 0, 0.275, 0)
    frame.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
    frame.BorderSizePixel = 0
    frame.Parent = screenGui

    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0, 12)
    corner.Parent = frame

    local titleBar = Instance.new("Frame")
    titleBar.Size = UDim2.new(1, 0, 0.1, 0)
    titleBar.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
    titleBar.Parent = frame

    local titleText = Instance.new("TextLabel")
    titleText.Text = title
    titleText.Size = UDim2.new(1, -80, 1, 0)
    titleText.TextXAlignment = Enum.TextXAlignment.Left
    titleText.TextColor3 = Color3.fromRGB(255, 255, 255)
    titleText.Font = Enum.Font.GothamBold
    titleText.BackgroundTransparency = 1
    titleText.Position = UDim2.new(0, 15, 0, 0)
    titleText.Parent = titleBar

    local closeButton = Instance.new("TextButton")
    closeButton.Text = "✖"
    closeButton.Size = UDim2.new(0, 30, 1, 0)
    closeButton.Position = UDim2.new(1, -40, 0, 0)
    closeButton.BackgroundColor3 = Color3.fromRGB(200, 50, 50)
    closeButton.TextColor3 = Color3.fromRGB(255, 255, 255)
    closeButton.Font = Enum.Font.GothamBold
    closeButton.Parent = titleBar

    closeButton.MouseButton1Click:Connect(function()
        Tween(frame, "Size", UDim2.new(0.35, 0, 0, 0), 0.3)
        wait(0.3)
        screenGui:Destroy()
    end)

    local minimizeButton = Instance.new("TextButton")
    minimizeButton.Text = "━"
    minimizeButton.Size = UDim2.new(0, 30, 1, 0)
    minimizeButton.Position = UDim2.new(1, -75, 0, 0)
    minimizeButton.BackgroundColor3 = Color3.fromRGB(50, 150, 200)
    minimizeButton.TextColor3 = Color3.fromRGB(255, 255, 255)
    minimizeButton.Font = Enum.Font.GothamBold
    minimizeButton.Parent = titleBar

    minimizeButton.MouseButton1Click:Connect(function()
        frame.Visible = not frame.Visible
    end)

    local contentFrame = Instance.new("Frame")
    contentFrame.Size = UDim2.new(1, 0, 0.9, 0)
    contentFrame.Position = UDim2.new(0, 0, 0.1, 0)
    contentFrame.BackgroundTransparency = 1
    contentFrame.Parent = frame

    -- Helper function to calculate Y position based on number of children
    local function getNextY()
        -- Assumes each element takes ~12% of the height (0.12)
        return #contentFrame:GetChildren() * 0.12
    end

    -- Create Button
    function window:CreateButton(text, callback)
        local button = Instance.new("TextButton")
        button.Size = UDim2.new(0.9, 0, 0.1, 0)
        button.Position = UDim2.new(0.05, 0, getNextY(), 0)
        button.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
        button.TextColor3 = Color3.fromRGB(255, 255, 255)
        button.Font = Enum.Font.GothamBold
        button.Text = text
        button.Parent = contentFrame
        button.MouseButton1Click:Connect(callback)
        return button
    end

    -- Create Toggle
    function window:CreateToggle(text, callback)
        local toggle = Instance.new("TextButton")
        toggle.Size = UDim2.new(0.9, 0, 0.1, 0)
        toggle.Position = UDim2.new(0.05, 0, getNextY(), 0)
        toggle.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
        toggle.TextColor3 = Color3.fromRGB(255, 255, 255)
        toggle.Font = Enum.Font.GothamBold
        toggle.Text = text .. " [OFF]"
        toggle.Parent = contentFrame
        local state = false

        toggle.MouseButton1Click:Connect(function()
            state = not state
            toggle.Text = text .. (state and " [ON]" or " [OFF]")
            callback(state)
        end)

        return toggle
    end

    -- Create Slider
    function window:CreateSlider(text, min, max, default, callback)
        local sliderFrame = Instance.new("Frame")
        sliderFrame.Size = UDim2.new(0.9, 0, 0.1, 0)
        sliderFrame.Position = UDim2.new(0.05, 0, getNextY(), 0)
        sliderFrame.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
        sliderFrame.Parent = contentFrame

        local label = Instance.new("TextLabel")
        label.Text = text .. ": " .. default
        label.Size = UDim2.new(1, 0, 0.5, 0)
        label.BackgroundTransparency = 1
        label.TextColor3 = Color3.new(1, 1, 1)
        label.Font = Enum.Font.GothamBold
        label.Parent = sliderFrame

        local sliderBar = Instance.new("Frame")
        sliderBar.Size = UDim2.new(0.9, 0, 0.3, 0)
        sliderBar.Position = UDim2.new(0.05, 0, 0.6, 0)
        sliderBar.BackgroundColor3 = Color3.fromRGB(70, 70, 70)
        sliderBar.Parent = sliderFrame

        local knob = Instance.new("Frame")
        knob.Size = UDim2.new(0, 10, 1, 0)
        local initialScale = (default - min) / (max - min)
        knob.Position = UDim2.new(initialScale * 0.9, 0, 0, 0)
        knob.BackgroundColor3 = Color3.fromRGB(100, 100, 100)
        knob.Parent = sliderBar

        local dragging = false
        knob.InputBegan:Connect(function(input)
            if input.UserInputType == Enum.UserInputType.MouseButton1 then
                dragging = true
            end
        end)
        UserInputService.InputChanged:Connect(function(input)
            if dragging and input.UserInputType == Enum.UserInputType.MouseMovement then
                local pos = input.Position.X - sliderBar.AbsolutePosition.X
                local scale = math.clamp(pos / sliderBar.AbsoluteSize.X, 0, 1)
                knob.Position = UDim2.new(scale * 0.9, 0, 0, 0)
                local value = min + scale * (max - min)
                label.Text = text .. ": " .. math.floor(value)
                callback(math.floor(value))
            end
        end)
        knob.InputEnded:Connect(function(input)
            if input.UserInputType == Enum.UserInputType.MouseButton1 then
                dragging = false
            end
        end)

        return sliderFrame
    end

    -- Create Dropdown
    function window:CreateDropdown(text, options, callback)
        local dropdownFrame = Instance.new("Frame")
        dropdownFrame.Size = UDim2.new(0.9, 0, 0.1, 0)
        dropdownFrame.Position = UDim2.new(0.05, 0, getNextY(), 0)
        dropdownFrame.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
        dropdownFrame.Parent = contentFrame

        local label = Instance.new("TextLabel")
        label.Text = text .. " ▼"
        label.Size = UDim2.new(1, 0, 1, 0)
        label.BackgroundTransparency = 1
        label.TextColor3 = Color3.new(1, 1, 1)
        label.Font = Enum.Font.GothamBold
        label.Parent = dropdownFrame

        local listFrame = Instance.new("Frame")
        listFrame.Size = UDim2.new(1, 0, 0, #options * 25)
        listFrame.Position = UDim2.new(0, 0, 1, 0)
        listFrame.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
        listFrame.Visible = false
        listFrame.Parent = dropdownFrame

        local function toggleList()
            listFrame.Visible = not listFrame.Visible
        end

        label.InputBegan:Connect(function(input)
            if input.UserInputType == Enum.UserInputType.MouseButton1 then
                toggleList()
            end
        end)

        for i, option in ipairs(options) do
            local optionButton = Instance.new("TextButton")
            optionButton.Size = UDim2.new(1, 0, 0, 25)
            optionButton.Position = UDim2.new(0, 0, 0, (i - 1) * 25)
            optionButton.Text = option
            optionButton.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
            optionButton.TextColor3 = Color3.new(1, 1, 1)
            optionButton.Font = Enum.Font.GothamBold
            optionButton.Parent = listFrame
            optionButton.MouseButton1Click:Connect(function()
                label.Text = text .. " " .. option .. " ▼"
                listFrame.Visible = false
                callback(option)
            end)
        end

        return dropdownFrame
    end

    -- Create ColorPicker
    function window:CreateColorPicker(text, defaultColor, callback)
        local cpFrame = Instance.new("Frame")
        cpFrame.Size = UDim2.new(0.9, 0, 0.1, 0)
        cpFrame.Position = UDim2.new(0.05, 0, getNextY(), 0)
        cpFrame.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
        cpFrame.Parent = contentFrame

        local label = Instance.new("TextLabel")
        label.Text = text .. " - " .. tostring(defaultColor)
        label.Size = UDim2.new(0.7, 0, 1, 0)
        label.BackgroundTransparency = 1
        label.TextColor3 = Color3.new(1, 1, 1)
        label.Font = Enum.Font.GothamBold
        label.Parent = cpFrame

        local colorButton = Instance.new("TextButton")
        colorButton.Size = UDim2.new(0.25, 0, 1, 0)
        colorButton.Position = UDim2.new(0.75, 0, 0, 0)
        colorButton.BackgroundColor3 = defaultColor
        colorButton.Text = ""
        colorButton.Parent = cpFrame

        colorButton.MouseButton1Click:Connect(function()
            -- For simplicity, toggle between two colors (red and blue)
            if colorButton.BackgroundColor3 == Color3.new(1, 0, 0) then
                colorButton.BackgroundColor3 = Color3.new(0, 0, 1)
            else
                colorButton.BackgroundColor3 = Color3.new(1, 0, 0)
            end
            callback(colorButton.BackgroundColor3)
        end)

        return cpFrame
    end

    -- Create Input Field
    function window:CreateInput(placeholder, callback)
        local inputFrame = Instance.new("Frame")
        inputFrame.Size = UDim2.new(0.9, 0, 0.1, 0)
        inputFrame.Position = UDim2.new(0.05, 0, getNextY(), 0)
        inputFrame.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
        inputFrame.Parent = contentFrame

        local textBox = Instance.new("TextBox")
        textBox.Size = UDim2.new(1, 0, 1, 0)
        textBox.PlaceholderText = placeholder
        textBox.TextColor3 = Color3.new(1, 1, 1)
        textBox.Font = Enum.Font.GothamBold
        textBox.BackgroundTransparency = 1
        textBox.Parent = inputFrame

        textBox.FocusLost:Connect(function(enterPressed)
            if enterPressed then
                callback(textBox.Text)
            end
        end)

        return inputFrame
    end

    -- Create Checkbox
    function window:CreateCheckbox(text, callback)
        local checkboxFrame = Instance.new("Frame")
        checkboxFrame.Size = UDim2.new(0.9, 0, 0.1, 0)
        checkboxFrame.Position = UDim2.new(0.05, 0, getNextY(), 0)
        checkboxFrame.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
        checkboxFrame.Parent = contentFrame

        local checkBox = Instance.new("TextButton")
        checkBox.Size = UDim2.new(0.2, 0, 1, 0)
        checkBox.Position = UDim2.new(0, 0, 0, 0)
        checkBox.BackgroundColor3 = Color3.fromRGB(70, 70, 70)
        checkBox.Text = ""
        checkBox.Parent = checkboxFrame

        local label = Instance.new("TextLabel")
        label.Size = UDim2.new(0.75, 0, 1, 0)
        label.Position = UDim2.new(0.25, 0, 0, 0)
        label.Text = text
        label.BackgroundTransparency = 1
        label.TextColor3 = Color3.new(1, 1, 1)
        label.Font = Enum.Font.GothamBold
        label.Parent = checkboxFrame

        local state = false
        checkBox.MouseButton1Click:Connect(function()
            state = not state
            if state then
                checkBox.BackgroundColor3 = Color3.fromRGB(100, 200, 100)
            else
                checkBox.BackgroundColor3 = Color3.fromRGB(70, 70, 70)
            end
            callback(state)
        end)

        return checkboxFrame
    end

    MakeDraggable(frame, titleBar)
    return window
end

return GPTLib
