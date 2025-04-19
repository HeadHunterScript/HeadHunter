local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local RunService = game:GetService("RunService")

local Target = nil
local AimbotEnabled = true

local function getTarget()
    local closest = nil
    local closestDistance = math.huge

    for _, player in pairs(Players:GetPlayers()) do
        if player ~= LocalPlayer and player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
            local pvp = player:FindFirstChild("PVPActive")
            if pvp and pvp.Value == true then
                local distance = (LocalPlayer.Character.HumanoidRootPart.Position - player.Character.HumanoidRootPart.Position).Magnitude
                local hp = player.Character:FindFirstChild("Humanoid") and player.Character.Humanoid.Health or 0

                if distance < closestDistance and hp > 0 then
                    closest = player
                    closestDistance = distance
                end
            end
        end
    end

    return closest
end

RunService.RenderStepped:Connect(function()
    if not AimbotEnabled then return end

    Target = getTarget()
    if Target and Target.Character and Target.Character:FindFirstChild("HumanoidRootPart") then
        local aimPos = Target.Character.HumanoidRootPart.Position
        print("Target position:", aimPos)
    end
end)
