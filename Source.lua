-- Roblox GUI Script (LocalScript)
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer

-- UI Setup
local ScreenGui = Instance.new("ScreenGui", LocalPlayer:WaitForChild("PlayerGui"))
ScreenGui.Name = "BloxFruitsScriptUI"

-- Main Frame
local mainFrame = Instance.new("Frame", ScreenGui)
mainFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 30) -- qoramtir
mainFrame.Size = UDim2.new(0, 250, 0, 300)
mainFrame.Position = UDim2.new(0, 10, 0.5, -150)
mainFrame.BorderSizePixel = 0

-- UIListLayout for spacing
local layout = Instance.new("UIListLayout", mainFrame)
layout.Padding = UDim.new(0, 6)
layout.FillDirection = Enum.FillDirection.Vertical
layout.HorizontalAlignment = Enum.HorizontalAlignment.Center
layout.VerticalAlignment = Enum.VerticalAlignment.Top

-- Button Creation Function
local function createButton(name, onClick)
    local btn = Instance.new("TextButton")
    btn.Size = UDim2.new(0, 230, 0, 40)
    btn.BackgroundColor3 = Color3.fromRGB(0, 0, 0) -- qora
    btn.Text = name
    btn.TextColor3 = Color3.fromRGB(255, 255, 255)
    btn.Font = Enum.Font.GothamBold
    btn.TextSize = 16
    btn.BorderSizePixel = 0

    -- Hover / Click effect
    btn.MouseEnter:Connect(function()
        btn.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
    end)
    btn.MouseLeave:Connect(function()
        btn.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
    end)
    btn.MouseButton1Down:Connect(function()
        btn.BackgroundColor3 = Color3.fromRGB(80, 180, 255) -- light blue
        if onClick then onClick() end
    end)
    btn.MouseButton1Up:Connect(function()
        btn.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
    end)

    return btn
end

-- PvP Button
mainFrame:AddChild(createButton("PvP", function()
    print("PvP menu opened.")
end))

-- Auto Combo Button
mainFrame:AddChild(createButton("Auto Combo", function()
    warn("⚠️ Coming Soon...")
end))

-- Settings Button
mainFrame:AddChild(createButton("Settings", function()
    print("Settings menu opened.")
end))

-- Status Button (players list with distance and HP)
mainFrame:AddChild(createButton("Status", function()
    for _, player in ipairs(Players:GetPlayers()) do
        if player ~= LocalPlayer and player.Character and player.Character:FindFirstChild("Humanoid") and player.Character:FindFirstChild("HumanoidRootPart") then
            local dist = (player.Character.HumanoidRootPart.Position - LocalPlayer.Character.HumanoidRootPart.Position).Magnitude
            local health = player.Character.Humanoid.Health
            print(string.format("Name: %s | Health: %d | Distance: %.1f", player.Name, health, dist))
        end
    end
end))
