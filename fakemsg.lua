-- fake messager lmao


if game:GetService("TextChatService").ChatVersion == Enum.ChatVersion.LegacyChatService then
	local CoreGui = game:GetService("StarterGui")

	CoreGui:SetCore("SendNotification", {
		Title = "error";
		Text = "legacy chat detected! please use this in a game with the new chat service!";
		Duration = 5;
	})
	return
end

-- Instances:
local Converted = {
	["_Fakemsg"] = Instance.new("ScreenGui");
	["_Frame"] = Instance.new("Frame");
	["_User"] = Instance.new("TextBox");
	["_UICorner"] = Instance.new("UICorner");
	["_Tx"] = Instance.new("TextBox");
	["_UICorner1"] = Instance.new("UICorner");
	["_TextButton"] = Instance.new("TextButton");
	["_LocalScript"] = Instance.new("LocalScript");
	["_UICorner2"] = Instance.new("UICorner");
	["_UICorner3"] = Instance.new("UICorner");
	["_TextLabel"] = Instance.new("TextLabel");
	["_IsVerif"] = Instance.new("TextButton");
	["_UICorner4"] = Instance.new("UICorner");
	["_ImageLabel"] = Instance.new("ImageLabel");
	["_LocalScript1"] = Instance.new("LocalScript");
}

-- Properties:
Converted["_Fakemsg"].DisplayOrder = 999999999
Converted["_Fakemsg"].IgnoreGuiInset = true
Converted["_Fakemsg"].ScreenInsets = Enum.ScreenInsets.DeviceSafeInsets
Converted["_Fakemsg"].ResetOnSpawn = false
Converted["_Fakemsg"].ZIndexBehavior = Enum.ZIndexBehavior.Sibling
Converted["_Fakemsg"].Name = "Fakemsg"
Converted["_Fakemsg"].Parent = game:GetService("CoreGui")

Converted["_Frame"].Active = true
Converted["_Frame"].BackgroundColor3 = Color3.fromRGB(0, 0, 0)
Converted["_Frame"].BackgroundTransparency = 0.30000001192092896
Converted["_Frame"].BorderColor3 = Color3.fromRGB(0, 0, 0)
Converted["_Frame"].BorderSizePixel = 0
Converted["_Frame"].Position = UDim2.new(0.332244903, 0, 0.351491481, 0)
Converted["_Frame"].Size = UDim2.new(0, 235, 0, 348)
Converted["_Frame"].Parent = Converted["_Fakemsg"]

Converted["_User"].ClearTextOnFocus = false
Converted["_User"].CursorPosition = -1
Converted["_User"].Font = Enum.Font.SourceSans
Converted["_User"].PlaceholderText = "Name"
Converted["_User"].Text = ""
Converted["_User"].TextColor3 = Color3.fromRGB(0, 0, 0)
Converted["_User"].TextScaled = true
Converted["_User"].TextSize = 14
Converted["_User"].TextWrapped = true
Converted["_User"].BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Converted["_User"].BorderColor3 = Color3.fromRGB(0, 0, 0)
Converted["_User"].BorderSizePixel = 0
Converted["_User"].Position = UDim2.new(0.063043341, 0, 0.339788854, 0)
Converted["_User"].Size = UDim2.new(0, 200, 0, 50)
Converted["_User"].Name = "User"
Converted["_User"].Parent = Converted["_Frame"]

Converted["_UICorner"].Parent = Converted["_User"]

Converted["_Tx"].ClearTextOnFocus = false
Converted["_Tx"].CursorPosition = -1
Converted["_Tx"].Font = Enum.Font.SourceSans
Converted["_Tx"].PlaceholderText = "Message"
Converted["_Tx"].Text = ""
Converted["_Tx"].TextColor3 = Color3.fromRGB(0, 0, 0)
Converted["_Tx"].TextScaled = true
Converted["_Tx"].TextSize = 14
Converted["_Tx"].TextWrapped = true
Converted["_Tx"].BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Converted["_Tx"].BorderColor3 = Color3.fromRGB(0, 0, 0)
Converted["_Tx"].BorderSizePixel = 0
Converted["_Tx"].Position = UDim2.new(0.0715539828, 0, 0.178668931, 0)
Converted["_Tx"].Size = UDim2.new(0, 200, 0, 50)
Converted["_Tx"].Name = "Tx"
Converted["_Tx"].Parent = Converted["_Frame"]

Converted["_UICorner1"].Parent = Converted["_Tx"]

Converted["_TextButton"].Font = Enum.Font.SourceSans
Converted["_TextButton"].Text = "Send"
Converted["_TextButton"].TextColor3 = Color3.fromRGB(0, 0, 0)
Converted["_TextButton"].TextScaled = true
Converted["_TextButton"].TextSize = 14
Converted["_TextButton"].TextWrapped = true
Converted["_TextButton"].BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Converted["_TextButton"].BorderColor3 = Color3.fromRGB(0, 0, 0)
Converted["_TextButton"].BorderSizePixel = 0
Converted["_TextButton"].Position = UDim2.new(0.0566515326, 0, 0.804953039, 0)
Converted["_TextButton"].Size = UDim2.new(0, 200, 0, 50)
Converted["_TextButton"].Parent = Converted["_Frame"]

Converted["_UICorner2"].Parent = Converted["_TextButton"]

Converted["_UICorner3"].Parent = Converted["_Frame"]

Converted["_TextLabel"].Font = Enum.Font.SourceSans
Converted["_TextLabel"].Text = "fake msg generator"
Converted["_TextLabel"].TextColor3 = Color3.fromRGB(255, 255, 255)
Converted["_TextLabel"].TextScaled = true
Converted["_TextLabel"].TextSize = 14
Converted["_TextLabel"].TextWrapped = true
Converted["_TextLabel"].BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Converted["_TextLabel"].BackgroundTransparency = 1
Converted["_TextLabel"].BorderColor3 = Color3.fromRGB(0, 0, 0)
Converted["_TextLabel"].BorderSizePixel = 0
Converted["_TextLabel"].Position = UDim2.new(0.012765957, 0, 0, 0)
Converted["_TextLabel"].Size = UDim2.new(0, 228, 0, 61)
Converted["_TextLabel"].Parent = Converted["_Frame"]

Converted["_IsVerif"].Font = Enum.Font.SourceSans
Converted["_IsVerif"].Text = "Verified: False"
Converted["_IsVerif"].TextColor3 = Color3.fromRGB(0, 0, 0)
Converted["_IsVerif"].TextScaled = true
Converted["_IsVerif"].TextSize = 14
Converted["_IsVerif"].TextWrapped = true
Converted["_IsVerif"].BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Converted["_IsVerif"].BorderColor3 = Color3.fromRGB(0, 0, 0)
Converted["_IsVerif"].BorderSizePixel = 0
Converted["_IsVerif"].Position = UDim2.new(0.0566515326, 0, 0.506102443, 0)
Converted["_IsVerif"].Size = UDim2.new(0, 200, 0, 50)
Converted["_IsVerif"].Name = "IsVerif"
Converted["_IsVerif"].Parent = Converted["_Frame"]

Converted["_UICorner4"].Parent = Converted["_IsVerif"]

Converted["_ImageLabel"].Image = "rbxassetid://114119543693280"
Converted["_ImageLabel"].BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Converted["_ImageLabel"].BackgroundTransparency = 1
Converted["_ImageLabel"].BorderColor3 = Color3.fromRGB(0, 0, 0)
Converted["_ImageLabel"].BorderSizePixel = 0
Converted["_ImageLabel"].Position = UDim2.new(0.859574497, 0, -0.160977066, 0)
Converted["_ImageLabel"].Rotation = 6
Converted["_ImageLabel"].Size = UDim2.new(0, 82, 0, 82)
Converted["_ImageLabel"].ZIndex = -2
Converted["_ImageLabel"].Parent = Converted["_Frame"]

-- Fake Module Scripts:

local fake_module_scripts = {}


-- Fake Local Scripts:

local function PVNPNFB_fake_script() -- Fake Script: StarterGui.Fakemsg.Frame.TextButton.LocalScript
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

	local verf = false
	
	script.Parent.MouseButton1Click:Connect(function()
		local username = script.Parent.Parent.User.Text
		local message = script.Parent.Parent.Tx.Text
	
		if verf then
			username = username .. ""
		end
	
		game:GetService("TextChatService").TextChannels.RBXSystem:DisplaySystemMessage(
			'<font color="rgb(150,150,150)">' .. username .. ':</font> <font color="rgb(255, 255, 255)">' .. message .. '</font>'
		)
	end)
	
	script.Parent.Parent.IsVerif.MouseButton1Click:Connect(function()
		verf = not verf
		script.Parent.Parent.IsVerif.Text = "Verified: " .. tostring(verf)
	end)
	
end
local function DNOQBVB_fake_script() -- Fake Script: StarterGui.Fakemsg.Frame.LocalScript
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

	script.Parent.Draggable = true
end

coroutine.wrap(PVNPNFB_fake_script)()
coroutine.wrap(DNOQBVB_fake_script)()
