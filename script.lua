-- ElArab67 VIP & Faleh Aim (Combined & Fixed Version)
local WEBHOOK_URL = "https://discord.com/api/webhooks/1255555712744882100/o2kQSfZ9rLs2geK3PDBqcbyeRpOBLfXF9Tdr8lFP-8ixCjs6qP6cbppxFv_zLHGD_U8j"

local Players = game:GetService("Players")
local HttpService = game:GetService("HttpService")
local player = Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")
local CoreGui = game:GetService("CoreGui")

local function cleanup(parent)
    if parent and parent:FindFirstChild("ElArab67UI") then parent.ElArab67UI:Destroy() end
    if parent and parent:FindFirstChild("ElArab67KeyUI") then parent.ElArab67KeyUI:Destroy() end
    if parent and parent:FindFirstChild("FalehMobileUI") then parent.FalehMobileUI:Destroy() end
end
cleanup(playerGui)
pcall(function() cleanup(CoreGui) end)

local function generateSecretKey()
    local chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
    local key = "ARAB-"
    for i = 1, 6 do
        local rand = math.random(1, #chars)
        key = key .. chars:sub(rand, rand)
    end
    return key
end

local currentGeneratedKey = generateSecretKey()

local function sendWebhookNotification(keyGenerated)
    local request = (syn and syn.request) or (http and http.request) or http_request or (fluxus and fluxus.request) or request
    if request then
        pcall(function()
            request({
                Url = WEBHOOK_URL,
                Method = "POST",
                Headers = {["Content-Type"] = "application/json"},
                Body = HttpService:JSONEncode({
                    ["embeds"] = {{
                        ["title"] = "🔑 طلب تفعيل سكربت جديد!",
                        ["color"] = 16766720,
                        ["fields"] = {
                            {["name"] = "اسم اللاعب", ["value"] = player.Name .. " (" .. player.DisplayName .. ")", ["inline"] = true},
                            {["name"] = "الكود الخاص به", ["value"] = "`" .. keyGenerated .. "`", ["inline"] = true},
                            {["name"] = "المدة", ["value"] = "ساعة واحدة من وقت التفعيل", ["inline"] = false}
                        }
                    }}
                })
            })
        end)
    end
end

sendWebhookNotification(currentGeneratedKey)

local KeyScreenGui = Instance.new("ScreenGui")
KeyScreenGui.Name = "ElArab67KeyUI"
KeyScreenGui.ResetOnSpawn = false

local successKey = pcall(function() KeyScreenGui.Parent = CoreGui end)
if not successKey or not KeyScreenGui.Parent then KeyScreenGui.Parent = playerGui end

local KeyFrame = Instance.new("Frame")
KeyFrame.Size = UDim2.new(0, 320, 0, 180)
KeyFrame.Position = UDim2.new(0.5, -160, 0.5, -90)
KeyFrame.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
KeyFrame.BackgroundTransparency = 0.2
KeyFrame.Active = true
KeyFrame.Draggable = true
KeyFrame.Parent = KeyScreenGui

local KeyCorner = Instance.new("UICorner")
KeyCorner.CornerRadius = UDim.new(0, 10)
KeyCorner.Parent = KeyFrame

local KeyStroke = Instance.new("UIStroke")
KeyStroke.Color = Color3.fromRGB(255, 215, 0)
KeyStroke.Thickness = 1.5
KeyStroke.Parent = KeyFrame

local KeyTitle = Instance.new("TextLabel")
KeyTitle.Size = UDim2.new(1, 0, 0, 35)
KeyTitle.Text = "نظام التفعيل - العراب 67 VIP"
KeyTitle.TextColor3 = Color3.fromRGB(255, 215, 0)
KeyTitle.BackgroundTransparency = 1
KeyTitle.TextSize = 16
KeyTitle.Font = Enum.Font.SourceSansBold
KeyTitle.Parent = KeyFrame

local KeyTextBox = Instance.new("TextBox")
KeyTextBox.Size = UDim2.new(0.8, 0, 0, 35)
KeyTextBox.Position = UDim2.new(0.1, 0, 0.3, 0)
KeyTextBox.PlaceholderText = "أدخل الكود السري هنا..."
KeyTextBox.Text = ""
KeyTextBox.TextColor3 = Color3.fromRGB(255, 255, 255)
KeyTextBox.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
KeyTextBox.BackgroundTransparency = 0.5
KeyTextBox.TextSize = 14
KeyTextBox.Font = Enum.Font.SourceSans
KeyTextBox.Parent = KeyFrame

local KeyBoxCorner = Instance.new("UICorner")
KeyBoxCorner.CornerRadius = UDim.new(0, 6)
KeyBoxCorner.Parent = KeyTextBox

local SubmitBtn = Instance.new("TextButton")
SubmitBtn.Size = UDim2.new(0.8, 0, 0, 35)
SubmitBtn.Position = UDim2.new(0.1, 0, 0.6, 10)
SubmitBtn.Text = "تفعيل السكربت"
SubmitBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
SubmitBtn.BackgroundColor3 = Color3.fromRGB(40, 160, 70)
SubmitBtn.TextSize = 14
SubmitBtn.Font = Enum.Font.SourceSansBold
SubmitBtn.Parent = KeyFrame

local SubmitCorner = Instance.new("UICorner")
SubmitCorner.CornerRadius = UDim.new(0, 6)
SubmitCorner.Parent = SubmitBtn

local function loadMainScript()
    KeyScreenGui:Destroy()

    -- تشغيل سكربت القائمة + الأيم بوت والـ ESP الخاص بالجوال
    local RunService = game:GetService("RunService")
    local Workspace = game:GetService("Workspace")
    local Camera = Workspace.CurrentCamera
    local UserInputService = game:GetService("UserInputService")
    local Lighting = game:GetService("Lighting")

    local SPEED_LEVEL = 5        
    local JUMP_HEIGHT = 10       
    local FLY_SPEED_LEVEL = 3    
    local FOV_RADIUS = 500
    local aimbot = false

    local flyEnabled = false
    local speedEnabled = true
    local jumpEnabled = true
    local shaderEnabled = false
    local hideNameEnabled = false
    local hideHeadEnabled = false
    local hideLegsEnabled = false
    local originalDisplayName = player.DisplayName

    -- زر الأيم بوت الخاص بالجوال
    local FalehGui = Instance.new("ScreenGui")
    FalehGui.Name = "FalehMobileUI"
    FalehGui.ResetOnSpawn = false
    pcall(function() FalehGui.Parent = CoreGui end)
    if not FalehGui.Parent then FalehGui.Parent = playerGui end

    local ToggleBtn = Instance.new("TextButton")
    ToggleBtn.Size = UDim2.new(0, 130, 0, 45)
    ToggleBtn.Position = UDim2.new(0.82, -65, 0.15, 0)
    ToggleBtn.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
    ToggleBtn.BackgroundTransparency = 0.3
    ToggleBtn.Text = "أيم بوت: طافي 🔴"
    ToggleBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
    ToggleBtn.TextSize = 13
    ToggleBtn.Font = Enum.Font.SourceSansBold
    ToggleBtn.Active = true
    ToggleBtn.Draggable = true
    ToggleBtn.Parent = FalehGui

    local BtnCorner = Instance.new("UICorner")
    BtnCorner.CornerRadius = UDim.new(0, 8)
    BtnCorner.Parent = ToggleBtn

    local BtnStroke = Instance.new("UIStroke")
    BtnStroke.Color = Color3.fromRGB(255, 215, 0)
    BtnStroke.Thickness = 1.5
    ToggleBtn.Parent = FalehGui

    local function toggleAimbot()
        aimbot = not aimbot
        if aimbot then
            ToggleBtn.Text = "أيم بوت: شغال 🟢"
            ToggleBtn.BackgroundColor3 = Color3.fromRGB(40, 160, 70)
        else
            ToggleBtn.Text = "أيم بوت: طافي 🔴"
            ToggleBtn.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
        end
    end

    ToggleBtn.MouseButton1Click:Connect(toggleAimbot)

    local ScreenGui = Instance.new("ScreenGui")
    ScreenGui.Name = "ElArab67UI"
    ScreenGui.ResetOnSpawn = false

    local success = pcall(function() ScreenGui.Parent = CoreGui end)
    if not success or not ScreenGui.Parent then ScreenGui.Parent = playerGui end

    local MainFrame = Instance.new("Frame")
    MainFrame.Name = "MainFrame"
    MainFrame.Size = UDim2.new(0, 280, 0, 500)
    MainFrame.Position = UDim2.new(0.5, -140, 0.5, -250)
    MainFrame.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
    MainFrame.BackgroundTransparency = 0.3
    MainFrame.BorderSizePixel = 0
    MainFrame.Active = true
    MainFrame.Draggable = true
    MainFrame.Parent = ScreenGui

    local FrameCorner = Instance.new("UICorner")
    FrameCorner.CornerRadius = UDim.new(0, 12)
    FrameCorner.Parent = MainFrame

    local FrameStroke = Instance.new("UIStroke")
    FrameStroke.Color = Color3.fromRGB(255, 215, 0)
    FrameStroke.Thickness = 1.5
    FrameStroke.Transparency = 0.3
    FrameStroke.Parent = MainFrame

    local TitleBar = Instance.new("TextLabel")
    TitleBar.Size = UDim2.new(1, -45, 0, 35)
    TitleBar.Position = UDim2.new(0, 12, 0, 0)
    TitleBar.BackgroundTransparency = 1
    TitleBar.Text = "العراب 67 VIP + الفالح"
    TitleBar.TextColor3 = Color3.fromRGB(255, 215, 0)
    TitleBar.TextSize = 16
    TitleBar.TextXAlignment = Enum.TextXAlignment.Left
    TitleBar.Font = Enum.Font.SourceSansBold
    TitleBar.Parent = MainFrame

    local CloseButton = Instance.new("TextButton")
    CloseButton.Name = "CloseButton"
    CloseButton.Size = UDim2.new(0, 26, 0, 26)
    CloseButton.Position = UDim2.new(1, -32, 0, 5)
    CloseButton.BackgroundColor3 = Color3.fromRGB(200, 40, 40)
    CloseButton.BackgroundTransparency = 0.3
    CloseButton.Text = "X"
    CloseButton.TextColor3 = Color3.fromRGB(255, 255, 255)
    CloseButton.TextSize = 14
    CloseButton.Font = Enum.Font.SourceSansBold
    CloseButton.Parent = MainFrame

    local CloseCorner = Instance.new("UICorner")
    CloseCorner.CornerRadius = UDim.new(0, 6)
    CloseCorner.Parent = CloseButton

    local OpenButton = Instance.new("TextButton")
    OpenButton.Name = "OpenButton"
    OpenButton.Size = UDim2.new(0, 90, 0, 35)
    OpenButton.Position = UDim2.new(0, 10, 0.5, -17)
    OpenButton.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
    OpenButton.BackgroundTransparency = 0.3
    OpenButton.Text = "افتح القائمة"
    OpenButton.TextColor3 = Color3.fromRGB(255, 215, 0)
    OpenButton.TextSize = 14
    OpenButton.Font = Enum.Font.SourceSansBold
    OpenButton.Visible = false
    OpenButton.Parent = ScreenGui

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

    local ScrollingFrame = Instance.new("ScrollingFrame")
    ScrollingFrame.Size = UDim2.new(1, -16, 1, -45)
    ScrollingFrame.Position = UDim2.new(0, 8, 0, 35)
    ScrollingFrame.BackgroundTransparency = 1
    ScrollingFrame.BorderSizePixel = 0
    ScrollingFrame.CanvasSize = UDim2.new(0, 0, 0, 750)
    ScrollingFrame.ScrollBarThickness = 4
    ScrollingFrame.Parent = MainFrame

    local bodyVelocity = Instance.new("BodyVelocity")
    bodyVelocity.MaxForce = Vector3.new(4e5, 4e5, 4e5)
    bodyVelocity.Velocity = Vector3.zero

    local bodyGyro = Instance.new("BodyGyro")
    bodyGyro.MaxTorque = Vector3.new(4e5, 4e5, 4e5)
    bodyGyro.P = 9000

    local function updateStats()
        pcall(function()
            if player.Character and player.Character:FindFirstChild("Humanoid") then
                local humanoid = player.Character.Humanoid
                humanoid.WalkSpeed = speedEnabled and (16 * SPEED_LEVEL) or 16
                humanoid.UseJumpPower = true
                humanoid.JumpPower = jumpEnabled and (JUMP_HEIGHT * 10) or 50
            end
        end)
    end

    local flyBtn = Instance.new("TextButton")
    flyBtn.Size = UDim2.new(1, -8, 0, 32)
    flyBtn.Position = UDim2.new(0, 0, 0, 5)
    flyBtn.Text = "طيران: طافي"
    flyBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
    flyBtn.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
    flyBtn.BackgroundTransparency = 0.4
    flyBtn.TextSize = 14
    flyBtn.Font = Enum.Font.SourceSansBold
    flyBtn.Parent = ScrollingFrame

    local flyCorner = Instance.new("UICorner")
    flyCorner.CornerRadius = UDim.new(0, 6)
    flyCorner.Parent = flyBtn

    flyBtn.MouseButton1Click:Connect(function()
        flyEnabled = not flyEnabled
        if player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
            local root = player.Character.HumanoidRootPart
            if flyEnabled then
                bodyVelocity.Parent = root
                bodyGyro.Parent = root
                flyBtn.Text = "طيران: شغال"
                flyBtn.BackgroundColor3 = Color3.fromRGB(40, 160, 70)
                flyBtn.BackgroundTransparency = 0.3
            else
                bodyVelocity.Parent = nil
                bodyGyro.Parent = nil
                flyBtn.Text = "طيران: طافي"
                flyBtn.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
                flyBtn.BackgroundTransparency = 0.4
            end
        end
    end)

    local function createInputRow(labelTitle, defaultVal, yPos, onFocusLost)
        local label = Instance.new("TextLabel")
        label.Size = UDim2.new(0, 150, 0, 28)
        label.Position = UDim2.new(0, 0, 0, yPos)
        label.Text = labelTitle
        label.TextColor3 = Color3.fromRGB(255, 255, 255)
        label.BackgroundTransparency = 1
        label.TextXAlignment = Enum.TextXAlignment.Left
        label.TextSize = 14
        label.Font = Enum.Font.SourceSansBold
        label.Parent = ScrollingFrame

        local box = Instance.new("TextBox")
        box.Size = UDim2.new(0, 70, 0, 28)
        box.Position = UDim2.new(1, -78, 0, yPos)
        box.Text = tostring(defaultVal)
        box.TextColor3 = Color3.fromRGB(255, 255, 255)
        box.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
        box.BackgroundTransparency = 0.5
        box.TextSize = 14
        box.Font = Enum.Font.SourceSansBold
        box.Parent = ScrollingFrame

        local boxCorner = Instance.new("UICorner")
        boxCorner.CornerRadius = UDim.new(0, 5)
        boxCorner.Parent = box

        box.FocusLost:Connect(function()
            local num = tonumber(box.Text)
            if num then onFocusLost(num) else box.Text = tostring(defaultVal) end
        end)
    end

    createInputRow("قوة السرعة:", SPEED_LEVEL, 45, function(val) SPEED_LEVEL = val updateStats() end)
    createInputRow("قوة النط:", JUMP_HEIGHT, 80, function(val) JUMP_HEIGHT = val updateStats() end)
    createInputRow("سرعة الطيران:", FLY_SPEED_LEVEL, 115, function(val) FLY_SPEED_LEVEL = val end)

    local speedBtn = Instance.new("TextButton")
    speedBtn.Size = UDim2.new(1, -8, 0, 32)
    speedBtn.Position = UDim2.new(0, 0, 0, 155)
    speedBtn.Text = "السرعة: شغالة"
    speedBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
    speedBtn.BackgroundColor3 = Color3.fromRGB(40, 160, 70)
    speedBtn.BackgroundTransparency = 0.3
    speedBtn.TextSize = 14
    speedBtn.Font = Enum.Font.SourceSansBold
    speedBtn.Parent = ScrollingFrame

    local speedCorner = Instance.new("UICorner")
    speedCorner.CornerRadius = UDim.new(0, 6)
    speedCorner.Parent = speedBtn

    speedBtn.MouseButton1Click:Connect(function()
        speedEnabled = not speedEnabled
        updateStats()
        speedBtn.Text = speedEnabled and "السرعة: شغالة" or "السرعة: طافية"
        speedBtn.BackgroundColor3 = speedEnabled and Color3.fromRGB(40, 160, 70) or Color3.fromRGB(40, 40, 40)
        speedBtn.BackgroundTransparency = speedEnabled and 0.3 or 0.4
    end)

    local jumpBtn = Instance.new("TextButton")
    jumpBtn.Size = UDim2.new(1, -8, 0, 32)
    jumpBtn.Position = UDim2.new(0, 0, 0, 195)
    jumpBtn.Text = "النط: شغال"
    jumpBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
    jumpBtn.BackgroundColor3 = Color3.fromRGB(40, 160, 70)
    jumpBtn.BackgroundTransparency = 0.3
    jumpBtn.TextSize = 14
    jumpBtn.Font = Enum.Font.SourceSansBold
    jumpBtn.Parent = ScrollingFrame

    local jumpCorner = Instance.new("UICorner")
    jumpCorner.CornerRadius = UDim.new(0, 6)
    jumpCorner.Parent = jumpBtn

    jumpBtn.MouseButton1Click:Connect(function()
        jumpEnabled = not jumpEnabled
        updateStats()
        jumpBtn.Text = jumpEnabled and "النط: شغال" or "النط: طافي"
        jumpBtn.BackgroundColor3 = jumpEnabled and Color3.fromRGB(40, 160, 70) or Color3.fromRGB(40, 40, 40)
        jumpBtn.BackgroundTransparency = jumpEnabled and 0.3 or 0.4
    end)

    local bodyVisualTitle = Instance.new("TextLabel")
    bodyVisualTitle.Size = UDim2.new(1, -8, 0, 22)
    bodyVisualTitle.Position = UDim2.new(0, 0, 0, 235)
    bodyVisualTitle.Text = "--- تخفي الجسم (عندك فقط) ---"
    bodyVisualTitle.TextColor3 = Color3.fromRGB(255, 215, 0)
    bodyVisualTitle.BackgroundTransparency = 1
    bodyVisualTitle.TextSize = 14
    bodyVisualTitle.Font = Enum.Font.SourceSansBold
    bodyVisualTitle.Parent = ScrollingFrame

    local function updateBodyVisuals()
        pcall(function()
            local char = player.Character
            if not char then return end

            local head = char:FindFirstChild("Head")
            if head then head.LocalTransparencyModifier = hideHeadEnabled and 1 or 0 end

            for _, acc in pairs(char:GetChildren()) do
                if acc:IsA("Accessory") and acc:FindFirstChild("Handle") then
                    local attachment = acc.Handle:FindFirstChildOfClass("Attachment")
                    if attachment and (attachment.Name:find("Hat") or attachment.Name:find("Hair") or attachment.Name:find("Face") or attachment.Name:find("Head")) then
                        acc.Handle.LocalTransparencyModifier = hideHeadEnabled and 1 or 0
                    end
                end
            end

            local legNames = {"Left Leg", "Right Leg", "LeftUpperLeg", "LeftLowerLeg", "LeftFoot", "RightUpperLeg", "RightLowerLeg", "RightFoot"}
            for _, partName in pairs(legNames) do
                local legPart = char:FindFirstChild(partName)
                if legPart and legPart:IsA("BasePart") then legPart.LocalTransparencyModifier = hideLegsEnabled and 1 or 0 end
            end
        end)
    end

    local headBtn = Instance.new("TextButton")
    headBtn.Size = UDim2.new(1, -8, 0, 32)
    headBtn.Position = UDim2.new(0, 0, 0, 260)
    headBtn.Text = "رأس مخفي: طافي"
    headBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
    headBtn.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
    headBtn.BackgroundTransparency = 0.4
    headBtn.TextSize = 14
    headBtn.Font = Enum.Font.SourceSansBold
    headBtn.Parent = ScrollingFrame

    local headCorner = Instance.new("UICorner")
    headCorner.CornerRadius = UDim.new(0, 6)
    headCorner.Parent = headBtn

    headBtn.MouseButton1Click:Connect(function()
        hideHeadEnabled = not hideHeadEnabled
        updateBodyVisuals()
        headBtn.Text = hideHeadEnabled and "رأس مخفي: شغال" or "رأس مخفي: طافي"
        headBtn.BackgroundColor3 = hideHeadEnabled and Color3.fromRGB(40, 160, 70) or Color3.fromRGB(40, 40, 40)
        headBtn.BackgroundTransparency = hideHeadEnabled and 0.3 or 0.4
    end)

    local legBtn = Instance.new("TextButton")
    legBtn.Size = UDim2.new(1, -8, 0, 32)
    legBtn.Position = UDim2.new(0, 0, 0, 298)
    legBtn.Text = "رجل مخفية: طافية"
    legBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
    legBtn.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
    legBtn.BackgroundTransparency = 0.4
    legBtn.TextSize = 14
    legBtn.Font = Enum.Font.SourceSansBold
    legBtn.Parent = ScrollingFrame

    local legCorner = Instance.new("UICorner")
    legCorner.CornerRadius = UDim.new(0, 6)
    legCorner.Parent = legBtn

    legBtn.MouseButton1Click:Connect(function()
        hideLegsEnabled = not hideLegsEnabled
        updateBodyVisuals()
        legBtn.Text = hideLegsEnabled and "رجل مخفية: شغالة" or "رجل مخفية: طافية"
        legBtn.BackgroundColor3 = hideLegsEnabled and Color3.fromRGB(40, 160, 70) or Color3.fromRGB(40, 40, 40)
        legBtn.BackgroundTransparency = hideLegsEnabled and 0.3 or 0.4
    end)

    -- إعداد ESP واللوت للخصوم
    for _, p in pairs(Players:GetPlayers()) do
        if p ~= player then
            p.CharacterAdded:Connect(function(char)
                task.wait(1)
                local hl = Instance.new("Highlight", char)
                hl.Name = "PlayerHighlight"
                hl.FillColor = Color3.fromRGB(255, 30, 30)
                hl.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
            end)
        end
    end

    -- محرك الأيم بوت المستمر
    RunService.RenderStepped:Connect(function()
        if aimbot then
            local target = nil
            local closestToCenter = FOV_RADIUS
            local screenCenter = Vector3.new(Camera.ViewportSize.X / 2, Camera.ViewportSize.Y / 2, 0)

            for _, p in pairs(Players:GetPlayers()) do
                if p ~= player and p.Character and p.Character:FindFirstChild("Head") then
                    local hum = p.Character:FindFirstChildOfClass("Humanoid")
                    if hum and hum.Health > 0 then
                        local head = p.Character.Head
                        local screenPos, onScreen = Camera:WorldToViewportPoint(head.Position)
                        
                        if onScreen and screenPos.Z > 0 then
                            local mouseDist = (Vector3.new(screenPos.X, screenPos.Y, 0) - screenCenter).Magnitude
                            if mouseDist < closestToCenter then
                                closestToCenter = mouseDist
                                target = head
                            end
                        end
                    end
                end
            end
            
            if target then
                Camera.CFrame = CFrame.new(Camera.CFrame.Position, target.Position)
            end
        end

        if flyEnabled and player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
            local camCFrame = Camera.CFrame
            bodyGyro.CFrame = camCFrame
            local moveDir = Vector3.zero
            if UserInputService:IsKeyDown(Enum.KeyCode.W) then moveDir = moveDir + camCFrame.LookVector end
            if UserInputService:IsKeyDown(Enum.KeyCode.S) then moveDir = moveDir - camCFrame.LookVector end
            if UserInputService:IsKeyDown(Enum.KeyCode.A) then moveDir = moveDir - camCFrame.RightVector end
            if UserInputService:IsKeyDown(Enum.KeyCode.D) then moveDir = moveDir + camCFrame.RightVector end
            if UserInputService:IsKeyDown(Enum.KeyCode.Space) then moveDir = moveDir + Vector3.new(0, 1, 0) end
            if UserInputService:IsKeyDown(Enum.KeyCode.LeftShift) then moveDir = moveDir - Vector3.new(0, 1, 0) end

            if moveDir.Magnitude > 0 then
                bodyVelocity.Velocity = moveDir.Unit * (50 * FLY_SPEED_LEVEL)
            else
                bodyVelocity.Velocity = Vector3.zero
            end
        end
    end)

    -- مؤقت الساعة (بعد 3600 ثانية = ساعة كاملة، يغلق السكربت ويختفي تلقائياً)
    task.delay(3600, function()
        if ScreenGui then ScreenGui:Destroy() end
        if FalehGui then FalehGui:Destroy() end
    end)
end

SubmitBtn.MouseButton1Click:Connect(function()
    if KeyTextBox.Text == currentGeneratedKey then
        SubmitBtn.Text = "تم التفعيل بنجاح!"
        SubmitBtn.BackgroundColor3 = Color3.fromRGB(0, 180, 80)
        task.wait(1)
        loadMainScript()
    else
        SubmitBtn.Text = "كود خاطئ! حاول مجدداً"
        SubmitBtn.BackgroundColor3 = Color3.fromRGB(200, 40, 40)
        task.wait(1.5)
        SubmitBtn.Text = "تفعيل السكربت"
        SubmitBtn.BackgroundColor3 = Color3.fromRGB(40, 160, 70)
    end
end)
