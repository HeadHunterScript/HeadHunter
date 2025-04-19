local LocalPlayer = game.Players.LocalPlayer
local Players = game:GetService("Players")

function GetTargetEnemy()
    local closestEnemy = nil
    local shortestDistance = math.huge
    local lowestHealth = math.huge

    for _, player in pairs(Players:GetPlayers()) do
        if player ~= LocalPlayer and player.Character and player.Character:FindFirstChild("Humanoid") then
            local humanoid = player.Character:FindFirstChild("Humanoid")
            local root = player.Character:FindFirstChild("HumanoidRootPart")
            local myRoot = LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart")

            local isPVPEnabled = player:FindFirstChild("PVP") and player.PVP.Value
            local myPVPEnabled = LocalPlayer:FindFirstChild("PVP") and LocalPlayer.PVP.Value

            local isAlly = player:FindFirstChild("Team") and LocalPlayer:FindFirstChild("Team") and player.Team == LocalPlayer.Team

            if myRoot and root and isPVPEnabled and myPVPEnabled and not isAlly then
                local distance = (myRoot.Position - root.Position).Magnitude
                local health = humanoid.Health / humanoid.MaxHealth -- foiz

                if distance < shortestDistance or (distance <= shortestDistance and health < lowestHealth) then
                    closestEnemy = player
                    shortestDistance = distance
                    lowestHealth = health
                end
            end
        end
    end

    return closestEnemy
end

local target = GetTargetEnemy()
if target and target.Character and target.Character:FindFirstChild("HumanoidRootPart") then
    local targetPos = target.Character.HumanoidRootPart.Position
    print("Nishon:", target.Name, "Joylashuv:", targetPos)
end
