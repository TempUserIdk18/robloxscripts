-- Best Brookhaven Anti-Ban Script
-- Features:
-- - Teleports back after death
-- - Deletes ban blocks

local player = game.Players.LocalPlayer
local oldcf

-- Function to handle ban block deletion
local function onDescendantAdded(descendant)
    if descendant.Name:find("Banned") then
        task.wait(0.3)
        descendant:Destroy()
        print("Ban bypassed")
    end
end

-- Save position on death
player.CharacterAdded:Connect(function(character)
    character:WaitForChild("Humanoid").Died:Connect(function()
        oldcf = character.HumanoidRootPart.CFrame
    end)
end)

-- Teleport back after respawn
player.CharacterAdded:Connect(function(character)
    task.wait(0.5) -- Small delay to make sure the character fully loads
    if oldcf then
        character:WaitForChild("HumanoidRootPart").CFrame = oldcf
        print("Teleported back to saved position")
    end
end)

-- Check existing objects for ban blocks
for _, descendant in ipairs(workspace:GetDescendants()) do
    onDescendantAdded(descendant)
end

-- Listen for new objects
workspace.DescendantAdded:Connect(onDescendantAdded)

print("Loaded!")
