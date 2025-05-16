-- Demonstrate getmetatable:
local meta = {}
local t = setmetatable({}, meta)
print(getmetatable(t) == meta) --> true
meta.__metatable = "protected"
print(getmetatable(t)) --> protected

local coregui = game:GetService("CoreGui")
local players = game:GetService("Players")
local player = players.LocalPlayer
local runservice = game:GetService("RunService")

local screenGui = Instance.new("ScreenGui", coregui)
screenGui.Name = "screenGui"

local btn = Instance.new("TextButton", screenGui)
btn.Name = "btn"
btn.Text = "RobloxTest2"
btn.Size = UDim2.new(0, 120, 0, 40)
btn.Position = UDim2.new(0, 30, 0, 30)
btn.BackgroundColor3 = Color3.fromRGB(255, 40, 40)
btn.TextColor3 = Color3.fromRGB(0, 0 ,0)
btn.Font = Enum.Font.PressStart2P
btn.TextScaled = true
btn.Active = true 
btn.Draggable = true

local uibtn = Instance.new("UICorner", btn)
uibtn.CornerRadius = UDim.new(0, 10)

runservice.Heartbeat:Connect(function()
    for i = 1, 2 do
        print(i)
    end
end)

btn.MouseButton1Click:Connect(function()
    if btn.Text == "RobloxTest2" then
        btn.Text = "On"
    else
        btn.Text = "RobloxTest2"
    end
    print(math.random(0, 1000))
end)
