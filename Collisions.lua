LP = game.Players.LocalPlayer
while wait(1) do
    for i,v in pairs(game.Players:GetDescendants()) do
        if v:IsA("Player") and workspace:FindFirstChild(v.Name) and v ~= LP and workspace[v.Name]:FindFirstChild("CHECKER") == nil then
            checker = Instance.new("BoolValue",workspace[v.Name])
            checker.Name = "CHECKER"
            for i,v in pairs(workspace:WaitForChild(v.Name):GetDescendants()) do
                if v:IsA("Part") or v:IsA("MeshPart") then
                    local collider = Instance.new("Part",v)
                    collider.Size = v.Size
                    collider.Position = v.Position
                    collider.Transparency = 1
                    local weld = Instance.new("Weld",v)
                    weld.Part0 = v
                    weld.Part1 = collider
                end
            end
        end
    end
end
