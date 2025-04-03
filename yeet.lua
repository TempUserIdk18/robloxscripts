local lp = game.Players.LocalPlayer
local rs = game:GetService("RunService")
local function gplr(String)
    local Found = {}
    local strl = String:lower()
    if strl == "all" then
        for i,v in pairs(game.Players:GetPlayers()) do
            table.insert(Found,v)
        end
    elseif strl == "others" then
        for i,v in pairs(game.Players:GetPlayers()) do
            if v.Name ~= lp.Name then
                table.insert(Found,v)
            end
        end 
    elseif strl == "me" then
        for i,v in pairs(game.Players:GetPlayers()) do
            if v.Name == lp.Name then
                table.insert(Found,v)
            end
        end 
    else
        for i,v in pairs(game.Players:GetPlayers()) do
            if v.Name:lower():sub(1, #String) == String:lower() then
                table.insert(Found,v)
            end
        end 
    end
    return Found 
end

local function notif(str,dur)
    game.StarterGui:SetCore("SendNotification", {
        Title = "yeet gui",
        Text = str,
        Icon = "rbxassetid://2005276185",
        Duration = dur or 3
    })
end

--// GUI Setup
local h = Instance.new("ScreenGui")
local Main = Instance.new("ImageLabel")
local Top = Instance.new("Frame")
local Title = Instance.new("TextLabel")
local TextBox = Instance.new("TextBox")
local TextButton = Instance.new("TextButton")

h.Name = "h"
h.Parent = game:GetService("CoreGui")
h.ResetOnSpawn = false

Main.Name = "Main"
Main.Parent = h
Main.Active = true
Main.Draggable = true
Main.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Main.BorderSizePixel = 0
Main.Position = UDim2.new(0.174545452, 0, 0.459574461, 0)
Main.Size = UDim2.new(0, 454, 0, 218)
Main.Image = "rbxassetid://2005276185"

Top.Name = "Top"
Top.Parent = Main
Top.BackgroundColor3 = Color3.fromRGB(57,57,57)
Top.BorderSizePixel = 0
Top.Size = UDim2.new(0, 454, 0, 44)

Title.Name = "Title"
Title.Parent = Top
Title.BackgroundColor3 = Color3.fromRGB(49, 49, 49)
Title.BorderSizePixel = 0
Title.Position = UDim2.new(0, 0, 0.295454562, 0)
Title.Size = UDim2.new(0, 454, 0, 30)
Title.Font = Enum.Font.SourceSans
Title.Text = "FE Yeet Gui v2 (trollface edition)"
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.TextScaled = true
Title.TextSize = 14.000
Title.TextWrapped = true

TextBox.Parent = Main
TextBox.BackgroundColor3 = Color3.fromRGB(49, 49, 49)
TextBox.BorderSizePixel = 0
TextBox.Position = UDim2.new(0.0704845786, 0, 0.270642221, 0)
TextBox.Size = UDim2.new(0, 388, 0, 62)
TextBox.Font = Enum.Font.SourceSans
TextBox.PlaceholderText = "Who do i destroy(can be shortened)"
TextBox.Text = ""
TextBox.TextColor3 = Color3.fromRGB(255, 255, 255)
TextBox.TextScaled = true
TextBox.TextSize = 14.000
TextBox.TextWrapped = true

TextButton.Parent = Main
TextButton.BackgroundColor3 = Color3.fromRGB(49, 49, 49)
TextButton.BorderSizePixel = 0
TextButton.Position = UDim2.new(0.10352423, 0, 0.596330225, 0)
TextButton.Size = UDim2.new(0, 359, 0, 50)
TextButton.Font = Enum.Font.SourceSans
TextButton.Text = "Cheese em'"
TextButton.TextColor3 = Color3.fromRGB(255, 255, 255)
TextButton.TextScaled = true
TextButton.TextSize = 14.000
TextButton.TextWrapped = true

TextButton.MouseButton1Click:Connect(function()
    local Target = gplr(TextBox.Text)
    if Target[1] then
        Target = Target[1]
        
        local humanoidRootPart = lp.Character and lp.Character:FindFirstChild("HumanoidRootPart")
        local targetHRP = Target.Character and Target.Character:FindFirstChild("HumanoidRootPart")
        
        if humanoidRootPart and targetHRP then
            for _,v in pairs(humanoidRootPart:GetChildren()) do
                if v:IsA("BodyVelocity") or v:IsA("BodyAngularVelocity") then
                    v:Destroy()
                end
            end

            local yeetForce = Instance.new("BodyVelocity")
            yeetForce.Parent = humanoidRootPart
            yeetForce.MaxForce = Vector3.new(math.huge, math.huge, math.huge)

            local spinForce = Instance.new("BodyAngularVelocity")
            spinForce.Parent = humanoidRootPart
            spinForce.MaxTorque = Vector3.new(math.huge, math.huge, math.huge)
            spinForce.AngularVelocity = Vector3.new(100000, 100000, 100000) -- Extreme spin
            
            local connection
            connection = rs.Heartbeat:Connect(function()
                if not Target.Character or not humanoidRootPart or not targetHRP then
                    yeetForce:Destroy()
                    spinForce:Destroy()
                    connection:Disconnect()
					
                    return
                end
                

                humanoidRootPart.CFrame = targetHRP.CFrame
                

                yeetForce.Velocity = Vector3.new(
                    math.random(-25000, 25000),
                    math.random(5000, 25000),
                    math.random(-25000, 25000)
                )
                

                if math.random(0.1,1) < 0.1 then
                    humanoidRootPart.Velocity = Vector3.new(0, 50000, 0)
                end
            end)
            

            delay(8, function()
			    if connection then connection:Disconnect() humanoidRootPart.CFrame = targetHRP.CFrame end
                if yeetForce then yeetForce:Destroy() humanoidRootPart.CFrame = targetHRP.CFrame end
                if spinForce then spinForce:Destroy() humanoidRootPart.CFrame = targetHRP.CFrame end
               
            end)
        end
    else
        notif("Invalid player")
    end
end)


notif("Loaded successfully!", 5)
