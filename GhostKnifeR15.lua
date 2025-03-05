local player = game.Players.LocalPlayer
local char = player.Character or player.CharacterAdded:Wait()
local lowerTorso = char:WaitForChild("LowerTorso")
local sword = Instance.new("Part")
sword.Size = Vector3.new(0.6, 0.4, 2.4)
sword.Color = Color3.fromRGB(150, 150, 150)
sword.Material = Enum.Material.Metal
sword.Anchored = false
sword.CanCollide = true
sword.Name = "Ghost"
local mesh = Instance.new("SpecialMesh")
mesh.Parent = sword
mesh.Scale = Vector3.new(3,2,2)
mesh.MeshId = "http://www.roblox.com/asset/?id=64131019"
mesh.TextureId = "http://www.roblox.com/asset/?id=64131051"
local weld = Instance.new("WeldConstraint")
weld.Part0 = lowerTorso
weld.Part1 = sword
sword.CFrame = lowerTorso.CFrame * CFrame.new(-1, -0.5, 0.1) * CFrame.Angles(math.rad(34), 0, 0)
lowerTorso.KnifeBelt.CFrame = CFrame.new(-9999.064453125, -0.48840001225471497, 0.21252000331878662)
sword.Parent = lowerTorso
weld.Parent = sword
