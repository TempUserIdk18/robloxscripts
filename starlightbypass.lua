local f = "ล บ ἰ รุ ϙ ทุ"
local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()
local Window = Rayfield:CreateWindow({
   Name = "Starlight Chat Bypasser",
   Icon = "star", -- Icon in Topbar. Can use Lucide Icons (string) or Roblox Image (number). 0 to use no icon (default).
   LoadingTitle = "Starlight Chat Bypasser",
   LoadingSubtitle = "Loading..",
   Theme = "Amethyst", -- Check https://docs.sirius.menu/rayfield/configuration/themes

   DisableRayfieldPrompts = false,
   DisableBuildWarnings = false, -- Prevents Rayfield from warning when the script has a version mismatch with the interface

   ConfigurationSaving = {
      Enabled = true,
      FolderName = nil, -- Create a custom folder for your hub/game
      FileName = "StarlightBypasser"
   },

   Discord = {
      Enabled = false, -- Prompt the user to join your Discord server if their executor supports it
      Invite = "noinvitelink", -- The Discord invite code, do not include discord.gg/. E.g. discord.gg/ ABCD would be ABCD
      RememberJoins = true -- Set this to false to make them join the discord every time they load it up
   },

   KeySystem = false, -- Set this to true to use our key system
   KeySettings = {
      Title = "Untitled",
      Subtitle = "Key System",
      Note = "No method of obtaining the key is provided", -- Use this to tell the user how to get a key
      FileName = "Key", -- It is recommended to use something unique as other scripts using Rayfield may overwrite your key file
      SaveKey = true, -- The user's key will be saved, but if you change the key, they will be unable to use your script
      GrabKeyFromSite = false, -- If this is true, set Key below to the RAW site you would like Rayfield to get the key from
      Key = {"Hello"} -- List of keys that will be accepted by the system, can be RAW file links (pastebin, github etc) or simple strings ("hello","key22")
   }
})
local Tab = Window:CreateTab("Main", "cloud")


local enabled = false

local charreplacement = {
    ["nigger"] = "ทุigger",
    ["nigga"] = "ทุigga",
    ["bypasser"] = "bypลรุรุer",
    ["cum"] = "cบm",
	["sex"] = "รุeх",
	["https"] = "httpรุ",
	["faggot"] = "fลggϙt",
	["penis"] = "peทุἰs",
	["fuck"] = "fบck",
	["black"] = "blลck",
	["monkey"] = "mϙทุkey",
	["shit"] = "รุhἰt",
	["whore"] = "whϙre",
	["vagina"] = "vลgἰnล",
	["fack"] = "fลck",
	["ass"] = "ลรุรุ",
	["discord"] = "diรุcϙrd",
	["gta"] = "gtล",
	["xbox"] = "xbϙx",
	["rape"] = "rลpe",
	["spit"] = "รุpἰt",
	["line"] = "lἰne",
	["n"] = "ทุ"
}

local function replacewords(text)

    local BypassedNEW = text
    -- Replace each word in the replacement table
    for oldchar, newChar in pairs(charreplacement) do
        BypassedNEW = BypassedNEW:gsub(oldchar, newChar) .. "   "
    end
    return BypassedNEW
end

local function sendmsg(msg)
    local channel = game:GetService("TextChatService").ChatInputBarConfiguration 
                    and game:GetService("TextChatService").ChatInputBarConfiguration.TargetTextChannel
    if channel then
        -- If TextChatService is available, use it
        channel:SendAsync(msg) 
    else
        -- Otherwise, fallback to the legacy chat system
        game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer(msg, "All") 
    end
end
-- Access TextChatService
local TextChatService = game:GetService("TextChatService")
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local ChatService = game:GetService("TextService")
-- Function to handle outgoing messages
local sendingMessageEnabled = true  -- Flag to control event triggering


local Section = Tab:CreateSection("Note")
local label = Tab:CreateLabel("Set your roblox language to Slovenski for the bypasser to work!")


--[[local Section2 = Tab:CreateSection("Auto Bypass")
Tab:CreateToggle({
    Name = "Enable Auto Chat Bypass (soon)",
    CurrentValue = false,
    Callback = function(value)
        -- do nothing
    end
})]]

local Section3 = Tab:CreateSection("Bypass")
local bps = ""
local Input = Tab:CreateInput({
   Name = "Bypass Input",
   CurrentValue = "",
   PlaceholderText = "Enter your message here...",
   RemoveTextAfterFocusLost = false,
   Flag = "Input1",
   Callback = function(Text)
      bps = Text
   end,
})
local Button = Tab:CreateButton({
   Name = "Send Message",
   Callback = function()
      if bps == nil or bps == "" or bps == " " then return end
	  local result = replacewords(bps)
	  sendmsg(result)
   end,
})
local Section4 = Tab:CreateSection("Clear Chat")
local Button2 = Tab:CreateButton({
   Name = "Clear Chat",
   Callback = function()
      sendmsg("/clear")
   end,
})
Tab:CreateLabel("Might also fix tagging. Not 100%.")



local LogTab = Window:CreateTab("Chat History", "message-square")
local PresetsTab = Window:CreateTab("Presets", "clipboard")
local ChatScrollFrame = LogTab:CreateSection("Chat History")

-- Table to Store Messages
local chatMessages = {}

-- Function to Add Messages to the Scroll Frame
local function addMessage(username, message)
    local formattedMessage = "[" .. username .. "]: " .. message

    -- Add to Chat History
    table.insert(chatMessages, formattedMessage)

    -- Create a new label for the message
    LogTab:CreateLabel(formattedMessage)

    -- Auto-scroll effect (limiting to 50 messages for performance)
    if #chatMessages > 50 then
        table.remove(chatMessages, 1)
        LogTab:ClearElements() -- Remove old messages
        for _, msg in ipairs(chatMessages) do
            LogTab:CreateLabel(msg) -- Reload messages
        end
    end
end
TextChatService.SendingMessage:Connect(function(message)
    return
end)
-- Function to Listen for Player Chats
local function trackPlayerChats(player)
    player.Chatted:Connect(function(msg)
        addMessage(player.Name, msg)
    end)
end

-- Track Current Players
for _, player in pairs(game.Players:GetPlayers()) do
    trackPlayerChats(player)
end

-- Track New Players Joining
game.Players.PlayerAdded:Connect(function(player)
    trackPlayerChats(player)
end)
local presetButtons = {
    "my grandmas wifi is better than your shit",
    "L nigger",
    "L get fucked up",
    "thats fucking shit",
}
local Section5 = PresetsTab:CreateSection("Presets (i bet everything tags)")
for _, buttonName in pairs(presetButtons) do
    PresetsTab:CreateButton({
        Name = buttonName,
        Callback = function()
		    local result = replacewords(buttonName)
            sendmsg(result)
        end
    })
end
local Taber = Window:CreateTab("Info", "info")
Taber:CreateSection("Info")
Taber:CreateLabel("Starlight Chat Bypasser was just released, so of course many words are getting tagged. The bypasser will be improved!")
