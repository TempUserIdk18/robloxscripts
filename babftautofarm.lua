local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local autoFarming = false
local flySpeed = 390.45 -- Fly speed for 1400 km/h (updated speed)
local flyDuration = 21 -- Flying duration in seconds
local centerPosition = Vector3.new(0, 100, 0) -- Center of the map
local chestPosition = Vector3.new(15, -5, 9495) -- Chest position
local bodyVelocity -- Variable to manage flying
local player = game.Players.LocalPlayer
local totalCoins = 0 -- Coins counter
local antiAFKEnabled = false -- Anti-AFK toggle state

-- Create Rayfield Window
local Window = Rayfield:CreateWindow({
    Name = "BABFT Auto Farm",
    LoadingTitle = "BABFT Auto Farm",
    LoadingSubtitle = "remade by trackcode563",
    ConfigurationSaving = {
        Enabled = false,
    },
    Discord = {
        Enabled = false,
    },
    KeySystem = false,
})

-- Auto Farm Toggle
local AutoFarmToggle = Window:CreateToggle({
    Name = "Start Auto Farm",
    CurrentValue = false,
    Flag = "AutoFarmToggle",
    Callback = function(Value)
        autoFarming = Value
        if autoFarming then
            startAutoFarm()
        else
            stopFlying()
            teleportToTeamBase()
        end
    end,
})

-- Coins Counter Display
local CoinsLabel = Window:CreateLabel({
    Name = "Gold farmed: 0",
    Font = Enum.Font.GothamBold,
    Color = Color3.fromRGB(255, 255, 0),
    TextSize = 16,
})

-- Anti-AFK Toggle
local AntiAFKToggle = Window:CreateToggle({
    Name = "Enable Anti-AFK",
    CurrentValue = false,
    Flag = "AntiAFKToggle",
    Callback = function(Value)
        antiAFKEnabled = Value
        if antiAFKEnabled then
            startAntiAFK()
        else
            stopAntiAFK()
        end
    end,
})

-- Anti-AFK Functionality
function startAntiAFK()
    spawn(function()
        while antiAFKEnabled do
            local character = player.Character or player.CharacterAdded:Wait()
            local hrp = character:FindFirstChild("HumanoidRootPart")

            if hrp then
                -- Simulate movement to avoid AFK detection
                hrp.CFrame = hrp.CFrame * CFrame.new(0, 0, math.random(-1, 1))
            end
            wait(2) -- Move every 2 seconds
        end
    end)
end

-- Stop Anti-AFK
function stopAntiAFK()
    -- This function doesn't need to do anything extra
    -- The movement stops automatically when antiAFKEnabled is set to false
end

-- Auto Farm Functionality
function startAutoFarm()
    spawn(function()
        while autoFarming do
            local character = player.Character or player.CharacterAdded:Wait()
            local hrp = character:FindFirstChild("HumanoidRootPart")

            if hrp then
                -- Teleport to the center of the map
                hrp.CFrame = CFrame.new(centerPosition)

                -- Enable noclip
                enableNoclip(character)

                -- Fly with boosted speed
                bodyVelocity = Instance.new("BodyVelocity")
                bodyVelocity.MaxForce = Vector3.new(10000, 10000, 10000)
                bodyVelocity.Velocity = Vector3.new(0, 0, flySpeed)
                bodyVelocity.Parent = hrp

                -- Allow flying for a fixed duration
                wait(flyDuration)

                -- Stop flying and destroy the velocity object
                if bodyVelocity then
                    bodyVelocity:Destroy()
                end

                -- Adjust position slightly and teleport to chest
                hrp.CFrame = CFrame.new(chestPosition)

                -- Kill the player to end the farm cycle
                character:BreakJoints()

                -- Increment coins after death
                if totalCoins < 10000000 then
                    totalCoins = totalCoins + 100
                    CoinsLabel:Set("Gold farmed: " .. totalCoins)
                end

                -- Wait for the player to respawn before restarting the loop
                wait(8) -- Adjust respawn wait time as necessary
            end
        end
    end)
end

-- Stop flying (when Auto Farm is stopped)
function stopFlying()
    if bodyVelocity then
        bodyVelocity:Destroy()
    end
end

-- Teleport to team base when Auto Farm is stopped
function teleportToTeamBase()
    local character = player.Character or player.CharacterAdded:Wait()
    local hrp = character:FindFirstChild("HumanoidRootPart")
    if hrp then
        -- Replace with your team base position
        local teamBasePosition = Vector3.new(0, 10, 0) -- Change to your desired coordinates
        hrp.CFrame = CFrame.new(teamBasePosition)
    end
end

-- Enable noclip (No Collision)
function enableNoclip(character)
    for _, part in pairs(character:GetChildren()) do
        if part:IsA("BasePart") then
            part.CanCollide = false
        end
    end
end
