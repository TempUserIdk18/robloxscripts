-- troll tower fe glove bypass fr fr 100% fe!!!





















































































































local player = game.Players.LocalPlayer
local char = player.Character or player.CharacterAdded:Wait()
local gui = Instance.new("ScreenGui", game:GetService("CoreGui"))
gui.Name = "glovehaxer"
gui.ResetOnSpawn = false

-- fe bypass still works 🔥
local function hasGloveOrSlap()
	local player = game.Players.LocalPlayer
	local function findItem(container)
		return container:FindFirstChild("Glove") or container:FindFirstChild("Slap")
	end

	return findItem(player.Backpack) or findItem(player.Character)
end

local function addStroke(obj)
	local stroke = Instance.new("UIStroke", obj)
	stroke.Thickness = 2.5
	stroke.Color = Color3.fromRGB(255, 0, 0)
	stroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
	stroke.LineJoinMode=Enum.LineJoinMode.Miter
end

-- main frame
local main = Instance.new("Frame", gui)
main.Size = UDim2.new(0, 270, 0, 260)
main.Position = UDim2.new(0.5, -135, 0.5, -130)
main.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
main.Active = true
main.Draggable = true
main.BorderSizePixel = 0
addStroke(main)

local title = Instance.new("TextLabel", main)
title.Size = UDim2.new(1, 0, 0, 35)
title.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
title.Text = "glove fe bypass"
title.Font = Enum.Font.Code
title.TextSize = 16
title.TextColor3 = Color3.new(1,0,0)
addStroke(title)

-- vars
local savedAnimId = nil
local animRemoved = false

-- toggle anim btn
local toggle = Instance.new("TextButton", main)
toggle.Position = UDim2.new(0, 10, 0, 50)
toggle.Size = UDim2.new(1, -20, 0, 30)
toggle.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
toggle.Font = Enum.Font.Code
toggle.TextSize = 14
toggle.TextColor3 = Color3.new(1, 0, 0)
toggle.Text = "start slap spam"
addStroke(toggle)



local slapSpam = false
local rs = game:GetService("RunService")

toggle.MouseButton1Click:Connect(function()
	slapSpam = not slapSpam
	toggle.Text = slapSpam and "stop slap spam" or "start slap spam"

	if slapSpam then
		task.spawn(function()
			while slapSpam do
				local glove = hasGloveOrSlap()
				if glove and glove:IsA("Tool") then
					glove:Activate()
					glove:Deactivate()
				end
				task.wait(0.005)
			end
		end)
	else
		-- in case someone wants to stop it early
		slapSpam = false
	end
end)


-- input: power
local powerBox = Instance.new("TextBox", main)
powerBox.PlaceholderText = "slap power (e.g. 1e309)"
powerBox.Position = UDim2.new(0, 10, 0, 95)
powerBox.Size = UDim2.new(1, -20, 0, 30)
powerBox.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
powerBox.Font = Enum.Font.Code
powerBox.TextSize = 14
powerBox.TextColor3 = Color3.new(1, 0, 0)
powerBox.Text = ""
addStroke(powerBox)



-- input: speed
local speedBox = Instance.new("TextBox", main)
speedBox.PlaceholderText = "slap speed (lower = faster)"
speedBox.Position = UDim2.new(0, 10, 0, 140)
speedBox.Size = UDim2.new(1, -20, 0, 30)
speedBox.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
speedBox.Font = Enum.Font.Code
speedBox.TextSize = 14
speedBox.TextColor3 = Color3.new(1, 0, 0)
speedBox.Text = ""
addStroke(speedBox)


local infoLabel = Instance.new("TextLabel", main)
infoLabel.Size = UDim2.new(1, -25, 0, 50)
infoLabel.Position = UDim2.new(0, 15, 0, 185)
infoLabel.BackgroundTransparency = 1
infoLabel.Font = Enum.Font.Code
infoLabel.TextScaled = true
infoLabel.TextSize = 14
infoLabel.TextColor3 = Color3.new(255, 0, 0)
infoLabel.Text = "glove must be equipped or in backpack.\nright now only works in Troll is a pinning tower."

local success = hasGloveOrSlap()
-- save inputs
local savedPower = nil
local savedSpeed = nil

-- power input
powerBox.FocusLost:Connect(function()
	local val = tonumber(powerBox.Text)
	if val then
		savedPower = val -- save power
		local glove = hasGloveOrSlap()

		if glove and glove:FindFirstChild("Power") then
			glove.Power.Value = val
		end
	end
end)

-- speed input
speedBox.FocusLost:Connect(function()
	local val = tonumber(speedBox.Text)
	if val then
		savedSpeed = val -- save speed
		local glove = hasGloveOrSlap()

		if glove and glove:FindFirstChild("Speed") then
			glove.Speed.Value = val
		end
	end
end)

-- handle respawn
player.CharacterAdded:Connect(function()
	-- wait for character to load
	local char = player.Character or player.CharacterAdded:Wait()
	
	-- reset GUI
	gui.Parent = game:GetService("CoreGui")
	
	-- reset variables
	savedAnimId = nil
	animRemoved = false
	toggle.Text = "remove slap anim"
	
	-- restore saved values (power and speed)
	local glove = hasGloveOrSlap()

	if glove then
		if savedPower and glove:FindFirstChild("Power") then
			glove.Power.Value = savedPower
			powerBox.Text = tostring(savedPower) -- update textbox with saved power
		end
		if savedSpeed and glove:FindFirstChild("Speed") then
			glove.Speed.Value = savedSpeed
			speedBox.Text = tostring(savedSpeed) -- update textbox with saved speed
		end
	end
end)

if success then
	game.StarterGui:SetCore("SendNotification", {
		Title = "Troll Tower FE Bypass",
		Text = "success! glove found.",
		Duration = 5
	})

else
	game.StarterGui:SetCore("SendNotification", {
		Title = "Troll Tower FE Bypass",
		Text = "failed! you probably don't have the glove or smth.",
		Duration = 5
	})
end

