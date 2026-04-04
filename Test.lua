local WindUI = loadstring(game:HttpGet("https://raw.githubusercontent.com/Footagesus/WindUI/main/dist/main.lua"))()

WindUI:Localization({
    Enabled = true,
    Prefix = "loc",
    DefaultLanguage = "zh",
    Translations = {
        ["zh"] = {
            ["WINDUI_EXAMPLE"] = "WindUI 示例",
            ["WELCOME"] = "欢迎使用 WindUI！",
            ["LIB_DESC"] = "用于创建漂亮界面的库",
            ["SETTINGS"] = "设置",
            ["APPEARANCE"] = "外观",
            ["FEATURES"] = "功能",
            ["UTILITIES"] = "工具",
            ["UI_ELEMENTS"] = "界面元素",
            ["CONFIGURATION"] = "配置",
            ["SAVE_CONFIG"] = "保存配置",
            ["LOAD_CONFIG"] = "加载配置",
            ["THEME_SELECT"] = "选择主题",
            ["TRANSPARENCY"] = "窗口透明度"
        }
    }
})

WindUI.TransparencyValue = 0.2
WindUI:SetTheme("Dark")

local function gradient(text, startColor, endColor)
    local result = ""
    for i = 1, #text do
        local t = (i - 1) / (#text - 1)
        local r = math.floor((startColor.R + (endColor.R - startColor.R) * t) * 255)
        local g = math.floor((startColor.G + (endColor.G - startColor.G) * t) * 255)
        local b = math.floor((startColor.B + (endColor.B - startColor.B) * t) * 255)
        result = result .. string.format('<font color="rgb(%d,%d,%d)">%s</font>', r, g, b, text:sub(i, i))
    end
    return result
end

local popupConfirmed = false

WindUI:Popup({
    Title = gradient("OldWinter | v6.5", Color3.fromHex("#6A11CB"), Color3.fromHex("#2575FC")),
    Icon = "sparkles",
    Content = "欢迎使用旧冬v6.5\n此版本更新完后\n将不再由小徐进行更新与维护\n由LitYu(李涛宇)接手",
    Buttons = {
        {
            Title = "开始使用",
            Icon = "arrow-right",
            Variant = "Primary",
            Callback = function() 
                popupConfirmed = true
            end
        }
    }
})

-- 等待用户确认
repeat task.wait() until popupConfirmed == true

local Window = WindUI:CreateWindow({
    Title = "旧冬Hub",
    Icon = "zap",
    Author = "v6.5 - by小徐",
    Folder = "旧冬Hub",
    Size = UDim2.fromOffset(700, 500),
    Theme = "Dark",
    Background = "https://raw.githubusercontent.com/XiaoXuCynic/Old-Winter-Script/refs/heads/main/df774d3f32578f5198ea8d7b78b31451.jpeg",
    User = {
        Enabled = true,
        Anonymous = true,
        Callback = function()
            WindUI:Notify({
                Title = "用户资料",
                Content = "用户资料被点击！",
                Duration = 3
            })
        end
    },
    SideBarWidth = 220,
    ScrollBarEnabled = true
})

-- 编辑打开按钮
Window:EditOpenButton({
    Title = "旧冬Hub",
    Icon = "crown",
    CornerRadius = UDim.new(0,16),
    StrokeThickness = 4,
    Color = ColorSequence.new(Color3.fromHex("FF6B6B")),
    Draggable = true,
})

-- 添加标签
Window:Tag({
    Title = "v6.5",
    Color = Color3.fromHex("#30ff6a")
})
Window:Tag({
    Title = "Kuraki",
    Color = Color3.fromHex("#315dff")
})
Window:Tag({
    Title = "旧冬Hub",
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
    while task.wait(30) do
        local now = os.date("*t")
        local hours = string.format("%02d", now.hour)
        local minutes = string.format("%02d", now.min)
        
        if TimeTag and TimeTag.SetTitle then
            TimeTag:SetTitle(hours .. ":" .. minutes)
        end
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
    Aimbot = Window:Section({ Title = "通用自瞄" ,Opened = true }),
    LinSky = Window:Section({ Title = "天空修改(测试)", Opened = true }),
}

-- 创建所有Tab
local TabHandles = {
    Elements = Tabs.Main:Tab({ 
        Title = "功能",
        Icon = "layout-grid"
    }),
    Appearance = Tabs.Settings:Tab({ 
        Title = "修改背景",
        Icon = "brush" 
    }),
    Config = Tabs.Utilities:Tab({ 
        Title = "配置",
        Icon = "settings" 
    }),
    LiJian = Tabs.FE:Tab({
        Title = "FE脚本",
        Icon = "play"
    }),
    XiaoXu = Tabs.Script:Tab({
        Title = "制作脚本的工具",
        Icon = "crown"
    }),
    Pharaoh = Tabs.ESP:Tab({
        Title = "ESP/透视",
        Icon = "play"
    }),
    LTY = Tabs.Server:Tab({
        Title = "服务器脚本",
        Icon = "zap"
    }),
    ZSH = Tabs.Other:Tab({
        Title = "其他作者的脚本",
        Icon = "info"
    }),
    Real = Tabs.Aimbot:Tab({
        Title = "自瞄",
        Icon = "user"
    }),
    Sky = Tabs.LinSky:Tab({
        Title = "天空修改",
        Icon = "cloud"
    })
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
    Value = { Min = 0, Max = 100, Default = 50 },
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

-- 跳跃滑块
local JumpSlider = TabHandles.Elements:Slider({
    Title = "跳跃高度",
    Desc = "调整跳跃高度",
    Value = { Min = 0, Max = 200, Default = 50 },
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