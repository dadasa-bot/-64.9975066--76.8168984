-- Obfuscated variable names
local a1 = game:GetService("Players")
local a2 = game:GetService("RunService")
local a3 = game:GetService("CoreGui")
local a4 = a1.LocalPlayer

-- Minecraft-style font: Arcade
local mcFont = Enum.Font.Arcade

-- Function to create GUI
local function zx7()
    local g = Instance.new("ScreenGui")
    g.Name = "UI_" .. tostring(math.random(1000, 9999))
    g.IgnoreGuiInset = true
    g.ResetOnSpawn = false
    g.Parent = a3

    local b = Instance.new("TextButton")
    b.Name = "xBtn"
    b.Text = "Click Me"
    b.Size = UDim2.new(0, 120, 0, 40)
    b.Position = UDim2.new(0, 30, 0, 30)
    b.BackgroundColor3 = Color3.fromRGB(255, 40, 40)
    b.TextColor3 = Color3.fromRGB(0, 0, 0)
    b.Font = mcFont
    b.TextScaled = true
    b.Active = true
    b.Draggable = true
    b.Parent = g

    local c = Instance.new("UICorner", b)
    c.CornerRadius = UDim.new(0, 10)

    b.MouseButton1Click:Connect(function()
        print("[UI] Button clicked! RNG:", math.random(1, 9999))
    end)

    -- Anti-removal: recreate if deleted
    g.AncestryChanged:Connect(function(_, parent)
        if not g:IsDescendantOf(a3) then
            print("[!] GUI removed! Reinstating...")
            g:Destroy()
            task.wait(0.1)
            zx7()
        end
    end)

    return g
end

-- Run GUI creation
local mainGui = zx7()

-- Toggle GUI with RightShift
local uis = game:GetService("UserInputService")
uis.InputBegan:Connect(function(input, gpe)
    if not gpe and input.KeyCode == Enum.KeyCode.RightShift then
        mainGui.Enabled = not mainGui.Enabled
        print("[Toggle] GUI is now", mainGui.Enabled and "Visible" or "Hidden")
    end
end)

-- Heartbeat logging
a2.Heartbeat:Connect(function()
    print("[Heartbeat] GUI active...")
end)

-- Attempt to detect DevConsole usage (very limited)
pcall(function()
    local dev = a4:WaitForChild("PlayerGui"):FindFirstChild("DevConsole")
    if dev then
        dev:GetPropertyChangedSignal("Visible"):Connect(function()
            if dev.Visible then
                warn("[!] Dev Console opened!")
            end
        end)
    end
end)
