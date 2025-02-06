local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/jensonhirst/Orion/main/source')))()
local Window = OrionLib:MakeWindow({
	Name = "Infinity Hub | Difficulty Tycoon 0.1",
	HidePremium = false,
	SaveConfig = true,
	ConfigFolder = "InfinityHubDIF",
	IntroText = "Infinity Hub",
})

local Tab = Window:MakeTab({
	Name = "Misc",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})

local team = "Blue"
Tab:AddDropdown({
	Name = "Team",
	Default = "Blue",
	Options = {"Blue", "Green", "Yellow", "Red"},
	Callback = function(Value)
		team = Value
	end    
})

local autoClickEnabled = false

Tab:AddToggle({
	Name = "Auto Farm",
	Default = false,
	Callback = function(Value)
		autoClickEnabled = Value

		local character = game.Players.LocalPlayer.Character
		if character and character:FindFirstChild("Torso") then
			character.Torso.CanCollide = not Value
		end

		if Value then
			task.spawn(function()
				while autoClickEnabled do
					local root = game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
					if root then
						local tycoon = workspace.Tycoons[team:sub(1, 1) .. "Tycoon"]
						local purchase = tycoon.Purchases.db1
						local collector = tycoon.MainItems.CashCollector.Button

						-- Check if Click part exists before clicking
						if not purchase:FindFirstChild("Click") then
							OrionLib:MakeNotification({
								Name = "Infinity Hub",
								Content = "Click part not found because of a glitch, please rejoin!",
								Image = "rbxassetid://4483345998",
								Time = 5
							})
							autoClickEnabled = false
							break
						end

						fireclickdetector(purchase.Click)
						root.CFrame = collector.CFrame
					end
					wait(0.5)
				end
			end)
		end
	end    
})

Tab:AddButton({
	Name = "TP To spawn location",
	Callback = function()
		local root = game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
		if root then
			local tycoon = workspace.Tycoons[team:sub(1, 1) .. "Tycoon"]
			root.CFrame = tycoon.MainItems.SpawnLocation.CFrame
		end
	end    
})

Tab:AddButton({
	Name = "Destroy UI",
	Callback = function()
		OrionLib:Destroy()
	end    
})
