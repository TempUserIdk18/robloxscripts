-- troll tower fe glove bypass fixed 🔥🔥🔥

local player = game.Players.LocalPlayer
local char = player.Character or player.CharacterAdded:Wait()
local gui = Instance.new("ScreenGui", game:GetService("CoreGui"))
gui.Name = "glovehaxer"
gui.ResetOnSpawn = false

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
	stroke.LineJoinMode = Enum.LineJoinMode.Miter
end

-- main frame
local main = Instance.new("Frame", gui)
main.Size = UDim2.new(0, 270, 0, 310)
main.Position = UDim2.new(0.5, -135, 0.5, -155)
main.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
main.Active = true
main.Draggable = true
main.BorderSizePixel = 0
addStroke(main)

local title = Instance.new("TextLabel", main)
title.Size = UDim2.new(1, 0, 0, 35)
title.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
title.Text = "Troll Pin Tower FE Bypass"
title.Font = Enum.Font.Code
title.TextSize = 16
title.TextColor3 = Color3.new(1, 0, 0)
addStroke(title)

-- vars
local slapSpam = false
local killAll = false
local savedPower = nil
local savedSpeed = nil

local rs = game:GetService("RunService")

-- slap spam toggle
local slapBtn = Instance.new("TextButton", main)
slapBtn.Position = UDim2.new(0, 10, 0, 50)
slapBtn.Size = UDim2.new(1, -20, 0, 30)
slapBtn.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
slapBtn.Font = Enum.Font.Code
slapBtn.TextSize = 14
slapBtn.TextColor3 = Color3.new(1, 0, 0)
slapBtn.Text = "start slap spam"
addStroke(slapBtn)

-- kill all toggle
local killBtn = Instance.new("TextButton", main)
killBtn.Position = UDim2.new(0, 10, 0, 95)
killBtn.Size = UDim2.new(1, -20, 0, 30)
killBtn.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
killBtn.Font = Enum.Font.Code
killBtn.TextSize = 14
killBtn.TextColor3 = Color3.new(1, 0, 0)
killBtn.Text = "start grab fling all"
addStroke(killBtn)

-- power input
local powerBox = Instance.new("TextBox", main)
powerBox.PlaceholderText = "slap power (e.g. 1e309)"
powerBox.Position = UDim2.new(0, 10, 0, 140)
powerBox.Size = UDim2.new(1, -20, 0, 30)
powerBox.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
powerBox.Font = Enum.Font.Code
powerBox.TextSize = 14
powerBox.TextColor3 = Color3.new(1, 0, 0)
powerBox.Text = ""
addStroke(powerBox)

-- speed input
local speedBox = Instance.new("TextBox", main)
speedBox.PlaceholderText = "slap speed (lower = faster)"
speedBox.Position = UDim2.new(0, 10, 0, 185)
speedBox.Size = UDim2.new(1, -20, 0, 30)
speedBox.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
speedBox.Font = Enum.Font.Code
speedBox.TextSize = 14
speedBox.TextColor3 = Color3.new(1, 0, 0)
speedBox.Text = ""
addStroke(speedBox)

local infoLabel = Instance.new("TextLabel", main)
infoLabel.Size = UDim2.new(1, -25, 0, 50)
infoLabel.Position = UDim2.new(0, 15, 0, 230)
infoLabel.BackgroundTransparency = 1
infoLabel.Font = Enum.Font.Code
infoLabel.TextScaled = true
infoLabel.TextSize = 14
infoLabel.TextColor3 = Color3.new(255, 0, 0)
infoLabel.Text = "glove must be equipped or in backpack.\nworks in troll pin tower."

-- slap spam btn
slapBtn.MouseButton1Click:Connect(function()
	slapSpam = not slapSpam
	slapBtn.Text = slapSpam and "stop slap spam" or "start slap spam"

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
	end
end)

-- kill all btn
killBtn.MouseButton1Click:Connect(function()
	killAll = not killAll
	killBtn.Text = killAll and "stop grab fling all" or "start grab fling all"

	if killAll then
		task.spawn(function()
			while killAll do
				local glove = hasGloveOrSlap()
				if glove and glove:IsA("Tool") then
					for _, v in pairs(game.Players:GetPlayers()) do
						if v ~= player and v.Character and v.Character:FindFirstChild("HumanoidRootPart") then
							local root = char:FindFirstChild("HumanoidRootPart")
							if root then
								local pos = root.Position + (root.CFrame.LookVector * 2.75) -- tp 2.75 studs in front
								v.Character.HumanoidRootPart.CFrame = CFrame.new(pos)
							end
						end
					end
					glove:Activate()
					glove:Deactivate()
				end
				task.wait(0.01) -- time between mass slaps
			end
		end)
	end
end)

-- power input
powerBox.FocusLost:Connect(function()
	local val = tonumber(powerBox.Text)
	if val then
		savedPower = val
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
		savedSpeed = val
		local glove = hasGloveOrSlap()

		if glove and glove:FindFirstChild("Speed") then
			glove.Speed.Value = val
		end
	end
end)

-- respawn handler
player.CharacterAdded:Connect(function()
	char = player.Character or player.CharacterAdded:Wait()
	gui.Parent = game:GetService("CoreGui")
	
	-- restore saved values
	local glove = hasGloveOrSlap()

	if glove then
		if savedPower and glove:FindFirstChild("Power") then
			glove.Power.Value = savedPower
			powerBox.Text = tostring(savedPower)
		end
		if savedSpeed and glove:FindFirstChild("Speed") then
			glove.Speed.Value = savedSpeed
			speedBox.Text = tostring(savedSpeed)
		end
	end
end)

-- notif
if hasGloveOrSlap() then
	game.StarterGui:SetCore("SendNotification", {
		Title = "Troll Tower FE Bypass",
		Text = "success! glove found.",
		Duration = 5
	})
else
	game.StarterGui:SetCore("SendNotification", {
		Title = "Troll Tower FE Bypass",
		Text = "failed! you probably don't have the glove.",
		Duration = 5
	})
end
