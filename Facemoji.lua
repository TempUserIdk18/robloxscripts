local Players = game:GetService("Players")
local ChatService = game:GetService("TextChatService")
local UserInputService = game:GetService("UserInputService")
local player = Players.LocalPlayer

local screenGui = Instance.new("ScreenGui")
screenGui.Name = "VaporwaveGui"
screenGui.Parent = game.CoreGui

local Notify = loadstring(game:HttpGet("https://raw.githubusercontent.com/TempUserIdk18/robloxscripts/refs/heads/main/RobloxNotify.lua"))()

local frame = Instance.new("Frame")
frame.Size = UDim2.new(0.3, 0, 0.15, 0)
frame.Position = UDim2.new(0.35, 0, 0.4, 0)
frame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
frame.BorderSizePixel = 0
frame.Visible = false
frame.Parent = screenGui

local textBox = Instance.new("TextBox")
textBox.Size = UDim2.new(0.9, 0, 0.5, 0)
textBox.Position = UDim2.new(0.05, 0, 0.25, 0)
textBox.PlaceholderText = "Type your message..."
textBox.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
textBox.TextColor3 = Color3.fromRGB(255, 255, 255)
textBox.ClearTextOnFocus = false
textBox.Parent = frame

local sendButton = Instance.new("TextButton")
sendButton.Size = UDim2.new(0.9, 0, 0.2, 0)
sendButton.Position = UDim2.new(0.05, 0, 0.75, 0)
sendButton.BackgroundColor3 = Color3.fromRGB(70, 70, 70)
sendButton.Text = "Send"
sendButton.TextColor3 = Color3.fromRGB(255, 255, 255)
sendButton.Parent = frame

if UserInputService.TouchEnabled then
    local toggleButton = Instance.new("TextButton")
    toggleButton.Size = UDim2.new(0.15, 0, 0.05, 0)
    toggleButton.Position = UDim2.new(0.025, 0, 0.9, 0)
    toggleButton.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
    toggleButton.Text = "Chat"
    toggleButton.TextColor3 = Color3.fromRGB(255, 255, 255)
    toggleButton.Parent = screenGui

    toggleButton.MouseButton1Click:Connect(function()
        frame.Visible = not frame.Visible
        if frame.Visible then
            textBox:CaptureFocus()
        end
    end)
else
    UserInputService.InputBegan:Connect(function(input, isTyping)
        if input.KeyCode == Enum.KeyCode.V and not isTyping then
            frame.Visible = not frame.Visible
            if frame.Visible then
                textBox:CaptureFocus()
                task.wait(0.015)
                textBox.Text = ""
            end
        end
    end)
end

local function toVaporwave(text)
    local vaporwaveText = ""
    for i = 1, #text do
        local char = text:sub(i, i)
        local charCode = char:byte()
        if charCode >= 33 and charCode <= 126 then
            vaporwaveText = vaporwaveText .. utf8.char(charCode + 65248)
        else
            vaporwaveText = vaporwaveText .. char
        end
    end
    return vaporwaveText
end

Notify:Create("Welcome to Facemoji", "Press V or tap Chat to toggle the UI", "OK")

local function sendVaporwaveMessage(message)
    local vaporwaveMessage = toVaporwave(message)
    local generalChannel = ChatService.TextChannels.RBXGeneral
    if generalChannel then
        local success, err = pcall(function()
            generalChannel:SendAsync(vaporwaveMessage)
        end)
        if not success then
            warn("Failed to send facemoji message: " .. err)
        end
    else
        warn("RBXGeneral channel not found")
    end
end

sendButton.MouseButton1Click:Connect(function()
    if textBox.Text ~= "" then
        sendVaporwaveMessage(textBox.Text)
        textBox.Text = ""
        frame.Visible = false
    end
end)

textBox.FocusLost:Connect(function(enterPressed)
    if enterPressed and textBox.Text ~= "" then
        sendVaporwaveMessage(textBox.Text)
        textBox.Text = ""
        frame.Visible = false
    end
end)
