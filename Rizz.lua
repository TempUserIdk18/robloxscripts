-- powered by Oreo Lib


local OreoLib = loadstring(game:HttpGet("https://raw.githubusercontent.com/TempUserIdk18/OreoLib/refs/heads/main/OreoLibSource.lua"))()

local Window = OreoLib:MakeWindow({
    Name = "Rizz UI",
    HidePremium = false,
    SaveConfig = true,
    ConfigFolder = "Rizzler",
    IntroEnabled = false
})
Window:SetTheme("Ocean")
local Tab = Window:MakeTab({
    Name = "Chat",
    Icon = "rbxassetid://4483345998",
    PremiumOnly = false
})

local messages = {
    "Are you a magician? Because every time I look at you, everyone else disappears. ",
    "Do you believe in love at first sight, or should I walk by again? ",
    "Are you WiFi? ‘Cause I’m really feeling a connection. ",
    "Are you a keyboard? ‘Cause you’re just my type. ",
    "If beauty were time, you’d be an eternity. ",
    "Are you a campfire? Because you’re hot and I want s’more. ",
    "Do you like Star Wars? Because Yoda one for me. ",
    "Are you Google? Because you’ve got everything I’m searching for. ",
    "Are you a parking ticket? ‘Cause you’ve got ‘fine’ written all over you. ",
    "Are you gravity? Because you’ve got me falling for you. ",
    "Are you French? Because Eiffel for you. ",
    "Are you an electrician? Because you’re lighting up my life. ",
    "If we were at a restaurant, you’d be the main course. ",
    "Are you made of copper and tellurium? Because you’re Cu-Te. ",
    "Are you a bank loan? Because you have my interest. ",
    "If I could rearrange the alphabet, I’d put U and I together. ",
    "You must be tired, because you’ve been running through my mind all day. ",
    "Do you have a name, or can I call you mine? ",
    "Are you a time traveler? Because I see you in my future. ",
    "Are you a snowstorm? Because you’ve just made my heart freeze. ",
    "Do you believe in fate? Because I think we were meant to meet. ",
    "Are you an angel? Because heaven is missing one. ",
    "If you were a vegetable, you’d be a cute-cumber. ",
    "Can I follow you home? Because my parents always told me to follow my dreams. "
}

local TextChatService = game:GetService("TextChatService")
local Players = game:GetService("Players")
local channel = TextChatService.TextChannels:WaitForChild("RBXGeneral")

-- Create a textbox to enter the target player's name.
Tab:AddTextbox({
    Name = "Enter Player UserName",
    Default = "",
    TextDisappear = false,
    Callback = function(value)
        _G.SelectedPlayer = value
    end
})

if not channel then
    OreoLib:MakeNotification({
        Name = "Error",
        Content = "Chat channel not found!",
        Image = "rbxassetid://4483345998",
        Time = 5
    })
else
    for _, msg in ipairs(messages) do
        Tab:AddButton({
            Name = msg,
            Callback = function()
                if _G.SelectedPlayer and _G.SelectedPlayer ~= "" then
                    local foundPlayer = nil
                    for _, player in ipairs(Players:GetPlayers()) do
                        if string.lower(player.Name) == string.lower(_G.SelectedPlayer) or 
                           string.lower(player.DisplayName) == string.lower(_G.SelectedPlayer) then
                            foundPlayer = player
                            break
                        end
                    end

                    if foundPlayer then
                        local formattedMsg = string.format("%s, %s", foundPlayer.DisplayName, msg)
                        channel:SendAsync(formattedMsg)
                    else
                        OreoLib:MakeNotification({
                            Name = "Error",
                            Content = "Player not found in the server!",
                            Image = "rbxassetid://4483345998",
                            Time = 5
                        })
                    end
                else
                    warn("No player selected!")
                end
            end
        })
    end
end
Tab:AddButton({
    Name = "Destroy UI",
    Callback = function()
        OreoLib:Destroy()
    end    
})

OreoLib:Init()
