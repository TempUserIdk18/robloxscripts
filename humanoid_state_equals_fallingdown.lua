local _0x1f45b8 = game:GetService("UserInputService")
local _0x233aab = Instance.new("ScreenGui")
_0x233aab.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
local _0x5f3801 = Instance.new("TextButton")
_0x5f3801.Size = UDim2.new(0, 200, 0, 50)
_0x5f3801.AnchorPoint = Vector2.new(0.5, 0.5)
_0x5f3801.Position = UDim2.new(0.5, -670, 0.5, 436)
_0x5f3801.Style = Enum.ButtonStyle.RobloxRoundDropdownButton
_0x5f3801.Text = "Humanoid:ChangeState'FallingDown'"
_0x5f3801.Parent = _0x233aab
_0x233aab.ResetOnSpawn = false
local _0x2b02d6 = false
local _0x31b51e, _0x3c1a62
_0x5f3801.InputBegan:Connect(function(_0x5f3801)
    if _0x5f3801.UserInputType == Enum.UserInputType.MouseButton1 or _0x5f3801.UserInputType == Enum.UserInputType.Touch then
        _0x2b02d6 = true
        _0x31b51e = _0x5f3801.Position
        _0x3c1a62 = _0x5f3801.Position
        _0x5f3801.Changed:Connect(function()
            if _0x5f3801.UserInputState == Enum.UserInputState.End then
                _0x2b02d6 = false
            end
        end)
    end
end)
_0x5f3801.InputChanged:Connect(function(_0x5f3801)
    if _0x5f3801.UserInputType == Enum.UserInputType.MouseMovement or _0x5f3801.UserInputType == Enum.UserInputType.Touch then
        if _0x2b02d6 then
            local _0x38df65 = _0x5f3801.Position - _0x31b51e
            _0x5f3801.Position = UDim2.new(_0x3c1a62.X.Scale, _0x3c1a62.X.Offset + _0x38df65.X, _0x3c1a62.Y.Scale, _0x3c1a62.Y.Offset + _0x38df65.Y)
        end
    end
end)
_0x5f3801.MouseButton1Click:Connect(function()
    local _0x212f45 = game.Players.LocalPlayer.Character
    if _0x212f45 and _0x212f45:FindFirstChild("Humanoid") then
        local _0x257e5b = _0x212f45.Humanoid
        _0x257e5b:ChangeState(Enum.HumanoidStateType.Physics)
        task.wait(5)
        _0x257e5b:ChangeState(Enum.HumanoidStateType.GettingUp)
    end
end)
