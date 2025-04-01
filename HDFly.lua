-- perfect replication of HD Admin's fly --


-- HD Flying Script v4.0

local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")
local ContextActionService = game:GetService("ContextActionService")

-- **CONFIGURATION**
local FLY_KEY = Enum.KeyCode.F          -- Toggle flight key
local BASE_SPEED = 50                   -- Normal speed
local BOOST_SPEED = 100                 -- Speed when holding Shift
local ROTATION_SPEED = 30               -- How fast you turn (higher = snappier)
local MOMENTUM_SMOOTHING = 0.85         -- 0 = instant stop, 1 = never stops (0.85 is smooth)
local FLY_ANIMATION_ID = "rbxassetid://3541044388"  -- Flying animation (optional)

-- Player setup
local player = Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local humanoid = character:WaitForChild("Humanoid")
local rootPart = character:WaitForChild("HumanoidRootPart")

-- State variables
local flying = false
local flyAnim = nil
local flyBV = nil
local flyBG = nil
local shiftLock = false
local currentSpeed = BASE_SPEED
local currentVelocity = Vector3.new(0, 0, 0)

-- Input states
local input = {
    forward = 0,
    backward = 0,
    left = 0,
    right = 0,
    up = 0,
    down = 0,
    boost = 0
}

-- **SETUP ANIMATION**
local function setupAnimation()
    if not flyAnim then
        flyAnim = Instance.new("Animation")
        flyAnim.AnimationId = FLY_ANIMATION_ID
        flyAnim = humanoid:LoadAnimation(flyAnim)
    end
end

-- **SHIFT-LOCK DETECTION**
local function onShiftLock(actionName, inputState, inputObj)
    shiftLock = inputState == Enum.UserInputState.Begin
end
ContextActionService:BindAction("ShiftLockDetector", onShiftLock, false, Enum.KeyCode.LeftShift)

-- **ENABLE FLIGHT**
local function enableFlight()
    flying = true
    humanoid.PlatformStand = true
    
    -- **PHYSICS CONTROLLERS**
    flyBV = Instance.new("BodyVelocity")
    flyBV.Name = "FlyBV"
    flyBV.Velocity = Vector3.new(0, 0, 0)
    flyBV.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
    flyBV.P = 10000
    flyBV.Parent = rootPart
    
    flyBG = Instance.new("BodyGyro")
    flyBG.Name = "FlyBG"
    flyBG.MaxTorque = Vector3.new(math.huge, math.huge, math.huge)
    flyBG.P = 20000  -- Faster rotation response
    flyBG.D = 1000   -- Prevents overshooting
    flyBG.Parent = rootPart
    
    -- Play flying animation (optional)
    setupAnimation()
    if flyAnim then flyAnim:Play() end
end

-- **DISABLE FLIGHT**
local function disableFlight()
    flying = false
    humanoid.PlatformStand = false
    
    -- Clean up physics
    if flyBV then flyBV:Destroy() end
    if flyBG then flyBG:Destroy() end
    
    -- Stop animation
    if flyAnim then flyAnim:Stop() end
end

-- **TOGGLE FLIGHT**
local function toggleFlight()
    if flying then
        disableFlight()
    else
        enableFlight()
    end
end

-- **INPUT HANDLING**
local function handleInput(inputObj, gameProcessed)
    if gameProcessed then return end
    
    if inputObj.KeyCode == FLY_KEY then
        toggleFlight()
    end
    
    if not flying then return end
    
    if inputObj.KeyCode == Enum.KeyCode.W then
        input.forward = 1
    elseif inputObj.KeyCode == Enum.KeyCode.S then
        input.backward = 1
    elseif inputObj.KeyCode == Enum.KeyCode.A then
        input.left = 1
    elseif inputObj.KeyCode == Enum.KeyCode.D then
        input.right = 1
    elseif inputObj.KeyCode == Enum.KeyCode.Space then
        input.up = 1
    elseif inputObj.KeyCode == Enum.KeyCode.LeftControl then
        input.down = 1
    elseif inputObj.KeyCode == Enum.KeyCode.LeftShift then
        input.boost = 1
        currentSpeed = BOOST_SPEED
    end
end

local function handleInputEnd(inputObj)
    if not flying then return end
    
    if inputObj.KeyCode == Enum.KeyCode.W then
        input.forward = 0
    elseif inputObj.KeyCode == Enum.KeyCode.S then
        input.backward = 0
    elseif inputObj.KeyCode == Enum.KeyCode.A then
        input.left = 0
    elseif inputObj.KeyCode == Enum.KeyCode.D then
        input.right = 0
    elseif inputObj.KeyCode == Enum.KeyCode.Space then
        input.up = 0
    elseif inputObj.KeyCode == Enum.KeyCode.LeftControl then
        input.down = 0
    elseif inputObj.KeyCode == Enum.KeyCode.LeftShift then
        input.boost = 0
        currentSpeed = BASE_SPEED
    end
end

UserInputService.InputBegan:Connect(handleInput)
UserInputService.InputEnded:Connect(handleInputEnd)

-- **SMOOTH MOVEMENT CALCULATION**
local function calculateMovement(deltaTime)
    if not flying or not flyBV then return Vector3.new(0, 0, 0) end
    
    local camera = workspace.CurrentCamera
    local forward = camera.CFrame.LookVector * (input.forward - input.backward)
    local right = camera.CFrame.RightVector * (input.right - input.left)
    local up = Vector3.new(0, 1, 0) * (input.up - input.down)
    
    local targetDirection = (forward + right + up)
    if targetDirection.Magnitude > 0 then
        targetDirection = targetDirection.Unit
    end
    
    -- **SMOOTH MOMENTUM EFFECT**
    local targetVelocity = targetDirection * currentSpeed
    currentVelocity = currentVelocity:Lerp(targetVelocity, 1 - MOMENTUM_SMOOTHING)
    
    return currentVelocity
end

-- **INSTANT ROTATION UPDATE**
local function updateRotation()
    if not flying or not flyBG then return end
    
    local camera = workspace.CurrentCamera
    
    if shiftLock then
        -- **Shift-lock mode: Only rotate horizontally**
        local lookVector = camera.CFrame.LookVector
        flyBG.CFrame = CFrame.new(rootPart.Position, rootPart.Position + Vector3.new(lookVector.X, 0, lookVector.Z))
    else
        -- **Normal mode: Match camera rotation exactly**
        flyBG.CFrame = CFrame.new(rootPart.Position) * (camera.CFrame - camera.CFrame.Position)
    end
end

-- **MAIN FLIGHT LOOP**
RunService.Heartbeat:Connect(function(deltaTime)
    if not flying or not rootPart or not humanoid or humanoid.Health <= 0 then
        if flying then disableFlight() end
        return
    end
    
    -- **Apply smooth movement with momentum**
    flyBV.Velocity = calculateMovement(deltaTime)
    
    -- **Update rotation instantly**
    updateRotation()
end)

-- **HANDLE CHARACTER RESPAWN**
player.CharacterAdded:Connect(function(newCharacter)
    character = newCharacter
    humanoid = character:WaitForChild("Humanoid")
    rootPart = character:WaitForChild("HumanoidRootPart")
    
    if flying then disableFlight() end
end)

-- **CLEANUP**
script.Destroying:Connect(function()
    ContextActionService:UnbindAction("ShiftLockDetector")
    if flying then disableFlight() end
end)
