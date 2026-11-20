
--[[

This File Wasn't Protected By ???
Owner: Techinfied.

]]-- 



local lp = game:GetService("Players").LocalPlayer

if getgenv().antiDeathCounterClean then
    pcall(getgenv().antiDeathCounterClean)
end

local config = {
    enabled = true,
    triggerAnimId = 11343250001,
    voidDistance = -10000,
    platformSize = Vector3.new(10, 1, 10),
    returnDelay = 6,
  }

getgenv().antiDeathCounterClean = config

local state = {
    inVoid = false,
    animConn = nil,
    charConn = nil,
}

local function getRoot()
    local char = lp.Character
    return char and char:FindFirstChild("HumanoidRootPart")
end

local function resetCamera()
    local camera = workspace.CurrentCamera
    local char = lp.Character
    if not camera or not char then return end

    local subject = char:FindFirstChildOfClass("Humanoid") or char:FindFirstChild("HumanoidRootPart")
    if subject then
        camera.CameraSubject = subject
        camera.CameraType = Enum.CameraType.Custom
    end
end

local function escapeToVoid()
    if state.inVoid then return end

    local root = getRoot()
    if not root then return end

    state.inVoid = true
    local originalCFrame = root.CFrame

    local platform = Instance.new("Part")
    platform.Name = "antiDeathPlatform"
    platform.Size = config.platformSize
    platform.Anchored = true
    platform.Transparency = 1
    platform.CanCollide = true
    platform.Position = root.Position + Vector3.new(0, config.voidDistance - config.platformSize.Y / 2, 0)
    platform.Parent = workspace

    root.CFrame = platform.CFrame + Vector3.new(0, 3, 0)

    task.delay(config.returnDelay, function()
        local currentRoot = getRoot()
        if currentRoot then
            currentRoot.CFrame = originalCFrame
        end
        platform:Destroy()
        resetCamera()
        state.inVoid = false
    end)
end

local function hookCharacter(char)
    local humanoid = char:WaitForChild("Humanoid")

    if state.animConn then
        state.animConn:Disconnect()
    end

    state.animConn = humanoid.AnimationPlayed:Connect(function(track)
        if not config.enabled then return end

        local anim = track.Animation
        if not anim then return end

        local animIdNumber = tonumber(anim.AnimationId:match("%d+"))
        if animIdNumber == config.triggerAnimId then
            escapeToVoid()
        end
    end)
end

if lp.Character then
    task.spawn(hookCharacter, lp.Character)
end
state.charConn = lp.CharacterAdded:Connect(hookCharacter)

getgenv().antiDeathCounterClean = function()
    if state.animConn then state.animConn:Disconnect() end
    if state.charConn then state.charConn:Disconnect() end
end