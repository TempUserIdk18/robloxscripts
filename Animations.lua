-- Load Kavo UI Library
local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"))()

-- Create UI Window
local Window = Library.CreateLib("Animation Player", "Ocean")

-- Create Tabs
local CustomTab = Window:NewTab("Custom Anims")
local BuiltInTab = Window:NewTab("Built-in Anims")
local RigsTab = Window:NewTab("Change Rig Type")

-- Create Sections
local CustomSection = CustomTab:NewSection("Custom Animation")
local BuiltInSection = BuiltInTab:NewSection("Built-in Animations")
local RigSection = RigsTab:NewSection("Rig Type")

-- Variables
local tracks = {} -- Dictionary to store animation tracks
local AnimationActive = {} -- Dictionary to track animation states

-- Play Animation Function
local function playAnimation(AnimationId, Value)
    local player = game.Players.LocalPlayer
    local char = player.Character or player.CharacterAdded:Wait()
    local humanoid = char:WaitForChild("Humanoid")
    
    if AnimationId ~= "" then
        if not tracks[AnimationId] then
            local Anim = Instance.new("Animation")
            Anim.AnimationId = "rbxassetid://" .. AnimationId

            local success, err = pcall(function()
                tracks[AnimationId] = humanoid:LoadAnimation(Anim)
            end)
            
            if not success then
                return
            end
            tracks[AnimationId].Priority = Enum.AnimationPriority.Action
            tracks[AnimationId].Looped = true
        end

        AnimationActive[AnimationId] = Value
        
        if AnimationActive[AnimationId] then
            if AnimationId == "27432691" then
    tracks[AnimationId]:Play(0.1, 1, 5000)
    return
end
if AnimationId == "259438880" then
    tracks[AnimationId].Looped = false
    while AnimationActive[AnimationId] do
        tracks[AnimationId]:Stop()
        tracks[AnimationId]:Play(0.1, 1, 500)
        tracks[AnimationId].TimePosition = 0.3
        task.wait(0.0000001)
    end
    return
end
if AnimationId == "313762630" then
    tracks[AnimationId].Looped = false
    while AnimationActive[AnimationId] do
        tracks[AnimationId]:Stop()
        tracks[AnimationId]:Play(0.1, 1, 1)
        tracks[AnimationId].TimePosition = 2
        task.wait(0.0000001)
    end
    return
end
if AnimationId == "184574340" then
    tracks[AnimationId]:Play(0.1, 1, 5000)
    return
end
if AnimationId == "33796059" then
    tracks[AnimationId]:Play(0.1, 1, 5000)
    return
end
if AnimationId == "35154961" then
    tracks[AnimationId].Looped = false
    while AnimationActive[AnimationId] do
        tracks[AnimationId]:Stop()
        tracks[AnimationId]:Play(0.1, 1, 500)
        tracks[AnimationId].TimePosition = 3.7
        task.wait(0.0000001)
    end
    return
end
if AnimationId == "215384594" then
    tracks[AnimationId]:Play(0.1, 1, 500000)
    return
end
if AnimationId == "181525546" then
    tracks[AnimationId]:Play(0.1, 1, 5000)
    return
end
if AnimationId == "754656200" then
    tracks[AnimationId]:Play(0.1, 1, 5000)
    return
end
if AnimationId == "136801964" then
    tracks[AnimationId].Looped = false
    while AnimationActive[AnimationId] do
        tracks[AnimationId]:Stop()
        tracks[AnimationId]:Play(0.1, 1, 1)
        tracks[AnimationId].TimePosition = 2
        task.wait(0.0000001)
    end
    return
end
if AnimationId == "136801964X" then
    tracks[AnimationId].Looped = false
    local modifiedId = "136801964" -- Use a separate variable to avoid overwriting AnimationId
    while AnimationActive[AnimationId] do
        tracks[AnimationId]:Stop()
        tracks[AnimationId]:Play(0.1, 1, 1)
        tracks[AnimationId].TimePosition = 0.5
        task.wait(0.0000001)
    end
    return
end
if AnimationId == "507771019X" then
    local modifiedId = "507771019" -- Use a separate variable to avoid overwriting AnimationId
    tracks[AnimationId]:Play(0.1, 1, 999999)
    return
end
if AnimationId == "522635514X" then
    local modifiedId = "522635514" -- Use a separate variable to avoid overwriting AnimationId
    tracks[AnimationId]:Play(0.1, 1, 999999)
    return
end
if AnimationId == "182436935X" then
    local modifiedId = "182436935" -- Use a separate variable to avoid overwriting AnimationId
    tracks[AnimationId]:Play(0.1, 1, 999999)
    return
end
if AnimationId == "204295235X" then
    local modifiedId = "204295235" -- Use a separate variable to avoid overwriting AnimationId
    tracks[AnimationId]:Play(0.1, 1, 500)
    return
end
if AnimationId == "72042024" then
    tracks[AnimationId].Looped = false
    while AnimationActive[AnimationId] do
        tracks[AnimationId]:Stop()
        tracks[AnimationId]:Play(0.1, 1, 0.8)
        tracks[AnimationId].TimePosition = 0.6
        task.wait(0.3)
    end
    return
end
if AnimationId == "72042024X" then
    local modifiedId = "72042024" -- Use a separate variable to avoid overwriting AnimationId
    tracks[AnimationId].Looped = false
    while AnimationActive[AnimationId] do
        tracks[AnimationId]:Stop()
        tracks[AnimationId]:Play(0.1, 1, 5)
        tracks[AnimationId].TimePosition = 0.6
        task.wait(0.1)
    end
    return
end
if AnimationId == "698251653" then -- Circle Arm animation
    tracks[AnimationId].Looped = false
    while AnimationActive[AnimationId] do
        tracks[AnimationId]:Stop()
        tracks[AnimationId]:Play(0.1, 1, 0.8)
        tracks[AnimationId].TimePosition = 0.53
        task.wait(0.35)
    end
    return
end

            tracks[AnimationId]:Play(0.1, 1, 1)
        else
            if tracks[AnimationId] then
                tracks[AnimationId]:Stop()
                tracks[AnimationId] = nil
                AnimationActive[AnimationId] = nil
            end
        end
    end
end

-- Custom Animation ID Input
local AnimationId = ""
CustomSection:NewTextBox("Animation ID", "Enter animation asset ID", function(Value)
    AnimationId = Value
end)

-- Play Custom Animation Toggle
CustomSection:NewToggle("Play Animation", "Toggle to play the entered animation", function(state)
    playAnimation(AnimationId, state)
end)

local builtInAnimations = {
    { Name = "R15 - Idle 1", Id = "507766666" },
    { Name = "R15 - Idle 2", Id = "507766951" },
    { Name = "R15 - Idle 3", Id = "507766388" },
    { Name = "R15 - Walk", Id = "507777826" },
    { Name = "R15 - Run", Id = "507767714" },
    { Name = "R15 - Swim", Id = "507784897" },
    { Name = "R15 - Swim Idle", Id = "507785072" },
    { Name = "R15 - Jump", Id = "507765000" },
    { Name = "R15 - Fall", Id = "507767968" },
    { Name = "R15 - Climb", Id = "507765644" },
    { Name = "R15 - Sit", Id = "507768133" },
    { Name = "R15 - Tool None", Id = "507768375" },
    { Name = "R15 - Tool Slash", Id = "522635514" },
    { Name = "R15 - Tool Slash Crazy", Id = "522635514X" },
    { Name = "R15 - Tool Lunge", Id = "522638767" },
    { Name = "R15 - Wave", Id = "507770239" },
    { Name = "R15 - Point", Id = "507770453" },
    { Name = "R15 - Dance 1", Id = "507771019" },
    { Name = "R15 - Dance 1 Crazy", Id = "507771019X" },
    { Name = "R15 - Dance 2", Id = "507771955" },
    { Name = "R15 - Dance 3", Id = "507772104" },
    { Name = "R15 - Dance 4", Id = "507776043" },
    { Name = "R15 - Dance 5", Id = "507776720" },
    { Name = "R15 - Dance 6", Id = "507776879" },
    { Name = "R15 - Dance 7", Id = "507777268" },
    { Name = "R15 - Dance 8", Id = "507777451" },
    { Name = "R15 - Dance 9", Id = "507777623" },
    { Name = "R15 - Laugh", Id = "507770818" },
    { Name = "R15 - Cheer", Id = "507770677" },
        { Name = "R15 - Stylish Idle", Id = "616136790" },
    { Name = "R15 - Stylish Run", Id = "616140816" },
    { Name = "R15 - Stylish Jump", Id = "616139451" },
    { Name = "R15 - Stylish Fall", Id = "616134815" },
    { Name = "R15 - Stylish Climb", Id = "616133594" },
    { Name = "R15 - Stylish Idle 2", Id = "616138447" },
    { Name = "R15 - Spinner", Id = "754658275" },
    { Name = "R15 - Open", Id = "582855105" },
    { Name = "R15 - Jerk", Id = "698251653" },
    { Name = "R15 - Fling Arms", Id = "754656200" },
    { Name = "R15 - griddy", Id = "674871189" },
    { Name = "R15 - Float Slash", Id = "717879555" },
    { Name = "R15 - Down Slash", Id = "746398327" },
    { Name = "R15 - Rotate Slash", Id = "675025570" },
    { Name = "R15 - Bend", Id = "696096087" },
    { Name = "R15 - Arms out", Id = "582384156" },
    { Name = "R15 - Zombie Attack", Id = "708553116" },
    { Name = "R15 - Pull", Id = "675025795" },
    { Name = "R6 - Faint", Id = "181526230" },
    { Name = "R6 - Spinner", Id = "188632011" },
    { Name = "R6 - Scared", Id = "180612465" },
    { Name = "R6 - Floating Head", Id = "121572214" },
    { Name = "R6 - Crouch", Id = "182724289" },
    { Name = "R6 - Moving Dance", Id = "429703734" },
    { Name = "R6 - Float", Id = "313762630" },
    { Name = "R6 - Spin Dance", Id = "429730430" },
    { Name = "R6 - Spin Dance 2", Id = "186934910" },
    { Name = "R6 - Super Faint", Id = "181525546" },
    { Name = "R6 - Bow Down", Id = "204292303" },
    { Name = "R6 - Sword Slam", Id = "204295235" },
    { Name = "R6 - Sword Slam Crazy", Id = "204295235X" },
    { Name = "R6 - Insane", Id = "33796059" },
    { Name = "R6 - Mega Insane", Id = "184574340" },
    { Name = "R6 - Sword Slice", Id = "35978879" },
    { Name = "R6 - Floor Crawl", Id = "282574440" },
    { Name = "R6 - Dino Walk", Id = "204328711" },
    { Name = "R6 - Flying Head", Id = "35154961" },
    { Name = "R6 - Clone Illusion", Id = "215384594" },
    { Name = "R6 - Moon Dance", Id = "45834924" },
    { Name = "R6 - Full Punch", Id = "204062532" },
    { Name = "R6 - Full Swing", Id = "218504594" },
    { Name = "R6 - School Arm Up", Id = "259438880" },
    { Name = "R6 - Rotate Left", Id = "136801964" },
    { Name = "R6 - Rotate Right", Id = "136801964X" },
    { Name = "R6 - Arm Detach", Id = "33169583" },
    { Name = "R6 - Insane Arms", Id = "27432691" },
    { Name = "R6 - Dance 3", Id = "182436935" },
    { Name = "R6 - Dance 3 Crazy", Id = "182436935X" },
    { Name = "R6 - Jerk", Id = "72042024" },
    { Name = "R6 - Jerk Crazy", Id = "72042024X" }
}
for _, anim in pairs(builtInAnimations) do
    BuiltInSection:NewToggle(anim.Name, "Toggle to play " .. anim.Name, function(state)
        playAnimation(anim.Id, state)
    end)
end

-- Rig Type Switching
local AvatarEditorService = game:GetService("AvatarEditorService")

RigSection:NewButton("Set R15", "Switch to R15 rig", function()
    local player = game.Players.LocalPlayer
    local character = player.Character or player.CharacterAdded:Wait()
    local humanoid = character:FindFirstChildWhichIsA("Humanoid")
    
    if humanoid and humanoid.RigType ~= Enum.HumanoidRigType.R15 then
        local rigType = Enum.HumanoidRigType.R15
        AvatarEditorService:PromptSaveAvatar(humanoid.HumanoidDescription, rigType)
        local result = AvatarEditorService.PromptSaveAvatarCompleted:Wait()
        
        if result == Enum.AvatarPromptResult.Success then
            humanoid.Health = 0
        else
            warn("Failed to switch rig to R15.")
        end
    else
        warn("Humanoid not found or already R15.")
    end
end)

RigSection:NewButton("Set R6", "Switch to R6 rig", function()
    local player = game.Players.LocalPlayer
    local character = player.Character or player.CharacterAdded:Wait()
    local humanoid = character:FindFirstChildWhichIsA("Humanoid")
    
    if humanoid and humanoid.RigType ~= Enum.HumanoidRigType.R6 then
        local rigType = Enum.HumanoidRigType.R6
        AvatarEditorService:PromptSaveAvatar(humanoid.HumanoidDescription, rigType)
        local result = AvatarEditorService.PromptSaveAvatarCompleted:Wait()
        
        if result == Enum.AvatarPromptResult.Success then
            humanoid.Health = 0
        else
            warn("Failed to switch rig to R6.")
        end
    else
        warn("Humanoid not found or already R6.")
    end
end)
