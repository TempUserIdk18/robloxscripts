local Players = game:GetService("Players")
local player = Players.LocalPlayer

-- Load the tool
local tool = game:GetObjects("rbxassetid://113995202107435")[1]
tool.Parent = player.Backpack

-- References to player's character and humanoid
local character = player.Character or player.CharacterAdded:Wait()
local humanoid = character:WaitForChild("Humanoid")
local rightArm = character:WaitForChild("RightUpperArm")
local leftArm = character:WaitForChild("LeftUpperArm")
local originalRightC1 = rightArm.RightShoulder.C1
local originalLeftC1 = leftArm.LeftShoulder.C1

-- Function to setup modifications when tool is equipped
local function setupTool(tool)
    rightArm.Name = "R_Arm"
    leftArm.Name = "L_Arm"
    
    rightArm.RightShoulder.C1 = originalRightC1 * CFrame.Angles(math.rad(-90), math.rad(-15), 0)
    leftArm.LeftShoulder.C1 = originalLeftC1 * CFrame.new(-0.2, -0.3, -0.5) * CFrame.Angles(math.rad(-125), math.rad(25), math.rad(25))
    
    for _, track in pairs(humanoid:GetPlayingAnimationTracks()) do
        track:Stop()
    end
end

-- Restore character properties when tool is unequipped
local function restoreTool()
    rightArm.Name = "RightUpperArm"
    leftArm.Name = "LeftUpperArm"
    
    rightArm.RightShoulder.C1 = originalRightC1
    leftArm.LeftShoulder.C1 = originalLeftC1
end

-- Connect tool events
tool.Equipped:Connect(function()
    setupTool(tool)
    player:SetAttribute("Hidden", true) -- Example custom attribute
end)

tool.Unequipped:Connect(function()
    restoreTool()
    player:SetAttribute("Hidden", false)
end)
