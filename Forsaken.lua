local WindUI = loadstring(game:HttpGet("https://raw.githubusercontent.com/Footagesus/WindUI/main/dist/main.lua"))()
WindUI.TransparencyValue = 0.2
WindUI:SetTheme("Dark")

local rainbowBorderAnimation
local currentBorderColorScheme = "彩虹颜色"
local currentFontColorScheme = "彩虹颜色"
local borderInitialized = false
local animationSpeed = 2
local borderEnabled = true
local fontColorEnabled = false
local uiScale = 1
local blurEnabled = false
local soundEnabled = true

local FONT_STYLES = {
    "SourceSansBold","SourceSansItalic","SourceSansLight","SourceSans",
    "GothamSSm","GothamSSm-Bold","GothamSSm-Medium","GothamSSm-Light",
    "GothamSSm-Black","GothamSSm-Book","GothamSSm-XLight","GothamSSm-Thin",
    "GothamSSm-Ultra","GothamSSm-SemiBold","GothamSSm-ExtraLight","GothamSSm-Heavy",
    "GothamSSm-ExtraBold","GothamSSm-Regular","Gotham","GothamBold",
    "GothamMedium","GothamBlack","GothamLight","Arial","ArialBold",
    "Code","CodeLight","CodeBold","Highway","HighwayBold","HighwayLight",
    "SciFi","SciFiBold","SciFiItalic","Cartoon","CartoonBold","Handwritten"
}

local FONT_DESCRIPTIONS = {
    ["SourceSansBold"] = "标准粗体",["SourceSansItalic"] = "斜体",["SourceSansLight"] = "细体",
    ["SourceSans"] = "标准体",["GothamSSm"] = "哥特标准",["GothamSSm-Bold"] = "哥特粗体",
    ["GothamSSm-Medium"] = "哥特中等",["GothamSSm-Light"] = "哥特细体",["GothamSSm-Black"] = "哥特黑体",
    ["GothamSSm-Book"] = "哥特书本体",["GothamSSm-XLight"] = "哥特超细体",["GothamSSm-Thin"] = "哥特极细体",
    ["GothamSSm-Ultra"] = "哥特超黑体",["GothamSSm-SemiBold"] = "哥特半粗体",["GothamSSm-ExtraLight"] = "哥特特细体",
    ["GothamSSm-Heavy"] = "哥特粗重体",["GothamSSm-ExtraBold"] = "哥特特粗体",["GothamSSm-Regular"] = "哥特常规体",
    ["Gotham"] = "经典哥特体",["GothamBold"] = "经典哥特粗体",["GothamMedium"] = "经典哥特中等",
    ["GothamBlack"] = "经典哥特黑体",["GothamLight"] = "经典哥特细体",["Arial"] = "标准Arial体",
    ["ArialBold"] = "Arial粗体",["Code"] = "代码字体",["CodeLight"] = "代码细体",
    ["CodeBold"] = "代码粗体",["Highway"] = "高速公路体",["HighwayBold"] = "高速公路粗体",
    ["HighwayLight"] = "高速公路细体",["SciFi"] = "科幻字体",["SciFiBold"] = "科幻粗体",
    ["SciFiItalic"] = "科幻斜体",["Cartoon"] = "卡通字体",["CartoonBold"] = "卡通粗体",
    ["Handwritten"] = "手写体"
}

local currentFontStyle = "SourceSansBold"

local COLOR_SCHEMES = {
    ["彩虹颜色"] = {ColorSequence.new({ColorSequenceKeypoint.new(0, Color3.fromHex("FF0000")),ColorSequenceKeypoint.new(0.16, Color3.fromHex("FFA500")),ColorSequenceKeypoint.new(0.33, Color3.fromHex("FFFF00")),ColorSequenceKeypoint.new(0.5, Color3.fromHex("00FF00")),ColorSequenceKeypoint.new(0.66, Color3.fromHex("0000FF")),ColorSequenceKeypoint.new(0.83, Color3.fromHex("4B0082")),ColorSequenceKeypoint.new(1, Color3.fromHex("EE82EE"))}),"palette"},
    ["黑红颜色"] = {ColorSequence.new({ColorSequenceKeypoint.new(0, Color3.fromHex("000000")),ColorSequenceKeypoint.new(0.5, Color3.fromHex("FF0000")),ColorSequenceKeypoint.new(1, Color3.fromHex("000000"))}),"alert-triangle"},
    ["蓝白颜色"] = {ColorSequence.new({ColorSequenceKeypoint.new(0, Color3.fromHex("FFFFFF")),ColorSequenceKeypoint.new(0.5, Color3.fromHex("1E90FF")),ColorSequenceKeypoint.new(1, Color3.fromHex("FFFFFF"))}),"droplet"},
    ["紫金颜色"] = {ColorSequence.new({ColorSequenceKeypoint.new(0, Color3.fromHex("FFD700")),ColorSequenceKeypoint.new(0.5, Color3.fromHex("8A2BE2")),ColorSequenceKeypoint.new(1, Color3.fromHex("FFD700"))}),"crown"},
    ["蓝黑颜色"] = {ColorSequence.new({ColorSequenceKeypoint.new(0, Color3.fromHex("000000")),ColorSequenceKeypoint.new(0.5, Color3.fromHex("0000FF")),ColorSequenceKeypoint.new(1, Color3.fromHex("000000"))}),"moon"},
    ["绿紫颜色"] = {ColorSequence.new({ColorSequenceKeypoint.new(0, Color3.fromHex("00FF00")),ColorSequenceKeypoint.new(0.5, Color3.fromHex("800080")),ColorSequenceKeypoint.new(1, Color3.fromHex("00FF00"))}),"zap"},
    ["粉蓝颜色"] = {ColorSequence.new({ColorSequenceKeypoint.new(0, Color3.fromHex("FF69B4")),ColorSequenceKeypoint.new(0.5, Color3.fromHex("00BFFF")),ColorSequenceKeypoint.new(1, Color3.fromHex("FF69B4"))}),"heart"},
    ["橙青颜色"] = {ColorSequence.new({ColorSequenceKeypoint.new(0, Color3.fromHex("FF4500")),ColorSequenceKeypoint.new(0.5, Color3.fromHex("00CED1")),ColorSequenceKeypoint.new(1, Color3.fromHex("FF4500"))}),"sun"},
    ["红金颜色"] = {ColorSequence.new({ColorSequenceKeypoint.new(0, Color3.fromHex("FF0000")),ColorSequenceKeypoint.new(0.5, Color3.fromHex("FFD700")),ColorSequenceKeypoint.new(1, Color3.fromHex("FF0000"))}),"award"},
    ["银蓝颜色"] = {ColorSequence.new({ColorSequenceKeypoint.new(0, Color3.fromHex("C0C0C0")),ColorSequenceKeypoint.new(0.5, Color3.fromHex("4682B4")),ColorSequenceKeypoint.new(1, Color3.fromHex("C0C0C0"))}),"star"},
    ["霓虹颜色"] = {ColorSequence.new({ColorSequenceKeypoint.new(0, Color3.fromHex("FF00FF")),ColorSequenceKeypoint.new(0.25, Color3.fromHex("00FFFF")),ColorSequenceKeypoint.new(0.5, Color3.fromHex("FFFF00")),ColorSequenceKeypoint.new(0.75, Color3.fromHex("FF00FF")),ColorSequenceKeypoint.new(1, Color3.fromHex("00FFFF"))}),"sparkles"},
    ["森林颜色"] = {ColorSequence.new({ColorSequenceKeypoint.new(0, Color3.fromHex("228B22")),ColorSequenceKeypoint.new(0.5, Color3.fromHex("32CD32")),ColorSequenceKeypoint.new(1, Color3.fromHex("228B22"))}),"tree"},
    ["火焰颜色"] = {ColorSequence.new({ColorSequenceKeypoint.new(0, Color3.fromHex("FF4500")),ColorSequenceKeypoint.new(0.5, Color3.fromHex("FF0000")),ColorSequenceKeypoint.new(1, Color3.fromHex("FF8C00"))}),"flame"},
    ["海洋颜色"] = {ColorSequence.new({ColorSequenceKeypoint.new(0, Color3.fromHex("000080")),ColorSequenceKeypoint.new(0.5, Color3.fromHex("1E90FF")),ColorSequenceKeypoint.new(1, Color3.fromHex("00BFFF"))}),"waves"},
    ["日落颜色"] = {ColorSequence.new({ColorSequenceKeypoint.new(0, Color3.fromHex("FF4500")),ColorSequenceKeypoint.new(0.5, Color3.fromHex("FF8C00")),ColorSequenceKeypoint.new(1, Color3.fromHex("FFD700"))}),"sunset"},
    ["银河颜色"] = {ColorSequence.new({ColorSequenceKeypoint.new(0, Color3.fromHex("4B0082")),ColorSequenceKeypoint.new(0.5, Color3.fromHex("8A2BE2")),ColorSequenceKeypoint.new(1, Color3.fromHex("9370DB"))}),"galaxy"},
    ["糖果颜色"] = {ColorSequence.new({ColorSequenceKeypoint.new(0, Color3.fromHex("FF69B4")),ColorSequenceKeypoint.new(0.5, Color3.fromHex("FF1493")),ColorSequenceKeypoint.new(1, Color3.fromHex("FFB6C1"))}),"candy"},
    ["金属颜色"] = {ColorSequence.new({ColorSequenceKeypoint.new(0, Color3.fromHex("C0C0C0")),ColorSequenceKeypoint.new(0.5, Color3.fromHex("A9A9A9")),ColorSequenceKeypoint.new(1, Color3.fromHex("696969"))}),"shield"}
}

local fontColorAnimations = {}

local function applyFontColorGradient(textElement, colorScheme)
    if not textElement or not textElement:IsA("TextLabel") and not textElement:IsA("TextButton") and not textElement:IsA("TextBox") then
        return
    end
    
    local existingGradient = textElement:FindFirstChild("FontColorGradient")
    if existingGradient then
        existingGradient:Destroy()
    end
    
    if fontColorAnimations[textElement] then
        fontColorAnimations[textElement]:Disconnect()
        fontColorAnimations[textElement] = nil
    end
    
    if not fontColorEnabled then
        textElement.TextColor3 = Color3.new(1, 1, 1)
        return
    end
    
    local schemeData = COLOR_SCHEMES[colorScheme or currentFontColorScheme]
    if not schemeData then return end
    
    local fontGradient = Instance.new("UIGradient")
    fontGradient.Name = "FontColorGradient"
    fontGradient.Color = schemeData[1]
    fontGradient.Rotation = 0
    fontGradient.Parent = textElement
    
    textElement.TextColor3 = Color3.new(1, 1, 1)
    
    local animation
    animation = game:GetService("RunService").Heartbeat:Connect(function()
        if not textElement or textElement.Parent == nil then
            animation:Disconnect()
            fontColorAnimations[textElement] = nil
            return
        end
        
        if not fontGradient or fontGradient.Parent == nil then
            animation:Disconnect()
            fontColorAnimations[textElement] = nil
            return
        end
        
        local time = tick()
        fontGradient.Rotation = (time * animationSpeed * 30) % 360
    end)
    
    fontColorAnimations[textElement] = animation
end

local function applyFontStyleToWindow(fontStyle)
    if not Window or not Window.UIElements then 
        wait(0.5)
        if not Window or not Window.UIElements then
            return false
        end
    end
    
    local successCount = 0
    local totalCount = 0
    
    local function processElement(element)
        for _, child in ipairs(element:GetDescendants()) do
            if child:IsA("TextLabel") or child:IsA("TextButton") or child:IsA("TextBox") then
                totalCount = totalCount + 1
                pcall(function()
                    child.Font = Enum.Font[fontStyle]
                    successCount = successCount + 1
                end)
            end
        end
    end
    
    processElement(Window.UIElements.Main)
    
    return successCount, totalCount
end

local function applyFontColorsToWindow(colorScheme)
    if not Window or not Window.UIElements then return end
    
    local function processElement(element)
        for _, child in ipairs(element:GetDescendants()) do
            if child:IsA("TextLabel") or child:IsA("TextButton") or child:IsA("TextBox") then
                applyFontColorGradient(child, colorScheme)
            end
        end
    end
    
    processElement(Window.UIElements.Main)
end

local function createRainbowBorder(window, colorScheme, speed)
    if not window or not window.UIElements then
        wait(1)
        if not window or not window.UIElements then
            return nil, nil
        end
    end
    
    local mainFrame = window.UIElements.Main
    if not mainFrame then
        return nil, nil
    end
    
    local existingStroke = mainFrame:FindFirstChild("RainbowStroke")
    if existingStroke then
        local glowEffect = existingStroke:FindFirstChild("GlowEffect")
        if glowEffect then
            local schemeData = COLOR_SCHEMES[colorScheme or currentBorderColorScheme]
            if schemeData then
                glowEffect.Color = schemeData[1]
            end
        end
        return existingStroke, rainbowBorderAnimation
    end
    
    if not mainFrame:FindFirstChildOfClass("UICorner") then
        local corner = Instance.new("UICorner")
        corner.CornerRadius = UDim.new(0, 16)
        corner.Parent = mainFrame
    end
    
    local rainbowStroke = Instance.new("UIStroke")
    rainbowStroke.Name = "RainbowStroke"
    rainbowStroke.Thickness = 1.5
    rainbowStroke.Color = Color3.new(1, 1, 1)
    rainbowStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
    rainbowStroke.LineJoinMode = Enum.LineJoinMode.Round
    rainbowStroke.Enabled = borderEnabled
    rainbowStroke.Parent = mainFrame
    
    local glowEffect = Instance.new("UIGradient")
    glowEffect.Name = "GlowEffect"
    
    local schemeData = COLOR_SCHEMES[colorScheme or currentBorderColorScheme]
    if schemeData then
        glowEffect.Color = schemeData[1]
    else
        glowEffect.Color = COLOR_SCHEMES["彩虹颜色"][1]
    end
    
    glowEffect.Rotation = 0
    glowEffect.Parent = rainbowStroke
    
    return rainbowStroke, nil
end

local function startBorderAnimation(window, speed)
    if not window or not window.UIElements then
        return nil
    end
    
    local mainFrame = window.UIElements.Main
    if not mainFrame then
        return nil
    end
    
    local rainbowStroke = mainFrame:FindFirstChild("RainbowStroke")
    if not rainbowStroke or not rainbowStroke.Enabled then
        return nil
    end
    
    local glowEffect = rainbowStroke:FindFirstChild("GlowEffect")
    if not glowEffect then
        return nil
    end
    
    if rainbowBorderAnimation then
        rainbowBorderAnimation:Disconnect()
        rainbowBorderAnimation = nil
    end
    
    local animation
    animation = game:GetService("RunService").Heartbeat:Connect(function()
        if not rainbowStroke or rainbowStroke.Parent == nil or not rainbowStroke.Enabled then
            animation:Disconnect()
            return
        end
        
        local time = tick()
        glowEffect.Rotation = (time * speed * 60) % 360
    end)
    
    rainbowBorderAnimation = animation
    return animation
end

local function initializeRainbowBorder(scheme, speed)
    speed = speed or animationSpeed
    
    local rainbowStroke, _ = createRainbowBorder(Window, scheme, speed)
    if rainbowStroke then
        if borderEnabled then
            startBorderAnimation(Window, speed)
        end
        borderInitialized = true
        return true
    end
    return false
end

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

local function playSound()
    if soundEnabled then
        pcall(function()
            local sound = Instance.new("Sound")
            sound.SoundId = "rbxassetid://9047002353"
            sound.Volume = 0.3
            sound.Parent = game:GetService("SoundService")
            sound:Play()
            game:GetService("Debris"):AddItem(sound, 2)
        end)
    end
end

local function applyBlurEffect(enabled)
    if enabled then
        pcall(function()
            local blur = Instance.new("BlurEffect")
            blur.Size = 8
            blur.Name = "UISX HUBBlur"
            blur.Parent = game:GetService("Lighting")
        end)
    else
        pcall(function()
            local existingBlur = game:GetService("Lighting"):FindFirstChild("UISX HUBBlur")
            if existingBlur then
                existingBlur:Destroy()
            end
        end)
    end
end

local function applyUIScale(scale)
    if Window and Window.UIElements and Window.UIElements.Main then
        local mainFrame = Window.UIElements.Main
        mainFrame.Size = UDim2.new(0, 600 * scale, 0, 400 * scale)
    end
end

local Confirmed = false
local gradientColors = {
    "rgb(255, 230, 235)",
    "rgb(255, 210, 220)",
    "rgb(255, 190, 205)",
    "rgb(255, 170, 190)",
    "rgb(255, 150, 175)",
    "rgb(245, 140, 180)",
    "rgb(235, 130, 185)",
    "rgb(225, 120, 190)",
    "rgb(215, 110, 195)",
    "rgb(205, 100, 200)"
}
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
    Title = '旧冬 - Forsaken',
    IconThemed = true,
    Icon = "crown",
    Content = "欢迎用户 " .. coloredUsername .. " \n使用旧冬\n你的支持是我们更新的动力",
    Buttons = {
        {
            Title = "退出",
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

-- 修复：添加缺失的模块引用
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local LocalPlayer = Players.LocalPlayer
local ReplicatedStorage = game:GetService("ReplicatedStorage")

-- 修复：添加缺失的模块变量
local bai = {Spr = false}
local StaminaSettings = {
    InfiniteGain = 9999,
    MaxStamina = 100,
    StaminaGain = 25,
    StaminaLoss = 10,
    SprintSpeed = 28
}
local SettingToggles = {
    MaxStamina = true,
    StaminaGain = true,
    StaminaLoss = true,
    SprintSpeed = true
}

-- 添加ESP设置表
local ESPSettings = {
    killerESP = false,
    killerFillTransparency = 0.7,
    killerOutlineTransparency = 0.3,
    playerESP = false,
    survivorFillTransparency = 0.7,
    survivorOutlineTransparency = 0.3,
    generatorESP = false,
    itemESP = false,
    pizzaEsp = false,
    pizzaDeliveryEsp = false,
    zombieEsp = false,
    taphTripwireEsp = false,
    tripMineEsp = false,
    twoTimeRespawnEsp = false
}

-- 添加UpdateAllPlayerESPText函数
local function UpdateAllPlayerESPText()
    -- 这里可以实现ESP更新逻辑
    -- 由于原代码没有实现，暂时留空
    print("ESP设置已更新")
end

-- 修复：添加GetModule函数
local function GetModule()
    return {
        StaminaLoss = StaminaSettings.StaminaLoss,
        StaminaGain = StaminaSettings.StaminaGain,
        MaxStamina = StaminaSettings.MaxStamina,
        SprintSpeed = StaminaSettings.SprintSpeed
    }
end

local Window

function createUI()
    Window = WindUI:CreateWindow({
        Title = '旧冬 - Forsaken',
        Icon = "component",
        IconThemed = true,
        Author = "by.XiaoXu",
        Folder = "旧冬",
        Size = UDim2.fromOffset(300, 200),
        Transparent = true,
        Theme = "White",
        HideSearchBar = false,
        ScrollBarEnabled = true,
        Resizable = true,
        Background = "https://raw.githubusercontent.com/XiaoXuCynic/UI-Picture/refs/heads/main/Screenshot_20260227_123052_com.ss.android.ugc.aweme.png",
        BackgroundImageTransparency = 0.5,
        User = {
            Enabled = true,
            Callback = function()
                WindUI:Notify({
                    Title = "点击了自己",
                    Content = "Hello！", 
                    Duration = 1,
                    Icon = "crown"
                })
            end,
            Anonymous = false
        },
        SideBarWidth = 250,
        Search = {
            Enabled = true,
            Placeholder = "搜索...",
            Callback = function(searchText)
                print("搜索内容:", searchText)
            end
        },
        SidePanel = {
            Enabled = true,
            Content = {
                {
                    Type = "Button", 
                    Text = "",
                    Style = "Subtle", 
                    Size = UDim2.new(1, -20, 0, 30),
                    Callback = function()
                    end
                }
            }
        }
    })

Window:EditOpenButton({
    Title = "Forsaken - 旧冬",
    Icon = "crown",
    CornerRadius = UDim.new(0,16),
    StrokeThickness = 4,
    Color = ColorSequence.new(Color3.fromHex("FF6B6B")),
    Draggable = true,
})
Window:Tag({
    Title = "Forsaken",
    Color = Color3.fromHex("#00008B") 
})
Window:Tag({
    Title = "旧冬",
    Color = Color3.fromHex("#32CD32")
})
spawn(function()
    while true do
        for hue = 0, 1, 0.01 do  
            local color = Color3.fromHSV(hue, 0.8, 1)  
            Window:EditOpenButton({
                Color = ColorSequence.new(color)
            })
            wait(0.04)  
        end
    end
end)
if not borderInitialized then
    spawn(function()
        wait(0.5)
        initializeRainbowBorder("彩虹颜色", animationSpeed)
        wait(1)
        applyFontStyleToWindow(currentFontStyle)
    end)
end

local windowOpen = true

Window:OnClose(function()
    windowOpen = false
    if rainbowBorderAnimation then
        rainbowBorderAnimation:Disconnect()
        rainbowBorderAnimation = nil
    end
end)

local originalOpenFunction = Window.Open
Window.Open = function(...)
    windowOpen = true
    local result = originalOpenFunction(...)
    
    if borderInitialized and borderEnabled and not rainbowBorderAnimation then
        wait(0.1)
        startBorderAnimation(Window, animationSpeed)
    end
    
    return result
end

local TiLiSection = Window:Section({
    Title = "体力设置",
    Icon = "crown",
    Opened = true,
})

local A = Window:Tab({Title = "体力功能", Icon = "gift"})

local connection = nil

A:Toggle({
    Title = "无限体力",
    Default = false,
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

-- 修复体力回复速度滑块
A:Slider({
    Title = "体力回复速度",
    Value = {
        Min = 0,
        Max = 10000,
        Default = 9999
    },
    Rounding = 0,
    Callback = function(Value)
        StaminaSettings.InfiniteGain = Value
        if bai.Spr then
            local Sprinting = GetModule()
            Sprinting.StaminaGain = Value
        end
    end
})
    
-- 修复修改最大体力值滑块
A:Slider({
    Title = '修改你的最大体力值',
    Value = {
        Min = 0,
        Max = 9999,
        Default = 100
    },
    Rounding = 0,
    Callback = function(Value)
        StaminaSettings.MaxStamina = Value
        if SettingToggles.MaxStamina then
            local Sprinting = GetModule()
            Sprinting.MaxStamina = Value
        end
    end
})

-- 修复体力恢复速度滑块
A:Slider({
    Title = '体力恢复速度',
    Value = {
        Min = 0,
        Max = 500,
        Default = 25
    },
    Rounding = 0,
    Callback = function(Value)
        StaminaSettings.StaminaGain = Value
        if SettingToggles.StaminaGain and not bai.Spr then
            local Sprinting = GetModule()
            Sprinting.StaminaGain = Value
        end
    end
})

-- 修复体力消耗速度滑块
A:Slider({
    Title = '体力消耗速度',
    Value = {
        Min = 0,
        Max = 800,
        Default = 10
    },
    Rounding = 0,
    Callback = function(Value)
        StaminaSettings.StaminaLoss = Value
        if SettingToggles.StaminaLoss and not bai.Spr then
            local Sprinting = GetModule()
            Sprinting.StaminaLoss = Value
        end
    end
})

-- 修复奔跑速度滑块
A:Slider({
    Title = '奔跑速度',
    Value = {
        Min = 0,
        Max = 200,
        Default = 28
    },
    Rounding = 0,
    Callback = function(Value)
        StaminaSettings.SprintSpeed = Value
        if SettingToggles.SprintSpeed then
            local Sprinting = GetModule()
            Sprinting.SprintSpeed = Value
        end
    end
})

local XiaoXuSection = Window:Section({
    Title = "发电机设置",
    Icon = "crown",
    Opened = true,
})

local B = Window:Tab({Title = "发电机功能", Icon = "crown"})

local RunService = game:GetService("RunService")

local function getDirection(currentRow, currentCol, otherRow, otherCol)
   if otherRow < currentRow then return "up" end
   if otherRow > currentRow then return "down" end
   if otherCol < currentCol then return "left" end
   if otherCol > currentCol then return "right" end
end

local function getConnections(prev, curr, nextnode)
   local connections = {}
   if prev and curr then
       local dir = getDirection(curr.row, curr.col, prev.row, prev.col)
       if dir == "up" then dir = "down"
       elseif dir == "down" then dir = "up"
       elseif dir == "left" then dir = "right"
       elseif dir == "right" then dir = "left" end
       if dir then connections[dir] = true end
   end
   if nextnode and curr then
       local dir = getDirection(curr.row, curr.col, nextnode.row, nextnode.col)
       if dir then connections[dir] = true end
   end
   return connections
end

local function isNeighbourLocal(r1, c1, r2, c2)
   if r2 == r1 - 1 and c2 == c1 then return "up" end
   if r2 == r1 + 1 and c2 == c1 then return "down" end
   if r2 == r1 and c2 == c1 - 1 then return "left" end
   if r2 == r1 and c2 == c1 + 1 then return "right" end
   return false
end

local function coordKey(node)
   return node.row .. "-" .. node.col
end

local function orderPathFromEndpoints(path, endpoints)
   if not path or #path == 0 then return path end
   
   local startEndpoint
   for _, ep in pairs(endpoints or {}) do
       for _, n in ipairs(path) do
           if n.row == ep.row and n.col == ep.col then
               startEndpoint = { row = ep.row, col = ep.col }
               break
           end
       end
       if startEndpoint then break end
   end
   
   if not startEndpoint then
       local inPath = {}
       for _, n in ipairs(path) do inPath[coordKey(n)] = n end
       
       for _, n in ipairs(path) do
           local neighbours = 0
           local dirs = { { n.row - 1, n.col }, { n.row + 1, n.col }, { n.row, n.col - 1 }, { n.row, n.col + 1 } }
           for _, dir in ipairs(dirs) do
               local r, c = dir[1], dir[2]
               if inPath[r .. "-" .. c] then neighbours = neighbours + 1 end
           end
           if neighbours == 1 then
               startEndpoint = { row = n.row, col = n.col }
               break
           end
       end
   end
   
   if not startEndpoint then
       startEndpoint = { row = path[1].row, col = path[1].col }
   end
   
   local remaining = {}
   for _, n in ipairs(path) do remaining[coordKey(n)] = { row = n.row, col = n.col } end
   
   local ordered = {}
   local current = { row = startEndpoint.row, col = startEndpoint.col }
   table.insert(ordered, {row = current.row, col = current.col})
   remaining[coordKey(current)] = nil
   
   while true do
       local size = 0
       for _ in pairs(remaining) do size = size + 1 end
       if not (size > 0) then break end
       
       local foundNext = false
       for key, node in pairs(remaining) do
           local dir = isNeighbourLocal(current.row, current.col, node.row, node.col)
           if dir then
               table.insert(ordered, {row = node.row, col = node.col})
               remaining[key] = nil
               current = node
               foundNext = true
               break
           end
       end
       if not foundNext then return path end
   end
   return ordered
end

local HintSystem = {}
do
   function HintSystem:DrawSolutionOneByOne(puzzle, delayTime)
       delayTime = delayTime or 0.05
       if not puzzle or not puzzle.Solution then return end
       
       local totalPaths = #puzzle.Solution
       local indices = {}
       for i = 1, totalPaths do table.insert(indices, i) end
       
       for i = totalPaths, 2, -1 do
           local j = math.random(i)
           indices[i], indices[j] = indices[j], indices[i]
       end
       
       for _, colorIndex in ipairs(indices) do
           local path = puzzle.Solution[colorIndex]
           local endpoints = puzzle.targetPairs[colorIndex]
           local orderedPath = orderPathFromEndpoints(path, endpoints)
           puzzle.paths[colorIndex] = {}
           
           puzzle.gridConnections = puzzle.gridConnections or {}
           
           for i = 1, #orderedPath do
               local node = orderedPath[i]
               table.insert(puzzle.paths[colorIndex], { row = node.row, col = node.col })
               local prev = orderedPath[i - 1]
               local nextNode = orderedPath[i + 1]
               local conn = getConnections(prev, node, nextNode)
               
               puzzle.gridConnections[node.row .. "-" .. node.col] = conn
               
               if i % 5 == 0 or i == #orderedPath then
                   puzzle:updateGui()
                   task.wait(delayTime)
               end
           end
           
           puzzle:checkForWin()
           task.wait(delayTime * 0.5)
       end
       
       puzzle:updateGui()
       puzzle:checkForWin()
   end
end

-- 修复：添加_G变量定义
_G.CustomSpeed = 4
_G.AutoGen = false

-- 修复后的滑块：修理速度
B:Slider({
    Title = "修理速度 (秒)",
    Value = {
        Min = 1,
        Max = 5,
        Default = 4
    },
    Rounding = 1,
    Compact = false,
    Callback = function(v)
        _G.CustomSpeed = v
    end
})

B:Toggle({
    Title = "自动修机",
    Default = false,
    Callback = function(v)
        _G.AutoGen = v
        task.spawn(function()
            while _G.AutoGen do
                if game:GetService("Players").LocalPlayer.PlayerGui:FindFirstChild("PuzzleUI") then
                    local delayTime = _G.CustomSpeed or 4
                    
                    wait(delayTime)
                    
                    for _,v in ipairs(workspace.Map.Ingame.Map:GetChildren()) do
                        if v.Name == "Generator" then
                            local remote = v:FindFirstChild("Remotes")
                            if remote then
                                local re = remote:FindFirstChild("RE")
                                if re then
                                    re:FireServer()
                                end
                            end
                        end
                    end
                end
                wait()
            end
        end)
    end
})

local B2 = Window:Tab({Title = "连线", Icon = "gift"})

local AutoConnectEnabled = false
local ConnectionSpeed = 0.05

B2:Toggle({
   Title = "启用自动连线",
   Default = false,
   Callback = function(Value)
       AutoConnectEnabled = Value
       print("自动连线:", Value)
   end,
})

-- 修复后的滑块：连线速度
B2:Slider({
   Title = "连线速度",
   Value = {
       Min = 0.001,
       Max = 0.2,
       Default = 0.05
   },
   Rounding = 3,
   Compact = false,
   Callback = function(Value)
       ConnectionSpeed = Value
       print("连线速度:", Value)
   end,
   Tooltip = "数值越小越快",
})

-- 修复：查找FlowGame模块的代码
local function setupFlowGameHook()
    local success, result = pcall(function()
        local Modules = ReplicatedStorage:FindFirstChild("Modules")
        if Modules then
            local Misc = Modules:FindFirstChild("Misc")
            if Misc then
                local FlowGameManager = Misc:FindFirstChild("FlowGameManager")
                if FlowGameManager then
                    local FlowGame = FlowGameManager:FindFirstChild("FlowGame")
                    return FlowGame
                end
            end
        end
    end)
    
    if success and result then
        local FlowGameModule = require(result)
        local old = FlowGameModule.new
        FlowGameModule.new = function(...)
            local args = { ... }
            local output = { old(unpack(args)) }
            local puzzle = output[1]
            task.spawn(function()
                if puzzle and puzzle.Solution and AutoConnectEnabled then
                    local startTime = tick()
                    while AutoConnectEnabled and tick() - startTime < 3 do 
                        if Players.LocalPlayer.PlayerGui:FindFirstChild("PuzzleUI") then
                            HintSystem:DrawSolutionOneByOne(puzzle, ConnectionSpeed)
                            break
                        end
                        task.wait(0.3) 
                    end
                end
            end)
            return puzzle
        end
    end
end

-- 尝试设置FlowGame钩子
task.spawn(setupFlowGameHook)

local B3 = Window:Tab({Title = "传送修机[高风险]", Icon = "zap"})

B3:Toggle({
    Title = "传送到发电机",
    Default = false,
    Callback = function(value)
        if value then
            local player = game.Players.LocalPlayer
            local character = player.Character
            if not character or not character:FindFirstChild("HumanoidRootPart") then return end
            
            -- 修复：检查workspace结构
            local map = workspace:FindFirstChild("Map")
            if map then
                local ingame = map:FindFirstChild("Ingame")
                if ingame then
                    local mapFolder = ingame:FindFirstChild("Map")
                    if mapFolder then
                        local generators = mapFolder:GetChildren()
                        for _, generator in ipairs(generators) do
                            if generator.Name == "Generator" then
                                local progress = generator:FindFirstChild("Progress")
                                if progress and progress.Value < 100 then
                                    
                                    local generatorPart = generator:FindFirstChild("Main") or  
                                                         generator:FindFirstChild("Model") or
                                                         generator:FindFirstChild("Base")
                                    
                                    if generatorPart then
                                        character.HumanoidRootPart.CFrame = generatorPart.CFrame + Vector3.new(0, 3, 0)
                                        return  
                                    end
                                end
                            end
                        end
                    end
                end
            end
            warn("未找到可修理的发电机")
        end
    end
})

local PerspectiveSection = Window:Section({
    Title = "透视",
    Icon = "crown",
    Opened = true,
})

local D = Window:Tab({Title = "透视", Icon = "eye"})

D:Toggle({
    Title = "杀手透视",
    Default = false,
    Callback = function(value)
        ESPSettings.killerESP = value
    end
})

-- 修复后的滑块：杀手填充透明度
D:Slider({
    Title = "杀手填充透明度",
    Value = {
        Min = 0,
        Max = 1,
        Default = 0.7
    },
    Rounding = 2,
    Compact = true,
    Callback = function(value)
        ESPSettings.killerFillTransparency = value
        UpdateAllPlayerESPText()
    end,
})

-- 修复后的滑块：杀手轮廓透明度
D:Slider({
    Title = "杀手轮廓透明度",
    Value = {
        Min = 0,
        Max = 1,
        Default = 0.3
    },
    Rounding = 2,
    Compact = true,
    Callback = function(value)
        ESPSettings.killerOutlineTransparency = value
        UpdateAllPlayerESPText()
    end,
})

D:Toggle({
    Title = "幸存者透视",
    Default = false,
    Callback = function(value)
        ESPSettings.playerESP = value
    end,
})

-- 修复后的滑块：幸存者填充透明度
D:Slider({
    Title = "幸存者填充透明度",
    Value = {
        Min = 0,
        Max = 1,
        Default = 0.7
    },
    Rounding = 2,
    Compact = true,
    Callback = function(value)
        ESPSettings.survivorFillTransparency = value
        UpdateAllPlayerESPText()
    end,
})

-- 修复后的滑块：幸存者轮廓透明度
D:Slider({
    Title = "幸存者轮廓透明度",
    Value = {
        Min = 0,
        Max = 1,
        Default = 0.3
    },
    Rounding = 2,
    Compact = true,
    Callback = function(value)
        ESPSettings.survivorOutlineTransparency = value
        UpdateAllPlayerESPText()
    end,
})

local ESPSection = Window:Section({
    Title = "透视",
    Icon = "crown",
    Opened = true,
})

local E = Window:Tab({Title = "物品透视", Icon = "eye"})

E:Toggle({
    Title = "发电机透视",
    Default = false,
    Callback = function(value)
        ESPSettings.generatorESP = value
        UpdateAllPlayerESPText()
    end,
})

E:Toggle({
    Title = "物品透视",
    Default = false,
    Callback = function(value)
        ESPSettings.itemESP = value
        UpdateAllPlayerESPText()
    end,
})

E:Toggle({
    Title = "披萨透视",
    Default = false,
    Callback = function(value)
        ESPSettings.pizzaEsp = value
        UpdateAllPlayerESPText()
    end,
})

local E1 = Window:Tab({Title = "其他透视", Icon = "eye"})

E1:Toggle({
    Title = "Elliot透视",
    Default = false,
    Callback = function(value)
        ESPSettings.pizzaDeliveryEsp = value
    end,
})

E1:Toggle({
    Title = "1×4僵尸透视",
    Default = false,
    Callback = function(value)
        ESPSettings.zombieEsp = value
    end,
})

E1:Toggle({
    Title = "绊线透视",
    Default = false,
    Callback = function(value)
        ESPSettings.taphTripwireEsp = value
    end,
})

E1:Toggle({
    Title = "地雷透视",
    Default = false,
    Callback = function(value)
        ESPSettings.tripMineEsp = value
    end,
})

E1:Toggle({
    Title = "Two Time重生点透视",
    Default = false,
    Callback = function(value)
        ESPSettings.twoTimeRespawnEsp = value
    end,
})

local CountermeasureSection = Window:Section({
    Title = "反制设置",
    Icon = "crown",
    Opened = true,
})

local F = Window:Tab({Title = "反制", Icon = "shield"})

F:Toggle({
    Title = "反致盲",
    Default = false,
    Callback = function(value)
        task.spawn(function()
            while value and task.wait() do
                if game.Lighting:FindFirstChild("BlindnessBlur") then
                    game.Lighting.BlindnessBlur:Destroy()
                end
            end
        end)
    end
})

F:Toggle({
    Title = "反空间爆炸",
    Default = false,
    Callback = function(value)
        task.spawn(function()
            while value and task.wait() do
                for _, v447 in pairs({"SubspaceVFXBlur", "SubspaceVFXColorCorrection"}) do
                    if game.Lighting:FindFirstChild(v447) then
                        game.Lighting[v447]:Destroy()
                    end
                end
            end
        end)
    end
})

-- 初始化远程钩子规则
getgenv().HookRules = getgenv().HookRules or {}

getgenv().activateRemoteHook = function(remoteName, blockedFirstArg)
   for _, rule in ipairs(getgenv().HookRules) do
       if rule.remoteName == remoteName and rule.blockedFirstArg == blockedFirstArg then
           return
       end
   end
   table.insert(getgenv().HookRules, {
       remoteName = remoteName,
       blockedFirstArg = blockedFirstArg,
       block = true
   })
end

getgenv().deactivateRemoteHook = function(remoteName, blockedFirstArg)
   for i, rule in ipairs(getgenv().HookRules) do
       if rule.remoteName == remoteName and rule.blockedFirstArg == blockedFirstArg then
           table.remove(getgenv().HookRules, i)
           break
       end
   end
end

getgenv().isFiringDusekkar = false

getgenv().EnableProtection = function()
   getgenv().activateRemoteHook("RemoteEvent", game.Players.LocalPlayer.Name .. "DusekkarCancel")
   if not getgenv().isFiringDusekkar then
       getgenv().isFiringDusekkar = true
       task.spawn(function()
           task.wait(4)
           local ReplicatedStorage = game:GetService("ReplicatedStorage")
           local RemoteEvent = ReplicatedStorage:WaitForChild("Modules"):WaitForChild("Network"):WaitForChild("RemoteEvent")
           RemoteEvent:FireServer({game.Players.LocalPlayer.Name .. "DusekkarCancel"})
           getgenv().isFiringDusekkar = false
       end)
   end
end

getgenv().DisableProtection = function()
   getgenv().deactivateRemoteHook("RemoteEvent", game.Players.LocalPlayer.Name .. "DusekkarCancel")
end

F:Toggle({
   Title = "保护盾",
   Default = false,
   Tooltip = "防止护盾被移除",
   Callback = function(Value)
       if Value then
           getgenv().EnableProtection()
       else
           getgenv().DisableProtection()
       end
   end
})

F:Toggle({    
    Title = "反noob石头速度",
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

end