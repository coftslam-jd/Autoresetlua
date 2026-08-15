local Players = game:GetService("Players")
local VirtualUser = game:GetService("VirtualUser")
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
local btn1 = sideBtn(U(1088,1077,1089,1090,1072,1088,1090)
	, 1)
local btn2 = sideBtn(U(1089,1090,1072,1090,1080,1089,1090,1080,1082,1072)
	, 2)
local btn3 = sideBtn(U(1085,1072,1089,1090,1088,1086,1081,1082,1080)
	, 3)

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
local resetsInput = makeInput(p1, U(1050,1086,1083,45,1074,1086,32,1088,1077,1089,1077,1090,1086,1074,32,40,1087,1091,1089,1090,1086,45,1073,1077,1089,1082,1086,1085,1077,1095,1085,1086,41)
	, 3)
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
swTitle.BackgroundTransparency = 1 swTitle.Size = UDim2.new(1,0,0,26) swTitle.Text = U(1089,1090,1072,1090,1080,1089,1090,1080,1082,1072)
swTitle.TextColor3 = Color3.new(1,1,1) swTitle.Font = Enum.Font.GothamBold fit(swTitle)
local swTime = Instance.new("TextLabel", statsWin)
swTime.BackgroundTransparency = 1 swTime.Position = UDim2.new(0,8,0,30) swTime.Size = UDim2.new(1,-16,0,20)
swTime.TextColor3 = Color3.fromRGB(220,220,220) swTime.Font = Enum.Font.Gotham swTime.TextXAlignment = Enum.TextXAlignment.Left
fit(swTime)
local swResets = swTime:Clone() swResets.Parent = statsWin swResets.Position = UDim2.new(0,8,0,58)
local swMoney = swTime:Clone() swMoney.Parent = statsWin swMoney.Position = UDim2.new(0,8,0,86)

-- страница 2: статистика (управление)
local p2 = makePanel(2)
local swToggleBtn = makeBtn(p2, U(1054,1082,1085,1086,32,1089,1090,1072,1090,1080,1089,1090,1080,1082,1080), 1)
swToggleBtn.MouseButton1Click:Connect(function() statsWin.Visible = not statsWin.Visible end)
local swSizeRow = Instance.new("Frame", p2)
swSizeRow.Size = UDim2.new(1,0,0,30) swSizeRow.BackgroundTransparency = 1 swSizeRow.LayoutOrder = 2
local swMinus = Instance.new("TextButton", swSizeRow)
swMinus.Size = UDim2.new(0,54,1,0) swMinus.BackgroundColor3 = Color3.fromRGB(40,34,44) swMinus.BackgroundTransparency = TR
swMinus.Text = "-" swMinus.TextColor3 = Color3.new(1,1,1) swMinus.Font = Enum.Font.GothamBold fit(swMinus)
Instance.new("UICorner", swMinus).CornerRadius = UDim.new(0,6)
local swPlus = Instance.new("TextButton", swSizeRow)
swPlus.Size = UDim2.new(0,54,1,0) swPlus.Position = UDim2.new(0,62,0,0)
swPlus.BackgroundColor3 = Color3.fromRGB(40,34,44) swPlus.BackgroundTransparency = TR
swPlus.Text = "+" swPlus.TextColor3 = Color3.new(1,1,1) swPlus.Font = Enum.Font.GothamBold fit(swPlus)
Instance.new("UICorner", swPlus).CornerRadius = UDim.new(0,6)
swMinus.MouseButton1Click:Connect(function() statsScale.Scale = math.clamp(statsScale.Scale-0.1,0.5,1.8) end)
swPlus.MouseButton1Click:Connect(function() statsScale.Scale = math.clamp(statsScale.Scale+0.1,0.5,1.8) end)
local resetStatsBtn = makeBtn(p2, U(1057,1073,1088,1086,1089,32,1089,1090,1072,1090,1080,1089,1090,1080,1082,1080), 3, Color3.fromRGB(90,45,45))
local cTime = Instance.new("TextLabel", p2)
cTime.BackgroundTransparency = 1 cTime.Size = UDim2.new(1,0,0,18) cTime.Text = "00:00:00"
cTime.TextColor3 = Color3.fromRGB(200,200,200) cTime.Font = Enum.Font.Gotham cTime.TextXAlignment = Enum.TextXAlignment.Left
cTime.LayoutOrder = 4 fit(cTime)
local cResets = cTime:Clone() cResets.Parent = p2 cResets.LayoutOrder = 5
local cMoney = cTime:Clone() cMoney.Parent = p2 cMoney.LayoutOrder = 6

-- страница 3: настройки
local p3 = makePanel(2)
local sizeLabel = Instance.new("TextLabel", p3)
sizeLabel.BackgroundTransparency = 1 sizeLabel.Size = UDim2.new(1,0,0,20)
sizeLabel.Text = U(1056,1072,1079,1084,1077,1088,58,32,49,48,48,37) sizeLabel.TextColor3 = Color3.fromRGB(210,210,210)
sizeLabel.Font = Enum.Font.Gotham sizeLabel.TextXAlignment = Enum.TextXAlignment.Left sizeLabel.LayoutOrder = 1 fit(sizeLabel)
local sizeRow = Instance.new("Frame", p3) sizeRow.Size = UDim2.new(1,0,0,30) sizeRow.BackgroundTransparency = 1 sizeRow.LayoutOrder = 2
local mMinus = Instance.new("TextButton", sizeRow)
mMinus.Size = UDim2.new(0,54,1,0) mMinus.BackgroundColor3 = Color3.fromRGB(40,34,44) mMinus.BackgroundTransparency = TR
mMinus.Text = "-" mMinus.TextColor3 = Color3.new(1,1,1) mMinus.Font = Enum.Font.GothamBold fit(mMinus)
Instance.new("UICorner", mMinus).CornerRadius = UDim.new(0,6)
local mPlus = Instance.new("TextButton", sizeRow)
mPlus.Size = UDim2.new(0,54,1,0) mPlus.Position = UDim2.new(0,62,0,0)
mPlus.BackgroundColor3 = Color3.fromRGB(40,34,44) mPlus.BackgroundTransparency = TR
mPlus.Text = "+" mPlus.TextColor3 = Color3.new(1,1,1) mPlus.Font = Enum.Font.GothamBold fit(mPlus)
Instance.new("UICorner", mPlus).CornerRadius = UDim.new(0,6)
local function setScale(v) scale.Scale = math.clamp(v,0.6,1.6) sizeLabel.Text = U(1056,1072,1079,1084,1077,1088,58,32)..math.floor(scale.Scale*100).."%" end
mMinus.MouseButton1Click:Connect(function() setScale(scale.Scale-0.1) end)
mPlus.MouseButton1Click:Connect(function() setScale(scale.Scale+0.1) end)
local afkRow = Instance.new("Frame", p3) afkRow.Size = UDim2.new(1,0,0,28) afkRow.BackgroundTransparency = 1 afkRow.LayoutOrder = 3
local afkLabel = Instance.new("TextLabel", afkRow)
afkLabel.BackgroundTransparency = 1 afkLabel.Size = UDim2.new(1,-54,1,0) afkLabel.Text = U(1040,1085,1090,1080,45,1040,1060,1050)
afkLabel.TextColor3 = Color3.fromRGB(210,210,210) afkLabel.Font = Enum.Font.Gotham afkLabel.TextXAlignment = Enum.TextXAlignment.Left fit(afkLabel)
local afkBtn = Instance.new("TextButton", afkRow)
afkBtn.Size = UDim2.new(0,48,0,24) afkBtn.Position = UDim2.new(1,-48,0.5,-12) afkBtn.BackgroundTransparency = TR
afkBtn.Font = Enum.Font.GothamBold afkBtn.TextColor3 = Color3.new(1,1,1) fit(afkBtn)
Instance.new("UICorner", afkBtn).CornerRadius = UDim.new(0,10)
local function refreshAfk() afkBtn.Text = antiAfk and U(1042,1050,1051) or U(1042,1067,1050,1051) afkBtn.BackgroundColor3 = antiAfk and Color3.fromRGB(45,140,80) or Color3.fromRGB(90,45,45) end
afkBtn.MouseButton1Click:Connect(function() antiAfk = not antiAfk refreshAfk() end)
refreshAfk()

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
	resetCount += 1
	Reset()
end

LP.CharacterAdded:Connect(function(char)
	deaths += 1
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
		local rTxt = U(1057,1084,1077,1088,1090,1077,1081,58,32)..deaths..(target>0 and (" / "..target) or "")
		local mTxt = U(1044,1077,1085,1100,1075,1080,58,32)..(resetCount*5000)
		swTime.Text, swResets.Text, swMoney.Text = t, rTxt, mTxt
		cTime.Text, cResets.Text, cMoney.Text = t, rTxt, mTxt
		task.wait(1)
	end
end)
