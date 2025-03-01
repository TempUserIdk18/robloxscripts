local player = game.Players.LocalPlayer
local userInputService = game:GetService("UserInputService")
local physicsEnabled = false
local oldGravity = workspace.Gravity
local currentTrack
local function setupCharacter(character)
	local humanoid = character:WaitForChild("Humanoid")
	local Anim = Instance.new("Animation")
	if humanoid.RigType == Enum.HumanoidRigType.R15 then
		Anim.AnimationId = "rbxassetid://507766951"
	else
		Anim.AnimationId = "rbxassetid://180435571"
	end
	local success, track = pcall(function()
		local loadedTrack = humanoid:LoadAnimation(Anim)
		loadedTrack.Priority = Enum.AnimationPriority.Action
		loadedTrack.Looped = true
		return loadedTrack
	end)
	if not success or not track then
		warn("Failed to load animation")
		return
	end
	currentTrack = track
	local function togglePhysics()
		physicsEnabled = not physicsEnabled
		if physicsEnabled then
			humanoid:ChangeState(Enum.HumanoidStateType.Physics)
			workspace.Gravity = 26
			currentTrack:Play()
			print("moai ON")
		else
			humanoid:ChangeState(Enum.HumanoidStateType.GettingUp)
			workspace.Gravity = oldGravity
			currentTrack:Stop()
			print("moai OFF")
		end
	end
	local inputConnection
	inputConnection = userInputService.InputBegan:Connect(function(input, isTyping)
		if isTyping then return end
		if input.KeyCode == Enum.KeyCode.Y then
			togglePhysics()
		end
	end)
	character.AncestryChanged:Connect(function(_, parent)
		if not parent then
			inputConnection:Disconnect()
			if currentTrack then
				currentTrack:Stop()
				currentTrack = nil
			end
		end
	end)
end
if player.Character then
	setupCharacter(player.Character)
end
player.CharacterAdded:Connect(function(character)
	setupCharacter(character)
end)
print("Press Y to toggle moai mode")
