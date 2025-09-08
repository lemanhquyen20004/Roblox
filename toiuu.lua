-- ⚡ Full Effect Remover + Fast Mode (Blox Fruits Optimizer)
local lighting = game:GetService("Lighting")
local workspace = game:GetService("Workspace")
local players = game:GetService("Players")
local localPlayer = players.LocalPlayer
local ReplicatedStorage = game:GetService("ReplicatedStorage")

-- 1. Xóa hiệu ứng ánh sáng
for _, v in pairs(lighting:GetChildren()) do
    if v:IsA("PostEffect") or v:IsA("BlurEffect") or v:IsA("SunRaysEffect") 
    or v:IsA("BloomEffect") or v:IsA("ColorCorrectionEffect") then
        v:Destroy()
    end
end

-- 2. Hàm xóa hiệu ứng trong map
local function removeEffects(obj)
    for _, v in pairs(obj:GetDescendants()) do
        if v:IsA("ParticleEmitter") or v:IsA("Trail") or v:IsA("Smoke") 
        or v:IsA("Fire") or v:IsA("Beam") or v:IsA("Explosion") 
        or v:IsA("Sparkles") or v:IsA("SurfaceLight") or v:IsA("PointLight") 
        or v:IsA("SpotLight") or v:IsA("Decal") or v:IsA("Texture") then
            v:Destroy()
        end
    end
end

-- 3. Xóa hiệu ứng ban đầu
removeEffects(workspace)

-- 4. Tự động xóa hiệu ứng mới sinh ra
workspace.DescendantAdded:Connect(function(v)
    if v:IsA("ParticleEmitter") or v:IsA("Trail") or v:IsA("Smoke") 
    or v:IsA("Fire") or v:IsA("Beam") or v:IsA("Explosion") 
    or v:IsA("Sparkles") or v:IsA("SurfaceLight") or v:IsA("PointLight") 
    or v:IsA("SpotLight") or v:IsA("Decal") or v:IsA("Texture") then
        v:Destroy()
    end
end)

-- 5. Bật Fast Mode Blox Fruits
local success, err = pcall(function()
    if ReplicatedStorage:FindFirstChild("Remotes") and ReplicatedStorage.Remotes:FindFirstChild("CommF_") then
        ReplicatedStorage.Remotes.CommF_:InvokeServer("Fast")
    end
end)

-- 6. Thông báo
game:GetService("StarterGui"):SetCore("SendNotification", {
    Title = "Blox Fruits Optimizer",
    Text = "❌ Toàn bộ hiệu ứng đã bị xóa! 🚀 Fast Mode đã bật!",
    Duration = 5
})
