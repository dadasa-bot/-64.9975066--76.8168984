local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local CoreGui = game:GetService("CoreGui")
local LocalPlayer = Players.LocalPlayer

-- Protection function
local function protectGui(gui)
    -- Monitor deletion
    gui.AncestryChanged:Connect(function(child, parent)
        if not gui:IsDescendantOf(CoreGui) then
            print("[!] GUI removed! Restoring...")
            gui:Destroy()
            task.wait(0.1)
            createGui() -- Recreate it
        end
    end)
end

-- GUI creation function
function createGui()
    local screenGui = Instance.new("ScreenGui")
    screenGui.Name = "ProtectedUI_" .. tostring(math.random(1000, 9999))
    screenGui.ResetOnSpawn = false
    screenGui.IgnoreGuiInset = true
    screenGui.Parent = CoreGui

    local btn = Instance.new("TextButton")
    btn.Name = "ClickMe"
    btn.Text = "Click Me"
    btn.Size = UDim2.new(0, 120, 0, 40)
    btn.Position = UDim2.new(0, 30, 0, 30)
    btn.BackgroundColor3 = Color3.fromRGB(255, 40, 40)
    btn.TextColor3 = Color3.fromRGB(0, 0, 0)
    btn.Font = Enum.Font.PressStart2P
    btn.TextScaled = true
    btn.Active = true
    btn.Draggable = true
    btn.Parent = screenGui

    local corner = Instance.new("UICorner", btn)
    corner.CornerRadius = UDim.new(0, 10)

    btn.MouseButton1Click:Connect(function()
        print("[UI] Button Clicked! Random ID:", math.random(1000, 9999))
    end)

    -- Protect the GUI
    protectGui(screenGui)
end

-- Run GUI creation
createGui()

-- Print activity for visibility
RunService.Heartbeat:Connect(function()
    print("[Heartbeat] GUI is running...")
end)
