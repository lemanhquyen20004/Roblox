-- Discord Webhook
local webhook = "https://discord.com/api/webhooks/1414651494690721822/1mOWJeNpiqvgOhrXBLRHSG31L9PRu43JwepIawot0lVUaIDblsK_ZSW4o58mUpbLKofX"

local HttpService = game:GetService("HttpService")
local Players = game:GetService("Players")
local player = Players.LocalPlayer
local backpack = player:WaitForChild("Backpack")
local StarterGui = game:GetService("StarterGui")

-- Thông báo script chạy thành công trong Roblox
StarterGui:SetCore("SendNotification", {
    Title = "Blox Fruits Notifier",
    Text = "Script đã chạy thành công!",
    Duration = 5,
})

-- Lưu trái đã có
local knownFruits = {}

-- Map tên trái → URL hình
local fruitImages = {
    ["Spike"] = "https://static.wikia.nocookie.net/roblox-blox-piece/images/c/ce/Spike_Fruit.png",
    ["Bomb"] = "https://static.wikia.nocookie.net/roblox-blox-piece/images/4/43/Bomb_Fruit.png",
    ["Spring"] = "https://static.wikia.nocookie.net/roblox-blox-piece/images/8/8a/Spring_Fruit.png",
    ["Blade"] = "https://static.wikia.nocookie.net/roblox-blox-piece/images/0/01/Blade_Fruit.png",
    ["Spin"] = "https://static.wikia.nocookie.net/roblox-blox-piece/images/8/88/Spin_Fruit.png",
    ["Pain"] = "https://static.wikia.nocookie.net/roblox-blox-piece/images/4/40/Pain_Fruit.png",
    ["Portal"] = "https://static.wikia.nocookie.net/roblox-blox-piece/images/8/8a/Portal_Fruit.png",
    ["Sound"] = "https://static.wikia.nocookie.net/roblox-blox-piece/images/b/ba/Sound_Fruit.png",
    ["Spider"] = "https://static.wikia.nocookie.net/roblox-blox-piece/images/6/61/Spider_Fruit.png",
    ["Creation"] = "https://static.wikia.nocookie.net/roblox-blox-piece/images/4/44/Creation_Fruit.png",
    ["Love"] = "https://static.wikia.nocookie.net/roblox-blox-piece/images/b/b3/Love_Fruit.png",
    ["Quake"] = "https://static.wikia.nocookie.net/roblox-blox-piece/images/4/42/Quake_Fruit.png",
    ["Ghost"] = "https://static.wikia.nocookie.net/roblox-blox-piece/images/8/8c/Ghost_Fruit.png",
    ["Rubber"] = "https://static.wikia.nocookie.net/roblox-blox-piece/images/5/5c/Rubber_Fruit.png",
    ["Diamond"] = "https://static.wikia.nocookie.net/roblox-blox-piece/images/8/88/Diamond_Fruit.png",
    ["Gravity"] = "https://static.wikia.nocookie.net/roblox-blox-piece/images/5/5f/Gravity_Fruit.png",
    ["Shadow"] = "https://static.wikia.nocookie.net/roblox-blox-piece/images/5/58/Shadow_Fruit.png",
    ["Venom"] = "https://static.wikia.nocookie.net/roblox-blox-piece/images/d/d2/Venom_Fruit.png",
    ["Control"] = "https://static.wikia.nocookie.net/roblox-blox-piece/images/1/19/Control_Fruit.png",
    ["Spirit"] = "https://static.wikia.nocookie.net/roblox-blox-piece/images/6/66/Spirit_Fruit.png",
    ["Smoke"] = "https://static.wikia.nocookie.net/roblox-blox-piece/images/7/7e/Smoke_Fruit.png",
    ["Flame"] = "https://static.wikia.nocookie.net/roblox-blox-piece/images/c/c4/Flame_Fruit.png",
    ["Ice"] = "https://static.wikia.nocookie.net/roblox-blox-piece/images/c/c5/Ice_Fruit.png",
    ["Sand"] = "https://static.wikia.nocookie.net/roblox-blox-piece/images/7/72/Sand_Fruit.png",
    ["Dark"] = "https://static.wikia.nocookie.net/roblox-blox-piece/images/5/5c/Dark_Fruit.png",
    ["Light"] = "https://static.wikia.nocookie.net/roblox-blox-piece/images/8/83/Light_Fruit.png",
    ["Magma"] = "https://static.wikia.nocookie.net/roblox-blox-piece/images/2/27/Magma_Fruit.png",
    ["Lightning"] = "https://static.wikia.nocookie.net/roblox-blox-piece/images/7/78/Lightning_Fruit.png",
    ["Blizzard"] = "https://static.wikia.nocookie.net/roblox-blox-piece/images/c/c9/Blizzard_Fruit.png",
    ["Dough"] = "https://static.wikia.nocookie.net/roblox-blox-piece/images/0/02/Dough_Fruit.png",
    ["Gas"] = "https://static.wikia.nocookie.net/roblox-blox-piece/images/e/ed/Gas_Fruit.png",
    ["Eagle"] = "https://static.wikia.nocookie.net/roblox-blox-piece/images/5/53/Eagle_Fruit.png",
    ["Buddha"] = "https://static.wikia.nocookie.net/roblox-blox-piece/images/d/df/Buddha_Fruit.png",
    ["Phoenix"] = "https://static.wikia.nocookie.net/roblox-blox-piece/images/f/fc/Phoenix_Fruit.png",
    ["Mammoth"] = "https://static.wikia.nocookie.net/roblox-blox-piece/images/9/95/Mammoth_Fruit.png",
    ["T-Rex"] = "https://static.wikia.nocookie.net/roblox-blox-piece/images/d/d9/T-Rex_Fruit.png",
    ["Leopard"] = "https://static.wikia.nocookie.net/roblox-blox-piece/images/a/a3/Leopard_Fruit.png",
    ["Yeti"] = "https://static.wikia.nocookie.net/roblox-blox-piece/images/2/2f/Yeti_Fruit.png",
    ["Kitsune"] = "https://static.wikia.nocookie.net/roblox-blox-piece/images/6/65/Kitsune_Fruit.png",
    ["Dragon"] = "https://static.wikia.nocookie.net/roblox-blox-piece/images/2/29/Dragon_Fruit.png"
}

-- Map tên trái → màu embed theo rarity mới
local fruitColors = {
    -- Common
    ["Rocket"] = 0xb3b3b3,
    ["Spin"] = 0xb3b3b3,
    ["Blade"] = 0xb3b3b3,
    ["Spring"] = 0xb3b3b3,
    ["Bomb"] = 0xb3b3b3,
    ["Smoke"] = 0xb3b3b3,
    ["Spike"] = 0xb3b3b3,

    -- Uncommon
    ["Flame"] = 0x5c8cd3,
    ["Ice"] = 0x5c8cd3,
    ["Sand"] = 0x5c8cd3,
    ["Dark"] = 0x5c8cd3,
    ["Eagle"] = 0x5c8cd3,
    ["Diamond"] = 0x5c8cd3,

    -- Rare
    ["Light"] = 0x7e4ae5,
    ["Rubber"] = 0x7e4ae5,
    ["Ghost"] = 0x7e4ae5,
    ["Magma"] = 0x7e4ae5,

    -- Legendary
    ["Quake"] = 0xd52be4,
    ["Buddha"] = 0xd52be4,
    ["Love"] = 0xd52be4,
    ["Creation"] = 0xd52be4,
    ["Spider"] = 0xd52be4,
    ["Sound"] = 0xd52be4,
    ["Phoenix"] = 0xd52be4,
    ["Portal"] = 0xd52be4,
    ["Lightning"] = 0xd52be4,
    ["Pain"] = 0xd52be4,
    ["Blizzard"] = 0xd52be4,

    -- Mythical
    ["Gravity"] = 0xee2f32,
    ["Mammoth"] = 0xee2f32,
    ["T-Rex"] = 0xee2f32,
    ["Dough"] = 0xee2f32,
    ["Shadow"] = 0xee2f32,
    ["Venom"] = 0xee2f32,
    ["Control"] = 0xee2f32,
    ["Gas"] = 0xee2f32,
    ["Spirit"] = 0xee2f32,
    ["Leopard"] = 0xee2f32,
    ["Yeti"] = 0xee2f32,
    ["Kitsune"] = 0xee2f32,
    ["Dragon"] = 0xee2f32
}

-- Hàm lấy danh sách trái hiện tại
local function getCurrentFruits()
    local fruits = {}
    for f,_ in pairs(knownFruits) do
        table.insert(fruits, f)
    end
    return fruits
end

-- Hàm gửi Discord Embed
local function sendDiscordEmbed(username, currentFruits, newFruit)
    local embed = {
        username = "Blox Fruits Notifier",
        avatar_url = "https://i.pinimg.com/736x/4e/47/64/4e4764ff62ab6d422adc47ec4022b0e3.jpg",
        embeds = {{
            title = "🍍 Trái mới vừa nhận!",
            color = fruitColors[newFruit] or 0x00ff00,
            fields = {
                {name = "👤 User", value = username, inline = false},
                {name = "📦 Trái đang có", value = table.concat(getCurrentFruits(), ", ") or "Không có", inline = false},
                {name = "🎉 Trái mới nhận", value = newFruit, inline = false},
            },
            ["image"] = { ["url"] = fruitImages[newFruit] or "" }, -- <--- sửa ở đây
            footer = {text = "Được giữ bởi Bot LeManhQuyen"},
            timestamp = os.date("!%Y-%m-%dT%H:%M:%SZ")
        }}
    }

    local req = http_request or request or syn.request
    req({
        Url = webhook,
        Method = "POST",
        Headers = {["Content-Type"] = "application/json"},
        Body = HttpService:JSONEncode(embed)
    })
end

-- Check trái đã có từ trước khi script chạy (chỉ lấy trái Blox Fruit)
for _, tool in ipairs(backpack:GetChildren()) do
    if tool:IsA("Tool") and fruitImages[tool.Name] then
        knownFruits[tool.Name] = true
    end
end

-- Khi có trái mới thêm vào Backpack (chỉ trigger khi cất vào và là trái Blox Fruit)
backpack.ChildAdded:Connect(function(child)
    if child:IsA("Tool") then
        local fruitName = child.Name
        if fruitImages[fruitName] and not knownFruits[fruitName] then
            knownFruits[fruitName] = true
            sendDiscordEmbed(player.Name, getCurrentFruits(), fruitName)
        end
    end
end)
