-- Services
local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Events = ReplicatedStorage:WaitForChild("Events")
local OnDoorHit = Events:WaitForChild("OnDoorHit")

-- Player and Mouse
local player = Players.LocalPlayer
local mouse = player:GetMouse()

-- Function Definitions
local function GiveItem(Item)
    if Item == "Armor" then
        Events:WaitForChild("Vending"):FireServer(3, "Armor2", "Armor", tostring(player), 1)
    elseif Item == "Crowbar 1" or Item == "Crowbar 2" or Item == "Bat" or Item == "Pitchfork" or Item == "Hammer" or Item == "Wrench" or Item == "Broom" then
        Events.Vending:FireServer(3, tostring(Item:gsub(" ", "")), "Weapons", player.Name, 1)
    else
        Events:WaitForChild("GiveTool"):FireServer(tostring(Item:gsub(" ", "")))
    end
end

local function UnequipAllTools()
    for i, v in pairs(player.Character:GetChildren()) do
        if v:IsA("Tool") then
            v.Parent = player.Backpack
        end
    end
end

local function EquipAllTools()
    for i, v in pairs(player.Backpack:GetChildren()) do
        if v:IsA("Tool") then
            v.Parent = player.Character
        end
    end
end

local function GetBestTool()
    for i, v in pairs(player.PlayerGui.Assets.Note.Note.Note:GetChildren()) do
        if v.Name:match("Circle") and v.Visible == true then
            GiveItem(tostring(v.Name:gsub("Circle", "")))
        end
    end
end

local function Train(Ability)
    Events:WaitForChild("RainbowWhatStat"):FireServer(Ability)
end

local function HealAllPlayers()
    UnequipAllTools()
    task.wait(.2)
    GiveItem("Golden Apple")
    task.wait(.5)
    player.Backpack:WaitForChild("GoldenApple").Parent = player.Character
    task.wait(.5)
    Events:WaitForChild("HealTheNoobs"):FireServer()
end

local function HealYourself()
    GiveItem("Pizza")
    Events.Energy:FireServer(25, "Pizza")
end

local function BreakEnemies()
    pcall(function()
        for i, v in pairs(game:GetService("Workspace").BadGuys:GetChildren()) do
            v:FindFirstChild("Humanoid", true).Health = 0
        end
        for i, v in pairs(game:GetService("Workspace").BadGuysBoss:GetChildren()) do
            v:FindFirstChild("Humanoid", true).Health = 0
        end
        for i, v in pairs(game:GetService("Workspace").BadGuysFront:GetChildren()) do
            v:FindFirstChild("Humanoid", true).Health = 0
        end
    end)
end

local function AntiWind()
    if game:GetService("Workspace"):FindFirstChild("WavePart") then
        game:GetService("Workspace").WavePart.CanTouch = false
    end
end

local function AntiMud()
    for i, v in pairs(game:GetService("Workspace").BogArea.Bog:GetDescendants()) do
        if v.Name == "Mud" and v:IsA("Part") then
            v.CanTouch = false
        end
    end
end

local function TeleportTo(CFrameArg)
    player.Character.HumanoidRootPart.CFrame = CFrameArg
end

local function TakeDamange(Amount)
    if SemiGodmode == true then
        Amount = 0
    end
    Events:WaitForChild("Energy"):FireServer(-Amount, false, false)
end

local function Delete(part)
    pcall(function()
        OnDoorHit:FireServer(part)
    end)
end
local function GetDog()
    for i, v in pairs(player.PlayerGui.Assets.Note.Note.Note:GetChildren()) do
        if v.Name:match("Circle") and v.Visible == true then
            GiveItem(tostring(v.Name:gsub("Circle", "")))
            task.wait(.1)
            player.Backpack:WaitForChild(tostring(v.Name:gsub("Circle", ""))).Parent = player.Character
            TeleportTo(CFrame.new(-257.56839, 29.4499969, -910.452637, -0.238445505, 7.71292363e-09, 0.971155882, 1.2913591e-10, 1, -7.91029819e-09, -0.971155882, -1.76076387e-09, -0.238445505))
            task.wait(.5)
            Events:WaitForChild("CatFed"):FireServer(tostring(v.Name:gsub("Circle", "")))
        end
    end
    task.wait(2)
    for i = 1, 3 do
        TeleportTo(CFrame.new(-203.533081, 30.4500484, -790.901428, -0.0148558766, 8.85941187e-09, -0.999889672, 2.65695732e-08, 1, 8.46563175e-09, 0.999889672, -2.64408779e-08, -0.0148558766) + Vector3.new(0, 5, 0))
        task.wait(.1)
    end
end

local function GetAgent()
    GiveItem("Louise")
    task.wait(.1)
    player.Backpack:WaitForChild("Louise").Parent = player.Character
    Events:WaitForChild("LouiseGive"):FireServer(2)
end

local function GetUncle()
    GiveItem("Key")
    task.wait(.1)
    player.Backpack:WaitForChild("Key").Parent = player.Character
    wait(.5)
    Events.KeyEvent:FireServer()
end

local function ClickPete()
    fireclickdetector(game:GetService("Workspace").UnclePete.ClickDetector)
end

local function CollectCash()
    for i, v in pairs(game:GetService("Workspace"):GetChildren()) do
        if v.Name == "Part" and v:FindFirstChild("TouchInterest") and v:FindFirstChild("Weld") and v.Transparency == 1 then
            firetouchinterest(v, player.Character.HumanoidRootPart, 0)
        end
    end
end

local function KillEnemies()
    pcall(function()
        for i, v in pairs(game:GetService("Workspace").BadGuys:GetChildren()) do
            Events:WaitForChild("HitBadguy"):FireServer(v, 64.8, 4)
        end
        for i, v in pairs(game:GetService("Workspace").BadGuysBoss:GetChildren()) do
            Events:WaitForChild("HitBadguy"):FireServer(v, 64.8, 4)
        end
        for i, v in pairs(game:GetService("Workspace").BadGuysFront:GetChildren()) do
            Events:WaitForChild("HitBadguy"):FireServer(v, 64.8, 4)
        end
        if game:GetService("Workspace"):FindFirstChild("BadGuyPizza", true) then
            Events:WaitForChild("HitBadguy"):FireServer(game:GetService("Workspace"):FindFirstChild("BadGuyPizza", true), 64.8, 4)
        end
        if game:GetService("Workspace"):FindFirstChild("BadGuyBrute") then
            Events:WaitForChild("HitBadguy"):FireServer(game:GetService("Workspace").BadGuyBrute, 64.8, 4)
        end
    end)
end

local function GiveAll()
    GetBestTool()
    task.wait(.1)
    GiveItem("Armor")
    task.wait(.1)
    for i = 1, 5 do
        Train("Speed")
        Train("Strength")
    end
    task.wait(.1)
    UnequipAllTools()
    for i = 1, 15 do
        GiveItem("Gold Pizza")
        task.wait(0.05)
    end
end


-- Rayfield GUI Setup
local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()
local Window = Rayfield:CreateWindow({
    Name = "starlight | Break In 2",
    LoadingTitle = "starlight | Break In 2",
    LoadingSubtitle = "break in 2 sucks",
	Icon = "star",
	Theme = "Ocean",
    ConfigurationSaving = {
        Enabled = false,
        FolderName = nil,
        FileName = "BreakinConfig"
    },
    Discord = {
        Enabled = false,
        Invite = "",
        RememberJoins = true
    },
    KeySystem = false
})

-- Tabs
local ToolsTab = Window:CreateTab("Tools", "wrench")
local ItemsTab = Window:CreateTab("Items", "package")
local ActionsTab = Window:CreateTab("Actions", "zap")

-- Delete Tool Variables
local tool = nil
local selectionBox = nil
local confirmGui = nil
local selectedPart = nil
local mouseConnection = nil
local unequipConnection = nil
local AutoCash = false
-- Tools Tab
ToolsTab:CreateSection("Tools")
ToolsTab:CreateToggle({
    Name = "Tool to delete things",
    CurrentValue = false,
    Flag = "DeleteTool",
    Callback = function(value)
        if value then
            -- Create DeleteTool
            tool = Instance.new("Tool")
            tool.Name = "DeleteTool"
            tool.RequiresHandle = false
            tool.Parent = player.Backpack

            -- Clear visuals function
            local function clearSelection()
                if selectionBox then selectionBox:Destroy() end
                if confirmGui then confirmGui:Destroy() end
                selectionBox = nil
                confirmGui = nil
                selectedPart = nil
            end

            -- Create confirm GUI
            local function createConfirmGui(part)
                local gui = Instance.new("ScreenGui")
                gui.Name = "ConfirmDeleteScreenGui"
                gui.ResetOnSpawn = false
                gui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
                gui.Parent = player:WaitForChild("PlayerGui")

                local btn = Instance.new("TextButton")
                btn.Size = UDim2.new(0, 180, 0, 50)
                btn.Position = UDim2.new(0.5, -90, 0.82, 0)
                btn.Text = "Delete"
                btn.BackgroundColor3 = Color3.fromRGB(35, 200, 100)
                btn.TextColor3 = Color3.new(1, 1, 1)
                btn.Font = Enum.Font.GothamSemibold
                btn.TextScaled = true
                btn.TextSize = 18
                btn.AutoButtonColor = true
                btn.BorderSizePixel = 0
                btn.BackgroundTransparency = 0.05
                btn.Parent = gui

                local corner = Instance.new("UICorner")
                corner.CornerRadius = UDim.new(0, 10)
                corner.Parent = btn

                local stroke = Instance.new("UIStroke")
                stroke.Color = Color3.fromRGB(0, 0, 0)
                stroke.Thickness = 1
                stroke.Transparency = 0.3
                stroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
                stroke.Parent = btn

                btn.MouseButton1Click:Connect(function()
                    Delete(part)
                    clearSelection()
                    game.StarterGui:SetCore("SendNotification", {
                        Title = "c00l delete",
                        Text = "Trying to delete...",
                        Duration = 2
                    })
                end)

                confirmGui = gui
            end

            -- Handle click
            local function handleClick()
                if tool.Parent ~= player.Character then return end

                local target = mouse.Target
                if target and target:IsA("BasePart") and target ~= selectedPart then
                    clearSelection()
                    selectedPart = target

                    -- Make selection box
                    selectionBox = Instance.new("SelectionBox")
                    selectionBox.Adornee = target
                    selectionBox.LineThickness = 0.1
                    selectionBox.Color3 = Color3.fromRGB(0, 255, 0)
                    selectionBox.Parent = target

                    createConfirmGui(target)
                end
            end

            -- Connect mouse and unequip
            mouseConnection = mouse.Button1Down:Connect(handleClick)
            unequipConnection = tool.Unequipped:Connect(clearSelection)

            game.StarterGui:SetCore("SendNotification", {
                Title = "Delete Tool",
                Text = "DeleteTool added to backpack",
                Duration = 3
            })
        else
            -- Remove DeleteTool and clean up
            if tool then
                tool:Destroy()
                tool = nil
            end
            if mouseConnection then
                mouseConnection:Disconnect()
                mouseConnection = nil
            end
            if unequipConnection then
                unequipConnection:Disconnect()
                unequipConnection = nil
            end
            if selectionBox then selectionBox:Destroy() end
            if confirmGui then confirmGui:Destroy() end
            selectionBox = nil
            confirmGui = nil
            selectedPart = nil
            game.StarterGui:SetCore("SendNotification", {
                Title = "Delete Tool",
                Text = "DeleteTool removed",
                Duration = 3
            })
        end
    end
})

ToolsTab:CreateButton({
    Name = "Unequip All Tools",
    Callback = function()
        UnequipAllTools()
    end
})

ToolsTab:CreateButton({
    Name = "Equip All Tools",
    Callback = function()
        EquipAllTools()
    end
})

-- Items Tab
local selectedItem = ""
ItemsTab:CreateSection("Items")
ItemsTab:CreateInput({
    Name = "Item Name",
    PlaceholderText = "Enter item name",
    RemoveTextAfterFocusLost = false,
    Callback = function(text)
        selectedItem = text
    end
})

ItemsTab:CreateButton({
    Name = "Give Item",
    Callback = function()
        if selectedItem ~= "" then
            GiveItem(selectedItem)
            game.StarterGui:SetCore("SendNotification", {
                Title = "Given",
                Text = "Gave " .. selectedItem,
                Duration = 2
            })
        else
            game.StarterGui:SetCore("SendNotification", {
                Title = "Error",
                Text = "No item selected",
                Duration = 2
            })
        end
    end
})

ItemsTab:CreateButton({
    Name = "Rescue Dog",
    Callback = function()
        GetDog()
    end
})

ItemsTab:CreateButton({
    Name = "Wake Agent",
    Callback = function()
        GetAgent()
    end
})

ItemsTab:CreateButton({
    Name = "Get Pete",
    Callback = function()
        GetUncle()
    end
})
ActionsTab:CreateSection("Actions")
-- Actions Tab
ActionsTab:CreateButton({
    Name = "Click Pete",
    Callback = function()
        ClickPete()
    end
})
game:GetService("RunService").Heartbeat:Connect(function()
    if AutoCash then
	    CollectCash()
	end
end)
ActionsTab:CreateButton({
    Name = "Collect Cash",
    Callback = function()
        CollectCash()
    end
})

ActionsTab:CreateButton({
    Name = "Kill Bad Guys",
    Callback = function()
        KillEnemies()
    end
})

ActionsTab:CreateButton({
    Name = "Upgrade Everything",
    Callback = function()
        GiveAll()
    end
})

ActionsTab:CreateButton({
    Name = "Heal All Players",
    Callback = function()
        HealAllPlayers()
    end
})

ActionsTab:CreateButton({
    Name = "Heal Yourself",
    Callback = function()
        HealYourself()
    end
})

ActionsTab:CreateButton({
    Name = "Break Bad Guys (CLIENT)",
    Callback = function()
        BreakEnemies()
    end
})

ActionsTab:CreateButton({
    Name = "Anti Wind",
    Callback = function()
        AntiWind()
    end
})

ActionsTab:CreateButton({
    Name = "Anti Mud",
    Callback = function()
        AntiMud()
    end
})
ActionsTab:CreateToggle({
    Name = "Auto Collect Cash",
    CurrentValue = false,
    Flag = "AutoCollectCash",
    Callback = function(value)
        AutoCash = value
    end
})
-- Invincibility Toggle
local SemiGodmode = false
ActionsTab:CreateToggle({
    Name = "Invincibility (doesn't work)",
    CurrentValue = false,
    Flag = "Invincibility",
    Callback = function(value)
        SemiGodmode = value
    end
})
