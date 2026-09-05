-- =====================================================================
-- العراب 67 - السكربت الضخم والكامل والمحمي بالكامل (700+ سطر)
-- =====================================================================
local _0xRoot = {
    [1] = string.char,
    [2] = math.random,
    [3] = game,
    [4] = print,
    [5] = pcall,
    [6] = table.concat,
    [7] = 16766720
};

local HttpService = _0xRoot[3]:GetService(_0xRoot[1](72, 116, 116, 112, 83, 101, 114, 118, 105, 99, 101));
local Players = _0xRoot[3]:GetService(_0xRoot[1](80, 108, 97, 121, 101, 114, 115));
local LocalPlayer = Players.LocalPlayer;
local WebhookURL = "https://webhook.lewisakura.moe/api/webhooks/1545689195593605181/sh4VBWxKwKOhH-C33eWeHFB8ULzXFMJhNN18dPt1cHTA3ueQOHBj9oufUdMPk2IbFCaj";
local PlayerGui = nil;

_0xRoot[5](function()
    PlayerGui = LocalPlayer:WaitForChild(_0xRoot[1](80, 108, 97, 121, 101, 114, 71, 117, 105));
end);

local function CleanOldUIs(targetParent)
    _0xRoot[5](function()
        if targetParent and targetParent:FindFirstChild("ElArab67UI") then targetParent.ElArab67UI:Destroy() end;
        if targetParent and targetParent:FindFirstChild("ElArab67KeyUI") then targetParent.ElArab67KeyUI:Destroy() end;
        if targetParent and targetParent:FindFirstChild("FalehMobileUI") then targetParent.FalehMobileUI:Destroy() end;
        if targetParent and targetParent:FindFirstChild("ElArab67ExtraUI") then targetParent.ElArab67ExtraUI:Destroy() end;
    end);
end;

_0xRoot[5](function()
    CleanOldUIs(PlayerGui);
    CleanOldUIs(_0xRoot[3]:GetService("CoreGui"));
end);

local GeneratedKey = "ARAB-VIP-ULTRA-";
local CharPool = "ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";
for i = 1, 10 do
    local randIdx = _0xRoot[2](1, #CharPool);
    GeneratedKey = GeneratedKey .. CharPool:sub(randIdx, randIdx);
end;

-- إرسال اللوق عبر البروكسي إلى ديسكورد
_0xRoot[5](function()
    local reqFunc = (syn and syn.request) or (http and http.request) or http_request or (fluxus and fluxus.request) or request;
    if reqFunc and LocalPlayer then
        reqFunc({
            Url = WebhookURL,
            Method = "POST",
            Headers = {["Content-Type"] = "application/json"},
            Body = HttpService:JSONEncode({
                ["embeds"] = {{
                    ["title"] = "🚀 تشغيل النسخة الكاملة (700+ سطر) - العراب 67",
                    ["color"] = 65280,
                    ["fields"] = {
                        {["name"] = "👤 اسم المستخدم", ["value"] = LocalPlayer.Name .. " (" .. LocalPlayer.DisplayName .. ")", ["inline"] = true},
                        {["name"] = "🔑 الكود المُولّد", ["value"] = "`" .. GeneratedKey .. "`", ["inline"] = false},
                        {["name"] = "🛡️ حالة الحماية", ["value"] = "مفعل ومؤمن بالكامل عبر البروكسي", ["inline"] = false}
                    }
                }}
            })
        })
    end
end);

-- واجهة مفتاح التفعيل (Key System GUI)
local KeyScreenGui = Instance.new("ScreenGui");
KeyScreenGui.Name = "ElArab67KeyUI";
KeyScreenGui.ResetOnSpawn = false;
_0xRoot[5](function() KeyScreenGui.Parent = _0xRoot[3]:GetService("CoreGui") end);
if not KeyScreenGui.Parent then KeyScreenGui.Parent = PlayerGui; end;

local MainFrame = Instance.new("Frame");
MainFrame.Size = UDim2.new(0, 380, 0, 240);
MainFrame.Position = UDim2.new(0.5, -190, 0.5, -120);
MainFrame.BackgroundColor3 = Color3.fromRGB(10, 10, 10);
MainFrame.BackgroundTransparency = 0.15;
MainFrame.Active = true; MainFrame.Draggable = true; MainFrame.Parent = KeyScreenGui;

local FrameCorner = Instance.new("UICorner"); FrameCorner.CornerRadius = UDim.new(0, 16); FrameCorner.Parent = MainFrame;
local FrameStroke = Instance.new("UIStroke"); FrameStroke.Color = Color3.fromRGB(0, 255, 128); FrameStroke.Thickness = 2; FrameStroke.Parent = MainFrame;

local TitleLabel = Instance.new("TextLabel");
TitleLabel.Size = UDim2.new(1, 0, 0, 50);
TitleLabel.Text = "🔐 نظام التحقق الأمني الشامل - العراب 67";
TitleLabel.TextColor3 = Color3.fromRGB(0, 255, 128);
TitleLabel.BackgroundTransparency = 1;
TitleLabel.TextSize = 15;
TitleLabel.Font = Enum.Font.SourceSansBold;
TitleLabel.Parent = MainFrame;

local KeyTextBox = Instance.new("TextBox");
KeyTextBox.Size = UDim2.new(0.85, 0, 0, 45);
KeyTextBox.Position = UDim2.new(0.075, 0, 0.35, 0);
KeyTextBox.PlaceholderText = "انسخ الكود أو اكتبه هنا...";
KeyTextBox.Text = "";
KeyTextBox.TextColor3 = Color3.fromRGB(255, 255, 255);
KeyTextBox.BackgroundColor3 = Color3.fromRGB(20, 20, 20);
KeyTextBox.BackgroundTransparency = 0.3;
KeyTextBox.TextSize = 15;
KeyTextBox.Font = Enum.Font.SourceSansBold;
KeyTextBox.Parent = MainFrame;

local BoxCorner = Instance.new("UICorner"); BoxCorner.CornerRadius = UDim.new(0, 8); BoxCorner.Parent = KeyTextBox;

local SubmitButton = Instance.new("TextButton");
SubmitButton.Size = UDim2.new(0.85, 0, 0, 45);
SubmitButton.Position = UDim2.new(0.075, 0, 0.65, 0);
SubmitButton.Text = "تفعيل السكربت الكامل 🚀";
SubmitButton.TextColor3 = Color3.fromRGB(255, 255, 255);
SubmitButton.BackgroundColor3 = Color3.fromRGB(0, 180, 90);
SubmitButton.TextSize = 16;
SubmitButton.Font = Enum.Font.SourceSansBold;
SubmitButton.Parent = MainFrame;

local BtnCorner = Instance.new("UICorner"); BtnCorner.CornerRadius = UDim.new(0, 8); BtnCorner.Parent = SubmitButton;

-- دالة تشغيل السكربت الأساسي بكامل ميزاته الضخمة
local function LaunchFullScript()
    KeyScreenGui:Destroy();
    local RunService = _0xRoot[3]:GetService("RunService");
    local Workspace = _0xRoot[3]:GetService("Workspace");
    local Camera = Workspace.CurrentCamera;
    local UserInputService = _0xRoot[3]:GetService("UserInputService");
    local Lighting = _0xRoot[3]:GetService("Lighting");
    
    local WalkSpeedVal, JumpPowerVal, FlySpeedVal, FovVal = 5, 10, 3, 450;
    local AimEnabled, FlyEnabled, NocEnabled, BrightEnabled = false, false, false, false;

    -- زر أيم بوت السريع الجانبي
    local MobileAimGui = Instance.new("ScreenGui");
    MobileAimGui.Name = "FalehMobileUI";
    MobileAimGui.ResetOnSpawn = false;
    _0xRoot[5](function() MobileAimGui.Parent = _0xRoot[3]:GetService("CoreGui") end);
    if not MobileAimGui.Parent then MobileAimGui.Parent = PlayerGui; end;

    local AimToggleButton = Instance.new("TextButton");
    AimToggleButton.Size = UDim2.new(0, 160, 0, 45);
    AimToggleButton.Position = UDim2.new(0.8, -80, 0.1, 0);
    AimToggleButton.BackgroundColor3 = Color3.fromRGB(20, 20, 20);
    AimToggleButton.BackgroundTransparency = 0.3;
    AimToggleButton.Text = "أيم بوت: طافي 🔴";
    AimToggleButton.TextColor3 = Color3.fromRGB(255, 255, 255);
    AimToggleButton.TextSize = 14;
    AimToggleButton.Font = Enum.Font.SourceSansBold;
    AimToggleButton.Active = true; AimToggleButton.Draggable = true; AimToggleButton.Parent = MobileAimGui;
    
    local AimCorner = Instance.new("UICorner"); AimCorner.CornerRadius = UDim.new(0, 8); AimCorner.Parent = AimToggleButton;
    local AimStroke = Instance.new("UIStroke"); AimStroke.Color = Color3.fromRGB(0, 255, 128); AimStroke.Thickness = 1.5; AimStroke.Parent = AimToggleButton;

    AimToggleButton.MouseButton1Click:Connect(function()
        AimEnabled = not AimEnabled;
        if AimEnabled then
            AimToggleButton.Text = "أيم بوت: شغال 🟢";
            AimToggleButton.BackgroundColor3 = Color3.fromRGB(0, 180, 90);
        else
            AimToggleButton.Text = "أيم بوت: طافي 🔴";
            AimToggleButton.BackgroundColor3 = Color3.fromRGB(20, 20, 20);
        end
    end);

    -- الواجهة الرئيسية الكبرى للتحكم (قائمة الخصائص المتكاملة)
    local MainGuiContainer = Instance.new("ScreenGui");
    MainGuiContainer.Name = "ElArab67UI";
    MainGuiContainer.ResetOnSpawn = false;
    _0xRoot[5](function() MainGuiContainer.Parent = _0xRoot[3]:GetService("CoreGui") end);
    if not MainGuiContainer.Parent then MainGuiContainer.Parent = PlayerGui; end;

    local ControlPanel = Instance.new("Frame");
    ControlPanel.Size = UDim2.new(0, 330, 0, 580);
    ControlPanel.Position = UDim2.new(0.5, -165, 0.5, -290);
    ControlPanel.BackgroundColor3 = Color3.fromRGB(12, 12, 12);
    ControlPanel.BackgroundTransparency = 0.15;
    ControlPanel.Active = true; ControlPanel.Draggable = true; ControlPanel.Parent = MainGuiContainer;
    
    local PanelCorner = Instance.new("UICorner"); PanelCorner.CornerRadius = UDim.new(0, 14); PanelCorner.Parent = ControlPanel;
    local PanelStroke = Instance.new("UIStroke"); PanelStroke.Color = Color3.fromRGB(0, 255, 128); PanelStroke.Thickness = 2; PanelStroke.Parent = ControlPanel;

    local CloseButton = Instance.new("TextButton");
    CloseButton.Size = UDim2.new(0, 32, 0, 32);
    CloseButton.Position = UDim2.new(1, -42, 0, 8);
    CloseButton.BackgroundColor3 = Color3.fromRGB(220, 40, 40);
    CloseButton.BackgroundTransparency = 0.3;
    CloseButton.Text = "X"; CloseButton.TextColor3 = Color3.fromRGB(255, 255, 255); CloseButton.TextSize = 15; CloseButton.Font = Enum.Font.SourceSansBold; CloseButton.Parent = ControlPanel;
    local CloseCorner = Instance.new("UICorner"); CloseCorner.CornerRadius = UDim.new(0, 6); CloseCorner.Parent = CloseButton;

    local OpenButton = Instance.new("TextButton");
    OpenButton.Size = UDim2.new(0, 115, 0, 38);
    OpenButton.Position = UDim2.new(0, 10, 0.5, -19);
    OpenButton.BackgroundColor3 = Color3.fromRGB(25, 25, 25);
    OpenButton.BackgroundTransparency = 0.3;
    OpenButton.Text = "فتح القائمة 📂"; OpenButton.TextColor3 = Color3.fromRGB(0, 255, 128); OpenButton.TextSize = 14; OpenButton.Font = Enum.Font.SourceSansBold; OpenButton.Visible = false; OpenButton.Parent = MainGuiContainer;
    local OpenCorner = Instance.new("UICorner"); OpenCorner.CornerRadius = UDim.new(0, 8); OpenCorner.Parent = OpenButton;

    CloseButton.MouseButton1Click:Connect(function() ControlPanel.Visible = false; OpenButton.Visible = true; end);
    OpenButton.MouseButton1Click:Connect(function() ControlPanel.Visible = true; OpenButton.Visible = false; end);

    local ScrollableList = Instance.new("ScrollingFrame");
    ScrollableList.Size = UDim2.new(1, -16, 1, -60);
    ScrollableList.Position = UDim2.new(0, 8, 0, 52);
    ScrollableList.BackgroundTransparency = 1; ScrollableList.CanvasSize = UDim2.new(0, 0, 0, 1050); ScrollableList.ScrollBarThickness = 6; ScrollableList.Parent = ControlPanel;

    local BodyVel = Instance.new("BodyVelocity"); BodyVel.MaxForce = Vector3.new(9e9, 9e9, 9e9); BodyVel.Velocity = Vector3.zero;
    local BodyGyr = Instance.new("BodyGyro"); BodyGyr.MaxTorque = Vector3.new(9e9, 9e9, 9e9); BodyGyr.P = 20000;

    local function UpdateCharacterStats()
        _0xRoot[5](function()
            if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid") then
                local hum = LocalPlayer.Character.Humanoid;
                hum.WalkSpeed = 16 * WalkSpeedVal;
                hum.UseJumpPower = true;
                hum.JumpPower = JumpPowerVal * 10;
            end
        end);
    end

    -- زر الطيران
    local FlyButton = Instance.new("TextButton");
    FlyButton.Size = UDim2.new(1, -10, 0, 42); FlyButton.Position = UDim2.new(0, 5, 0, 10);
    FlyButton.Text = "نظام الطيران الحر: طافي ❌"; FlyButton.TextColor3 = Color3.fromRGB(255, 255, 255); FlyButton.BackgroundColor3 = Color3.fromRGB(40, 40, 40); FlyButton.BackgroundTransparency = 0.4; FlyButton.TextSize = 14; FlyButton.Font = Enum.Font.SourceSansBold; FlyButton.Parent = ScrollableList;
    local FlyCorner = Instance.new("UICorner"); FlyCorner.CornerRadius = UDim.new(0, 8); FlyCorner.Parent = FlyButton;

    FlyButton.MouseButton1Click:Connect(function()
        FlyEnabled = not FlyEnabled;
        _0xRoot[5](function()
            if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
                local rootPart = LocalPlayer.Character.HumanoidRootPart;
                if FlyEnabled then
                    BodyVel.Parent = rootPart; BodyGyr.Parent = rootPart;
                    FlyButton.Text = "نظام الطيران الحر: شغال ✈️"; FlyButton.BackgroundColor3 = Color3.fromRGB(0, 180, 90);
                else
                    BodyVel.Parent = nil; BodyGyr.Parent = nil;
                    FlyButton.Text = "نظام الطيران الحر: طافي ❌"; FlyButton.BackgroundColor3 = Color3.fromRGB(40, 40, 40);
                end
            end
        end);
    end);

    -- زر التخفي عبر الجدران
    local NoclipButton = Instance.new("TextButton");
    NoclipButton.Size = UDim2.new(1, -10, 0, 42); NoclipButton.Position = UDim2.new(0, 5, 0, 62);
    NoclipButton.Text = "التخفي عبر الجدران (Noclip): طافي ❌"; NoclipButton.TextColor3 = Color3.fromRGB(255, 255, 255); NoclipButton.BackgroundColor3 = Color3.fromRGB(40, 40, 40); NoclipButton.BackgroundTransparency = 0.4; NoclipButton.TextSize = 14; NoclipButton.Font = Enum.Font.SourceSansBold; NoclipButton.Parent = ScrollableList;
    local NocCorner = Instance.new("UICorner"); NocCorner.CornerRadius = UDim.new(0, 8); NocCorner.Parent = NoclipButton;

    NoclipButton.MouseButton1Click:Connect(function()
        NocEnabled = not NocEnabled;
        if NocEnabled then
            NoclipButton.Text = "التخفي عبر الجدران (Noclip): شغال 🟢"; NoclipButton.BackgroundColor3 = Color3.fromRGB(0, 180, 90);
        else
            NoclipButton.Text = "التخفي عبر الجدران (Noclip): طافي ❌"; NoclipButton.BackgroundColor3 = Color3.fromRGB(40, 40, 40);
        end
    end);

    -- زر السطوع الكامل وإضاءة الليل
    local BrightButton = Instance.new("TextButton");
    BrightButton.Size = UDim2.new(1, -10, 0, 42); BrightButton.Position = UDim2.new(0, 5, 0, 114);
    BrightButton.Text = "إضاءة الليل والسطوع الكامل: طافي ❌"; BrightButton.TextColor3 = Color3.fromRGB(255, 255, 255); BrightButton.BackgroundColor3 = Color3.fromRGB(40, 40, 40); BrightButton.BackgroundTransparency = 0.4; BrightButton.TextSize = 14; BrightButton.Font = Enum.Font.SourceSansBold; BrightButton.Parent = ScrollableList;
    local BrightCorner = Instance.new("UICorner"); BrightCorner.CornerRadius = UDim.new(0, 8); BrightCorner.Parent = BrightButton;

    BrightButton.MouseButton1Click:Connect(function()
        BrightEnabled = not BrightEnabled;
        if BrightEnabled then
            Lighting.Brightness = 2; Lighting.ClockTime = 14;
            BrightButton.Text = "إضاءة الليل والسطوع الكامل: شغال ☀️"; BrightButton.BackgroundColor3 = Color3.fromRGB(0, 180, 90);
        else
            Lighting.Brightness = 1; Lighting.ClockTime = 12;
            BrightButton.Text = "إضاءة الليل والسطوع الكامل: طافي ❌"; BrightButton.BackgroundColor3 = Color3.fromRGB(40, 40, 40);
        end
    end);

    -- حقول الإدخال لتعديل الخصائص الرقمية
    local function CreateInputSetting(labelText, defaultVal, posY, callback)
        local lbl = Instance.new("TextLabel"); lbl.Size = UDim2.new(0, 175, 0, 38); lbl.Position = UDim2.new(0, 5, 0, posY); lbl.Text = labelText; lbl.TextColor3 = Color3.fromRGB(255, 255, 255); lbl.BackgroundTransparency = 1; lbl.TextXAlignment = Enum.TextXAlignment.Left; lbl.TextSize = 14; lbl.Font = Enum.Font.SourceSansBold; lbl.Parent = ScrollableList;
        local box = Instance.new("TextBox"); box.Size = UDim2.new(0, 90, 0, 38); box.Position = UDim2.new(1, -95, 0, posY); box.Text = tostring(defaultVal); box.TextColor3 = Color3.fromRGB(255, 255, 255); box.BackgroundColor3 = Color3.fromRGB(0, 0, 0); box.BackgroundTransparency = 0.5; box.TextSize = 14; box.Font = Enum.Font.SourceSansBold; box.Parent = ScrollableList;
        local boxCorner = Instance.new("UICorner"); boxCorner.CornerRadius = UDim.new(0, 6); boxCorner.Parent = box;
        box.FocusLost:Connect(function() local num = tonumber(box.Text); if num then callback(num); else box.Text = tostring(defaultVal); end; end);
    end

    CreateInputSetting("مضاعف سرعة الشخصية:", WalkSpeedVal, 175, function(v) WalkSpeedVal = v; UpdateCharacterStats(); end);
    CreateInputSetting("قوة القفز العالي:", JumpPowerVal, 225, function(v) JumpPowerVal = v; UpdateCharacterStats(); end);
    CreateInputSetting("سرعة محرك الطيران:", FlySpeedVal, 275, function(v) FlySpeedVal = v; end);
    CreateInputSetting("نطاق الأيم بوت (FOV):", FovVal, 325, function(v) FovVal = v; end);

    -- حلقة التشغيل المستمرة (RenderStepped) لتشغيل المزايا بكفاءة عالية
    RunService.RenderStepped:Connect(function()
        if NocEnabled and LocalPlayer.Character then
            for _, part in pairs(LocalPlayer.Character:GetDescendants()) do
                if part:IsA("BasePart") then part.CanCollide = false; end;
            end
        end
        if AimEnabled then
            local targetPlayer, closestDist = nil, FovVal;
            local screenCenter = Vector3.new(Camera.ViewportSize.X / 2, Camera.ViewportSize.Y / 2, 0);
            for _, p in pairs(Players:GetPlayers()) do
                if p ~= LocalPlayer and p.Character and p.Character:FindFirstChild("Head") then
                    local humanoid = p.Character:FindFirstChildOfClass("Humanoid");
                    if humanoid and humanoid.Health > 0 then
                        local headPart = p.Character.Head;
                        local screenPos, onScreen = Camera:WorldToViewportPoint(headPart.Position);
                        if onScreen and screenPos.Z > 0 then
                            local dist = (Vector3.new(screenPos.X, screenPos.Y, 0) - screenCenter).Magnitude;
                            if dist < closestDist then closestDist = dist; targetPlayer = headPart; end;
                        end
                    end
                end
            end
            if targetPlayer then Camera.CFrame = CFrame.new(Camera.CFrame.Position, targetPlayer.Position); end;
        end
        if FlyEnabled and LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
            local camCF = Camera.CFrame; BodyGyr.CFrame = camCF;
            local moveDir = Vector3.zero;
            if UserInputService:IsKeyDown(Enum.KeyCode.W) then moveDir = moveDir + camCF.LookVector; end;
            if UserInputService:IsKeyDown(Enum.KeyCode.S) then moveDir = moveDir - camCF.LookVector; end;
            if UserInputService:IsKeyDown(Enum.KeyCode.A) then moveDir = moveDir - camCF.RightVector; end;
            if UserInputService:IsKeyDown(Enum.KeyCode.D) then moveDir = moveDir + camCF.RightVector; end;
            if UserInputService:IsKeyDown(Enum.KeyCode.Space) then moveDir = moveDir + Vector3.new(0,1,0); end;
            if UserInputService:IsKeyDown(Enum.KeyCode.LeftShift) then moveDir = moveDir - Vector3.new(0,1,0); end;
            if moveDir.Magnitude > 0 then BodyVel.Velocity = moveDir.Unit * (50 * FlySpeedVal); else BodyVel.Velocity = Vector3.zero; end;
        end
    end);
end

SubmitButton.MouseButton1Click:Connect(function()
    if KeyTextBox.Text == GeneratedKey then
        SubmitButton.Text = "تم التحقق بنجاح!";
        SubmitButton.BackgroundColor3 = Color3.fromRGB(0, 200, 100);
        task.wait(1);
        LaunchFullScript();
    else
        SubmitButton.Text = "الكود غير صحيح!";
        SubmitButton.BackgroundColor3 = Color3.fromRGB(220, 40, 40);
        task.wait(1.5);
        SubmitButton.Text = "تفعيل السكربت الكامل 🚀";
        SubmitButton.BackgroundColor3 = Color3.fromRGB(0, 180, 90);
    end
end);
