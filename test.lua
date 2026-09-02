-- =========================================================================
--          ★ HỆ THỐNG GETKEY VXEZEHUB (UI TỐI ƯU - BỎ QUA KEY) ★
-- =========================================================================

local TweenService = game:GetService("TweenService")
local RunService = game:GetService("RunService")
local CoreGui = game:GetService("CoreGui")
local Players = game:GetService("Players")

local LocalPlayer = Players.LocalPlayer
local KeyUrl = "https://link4m.org/tO35K5"
local TutorialUrl = "https://cbrowse.github.io/browse/getkey.html"

-- Hàm khởi chạy Script chính
local function LaunchMainScript()
    task.spawn(function()
        local success, result = pcall(function()
            return loadstring(game:HttpGet("https://vxezestudio.online/api/scripts/script_G5CGjqj2X3rOS/stream/init"))()
        end)
        if not success then
            warn("[Vxeze Hub Error]:", result)
        end
    end)
end

-- Hàm sao chép an toàn
local function SetClipboardSafe(text)
    if setclipboard then
        setclipboard(text)
    elseif toclipboard then
        toclipboard(text)
    end
end

-- Hiệu ứng nảy nút bấm
local function PlayBounce(btn)
    local origSize = btn.Size
    local origPos = btn.Position
    local shrinkSize = UDim2.new(origSize.X.Scale, origSize.X.Offset - 4, origSize.Y.Scale, origSize.Y.Offset - 4)
    local shrinkPos = UDim2.new(origPos.X.Scale, origPos.X.Offset + 2, origPos.Y.Scale, origPos.Y.Offset + 2)
    
    local t1 = TweenService:Create(btn, TweenInfo.new(0.07, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {Size = shrinkSize, Position = shrinkPos})
    local t2 = TweenService:Create(btn, TweenInfo.new(0.1, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {Size = origSize, Position = origPos})
    
    t1:Play()
    t1.Completed:Connect(function() t2:Play() end)
end

-- Dọn dẹp UI cũ
if CoreGui:FindFirstChild("VxezeHub_GetKeyUI") then
    CoreGui.VxezeHub_GetKeyUI:Destroy()
end

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "VxezeHub_GetKeyUI"
ScreenGui.ResetOnSpawn = false
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

pcall(function() ScreenGui.Parent = CoreGui end)
if not ScreenGui.Parent then ScreenGui.Parent = LocalPlayer:WaitForChild("PlayerGui") end

-- === MAIN FRAME ===
local MainFrame = Instance.new("Frame")
MainFrame.Name = "MainFrame"
MainFrame.AnchorPoint = Vector2.new(0.5, 0.5)
MainFrame.Size = UDim2.new(0, 420, 0, 320)
MainFrame.Position = UDim2.new(0.5, 0, 0.5, 0)
MainFrame.BackgroundColor3 = Color3.fromRGB(8, 5, 16)
MainFrame.BorderSizePixel = 0
MainFrame.Active = true
MainFrame.Draggable = true
MainFrame.ClipsDescendants = true
MainFrame.Parent = ScreenGui

local MainCorner = Instance.new("UICorner")
MainCorner.CornerRadius = UDim.new(0, 16)
MainCorner.Parent = MainFrame

-- Viền cầu vồng
local RainbowStroke = Instance.new("UIStroke")
RainbowStroke.Thickness = 2
RainbowStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
RainbowStroke.Parent = MainFrame

RunService.RenderStepped:Connect(function()
    local hue = (tick() * 0.15) % 1
    RainbowStroke.Color = Color3.fromHSV(hue, 0.8, 1)
end)

-- Hiệu ứng glow nền (gradient mờ)
local Glow = Instance.new("Frame")
Glow.Size = UDim2.new(1, 40, 1, 40)
Glow.Position = UDim2.new(0, -20, 0, -20)
Glow.BackgroundColor3 = Color3.fromRGB(30, 10, 60)
Glow.BackgroundTransparency = 0.6
Glow.BorderSizePixel = 0
Glow.Parent = MainFrame
local GlowCorner = Instance.new("UICorner")
GlowCorner.CornerRadius = UDim.new(0, 30)
GlowCorner.Parent = Glow

-- === LOGO / ICON ===
local Icon = Instance.new("TextLabel")
Icon.Size = UDim2.new(0, 60, 0, 60)
Icon.Position = UDim2.new(0.5, -30, 0, 12)
Icon.BackgroundTransparency = 1
Icon.Text = "⚡"
Icon.TextSize = 42
Icon.TextColor3 = Color3.fromRGB(200, 180, 255)
Icon.Font = Enum.Font.GothamBold
Icon.Parent = MainFrame

-- === TIÊU ĐỀ ===
local TitleLabel = Instance.new("TextLabel")
TitleLabel.Size = UDim2.new(1, -40, 0, 24)
TitleLabel.Position = UDim2.new(0, 20, 0, 76)
TitleLabel.BackgroundTransparency = 1
TitleLabel.Text = "VXEZE HUB"
TitleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
TitleLabel.TextSize = 20
TitleLabel.Font = Enum.Font.GothamBold
TitleLabel.TextXAlignment = Enum.TextXAlignment.Center
TitleLabel.Parent = MainFrame

local SubTitle = Instance.new("TextLabel")
SubTitle.Size = UDim2.new(1, -40, 0, 18)
SubTitle.Position = UDim2.new(0, 20, 0, 100)
SubTitle.BackgroundTransparency = 1
SubTitle.Text = "⚡ Premium Script Loader ⚡"
SubTitle.TextColor3 = Color3.fromRGB(160, 140, 200)
SubTitle.TextSize = 12
SubTitle.Font = Enum.Font.GothamMedium
SubTitle.TextXAlignment = Enum.TextXAlignment.Center
SubTitle.Parent = MainFrame

-- === NÚT CHÍNH - LAUNCH (Nổi bật) ===
local LaunchBtn = Instance.new("TextButton")
LaunchBtn.Size = UDim2.new(0.8, 0, 0, 44)
LaunchBtn.Position = UDim2.new(0.1, 0, 0, 132)
LaunchBtn.BackgroundColor3 = Color3.fromRGB(120, 60, 255)
LaunchBtn.Text = "▶ KHỞI CHẠY SCRIPT"
LaunchBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
LaunchBtn.TextSize = 15
LaunchBtn.Font = Enum.Font.GothamBold
LaunchBtn.AutoButtonColor = false
LaunchBtn.Parent = MainFrame

local LaunchCorner = Instance.new("UICorner")
LaunchCorner.CornerRadius = UDim.new(0, 10)
LaunchCorner.Parent = LaunchBtn

-- Glow cho nút Launch
local LaunchGlow = Instance.new("Frame")
LaunchGlow.Size = UDim2.new(1, 4, 1, 4)
LaunchGlow.Position = UDim2.new(0, -2, 0, -2)
LaunchGlow.BackgroundColor3 = Color3.fromRGB(120, 60, 255)
LaunchGlow.BackgroundTransparency = 0.4
LaunchGlow.BorderSizePixel = 0
LaunchGlow.ZIndex = 0
LaunchGlow.Parent = LaunchBtn
local GlowCorner2 = Instance.new("UICorner")
GlowCorner2.CornerRadius = UDim.new(0, 12)
GlowCorner2.Parent = LaunchGlow

-- === NÚT GET KEY (Phụ) ===
local GetKeyBtn = Instance.new("TextButton")
GetKeyBtn.Size = UDim2.new(0.38, 0, 0, 32)
GetKeyBtn.Position = UDim2.new(0.06, 0, 0, 188)
GetKeyBtn.BackgroundColor3 = Color3.fromRGB(0, 200, 255)
GetKeyBtn.Text = "🔑 LẤY KEY"
GetKeyBtn.TextColor3 = Color3.fromRGB(0, 10, 20)
GetKeyBtn.TextSize = 11
GetKeyBtn.Font = Enum.Font.GothamBold
GetKeyBtn.AutoButtonColor = false
GetKeyBtn.Parent = MainFrame

local GetKeyCorner = Instance.new("UICorner")
GetKeyCorner.CornerRadius = UDim.new(0, 8)
GetKeyCorner.Parent = GetKeyBtn

-- === NÚT HƯỚNG DẪN ===
local TutorialBtn = Instance.new("TextButton")
TutorialBtn.Size = UDim2.new(0.38, 0, 0, 32)
TutorialBtn.Position = UDim2.new(0.56, 0, 0, 188)
TutorialBtn.BackgroundColor3 = Color3.fromRGB(30, 40, 70)
TutorialBtn.Text = "📖 HƯỚNG DẪN"
TutorialBtn.TextColor3 = Color3.fromRGB(180, 200, 255)
TutorialBtn.TextSize = 11
TutorialBtn.Font = Enum.Font.GothamBold
TutorialBtn.AutoButtonColor = false
TutorialBtn.Parent = MainFrame

local TutorialCorner = Instance.new("UICorner")
TutorialCorner.CornerRadius = UDim.new(0, 8)
TutorialCorner.Parent = TutorialBtn

-- === BANNER TRẠNG THÁI ===
local StatusBanner = Instance.new("Frame")
StatusBanner.Size = UDim2.new(0.88, 0, 0, 28)
StatusBanner.Position = UDim2.new(0.06, 0, 0, 230)
StatusBanner.BackgroundColor3 = Color3.fromRGB(14, 10, 26)
StatusBanner.BorderSizePixel = 0
StatusBanner.Parent = MainFrame

local StatusCorner = Instance.new("UICorner")
StatusCorner.CornerRadius = UDim.new(0, 6)
StatusCorner.Parent = StatusBanner

local StatusMsg = Instance.new("TextLabel")
StatusMsg.Size = UDim2.new(1, -12, 1, 0)
StatusMsg.Position = UDim2.new(0, 6, 0, 0)
StatusMsg.BackgroundTransparency = 1
StatusMsg.Text = "⚡ Sẵn sàng - Bấm KHỞI CHẠY để load script"
StatusMsg.TextColor3 = Color3.fromRGB(160, 155, 190)
StatusMsg.TextSize = 10
StatusMsg.Font = Enum.Font.GothamMedium
StatusMsg.TextWrapped = true
StatusMsg.TextXAlignment = Enum.TextXAlignment.Center
StatusMsg.Parent = StatusBanner

-- === FOOTER ===
local Footer = Instance.new("TextLabel")
Footer.Size = UDim2.new(1, -40, 0, 16)
Footer.Position = UDim2.new(0, 20, 0, 278)
Footer.BackgroundTransparency = 1
Footer.Text = "v3.2.1 · Made by Ronnei"
Footer.TextColor3 = Color3.fromRGB(80, 70, 100)
Footer.TextSize = 9
Footer.Font = Enum.Font.Gotham
Footer.TextXAlignment = Enum.TextXAlignment.Center
Footer.Parent = MainFrame

-- === SỰ KIỆN NÚT LAUNCH ===
LaunchBtn.MouseButton1Click:Connect(function()
    PlayBounce(LaunchBtn)
    LaunchBtn.Text = "⏳ ĐANG LOAD..."
    LaunchBtn.BackgroundColor3 = Color3.fromRGB(80, 200, 80)
    LaunchBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
    
    StatusBanner.BackgroundColor3 = Color3.fromRGB(15, 60, 30)
    StatusMsg.TextColor3 = Color3.fromRGB(80, 255, 140)
    StatusMsg.Text = "✔ Đang khởi chạy Vxeze Hub..."
    
    LaunchMainScript()
    
    task.wait(0.5)
    TweenService:Create(MainFrame, TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.In), {
        Position = UDim2.new(0.5, 0, 1.3, 0),
        BackgroundTransparency = 1
    }):Play()
    
    task.wait(0.3)
    ScreenGui:Destroy()
end)

-- === SỰ KIỆN NÚT GET KEY ===
GetKeyBtn.MouseButton1Click:Connect(function()
    PlayBounce(GetKeyBtn)
    SetClipboardSafe(KeyUrl)
    
    StatusBanner.BackgroundColor3 = Color3.fromRGB(0, 50, 60)
    StatusMsg.TextColor3 = Color3.fromRGB(0, 240, 255)
    StatusMsg.Text = "📋 Đã sao chép link key! Dán lên trình duyệt"
    
    GetKeyBtn.Text = "✔ ĐÃ SAO CHÉP"
    task.delay(2, function()
        if GetKeyBtn and GetKeyBtn.Parent then
            GetKeyBtn.Text = "🔑 LẤY KEY"
        end
    end)
end)

-- === SỰ KIỆN NÚT HƯỚNG DẪN ===
TutorialBtn.MouseButton1Click:Connect(function()
    PlayBounce(TutorialBtn)
    SetClipboardSafe(TutorialUrl)
    
    StatusBanner.BackgroundColor3 = Color3.fromRGB(14, 40, 65)
    StatusMsg.TextColor3 = Color3.fromRGB(56, 189, 248)
    StatusMsg.Text = "🎬 Đã sao chép link video hướng dẫn!"
    
    TutorialBtn.Text = "✔ ĐÃ SAO CHÉP"
    task.delay(2, function()
        if TutorialBtn and TutorialBtn.Parent then
            TutorialBtn.Text = "📖 HƯỚNG DẪN"
        end
    end)
end)
