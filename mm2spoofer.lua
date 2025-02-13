local OreoLib = loadstring(game:HttpGet("https://raw.githubusercontent.com/TempUserIdk18/OreoLib/refs/heads/main/OreoLibSource.lua"))()

local Window = OreoLib:MakeWindow({
    Name = "Murder Mystery ROLE SPOOFER",
    HidePremium = false,
    SaveConfig = false,
    ConfigFolder = "mm2spoof",
    IntroEnabled = false,
    Icon = "rbxassetid://4483345998"
})
local Tab = Window:MakeTab({
    Name = "Main",
    Icon = "rbxassetid://4483345998",
    PremiumOnly = false
})
Window:SetTheme("Ocean")
local Tab2 = Window:MakeTab({
    Name = "Info",
    Icon = "rbxassetid://4483345998",
    PremiumOnly = false
})
Tab2:AddLabel("spoofs when round starts")
Tab2:AddLabel("btw it works with MM2 copies!!!")


local MurdererLabel = Tab:AddLabel("murderer: None")
local GunHolderLabel = Tab:AddLabel("sheriff: None")

local function getPlayersWithItem(itemName)
    local playersWithItem = {}
    
    for _, player in pairs(game:GetService("Players"):GetPlayers()) do
        if player.Backpack then
            for _, item in pairs(player.Backpack:GetChildren()) do
                if item.Name == itemName then
                    table.insert(playersWithItem, player.Name)
                end
            end
        end
        if player.Character then
            for _, item in pairs(player.Character:GetChildren()) do
                if item:IsA("Tool") and item.Name == itemName then
                    table.insert(playersWithItem, player.Name)
                end
            end
        end
    end
    
    return playersWithItem
end

local function updateLabels()
    local murderers = getPlayersWithItem("Knife")
    local gunHolders = getPlayersWithItem("Gun")
    
    MurdererLabel:Set("murderer: " .. (#murderers > 0 and table.concat(murderers, ", ") or "None"))
    GunHolderLabel:Set("sheriff: " .. (#gunHolders > 0 and table.concat(gunHolders, ", ") or "None"))
end



Tab:AddButton({
    Name = "send info in chat",
    Callback = function()
        local murderers = getPlayersWithItem("Knife")
        local gunHolders = getPlayersWithItem("Gun")
        local murdererText = "murderer: " .. (#murderers > 0 and table.concat(murderers, ", ") or "None")
        local sheriffText = "sheriff: " .. (#gunHolders > 0 and table.concat(gunHolders, ", ") or "None")
        game:GetService("TextChatService").TextChannels.RBXGeneral:SendAsync(murdererText)
        wait(0.2)
        game:GetService("TextChatService").TextChannels.RBXGeneral:SendAsync(sheriffText)
    end    
})
Tab:AddButton({
    Name = "destroy UI",
    Callback = function()
        OreoLib:Destroy()
    end    
})


while true do
    updateLabels()
    wait(1)
end
