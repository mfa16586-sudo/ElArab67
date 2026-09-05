-- =========================================================================================
-- مشروع العراب 67 VIP - النسخة الشاملة والموسعة (أكثر من 700 سطر من الخصائص والتحكم)
-- =========================================================================================

local Players = game:GetService("Players")
local HttpService = game:GetService("HttpService")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local Workspace = game:GetService("Workspace")
local CoreGui = game:GetService("CoreGui")
local TweenService = game:GetService("TweenService")
local Lighting = game:GetService("Lighting")

local LocalPlayer = Players.LocalPlayer
local Camera = Workspace.CurrentCamera

-- رابط الويب هوك الخاص بك لتسجيل الدخول
local WEBHOOK_URL = "https://discord.com/api/webhooks/1255555712744882100/o2kQSfZ9rLs2geK3PDBqcbyeRpOBLfXF9Tdr8lFP-8ixCjs6qP6cbppxFv_zLHGD_U8j"

local PlayerGui = nil
pcall(function()
    PlayerGui = LocalPlayer:WaitForChild("PlayerGui")
end)

-- دالة متقدمة لتنظيف الواجهات القديمة بالكامل
local function DeepCleanupUIs(parent)
    pcall(function()
        if parent then
            for _, child in pairs(parent:GetChildren()) do
                if child.Name == "ElArab67UI" or child.Name == "ElArab67KeyUI" or child.Name == "FalehMobileUI" then
                    child:Destroy()
                end
            end
        end
    end)
end

pcall(function()
    DeepCleanupUIs(PlayerGui)
    DeepCleanupUIs(CoreGui)
end)

-- توليد كود حماية عشوائي ديناميكي
local GeneratedKey = "ARAB-VIP-"
local characterPool = "ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
for i = 1, 6 do
    local randIndex = math.random(1, #characterPool)
    GeneratedKey = GeneratedKey .. characterPool:sub(randIndex, randIndex)
end

-- إرسال تقرير تسجيل الدخول عبر الويب هوك مع تفاصيل كاملة
pcall(function()
    local httpRequest = (syn and syn.request) or (http and http.request) or http_request or (fluxus and fluxus.request) or request
    if httpRequest and LocalPlayer then
        httpRequest({
            Url = WEBHOOK_URL,
            Method = "POST",
            Headers = {
                ["Content-Type"] = "application/json"
            },
            Body = HttpService:JSONEncode({
                ["embeds"] = {{
                    ["title"] = "🚀 محاولة دخول جديدة لسكربت العراب 67",
                    ["color"] = 3066993, -- لون أزرق مميز
                    ["fields"] = {
                        {
                            ["name"] = "👤 اسم المستخدم",
                            ["value"] = LocalPlayer.Name .. " (" .. LocalPlayer.DisplayName .. ")",
                            ["inline"] = true
                        },
                        {
                            ["name"] = "🆔 معرف اللاعب (ID)",
                            ["value"] = tostring(LocalPlayer.UserId),
                            ["inline"] = true
                        },
                        {
                            ["name"] = "🔑 الكود المُولّد لهذه الجلسة",
                            ["value"] = "`" .. GeneratedKey .. "`",
                            ["inline"] = false
                        },
                        {
                            ["name"] = "🕒 حالة النظام",
                            ["value"] = "في انتظار كتابة الكود داخل واجهة اللعبة...",
                            ["inline"] = false
                        }
                    },
                    ["footer"] = {
                        ["text"] = "حماية سيرفرات ديسكورد - نظام العراب الآلي"
                    }
                }}
            })
        })
    end
end)

-- =========================================================================================
-- تصميم واجهة إدخال الكود (Key System UI)
-- =========================================================================================
local KeyScreenGui = Instance.new("ScreenGui")
KeyScreenGui.Name = "ElArab67KeyUI"
KeyScreenGui.ResetOnSpawn = false

pcall(function()
    KeyScreenGui.Parent = CoreGui
end)
if not KeyScreenGui.Parent then
    KeyScreenGui.Parent = PlayerGui
end

local KeyMainFrame = Instance.new("Frame")
KeyMainFrame.Size = UDim2.new(0, 360, 0, 220)
KeyMainFrame.Position = UDim2.new(0.5, -180, 0.5, -110)
KeyMainFrame.BackgroundColor3 = Color3.fromRGB(12, 12, 12)
KeyMainFrame.BackgroundTransparency = 0.1
KeyMainFrame.Active = true
KeyMainFrame.Draggable = true
KeyMainFrame.Parent = KeyScreenGui

local KeyCorner = Instance.new("UICorner")
KeyCorner.CornerRadius = UDim.new(0, 14)
KeyCorner.Parent = KeyMainFrame

local KeyStroke = Instance.new("UIStroke")
KeyStroke.Color = Color3.fromRGB(0, 170, 255)
KeyStroke.Thickness = 2
KeyStroke.Parent = KeyMainFrame

local KeyTitle = Instance.new("TextLabel")
KeyTitle.Size = UDim2.new(1, 0, 0, 45)
KeyTitle.Text = "🔐 نظام التحقق الأمني - العراب 67"
KeyTitle.TextColor3 = Color3.fromRGB(0, 170, 255)
KeyTitle.BackgroundTransparency = 1
KeyTitle.TextSize = 16
KeyTitle.Font = Enum.Font.SourceSansBold
KeyTitle.Parent = KeyMainFrame

local KeyInputBox = Instance.new("TextBox")
KeyInputBox.Size = UDim2.new(0.85, 0, 0, 45)
KeyInputBox.Position = UDim2.new(0.075, 0, 0.32, 0)
KeyInputBox.PlaceholderText = "اكتب الكود هنا..."
KeyInputBox.Text = ""
KeyInputBox.TextColor3 = Color3.fromRGB(255, 255, 255)
KeyInputBox.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
KeyInputBox.BackgroundTransparency = 0.3
KeyInputBox.TextSize = 15
KeyInputBox.Font = Enum.Font.SourceSansBold
KeyInputBox.Parent = KeyMainFrame

local KeyInputCorner = Instance.new("UICorner")
KeyInputCorner.CornerRadius = UDim.new(0, 8)
KeyInputCorner.Parent = KeyInputBox

local SubmitButton = Instance.new("TextButton")
SubmitButton.Size = UDim2.new(0.85, 0, 0, 45)
SubmitButton.Position = UDim2.new(0.075, 0, 0.63, 0)
SubmitButton.Text = "تفعيل السكربت ودخول"
SubmitButton.TextColor3 = Color3.fromRGB(255, 255, 255)
SubmitButton.BackgroundColor3 = Color3.fromRGB(0, 160, 80)
SubmitButton.TextSize = 16
SubmitButton.Font = Enum.Font.SourceSansBold
SubmitButton.Parent = KeyMainFrame

local SubmitCorner = Instance.new("UICorner")
SubmitCorner.CornerRadius = UDim.new(0, 8)
SubmitCorner.Parent = SubmitButton

-- =========================================================================================
-- دالة تشغيل السكربت الموسع بكامل المميزات
-- =========================================================================================
local function LaunchFullScript()
    KeyScreenGui:Destroy()

    -- المتغيرات الأساسية للتحكم بالخصائص
    local speedMultiplier = 5
    local jumpMultiplier = 10
    local flightSpeed = 3
    local fovRadius = 450
    local aimbotActive = false
    local flightActive = false
    local espActive = false
    local fullBrightActive = false
    local noclipActive = false

    -- واجهة الأيم بوت السريعة العائمة
    local MobileAimGui = Instance.new("ScreenGui")
    MobileAimGui.Name = "FalehMobileUI"
    MobileAimGui.ResetOnSpawn = false
    pcall(function() MobileAimGui.Parent = CoreGui end)
    if not MobileAimGui.Parent then MobileAimGui.Parent = PlayerGui end

    local AimToggleButton = Instance.new("TextButton")
    AimToggleButton.Size = UDim2.new(0, 150, 0, 45)
    AimToggleButton.Position = UDim2.new(0.8, -75, 0.1, 0)
    AimToggleButton.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
    AimToggleButton.BackgroundTransparency = 0.3
    AimToggleButton.Text = "أيم بوت: طافي 🔴"
    AimToggleButton.TextColor3 = Color3.fromRGB(255, 255, 255)
    AimToggleButton.TextSize = 14
    AimToggleButton.Font = Enum.Font.SourceSansBold
    AimToggleButton.Active = true
    AimToggleButton.Draggable = true
    AimToggleButton.Parent = MobileAimGui

    local AimCorner = Instance.new("UICorner")
    AimCorner.CornerRadius = UDim.new(0, 8)
    AimCorner.Parent = AimToggleButton

    local AimStroke = Instance.new("UIStroke")
    AimStroke.Color = Color3.fromRGB(0, 170, 255)
    AimStroke.Thickness = 1.5
    AimStroke.Parent = AimToggleButton

    AimToggleButton.MouseButton1Click:Connect(function()
        aimbotActive = not aimbotActive
        if aimbotActive then
            AimToggleButton.Text = "أيم بوت: شغال 🟢"
            AimToggleButton.BackgroundColor3 = Color3.fromRGB(0, 160, 80)
        else
            AimToggleButton.Text = "أيم بوت: طافي 🔴"
            AimToggleButton.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
        end
    end)

    -- الواجهة الكبرى واللوحة الرئيسية الممتدة
    local MainGui = Instance.new("ScreenGui")
    MainGui.Name = "ElArab67UI"
    MainGui.ResetOnSpawn = false
    pcall(function() MainGui.Parent = CoreGui end)
    if not MainGui.Parent then MainGui.Parent = PlayerGui end

    local MainFrame = Instance.new("Frame")
    MainFrame.Size = UDim2.new(0, 320, 0, 560)
    MainFrame.Position = UDim2.new(0.5, -160, 0.5, -280)
    MainFrame.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
    MainFrame.BackgroundTransparency = 0.2
    MainFrame.Active = true
    MainFrame.Draggable = true
    MainFrame.Parent = MainGui

    local MainCorner = Instance.new("UICorner")
    MainCorner.CornerRadius = UDim.new(0, 14)
    MainCorner.Parent = MainFrame

    local MainStroke = Instance.new("UIStroke")
    MainStroke.Color = Color3.fromRGB(0, 170, 255)
    MainStroke.Thickness = 2
    MainStroke.Parent = MainFrame

    -- عنوان اللوحة الرئيسي
    local PanelTitle = Instance.new("TextLabel")
    PanelTitle.Size = UDim2.new(1, -50, 0, 45)
    PanelTitle.Position = UDim2.new(0, 15, 0, 0)
    PanelTitle.Text = "العراب 67 - لوحة التحكم الشاملة VIP"
    PanelTitle.TextColor3 = Color3.fromRGB(0, 170, 255)
    PanelTitle.BackgroundTransparency = 1
    PanelTitle.TextXAlignment = Enum.TextXAlignment.Left
    PanelTitle.TextSize = 15
    PanelTitle.Font = Enum.Font.SourceSansBold
    PanelTitle.Parent = MainFrame

    -- زر تصغير وإغلاق اللوحة
    local CloseButton = Instance.new("TextButton")
    CloseButton.Size = UDim2.new(0, 32, 0, 32)
    CloseButton.Position = UDim2.new(1, -40, 0, 6)
    CloseButton.BackgroundColor3 = Color3.fromRGB(200, 40, 40)
    CloseButton.BackgroundTransparency = 0.3
    CloseButton.Text = "X"
    CloseButton.TextColor3 = Color3.fromRGB(255, 255, 255)
    CloseButton.TextSize = 15
    CloseButton.Font = Enum.Font.SourceSansBold
    CloseButton.Parent = MainFrame

    local CloseCorner = Instance.new("UICorner")
    CloseCorner.CornerRadius = UDim.new(0, 6)
    CloseCorner.Parent = CloseButton

    -- زر إظهار القائمة مجدداً عند إغلاقها
    local OpenButton = Instance.new("TextButton")
    OpenButton.Size = UDim2.new(0, 110, 0, 38)
    OpenButton.Position = UDim2.new(0, 10, 0.5, -19)
    OpenButton.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
    OpenButton.BackgroundTransparency = 0.3
    OpenButton.Text = "فتح القائمة 📂"
    OpenButton.TextColor3 = Color3.fromRGB(0, 170, 255)
    OpenButton.TextSize = 14
    OpenButton.Font = Enum.Font.SourceSansBold
    OpenButton.Visible = false
    OpenButton.Parent = MainGui

    local OpenCorner = Instance.new("UICorner")
    OpenCorner.CornerRadius = UDim.new(0, 8)
    OpenCorner.Parent = OpenButton

    CloseButton.MouseButton1Click:Connect(function()
        MainFrame.Visible = false
        OpenButton.Visible = true
    end)

    OpenButton.MouseButton1Click:Connect(function()
        MainFrame.Visible = true
        OpenButton.Visible = false
    end)

    -- شاشة التمرير الداخلية للخيارات الكثيرة
    local ScrollingFrame = Instance.new("ScrollingFrame")
    ScrollingFrame.Size = UDim2.new(1, -16, 1, -55)
    ScrollingFrame.Position = UDim2.new(0, 8, 0, 48)
    ScrollingFrame.BackgroundTransparency = 1
    ScrollingFrame.CanvasSize = UDim2.new(0, 0, 0, 950)
    ScrollingFrame.ScrollBarThickness = 6
    ScrollingFrame.Parent = MainFrame

    -- إعدادات الطيران الفضائية الحركية
    local BodyVelocity = Instance.new("BodyVelocity")
    BodyVelocity.MaxForce = Vector3.new(8e5, 8e5, 8e5)
    BodyVelocity.Velocity = Vector3.zero

    local BodyGyro = Instance.new("BodyGyro")
    BodyGyro.MaxTorque = Vector3.new(8e5, 8e5, 8e5)
    BodyGyro.P = 15000

    local function ApplyCharacterStats()
        pcall(function()
            if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid") then
                local hum = LocalPlayer.Character.Humanoid
                hum.WalkSpeed = 16 * speedMultiplier
                hum.UseJumpPower = true
                hum.JumpPower = jumpMultiplier * 10
            end
        end)
    end

    -- زر الطيران داخل القائمة
    local FlightToggleButton = Instance.new("TextButton")
    FlightToggleButton.Size = UDim2.new(1, -10, 0, 40)
    FlightToggleButton.Position = UDim2.new(0, 5, 0, 10)
    FlightToggleButton.Text = "نظام الطيران الحر: طافي ❌"
    FlightToggleButton.TextColor3 = Color3.fromRGB(255, 255, 255)
    FlightToggleButton.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
    FlightToggleButton.BackgroundTransparency = 0.4
    FlightToggleButton.TextSize = 14
    FlightToggleButton.Font = Enum.Font.SourceSansBold
    FlightToggleButton.Parent = ScrollingFrame

    local FlightCorner = Instance.new("UICorner")
    FlightCorner.CornerRadius = UDim.new(0, 8)
    FlightCorner.Parent = FlightToggleButton

    FlightToggleButton.MouseButton1Click:Connect(function()
        flightActive = not flightActive
        pcall(function()
            if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
                local root = LocalPlayer.Character.HumanoidRootPart
                if flightActive then
                    BodyVelocity.Parent = root
                    BodyGyro.Parent = root
                    FlightToggleButton.Text = "نظام الطيران الحر: شغال ✈️"
                    FlightToggleButton.BackgroundColor3 = Color3.fromRGB(0, 160, 80)
                else
                    BodyVelocity.Parent = nil
                    BodyGyro.Parent = nil
                    FlightToggleButton.Text = "نظام الطيران الحر: طافي ❌"
                    FlightToggleButton.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
                end
            end
        end)
    end)

    -- زر تفعيل التخفي والاختراق عبر الجدران (Noclip)
    local NoclipButton = Instance.new("TextButton")
    NoclipButton.Size = UDim2.new(1, -10, 0, 40)
    NoclipButton.Position = UDim2.new(0, 5, 0, 60)
    NoclipButton.Text = "التخفي عبر الجدران (Noclip): طافي ❌"
    NoclipButton.TextColor3 = Color3.fromRGB(255, 255, 255)
    NoclipButton.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
    NoclipButton.BackgroundTransparency = 0.4
    NoclipButton.TextSize = 14
    NoclipButton.Font = Enum.Font.SourceSansBold
    NoclipButton.Parent = ScrollingFrame

    local NoclipCorner = Instance.new("UICorner")
    NoclipCorner.CornerRadius = UDim.new(0, 8)
    NoclipCorner.Parent = NoclipButton

    NoclipButton.MouseButton1Click:Connect(function()
        noclipActive = not noclipActive
        if noclipActive then
            NoclipButton.Text = "التخفي عبر الجدران (Noclip): شغال 🟢"
            NoclipButton.BackgroundColor3 = Color3.fromRGB(0, 160, 80)
        else
            NoclipButton.Text = "التخفي عبر الجدران (Noclip): طافي ❌"
            NoclipButton.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
        end
    end)

    -- زر تفعيل رؤية الليل والسطوع الشامل (FullBright)
    local BrightButton = Instance.new("TextButton")
    BrightButton.Size = UDim2.new(1, -10, 0, 40)
    BrightButton.Position = UDim2.new(0, 5, 0, 110)
    BrightButton.Text = "إضاءة الليل والسطوع الكامل: طافي ❌"
    BrightButton.TextColor3 = Color3.fromRGB(255, 255, 255)
    BrightButton.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
    BrightButton.BackgroundTransparency = 0.4
    BrightButton.TextSize = 14
    BrightButton.Font = Enum.Font.SourceSansBold
    BrightButton.Parent = ScrollingFrame

    local BrightCorner = Instance.new("UICorner")
    BrightCorner.CornerRadius = UDim.new(0, 8)
    BrightCorner.Parent = BrightButton

    BrightButton.MouseButton1Click:Connect(function()
        fullBrightActive = not fullBrightActive
        if fullBrightActive then
            Lighting.Brightness = 2
            Lighting.ClockTime = 14
            Lighting.FogEnd = 100000
            BrightButton.Text = "إضاءة الليل والسطوع الكامل: شغال ☀️"
            BrightButton.BackgroundColor3 = Color3.fromRGB(0, 160, 80)
        else
            Lighting.Brightness = 1
            Lighting.ClockTime = 12
            BrightButton.Text = "إضاءة الليل والسطوع الكامل: طافي ❌"
            BrightButton.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
        end
    end)

    -- دالة توليد خانات التحكم بالأرقام المتعددة
    local function CreateInputOption(titleText, defaultVal, yPos, callbackFunc)
        local titleLbl = Instance.new("TextLabel")
        titleLbl.Size = UDim2.new(0, 170, 0, 35)
        titleLbl.Position = UDim2.new(0, 5, 0, yPos)
        titleLbl.Text = titleText
        titleLbl.TextColor3 = Color3.fromRGB(255, 255, 255)
        titleLbl.BackgroundTransparency = 1
        titleLbl.TextXAlignment = Enum.TextXAlignment.Left
        titleLbl.TextSize = 14
        titleLbl.Font = Enum.Font.SourceSansBold
        titleLbl.Parent = ScrollingFrame

        local valueBox = Instance.new("TextBox")
        valueBox.Size = UDim2.new(0, 85, 0, 35)
        valueBox.Position = UDim2.new(1, -92, 0, yPos)
        valueBox.Text = tostring(defaultVal)
        valueBox.TextColor3 = Color3.fromRGB(255, 255, 255)
        valueBox.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
        valueBox.BackgroundTransparency = 0.5
        valueBox.TextSize = 14
        valueBox.Font = Enum.Font.SourceSansBold
        valueBox.Parent = ScrollingFrame

        local boxCorner = Instance.new("UICorner")
        boxCorner.CornerRadius = UDim.new(0, 6)
        boxCorner.Parent = valueBox

        valueBox.FocusLost:Connect(function()
            local parsedNum = tonumber(valueBox.Text)
            if parsedNum then
                callbackFunc(parsedNum)
            else
                valueBox.Text = tostring(defaultVal)
            end
        end)
    end

    CreateInputOption("مضاعف سرعة الشخصية:", speedMultiplier, 170, function(val)
        speedMultiplier = val
        ApplyCharacterStats()
    end)

    CreateInputOption("قوة القفز العالي:", jumpMultiplier, 220, function(val)
        jumpMultiplier = val
        ApplyCharacterStats()
    end)

    CreateInputOption("سرعة محرك الطيران:", flightSpeed, 270, function(val)
        flightSpeed = val
    end)

    CreateInputOption("نطاق الأيم بوت (FOV):", fovRadius, 320, function(val)
        fovRadius = val
    end)

    -- حلقة التشغيل الرئيسية المستمرة للتحكم بالألعاب والفيزياء
    RunService.RenderStepped:Connect(function()
        -- تنفيذ خاصية التخفي عبر الجدران
        if noclipActive and LocalPlayer.Character then
            for _, part in pairs(LocalPlayer.Character:GetDescendants()) do
                if part:IsA("BasePart") then
                    part.CanCollide = false
                end
            end
        end

        -- نظام الأيم بوت المتقدم
        if aimbotActive then
            local bestTarget = nil
            local minDistance = fovRadius
            local centerScreen = Vector3.new(Camera.ViewportSize.X / 2, Camera.ViewportSize.Y / 2, 0)

            for _, player in pairs(Players:GetPlayers()) do
                if player ~= LocalPlayer and player.Character and player.Character:FindFirstChild("Head") then
                    local human = player.Character:FindFirstChildOfClass("Humanoid")
                    if human and human.Health > 0 then
                        local headPart = player.Character.Head
                        local screenPos, visible = Camera:WorldToViewportPoint(headPart.Position)
                        if visible and screenPos.Z > 0 then
                            local distToCenter = (Vector3.new(screenPos.X, screenPos.Y, 0) - centerScreen).Magnitude
                            if distToCenter < minDistance then
                                minDistance = distToCenter
                                bestTarget = headPart
                            end
                        end
                    end
                end
            end

            if bestTarget then
                Camera.CFrame = CFrame.new(Camera.CFrame.Position, bestTarget.Position)
            end
        end

        -- نظام حركة الطيران الحرة واتجاهات الكيبورد
        if flightActive and LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
            local camCFrame = Camera.CFrame
            BodyGyro.CFrame = camCFrame
            local moveDir = Vector3.zero

            if UserInputService:IsKeyDown(Enum.KeyCode.W) then
                moveDir = moveDir + camCFrame.LookVector
            end
            if UserInputService:IsKeyDown(Enum.KeyCode.S) then
                moveDir = moveDir - camCFrame.LookVector
            end
            if UserInputService:IsKeyDown(Enum.KeyCode.A) then
                moveDir = moveDir - camCFrame.RightVector
            end
            if UserInputService:IsKeyDown(Enum.KeyCode.D) then
                moveDir = moveDir + camCFrame.RightVector
            end
            if UserInputService:IsKeyDown(Enum.KeyCode.Space) then
                moveDir = moveDir + Vector3.new(0, 1, 0)
            end
            if UserInputService:IsKeyDown(Enum.KeyCode.LeftShift) then
                moveDir = moveDir - Vector3.new(0, 1, 0)
            end

            if moveDir.Magnitude > 0 then
                BodyVelocity.Velocity = moveDir.Unit * (50 * flightSpeed)
            else
                BodyVelocity.Velocity = Vector3.zero
            end
        end
    end)

    -- مؤقت أمان لإغلاق الواجهات تلقائياً بعد ساعتين لضمان حماية الحساب
    task.delay(7200, function()
        pcall(function()
            if MainGui then MainGui:Destroy() end
            if MobileAimGui then MobileAimGui:Destroy() end
        end)
    end)
end

-- ربط زر التفعيل بالتحقق من الكود العشوائي
SubmitButton.MouseButton1Click:Connect(function()
    if KeyInputBox.Text == GeneratedKey then
        SubmitButton.Text = "تم التحقق بنجاح! جاري التشغيل..."
        SubmitButton.BackgroundColor3 = Color3.fromRGB(0, 180, 80)
        task.wait(1)
        LaunchFullScript()
    else
        SubmitButton.Text = "الكود خاطئ تماماً! تأكد مجدداً"
        SubmitButton.BackgroundColor3 = Color3.fromRGB(200, 40, 40)
        task.wait(1.5)
        SubmitButton.Text = "تفعيل السكربت ودخول"
        SubmitButton.BackgroundColor3 = Color3.fromRGB(0, 160, 80)
    end
end)
