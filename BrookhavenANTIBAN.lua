-- Best Brookhaven Anti-Ban Script
-- Features:
-- - Teleports back after death
-- - Deletes ban blocks

local player = game.Players.LocalPlayer
local oldcf

-- Function to handle ban block deletion
local function onDescendantAdded(descendant)
    if descendant.Name:lower():find("banned") then
        task.wait(0.3)
        if descendant then
            descendant:Destroy()
            print("Ban bypassed: " .. descendant.Name)
        end
    end
end

-- Save position before death
player.CharacterAdded:Connect(function(character)
    local humanoid = character:WaitForChild("Humanoid", 5)
    local rootPart = character:WaitForChild("HumanoidRootPart", 5)

    if humanoid and rootPart then
        humanoid.Died:Connect(function()
            oldcf = rootPart.CFrame
        end)
    end
end)

-- Teleport back after respawn
player.CharacterAdded:Connect(function(character)
    task.wait(0.5) -- Small delay for loading
    local rootPart = character:WaitForChild("HumanoidRootPart", 5)
    if oldcf and rootPart then
        rootPart.CFrame = oldcf
        print("Teleported back to saved position")
    end
end)

-- Reset oldcf when character resets
player.CharacterRemoving:Connect(function()
    oldcf = nil
end)

-- Check existing objects for ban blocks
for _, descendant in ipairs(workspace:GetDescendants()) do
    onDescendantAdded(descendant)
end

-- Listen for new objects
workspace.DescendantAdded:Connect(onDescendantAdded)

print("Loaded!")
