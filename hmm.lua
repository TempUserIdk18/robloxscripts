
--
 local plr = game.Players.LocalPlayer

local mouse = plr:GetMouse()

lpc = game.Players.LocalPlayer.Character

weld1 = Instance.new("Weld")
local gg = mouse.Target
if gg ~= nil then
for i,v in pairs(game.Players:GetPlayers()) do
AnimationId = "259438880"
local Anim = Instance.new("Animation")
Anim.AnimationId = "rbxassetid://"..AnimationId
local k = game.Players.LocalPlayer.Character.Humanoid:LoadAnimation(Anim)
k:Play()
k:AdjustSpeed(100)
end
end


if gg ~= nil then
for i,v in pairs(game.Players:GetPlayers()) do
AnimationId2 = "148840371"
local Anim2 = Instance.new("Animation")
Anim2.AnimationId = "rbxassetid://"..AnimationId2
local k2 = game.Players.LocalPlayer.Character.Humanoid:LoadAnimation(Anim2)
k2:Play()
k2:AdjustSpeed(8)
end
end
