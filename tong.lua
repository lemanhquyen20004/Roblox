-- ⚡ Loader Script cho toiuu.lua + bloxfruits.lua

local function safeLoad(url)
    local success, result = pcall(function()
        return loadstring(game:HttpGet(url))()
    end)
    if not success then
        warn("❌ Lỗi khi load script từ: " .. url .. " | " .. tostring(result))
    else
        print("✅ Load thành công: " .. url)
    end
end

-- Tải script tối ưu
safeLoad("https://raw.githubusercontent.com/lemanhquyen20004/Roblox/main/toiuu.lua")

-- Tải script Blox Fruits
safeLoad("https://raw.githubusercontent.com/lemanhquyen20004/Roblox/main/bloxfruits.lua")

-- Thông báo trong Roblox
game:GetService("StarterGui"):SetCore("SendNotification", {
    Title = "Blox Fruits Loader",
    Text = "🚀 Đã chạy toiuu.lua + bloxfruits.lua thành công!",
    Duration = 6
})
