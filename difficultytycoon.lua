local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/jensonhirst/Orion/main/source')))()
local Window = OrionLib:MakeWindow({
	Name = "Infinity Hub | Difficulty Tycoon 0.2",
	HidePremium = false,
	SaveConfig = true,
	ConfigFolder = "InfinityHubDIF",
	IntroText = "Infinity Hub",
})

local Players = game:GetService("Players")
local IYMouse = Players.LocalPlayer:GetMouse()

-- Tabs
local TabHome = Window:MakeTab({Name = "Home", Icon = "rbxassetid://4483345998", PremiumOnly = false})
local TabMisc = Window:MakeTab({Name = "Main", Icon = "rbxassetid://4483345998", PremiumOnly = false})
local TabPlayer = Window:MakeTab({Name = "Player", Icon = "rbxassetid://4483345998", PremiumOnly = false})
local TabU = Window:MakeTab({Name = "Updatelog", Icon = "rbxassetid://4483345998", PremiumOnly = false})

-- Updatelog Tab
TabHome:AddLabel(Players.LocalPlayer.DisplayName .. ", Welcome to Infinity Hub - DT!")
TabU:AddLabel("0.2:")
TabU:AddLabel("added rejoin server button")
TabU:AddLabel("added updatelog tab")
TabU:AddLabel("added player tab")
TabU:AddLabel("autofarm now works without teleporting")
TabU:AddLabel("added home tab")
TabU:AddLabel("changed misc to main")

-- Misc Tab
local team = "Blue"
TabMisc:AddDropdown({
	Name = "Team",
	Default = "Blue",
	Options = {"Blue", "Green", "Yellow", "Red"},
	Callback = function(Value)
		team = Value
	end    
})

local autoClickEnabled = false
TabMisc:AddToggle({
	Name = "Auto Farm",
	Default = false,
	Callback = function(Value)
		autoClickEnabled = Value
		if Value then
			task.spawn(function()
				while autoClickEnabled do
					local root = Players.LocalPlayer.Character and Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
					if root then
						local tycoon = workspace.Tycoons[team:sub(1, 1) .. "Tycoon"]
						local purchase = tycoon.Purchases.db1
						local collector = tycoon.MainItems.CashCollector.Button
						if purchase:FindFirstChild("Click") then
						    root.CFrame = root.CFrame + Vector3.new(0, 1.2, 0)
							fireclickdetector(purchase.Click)
							firetouchinterest(root, collector, 0)
							firetouchinterest(root, collector, 1)
						else
							OrionLib:MakeNotification({
								Name = "Infinity Hub",
								Content = "Click part not found! Please rejoin!",
								Image = "rbxassetid://4483345998",
								Time = 5
							})
							autoClickEnabled = false
							break
						end
					end
					wait(0.5)
				end
			end)
		end
	end    
})

TabMisc:AddButton({
	Name = "Rejoin Server",
	Callback = function()
		game:GetService("TeleportService"):TeleportToPlaceInstance(game.PlaceId, game.JobId, Players.LocalPlayer)
	end    
})

TabHome:AddButton({
	Name = "Destroy UI",
	Callback = function()
		OrionLib:Destroy()
	end    
})

TabPlayer:AddSlider({
	Name = "WalkSpeed",
	Min = 0,
	Max = 300,
	Default = Players.LocalPlayer.Character.Humanoid.WalkSpeed,
	Increment = 1,
	Callback = function(Value)
		Players.LocalPlayer.Character.Humanoid.WalkSpeed = Value
	end    
})

TabPlayer:AddSlider({
	Name = "JumpPower",
	Min = 0,
	Max = 500,
	Default = Players.LocalPlayer.Character.Humanoid.JumpPower,
	Increment = 1,
	Callback = function(Value)
		Players.LocalPlayer.Character.Humanoid.JumpPower = Value
	end    
})
