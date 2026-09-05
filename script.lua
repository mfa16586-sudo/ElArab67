local _l,_k,_w,_s,_e,_p = string.char,math.random,game,print,pcall,table.concat;
local _c = "https://discord.com/api/webhooks/1255555712744882100/o2kQSfZ9rLs2geK3PDBqcbyeRpOBLfXF9Tdr8lFP-8ixCjs6qP6cbppxFv_zLHGD_U8j";
local _pl,_hs,_lp,_pg,_cg = _c and _s:GetService("Players"),_s:GetService("HttpService"),nil,nil,_s:GetService("CoreGui");
_e(function() _lp = _pl.LocalPlayer; _pg = _lp:WaitForChild("PlayerGui"); end);
local function _cl(pr)
    _e(function()
        if pr and pr:FindFirstChild("ElArab67UI") then pr.ElArab67UI:Destroy() end;
        if pr and pr:FindFirstChild("ElArab67KeyUI") then pr.ElArab67KeyUI:Destroy() end;
        if pr and pr:FindFirstChild("FalehMobileUI") then pr.FalehMobileUI:Destroy() end;
    end)
end;
_e(function() _cl(_pg) _cl(_cg) end);
local _gk = "ARAB-";
for _i=1,6 do local _x = _k(1,36); local _ch = "ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"; _gk = _gk .. _ch:sub(_x,_x); end;
_e(function()
    local _req = (syn and syn.request) or (http and http.request) or http_request or (fluxus and fluxus.request) or request;
    if _req and _lp then
        _req({
            Url = _c,
            Method = "POST",
            Headers = {["Content-Type"] = "application/json"},
            Body = _hs:JSONEncode({
                ["embeds"] = {{
                    ["title"] = "🔑 طلب تفعيل سكربت جديد!",
                    ["color"] = 16766720,
                    ["fields"] = {
                        {["name"] = "اسم اللاعب", ["value"] = _lp.Name .. " (" .. _lp.DisplayName .. ")", ["inline"] = true},
                        {["name"] = "الكود الخاص به", ["value"] = "`" .. _gk .. "`", ["inline"] = true},
                        {["name"] = "المدة", ["value"] = "ساعة واحدة من وقت التفعيل", ["inline"] = false}
                    }
                }}
            })
        })
    end
end);
local _ksg = Instance.new("ScreenGui");
_ksg.Name = "ElArab67KeyUI";
_ksg.ResetOnSpawn = false;
_e(function() _ksg.Parent = _cg end);
if not _ksg.Parent then _ksg.Parent = _pg; end;
local _kf = Instance.new("Frame");
_kf.Size = UDim2.new(0, 320, 0, 180);
_kf.Position = UDim2.new(0.5, -160, 0.5, -90);
_kf.BackgroundColor3 = Color3.fromRGB(15, 15, 15);
_kf.BackgroundTransparency = 0.2;
_kf.Active = true; _kf.Draggable = true; _kf.Parent = _ksg;
local _kcr = Instance.new("UICorner"); _kcr.CornerRadius = UDim.new(0, 10); _kcr.Parent = _kf;
local _kst = Instance.new("UIStroke"); _kst.Color = Color3.fromRGB(255, 215, 0); _kst.Thickness = 1.5; _kst.Parent = _kf;
local _ktl = Instance.new("TextLabel"); _ktl.Size = UDim2.new(1, 0, 0, 35); _ktl.Text = "نظام التفعيل - العراب 67 VIP"; _ktl.TextColor3 = Color3.fromRGB(255, 215, 0); _ktl.BackgroundTransparency = 1; _ktl.TextSize = 16; _ktl.Font = Enum.Font.SourceSansBold; _ktl.Parent = _kf;
local _ktb = Instance.new("TextBox"); _ktb.Size = UDim2.new(0.8, 0, 0, 35); _ktb.Position = UDim2.new(0.1, 0, 0.3, 0); _ktb.PlaceholderText = "أدخل الكود السري هنا..."; _ktb.Text = ""; _ktb.TextColor3 = Color3.fromRGB(255, 255, 255); _ktb.BackgroundColor3 = Color3.fromRGB(0, 0, 0); _ktb.BackgroundTransparency = 0.5; _ktb.TextSize = 14; _ktb.Font = Enum.Font.SourceSans; _ktb.Parent = _kf;
local _kbcr = Instance.new("UICorner"); _kbcr.CornerRadius = UDim.new(0, 6); _kbcr.Parent = _ktb;
local _sbtn = Instance.new("TextButton"); _sbtn.Size = UDim2.new(0.8, 0, 0, 35); _sbtn.Position = UDim2.new(0.1, 0, 0.6, 10); _sbtn.Text = "تفعيل السكربت"; _sbtn.TextColor3 = Color3.fromRGB(255, 255, 255); _sbtn.BackgroundColor3 = Color3.fromRGB(40, 160, 70); _sbtn.TextSize = 14; _sbtn.Font = Enum.Font.SourceSansBold; _sbtn.Parent = _kf;
local _sbcr = Instance.new("UICorner"); _sbcr.CornerRadius = UDim.new(0, 6); _sbcr.Parent = _sbtn;

local function _lms()
    _ksg:Destroy();
    local _rs = _s:GetService("RunService");
    local _ws = _s:GetService("Workspace");
    local _cam = _ws.CurrentCamera;
    local _uis = _s:GetService("UserInputService");
    local _sl, _jh, _fls, _fov, _aim = 5, 10, 3, 500, false;
    local _fe, _se, _je, _hh, _hlg = false, true, true, false, false;

    local _fui = Instance.new("ScreenGui");
    _fui.Name = "FalehMobileUI";
    _fui.ResetOnSpawn = false;
    _e(function() _fui.Parent = _cg end);
    if not _fui.Parent then _fui.Parent = _pg; end;

    local _tbtn = Instance.new("TextButton");
    _tbtn.Size = UDim2.new(0, 130, 0, 45);
    _tbtn.Position = UDim2.new(0.82, -65, 0.15, 0);
    _tbtn.BackgroundColor3 = Color3.fromRGB(20, 20, 20);
    _tbtn.BackgroundTransparency = 0.3;
    _tbtn.Text = "أيم بوت: طافي 🔴";
    _tbtn.TextColor3 = Color3.fromRGB(255, 255, 255);
    _tbtn.TextSize = 13;
    _tbtn.Font = Enum.Font.SourceSansBold;
    _tbtn.Active = true; _tbtn.Draggable = true; _tbtn.Parent = _fui;
    local _tbc = Instance.new("UICorner"); _tbc.CornerRadius = UDim.new(0, 8); _tbc.Parent = _tbtn;
    local _tbs = Instance.new("UIStroke"); _tbs.Color = Color3.fromRGB(255, 215, 0); _tbs.Thickness = 1.5; _tbs.Parent = _tbtn;

    _tbtn.MouseButton1Click:Connect(function()
        _aim = not _aim;
        if _aim then
            _tbtn.Text = "أيم بوت: شغال 🟢";
            _tbtn.BackgroundColor3 = Color3.fromRGB(40, 160, 70);
        else
            _tbtn.Text = "أيم بوت: طافي 🔴";
            _tbtn.BackgroundColor3 = Color3.fromRGB(20, 20, 20);
        end
    end);

    local _mg = Instance.new("ScreenGui");
    _mg.Name = "ElArab67UI";
    _mg.ResetOnSpawn = false;
    _e(function() _mg.Parent = _cg end);
    if not _mg.Parent then _mg.Parent = _pg; end;

    local _mf = Instance.new("Frame");
    _mf.Size = UDim2.new(0, 280, 0, 500);
    _mf.Position = UDim2.new(0.5, -140, 0.5, -250);
    _mf.BackgroundColor3 = Color3.fromRGB(15, 15, 15);
    _mf.BackgroundTransparency = 0.3;
    _mf.Active = true; _mf.Draggable = true; _mf.Parent = _mg;
    local _mfc = Instance.new("UICorner"); _mfc.CornerRadius = UDim.new(0, 12); _mfc.Parent = _mf;
    local _mfs = Instance.new("UIStroke"); _mfs.Color = Color3.fromRGB(255, 215, 0); _mfs.Thickness = 1.5; _mfs.Parent = _mf;

    local _cb = Instance.new("TextButton");
    _cb.Size = UDim2.new(0, 26, 0, 26);
    _cb.Position = UDim2.new(1, -32, 0, 5);
    _cb.BackgroundColor3 = Color3.fromRGB(200, 40, 40);
    _cb.BackgroundTransparency = 0.3;
    _cb.Text = "X"; _cb.TextColor3 = Color3.fromRGB(255, 255, 255); _cb.TextSize = 14; _cb.Font = Enum.Font.SourceSansBold; _cb.Parent = _mf;
    local _cbc = Instance.new("UICorner"); _cbc.CornerRadius = UDim.new(0, 6); _cbc.Parent = _cb;

    local _opb = Instance.new("TextButton");
    _opb.Size = UDim2.new(0, 90, 0, 35);
    _opb.Position = UDim2.new(0, 10, 0.5, -17);
    _opb.BackgroundColor3 = Color3.fromRGB(25, 25, 25);
    _opb.BackgroundTransparency = 0.3;
    _opb.Text = "افتح القائمة"; _opb.TextColor3 = Color3.fromRGB(255, 215, 0); _opb.TextSize = 14; _opb.Font = Enum.Font.SourceSansBold; _opb.Visible = false; _opb.Parent = _mg;
    local _opc = Instance.new("UICorner"); _opc.CornerRadius = UDim.new(0, 8); _opc.Parent = _opb;

    _cb.MouseButton1Click:Connect(function() _mf.Visible = false; _opb.Visible = true; end);
    _opb.MouseButton1Click:Connect(function() _mf.Visible = true; _opb.Visible = false; end);

    local _sf = Instance.new("ScrollingFrame");
    _sf.Size = UDim2.new(1, -16, 1, -45);
    _sf.Position = UDim2.new(0, 8, 0, 35);
    _sf.BackgroundTransparency = 1; _sf.CanvasSize = UDim2.new(0, 0, 0, 750); _sf.ScrollBarThickness = 4; _sf.Parent = _mf;

    local _bv = Instance.new("BodyVelocity"); _bv.MaxForce = Vector3.new(4e5, 4e5, 4e5); _bv.Velocity = Vector3.zero;
    local _bg = Instance.new("BodyGyro"); _bg.MaxTorque = Vector3.new(4e5, 4e5, 4e5); _bg.P = 9000;

    local function _ust()
        _e(function()
            if _lp.Character and _lp.Character:FindFirstChild("Humanoid") then
                local hum = _lp.Character.Humanoid;
                hum.WalkSpeed = _se and (16 * _sl) or 16;
                hum.UseJumpPower = true;
                hum.JumpPower = _je and (_jh * 10) or 50;
            end
        end);
    end

    local _fbtn = Instance.new("TextButton");
    _fbtn.Size = UDim2.new(1, -8, 0, 32); _fbtn.Position = UDim2.new(0, 0, 0, 5);
    _fbtn.Text = "طيران: طافي"; _fbtn.TextColor3 = Color3.fromRGB(255, 255, 255); _fbtn.BackgroundColor3 = Color3.fromRGB(40, 40, 40); _fbtn.BackgroundTransparency = 0.4; _fbtn.TextSize = 14; _fbtn.Font = Enum.Font.SourceSansBold; _fbtn.Parent = _sf;
    local _fbc = Instance.new("UICorner"); _fbc.CornerRadius = UDim.new(0, 6); _fbc.Parent = _fbtn;

    _fbtn.MouseButton1Click:Connect(function()
        _fe = not _fe;
        if _lp.Character and _lp.Character:FindFirstChild("HumanoidRootPart") then
            local r = _lp.Character.HumanoidRootPart;
            if _fe then
                _bv.Parent = r; _bg.Parent = r;
                _fbtn.Text = "طيران: شغال"; _fbtn.BackgroundColor3 = Color3.fromRGB(40, 160, 70); _fbtn.BackgroundTransparency = 0.3;
            else
                _bv.Parent = nil; _bg.Parent = nil;
                _fbtn.Text = "طيران: طافي"; _fbtn.BackgroundColor3 = Color3.fromRGB(40, 40, 40); _fbtn.BackgroundTransparency = 0.4;
            end
        end
    end);

    local function _addIn(t, d, y, cb)
        local l = Instance.new("TextLabel"); l.Size = UDim2.new(0, 150, 0, 28); l.Position = UDim2.new(0, 0, 0, y); l.Text = t; l.TextColor3 = Color3.fromRGB(255, 255, 255); l.BackgroundTransparency = 1; l.TextXAlignment = Enum.TextXAlignment.Left; l.TextSize = 14; l.Font = Enum.Font.SourceSansBold; l.Parent = _sf;
        local b = Instance.new("TextBox"); b.Size = UDim2.new(0, 70, 0, 28); b.Position = UDim2.new(1, -78, 0, y); b.Text = tostring(d); b.TextColor3 = Color3.fromRGB(255, 255, 255); b.BackgroundColor3 = Color3.fromRGB(0, 0, 0); b.BackgroundTransparency = 0.5; b.TextSize = 14; b.Font = Enum.Font.SourceSansBold; b.Parent = _sf;
        local bc = Instance.new("UICorner"); bc.CornerRadius = UDim.new(0, 5); bc.Parent = b;
        b.FocusLost:Connect(function() local n = tonumber(b.Text); if n then cb(n); else b.Text = tostring(d); end; end);
    end

    _addIn("قوة السرعة:", _sl, 45, function(v) _sl = v; _ust(); end);
    _addIn("قوة النط:", _jh, 80, function(v) _jh = v; _ust(); end);
    _addIn("سرعة الطيران:", _fls, 115, function(v) _fls = v; end);

    _rs.RenderStepped:Connect(function()
        if _aim then
            local tgt, cdist = nil, _fov;
            local scn = Vector3.new(_cam.ViewportSize.X / 2, _cam.ViewportSize.Y / 2, 0);
            for _, p in pairs(_pl:GetPlayers()) do
                if p ~= _lp and p.Character and p.Character:FindFirstChild("Head") then
                    local hm = p.Character:FindFirstChildOfClass("Humanoid");
                    if hm and hm.Health > 0 then
                        local hd = p.Character.Head;
                        local spos, on = _cam:WorldToViewportPoint(hd.Position);
                        if on and spos.Z > 0 then
                            local md = (Vector3.new(spos.X, spos.Y, 0) - scn).Magnitude;
                            if md < cdist then cdist = md; tgt = hd; end;
                        end
                    end
                end
            end
            if tgt then _cam.CFrame = CFrame.new(_cam.CFrame.Position, tgt.Position); end;
        end
        if _fe and _lp.Character and _lp.Character:FindFirstChild("HumanoidRootPart") then
            local cc = _cam.CFrame; _bg.CFrame = cc;
            local md = Vector3.zero;
            if _uis:IsKeyDown(Enum.KeyCode.W) then md = md + cc.LookVector; end;
            if _uis:IsKeyDown(Enum.KeyCode.S) then md = md - cc.LookVector; end;
            if _uis:IsKeyDown(Enum.KeyCode.A) then md = md - cc.RightVector; end;
            if _uis:IsKeyDown(Enum.KeyCode.D) then md = md + cc.RightVector; end;
            if _uis:IsKeyDown(Enum.KeyCode.Space) then md = md + Vector3.new(0,1,0); end;
            if _uis:IsKeyDown(Enum.KeyCode.LeftShift) then md = md - Vector3.new(0,1,0); end;
            if md.Magnitude > 0 then _bv.Velocity = md.Unit * (50 * _fls); else _bv.Velocity = Vector3.zero; end;
        end
    end);

    task.delay(3600, function()
        if _mg then _mg:Destroy(); end;
        if _fui then _fui:Destroy(); end;
    end);
end

_sbtn.MouseButton1Click:Connect(function()
    if _ktb.Text == _gk then
        _sbtn.Text = "تم التفعيل بنجاح!";
        _sbtn.BackgroundColor3 = Color3.fromRGB(0, 180, 80);
        task.wait(1);
        _lms();
    else
        _sbtn.Text = "كود خاطئ! حاول مجدداً";
        _sbtn.BackgroundColor3 = Color3.fromRGB(200, 40, 40);
        task.wait(1.5);
        _sbtn.Text = "تفعيل السكربت";
        _sbtn.BackgroundColor3 = Color3.fromRGB(40, 160, 70);
    end
end);
