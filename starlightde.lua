local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()
local virtualInputManager = game:GetService("VirtualInputManager")
local Window = Rayfield:CreateWindow({
   Name = "starlight | Dead Experiment",
   Icon = "star",
   LoadingTitle = "starlight | Dead Experiment",
   LoadingSubtitle = "dead experiment is cool cuz i made it",
   Theme = "Ocean",

   DisableRayfieldPrompts = false,
   DisableBuildWarnings = false,

   ConfigurationSaving = {
      Enabled = false,
      FolderName = nil,
      FileName = "DeadExper"
   },

   Discord = {
      Enabled = false,
      Invite = "noinvitelink",
      RememberJoins = true
   },

   KeySystem = false,
   KeySettings = {
      Title = "Untitled",
      Subtitle = "Key System",
      Note = "No method of obtaining the key is provided",
      FileName = "Key",
      SaveKey = true,
      GrabKeyFromSite = false,
      Key = {"Hello"}
   }
})

-- // Spawner Tab
local obj = "Chair"
local bagV = 1
local Tab = Window:CreateTab("Spawner", "rewind")
Tab:CreateSection("Object Spawner")

local Dropdown = Tab:CreateDropdown({
   Name = "Object to spawn",
   Options = {"Chair", "MetalSheet", "Coal", "Gold", "bandg", "Diamond", "flashligh", "ClassicSword"},
   CurrentOption = "Chair",
   MultipleOptions = false,
   Flag = "Dropdown1",
   Callback = function(selected)
      local chosen = typeof(selected) == "table" and selected[1] or selected
      print("selected:", chosen)
      obj = tostring(chosen)
   end,
})

Tab:CreateButton({
   Name = "Spawn Object",
   Callback = function()
      print("spawning obj:", obj)
      local rs = game:GetService("ReplicatedStorage")
      local remote = rs:FindFirstChild("SpawnObject")
      if remote and remote:IsA("RemoteEvent") then
         remote:FireServer(obj)
      else
         warn("SpawnObject RemoteEvent not found in ReplicatedStorage")
      end
   end,
})

Tab:CreateSection("Money Bag Spawner")

local Slider = Tab:CreateSlider({
   Name = "Money Bag Value",
   Range = {1, 999999},
   Increment = 1,
   Suffix = "Value",
   CurrentValue = 1,
   Flag = "Slider1",
   Callback = function(Value)
      bagV = Value
   end,
})

Tab:CreateButton({
   Name = "Spawn Money Bag",
   Callback = function()
      local rs = game:GetService("ReplicatedStorage")
      local remote = rs:FindFirstChild("SpawnBag")
      if remote and remote:IsA("RemoteEvent") then
         remote:FireServer(bagV)
      else
         warn("SpawnBag RemoteEvent not found in ReplicatedStorage")
      end
   end,
})

-- // Items Tab
local ItemsTab = Window:CreateTab("Items", "package")
ItemsTab:CreateSection("Items")

ItemsTab:CreateButton({
   Name = "Bring All Draggable Objects",
   Callback = function()
      local Players = game:GetService("Players")
      local ReplicatedStorage = game:GetService("ReplicatedStorage")
      local localPlr = Players.LocalPlayer
      local char = localPlr.Character or localPlr.CharacterAdded:Wait()
      local hrp = char:WaitForChild("HumanoidRootPart")
      local dragRemote = ReplicatedStorage:WaitForChild("Interaction"):WaitForChild("ClientIsDragging")

      local function requestDrag(part)
         pcall(function()
            dragRemote:FireServer(part)
         end)
      end

      local function bringPartToYou(part)
         part.CFrame = hrp.CFrame
      end

      for _, v in ipairs(workspace:GetDescendants()) do
         if v:IsA("BasePart") and v:FindFirstChild("DraggableItem") then
            requestDrag(v)
            task.delay(0.2, function()
               if v and v.Parent then
                  bringPartToYou(v)
               end
            end)
         end
      end
   end,
})
ItemsTab:CreateButton({
    Name = "Destroy All Parts",
    Callback = function()
        for _, part in ipairs(workspace:GetDescendants()) do
            if part:IsA("BasePart") then
               game.ReplicatedStorage.OnPartHit:FireServer(part)
            end
        end
    end
})

ItemsTab:CreateButton({
    Name = "Give Delete Tool",
    Callback = function()
        local tool = Instance.new("Tool")
        tool.Name = "DeleteTool"
        tool.RequiresHandle = false
        tool.Parent = game.Players.LocalPlayer.Backpack

        local selectionBox = nil
        local confirmGui = nil
        local selectedPart = nil

        local function clearSelection()
            if selectionBox then selectionBox:Destroy() end
            if confirmGui then confirmGui:Destroy() end
            selectionBox = nil
            confirmGui = nil
            selectedPart = nil
        end

        local function Delete(part)
            if part and part:IsA("BasePart") then
               game.ReplicatedStorage.OnPartHit:FireServer(part)
            end
        end

        local function createConfirmGui(part)
        -- simulate key press (T key)
local keyCode = Enum.KeyCode.T

game:GetService("VirtualInputManager"):SendKeyEvent(true, keyCode, false, game)

-- simulate key release (T key)
game:GetService("VirtualInputManager"):SendKeyEvent(false, keyCode, false, game)
            local gui = Instance.new("ScreenGui")
            gui.Name = "ConfirmDeleteScreenGui"
            gui.ResetOnSpawn = false
            gui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
            gui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")

            local btn = Instance.new("TextButton")
            btn.Size = UDim2.new(0, 180, 0, 50)
            btn.Position = UDim2.new(0.5, -90, 0.82, 0)
            btn.Text = "Delete"
            btn.BackgroundColor3 = Color3.fromRGB(35, 200, 100)
            btn.TextColor3 = Color3.new(1, 1, 1)
            btn.Font = Enum.Font.GothamSemibold
            btn.TextScaled = true
            btn.TextSize = 18
            btn.AutoButtonColor = true
            btn.BorderSizePixel = 0
            btn.BackgroundTransparency = 0.05
            btn.Parent = gui

            local corner = Instance.new("UICorner")
            corner.CornerRadius = UDim.new(0, 10)
            corner.Parent = btn

            local stroke = Instance.new("UIStroke")
            stroke.Color = Color3.fromRGB(0, 0, 0)
            stroke.Thickness = 1
            stroke.Transparency = 0.3
            stroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
            stroke.Parent = btn

            btn.MouseButton1Click:Connect(function()
                Delete(part)
                clearSelection()
                game.StarterGui:SetCore("SendNotification", {
                    Title = "Delete Tool",
                    Text = "Deleted!",
                    Duration = 1
                })
                -- simulate key press down


game:GetService("VirtualInputManager"):SendKeyEvent(true, keyCode, false, game)

-- simulate key release (T key)
game:GetService("VirtualInputManager"):SendKeyEvent(false, keyCode, false, game)
            end)

            confirmGui = gui
        end

        local function handleClick()
            if tool.Parent ~= game.Players.LocalPlayer.Character then return end

            local mouse = game.Players.LocalPlayer:GetMouse()
            local target = mouse.Target
            if target and target:IsA("BasePart") and target ~= selectedPart then
                clearSelection()
                selectedPart = target

                selectionBox = Instance.new("SelectionBox")
                selectionBox.Adornee = target
                selectionBox.LineThickness = 0.1
                selectionBox.Color3 = Color3.fromRGB(0, 255, 0)
                selectionBox.Parent = target

                createConfirmGui(target)
            end
        end

        tool.Equipped:Connect(function()
            game.Players.LocalPlayer:GetMouse().Button1Down:Connect(handleClick)
        end)

        tool.Unequipped:Connect(clearSelection)
    end
})

