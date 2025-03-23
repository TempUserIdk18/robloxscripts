local UserInputService = game:GetService("UserInputService")
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local dogAssetId = "rbxassetid://5192647128"
local player = Players.trackcode563
if not player or not player.Character or not player.Character.PrimaryPart then return end

local dogs = {}
local running = true

local function spawnDog()
	local success, result = pcall(function()
		return game:GetObjects(dogAssetId)
	end)
    if not running then return end
	if not success or not result or #result == 0 then return end

	local dogModel = result[1]
	if not dogModel or not dogModel:IsA("Model") then return end
	dogModel.Parent = workspace
	table.insert(dogs, dogModel)

	local torso = dogModel:FindFirstChild("Torso")
	local humanoid = dogModel:FindFirstChildOfClass("Humanoid")
	if not torso or not humanoid then return end
	local s = Instance.new("Sound")
	s.SoundId = "http://www.roblox.com/asset/?id=257361046"
	s.Volume = 2
	s.Parent = torso
	s:Play()
	local targetPoser = player.Character.PrimaryPart.CFrame
	torso.CFrame = targetPoser
	local walkAnimation = Instance.new("Animation")
	walkAnimation.AnimationId = "rbxassetid://125749145"
	local walkAnimTrack = humanoid:LoadAnimation(walkAnimation)

	local rowSize = 7
	local index = #dogs - 1
	local side = (index % 2 == 0) and 1 or -1
	local col = math.floor(index / 2) % rowSize
	local row = math.floor(math.floor(index / 2) / rowSize)
	local positionOffset = Vector3.new(col * 4 - 12, 0, side * (6 + (row * 4)))

	local function followPlayer()
		RunService.Heartbeat:Connect(function()
			if not player or not player.Character or not player.Character.PrimaryPart then return end
			local targetPos = player.Character.PrimaryPart.Position + player.Character.PrimaryPart.CFrame:VectorToWorldSpace(positionOffset)
			if (torso.Position - targetPos).Magnitude > 3 then
				humanoid:MoveTo(targetPos)
				if not walkAnimTrack.IsPlaying then
					walkAnimTrack:Play()
				end
			else
				if walkAnimTrack.IsPlaying then
					walkAnimTrack:Stop()
				end
			end
		end)
	end

	followPlayer()
end

local function destroyAllDogs()
	for _, dog in ipairs(dogs) do
		if dog and dog.Parent then
			dog:Destroy()
		end
	end
	table.clear(dogs)
end

UserInputService.InputBegan:Connect(function(input, gameProcessed)
	if not gameProcessed then
		if input.KeyCode == Enum.KeyCode.Z then
			spawnDog()
		elseif input.KeyCode == Enum.KeyCode.X then
			destroyAllDogs()
		elseif input.KeyCode == Enum.KeyCode.C then
			running = false
			destroyAllDogs()
		end
	end
end)
