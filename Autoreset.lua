local Players = game:GetService("Players")
local VirtualUser = game:GetService("VirtualUser")
local UIS = game:GetService("UserInputService")
local Lighting = game:GetService("Lighting")
local LP = Players.LocalPlayer
local U = function(...) local t,s={...},"" for i=1,#t do s=s..utf8.char(t[i]) end return s end
local TR = 0.25

local function Reset()
	local h = LP.Character and LP.Character:FindFirstChildOfClass("Humanoid")
	if h then h.Health = 0 end
end
local function TP(name)
	local hrp = LP.Character and LP.Character:FindFirstChild("HumanoidRootPart")
	local t = Players:FindFirstChild(name)
	local thrp = t and t.Character and t.Character:FindFirstChild("HumanoidRootPart")
	if hrp and thrp then hrp.CFrame = thrp.CFrame * CFrame.new(3,0,0) return true end
	return false
end

local antiAfk = true
LP.Idled:Connect(function()
	if antiAfk then VirtualUser:CaptureController() VirtualUser:ClickButton2(Vector2.new()) end
end)

local gui = Instance.new("ScreenGui", LP:WaitForChild("PlayerGui"))
gui.Name = "AutoResetGUI" gui.ResetOnSpawn = false

local toggle = Instance.new("TextButton", gui)
toggle.Size = UDim2.new(0,50,0,50) toggle.Position = UDim2.new(0,20,0,200)
toggle.BackgroundColor3 = Color3.new(0,0,0) toggle.Text = "AR" toggle.TextColor3 = Color3.new(1,1,1)
toggle.Font = Enum.Font.GothamBold toggle.TextSize = 16 toggle.Active = true toggle.Draggable = true
Instance.new("UICorner", toggle).CornerRadius = UDim.new(0,10)

local main = Instance.new("Frame", gui)
main.Size = UDim2.new(0,460,0,320) main.Position = UDim2.new(0,100,0,100)
main.BackgroundColor3 = Color3.fromRGB(24,20,26) main.BackgroundTransparency = TR
main.ClipsDescendants = true main.Active = true main.Draggable = true main.Visible = false
Instance.new("UICorner", main).CornerRadius = UDim.new(0,10)
local scale = Instance.new("UIScale", main)
toggle.MouseButton1Click:Connect(function() main.Visible = not main.Visible end)

local top = Instance.new("Frame", main)
top.Size = UDim2.new(1,0,0,36) top.BackgroundColor3 = Color3.fromRGB(18,15,19) top.BackgroundTransparency = TR
Instance.new("UICorner", top).CornerRadius = UDim.new(0,10)
local title = Instance.new("TextLabel", top)
title.BackgroundTransparency = 1 title.Size = UDim2.new(0,200,1,0) title.Position = UDim2.new(0,12,0,0)
title.Text = "Auto Reset" title.TextColor3 = Color3.new(1,1,1) title.Font = Enum.Font.GothamBold
title.TextSize = 16 title.TextXAlignment = Enum.TextXAlignment.Left
local closeBtn = Instance.new("TextButton", top)
closeBtn.Size = UDim2.new(0,26,0,26) closeBtn.Position = UDim2.new(1,-32,0.5,-13)
closeBtn.BackgroundColor3 = Color3.fromRGB(40,35,42) closeBtn.BackgroundTransparency = TR
closeBtn.Text = "X" closeBtn.TextColor3 = Color3.new(1,1,1) closeBtn.Font = Enum.Font.GothamBold closeBtn.TextSize = 13
Instance.new("UICorner", closeBtn).CornerRadius = UDim.new(0,6)
closeBtn.MouseButton1Click:Connect(function() main.Visible = false end)

local sidebar = Instance.new("Frame", main)
sidebar.Size = UDim2.new(0,64,1,-36) sidebar.Position = UDim2.new(0,0,0,36)
sidebar.BackgroundColor3 = Color3.fromRGB(20,17,21) sidebar.BackgroundTransparency = TR
local sideList = Instance.new("Frame", sidebar)
sideList.Size = UDim2.new(1,-10,1,-10) sideList.Position = UDim2.new(0,5,0,5) sideList.BackgroundTransparency = 1
local sl = Instance.new("UIListLayout", sideList) sl.Padding = UDim.new(0,6) sl.SortOrder = Enum.SortOrder.LayoutOrder

local function fit(l) l.TextScaled = true l.TextWrapped = true end
local function sideBtn(t, o)
	local b = Instance.new("TextButton", sideList)
	b.Size = UDim2.new(1,0,0,42) b.BackgroundColor3 = Color3.fromRGB(40,34,44) b.BackgroundTransparency = TR
	b.Text = t b.TextColor3 = Color3.new(1,1,1) b.Font = Enum.Font.GothamBold b.LayoutOrder = o
	fit(b) Instance.new("UICorner", b).CornerRadius = UDim.new(0,8)
	return b
end
local btn1 = sideBtn(U(1056,1077,1089,1077,1090), 1)
local btn2 = sideBtn(U(1057,1090,1072,1090,1080,1089,1090,1080,1082,1072), 2)
local btn3 = sideBtn(U(1053,1072,1089,1090,1088,1086,1081,1082,1080), 3)

local content = Instance.new("Frame", main)
content.Size = UDim2.new(1,-74,1,-46) content.Position = UDim2.new(0,69,0,40) content.BackgroundTransparency = 1
local cl = Instance.new("UIListLayout", content) cl.Padding = UDim.new(0,6) cl.SortOrder = Enum.SortOrder.LayoutOrder

local function makeInput(p, ph, o, d)
	local t = Instance.new("TextBox", p)
	t.Size = UDim2.new(1,0,0,30) t.BackgroundColor3 = Color3.fromRGB(40,34,44) t.BackgroundTransparency = TR
	t.PlaceholderText = ph t.Text = d or "" t.TextColor3 = Color3.new(1,1,1)
	t.PlaceholderColor3 = Color3.fromRGB(150,150,150) t.Font = Enum.Font.Gotham t.ClearTextOnFocus = false t.LayoutOrder = o
	fit(t) Instance.new("UICorner", t).CornerRadius = UDim.new(0,6)
	return t
end
local function makeBtn(p, txt, o, c)
	local b = Instance.new("TextButton", p)
	b.Size = UDim2.new(1,0,0,30) b.BackgroundColor3 = c or Color3.fromRGB(40,34,44) b.BackgroundTransparency = TR
	b.Text = txt b.TextColor3 = Color3.new(1,1,1) b.Font = Enum.Font.Gotham b.LayoutOrder = o
	fit(b) Instance.new("UICorner", b).CornerRadius = UDim.new(0,6)
	return b
end
local function makePanel(o)
	local f = Instance.new("Frame", content)
	f.BackgroundTransparency = 1 f.Size = UDim2.new(1,0,0,0) f.AutomaticSize = Enum.AutomaticSize.Y
	f.Visible = false f.LayoutOrder = o
	Instance.new("UIListLayout", f).Padding = UDim.new(0,6)
	return f
end

-- переиспользуемый тумблер ВКЛ/ВЫКЛ
local function makeToggle(p, label, o, getFn, setFn)
	local row = Instance.new("Frame", p)
	row.Size = UDim2.new(1,0,0,28) row.BackgroundTransparency = 1 row.LayoutOrder = o
	local l = Instance.new("TextLabel", row)
	l.BackgroundTransparency = 1 l.Size = UDim2.new(1,-54,1,0) l.Text = label
	l.TextColor3 = Color3.fromRGB(210,210,210) l.Font = Enum.Font.Gotham l.TextXAlignment = Enum.TextXAlignment.Left fit(l)
	local btn = Instance.new("TextButton", row)
	btn.Size = UDim2.new(0,48,0,24) btn.Position = UDim2.new(1,-48,0.5,-12) btn.BackgroundTransparency = TR
	btn.Font = Enum.Font.GothamBold btn.TextColor3 = Color3.new(1,1,1) fit(btn)
	Instance.new("UICorner", btn).CornerRadius = UDim.new(0,10)
	local function refresh()
		btn.Text = getFn() and U(1042,1050,1051) or U(1042,1067,1050,1051)
		btn.BackgroundColor3 = getFn() and Color3.fromRGB(45,140,80) or Color3.fromRGB(90,45,45)
	end
	btn.MouseButton1Click:Connect(function() setFn(not getFn()) refresh() end)
	refresh()
end

-- переиспользуемый слайдер + поле числа
local function makeSlider(p, label, minV, maxV, default, o, onChange)
	local row = Instance.new("Frame", p)
	row.Size = UDim2.new(1,0,0,48) row.BackgroundTransparency = 1 row.LayoutOrder = o
	local l = Instance.new("TextLabel", row)
	l.BackgroundTransparency = 1 l.Size = UDim2.new(1,0,0,18) l.Text = label
	l.TextColor3 = Color3.fromRGB(210,210,210) l.Font = Enum.Font.Gotham l.TextXAlignment = Enum.TextXAlignment.Left fit(l)
	local track = Instance.new("TextButton", row)
	track.Size = UDim2.new(1,-58,0,20) track.Position = UDim2.new(0,0,0,24)
	track.BackgroundColor3 = Color3.fromRGB(40,34,44) track.BackgroundTransparency = TR track.Text = "" track.AutoButtonColor = false
	Instance.new("UICorner", track).CornerRadius = UDim.new(0,6)
	local fill = Instance.new("Frame", track)
	fill.BackgroundColor3 = Color3.fromRGB(90,50,140) fill.BorderSizePixel = 0
	Instance.new("UICorner", fill).CornerRadius = UDim.new(0,6)
	local box = Instance.new("TextBox", row)
	box.Size = UDim2.new(0,50,0,20) box.Position = UDim2.new(1,-50,0,24)
	box.BackgroundColor3 = Color3.fromRGB(40,34,44) box.BackgroundTransparency = TR box.TextColor3 = Color3.new(1,1,1)
	box.Font = Enum.Font.Gotham box.ClearTextOnFocus = false fit(box)
	Instance.new("UICorner", box).CornerRadius = UDim.new(0,6)

	local value = default
	local function setValue(v)
		v = math.clamp(math.floor(v+0.5), minV, maxV)
		value = v
		fill.Size = UDim2.new((v-minV)/(maxV-minV), 0, 1, 0)
		box.Text = tostring(v)
		onChange(v)
	end
	setValue(default)

	local dragging = false
	local function fromPos(x)
		local rel = (x - track.AbsolutePosition.X) / track.AbsoluteSize.X
		setValue(minV + rel*(maxV-minV))
	end
	track.InputBegan:Connect(function(inp)
		if inp.UserInputType == Enum.UserInputType.MouseButton1 or inp.UserInputType == Enum.UserInputType.Touch then
			dragging = true fromPos(inp.Position.X)
		end
	end)
	UIS.InputChanged:Connect(function(inp)
		if dragging and (inp.UserInputType == Enum.UserInputType.MouseMovement or inp.UserInputType == Enum.UserInputType.Touch) then fromPos(inp.Position.X) end
	end)
	UIS.InputEnded:Connect(function(inp)
		if inp.UserInputType == Enum.UserInputType.MouseButton1 or inp.UserInputType == Enum.UserInputType.Touch then dragging = false end
	end)
	box.FocusLost:Connect(function()
		local n = tonumber(box.Text)
		if n then setValue(n) else box.Text = tostring(value) end
	end)
end

local statusLabel = Instance.new("TextLabel", content)
statusLabel.BackgroundTransparency = 1 statusLabel.Size = UDim2.new(1,0,0,20)
statusLabel.Text = U(1043,1086,1090,1086,1074) statusLabel.TextColor3 = Color3.fromRGB(220,220,220)
statusLabel.Font = Enum.Font.GothamBold statusLabel.TextXAlignment = Enum.TextXAlignment.Left statusLabel.LayoutOrder = 1
fit(statusLabel)

-- страница 1: ресет
local p1 = makePanel(2) p1.Visible = true
local selLabel = Instance.new("TextLabel", p1)
selLabel.BackgroundTransparency = 1 selLabel.Size = UDim2.new(1,0,0,20)
selLabel.Text = U(1042,1099,1073,1088,1072,1085,58,32,45) selLabel.TextColor3 = Color3.fromRGB(190,190,190)
selLabel.Font = Enum.Font.Gotham selLabel.TextXAlignment = Enum.TextXAlignment.Left selLabel.LayoutOrder = 1
fit(selLabel)
local scroll = Instance.new("ScrollingFrame", p1)
scroll.Size = UDim2.new(1,0,0,90) scroll.BackgroundColor3 = Color3.fromRGB(18,15,19) scroll.BackgroundTransparency = TR
scroll.ScrollBarThickness = 4 scroll.CanvasSize = UDim2.new(0,0,0,0) scroll.AutomaticCanvasSize = Enum.AutomaticSize.Y
scroll.LayoutOrder = 2
Instance.new("UIListLayout", scroll).Padding = UDim.new(0,4)
local resetsInput = makeInput(p1, U(1050,1086,1083,45,1074,1086,32,1088,1077,1089,1077,1090,1086,1074,32,40,1087,1091,1089,1090,1086,61,1073,1077,1089,1082,46,41), 3)
local startBtn = makeBtn(p1, U(1057,1058,1040,1056,1058), 4, Color3.fromRGB(45,140,80))

local targetName = ""
local function refreshList()
	scroll:ClearAllChildren()
	Instance.new("UIListLayout", scroll).Padding = UDim.new(0,4)
	for _, pl in ipairs(Players:GetPlayers()) do
		if pl ~= LP then
			local b = Instance.new("TextButton", scroll)
			b.Size = UDim2.new(1,0,0,28) b.BackgroundColor3 = Color3.fromRGB(40,34,44) b.BackgroundTransparency = TR
			b.Text = pl.Name b.TextColor3 = Color3.new(1,1,1) b.Font = Enum.Font.Gotham fit(b)
			Instance.new("UICorner", b).CornerRadius = UDim.new(0,6)
			b.MouseButton1Click:Connect(function() targetName = pl.Name selLabel.Text = U(1042,1099,1073,1088,1072,1085,58,32)..pl.Name end)
		end
	end
end
refreshList()

-- отдельное окно статистики
local statsWin = Instance.new("Frame", gui)
statsWin.Size = UDim2.new(0,220,0,150) statsWin.Position = UDim2.new(0,600,0,120)
statsWin.BackgroundColor3 = Color3.fromRGB(24,20,26) statsWin.BackgroundTransparency = TR
statsWin.Visible = false statsWin.Active = true statsWin.Draggable = true
Instance.new("UICorner", statsWin).CornerRadius = UDim.new(0,10)
local statsScale = Instance.new("UIScale", statsWin)
local swTitle = Instance.new("TextLabel", statsWin)
swTitle.BackgroundTransparency = 1 swTitle.Size = UDim2.new(1,0,0,26) swTitle.Text = U(1057,1090,1072,1090,1080,1089,1090,1080,1082,1072)
swTitle.TextColor3 = Color3.new(1,1,1) swTitle.Font = Enum.Font.GothamBold fit(swTitle)
local swTime = Instance.new("TextLabel", statsWin)
swTime.BackgroundTransparency = 1 swTime.Position = UDim2.new(0,8,0,30) swTime.Size = UDim2.new(1,-16,0,20)
swTime.TextColor3 = Color3.fromRGB(220,220,220) swTime.Font = Enum.Font.Gotham swTime.TextXAlignment = Enum.TextXAlignment.Left
fit(swTime)
local swMoney = swTime:Clone() swMoney.Parent = statsWin swMoney.Position = UDim2.new(0,8,0,58)

-- страница 2: статистика (управление)
local p2 = makePanel(2)
local swToggleBtn = makeBtn(p2, U(1054,1082,1085,1086,32,1089,1090,1072,1090,1080,1089,1090,1080,1082,1080), 1)
swToggleBtn.MouseButton1Click:Connect(function() statsWin.Visible = not statsWin.Visible end)
makeSlider(p2, U(1056,1072,1079,1084,1077,1088,32,1086,1082,1085,1072,32,1089,1090,1072,1090,58), 50, 180, 100, 2, function(v) statsScale.Scale = v/100 end)
local resetStatsBtn = makeBtn(p2, U(1057,1073,1088,1086,1089,32,1089,1090,1072,1090,1080,1089,1090,1080,1082,1080), 3, Color3.fromRGB(90,45,45))
local cTime = Instance.new("TextLabel", p2)
cTime.BackgroundTransparency = 1 cTime.Size = UDim2.new(1,0,0,18) cTime.Text = "00:00:00"
cTime.TextColor3 = Color3.fromRGB(200,200,200) cTime.Font = Enum.Font.Gotham cTime.TextXAlignment = Enum.TextXAlignment.Left
cTime.LayoutOrder = 4 fit(cTime)
local cMoney = cTime:Clone() cMoney.Parent = p2 cMoney.LayoutOrder = 5

-- страница 3: настройки
local p3 = makePanel(2)
makeSlider(p3, U(1056,1072,1079,1084,1077,1088,32,1084,1077,1085,1102,58), 60, 160, 100, 1, function(v) scale.Scale = v/100 end)
makeToggle(p3, U(1040,1085,1090,1080,45,1040,1060,1050), 2, function() return antiAfk end, function(v) antiAfk = v end)

local fpsBoost = false
local origTechnology = nil
local function applyFpsBoost(on)
	fpsBoost = on
	pcall(function()
		local ugs = UserSettings():GetService("UserGameSettings")
		ugs.SavedQualityLevel = on and Enum.SavedQualitySetting.QualityLevel1 or Enum.SavedQualitySetting.Automatic
	end)
	if on then
		origTechnology = Lighting.Technology
		pcall(function() Lighting.Technology = Enum.Technology.Compatibility end)
	elseif origTechnology then
		pcall(function() Lighting.Technology = origTechnology end)
	end
	Lighting.GlobalShadows = not on
	for _, eff in ipairs(Lighting:GetChildren()) do
		if eff:IsA("PostEffect") then eff.Enabled = not on end
	end
	local terrain = workspace:FindFirstChildOfClass("Terrain")
	if terrain then pcall(function() terrain.WaterWaveSize = on and 0 or 0.15 end) end
end
makeToggle(p3, U(1041,1091,1089,1090,32,70,80,83), 3, function() return fpsBoost end, applyFpsBoost)

local billboardBackup = {}
local function setNameHidden(char, hidden)
	local hum = char:FindFirstChildOfClass("Humanoid")
	if hum then hum.DisplayDistanceType = hidden and Enum.HumanoidDisplayDistanceType.None or Enum.HumanoidDisplayDistanceType.Viewer end
	if hidden then
		local list = {}
		for _, bg in ipairs(char:GetDescendants()) do
			if bg:IsA("BillboardGui") then
				table.insert(list, {bg=bg, was=bg.Enabled})
				bg.Enabled = false
			end
		end
		billboardBackup[char] = list
	else
		local list = billboardBackup[char]
		if list then
			for _, e in ipairs(list) do if e.bg.Parent then e.bg.Enabled = e.was end end
			billboardBackup[char] = nil
		end
	end
end
local hideNames = false
local function applyHideNames(on)
	hideNames = on
	for _, pl in ipairs(Players:GetPlayers()) do if pl.Character then setNameHidden(pl.Character, on) end end
end
makeToggle(p3, U(1057,1082,1088,1099,1090,1100,32,1085,1080,1082,1080), 4, function() return hideNames end, applyHideNames)

local skinBackup = {}
local function setSkinHidden(char, hidden)
	if hidden then
		if skinBackup[char] then return end
		local data = {removed={}, parts={}}
		for _, inst in ipairs(char:GetChildren()) do
			if inst:IsA("Shirt") or inst:IsA("Pants") or inst:IsA("ShirtGraphic") or inst:IsA("Accessory") then
				table.insert(data.removed, inst)
				inst.Parent = nil
			end
		end
		for _, part in ipairs(char:GetDescendants()) do
			if part:IsA("BasePart") then
				table.insert(data.parts, {part=part, color=part.Color, material=part.Material})
				part.Color = Color3.fromRGB(163,162,165)
				part.Material = Enum.Material.SmoothPlastic
			end
		end
		skinBackup[char] = data
	else
		local data = skinBackup[char]
		if not data then return end
		for _, inst in ipairs(data.removed) do if inst.Parent == nil then inst.Parent = char end end
		for _, entry in ipairs(data.parts) do
			if entry.part.Parent then entry.part.Color = entry.color entry.part.Material = entry.material end
		end
		skinBackup[char] = nil
	end
end
local hideSkins = false
local function applyHideSkins(on)
	hideSkins = on
	for _, pl in ipairs(Players:GetPlayers()) do if pl.Character then setSkinHidden(pl.Character, on) end end
end
makeToggle(p3, U(1057,1082,1088,1099,1090,1100,32,1089,1082,1080,1085,1099), 5, function() return hideSkins end, applyHideSkins)

Players.PlayerAdded:Connect(function(pl)
	pl.CharacterAdded:Connect(function(char)
		task.wait(1)
		if hideNames then setNameHidden(char, true) end
		if hideSkins then setSkinHidden(char, true) end
	end)
end)
LP.CharacterAdded:Connect(function(char)
	task.wait(1)
	if hideNames then setNameHidden(char, true) end
	if hideSkins then setSkinHidden(char, true) end
end)

makeSlider(p3, U(1051,1080,1084,1080,1090,32,70,80,83), 5, 240, 60, 6, function(v)
	pcall(function() setfpscap(v) end)
end)

local pages = {p1,p2,p3}
local function show(p) for _,pg in ipairs(pages) do pg.Visible=false end p.Visible=true end
btn1.MouseButton1Click:Connect(function() show(p1) end)
btn2.MouseButton1Click:Connect(function() show(p2) end)
btn3.MouseButton1Click:Connect(function() show(p3) end)

local running, paused = false, false
local resetCount, deaths, target, startTime = 0, 0, 0, 0

local function stop(msg)
	running, paused = false, false
	startBtn.Text = U(1057,1058,1040,1056,1058) startBtn.BackgroundColor3 = Color3.fromRGB(45,140,80)
	statusLabel.Text = msg or U(1043,1086,1090,1086,1074)
end

resetStatsBtn.MouseButton1Click:Connect(function()
	deaths = 0
	if not running then resetCount = 0 end
	startTime = os.clock()
end)

local function chain(char)
	char:WaitForChild("HumanoidRootPart", 5) task.wait(0.3)
	if not running then return end
	if not TP(targetName) then stop(U(1053,1077,32,1091,1076,1072,1083,1086,1089,1100,32,1090,1077,1083,1077,1087,1086,1088,1090,1080,1088,1086,1074,1072,1090,1100,1089,1103)) return end
	task.wait(0.3)
	if not running then return end
	resetCount = resetCount + 1
	Reset()
end

LP.CharacterAdded:Connect(function(char)
	deaths = deaths + 1
	if not running or resetCount == 0 then return end
	if target > 0 and resetCount >= target then stop(U(1043,1086,1090,1086,1074,1086,58,32,1074,1089,1077)) return end
	task.spawn(function() chain(char) end)
end)

Players.PlayerRemoving:Connect(function(p)
	if p.Name == targetName and running then
		running, paused = false, true
		statusLabel.Text = U(1048,1075,1088,1086,1082,32,1074,1099,1096,1077,1083,46,46,46)
		startBtn.Text = U(1055,1040,1059,1047,1040) startBtn.BackgroundColor3 = Color3.fromRGB(150,120,40)
	end
	refreshList()
end)
Players.PlayerAdded:Connect(function(p)
	refreshList()
	if p.Name == targetName and paused then
		paused, running = false, true
		statusLabel.Text = U(1055,1088,1086,1076,1086,1083,1078,1072,1102,46,46,46)
		startBtn.Text = U(1057,1058,1054,1055) startBtn.BackgroundColor3 = Color3.fromRGB(150,60,60)
		task.wait(1)
		if LP.Character then task.spawn(function() chain(LP.Character) end) end
	end
end)

startBtn.MouseButton1Click:Connect(function()
	if running or paused then stop() return end
	if targetName == "" then statusLabel.Text = U(1042,1099,1073,1077,1088,1080,32,1080,1075,1088,1086,1082,1072) return end
	target = tonumber(resetsInput.Text) or 0
	if not TP(targetName) then statusLabel.Text = U(1053,1077,32,1091,1076,1072,1083,1086,1089,1100,32,1090,1077,1083,1077,1087,1086,1088,1090,1080,1088,1086,1074,1072,1090,1100,1089,1103) return end
	task.wait(0.5)
	resetCount, startTime, running = 1, os.clock(), true
	statusLabel.Text = U(1056,1072,1073,1086,1090,1072,1077,1090,46,46,46)
	startBtn.Text = U(1057,1058,1054,1055) startBtn.BackgroundColor3 = Color3.fromRGB(150,60,60)
	Reset()
end)

task.spawn(function()
	while true do
		local t = "00:00:00"
		if running then local e = os.clock()-startTime t = string.format("%02d:%02d:%02d", e//3600,(e%3600)//60,e%60) end
		local mTxt = U(1044,1077,1085,1100,1075,1080,58,32)
		mTxt = mTxt .. tostring(resetCount*5000)
		swTime.Text, swMoney.Text = t, mTxt
		cTime.Text, cMoney.Text = t, mTxt
		task.wait(1)
	end
end)
