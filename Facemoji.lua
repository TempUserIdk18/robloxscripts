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
Notify:Create("welcome to facemoji", "press v to toggle facemoji ui", "ok")
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
UserInputService.InputBegan:Connect(function(input, isTyping)
    if input.KeyCode == Enum.KeyCode.V and not isTyping then
        if frame.Visible and not textBox:IsFocused() then
            frame.Visible = false
        else
            frame.Visible = true
            textBox.Text = ""
            task.wait(0.05)
            textBox:CaptureFocus()
        end
    end
end)
textBox.FocusLost:Connect(function(enterPressed)
    if enterPressed and textBox.Text ~= "" then
        sendVaporwaveMessage(textBox.Text)
        textBox.Text = ""
        frame.Visible = false
    end
end)
