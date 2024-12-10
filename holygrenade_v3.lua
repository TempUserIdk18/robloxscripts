local Players = game:GetService("Players")
local player = Players.LocalPlayer

-- Load the tool
local tool = game:GetObjects("rbxassetid://116348487934946")[1]
tool.Parent = player.Backpack

-- References to player's character and humanoid
local character = player.Character or player.CharacterAdded:Wait()
local humanoid = character:WaitForChild("Humanoid")
local rightArm = character:WaitForChild("RightUpperArm")
local originalRightC1 = rightArm.RightShoulder.C1

-- Function to setup modifications when tool is equipped
local function setupTool(tool)
    -- Rename the right arm to reflect its state
    rightArm.Name = "R_Arm"
    
    -- Adjust the right arm to hold the tool correctly
    rightArm.RightShoulder.C1 = originalRightC1 * CFrame.Angles(math.rad(-45), 0, math.rad(15)) -- Adjust angles for proper rotation
    
    -- Stop any conflicting animations
    for _, track in pairs(humanoid:GetPlayingAnimationTracks()) do
        track:Stop()
    end
end

-- Restore character properties when tool is unequipped
local function restoreTool()
    rightArm.Name = "RightUpperArm"
    
    -- Reset the right arm's CFrame
    rightArm.RightShoulder.C1 = originalRightC1
end

-- Connect tool events
tool.Equipped:Connect(function()
    setupTool(tool)
    player:SetAttribute("HoldingTool", true) -- Example custom attribute
end)

tool.Unequipped:Connect(function()
    restoreTool()
    player:SetAttribute("HoldingTool", false)
end)
