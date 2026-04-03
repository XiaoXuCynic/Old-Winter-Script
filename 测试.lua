local WindUI = loadstring(game:HttpGet("https://raw.githubusercontent.com/Footagesus/WindUI/main/dist/main.lua"))()
WindUI.TransparencyValue = 0.2
WindUI:SetTheme("Dark")

local Confirmed = false
local username = game:GetService("Players").LocalPlayer.Name
local coloredUsername = ""
local gradientColors = {
    "#4169E1", 
    "#6A5ACD",  
    "#9370DB",  
    "#8A2BE2", 
    "#4B0082"   
}
local goldColor = "#FFD700"
for i = 1, #username do
    local char = username:sub(i, i)
    if char:match("[A-Za-z0-9]") then
        local colorIndex = (i - 1) % #gradientColors + 1
        coloredUsername = coloredUsername .. '<font color="' .. gradientColors[colorIndex] .. '">' .. char .. '</font>'
    else
        coloredUsername = coloredUsername .. '<font color="' .. goldColor .. '">' .. char .. '</font>'
    end
end

WindUI:Popup({
    Title = '旧冬v6.0',
    IconThemed = true,
    Icon = "crown",
    Content = "欢迎尊重的用户 " .. coloredUsername .. " \n使用旧冬\n你的支持是我们更新的动力\nQQ主群1081649265",
    Buttons = {
        {
            Title = "取消",
            Callback = function() end,
            Variant = "Secondary",
        },
        {
            Title = "执行",
            Icon = "arrow-right",
            Callback = function() 
                Confirmed = true
                createUI()
            end,
            Variant = "Primary",
        }
    }
})

function createUI()
    -- 创建主窗口
    local Window = WindUI:CreateWindow({
        Title = '旧冬v6.0 | TBW.TEAM',
        Icon = "crown",
        IconThemed = true,
        Author = "by小徐",
        Folder = "旧冬",
        Size = UDim2.fromOffset(700, 550),
        Transparent = true,
        Theme = "Dark",
        HideSearchBar = false,
        ScrollBarEnabled = true,
        Resizable = true,
        Background = "https://raw.githubusercontent.com/XiaoXuCynic/UI-Picture/refs/heads/main/1219211309.jpg",
        BackgroundImageTransparency = 0.5,
        User = {
            Enabled = true,
            Callback = function()
                WindUI:Notify({
                    Title = "用户资料",
                    Content = "点击了用户资料!",
                    Duration = 1,
                    Icon = "user"
                })
            end,
            Anonymous = false
        },
        SideBarWidth = 220,
        Search = {
            Enabled = true,
            Placeholder = "搜索功能...",
            Callback = function(searchText)
                print("搜索内容:", searchText)
            end
        }
    })

    -- 编辑打开按钮
    Window:EditOpenButton({
        Title = "旧冬 | v6.0",
        Icon = "crown",
        CornerRadius = UDim.new(0,16),
        StrokeThickness = 4,
        Color = ColorSequence.new(Color3.fromHex("FF6B6B")),
        Draggable = true,
    })

    -- 添加标签
    Window:Tag({
        Title = "v6.0",
        Color = Color3.fromHex("#30ff6a")
    })
    Window:Tag({
        Title = "Kuraki",
        Color = Color3.fromHex("#315dff")
    })
    Window:Tag({
        Title = "旧冬",
        Color = Color3.fromHex("#315dff")
    })

    local TimeTag = Window:Tag({
        Title = "--:--",
        Radius = 0,
        Color = WindUI:Gradient({
            ["0"]   = { Color = Color3.fromHex("#FF0F7B"), Transparency = 0 },
            ["100"] = { Color = Color3.fromHex("#F89B29"), Transparency = 0 },
        }, {
            Rotation = 45,
        }),
    })

    -- 时间更新
    task.spawn(function()
        while TimeTag and TimeTag.SetTitle do
            local now = os.date("*t")
            local hours = string.format("%02d", now.hour)
            local minutes = string.format("%02d", now.min)
            
            if TimeTag and TimeTag.SetTitle then
                TimeTag:SetTitle(hours .. ":" .. minutes)
            end
            
            task.wait(30)
        end
    end)

    -- 主题切换按钮
    Window:CreateTopbarButton("主题切换", "moon", function()
        local currentTheme = WindUI:GetCurrentTheme()
        local newTheme = currentTheme == "Dark" and "Light" or "Dark"
        WindUI:SetTheme(newTheme)
        WindUI:Notify({
            Title = "主题已更改",
            Content = "当前主题: " .. newTheme,
            Duration = 2
        })
    end, 990)

    -- 创建所有Section
    local Tabs = {
        Main = Window:Section({ Title = "通用", Opened = true }),
        Settings = Window:Section({ Title = "主题调整器", Opened = true }),
        Utilities = Window:Section({ Title = "配置保存器", Opened = true }),
        FE = Window:Section({ Title = "FE脚本", Opened = true }),
        Script = Window:Section({ Title = "脚本工具", Opened = true }),
        ESP = Window:Section({ Title = "esp功能", Opened = true }),
        Server = Window:Section({ Title = "服务器", Opened = true }),
        Other = Window:Section({ Title = "其他作者的脚本", Opened = true }),
        Transport = Window:Section({ Title = "传送功能", Opened = true }),
        Aimbot = Window:Section({ Title = "通用自瞄", Opened = true }),
    }

    -- 创建所有Tab
    local TabHandles = {
        Elements = Tabs.Main:Tab({ Title = "功能", Icon = "layout-grid" }),
        Appearance = Tabs.Settings:Tab({ Title = "修改背景", Icon = "brush" }),
        Config = Tabs.Utilities:Tab({ Title = "配置", Icon = "settings" }),
        LiJian = Tabs.FE:Tab({ Title = "FE脚本", Icon = "play" }),
        XiaoXu = Tabs.Script:Tab({ Title = "制作脚本的工具", Icon = "crown" }),
        Pharaoh = Tabs.ESP:Tab({ Title = "ESP/透视", Icon = "play" }),
        LTY = Tabs.Server:Tab({ Title = "服务器脚本", Icon = "zap" }),
        ZSH = Tabs.Other:Tab({ Title = "其他作者的脚本", Icon = "info" }),
        TP = Tabs.Transport:Tab({ Title = "传送", Icon = "user" }),
        SelfAiming = Tabs.Aimbot:Tab({ Title = "自瞄", Icon = "move" })
    }

    -- 群组信息
    TabHandles.Elements:Paragraph({
        Title = "旧冬脚本主群1081649265",
        Desc = "获取更多脚本",
        Image = "component",
        ImageSize = 20,
        Color = Color3.fromHex("#30ff6a"),
    })

    TabHandles.Elements:Paragraph({
        Title = "旧冬脚本副群1033860101",
        Desc = "谢谢所有使用该脚本的用户",
        Image = "component",
        ImageSize = 20,
        Color = Color3.fromHex("#30ff6a"),
    })

    TabHandles.Elements:Paragraph({
        Title = "旧冬脚本三群1083907347",
        Desc = "有问题请反馈至群聊",
        Image = "component",
        ImageSize = 20,
        Color = Color3.fromHex("#30ff6a"),
    })

    TabHandles.Elements:Divider()

    -- 速度滑块
    local SpeedSlider = TabHandles.Elements:Slider({
        Title = "速度",
        Desc = "调整效果强度",
        Min = 0,
        Max = 100,
        Default = 50,
        Callback = function(value)
            local player = game.Players.LocalPlayer
            if player and player.Character then
                local humanoid = player.Character:FindFirstChildOfClass("Humanoid")
                if humanoid then
                    humanoid.WalkSpeed = value
                end
            end
        end
    })

    -- 跳高滑块
    local JumpSlider = TabHandles.Elements:Slider({
        Title = "跳高",
        Desc = "调整跳跃高度",
        Min = 50,
        Max = 200,
        Default = 50,
        Callback = function(value)
            local player = game.Players.LocalPlayer
            if player and player.Character then
                local humanoid = player.Character:FindFirstChildOfClass("Humanoid")
                if humanoid then
                    humanoid.JumpPower = value
                end
            end
        end
    })

    -- 杀戮光环
    local killAuraToggle = TabHandles.Elements:Toggle({
        Title = "启用杀戮光环",
        Desc = "杀戮光环",
        Default = false,
        Callback = function(v)
            if v then
                local Players = game:GetService("Players")
                local RunService = game:GetService("RunService")
                local localPlayer = Players.LocalPlayer
                
                _G.killAuraConfig = {
                    isRunning = true,
                    connection = nil
                }
                
                _G.killAuraConfig.connection = RunService.Heartbeat:Connect(function()
                    if not _G.killAuraConfig or not _G.killAuraConfig.isRunning then
                        return
                    end
                    
                    local localCharacter = localPlayer.Character
                    if not localCharacter then return end
                    
                    local humanoidRootPart = localCharacter:FindFirstChild("HumanoidRootPart")
                    local humanoid = localCharacter:FindFirstChildOfClass("Humanoid")
                    
                    if not humanoidRootPart or not humanoid or humanoid.Health <= 0 then return end
                    
                    local tool = localCharacter:FindFirstChildOfClass("Tool")
                    if not tool then return end
                    
                    for _, player in pairs(Players:GetPlayers()) do
                        if player ~= localPlayer then
                            local targetChar = player.Character
                            if targetChar then
                                local targetRoot = targetChar:FindFirstChild("HumanoidRootPart")
                                local targetHumanoid = targetChar:FindFirstChildOfClass("Humanoid")
                                
                                if targetRoot and targetHumanoid and targetHumanoid.Health > 0 then
                                    local distance = (humanoidRootPart.Position - targetRoot.Position).Magnitude
                                    if distance < 20 then
                                        if tool:IsA("Tool") then
                                            tool:Activate()
                                            task.wait(0.1)
                                        end
                                    end
                                end
                            end
                        end
                    end
                end)
                
                WindUI:Notify({
                    Title = "功能设置",
                    Content = "杀戮光环已启用",
                    Icon = "check",
                    Duration = 2
                })
            else
                if _G.killAuraConfig then
                    _G.killAuraConfig.isRunning = false
                    if _G.killAuraConfig.connection then
                        _G.killAuraConfig.connection:Disconnect()
                    end
                    _G.killAuraConfig = nil
                end
                
                WindUI:Notify({
                    Title = "功能设置",
                    Content = "杀戮光环已禁用",
                    Icon = "x",
                    Duration = 2
                })
            end
        end
    })

    -- 防甩飞
    local FlyOffToggle = TabHandles.Elements:Toggle({
        Title = "防甩飞",
        Desc = "别人想甩飞你是不可能的",
        Default = false,
        Callback = function(v)
            if v then
                local Services = setmetatable({}, {__index = function(Self, Index)
                    local NewService = game:GetService(Index)
                    if NewService then
                        Self[Index] = NewService
                    end
                    return NewService
                end})

                local LocalPlayer = Services.Players.LocalPlayer
                _G.flyOffEnabled = true
                _G.flyOffConnections = _G.flyOffConnections or {}

                local function PlayerAdded(Player)
                    if Player == LocalPlayer then return end
                    
                    local Detected = false
                    local Character
                    local PrimaryPart

                    local function CharacterAdded(NewCharacter)
                        Character = NewCharacter
                        repeat
                            task.wait()
                            PrimaryPart = NewCharacter:FindFirstChild("HumanoidRootPart")
                        until PrimaryPart
                        Detected = false
                    end

                    CharacterAdded(Player.Character or Player.CharacterAdded:Wait())
                    
                    local conn = Player.CharacterAdded:Connect(CharacterAdded)
                    table.insert(_G.flyOffConnections, conn)
                    
                    local heartbeatConn = Services.RunService.Heartbeat:Connect(function()
                        if not _G.flyOffEnabled then
                            return
                        end
                        
                        if Character and Character:IsDescendantOf(workspace) and PrimaryPart and PrimaryPart:IsDescendantOf(Character) then
                            if PrimaryPart.AssemblyAngularVelocity.Magnitude > 50 or PrimaryPart.AssemblyLinearVelocity.Magnitude > 100 then
                                if Detected == false then
                                    game:GetService("StarterGui"):SetCore("ChatMakeSystemMessage", {
                                        Text = "Fling Exploit Detected Player : "..tostring(Player),
                                        Color = Color3.fromRGB(255, 200, 0)
                                    })
                                end
                                Detected = true
                                for i,v in ipairs(Character:GetDescendants()) do
                                    if v:IsA("BasePart") then
                                        v.CanCollide = false
                                        v.AssemblyAngularVelocity = Vector3.new(0, 0, 0)
                                        v.AssemblyLinearVelocity = Vector3.new(0, 0, 0)
                                        v.CustomPhysicalProperties = PhysicalProperties.new(0, 0, 0)
                                    end
                                end
                                PrimaryPart.CanCollide = false
                                PrimaryPart.AssemblyAngularVelocity = Vector3.new(0, 0, 0)
                                PrimaryPart.AssemblyLinearVelocity = Vector3.new(0, 0, 0)
                                PrimaryPart.CustomPhysicalProperties = PhysicalProperties.new(0, 0, 0)
                            end
                        end
                    end)
                    table.insert(_G.flyOffConnections, heartbeatConn)
                end

                for i,v in ipairs(Services.Players:GetPlayers()) do
                    if v ~= LocalPlayer then
                        PlayerAdded(v)
                    end
                end
                
                local playerAddedConn = Services.Players.PlayerAdded:Connect(PlayerAdded)
                table.insert(_G.flyOffConnections, playerAddedConn)

                WindUI:Notify({
                    Title = "通知",
                    Content = "防甩飞功能已启用",
                    Duration = 3,
                    Icon = "layout-grid",
                })
            else
                _G.flyOffEnabled = false
                if _G.flyOffConnections then
                    for _, conn in ipairs(_G.flyOffConnections) do
                        if conn then
                            conn:Disconnect()
                        end
                    end
                    _G.flyOffConnections = {}
                end
                
                WindUI:Notify({
                    Title = "通知",
                    Content = "防甩飞功能已禁用",
                    Duration = 3,
                    Icon = "layout-grid",
                })
            end
        end
    })

    -- 飞行按钮
    local flyButton = TabHandles.Elements:Button({
        Title = "飞行",
        Icon = "bell",
        Callback = function()
            local success, result = pcall(function()
                loadstring(game:HttpGet('https://raw.githubusercontent.com/QiuShan-UX/UnicoX/main/%E9%A3%9E%E8%A1%8C%E7%A4%BA%E4%BE%8B.lua', true))()
            end)
            
            if success then
                WindUI:Notify({
                    Title = "飞行已启用",
                    Content = "飞行功能已加载",
                    Icon = "check",
                    Duration = 3
                })
            else
                WindUI:Notify({
                    Title = "飞行加载失败",
                    Content = "请检查网络连接",
                    Icon = "x",
                    Duration = 3
                })
            end
        end
    })

    -- 穿墙
    local noclipToggle = TabHandles.Elements:Toggle({
        Title = "启用穿墙",
        Desc = "穿墙",
        Default = false,
        Callback = function(v)
            if v then
                _G.Noclip = true
                if _G.NoclipConnection then
                    _G.NoclipConnection:Disconnect()
                    _G.NoclipConnection = nil
                end
                _G.NoclipConnection = game:GetService("RunService").Stepped:Connect(function()
                    if _G.Noclip then
                        local character = game.Players.LocalPlayer.Character
                        if character then
                            for _, part in pairs(character:GetChildren()) do
                                if part:IsA("BasePart") then
                                    part.CanCollide = false
                                end
                            end
                        end
                    end
                end)
            else
                _G.Noclip = false
                if _G.NoclipConnection then
                    _G.NoclipConnection:Disconnect()
                    _G.NoclipConnection = nil
                end
            end
        end
    })

    -- 夜视
    local nightVisionToggle = TabHandles.Elements:Toggle({
        Title = "启用夜视",
        Desc = "夜视",
        Default = false,
        Callback = function(v)
            local Lighting = game:GetService("Lighting")
            if v then
                _G.originalAmbient = Lighting.Ambient
                _G.originalOutdoorAmbient = Lighting.OutdoorAmbient
                Lighting.Ambient = Color3.new(1, 1, 1)
                Lighting.OutdoorAmbient = Color3.new(1, 1, 1)
            else
                if _G.originalAmbient then
                    Lighting.Ambient = _G.originalAmbient
                    _G.originalAmbient = nil
                else
                    Lighting.Ambient = Color3.new(0, 0, 0)
                end
                
                if _G.originalOutdoorAmbient then
                    Lighting.OutdoorAmbient = _G.originalOutdoorAmbient
                    _G.originalOutdoorAmbient = nil
                else
                    Lighting.OutdoorAmbient = Color3.new(0, 0, 0)
                end
            end
        end
    })

    -- 无限跳
    local infiniteJumpToggle = TabHandles.Elements:Toggle({
        Title = "启用无限跳",
        Desc = "无限跳",
        Default = false,
        Callback = function(v)
            _G.InfiniteJumpEnabled = v
            
            if _G.InfiniteJumpConnection then
                _G.InfiniteJumpConnection:Disconnect()
                _G.InfiniteJumpConnection = nil
            end
            
            if v then
                _G.InfiniteJumpConnection = game:GetService("UserInputService").JumpRequest:Connect(function()
                    if _G.InfiniteJumpEnabled then
                        local player = game.Players.LocalPlayer
                        local character = player.Character
                        if character then
                            local humanoid = character:FindFirstChildOfClass("Humanoid")
                            if humanoid then
                                humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
                            end
                        end
                    end
                end)
            end
        end
    })

    -- 无敌
    local godModeToggle = TabHandles.Elements:Toggle({
        Title = "启用无敌",
        Desc = "小概率bug",
        Default = false,
        Callback = function(v)
            if v then
                local character = game.Players.LocalPlayer.Character
                if character then
                    local humanoid = character:FindFirstChildOfClass("Humanoid")
                    if humanoid then
                        _G.originalMaxHealth = humanoid.MaxHealth
                        _G.originalHealth = humanoid.Health
                        humanoid.MaxHealth = 9e9
                        humanoid.Health = 9e9
                    end
                end
            else
                if _G.originalMaxHealth then
                    local character = game.Players.LocalPlayer.Character
                    if character then
                        local humanoid = character:FindFirstChildOfClass("Humanoid")
                        if humanoid then
                            humanoid.MaxHealth = _G.originalMaxHealth
                            humanoid.Health = math.min(_G.originalHealth or 100, _G.originalMaxHealth)
                        end
                    end
                    _G.originalMaxHealth = nil
                    _G.originalHealth = nil
                end
            end
        end
    })

    -- 自杀按钮
    local KillButton = TabHandles.Elements:Button({
        Title = "自杀",
        Icon = "bell",
        Callback = function()
            local character = game.Players.LocalPlayer.Character
            if character then
                local humanoid = character:FindFirstChildOfClass("Humanoid")
                if humanoid then
                    humanoid.Health = 0
                end
            end
            WindUI:Notify({
                Title = "已自杀",
                Content = "角色已死亡",
                Icon = "bell",
                Duration = 3
            })
        end
    })

    -- FPS显示
    local fpsToggle = TabHandles.Elements:Toggle({
        Title = "显示FPS",
        Desc = "显示FPS",
        Default = false,
        Callback = function(v)
            if v then
                local playerGui = game.Players.LocalPlayer:WaitForChild("PlayerGui")
                
                local oldFpsGui = playerGui:FindFirstChild("FPSGui")
                if oldFpsGui then
                    oldFpsGui:Destroy()
                end
                
                local fpsGui = Instance.new("ScreenGui")
                fpsGui.Name = "FPSGui"
                fpsGui.ResetOnSpawn = false
                fpsGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
                fpsGui.DisplayOrder = 999
                fpsGui.Parent = playerGui
                
                local fpsLabel = Instance.new("TextLabel")
                fpsLabel.Name = "FPSLabel"
                fpsLabel.Size = UDim2.new(0, 100, 0, 30)
                fpsLabel.Position = UDim2.new(0.85, 0, 0.02, 0)
                fpsLabel.BackgroundTransparency = 0.7
                fpsLabel.BackgroundColor3 = Color3.new(0, 0, 0)
                fpsLabel.Font = Enum.Font.SourceSansBold
                fpsLabel.Text = "FPS: 0"
                fpsLabel.TextSize = 18
                fpsLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
                fpsLabel.TextStrokeTransparency = 0.5
                fpsLabel.TextStrokeColor3 = Color3.new(0, 0, 0)
                fpsLabel.Parent = fpsGui
                
                local lastTime = tick()
                local frameCount = 0
                
                _G.fpsConnection = game:GetService("RunService").RenderStepped:Connect(function()
                    frameCount = frameCount + 1
                    local currentTime = tick()
                    if currentTime - lastTime >= 1 then
                        local fps = frameCount
                        fpsLabel.Text = "FPS: " .. fps
                        frameCount = 0
                        lastTime = currentTime
                    end
                end)
                
                WindUI:Notify({
                    Title = "FPS显示",
                    Content = "FPS显示已启用",
                    Duration = 2
                })
            else
                if _G.fpsConnection then
                    _G.fpsConnection:Disconnect()
                    _G.fpsConnection = nil
                end
                
                local playerGui = game.Players.LocalPlayer:FindFirstChild("PlayerGui")
                if playerGui then
                    local fpsGui = playerGui:FindFirstChild("FPSGui")
                    if fpsGui then
                        fpsGui:Destroy()
                    end
                end
                
                WindUI:Notify({
                    Title = "FPS显示",
                    Content = "FPS显示已禁用",
                    Duration = 2
                })
            end
        end
    })

    -- 外观设置
    TabHandles.Appearance:Paragraph({
        Title = "自定义界面",
        Desc = "个性化你的体验",
        Image = "palette",
        ImageSize = 20,
        Color = Color3.fromHex("#FFFFFF")
    })

    -- ================================================
    -- 主题管理函数（修复版）
    -- ================================================
    
    -- 获取可用主题列表
    local function GetAvailableThemes()
        local themes = {}
        local availableThemes = {}
        
        pcall(function()
            availableThemes = WindUI.GetThemes and WindUI:GetThemes() or {Dark = true, Light = true}
        end)
        
        for themeName, _ in pairs(availableThemes) do
            table.insert(themes, themeName)
        end
        
        if #themes == 0 then
            themes = {"Dark", "Light"}
        end
        
        table.sort(themes)
        return themes
    end

    local function GetCurrentTheme()
        local success, theme = pcall(function()
            return WindUI.GetCurrentTheme and WindUI:GetCurrentTheme()
        end)
        return success and theme or "Dark"
    end

    -- 创建主题选择器
    local function CreateThemeSelector(parent)
        local themes = GetAvailableThemes()
        local currentTheme = GetCurrentTheme()
        local canChangeTheme = true
        local canChangeDropdown = true
        
        -- 创建主题下拉框
        local themeDropdown = parent:Dropdown({
            Title = "主题选择",
            Desc = "切换界面主题",
            Values = themes,
            Default = currentTheme,
            Callback = function(theme)
                canChangeDropdown = false
                WindUI:SetTheme(theme)
                WindUI:Notify({
                    Title = "主题已切换",
                    Content = "当前主题: " .. theme,
                    Icon = "palette",
                    Duration = 2
                })
                canChangeDropdown = true
            end
        })
        
        -- 创建深色模式开关
        local darkModeToggle = parent:Toggle({
            Title = "深色模式",
            Desc = "切换深色/浅色主题",
            Default = currentTheme == "Dark",
            Callback = function(isDark)
                if canChangeTheme then
                    local newTheme = isDark and "Dark" or "Light"
                    WindUI:SetTheme(newTheme)
                    if canChangeDropdown then
                        themeDropdown:Select(newTheme)
                    end
                end
            end
        })
        
        -- 监听主题变化
        pcall(function()
            if WindUI.OnThemeChange then
                WindUI:OnThemeChange(function(theme)
                    canChangeTheme = false
                    if darkModeToggle and darkModeToggle.Set then
                        darkModeToggle:Set(theme == "Dark")
                    end
                    if canChangeDropdown and themeDropdown and themeDropdown.Select then
                        themeDropdown:Select(theme)
                    end
                    canChangeTheme = true
                end)
            end
        end)
        
        return {
            dropdown = themeDropdown,
            toggle = darkModeToggle,
            themes = themes
        }
    end

    -- 创建透明度滑块
    local function CreateTransparencySlider(parent)
        return parent:Slider({
            Title = "界面透明度",
            Desc = "调整背景透明度",
            Min = 0,
            Max = 1,
            Default = WindUI.TransparencyValue or 0.2,
            Increment = 0.1,
            Callback = function(value)
                WindUI.TransparencyValue = tonumber(value)
            end
        })
    end

    -- 应用主题管理
    local themeSelector = CreateThemeSelector(TabHandles.Appearance)
    local transparencySlider = CreateTransparencySlider(TabHandles.Appearance)

    -- 配置管理
    TabHandles.Config:Paragraph({
        Title = "配置管理器",
        Desc = "保存和加载你的设置",
        Image = "save",
        ImageSize = 20,
        Color = Color3.fromHex("#FFFFFF")
    })

    local configName = "默认配置"
    local savedConfigs = {}

    TabHandles.Config:Input({
        Title = "配置名称",
        Desc = "输入配置文件的名称",
        Default = configName,
        Callback = function(value)
            configName = value or "默认配置"
        end
    })

    TabHandles.Config:Button({
        Title = "保存配置",
        Icon = "save",
        Variant = "Primary",
        Callback = function()
            local config = {
                name = configName,
                timestamp = os.date("%Y-%m-%d %H:%M:%S"),
                settings = {
                    killAura = killAuraToggle and (killAuraToggle.Get and killAuraToggle:Get() or false) or false,
                    noclip = noclipToggle and (noclipToggle.Get and noclipToggle:Get() or false) or false,
                    nightVision = nightVisionToggle and (nightVisionToggle.Get and nightVisionToggle:Get() or false) or false,
                    infiniteJump = infiniteJumpToggle and (infiniteJumpToggle.Get and infiniteJumpToggle:Get() or false) or false,
                    godMode = godModeToggle and (godModeToggle.Get and godModeToggle:Get() or false) or false,
                    fps = fpsToggle and (fpsToggle.Get and fpsToggle:Get() or false) or false,
                    theme = themeSelector.dropdown and (themeSelector.dropdown.Get and themeSelector.dropdown:Get() or "Dark") or "Dark",
                    speed = SpeedSlider and (SpeedSlider.Get and SpeedSlider:Get() or 16) or 16,
                    jump = JumpSlider and (JumpSlider.Get and JumpSlider:Get() or 50) or 50,
                    flyOff = FlyOffToggle and (FlyOffToggle.Get and FlyOffToggle:Get() or false) or false
                }
            }
            
            savedConfigs[configName] = config
            
            WindUI:Notify({ 
                Title = "保存成功", 
                Content = "配置已保存为: " .. configName,
                Icon = "check",
                Duration = 3
            })
        end
    })

    TabHandles.Config:Button({
        Title = "加载配置",
        Icon = "folder",
        Callback = function()
            local config = savedConfigs[configName]
            
            if config then
                if config.settings then
                    if killAuraToggle and killAuraToggle.Set then killAuraToggle:Set(config.settings.killAura or false) end
                    if noclipToggle and noclipToggle.Set then noclipToggle:Set(config.settings.noclip or false) end
                    if nightVisionToggle and nightVisionToggle.Set then nightVisionToggle:Set(config.settings.nightVision or false) end
                    if infiniteJumpToggle and infiniteJumpToggle.Set then infiniteJumpToggle:Set(config.settings.infiniteJump or false) end
                    if godModeToggle and godModeToggle.Set then godModeToggle:Set(config.settings.godMode or false) end
                    if fpsToggle and fpsToggle.Set then fpsToggle:Set(config.settings.fps or false) end
                    if FlyOffToggle and FlyOffToggle.Set then FlyOffToggle:Set(config.settings.flyOff or false) end
                    
                    if config.settings.speed and SpeedSlider and SpeedSlider.Set then
                        SpeedSlider:Set(config.settings.speed)
                    end
                    
                    if config.settings.jump and JumpSlider and JumpSlider.Set then
                        JumpSlider:Set(config.settings.jump)
                    end
                    
                    if config.settings.theme and themeSelector.dropdown and themeSelector.dropdown.Select then
                        themeSelector.dropdown:Select(config.settings.theme)
                    end
                end
                
                WindUI:Notify({ 
                    Title = "加载成功", 
                    Content = "已加载: " .. configName .. "\n保存时间: " .. (config.timestamp or "未知时间"),
                    Icon = "refresh-cw",
                    Duration = 5
                })
            else
                WindUI:Notify({ 
                    Title = "加载失败", 
                    Content = "配置不存在: " .. configName,
                    Icon = "x",
                    Duration = 3
                })
            end
        end
    })

    TabHandles.Config:Paragraph({
        Title = "旧冬主群",
        Desc = "QQ主群1081649265",
        Image = "users",
        ImageSize = 20,
        Color = Color3.fromHex("#888888"),
        Buttons = {
            {
                Title = "复制群号",
                Icon = "copy",
                Variant = "Tertiary",
                Callback = function()
                    if setclipboard then
                        setclipboard("1081649265")
                        WindUI:Notify({
                            Title = "复制成功",
                            Content = "群号已复制到剪贴板",
                            Duration = 2
                        })
                    else
                        WindUI:Notify({
                            Title = "复制失败",
                            Content = "不支持剪贴板功能",
                            Duration = 2
                        })
                    end
                end
            }
        }
    })

    TabHandles.Config:Paragraph({
        Title = "副群",
        Desc = "QQ副群1033860101",
        Image = "users",
        ImageSize = 20,
        Color = Color3.fromHex("#888888"),
        Buttons = {
            {
                Title = "复制群号",
                Icon = "copy",
                Variant = "Tertiary",
                Callback = function()
                    if setclipboard then
                        setclipboard("1033860101")
                        WindUI:Notify({
                            Title = "复制成功",
                            Content = "群号已复制到剪贴板",
                            Duration = 2
                        })
                    else
                        WindUI:Notify({
                            Title = "复制失败",
                            Content = "不支持剪贴板功能",
                            Duration = 2
                        })
                    end
                end
            }
        }
    })

    -- FE脚本
    local zhangsihaoTButton = TabHandles.LiJian:Button({
        Title = "FE翻墙",
        Icon = "play",
        Callback = function()
            local success, result = pcall(function()
                loadstring(game:HttpGet('https://raw.githubusercontent.com/ScpGuest666/Random-Roblox-script/refs/heads/main/Roblox%20WallHop%20V4%20script', true))()
            end)
            
            if success then
                WindUI:Notify({
                    Title = "已启用",
                    Content = "FE翻墙脚本",
                    Icon = "star",
                    Duration = 3
                })
            else
                WindUI:Notify({
                    Title = "加载失败",
                    Content = "请检查网络连接",
                    Icon = "x",
                    Duration = 3
                })
            end
        end
    })

    local xingxingButton = TabHandles.LiJian:Button({
        Title = "FE爬行",
        Icon = "crown",
        Callback = function()
            local success, result = pcall(function()
                loadstring(game:HttpGet('https://raw.githubusercontent.com/0Ben1/fe/main/obf_vZDX8j5ggfAf58QhdJ59BVEmF6nmZgq4Mcjt2l8wn16CiStIW2P6EkNc605qv9K4.lua.txt', true))()
            end)
            
            if success then
                WindUI:Notify({
                    Title = "已启用",
                    Content = "FE爬行脚本",
                    Icon = "star",
                    Duration = 3
                })
            else
                WindUI:Notify({
                    Title = "加载失败",
                    Content = "请检查网络连接",
                    Icon = "x",
                    Duration = 3
                })
            end
        end
    })

    local KillerButton = TabHandles.LiJian:Button({
        Title = "FE杀手",
        Icon = "play",
        Callback = function()
            local success, result = pcall(function()
                loadstring(game:HttpGet('https://pastefy.ga/d7sogwNS/raw', true))()
            end)
            
            if success then
                WindUI:Notify({
                    Title = "已启用",
                    Content = "FE杀手脚本",
                    Icon = "star",
                    Duration = 3
                })
            else
                WindUI:Notify({
                    Title = "加载失败",
                    Content = "请检查网络连接",
                    Icon = "x",
                    Duration = 3
                })
            end
        end
    })

    local yinshenToggle = TabHandles.LiJian:Toggle({
        Title = "FE R15隐身",
        Desc = "R15隐身功能",
        Default = false,
        Callback = function(v)
            if v then
                local removeNametags = false

                local plr = game:GetService("Players").LocalPlayer
                local character = plr.Character
                if not character then return end
                
                local hrp = character:FindFirstChild("HumanoidRootPart")
                if not hrp then return end
                
                local old = hrp.CFrame

                if not character:FindFirstChild("LowerTorso") or character.PrimaryPart ~= hrp then
                    WindUI:Notify({
                        Title = "FE隐身",
                        Content = "不支持非R15角色",
                        Duration = 3
                    })
                    return
                end

                if removeNametags then
                    local tag = hrp:FindFirstChildOfClass("BillboardGui")
                    if tag then tag:Destroy() end

                    hrp.ChildAdded:Connect(function(item)
                        if item:IsA("BillboardGui") then
                            task.wait()
                            item:Destroy()
                        end
                    end)
                end

                local newroot = character.LowerTorso.Root:Clone()
                hrp.Parent = workspace
                character.PrimaryPart = hrp
                character:MoveTo(Vector3.new(old.X, 9e9, old.Z))
                hrp.Parent = character
                task.wait(0.5)
                newroot.Parent = hrp
                hrp.CFrame = old
                
                WindUI:Notify({
                    Title = "FE隐身",
                    Content = "R15隐身已启用",
                    Duration = 3
                })
            else
                WindUI:Notify({
                    Title = "FE隐身",
                    Content = "R15隐身已禁用",
                    Duration = 3
                })
            end
        end
    })

    local lijianButton = TabHandles.LiJian:Button({
        Title = "FE踢",
        Icon = "play",
        Callback = function()
            local success, result = pcall(function()
                loadstring(game:HttpGet('https://raw.githubusercontent.com/ZhenX21/FE-Kick-Ban-Script/main/source', true))()
            end)
            
            if success then
                WindUI:Notify({
                    Title = "已启用",
                    Content = "FE踢脚本",
                    Icon = "star",
                    Duration = 3
                })
            else
                WindUI:Notify({
                    Title = "加载失败",
                    Content = "请检查网络连接",
                    Icon = "x",
                    Duration = 3
                })
            end
        end
    })

    local XiAOButton = TabHandles.LiJian:Button({
        Title = "FE闪回",
        Icon = "play",
        Callback = function()
            local success, result = pcall(function()
                loadstring(game:HttpGet('https://mscripts.vercel.app/scfiles/reverse-script.lua', true))()
            end)
            
            if success then
                WindUI:Notify({
                    Title = "已启用",
                    Content = "FE闪回脚本",
                    Icon = "star",
                    Duration = 3
                })
            else
                WindUI:Notify({
                    Title = "加载失败",
                    Content = "请检查网络连接",
                    Icon = "x",
                    Duration = 3
                })
            end
        end
    })

    local FEButton = TabHandles.LiJian:Button({
        Title = "FE被遗弃角色",
        Icon = "play",
        Callback = function()
            local success, result = pcall(function()
                loadstring(game:HttpGet('https://raw.githubusercontent.com/CyberNinja103/brodwa/refs/heads/main/ForsakationHub', true))()
            end)
            
            if success then
                WindUI:Notify({
                    Title = "已启用",
                    Content = "FE被遗弃角色脚本",
                    Icon = "star",
                    Duration = 3
                })
            else
                WindUI:Notify({
                    Title = "加载失败",
                    Content = "请检查网络连接",
                    Icon = "x",
                    Duration = 3
                })
            end
        end
    })

    -- 脚本工具
    local DexVButton = TabHandles.XiaoXu:Button({
        Title = "DexV3 无汉化",
        Icon = "play",
        Callback = function()
            local success, result = pcall(function()
                loadstring(game:HttpGet('https://raw.githubusercontent.com/Babyhamsta/RBLX_Scripts/main/Universal/BypassedDarkDexV3.lua', true))()
            end)
            
            if success then
                WindUI:Notify({
                    Title = "已启用",
                    Content = "Dex",
                    Icon = "star",
                    Duration = 3
                })
            else
                WindUI:Notify({
                    Title = "加载失败",
                    Content = "请检查网络连接",
                    Icon = "x",
                    Duration = 3
                })
            end
        end
    })

    local dexButton = TabHandles.XiaoXu:Button({
        Title = "汉化Dex",
        Icon = "play",
        Callback = function()
            local success, result = pcall(function()
                loadstring(game:HttpGet('https://raw.githubusercontent.com/Xingyan777/roblox/refs/heads/main/bex.lua', true))()
            end)
            
            if success then
                WindUI:Notify({
                    Title = "已启用",
                    Content = "汉化Dex",
                    Icon = "star",
                    Duration = 3
                })
            else
                WindUI:Notify({
                    Title = "加载失败",
                    Content = "请检查网络连接",
                    Icon = "x",
                    Duration = 3
                })
            end
        end
    })

    local CnButton = TabHandles.XiaoXu:Button({
        Title = "汉化spy",
        Icon = "star",
        Callback = function()
            local success, result = pcall(function()
                loadstring(game:HttpGet('https://raw.githubusercontent.com/Finaloutcome/plz/refs/heads/main/sp3hu.lua', true))()
            end)
            
            if success then
                WindUI:Notify({
                    Title = "已启用",
                    Content = "汉化spy",
                    Icon = "star",
                    Duration = 3
                })
            else
                WindUI:Notify({
                    Title = "加载失败",
                    Content = "请检查网络连接",
                    Icon = "x",
                    Duration = 3
                })
            end
        end
    })

    local BSspyButton = TabHandles.XiaoXu:Button({
        Title = "抓包https spy",
        Icon = "moon",
        Callback = function()
            local success, result = pcall(function()
                loadstring(game:HttpGet('https://raw.githubusercontent.com/BS58dL/BS/refs/heads/main/请多多支持BS脚本系列.Lua', true))()
            end)
            
            if success then
                WindUI:Notify({
                    Title = "已启用",
                    Content = "抓包https spy",
                    Icon = "star",
                    Duration = 3
                })
            else
                WindUI:Notify({
                    Title = "加载失败",
                    Content = "请检查网络连接",
                    Icon = "x",
                    Duration = 3
                })
            end
        end
    })

    local spyButton = TabHandles.XiaoXu:Button({
        Title = "汉化spy2",
        Icon = "zap",
        Callback = function()
            local success, result = pcall(function()
                loadstring(game:HttpGet('https://raw.githubusercontent.com/xiaopi77/xiaopi77/refs/heads/main/spy%E6%B1%89%E5%8C%96%20(1).txt', true))()
            end)
            
            if success then
                WindUI:Notify({
                    Title = "已启用",
                    Content = "汉化spy2",
                    Icon = "star",
                    Duration = 3
                })
            else
                WindUI:Notify({
                    Title = "加载失败",
                    Content = "请检查网络连接",
                    Icon = "x",
                    Duration = 3
                })
            end
        end
    })
    
    TabHandles.Pharaoh:Paragraph({
        Title = "esp/透视功能",
        Desc = "不太完善请见谅",
        Image = "component",
        ImageSize = 20,
        Color = Color3.fromHex("#30ff6a"),
    })

    -- ===== ESP 功能 =====
    TabHandles.Pharaoh:Divider()

    -- ESP 配置变量
    local espEnabled = false
    local espConnections = {}
    local espObjects = {}
    local espSettings = {
        boxColor = Color3.fromRGB(255, 255, 255),
        teammateColor = Color3.fromRGB(0, 255, 0),
        enemyColor = Color3.fromRGB(255, 0, 0),
        tracerColor = Color3.fromRGB(255, 255, 255),
        boxTransparency = 0.5,
        showTracers = true,
        showNames = true,
        showBoxes = true,
        showDistance = true,
        showHealth = true
    }

    -- 清理ESP对象
    local function clearESP()
        for playerName, data in pairs(espObjects) do
            if data.box then pcall(function() data.box:Destroy() end) end
            if data.nameTag then pcall(function() data.nameTag:Destroy() end) end
            if data.tracer then pcall(function() data.tracer:Destroy() end) end
            if data.healthBar then pcall(function() data.healthBar:Destroy() end) end
        end
        espObjects = {}
        for _, conn in ipairs(espConnections) do
            pcall(function() conn:Disconnect() end)
        end
        espConnections = {}
    end

    -- 创建健康条
    local function createHealthBar(character, humanoidRootPart, size)
        if not espSettings.showHealth then return nil end
        
        local healthBar = Instance.new("BillboardGui")
        healthBar.Adornee = humanoidRootPart
        healthBar.Size = UDim2.new(0, 40, 0, 6)
        healthBar.StudsOffset = Vector3.new(0, -size.Y/2 - 0.5, 0)
        healthBar.AlwaysOnTop = true
        healthBar.Parent = humanoidRootPart
        
        local bg = Instance.new("Frame")
        bg.Parent = healthBar
        bg.Size = UDim2.new(1, 0, 1, 0)
        bg.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
        bg.BorderSizePixel = 0
        
        local fill = Instance.new("Frame")
        fill.Parent = bg
        fill.Size = UDim2.new(1, 0, 1, 0)
        fill.BackgroundColor3 = Color3.fromRGB(50, 255, 50)
        fill.BorderSizePixel = 0
        
        local function updateHealth()
            local humanoid = character:FindFirstChildOfClass("Humanoid")
            if humanoid and fill then
                local healthPercent = humanoid.Health / humanoid.MaxHealth
                fill.Size = UDim2.new(healthPercent, 0, 1, 0)
                
                if healthPercent > 0.6 then
                    fill.BackgroundColor3 = Color3.fromRGB(50, 255, 50)
                elseif healthPercent > 0.3 then
                    fill.BackgroundColor3 = Color3.fromRGB(255, 255, 50)
                else
                    fill.BackgroundColor3 = Color3.fromRGB(255, 50, 50)
                end
            end
        end
        
        updateHealth()
        
        local humanoid = character:FindFirstChildOfClass("Humanoid")
        if humanoid then
            local healthConn = humanoid:GetPropertyChangedSignal("Health"):Connect(updateHealth)
            table.insert(espConnections, healthConn)
        end
        
        return healthBar
    end

    -- 创建ESP对象
    local function createESPForCharacter(player, character)
        if not character or not espEnabled then return end
        
        local localPlayer = game:GetService("Players").LocalPlayer
        local humanoidRootPart = character:FindFirstChild("HumanoidRootPart")
        local humanoid = character:FindFirstChildOfClass("Humanoid")
        
        if not humanoidRootPart or not humanoid or humanoid.Health <= 0 then return end
        
        if espObjects[player.Name] then
            if espObjects[player.Name].box then pcall(function() espObjects[player.Name].box:Destroy() end) end
            if espObjects[player.Name].nameTag then pcall(function() espObjects[player.Name].nameTag:Destroy() end) end
            if espObjects[player.Name].healthBar then pcall(function() espObjects[player.Name].healthBar:Destroy() end) end
        end
        
        local isTeammate = false
        if localPlayer.Team and player.Team and localPlayer.Team == player.Team then
            isTeammate = true
        end
        
        local boxColor = espSettings.boxColor
        if isTeammate then
            boxColor = espSettings.teammateColor
        elseif player ~= localPlayer then
            boxColor = espSettings.enemyColor
        end
        
        local size = character:GetExtentsSize() + Vector3.new(0.5, 0.5, 0.5)
        local offset = size.Y / 2
        
        if espSettings.showBoxes then
            local box = Instance.new("BoxHandleAdornment")
            box.Adornee = humanoidRootPart
            box.AlwaysOnTop = true
            box.ZIndex = 10
            box.Size = size
            box.Color3 = boxColor
            box.Transparency = espSettings.boxTransparency
            box.Parent = humanoidRootPart
            
            espObjects[player.Name] = espObjects[player.Name] or {}
            espObjects[player.Name].box = box
        end
        
        if espSettings.showNames or espSettings.showDistance then
            local billboard = Instance.new("BillboardGui")
            billboard.Adornee = humanoidRootPart
            billboard.Size = UDim2.new(0, 200, 0, 60)
            billboard.StudsOffset = Vector3.new(0, offset + 1, 0)
            billboard.AlwaysOnTop = true
            billboard.Parent = humanoidRootPart
            
            local nameLabel = Instance.new("TextLabel")
            nameLabel.Parent = billboard
            nameLabel.BackgroundTransparency = 1
            nameLabel.Size = UDim2.new(1, 0, 0.5, 0)
            nameLabel.Position = UDim2.new(0, 0, 0, 0)
            nameLabel.Text = player.Name
            nameLabel.TextColor3 = boxColor
            nameLabel.TextStrokeTransparency = 0.3
            nameLabel.TextStrokeColor3 = Color3.new(0, 0, 0)
            nameLabel.Font = Enum.Font.SourceSansBold
            nameLabel.TextScaled = true
            
            local distanceLabel = Instance.new("TextLabel")
            distanceLabel.Parent = billboard
            distanceLabel.BackgroundTransparency = 1
            distanceLabel.Size = UDim2.new(1, 0, 0.5, 0)
            distanceLabel.Position = UDim2.new(0, 0, 0.5, 0)
            distanceLabel.Text = "0m"
            distanceLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
            distanceLabel.TextStrokeTransparency = 0.3
            distanceLabel.TextStrokeColor3 = Color3.new(0, 0, 0)
            distanceLabel.Font = Enum.Font.SourceSans
            distanceLabel.TextScaled = true
            
            if espSettings.showDistance then
                local updateDistance = function()
                    if localPlayer.Character and localPlayer.Character:FindFirstChild("HumanoidRootPart") then
                        local myRoot = localPlayer.Character.HumanoidRootPart
                        local dist = (myRoot.Position - humanoidRootPart.Position).Magnitude
                        distanceLabel.Text = math.floor(dist) .. "m"
                    end
                end
                
                updateDistance()
                local distConn = game:GetService("RunService").RenderStepped:Connect(updateDistance)
                table.insert(espConnections, distConn)
            else
                distanceLabel.Visible = false
            end
            
            if not espSettings.showNames then
                nameLabel.Visible = false
            end
            
            espObjects[player.Name] = espObjects[player.Name] or {}
            espObjects[player.Name].nameTag = billboard
        end
        
        if espSettings.showHealth then
            local healthBar = createHealthBar(character, humanoidRootPart, size)
            if healthBar then
                espObjects[player.Name] = espObjects[player.Name] or {}
                espObjects[player.Name].healthBar = healthBar
            end
        end
    end

    -- 设置ESP
    local function setupESP()
        clearESP()
        if not espEnabled then return end
        
        local Players = game:GetService("Players")
        local localPlayer = Players.LocalPlayer
        
        for _, player in ipairs(Players:GetPlayers()) do
            if player ~= localPlayer then
                if player.Character then
                    task.wait(0.1)
                    createESPForCharacter(player, player.Character)
                end
            end
        end
        
        local playerAddedConn = Players.PlayerAdded:Connect(function(player)
            if player ~= localPlayer then
                local charConn
                charConn = player.CharacterAdded:Connect(function(character)
                    if espEnabled then
                        task.wait(1)
                        createESPForCharacter(player, character)
                    end
                    if charConn then charConn:Disconnect() end
                end)
                table.insert(espConnections, charConn)
                
                if player.Character then
                    task.wait(0.5)
                    createESPForCharacter(player, player.Character)
                end
            end
        end)
        table.insert(espConnections, playerAddedConn)
        
        local characterRemovingConn = Players.CharacterRemoving:Connect(function(player)
            if espObjects[player.Name] then
                if espObjects[player.Name].box then pcall(function() espObjects[player.Name].box:Destroy() end) end
                if espObjects[player.Name].nameTag then pcall(function() espObjects[player.Name].nameTag:Destroy() end) end
                if espObjects[player.Name].healthBar then pcall(function() espObjects[player.Name].healthBar:Destroy() end) end
                espObjects[player.Name] = nil
            end
        end)
        table.insert(espConnections, characterRemovingConn)
    end

    -- ESP总开关
    local espMainToggle = TabHandles.Pharaoh:Toggle({
        Title = "启用ESP",
        Desc = "显示玩家方框和标签",
        Default = false,
        Callback = function(state)
            espEnabled = state
            if state then
                setupESP()
                WindUI:Notify({
                    Title = "ESP已启用",
                    Content = "显示玩家信息",
                    Icon = "eye",
                    Duration = 2
                })
            else
                clearESP()
                WindUI:Notify({
                    Title = "ESP已禁用",
                    Content = "所有ESP已隐藏",
                    Icon = "eye-off",
                    Duration = 2
                })
            end
        end
    })

    TabHandles.Pharaoh:Paragraph({
        Title = "ESP使用说明",
        Desc = "• 红色: 敌人\n• 绿色: 队友\n• 白色: 默认/无队伍\n• 血量条显示生命值",
        Image = "info",
        ImageSize = 16,
        Color = Color3.fromHex("#888888"),
    })

    TabHandles.Pharaoh:Divider()

    -- 颜色选择器 - 敌人颜色
    local enemyColorPicker = TabHandles.Pharaoh:ColorPicker({
        Title = "敌人颜色",
        Desc = "选择敌人方框颜色",
        Default = Color3.fromRGB(255, 0, 0),
        Callback = function(color)
            espSettings.enemyColor = color
            if espEnabled then
                setupESP()
            end
        end
    })

    -- 颜色选择器 - 队友颜色
    local teammateColorPicker = TabHandles.Pharaoh:ColorPicker({
        Title = "队友颜色",
        Desc = "选择队友方框颜色",
        Default = Color3.fromRGB(0, 255, 0),
        Callback = function(color)
            espSettings.teammateColor = color
            if espEnabled then
                setupESP()
            end
        end
    })

    -- 颜色选择器 - 默认颜色
    local defaultColorPicker = TabHandles.Pharaoh:ColorPicker({
        Title = "默认颜色",
        Desc = "选择默认方框颜色",
        Default = Color3.fromRGB(255, 255, 255),
        Callback = function(color)
            espSettings.boxColor = color
            if espEnabled then
                setupESP()
            end
        end
    })

    -- 透明度滑块
    local espTransparencySlider = TabHandles.Pharaoh:Slider({
        Title = "方框透明度",
        Desc = "调整方框透明度",
        Min = 0,
        Max = 1,
        Default = 0.5,
        Increment = 0.1,
        Callback = function(value)
            espSettings.boxTransparency = value
            if espEnabled then
                for _, data in pairs(espObjects) do
                    if data.box then
                        data.box.Transparency = value
                    end
                end
            end
        end
    })

    TabHandles.Pharaoh:Divider()

    -- 显示选项开关
    local showBoxesToggle = TabHandles.Pharaoh:Toggle({
        Title = "显示方框",
        Desc = "显示玩家方框",
        Default = true,
        Callback = function(state)
            espSettings.showBoxes = state
            if espEnabled then
                setupESP()
            end
        end
    })

    local showNamesToggle = TabHandles.Pharaoh:Toggle({
        Title = "显示名字",
        Desc = "显示玩家名字",
        Default = true,
        Callback = function(state)
            espSettings.showNames = state
            if espEnabled then
                setupESP()
            end
        end
    })

    local showDistanceToggle = TabHandles.Pharaoh:Toggle({
        Title = "显示距离",
        Desc = "显示玩家距离",
        Default = true,
        Callback = function(state)
            espSettings.showDistance = state
            if espEnabled then
                setupESP()
            end
        end
    })

    local showHealthToggle = TabHandles.Pharaoh:Toggle({
        Title = "显示血量",
        Desc = "显示玩家血量条",
        Default = true,
        Callback = function(state)
            espSettings.showHealth = state
            if espEnabled then
                setupESP()
            end
        end
    })

    TabHandles.Pharaoh:Divider()

    -- 队伍检测开关
    local teamCheckToggle = TabHandles.Pharaoh:Toggle({
        Title = "队伍检测",
        Desc = "根据队伍改变颜色",
        Default = true,
        Callback = function(state)
            if espEnabled then
                setupESP()
            end
            WindUI:Notify({
                Title = "队伍检测",
                Content = state and "已启用颜色区分" or "已禁用颜色区分",
                Duration = 1.5
            })
        end
    })

    -- 刷新ESP按钮
    local refreshESPButton = TabHandles.Pharaoh:Button({
        Title = "刷新ESP",
        Icon = "refresh-cw",
        Variant = "Secondary",
        Callback = function()
            if espEnabled then
                setupESP()
                WindUI:Notify({
                    Title = "ESP已刷新",
                    Content = "重新生成了所有ESP",
                    Duration = 1.5
                })
            else
                WindUI:Notify({
                    Title = "ESP未启用",
                    Content = "请先打开ESP开关",
                    Icon = "alert-circle",
                    Duration = 2
                })
            end
        end
    })

    -- 重置所有颜色按钮
    local resetColorsButton = TabHandles.Pharaoh:Button({
        Title = "重置颜色",
        Icon = "rotate-ccw",
        Variant = "Secondary",
        Callback = function()
            espSettings.enemyColor = Color3.fromRGB(255, 0, 0)
            espSettings.teammateColor = Color3.fromRGB(0, 255, 0)
            espSettings.boxColor = Color3.fromRGB(255, 255, 255)
            
            enemyColorPicker:Set(Color3.fromRGB(255, 0, 0))
            teammateColorPicker:Set(Color3.fromRGB(0, 255, 0))
            defaultColorPicker:Set(Color3.fromRGB(255, 255, 255))
            
            if espEnabled then
                setupESP()
            end
            
            WindUI:Notify({
                Title = "颜色已重置",
                Content = "所有颜色已恢复默认",
                Duration = 1.5
            })
        end
    })

    local NightButton = TabHandles.LTY:Button({
        Title = "森林中的99夜",
        Icon = "crown",
        Callback = function()
            local success, result = pcall(function()
                loadstring(game:HttpGet('https://raw.githubusercontent.com/XiaoXuCynic/OldWinter-XiaoXu-TheBigWave-Guild/refs/heads/main/TBW%2099Night99%E5%A4%9C.lua', true))()
            end)
            
            if success then
                WindUI:Notify({
                    Title = "已启用",
                    Content = "森林中的99夜",
                    Icon = "star",
                    Duration = 3
                })
            else
                WindUI:Notify({
                    Title = "加载失败",
                    Content = "请检查网络连接",
                    Icon = "x",
                    Duration = 3
                })
            end
        end
    })
    
    local UnityButton = TabHandles.LTY:Button({
        Title = "无尽现实",
        Icon = "bell",
        Callback = function()
            local success, result = pcall(function()
                loadstring(game:HttpGet("https://raw.githubusercontent.com/XiaoXuCynic/Old-Winter-Script/refs/heads/main/TBW%20Endless%20reality%E6%97%A0%E5%B0%BD%E7%8E%B0%E5%AE%9E.lua", true))()
            end)
            
            if success then
                WindUI:Notify({
                    Title = "已启用",
                    Content = "无尽现实",
                    Icon = "bell",
                    Duration = 3
                })
            else
                WindUI:Notify({
                    Title = "加载失败",
                    Content = "请检查网络连接",
                    Icon = "x",
                    Duration = 3
                })
            end
        end
    })

    local DoorsButton = TabHandles.LTY:Button({
        Title = "doors",
        Icon = "bell",
        Callback = function()
            local success, result = pcall(function()
                loadstring(game:HttpGet("https://raw.githubusercontent.com/XiaoXuCynic/OldWinter-XiaoXu-TheBigWave-Guild/refs/heads/main/TBWDoors.lua", true))()
            end)
            
            if success then
                WindUI:Notify({
                    Title = "已启用",
                    Content = "Doors",
                    Icon = "bell",
                    Duration = 3
                })
            else
                WindUI:Notify({
                    Title = "加载失败",
                    Content = "请检查网络连接",
                    Icon = "x",
                    Duration = 3
                })
            end
        end
    })

    local EvadeButton = TabHandles.LTY:Button({
        Title = "躲避",
        Icon = "bell",
        Callback = function()
            local success, result = pcall(function()
                loadstring(game:HttpGet("https://raw.githubusercontent.com/XiaoXuCynic/Old-Winter-Script/refs/heads/main/TBW%20Evade%20%E8%BA%B2%E9%81%BF.lua", true))()
            end)
            
            if success then
                WindUI:Notify({
                    Title = "已启用",
                    Content = "躲避",
                    Icon = "bell",
                    Duration = 3
                })
            else
                WindUI:Notify({
                    Title = "加载失败",
                    Content = "请检查网络连接",
                    Icon = "x",
                    Duration = 3
                })
            end
        end
    })

    local hanbaoButton = TabHandles.LTY:Button({
        Title = "紧急汉堡",
        Icon = "bell",
        Callback = function()
            local success, result = pcall(function()
                loadstring(game:HttpGet("https://raw.githubusercontent.com/XiaoXuCynic/Old-Winter-Script/refs/heads/main/TBW%20Emergency%20Burger%E7%B4%A7%E6%80%A5%E6%B1%89%E5%A0%A1.lua", true))()
            end)
            
            if success then
                WindUI:Notify({
                    Title = "已启用",
                    Content = "紧急汉堡",
                    Icon = "bell",
                    Duration = 3
                })
            else
                WindUI:Notify({
                    Title = "加载失败",
                    Content = "请检查网络连接",
                    Icon = "x",
                    Duration = 3
                })
            end
        end
    })

    local KButton = TabHandles.LTY:Button({
        Title = "超市生活7天",
        Icon = "bell",
        Callback = function()
            local success, result = pcall(function()
                loadstring(game:HttpGet("https://raw.githubusercontent.com/XiaoXuCynic/OldWinter-XiaoXu-TheBigWave-Guild/refs/heads/main/TBW%20Live%20for%20seven%20days%E5%9C%A8%E8%B6%85%E5%B8%82%E7%94%9F%E5%AD%98%E4%B8%83%E5%A4%A9.lua", true))()
            end)
            
            if success then
                WindUI:Notify({
                    Title = "已启用",
                    Content = "超市生活7Day",
                    Icon = "bell",
                    Duration = 3
                })
            else
                WindUI:Notify({
                    Title = "加载失败",
                    Content = "请检查网络连接",
                    Icon = "x",
                    Duration = 3
                })
            end
        end
    })

    local UButton = TabHandles.LTY:Button({
        Title = "停电",
        Icon = "bell",
        Callback = function()
            local success, result = pcall(function()
                loadstring(game:HttpGet('https://raw.githubusercontent.com/XiaoXuCynic/OldWinter-XiaoXu-TheBigWave-Guild/refs/heads/main/TBW%20Power%20failure%E5%81%9C%E7%94%B5.lua', true))()
            end)
            
            if success then
                WindUI:Notify({
                    Title = "已启用",
                    Content = "停电",
                    Icon = "bell",
                    Duration = 3
                })
            else
                WindUI:Notify({
                    Title = "加载失败",
                    Content = "请检查网络连接",
                    Icon = "x",
                    Duration = 3
                })
            end
        end
    })

    local KurakiButton = TabHandles.LTY:Button({
        Title = "墨水游戏",
        Icon = "bell",
        Callback = function()
            local success, result = pcall(function()
                loadstring(game:HttpGet("https://raw.githubusercontent.com/XiaoXuCynic/OldWinter-XiaoXu-TheBigWave-Guild/refs/heads/main/TBW%20Ink%20Game%E5%A2%A8%E6%B0%B4%E6%B8%B8%E6%88%8F.lua", true))()
            end)
            
            if success then
                WindUI:Notify({
                    Title = "已启用",
                    Content = "墨水游戏",
                    Icon = "bell",
                    Duration = 3
                })
            else
                WindUI:Notify({
                    Title = "加载失败",
                    Content = "请检查网络连接",
                    Icon = "x",
                    Duration = 3
                })
            end
        end
    })

    local ForButton = TabHandles.LTY:Button({
        Title = "被遗弃",
        Icon = "bell",
        Callback = function()
            local success, result = pcall(function()
                loadstring(game:HttpGet('https://raw.githubusercontent.com/XiaoXuCynic/OldWinter-XiaoXu-TheBigWave-Guild/refs/heads/main/TBWForsaken.lua', true))()
            end)
            
            if success then
                WindUI:Notify({
                    Title = "已启用",
                    Content = "被遗弃",
                    Icon = "bell",
                    Duration = 3
                })
            else
                WindUI:Notify({
                    Title = "加载失败",
                    Content = "请检查网络连接",
                    Icon = "x",
                    Duration = 3
                })
            end
        end
    })

    local tsbButton = TabHandles.LTY:Button({
        Title = "最强战场",
        Icon = "bell",
        Callback = function()
            local success, result = pcall(function()
                loadstring(game:HttpGet('https://raw.githubusercontent.com/XiaoXuCynic/OldWinter-XiaoXu-TheBigWave-Guild/refs/heads/main/TBW%20The%20strongest%20battlefield%20%E6%9C%80%E5%BC%BA%E6%88%98%E5%9C%BA.lua', true))()
            end)
            
            if success then
                WindUI:Notify({
                    Title = "已启用",
                    Content = "最强战场",
                    Icon = "bell",
                    Duration = 3
                })
            else
                WindUI:Notify({
                    Title = "加载失败",
                    Content = "请检查网络连接",
                    Icon = "x",
                    Duration = 3
                })
            end
        end
    })

    local piguButton = TabHandles.LTY:Button({
        Title = "暴力区",
        Icon = "bell",
        Callback = function()
            local success, result = pcall(function()
                loadstring(game:HttpGet('https://raw.githubusercontent.com/XiaoXuCynic/OldWinter-XiaoXu-TheBigWave-Guild/refs/heads/main/TBW%20Violent%20Zone%E6%9A%B4%E5%8A%9B%E5%8C%BA.lua', true))()
            end)
            
            if success then
                WindUI:Notify({
                    Title = "已启用",
                    Content = "暴力区",
                    Icon = "bell",
                    Duration = 3
                })
            else
                WindUI:Notify({
                    Title = "加载失败",
                    Content = "请检查网络连接",
                    Icon = "x",
                    Duration = 3
                })
            end
        end
    })

    local EmotionButton = TabHandles.LTY:Button({
        Title = "恶魔学",
        Icon = "bell",
        Callback = function()
            local success, result = pcall(function()
                loadstring(game:HttpGet("https://raw.githubusercontent.com/XiaoXuCynic/Old-Winter-Script/refs/heads/main/%E6%81%B6%E9%AD%94%E5%AD%A6.lua", true))()
            end)
            
            if success then
                WindUI:Notify({
                    Title = "已启用",
                    Content = "恶魔学脚本",
                    Icon = "bell",
                    Duration = 3
                })
            else
                WindUI:Notify({
                    Title = "加载失败",
                    Content = "请检查网络连接",
                    Icon = "x",
                    Duration = 3
                })
            end
        end
    })

    local CButton = TabHandles.LTY:Button({
        Title = "战争大亨",
        Icon = "bell",
        Callback = function()
            local success, result = pcall(function()
                loadstring(game:HttpGet("https://raw.githubusercontent.com/XiaoXuCynic/Old-Winter-Script/refs/heads/main/%E6%88%98%E4%BA%89%E5%A4%A7%E4%BA%A8.lua", true))()
            end)
            
            if success then
                WindUI:Notify({
                    Title = "已启用",
                    Content = "战争大亨",
                    Icon = "bell",
                    Duration = 3
                })
            else
                WindUI:Notify({
                    Title = "加载失败",
                    Content = "请检查网络连接",
                    Icon = "x",
                    Duration = 3
                })
            end
        end
    })

    local QButton = TabHandles.LTY:Button({
        Title = "种植花园",
        Icon = "bell",
        Callback = function()
            local success, result = pcall(function()
                loadstring(game:HttpGet('https://raw.githubusercontent.com/XiaoXuCynic/Old-Winter-Script/refs/heads/main/%E7%A7%8D%E6%A4%8D.lua', true))()
            end)
            
            if success then
                WindUI:Notify({
                    Title = "已启用",
                    Content = "种植花园",
                    Icon = "bell",
                    Duration = 3
                })
            else
                WindUI:Notify({
                    Title = "加载失败",
                    Content = "请检查网络连接",
                    Icon = "x",
                    Duration = 3
                })
            end
        end
    })

    local WantedButton = TabHandles.LTY:Button({
        Title = "通缉",
        Icon = "bell",
        Callback = function()
            local success, result = pcall(function()
                loadstring(game:HttpGet('https://raw.githubusercontent.com/XiaoXuCynic/Old-Winter-Script/refs/heads/main/TBW%20Wanted%E9%80%9A%E7%BC%89.lua', true))()
            end)
            
            if success then
                WindUI:Notify({
                    Title = "已启用",
                    Content = "通缉",
                    Icon = "bell",
                    Duration = 3
                })
            else
                WindUI:Notify({
                    Title = "加载失败",
                    Content = "请检查网络连接",
                    Icon = "x",
                    Duration = 3
                })
            end
        end
    })

    local BreakButton = TabHandles.LTY:Button({
        Title = "力量传奇",
        Icon = "bell",
        Callback = function()
            local success, result = pcall(function()
                loadstring(game:HttpGet('https://raw.githubusercontent.com/XiaoXuCynic/OldWinter-XiaoXu-TheBigWave-Guild/refs/heads/main/TBW%20Legend%20of%20Power%E5%8A%9B%E9%87%8F%E4%BC%A0%E5%A5%87.lua', true))()
            end)
            
            if success then
                WindUI:Notify({
                    Title = "已启用",
                    Content = "力量传奇",
                    Icon = "bell",
                    Duration = 3
                })
            else
                WindUI:Notify({
                    Title = "加载失败",
                    Content = "请检查网络连接",
                    Icon = "x",
                    Duration = 3
                })
            end
        end
    })

    local VictoryButton = TabHandles.LTY:Button({
        Title = "模仿者",
        Icon = "bell",
        Callback = function()
            local success, result = pcall(function()
                loadstring(game:HttpGet('https://raw.githubusercontent.com/XiaoXuCynic/OldWinter-XiaoXu-TheBigWave-Guild/refs/heads/main/TBW%20Copycat%E6%A8%A1%E4%BB%BF%E8%80%85.lua', true))()
            end)
            
            if success then
                WindUI:Notify({
                    Title = "已启用",
                    Content = "模仿者脚本",
                    Icon = "bell",
                    Duration = 3
                })
            else
                WindUI:Notify({
                    Title = "加载失败",
                    Content = "请检查网络连接",
                    Icon = "x",
                    Duration = 3
                })
            end
        end
    })

    local ABCButton = TabHandles.LTY:Button({
        Title = "死铁轨",
        Icon = "bell",
        Callback = function()
            local success, result = pcall(function()
                loadstring(game:HttpGet('https://raw.githubusercontent.com/XiaoXuCynic/OldWinter-XiaoXu-TheBigWave-Guild/refs/heads/main/TBW%20Dead%20Rail%20%E6%AD%BB%E9%93%81%E8%BD%A8.lua', true))()
            end)
            
            if success then
                WindUI:Notify({
                    Title = "已启用",
                    Content = "死铁轨",
                    Icon = "bell",
                    Duration = 3
                })
            else
                WindUI:Notify({
                    Title = "加载失败",
                    Content = "请检查网络连接",
                    Icon = "x",
                    Duration = 3
                })
            end
        end
    })

    local SaiBiButton = TabHandles.LTY:Button({
        Title = "犯罪",
        Icon = "bell",
        Callback = function()
            local success, result = pcall(function()
                loadstring(game:HttpGet('https://raw.githubusercontent.com/XiaoXuCynic/OldWinter-XiaoXu-TheBigWave-Guild/refs/heads/main/TBW%20commit%20%E7%8A%AF%E7%BD%AA.lua', true))()
            end)
            
            if success then
                WindUI:Notify({
                    Title = "已启用",
                    Content = "犯罪",
                    Icon = "sword",
                    Duration = 3
                })
            else
                WindUI:Notify({
                    Title = "加载失败",
                    Content = "请检查网络连接",
                    Icon = "x",
                    Duration = 3
                })
            end
        end
    })

    local TnineButton = TabHandles.LTY:Button({
        Title = "凹凸世界",
        Icon = "bell",
        Callback = function()
            local success, result = pcall(function()
                loadstring(game:HttpGet('https://raw.githubusercontent.com/XiaoXuCynic/OldWinter-XiaoXu-TheBigWave-Guild/refs/heads/main/TBW%20Concave-convex%20world%E5%87%B9%E5%87%B8%E4%B8%96%E7%95%8C.lua', true))()
            end)
            
            if success then
                WindUI:Notify({
                    Title = "已启用",
                    Content = "凹凸世界",
                    Icon = "crown",
                    Duration = 3
                })
            else
                WindUI:Notify({
                    Title = "加载失败",
                    Content = "请检查网络连接",
                    Icon = "x",
                    Duration = 3
                })
            end
        end
    })

    local OilyButton = TabHandles.LTY:Button({
        Title = "感染微笑",
        Icon = "bell",
        Callback = function()
            local success, result = pcall(function()
                loadstring(game:HttpGet('https://raw.githubusercontent.com/XiaoXuCynic/OldWinter-XiaoXu-TheBigWave-Guild/refs/heads/main/TBW%20Infected%20smile%E6%84%9F%E6%9F%93%E5%BE%AE%E7%AC%91.lua', true))()
            end)
            
            if success then
                WindUI:Notify({
                    Title = "已启用",
                    Content = "感染微笑",
                    Icon = "bell",
                    Duration = 3
                })
            else
                WindUI:Notify({
                    Title = "加载失败",
                    Content = "请检查网络连接",
                    Icon = "x",
                    Duration = 3
                })
            end
        end
    })

    local KurakiFlickButton = TabHandles.ZSH:Button({
        Title = "KurakiHub闪光点",
        Icon = "bell",
        Callback = function()
            local success, result = pcall(function()
                loadstring(game:HttpGet('https://raw.githubusercontent.com/lxmyysd/KurakiHub---SUNKEN/refs/heads/main/Flick%20Kuraki%20SunkenBoat.lua', true))()
            end)
            
            if success then
                WindUI:Notify({
                    Title = "已启用",
                    Content = "闪光点脚本",
                    Icon = "bell",
                    Duration = 3
                })
            else
                WindUI:Notify({
                    Title = "加载失败",
                    Content = "请检查网络连接",
                    Icon = "x",
                    Duration = 3
                })
            end
        end
    })


    local ZHButton = TabHandles.ZSH:Button({
        Title = "ZH脚本",
        Icon = "bell",
        Callback = function()
            local success, result = pcall(function()
                loadstring(game:HttpGet('https://raw.githubusercontent.com/smalldesikon/ZH/refs/heads/main/ZH%20HUB', true))()
            end)
            
            if success then
                WindUI:Notify({
                    Title = "已启用",
                    Content = "ZH脚本",
                    Icon = "bell",
                    Duration = 3
                })
            else
                WindUI:Notify({
                    Title = "加载失败",
                    Content = "请检查网络连接",
                    Icon = "x",
                    Duration = 3
                })
            end
        end
    })

    -- ===== 玩家传送功能 =====

    -- 传送配置变量
    local teleportEnabled = false
    local selectedTarget = nil
    local viewingTarget = false
    local originalCFrame = nil

    -- 获取所有玩家列表（排除本地玩家）
    local function getPlayerList()
        local players = {}
        for _, player in ipairs(game:GetService("Players"):GetPlayers()) do
            if player ~= game:GetService("Players").LocalPlayer then
                table.insert(players, player.Name)
            end
        end
        table.sort(players)
        return players
    end

    -- 通过名字获取玩家对象
    local function getPlayerByName(name)
        for _, player in ipairs(game:GetService("Players"):GetPlayers()) do
            if player.Name == name then
                return player
            end
        end
        return nil
    end

    -- 传送到玩家位置
    local function teleportToPlayer(targetPlayer)
        if not targetPlayer then
            WindUI:Notify({
                Title = "传送失败",
                Content = "请先选择目标玩家",
                Icon = "x",
                Duration = 2
            })
            return
        end
        
        local localPlayer = game:GetService("Players").LocalPlayer
        local character = localPlayer.Character
        local targetChar = targetPlayer.Character
        
        if not character then
            WindUI:Notify({
                Title = "传送失败",
                Content = "你的角色不存在",
                Icon = "x",
                Duration = 2
            })
            return
        end
        
        if not targetChar then
            WindUI:Notify({
                Title = "传送失败",
                Content = targetPlayer.Name .. " 的角色不存在",
                Icon = "x",
                Duration = 2
            })
            return
        end
        
        local humanoidRootPart = character:FindFirstChild("HumanoidRootPart")
        local targetRoot = targetChar:FindFirstChild("HumanoidRootPart")
        
        if not humanoidRootPart or not targetRoot then
            WindUI:Notify({
                Title = "传送失败",
                Content = "无法获取角色位置",
                Icon = "x",
                Duration = 2
            })
            return
        end
        
        originalCFrame = humanoidRootPart.CFrame
        humanoidRootPart.CFrame = targetRoot.CFrame + Vector3.new(0, 3, 0)
        
        WindUI:Notify({
            Title = "传送成功",
            Content = "已传送到 " .. targetPlayer.Name,
            Icon = "check",
            Duration = 2
        })
    end

    -- 查看玩家视角
    local function viewPlayerPerspective(targetPlayer)
        if not targetPlayer then
            WindUI:Notify({
                Title = "视角失败",
                Content = "请先选择目标玩家",
                Icon = "x",
                Duration = 2
            })
            return
        end
        
        local camera = workspace.CurrentCamera
        local targetChar = targetPlayer.Character
        
        if not targetChar then
            WindUI:Notify({
                Title = "视角失败",
                Content = targetPlayer.Name .. " 的角色不存在",
                Icon = "x",
                Duration = 2
            })
            return
        end
        
        local targetRoot = targetChar:FindFirstChild("HumanoidRootPart")
        if not targetRoot then
            WindUI:Notify({
                Title = "视角失败",
                Content = "无法获取角色位置",
                Icon = "x",
                Duration = 2
            })
            return
        end
        
        viewingTarget = not viewingTarget
        
        if viewingTarget then
            if not _G.originalCameraSubject then
                _G.originalCameraSubject = camera.CameraSubject
                _G.originalCameraCFrame = camera.CFrame
            end
            
            camera.CameraSubject = targetRoot
            camera.CameraType = Enum.CameraType.Attach
            
            WindUI:Notify({
                Title = "视角模式",
                Content = "正在查看 " .. targetPlayer.Name .. " 的视角",
                Icon = "eye",
                Duration = 2
            })
        else
            if _G.originalCameraSubject then
                camera.CameraSubject = _G.originalCameraSubject
                camera.CameraType = Enum.CameraType.Custom
                camera.CFrame = _G.originalCameraCFrame or CFrame.new()
                
                _G.originalCameraSubject = nil
                _G.originalCameraCFrame = nil
            end
            
            WindUI:Notify({
                Title = "视角模式",
                Content = "已恢复原视角",
                Icon = "eye-off",
                Duration = 2
            })
        end
    end

    -- 循环传送功能
    local function startLoopTeleport(targetPlayer)
        if not targetPlayer then
            WindUI:Notify({
                Title = "循环传送失败",
                Content = "请先选择目标玩家",
                Icon = "x",
                Duration = 2
            })
            return
        end
        
        teleportEnabled = not teleportEnabled
        
        if teleportEnabled then
            if _G.loopTeleportConnection then
                _G.loopTeleportConnection:Disconnect()
                _G.loopTeleportConnection = nil
            end
            
            selectedTarget = targetPlayer
            
            _G.loopTeleportConnection = game:GetService("RunService").Heartbeat:Connect(function()
                if not teleportEnabled or not selectedTarget then
                    if _G.loopTeleportConnection then
                        _G.loopTeleportConnection:Disconnect()
                        _G.loopTeleportConnection = nil
                    end
                    return
                end
                
                local localPlayer = game:GetService("Players").LocalPlayer
                local character = localPlayer.Character
                local targetChar = selectedTarget.Character
                
                if character and targetChar then
                    local humanoidRootPart = character:FindFirstChild("HumanoidRootPart")
                    local targetRoot = targetChar:FindFirstChild("HumanoidRootPart")
                    
                    if humanoidRootPart and targetRoot then
                        humanoidRootPart.CFrame = targetRoot.CFrame + Vector3.new(0, 3, 0)
                    end
                end
            end)
            
            WindUI:Notify({
                Title = "循环传送",
                Content = "已启用，目标: " .. targetPlayer.Name,
                Icon = "repeat",
                Duration = 2
            })
        else
            if _G.loopTeleportConnection then
                _G.loopTeleportConnection:Disconnect()
                _G.loopTeleportConnection = nil
            end
            
            WindUI:Notify({
                Title = "循环传送",
                Content = "已禁用",
                Icon = "x",
                Duration = 2
            })
        end
    end

    -- ===== UI 元素 =====

    -- 玩家传送标题
    TabHandles.TP:Paragraph({
        Title = "玩家传送系统",
        Desc = "传送到指定玩家位置",
        Image = "map-pin",
        ImageSize = 20,
        Color = Color3.fromHex("#4169E1"),
    })

    -- 玩家选择下拉框
    local playerDropdown = TabHandles.TP:Dropdown({
        Title = "选择玩家",
        Desc = "选择要传送的目标玩家",
        Values = getPlayerList(),
        Default = getPlayerList()[1] or "无玩家",
        Callback = function(value)
            selectedTarget = getPlayerByName(value)
        end
    })

    -- 刷新玩家列表按钮
    local refreshPlayerButton = TabHandles.TP:Button({
        Title = "刷新玩家列表",
        Icon = "refresh-cw",
        Variant = "Secondary",
        Callback = function()
            local players = getPlayerList()
            playerDropdown:SetValues(players)
            if #players > 0 then
                playerDropdown:Select(players[1])
                selectedTarget = getPlayerByName(players[1])
            end
            WindUI:Notify({
                Title = "玩家列表",
                Content = "已刷新，当前在线 " .. #players .. " 名玩家",
                Duration = 1.5
            })
        end
    })

    TabHandles.TP:Divider()

    -- 单次传送按钮
    local teleportButton = TabHandles.TP:Button({
        Title = "传送到该玩家",
        Icon = "map-pin",
        Variant = "Primary",
        Callback = function()
            teleportToPlayer(selectedTarget)
        end
    })

    -- 查看视角切换
    local viewPerspectiveToggle = TabHandles.TP:Toggle({
        Title = "查看该玩家视角",
        Desc = "切换视角到目标玩家",
        Default = false,
        Callback = function(state)
            viewPlayerPerspective(selectedTarget)
            task.wait(0.1)
            if not viewingTarget then
                if state then
                    viewPerspectiveToggle:Set(false)
                end
            end
        end
    })

    -- 循环传送开关
    local loopTeleportToggle = TabHandles.TP:Toggle({
        Title = "启用循环传送",
        Desc = "持续传送到目标玩家位置",
        Default = false,
        Callback = function(state)
            if state then
                startLoopTeleport(selectedTarget)
            else
                if teleportEnabled then
                    startLoopTeleport(selectedTarget)
                end
            end
        end
    })

    -- 循环传送说明
    TabHandles.TP:Paragraph({
        Title = "循环传送说明",
        Desc = "• 循环传送会每帧将你传送到目标位置\n• 建议配合飞行或穿墙使用\n• 再次点击开关即可关闭",
        Image = "info",
        ImageSize = 16,
        Color = Color3.fromHex("#888888"),
    })

    TabHandles.TP:Divider()

    -- 传送回原位按钮
    local teleportBackButton = TabHandles.TP:Button({
        Title = "传送回原位",
        Icon = "rotate-ccw",
        Variant = "Secondary",
        Callback = function()
            if originalCFrame then
                local character = game:GetService("Players").LocalPlayer.Character
                if character then
                    local humanoidRootPart = character:FindFirstChild("HumanoidRootPart")
                    if humanoidRootPart then
                        humanoidRootPart.CFrame = originalCFrame
                        WindUI:Notify({
                            Title = "传送成功",
                            Content = "已回到原位",
                            Icon = "check",
                            Duration = 2
                        })
                    end
                end
            else
                WindUI:Notify({
                    Title = "传送失败",
                    Content = "没有保存的原位位置",
                    Icon = "x",
                    Duration = 2
                })
            end
        end
    })

    -- 停止所有传送按钮
    local stopAllTeleportButton = TabHandles.TP:Button({
        Title = "停止所有传送",
        Icon = "square",
        Variant = "Danger",
        Callback = function()
            teleportEnabled = false
            if _G.loopTeleportConnection then
                _G.loopTeleportConnection:Disconnect()
                _G.loopTeleportConnection = nil
            end
            loopTeleportToggle:Set(false)
            
            if viewingTarget then
                viewPlayerPerspective(selectedTarget)
                viewPerspectiveToggle:Set(false)
            end
            
            WindUI:Notify({
                Title = "传送已停止",
                Content = "所有传送功能已禁用",
                Icon = "check",
                Duration = 2
            })
        end
    })

    -- 快速传送按钮组
    TabHandles.TP:Paragraph({
        Title = "快速传送",
        Desc = "点击玩家名字快速传送",
        Image = "zap",
        ImageSize = 16,
    })

    -- 快速传送按钮更新
    local function updateQuickTeleportButtons()
        local players = getPlayerList()
        if #players > 0 then
            for i, playerName in ipairs(players) do
                if i <= 5 then
                    local quickButton = TabHandles.TP:Button({
                        Title = "传送至 " .. playerName,
                        Icon = "user",
                        Variant = "Secondary",
                        Callback = function()
                            local target = getPlayerByName(playerName)
                            teleportToPlayer(target)
                        end
                    })
                end
            end
            
            if #players > 5 then
                TabHandles.TP:Paragraph({
                    Title = "还有 " .. (#players - 5) .. " 名玩家",
                    Desc = "请使用下拉列表选择",
                    Image = "more-horizontal",
                    ImageSize = 16,
                    Color = Color3.fromHex("#888888"),
                })
            end
        else
            TabHandles.TP:Paragraph({
                Title = "暂无其他玩家",
                Desc = "当前服务器只有你一人",
                Image = "frown",
                ImageSize = 16,
                Color = Color3.fromHex("#888888"),
            })
        end
    end

    updateQuickTeleportButtons()

    TabHandles.SelfAiming:Paragraph({
        Title = "使用说明",
        Desc = "• 按住瞄准键自动瞄准最近的敌人\n• 目标会显示黄色高亮\n• FOV圆圈显示瞄准范围\n• 可自定义所有颜色和参数",
        Image = "info",
        ImageSize = 16,
        Color = Color3.fromHex("#888888"),
    })
    
    -- 自瞄系统变量
    local aimbotEnabled = false
    local aimbotEspEnabled = false
    local aimbotConnections = {}
    local aimbotEspObjects = {}
    local aimbotSettings = {
        aimFov = 150,
        aimSmoothness = 5,
        aimPart = "Head",
        aimKey = "MouseButton2",
        showFovCircle = true,
        fovCircleColor = Color3.fromRGB(255, 255, 255),
        fovCircleTransparency = 0.7,
        teamCheck = true,
        visibleCheck = false,
        prediction = 0.1,
        boxColor = Color3.fromRGB(255, 255, 255),
        teammateColor = Color3.fromRGB(0, 255, 0),
        enemyColor = Color3.fromRGB(255, 0, 0),
        targetedColor = Color3.fromRGB(255, 255, 0),
        boxTransparency = 0.5,
        showBoxes = true,
        showNames = true,
        showDistance = true,
        showHealth = true,
        showTracers = false,
        showSkeleton = false,
        showTargetLine = true,
    }

    local currentTarget = nil
    local fovCircle = nil
    local targetLine = nil

    -- 创建FOV圆圈
    local function createFovCircle()
        if fovCircle then
            pcall(function() fovCircle:Destroy() end)
            fovCircle = nil
        end
        
        if not aimbotSettings.showFovCircle or not aimbotEnabled then return end
        
        local playerGui = game:GetService("Players").LocalPlayer:FindFirstChild("PlayerGui")
        if not playerGui then
            playerGui = Instance.new("ScreenGui")
            playerGui.Name = "AimbotGui"
            playerGui.ResetOnSpawn = false
            playerGui.Parent = game:GetService("Players").LocalPlayer:WaitForChild("PlayerGui")
        end
        
        local screenGui = playerGui:FindFirstChild("AimbotScreenGui")
        if not screenGui then
            screenGui = Instance.new("ScreenGui")
            screenGui.Name = "AimbotScreenGui"
            screenGui.ResetOnSpawn = false
            screenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
            screenGui.Parent = playerGui
        end
        
        fovCircle = Instance.new("ImageLabel")
        fovCircle.Name = "FovCircle"
        fovCircle.Parent = screenGui
        fovCircle.BackgroundTransparency = 1
        fovCircle.Size = UDim2.new(0, aimbotSettings.aimFov * 2, 0, aimbotSettings.aimFov * 2)
        fovCircle.Position = UDim2.new(0.5, -aimbotSettings.aimFov, 0.5, -aimbotSettings.aimFov)
        fovCircle.Image = "rbxasset://textures/ui/GuiImagePlaceholder.png"
        fovCircle.ImageColor3 = aimbotSettings.fovCircleColor
        fovCircle.ImageTransparency = aimbotSettings.fovCircleTransparency
        fovCircle.ZIndex = 10
    end

    -- 更新FOV圆圈
    local function updateFovCircle()
        if fovCircle and aimbotSettings.showFovCircle then
            fovCircle.Size = UDim2.new(0, aimbotSettings.aimFov * 2, 0, aimbotSettings.aimFov * 2)
            fovCircle.Position = UDim2.new(0.5, -aimbotSettings.aimFov, 0.5, -aimbotSettings.aimFov)
            fovCircle.ImageColor3 = aimbotSettings.fovCircleColor
            fovCircle.ImageTransparency = aimbotSettings.fovCircleTransparency
        end
    end

    -- 创建瞄准线
    local function createTargetLine()
        if targetLine then
            pcall(function() targetLine:Destroy() end)
            targetLine = nil
        end
        
        if not aimbotSettings.showTargetLine or not aimbotEnabled then return end
        
        local playerGui = game:GetService("Players").LocalPlayer:FindFirstChild("PlayerGui")
        if not playerGui then return end
        
        local screenGui = playerGui:FindFirstChild("AimbotScreenGui")
        if not screenGui then return end
        
        targetLine = Instance.new("Frame")
        targetLine.Name = "TargetLine"
        targetLine.Parent = screenGui
        targetLine.BackgroundColor3 = aimbotSettings.targetedColor
        targetLine.BorderSizePixel = 0
        targetLine.ZIndex = 9
        targetLine.Visible = false
    end

    -- 更新瞄准线
    local function updateTargetLine()
        if not targetLine or not aimbotSettings.showTargetLine or not currentTarget then
            if targetLine then targetLine.Visible = false end
            return
        end
        
        local camera = workspace.CurrentCamera
        local targetPart = currentTarget.Character and currentTarget.Character:FindFirstChild(aimbotSettings.aimPart)
        
        if not targetPart then
            targetLine.Visible = false
            return
        end
        
        local targetPos, onScreen = camera:WorldToViewportPoint(targetPart.Position)
        
        if not onScreen then
            targetLine.Visible = false
            return
        end
        
        local screenCenter = Vector2.new(camera.ViewportSize.X / 2, camera.ViewportSize.Y / 2)
        local targetVec = Vector2.new(targetPos.X, targetPos.Y)
        local direction = (targetVec - screenCenter).Unit
        local distance = (targetVec - screenCenter).Magnitude
        local lineLength = math.min(distance, 100)
        local linePos = screenCenter + direction * (lineLength / 2)
        
        targetLine.Size = UDim2.new(0, 2, 0, lineLength)
        targetLine.Position = UDim2.new(0, linePos.X, 0, linePos.Y)
        targetLine.Rotation = math.deg(math.atan2(direction.Y, direction.X)) + 90
        targetLine.BackgroundColor3 = aimbotSettings.targetedColor
        targetLine.Visible = true
    end

    -- 清理ESP对象
    local function clearAimbotESP()
        for playerName, data in pairs(aimbotEspObjects) do
            if data.box then pcall(function() data.box:Destroy() end) end
            if data.nameTag then pcall(function() data.nameTag:Destroy() end) end
            if data.healthBar then pcall(function() data.healthBar:Destroy() end) end
            if data.skeleton then pcall(function() data.skeleton:Destroy() end) end
            if data.tracer then pcall(function() data.tracer:Destroy() end) end
        end
        aimbotEspObjects = {}
    end

    -- 创建健康条
    local function createAimbotHealthBar(character, humanoidRootPart, size)
        if not aimbotSettings.showHealth then return nil end
        
        local healthBar = Instance.new("BillboardGui")
        healthBar.Adornee = humanoidRootPart
        healthBar.Size = UDim2.new(0, 40, 0, 6)
        healthBar.StudsOffset = Vector3.new(0, -size.Y/2 - 0.5, 0)
        healthBar.AlwaysOnTop = true
        healthBar.Parent = humanoidRootPart
        
        local bg = Instance.new("Frame")
        bg.Parent = healthBar
        bg.Size = UDim2.new(1, 0, 1, 0)
        bg.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
        bg.BorderSizePixel = 0
        
        local fill = Instance.new("Frame")
        fill.Parent = bg
        fill.Size = UDim2.new(1, 0, 1, 0)
        fill.BackgroundColor3 = Color3.fromRGB(50, 255, 50)
        fill.BorderSizePixel = 0
        
        local function updateHealth()
            local humanoid = character:FindFirstChildOfClass("Humanoid")
            if humanoid and fill then
                local healthPercent = humanoid.Health / humanoid.MaxHealth
                fill.Size = UDim2.new(healthPercent, 0, 1, 0)
                
                if healthPercent > 0.6 then
                    fill.BackgroundColor3 = Color3.fromRGB(50, 255, 50)
                elseif healthPercent > 0.3 then
                    fill.BackgroundColor3 = Color3.fromRGB(255, 255, 50)
                else
                    fill.BackgroundColor3 = Color3.fromRGB(255, 50, 50)
                end
            end
        end
        
        updateHealth()
        
        local humanoid = character:FindFirstChildOfClass("Humanoid")
        if humanoid then
            local healthConn = humanoid:GetPropertyChangedSignal("Health"):Connect(updateHealth)
            table.insert(aimbotConnections, healthConn)
        end
        
        return healthBar
    end

    -- 创建ESP对象 (自瞄版)
    local function createAimbotESPForCharacter(player, character)
        if not character or not aimbotEspEnabled then return end
        
        local localPlayer = game:GetService("Players").LocalPlayer
        local humanoidRootPart = character:FindFirstChild("HumanoidRootPart")
        local humanoid = character:FindFirstChildOfClass("Humanoid")
        
        if not humanoidRootPart or not humanoid or humanoid.Health <= 0 then return end
        
        if aimbotEspObjects[player.Name] then
            if aimbotEspObjects[player.Name].box then pcall(function() aimbotEspObjects[player.Name].box:Destroy() end) end
            if aimbotEspObjects[player.Name].nameTag then pcall(function() aimbotEspObjects[player.Name].nameTag:Destroy() end) end
            if aimbotEspObjects[player.Name].healthBar then pcall(function() aimbotEspObjects[player.Name].healthBar:Destroy() end) end
        end
        
        local isTeammate = false
        if localPlayer.Team and player.Team and localPlayer.Team == player.Team and aimbotSettings.teamCheck then
            isTeammate = true
        end
        
        local boxColor = aimbotSettings.boxColor
        if player == currentTarget then
            boxColor = aimbotSettings.targetedColor
        elseif isTeammate then
            boxColor = aimbotSettings.teammateColor
        elseif player ~= localPlayer then
            boxColor = aimbotSettings.enemyColor
        end
        
        local size = character:GetExtentsSize() + Vector3.new(0.5, 0.5, 0.5)
        local offset = size.Y / 2
        
        if aimbotSettings.showBoxes then
            local box = Instance.new("BoxHandleAdornment")
            box.Adornee = humanoidRootPart
            box.AlwaysOnTop = true
            box.ZIndex = 10
            box.Size = size
            box.Color3 = boxColor
            box.Transparency = aimbotSettings.boxTransparency
            box.Parent = humanoidRootPart
            
            aimbotEspObjects[player.Name] = aimbotEspObjects[player.Name] or {}
            aimbotEspObjects[player.Name].box = box
        end
        
        if aimbotSettings.showNames or aimbotSettings.showDistance then
            local billboard = Instance.new("BillboardGui")
            billboard.Adornee = humanoidRootPart
            billboard.Size = UDim2.new(0, 200, 0, 60)
            billboard.StudsOffset = Vector3.new(0, offset + 1, 0)
            billboard.AlwaysOnTop = true
            billboard.Parent = humanoidRootPart
            
            local nameLabel = Instance.new("TextLabel")
            nameLabel.Parent = billboard
            nameLabel.BackgroundTransparency = 1
            nameLabel.Size = UDim2.new(1, 0, 0.5, 0)
            nameLabel.Position = UDim2.new(0, 0, 0, 0)
            nameLabel.Text = player.Name
            nameLabel.TextColor3 = boxColor
            nameLabel.TextStrokeTransparency = 0.3
            nameLabel.TextStrokeColor3 = Color3.new(0, 0, 0)
            nameLabel.Font = Enum.Font.SourceSansBold
            nameLabel.TextScaled = true
            
            local distanceLabel = Instance.new("TextLabel")
            distanceLabel.Parent = billboard
            distanceLabel.BackgroundTransparency = 1
            distanceLabel.Size = UDim2.new(1, 0, 0.5, 0)
            distanceLabel.Position = UDim2.new(0, 0, 0.5, 0)
            distanceLabel.Text = "0m"
            distanceLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
            distanceLabel.TextStrokeTransparency = 0.3
            distanceLabel.TextStrokeColor3 = Color3.new(0, 0, 0)
            distanceLabel.Font = Enum.Font.SourceSans
            distanceLabel.TextScaled = true
            
            if aimbotSettings.showDistance then
                local updateDistance = function()
                    if localPlayer.Character and localPlayer.Character:FindFirstChild("HumanoidRootPart") then
                        local myRoot = localPlayer.Character.HumanoidRootPart
                        local dist = (myRoot.Position - humanoidRootPart.Position).Magnitude
                        distanceLabel.Text = math.floor(dist) .. "m"
                    end
                end
                
                updateDistance()
                local distConn = game:GetService("RunService").RenderStepped:Connect(updateDistance)
                table.insert(aimbotConnections, distConn)
            else
                distanceLabel.Visible = false
            end
            
            if not aimbotSettings.showNames then
                nameLabel.Visible = false
            end
            
            aimbotEspObjects[player.Name] = aimbotEspObjects[player.Name] or {}
            aimbotEspObjects[player.Name].nameTag = billboard
        end
        
        if aimbotSettings.showHealth then
            local healthBar = createAimbotHealthBar(character, humanoidRootPart, size)
            if healthBar then
                aimbotEspObjects[player.Name] = aimbotEspObjects[player.Name] or {}
                aimbotEspObjects[player.Name].healthBar = healthBar
            end
        end
    end

    -- 设置自瞄ESP
    local function setupAimbotESP()
        clearAimbotESP()
        if not aimbotEspEnabled then return end
        
        local Players = game:GetService("Players")
        local localPlayer = Players.LocalPlayer
        
        for _, player in ipairs(Players:GetPlayers()) do
            if player ~= localPlayer then
                if player.Character then
                    task.wait(0.05)
                    createAimbotESPForCharacter(player, player.Character)
                end
            end
        end
    end

    -- 获取最佳目标
    local function getBestTarget()
        local localPlayer = game:GetService("Players").LocalPlayer
        local camera = workspace.CurrentCamera
        local bestTarget = nil
        local bestDistance = aimbotSettings.aimFov
        
        for _, player in ipairs(game:GetService("Players"):GetPlayers()) do
            if player ~= localPlayer and player.Character and player.Character:FindFirstChild(aimbotSettings.aimPart) then
                if aimbotSettings.teamCheck and localPlayer.Team and player.Team and localPlayer.Team == player.Team then
                    continue
                end
                
                local targetPart = player.Character[aimbotSettings.aimPart]
                local targetPos, onScreen = camera:WorldToViewportPoint(targetPart.Position)
                
                if onScreen then
                    if aimbotSettings.visibleCheck then
                        local ray = Ray.new(camera.CFrame.Position, (targetPart.Position - camera.CFrame.Position).Unit * 1000)
                        local hit, pos = workspace:FindPartOnRayWithIgnoreList(ray, {localPlayer.Character, camera})
                        if hit and not hit:IsDescendantOf(player.Character) then
                            continue
                        end
                    end
                    
                    local screenCenter = Vector2.new(camera.ViewportSize.X / 2, camera.ViewportSize.Y / 2)
                    local targetVec = Vector2.new(targetPos.X, targetPos.Y)
                    local distance = (targetVec - screenCenter).Magnitude
                    
                    if distance < bestDistance then
                        bestDistance = distance
                        bestTarget = player
                    end
                end
            end
        end
        
        return bestTarget
    end

    -- 执行瞄准
    local function doAimbot()
        if not aimbotEnabled then return end
        
        local localPlayer = game:GetService("Players").LocalPlayer
        local userInputService = game:GetService("UserInputService")
        
        local isKeyPressed = false
        if aimbotSettings.aimKey == "MouseButton2" then
            isKeyPressed = userInputService:IsMouseButtonPressed(Enum.UserInputType.MouseButton2)
        elseif aimbotSettings.aimKey == "MouseButton1" then
            isKeyPressed = userInputService:IsMouseButtonPressed(Enum.UserInputType.MouseButton1)
        else
            isKeyPressed = userInputService:IsKeyDown(Enum.KeyCode[aimbotSettings.aimKey])
        end
        
        if not isKeyPressed then
            if currentTarget then
                if aimbotEspEnabled and aimbotEspObjects[currentTarget.Name] and aimbotEspObjects[currentTarget.Name].box then
                    local isTeammate = false
                    if localPlayer.Team and currentTarget.Team and localPlayer.Team == currentTarget.Team and aimbotSettings.teamCheck then
                        isTeammate = true
                    end
                    aimbotEspObjects[currentTarget.Name].box.Color3 = isTeammate and aimbotSettings.teammateColor or aimbotSettings.enemyColor
                end
                currentTarget = nil
            end
            if targetLine then targetLine.Visible = false end
            return
        end
        
        currentTarget = getBestTarget()
        
        if currentTarget and currentTarget.Character and currentTarget.Character:FindFirstChild(aimbotSettings.aimPart) then
            if aimbotEspEnabled and aimbotEspObjects[currentTarget.Name] and aimbotEspObjects[currentTarget.Name].box then
                aimbotEspObjects[currentTarget.Name].box.Color3 = aimbotSettings.targetedColor
            end
            
            local targetPart = currentTarget.Character[aimbotSettings.aimPart]
            local camera = workspace.CurrentCamera
            
            local prediction = aimbotSettings.prediction
            if prediction > 0 and targetPart:FindFirstChild("AssemblyLinearVelocity") then
                targetPart.Position = targetPart.Position + targetPart.AssemblyLinearVelocity * prediction
            end
            
            local targetPos = targetPart.Position
            local currentCamPos = camera.CFrame.Position
            local targetCFrame = CFrame.lookAt(currentCamPos, targetPos)
            local smoothness = aimbotSettings.aimSmoothness / 10
            local newCFrame = camera.CFrame:Lerp(targetCFrame, smoothness)
            
            camera.CFrame = newCFrame
        end
        
        updateTargetLine()
    end

    -- 初始化自瞄连接
    local function setupAimbot()
        for _, conn in ipairs(aimbotConnections) do
            pcall(function() conn:Disconnect() end)
        end
        aimbotConnections = {}
        
        if not aimbotEnabled then
            if fovCircle then fovCircle.Visible = false end
            if targetLine then targetLine.Visible = false end
            currentTarget = nil
            return
        end
        
        createFovCircle()
        createTargetLine()
        
        local renderConn = game:GetService("RunService").RenderStepped:Connect(function()
            doAimbot()
            if aimbotEspEnabled then
                if currentTarget and aimbotEspObjects[currentTarget.Name] and aimbotEspObjects[currentTarget.Name].box then
                    aimbotEspObjects[currentTarget.Name].box.Color3 = aimbotSettings.targetedColor
                end
            end
        end)
        table.insert(aimbotConnections, renderConn)
        
        local Players = game:GetService("Players")
        local playerAddedConn = Players.PlayerAdded:Connect(function(player)
            if aimbotEspEnabled and player ~= Players.LocalPlayer then
                player.CharacterAdded:Connect(function(character)
                    task.wait(1)
                    createAimbotESPForCharacter(player, character)
                end)
            end
        end)
        table.insert(aimbotConnections, playerAddedConn)
        
        if fovCircle then fovCircle.Visible = true end
    end

    -- 自瞄UI元素
    TabHandles.SelfAiming:Paragraph({
        Title = "高级自瞄系统",
        Desc = "包含ESP透视与智能瞄准",
        Image = "target",
        ImageSize = 20,
        Color = Color3.fromHex("#FF6B6B"),
    })

    -- 自瞄总开关
    local aimbotMainToggle = TabHandles.SelfAiming:Toggle({
        Title = "启用自瞄",
        Desc = "开启自瞄功能",
        Default = false,
        Callback = function(state)
            aimbotEnabled = state
            setupAimbot()
            WindUI:Notify({
                Title = "自瞄",
                Content = state and "已启用" or "已禁用",
                Icon = state and "target" or "target-off",
                Duration = 2
            })
        end
    })

    -- ESP开关
    local aimbotEspToggle = TabHandles.SelfAiming:Toggle({
        Title = "启用自瞄ESP",
        Desc = "显示自瞄专用透视",
        Default = false,
        Callback = function(state)
            aimbotEspEnabled = state
            if state then
                setupAimbotESP()
            else
                clearAimbotESP()
            end
            WindUI:Notify({
                Title = "自瞄ESP",
                Content = state and "已启用" or "已禁用",
                Duration = 1.5
            })
        end
    })

    TabHandles.SelfAiming:Divider()

    -- 自瞄设置
    TabHandles.SelfAiming:Paragraph({
        Title = "自瞄设置",
        Desc = "调整瞄准参数",
        Image = "settings",
        ImageSize = 16,
    })

    -- 瞄准部位选择
    local aimPartDropdown = TabHandles.SelfAiming:Dropdown({
        Title = "瞄准部位",
        Desc = "选择瞄准的身体部位",
        Values = {"Head", "HumanoidRootPart", "Torso", "UpperTorso", "LowerTorso"},
        Default = "Head",
        Callback = function(value)
            aimbotSettings.aimPart = value
        end
    })

    -- 瞄准键选择
    local aimKeyDropdown = TabHandles.SelfAiming:Dropdown({
        Title = "瞄准键",
        Desc = "选择触发自瞄的按键",
        Values = {"MouseButton2", "MouseButton1", "E", "Q", "F", "LeftShift", "LeftControl"},
        Default = "MouseButton2",
        Callback = function(value)
            aimbotSettings.aimKey = value
        end
    })

    -- 自瞄范围滑块
    local aimFovSlider = TabHandles.SelfAiming:Slider({
        Title = "自瞄范围",
        Desc = "设置瞄准范围 (像素)",
        Min = 50,
        Max = 500,
        Default = 150,
        Increment = 10,
        Callback = function(value)
            aimbotSettings.aimFov = value
            updateFovCircle()
        end
    })

    -- 平滑度滑块
    local aimSmoothSlider = TabHandles.SelfAiming:Slider({
        Title = "平滑度",
        Desc = "1(最平滑) - 10(最快速)",
        Min = 1,
        Max = 10,
        Default = 5,
        Increment = 1,
        Callback = function(value)
            aimbotSettings.aimSmoothness = value
        end
    })

    -- 预测时间滑块
    local predictionSlider = TabHandles.SelfAiming:Slider({
        Title = "子弹预测",
        Desc = "预测移动目标的位置",
        Min = 0,
        Max = 0.5,
        Default = 0.1,
        Increment = 0.05,
        Callback = function(value)
            aimbotSettings.prediction = value
        end
    })

    TabHandles.SelfAiming:Divider()

    -- 自瞄选项
    TabHandles.SelfAiming:Paragraph({
        Title = "自瞄选项",
        Desc = "其他瞄准设置",
        Image = "check-circle",
        ImageSize = 16,
    })

    -- 队伍检测开关
    local aimbotTeamCheckToggle = TabHandles.SelfAiming:Toggle({
        Title = "队伍检测",
        Desc = "不瞄准队友",
        Default = true,
        Callback = function(state)
            aimbotSettings.teamCheck = state
        end
    })

    -- 可见性检测开关
    local aimbotVisibleCheckToggle = TabHandles.SelfAiming:Toggle({
        Title = "可见性检测",
        Desc = "只瞄准可见的敌人",
        Default = false,
        Callback = function(state)
            aimbotSettings.visibleCheck = state
        end
    })

    -- 显示FOV圆圈开关
    local showFovCircleToggle = TabHandles.SelfAiming:Toggle({
        Title = "显示FOV圆圈",
        Desc = "在屏幕上显示瞄准范围",
        Default = true,
        Callback = function(state)
            aimbotSettings.showFovCircle = state
            if state and aimbotEnabled then
                createFovCircle()
            elseif fovCircle then
                fovCircle.Visible = state
            end
        end
    })

    -- FOV圆圈颜色
    local fovCircleColorPicker = TabHandles.SelfAiming:ColorPicker({
        Title = "FOV圆圈颜色",
        Desc = "选择FOV圆圈的颜色",
        Default = Color3.fromRGB(255, 255, 255),
        Callback = function(color)
            aimbotSettings.fovCircleColor = color
            if fovCircle then
                fovCircle.ImageColor3 = color
            end
        end
    })

    -- 显示瞄准线开关
    local showTargetLineToggle = TabHandles.SelfAiming:Toggle({
        Title = "显示瞄准线",
        Desc = "显示指向目标的线条",
        Default = true,
        Callback = function(state)
            aimbotSettings.showTargetLine = state
            if not state and targetLine then
                targetLine.Visible = false
            end
        end
    })

    TabHandles.SelfAiming:Divider()

    -- ESP设置
    TabHandles.SelfAiming:Paragraph({
        Title = "ESP设置",
        Desc = "自定义透视显示",
        Image = "eye",
        ImageSize = 16,
    })

    -- 敌人颜色
    local aimbotEnemyColorPicker = TabHandles.SelfAiming:ColorPicker({
        Title = "敌人颜色",
        Desc = "敌人方框颜色",
        Default = Color3.fromRGB(255, 0, 0),
        Callback = function(color)
            aimbotSettings.enemyColor = color
            if aimbotEspEnabled then
                setupAimbotESP()
            end
        end
    })

    -- 队友颜色
    local aimbotTeammateColorPicker = TabHandles.SelfAiming:ColorPicker({
        Title = "队友颜色",
        Desc = "队友方框颜色",
        Default = Color3.fromRGB(0, 255, 0),
        Callback = function(color)
            aimbotSettings.teammateColor = color
            if aimbotEspEnabled then
                setupAimbotESP()
            end
        end
    })

    -- 目标颜色
    local aimbotTargetColorPicker = TabHandles.SelfAiming:ColorPicker({
        Title = "目标颜色",
        Desc = "当前瞄准的目标颜色",
        Default = Color3.fromRGB(255, 255, 0),
        Callback = function(color)
            aimbotSettings.targetedColor = color
            if aimbotEspEnabled and currentTarget and aimbotEspObjects[currentTarget.Name] and aimbotEspObjects[currentTarget.Name].box then
                aimbotEspObjects[currentTarget.Name].box.Color3 = color
            end
        end
    })

    -- ESP透明度滑块
    local aimbotEspTransparencySlider = TabHandles.SelfAiming:Slider({
        Title = "ESP透明度",
        Desc = "调整方框透明度",
        Min = 0,
        Max = 1,
        Default = 0.5,
        Increment = 0.1,
        Callback = function(value)
            aimbotSettings.boxTransparency = value
            for _, data in pairs(aimbotEspObjects) do
                if data.box then
                    data.box.Transparency = value
                end
            end
        end
    })

    TabHandles.SelfAiming:Divider()

    -- ESP显示选项
    local aimbotShowBoxesToggle = TabHandles.SelfAiming:Toggle({
        Title = "显示方框",
        Desc = "显示玩家方框",
        Default = true,
        Callback = function(state)
            aimbotSettings.showBoxes = state
            if aimbotEspEnabled then
                setupAimbotESP()
            end
        end
    })

    local aimbotShowNamesToggle = TabHandles.SelfAiming:Toggle({
        Title = "显示名字",
        Desc = "显示玩家名字",
        Default = true,
        Callback = function(state)
            aimbotSettings.showNames = state
            if aimbotEspEnabled then
                setupAimbotESP()
            end
        end
    })

    local aimbotShowDistanceToggle = TabHandles.SelfAiming:Toggle({
        Title = "显示距离",
        Desc = "显示玩家距离",
        Default = true,
        Callback = function(state)
            aimbotSettings.showDistance = state
            if aimbotEspEnabled then
                setupAimbotESP()
            end
        end
    })

    local aimbotShowHealthToggle = TabHandles.SelfAiming:Toggle({
        Title = "显示血量",
        Desc = "显示血量条",
        Default = true,
        Callback = function(state)
            aimbotSettings.showHealth = state
            if aimbotEspEnabled then
                setupAimbotESP()
            end
        end
    })

    TabHandles.SelfAiming:Divider()

    -- 刷新按钮
    local aimbotRefreshButton = TabHandles.SelfAiming:Button({
        Title = "刷新ESP",
        Icon = "refresh-cw",
        Variant = "Secondary",
        Callback = function()
            if aimbotEspEnabled then
                setupAimbotESP()
                WindUI:Notify({
                    Title = "自瞄ESP",
                    Content = "已刷新",
                    Duration = 1
                })
            end
        end
    })

    -- 重置颜色按钮
    local aimbotResetColorsButton = TabHandles.SelfAiming:Button({
        Title = "重置颜色",
        Icon = "rotate-ccw",
        Variant = "Secondary",
        Callback = function()
            aimbotSettings.enemyColor = Color3.fromRGB(255, 0, 0)
            aimbotSettings.teammateColor = Color3.fromRGB(0, 255, 0)
            aimbotSettings.targetedColor = Color3.fromRGB(255, 255, 0)
            aimbotSettings.fovCircleColor = Color3.fromRGB(255, 255, 255)
            
            aimbotEnemyColorPicker:Set(Color3.fromRGB(255, 0, 0))
            aimbotTeammateColorPicker:Set(Color3.fromRGB(0, 255, 0))
            aimbotTargetColorPicker:Set(Color3.fromRGB(255, 255, 0))
            fovCircleColorPicker:Set(Color3.fromRGB(255, 255, 255))
            
            if aimbotEspEnabled then
                setupAimbotESP()
            end
            if fovCircle then
                fovCircle.ImageColor3 = Color3.fromRGB(255, 255, 255)
            end
            
            WindUI:Notify({
                Title = "颜色已重置",
                Content = "所有颜色已恢复默认",
                Duration = 1.5
            })
        end
    })

    -- 窗口关闭清理
    Window:OnClose(function()
        print("旧冬v6.0 - 窗口已关闭")
        
        if _G.Noclip then
            _G.Noclip = false
            if _G.NoclipConnection then
                _G.NoclipConnection:Disconnect()
                _G.NoclipConnection = nil
            end
        end
        
        if _G.InfiniteJumpEnabled then
            _G.InfiniteJumpEnabled = false
            if _G.InfiniteJumpConnection then
                _G.InfiniteJumpConnection:Disconnect()
                _G.InfiniteJumpConnection = nil
            end
        end
        
        if _G.fpsConnection then
            _G.fpsConnection:Disconnect()
            _G.fpsConnection = nil
        end
        
        if _G.killAuraConfig then
            _G.killAuraConfig.isRunning = false
            if _G.killAuraConfig.connection then
                _G.killAuraConfig.connection:Disconnect()
            end
            _G.killAuraConfig = nil
        end
        
        if _G.flyOffEnabled then
            _G.flyOffEnabled = false
            if _G.flyOffConnections then
                for _, conn in ipairs(_G.flyOffConnections) do
                    if conn then
                        conn:Disconnect()
                    end
                end
                _G.flyOffConnections = nil
            end
        end
        
        local Lighting = game:GetService("Lighting")
        if _G.originalAmbient then
            Lighting.Ambient = _G.originalAmbient
            _G.originalAmbient = nil
        end
        
        if _G.originalOutdoorAmbient then
            Lighting.OutdoorAmbient = _G.originalOutdoorAmbient
            _G.originalOutdoorAmbient = nil
        end
        
        if _G.originalMaxHealth then
            local character = game.Players.LocalPlayer.Character
            if character then
                local humanoid = character:FindFirstChildOfClass("Humanoid")
                if humanoid then
                    humanoid.MaxHealth = _G.originalMaxHealth
                    humanoid.Health = math.min(_G.originalHealth or 100, _G.originalMaxHealth)
                end
            end
            _G.originalMaxHealth = nil
            _G.originalHealth = nil
        end
        
        if _G.loopTeleportConnection then
            _G.loopTeleportConnection:Disconnect()
            _G.loopTeleportConnection = nil
        end
        
        if viewingTarget then
            local camera = workspace.CurrentCamera
            if _G.originalCameraSubject then
                camera.CameraSubject = _G.originalCameraSubject
                camera.CameraType = Enum.CameraType.Custom
                _G.originalCameraSubject = nil
                _G.originalCameraCFrame = nil
            end
        end
        
        for _, conn in ipairs(aimbotConnections) do
            pcall(function() conn:Disconnect() end)
        end
        aimbotConnections = {}
        clearAimbotESP()
        if fovCircle then pcall(function() fovCircle:Destroy() end) end
        if targetLine then pcall(function() targetLine:Destroy() end) end
        
        clearESP()
        
        local playerGui = game.Players.LocalPlayer:FindFirstChild("PlayerGui")
        if playerGui then
            local fpsGui = playerGui:FindFirstChild("FPSGui")
            if fpsGui then
                fpsGui:Destroy()
            end
            local aimbotGui = playerGui:FindFirstChild("AimbotScreenGui")
            if aimbotGui then
                aimbotGui:Destroy()
            end
        end
        
        local character = game.Players.LocalPlayer.Character
        if character then
            local humanoid = character:FindFirstChildOfClass("Humanoid")
            if humanoid then
                humanoid.WalkSpeed = 16
                humanoid.JumpPower = 50
            end
        end
    end)
    
    task.wait(1)
    WindUI:Notify({
        Title = "旧冬v6.0",
        Content = "加载完成",
        Icon = "check",
        Duration = 3
    })
end