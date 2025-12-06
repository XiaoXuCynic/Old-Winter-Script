local WindUI = loadstring(game:HttpGet("https://raw.githubusercontent.com/XiaoXuCynic/Old-Winter-Script/refs/heads/main/windui(2).lua"))()

local Confirmed = false

local Window = WindUI:CreateWindow({
    Title = "Old Winter",
    Icon = "crown",
    IconThemed = true,
    Author = "XiaoXu",
    Folder = "EX",
    Size = UDim2.fromOffset(460, 340),
    Transparent = true,
    Theme = "Dark",
    User = { Enabled = true },
    SideBarWidth = 200,
    ScrollBarEnabled = true,
})

Window:EditOpenButton({
    Title = "Main ui",
    Icon = "monitor",
    CornerRadius = UDim.new(0,16),
    StrokeThickness = 2,
    Color = ColorSequence.new(
        Color3.fromHex("FF0F7B"), 
        Color3.fromHex("F89B29")
    ),
    OnlyMobile = false,
    Enabled = true,
    Draggable = true,
})

local Tabs = {
    Home = Window:Tab({ Title = "选择", Icon = "crown" }),
}

local windUIButton = Tabs.Home:Button({
    Title = "Wind UI",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/greatjakson-lgtm/-2/main/%C3%BD%C3%BD-obfuscated.lua"))()
task.wait(5)
      
        local WindUI = loadstring(game:HttpGet("https://github.com/Footagesus/WindUI/releases/latest/download/main.lua"))()

local Confirmed = false

-- 主窗口创建
local Window = WindUI:CreateWindow({
    Title = "Old Winter",
    Icon = "crown",
    IconThemed = true,
    Author = "XiaoXu",
    Folder = "EX",
    Size = UDim2.fromOffset(460, 340),
    Transparent = true,
    Theme = "Dark",
    User = { Enabled = true },
    SideBarWidth = 200,
    ScrollBarEnabled = true,
})

-- 时间标签
local TimeTag = Window:Tag({
    Title = "00:00",
    Color = Color3.fromHex("0000FF")
})

local hue = 0
task.spawn(function()
    while true do
        local now = os.date("*t")
        local hours = string.format("%02d", now.hour)
        local minutes = string.format("%02d", now.min)
        
        hue = (hue + 0.01) % 1
        local color = Color3.fromHSV(hue, 1, 1)
        
        TimeTag:SetTitle(hours .. ":" .. minutes)
        TimeTag:SetColor(color)
        task.wait(0.06)
    end
end)

Window:Tag({
    Title = "Old Winter",
    Color = Color3.fromHex("#87CEEB")
})

Window:EditOpenButton({
    Title = "Old Winter",
    Icon = "crown",
    CornerRadius = UDim.new(0,16),
    StrokeThickness = 2,
    Color = ColorSequence.new(
        Color3.fromHex("FF0000"), 
        Color3.fromHex("0000FF")
    ),
    Draggable = true,
})

-- 创建基础标签页
local Tabs = {
    Home = Window:Tab({ Title = "主页", Icon = "house" }),
    ScriptCenter = Window:Tab({ Title = "脚本", Icon = "codesandbox" }),
    Misc = Window:Tab({ Title = "其他", Icon = "settings" }),
}

Window:SelectTab(1)

-- 全局服务引用
local Players = game:GetService("Players")
local Workspace = game:GetService("Workspace")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local ProximityPromptService = game:GetService("ProximityPromptService")
local TweenService = game:GetService("TweenService")
local HttpService = game:GetService("HttpService")
local TeleportService = game:GetService("TeleportService")
local UserInputService = game:GetService("UserInputService")
local Lighting = game:GetService("Lighting")
local CoreGui = game:GetService("CoreGui")
local inputService = game:GetService("UserInputService")
local gameCamera = Workspace.CurrentCamera

-- 本地玩家引用
local LP = Players.LocalPlayer

-- 主页内容
Tabs.Home:Paragraph({
    Title = "Old Winter & XiaoXu",
    Desc = "Autumn in April",
    Image = "rbxassetid://121041163203912",
    ImageSize = 65,
    Thumbnail = "rbxassetid://132702574859512",
    ThumbnailSize = 180
})

Tabs.Home:Paragraph({
    Title = "欢迎使用EX SCRIPT",
    Desc = "作者: XiaoXu\nQQ: 3848974452\n",
})

-- 基础功能分区
Tabs.Home:Section({Title = "基础功能"})

-- 反挂机
Tabs.Home:Button({
    Title = "反挂机",
    Desc = "加载反挂机脚本",
    Callback = function()
        pcall(function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/greatjakson-lgtm/-2/main/99nights%E5%8F%8D%E6%8C%82%E6%9C%BA%E8%84%9A%E6%9C%AC"))()
        end)
    end
})

-- FPS 显示
local FpsGui
Tabs.Home:Toggle({
    Title = "显示FPS",
    Desc = "在屏幕上显示当前FPS",
    Callback = function(state)
        if state then
            if not FpsGui then
                FpsGui = Instance.new("ScreenGui")
                FpsGui.Name = "FPSGui"
                FpsGui.ResetOnSpawn = false
                
                local FpsXS = Instance.new("TextLabel")
                FpsXS.Name = "FpsXS"
                FpsXS.Size = UDim2.new(0, 100, 0, 50)
                FpsXS.Position = UDim2.new(0, 10, 0, 10)
                FpsXS.BackgroundTransparency = 1
                FpsXS.Font = Enum.Font.SourceSansBold
                FpsXS.Text = "FPS: 0"
                FpsXS.TextSize = 20
                FpsXS.TextColor3 = Color3.new(1, 1, 1)
                FpsXS.Parent = FpsGui
                FpsGui.Parent = LP:WaitForChild("PlayerGui")
                
                RunService.Heartbeat:Connect(function()
                    local fps = math.floor(1 / RunService.RenderStepped:Wait())
                    FpsXS.Text = "FPS: " .. fps
                end)
            end
            FpsGui.Enabled = true
        else
            if FpsGui then
                FpsGui.Enabled = false
            end
        end
    end
})

-- 范围显示
Tabs.Home:Toggle({
    Title = "显示范围",
    Desc = "显示玩家范围",
    Callback = function(state)
        local HeadSize = 20
        
        local function applyHighlight(character)
            if not character:FindFirstChild("WindUI_RangeHighlight") then
                local highlight = Instance.new("Highlight")
                highlight.Adornee = character
                highlight.Name = "WindUI_RangeHighlight"
                highlight.OutlineTransparency = 0
                highlight.FillTransparency = 0.7
                highlight.FillColor = Color3.fromHex("#0000FF")
                highlight.Parent = character
            end
        end

        local function removeHighlight(character)
            local h = character:FindFirstChild("WindUI_RangeHighlight")
            if h then
                h:Destroy()
            end
        end

        if state then
            for _, player in ipairs(Players:GetPlayers()) do
                if player ~= LP and player.Character then
                    applyHighlight(player.Character)
                end
            end
            Players.PlayerAdded:Connect(function(player)
                player.CharacterAdded:Connect(function(character)
                    task.wait(1)
                    applyHighlight(character)
                end)
            end)
            Players.PlayerRemoving:Connect(function(player)
                if player.Character then
                    removeHighlight(player.Character)
                end
            end)
        else
            for _, player in ipairs(Players:GetPlayers()) do
                if player.Character then
                    removeHighlight(player.Character)
                end
            end
        end
    end
})

-- 半隐身, 玩家入退提示
Tabs.Home:Button({
    Title = "半隐身",
    Desc = "加载隐身脚本",
    Callback = function()
        pcall(function() loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-Invisible-35376"))() end)
    end
})

Tabs.Home:Button({
    Title = "玩家入退提示",
    Desc = "加载玩家提示脚本",
    Callback = function()
        pcall(function() loadstring(game:HttpGet("https://raw.githubusercontent.com/boyscp/scriscriptsc/main/bbn.lua"))() end)
    end
})

-- 玩家功能分区
Tabs.Home:Section({Title = "玩家"})

-- 玩家传送功能
local function getPlayerNames()
    local names = {}
    for _, player in ipairs(Players:GetPlayers()) do
        if player ~= LP then
            table.insert(names, player.Name)
        end
    end
    return names
end

local playersDropdown = Tabs.Home:Dropdown({
    Title = "选择玩家",
    Values = getPlayerNames(),
})

-- 更新玩家列表函数
local function updatePlayersDropdown()
    playersDropdown:SetValues(getPlayerNames())
end

-- 监听玩家加入和离开
Players.PlayerAdded:Connect(updatePlayersDropdown)
Players.PlayerRemoving:Connect(updatePlayersDropdown)

-- 甩飞玩家功能
Tabs.Home:Button({
    Title = "甩飞玩家",
    Desc = "将选中的玩家甩飞",
    Callback = function()
        local selectedPlayerName = playersDropdown.Value
        if not selectedPlayerName then
            WindUI:Notify({Title = "错误", Content = "未选择玩家", Duration = 3})
            return
        end
        
        local targetPlayer = Players:FindFirstChild(selectedPlayerName)
        if not targetPlayer or not targetPlayer.Character then
            WindUI:Notify({Title = "错误", Content = "未找到玩家或玩家角色", Duration = 3})
            return
        end
        
        local character = targetPlayer.Character
        local humanoidRootPart = character:FindFirstChild("HumanoidRootPart")
        if not humanoidRootPart then
            WindUI:Notify({Title = "错误", Content = "玩家角色缺少HumanoidRootPart", Duration = 3})
            return
        end
        
        local bodyVelocity = Instance.new("BodyVelocity")
        bodyVelocity.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
        bodyVelocity.Velocity = Vector3.new(0, 50, 0) + (humanoidRootPart.CFrame.lookVector * 10)
        bodyVelocity.P = 1000
        bodyVelocity.Parent = humanoidRootPart
        
        task.delay(1, function()
            bodyVelocity:Destroy()
            WindUI:Notify({Title = "成功", Content = "已甩飞玩家 " .. selectedPlayerName, Duration = 3})
        end)
    end
})

-- 传送至玩家
Tabs.Home:Button({
    Title = "传送至玩家",
    Desc = "传送到选中的玩家",
    Callback = function()
        local selectedPlayerName = playersDropdown.Value
        if not selectedPlayerName then
            WindUI:Notify({Title = "错误", Content = "未选择玩家", Duration = 3})
            return
        end
        local targetPlayer = Players:FindFirstChild(selectedPlayerName)
        if targetPlayer and targetPlayer.Character and targetPlayer.Character:FindFirstChild("HumanoidRootPart") then
            local character = LP.Character or LP.CharacterAdded:Wait()
            local humanoidRootPart = character:WaitForChild("HumanoidRootPart")
            humanoidRootPart.CFrame = targetPlayer.Character.HumanoidRootPart.CFrame
            WindUI:Notify({Title = "成功", Content = "已传送到 " .. selectedPlayerName, Duration = 3})
        end
    end
})

-- 防甩飞
local antiWalkFlingConn
Tabs.Home:Toggle({
    Title = "防甩飞",
    Desc = "不要和甩飞同时开启!",
    Callback = function(state)
        if state then
            if antiWalkFlingConn then antiWalkFlingConn:Disconnect() end
            local lastVelocity = Vector3.new()
            antiWalkFlingConn = RunService.Stepped:Connect(function()
                local character = LP.Character
                local hrp = character and character:FindFirstChild("HumanoidRootPart")
                if not hrp then return end
                local currentVelocity = hrp.Velocity
                if (currentVelocity - lastVelocity).Magnitude > 100 then
                    hrp.Velocity = lastVelocity
                end
                lastVelocity = currentVelocity
            end)
        else
            if antiWalkFlingConn then antiWalkFlingConn:Disconnect() end
        end
    end
})

-- 角色属性分区
Tabs.Home:Section({Title = "玩家"})

-- 角色属性调整
Tabs.Home:Slider({
    Title = "设置速度",
    Desc = "调整移动速度",
    Value = { Min = 0, Max = 500, Default = 25 },
    Callback = function(val)
        local character = LP.Character
        if character then
            local humanoid = character:FindFirstChildOfClass("Humanoid")
            if humanoid then
                humanoid.WalkSpeed = val
            end
        end
    end
})

Tabs.Home:Slider({
    Title = "设置跳跃高度",
    Desc = "调整跳跃高度",
    Value = { Min = 0, Max = 500, Default = 50 },
    Callback = function(val)
        local character = LP.Character
        if character then
            local humanoid = character:FindFirstChildOfClass("Humanoid")
            if humanoid then
                humanoid.JumpPower = val
            end
        end
    end
})

-- 血量设置
local function setPlayerHealth(healthValue)
    local character = LP.Character
    
    if not character then
        character = LP.CharacterAdded:Wait()
    end
    
    local humanoid = character:WaitForChild("Humanoid")
    humanoid.Health = healthValue
    
    WindUI:Notify({
        Title = "血量设置",
        Content = "血量已设置为: " .. healthValue,
        Duration = 3
    })
end

Tabs.Home:Slider({
    Title = "设置血量",
    Desc = "调整人物血量 (0-1000)",
    Value = { Min = 0, Max = 1000, Default = 100 },
    Callback = function(val)
        setPlayerHealth(val)
    end
})

-- 无敌模式
local godModeEnabled = false
local godModeConnection
Tabs.Home:Toggle({
    Title = "无敌模式",
    Desc = "开启后血量不会减少",
    Default = false,
    Callback = function(state)
        godModeEnabled = state
        local character = LP.Character
    
        if not character then
            character = LP.CharacterAdded:Wait()
        end
        
        local humanoid = character:WaitForChild("Humanoid")
        
        if state then
            godModeConnection = humanoid.HealthChanged:Connect(function(newHealth)
                if newHealth < humanoid.MaxHealth then
                    humanoid.Health = humanoid.MaxHealth
                end
            end)
            humanoid.Health = humanoid.MaxHealth
            WindUI:Notify({Title = "无敌模式", Content = "无敌模式已开启", Duration = 3})
        else
            if godModeConnection then
                godModeConnection:Disconnect()
                godModeConnection = nil
            end
            WindUI:Notify({Title = "无敌模式", Content = "无敌模式已关闭", Duration = 3})
        end
    end
})

-- 穿墙模式
local noclipConn
Tabs.Home:Toggle({
    Title = "穿墙",
    Default = false,
    Callback = function(state)
        local character = LP.Character or LP.CharacterAdded:Wait()
        if state then
            noclipConn = RunService.Stepped:Connect(function()
                if character then
                    for _, v in pairs(character:GetChildren()) do
                        if v:IsA("BasePart") then
                            v.CanCollide = false
                        end
                    end
                end
            end)
        else
            if noclipConn then noclipConn:Disconnect() end
            if character then
                for _, v in pairs(character:GetChildren()) do
                    if v:IsA("BasePart") then
                        v.CanCollide = true
                    end
                end
            end
        end
    end
})

-- 其他实用功能分区
Tabs.Home:Section({Title = "其他"})

-- 其他实用功能
Tabs.Home:Button({
    Title = "无限跳",
    Desc = "开启后无法关闭",
    Callback = function()
        pcall(function() loadstring(game:HttpGet("https://pastebin.com/raw/V5PQy3y0", true))() end)
    end
})

-- 子弹追踪
local trackData = {}
Tabs.Home:Toggle({
    Title = "子弹追踪",
    Default = false,
    Callback = function(state)
        trackData.enabled = state
        if not state then
            if trackData.workspaceConn then trackData.workspaceConn:Disconnect() end
            for _, conn in pairs(trackData.bulletConns or {}) do conn:Disconnect() end
            trackData.bulletConns = {}
            return
        end
        
        local function getTarget(bulletPos)
            local nearestTarget, nearestDist = nil, math.huge
            for _, player in ipairs(Players:GetPlayers()) do
                if player ~= LP then
                    local char = player.Character
                    local humanoid = char and char:FindFirstChildOfClass("Humanoid")
                    local root = char and char:FindFirstChild("HumanoidRootPart")
                    if humanoid and humanoid.Health > 0 and root then
                        local dist = (bulletPos - root.Position).Magnitude
                        if dist <= 70 and dist < nearestDist then
                            nearestDist = dist
                            nearestTarget = root
                        end
                    end
                end
            end
            return nearestTarget
        end

        local function attachTrack(bullet)
            local bulletPart = bullet:IsA("BasePart") and bullet or bullet:FindFirstChildWhichIsA("BasePart")
            if not bulletPart then return end
            local bodyVel = bulletPart:FindFirstChildOfClass("BodyVelocity")
            if not bodyVel then
                bodyVel = Instance.new("BodyVelocity")
                bodyVel.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
                bodyVel.Velocity = bulletPart.Velocity
                bodyVel.Parent = bulletPart
            end

            local bulletConn = RunService.Heartbeat:Connect(function()
                if not bulletPart.Parent or not trackData.enabled then
                    bulletConn:Disconnect()
                    trackData.bulletConns[bulletConn] = nil
                    return
                end
                local target = getTarget(bulletPart.Position)
                if target then
                    local trackDir = (target.Position - bulletPart.Position).Unit
                    bodyVel.Velocity = trackDir * bulletPart.Velocity.Magnitude
                    bulletPart.CFrame = CFrame.new(bulletPart.Position, target.Position)
                end
            end)
            trackData.bulletConns[bulletConn] = true
        end
        
        trackData.workspaceConn = Workspace.ChildAdded:Connect(function(child)
            local isLocalBullet = (child.Name:lower():find("bullet") or child.Name:lower():find("projectile") or child.Name:lower():find("missile")) and (child:FindFirstChild("Owner") and child.Owner.Value == LP)
            if isLocalBullet then
                task.wait(0.05)
                attachTrack(child)
            end
        end)
    end
})

-- 夜视功能
local nightVisionData = {}
Tabs.Home:Toggle({
    Title = "夜视",
    Default = false,
    Callback = function(isEnabled)
        local lighting = game:GetService("Lighting")
        if isEnabled then
            pcall(function()
                nightVisionData.originalAmbient = lighting.Ambient
                nightVisionData.originalBrightness = lighting.Brightness
                nightVisionData.originalFogEnd = lighting.FogEnd
                lighting.Ambient = Color3.fromRGB(255, 255, 255)
                lighting.Brightness = 1
                lighting.FogEnd = 1e10
                for _, v in pairs(lighting:GetDescendants()) do
                    if v:IsA("BloomEffect") or v:IsA("BlurEffect") or v:IsA("ColorCorrectionEffect") or v:IsA("SunRaysEffect") then
                        v.Enabled = false
                    end
                end
                nightVisionData.changedConnection = lighting.Changed:Connect(function()
                    lighting.Ambient = Color3.fromRGB(255, 255, 255)
                    lighting.Brightness = 1
                    lighting.FogEnd = 1e10
                end)
                local character = LP.Character or LP.CharacterAdded:Wait()
                local humanoidRootPart = character:WaitForChild("HumanoidRootPart")
                if not humanoidRootPart:FindFirstChildWhichIsA("PointLight") then
                    local headlight = Instance.new("PointLight", humanoidRootPart)
                    headlight.Brightness = 1
                    headlight.Range = 60
                    nightVisionData.pointLight = headlight
                end
            end)
        else
            if nightVisionData.originalAmbient then lighting.Ambient = nightVisionData.originalAmbient end
            if nightVisionData.originalBrightness then lighting.Brightness = nightVisionData.originalBrightness end
            if nightVisionData.originalFogEnd then lighting.FogEnd = nightVisionData.originalFogEnd end
            if nightVisionData.changedConnection then nightVisionData.changedConnection:Disconnect() end
            if nightVisionData.pointLight and nightVisionData.pointLight.Parent then nightVisionData.pointLight:Destroy() end
        end
    end
})

-- 人物透视 (ESP) 功能
local espEnabled = false
local espConnections = {}
local espHighlights = {}
local espNameTags = {}

local function createESP(player)
    local char = player.Character or player.CharacterAdded:Wait()
    local humanoidRootPart = char:FindFirstChild("HumanoidRootPart")
    if not humanoidRootPart then return end

    local highlight = Instance.new("Highlight")
    highlight.Name = "WindUI_ESP"
    highlight.Adornee = char
    highlight.FillColor = Color3.new(1, 0, 1)
    highlight.FillTransparency = 0.5
    highlight.OutlineTransparency = 0
    highlight.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
    highlight.Parent = char
    espHighlights[player] = highlight

    local nameTag = Instance.new("BillboardGui")
    nameTag.Name = "WindUI_NameTag"
    nameTag.Adornee = humanoidRootPart
    nameTag.Size = UDim2.new(0, 150, 0, 20)
    nameTag.StudsOffset = Vector3.new(0, 2.8, 0)
    nameTag.AlwaysOnTop = true
    nameTag.Parent = humanoidRootPart
    
    local textLabel = Instance.new("TextLabel")
    textLabel.Size = UDim2.new(1, 0, 1, 0)
    textLabel.BackgroundTransparency = 1
    textLabel.Text = player.Name
    textLabel.TextColor3 = Color3.new(1, 1, 1)
    textLabel.Font = Enum.Font.SourceSansBold
    textLabel.TextSize = 14
    textLabel.TextScaled = false
    textLabel.Parent = nameTag
    espNameTags[player] = nameTag
end

local function removeESP(player)
    if espHighlights[player] and espHighlights[player].Parent then
        espHighlights[player]:Destroy()
        espHighlights[player] = nil
    end
    if espNameTags[player] and espNameTags[player].Parent then
        espNameTags[player]:Destroy()
        espNameTags[player] = nil
    end
end

local function toggleESP(state)
    espEnabled = state
    if state then
        for _, player in ipairs(Players:GetPlayers()) do
            if player ~= LP then
                pcall(createESP, player)
            end
        end

        espConnections.playerAdded = Players.PlayerAdded:Connect(function(player)
            player.CharacterAdded:Wait()
            pcall(createESP, player)
        end)
        espConnections.playerRemoving = Players.PlayerRemoving:Connect(function(player)
            removeESP(player)
        end)
    else
        if espConnections.playerAdded then espConnections.playerAdded:Disconnect() end
        if espConnections.playerRemoving then espConnections.playerRemoving:Disconnect() end
        for player, _ in pairs(espHighlights) do
            removeESP(player)
        end
        espHighlights = {}
        espNameTags = {}
    end
end

Tabs.Home:Toggle({
    Title = "人物透视 (ESP)",
    Desc = "显示其他玩家的透视框和名字。",
    Default = false,
    Callback = toggleESP,
})

-- 服务器功能分区
Tabs.Home:Section({Title = "服务器"})

Tabs.Home:Button({
    Title = "切换服务器",
    Desc = "切换到相同游戏的另一个服务器",
    Callback = function()
        local TeleportService = game:GetService("TeleportService")
        local placeId = game.PlaceId
        TeleportService:Teleport(placeId, LP)
    end
})

Tabs.Home:Button({
    Title = "重新加入服务器",
    Desc = "重新加入当前服务器",
    Callback = function()
        local TeleportService = game:GetService("TeleportService")
        local placeId = game.PlaceId
        local jobId = game.JobId
        TeleportService:TeleportToPlaceInstance(placeId, jobId, LP)
    end
})

Tabs.Home:Button({
    Title = "复制服务器ID",
    Desc = "复制当前服务器的Job ID到剪贴板",
    Callback = function()
        setclipboard(game.JobId)
        WindUI:Notify({
            Title = "服务器ID已复制",
            Content = "Job ID: " .. game.JobId,
            Duration = 3
        })
    end
})

Tabs.Home:Button({
    Title = "服务器信息",
    Desc = "显示当前服务器的信息",
    Callback = function()
        local players = Players:GetPlayers()
        local maxPlayers = Players.MaxPlayers
        local placeId = game.PlaceId
        local jobId = game.JobId
        local serverType = game:GetService("RunService"):IsStudio() and "Studio" or "Live"
        
        WindUI:Notify({
            Title = "服务器信息",
            Content = string.format("玩家数量: %d/%d\nPlace ID: %d\nJob ID: %s\n服务器类型: %s", #players, maxPlayers, placeId, jobId, serverType),
            Duration = 10
        })
    end
})

-- 特殊功能分区
Tabs.Home:Section({Title = "分支"})

Tabs.Home:Button({
    Title = "显示EX SCRIPT用户",
    Icon = "user",
    Callback = function()
        local function createFloatingText(player, text)
            if player.Character and player.Character:FindFirstChild("Head") then
                local existingText = player.Character.Head:FindFirstChild("WUScriptText")
                if existingText then
                    existingText:Destroy()
                end
                
                local billboard = Instance.new("BillboardGui")
                billboard.Name = "WUScriptText"
                billboard.Adornee = player.Character.Head
                billboard.Size = UDim2.new(0, 200, 0, 50)
                billboard.StudsOffset = Vector3.new(0, 2.5, 0)
                billboard.AlwaysOnTop = true
                billboard.Parent = player.Character.Head
                
                local textLabel = Instance.new("TextLabel")
                textLabel.Size = UDim2.new(1, 0, 1, 0)
                textLabel.BackgroundTransparency = 1
                textLabel.Text = text
                textLabel.Font = Enum.Font.SourceSansBold
                textLabel.TextSize = 20
                textLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
                textLabel.TextStrokeTransparency = 0
                textLabel.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
                textLabel.Parent = billboard
                
                -- 创建彩虹色渐变
                local colorSequence = ColorSequence.new({
                    ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 0, 0)),
                    ColorSequenceKeypoint.new(0.16, Color3.fromRGB(255, 165, 0)),
                    ColorSequenceKeypoint.new(0.33, Color3.fromRGB(255, 255, 0)),
                    ColorSequenceKeypoint.new(0.5, Color3.fromRGB(0, 255, 0)),
                    ColorSequenceKeypoint.new(0.66, Color3.fromRGB(0, 0, 255)),
                    ColorSequenceKeypoint.new(0.83, Color3.fromRGB(75, 0, 130)),
                    ColorSequenceKeypoint.new(1, Color3.fromRGB(148, 0, 211))
                })
                
                local uigradient = Instance.new("UIGradient")
                uigradient.Color = colorSequence
                uigradient.Rotation = 0
                uigradient.Offset = Vector2.new(-1, 0)
                uigradient.Parent = textLabel
                
                local tweenInfo = TweenInfo.new(
                    3,
                    Enum.EasingStyle.Linear, 
                    Enum.EasingDirection.InOut, 
                    -1,
                    true
                )
                
                local tween = TweenService:Create(
                    uigradient, 
                    tweenInfo, 
                    {Offset = Vector2.new(1, 0)}
                )
                tween:Play()
            end
        end
        
        createFloatingText(LP, "Old Winter 用户")
        
        WindUI:Notify({
            Title = "已显示",
            Content = "显示'EX用户' ",
            Duration = 3
        })
    end
})

Tabs.Home:Button({
    Title = "EX FLY",
    Desc = "点击运行EX飞行",
    Callback = function()
       loadstring(game:HttpGet("https://raw.githubusercontent.com/WUSCRIPT/WU-Script/main/EX%20FLY"))()
       WindUI:Notify({
           Title = "EX FLY",
           Content = "加载成功",
           Duration = 3,
       })
    end
})

Tabs.Home:Button({
    Title = "显示xyz轴",
    Desc = "点击运行显示xyz轴",
    Callback = function()
       local player = game.Players.LocalPlayer
local gui = Instance.new("ScreenGui")
gui.Name = "XYZ_Display"
gui.Parent = player:WaitForChild("PlayerGui")
gui.ResetOnSpawn = false

local label = Instance.new("TextLabel")
label.Parent = gui
label.BackgroundTransparency = 0.5
label.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
label.Position = UDim2.new(0, 10, 0, 10)
label.Size = UDim2.new(0, 250, 0, 40)
label.Font = Enum.Font.SourceSansBold
label.TextColor3 = Color3.new(1,1,1)
label.TextSize = 18
label.TextStrokeTransparency = 0.7
label.Text = "XYZ: Loading..."

game:GetService("RunService").RenderStepped:Connect(function()
    local char = player.Character
    if char then
        local hrp = char:FindFirstChild("HumanoidRootPart")
        if hrp then
            local pos = hrp.Position
            label.Text = string.format("X: %d\nY: %d\nZ: %d", math.floor(pos.X), math.floor(pos.Y), math.floor(pos.Z))
        else
            label.Text = "XYZ: 未找到角色"
        end
    else
        label.Text = "XYZ: 等待角色生成"
    end
end)
       WindUI:Notify({
           Title = "显示xyz轴",
           Content = "加载成功",
           Duration = 3,
       })
    end
})

Tabs.ScriptCenter:Paragraph({
    Title = "EX Script",
    Desc = "EX Sinicization"
})

-- 模块加载分区
Tabs.ScriptCenter:Section({Title = "主要"})

-- 加载状态跟踪
local LoadedModules = {
    StealBrainrot = false,
    MakeArmy = false,
    Beggar = false,
    SaberSimulator = false,
    DigBackyard = false,
    ElementTycoon = false,
    FortressBattle = false,
    Doors = false
}
Tabs.ScriptCenter:Button({
    Title = "加载EX 自动翻译功能",
    Desc = "加载EX功能",
    Callback = function()
       local isChineseSimplified = false
local success, result = pcall(function()
    local languageCode = game:GetService("LocalizationService").RobloxLocaleId
    return languageCode == "zh-cn" or languageCode == "zh-Hans" or languageCode:lower():find("zh") == 1
end)

if success and result then
    isChineseSimplified = true
else
    return
end

local WindUI = loadstring(game:HttpGet("https://github.com/Footagesus/WindUI/releases/latest/download/main.lua"))()

task.wait(2)

WindUI:Notify({
    Title = "EX",
    Content = "UI翻译已完成加载过程",
    Duration = 4
})

task.wait(0.5)

local player = game.Players.LocalPlayer
local HttpService = game:GetService("HttpService")
local RunService = game:GetService("RunService")
local CoreGui = game:GetService("CoreGui")
local TweenService = game:GetService("TweenService")
local playerGui = player.PlayerGui

local Window = WindUI:CreateWindow({
    Title = "Old Winter<font color='#00FF00'>Translation</font>",
    Icon = "rbxassetid://4483362748",
    IconTransparency = 1,
    Author = "EX UI翻译",
    Folder = "Translator",
    Size = UDim2.fromOffset(100, 150),
    Transparent = true,
    Theme = "Dark",
    UserEnabled = true,
    SideBarWidth = 200,
    HasOutline = true,
    User = {
        Enabled = true,
        Anonymous = false,
        Username = player.Name,
        DisplayName = player.DisplayName,
        UserId = player.UserId,
        Thumbnail = "https://www.roblox.com/headshot-thumbnail/image?userId=" .. player.UserId .. "&width=420&height=420&format=png",
        Callback = function()
            WindUI:Notify({
                Title = "用户信息",
                Content = "玩家: " .. player.Name,
                Duration = 3
            })
        end
    }
})

task.wait(0.3)

Window:EditOpenButton({
    Title = "Translation",
    Icon = "crown",
    CornerRadius = UDim.new(0,16),
    StrokeThickness = 2,
    Color = ColorSequence.new(
        Color3.fromHex("FF0000"), 
        Color3.fromHex("0000FF")
    ),
    Draggable = true,
})

task.wait(0.2)

local Tabs = {
    Main = Window:Section({ Title = "翻译", Opened = true }),
    Advanced = Window:Section({ Title = "检测", Opened = false })
}

local TabHandles = {
    Translator = Tabs.Main:Tab({ Title = "翻译", Icon = "languages" }),
    Detection = Tabs.Advanced:Tab({ Title = "UI检测", Icon = "search" })
}

TabHandles.Translator:Paragraph({
    Title = "WU SCRIPT UI翻译",
    Desc = "WU SCRIPT UI翻译高级版",
    Image = "code",
    ImageSize = 20,
    Color = "White",
})

TabHandles.Translator:Divider()

local languageCodes = {
    ["自动检测"] = "auto",
    ["中文(简体)"] = "zh-CN",
    ["中文(繁体)"] = "zh-TW",
    ["英语"] = "en",
    ["日语"] = "ja",
    ["韩语"] = "ko",
    ["法语"] = "fr",
    ["德语"] = "de",
    ["西班牙语"] = "es",
    ["俄语"] = "ru",
    ["阿拉伯语"] = "ar",
    ["葡萄牙语"] = "pt",
    ["意大利语"] = "it",
    ["荷兰语"] = "nl",
    ["希腊语"] = "el",
    ["印地语"] = "hi",
    ["土耳其语"] = "tr",
    ["越南语"] = "vi",
    ["泰语"] = "th"
}

local languageList = {
    "自动检测",
    "中文(简体)",
    "中文(繁体)",
    "英语",
    "日语",
    "韩语",
    "法语",
    "德语",
    "西班牙语",
    "俄语",
    "阿拉伯语",
    "葡萄牙语",
    "意大利语",
    "荷兰语",
    "希腊语",
    "印地语",
    "土耳其语",
    "越南语",
    "泰语"
}

local translationCache = {}
local isTranslating = false
local lastTranslatedText = ""
local lastUsedAPI = "Google"

local YOUDAO_APP_ID = "015e4bc650d16a48"
local YOUDAO_APP_KEY = "wXwwoaeESXz9CzB3yeTDe54JuOzkVbH7"

local SUPPORTED_UI_TYPES = {
    "TextLabel", "TextButton", "TextBox", "TextLabel", 
    "Frame", "ScrollingFrame", "ImageButton", "ImageLabel"
}

local DANGEROUS_COMMANDS = {
    "neon", "shine", "ghost", "gold", "spin", 
    "bighead", "smallhead", "giantdwarf", "squash"
}

local LANGUAGE_PATTERNS = {
    ["zh-CN"] = {
        pattern = "[\199-\244][\128-\191]*[\128-\191]",
        exclude = "[\227][\128-\191][\128-\191]"
    },
    ["zh-TW"] = {
        pattern = "[\227][\128-\191][\128-\191]"
    },
    ["ja"] = {
        pattern = "[\123-\125]|[\199-\244][\128-\191]*[\128-\191]",
        exclude = "[\199-\244][\128-\191]*[\128-\191]"
    },
    ["ko"] = {
        pattern = "[\234-\235][\128-\191][\128-\191]|[\236-\237][\128-\191][\128-\191]"
    },
    ["ar"] = {
        pattern = "[\216-\219][\128-\191]"
    },
    ["ru"] = {
        pattern = "[\208-\209][\128-\191]"
    },
    ["th"] = {
        pattern = "[\224-\231][\128-\191]"
    },
    ["en"] = {
        pattern = "[A-Za-z]",
        exclude = "[\199-\244][\128-\191]*[\128-\191]"
    }
}

local TARGET_LANGUAGE = "zh-CN"
local SCAN_INTERVAL = 2
local MAX_TEXT_LENGTH = 5000

local translatedCache = {}
local translatedObjects = {}
local isTranslationEnabled = false
local connection = nil

local BATCH_SIZE = 20
local MAX_CACHE_SIZE = 3000
local lastScanTime = 0
local SCAN_COOLDOWN = 0.02
local TRANSLATION_DELAY = 0.01
local MAX_CONCURRENT_REQUESTS = 10

local function isDangerousText(text)
    if not text or type(text) ~= "string" then return false end
    local lowerText = text:lower()
    for _, cmd in ipairs(DANGEROUS_COMMANDS) do
        if lowerText:find(cmd) then
            return true
        end
    end
    return false
end

local function shouldSkipTranslation(text)
    if not text or text == "" or translatedCache[text] then
        return true
    end
    
    if text:match("^%s*$") or 
       text:match("^[0-9%.%s,:/]+$") or 
       #text > MAX_TEXT_LENGTH or
       isDangerousText(text) then
        translatedCache[text] = text
        return true
    end
    
    return false
end

local function detectLanguage(text)
    if not text or type(text) ~= "string" or text == "" then
        return "en"
    end
    
    if text:match(LANGUAGE_PATTERNS["zh-CN"].pattern) and 
       (not LANGUAGE_PATTERNS["zh-CN"].exclude or not text:match(LANGUAGE_PATTERNS["zh-CN"].exclude)) then
        return "zh-CN"
    end
    
    if text:match(LANGUAGE_PATTERNS["zh-TW"].pattern) then
        return "zh-TW"
    end
    
    if text:match(LANGUAGE_PATTERNS["ja"].pattern) and 
       (not LANGUAGE_PATTERNS["ja"].exclude or not text:match(LANGUAGE_PATTERNS["ja"].exclude)) then
        return "ja"
    end
    
    if text:match(LANGUAGE_PATTERNS["ko"].pattern) then
        return "ko"
    end
    
    if text:match(LANGUAGE_PATTERNS["ar"].pattern) then
        return "ar"
    end
    
    if text:match(LANGUAGE_PATTERNS["ru"].pattern) then
        return "ru"
    end
    
    if text:match(LANGUAGE_PATTERNS["th"].pattern) then
        return "th"
    end
    
    return "en"
end

local function googleTranslate(text, targetLang, sourceLang)
    if not text or text == "" then return text end
    
    sourceLang = sourceLang or "auto"
    
    local cacheKey = "google_"..text.."|"..sourceLang.."|"..targetLang
    if translationCache[cacheKey] then
        return translationCache[cacheKey]
    end
    
    local url = string.format(
        "https://translate.googleapis.com/translate_a/single?client=gtx&sl=%s&tl=%s&dt=t&q=%s",
        sourceLang, targetLang, HttpService:UrlEncode(text)
    )
    
    local success, response = pcall(function()
        return game:HttpGet(url, true)
    end)
    
    if success and response then
        local success2, data = pcall(function()
            return HttpService:JSONDecode(response)
        end)
        
        if success2 and data and data[1] then
            local result = ""
            for i, segment in ipairs(data[1]) do
                if segment[1] then
                    result = result .. segment[1]
                end
            end
            
            if result ~= "" and result ~= text then
                translationCache[cacheKey] = result
                lastUsedAPI = "Google"
                return result
            end
        end
    end
    
    return nil
end

local function youdaoTranslate(text, targetLang, sourceLang)
    if not text or text == "" then return text end
    
    sourceLang = sourceLang or "auto"
    
    local cacheKey = "youdao_"..text.."|"..sourceLang.."|"..targetLang
    if translationCache[cacheKey] then
        return translationCache[cacheKey]
    end
    
    local salt = tostring(tick())
    local input = text
    if #input > 20 then
        input = input:sub(1, 10) .. #input .. input:sub(-10)
    end
    
    local signStr = YOUDAO_APP_ID .. input .. salt .. YOUDAO_APP_KEY
    local sign = game:GetService("HashService"):ComputeMD5Async(signStr)
    
    local url = string.format(
        "https://openapi.youdao.com/api?q=%s&from=%s&to=%s&appKey=%s&salt=%s&sign=%s",
        HttpService:UrlEncode(text),
        sourceLang == "auto" and "auto" or sourceLang,
        targetLang,
        YOUDAO_APP_ID,
        salt,
        sign
    )
    
    local success, response = pcall(function()
        return game:HttpGet(url, true)
    end)
    
    if success and response then
        local success2, data = pcall(function()
            return HttpService:JSONDecode(response)
        end)
        
        if success2 and data and data.translation and data.translation[1] then
            local result = data.translation[1]
            
            if result ~= "" and result ~= text then
                translationCache[cacheKey] = result
                lastUsedAPI = "Youdao"
                return result
            end
        end
    end
    
    return nil
end

local function translateText(text, targetLang, sourceLang)
    if not text or text == "" or text:match("^%s*$") then
        return text
    end
    
    if text:match("^[%d%p%s]+$") then
        return text
    end
    
    local detectedLang = detectLanguage(text)
    
    if detectedLang == "zh-CN" or detectedLang == "zh-TW" then
        return text
    end
    
    local result = googleTranslate(text, targetLang, sourceLang)
    if not result or result == text then
        result = youdaoTranslate(text, targetLang, sourceLang)
    end
    return result or text
end

local targetLang = "zh-CN"
local sourceLang = "auto"

local sourceLangDropdown = TabHandles.Translator:Dropdown({
    Title = "被翻译语言",
    Values = languageList,
    Value = "自动检测",
    Callback = function(option)
        sourceLang = languageCodes[option] or "auto"
        WindUI:Notify({
            Title = "被翻译语言设置",
            Content = "已选择: " .. option,
            Duration = 2
        })
    end
})

local targetLangDropdown = TabHandles.Translator:Dropdown({
    Title = "翻译语言",
    Values = languageList,
    Value = "中文(简体)",
    Callback = function(option)
        if option ~= "自动检测" then
            targetLang = languageCodes[option] or "zh-CN"
            WindUI:Notify({
                Title = "翻译语言设置",
                Content = "已选择: " .. option,
                Duration = 2
            })
        else
            WindUI:Notify({
                Title = "错误",
                Content = "翻译语言不能选择自动检测",
                Duration = 2
            })
        end
    end
})

local currentMode = 2
local modes = {
    {"快速模式", "置于极速之前"},
    {"标准模式", "上下文翻译"},
    {"基本全翻译模式", "完整翻译"},
    {"极速模式", "速度翻译"}
}

local modeDropdown = TabHandles.Translator:Dropdown({
    Title = "翻译模式",
    Values = {"快速模式", "标准模式", "基本全翻译模式", "极速模式"},
    Value = "自匹配模式",
    Callback = function(option)
        currentMode = table.find({"快速模式", "标准模式", "基本全翻译模式", "极速模式"}, option) or 2
        
        if option == "极速模式" then
            BATCH_SIZE = 50
            SCAN_COOLDOWN = 0.005
            TRANSLATION_DELAY = 0.002
            MAX_CONCURRENT_REQUESTS = 25
        elseif option == "快速模式" then
            BATCH_SIZE = 30
            SCAN_COOLDOWN = 0.01
            TRANSLATION_DELAY = 0.005
            MAX_CONCURRENT_REQUESTS = 15
        elseif option == "标配模式" then
            BATCH_SIZE = 20
            SCAN_COOLDOWN = 0.02
            TRANSLATION_DELAY = 0.01
            MAX_CONCURRENT_REQUESTS = 10
        elseif option == "全翻译模式" then
            BATCH_SIZE = 10
            SCAN_COOLDOWN = 0.05
            TRANSLATION_DELAY = 0.02
            MAX_CONCURRENT_REQUESTS = 5
        end
        
        WindUI:Notify({
            Title = "模式切换",
            Content = modes[currentMode][2],
            Duration = 2
        })
    end
})

local cacheEnabled = true
TabHandles.Translator:Toggle({
    Title = "启用缓存",
    Desc = "提高翻译效率",
    Value = true,
    Callback = function(state)
        cacheEnabled = state
        if not cacheEnabled then
            translationCache = {}
        end
    end
})

TabHandles.Translator:Divider()

local function hasTextContent(gui)
    if gui:IsA("TextLabel") or gui:IsA("TextButton") or gui:IsA("TextBox") then
        return gui.Text and gui.Text ~= ""
    elseif gui:IsA("ImageButton") or gui:IsA("ImageLabel") then
        return gui:GetAttribute("Text") or gui.Name ~= ""
    end
    return false
end

local function getTextContent(gui)
    if gui:IsA("TextLabel") or gui:IsA("TextButton") or gui:IsA("TextBox") then
        return gui.Text
    elseif gui:IsA("ImageButton") or gui:IsA("ImageLabel") then
        return gui:GetAttribute("Text") or gui.Name
    end
    return nil
end

local function setTextContent(gui, text)
    if gui:IsA("TextLabel") or gui:IsA("TextButton") or gui:IsA("TextBox") then
        gui.Text = text
    elseif gui:IsA("ImageButton") or gui:IsA("ImageLabel") then
        gui:SetAttribute("OriginalText", getTextContent(gui))
        gui:SetAttribute("Text", text)
    end
end

local function parallelTranslateBatch(batch)
    local results = {}
    local completed = 0
    local total = #batch
    local activeRequests = 0
    
    local function processItem(item, index)
        if not translatedCache[item.text] then
            activeRequests = activeRequests + 1
            
            local success, translated = pcall(function()
                return translateText(item.text, targetLang, sourceLang)
            end)
            
            if success and translated and translated ~= item.text then
                results[item.gui] = translated
                translatedCache[item.text] = translated
                lastTranslatedText = item.text .. " → " .. translated
                lastUsedAPI = "Google"
            else
                translatedCache[item.text] = item.text
            end
            
            activeRequests = activeRequests - 1
        end
        completed = completed + 1
    end
    
    for i, item in ipairs(batch) do
        while activeRequests >= MAX_CONCURRENT_REQUESTS do
            task.wait()
        end
        
        task.spawn(processItem, item, i)
        
        if i % 5 == 0 then
            task.wait(0.001)
        end
    end
    
    while completed < total do
        task.wait()
    end
    
    return results, total
end

local function fastCollectElements()
    local elementsToTranslate = {}
    local guisToScan = {playerGui, CoreGui}
    
    for _, gui in ipairs(guisToScan) do
        if gui and gui:IsDescendantOf(game) then
            local descendants = gui:GetDescendants()
            for i = 1, #descendants do
                local guiObj = descendants[i]
                if not translatedObjects[guiObj] and table.find(SUPPORTED_UI_TYPES, guiObj.ClassName) then
                    local text = getTextContent(guiObj)
                    if text and text ~= "" and not shouldSkipTranslation(text) then
                        table.insert(elementsToTranslate, {
                            gui = guiObj,
                            text = text
                        })
                        translatedObjects[guiObj] = true
                    end
                end
            end
        end
    end
    
    return elementsToTranslate
end

local function ultraFastTranslateGuiElements()
    local count = 0
    local currentTime = tick()
    
    if currentTime - lastScanTime < SCAN_COOLDOWN then
        return count
    end
    lastScanTime = currentTime
    
    local elementsToTranslate = fastCollectElements()
    
    if #elementsToTranslate > 0 then
        for i = 1, #elementsToTranslate, BATCH_SIZE do
            local batch = {}
            local batchEnd = math.min(i + BATCH_SIZE - 1, #elementsToTranslate)
            
            for j = i, batchEnd do
                table.insert(batch, elementsToTranslate[j])
            end
            
            local batchResults, batchCount = parallelTranslateBatch(batch)
            count = count + batchCount
            
            for gui, translated in pairs(batchResults) do
                if gui and gui.Parent then
                    setTextContent(gui, translated)
                end
            end
            
            if batchCount > 0 then
                task.wait(TRANSLATION_DELAY)
            end
        end
        
        if count > 0 and TabHandles.Translator then
            for _, paragraph in pairs(TabHandles.Translator.Paragraphs or {}) do
                if paragraph.Title == "最近翻译" then
                    paragraph:SetDesc(lastTranslatedText .. " (via " .. lastUsedAPI .. ")")
                    break
                end
            end
        end
    end
    
    if table.count(translatedCache) > MAX_CACHE_SIZE then
        local newCache = {}
        local i = 0
        for k, v in pairs(translatedCache) do
            if i < MAX_CACHE_SIZE / 2 then
                newCache[k] = v
                i = i + 1
            else
                break
            end
        end
        translatedCache = newCache
    end
    
    return count
end

local function deepScanUI()
    local guisToScan = {
        player.PlayerGui,
        CoreGui
    }
    
    for _, service in ipairs({
        game:GetService("StarterGui"),
        game:GetService("CoreGui"),
        game:GetService("Players").LocalPlayer.PlayerGui
    }) do
        table.insert(guisToScan, service)
    end
    
    return guisToScan
end

local translateButtonRef
translateButtonRef = TabHandles.Translator:Button({
    Title = "执行翻译",
    Icon = "play",
    Variant = "Primary",
    Callback = function()
        if isTranslating then
            isTranslating = false
            if translateButtonRef then
                translateButtonRef:SetTitle("执行翻译")
            end
            WindUI:Notify({
                Title = "翻译",
                Content = "翻译已停止",
                Icon = "stop-circle",
                Duration = 2
            })
            return
        end
        
        isTranslating = true
        if translateButtonRef then
            translateButtonRef:SetTitle("停止翻译")
        end
        WindUI:Notify({
            Title = "翻译",
            Content = "极速翻译已启动",
            Icon = "zap",
            Duration = 2
        })
        
        task.spawn(function()
            local startTime = tick()
            local totalTranslated = 0
            
            while isTranslating and tick() - startTime < 5 do
                local count = ultraFastTranslateGuiElements()
                totalTranslated = totalTranslated + count
                
                local elapsed = tick() - startTime
                if elapsed > 3 and count == 0 then
                    break
                end
                
                task.wait(0.03)
            end
            
            if isTranslating then
                isTranslating = false
                if translateButtonRef then
                    translateButtonRef:SetTitle("执行翻译")
                end
                
                WindUI:Notify({
                    Title = "翻译完成",
                    Content = string.format("5秒内翻译了 %d 个元素", totalTranslated),
                    Icon = "check-circle",
                    Duration = 3
                })
            end
        end)
    end
})

local speedSlider = TabHandles.Translator:Slider({
    Title = "翻译速度",
    Desc = "调整翻译速度",
    Value = { Min = 1, Max = 10, Default = 5 },
    Callback = function(value)
        if currentMode ~= 4 then
            BATCH_SIZE = 20 + value * 5
            SCAN_COOLDOWN = 0.01 - (value * 0.001)
            MAX_CONCURRENT_REQUESTS = 10 + value * 2
            
            WindUI:Notify({
                Title = "速度",
                Content = string.format("速度: %d, 批量: %d, 并发: %d", value, BATCH_SIZE, MAX_CONCURRENT_REQUESTS),
                Duration = 1
            })
        else
            WindUI:Notify({
                Title = "提示",
                Content = "极速模式下调整速度参数无用",
                Duration = 2
            })
        end
    end
})

TabHandles.Translator:Divider()

local lastTranslation = TabHandles.Translator:Paragraph({
    Title = "最近翻译",
    Desc = "无",
    Image = "clock",
    ImageSize = 20,
    Color = "Grey"
})

TabHandles.Translator:Button({
    Title = "清理缓存",
    Icon = "trash",
    Callback = function()
        translationCache = {}
        translatedCache = {}
        translatedObjects = {}
        WindUI:Notify({
            Title = "缓存已清理完毕",
            Content = "翻译缓存已清空",
            Duration = 2
        })
    end
})

TabHandles.Translator:Button({
    Title = "刷新",
    Icon = "refresh-cw",
    Callback = function()
        for k in pairs(translatedCache) do
            translatedCache[k] = nil
        end
        
        WindUI:Notify({
            Title = "强制刷新",
            Content = "已清除翻译缓存，下次扫描将重新翻译",
            Duration = 2
        })
    end
})

TabHandles.Detection:Paragraph({
    Title = "UI检测",
    Desc = "检测所有UI",
    Image = "search",
    ImageSize = 20,
    Color = "White"
})

local gameInfo = game:GetService("MarketplaceService"):GetProductInfo(game.PlaceId)
TabHandles.Detection:Paragraph({
    Title = "游戏信息",
    Desc = gameInfo.Name,
    Image = "info",
    ImageSize = 20,
    Color = "Grey"
})

TabHandles.Detection:Button({
    Title = "检测UI",
    Icon = "search",
    Callback = function()
        local uiCount = 0
        local textCount = 0
        
        local guisToScan = deepScanUI()
        for _, gui in ipairs(guisToScan) do
            pcall(function()
                for _, child in ipairs(gui:GetDescendants()) do
                    if table.find(SUPPORTED_UI_TYPES, child.ClassName) then
                        uiCount = uiCount + 1
                        if hasTextContent(child) then
                            textCount = textCount + 1
                        end
                    end
                end
            end)
        end
        
        WindUI:Notify({
            Title = "UI检测结果",
            Content = string.format("发现 %d 个UI元素，%d 个有文本内容", uiCount, textCount),
            Duration = 5
        })
    end
})

Window:OnClose(function()
    isTranslating = false
end)

Window:OnDestroy(function()
    isTranslating = false
end)

task.spawn(function()
    local commonTexts = {
        "Play", "Start", "Settings", "Options", "Exit", "Continue",
        "Back", "Next", "Yes", "No", "OK", "Cancel", "Loading"
    }
    
    for _, text in ipairs(commonTexts) do
        pcall(function()
            translateText(text, targetLang, "en")
        end)
    end
end)

local function cleanupMemory()
    collectgarbage("collect")
    
    if table and table.count and table.count(translatedCache) > MAX_CACHE_SIZE then
        local newCache = {}
        local i = 0
        for k, v in pairs(translatedCache) do
            if i < MAX_CACHE_SIZE / 2 then
                newCache[k] = v
                i = i + 1
            else
                break
            end
        end
        translatedCache = newCache
    end
    
    task.wait(5)
end

task.spawn(function()
    while true do
        cleanupMemory()
        task.wait(30)
    end
end)

task.wait(1)
WindUI:Notify({
    Title = "EX 已加载完毕",
    Content = "EXUI汉化",
    Icon = "check-circle",
    Duration = 3
})
       Library:Notify("Old Winter 自动翻译 已加载!", 5)
    end
})
-- WU偷走脑红功能
local function LoadStealBrainrot()
    if LoadedModules.StealBrainrot then 
        WindUI:Notify({Title = "偷走脑红", Content = "偷走脑红功能已加载过", Duration = 3})
        return 
    end
    
    -- 创建偷走脑红标签页
    local StealBrainrotTab = Window:Tab({ Title = "偷走脑红", Icon = "brain" })
    
    StealBrainrotTab:Paragraph({
        Title = "EX 偷走脑红",
        Desc = "Steal Brainrot",
    })

    -- 防X-15/X-16检测功能
    local antiDetectionEnabled = false
    local scanned = {}
    local ReplicatedStorage = cloneref(game:GetService("ReplicatedStorage"))
    local Players = cloneref(game:GetService("Players"))
    
    local function hookRemote(remote)
        if remote:IsA("RemoteEvent") then
            local oldFire
            oldFire = hookfunction(remote.FireServer, function(self, ...)
                local args = {...}
                if antiDetectionEnabled and args[1] and (tostring(args[1]):lower() == "x-15" or tostring(args[1]) == "X-15") or (tostring(args[1]):lower() == "x-16" or tostring(args[1]) == "X-16") then
                    WindUI:Notify({Title = "防检测", Content = "已拦截检测请求", Duration = 3})
                    return task.wait(9e9)
                end
                return oldFire(self, unpack(args))
            end)
        end
    end
    
    local function isRemote(obj)
        return typeof(obj) == "Instance" and obj:IsA("RemoteEvent")
    end
    
    local function deepScan(value)
        if scanned[value] then return end
        scanned[value] = true
        if isRemote(value) then
            if not value:IsDescendantOf(ReplicatedStorage) then
                hookRemote(value)
                local Old 
                Old = hookfunction(getrenv().coroutine.wrap, function(...)
                    if antiDetectionEnabled and not checkcaller() then
                        WindUI:Notify({Title = "防检测", Content = "已拦截可疑协程", Duration = 3})
                        return task.wait(9e9)
                    end
                    return Old(...)
                end)
            end
            return
        end
        if typeof(value) == "function" then
            local upvalues = getupvalues(value)
            for i, v in pairs(upvalues) do
                deepScan(v)
            end
        end
        if typeof(value) == "table" then
            for k, v in pairs(value) do
                deepScan(v)
            end
        end
    end
    
    local function setupAntiDetection()
        if antiDetectionEnabled then
            -- 扫描并挂钩远程事件
            scanned = {}
            for _, obj in next, getgc(true) do
                if typeof(obj) == "function" and islclosure(obj) and not isexecutorclosure(obj) then
                    deepScan(obj)
                end
            end
            WindUI:Notify({Title = "防检测", Content = "防检测已启用", Duration = 3})
        else
            -- 这里可以添加恢复原始函数的代码
            WindUI:Notify({Title = "防检测", Content = "防检测已禁用", Duration = 3})
        end
    end

    -- 防X-15/X-16检测开关
    StealBrainrotTab:Toggle({
        Title = "过检测",
        Description = "防止被游戏检测",
        Callback = function(state)
            antiDetectionEnabled = state
            setupAntiDetection()
        end
    })

    -- 获取玩家和角色引用
    local player = game.Players.LocalPlayer
    local character = player.Character or player.CharacterAdded:Wait()
    local humanoid = character:WaitForChild("Humanoid")
    local originalWalkSpeed = humanoid.WalkSpeed

    local connections = {}
    local infiniteJumpEnabled = false
    local floatEnabled = false
    local speedHackEnabled = false
    local espEnabled = false
    local flyEnabled = false

    -- 角色添加事件
    player.CharacterAdded:Connect(function(newChar)
        character = newChar
        humanoid = newChar:WaitForChild("Humanoid")
        originalWalkSpeed = newChar.WalkSpeed
        
        if floatEnabled then
            setupFloat()
        end
        
        if speedHackEnabled then
            setupSpeedHack()
        end
        
        if flyEnabled then
            setupFly()
        end
    end)

    -- 漂浮功能
    local floatBodyVelocity
    local function setupFloat()
        if floatBodyVelocity then
            floatBodyVelocity:Destroy()
            floatBodyVelocity = nil
        end
        
        if floatEnabled and character then
            local humanoidRootPart = character:FindFirstChild("HumanoidRootPart")
            if humanoidRootPart then
                floatBodyVelocity = Instance.new("BodyVelocity")
                floatBodyVelocity.Name = "FloatBodyVelocity"
                floatBodyVelocity.Velocity = Vector3.new(0, 25, 0)
                floatBodyVelocity.MaxForce = Vector3.new(0, math.huge, 0)
                floatBodyVelocity.Parent = humanoidRootPart
            end
        end
    end

    -- 漂浮
    StealBrainrotTab:Toggle({
        Title = "漂浮",
        Description = "漂浮",
        Callback = function(state)
            floatEnabled = state
            setupFloat()
            WindUI:Notify({Title = "漂浮", Content = state and "已启用" or "已禁用", Duration = 2})
        end
    })

    -- 速度加速功能
    local speedHackConnection
    local function setupSpeedHack()
        if speedHackConnection then
            speedHackConnection:Disconnect()
            speedHackConnection = nil
        end
        
        if speedHackEnabled then
            if humanoid then
                humanoid.WalkSpeed = originalWalkSpeed * 3
            end
            
            speedHackConnection = RunService.Heartbeat:Connect(function()
                if not speedHackEnabled then
                    if humanoid then
                        humanoid.WalkSpeed = originalWalkSpeed
                    end
                    speedHackConnection:Disconnect()
                    speedHackConnection = nil
                end
            end)
        elseif humanoid then
            humanoid.WalkSpeed = originalWalkSpeed
        end
    end

    -- 速度加速
    StealBrainrotTab:Toggle({
        Title = "速度加速",
        Description = "速度提升",
        Callback = function(state)
            speedHackEnabled = state
            setupSpeedHack()
            WindUI:Notify({Title = "速度", Content = state and "已启用" or "已禁用", Duration = 2})
        end
    })

    -- 飞行功能
    local flyBodyGyro, flyBodyVelocity
    local function setupFly()
        if flyBodyGyro then
            flyBodyGyro:Destroy()
            flyBodyGyro = nil
        end
        if flyBodyVelocity then
            flyBodyVelocity:Destroy()
            flyBodyVelocity = nil
        end
        
        if flyEnabled and character then
            local humanoidRootPart = character:FindFirstChild("HumanoidRootPart")
            if humanoidRootPart then
                flyBodyGyro = Instance.new("BodyGyro")
                flyBodyGyro.Name = "FlyBodyGyro"
                flyBodyGyro.P = 1000
                flyBodyGyro.D = 50
                flyBodyGyro.MaxTorque = Vector3.new(math.huge, math.huge, math.huge)
                flyBodyGyro.CFrame = humanoidRootPart.CFrame
                flyBodyGyro.Parent = humanoidRootPart
                
                flyBodyVelocity = Instance.new("BodyVelocity")
                flyBodyVelocity.Name = "FlyBodyVelocity"
                flyBodyVelocity.Velocity = Vector3.new(0, 0, 0)
                flyBodyVelocity.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
                flyBodyVelocity.Parent = humanoidRootPart
                
                -- 飞行控制
                local flyConnection
                flyConnection = RunService.Heartbeat:Connect(function()
                    if not flyEnabled or not character or not humanoidRootPart then
                        flyConnection:Disconnect()
                        return
                    end
                    
                    local camera = workspace.CurrentCamera
                    local moveDirection = Vector3.new(0, 0, 0)
                    
                    if UserInputService:IsKeyDown(Enum.KeyCode.W) then
                        moveDirection = moveDirection + camera.CFrame.LookVector
                    end
                    if UserInputService:IsKeyDown(Enum.KeyCode.S) then
                        moveDirection = moveDirection - camera.CFrame.LookVector
                    end
                    if UserInputService:IsKeyDown(Enum.KeyCode.A) then
                        moveDirection = moveDirection - camera.CFrame.RightVector
                    end
                    if UserInputService:IsKeyDown(Enum.KeyCode.D) then
                        moveDirection = moveDirection + camera.CFrame.RightVector
                    end
                    if UserInputService:IsKeyDown(Enum.KeyCode.Space) then
                        moveDirection = moveDirection + Vector3.new(0, 1, 0)
                    end
                    if UserInputService:IsKeyDown(Enum.KeyCode.LeftShift) then
                        moveDirection = moveDirection - Vector3.new(0, 1, 0)
                    end
                    
                    if moveDirection.Magnitude > 0 then
                        moveDirection = moveDirection.Unit * 50
                    end
                    
                    if flyBodyVelocity then
                        flyBodyVelocity.Velocity = moveDirection
                    end
                    if flyBodyGyro then
                        flyBodyGyro.CFrame = camera.CFrame
                    end
                end)
            end
        end
    end

    -- 飞行
    StealBrainrotTab:Toggle({
        Title = "飞行",
        Description = "飞行功能",
        Callback = function(state)
            flyEnabled = state
            setupFly()
            WindUI:Notify({Title = "飞行", Content = state and "已启用" or "已禁用", Duration = 2})
        end
    })

    -- ESP功能
    local espObjects = {}
    local function setupESP()
        -- 清理现有ESP
        for _, obj in pairs(espObjects) do
            if obj and obj.Parent then
                obj:Destroy()
            end
        end
        espObjects = {}
        
        if not espEnabled then 
            return 
        end
        
        -- 创建ESP
        for _, otherPlayer in ipairs(Players:GetPlayers()) do
            if otherPlayer ~= player then
                local otherCharacter = otherPlayer.Character
                if otherCharacter then
                    local humanoidRootPart = otherCharacter:FindFirstChild("HumanoidRootPart")
                    if humanoidRootPart then
                        -- 创建高亮框
                        local highlight = Instance.new("Highlight")
                        highlight.Name = "StealBrainrot_ESP_" .. otherPlayer.Name
                        highlight.Adornee = otherCharacter
                        highlight.FillColor = otherPlayer.Team == player.Team and Color3.fromRGB(0, 255, 0) or Color3.fromRGB(255, 0, 0)
                        highlight.FillTransparency = 0.5
                        highlight.OutlineColor = Color3.fromRGB(255, 255, 255)
                        highlight.OutlineTransparency = 0
                        highlight.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
                        highlight.Parent = otherCharacter
                        
                        -- 创建名字标签
                        local billboard = Instance.new("BillboardGui")
                        billboard.Name = "StealBrainrot_NameTag_" .. otherPlayer.Name
                        billboard.Adornee = humanoidRootPart
                        billboard.Size = UDim2.new(0, 200, 0, 50)
                        billboard.StudsOffset = Vector3.new(0, 3, 0)
                        billboard.AlwaysOnTop = true
                        billboard.Parent = humanoidRootPart
                        
                        local textLabel = Instance.new("TextLabel")
                        textLabel.Size = UDim2.new(1, 0, 1, 0)
                        textLabel.BackgroundTransparency = 1
                        textLabel.Text = otherPlayer.Name
                        textLabel.TextColor3 = Color3.new(1, 1, 1)
                        textLabel.TextStrokeColor3 = Color3.new(0, 0, 0)
                        textLabel.TextStrokeTransparency = 0
                        textLabel.Font = Enum.Font.SourceSansBold
                        textLabel.TextSize = 14
                        textLabel.Parent = billboard
                        
                        table.insert(espObjects, highlight)
                        table.insert(espObjects, billboard)
                    end
                end
            end
        end
    end

    -- ESP
    StealBrainrotTab:Toggle({
        Title = "ESP",
        Description = "显示其他玩家的位置",
        Callback = function(state)
            espEnabled = state
            setupESP()
            WindUI:Notify({Title = "ESP", Content = state and "已启用" or "已禁用", Duration = 2})
        end
    })

    -- 玩家加入事件处理ESP
    if not connections.playerAdded then
        connections.playerAdded = Players.PlayerAdded:Connect(function(newPlayer)
            if espEnabled then
                task.wait(1) -- 等待玩家加载
                setupESP()
            end
        end)
    end

    if not connections.playerRemoving then
        connections.playerRemoving = Players.PlayerRemoving:Connect(function(leavingPlayer)
            if espEnabled then
                -- 移除该玩家的ESP对象
                for i = #espObjects, 1, -1 do
                    local obj = espObjects[i]
                    if obj and (obj.Name:find("StealBrainrot_ESP_" .. leavingPlayer.Name) or obj.Name:find("StealBrainrot_NameTag_" .. leavingPlayer.Name)) then
                        obj:Destroy()
                        table.remove(espObjects, i)
                    end
                end
            end
        end)
    end

    -- 即时偷取功能
    local function instantSteal()
        WindUI:Notify({
            Title = "即时偷取",
            Content = "尝试偷取物品...",
            Duration = 2
        })
        
        local proximityPrompt = nil
        for _, obj in pairs(workspace:GetDescendants()) do
            if obj:IsA("ProximityPrompt") and (obj.Name == "Steal" or obj.Name == "Take" or obj.Name:lower():find("steal") or obj.Name:lower():find("take")) then
                proximityPrompt = obj
                break
            end
        end
        
        if proximityPrompt then
            fireproximityprompt(proximityPrompt)
            WindUI:Notify({
                Title = "即时偷取",
                Content = "成功触发偷取",
                Duration = 2
            })
        else
            WindUI:Notify({
                Title = "即时偷取",
                Content = "没有找到可偷取的物品",
                Duration = 2
            })
        end
    end

    -- 自动偷取功能
    local autoStealEnabled = false
    local autoStealConnection
    local function setupAutoSteal()
        if autoStealConnection then
            autoStealConnection:Disconnect()
            autoStealConnection = nil
        end
        
        if autoStealEnabled then
            autoStealConnection = RunService.Heartbeat:Connect(function()
                if not autoStealEnabled then return end
                
                for _, obj in pairs(workspace:GetDescendants()) do
                    if obj:IsA("ProximityPrompt") and (obj.Name == "Steal" or obj.Name == "Take" or obj.Name:lower():find("steal") or obj.Name:lower():find("take")) then
                        if character and character:FindFirstChild("HumanoidRootPart") then
                            local promptPosition = obj.Parent and obj.Parent:FindFirstChildWhichIsA("BasePart")
                            if promptPosition then
                                local distance = (character.HumanoidRootPart.Position - promptPosition.Position).Magnitude
                                if distance <= 10 then -- 10米范围内自动偷取
                                    fireproximityprompt(obj)
                                    break
                                end
                            end
                        end
                    end
                end
            end)
        end
    end

    -- 即时偷取
    StealBrainrotTab:Button({
        Title = "即时偷取",
        Description = "立即尝试偷取物品",
        Callback = function()
            instantSteal()
        end
    })

    -- 自动偷取
    StealBrainrotTab:Toggle({
        Title = "自动偷取",
        Description = "自动偷取附近的物品",
        Callback = function(state)
            autoStealEnabled = state
            setupAutoSteal()
            WindUI:Notify({Title = "自动偷取", Content = state and "已启用" or "已禁用", Duration = 2})
        end
    })

    -- 无敌模式
    local godModeEnabled = false
    local godModeConnection
    StealBrainrotTab:Toggle({
        Title = "无敌模式",
        Description = "开启后不会死亡",
        Callback = function(state)
            godModeEnabled = state
            
            if state then
                if character then
                    local humanoid = character:FindFirstChildOfClass("Humanoid")
                    if humanoid then
                        godModeConnection = humanoid.HealthChanged:Connect(function(newHealth)
                            if newHealth < humanoid.MaxHealth then
                                humanoid.Health = humanoid.MaxHealth
                            end
                        end)
                        humanoid.Health = humanoid.MaxHealth
                    end
                end
            else
                if godModeConnection then
                    godModeConnection:Disconnect()
                    godModeConnection = nil
                end
            end
            WindUI:Notify({Title = "无敌模式", Content = state and "已启用" or "已禁用", Duration = 2})
        end
    })

    -- 穿墙模式
    local noclipEnabled = false
    local noclipConnection
    StealBrainrotTab:Toggle({
        Title = "穿墙模式",
        Description = "开启后可以穿过墙壁",
        Callback = function(state)
            noclipEnabled = state
            
            if state then
                noclipConnection = RunService.Stepped:Connect(function()
                    if character then
                        for _, part in pairs(character:GetDescendants()) do
                            if part:IsA("BasePart") then
                                part.CanCollide = false
                            end
                        end
                    end
                end)
            else
                if noclipConnection then
                    noclipConnection:Disconnect()
                    noclipConnection = nil
                end
                if character then
                    for _, part in pairs(character:GetDescendants()) do
                        if part:IsA("BasePart") then
                            part.CanCollide = true
                        end
                    end
                end
            end
            WindUI:Notify({Title = "穿墙模式", Content = state and "已启用" or "已禁用", Duration = 2})
        end
    })

    -- 夜视模式
    local nightVisionEnabled = false
    local originalLightingSettings = {}
    StealBrainrotTab:Toggle({
        Title = "夜视模式",
        Description = "开启夜视效果",
        Callback = function(state)
            nightVisionEnabled = state
            
            if state then
                -- 保存原始设置
                originalLightingSettings.Ambient = Lighting.Ambient
                originalLightingSettings.Brightness = Lighting.Brightness
                originalLightingSettings.FogEnd = Lighting.FogEnd
                originalLightingSettings.ExposureCompensation = Lighting.ExposureCompensation
                
                -- 设置夜视效果
                Lighting.Ambient = Color3.fromRGB(255, 255, 255)
                Lighting.Brightness = 2
                Lighting.FogEnd = 100000
                Lighting.ExposureCompensation = 1
                
                -- 禁用后期效果
                for _, effect in pairs(Lighting:GetChildren()) do
                    if effect:IsA("BloomEffect") or effect:IsA("BlurEffect") or effect:IsA("ColorCorrectionEffect") then
                        effect.Enabled = false
                    end
                end
            else
                -- 恢复原始设置
                if originalLightingSettings.Ambient then
                    Lighting.Ambient = originalLightingSettings.Ambient
                end
                if originalLightingSettings.Brightness then
                    Lighting.Brightness = originalLightingSettings.Brightness
                end
                if originalLightingSettings.FogEnd then
                    Lighting.FogEnd = originalLightingSettings.FogEnd
                end
                if originalLightingSettings.ExposureCompensation then
                    Lighting.ExposureCompensation = originalLightingSettings.ExposureCompensation
                end
            end
            WindUI:Notify({Title = "夜视模式", Content = state and "已启用" or "已禁用", Duration = 2})
        end
    })

    -- 重置角色
    StealBrainrotTab:Button({
        Title = "重置角色",
        Description = "立即重置当前角色",
        Callback = function()
            if character and humanoid then
                humanoid.Health = 0
            end
            WindUI:Notify({Title = "重置角色", Content = "角色已重置", Duration = 2})
        end
    })

    -- 传送到玩家功能
    local function getPlayerNames()
        local names = {}
        for _, otherPlayer in ipairs(Players:GetPlayers()) do
            if otherPlayer ~= player then
                table.insert(names, otherPlayer.Name)
            end
        end
        return names
    end

    local stealPlayersDropdown = StealBrainrotTab:Dropdown({
        Title = "选择玩家",
        Values = getPlayerNames(),
    })

    StealBrainrotTab:Button({
        Title = "传送到玩家",
        Description = "传送到选中的玩家",
        Callback = function()
            local selectedPlayerName = stealPlayersDropdown.Value
            if not selectedPlayerName then
                WindUI:Notify({Title = "错误", Content = "未选择玩家", Duration = 3})
                return
            end
            local targetPlayer = Players:FindFirstChild(selectedPlayerName)
            if targetPlayer and targetPlayer.Character and targetPlayer.Character:FindFirstChild("HumanoidRootPart") then
                local character = player.Character or player.CharacterAdded:Wait()
                local humanoidRootPart = character:WaitForChild("HumanoidRootPart")
                humanoidRootPart.CFrame = targetPlayer.Character.HumanoidRootPart.CFrame
                WindUI:Notify({Title = "传送", Content = "已传送到 " .. selectedPlayerName, Duration = 2})
            end
        end
    })

    -- 清理函数
    local function cleanupStealBrainrot()
        -- 断开所有连接
        for name, connection in pairs(connections) do
            if connection then
                connection:Disconnect()
            end
        end
        
        -- 清理物理效果
        if floatBodyVelocity then
            floatBodyVelocity:Destroy()
        end
        if flyBodyGyro then
            flyBodyGyro:Destroy()
        end
        if flyBodyVelocity then
            flyBodyVelocity:Destroy()
        end
        if speedHackConnection then
            speedHackConnection:Disconnect()
        end
        if godModeConnection then
            godModeConnection:Disconnect()
        end
        if noclipConnection then
            noclipConnection:Disconnect()
        end
        if autoStealConnection then
            autoStealConnection:Disconnect()
        end
        
        -- 清理ESP
        for _, obj in pairs(espObjects) do
            if obj and obj.Parent then
                obj:Destroy()
            end
        end
        espObjects = {}
        
        -- 恢复速度
        if humanoid then
            humanoid.WalkSpeed = originalWalkSpeed
        end
        
        -- 恢复夜视设置
        if nightVisionEnabled and originalLightingSettings.Ambient then
            Lighting.Ambient = originalLightingSettings.Ambient
            Lighting.Brightness = originalLightingSettings.Brightness
            Lighting.FogEnd = originalLightingSettings.FogEnd
            if originalLightingSettings.ExposureCompensation then
                Lighting.ExposureCompensation = originalLightingSettings.ExposureCompensation
            end
        end
    end

    -- 注册清理
    table.insert(Window._cleanupFunctions, cleanupStealBrainrot)

    LoadedModules.StealBrainrot = true
    WindUI:Notify({Title = "偷走脑红", Content = "偷走脑红功能已加载", Duration = 3})
end

Tabs.ScriptCenter:Button({
    Title = "加载EX偷走脑红功能",
    Desc = "加载偷走脑红完整功能",
    Callback = function()
        LoadStealBrainrot()
    end
})

-- Make a Army模块
local function LoadMakeArmy()
    if LoadedModules.MakeArmy then 
        WindUI:Notify({Title = "Make a Army", Content = "Make a Army功能已加载过", Duration = 3})
        return 
    end
    
    local MakeArmyTab = Window:Tab({ Title = "Make a Army", Icon = "users" })
    
    MakeArmyTab:Paragraph({
        Title = "Make a Army",
        Desc = "创建军队功能模块",
        Image = "users",
        ImageSize = 65
    })

    -- 自动刷金币功能
    MakeArmyTab:Toggle({
        Title = "自动刷金币",
        Desc = "自动进行乞讨操作",
        Value = false,
        Callback = function(Value)
            local farmGoldRunning = Value
            if Value then
                spawn(function()
                    while farmGoldRunning do
                        pcall(function()
                            local DistanceWalked = ReplicatedStorage.Remotes.DistanceWalked
                            DistanceWalked:FireServer(150, 1e+104, 0)
                        end)
                        wait(0.1)
                    end
                end)
            end
        end
    })

    -- 创建军队按钮的函数
    local function createTroopButton(title, itemName)
        MakeArmyTab:Toggle({
            Title = title,
            Desc = "自动购买" .. title,
            Value = false,
            Callback = function(Value)
                local troopLoops = {}
                troopLoops[itemName] = Value
                if Value then
                    spawn(function()
                        while troopLoops[itemName] do
                            pcall(function()
                                local PurchaseItem = ReplicatedStorage.Remotes.PurchaseItem
                                PurchaseItem:FireServer(itemName, "Troops")
                            end)
                            wait(0.1)
                        end
                    end)
                end
            end
        })
    end

    -- 创建法术按钮的函数
    local function createSpellButton(title, itemName)
        MakeArmyTab:Toggle({
            Title = title,
            Desc = "自动购买" .. title,
            Value = false,
            Callback = function(Value)
                local spellLoops = {}
                spellLoops[itemName] = Value
                if Value then
                    spawn(function()
                        while spellLoops[itemName] do
                            pcall(function()
                                local PurchaseItem = ReplicatedStorage.Remotes.PurchaseItem
                                PurchaseItem:FireServer(itemName, "Spells")
                            end)
                            wait(0.1)
                        end
                    end)
                end
            end
        })
    end

    -- 创建军队按钮
    createTroopButton("剑士", "Swordsman")
    createTroopButton("弓箭手", "Archer")
    createTroopButton("新手指挥官", "Rookie Commander")
    createTroopButton("女巫", "Witch")
    createTroopButton("弩手", "Crossbow")
    createTroopButton("治疗师", "Healer")
    createTroopButton("法师", "Wizard")
    createTroopButton("长矛兵", "Spearman")
    createTroopButton("气球兵", "Balloon")

    -- 创建法术按钮
    createSpellButton("冰冻法术", "Freeze")
    createSpellButton("火球术", "Fireball")
    createSpellButton("治疗法术", "Heal")
    createSpellButton("狂暴法术", "Rage")
    createSpellButton("毒药法术", "Poison")
    createSpellButton("地震法术", "Earth")
    createSpellButton("闪电法术", "Lightning")
    createSpellButton("亚瑟之剑", "Arthurs Sword")

    LoadedModules.MakeArmy = true
    WindUI:Notify({Title = "Make a Army", Content = "Make a Army功能已加载", Duration = 3})
end

-- 成为乞丐模块
local function LoadBeggar()
    if LoadedModules.Beggar then 
        WindUI:Notify({Title = "成为乞丐", Content = "成为乞丐功能已加载过", Duration = 3})
        return 
    end
    
    local BeggarTab = Window:Tab({ Title = "成为乞丐", Icon = "dollar-sign" })
    
    BeggarTab:Paragraph({
        Title = "成为乞丐",
        Desc = "乞丐模拟器功能模块",
        Image = "dollar-sign",
        ImageSize = 65
    })

    -- 全局变量
    local AutoFastMoney = false
    local AutoBuyEmployees = false
    local AutoBuyUpgrades = false
    local MoneyAura = false

    BeggarTab:Toggle({
        Title = "自动快速刷钱",
        Desc = "自动进行乞讨操作",
        Value = false,
        Callback = function(Value)
            AutoFastMoney = Value
            if Value then
                local plrs = game:GetService("Players")
                local rs = game:GetService("ReplicatedStorage")
                local me = plrs.LocalPlayer
                local char = me.Character or me.CharacterAdded:Wait()
                local hrp = char:WaitForChild("HumanoidRootPart")
                local bases = workspace:WaitForChild("Bases")
                local ev = rs.Remotes:WaitForChild("MinigameEvent")
                local run = game:GetService("RunService")

                local function findBase()
                    for _,b in pairs(bases:GetChildren()) do
                        local o = b:FindFirstChild("Owner")
                        if o then
                            local v = o.Value
                            if v == me or tostring(v) == me.Name or tonumber(v) == me.UserId then
                                return b
                            end
                        end
                    end
                end

                local b = findBase()
                if b then
                    local beg = b:WaitForChild("BegPrompt")
                    local prompt = beg:WaitForChild("ProximityPrompt")
                    
                    hrp.CFrame = beg.CFrame + Vector3.new(0,3,0)
                    fireproximityprompt(prompt)
                    
                    while AutoFastMoney do
                        run.RenderStepped:Wait()
                        ev:FireServer(true)
                    end
                end
            end
        end
    })

    BeggarTab:Toggle({
        Title = "自动购买员工",
        Desc = "自动购买所有员工",
        Value = false,
        Callback = function(Value)
            AutoBuyEmployees = Value
            if Value then
                local Replicate = game:GetService("ReplicatedStorage")
                local BuyEmployee = Replicate.Remotes.BuyEmployee
                task.spawn(function()
                    while AutoBuyEmployees do 
                        for i = 1, 75 do 
                            if i ~= 13 and i ~= 14 then 
                                BuyEmployee:FireServer(i)
                                task.wait(0.3)
                            end 
                        end 
                    end 
                end)
            end
        end
    })

    BeggarTab:Toggle({
        Title = "自动升级",
        Desc = "自动升级各项属性",
        Value = false,
        Callback = function(Value)
            AutoBuyUpgrades = Value
            if Value then
                local Replicate = game:GetService("ReplicatedStorage")
                local Upgrade = Replicate.Remotes.Upgrade
                task.spawn(function()
                    while AutoBuyUpgrades do 
                        task.wait(0.1)
                        Upgrade:FireServer("Beg Power")
                        Upgrade:FireServer("Income")
                        Upgrade:FireServer("Box Tier")
                        Upgrade:FireServer("Alley Tier")
                    end 
                end)
            end
        end
    })

    BeggarTab:Toggle({
        Title = "金钱光环",
        Desc = "自动收集附近的金钱",
        Value = false,
        Callback = function(Value)
            MoneyAura = Value
            if Value then
                local Money = workspace:WaitForChild("Money")
                local HRP = LP.Character:WaitForChild("HumanoidRootPart")
                task.spawn(function()
                    while MoneyAura do
                        local OldCFrame = HRP.CFrame
                        for _,v in pairs(Money:GetDescendants()) do
                            if v:IsA("ProximityPrompt") and v.Parent:IsA("BasePart") then
                                HRP.CFrame = v.Parent.CFrame + Vector3.new(0,3,0)
                                fireproximityprompt(v,0,true)
                            end
                        end
                        HRP.CFrame = OldCFrame
                        task.wait(0.5)
                    end 
                end)
            end
        end
    })

    LoadedModules.Beggar = true
    WindUI:Notify({Title = "成为乞丐", Content = "成为乞丐功能已加载", Duration = 3})
end

-- 光剑模拟器模块
local function LoadSaberSimulator()
    if LoadedModules.SaberSimulator then 
        WindUI:Notify({Title = "光剑模拟器", Content = "光剑模拟器功能已加载过", Duration = 3})
        return 
    end
    
    local SaberSimulatorTab = Window:Tab({ Title = "光剑模拟器", Icon = "zap" })
    
    SaberSimulatorTab:Paragraph({
        Title = "光剑模拟器",
        Desc = "光剑模拟器功能模块",
        Image = "zap",
        ImageSize = 65
    })

    -- Variables for toggles
    local auto_best = false
    local auto_combine = false
    local auto_crown = false
    local auto_click = false
    local auto_sell = false
    local auto_boosts = false
    local auto_pet_aura = false
    local auto_class = false
    local auto_sabers = false
    local auto_auras = false
    local auto_dnas = false
    local auto_daily = false
    local autoHit = false
    local autoHatch = false
    local selectedBoss = "普通"
    local selectedEgg = ""

    SaberSimulatorTab:Toggle({
        Title = "自动装备宠物",
        Description = "防止被系统踢出",
        Default = false,
        Callback = function(state)
            auto_best = state
            if state then
                coroutine.wrap(function()
                    while auto_best do
                        ReplicatedStorage:WaitForChild("Events"):WaitForChild("UIAction"):FireServer("EquipBestPets")
                        task.wait(5)
                    end
                end)()
            end
        end
    })

    SaberSimulatorTab:Toggle({
        Title = "自动合成宠物",
        Description = "防止被系统踢出",
        Default = false,
        Callback = function(state)
            auto_combine = state
            if state then
                coroutine.wrap(function()
                    while auto_combine do
                        ReplicatedStorage:WaitForChild("Events"):WaitForChild("UIAction"):FireServer("CombineAllPets")
                        task.wait(5)
                    end
                end)()
            end
        end
    })

    SaberSimulatorTab:Toggle({
        Title = "自动收集皇冠",
        Description = "防止被系统踢出",
        Default = false,
        Callback = function(state)
            auto_crown = state
            if state then
                coroutine.wrap(function()
                    while auto_crown do
                        local collectables = Workspace:FindFirstChild("Gameplay"):FindFirstChild("Collectables")
                        if collectables and #collectables:GetChildren() > 0 then
                            local crowns = {}
                            for _, v in next, collectables:GetChildren() do
                                if v:IsA("MeshPart") then
                                    table.insert(crowns, v)
                                end
                            end
                            if #crowns > 0 then
                                ReplicatedStorage:WaitForChild("Events"):WaitForChild("CollectCurrencyPickup"):FireServer(crowns)
                            end
                        end
                        task.wait(0.2)
                    end
                end)()
            end
        end
    })

    LoadedModules.SaberSimulator = true
    WindUI:Notify({Title = "光剑模拟器", Content = "光剑模拟器功能已加载", Duration = 3})
end

-- 挖出后院模块
local function LoadDigBackyard()
    if LoadedModules.DigBackyard then 
        WindUI:Notify({Title = "挖出后院", Content = "挖出后院功能已加载过", Duration = 3})
        return 
    end
    
    local DigBackyardTab = Window:Tab({ Title = "挖出后院", Icon = "shovel" })
    
    DigBackyardTab:Paragraph({
        Title = "挖出后院",
        Desc = "挖出后院功能模块",
        Image = "shovel",
        ImageSize = 65
    })

    -- 配置
    local config = {
        AutoPickup = false,
        AutoSell = false,
        AutoEnergy = false,
        ShovelUpgrade = false,
        BackpackUpgrade = false,
        EnergyUpgrade = false,
        JetpackUpgrade = false,
        OresESP = false,
        RoomsESP = false,
        MobsESP = false,
        LootESP = false
    }

    -- 自动拾取战利品袋
    DigBackyardTab:Toggle({
        Title = "自动拾取战利品袋",
        Description = "自动拾取附近的战利品袋",
        Default = config.AutoPickup,
        Callback = function(Value)
            config.AutoPickup = Value
            if Value then
                task.spawn(function()
                    local rooms = Workspace:FindFirstChild("Rooms") or Workspace
                    local Character = LP.Character
                    local HumanoidRootPart = Character and Character:FindFirstChild("HumanoidRootPart")
                    
                    while config.AutoPickup do
                        local lastPos = HumanoidRootPart and HumanoidRootPart.CFrame
                        for _, loot in pairs(rooms:GetDescendants()) do
                            if not config.AutoPickup then break end
                            if loot:IsA("Model") and loot.Name == "LootBag" then
                                local handle = loot:FindFirstChild("Handle")
                                if handle and HumanoidRootPart then
                                    local prox = handle:FindFirstChild("Attachment"):FindFirstChild("ProximityPrompt")
                                    if prox then
                                        HumanoidRootPart.CFrame = handle.CFrame
                                        task.wait(0.25)
                                        fireproximityprompt(prox, prox.MaxActivationDistance)
                                        task.wait(0.75)
                                    end
                                end
                            end
                        end
                        if HumanoidRootPart and lastPos then
                            HumanoidRootPart.CFrame = lastPos
                        end
                        task.wait(1)
                    end
                end)
            end
        end
    })

    -- 自动出售矿石
    DigBackyardTab:Toggle({
        Title = "自动出售矿石",
        Description = "当矿石满时自动出售",
        Default = config.AutoSell,
        Callback = function(Value)
            config.AutoSell = Value
            if Value then
                spawn(function()
                    while config.AutoSell do wait()
                        pcall(function()
                            game:GetService("ReplicatedStorage").Framework.Features.MiningSystem.MineUtil.RemoteEvent:FireServer("SellOres")
                        end)
                    end
                end)
            end
        end
    })

    LoadedModules.DigBackyard = true
    WindUI:Notify({Title = "挖出后院", Content = "挖出后院功能已加载", Duration = 3})
end

-- 元素大亨模块
local function LoadElementTycoon()
    if LoadedModules.ElementTycoon then 
        WindUI:Notify({Title = "元素大亨", Content = "元素大亨功能已加载过", Duration = 3})
        return 
    end
    
    local ElementTycoonTab = Window:Tab({ Title = "元素大亨", Icon = "zap" })
    
    ElementTycoonTab:Paragraph({
        Title = "元素大亨",
        Desc = "元素大亨功能模块",
        Image = "zap",
        ImageSize = 65
    })

    local allSkills = {
        "Lava Katana", "Lava Ball", "Magam Fists", "Lava Dash", "Volcano Sentry", "Magma Spikes", "Nibiru",
        "Bone Scythe", "Blaster", "Bones Barrage", "Flying Bone", "Bone Surge", "Twin Blasters", "Judgement Blast",
        "Shadow Sword", "Unseen Hands", "Unseen Barrage", "Dark Duo", "Abyss", "Dark Hold", "Dark Arc",
        "Light Saber", "Light Ball", "Light Orbs", "Blinding Light", "Shooting Star", "Light Speed", "Light Beam",
        "Christmas Tree Sword", "Plantoid", "Spore Bombs", "Nature's Blessing", "Nuclear Spore", "Pine Burst", "Nature's Wrath",
        "Frost Staff", "Frost Fire Ball", "Ice Disk", "Snow Ball", "Ultracold Aura", "Ice Spikes",
        "Thunder Staff", "Bolt", "Barrage", "Discharge", "Flying Nimbus", "Lighting Strike", "Storm",
        "Tectonic Hamer", "Stone Throw", "Rocks Barrage", "Large Boulder", "Burrow", "Stone Henge", "Earth Spikes",
        "Fire Sword", "Fire Ball", "Fire Fly", "Fire Bomb", "Comet", "Combust", "Fire Shower",
        "Hyper Sword", "Phonton Blast", "Twin-Photon Blash", "Tesla Turret", "Orbital", "Tesseract", "Hyper Slash",
        "Gravity Katana", "Heavy Infliction", "Tectonic Barrage", "Gravity Orb", "Tectonic Burst", "Zero Gravity", "Gravity Globe",
        "Time Scepter", "Temporal Gate", "Warp Barrage", "Tempo Beam", "Time Trap", "Warp Bomb", "Grand Clock",
        "Crystal Cleaver", "Crystal Mine", "Energy Crash", "Energy Crown", "Crystal Eruption", "Energy Crystal", "Crystal Surge",
        "Venom Blade", "Poison Bullet", "Acid Rain", "Venom Stream", "Hardened Venom", "Poison Demon", "Bubbling Venom",
        "Devil Sword", "Evil Bullet", "Fangs Barrage", "Evil Flash", "Demon Orb", "Demon Lock", "Dark Tsunami",
        "Space Gun", "Blackhole Orb", "Moon Splitter", "Asteroid Belt", "Meteor Jam", "Cosmic Remote", "Space Saucer"
    }

    local selectedSkill = nil

    ElementTycoonTab:Dropdown({
        Title = "选择技能",
        Values = allSkills,
        Value = "--",
        Callback = function(value)
            selectedSkill = value
            WindUI:Notify({
                Title = "技能选择",
                Content = "已选择: "..value,
                Duration = 2
            })
        end
    })

    ElementTycoonTab:Toggle({
        Title = "获取技能",
        Desc = "获取选择的技能",
        Value = false,
        Callback = function(value)
            if value and selectedSkill then
                if game.PlaceId == 10253248401 then
                    local args = {
                        [1] = "equip_mystery_spell",
                        [2] = selectedSkill
                    }
                    game:GetService("ReplicatedStorage").RemoteEvent:FireServer(unpack(args))
                    WindUI:Notify({
                        Title = "技能获取",
                        Content = "已获取: "..selectedSkill,
                        Duration = 3
                    })
                else
                    WindUI:Notify({
                        Title = "错误",
                        Content = "不在正确的游戏中",
                        Duration = 3
                    })
                end
            end
        end
    })

    LoadedModules.ElementTycoon = true
    WindUI:Notify({Title = "元素大亨", Content = "元素大亨功能已加载", Duration = 3})
end

-- 堡垒之战模块
local function LoadFortressBattle()
    if LoadedModules.FortressBattle then 
        WindUI:Notify({Title = "堡垒之战", Content = "堡垒之战功能已加载过", Duration = 3})
        return 
    end
    
    local FortressBattleTab = Window:Tab({ Title = "堡垒之战", Icon = "shield" })
    
    FortressBattleTab:Paragraph({
        Title = "堡垒之战",
        Desc = "堡垒之战功能模块",
        Image = "shield",
        ImageSize = 65
    })

    local autoBuildActive = false
    local autoWinActive = false

    -- 自动构建功能
    FortressBattleTab:Toggle({
        Title = "自动构建保垒",
        Description = "防止被系统踢出",
        Default = false,
        Callback = function(state)
            autoBuildActive = state
            if state then
                WindUI:Notify({
                    Title = "自动构建已启用",
                    Content = "开始自动构建堡垒",
                    Duration = 3
                })
            else
                WindUI:Notify({
                    Title = "自动构建已禁用",
                    Content = "停止自动构建",
                    Duration = 3
                })
            end
        end
    })

    -- 自动胜利功能
    FortressBattleTab:Toggle({
        Title = "自动获胜堡垒",
        Description = "防止被系统踢出",
        Default = false,
        Callback = function(state)
            autoWinActive = state
            if state then
                WindUI:Notify({
                    Title = "自动胜利已启用",
                    Content = "开始自动胜利",
                    Duration = 3
                })
            else
                WindUI:Notify({
                    Title = "自动胜利已禁用",
                    Content = "停止自动胜利",
                    Duration = 3
                })
            end
        end
    })

    FortressBattleTab:Toggle({
        Title = "自动购买火箭筒",
        Description = "防止被系统踢出",
        Default = false,
        Callback = function(state)
            if state then
                coroutine.wrap(function()
                    while wait(0.1) and state do
                        local rpgTypes = {"Rusty", "Pink", "RPG-7", "Golden", "Missle", "Heat", "Smily", "Diamond"}
                        for _, rpgType in ipairs(rpgTypes) do
                            game:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("PurchaseRPG"):InvokeServer(rpgType)
                        end
                    end
                end)()
            end
        end
    })

    LoadedModules.FortressBattle = true
    WindUI:Notify({Title = "堡垒之战", Content = "堡垒之战功能已加载", Duration = 3})
end

-- 添加所有模块加载按钮到脚本中心
Tabs.ScriptCenter:Button({
    Title = "加载EX DOORS功能",
    Desc = "加载EXDOORS完整功能",
    Callback = function()
        local repo = "https://raw.githubusercontent.com/deividcomsono/Obsidian/main/"
local Library = loadstring(game:HttpGet(repo .. "Library.lua"))()
local Options = Library.Options
local Toggles = Library.Toggles
Library.ForceCheckbox = false
Library.ShowToggleFrameInKeybinds = true
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local GameData = ReplicatedStorage:WaitForChild("GameData")
local currentFloor = GameData:WaitForChild("Floor").Value
local Window = Library:CreateWindow({
    Title = "Old Winter DOORS",
    Footer = "XiaoXu |  Old Winter  | Floor: " .. currentFloor,
    Icon = "rbxassetid://132702574859512", 
    NotifySide = "Right",
    ShowCustomCursor = true,
})

local Tabs = {
    Home = Window:AddTab("主页", "house"),
    Player = Window:AddTab("玩家", "user"),
    Visuals = Window:AddTab("视觉", "eye"),
    Entities = Window:AddTab("功能", "shield"),
    Misc = Window:AddTab("其他", "box"),
    UISettings = Window:AddTab("UI设置", "user-round-cog"),
}

local HomeGroup = Tabs.Home:AddLeftGroupbox("欢迎")

local avatarImage = Instance.new("ImageLabel")
avatarImage.Name = "AvatarThumbnail"
avatarImage.Size = UDim2.new(0, 220, 0, 220)
avatarImage.Position = UDim2.new(0.5, -90, 0, 10)
avatarImage.Image = "rbxassetid://0"
avatarImage.BackgroundTransparency = 1
avatarImage.BorderSizePixel = 0
avatarImage.ScaleType = Enum.ScaleType.Fit

if HomeGroup.Container then
    avatarImage.Parent = HomeGroup.Container
elseif HomeGroup.Frame then
    avatarImage.Parent = HomeGroup.Frame
else
    avatarImage.Parent = HomeGroup
end

spawn(function()
    local Players = game:GetService("Players")
    local player = Players.LocalPlayer
    
    if not player then
        repeat 
            task.wait(0.1) 
            player = Players.LocalPlayer
        until player
    end
    
    task.wait(1)
    
    local success, thumbnail = pcall(function()
        return Players:GetUserThumbnailAsync(
            player.UserId, 
            Enum.ThumbnailType.HeadShot,
            Enum.ThumbnailSize.Size180x180
        )
    end)
    
    if success and thumbnail then
        avatarImage.Image = thumbnail
    else
        local alternatives = {
            Enum.ThumbnailType.AvatarThumbnail,
            Enum.ThumbnailType.AvatarBust,
            Enum.ThumbnailType.Avatar
        }
        
        for i, thumbnailType in ipairs(alternatives) do
            local altSuccess, altThumbnail = pcall(function()
                return Players:GetUserThumbnailAsync(
                    player.UserId, 
                    thumbnailType,
                    Enum.ThumbnailSize.Size180x180
                )
            end)
            
            if altSuccess and altThumbnail then
                avatarImage.Image = altThumbnail
                break
            end
        end
    end
end)

HomeGroup:AddButton("加入QQ群", function()
    setclipboard("https://qm.qq.com/q/hLPf9PjE6Q")
    Library:Notify("链接已复制")
end)

local IntroductionGroup = Tabs.Home:AddRightGroupbox("介绍")
IntroductionGroup:AddLabel("欢迎")
IntroductionGroup:AddLabel("EX dev doors")

local ChangelogsGroup = Tabs.Home:AddRightGroupbox("公告")
ChangelogsGroup:AddLabel('<font color="rgb(0,255,0)"> Old Winter</font>')

-- Global Variables
local LocalPlayer = game.Players.LocalPlayer
local Rooms = workspace.CurrentRooms
local Unloaded = false
local ClonedCollision
local OldAccel = LocalPlayer.Character.HumanoidRootPart.CustomPhysicalProperties

-- 性能优化的ESP表结构
local EspTable = {
    Interactables = {
        GoldPiles = {},
        DoorKeys = {},
        GeneratorFuses = {},
        Generators = {},
        GateLevers = {},
        BackroomsLevers = {},
        LibraryBooks = {},
        BreakerPoles = {},
        Anchors = {},
        MiscPickups = {},
        Closets = {}
    },
    Entities = {},
    Players = {}
}

local MiscPickups = {
    ["Glowsticks"] = "荧光棒",
    ["StarJug"] = "星光桶",
    ["Lockpick"] = "开锁器",
    ["Bandage"] = "绷带",
    ["StarVial"] = "一小瓶星光",
    ["SkeletonKey"] = "Skeleton Key",
    ["Crucifix"] = "十字架",
    ["CrucifixWall"] = "十字架",
    ["Flashlight"] = "手电筒",
    ["Candle"] = "蜡烛",
    ["Straplight"] = "肩灯",
    ["Vitamins"] = "维他命",
    ["Lighter"] = "打火机",
    ["Shears"] = "剪刀",
    ["BatteryPack"] = "电池包",
    ["BandagePack"] = "绷带包",
    ["LaserPointer"] = "激光指示器",
    ["Bulklight"] = "Bulklight",
    ["Battery"] = "电池",
    ["Candy"] = "糖果",
    ["OutdoorsKey"] = "key"
}

-- Anti Connections table to manage disconnects
local AntiConnections = {}

-- Lighting originals for fullbright
local oldBrightness = game.Lighting.Brightness
local oldClockTime = game.Lighting.ClockTime
local oldFogEnd = game.Lighting.FogEnd
local oldGlobalShadows = game.Lighting.GlobalShadows
local oldAmbient = game.Lighting.Ambient

-- 性能优化的门ESP系统
_G.EspDoor = false
_G.EspHighlight = true
_G.EspGui = true
_G.EspKey = false  -- 统一的任务物品ESP开关
_G.KeyAdd = {}     -- 存储任务物品的表

local Players = game:GetService("Players")
local Workspace = game:GetService("Workspace")
local RunService = game:GetService("RunService")
local player = Players.LocalPlayer
local hrp = nil

local doorESPs = {}
local currentRoom, nextRoom = nil, nil
local DoorColor = Color3.fromRGB(150, 200, 255)

-- 性能监控变量
local PerformanceMonitor = {
    LastFPS = 60,
    ESPCount = 0,
    LastCleanup = tick(),
    LastScan = tick(),
    ScanCooldown = 0.5
}

local doorESPs = {}
local currentRoom = 0
local nextRoom = 0
local hrp = nil
local player = game.Players.LocalPlayer
local RunService = game:GetService("RunService")
local Workspace = game:GetService("Workspace")

-- 淡蓝色定义
local DoorColor = Color3.fromRGB(173, 216, 230)

local function Distance(position)
    local player = game.Players.LocalPlayer
    if player and player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
        return (player.Character.HumanoidRootPart.Position - position).Magnitude
    end
    return 0
end

local function findDoorPart(model)
    -- 更精确的门部件查找
    if model:FindFirstChild("Door") and model.Door:FindFirstChild("Door") then
        return model.Door.Door
    end
    for _, p in ipairs(model:GetDescendants()) do
        if p:IsA("BasePart") and (p.Name:lower():find("door") or p.Name:lower():find("doormain")) then
            return p
        end
    end
    return model.PrimaryPart or model:FindFirstChildWhichIsA("BasePart")
end

local function getDoorNumber(door)
    -- 从门牌号获取房间号 - 修复版本
    if door:FindFirstChild("Door") then
        local doorObj = door.Door
        if doorObj:FindFirstChild("Sign") then
            local sign = doorObj.Sign
            if sign:FindFirstChild("Stinker") and sign.Stinker.Text then
                local n = sign.Stinker.Text:match("%d+")
                if n then return tonumber(n) end
            elseif sign:FindFirstChild("SignText") and sign.SignText.Text then
                local n = sign.SignText.Text:match("%d+")
                if n then return tonumber(n) end
            end
        end
    end
    -- 如果从门牌号无法获取，尝试从房间名称获取
    local roomNum = door.Name:match("%d+")
    return roomNum and tonumber(roomNum)
end

local function getDoorSignText(door)
    -- 获取门牌号文本
    if door:FindFirstChild("Door") then
        local doorObj = door.Door
        if doorObj:FindFirstChild("Sign") then
            local sign = doorObj.Sign
            if sign:FindFirstChild("Stinker") and sign.Stinker.Text then
                return sign.Stinker.Text
            elseif sign:FindFirstChild("SignText") and sign.SignText.Text then
                return sign.SignText.Text
            end
        end
    end
    return ""
end

local function createDoorESP(door)
    if doorESPs[door] then return end
    
    local num = getDoorNumber(door)
    if not num then return end
    
    local part = findDoorPart(door)
    if not part then return end
    
    local espData = {}
    
    if _G.EspHighlight then
        local hl = Instance.new("Highlight")
        hl.FillColor = DoorColor
        hl.OutlineColor = DoorColor
        hl.FillTransparency = 0.5
        hl.OutlineTransparency = 0
        hl.Adornee = part
        hl.Parent = door
        hl.Name = "Esp_Highlight"
        espData.highlight = hl
    end
    
    if _G.EspGui then
        local bill = Instance.new("BillboardGui")
        bill.Adornee = part
        bill.Name = "Esp_Gui"
        bill.Size = UDim2.new(0, 200, 0, 120)  -- 增加宽度以容纳更多文本
        bill.AlwaysOnTop = true
        bill.ExtentsOffset = Vector3.new(0, 3, 0)  -- 向上偏移避免遮挡
        bill.Parent = door
        
        local txt = Instance.new("TextLabel")
        txt.BackgroundTransparency = 1
        txt.Font = Enum.Font.Code
        txt.Size = UDim2.new(1, 0, 1, 0)
        txt.TextSize = _G.EspGuiTextSize or 15
        txt.TextColor3 = DoorColor
        txt.TextStrokeTransparency = 0.5
        txt.Text = ""
        txt.TextWrapped = true  -- 文本自动换行
        txt.TextXAlignment = Enum.TextXAlignment.Center
        txt.TextYAlignment = Enum.TextYAlignment.Center
        txt.Parent = bill
        
        local UIStroke = Instance.new("UIStroke")
        UIStroke.Color = Color3.new(0, 0, 0)
        UIStroke.Thickness = 1.5
        UIStroke.Parent = txt
        
        espData.gui = txt
        espData.billboard = bill
    end
    
    -- 修改：使用ScreenGui显示门牌号
    if _G.EspDoorNumber then
        local screenGui = Instance.new("ScreenGui")
        screenGui.Name = "Esp_DoorNumber"
        screenGui.Parent = game.CoreGui  -- 或者 game.Players.LocalPlayer.PlayerGui
        
        local frame = Instance.new("Frame")
        frame.Size = UDim2.new(0, 150, 0, 40)
        frame.Position = UDim2.new(0.5, -75, 0.1, 0)  -- 屏幕顶部居中
        frame.BackgroundColor3 = Color3.new(0, 0, 0)
        frame.BackgroundTransparency = 0.3
        frame.BorderSizePixel = 0
        frame.Parent = screenGui
        
        local corner = Instance.new("UICorner")
        corner.CornerRadius = UDim.new(0, 8)
        corner.Parent = frame
        
        local doorNumberText = Instance.new("TextLabel")
        doorNumberText.Size = UDim2.new(1, 0, 1, 0)
        doorNumberText.BackgroundTransparency = 1
        doorNumberText.Font = Enum.Font.GothamBold
        doorNumberText.TextSize = 18
        doorNumberText.TextColor3 = Color3.fromRGB(0, 255, 0)  -- 绿色文字
        doorNumberText.TextStrokeTransparency = 0.3
        doorNumberText.Text = "门牌: " .. getDoorSignText(door)
        doorNumberText.TextXAlignment = Enum.TextXAlignment.Center
        doorNumberText.TextYAlignment = Enum.TextYAlignment.Center
        doorNumberText.Parent = frame
        
        local numberStroke = Instance.new("UIStroke")
        numberStroke.Color = Color3.new(0, 0, 0)
        numberStroke.Thickness = 1.2
        numberStroke.Parent = doorNumberText
        
        espData.doorNumberGui = screenGui
        espData.doorNumberFrame = frame
        espData.doorNumberText = doorNumberText
    end
    
    doorESPs[door] = espData
    espData.roomNumber = num
end

local function clearAllDoorESPs()
    for door, espData in pairs(doorESPs) do
        if espData.highlight then
            espData.highlight:Destroy()
        end
        if espData.billboard then
            espData.billboard:Destroy()
        end
        if espData.doorNumberGui then
            espData.doorNumberGui:Destroy()
        end
    end
    doorESPs = {}
end

local function clearOldESPs(roomNum)
    for door, espData in pairs(doorESPs) do
        if espData.roomNumber and espData.roomNumber < roomNum - 1 then
            if espData.highlight then
                espData.highlight:Destroy()
            end
            if espData.billboard then
                espData.billboard:Destroy()
            end
            if espData.doorNumberGui then
                espData.doorNumberGui:Destroy()
            end
            doorESPs[door] = nil
        end
    end
end

local function updateDoorSet()
    if not hrp then return end
    
    local nearest, nearestDist = nil, math.huge
    local currentRooms = Workspace:FindFirstChild("CurrentRooms")
    
    if not currentRooms then return end
    
    for _, room in pairs(currentRooms:GetChildren()) do
        if room:IsA("Model") and room:FindFirstChild("Door") and room.Door:FindFirstChild("Door") then
            local part = findDoorPart(room)
            local num = getDoorNumber(room)
            if part and num then
                local dist = (part.Position - hrp.Position).Magnitude
                if dist < nearestDist then
                    nearest, nearestDist = room, dist
                end
            end
        end
    end
    
    if not nearest then return end
    
    local num = getDoorNumber(nearest)
    if num and num ~= currentRoom then
        currentRoom = num
        nextRoom = num + 1
        clearOldESPs(currentRoom)
        
        -- 更新ScreenGui显示当前门牌号
        for _, espData in pairs(doorESPs) do
            if espData.doorNumberText and espData.roomNumber == currentRoom then
                espData.doorNumberText.Text = "当前门牌: " .. getDoorSignText(nearest)
            end
        end
    end
end

-- 性能优化的门ESP主循环
local lastDoorUpdate = 0
RunService.RenderStepped:Connect(function()
    if not _G.EspDoor then
        if next(doorESPs) ~= nil then
            clearAllDoorESPs()
        end
        return
    end
    
    if not player.Character or not player.Character:FindFirstChild("HumanoidRootPart") then 
        hrp = nil
        return 
    end
    
    hrp = player.Character.HumanoidRootPart
    
    local currentTime = tick()
    if currentTime - lastDoorUpdate < 0.3 then return end
    lastDoorUpdate = currentTime
    
    updateDoorSet()
    
    local currentRooms = Workspace:FindFirstChild("CurrentRooms")
    if not currentRooms then return end
    
    -- 只在CurrentRooms中处理门ESP
    for _, room in pairs(currentRooms:GetChildren()) do
        if room:IsA("Model") and room:FindFirstChild("Door") and room.Door:FindFirstChild("Door") then
            local num = getDoorNumber(room)
            if num and (num == currentRoom or num == nextRoom) then
                createDoorESP(room)
                local esp = doorESPs[room]
                local part = findDoorPart(room)
                if esp and part then
                    local dist = (part.Position - hrp.Position).Magnitude
                    
                    -- 构建门文本信息
                    local doorText = ""
                    if _G.EspName then
                        local signText = getDoorSignText(room)
                        doorText = "门 " .. signText:gsub("^0+", "") .. (room.Door:FindFirstChild("Lock") and " (锁住)" or "")
                    end
                    
                    local distanceText = ""
                    if _G.EspDistance then
                        distanceText = "\n距离: " .. string.format("%.0f", dist) .. "m"
                    end
                    
                    local roomInfoText = ""
                    if _G.EspRoomInfo then
                        roomInfoText = "\n房间: " .. num
                    end
                    
                    -- 更新主GUI文本
                    if esp.gui then
                        esp.gui.Text = doorText .. distanceText .. roomInfoText
                        esp.gui.TextSize = _G.EspGuiTextSize or 15
                        esp.gui.TextColor3 = DoorColor
                    end
                    
                    -- 更新门牌号显示
                    if esp.doorNumberText then
                        esp.doorNumberText.Text = "门牌: " .. getDoorSignText(room)
                        esp.doorNumberText.TextColor3 = Color3.fromRGB(0, 255, 0)  -- 绿色文字
                    end
                    
                    -- 动态更新门牌号显示状态
                    if _G.EspDoorNumber and not esp.doorNumberGui then
                        -- 创建门牌号显示
                        local screenGui = Instance.new("ScreenGui")
                        screenGui.Name = "Esp_DoorNumber"
                        screenGui.Parent = game.CoreGui
                        
                        local frame = Instance.new("Frame")
                        frame.Size = UDim2.new(0, 150, 0, 40)
                        frame.Position = UDim2.new(0.5, -75, 0.1, 0)
                        frame.BackgroundColor3 = Color3.new(0, 0, 0)
                        frame.BackgroundTransparency = 0.3
                        frame.BorderSizePixel = 0
                        frame.Parent = screenGui
                        
                        local corner = Instance.new("UICorner")
                        corner.CornerRadius = UDim.new(0, 8)
                        corner.Parent = frame
                        
                        local doorNumberText = Instance.new("TextLabel")
                        doorNumberText.Size = UDim2.new(1, 0, 1, 0)
                        doorNumberText.BackgroundTransparency = 1
                        doorNumberText.Font = Enum.Font.GothamBold
                        doorNumberText.TextSize = 18
                        doorNumberText.TextColor3 = Color3.fromRGB(0, 255, 0)  -- 绿色文字
                        doorNumberText.TextStrokeTransparency = 0.3
                        doorNumberText.Text = "门牌: " .. getDoorSignText(room)
                        doorNumberText.TextXAlignment = Enum.TextXAlignment.Center
                        doorNumberText.TextYAlignment = Enum.TextYAlignment.Center
                        doorNumberText.Parent = frame
                        
                        local numberStroke = Instance.new("UIStroke")
                        numberStroke.Color = Color3.new(0, 0, 0)
                        numberStroke.Thickness = 1.2
                        numberStroke.Parent = doorNumberText
                        
                        esp.doorNumberGui = screenGui
                        esp.doorNumberFrame = frame
                        esp.doorNumberText = doorNumberText
                    elseif not _G.EspDoorNumber and esp.doorNumberGui then
                        -- 销毁门牌号显示
                        esp.doorNumberGui:Destroy()
                        esp.doorNumberGui = nil
                        esp.doorNumberFrame = nil
                        esp.doorNumberText = nil
                    end
                end
            else
                -- 清理不在当前房间或下一个房间的门ESP
                local esp = doorESPs[room]
                if esp then
                    if esp.highlight then
                        esp.highlight:Destroy()
                    end
                    if esp.billboard then
                        esp.billboard:Destroy()
                    end
                    if esp.doorNumberGui then
                        esp.doorNumberGui:Destroy()
                    end
                    doorESPs[room] = nil
                end
            end
        end
    end
end)

-- 当EspDoor关闭时的清理
if _G.EspDoor == false then
    clearAllDoorESPs()
    -- 同时清理参考脚本方式的ESP对象
    local currentRooms = Workspace:FindFirstChild("CurrentRooms")
    if currentRooms then
        for _, room in pairs(currentRooms:GetChildren()) do
            if room:IsA("Model") then
                for _, child in pairs(room:GetChildren()) do
                    if child.Name:find("Esp_") then
                        child:Destroy()
                    end
                end
            end
        end
    end
end

-- 添加统一的任务物品ESP系统
local KeySpawn, KeyRemove = nil, nil

local function Keys(v)
    if ((v.Name:find("Key") or v.Name:find("FuseObtain")) and v:FindFirstChild("Hitbox")) or (v.Name == "LeverForGate" and v.PrimaryPart) then
        -- 更新高亮颜色为绿色
        if v:FindFirstChild("Esp_Highlight") then
            v:FindFirstChild("Esp_Highlight").FillColor = Color3.fromRGB(0, 255, 0)  -- 绿色
            v:FindFirstChild("Esp_Highlight").OutlineColor = Color3.fromRGB(0, 255, 0)  -- 绿色
        end
        
        if _G.EspHighlight == true and v:FindFirstChild("Esp_Highlight") == nil then
            local Highlight = Instance.new("Highlight")
            Highlight.Name = "Esp_Highlight"
            Highlight.FillColor = Color3.fromRGB(0, 255, 0)  -- 绿色
            Highlight.OutlineColor = Color3.fromRGB(0, 255, 0)  -- 绿色
            Highlight.FillTransparency = 0.5
            Highlight.OutlineTransparency = 0
            Highlight.Adornee = v
            Highlight.Parent = v
        elseif _G.EspHighlight == false and v:FindFirstChild("Esp_Highlight") then
            v:FindFirstChild("Esp_Highlight"):Destroy()
        end
        
        -- 更新GUI显示
        if v:FindFirstChild("Esp_Gui") and v["Esp_Gui"]:FindFirstChild("TextLabel") then
            v["Esp_Gui"]:FindFirstChild("TextLabel").Text = 
                (_G.EspName == true and ((v.Name == "LeverForGate" and "拉杆") or (v.Name:find("Key") and "钥匙") or (v.Name:find("FuseObtain") and "保险丝")) or "")..
                (_G.EspDistance == true and "\n距离: ("..string.format("%.0f", Distance((v.Name == "LeverForGate" and v.PrimaryPart.Position) or ((v.Name:find("Key") or v.Name:find("FuseObtain")) and v.Hitbox.Position))).."m)" or "")
            v["Esp_Gui"]:FindFirstChild("TextLabel").TextSize = _G.EspGuiTextSize or 15
            v["Esp_Gui"]:FindFirstChild("TextLabel").TextColor3 = Color3.fromRGB(0, 255, 0)  -- 绿色文字
        end
        
        if _G.EspGui == true and v:FindFirstChild("Esp_Gui") == nil then
            local GuiEsp = Instance.new("BillboardGui", v)
            GuiEsp.Adornee = v
            GuiEsp.Name = "Esp_Gui"
            GuiEsp.Size = UDim2.new(0, 100, 0, 150)
            GuiEsp.AlwaysOnTop = true
            local GuiEspText = Instance.new("TextLabel", GuiEsp)
            GuiEspText.BackgroundTransparency = 1
            GuiEspText.Font = Enum.Font.Code
            GuiEspText.Size = UDim2.new(0, 100, 0, 100)
            GuiEspText.TextSize = 15
            GuiEspText.TextColor3 = Color3.fromRGB(0, 255, 0)  -- 绿色文字
            GuiEspText.TextStrokeTransparency = 0.5
            GuiEspText.Text = ""
            local UIStroke = Instance.new("UIStroke")
            UIStroke.Color = Color3.new(0, 0, 0)
            UIStroke.Thickness = 1.5
            UIStroke.Parent = GuiEspText
        elseif _G.EspGui == false and v:FindFirstChild("Esp_Gui") then
            v:FindFirstChild("Esp_Gui"):Destroy()
        end
    end
end

local function CheckKey(v)
    if not table.find(_G.KeyAdd, v) and ((v.Name:find("Key") or v.Name:find("FuseObtain")) and v:FindFirstChild("Hitbox")) or (v.Name == "LeverForGate" and v.PrimaryPart) then
        table.insert(_G.KeyAdd, v)
    end
end

-- 任务物品ESP主循环
task.spawn(function()
    while task.wait() do
        if _G.EspKey then
            for i, v in pairs(_G.KeyAdd) do
                if v:IsA("Model") then
                    Keys(v)
                end
            end
        else
            -- 清理所有任务物品ESP
            for _, v in pairs(workspace:GetDescendants()) do 
                if v.Name:find("Key") or v.Name == "LeverForGate" or v.Name:find("FuseObtain") then
                    for i, z in pairs(v:GetChildren()) do
                        if z.Name:find("Esp_") then
                            z:Destroy()
                        end
                    end
                end
            end
            -- 清空任务物品表
            _G.KeyAdd = {}
            
            -- 断开连接
            if KeySpawn then
                KeySpawn:Disconnect()
                KeySpawn = nil
            end
            if KeyRemove then
                KeyRemove:Disconnect()
                KeyRemove = nil
            end
            break
        end
    end
end)

-- 初始化任务物品ESP
if _G.EspKey then
    for _, v in ipairs(workspace:GetDescendants()) do
        CheckKey(v)
    end
    
    KeySpawn = workspace.DescendantAdded:Connect(function(v)
        CheckKey(v)
    end)
    
    KeyRemove = workspace.DescendantRemoving:Connect(function(v)
        for i = #_G.KeyAdd, 1, -1 do
            if _G.KeyAdd[i] == v then
                table.remove(_G.KeyAdd, i)
                break
            end
        end
    end)
end

-- 优化的ESP函数
local function Esp(Parent, TextAdornee, Text, Color, OutlineColor)
    if not Parent or not TextAdornee or Parent:FindFirstChild("_LOLHAXHL") then return end
    
    local BillboardGui = Instance.new("BillboardGui", Parent)
    local TextLabel = Instance.new("TextLabel", BillboardGui)
    local Highlight = Instance.new("Highlight", Parent)
    
    BillboardGui.Adornee = TextAdornee
    BillboardGui.AlwaysOnTop = true
    BillboardGui.Name = "_LOLHAXBG"
    BillboardGui.Size = UDim2.fromScale(1, 1)
    BillboardGui.Enabled = true
    
    Highlight.Name = "_LOLHAXHL"
    TextLabel.Size = UDim2.fromScale(1, 1)
    TextLabel.TextStrokeTransparency = 0
    TextLabel.Font = Enum.Font[Options.ESPFont.Value] or Enum.Font.SourceSans
    TextLabel.TextSize = Options.ESPFontSize.Value or 20
    TextLabel.TextColor3 = Color
    TextLabel.BackgroundTransparency = 1
    
    Highlight.Adornee = Parent
    Highlight.FillColor = Color
    Highlight.OutlineColor = OutlineColor or Color
    TextLabel.TextTransparency = 1
    Highlight.FillTransparency = 1
    Highlight.OutlineTransparency = 1
    TextLabel:SetAttribute("Text", Text)
    
    -- 降低距离更新频率
    task.spawn(function()
        while Parent and Parent.Parent and not Unloaded do
            local Distance = (workspace.CurrentCamera.CFrame.Position - Parent:GetPivot().Position).Magnitude
            TextLabel.Text = Text .. "\n[ " .. string.format(Distance <= 9.9 and "%.1f" or "%.0f", Distance) .. " ]"
            task.wait(0.8) -- 从0.5秒增加到0.8秒
        end
    end)
    
    game:GetService("TweenService"):Create(Highlight, TweenInfo.new(Options.ESPFadeTime.Value or 1), {FillTransparency = Options.ESPFillTransparency.Value or 0.7, OutlineTransparency = Options.ESPOutlineTransparency.Value or 0.2}):Play()
    game:GetService("TweenService"):Create(TextLabel, TweenInfo.new(Options.ESPFadeTime.Value or 1), {TextTransparency = 0}):Play()
    
    Parent.Destroying:Connect(function()
        RemoveEspSmooth(Parent)
    end)
    
    return Highlight, TextLabel
end

local function RemoveEspSmooth(Parent)
    if Parent:FindFirstChild("_LOLHAXHL") and Parent:FindFirstChild("_LOLHAXBG") then
        game:GetService("TweenService"):Create(Parent._LOLHAXHL, TweenInfo.new(Options.ESPFadeTime.Value or 1), {FillTransparency = 1, OutlineTransparency = 1}):Play()
        game:GetService("TweenService"):Create(Parent._LOLHAXBG.TextLabel, TweenInfo.new(Options.ESPFadeTime.Value or 1), {TextTransparency = 1}):Play()
        task.delay(Options.ESPFadeTime.Value or 1, function()
            if Parent:FindFirstChild("_LOLHAXHL") then Parent._LOLHAXHL:Destroy() end
            if Parent:FindFirstChild("_LOLHAXBG") then Parent._LOLHAXBG:Destroy() end
        end)
    end
end

-- 性能优化的ESP扫描函数
local function ScanAndAddESP(category, names, toggle, fillColor, outlineColor, adorneeFunc, removalCondition, textFunc)
    if not Toggles[toggle].Value then return end
    names = type(names) == "table" and names or {names}
    
    for _, room in pairs(Rooms:GetChildren()) do
        for _, v in pairs(room:GetDescendants()) do
            if v:IsA("Model") and table.find(names, v.Name) then
                local alreadyHasESP = false
                local espCategory = EspTable[category][names[1] .. "s"] or EspTable[category]
                
                for _, existingEsp in pairs(espCategory) do
                    if existingEsp[1] and existingEsp[1].Adornee == v then
                        alreadyHasESP = true
                        break
                    end
                end
                
                if not alreadyHasESP then
                    local adornee = adorneeFunc(v)
                    if adornee then
                        local text = textFunc and textFunc(v) or v.Name
                        local Highlight, TextLabel = Esp(adornee, adornee, text, Options[fillColor].Value, Options[outlineColor].Value)
                        if Highlight then
                            table.insert(espCategory, {Highlight, TextLabel})
                            if removalCondition then
                                removalCondition(v, adornee)
                            end
                        end
                    end
                end
            end
        end
    end
end

-- 性能优化的实体ESP扫描
local function ScanAndAddEntityESP(names, toggle, colorOption, adorneeFunc, removalCondition, preAddFunc, textFunc)
    if not Toggles[toggle].Value then return end
    names = type(names) == "table" and names or {names}
    
    for _, v in pairs(workspace:GetDescendants()) do
        if v:IsA("Model") and table.find(names, v.Name) then
            local alreadyHasESP = false
            for _, existingEsp in pairs(EspTable.Entities) do
                if existingEsp[1] and existingEsp[1].Adornee == v then
                    alreadyHasESP = true
                    break
                end
            end
            
            if not alreadyHasESP then
                if preAddFunc then preAddFunc(v) end
                local adornee = adorneeFunc(v)
                if adornee then
                    local text = textFunc and textFunc(v) or v.Name
                    local Highlight, TextLabel = Esp(v, adornee, text, Options[colorOption].Value, Options[colorOption].Value)
                    if Highlight then
                        table.insert(EspTable.Entities, {Highlight, TextLabel})
                        if removalCondition then
                            removalCondition(v)
                        end
                    end
                end
            end
        end
    end
end

-- 清理无效的ESP
local function CleanupStaleESP()
    for category, subs in pairs(EspTable) do
        if type(subs) == "table" then
            for sub, esps in pairs(subs) do
                if type(esps) == "table" then
                    local validEsps = {}
                    for i, esp in pairs(esps) do
                        if esp[1] and esp[1].Adornee and esp[1].Adornee.Parent then
                            table.insert(validEsps, esp)
                        else
                            if esp[1] then esp[1]:Destroy() end
                            if esp[2] then esp[2]:Destroy() end
                        end
                    end
                    subs[sub] = validEsps
                end
            end
        end
    end
end

-- 更新ESP计数
local function UpdateESPCount()
    local count = 0
    for category, subs in pairs(EspTable) do
        if type(subs) == "table" then
            for sub, esps in pairs(subs) do
                if type(esps) == "table" then
                    count = count + #esps
                end
            end
        end
    end
    PerformanceMonitor.ESPCount = count
end

-- 性能优化的扫描函数
local function OptimizedRescanAll()
    if Unloaded then return end
    
    local currentTime = tick()
    if currentTime - PerformanceMonitor.LastScan < PerformanceMonitor.ScanCooldown then
        return
    end
    
    PerformanceMonitor.LastScan = currentTime
    
    -- 根据FPS动态调整扫描频率
    local fps = 1/workspace:GetRealPhysicsFPS()
    if fps < 30 then
        PerformanceMonitor.ScanCooldown = 2.0
    elseif fps < 45 then
        PerformanceMonitor.ScanCooldown = 1.5
    else
        PerformanceMonitor.ScanCooldown = 1.0
    end
    
    task.spawn(function()
        if Toggles.ESPInteractMainEnabled.Value then
            -- 分批扫描，避免一次性扫描所有物品
            local scans = {
                {Toggles.ESPDoorKeys, "KeyObtain", "Door Key"},
                {Toggles.ESPGoldPiles, "GoldPile", "Gold Pile"},
                {Toggles.ESPGeneratorFuses, "FuseObtain", "Generator Fuse"},
                {Toggles.ESPGenerators, "MinesGenerator", "Generator"},
            }
            
            for i, scan in ipairs(scans) do
                if scan[1].Value then
                    ScanAndAddESP("Interactables", scan[2], scan[1].Text, scan[1].Text .. "Fill", scan[1].Text .. "Outline",
                        function(v) return v end,
                        nil,
                        function(v) return scan[3] end)
                    task.wait(0.05) -- 添加延迟避免卡顿
                end
            end
        end
        
        if Toggles.ESPEntitiesEnabled.Value then
            local entityScans = {
                {Toggles.ESPRush, "RushMoving", "Rush"},
                {Toggles.ESPMovingAmbush, "AmbushMoving", "Ambush"},
                {Toggles.ESPA60, "A60", "A-60"},
                {Toggles.ESPA120, "A120", "A-120"},
            }
            
            for _, scan in ipairs(entityScans) do
                if scan[1].Value then
                    ScanAndAddEntityESP(scan[2], scan[1].Text, scan[1].Text .. "Color",
                        function(v) return v end,
                        function(v) end,
                        nil,
                        function(v) return scan[3] end)
                    task.wait(0.05) -- 添加延迟
                end
            end
        end
        
        UpdateESPCount()
    end)
end

-- 定期清理
task.spawn(function()
    while not Unloaded do
        task.wait(20) -- 从15秒增加到20秒
        CleanupStaleESP()
        collectgarbage("step") -- 手动触发垃圾回收
    end
end)

-- 性能监控和自适应调整
task.spawn(function()
    while not Unloaded do
        local currentTime = tick()
        local fps = 1/workspace:GetRealPhysicsFPS()
        PerformanceMonitor.LastFPS = fps
        
        -- 根据性能自动调整
        if fps < 25 then
            if PerformanceMonitor.ESPCount > 15 then
                Library:Notify("低FPS检测到，建议减少ESP数量", 3)
                -- 自动增加扫描间隔
                PerformanceMonitor.ScanCooldown = math.min(PerformanceMonitor.ScanCooldown + 0.5, 3.0)
            end
        elseif fps > 50 then
            -- 恢复较快的扫描速度
            PerformanceMonitor.ScanCooldown = math.max(PerformanceMonitor.ScanCooldown - 0.1, 0.5)
        end
        
        task.wait(8) -- 从5秒增加到8秒
    end
end)

-- 降低扫描频率
RunService.Heartbeat:Connect(function(delta)
    if Unloaded then return end
    OptimizedRescanAll()
end)

Rooms.ChildAdded:Connect(function(newRoom)
    task.delay(1.5, OptimizedRescanAll) -- 增加延迟
end)

GameData.Floor.Changed:Connect(function(newFloor)
    for category, subs in pairs(EspTable) do
        if type(subs) == "table" then
            for sub, esps in pairs(subs) do
                if type(esps) == "table" then
                    for _, esp in pairs(esps) do
                        RemoveEspSmooth(esp[1].Adornee)
                    end
                    subs[sub] = {}
                end
            end
        end
    end
    currentFloor = newFloor
    Window.Footer = "floor: " .. newFloor
    task.delay(2.5, OptimizedRescanAll) -- 增加延迟
end)

-- Player Tab: Movement and Bypasses
local MovementGroup = Tabs.Player:AddRightGroupbox("移动设置")

-- 优化的速度更新函数
local function updatespeed()
    if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid") then
        LocalPlayer.Character.Humanoid.WalkSpeed = Toggles.WalkspeedModifier.Value and Options.WalkspeedAmount.Value or 16
    end
end

MovementGroup:AddToggle("WalkspeedModifier", {
    Text = "速度",
    Default = false,
    Tooltip = "Changes your walking speed to the set value.",
    Callback = function(Value)
        updatespeed()
    end
})

MovementGroup:AddToggle("NoAcceleration", {
    Text = "瞬时加速度",
    Default = false,
    Tooltip = "Removes slow-down when changing direction.",
    Callback = function(Value)
        if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
            LocalPlayer.Character.HumanoidRootPart.CustomPhysicalProperties = (Value and PhysicalProperties.new(100, 0, 0, 0, 0) or OldAccel)
        end
    end
})

MovementGroup:AddToggle("AlwaysJump", { 
    Text = "解锁跳跃", 
    Default = false, 
    Tooltip = "Lets you jump anytime.", 
    Callback = function(Value)
        if LocalPlayer.Character then
            LocalPlayer.Character:SetAttribute("CanJump", Value)
        end
    end 
})

local FlySpeed = 50

MovementGroup:AddSlider("Fly Speed", {
    Text = "飞行速度",
    Default = FlySpeed,
    Min = 0,
    Max = 150,
    Rounding = 0,
    Compact = true,
    Tooltip = "改变飞行速度",
    Callback = function(Value)
        FlySpeed = Value
    end
})

-- 优化的飞行系统
local isFlying = false
local flyConnections = {}
local keys = {W = false, A = false, S = false, D = false, Space = false, Shift = false}

local function startFly()
    local player = game.Players.LocalPlayer
    local character = player.Character
    if not character then return end
    local humanoid = character:FindFirstChildOfClass("Humanoid")
    if not humanoid then return end
    local hrp = character:FindFirstChild("HumanoidRootPart")
    if not hrp then return end

    stopFly()

    local bv = Instance.new("BodyVelocity")
    bv.Name = "飞行速度"
    bv.MaxForce = Vector3.new(40000, 40000, 40000)
    bv.Velocity = Vector3.new(0, 0, 0)
    bv.Parent = hrp

    local bg = Instance.new("BodyGyro")
    bg.Name = "飞行陀螺"
    bg.MaxTorque = Vector3.new(40000, 40000, 40000)
    bg.P = 1000
    bg.D = 100
    bg.Parent = hrp

    local inputBegan = game:GetService("UserInputService").InputBegan:Connect(function(input, gpe)
        if gpe then return end
        local key = input.KeyCode
        if key == Enum.KeyCode.W then keys.W = true
        elseif key == Enum.KeyCode.A then keys.A = true
        elseif key == Enum.KeyCode.S then keys.S = true
        elseif key == Enum.KeyCode.D then keys.D = true
        elseif key == Enum.KeyCode.Space then keys.Space = true
        elseif key == Enum.KeyCode.LeftShift then keys.Shift = true end
    end)

    local inputEnded = game:GetService("UserInputService").InputEnded:Connect(function(input)
        local key = input.KeyCode
        if key == Enum.KeyCode.W then keys.W = false
        elseif key == Enum.KeyCode.A then keys.A = false
        elseif key == Enum.KeyCode.S then keys.S = false
        elseif key == Enum.KeyCode.D then keys.D = false
        elseif key == Enum.KeyCode.Space then keys.Space = false
        elseif key == Enum.KeyCode.LeftShift then keys.Shift = false end
    end)

    local lastUpdate = 0
    local renderConnection = game:GetService("RunService").RenderStepped:Connect(function()
        local currentTime = tick()
        if currentTime - lastUpdate < 0.05 then return end -- 限制到20FPS
        lastUpdate = currentTime
        
        local cam = workspace.CurrentCamera
        if not cam or not hrp or not hrp:FindFirstChild("飞行速度") then
            stopFly()
            return
        end

        local move = Vector3.new(0, 0, 0)
        if keys.W then move = move + cam.CFrame.LookVector end
        if keys.S then move = move - cam.CFrame.LookVector end
        if keys.A then move = move - cam.CFrame.RightVector end
        if keys.D then move = move + cam.CFrame.RightVector end
        if keys.Space then move = move + Vector3.new(0, 1, 0) end
        if keys.Shift then move = move - Vector3.new(0, 1, 0) end

        local direction = (move.Magnitude > 0) and (move.Unit * FlySpeed) or Vector3.new(0, 0, 0)
        bv.Velocity = direction
        bg.CFrame = cam.CFrame
    end)

    flyConnections = {inputBegan, inputEnded, renderConnection}
end

local function stopFly()
    local player = game.Players.LocalPlayer
    local character = player.Character
    local humanoid = character and character:FindFirstChildOfClass("Humanoid")
    local hrp = character and character:FindFirstChild("HumanoidRootPart")

    if hrp then
        local flyVelocity = hrp:FindFirstChild("飞行速度")
        if flyVelocity then flyVelocity:Destroy() end
        local flyGyro = hrp:FindFirstChild("飞行陀螺")
        if flyGyro then flyGyro:Destroy() end
    end

    if humanoid then
        humanoid.AutoRotate = true
        humanoid.PlatformStand = false
        humanoid:ChangeState(Enum.HumanoidStateType.GettingUp)
    end

    for _, conn in ipairs(flyConnections) do
        if conn then
            conn:Disconnect()
        end
    end
    flyConnections = {}

    keys = {W = false, A = false, S = false, D = false, Space = false, Shift = false}
end

MovementGroup:AddToggle("Fly", {
    Text = "飞行",
    Default = false,
    Callback = function(Value)
        isFlying = Value
        if Value then
            startFly()
        else
            stopFly()
        end
    end
})

-- 优化的穿墙系统
local noclipConnection = nil

MovementGroup:AddToggle("Noclip", {
    Text = "穿墙", 
    Default = false, 
    Tooltip = "you know what it does", 
    Callback = function(Value)
        if Value then
            noclipConnection = RunService.Stepped:Connect(function()
                if player.Character then
                    for _, part in pairs(player.Character:GetDescendants()) do
                        if part:IsA("BasePart") and part.CanCollide then
                            part.CanCollide = false
                        end
                    end
                end
            end)
        else
            if noclipConnection then
                noclipConnection:Disconnect()
                noclipConnection = nil
            end
            
            if player.Character then
                for _, part in pairs(player.Character:GetDescendants()) do
                    if part:IsA("BasePart") then
                        if part.Name == "Head" then
                            part.CanCollide = false
                        elseif part.Parent:IsA("Accessory") then
                            part.CanCollide = false
                        else
                            part.CanCollide = true
                        end
                    end
                end
            end
        end
    end
})

-- 角色事件处理
game.Players.LocalPlayer.CharacterAdded:Connect(function(newCharacter)
    if isFlying then
        task.wait(1) -- 等待角色完全加载
        if newCharacter:FindFirstChild("HumanoidRootPart") and newCharacter:FindFirstChild("Humanoid") then
            startFly()
        end
    end
end)

game.Players.LocalPlayer.CharacterRemoving:Connect(function()
    if isFlying then
        stopFly()
    end
end)

MovementGroup:AddToggle("LadderSpeedBoost", {
    Text = "启用爬梯速度",
    Default = false,
    Callback = function(Value)
        if Value then
            AntiConnections["LadderBoost"] = LocalPlayer.Character.Humanoid.StateChanged:Connect(function(_, new)
                if new == Enum.HumanoidStateType.Climbing then
                    LocalPlayer.Character.Humanoid.WalkSpeed = Options.LadderSpeedBoostAmount.Value
                else
                    updatespeed()
                end
            end)
        else
            if AntiConnections["LadderBoost"] then AntiConnections["LadderBoost"]:Disconnect() end
            updatespeed()
        end
    end
})

MovementGroup:AddSlider("LadderSpeedBoostAmount", {
    Text = "爬梯速度",
    Default = 0,
    Min = 0,
    Max = 50,
    Rounding = 0,
    Compact = true,
    Tooltip = "Boost for climbing ladders. Higher values might be unstable."
})

MovementGroup:AddSlider("WalkspeedAmount", {
    Text = "行走速度",
    Default = 20,
    Min = 10,
    Max = 50,
    Rounding = 0,
    Compact = true,
    Tooltip = "Sets how fast you walk.",
    Callback = function(Value)
        updatespeed()
    end
})

-- Godmode functionality
local GodmodeStuff = Tabs.Player:AddLeftGroupbox('Godmode')
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local lp = Players.LocalPlayer
local AutoMode = "Toggle"
local PreviousMode = "Toggle"
local AutoDistance = 166
local ActiveEntities = {}

local function setGodmode(state)
    local char = lp.Character
    if not char then return end
    local hum = char:FindFirstChildOfClass("Humanoid")
    local collision = char:FindFirstChild("Collision")
    if not (hum and collision) then return end
    if state then
        hum.HipHeight = 0.09
        collision.Size = Vector3.new(1, 3, 3)
        if collision:FindFirstChild("CollisionCrouch") then
            collision.CollisionCrouch.Size = Vector3.new(1, 3, 3)
        end
    else
        hum.HipHeight = 2.4
        collision.Size = Vector3.new(5.5, 3, 3)
        if collision:FindFirstChild("CollisionCrouch") then
            collision.CollisionCrouch.Size = Vector3.new(5.5, 3, 3)
        end
    end
end

local function safeDisableGod()
    if not lp.Character then return end
    local hum = lp.Character:FindFirstChildOfClass("Humanoid")
    local collision = lp.Character:FindFirstChild("Collision")
    if not (hum and collision) then
        setGodmode(false)
        return
    end
    local wasNoclip = Toggles.Noclip and Toggles.Noclip.Value
    local shouldShim = AutoMode ~= "Never" and not wasNoclip
    if shouldShim and Toggles.Noclip then
        Toggles.Noclip:SetValue(true)
    end
    setGodmode(false)
    if shouldShim and Toggles.Noclip then
        task.delay(0.2, function()
            if Toggles.Noclip and Toggles.Noclip.Value then
                Toggles.Noclip:SetValue(false)
            end
        end)
    end
end

GodmodeStuff:AddDropdown("GodmodeMode", { 
    Text = "上帝模式",
    Default = "Toggle",
    Values = {"Toggle", "Automatic", "Hold", "Always"},
    Callback = function(mode)
        if PreviousMode == "Always" and mode ~= "Always" then
            if Toggles.PositionSpoof and Toggles.PositionSpoof.Value then
                Toggles.PositionSpoof:SetValue(false)
                setGodmode(false)
                if Toggles.Noclip and not Toggles.Noclip.Value then
                    Toggles.Noclip:SetValue(true)
                    task.delay(0.2, function()
                        if Toggles.Noclip and Toggles.Noclip.Value then
                            Toggles.Noclip:SetValue(false)
                        end
                    end)
                end
            end
        end
        AutoMode = mode
        PreviousMode = mode
        if Options.PositionSpoofKey then
            Options.PositionSpoofKey.Text = "Position Spoof (" .. mode .. ")"
        end
        if mode == "Always" then
            Toggles.PositionSpoof:SetValue(true)
        elseif mode == "Never" then
            Toggles.PositionSpoof:SetValue(false)
        end
    end
})

GodmodeStuff:AddCheckbox("PositionSpoof", {
    Text = "上帝模式开关",
    Default = false,
    Disabled = false,
    Callback = function(v)
        if v then
            setGodmode(true)
            if Toggles.AntiFigure and not Toggles.AntiFigure.Value then
                Toggles.AntiFigure:SetValue(true)
                Library:Notify({
                    Title = "Godmode Enabled",
                    Description = "AntiFigure has been enabled automatically.",
                    Duration = 5,
                    Color = Color3.fromRGB(0, 200, 255)
                })
            end
            Library:Notify({
                Title = 'hey, if you see this. I was too lazy to remove this',
                Description = "",
                Duration = 10,
                Color = Color3.fromRGB(255, 64, 64)
            })
        else
            safeDisableGod()
            if Toggles.AntiFigure and Toggles.AntiFigure.Value then
                Toggles.AntiFigure:SetValue(false)
                Library:Notify({
                    Title = "Godmode Disabled",
                    Description = "AntiFigure has been disabled automatically.",
                    Duration = 5,
                    Color = Color3.fromRGB(255, 128, 128)
                })
            end
        end
    end
}):AddKeyPicker("PositionSpoofKey", {
    Default = "K",
    Mode = "Toggle",
    Text = "位置切换",
    NoUI = false,
    SyncToggleState = true,
})

-- Entity detection for godmode
local EntList = {"a60", "ambushmoving", "backdoorrush", "rushmoving", "mandrake"}
local function IsValidEntity(entity)
    return table.find(EntList, entity.Name:lower()) ~= nil
end

workspace.DescendantAdded:Connect(function(entity)
    if not IsValidEntity(entity) then return end
    local part = entity:FindFirstChildWhichIsA("BasePart")
    if part then ActiveEntities[entity] = part end
end)

RunService.RenderStepped:Connect(function()
    local lib = getgenv().Library
    if not lib or lib.Unloaded then return end
    local root = lp.Character and lp.Character:FindFirstChild("HumanoidRootPart")
    if not root then return end
    if AutoMode == "Never" then
        if Toggles.PositionSpoof.Value then
            Toggles.PositionSpoof:SetValue(false)
        end
    elseif AutoMode == "Always" then
        if not Toggles.PositionSpoof.Value then
            Toggles.PositionSpoof:SetValue(true)
        end
    elseif AutoMode == "Automatic" then
        local shouldEnable = false
        for entity, part in pairs(ActiveEntities) do
            if entity.Parent == nil then
                ActiveEntities[entity] = nil
            elseif part then
                local dist = (root.Position - part.Position).Magnitude
                if dist < AutoDistance then
                    shouldEnable = true
                    break
                end
            end
        end
        if shouldEnable then
            if not Toggles.PositionSpoof.Value then
                Toggles.PositionSpoof:SetValue(true)
            end
        else
            if Toggles.PositionSpoof.Value then
                Toggles.PositionSpoof:SetValue(false)
                safeDisableGod()
            end
        end
    elseif AutoMode == "Hold" then
        local keyCode = Options.PositionSpoofKey and Options.PositionSpoofKey.Value
        if keyCode and UserInputService:IsKeyDown(keyCode) then
            if not Toggles.PositionSpoof.Value then
                Toggles.PositionSpoof:SetValue(true)
            end
        else
            if Toggles.PositionSpoof.Value then
                Toggles.PositionSpoof:SetValue(false)
                safeDisableGod()
            end
        end
    elseif AutoMode == "Toggle" then
    end
end)

task.spawn(function()
    while true do
        task.wait(0.1)
        if getgenv().Library.Unloaded then break end
        if Toggles.PositionSpoof and Toggles.PositionSpoof.Value then
            setGodmode(true)
        end
    end
end)

local VisualEffects = Tabs.Player:AddLeftGroupbox("视觉效果")
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local LocalPlayer = Players.LocalPlayer
local Camera = workspace.CurrentCamera

VisualEffects:AddToggle("NoCamShake", {
    Text = "无摄像头抖动",
    Default = false,
    Tooltip = "Removes camera shaking from entities.",
    Callback = function(Value)
        require(LocalPlayer.PlayerGui.MainUI.Initiator.Main_Game).csgo = Value and CFrame.new(0, 0, 0) or nil
    end
})

VisualEffects:AddToggle("NoLookBob", {
    Text = "无头镜头晃动",
    Default = false,
    Tooltip = "Removes head bobbing when walking.",
    Callback = function(Value)
        require(LocalPlayer.PlayerGui.MainUI.Initiator.Main_Game).spring.Speed = Value and 9e9 or 8
    end
})

VisualEffects:AddToggle("Ambience", {
    Text = "全亮",
    Default = false,
    Tooltip = "Changes the map's color tint.",
    Callback = function(Value)
        game.Lighting.GlobalShadows = not Value
        game.Lighting.OutdoorAmbient = Value and Options.AmbienceColor.Value or Color3.new(0, 0, 0)
    end
}):AddColorPicker("AmbienceColor", {
    Default = Color3.new(1, 1, 1),
    Title = "颜色色调",
    Callback = function(Value)
        game.Lighting.OutdoorAmbient = Toggles.Ambience.Value and Value or Color3.new(0, 0, 0)
    end
})

VisualEffects:AddToggle("NoFog", {
    Text = "无雾",
    Default = false,
    Tooltip = "Clears any fog in the map.",
    Callback = function(Value)
        if game.Lighting:FindFirstChild("Atmosphere") then
            game.Lighting.Atmosphere.Density = Value and 0 or 0.3
        end
        game.Lighting.FogEnd = Value and 9999 or 500
    end
})

VisualEffects:AddDivider()

VisualEffects:AddToggle("Thirdperson", {
    Text = "第三人称视角",
    Default = false,
    Tooltip = "Shows your character from behind.",
    Callback = function(Value)
        if Value then
            AntiConnections["Thirdperson"] = RunService.RenderStepped:Connect(function()
                local Cam = workspace.CurrentCamera
                Cam.CFrame = Cam.CFrame * CFrame.new(Options.ThirdpersonOffset.Value, Options.ThirdpersonOffsetUp.Value, 3.5 * (Options.ThirdpersonDistance.Value / 7.5)) * (Toggles.NoCamShake.Value and CFrame.new() or require(LocalPlayer.PlayerGui.MainUI.Initiator.Main_Game).csgo)
            end)
        else
            if AntiConnections["Thirdperson"] then AntiConnections["Thirdperson"]:Disconnect() end
        end
    end
}):AddKeyPicker("ThirdpersonKey", { Default = "V", SyncToggleState = false, Mode = "Toggle", Text = "Third Person", NoUI = false })

VisualEffects:AddSlider("ThirdpersonDistance", {
    Text = "第三人称距离",
    Default = 10,
    Min = 5,
    Max = 30,
    Rounding = 0,
    Compact = true,
    Tooltip = "How far the camera is in third person."
})

VisualEffects:AddSlider("ThirdpersonOffset", {
    Text = "第三人称侧偏移",
    Default = 0,
    Min = -5,
    Max = 5,
    Rounding = 1,
    Compact = true,
    Tooltip = "Left/right camera shift in third person."
})

VisualEffects:AddSlider("ThirdpersonOffsetUp", {
    Text = "第三人身高偏移",
    Default = 0,
    Min = -5,
    Max = 5,
    Rounding = 1,
    Compact = true,
    Tooltip = "Up/down camera shift in third person."
})

VisualEffects:AddSlider("FOV", {
    Text = "视野",
    Default = 70,
    Min = 0,
    Max = 120,
    Rounding = 1,
    Compact = true,
    Tooltip = "Changes camera field of view smoothly every frame.",
    Callback = function(TargetFOV)
        TargetFOV = math.clamp(TargetFOV, 0, 120)
        local CurrentFOV = Camera.FieldOfView or 70
        local Speed = 10

        if _G.FOVConnection then _G.FOVConnection:Disconnect() end

        _G.FOVConnection = RunService.RenderStepped:Connect(function(dt)
            CurrentFOV = CurrentFOV + (TargetFOV - CurrentFOV) * math.clamp(Speed * dt, 0, 1)
            Camera.FieldOfView = CurrentFOV
        end)
    end
})

local AutomationGroup = Tabs.Player:AddRightGroupbox("自动")
AutomationGroup:AddToggle("AnchorCode", { Text = "自动密码", Default = false, Tooltip = "Notifies when anchor codes are found." })
AutomationGroup:AddToggle("MinecartInteract", { Text = "自动矿车互动", Default = false, Tooltip = "Spams interact on nearby minecarts." }):AddKeyPicker("MinecartInteractKey", { Default = "H", SyncToggleState = false, Mode = "Hold", Text = "自动矿车", NoUI = false })
AutomationGroup:AddToggle("AnchorAutoSolve", { Text = "自动锚点", Default = false, Tooltip = "Solves anchors automatically when close." })
AutomationGroup:AddToggle("AutoPadlockSolve", { Text = "自动解锁图书馆密码锁", Default = false, Tooltip = "Unlocks padlock automatically when near." })
AutomationGroup:AddDivider()
AutomationGroup:AddSlider("AutoPadlockSolveDistance", { Text = "解锁距离", Default = 25, Min = 10, Max = 50, Rounding = 0, Compact = false, Tooltip = "Distance to auto-input padlock code."})
AutomationGroup:AddSlider("AutoInteractRange", { Text = "交互范围", Default = 1, Min = 1, Max = 2, Rounding = 1, Compact = false })

local BypassGroup = Tabs.Player:AddLeftGroupbox("绕过")
BypassGroup:AddToggle("CrouchSpoof", { Text = "绕过 Figure", Default = false, Tooltip = "Makes the game think you're crouching. Useful in Figure rooms.", Callback = function(Value)
    ReplicatedStorage.RemotesFolder.Crouch:FireServer(Value)
end })

BypassGroup:AddToggle("SpeedBypass", { Text = "绕过速度检测", Default = false, Tooltip = "Tries to avoid the speed anti-cheat." })

-- Visuals Tab: ESP and Effects
local ESPPlayers = Tabs.Visuals:AddLeftGroupbox("玩家透视")
ESPPlayers:AddToggle("ESPPlayersEnabled", {
    Text = "玩家透视",
    Default = false,
    Callback = function(Value)
        if Value then
            for _, Player in pairs(game.Players:GetPlayers()) do
                if Player ~= LocalPlayer and Player.Character and Player.Character:FindFirstChild("HumanoidRootPart") then
                    local Highlight, TextLabel = Esp(Player.Character, Player.Character, Player.Name, Options.ESPPlayerFillColor.Value, Options.ESPPlayerOutlineColor.Value)
                    table.insert(EspTable.Players, {Highlight, TextLabel})
                end
            end
        else
            for _, esp in pairs(EspTable.Players) do
                RemoveEspSmooth(esp[1].Adornee)
            end
            EspTable.Players = {}
        end
    end
}):AddColorPicker("ESPPlayerFillColor", {
    Default = Color3.new(1, 1, 1),
    Title = "填充颜色"
}):AddColorPicker("ESPPlayerOutlineColor", {
    Default = Color3.new(1, 1, 1),
    Title = "轮廓颜色"
})

local ESPInteractables = Tabs.Visuals:AddRightTabbox("Interactable ESP")
local ESPInteractables_Config = ESPInteractables:AddTab("选项")

-- 添加统一的任务物品ESP开关
ESPInteractables_Config:AddToggle("ESPKey", {
    Text = "任务物品透视",
    Default = false,
    Callback = function(Value)
        _G.EspKey = Value
        if Value then
            -- 初始化任务物品ESP
            for _, v in ipairs(workspace:GetDescendants()) do
                CheckKey(v)
            end
            
            KeySpawn = workspace.DescendantAdded:Connect(function(v)
                CheckKey(v)
            end)
            
            KeyRemove = workspace.DescendantRemoving:Connect(function(v)
                for i = #_G.KeyAdd, 1, -1 do
                    if _G.KeyAdd[i] == v then
                        table.remove(_G.KeyAdd, i)
                        break
                    end
                end
            end)
        else
            -- 清理所有任务物品ESP
            for _, v in pairs(workspace:GetDescendants()) do 
                if v.Name:find("Key") or v.Name == "LeverForGate" or v.Name:find("FuseObtain") then
                    for i, z in pairs(v:GetChildren()) do
                        if z.Name:find("Esp_") then
                            z:Destroy()
                        end
                    end
                end
            end
            -- 清空任务物品表
            _G.KeyAdd = {}
            
            -- 断开连接
            if KeySpawn then
                KeySpawn:Disconnect()
                KeySpawn = nil
            end
            if KeyRemove then
                KeyRemove:Disconnect()
                KeyRemove = nil
            end
        end
    end
})

ESPInteractables_Config:AddToggle("ESPDoors", {
    Text = "门",
    Default = false,
    Callback = function(Value)
        _G.EspDoor = Value
        if not Value then
            clearAllDoorESPs()
        end
    end
}):AddColorPicker("ESPDoorsFill", { Default = Color3.new(150/255, 200/255, 255/255), Title = "填充颜色" })
:AddColorPicker("ESPDoorsOutline", { Default = Color3.new(150/255, 200/255, 255/255), Title = "轮廓颜色" })

ESPInteractables_Config:AddToggle("ESPDoorKeys", {
    Text = "钥匙",
    Default = false,
    Callback = function(Value)
        if Value then
            ScanAndAddESP("Interactables", "KeyObtain", "ESPDoorKeys", "ESPDoorKeysFill", "ESPDoorKeysOutline",
                function(v) return v end,
                function(v, adornee) end,
                function(v) return "Door Key" end)
        else
            for _, esp in pairs(EspTable.Interactables.DoorKeys) do RemoveEspSmooth(esp[1].Adornee) end
            EspTable.Interactables.DoorKeys = {}
        end
    end
}):AddColorPicker("ESPDoorKeysFill", { Default = Color3.new(1, 1, 1), Title = "填充颜色" })
:AddColorPicker("ESPDoorKeysOutline", { Default = Color3.new(1, 1, 1), Title = "轮廓颜色" })

ESPInteractables_Config:AddToggle("ESPGoldPiles", {
    Text = "金币",
    Default = false,
    Callback = function(Value)
        if Value then
            ScanAndAddESP("Interactables", "GoldPile", "ESPGoldPiles", "ESPGoldPilesFill", "ESPGoldPilesOutline",
                function(v) return v end,
                function(v, adornee) end,
                function(v) return "Gold Pile [ "..v:GetAttribute("GoldValue").." ]" end)
        else
            for _, esp in pairs(EspTable.Interactables.GoldPiles) do RemoveEspSmooth(esp[1].Adornee) end
            EspTable.Interactables.GoldPiles = {}
        end
    end
}):AddColorPicker("ESPGoldPilesFill", { Default = Color3.new(1, 1, 1), Title = "填充颜色" })
:AddColorPicker("ESPGoldPilesOutline", { Default = Color3.new(1, 1, 1), Title = "轮廓颜色" })

ESPInteractables_Config:AddToggle("ESPGeneratorFuses", {
    Text = "发电机保险丝",
    Default = false,
    Callback = function(Value)
        if Value then
            ScanAndAddESP("Interactables", "FuseObtain", "ESPGeneratorFuses", "ESPGeneratorFusesFill", "ESPGeneratorFusesOutline",
                function(v) return v end,
                function(v, adornee) v.Hitbox.FuseModel.Changed:Once(function() RemoveEspSmooth(adornee) end) end,
                function(v) return "Generator Fuse" end)
        else
            for _, esp in pairs(EspTable.Interactables.GeneratorFuses) do RemoveEspSmooth(esp[1].Adornee) end
            EspTable.Interactables.GeneratorFuses = {}
        end
    end
}):AddColorPicker("ESPGeneratorFusesFill", { Default = Color3.new(1, 1, 1), Title = "填充颜色" })
:AddColorPicker("ESPGeneratorFusesOutline", { Default = Color3.new(1, 1, 1), Title = "轮廓颜色" })

ESPInteractables_Config:AddToggle("ESPGenerators", {
    Text = "发电机",
    Default = false,
    Callback = function(Value)
        if Value then
            ScanAndAddESP("Interactables", "MinesGenerator", "ESPGenerators", "ESPGeneratorsFill", "ESPGeneratorsOutline",
                function(v) return v end,
                function(v, adornee) v.Lever.Sound.Played:Once(function() RemoveEspSmooth(adornee) end) end,
                function(v) return "Generator" end)
        else
            for _, esp in pairs(EspTable.Interactables.Generators) do RemoveEspSmooth(esp[1].Adornee) end
            EspTable.Interactables.Generators = {}
        end
    end
}):AddColorPicker("ESPGeneratorsFill", { Default = Color3.new(1, 1, 1), Title = "填充颜色" })
:AddColorPicker("ESPGeneratorsOutline", { Default = Color3.new(1, 1, 1), Title = "轮廓颜色" })

ESPInteractables_Config:AddToggle("ESPGateLevers", {
    Text = "门杆",
    Default = false,
    Callback = function(Value)
        if Value then
            ScanAndAddESP("Interactables", "LeverForGate", "ESPGateLevers", "ESPGateLeversFill", "ESPGateLeversOutline",
                function(v) return v.Main end,
                function(v, adornee) v.ActivateEventPrompt.AttributeChanged:Once(function() RemoveEspSmooth(adornee) end) end,
                function(v) return "Gate Lever" end)
        else
            for _, esp in pairs(EspTable.Interactables.GateLevers) do RemoveEspSmooth(esp[1].Adornee) end
            EspTable.Interactables.GateLevers = {}
        end
    end
}):AddColorPicker("ESPGateLeversFill", { Default = Color3.new(1, 1, 1), Title = "填充颜色" })
:AddColorPicker("ESPGateLeversOutline", { Default = Color3.new(1, 1, 1), Title = "轮廓颜色" })

ESPInteractables_Config:AddToggle("ESPBackroomsLevers", {
    Text = "时间拉杆",
    Default = false,
    Callback = function(Value)
        if Value then
            ScanAndAddESP("Interactables", "TimerLever", "ESPBackroomsLevers", "ESPBackroomsLeversFill", "ESPBackroomsLeversOutline",
                function(v) return v.Hitbox end,
                function(v, adornee) v.ActivateEventPrompt.AttributeChanged:Once(function() RemoveEspSmooth(adornee) end) end,
                function(v) return "Timer Lever" end)
        else
            for _, esp in pairs(EspTable.Interactables.BackroomsLevers) do RemoveEspSmooth(esp[1].Adornee) end
            EspTable.Interactables.BackroomsLevers = {}
        end
    end
}):AddColorPicker("ESPBackroomsLeversFill", { Default = Color3.new(1, 1, 1), Title = "填充颜色" })
:AddColorPicker("ESPBackroomsLeversOutline", { Default = Color3.new(1, 1, 1), Title = "轮廓颜色" })

ESPInteractables_Config:AddToggle("ESPLibraryBooks", {
    Text = "图书馆密码书",
    Default = false,
    Callback = function(Value)
        if Value then
            ScanAndAddESP("Interactables", "LiveHintBook", "ESPLibraryBooks", "ESPLibraryBooksFill", "ESPLibraryBooksOutline",
                function(v) return v end,
                function(v, adornee) end,
                function(v) return "Book" end)
        else
            for _, esp in pairs(EspTable.Interactables.LibraryBooks) do RemoveEspSmooth(esp[1].Adornee) end
            EspTable.Interactables.LibraryBooks = {}
        end
    end
}):AddColorPicker("ESPLibraryBooksFill", { Default = Color3.new(1, 1, 1), Title = "填充颜色" })
:AddColorPicker("ESPLibraryBooksOutline", { Default = Color3.new(1, 1, 1), Title = "轮廓颜色" })

ESPInteractables_Config:AddToggle("ESPBreakerPoles", {
    Text = "断路器",
    Default = false,
    Callback = function(Value)
        if Value then
            ScanAndAddESP("Interactables", "LiveBreakerPolePickup", "ESPBreakerPoles", "ESPBreakerPolesFill", "ESPBreakerPolesOutline",
                function(v) return v end,
                function(v, adornee) end,
                function(v) return "Breaker Pole" end)
        else
            for _, esp in pairs(EspTable.Interactables.BreakerPoles) do RemoveEspSmooth(esp[1].Adornee) end
            EspTable.Interactables.BreakerPoles = {}
        end
    end
}):AddColorPicker("ESPBreakerPolesFill", { Default = Color3.new(1, 1, 1), Title = "填充颜色" })
:AddColorPicker("ESPBreakerPolesOutline", { Default = Color3.new(1, 1, 1), Title = "轮廓颜色" })

ESPInteractables_Config:AddToggle("ESPAnchors", {
    Text = "锚点",
    Default = false,
    Callback = function(Value)
        if Value then
            ScanAndAddESP("Interactables", "_NestHandler", "ESPAnchors", "ESPAnchorsFill", "ESPAnchorsOutline",
                function(v) return v.AnchorBase end,
                function(v, adornee) v.AttributeChanged:Once(function() RemoveEspSmooth(adornee) end) end,
                function(v) return "Anchor" end)
        else
            for _, esp in pairs(EspTable.Interactables.Anchors) do RemoveEspSmooth(esp[1].Adornee) end
            EspTable.Interactables.Anchors = {}
        end
    end
}):AddColorPicker("ESPAnchorsFill", { Default = Color3.new(1, 1, 1), Title = "填充颜色" })
:AddColorPicker("ESPAnchorsOutline", { Default = Color3.new(1, 1, 1), Title = "轮廓颜色" })

ESPInteractables_Config:AddToggle("ESPMiscPickups", {
    Text = "其他物品",
    Default = false,
    Callback = function(Value)
        if Value then
            for name, display in pairs(MiscPickups) do
                ScanAndAddESP("Interactables", name, "ESPMiscPickups", "ESPMiscPickupsFill", "ESPMiscPickupsOutline",
                    function(v) return v.PrimaryPart end,
                    function(v, adornee) end,
                    function(v) return display end)
            end
        else
            for _, esp in pairs(EspTable.Interactables.MiscPickups) do RemoveEspSmooth(esp[1].Adornee) end
            EspTable.Interactables.MiscPickups = {}
        end
    end
}):AddColorPicker("ESPMiscPickupsFill", { Default = Color3.new(1, 1, 1), Title = "填充颜色" })
:AddColorPicker("ESPMiscPickupsOutline", { Default = Color3.new(1, 1, 1), Title = "轮廓颜色" })

ESPInteractables_Config:AddToggle("ESPClosets", {
    Text = "躲藏点",
    Default = false,
    Callback = function(Value)
        if Value then
            ScanAndAddESP("Interactables", "Wardrobe", "ESPClosets", "ESPClosetsFill", "ESPClosetsOutline",
                function(v) return v.Door or v.Main end,
                function(v, adornee) v.AttributeChanged:Once(function() RemoveEspSmooth(adornee) end) end,
                function(v) return "Closet" end)
            ScanAndAddESP("Interactables", "Toolshed", "ESPClosets", "ESPClosetsFill", "ESPClosetsOutline",
                function(v) return v.Door or v.Main end,
                function(v, adornee) v.AttributeChanged:Once(function() RemoveEspSmooth(adornee) end) end,
                function(v) return "Toolshed" end)
        else
            for _, esp in pairs(EspTable.Interactables.Closets) do RemoveEspSmooth(esp[1].Adornee) end
            EspTable.Interactables.Closets = {}
        end
    end
}):AddColorPicker("ESPClosetsFill", { Default = Color3.new(1, 1, 1), Title = "填充颜色" })
:AddColorPicker("ESPClosetsOutline", { Default = Color3.new(1, 1, 1), Title = "轮廓颜色" })

local ESPInteractMainEnabled = Tabs.Visuals:AddLeftGroupbox("启用交互透视")
ESPInteractMainEnabled:AddToggle("ESPInteractMainEnabled", {
    Text = "启用交互透视",
    Default = false
})

local ESPEntities = Tabs.Visuals:AddLeftGroupbox("启用透视")
ESPEntities:AddToggle("ESPEntitiesEnabled", { Text = "启用实体透视", Default = false })
ESPEntities:AddToggle("ESPGiggle", { Text = "Giggle", Default = false }):AddColorPicker("ESPGiggleColor", { Default = Color3.new(255, 174, 116), Title = "Color" })
ESPEntities:AddToggle("ESPFigure", { Text = "Figure", Default = false }):AddColorPicker("ESPFigureColor", { Default = Color3.new(255, 174, 116), Title = "Color" })
ESPEntities:AddToggle("ESPGrumble", { Text = "Grumble", Default = false }):AddColorPicker("ESPGrumbleColor", { Default = Color3.new(255, 174, 116), Title = "Color" })
ESPEntities:AddToggle("ESPGloombatSwarm", { Text = "Gloombat Swarm", Default = false }):AddColorPicker("ESPGloombatSwarmColor", { Default = Color3.new(255, 174, 116), Title = "Color" })
ESPEntities:AddToggle("ESPDread", { Text = "Dread", Default = false }):AddColorPicker("ESPDreadColor", { Default = Color3.new(255, 174, 116), Title = "Color" })
ESPEntities:AddToggle("ESPRush", { Text = "Rush", Default = false }):AddColorPicker("ESPRushColor", { Default = Color3.new(255, 174, 116), Title = "Color" })
ESPEntities:AddToggle("ESPMovingAmbush", { Text = "Ambush", Default = false }):AddColorPicker("ESPMovingAmbushColor", { Default = Color3.fromRGB(255, 174, 116), Title = "Color" })
ESPEntities:AddToggle("ESPA60", { Text = "A-60", Default = false }):AddColorPicker("ESPA60Color", { Default = Color3.fromRGB(255, 174, 116), Title = "Color" })
ESPEntities:AddToggle("ESPA120", { Text = "A-120", Default = false }):AddColorPicker("ESPA120Color", { Default = Color3.fromRGB(255, 174, 116), Title = "Color" })
ESPEntities:AddToggle("ESPBlitz", { Text = "Blitz", Default = false }):AddColorPicker("ESPBlitzColor", { Default = Color3.fromRGB(255, 174, 116), Title = "Color" })
ESPEntities:AddToggle("ESPEyes", { Text = "Eyes", Default = false }):AddColorPicker("ESPEyesColor", { Default = Color3.fromRGB(255, 174, 116), Title = "Color" })
ESPEntities:AddToggle("ESPLookman", { Text = "Lookman", Default = false }):AddColorPicker("ESPLookmanColor", { Default = Color3.fromRGB(255, 174, 116), Title = "Color" })
ESPEntities:AddToggle("ESPSnare", { Text = "Snare", Default = false }):AddColorPicker("ESPSnareColor", { Default = Color3.new(255, 174, 116), Title = "Color" })
ESPEntities:AddToggle("ESPWorldLotus", { Text = "World Lotus", Disabled = true, Default = false }):AddColorPicker("ESPWorldLotusColor", { Default = Color3.new(255, 174, 116), Title = "Color" })
ESPEntities:AddToggle("ESPBramble", { Text = "Bramble", Default = false }):AddColorPicker("ESPBrambleColor", { Default = Color3.new(255, 174, 116), Title = "Color" })
ESPEntities:AddToggle("ESPCaws", { Text = "Caws", Default = false }):AddColorPicker("ESPCawsColor", { Default = Color3.new(255, 174, 116), Title = "Color" })
ESPEntities:AddToggle("ESPEyestalk", { Text = "Eyestalk", Default = false }):AddColorPicker("ESPEyestalkColor", { Default = Color3.new(255, 174, 116), Title = "Color" })
ESPEntities:AddToggle("ESPGrampy", { Text = "Grampy", Default = false }):AddColorPicker("ESPGrampyColor", { Default = Color3.new(255, 174, 116), Title = "Color" })
ESPEntities:AddToggle("ESPGroundskeeper", { Text = "Groundskeeper", Default = false }):AddColorPicker("ESPGroundskeeperColor", { Default = Color3.new(255, 174, 116), Title = "Color" })
ESPEntities:AddToggle("ESPMandrake", { Text = "Mandrake", Default = false }):AddColorPicker("ESPMandrakeColor", { Default = Color3.new(255, 174, 116), Title = "Color" })
ESPEntities:AddToggle("ESPMonument", { Text = "Monument", Default = false }):AddColorPicker("ESPMonumentColor", { Default = Color3.new(255, 174, 116), Title = "Color" })
ESPEntities:AddToggle("ESPSurge", { Text = "Surge", Default = false }):AddColorPicker("ESPSurgeColor", { Default = Color3.new(255, 174, 116), Title = "Color" })

-- 实体ESP切换回调
Toggles.ESPGiggle:OnChanged(function(Value)
    if Value then
        ScanAndAddEntityESP("GiggleCeiling", "ESPGiggle", "ESPGiggleColor",
            function(v) return v.Root end,
            function(v) end,
            nil,
            function(v) return "Giggle" end)
    else
        for _, esp in pairs(EspTable.Entities) do
            if esp[2]:GetAttribute("Text") == "Giggle" then RemoveEspSmooth(esp[1].Adornee) end
        end
    end
end)

Toggles.ESPFigure:OnChanged(function(Value)
    if Value then
        ScanAndAddEntityESP("FigureRig", "ESPFigure", "ESPFigureColor",
            function(v) return v.Figure end,
            function(v) end,
            nil,
            function(v) return "Figure" end)
    else
        for _, esp in pairs(EspTable.Entities) do
            if esp[2]:GetAttribute("Text") == "Figure" then RemoveEspSmooth(esp[1].Adornee) end
        end
    end
end)

Toggles.ESPGrumble:OnChanged(function(Value)
    if Value then
        ScanAndAddEntityESP("GrumbleRig", "ESPGrumble", "ESPGrumbleColor",
            function(v) return v.Model end,
            function(v) end,
            nil,
            function(v) return "Grumble" end)
    else
        for _, esp in pairs(EspTable.Entities) do
            if esp[2]:GetAttribute("Text") == "Grumble" then RemoveEspSmooth(esp[1].Adornee) end
        end
    end
end)

Toggles.ESPGloombatSwarm:OnChanged(function(Value)
    if Value then
        ScanAndAddEntityESP("GloombatSwarm", "ESPGloombatSwarm", "ESPGloombatSwarmColor",
            function(v) return v end,
            function(v) end,
            nil,
            function(v) return "Gloombat Swarm" end)
    else
        for _, esp in pairs(EspTable.Entities) do
            if esp[2]:GetAttribute("Text") == "Gloombat Swarm" then RemoveEspSmooth(esp[1].Adornee) end
        end
    end
end)

Toggles.ESPDread:OnChanged(function(Value)
    if Value then
        ScanAndAddEntityESP("Dread", "ESPDread", "ESPDreadColor",
            function(v) return v.Main end,
            function(v) end,
            function(v)
                v:WaitForChild("Main")
                if not v:FindFirstChildOfClass("Humanoid") then
                    Instance.new("Humanoid", v)
                end
                v.Main.Transparency = 0.999
            end,
            function(v) return "Dread" end)
    else
        for _, esp in pairs(EspTable.Entities) do
            if esp[2]:GetAttribute("Text") == "Dread" then RemoveEspSmooth(esp[1].Adornee) end
        end
    end
end)

Toggles.ESPRush:OnChanged(function(Value)
    if Value then
        ScanAndAddEntityESP("RushMoving", "ESPRush", "ESPRushColor",
            function(v) return v end,
            function(v) end,
            nil,
            function(v) return "Rush" end)
    else
        for _, esp in pairs(EspTable.Entities) do
            if esp[2]:GetAttribute("Text") == "Rush" then RemoveEspSmooth(esp[1].Adornee) end
        end
    end
end)

Toggles.ESPMovingAmbush:OnChanged(function(Value)
    if Value then
        ScanAndAddEntityESP("AmbushMoving", "ESPMovingAmbush", "ESPMovingAmbushColor",
            function(v) return v end,
            function(v) end,
            nil,
            function(v) return "Ambush" end)
    else
        for _, esp in pairs(EspTable.Entities) do
            if esp[2]:GetAttribute("Text") == "Ambush" then RemoveEspSmooth(esp[1].Adornee) end
        end
    end
end)

Toggles.ESPA60:OnChanged(function(Value)
    if Value then
        ScanAndAddEntityESP("A60", "ESPA60", "ESPA60Color",
            function(v) return v end,
            function(v) end,
            nil,
            function(v) return "A-60" end)
    else
        for _, esp in pairs(EspTable.Entities) do
            if esp[2]:GetAttribute("Text") == "A-60" then RemoveEspSmooth(esp[1].Adornee) end
        end
    end
end)

Toggles.ESPA120:OnChanged(function(Value)
    if Value then
        ScanAndAddEntityESP("A120", "ESPA120", "ESPA120Color",
            function(v) return v end,
            function(v) end,
            nil,
            function(v) return "A-120" end)
    else
        for _, esp in pairs(EspTable.Entities) do
            if esp[2]:GetAttribute("Text") == "A-120" then RemoveEspSmooth(esp[1].Adornee) end
        end
    end
end)

Toggles.ESPBlitz:OnChanged(function(Value)
    if Value then
        ScanAndAddEntityESP("BackdoorRush", "ESPBlitz", "ESPBlitzColor",
            function(v) return v end,
            function(v) end,
            nil,
            function(v) return "Blitz" end)
    else
        for _, esp in pairs(EspTable.Entities) do
            if esp[2]:GetAttribute("Text") == "Blitz" then RemoveEspSmooth(esp[1].Adornee) end
        end
    end
end)

Toggles.ESPEyes:OnChanged(function(Value)
    if Value then
        ScanAndAddEntityESP("Eyes", "ESPEyes", "ESPEyesColor",
            function(v) return v end,
            function(v) end,
            nil,
            function(v) return "Eyes" end)
    else
        for _, esp in pairs(EspTable.Entities) do
            if esp[2]:GetAttribute("Text") == "Eyes" then RemoveEspSmooth(esp[1].Adornee) end
        end
    end
end)

Toggles.ESPLookman:OnChanged(function(Value)
    if Value then
        ScanAndAddEntityESP("BackdoorLookman", "ESPLookman", "ESPLookmanColor",
            function(v) return v.Eyes end,
            function(v) end,
            nil,
            function(v) return "Lookman" end)
    else
        for _, esp in pairs(EspTable.Entities) do
            if esp[2]:GetAttribute("Text") == "Lookman" then RemoveEspSmooth(esp[1].Adornee) end
        end
    end
end)

Toggles.ESPSnare:OnChanged(function(Value)
    if Value then
        ScanAndAddEntityESP("Snare", "ESPSnare", "ESPSnareColor",
            function(v) return v end,
            function(v) end,
            nil,
            function(v) return "Snare" end)
    else
        for _, esp in pairs(EspTable.Entities) do
            if esp[2]:GetAttribute("Text") == "Snare" then RemoveEspSmooth(esp[1].Adornee) end
        end
    end
end)

local ESPSettings = Tabs.Visuals:AddRightGroupbox("ESP设置")
ESPSettings:AddDropdown("ESPFont", {
    Values = { "Arial", "SourceSans", "Highway", "Fantasy", "Gotham", "DenkOne", "JosefinSans", "Nunito", "Oswald", "RobotoMono", "Sarpanch", "Ubuntu" },
    Default = 2,
    Multi = false,
    Text = "文本字体"
})
ESPSettings:AddSlider("ESPFontSize", { Text = "字体大小", Default = 20, Min = 10, Max = 32, Rounding = 0, Compact = true })
ESPSettings:AddSlider("ESPFillTransparency", { Text = "填充透明度", Default = 0.7, Min = 0, Max = 1, Rounding = 2, Compact = true })
ESPSettings:AddSlider("ESPOutlineTransparency", { Text = "轮廓透明度", Default = 0.2, Min = 0, Max = 1, Rounding = 2, Compact = true })
ESPSettings:AddSlider("ESPFadeTime", { Text = "Fade Time", Default = 1, Min = 0, Max = 2, Rounding = 2, Compact = true, Suffix = "s" })

-- Entities Tab: Notify and Anti
local NotifyGroup = Tabs.Entities:AddLeftGroupbox("实体通知")
local EntityNotifications = {
    ["Screech"] = {Description = "Screech已生成了！请注意!", Color = Color3.fromRGB(255, 255, 0)},
    ["Halt"] = {Description = "Halt已生成！注意halt位置", Color = Color3.fromRGB(0, 255, 255)},
    ["FigureRig"] = {Description = "Figure生成了!不要被他听到！", Color = Color3.fromRGB(255, 0, 0)},
    ["Eyes"] = {Description = "Eyes生成了！不要看他", Color = Color3.fromRGB(127, 30, 220)},
    ["SeekMoving"] = {Description = "Seek 生成了祝你好运runrunrun!", Color = Color3.fromRGB(255, 100, 100)},
    ["RushMoving"] = {Description = "Rush 生成了快去躲起来!", Color = Color3.fromRGB(0, 255, 0)},
    ["AmbushMoving"] = {Description = "Ambush 生成了快去躲起来", Color = Color3.fromRGB(80, 255, 110)},
    ["A60"] = {Description = "A-60 生成了快去躲起来!", Color = Color3.fromRGB(200, 50, 50)},
    ["A120"] = {Description = "A-120 生成了快去躲起来!", Color = Color3.fromRGB(55, 55, 55)},
    ["GiggleCeiling"] = {Description = "Giggle 生成了注意头顶!", Color = Color3.fromRGB(200, 200, 200)},
    ["GrumbleRig"] = {Description = "Grumble 生成了不要被他夹击!", Color = Color3.fromRGB(150, 150, 150)},
    ["GloombatSwarm"] = {Description = "Gloombat 生成了! 呆在灯光下!", Color = Color3.fromRGB(100, 100, 100)},
    ["Dread"] = {Description = "Dread 生成了注意时间!", Color = Color3.fromRGB(80, 80, 80)},
    ["BackdoorLookman"] = {Description = "Lookman 生成了! 不要看他", Color = Color3.fromRGB(110, 15, 15)},
    ["Snare"] = {Description = "Snare 生成了! 注意脚下!", Color = Color3.fromRGB(100, 100, 100)},
}

NotifyGroup:AddToggle("NotifyEntities", {
    Text = "实体生成时通知",
    Default = false,
    Callback = function(Value)
        if Value then
            AntiConnections["NotifyEntities"] = workspace.ChildAdded:Connect(function(child)
                if child:IsA("Model") and EntityNotifications[child.Name] and Toggles["Notify" .. child.Name].Value then
                    Library:Notify(EntityNotifications[child.Name].Description, 5)
                end
            end)
            AntiConnections["NotifyEntitiesRooms"] = Rooms.DescendantAdded:Connect(function(desc)
                if desc:IsA("Model") and EntityNotifications[desc.Name] and Toggles["Notify" .. desc.Name].Value then
                    Library:Notify(EntityNotifications[desc.Name].Description, 5)
                end
            end)
        else
            if AntiConnections["NotifyEntities"] then AntiConnections["NotifyEntities"]:Disconnect() end
            if AntiConnections["NotifyEntitiesRooms"] then AntiConnections["NotifyEntitiesRooms"]:Disconnect() end
        end
    end
})

NotifyGroup:AddToggle("NotifyScreech", { Text = "Screech", Default = true })
NotifyGroup:AddToggle("NotifyHalt", { Text = "Halt", Default = true })
NotifyGroup:AddToggle("NotifyFigureRig", { Text = "Figure", Default = true })
NotifyGroup:AddToggle("NotifyEyes", { Text = "Eyes", Default = true })
NotifyGroup:AddToggle("NotifySeekMoving", { Text = "Seek", Default = true })
NotifyGroup:AddToggle("NotifyRushMoving", { Text = "Rush", Default = true })
NotifyGroup:AddToggle("NotifyAmbushMoving", { Text = "Ambush", Default = true })
NotifyGroup:AddToggle("NotifyA60", { Text = "A-60", Default = true })
NotifyGroup:AddToggle("NotifyA120", { Text = "A-120", Default = true })
NotifyGroup:AddToggle("NotifyGiggleCeiling", { Text = "Giggle", Default = true })
NotifyGroup:AddToggle("NotifyGrumbleRig", { Text = "Grumble", Default = true })
NotifyGroup:AddToggle("NotifyGloombatSwarm", { Text = "Gloombat Swarm", Default = true })
NotifyGroup:AddToggle("NotifyDread", { Text = "Dread", Default = true })
NotifyGroup:AddToggle("NotifyBackdoorLookman", { Text = "Lookman", Default = true })
NotifyGroup:AddToggle("NotifySnare", { Text = "Snare", Default = true })

local AntiGroup = Tabs.Entities:AddRightGroupbox("移去实体")
AntiGroup:AddToggle("AntiScreech", {
    Text = "移去Screench",
    Default = false,
    Callback = function(Value)
        if Value then
            AntiConnections["Screech"] = workspace.ChildAdded:Connect(function(child)
                if child.Name == "Screech" then
                    child:Destroy()
                end
            end)
        else
            if AntiConnections["Screech"] then AntiConnections["Screech"]:Disconnect() end
        end
    end
})

AntiGroup:AddToggle("Noeyes", {
    Text = "防eyes",
    Default = false,
    Tooltip = "防eyes伤害",
    Callback = function(Value)
        _G.NoEyes = Value
        while _G.NoEyes do
            if workspace:FindFirstChild("Eyes") or workspace:FindFirstChild("BackdoorLookman") then
                if game:GetService("ReplicatedStorage"):FindFirstChild("RemotesFolder") then
                    game:GetService("ReplicatedStorage"):WaitForChild("RemotesFolder"):WaitForChild("MotorReplication"):FireServer(-649)
                end
            end
            task.wait()
        end
    end
})

AntiGroup:AddToggle("NoHasteEffects", {
    Text = "移去烟幕",
    Default = false,
    Tooltip = "Removes red edges when Haste appears.",
    Callback = function(Value)
        for _, v in workspace.CurrentCamera:GetChildren() do
            if v.Name == "LiveSanity" and workspace:FindFirstChild("EntityModel") then
                v.Enabled = not Value
            end
        end
    end
})

AntiGroup:AddToggle("NoHidingVignette", {
    Text = "避免隐藏边缘",
    Default = false,
    Tooltip = "Removes dark edges when hiding.",
    Callback = function(Value)
        LocalPlayer.PlayerGui.MainUI.MainFrame.HideVignette.Image = Value and "rbxassetid://0" or "rbxassetid://6100076320"
    end
})

AntiGroup:AddToggle("NoHaltEffects", {
    Text = "避免停止闪烁",
    Default = false,
    Tooltip = "Removes flashing in Halt rooms.",
    Callback = function(Value)
        if Value then
            AntiConnections["HaltEffects"] = Rooms.DescendantAdded:Connect(function(desc)
                if desc.Name == "Shade" then
                    desc:Destroy()
                end
            end)
        else
            if AntiConnections["HaltEffects"] then AntiConnections["HaltEffects"]:Disconnect() end
        end
    end
})

AntiGroup:AddToggle("AntiHalt", {
    Text = "移去 Halt",
    Default = false,
    Callback = function(Value)
        if Value then
            AntiConnections["Halt"] = Rooms.DescendantAdded:Connect(function(desc)
                if desc.Name == "Halt" then
                    desc:Destroy()
                end
            end)
        else
            if AntiConnections["Halt"] then AntiConnections["Halt"]:Disconnect() end
        end
    end
})

AntiGroup:AddToggle("AntiGiggle", {
    Text = "移去 Giggle",
    Default = false,
    Callback = function(Value)
        if Value then
            AntiConnections["Giggle"] = Rooms.DescendantAdded:Connect(function(desc)
                if desc.Name == "GiggleCeiling" then
                    desc:WaitForChild("Hitbox", 9e9)
                    desc.Hitbox.CanTouch = false
                end
            end)
            for _, Room in Rooms:GetChildren() do
                for _, Giggle in Room:GetChildren() do
                    if Giggle:IsA("Model") and Giggle.Name == "GiggleCeiling" then
                        Giggle:WaitForChild("Hitbox", 9e9)
                        Giggle.Hitbox.CanTouch = false
                    end
                end
            end
        else
            if AntiConnections["Giggle"] then
                AntiConnections["Giggle"]:Disconnect()
            end
            for _, Room in Rooms:GetChildren() do
                for _, Giggle in Room:GetChildren() do
                    if Giggle:IsA("Model") and Giggle.Name == "GiggleCeiling" then
                        Giggle:WaitForChild("Hitbox", 9e9)
                        Giggle.Hitbox.CanTouch = true
                    end
                end
            end
        end
    end
})

AntiGroup:AddToggle("AntiGloombat", {
    Text = "移去Gloombat Swarm效果",
    Default = false,
    Callback = function(Value)
        for _, v in game:GetService("Workspace").CurrentRooms:GetDescendants() do
            if v.Name == "GloomEgg" and v:IsA("Model") and v:FindFirstChild("Egg") then
                v.Egg.CanTouch = not Value
            end
        end
    end
})

game:GetService("Workspace").CurrentRooms.DescendantAdded:Connect(function(v)
    if v.Name == "GloomEgg" and v:IsA("Model") then
        v:WaitForChild("Egg", 9e9)
        v.Egg.CanTouch = not Toggles.AntiGloombat.Value
    end
end)

AntiGroup:AddToggle("AntiLookman", {
    Text = "移去 Lookman",
    Default = false,
    Callback = function(Value)
        if Value then
            AntiConnections["Lookman"] = workspace.ChildAdded:Connect(function(child)
                if child.Name == "BackdoorLookman" then
                    child:WaitForChild("Core", 9e9)
                    child.Core.CanTouch = false
                end
            end)
            for _, v in workspace:GetChildren() do
                if v.Name == "BackdoorLookman" and v:IsA("Model") then
                    v:WaitForChild("Core", 9e9)
                    v.Core.CanTouch = false
                end
            end
           
            local Main_Game = require(LocalPlayer.PlayerGui.MainUI.Initiator.Main_Game)
            Main_Game.forcecharlook(Vector3.new(0, -1, 0))
        else
            if AntiConnections["Lookman"] then AntiConnections["Lookman"]:Disconnect() end
            for _, v in workspace:GetChildren() do
                if v.Name == "BackdoorLookman" and v:IsA("Model") then
                    v:WaitForChild("Core", 9e9)
                    v.Core.CanTouch = true
                end
            end
           
            local Main_Game = require(LocalPlayer.PlayerGui.MainUI.Initiator.Main_Game)
            Main_Game.forcecharlook(Vector3.new(0, 0, 0))
        end
    end
})

AntiGroup:AddToggle("AntiSnare", {
    Text = "移去 Snare",
    Default = false,
    Callback = function(Value)
        for _, v in game:GetService("Workspace").CurrentRooms:GetDescendants() do
            if v.Name == "Snare" and v:FindFirstChild("Hitbox") then
                v.Hitbox.CanTouch = not Value
            end
        end
    end
})

AntiGroup:AddToggle("AntiDupe", {
    Text = "移去假门",
    Default = false,
    Callback = function(Value)
        for _, v in game:GetService("Workspace").CurrentRooms:GetDescendants() do
            if v.Name == "DoorFake" and v:IsA("Model") then
                if v:FindFirstChild("Hidden") then
                    v.Hidden.CanTouch = not Value
                end
                if v:FindFirstChild("LockPart") and v.LockPart:FindFirstChild("UnlockPrompt") then
                    v.LockPart.UnlockPrompt.Enabled = not Value
                end
            end
        end
    end
})

game:GetService("Workspace").CurrentRooms.DescendantAdded:Connect(function(v)
    if v.Name == "DoorFake" and v:IsA("Model") then
        v:WaitForChild("Hidden", 9e9)
        v.Hidden.CanTouch = not Toggles.AntiDupe.Value
        v:WaitForChild("LockPart", 2)
        if v:FindFirstChild("LockPart") and v.LockPart:FindFirstChild("UnlockPrompt") then
            v.LockPart.UnlockPrompt.Enabled = not Toggles.AntiDupe.Value
        end
    end
end)

AntiGroup:AddToggle("NoA90", { Text = "移去 A-90", Default = false, Tooltip = "Disables A-90 entirely." })
AntiGroup:AddToggle("NoA90Damage", { Text = "移去A-90伤害", Default = false, Tooltip = "Prevents A-90 from damaging you." })
AntiGroup:AddToggle("NoScreechDamage", { Text = "移去Screech伤害", Default = false, Tooltip = "Prevents Screech from damaging you." })
AntiGroup:AddToggle("NoHaltDamage", { Text = "移去Halt伤害", Default = false, Tooltip = "Prevents Halt from damaging you." })

local GeneralNotifying = Tabs.Entities:AddLeftGroupbox("其他消息")
GeneralNotifying:AddToggle("PadlockCode", { Text = "图书馆锁密码", Default = false, Tooltip = "Notifies when padlock codes are found." })
GeneralNotifying:AddSlider("NotificationOffsetX", { Text = "X位置偏移", Default = 0, Min = -1, Max = 1, Rounding = 2, Compact = true })
GeneralNotifying:AddSlider("NotificationOffsetY", { Text = "Y位置偏移", Default = 0, Min = -1, Max = 1, Rounding = 2, Compact = true })
GeneralNotifying:AddSlider("NotificationDPISize", { Text = "尺寸倍增", Default = 1, Min = 0.8, Max = 3, Rounding = 1, Compact = true })
GeneralNotifying:AddButton("测试", function()
    Library:Notify("这是一个测试通知", 2.5)
end)

local MiscAudio = Tabs.Misc:AddRightGroupbox("音频设置")
MiscAudio:AddToggle("SilentJammin", { Text = "把杰夫店里的音乐调成静音", Default = false, Tooltip = "Silences the music in Jeff's shop.", Callback = function(Value)
    LocalPlayer.PlayerGui.MainUI.Initiator.Main_Game.Health.Jam.Playing = not Value
    game.SoundService.Main.Jamming.Enabled = not Value
end })

MiscAudio:AddToggle("NoHasteSound", { Text = "静音急促音乐", Default = false, Tooltip = "Silences loud sounds when Haste appears." })

MiscAudio:AddToggle("SilentInteracting", { Text = "将交互声音静音", Default = false, Tooltip = "No sound when using prompts.", Callback = function(Value)
    LocalPlayer.PlayerGui.MainUI.Initiator.Main_Game.PromptService.Triggered.Volume = Value and 0 or 0.04
end })

MiscAudio:AddToggle("NoRandomAmbience", { Text = "静音随机音乐", Default = false, Tooltip = "Silences random ambient sounds." })

local HotelGroup = Tabs.Misc:AddLeftGroupbox("加入旧版酒店")
HotelGroup:AddButton({
    Text = "加入旧版酒店",
    Tooltip = "在传送到+门之前",
    Func = function()
        if game.PlaceId == 6516141723 then
            local args = {
                {
                    Mods = {"BeforePlus"},
                    Settings = {},
                    Destination = "Hotel",
                    FriendsOnly = false,
                    MaxPlayers = "1"
                }
            }
            game:GetService("ReplicatedStorage"):WaitForChild("RemotesFolder"):WaitForChild("CreateElevator"):FireServer(unpack(args))
            Library:Notify({
                Title = "传送",
                Description = "正在传送...",
                Time = 5,
                SoundId = 4590662766
            })
        else
            Library:Notify({
                Title = "传送",
                Description = "go to the lobby first",
                Time = 10,
                SoundId = 4590662766
            })
        end
    end
})

local ExploitTroll = Tabs.Misc:AddLeftGroupbox("钓鱼")
ExploitTroll:AddToggle("SpamTools", { Text = "移除玩家", Default = false, Tooltip = "Uses up other players' tools by spamming." }):AddKeyPicker("SpamToolsKey", { Default = "G", SyncToggleState = false, Mode = "Hold", Text = "spam", NoUI = false })
ExploitTroll:AddInput("WhitelistSpamTools", { Default = "", Numeric = false, Finished = true, ClearTextOnFocus = true, Text = "移出白名单", Callback = function(Value)
    -- Callback logic here
end })

-- The Rooms features
local RoomsGroup = Tabs.Misc:AddRightGroupbox("The Rooms")
RoomsGroup:AddCheckbox("AutoRooms", {
    Text = "自动rooms",
    Default = false,
    Disabled = false,
    Callback = function(enabled)
        local Players = game:GetService("Players")
        local RunService = game:GetService("RunService")
        local PathfindingService = game:GetService("PathfindingService")
        local ReplicatedStorage = game:GetService("ReplicatedStorage")
        local Workspace = game:GetService("Workspace")
        local player = Players.LocalPlayer
        local rooms = Workspace:WaitForChild("CurrentRooms")
        local gameData = ReplicatedStorage:WaitForChild("GameData")
        local floor = gameData:WaitForChild("Floor")
        local active = false
        local runner
        local clone
        local function stop()
            active = false
            if runner then
                runner:Disconnect()
                runner = nil
            end
            if clone and clone.Parent then
                clone:Destroy()
            end
            player:SetAttribute("运行中", false)
        end
        if not enabled then
            stop()
            return
        end
        player:SetAttribute("AutoRoomsActive", true)
        active = true
        if player.Character and player.Character:FindFirstChild("CollisionPart") then
            clone = player.Character.CollisionPart:Clone()
            clone.Name = "_AutoRoomsCollision"
            clone.Massless = true
            clone.Anchored = false
            clone.CanCollide = false
            clone.CanQuery = false
            clone.CustomPhysicalProperties = PhysicalProperties.new(0.01, 0.7, 0, 1, 1)
            clone.Parent = player.Character
        end
        local function findClosestLocker()
            local best, bestDist = nil, math.huge
            for _, obj in ipairs(rooms:GetDescendants()) do
                if obj.Name == "Rooms_Locker" or obj.Name == "Rooms_Locker_Fridge" then
                    if obj.PrimaryPart then
                        local dist = (player.Character.HumanoidRootPart.Position - obj.PrimaryPart.Position).Magnitude
                        if dist < bestDist then
                            best = obj
                            bestDist = dist
                        end
                    end
                end
            end
            return best
        end
        local function walkTo(target)
            local char = player.Character
            if not (char and char:FindFirstChild("HumanoidRootPart")) then return end
            local path = PathfindingService:CreatePath({
                AgentRadius = 2,
                AgentHeight = 1,
                AgentCanJump = false,
                WaypointSpacing = 5
            })
            path:ComputeAsync(char.HumanoidRootPart.Position, target.Position)
            if path.Status == Enum.PathStatus.Success then
                for _, waypoint in ipairs(path:GetWaypoints()) do
                    if not active then return end
                    char:FindFirstChildOfClass("Humanoid"):MoveTo(waypoint.Position)
                    char.Humanoid.MoveToFinished:Wait()
                end
            end
        end
        runner = RunService.Heartbeat:Connect(function()
            if not active then return end
            if floor.Value ~= "Rooms" then return stop() end
            if gameData.LatestRoom.Value >= 1000 then return stop() end
            local entity = Workspace:FindFirstChild("A60")
                or Workspace:FindFirstChild("A120")
                or Workspace:FindFirstChild("GlitchRush")
                or Workspace:FindFirstChild("GlitchAmbush")
            if entity and entity.PrimaryPart and entity.PrimaryPart.Position.Y > -6 then
                local locker = findClosestLocker()
                if locker and locker.PrimaryPart then
                    local hide = locker:FindFirstChild("HidePoint")
                    if not hide then
                        hide = Instance.new("Part")
                        hide.Name = "HidePoint"
                        hide.Anchored = true
                        hide.Transparency = 1
                        hide.CanCollide = false
                        hide.Position = locker.PrimaryPart.Position + locker.PrimaryPart.CFrame.LookVector * 7
                        hide.Parent = locker
                    end
                    walkTo(hide)
                    task.wait(0.1)
                    local prompt = locker:FindFirstChildOfClass("ProximityPrompt")
                    if prompt then
                        if fireproximityprompt then
                            fireproximityprompt(prompt)
                        else
                            prompt:InputHoldBegin()
                            prompt:InputHoldEnd()
                        end
                    end
                end
            else
                local currentRoom = gameData.LatestRoom.Value
                local door = rooms[currentRoom] and rooms[currentRoom]:FindFirstChild("Door", true)
                if door and door:FindFirstChild("Door") then
                    walkTo(door.Door)
                end
            end
        end)
    end
})

-- 即时互动功能
local InstantInteractGroup = Tabs.Misc:AddLeftGroupbox("即时互动")
InstantInteractGroup:AddToggle("NoCooldownProximity", {
    Text = "即时互动",
    Default = false,
    Callback = function(Value)
        _G.NoCooldownProximity = Value
        if _G.NoCooldownProximity == true then
            for i, v in pairs(workspace:GetDescendants()) do
                if v.ClassName == "ProximityPrompt" then
                    v.HoldDuration = 0
                end
            end
            CooldownProximity = workspace.DescendantAdded:Connect(function(Cooldown)
                if _G.NoCooldownProximity == true then
                    if Cooldown:IsA("ProximityPrompt") then
                        Cooldown.HoldDuration = 0
                    end
                end
            end)
        else
            if CooldownProximity then
                CooldownProximity:Disconnect()
                CooldownProximity = nil
            end
        end
        Library:Notify({
            Title = "doors",
            Content = Value and "已开启即时互动" or "已关闭即时互动",
            Icon = Value and "check" or "x",
            IconThemed = true,
            Duration = 5,
        })
    end
})

-- 自动互动功能
_G.Aura = {
    "ActivateEventPrompt",
    "AwesomePrompt",
    "FusesPrompt",
    "HerbPrompt",
    "LeverPrompt",
    "LootPrompt",
    "ModulePrompt",
    "SkullPrompt",
    "UnlockPrompt",
    "ValvePrompt",
}

local AutoInteractGroup = Tabs.Misc:AddLeftGroupbox("自动互动")
AutoInteractGroup:AddToggle("AutoLoot", {
    Text = "自动互动",
    Default = false,
    Callback = function(Value)
        _G.AutoLoot = Value
        if _G.AutoLoot then
            lootables = {}
            local function LootCheck(v)
                if not table.find(lootables, v) and v.Name ~= "Groundskeeper" and v:IsA("ProximityPrompt") and table.find(_G.Aura, v.Name) then
                    table.insert(lootables, v)
                end
            end
            for _, v in ipairs(workspace:GetDescendants()) do
                if v:IsA("ProximityPrompt") then
                    LootCheck(v)
                end
            end
            ChildAllNext = workspace.DescendantAdded:Connect(function(v)
                if v:IsA("ProximityPrompt") then
                    LootCheck(v)
                end
            end)
            RemoveChild = workspace.DescendantRemoving:Connect(function(v)
                for i = #lootables, 1, -1 do
                    if lootables[i] == v then
                        table.remove(lootables, i)
                        break
                    end
                end
            end)
        else
            if ChildAllNext then
                ChildAllNext:Disconnect()
                ChildAllNext = nil
            end
            if RemoveChild then
                RemoveChild:Disconnect()
                RemoveChild = nil
            end
        end
        while _G.AutoLoot do
            for i, v in pairs(lootables) do
                if v:IsA("ProximityPrompt") and table.find(_G.Aura, v.Name) and (v:GetAttribute("Interactions") == nil or v:GetAttribute("Interactions") <= 2) then
                    if Distance(v.Parent:GetPivot().Position) <= 12 then
                        fireproximityprompt(v)
                    end
                end
            end
            task.wait(0.1)
        end
    end
})

if LocalPlayer.Character:FindFirstChild("CollisionPart") then
    ClonedCollision = LocalPlayer.Character.CollisionPart:Clone()
    ClonedCollision.Name = "_CollisionClone"
    ClonedCollision.Massless = true
    ClonedCollision.Parent = LocalPlayer.Character
    ClonedCollision.CanCollide = false
    ClonedCollision.CanQuery = false
    ClonedCollision.CustomPhysicalProperties = PhysicalProperties.new(0.01, 0.7, 0, 1, 1)
end

task.spawn(function()
    while task.wait(0.23) and not Unloaded do
        if Toggles.SpeedBypass.Value and ClonedCollision then
            ClonedCollision.Massless = false
            task.wait(0.23)
            if LocalPlayer.Character.HumanoidRootPart.Anchored then
                ClonedCollision.Massless = true
                task.wait(1)
            end
            ClonedCollision.Massless = true
        end
    end
end)

local MovementScript = LocalPlayer.PlayerGui.MainUI.Initiator.Main_Game.Movement
local env = getsenv(MovementScript)
local updatespeed = env.updatespeed
local OldUpdateSpeed; OldUpdateSpeed = hookfunction(updatespeed, function(...)
    OldUpdateSpeed(...)
    local Speed = LocalPlayer.Character.Humanoid.WalkSpeed
    if Toggles.WalkspeedModifier.Value then
        Speed = Options.WalkspeedAmount.Value
    end
    LocalPlayer.Character.Humanoid.WalkSpeed = Speed
end)

-- 修复：添加缺失的变量和函数
local CanJump = LocalPlayer.Character:GetAttribute("CanJump") or false

-- 修复：添加table.find函数（如果不存在）
if not table.find then
    table.find = function(t, value)
        for i, v in ipairs(t) do
            if v == value then
                return i
            end
        end
        return nil
    end
end

-- 修复：添加Color3.fromRGB函数（如果不存在）
if not Color3.fromRGB then
    Color3.fromRGB = function(r, g, b)
        return Color3.new(r/255, g/255, b/255)
    end
end

local SaveManager = Library.SaveManager
local ThemeManager = Library.ThemeManager

SaveManager:SetLibrary(Library)
SaveManager:IgnoreThemeSettings()
SaveManager:SetFolder("velocityx_configs")
SaveManager:BuildConfigSection(Tabs.UISettings)

ThemeManager:SetLibrary(Library)
ThemeManager:SetFolder("velocityx_themes")
ThemeManager:BuildThemeSection(Tabs.UISettings)

local UISettingsGroup = Tabs.UISettings:AddLeftGroupbox("UI Management")
UISettingsGroup:AddButton("Unload", function()
    for toggleName, toggle in pairs(Toggles) do
        if toggle.Value then
            toggle.Value = false
        end
    end
    
    for _, conn in pairs(AntiConnections) do
        if conn then
            conn:Disconnect()
        end
    end
    
    stopFly()
    clearAllDoorESPs()
    
    for category, subs in pairs(EspTable) do
        if type(subs) == "table" then
            for sub, esps in pairs(subs) do
                if type(esps) == "table" then
                    for _, esp in pairs(esps) do
                        if esp[1] then esp[1]:Destroy() end
                        if esp[2] then esp[2]:Destroy() end
                    end
                end
            end
        end
    end
    
    game.Lighting.Brightness = oldBrightness
    game.Lighting.ClockTime = oldClockTime
    game.Lighting.FogEnd = oldFogEnd
    game.Lighting.GlobalShadows = oldGlobalShadows
    game.Lighting.Ambient = oldAmbient
    Unloaded = true
    Library:Unload()
end)

-- 内存优化：定期垃圾回收
task.spawn(function()
    while not Unloaded do
        task.wait(30)
        collectgarbage("step")
    end
end)

Library:Notify("Old Winter DOORS 已加载!", 5)
    end
})

Tabs.ScriptCenter:Button({
    Title = "Old Winter FSK",
    Desc = "点击运行EX",
    Callback = function()
        


local repo = 'https://raw.githubusercontent.com/deividcomsono/Obsidian/main/'

local Library = loadstring(game:HttpGet(repo .. 'Library.lua'))()
local ThemeManager = loadstring(game:HttpGet(repo .. 'addons/ThemeManager.lua'))()
local SaveManager = loadstring(game:HttpGet(repo .. 'addons/SaveManager.lua'))()
local Options = Library.Options
local Toggles = Library.Toggles
Library.ShowToggleFrameInKeybinds = true 
Library.ShowCustomCursor = true
Library.NotifySide = "Right"

local Window = Library:CreateWindow({
	Title = ' Old Winter Forken',
	Footer = "XiaoXu | FORSKEN",
    Icon = 132702574859512,
	Center = true,
	AutoShow = true,
	Resizable = true,
	ShowCustomCursor = true,
	NotifySide = "Right",
	TabPadding = 8,
	MenuFadeTime = 0
})


local Tabs = {
    new = Window:AddTab('公告', 'person-standing'),
	Main = Window:AddTab('杂项','house'),
	Bro = Window:AddTab('战斗','biohazard'),
	zdx = Window:AddTab('修机','printer'),
	Sat = Window:AddTab('体力','zap'),
	Esp = Window:AddTab('绘制','eye'),
	Aimbot = Window:AddTab('自瞄','crosshair'),
	tzq = Window:AddTab('通知','mails'),
	ani = Window:AddTab('反效果','cpu'),
   ["UI Settings"] = Window:AddTab('UI 调试', 'settings')
	
}


local _env = getgenv and getgenv() or {}
local _hrp = game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart")

local new = Tabs.new:AddRightGroupbox('群组')



new:AddButton({
	Text = "复制QQ群号[WU主群]",
	Func = function()
		setclipboard("1053715085")
	end,
	DoubleClick = false,

	Tooltip = "This is the main button",
	DisabledTooltip = "I am disabled!",

	Disabled = false, 
	Visible = true, 
	Risky = false, 
})

new:AddButton({
	Text = "复制QQ群号[NOL主群]",
	Func = function()
		setclipboard("819518685")
	end,
	DoubleClick = false,

	Tooltip = "This is the main button",
	DisabledTooltip = "I am disabled!",

	Disabled = false, 
	Visible = true, 
	Risky = false, 
})



local new = Tabs.new:AddLeftGroupbox('公告')

new:AddLabel("XiaoXu&yuxinchen")
new:AddLabel("FORSAKEN")







local MainTabbox = Tabs.Main:AddRightTabbox()
local Lighting = MainTabbox:AddTab("亮度")

Lighting:AddSlider("B",{
    Text = "亮度",
    Min = 0,
    Default = 0,
    Max = 3,
    Rounding = 1,
    Compact = true,
    Callback = function(v)
        _env.Brightness = v
    end
})

Lighting:AddToggle("无阴影",{
    Text = "无阴影",
    Default = false,
    Callback = function(v)
        _env.GlobalShadows = v
    end
})

Lighting:AddToggle("除雾",{
    Text = "无雾",
    Default = false,
    Callback = function(v)
        _env.NoFog = v
    end
})

Lighting:AddDivider()

Lighting:AddToggle("启用功能",{
    Text = "启用",
    Default = false,
    Callback = function(v)
        _env.Fullbright = v
        game:GetService("RunService").RenderStepped:Connect(function()
            if not game.Lighting:GetAttribute("FogStart") then 
                game.Lighting:SetAttribute("FogStart", game.Lighting.FogStart) 
            end
            if not game.Lighting:GetAttribute("FogEnd") then 
                game.Lighting:SetAttribute("FogEnd", game.Lighting.FogEnd) 
            end
            game.Lighting.FogStart = _env.NoFog and 0 or game.Lighting:GetAttribute("FogStart")
            game.Lighting.FogEnd = _env.NoFog and math.huge or game.Lighting:GetAttribute("FogEnd")
            
            local fog = game.Lighting:FindFirstChildOfClass("Atmosphere")
            if fog then
                if not fog:GetAttribute("Density") then 
                    fog:SetAttribute("Density", fog.Density) 
                end
                fog.Density = _env.NoFog and 0 or fog:GetAttribute("Density")
            end
            
            if _env.Fullbright then
                game.Lighting.OutdoorAmbient = Color3.new(1,1,1)
                game.Lighting.Brightness = _env.Brightness or 0
                game.Lighting.GlobalShadows = not _env.GlobalShadows
            else
                game.Lighting.OutdoorAmbient = Color3.fromRGB(55,55,55)
                game.Lighting.Brightness = 0
                game.Lighting.GlobalShadows = true
            end
        end)
    end
    
})

local KillerSurvival = Tabs.Main:AddLeftGroupbox("显示聊天框")

KillerSurvival:AddToggle('MyToggle', {
    Text = '显示聊天框 | 一局一开',
    Default = false,
    Tooltip = 'Display chat box',
    Callback = function(state)
    if state then
    game.TextChatService.ChatWindowConfiguration.Enabled = true
    else
    game.TextChatService.ChatWindowConfiguration.Enabled = false    
    end
    end
})

local AntiBanSection = Tabs.Main:AddLeftGroupbox("Anti Cheat")

do
    local Players = game:GetService("Players")
    local LocalPlayer = Players.LocalPlayer
    local LocalizationService = game:GetService("LocalizationService")
    local RunService = game:GetService("RunService")

    shared.AntiBanSafe = shared.AntiBanSafe or {running = false, hooks = {}}
    local data = shared.AntiBanSafe

    local oldNamecall, oldIndex
    local protectionThread

    -- 初始化hooks表
    data.hooks = data.hooks or {
        requestHooked = false,
        findHooked = false,
        bypassHooked = false
    }

    local function safe(func, ...)
        local ok, res = pcall(func, ...)
        if ok then return res end
        return nil
    end

    local function disableReportFlags()
        if type(setfflag) == "function" then
            pcall(function()
                setfflag("AbuseReportScreenshot", "False")
                setfflag("AbuseReportScreenshotPercentage", "0")
                setfflag("AbuseReportEnabled", "False")
                setfflag("ReportAbuseMenu", "False")
                setfflag("EnableAbuseReportScreenshot", "False")
                setfflag("AbuseReportVideo", "False")
                setfflag("AbuseReportVideoPercentage", "0")
                setfflag("VideoCaptureEnabled", "False")
                setfflag("RecordVideo", "False")
            end)
        end
    end

    local function hookRequests()
        if data.hooks.requestHooked then return true end
        
        local oldRequest = (syn and syn.request) or (request and request) or (http_request and http_request)
        if type(oldRequest) == "function" and type(hookfunction) == "function" then
            local success = pcall(function()
                hookfunction(oldRequest, function(req)
                    if req and req.Url and tostring(req.Url):lower():find("abuse") then
                        return {StatusCode = 200, Body = "Blocked"}
                    end
                    return oldRequest(req)
                end)
            end)
            
            if success then
                data.hooks.requestHooked = true
                return true
            end
        end
        return false
    end

    local function hookFindFirstChild()
        if data.hooks.findHooked then return true end
        
        local oldFind = workspace.FindFirstChild
        if type(oldFind) == "function" and type(hookfunction) == "function" then
            local success = pcall(function()
                hookfunction(oldFind, function(self, name, ...)
                    if checkcaller and checkcaller() then 
                        return oldFind(self, name, ...) 
                    end
                    if name and tostring(name):lower():find("screenshot") then 
                        return nil 
                    end
                    if name and tostring(name):lower():find("video") then 
                        return nil 
                    end
                    return oldFind(self, name, ...)
                end)
            end)
            
            if success then
                data.hooks.findHooked = true
                return true
            end
        end
        return false
    end

    local function setupMetatableHooks()
        if data.hooks.bypassHooked then return true end
        
        if getrawmetatable and hookmetamethod and newcclosure then
            local success = pcall(function()
                local mt = getrawmetatable(game)
                if not mt then return false end
                
                setreadonly(mt, false)
                
                -- 保存原始方法
                oldNamecall = oldNamecall or mt.__namecall
                oldIndex = oldIndex or mt.__index

                -- 设置namecall hook
                mt.__namecall = newcclosure(function(self, ...)
                    if checkcaller and checkcaller() then
                        return oldNamecall(self, ...)
                    end
                    
                    local method = getnamecallmethod()
                    local args = {...}

                    if (method == "Kick" or method == "Ban") and self == LocalPlayer then 
                        return nil 
                    end

                    if (method == "FireServer" or method == "InvokeServer") and args[1] then
                        local msg = tostring(args[1]):lower()
                        if msg:find("kick") or msg:find("ban") or msg:find("report") then 
                            return nil 
                        end
                    end

                    if self == LocalizationService and method == "GetCountryRegionForPlayerAsync" then
                        local success, result = pcall(function()
                            return LocalizationService:GetCountryRegionForPlayerAsync(LocalPlayer)
                        end)
                        if success then return result else return "US" end
                    end

                    return oldNamecall(self, ...)
                end)

                -- 设置index hook
                mt.__index = newcclosure(function(t, k)
                    if checkcaller and checkcaller() then
                        return oldIndex(t, k)
                    end
                    
                    local key = tostring(k):lower()
                    if key:find("kick") or key:find("ban") or key:find("report") then 
                        return function() return nil end 
                    end
                    return oldIndex(t, k)
                end)

                setreadonly(mt, true)
            end)
            
            if success then
                data.hooks.bypassHooked = true
                return true
            end
        end
        return false
    end

    local function restoreMetatableHooks()
        if getrawmetatable and oldNamecall and oldIndex then
            pcall(function()
                local mt = getrawmetatable(game)
                if mt then
                    setreadonly(mt, false)
                    mt.__namecall = oldNamecall
                    mt.__index = oldIndex
                    setreadonly(mt, true)
                end
            end)
        end
    end

    local function startProtectionLoop()
        if protectionThread then
            task.cancel(protectionThread)
        end
        
        protectionThread = task.spawn(function()
            local lastCheck = os.clock()
            local checkCount = 0
            
            while data.running do
                local currentTime = os.clock()
                
                -- 每2秒执行一次完整的flag检查
                if currentTime - lastCheck >= 2 then
                    disableReportFlags()
                    lastCheck = currentTime
                    checkCount = checkCount + 1
                    
                    -- 每10次检查（20秒）输出一次调试信息
                    if checkCount % 10 == 0 then
                        print(string.format("[AntiCheat] Protection loop running - Check #%d", checkCount))
                    end
                end
                
                -- 使用小延迟避免占用过多CPU
                task.wait(0.1)
            end
            print("[AntiCheat] Protection loop stopped")
        end)
    end

    local function startAntiBanSafe()
        if data.running then 
            Library:Notify("Anti Cheat | Info\n反作弊绕过已在运行中")
            return true
        end
        
        -- 检查必要的exploit函数
        if not (getrawmetatable and hookmetamethod and newcclosure) then
            Library:Notify("Exploit不支持必要的函数")
            return false
        end

        data.running = true

        -- 异步执行避免卡顿
        task.spawn(function()
            local hooksApplied = 0
            local totalHooks = 3
            
            -- 应用hooks
            if hookRequests() then hooksApplied = hooksApplied + 1 end
            if hookFindFirstChild() then hooksApplied = hooksApplied + 1 end
            if setupMetatableHooks() then hooksApplied = hooksApplied + 1 end
            
            -- 启动保护循环
            startProtectionLoop()

            if hooksApplied > 0 then
                Library:Notify(string.format("Anti Cheat | Success\n绕过反作弊已开启！(%d/%d hooks)", hooksApplied, totalHooks))
                print("[AntiCheat] Anti-ban protection activated successfully")
            else
                Library:Notify("Anti Cheat | Warning\n部分hook应用失败")
            end
        end)
        
        return true
    end

    local function stopAntiBanSafe()
        if not data.running then return end
        
        print("[AntiCheat] Stopping anti-ban protection...")
        data.running = false
        
        -- 停止保护线程
        if protectionThread then
            task.cancel(protectionThread)
            protectionThread = nil
        end
        
        -- 异步恢复hooks
        task.spawn(function()
            restoreMetatableHooks()
            
            -- 重置hook状态
            data.hooks.requestHooked = false
            data.hooks.findHooked = false
            data.hooks.bypassHooked = false
            oldNamecall = nil
            oldIndex = nil
            
            Library:Notify("Anti Cheat | Info\n反作弊绕过已关闭")
            print("[AntiCheat] Anti-ban protection fully stopped")
        end)
    end

    local function toggleAntiBan(enabled)
        if enabled then
            return startAntiBanSafe()
        else
            stopAntiBanSafe()
            return true
        end
    end

    
    AntiBanSection:AddToggle("AntiBanToggle", {
        Text = "绕过AC",
        Default = data.running or false,
        Callback = function(enabled)
            local success = toggleAntiBan(enabled)
            if not success and enabled then
           
                task.spawn(function()
                    wait(0.1)
                    if AntiBanSection:GetToggle("AntiBanToggle") then
                        AntiBanSection:GetToggle("AntiBanToggle"):SetValue(false)
                    end
                end)
            end
        end
    })

   
    if data.running then
        task.spawn(function()
            wait(1)
            if AntiBanSection:GetToggle("AntiBanToggle") then
                AntiBanSection:GetToggle("AntiBanToggle"):SetValue(true)
                print("[AntiCheat] Restored previous anti-ban protection state")
            end
        end)
    end

  
    print(string.format("[AntiCheat] Initialized - Running: %s", tostring(data.running)))
end




do
    local Players = game:GetService("Players")
    local LocalPlayer = Players.LocalPlayer
    local LocalizationService = game:GetService("LocalizationService")

    shared.AntiBanSafe = shared.AntiBanSafe or {running = false, hooks = {}}
    local data = shared.AntiBanSafe

    local oldNamecall, oldIndex
    local protectionThread

    local function safe(func, ...)
        local ok, res = pcall(func, ...)
        if ok then return res end
    end

    local function disableReportFlags()
        if typeof(setfflag) == "function" then
            pcall(function()
                setfflag("AbuseReportScreenshot", "False")
                setfflag("AbuseReportScreenshotPercentage", "0")
                setfflag("AbuseReportEnabled", "False")
                setfflag("ReportAbuseMenu", "False")
                setfflag("EnableAbuseReportScreenshot", "False")
                setfflag("AbuseReportVideo", "False")
                setfflag("AbuseReportVideoPercentage", "0")
                setfflag("VideoCaptureEnabled", "False")
                setfflag("RecordVideo", "False")
            end)
        end
    end

    local function setFlagsOn()
        if typeof(setfflag) == "function" then
            pcall(function()
                setfflag("AbuseReportScreenshot", "True")
                setfflag("AbuseReportScreenshotPercentage", "100")
            end)
        end
    end

    local function hookRequests()
        if data.hooks.requestHooked then return end
        local oldRequest = (syn and syn.request) or request or http_request
        if typeof(oldRequest) == "function" and typeof(hookfunction) == "function" then
            hookfunction(oldRequest, function(req)
                if req and req.Url and tostring(req.Url):lower():find("abuse") then
                    return {StatusCode = 200, Body = "Blocked"}
                end
                return oldRequest(req)
            end)
            data.hooks.requestHooked = true
        end
    end

    local function hookFindFirstChild()
        if data.hooks.findHooked then return end
        local oldFind = workspace.FindFirstChild
        if typeof(oldFind) == "function" and typeof(hookfunction) == "function" then
            hookfunction(oldFind, function(self, name, ...)
                if name and tostring(name):lower():find("screenshot") then return nil end
                if name and tostring(name):lower():find("video") then return nil end
                return oldFind(self, name, ...)
            end)
            data.hooks.findHooked = true
        end
    end

    local function safeBypass()
        if getrawmetatable and hookmetamethod and newcclosure then
            local mt = getrawmetatable(game)
            setreadonly(mt, false)
            oldNamecall = oldNamecall or mt.__namecall
            oldIndex = oldIndex or mt.__index

            mt.__namecall = newcclosure(function(self, ...)
                local method = getnamecallmethod()
                local args = {...}

                if (method == "Kick" or method == "Ban") and self == LocalPlayer then return nil end

                if (method == "FireServer" or method == "InvokeServer") and args[1] then
                    local msg = tostring(args[1]):lower()
                    if msg:find("kick") or msg:find("ban") then return nil end
                end

                if self == LocalizationService and method == "GetCountryRegionForPlayerAsync" then
                    local success, result = pcall(function()
                        return LocalizationService:GetCountryRegionForPlayerAsync(LocalPlayer)
                    end)
                    if success then return result else return "US" end
                end

                return oldNamecall(self, ...)
            end)

            mt.__index = newcclosure(function(t, k)
                local key = tostring(k):lower()
                if key:find("kick") or key:find("ban") then return function() return nil end end
                return oldIndex(t, k)
            end)

            setreadonly(mt, true)
        end
    end

    local function restoreHooks()
        if getrawmetatable then
            local mt = getrawmetatable(game)
            setreadonly(mt, false)
            if oldNamecall then mt.__namecall = oldNamecall end
            if oldIndex then mt.__index = oldIndex end
            setreadonly(mt, true)
            oldNamecall, oldIndex = nil, nil
        end
    end

    local function startAntiBanSafe()
        if data.running then return end
        data.running = true

        safe(hookRequests)
        safe(hookFindFirstChild)
        safe(safeBypass)

        protectionThread = task.spawn(function()
            while data.running do
                safe(disableReportFlags)
                task.wait(0.2)
            end
        end)
    end

    local function stopAntiBanSafe()
        data.running = false
        protectionThread = nil
        restoreHooks()
        setFlagsOn()
    end

    AntiBanSection:AddToggle("AntiBanV3", {
        Text = "Anti Ban",
        Description = "保护您免受封禁和举报",
        Default = false,
        Callback = function(state)
            if state then
                startAntiBanSafe()
            else
                stopAntiBanSafe()
            end
        end
    })
end


local ZZ = Tabs.Main:AddLeftGroupbox('绕过飞行')

local CFSpeed = 50
local CFLoop = nil

local function StartCFly()
    local speaker = game.Players.LocalPlayer
    local character = speaker.Character
    if not character then return end
    
    local humanoid = character:FindFirstChildOfClass('Humanoid')
    local head = character:WaitForChild("Head")
    
    if not humanoid or not head then return end
    
    humanoid.PlatformStand = true
    head.Anchored = true
    
    if CFLoop then 
        CFLoop:Disconnect() 
        CFLoop = nil
    end
    
    CFLoop = RunService.Heartbeat:Connect(function(deltaTime)
        if not character or not humanoid or not head then 
            if CFLoop then 
                CFLoop:Disconnect() 
                CFLoop = nil
            end
            return 
        end
        
        local moveDirection = humanoid.MoveDirection * (CFSpeed * deltaTime)
        local headCFrame = head.CFrame
        local camera = workspace.CurrentCamera
        local cameraCFrame = camera.CFrame
        local cameraOffset = headCFrame:ToObjectSpace(cameraCFrame).Position
        cameraCFrame = cameraCFrame * CFrame.new(-cameraOffset.X, -cameraOffset.Y, -cameraOffset.Z + 1)
        local cameraPosition = cameraCFrame.Position
        local headPosition = headCFrame.Position

        local objectSpaceVelocity = CFrame.new(cameraPosition, Vector3.new(headPosition.X, cameraPosition.Y, headPosition.Z)):VectorToObjectSpace(moveDirection)
        head.CFrame = CFrame.new(headPosition) * (cameraCFrame - cameraPosition) * CFrame.new(objectSpaceVelocity)
    end)
end

local function StopCFly()
    local speaker = game.Players.LocalPlayer
    local character = speaker.Character
    
    if CFLoop then
        CFLoop:Disconnect()
        CFLoop = nil
    end
    
    if character then
        local humanoid = character:FindFirstChildOfClass('Humanoid')
        local head = character:FindFirstChild("Head")
        
        if humanoid then
            humanoid.PlatformStand = false
        end
        if head then
            head.Anchored = false
        end
    end
end

ZZ:AddToggle("CFlyToggle", {
    Text = "飞行",
    Default = false,
    Callback = function(Value)
        if Value then
            StartCFly()
        else
            StopCFly()
        end
    end
})

ZZ:AddSlider("CFlySpeed", {
    Text = "飞行速度",
    Default = 50,
    Min = 1,
    Max = 200,
    Rounding = 1,
    Callback = function(Value)
        CFSpeed = Value
    end
})


local FunGroup = Tabs.Main:AddRightGroupbox("后空翻")

local ff_connection = nil
local ff_enabled = false
local ff_cd = false
local jumpHeight = 72  -- 默认高度: 6 * 12 = 72
local jumpDistance = 35  -- 默认距离

local function Flip()
    if ff_cd then
        return
    end
    ff_cd = true
    local character = game.Players.LocalPlayer.Character
    if not character then
        ff_cd = false
        return
    end
    local hrp = character:FindFirstChild("HumanoidRootPart")
    local Humanoid = character:FindFirstChildOfClass("Humanoid")
    local animator = Humanoid and Humanoid:FindFirstChildOfClass("Animator")
    if not hrp or not Humanoid then
        ff_cd = false
        return
    end
    local savedTracks = {}
    if animator then
        for _, track in ipairs(animator:GetPlayingAnimationTracks()) do
            savedTracks[#savedTracks + 1] = { track = track, time = track.TimePosition }
            track:Stop(0)
        end
    end
    Humanoid:ChangeState(Enum.HumanoidStateType.Physics)
    Humanoid:SetStateEnabled(Enum.HumanoidStateType.FallingDown, false)
    Humanoid:SetStateEnabled(Enum.HumanoidStateType.Freefall, false)
    Humanoid:SetStateEnabled(Enum.HumanoidStateType.Running, false)
    Humanoid:SetStateEnabled(Enum.HumanoidStateType.Seated, false)
    Humanoid:SetStateEnabled(Enum.HumanoidStateType.Climbing, false)
    local duration = 0.45
    local steps = 120
    local startCFrame = hrp.CFrame
    local forwardVector = startCFrame.LookVector
    local upVector = Vector3.new(0, 1, 0)
    task.spawn(function()
        local startTime = tick()
        for i = 1, steps do
            local t = i / steps
            local height = jumpHeight * (t - t ^ 2)  -- 使用滑块调节的高度
            local nextPos = startCFrame.Position + forwardVector * (jumpDistance * t) + upVector * height    
            local rotation = startCFrame.Rotation * CFrame.Angles(-math.rad(i * (360 / steps)), 0, 0)

            hrp.CFrame = CFrame.new(nextPos) * rotation
            local elapsedTime = tick() - startTime
            local expectedTime = (duration / steps) * i
            local waitTime = expectedTime - elapsedTime
            if waitTime > 0 then
                task.wait(waitTime)
            end
        end

        hrp.CFrame = CFrame.new(startCFrame.Position + forwardVector * jumpDistance) * startCFrame.Rotation
        Humanoid:SetStateEnabled(Enum.HumanoidStateType.FallingDown, true)
        Humanoid:SetStateEnabled(Enum.HumanoidStateType.Freefall, true)
        Humanoid:SetStateEnabled(Enum.HumanoidStateType.Running, true)
        Humanoid:SetStateEnabled(Enum.HumanoidStateType.Seated, true)
        Humanoid:SetStateEnabled(Enum.HumanoidStateType.Climbing, true)
        Humanoid:ChangeState(Enum.HumanoidStateType.Running)

        if animator then
            for _, data in ipairs(savedTracks) do
                local track = data.track
                track:Play()
                track.TimePosition = data.time
            end
        end
        task.wait(0.25)
        ff_cd = false
    end)
end

local sausageHolder = nil
local originalSize = nil
local ff_button = nil

local function SetFrontFlip(bool)
    ff_enabled = bool
    if ff_enabled == true then
        pcall(function()
            sausageHolder = game.CoreGui.TopBarApp.TopBarApp.UnibarLeftFrame.UnibarMenu["2"]
            originalSize = sausageHolder.Size.X.Offset
            ff_button = Instance.new("Frame", sausageHolder)
            ff_button.Size = UDim2.new(0, 48, 0, 44)
            ff_button.BackgroundTransparency = 1
            ff_button.BorderSizePixel = 0
            ff_button.Position = UDim2.new(0, sausageHolder.Size.X.Offset - 48, 0, 0)
            
            local imageButton = Instance.new("ImageButton", ff_button)
            imageButton.BackgroundTransparency = 1
            imageButton.BorderSizePixel = 0
            imageButton.Size = UDim2.new(0, 36, 0, 36)
            imageButton.AnchorPoint = Vector2.new(0.5, 0.5)
            imageButton.Position = UDim2.new(0.5, 0, 0.5, 0)
            imageButton.Image = "rbxthumb://type=Asset&id=2714338264&w=150&h=150"
            
            ff_connection = imageButton.Activated:Connect(Flip)
            sausageHolder.Size = UDim2.new(0, originalSize + 48, 0, sausageHolder.Size.Y.Offset)
            task.wait()
            ff_button.Position = UDim2.new(0, sausageHolder.Size.X.Offset - 48, 0, 0)
            
            task.spawn(function()
                pcall(function()
                    repeat
                        sausageHolder.Size = UDim2.new(0, originalSize + 48, 0, sausageHolder.Size.Y.Offset)
                        task.wait()
                        ff_button.Position = UDim2.new(0, sausageHolder.Size.X.Offset - 48, 0, 0)
                    until ff_enabled == false
                end)
            end)
        end)
    elseif ff_enabled == false then
        if ff_connection then
            ff_connection:Disconnect()
            ff_connection = nil
        end
        if ff_button then
            ff_button:Destroy()
            ff_button = nil
        end
        if sausageHolder then
            sausageHolder.Size = UDim2.new(0, originalSize, 0, sausageHolder.Size.Y.Offset)
        end
    end
end

FunGroup:AddToggle("Frontflip", {
    Text = "显示后空翻按钮",
    Default = false,
    Tooltip = "启用后空翻功能",
    Callback = function(Value)
        SetFrontFlip(Value)
        Library:Notify({
            Title = "后空翻",
            Description = Value and "后空翻已启用" or "后空翻已禁用",
            Time = 3,
        })
    end,
})

FunGroup:AddSlider("JumpHeight", {
    Text = "跳跃高度",
    Default = 72,
    Min = 20,
    Max = 200,
    Rounding = 0,
    Compact = false,
    Callback = function(Value)
        jumpHeight = Value
        Library:Notify({
            Title = "跳跃高度",
            Description = "已设置为: " .. Value,
            Time = 2,
        })
    end,
    Tooltip = "调节后空翻的跳跃高度",
})

FunGroup:AddSlider("JumpDistance", {
    Text = "跳跃距离",
    Default = 35,
    Min = 10,
    Max = 100,
    Rounding = 0,
    Compact = false,
    Callback = function(Value)
        jumpDistance = Value
        Library:Notify({
            Title = "跳跃距离",
            Description = "已设置为: " .. Value,
            Time = 2,
        })
    end,
    Tooltip = "调节后空翻的跳跃距离",
})



local LOL = Tabs.Bro:AddLeftTabbox()
local SM = LOL:AddTab("HitBox追踪")
local SM2 = LOL:AddTab("显示HitBox")



local HitboxTrackingEnabled = false
local HeartbeatConnection = nil
local MaxDistance = 120

SM:AddSlider("DistanceSlider", {
    Text = "追踪范围",
    Default = 120,
    Min = 1,
    Max = 300,
    Rounding = 0,
    Callback = function(value)
        MaxDistance = value
    end
})

SM:AddToggle("HitboxTrackingToggle", {
    Text = "Hitbox追踪",
    Default = false,
    Callback = function(state)
        HitboxTrackingEnabled = state
        
        if HeartbeatConnection then
            HeartbeatConnection:Disconnect()
            HeartbeatConnection = nil
        end
        
        if not state then return end
        
        repeat task.wait() until game:IsLoaded();

        local Players = game:GetService('Players');
        local Player = Players.LocalPlayer;
        local Character = Player.Character or Player.CharacterAdded:Wait();
        local Humanoid = Character:WaitForChild("Humanoid");
        local HumanoidRootPart = Character:WaitForChild("HumanoidRootPart");

        Player.CharacterAdded:Connect(function(NewCharacter)
            Character = NewCharacter;
            Humanoid = Character:WaitForChild("Humanoid");
            HumanoidRootPart = Character:WaitForChild("HumanoidRootPart");
        end);

     local AttackAnimations = {
    'rbxassetid://131430497821198',
    'rbxassetid://83829782357897',
    'rbxassetid://126830014841198',
    'rbxassetid://126355327951215',
    'rbxassetid://121086746534252',
    'rbxassetid://105458270463374',
    'rbxassetid://127172483138092',
    'rbxassetid://18885919947',
    'rbxassetid://18885909645',
    'rbxassetid://87259391926321',
    'rbxassetid://106014898528300',
    'rbxassetid://86545133269813',
    'rbxassetid://89448354637442',
    'rbxassetid://90499469533503',
    'rbxassetid://116618003477002',
    'rbxassetid://106086955212611',
    'rbxassetid://107640065977686',
    'rbxassetid://77124578197357',
    'rbxassetid://101771617803133',
    'rbxassetid://134958187822107',
    'rbxassetid://111313169447787',
    'rbxassetid://71685573690338',
    'rbxassetid://129843313690921',
    'rbxassetid://97623143664485',
    'rbxassetid://136007065400978',
    'rbxassetid://86096387000557',
    'rbxassetid://108807732150251',
    'rbxassetid://138040001965654',
    'rbxassetid://73502073176819',
    'rbxassetid://86709774283672',
    'rbxassetid://140703210927645',
    'rbxassetid://96173857867228',
    'rbxassetid://121255898612475',
    'rbxassetid://98031287364865',
    'rbxassetid://119462383658044',
    'rbxassetid://77448521277146',
    'rbxassetid://103741352379819',
    'rbxassetid://131696603025265',
    'rbxassetid://122503338277352',
    'rbxassetid://97648548303678',
    'rbxassetid://94162446513587',
    'rbxassetid://84426150435898',
    'rbxassetid://93069721274110',
    'rbxassetid://114620047310688',
    'rbxassetid://97433060861952',
    'rbxassetid://82183356141401',
    'rbxassetid://100592913030351',
    'rbxassetid://121293883585738',
    'rbxassetid://70447634862911',
    'rbxassetid://92173139187970',
    'rbxassetid://106847695270773',
    'rbxassetid://125403313786645',
    'rbxassetid://81639435858902',
    'rbxassetid://137314737492715',
    'rbxassetid://120112897026015',
    'rbxassetid://82113744478546',
    'rbxassetid://118298475669935',
    'rbxassetid://126681776859538',
    'rbxassetid://129976080405072',
    'rbxassetid://109667959938617',
    'rbxassetid://74707328554358',
    'rbxassetid://133336594357903',
    'rbxassetid://86204001129974',
    'rbxassetid://124243639579224',
    'rbxassetid://70371667919898',
    'rbxassetid://131543461321709',
    'rbxassetid://136323728355613',
    'rbxassetid://109230267448394',
    'rbxassetid://104744456957363',
    'rbxassetid://106538427162796',
    'rbxassetid://117451341682452',
    'rbxassetid://122580527125278',
    'rbxassetid://125504560920616',
    'rbxassetid://126896426760253',
    'rbxassetid://128923537868786',
    'rbxassetid://129491851057694',
    'rbxassetid://134053005930385',
    'rbxassetid://135884061951801',
    'rbxassetid://139321362207112',
    'rbxassetid://139835501033932',
    'rbxassetid://140042539182927',
    'rbxassetid://140061272138793',
    'rbxassetid://108018357044094',
    'rbxassetid://126171487400618',
    'rbxassetid://103699298199261',
    'rbxassetid://101031946095087',
    'rbxassetid://122709416391891',
    'rbxassetid://98456918873918',
    'rbxassetid://99135633258223',
    'rbxassetid://97167027849946'
};

        local RNG = Random.new();
        HeartbeatConnection = game:GetService('RunService').Heartbeat:Connect(function()
            if not HitboxTrackingEnabled or not HumanoidRootPart then
                return;
            end

            local Playing = false;
            for _,v in Humanoid:GetPlayingAnimationTracks() do
                if table.find(AttackAnimations, v.Animation.AnimationId) and (v.TimePosition / v.Length < 0.75) then
                    Playing = true;
                end
            end

            if not Playing then
                return;
            end

            local Target;
            local NearestDist = MaxDistance;

            local function loop(t)
                for _,v in t do
                    if v == Character or not v:FindFirstChild("HumanoidRootPart") then
                        continue;
                    end

                    local Dist = (v.HumanoidRootPart.Position - HumanoidRootPart.Position).Magnitude;

                    if Dist < NearestDist then
                        NearestDist = Dist;
                        Target = v;
                    end
                end
            end

            loop(workspace.Players:GetDescendants());
            loop(workspace.Map:FindFirstChild("NPCs", true):GetChildren());

            if not Target then
                return;
            end

            local OldVelocity = HumanoidRootPart.Velocity;
            local NeededVelocity =
            (Target.HumanoidRootPart.Position + Vector3.new(
                RNG:NextNumber(-1.5, 1.5),
                0,
                RNG:NextNumber(-1.5, 1.5)
            ) + (Target.HumanoidRootPart.Velocity * (Player:GetNetworkPing() * 1.25))
                - HumanoidRootPart.Position
            ) / (Player:GetNetworkPing() * 2);

            HumanoidRootPart.Velocity = NeededVelocity;
            game:GetService('RunService').RenderStepped:Wait();
            HumanoidRootPart.Velocity = OldVelocity;
        end);
    end,
})



local Workspace = game:GetService("Workspace")
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")

local player = Players.LocalPlayer
local playerName = player.Name
local hitbox = nil
local updateConnection = nil

local hitboxesFolder = Workspace:FindFirstChild("Hitboxes")
if not hitboxesFolder then
    hitboxesFolder = Instance.new("Folder")
    hitboxesFolder.Name = "Hitboxes"
    hitboxesFolder.Parent = Workspace
end

local function createHitbox()
    local part = Instance.new("Part")
    part.Name = playerName .. "_Hitbox"
    part.Size = Vector3.new(4, 7, 4)
    part.Anchored = true
    part.CanCollide = false
    part.Transparency = 0.5
    part.Material = Enum.Material.ForceField
    part.Color = Color3.fromRGB(255, 255, 200)
    part.Parent = hitboxesFolder
    return part
end

local function updateHitbox()
    local character = player.Character
    if character and character:FindFirstChild("HumanoidRootPart") and hitbox then
        local root = character.HumanoidRootPart
        local offset = root.CFrame.LookVector * 4
        hitbox.CFrame = CFrame.new(root.Position + offset, root.Position + root.CFrame.LookVector)
    end
end

SM2:AddToggle("打人", {
    Text = "显示HitBox",
    Default = false,
    Callback = function(state)
        if state then
            hitbox = createHitbox()
            updateConnection = RunService.RenderStepped:Connect(updateHitbox)
            
            player.CharacterAdded:Connect(function(char)
                task.wait(1)
                if hitbox then
                    hitbox:Destroy()
                end
                hitbox = createHitbox()
            end)
        else
            if updateConnection then
                updateConnection:Disconnect()
                updateConnection = nil
            end
            if hitbox then
                hitbox:Destroy()
                hitbox = nil
            end
        end
    end
})


getgenv().RS = game:GetService("ReplicatedStorage")
getgenv().RSvc = game:GetService("RunService")
getgenv().Plrs = game:GetService("Players")
getgenv().LocalP = Plrs.LocalPlayer

getgenv().buffer = buffer or require(game:GetService("ReplicatedStorage").Buffer)

getgenv().AutoBlockConfig = {
    Enabled = false,
    BaseDistance = 18,
    TargetAngle = 50,
    ShowVisualization = false,
    BlockCooldown = 1.2,
    AngleCheckEnabled = true
}



getgenv().AutoBlockSounds = {
    ["102228729296384"] = true,
    ["140242176732868"] = true,
    ["112809109188560"] = true,
    ["136323728355613"] = true,
    ["115026634746636"] = true,
    ["84116622032112"] = true,
    ["108907358619313"] = true,
    ["127793641088496"] = true,
    ["86174610237192"] = true,
    ["95079963655241"] = true,
    ["101199185291628"] = true,
    ["119942598489800"] = true,
    ["84307400688050"] = true,
    ["113037804008732"] = true,
    ["105200830849301"] = true,
    ["75330693422988"] = true,
    ["82221759983649"] = true,
    ["81702359653578"] = true,
    ["108610718831698"] = true,
    ["112395455254818"] = true,
    ["109431876587852"] = true,
    ["109348678063422"] = true,
    ["85853080745515"] = true,
    ["12222216"] = true,
    ["105840448036441"] = true,
    ["114742322778642"] = true,
    ["119583605486352"] = true,
    ["79980897195554"] = true,
    ["71805956520207"] = true,
    ["79391273191671"] = true,
    ["89004992452376"] = true,
    ["101553872555606"] = true,
    ["101698569375359"] = true,
    ["106300477136129"] = true,
    ["116581754553533"] = true,
    ["117231507259853"] = true,
    ["119089145505438"] = true,
    ["121954639447247"] = true,
    ["125213046326879"] = true,
    ["131406927389838"] = true,
    ["117173212095661"] = true,
    
}

getgenv().AutoBlockAnims = {
    ["126830014841198"] = true,
    ["126355327951215"] = true,
    ["121086746534252"] = true,
    ["18885909645"] = true,
    ["98456918873918"] = true,
    ["105458270463374"] = true,
    ["83829782357897"] = true,
    ["125403313786645"] = true,
    ["118298475669935"] = true,
    ["82113744478546"] = true,
    ["70371667919898"] = true,
    ["99135633258223"] = true,
    ["97167027849946"] = true,
    ["109230267448394"] = true,
    ["139835501033932"] = true,
    ["126896426760253"] = true,
    ["109667959938617"] = true,
    ["126681776859538"] = true,
    ["129976080405072"] = true,
    ["121293883585738"] = true,
    ["81639435858902"] = true,
    ["137314737492715"] = true,
    ["92173139187970"] = true
}

getgenv().AutoBlockEnabled = false
getgenv().SenseRange = 18
getgenv().SenseRangeSq = SenseRange * SenseRange

getgenv().KillersFolder = workspace:WaitForChild("Players"):WaitForChild("Killers")

getgenv().KillerVisualizations = {}
getgenv().LastBlockTime = 0
getgenv().DetectionConnection = nil

-- 快速角度检测
getgenv().IsFacingTarget = function(myRoot, targetRoot)
    if not AutoBlockConfig.AngleCheckEnabled then return true end
    local dir = (myRoot.Position - targetRoot.Position).Unit
    local dot = targetRoot.CFrame.LookVector:Dot(dir)
    local angle = math.deg(math.acos(math.clamp(dot, -1, 1)))
    return angle <= AutoBlockConfig.TargetAngle
end

-- 快速声音检测
getgenv().CheckSoundThreat = function(killer)
    local rootPart = killer:FindFirstChild("HumanoidRootPart")
    if not rootPart then return false end
    
    for _, sound in ipairs(rootPart:GetChildren()) do
        if sound:IsA("Sound") and sound.IsPlaying then
            local soundId = tostring(sound.SoundId)
            local numericId = soundId:match("%d+")
            if numericId and AutoBlockSounds[numericId] then
                return true
            end
        end
    end
    return false
end

-- 快速动画检测
getgenv().CheckAnimationThreat = function(killer)
    local humanoid = killer:FindFirstChildOfClass("Humanoid")
    if not humanoid then return false end
    
    local animator = humanoid:FindFirstChildOfClass("Animator")
    if not animator then return false end
    
    for _, track in ipairs(animator:GetPlayingAnimationTracks()) do
        if track.Animation then
            local animId = tostring(track.Animation.AnimationId)
            local numericId = animId:match("%d+")
            if numericId and AutoBlockAnims[numericId] then
                return true
            end
        end
    end
    return false
end

-- 格挡远程调用
getgenv().FireBlockRemote = function()
    if not AutoBlockEnabled then return end
    
    pcall(function()
        local args = {
            "UseActorAbility",
            {
                buffer.fromstring("\"Block\"")
            }
        }
        game:GetService("ReplicatedStorage"):WaitForChild("Modules"):WaitForChild("Network"):WaitForChild("RemoteEvent"):FireServer(unpack(args))
    end)
end

-- 主检测循环
getgenv().StartThreatDetection = function()
    if DetectionConnection then
        DetectionConnection:Disconnect()
    end
    
    DetectionConnection = RSvc.Heartbeat:Connect(function()
        if not AutoBlockEnabled then return end
        
        local currentTime = tick()
        if currentTime - LastBlockTime < AutoBlockConfig.BlockCooldown then return end
        
        local myCharacter = LocalP.Character
        if not myCharacter then return end
        
        local myRoot = myCharacter:FindFirstChild("HumanoidRootPart")
        if not myRoot then return end
        
        -- 快速遍历所有杀手
        for _, killer in ipairs(KillersFolder:GetChildren()) do
            local killerRoot = killer:FindFirstChild("HumanoidRootPart")
            if not killerRoot then continue end
            
            -- 快速距离检查
            local distance = (myRoot.Position - killerRoot.Position).Magnitude
            if distance > AutoBlockConfig.BaseDistance then continue end
            
            -- 快速角度检查
            if not IsFacingTarget(myRoot, killerRoot) then continue end
            
            -- 快速声音威胁检查
            if CheckSoundThreat(killer) then
                FireBlockRemote()
                LastBlockTime = currentTime
                return
            end
            
            -- 快速动画威胁检查
            if CheckAnimationThreat(killer) then
                FireBlockRemote()
                LastBlockTime = currentTime
                return
            end
        end
    end)
end

getgenv().StopThreatDetection = function()
    if DetectionConnection then
        DetectionConnection:Disconnect()
        DetectionConnection = nil
    end
end

-- 可视化系统
getgenv().CreateKillerVisualization = function(killer)
    if not killer:FindFirstChild("HumanoidRootPart") then return end
    if KillerVisualizations[killer] then return end
    
    local parts = {}
    
    local center = killer.HumanoidRootPart.Position
    local distance = AutoBlockConfig.BaseDistance
    local angle = AutoBlockConfig.AngleCheckEnabled and math.rad(AutoBlockConfig.TargetAngle) or math.rad(180)
    local segments = 8
    
    -- 中心点
    local centerPart = Instance.new("Part")
    centerPart.Size = Vector3.new(1, 1, 1)
    centerPart.Position = center + Vector3.new(0, 1, 0)
    centerPart.Shape = Enum.PartType.Ball
    centerPart.BrickColor = BrickColor.new("Bright red")
    centerPart.Material = Enum.Material.Neon
    centerPart.Transparency = 0.3
    centerPart.Anchored = true
    centerPart.CanCollide = false
    centerPart.Parent = workspace
    table.insert(parts, centerPart)
    
    -- 扇形边界点
    local edgePoints = {}
    for i = 0, segments do
        local segAngle = -angle + (i * (2 * angle) / segments)
        local cf = CFrame.fromAxisAngle(Vector3.new(0, 1, 0), segAngle)
        local dir = cf:VectorToWorldSpace(killer.HumanoidRootPart.CFrame.LookVector)
        local pos = center + dir * distance
        
        local point = Instance.new("Part")
        point.Size = Vector3.new(0.5, 0.5, 0.5)
        point.Position = pos + Vector3.new(0, 0.5, 0)
        point.Shape = Enum.PartType.Ball
        point.BrickColor = BrickColor.new("Bright yellow")
        point.Material = Enum.Material.Neon
        point.Transparency = 0.4
        point.Anchored = true
        point.CanCollide = false
        point.Parent = workspace
        table.insert(parts, point)
        table.insert(edgePoints, point)
    end
    
    -- 连接线
    for i, point in ipairs(edgePoints) do
        local att0 = Instance.new("Attachment")
        att0.Parent = centerPart
        
        local att1 = Instance.new("Attachment")
        att1.Parent = point
        
        local beam = Instance.new("Beam")
        beam.Attachment0 = att0
        beam.Attachment1 = att1
        beam.Color = ColorSequence.new(Color3.new(1, 1, 0))
        beam.Width0 = 0.1
        beam.Width1 = 0.1
        beam.FaceCamera = true
        beam.Parent = centerPart
        
        table.insert(parts, beam)
        table.insert(parts, att0)
        table.insert(parts, att1)
    end
    
    -- 扇形弧线
    for i = 1, #edgePoints - 1 do
        local att0 = Instance.new("Attachment")
        att0.Parent = edgePoints[i]
        
        local att1 = Instance.new("Attachment")
        att1.Parent = edgePoints[i + 1]
        
        local beam = Instance.new("Beam")
        beam.Attachment0 = att0
        beam.Attachment1 = att1
        beam.Color = ColorSequence.new(Color3.new(1, 0.5, 0))
        beam.Width0 = 0.1
        beam.Width1 = 0.1
        beam.FaceCamera = true
        beam.Parent = edgePoints[i]
        
        table.insert(parts, beam)
        table.insert(parts, att0)
        table.insert(parts, att1)
    end
    
    local connection = RSvc.Heartbeat:Connect(function()
        if not AutoBlockConfig.ShowVisualization or not killer.Parent then
            Cleanup()
            return
        end
        
        local centerPos = killer.HumanoidRootPart.Position + Vector3.new(0, 1, 0)
        local lookVec = killer.HumanoidRootPart.CFrame.LookVector
        local dist = AutoBlockConfig.BaseDistance
        local ang = AutoBlockConfig.AngleCheckEnabled and math.rad(AutoBlockConfig.TargetAngle) or math.rad(180)
        
        centerPart.Position = centerPos
        
        for i, point in ipairs(edgePoints) do
            local segAngle = -ang + ((i - 1) * (2 * ang) / (#edgePoints - 1))
            local cf = CFrame.fromAxisAngle(Vector3.new(0, 1, 0), segAngle)
            local dir = cf:VectorToWorldSpace(lookVec)
            local pos = centerPos + dir * dist
            point.Position = pos + Vector3.new(0, 0.5, 0)
        end
    end)
    
    local function Cleanup()
        connection:Disconnect()
        for _, part in ipairs(parts) do
            part:Destroy()
        end
        KillerVisualizations[killer] = nil
    end
    
    KillerVisualizations[killer] = {
        cleanup = Cleanup,
        connection = connection
    }
end

getgenv().RemoveKillerVisualization = function(killer)
    if KillerVisualizations[killer] then
        KillerVisualizations[killer].cleanup()
    end
end

getgenv().RefreshKillerVisualizations = function()
    for killer, _ in pairs(KillerVisualizations) do
        RemoveKillerVisualization(killer)
    end
    
    if AutoBlockConfig.ShowVisualization then
        for _, killer in ipairs(KillersFolder:GetChildren()) do
            CreateKillerVisualization(killer)
        end
    end
end

-- 事件监听
LocalP.CharacterAdded:Connect(function()
    if AutoBlockEnabled then
        StartThreatDetection()
    end
end)

KillersFolder.ChildAdded:Connect(function(killer)
    if AutoBlockConfig.ShowVisualization then
        CreateKillerVisualization(killer)
    end
end)

KillersFolder.ChildRemoved:Connect(function(killer)
    RemoveKillerVisualization(killer)
end)



local ZZ = Tabs.Bro:AddRightGroupbox('自动格挡[Guest 1337]')

local MS = Tabs.Bro:AddRightTabbox()
local ZZ = MS:AddTab("V1")
local ZZ2 = MS:AddTab("V2")
local NOL = MS:AddTab("拳击")

ZZ:AddToggle("AutoBlockToggle", {
    Text = "自动格挡",
    Default = false,
    Callback = function(state)
        AutoBlockEnabled = state
        AutoBlockConfig.Enabled = state
        if state then
            StartThreatDetection()
        else
            StopThreatDetection()
        end
    end
})

ZZ:AddSlider("SenseRangeSlider", {
    Text = "格挡距离",
    Default = 18,
    Min = 5,
    Max = 30,
    Rounding = 1,
    Callback = function(value)
        SenseRange = value
        SenseRangeSq = SenseRange * SenseRange
        AutoBlockConfig.BaseDistance = value
        if AutoBlockConfig.ShowVisualization then
            RefreshKillerVisualizations()
        end
    end
})

ZZ:AddToggle("AngleCheckToggle", {
    Text = "角度检测",
    Default = true,
    Callback = function(state)
        AutoBlockConfig.AngleCheckEnabled = state
        if AutoBlockConfig.ShowVisualization then
            RefreshKillerVisualizations()
        end
    end
})

ZZ:AddSlider("TargetAngleSlider", {
    Text = "格挡角度",
    Default = 50,
    Min = 10,
    Max = 180,
    Rounding = 1,
    Callback = function(value)
        AutoBlockConfig.TargetAngle = value
        if AutoBlockConfig.ShowVisualization then
            RefreshKillerVisualizations()
        end
    end
})

ZZ:AddToggle("VisualizationToggle", {
    Text = "可视化",
    Default = false,
    Callback = function(state)
        AutoBlockConfig.ShowVisualization = state
        if state then
            RefreshKillerVisualizations()
        else
            for killer, _ in pairs(KillerVisualizations) do
                RemoveKillerVisualization(killer)
            end
        end
    end
})



local config_114514 = {
    Enabled = false,
    BaseDistance = 16,
    ScanInterval = 0.0005,
    BlockCooldown = 0.06,
    MoveCompBase = 1.8,
    MoveCompFactor = 0.3,
    SpeedThreshold = 6,
    PredictBase = 5,
    PredictMax = 15,
    PredictFactor = 0.45,
    TargetAngle = 50,
    MinAttackSpeed = 10,
    ShowVisualization = false,
    EnablePrediction = false,
    PingCompensation = 0.15,
    FastKillerAdjust = 1.5,
    ReactionBoost = 1.2,
    TargetSoundIds = {
        "102228729296384", "140242176732868", "112809109188560", "136323728355613",
        "115026634746636", "84116622032112", "108907358619313", "127793641088496",
        "86174610237192", "95079963655241", "101199185291628", "119942598489800",
        "84307400688050", "113037804008732", "105200830849301", "75330693422988",
        "82221759983649", "81702359653578", "108610718831698", "112395455254818",
        "109431876587852", "109348678063422", "85853080745515", "12222216","119583605486352","78298577002481","117173212095661","112809109188560"    
    },
    TargetAnimIds = {
        "126830014841198", "126355327951215", "121086746534252", "18885909645",
        "98456918873918", "105458270463374", "83829782357897", "125403313786645",
        "118298475669935", "82113744478546", "70371667919898", "99135633258223",
        "97167027849946", "109230267448394", "139835501033932", "126896426760253",
        "109667959938617", "126681776859538", "129976080405072", "121293883585738",
        "81639435858902", "137314737492715", "92173139187970"
    }
}

pcall(function()
    local Players = game:GetService("Players")
    local ReplicatedStorage = game:GetService("ReplicatedStorage")
    local RunService = game:GetService("RunService")
    local Stats = game:GetService("Stats")
    
    local soundLookup = {}
    for _, id in ipairs(config_114514.TargetSoundIds) do
        soundLookup[id] = true
        soundLookup["rbxassetid://" .. id] = true
    end
    
    local animLookup = {}
    for _, id in ipairs(config_114514.TargetAnimIds) do
        animLookup[id] = true
        animLookup["rbxassetid://" .. id] = true
    end
    
    local LocalPlayer = Players.LocalPlayer
    local lastBlockTime = 0
    local combatConnection = nil
    local lastScanTime = 0
    local visualizationParts = {}
    local soundCache = {}
    local animCache = {}
    local lastSoundCheck = 0
    local lastAnimCheck = 0
    local lastPingCheck = 0
    local currentPing = 0
    local threatCache = {}
    local lastThreatUpdate = 0
    
    local function GetPing()
        local currentTime = os.clock()
        if currentTime - lastPingCheck < 0.3 then
            return currentPing
        end
        lastPingCheck = currentTime
        
        local stats = Stats and Stats.Network and Stats.Network:FindFirstChild("ServerStatsItem")
        if stats then
            local pingStat = stats:FindFirstChild("Data Ping")
            if pingStat then
                currentPing = pingStat.Value
                return currentPing
            end
        end
        
        return 0
    end
    
    local function GetPingCompensation()
        local ping = GetPing()
        return math.min(0.4, ping / 1000 * config_114514.PingCompensation * 12)
    end
    
    local function CreateVisualization()
        if not LocalPlayer.Character then return end
        local rootPart = LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
        if not rootPart then return end
        
        for _, part in ipairs(visualizationParts) do
            part:Destroy()
        end
        visualizationParts = {}
        
        local center = rootPart.Position
        local distance = config_114514.BaseDistance
        local angle = math.rad(config_114514.TargetAngle)
        local segments = 36
        
        -- 创建中心球体表示玩家位置
        local centerSphere = Instance.new("Part")
        centerSphere.Size = Vector3.new(1, 1, 1)
        centerSphere.Position = center + Vector3.new(0, 0.5, 0)
        centerSphere.Shape = Enum.PartType.Ball
        centerSphere.BrickColor = BrickColor.new("Bright blue")
        centerSphere.Material = Enum.Material.Neon
        centerSphere.Transparency = 0.3
        centerSphere.Anchored = true
        centerSphere.CanCollide = false
        centerSphere.Parent = workspace
        table.insert(visualizationParts, centerSphere)
        
        -- 创建扇形区域表示格挡范围
        for i = 1, segments do
            local part = Instance.new("Part")
            part.Size = Vector3.new(0.3, 0.1, 0.3)
            part.BrickColor = BrickColor.new("Bright green")
            part.Material = Enum.Material.Neon
            part.Transparency = 0.7
            part.Anchored = true
            part.CanCollide = false
            part.Parent = workspace
            table.insert(visualizationParts, part)
        end
        
        local function UpdateVisualization()
            if not config_114514.ShowVisualization then return end
            if not LocalPlayer.Character then return end
            local root = LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
            if not root then return end
            
            local center = root.Position + Vector3.new(0, 0.5, 0)
            local lookVector = root.CFrame.LookVector
            local distance = config_114514.BaseDistance
            local angle = math.rad(config_114514.TargetAngle)
            
            -- 更新中心球体位置
            centerSphere.Position = center
            
            -- 更新扇形区域
            for i = 1, #visualizationParts - 1 do
                local part = visualizationParts[i + 1]
                local segmentAngle = (i - 1) * (2 * angle) / (#visualizationParts - 2) - angle
                local rotCFrame = CFrame.fromAxisAngle(Vector3.new(0, 1, 0), segmentAngle)
                local dir = rotCFrame:VectorToWorldSpace(lookVector)
                local pos = center + dir * distance
                part.Position = pos
                
                -- 设置扇形区域的朝向
                local lookAtCenter = CFrame.lookAt(pos, center)
                part.CFrame = lookAtCenter
            end
        end
        
        local visConnection
        visConnection = RunService.Heartbeat:Connect(function()
            if not config_114514.ShowVisualization then
                for _, part in ipairs(visualizationParts) do
                    part:Destroy()
                end
                visualizationParts = {}
                visConnection:Disconnect()
                return
            end
            pcall(UpdateVisualization)
        end)
    end
    
    local function HasTargetSound(character)
        if not character then return false end
        local rootPart = character:FindFirstChild("HumanoidRootPart")
        if not rootPart then return false end
        
        local currentTime = os.clock()
        if currentTime - lastSoundCheck < 0.0003 then
            return soundCache[character] or false
        end
        lastSoundCheck = currentTime
        
        local found = false
        for _, child in ipairs(rootPart:GetChildren()) do
            if child:IsA("Sound") then
                local soundId = tostring(child.SoundId)
                local numericId = string.match(soundId, "(%d+)$")
                if numericId and soundLookup[numericId] then
                    found = true
                    break
                end
            end
        end
        
        soundCache[character] = found
        return found
    end
    
    local function HasTargetAnimation(character)
        if not character then return false end
        local humanoid = character:FindFirstChildOfClass("Humanoid")
        if not humanoid then return false end
        
        local currentTime = os.clock()
        if currentTime - lastAnimCheck < 0.0003 then
            return animCache[character] or false
        end
        lastAnimCheck = currentTime
        
        local found = false
        local animator = humanoid:FindFirstChildOfClass("Animator")
        if animator then
            for _, track in pairs(animator:GetPlayingAnimationTracks()) do
                if track.Animation then
                    local animId = tostring(track.Animation.AnimationId)
                    local numericId = string.match(animId, "(%d+)$")
                    if numericId and animLookup[numericId] then
                        found = true
                        break
                    end
                end
            end
        end
        
        animCache[character] = found
        return found
    end
    
    local function GetMoveCompensation()
        if not LocalPlayer.Character then return 0 end
        local rootPart = LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
        if not rootPart then return 0 end
        
        local velocity = rootPart.Velocity
        local speed = math.sqrt(velocity.X^2 + velocity.Y^2 + velocity.Z^2)
        return config_114514.MoveCompBase + (speed * config_114514.MoveCompFactor)
    end
    
    local function IsFastKiller(killer)
        if not killer then return false end
        local killerRoot = killer:FindFirstChild("HumanoidRootPart")
        if not killerRoot then return false end
        
        local killerVel = killerRoot.Velocity
        local killerSpeed = math.sqrt(killerVel.X^2 + killerVel.Y^2 + killerVel.Z^2)
        return killerSpeed > config_114514.MinAttackSpeed
    end
    
    local function GetTotalDetectionRange(killer)
        local base = config_114514.BaseDistance
        local moveBonus = GetMoveCompensation()
        local predict = 0
        local pingBonus = GetPingCompensation() * 8
        local reactionBoost = config_114514.ReactionBoost

        if config_114514.EnablePrediction and killer and killer:FindFirstChild("HumanoidRootPart") then
            local killerVel = killer.HumanoidRootPart.Velocity
            local killerSpeed = math.sqrt(killerVel.X^2 + killerVel.Y^2 + killerVel.Z^2)
            
            if killerSpeed > config_114514.SpeedThreshold then
                predict = math.min(
                    config_114514.PredictMax, 
                    config_114514.PredictBase + (killerSpeed * config_114514.PredictFactor)
                )
            end
            
            if IsFastKiller(killer) then
                predict = predict * config_114514.FastKillerAdjust
            end
        end
        
        return (base + moveBonus + predict + pingBonus) * reactionBoost
    end
    
    local function IsTargetingMe(killer)
        local myCharacter = LocalPlayer.Character
        if not myCharacter then return false end
        
        local myRoot = myCharacter:FindFirstChild("HumanoidRootPart")
        local killerRoot = killer and killer:FindFirstChild("HumanoidRootPart")
        if not myRoot or not killerRoot then return false end
        
        local directionToMe = (myRoot.Position - killerRoot.Position).Unit
        local killerLook = killerRoot.CFrame.LookVector
        
        local dot = directionToMe:Dot(killerLook)
        local angle = math.deg(math.acos(math.clamp(dot, -1, 1)))
        
        return angle <= config_114514.TargetAngle
    end
    
    local function IsKillerInRange(killer)
        local myCharacter = LocalPlayer.Character
        if not myCharacter then return false end
        
        local myRoot = myCharacter:FindFirstChild("HumanoidRootPart")
        local killerRoot = killer and killer:FindFirstChild("HumanoidRootPart")
        if not myRoot or not killerRoot then return false end
        
        -- 计算杀手与玩家的实际距离
        local distance = (myRoot.Position - killerRoot.Position).Magnitude
        local detectionRange = GetTotalDetectionRange(killer)
        
        -- 只有当杀手在检测范围内时才返回true
        return distance <= detectionRange
    end
    
    local function UpdateThreatCache()
        local currentTime = os.clock()
        if currentTime - lastThreatUpdate < 0.1 then
            return threatCache
        end
        lastThreatUpdate = currentTime
        
        threatCache = {}
        local killersFolder = workspace:FindFirstChild("Killers") or (workspace:FindFirstChild("Players") and workspace.Players:FindFirstChild("Killers"))
        if not killersFolder then return threatCache end
        
        local myCharacter = LocalPlayer.Character
        if not myCharacter then return threatCache end
        
        local myRoot = myCharacter:FindFirstChild("HumanoidRootPart")
        if not myRoot then return threatCache end
        
        for _, killer in ipairs(killersFolder:GetChildren()) do
            if killer:IsA("Model") and killer:FindFirstChild("HumanoidRootPart") then
                local killerRoot = killer.HumanoidRootPart
                
                -- 首先检查杀手是否在范围内
                if IsKillerInRange(killer) and IsTargetingMe(killer) then
                    local hasSound = HasTargetSound(killer)
                    local hasAnim = HasTargetAnimation(killer)
                    
                    if hasSound or hasAnim then
                        local distance = (myRoot.Position - killerRoot.Position).Magnitude
                        local detectionRange = GetTotalDetectionRange(killer)
                        
                        threatCache[killer] = {
                            distance = distance,
                            detectionRange = detectionRange,
                            timestamp = currentTime,
                            hasSound = hasSound,
                            hasAnim = hasAnim
                        }
                    end
                end
            end
        end
        
        return threatCache
    end
    
    local function GetThreateningKillers()
        local cache = UpdateThreatCache()
        local killers = {}
        local currentTime = os.clock()
        
        for killer, data in pairs(cache) do
            if currentTime - data.timestamp < 0.2 then
                table.insert(killers, killer)
            end
        end
        
        return killers
    end
    
    local function GetAdjustedCooldown()
        local ping = GetPing()
        return math.max(0.04, config_114514.BlockCooldown - (ping / 1000 * 0.7))
    end
    
    local function PerformBlock()
        local now = os.clock()
        if now - lastBlockTime >= GetAdjustedCooldown() then
            pcall(function()
                local args = {
                    "UseActorAbility",
                    {
                        buffer.fromstring("\"Block\"")
                    }
                }
                game:GetService("ReplicatedStorage"):WaitForChild("Modules"):WaitForChild("Network"):WaitForChild("RemoteEvent"):FireServer(unpack(args))
                lastBlockTime = now
            end)
        end
    end
    
    local function CombatLoop()
        local currentTime = os.clock()
        if currentTime - lastScanTime >= config_114514.ScanInterval then
            lastScanTime = currentTime
            
            if not LocalPlayer.Character then return end
            local myRoot = LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
            if not myRoot then return end
            
            local killers = GetThreateningKillers()
            if #killers > 0 then
                PerformBlock()
            end
        end
    end
    
    ZZ2:AddToggle("AutoBlockToggle", {
        Text = "Auto Block",
        Default = false,
        Callback = function(enabled)
            config_114514.Enabled = enabled
            if enabled then
                if combatConnection then
                    combatConnection:Disconnect()
                end
                combatConnection = RunService.Stepped:Connect(function()
                    pcall(CombatLoop)
                end)
            elseif combatConnection then
                combatConnection:Disconnect()
                combatConnection = nil
            end
        end
    })
    
    ZZ2:AddSlider("BaseDistance", {
        Text = "距离",
        Default = 16,
        Min = 5,
        Max = 30,
        Rounding = 1,
        Callback = function(value)
            config_114514.BaseDistance = value
        end
    })
    
    ZZ2:AddSlider("TargetAngleSlider", {
        Text = "角度",
        Default = 70,
        Min = 10,
        Max = 180,
        Rounding = 1,
        Callback = function(value)
            config_114514.TargetAngle = value
        end
    })
    
    ZZ2:AddToggle("VisualizationToggle", {
        Text = "可视化",
        Default = false,
        Callback = function(enabled)
            config_114514.ShowVisualization = enabled
            if enabled then
                CreateVisualization()
            else
                for _, part in ipairs(visualizationParts) do
                    part:Destroy()
                end
                visualizationParts = {}
            end
        end
    })

    LocalPlayer.CharacterAdded:Connect(function()
        if config_114514.Enabled and combatConnection then
            combatConnection:Disconnect()
            combatConnection = RunService.Stepped:Connect(CombatLoop)
        end
        if config_114514.ShowVisualization then
            CreateVisualization()
        end
    end)
end)




NOL:AddToggle("AutoPunch", {
    Text = "自动拳击",
    Default = false,
    Callback = function(Value)
        -- Define variables outside the callback to maintain state
        if not _G.AutoPunchVars then
            _G.AutoPunchVars = {
                ReplicatedStorage = game:GetService("ReplicatedStorage"),
                remoteEvent = nil,
                isRunning = false,
                connection = nil
            }
        end
        
        local vars = _G.AutoPunchVars
        
        -- Function to safely get the RemoteEvent
        local function getRemoteEvent()
            local success, result = pcall(function()
                return vars.ReplicatedStorage:WaitForChild("Modules"):WaitForChild("Network"):WaitForChild("RemoteEvent")
            end)
            
            if not success or not result then
                warn("无法找到 RemoteEvent！请检查路径：ReplicatedStorage.Modules.Network.RemoteEvent")
                return nil
            end
            return result
        end
        
        -- Function to start sending punch events
        local function startAutoPunch()
            if vars.isRunning then return end
            vars.isRunning = true
            
            -- Get the RemoteEvent if we don't have it yet
            if not vars.remoteEvent then
                vars.remoteEvent = getRemoteEvent()
                if not vars.remoteEvent then
                    warn("RemoteEvent 未初始化，无法发送事件。")
                    vars.isRunning = false
                    return
                end
            end
            
            -- Create the loop connection
            vars.connection = task.spawn(function()
                while vars.isRunning and Value do  -- Added Value check here
local args = {
	"UseActorAbility",
	{
		buffer.fromstring("\"Punch\"")
	}
}
                    vars.remoteEvent:FireServer(unpack(args))
                    task.wait(0.5)  -- Wait 0.5 seconds between punches
                end
                vars.isRunning = false
            end)
        end
        
        -- Function to stop sending punch events
        local function stopAutoPunch()
            if not vars.isRunning then return end
            vars.isRunning = false
            
            -- Cancel the loop if it exists
            if vars.connection then
                task.cancel(vars.connection)
                vars.connection = nil
            end
        end
        
        -- Handle the toggle state
        if Value then
            startAutoPunch()
        else
            stopAutoPunch()
        end
    end
})




local ZZ = Tabs.Bro:AddLeftGroupbox('自动狂暴[Slasher]')

local Players = game:GetService("Players")
local lp = Players.LocalPlayer
local savedRange = lp:FindFirstChild("RagingPaceRange")
if not savedRange then
    savedRange = Instance.new("NumberValue")
    savedRange.Name = "RagingPaceRange"
    savedRange.Value = 19
    savedRange.Parent = lp
end

ZZ:AddSlider("RagingPaceRange", {
    Text = "狂暴触发距离",
    Default = savedRange.Value,
    Min = 1,
    Max = 50,
    Rounding = 0,
    Compact = true,
    Callback = function(value)
        savedRange.Value = value
    end
})

ZZ:AddToggle("RagingPace", {
    Text = "自动狂暴",
    Default = false,
    Callback = function(enabled)
        local threadId = tostring(math.random(1, 99999))
        _G.RagingPaceThreadId = threadId
        
        local function shouldContinue()
            return _G.RagingPaceThreadId == threadId and enabled
        end
        
        local RunService = game:GetService("RunService")
        local ReplicatedStorage = game:GetService("ReplicatedStorage")
        local RANGE = savedRange.Value
        local SPAM_DURATION = 3
        local COOLDOWN_TIME = 5
        local activeCooldowns = {}

        local animsToDetect = {
            ["116618003477002"] = true,
            ["119462383658044"] = true,
            ["131696603025265"] = true,
            ["121255898612475"] = true,
            ["133491532453922"] = true,
            ["103601716322988"] = true,
            ["86371356500204"] = true,
            ["72722244508749"] = true,
            ["87259391926321"] = true,
            ["96959123077498"] = true,
        }

        local function fireRagingPace()
            local args = {
                "UseActorAbility",
                {
                    buffer.fromstring("\"RagingPace\"")
                }
            }
            ReplicatedStorage:WaitForChild("Modules")
                :WaitForChild("Network")
                :WaitForChild("RemoteEvent")
                :FireServer(unpack(args))
        end

        local function isAnimationMatching(anim)
            local id = tostring(anim.Animation and anim.Animation.AnimationId or "")
            local numId = id:match("%d+")
            return animsToDetect[numId] or false
        end

        local function runDetection()
            local connection
            connection = RunService.Heartbeat:Connect(function()
                if not shouldContinue() then
                    connection:Disconnect()
                    return
                end
                
                for _, player in ipairs(Players:GetPlayers()) do
                    if not shouldContinue() then break end
                    
                    if player ~= lp and player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
                        local targetHRP = player.Character.HumanoidRootPart
                        local myChar = lp.Character
                        if myChar and myChar:FindFirstChild("HumanoidRootPart") then
                            local dist = (targetHRP.Position - myChar.HumanoidRootPart.Position).Magnitude
                            if dist <= RANGE and (not activeCooldowns[player] or tick() - activeCooldowns[player] >= COOLDOWN_TIME) then
                                local humanoid = player.Character:FindFirstChildOfClass("Humanoid")
                                if humanoid then
                                    for _, track in pairs(humanoid:GetPlayingAnimationTracks()) do
                                        if not shouldContinue() then break end
                                        
                                        if isAnimationMatching(track) then
                                            activeCooldowns[player] = tick()
                                            task.spawn(function()
                                                local startTime = tick()
                                                while shouldContinue() and tick() - startTime < SPAM_DURATION do
                                                    fireRagingPace()
                                                    task.wait(0.05)
                                                end
                                            end)
                                            break
                                        end
                                    end
                                end
                            end
                        end
                    end
                end
            end)
            
            return connection
        end

        if enabled then
            if _G.RagingPaceConnection then
                _G.RagingPaceConnection:Disconnect()
                _G.RagingPaceConnection = nil
            end
            
            _G.RagingPaceConnection = runDetection()
        else
            if _G.RagingPaceConnection then
                _G.RagingPaceConnection:Disconnect()
                _G.RagingPaceConnection = nil
            end
        end
    end
})



local ZZ = Tabs.Bro:AddRightGroupbox('自动使用404错误[John doe]')

ZZ:AddToggle("AntiAnimations", {
    Text = "自动404错误[势无可挡]",
    Default = false,
    Callback = function(enabled)
        local threadId = tostring(math.random(1, 99999))
        _G.AntiAnimThreadId = threadId
        
        local function shouldContinue()
            return _G.AntiAnimThreadId == threadId and enabled
        end
        
        local Players = game:GetService("Players")
        local RunService = game:GetService("RunService")
        local ReplicatedStorage = game:GetService("ReplicatedStorage")
        local lp = Players.LocalPlayer
        local RANGE = 19
        local SPAM_DURATION = 3
        local COOLDOWN_TIME = 5
        local activeCooldowns = {}

        local animsToDetect = {
            ["116618003477002"] = true,
            ["119462383658044"] = true,
            ["131696603025265"] = true,
            ["121255898612475"] = true,
            ["133491532453922"] = true,
            ["103601716322988"] = true,
            ["86371356500204"] = true,
            ["72722244508749"] = false,
            ["87259391926321"] = true,
            ["96959123077498"] = false,
            ["86709774283672"] = true,
            ["77448521277146"] = true,
        }

        local function fire404Error()
            local args = {
                "UseActorAbility",
                {
                    buffer.fromstring("\"404Error\"")
                }
            }
            ReplicatedStorage:WaitForChild("Modules")
                :WaitForChild("Network")
                :WaitForChild("RemoteEvent")
                :FireServer(unpack(args))
        end

        local function isAnimationMatching(anim)
            local id = tostring(anim.Animation and anim.Animation.AnimationId or "")
            local numId = id:match("%d+")
            return animsToDetect[numId] or false
        end

        local function runDetection()
            local connection
            connection = RunService.Heartbeat:Connect(function()
                if not shouldContinue() then
                    connection:Disconnect()
                    return
                end
                
                for _, player in ipairs(Players:GetPlayers()) do
                    if not shouldContinue() then break end
                    
                    if player ~= lp and player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
                        local targetHRP = player.Character.HumanoidRootPart
                        local myChar = lp.Character
                        if myChar and myChar:FindFirstChild("HumanoidRootPart") then
                            local dist = (targetHRP.Position - myChar.HumanoidRootPart.Position).Magnitude
                            if dist <= RANGE and (not activeCooldowns[player] or tick() - activeCooldowns[player] >= COOLDOWN_TIME) then
                                local humanoid = player.Character:FindFirstChildOfClass("Humanoid")
                                if humanoid then
                                    for _, track in pairs(humanoid:GetPlayingAnimationTracks()) do
                                        if not shouldContinue() then break end
                                        
                                        if isAnimationMatching(track) then
                                            activeCooldowns[player] = tick()
                                            task.spawn(function()
                                                local startTime = tick()
                                                while shouldContinue() and tick() - startTime < SPAM_DURATION do
                                                    fire404Error()
                                                    task.wait(0.05)
                                                end
                                            end)
                                            break
                                        end
                                    end
                                end
                            end
                        end
                    end
                end
            end)
            
            return connection
        end

        if enabled then
            if _G.AntiAnimConnection then
                _G.AntiAnimConnection:Disconnect()
                _G.AntiAnimConnection = nil
            end
            
            _G.AntiAnimConnection = runDetection()
        else
            if _G.AntiAnimConnection then
                _G.AntiAnimConnection:Disconnect()
                _G.AntiAnimConnection = nil
            end
        end
    end
})



local Visual = Tabs.Bro:AddLeftGroupbox("Veeronica自动滑板跳跃")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Players = game:GetService("Players")
local player = Players.LocalPlayer
local RunService = game:GetService("RunService")

local function getBehaviorFolder()
    return ReplicatedStorage:WaitForChild("Assets")
        :WaitForChild("Survivors")
        :WaitForChild("Veeronica")
        :WaitForChild("Behavior")
end

local behaviorFolder = getBehaviorFolder()
local monitored = {}
local isEnabled = false

local function safeIsDescendantOf(inst, ancestor)
    if not inst or not ancestor then return false end
    local ok, res = pcall(function() return inst:IsDescendantOf(ancestor) end)
    return ok and res
end

local function adorneeIsPlayerCharacter(h)
    if not h or not h.Parent then return false end

    local adornee = nil
    pcall(function() adornee = h.Adornee end)
    if not adornee then return false end

    local char = player.Character
    if not char then return false end

    if adornee == char then return true end

    if safeIsDescendantOf(adornee, char) then
        return true
    end

    if adornee:IsA("Model") then
        local ok, found = pcall(function()
            for _, part in ipairs(adornee:GetDescendants()) do
                if part:IsA("BasePart") and part:IsDescendantOf(char) then
                    return true
                end
            end
            return false
        end)
        if ok and found then return true end
    end

    if adornee:IsA("Attachment") then
        local parentPart = adornee.Parent
        if parentPart and safeIsDescendantOf(parentPart, char) then return true end
    end

    if adornee:IsA("Humanoid") and adornee.Parent == char then return true end

    return false
end

local function safeConnectPropertyChanged(instance, prop, fn)
    local ok, signal = pcall(function() return instance:GetPropertyChangedSignal(prop) end)
    if ok and signal then
        return signal:Connect(fn)
    end
    return nil
end

local function monitorHighlight(h)
    if not h or monitored[h] then return end
    monitored[h] = true

    local prevState = adorneeIsPlayerCharacter(h)
    local connections = {}
    local adorneeConn = nil
    local pollLoop = nil
    local alive = true

    local function cleanup()
        alive = false
        for _, conn in ipairs(connections) do
            if conn and conn.Connected then
                conn:Disconnect()
            end
        end
        if adorneeConn and adorneeConn.Connected then
            adorneeConn:Disconnect()
            adorneeConn = nil
        end
        if pollLoop then
            pollLoop:Cancel()
            pollLoop = nil
        end
        monitored[h] = nil
    end

    local function attachToCurrentAdornee()
        if adorneeConn and adorneeConn.Connected then
            adorneeConn:Disconnect()
            adorneeConn = nil
        end

        local currentAdornee = nil
        pcall(function() currentAdornee = h.Adornee end)
        if currentAdornee and currentAdornee:IsA("Instance") then
            local ok, conn = pcall(function()
                return currentAdornee.AncestryChanged:Connect(function()
                    if alive then
                        task.spawn(function()
                            onChanged()
                        end)
                    end
                end)
            end)
            if ok and conn then adorneeConn = conn end
        end
    end

    function onChanged()
        if not h or not h.Parent then return end
        local currState = adorneeIsPlayerCharacter(h)
        if prevState ~= currState then
            if currState then
                pcall(function()
                    keypress(Enum.KeyCode.Space)
                    wait(0.09)
                    keyrelease(Enum.KeyCode.Space)
                end)
            end
            prevState = currState
        end
    end

    local propConn = safeConnectPropertyChanged(h, "Adornee", function()
        attachToCurrentAdornee()
        onChanged()
    end)
    if propConn then table.insert(connections, propConn) end

    local ancestryConn = h.AncestryChanged:Connect(function(_, parent)
        if not parent then
            cleanup()
        else
            onChanged()
        end
    end)
    table.insert(connections, ancestryConn)

    table.insert(connections, player.CharacterAdded:Connect(onChanged))
    table.insert(connections, player.CharacterRemoving:Connect(onChanged))

    local cancelled = false
    pollLoop = {
        Cancel = function() cancelled = true end
    }
    task.spawn(function()
        local lastCheck = tick()
        while not cancelled and h and h.Parent do
            task.wait(0.15)
            if cancelled then break end
            local ok, curr = pcall(function() return adorneeIsPlayerCharacter(h) end)
            if ok then
                if curr ~= prevState then
                    task.spawn(onChanged)
                end
                prevState = curr
            end
        end
    end)

    attachToCurrentAdornee()
    task.spawn(onChanged)
end

local function startMonitoring()
    for _, desc in ipairs(behaviorFolder:GetDescendants()) do
        if desc:IsA("Highlight") then
            monitorHighlight(desc)
        end
    end

    behaviorFolder.DescendantAdded:Connect(function(child)
        if child:IsA("Highlight") then
            monitorHighlight(child)
        end
    end)
end

local function stopMonitoring()
    for h, _ in pairs(monitored) do
        monitored[h] = nil
    end
end

Visual:AddToggle("HighlightMonitor", {
    Text = "启用",
    Default = false,
    Callback = function(enabled)
        isEnabled = enabled
        if enabled then
            startMonitoring()
        else
            stopMonitoring()
        end
    end
})


local VirtualJoystick = {}

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")
local ContextActionService = game:GetService("ContextActionService")

function VirtualJoystick:Create()
    local self = setmetatable({}, { __index = VirtualJoystick })
    
    self.MOVE_SPEED = 16
    self.BASE_SIZE = 220
    self.KNOB_SIZE = 70
    self.MARGIN = 20
    self.MAX_RADIUS = (self.BASE_SIZE - self.KNOB_SIZE) / 2
    
    self.humanoid = nil
    self.dragging = false
    self.trackedInput = nil
    self.moveDir = Vector3.new()
    self.isEnabled = false
    
    self.screenGui = nil
    self.base = nil
    self.knob = nil
    
    self.connections = {}
    self.renderConn = nil
    
    self:_createGUI()
    self:_bindCharacter()
    
    return self
end

function VirtualJoystick:_createGUI()
    self.screenGui = Instance.new("ScreenGui")
    self.screenGui.Name = "VirtualJoystickGui"
    self.screenGui.ResetOnSpawn = false
    self.screenGui.IgnoreGuiInset = true
    self.screenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    
    self.base = Instance.new("Frame")
    self.base.Name = "JoystickBase"
    self.base.Size = UDim2.new(0, self.BASE_SIZE, 0, self.BASE_SIZE)
    self.base.AnchorPoint = Vector2.new(0, 1)
    self.base.Position = UDim2.new(0, self.MARGIN, 1, -self.MARGIN)
    self.base.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
    self.base.BackgroundTransparency = 0.55
    self.base.BorderSizePixel = 0
    self.base.Visible = false
    self.base.Parent = self.screenGui
    
    self.knob = Instance.new("Frame")
    self.knob.Name = "Knob"
    self.knob.Size = UDim2.new(0, self.KNOB_SIZE, 0, self.KNOB_SIZE)
    self.knob.AnchorPoint = Vector2.new(0.5, 0.5)
    self.knob.Position = UDim2.new(0.5, 0, 0.5, 0)
    self.knob.BackgroundColor3 = Color3.fromRGB(220, 220, 220)
    self.knob.BackgroundTransparency = 0.15
    self.knob.BorderSizePixel = 0
    self.knob.Parent = self.base
    
    local baseCorner = Instance.new("UICorner")
    baseCorner.CornerRadius = UDim.new(1, 0)
    baseCorner.Parent = self.base
    
    local knobCorner = Instance.new("UICorner")
    knobCorner.CornerRadius = UDim.new(1, 0)
    knobCorner.Parent = self.knob
    
    self:_bindInputEvents()
end

function VirtualJoystick:_bindInputEvents()
    table.insert(self.connections, self.base.InputBegan:Connect(function(input)
        if input.UserInputType ~= Enum.UserInputType.Touch then return end
        self.dragging = true
        self.trackedInput = input
        self:_blockCameraTouch()
        self:_updateFromFinger(Vector2.new(input.Position.X, input.Position.Y))
    end))
    
    table.insert(self.connections, self.base.InputChanged:Connect(function(input)
        if not self.dragging then return end
        if input.UserInputType ~= Enum.UserInputType.Touch then return end
        if input ~= self.trackedInput then return end
        self:_updateFromFinger(Vector2.new(input.Position.X, input.Position.Y))
    end))
    
    table.insert(self.connections, self.base.InputEnded:Connect(function(input)
        if input.UserInputType ~= Enum.UserInputType.Touch then return end
        if input ~= self.trackedInput then return end
        self.dragging = false
        self.trackedInput = nil
        self:_unblockCameraTouch()
        self:_resetKnob()
    end))
end

function VirtualJoystick:_bindCharacter()
    local player = Players.LocalPlayer
    
    local function bindCharacter(char)
        self.humanoid = nil
        if char then
            self.humanoid = char:FindFirstChild("Humanoid") or char:WaitForChild("Humanoid")
        end
    end
    
    if player.Character then
        bindCharacter(player.Character)
    end
    
    table.insert(self.connections, player.CharacterAdded:Connect(bindCharacter))
    table.insert(self.connections, player.CharacterRemoving:Connect(function()
        self.humanoid = nil
    end))
end

function VirtualJoystick:_ensureSizes()
    if not self.base or not self.knob then return end
    if self.base.AbsoluteSize.Magnitude == 0 or self.knob.AbsoluteSize.Magnitude == 0 then
        for i = 1, 4 do RunService.Heartbeat:Wait() end
    end
end

function VirtualJoystick:_baseCenter()
    local pos = self.base.AbsolutePosition
    local size = self.base.AbsoluteSize
    return Vector2.new(pos.X + size.X * 0.5, pos.Y + size.Y * 0.5)
end

function VirtualJoystick:_updateFromFinger(fingerPos)
    self:_ensureSizes()
    local center = self:_baseCenter()
    local delta = Vector2.new(fingerPos.X - center.X, fingerPos.Y - center.Y)
    local clamped = delta
    if clamped.Magnitude > self.MAX_RADIUS then
        clamped = clamped.Unit * self.MAX_RADIUS
    end
    
    self.knob.Position = UDim2.new(0.5, clamped.X, 0.5, clamped.Y)
    
    local x = math.clamp(clamped.X / self.MAX_RADIUS, -1, 1)
    local inputY = math.clamp(clamped.Y / self.MAX_RADIUS, -1, 1)
    local z = inputY
    
    self.moveDir = Vector3.new(x, 0, z)
end

function VirtualJoystick:_resetKnob()
    self.moveDir = Vector3.new()
    self:_ensureSizes()
    
    pcall(function()
        local tween = TweenService:Create(self.knob, TweenInfo.new(0.12, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
            Position = UDim2.new(0.5, 0, 0.5, 0)
        })
        tween:Play()
    end)
end

function VirtualJoystick:_blockCameraTouch()
    ContextActionService:BindAction("VirtualJoystick_BlockCamera", function(actionName, inputState, inputObject)
        if not self.trackedInput then
            return Enum.ContextActionResult.Pass
        end
        if inputObject == self.trackedInput then
            return Enum.ContextActionResult.Sink
        end
        return Enum.ContextActionResult.Pass
    end, false, Enum.UserInputType.Touch)
end

function VirtualJoystick:_unblockCameraTouch()
    ContextActionService:UnbindAction("VirtualJoystick_BlockCamera")
end

function VirtualJoystick:Show()
    if not self.screenGui.Parent then
        self.screenGui.Parent = Players.LocalPlayer:WaitForChild("PlayerGui")
    end
    self.base.Visible = true
    self:_resetKnob()
end

function VirtualJoystick:Hide()
    self.base.Visible = false
    self:_resetKnob()
end

function VirtualJoystick:EnableMovement()
    if self.renderConn and self.renderConn.Connected then return end
    self.renderConn = RunService.RenderStepped:Connect(function()
        if self.humanoid and self.humanoid.Health > 0 then
            self.humanoid:Move(self.moveDir * self.MOVE_SPEED, true)
        end
    end)
end

function VirtualJoystick:DisableMovement()
    if self.renderConn and self.renderConn.Connected then
        self.renderConn:Disconnect()
        self.renderConn = nil
    end
    self.moveDir = Vector3.new()
    self:_resetKnob()
    self:_unblockCameraTouch()
end

function VirtualJoystick:Destroy()
    self:DisableMovement()
    if self.screenGui and self.screenGui.Parent then
        self.screenGui.Parent = nil
    end
    pcall(function() self.screenGui:Destroy() end)
end

local joystick = VirtualJoystick:Create()

Visual:AddToggle("VirtualJoystickToggle", {
    Text = "虚拟摇杆",
    Default = false,
    Callback = function(enabled)
        if enabled then
            joystick:Show()
            joystick:EnableMovement()
        else
            joystick:Hide()
            joystick:DisableMovement()
        end
    end
})


local ZZ = Tabs.Bro:AddLeftGroupbox('007n7自动分身格挡')

local config_007n7 = {
    Enabled = false,
    BaseDistance = 18,
    ScanInterval = 0.001,
    BlockCooldown = 0.08,
    MoveCompBase = 1.5,
    MoveCompFactor = 0.25,
    SpeedThreshold = 8,
    PredictBase = 4,
    PredictMax = 12,
    PredictFactor = 0.35,
    TargetAngle = 50,
    MinAttackSpeed = 12,
    ShowVisualization = false,
    EnablePrediction = false,
    PingCompensation = 0.1,
    FastKillerAdjust = 1.3,
    TargetSoundIds = {
        "102228729296384", "140242176732868", "112809109188560", "136323728355613",
        "115026634746636", "84116622032112", "108907358619313", "127793641088496",
        "86174610237192", "95079963655241", "101199185291628", "119942598489800",
        "84307400688050", "113037804008732", "105200830849301", "75330693422988",
        "82221759983649", "81702359653578", "108610718831698", "112395455254818",
        "109431876587852", "109348678063422", "85853080745515", "12222216"
    }
}

pcall(function()
    local Players = game:GetService("Players")
    local ReplicatedStorage = game:GetService("ReplicatedStorage")
    local RunService = game:GetService("RunService")
    local Stats = game:GetService("Stats")
    
    local soundLookup = {}
    for _, id in ipairs(config_007n7.TargetSoundIds) do
        soundLookup[id] = true
        soundLookup["rbxassetid://" .. id] = true
    end
    
    local LocalPlayer = Players.LocalPlayer
    local lastBlockTime = 0
    local combatConnection = nil
    local lastScanTime = 0
    local visualizationParts = {}
    local soundCache = {}
    local lastSoundCheck = 0
    local lastPingCheck = 0
    local currentPing = 0
    
    local function SafeCall(func, ...)
        local success, result = pcall(func, ...)
        if not success then
            return nil
        end
        return result
    end
    
    local function GetPing()
        local currentTime = os.clock()
        if currentTime - lastPingCheck < 0.5 then
            return currentPing
        end
        lastPingCheck = currentTime
        
        local stats = SafeCall(function()
            return Stats and Stats.Network and Stats.Network:FindFirstChild("ServerStatsItem")
        end)
        if stats then
            local pingStat = stats:FindFirstChild("Data Ping")
            if pingStat then
                currentPing = pingStat.Value
                return currentPing
            end
        end
        
        return 0
    end
    
    local function GetPingCompensation()
        local ping = GetPing()
        return math.min(0.3, ping / 1000 * config_007n7.PingCompensation * 10)
    end
    
    local function CreateVisualization()
        if not LocalPlayer.Character then return end
        local rootPart = SafeCall(function() return LocalPlayer.Character:FindFirstChild("HumanoidRootPart") end)
        if not rootPart then return end
        
        for _, part in ipairs(visualizationParts) do
            SafeCall(function() part:Destroy() end)
        end
        visualizationParts = {}
        
        local center = rootPart.Position
        local distance = config_007n7.BaseDistance
        local angle = math.rad(config_007n7.TargetAngle)
        local segments = 36
        
        local basePart = Instance.new("Part")
        basePart.Size = Vector3.new(0.1, 0.1, 0.1)
        basePart.Position = center + Vector3.new(0, 0.1, 0)
        basePart.Anchored = true
        basePart.CanCollide = false
        basePart.Transparency = 1
        basePart.Parent = workspace
        table.insert(visualizationParts, basePart)
        
        for i = 1, segments do
            local part = Instance.new("Part")
            part.Size = Vector3.new(0.5, 0.1, 0.5)
            part.BrickColor = BrickColor.new("Bright green")
            part.Material = Enum.Material.Neon
            part.Transparency = 0.7
            part.Anchored = true
            part.CanCollide = false
            part.Parent = workspace
            table.insert(visualizationParts, part)
        end
        
        local function UpdateVisualization()
            if not config_007n7.ShowVisualization then return end
            if not LocalPlayer.Character then return end
            local root = SafeCall(function() return LocalPlayer.Character:FindFirstChild("HumanoidRootPart") end)
            if not root then return end
            
            local center = root.Position + Vector3.new(0, 0.1, 0)
            local lookVector = root.CFrame.LookVector
            local distance = config_007n7.BaseDistance
            local angle = math.rad(config_007n7.TargetAngle)
            
            basePart.Position = center
            
            for i = 1, #visualizationParts - 1 do
                local part = visualizationParts[i + 1]
                local segmentAngle = (i - 1) * (2 * angle) / (#visualizationParts - 2) - angle
                local rotCFrame = CFrame.fromAxisAngle(Vector3.new(0, 1, 0), segmentAngle)
                local dir = rotCFrame:VectorToWorldSpace(lookVector)
                local pos = center + dir * distance
                part.Position = pos
                part.Size = Vector3.new(0.5, 0.1, 0.5)
            end
        end
        
        local visConnection
        visConnection = RunService.Heartbeat:Connect(function()
            if not config_007n7.ShowVisualization then
                for _, part in ipairs(visualizationParts) do
                    SafeCall(function() part:Destroy() end)
                end
                visualizationParts = {}
                SafeCall(function() visConnection:Disconnect() end)
                return
            end
            SafeCall(UpdateVisualization)
        end)
    end
    
    local function HasTargetSound(character)
        if not character then return false end
        local rootPart = SafeCall(function() return character:FindFirstChild("HumanoidRootPart") end)
        if not rootPart then return false end
        
        local currentTime = os.clock()
        if currentTime - lastSoundCheck < 0.0005 then
            return soundCache[character] or false
        end
        lastSoundCheck = currentTime
        
        local found = false
        for _, child in ipairs(rootPart:GetChildren()) do
            if child:IsA("Sound") and child.IsPlaying then
                local soundId = SafeCall(function() return tostring(child.SoundId) end)
                if soundId then
                    local numericId = string.match(soundId, "(%d+)$")
                    if numericId and soundLookup[numericId] then
                        found = true
                        break
                    end
                end
            end
        end
        
        soundCache[character] = found
        return found
    end
    
    local function GetMoveCompensation()
        if not LocalPlayer.Character then return 0 end
        local rootPart = SafeCall(function() return LocalPlayer.Character:FindFirstChild("HumanoidRootPart") end)
        if not rootPart then return 0 end
        
        local velocity = rootPart.Velocity
        local speed = math.sqrt(velocity.X^2 + velocity.Y^2 + velocity.Z^2)
        return config_007n7.MoveCompBase + (speed * config_007n7.MoveCompFactor)
    end
    
    local function IsFastKiller(killer)
        if not killer then return false end
        local killerRoot = SafeCall(function() return killer:FindFirstChild("HumanoidRootPart") end)
        if not killerRoot then return false end
        
        local killerVel = killerRoot.Velocity
        local killerSpeed = math.sqrt(killerVel.X^2 + killerVel.Y^2 + killerVel.Z^2)
        return killerSpeed > config_007n7.MinAttackSpeed
    end
    
    local function GetTotalDetectionRange(killer)
        local base = config_007n7.BaseDistance
        local moveBonus = GetMoveCompensation()
        local predict = 0
        local pingBonus = GetPingCompensation() * 5
        
        if config_007n7.EnablePrediction and killer then
            local killerRoot = SafeCall(function() return killer:FindFirstChild("HumanoidRootPart") end)
            if killerRoot then
                local killerVel = killerRoot.Velocity
                local killerSpeed = math.sqrt(killerVel.X^2 + killerVel.Y^2 + killerVel.Z^2)
                
                if killerSpeed > config_007n7.SpeedThreshold then
                    predict = math.min(
                        config_007n7.PredictMax, 
                        config_007n7.PredictBase + (killerSpeed * config_007n7.PredictFactor)
                    )
                end
                
                if IsFastKiller(killer) then
                    predict = predict * config_007n7.FastKillerAdjust
                end
            end
        end
        
        return base + moveBonus + predict + pingBonus
    end
    
    local function IsTargetingMe(killer)
        local myCharacter = LocalPlayer.Character
        if not myCharacter then return false end
        
        local myRoot = SafeCall(function() return myCharacter:FindFirstChild("HumanoidRootPart") end)
        local killerRoot = SafeCall(function() return killer and killer:FindFirstChild("HumanoidRootPart") end)
        if not myRoot or not killerRoot then return false end
        
        local directionToMe = (myRoot.Position - killerRoot.Position).Unit
        local killerLook = killerRoot.CFrame.LookVector
        
        local dot = directionToMe:Dot(killerLook)
        local angle = math.deg(math.acos(math.clamp(dot, -1, 1)))
        
        return angle <= config_007n7.TargetAngle
    end
    
    local function GetThreateningKillers()
        local killers = {}
        local killersFolder = SafeCall(function() 
            return workspace:FindFirstChild("Killers") or (workspace:FindFirstChild("Players") and workspace.Players:FindFirstChild("Killers"))
        end)
        if not killersFolder then return killers end
        
        local myCharacter = LocalPlayer.Character
        if not myCharacter then return killers end
        
        local myRoot = SafeCall(function() return myCharacter:FindFirstChild("HumanoidRootPart") end)
        if not myRoot then return killers end
        
        for _, killer in ipairs(killersFolder:GetChildren()) do
            if SafeCall(function() return killer:IsA("Model") and killer:FindFirstChild("HumanoidRootPart") end) then
                local killerRoot = killer.HumanoidRootPart
                local distance = (myRoot.Position - killerRoot.Position).Magnitude
                local detectionRange = GetTotalDetectionRange(killer)
                
                local isThreatening = false
                
                if distance <= detectionRange then
                    if HasTargetSound(killer) then
                        isThreatening = true
                    elseif distance <= 8 then
                        isThreatening = IsTargetingMe(killer)
                    end
                end
                
                if isThreatening then
                    table.insert(killers, killer)
                end
            end
        end
        
        return killers
    end
    
    local function GetAdjustedCooldown()
        local ping = GetPing()
        return math.max(0.05, config_007n7.BlockCooldown - (ping / 1000 * 0.5))
    end
    
    local function PerformBlock()
        local now = os.clock()
        if now - lastBlockTime >= GetAdjustedCooldown() then
            SafeCall(function()
                local args = {
                    "UseActorAbility",
                    {
                        buffer.fromstring("\"Clone\"")
                    }
                }
                game:GetService("ReplicatedStorage"):WaitForChild("Modules"):WaitForChild("Network"):WaitForChild("RemoteEvent"):FireServer(unpack(args))
                lastBlockTime = now
            end)
        end
    end
    
    local function CombatLoop()
        local currentTime = os.clock()
        if currentTime - lastScanTime >= config_007n7.ScanInterval then
            lastScanTime = currentTime
            local killers = GetThreateningKillers()
            if #killers > 0 then
                PerformBlock()
            end
        end
    end
    
    ZZ:AddToggle("AutoBlockToggle", {
        Text = "自动分身",
        Default = false,
        Callback = function(enabled)
            config_007n7.Enabled = enabled
            if enabled then
                if combatConnection then
                    SafeCall(function() combatConnection:Disconnect() end)
                end
                combatConnection = RunService.Stepped:Connect(function()
                    SafeCall(CombatLoop)
                end)
            elseif combatConnection then
                SafeCall(function() combatConnection:Disconnect() end)
                combatConnection = nil
            end
        end
    })
    
    ZZ:AddSlider("BaseDistance", {
        Text = "格挡距离",
        Default = 18,
        Min = 5,
        Max = 30,
        Rounding = 1,
        Callback = function(value)
            config_007n7.BaseDistance = value
        end
    })
    
    ZZ:AddSlider("TargetAngleSlider", {
        Text = "格挡角度",
        Default = 70,
        Min = 10,
        Max = 180,
        Rounding = 1,
        Callback = function(value)
            config_007n7.TargetAngle = value
        end
    })
    
    ZZ:AddToggle("VisualizationToggle", {
        Text = "可视化",
        Default = false,
        Callback = function(enabled)
            config_007n7.ShowVisualization = enabled
            if enabled then
                CreateVisualization()
            else
                for _, part in ipairs(visualizationParts) do
                    SafeCall(function() part:Destroy() end)
                end
                visualizationParts = {}
            end
        end
    })
    
    LocalPlayer.CharacterAdded:Connect(function()
        if config_007n7.Enabled and combatConnection then
            SafeCall(function() combatConnection:Disconnect() end)
            combatConnection = RunService.Stepped:Connect(CombatLoop)
        end
        if config_007n7.ShowVisualization then
            CreateVisualization()
        end
    end)
end)


local RunService = game:GetService("RunService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")

local MVP = Tabs.Sat:AddLeftGroupbox("体力设置")

local StaminaSettings = {
    MaxStamina = 100,
    StaminaGain = 25,
    StaminaLoss = 10,
    SprintSpeed = 28,
    InfiniteGain = 9999
}

local SettingToggles = {
    MaxStamina = false,
    StaminaGain = false,
    StaminaLoss = false,
    SprintSpeed = false
}

local SprintingModule = ReplicatedStorage:WaitForChild("Systems"):WaitForChild("Character"):WaitForChild("Game"):WaitForChild("Sprinting")
local GetModule = function() return require(SprintingModule) end

task.spawn(function()
    while true do
        local m = GetModule()
        for key, value in pairs(StaminaSettings) do
            if SettingToggles[key] then
                m[key] = value
            end
        end
        task.wait(0.5)
    end
end)

local bai = {Spr = false}
local connection

MVP:AddToggle('MyToggle', {
    Text = '无限体力',
    Default = false,
    Tooltip = '无限体力',
    Callback = function(state)
        bai.Spr = state
        local Sprinting = GetModule()

        if state then
            Sprinting.StaminaLoss = 0
            Sprinting.StaminaGain = StaminaSettings.InfiniteGain

            if connection then connection:Disconnect() end
            connection = RunService.Heartbeat:Connect(function()
                if not bai.Spr then return end
                Sprinting.StaminaLoss = 0
                Sprinting.StaminaGain = StaminaSettings.InfiniteGain
            end)
        else
            Sprinting.StaminaLoss = 10
            Sprinting.StaminaGain = 25

            if connection then
                connection:Disconnect()
                connection = nil
            end
        end
    end
})

MVP:AddToggle('MaxStaminaToggle', {
    Text = '启用体力调整',
    Default = false,
    Callback = function(Value)
        SettingToggles.MaxStamina = Value
    end
})

MVP:AddToggle('StaminaGainToggle', {
    Text = '启用体力恢复调整',
    Default = false,
    Callback = function(Value)
        SettingToggles.StaminaGain = Value
    end
})

MVP:AddToggle('StaminaLossToggle', {
    Text = '启用体力消耗调整',
    Default = false,
    Callback = function(Value)
        SettingToggles.StaminaLoss = Value
    end
})

MVP:AddToggle('SprintSpeedToggle', {
    Text = '启用奔跑速度调整',
    Default = false,
    Callback = function(Value)
        SettingToggles.SprintSpeed = Value
    end
})

local MVP2 = Tabs.Sat:AddRightGroupbox("调试设置")

MVP2:AddSlider('InfStaminaGainSlider', {
    Text = '无限体力恢复速度',
    Default = 9999,
    Min = 0,
    Max = 10000,
    Rounding = 0,
    Callback = function(Value)
        StaminaSettings.InfiniteGain = Value
        if bai.Spr then
            local Sprinting = GetModule()
            Sprinting.StaminaGain = Value
        end
    end
})

MVP2:AddSlider('MySlider1', {
    Text = '最大体力值',
    Default = 100,
    Min = 0,
    Max = 9999,
    Rounding = 0,
    Callback = function(Value)
        StaminaSettings.MaxStamina = Value
        if SettingToggles.MaxStamina then
            local Sprinting = GetModule()
            Sprinting.MaxStamina = Value
        end
    end
})

MVP2:AddSlider('MySlider2', {
    Text = '体力恢复速度',
    Default = 25,
    Min = 0,
    Max = 500,
    Rounding = 0,
    Callback = function(Value)
        StaminaSettings.StaminaGain = Value
        if SettingToggles.StaminaGain and not bai.Spr then
            local Sprinting = GetModule()
            Sprinting.StaminaGain = Value
        end
    end
})

MVP2:AddSlider('MySlider3', {
    Text = '体力消耗速度',
    Default = 10,
    Min = 0,
    Max = 800,
    Rounding = 0,
    Callback = function(Value)
        StaminaSettings.StaminaLoss = Value
        if SettingToggles.StaminaLoss and not bai.Spr then
            local Sprinting = GetModule()
            Sprinting.StaminaLoss = Value
        end
    end
})

MVP2:AddSlider('MySlider4', {
    Text = '奔跑速度',
    Default = 28,
    Min = 0,
    Max = 200,
    Rounding = 0,
    Callback = function(Value)
        StaminaSettings.SprintSpeed = Value
        if SettingToggles.SprintSpeed then
            local Sprinting = GetModule()
            Sprinting.SprintSpeed = Value
        end
    end
})












local Generator = Tabs.zdx:AddLeftGroupbox("自动修机")

Generator:AddSlider("RepairSpeed", {
    Text = "修机速度 (s)",
    Default = 4,
    Min = 1,
    Max = 5,
    Rounding = 1,
    Compact = false,
    Callback = function(v)
        _G.CustomSpeed = v
    end
})

Generator:AddToggle("AutoGenerator",{
    Text = "自动修机",
    Default = false,
    Callback = function(v)
        _G.AutoGen = v
        task.spawn(function()
            while _G.AutoGen do
                if game:GetService("Players").LocalPlayer.PlayerGui:FindFirstChild("PuzzleUI") then
                    local delayTime = _G.CustomSpeed or 4
                    
                    wait(delayTime)
                    
                    for _,v in ipairs(workspace["Map"]["Ingame"]["Map"]:GetChildren()) do
                        if v.Name == "Generator" then
                            v["Remotes"]["RE"]:FireServer()
                        end
                    end
                end
                wait()
            end
        end)
    end
})

Generator:AddToggle("InstantRepair", {
    Text = "秒修机",
    Default = false,
    Callback = function(v)
        _G.InstantRepair = v
        task.spawn(function()
            while _G.InstantRepair do
                if game:GetService("Players").LocalPlayer.PlayerGui:FindFirstChild("PuzzleUI") then
                    -- 等待1秒后执行前两次事件
                    wait(1)
                    for i = 1, 2 do
                        for _,v in ipairs(workspace["Map"]["Ingame"]["Map"]:GetChildren()) do
                            if v.Name == "Generator" then
                                v["Remotes"]["RE"]:FireServer()
                            end
                        end
                    end
                    
                    -- 再等待2秒后执行后两次事件
                    wait(2)
                    for i = 1, 2 do
                        for _,v in ipairs(workspace["Map"]["Ingame"]["Map"]:GetChildren()) do
                            if v.Name == "Generator" then
                                v["Remotes"]["RE"]:FireServer()
                            end
                        end
                    end
                end
                wait()
            end
        end)
    end
})



local KillerSurvival = Tabs.zdx:AddRightGroupbox('传送修机[危险]')

KillerSurvival:AddButton({
    Text = '传送到发电机',
    Func = function()
        local player = game.Players.LocalPlayer
        local character = player.Character
        if not character or not character:FindFirstChild("HumanoidRootPart") then return end
        
        local generators = workspace.Map.Ingame.Map:GetChildren()
        for _, generator in ipairs(generators) do
            if generator.Name == "Generator" and 
               generator:FindFirstChild("Progress") and 
               generator.Progress.Value < 100 then
                
                local generatorPart = generator:FindFirstChild("Main") or  
                                     generator:FindFirstChild("Model") or
                                     generator:FindFirstChild("Base")
                
                if generatorPart then
                    character.HumanoidRootPart.CFrame = generatorPart.CFrame + Vector3.new(0, 3, 0)
                    return  
                end
            end
        end
        warn("没有找到可修理的发电机")
    end
})

KillerSurvival:AddToggle("AutoFix", {
    Text = "自动发电机农场",
    Default = false,
    Callback = function(enabled)
        local threadId = tostring(math.random(1, 99999))
        _G.AutoFixThreadId = threadId
        
        local function shouldContinue()
            return _G.AutoFixThreadId == threadId and enabled
        end
        
        local function allGeneratorsFixed()
            for _, v in ipairs(workspace.Map.Ingame.Map:GetChildren()) do
                if v.Name == "Generator" and v:FindFirstChild("Progress") and v.Progress.Value < 100 then
                    return false
                end
            end
            return true
        end
        
        local function fastInteract(generator, action)
            local args = {[1] = action}
            pcall(function()
                generator.Remotes.RF:InvokeServer(unpack(args))
            end)
        end

        local function fastRepair(generator)
            pcall(function()
                generator.Remotes.RE:FireServer()
            end)
        end
        
        local function runGenerator()
            while shouldContinue() and not allGeneratorsFixed() do
                local generators = {}
                for _, v in ipairs(workspace.Map.Ingame.Map:GetChildren()) do
                    if v.Name == "Generator" and v:FindFirstChild("Progress") and v.Progress.Value < 100 then
                        table.insert(generators, v)
                    end
                end
                
                for _, generator in ipairs(generators) do
                    if not shouldContinue() then break end
                    
                    local char = game.Players.LocalPlayer.Character
                    if char and char:FindFirstChild("HumanoidRootPart") then
                        -- 传送(0.5秒)
                        local startTP = tick()
                        
                        -- 寻找传送点
                        local bestPos, minDist = nil, math.huge
                        if generator:FindFirstChild("Positions") then
                            for _, pos in ipairs(generator.Positions:GetChildren()) do
                                local dist = (char.HumanoidRootPart.Position - pos.Position).Magnitude
                                if dist < minDist then
                                    bestPos = pos
                                    minDist = dist
                                end
                            end
                            
                            if bestPos then
                                char.HumanoidRootPart.CFrame = bestPos.CFrame * CFrame.new(0, 0, -1.2) -- 传送位置
                            end
                        end
                        
                        -- 精确控制传送时间
                        local elapsed = tick() - startTP
                        if elapsed < 0.17 then
                            task.wait(0.17 - elapsed)
                        end
                        
                        -- 交互流程
                        fastInteract(generator, "enter")
                        task.wait(0.00001) -- 最小必要等待
                        
                        -- 单次修理
                        fastRepair(generator)
                        task.wait(0.1) -- 修理确认时间
                        
                        -- 立即离开
                        fastInteract(generator, "leave")
                        
                        -- 循环等待
                        task.wait(0.000000000000001) -- 电机间间隔
                    end
                end
                
                if shouldContinue() then
                    task.wait(0.000000000000000001) -- 循环缓冲
                end
            end
        end

        if enabled then
            if _G.AutoFixThread then
                _G.AutoFixThreadId = tostring(math.random(1, 99999))
                task.cancel(_G.AutoFixThread)
            end
            _G.AutoFixThread = task.spawn(runGenerator)
        else
            _G.AutoFixThreadId = tostring(math.random(1, 99999))
            if _G.AutoFixThread then
                task.cancel(_G.AutoFixThread)
                _G.AutoFixThread = nil
            end
        end
    end
})





local ZZ = Tabs.zdx:AddRightGroupbox('切换服务器')

ZZ:AddButton({
    Text = "Switching server", 
    Func = function()
        local TeleportService = game:GetService("TeleportService")
        local Players = game:GetService("Players")
        local HttpService = game:GetService("HttpService")
        
        local requestFunc = http_request or syn.request or request
        if not requestFunc then return end
            
        local url = "https://games.roblox.com/v1/games/"..game.PlaceId.."/servers/Public?sortOrder=Asc&limit=100"
        local response = requestFunc({Url = url, Method = "GET"})
        
        if response.StatusCode == 200 then
            local data = HttpService:JSONDecode(response.Body)
            if data and data.data and #data.data > 0 then
                TeleportService:TeleportToPlaceInstance(game.PlaceId, data.data[math.random(1, #data.data)].id, Players.LocalPlayer)
            end
        end
    end
})





local Visual = Tabs.Esp:AddRightGroupbox("高亮绘制")

local HighlightSystem = {
    Enabled = false,
    Settings = {
        ShowSurvivors = true,
        ShowKillers = true,
        AutoRefresh = true,
        RefreshRate = 1, -- 默认1秒刷新一次
        Colors = {
            Survivor = Color3.fromRGB(0, 255, 255),
            Killer = Color3.fromRGB(204, 0, 0)
        },
        Transparency = {
            Fill = 0.9,
            Outline = 0
        }
    },
    Cache = {
        Highlights = {},
        Connections = {},
        LastRefreshTime = 0
    }
}

-- 清理无效高亮
local function CleanupInvalidHighlights()
    local charsToRemove = {}
    
    for char, highlight in pairs(HighlightSystem.Cache.Highlights) do
        if not char or not char.Parent or not char:FindFirstChild("Humanoid") then
            pcall(function()
                highlight:Destroy()
            end)
            charsToRemove[char] = true
        end
    end
    
    for char in pairs(charsToRemove) do
        HighlightSystem.Cache.Highlights[char] = nil
    end
end

-- 创建高亮
local function CreateHighlight(char, isKiller)
    if not char or not char.Parent then return nil end
    
    local highlight = Instance.new("Highlight")
    highlight.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
    highlight.FillColor = isKiller and HighlightSystem.Settings.Colors.Killer 
                                     or HighlightSystem.Settings.Colors.Survivor
    highlight.OutlineColor = highlight.FillColor
    highlight.FillTransparency = HighlightSystem.Settings.Transparency.Fill
    highlight.OutlineTransparency = HighlightSystem.Settings.Transparency.Outline
    highlight.Parent = char
    
    -- 监听角色移除
    local charConnection
    charConnection = char.AncestryChanged:Connect(function(_, parent)
        if not parent then
            if highlight and highlight.Parent then
                highlight:Destroy()
            end
            if charConnection then
                charConnection:Disconnect()
            end
            HighlightSystem.Cache.Highlights[char] = nil
        end
    end)
    
    return highlight
end

-- 刷新高亮
local function RefreshHighlights()
    if not HighlightSystem.Enabled then return end
    
    CleanupInvalidHighlights()
    
    -- 更新幸存者
    if HighlightSystem.Settings.ShowSurvivors then
        local survivors = workspace.Players:FindFirstChild("Survivors")
        if survivors then
            for _, char in ipairs(survivors:GetChildren()) do
                if char:IsA("Model") and char:FindFirstChild("Humanoid") and char.Humanoid.Health > 0 then
                    if not HighlightSystem.Cache.Highlights[char] then
                        HighlightSystem.Cache.Highlights[char] = CreateHighlight(char, false)
                    end
                end
            end
        end
    else
        -- 隐藏幸存者高亮
        local survivors = workspace.Players:FindFirstChild("Survivors")
        if survivors then
            for _, char in ipairs(survivors:GetChildren()) do
                if HighlightSystem.Cache.Highlights[char] then
                    HighlightSystem.Cache.Highlights[char]:Destroy()
                    HighlightSystem.Cache.Highlights[char] = nil
                end
            end
        end
    end
    
    -- 更新杀手
    if HighlightSystem.Settings.ShowKillers then
        local killers = workspace.Players:FindFirstChild("Killers")
        if killers then
            for _, char in ipairs(killers:GetChildren()) do
                if char:IsA("Model") and char:FindFirstChild("Humanoid") and char.Humanoid.Health > 0 then
                    if not HighlightSystem.Cache.Highlights[char] then
                        HighlightSystem.Cache.Highlights[char] = CreateHighlight(char, true)
                    end
                end
            end
        end
    else
        -- 隐藏杀手高亮
        local killers = workspace.Players:FindFirstChild("Killers")
        if killers then
            for _, char in ipairs(killers:GetChildren()) do
                if HighlightSystem.Cache.Highlights[char] then
                    HighlightSystem.Cache.Highlights[char]:Destroy()
                    HighlightSystem.Cache.Highlights[char] = nil
                end
            end
        end
    end
end

-- 主更新循环
local function UpdateLoop()
    if not HighlightSystem.Enabled then return end
    
    local currentTime = tick()
    
    -- 自动刷新
    if HighlightSystem.Settings.AutoRefresh then
        if currentTime - HighlightSystem.Cache.LastRefreshTime >= HighlightSystem.Settings.RefreshRate then
            RefreshHighlights()
            HighlightSystem.Cache.LastRefreshTime = currentTime
        end
    end
end

-- UI控制按钮
Visual:AddToggle("HL_MainToggle", {
    Text = "启用高亮绘制",
    Default = false,
    Callback = function(state)
        HighlightSystem.Enabled = state
        if state then
            if not HighlightSystem.Cache.Connections["Main"] then
                HighlightSystem.Cache.Connections["Main"] = game:GetService("RunService").Heartbeat:Connect(UpdateLoop)
            end
            RefreshHighlights()
        else
            if HighlightSystem.Cache.Connections["Main"] then
                HighlightSystem.Cache.Connections["Main"]:Disconnect()
                HighlightSystem.Cache.Connections["Main"] = nil
            end
            for char, highlight in pairs(HighlightSystem.Cache.Highlights) do
                pcall(function()
                    highlight:Destroy()
                end)
            end
            HighlightSystem.Cache.Highlights = {}
        end
    end
})

-- 手动刷新按钮
Visual:AddButton("HL_RefreshButton", {
    Text = "刷新高亮",
    Func = function()
        RefreshHighlights()
    end
})

-- 自动刷新开关
Visual:AddToggle("HL_AutoRefresh", {
    Text = "自动刷新",
    Default = true,
    Callback = function(state)
        HighlightSystem.Settings.AutoRefresh = state
    end
})

-- 刷新频率滑块
Visual:AddSlider("HL_RefreshRate", {
    Text = "刷新频率(秒)",
    Min = 0.5,
    Max = 5,
    Default = 1,
    Rounding = 1,
    Callback = function(value)
        HighlightSystem.Settings.RefreshRate = value
    end
})

-- 幸存者开关
Visual:AddToggle("HL_SurvivorToggle", {
    Text = "绘制幸存者",
    Default = true,
    Callback = function(state)
        HighlightSystem.Settings.ShowSurvivors = state
        RefreshHighlights()
    end
})

-- 杀手开关
Visual:AddToggle("HL_KillerToggle", {
    Text = "绘制杀手", 
    Default = true,
    Callback = function(state)
        HighlightSystem.Settings.ShowKillers = state
        RefreshHighlights()
    end
})

-- 透明度控制
Visual:AddSlider("HL_FillTransparency", {
    Text = "填充透明度",
    Min = 0,
    Max = 1,
    Default = 0.9,
    Rounding = 1,
    Callback = function(value)
        HighlightSystem.Settings.Transparency.Fill = value
        for char, highlight in pairs(HighlightSystem.Cache.Highlights) do
            if highlight and highlight.Parent then
                highlight.FillTransparency = value
            end
        end
    end
})

Visual:AddSlider("HL_OutlineTransparency", {
    Text = "边缘透明度",
    Min = 0,
    Max = 1,
    Default = 0,
    Rounding = 1,
    Callback = function(value)
        HighlightSystem.Settings.Transparency.Outline = value
        for char, highlight in pairs(HighlightSystem.Cache.Highlights) do
            if highlight and highlight.Parent then
                highlight.OutlineTransparency = value
            end
        end
    end
})


local Visual = Tabs.Esp:AddLeftGroupbox("名字绘制")
local NameTagSettings = {
    ShowSurvivorNames = true,
    ShowKillerNames = true,
    BaseTextSize = 14,
    MinTextSize = 8,
    MaxTextSize = 18,
    TextOffset = Vector3.new(0, 3, 0),
    MaxDistance = 100, -- 最大显示距离
    SurvivorColor = Color3.fromRGB(0, 191, 255),
    KillerColor = Color3.fromRGB(255, 0, 0),
    ShowDistance = true,
    AutoRefresh = true,
    RefreshRate = 0.5 -- 刷新频率
}

local NameTagBillboards = {}
local LastUpdateTime = 0

-- 创建名称标签
local function createNameTag(character, isKiller)
    if not character or not character.Parent then return nil end
    
    local head = character:FindFirstChild("Head")
    if not head then return nil end
    
    -- 如果已存在，先清理
    if NameTagBillboards[character] then
        if NameTagBillboards[character].Billboard then
            NameTagBillboards[character].Billboard:Destroy()
        end
    end
    
    local billboard = Instance.new("BillboardGui")
    billboard.Name = "NameTagESP"
    billboard.Size = UDim2.new(0, 200, 0, 40)
    billboard.StudsOffset = NameTagSettings.TextOffset
    billboard.Adornee = head
    billboard.AlwaysOnTop = true
    billboard.Enabled = false
    billboard.Parent = head
    
    local textLabel = Instance.new("TextLabel")
    textLabel.Size = UDim2.new(1, 0, 1, 0)
    textLabel.BackgroundTransparency = 1
    textLabel.TextScaled = false
    textLabel.Font = Enum.Font.Arcade
    textLabel.TextStrokeTransparency = 0
    textLabel.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
    textLabel.TextXAlignment = Enum.TextXAlignment.Center
    textLabel.TextYAlignment = Enum.TextYAlignment.Center
    textLabel.Parent = billboard
    
    NameTagBillboards[character] = {
        Billboard = billboard,
        TextLabel = textLabel,
        IsKiller = isKiller
    }
    
    -- 监听角色移除
    character.AncestryChanged:Connect(function(_, parent)
        if not parent then
            if NameTagBillboards[character] then
                if NameTagBillboards[character].Billboard then
                    NameTagBillboards[character].Billboard:Destroy()
                end
                NameTagBillboards[character] = nil
            end
        end
    end)
    
    return billboard
end

-- 清理无效的名称标签
local function cleanupInvalidNameTags()
    local charsToRemove = {}
    
    for character, data in pairs(NameTagBillboards) do
        if not character or not character.Parent or not character:FindFirstChild("Head") then
            if data.Billboard then
                data.Billboard:Destroy()
            end
            charsToRemove[character] = true
        end
    end
    
    for character in pairs(charsToRemove) do
        NameTagBillboards[character] = nil
    end
end

-- 更新名称标签
local function updateNameTags()
    local currentTime = tick()
    if currentTime - LastUpdateTime < NameTagSettings.RefreshRate then
        return
    end
    LastUpdateTime = currentTime
    
    local success, errorMsg = pcall(function()
        local localPlayer = game.Players.LocalPlayer
        if not localPlayer then return end
        
        local localCharacter = localPlayer.Character
        local localRoot = localCharacter and localCharacter:FindFirstChild("HumanoidRootPart")
        if not localRoot then return end
        
        cleanupInvalidNameTags()
        
        local function processTeam(teamFolder, isKiller)
            if not teamFolder then return end
            
            for _, character in ipairs(teamFolder:GetChildren()) do
                if not character:IsA("Model") or character == localCharacter then
                    continue
                end
                
                local humanoid = character:FindFirstChildOfClass("Humanoid")
                if not humanoid or humanoid.Health <= 0 then
                    if NameTagBillboards[character] then
                        NameTagBillboards[character].Billboard.Enabled = false
                    end
                    continue
                end
                
                -- 创建或获取名称标签
                if not NameTagBillboards[character] then
                    createNameTag(character, isKiller)
                end
                
                local data = NameTagBillboards[character]
                if not data or not data.Billboard then continue end
                
                local head = character:FindFirstChild("Head")
                if not head then
                    data.Billboard.Enabled = false
                    continue
                end
                
                -- 计算距离
                local distance = (head.Position - localRoot.Position).Magnitude
                
                -- 如果距离太远，隐藏标签
                if distance > NameTagSettings.MaxDistance then
                    data.Billboard.Enabled = false
                    continue
                end
                
                -- 更新文本内容
                local displayText = character.Name
                if NameTagSettings.ShowDistance then
                    displayText = string.format("%s\n[%dm]", character.Name, math.floor(distance))
                end
                
                data.TextLabel.Text = displayText
                data.TextLabel.TextColor3 = isKiller and NameTagSettings.KillerColor or NameTagSettings.SurvivorColor
                
                -- 根据距离调整字体大小
                local textSize = math.clamp(
                    NameTagSettings.BaseTextSize - (distance / 10), 
                    NameTagSettings.MinTextSize, 
                    NameTagSettings.MaxTextSize
                )
                data.TextLabel.TextSize = textSize
                
                -- 根据队伍设置决定是否显示
                local shouldShow = (isKiller and NameTagSettings.ShowKillerNames) or 
                                 (not isKiller and NameTagSettings.ShowSurvivorNames)
                data.Billboard.Enabled = shouldShow
            end
        end
        
        -- 处理幸存者
        local survivors = workspace.Players:FindFirstChild("Survivors")
        if survivors then
            processTeam(survivors, false)
        end
        
        -- 处理杀手
        local killers = workspace.Players:FindFirstChild("Killers")
        if killers then
            processTeam(killers, true)
        end
    end)
    
    if not success then
        warn("名称标签更新错误: " .. tostring(errorMsg))
    end
end

-- 清理所有名称标签
local function cleanupAllNameTags()
    for character, data in pairs(NameTagBillboards) do
        if data.Billboard then
            data.Billboard:Destroy()
        end
    end
    NameTagBillboards = {}
end

-- 手动刷新函数
local function refreshNameTags()
    cleanupAllNameTags()
    updateNameTags()
end

-- UI 控制
Visual:AddToggle("NameTagsToggle", {
    Text = "启用名称绘制",
    Default = false,
    Callback = function(enabled)
        if enabled then
            if not NameTagSettings.connection then
                NameTagSettings.connection = game:GetService("RunService").Heartbeat:Connect(updateNameTags)
            end
            refreshNameTags()
        else
            if NameTagSettings.connection then
                NameTagSettings.connection:Disconnect()
                NameTagSettings.connection = nil
            end
            cleanupAllNameTags()
        end
    end
})

-- 手动刷新按钮
Visual:AddButton("RefreshNameTags", {
    Text = "刷新名称标签",
    Func = refreshNameTags
})

-- 自动刷新开关
Visual:AddToggle("NameTagsAutoRefresh", {
    Text = "自动刷新",
    Default = true,
    Callback = function(enabled)
        NameTagSettings.AutoRefresh = enabled
    end
})

-- 刷新频率滑块
Visual:AddSlider("NameTagsRefreshRate", {
    Text = "刷新频率(秒)",
    Min = 0.3,
    Max = 2,
    Default = 0.5,
    Rounding = 1,
    Callback = function(value)
        NameTagSettings.RefreshRate = value
    end
})

-- 最大距离滑块
Visual:AddSlider("NameTagsMaxDistance", {
    Text = "最大显示距离",
    Min = 50,
    Max = 8000,
    Default = 100,
    Rounding = 1,
    Callback = function(value)
        NameTagSettings.MaxDistance = value
    end
})

Visual:AddToggle("ShowSurvivorNames", {
    Text = "绘制幸存者名称",
    Default = true,
    Callback = function(enabled)
        NameTagSettings.ShowSurvivorNames = enabled
        refreshNameTags()
    end
})

Visual:AddToggle("ShowKillerNames", {
    Text = "绘制杀手名称",
    Default = true,
    Callback = function(enabled)
        NameTagSettings.ShowKillerNames = enabled
        refreshNameTags()
    end
})

Visual:AddToggle("ShowDistance", {
    Text = "绘制距离",
    Default = true,
    Callback = function(enabled)
        NameTagSettings.ShowDistance = enabled
    end
})
local Visual = Tabs.Esp:AddLeftGroupbox("绘制血量［文字］")


local camera = workspace.CurrentCamera
local localPlayer = game:GetService("Players").LocalPlayer

Visual:AddToggle("SurvivorHealth", {
    Text = "绘制幸存者血量",
    Default = false,
    Callback = function(v)
        if v then
            local sur = workspace.Players.Survivors
            
            local function survivoresp(char)
                local billboard = Instance.new("BillboardGui")
                billboard.Size = UDim2.new(3, 0, 1, 0)
                billboard.StudsOffset = Vector3.new(0, 1.5, 0)
                billboard.Adornee = char.Head
                billboard.Parent = char.Head
                billboard.AlwaysOnTop = true
                
                local textLabel = Instance.new("TextLabel")
                textLabel.Size = UDim2.new(1, 0, 1, 0)
                textLabel.Position = UDim2.new(0, 0, 0, 0)
                textLabel.BackgroundTransparency = 1
                textLabel.TextScaled = false
                textLabel.Text = "血量: "..char.Humanoid.Health.."/"..char.Humanoid.MaxHealth
                textLabel.TextColor3 = Color3.fromRGB(0, 255, 0)
                textLabel.Font = Enum.Font.Arcade
                textLabel.Parent = billboard

              
                local distanceUpdate
                distanceUpdate = game:GetService("RunService").RenderStepped:Connect(function()
                    if char:FindFirstChild("Head") and localPlayer.Character and localPlayer.Character:FindFirstChild("HumanoidRootPart") then
                        local distance = (char.Head.Position - localPlayer.Character.HumanoidRootPart.Position).Magnitude
                        
                        local textSize = math.clamp(30 - (distance / 2), 12, 20)
                        textLabel.TextSize = textSize
                    end
                end)

                local healthUpdate = char:FindFirstChild("Humanoid").HealthChanged:Connect(function()
                    textLabel.Text = "血量: "..char:FindFirstChild("Humanoid").Health.."/"..char:FindFirstChild("Humanoid").MaxHealth
                end)

                char:FindFirstChild("Humanoid").Died:Connect(function()
                    distanceUpdate:Disconnect()
                    healthUpdate:Disconnect()
                    textLabel.Text = ""
                end)

                return {billboard = billboard, connections = {distanceUpdate, healthUpdate}}
            end

            getgenv().SurvivorHealthConnections = {
                Added = sur.DescendantAdded:Connect(function(v)
                    if v:IsA("Model") and v:FindFirstChild("Humanoid") then
                        repeat wait() until v:FindFirstChild("Humanoid")
                        survivoresp(v)
                    end
                end)
            }

            for _,v in pairs(sur:GetDescendants()) do
                if v:IsA("Model") and v:FindFirstChild("Humanoid") then
                    repeat wait() until v:FindFirstChild("Humanoid")
                    survivoresp(v)
                end
            end
        else
            if getgenv().SurvivorHealthConnections then
                getgenv().SurvivorHealthConnections.Added:Disconnect()
            end
            
            for _,v in pairs(workspace.Players.Survivors:GetDescendants()) do
                if v:IsA("Model") and v:FindFirstChild("Head") then
                    for _,child in pairs(v.Head:GetChildren()) do
                        if child:IsA("BillboardGui") then
                            child:Destroy()
                        end
                    end
                end
            end
        end
    end
})

Visual:AddToggle("KillerHealth", {
    Text = "绘制杀手血量",
    Default = false,
    Callback = function(v)
        if v then
            local kil = workspace.Players.Killers
            
            local function killeresp(char)
                local billboard = Instance.new("BillboardGui")
                billboard.Size = UDim2.new(3, 0, 1, 0)
                billboard.StudsOffset = Vector3.new(0, 1.5, 0)
                billboard.Adornee = char.Head
                billboard.Parent = char.Head
                billboard.AlwaysOnTop = true
                
                local textLabel = Instance.new("TextLabel")
                textLabel.Size = UDim2.new(1, 0, 1, 0)
                textLabel.Position = UDim2.new(0, 0, 0, 0)
                textLabel.BackgroundTransparency = 1
                textLabel.TextScaled = false
                textLabel.Text = "血量: "..char.Humanoid.Health.."/"..char.Humanoid.MaxHealth
                textLabel.TextColor3 = Color3.fromRGB(255, 255, 0)
                textLabel.Font = Enum.Font.Arcade
                textLabel.Parent = billboard

                -- 添加距离检测更新
                local distanceUpdate
                distanceUpdate = game:GetService("RunService").RenderStepped:Connect(function()
                    if char:FindFirstChild("Head") and localPlayer.Character and localPlayer.Character:FindFirstChild("HumanoidRootPart") then
                        local distance = (char.Head.Position - localPlayer.Character.HumanoidRootPart.Position).Magnitude
                        -- 根据距离动态调整文字大小 (10-30米范围内变化)
                        local textSize = math.clamp(30 - (distance / 2), 12, 20)
                        textLabel.TextSize = textSize
                    end
                end)

                local healthUpdate = char:FindFirstChild("Humanoid").HealthChanged:Connect(function()
                    textLabel.Text = "blood volume: "..char:FindFirstChild("Humanoid").Health.."/"..char:FindFirstChild("Humanoid").MaxHealth
                end)

                char:FindFirstChild("Humanoid").Died:Connect(function()
                    distanceUpdate:Disconnect()
                    healthUpdate:Disconnect()
                    textLabel.Text = ""
                end)

                return {billboard = billboard, connections = {distanceUpdate, healthUpdate}}
            end

            getgenv().KillerHealthConnections = {
                Added = kil.DescendantAdded:Connect(function(v)
                    if v:IsA("Model") and v:FindFirstChild("Humanoid") then
                        repeat wait() until v:FindFirstChild("Humanoid")
                        killeresp(v)
                    end
                end)
            }

            for _,v in pairs(kil:GetDescendants()) do
                if v:IsA("Model") and v:FindFirstChild("Humanoid") then
                    repeat wait() until v:FindFirstChild("Humanoid")
                    killeresp(v)
                end
            end
        else
            if getgenv().KillerHealthConnections then
                getgenv().KillerHealthConnections.Added:Disconnect()
            end
            
            for _,v in pairs(workspace.Players.Killers:GetDescendants()) do
                if v:IsA("Model") and v:FindFirstChild("Head") then
                    for _,child in pairs(v.Head:GetChildren()) do
                        if child:IsA("BillboardGui") then
                            child:Destroy()
                        end
                    end
                end
            end
        end
    end
})





local Visual   = Tabs.Esp:AddRightGroupbox('电机绘制')
Visual:AddToggle("RealGeneratorESP", {
    Text = "绘制电机",
    Default = false,
    Callback = function(enabled)
        if not _G.RealGeneratorESP then
            _G.RealGeneratorESP = {
                Active = false,
                Data = {},
                Connections = {}
            }
        end
        
        if not enabled then
            if _G.RealGeneratorESP.Active then
                for _, connection in pairs(_G.RealGeneratorESP.Connections) do
                    if connection and connection.Connected then
                        connection:Disconnect()
                    end
                end
                
                for gen, data in pairs(_G.RealGeneratorESP.Data) do
                    if type(data) == "table" then
                        if data.Billboard and data.Billboard.Parent then
                            data.Billboard:Destroy()
                        end
                        if data.DistanceBillboard and data.DistanceBillboard.Parent then
                            data.DistanceBillboard:Destroy()
                        end
                        if data.Highlight and data.Highlight.Parent then
                            data.Highlight:Destroy()
                        end
                    end
                end
                
                _G.RealGeneratorESP.Data = {}
                _G.RealGeneratorESP.Connections = {}
                _G.RealGeneratorESP.Active = false
            end
            return
        end
        
        if _G.RealGeneratorESP.Active then
            return
        end
        
        _G.RealGeneratorESP.Active = true
        
        local scanInterval = 1.0
        local lastScanTime = 0
        local maxGenerators = 20
        
        local distanceSettings = {
            MinDistance = 5,
            MaxDistance = 500,
            MinScale = 0.8,
            MaxScale = 1.5,
            MinTextSize = 8,
            MaxTextSize = 10
        }
        
        local function updateGeneratorESP(gen, data)
            if not gen or not gen.Parent or not gen:FindFirstChild("Main") then
                return false
            end
            
            if table.getn(_G.RealGeneratorESP.Data) > maxGenerators then
                return false
            end
            
            if gen:FindFirstChild("Progress") then
                local progress = gen.Progress.Value
                if progress >= 99 then
                    return false
                end
                
                if data.TextLabel then
                    data.TextLabel.Text = string.format("修机进度: %d%%", progress)
                end
                
                local character = game:GetService("Players").LocalPlayer.Character
                local humanoidRootPart = character and character:FindFirstChild("HumanoidRootPart")
                
                if humanoidRootPart and data.DistanceLabel then
                    local distance = (gen.Main.Position - humanoidRootPart.Position).Magnitude
                    
                    data.DistanceLabel.Text = string.format("距离: %dm", math.floor(distance))
                    
                    local distanceRatio = math.clamp(
                        (distance - distanceSettings.MinDistance) / 
                        (distanceSettings.MaxDistance - distanceSettings.MinDistance),
                        0, 1
                    )
                    
                    local scale = distanceSettings.MinScale + 
                        distanceRatio * (distanceSettings.MaxScale - distanceSettings.MinScale)
                    
                    local textSize = distanceSettings.MinTextSize + 
                        distanceRatio * (distanceSettings.MaxTextSize - distanceSettings.MinTextSize)
                    
                    if data.Billboard then 
                        data.Billboard.Size = UDim2.new(4 * scale, 0, 1 * scale, 0)
                        data.Billboard.Enabled = true
                    end
                    
                    if data.DistanceBillboard then 
                        data.DistanceBillboard.Size = UDim2.new(4 * scale, 0, 1 * scale, 0)
                        data.DistanceBillboard.Enabled = true
                    end
                    
                    if data.TextLabel then 
                        data.TextLabel.TextSize = textSize
                        data.TextLabel.Visible = true
                    end
                    
                    if data.DistanceLabel then 
                        data.DistanceLabel.TextSize = textSize
                        data.DistanceLabel.Visible = true
                    end
                    
                    if data.Highlight then
                        data.Highlight.Enabled = true
                        local transparency = math.clamp((distance - 50) / 100, 0, 0.4)
                        data.Highlight.FillTransparency = 0.85 + (transparency * 0.5)
                        data.Highlight.OutlineColor = Color3.fromRGB(0, 255, 0) -- 绿色
                        data.Highlight.FillColor = Color3.fromRGB(0, 255, 0)
                    end
                end
            end
            
            return true
        end
        
        local function createGeneratorESP(gen)
            if not gen or not gen:FindFirstChild("Main") or _G.RealGeneratorESP.Data[gen] then 
                return 
            end
            
            if table.getn(_G.RealGeneratorESP.Data) >= maxGenerators then
                return
            end
            
            local billboard = Instance.new("BillboardGui")
            billboard.Name = "RealGeneratorESP"
            billboard.Size = UDim2.new(4, 0, 1, 0)
            billboard.StudsOffset = Vector3.new(0, 2.5, 0)
            billboard.Adornee = gen.Main
            billboard.Parent = gen.Main
            billboard.AlwaysOnTop = true
            billboard.Enabled = true
            
            local textLabel = Instance.new("TextLabel")
            textLabel.Size = UDim2.new(1, 0, 0.5, 0)
            textLabel.BackgroundTransparency = 1
            textLabel.TextScaled = false
            textLabel.Text = "真电机加载中..."
            textLabel.TextColor3 = Color3.fromRGB(0, 255, 0) -- 绿色
            textLabel.Font = Enum.Font.Arcade
            textLabel.TextStrokeTransparency = 0
            textLabel.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
            textLabel.TextSize = 8
            textLabel.Parent = billboard
            
            local distanceBillboard = Instance.new("BillboardGui")
            distanceBillboard.Name = "RealGeneratorDistanceESP"
            distanceBillboard.Size = UDim2.new(4, 0, 1, 0)
            distanceBillboard.StudsOffset = Vector3.new(0, 3.5, 0)
            distanceBillboard.Adornee = gen.Main
            distanceBillboard.Parent = gen.Main
            distanceBillboard.AlwaysOnTop = true
            distanceBillboard.Enabled = true
            
            local distanceLabel = Instance.new("TextLabel")
            distanceLabel.Size = UDim2.new(1, 0, 0.5, 0)
            distanceLabel.BackgroundTransparency = 1
            distanceLabel.TextScaled = false
            distanceLabel.Text = "计算距离中..."
            distanceLabel.TextColor3 = Color3.fromRGB(255, 255, 0)
            distanceLabel.Font = Enum.Font.Arcade
            distanceLabel.TextStrokeTransparency = 0
            distanceLabel.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
            distanceLabel.TextSize = 8
            distanceLabel.Parent = distanceBillboard
            
            local highlight = Instance.new("Highlight")
            highlight.Name = "RealGeneratorHighlight"
            highlight.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
            highlight.Enabled = true
            highlight.OutlineColor = Color3.fromRGB(0, 255, 0) -- 绿色
            highlight.FillColor = Color3.fromRGB(0, 255, 0)
            highlight.FillTransparency = 0.9
            highlight.OutlineTransparency = 0
            highlight.Parent = gen
            
            _G.RealGeneratorESP.Data[gen] = {
                Billboard = billboard,
                DistanceBillboard = distanceBillboard,
                TextLabel = textLabel,
                DistanceLabel = distanceLabel,
                Highlight = highlight
            }
            
            local destroyConnection
            destroyConnection = gen.Destroying:Connect(function()
                if _G.RealGeneratorESP.Data[gen] then
                    if _G.RealGeneratorESP.Data[gen].Billboard then 
                        _G.RealGeneratorESP.Data[gen].Billboard:Destroy() 
                    end
                    if _G.RealGeneratorESP.Data[gen].DistanceBillboard then 
                        _G.RealGeneratorESP.Data[gen].DistanceBillboard:Destroy() 
                    end
                    if _G.RealGeneratorESP.Data[gen].Highlight then 
                        _G.RealGeneratorESP.Data[gen].Highlight:Destroy() 
                    end
                    _G.RealGeneratorESP.Data[gen] = nil
                end
                if destroyConnection then
                    destroyConnection:Disconnect()
                end
            end)
            
            table.insert(_G.RealGeneratorESP.Connections, destroyConnection)
        end
        
        local function scanGenerators()
            local mapFolder = workspace:FindFirstChild("Map")
            if mapFolder then
                local ingameFolder = mapFolder:FindFirstChild("Ingame")
                if ingameFolder then
                    local mapSubFolder = ingameFolder:FindFirstChild("Map")
                    if mapSubFolder then
                        local generators = mapSubFolder:GetDescendants()
                        for _, gen in pairs(generators) do
                            if gen:IsA("Model") and gen:FindFirstChild("Main") and gen.Name == "Generator" then
                                createGeneratorESP(gen)
                            end
                        end
                    end
                end
            end
        end
        
        local mainConnection
        local mapFolder = workspace:FindFirstChild("Map")
        if mapFolder then
            local ingameFolder = mapFolder:FindFirstChild("Ingame")
            if ingameFolder then
                local mapSubFolder = ingameFolder:FindFirstChild("Map")
                if mapSubFolder then
                    mainConnection = mapSubFolder.DescendantAdded:Connect(function(v)
                        if v:IsA("Model") and v:FindFirstChild("Main") and v.Name == "Generator" then
                            createGeneratorESP(v)
                        end
                    end)
                end
            end
        end
        
        if mainConnection then
            table.insert(_G.RealGeneratorESP.Connections, mainConnection)
        end
        
        local heartbeatConnection = game:GetService("RunService").Heartbeat:Connect(function(deltaTime)
            lastScanTime = lastScanTime + deltaTime
            if lastScanTime >= scanInterval then
                lastScanTime = 0
                scanGenerators()
            end
            
            local gensToRemove = {}
            for gen, data in pairs(_G.RealGeneratorESP.Data) do
                if not gen or not gen.Parent then
                    table.insert(gensToRemove, gen)
                else
                    if not updateGeneratorESP(gen, data) then
                        table.insert(gensToRemove, gen)
                    end
                end
            end
            
            for _, gen in ipairs(gensToRemove) do
                if _G.RealGeneratorESP.Data[gen] then
                    if _G.RealGeneratorESP.Data[gen].Billboard then 
                        _G.RealGeneratorESP.Data[gen].Billboard:Destroy() 
                    end
                    if _G.RealGeneratorESP.Data[gen].DistanceBillboard then 
                        _G.RealGeneratorESP.Data[gen].DistanceBillboard:Destroy() 
                    end
                    if _G.RealGeneratorESP.Data[gen].Highlight then 
                        _G.RealGeneratorESP.Data[gen].Highlight:Destroy() 
                    end
                    _G.RealGeneratorESP.Data[gen] = nil
                end
            end
        end)
        
        table.insert(_G.RealGeneratorESP.Connections, heartbeatConnection)
        
        scanGenerators()
    end
})

-- 假电机ESP
Visual:AddToggle("FakeGeneratorESP", {
    Text = "绘制假电机",
    Default = false,
    Callback = function(enabled)
        if not _G.FakeGeneratorESP then
            _G.FakeGeneratorESP = {
                Active = false,
                Data = {},
                Connections = {}
            }
        end
        
        if not enabled then
            if _G.FakeGeneratorESP.Active then
                for _, connection in pairs(_G.FakeGeneratorESP.Connections) do
                    if connection and connection.Connected then
                        connection:Disconnect()
                    end
                end
                
                for gen, data in pairs(_G.FakeGeneratorESP.Data) do
                    if type(data) == "table" then
                        if data.Highlight and data.Highlight.Parent then
                            data.Highlight:Destroy()
                        end
                        if data.NameLabel and data.NameLabel.Parent then
                            data.NameLabel:Destroy()
                        end
                    end
                end
                
                _G.FakeGeneratorESP.Data = {}
                _G.FakeGeneratorESP.Connections = {}
                _G.FakeGeneratorESP.Active = false
            end
            return
        end
        
        if _G.FakeGeneratorESP.Active then
            _G.FakeGeneratorESP.Callback(false)
        end
        
        _G.FakeGeneratorESP.Active = true
        
        local scanInterval = 1.0
        local lastScanTime = 0
        
        local function createFakeGeneratorESP(gen)
            if not gen or not gen:FindFirstChild("Main") or _G.FakeGeneratorESP.Data[gen] then 
                return 
            end
            
            local highlight = Instance.new("Highlight")
            highlight.Name = "FakeGeneratorHighlight"
            highlight.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
            highlight.Enabled = true
            highlight.OutlineColor = Color3.fromRGB(255, 0, 0)
            highlight.FillColor = Color3.fromRGB(255, 0, 0)
            highlight.FillTransparency = 0.9
            highlight.OutlineTransparency = 0
            highlight.Parent = gen
            
            local nameBillboard = Instance.new("BillboardGui")
            nameBillboard.Name = "FakeGeneratorNameESP"
            nameBillboard.Size = UDim2.new(4, 0, 1, 0)
            nameBillboard.StudsOffset = Vector3.new(0, 2.5, 0)
            nameBillboard.Adornee = gen.Main
            nameBillboard.Parent = gen.Main
            nameBillboard.AlwaysOnTop = true
            nameBillboard.Enabled = true
            
            local nameLabel = Instance.new("TextLabel")
            nameLabel.Size = UDim2.new(1, 0, 1, 0)
            nameLabel.BackgroundTransparency = 1
            nameLabel.TextScaled = false
            nameLabel.Text = "假电机"
            nameLabel.TextColor3 = Color3.fromRGB(255, 0, 0)
            nameLabel.Font = Enum.Font.Arcade
            nameLabel.TextStrokeTransparency = 0
            nameLabel.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
            nameLabel.TextSize = 12
            nameLabel.Parent = nameBillboard
            
            _G.FakeGeneratorESP.Data[gen] = {
                Highlight = highlight,
                NameLabel = nameLabel,
                NameBillboard = nameBillboard
            }
            
            local destroyConnection
            destroyConnection = gen.Destroying:Connect(function()
                if _G.FakeGeneratorESP.Data[gen] then
                    if _G.FakeGeneratorESP.Data[gen].Highlight then 
                        _G.FakeGeneratorESP.Data[gen].Highlight:Destroy() 
                    end
                    if _G.FakeGeneratorESP.Data[gen].NameLabel then 
                        _G.FakeGeneratorESP.Data[gen].NameLabel:Destroy() 
                    end
                    if _G.FakeGeneratorESP.Data[gen].NameBillboard then 
                        _G.FakeGeneratorESP.Data[gen].NameBillboard:Destroy() 
                    end
                    _G.FakeGeneratorESP.Data[gen] = nil
                end
                if destroyConnection then
                    destroyConnection:Disconnect()
                end
            end)
            
            table.insert(_G.FakeGeneratorESP.Connections, destroyConnection)
        end
        
        local function scanGenerators()
            local mapFolder = workspace:FindFirstChild("Map")
            if mapFolder then
                local ingameFolder = mapFolder:FindFirstChild("Ingame")
                if ingameFolder then
                    local mapSubFolder = ingameFolder:FindFirstChild("Map")
                    if mapSubFolder then
                        local generators = mapSubFolder:GetDescendants()
                        for _, gen in pairs(generators) do
                            if gen:IsA("Model") and gen:FindFirstChild("Main") and gen.Name == "FakeGenerator" then
                                createFakeGeneratorESP(gen)
                            end
                        end
                    end
                end
            end
        end
        
        local mainConnection
        local mapFolder = workspace:FindFirstChild("Map")
        if mapFolder then
            local ingameFolder = mapFolder:FindFirstChild("Ingame")
            if ingameFolder then
                local mapSubFolder = ingameFolder:FindFirstChild("Map")
                if mapSubFolder then
                    mainConnection = mapSubFolder.DescendantAdded:Connect(function(v)
                        if v:IsA("Model") and v:FindFirstChild("Main") and v.Name == "FakeGenerator" then
                            createFakeGeneratorESP(v)
                        end
                    end)
                end
            end
        end
        
        if mainConnection then
            table.insert(_G.FakeGeneratorESP.Connections, mainConnection)
        end
        
        local heartbeatConnection = game:GetService("RunService").Heartbeat:Connect(function(deltaTime)
            lastScanTime = lastScanTime + deltaTime
            if lastScanTime >= scanInterval then
                lastScanTime = 0
                scanGenerators()
            end
            
            local gensToRemove = {}
            for gen, data in pairs(_G.FakeGeneratorESP.Data) do
                if not gen or not gen.Parent then
                    table.insert(gensToRemove, gen)
                end
            end
            
            for _, gen in ipairs(gensToRemove) do
                if _G.FakeGeneratorESP.Data[gen] then
                    if _G.FakeGeneratorESP.Data[gen].Highlight then 
                        _G.FakeGeneratorESP.Data[gen].Highlight:Destroy() 
                    end
                    if _G.FakeGeneratorESP.Data[gen].NameLabel then 
                        _G.FakeGeneratorESP.Data[gen].NameLabel:Destroy() 
                    end
                    if _G.FakeGeneratorESP.Data[gen].NameBillboard then 
                        _G.FakeGeneratorESP.Data[gen].NameBillboard:Destroy() 
                    end
                    _G.FakeGeneratorESP.Data[gen] = nil
                end
            end
        end)
        
        table.insert(_G.FakeGeneratorESP.Connections, heartbeatConnection)
        
        scanGenerators()
    end
})

-- 特殊电机ESP
Visual:AddToggle("NoliWarningESP", {
    Text = "Noli即将传送的电机",
    Default = false,
    Callback = function(enabled)
        if not _G.NoliWarningESP then
            _G.NoliWarningESP = {
                Active = false,
                Data = {},
                Connections = {}
            }
        end
        
        if not enabled then
            if _G.NoliWarningESP.Active then
                for _, connection in pairs(_G.NoliWarningESP.Connections) do
                    if connection and connection.Connected then
                        connection:Disconnect()
                    end
                end
                
                for gen, data in pairs(_G.NoliWarningESP.Data) do
                    if type(data) == "table" then
                        if data.Highlight and data.Highlight.Parent then
                            data.Highlight:Destroy()
                        end
                        if data.Label and data.Label.Parent then
                            data.Label:Destroy()
                        end
                    end
                end
                
                _G.NoliWarningESP.Data = {}
                _G.NoliWarningESP.Connections = {}
                _G.NoliWarningESP.Active = false
            end
            return
        end
        
        if _G.NoliWarningESP.Active then
            return
        end
        
        _G.NoliWarningESP.Active = true
        
        local scanInterval = 1.0
        local lastScanTime = 0
        
        local function hasNoliWarning(gen)
            if string.find(gen.Name, "NoliWarningIncoming") then
                return true
            end
            
            for _, child in pairs(gen:GetDescendants()) do
                if (child:IsA("StringValue") or child:IsA("ObjectValue")) and 
                   string.find(tostring(child.Value), "NoliWarningIncoming") then
                    return true
                elseif child:IsA("BasePart") and string.find(child.Name, "NoliWarningIncoming") then
                    return true
                end
            end
            
            return false
        end
        
        local function createNoliWarningESP(gen)
            if not gen or not gen:FindFirstChild("Main") or _G.NoliWarningESP.Data[gen] then 
                return 
            end
            
            if not hasNoliWarning(gen) then
                return
            end
            
            local highlight = Instance.new("Highlight")
            highlight.Name = "NoliWarningHighlight"
            highlight.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
            highlight.Enabled = true
            highlight.OutlineColor = Color3.fromRGB(255, 0, 255)
            highlight.FillColor = Color3.fromRGB(255, 0, 255)
            highlight.FillTransparency = 0.7
            highlight.OutlineTransparency = 0
            highlight.Parent = gen
            
            local billboard = Instance.new("BillboardGui")
            billboard.Name = "NoliWarningBillboard"
            billboard.Size = UDim2.new(6, 0, 2, 0)
            billboard.StudsOffset = Vector3.new(0, 3, 0)
            billboard.Adornee = gen.Main
            billboard.Parent = gen.Main
            billboard.AlwaysOnTop = true
            
            local label = Instance.new("TextLabel")
            label.Size = UDim2.new(1, 0, 1, 0)
            label.BackgroundTransparency = 1
            label.Text = "[Noli Will Tp]"
            label.TextColor3 = Color3.fromRGB(255, 0, 255)
            label.Font = Enum.Font.Arcade
            label.TextSize = 14
            label.TextStrokeTransparency = 0
            label.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
            label.Parent = billboard
            
            _G.NoliWarningESP.Data[gen] = {
                Highlight = highlight,
                Label = label,
                Billboard = billboard,
                LastCheck = os.time()
            }
            
            local destroyConnection
            destroyConnection = gen.Destroying:Connect(function()
                if _G.NoliWarningESP.Data[gen] then
                    if _G.NoliWarningESP.Data[gen].Highlight then 
                        _G.NoliWarningESP.Data[gen].Highlight:Destroy() 
                    end
                    if _G.NoliWarningESP.Data[gen].Label then 
                        _G.NoliWarningESP.Data[gen].Label:Destroy() 
                    end
                    if _G.NoliWarningESP.Data[gen].Billboard then 
                        _G.NoliWarningESP.Data[gen].Billboard:Destroy() 
                    end
                    _G.NoliWarningESP.Data[gen] = nil
                end
                if destroyConnection then
                    destroyConnection:Disconnect()
                end
            end)
            
            table.insert(_G.NoliWarningESP.Connections, destroyConnection)
        end
        
        local function scanGenerators()
            local generators = workspace:GetDescendants()
            for _, gen in pairs(generators) do
                if gen:IsA("Model") and gen:FindFirstChild("Main") and 
                   (gen.Name == "Generator" or gen.Name == "FakeGenerator") then
                    createNoliWarningESP(gen)
                end
            end
        end
        
        local function updateExistingGenerators()
            local gensToRemove = {}
            for gen, data in pairs(_G.NoliWarningESP.Data) do
                if not gen or not gen.Parent then
                    table.insert(gensToRemove, gen)
                else
                    if os.time() - data.LastCheck > 5 then
                        if not hasNoliWarning(gen) then
                            table.insert(gensToRemove, gen)
                        else
                            data.LastCheck = os.time()
                        end
                    end
                end
            end
            
            for _, gen in ipairs(gensToRemove) do
                if _G.NoliWarningESP.Data[gen] then
                    if _G.NoliWarningESP.Data[gen].Highlight then 
                        _G.NoliWarningESP.Data[gen].Highlight:Destroy() 
                    end
                    if _G.NoliWarningESP.Data[gen].Label then 
                        _G.NoliWarningESP.Data[gen].Label:Destroy() 
                    end
                    if _G.NoliWarningESP.Data[gen].Billboard then 
                        _G.NoliWarningESP.Data[gen].Billboard:Destroy() 
                    end
                    _G.NoliWarningESP.Data[gen] = nil
                end
            end
        end
        
        local mainConnection = workspace.DescendantAdded:Connect(function(v)
            if v:IsA("Model") and v:FindFirstChild("Main") and 
               (v.Name == "Generator" or v.Name == "FakeGenerator") then
                createNoliWarningESP(v)
            end
        end)
        
        table.insert(_G.NoliWarningESP.Connections, mainConnection)
        
        local heartbeatConnection = game:GetService("RunService").Heartbeat:Connect(function(deltaTime)
            lastScanTime = lastScanTime + deltaTime
            if lastScanTime >= scanInterval then
                lastScanTime = 0
                scanGenerators()
                updateExistingGenerators()
            end
        end)
        
        table.insert(_G.NoliWarningESP.Connections, heartbeatConnection)
        
        scanGenerators()
    end
})


Visual:AddToggle("FakeGeneratorESP", {
    Text = "绘制假电机",
    Default = false,
    Callback = function(enabled)
        if not _G.FakeGeneratorESP then
            _G.FakeGeneratorESP = {
                Active = false,
                Data = {},
                Connections = {}
            }
        end
        
        if not enabled then
            if _G.FakeGeneratorESP.Active then
                for _, connection in pairs(_G.FakeGeneratorESP.Connections) do
                    if connection then
                        connection:Disconnect()
                    end
                end
                
                for gen, data in pairs(_G.FakeGeneratorESP.Data) do
                    if data.Highlight then data.Highlight:Destroy() end
                    if data.NameBillboard then data.NameBillboard:Destroy() end
                end
                
                _G.FakeGeneratorESP.Data = {}
                _G.FakeGeneratorESP.Connections = {}
                _G.FakeGeneratorESP.Active = false
            end
            return
        end
        
        if _G.FakeGeneratorESP.Active then return end
        _G.FakeGeneratorESP.Active = true
        
        local lastScanTime = 0
        local scanInterval = 3.0
        
        local function createFakeGeneratorESP(gen)
            if not gen or not gen:FindFirstChild("Main") or _G.FakeGeneratorESP.Data[gen] then return end
            
            local highlight = Instance.new("Highlight")
            highlight.Name = "FakeGeneratorHighlight"
            highlight.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
            highlight.Enabled = false
            highlight.OutlineColor = Color3.fromRGB(255, 0, 0)
            highlight.FillColor = Color3.fromRGB(255, 0, 0)
            highlight.FillTransparency = 0.9
            highlight.OutlineTransparency = 0
            highlight.Parent = gen
            
            local nameBillboard = Instance.new("BillboardGui")
            nameBillboard.Name = "FakeGeneratorNameESP"
            nameBillboard.Size = UDim2.new(4, 0, 1, 0)
            nameBillboard.StudsOffset = Vector3.new(0, 2.5, 0)
            nameBillboard.Adornee = gen.Main
            nameBillboard.Parent = gen.Main
            nameBillboard.AlwaysOnTop = true
            nameBillboard.Enabled = false
            
            local nameLabel = Instance.new("TextLabel")
            nameLabel.Size = UDim2.new(1, 0, 1, 0)
            nameLabel.BackgroundTransparency = 1
            nameLabel.Text = "假电机"
            nameLabel.TextColor3 = Color3.fromRGB(255, 0, 0)
            nameLabel.Font = Enum.Font.Arcade
            nameLabel.TextStrokeTransparency = 0
            nameLabel.TextSize = 12
            nameLabel.Parent = nameBillboard
            
            _G.FakeGeneratorESP.Data[gen] = {
                Highlight = highlight,
                NameBillboard = nameBillboard,
                NameLabel = nameLabel
            }
            
            local destroyConnection = gen.Destroying:Connect(function()
                if _G.FakeGeneratorESP.Data[gen] then
                    if _G.FakeGeneratorESP.Data[gen].Highlight then _G.FakeGeneratorESP.Data[gen].Highlight:Destroy() end
                    if _G.FakeGeneratorESP.Data[gen].NameBillboard then _G.FakeGeneratorESP.Data[gen].NameBillboard:Destroy() end
                    _G.FakeGeneratorESP.Data[gen] = nil
                end
            end)
            
            table.insert(_G.FakeGeneratorESP.Connections, destroyConnection)
        end
        
        local function updateFakeGeneratorESP(gen, data)
            if not gen or not gen.Parent then return false end
            
            local character = game.Players.LocalPlayer.Character
            local humanoidRootPart = character and character:FindFirstChild("HumanoidRootPart")
            
            if humanoidRootPart then
                local distance = (gen.Main.Position - humanoidRootPart.Position).Magnitude
                
                if distance < 80 then
                    data.Highlight.Enabled = true
                    data.NameBillboard.Enabled = true
                    local transparency = math.clamp(distance / 80, 0.1, 0.9)
                    data.Highlight.FillTransparency = 0.7 + transparency * 0.2
                else
                    data.Highlight.Enabled = false
                    data.NameBillboard.Enabled = false
                end
            end
            
            return true
        end
        
        local function scanGenerators()
            local mapFolder = workspace:FindFirstChild("Map")
            local ingameFolder = mapFolder and mapFolder:FindFirstChild("Ingame")
            local mapSubFolder = ingameFolder and ingameFolder:FindFirstChild("Map")
            
            if mapSubFolder then
                for _, gen in pairs(mapSubFolder:GetDescendants()) do
                    if gen:IsA("Model") and gen:FindFirstChild("Main") and gen.Name == "FakeGenerator" then
                        createFakeGeneratorESP(gen)
                    end
                end
            end
        end
        
        local mainConnection
        local mapFolder = workspace:FindFirstChild("Map")
        local ingameFolder = mapFolder and mapFolder:FindFirstChild("Ingame")
        local mapSubFolder = ingameFolder and ingameFolder:FindFirstChild("Map")
        
        if mapSubFolder then
            mainConnection = mapSubFolder.DescendantAdded:Connect(function(v)
                if v:IsA("Model") and v:FindFirstChild("Main") and v.Name == "FakeGenerator" then
                    createFakeGeneratorESP(v)
                end
            end)
            table.insert(_G.FakeGeneratorESP.Connections, mainConnection)
        end
        
        local heartbeatConnection = game:GetService("RunService").Heartbeat:Connect(function(deltaTime)
            lastScanTime = lastScanTime + deltaTime
            
            if lastScanTime >= scanInterval then
                lastScanTime = 0
                scanGenerators()
                
                local gensToRemove = {}
                for gen, data in pairs(_G.FakeGeneratorESP.Data) do
                    if not updateFakeGeneratorESP(gen, data) then
                        table.insert(gensToRemove, gen)
                    end
                end
                
                for _, gen in ipairs(gensToRemove) do
                    if _G.FakeGeneratorESP.Data[gen] then
                        if _G.FakeGeneratorESP.Data[gen].Highlight then _G.FakeGeneratorESP.Data[gen].Highlight:Destroy() end
                        if _G.FakeGeneratorESP.Data[gen].NameBillboard then _G.FakeGeneratorESP.Data[gen].NameBillboard:Destroy() end
                        _G.FakeGeneratorESP.Data[gen] = nil
                    end
                end
            end
        end)
        
        table.insert(_G.FakeGeneratorESP.Connections, heartbeatConnection)
        scanGenerators()
    end
})

Visual:AddToggle("NoliWarningESP", {
    Text = "Noli即将传送的电机",
    Default = false,
    Callback = function(enabled)
        if not _G.NoliWarningESP then
            _G.NoliWarningESP = {
                Active = false,
                Data = {},
                Connections = {}
            }
        end
        
        if not enabled then
            if _G.NoliWarningESP.Active then
                for _, connection in pairs(_G.NoliWarningESP.Connections) do
                    if connection then
                        connection:Disconnect()
                    end
                end
                
                for gen, data in pairs(_G.NoliWarningESP.Data) do
                    if data.Highlight then data.Highlight:Destroy() end
                    if data.Billboard then data.Billboard:Destroy() end
                end
                
                _G.NoliWarningESP.Data = {}
                _G.NoliWarningESP.Connections = {}
                _G.NoliWarningESP.Active = false
            end
            return
        end
        
        if _G.NoliWarningESP.Active then return end
        _G.NoliWarningESP.Active = true
        
        local lastScanTime = 0
        local scanInterval = 3.0
        
        local function hasNoliWarning(gen)
            if string.find(gen.Name, "NoliWarningIncoming") then return true end
            
            for _, child in pairs(gen:GetDescendants()) do
                if (child:IsA("StringValue") or child:IsA("ObjectValue")) and 
                   string.find(tostring(child.Value), "NoliWarningIncoming") then
                    return true
                elseif child:IsA("BasePart") and string.find(child.Name, "NoliWarningIncoming") then
                    return true
                end
            end
            
            return false
        end
        
        local function createNoliWarningESP(gen)
            if not gen or not gen:FindFirstChild("Main") or _G.NoliWarningESP.Data[gen] then return end
            if not hasNoliWarning(gen) then return end
            
            local highlight = Instance.new("Highlight")
            highlight.Name = "NoliWarningHighlight"
            highlight.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
            highlight.Enabled = false
            highlight.OutlineColor = Color3.fromRGB(255, 0, 255)
            highlight.FillColor = Color3.fromRGB(255, 0, 255)
            highlight.FillTransparency = 0.7
            highlight.OutlineTransparency = 0
            highlight.Parent = gen
            
            local billboard = Instance.new("BillboardGui")
            billboard.Name = "NoliWarningBillboard"
            billboard.Size = UDim2.new(6, 0, 2, 0)
            billboard.StudsOffset = Vector3.new(0, 3, 0)
            billboard.Adornee = gen.Main
            billboard.Parent = gen.Main
            billboard.AlwaysOnTop = true
            billboard.Enabled = false
            
            local label = Instance.new("TextLabel")
            label.Size = UDim2.new(1, 0, 1, 0)
            label.BackgroundTransparency = 1
            label.Text = "[Noli Will Tp]"
            label.TextColor3 = Color3.fromRGB(255, 0, 255)
            label.Font = Enum.Font.Arcade
            label.TextSize = 14
            label.TextStrokeTransparency = 0
            label.Parent = billboard
            
            _G.NoliWarningESP.Data[gen] = {
                Highlight = highlight,
                Billboard = billboard,
                LastCheck = os.time()
            }
            
            local destroyConnection = gen.Destroying:Connect(function()
                if _G.NoliWarningESP.Data[gen] then
                    if _G.NoliWarningESP.Data[gen].Highlight then _G.NoliWarningESP.Data[gen].Highlight:Destroy() end
                    if _G.NoliWarningESP.Data[gen].Billboard then _G.NoliWarningESP.Data[gen].Billboard:Destroy() end
                    _G.NoliWarningESP.Data[gen] = nil
                end
            end)
            
            table.insert(_G.NoliWarningESP.Connections, destroyConnection)
        end
        
        local function updateNoliWarningESP(gen, data)
            if not gen or not gen.Parent then return false end
            
            if os.time() - data.LastCheck > 5 then
                if not hasNoliWarning(gen) then
                    return false
                end
                data.LastCheck = os.time()
            end
            
            local character = game.Players.LocalPlayer.Character
            local humanoidRootPart = character and character:FindFirstChild("HumanoidRootPart")
            
            if humanoidRootPart then
                local distance = (gen.Main.Position - humanoidRootPart.Position).Magnitude
                
                if distance < 100 then
                    data.Highlight.Enabled = true
                    data.Billboard.Enabled = true
                else
                    data.Highlight.Enabled = false
                    data.Billboard.Enabled = false
                end
            end
            
            return true
        end
        
        local function scanGenerators()
            for _, gen in pairs(workspace:GetDescendants()) do
                if gen:IsA("Model") and gen:FindFirstChild("Main") and 
                   (gen.Name == "Generator" or gen.Name == "FakeGenerator") then
                    createNoliWarningESP(gen)
                end
            end
        end
        
        local mainConnection = workspace.DescendantAdded:Connect(function(v)
            if v:IsA("Model") and v:FindFirstChild("Main") and 
               (v.Name == "Generator" or v.Name == "FakeGenerator") then
                createNoliWarningESP(v)
            end
        end)
        
        table.insert(_G.NoliWarningESP.Connections, mainConnection)
        
        local heartbeatConnection = game:GetService("RunService").Heartbeat:Connect(function(deltaTime)
            lastScanTime = lastScanTime + deltaTime
            
            if lastScanTime >= scanInterval then
                lastScanTime = 0
                scanGenerators()
                
                local gensToRemove = {}
                for gen, data in pairs(_G.NoliWarningESP.Data) do
                    if not updateNoliWarningESP(gen, data) then
                        table.insert(gensToRemove, gen)
                    end
                end
                
                for _, gen in ipairs(gensToRemove) do
                    if _G.NoliWarningESP.Data[gen] then
                        if _G.NoliWarningESP.Data[gen].Highlight then _G.NoliWarningESP.Data[gen].Highlight:Destroy() end
                        if _G.NoliWarningESP.Data[gen].Billboard then _G.NoliWarningESP.Data[gen].Billboard:Destroy() end
                        _G.NoliWarningESP.Data[gen] = nil
                    end
                end
            end
        end)
        
        table.insert(_G.NoliWarningESP.Connections, heartbeatConnection)
        scanGenerators()
    end
})





local Visual = Tabs.Esp:AddLeftGroupbox("物品绘制")

local LibESP = loadstring(game:HttpGet("https://raw.githubusercontent.com/ImamGV/Script/main/ESP"))()

Visual:AddToggle("EKE",{
    Text = "杀手召唤物绘制",
    Callback = function(v)
        if v then
            for _, v in ipairs(workspace:GetDescendants()) do
                if v:IsA("Model") and v.Name == "DeliveryRig" or v.Name == "Bunny" or v.Name == "Mafia1" or v.Name == "Mafia2" or v.Name == "Mafia3" or v.Name == "Mafia4" then
                    LibESP:AddESP(v, "pizza deliveryman", Color3.fromRGB(255, 52, 179), 14, "Other_ESP")
                elseif v:IsA("Model") and v.Name == "1x1x1x1Zombie" then
                    LibESP:AddESP(v, "1x1x1x1 (zombie)", Color3.fromRGB(224, 102, 255), 14, "Other_ESP")
                end
            end
            OtherESP = workspace.DescendantAdded:Connect(function(v)
                if v:IsA("Model") and v.Name == "PizzaDeliveryRig" or v.Name == "Bunny" or v.Name == "Mafia1" or v.Name == "Mafia2" or v.Name == "Mafia3" or v.Name == "Mafia4" then
                    LibESP:AddESP(v, "pizza deliveryman", Color3.fromRGB(255, 52, 179), 14, "Other_ESP")
                elseif v:IsA("Model") and v.Name == "1x1x1x1Zombie" then
                    LibESP:AddESP(v, "1x1x1x1 (zombie)", Color3.fromRGB(224, 102, 255), 14, "Other_ESP")
                end
            end)
        else
            OtherESP:Disconnect()
            LibESP:Delete("Other_ESP")
        end
    end
})


Visual:AddToggle("TWE", {
    Text = "塔夫绊线绘制",
    Default = false,
    Callback = function(state)
        if state then
            _G.TWE_HighlightedObjects = _G.TWE_HighlightedObjects or {}
            
            local function highlightObject(obj)
                if obj.Name:match("TaphTripwire") and not obj:FindFirstChild("TWE_Highlight") then
                    local highlight = Instance.new("Highlight")
                    highlight.Name = "TWE_Highlight"
                    highlight.FillColor = Color3.fromRGB(102, 0, 153)
                    highlight.OutlineColor = Color3.fromRGB(102, 0, 153)
                    highlight.FillTransparency = 0.5
                    highlight.OutlineTransparency = 0
                    highlight.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
                    highlight.Parent = obj
                    
                    _G.TWE_HighlightedObjects[obj] = obj.AncestryChanged:Connect(function(_, parent)
                        if not parent and highlight and highlight.Parent then
                            highlight:Destroy()
                            if _G.TWE_HighlightedObjects[obj] then
                                _G.TWE_HighlightedObjects[obj]:Disconnect()
                                _G.TWE_HighlightedObjects[obj] = nil
                            end
                        end
                    end)
                end
            end

            for _, obj in ipairs(workspace:GetDescendants()) do
                highlightObject(obj)
            end

            _G.TWE_Connection = workspace.DescendantAdded:Connect(highlightObject)
        else
            if _G.TWE_Connection then
                _G.TWE_Connection:Disconnect()
            end
            
            for obj, connection in pairs(_G.TWE_HighlightedObjects or {}) do
                if connection then
                    connection:Disconnect()
                end
                if obj:FindFirstChild("TWE_Highlight") then
                    obj.TWE_Highlight:Destroy()
                end
            end
            _G.TWE_HighlightedObjects = {}
        end
    end
})

Visual:AddToggle("ShadowDetector", {
    Text = "约翰多陷阱绘制",
    Default = false,
    Callback = function(Value)
        local currentShadows = {}
        local heartbeatConnection = nil
        local updateConnection = nil
        local isRunning = false

        local function findAllShadows()
            local shadows = {}
            local function searchFolder(folder)
                for _, child in ipairs(folder:GetChildren()) do
                    if child.Name == "Shadow" then
                        table.insert(shadows, child)
                    elseif child:IsA("Folder") or child:IsA("Model") then
                        searchFolder(child)
                    end
                end
            end
            searchFolder(workspace.Map.Ingame)
            return shadows
        end

        local function createShadowMarker(shadow)
            local highlight = Instance.new("Highlight")
            highlight.Name = "ShadowRangeIndicator"
            highlight.FillColor = Color3.fromRGB(255, 0, 0)
            highlight.FillTransparency = 0.8
            highlight.OutlineColor = Color3.fromRGB(255, 100, 100)
            highlight.OutlineTransparency = 0.5
            highlight.Parent = shadow
            
            local billboard = Instance.new("BillboardGui")
            billboard.Name = "ShadowNameDisplay"
            billboard.AlwaysOnTop = true
            billboard.Size = UDim2.new(0, 180, 0, 60)
            billboard.StudsOffset = Vector3.new(0, 3, 0)
            
            local textLabel = Instance.new("TextLabel")
            textLabel.Text = "TRAP"
            textLabel.Size = UDim2.new(1, 0, 0.5, 0)
            textLabel.Font = Enum.Font.Arcade
            textLabel.TextSize = 18
            textLabel.TextColor3 = Color3.fromRGB(255, 0, 0)
            textLabel.BackgroundTransparency = 1
            textLabel.TextStrokeTransparency = 0
            textLabel.Parent = billboard
            
            local distanceLabel = Instance.new("TextLabel")
            distanceLabel.Text = "0m"
            distanceLabel.Size = UDim2.new(1, 0, 0.5, 0)
            distanceLabel.Position = UDim2.new(0, 0, 0.5, 0)
            distanceLabel.Font = Enum.Font.Arcade
            distanceLabel.TextSize = 14
            distanceLabel.TextColor3 = Color3.fromRGB(0, 255, 255)
            distanceLabel.BackgroundTransparency = 1
            distanceLabel.TextStrokeTransparency = 0
            distanceLabel.Parent = billboard
            
            billboard.Parent = shadow
            
            currentShadows[shadow] = {
                highlight = highlight,
                billboard = billboard,
                textLabel = textLabel,
                distanceLabel = distanceLabel
            }
        end

        local function removeShadowMarker(shadow)
            local markerData = currentShadows[shadow]
            if markerData then
                if markerData.highlight then
                    markerData.highlight:Destroy()
                end
                if markerData.billboard then
                    markerData.billboard:Destroy()
                end
                currentShadows[shadow] = nil
            end
        end

        local function updateMarkers()
            local foundShadows = findAllShadows()
            local shadowSet = {}
            
            for _, shadow in ipairs(foundShadows) do
                shadowSet[shadow] = true
                if not currentShadows[shadow] then
                    createShadowMarker(shadow)
                end
            end
            
            for shadow in pairs(currentShadows) do
                if not shadowSet[shadow] then
                    removeShadowMarker(shadow)
                end
            end
        end

        local function updateDistances()
            local player = game.Players.LocalPlayer
            local character = player.Character
            if not character then return end
            
            local humanoidRootPart = character:FindFirstChild("HumanoidRootPart")
            if not humanoidRootPart then return end
            
            for shadow, markerData in pairs(currentShadows) do
                if shadow and shadow.Parent then
                    local distance = (humanoidRootPart.Position - shadow.Position).Magnitude
                    markerData.distanceLabel.Text = string.format("%.1fm", distance)
                    
                    local transparency = math.clamp(distance / 50, 0.2, 0.8)
                    markerData.highlight.FillTransparency = transparency
                else
                    removeShadowMarker(shadow)
                end
            end
        end

        if Value then
            isRunning = true
            updateMarkers()
            
            updateConnection = game:GetService("RunService").Stepped:Connect(function()
                if not isRunning then return end
                updateDistances()
            end)
            
            task.spawn(function()
                while isRunning do
                    updateMarkers()
                    task.wait(3)
                end
            end)
        else
            isRunning = false
            if updateConnection then
                updateConnection:Disconnect()
            end
            if heartbeatConnection then
                heartbeatConnection:Disconnect()
            end
            
            for shadow in pairs(currentShadows) do
                removeShadowMarker(shadow)
            end
            currentShadows = {}
        end
    end
})

Visual:AddToggle("ST",{
Text = "塔夫空间炸弹绘制",
Callback = function(v)
if v then
for _, v in ipairs(workspace:GetDescendants()) do
if v:IsA("Model") and v.Name == "SubspaceTripmine" and not v:FindFirstChild("SubspaceTripmine_ESP") then
LibESP:AddESP(v, "", Color3.fromRGB(255, 0, 255), 14, "SubspaceTripmine_ESP")
end
end
SubspaceTripmineESP = workspace.DescendantAdded:Connect(function(v)
if v:IsA("Model") and v.Name == "SubspaceTripmine" and not v:FindFirstChild("SubspaceTripmine_ESP") then
LibESP:AddESP(v, "", Color3.fromRGB(255, 0, 255), 14, "SubspaceTripmine_ESP")
end
end)
else
SubspaceTripmineESP:Disconnect()
LibESP:Delete("SubspaceTripmine_ESP")
end
end})
Visual:AddToggle("ME",{
Text = "医疗包绘制",
Callback = function(v)
if v then
for _, v in ipairs(workspace:GetDescendants()) do
if v:IsA("Model") and v.Name == "Medkit" and not v:FindFirstChild("Medkit_ESP") then
LibESP:AddESP(v, "Medkit", Color3.fromRGB(187, 255, 255), 14, "Medkit_ESP")
end
end
MedkitESP = workspace.DescendantAdded:Connect(function(v)
if v:IsA("Model") and v.Name == "Medkit" and not v:FindFirstChild("Medkit_ESP") then
LibESP:AddESP(v, "Medkit", Color3.fromRGB(187, 255, 255), 14, "Medkit_ESP")
end
end)
else
Medkit:Disconnect()
LibESP:Delete("Medkit_ESP")
end
end})
Visual:AddToggle("BCE",{
Text = "可乐绘制",
Callback = function(v)
if v then
for _, v in ipairs(workspace:GetDescendants()) do
if v:IsA("Model") and v.Name == "BloxyCola" and not v:FindFirstChild("BloxyCola_ESP") then
LibESP:AddESP(v, "Bloxy Cola", Color3.fromRGB(131, 111, 255), 14, "BloxyCola_ESP")
end
end
ColaESP = workspace.DescendantAdded:Connect(function(v)
if v:IsA("Model") and v.Name == "BloxyCola" and not v:FindFirstChild("BloxyCola_ESP") then
LibESP:AddESP(v, "Bloxy Cola", Color3.fromRGB(131, 111, 255), 14, "BloxyCola_ESP")
end
end)
else
ColaESP:Disconnect()
LibESP:Delete("BloxyCola_ESP")
end
end})


local SM = Tabs.Aimbot:AddLeftGroupbox('静默平滑瞄准[杀手]')
local LocalPlayer = Players.LocalPlayer
local Workspace = game:GetService("Workspace")

local silentAimEnabled = false
local targetPlayer = nil
local maxDistance = 100
local silentAimConnection = nil
local smoothingFactor = 0.2 

-- 要检测的动画ID
local KILLER_ANIMATIONS = {
    -- Jason 动画
    ["126830014841198"] = true,
    ["126355327951215"] = true,
    ["121086746534252"] = true,
    -- Joe (1x1x1x1) 动画
    ["105458270463374"] = true,
    ["127172483138092"] = true,
    ["131430497821198"] = true,
    ["119181003138006"] = true,
    -- Coolkid 动画
    ["18885909645"] = true,
    ["98456918873918"] = true,
    ["106776364623742"] = true,
    ["18885906143"] = true,
    ["18885940850"] = true,
    ["18885903667"] = true,
    -- Noli 动画
    ["109230267448394"] = true,
    ["91758760621955"] = true,
    ["93841120533318"] = true,
    ["139835501033932"] = true,
    ["126896426760253"] = true,
    ["109700476007435"] = true,
    ["139321362207112"] = true,
    ["83465205704188"] = true,
}

local function isPlayingKillerAnimation()
    if not LocalPlayer.Character then return false end
    
    local humanoid = LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
    if not humanoid then return false end
    
    local animator = humanoid:FindFirstChildOfClass("Animator")
    if not animator then return false end
    
    for _, track in pairs(animator:GetPlayingAnimationTracks()) do
        if track.Animation then
            local animId = tostring(track.Animation.AnimationId:match("%d+"))
            if KILLER_ANIMATIONS[animId] then
                return true
            end
        end
    end
    
    return false
end

local function isKiller()
    pcall(function()
        local killersFolder = Workspace:FindFirstChild("Players") and Workspace.Players:FindFirstChild("Killers")
        if killersFolder and LocalPlayer.Character and table.find(killersFolder:GetChildren(), LocalPlayer.Character) then
            return true
        end
    end)
    return false
end

local function getClosestSurvivor()
    pcall(function()
        local survivorsFolder = Workspace:FindFirstChild("Players") and Workspace.Players:FindFirstChild("Survivors")
        if not survivorsFolder then return nil end

        local myChar = LocalPlayer.Character
        if not myChar or not myChar:FindFirstChild("HumanoidRootPart") then return nil end
        local myPos = myChar.HumanoidRootPart.Position

        local closest = nil
        local shortest = math.huge

        for _, model in ipairs(survivorsFolder:GetChildren()) do
            if model:IsA("Model") and model:FindFirstChild("HumanoidRootPart") then
                local dist = (model.HumanoidRootPart.Position - myPos).Magnitude
                if dist < shortest and dist <= maxDistance then
                    shortest = dist
                    closest = model
                end
            end
        end

        return closest
    end)
    return nil
end

local function smoothFaceTarget(model)
    pcall(function()
        if not model or not model:FindFirstChild("HumanoidRootPart") then return end
        local char = LocalPlayer.Character
        if not char or not char:FindFirstChild("HumanoidRootPart") then return end

        local root = char.HumanoidRootPart
        local targetPos = model.HumanoidRootPart.Position
        
        -- 计算目标朝向
        local desiredLook = CFrame.new(root.Position, Vector3.new(targetPos.X, root.Position.Y, targetPos.Z))
        
        -- 平滑插值旋转
        root.CFrame = root.CFrame:Lerp(desiredLook, smoothingFactor)
    end)
end

getgenv().GetSilentAimTargetPosition = function()
    pcall(function()
        if silentAimEnabled and isKiller() and isPlayingKillerAnimation() then
            local target = getClosestSurvivor()
            if target and target:FindFirstChild("Head") then
                return target.Head.Position
            end
        end
    end)
    return nil
end

-- 添加静默瞄准开关
SM:AddToggle("静默瞄准", {
    Text = "Silent Aiming[静默瞄准]",
    Callback = function(state)
        silentAimEnabled = state
       
        if state then
            if not silentAimConnection then
                silentAimConnection = RunService.Heartbeat:Connect(function()
                    pcall(function()
                        if not isKiller() or not isPlayingKillerAnimation() then 
                            targetPlayer = nil
                            return 
                        end
                        
                        targetPlayer = getClosestSurvivor()
                        if targetPlayer then
                            smoothFaceTarget(targetPlayer)
                        end
                    end)
                end)
            end
        else
            if silentAimConnection then
                silentAimConnection:Disconnect()
                silentAimConnection = nil
            end
            targetPlayer = nil
        end
    end
})

SM:AddSlider("自瞄距离", {
    Text = "[自瞄距离]",
    Default = 30,
    Min = 1,
    Max = 500,
    Rounding = 0,
    Callback = function(value)
        maxDistance = value
    end
})

SM:AddSlider("瞄准平滑度", {
    Text = "Aim Smoothing[瞄准平滑度]",
    Default = 0.2,
    Min = 0.05,
    Max = 1,
    Rounding = 2,
    Callback = function(value)
        smoothingFactor = value
    end
})







local LeftGroupBox = Tabs.Aimbot:AddLeftGroupbox('TwoTime背刺')
local RunService = game:GetService("RunService")
local LocalPlayer = game:GetService("Players").LocalPlayer

do
	local Backstab = {
		Enabled = false,
		Mode = "Behind",
		Range = 4,
		Cooldown = false,
		LastTarget = nil,
		KillerNames = { "Jason", "c00lkidd", "JohnDoe", "1x1x1x1", "Noli", "Slasher" },
		DaggerRemote = game:GetService("ReplicatedStorage"):WaitForChild("Modules"):WaitForChild("Network"):WaitForChild("RemoteEvent"),
		KillersFolder = workspace:WaitForChild("Players"):WaitForChild("Killers")
	}

	local function CreateUI()
		LeftGroupBox:AddToggle("BackstabToggle", {
			Text = "自动背刺[Two Time]",
			Default = false,
			Callback = function(Value)
				Backstab.Enabled = Value
			end,
		})

		LeftGroupBox:AddDropdown("BackstabModeDropdown", {
			Values = { "Behind", "Around" },
			Default = 1,
			Multi = false,
			Text = "模式",
			Callback = function(Value)
				if Value == "Behind" then
					Backstab.Mode = "Behind"
				elseif Value == "Around" then
					Backstab.Mode = "Around"
				end
			end,
		})

		LeftGroupBox:AddSlider("BackstabRangeSlider", {
			Text = "距离",
			Default = 4,
			Min = 1,
			Max = 20,
			Rounding = 0,
			Callback = function(Value)
				Backstab.Range = Value
			end,
		})
	end

	local function isBehindTarget(hrp, targetHRP)
		if not (hrp and targetHRP and hrp.Parent and targetHRP.Parent) then return false end
		local distance = (hrp.Position - targetHRP.Position).Magnitude
		if distance > Backstab.Range then return false end

		if Backstab.Mode == "Around" then
			return true
		else
			local direction = -targetHRP.CFrame.LookVector
			local toPlayer = (hrp.Position - targetHRP.Position)
			return toPlayer:Dot(direction) > 0.5
		end
	end

	local function OnHeartbeat()
		if not Backstab.Enabled or Backstab.Cooldown then return end
		local char = LocalPlayer.Character
		if not (char and char:FindFirstChild("HumanoidRootPart")) then return end
		local hrp = char.HumanoidRootPart

		for _, name in ipairs(Backstab.KillerNames) do
			local killer = Backstab.KillersFolder:FindFirstChild(name)
			if killer and killer:FindFirstChild("HumanoidRootPart") then
				local kHRP = killer.HumanoidRootPart
				if isBehindTarget(hrp, kHRP) and killer ~= Backstab.LastTarget then
					Backstab.Cooldown = true
					Backstab.LastTarget = killer
					hrp.CFrame = CFrame.new(kHRP.Position - kHRP.CFrame.LookVector, kHRP.Position)
					local args = {
						"UseActorAbility",
						{
							buffer.fromstring("\"Dagger\"")
						}
					}
					Backstab.DaggerRemote:FireServer(unpack(args))
					task.delay(1, function()
						Backstab.LastTarget = nil
						Backstab.Cooldown = false
					end)
					break
				end
			end
		end
	end

	CreateUI()
	RunService.Heartbeat:Connect(OnHeartbeat)
end

local ChanceGroup = Tabs.Aimbot:AddLeftGroupbox('机会预判自瞄')

do
	local PredictionAim = {
		Enabled = false,
		Prediction = 4,
		Duration = 1.7,
		Targets = { "Jason", "c00lkidd", "JohnDoe", "1x1x1x1", "Noli", "Slasher" },
		TrackedAnimations = {
			["103601716322988"] = true, ["133491532453922"] = true, ["86371356500204"] = true,
			["76649505662612"] = true, ["81698196845041"] = true
		},
		Humanoid = nil,
		HRP = nil,
		LastTriggerTime = 0,
		IsAiming = false,
		OriginalState = nil
	}

	local function CreateUI()
		ChanceGroup:AddToggle("AimToggle", {
			Text = "预判瞄准[Chance]",
			Default = false,
			Callback = function(Value)
				PredictionAim.Enabled = Value
			end,
		})
		ChanceGroup:AddSlider("PredictionSlider", {
			Text = "预判系数",
			Default = 4,
			Min = 0,
			Max = 15,
			Rounding = 1,
			Callback = function(Value)
				PredictionAim.Prediction = Value
			end,
		})
	end

	local function getValidTarget()
		local killersFolder = workspace:FindFirstChild("Players") and workspace.Players:FindFirstChild("Killers")
		if killersFolder then
			for _, name in ipairs(PredictionAim.Targets) do
				local target = killersFolder:FindFirstChild(name)
				if target and target:FindFirstChild("HumanoidRootPart") then
					return target.HumanoidRootPart
				end
			end
		end
		return nil
	end

	local function getPlayingAnimationIds()
		local ids = {}
		if PredictionAim.Humanoid then
			for _, track in ipairs(PredictionAim.Humanoid:GetPlayingAnimationTracks()) do
				if track.Animation and track.Animation.AnimationId then
					local id = track.Animation.AnimationId:match("%d+")
					if id then ids[id] = true end
				end
			end
		end
		return ids
	end

	local function setupCharacter(char)
		PredictionAim.Humanoid = char:WaitForChild("Humanoid")
		PredictionAim.HRP = char:WaitForChild("HumanoidRootPart")
	end

	local function OnRenderStep()
		if not PredictionAim.Enabled or not PredictionAim.Humanoid or not PredictionAim.HRP then return end
		local playing = getPlayingAnimationIds()
		local triggered = false
		for id in pairs(PredictionAim.TrackedAnimations) do
			if playing[id] then triggered = true; break end
		end

		if triggered then
			PredictionAim.LastTriggerTime = tick()
			PredictionAim.IsAiming = true
		end

		if PredictionAim.IsAiming and tick() - PredictionAim.LastTriggerTime <= PredictionAim.Duration then
			if not PredictionAim.OriginalState then
				PredictionAim.OriginalState = {
					WalkSpeed = PredictionAim.Humanoid.WalkSpeed,
					JumpPower = PredictionAim.Humanoid.JumpPower,
					AutoRotate = PredictionAim.Humanoid.AutoRotate
				}
				PredictionAim.Humanoid.AutoRotate = false
				PredictionAim.HRP.AssemblyAngularVelocity = Vector3.zero
			end
			local targetHRP = getValidTarget()
			if targetHRP then
				local predictedPos = targetHRP.Position + (targetHRP.CFrame.LookVector * PredictionAim.Prediction)
				local direction = (predictedPos - PredictionAim.HRP.Position).Unit
				local yRot = math.atan2(-direction.X, -direction.Z)
				PredictionAim.HRP.CFrame = CFrame.new(PredictionAim.HRP.Position) * CFrame.Angles(0, yRot, 0)
			end
		elseif PredictionAim.IsAiming then
			PredictionAim.IsAiming = false
			if PredictionAim.OriginalState then
				PredictionAim.Humanoid.WalkSpeed = PredictionAim.OriginalState.WalkSpeed
				PredictionAim.Humanoid.JumpPower = PredictionAim.OriginalState.JumpPower
				PredictionAim.Humanoid.AutoRotate = PredictionAim.OriginalState.AutoRotate
				PredictionAim.OriginalState = nil
			end
		end
	end

	local function OnRemoteEvent(eventName, eventArg)
		if not PredictionAim.Enabled then return end
		if eventName == "UseActorAbility" and type(eventArg) == "table" and eventArg[1] and tostring(eventArg[1]) == buffer.fromstring("\"Shoot\"") then
			PredictionAim.LastTriggerTime = tick()
			PredictionAim.IsAiming = true
		end
	end

	if LocalPlayer.Character then setupCharacter(LocalPlayer.Character) end
	LocalPlayer.CharacterAdded:Connect(setupCharacter)
	CreateUI()
	RunService.RenderStepped:Connect(OnRenderStep)
	game:GetService("ReplicatedStorage").Modules.Network.RemoteEvent.OnClientEvent:Connect(OnRemoteEvent)
end

local Size = 5
local speed = 1
local player = game:GetService("Players").LocalPlayer
local char = player.Character or player.CharacterAdded:Wait()
local rootPart = char:WaitForChild("HumanoidRootPart")
local humanoid = char:WaitForChild("Humanoid")


local twoTimeMaxDistance = 50
local shedletskyMaxDistance = 50
local johnMaxDistance = 50

-- 创建UI
local SB = Tabs.Aimbot:AddLeftGroupbox('幸存者自瞄[平滑]')



-- 两次自瞄距离滑块
SB:AddSlider('TwoTimeDistance', {
    Text = '两次自瞄距离',
    Default = 50,
    Min = 10,
    Max = 150,
    Rounding = 1,
    Compact = false,
    Callback = function(value)
        twoTimeMaxDistance = value
    end
})

-- 谢德利茨基自瞄距离滑块
SB:AddSlider('ShedletskyDistance', {
    Text = '谢德自瞄距离',
    Default = 50,
    Min = 10,
    Max = 150,
    Rounding = 1,
    Compact = false,
    Callback = function(value)
        shedletskyMaxDistance = value
    end
})


local function TWO(state)
    local TWOsounds = {
        "rbxassetid://86710781315432",
        "rbxassetid://99820161736138"
    }
    
    TWOTIME = state

    if game:GetService("Players").LocalPlayer.Character.Name ~= "TwoTime" and state then
        Library:Notify("Your role is not Two Time，invalid", nil, 4590657391)
        return 
    end

    if state then
        TWOloop = game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.ChildAdded:Connect(function(child)
            if not TWOTIME then return end
            for _, v in pairs(TWOsounds) do
                if child.Name == v then
                    local survivors = {}
                    for _, player in pairs(game:GetService("Players"):GetPlayers()) do
                        if player ~= game:GetService("Players").LocalPlayer then
                            local character = player.Character
                            if character and character:FindFirstChild("HumanoidRootPart") then
                                table.insert(survivors, character)
                            end
                        end
                    end

                    local nearestSurvivor = nil
                    local shortestDistance = math.huge  
                    
                    for _, survivor in pairs(survivors) do
                        local survivorHRP = survivor.HumanoidRootPart
                        local playerHRP = game:GetService("Players").LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
                        
                        if playerHRP then
                            local distance = (survivorHRP.Position - playerHRP.Position).Magnitude
                            if distance < shortestDistance and distance <= twoTimeMaxDistance then
                                shortestDistance = distance
                                nearestSurvivor = survivor
                            end
                        end
                    end
                    
                    if nearestSurvivor then
                        local nearestHRP = nearestSurvivor.HumanoidRootPart
                        local playerHRP = game:GetService("Players").LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
                        
                        if playerHRP then
                            local direction = (nearestHRP.Position - playerHRP.Position).Unit
                            local num = 1
                            local maxIterations = 100 
                            
                            if child.Name == "rbxassetid://79782181585087" then
                                maxIterations = 220  
                            end

                            while num <= maxIterations do
                                task.wait(0.01)
                                num = num + 1
                                workspace.CurrentCamera.CFrame = CFrame.new(workspace.CurrentCamera.CFrame.Position, nearestHRP.Position)
                                playerHRP.CFrame = CFrame.lookAt(playerHRP.Position, Vector3.new(nearestHRP.Position.X, nearestHRP.Position.Y, nearestHRP.Position.Z))  
                            end
                        end
                    end
                end
            end
        end)
    else
        if TWOloop then
            TWOloop:Disconnect()
            TWOloop = nil
        end
    end
end

local function shedletskyAimbot(state)
    shedaim = state
    if state then
        if game:GetService("Players").LocalPlayer.Character.Name ~= "Shedletsky" then
            Library:Notify("I don't think the character you're playing is Shedlitsky.,invalid", nil, 4590657391)
            return
        end
        
        shedloop = game:GetService("Players").LocalPlayer.Character.Sword.ChildAdded:Connect(function(child)
            if not shedaim then return end
            if child:IsA("Sound") then 
                local FAN = child.Name
                if FAN == "rbxassetid://12222225" or FAN == "83851356262523" then 
                    local killersFolder = game.Workspace.Players:FindFirstChild("Killers")
                    if killersFolder then 
                        local killer = killersFolder:FindFirstChildOfClass("Model")
                        if killer and killer:FindFirstChild("HumanoidRootPart") then 
                            local killerHRP = killer.HumanoidRootPart
                            local playerHRP = game:GetService("Players").LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
                            if playerHRP then 
                                local distance = (killerHRP.Position - playerHRP.Position).Magnitude
                                if distance <= shedletskyMaxDistance then
                                    local num = 1
                                    local maxIterations = 100
                                    while num <= maxIterations do
                                        task.wait(0.01)
                                        num = num + 1
                                        workspace.CurrentCamera.CFrame = CFrame.new(workspace.CurrentCamera.CFrame.Position, killerHRP.Position)
                                        playerHRP.CFrame = CFrame.lookAt(playerHRP.Position, killerHRP.Position)
                                    end
                                end
                            end
                        end
                    end
                end
            end
        end)
    else
        if shedloop then 
            shedloop:Disconnect()
            shedloop = nil
        end
    end
end



SB:AddToggle('MyToggle', {
    Text = '两次自瞄',
    Default = false,
    Tooltip = 'Aim',
    Callback = TWO
})

SB:AddToggle('MyToggle', {
    Text = '谢德自瞄',
    Default = false,
    Tooltip = 'Aim',
    Callback = shedletskyAimbot
})



local LeftGroupBox = Tabs.Aimbot:AddRightGroupbox('1x4远程预判')

local RunService = game:GetService("RunService")
local LocalPlayer = game:GetService("Players").LocalPlayer
	local PredictionAim = {
		Enabled = false,
		Prediction = 4,
		Duration = 1.7,
		Targets = { "Guest1337", "007n7", "Builderman", "Chance", "Dusekkar", "Elliot", "Noob", "Shedletsky", "Taph", "TwoTime" },
		TrackedAnimations = {
	["131430497821198"] = true,
    ["119181003138006"] = true,
    ["70447634862911"] = true,
    ["93491748129367"] = true
		},
		Humanoid = nil,
		HRP = nil,
		LastTriggerTime = 1,
		IsAiming = false,
		OriginalState = nil
	}

	local function CreateUI()
		LeftGroupBox:AddToggle("AimToggle", {
			Text = "预判瞄准",
			Default = false,
			Callback = function(Value)
				PredictionAim.Enabled = Value
			end,
		})
		LeftGroupBox:AddSlider("PredictionSlider", {
			Text = "预判强度",
			Default = 4,
			Min = 0,
			Max = 15,
			Rounding = 1,
			Callback = function(Value)
				PredictionAim.Prediction = Value
			end,
		})
	end

	local function getValidTarget()
		local killersFolder = workspace:FindFirstChild("Players") and workspace.Players:FindFirstChild("Survivors")
		if killersFolder then
			for _, name in ipairs(PredictionAim.Targets) do
				local target = killersFolder:FindFirstChild(name)
				if target and target:FindFirstChild("HumanoidRootPart") then
					return target.HumanoidRootPart
				end
			end
		end
		return nil
	end

	local function getPlayingAnimationIds()
		local ids = {}
		if PredictionAim.Humanoid then
			for _, track in ipairs(PredictionAim.Humanoid:GetPlayingAnimationTracks()) do
				if track.Animation and track.Animation.AnimationId then
					local id = track.Animation.AnimationId:match("%d+")
					if id then ids[id] = true end
				end
			end
		end
		return ids
	end

	local function setupCharacter(char)
		PredictionAim.Humanoid = char:WaitForChild("Humanoid")
		PredictionAim.HRP = char:WaitForChild("HumanoidRootPart")
	end

	local function OnRenderStep()
		if not PredictionAim.Enabled or not PredictionAim.Humanoid or not PredictionAim.HRP then return end
		local playing = getPlayingAnimationIds()
		local triggered = false
		for id in pairs(PredictionAim.TrackedAnimations) do
			if playing[id] then triggered = true; break end
		end

		if triggered then
			PredictionAim.LastTriggerTime = tick()
			PredictionAim.IsAiming = true
		end

		if PredictionAim.IsAiming and tick() - PredictionAim.LastTriggerTime <= PredictionAim.Duration then
			if not PredictionAim.OriginalState then
				PredictionAim.OriginalState = {
					WalkSpeed = PredictionAim.Humanoid.WalkSpeed,
					JumpPower = PredictionAim.Humanoid.JumpPower,
					AutoRotate = PredictionAim.Humanoid.AutoRotate
				}
				PredictionAim.Humanoid.AutoRotate = false
				PredictionAim.HRP.AssemblyAngularVelocity = Vector3.zero
			end
			local targetHRP = getValidTarget()
			if targetHRP then
				local predictedPos = targetHRP.Position + (targetHRP.CFrame.LookVector * PredictionAim.Prediction)
				local direction = (predictedPos - PredictionAim.HRP.Position).Unit
				local yRot = math.atan2(-direction.X, -direction.Z)
				PredictionAim.HRP.CFrame = CFrame.new(PredictionAim.HRP.Position) * CFrame.Angles(0, yRot, 0)
			end
		elseif PredictionAim.IsAiming then
			PredictionAim.IsAiming = false
			if PredictionAim.OriginalState then
				PredictionAim.Humanoid.WalkSpeed = PredictionAim.OriginalState.WalkSpeed
				PredictionAim.Humanoid.JumpPower = PredictionAim.OriginalState.JumpPower
				PredictionAim.Humanoid.AutoRotate = PredictionAim.OriginalState.AutoRotate
				PredictionAim.OriginalState = nil
			end
		end
	end

	if LocalPlayer.Character then setupCharacter(LocalPlayer.Character) end
	LocalPlayer.CharacterAdded:Connect(setupCharacter)
	CreateUI()
	RunService.RenderStepped:Connect(OnRenderStep)





local SpecialAimbot = Tabs.Aimbot:AddLeftGroupbox("幸存者自瞄(无声静默)")

-- 默认距离设置
local defaultAimDistance = 100
local aimDistanceSettings = {
    SSA = defaultAimDistance,
    GAA = defaultAimDistance
}

-- 平滑度和锁定时间设置
local aimSmoothnessSettings = {
    SSA = 50,
    GAA = 50
}

local aimDurationSettings = {
    SSA = 100,
    GAA = 100
}



SpecialAimbot:AddSlider("SSA_Distance", {
    Text = "谢德自瞄距离",
    Default = defaultAimDistance,
    Min = 10,
    Max = 500,
    Rounding = 1,
    Callback = function(value)
        aimDistanceSettings.SSA = value
    end
})

SpecialAimbot:AddSlider("GAA_Distance", {
    Text = "访客自瞄距离",
    Default = defaultAimDistance,
    Min = 10,
    Max = 500,
    Rounding = 1,
    Callback = function(value)
        aimDistanceSettings.GAA = value
    end
})




local function SmoothLookAt(currentCF, targetPos, smoothness)
    local currentLook = currentCF.LookVector
    local targetLook = (targetPos - currentCF.Position).Unit
    local newLook = currentLook:Lerp(targetLook, 1/smoothness)
    return CFrame.lookAt(currentCF.Position, currentCF.Position + newLook)
end



function AimSlashShedletsky(value)
    local aimslashsword = value
    if value then
        local shedaimbotsounds = {
            "rbxassetid://106397684977541",
            "rbxassetid://106397684977541"
        }
        aimslash = game.Players.LocalPlayer.Character.Sword.ChildAdded:Connect(function(child)
            if not aimslashsword then return end
            for _, v in ipairs(shedaimbotsounds) do
                if child.Name == v then
                    local targetkiller = game.Workspace.Players:FindFirstChild("Killers"):FindFirstChildOfClass("Model")
                    if targetkiller and targetkiller:FindFirstChild("HumanoidRootPart") then
                        if game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
                            local distance = (targetkiller.HumanoidRootPart.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude
                            if distance <= aimDistanceSettings.SSA then
                                local number = 1
                                local smoothness = aimSmoothnessSettings.SSA
                                local duration = aimDurationSettings.SSA
                                local connection
                                connection = game:GetService("RunService").RenderStepped:Connect(function()
                                    if number <= duration then
                                        task.wait(0.01)
                                        number = number + 1
                                        local currentCF = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
                                        local targetPos = targetkiller.HumanoidRootPart.Position
                                        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = SmoothLookAt(currentCF, targetPos, smoothness)
                                    else
                                        connection:Disconnect()
                                    end
                                end)
                            end
                        end
                    end
                end
            end
        end)
    else
        if aimslash then
            aimslash:Disconnect()
        end
    end
end

function AimAttackGuest(value)
    local aimattackguest = value
    if value then
        aimguest = game:GetService("ReplicatedStorage").Modules.Network.RemoteEvent.OnClientEvent:Connect(function(eventName, eventArg)
            if not aimattackguest then return end
            if eventName == "UseActorAbility" and type(eventArg) == "table" and eventArg[1] and tostring(eventArg[1]) == buffer.fromstring("\"Punch\"") then
                local targetkiller = game.Workspace.Players:FindFirstChild("Killers"):FindFirstChildOfClass("Model")
                if targetkiller and targetkiller:FindFirstChild("HumanoidRootPart") then
                    if game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
                        local distance = (targetkiller.HumanoidRootPart.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude
                        if distance <= aimDistanceSettings.GAA then
                            local number = 1
                            local smoothness = aimSmoothnessSettings.GAA
                            local duration = aimDurationSettings.GAA
                            local connection
                            connection = game:GetService("RunService").RenderStepped:Connect(function()
                                if number <= duration then
                                    task.wait(0.01)
                                    number = number + 1
                                    local currentCF = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
                                    local targetPos = targetkiller.HumanoidRootPart.Position
                                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = SmoothLookAt(currentCF, targetPos, smoothness)
                                else
                                    connection:Disconnect()
                                end
                            end)
                        end
                    end
                end
            end
        end)
    else
        if aimguest then
            aimguest:Disconnect()
        end
    end
end

SpecialAimbot:AddToggle("SSA",{
    Text = "谢德自瞄",
    Callback = function(v)
        AimSlashShedletsky(v)
    end
})

SpecialAimbot:AddToggle("GAA",{
    Text = "访客自瞄",
    Callback = function(v)
        AimAttackGuest(v)
    end
})


local aimbotNoilsounds = {
    "rbxassetid://90768093259753"
}
local aimbotNoilsounds2 = {
    "rbxassetid://126318185932771"
}
local Noloop
local No2loop

-- Default settings
local aimSettings = {
    maxDistance = 50,  -- Default max aim distance
    lockTime = 3.3     -- Default lock time in seconds (330 iterations * 0.01)
}

-- Create Noli Aimbot groupbox
local g = Tabs.Aimbot:AddRightGroupbox('Noli自瞄')

-- Add sliders to the groupbox
g:AddSlider('AimDistance', {
    Text = '自瞄距离',
    Default = aimSettings.maxDistance,
    Min = 10,
    Max = 100,
    Rounding = 0,
    Compact = false,
    Callback = function(value)
        aimSettings.maxDistance = value
    end
})

g:AddSlider('LockTime', {
    Text = '自瞄锁定时长 (秒)',
    Default = aimSettings.lockTime,
    Min = 0.5,
    Max = 5,
    Rounding = 1,
    Compact = false,
    Callback = function(value)
        aimSettings.lockTime = value
    end
})

local function Noaimbot(state)
    johnaim = state
    if game:GetService("Players").LocalPlayer.Character.Name ~= "Noli" and state then
        Library:Notify("角色不对，可能出现错误", nil, 4590657391)
        return 
    end
    if state then
        Noloop = game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.ChildAdded:Connect(function(child)
            if not johnaim then return end
            for _, v in pairs(aimbotNoilsounds) do
                if child.Name == v then
                   
                    local survivors = {}
                    for _, player in pairs(game:GetService("Players"):GetPlayers()) do
                        if player ~= game:GetService("Players").LocalPlayer then
                            local character = player.Character
                            if character and character:FindFirstChild("HumanoidRootPart") then
                                table.insert(survivors, character)
                            end
                        end
                    end
    
                   
                    local nearestSurvivor = nil
                    local shortestDistance = math.huge  
                    
                    for _, survivor in pairs(survivors) do
                        local survivorHRP = survivor.HumanoidRootPart
                        local playerHRP = game:GetService("Players").LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
                        
                        if playerHRP then
                            local distance = (survivorHRP.Position - playerHRP.Position).Magnitude
                            if distance < shortestDistance and distance <= aimSettings.maxDistance then
                                shortestDistance = distance
                                nearestSurvivor = survivor
                            end
                        end
                    end
                    
                  
                    if nearestSurvivor then
                        local nearestHRP = nearestSurvivor.HumanoidRootPart
                        local playerHRP = game:GetService("Players").LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
                        local maxIterations = math.floor(aimSettings.lockTime / 0.01)  -- Convert seconds to iterations
                        if playerHRP then
                            local direction = (nearestHRP.Position - playerHRP.Position).Unit
                            local num = 1
                           
                            while num <= maxIterations do
                                task.wait(0.01)
                                num = num + 1
                                workspace.CurrentCamera.CFrame = CFrame.new(workspace.CurrentCamera.CFrame.Position, nearestHRP.Position)
                                playerHRP.CFrame = CFrame.lookAt(playerHRP.Position, Vector3.new(nearestHRP.Position.X, nearestHRP.Position.Y, nearestHRP.Position.Z))
                            end
                        end
                    end
                end
            end
        end)
    else
        if Noloop then
            Noloop:Disconnect()
            Noloop = nil
        end
    end
end

local function No2aimbot(state)
    johnaim = state
    if game:GetService("Players").LocalPlayer.Character.Name ~= "Noli" and state then
        Library:Notify("角色不对，可能出现错误", nil, 4590657391)
        return 
    end
    if state then
        No2loop = game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.ChildAdded:Connect(function(child)
            if not johnaim then return end
            for _, v in pairs(aimbotNoilsounds2) do
                if child.Name == v then
                   
                    local survivors = {}
                    for _, player in pairs(game:GetService("Players"):GetPlayers()) do
                        if player ~= game:GetService("Players").LocalPlayer then
                            local character = player.Character
                            if character and character:FindFirstChild("HumanoidRootPart") then
                                table.insert(survivors, character)
                            end
                        end
                    end
    
                   
                    local nearestSurvivor = nil
                    local shortestDistance = math.huge  
                    
                    for _, survivor in pairs(survivors) do
                        local survivorHRP = survivor.HumanoidRootPart
                        local playerHRP = game:GetService("Players").LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
                        
                        if playerHRP then
                            local distance = (survivorHRP.Position - playerHRP.Position).Magnitude
                            if distance < shortestDistance and distance <= aimSettings.maxDistance then
                                shortestDistance = distance
                                nearestSurvivor = survivor
                            end
                        end
                    end
                    
                  
                    if nearestSurvivor then
                        local nearestHRP = nearestSurvivor.HumanoidRootPart
                        local playerHRP = game:GetService("Players").LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
                        local maxIterations = math.floor(aimSettings.lockTime / 0.01)  -- Convert seconds to iterations
                        if playerHRP then
                            local direction = (nearestHRP.Position - playerHRP.Position).Unit
                            local num = 1
                           
                            while num <= maxIterations do
                                task.wait(0.01)
                                num = num + 1
                                workspace.CurrentCamera.CFrame = CFrame.new(workspace.CurrentCamera.CFrame.Position, nearestHRP.Position)
                                playerHRP.CFrame = CFrame.lookAt(playerHRP.Position, Vector3.new(nearestHRP.Position.X, nearestHRP.Position.Y, nearestHRP.Position.Z))
                            end
                        end
                    end
                end
            end
        end)
    else
        if No2loop then
            No2loop:Disconnect()
            No2loop = nil
        end
    end
end

-- Add toggles to the groupbox
g:AddToggle('NoilStarBomb', {
    Text = 'Noil星炸弹自瞄',
    Default = false,
    Callback = function(state)
        Noaimbot(state)
    end
})

g:AddToggle('NoilVoidRush', {
    Text = 'Noil冲刺自瞄',
    Default = false,
    Callback = function(state)
        No2aimbot(state)
    end
})






local Warning = Tabs.tzq:AddLeftGroupbox("杀手靠近警告")

-- 杀手靠近提示设置
local KillerWarningSettings = {
    Enabled = false,
    WarningDistance = 100, -- 警告距离(米)
    WarningColor = Color3.fromRGB(255, 0, 0), -- 警告颜色(红色)
    TextSize = 20, -- 文字大小
    BlinkInterval = 0.5, -- 闪烁间隔(秒)
    LastWarningTime = 0, -- 上次警告时间
    WarningCooldown = 5, -- 警告冷却时间(秒)
    WarningSoundId = "rbxassetid://6545327576", -- 警告音效ID
    SoundVolume = 0.5 -- 音效音量
}

-- 存储绘制对象
local warningLabel = Drawing.new("Text")
warningLabel.Visible = false
warningLabel.Center = true
warningLabel.Outline = true
warningLabel.Font = 2 -- 粗体字体
warningLabel.Color = KillerWarningSettings.WarningColor
warningLabel.Size = KillerWarningSettings.TextSize

-- 存储音效对象
local warningSound = Instance.new("Sound")
warningSound.SoundId = KillerWarningSettings.WarningSoundId
warningSound.Volume = KillerWarningSettings.SoundVolume
warningSound.Parent = game:GetService("SoundService")

-- 更新警告显示
local function updateKillerWarning()
    local player = game.Players.LocalPlayer
    local character = player.Character
    if not character or not character:FindFirstChild("HumanoidRootPart") then return end
    
    local killersFolder = workspace.Players:FindFirstChild("Killers")
    if not killersFolder then return end
    
    local closestDistance = math.huge
    local closestKiller = nil
    
    -- 寻找最近的杀手
    for _, killer in ipairs(killersFolder:GetChildren()) do
        if killer:IsA("Model") and killer:FindFirstChild("HumanoidRootPart") then
            local distance = (character.HumanoidRootPart.Position - killer.HumanoidRootPart.Position).Magnitude
            if distance < closestDistance then
                closestDistance = distance
                closestKiller = killer
            end
        end
    end
    
    -- 检查距离并显示警告
    if closestKiller and closestDistance <= KillerWarningSettings.WarningDistance then
        local currentTime = tick()
        
        -- 闪烁效果
        if currentTime - KillerWarningSettings.LastWarningTime >= KillerWarningSettings.BlinkInterval then
            warningLabel.Visible = not warningLabel.Visible
            KillerWarningSettings.LastWarningTime = currentTime
        end
        
        -- 设置警告文本
        warningLabel.Text = string.format("⚠️Warning! 杀手 %s 在 %d 米内!", closestKiller.Name, math.floor(closestDistance))
        warningLabel.Position = Vector2.new(
            workspace.CurrentCamera.ViewportSize.X / 2,
            workspace.CurrentCamera.ViewportSize.Y * 0.2
        )
        
        -- 播放警告音效(冷却时间内只播放一次)
        if currentTime - KillerWarningSettings.LastWarningTime >= KillerWarningSettings.WarningCooldown then
            warningSound:Play()
            KillerWarningSettings.LastWarningTime = currentTime
        end
    else
        warningLabel.Visible = false
    end
end

-- 主开关
Warning:AddToggle("KillerWarningToggle", {
    Text = "启用",
    Default = false,
    Callback = function(enabled)
        KillerWarningSettings.Enabled = enabled
        if enabled then
            -- 初始化连接
            if not KillerWarningSettings.connection then
                KillerWarningSettings.connection = game:GetService("RunService").RenderStepped:Connect(updateKillerWarning)
            end
        else
            -- 关闭连接
            if KillerWarningSettings.connection then
                KillerWarningSettings.connection:Disconnect()
                KillerWarningSettings.connection = nil
            end
            warningLabel.Visible = false
            warningSound:Stop()
        end
    end
})

-- 距离设置
Warning:AddSlider("WarningDistance", {
    Text = "警告距离(米)",
    Min = 10,
    Max = 200,
    Default = 100,
    Rounding = 0,
    Callback = function(value)
        KillerWarningSettings.WarningDistance = value
    end
})

-- 文字大小设置
Warning:AddSlider("WarningTextSize", {
    Text = "文字大小",
    Min = 10,
    Max = 30,
    Default = 20,
    Rounding = 0,
    Callback = function(value)
        KillerWarningSettings.TextSize = value
        warningLabel.Size = value
    end
})



-- 警告颜色选择
Warning:AddDropdown("WarningColor", {
    Values = {"red", "orange", "yellow", "pink", "purple"},
    Default = "red",
    Text = "文字颜色",
    Callback = function(value)
        local colorMap = {
            ["red"] = Color3.fromRGB(255, 0, 0),
            ["orange"] = Color3.fromRGB(255, 165, 0),
            ["yellow"] = Color3.fromRGB(255, 255, 0),
            ["pink"] = Color3.fromRGB(255, 192, 203),
            ["purple"] = Color3.fromRGB(128, 0, 128)
        }
        KillerWarningSettings.WarningColor = colorMap[value] or Color3.fromRGB(255, 0, 0)
        warningLabel.Color = KillerWarningSettings.WarningColor
    end
})


local Visual = Tabs.tzq:AddRightGroupbox("Noli能力监听")



Visual:AddToggle("NoliTeleportAlert", {
    Text = "Noli选择电机提示",
    Default = false,
    Callback = function(v)
        if v then
            local activeConnections = {}
            local lastNotifyTime = 0
            local COOLDOWN = 2
            local TARGET_SOUND_ID = "rbxassetid://125253972523701"

            local function safeNotify()
                local currentTime = tick()
                if currentTime - lastNotifyTime > COOLDOWN then
                    Library:Notify("warning\nNoli is transmitting")
                    lastNotifyTime = currentTime
                end
            end

            local function checkSoundPlaying(sound)
                return sound and sound.IsPlaying or false
            end

            local function monitorSound(sound)
                task.spawn(function()
                    while sound.Parent and checkSoundPlaying(sound) do
                        safeNotify()
                        task.wait(COOLDOWN)
                    end
                end)
            end

            local function setupKiller(killer)
                local humanoidRootPart = killer:WaitForChild("HumanoidRootPart", 5)
                if humanoidRootPart then
                   
                    for _, child in ipairs(humanoidRootPart:GetChildren()) do
                        if child:IsA("Sound") and child.SoundId == TARGET_SOUND_ID then
                            monitorSound(child)
                        end
                    end

                
                    local connection = humanoidRootPart.ChildAdded:Connect(function(child)
                        if child:IsA("Sound") and child.SoundId == TARGET_SOUND_ID then
                            monitorSound(child)
                        end
                    end)
                    
                    table.insert(activeConnections, connection)
                end
            end

        
            table.insert(activeConnections, workspace.Players.Killers.ChildAdded:Connect(setupKiller))

          
            for _, killer in ipairs(workspace.Players.Killers:GetChildren()) do
                task.spawn(setupKiller, killer)
            end
        else
           
            for _, conn in ipairs(activeConnections) do
                conn:Disconnect()
            end
            activeConnections = {}
        end
    end
})



Visual:AddToggle("NoliMotorSelect", {
    Text = "Noli传送电机提示",
    Default = false,
    Callback = function(v)
        local soundId = "rbxassetid://124468317999247"
        local notificationMessage = "⚠️Warning\nNoli Selecting Generator"
        local connections = {}
        local cooldown = 2 -- 通知冷却时间(秒)
        local lastNotifyTime = 0

        local function disconnectAll()
            for _, conn in pairs(connections) do
                conn:Disconnect()
            end
            connections = {}
        end

        local function safeNotify()
            local now = os.time()
            if now - lastNotifyTime >= cooldown then
                Library:Notify(notificationMessage)
                lastNotifyTime = now
            end
        end

        local function setupSoundListener(humanoidRootPart)
            local function onChildAdded(child)
                if child:IsA("Sound") and child.SoundId == soundId then
                    safeNotify()
                end
            end

            local conn = humanoidRootPart.ChildAdded:Connect(onChildAdded)
            table.insert(connections, conn)

            -- 检查已存在的音频
            for _, child in ipairs(humanoidRootPart:GetChildren()) do
                if child:IsA("Sound") and child.SoundId == soundId then
                    safeNotify()
                    break
                end
            end
        end

        local function onKillerAdded(killer)
            local humanoidRootPart = killer:FindFirstChild("HumanoidRootPart") or killer:WaitForChild("HumanoidRootPart", 3)
            if humanoidRootPart then
                setupSoundListener(humanoidRootPart)
            end
        end

        if v then
            -- 监听新杀手
            local mainConn = workspace.Players.Killers.ChildAdded:Connect(onKillerAdded)
            table.insert(connections, mainConn)

            -- 初始化现有杀手
            for _, killer in ipairs(workspace.Players.Killers:GetChildren()) do
                task.spawn(onKillerAdded, killer)
            end
        else
            disconnectAll()
        end
    end
})





Visual:AddToggle("NoliMotorSelect", {
    Text = "Noli冲刺提示",
    Default = false,
    Callback = function(v)
        local soundId = "rbxassetid://126318185932771"
        local notificationMessage = "Noli is sprinting"
        local endNotificationMessage = "Noli冲刺结束"
        local connections = {}
        local cooldown = 2
        local lastNotifyTime = 0

        local function disconnectAll()
            for _, conn in pairs(connections) do
                conn:Disconnect()
            end
            connections = {}
        end

        local function safeNotify(message)
            local now = os.time()
            if now - lastNotifyTime >= cooldown then
                Library:Notify(message)
                lastNotifyTime = now
            end
        end

        local function setupSoundListener(humanoidRootPart)
            local function onChildAdded(child)
                if child:IsA("Sound") and child.SoundId == soundId then
                    safeNotify(notificationMessage)
                    local endedConn = child.Ended:Connect(function()
                        safeNotify(endNotificationMessage)
                        endedConn:Disconnect()
                    end)
                    table.insert(connections, endedConn)
                end
            end

            local conn = humanoidRootPart.ChildAdded:Connect(onChildAdded)
            table.insert(connections, conn)

            for _, child in ipairs(humanoidRootPart:GetChildren()) do
                if child:IsA("Sound") and child.SoundId == soundId then
                    safeNotify(notificationMessage)
                    if child.IsPlaying then
                        local endedConn = child.Ended:Connect(function()
                            safeNotify(endNotificationMessage)
                            endedConn:Disconnect()
                        end)
                        table.insert(connections, endedConn)
                    end
                    break
                end
            end
        end

        local function onKillerAdded(killer)
            local humanoidRootPart = killer:FindFirstChild("HumanoidRootPart") or killer:WaitForChild("HumanoidRootPart", 3)
            if humanoidRootPart then
                setupSoundListener(humanoidRootPart)
            end
        end

        if v then
            local mainConn = workspace.Players.Killers.ChildAdded:Connect(onKillerAdded)
            table.insert(connections, mainConn)
            for _, killer in ipairs(workspace.Players.Killers:GetChildren()) do
                task.spawn(onKillerAdded, killer)
            end
        else
            disconnectAll()
        end
    end
})


















local Visual = Tabs.tzq:AddRightGroupbox('其他')



Visual:AddToggle("NST",{
Text = "地下空间炸弹生成提示",
Default = false,
Callback = function(v)
if v then
NotifySubspaceTripmine = workspace.Map.Ingame.DescendantAdded:Connect(function(v)
if v.Name == "SubspaceTripmine" then
Library:Notify("Old Winter | Warning\nBlock 'SubspaceTripmine generated！")
end
end)
else
NotifySubspaceTripmine:Disconnect()
end
end})
Visual:AddToggle("NEK",{
Text = "实体生成提示",
Default = false,
Callback = function(v)
if v then
NotifyEntityKillers = workspace.DescendantAdded:Connect(function(v)
if v:IsA("Model") and v.Name == "PizzaDeliveryRig" or v.Name == "Bunny" or v.Name == "Mafiaso1" or v.Name == "Mafiaso2" or v.Name == "Mafiaso3" then
Library:Notify("Old Winter | Warning\nEntity '" .. v.Name .. "' 生成了！")
elseif v:IsA("Model") and v.Name == "1x1x1x1Zombie" then
Library:Notify("Old Winter | Warning\nEntity '1x1x1x1 (zombies)' 生成了！")
end
end)
else
NotifyEntityKillers:Disconnect()
end
end})


















local ZZ = Tabs.ani:AddLeftGroupbox('Noli反效果')

local noliDeleterActive = false
local deletionConnection = nil
local allowedNoli = nil
local isVoidRushCrashed = false
local characterCheckLoop = nil
local voidRushOverrideActive = false
local voidRushState = {}
local RunService = game:GetService("RunService")

local function deleteNewNoli()
    local killersFolder = workspace:WaitForChild("Players")
    local killers = killersFolder:WaitForChild("Killers")
    
    allowedNoli = killers:FindFirstChild("Noli")
    if not allowedNoli then
        return
    end
    
    if deletionConnection then
        deletionConnection:Disconnect()
        deletionConnection = nil
    end
    
    deletionConnection = RunService.Heartbeat:Connect(function()
        allowedNoli = killers:FindFirstChild("Noli")
        
        if not allowedNoli then
            if deletionConnection then
                deletionConnection:Disconnect()
                deletionConnection = nil
            end
            return
        end
        
        for _, child in killers:GetChildren() do
            if child.Name == "Noli" and child ~= allowedNoli then
                child:Destroy()
            end
        end
    end)
end

ZZ:AddToggle("NoliDeleter", {
    Text = "反假Noli",
    Default = false,
    Callback = function(enabled)
        noliDeleterActive = enabled
        
        if enabled then
            if deletionConnection then
                deletionConnection:Disconnect()
                deletionConnection = nil
            end
            
            local success, err = pcall(function()
                deleteNewNoli()
            end)
            
            if not success then
                noliDeleterActive = false
            end
        else
            if deletionConnection then
                deletionConnection:Disconnect()
                deletionConnection = nil
            end
            allowedNoli = nil
        end
    end
})

local killersFolder = workspace:WaitForChild("Players")
local killers = killersFolder:WaitForChild("Killers")

killers.ChildAdded:Connect(function(child)
    if noliDeleterActive and child.Name == "Noli" and not deletionConnection then
        task.wait(0.5)
        if noliDeleterActive and not deletionConnection then
            deleteNewNoli()
        end
    end
end)

local player = game:GetService("Players").LocalPlayer

local function manageVoidRushState(character)
    while isVoidRushCrashed and character and character.Parent do
        character:SetAttribute("VoidRushState", "Crashed")
        task.wait(0.5)
    end
end

ZZ:AddToggle("无视障碍[Noli]", {
    Text = "Noli无视障碍",
    Default = false,
    Callback = function(enabled)
        isVoidRushCrashed = enabled
        local character = player.Character
        
        if characterCheckLoop then
            task.cancel(characterCheckLoop)
            characterCheckLoop = nil
        end
        
        if enabled then
            if character then
                characterCheckLoop = task.spawn(function()
                    manageVoidRushState(character)
                end)
            end
        else
            if character then
                character:SetAttribute("VoidRushState", nil)
            end
        end
    end
})

player.CharacterAdded:Connect(function(newCharacter)
    if isVoidRushCrashed then
        if characterCheckLoop then
            task.cancel(characterCheckLoop)
        end
        characterCheckLoop = task.spawn(function()
            manageVoidRushState(newCharacter)
        end)
    end
end)

ZZ:AddToggle("VoidRushOverride", {
    Text = "Noli自由冲刺[需要锁定视角]",
    Default = false,
    Callback = function(enabled)
        voidRushOverrideActive = enabled
        
        if voidRushState.monitorTask then
            task.cancel(voidRushState.monitorTask)
            voidRushState.monitorTask = nil
        end
        
        if voidRushState.overrideConnection then
            voidRushState.overrideConnection:Disconnect()
            voidRushState.overrideConnection = nil
        end
        
        if voidRushState.characterAddedConnection then
            voidRushState.characterAddedConnection:Disconnect()
            voidRushState.characterAddedConnection = nil
        end
        
        if enabled then
            local LocalPlayer = game:GetService("Players").LocalPlayer
            local ORIGINAL_DASH_SPEED = 60
            local DEFAULT_WALK_SPEED = 16
            
            local function setupCharacter()
                if LocalPlayer.Character then
                    local Character = LocalPlayer.Character
                    local Humanoid = Character:FindFirstChildOfClass("Humanoid")
                    local HumanoidRootPart = Character:FindFirstChild("HumanoidRootPart")
                    
                    if Humanoid then
                        Humanoid.WalkSpeed = DEFAULT_WALK_SPEED
                        Humanoid.AutoRotate = true
                    end
                    
                    return Character, Humanoid, HumanoidRootPart
                end
                return nil, nil, nil
            end
            
            local function startOverride(Humanoid, HumanoidRootPart)
                if voidRushState.overrideConnection then return end
                
                voidRushState.overrideConnection = RunService.RenderStepped:Connect(function()
                    if not Humanoid or not HumanoidRootPart or not voidRushOverrideActive then
                        return
                    end
                    
                    Humanoid.WalkSpeed = ORIGINAL_DASH_SPEED
                    Humanoid.AutoRotate = false
                    
                    local direction = HumanoidRootPart.CFrame.LookVector
                    local horizontalDirection = Vector3.new(direction.X, 0, direction.Z).Unit
                    Humanoid:Move(horizontalDirection)
                end)
            end
            
            local function stopOverride()
                if voidRushState.overrideConnection then
                    voidRushState.overrideConnection:Disconnect()
                    voidRushState.overrideConnection = nil
                end
                
                local Character, Humanoid = setupCharacter()
                if Humanoid then
                    Humanoid.WalkSpeed = DEFAULT_WALK_SPEED
                    Humanoid.AutoRotate = true
                    Humanoid:Move(Vector3.new(0, 0, 0))
                end
            end
            
            local function monitorVoidRush()
                while voidRushOverrideActive do
                    local Character, Humanoid, HumanoidRootPart = setupCharacter()
                    
                    if Character and Humanoid and HumanoidRootPart then
                        local voidRushStateAttr = Character:GetAttribute("VoidRushState")
                        if voidRushStateAttr == "Dashing" then
                            startOverride(Humanoid, HumanoidRootPart)
                        else
                            stopOverride()
                        end
                    end
                    
                    task.wait()
                end
                stopOverride()
            end
            
            voidRushState.monitorTask = task.spawn(monitorVoidRush)
            
            voidRushState.characterAddedConnection = LocalPlayer.CharacterAdded:Connect(function(newChar)
                if voidRushOverrideActive then
                    local Humanoid = newChar:WaitForChildOfClass("Humanoid")
                    local HumanoidRootPart = newChar:WaitForChild("HumanoidRootPart")
                    Humanoid.WalkSpeed = DEFAULT_WALK_SPEED
                    Humanoid.AutoRotate = true
                end
            end)
        end
    end
})

local ZZ = Tabs.ani:AddRightGroupbox('1x4反效果')local ReplicatedStorage = game:GetService("ReplicatedStorage")

local LocalPlayer = Players.LocalPlayer
local RemoteEvent = ReplicatedStorage.Modules.Network.RemoteEvent

local AutoPopup = {
    Enabled = false,
    Task = nil,
    Connections = {},
    Interval = 0.5
}

local function deletePopups()
    if not LocalPlayer or not LocalPlayer:FindFirstChild("PlayerGui") then
        return false
    end
    
    local tempUI = LocalPlayer.PlayerGui:FindFirstChild("TemporaryUI")
    if not tempUI then
        return false
    end
    
    local deleted = false
    for _, popup in ipairs(tempUI:GetChildren()) do
        if popup.Name == "1x1x1x1Popup" then
            popup:Destroy()
            deleted = true
        end
    end
    return deleted
end

local function triggerEntangled()
    pcall(function()
        RemoteEvent:FireServer(
            "Entangled",
            {}
        )
    end)
end

local function setupPopupListener()
    if not LocalPlayer or not LocalPlayer:FindFirstChild("PlayerGui") then return end
    
    local tempUI = LocalPlayer.PlayerGui:FindFirstChild("TemporaryUI")
    if not tempUI then
        tempUI = Instance.new("Folder")
        tempUI.Name = "TemporaryUI"
        tempUI.Parent = LocalPlayer.PlayerGui
    end
    
    if AutoPopup.Connections.ChildAdded then
        AutoPopup.Connections.ChildAdded:Disconnect()
    end
    
    AutoPopup.Connections.ChildAdded = tempUI.ChildAdded:Connect(function(child)
        if AutoPopup.Enabled and child.Name == "1x1x1x1Popup" then
            task.defer(function()
                child:Destroy()
                triggerEntangled()
            end)
        end
    end)
end

local function runMainTask()
    while AutoPopup.Enabled do
        deletePopups()
        task.wait(AutoPopup.Interval)
    end
end

local function startAutoPopup()
    if AutoPopup.Enabled then return end
    
    AutoPopup.Enabled = true
    setupPopupListener()
    
    if AutoPopup.Task then
        task.cancel(AutoPopup.Task)
    end
    AutoPopup.Task = task.spawn(runMainTask)
end

local function stopAutoPopup()
    if not AutoPopup.Enabled then return end
    
    AutoPopup.Enabled = false
    
    if AutoPopup.Task then
        task.cancel(AutoPopup.Task)
        AutoPopup.Task = nil
    end
    
    for _, connection in pairs(AutoPopup.Connections) do
        connection:Disconnect()
    end
    AutoPopup.Connections = {}
end

ZZ:AddSlider('AutoPopupInterval', {
    Text = '执行间隔(s)',
    Default = 0.5,
    Min = 0.5,
    Max = 2,
    Rounding = 0,
    Tooltip = '设置自动执行的间隔时间(1-5秒)',
    Callback = function(value)
        AutoPopup.Interval = value
    end
})

ZZ:AddToggle('AutoPopupToggle', {
    Text = '反弹窗',
    Default = false,
    Tooltip = '去除弹窗和懒惰效果',
    Callback = function(state)
        if state then
            startAutoPopup()
        else
            stopAutoPopup()
        end
    end
})

if LocalPlayer then
    LocalPlayer:GetPropertyChangedSignal("Parent"):Connect(function()
        if not LocalPlayer.Parent then
            stopAutoPopup()
        end
    end)
end


ZZ:AddToggle("RemoveUnstableEye", {
    Text = "反不稳定眼不能行走", 
    Default = false,
    Callback = function(v)
        if not _G.UnstableEyeCleanup then _G.UnstableEyeCleanup = {} end
        local connections = _G.UnstableEyeCleanup

        for _, conn in pairs(connections) do
            if typeof(conn) == "RBXScriptConnection" then
                conn:Disconnect()
            end
        end
        _G.UnstableEyeCleanup = {}

        if not v then return end

        local function CleanUnstableEyeEffects()
            local killersFolder = workspace:FindFirstChild("Players") and workspace.Players:FindFirstChild("Killers")
            if not killersFolder then return end
            
            for _, killer in ipairs(killersFolder:GetDescendants()) do
                if killer.Name == "UnstableEye" then
                    killer:Destroy()
                end
            end
        end

        task.spawn(CleanUnstableEyeEffects)

        connections.heartbeat = game:GetService("RunService").Heartbeat:Connect(function()
            task.wait(1.5)
            CleanUnstableEyeEffects()
        end)

        local killersFolder = workspace:FindFirstChild("Players") and workspace.Players:FindFirstChild("Killers")
        if killersFolder then
            connections.descendantAdded = killersFolder.DescendantAdded:Connect(function(descendant)
                if descendant.Name == "UnstableEye" then
                    descendant:Destroy()
                end
            end)
        end
    end
})

ZZ:AddToggle("RemoveBlindness", {
    Text = "反失明", 
    Default = false,
    Callback = function(v)
        if not _G.BlindnessCleanup then _G.BlindnessCleanup = {} end
        local connections = _G.BlindnessCleanup

        for _, conn in pairs(connections) do
            if typeof(conn) == "RBXScriptConnection" then
                conn:Disconnect()
            end
        end
        _G.BlindnessCleanup = {}

        if not v then return end

        local ReplicatedStorage = game:GetService("ReplicatedStorage")
        local modulesFolder = ReplicatedStorage:FindFirstChild("Modules")
        local statusEffects = modulesFolder and modulesFolder:FindFirstChild("StatusEffects")
        
        if not statusEffects then
            warn("未找到 ReplicatedStorage.Modules.StatusEffects 路径")
            return
        end
        
        local function RemoveBlindness()
            local blindness = statusEffects:FindFirstChild("Blindness")
            if blindness then
                blindness:Destroy()
            end
        end

        task.spawn(RemoveBlindness)

        connections.heartbeat = game:GetService("RunService").Heartbeat:Connect(function()
            task.wait(1.5)
            RemoveBlindness()
        end)

        connections.descendantAdded = statusEffects.DescendantAdded:Connect(function(descendant)
            if descendant.Name == "Blindness" then
                task.wait(0.1)
                descendant:Destroy()
            end
        end)
    end
})

local ZZ = Tabs.ani:AddRightGroupbox('谢德反效果')

ZZ:AddToggle("RemoveStunningKiller", {
    Text = "反谢德挥剑速度", 
    Default = false,
    Callback = function(v)
        if not _G.StunningKillerCleanup then _G.StunningKillerCleanup = {} end
        local connections = _G.StunningKillerCleanup

        for _, conn in pairs(connections) do
            if typeof(conn) == "RBXScriptConnection" then
                conn:Disconnect()
            end
        end
        _G.StunningKillerCleanup = {}

        if not v then return end

        local function CleanStunningKillers()
            local survivorsFolder = workspace:FindFirstChild("Players") and workspace.Players:FindFirstChild("Survivors")
            if not survivorsFolder then return end
            
            local survivorList = survivorsFolder:GetChildren()
            for i = 1, #survivorList, 5 do
                task.spawn(function()
                    for j = i, math.min(i + 4, #survivorList) do
                        local survivor = survivorList[j]
                        local stunningKiller = survivor:FindFirstChild("StunningKiller")
                        if stunningKiller then
                            stunningKiller:Destroy()
                        end
                    end
                end)
            end
        end

        task.spawn(CleanStunningKillers)

        connections.heartbeat = game:GetService("RunService").Heartbeat:Connect(function()
            task.wait(2)
            CleanStunningKillers()
        end)

        local survivorsFolder = workspace:FindFirstChild("Players") and workspace.Players:FindFirstChild("Survivors")
        if survivorsFolder then
            connections.descendantAdded = survivorsFolder.DescendantAdded:Connect(function(descendant)
                if descendant.Name == "StunningKiller" then
                    descendant:Destroy()
                end
            end)
        end
    end
})

local ZZ2 = Tabs.ani:AddRightGroupbox('NOOB 反效果')

ZZ2:AddToggle("RemoveSlateskin", {
    Text = "反Noob石板速度", 
    Default = false,
    Callback = function(v)
        if not _G.SlateskinCleanup then _G.SlateskinCleanup = {} end
        local connections = _G.SlateskinCleanup

        for _, conn in pairs(connections) do
            if typeof(conn) == "RBXScriptConnection" then
                conn:Disconnect()
            end
        end
        _G.SlateskinCleanup = {}

        if not v then return end

        local function CleanSlateskins()
            local survivorsFolder = workspace:FindFirstChild("Players") and workspace.Players:FindFirstChild("Survivors")
            if not survivorsFolder then return end
            
            local survivorList = survivorsFolder:GetChildren()
            for i = 1, #survivorList, 5 do
                task.spawn(function()
                    for j = i, math.min(i + 4, #survivorList) do
                        local survivor = survivorList[j]
                        local slateskin = survivor:FindFirstChild("SlateskinStatus")
                        if slateskin then
                            slateskin:Destroy()
                        end
                    end
                end)
            end
        end

        task.spawn(CleanSlateskins)

        connections.heartbeat = game:GetService("RunService").Heartbeat:Connect(function()
            task.wait(2)
            CleanSlateskins()
        end)

        local survivorsFolder = workspace:FindFirstChild("Players") and workspace.Players:FindFirstChild("Survivors")
        if survivorsFolder then
            connections.descendantAdded = survivorsFolder.DescendantAdded:Connect(function(descendant)
                if descendant.Name == "SlateskinStatus" then
                    descendant:Destroy()
                end
            end)
        end
    end
})




local Disabled = Tabs.ani:AddLeftGroupbox('访客反效果')

Disabled:AddToggle("RemoveSlowed", {
    Text = "反缓慢", 
    Default = false,
    Callback = function(v)
        if not _G.SlowedCleanup then _G.SlowedCleanup = {} end
        local connections = _G.SlowedCleanup

        for _, conn in pairs(connections) do
            if typeof(conn) == "RBXScriptConnection" then
                conn:Disconnect()
            end
        end
        _G.SlowedCleanup = {}

        if not v then return end

        local function CleanSlowedStatuses()
            local survivorsFolder = workspace:FindFirstChild("Players") and workspace.Players:FindFirstChild("Survivors")
            if not survivorsFolder then return end
            
            for _, survivor in ipairs(survivorsFolder:GetDescendants()) do
                if survivor.Name == "SlowedStatus" then
                    survivor:Destroy()
                end
            end
        end

        task.spawn(CleanSlowedStatuses)

        connections.heartbeat = game:GetService("RunService").Heartbeat:Connect(function()
            task.wait(1.5)
            CleanSlowedStatuses()
        end)

        local survivorsFolder = workspace:FindFirstChild("Players") and workspace.Players:FindFirstChild("Survivors")
        if survivorsFolder then
            connections.descendantAdded = survivorsFolder.DescendantAdded:Connect(function(descendant)
                if descendant.Name == "SlowedStatus" then
                    descendant:Destroy()
                end
            end)
        end
    end
})

Disabled:AddToggle("RemoveBlockingSlow", {
    Text = "反格挡速度", 
    Default = false,
    Callback = function(v)
        if not _G.BlockingCleanup then _G.BlockingCleanup = {} end
        local connections = _G.BlockingCleanup

        for _, conn in pairs(connections) do
            if typeof(conn) == "RBXScriptConnection" then
                conn:Disconnect()
            end
        end
        _G.BlockingCleanup = {}

        if not v then return end

        local function CleanStatuses()
            local survivorsFolder = workspace:FindFirstChild("Players") and workspace.Players:FindFirstChild("Survivors")
            if not survivorsFolder then return end
            
            for _, survivor in ipairs(survivorsFolder:GetDescendants()) do
                if survivor.Name == "ResistanceStatus" or survivor.Name == "GuestBlocking" then
                    survivor:Destroy()
                end
            end
        end

        task.spawn(CleanStatuses)

        connections.heartbeat = game:GetService("RunService").Heartbeat:Connect(function()
            task.wait(1.5)
            CleanStatuses()
        end)

        local survivorsFolder = workspace:FindFirstChild("Players") and workspace.Players:FindFirstChild("Survivors")
        if survivorsFolder then
            connections.descendantAdded = survivorsFolder.DescendantAdded:Connect(function(descendant)
                if descendant.Name == "ResistanceStatus" or descendant.Name == "GuestBlocking" then
                    descendant:Destroy()
                end
            end)
        end
    end
})

Disabled:AddToggle("RemovePunchSlow", {
    Text = "反拳击速度", 
    Default = false,
    Callback = function(v)
        if not _G.PunchCleanup then _G.PunchCleanup = {} end
        local connections = _G.PunchCleanup

        for _, conn in pairs(connections) do
            if typeof(conn) == "RBXScriptConnection" then
                conn:Disconnect()
            end
        end
        _G.PunchCleanup = {}

        if not v then return end

        local function CleanStatuses()
            local survivorsFolder = workspace:FindFirstChild("Players") and workspace.Players:FindFirstChild("Survivors")
            if not survivorsFolder then return end
            
            for _, survivor in ipairs(survivorsFolder:GetDescendants()) do
                if survivor.Name == "ResistanceStatus" or survivor.Name == "PunchAbility" then
                    survivor:Destroy()
                end
            end
        end

        task.spawn(CleanStatuses)

        connections.heartbeat = game:GetService("RunService").Heartbeat:Connect(function()
            task.wait(1.5)
            CleanStatuses()
        end)

        local survivorsFolder = workspace:FindFirstChild("Players") and workspace.Players:FindFirstChild("Survivors")
        if survivorsFolder then
            connections.descendantAdded = survivorsFolder.DescendantAdded:Connect(function(descendant)
                if descendant.Name == "ResistanceStatus" or descendant.Name == "PunchAbility" then
                    descendant:Destroy()
                end
            end)
        end
    end
})

Disabled:AddToggle("RemoveChargeEnded", {
    Text = "反冲刺结束后效果", 
    Default = false,
    Callback = function(v)
        if not _G.ChargeEndedCleanup then _G.ChargeEndedCleanup = {} end
        local connections = _G.ChargeEndedCleanup

        for _, conn in pairs(connections) do
            if typeof(conn) == "RBXScriptConnection" then
                conn:Disconnect()
            end
        end
        _G.ChargeEndedCleanup = {}

        if not v then return end

        local function CleanChargeEndedEffects()
            local survivorsFolder = workspace:FindFirstChild("Players") and workspace.Players:FindFirstChild("Survivors")
            if not survivorsFolder then return end
            
            for _, survivor in ipairs(survivorsFolder:GetDescendants()) do
                if survivor.Name == "GuestChargeEnded" then
                    survivor:Destroy()
                end
            end
        end

        task.spawn(CleanChargeEndedEffects)

        connections.heartbeat = game:GetService("RunService").Heartbeat:Connect(function()
            task.wait(1.5)
            CleanChargeEndedEffects()
        end)

        local survivorsFolder = workspace:FindFirstChild("Players") and workspace.Players:FindFirstChild("Survivors")
        if survivorsFolder then
            connections.descendantAdded = survivorsFolder.DescendantAdded:Connect(function(descendant)
                if descendant.Name == "GuestChargeEnded" then
                    descendant:Destroy()
                end
            end)
        end
    end
})
















local MenuGroup = Tabs["UI Settings"]:AddLeftGroupbox("Debug")

-- 1. 显示/隐藏快捷键菜单
MenuGroup:AddToggle("KeybindMenuOpen", {
    Default = Library.KeybindFrame.Visible,  -- 默认显示快捷键菜单
    Text = "shortcut menu",
    Callback = function(value)
        Library.KeybindFrame.Visible = value  -- 控制快捷键菜单的显示/隐藏
    end,
})

-- 2. 自定义鼠标光标
MenuGroup:AddToggle("ShowCustomCursor", {
    Text = "custom cursors",
    Default = true,  -- 默认启用
    Callback = function(Value)
        Library.ShowCustomCursor = Value  -- 启用/禁用自定义光标
    end,
})

-- 3. 设置通知位置（左/右）
MenuGroup:AddDropdown("NotificationSide", {
    Values = { "Left", "Right" },
    Default = "Right",  -- 默认右侧显示通知
    Text = "informer location",
    Callback = function(Value)
        Library:SetNotifySide(Value)  -- 设置通知位置
    end,
})

-- 4. 调整UI缩放比例（DPI）
MenuGroup:AddDropdown("DPIDropdown", {
    Values = { "25%", "50%", "75%", "100%", "125%", "150%", "175%", "200%" },
    Default = "100%",  -- 默认100%大小
    Text = "UI Size",
    Callback = function(Value)
        Value = Value:gsub("%%", "")  -- 移除百分号
        local DPI = tonumber(Value)   -- 转换为数字
        Library:SetDPIScale(DPI)      -- 调整UI缩放
    end,
})


MenuGroup:AddDivider()  
MenuGroup:AddLabel("Menu bind")  
    :AddKeyPicker("MenuKeybind", { 
        Default = "RightShift",  
        NoUI = true,            
        Text = "Menu keybind"    
    })


MenuGroup:AddButton("Destroy UI", function()
    Library:Unload()  
end)


ThemeManager:SetLibrary(Library)  
SaveManager:SetLibrary(Library)   
SaveManager:IgnoreThemeSettings() 


SaveManager:SetIgnoreIndexes({ "MenuKeybind" })  
ThemeManager:SetFolder("MyScriptHub")            
SaveManager:SetFolder("MyScriptHub/specific-game")  
SaveManager:SetSubFolder("specific-place")       
SaveManager:BuildConfigSection(Tabs["UI Settings"])  

ThemeManager:ApplyToTab(Tabs["UI Settings"])

SaveManager:LoadAutoloadConfig()



        WindUI:Notify({Title = "Old Winter被遗弃", Content = "加载成功", Duration = 3})
    end
})

Tabs.ScriptCenter:Section({Title = "小服务器"})

Tabs.ScriptCenter:Button({
    Title = "加载Make a Army功能",
    Desc = "加载Make a Army完整功能",
    Callback = function()
        LoadMakeArmy()
    end
})

Tabs.ScriptCenter:Button({
    Title = "加载成为乞丐功能",
    Desc = "加载成为乞丐完整功能",
    Callback = function()
        LoadBeggar()
    end
})

Tabs.ScriptCenter:Button({
    Title = "加载光剑模拟器功能",
    Desc = "加载光剑模拟器完整功能",
    Callback = function()
        LoadSaberSimulator()
    end
})

Tabs.ScriptCenter:Button({
    Title = "加载挖出后院功能",
    Desc = "加载挖出后院完整功能",
    Callback = function()
        LoadDigBackyard()
    end
})

Tabs.ScriptCenter:Button({
    Title = "加载元素大亨功能",
    Desc = "加载元素大亨完整功能",
    Callback = function()
        LoadElementTycoon()
    end
})

Tabs.ScriptCenter:Button({
    Title = "加载堡垒之战功能",
    Desc = "加载堡垒之战完整功能",
    Callback = function()
        LoadFortressBattle()
    end
})

-- 直接显示所有脚本分类（除了上面两个模块）
Tabs.ScriptCenter:Section({Title = "99夜脚本"})

Tabs.ScriptCenter:Button({
    Title = "h4x 99nights",
    Desc = "点击运行h4x",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/greatjakson-lgtm/-2/main/h4x99nights"))()
        WindUI:Notify({Title = "h4x 99nights", Content = "加载成功", Duration = 3})
    end
})

Tabs.ScriptCenter:Button({
    Title = "ringta 99nights",
    Desc = "点击运行ringta",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/greatjakson-lgtm/-2/main/ringta_99nights"))()
        WindUI:Notify({Title = "ringta 99nights", Content = "加载成功", Duration = 3})
    end
})

Tabs.ScriptCenter:Button({
    Title = "虚空99nights",
    Desc = "点击运行虚空",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/greatjakson-lgtm/-2/main/void_99nights"))()
        WindUI:Notify({Title = "虚空99nights", Content = "加载成功", Duration = 3})
    end
})

Tabs.ScriptCenter:Button({
    Title = "lunar 99nights［key］",
    Desc = "点击运行lunar",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/greatjakson-lgtm/-2/main/moon_99nights"))()
        WindUI:Notify({Title = "lunar 99nights", Content = "加载成功", Duration = 3})
    end
})

Tabs.ScriptCenter:Section({Title = "Doors脚本"})

Tabs.ScriptCenter:Button({
    Title = "doors null fire［key］",
    Desc = "点击运行null fire",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/greatjakson-lgtm/-2/main/wu_doors"))()
        WindUI:Notify({Title = "doors null fire", Content = "加载成功", Duration = 3})
    end
})

Tabs.ScriptCenter:Button({
    Title = "doors prohax",
    Desc = "点击运行prohax",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/atnew2025/Chinese-scripts/refs/heads/main/mshax(prohax).txt"))()
        WindUI:Notify({Title = "doors prohax", Content = "加载成功", Duration = 3})
    end
})

Tabs.ScriptCenter:Button({
    Title = "doors abysall",
    Desc = "点击运行abysall",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Cucumber190/roblox-/main/abysall%20Qcumber.lua"))()
        WindUI:Notify({Title = "doorsabysall", Content = "加载成功", Duration = 3})
    end
})

Tabs.ScriptCenter:Button({
    Title = "doors rehax",
    Desc = "点击运行rehax",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/XxwanhexxX/doors-zh/refs/heads/main/rehax%20hub-zh"))()
        WindUI:Notify({Title = "doors rehax", Content = "加载成功", Duration = 3})
    end
})

Tabs.ScriptCenter:Section({Title = "压力脚本"})

Tabs.ScriptCenter:Button({
    Title = "yoxi",
    Desc = "点击运行yoxi",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/greatjakson-lgtm/-2/main/yoxi_Pressure"))()
        WindUI:Notify({Title = "yoxi 压力", Content = "加载成功", Duration = 3})
    end
})

Tabs.ScriptCenter:Section({Title = "InkGame"})

Tabs.ScriptCenter:Button({
    Title = "inkgame boren",
    Desc = "点击运行boren",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/greatjakson-lgtm/-2/main/boren_inkgame"))()
        WindUI:Notify({Title = "inkgame boren", Content = "加载成功", Duration = 3})
    end
})

Tabs.ScriptCenter:Button({
    Title = "inkgame az中心",
    Desc = "点击运行az",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/greatjakson-lgtm/-2/main/az_hub"))()
        WindUI:Notify({Title = "inkgame az中心", Content = "加载成功", Duration = 3})
    end
})

Tabs.ScriptCenter:Button({
    Title = "tex",
    Desc = "点击运行tex",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/hdjsjjdgrhj/script-hub/refs/heads/main/TexRBLlX"))()
        WindUI:Notify({Title = "tex ink game", Content = "加载成功", Duration = 3})
    end
})

Tabs.ScriptCenter:Section({Title = "被遗弃脚本"})

Tabs.ScriptCenter:Button({
    Title = "虚空被遗弃",
    Desc = "点击运行虚空被遗弃",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/greatjakson-lgtm/-2/main/void_forsken"))()
        WindUI:Notify({Title = "虚空被遗弃", Content = "加载成功", Duration = 3})
    end
})

Tabs.ScriptCenter:Section({Title = "死亡之死"})

Tabs.ScriptCenter:Button({
    Title = "Thuker 死亡之死",
    Desc = "点击运行Thuker",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/greatjakson-lgtm/-2/main/thy_die%20of%20deah"))()
        WindUI:Notify({Title = "Thuker 死亡之死", Content = "加载成功", Duration = 3})
    end
})

Tabs.ScriptCenter:Button({
    Title = "zamzaman 死亡之死",
    Desc = "点击运行zamzaman",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/greatjakson-lgtm/-2/main/zam_die%20of%20deah"))()
        WindUI:Notify({Title = "zamzaman 死亡之死", Content = "加载成功", Duration = 3})
    end
})

Tabs.ScriptCenter:Section({Title = "力量传奇"})

Tabs.ScriptCenter:Button({
    Title = "bald力量传奇［key］",
    Desc = "点击运行bald",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/greatjakson-lgtm/-2/main/bald_力量传奇"))()
        WindUI:Notify({Title = "bald力量传奇", Content = "加载成功", Duration = 3})
    end
})

Tabs.ScriptCenter:Button({
    Title = "力量传奇修改力量（娱乐）",
    Desc = "点击运行",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/greatjakson-lgtm/-2/main/修改力量"))()
        WindUI:Notify({Title = "力量传奇修改力量", Content = "加载成功", Duration = 3})
    end
})

Tabs.ScriptCenter:Section({Title = "极速传奇"})

Tabs.ScriptCenter:Button({
    Title = "中文极速传奇",
    Desc = "点击运行中文极速传奇",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/TtmScripter/GoodScript/main/LegendOfSpeed(Chinese)"))()
        WindUI:Notify({Title = "中文极速传奇", Content = "加载成功", Duration = 3})
    end
})

Tabs.ScriptCenter:Section({Title = "忍者传奇"})

Tabs.ScriptCenter:Button({
    Title = "h3ll忍者传奇",
    Desc = "点击运行h3ll忍者传奇",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/greatjakson-lgtm/-2/main/h3ll_忍者传奇"))()
        WindUI:Notify({Title = "h3ll忍者传奇", Content = "加载成功", Duration = 3})
    end
})

Tabs.ScriptCenter:Section({Title = "FLSCH"})

Tabs.ScriptCenter:Button({
    Title = "flsch solix",
    Desc = "点击运行solix",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/greatjakson-lgtm/-2/main/solix_fisch"))()
        WindUI:Notify({Title = "flsch solix", Content = "加载成功", Duration = 3})
    end
})

Tabs.ScriptCenter:Section({Title = "BF"})

Tabs.ScriptCenter:Button({
    Title = "bf blue x",
    Desc = "点击运行blue x",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/greatjakson-lgtm/-2/main/blue%20x"))()
        WindUI:Notify({Title = "bf blue x", Content = "加载成功", Duration = 3})
    end
})

Tabs.ScriptCenter:Button({
    Title = "solix BF［key］",
    Desc = "点击运行solix",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/greatjakson-lgtm/-2/main/solix_BF"))()
        WindUI:Notify({Title = "solix BF", Content = "加载成功", Duration = 3})
    end
})

Tabs.ScriptCenter:Button({
    Title = "bf redz",
    Desc = "点击运行redz",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/greatjakson-lgtm/-2/main/rdz"))()
        WindUI:Notify({Title = "bf redz", Content = "加载成功", Duration = 3})
    end
})

Tabs.ScriptCenter:Section({Title = "死铁轨"})

Tabs.ScriptCenter:Button({
    Title = "死铁轨nat中心［key］",
    Desc = "点击运行nat",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/greatjakson-lgtm/-2/main/Nathub"))()
        WindUI:Notify({Title = "死铁轨nat中心", Content = "加载成功", Duration = 3})
    end
})

Tabs.ScriptCenter:Button({
    Title = "moon死铁轨",
    Desc = "点击运行moon",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/greatjakson-lgtm/-2/main/moondirty"))()
        WindUI:Notify({Title = "moon死铁轨", Content = "加载成功", Duration = 3})
    end
})

Tabs.ScriptCenter:Button({
    Title = "死铁轨null fire",
    Desc = "点击运行null fire",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/greatjakson-lgtm/-2/main/Nullfire_deadrail"))()
        WindUI:Notify({Title = "死铁轨null fire", Content = "加载成功", Duration = 3})
    end
})

Tabs.ScriptCenter:Button({
    Title = "死铁轨ringta",
    Desc = "点击运行ringta",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/greatjakson-lgtm/-2/main/ringta_deadrail"))()
        WindUI:Notify({Title = "死铁轨ringta", Content = "加载成功", Duration = 3})
    end
})

Tabs.ScriptCenter:Section({Title = "刀刃球"})

Tabs.ScriptCenter:Button({
    Title = "刀刃球nodex",
    Desc = "点击运行nodex",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/greatjakson-lgtm/-2/main/nodex"))()
        WindUI:Notify({Title = "刀刃球nodex", Content = "加载成功", Duration = 3})
    end
})

Tabs.ScriptCenter:Button({
    Title = "laws hub刀刃球",
    Desc = "点击运行laws hub",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/greatjakson-lgtm/-2/main/law"))()
        WindUI:Notify({Title = "laws hub刀刃球", Content = "加载成功", Duration = 3})
    end
})

Tabs.ScriptCenter:Section({Title = "偷走脑红"})

Tabs.ScriptCenter:Button({
    Title = "偷走脑红辣椒中心",
    Desc = "点击运行辣椒中心",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/greatjakson-lgtm/-2/main/chill%20stealredrot"))()
        WindUI:Notify({Title = "偷走脑红辣椒中心", Content = "加载成功", Duration = 3})
    end
})

Tabs.ScriptCenter:Button({
    Title = "偷走脑红dencycode［key］",
    Desc = "点击运行dencycode",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/greatjakson-lgtm/-2/main/pex%20steal%20brainrot"))()
        WindUI:Notify({Title = "偷走脑红dencycode", Content = "加载成功", Duration = 3})
    end
})

Tabs.ScriptCenter:Section({Title = "种植花园"})

Tabs.ScriptCenter:Button({
    Title = "种植花园红叶子［key]",
    Desc = "点击运行红叶子",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/greatjakson-lgtm/-2/main/native.lua"))()
        WindUI:Notify({Title = "种植花园红叶子", Content = "加载成功", Duration = 3})
    end
})

Tabs.ScriptCenter:Section({Title = "Chain"})

Tabs.ScriptCenter:Button({
    Title = "chain",
    Desc = "点击运行chain",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/133ufudhdu/pokl/refs/heads/main/XHTMLEWJ"))()
        WindUI:Notify({Title = "chain", Content = "加载成功", Duration = 3})
    end
})

Tabs.ScriptCenter:Button({
    Title = "AnimeWare chain［key］",
    Desc = "点击运行chain",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/greatjakson-lgtm/-2/main/amin%20ware"))()
        WindUI:Notify({Title = "AnimeWare chain", Content = "加载成功", Duration = 3})
    end
})

Tabs.ScriptCenter:Section({Title = "最强战场"})

Tabs.ScriptCenter:Button({
    Title = "最强战场五条悟",
    Desc = "点击运行五条悟",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Kamyk-player/FinalSuperSenior/refs/heads/main/SaitamaToSuperSeniorGojo"))()
        WindUI:Notify({Title = "最强战场五条悟", Content = "加载成功", Duration = 3})
    end
})

Tabs.ScriptCenter:Button({
    Title = "无限侧闪",
    Desc = "点击运行无限侧闪",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/greatjakson-lgtm/-2/main/无限侧闪"))()
        WindUI:Notify({Title = "无限侧闪", Content = "加载成功", Duration = 3})
    end
})

Tabs.ScriptCenter:Button({
    Title = "smm［key］",
    Desc = "［key］= ［RoscriptsOnTop］",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/greatjakson-lgtm/-2/main/smm"))()
        WindUI:Notify({Title = "smm最强战场", Content = "加载成功", Duration = 3})
    end
})

Tabs.ScriptCenter:Section({Title = "Evade"})

Tabs.ScriptCenter:Button({
    Title = "rise evade",
    Desc = "点击运行rise",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/greatjakson-lgtm/-2/main/irse%20evade"))()
        WindUI:Notify({Title = "rise evade", Content = "加载成功", Duration = 3})
    end
})

Tabs.ScriptCenter:Button({
    Title = "HOKALAZA evade［key]",
    Desc = "HOKALAZA EVADE SCRIPT",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/greatjakson-lgtm/-2/8a6bb0deb21ae89bed7c349f5e28a3654eac86ec/hz.lua"))()
        WindUI:Notify({Title = "HOKALAZA evade", Content = "加载成功", Duration = 3})
    end
})

Tabs.ScriptCenter:Section({Title = "Nico Next Robot"})

Tabs.ScriptCenter:Button({
    Title = "nico next robot",
    Desc = "点击运行nico next robot",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/greatjakson-lgtm/-2/main/wu_nico"))()
        WindUI:Notify({Title = "nico next robot", Content = "加载成功", Duration = 3})
    end
})

Tabs.ScriptCenter:Section({Title = "在披萨店工作"})

Tabs.ScriptCenter:Button({
    Title = "在披萨店工作脚本",
    Desc = "点击运行在披萨店工作脚本",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/greatjakson-lgtm/-2/main/hmm"))()
        WindUI:Notify({Title = "在披萨店工作脚本", Content = "加载成功", Duration = 3})
    end
})

Tabs.ScriptCenter:Section({Title = "aut"})

Tabs.ScriptCenter:Button({
    Title = "ns aut[key]",
    Desc = "点击运行aut脚本",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/greatjakson-lgtm/-2/main/NS_AUT"))()
        WindUI:Notify({Title = "aut脚本", Content = "加载成功", Duration = 3})
    end
})

-- 其他功能
Tabs.Misc:Button({
    Title = "复制作者QQ",
    Callback = function()
        setclipboard("3848974452")
        WindUI:Notify({Title = "QQ号", Content = "qq号已复制到剪贴板", Duration = 3})
    end
})

Tabs.Misc:Button({
    Title = "检查更新",
    Desc = "检查脚本更新",
    Callback = function()
        WindUI:Notify({
            Title = "更新检查",
            Content = "当前版本: v2.0\n已是最新版本",
            Duration = 5
        })
    end
})

Tabs.Misc:Button({
    Title = "重新加载脚本",
    Desc = "重新加载整个脚本",
    Callback = function()
        WindUI:Notify({
            Title = "重新加载",
            Content = "正在重新加载脚本...",
            Duration = 3
        })
        
        wait(2)
        
        -- 安全的重新加载逻辑
        local success, errorMsg = pcall(function()
            -- 停止当前运行的任何可能冲突的进程
            if _G.ActiveConnections then
                for _, connection in pairs(_G.ActiveConnections) do
                    pcall(function() connection:Disconnect() end)
                end
            end
            
            -- 重新加载主脚本
            if _G.MainScriptFunction then
                _G.MainScriptFunction()
            else
                -- 从源重新加载
                local scriptContent = game:HttpGet("https://raw.githubusercontent.com/WUSCRIPT/WU-Script/main/Ealpha%20X%20SCRIPT")
                loadstring(scriptContent)()
            end
        end)
        
        if not success then
            WindUI:Notify({
                Title = "重新加载失败",
                Content = "错误: " .. tostring(errorMsg),
                Duration = 5
            })
        end
    end
})

Tabs.Misc:Code({
    Title = "感谢游玩",
    Code = "QQ号: 3848974452\n感谢使用Old Winter\n"
})

-- 设置选项
Tabs.Misc:Section({Title = "设置"})

Tabs.Misc:Toggle({
    Title = "显示加载提示",
    Desc = "显示加载提示",
    Value = true,
    Callback = function(state)
        WindUI:Notify({
            Title = "设置",
            Content = state and "将显示加载提示" or "已隐藏加载提示",
            Duration = 2
        })
    end
})

Tabs.Misc:Toggle({
    Title = "自动保存设置",
    Desc = "自动保存用户设置",
    Value = true,
    Callback = function(state)
        WindUI:Notify({
            Title = "设置",
            Content = state and "自动保存已启用" or "自动保存已禁用",
            Duration = 2
        })
    end
})

WindUI:Notify({
    Title = "Old Winter",
    Content = "加载完成！\n作者: XiaoXu QQ: 3848974452",
    Duration = 8,
    Icon = "check-circle"
})
        Library:Destroy()
    end
})

local windUIButton = Tabs.Home:Button({
    Title = "Obsidian UI",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/greatjakson-lgtm/-2/main/%C3%BD%C3%BD-obfuscated.lua"))()
task.wait(5)
        
        local repo = "https://raw.githubusercontent.com/deividcomsono/Obsidian/main/"
local Library = loadstring(game:HttpGet(repo .. "Library.lua"))()
local ThemeManager = loadstring(game:HttpGet(repo .. "addons/ThemeManager.lua"))()
local SaveManager = loadstring(game:HttpGet(repo .. "addons/SaveManager.lua"))()

local Options = Library.Options
local Toggles = Library.Toggles

local Window = Library:CreateWindow({
    Title = "Old Winter",
    Footer = "XiaoXu | QQ: 3848974452",
    Icon = 132702574859512,
    ShowCustomCursor = true,
})

-- 全局服务引用
local Players = game:GetService("Players")
local Workspace = game:GetService("Workspace")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local ProximityPromptService = game:GetService("ProximityPromptService")
local TweenService = game:GetService("TweenService")
local HttpService = game:GetService("HttpService")
local TeleportService = game:GetService("TeleportService")
local UserInputService = game:GetService("UserInputService")
local Lighting = game:GetService("Lighting")
local CoreGui = game:GetService("CoreGui")
local LP = Players.LocalPlayer

-- 创建标签页
local Tabs = {
    Home = Window:AddTab("主页", "house"),
    ScriptCenter = Window:AddTab("脚本中心", "codesandbox"),
    StealBrainrot = Window:AddTab("偷走脑红", "brain"),
    MakeArmy = Window:AddTab("Make a Army", "users"),
    Beggar = Window:AddTab("成为乞丐", "dollar-sign"),
    SaberSimulator = Window:AddTab("光剑模拟器", "zap"),
    Misc = Window:AddTab("其他", "crown"),
    ["UI Settings"] = Window:AddTab("UI Settings", "settings"),
}

-- 主页内容
local HomeLeftGroup = Tabs.Home:AddLeftGroupbox("基础功能")
local HomeRightGroup = Tabs.Home:AddRightGroupbox("玩家功能")
local HomeBottomGroup = Tabs.Home:AddLeftGroupbox("服务器功能")

-- 基础功能
HomeLeftGroup:AddButton({
    Text = "反挂机",
    Func = function()
        pcall(function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/greatjakson-lgtm/-2/main/99nights%E5%8F%8D%E6%8C%82%E6%9C%BA%E8%84%9A%E6%9C%AC"))()
        end)
    end
})

-- FPS 显示
local FpsGui
HomeLeftGroup:AddToggle("ShowFPS", {
    Text = "显示FPS",
    Default = false,
    Callback = function(Value)
        if Value then
            if not FpsGui then
                FpsGui = Instance.new("ScreenGui")
                FpsGui.Name = "FPSGui"
                FpsGui.ResetOnSpawn = false
                
                local FpsXS = Instance.new("TextLabel")
                FpsXS.Name = "FpsXS"
                FpsXS.Size = UDim2.new(0, 100, 0, 50)
                FpsXS.Position = UDim2.new(0, 10, 0, 10)
                FpsXS.BackgroundTransparency = 1
                FpsXS.Font = Enum.Font.SourceSansBold
                FpsXS.Text = "FPS: 0"
                FpsXS.TextSize = 20
                FpsXS.TextColor3 = Color3.new(1, 1, 1)
                FpsXS.Parent = FpsGui
                FpsGui.Parent = LP:WaitForChild("PlayerGui")
                
                RunService.Heartbeat:Connect(function()
                    local fps = math.floor(1 / RunService.RenderStepped:Wait())
                    FpsXS.Text = "FPS: " .. fps
                end)
            end
            FpsGui.Enabled = true
        else
            if FpsGui then
                FpsGui.Enabled = false
            end
        end
    end
})

-- 范围显示
HomeLeftGroup:AddToggle("ShowRange", {
    Text = "显示范围",
    Default = false,
    Callback = function(Value)
        local function applyHighlight(character)
            if not character:FindFirstChild("Obsidian_RangeHighlight") then
                local highlight = Instance.new("Highlight")
                highlight.Adornee = character
                highlight.Name = "Obsidian_RangeHighlight"
                highlight.OutlineTransparency = 0
                highlight.FillTransparency = 0.7
                highlight.FillColor = Color3.fromHex("#0000FF")
                highlight.Parent = character
            end
        end

        local function removeHighlight(character)
            local h = character:FindFirstChild("Obsidian_RangeHighlight")
            if h then
                h:Destroy()
            end
        end

        if Value then
            for _, player in ipairs(Players:GetPlayers()) do
                if player ~= LP and player.Character then
                    applyHighlight(player.Character)
                end
            end
            Players.PlayerAdded:Connect(function(player)
                player.CharacterAdded:Connect(function(character)
                    task.wait(1)
                    applyHighlight(character)
                end)
            end)
            Players.PlayerRemoving:Connect(function(player)
                if player.Character then
                    removeHighlight(player.Character)
                end
            end)
        else
            for _, player in ipairs(Players:GetPlayers()) do
                if player.Character then
                    removeHighlight(player.Character)
                end
            end
        end
    end
})

HomeLeftGroup:AddButton({
    Text = "半隐身",
    Func = function()
        pcall(function() loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-Invisible-35376"))() end)
    end
})

HomeLeftGroup:AddButton({
    Text = "玩家入退提示",
    Func = function()
        pcall(function() loadstring(game:HttpGet("https://raw.githubusercontent.com/boyscp/scriscriptsc/main/bbn.lua"))() end)
    end
})

-- 玩家功能
HomeRightGroup:AddSlider("WalkSpeed", {
    Text = "移动速度",
    Default = 16,
    Min = 0,
    Max = 200,
    Rounding = 1,
    Callback = function(Value)
        local character = LP.Character
        if character then
            local humanoid = character:FindFirstChildOfClass("Humanoid")
            if humanoid then
                humanoid.WalkSpeed = Value
            end
        end
    end
})

HomeRightGroup:AddSlider("JumpPower", {
    Text = "跳跃高度",
    Default = 50,
    Min = 0,
    Max = 200,
    Rounding = 1,
    Callback = function(Value)
        local character = LP.Character
        if character then
            local humanoid = character:FindFirstChildOfClass("Humanoid")
            if humanoid then
                humanoid.JumpPower = Value
            end
        end
    end
})

HomeRightGroup:AddSlider("Health", {
    Text = "设置血量",
    Default = 100,
    Min = 0,
    Max = 1000,
    Rounding = 1,
    Callback = function(Value)
        local character = LP.Character
        if not character then
            character = LP.CharacterAdded:Wait()
        end
        local humanoid = character:WaitForChild("Humanoid")
        humanoid.Health = Value
        Library:Notify("血量已设置为: " .. Value, 3)
    end
})

-- 无敌模式
local godModeConnection
HomeRightGroup:AddToggle("GodMode", {
    Text = "无敌模式",
    Default = false,
    Callback = function(Value)
        local character = LP.Character
        if not character then
            character = LP.CharacterAdded:Wait()
        end
        local humanoid = character:WaitForChild("Humanoid")
        
        if Value then
            godModeConnection = humanoid.HealthChanged:Connect(function(newHealth)
                if newHealth < humanoid.MaxHealth then
                    humanoid.Health = humanoid.MaxHealth
                end
            end)
            humanoid.Health = humanoid.MaxHealth
            Library:Notify("无敌模式已开启", 3)
        else
            if godModeConnection then
                godModeConnection:Disconnect()
                godModeConnection = nil
            end
            Library:Notify("无敌模式已关闭", 3)
        end
    end
})

-- 穿墙模式
local noclipConn
HomeRightGroup:AddToggle("Noclip", {
    Text = "穿墙模式",
    Default = false,
    Callback = function(Value)
        local character = LP.Character or LP.CharacterAdded:Wait()
        if Value then
            noclipConn = RunService.Stepped:Connect(function()
                if character then
                    for _, v in pairs(character:GetChildren()) do
                        if v:IsA("BasePart") then
                            v.CanCollide = false
                        end
                    end
                end
            end)
        else
            if noclipConn then noclipConn:Disconnect() end
            if character then
                for _, v in pairs(character:GetChildren()) do
                    if v:IsA("BasePart") then
                        v.CanCollide = true
                    end
                end
            end
        end
    end
})

-- 服务器功能
HomeBottomGroup:AddButton({
    Text = "切换服务器",
    Func = function()
        local placeId = game.PlaceId
        TeleportService:Teleport(placeId, LP)
    end
})

HomeBottomGroup:AddButton({
    Text = "重新加入服务器",
    Func = function()
        local placeId = game.PlaceId
        local jobId = game.JobId
        TeleportService:TeleportToPlaceInstance(placeId, jobId, LP)
    end
})

HomeBottomGroup:AddButton({
    Text = "复制服务器ID",
    Func = function()
        setclipboard(game.JobId)
        Library:Notify("服务器ID已复制: " .. game.JobId, 3)
    end
})

-- 脚本中心 - 使用多个Groupbox组织
local ScriptLeftGroup = Tabs.ScriptCenter:AddLeftGroupbox("主要脚本")
local Script99Group = Tabs.ScriptCenter:AddLeftGroupbox("99夜脚本")
local ScriptDoorsGroup = Tabs.ScriptCenter:AddRightGroupbox("Doors脚本")
local ScriptPressureGroup = Tabs.ScriptCenter:AddLeftGroupbox("压力脚本")
local ScriptInkGameGroup = Tabs.ScriptCenter:AddRightGroupbox("InkGame")
local ScriptForsakenGroup = Tabs.ScriptCenter:AddLeftGroupbox("被遗弃脚本")
local ScriptDieOfDeathGroup = Tabs.ScriptCenter:AddRightGroupbox("死亡之死")
local ScriptPowerLegendsGroup = Tabs.ScriptCenter:AddLeftGroupbox("力量传奇")
local ScriptSpeedLegendsGroup = Tabs.ScriptCenter:AddRightGroupbox("极速传奇")
local ScriptNinjaLegendsGroup = Tabs.ScriptCenter:AddLeftGroupbox("忍者传奇")
local ScriptFLSCHGroup = Tabs.ScriptCenter:AddRightGroupbox("FLSCH")
local ScriptBFGroup = Tabs.ScriptCenter:AddLeftGroupbox("BF")
local ScriptDeadRailGroup = Tabs.ScriptCenter:AddRightGroupbox("死铁轨")
local ScriptBladeBallGroup = Tabs.ScriptCenter:AddLeftGroupbox("刀刃球")
local ScriptStealBrainrotGroup = Tabs.ScriptCenter:AddRightGroupbox("偷走脑红")
local ScriptGardenGroup = Tabs.ScriptCenter:AddLeftGroupbox("种植花园")
local ScriptChainGroup = Tabs.ScriptCenter:AddRightGroupbox("Chain")
local ScriptBattleGroup = Tabs.ScriptCenter:AddLeftGroupbox("最强战场")
local ScriptEvadeGroup = Tabs.ScriptCenter:AddRightGroupbox("Evade")
local ScriptNicoGroup = Tabs.ScriptCenter:AddLeftGroupbox("Nico Next Robot")
local ScriptPizzaGroup = Tabs.ScriptCenter:AddRightGroupbox("在披萨店工作")
local ScriptAUTGroup = Tabs.ScriptCenter:AddLeftGroupbox("AUT")

-- 主要脚本
ScriptLeftGroup:AddButton({
    Text = "加载EX自动翻译",
    Func = function()
         local isChineseSimplified = false
local success, result = pcall(function()
    local languageCode = game:GetService("LocalizationService").RobloxLocaleId
    return languageCode == "zh-cn" or languageCode == "zh-Hans" or languageCode:lower():find("zh") == 1
end)

if success and result then
    isChineseSimplified = true
else
    return
end

local WindUI = loadstring(game:HttpGet("https://github.com/Footagesus/WindUI/releases/latest/download/main.lua"))()

task.wait(2)

WindUI:Notify({
    Title = "EX",
    Content = "EX UI翻译已完成加载过程",
    Duration = 4
})

task.wait(0.5)

local player = game.Players.LocalPlayer
local HttpService = game:GetService("HttpService")
local RunService = game:GetService("RunService")
local CoreGui = game:GetService("CoreGui")
local TweenService = game:GetService("TweenService")
local playerGui = player.PlayerGui

local Window = WindUI:CreateWindow({
    Title = "Old Winter<font color='#00FF00'>Translation</font>",
    Icon = "rbxassetid://4483362748",
    IconTransparency = 1,
    Author = "EX UI翻译",
    Folder = "Translator",
    Size = UDim2.fromOffset(100, 150),
    Transparent = true,
    Theme = "Dark",
    UserEnabled = true,
    SideBarWidth = 200,
    HasOutline = true,
    User = {
        Enabled = true,
        Anonymous = false,
        Username = player.Name,
        DisplayName = player.DisplayName,
        UserId = player.UserId,
        Thumbnail = "https://www.roblox.com/headshot-thumbnail/image?userId=" .. player.UserId .. "&width=420&height=420&format=png",
        Callback = function()
            WindUI:Notify({
                Title = "用户信息",
                Content = "玩家: " .. player.Name,
                Duration = 3
            })
        end
    }
})

task.wait(0.3)

Window:EditOpenButton({
    Title = "Old Winter",
    Icon = "crown",
    CornerRadius = UDim.new(0,16),
    StrokeThickness = 2,
    Color = ColorSequence.new(
        Color3.fromHex("FF0000"), 
        Color3.fromHex("0000FF")
    ),
    Draggable = true,
})

task.wait(0.2)

local Tabs = {
    Main = Window:Section({ Title = "翻译", Opened = true }),
    Advanced = Window:Section({ Title = "检测", Opened = false })
}

local TabHandles = {
    Translator = Tabs.Main:Tab({ Title = "翻译", Icon = "languages" }),
    Detection = Tabs.Advanced:Tab({ Title = "UI检测", Icon = "search" })
}

TabHandles.Translator:Paragraph({
    Title = "EX UI翻译",
    Desc = "EX UI翻译",
    Image = "code",
    ImageSize = 20,
    Color = "White",
})

TabHandles.Translator:Divider()

local languageCodes = {
    ["自动检测"] = "auto",
    ["中文(简体)"] = "zh-CN",
    ["中文(繁体)"] = "zh-TW",
    ["英语"] = "en",
    ["日语"] = "ja",
    ["韩语"] = "ko",
    ["法语"] = "fr",
    ["德语"] = "de",
    ["西班牙语"] = "es",
    ["俄语"] = "ru",
    ["阿拉伯语"] = "ar",
    ["葡萄牙语"] = "pt",
    ["意大利语"] = "it",
    ["荷兰语"] = "nl",
    ["希腊语"] = "el",
    ["印地语"] = "hi",
    ["土耳其语"] = "tr",
    ["越南语"] = "vi",
    ["泰语"] = "th"
}

local languageList = {
    "自动检测",
    "中文(简体)",
    "中文(繁体)",
    "英语",
    "日语",
    "韩语",
    "法语",
    "德语",
    "西班牙语",
    "俄语",
    "阿拉伯语",
    "葡萄牙语",
    "意大利语",
    "荷兰语",
    "希腊语",
    "印地语",
    "土耳其语",
    "越南语",
    "泰语"
}

local translationCache = {}
local isTranslating = false
local lastTranslatedText = ""
local lastUsedAPI = "Google"

local YOUDAO_APP_ID = "015e4bc650d16a48"
local YOUDAO_APP_KEY = "wXwwoaeESXz9CzB3yeTDe54JuOzkVbH7"

local SUPPORTED_UI_TYPES = {
    "TextLabel", "TextButton", "TextBox", "TextLabel", 
    "Frame", "ScrollingFrame", "ImageButton", "ImageLabel"
}

local DANGEROUS_COMMANDS = {
    "neon", "shine", "ghost", "gold", "spin", 
    "bighead", "smallhead", "giantdwarf", "squash"
}

local LANGUAGE_PATTERNS = {
    ["zh-CN"] = {
        pattern = "[\199-\244][\128-\191]*[\128-\191]",
        exclude = "[\227][\128-\191][\128-\191]"
    },
    ["zh-TW"] = {
        pattern = "[\227][\128-\191][\128-\191]"
    },
    ["ja"] = {
        pattern = "[\123-\125]|[\199-\244][\128-\191]*[\128-\191]",
        exclude = "[\199-\244][\128-\191]*[\128-\191]"
    },
    ["ko"] = {
        pattern = "[\234-\235][\128-\191][\128-\191]|[\236-\237][\128-\191][\128-\191]"
    },
    ["ar"] = {
        pattern = "[\216-\219][\128-\191]"
    },
    ["ru"] = {
        pattern = "[\208-\209][\128-\191]"
    },
    ["th"] = {
        pattern = "[\224-\231][\128-\191]"
    },
    ["en"] = {
        pattern = "[A-Za-z]",
        exclude = "[\199-\244][\128-\191]*[\128-\191]"
    }
}

local TARGET_LANGUAGE = "zh-CN"
local SCAN_INTERVAL = 2
local MAX_TEXT_LENGTH = 5000

local translatedCache = {}
local translatedObjects = {}
local isTranslationEnabled = false
local connection = nil

local BATCH_SIZE = 20
local MAX_CACHE_SIZE = 3000
local lastScanTime = 0
local SCAN_COOLDOWN = 0.02
local TRANSLATION_DELAY = 0.01
local MAX_CONCURRENT_REQUESTS = 10

local function isDangerousText(text)
    if not text or type(text) ~= "string" then return false end
    local lowerText = text:lower()
    for _, cmd in ipairs(DANGEROUS_COMMANDS) do
        if lowerText:find(cmd) then
            return true
        end
    end
    return false
end

local function shouldSkipTranslation(text)
    if not text or text == "" or translatedCache[text] then
        return true
    end
    
    if text:match("^%s*$") or 
       text:match("^[0-9%.%s,:/]+$") or 
       #text > MAX_TEXT_LENGTH or
       isDangerousText(text) then
        translatedCache[text] = text
        return true
    end
    
    return false
end

local function detectLanguage(text)
    if not text or type(text) ~= "string" or text == "" then
        return "en"
    end
    
    if text:match(LANGUAGE_PATTERNS["zh-CN"].pattern) and 
       (not LANGUAGE_PATTERNS["zh-CN"].exclude or not text:match(LANGUAGE_PATTERNS["zh-CN"].exclude)) then
        return "zh-CN"
    end
    
    if text:match(LANGUAGE_PATTERNS["zh-TW"].pattern) then
        return "zh-TW"
    end
    
    if text:match(LANGUAGE_PATTERNS["ja"].pattern) and 
       (not LANGUAGE_PATTERNS["ja"].exclude or not text:match(LANGUAGE_PATTERNS["ja"].exclude)) then
        return "ja"
    end
    
    if text:match(LANGUAGE_PATTERNS["ko"].pattern) then
        return "ko"
    end
    
    if text:match(LANGUAGE_PATTERNS["ar"].pattern) then
        return "ar"
    end
    
    if text:match(LANGUAGE_PATTERNS["ru"].pattern) then
        return "ru"
    end
    
    if text:match(LANGUAGE_PATTERNS["th"].pattern) then
        return "th"
    end
    
    return "en"
end

local function googleTranslate(text, targetLang, sourceLang)
    if not text or text == "" then return text end
    
    sourceLang = sourceLang or "auto"
    
    local cacheKey = "google_"..text.."|"..sourceLang.."|"..targetLang
    if translationCache[cacheKey] then
        return translationCache[cacheKey]
    end
    
    local url = string.format(
        "https://translate.googleapis.com/translate_a/single?client=gtx&sl=%s&tl=%s&dt=t&q=%s",
        sourceLang, targetLang, HttpService:UrlEncode(text)
    )
    
    local success, response = pcall(function()
        return game:HttpGet(url, true)
    end)
    
    if success and response then
        local success2, data = pcall(function()
            return HttpService:JSONDecode(response)
        end)
        
        if success2 and data and data[1] then
            local result = ""
            for i, segment in ipairs(data[1]) do
                if segment[1] then
                    result = result .. segment[1]
                end
            end
            
            if result ~= "" and result ~= text then
                translationCache[cacheKey] = result
                lastUsedAPI = "Google"
                return result
            end
        end
    end
    
    return nil
end

local function youdaoTranslate(text, targetLang, sourceLang)
    if not text or text == "" then return text end
    
    sourceLang = sourceLang or "auto"
    
    local cacheKey = "youdao_"..text.."|"..sourceLang.."|"..targetLang
    if translationCache[cacheKey] then
        return translationCache[cacheKey]
    end
    
    local salt = tostring(tick())
    local input = text
    if #input > 20 then
        input = input:sub(1, 10) .. #input .. input:sub(-10)
    end
    
    local signStr = YOUDAO_APP_ID .. input .. salt .. YOUDAO_APP_KEY
    local sign = game:GetService("HashService"):ComputeMD5Async(signStr)
    
    local url = string.format(
        "https://openapi.youdao.com/api?q=%s&from=%s&to=%s&appKey=%s&salt=%s&sign=%s",
        HttpService:UrlEncode(text),
        sourceLang == "auto" and "auto" or sourceLang,
        targetLang,
        YOUDAO_APP_ID,
        salt,
        sign
    )
    
    local success, response = pcall(function()
        return game:HttpGet(url, true)
    end)
    
    if success and response then
        local success2, data = pcall(function()
            return HttpService:JSONDecode(response)
        end)
        
        if success2 and data and data.translation and data.translation[1] then
            local result = data.translation[1]
            
            if result ~= "" and result ~= text then
                translationCache[cacheKey] = result
                lastUsedAPI = "Youdao"
                return result
            end
        end
    end
    
    return nil
end

local function translateText(text, targetLang, sourceLang)
    if not text or text == "" or text:match("^%s*$") then
        return text
    end
    
    if text:match("^[%d%p%s]+$") then
        return text
    end
    
    local detectedLang = detectLanguage(text)
    
    if detectedLang == "zh-CN" or detectedLang == "zh-TW" then
        return text
    end
    
    local result = googleTranslate(text, targetLang, sourceLang)
    if not result or result == text then
        result = youdaoTranslate(text, targetLang, sourceLang)
    end
    return result or text
end

local targetLang = "zh-CN"
local sourceLang = "auto"

local sourceLangDropdown = TabHandles.Translator:Dropdown({
    Title = "被翻译语言",
    Values = languageList,
    Value = "自动检测",
    Callback = function(option)
        sourceLang = languageCodes[option] or "auto"
        WindUI:Notify({
            Title = "被翻译语言设置",
            Content = "已选择: " .. option,
            Duration = 2
        })
    end
})

local targetLangDropdown = TabHandles.Translator:Dropdown({
    Title = "翻译语言",
    Values = languageList,
    Value = "中文(简体)",
    Callback = function(option)
        if option ~= "自动检测" then
            targetLang = languageCodes[option] or "zh-CN"
            WindUI:Notify({
                Title = "翻译语言设置",
                Content = "已选择: " .. option,
                Duration = 2
            })
        else
            WindUI:Notify({
                Title = "错误",
                Content = "翻译语言不能选择自动检测",
                Duration = 2
            })
        end
    end
})

local currentMode = 2
local modes = {
    {"快速模式", "置于极速之前"},
    {"标准模式", "上下文翻译"},
    {"基本全翻译模式", "完整翻译"},
    {"极速模式", "速度翻译"}
}

local modeDropdown = TabHandles.Translator:Dropdown({
    Title = "翻译模式",
    Values = {"快速模式", "标准模式", "基本全翻译模式", "极速模式"},
    Value = "自匹配模式",
    Callback = function(option)
        currentMode = table.find({"快速模式", "标准模式", "基本全翻译模式", "极速模式"}, option) or 2
        
        if option == "极速模式" then
            BATCH_SIZE = 50
            SCAN_COOLDOWN = 0.005
            TRANSLATION_DELAY = 0.002
            MAX_CONCURRENT_REQUESTS = 25
        elseif option == "快速模式" then
            BATCH_SIZE = 30
            SCAN_COOLDOWN = 0.01
            TRANSLATION_DELAY = 0.005
            MAX_CONCURRENT_REQUESTS = 15
        elseif option == "标配模式" then
            BATCH_SIZE = 20
            SCAN_COOLDOWN = 0.02
            TRANSLATION_DELAY = 0.01
            MAX_CONCURRENT_REQUESTS = 10
        elseif option == "全翻译模式" then
            BATCH_SIZE = 10
            SCAN_COOLDOWN = 0.05
            TRANSLATION_DELAY = 0.02
            MAX_CONCURRENT_REQUESTS = 5
        end
        
        WindUI:Notify({
            Title = "模式切换",
            Content = modes[currentMode][2],
            Duration = 2
        })
    end
})

local cacheEnabled = true
TabHandles.Translator:Toggle({
    Title = "启用缓存",
    Desc = "提高翻译效率",
    Value = true,
    Callback = function(state)
        cacheEnabled = state
        if not cacheEnabled then
            translationCache = {}
        end
    end
})

TabHandles.Translator:Divider()

local function hasTextContent(gui)
    if gui:IsA("TextLabel") or gui:IsA("TextButton") or gui:IsA("TextBox") then
        return gui.Text and gui.Text ~= ""
    elseif gui:IsA("ImageButton") or gui:IsA("ImageLabel") then
        return gui:GetAttribute("Text") or gui.Name ~= ""
    end
    return false
end

local function getTextContent(gui)
    if gui:IsA("TextLabel") or gui:IsA("TextButton") or gui:IsA("TextBox") then
        return gui.Text
    elseif gui:IsA("ImageButton") or gui:IsA("ImageLabel") then
        return gui:GetAttribute("Text") or gui.Name
    end
    return nil
end

local function setTextContent(gui, text)
    if gui:IsA("TextLabel") or gui:IsA("TextButton") or gui:IsA("TextBox") then
        gui.Text = text
    elseif gui:IsA("ImageButton") or gui:IsA("ImageLabel") then
        gui:SetAttribute("OriginalText", getTextContent(gui))
        gui:SetAttribute("Text", text)
    end
end

local function parallelTranslateBatch(batch)
    local results = {}
    local completed = 0
    local total = #batch
    local activeRequests = 0
    
    local function processItem(item, index)
        if not translatedCache[item.text] then
            activeRequests = activeRequests + 1
            
            local success, translated = pcall(function()
                return translateText(item.text, targetLang, sourceLang)
            end)
            
            if success and translated and translated ~= item.text then
                results[item.gui] = translated
                translatedCache[item.text] = translated
                lastTranslatedText = item.text .. " → " .. translated
                lastUsedAPI = "Google"
            else
                translatedCache[item.text] = item.text
            end
            
            activeRequests = activeRequests - 1
        end
        completed = completed + 1
    end
    
    for i, item in ipairs(batch) do
        while activeRequests >= MAX_CONCURRENT_REQUESTS do
            task.wait()
        end
        
        task.spawn(processItem, item, i)
        
        if i % 5 == 0 then
            task.wait(0.001)
        end
    end
    
    while completed < total do
        task.wait()
    end
    
    return results, total
end

local function fastCollectElements()
    local elementsToTranslate = {}
    local guisToScan = {playerGui, CoreGui}
    
    for _, gui in ipairs(guisToScan) do
        if gui and gui:IsDescendantOf(game) then
            local descendants = gui:GetDescendants()
            for i = 1, #descendants do
                local guiObj = descendants[i]
                if not translatedObjects[guiObj] and table.find(SUPPORTED_UI_TYPES, guiObj.ClassName) then
                    local text = getTextContent(guiObj)
                    if text and text ~= "" and not shouldSkipTranslation(text) then
                        table.insert(elementsToTranslate, {
                            gui = guiObj,
                            text = text
                        })
                        translatedObjects[guiObj] = true
                    end
                end
            end
        end
    end
    
    return elementsToTranslate
end

local function ultraFastTranslateGuiElements()
    local count = 0
    local currentTime = tick()
    
    if currentTime - lastScanTime < SCAN_COOLDOWN then
        return count
    end
    lastScanTime = currentTime
    
    local elementsToTranslate = fastCollectElements()
    
    if #elementsToTranslate > 0 then
        for i = 1, #elementsToTranslate, BATCH_SIZE do
            local batch = {}
            local batchEnd = math.min(i + BATCH_SIZE - 1, #elementsToTranslate)
            
            for j = i, batchEnd do
                table.insert(batch, elementsToTranslate[j])
            end
            
            local batchResults, batchCount = parallelTranslateBatch(batch)
            count = count + batchCount
            
            for gui, translated in pairs(batchResults) do
                if gui and gui.Parent then
                    setTextContent(gui, translated)
                end
            end
            
            if batchCount > 0 then
                task.wait(TRANSLATION_DELAY)
            end
        end
        
        if count > 0 and TabHandles.Translator then
            for _, paragraph in pairs(TabHandles.Translator.Paragraphs or {}) do
                if paragraph.Title == "最近翻译" then
                    paragraph:SetDesc(lastTranslatedText .. " (via " .. lastUsedAPI .. ")")
                    break
                end
            end
        end
    end
    
    if table.count(translatedCache) > MAX_CACHE_SIZE then
        local newCache = {}
        local i = 0
        for k, v in pairs(translatedCache) do
            if i < MAX_CACHE_SIZE / 2 then
                newCache[k] = v
                i = i + 1
            else
                break
            end
        end
        translatedCache = newCache
    end
    
    return count
end

local function deepScanUI()
    local guisToScan = {
        player.PlayerGui,
        CoreGui
    }
    
    for _, service in ipairs({
        game:GetService("StarterGui"),
        game:GetService("CoreGui"),
        game:GetService("Players").LocalPlayer.PlayerGui
    }) do
        table.insert(guisToScan, service)
    end
    
    return guisToScan
end

local translateButtonRef
translateButtonRef = TabHandles.Translator:Button({
    Title = "执行翻译",
    Icon = "play",
    Variant = "Primary",
    Callback = function()
        if isTranslating then
            isTranslating = false
            if translateButtonRef then
                translateButtonRef:SetTitle("执行翻译")
            end
            WindUI:Notify({
                Title = "翻译",
                Content = "翻译已停止",
                Icon = "stop-circle",
                Duration = 2
            })
            return
        end
        
        isTranslating = true
        if translateButtonRef then
            translateButtonRef:SetTitle("停止翻译")
        end
        WindUI:Notify({
            Title = "翻译",
            Content = "极速翻译已启动",
            Icon = "zap",
            Duration = 2
        })
        
        task.spawn(function()
            local startTime = tick()
            local totalTranslated = 0
            
            while isTranslating and tick() - startTime < 5 do
                local count = ultraFastTranslateGuiElements()
                totalTranslated = totalTranslated + count
                
                local elapsed = tick() - startTime
                if elapsed > 3 and count == 0 then
                    break
                end
                
                task.wait(0.03)
            end
            
            if isTranslating then
                isTranslating = false
                if translateButtonRef then
                    translateButtonRef:SetTitle("执行翻译")
                end
                
                WindUI:Notify({
                    Title = "翻译完成",
                    Content = string.format("5秒内翻译了 %d 个元素", totalTranslated),
                    Icon = "check-circle",
                    Duration = 3
                })
            end
        end)
    end
})

local speedSlider = TabHandles.Translator:Slider({
    Title = "翻译速度",
    Desc = "调整翻译速度",
    Value = { Min = 1, Max = 10, Default = 5 },
    Callback = function(value)
        if currentMode ~= 4 then
            BATCH_SIZE = 20 + value * 5
            SCAN_COOLDOWN = 0.01 - (value * 0.001)
            MAX_CONCURRENT_REQUESTS = 10 + value * 2
            
            WindUI:Notify({
                Title = "速度",
                Content = string.format("速度: %d, 批量: %d, 并发: %d", value, BATCH_SIZE, MAX_CONCURRENT_REQUESTS),
                Duration = 1
            })
        else
            WindUI:Notify({
                Title = "提示",
                Content = "极速模式下调整速度参数无用",
                Duration = 2
            })
        end
    end
})

TabHandles.Translator:Divider()

local lastTranslation = TabHandles.Translator:Paragraph({
    Title = "最近翻译",
    Desc = "无",
    Image = "clock",
    ImageSize = 20,
    Color = "Grey"
})

TabHandles.Translator:Button({
    Title = "清理缓存",
    Icon = "trash",
    Callback = function()
        translationCache = {}
        translatedCache = {}
        translatedObjects = {}
        WindUI:Notify({
            Title = "缓存已清理完毕",
            Content = "翻译缓存已清空",
            Duration = 2
        })
    end
})

TabHandles.Translator:Button({
    Title = "刷新",
    Icon = "refresh-cw",
    Callback = function()
        for k in pairs(translatedCache) do
            translatedCache[k] = nil
        end
        
        WindUI:Notify({
            Title = "强制刷新",
            Content = "已清除翻译缓存，下次扫描将重新翻译",
            Duration = 2
        })
    end
})

TabHandles.Detection:Paragraph({
    Title = "UI检测",
    Desc = "检测所有UI",
    Image = "search",
    ImageSize = 20,
    Color = "White"
})

local gameInfo = game:GetService("MarketplaceService"):GetProductInfo(game.PlaceId)
TabHandles.Detection:Paragraph({
    Title = "游戏信息",
    Desc = gameInfo.Name,
    Image = "info",
    ImageSize = 20,
    Color = "Grey"
})

TabHandles.Detection:Button({
    Title = "检测UI",
    Icon = "search",
    Callback = function()
        local uiCount = 0
        local textCount = 0
        
        local guisToScan = deepScanUI()
        for _, gui in ipairs(guisToScan) do
            pcall(function()
                for _, child in ipairs(gui:GetDescendants()) do
                    if table.find(SUPPORTED_UI_TYPES, child.ClassName) then
                        uiCount = uiCount + 1
                        if hasTextContent(child) then
                            textCount = textCount + 1
                        end
                    end
                end
            end)
        end
        
        WindUI:Notify({
            Title = "UI检测结果",
            Content = string.format("发现 %d 个UI元素，%d 个有文本内容", uiCount, textCount),
            Duration = 5
        })
    end
})

Window:OnClose(function()
    isTranslating = false
end)

Window:OnDestroy(function()
    isTranslating = false
end)

task.spawn(function()
    local commonTexts = {
        "Play", "Start", "Settings", "Options", "Exit", "Continue",
        "Back", "Next", "Yes", "No", "OK", "Cancel", "Loading"
    }
    
    for _, text in ipairs(commonTexts) do
        pcall(function()
            translateText(text, targetLang, "en")
        end)
    end
end)

local function cleanupMemory()
    collectgarbage("collect")
    
    if table and table.count and table.count(translatedCache) > MAX_CACHE_SIZE then
        local newCache = {}
        local i = 0
        for k, v in pairs(translatedCache) do
            if i < MAX_CACHE_SIZE / 2 then
                newCache[k] = v
                i = i + 1
            else
                break
            end
        end
        translatedCache = newCache
    end
    
    task.wait(5)
end

task.spawn(function()
    while true do
        cleanupMemory()
        task.wait(30)
    end
end)

task.wait(1)
WindUI:Notify({
    Title = "Old Winter 已加载完毕",
    Content = "Old Winter UI汉化",
    Icon = "check-circle",
    Duration = 3
})
        Library:Notify("Old Winter自动翻译已加载", 3)
    end
})

ScriptLeftGroup:AddButton({
    Text = "Old Winter DOORS",
    Func = function()
        local repo = "https://raw.githubusercontent.com/deividcomsono/Obsidian/main/"
local Library = loadstring(game:HttpGet(repo .. "Library.lua"))()
local Options = Library.Options
local Toggles = Library.Toggles
Library.ForceCheckbox = false
Library.ShowToggleFrameInKeybinds = true
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local GameData = ReplicatedStorage:WaitForChild("GameData")
local currentFloor = GameData:WaitForChild("Floor").Value
local Window = Library:CreateWindow({
    Title = "Old Winter DOORS",
    Footer = "XiaoXu |  Old Winter  | Floor: " .. currentFloor,
    Icon = "rbxassetid://132702574859512", 
    NotifySide = "Right",
    ShowCustomCursor = true,
})

local Tabs = {
    Home = Window:AddTab("主页", "house"),
    Player = Window:AddTab("玩家", "user"),
    Visuals = Window:AddTab("视觉", "eye"),
    Entities = Window:AddTab("功能", "shield"),
    Misc = Window:AddTab("其他", "box"),
    UISettings = Window:AddTab("UI设置", "user-round-cog"),
}

local HomeGroup = Tabs.Home:AddLeftGroupbox("欢迎")

local avatarImage = Instance.new("ImageLabel")
avatarImage.Name = "AvatarThumbnail"
avatarImage.Size = UDim2.new(0, 220, 0, 220)
avatarImage.Position = UDim2.new(0.5, -90, 0, 10)
avatarImage.Image = "rbxassetid://0"
avatarImage.BackgroundTransparency = 1
avatarImage.BorderSizePixel = 0
avatarImage.ScaleType = Enum.ScaleType.Fit

if HomeGroup.Container then
    avatarImage.Parent = HomeGroup.Container
elseif HomeGroup.Frame then
    avatarImage.Parent = HomeGroup.Frame
else
    avatarImage.Parent = HomeGroup
end

spawn(function()
    local Players = game:GetService("Players")
    local player = Players.LocalPlayer
    
    if not player then
        repeat 
            task.wait(0.1) 
            player = Players.LocalPlayer
        until player
    end
    
    task.wait(1)
    
    local success, thumbnail = pcall(function()
        return Players:GetUserThumbnailAsync(
            player.UserId, 
            Enum.ThumbnailType.HeadShot,
            Enum.ThumbnailSize.Size180x180
        )
    end)
    
    if success and thumbnail then
        avatarImage.Image = thumbnail
    else
        local alternatives = {
            Enum.ThumbnailType.AvatarThumbnail,
            Enum.ThumbnailType.AvatarBust,
            Enum.ThumbnailType.Avatar
        }
        
        for i, thumbnailType in ipairs(alternatives) do
            local altSuccess, altThumbnail = pcall(function()
                return Players:GetUserThumbnailAsync(
                    player.UserId, 
                    thumbnailType,
                    Enum.ThumbnailSize.Size180x180
                )
            end)
            
            if altSuccess and altThumbnail then
                avatarImage.Image = altThumbnail
                break
            end
        end
    end
end)

HomeGroup:AddButton("加入QQ群", function()
    setclipboard("https://qm.qq.com/q/hLPf9PjE6Q")
    Library:Notify("链接已复制")
end)

local IntroductionGroup = Tabs.Home:AddRightGroupbox("介绍")
IntroductionGroup:AddLabel("欢迎")
IntroductionGroup:AddLabel("EX dev doors")

local ChangelogsGroup = Tabs.Home:AddRightGroupbox("公告")
ChangelogsGroup:AddLabel('<font color="rgb(0,255,0)"> Old Winter</font>')

-- Global Variables
local LocalPlayer = game.Players.LocalPlayer
local Rooms = workspace.CurrentRooms
local Unloaded = false
local ClonedCollision
local OldAccel = LocalPlayer.Character.HumanoidRootPart.CustomPhysicalProperties

-- 性能优化的ESP表结构
local EspTable = {
    Interactables = {
        GoldPiles = {},
        DoorKeys = {},
        GeneratorFuses = {},
        Generators = {},
        GateLevers = {},
        BackroomsLevers = {},
        LibraryBooks = {},
        BreakerPoles = {},
        Anchors = {},
        MiscPickups = {},
        Closets = {}
    },
    Entities = {},
    Players = {}
}

local MiscPickups = {
    ["Glowsticks"] = "荧光棒",
    ["StarJug"] = "星光桶",
    ["Lockpick"] = "开锁器",
    ["Bandage"] = "绷带",
    ["StarVial"] = "一小瓶星光",
    ["SkeletonKey"] = "Skeleton Key",
    ["Crucifix"] = "十字架",
    ["CrucifixWall"] = "十字架",
    ["Flashlight"] = "手电筒",
    ["Candle"] = "蜡烛",
    ["Straplight"] = "肩灯",
    ["Vitamins"] = "维他命",
    ["Lighter"] = "打火机",
    ["Shears"] = "剪刀",
    ["BatteryPack"] = "电池包",
    ["BandagePack"] = "绷带包",
    ["LaserPointer"] = "激光指示器",
    ["Bulklight"] = "Bulklight",
    ["Battery"] = "电池",
    ["Candy"] = "糖果",
    ["OutdoorsKey"] = "key"
}

-- Anti Connections table to manage disconnects
local AntiConnections = {}

-- Lighting originals for fullbright
local oldBrightness = game.Lighting.Brightness
local oldClockTime = game.Lighting.ClockTime
local oldFogEnd = game.Lighting.FogEnd
local oldGlobalShadows = game.Lighting.GlobalShadows
local oldAmbient = game.Lighting.Ambient

-- 性能优化的门ESP系统
_G.EspDoor = false
_G.EspHighlight = true
_G.EspGui = true
_G.EspKey = false  -- 统一的任务物品ESP开关
_G.KeyAdd = {}     -- 存储任务物品的表

local Players = game:GetService("Players")
local Workspace = game:GetService("Workspace")
local RunService = game:GetService("RunService")
local player = Players.LocalPlayer
local hrp = nil

local doorESPs = {}
local currentRoom, nextRoom = nil, nil
local DoorColor = Color3.fromRGB(150, 200, 255)

-- 性能监控变量
local PerformanceMonitor = {
    LastFPS = 60,
    ESPCount = 0,
    LastCleanup = tick(),
    LastScan = tick(),
    ScanCooldown = 0.5
}

local doorESPs = {}
local currentRoom = 0
local nextRoom = 0
local hrp = nil
local player = game.Players.LocalPlayer
local RunService = game:GetService("RunService")
local Workspace = game:GetService("Workspace")

-- 淡蓝色定义
local DoorColor = Color3.fromRGB(173, 216, 230)

local function Distance(position)
    local player = game.Players.LocalPlayer
    if player and player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
        return (player.Character.HumanoidRootPart.Position - position).Magnitude
    end
    return 0
end

local function findDoorPart(model)
    -- 更精确的门部件查找
    if model:FindFirstChild("Door") and model.Door:FindFirstChild("Door") then
        return model.Door.Door
    end
    for _, p in ipairs(model:GetDescendants()) do
        if p:IsA("BasePart") and (p.Name:lower():find("door") or p.Name:lower():find("doormain")) then
            return p
        end
    end
    return model.PrimaryPart or model:FindFirstChildWhichIsA("BasePart")
end

local function getDoorNumber(door)
    -- 从门牌号获取房间号 - 修复版本
    if door:FindFirstChild("Door") then
        local doorObj = door.Door
        if doorObj:FindFirstChild("Sign") then
            local sign = doorObj.Sign
            if sign:FindFirstChild("Stinker") and sign.Stinker.Text then
                local n = sign.Stinker.Text:match("%d+")
                if n then return tonumber(n) end
            elseif sign:FindFirstChild("SignText") and sign.SignText.Text then
                local n = sign.SignText.Text:match("%d+")
                if n then return tonumber(n) end
            end
        end
    end
    -- 如果从门牌号无法获取，尝试从房间名称获取
    local roomNum = door.Name:match("%d+")
    return roomNum and tonumber(roomNum)
end

local function getDoorSignText(door)
    -- 获取门牌号文本
    if door:FindFirstChild("Door") then
        local doorObj = door.Door
        if doorObj:FindFirstChild("Sign") then
            local sign = doorObj.Sign
            if sign:FindFirstChild("Stinker") and sign.Stinker.Text then
                return sign.Stinker.Text
            elseif sign:FindFirstChild("SignText") and sign.SignText.Text then
                return sign.SignText.Text
            end
        end
    end
    return ""
end

local function createDoorESP(door)
    if doorESPs[door] then return end
    
    local num = getDoorNumber(door)
    if not num then return end
    
    local part = findDoorPart(door)
    if not part then return end
    
    local espData = {}
    
    if _G.EspHighlight then
        local hl = Instance.new("Highlight")
        hl.FillColor = DoorColor
        hl.OutlineColor = DoorColor
        hl.FillTransparency = 0.5
        hl.OutlineTransparency = 0
        hl.Adornee = part
        hl.Parent = door
        hl.Name = "Esp_Highlight"
        espData.highlight = hl
    end
    
    if _G.EspGui then
        local bill = Instance.new("BillboardGui")
        bill.Adornee = part
        bill.Name = "Esp_Gui"
        bill.Size = UDim2.new(0, 200, 0, 120)  -- 增加宽度以容纳更多文本
        bill.AlwaysOnTop = true
        bill.ExtentsOffset = Vector3.new(0, 3, 0)  -- 向上偏移避免遮挡
        bill.Parent = door
        
        local txt = Instance.new("TextLabel")
        txt.BackgroundTransparency = 1
        txt.Font = Enum.Font.Code
        txt.Size = UDim2.new(1, 0, 1, 0)
        txt.TextSize = _G.EspGuiTextSize or 15
        txt.TextColor3 = DoorColor
        txt.TextStrokeTransparency = 0.5
        txt.Text = ""
        txt.TextWrapped = true  -- 文本自动换行
        txt.TextXAlignment = Enum.TextXAlignment.Center
        txt.TextYAlignment = Enum.TextYAlignment.Center
        txt.Parent = bill
        
        local UIStroke = Instance.new("UIStroke")
        UIStroke.Color = Color3.new(0, 0, 0)
        UIStroke.Thickness = 1.5
        UIStroke.Parent = txt
        
        espData.gui = txt
        espData.billboard = bill
    end
    
    -- 修改：使用ScreenGui显示门牌号
    if _G.EspDoorNumber then
        local screenGui = Instance.new("ScreenGui")
        screenGui.Name = "Esp_DoorNumber"
        screenGui.Parent = game.CoreGui  -- 或者 game.Players.LocalPlayer.PlayerGui
        
        local frame = Instance.new("Frame")
        frame.Size = UDim2.new(0, 150, 0, 40)
        frame.Position = UDim2.new(0.5, -75, 0.1, 0)  -- 屏幕顶部居中
        frame.BackgroundColor3 = Color3.new(0, 0, 0)
        frame.BackgroundTransparency = 0.3
        frame.BorderSizePixel = 0
        frame.Parent = screenGui
        
        local corner = Instance.new("UICorner")
        corner.CornerRadius = UDim.new(0, 8)
        corner.Parent = frame
        
        local doorNumberText = Instance.new("TextLabel")
        doorNumberText.Size = UDim2.new(1, 0, 1, 0)
        doorNumberText.BackgroundTransparency = 1
        doorNumberText.Font = Enum.Font.GothamBold
        doorNumberText.TextSize = 18
        doorNumberText.TextColor3 = Color3.fromRGB(0, 255, 0)  -- 绿色文字
        doorNumberText.TextStrokeTransparency = 0.3
        doorNumberText.Text = "门牌: " .. getDoorSignText(door)
        doorNumberText.TextXAlignment = Enum.TextXAlignment.Center
        doorNumberText.TextYAlignment = Enum.TextYAlignment.Center
        doorNumberText.Parent = frame
        
        local numberStroke = Instance.new("UIStroke")
        numberStroke.Color = Color3.new(0, 0, 0)
        numberStroke.Thickness = 1.2
        numberStroke.Parent = doorNumberText
        
        espData.doorNumberGui = screenGui
        espData.doorNumberFrame = frame
        espData.doorNumberText = doorNumberText
    end
    
    doorESPs[door] = espData
    espData.roomNumber = num
end

local function clearAllDoorESPs()
    for door, espData in pairs(doorESPs) do
        if espData.highlight then
            espData.highlight:Destroy()
        end
        if espData.billboard then
            espData.billboard:Destroy()
        end
        if espData.doorNumberGui then
            espData.doorNumberGui:Destroy()
        end
    end
    doorESPs = {}
end

local function clearOldESPs(roomNum)
    for door, espData in pairs(doorESPs) do
        if espData.roomNumber and espData.roomNumber < roomNum - 1 then
            if espData.highlight then
                espData.highlight:Destroy()
            end
            if espData.billboard then
                espData.billboard:Destroy()
            end
            if espData.doorNumberGui then
                espData.doorNumberGui:Destroy()
            end
            doorESPs[door] = nil
        end
    end
end

local function updateDoorSet()
    if not hrp then return end
    
    local nearest, nearestDist = nil, math.huge
    local currentRooms = Workspace:FindFirstChild("CurrentRooms")
    
    if not currentRooms then return end
    
    for _, room in pairs(currentRooms:GetChildren()) do
        if room:IsA("Model") and room:FindFirstChild("Door") and room.Door:FindFirstChild("Door") then
            local part = findDoorPart(room)
            local num = getDoorNumber(room)
            if part and num then
                local dist = (part.Position - hrp.Position).Magnitude
                if dist < nearestDist then
                    nearest, nearestDist = room, dist
                end
            end
        end
    end
    
    if not nearest then return end
    
    local num = getDoorNumber(nearest)
    if num and num ~= currentRoom then
        currentRoom = num
        nextRoom = num + 1
        clearOldESPs(currentRoom)
        
        -- 更新ScreenGui显示当前门牌号
        for _, espData in pairs(doorESPs) do
            if espData.doorNumberText and espData.roomNumber == currentRoom then
                espData.doorNumberText.Text = "当前门牌: " .. getDoorSignText(nearest)
            end
        end
    end
end

-- 性能优化的门ESP主循环
local lastDoorUpdate = 0
RunService.RenderStepped:Connect(function()
    if not _G.EspDoor then
        if next(doorESPs) ~= nil then
            clearAllDoorESPs()
        end
        return
    end
    
    if not player.Character or not player.Character:FindFirstChild("HumanoidRootPart") then 
        hrp = nil
        return 
    end
    
    hrp = player.Character.HumanoidRootPart
    
    local currentTime = tick()
    if currentTime - lastDoorUpdate < 0.3 then return end
    lastDoorUpdate = currentTime
    
    updateDoorSet()
    
    local currentRooms = Workspace:FindFirstChild("CurrentRooms")
    if not currentRooms then return end
    
    -- 只在CurrentRooms中处理门ESP
    for _, room in pairs(currentRooms:GetChildren()) do
        if room:IsA("Model") and room:FindFirstChild("Door") and room.Door:FindFirstChild("Door") then
            local num = getDoorNumber(room)
            if num and (num == currentRoom or num == nextRoom) then
                createDoorESP(room)
                local esp = doorESPs[room]
                local part = findDoorPart(room)
                if esp and part then
                    local dist = (part.Position - hrp.Position).Magnitude
                    
                    -- 构建门文本信息
                    local doorText = ""
                    if _G.EspName then
                        local signText = getDoorSignText(room)
                        doorText = "门 " .. signText:gsub("^0+", "") .. (room.Door:FindFirstChild("Lock") and " (锁住)" or "")
                    end
                    
                    local distanceText = ""
                    if _G.EspDistance then
                        distanceText = "\n距离: " .. string.format("%.0f", dist) .. "m"
                    end
                    
                    local roomInfoText = ""
                    if _G.EspRoomInfo then
                        roomInfoText = "\n房间: " .. num
                    end
                    
                    -- 更新主GUI文本
                    if esp.gui then
                        esp.gui.Text = doorText .. distanceText .. roomInfoText
                        esp.gui.TextSize = _G.EspGuiTextSize or 15
                        esp.gui.TextColor3 = DoorColor
                    end
                    
                    -- 更新门牌号显示
                    if esp.doorNumberText then
                        esp.doorNumberText.Text = "门牌: " .. getDoorSignText(room)
                        esp.doorNumberText.TextColor3 = Color3.fromRGB(0, 255, 0)  -- 绿色文字
                    end
                    
                    -- 动态更新门牌号显示状态
                    if _G.EspDoorNumber and not esp.doorNumberGui then
                        -- 创建门牌号显示
                        local screenGui = Instance.new("ScreenGui")
                        screenGui.Name = "Esp_DoorNumber"
                        screenGui.Parent = game.CoreGui
                        
                        local frame = Instance.new("Frame")
                        frame.Size = UDim2.new(0, 150, 0, 40)
                        frame.Position = UDim2.new(0.5, -75, 0.1, 0)
                        frame.BackgroundColor3 = Color3.new(0, 0, 0)
                        frame.BackgroundTransparency = 0.3
                        frame.BorderSizePixel = 0
                        frame.Parent = screenGui
                        
                        local corner = Instance.new("UICorner")
                        corner.CornerRadius = UDim.new(0, 8)
                        corner.Parent = frame
                        
                        local doorNumberText = Instance.new("TextLabel")
                        doorNumberText.Size = UDim2.new(1, 0, 1, 0)
                        doorNumberText.BackgroundTransparency = 1
                        doorNumberText.Font = Enum.Font.GothamBold
                        doorNumberText.TextSize = 18
                        doorNumberText.TextColor3 = Color3.fromRGB(0, 255, 0)  -- 绿色文字
                        doorNumberText.TextStrokeTransparency = 0.3
                        doorNumberText.Text = "门牌: " .. getDoorSignText(room)
                        doorNumberText.TextXAlignment = Enum.TextXAlignment.Center
                        doorNumberText.TextYAlignment = Enum.TextYAlignment.Center
                        doorNumberText.Parent = frame
                        
                        local numberStroke = Instance.new("UIStroke")
                        numberStroke.Color = Color3.new(0, 0, 0)
                        numberStroke.Thickness = 1.2
                        numberStroke.Parent = doorNumberText
                        
                        esp.doorNumberGui = screenGui
                        esp.doorNumberFrame = frame
                        esp.doorNumberText = doorNumberText
                    elseif not _G.EspDoorNumber and esp.doorNumberGui then
                        -- 销毁门牌号显示
                        esp.doorNumberGui:Destroy()
                        esp.doorNumberGui = nil
                        esp.doorNumberFrame = nil
                        esp.doorNumberText = nil
                    end
                end
            else
                -- 清理不在当前房间或下一个房间的门ESP
                local esp = doorESPs[room]
                if esp then
                    if esp.highlight then
                        esp.highlight:Destroy()
                    end
                    if esp.billboard then
                        esp.billboard:Destroy()
                    end
                    if esp.doorNumberGui then
                        esp.doorNumberGui:Destroy()
                    end
                    doorESPs[room] = nil
                end
            end
        end
    end
end)

-- 当EspDoor关闭时的清理
if _G.EspDoor == false then
    clearAllDoorESPs()
    -- 同时清理参考脚本方式的ESP对象
    local currentRooms = Workspace:FindFirstChild("CurrentRooms")
    if currentRooms then
        for _, room in pairs(currentRooms:GetChildren()) do
            if room:IsA("Model") then
                for _, child in pairs(room:GetChildren()) do
                    if child.Name:find("Esp_") then
                        child:Destroy()
                    end
                end
            end
        end
    end
end

-- 添加统一的任务物品ESP系统
local KeySpawn, KeyRemove = nil, nil

local function Keys(v)
    if ((v.Name:find("Key") or v.Name:find("FuseObtain")) and v:FindFirstChild("Hitbox")) or (v.Name == "LeverForGate" and v.PrimaryPart) then
        -- 更新高亮颜色为绿色
        if v:FindFirstChild("Esp_Highlight") then
            v:FindFirstChild("Esp_Highlight").FillColor = Color3.fromRGB(0, 255, 0)  -- 绿色
            v:FindFirstChild("Esp_Highlight").OutlineColor = Color3.fromRGB(0, 255, 0)  -- 绿色
        end
        
        if _G.EspHighlight == true and v:FindFirstChild("Esp_Highlight") == nil then
            local Highlight = Instance.new("Highlight")
            Highlight.Name = "Esp_Highlight"
            Highlight.FillColor = Color3.fromRGB(0, 255, 0)  -- 绿色
            Highlight.OutlineColor = Color3.fromRGB(0, 255, 0)  -- 绿色
            Highlight.FillTransparency = 0.5
            Highlight.OutlineTransparency = 0
            Highlight.Adornee = v
            Highlight.Parent = v
        elseif _G.EspHighlight == false and v:FindFirstChild("Esp_Highlight") then
            v:FindFirstChild("Esp_Highlight"):Destroy()
        end
        
        -- 更新GUI显示
        if v:FindFirstChild("Esp_Gui") and v["Esp_Gui"]:FindFirstChild("TextLabel") then
            v["Esp_Gui"]:FindFirstChild("TextLabel").Text = 
                (_G.EspName == true and ((v.Name == "LeverForGate" and "拉杆") or (v.Name:find("Key") and "钥匙") or (v.Name:find("FuseObtain") and "保险丝")) or "")..
                (_G.EspDistance == true and "\n距离: ("..string.format("%.0f", Distance((v.Name == "LeverForGate" and v.PrimaryPart.Position) or ((v.Name:find("Key") or v.Name:find("FuseObtain")) and v.Hitbox.Position))).."m)" or "")
            v["Esp_Gui"]:FindFirstChild("TextLabel").TextSize = _G.EspGuiTextSize or 15
            v["Esp_Gui"]:FindFirstChild("TextLabel").TextColor3 = Color3.fromRGB(0, 255, 0)  -- 绿色文字
        end
        
        if _G.EspGui == true and v:FindFirstChild("Esp_Gui") == nil then
            local GuiEsp = Instance.new("BillboardGui", v)
            GuiEsp.Adornee = v
            GuiEsp.Name = "Esp_Gui"
            GuiEsp.Size = UDim2.new(0, 100, 0, 150)
            GuiEsp.AlwaysOnTop = true
            local GuiEspText = Instance.new("TextLabel", GuiEsp)
            GuiEspText.BackgroundTransparency = 1
            GuiEspText.Font = Enum.Font.Code
            GuiEspText.Size = UDim2.new(0, 100, 0, 100)
            GuiEspText.TextSize = 15
            GuiEspText.TextColor3 = Color3.fromRGB(0, 255, 0)  -- 绿色文字
            GuiEspText.TextStrokeTransparency = 0.5
            GuiEspText.Text = ""
            local UIStroke = Instance.new("UIStroke")
            UIStroke.Color = Color3.new(0, 0, 0)
            UIStroke.Thickness = 1.5
            UIStroke.Parent = GuiEspText
        elseif _G.EspGui == false and v:FindFirstChild("Esp_Gui") then
            v:FindFirstChild("Esp_Gui"):Destroy()
        end
    end
end

local function CheckKey(v)
    if not table.find(_G.KeyAdd, v) and ((v.Name:find("Key") or v.Name:find("FuseObtain")) and v:FindFirstChild("Hitbox")) or (v.Name == "LeverForGate" and v.PrimaryPart) then
        table.insert(_G.KeyAdd, v)
    end
end

-- 任务物品ESP主循环
task.spawn(function()
    while task.wait() do
        if _G.EspKey then
            for i, v in pairs(_G.KeyAdd) do
                if v:IsA("Model") then
                    Keys(v)
                end
            end
        else
            -- 清理所有任务物品ESP
            for _, v in pairs(workspace:GetDescendants()) do 
                if v.Name:find("Key") or v.Name == "LeverForGate" or v.Name:find("FuseObtain") then
                    for i, z in pairs(v:GetChildren()) do
                        if z.Name:find("Esp_") then
                            z:Destroy()
                        end
                    end
                end
            end
            -- 清空任务物品表
            _G.KeyAdd = {}
            
            -- 断开连接
            if KeySpawn then
                KeySpawn:Disconnect()
                KeySpawn = nil
            end
            if KeyRemove then
                KeyRemove:Disconnect()
                KeyRemove = nil
            end
            break
        end
    end
end)

-- 初始化任务物品ESP
if _G.EspKey then
    for _, v in ipairs(workspace:GetDescendants()) do
        CheckKey(v)
    end
    
    KeySpawn = workspace.DescendantAdded:Connect(function(v)
        CheckKey(v)
    end)
    
    KeyRemove = workspace.DescendantRemoving:Connect(function(v)
        for i = #_G.KeyAdd, 1, -1 do
            if _G.KeyAdd[i] == v then
                table.remove(_G.KeyAdd, i)
                break
            end
        end
    end)
end

-- 优化的ESP函数
local function Esp(Parent, TextAdornee, Text, Color, OutlineColor)
    if not Parent or not TextAdornee or Parent:FindFirstChild("_LOLHAXHL") then return end
    
    local BillboardGui = Instance.new("BillboardGui", Parent)
    local TextLabel = Instance.new("TextLabel", BillboardGui)
    local Highlight = Instance.new("Highlight", Parent)
    
    BillboardGui.Adornee = TextAdornee
    BillboardGui.AlwaysOnTop = true
    BillboardGui.Name = "_LOLHAXBG"
    BillboardGui.Size = UDim2.fromScale(1, 1)
    BillboardGui.Enabled = true
    
    Highlight.Name = "_LOLHAXHL"
    TextLabel.Size = UDim2.fromScale(1, 1)
    TextLabel.TextStrokeTransparency = 0
    TextLabel.Font = Enum.Font[Options.ESPFont.Value] or Enum.Font.SourceSans
    TextLabel.TextSize = Options.ESPFontSize.Value or 20
    TextLabel.TextColor3 = Color
    TextLabel.BackgroundTransparency = 1
    
    Highlight.Adornee = Parent
    Highlight.FillColor = Color
    Highlight.OutlineColor = OutlineColor or Color
    TextLabel.TextTransparency = 1
    Highlight.FillTransparency = 1
    Highlight.OutlineTransparency = 1
    TextLabel:SetAttribute("Text", Text)
    
    -- 降低距离更新频率
    task.spawn(function()
        while Parent and Parent.Parent and not Unloaded do
            local Distance = (workspace.CurrentCamera.CFrame.Position - Parent:GetPivot().Position).Magnitude
            TextLabel.Text = Text .. "\n[ " .. string.format(Distance <= 9.9 and "%.1f" or "%.0f", Distance) .. " ]"
            task.wait(0.8) -- 从0.5秒增加到0.8秒
        end
    end)
    
    game:GetService("TweenService"):Create(Highlight, TweenInfo.new(Options.ESPFadeTime.Value or 1), {FillTransparency = Options.ESPFillTransparency.Value or 0.7, OutlineTransparency = Options.ESPOutlineTransparency.Value or 0.2}):Play()
    game:GetService("TweenService"):Create(TextLabel, TweenInfo.new(Options.ESPFadeTime.Value or 1), {TextTransparency = 0}):Play()
    
    Parent.Destroying:Connect(function()
        RemoveEspSmooth(Parent)
    end)
    
    return Highlight, TextLabel
end

local function RemoveEspSmooth(Parent)
    if Parent:FindFirstChild("_LOLHAXHL") and Parent:FindFirstChild("_LOLHAXBG") then
        game:GetService("TweenService"):Create(Parent._LOLHAXHL, TweenInfo.new(Options.ESPFadeTime.Value or 1), {FillTransparency = 1, OutlineTransparency = 1}):Play()
        game:GetService("TweenService"):Create(Parent._LOLHAXBG.TextLabel, TweenInfo.new(Options.ESPFadeTime.Value or 1), {TextTransparency = 1}):Play()
        task.delay(Options.ESPFadeTime.Value or 1, function()
            if Parent:FindFirstChild("_LOLHAXHL") then Parent._LOLHAXHL:Destroy() end
            if Parent:FindFirstChild("_LOLHAXBG") then Parent._LOLHAXBG:Destroy() end
        end)
    end
end

-- 性能优化的ESP扫描函数
local function ScanAndAddESP(category, names, toggle, fillColor, outlineColor, adorneeFunc, removalCondition, textFunc)
    if not Toggles[toggle].Value then return end
    names = type(names) == "table" and names or {names}
    
    for _, room in pairs(Rooms:GetChildren()) do
        for _, v in pairs(room:GetDescendants()) do
            if v:IsA("Model") and table.find(names, v.Name) then
                local alreadyHasESP = false
                local espCategory = EspTable[category][names[1] .. "s"] or EspTable[category]
                
                for _, existingEsp in pairs(espCategory) do
                    if existingEsp[1] and existingEsp[1].Adornee == v then
                        alreadyHasESP = true
                        break
                    end
                end
                
                if not alreadyHasESP then
                    local adornee = adorneeFunc(v)
                    if adornee then
                        local text = textFunc and textFunc(v) or v.Name
                        local Highlight, TextLabel = Esp(adornee, adornee, text, Options[fillColor].Value, Options[outlineColor].Value)
                        if Highlight then
                            table.insert(espCategory, {Highlight, TextLabel})
                            if removalCondition then
                                removalCondition(v, adornee)
                            end
                        end
                    end
                end
            end
        end
    end
end

-- 性能优化的实体ESP扫描
local function ScanAndAddEntityESP(names, toggle, colorOption, adorneeFunc, removalCondition, preAddFunc, textFunc)
    if not Toggles[toggle].Value then return end
    names = type(names) == "table" and names or {names}
    
    for _, v in pairs(workspace:GetDescendants()) do
        if v:IsA("Model") and table.find(names, v.Name) then
            local alreadyHasESP = false
            for _, existingEsp in pairs(EspTable.Entities) do
                if existingEsp[1] and existingEsp[1].Adornee == v then
                    alreadyHasESP = true
                    break
                end
            end
            
            if not alreadyHasESP then
                if preAddFunc then preAddFunc(v) end
                local adornee = adorneeFunc(v)
                if adornee then
                    local text = textFunc and textFunc(v) or v.Name
                    local Highlight, TextLabel = Esp(v, adornee, text, Options[colorOption].Value, Options[colorOption].Value)
                    if Highlight then
                        table.insert(EspTable.Entities, {Highlight, TextLabel})
                        if removalCondition then
                            removalCondition(v)
                        end
                    end
                end
            end
        end
    end
end

-- 清理无效的ESP
local function CleanupStaleESP()
    for category, subs in pairs(EspTable) do
        if type(subs) == "table" then
            for sub, esps in pairs(subs) do
                if type(esps) == "table" then
                    local validEsps = {}
                    for i, esp in pairs(esps) do
                        if esp[1] and esp[1].Adornee and esp[1].Adornee.Parent then
                            table.insert(validEsps, esp)
                        else
                            if esp[1] then esp[1]:Destroy() end
                            if esp[2] then esp[2]:Destroy() end
                        end
                    end
                    subs[sub] = validEsps
                end
            end
        end
    end
end

-- 更新ESP计数
local function UpdateESPCount()
    local count = 0
    for category, subs in pairs(EspTable) do
        if type(subs) == "table" then
            for sub, esps in pairs(subs) do
                if type(esps) == "table" then
                    count = count + #esps
                end
            end
        end
    end
    PerformanceMonitor.ESPCount = count
end

-- 性能优化的扫描函数
local function OptimizedRescanAll()
    if Unloaded then return end
    
    local currentTime = tick()
    if currentTime - PerformanceMonitor.LastScan < PerformanceMonitor.ScanCooldown then
        return
    end
    
    PerformanceMonitor.LastScan = currentTime
    
    -- 根据FPS动态调整扫描频率
    local fps = 1/workspace:GetRealPhysicsFPS()
    if fps < 30 then
        PerformanceMonitor.ScanCooldown = 2.0
    elseif fps < 45 then
        PerformanceMonitor.ScanCooldown = 1.5
    else
        PerformanceMonitor.ScanCooldown = 1.0
    end
    
    task.spawn(function()
        if Toggles.ESPInteractMainEnabled.Value then
            -- 分批扫描，避免一次性扫描所有物品
            local scans = {
                {Toggles.ESPDoorKeys, "KeyObtain", "Door Key"},
                {Toggles.ESPGoldPiles, "GoldPile", "Gold Pile"},
                {Toggles.ESPGeneratorFuses, "FuseObtain", "Generator Fuse"},
                {Toggles.ESPGenerators, "MinesGenerator", "Generator"},
            }
            
            for i, scan in ipairs(scans) do
                if scan[1].Value then
                    ScanAndAddESP("Interactables", scan[2], scan[1].Text, scan[1].Text .. "Fill", scan[1].Text .. "Outline",
                        function(v) return v end,
                        nil,
                        function(v) return scan[3] end)
                    task.wait(0.05) -- 添加延迟避免卡顿
                end
            end
        end
        
        if Toggles.ESPEntitiesEnabled.Value then
            local entityScans = {
                {Toggles.ESPRush, "RushMoving", "Rush"},
                {Toggles.ESPMovingAmbush, "AmbushMoving", "Ambush"},
                {Toggles.ESPA60, "A60", "A-60"},
                {Toggles.ESPA120, "A120", "A-120"},
            }
            
            for _, scan in ipairs(entityScans) do
                if scan[1].Value then
                    ScanAndAddEntityESP(scan[2], scan[1].Text, scan[1].Text .. "Color",
                        function(v) return v end,
                        function(v) end,
                        nil,
                        function(v) return scan[3] end)
                    task.wait(0.05) -- 添加延迟
                end
            end
        end
        
        UpdateESPCount()
    end)
end

-- 定期清理
task.spawn(function()
    while not Unloaded do
        task.wait(20) -- 从15秒增加到20秒
        CleanupStaleESP()
        collectgarbage("step") -- 手动触发垃圾回收
    end
end)

-- 性能监控和自适应调整
task.spawn(function()
    while not Unloaded do
        local currentTime = tick()
        local fps = 1/workspace:GetRealPhysicsFPS()
        PerformanceMonitor.LastFPS = fps
        
        -- 根据性能自动调整
        if fps < 25 then
            if PerformanceMonitor.ESPCount > 15 then
                Library:Notify("低FPS检测到，建议减少ESP数量", 3)
                -- 自动增加扫描间隔
                PerformanceMonitor.ScanCooldown = math.min(PerformanceMonitor.ScanCooldown + 0.5, 3.0)
            end
        elseif fps > 50 then
            -- 恢复较快的扫描速度
            PerformanceMonitor.ScanCooldown = math.max(PerformanceMonitor.ScanCooldown - 0.1, 0.5)
        end
        
        task.wait(8) -- 从5秒增加到8秒
    end
end)

-- 降低扫描频率
RunService.Heartbeat:Connect(function(delta)
    if Unloaded then return end
    OptimizedRescanAll()
end)

Rooms.ChildAdded:Connect(function(newRoom)
    task.delay(1.5, OptimizedRescanAll) -- 增加延迟
end)

GameData.Floor.Changed:Connect(function(newFloor)
    for category, subs in pairs(EspTable) do
        if type(subs) == "table" then
            for sub, esps in pairs(subs) do
                if type(esps) == "table" then
                    for _, esp in pairs(esps) do
                        RemoveEspSmooth(esp[1].Adornee)
                    end
                    subs[sub] = {}
                end
            end
        end
    end
    currentFloor = newFloor
    Window.Footer = "floor: " .. newFloor
    task.delay(2.5, OptimizedRescanAll) -- 增加延迟
end)

-- Player Tab: Movement and Bypasses
local MovementGroup = Tabs.Player:AddRightGroupbox("移动设置")

-- 优化的速度更新函数
local function updatespeed()
    if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid") then
        LocalPlayer.Character.Humanoid.WalkSpeed = Toggles.WalkspeedModifier.Value and Options.WalkspeedAmount.Value or 16
    end
end

MovementGroup:AddToggle("WalkspeedModifier", {
    Text = "速度",
    Default = false,
    Tooltip = "Changes your walking speed to the set value.",
    Callback = function(Value)
        updatespeed()
    end
})

MovementGroup:AddToggle("NoAcceleration", {
    Text = "瞬时加速度",
    Default = false,
    Tooltip = "Removes slow-down when changing direction.",
    Callback = function(Value)
        if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
            LocalPlayer.Character.HumanoidRootPart.CustomPhysicalProperties = (Value and PhysicalProperties.new(100, 0, 0, 0, 0) or OldAccel)
        end
    end
})

MovementGroup:AddToggle("AlwaysJump", { 
    Text = "解锁跳跃", 
    Default = false, 
    Tooltip = "Lets you jump anytime.", 
    Callback = function(Value)
        if LocalPlayer.Character then
            LocalPlayer.Character:SetAttribute("CanJump", Value)
        end
    end 
})

local FlySpeed = 50

MovementGroup:AddSlider("Fly Speed", {
    Text = "飞行速度",
    Default = FlySpeed,
    Min = 0,
    Max = 150,
    Rounding = 0,
    Compact = true,
    Tooltip = "改变飞行速度",
    Callback = function(Value)
        FlySpeed = Value
    end
})

-- 优化的飞行系统
local isFlying = false
local flyConnections = {}
local keys = {W = false, A = false, S = false, D = false, Space = false, Shift = false}

local function startFly()
    local player = game.Players.LocalPlayer
    local character = player.Character
    if not character then return end
    local humanoid = character:FindFirstChildOfClass("Humanoid")
    if not humanoid then return end
    local hrp = character:FindFirstChild("HumanoidRootPart")
    if not hrp then return end

    stopFly()

    local bv = Instance.new("BodyVelocity")
    bv.Name = "飞行速度"
    bv.MaxForce = Vector3.new(40000, 40000, 40000)
    bv.Velocity = Vector3.new(0, 0, 0)
    bv.Parent = hrp

    local bg = Instance.new("BodyGyro")
    bg.Name = "飞行陀螺"
    bg.MaxTorque = Vector3.new(40000, 40000, 40000)
    bg.P = 1000
    bg.D = 100
    bg.Parent = hrp

    local inputBegan = game:GetService("UserInputService").InputBegan:Connect(function(input, gpe)
        if gpe then return end
        local key = input.KeyCode
        if key == Enum.KeyCode.W then keys.W = true
        elseif key == Enum.KeyCode.A then keys.A = true
        elseif key == Enum.KeyCode.S then keys.S = true
        elseif key == Enum.KeyCode.D then keys.D = true
        elseif key == Enum.KeyCode.Space then keys.Space = true
        elseif key == Enum.KeyCode.LeftShift then keys.Shift = true end
    end)

    local inputEnded = game:GetService("UserInputService").InputEnded:Connect(function(input)
        local key = input.KeyCode
        if key == Enum.KeyCode.W then keys.W = false
        elseif key == Enum.KeyCode.A then keys.A = false
        elseif key == Enum.KeyCode.S then keys.S = false
        elseif key == Enum.KeyCode.D then keys.D = false
        elseif key == Enum.KeyCode.Space then keys.Space = false
        elseif key == Enum.KeyCode.LeftShift then keys.Shift = false end
    end)

    local lastUpdate = 0
    local renderConnection = game:GetService("RunService").RenderStepped:Connect(function()
        local currentTime = tick()
        if currentTime - lastUpdate < 0.05 then return end -- 限制到20FPS
        lastUpdate = currentTime
        
        local cam = workspace.CurrentCamera
        if not cam or not hrp or not hrp:FindFirstChild("飞行速度") then
            stopFly()
            return
        end

        local move = Vector3.new(0, 0, 0)
        if keys.W then move = move + cam.CFrame.LookVector end
        if keys.S then move = move - cam.CFrame.LookVector end
        if keys.A then move = move - cam.CFrame.RightVector end
        if keys.D then move = move + cam.CFrame.RightVector end
        if keys.Space then move = move + Vector3.new(0, 1, 0) end
        if keys.Shift then move = move - Vector3.new(0, 1, 0) end

        local direction = (move.Magnitude > 0) and (move.Unit * FlySpeed) or Vector3.new(0, 0, 0)
        bv.Velocity = direction
        bg.CFrame = cam.CFrame
    end)

    flyConnections = {inputBegan, inputEnded, renderConnection}
end

local function stopFly()
    local player = game.Players.LocalPlayer
    local character = player.Character
    local humanoid = character and character:FindFirstChildOfClass("Humanoid")
    local hrp = character and character:FindFirstChild("HumanoidRootPart")

    if hrp then
        local flyVelocity = hrp:FindFirstChild("飞行速度")
        if flyVelocity then flyVelocity:Destroy() end
        local flyGyro = hrp:FindFirstChild("飞行陀螺")
        if flyGyro then flyGyro:Destroy() end
    end

    if humanoid then
        humanoid.AutoRotate = true
        humanoid.PlatformStand = false
        humanoid:ChangeState(Enum.HumanoidStateType.GettingUp)
    end

    for _, conn in ipairs(flyConnections) do
        if conn then
            conn:Disconnect()
        end
    end
    flyConnections = {}

    keys = {W = false, A = false, S = false, D = false, Space = false, Shift = false}
end

MovementGroup:AddToggle("Fly", {
    Text = "飞行",
    Default = false,
    Callback = function(Value)
        isFlying = Value
        if Value then
            startFly()
        else
            stopFly()
        end
    end
})

-- 优化的穿墙系统
local noclipConnection = nil

MovementGroup:AddToggle("Noclip", {
    Text = "穿墙", 
    Default = false, 
    Tooltip = "you know what it does", 
    Callback = function(Value)
        if Value then
            noclipConnection = RunService.Stepped:Connect(function()
                if player.Character then
                    for _, part in pairs(player.Character:GetDescendants()) do
                        if part:IsA("BasePart") and part.CanCollide then
                            part.CanCollide = false
                        end
                    end
                end
            end)
        else
            if noclipConnection then
                noclipConnection:Disconnect()
                noclipConnection = nil
            end
            
            if player.Character then
                for _, part in pairs(player.Character:GetDescendants()) do
                    if part:IsA("BasePart") then
                        if part.Name == "Head" then
                            part.CanCollide = false
                        elseif part.Parent:IsA("Accessory") then
                            part.CanCollide = false
                        else
                            part.CanCollide = true
                        end
                    end
                end
            end
        end
    end
})

-- 角色事件处理
game.Players.LocalPlayer.CharacterAdded:Connect(function(newCharacter)
    if isFlying then
        task.wait(1) -- 等待角色完全加载
        if newCharacter:FindFirstChild("HumanoidRootPart") and newCharacter:FindFirstChild("Humanoid") then
            startFly()
        end
    end
end)

game.Players.LocalPlayer.CharacterRemoving:Connect(function()
    if isFlying then
        stopFly()
    end
end)

MovementGroup:AddToggle("LadderSpeedBoost", {
    Text = "启用爬梯速度",
    Default = false,
    Callback = function(Value)
        if Value then
            AntiConnections["LadderBoost"] = LocalPlayer.Character.Humanoid.StateChanged:Connect(function(_, new)
                if new == Enum.HumanoidStateType.Climbing then
                    LocalPlayer.Character.Humanoid.WalkSpeed = Options.LadderSpeedBoostAmount.Value
                else
                    updatespeed()
                end
            end)
        else
            if AntiConnections["LadderBoost"] then AntiConnections["LadderBoost"]:Disconnect() end
            updatespeed()
        end
    end
})

MovementGroup:AddSlider("LadderSpeedBoostAmount", {
    Text = "爬梯速度",
    Default = 0,
    Min = 0,
    Max = 50,
    Rounding = 0,
    Compact = true,
    Tooltip = "Boost for climbing ladders. Higher values might be unstable."
})

MovementGroup:AddSlider("WalkspeedAmount", {
    Text = "行走速度",
    Default = 20,
    Min = 10,
    Max = 50,
    Rounding = 0,
    Compact = true,
    Tooltip = "Sets how fast you walk.",
    Callback = function(Value)
        updatespeed()
    end
})

-- Godmode functionality
local GodmodeStuff = Tabs.Player:AddLeftGroupbox('Godmode')
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local lp = Players.LocalPlayer
local AutoMode = "Toggle"
local PreviousMode = "Toggle"
local AutoDistance = 166
local ActiveEntities = {}

local function setGodmode(state)
    local char = lp.Character
    if not char then return end
    local hum = char:FindFirstChildOfClass("Humanoid")
    local collision = char:FindFirstChild("Collision")
    if not (hum and collision) then return end
    if state then
        hum.HipHeight = 0.09
        collision.Size = Vector3.new(1, 3, 3)
        if collision:FindFirstChild("CollisionCrouch") then
            collision.CollisionCrouch.Size = Vector3.new(1, 3, 3)
        end
    else
        hum.HipHeight = 2.4
        collision.Size = Vector3.new(5.5, 3, 3)
        if collision:FindFirstChild("CollisionCrouch") then
            collision.CollisionCrouch.Size = Vector3.new(5.5, 3, 3)
        end
    end
end

local function safeDisableGod()
    if not lp.Character then return end
    local hum = lp.Character:FindFirstChildOfClass("Humanoid")
    local collision = lp.Character:FindFirstChild("Collision")
    if not (hum and collision) then
        setGodmode(false)
        return
    end
    local wasNoclip = Toggles.Noclip and Toggles.Noclip.Value
    local shouldShim = AutoMode ~= "Never" and not wasNoclip
    if shouldShim and Toggles.Noclip then
        Toggles.Noclip:SetValue(true)
    end
    setGodmode(false)
    if shouldShim and Toggles.Noclip then
        task.delay(0.2, function()
            if Toggles.Noclip and Toggles.Noclip.Value then
                Toggles.Noclip:SetValue(false)
            end
        end)
    end
end

GodmodeStuff:AddDropdown("GodmodeMode", { 
    Text = "上帝模式",
    Default = "Toggle",
    Values = {"Toggle", "Automatic", "Hold", "Always"},
    Callback = function(mode)
        if PreviousMode == "Always" and mode ~= "Always" then
            if Toggles.PositionSpoof and Toggles.PositionSpoof.Value then
                Toggles.PositionSpoof:SetValue(false)
                setGodmode(false)
                if Toggles.Noclip and not Toggles.Noclip.Value then
                    Toggles.Noclip:SetValue(true)
                    task.delay(0.2, function()
                        if Toggles.Noclip and Toggles.Noclip.Value then
                            Toggles.Noclip:SetValue(false)
                        end
                    end)
                end
            end
        end
        AutoMode = mode
        PreviousMode = mode
        if Options.PositionSpoofKey then
            Options.PositionSpoofKey.Text = "Position Spoof (" .. mode .. ")"
        end
        if mode == "Always" then
            Toggles.PositionSpoof:SetValue(true)
        elseif mode == "Never" then
            Toggles.PositionSpoof:SetValue(false)
        end
    end
})

GodmodeStuff:AddCheckbox("PositionSpoof", {
    Text = "上帝模式开关",
    Default = false,
    Disabled = false,
    Callback = function(v)
        if v then
            setGodmode(true)
            if Toggles.AntiFigure and not Toggles.AntiFigure.Value then
                Toggles.AntiFigure:SetValue(true)
                Library:Notify({
                    Title = "Godmode Enabled",
                    Description = "AntiFigure has been enabled automatically.",
                    Duration = 5,
                    Color = Color3.fromRGB(0, 200, 255)
                })
            end
            Library:Notify({
                Title = 'hey, if you see this. I was too lazy to remove this',
                Description = "",
                Duration = 10,
                Color = Color3.fromRGB(255, 64, 64)
            })
        else
            safeDisableGod()
            if Toggles.AntiFigure and Toggles.AntiFigure.Value then
                Toggles.AntiFigure:SetValue(false)
                Library:Notify({
                    Title = "Godmode Disabled",
                    Description = "AntiFigure has been disabled automatically.",
                    Duration = 5,
                    Color = Color3.fromRGB(255, 128, 128)
                })
            end
        end
    end
}):AddKeyPicker("PositionSpoofKey", {
    Default = "K",
    Mode = "Toggle",
    Text = "位置切换",
    NoUI = false,
    SyncToggleState = true,
})

-- Entity detection for godmode
local EntList = {"a60", "ambushmoving", "backdoorrush", "rushmoving", "mandrake"}
local function IsValidEntity(entity)
    return table.find(EntList, entity.Name:lower()) ~= nil
end

workspace.DescendantAdded:Connect(function(entity)
    if not IsValidEntity(entity) then return end
    local part = entity:FindFirstChildWhichIsA("BasePart")
    if part then ActiveEntities[entity] = part end
end)

RunService.RenderStepped:Connect(function()
    local lib = getgenv().Library
    if not lib or lib.Unloaded then return end
    local root = lp.Character and lp.Character:FindFirstChild("HumanoidRootPart")
    if not root then return end
    if AutoMode == "Never" then
        if Toggles.PositionSpoof.Value then
            Toggles.PositionSpoof:SetValue(false)
        end
    elseif AutoMode == "Always" then
        if not Toggles.PositionSpoof.Value then
            Toggles.PositionSpoof:SetValue(true)
        end
    elseif AutoMode == "Automatic" then
        local shouldEnable = false
        for entity, part in pairs(ActiveEntities) do
            if entity.Parent == nil then
                ActiveEntities[entity] = nil
            elseif part then
                local dist = (root.Position - part.Position).Magnitude
                if dist < AutoDistance then
                    shouldEnable = true
                    break
                end
            end
        end
        if shouldEnable then
            if not Toggles.PositionSpoof.Value then
                Toggles.PositionSpoof:SetValue(true)
            end
        else
            if Toggles.PositionSpoof.Value then
                Toggles.PositionSpoof:SetValue(false)
                safeDisableGod()
            end
        end
    elseif AutoMode == "Hold" then
        local keyCode = Options.PositionSpoofKey and Options.PositionSpoofKey.Value
        if keyCode and UserInputService:IsKeyDown(keyCode) then
            if not Toggles.PositionSpoof.Value then
                Toggles.PositionSpoof:SetValue(true)
            end
        else
            if Toggles.PositionSpoof.Value then
                Toggles.PositionSpoof:SetValue(false)
                safeDisableGod()
            end
        end
    elseif AutoMode == "Toggle" then
    end
end)

task.spawn(function()
    while true do
        task.wait(0.1)
        if getgenv().Library.Unloaded then break end
        if Toggles.PositionSpoof and Toggles.PositionSpoof.Value then
            setGodmode(true)
        end
    end
end)

local VisualEffects = Tabs.Player:AddLeftGroupbox("视觉效果")
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local LocalPlayer = Players.LocalPlayer
local Camera = workspace.CurrentCamera

VisualEffects:AddToggle("NoCamShake", {
    Text = "无摄像头抖动",
    Default = false,
    Tooltip = "Removes camera shaking from entities.",
    Callback = function(Value)
        require(LocalPlayer.PlayerGui.MainUI.Initiator.Main_Game).csgo = Value and CFrame.new(0, 0, 0) or nil
    end
})

VisualEffects:AddToggle("NoLookBob", {
    Text = "无头镜头晃动",
    Default = false,
    Tooltip = "Removes head bobbing when walking.",
    Callback = function(Value)
        require(LocalPlayer.PlayerGui.MainUI.Initiator.Main_Game).spring.Speed = Value and 9e9 or 8
    end
})

VisualEffects:AddToggle("Ambience", {
    Text = "全亮",
    Default = false,
    Tooltip = "Changes the map's color tint.",
    Callback = function(Value)
        game.Lighting.GlobalShadows = not Value
        game.Lighting.OutdoorAmbient = Value and Options.AmbienceColor.Value or Color3.new(0, 0, 0)
    end
}):AddColorPicker("AmbienceColor", {
    Default = Color3.new(1, 1, 1),
    Title = "颜色色调",
    Callback = function(Value)
        game.Lighting.OutdoorAmbient = Toggles.Ambience.Value and Value or Color3.new(0, 0, 0)
    end
})

VisualEffects:AddToggle("NoFog", {
    Text = "无雾",
    Default = false,
    Tooltip = "Clears any fog in the map.",
    Callback = function(Value)
        if game.Lighting:FindFirstChild("Atmosphere") then
            game.Lighting.Atmosphere.Density = Value and 0 or 0.3
        end
        game.Lighting.FogEnd = Value and 9999 or 500
    end
})

VisualEffects:AddDivider()

VisualEffects:AddToggle("Thirdperson", {
    Text = "第三人称视角",
    Default = false,
    Tooltip = "Shows your character from behind.",
    Callback = function(Value)
        if Value then
            AntiConnections["Thirdperson"] = RunService.RenderStepped:Connect(function()
                local Cam = workspace.CurrentCamera
                Cam.CFrame = Cam.CFrame * CFrame.new(Options.ThirdpersonOffset.Value, Options.ThirdpersonOffsetUp.Value, 3.5 * (Options.ThirdpersonDistance.Value / 7.5)) * (Toggles.NoCamShake.Value and CFrame.new() or require(LocalPlayer.PlayerGui.MainUI.Initiator.Main_Game).csgo)
            end)
        else
            if AntiConnections["Thirdperson"] then AntiConnections["Thirdperson"]:Disconnect() end
        end
    end
}):AddKeyPicker("ThirdpersonKey", { Default = "V", SyncToggleState = false, Mode = "Toggle", Text = "Third Person", NoUI = false })

VisualEffects:AddSlider("ThirdpersonDistance", {
    Text = "第三人称距离",
    Default = 10,
    Min = 5,
    Max = 30,
    Rounding = 0,
    Compact = true,
    Tooltip = "How far the camera is in third person."
})

VisualEffects:AddSlider("ThirdpersonOffset", {
    Text = "第三人称侧偏移",
    Default = 0,
    Min = -5,
    Max = 5,
    Rounding = 1,
    Compact = true,
    Tooltip = "Left/right camera shift in third person."
})

VisualEffects:AddSlider("ThirdpersonOffsetUp", {
    Text = "第三人身高偏移",
    Default = 0,
    Min = -5,
    Max = 5,
    Rounding = 1,
    Compact = true,
    Tooltip = "Up/down camera shift in third person."
})

VisualEffects:AddSlider("FOV", {
    Text = "视野",
    Default = 70,
    Min = 0,
    Max = 120,
    Rounding = 1,
    Compact = true,
    Tooltip = "Changes camera field of view smoothly every frame.",
    Callback = function(TargetFOV)
        TargetFOV = math.clamp(TargetFOV, 0, 120)
        local CurrentFOV = Camera.FieldOfView or 70
        local Speed = 10

        if _G.FOVConnection then _G.FOVConnection:Disconnect() end

        _G.FOVConnection = RunService.RenderStepped:Connect(function(dt)
            CurrentFOV = CurrentFOV + (TargetFOV - CurrentFOV) * math.clamp(Speed * dt, 0, 1)
            Camera.FieldOfView = CurrentFOV
        end)
    end
})

local AutomationGroup = Tabs.Player:AddRightGroupbox("自动")
AutomationGroup:AddToggle("AnchorCode", { Text = "自动密码", Default = false, Tooltip = "Notifies when anchor codes are found." })
AutomationGroup:AddToggle("MinecartInteract", { Text = "自动矿车互动", Default = false, Tooltip = "Spams interact on nearby minecarts." }):AddKeyPicker("MinecartInteractKey", { Default = "H", SyncToggleState = false, Mode = "Hold", Text = "自动矿车", NoUI = false })
AutomationGroup:AddToggle("AnchorAutoSolve", { Text = "自动锚点", Default = false, Tooltip = "Solves anchors automatically when close." })
AutomationGroup:AddToggle("AutoPadlockSolve", { Text = "自动解锁图书馆密码锁", Default = false, Tooltip = "Unlocks padlock automatically when near." })
AutomationGroup:AddDivider()
AutomationGroup:AddSlider("AutoPadlockSolveDistance", { Text = "解锁距离", Default = 25, Min = 10, Max = 50, Rounding = 0, Compact = false, Tooltip = "Distance to auto-input padlock code."})
AutomationGroup:AddSlider("AutoInteractRange", { Text = "交互范围", Default = 1, Min = 1, Max = 2, Rounding = 1, Compact = false })

local BypassGroup = Tabs.Player:AddLeftGroupbox("绕过")
BypassGroup:AddToggle("CrouchSpoof", { Text = "绕过 Figure", Default = false, Tooltip = "Makes the game think you're crouching. Useful in Figure rooms.", Callback = function(Value)
    ReplicatedStorage.RemotesFolder.Crouch:FireServer(Value)
end })

BypassGroup:AddToggle("SpeedBypass", { Text = "绕过速度检测", Default = false, Tooltip = "Tries to avoid the speed anti-cheat." })

-- Visuals Tab: ESP and Effects
local ESPPlayers = Tabs.Visuals:AddLeftGroupbox("玩家透视")
ESPPlayers:AddToggle("ESPPlayersEnabled", {
    Text = "玩家透视",
    Default = false,
    Callback = function(Value)
        if Value then
            for _, Player in pairs(game.Players:GetPlayers()) do
                if Player ~= LocalPlayer and Player.Character and Player.Character:FindFirstChild("HumanoidRootPart") then
                    local Highlight, TextLabel = Esp(Player.Character, Player.Character, Player.Name, Options.ESPPlayerFillColor.Value, Options.ESPPlayerOutlineColor.Value)
                    table.insert(EspTable.Players, {Highlight, TextLabel})
                end
            end
        else
            for _, esp in pairs(EspTable.Players) do
                RemoveEspSmooth(esp[1].Adornee)
            end
            EspTable.Players = {}
        end
    end
}):AddColorPicker("ESPPlayerFillColor", {
    Default = Color3.new(1, 1, 1),
    Title = "填充颜色"
}):AddColorPicker("ESPPlayerOutlineColor", {
    Default = Color3.new(1, 1, 1),
    Title = "轮廓颜色"
})

local ESPInteractables = Tabs.Visuals:AddRightTabbox("Interactable ESP")
local ESPInteractables_Config = ESPInteractables:AddTab("选项")

-- 添加统一的任务物品ESP开关
ESPInteractables_Config:AddToggle("ESPKey", {
    Text = "任务物品透视",
    Default = false,
    Callback = function(Value)
        _G.EspKey = Value
        if Value then
            -- 初始化任务物品ESP
            for _, v in ipairs(workspace:GetDescendants()) do
                CheckKey(v)
            end
            
            KeySpawn = workspace.DescendantAdded:Connect(function(v)
                CheckKey(v)
            end)
            
            KeyRemove = workspace.DescendantRemoving:Connect(function(v)
                for i = #_G.KeyAdd, 1, -1 do
                    if _G.KeyAdd[i] == v then
                        table.remove(_G.KeyAdd, i)
                        break
                    end
                end
            end)
        else
            -- 清理所有任务物品ESP
            for _, v in pairs(workspace:GetDescendants()) do 
                if v.Name:find("Key") or v.Name == "LeverForGate" or v.Name:find("FuseObtain") then
                    for i, z in pairs(v:GetChildren()) do
                        if z.Name:find("Esp_") then
                            z:Destroy()
                        end
                    end
                end
            end
            -- 清空任务物品表
            _G.KeyAdd = {}
            
            -- 断开连接
            if KeySpawn then
                KeySpawn:Disconnect()
                KeySpawn = nil
            end
            if KeyRemove then
                KeyRemove:Disconnect()
                KeyRemove = nil
            end
        end
    end
})

ESPInteractables_Config:AddToggle("ESPDoors", {
    Text = "门",
    Default = false,
    Callback = function(Value)
        _G.EspDoor = Value
        if not Value then
            clearAllDoorESPs()
        end
    end
}):AddColorPicker("ESPDoorsFill", { Default = Color3.new(150/255, 200/255, 255/255), Title = "填充颜色" })
:AddColorPicker("ESPDoorsOutline", { Default = Color3.new(150/255, 200/255, 255/255), Title = "轮廓颜色" })

ESPInteractables_Config:AddToggle("ESPDoorKeys", {
    Text = "钥匙",
    Default = false,
    Callback = function(Value)
        if Value then
            ScanAndAddESP("Interactables", "KeyObtain", "ESPDoorKeys", "ESPDoorKeysFill", "ESPDoorKeysOutline",
                function(v) return v end,
                function(v, adornee) end,
                function(v) return "Door Key" end)
        else
            for _, esp in pairs(EspTable.Interactables.DoorKeys) do RemoveEspSmooth(esp[1].Adornee) end
            EspTable.Interactables.DoorKeys = {}
        end
    end
}):AddColorPicker("ESPDoorKeysFill", { Default = Color3.new(1, 1, 1), Title = "填充颜色" })
:AddColorPicker("ESPDoorKeysOutline", { Default = Color3.new(1, 1, 1), Title = "轮廓颜色" })

ESPInteractables_Config:AddToggle("ESPGoldPiles", {
    Text = "金币",
    Default = false,
    Callback = function(Value)
        if Value then
            ScanAndAddESP("Interactables", "GoldPile", "ESPGoldPiles", "ESPGoldPilesFill", "ESPGoldPilesOutline",
                function(v) return v end,
                function(v, adornee) end,
                function(v) return "Gold Pile [ "..v:GetAttribute("GoldValue").." ]" end)
        else
            for _, esp in pairs(EspTable.Interactables.GoldPiles) do RemoveEspSmooth(esp[1].Adornee) end
            EspTable.Interactables.GoldPiles = {}
        end
    end
}):AddColorPicker("ESPGoldPilesFill", { Default = Color3.new(1, 1, 1), Title = "填充颜色" })
:AddColorPicker("ESPGoldPilesOutline", { Default = Color3.new(1, 1, 1), Title = "轮廓颜色" })

ESPInteractables_Config:AddToggle("ESPGeneratorFuses", {
    Text = "发电机保险丝",
    Default = false,
    Callback = function(Value)
        if Value then
            ScanAndAddESP("Interactables", "FuseObtain", "ESPGeneratorFuses", "ESPGeneratorFusesFill", "ESPGeneratorFusesOutline",
                function(v) return v end,
                function(v, adornee) v.Hitbox.FuseModel.Changed:Once(function() RemoveEspSmooth(adornee) end) end,
                function(v) return "Generator Fuse" end)
        else
            for _, esp in pairs(EspTable.Interactables.GeneratorFuses) do RemoveEspSmooth(esp[1].Adornee) end
            EspTable.Interactables.GeneratorFuses = {}
        end
    end
}):AddColorPicker("ESPGeneratorFusesFill", { Default = Color3.new(1, 1, 1), Title = "填充颜色" })
:AddColorPicker("ESPGeneratorFusesOutline", { Default = Color3.new(1, 1, 1), Title = "轮廓颜色" })

ESPInteractables_Config:AddToggle("ESPGenerators", {
    Text = "发电机",
    Default = false,
    Callback = function(Value)
        if Value then
            ScanAndAddESP("Interactables", "MinesGenerator", "ESPGenerators", "ESPGeneratorsFill", "ESPGeneratorsOutline",
                function(v) return v end,
                function(v, adornee) v.Lever.Sound.Played:Once(function() RemoveEspSmooth(adornee) end) end,
                function(v) return "Generator" end)
        else
            for _, esp in pairs(EspTable.Interactables.Generators) do RemoveEspSmooth(esp[1].Adornee) end
            EspTable.Interactables.Generators = {}
        end
    end
}):AddColorPicker("ESPGeneratorsFill", { Default = Color3.new(1, 1, 1), Title = "填充颜色" })
:AddColorPicker("ESPGeneratorsOutline", { Default = Color3.new(1, 1, 1), Title = "轮廓颜色" })

ESPInteractables_Config:AddToggle("ESPGateLevers", {
    Text = "门杆",
    Default = false,
    Callback = function(Value)
        if Value then
            ScanAndAddESP("Interactables", "LeverForGate", "ESPGateLevers", "ESPGateLeversFill", "ESPGateLeversOutline",
                function(v) return v.Main end,
                function(v, adornee) v.ActivateEventPrompt.AttributeChanged:Once(function() RemoveEspSmooth(adornee) end) end,
                function(v) return "Gate Lever" end)
        else
            for _, esp in pairs(EspTable.Interactables.GateLevers) do RemoveEspSmooth(esp[1].Adornee) end
            EspTable.Interactables.GateLevers = {}
        end
    end
}):AddColorPicker("ESPGateLeversFill", { Default = Color3.new(1, 1, 1), Title = "填充颜色" })
:AddColorPicker("ESPGateLeversOutline", { Default = Color3.new(1, 1, 1), Title = "轮廓颜色" })

ESPInteractables_Config:AddToggle("ESPBackroomsLevers", {
    Text = "时间拉杆",
    Default = false,
    Callback = function(Value)
        if Value then
            ScanAndAddESP("Interactables", "TimerLever", "ESPBackroomsLevers", "ESPBackroomsLeversFill", "ESPBackroomsLeversOutline",
                function(v) return v.Hitbox end,
                function(v, adornee) v.ActivateEventPrompt.AttributeChanged:Once(function() RemoveEspSmooth(adornee) end) end,
                function(v) return "Timer Lever" end)
        else
            for _, esp in pairs(EspTable.Interactables.BackroomsLevers) do RemoveEspSmooth(esp[1].Adornee) end
            EspTable.Interactables.BackroomsLevers = {}
        end
    end
}):AddColorPicker("ESPBackroomsLeversFill", { Default = Color3.new(1, 1, 1), Title = "填充颜色" })
:AddColorPicker("ESPBackroomsLeversOutline", { Default = Color3.new(1, 1, 1), Title = "轮廓颜色" })

ESPInteractables_Config:AddToggle("ESPLibraryBooks", {
    Text = "图书馆密码书",
    Default = false,
    Callback = function(Value)
        if Value then
            ScanAndAddESP("Interactables", "LiveHintBook", "ESPLibraryBooks", "ESPLibraryBooksFill", "ESPLibraryBooksOutline",
                function(v) return v end,
                function(v, adornee) end,
                function(v) return "Book" end)
        else
            for _, esp in pairs(EspTable.Interactables.LibraryBooks) do RemoveEspSmooth(esp[1].Adornee) end
            EspTable.Interactables.LibraryBooks = {}
        end
    end
}):AddColorPicker("ESPLibraryBooksFill", { Default = Color3.new(1, 1, 1), Title = "填充颜色" })
:AddColorPicker("ESPLibraryBooksOutline", { Default = Color3.new(1, 1, 1), Title = "轮廓颜色" })

ESPInteractables_Config:AddToggle("ESPBreakerPoles", {
    Text = "断路器",
    Default = false,
    Callback = function(Value)
        if Value then
            ScanAndAddESP("Interactables", "LiveBreakerPolePickup", "ESPBreakerPoles", "ESPBreakerPolesFill", "ESPBreakerPolesOutline",
                function(v) return v end,
                function(v, adornee) end,
                function(v) return "Breaker Pole" end)
        else
            for _, esp in pairs(EspTable.Interactables.BreakerPoles) do RemoveEspSmooth(esp[1].Adornee) end
            EspTable.Interactables.BreakerPoles = {}
        end
    end
}):AddColorPicker("ESPBreakerPolesFill", { Default = Color3.new(1, 1, 1), Title = "填充颜色" })
:AddColorPicker("ESPBreakerPolesOutline", { Default = Color3.new(1, 1, 1), Title = "轮廓颜色" })

ESPInteractables_Config:AddToggle("ESPAnchors", {
    Text = "锚点",
    Default = false,
    Callback = function(Value)
        if Value then
            ScanAndAddESP("Interactables", "_NestHandler", "ESPAnchors", "ESPAnchorsFill", "ESPAnchorsOutline",
                function(v) return v.AnchorBase end,
                function(v, adornee) v.AttributeChanged:Once(function() RemoveEspSmooth(adornee) end) end,
                function(v) return "Anchor" end)
        else
            for _, esp in pairs(EspTable.Interactables.Anchors) do RemoveEspSmooth(esp[1].Adornee) end
            EspTable.Interactables.Anchors = {}
        end
    end
}):AddColorPicker("ESPAnchorsFill", { Default = Color3.new(1, 1, 1), Title = "填充颜色" })
:AddColorPicker("ESPAnchorsOutline", { Default = Color3.new(1, 1, 1), Title = "轮廓颜色" })

ESPInteractables_Config:AddToggle("ESPMiscPickups", {
    Text = "其他物品",
    Default = false,
    Callback = function(Value)
        if Value then
            for name, display in pairs(MiscPickups) do
                ScanAndAddESP("Interactables", name, "ESPMiscPickups", "ESPMiscPickupsFill", "ESPMiscPickupsOutline",
                    function(v) return v.PrimaryPart end,
                    function(v, adornee) end,
                    function(v) return display end)
            end
        else
            for _, esp in pairs(EspTable.Interactables.MiscPickups) do RemoveEspSmooth(esp[1].Adornee) end
            EspTable.Interactables.MiscPickups = {}
        end
    end
}):AddColorPicker("ESPMiscPickupsFill", { Default = Color3.new(1, 1, 1), Title = "填充颜色" })
:AddColorPicker("ESPMiscPickupsOutline", { Default = Color3.new(1, 1, 1), Title = "轮廓颜色" })

ESPInteractables_Config:AddToggle("ESPClosets", {
    Text = "躲藏点",
    Default = false,
    Callback = function(Value)
        if Value then
            ScanAndAddESP("Interactables", "Wardrobe", "ESPClosets", "ESPClosetsFill", "ESPClosetsOutline",
                function(v) return v.Door or v.Main end,
                function(v, adornee) v.AttributeChanged:Once(function() RemoveEspSmooth(adornee) end) end,
                function(v) return "Closet" end)
            ScanAndAddESP("Interactables", "Toolshed", "ESPClosets", "ESPClosetsFill", "ESPClosetsOutline",
                function(v) return v.Door or v.Main end,
                function(v, adornee) v.AttributeChanged:Once(function() RemoveEspSmooth(adornee) end) end,
                function(v) return "Toolshed" end)
        else
            for _, esp in pairs(EspTable.Interactables.Closets) do RemoveEspSmooth(esp[1].Adornee) end
            EspTable.Interactables.Closets = {}
        end
    end
}):AddColorPicker("ESPClosetsFill", { Default = Color3.new(1, 1, 1), Title = "填充颜色" })
:AddColorPicker("ESPClosetsOutline", { Default = Color3.new(1, 1, 1), Title = "轮廓颜色" })

local ESPInteractMainEnabled = Tabs.Visuals:AddLeftGroupbox("启用交互透视")
ESPInteractMainEnabled:AddToggle("ESPInteractMainEnabled", {
    Text = "启用交互透视",
    Default = false
})

local ESPEntities = Tabs.Visuals:AddLeftGroupbox("启用透视")
ESPEntities:AddToggle("ESPEntitiesEnabled", { Text = "启用实体透视", Default = false })
ESPEntities:AddToggle("ESPGiggle", { Text = "Giggle", Default = false }):AddColorPicker("ESPGiggleColor", { Default = Color3.new(255, 174, 116), Title = "Color" })
ESPEntities:AddToggle("ESPFigure", { Text = "Figure", Default = false }):AddColorPicker("ESPFigureColor", { Default = Color3.new(255, 174, 116), Title = "Color" })
ESPEntities:AddToggle("ESPGrumble", { Text = "Grumble", Default = false }):AddColorPicker("ESPGrumbleColor", { Default = Color3.new(255, 174, 116), Title = "Color" })
ESPEntities:AddToggle("ESPGloombatSwarm", { Text = "Gloombat Swarm", Default = false }):AddColorPicker("ESPGloombatSwarmColor", { Default = Color3.new(255, 174, 116), Title = "Color" })
ESPEntities:AddToggle("ESPDread", { Text = "Dread", Default = false }):AddColorPicker("ESPDreadColor", { Default = Color3.new(255, 174, 116), Title = "Color" })
ESPEntities:AddToggle("ESPRush", { Text = "Rush", Default = false }):AddColorPicker("ESPRushColor", { Default = Color3.new(255, 174, 116), Title = "Color" })
ESPEntities:AddToggle("ESPMovingAmbush", { Text = "Ambush", Default = false }):AddColorPicker("ESPMovingAmbushColor", { Default = Color3.fromRGB(255, 174, 116), Title = "Color" })
ESPEntities:AddToggle("ESPA60", { Text = "A-60", Default = false }):AddColorPicker("ESPA60Color", { Default = Color3.fromRGB(255, 174, 116), Title = "Color" })
ESPEntities:AddToggle("ESPA120", { Text = "A-120", Default = false }):AddColorPicker("ESPA120Color", { Default = Color3.fromRGB(255, 174, 116), Title = "Color" })
ESPEntities:AddToggle("ESPBlitz", { Text = "Blitz", Default = false }):AddColorPicker("ESPBlitzColor", { Default = Color3.fromRGB(255, 174, 116), Title = "Color" })
ESPEntities:AddToggle("ESPEyes", { Text = "Eyes", Default = false }):AddColorPicker("ESPEyesColor", { Default = Color3.fromRGB(255, 174, 116), Title = "Color" })
ESPEntities:AddToggle("ESPLookman", { Text = "Lookman", Default = false }):AddColorPicker("ESPLookmanColor", { Default = Color3.fromRGB(255, 174, 116), Title = "Color" })
ESPEntities:AddToggle("ESPSnare", { Text = "Snare", Default = false }):AddColorPicker("ESPSnareColor", { Default = Color3.new(255, 174, 116), Title = "Color" })
ESPEntities:AddToggle("ESPWorldLotus", { Text = "World Lotus", Disabled = true, Default = false }):AddColorPicker("ESPWorldLotusColor", { Default = Color3.new(255, 174, 116), Title = "Color" })
ESPEntities:AddToggle("ESPBramble", { Text = "Bramble", Default = false }):AddColorPicker("ESPBrambleColor", { Default = Color3.new(255, 174, 116), Title = "Color" })
ESPEntities:AddToggle("ESPCaws", { Text = "Caws", Default = false }):AddColorPicker("ESPCawsColor", { Default = Color3.new(255, 174, 116), Title = "Color" })
ESPEntities:AddToggle("ESPEyestalk", { Text = "Eyestalk", Default = false }):AddColorPicker("ESPEyestalkColor", { Default = Color3.new(255, 174, 116), Title = "Color" })
ESPEntities:AddToggle("ESPGrampy", { Text = "Grampy", Default = false }):AddColorPicker("ESPGrampyColor", { Default = Color3.new(255, 174, 116), Title = "Color" })
ESPEntities:AddToggle("ESPGroundskeeper", { Text = "Groundskeeper", Default = false }):AddColorPicker("ESPGroundskeeperColor", { Default = Color3.new(255, 174, 116), Title = "Color" })
ESPEntities:AddToggle("ESPMandrake", { Text = "Mandrake", Default = false }):AddColorPicker("ESPMandrakeColor", { Default = Color3.new(255, 174, 116), Title = "Color" })
ESPEntities:AddToggle("ESPMonument", { Text = "Monument", Default = false }):AddColorPicker("ESPMonumentColor", { Default = Color3.new(255, 174, 116), Title = "Color" })
ESPEntities:AddToggle("ESPSurge", { Text = "Surge", Default = false }):AddColorPicker("ESPSurgeColor", { Default = Color3.new(255, 174, 116), Title = "Color" })

-- 实体ESP切换回调
Toggles.ESPGiggle:OnChanged(function(Value)
    if Value then
        ScanAndAddEntityESP("GiggleCeiling", "ESPGiggle", "ESPGiggleColor",
            function(v) return v.Root end,
            function(v) end,
            nil,
            function(v) return "Giggle" end)
    else
        for _, esp in pairs(EspTable.Entities) do
            if esp[2]:GetAttribute("Text") == "Giggle" then RemoveEspSmooth(esp[1].Adornee) end
        end
    end
end)

Toggles.ESPFigure:OnChanged(function(Value)
    if Value then
        ScanAndAddEntityESP("FigureRig", "ESPFigure", "ESPFigureColor",
            function(v) return v.Figure end,
            function(v) end,
            nil,
            function(v) return "Figure" end)
    else
        for _, esp in pairs(EspTable.Entities) do
            if esp[2]:GetAttribute("Text") == "Figure" then RemoveEspSmooth(esp[1].Adornee) end
        end
    end
end)

Toggles.ESPGrumble:OnChanged(function(Value)
    if Value then
        ScanAndAddEntityESP("GrumbleRig", "ESPGrumble", "ESPGrumbleColor",
            function(v) return v.Model end,
            function(v) end,
            nil,
            function(v) return "Grumble" end)
    else
        for _, esp in pairs(EspTable.Entities) do
            if esp[2]:GetAttribute("Text") == "Grumble" then RemoveEspSmooth(esp[1].Adornee) end
        end
    end
end)

Toggles.ESPGloombatSwarm:OnChanged(function(Value)
    if Value then
        ScanAndAddEntityESP("GloombatSwarm", "ESPGloombatSwarm", "ESPGloombatSwarmColor",
            function(v) return v end,
            function(v) end,
            nil,
            function(v) return "Gloombat Swarm" end)
    else
        for _, esp in pairs(EspTable.Entities) do
            if esp[2]:GetAttribute("Text") == "Gloombat Swarm" then RemoveEspSmooth(esp[1].Adornee) end
        end
    end
end)

Toggles.ESPDread:OnChanged(function(Value)
    if Value then
        ScanAndAddEntityESP("Dread", "ESPDread", "ESPDreadColor",
            function(v) return v.Main end,
            function(v) end,
            function(v)
                v:WaitForChild("Main")
                if not v:FindFirstChildOfClass("Humanoid") then
                    Instance.new("Humanoid", v)
                end
                v.Main.Transparency = 0.999
            end,
            function(v) return "Dread" end)
    else
        for _, esp in pairs(EspTable.Entities) do
            if esp[2]:GetAttribute("Text") == "Dread" then RemoveEspSmooth(esp[1].Adornee) end
        end
    end
end)

Toggles.ESPRush:OnChanged(function(Value)
    if Value then
        ScanAndAddEntityESP("RushMoving", "ESPRush", "ESPRushColor",
            function(v) return v end,
            function(v) end,
            nil,
            function(v) return "Rush" end)
    else
        for _, esp in pairs(EspTable.Entities) do
            if esp[2]:GetAttribute("Text") == "Rush" then RemoveEspSmooth(esp[1].Adornee) end
        end
    end
end)

Toggles.ESPMovingAmbush:OnChanged(function(Value)
    if Value then
        ScanAndAddEntityESP("AmbushMoving", "ESPMovingAmbush", "ESPMovingAmbushColor",
            function(v) return v end,
            function(v) end,
            nil,
            function(v) return "Ambush" end)
    else
        for _, esp in pairs(EspTable.Entities) do
            if esp[2]:GetAttribute("Text") == "Ambush" then RemoveEspSmooth(esp[1].Adornee) end
        end
    end
end)

Toggles.ESPA60:OnChanged(function(Value)
    if Value then
        ScanAndAddEntityESP("A60", "ESPA60", "ESPA60Color",
            function(v) return v end,
            function(v) end,
            nil,
            function(v) return "A-60" end)
    else
        for _, esp in pairs(EspTable.Entities) do
            if esp[2]:GetAttribute("Text") == "A-60" then RemoveEspSmooth(esp[1].Adornee) end
        end
    end
end)

Toggles.ESPA120:OnChanged(function(Value)
    if Value then
        ScanAndAddEntityESP("A120", "ESPA120", "ESPA120Color",
            function(v) return v end,
            function(v) end,
            nil,
            function(v) return "A-120" end)
    else
        for _, esp in pairs(EspTable.Entities) do
            if esp[2]:GetAttribute("Text") == "A-120" then RemoveEspSmooth(esp[1].Adornee) end
        end
    end
end)

Toggles.ESPBlitz:OnChanged(function(Value)
    if Value then
        ScanAndAddEntityESP("BackdoorRush", "ESPBlitz", "ESPBlitzColor",
            function(v) return v end,
            function(v) end,
            nil,
            function(v) return "Blitz" end)
    else
        for _, esp in pairs(EspTable.Entities) do
            if esp[2]:GetAttribute("Text") == "Blitz" then RemoveEspSmooth(esp[1].Adornee) end
        end
    end
end)

Toggles.ESPEyes:OnChanged(function(Value)
    if Value then
        ScanAndAddEntityESP("Eyes", "ESPEyes", "ESPEyesColor",
            function(v) return v end,
            function(v) end,
            nil,
            function(v) return "Eyes" end)
    else
        for _, esp in pairs(EspTable.Entities) do
            if esp[2]:GetAttribute("Text") == "Eyes" then RemoveEspSmooth(esp[1].Adornee) end
        end
    end
end)

Toggles.ESPLookman:OnChanged(function(Value)
    if Value then
        ScanAndAddEntityESP("BackdoorLookman", "ESPLookman", "ESPLookmanColor",
            function(v) return v.Eyes end,
            function(v) end,
            nil,
            function(v) return "Lookman" end)
    else
        for _, esp in pairs(EspTable.Entities) do
            if esp[2]:GetAttribute("Text") == "Lookman" then RemoveEspSmooth(esp[1].Adornee) end
        end
    end
end)

Toggles.ESPSnare:OnChanged(function(Value)
    if Value then
        ScanAndAddEntityESP("Snare", "ESPSnare", "ESPSnareColor",
            function(v) return v end,
            function(v) end,
            nil,
            function(v) return "Snare" end)
    else
        for _, esp in pairs(EspTable.Entities) do
            if esp[2]:GetAttribute("Text") == "Snare" then RemoveEspSmooth(esp[1].Adornee) end
        end
    end
end)

local ESPSettings = Tabs.Visuals:AddRightGroupbox("ESP设置")
ESPSettings:AddDropdown("ESPFont", {
    Values = { "Arial", "SourceSans", "Highway", "Fantasy", "Gotham", "DenkOne", "JosefinSans", "Nunito", "Oswald", "RobotoMono", "Sarpanch", "Ubuntu" },
    Default = 2,
    Multi = false,
    Text = "文本字体"
})
ESPSettings:AddSlider("ESPFontSize", { Text = "字体大小", Default = 20, Min = 10, Max = 32, Rounding = 0, Compact = true })
ESPSettings:AddSlider("ESPFillTransparency", { Text = "填充透明度", Default = 0.7, Min = 0, Max = 1, Rounding = 2, Compact = true })
ESPSettings:AddSlider("ESPOutlineTransparency", { Text = "轮廓透明度", Default = 0.2, Min = 0, Max = 1, Rounding = 2, Compact = true })
ESPSettings:AddSlider("ESPFadeTime", { Text = "Fade Time", Default = 1, Min = 0, Max = 2, Rounding = 2, Compact = true, Suffix = "s" })

-- Entities Tab: Notify and Anti
local NotifyGroup = Tabs.Entities:AddLeftGroupbox("实体通知")
local EntityNotifications = {
    ["Screech"] = {Description = "Screech已生成了！请注意!", Color = Color3.fromRGB(255, 255, 0)},
    ["Halt"] = {Description = "Halt已生成！注意halt位置", Color = Color3.fromRGB(0, 255, 255)},
    ["FigureRig"] = {Description = "Figure生成了!不要被他听到！", Color = Color3.fromRGB(255, 0, 0)},
    ["Eyes"] = {Description = "Eyes生成了！不要看他", Color = Color3.fromRGB(127, 30, 220)},
    ["SeekMoving"] = {Description = "Seek 生成了祝你好运runrunrun!", Color = Color3.fromRGB(255, 100, 100)},
    ["RushMoving"] = {Description = "Rush 生成了快去躲起来!", Color = Color3.fromRGB(0, 255, 0)},
    ["AmbushMoving"] = {Description = "Ambush 生成了快去躲起来", Color = Color3.fromRGB(80, 255, 110)},
    ["A60"] = {Description = "A-60 生成了快去躲起来!", Color = Color3.fromRGB(200, 50, 50)},
    ["A120"] = {Description = "A-120 生成了快去躲起来!", Color = Color3.fromRGB(55, 55, 55)},
    ["GiggleCeiling"] = {Description = "Giggle 生成了注意头顶!", Color = Color3.fromRGB(200, 200, 200)},
    ["GrumbleRig"] = {Description = "Grumble 生成了不要被他夹击!", Color = Color3.fromRGB(150, 150, 150)},
    ["GloombatSwarm"] = {Description = "Gloombat 生成了! 呆在灯光下!", Color = Color3.fromRGB(100, 100, 100)},
    ["Dread"] = {Description = "Dread 生成了注意时间!", Color = Color3.fromRGB(80, 80, 80)},
    ["BackdoorLookman"] = {Description = "Lookman 生成了! 不要看他", Color = Color3.fromRGB(110, 15, 15)},
    ["Snare"] = {Description = "Snare 生成了! 注意脚下!", Color = Color3.fromRGB(100, 100, 100)},
}

NotifyGroup:AddToggle("NotifyEntities", {
    Text = "实体生成时通知",
    Default = false,
    Callback = function(Value)
        if Value then
            AntiConnections["NotifyEntities"] = workspace.ChildAdded:Connect(function(child)
                if child:IsA("Model") and EntityNotifications[child.Name] and Toggles["Notify" .. child.Name].Value then
                    Library:Notify(EntityNotifications[child.Name].Description, 5)
                end
            end)
            AntiConnections["NotifyEntitiesRooms"] = Rooms.DescendantAdded:Connect(function(desc)
                if desc:IsA("Model") and EntityNotifications[desc.Name] and Toggles["Notify" .. desc.Name].Value then
                    Library:Notify(EntityNotifications[desc.Name].Description, 5)
                end
            end)
        else
            if AntiConnections["NotifyEntities"] then AntiConnections["NotifyEntities"]:Disconnect() end
            if AntiConnections["NotifyEntitiesRooms"] then AntiConnections["NotifyEntitiesRooms"]:Disconnect() end
        end
    end
})

NotifyGroup:AddToggle("NotifyScreech", { Text = "Screech", Default = true })
NotifyGroup:AddToggle("NotifyHalt", { Text = "Halt", Default = true })
NotifyGroup:AddToggle("NotifyFigureRig", { Text = "Figure", Default = true })
NotifyGroup:AddToggle("NotifyEyes", { Text = "Eyes", Default = true })
NotifyGroup:AddToggle("NotifySeekMoving", { Text = "Seek", Default = true })
NotifyGroup:AddToggle("NotifyRushMoving", { Text = "Rush", Default = true })
NotifyGroup:AddToggle("NotifyAmbushMoving", { Text = "Ambush", Default = true })
NotifyGroup:AddToggle("NotifyA60", { Text = "A-60", Default = true })
NotifyGroup:AddToggle("NotifyA120", { Text = "A-120", Default = true })
NotifyGroup:AddToggle("NotifyGiggleCeiling", { Text = "Giggle", Default = true })
NotifyGroup:AddToggle("NotifyGrumbleRig", { Text = "Grumble", Default = true })
NotifyGroup:AddToggle("NotifyGloombatSwarm", { Text = "Gloombat Swarm", Default = true })
NotifyGroup:AddToggle("NotifyDread", { Text = "Dread", Default = true })
NotifyGroup:AddToggle("NotifyBackdoorLookman", { Text = "Lookman", Default = true })
NotifyGroup:AddToggle("NotifySnare", { Text = "Snare", Default = true })

local AntiGroup = Tabs.Entities:AddRightGroupbox("移去实体")
AntiGroup:AddToggle("AntiScreech", {
    Text = "移去Screench",
    Default = false,
    Callback = function(Value)
        if Value then
            AntiConnections["Screech"] = workspace.ChildAdded:Connect(function(child)
                if child.Name == "Screech" then
                    child:Destroy()
                end
            end)
        else
            if AntiConnections["Screech"] then AntiConnections["Screech"]:Disconnect() end
        end
    end
})

AntiGroup:AddToggle("Noeyes", {
    Text = "防eyes",
    Default = false,
    Tooltip = "防eyes伤害",
    Callback = function(Value)
        _G.NoEyes = Value
        while _G.NoEyes do
            if workspace:FindFirstChild("Eyes") or workspace:FindFirstChild("BackdoorLookman") then
                if game:GetService("ReplicatedStorage"):FindFirstChild("RemotesFolder") then
                    game:GetService("ReplicatedStorage"):WaitForChild("RemotesFolder"):WaitForChild("MotorReplication"):FireServer(-649)
                end
            end
            task.wait()
        end
    end
})

AntiGroup:AddToggle("NoHasteEffects", {
    Text = "移去烟幕",
    Default = false,
    Tooltip = "Removes red edges when Haste appears.",
    Callback = function(Value)
        for _, v in workspace.CurrentCamera:GetChildren() do
            if v.Name == "LiveSanity" and workspace:FindFirstChild("EntityModel") then
                v.Enabled = not Value
            end
        end
    end
})

AntiGroup:AddToggle("NoHidingVignette", {
    Text = "避免隐藏边缘",
    Default = false,
    Tooltip = "Removes dark edges when hiding.",
    Callback = function(Value)
        LocalPlayer.PlayerGui.MainUI.MainFrame.HideVignette.Image = Value and "rbxassetid://0" or "rbxassetid://6100076320"
    end
})

AntiGroup:AddToggle("NoHaltEffects", {
    Text = "避免停止闪烁",
    Default = false,
    Tooltip = "Removes flashing in Halt rooms.",
    Callback = function(Value)
        if Value then
            AntiConnections["HaltEffects"] = Rooms.DescendantAdded:Connect(function(desc)
                if desc.Name == "Shade" then
                    desc:Destroy()
                end
            end)
        else
            if AntiConnections["HaltEffects"] then AntiConnections["HaltEffects"]:Disconnect() end
        end
    end
})

AntiGroup:AddToggle("AntiHalt", {
    Text = "移去 Halt",
    Default = false,
    Callback = function(Value)
        if Value then
            AntiConnections["Halt"] = Rooms.DescendantAdded:Connect(function(desc)
                if desc.Name == "Halt" then
                    desc:Destroy()
                end
            end)
        else
            if AntiConnections["Halt"] then AntiConnections["Halt"]:Disconnect() end
        end
    end
})

AntiGroup:AddToggle("AntiGiggle", {
    Text = "移去 Giggle",
    Default = false,
    Callback = function(Value)
        if Value then
            AntiConnections["Giggle"] = Rooms.DescendantAdded:Connect(function(desc)
                if desc.Name == "GiggleCeiling" then
                    desc:WaitForChild("Hitbox", 9e9)
                    desc.Hitbox.CanTouch = false
                end
            end)
            for _, Room in Rooms:GetChildren() do
                for _, Giggle in Room:GetChildren() do
                    if Giggle:IsA("Model") and Giggle.Name == "GiggleCeiling" then
                        Giggle:WaitForChild("Hitbox", 9e9)
                        Giggle.Hitbox.CanTouch = false
                    end
                end
            end
        else
            if AntiConnections["Giggle"] then
                AntiConnections["Giggle"]:Disconnect()
            end
            for _, Room in Rooms:GetChildren() do
                for _, Giggle in Room:GetChildren() do
                    if Giggle:IsA("Model") and Giggle.Name == "GiggleCeiling" then
                        Giggle:WaitForChild("Hitbox", 9e9)
                        Giggle.Hitbox.CanTouch = true
                    end
                end
            end
        end
    end
})

AntiGroup:AddToggle("AntiGloombat", {
    Text = "移去Gloombat Swarm效果",
    Default = false,
    Callback = function(Value)
        for _, v in game:GetService("Workspace").CurrentRooms:GetDescendants() do
            if v.Name == "GloomEgg" and v:IsA("Model") and v:FindFirstChild("Egg") then
                v.Egg.CanTouch = not Value
            end
        end
    end
})

game:GetService("Workspace").CurrentRooms.DescendantAdded:Connect(function(v)
    if v.Name == "GloomEgg" and v:IsA("Model") then
        v:WaitForChild("Egg", 9e9)
        v.Egg.CanTouch = not Toggles.AntiGloombat.Value
    end
end)

AntiGroup:AddToggle("AntiLookman", {
    Text = "移去 Lookman",
    Default = false,
    Callback = function(Value)
        if Value then
            AntiConnections["Lookman"] = workspace.ChildAdded:Connect(function(child)
                if child.Name == "BackdoorLookman" then
                    child:WaitForChild("Core", 9e9)
                    child.Core.CanTouch = false
                end
            end)
            for _, v in workspace:GetChildren() do
                if v.Name == "BackdoorLookman" and v:IsA("Model") then
                    v:WaitForChild("Core", 9e9)
                    v.Core.CanTouch = false
                end
            end
           
            local Main_Game = require(LocalPlayer.PlayerGui.MainUI.Initiator.Main_Game)
            Main_Game.forcecharlook(Vector3.new(0, -1, 0))
        else
            if AntiConnections["Lookman"] then AntiConnections["Lookman"]:Disconnect() end
            for _, v in workspace:GetChildren() do
                if v.Name == "BackdoorLookman" and v:IsA("Model") then
                    v:WaitForChild("Core", 9e9)
                    v.Core.CanTouch = true
                end
            end
           
            local Main_Game = require(LocalPlayer.PlayerGui.MainUI.Initiator.Main_Game)
            Main_Game.forcecharlook(Vector3.new(0, 0, 0))
        end
    end
})

AntiGroup:AddToggle("AntiSnare", {
    Text = "移去 Snare",
    Default = false,
    Callback = function(Value)
        for _, v in game:GetService("Workspace").CurrentRooms:GetDescendants() do
            if v.Name == "Snare" and v:FindFirstChild("Hitbox") then
                v.Hitbox.CanTouch = not Value
            end
        end
    end
})

AntiGroup:AddToggle("AntiDupe", {
    Text = "移去假门",
    Default = false,
    Callback = function(Value)
        for _, v in game:GetService("Workspace").CurrentRooms:GetDescendants() do
            if v.Name == "DoorFake" and v:IsA("Model") then
                if v:FindFirstChild("Hidden") then
                    v.Hidden.CanTouch = not Value
                end
                if v:FindFirstChild("LockPart") and v.LockPart:FindFirstChild("UnlockPrompt") then
                    v.LockPart.UnlockPrompt.Enabled = not Value
                end
            end
        end
    end
})

game:GetService("Workspace").CurrentRooms.DescendantAdded:Connect(function(v)
    if v.Name == "DoorFake" and v:IsA("Model") then
        v:WaitForChild("Hidden", 9e9)
        v.Hidden.CanTouch = not Toggles.AntiDupe.Value
        v:WaitForChild("LockPart", 2)
        if v:FindFirstChild("LockPart") and v.LockPart:FindFirstChild("UnlockPrompt") then
            v.LockPart.UnlockPrompt.Enabled = not Toggles.AntiDupe.Value
        end
    end
end)

AntiGroup:AddToggle("NoA90", { Text = "移去 A-90", Default = false, Tooltip = "Disables A-90 entirely." })
AntiGroup:AddToggle("NoA90Damage", { Text = "移去A-90伤害", Default = false, Tooltip = "Prevents A-90 from damaging you." })
AntiGroup:AddToggle("NoScreechDamage", { Text = "移去Screech伤害", Default = false, Tooltip = "Prevents Screech from damaging you." })
AntiGroup:AddToggle("NoHaltDamage", { Text = "移去Halt伤害", Default = false, Tooltip = "Prevents Halt from damaging you." })

local GeneralNotifying = Tabs.Entities:AddLeftGroupbox("其他消息")
GeneralNotifying:AddToggle("PadlockCode", { Text = "图书馆锁密码", Default = false, Tooltip = "Notifies when padlock codes are found." })
GeneralNotifying:AddSlider("NotificationOffsetX", { Text = "X位置偏移", Default = 0, Min = -1, Max = 1, Rounding = 2, Compact = true })
GeneralNotifying:AddSlider("NotificationOffsetY", { Text = "Y位置偏移", Default = 0, Min = -1, Max = 1, Rounding = 2, Compact = true })
GeneralNotifying:AddSlider("NotificationDPISize", { Text = "尺寸倍增", Default = 1, Min = 0.8, Max = 3, Rounding = 1, Compact = true })
GeneralNotifying:AddButton("测试", function()
    Library:Notify("这是一个测试通知", 2.5)
end)

local MiscAudio = Tabs.Misc:AddRightGroupbox("音频设置")
MiscAudio:AddToggle("SilentJammin", { Text = "把杰夫店里的音乐调成静音", Default = false, Tooltip = "Silences the music in Jeff's shop.", Callback = function(Value)
    LocalPlayer.PlayerGui.MainUI.Initiator.Main_Game.Health.Jam.Playing = not Value
    game.SoundService.Main.Jamming.Enabled = not Value
end })

MiscAudio:AddToggle("NoHasteSound", { Text = "静音急促音乐", Default = false, Tooltip = "Silences loud sounds when Haste appears." })

MiscAudio:AddToggle("SilentInteracting", { Text = "将交互声音静音", Default = false, Tooltip = "No sound when using prompts.", Callback = function(Value)
    LocalPlayer.PlayerGui.MainUI.Initiator.Main_Game.PromptService.Triggered.Volume = Value and 0 or 0.04
end })

MiscAudio:AddToggle("NoRandomAmbience", { Text = "静音随机音乐", Default = false, Tooltip = "Silences random ambient sounds." })

local HotelGroup = Tabs.Misc:AddLeftGroupbox("加入旧版酒店")
HotelGroup:AddButton({
    Text = "加入旧版酒店",
    Tooltip = "在传送到+门之前",
    Func = function()
        if game.PlaceId == 6516141723 then
            local args = {
                {
                    Mods = {"BeforePlus"},
                    Settings = {},
                    Destination = "Hotel",
                    FriendsOnly = false,
                    MaxPlayers = "1"
                }
            }
            game:GetService("ReplicatedStorage"):WaitForChild("RemotesFolder"):WaitForChild("CreateElevator"):FireServer(unpack(args))
            Library:Notify({
                Title = "传送",
                Description = "正在传送...",
                Time = 5,
                SoundId = 4590662766
            })
        else
            Library:Notify({
                Title = "传送",
                Description = "go to the lobby first",
                Time = 10,
                SoundId = 4590662766
            })
        end
    end
})

local ExploitTroll = Tabs.Misc:AddLeftGroupbox("钓鱼")
ExploitTroll:AddToggle("SpamTools", { Text = "移除玩家", Default = false, Tooltip = "Uses up other players' tools by spamming." }):AddKeyPicker("SpamToolsKey", { Default = "G", SyncToggleState = false, Mode = "Hold", Text = "spam", NoUI = false })
ExploitTroll:AddInput("WhitelistSpamTools", { Default = "", Numeric = false, Finished = true, ClearTextOnFocus = true, Text = "移出白名单", Callback = function(Value)
    -- Callback logic here
end })

-- The Rooms features
local RoomsGroup = Tabs.Misc:AddRightGroupbox("The Rooms")
RoomsGroup:AddCheckbox("AutoRooms", {
    Text = "自动rooms",
    Default = false,
    Disabled = false,
    Callback = function(enabled)
        local Players = game:GetService("Players")
        local RunService = game:GetService("RunService")
        local PathfindingService = game:GetService("PathfindingService")
        local ReplicatedStorage = game:GetService("ReplicatedStorage")
        local Workspace = game:GetService("Workspace")
        local player = Players.LocalPlayer
        local rooms = Workspace:WaitForChild("CurrentRooms")
        local gameData = ReplicatedStorage:WaitForChild("GameData")
        local floor = gameData:WaitForChild("Floor")
        local active = false
        local runner
        local clone
        local function stop()
            active = false
            if runner then
                runner:Disconnect()
                runner = nil
            end
            if clone and clone.Parent then
                clone:Destroy()
            end
            player:SetAttribute("运行中", false)
        end
        if not enabled then
            stop()
            return
        end
        player:SetAttribute("AutoRoomsActive", true)
        active = true
        if player.Character and player.Character:FindFirstChild("CollisionPart") then
            clone = player.Character.CollisionPart:Clone()
            clone.Name = "_AutoRoomsCollision"
            clone.Massless = true
            clone.Anchored = false
            clone.CanCollide = false
            clone.CanQuery = false
            clone.CustomPhysicalProperties = PhysicalProperties.new(0.01, 0.7, 0, 1, 1)
            clone.Parent = player.Character
        end
        local function findClosestLocker()
            local best, bestDist = nil, math.huge
            for _, obj in ipairs(rooms:GetDescendants()) do
                if obj.Name == "Rooms_Locker" or obj.Name == "Rooms_Locker_Fridge" then
                    if obj.PrimaryPart then
                        local dist = (player.Character.HumanoidRootPart.Position - obj.PrimaryPart.Position).Magnitude
                        if dist < bestDist then
                            best = obj
                            bestDist = dist
                        end
                    end
                end
            end
            return best
        end
        local function walkTo(target)
            local char = player.Character
            if not (char and char:FindFirstChild("HumanoidRootPart")) then return end
            local path = PathfindingService:CreatePath({
                AgentRadius = 2,
                AgentHeight = 1,
                AgentCanJump = false,
                WaypointSpacing = 5
            })
            path:ComputeAsync(char.HumanoidRootPart.Position, target.Position)
            if path.Status == Enum.PathStatus.Success then
                for _, waypoint in ipairs(path:GetWaypoints()) do
                    if not active then return end
                    char:FindFirstChildOfClass("Humanoid"):MoveTo(waypoint.Position)
                    char.Humanoid.MoveToFinished:Wait()
                end
            end
        end
        runner = RunService.Heartbeat:Connect(function()
            if not active then return end
            if floor.Value ~= "Rooms" then return stop() end
            if gameData.LatestRoom.Value >= 1000 then return stop() end
            local entity = Workspace:FindFirstChild("A60")
                or Workspace:FindFirstChild("A120")
                or Workspace:FindFirstChild("GlitchRush")
                or Workspace:FindFirstChild("GlitchAmbush")
            if entity and entity.PrimaryPart and entity.PrimaryPart.Position.Y > -6 then
                local locker = findClosestLocker()
                if locker and locker.PrimaryPart then
                    local hide = locker:FindFirstChild("HidePoint")
                    if not hide then
                        hide = Instance.new("Part")
                        hide.Name = "HidePoint"
                        hide.Anchored = true
                        hide.Transparency = 1
                        hide.CanCollide = false
                        hide.Position = locker.PrimaryPart.Position + locker.PrimaryPart.CFrame.LookVector * 7
                        hide.Parent = locker
                    end
                    walkTo(hide)
                    task.wait(0.1)
                    local prompt = locker:FindFirstChildOfClass("ProximityPrompt")
                    if prompt then
                        if fireproximityprompt then
                            fireproximityprompt(prompt)
                        else
                            prompt:InputHoldBegin()
                            prompt:InputHoldEnd()
                        end
                    end
                end
            else
                local currentRoom = gameData.LatestRoom.Value
                local door = rooms[currentRoom] and rooms[currentRoom]:FindFirstChild("Door", true)
                if door and door:FindFirstChild("Door") then
                    walkTo(door.Door)
                end
            end
        end)
    end
})

-- 即时互动功能
local InstantInteractGroup = Tabs.Misc:AddLeftGroupbox("即时互动")
InstantInteractGroup:AddToggle("NoCooldownProximity", {
    Text = "即时互动",
    Default = false,
    Callback = function(Value)
        _G.NoCooldownProximity = Value
        if _G.NoCooldownProximity == true then
            for i, v in pairs(workspace:GetDescendants()) do
                if v.ClassName == "ProximityPrompt" then
                    v.HoldDuration = 0
                end
            end
            CooldownProximity = workspace.DescendantAdded:Connect(function(Cooldown)
                if _G.NoCooldownProximity == true then
                    if Cooldown:IsA("ProximityPrompt") then
                        Cooldown.HoldDuration = 0
                    end
                end
            end)
        else
            if CooldownProximity then
                CooldownProximity:Disconnect()
                CooldownProximity = nil
            end
        end
        Library:Notify({
            Title = "doors",
            Content = Value and "已开启即时互动" or "已关闭即时互动",
            Icon = Value and "check" or "x",
            IconThemed = true,
            Duration = 5,
        })
    end
})

-- 自动互动功能
_G.Aura = {
    "ActivateEventPrompt",
    "AwesomePrompt",
    "FusesPrompt",
    "HerbPrompt",
    "LeverPrompt",
    "LootPrompt",
    "ModulePrompt",
    "SkullPrompt",
    "UnlockPrompt",
    "ValvePrompt",
}

local AutoInteractGroup = Tabs.Misc:AddLeftGroupbox("自动互动")
AutoInteractGroup:AddToggle("AutoLoot", {
    Text = "自动互动",
    Default = false,
    Callback = function(Value)
        _G.AutoLoot = Value
        if _G.AutoLoot then
            lootables = {}
            local function LootCheck(v)
                if not table.find(lootables, v) and v.Name ~= "Groundskeeper" and v:IsA("ProximityPrompt") and table.find(_G.Aura, v.Name) then
                    table.insert(lootables, v)
                end
            end
            for _, v in ipairs(workspace:GetDescendants()) do
                if v:IsA("ProximityPrompt") then
                    LootCheck(v)
                end
            end
            ChildAllNext = workspace.DescendantAdded:Connect(function(v)
                if v:IsA("ProximityPrompt") then
                    LootCheck(v)
                end
            end)
            RemoveChild = workspace.DescendantRemoving:Connect(function(v)
                for i = #lootables, 1, -1 do
                    if lootables[i] == v then
                        table.remove(lootables, i)
                        break
                    end
                end
            end)
        else
            if ChildAllNext then
                ChildAllNext:Disconnect()
                ChildAllNext = nil
            end
            if RemoveChild then
                RemoveChild:Disconnect()
                RemoveChild = nil
            end
        end
        while _G.AutoLoot do
            for i, v in pairs(lootables) do
                if v:IsA("ProximityPrompt") and table.find(_G.Aura, v.Name) and (v:GetAttribute("Interactions") == nil or v:GetAttribute("Interactions") <= 2) then
                    if Distance(v.Parent:GetPivot().Position) <= 12 then
                        fireproximityprompt(v)
                    end
                end
            end
            task.wait(0.1)
        end
    end
})

if LocalPlayer.Character:FindFirstChild("CollisionPart") then
    ClonedCollision = LocalPlayer.Character.CollisionPart:Clone()
    ClonedCollision.Name = "_CollisionClone"
    ClonedCollision.Massless = true
    ClonedCollision.Parent = LocalPlayer.Character
    ClonedCollision.CanCollide = false
    ClonedCollision.CanQuery = false
    ClonedCollision.CustomPhysicalProperties = PhysicalProperties.new(0.01, 0.7, 0, 1, 1)
end

task.spawn(function()
    while task.wait(0.23) and not Unloaded do
        if Toggles.SpeedBypass.Value and ClonedCollision then
            ClonedCollision.Massless = false
            task.wait(0.23)
            if LocalPlayer.Character.HumanoidRootPart.Anchored then
                ClonedCollision.Massless = true
                task.wait(1)
            end
            ClonedCollision.Massless = true
        end
    end
end)

local MovementScript = LocalPlayer.PlayerGui.MainUI.Initiator.Main_Game.Movement
local env = getsenv(MovementScript)
local updatespeed = env.updatespeed
local OldUpdateSpeed; OldUpdateSpeed = hookfunction(updatespeed, function(...)
    OldUpdateSpeed(...)
    local Speed = LocalPlayer.Character.Humanoid.WalkSpeed
    if Toggles.WalkspeedModifier.Value then
        Speed = Options.WalkspeedAmount.Value
    end
    LocalPlayer.Character.Humanoid.WalkSpeed = Speed
end)

-- 修复：添加缺失的变量和函数
local CanJump = LocalPlayer.Character:GetAttribute("CanJump") or false

-- 修复：添加table.find函数（如果不存在）
if not table.find then
    table.find = function(t, value)
        for i, v in ipairs(t) do
            if v == value then
                return i
            end
        end
        return nil
    end
end

-- 修复：添加Color3.fromRGB函数（如果不存在）
if not Color3.fromRGB then
    Color3.fromRGB = function(r, g, b)
        return Color3.new(r/255, g/255, b/255)
    end
end

local SaveManager = Library.SaveManager
local ThemeManager = Library.ThemeManager

SaveManager:SetLibrary(Library)
SaveManager:IgnoreThemeSettings()
SaveManager:SetFolder("velocityx_configs")
SaveManager:BuildConfigSection(Tabs.UISettings)

ThemeManager:SetLibrary(Library)
ThemeManager:SetFolder("velocityx_themes")
ThemeManager:BuildThemeSection(Tabs.UISettings)

local UISettingsGroup = Tabs.UISettings:AddLeftGroupbox("UI Management")
UISettingsGroup:AddButton("Unload", function()
    for toggleName, toggle in pairs(Toggles) do
        if toggle.Value then
            toggle.Value = false
        end
    end
    
    for _, conn in pairs(AntiConnections) do
        if conn then
            conn:Disconnect()
        end
    end
    
    stopFly()
    clearAllDoorESPs()
    
    for category, subs in pairs(EspTable) do
        if type(subs) == "table" then
            for sub, esps in pairs(subs) do
                if type(esps) == "table" then
                    for _, esp in pairs(esps) do
                        if esp[1] then esp[1]:Destroy() end
                        if esp[2] then esp[2]:Destroy() end
                    end
                end
            end
        end
    end
    
    game.Lighting.Brightness = oldBrightness
    game.Lighting.ClockTime = oldClockTime
    game.Lighting.FogEnd = oldFogEnd
    game.Lighting.GlobalShadows = oldGlobalShadows
    game.Lighting.Ambient = oldAmbient
    Unloaded = true
    Library:Unload()
end)

-- 内存优化：定期垃圾回收
task.spawn(function()
    while not Unloaded do
        task.wait(30)
        collectgarbage("step")
    end
end)
        Library:Notify("Old Winter DOORS 已加载", 3)
    end
})

ScriptLeftGroup:AddButton({
    Text = "Old Winter Forsken",
    Func = function()
        


local repo = 'https://raw.githubusercontent.com/deividcomsono/Obsidian/main/'

local Library = loadstring(game:HttpGet(repo .. 'Library.lua'))()
local ThemeManager = loadstring(game:HttpGet(repo .. 'addons/ThemeManager.lua'))()
local SaveManager = loadstring(game:HttpGet(repo .. 'addons/SaveManager.lua'))()
local Options = Library.Options
local Toggles = Library.Toggles
Library.ShowToggleFrameInKeybinds = true 
Library.ShowCustomCursor = true
Library.NotifySide = "Right"

local Window = Library:CreateWindow({
	Title = ' Old Winter Forsken',
	Footer = "XiaoXu | FORSKEN",
    Icon = 132702574859512,
	Center = true,
	AutoShow = true,
	Resizable = true,
	ShowCustomCursor = true,
	NotifySide = "Right",
	TabPadding = 8,
	MenuFadeTime = 0
})


local Tabs = {
    new = Window:AddTab('公告', 'person-standing'),
	Main = Window:AddTab('杂项','house'),
	Bro = Window:AddTab('战斗','biohazard'),
	zdx = Window:AddTab('修机','printer'),
	Sat = Window:AddTab('体力','zap'),
	Esp = Window:AddTab('绘制','eye'),
	Aimbot = Window:AddTab('自瞄','crosshair'),
	tzq = Window:AddTab('通知','mails'),
	ani = Window:AddTab('反效果','cpu'),
   ["UI Settings"] = Window:AddTab('UI 调试', 'settings')
	
}


local _env = getgenv and getgenv() or {}
local _hrp = game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart")

local new = Tabs.new:AddRightGroupbox('群组')



new:AddButton({
	Text = "复制QQ群号[WU主群]",
	Func = function()
		setclipboard("1053715085")
	end,
	DoubleClick = false,

	Tooltip = "This is the main button",
	DisabledTooltip = "I am disabled!",

	Disabled = false, 
	Visible = true, 
	Risky = false, 
})

new:AddButton({
	Text = "复制QQ群号[NOL主群]",
	Func = function()
		setclipboard("819518685")
	end,
	DoubleClick = false,

	Tooltip = "This is the main button",
	DisabledTooltip = "I am disabled!",

	Disabled = false, 
	Visible = true, 
	Risky = false, 
})



local new = Tabs.new:AddLeftGroupbox('公告')

new:AddLabel("XiaoXu&UnicoX")
new:AddLabel("FORSAKEN")







local MainTabbox = Tabs.Main:AddRightTabbox()
local Lighting = MainTabbox:AddTab("亮度")

Lighting:AddSlider("B",{
    Text = "亮度",
    Min = 0,
    Default = 0,
    Max = 3,
    Rounding = 1,
    Compact = true,
    Callback = function(v)
        _env.Brightness = v
    end
})

Lighting:AddToggle("无阴影",{
    Text = "无阴影",
    Default = false,
    Callback = function(v)
        _env.GlobalShadows = v
    end
})

Lighting:AddToggle("除雾",{
    Text = "无雾",
    Default = false,
    Callback = function(v)
        _env.NoFog = v
    end
})

Lighting:AddDivider()

Lighting:AddToggle("启用功能",{
    Text = "启用",
    Default = false,
    Callback = function(v)
        _env.Fullbright = v
        game:GetService("RunService").RenderStepped:Connect(function()
            if not game.Lighting:GetAttribute("FogStart") then 
                game.Lighting:SetAttribute("FogStart", game.Lighting.FogStart) 
            end
            if not game.Lighting:GetAttribute("FogEnd") then 
                game.Lighting:SetAttribute("FogEnd", game.Lighting.FogEnd) 
            end
            game.Lighting.FogStart = _env.NoFog and 0 or game.Lighting:GetAttribute("FogStart")
            game.Lighting.FogEnd = _env.NoFog and math.huge or game.Lighting:GetAttribute("FogEnd")
            
            local fog = game.Lighting:FindFirstChildOfClass("Atmosphere")
            if fog then
                if not fog:GetAttribute("Density") then 
                    fog:SetAttribute("Density", fog.Density) 
                end
                fog.Density = _env.NoFog and 0 or fog:GetAttribute("Density")
            end
            
            if _env.Fullbright then
                game.Lighting.OutdoorAmbient = Color3.new(1,1,1)
                game.Lighting.Brightness = _env.Brightness or 0
                game.Lighting.GlobalShadows = not _env.GlobalShadows
            else
                game.Lighting.OutdoorAmbient = Color3.fromRGB(55,55,55)
                game.Lighting.Brightness = 0
                game.Lighting.GlobalShadows = true
            end
        end)
    end
    
})

local KillerSurvival = Tabs.Main:AddLeftGroupbox("显示聊天框")

KillerSurvival:AddToggle('MyToggle', {
    Text = '显示聊天框 | 一局一开',
    Default = false,
    Tooltip = 'Display chat box',
    Callback = function(state)
    if state then
    game.TextChatService.ChatWindowConfiguration.Enabled = true
    else
    game.TextChatService.ChatWindowConfiguration.Enabled = false    
    end
    end
})

local AntiBanSection = Tabs.Main:AddLeftGroupbox("Anti Cheat")

do
    local Players = game:GetService("Players")
    local LocalPlayer = Players.LocalPlayer
    local LocalizationService = game:GetService("LocalizationService")
    local RunService = game:GetService("RunService")

    shared.AntiBanSafe = shared.AntiBanSafe or {running = false, hooks = {}}
    local data = shared.AntiBanSafe

    local oldNamecall, oldIndex
    local protectionThread

    -- 初始化hooks表
    data.hooks = data.hooks or {
        requestHooked = false,
        findHooked = false,
        bypassHooked = false
    }

    local function safe(func, ...)
        local ok, res = pcall(func, ...)
        if ok then return res end
        return nil
    end

    local function disableReportFlags()
        if type(setfflag) == "function" then
            pcall(function()
                setfflag("AbuseReportScreenshot", "False")
                setfflag("AbuseReportScreenshotPercentage", "0")
                setfflag("AbuseReportEnabled", "False")
                setfflag("ReportAbuseMenu", "False")
                setfflag("EnableAbuseReportScreenshot", "False")
                setfflag("AbuseReportVideo", "False")
                setfflag("AbuseReportVideoPercentage", "0")
                setfflag("VideoCaptureEnabled", "False")
                setfflag("RecordVideo", "False")
            end)
        end
    end

    local function hookRequests()
        if data.hooks.requestHooked then return true end
        
        local oldRequest = (syn and syn.request) or (request and request) or (http_request and http_request)
        if type(oldRequest) == "function" and type(hookfunction) == "function" then
            local success = pcall(function()
                hookfunction(oldRequest, function(req)
                    if req and req.Url and tostring(req.Url):lower():find("abuse") then
                        return {StatusCode = 200, Body = "Blocked"}
                    end
                    return oldRequest(req)
                end)
            end)
            
            if success then
                data.hooks.requestHooked = true
                return true
            end
        end
        return false
    end

    local function hookFindFirstChild()
        if data.hooks.findHooked then return true end
        
        local oldFind = workspace.FindFirstChild
        if type(oldFind) == "function" and type(hookfunction) == "function" then
            local success = pcall(function()
                hookfunction(oldFind, function(self, name, ...)
                    if checkcaller and checkcaller() then 
                        return oldFind(self, name, ...) 
                    end
                    if name and tostring(name):lower():find("screenshot") then 
                        return nil 
                    end
                    if name and tostring(name):lower():find("video") then 
                        return nil 
                    end
                    return oldFind(self, name, ...)
                end)
            end)
            
            if success then
                data.hooks.findHooked = true
                return true
            end
        end
        return false
    end

    local function setupMetatableHooks()
        if data.hooks.bypassHooked then return true end
        
        if getrawmetatable and hookmetamethod and newcclosure then
            local success = pcall(function()
                local mt = getrawmetatable(game)
                if not mt then return false end
                
                setreadonly(mt, false)
                
                -- 保存原始方法
                oldNamecall = oldNamecall or mt.__namecall
                oldIndex = oldIndex or mt.__index

                -- 设置namecall hook
                mt.__namecall = newcclosure(function(self, ...)
                    if checkcaller and checkcaller() then
                        return oldNamecall(self, ...)
                    end
                    
                    local method = getnamecallmethod()
                    local args = {...}

                    if (method == "Kick" or method == "Ban") and self == LocalPlayer then 
                        return nil 
                    end

                    if (method == "FireServer" or method == "InvokeServer") and args[1] then
                        local msg = tostring(args[1]):lower()
                        if msg:find("kick") or msg:find("ban") or msg:find("report") then 
                            return nil 
                        end
                    end

                    if self == LocalizationService and method == "GetCountryRegionForPlayerAsync" then
                        local success, result = pcall(function()
                            return LocalizationService:GetCountryRegionForPlayerAsync(LocalPlayer)
                        end)
                        if success then return result else return "US" end
                    end

                    return oldNamecall(self, ...)
                end)

                -- 设置index hook
                mt.__index = newcclosure(function(t, k)
                    if checkcaller and checkcaller() then
                        return oldIndex(t, k)
                    end
                    
                    local key = tostring(k):lower()
                    if key:find("kick") or key:find("ban") or key:find("report") then 
                        return function() return nil end 
                    end
                    return oldIndex(t, k)
                end)

                setreadonly(mt, true)
            end)
            
            if success then
                data.hooks.bypassHooked = true
                return true
            end
        end
        return false
    end

    local function restoreMetatableHooks()
        if getrawmetatable and oldNamecall and oldIndex then
            pcall(function()
                local mt = getrawmetatable(game)
                if mt then
                    setreadonly(mt, false)
                    mt.__namecall = oldNamecall
                    mt.__index = oldIndex
                    setreadonly(mt, true)
                end
            end)
        end
    end

    local function startProtectionLoop()
        if protectionThread then
            task.cancel(protectionThread)
        end
        
        protectionThread = task.spawn(function()
            local lastCheck = os.clock()
            local checkCount = 0
            
            while data.running do
                local currentTime = os.clock()
                
                -- 每2秒执行一次完整的flag检查
                if currentTime - lastCheck >= 2 then
                    disableReportFlags()
                    lastCheck = currentTime
                    checkCount = checkCount + 1
                    
                    -- 每10次检查（20秒）输出一次调试信息
                    if checkCount % 10 == 0 then
                        print(string.format("[AntiCheat] Protection loop running - Check #%d", checkCount))
                    end
                end
                
                -- 使用小延迟避免占用过多CPU
                task.wait(0.1)
            end
            print("[AntiCheat] Protection loop stopped")
        end)
    end

    local function startAntiBanSafe()
        if data.running then 
            Library:Notify("Anti Cheat | Info\n反作弊绕过已在运行中")
            return true
        end
        
        -- 检查必要的exploit函数
        if not (getrawmetatable and hookmetamethod and newcclosure) then
            Library:Notify("Exploit不支持必要的函数")
            return false
        end

        data.running = true

        -- 异步执行避免卡顿
        task.spawn(function()
            local hooksApplied = 0
            local totalHooks = 3
            
            -- 应用hooks
            if hookRequests() then hooksApplied = hooksApplied + 1 end
            if hookFindFirstChild() then hooksApplied = hooksApplied + 1 end
            if setupMetatableHooks() then hooksApplied = hooksApplied + 1 end
            
            -- 启动保护循环
            startProtectionLoop()

            if hooksApplied > 0 then
                Library:Notify(string.format("Anti Cheat | Success\n绕过反作弊已开启！(%d/%d hooks)", hooksApplied, totalHooks))
                print("[AntiCheat] Anti-ban protection activated successfully")
            else
                Library:Notify("Anti Cheat | Warning\n部分hook应用失败")
            end
        end)
        
        return true
    end

    local function stopAntiBanSafe()
        if not data.running then return end
        
        print("[AntiCheat] Stopping anti-ban protection...")
        data.running = false
        
        -- 停止保护线程
        if protectionThread then
            task.cancel(protectionThread)
            protectionThread = nil
        end
        
        -- 异步恢复hooks
        task.spawn(function()
            restoreMetatableHooks()
            
            -- 重置hook状态
            data.hooks.requestHooked = false
            data.hooks.findHooked = false
            data.hooks.bypassHooked = false
            oldNamecall = nil
            oldIndex = nil
            
            Library:Notify("Anti Cheat | Info\n反作弊绕过已关闭")
            print("[AntiCheat] Anti-ban protection fully stopped")
        end)
    end

    local function toggleAntiBan(enabled)
        if enabled then
            return startAntiBanSafe()
        else
            stopAntiBanSafe()
            return true
        end
    end

    
    AntiBanSection:AddToggle("AntiBanToggle", {
        Text = "绕过AC",
        Default = data.running or false,
        Callback = function(enabled)
            local success = toggleAntiBan(enabled)
            if not success and enabled then
           
                task.spawn(function()
                    wait(0.1)
                    if AntiBanSection:GetToggle("AntiBanToggle") then
                        AntiBanSection:GetToggle("AntiBanToggle"):SetValue(false)
                    end
                end)
            end
        end
    })

   
    if data.running then
        task.spawn(function()
            wait(1)
            if AntiBanSection:GetToggle("AntiBanToggle") then
                AntiBanSection:GetToggle("AntiBanToggle"):SetValue(true)
                print("[AntiCheat] Restored previous anti-ban protection state")
            end
        end)
    end

  
    print(string.format("[AntiCheat] Initialized - Running: %s", tostring(data.running)))
end




do
    local Players = game:GetService("Players")
    local LocalPlayer = Players.LocalPlayer
    local LocalizationService = game:GetService("LocalizationService")

    shared.AntiBanSafe = shared.AntiBanSafe or {running = false, hooks = {}}
    local data = shared.AntiBanSafe

    local oldNamecall, oldIndex
    local protectionThread

    local function safe(func, ...)
        local ok, res = pcall(func, ...)
        if ok then return res end
    end

    local function disableReportFlags()
        if typeof(setfflag) == "function" then
            pcall(function()
                setfflag("AbuseReportScreenshot", "False")
                setfflag("AbuseReportScreenshotPercentage", "0")
                setfflag("AbuseReportEnabled", "False")
                setfflag("ReportAbuseMenu", "False")
                setfflag("EnableAbuseReportScreenshot", "False")
                setfflag("AbuseReportVideo", "False")
                setfflag("AbuseReportVideoPercentage", "0")
                setfflag("VideoCaptureEnabled", "False")
                setfflag("RecordVideo", "False")
            end)
        end
    end

    local function setFlagsOn()
        if typeof(setfflag) == "function" then
            pcall(function()
                setfflag("AbuseReportScreenshot", "True")
                setfflag("AbuseReportScreenshotPercentage", "100")
            end)
        end
    end

    local function hookRequests()
        if data.hooks.requestHooked then return end
        local oldRequest = (syn and syn.request) or request or http_request
        if typeof(oldRequest) == "function" and typeof(hookfunction) == "function" then
            hookfunction(oldRequest, function(req)
                if req and req.Url and tostring(req.Url):lower():find("abuse") then
                    return {StatusCode = 200, Body = "Blocked"}
                end
                return oldRequest(req)
            end)
            data.hooks.requestHooked = true
        end
    end

    local function hookFindFirstChild()
        if data.hooks.findHooked then return end
        local oldFind = workspace.FindFirstChild
        if typeof(oldFind) == "function" and typeof(hookfunction) == "function" then
            hookfunction(oldFind, function(self, name, ...)
                if name and tostring(name):lower():find("screenshot") then return nil end
                if name and tostring(name):lower():find("video") then return nil end
                return oldFind(self, name, ...)
            end)
            data.hooks.findHooked = true
        end
    end

    local function safeBypass()
        if getrawmetatable and hookmetamethod and newcclosure then
            local mt = getrawmetatable(game)
            setreadonly(mt, false)
            oldNamecall = oldNamecall or mt.__namecall
            oldIndex = oldIndex or mt.__index

            mt.__namecall = newcclosure(function(self, ...)
                local method = getnamecallmethod()
                local args = {...}

                if (method == "Kick" or method == "Ban") and self == LocalPlayer then return nil end

                if (method == "FireServer" or method == "InvokeServer") and args[1] then
                    local msg = tostring(args[1]):lower()
                    if msg:find("kick") or msg:find("ban") then return nil end
                end

                if self == LocalizationService and method == "GetCountryRegionForPlayerAsync" then
                    local success, result = pcall(function()
                        return LocalizationService:GetCountryRegionForPlayerAsync(LocalPlayer)
                    end)
                    if success then return result else return "US" end
                end

                return oldNamecall(self, ...)
            end)

            mt.__index = newcclosure(function(t, k)
                local key = tostring(k):lower()
                if key:find("kick") or key:find("ban") then return function() return nil end end
                return oldIndex(t, k)
            end)

            setreadonly(mt, true)
        end
    end

    local function restoreHooks()
        if getrawmetatable then
            local mt = getrawmetatable(game)
            setreadonly(mt, false)
            if oldNamecall then mt.__namecall = oldNamecall end
            if oldIndex then mt.__index = oldIndex end
            setreadonly(mt, true)
            oldNamecall, oldIndex = nil, nil
        end
    end

    local function startAntiBanSafe()
        if data.running then return end
        data.running = true

        safe(hookRequests)
        safe(hookFindFirstChild)
        safe(safeBypass)

        protectionThread = task.spawn(function()
            while data.running do
                safe(disableReportFlags)
                task.wait(0.2)
            end
        end)
    end

    local function stopAntiBanSafe()
        data.running = false
        protectionThread = nil
        restoreHooks()
        setFlagsOn()
    end

    AntiBanSection:AddToggle("AntiBanV3", {
        Text = "Anti Ban",
        Description = "保护您免受封禁和举报",
        Default = false,
        Callback = function(state)
            if state then
                startAntiBanSafe()
            else
                stopAntiBanSafe()
            end
        end
    })
end


local ZZ = Tabs.Main:AddLeftGroupbox('绕过飞行')

local CFSpeed = 50
local CFLoop = nil

local function StartCFly()
    local speaker = game.Players.LocalPlayer
    local character = speaker.Character
    if not character then return end
    
    local humanoid = character:FindFirstChildOfClass('Humanoid')
    local head = character:WaitForChild("Head")
    
    if not humanoid or not head then return end
    
    humanoid.PlatformStand = true
    head.Anchored = true
    
    if CFLoop then 
        CFLoop:Disconnect() 
        CFLoop = nil
    end
    
    CFLoop = RunService.Heartbeat:Connect(function(deltaTime)
        if not character or not humanoid or not head then 
            if CFLoop then 
                CFLoop:Disconnect() 
                CFLoop = nil
            end
            return 
        end
        
        local moveDirection = humanoid.MoveDirection * (CFSpeed * deltaTime)
        local headCFrame = head.CFrame
        local camera = workspace.CurrentCamera
        local cameraCFrame = camera.CFrame
        local cameraOffset = headCFrame:ToObjectSpace(cameraCFrame).Position
        cameraCFrame = cameraCFrame * CFrame.new(-cameraOffset.X, -cameraOffset.Y, -cameraOffset.Z + 1)
        local cameraPosition = cameraCFrame.Position
        local headPosition = headCFrame.Position

        local objectSpaceVelocity = CFrame.new(cameraPosition, Vector3.new(headPosition.X, cameraPosition.Y, headPosition.Z)):VectorToObjectSpace(moveDirection)
        head.CFrame = CFrame.new(headPosition) * (cameraCFrame - cameraPosition) * CFrame.new(objectSpaceVelocity)
    end)
end

local function StopCFly()
    local speaker = game.Players.LocalPlayer
    local character = speaker.Character
    
    if CFLoop then
        CFLoop:Disconnect()
        CFLoop = nil
    end
    
    if character then
        local humanoid = character:FindFirstChildOfClass('Humanoid')
        local head = character:FindFirstChild("Head")
        
        if humanoid then
            humanoid.PlatformStand = false
        end
        if head then
            head.Anchored = false
        end
    end
end

ZZ:AddToggle("CFlyToggle", {
    Text = "飞行",
    Default = false,
    Callback = function(Value)
        if Value then
            StartCFly()
        else
            StopCFly()
        end
    end
})

ZZ:AddSlider("CFlySpeed", {
    Text = "飞行速度",
    Default = 50,
    Min = 1,
    Max = 200,
    Rounding = 1,
    Callback = function(Value)
        CFSpeed = Value
    end
})


local FunGroup = Tabs.Main:AddRightGroupbox("后空翻")

local ff_connection = nil
local ff_enabled = false
local ff_cd = false
local jumpHeight = 72  -- 默认高度: 6 * 12 = 72
local jumpDistance = 35  -- 默认距离

local function Flip()
    if ff_cd then
        return
    end
    ff_cd = true
    local character = game.Players.LocalPlayer.Character
    if not character then
        ff_cd = false
        return
    end
    local hrp = character:FindFirstChild("HumanoidRootPart")
    local Humanoid = character:FindFirstChildOfClass("Humanoid")
    local animator = Humanoid and Humanoid:FindFirstChildOfClass("Animator")
    if not hrp or not Humanoid then
        ff_cd = false
        return
    end
    local savedTracks = {}
    if animator then
        for _, track in ipairs(animator:GetPlayingAnimationTracks()) do
            savedTracks[#savedTracks + 1] = { track = track, time = track.TimePosition }
            track:Stop(0)
        end
    end
    Humanoid:ChangeState(Enum.HumanoidStateType.Physics)
    Humanoid:SetStateEnabled(Enum.HumanoidStateType.FallingDown, false)
    Humanoid:SetStateEnabled(Enum.HumanoidStateType.Freefall, false)
    Humanoid:SetStateEnabled(Enum.HumanoidStateType.Running, false)
    Humanoid:SetStateEnabled(Enum.HumanoidStateType.Seated, false)
    Humanoid:SetStateEnabled(Enum.HumanoidStateType.Climbing, false)
    local duration = 0.45
    local steps = 120
    local startCFrame = hrp.CFrame
    local forwardVector = startCFrame.LookVector
    local upVector = Vector3.new(0, 1, 0)
    task.spawn(function()
        local startTime = tick()
        for i = 1, steps do
            local t = i / steps
            local height = jumpHeight * (t - t ^ 2)  -- 使用滑块调节的高度
            local nextPos = startCFrame.Position + forwardVector * (jumpDistance * t) + upVector * height    
            local rotation = startCFrame.Rotation * CFrame.Angles(-math.rad(i * (360 / steps)), 0, 0)

            hrp.CFrame = CFrame.new(nextPos) * rotation
            local elapsedTime = tick() - startTime
            local expectedTime = (duration / steps) * i
            local waitTime = expectedTime - elapsedTime
            if waitTime > 0 then
                task.wait(waitTime)
            end
        end

        hrp.CFrame = CFrame.new(startCFrame.Position + forwardVector * jumpDistance) * startCFrame.Rotation
        Humanoid:SetStateEnabled(Enum.HumanoidStateType.FallingDown, true)
        Humanoid:SetStateEnabled(Enum.HumanoidStateType.Freefall, true)
        Humanoid:SetStateEnabled(Enum.HumanoidStateType.Running, true)
        Humanoid:SetStateEnabled(Enum.HumanoidStateType.Seated, true)
        Humanoid:SetStateEnabled(Enum.HumanoidStateType.Climbing, true)
        Humanoid:ChangeState(Enum.HumanoidStateType.Running)

        if animator then
            for _, data in ipairs(savedTracks) do
                local track = data.track
                track:Play()
                track.TimePosition = data.time
            end
        end
        task.wait(0.25)
        ff_cd = false
    end)
end

local sausageHolder = nil
local originalSize = nil
local ff_button = nil

local function SetFrontFlip(bool)
    ff_enabled = bool
    if ff_enabled == true then
        pcall(function()
            sausageHolder = game.CoreGui.TopBarApp.TopBarApp.UnibarLeftFrame.UnibarMenu["2"]
            originalSize = sausageHolder.Size.X.Offset
            ff_button = Instance.new("Frame", sausageHolder)
            ff_button.Size = UDim2.new(0, 48, 0, 44)
            ff_button.BackgroundTransparency = 1
            ff_button.BorderSizePixel = 0
            ff_button.Position = UDim2.new(0, sausageHolder.Size.X.Offset - 48, 0, 0)
            
            local imageButton = Instance.new("ImageButton", ff_button)
            imageButton.BackgroundTransparency = 1
            imageButton.BorderSizePixel = 0
            imageButton.Size = UDim2.new(0, 36, 0, 36)
            imageButton.AnchorPoint = Vector2.new(0.5, 0.5)
            imageButton.Position = UDim2.new(0.5, 0, 0.5, 0)
            imageButton.Image = "rbxthumb://type=Asset&id=2714338264&w=150&h=150"
            
            ff_connection = imageButton.Activated:Connect(Flip)
            sausageHolder.Size = UDim2.new(0, originalSize + 48, 0, sausageHolder.Size.Y.Offset)
            task.wait()
            ff_button.Position = UDim2.new(0, sausageHolder.Size.X.Offset - 48, 0, 0)
            
            task.spawn(function()
                pcall(function()
                    repeat
                        sausageHolder.Size = UDim2.new(0, originalSize + 48, 0, sausageHolder.Size.Y.Offset)
                        task.wait()
                        ff_button.Position = UDim2.new(0, sausageHolder.Size.X.Offset - 48, 0, 0)
                    until ff_enabled == false
                end)
            end)
        end)
    elseif ff_enabled == false then
        if ff_connection then
            ff_connection:Disconnect()
            ff_connection = nil
        end
        if ff_button then
            ff_button:Destroy()
            ff_button = nil
        end
        if sausageHolder then
            sausageHolder.Size = UDim2.new(0, originalSize, 0, sausageHolder.Size.Y.Offset)
        end
    end
end

FunGroup:AddToggle("Frontflip", {
    Text = "显示后空翻按钮",
    Default = false,
    Tooltip = "启用后空翻功能",
    Callback = function(Value)
        SetFrontFlip(Value)
        Library:Notify({
            Title = "后空翻",
            Description = Value and "后空翻已启用" or "后空翻已禁用",
            Time = 3,
        })
    end,
})

FunGroup:AddSlider("JumpHeight", {
    Text = "跳跃高度",
    Default = 72,
    Min = 20,
    Max = 200,
    Rounding = 0,
    Compact = false,
    Callback = function(Value)
        jumpHeight = Value
        Library:Notify({
            Title = "跳跃高度",
            Description = "已设置为: " .. Value,
            Time = 2,
        })
    end,
    Tooltip = "调节后空翻的跳跃高度",
})

FunGroup:AddSlider("JumpDistance", {
    Text = "跳跃距离",
    Default = 35,
    Min = 10,
    Max = 100,
    Rounding = 0,
    Compact = false,
    Callback = function(Value)
        jumpDistance = Value
        Library:Notify({
            Title = "跳跃距离",
            Description = "已设置为: " .. Value,
            Time = 2,
        })
    end,
    Tooltip = "调节后空翻的跳跃距离",
})



local LOL = Tabs.Bro:AddLeftTabbox()
local SM = LOL:AddTab("HitBox追踪")
local SM2 = LOL:AddTab("显示HitBox")



local HitboxTrackingEnabled = false
local HeartbeatConnection = nil
local MaxDistance = 120

SM:AddSlider("DistanceSlider", {
    Text = "追踪范围",
    Default = 120,
    Min = 1,
    Max = 300,
    Rounding = 0,
    Callback = function(value)
        MaxDistance = value
    end
})

SM:AddToggle("HitboxTrackingToggle", {
    Text = "Hitbox追踪",
    Default = false,
    Callback = function(state)
        HitboxTrackingEnabled = state
        
        if HeartbeatConnection then
            HeartbeatConnection:Disconnect()
            HeartbeatConnection = nil
        end
        
        if not state then return end
        
        repeat task.wait() until game:IsLoaded();

        local Players = game:GetService('Players');
        local Player = Players.LocalPlayer;
        local Character = Player.Character or Player.CharacterAdded:Wait();
        local Humanoid = Character:WaitForChild("Humanoid");
        local HumanoidRootPart = Character:WaitForChild("HumanoidRootPart");

        Player.CharacterAdded:Connect(function(NewCharacter)
            Character = NewCharacter;
            Humanoid = Character:WaitForChild("Humanoid");
            HumanoidRootPart = Character:WaitForChild("HumanoidRootPart");
        end);

     local AttackAnimations = {
    'rbxassetid://131430497821198',
    'rbxassetid://83829782357897',
    'rbxassetid://126830014841198',
    'rbxassetid://126355327951215',
    'rbxassetid://121086746534252',
    'rbxassetid://105458270463374',
    'rbxassetid://127172483138092',
    'rbxassetid://18885919947',
    'rbxassetid://18885909645',
    'rbxassetid://87259391926321',
    'rbxassetid://106014898528300',
    'rbxassetid://86545133269813',
    'rbxassetid://89448354637442',
    'rbxassetid://90499469533503',
    'rbxassetid://116618003477002',
    'rbxassetid://106086955212611',
    'rbxassetid://107640065977686',
    'rbxassetid://77124578197357',
    'rbxassetid://101771617803133',
    'rbxassetid://134958187822107',
    'rbxassetid://111313169447787',
    'rbxassetid://71685573690338',
    'rbxassetid://129843313690921',
    'rbxassetid://97623143664485',
    'rbxassetid://136007065400978',
    'rbxassetid://86096387000557',
    'rbxassetid://108807732150251',
    'rbxassetid://138040001965654',
    'rbxassetid://73502073176819',
    'rbxassetid://86709774283672',
    'rbxassetid://140703210927645',
    'rbxassetid://96173857867228',
    'rbxassetid://121255898612475',
    'rbxassetid://98031287364865',
    'rbxassetid://119462383658044',
    'rbxassetid://77448521277146',
    'rbxassetid://103741352379819',
    'rbxassetid://131696603025265',
    'rbxassetid://122503338277352',
    'rbxassetid://97648548303678',
    'rbxassetid://94162446513587',
    'rbxassetid://84426150435898',
    'rbxassetid://93069721274110',
    'rbxassetid://114620047310688',
    'rbxassetid://97433060861952',
    'rbxassetid://82183356141401',
    'rbxassetid://100592913030351',
    'rbxassetid://121293883585738',
    'rbxassetid://70447634862911',
    'rbxassetid://92173139187970',
    'rbxassetid://106847695270773',
    'rbxassetid://125403313786645',
    'rbxassetid://81639435858902',
    'rbxassetid://137314737492715',
    'rbxassetid://120112897026015',
    'rbxassetid://82113744478546',
    'rbxassetid://118298475669935',
    'rbxassetid://126681776859538',
    'rbxassetid://129976080405072',
    'rbxassetid://109667959938617',
    'rbxassetid://74707328554358',
    'rbxassetid://133336594357903',
    'rbxassetid://86204001129974',
    'rbxassetid://124243639579224',
    'rbxassetid://70371667919898',
    'rbxassetid://131543461321709',
    'rbxassetid://136323728355613',
    'rbxassetid://109230267448394',
    'rbxassetid://104744456957363',
    'rbxassetid://106538427162796',
    'rbxassetid://117451341682452',
    'rbxassetid://122580527125278',
    'rbxassetid://125504560920616',
    'rbxassetid://126896426760253',
    'rbxassetid://128923537868786',
    'rbxassetid://129491851057694',
    'rbxassetid://134053005930385',
    'rbxassetid://135884061951801',
    'rbxassetid://139321362207112',
    'rbxassetid://139835501033932',
    'rbxassetid://140042539182927',
    'rbxassetid://140061272138793',
    'rbxassetid://108018357044094',
    'rbxassetid://126171487400618',
    'rbxassetid://103699298199261',
    'rbxassetid://101031946095087',
    'rbxassetid://122709416391891',
    'rbxassetid://98456918873918',
    'rbxassetid://99135633258223',
    'rbxassetid://97167027849946'
};

        local RNG = Random.new();
        HeartbeatConnection = game:GetService('RunService').Heartbeat:Connect(function()
            if not HitboxTrackingEnabled or not HumanoidRootPart then
                return;
            end

            local Playing = false;
            for _,v in Humanoid:GetPlayingAnimationTracks() do
                if table.find(AttackAnimations, v.Animation.AnimationId) and (v.TimePosition / v.Length < 0.75) then
                    Playing = true;
                end
            end

            if not Playing then
                return;
            end

            local Target;
            local NearestDist = MaxDistance;

            local function loop(t)
                for _,v in t do
                    if v == Character or not v:FindFirstChild("HumanoidRootPart") then
                        continue;
                    end

                    local Dist = (v.HumanoidRootPart.Position - HumanoidRootPart.Position).Magnitude;

                    if Dist < NearestDist then
                        NearestDist = Dist;
                        Target = v;
                    end
                end
            end

            loop(workspace.Players:GetDescendants());
            loop(workspace.Map:FindFirstChild("NPCs", true):GetChildren());

            if not Target then
                return;
            end

            local OldVelocity = HumanoidRootPart.Velocity;
            local NeededVelocity =
            (Target.HumanoidRootPart.Position + Vector3.new(
                RNG:NextNumber(-1.5, 1.5),
                0,
                RNG:NextNumber(-1.5, 1.5)
            ) + (Target.HumanoidRootPart.Velocity * (Player:GetNetworkPing() * 1.25))
                - HumanoidRootPart.Position
            ) / (Player:GetNetworkPing() * 2);

            HumanoidRootPart.Velocity = NeededVelocity;
            game:GetService('RunService').RenderStepped:Wait();
            HumanoidRootPart.Velocity = OldVelocity;
        end);
    end,
})



local Workspace = game:GetService("Workspace")
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")

local player = Players.LocalPlayer
local playerName = player.Name
local hitbox = nil
local updateConnection = nil

local hitboxesFolder = Workspace:FindFirstChild("Hitboxes")
if not hitboxesFolder then
    hitboxesFolder = Instance.new("Folder")
    hitboxesFolder.Name = "Hitboxes"
    hitboxesFolder.Parent = Workspace
end

local function createHitbox()
    local part = Instance.new("Part")
    part.Name = playerName .. "_Hitbox"
    part.Size = Vector3.new(4, 7, 4)
    part.Anchored = true
    part.CanCollide = false
    part.Transparency = 0.5
    part.Material = Enum.Material.ForceField
    part.Color = Color3.fromRGB(255, 255, 200)
    part.Parent = hitboxesFolder
    return part
end

local function updateHitbox()
    local character = player.Character
    if character and character:FindFirstChild("HumanoidRootPart") and hitbox then
        local root = character.HumanoidRootPart
        local offset = root.CFrame.LookVector * 4
        hitbox.CFrame = CFrame.new(root.Position + offset, root.Position + root.CFrame.LookVector)
    end
end

SM2:AddToggle("打人", {
    Text = "显示HitBox",
    Default = false,
    Callback = function(state)
        if state then
            hitbox = createHitbox()
            updateConnection = RunService.RenderStepped:Connect(updateHitbox)
            
            player.CharacterAdded:Connect(function(char)
                task.wait(1)
                if hitbox then
                    hitbox:Destroy()
                end
                hitbox = createHitbox()
            end)
        else
            if updateConnection then
                updateConnection:Disconnect()
                updateConnection = nil
            end
            if hitbox then
                hitbox:Destroy()
                hitbox = nil
            end
        end
    end
})


getgenv().RS = game:GetService("ReplicatedStorage")
getgenv().RSvc = game:GetService("RunService")
getgenv().Plrs = game:GetService("Players")
getgenv().LocalP = Plrs.LocalPlayer

getgenv().buffer = buffer or require(game:GetService("ReplicatedStorage").Buffer)

getgenv().AutoBlockConfig = {
    Enabled = false,
    BaseDistance = 18,
    TargetAngle = 50,
    ShowVisualization = false,
    BlockCooldown = 1.2,
    AngleCheckEnabled = true
}



getgenv().AutoBlockSounds = {
    ["102228729296384"] = true,
    ["140242176732868"] = true,
    ["112809109188560"] = true,
    ["136323728355613"] = true,
    ["115026634746636"] = true,
    ["84116622032112"] = true,
    ["108907358619313"] = true,
    ["127793641088496"] = true,
    ["86174610237192"] = true,
    ["95079963655241"] = true,
    ["101199185291628"] = true,
    ["119942598489800"] = true,
    ["84307400688050"] = true,
    ["113037804008732"] = true,
    ["105200830849301"] = true,
    ["75330693422988"] = true,
    ["82221759983649"] = true,
    ["81702359653578"] = true,
    ["108610718831698"] = true,
    ["112395455254818"] = true,
    ["109431876587852"] = true,
    ["109348678063422"] = true,
    ["85853080745515"] = true,
    ["12222216"] = true,
    ["105840448036441"] = true,
    ["114742322778642"] = true,
    ["119583605486352"] = true,
    ["79980897195554"] = true,
    ["71805956520207"] = true,
    ["79391273191671"] = true,
    ["89004992452376"] = true,
    ["101553872555606"] = true,
    ["101698569375359"] = true,
    ["106300477136129"] = true,
    ["116581754553533"] = true,
    ["117231507259853"] = true,
    ["119089145505438"] = true,
    ["121954639447247"] = true,
    ["125213046326879"] = true,
    ["131406927389838"] = true,
    ["117173212095661"] = true,
    
}

getgenv().AutoBlockAnims = {
    ["126830014841198"] = true,
    ["126355327951215"] = true,
    ["121086746534252"] = true,
    ["18885909645"] = true,
    ["98456918873918"] = true,
    ["105458270463374"] = true,
    ["83829782357897"] = true,
    ["125403313786645"] = true,
    ["118298475669935"] = true,
    ["82113744478546"] = true,
    ["70371667919898"] = true,
    ["99135633258223"] = true,
    ["97167027849946"] = true,
    ["109230267448394"] = true,
    ["139835501033932"] = true,
    ["126896426760253"] = true,
    ["109667959938617"] = true,
    ["126681776859538"] = true,
    ["129976080405072"] = true,
    ["121293883585738"] = true,
    ["81639435858902"] = true,
    ["137314737492715"] = true,
    ["92173139187970"] = true
}

getgenv().AutoBlockEnabled = false
getgenv().SenseRange = 18
getgenv().SenseRangeSq = SenseRange * SenseRange

getgenv().KillersFolder = workspace:WaitForChild("Players"):WaitForChild("Killers")

getgenv().KillerVisualizations = {}
getgenv().LastBlockTime = 0
getgenv().DetectionConnection = nil

-- 快速角度检测
getgenv().IsFacingTarget = function(myRoot, targetRoot)
    if not AutoBlockConfig.AngleCheckEnabled then return true end
    local dir = (myRoot.Position - targetRoot.Position).Unit
    local dot = targetRoot.CFrame.LookVector:Dot(dir)
    local angle = math.deg(math.acos(math.clamp(dot, -1, 1)))
    return angle <= AutoBlockConfig.TargetAngle
end

-- 快速声音检测
getgenv().CheckSoundThreat = function(killer)
    local rootPart = killer:FindFirstChild("HumanoidRootPart")
    if not rootPart then return false end
    
    for _, sound in ipairs(rootPart:GetChildren()) do
        if sound:IsA("Sound") and sound.IsPlaying then
            local soundId = tostring(sound.SoundId)
            local numericId = soundId:match("%d+")
            if numericId and AutoBlockSounds[numericId] then
                return true
            end
        end
    end
    return false
end

-- 快速动画检测
getgenv().CheckAnimationThreat = function(killer)
    local humanoid = killer:FindFirstChildOfClass("Humanoid")
    if not humanoid then return false end
    
    local animator = humanoid:FindFirstChildOfClass("Animator")
    if not animator then return false end
    
    for _, track in ipairs(animator:GetPlayingAnimationTracks()) do
        if track.Animation then
            local animId = tostring(track.Animation.AnimationId)
            local numericId = animId:match("%d+")
            if numericId and AutoBlockAnims[numericId] then
                return true
            end
        end
    end
    return false
end

-- 格挡远程调用
getgenv().FireBlockRemote = function()
    if not AutoBlockEnabled then return end
    
    pcall(function()
        local args = {
            "UseActorAbility",
            {
                buffer.fromstring("\"Block\"")
            }
        }
        game:GetService("ReplicatedStorage"):WaitForChild("Modules"):WaitForChild("Network"):WaitForChild("RemoteEvent"):FireServer(unpack(args))
    end)
end

-- 主检测循环
getgenv().StartThreatDetection = function()
    if DetectionConnection then
        DetectionConnection:Disconnect()
    end
    
    DetectionConnection = RSvc.Heartbeat:Connect(function()
        if not AutoBlockEnabled then return end
        
        local currentTime = tick()
        if currentTime - LastBlockTime < AutoBlockConfig.BlockCooldown then return end
        
        local myCharacter = LocalP.Character
        if not myCharacter then return end
        
        local myRoot = myCharacter:FindFirstChild("HumanoidRootPart")
        if not myRoot then return end
        
        -- 快速遍历所有杀手
        for _, killer in ipairs(KillersFolder:GetChildren()) do
            local killerRoot = killer:FindFirstChild("HumanoidRootPart")
            if not killerRoot then continue end
            
            -- 快速距离检查
            local distance = (myRoot.Position - killerRoot.Position).Magnitude
            if distance > AutoBlockConfig.BaseDistance then continue end
            
            -- 快速角度检查
            if not IsFacingTarget(myRoot, killerRoot) then continue end
            
            -- 快速声音威胁检查
            if CheckSoundThreat(killer) then
                FireBlockRemote()
                LastBlockTime = currentTime
                return
            end
            
            -- 快速动画威胁检查
            if CheckAnimationThreat(killer) then
                FireBlockRemote()
                LastBlockTime = currentTime
                return
            end
        end
    end)
end

getgenv().StopThreatDetection = function()
    if DetectionConnection then
        DetectionConnection:Disconnect()
        DetectionConnection = nil
    end
end

-- 可视化系统
getgenv().CreateKillerVisualization = function(killer)
    if not killer:FindFirstChild("HumanoidRootPart") then return end
    if KillerVisualizations[killer] then return end
    
    local parts = {}
    
    local center = killer.HumanoidRootPart.Position
    local distance = AutoBlockConfig.BaseDistance
    local angle = AutoBlockConfig.AngleCheckEnabled and math.rad(AutoBlockConfig.TargetAngle) or math.rad(180)
    local segments = 8
    
    -- 中心点
    local centerPart = Instance.new("Part")
    centerPart.Size = Vector3.new(1, 1, 1)
    centerPart.Position = center + Vector3.new(0, 1, 0)
    centerPart.Shape = Enum.PartType.Ball
    centerPart.BrickColor = BrickColor.new("Bright red")
    centerPart.Material = Enum.Material.Neon
    centerPart.Transparency = 0.3
    centerPart.Anchored = true
    centerPart.CanCollide = false
    centerPart.Parent = workspace
    table.insert(parts, centerPart)
    
    -- 扇形边界点
    local edgePoints = {}
    for i = 0, segments do
        local segAngle = -angle + (i * (2 * angle) / segments)
        local cf = CFrame.fromAxisAngle(Vector3.new(0, 1, 0), segAngle)
        local dir = cf:VectorToWorldSpace(killer.HumanoidRootPart.CFrame.LookVector)
        local pos = center + dir * distance
        
        local point = Instance.new("Part")
        point.Size = Vector3.new(0.5, 0.5, 0.5)
        point.Position = pos + Vector3.new(0, 0.5, 0)
        point.Shape = Enum.PartType.Ball
        point.BrickColor = BrickColor.new("Bright yellow")
        point.Material = Enum.Material.Neon
        point.Transparency = 0.4
        point.Anchored = true
        point.CanCollide = false
        point.Parent = workspace
        table.insert(parts, point)
        table.insert(edgePoints, point)
    end
    
    -- 连接线
    for i, point in ipairs(edgePoints) do
        local att0 = Instance.new("Attachment")
        att0.Parent = centerPart
        
        local att1 = Instance.new("Attachment")
        att1.Parent = point
        
        local beam = Instance.new("Beam")
        beam.Attachment0 = att0
        beam.Attachment1 = att1
        beam.Color = ColorSequence.new(Color3.new(1, 1, 0))
        beam.Width0 = 0.1
        beam.Width1 = 0.1
        beam.FaceCamera = true
        beam.Parent = centerPart
        
        table.insert(parts, beam)
        table.insert(parts, att0)
        table.insert(parts, att1)
    end
    
    -- 扇形弧线
    for i = 1, #edgePoints - 1 do
        local att0 = Instance.new("Attachment")
        att0.Parent = edgePoints[i]
        
        local att1 = Instance.new("Attachment")
        att1.Parent = edgePoints[i + 1]
        
        local beam = Instance.new("Beam")
        beam.Attachment0 = att0
        beam.Attachment1 = att1
        beam.Color = ColorSequence.new(Color3.new(1, 0.5, 0))
        beam.Width0 = 0.1
        beam.Width1 = 0.1
        beam.FaceCamera = true
        beam.Parent = edgePoints[i]
        
        table.insert(parts, beam)
        table.insert(parts, att0)
        table.insert(parts, att1)
    end
    
    local connection = RSvc.Heartbeat:Connect(function()
        if not AutoBlockConfig.ShowVisualization or not killer.Parent then
            Cleanup()
            return
        end
        
        local centerPos = killer.HumanoidRootPart.Position + Vector3.new(0, 1, 0)
        local lookVec = killer.HumanoidRootPart.CFrame.LookVector
        local dist = AutoBlockConfig.BaseDistance
        local ang = AutoBlockConfig.AngleCheckEnabled and math.rad(AutoBlockConfig.TargetAngle) or math.rad(180)
        
        centerPart.Position = centerPos
        
        for i, point in ipairs(edgePoints) do
            local segAngle = -ang + ((i - 1) * (2 * ang) / (#edgePoints - 1))
            local cf = CFrame.fromAxisAngle(Vector3.new(0, 1, 0), segAngle)
            local dir = cf:VectorToWorldSpace(lookVec)
            local pos = centerPos + dir * dist
            point.Position = pos + Vector3.new(0, 0.5, 0)
        end
    end)
    
    local function Cleanup()
        connection:Disconnect()
        for _, part in ipairs(parts) do
            part:Destroy()
        end
        KillerVisualizations[killer] = nil
    end
    
    KillerVisualizations[killer] = {
        cleanup = Cleanup,
        connection = connection
    }
end

getgenv().RemoveKillerVisualization = function(killer)
    if KillerVisualizations[killer] then
        KillerVisualizations[killer].cleanup()
    end
end

getgenv().RefreshKillerVisualizations = function()
    for killer, _ in pairs(KillerVisualizations) do
        RemoveKillerVisualization(killer)
    end
    
    if AutoBlockConfig.ShowVisualization then
        for _, killer in ipairs(KillersFolder:GetChildren()) do
            CreateKillerVisualization(killer)
        end
    end
end

-- 事件监听
LocalP.CharacterAdded:Connect(function()
    if AutoBlockEnabled then
        StartThreatDetection()
    end
end)

KillersFolder.ChildAdded:Connect(function(killer)
    if AutoBlockConfig.ShowVisualization then
        CreateKillerVisualization(killer)
    end
end)

KillersFolder.ChildRemoved:Connect(function(killer)
    RemoveKillerVisualization(killer)
end)



local ZZ = Tabs.Bro:AddRightGroupbox('自动格挡[Guest 1337]')

local MS = Tabs.Bro:AddRightTabbox()
local ZZ = MS:AddTab("V1")
local ZZ2 = MS:AddTab("V2")
local NOL = MS:AddTab("拳击")

ZZ:AddToggle("AutoBlockToggle", {
    Text = "自动格挡",
    Default = false,
    Callback = function(state)
        AutoBlockEnabled = state
        AutoBlockConfig.Enabled = state
        if state then
            StartThreatDetection()
        else
            StopThreatDetection()
        end
    end
})

ZZ:AddSlider("SenseRangeSlider", {
    Text = "格挡距离",
    Default = 18,
    Min = 5,
    Max = 30,
    Rounding = 1,
    Callback = function(value)
        SenseRange = value
        SenseRangeSq = SenseRange * SenseRange
        AutoBlockConfig.BaseDistance = value
        if AutoBlockConfig.ShowVisualization then
            RefreshKillerVisualizations()
        end
    end
})

ZZ:AddToggle("AngleCheckToggle", {
    Text = "角度检测",
    Default = true,
    Callback = function(state)
        AutoBlockConfig.AngleCheckEnabled = state
        if AutoBlockConfig.ShowVisualization then
            RefreshKillerVisualizations()
        end
    end
})

ZZ:AddSlider("TargetAngleSlider", {
    Text = "格挡角度",
    Default = 50,
    Min = 10,
    Max = 180,
    Rounding = 1,
    Callback = function(value)
        AutoBlockConfig.TargetAngle = value
        if AutoBlockConfig.ShowVisualization then
            RefreshKillerVisualizations()
        end
    end
})

ZZ:AddToggle("VisualizationToggle", {
    Text = "可视化",
    Default = false,
    Callback = function(state)
        AutoBlockConfig.ShowVisualization = state
        if state then
            RefreshKillerVisualizations()
        else
            for killer, _ in pairs(KillerVisualizations) do
                RemoveKillerVisualization(killer)
            end
        end
    end
})



local config_114514 = {
    Enabled = false,
    BaseDistance = 16,
    ScanInterval = 0.0005,
    BlockCooldown = 0.06,
    MoveCompBase = 1.8,
    MoveCompFactor = 0.3,
    SpeedThreshold = 6,
    PredictBase = 5,
    PredictMax = 15,
    PredictFactor = 0.45,
    TargetAngle = 50,
    MinAttackSpeed = 10,
    ShowVisualization = false,
    EnablePrediction = false,
    PingCompensation = 0.15,
    FastKillerAdjust = 1.5,
    ReactionBoost = 1.2,
    TargetSoundIds = {
        "102228729296384", "140242176732868", "112809109188560", "136323728355613",
        "115026634746636", "84116622032112", "108907358619313", "127793641088496",
        "86174610237192", "95079963655241", "101199185291628", "119942598489800",
        "84307400688050", "113037804008732", "105200830849301", "75330693422988",
        "82221759983649", "81702359653578", "108610718831698", "112395455254818",
        "109431876587852", "109348678063422", "85853080745515", "12222216","119583605486352","78298577002481","117173212095661","112809109188560"    
    },
    TargetAnimIds = {
        "126830014841198", "126355327951215", "121086746534252", "18885909645",
        "98456918873918", "105458270463374", "83829782357897", "125403313786645",
        "118298475669935", "82113744478546", "70371667919898", "99135633258223",
        "97167027849946", "109230267448394", "139835501033932", "126896426760253",
        "109667959938617", "126681776859538", "129976080405072", "121293883585738",
        "81639435858902", "137314737492715", "92173139187970"
    }
}

pcall(function()
    local Players = game:GetService("Players")
    local ReplicatedStorage = game:GetService("ReplicatedStorage")
    local RunService = game:GetService("RunService")
    local Stats = game:GetService("Stats")
    
    local soundLookup = {}
    for _, id in ipairs(config_114514.TargetSoundIds) do
        soundLookup[id] = true
        soundLookup["rbxassetid://" .. id] = true
    end
    
    local animLookup = {}
    for _, id in ipairs(config_114514.TargetAnimIds) do
        animLookup[id] = true
        animLookup["rbxassetid://" .. id] = true
    end
    
    local LocalPlayer = Players.LocalPlayer
    local lastBlockTime = 0
    local combatConnection = nil
    local lastScanTime = 0
    local visualizationParts = {}
    local soundCache = {}
    local animCache = {}
    local lastSoundCheck = 0
    local lastAnimCheck = 0
    local lastPingCheck = 0
    local currentPing = 0
    local threatCache = {}
    local lastThreatUpdate = 0
    
    local function GetPing()
        local currentTime = os.clock()
        if currentTime - lastPingCheck < 0.3 then
            return currentPing
        end
        lastPingCheck = currentTime
        
        local stats = Stats and Stats.Network and Stats.Network:FindFirstChild("ServerStatsItem")
        if stats then
            local pingStat = stats:FindFirstChild("Data Ping")
            if pingStat then
                currentPing = pingStat.Value
                return currentPing
            end
        end
        
        return 0
    end
    
    local function GetPingCompensation()
        local ping = GetPing()
        return math.min(0.4, ping / 1000 * config_114514.PingCompensation * 12)
    end
    
    local function CreateVisualization()
        if not LocalPlayer.Character then return end
        local rootPart = LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
        if not rootPart then return end
        
        for _, part in ipairs(visualizationParts) do
            part:Destroy()
        end
        visualizationParts = {}
        
        local center = rootPart.Position
        local distance = config_114514.BaseDistance
        local angle = math.rad(config_114514.TargetAngle)
        local segments = 36
        
        -- 创建中心球体表示玩家位置
        local centerSphere = Instance.new("Part")
        centerSphere.Size = Vector3.new(1, 1, 1)
        centerSphere.Position = center + Vector3.new(0, 0.5, 0)
        centerSphere.Shape = Enum.PartType.Ball
        centerSphere.BrickColor = BrickColor.new("Bright blue")
        centerSphere.Material = Enum.Material.Neon
        centerSphere.Transparency = 0.3
        centerSphere.Anchored = true
        centerSphere.CanCollide = false
        centerSphere.Parent = workspace
        table.insert(visualizationParts, centerSphere)
        
        -- 创建扇形区域表示格挡范围
        for i = 1, segments do
            local part = Instance.new("Part")
            part.Size = Vector3.new(0.3, 0.1, 0.3)
            part.BrickColor = BrickColor.new("Bright green")
            part.Material = Enum.Material.Neon
            part.Transparency = 0.7
            part.Anchored = true
            part.CanCollide = false
            part.Parent = workspace
            table.insert(visualizationParts, part)
        end
        
        local function UpdateVisualization()
            if not config_114514.ShowVisualization then return end
            if not LocalPlayer.Character then return end
            local root = LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
            if not root then return end
            
            local center = root.Position + Vector3.new(0, 0.5, 0)
            local lookVector = root.CFrame.LookVector
            local distance = config_114514.BaseDistance
            local angle = math.rad(config_114514.TargetAngle)
            
            -- 更新中心球体位置
            centerSphere.Position = center
            
            -- 更新扇形区域
            for i = 1, #visualizationParts - 1 do
                local part = visualizationParts[i + 1]
                local segmentAngle = (i - 1) * (2 * angle) / (#visualizationParts - 2) - angle
                local rotCFrame = CFrame.fromAxisAngle(Vector3.new(0, 1, 0), segmentAngle)
                local dir = rotCFrame:VectorToWorldSpace(lookVector)
                local pos = center + dir * distance
                part.Position = pos
                
                -- 设置扇形区域的朝向
                local lookAtCenter = CFrame.lookAt(pos, center)
                part.CFrame = lookAtCenter
            end
        end
        
        local visConnection
        visConnection = RunService.Heartbeat:Connect(function()
            if not config_114514.ShowVisualization then
                for _, part in ipairs(visualizationParts) do
                    part:Destroy()
                end
                visualizationParts = {}
                visConnection:Disconnect()
                return
            end
            pcall(UpdateVisualization)
        end)
    end
    
    local function HasTargetSound(character)
        if not character then return false end
        local rootPart = character:FindFirstChild("HumanoidRootPart")
        if not rootPart then return false end
        
        local currentTime = os.clock()
        if currentTime - lastSoundCheck < 0.0003 then
            return soundCache[character] or false
        end
        lastSoundCheck = currentTime
        
        local found = false
        for _, child in ipairs(rootPart:GetChildren()) do
            if child:IsA("Sound") then
                local soundId = tostring(child.SoundId)
                local numericId = string.match(soundId, "(%d+)$")
                if numericId and soundLookup[numericId] then
                    found = true
                    break
                end
            end
        end
        
        soundCache[character] = found
        return found
    end
    
    local function HasTargetAnimation(character)
        if not character then return false end
        local humanoid = character:FindFirstChildOfClass("Humanoid")
        if not humanoid then return false end
        
        local currentTime = os.clock()
        if currentTime - lastAnimCheck < 0.0003 then
            return animCache[character] or false
        end
        lastAnimCheck = currentTime
        
        local found = false
        local animator = humanoid:FindFirstChildOfClass("Animator")
        if animator then
            for _, track in pairs(animator:GetPlayingAnimationTracks()) do
                if track.Animation then
                    local animId = tostring(track.Animation.AnimationId)
                    local numericId = string.match(animId, "(%d+)$")
                    if numericId and animLookup[numericId] then
                        found = true
                        break
                    end
                end
            end
        end
        
        animCache[character] = found
        return found
    end
    
    local function GetMoveCompensation()
        if not LocalPlayer.Character then return 0 end
        local rootPart = LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
        if not rootPart then return 0 end
        
        local velocity = rootPart.Velocity
        local speed = math.sqrt(velocity.X^2 + velocity.Y^2 + velocity.Z^2)
        return config_114514.MoveCompBase + (speed * config_114514.MoveCompFactor)
    end
    
    local function IsFastKiller(killer)
        if not killer then return false end
        local killerRoot = killer:FindFirstChild("HumanoidRootPart")
        if not killerRoot then return false end
        
        local killerVel = killerRoot.Velocity
        local killerSpeed = math.sqrt(killerVel.X^2 + killerVel.Y^2 + killerVel.Z^2)
        return killerSpeed > config_114514.MinAttackSpeed
    end
    
    local function GetTotalDetectionRange(killer)
        local base = config_114514.BaseDistance
        local moveBonus = GetMoveCompensation()
        local predict = 0
        local pingBonus = GetPingCompensation() * 8
        local reactionBoost = config_114514.ReactionBoost

        if config_114514.EnablePrediction and killer and killer:FindFirstChild("HumanoidRootPart") then
            local killerVel = killer.HumanoidRootPart.Velocity
            local killerSpeed = math.sqrt(killerVel.X^2 + killerVel.Y^2 + killerVel.Z^2)
            
            if killerSpeed > config_114514.SpeedThreshold then
                predict = math.min(
                    config_114514.PredictMax, 
                    config_114514.PredictBase + (killerSpeed * config_114514.PredictFactor)
                )
            end
            
            if IsFastKiller(killer) then
                predict = predict * config_114514.FastKillerAdjust
            end
        end
        
        return (base + moveBonus + predict + pingBonus) * reactionBoost
    end
    
    local function IsTargetingMe(killer)
        local myCharacter = LocalPlayer.Character
        if not myCharacter then return false end
        
        local myRoot = myCharacter:FindFirstChild("HumanoidRootPart")
        local killerRoot = killer and killer:FindFirstChild("HumanoidRootPart")
        if not myRoot or not killerRoot then return false end
        
        local directionToMe = (myRoot.Position - killerRoot.Position).Unit
        local killerLook = killerRoot.CFrame.LookVector
        
        local dot = directionToMe:Dot(killerLook)
        local angle = math.deg(math.acos(math.clamp(dot, -1, 1)))
        
        return angle <= config_114514.TargetAngle
    end
    
    local function IsKillerInRange(killer)
        local myCharacter = LocalPlayer.Character
        if not myCharacter then return false end
        
        local myRoot = myCharacter:FindFirstChild("HumanoidRootPart")
        local killerRoot = killer and killer:FindFirstChild("HumanoidRootPart")
        if not myRoot or not killerRoot then return false end
        
        -- 计算杀手与玩家的实际距离
        local distance = (myRoot.Position - killerRoot.Position).Magnitude
        local detectionRange = GetTotalDetectionRange(killer)
        
        -- 只有当杀手在检测范围内时才返回true
        return distance <= detectionRange
    end
    
    local function UpdateThreatCache()
        local currentTime = os.clock()
        if currentTime - lastThreatUpdate < 0.1 then
            return threatCache
        end
        lastThreatUpdate = currentTime
        
        threatCache = {}
        local killersFolder = workspace:FindFirstChild("Killers") or (workspace:FindFirstChild("Players") and workspace.Players:FindFirstChild("Killers"))
        if not killersFolder then return threatCache end
        
        local myCharacter = LocalPlayer.Character
        if not myCharacter then return threatCache end
        
        local myRoot = myCharacter:FindFirstChild("HumanoidRootPart")
        if not myRoot then return threatCache end
        
        for _, killer in ipairs(killersFolder:GetChildren()) do
            if killer:IsA("Model") and killer:FindFirstChild("HumanoidRootPart") then
                local killerRoot = killer.HumanoidRootPart
                
                -- 首先检查杀手是否在范围内
                if IsKillerInRange(killer) and IsTargetingMe(killer) then
                    local hasSound = HasTargetSound(killer)
                    local hasAnim = HasTargetAnimation(killer)
                    
                    if hasSound or hasAnim then
                        local distance = (myRoot.Position - killerRoot.Position).Magnitude
                        local detectionRange = GetTotalDetectionRange(killer)
                        
                        threatCache[killer] = {
                            distance = distance,
                            detectionRange = detectionRange,
                            timestamp = currentTime,
                            hasSound = hasSound,
                            hasAnim = hasAnim
                        }
                    end
                end
            end
        end
        
        return threatCache
    end
    
    local function GetThreateningKillers()
        local cache = UpdateThreatCache()
        local killers = {}
        local currentTime = os.clock()
        
        for killer, data in pairs(cache) do
            if currentTime - data.timestamp < 0.2 then
                table.insert(killers, killer)
            end
        end
        
        return killers
    end
    
    local function GetAdjustedCooldown()
        local ping = GetPing()
        return math.max(0.04, config_114514.BlockCooldown - (ping / 1000 * 0.7))
    end
    
    local function PerformBlock()
        local now = os.clock()
        if now - lastBlockTime >= GetAdjustedCooldown() then
            pcall(function()
                local args = {
                    "UseActorAbility",
                    {
                        buffer.fromstring("\"Block\"")
                    }
                }
                game:GetService("ReplicatedStorage"):WaitForChild("Modules"):WaitForChild("Network"):WaitForChild("RemoteEvent"):FireServer(unpack(args))
                lastBlockTime = now
            end)
        end
    end
    
    local function CombatLoop()
        local currentTime = os.clock()
        if currentTime - lastScanTime >= config_114514.ScanInterval then
            lastScanTime = currentTime
            
            if not LocalPlayer.Character then return end
            local myRoot = LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
            if not myRoot then return end
            
            local killers = GetThreateningKillers()
            if #killers > 0 then
                PerformBlock()
            end
        end
    end
    
    ZZ2:AddToggle("AutoBlockToggle", {
        Text = "Auto Block",
        Default = false,
        Callback = function(enabled)
            config_114514.Enabled = enabled
            if enabled then
                if combatConnection then
                    combatConnection:Disconnect()
                end
                combatConnection = RunService.Stepped:Connect(function()
                    pcall(CombatLoop)
                end)
            elseif combatConnection then
                combatConnection:Disconnect()
                combatConnection = nil
            end
        end
    })
    
    ZZ2:AddSlider("BaseDistance", {
        Text = "距离",
        Default = 16,
        Min = 5,
        Max = 30,
        Rounding = 1,
        Callback = function(value)
            config_114514.BaseDistance = value
        end
    })
    
    ZZ2:AddSlider("TargetAngleSlider", {
        Text = "角度",
        Default = 70,
        Min = 10,
        Max = 180,
        Rounding = 1,
        Callback = function(value)
            config_114514.TargetAngle = value
        end
    })
    
    ZZ2:AddToggle("VisualizationToggle", {
        Text = "可视化",
        Default = false,
        Callback = function(enabled)
            config_114514.ShowVisualization = enabled
            if enabled then
                CreateVisualization()
            else
                for _, part in ipairs(visualizationParts) do
                    part:Destroy()
                end
                visualizationParts = {}
            end
        end
    })

    LocalPlayer.CharacterAdded:Connect(function()
        if config_114514.Enabled and combatConnection then
            combatConnection:Disconnect()
            combatConnection = RunService.Stepped:Connect(CombatLoop)
        end
        if config_114514.ShowVisualization then
            CreateVisualization()
        end
    end)
end)




NOL:AddToggle("AutoPunch", {
    Text = "自动拳击",
    Default = false,
    Callback = function(Value)
        -- Define variables outside the callback to maintain state
        if not _G.AutoPunchVars then
            _G.AutoPunchVars = {
                ReplicatedStorage = game:GetService("ReplicatedStorage"),
                remoteEvent = nil,
                isRunning = false,
                connection = nil
            }
        end
        
        local vars = _G.AutoPunchVars
        
        -- Function to safely get the RemoteEvent
        local function getRemoteEvent()
            local success, result = pcall(function()
                return vars.ReplicatedStorage:WaitForChild("Modules"):WaitForChild("Network"):WaitForChild("RemoteEvent")
            end)
            
            if not success or not result then
                warn("无法找到 RemoteEvent！请检查路径：ReplicatedStorage.Modules.Network.RemoteEvent")
                return nil
            end
            return result
        end
        
        -- Function to start sending punch events
        local function startAutoPunch()
            if vars.isRunning then return end
            vars.isRunning = true
            
            -- Get the RemoteEvent if we don't have it yet
            if not vars.remoteEvent then
                vars.remoteEvent = getRemoteEvent()
                if not vars.remoteEvent then
                    warn("RemoteEvent 未初始化，无法发送事件。")
                    vars.isRunning = false
                    return
                end
            end
            
            -- Create the loop connection
            vars.connection = task.spawn(function()
                while vars.isRunning and Value do  -- Added Value check here
local args = {
	"UseActorAbility",
	{
		buffer.fromstring("\"Punch\"")
	}
}
                    vars.remoteEvent:FireServer(unpack(args))
                    task.wait(0.5)  -- Wait 0.5 seconds between punches
                end
                vars.isRunning = false
            end)
        end
        
        -- Function to stop sending punch events
        local function stopAutoPunch()
            if not vars.isRunning then return end
            vars.isRunning = false
            
            -- Cancel the loop if it exists
            if vars.connection then
                task.cancel(vars.connection)
                vars.connection = nil
            end
        end
        
        -- Handle the toggle state
        if Value then
            startAutoPunch()
        else
            stopAutoPunch()
        end
    end
})




local ZZ = Tabs.Bro:AddLeftGroupbox('自动狂暴[Slasher]')

local Players = game:GetService("Players")
local lp = Players.LocalPlayer
local savedRange = lp:FindFirstChild("RagingPaceRange")
if not savedRange then
    savedRange = Instance.new("NumberValue")
    savedRange.Name = "RagingPaceRange"
    savedRange.Value = 19
    savedRange.Parent = lp
end

ZZ:AddSlider("RagingPaceRange", {
    Text = "狂暴触发距离",
    Default = savedRange.Value,
    Min = 1,
    Max = 50,
    Rounding = 0,
    Compact = true,
    Callback = function(value)
        savedRange.Value = value
    end
})

ZZ:AddToggle("RagingPace", {
    Text = "自动狂暴",
    Default = false,
    Callback = function(enabled)
        local threadId = tostring(math.random(1, 99999))
        _G.RagingPaceThreadId = threadId
        
        local function shouldContinue()
            return _G.RagingPaceThreadId == threadId and enabled
        end
        
        local RunService = game:GetService("RunService")
        local ReplicatedStorage = game:GetService("ReplicatedStorage")
        local RANGE = savedRange.Value
        local SPAM_DURATION = 3
        local COOLDOWN_TIME = 5
        local activeCooldowns = {}

        local animsToDetect = {
            ["116618003477002"] = true,
            ["119462383658044"] = true,
            ["131696603025265"] = true,
            ["121255898612475"] = true,
            ["133491532453922"] = true,
            ["103601716322988"] = true,
            ["86371356500204"] = true,
            ["72722244508749"] = true,
            ["87259391926321"] = true,
            ["96959123077498"] = true,
        }

        local function fireRagingPace()
            local args = {
                "UseActorAbility",
                {
                    buffer.fromstring("\"RagingPace\"")
                }
            }
            ReplicatedStorage:WaitForChild("Modules")
                :WaitForChild("Network")
                :WaitForChild("RemoteEvent")
                :FireServer(unpack(args))
        end

        local function isAnimationMatching(anim)
            local id = tostring(anim.Animation and anim.Animation.AnimationId or "")
            local numId = id:match("%d+")
            return animsToDetect[numId] or false
        end

        local function runDetection()
            local connection
            connection = RunService.Heartbeat:Connect(function()
                if not shouldContinue() then
                    connection:Disconnect()
                    return
                end
                
                for _, player in ipairs(Players:GetPlayers()) do
                    if not shouldContinue() then break end
                    
                    if player ~= lp and player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
                        local targetHRP = player.Character.HumanoidRootPart
                        local myChar = lp.Character
                        if myChar and myChar:FindFirstChild("HumanoidRootPart") then
                            local dist = (targetHRP.Position - myChar.HumanoidRootPart.Position).Magnitude
                            if dist <= RANGE and (not activeCooldowns[player] or tick() - activeCooldowns[player] >= COOLDOWN_TIME) then
                                local humanoid = player.Character:FindFirstChildOfClass("Humanoid")
                                if humanoid then
                                    for _, track in pairs(humanoid:GetPlayingAnimationTracks()) do
                                        if not shouldContinue() then break end
                                        
                                        if isAnimationMatching(track) then
                                            activeCooldowns[player] = tick()
                                            task.spawn(function()
                                                local startTime = tick()
                                                while shouldContinue() and tick() - startTime < SPAM_DURATION do
                                                    fireRagingPace()
                                                    task.wait(0.05)
                                                end
                                            end)
                                            break
                                        end
                                    end
                                end
                            end
                        end
                    end
                end
            end)
            
            return connection
        end

        if enabled then
            if _G.RagingPaceConnection then
                _G.RagingPaceConnection:Disconnect()
                _G.RagingPaceConnection = nil
            end
            
            _G.RagingPaceConnection = runDetection()
        else
            if _G.RagingPaceConnection then
                _G.RagingPaceConnection:Disconnect()
                _G.RagingPaceConnection = nil
            end
        end
    end
})



local ZZ = Tabs.Bro:AddRightGroupbox('自动使用404错误[John doe]')

ZZ:AddToggle("AntiAnimations", {
    Text = "自动404错误[势无可挡]",
    Default = false,
    Callback = function(enabled)
        local threadId = tostring(math.random(1, 99999))
        _G.AntiAnimThreadId = threadId
        
        local function shouldContinue()
            return _G.AntiAnimThreadId == threadId and enabled
        end
        
        local Players = game:GetService("Players")
        local RunService = game:GetService("RunService")
        local ReplicatedStorage = game:GetService("ReplicatedStorage")
        local lp = Players.LocalPlayer
        local RANGE = 19
        local SPAM_DURATION = 3
        local COOLDOWN_TIME = 5
        local activeCooldowns = {}

        local animsToDetect = {
            ["116618003477002"] = true,
            ["119462383658044"] = true,
            ["131696603025265"] = true,
            ["121255898612475"] = true,
            ["133491532453922"] = true,
            ["103601716322988"] = true,
            ["86371356500204"] = true,
            ["72722244508749"] = false,
            ["87259391926321"] = true,
            ["96959123077498"] = false,
            ["86709774283672"] = true,
            ["77448521277146"] = true,
        }

        local function fire404Error()
            local args = {
                "UseActorAbility",
                {
                    buffer.fromstring("\"404Error\"")
                }
            }
            ReplicatedStorage:WaitForChild("Modules")
                :WaitForChild("Network")
                :WaitForChild("RemoteEvent")
                :FireServer(unpack(args))
        end

        local function isAnimationMatching(anim)
            local id = tostring(anim.Animation and anim.Animation.AnimationId or "")
            local numId = id:match("%d+")
            return animsToDetect[numId] or false
        end

        local function runDetection()
            local connection
            connection = RunService.Heartbeat:Connect(function()
                if not shouldContinue() then
                    connection:Disconnect()
                    return
                end
                
                for _, player in ipairs(Players:GetPlayers()) do
                    if not shouldContinue() then break end
                    
                    if player ~= lp and player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
                        local targetHRP = player.Character.HumanoidRootPart
                        local myChar = lp.Character
                        if myChar and myChar:FindFirstChild("HumanoidRootPart") then
                            local dist = (targetHRP.Position - myChar.HumanoidRootPart.Position).Magnitude
                            if dist <= RANGE and (not activeCooldowns[player] or tick() - activeCooldowns[player] >= COOLDOWN_TIME) then
                                local humanoid = player.Character:FindFirstChildOfClass("Humanoid")
                                if humanoid then
                                    for _, track in pairs(humanoid:GetPlayingAnimationTracks()) do
                                        if not shouldContinue() then break end
                                        
                                        if isAnimationMatching(track) then
                                            activeCooldowns[player] = tick()
                                            task.spawn(function()
                                                local startTime = tick()
                                                while shouldContinue() and tick() - startTime < SPAM_DURATION do
                                                    fire404Error()
                                                    task.wait(0.05)
                                                end
                                            end)
                                            break
                                        end
                                    end
                                end
                            end
                        end
                    end
                end
            end)
            
            return connection
        end

        if enabled then
            if _G.AntiAnimConnection then
                _G.AntiAnimConnection:Disconnect()
                _G.AntiAnimConnection = nil
            end
            
            _G.AntiAnimConnection = runDetection()
        else
            if _G.AntiAnimConnection then
                _G.AntiAnimConnection:Disconnect()
                _G.AntiAnimConnection = nil
            end
        end
    end
})



local Visual = Tabs.Bro:AddLeftGroupbox("Veeronica自动滑板跳跃")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Players = game:GetService("Players")
local player = Players.LocalPlayer
local RunService = game:GetService("RunService")

local function getBehaviorFolder()
    return ReplicatedStorage:WaitForChild("Assets")
        :WaitForChild("Survivors")
        :WaitForChild("Veeronica")
        :WaitForChild("Behavior")
end

local behaviorFolder = getBehaviorFolder()
local monitored = {}
local isEnabled = false

local function safeIsDescendantOf(inst, ancestor)
    if not inst or not ancestor then return false end
    local ok, res = pcall(function() return inst:IsDescendantOf(ancestor) end)
    return ok and res
end

local function adorneeIsPlayerCharacter(h)
    if not h or not h.Parent then return false end

    local adornee = nil
    pcall(function() adornee = h.Adornee end)
    if not adornee then return false end

    local char = player.Character
    if not char then return false end

    if adornee == char then return true end

    if safeIsDescendantOf(adornee, char) then
        return true
    end

    if adornee:IsA("Model") then
        local ok, found = pcall(function()
            for _, part in ipairs(adornee:GetDescendants()) do
                if part:IsA("BasePart") and part:IsDescendantOf(char) then
                    return true
                end
            end
            return false
        end)
        if ok and found then return true end
    end

    if adornee:IsA("Attachment") then
        local parentPart = adornee.Parent
        if parentPart and safeIsDescendantOf(parentPart, char) then return true end
    end

    if adornee:IsA("Humanoid") and adornee.Parent == char then return true end

    return false
end

local function safeConnectPropertyChanged(instance, prop, fn)
    local ok, signal = pcall(function() return instance:GetPropertyChangedSignal(prop) end)
    if ok and signal then
        return signal:Connect(fn)
    end
    return nil
end

local function monitorHighlight(h)
    if not h or monitored[h] then return end
    monitored[h] = true

    local prevState = adorneeIsPlayerCharacter(h)
    local connections = {}
    local adorneeConn = nil
    local pollLoop = nil
    local alive = true

    local function cleanup()
        alive = false
        for _, conn in ipairs(connections) do
            if conn and conn.Connected then
                conn:Disconnect()
            end
        end
        if adorneeConn and adorneeConn.Connected then
            adorneeConn:Disconnect()
            adorneeConn = nil
        end
        if pollLoop then
            pollLoop:Cancel()
            pollLoop = nil
        end
        monitored[h] = nil
    end

    local function attachToCurrentAdornee()
        if adorneeConn and adorneeConn.Connected then
            adorneeConn:Disconnect()
            adorneeConn = nil
        end

        local currentAdornee = nil
        pcall(function() currentAdornee = h.Adornee end)
        if currentAdornee and currentAdornee:IsA("Instance") then
            local ok, conn = pcall(function()
                return currentAdornee.AncestryChanged:Connect(function()
                    if alive then
                        task.spawn(function()
                            onChanged()
                        end)
                    end
                end)
            end)
            if ok and conn then adorneeConn = conn end
        end
    end

    function onChanged()
        if not h or not h.Parent then return end
        local currState = adorneeIsPlayerCharacter(h)
        if prevState ~= currState then
            if currState then
                pcall(function()
                    keypress(Enum.KeyCode.Space)
                    wait(0.09)
                    keyrelease(Enum.KeyCode.Space)
                end)
            end
            prevState = currState
        end
    end

    local propConn = safeConnectPropertyChanged(h, "Adornee", function()
        attachToCurrentAdornee()
        onChanged()
    end)
    if propConn then table.insert(connections, propConn) end

    local ancestryConn = h.AncestryChanged:Connect(function(_, parent)
        if not parent then
            cleanup()
        else
            onChanged()
        end
    end)
    table.insert(connections, ancestryConn)

    table.insert(connections, player.CharacterAdded:Connect(onChanged))
    table.insert(connections, player.CharacterRemoving:Connect(onChanged))

    local cancelled = false
    pollLoop = {
        Cancel = function() cancelled = true end
    }
    task.spawn(function()
        local lastCheck = tick()
        while not cancelled and h and h.Parent do
            task.wait(0.15)
            if cancelled then break end
            local ok, curr = pcall(function() return adorneeIsPlayerCharacter(h) end)
            if ok then
                if curr ~= prevState then
                    task.spawn(onChanged)
                end
                prevState = curr
            end
        end
    end)

    attachToCurrentAdornee()
    task.spawn(onChanged)
end

local function startMonitoring()
    for _, desc in ipairs(behaviorFolder:GetDescendants()) do
        if desc:IsA("Highlight") then
            monitorHighlight(desc)
        end
    end

    behaviorFolder.DescendantAdded:Connect(function(child)
        if child:IsA("Highlight") then
            monitorHighlight(child)
        end
    end)
end

local function stopMonitoring()
    for h, _ in pairs(monitored) do
        monitored[h] = nil
    end
end

Visual:AddToggle("HighlightMonitor", {
    Text = "启用",
    Default = false,
    Callback = function(enabled)
        isEnabled = enabled
        if enabled then
            startMonitoring()
        else
            stopMonitoring()
        end
    end
})


local VirtualJoystick = {}

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")
local ContextActionService = game:GetService("ContextActionService")

function VirtualJoystick:Create()
    local self = setmetatable({}, { __index = VirtualJoystick })
    
    self.MOVE_SPEED = 16
    self.BASE_SIZE = 220
    self.KNOB_SIZE = 70
    self.MARGIN = 20
    self.MAX_RADIUS = (self.BASE_SIZE - self.KNOB_SIZE) / 2
    
    self.humanoid = nil
    self.dragging = false
    self.trackedInput = nil
    self.moveDir = Vector3.new()
    self.isEnabled = false
    
    self.screenGui = nil
    self.base = nil
    self.knob = nil
    
    self.connections = {}
    self.renderConn = nil
    
    self:_createGUI()
    self:_bindCharacter()
    
    return self
end

function VirtualJoystick:_createGUI()
    self.screenGui = Instance.new("ScreenGui")
    self.screenGui.Name = "VirtualJoystickGui"
    self.screenGui.ResetOnSpawn = false
    self.screenGui.IgnoreGuiInset = true
    self.screenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    
    self.base = Instance.new("Frame")
    self.base.Name = "JoystickBase"
    self.base.Size = UDim2.new(0, self.BASE_SIZE, 0, self.BASE_SIZE)
    self.base.AnchorPoint = Vector2.new(0, 1)
    self.base.Position = UDim2.new(0, self.MARGIN, 1, -self.MARGIN)
    self.base.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
    self.base.BackgroundTransparency = 0.55
    self.base.BorderSizePixel = 0
    self.base.Visible = false
    self.base.Parent = self.screenGui
    
    self.knob = Instance.new("Frame")
    self.knob.Name = "Knob"
    self.knob.Size = UDim2.new(0, self.KNOB_SIZE, 0, self.KNOB_SIZE)
    self.knob.AnchorPoint = Vector2.new(0.5, 0.5)
    self.knob.Position = UDim2.new(0.5, 0, 0.5, 0)
    self.knob.BackgroundColor3 = Color3.fromRGB(220, 220, 220)
    self.knob.BackgroundTransparency = 0.15
    self.knob.BorderSizePixel = 0
    self.knob.Parent = self.base
    
    local baseCorner = Instance.new("UICorner")
    baseCorner.CornerRadius = UDim.new(1, 0)
    baseCorner.Parent = self.base
    
    local knobCorner = Instance.new("UICorner")
    knobCorner.CornerRadius = UDim.new(1, 0)
    knobCorner.Parent = self.knob
    
    self:_bindInputEvents()
end

function VirtualJoystick:_bindInputEvents()
    table.insert(self.connections, self.base.InputBegan:Connect(function(input)
        if input.UserInputType ~= Enum.UserInputType.Touch then return end
        self.dragging = true
        self.trackedInput = input
        self:_blockCameraTouch()
        self:_updateFromFinger(Vector2.new(input.Position.X, input.Position.Y))
    end))
    
    table.insert(self.connections, self.base.InputChanged:Connect(function(input)
        if not self.dragging then return end
        if input.UserInputType ~= Enum.UserInputType.Touch then return end
        if input ~= self.trackedInput then return end
        self:_updateFromFinger(Vector2.new(input.Position.X, input.Position.Y))
    end))
    
    table.insert(self.connections, self.base.InputEnded:Connect(function(input)
        if input.UserInputType ~= Enum.UserInputType.Touch then return end
        if input ~= self.trackedInput then return end
        self.dragging = false
        self.trackedInput = nil
        self:_unblockCameraTouch()
        self:_resetKnob()
    end))
end

function VirtualJoystick:_bindCharacter()
    local player = Players.LocalPlayer
    
    local function bindCharacter(char)
        self.humanoid = nil
        if char then
            self.humanoid = char:FindFirstChild("Humanoid") or char:WaitForChild("Humanoid")
        end
    end
    
    if player.Character then
        bindCharacter(player.Character)
    end
    
    table.insert(self.connections, player.CharacterAdded:Connect(bindCharacter))
    table.insert(self.connections, player.CharacterRemoving:Connect(function()
        self.humanoid = nil
    end))
end

function VirtualJoystick:_ensureSizes()
    if not self.base or not self.knob then return end
    if self.base.AbsoluteSize.Magnitude == 0 or self.knob.AbsoluteSize.Magnitude == 0 then
        for i = 1, 4 do RunService.Heartbeat:Wait() end
    end
end

function VirtualJoystick:_baseCenter()
    local pos = self.base.AbsolutePosition
    local size = self.base.AbsoluteSize
    return Vector2.new(pos.X + size.X * 0.5, pos.Y + size.Y * 0.5)
end

function VirtualJoystick:_updateFromFinger(fingerPos)
    self:_ensureSizes()
    local center = self:_baseCenter()
    local delta = Vector2.new(fingerPos.X - center.X, fingerPos.Y - center.Y)
    local clamped = delta
    if clamped.Magnitude > self.MAX_RADIUS then
        clamped = clamped.Unit * self.MAX_RADIUS
    end
    
    self.knob.Position = UDim2.new(0.5, clamped.X, 0.5, clamped.Y)
    
    local x = math.clamp(clamped.X / self.MAX_RADIUS, -1, 1)
    local inputY = math.clamp(clamped.Y / self.MAX_RADIUS, -1, 1)
    local z = inputY
    
    self.moveDir = Vector3.new(x, 0, z)
end

function VirtualJoystick:_resetKnob()
    self.moveDir = Vector3.new()
    self:_ensureSizes()
    
    pcall(function()
        local tween = TweenService:Create(self.knob, TweenInfo.new(0.12, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
            Position = UDim2.new(0.5, 0, 0.5, 0)
        })
        tween:Play()
    end)
end

function VirtualJoystick:_blockCameraTouch()
    ContextActionService:BindAction("VirtualJoystick_BlockCamera", function(actionName, inputState, inputObject)
        if not self.trackedInput then
            return Enum.ContextActionResult.Pass
        end
        if inputObject == self.trackedInput then
            return Enum.ContextActionResult.Sink
        end
        return Enum.ContextActionResult.Pass
    end, false, Enum.UserInputType.Touch)
end

function VirtualJoystick:_unblockCameraTouch()
    ContextActionService:UnbindAction("VirtualJoystick_BlockCamera")
end

function VirtualJoystick:Show()
    if not self.screenGui.Parent then
        self.screenGui.Parent = Players.LocalPlayer:WaitForChild("PlayerGui")
    end
    self.base.Visible = true
    self:_resetKnob()
end

function VirtualJoystick:Hide()
    self.base.Visible = false
    self:_resetKnob()
end

function VirtualJoystick:EnableMovement()
    if self.renderConn and self.renderConn.Connected then return end
    self.renderConn = RunService.RenderStepped:Connect(function()
        if self.humanoid and self.humanoid.Health > 0 then
            self.humanoid:Move(self.moveDir * self.MOVE_SPEED, true)
        end
    end)
end

function VirtualJoystick:DisableMovement()
    if self.renderConn and self.renderConn.Connected then
        self.renderConn:Disconnect()
        self.renderConn = nil
    end
    self.moveDir = Vector3.new()
    self:_resetKnob()
    self:_unblockCameraTouch()
end

function VirtualJoystick:Destroy()
    self:DisableMovement()
    if self.screenGui and self.screenGui.Parent then
        self.screenGui.Parent = nil
    end
    pcall(function() self.screenGui:Destroy() end)
end

local joystick = VirtualJoystick:Create()

Visual:AddToggle("VirtualJoystickToggle", {
    Text = "虚拟摇杆",
    Default = false,
    Callback = function(enabled)
        if enabled then
            joystick:Show()
            joystick:EnableMovement()
        else
            joystick:Hide()
            joystick:DisableMovement()
        end
    end
})


local ZZ = Tabs.Bro:AddLeftGroupbox('007n7自动分身格挡')

local config_007n7 = {
    Enabled = false,
    BaseDistance = 18,
    ScanInterval = 0.001,
    BlockCooldown = 0.08,
    MoveCompBase = 1.5,
    MoveCompFactor = 0.25,
    SpeedThreshold = 8,
    PredictBase = 4,
    PredictMax = 12,
    PredictFactor = 0.35,
    TargetAngle = 50,
    MinAttackSpeed = 12,
    ShowVisualization = false,
    EnablePrediction = false,
    PingCompensation = 0.1,
    FastKillerAdjust = 1.3,
    TargetSoundIds = {
        "102228729296384", "140242176732868", "112809109188560", "136323728355613",
        "115026634746636", "84116622032112", "108907358619313", "127793641088496",
        "86174610237192", "95079963655241", "101199185291628", "119942598489800",
        "84307400688050", "113037804008732", "105200830849301", "75330693422988",
        "82221759983649", "81702359653578", "108610718831698", "112395455254818",
        "109431876587852", "109348678063422", "85853080745515", "12222216"
    }
}

pcall(function()
    local Players = game:GetService("Players")
    local ReplicatedStorage = game:GetService("ReplicatedStorage")
    local RunService = game:GetService("RunService")
    local Stats = game:GetService("Stats")
    
    local soundLookup = {}
    for _, id in ipairs(config_007n7.TargetSoundIds) do
        soundLookup[id] = true
        soundLookup["rbxassetid://" .. id] = true
    end
    
    local LocalPlayer = Players.LocalPlayer
    local lastBlockTime = 0
    local combatConnection = nil
    local lastScanTime = 0
    local visualizationParts = {}
    local soundCache = {}
    local lastSoundCheck = 0
    local lastPingCheck = 0
    local currentPing = 0
    
    local function SafeCall(func, ...)
        local success, result = pcall(func, ...)
        if not success then
            return nil
        end
        return result
    end
    
    local function GetPing()
        local currentTime = os.clock()
        if currentTime - lastPingCheck < 0.5 then
            return currentPing
        end
        lastPingCheck = currentTime
        
        local stats = SafeCall(function()
            return Stats and Stats.Network and Stats.Network:FindFirstChild("ServerStatsItem")
        end)
        if stats then
            local pingStat = stats:FindFirstChild("Data Ping")
            if pingStat then
                currentPing = pingStat.Value
                return currentPing
            end
        end
        
        return 0
    end
    
    local function GetPingCompensation()
        local ping = GetPing()
        return math.min(0.3, ping / 1000 * config_007n7.PingCompensation * 10)
    end
    
    local function CreateVisualization()
        if not LocalPlayer.Character then return end
        local rootPart = SafeCall(function() return LocalPlayer.Character:FindFirstChild("HumanoidRootPart") end)
        if not rootPart then return end
        
        for _, part in ipairs(visualizationParts) do
            SafeCall(function() part:Destroy() end)
        end
        visualizationParts = {}
        
        local center = rootPart.Position
        local distance = config_007n7.BaseDistance
        local angle = math.rad(config_007n7.TargetAngle)
        local segments = 36
        
        local basePart = Instance.new("Part")
        basePart.Size = Vector3.new(0.1, 0.1, 0.1)
        basePart.Position = center + Vector3.new(0, 0.1, 0)
        basePart.Anchored = true
        basePart.CanCollide = false
        basePart.Transparency = 1
        basePart.Parent = workspace
        table.insert(visualizationParts, basePart)
        
        for i = 1, segments do
            local part = Instance.new("Part")
            part.Size = Vector3.new(0.5, 0.1, 0.5)
            part.BrickColor = BrickColor.new("Bright green")
            part.Material = Enum.Material.Neon
            part.Transparency = 0.7
            part.Anchored = true
            part.CanCollide = false
            part.Parent = workspace
            table.insert(visualizationParts, part)
        end
        
        local function UpdateVisualization()
            if not config_007n7.ShowVisualization then return end
            if not LocalPlayer.Character then return end
            local root = SafeCall(function() return LocalPlayer.Character:FindFirstChild("HumanoidRootPart") end)
            if not root then return end
            
            local center = root.Position + Vector3.new(0, 0.1, 0)
            local lookVector = root.CFrame.LookVector
            local distance = config_007n7.BaseDistance
            local angle = math.rad(config_007n7.TargetAngle)
            
            basePart.Position = center
            
            for i = 1, #visualizationParts - 1 do
                local part = visualizationParts[i + 1]
                local segmentAngle = (i - 1) * (2 * angle) / (#visualizationParts - 2) - angle
                local rotCFrame = CFrame.fromAxisAngle(Vector3.new(0, 1, 0), segmentAngle)
                local dir = rotCFrame:VectorToWorldSpace(lookVector)
                local pos = center + dir * distance
                part.Position = pos
                part.Size = Vector3.new(0.5, 0.1, 0.5)
            end
        end
        
        local visConnection
        visConnection = RunService.Heartbeat:Connect(function()
            if not config_007n7.ShowVisualization then
                for _, part in ipairs(visualizationParts) do
                    SafeCall(function() part:Destroy() end)
                end
                visualizationParts = {}
                SafeCall(function() visConnection:Disconnect() end)
                return
            end
            SafeCall(UpdateVisualization)
        end)
    end
    
    local function HasTargetSound(character)
        if not character then return false end
        local rootPart = SafeCall(function() return character:FindFirstChild("HumanoidRootPart") end)
        if not rootPart then return false end
        
        local currentTime = os.clock()
        if currentTime - lastSoundCheck < 0.0005 then
            return soundCache[character] or false
        end
        lastSoundCheck = currentTime
        
        local found = false
        for _, child in ipairs(rootPart:GetChildren()) do
            if child:IsA("Sound") and child.IsPlaying then
                local soundId = SafeCall(function() return tostring(child.SoundId) end)
                if soundId then
                    local numericId = string.match(soundId, "(%d+)$")
                    if numericId and soundLookup[numericId] then
                        found = true
                        break
                    end
                end
            end
        end
        
        soundCache[character] = found
        return found
    end
    
    local function GetMoveCompensation()
        if not LocalPlayer.Character then return 0 end
        local rootPart = SafeCall(function() return LocalPlayer.Character:FindFirstChild("HumanoidRootPart") end)
        if not rootPart then return 0 end
        
        local velocity = rootPart.Velocity
        local speed = math.sqrt(velocity.X^2 + velocity.Y^2 + velocity.Z^2)
        return config_007n7.MoveCompBase + (speed * config_007n7.MoveCompFactor)
    end
    
    local function IsFastKiller(killer)
        if not killer then return false end
        local killerRoot = SafeCall(function() return killer:FindFirstChild("HumanoidRootPart") end)
        if not killerRoot then return false end
        
        local killerVel = killerRoot.Velocity
        local killerSpeed = math.sqrt(killerVel.X^2 + killerVel.Y^2 + killerVel.Z^2)
        return killerSpeed > config_007n7.MinAttackSpeed
    end
    
    local function GetTotalDetectionRange(killer)
        local base = config_007n7.BaseDistance
        local moveBonus = GetMoveCompensation()
        local predict = 0
        local pingBonus = GetPingCompensation() * 5
        
        if config_007n7.EnablePrediction and killer then
            local killerRoot = SafeCall(function() return killer:FindFirstChild("HumanoidRootPart") end)
            if killerRoot then
                local killerVel = killerRoot.Velocity
                local killerSpeed = math.sqrt(killerVel.X^2 + killerVel.Y^2 + killerVel.Z^2)
                
                if killerSpeed > config_007n7.SpeedThreshold then
                    predict = math.min(
                        config_007n7.PredictMax, 
                        config_007n7.PredictBase + (killerSpeed * config_007n7.PredictFactor)
                    )
                end
                
                if IsFastKiller(killer) then
                    predict = predict * config_007n7.FastKillerAdjust
                end
            end
        end
        
        return base + moveBonus + predict + pingBonus
    end
    
    local function IsTargetingMe(killer)
        local myCharacter = LocalPlayer.Character
        if not myCharacter then return false end
        
        local myRoot = SafeCall(function() return myCharacter:FindFirstChild("HumanoidRootPart") end)
        local killerRoot = SafeCall(function() return killer and killer:FindFirstChild("HumanoidRootPart") end)
        if not myRoot or not killerRoot then return false end
        
        local directionToMe = (myRoot.Position - killerRoot.Position).Unit
        local killerLook = killerRoot.CFrame.LookVector
        
        local dot = directionToMe:Dot(killerLook)
        local angle = math.deg(math.acos(math.clamp(dot, -1, 1)))
        
        return angle <= config_007n7.TargetAngle
    end
    
    local function GetThreateningKillers()
        local killers = {}
        local killersFolder = SafeCall(function() 
            return workspace:FindFirstChild("Killers") or (workspace:FindFirstChild("Players") and workspace.Players:FindFirstChild("Killers"))
        end)
        if not killersFolder then return killers end
        
        local myCharacter = LocalPlayer.Character
        if not myCharacter then return killers end
        
        local myRoot = SafeCall(function() return myCharacter:FindFirstChild("HumanoidRootPart") end)
        if not myRoot then return killers end
        
        for _, killer in ipairs(killersFolder:GetChildren()) do
            if SafeCall(function() return killer:IsA("Model") and killer:FindFirstChild("HumanoidRootPart") end) then
                local killerRoot = killer.HumanoidRootPart
                local distance = (myRoot.Position - killerRoot.Position).Magnitude
                local detectionRange = GetTotalDetectionRange(killer)
                
                local isThreatening = false
                
                if distance <= detectionRange then
                    if HasTargetSound(killer) then
                        isThreatening = true
                    elseif distance <= 8 then
                        isThreatening = IsTargetingMe(killer)
                    end
                end
                
                if isThreatening then
                    table.insert(killers, killer)
                end
            end
        end
        
        return killers
    end
    
    local function GetAdjustedCooldown()
        local ping = GetPing()
        return math.max(0.05, config_007n7.BlockCooldown - (ping / 1000 * 0.5))
    end
    
    local function PerformBlock()
        local now = os.clock()
        if now - lastBlockTime >= GetAdjustedCooldown() then
            SafeCall(function()
                local args = {
                    "UseActorAbility",
                    {
                        buffer.fromstring("\"Clone\"")
                    }
                }
                game:GetService("ReplicatedStorage"):WaitForChild("Modules"):WaitForChild("Network"):WaitForChild("RemoteEvent"):FireServer(unpack(args))
                lastBlockTime = now
            end)
        end
    end
    
    local function CombatLoop()
        local currentTime = os.clock()
        if currentTime - lastScanTime >= config_007n7.ScanInterval then
            lastScanTime = currentTime
            local killers = GetThreateningKillers()
            if #killers > 0 then
                PerformBlock()
            end
        end
    end
    
    ZZ:AddToggle("AutoBlockToggle", {
        Text = "自动分身",
        Default = false,
        Callback = function(enabled)
            config_007n7.Enabled = enabled
            if enabled then
                if combatConnection then
                    SafeCall(function() combatConnection:Disconnect() end)
                end
                combatConnection = RunService.Stepped:Connect(function()
                    SafeCall(CombatLoop)
                end)
            elseif combatConnection then
                SafeCall(function() combatConnection:Disconnect() end)
                combatConnection = nil
            end
        end
    })
    
    ZZ:AddSlider("BaseDistance", {
        Text = "格挡距离",
        Default = 18,
        Min = 5,
        Max = 30,
        Rounding = 1,
        Callback = function(value)
            config_007n7.BaseDistance = value
        end
    })
    
    ZZ:AddSlider("TargetAngleSlider", {
        Text = "格挡角度",
        Default = 70,
        Min = 10,
        Max = 180,
        Rounding = 1,
        Callback = function(value)
            config_007n7.TargetAngle = value
        end
    })
    
    ZZ:AddToggle("VisualizationToggle", {
        Text = "可视化",
        Default = false,
        Callback = function(enabled)
            config_007n7.ShowVisualization = enabled
            if enabled then
                CreateVisualization()
            else
                for _, part in ipairs(visualizationParts) do
                    SafeCall(function() part:Destroy() end)
                end
                visualizationParts = {}
            end
        end
    })
    
    LocalPlayer.CharacterAdded:Connect(function()
        if config_007n7.Enabled and combatConnection then
            SafeCall(function() combatConnection:Disconnect() end)
            combatConnection = RunService.Stepped:Connect(CombatLoop)
        end
        if config_007n7.ShowVisualization then
            CreateVisualization()
        end
    end)
end)


local RunService = game:GetService("RunService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")

local MVP = Tabs.Sat:AddLeftGroupbox("体力设置")

local StaminaSettings = {
    MaxStamina = 100,
    StaminaGain = 25,
    StaminaLoss = 10,
    SprintSpeed = 28,
    InfiniteGain = 9999
}

local SettingToggles = {
    MaxStamina = false,
    StaminaGain = false,
    StaminaLoss = false,
    SprintSpeed = false
}

local SprintingModule = ReplicatedStorage:WaitForChild("Systems"):WaitForChild("Character"):WaitForChild("Game"):WaitForChild("Sprinting")
local GetModule = function() return require(SprintingModule) end

task.spawn(function()
    while true do
        local m = GetModule()
        for key, value in pairs(StaminaSettings) do
            if SettingToggles[key] then
                m[key] = value
            end
        end
        task.wait(0.5)
    end
end)

local bai = {Spr = false}
local connection

MVP:AddToggle('MyToggle', {
    Text = '无限体力',
    Default = false,
    Tooltip = '无限体力',
    Callback = function(state)
        bai.Spr = state
        local Sprinting = GetModule()

        if state then
            Sprinting.StaminaLoss = 0
            Sprinting.StaminaGain = StaminaSettings.InfiniteGain

            if connection then connection:Disconnect() end
            connection = RunService.Heartbeat:Connect(function()
                if not bai.Spr then return end
                Sprinting.StaminaLoss = 0
                Sprinting.StaminaGain = StaminaSettings.InfiniteGain
            end)
        else
            Sprinting.StaminaLoss = 10
            Sprinting.StaminaGain = 25

            if connection then
                connection:Disconnect()
                connection = nil
            end
        end
    end
})

MVP:AddToggle('MaxStaminaToggle', {
    Text = '启用体力调整',
    Default = false,
    Callback = function(Value)
        SettingToggles.MaxStamina = Value
    end
})

MVP:AddToggle('StaminaGainToggle', {
    Text = '启用体力恢复调整',
    Default = false,
    Callback = function(Value)
        SettingToggles.StaminaGain = Value
    end
})

MVP:AddToggle('StaminaLossToggle', {
    Text = '启用体力消耗调整',
    Default = false,
    Callback = function(Value)
        SettingToggles.StaminaLoss = Value
    end
})

MVP:AddToggle('SprintSpeedToggle', {
    Text = '启用奔跑速度调整',
    Default = false,
    Callback = function(Value)
        SettingToggles.SprintSpeed = Value
    end
})

local MVP2 = Tabs.Sat:AddRightGroupbox("调试设置")

MVP2:AddSlider('InfStaminaGainSlider', {
    Text = '无限体力恢复速度',
    Default = 9999,
    Min = 0,
    Max = 10000,
    Rounding = 0,
    Callback = function(Value)
        StaminaSettings.InfiniteGain = Value
        if bai.Spr then
            local Sprinting = GetModule()
            Sprinting.StaminaGain = Value
        end
    end
})

MVP2:AddSlider('MySlider1', {
    Text = '最大体力值',
    Default = 100,
    Min = 0,
    Max = 9999,
    Rounding = 0,
    Callback = function(Value)
        StaminaSettings.MaxStamina = Value
        if SettingToggles.MaxStamina then
            local Sprinting = GetModule()
            Sprinting.MaxStamina = Value
        end
    end
})

MVP2:AddSlider('MySlider2', {
    Text = '体力恢复速度',
    Default = 25,
    Min = 0,
    Max = 500,
    Rounding = 0,
    Callback = function(Value)
        StaminaSettings.StaminaGain = Value
        if SettingToggles.StaminaGain and not bai.Spr then
            local Sprinting = GetModule()
            Sprinting.StaminaGain = Value
        end
    end
})

MVP2:AddSlider('MySlider3', {
    Text = '体力消耗速度',
    Default = 10,
    Min = 0,
    Max = 800,
    Rounding = 0,
    Callback = function(Value)
        StaminaSettings.StaminaLoss = Value
        if SettingToggles.StaminaLoss and not bai.Spr then
            local Sprinting = GetModule()
            Sprinting.StaminaLoss = Value
        end
    end
})

MVP2:AddSlider('MySlider4', {
    Text = '奔跑速度',
    Default = 28,
    Min = 0,
    Max = 200,
    Rounding = 0,
    Callback = function(Value)
        StaminaSettings.SprintSpeed = Value
        if SettingToggles.SprintSpeed then
            local Sprinting = GetModule()
            Sprinting.SprintSpeed = Value
        end
    end
})












local Generator = Tabs.zdx:AddLeftGroupbox("自动修机")

Generator:AddSlider("RepairSpeed", {
    Text = "修机速度 (s)",
    Default = 4,
    Min = 1,
    Max = 5,
    Rounding = 1,
    Compact = false,
    Callback = function(v)
        _G.CustomSpeed = v
    end
})

Generator:AddToggle("AutoGenerator",{
    Text = "自动修机",
    Default = false,
    Callback = function(v)
        _G.AutoGen = v
        task.spawn(function()
            while _G.AutoGen do
                if game:GetService("Players").LocalPlayer.PlayerGui:FindFirstChild("PuzzleUI") then
                    local delayTime = _G.CustomSpeed or 4
                    
                    wait(delayTime)
                    
                    for _,v in ipairs(workspace["Map"]["Ingame"]["Map"]:GetChildren()) do
                        if v.Name == "Generator" then
                            v["Remotes"]["RE"]:FireServer()
                        end
                    end
                end
                wait()
            end
        end)
    end
})

Generator:AddToggle("InstantRepair", {
    Text = "秒修机",
    Default = false,
    Callback = function(v)
        _G.InstantRepair = v
        task.spawn(function()
            while _G.InstantRepair do
                if game:GetService("Players").LocalPlayer.PlayerGui:FindFirstChild("PuzzleUI") then
                    -- 等待1秒后执行前两次事件
                    wait(1)
                    for i = 1, 2 do
                        for _,v in ipairs(workspace["Map"]["Ingame"]["Map"]:GetChildren()) do
                            if v.Name == "Generator" then
                                v["Remotes"]["RE"]:FireServer()
                            end
                        end
                    end
                    
                    -- 再等待2秒后执行后两次事件
                    wait(2)
                    for i = 1, 2 do
                        for _,v in ipairs(workspace["Map"]["Ingame"]["Map"]:GetChildren()) do
                            if v.Name == "Generator" then
                                v["Remotes"]["RE"]:FireServer()
                            end
                        end
                    end
                end
                wait()
            end
        end)
    end
})



local KillerSurvival = Tabs.zdx:AddRightGroupbox('传送修机[危险]')

KillerSurvival:AddButton({
    Text = '传送到发电机',
    Func = function()
        local player = game.Players.LocalPlayer
        local character = player.Character
        if not character or not character:FindFirstChild("HumanoidRootPart") then return end
        
        local generators = workspace.Map.Ingame.Map:GetChildren()
        for _, generator in ipairs(generators) do
            if generator.Name == "Generator" and 
               generator:FindFirstChild("Progress") and 
               generator.Progress.Value < 100 then
                
                local generatorPart = generator:FindFirstChild("Main") or  
                                     generator:FindFirstChild("Model") or
                                     generator:FindFirstChild("Base")
                
                if generatorPart then
                    character.HumanoidRootPart.CFrame = generatorPart.CFrame + Vector3.new(0, 3, 0)
                    return  
                end
            end
        end
        warn("没有找到可修理的发电机")
    end
})

KillerSurvival:AddToggle("AutoFix", {
    Text = "自动发电机农场",
    Default = false,
    Callback = function(enabled)
        local threadId = tostring(math.random(1, 99999))
        _G.AutoFixThreadId = threadId
        
        local function shouldContinue()
            return _G.AutoFixThreadId == threadId and enabled
        end
        
        local function allGeneratorsFixed()
            for _, v in ipairs(workspace.Map.Ingame.Map:GetChildren()) do
                if v.Name == "Generator" and v:FindFirstChild("Progress") and v.Progress.Value < 100 then
                    return false
                end
            end
            return true
        end
        
        local function fastInteract(generator, action)
            local args = {[1] = action}
            pcall(function()
                generator.Remotes.RF:InvokeServer(unpack(args))
            end)
        end

        local function fastRepair(generator)
            pcall(function()
                generator.Remotes.RE:FireServer()
            end)
        end
        
        local function runGenerator()
            while shouldContinue() and not allGeneratorsFixed() do
                local generators = {}
                for _, v in ipairs(workspace.Map.Ingame.Map:GetChildren()) do
                    if v.Name == "Generator" and v:FindFirstChild("Progress") and v.Progress.Value < 100 then
                        table.insert(generators, v)
                    end
                end
                
                for _, generator in ipairs(generators) do
                    if not shouldContinue() then break end
                    
                    local char = game.Players.LocalPlayer.Character
                    if char and char:FindFirstChild("HumanoidRootPart") then
                        -- 传送(0.5秒)
                        local startTP = tick()
                        
                        -- 寻找传送点
                        local bestPos, minDist = nil, math.huge
                        if generator:FindFirstChild("Positions") then
                            for _, pos in ipairs(generator.Positions:GetChildren()) do
                                local dist = (char.HumanoidRootPart.Position - pos.Position).Magnitude
                                if dist < minDist then
                                    bestPos = pos
                                    minDist = dist
                                end
                            end
                            
                            if bestPos then
                                char.HumanoidRootPart.CFrame = bestPos.CFrame * CFrame.new(0, 0, -1.2) -- 传送位置
                            end
                        end
                        
                        -- 精确控制传送时间
                        local elapsed = tick() - startTP
                        if elapsed < 0.17 then
                            task.wait(0.17 - elapsed)
                        end
                        
                        -- 交互流程
                        fastInteract(generator, "enter")
                        task.wait(0.00001) -- 最小必要等待
                        
                        -- 单次修理
                        fastRepair(generator)
                        task.wait(0.1) -- 修理确认时间
                        
                        -- 立即离开
                        fastInteract(generator, "leave")
                        
                        -- 循环等待
                        task.wait(0.000000000000001) -- 电机间间隔
                    end
                end
                
                if shouldContinue() then
                    task.wait(0.000000000000000001) -- 循环缓冲
                end
            end
        end

        if enabled then
            if _G.AutoFixThread then
                _G.AutoFixThreadId = tostring(math.random(1, 99999))
                task.cancel(_G.AutoFixThread)
            end
            _G.AutoFixThread = task.spawn(runGenerator)
        else
            _G.AutoFixThreadId = tostring(math.random(1, 99999))
            if _G.AutoFixThread then
                task.cancel(_G.AutoFixThread)
                _G.AutoFixThread = nil
            end
        end
    end
})





local ZZ = Tabs.zdx:AddRightGroupbox('切换服务器')

ZZ:AddButton({
    Text = "Switching server", 
    Func = function()
        local TeleportService = game:GetService("TeleportService")
        local Players = game:GetService("Players")
        local HttpService = game:GetService("HttpService")
        
        local requestFunc = http_request or syn.request or request
        if not requestFunc then return end
            
        local url = "https://games.roblox.com/v1/games/"..game.PlaceId.."/servers/Public?sortOrder=Asc&limit=100"
        local response = requestFunc({Url = url, Method = "GET"})
        
        if response.StatusCode == 200 then
            local data = HttpService:JSONDecode(response.Body)
            if data and data.data and #data.data > 0 then
                TeleportService:TeleportToPlaceInstance(game.PlaceId, data.data[math.random(1, #data.data)].id, Players.LocalPlayer)
            end
        end
    end
})





local Visual = Tabs.Esp:AddRightGroupbox("高亮绘制")

local HighlightSystem = {
    Enabled = false,
    Settings = {
        ShowSurvivors = true,
        ShowKillers = true,
        AutoRefresh = true,
        RefreshRate = 1, -- 默认1秒刷新一次
        Colors = {
            Survivor = Color3.fromRGB(0, 255, 255),
            Killer = Color3.fromRGB(204, 0, 0)
        },
        Transparency = {
            Fill = 0.9,
            Outline = 0
        }
    },
    Cache = {
        Highlights = {},
        Connections = {},
        LastRefreshTime = 0
    }
}

-- 清理无效高亮
local function CleanupInvalidHighlights()
    local charsToRemove = {}
    
    for char, highlight in pairs(HighlightSystem.Cache.Highlights) do
        if not char or not char.Parent or not char:FindFirstChild("Humanoid") then
            pcall(function()
                highlight:Destroy()
            end)
            charsToRemove[char] = true
        end
    end
    
    for char in pairs(charsToRemove) do
        HighlightSystem.Cache.Highlights[char] = nil
    end
end

-- 创建高亮
local function CreateHighlight(char, isKiller)
    if not char or not char.Parent then return nil end
    
    local highlight = Instance.new("Highlight")
    highlight.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
    highlight.FillColor = isKiller and HighlightSystem.Settings.Colors.Killer 
                                     or HighlightSystem.Settings.Colors.Survivor
    highlight.OutlineColor = highlight.FillColor
    highlight.FillTransparency = HighlightSystem.Settings.Transparency.Fill
    highlight.OutlineTransparency = HighlightSystem.Settings.Transparency.Outline
    highlight.Parent = char
    
    -- 监听角色移除
    local charConnection
    charConnection = char.AncestryChanged:Connect(function(_, parent)
        if not parent then
            if highlight and highlight.Parent then
                highlight:Destroy()
            end
            if charConnection then
                charConnection:Disconnect()
            end
            HighlightSystem.Cache.Highlights[char] = nil
        end
    end)
    
    return highlight
end

-- 刷新高亮
local function RefreshHighlights()
    if not HighlightSystem.Enabled then return end
    
    CleanupInvalidHighlights()
    
    -- 更新幸存者
    if HighlightSystem.Settings.ShowSurvivors then
        local survivors = workspace.Players:FindFirstChild("Survivors")
        if survivors then
            for _, char in ipairs(survivors:GetChildren()) do
                if char:IsA("Model") and char:FindFirstChild("Humanoid") and char.Humanoid.Health > 0 then
                    if not HighlightSystem.Cache.Highlights[char] then
                        HighlightSystem.Cache.Highlights[char] = CreateHighlight(char, false)
                    end
                end
            end
        end
    else
        -- 隐藏幸存者高亮
        local survivors = workspace.Players:FindFirstChild("Survivors")
        if survivors then
            for _, char in ipairs(survivors:GetChildren()) do
                if HighlightSystem.Cache.Highlights[char] then
                    HighlightSystem.Cache.Highlights[char]:Destroy()
                    HighlightSystem.Cache.Highlights[char] = nil
                end
            end
        end
    end
    
    -- 更新杀手
    if HighlightSystem.Settings.ShowKillers then
        local killers = workspace.Players:FindFirstChild("Killers")
        if killers then
            for _, char in ipairs(killers:GetChildren()) do
                if char:IsA("Model") and char:FindFirstChild("Humanoid") and char.Humanoid.Health > 0 then
                    if not HighlightSystem.Cache.Highlights[char] then
                        HighlightSystem.Cache.Highlights[char] = CreateHighlight(char, true)
                    end
                end
            end
        end
    else
        -- 隐藏杀手高亮
        local killers = workspace.Players:FindFirstChild("Killers")
        if killers then
            for _, char in ipairs(killers:GetChildren()) do
                if HighlightSystem.Cache.Highlights[char] then
                    HighlightSystem.Cache.Highlights[char]:Destroy()
                    HighlightSystem.Cache.Highlights[char] = nil
                end
            end
        end
    end
end

-- 主更新循环
local function UpdateLoop()
    if not HighlightSystem.Enabled then return end
    
    local currentTime = tick()
    
    -- 自动刷新
    if HighlightSystem.Settings.AutoRefresh then
        if currentTime - HighlightSystem.Cache.LastRefreshTime >= HighlightSystem.Settings.RefreshRate then
            RefreshHighlights()
            HighlightSystem.Cache.LastRefreshTime = currentTime
        end
    end
end

-- UI控制按钮
Visual:AddToggle("HL_MainToggle", {
    Text = "启用高亮绘制",
    Default = false,
    Callback = function(state)
        HighlightSystem.Enabled = state
        if state then
            if not HighlightSystem.Cache.Connections["Main"] then
                HighlightSystem.Cache.Connections["Main"] = game:GetService("RunService").Heartbeat:Connect(UpdateLoop)
            end
            RefreshHighlights()
        else
            if HighlightSystem.Cache.Connections["Main"] then
                HighlightSystem.Cache.Connections["Main"]:Disconnect()
                HighlightSystem.Cache.Connections["Main"] = nil
            end
            for char, highlight in pairs(HighlightSystem.Cache.Highlights) do
                pcall(function()
                    highlight:Destroy()
                end)
            end
            HighlightSystem.Cache.Highlights = {}
        end
    end
})

-- 手动刷新按钮
Visual:AddButton("HL_RefreshButton", {
    Text = "刷新高亮",
    Func = function()
        RefreshHighlights()
    end
})

-- 自动刷新开关
Visual:AddToggle("HL_AutoRefresh", {
    Text = "自动刷新",
    Default = true,
    Callback = function(state)
        HighlightSystem.Settings.AutoRefresh = state
    end
})

-- 刷新频率滑块
Visual:AddSlider("HL_RefreshRate", {
    Text = "刷新频率(秒)",
    Min = 0.5,
    Max = 5,
    Default = 1,
    Rounding = 1,
    Callback = function(value)
        HighlightSystem.Settings.RefreshRate = value
    end
})

-- 幸存者开关
Visual:AddToggle("HL_SurvivorToggle", {
    Text = "绘制幸存者",
    Default = true,
    Callback = function(state)
        HighlightSystem.Settings.ShowSurvivors = state
        RefreshHighlights()
    end
})

-- 杀手开关
Visual:AddToggle("HL_KillerToggle", {
    Text = "绘制杀手", 
    Default = true,
    Callback = function(state)
        HighlightSystem.Settings.ShowKillers = state
        RefreshHighlights()
    end
})

-- 透明度控制
Visual:AddSlider("HL_FillTransparency", {
    Text = "填充透明度",
    Min = 0,
    Max = 1,
    Default = 0.9,
    Rounding = 1,
    Callback = function(value)
        HighlightSystem.Settings.Transparency.Fill = value
        for char, highlight in pairs(HighlightSystem.Cache.Highlights) do
            if highlight and highlight.Parent then
                highlight.FillTransparency = value
            end
        end
    end
})

Visual:AddSlider("HL_OutlineTransparency", {
    Text = "边缘透明度",
    Min = 0,
    Max = 1,
    Default = 0,
    Rounding = 1,
    Callback = function(value)
        HighlightSystem.Settings.Transparency.Outline = value
        for char, highlight in pairs(HighlightSystem.Cache.Highlights) do
            if highlight and highlight.Parent then
                highlight.OutlineTransparency = value
            end
        end
    end
})


local Visual = Tabs.Esp:AddLeftGroupbox("名字绘制")
local NameTagSettings = {
    ShowSurvivorNames = true,
    ShowKillerNames = true,
    BaseTextSize = 14,
    MinTextSize = 8,
    MaxTextSize = 18,
    TextOffset = Vector3.new(0, 3, 0),
    MaxDistance = 100, -- 最大显示距离
    SurvivorColor = Color3.fromRGB(0, 191, 255),
    KillerColor = Color3.fromRGB(255, 0, 0),
    ShowDistance = true,
    AutoRefresh = true,
    RefreshRate = 0.5 -- 刷新频率
}

local NameTagBillboards = {}
local LastUpdateTime = 0

-- 创建名称标签
local function createNameTag(character, isKiller)
    if not character or not character.Parent then return nil end
    
    local head = character:FindFirstChild("Head")
    if not head then return nil end
    
    -- 如果已存在，先清理
    if NameTagBillboards[character] then
        if NameTagBillboards[character].Billboard then
            NameTagBillboards[character].Billboard:Destroy()
        end
    end
    
    local billboard = Instance.new("BillboardGui")
    billboard.Name = "NameTagESP"
    billboard.Size = UDim2.new(0, 200, 0, 40)
    billboard.StudsOffset = NameTagSettings.TextOffset
    billboard.Adornee = head
    billboard.AlwaysOnTop = true
    billboard.Enabled = false
    billboard.Parent = head
    
    local textLabel = Instance.new("TextLabel")
    textLabel.Size = UDim2.new(1, 0, 1, 0)
    textLabel.BackgroundTransparency = 1
    textLabel.TextScaled = false
    textLabel.Font = Enum.Font.Arcade
    textLabel.TextStrokeTransparency = 0
    textLabel.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
    textLabel.TextXAlignment = Enum.TextXAlignment.Center
    textLabel.TextYAlignment = Enum.TextYAlignment.Center
    textLabel.Parent = billboard
    
    NameTagBillboards[character] = {
        Billboard = billboard,
        TextLabel = textLabel,
        IsKiller = isKiller
    }
    
    -- 监听角色移除
    character.AncestryChanged:Connect(function(_, parent)
        if not parent then
            if NameTagBillboards[character] then
                if NameTagBillboards[character].Billboard then
                    NameTagBillboards[character].Billboard:Destroy()
                end
                NameTagBillboards[character] = nil
            end
        end
    end)
    
    return billboard
end

-- 清理无效的名称标签
local function cleanupInvalidNameTags()
    local charsToRemove = {}
    
    for character, data in pairs(NameTagBillboards) do
        if not character or not character.Parent or not character:FindFirstChild("Head") then
            if data.Billboard then
                data.Billboard:Destroy()
            end
            charsToRemove[character] = true
        end
    end
    
    for character in pairs(charsToRemove) do
        NameTagBillboards[character] = nil
    end
end

-- 更新名称标签
local function updateNameTags()
    local currentTime = tick()
    if currentTime - LastUpdateTime < NameTagSettings.RefreshRate then
        return
    end
    LastUpdateTime = currentTime
    
    local success, errorMsg = pcall(function()
        local localPlayer = game.Players.LocalPlayer
        if not localPlayer then return end
        
        local localCharacter = localPlayer.Character
        local localRoot = localCharacter and localCharacter:FindFirstChild("HumanoidRootPart")
        if not localRoot then return end
        
        cleanupInvalidNameTags()
        
        local function processTeam(teamFolder, isKiller)
            if not teamFolder then return end
            
            for _, character in ipairs(teamFolder:GetChildren()) do
                if not character:IsA("Model") or character == localCharacter then
                    continue
                end
                
                local humanoid = character:FindFirstChildOfClass("Humanoid")
                if not humanoid or humanoid.Health <= 0 then
                    if NameTagBillboards[character] then
                        NameTagBillboards[character].Billboard.Enabled = false
                    end
                    continue
                end
                
                -- 创建或获取名称标签
                if not NameTagBillboards[character] then
                    createNameTag(character, isKiller)
                end
                
                local data = NameTagBillboards[character]
                if not data or not data.Billboard then continue end
                
                local head = character:FindFirstChild("Head")
                if not head then
                    data.Billboard.Enabled = false
                    continue
                end
                
                -- 计算距离
                local distance = (head.Position - localRoot.Position).Magnitude
                
                -- 如果距离太远，隐藏标签
                if distance > NameTagSettings.MaxDistance then
                    data.Billboard.Enabled = false
                    continue
                end
                
                -- 更新文本内容
                local displayText = character.Name
                if NameTagSettings.ShowDistance then
                    displayText = string.format("%s\n[%dm]", character.Name, math.floor(distance))
                end
                
                data.TextLabel.Text = displayText
                data.TextLabel.TextColor3 = isKiller and NameTagSettings.KillerColor or NameTagSettings.SurvivorColor
                
                -- 根据距离调整字体大小
                local textSize = math.clamp(
                    NameTagSettings.BaseTextSize - (distance / 10), 
                    NameTagSettings.MinTextSize, 
                    NameTagSettings.MaxTextSize
                )
                data.TextLabel.TextSize = textSize
                
                -- 根据队伍设置决定是否显示
                local shouldShow = (isKiller and NameTagSettings.ShowKillerNames) or 
                                 (not isKiller and NameTagSettings.ShowSurvivorNames)
                data.Billboard.Enabled = shouldShow
            end
        end
        
        -- 处理幸存者
        local survivors = workspace.Players:FindFirstChild("Survivors")
        if survivors then
            processTeam(survivors, false)
        end
        
        -- 处理杀手
        local killers = workspace.Players:FindFirstChild("Killers")
        if killers then
            processTeam(killers, true)
        end
    end)
    
    if not success then
        warn("名称标签更新错误: " .. tostring(errorMsg))
    end
end

-- 清理所有名称标签
local function cleanupAllNameTags()
    for character, data in pairs(NameTagBillboards) do
        if data.Billboard then
            data.Billboard:Destroy()
        end
    end
    NameTagBillboards = {}
end

-- 手动刷新函数
local function refreshNameTags()
    cleanupAllNameTags()
    updateNameTags()
end

-- UI 控制
Visual:AddToggle("NameTagsToggle", {
    Text = "启用名称绘制",
    Default = false,
    Callback = function(enabled)
        if enabled then
            if not NameTagSettings.connection then
                NameTagSettings.connection = game:GetService("RunService").Heartbeat:Connect(updateNameTags)
            end
            refreshNameTags()
        else
            if NameTagSettings.connection then
                NameTagSettings.connection:Disconnect()
                NameTagSettings.connection = nil
            end
            cleanupAllNameTags()
        end
    end
})

-- 手动刷新按钮
Visual:AddButton("RefreshNameTags", {
    Text = "刷新名称标签",
    Func = refreshNameTags
})

-- 自动刷新开关
Visual:AddToggle("NameTagsAutoRefresh", {
    Text = "自动刷新",
    Default = true,
    Callback = function(enabled)
        NameTagSettings.AutoRefresh = enabled
    end
})

-- 刷新频率滑块
Visual:AddSlider("NameTagsRefreshRate", {
    Text = "刷新频率(秒)",
    Min = 0.3,
    Max = 2,
    Default = 0.5,
    Rounding = 1,
    Callback = function(value)
        NameTagSettings.RefreshRate = value
    end
})

-- 最大距离滑块
Visual:AddSlider("NameTagsMaxDistance", {
    Text = "最大显示距离",
    Min = 50,
    Max = 8000,
    Default = 100,
    Rounding = 1,
    Callback = function(value)
        NameTagSettings.MaxDistance = value
    end
})

Visual:AddToggle("ShowSurvivorNames", {
    Text = "绘制幸存者名称",
    Default = true,
    Callback = function(enabled)
        NameTagSettings.ShowSurvivorNames = enabled
        refreshNameTags()
    end
})

Visual:AddToggle("ShowKillerNames", {
    Text = "绘制杀手名称",
    Default = true,
    Callback = function(enabled)
        NameTagSettings.ShowKillerNames = enabled
        refreshNameTags()
    end
})

Visual:AddToggle("ShowDistance", {
    Text = "绘制距离",
    Default = true,
    Callback = function(enabled)
        NameTagSettings.ShowDistance = enabled
    end
})
local Visual = Tabs.Esp:AddLeftGroupbox("绘制血量［文字］")


local camera = workspace.CurrentCamera
local localPlayer = game:GetService("Players").LocalPlayer

Visual:AddToggle("SurvivorHealth", {
    Text = "绘制幸存者血量",
    Default = false,
    Callback = function(v)
        if v then
            local sur = workspace.Players.Survivors
            
            local function survivoresp(char)
                local billboard = Instance.new("BillboardGui")
                billboard.Size = UDim2.new(3, 0, 1, 0)
                billboard.StudsOffset = Vector3.new(0, 1.5, 0)
                billboard.Adornee = char.Head
                billboard.Parent = char.Head
                billboard.AlwaysOnTop = true
                
                local textLabel = Instance.new("TextLabel")
                textLabel.Size = UDim2.new(1, 0, 1, 0)
                textLabel.Position = UDim2.new(0, 0, 0, 0)
                textLabel.BackgroundTransparency = 1
                textLabel.TextScaled = false
                textLabel.Text = "血量: "..char.Humanoid.Health.."/"..char.Humanoid.MaxHealth
                textLabel.TextColor3 = Color3.fromRGB(0, 255, 0)
                textLabel.Font = Enum.Font.Arcade
                textLabel.Parent = billboard

              
                local distanceUpdate
                distanceUpdate = game:GetService("RunService").RenderStepped:Connect(function()
                    if char:FindFirstChild("Head") and localPlayer.Character and localPlayer.Character:FindFirstChild("HumanoidRootPart") then
                        local distance = (char.Head.Position - localPlayer.Character.HumanoidRootPart.Position).Magnitude
                        
                        local textSize = math.clamp(30 - (distance / 2), 12, 20)
                        textLabel.TextSize = textSize
                    end
                end)

                local healthUpdate = char:FindFirstChild("Humanoid").HealthChanged:Connect(function()
                    textLabel.Text = "血量: "..char:FindFirstChild("Humanoid").Health.."/"..char:FindFirstChild("Humanoid").MaxHealth
                end)

                char:FindFirstChild("Humanoid").Died:Connect(function()
                    distanceUpdate:Disconnect()
                    healthUpdate:Disconnect()
                    textLabel.Text = ""
                end)

                return {billboard = billboard, connections = {distanceUpdate, healthUpdate}}
            end

            getgenv().SurvivorHealthConnections = {
                Added = sur.DescendantAdded:Connect(function(v)
                    if v:IsA("Model") and v:FindFirstChild("Humanoid") then
                        repeat wait() until v:FindFirstChild("Humanoid")
                        survivoresp(v)
                    end
                end)
            }

            for _,v in pairs(sur:GetDescendants()) do
                if v:IsA("Model") and v:FindFirstChild("Humanoid") then
                    repeat wait() until v:FindFirstChild("Humanoid")
                    survivoresp(v)
                end
            end
        else
            if getgenv().SurvivorHealthConnections then
                getgenv().SurvivorHealthConnections.Added:Disconnect()
            end
            
            for _,v in pairs(workspace.Players.Survivors:GetDescendants()) do
                if v:IsA("Model") and v:FindFirstChild("Head") then
                    for _,child in pairs(v.Head:GetChildren()) do
                        if child:IsA("BillboardGui") then
                            child:Destroy()
                        end
                    end
                end
            end
        end
    end
})

Visual:AddToggle("KillerHealth", {
    Text = "绘制杀手血量",
    Default = false,
    Callback = function(v)
        if v then
            local kil = workspace.Players.Killers
            
            local function killeresp(char)
                local billboard = Instance.new("BillboardGui")
                billboard.Size = UDim2.new(3, 0, 1, 0)
                billboard.StudsOffset = Vector3.new(0, 1.5, 0)
                billboard.Adornee = char.Head
                billboard.Parent = char.Head
                billboard.AlwaysOnTop = true
                
                local textLabel = Instance.new("TextLabel")
                textLabel.Size = UDim2.new(1, 0, 1, 0)
                textLabel.Position = UDim2.new(0, 0, 0, 0)
                textLabel.BackgroundTransparency = 1
                textLabel.TextScaled = false
                textLabel.Text = "血量: "..char.Humanoid.Health.."/"..char.Humanoid.MaxHealth
                textLabel.TextColor3 = Color3.fromRGB(255, 255, 0)
                textLabel.Font = Enum.Font.Arcade
                textLabel.Parent = billboard

                -- 添加距离检测更新
                local distanceUpdate
                distanceUpdate = game:GetService("RunService").RenderStepped:Connect(function()
                    if char:FindFirstChild("Head") and localPlayer.Character and localPlayer.Character:FindFirstChild("HumanoidRootPart") then
                        local distance = (char.Head.Position - localPlayer.Character.HumanoidRootPart.Position).Magnitude
                        -- 根据距离动态调整文字大小 (10-30米范围内变化)
                        local textSize = math.clamp(30 - (distance / 2), 12, 20)
                        textLabel.TextSize = textSize
                    end
                end)

                local healthUpdate = char:FindFirstChild("Humanoid").HealthChanged:Connect(function()
                    textLabel.Text = "blood volume: "..char:FindFirstChild("Humanoid").Health.."/"..char:FindFirstChild("Humanoid").MaxHealth
                end)

                char:FindFirstChild("Humanoid").Died:Connect(function()
                    distanceUpdate:Disconnect()
                    healthUpdate:Disconnect()
                    textLabel.Text = ""
                end)

                return {billboard = billboard, connections = {distanceUpdate, healthUpdate}}
            end

            getgenv().KillerHealthConnections = {
                Added = kil.DescendantAdded:Connect(function(v)
                    if v:IsA("Model") and v:FindFirstChild("Humanoid") then
                        repeat wait() until v:FindFirstChild("Humanoid")
                        killeresp(v)
                    end
                end)
            }

            for _,v in pairs(kil:GetDescendants()) do
                if v:IsA("Model") and v:FindFirstChild("Humanoid") then
                    repeat wait() until v:FindFirstChild("Humanoid")
                    killeresp(v)
                end
            end
        else
            if getgenv().KillerHealthConnections then
                getgenv().KillerHealthConnections.Added:Disconnect()
            end
            
            for _,v in pairs(workspace.Players.Killers:GetDescendants()) do
                if v:IsA("Model") and v:FindFirstChild("Head") then
                    for _,child in pairs(v.Head:GetChildren()) do
                        if child:IsA("BillboardGui") then
                            child:Destroy()
                        end
                    end
                end
            end
        end
    end
})





local Visual   = Tabs.Esp:AddRightGroupbox('电机绘制')
Visual:AddToggle("RealGeneratorESP", {
    Text = "绘制电机",
    Default = false,
    Callback = function(enabled)
        if not _G.RealGeneratorESP then
            _G.RealGeneratorESP = {
                Active = false,
                Data = {},
                Connections = {}
            }
        end
        
        if not enabled then
            if _G.RealGeneratorESP.Active then
                for _, connection in pairs(_G.RealGeneratorESP.Connections) do
                    if connection and connection.Connected then
                        connection:Disconnect()
                    end
                end
                
                for gen, data in pairs(_G.RealGeneratorESP.Data) do
                    if type(data) == "table" then
                        if data.Billboard and data.Billboard.Parent then
                            data.Billboard:Destroy()
                        end
                        if data.DistanceBillboard and data.DistanceBillboard.Parent then
                            data.DistanceBillboard:Destroy()
                        end
                        if data.Highlight and data.Highlight.Parent then
                            data.Highlight:Destroy()
                        end
                    end
                end
                
                _G.RealGeneratorESP.Data = {}
                _G.RealGeneratorESP.Connections = {}
                _G.RealGeneratorESP.Active = false
            end
            return
        end
        
        if _G.RealGeneratorESP.Active then
            return
        end
        
        _G.RealGeneratorESP.Active = true
        
        local scanInterval = 1.0
        local lastScanTime = 0
        local maxGenerators = 20
        
        local distanceSettings = {
            MinDistance = 5,
            MaxDistance = 500,
            MinScale = 0.8,
            MaxScale = 1.5,
            MinTextSize = 8,
            MaxTextSize = 10
        }
        
        local function updateGeneratorESP(gen, data)
            if not gen or not gen.Parent or not gen:FindFirstChild("Main") then
                return false
            end
            
            if table.getn(_G.RealGeneratorESP.Data) > maxGenerators then
                return false
            end
            
            if gen:FindFirstChild("Progress") then
                local progress = gen.Progress.Value
                if progress >= 99 then
                    return false
                end
                
                if data.TextLabel then
                    data.TextLabel.Text = string.format("修机进度: %d%%", progress)
                end
                
                local character = game:GetService("Players").LocalPlayer.Character
                local humanoidRootPart = character and character:FindFirstChild("HumanoidRootPart")
                
                if humanoidRootPart and data.DistanceLabel then
                    local distance = (gen.Main.Position - humanoidRootPart.Position).Magnitude
                    
                    data.DistanceLabel.Text = string.format("距离: %dm", math.floor(distance))
                    
                    local distanceRatio = math.clamp(
                        (distance - distanceSettings.MinDistance) / 
                        (distanceSettings.MaxDistance - distanceSettings.MinDistance),
                        0, 1
                    )
                    
                    local scale = distanceSettings.MinScale + 
                        distanceRatio * (distanceSettings.MaxScale - distanceSettings.MinScale)
                    
                    local textSize = distanceSettings.MinTextSize + 
                        distanceRatio * (distanceSettings.MaxTextSize - distanceSettings.MinTextSize)
                    
                    if data.Billboard then 
                        data.Billboard.Size = UDim2.new(4 * scale, 0, 1 * scale, 0)
                        data.Billboard.Enabled = true
                    end
                    
                    if data.DistanceBillboard then 
                        data.DistanceBillboard.Size = UDim2.new(4 * scale, 0, 1 * scale, 0)
                        data.DistanceBillboard.Enabled = true
                    end
                    
                    if data.TextLabel then 
                        data.TextLabel.TextSize = textSize
                        data.TextLabel.Visible = true
                    end
                    
                    if data.DistanceLabel then 
                        data.DistanceLabel.TextSize = textSize
                        data.DistanceLabel.Visible = true
                    end
                    
                    if data.Highlight then
                        data.Highlight.Enabled = true
                        local transparency = math.clamp((distance - 50) / 100, 0, 0.4)
                        data.Highlight.FillTransparency = 0.85 + (transparency * 0.5)
                        data.Highlight.OutlineColor = Color3.fromRGB(0, 255, 0) -- 绿色
                        data.Highlight.FillColor = Color3.fromRGB(0, 255, 0)
                    end
                end
            end
            
            return true
        end
        
        local function createGeneratorESP(gen)
            if not gen or not gen:FindFirstChild("Main") or _G.RealGeneratorESP.Data[gen] then 
                return 
            end
            
            if table.getn(_G.RealGeneratorESP.Data) >= maxGenerators then
                return
            end
            
            local billboard = Instance.new("BillboardGui")
            billboard.Name = "RealGeneratorESP"
            billboard.Size = UDim2.new(4, 0, 1, 0)
            billboard.StudsOffset = Vector3.new(0, 2.5, 0)
            billboard.Adornee = gen.Main
            billboard.Parent = gen.Main
            billboard.AlwaysOnTop = true
            billboard.Enabled = true
            
            local textLabel = Instance.new("TextLabel")
            textLabel.Size = UDim2.new(1, 0, 0.5, 0)
            textLabel.BackgroundTransparency = 1
            textLabel.TextScaled = false
            textLabel.Text = "真电机加载中..."
            textLabel.TextColor3 = Color3.fromRGB(0, 255, 0) -- 绿色
            textLabel.Font = Enum.Font.Arcade
            textLabel.TextStrokeTransparency = 0
            textLabel.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
            textLabel.TextSize = 8
            textLabel.Parent = billboard
            
            local distanceBillboard = Instance.new("BillboardGui")
            distanceBillboard.Name = "RealGeneratorDistanceESP"
            distanceBillboard.Size = UDim2.new(4, 0, 1, 0)
            distanceBillboard.StudsOffset = Vector3.new(0, 3.5, 0)
            distanceBillboard.Adornee = gen.Main
            distanceBillboard.Parent = gen.Main
            distanceBillboard.AlwaysOnTop = true
            distanceBillboard.Enabled = true
            
            local distanceLabel = Instance.new("TextLabel")
            distanceLabel.Size = UDim2.new(1, 0, 0.5, 0)
            distanceLabel.BackgroundTransparency = 1
            distanceLabel.TextScaled = false
            distanceLabel.Text = "计算距离中..."
            distanceLabel.TextColor3 = Color3.fromRGB(255, 255, 0)
            distanceLabel.Font = Enum.Font.Arcade
            distanceLabel.TextStrokeTransparency = 0
            distanceLabel.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
            distanceLabel.TextSize = 8
            distanceLabel.Parent = distanceBillboard
            
            local highlight = Instance.new("Highlight")
            highlight.Name = "RealGeneratorHighlight"
            highlight.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
            highlight.Enabled = true
            highlight.OutlineColor = Color3.fromRGB(0, 255, 0) -- 绿色
            highlight.FillColor = Color3.fromRGB(0, 255, 0)
            highlight.FillTransparency = 0.9
            highlight.OutlineTransparency = 0
            highlight.Parent = gen
            
            _G.RealGeneratorESP.Data[gen] = {
                Billboard = billboard,
                DistanceBillboard = distanceBillboard,
                TextLabel = textLabel,
                DistanceLabel = distanceLabel,
                Highlight = highlight
            }
            
            local destroyConnection
            destroyConnection = gen.Destroying:Connect(function()
                if _G.RealGeneratorESP.Data[gen] then
                    if _G.RealGeneratorESP.Data[gen].Billboard then 
                        _G.RealGeneratorESP.Data[gen].Billboard:Destroy() 
                    end
                    if _G.RealGeneratorESP.Data[gen].DistanceBillboard then 
                        _G.RealGeneratorESP.Data[gen].DistanceBillboard:Destroy() 
                    end
                    if _G.RealGeneratorESP.Data[gen].Highlight then 
                        _G.RealGeneratorESP.Data[gen].Highlight:Destroy() 
                    end
                    _G.RealGeneratorESP.Data[gen] = nil
                end
                if destroyConnection then
                    destroyConnection:Disconnect()
                end
            end)
            
            table.insert(_G.RealGeneratorESP.Connections, destroyConnection)
        end
        
        local function scanGenerators()
            local mapFolder = workspace:FindFirstChild("Map")
            if mapFolder then
                local ingameFolder = mapFolder:FindFirstChild("Ingame")
                if ingameFolder then
                    local mapSubFolder = ingameFolder:FindFirstChild("Map")
                    if mapSubFolder then
                        local generators = mapSubFolder:GetDescendants()
                        for _, gen in pairs(generators) do
                            if gen:IsA("Model") and gen:FindFirstChild("Main") and gen.Name == "Generator" then
                                createGeneratorESP(gen)
                            end
                        end
                    end
                end
            end
        end
        
        local mainConnection
        local mapFolder = workspace:FindFirstChild("Map")
        if mapFolder then
            local ingameFolder = mapFolder:FindFirstChild("Ingame")
            if ingameFolder then
                local mapSubFolder = ingameFolder:FindFirstChild("Map")
                if mapSubFolder then
                    mainConnection = mapSubFolder.DescendantAdded:Connect(function(v)
                        if v:IsA("Model") and v:FindFirstChild("Main") and v.Name == "Generator" then
                            createGeneratorESP(v)
                        end
                    end)
                end
            end
        end
        
        if mainConnection then
            table.insert(_G.RealGeneratorESP.Connections, mainConnection)
        end
        
        local heartbeatConnection = game:GetService("RunService").Heartbeat:Connect(function(deltaTime)
            lastScanTime = lastScanTime + deltaTime
            if lastScanTime >= scanInterval then
                lastScanTime = 0
                scanGenerators()
            end
            
            local gensToRemove = {}
            for gen, data in pairs(_G.RealGeneratorESP.Data) do
                if not gen or not gen.Parent then
                    table.insert(gensToRemove, gen)
                else
                    if not updateGeneratorESP(gen, data) then
                        table.insert(gensToRemove, gen)
                    end
                end
            end
            
            for _, gen in ipairs(gensToRemove) do
                if _G.RealGeneratorESP.Data[gen] then
                    if _G.RealGeneratorESP.Data[gen].Billboard then 
                        _G.RealGeneratorESP.Data[gen].Billboard:Destroy() 
                    end
                    if _G.RealGeneratorESP.Data[gen].DistanceBillboard then 
                        _G.RealGeneratorESP.Data[gen].DistanceBillboard:Destroy() 
                    end
                    if _G.RealGeneratorESP.Data[gen].Highlight then 
                        _G.RealGeneratorESP.Data[gen].Highlight:Destroy() 
                    end
                    _G.RealGeneratorESP.Data[gen] = nil
                end
            end
        end)
        
        table.insert(_G.RealGeneratorESP.Connections, heartbeatConnection)
        
        scanGenerators()
    end
})

-- 假电机ESP
Visual:AddToggle("FakeGeneratorESP", {
    Text = "绘制假电机",
    Default = false,
    Callback = function(enabled)
        if not _G.FakeGeneratorESP then
            _G.FakeGeneratorESP = {
                Active = false,
                Data = {},
                Connections = {}
            }
        end
        
        if not enabled then
            if _G.FakeGeneratorESP.Active then
                for _, connection in pairs(_G.FakeGeneratorESP.Connections) do
                    if connection and connection.Connected then
                        connection:Disconnect()
                    end
                end
                
                for gen, data in pairs(_G.FakeGeneratorESP.Data) do
                    if type(data) == "table" then
                        if data.Highlight and data.Highlight.Parent then
                            data.Highlight:Destroy()
                        end
                        if data.NameLabel and data.NameLabel.Parent then
                            data.NameLabel:Destroy()
                        end
                    end
                end
                
                _G.FakeGeneratorESP.Data = {}
                _G.FakeGeneratorESP.Connections = {}
                _G.FakeGeneratorESP.Active = false
            end
            return
        end
        
        if _G.FakeGeneratorESP.Active then
            _G.FakeGeneratorESP.Callback(false)
        end
        
        _G.FakeGeneratorESP.Active = true
        
        local scanInterval = 1.0
        local lastScanTime = 0
        
        local function createFakeGeneratorESP(gen)
            if not gen or not gen:FindFirstChild("Main") or _G.FakeGeneratorESP.Data[gen] then 
                return 
            end
            
            local highlight = Instance.new("Highlight")
            highlight.Name = "FakeGeneratorHighlight"
            highlight.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
            highlight.Enabled = true
            highlight.OutlineColor = Color3.fromRGB(255, 0, 0)
            highlight.FillColor = Color3.fromRGB(255, 0, 0)
            highlight.FillTransparency = 0.9
            highlight.OutlineTransparency = 0
            highlight.Parent = gen
            
            local nameBillboard = Instance.new("BillboardGui")
            nameBillboard.Name = "FakeGeneratorNameESP"
            nameBillboard.Size = UDim2.new(4, 0, 1, 0)
            nameBillboard.StudsOffset = Vector3.new(0, 2.5, 0)
            nameBillboard.Adornee = gen.Main
            nameBillboard.Parent = gen.Main
            nameBillboard.AlwaysOnTop = true
            nameBillboard.Enabled = true
            
            local nameLabel = Instance.new("TextLabel")
            nameLabel.Size = UDim2.new(1, 0, 1, 0)
            nameLabel.BackgroundTransparency = 1
            nameLabel.TextScaled = false
            nameLabel.Text = "假电机"
            nameLabel.TextColor3 = Color3.fromRGB(255, 0, 0)
            nameLabel.Font = Enum.Font.Arcade
            nameLabel.TextStrokeTransparency = 0
            nameLabel.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
            nameLabel.TextSize = 12
            nameLabel.Parent = nameBillboard
            
            _G.FakeGeneratorESP.Data[gen] = {
                Highlight = highlight,
                NameLabel = nameLabel,
                NameBillboard = nameBillboard
            }
            
            local destroyConnection
            destroyConnection = gen.Destroying:Connect(function()
                if _G.FakeGeneratorESP.Data[gen] then
                    if _G.FakeGeneratorESP.Data[gen].Highlight then 
                        _G.FakeGeneratorESP.Data[gen].Highlight:Destroy() 
                    end
                    if _G.FakeGeneratorESP.Data[gen].NameLabel then 
                        _G.FakeGeneratorESP.Data[gen].NameLabel:Destroy() 
                    end
                    if _G.FakeGeneratorESP.Data[gen].NameBillboard then 
                        _G.FakeGeneratorESP.Data[gen].NameBillboard:Destroy() 
                    end
                    _G.FakeGeneratorESP.Data[gen] = nil
                end
                if destroyConnection then
                    destroyConnection:Disconnect()
                end
            end)
            
            table.insert(_G.FakeGeneratorESP.Connections, destroyConnection)
        end
        
        local function scanGenerators()
            local mapFolder = workspace:FindFirstChild("Map")
            if mapFolder then
                local ingameFolder = mapFolder:FindFirstChild("Ingame")
                if ingameFolder then
                    local mapSubFolder = ingameFolder:FindFirstChild("Map")
                    if mapSubFolder then
                        local generators = mapSubFolder:GetDescendants()
                        for _, gen in pairs(generators) do
                            if gen:IsA("Model") and gen:FindFirstChild("Main") and gen.Name == "FakeGenerator" then
                                createFakeGeneratorESP(gen)
                            end
                        end
                    end
                end
            end
        end
        
        local mainConnection
        local mapFolder = workspace:FindFirstChild("Map")
        if mapFolder then
            local ingameFolder = mapFolder:FindFirstChild("Ingame")
            if ingameFolder then
                local mapSubFolder = ingameFolder:FindFirstChild("Map")
                if mapSubFolder then
                    mainConnection = mapSubFolder.DescendantAdded:Connect(function(v)
                        if v:IsA("Model") and v:FindFirstChild("Main") and v.Name == "FakeGenerator" then
                            createFakeGeneratorESP(v)
                        end
                    end)
                end
            end
        end
        
        if mainConnection then
            table.insert(_G.FakeGeneratorESP.Connections, mainConnection)
        end
        
        local heartbeatConnection = game:GetService("RunService").Heartbeat:Connect(function(deltaTime)
            lastScanTime = lastScanTime + deltaTime
            if lastScanTime >= scanInterval then
                lastScanTime = 0
                scanGenerators()
            end
            
            local gensToRemove = {}
            for gen, data in pairs(_G.FakeGeneratorESP.Data) do
                if not gen or not gen.Parent then
                    table.insert(gensToRemove, gen)
                end
            end
            
            for _, gen in ipairs(gensToRemove) do
                if _G.FakeGeneratorESP.Data[gen] then
                    if _G.FakeGeneratorESP.Data[gen].Highlight then 
                        _G.FakeGeneratorESP.Data[gen].Highlight:Destroy() 
                    end
                    if _G.FakeGeneratorESP.Data[gen].NameLabel then 
                        _G.FakeGeneratorESP.Data[gen].NameLabel:Destroy() 
                    end
                    if _G.FakeGeneratorESP.Data[gen].NameBillboard then 
                        _G.FakeGeneratorESP.Data[gen].NameBillboard:Destroy() 
                    end
                    _G.FakeGeneratorESP.Data[gen] = nil
                end
            end
        end)
        
        table.insert(_G.FakeGeneratorESP.Connections, heartbeatConnection)
        
        scanGenerators()
    end
})

-- 特殊电机ESP
Visual:AddToggle("NoliWarningESP", {
    Text = "Noli即将传送的电机",
    Default = false,
    Callback = function(enabled)
        if not _G.NoliWarningESP then
            _G.NoliWarningESP = {
                Active = false,
                Data = {},
                Connections = {}
            }
        end
        
        if not enabled then
            if _G.NoliWarningESP.Active then
                for _, connection in pairs(_G.NoliWarningESP.Connections) do
                    if connection and connection.Connected then
                        connection:Disconnect()
                    end
                end
                
                for gen, data in pairs(_G.NoliWarningESP.Data) do
                    if type(data) == "table" then
                        if data.Highlight and data.Highlight.Parent then
                            data.Highlight:Destroy()
                        end
                        if data.Label and data.Label.Parent then
                            data.Label:Destroy()
                        end
                    end
                end
                
                _G.NoliWarningESP.Data = {}
                _G.NoliWarningESP.Connections = {}
                _G.NoliWarningESP.Active = false
            end
            return
        end
        
        if _G.NoliWarningESP.Active then
            return
        end
        
        _G.NoliWarningESP.Active = true
        
        local scanInterval = 1.0
        local lastScanTime = 0
        
        local function hasNoliWarning(gen)
            if string.find(gen.Name, "NoliWarningIncoming") then
                return true
            end
            
            for _, child in pairs(gen:GetDescendants()) do
                if (child:IsA("StringValue") or child:IsA("ObjectValue")) and 
                   string.find(tostring(child.Value), "NoliWarningIncoming") then
                    return true
                elseif child:IsA("BasePart") and string.find(child.Name, "NoliWarningIncoming") then
                    return true
                end
            end
            
            return false
        end
        
        local function createNoliWarningESP(gen)
            if not gen or not gen:FindFirstChild("Main") or _G.NoliWarningESP.Data[gen] then 
                return 
            end
            
            if not hasNoliWarning(gen) then
                return
            end
            
            local highlight = Instance.new("Highlight")
            highlight.Name = "NoliWarningHighlight"
            highlight.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
            highlight.Enabled = true
            highlight.OutlineColor = Color3.fromRGB(255, 0, 255)
            highlight.FillColor = Color3.fromRGB(255, 0, 255)
            highlight.FillTransparency = 0.7
            highlight.OutlineTransparency = 0
            highlight.Parent = gen
            
            local billboard = Instance.new("BillboardGui")
            billboard.Name = "NoliWarningBillboard"
            billboard.Size = UDim2.new(6, 0, 2, 0)
            billboard.StudsOffset = Vector3.new(0, 3, 0)
            billboard.Adornee = gen.Main
            billboard.Parent = gen.Main
            billboard.AlwaysOnTop = true
            
            local label = Instance.new("TextLabel")
            label.Size = UDim2.new(1, 0, 1, 0)
            label.BackgroundTransparency = 1
            label.Text = "[Noli Will Tp]"
            label.TextColor3 = Color3.fromRGB(255, 0, 255)
            label.Font = Enum.Font.Arcade
            label.TextSize = 14
            label.TextStrokeTransparency = 0
            label.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
            label.Parent = billboard
            
            _G.NoliWarningESP.Data[gen] = {
                Highlight = highlight,
                Label = label,
                Billboard = billboard,
                LastCheck = os.time()
            }
            
            local destroyConnection
            destroyConnection = gen.Destroying:Connect(function()
                if _G.NoliWarningESP.Data[gen] then
                    if _G.NoliWarningESP.Data[gen].Highlight then 
                        _G.NoliWarningESP.Data[gen].Highlight:Destroy() 
                    end
                    if _G.NoliWarningESP.Data[gen].Label then 
                        _G.NoliWarningESP.Data[gen].Label:Destroy() 
                    end
                    if _G.NoliWarningESP.Data[gen].Billboard then 
                        _G.NoliWarningESP.Data[gen].Billboard:Destroy() 
                    end
                    _G.NoliWarningESP.Data[gen] = nil
                end
                if destroyConnection then
                    destroyConnection:Disconnect()
                end
            end)
            
            table.insert(_G.NoliWarningESP.Connections, destroyConnection)
        end
        
        local function scanGenerators()
            local generators = workspace:GetDescendants()
            for _, gen in pairs(generators) do
                if gen:IsA("Model") and gen:FindFirstChild("Main") and 
                   (gen.Name == "Generator" or gen.Name == "FakeGenerator") then
                    createNoliWarningESP(gen)
                end
            end
        end
        
        local function updateExistingGenerators()
            local gensToRemove = {}
            for gen, data in pairs(_G.NoliWarningESP.Data) do
                if not gen or not gen.Parent then
                    table.insert(gensToRemove, gen)
                else
                    if os.time() - data.LastCheck > 5 then
                        if not hasNoliWarning(gen) then
                            table.insert(gensToRemove, gen)
                        else
                            data.LastCheck = os.time()
                        end
                    end
                end
            end
            
            for _, gen in ipairs(gensToRemove) do
                if _G.NoliWarningESP.Data[gen] then
                    if _G.NoliWarningESP.Data[gen].Highlight then 
                        _G.NoliWarningESP.Data[gen].Highlight:Destroy() 
                    end
                    if _G.NoliWarningESP.Data[gen].Label then 
                        _G.NoliWarningESP.Data[gen].Label:Destroy() 
                    end
                    if _G.NoliWarningESP.Data[gen].Billboard then 
                        _G.NoliWarningESP.Data[gen].Billboard:Destroy() 
                    end
                    _G.NoliWarningESP.Data[gen] = nil
                end
            end
        end
        
        local mainConnection = workspace.DescendantAdded:Connect(function(v)
            if v:IsA("Model") and v:FindFirstChild("Main") and 
               (v.Name == "Generator" or v.Name == "FakeGenerator") then
                createNoliWarningESP(v)
            end
        end)
        
        table.insert(_G.NoliWarningESP.Connections, mainConnection)
        
        local heartbeatConnection = game:GetService("RunService").Heartbeat:Connect(function(deltaTime)
            lastScanTime = lastScanTime + deltaTime
            if lastScanTime >= scanInterval then
                lastScanTime = 0
                scanGenerators()
                updateExistingGenerators()
            end
        end)
        
        table.insert(_G.NoliWarningESP.Connections, heartbeatConnection)
        
        scanGenerators()
    end
})


Visual:AddToggle("FakeGeneratorESP", {
    Text = "绘制假电机",
    Default = false,
    Callback = function(enabled)
        if not _G.FakeGeneratorESP then
            _G.FakeGeneratorESP = {
                Active = false,
                Data = {},
                Connections = {}
            }
        end
        
        if not enabled then
            if _G.FakeGeneratorESP.Active then
                for _, connection in pairs(_G.FakeGeneratorESP.Connections) do
                    if connection then
                        connection:Disconnect()
                    end
                end
                
                for gen, data in pairs(_G.FakeGeneratorESP.Data) do
                    if data.Highlight then data.Highlight:Destroy() end
                    if data.NameBillboard then data.NameBillboard:Destroy() end
                end
                
                _G.FakeGeneratorESP.Data = {}
                _G.FakeGeneratorESP.Connections = {}
                _G.FakeGeneratorESP.Active = false
            end
            return
        end
        
        if _G.FakeGeneratorESP.Active then return end
        _G.FakeGeneratorESP.Active = true
        
        local lastScanTime = 0
        local scanInterval = 3.0
        
        local function createFakeGeneratorESP(gen)
            if not gen or not gen:FindFirstChild("Main") or _G.FakeGeneratorESP.Data[gen] then return end
            
            local highlight = Instance.new("Highlight")
            highlight.Name = "FakeGeneratorHighlight"
            highlight.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
            highlight.Enabled = false
            highlight.OutlineColor = Color3.fromRGB(255, 0, 0)
            highlight.FillColor = Color3.fromRGB(255, 0, 0)
            highlight.FillTransparency = 0.9
            highlight.OutlineTransparency = 0
            highlight.Parent = gen
            
            local nameBillboard = Instance.new("BillboardGui")
            nameBillboard.Name = "FakeGeneratorNameESP"
            nameBillboard.Size = UDim2.new(4, 0, 1, 0)
            nameBillboard.StudsOffset = Vector3.new(0, 2.5, 0)
            nameBillboard.Adornee = gen.Main
            nameBillboard.Parent = gen.Main
            nameBillboard.AlwaysOnTop = true
            nameBillboard.Enabled = false
            
            local nameLabel = Instance.new("TextLabel")
            nameLabel.Size = UDim2.new(1, 0, 1, 0)
            nameLabel.BackgroundTransparency = 1
            nameLabel.Text = "假电机"
            nameLabel.TextColor3 = Color3.fromRGB(255, 0, 0)
            nameLabel.Font = Enum.Font.Arcade
            nameLabel.TextStrokeTransparency = 0
            nameLabel.TextSize = 12
            nameLabel.Parent = nameBillboard
            
            _G.FakeGeneratorESP.Data[gen] = {
                Highlight = highlight,
                NameBillboard = nameBillboard,
                NameLabel = nameLabel
            }
            
            local destroyConnection = gen.Destroying:Connect(function()
                if _G.FakeGeneratorESP.Data[gen] then
                    if _G.FakeGeneratorESP.Data[gen].Highlight then _G.FakeGeneratorESP.Data[gen].Highlight:Destroy() end
                    if _G.FakeGeneratorESP.Data[gen].NameBillboard then _G.FakeGeneratorESP.Data[gen].NameBillboard:Destroy() end
                    _G.FakeGeneratorESP.Data[gen] = nil
                end
            end)
            
            table.insert(_G.FakeGeneratorESP.Connections, destroyConnection)
        end
        
        local function updateFakeGeneratorESP(gen, data)
            if not gen or not gen.Parent then return false end
            
            local character = game.Players.LocalPlayer.Character
            local humanoidRootPart = character and character:FindFirstChild("HumanoidRootPart")
            
            if humanoidRootPart then
                local distance = (gen.Main.Position - humanoidRootPart.Position).Magnitude
                
                if distance < 80 then
                    data.Highlight.Enabled = true
                    data.NameBillboard.Enabled = true
                    local transparency = math.clamp(distance / 80, 0.1, 0.9)
                    data.Highlight.FillTransparency = 0.7 + transparency * 0.2
                else
                    data.Highlight.Enabled = false
                    data.NameBillboard.Enabled = false
                end
            end
            
            return true
        end
        
        local function scanGenerators()
            local mapFolder = workspace:FindFirstChild("Map")
            local ingameFolder = mapFolder and mapFolder:FindFirstChild("Ingame")
            local mapSubFolder = ingameFolder and ingameFolder:FindFirstChild("Map")
            
            if mapSubFolder then
                for _, gen in pairs(mapSubFolder:GetDescendants()) do
                    if gen:IsA("Model") and gen:FindFirstChild("Main") and gen.Name == "FakeGenerator" then
                        createFakeGeneratorESP(gen)
                    end
                end
            end
        end
        
        local mainConnection
        local mapFolder = workspace:FindFirstChild("Map")
        local ingameFolder = mapFolder and mapFolder:FindFirstChild("Ingame")
        local mapSubFolder = ingameFolder and ingameFolder:FindFirstChild("Map")
        
        if mapSubFolder then
            mainConnection = mapSubFolder.DescendantAdded:Connect(function(v)
                if v:IsA("Model") and v:FindFirstChild("Main") and v.Name == "FakeGenerator" then
                    createFakeGeneratorESP(v)
                end
            end)
            table.insert(_G.FakeGeneratorESP.Connections, mainConnection)
        end
        
        local heartbeatConnection = game:GetService("RunService").Heartbeat:Connect(function(deltaTime)
            lastScanTime = lastScanTime + deltaTime
            
            if lastScanTime >= scanInterval then
                lastScanTime = 0
                scanGenerators()
                
                local gensToRemove = {}
                for gen, data in pairs(_G.FakeGeneratorESP.Data) do
                    if not updateFakeGeneratorESP(gen, data) then
                        table.insert(gensToRemove, gen)
                    end
                end
                
                for _, gen in ipairs(gensToRemove) do
                    if _G.FakeGeneratorESP.Data[gen] then
                        if _G.FakeGeneratorESP.Data[gen].Highlight then _G.FakeGeneratorESP.Data[gen].Highlight:Destroy() end
                        if _G.FakeGeneratorESP.Data[gen].NameBillboard then _G.FakeGeneratorESP.Data[gen].NameBillboard:Destroy() end
                        _G.FakeGeneratorESP.Data[gen] = nil
                    end
                end
            end
        end)
        
        table.insert(_G.FakeGeneratorESP.Connections, heartbeatConnection)
        scanGenerators()
    end
})

Visual:AddToggle("NoliWarningESP", {
    Text = "Noli即将传送的电机",
    Default = false,
    Callback = function(enabled)
        if not _G.NoliWarningESP then
            _G.NoliWarningESP = {
                Active = false,
                Data = {},
                Connections = {}
            }
        end
        
        if not enabled then
            if _G.NoliWarningESP.Active then
                for _, connection in pairs(_G.NoliWarningESP.Connections) do
                    if connection then
                        connection:Disconnect()
                    end
                end
                
                for gen, data in pairs(_G.NoliWarningESP.Data) do
                    if data.Highlight then data.Highlight:Destroy() end
                    if data.Billboard then data.Billboard:Destroy() end
                end
                
                _G.NoliWarningESP.Data = {}
                _G.NoliWarningESP.Connections = {}
                _G.NoliWarningESP.Active = false
            end
            return
        end
        
        if _G.NoliWarningESP.Active then return end
        _G.NoliWarningESP.Active = true
        
        local lastScanTime = 0
        local scanInterval = 3.0
        
        local function hasNoliWarning(gen)
            if string.find(gen.Name, "NoliWarningIncoming") then return true end
            
            for _, child in pairs(gen:GetDescendants()) do
                if (child:IsA("StringValue") or child:IsA("ObjectValue")) and 
                   string.find(tostring(child.Value), "NoliWarningIncoming") then
                    return true
                elseif child:IsA("BasePart") and string.find(child.Name, "NoliWarningIncoming") then
                    return true
                end
            end
            
            return false
        end
        
        local function createNoliWarningESP(gen)
            if not gen or not gen:FindFirstChild("Main") or _G.NoliWarningESP.Data[gen] then return end
            if not hasNoliWarning(gen) then return end
            
            local highlight = Instance.new("Highlight")
            highlight.Name = "NoliWarningHighlight"
            highlight.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
            highlight.Enabled = false
            highlight.OutlineColor = Color3.fromRGB(255, 0, 255)
            highlight.FillColor = Color3.fromRGB(255, 0, 255)
            highlight.FillTransparency = 0.7
            highlight.OutlineTransparency = 0
            highlight.Parent = gen
            
            local billboard = Instance.new("BillboardGui")
            billboard.Name = "NoliWarningBillboard"
            billboard.Size = UDim2.new(6, 0, 2, 0)
            billboard.StudsOffset = Vector3.new(0, 3, 0)
            billboard.Adornee = gen.Main
            billboard.Parent = gen.Main
            billboard.AlwaysOnTop = true
            billboard.Enabled = false
            
            local label = Instance.new("TextLabel")
            label.Size = UDim2.new(1, 0, 1, 0)
            label.BackgroundTransparency = 1
            label.Text = "[Noli Will Tp]"
            label.TextColor3 = Color3.fromRGB(255, 0, 255)
            label.Font = Enum.Font.Arcade
            label.TextSize = 14
            label.TextStrokeTransparency = 0
            label.Parent = billboard
            
            _G.NoliWarningESP.Data[gen] = {
                Highlight = highlight,
                Billboard = billboard,
                LastCheck = os.time()
            }
            
            local destroyConnection = gen.Destroying:Connect(function()
                if _G.NoliWarningESP.Data[gen] then
                    if _G.NoliWarningESP.Data[gen].Highlight then _G.NoliWarningESP.Data[gen].Highlight:Destroy() end
                    if _G.NoliWarningESP.Data[gen].Billboard then _G.NoliWarningESP.Data[gen].Billboard:Destroy() end
                    _G.NoliWarningESP.Data[gen] = nil
                end
            end)
            
            table.insert(_G.NoliWarningESP.Connections, destroyConnection)
        end
        
        local function updateNoliWarningESP(gen, data)
            if not gen or not gen.Parent then return false end
            
            if os.time() - data.LastCheck > 5 then
                if not hasNoliWarning(gen) then
                    return false
                end
                data.LastCheck = os.time()
            end
            
            local character = game.Players.LocalPlayer.Character
            local humanoidRootPart = character and character:FindFirstChild("HumanoidRootPart")
            
            if humanoidRootPart then
                local distance = (gen.Main.Position - humanoidRootPart.Position).Magnitude
                
                if distance < 100 then
                    data.Highlight.Enabled = true
                    data.Billboard.Enabled = true
                else
                    data.Highlight.Enabled = false
                    data.Billboard.Enabled = false
                end
            end
            
            return true
        end
        
        local function scanGenerators()
            for _, gen in pairs(workspace:GetDescendants()) do
                if gen:IsA("Model") and gen:FindFirstChild("Main") and 
                   (gen.Name == "Generator" or gen.Name == "FakeGenerator") then
                    createNoliWarningESP(gen)
                end
            end
        end
        
        local mainConnection = workspace.DescendantAdded:Connect(function(v)
            if v:IsA("Model") and v:FindFirstChild("Main") and 
               (v.Name == "Generator" or v.Name == "FakeGenerator") then
                createNoliWarningESP(v)
            end
        end)
        
        table.insert(_G.NoliWarningESP.Connections, mainConnection)
        
        local heartbeatConnection = game:GetService("RunService").Heartbeat:Connect(function(deltaTime)
            lastScanTime = lastScanTime + deltaTime
            
            if lastScanTime >= scanInterval then
                lastScanTime = 0
                scanGenerators()
                
                local gensToRemove = {}
                for gen, data in pairs(_G.NoliWarningESP.Data) do
                    if not updateNoliWarningESP(gen, data) then
                        table.insert(gensToRemove, gen)
                    end
                end
                
                for _, gen in ipairs(gensToRemove) do
                    if _G.NoliWarningESP.Data[gen] then
                        if _G.NoliWarningESP.Data[gen].Highlight then _G.NoliWarningESP.Data[gen].Highlight:Destroy() end
                        if _G.NoliWarningESP.Data[gen].Billboard then _G.NoliWarningESP.Data[gen].Billboard:Destroy() end
                        _G.NoliWarningESP.Data[gen] = nil
                    end
                end
            end
        end)
        
        table.insert(_G.NoliWarningESP.Connections, heartbeatConnection)
        scanGenerators()
    end
})





local Visual = Tabs.Esp:AddLeftGroupbox("物品绘制")

local LibESP = loadstring(game:HttpGet("https://raw.githubusercontent.com/ImamGV/Script/main/ESP"))()

Visual:AddToggle("EKE",{
    Text = "杀手召唤物绘制",
    Callback = function(v)
        if v then
            for _, v in ipairs(workspace:GetDescendants()) do
                if v:IsA("Model") and v.Name == "DeliveryRig" or v.Name == "Bunny" or v.Name == "Mafia1" or v.Name == "Mafia2" or v.Name == "Mafia3" or v.Name == "Mafia4" then
                    LibESP:AddESP(v, "pizza deliveryman", Color3.fromRGB(255, 52, 179), 14, "Other_ESP")
                elseif v:IsA("Model") and v.Name == "1x1x1x1Zombie" then
                    LibESP:AddESP(v, "1x1x1x1 (zombie)", Color3.fromRGB(224, 102, 255), 14, "Other_ESP")
                end
            end
            OtherESP = workspace.DescendantAdded:Connect(function(v)
                if v:IsA("Model") and v.Name == "PizzaDeliveryRig" or v.Name == "Bunny" or v.Name == "Mafia1" or v.Name == "Mafia2" or v.Name == "Mafia3" or v.Name == "Mafia4" then
                    LibESP:AddESP(v, "pizza deliveryman", Color3.fromRGB(255, 52, 179), 14, "Other_ESP")
                elseif v:IsA("Model") and v.Name == "1x1x1x1Zombie" then
                    LibESP:AddESP(v, "1x1x1x1 (zombie)", Color3.fromRGB(224, 102, 255), 14, "Other_ESP")
                end
            end)
        else
            OtherESP:Disconnect()
            LibESP:Delete("Other_ESP")
        end
    end
})


Visual:AddToggle("TWE", {
    Text = "塔夫绊线绘制",
    Default = false,
    Callback = function(state)
        if state then
            _G.TWE_HighlightedObjects = _G.TWE_HighlightedObjects or {}
            
            local function highlightObject(obj)
                if obj.Name:match("TaphTripwire") and not obj:FindFirstChild("TWE_Highlight") then
                    local highlight = Instance.new("Highlight")
                    highlight.Name = "TWE_Highlight"
                    highlight.FillColor = Color3.fromRGB(102, 0, 153)
                    highlight.OutlineColor = Color3.fromRGB(102, 0, 153)
                    highlight.FillTransparency = 0.5
                    highlight.OutlineTransparency = 0
                    highlight.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
                    highlight.Parent = obj
                    
                    _G.TWE_HighlightedObjects[obj] = obj.AncestryChanged:Connect(function(_, parent)
                        if not parent and highlight and highlight.Parent then
                            highlight:Destroy()
                            if _G.TWE_HighlightedObjects[obj] then
                                _G.TWE_HighlightedObjects[obj]:Disconnect()
                                _G.TWE_HighlightedObjects[obj] = nil
                            end
                        end
                    end)
                end
            end

            for _, obj in ipairs(workspace:GetDescendants()) do
                highlightObject(obj)
            end

            _G.TWE_Connection = workspace.DescendantAdded:Connect(highlightObject)
        else
            if _G.TWE_Connection then
                _G.TWE_Connection:Disconnect()
            end
            
            for obj, connection in pairs(_G.TWE_HighlightedObjects or {}) do
                if connection then
                    connection:Disconnect()
                end
                if obj:FindFirstChild("TWE_Highlight") then
                    obj.TWE_Highlight:Destroy()
                end
            end
            _G.TWE_HighlightedObjects = {}
        end
    end
})

Visual:AddToggle("ShadowDetector", {
    Text = "约翰多陷阱绘制",
    Default = false,
    Callback = function(Value)
        local currentShadows = {}
        local heartbeatConnection = nil
        local updateConnection = nil
        local isRunning = false

        local function findAllShadows()
            local shadows = {}
            local function searchFolder(folder)
                for _, child in ipairs(folder:GetChildren()) do
                    if child.Name == "Shadow" then
                        table.insert(shadows, child)
                    elseif child:IsA("Folder") or child:IsA("Model") then
                        searchFolder(child)
                    end
                end
            end
            searchFolder(workspace.Map.Ingame)
            return shadows
        end

        local function createShadowMarker(shadow)
            local highlight = Instance.new("Highlight")
            highlight.Name = "ShadowRangeIndicator"
            highlight.FillColor = Color3.fromRGB(255, 0, 0)
            highlight.FillTransparency = 0.8
            highlight.OutlineColor = Color3.fromRGB(255, 100, 100)
            highlight.OutlineTransparency = 0.5
            highlight.Parent = shadow
            
            local billboard = Instance.new("BillboardGui")
            billboard.Name = "ShadowNameDisplay"
            billboard.AlwaysOnTop = true
            billboard.Size = UDim2.new(0, 180, 0, 60)
            billboard.StudsOffset = Vector3.new(0, 3, 0)
            
            local textLabel = Instance.new("TextLabel")
            textLabel.Text = "TRAP"
            textLabel.Size = UDim2.new(1, 0, 0.5, 0)
            textLabel.Font = Enum.Font.Arcade
            textLabel.TextSize = 18
            textLabel.TextColor3 = Color3.fromRGB(255, 0, 0)
            textLabel.BackgroundTransparency = 1
            textLabel.TextStrokeTransparency = 0
            textLabel.Parent = billboard
            
            local distanceLabel = Instance.new("TextLabel")
            distanceLabel.Text = "0m"
            distanceLabel.Size = UDim2.new(1, 0, 0.5, 0)
            distanceLabel.Position = UDim2.new(0, 0, 0.5, 0)
            distanceLabel.Font = Enum.Font.Arcade
            distanceLabel.TextSize = 14
            distanceLabel.TextColor3 = Color3.fromRGB(0, 255, 255)
            distanceLabel.BackgroundTransparency = 1
            distanceLabel.TextStrokeTransparency = 0
            distanceLabel.Parent = billboard
            
            billboard.Parent = shadow
            
            currentShadows[shadow] = {
                highlight = highlight,
                billboard = billboard,
                textLabel = textLabel,
                distanceLabel = distanceLabel
            }
        end

        local function removeShadowMarker(shadow)
            local markerData = currentShadows[shadow]
            if markerData then
                if markerData.highlight then
                    markerData.highlight:Destroy()
                end
                if markerData.billboard then
                    markerData.billboard:Destroy()
                end
                currentShadows[shadow] = nil
            end
        end

        local function updateMarkers()
            local foundShadows = findAllShadows()
            local shadowSet = {}
            
            for _, shadow in ipairs(foundShadows) do
                shadowSet[shadow] = true
                if not currentShadows[shadow] then
                    createShadowMarker(shadow)
                end
            end
            
            for shadow in pairs(currentShadows) do
                if not shadowSet[shadow] then
                    removeShadowMarker(shadow)
                end
            end
        end

        local function updateDistances()
            local player = game.Players.LocalPlayer
            local character = player.Character
            if not character then return end
            
            local humanoidRootPart = character:FindFirstChild("HumanoidRootPart")
            if not humanoidRootPart then return end
            
            for shadow, markerData in pairs(currentShadows) do
                if shadow and shadow.Parent then
                    local distance = (humanoidRootPart.Position - shadow.Position).Magnitude
                    markerData.distanceLabel.Text = string.format("%.1fm", distance)
                    
                    local transparency = math.clamp(distance / 50, 0.2, 0.8)
                    markerData.highlight.FillTransparency = transparency
                else
                    removeShadowMarker(shadow)
                end
            end
        end

        if Value then
            isRunning = true
            updateMarkers()
            
            updateConnection = game:GetService("RunService").Stepped:Connect(function()
                if not isRunning then return end
                updateDistances()
            end)
            
            task.spawn(function()
                while isRunning do
                    updateMarkers()
                    task.wait(3)
                end
            end)
        else
            isRunning = false
            if updateConnection then
                updateConnection:Disconnect()
            end
            if heartbeatConnection then
                heartbeatConnection:Disconnect()
            end
            
            for shadow in pairs(currentShadows) do
                removeShadowMarker(shadow)
            end
            currentShadows = {}
        end
    end
})

Visual:AddToggle("ST",{
Text = "塔夫空间炸弹绘制",
Callback = function(v)
if v then
for _, v in ipairs(workspace:GetDescendants()) do
if v:IsA("Model") and v.Name == "SubspaceTripmine" and not v:FindFirstChild("SubspaceTripmine_ESP") then
LibESP:AddESP(v, "", Color3.fromRGB(255, 0, 255), 14, "SubspaceTripmine_ESP")
end
end
SubspaceTripmineESP = workspace.DescendantAdded:Connect(function(v)
if v:IsA("Model") and v.Name == "SubspaceTripmine" and not v:FindFirstChild("SubspaceTripmine_ESP") then
LibESP:AddESP(v, "", Color3.fromRGB(255, 0, 255), 14, "SubspaceTripmine_ESP")
end
end)
else
SubspaceTripmineESP:Disconnect()
LibESP:Delete("SubspaceTripmine_ESP")
end
end})
Visual:AddToggle("ME",{
Text = "医疗包绘制",
Callback = function(v)
if v then
for _, v in ipairs(workspace:GetDescendants()) do
if v:IsA("Model") and v.Name == "Medkit" and not v:FindFirstChild("Medkit_ESP") then
LibESP:AddESP(v, "Medkit", Color3.fromRGB(187, 255, 255), 14, "Medkit_ESP")
end
end
MedkitESP = workspace.DescendantAdded:Connect(function(v)
if v:IsA("Model") and v.Name == "Medkit" and not v:FindFirstChild("Medkit_ESP") then
LibESP:AddESP(v, "Medkit", Color3.fromRGB(187, 255, 255), 14, "Medkit_ESP")
end
end)
else
Medkit:Disconnect()
LibESP:Delete("Medkit_ESP")
end
end})
Visual:AddToggle("BCE",{
Text = "可乐绘制",
Callback = function(v)
if v then
for _, v in ipairs(workspace:GetDescendants()) do
if v:IsA("Model") and v.Name == "BloxyCola" and not v:FindFirstChild("BloxyCola_ESP") then
LibESP:AddESP(v, "Bloxy Cola", Color3.fromRGB(131, 111, 255), 14, "BloxyCola_ESP")
end
end
ColaESP = workspace.DescendantAdded:Connect(function(v)
if v:IsA("Model") and v.Name == "BloxyCola" and not v:FindFirstChild("BloxyCola_ESP") then
LibESP:AddESP(v, "Bloxy Cola", Color3.fromRGB(131, 111, 255), 14, "BloxyCola_ESP")
end
end)
else
ColaESP:Disconnect()
LibESP:Delete("BloxyCola_ESP")
end
end})


local SM = Tabs.Aimbot:AddLeftGroupbox('静默平滑瞄准[杀手]')
local LocalPlayer = Players.LocalPlayer
local Workspace = game:GetService("Workspace")

local silentAimEnabled = false
local targetPlayer = nil
local maxDistance = 100
local silentAimConnection = nil
local smoothingFactor = 0.2 

-- 要检测的动画ID
local KILLER_ANIMATIONS = {
    -- Jason 动画
    ["126830014841198"] = true,
    ["126355327951215"] = true,
    ["121086746534252"] = true,
    -- Joe (1x1x1x1) 动画
    ["105458270463374"] = true,
    ["127172483138092"] = true,
    ["131430497821198"] = true,
    ["119181003138006"] = true,
    -- Coolkid 动画
    ["18885909645"] = true,
    ["98456918873918"] = true,
    ["106776364623742"] = true,
    ["18885906143"] = true,
    ["18885940850"] = true,
    ["18885903667"] = true,
    -- Noli 动画
    ["109230267448394"] = true,
    ["91758760621955"] = true,
    ["93841120533318"] = true,
    ["139835501033932"] = true,
    ["126896426760253"] = true,
    ["109700476007435"] = true,
    ["139321362207112"] = true,
    ["83465205704188"] = true,
}

local function isPlayingKillerAnimation()
    if not LocalPlayer.Character then return false end
    
    local humanoid = LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
    if not humanoid then return false end
    
    local animator = humanoid:FindFirstChildOfClass("Animator")
    if not animator then return false end
    
    for _, track in pairs(animator:GetPlayingAnimationTracks()) do
        if track.Animation then
            local animId = tostring(track.Animation.AnimationId:match("%d+"))
            if KILLER_ANIMATIONS[animId] then
                return true
            end
        end
    end
    
    return false
end

local function isKiller()
    pcall(function()
        local killersFolder = Workspace:FindFirstChild("Players") and Workspace.Players:FindFirstChild("Killers")
        if killersFolder and LocalPlayer.Character and table.find(killersFolder:GetChildren(), LocalPlayer.Character) then
            return true
        end
    end)
    return false
end

local function getClosestSurvivor()
    pcall(function()
        local survivorsFolder = Workspace:FindFirstChild("Players") and Workspace.Players:FindFirstChild("Survivors")
        if not survivorsFolder then return nil end

        local myChar = LocalPlayer.Character
        if not myChar or not myChar:FindFirstChild("HumanoidRootPart") then return nil end
        local myPos = myChar.HumanoidRootPart.Position

        local closest = nil
        local shortest = math.huge

        for _, model in ipairs(survivorsFolder:GetChildren()) do
            if model:IsA("Model") and model:FindFirstChild("HumanoidRootPart") then
                local dist = (model.HumanoidRootPart.Position - myPos).Magnitude
                if dist < shortest and dist <= maxDistance then
                    shortest = dist
                    closest = model
                end
            end
        end

        return closest
    end)
    return nil
end

local function smoothFaceTarget(model)
    pcall(function()
        if not model or not model:FindFirstChild("HumanoidRootPart") then return end
        local char = LocalPlayer.Character
        if not char or not char:FindFirstChild("HumanoidRootPart") then return end

        local root = char.HumanoidRootPart
        local targetPos = model.HumanoidRootPart.Position
        
        -- 计算目标朝向
        local desiredLook = CFrame.new(root.Position, Vector3.new(targetPos.X, root.Position.Y, targetPos.Z))
        
        -- 平滑插值旋转
        root.CFrame = root.CFrame:Lerp(desiredLook, smoothingFactor)
    end)
end

getgenv().GetSilentAimTargetPosition = function()
    pcall(function()
        if silentAimEnabled and isKiller() and isPlayingKillerAnimation() then
            local target = getClosestSurvivor()
            if target and target:FindFirstChild("Head") then
                return target.Head.Position
            end
        end
    end)
    return nil
end

-- 添加静默瞄准开关
SM:AddToggle("静默瞄准", {
    Text = "Silent Aiming[静默瞄准]",
    Callback = function(state)
        silentAimEnabled = state
       
        if state then
            if not silentAimConnection then
                silentAimConnection = RunService.Heartbeat:Connect(function()
                    pcall(function()
                        if not isKiller() or not isPlayingKillerAnimation() then 
                            targetPlayer = nil
                            return 
                        end
                        
                        targetPlayer = getClosestSurvivor()
                        if targetPlayer then
                            smoothFaceTarget(targetPlayer)
                        end
                    end)
                end)
            end
        else
            if silentAimConnection then
                silentAimConnection:Disconnect()
                silentAimConnection = nil
            end
            targetPlayer = nil
        end
    end
})

SM:AddSlider("自瞄距离", {
    Text = "[自瞄距离]",
    Default = 30,
    Min = 1,
    Max = 500,
    Rounding = 0,
    Callback = function(value)
        maxDistance = value
    end
})

SM:AddSlider("瞄准平滑度", {
    Text = "Aim Smoothing[瞄准平滑度]",
    Default = 0.2,
    Min = 0.05,
    Max = 1,
    Rounding = 2,
    Callback = function(value)
        smoothingFactor = value
    end
})







local LeftGroupBox = Tabs.Aimbot:AddLeftGroupbox('TwoTime背刺')
local RunService = game:GetService("RunService")
local LocalPlayer = game:GetService("Players").LocalPlayer

do
	local Backstab = {
		Enabled = false,
		Mode = "Behind",
		Range = 4,
		Cooldown = false,
		LastTarget = nil,
		KillerNames = { "Jason", "c00lkidd", "JohnDoe", "1x1x1x1", "Noli", "Slasher" },
		DaggerRemote = game:GetService("ReplicatedStorage"):WaitForChild("Modules"):WaitForChild("Network"):WaitForChild("RemoteEvent"),
		KillersFolder = workspace:WaitForChild("Players"):WaitForChild("Killers")
	}

	local function CreateUI()
		LeftGroupBox:AddToggle("BackstabToggle", {
			Text = "自动背刺[Two Time]",
			Default = false,
			Callback = function(Value)
				Backstab.Enabled = Value
			end,
		})

		LeftGroupBox:AddDropdown("BackstabModeDropdown", {
			Values = { "Behind", "Around" },
			Default = 1,
			Multi = false,
			Text = "模式",
			Callback = function(Value)
				if Value == "Behind" then
					Backstab.Mode = "Behind"
				elseif Value == "Around" then
					Backstab.Mode = "Around"
				end
			end,
		})

		LeftGroupBox:AddSlider("BackstabRangeSlider", {
			Text = "距离",
			Default = 4,
			Min = 1,
			Max = 20,
			Rounding = 0,
			Callback = function(Value)
				Backstab.Range = Value
			end,
		})
	end

	local function isBehindTarget(hrp, targetHRP)
		if not (hrp and targetHRP and hrp.Parent and targetHRP.Parent) then return false end
		local distance = (hrp.Position - targetHRP.Position).Magnitude
		if distance > Backstab.Range then return false end

		if Backstab.Mode == "Around" then
			return true
		else
			local direction = -targetHRP.CFrame.LookVector
			local toPlayer = (hrp.Position - targetHRP.Position)
			return toPlayer:Dot(direction) > 0.5
		end
	end

	local function OnHeartbeat()
		if not Backstab.Enabled or Backstab.Cooldown then return end
		local char = LocalPlayer.Character
		if not (char and char:FindFirstChild("HumanoidRootPart")) then return end
		local hrp = char.HumanoidRootPart

		for _, name in ipairs(Backstab.KillerNames) do
			local killer = Backstab.KillersFolder:FindFirstChild(name)
			if killer and killer:FindFirstChild("HumanoidRootPart") then
				local kHRP = killer.HumanoidRootPart
				if isBehindTarget(hrp, kHRP) and killer ~= Backstab.LastTarget then
					Backstab.Cooldown = true
					Backstab.LastTarget = killer
					hrp.CFrame = CFrame.new(kHRP.Position - kHRP.CFrame.LookVector, kHRP.Position)
					local args = {
						"UseActorAbility",
						{
							buffer.fromstring("\"Dagger\"")
						}
					}
					Backstab.DaggerRemote:FireServer(unpack(args))
					task.delay(1, function()
						Backstab.LastTarget = nil
						Backstab.Cooldown = false
					end)
					break
				end
			end
		end
	end

	CreateUI()
	RunService.Heartbeat:Connect(OnHeartbeat)
end

local ChanceGroup = Tabs.Aimbot:AddLeftGroupbox('机会预判自瞄')

do
	local PredictionAim = {
		Enabled = false,
		Prediction = 4,
		Duration = 1.7,
		Targets = { "Jason", "c00lkidd", "JohnDoe", "1x1x1x1", "Noli", "Slasher" },
		TrackedAnimations = {
			["103601716322988"] = true, ["133491532453922"] = true, ["86371356500204"] = true,
			["76649505662612"] = true, ["81698196845041"] = true
		},
		Humanoid = nil,
		HRP = nil,
		LastTriggerTime = 0,
		IsAiming = false,
		OriginalState = nil
	}

	local function CreateUI()
		ChanceGroup:AddToggle("AimToggle", {
			Text = "预判瞄准[Chance]",
			Default = false,
			Callback = function(Value)
				PredictionAim.Enabled = Value
			end,
		})
		ChanceGroup:AddSlider("PredictionSlider", {
			Text = "预判系数",
			Default = 4,
			Min = 0,
			Max = 15,
			Rounding = 1,
			Callback = function(Value)
				PredictionAim.Prediction = Value
			end,
		})
	end

	local function getValidTarget()
		local killersFolder = workspace:FindFirstChild("Players") and workspace.Players:FindFirstChild("Killers")
		if killersFolder then
			for _, name in ipairs(PredictionAim.Targets) do
				local target = killersFolder:FindFirstChild(name)
				if target and target:FindFirstChild("HumanoidRootPart") then
					return target.HumanoidRootPart
				end
			end
		end
		return nil
	end

	local function getPlayingAnimationIds()
		local ids = {}
		if PredictionAim.Humanoid then
			for _, track in ipairs(PredictionAim.Humanoid:GetPlayingAnimationTracks()) do
				if track.Animation and track.Animation.AnimationId then
					local id = track.Animation.AnimationId:match("%d+")
					if id then ids[id] = true end
				end
			end
		end
		return ids
	end

	local function setupCharacter(char)
		PredictionAim.Humanoid = char:WaitForChild("Humanoid")
		PredictionAim.HRP = char:WaitForChild("HumanoidRootPart")
	end

	local function OnRenderStep()
		if not PredictionAim.Enabled or not PredictionAim.Humanoid or not PredictionAim.HRP then return end
		local playing = getPlayingAnimationIds()
		local triggered = false
		for id in pairs(PredictionAim.TrackedAnimations) do
			if playing[id] then triggered = true; break end
		end

		if triggered then
			PredictionAim.LastTriggerTime = tick()
			PredictionAim.IsAiming = true
		end

		if PredictionAim.IsAiming and tick() - PredictionAim.LastTriggerTime <= PredictionAim.Duration then
			if not PredictionAim.OriginalState then
				PredictionAim.OriginalState = {
					WalkSpeed = PredictionAim.Humanoid.WalkSpeed,
					JumpPower = PredictionAim.Humanoid.JumpPower,
					AutoRotate = PredictionAim.Humanoid.AutoRotate
				}
				PredictionAim.Humanoid.AutoRotate = false
				PredictionAim.HRP.AssemblyAngularVelocity = Vector3.zero
			end
			local targetHRP = getValidTarget()
			if targetHRP then
				local predictedPos = targetHRP.Position + (targetHRP.CFrame.LookVector * PredictionAim.Prediction)
				local direction = (predictedPos - PredictionAim.HRP.Position).Unit
				local yRot = math.atan2(-direction.X, -direction.Z)
				PredictionAim.HRP.CFrame = CFrame.new(PredictionAim.HRP.Position) * CFrame.Angles(0, yRot, 0)
			end
		elseif PredictionAim.IsAiming then
			PredictionAim.IsAiming = false
			if PredictionAim.OriginalState then
				PredictionAim.Humanoid.WalkSpeed = PredictionAim.OriginalState.WalkSpeed
				PredictionAim.Humanoid.JumpPower = PredictionAim.OriginalState.JumpPower
				PredictionAim.Humanoid.AutoRotate = PredictionAim.OriginalState.AutoRotate
				PredictionAim.OriginalState = nil
			end
		end
	end

	local function OnRemoteEvent(eventName, eventArg)
		if not PredictionAim.Enabled then return end
		if eventName == "UseActorAbility" and type(eventArg) == "table" and eventArg[1] and tostring(eventArg[1]) == buffer.fromstring("\"Shoot\"") then
			PredictionAim.LastTriggerTime = tick()
			PredictionAim.IsAiming = true
		end
	end

	if LocalPlayer.Character then setupCharacter(LocalPlayer.Character) end
	LocalPlayer.CharacterAdded:Connect(setupCharacter)
	CreateUI()
	RunService.RenderStepped:Connect(OnRenderStep)
	game:GetService("ReplicatedStorage").Modules.Network.RemoteEvent.OnClientEvent:Connect(OnRemoteEvent)
end

local Size = 5
local speed = 1
local player = game:GetService("Players").LocalPlayer
local char = player.Character or player.CharacterAdded:Wait()
local rootPart = char:WaitForChild("HumanoidRootPart")
local humanoid = char:WaitForChild("Humanoid")


local twoTimeMaxDistance = 50
local shedletskyMaxDistance = 50
local johnMaxDistance = 50

-- 创建UI
local SB = Tabs.Aimbot:AddLeftGroupbox('幸存者自瞄[平滑]')



-- 两次自瞄距离滑块
SB:AddSlider('TwoTimeDistance', {
    Text = '两次自瞄距离',
    Default = 50,
    Min = 10,
    Max = 150,
    Rounding = 1,
    Compact = false,
    Callback = function(value)
        twoTimeMaxDistance = value
    end
})

-- 谢德利茨基自瞄距离滑块
SB:AddSlider('ShedletskyDistance', {
    Text = '谢德自瞄距离',
    Default = 50,
    Min = 10,
    Max = 150,
    Rounding = 1,
    Compact = false,
    Callback = function(value)
        shedletskyMaxDistance = value
    end
})


local function TWO(state)
    local TWOsounds = {
        "rbxassetid://86710781315432",
        "rbxassetid://99820161736138"
    }
    
    TWOTIME = state

    if game:GetService("Players").LocalPlayer.Character.Name ~= "TwoTime" and state then
        Library:Notify("Your role is not Two Time，invalid", nil, 4590657391)
        return 
    end

    if state then
        TWOloop = game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.ChildAdded:Connect(function(child)
            if not TWOTIME then return end
            for _, v in pairs(TWOsounds) do
                if child.Name == v then
                    local survivors = {}
                    for _, player in pairs(game:GetService("Players"):GetPlayers()) do
                        if player ~= game:GetService("Players").LocalPlayer then
                            local character = player.Character
                            if character and character:FindFirstChild("HumanoidRootPart") then
                                table.insert(survivors, character)
                            end
                        end
                    end

                    local nearestSurvivor = nil
                    local shortestDistance = math.huge  
                    
                    for _, survivor in pairs(survivors) do
                        local survivorHRP = survivor.HumanoidRootPart
                        local playerHRP = game:GetService("Players").LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
                        
                        if playerHRP then
                            local distance = (survivorHRP.Position - playerHRP.Position).Magnitude
                            if distance < shortestDistance and distance <= twoTimeMaxDistance then
                                shortestDistance = distance
                                nearestSurvivor = survivor
                            end
                        end
                    end
                    
                    if nearestSurvivor then
                        local nearestHRP = nearestSurvivor.HumanoidRootPart
                        local playerHRP = game:GetService("Players").LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
                        
                        if playerHRP then
                            local direction = (nearestHRP.Position - playerHRP.Position).Unit
                            local num = 1
                            local maxIterations = 100 
                            
                            if child.Name == "rbxassetid://79782181585087" then
                                maxIterations = 220  
                            end

                            while num <= maxIterations do
                                task.wait(0.01)
                                num = num + 1
                                workspace.CurrentCamera.CFrame = CFrame.new(workspace.CurrentCamera.CFrame.Position, nearestHRP.Position)
                                playerHRP.CFrame = CFrame.lookAt(playerHRP.Position, Vector3.new(nearestHRP.Position.X, nearestHRP.Position.Y, nearestHRP.Position.Z))  
                            end
                        end
                    end
                end
            end
        end)
    else
        if TWOloop then
            TWOloop:Disconnect()
            TWOloop = nil
        end
    end
end

local function shedletskyAimbot(state)
    shedaim = state
    if state then
        if game:GetService("Players").LocalPlayer.Character.Name ~= "Shedletsky" then
            Library:Notify("I don't think the character you're playing is Shedlitsky.,invalid", nil, 4590657391)
            return
        end
        
        shedloop = game:GetService("Players").LocalPlayer.Character.Sword.ChildAdded:Connect(function(child)
            if not shedaim then return end
            if child:IsA("Sound") then 
                local FAN = child.Name
                if FAN == "rbxassetid://12222225" or FAN == "83851356262523" then 
                    local killersFolder = game.Workspace.Players:FindFirstChild("Killers")
                    if killersFolder then 
                        local killer = killersFolder:FindFirstChildOfClass("Model")
                        if killer and killer:FindFirstChild("HumanoidRootPart") then 
                            local killerHRP = killer.HumanoidRootPart
                            local playerHRP = game:GetService("Players").LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
                            if playerHRP then 
                                local distance = (killerHRP.Position - playerHRP.Position).Magnitude
                                if distance <= shedletskyMaxDistance then
                                    local num = 1
                                    local maxIterations = 100
                                    while num <= maxIterations do
                                        task.wait(0.01)
                                        num = num + 1
                                        workspace.CurrentCamera.CFrame = CFrame.new(workspace.CurrentCamera.CFrame.Position, killerHRP.Position)
                                        playerHRP.CFrame = CFrame.lookAt(playerHRP.Position, killerHRP.Position)
                                    end
                                end
                            end
                        end
                    end
                end
            end
        end)
    else
        if shedloop then 
            shedloop:Disconnect()
            shedloop = nil
        end
    end
end



SB:AddToggle('MyToggle', {
    Text = '两次自瞄',
    Default = false,
    Tooltip = 'Aim',
    Callback = TWO
})

SB:AddToggle('MyToggle', {
    Text = '谢德自瞄',
    Default = false,
    Tooltip = 'Aim',
    Callback = shedletskyAimbot
})



local LeftGroupBox = Tabs.Aimbot:AddRightGroupbox('1x4远程预判')

local RunService = game:GetService("RunService")
local LocalPlayer = game:GetService("Players").LocalPlayer
	local PredictionAim = {
		Enabled = false,
		Prediction = 4,
		Duration = 1.7,
		Targets = { "Guest1337", "007n7", "Builderman", "Chance", "Dusekkar", "Elliot", "Noob", "Shedletsky", "Taph", "TwoTime" },
		TrackedAnimations = {
	["131430497821198"] = true,
    ["119181003138006"] = true,
    ["70447634862911"] = true,
    ["93491748129367"] = true
		},
		Humanoid = nil,
		HRP = nil,
		LastTriggerTime = 1,
		IsAiming = false,
		OriginalState = nil
	}

	local function CreateUI()
		LeftGroupBox:AddToggle("AimToggle", {
			Text = "预判瞄准",
			Default = false,
			Callback = function(Value)
				PredictionAim.Enabled = Value
			end,
		})
		LeftGroupBox:AddSlider("PredictionSlider", {
			Text = "预判强度",
			Default = 4,
			Min = 0,
			Max = 15,
			Rounding = 1,
			Callback = function(Value)
				PredictionAim.Prediction = Value
			end,
		})
	end

	local function getValidTarget()
		local killersFolder = workspace:FindFirstChild("Players") and workspace.Players:FindFirstChild("Survivors")
		if killersFolder then
			for _, name in ipairs(PredictionAim.Targets) do
				local target = killersFolder:FindFirstChild(name)
				if target and target:FindFirstChild("HumanoidRootPart") then
					return target.HumanoidRootPart
				end
			end
		end
		return nil
	end

	local function getPlayingAnimationIds()
		local ids = {}
		if PredictionAim.Humanoid then
			for _, track in ipairs(PredictionAim.Humanoid:GetPlayingAnimationTracks()) do
				if track.Animation and track.Animation.AnimationId then
					local id = track.Animation.AnimationId:match("%d+")
					if id then ids[id] = true end
				end
			end
		end
		return ids
	end

	local function setupCharacter(char)
		PredictionAim.Humanoid = char:WaitForChild("Humanoid")
		PredictionAim.HRP = char:WaitForChild("HumanoidRootPart")
	end

	local function OnRenderStep()
		if not PredictionAim.Enabled or not PredictionAim.Humanoid or not PredictionAim.HRP then return end
		local playing = getPlayingAnimationIds()
		local triggered = false
		for id in pairs(PredictionAim.TrackedAnimations) do
			if playing[id] then triggered = true; break end
		end

		if triggered then
			PredictionAim.LastTriggerTime = tick()
			PredictionAim.IsAiming = true
		end

		if PredictionAim.IsAiming and tick() - PredictionAim.LastTriggerTime <= PredictionAim.Duration then
			if not PredictionAim.OriginalState then
				PredictionAim.OriginalState = {
					WalkSpeed = PredictionAim.Humanoid.WalkSpeed,
					JumpPower = PredictionAim.Humanoid.JumpPower,
					AutoRotate = PredictionAim.Humanoid.AutoRotate
				}
				PredictionAim.Humanoid.AutoRotate = false
				PredictionAim.HRP.AssemblyAngularVelocity = Vector3.zero
			end
			local targetHRP = getValidTarget()
			if targetHRP then
				local predictedPos = targetHRP.Position + (targetHRP.CFrame.LookVector * PredictionAim.Prediction)
				local direction = (predictedPos - PredictionAim.HRP.Position).Unit
				local yRot = math.atan2(-direction.X, -direction.Z)
				PredictionAim.HRP.CFrame = CFrame.new(PredictionAim.HRP.Position) * CFrame.Angles(0, yRot, 0)
			end
		elseif PredictionAim.IsAiming then
			PredictionAim.IsAiming = false
			if PredictionAim.OriginalState then
				PredictionAim.Humanoid.WalkSpeed = PredictionAim.OriginalState.WalkSpeed
				PredictionAim.Humanoid.JumpPower = PredictionAim.OriginalState.JumpPower
				PredictionAim.Humanoid.AutoRotate = PredictionAim.OriginalState.AutoRotate
				PredictionAim.OriginalState = nil
			end
		end
	end

	if LocalPlayer.Character then setupCharacter(LocalPlayer.Character) end
	LocalPlayer.CharacterAdded:Connect(setupCharacter)
	CreateUI()
	RunService.RenderStepped:Connect(OnRenderStep)





local SpecialAimbot = Tabs.Aimbot:AddLeftGroupbox("幸存者自瞄(无声静默)")

-- 默认距离设置
local defaultAimDistance = 100
local aimDistanceSettings = {
    SSA = defaultAimDistance,
    GAA = defaultAimDistance
}

-- 平滑度和锁定时间设置
local aimSmoothnessSettings = {
    SSA = 50,
    GAA = 50
}

local aimDurationSettings = {
    SSA = 100,
    GAA = 100
}



SpecialAimbot:AddSlider("SSA_Distance", {
    Text = "谢德自瞄距离",
    Default = defaultAimDistance,
    Min = 10,
    Max = 500,
    Rounding = 1,
    Callback = function(value)
        aimDistanceSettings.SSA = value
    end
})

SpecialAimbot:AddSlider("GAA_Distance", {
    Text = "访客自瞄距离",
    Default = defaultAimDistance,
    Min = 10,
    Max = 500,
    Rounding = 1,
    Callback = function(value)
        aimDistanceSettings.GAA = value
    end
})




local function SmoothLookAt(currentCF, targetPos, smoothness)
    local currentLook = currentCF.LookVector
    local targetLook = (targetPos - currentCF.Position).Unit
    local newLook = currentLook:Lerp(targetLook, 1/smoothness)
    return CFrame.lookAt(currentCF.Position, currentCF.Position + newLook)
end



function AimSlashShedletsky(value)
    local aimslashsword = value
    if value then
        local shedaimbotsounds = {
            "rbxassetid://106397684977541",
            "rbxassetid://106397684977541"
        }
        aimslash = game.Players.LocalPlayer.Character.Sword.ChildAdded:Connect(function(child)
            if not aimslashsword then return end
            for _, v in ipairs(shedaimbotsounds) do
                if child.Name == v then
                    local targetkiller = game.Workspace.Players:FindFirstChild("Killers"):FindFirstChildOfClass("Model")
                    if targetkiller and targetkiller:FindFirstChild("HumanoidRootPart") then
                        if game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
                            local distance = (targetkiller.HumanoidRootPart.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude
                            if distance <= aimDistanceSettings.SSA then
                                local number = 1
                                local smoothness = aimSmoothnessSettings.SSA
                                local duration = aimDurationSettings.SSA
                                local connection
                                connection = game:GetService("RunService").RenderStepped:Connect(function()
                                    if number <= duration then
                                        task.wait(0.01)
                                        number = number + 1
                                        local currentCF = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
                                        local targetPos = targetkiller.HumanoidRootPart.Position
                                        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = SmoothLookAt(currentCF, targetPos, smoothness)
                                    else
                                        connection:Disconnect()
                                    end
                                end)
                            end
                        end
                    end
                end
            end
        end)
    else
        if aimslash then
            aimslash:Disconnect()
        end
    end
end

function AimAttackGuest(value)
    local aimattackguest = value
    if value then
        aimguest = game:GetService("ReplicatedStorage").Modules.Network.RemoteEvent.OnClientEvent:Connect(function(eventName, eventArg)
            if not aimattackguest then return end
            if eventName == "UseActorAbility" and type(eventArg) == "table" and eventArg[1] and tostring(eventArg[1]) == buffer.fromstring("\"Punch\"") then
                local targetkiller = game.Workspace.Players:FindFirstChild("Killers"):FindFirstChildOfClass("Model")
                if targetkiller and targetkiller:FindFirstChild("HumanoidRootPart") then
                    if game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
                        local distance = (targetkiller.HumanoidRootPart.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude
                        if distance <= aimDistanceSettings.GAA then
                            local number = 1
                            local smoothness = aimSmoothnessSettings.GAA
                            local duration = aimDurationSettings.GAA
                            local connection
                            connection = game:GetService("RunService").RenderStepped:Connect(function()
                                if number <= duration then
                                    task.wait(0.01)
                                    number = number + 1
                                    local currentCF = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
                                    local targetPos = targetkiller.HumanoidRootPart.Position
                                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = SmoothLookAt(currentCF, targetPos, smoothness)
                                else
                                    connection:Disconnect()
                                end
                            end)
                        end
                    end
                end
            end
        end)
    else
        if aimguest then
            aimguest:Disconnect()
        end
    end
end

SpecialAimbot:AddToggle("SSA",{
    Text = "谢德自瞄",
    Callback = function(v)
        AimSlashShedletsky(v)
    end
})

SpecialAimbot:AddToggle("GAA",{
    Text = "访客自瞄",
    Callback = function(v)
        AimAttackGuest(v)
    end
})


local aimbotNoilsounds = {
    "rbxassetid://90768093259753"
}
local aimbotNoilsounds2 = {
    "rbxassetid://126318185932771"
}
local Noloop
local No2loop

-- Default settings
local aimSettings = {
    maxDistance = 50,  -- Default max aim distance
    lockTime = 3.3     -- Default lock time in seconds (330 iterations * 0.01)
}

-- Create Noli Aimbot groupbox
local g = Tabs.Aimbot:AddRightGroupbox('Noli自瞄')

-- Add sliders to the groupbox
g:AddSlider('AimDistance', {
    Text = '自瞄距离',
    Default = aimSettings.maxDistance,
    Min = 10,
    Max = 100,
    Rounding = 0,
    Compact = false,
    Callback = function(value)
        aimSettings.maxDistance = value
    end
})

g:AddSlider('LockTime', {
    Text = '自瞄锁定时长 (秒)',
    Default = aimSettings.lockTime,
    Min = 0.5,
    Max = 5,
    Rounding = 1,
    Compact = false,
    Callback = function(value)
        aimSettings.lockTime = value
    end
})

local function Noaimbot(state)
    johnaim = state
    if game:GetService("Players").LocalPlayer.Character.Name ~= "Noli" and state then
        Library:Notify("角色不对，可能出现错误", nil, 4590657391)
        return 
    end
    if state then
        Noloop = game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.ChildAdded:Connect(function(child)
            if not johnaim then return end
            for _, v in pairs(aimbotNoilsounds) do
                if child.Name == v then
                   
                    local survivors = {}
                    for _, player in pairs(game:GetService("Players"):GetPlayers()) do
                        if player ~= game:GetService("Players").LocalPlayer then
                            local character = player.Character
                            if character and character:FindFirstChild("HumanoidRootPart") then
                                table.insert(survivors, character)
                            end
                        end
                    end
    
                   
                    local nearestSurvivor = nil
                    local shortestDistance = math.huge  
                    
                    for _, survivor in pairs(survivors) do
                        local survivorHRP = survivor.HumanoidRootPart
                        local playerHRP = game:GetService("Players").LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
                        
                        if playerHRP then
                            local distance = (survivorHRP.Position - playerHRP.Position).Magnitude
                            if distance < shortestDistance and distance <= aimSettings.maxDistance then
                                shortestDistance = distance
                                nearestSurvivor = survivor
                            end
                        end
                    end
                    
                  
                    if nearestSurvivor then
                        local nearestHRP = nearestSurvivor.HumanoidRootPart
                        local playerHRP = game:GetService("Players").LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
                        local maxIterations = math.floor(aimSettings.lockTime / 0.01)  -- Convert seconds to iterations
                        if playerHRP then
                            local direction = (nearestHRP.Position - playerHRP.Position).Unit
                            local num = 1
                           
                            while num <= maxIterations do
                                task.wait(0.01)
                                num = num + 1
                                workspace.CurrentCamera.CFrame = CFrame.new(workspace.CurrentCamera.CFrame.Position, nearestHRP.Position)
                                playerHRP.CFrame = CFrame.lookAt(playerHRP.Position, Vector3.new(nearestHRP.Position.X, nearestHRP.Position.Y, nearestHRP.Position.Z))
                            end
                        end
                    end
                end
            end
        end)
    else
        if Noloop then
            Noloop:Disconnect()
            Noloop = nil
        end
    end
end

local function No2aimbot(state)
    johnaim = state
    if game:GetService("Players").LocalPlayer.Character.Name ~= "Noli" and state then
        Library:Notify("角色不对，可能出现错误", nil, 4590657391)
        return 
    end
    if state then
        No2loop = game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.ChildAdded:Connect(function(child)
            if not johnaim then return end
            for _, v in pairs(aimbotNoilsounds2) do
                if child.Name == v then
                   
                    local survivors = {}
                    for _, player in pairs(game:GetService("Players"):GetPlayers()) do
                        if player ~= game:GetService("Players").LocalPlayer then
                            local character = player.Character
                            if character and character:FindFirstChild("HumanoidRootPart") then
                                table.insert(survivors, character)
                            end
                        end
                    end
    
                   
                    local nearestSurvivor = nil
                    local shortestDistance = math.huge  
                    
                    for _, survivor in pairs(survivors) do
                        local survivorHRP = survivor.HumanoidRootPart
                        local playerHRP = game:GetService("Players").LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
                        
                        if playerHRP then
                            local distance = (survivorHRP.Position - playerHRP.Position).Magnitude
                            if distance < shortestDistance and distance <= aimSettings.maxDistance then
                                shortestDistance = distance
                                nearestSurvivor = survivor
                            end
                        end
                    end
                    
                  
                    if nearestSurvivor then
                        local nearestHRP = nearestSurvivor.HumanoidRootPart
                        local playerHRP = game:GetService("Players").LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
                        local maxIterations = math.floor(aimSettings.lockTime / 0.01)  -- Convert seconds to iterations
                        if playerHRP then
                            local direction = (nearestHRP.Position - playerHRP.Position).Unit
                            local num = 1
                           
                            while num <= maxIterations do
                                task.wait(0.01)
                                num = num + 1
                                workspace.CurrentCamera.CFrame = CFrame.new(workspace.CurrentCamera.CFrame.Position, nearestHRP.Position)
                                playerHRP.CFrame = CFrame.lookAt(playerHRP.Position, Vector3.new(nearestHRP.Position.X, nearestHRP.Position.Y, nearestHRP.Position.Z))
                            end
                        end
                    end
                end
            end
        end)
    else
        if No2loop then
            No2loop:Disconnect()
            No2loop = nil
        end
    end
end

-- Add toggles to the groupbox
g:AddToggle('NoilStarBomb', {
    Text = 'Noil星炸弹自瞄',
    Default = false,
    Callback = function(state)
        Noaimbot(state)
    end
})

g:AddToggle('NoilVoidRush', {
    Text = 'Noil冲刺自瞄',
    Default = false,
    Callback = function(state)
        No2aimbot(state)
    end
})






local Warning = Tabs.tzq:AddLeftGroupbox("杀手靠近警告")

-- 杀手靠近提示设置
local KillerWarningSettings = {
    Enabled = false,
    WarningDistance = 100, -- 警告距离(米)
    WarningColor = Color3.fromRGB(255, 0, 0), -- 警告颜色(红色)
    TextSize = 20, -- 文字大小
    BlinkInterval = 0.5, -- 闪烁间隔(秒)
    LastWarningTime = 0, -- 上次警告时间
    WarningCooldown = 5, -- 警告冷却时间(秒)
    WarningSoundId = "rbxassetid://6545327576", -- 警告音效ID
    SoundVolume = 0.5 -- 音效音量
}

-- 存储绘制对象
local warningLabel = Drawing.new("Text")
warningLabel.Visible = false
warningLabel.Center = true
warningLabel.Outline = true
warningLabel.Font = 2 -- 粗体字体
warningLabel.Color = KillerWarningSettings.WarningColor
warningLabel.Size = KillerWarningSettings.TextSize

-- 存储音效对象
local warningSound = Instance.new("Sound")
warningSound.SoundId = KillerWarningSettings.WarningSoundId
warningSound.Volume = KillerWarningSettings.SoundVolume
warningSound.Parent = game:GetService("SoundService")

-- 更新警告显示
local function updateKillerWarning()
    local player = game.Players.LocalPlayer
    local character = player.Character
    if not character or not character:FindFirstChild("HumanoidRootPart") then return end
    
    local killersFolder = workspace.Players:FindFirstChild("Killers")
    if not killersFolder then return end
    
    local closestDistance = math.huge
    local closestKiller = nil
    
    -- 寻找最近的杀手
    for _, killer in ipairs(killersFolder:GetChildren()) do
        if killer:IsA("Model") and killer:FindFirstChild("HumanoidRootPart") then
            local distance = (character.HumanoidRootPart.Position - killer.HumanoidRootPart.Position).Magnitude
            if distance < closestDistance then
                closestDistance = distance
                closestKiller = killer
            end
        end
    end
    
    -- 检查距离并显示警告
    if closestKiller and closestDistance <= KillerWarningSettings.WarningDistance then
        local currentTime = tick()
        
        -- 闪烁效果
        if currentTime - KillerWarningSettings.LastWarningTime >= KillerWarningSettings.BlinkInterval then
            warningLabel.Visible = not warningLabel.Visible
            KillerWarningSettings.LastWarningTime = currentTime
        end
        
        -- 设置警告文本
        warningLabel.Text = string.format("⚠️Warning! 杀手 %s 在 %d 米内!", closestKiller.Name, math.floor(closestDistance))
        warningLabel.Position = Vector2.new(
            workspace.CurrentCamera.ViewportSize.X / 2,
            workspace.CurrentCamera.ViewportSize.Y * 0.2
        )
        
        -- 播放警告音效(冷却时间内只播放一次)
        if currentTime - KillerWarningSettings.LastWarningTime >= KillerWarningSettings.WarningCooldown then
            warningSound:Play()
            KillerWarningSettings.LastWarningTime = currentTime
        end
    else
        warningLabel.Visible = false
    end
end

-- 主开关
Warning:AddToggle("KillerWarningToggle", {
    Text = "启用",
    Default = false,
    Callback = function(enabled)
        KillerWarningSettings.Enabled = enabled
        if enabled then
            -- 初始化连接
            if not KillerWarningSettings.connection then
                KillerWarningSettings.connection = game:GetService("RunService").RenderStepped:Connect(updateKillerWarning)
            end
        else
            -- 关闭连接
            if KillerWarningSettings.connection then
                KillerWarningSettings.connection:Disconnect()
                KillerWarningSettings.connection = nil
            end
            warningLabel.Visible = false
            warningSound:Stop()
        end
    end
})

-- 距离设置
Warning:AddSlider("WarningDistance", {
    Text = "警告距离(米)",
    Min = 10,
    Max = 200,
    Default = 100,
    Rounding = 0,
    Callback = function(value)
        KillerWarningSettings.WarningDistance = value
    end
})

-- 文字大小设置
Warning:AddSlider("WarningTextSize", {
    Text = "文字大小",
    Min = 10,
    Max = 30,
    Default = 20,
    Rounding = 0,
    Callback = function(value)
        KillerWarningSettings.TextSize = value
        warningLabel.Size = value
    end
})



-- 警告颜色选择
Warning:AddDropdown("WarningColor", {
    Values = {"red", "orange", "yellow", "pink", "purple"},
    Default = "red",
    Text = "文字颜色",
    Callback = function(value)
        local colorMap = {
            ["red"] = Color3.fromRGB(255, 0, 0),
            ["orange"] = Color3.fromRGB(255, 165, 0),
            ["yellow"] = Color3.fromRGB(255, 255, 0),
            ["pink"] = Color3.fromRGB(255, 192, 203),
            ["purple"] = Color3.fromRGB(128, 0, 128)
        }
        KillerWarningSettings.WarningColor = colorMap[value] or Color3.fromRGB(255, 0, 0)
        warningLabel.Color = KillerWarningSettings.WarningColor
    end
})


local Visual = Tabs.tzq:AddRightGroupbox("Noli能力监听")



Visual:AddToggle("NoliTeleportAlert", {
    Text = "Noli选择电机提示",
    Default = false,
    Callback = function(v)
        if v then
            local activeConnections = {}
            local lastNotifyTime = 0
            local COOLDOWN = 2
            local TARGET_SOUND_ID = "rbxassetid://125253972523701"

            local function safeNotify()
                local currentTime = tick()
                if currentTime - lastNotifyTime > COOLDOWN then
                    Library:Notify("warning\nNoli is transmitting")
                    lastNotifyTime = currentTime
                end
            end

            local function checkSoundPlaying(sound)
                return sound and sound.IsPlaying or false
            end

            local function monitorSound(sound)
                task.spawn(function()
                    while sound.Parent and checkSoundPlaying(sound) do
                        safeNotify()
                        task.wait(COOLDOWN)
                    end
                end)
            end

            local function setupKiller(killer)
                local humanoidRootPart = killer:WaitForChild("HumanoidRootPart", 5)
                if humanoidRootPart then
                   
                    for _, child in ipairs(humanoidRootPart:GetChildren()) do
                        if child:IsA("Sound") and child.SoundId == TARGET_SOUND_ID then
                            monitorSound(child)
                        end
                    end

                
                    local connection = humanoidRootPart.ChildAdded:Connect(function(child)
                        if child:IsA("Sound") and child.SoundId == TARGET_SOUND_ID then
                            monitorSound(child)
                        end
                    end)
                    
                    table.insert(activeConnections, connection)
                end
            end

        
            table.insert(activeConnections, workspace.Players.Killers.ChildAdded:Connect(setupKiller))

          
            for _, killer in ipairs(workspace.Players.Killers:GetChildren()) do
                task.spawn(setupKiller, killer)
            end
        else
           
            for _, conn in ipairs(activeConnections) do
                conn:Disconnect()
            end
            activeConnections = {}
        end
    end
})



Visual:AddToggle("NoliMotorSelect", {
    Text = "Noli传送电机提示",
    Default = false,
    Callback = function(v)
        local soundId = "rbxassetid://124468317999247"
        local notificationMessage = "⚠️Warning\nNoli Selecting Generator"
        local connections = {}
        local cooldown = 2 -- 通知冷却时间(秒)
        local lastNotifyTime = 0

        local function disconnectAll()
            for _, conn in pairs(connections) do
                conn:Disconnect()
            end
            connections = {}
        end

        local function safeNotify()
            local now = os.time()
            if now - lastNotifyTime >= cooldown then
                Library:Notify(notificationMessage)
                lastNotifyTime = now
            end
        end

        local function setupSoundListener(humanoidRootPart)
            local function onChildAdded(child)
                if child:IsA("Sound") and child.SoundId == soundId then
                    safeNotify()
                end
            end

            local conn = humanoidRootPart.ChildAdded:Connect(onChildAdded)
            table.insert(connections, conn)

            -- 检查已存在的音频
            for _, child in ipairs(humanoidRootPart:GetChildren()) do
                if child:IsA("Sound") and child.SoundId == soundId then
                    safeNotify()
                    break
                end
            end
        end

        local function onKillerAdded(killer)
            local humanoidRootPart = killer:FindFirstChild("HumanoidRootPart") or killer:WaitForChild("HumanoidRootPart", 3)
            if humanoidRootPart then
                setupSoundListener(humanoidRootPart)
            end
        end

        if v then
            -- 监听新杀手
            local mainConn = workspace.Players.Killers.ChildAdded:Connect(onKillerAdded)
            table.insert(connections, mainConn)

            -- 初始化现有杀手
            for _, killer in ipairs(workspace.Players.Killers:GetChildren()) do
                task.spawn(onKillerAdded, killer)
            end
        else
            disconnectAll()
        end
    end
})





Visual:AddToggle("NoliMotorSelect", {
    Text = "Noli冲刺提示",
    Default = false,
    Callback = function(v)
        local soundId = "rbxassetid://126318185932771"
        local notificationMessage = "Noli is sprinting"
        local endNotificationMessage = "Noli冲刺结束"
        local connections = {}
        local cooldown = 2
        local lastNotifyTime = 0

        local function disconnectAll()
            for _, conn in pairs(connections) do
                conn:Disconnect()
            end
            connections = {}
        end

        local function safeNotify(message)
            local now = os.time()
            if now - lastNotifyTime >= cooldown then
                Library:Notify(message)
                lastNotifyTime = now
            end
        end

        local function setupSoundListener(humanoidRootPart)
            local function onChildAdded(child)
                if child:IsA("Sound") and child.SoundId == soundId then
                    safeNotify(notificationMessage)
                    local endedConn = child.Ended:Connect(function()
                        safeNotify(endNotificationMessage)
                        endedConn:Disconnect()
                    end)
                    table.insert(connections, endedConn)
                end
            end

            local conn = humanoidRootPart.ChildAdded:Connect(onChildAdded)
            table.insert(connections, conn)

            for _, child in ipairs(humanoidRootPart:GetChildren()) do
                if child:IsA("Sound") and child.SoundId == soundId then
                    safeNotify(notificationMessage)
                    if child.IsPlaying then
                        local endedConn = child.Ended:Connect(function()
                            safeNotify(endNotificationMessage)
                            endedConn:Disconnect()
                        end)
                        table.insert(connections, endedConn)
                    end
                    break
                end
            end
        end

        local function onKillerAdded(killer)
            local humanoidRootPart = killer:FindFirstChild("HumanoidRootPart") or killer:WaitForChild("HumanoidRootPart", 3)
            if humanoidRootPart then
                setupSoundListener(humanoidRootPart)
            end
        end

        if v then
            local mainConn = workspace.Players.Killers.ChildAdded:Connect(onKillerAdded)
            table.insert(connections, mainConn)
            for _, killer in ipairs(workspace.Players.Killers:GetChildren()) do
                task.spawn(onKillerAdded, killer)
            end
        else
            disconnectAll()
        end
    end
})


















local Visual = Tabs.tzq:AddRightGroupbox('其他')



Visual:AddToggle("NST",{
Text = "地下空间炸弹生成提示",
Default = false,
Callback = function(v)
if v then
NotifySubspaceTripmine = workspace.Map.Ingame.DescendantAdded:Connect(function(v)
if v.Name == "SubspaceTripmine" then
Library:Notify("Old Winter | Warning\nBlock 'SubspaceTripmine generated！")
end
end)
else
NotifySubspaceTripmine:Disconnect()
end
end})
Visual:AddToggle("NEK",{
Text = "实体生成提示",
Default = false,
Callback = function(v)
if v then
NotifyEntityKillers = workspace.DescendantAdded:Connect(function(v)
if v:IsA("Model") and v.Name == "PizzaDeliveryRig" or v.Name == "Bunny" or v.Name == "Mafiaso1" or v.Name == "Mafiaso2" or v.Name == "Mafiaso3" then
Library:Notify("Old Winter | Warning\nEntity '" .. v.Name .. "' 生成了！")
elseif v:IsA("Model") and v.Name == "1x1x1x1Zombie" then
Library:Notify("Old Winter | Warning\nEntity '1x1x1x1 (zombies)' 生成了！")
end
end)
else
NotifyEntityKillers:Disconnect()
end
end})


















local ZZ = Tabs.ani:AddLeftGroupbox('Noli反效果')

local noliDeleterActive = false
local deletionConnection = nil
local allowedNoli = nil
local isVoidRushCrashed = false
local characterCheckLoop = nil
local voidRushOverrideActive = false
local voidRushState = {}
local RunService = game:GetService("RunService")

local function deleteNewNoli()
    local killersFolder = workspace:WaitForChild("Players")
    local killers = killersFolder:WaitForChild("Killers")
    
    allowedNoli = killers:FindFirstChild("Noli")
    if not allowedNoli then
        return
    end
    
    if deletionConnection then
        deletionConnection:Disconnect()
        deletionConnection = nil
    end
    
    deletionConnection = RunService.Heartbeat:Connect(function()
        allowedNoli = killers:FindFirstChild("Noli")
        
        if not allowedNoli then
            if deletionConnection then
                deletionConnection:Disconnect()
                deletionConnection = nil
            end
            return
        end
        
        for _, child in killers:GetChildren() do
            if child.Name == "Noli" and child ~= allowedNoli then
                child:Destroy()
            end
        end
    end)
end

ZZ:AddToggle("NoliDeleter", {
    Text = "反假Noli",
    Default = false,
    Callback = function(enabled)
        noliDeleterActive = enabled
        
        if enabled then
            if deletionConnection then
                deletionConnection:Disconnect()
                deletionConnection = nil
            end
            
            local success, err = pcall(function()
                deleteNewNoli()
            end)
            
            if not success then
                noliDeleterActive = false
            end
        else
            if deletionConnection then
                deletionConnection:Disconnect()
                deletionConnection = nil
            end
            allowedNoli = nil
        end
    end
})

local killersFolder = workspace:WaitForChild("Players")
local killers = killersFolder:WaitForChild("Killers")

killers.ChildAdded:Connect(function(child)
    if noliDeleterActive and child.Name == "Noli" and not deletionConnection then
        task.wait(0.5)
        if noliDeleterActive and not deletionConnection then
            deleteNewNoli()
        end
    end
end)

local player = game:GetService("Players").LocalPlayer

local function manageVoidRushState(character)
    while isVoidRushCrashed and character and character.Parent do
        character:SetAttribute("VoidRushState", "Crashed")
        task.wait(0.5)
    end
end

ZZ:AddToggle("无视障碍[Noli]", {
    Text = "Noli无视障碍",
    Default = false,
    Callback = function(enabled)
        isVoidRushCrashed = enabled
        local character = player.Character
        
        if characterCheckLoop then
            task.cancel(characterCheckLoop)
            characterCheckLoop = nil
        end
        
        if enabled then
            if character then
                characterCheckLoop = task.spawn(function()
                    manageVoidRushState(character)
                end)
            end
        else
            if character then
                character:SetAttribute("VoidRushState", nil)
            end
        end
    end
})

player.CharacterAdded:Connect(function(newCharacter)
    if isVoidRushCrashed then
        if characterCheckLoop then
            task.cancel(characterCheckLoop)
        end
        characterCheckLoop = task.spawn(function()
            manageVoidRushState(newCharacter)
        end)
    end
end)

ZZ:AddToggle("VoidRushOverride", {
    Text = "Noli自由冲刺[需要锁定视角]",
    Default = false,
    Callback = function(enabled)
        voidRushOverrideActive = enabled
        
        if voidRushState.monitorTask then
            task.cancel(voidRushState.monitorTask)
            voidRushState.monitorTask = nil
        end
        
        if voidRushState.overrideConnection then
            voidRushState.overrideConnection:Disconnect()
            voidRushState.overrideConnection = nil
        end
        
        if voidRushState.characterAddedConnection then
            voidRushState.characterAddedConnection:Disconnect()
            voidRushState.characterAddedConnection = nil
        end
        
        if enabled then
            local LocalPlayer = game:GetService("Players").LocalPlayer
            local ORIGINAL_DASH_SPEED = 60
            local DEFAULT_WALK_SPEED = 16
            
            local function setupCharacter()
                if LocalPlayer.Character then
                    local Character = LocalPlayer.Character
                    local Humanoid = Character:FindFirstChildOfClass("Humanoid")
                    local HumanoidRootPart = Character:FindFirstChild("HumanoidRootPart")
                    
                    if Humanoid then
                        Humanoid.WalkSpeed = DEFAULT_WALK_SPEED
                        Humanoid.AutoRotate = true
                    end
                    
                    return Character, Humanoid, HumanoidRootPart
                end
                return nil, nil, nil
            end
            
            local function startOverride(Humanoid, HumanoidRootPart)
                if voidRushState.overrideConnection then return end
                
                voidRushState.overrideConnection = RunService.RenderStepped:Connect(function()
                    if not Humanoid or not HumanoidRootPart or not voidRushOverrideActive then
                        return
                    end
                    
                    Humanoid.WalkSpeed = ORIGINAL_DASH_SPEED
                    Humanoid.AutoRotate = false
                    
                    local direction = HumanoidRootPart.CFrame.LookVector
                    local horizontalDirection = Vector3.new(direction.X, 0, direction.Z).Unit
                    Humanoid:Move(horizontalDirection)
                end)
            end
            
            local function stopOverride()
                if voidRushState.overrideConnection then
                    voidRushState.overrideConnection:Disconnect()
                    voidRushState.overrideConnection = nil
                end
                
                local Character, Humanoid = setupCharacter()
                if Humanoid then
                    Humanoid.WalkSpeed = DEFAULT_WALK_SPEED
                    Humanoid.AutoRotate = true
                    Humanoid:Move(Vector3.new(0, 0, 0))
                end
            end
            
            local function monitorVoidRush()
                while voidRushOverrideActive do
                    local Character, Humanoid, HumanoidRootPart = setupCharacter()
                    
                    if Character and Humanoid and HumanoidRootPart then
                        local voidRushStateAttr = Character:GetAttribute("VoidRushState")
                        if voidRushStateAttr == "Dashing" then
                            startOverride(Humanoid, HumanoidRootPart)
                        else
                            stopOverride()
                        end
                    end
                    
                    task.wait()
                end
                stopOverride()
            end
            
            voidRushState.monitorTask = task.spawn(monitorVoidRush)
            
            voidRushState.characterAddedConnection = LocalPlayer.CharacterAdded:Connect(function(newChar)
                if voidRushOverrideActive then
                    local Humanoid = newChar:WaitForChildOfClass("Humanoid")
                    local HumanoidRootPart = newChar:WaitForChild("HumanoidRootPart")
                    Humanoid.WalkSpeed = DEFAULT_WALK_SPEED
                    Humanoid.AutoRotate = true
                end
            end)
        end
    end
})

local ZZ = Tabs.ani:AddRightGroupbox('1x4反效果')local ReplicatedStorage = game:GetService("ReplicatedStorage")

local LocalPlayer = Players.LocalPlayer
local RemoteEvent = ReplicatedStorage.Modules.Network.RemoteEvent

local AutoPopup = {
    Enabled = false,
    Task = nil,
    Connections = {},
    Interval = 0.5
}

local function deletePopups()
    if not LocalPlayer or not LocalPlayer:FindFirstChild("PlayerGui") then
        return false
    end
    
    local tempUI = LocalPlayer.PlayerGui:FindFirstChild("TemporaryUI")
    if not tempUI then
        return false
    end
    
    local deleted = false
    for _, popup in ipairs(tempUI:GetChildren()) do
        if popup.Name == "1x1x1x1Popup" then
            popup:Destroy()
            deleted = true
        end
    end
    return deleted
end

local function triggerEntangled()
    pcall(function()
        RemoteEvent:FireServer(
            "Entangled",
            {}
        )
    end)
end

local function setupPopupListener()
    if not LocalPlayer or not LocalPlayer:FindFirstChild("PlayerGui") then return end
    
    local tempUI = LocalPlayer.PlayerGui:FindFirstChild("TemporaryUI")
    if not tempUI then
        tempUI = Instance.new("Folder")
        tempUI.Name = "TemporaryUI"
        tempUI.Parent = LocalPlayer.PlayerGui
    end
    
    if AutoPopup.Connections.ChildAdded then
        AutoPopup.Connections.ChildAdded:Disconnect()
    end
    
    AutoPopup.Connections.ChildAdded = tempUI.ChildAdded:Connect(function(child)
        if AutoPopup.Enabled and child.Name == "1x1x1x1Popup" then
            task.defer(function()
                child:Destroy()
                triggerEntangled()
            end)
        end
    end)
end

local function runMainTask()
    while AutoPopup.Enabled do
        deletePopups()
        task.wait(AutoPopup.Interval)
    end
end

local function startAutoPopup()
    if AutoPopup.Enabled then return end
    
    AutoPopup.Enabled = true
    setupPopupListener()
    
    if AutoPopup.Task then
        task.cancel(AutoPopup.Task)
    end
    AutoPopup.Task = task.spawn(runMainTask)
end

local function stopAutoPopup()
    if not AutoPopup.Enabled then return end
    
    AutoPopup.Enabled = false
    
    if AutoPopup.Task then
        task.cancel(AutoPopup.Task)
        AutoPopup.Task = nil
    end
    
    for _, connection in pairs(AutoPopup.Connections) do
        connection:Disconnect()
    end
    AutoPopup.Connections = {}
end

ZZ:AddSlider('AutoPopupInterval', {
    Text = '执行间隔(s)',
    Default = 0.5,
    Min = 0.5,
    Max = 2,
    Rounding = 0,
    Tooltip = '设置自动执行的间隔时间(1-5秒)',
    Callback = function(value)
        AutoPopup.Interval = value
    end
})

ZZ:AddToggle('AutoPopupToggle', {
    Text = '反弹窗',
    Default = false,
    Tooltip = '去除弹窗和懒惰效果',
    Callback = function(state)
        if state then
            startAutoPopup()
        else
            stopAutoPopup()
        end
    end
})

if LocalPlayer then
    LocalPlayer:GetPropertyChangedSignal("Parent"):Connect(function()
        if not LocalPlayer.Parent then
            stopAutoPopup()
        end
    end)
end


ZZ:AddToggle("RemoveUnstableEye", {
    Text = "反不稳定眼不能行走", 
    Default = false,
    Callback = function(v)
        if not _G.UnstableEyeCleanup then _G.UnstableEyeCleanup = {} end
        local connections = _G.UnstableEyeCleanup

        for _, conn in pairs(connections) do
            if typeof(conn) == "RBXScriptConnection" then
                conn:Disconnect()
            end
        end
        _G.UnstableEyeCleanup = {}

        if not v then return end

        local function CleanUnstableEyeEffects()
            local killersFolder = workspace:FindFirstChild("Players") and workspace.Players:FindFirstChild("Killers")
            if not killersFolder then return end
            
            for _, killer in ipairs(killersFolder:GetDescendants()) do
                if killer.Name == "UnstableEye" then
                    killer:Destroy()
                end
            end
        end

        task.spawn(CleanUnstableEyeEffects)

        connections.heartbeat = game:GetService("RunService").Heartbeat:Connect(function()
            task.wait(1.5)
            CleanUnstableEyeEffects()
        end)

        local killersFolder = workspace:FindFirstChild("Players") and workspace.Players:FindFirstChild("Killers")
        if killersFolder then
            connections.descendantAdded = killersFolder.DescendantAdded:Connect(function(descendant)
                if descendant.Name == "UnstableEye" then
                    descendant:Destroy()
                end
            end)
        end
    end
})

ZZ:AddToggle("RemoveBlindness", {
    Text = "反失明", 
    Default = false,
    Callback = function(v)
        if not _G.BlindnessCleanup then _G.BlindnessCleanup = {} end
        local connections = _G.BlindnessCleanup

        for _, conn in pairs(connections) do
            if typeof(conn) == "RBXScriptConnection" then
                conn:Disconnect()
            end
        end
        _G.BlindnessCleanup = {}

        if not v then return end

        local ReplicatedStorage = game:GetService("ReplicatedStorage")
        local modulesFolder = ReplicatedStorage:FindFirstChild("Modules")
        local statusEffects = modulesFolder and modulesFolder:FindFirstChild("StatusEffects")
        
        if not statusEffects then
            warn("未找到 ReplicatedStorage.Modules.StatusEffects 路径")
            return
        end
        
        local function RemoveBlindness()
            local blindness = statusEffects:FindFirstChild("Blindness")
            if blindness then
                blindness:Destroy()
            end
        end

        task.spawn(RemoveBlindness)

        connections.heartbeat = game:GetService("RunService").Heartbeat:Connect(function()
            task.wait(1.5)
            RemoveBlindness()
        end)

        connections.descendantAdded = statusEffects.DescendantAdded:Connect(function(descendant)
            if descendant.Name == "Blindness" then
                task.wait(0.1)
                descendant:Destroy()
            end
        end)
    end
})

local ZZ = Tabs.ani:AddRightGroupbox('谢德反效果')

ZZ:AddToggle("RemoveStunningKiller", {
    Text = "反谢德挥剑速度", 
    Default = false,
    Callback = function(v)
        if not _G.StunningKillerCleanup then _G.StunningKillerCleanup = {} end
        local connections = _G.StunningKillerCleanup

        for _, conn in pairs(connections) do
            if typeof(conn) == "RBXScriptConnection" then
                conn:Disconnect()
            end
        end
        _G.StunningKillerCleanup = {}

        if not v then return end

        local function CleanStunningKillers()
            local survivorsFolder = workspace:FindFirstChild("Players") and workspace.Players:FindFirstChild("Survivors")
            if not survivorsFolder then return end
            
            local survivorList = survivorsFolder:GetChildren()
            for i = 1, #survivorList, 5 do
                task.spawn(function()
                    for j = i, math.min(i + 4, #survivorList) do
                        local survivor = survivorList[j]
                        local stunningKiller = survivor:FindFirstChild("StunningKiller")
                        if stunningKiller then
                            stunningKiller:Destroy()
                        end
                    end
                end)
            end
        end

        task.spawn(CleanStunningKillers)

        connections.heartbeat = game:GetService("RunService").Heartbeat:Connect(function()
            task.wait(2)
            CleanStunningKillers()
        end)

        local survivorsFolder = workspace:FindFirstChild("Players") and workspace.Players:FindFirstChild("Survivors")
        if survivorsFolder then
            connections.descendantAdded = survivorsFolder.DescendantAdded:Connect(function(descendant)
                if descendant.Name == "StunningKiller" then
                    descendant:Destroy()
                end
            end)
        end
    end
})

local ZZ2 = Tabs.ani:AddRightGroupbox('NOOB 反效果')

ZZ2:AddToggle("RemoveSlateskin", {
    Text = "反Noob石板速度", 
    Default = false,
    Callback = function(v)
        if not _G.SlateskinCleanup then _G.SlateskinCleanup = {} end
        local connections = _G.SlateskinCleanup

        for _, conn in pairs(connections) do
            if typeof(conn) == "RBXScriptConnection" then
                conn:Disconnect()
            end
        end
        _G.SlateskinCleanup = {}

        if not v then return end

        local function CleanSlateskins()
            local survivorsFolder = workspace:FindFirstChild("Players") and workspace.Players:FindFirstChild("Survivors")
            if not survivorsFolder then return end
            
            local survivorList = survivorsFolder:GetChildren()
            for i = 1, #survivorList, 5 do
                task.spawn(function()
                    for j = i, math.min(i + 4, #survivorList) do
                        local survivor = survivorList[j]
                        local slateskin = survivor:FindFirstChild("SlateskinStatus")
                        if slateskin then
                            slateskin:Destroy()
                        end
                    end
                end)
            end
        end

        task.spawn(CleanSlateskins)

        connections.heartbeat = game:GetService("RunService").Heartbeat:Connect(function()
            task.wait(2)
            CleanSlateskins()
        end)

        local survivorsFolder = workspace:FindFirstChild("Players") and workspace.Players:FindFirstChild("Survivors")
        if survivorsFolder then
            connections.descendantAdded = survivorsFolder.DescendantAdded:Connect(function(descendant)
                if descendant.Name == "SlateskinStatus" then
                    descendant:Destroy()
                end
            end)
        end
    end
})




local Disabled = Tabs.ani:AddLeftGroupbox('访客反效果')

Disabled:AddToggle("RemoveSlowed", {
    Text = "反缓慢", 
    Default = false,
    Callback = function(v)
        if not _G.SlowedCleanup then _G.SlowedCleanup = {} end
        local connections = _G.SlowedCleanup

        for _, conn in pairs(connections) do
            if typeof(conn) == "RBXScriptConnection" then
                conn:Disconnect()
            end
        end
        _G.SlowedCleanup = {}

        if not v then return end

        local function CleanSlowedStatuses()
            local survivorsFolder = workspace:FindFirstChild("Players") and workspace.Players:FindFirstChild("Survivors")
            if not survivorsFolder then return end
            
            for _, survivor in ipairs(survivorsFolder:GetDescendants()) do
                if survivor.Name == "SlowedStatus" then
                    survivor:Destroy()
                end
            end
        end

        task.spawn(CleanSlowedStatuses)

        connections.heartbeat = game:GetService("RunService").Heartbeat:Connect(function()
            task.wait(1.5)
            CleanSlowedStatuses()
        end)

        local survivorsFolder = workspace:FindFirstChild("Players") and workspace.Players:FindFirstChild("Survivors")
        if survivorsFolder then
            connections.descendantAdded = survivorsFolder.DescendantAdded:Connect(function(descendant)
                if descendant.Name == "SlowedStatus" then
                    descendant:Destroy()
                end
            end)
        end
    end
})

Disabled:AddToggle("RemoveBlockingSlow", {
    Text = "反格挡速度", 
    Default = false,
    Callback = function(v)
        if not _G.BlockingCleanup then _G.BlockingCleanup = {} end
        local connections = _G.BlockingCleanup

        for _, conn in pairs(connections) do
            if typeof(conn) == "RBXScriptConnection" then
                conn:Disconnect()
            end
        end
        _G.BlockingCleanup = {}

        if not v then return end

        local function CleanStatuses()
            local survivorsFolder = workspace:FindFirstChild("Players") and workspace.Players:FindFirstChild("Survivors")
            if not survivorsFolder then return end
            
            for _, survivor in ipairs(survivorsFolder:GetDescendants()) do
                if survivor.Name == "ResistanceStatus" or survivor.Name == "GuestBlocking" then
                    survivor:Destroy()
                end
            end
        end

        task.spawn(CleanStatuses)

        connections.heartbeat = game:GetService("RunService").Heartbeat:Connect(function()
            task.wait(1.5)
            CleanStatuses()
        end)

        local survivorsFolder = workspace:FindFirstChild("Players") and workspace.Players:FindFirstChild("Survivors")
        if survivorsFolder then
            connections.descendantAdded = survivorsFolder.DescendantAdded:Connect(function(descendant)
                if descendant.Name == "ResistanceStatus" or descendant.Name == "GuestBlocking" then
                    descendant:Destroy()
                end
            end)
        end
    end
})

Disabled:AddToggle("RemovePunchSlow", {
    Text = "反拳击速度", 
    Default = false,
    Callback = function(v)
        if not _G.PunchCleanup then _G.PunchCleanup = {} end
        local connections = _G.PunchCleanup

        for _, conn in pairs(connections) do
            if typeof(conn) == "RBXScriptConnection" then
                conn:Disconnect()
            end
        end
        _G.PunchCleanup = {}

        if not v then return end

        local function CleanStatuses()
            local survivorsFolder = workspace:FindFirstChild("Players") and workspace.Players:FindFirstChild("Survivors")
            if not survivorsFolder then return end
            
            for _, survivor in ipairs(survivorsFolder:GetDescendants()) do
                if survivor.Name == "ResistanceStatus" or survivor.Name == "PunchAbility" then
                    survivor:Destroy()
                end
            end
        end

        task.spawn(CleanStatuses)

        connections.heartbeat = game:GetService("RunService").Heartbeat:Connect(function()
            task.wait(1.5)
            CleanStatuses()
        end)

        local survivorsFolder = workspace:FindFirstChild("Players") and workspace.Players:FindFirstChild("Survivors")
        if survivorsFolder then
            connections.descendantAdded = survivorsFolder.DescendantAdded:Connect(function(descendant)
                if descendant.Name == "ResistanceStatus" or descendant.Name == "PunchAbility" then
                    descendant:Destroy()
                end
            end)
        end
    end
})

Disabled:AddToggle("RemoveChargeEnded", {
    Text = "反冲刺结束后效果", 
    Default = false,
    Callback = function(v)
        if not _G.ChargeEndedCleanup then _G.ChargeEndedCleanup = {} end
        local connections = _G.ChargeEndedCleanup

        for _, conn in pairs(connections) do
            if typeof(conn) == "RBXScriptConnection" then
                conn:Disconnect()
            end
        end
        _G.ChargeEndedCleanup = {}

        if not v then return end

        local function CleanChargeEndedEffects()
            local survivorsFolder = workspace:FindFirstChild("Players") and workspace.Players:FindFirstChild("Survivors")
            if not survivorsFolder then return end
            
            for _, survivor in ipairs(survivorsFolder:GetDescendants()) do
                if survivor.Name == "GuestChargeEnded" then
                    survivor:Destroy()
                end
            end
        end

        task.spawn(CleanChargeEndedEffects)

        connections.heartbeat = game:GetService("RunService").Heartbeat:Connect(function()
            task.wait(1.5)
            CleanChargeEndedEffects()
        end)

        local survivorsFolder = workspace:FindFirstChild("Players") and workspace.Players:FindFirstChild("Survivors")
        if survivorsFolder then
            connections.descendantAdded = survivorsFolder.DescendantAdded:Connect(function(descendant)
                if descendant.Name == "GuestChargeEnded" then
                    descendant:Destroy()
                end
            end)
        end
    end
})
















local MenuGroup = Tabs["UI Settings"]:AddLeftGroupbox("Debug")

-- 1. 显示/隐藏快捷键菜单
MenuGroup:AddToggle("KeybindMenuOpen", {
    Default = Library.KeybindFrame.Visible,  -- 默认显示快捷键菜单
    Text = "shortcut menu",
    Callback = function(value)
        Library.KeybindFrame.Visible = value  -- 控制快捷键菜单的显示/隐藏
    end,
})

-- 2. 自定义鼠标光标
MenuGroup:AddToggle("ShowCustomCursor", {
    Text = "custom cursors",
    Default = true,  -- 默认启用
    Callback = function(Value)
        Library.ShowCustomCursor = Value  -- 启用/禁用自定义光标
    end,
})

-- 3. 设置通知位置（左/右）
MenuGroup:AddDropdown("NotificationSide", {
    Values = { "Left", "Right" },
    Default = "Right",  -- 默认右侧显示通知
    Text = "informer location",
    Callback = function(Value)
        Library:SetNotifySide(Value)  -- 设置通知位置
    end,
})

-- 4. 调整UI缩放比例（DPI）
MenuGroup:AddDropdown("DPIDropdown", {
    Values = { "25%", "50%", "75%", "100%", "125%", "150%", "175%", "200%" },
    Default = "100%",  -- 默认100%大小
    Text = "UI Size",
    Callback = function(Value)
        Value = Value:gsub("%%", "")  -- 移除百分号
        local DPI = tonumber(Value)   -- 转换为数字
        Library:SetDPIScale(DPI)      -- 调整UI缩放
    end,
})


MenuGroup:AddDivider()  
MenuGroup:AddLabel("Menu bind")  
    :AddKeyPicker("MenuKeybind", { 
        Default = "RightShift",  
        NoUI = true,            
        Text = "Menu keybind"    
    })


MenuGroup:AddButton("Destroy UI", function()
    Library:Unload()  
end)


ThemeManager:SetLibrary(Library)  
SaveManager:SetLibrary(Library)   
SaveManager:IgnoreThemeSettings() 


SaveManager:SetIgnoreIndexes({ "MenuKeybind" })  
ThemeManager:SetFolder("MyScriptHub")            
SaveManager:SetFolder("MyScriptHub/specific-game")  
SaveManager:SetSubFolder("specific-place")       
SaveManager:BuildConfigSection(Tabs["UI Settings"])  

ThemeManager:ApplyToTab(Tabs["UI Settings"])

SaveManager:LoadAutoloadConfig()



        Library:Notify("EX FSK 已加载", 3)
    end
})

-- 99夜脚本
Script99Group:AddButton({
    Text = "h4x 99nights",
    Func = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/greatjakson-lgtm/-2/main/h4x99nights"))()
        Library:Notify("h4x 99nights 已加载", 3)
    end
})

Script99Group:AddButton({
    Text = "ringta 99nights",
    Func = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/greatjakson-lgtm/-2/main/ringta_99nights"))()
        Library:Notify("ringta 99nights 已加载", 3)
    end
})

Script99Group:AddButton({
    Text = "虚空99nights",
    Func = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/greatjakson-lgtm/-2/main/void_99nights"))()
        Library:Notify("虚空99nights 已加载", 3)
    end
})

Script99Group:AddButton({
    Text = "lunar 99nights [key]",
    Func = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/greatjakson-lgtm/-2/main/moon_99nights"))()
        Library:Notify("lunar 99nights 已加载", 3)
    end
})

-- Doors脚本
ScriptDoorsGroup:AddButton({
    Text = "doors null fire [key]",
    Func = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/greatjakson-lgtm/-2/main/wu_doors"))()
        Library:Notify("doors null fire 已加载", 3)
    end
})

ScriptDoorsGroup:AddButton({
    Text = "doors prohax",
    Func = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/atnew2025/Chinese-scripts/refs/heads/main/mshax(prohax).txt"))()
        Library:Notify("doors prohax 已加载", 3)
    end
})

ScriptDoorsGroup:AddButton({
    Text = "doors abysall",
    Func = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Cucumber190/roblox-/main/abysall%20Qcumber.lua"))()
        Library:Notify("doors abysall 已加载", 3)
    end
})

ScriptDoorsGroup:AddButton({
    Text = "doors rehax",
    Func = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/XxwanhexxX/doors-zh/refs/heads/main/rehax%20hub-zh"))()
        Library:Notify("doors rehax 已加载", 3)
    end
})

-- 压力脚本
ScriptPressureGroup:AddButton({
    Text = "yoxi",
    Func = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/greatjakson-lgtm/-2/main/yoxi_Pressure"))()
        Library:Notify("yoxi 压力 已加载", 3)
    end
})

-- InkGame
ScriptInkGameGroup:AddButton({
    Text = "inkgame boren",
    Func = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/greatjakson-lgtm/-2/main/boren_inkgame"))()
        Library:Notify("inkgame boren 已加载", 3)
    end
})

ScriptInkGameGroup:AddButton({
    Text = "inkgame az中心",
    Func = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/greatjakson-lgtm/-2/main/az_hub"))()
        Library:Notify("inkgame az中心 已加载", 3)
    end
})

ScriptInkGameGroup:AddButton({
    Text = "tex",
    Func = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/hdjsjjdgrhj/script-hub/refs/heads/main/TexRBLlX"))()
        Library:Notify("tex ink game 已加载", 3)
    end
})

-- 被遗弃脚本
ScriptForsakenGroup:AddButton({
    Text = "虚空被遗弃",
    Func = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/greatjakson-lgtm/-2/main/void_forsken"))()
        Library:Notify("虚空被遗弃 已加载", 3)
    end
})

-- 死亡之死
ScriptDieOfDeathGroup:AddButton({
    Text = "Thuker 死亡之死",
    Func = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/greatjakson-lgtm/-2/main/thy_die%20of%20deah"))()
        Library:Notify("Thuker 死亡之死 已加载", 3)
    end
})

ScriptDieOfDeathGroup:AddButton({
    Text = "zamzaman 死亡之死",
    Func = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/greatjakson-lgtm/-2/main/zam_die%20of%20deah"))()
        Library:Notify("zamzaman 死亡之死 已加载", 3)
    end
})

-- 力量传奇
ScriptPowerLegendsGroup:AddButton({
    Text = "bald力量传奇 [key]",
    Func = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/greatjakson-lgtm/-2/main/bald_力量传奇"))()
        Library:Notify("bald力量传奇 已加载", 3)
    end
})

ScriptPowerLegendsGroup:AddButton({
    Text = "力量传奇修改力量",
    Func = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/greatjakson-lgtm/-2/main/修改力量"))()
        Library:Notify("力量传奇修改力量 已加载", 3)
    end
})

-- 极速传奇
ScriptSpeedLegendsGroup:AddButton({
    Text = "中文极速传奇",
    Func = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/TtmScripter/GoodScript/main/LegendOfSpeed(Chinese)"))()
        Library:Notify("中文极速传奇 已加载", 3)
    end
})

-- 忍者传奇
ScriptNinjaLegendsGroup:AddButton({
    Text = "h3ll忍者传奇",
    Func = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/greatjakson-lgtm/-2/main/h3ll_忍者传奇"))()
        Library:Notify("h3ll忍者传奇 已加载", 3)
    end
})

-- FLSCH
ScriptFLSCHGroup:AddButton({
    Text = "flsch solix",
    Func = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/greatjakson-lgtm/-2/main/solix_fisch"))()
        Library:Notify("flsch solix 已加载", 3)
    end
})

-- BF
ScriptBFGroup:AddButton({
    Text = "bf blue x",
    Func = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/greatjakson-lgtm/-2/main/blue%20x"))()
        Library:Notify("bf blue x 已加载", 3)
    end
})

ScriptBFGroup:AddButton({
    Text = "solix BF [key]",
    Func = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/greatjakson-lgtm/-2/main/solix_BF"))()
        Library:Notify("solix BF 已加载", 3)
    end
})

ScriptBFGroup:AddButton({
    Text = "bf redz",
    Func = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/greatjakson-lgtm/-2/main/rdz"))()
        Library:Notify("bf redz 已加载", 3)
    end
})

-- 死铁轨
ScriptDeadRailGroup:AddButton({
    Text = "死铁轨nat中心 [key]",
    Func = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/greatjakson-lgtm/-2/main/Nathub"))()
        Library:Notify("死铁轨nat中心 已加载", 3)
    end
})

ScriptDeadRailGroup:AddButton({
    Text = "moon死铁轨",
    Func = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/greatjakson-lgtm/-2/main/moondirty"))()
        Library:Notify("moon死铁轨 已加载", 3)
    end
})

ScriptDeadRailGroup:AddButton({
    Text = "死铁轨null fire",
    Func = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/greatjakson-lgtm/-2/main/Nullfire_deadrail"))()
        Library:Notify("死铁轨null fire 已加载", 3)
    end
})

ScriptDeadRailGroup:AddButton({
    Text = "死铁轨ringta",
    Func = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/greatjakson-lgtm/-2/main/ringta_deadrail"))()
        Library:Notify("死铁轨ringta 已加载", 3)
    end
})

-- 刀刃球
ScriptBladeBallGroup:AddButton({
    Text = "刀刃球nodex",
    Func = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/greatjakson-lgtm/-2/main/nodex"))()
        Library:Notify("刀刃球nodex 已加载", 3)
    end
})

ScriptBladeBallGroup:AddButton({
    Text = "laws hub刀刃球",
    Func = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/greatjakson-lgtm/-2/main/law"))()
        Library:Notify("laws hub刀刃球 已加载", 3)
    end
})

-- 偷走脑红
ScriptStealBrainrotGroup:AddButton({
    Text = "偷走脑红辣椒中心",
    Func = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/greatjakson-lgtm/-2/main/chill%20stealredrot"))()
        Library:Notify("偷走脑红辣椒中心 已加载", 3)
    end
})

ScriptStealBrainrotGroup:AddButton({
    Text = "偷走脑红dencycode [key]",
    Func = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/greatjakson-lgtm/-2/main/pex%20steal%20brainrot"))()
        Library:Notify("偷走脑红dencycode 已加载", 3)
    end
})

-- 种植花园
ScriptGardenGroup:AddButton({
    Text = "种植花园红叶子 [key]",
    Func = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/greatjakson-lgtm/-2/main/native.lua"))()
        Library:Notify("种植花园红叶子 已加载", 3)
    end
})

-- Chain
ScriptChainGroup:AddButton({
    Text = "chain",
    Func = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/133ufudhdu/pokl/refs/heads/main/XHTMLEWJ"))()
        Library:Notify("chain 已加载", 3)
    end
})

ScriptChainGroup:AddButton({
    Text = "AnimeWare chain [key]",
    Func = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/greatjakson-lgtm/-2/main/amin%20ware"))()
        Library:Notify("AnimeWare chain 已加载", 3)
    end
})

-- 最强战场
ScriptBattleGroup:AddButton({
    Text = "最强战场五条悟",
    Func = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Kamyk-player/FinalSuperSenior/refs/heads/main/SaitamaToSuperSeniorGojo"))()
        Library:Notify("最强战场五条悟 已加载", 3)
    end
})

ScriptBattleGroup:AddButton({
    Text = "无限侧闪",
    Func = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/greatjakson-lgtm/-2/main/无限侧闪"))()
        Library:Notify("无限侧闪 已加载", 3)
    end
})

ScriptBattleGroup:AddButton({
    Text = "smm [key]",
    Func = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/greatjakson-lgtm/-2/main/smm"))()
        Library:Notify("smm最强战场 已加载", 3)
    end
})

-- Evade
ScriptEvadeGroup:AddButton({
    Text = "rise evade",
    Func = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/greatjakson-lgtm/-2/main/irse%20evade"))()
        Library:Notify("rise evade 已加载", 3)
    end
})

ScriptEvadeGroup:AddButton({
    Text = "HOKALAZA evade [key]",
    Func = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/greatjakson-lgtm/-2/8a6bb0deb21ae89bed7c349f5e28a3654eac86ec/hz.lua"))()
        Library:Notify("HOKALAZA evade 已加载", 3)
    end
})

-- Nico Next Robot
ScriptNicoGroup:AddButton({
    Text = "nico next robot",
    Func = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/greatjakson-lgtm/-2/main/wu_nico"))()
        Library:Notify("nico next robot 已加载", 3)
    end
})

-- 在披萨店工作
ScriptPizzaGroup:AddButton({
    Text = "在披萨店工作脚本",
    Func = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/greatjakson-lgtm/-2/main/hmm"))()
        Library:Notify("在披萨店工作脚本 已加载", 3)
    end
})

-- AUT
ScriptAUTGroup:AddButton({
    Text = "ns aut [key]",
    Func = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/greatjakson-lgtm/-2/main/NS_AUT"))()
        Library:Notify("aut脚本 已加载", 3)
    end
})

-- 偷走脑红功能
local StealLeftGroup = Tabs.StealBrainrot:AddLeftGroupbox("主要功能")
local StealRightGroup = Tabs.StealBrainrot:AddRightGroupbox("移动功能")
local StealBottomGroup = Tabs.StealBrainrot:AddLeftGroupbox("其他功能")

-- 防检测功能
StealLeftGroup:AddToggle("AntiDetection", {
    Text = "过检测",
    Default = false,
    Callback = function(Value)
        Library:Notify(Value and "防检测已启用" or "防检测已禁用", 3)
    end
})

-- 漂浮功能
local floatBodyVelocity
StealRightGroup:AddToggle("Float", {
    Text = "漂浮",
    Default = false,
    Callback = function(Value)
        if floatBodyVelocity then
            floatBodyVelocity:Destroy()
            floatBodyVelocity = nil
        end
        
        if Value and LP.Character then
            local humanoidRootPart = LP.Character:FindFirstChild("HumanoidRootPart")
            if humanoidRootPart then
                floatBodyVelocity = Instance.new("BodyVelocity")
                floatBodyVelocity.Name = "FloatBodyVelocity"
                floatBodyVelocity.Velocity = Vector3.new(0, 25, 0)
                floatBodyVelocity.MaxForce = Vector3.new(0, math.huge, 0)
                floatBodyVelocity.Parent = humanoidRootPart
            end
        end
        Library:Notify(Value and "漂浮已启用" or "漂浮已禁用", 2)
    end
})

-- 速度加速
local speedHackConnection
StealRightGroup:AddToggle("SpeedHack", {
    Text = "速度加速",
    Default = false,
    Callback = function(Value)
        local character = LP.Character
        if character then
            local humanoid = character:FindFirstChildOfClass("Humanoid")
            if humanoid then
                if Value then
                    humanoid.WalkSpeed = humanoid.WalkSpeed * 3
                    speedHackConnection = RunService.Heartbeat:Connect(function()
                        if not Toggles.SpeedHack.Value and humanoid then
                            humanoid.WalkSpeed = 16
                            speedHackConnection:Disconnect()
                        end
                    end)
                else
                    humanoid.WalkSpeed = 16
                end
            end
        end
        Library:Notify(Value and "速度加速已启用" or "速度加速已禁用", 2)
    end
})

-- 飞行功能
local flyBodyGyro, flyBodyVelocity
StealRightGroup:AddToggle("Fly", {
    Text = "飞行",
    Default = false,
    Callback = function(Value)
        local character = LP.Character
        
        if flyBodyGyro then flyBodyGyro:Destroy() end
        if flyBodyVelocity then flyBodyVelocity:Destroy() end
        
        if Value and character then
            local humanoidRootPart = character:FindFirstChild("HumanoidRootPart")
            if humanoidRootPart then
                flyBodyGyro = Instance.new("BodyGyro")
                flyBodyGyro.Name = "FlyBodyGyro"
                flyBodyGyro.P = 1000
                flyBodyGyro.D = 50
                flyBodyGyro.MaxTorque = Vector3.new(math.huge, math.huge, math.huge)
                flyBodyGyro.CFrame = humanoidRootPart.CFrame
                flyBodyGyro.Parent = humanoidRootPart
                
                flyBodyVelocity = Instance.new("BodyVelocity")
                flyBodyVelocity.Name = "FlyBodyVelocity"
                flyBodyVelocity.Velocity = Vector3.new(0, 0, 0)
                flyBodyVelocity.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
                flyBodyVelocity.Parent = humanoidRootPart
                
                -- 飞行控制
                local flyConnection
                flyConnection = RunService.Heartbeat:Connect(function()
                    if not Toggles.Fly.Value or not character or not humanoidRootPart then
                        flyConnection:Disconnect()
                        return
                    end
                    
                    local camera = workspace.CurrentCamera
                    local moveDirection = Vector3.new(0, 0, 0)
                    
                    if UserInputService:IsKeyDown(Enum.KeyCode.W) then
                        moveDirection = moveDirection + camera.CFrame.LookVector
                    end
                    if UserInputService:IsKeyDown(Enum.KeyCode.S) then
                        moveDirection = moveDirection - camera.CFrame.LookVector
                    end
                    if UserInputService:IsKeyDown(Enum.KeyCode.A) then
                        moveDirection = moveDirection - camera.CFrame.RightVector
                    end
                    if UserInputService:IsKeyDown(Enum.KeyCode.D) then
                        moveDirection = moveDirection + camera.CFrame.RightVector
                    end
                    if UserInputService:IsKeyDown(Enum.KeyCode.Space) then
                        moveDirection = moveDirection + Vector3.new(0, 1, 0)
                    end
                    if UserInputService:IsKeyDown(Enum.KeyCode.LeftShift) then
                        moveDirection = moveDirection - Vector3.new(0, 1, 0)
                    end
                    
                    if moveDirection.Magnitude > 0 then
                        moveDirection = moveDirection.Unit * 50
                    end
                    
                    if flyBodyVelocity then
                        flyBodyVelocity.Velocity = moveDirection
                    end
                    if flyBodyGyro then
                        flyBodyGyro.CFrame = camera.CFrame
                    end
                end)
            end
        end
        Library:Notify(Value and "飞行已启用" or "飞行已禁用", 2)
    end
})

-- ESP功能
local espObjects = {}
StealBottomGroup:AddToggle("ESP", {
    Text = "ESP",
    Default = false,
    Callback = function(Value)
        -- 清理现有ESP
        for _, obj in pairs(espObjects) do
            if obj and obj.Parent then
                obj:Destroy()
            end
        end
        espObjects = {}
        
        if not Value then return end
        
        -- 创建ESP
        for _, otherPlayer in ipairs(Players:GetPlayers()) do
            if otherPlayer ~= LP then
                local otherCharacter = otherPlayer.Character
                if otherCharacter then
                    local humanoidRootPart = otherCharacter:FindFirstChild("HumanoidRootPart")
                    if humanoidRootPart then
                        -- 创建高亮框
                        local highlight = Instance.new("Highlight")
                        highlight.Name = "StealBrainrot_ESP_" .. otherPlayer.Name
                        highlight.Adornee = otherCharacter
                        highlight.FillColor = Color3.fromRGB(255, 0, 0)
                        highlight.FillTransparency = 0.5
                        highlight.OutlineColor = Color3.fromRGB(255, 255, 255)
                        highlight.OutlineTransparency = 0
                        highlight.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
                        highlight.Parent = otherCharacter
                        
                        -- 创建名字标签
                        local billboard = Instance.new("BillboardGui")
                        billboard.Name = "StealBrainrot_NameTag_" .. otherPlayer.Name
                        billboard.Adornee = humanoidRootPart
                        billboard.Size = UDim2.new(0, 200, 0, 50)
                        billboard.StudsOffset = Vector3.new(0, 3, 0)
                        billboard.AlwaysOnTop = true
                        billboard.Parent = humanoidRootPart
                        
                        local textLabel = Instance.new("TextLabel")
                        textLabel.Size = UDim2.new(1, 0, 1, 0)
                        textLabel.BackgroundTransparency = 1
                        textLabel.Text = otherPlayer.Name
                        textLabel.TextColor3 = Color3.new(1, 1, 1)
                        textLabel.TextStrokeColor3 = Color3.new(0, 0, 0)
                        textLabel.TextStrokeTransparency = 0
                        textLabel.Font = Enum.Font.SourceSansBold
                        textLabel.TextSize = 14
                        textLabel.Parent = billboard
                        
                        table.insert(espObjects, highlight)
                        table.insert(espObjects, billboard)
                    end
                end
            end
        end
        Library:Notify(Value and "ESP已启用" or "ESP已禁用", 2)
    end
})

-- 自动偷取功能
local autoStealConnection
StealBottomGroup:AddToggle("AutoSteal", {
    Text = "自动偷取",
    Default = false,
    Callback = function(Value)
        if autoStealConnection then
            autoStealConnection:Disconnect()
            autoStealConnection = nil
        end
        
        if Value then
            autoStealConnection = RunService.Heartbeat:Connect(function()
                if not Toggles.AutoSteal.Value then return end
                
                for _, obj in pairs(workspace:GetDescendants()) do
                    if obj:IsA("ProximityPrompt") and (obj.Name == "Steal" or obj.Name == "Take" or obj.Name:lower():find("steal") or obj.Name:lower():find("take")) then
                        if LP.Character and LP.Character:FindFirstChild("HumanoidRootPart") then
                            local promptPosition = obj.Parent and obj.Parent:FindFirstChildWhichIsA("BasePart")
                            if promptPosition then
                                local distance = (LP.Character.HumanoidRootPart.Position - promptPosition.Position).Magnitude
                                if distance <= 10 then
                                    fireproximityprompt(obj)
                                    break
                                end
                            end
                        end
                    end
                end
            end)
        end
        Library:Notify(Value and "自动偷取已启用" or "自动偷取已禁用", 2)
    end
})

-- 即时偷取
StealBottomGroup:AddButton({
    Text = "即时偷取",
    Func = function()
        local proximityPrompt = nil
        for _, obj in pairs(workspace:GetDescendants()) do
            if obj:IsA("ProximityPrompt") and (obj.Name == "Steal" or obj.Name == "Take" or obj.Name:lower():find("steal") or obj.Name:lower():find("take")) then
                proximityPrompt = obj
                break
            end
        end
        
        if proximityPrompt then
            fireproximityprompt(proximityPrompt)
            Library:Notify("成功触发偷取", 2)
        else
            Library:Notify("没有找到可偷取的物品", 2)
        end
    end
})

-- Make a Army 模块
local MakeArmyLeftGroup = Tabs.MakeArmy:AddLeftGroupbox("自动功能")
local MakeArmyRightGroup = Tabs.MakeArmy:AddRightGroupbox("军队单位")
local MakeArmyBottomGroup = Tabs.MakeArmy:AddLeftGroupbox("法术单位")

-- 自动刷金币功能
MakeArmyLeftGroup:AddToggle("AutoFarmGold", {
    Text = "自动刷金币",
    Default = false,
    Callback = function(Value)
        if Value then
            task.spawn(function()
                while Toggles.AutoFarmGold.Value do
                    pcall(function()
                        local DistanceWalked = ReplicatedStorage.Remotes.DistanceWalked
                        DistanceWalked:FireServer(150, 1e+104, 0)
                    end)
                    task.wait(0.1)
                end
            end)
        end
    end
})

-- 创建军队按钮的函数
local function createTroopButton(title, itemName)
    MakeArmyRightGroup:AddToggle("Troop_" .. itemName, {
        Text = title,
        Default = false,
        Callback = function(Value)
            if Value then
                task.spawn(function()
                    while Toggles["Troop_" .. itemName].Value do
                        pcall(function()
                            local PurchaseItem = ReplicatedStorage.Remotes.PurchaseItem
                            PurchaseItem:FireServer(itemName, "Troops")
                        end)
                        task.wait(0.1)
                    end
                end)
            end
        end
    })
end

-- 创建法术按钮的函数
local function createSpellButton(title, itemName)
    MakeArmyBottomGroup:AddToggle("Spell_" .. itemName, {
        Text = title,
        Default = false,
        Callback = function(Value)
            if Value then
                task.spawn(function()
                    while Toggles["Spell_" .. itemName].Value do
                        pcall(function()
                            local PurchaseItem = ReplicatedStorage.Remotes.PurchaseItem
                            PurchaseItem:FireServer(itemName, "Spells")
                        end)
                        task.wait(0.1)
                    end
                end)
            end
        end
    })
end

-- 创建军队按钮
createTroopButton("剑士", "Swordsman")
createTroopButton("弓箭手", "Archer")
createTroopButton("新手指挥官", "Rookie Commander")
createTroopButton("女巫", "Witch")
createTroopButton("弩手", "Crossbow")
createTroopButton("治疗师", "Healer")
createTroopButton("法师", "Wizard")
createTroopButton("长矛兵", "Spearman")
createTroopButton("气球兵", "Balloon")

-- 创建法术按钮
createSpellButton("冰冻法术", "Freeze")
createSpellButton("火球术", "Fireball")
createSpellButton("治疗法术", "Heal")
createSpellButton("狂暴法术", "Rage")
createSpellButton("毒药法术", "Poison")
createSpellButton("地震法术", "Earth")
createSpellButton("闪电法术", "Lightning")
createSpellButton("亚瑟之剑", "Arthurs Sword")

-- 成为乞丐模块
local BeggarLeftGroup = Tabs.Beggar:AddLeftGroupbox("自动功能")
local BeggarRightGroup = Tabs.Beggar:AddRightGroupbox("升级功能")

BeggarLeftGroup:AddToggle("AutoFastMoney", {
    Text = "自动快速刷钱",
    Default = false,
    Callback = function(Value)
        if Value then
            local plrs = game:GetService("Players")
            local rs = game:GetService("ReplicatedStorage")
            local me = plrs.LocalPlayer
            local char = me.Character or me.CharacterAdded:Wait()
            local hrp = char:WaitForChild("HumanoidRootPart")
            local bases = workspace:WaitForChild("Bases")
            local ev = rs.Remotes:WaitForChild("MinigameEvent")
            local run = game:GetService("RunService")

            local function findBase()
                for _,b in pairs(bases:GetChildren()) do
                    local o = b:FindFirstChild("Owner")
                    if o then
                        local v = o.Value
                        if v == me or tostring(v) == me.Name or tonumber(v) == me.UserId then
                            return b
                        end
                    end
                end
            end

            local b = findBase()
            if b then
                local beg = b:WaitForChild("BegPrompt")
                local prompt = beg:WaitForChild("ProximityPrompt")
                
                hrp.CFrame = beg.CFrame + Vector3.new(0,3,0)
                fireproximityprompt(prompt)
                
                while Toggles.AutoFastMoney.Value do
                    run.RenderStepped:Wait()
                    ev:FireServer(true)
                end
            end
        end
    end
})

BeggarLeftGroup:AddToggle("AutoBuyEmployees", {
    Text = "自动购买员工",
    Default = false,
    Callback = function(Value)
        if Value then
            local Replicate = game:GetService("ReplicatedStorage")
            local BuyEmployee = Replicate.Remotes.BuyEmployee
            task.spawn(function()
                while Toggles.AutoBuyEmployees.Value do 
                    for i = 1, 75 do 
                        if i ~= 13 and i ~= 14 then 
                            BuyEmployee:FireServer(i)
                            task.wait(0.3)
                        end 
                    end 
                end 
            end)
        end
    end
})

BeggarRightGroup:AddToggle("AutoBuyUpgrades", {
    Text = "自动升级",
    Default = false,
    Callback = function(Value)
        if Value then
            local Replicate = game:GetService("ReplicatedStorage")
            local Upgrade = Replicate.Remotes.Upgrade
            task.spawn(function()
                while Toggles.AutoBuyUpgrades.Value do 
                    task.wait(0.1)
                    Upgrade:FireServer("Beg Power")
                    Upgrade:FireServer("Income")
                    Upgrade:FireServer("Box Tier")
                    Upgrade:FireServer("Alley Tier")
                end 
            end)
        end
    end
})

BeggarRightGroup:AddToggle("MoneyAura", {
    Text = "金钱光环",
    Default = false,
    Callback = function(Value)
        if Value then
            local Money = workspace:WaitForChild("Money")
            local HRP = LP.Character:WaitForChild("HumanoidRootPart")
            task.spawn(function()
                while Toggles.MoneyAura.Value do
                    local OldCFrame = HRP.CFrame
                    for _,v in pairs(Money:GetDescendants()) do
                        if v:IsA("ProximityPrompt") and v.Parent:IsA("BasePart") then
                            HRP.CFrame = v.Parent.CFrame + Vector3.new(0,3,0)
                            fireproximityprompt(v,0,true)
                        end
                    end
                    HRP.CFrame = OldCFrame
                    task.wait(0.5)
                end 
            end)
        end
    end
})

-- 光剑模拟器模块
local SaberLeftGroup = Tabs.SaberSimulator:AddLeftGroupbox("自动功能")
local SaberRightGroup = Tabs.SaberSimulator:AddRightGroupbox("其他功能")

SaberLeftGroup:AddToggle("AutoEquipPets", {
    Text = "自动装备宠物",
    Default = false,
    Callback = function(Value)
        if Value then
            task.spawn(function()
                while Toggles.AutoEquipPets.Value do
                    ReplicatedStorage:WaitForChild("Events"):WaitForChild("UIAction"):FireServer("EquipBestPets")
                    task.wait(5)
                end
            end)
        end
    end
})

SaberLeftGroup:AddToggle("AutoCombinePets", {
    Text = "自动合成宠物",
    Default = false,
    Callback = function(Value)
        if Value then
            task.spawn(function()
                while Toggles.AutoCombinePets.Value do
                    ReplicatedStorage:WaitForChild("Events"):WaitForChild("UIAction"):FireServer("CombineAllPets")
                    task.wait(5)
                end
            end)
        end
    end
})

SaberRightGroup:AddToggle("AutoCollectCrowns", {
    Text = "自动收集皇冠",
    Default = false,
    Callback = function(Value)
        if Value then
            task.spawn(function()
                while Toggles.AutoCollectCrowns.Value do
                    local collectables = Workspace:FindFirstChild("Gameplay"):FindFirstChild("Collectables")
                    if collectables and #collectables:GetChildren() > 0 then
                        local crowns = {}
                        for _, v in next, collectables:GetChildren() do
                            if v:IsA("MeshPart") then
                                table.insert(crowns, v)
                            end
                        end
                        if #crowns > 0 then
                            ReplicatedStorage:WaitForChild("Events"):WaitForChild("CollectCurrencyPickup"):FireServer(crowns)
                        end
                    end
                    task.wait(0.2)
                end
            end)
        end
    end
})

-- 其他功能
local MiscLeftGroup = Tabs.Misc:AddLeftGroupbox("实用功能")
local MiscRightGroup = Tabs.Misc:AddRightGroupbox("设置")

MiscLeftGroup:AddButton({
    Text = "复制作者QQ",
    Func = function()
        setclipboard("3848974452")
        Library:Notify("QQ号已复制到剪贴板", 3)
    end
})

MiscLeftGroup:AddButton({
    Text = "检查更新",
    Func = function()
        Library:Notify("当前版本: v2.0\n已是最新版本", 5)
    end
})

MiscLeftGroup:AddButton({
    Text = "重新加载脚本",
    Func = function()
        Library:Notify("正在重新加载脚本...", 3)
        task.wait(2)
        -- 重新加载逻辑
    end
})

MiscLeftGroup:AddLabel("感谢游玩"):AddDivider()
MiscLeftGroup:AddLabel("QQ号: 3848974452\n感谢使用Old Winter")

-- 设置
MiscRightGroup:AddToggle("AutoSave", {
    Text = "自动保存设置",
    Default = true,
    Callback = function(Value)
        Library:Notify(Value and "自动保存已启用" or "自动保存已禁用", 2)
    end
})

MiscRightGroup:AddToggle("ShowNotifications", {
    Text = "显示加载提示",
    Default = true,
    Callback = function(Value)
        Library:Notify(Value and "将显示加载提示" or "已隐藏加载提示", 2)
    end
})

-- UI Settings
local MenuGroup = Tabs["UI Settings"]:AddLeftGroupbox("Menu", "wrench")

MenuGroup:AddToggle("ShowCustomCursor", {
    Text = "Custom Cursor",
    Default = true,
    Callback = function(Value)
        Library.ShowCustomCursor = Value
    end,
})

MenuGroup:AddDivider()
MenuGroup:AddLabel("Menu bind")
    :AddKeyPicker("MenuKeybind", { Default = "RightShift", NoUI = true, Text = "Menu keybind" })

MenuGroup:AddButton("Unload", function()
    Library:Unload()
end)

Library.ToggleKeybind = Options.MenuKeybind

-- 配置管理器
ThemeManager:SetLibrary(Library)
SaveManager:SetLibrary(Library)
SaveManager:IgnoreThemeSettings()
SaveManager:SetIgnoreIndexes({ "MenuKeybind" })

ThemeManager:SetFolder("EALPHA_X")
SaveManager:SetFolder("EALPHA_X/configs")

-- 应用主题和设置
SaveManager:BuildConfigSection(Tabs["UI Settings"])
ThemeManager:ApplyToTab(Tabs["UI Settings"])
SaveManager:LoadAutoloadConfig()

Library:Notify("Old Winter 加载完成!", 5)
        Library:Destroy()
    end
})
