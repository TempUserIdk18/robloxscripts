-- best brookhaven anti ban script
local function onDescendantAdded(descendant)
    if descendant:IsA("BasePart") and descendant.Name:find("BannedBlock") then
        descendant:Destroy()
    end
end
workspace.DescendantAdded:Connect(onDescendantAdded)
for _, descendant in ipairs(workspace:GetDescendants()) do
    onDescendantAdded(descendant)
end
