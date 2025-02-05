local speedtool = Instance.new("Tool")
speedtool.Parent = game.Players.LocalPlayer.Backpack
speedtool.Name = "Ice Cream"
speedtool.Grip = CFrame.Angles(math.rad(90), 0, 0)
speedtool.TextureId = "rbxassetid://12875408449"
local hand = Instance.new("Part")
hand.Name = "Handle"
hand.Transparency = 1
hand.Size = Vector3.new(1, 1, 1)
hand.Parent = speedtool
hand.Anchored = false
local part = Instance.new("Part")
part.Parent = speedtool
part.Size = Vector3.new(0.6, 0.6, 1.1)
part.Position = hand.Position
part.Anchored = false
part.CanCollide = false
local mesh = Instance.new("SpecialMesh")
mesh.Parent = part
mesh.MeshId = "http://www.roblox.com/asset/?id=57718450"
mesh.Scale = Vector3.new(0.5, 0.5, 0.5)
mesh.TextureId = "http://www.roblox.com/asset/?id=57718359"
local weld = Instance.new("WeldConstraint")
weld.Part0 = part
weld.Part1 = hand
weld.Parent = part
part.Position = hand.Position
speedtool.Equipped:Connect(function()
    local plr = game.Players:GetPlayerFromCharacter(speedtool.Parent)
	if plr then
		if plr.Character.Humanoid.RigType == Enum.HumanoidRigType.R6 then
			plr.Character.Torso.CanCollide = false
			plr.Character.Head.CanCollide = false
			task.wait(0.05)
			plr.Character.Torso.CanCollide = true
			plr.Character.Head.CanCollide = true
		else
			plr.Character.UpperTorso.CanCollide = false
			plr.Character.LowerTorso.CanCollide = false
			plr.Character.Head.CanCollide = false
			plr.Character.HumanoidRootPart.CanCollide = false
			task.wait(0.05)
			plr.Character.UpperTorso.CanCollide = true
			plr.Character.LowerTorso.CanCollide = true
			plr.Character.Head.CanCollide = true
			plr.Character.HumanoidRootPart.CanCollide = true
		end
		
	end
end)
