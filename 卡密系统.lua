local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")

local LocalPlayer = Players.LocalPlayer
while not LocalPlayer do
    wait()
    LocalPlayer = Players.LocalPlayer
end

local Blacklist = {
    Users = {
        "ghhvhj567",
    }
}

local playerName = LocalPlayer.Name
local isBanned = false
for _, bannedName in pairs(Blacklist.Users) do
    if playerName:lower() == bannedName:lower() then
        isBanned = true
        break
    end
end

if isBanned then
    local screenGui = Instance.new("ScreenGui")
    screenGui.Name = "BlacklistNotification"
    screenGui.Parent = LocalPlayer:WaitForChild("PlayerGui")
    
    local textLabel = Instance.new("TextLabel")
    textLabel.Name = "BanMessage"
    textLabel.Size = UDim2.new(1, 0, 1, 0)
    textLabel.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
    textLabel.BackgroundTransparency = 0.3
    textLabel.TextColor3 = Color3.fromRGB(255, 50, 50)
    textLabel.Text = "用户: " .. playerName .. "\n\n你已被列入脚本黑名单\n\n将在5秒后断开连接...\n\n错误代码:XiaoXu"
    textLabel.Font = Enum.Font.SourceSansBold
    textLabel.TextSize = 24
    textLabel.TextWrapped = true
    textLabel.Parent = screenGui
    for i = 5, 1, -1 do
        textLabel.Text = "用户: " .. playerName .. "\n\n你已被列入脚本黑名单\n\n将在 " .. i .. " 秒后断开连接...\n\n错误代码:THE BIG WAVE"
        wait(1)
    end
    
    LocalPlayer:Kick("用户: " .. playerName .. " ┃ 你已被列入TBW公会所有脚本黑名单\n\n错误代码:THE BIG WAVE")
    return
end  

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
ScreenGui.Name = "KeySystemGui"
ScreenGui.DisplayOrder = 10

local Frame = Instance.new("Frame")
Frame.Size = UDim2.new(0, 320, 0, 200)
Frame.Position = UDim2.new(0.5, 0, 0.5, 0)
Frame.AnchorPoint = Vector2.new(0.5, 0.5)
Frame.BackgroundColor3 = Color3.fromRGB(10, 10, 10)
Frame.BackgroundTransparency = 0.1
Frame.BorderSizePixel = 0
Frame.Active = true
Frame.Draggable = true
Frame.ZIndex = 2
Frame.Parent = ScreenGui

local FrameCorner = Instance.new("UICorner")
FrameCorner.CornerRadius = UDim.new(0, 15)
FrameCorner.Parent = Frame

local FrameStroke = Instance.new("UIStroke")
FrameStroke.Color = Color3.fromRGB(40, 40, 40)
FrameStroke.Thickness = 2
FrameStroke.Transparency = 0.2
FrameStroke.LineJoinMode = Enum.LineJoinMode.Round
FrameStroke.Parent = Frame

local InnerShadow = Instance.new("ImageLabel")
InnerShadow.Name = "InnerShadow"
InnerShadow.Image = "rbxassetid://5554236805"
InnerShadow.ScaleType = Enum.ScaleType.Slice
InnerShadow.SliceCenter = Rect.new(23, 23, 277, 277)
InnerShadow.ImageTransparency = 0.5
InnerShadow.ImageColor3 = Color3.new(0, 0, 0)
InnerShadow.Size = UDim2.new(1, 0, 1, 0)
InnerShadow.BackgroundTransparency = 1
InnerShadow.ZIndex = 3
InnerShadow.Parent = Frame

local TopBar = Instance.new("Frame")
TopBar.Size = UDim2.new(1, 0, 0.08, 0)
TopBar.Position = UDim2.new(0, 0, 0, 0)
TopBar.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
TopBar.BackgroundTransparency = 0.2
TopBar.BorderSizePixel = 0
TopBar.ZIndex = 4
TopBar.Parent = Frame

local TopBarCorner = Instance.new("UICorner")
TopBarCorner.CornerRadius = UDim.new(0, 15)
TopBarCorner.Parent = TopBar

local TopBarStroke = Instance.new("UIStroke")
TopBarStroke.Color = Color3.fromRGB(60, 60, 60)
TopBarStroke.Thickness = 1
TopBarStroke.Parent = TopBar

local Close = Instance.new("ImageButton")
Close.Name = "Close"
Close.Size = UDim2.new(0, 28, 0, 28)
Close.Position = UDim2.new(0.97, -35, 0.02, 0)
Close.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
Close.Image = "rbxassetid://6031094678"
Close.ImageColor3 = Color3.fromRGB(150, 150, 150)
Close.ScaleType = Enum.ScaleType.Fit
Close.ZIndex = 5
Close.Parent = Frame

local CloseCorner = Instance.new("UICorner")
CloseCorner.CornerRadius = UDim.new(0, 6)
CloseCorner.Parent = Close

local closeStroke = Instance.new("UIStroke")
closeStroke.Color = Color3.fromRGB(80, 80, 80)
closeStroke.Thickness = 1.5
closeStroke.Parent = Close

Close.MouseEnter:Connect(function()
    game.TweenService:Create(Close, TweenInfo.new(0.2), {Size = UDim2.new(0, 32, 0, 32), BackgroundColor3 = Color3.fromRGB(30, 30, 30), ImageColor3 = Color3.fromRGB(200, 200, 200)}):Play()
    game.TweenService:Create(closeStroke, TweenInfo.new(0.2), {Color = Color3.fromRGB(120, 120, 120)}):Play()
end)

Close.MouseLeave:Connect(function()
    game.TweenService:Create(Close, TweenInfo.new(0.2), {Size = UDim2.new(0, 28, 0, 28), BackgroundColor3 = Color3.fromRGB(20, 20, 20), ImageColor3 = Color3.fromRGB(150, 150, 150)}):Play()
    game.TweenService:Create(closeStroke, TweenInfo.new(0.2), {Color = Color3.fromRGB(80, 80, 80)}):Play()
end)

Close.MouseButton1Click:Connect(function()
    game.TweenService:Create(Frame, TweenInfo.new(0.3), {BackgroundTransparency = 1}):Play()
    
    local tweenInfo = TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
    local tween = game:GetService("TweenService"):Create(Frame, tweenInfo, {
        Size = UDim2.new(0, 0, 0, 0),
        Position = UDim2.new(0.5, 0, 0.5, 0)
    })
    tween:Play()
    tween.Completed:Connect(function()
        ScreenGui:Destroy()
    end)
end)

local Title = Instance.new("TextLabel")
Title.Name = "Title"
Title.Size = UDim2.new(0.7, 0, 0, 36)
Title.Position = UDim2.new(0.15, 0, 0.01, 0)
Title.Text = "卡密验证系统"
Title.Font = Enum.Font.GothamBold
Title.TextSize = 22
Title.TextColor3 = Color3.fromRGB(220, 220, 220)
Title.BackgroundTransparency = 1
Title.ZIndex = 5
Title.TextXAlignment = Enum.TextXAlignment.Center
Title.Parent = Frame

local TitleStroke = Instance.new("UIStroke")
TitleStroke.Color = Color3.fromRGB(100, 100, 100)
TitleStroke.Thickness = 0.8
TitleStroke.Transparency = 0.5
TitleStroke.Parent = Title

local DecorLine = Instance.new("Frame")
DecorLine.Size = UDim2.new(0.7, 0, 0, 1)
DecorLine.Position = UDim2.new(0.15, 0, 0.12, 0)
DecorLine.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
DecorLine.BorderSizePixel = 0
DecorLine.ZIndex = 3
DecorLine.Parent = Frame

local Instructions = Instance.new("TextLabel")
Instructions.Name = "Instructions"
Instructions.Size = UDim2.new(0.9, 0, 0, 26)
Instructions.Position = UDim2.new(0.05, 0, 0.22, 0)
Instructions.Text = "请输入正确的卡密以继续"
Instructions.Font = Enum.Font.Gotham
Instructions.TextSize = 16
Instructions.TextColor3 = Color3.fromRGB(180, 180, 180)
Instructions.BackgroundTransparency = 1
Instructions.ZIndex = 5
Instructions.TextXAlignment = Enum.TextXAlignment.Center
Instructions.Parent = Frame

local TextBox = Instance.new("TextBox")
TextBox.Name = "KeyInput"
TextBox.Size = UDim2.new(0.8, 0, 0.15, 0)
TextBox.Position = UDim2.new(0.1, 0, 0.35, 0)
TextBox.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
TextBox.Text = ""
TextBox.Font = Enum.Font.Gotham
TextBox.TextSize = 18
TextBox.TextColor3 = Color3.fromRGB(220, 220, 220)
TextBox.PlaceholderColor3 = Color3.fromRGB(100, 100, 100)
TextBox.PlaceholderText = "在此输入卡密..."
TextBox.TextXAlignment = Enum.TextXAlignment.Center
TextBox.ZIndex = 5
TextBox.Parent = Frame

local TextBoxCorner = Instance.new("UICorner")
TextBoxCorner.CornerRadius = UDim.new(0, 10)
TextBoxCorner.Parent = TextBox

local TextboxStroke = Instance.new("UIStroke")
TextboxStroke.Color = Color3.fromRGB(60, 60, 60)
TextboxStroke.Thickness = 2
TextboxStroke.Parent = TextBox

local ButtonContainer = Instance.new("Frame")
ButtonContainer.Name = "ButtonContainer"
ButtonContainer.Size = UDim2.new(0.9, 0, 0.2, 0)
ButtonContainer.Position = UDim2.new(0.05, 0, 0.6, 0)
ButtonContainer.BackgroundTransparency = 1
ButtonContainer.Parent = Frame

local GetKey = Instance.new("TextButton")
GetKey.Name = "GetKeyButton"
GetKey.Size = UDim2.new(0.4, 0, 1, 0)
GetKey.Position = UDim2.new(0.05, 0, 0, 0)
GetKey.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
GetKey.Text = "获取卡密"
GetKey.Font = Enum.Font.GothamBold
GetKey.TextSize = 16
GetKey.TextColor3 = Color3.fromRGB(200, 200, 200)
GetKey.AutoButtonColor = false
GetKey.ZIndex = 5
GetKey.Parent = ButtonContainer

local GetKeyCorner = Instance.new("UICorner")
GetKeyCorner.CornerRadius = UDim.new(0, 8)
GetKeyCorner.Parent = GetKey

local GetKeyStroke = Instance.new("UIStroke")
GetKeyStroke.Color = Color3.fromRGB(70, 70, 70)
GetKeyStroke.Thickness = 1.5
GetKeyStroke.Parent = GetKey

local CheckKey = Instance.new("TextButton")
CheckKey.Name = "CheckKeyButton"
CheckKey.Size = UDim2.new(0.4, 0, 1, 0)
CheckKey.Position = UDim2.new(0.55, 0, 0, 0)
CheckKey.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
CheckKey.Text = "验证卡密"
CheckKey.Font = Enum.Font.GothamBold
CheckKey.TextSize = 16
CheckKey.TextColor3 = Color3.fromRGB(200, 200, 200)
CheckKey.AutoButtonColor = false
CheckKey.ZIndex = 5
CheckKey.Parent = ButtonContainer

local CheckKeyCorner = Instance.new("UICorner")
CheckKeyCorner.CornerRadius = UDim.new(0, 8)
CheckKeyCorner.Parent = CheckKey

local CheckKeyStroke = Instance.new("UIStroke")
CheckKeyStroke.Color = Color3.fromRGB(80, 80, 80)
CheckKeyStroke.Thickness = 1.5
CheckKeyStroke.Parent = CheckKey

local function setupButtonHoverEffect(button, originalColor, hoverColor, originalStroke, hoverStroke)
    button.MouseEnter:Connect(function()
        game.TweenService:Create(button, TweenInfo.new(0.2), {
            BackgroundColor3 = hoverColor,
            Size = UDim2.new(0.41, 0, 1.05, 0)
        }):Play()
        game.TweenService:Create(button, TweenInfo.new(0.2), {TextColor3 = Color3.fromRGB(230, 230, 230)}):Play()
        game.TweenService:Create(button.UIStroke, TweenInfo.new(0.2), {Color = hoverStroke}):Play()
    end)
    
    button.MouseLeave:Connect(function()
        game.TweenService:Create(button, TweenInfo.new(0.2), {
            BackgroundColor3 = originalColor,
            Size = UDim2.new(0.4, 0, 1, 0)
        }):Play()
        game.TweenService:Create(button, TweenInfo.new(0.2), {TextColor3 = Color3.fromRGB(200, 200, 200)}):Play()
        game.TweenService:Create(button.UIStroke, TweenInfo.new(0.2), {Color = originalStroke}):Play()
    end)
end

setupButtonHoverEffect(
    GetKey, 
    Color3.fromRGB(25, 25, 25), 
    Color3.fromRGB(35, 35, 35),
    Color3.fromRGB(70, 70, 70),
    Color3.fromRGB(100, 100, 100)
)

setupButtonHoverEffect(
    CheckKey, 
    Color3.fromRGB(30, 30, 30), 
    Color3.fromRGB(40, 40, 40),
    Color3.fromRGB(80, 80, 80),
    Color3.fromRGB(110, 110, 110)
)

local StatusLabel = Instance.new("TextLabel")
StatusLabel.Name = "StatusLabel"
StatusLabel.Size = UDim2.new(0.9, 0, 0, 20)
StatusLabel.Position = UDim2.new(0.05, 0, 0.85, 0)
StatusLabel.Text = "状态: 等待输入"
StatusLabel.Font = Enum.Font.Gotham
StatusLabel.TextSize = 14
StatusLabel.TextColor3 = Color3.fromRGB(150, 150, 150)
StatusLabel.BackgroundTransparency = 1
StatusLabel.TextXAlignment = Enum.TextXAlignment.Center
StatusLabel.ZIndex = 3
StatusLabel.Parent = Frame

local Copyright = Instance.new("TextLabel")
Copyright.Text = "请加QQ群1023991438"
Copyright.Font = Enum.Font.Gotham
Copyright.TextSize = 12
Copyright.TextColor3 = Color3.fromRGB(100, 100, 100)
Copyright.BackgroundTransparency = 1
Copyright.Size = UDim2.new(1, 0, 0, 20)
Copyright.Position = UDim2.new(0, 0, 0.92, 0)
Copyright.ZIndex = 3
Copyright.Parent = Frame

TextBox.Focused:Connect(function()
    game.TweenService:Create(TextBox, TweenInfo.new(0.2), {
        BackgroundColor3 = Color3.fromRGB(25, 25, 25),
        Size = UDim2.new(0.82, 0, 0.16, 0)
    }):Play()
    game.TweenService:Create(TextboxStroke, TweenInfo.new(0.2), {
        Color = Color3.fromRGB(100, 100, 100),
        Thickness = 2.5
    }):Play()
end)

TextBox.FocusLost:Connect(function()
    game.TweenService:Create(TextBox, TweenInfo.new(0.2), {
        BackgroundColor3 = Color3.fromRGB(20, 20, 20),
        Size = UDim2.new(0.8, 0, 0.15, 0)
    }):Play()
    game.TweenService:Create(TextboxStroke, TweenInfo.new(0.2), {
        Color = Color3.fromRGB(60, 60, 60),
        Thickness = 2
    }):Play()
end)

-- 卡密验证函数
local function validateKey(key)
    -- 这里填入您的卡密链接中的文字内容
    -- 示例：如果链接中的文字是"请使用卡密：BlackDragon2023"
    -- 那么正确的卡密就是"BlackDragon2023"
    
    -- 请将下面的"YOUR_KEY_HERE"替换为您链接中的实际文字内容
    if key == "TBW-GOODBYE PLANET" then
        return true
    else
        return false
    end
end

GetKey.MouseButton1Click:Connect(function()
    -- 这里设置获取卡密的链接
    local keyLink = "qq 群号1023991438"  -- 请替换为实际链接
    
    TextBox.Text = "已复制链接到剪贴板"
    StatusLabel.Text = "状态: 链接已复制"
    StatusLabel.TextColor3 = Color3.fromRGB(150, 200, 150)
    
    -- 复制链接到剪贴板
    setclipboard(keyLink)
    
    wait(1.5)
    TextBox.Text = ""
    StatusLabel.Text = "状态: 等待输入"
    StatusLabel.TextColor3 = Color3.fromRGB(150, 150, 150)
end)

CheckKey.MouseButton1Click:Connect(function()
    local enteredKey = TextBox.Text
    
    if enteredKey == "" then
        TextBox.Text = "请输入卡密"
        StatusLabel.Text = "状态: 请输入卡密"
        StatusLabel.TextColor3 = Color3.fromRGB(200, 150, 150)
        wait(1)
        TextBox.Text = ""
        StatusLabel.Text = "状态: 等待输入"
        StatusLabel.TextColor3 = Color3.fromRGB(150, 150, 150)
        return
    end
    
    local isValid = validateKey(enteredKey)
    
    if isValid then
        TextBox.Text = "验证成功！"
        StatusLabel.Text = "状态: 验证通过"
        StatusLabel.TextColor3 = Color3.fromRGB(150, 255, 150)
        
        -- 验证成功后的动画
        game.TweenService:Create(TextBox, TweenInfo.new(0.3), {
            BackgroundColor3 = Color3.fromRGB(20, 40, 20)
        }):Play()
        game.TweenService:Create(TextboxStroke, TweenInfo.new(0.3), {
            Color = Color3.fromRGB(100, 255, 100)
        }):Play()
        
        wait(1.5)
        
        -- 关闭界面
        game.TweenService:Create(Frame, TweenInfo.new(0.3), {BackgroundTransparency = 1}):Play()
        local tweenInfo = TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
        local tween = game:GetService("TweenService"):Create(Frame, tweenInfo, {
            Size = UDim2.new(0, 0, 0, 0),
            Position = UDim2.new(0.5, 0, 0.5, 0)
        })
        tween:Play()
        tween.Completed:Connect(function()
            ScreenGui:Destroy()
        end)
        loadstring(game:HttpGet('https://raw.githubusercontent.com/XiaoXuCynic/Old-Winter-Script/refs/heads/main/%E6%97%A7%E5%86%AC.lua'))()
        -- 这里可以添加验证成功后要执行的代码
        -- 例如：loadstring(game:HttpGet("您的脚本链接"))()
        
    else
        TextBox.Text = "卡密错误！"
        StatusLabel.Text = "状态: 验证失败"
        StatusLabel.TextColor3 = Color3.fromRGB(255, 150, 150)
        
        -- 错误提示动画
        game.TweenService:Create(TextBox, TweenInfo.new(0.3), {
            BackgroundColor3 = Color3.fromRGB(40, 20, 20)
        }):Play()
        game.TweenService:Create(TextboxStroke, TweenInfo.new(0.3), {
            Color = Color3.fromRGB(255, 100, 100)
        }):Play()
        
        wait(1.5)
        
        -- 恢复原状
        game.TweenService:Create(TextBox, TweenInfo.new(0.3), {
            BackgroundColor3 = Color3.fromRGB(20, 20, 20)
        }):Play()
        game.TweenService:Create(TextboxStroke, TweenInfo.new(0.3), {
            Color = Color3.fromRGB(60, 60, 60)
        }):Play()
        
        TextBox.Text = ""
        StatusLabel.Text = "状态: 等待输入"
        StatusLabel.TextColor3 = Color3.fromRGB(150, 150, 150)
    end
end)

-- 入场动画
Frame.Size = UDim2.new(0, 10, 0, 10)
Frame.BackgroundTransparency = 1

wait(0.1)

game.TweenService:Create(Frame, TweenInfo.new(0.5), {BackgroundTransparency = 0.1}):Play()
game.TweenService:Create(Frame, TweenInfo.new(0.6, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {
    Size = UDim2.new(0, 320, 0, 200)
}):Play()