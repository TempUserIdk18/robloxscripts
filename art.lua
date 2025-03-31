local ReplicatedStorage = game:GetService("ReplicatedStorage")
local SayMessageRequest = game:GetService("TextChatService").TextChannels.RBXGeneral
if SayMessageRequest then

local okPressed = false
local cancelPressed = false

-- Create main GUI with modern styling
local gui = Instance.new("ScreenGui")
gui.Name = "PixelArtCreator"
gui.ResetOnSpawn = false
gui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")

-- Main frame with modern styling
local frame = Instance.new("Frame")
frame.Name = "MainFrame"
frame.Size = UDim2.new(0, 300, 0, 400)
frame.Position = UDim2.new(0.5, -150, 0.5, -200)
frame.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
frame.BackgroundTransparency = 0.1
frame.BorderSizePixel = 0
frame.ClipsDescendants = true
frame.Parent = gui

-- Add rounded corners
local corner = Instance.new("UICorner")
corner.CornerRadius = UDim.new(0, 8)
corner.Parent = frame



-- Title bar
local titleBar = Instance.new("Frame")
titleBar.Name = "TitleBar"
titleBar.Size = UDim2.new(1, 0, 0, 30)
titleBar.Position = UDim2.new(0, 0, 0, 0)
titleBar.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
titleBar.BorderSizePixel = 0
titleBar.Parent = frame
corner:Clone().Parent = titleBar


-- Title text
local title = Instance.new("TextLabel")
title.Name = "Title"
title.Size = UDim2.new(1, -60, 1, 0)
title.Position = UDim2.new(0, 10, 0, 0)
title.BackgroundTransparency = 1
title.Text = "Art Creator v0.1 "
title.TextColor3 = Color3.fromRGB(255, 255, 255)
title.TextXAlignment = Enum.TextXAlignment.Left
title.Font = Enum.Font.GothamSemibold
title.TextSize = 14
title.Parent = titleBar

-- Close button
local closeButton = Instance.new("TextButton")
closeButton.Name = "CloseButton"
closeButton.Size = UDim2.new(0, 30, 0, 30)
closeButton.Position = UDim2.new(1, -30, 0, 0)
closeButton.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
closeButton.BorderSizePixel = 0
closeButton.Text = "×"
closeButton.TextColor3 = Color3.fromRGB(255, 255, 255)
closeButton.TextSize = 18
closeButton.Font = Enum.Font.GothamBold
closeButton.Parent = titleBar
corner:Clone().Parent = closeButton
-- Close button hover effect
closeButton.MouseEnter:Connect(function()
    closeButton.BackgroundColor3 = Color3.fromRGB(255, 60, 60)
end)

closeButton.MouseLeave:Connect(function()
    closeButton.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
end)

closeButton.MouseButton1Click:Connect(function()
    gui:Destroy()
end)

-- Make frame draggable
local dragging
local dragInput
local dragStart
local startPos

local function update(input)
    local delta = input.Position - dragStart
    frame.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
end

titleBar.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
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
    if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
        dragInput = input
    end
end)

game:GetService("UserInputService").InputChanged:Connect(function(input)
    if input == dragInput and dragging then
        update(input)
    end
end)

-- Content frame
local contentFrame = Instance.new("Frame")
contentFrame.Name = "Content"
contentFrame.Size = UDim2.new(1, -20, 1, -120)
contentFrame.Position = UDim2.new(0, 10, 0, 40)
contentFrame.BackgroundTransparency = 1
contentFrame.Parent = frame

-- Create pixel grid
local squareSize = 30
local squares = {}
local gridFrame = Instance.new("Frame")
gridFrame.Name = "Grid"
gridFrame.Size = UDim2.new(0, squareSize * 8, 0, squareSize * 8)
gridFrame.Position = UDim2.new(0.5, -squareSize * 3.5, 0, 10)

gridFrame.BackgroundTransparency = 1
gridFrame.Parent = contentFrame

for i = 1, 7 do
    squares[i] = {}
    for j = 1, 7 do
        local square = Instance.new("TextButton")
        square.Name = "Pixel_"..i.."_"..j
        square.Size = UDim2.new(0, squareSize - 2, 0, squareSize - 2)
        square.Position = UDim2.new(0, (j - 1) * squareSize + 1, 0, (i - 1) * squareSize + 1)
        square.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        square.BorderSizePixel = 0
        square.Text = ""
        square.Parent = gridFrame
        
        -- Add rounded corners to pixels
        local pixelCorner = Instance.new("UICorner")
        pixelCorner.CornerRadius = UDim.new(0, 4)
        pixelCorner.Parent = square
        
        square.MouseButton1Down:Connect(function()
            if square.BackgroundColor3 == Color3.fromRGB(255, 255, 255) then
                square.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
            else
                square.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            end
        end)
        
        squares[i][j] = square
    end
end

-- Button container
local buttonContainer = Instance.new("Frame")
buttonContainer.Name = "Buttons"
buttonContainer.Size = UDim2.new(1, -20, 0, 70)
buttonContainer.Position = UDim2.new(0, 10, 1, -80)
buttonContainer.BackgroundTransparency = 1
buttonContainer.Parent = frame

-- Function to create modern buttons
local function createButton(name, text, positionY, parent)
    local button = Instance.new("TextButton")
    button.Name = name
    button.Size = UDim2.new(1, 0, 0, 30)
    button.Position = UDim2.new(0, 0, 0, positionY)
    button.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
    button.BorderSizePixel = 0
    button.TextColor3 = Color3.fromRGB(255, 255, 255)
    button.Text = text
    button.Font = Enum.Font.Gotham
    button.TextSize = 14
    button.Parent = parent
    
    local buttonCorner = Instance.new("UICorner")
    buttonCorner.CornerRadius = UDim.new(0, 6)
    buttonCorner.Parent = button
    
    -- Hover effects
    button.MouseEnter:Connect(function()
        button.BackgroundColor3 = Color3.fromRGB(80, 80, 80)
    end)
    
    button.MouseLeave:Connect(function()
        button.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
    end)
    
    return button
end

-- Create buttons
local printButton = createButton("PrintButton", "Send Art", 35, buttonContainer)
local filereadButton = createButton("ImportButton", "Import from File", 35, buttonContainer)
local filewriteButton = createButton("ExportButton", "Export to File", 70, buttonContainer)
filewriteButton.Visible = false
filereadButton.Visible = false
-- Create dialog elements (hidden by default)
local dialogFrame = Instance.new("Frame")
dialogFrame.Name = "Dialog"
dialogFrame.Size = UDim2.new(1, -40, 0, 100)
dialogFrame.Position = UDim2.new(0, 20, 0.5, -50)
dialogFrame.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
dialogFrame.BorderSizePixel = 0
dialogFrame.Visible = false
dialogFrame.Parent = frame

local dialogCorner = Instance.new("UICorner")
dialogCorner.CornerRadius = UDim.new(0, 8)
dialogCorner.Parent = dialogFrame

local textBox = Instance.new("TextBox")
textBox.Name = "FileNameInput"
textBox.Size = UDim2.new(1, -20, 0, 30)
textBox.Position = UDim2.new(0, 10, 0, 10)
textBox.BackgroundColor3 = Color3.fromRGB(70, 70, 70)
textBox.BorderSizePixel = 0
textBox.TextColor3 = Color3.fromRGB(255, 255, 255)
textBox.PlaceholderText = "Enter file name"
textBox.Text = ""
textBox.ClearTextOnFocus = false
textBox.Font = Enum.Font.Gotham
textBox.TextSize = 14
textBox.Parent = dialogFrame

local textBoxCorner = Instance.new("UICorner")
textBoxCorner.CornerRadius = UDim.new(0, 4)
textBoxCorner.Parent = textBox

local okButton = createButton("OKButton", "OK", 50, dialogFrame)
okButton.Size = UDim2.new(0.45, 0, 0, 30)
okButton.Position = UDim2.new(0, 10, 0, 50)

local cancelButton = createButton("CancelButton", "Cancel", 50, dialogFrame)
cancelButton.Size = UDim2.new(0.45, 0, 0, 30)
cancelButton.Position = UDim2.new(0.55, 0, 0, 50)

okButton.MouseButton1Down:Connect(function()
    okPressed = true
end)

cancelButton.MouseButton1Down:Connect(function()
    cancelPressed = true
end)

-- Button functions
printButton.MouseButton1Down:Connect(function()
    for i = 1, 7 do
        local row = ""
        for j = 1, 7 do
            if squares[i][j].BackgroundColor3 == Color3.fromRGB(255, 255, 255) then
                row = row .. "⬜"
            else
                row = row .. "⬛"
            end
        end
        game:GetService("TextChatService").TextChannels.RBXGeneral:SendAsync(row)
        task.wait(0.08)
    end
end)

local function showDialog()
    dialogFrame.Visible = true
    printButton.Visible = false
    filereadButton.Visible = false
    filewriteButton.Visible = false
end

local function hideDialog()
    dialogFrame.Visible = false
    printButton.Visible = true
    filereadButton.Visible = true
    filewriteButton.Visible = true
end

filereadButton.MouseButton1Down:Connect(function()
    textBox.PlaceholderText = "Enter file name to import"
    textBox.Text = ""
    showDialog()
    
    while true do
        okPressed = false
        cancelPressed = false
        
        while okPressed == false and cancelPressed == false do
            wait()
        end
        
        if cancelPressed then
            cancelPressed = false
            hideDialog()
            break
        end
        
        if okPressed then
            local file
            local fileName
            local name = textBox.Text
            if name:sub(-3) == '.cd' then
                pcall(function() file = readfile(name) end)
                fileName = name
            else
                pcall(function() file = readfile(name..'.cd') end)
                fileName = name..'.cd'
            end
            
            if file then
                if string.len(file) ~= 64 then
                    textBox.Text = 'Invalid file format'
                else
                    local err = false
                    for i = 1, 64 do
                        local char = string.sub(file, i, i)
                        if char ~= "0" and char ~= "1" then
                            textBox.Text = 'Invalid file format'
                            err = true
                            break
                        end
                    end
                    
                    if not err then
                        local index = 1
                        for i = 1, 7 do
                            for j = 1, 7 do
                                if string.sub(file, index, index) == '0' then
                                    squares[i][j].BackgroundColor3 = Color3.fromRGB(0, 0, 0)
                                else
                                    squares[i][j].BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                                end
                                index = index + 1
                            end
                        end
                        hideDialog()
                        break
                    end
                end
            else
                textBox.Text = 'File not found: "'..fileName..'"'
            end
        end
    end
end)

filewriteButton.MouseButton1Down:Connect(function()
    textBox.PlaceholderText = "Enter file name to export"
    textBox.Text = ""
    showDialog()
    
    while true do
        okPressed = false
        cancelPressed = false
        
        while okPressed == false and cancelPressed == false do
            wait()
        end
        
        if cancelPressed then
            cancelPressed = false
            hideDialog()
            break
        end
        
        if okPressed then
            local data = ''
            local fileName
            local name = textBox.Text
            
            for i = 1, 7 do
                for j = 1, 7 do
                    if squares[i][j].BackgroundColor3 == Color3.fromRGB(0, 0, 0) then
                        data = data..'0'
                    else
                        data = data..'1'
                    end
                end
            end
            
            if name:sub(-3) == '.cd' then
                fileName = name
            else
                fileName = name..'.cd'
            end
            
            writefile(fileName, data)
            hideDialog()
            break
        end
    end
end)

else
    print("Oops, chat isn't working classic or normally")
end
