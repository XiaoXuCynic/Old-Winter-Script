local HttpService = cloneref(game:GetService("HttpService"))

local isfunctionhooked = clonefunction(isfunctionhooked)

if isfunctionhooked(game.HttpGet) or isfunctionhooked(getnamecallmethod) or isfunctionhooked(request) then
    return
end

local WindUI = loadstring(game:HttpGet("https://raw.githubusercontent.com/Footagesus/WindUI/main/dist/main.lua"))()

WindUI.TransparencyValue = 0.3
WindUI:SetTheme("Light")

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

local Window = WindUI:CreateWindow({
    Title = "旧冬V2", 
    Icon = "crown", 
    Author = "By 非正宗小徐OvO", 
    Folder = "WindUI_旧冬脚本", 
    Size = UDim2.fromOffset(400, 250), 
    Background = "rbxassetid://4483362748",
    Theme = "Light", 
    
    User = {
        Enabled = true, 
        Anonymous = false, 
        Callback = function() 
            WindUI:Notify({
                Title = "信息",
                Content = "你的信息",
                Duration = 3
            })
        end
    },
    SideBarWidth = 170, 
    ScrollBarEnabled = false 
})

local Tabs = {
    Game = Window:Section({ Title = "面板", Icon = "crown" ,Opened = true })
}

local TabHandles = {
    FWQ1Settings = Tabs.Game:Tab({ Title = "通用", Icon = "crown" }),
}

WindUI:Notify({Title = "旧冬脚本", Content = "已打开", Duration = 3}) task.wait(0.1)
WindUI:Notify({Title = "作者小徐", Content = "合作伙伴UnicoX", Duration = 3})

TabHandles.FWQ1Settings:Button({
    Title = "旧冬飞行",
    Callback = function()
        loadstring(game:HttpGet'https://raw.githubusercontent.com/QiuShan-UX/UnicoX/refs/heads/main/%E9%A3%9E%E8%A1%8C%E7%A4%BA%E4%BE%8B.lua')()
    end
})

local GeneralSection = TabHandles.FWQ1Settings:Section({Title = "通用功能", Opened = true})

local HFEnabled = false
GeneralSection:Toggle({
    Title = "循环恢复血量",
    Default = false,
    Callback = function(enabled)
        HFEnabled = enabled
        if enabled then
            while HFEnabled do
                if game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChild("Humanoid") then
                    game.Players.LocalPlayer.Character.Humanoid.Health = 9000000000
                end
                wait()
            end
        end
    end
})

GeneralSection:Button({
    Title = "锁定视野",
    Callback = function()
        loadstring(game:HttpGet("https://pastefy.app/nekmtvpA/raw"))()
    end
})

local Cam1 = false
local Cam2
function Cam2()
    while Cam1 do
        wait(0.1)
        local localPlayer = game:GetService("Players").LocalPlayer
        localPlayer.CameraMaxZoomDistance = 9000000000
    end
    while not Cam1 do
        wait(0.1)
        local localPlayer = game:GetService("Players").LocalPlayer
        localPlayer.CameraMaxZoomDistance = 32
    end
end

GeneralSection:Toggle({
    Title = "解锁最大视野",
    Default = false,
    Callback = function(enabled)
        Cam1 = enabled
        if Cam1 then
            Cam2()
        end
    end
})

GeneralSection:Toggle({
    Title = "子弹追踪",
    Default = false,
    Callback = function(enabled)
        local camera = nil	
        local Players = nil	
        local localPlayer = nil	
        local originalNamecall = nil	
        local originalIndex = nil	
        if enabled then
            camera = workspace.CurrentCamera
            Players = game.Players
            localPlayer = Players.LocalPlayer
            local mouse = localPlayer:GetMouse()
            function ClosestPlayer()
                local closestDistance = math.huge
                local closestPlayer = nil
                for _, player in pairs(Players:GetPlayers()) do
                    if player ~= localPlayer and player.Team ~= localPlayer.Team and player.Character then
                        local head = player.Character:FindFirstChild("Head")
                        if head then
                            local screenPoint, isVisible = camera:WorldToScreenPoint(head.Position)
                            if isVisible then
                                local distance = (Vector2.new(screenPoint.X, screenPoint.Y) - Vector2.new(workspace.CurrentCamera.ViewportSize.X / 2, workspace.CurrentCamera.ViewportSize.Y / 2)).Magnitude
                                if distance < closestDistance then
                                    closestDistance = distance
                                    closestPlayer = player
                                end
                            end
                        end
                    end
                end
                return closestPlayer
            end
            local metatable = getrawmetatable(game)
            originalNamecall = metatable.__namecall
            originalIndex = metatable.__index
            setreadonly(metatable, false)
            metatable.__namecall = newcclosure(function(self, ...)
                local args = {...}
                if getnamecallmethod() == "FindPartOnRayWithIgnoreList" and not checkcaller() then
                    local targetPlayer = ClosestPlayer()
                    if targetPlayer and targetPlayer.Character and targetPlayer.Character:FindFirstChild("Head") then
                        args[1] = Ray.new(camera.CFrame.Position, ((targetPlayer.Character.Head.Position - camera.CFrame.Position)).Unit * 1000)
                        return originalNamecall(self, unpack(args))
                    end
                end
                return originalNamecall(self, ...)
            end)
            metatable.__index = newcclosure(function(self, key)
                if key == "Clips" then
                    return workspace.Map
                end
                return originalIndex(self, key)
            end)
            setreadonly(metatable, true)
        else
            if originalNamecall and originalIndex then
                local metatable = getrawmetatable(game)
                setreadonly(metatable, false)
                metatable.__namecall = originalNamecall
                metatable.__index = originalIndex
                setreadonly(metatable, true)
            end
        end
    end
})

GeneralSection:Button({
    Title = "查看游戏中的所有玩家（包括血量条）",
    Callback = function()
        loadstring(game:HttpGet("https://pastebin.com/raw/G2zb992X", true))()
    end
})

GeneralSection:Button({
    Title = "工具包",
    Callback = function()
        loadstring(game:HttpGet("https://cdn.wearedevs.net/scripts/BTools.txt"))()
    end
})

GeneralSection:Button({
    Title = "老外传送至玩家身边",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Infinity2346/Tect-Menu/main/Teleport%20Gui.lua"))()
    end
})

GeneralSection:Button({
    Title = "点击传送道具",
    Callback = function()
        loadstring(game:HttpGet("https://pastefy.app/Jf2QXOwa/raw"))()
    end
})

GeneralSection:Button({
    Title = "Dex",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/renlua/Script-Tutorial/refs/heads/main/dex.lua"))()
    end
})

local Clipon = false
local Stepped
GeneralSection:Toggle({
    Title = "穿墙",
    Default = false,
    Callback = function(enabled)
        local workspace = game:GetService("Workspace")
        local Players = game:GetService("Players")
        if enabled then
            Clipon = true
            Stepped = game:GetService("RunService").Stepped:Connect(function()
                if Clipon then
                    for _, child in pairs(workspace:GetChildren()) do
                        if child.Name == Players.LocalPlayer.Name then
                            for _, part in pairs(workspace[Players.LocalPlayer.Name]:GetChildren()) do
                                if part:IsA("BasePart") then
                                    part.CanCollide = false
                                end
                            end
                        end
                    end
                else
                    if Stepped then
                        Stepped:Disconnect()
                    end
                end
            end)
        else
            Clipon = false
            if Stepped then
                Stepped:Disconnect()
            end
        end
    end
})

GeneralSection:Toggle({
    Title = "圆圈高亮透视",
    Default = false,
    Callback = function(enabled)
        for _, player in pairs(game.Players:GetPlayers()) do
            if player ~= game.Players.LocalPlayer then
                if enabled then
                    if player.Character then
                        local highlight = Instance.new("Highlight")
                        highlight.Parent = player.Character
                        highlight.Adornee = player.Character
                        local billboardGui = Instance.new("BillboardGui")
                        billboardGui.Parent = player.Character
                        billboardGui.Adornee = player.Character
                        billboardGui.Size = UDim2.new(0, 100, 0, 100)
                        billboardGui.StudsOffset = Vector3.new(0, 3, 0)
                        billboardGui.AlwaysOnTop = true
                        local textLabel = Instance.new("TextLabel")
                        textLabel.Parent = billboardGui
                        textLabel.Size = UDim2.new(1, 0, 1, 0)
                        textLabel.BackgroundTransparency = 1
                        textLabel.Text = player.Name
                        textLabel.TextColor3 = Color3.new(1, 1, 1)
                        textLabel.TextStrokeTransparency = 0.5
                        textLabel.TextScaled = true
                        local imageLabel = Instance.new("ImageLabel")
                        imageLabel.Parent = billboardGui
                        imageLabel.Size = UDim2.new(0, 50, 0, 50)
                        imageLabel.Position = UDim2.new(0.5, 0, 0.5, 0)
                        imageLabel.AnchorPoint = Vector2.new(0.5, 0.5)
                        imageLabel.BackgroundTransparency = 1
                        imageLabel.Image = "rbxassetid://2200552246"
                    end
                else
                    if player.Character then
                        if player.Character:FindFirstChildOfClass("Highlight") then
                            player.Character:FindFirstChildOfClass("Highlight"):Destroy()
                        end
                        if player.Character:FindFirstChildOfClass("BillboardGui") then
                            player.Character:FindFirstChildOfClass("BillboardGui"):Destroy()
                        end
                    end
                end
            end
        end
    end
})

local InfJ = false
GeneralSection:Toggle({
    Title = "无限跳",
    Default = false,
    Callback = function(enabled)
        InfJ = enabled
        game:GetService("UserInputService").JumpRequest:connect(function()
            if InfJ == true and game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChildOfClass("Humanoid") then
                game:GetService("Players").LocalPlayer.Character:FindFirstChildOfClass("Humanoid"):ChangeState("Jumping")
            end
        end)
    end
})

local LocalPlayer = game.Players.LocalPlayer
GeneralSection:Toggle({
    Title = "无敌",
    Default = false,
    Callback = function(enabled)
        if enabled then
            local camera = workspace.CurrentCamera
            local cameraCFrame = camera.CFrame
            local character = LocalPlayer.Character
            if character then
                local humanoid = character:FindFirstChildWhichIsA("Humanoid")
                if humanoid then
                    local clonedHumanoid = humanoid:Clone()
                    clonedHumanoid.Parent = character
                    clonedHumanoid:SetStateEnabled(Enum.HumanoidStateType.Health, false)
                    clonedHumanoid:SetStateEnabled(Enum.HumanoidStateType.FallingDown, false)
                    clonedHumanoid:SetStateEnabled(Enum.HumanoidStateType.Dead, false)
                    clonedHumanoid.BreakJointsOnDeath = true
                    humanoid:Destroy()
                    LocalPlayer.Character = nil
                    LocalPlayer.Character = character
                    camera.CameraSubject = clonedHumanoid
                    local waitResult = wait()
                    local targetCFrame
                    if waitResult then
                        targetCFrame = cameraCFrame or camera.CFrame
                    end
                    camera.CFrame = targetCFrame
                    clonedHumanoid.DisplayDistanceType = Enum.HumanoidDisplayDistanceType.None
                    local animate = character:FindFirstChild("Animate")
                    if animate then
                        animate.Disabled = true
                        wait()
                        animate.Disabled = false
                    end
                    clonedHumanoid.Health = clonedHumanoid.MaxHealth
                end
            end
        else
            if game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChild("Humanoid") then
                game.Players.LocalPlayer.Character.Humanoid.Health = 100
            end
        end
    end
})

GeneralSection:Toggle({
    Title = "上帝模式",
    Default = false,
    Callback = function(enabled)
        if enabled then
            local localPlayer = game:GetService("Players").LocalPlayer
            if localPlayer.Character and localPlayer.Character:FindFirstChild("HumanoidRootPart") then
                local clone = localPlayer.Character.HumanoidRootPart:Clone()
                clone.Parent = localPlayer.Character
            end
        else
            if game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChild("Head") then
                game.Players.LocalPlayer.Character.Head:Destroy()
            end
        end
    end
})

TabHandles.FWQ1Settings:Button({
    Title = "情云同款自瞄可调",
    Callback = function()
        local fov = 100 
        local smoothness = 10 
        local crosshairDistance = 5 
        local RunService = game:GetService("RunService") 
        local UserInputService = game:GetService("UserInputService") 
        local Players = game:GetService("Players") 
        local Cam = game.Workspace.CurrentCamera 
        local FOVring = Drawing.new("Circle") 
        FOVring.Visible = true 
        FOVring.Thickness = 2 
        FOVring.Color = Color3.fromRGB(0, 255, 0) 
        FOVring.Filled = false 
        FOVring.Radius = fov 
        FOVring.Position = Cam.ViewportSize / 2 
        local Player = Players.LocalPlayer 
        local PlayerGui = Player:WaitForChild("PlayerGui") 
        local ScreenGui = Instance.new("ScreenGui") 
        ScreenGui.Name = "FovAdjustGui" 
        ScreenGui.Parent = PlayerGui 
        local Frame = Instance.new("Frame") 
        Frame.Name = "MainFrame" 
        Frame.BackgroundColor3 = Color3.fromRGB(30, 30, 30) 
        Frame.BorderColor3 = Color3.fromRGB(128, 0, 128) 
        Frame.BorderSizePixel = 2 
        Frame.Position = UDim2.new(0.3, 0, 0.3, 0) 
        Frame.Size = UDim2.new(0.4, 0, 0.4, 0) 
        Frame.Active = true 
        Frame.Draggable = true 
        Frame.Parent = ScreenGui 
        local MinimizeButton = Instance.new("TextButton") 
        MinimizeButton.Name = "MinimizeButton" 
        MinimizeButton.Text = "-" 
        MinimizeButton.TextColor3 = Color3.fromRGB(255, 255, 255) 
        MinimizeButton.BackgroundColor3 = Color3.fromRGB(50, 50, 50) 
        MinimizeButton.Position = UDim2.new(0.9, 0, 0, 0) 
        MinimizeButton.Size = UDim2.new(0.1, 0, 0.1, 0) 
        MinimizeButton.Parent = Frame 
        local isMinimized = false 
        MinimizeButton.MouseButton1Click:Connect(function() 
            isMinimized = not isMinimized 
            if isMinimized then 
                Frame:TweenSize(UDim2.new(0.1, 0, 0.1, 0), Enum.EasingDirection.Out, Enum.EasingStyle.Quad, 0.3, true) 
                MinimizeButton.Text = "+" 
            else 
                Frame:TweenSize(UDim2.new(0.4, 0, 0.4, 0), Enum.EasingDirection.Out, Enum.EasingStyle.Quad, 0.3, true) 
                MinimizeButton.Text = "-" 
            end 
        end) 
        local FovLabel = Instance.new("TextLabel") 
        FovLabel.Name = "FovLabel" 
        FovLabel.Text = "自瞄范围" 
        FovLabel.TextColor3 = Color3.fromRGB(255, 255, 255) 
        FovLabel.BackgroundTransparency = 1 
        FovLabel.Position = UDim2.new(0.1, 0, 0.1, 0) 
        FovLabel.Size = UDim2.new(0.8, 0, 0.2, 0) 
        FovLabel.Parent = Frame 
        local FovSlider = Instance.new("TextBox") 
        FovSlider.Name = "FovSlider" 
        FovSlider.Text = tostring(fov) 
        FovSlider.TextColor3 = Color3.fromRGB(255, 255, 255) 
        FovSlider.BackgroundColor3 = Color3.fromRGB(50, 50, 50) 
        FovSlider.Position = UDim2.new(0.1, 0, 0.3, 0) 
        FovSlider.Size = UDim2.new(0.8, 0, 0.2, 0) 
        FovSlider.Parent = Frame 
        local SmoothnessLabel = Instance.new("TextLabel") 
        SmoothnessLabel.Name = "SmoothnessLabel" 
        SmoothnessLabel.Text = "自瞄平滑度" 
        SmoothnessLabel.TextColor3 = Color3.fromRGB(255, 255, 255) 
        SmoothnessLabel.BackgroundTransparency = 1 
        SmoothnessLabel.Position = UDim2.new(0.1, 0, 0.5, 0) 
        SmoothnessLabel.Size = UDim2.new(0.8, 0, 0.2, 0) 
        SmoothnessLabel.Parent = Frame 
        local SmoothnessSlider = Instance.new("TextBox") 
        SmoothnessSlider.Name = "SmoothnessSlider" 
        SmoothnessSlider.Text = tostring(smoothness) 
        SmoothnessSlider.TextColor3 = Color3.fromRGB(255, 255, 255) 
        SmoothnessSlider.BackgroundColor3 = Color3.fromRGB(50, 50, 50) 
        SmoothnessSlider.Position = UDim2.new(0.1, 0, 0.7, 0) 
        SmoothnessSlider.Size = UDim2.new(0.8, 0, 0.2, 0) 
        SmoothnessSlider.Parent = Frame 
        local CrosshairDistanceLabel = Instance.new("TextLabel") 
        CrosshairDistanceLabel.Name = "CrosshairDistanceLabel" 
        CrosshairDistanceLabel.Text = "自瞄预判距离" 
        CrosshairDistanceLabel.TextColor3 = Color3.fromRGB(255, 255, 255) 
        CrosshairDistanceLabel.BackgroundTransparency = 1 
        CrosshairDistanceLabel.Position = UDim2.new(0.1, 0, 0.9, 0) 
        CrosshairDistanceLabel.Size = UDim2.new(0.8, 0, 0.2, 0) 
        CrosshairDistanceLabel.Parent = Frame 
        local CrosshairDistanceSlider = Instance.new("TextBox") 
        CrosshairDistanceSlider.Name = "CrosshairDistanceSlider" 
        CrosshairDistanceSlider.Text = tostring(crosshairDistance) 
        CrosshairDistanceSlider.TextColor3 = Color3.fromRGB(255, 255, 255) 
        CrosshairDistanceSlider.BackgroundColor3 = Color3.fromRGB(50, 50, 50) 
        CrosshairDistanceSlider.Position = UDim2.new(0.1, 0, 1.1, 0) 
        CrosshairDistanceSlider.Size = UDim2.new(0.8, 0, 0.2, 0) 
        CrosshairDistanceSlider.Parent = Frame 
        local targetCFrame = Cam.CFrame 
        local function updateDrawings() 
            local camViewportSize = Cam.ViewportSize 
            FOVring.Position = camViewportSize / 2 
            FOVring.Radius = fov 
        end 
        local function onKeyDown(input) 
            if input.KeyCode == Enum.KeyCode.Delete then 
                RunService:UnbindFromRenderStep("FOVUpdate") 
                FOVring:Remove() 
            end 
        end 
        UserInputService.InputBegan:Connect(onKeyDown) 
        local function getClosestPlayerInFOV(trg_part) 
            local nearest = nil 
            local last = math.huge 
            local playerMousePos = Cam.ViewportSize / 2 
            for _, player in ipairs(Players:GetPlayers()) do 
                if player ~= Players.LocalPlayer then 
                    local part = player.Character and player.Character:FindFirstChild(trg_part) 
                    if part then 
                        local ePos, isVisible = Cam:WorldToViewportPoint(part.Position) 
                        local distance = (Vector2.new(ePos.x, ePos.y) - playerMousePos).Magnitude 
                        if distance < last and isVisible and distance < fov then 
                            last = distance 
                            nearest = player 
                        end 
                    end 
                end 
            end 
            return nearest 
        end 
        RunService.RenderStepped:Connect(function() 
            updateDrawings() 
            local closest = getClosestPlayerInFOV("Head") 
            if closest and closest.Character and closest.Character:FindFirstChild("Head") then 
                local targetCharacter = closest.Character 
                local targetHead = targetCharacter.Head 
                local targetRootPart = targetCharacter:FindFirstChild("HumanoidRootPart") 
                local isMoving = targetRootPart and targetRootPart.Velocity.Magnitude > 0.1 
                local targetPosition 
                if isMoving then 
                    targetPosition = targetHead.Position + (targetHead.CFrame.LookVector * crosshairDistance) 
                else 
                    targetPosition = targetHead.Position 
                end 
                targetCFrame = CFrame.new(Cam.CFrame.Position, targetPosition) 
            else 
                targetCFrame = Cam.CFrame 
            end 
            Cam.CFrame = Cam.CFrame:Lerp(targetCFrame, 1 / smoothness) 
        end) 
        FovSlider.FocusLost:Connect(function(enterPressed, inputThatCausedFocusLoss) 
            if enterPressed then 
                local newFov = tonumber(FovSlider.Text) 
                if newFov then 
                    fov = newFov 
                else 
                    FovSlider.Text = tostring(fov) 
                end 
            end 
        end) 
        SmoothnessSlider.FocusLost:Connect(function(enterPressed, inputThatCausedFocusLoss) 
            if enterPressed then 
                local newSmoothness = tonumber(SmoothnessSlider.Text) 
                if newSmoothness then 
                    smoothness = newSmoothness 
                else 
                    SmoothnessSlider.Text = tostring(smoothness) 
                end 
            end 
        end) 
        CrosshairDistanceSlider.FocusLost:Connect(function(enterPressed, inputThatCausedFocusLoss) 
            if enterPressed then 
                local newCrosshairDistance = tonumber(CrosshairDistanceSlider.Text) 
                if newCrosshairDistance then 
                    crosshairDistance = newCrosshairDistance 
                else 
                    CrosshairDistanceSlider.Text = tostring(crosshairDistance) 
                end 
            end 
        end) 
    end
})

TabHandles.FWQ1Settings:Toggle({
    Title = "Circle ESP",
    Default = false,
    Callback = function(state)
        for _, player in pairs(game.Players:GetPlayers()) do
            if player ~= game.Players.LocalPlayer then
                if state then
                    if player.Character then
                        local highlight = Instance.new("Highlight")
                        highlight.Parent = player.Character
                        highlight.Adornee = player.Character

                        local billboard = Instance.new("BillboardGui")
                        billboard.Parent = player.Character
                        billboard.Adornee = player.Character
                        billboard.Size = UDim2.new(0, 100, 0, 100)
                        billboard.StudsOffset = Vector3.new(0, 3, 0)
                        billboard.AlwaysOnTop = true

                        local nameLabel = Instance.new("TextLabel")
                        nameLabel.Parent = billboard
                        nameLabel.Size = UDim2.new(1, 0, 1, 0)
                        nameLabel.BackgroundTransparency = 1
                        nameLabel.Text = player.Name
                        nameLabel.TextColor3 = Color3.new(1, 1, 1)
                        nameLabel.TextStrokeTransparency = 0.5
                        nameLabel.TextScaled = true

                        local circle = Instance.new("ImageLabel")
                        circle.Parent = billboard
                        circle.Size = UDim2.new(0, 50, 0, 50)
                        circle.Position = UDim2.new(0.5, 0, 0.5, 0)
                        circle.AnchorPoint = Vector2.new(0.5, 0.5)
                        circle.BackgroundTransparency = 1
                        circle.Image = "rbxassetid://2200552246"
                    end
                else
                    if player.Character then
                        if player.Character:FindFirstChildOfClass("Highlight") then
                            player.Character:FindFirstChildOfClass("Highlight"):Destroy()
                        end
                        if player.Character:FindFirstChildOfClass("BillboardGui") then
                            player.Character:FindFirstChildOfClass("BillboardGui"):Destroy()
                        end
                    end
                end
            end
        end
    end
})

local TabHandles2 = {
    FWQ2Settings = Tabs.Game:Tab({ Title = "被遗弃", Icon = "crown" }),
}

TabHandles2.FWQ2Settings:Button({
    Title = "旧冬被遗弃",
    Callback = function()
        getgenv().XiaoXu="旧冬Q群:467989227"
        loadstring(game:HttpGet("https://raw.githubusercontent.com/QiuShan-UX/UnicoX/refs/heads/main/%E6%97%A7%E5%86%ACScript--Forsaken.lua.txt"))()
    end
})

TabHandles2.FWQ2Settings:Button({
    Title = "访客自动格挡",
    Callback = function()
        local Players = game:GetService("Players")
        local ReplicatedStorage = game:GetService("ReplicatedStorage")
        local RunService = game:GetService("RunService")

        local config = {
            BlockDistance = 15,
            ScanInterval = 0.05,
            BlockCooldown = 0.5,
            DebugMode = true,
            TargetSoundIds = {
                "rbxassetid://102228729296384",
                "rbxassetid://140242176732868",
                "rbxassetid://12222216",
                "rbxassetid://86174610237192",
                "rbxassetid://101199185291628",
                "rbxassetid://95079963655241",
                "rbxassetid://112809109188560",
                "rbxassetid://84307400688050",
                "rbxassetid://136323728355613",
                "rbxassetid://115026634746636"
            }
        }

        local LocalPlayer = Players.LocalPlayer
        local RemoteEvent = ReplicatedStorage:WaitForChild("Modules"):WaitForChild("Network"):WaitForChild("RemoteEvent")
        local lastBlockTime = 0

        local function HasTargetSound(character)
            if not character then return false end
            
            local humanoidRootPart = character:FindFirstChild("HumanoidRootPart")
            if humanoidRootPart then
                for _, child in ipairs(humanoidRootPart:GetDescendants()) do
                    if child:IsA("Sound") then
                        for _, targetId in ipairs(config.TargetSoundIds) do
                            if child.SoundId == targetId then
                                if config.DebugMode then
                                    print("Audio detected:", humanoidRootPart:GetFullName(), "ID:", child.SoundId)
                                end
                                return true
                            end
                        end
                    end
                end
            end
            
            for _, sound in ipairs(character:GetDescendants()) do
                if sound:IsA("Sound") then
                    for _, targetId in ipairs(config.TargetSoundIds) do
                        if sound.SoundId == targetId then
                            if config.DebugMode then
                                print("Audio detected:", sound:GetFullName(), "ID:", sound.SoundId)
                            end
                            return true
                        end
                    end
                end
            end
            
            return false
        end

        local function GetKillersInRange()
            local killers = {}
            local killersFolder = workspace:FindFirstChild("Killers") or workspace:FindFirstChild("Players"):FindFirstChild("Killers")
            if not killersFolder then return killers end
            
            local myCharacter = LocalPlayer.Character
            if not myCharacter or not myCharacter:FindFirstChild("HumanoidRootPart") then return killers end
            
            local myPos = myCharacter.HumanoidRootPart.Position
            
            for _, killer in ipairs(killersFolder:GetChildren()) do
                if killer:FindFirstChild("HumanoidRootPart") then
                    local distance = (killer.HumanoidRootPart.Position - myPos).Magnitude
                    if distance <= config.BlockDistance then
                        table.insert(killers, killer)
                    end
                end
            end
            
            return killers
        end

        local function PerformBlock()
            if os.clock() - lastBlockTime >= config.BlockCooldown then
                RemoteEvent:FireServer("UseActorAbility", "Block")
                lastBlockTime = os.clock()
                if config.DebugMode then
                    print("Block performed at:", os.clock())
                end
            end
        end

        local function CheckConditions()
            local killers = GetKillersInRange()
            
            for _, killer in ipairs(killers) do
                if HasTargetSound(killer) then
                    PerformBlock()
                    break
                end
            end
        end

        local function Initialize()
            if not LocalPlayer.Character then
                LocalPlayer.CharacterAdded:Wait()
            end

            RunService.Stepped:Connect(function()
                pcall(CheckConditions)
            end)
            
            print("Block system initialized")
            print("Range:", config.BlockDistance, "m | Audio IDs:", #config.TargetSoundIds)
        end

        Initialize()
    end
})

local TabHandles3 = {
    FWQ3Settings = Tabs.Game:Tab({ Title = "99夜", Icon = "crown" }),
}

TabHandles3.FWQ3Settings:Button({
    Title = "XA 99夜",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Xingtaiduan/Script/refs/heads/main/Games/森林中的99夜.lua"))()
    end
})

TabHandles3.FWQ3Settings:Button({
    Title = "二狗子99夜",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/gycgchgyfytdttr/shenqin/refs/heads/main/99day.lua"))()
    end
})

TabHandles3.FWQ3Settings:Button({
    Title = "UnicoX99夜 好用！",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/XiaoXuCynic/Free-Script/refs/heads/main/UnicoX99%E5%A4%9C%E6%B7%B7%E6%B7%86.lua"))()
    end
})

TabHandles3.FWQ3Settings:Button({
    Title = "死铁轨",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/XiaoXuCynic/Free-Script/refs/heads/main/UnicoX99%E5%A4%9C%E6%B7%B7%E6%B7%86.lua"))()
    end
})

local TabHandles5 = {
    FWQ4Settings = Tabs.Game:Tab({ Title = "终级战场", Icon = "crown" }),
}

TabHandles5.FWQ4Settings:Button({
    Title = "篡改",
    Desc = "玩的时候第一先开启这个功能一定要",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/dream77239/ubg-script/refs/heads/main/%E6%8B%A6%E6%88%AA.txt"))()
    end
})

local fakeBlockEnabled = false
local loopRunning = false

TabHandles5.FWQ4Settings:Toggle({
    Title = "假防(关闭功能后按一次防御即可取消假防)",
    Default = false,
    Callback = function(state)
        fakeBlockEnabled = state

        local ReplicatedStorage = game:GetService("ReplicatedStorage")
        local BlockRemote = ReplicatedStorage:WaitForChild("Remotes"):WaitForChild("Combat"):WaitForChild("Block")
        local Players = game:GetService("Players")
        local player = Players.LocalPlayer
        local character = player.Character or player.CharacterAdded:Wait()

        local function enableBlock()
            pcall(function()
                BlockRemote:FireServer(true)
            end)
        end

        if fakeBlockEnabled then
            enableBlock()
        end

        if not loopRunning then
            loopRunning = true
            task.spawn(function()
                while true do
                    task.wait(0.01)
                    if fakeBlockEnabled then
                        local success, isBlocking = pcall(function()
                            return character:GetAttribute("IsBlocking")
                        end)
                        if success and not isBlocking then
                            enableBlock()
                        end
                    end
                end
            end)
        end
    end
})

local defaultCooldown = game:GetService("ReplicatedStorage").Settings.Cooldowns.Dash.Value

TabHandles5.FWQ4Settings:Toggle({
    Title = "侧闪无冷却",
    Default = false,
    Callback = function(state)
        local dashCooldown = game:GetService("ReplicatedStorage").Settings.Cooldowns.Dash
        if state then
            dashCooldown.Value = 1
        else
            dashCooldown.Value = defaultCooldown
        end
    end
})

local defaultMeleeCooldown = game:GetService("ReplicatedStorage").Settings.Cooldowns.Melee.Value

TabHandles5.FWQ4Settings:Toggle({
    Title = "近战无冷却",
    Default = false,
    Callback = function(state)
        local meleeCooldown = game:GetService("ReplicatedStorage").Settings.Cooldowns.Melee
        if state then
            meleeCooldown.Value = 1
        else
            meleeCooldown.Value = defaultMeleeCooldown
        end
    end
})

local rs = game:GetService("ReplicatedStorage")
local settings = rs.Settings

local defaultAbility = settings.Cooldowns.Ability.Value
TabHandles5.FWQ4Settings:Toggle({
    Title = "技能无冷却(仅宿傩角色)",
    Default = false,
    Callback = function(state)
        settings.Cooldowns.Ability.Value = state and 1 or defaultAbility
    end
})

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local noSlowdownsToggle = ReplicatedStorage.Settings.Toggles.NoSlowdowns

local defaultValue = false

TabHandles5.FWQ4Settings:Toggle({
    Title = "无减速效果",
    Default = noSlowdownsToggle.Value,
    Callback = function(state)
        if state then
            noSlowdownsToggle.Value = true
        else
            noSlowdownsToggle.Value = defaultValue
        end
    end
})

local defaultDisableHitStun = settings.Toggles.DisableHitStun.Value
TabHandles5.FWQ4Settings:Toggle({
    Title = "取消被攻击硬直",
    Default = false,
    Callback = function(state)
        settings.Toggles.DisableHitStun.Value = state
    end
})

local defaultDisableIntros = settings.Toggles.DisableIntros.Value
TabHandles5.FWQ4Settings:Toggle({
    Title = "跳过角色开场动作",
    Default = false,
    Callback = function(state)
        settings.Toggles.DisableIntros.Value = state
    end
})

local defaultNoStunOnMiss = settings.Toggles.NoStunOnMiss.Value
TabHandles5.FWQ4Settings:Toggle({
    Title = "普攻无僵直",
    Default = false,
    Callback = function(state)
        settings.Toggles.NoStunOnMiss.Value = state
    end
})

local defaultRagdollTimer = settings.Multipliers.RagdollTimer.Value
TabHandles5.FWQ4Settings:Toggle({
    Title = "被别人击倒不会变成布娃娃",
    Default = false,
    Callback = function(state)
        settings.Multipliers.RagdollTimer.Value = state and 0.5 or defaultRagdollTimer
    end
})

local defaultUltimateTimer = settings.Multipliers.UltimateTimer.Value
TabHandles5.FWQ4Settings:Toggle({
    Title = "延长大招时间",
    Default = false,
    Callback = function(state)
        settings.Multipliers.UltimateTimer.Value = state and 100000 or defaultUltimateTimer
    end
})

local defaultInstantTransformation = settings.Toggles.InstantTransformation.Value
TabHandles5.FWQ4Settings:Toggle({
    Title = "秒开大",
    Default = false,
    Callback = function(state)
        settings.Toggles.InstantTransformation.Value = state
    end
})

local Players = game:GetService("Players")
local player = Players.LocalPlayer
local Ping = player:WaitForChild("Info"):WaitForChild("Ping")

local loop

TabHandles5.FWQ4Settings:Toggle({
    Title = "ping乱码",
    Default = false,
    Callback = function(state)
        if state then
            loop = task.spawn(function()
                while state do
                    for i = 0, 999, 25 do
                        if not state then break end
                        Ping.Value = i
                        task.wait(0.03)
                    end
                    for i = 999, 0, -25 do
                        if not state then break end
                        Ping.Value = i
                        task.wait(0.03)
                    end
                end
            end)
        else
            if loop then
                task.cancel(loop)
                loop = nil
            end
        end
    end
})

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local MeleeDamage = ReplicatedStorage:WaitForChild("Settings"):WaitForChild("Multipliers"):WaitForChild("MeleeDamage")

MeleeDamage.Value = 100

TabHandles5.FWQ4Settings:Toggle({
    Title = "一拳倒地",
    Default = false,
    Callback = function(state)
        if state then
            MeleeDamage.Value = 1000000
        else
            MeleeDamage.Value = 100
        end
    end
})

TabHandles5.FWQ4Settings:Toggle({
    Title = "一拳击飞",
    Default = false,
    Callback = function(state)
        local Players = game:GetService("Players")
        local ReplicatedStorage = game:GetService("ReplicatedStorage")
        local RunService = game:GetService("RunService")

        local LocalPlayer = Players.LocalPlayer
        local Character = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
        local HumanoidRootPart = Character:WaitForChild("HumanoidRootPart")

        local RagdollPower = ReplicatedStorage:WaitForChild("Settings"):WaitForChild("Multipliers"):WaitForChild("RagdollPower")

        local maxTeleportDistance = 50
        local lastPosition = HumanoidRootPart.Position
        local connection

        if state then
            RagdollPower.Value = 10000

            connection = RunService.RenderStepped:Connect(function()
                if not LocalPlayer.Character or not LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
                    Character = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
                    HumanoidRootPart = Character:WaitForChild("HumanoidRootPart")
                    lastPosition = HumanoidRootPart.Position
                end

                local currentPos = HumanoidRootPart.Position
                local distance = (currentPos - lastPosition).Magnitude

                if distance > maxTeleportDistance then
                    HumanoidRootPart.CFrame = CFrame.new(lastPosition)
                else
                    lastPosition = currentPos
                end
            end)
        else
            RagdollPower.Value = 100
            if connection then
                connection:Disconnect()
                connection = nil
            end
        end
    end
})

local about = TabHandles.FWQ1Settings:Section({Title = "面板", Opened = true})

about:Button({
    Title = "范围",
    Callback = function()
        _G.HeadSize = 150 
        _G.Disabled = true 
        game:GetService('RunService').RenderStepped:connect(function() 
            if _G.Disabled then 
                for i,v in next, game:GetService('Players'):GetPlayers() do 
                    if v.Name ~= game:GetService('Players').LocalPlayer.Name then 
                        pcall(function() 
                            if v.Character and v.Character:FindFirstChild("HumanoidRootPart") then
                                v.Character.HumanoidRootPart.Size = Vector3.new(_G.HeadSize,_G.HeadSize,_G.HeadSize) 
                                v.Character.HumanoidRootPart.Transparency = 0.7 
                                v.Character.HumanoidRootPart.BrickColor = BrickColor.new("Really blue") 
                                v.Character.HumanoidRootPart.Material = "Neon" 
                                v.Character.HumanoidRootPart.CanCollide = false 
                            end
                        end) 
                    end 
                end 
            end 
        end)
    end
})

about:Button({
    Title = "无限子弹",
    Callback = function()
        local lp = game.Players.LocalPlayer 
        for i, v in next, lp.Backpack:GetDescendants() do 
            if v.Name == 'Settings' then 
                local success, settingsModule = pcall(require, v) 
                if success then 
                    settingsModule.Ammo = math.huge 
                else 
                    warn("无法要求设置: " .. tostring(settingsModule)) 
                end 
            end 
        end
    end
})

about:Button({
    Title = "传送到空投",
    Callback = function()
        local Folder = workspace["Game Systems"] 
        local player = game.Players.LocalPlayer.Character.HumanoidRootPart 
        for _, Child in ipairs(Folder:GetDescendants()) do 
            if Child.Name:match("Airdrop_") and Child:FindFirstChild("MainPart") then 
                player.CFrame = Child.MainPart.CFrame 
            end 
        end
    end
})

about:Button({
    Title = "传送回基地",
    Callback = function()
        if game:GetService("Players").LocalPlayer.Character then
            game:GetService("Players").LocalPlayer.Character:MoveTo(workspace.Tycoon.Tycoons[game:GetService("Players").LocalPlayer.leaderstats.Team.Value].Essentials.Spawn.Position)
        end
    end
})

about:Button({
    Title = "传送旗帜",
    Callback = function()
        if game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(73.22032928466797, 47.9999885559082, 191.06993103027344)
        end
    end
})

about:Button({
    Title = "传送油桶1",
    Callback = function()
        if game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-9.748652458190918, 48.662540435791016, 700.2245483398438)
        end
    end
})

about:Button({
    Title = "传送油桶2",
    Callback = function()
        if game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(76.48243713378906, 105.25657653808594, -2062.3896484375)
        end
    end
})

about:Button({
    Title = "传送油桶3",
    Callback = function()
        if game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-28.840208053588867, 49.34040069580078, -416.9921569824219)
        end
    end
})

about:Button({
    Title = "传送油桶4",
    Callback = function()
        if game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(69.48390197753906, 105.25657653808594, 3434.9033203125)
        end
    end
})

local TabHandles6 = {
    FWQ5Settings = Tabs.Game:Tab({ Title = "活到7天", Icon = "crown" }),
}

local ESPName = {
    "ScpESPFloder",
    "AnimalESPFloder",
}
for _,v in next,ESPName do
    if not workspace:FindFirstChild(v) then
        local ESPFloder = Instance.new("Folder")
        ESPFloder.Parent = workspace
        ESPFloder.Name = v
    end
end

local function ESPMonster(Text, Adornee, Color)
    if not Adornee:FindFirstChild("ROLESPBillboardGui") then
        local ROLESPBillboardGui = Instance.new("BillboardGui")
        ROLESPBillboardGui.Parent = workspace.ScpESPFloder
        ROLESPBillboardGui.Adornee = Adornee
        ROLESPBillboardGui.Size = UDim2.new(0, 20, 0, 20)
        ROLESPBillboardGui.StudsOffset = Vector3.new(0, 3, 0)
        ROLESPBillboardGui.AlwaysOnTop = true
        local ROLESPTextLabel = Instance.new("TextLabel")
        ROLESPTextLabel.Parent = ROLESPBillboardGui
        ROLESPTextLabel.Size = UDim2.new(1, 0, 1, 0)
        ROLESPTextLabel.BackgroundTransparency = 1
        ROLESPTextLabel.Text = Text
        ROLESPTextLabel.TextColor3 = Color
        ROLESPTextLabel.TextStrokeTransparency = 0.5
        ROLESPTextLabel.TextScaled = true
    end
end

local function ESPAnimal(Text, Adornee, Color)
    if not Adornee:FindFirstChild("ROLESPBillboardGui") then
        local ROLESPBillboardGui = Instance.new("BillboardGui")
        ROLESPBillboardGui.Parent = workspace.AnimalESPFloder
        ROLESPBillboardGui.Adornee = Adornee
        ROLESPBillboardGui.Size = UDim2.new(0, 20, 0, 20)
        ROLESPBillboardGui.StudsOffset = Vector3.new(0, 3, 0)
        ROLESPBillboardGui.AlwaysOnTop = true
        local ROLESPTextLabel = Instance.new("TextLabel")
        ROLESPTextLabel.Parent = ROLESPBillboardGui
        ROLESPTextLabel.Size = UDim2.new(1, 0, 1, 0)
        ROLESPTextLabel.BackgroundTransparency = 1
        ROLESPTextLabel.Text = Text
        ROLESPTextLabel.TextColor3 = Color
        ROLESPTextLabel.TextStrokeTransparency = 0.5
        ROLESPTextLabel.TextScaled = true
    end
end

local OAO = game.Players.LocalPlayer
local QWQ = game.ReplicatedStorage
local OvO = {
    instantlycutofftree = false,
    AutoCollectScraps = false,
    AutoCollectDirt = false,
    AutoCollectHarvt = false,
    KillAll = false,
    KillAura = false,
    AutoTpPine = false,
    AutoHeli = false,
    AutoCast = false
}

local function findClosestPine()
    local closestPine = nil
    local shortestDistance = math.huge
    if OAO.Character and OAO.Character:FindFirstChild("HumanoidRootPart") then
        for _, v in next, workspace.trees:GetChildren() do
            if v.Name:find("Pine") and v.PrimaryPart then
                local distance = (v.PrimaryPart.Position - OAO.Character.HumanoidRootPart.Position).Magnitude
                if distance < shortestDistance then
                    closestPine = v
                    shortestDistance = distance
                end
            end
        end
    end
    return closestPine
end

game:GetService("Players").LocalPlayer.Idled:Connect(function()
    game:GetService("VirtualUser"):Button2Down(Vector2.new(0, 0), workspace.CurrentCamera.CFrame)
    task.wait(1)
    game:GetService("VirtualUser"):Button2Up(Vector2.new(0, 0), workspace.CurrentCamera.CFrame)
    game:GetService("VirtualUser"):CaptureController()
    game:GetService("VirtualUser"):ClickButton2(Vector2.new())
end)

local animalConnection
local scpConnection

TabHandles6.FWQ5Settings:Toggle({
    Title = "动物透视",
    Default = false,
    Callback = function(state)
        if state then
            if animalConnection then animalConnection:Disconnect() end
            for _, v in next, workspace.animals:GetChildren() do
                ESPAnimal(v.Name, v, Color3.new(1, 0, 0))
            end
            animalConnection = workspace.animals.ChildAdded:Connect(function(v)
                ESPAnimal(v.Name, v, Color3.new(1, 0, 0))
            end)
        else
            if animalConnection then animalConnection:Disconnect() end
            if workspace:FindFirstChild("AnimalESPFloder") then
                workspace.AnimalESPFloder:ClearAllChildren()
            end
        end
    end
})

TabHandles6.FWQ5Settings:Toggle({
    Title = "怪物透视",
    Default = false,
    Callback = function(state)
        if state then
            if scpConnection then scpConnection:Disconnect() end
            for _, v in next, workspace.scps:GetChildren() do
                ESPMonster("怪物", v, Color3.new(0, 0, 1))
            end
            scpConnection = workspace.scps.ChildAdded:Connect(function(v)
                ESPMonster("怪物", v, Color3.new(0, 0, 1))
            end)
        else
            if scpConnection then scpConnection:Disconnect() end
            if workspace:FindFirstChild("ScpESPFloder") then
                workspace.ScpESPFloder:ClearAllChildren()
            end
        end
    end
})

TabHandles6.FWQ5Settings:Toggle({
    Title = "秒砍树",
    Default = false,
    Callback = function(state)
        OvO.instantlycutofftree = state
        if state then
            spawn(function()
                while OvO.instantlycutofftree do 
                    task.wait()
                    QWQ.remotes.swing_axe:FireServer()
                    for _,v in next,workspace.logs:GetChildren() do
                        if v.Name == "log" and v:FindFirstChild("main") and v.main:FindFirstChild("ProximityPrompt") then
                            fireproximityprompt(v.main.ProximityPrompt)
                        end
                    end
                end
            end)
        end
    end
})

TabHandles6.FWQ5Settings:Toggle({
    Title = "自动钓鱼",
    Default = false,
    Callback = function(state)
        OvO.AutoCast = state
        if state then
            spawn(function()
                while OvO.AutoCast do 
                    task.wait()
                    game:GetService("ReplicatedStorage").remotes.cast:FireServer()
                    task.wait(0.2)
                    for i = 1,8 do
                        game:GetService("ReplicatedStorage").remotes.hit_fish:FireServer()
                    end
                end
            end)
        end
    end
})

TabHandles6.FWQ5Settings:Button({
    Title = "秒吃食物",
    Callback = function()
        if OAO.Character and OAO.Character:FindFirstChild("hunger") and OAO.Character.hunger.Value < 30 then
            for _,v in pairs(OAO.Backpack:GetChildren()) do
                if v:FindFirstChild("eat") then
                    for i = 1, 20 do
                        v.Parent = OAO.Character
                        OAO.Character[v.Name].eat:FireServer()
                    end
                end
            end
        end
    end
})

TabHandles6.FWQ5Settings:Toggle({
    Title = "自动收集材料",
    Default = false,
    Callback = function(state)
        OvO.AutoCollectScraps = state
        if state then
            spawn(function()
                while OvO.AutoCollectScraps do 
                    task.wait()
                    if OAO.Character and OAO.Character:FindFirstChild("HumanoidRootPart") then
                        local oldcf = OAO.Character.HumanoidRootPart.CFrame
                        for _, v in pairs(workspace.scraps:GetChildren()) do
                            local material = v:FindFirstChild("defaultMaterial10")
                            if material and OvO.AutoCollectScraps then
                                local prompt = material:FindFirstChild("ProximityPrompt")
                                if prompt and OvO.AutoCollectScraps then
                                    OAO.Character.HumanoidRootPart.CFrame = material.CFrame + Vector3.new(0, 3, 0)
                                    task.wait(0.2)
                                    fireproximityprompt(prompt)
                                    task.wait(0.2) 
                                    OAO.Character.HumanoidRootPart.CFrame = oldcf
                                end
                            end
                        end
                    end
                end
            end)
        end
    end
})

TabHandles6.FWQ5Settings:Button({
    Title = "传送回出生点",
    Callback = function()
        if OAO.Character and OAO.Character:FindFirstChild("HumanoidRootPart") then
            OAO.Character.HumanoidRootPart.CFrame = CFrame.new(57,42,416)
        end
    end
})

local oldpos
TabHandles6.FWQ5Settings:Toggle({
    Title = "自动收集成熟品",
    Default = false,
    Callback = function(state)
        OvO.AutoCollectHarvt = state
        if state then
            if OAO.Character and OAO.Character:FindFirstChild("HumanoidRootPart") then
                oldpos = OAO.Character.HumanoidRootPart.CFrame
                spawn(function()
                    while OvO.AutoCollectHarvt do 
                        task.wait()
                        if OAO.Character and OAO.Character:FindFirstChild("HumanoidRootPart") then
                            for _,v in next,workspace.harvest:GetChildren() do
                                if v:FindFirstChild("main") then
                                    OAO.Character.HumanoidRootPart.CFrame = v.main.CFrame
                                    fireproximityprompt(v.main.ProximityPrompt)
                                end
                            end
                        end
                    end
                end)
            end
        else
            if OAO.Character and OAO.Character:FindFirstChild("HumanoidRootPart") then
                OAO.Character.HumanoidRootPart.CFrame = oldpos
            end
        end
    end
})

TabHandles6.FWQ5Settings:Toggle({
    Title = "自动收集生鹿肉",
    Default = false,
    Callback = function(state)
        OvO.AutoCollectHarvt = state
        if state then
            if OAO.Character and OAO.Character:FindFirstChild("HumanoidRootPart") then
                oldpos = OAO.Character.HumanoidRootPart.CFrame
                spawn(function()
                    while OvO.AutoCollectHarvt do 
                        task.wait()
                        if OAO.Character and OAO.Character:FindFirstChild("HumanoidRootPart") then
                            for _,v in next,workspace.interact:GetChildren() do
                                if v.Name == "deer" and v:FindFirstChild("lungs,heart,intestines") then
                                    OAO.Character.HumanoidRootPart.CFrame = v["lungs,heart,intestines"].CFrame
                                    fireproximityprompt(v["lungs,heart,intestines"].ProximityPrompt)
                                end
                            end
                        end
                    end
                end)
            end
        else
            if OAO.Character and OAO.Character:FindFirstChild("HumanoidRootPart") then
                OAO.Character.HumanoidRootPart.CFrame = oldpos
            end
        end
    end
})

TabHandles6.FWQ5Settings:Toggle({
    Title = "自动收集包菜",
    Default = false,
    Callback = function(state)
        OvO.AutoCollectDirt = state
        if state then
            if OAO.Character and OAO.Character:FindFirstChild("HumanoidRootPart") then
                oldpos = OAO.Character.HumanoidRootPart.CFrame
                spawn(function()
                    while OvO.AutoCollectDirt do 
                        task.wait()
                        if OAO.Character and OAO.Character:FindFirstChild("HumanoidRootPart") then
                            if workspace.builds and workspace.builds["Cabbage Farm"] and workspace.builds["Cabbage Farm"]:FindFirstChild("dirt") then
                                OAO.Character.HumanoidRootPart.CFrame = workspace.builds["Cabbage Farm"].dirt.CFrame
                                fireproximityprompt(workspace.builds["Cabbage Farm"].dirt.ProximityPrompt)
                            end
                        end
                    end
                end)
            end
        else
            if OAO.Character and OAO.Character:FindFirstChild("HumanoidRootPart") then
                OAO.Character.HumanoidRootPart.CFrame = oldpos
            end
        end
    end
})

TabHandles6.FWQ5Settings:Toggle({
    Title = "枪械光环",
    Default = false,
    Callback = function(state)
        OvO.KillAll = state
        if state then
            spawn(function()
                while OvO.KillAll do 
                    task.wait()
                    for _,v in next,workspace.scps:GetChildren() do
                        if v:FindFirstChild("HumanoidRootPart") then
                            local args = {
                                [1] = CFrame.new(v.HumanoidRootPart.Position.X, v.HumanoidRootPart.Position.Y, v.HumanoidRootPart.Position.Z) * CFrame.Angles(0, 0, 0),
                                [2] = CFrame.new(v.HumanoidRootPart.Position.X, v.HumanoidRootPart.Position.Y, v.HumanoidRootPart.Position.Z) * CFrame.Angles(0, 0, 0),
                            }
                            game:GetService("ReplicatedStorage").remotes.shoot:FireServer(unpack(args))
                            game:GetService("ReplicatedStorage").remotes.reload:FireServer()
                        end
                    end
                    for _,v in next,workspace.animals:GetChildren() do
                        if v:FindFirstChild("HumanoidRootPart") then
                            local args = {
                                [1] = CFrame.new(v.HumanoidRootPart.Position.X, v.HumanoidRootPart.Position.Y, v.HumanoidRootPart.Position.Z) * CFrame.Angles(0, 0, 0),
                                [2] = CFrame.new(v.HumanoidRootPart.Position.X, v.HumanoidRootPart.Position.Y, v.HumanoidRootPart.Position.Z) * CFrame.Angles(0, 0, 0),
                            }
                            game:GetService("ReplicatedStorage").remotes.shoot:FireServer(unpack(args))
                            game:GetService("ReplicatedStorage").remotes.reload:FireServer()
                        end
                    end
                end
            end)
        end
    end
})

TabHandles6.FWQ5Settings:Toggle({
    Title = "子弹追踪(锁头)",
    Default = false,
    Callback = function(state)
        OvO.KillAura = state
        if state then
            spawn(function()
                while OvO.KillAura do 
                    task.wait()
                    if OAO.Character and OAO.Character:FindFirstChild("HumanoidRootPart") then
                        for _, scp in ipairs(workspace.scps:GetChildren()) do
                            local HitPart = scp:FindFirstChild("HumanoidRootPart") or scp:FindFirstChild("Head")
                            if HitPart and scp:FindFirstChildWhichIsA("Humanoid") and scp.Humanoid.Health > 0 then
                                game.ReplicatedStorage.remotes.shoot:FireServer(HitPart.CFrame + Vector3.new(0, 0.5, 0), HitPart.CFrame)
                            end
                        end
                        for _, animal in ipairs(workspace.animals:GetChildren()) do
                            local HitPart = animal:FindFirstChild("HumanoidRootPart") or animal:FindFirstChild("Head")
                            if HitPart and animal:FindFirstChildWhichIsA("Humanoid") and animal.Humanoid.Health > 0 then
                                game.ReplicatedStorage.remotes.shoot:FireServer(HitPart.CFrame + Vector3.new(0, 0.5, 0), HitPart.CFrame)
                            end
                        end
                    end
                end
            end)
        end
    end
})

TabHandles6.FWQ5Settings:Toggle({
    Title = "自动传送最近的木头",
    Default = false,
    Callback = function(state)
        OvO.AutoTpPine = state
        if state then
            spawn(function()
                while OvO.AutoTpPine do 
                    task.wait()
                    if OAO.Character and OAO.Character:FindFirstChild("HumanoidRootPart") then
                        local closestPine = findClosestPine()
                        if closestPine then
                            local targetPosition = closestPine.PrimaryPart.Position
                            OAO.Character.HumanoidRootPart.CFrame = CFrame.new(Vector3.new(targetPosition.X, targetPosition.Y - 30, targetPosition.Z))
                            OAO.Character.HumanoidRootPart.Anchored = OvO.AutoTpPine
                        end
                    end
                end
            end)
        else
            if OAO.Character and OAO.Character:FindFirstChild("HumanoidRootPart") then
                OAO.Character.HumanoidRootPart.Anchored = false
            end
        end
    end
})

TabHandles6.FWQ5Settings:Toggle({
    Title = "开启无限模式",
    Default = false,
    Callback = function(state)
        if workspace:FindFirstChild("infinite") then
            workspace.infinite.Value = state
        end
    end
})

TabHandles6.FWQ5Settings:Toggle({
    Title = "开启雨天",
    Default = false,
    Callback = function(state)
        if workspace:FindFirstChild("raining") then
            workspace.raining.Value = state
        end
    end
})

TabHandles6.FWQ5Settings:Toggle({
    Title = "自动拾取飞机残骸",
    Default = false,
    Callback = function(state)
        OvO.AutoHeli = state
        if state then
            spawn(function()
                while OvO.AutoHeli do 
                    task.wait()
                    for _,v in next,workspace.interact:GetChildren() do
                        if v.Name == "heli" and v:FindFirstChild("Body") and v.Body:FindFirstChild("ProximityPrompt") then
                            fireproximityprompt(v.Body.ProximityPrompt)
                        end
                    end
                end
            end)
        end
    end
})

local TabHandles7 = {
    FWQ6Settings = Tabs.Game:Tab({ Title = "自然灾害", Icon = "crown" }),
}

local r156_0 = TabHandles7.FWQ6Settings:Section({Title = "主要功能", Opened = true})

local autowinfarmEnabled = false
r156_0:Toggle({
    Title = "自动存活",
    Default = false,
    Callback = function(enabled)
        autowinfarmEnabled = enabled
        while wait(0.1) do
            if autowinfarmEnabled then
                local character = game.Players.LocalPlayer.Character
                if character and character:FindFirstChild("HumanoidRootPart") then
                    character.HumanoidRootPart.CFrame = CFrame.new(-236, 180, 360, 1, 0, 0, 0, 1, 0, 0, 0, 1)
                end
            else
                break
            end
        end
    end
})

local predictDisasterEnabled = false
local plr = game.Players.LocalPlayer
local Message = Instance.new("TextLabel")
Message.Parent = game.Players.LocalPlayer.PlayerGui
Message.Size = UDim2.new(0, 200, 0, 50)
Message.Position = UDim2.new(0.5, -100, 0.1, 0)
Message.BackgroundTransparency = 0.5
Message.TextColor3 = Color3.new(1, 1, 1)
Message.Visible = false

r156_0:Toggle({
    Title = "预测灾害",
    Default = false,
    Callback = function(enabled)
        predictDisasterEnabled = enabled
        while wait(1) do
            if predictDisasterEnabled then
                local character = plr.Character
                if character and character:FindFirstChild("SurvivalTag") then
                    local survivalTag = character.SurvivalTag.Value
                    Message.Visible = true
                    if survivalTag == "Blizzard" then
                        Message.Text = "下一个灾难是：暴风雪"
                    elseif survivalTag == "Sandstorm" then
                        Message.Text = "下一个灾难是：沙尘暴"
                    elseif survivalTag == "Tornado" then
                        Message.Text = "下一个灾难是：龙卷风"
                    elseif survivalTag == "Volcanic Eruption" then
                        Message.Text = "下一个灾难是：火山"
                    elseif survivalTag == "Flash Flood" then
                        Message.Text = "下一个灾难是：洪水"
                    elseif survivalTag == "Deadly Virus" then
                        Message.Text = "下一个灾难是：病毒"
                    elseif survivalTag == "Tsunami" then
                        Message.Text = "下一个灾难是：海啸"
                    elseif survivalTag == "Acid Rain" then
                        Message.Text = "下一个灾难是：酸雨"
                    elseif survivalTag == "Fire" then
                        Message.Text = "下一个灾难是：火焰"
                    elseif survivalTag == "Meteor Shower" then
                        Message.Text = "下一个灾难是：流星雨"
                    elseif survivalTag == "Earthquake" then
                        Message.Text = "下一个灾难是：地震"
                    elseif survivalTag == "Thunder Storm" then
                        Message.Text = "下一个灾难是：暴风雨"
                    else
                        Message.Visible = false
                    end
                end
            else
                Message.Visible = false
                break
            end
        end
    end
})

local noFallDamageEnabled = false
r156_0:Toggle({
    Title = "禁用掉落伤害",
    Default = false,
    Callback = function(enabled)
        noFallDamageEnabled = enabled
        while wait(0.5) do
            if noFallDamageEnabled then
                local character = game.Players.LocalPlayer.Character
                if character then
                    local fallDamageScript = character:FindFirstChild("FallDamageScript")
                    if fallDamageScript then
                        fallDamageScript:Destroy()
                    end
                end
            else
                break
            end
        end
    end
})

r156_0:Button({
    Title = "刷气球",
    Callback = function()
        loadstring(game:HttpGet("https://pastefy.app/hu5pTZ76/raw"))()
    end
})

r156_0:Toggle({
    Title = "地图投票用户界面",
    Default = false,
    Callback = function(enabled)
        if enabled == false then
            game.Players.LocalPlayer.PlayerGui.MainGui.MapVotePage.Visible = false
        end
        if enabled == true then
            game.Players.LocalPlayer.PlayerGui.MainGui.MapVotePage.Visible = true
        end
    end
})

r156_0:Toggle({
    Title = "在水上行走",
    Default = false,
    Callback = function(enabled)
        if enabled == false then
            game.Workspace.WaterLevel.CanCollide = false
            game.Workspace.WaterLevel.Size = Vector3.new(10, 1, 10)
        end
        if enabled == true then
            game.Workspace.WaterLevel.CanCollide = true
            game.Workspace.WaterLevel.Size = Vector3.new(5000, 1, 5000)
        end
    end
})

r156_0:Toggle({
    Title = "开启游戏岛悬崖碰撞体积",
    Default = false,
    Callback = function(enabled)
        for _, v in pairs(game.workspace:GetDescendants()) do
            if v.Name == "LowerRocks" then
                v.CanCollide = enabled
            end
        end
    end
})

local TabHandles8 = {
    FWQ7Settings = Tabs.Game:Tab({ Title = "脑叶公司", Icon = "crown" }),
}

TabHandles8.FWQ7Settings:Button({
    Title = "点击解锁所有异想体",
    Desc = "Unlock All Imaginations",
    Callback = function()
        for _, v in ipairs(workspace:GetDescendants()) do
            if v.Name == "LockedFrame" then
                v:Destroy()
            end
        end

        for _, v in ipairs(workspace:GetDescendants()) do
            if v.Name == "RequirerResearchLabel" then
                v:Destroy()
            end
        end
    end
})

local LocalPlayer = game.Players.LocalPlayer
local Character = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()

TabHandles8.FWQ7Settings:Slider({
    Title = "修改武器攻击间隔",
    Desc = "Attack Speed Value",
    Min = 0,
    Max = 50,
    Default = 16,
    Callback = function(Value)
        if Character and Character:FindFirstChild("CharStats") then
            Character.CharStats.AttackSpeed.Value = Value
        end
    end
})

TabHandles8.FWQ7Settings:Input({
    Title = "修改武器最大伤害",
    Callback = function(Value)
        for _,v in next,LocalPlayer.Backpack:GetChildren() do
            if v:IsA("Tool") and v:FindFirstChild("SettingValues") then
                v.SettingValues.MaxDamageValue.Value = Value
            end
        end
        for _,v in next,Character:GetChildren() do
            if v:IsA("Tool") and v:FindFirstChild("SettingValues") then
                v.SettingValues.MaxDamageValue.Value = Value
            end
        end
    end
})

TabHandles8.FWQ7Settings:Input({
    Title = "修改武器最小伤害",
    Callback = function(Value)
        for _,v in next,LocalPlayer.Backpack:GetChildren() do
            if v:IsA("Tool") and v:FindFirstChild("SettingValues") then
                v.SettingValues.MinDamageValue.Value = Value
            end
        end
        for _,v in next,Character:GetChildren() do
            if v:IsA("Tool") and v:FindFirstChild("SettingValues") then
                v.SettingValues.MinDamageValue.Value = Value
            end
        end
    end
})

local setting = {
    aw = false,
    ab = false,
    kill = false
}

TabHandles8.FWQ7Settings:Toggle({
    Title = "开启自动工作",
    Default = false,
    Callback = function(state)
        setting.aw = state
        task.spawn(function()
            while setting.aw and task.wait() do
                if Character then
                    for _,v in next, workspace.Abnormalities:GetChildren() do
                        local data = require(v.Abnormality.AbnormalityModule)
                        local highestAverage = 0
                        local bestAttribute = ""
                        for i,rates in next,data.WorkSuccessRates do
                            local sum = 0
                            for _, rate in ipairs(rates) do
                                sum = sum + rate
                            end
                            local average = sum / #rates
                            if average > highestAverage then
                                highestAverage = average
                                bestAttribute = i
                            end
                        end
                        game:GetService("ReplicatedStorage").Assets.RemoteEvents.WorkEvent:FireServer(v.WorkTablet, bestAttribute)
                    end
                end
            end
        end)
    end
})

TabHandles8.FWQ7Settings:Toggle({
    Title = "自动格挡",
    Default = false,
    Callback = function(state)
        setting.ab = state
        LocalPlayer.PlayerGui.GameplayGui.GameplayFrame.ParryBarHolder.ParryBar:GetPropertyChangedSignal("AbsoluteSize"):Connect(function()
            if setting.ab and LocalPlayer.PlayerGui.GameplayGui.GameplayFrame.ParryBarHolder.ParryBar.AbsoluteSize.X > 126.470 then
                game:GetService("ReplicatedStorage").Assets.RemoteEvents.ToolModuleEvent:FireServer(
                    "BlockEvent",
                    game:GetService("Players").LocalPlayer.Character,
                    true
                )
            end
        end)
    end
})

TabHandles8.FWQ7Settings:Toggle({
    Title = "秒杀",
    Default = false,
    Callback = function(state)
        setting.kill = state
    end
})

local LOL = {
    list = {},
    sp = "未选择"
}

local Players = game:GetService("Players")
for _, player in ipairs(Players:GetPlayers()) do
    if player ~= LocalPlayer then
        table.insert(LOL.list, player.Name)
    end
end

local SelectPlayer = TabHandles8.FWQ7Settings:Dropdown({
    Title = "选择玩家",
    Options = LOL.list,
    Default = "未选择",
    Callback = function(option)
        LOL.sp = option
    end
})

TabHandles8.FWQ7Settings:Button({
    Title = "传送玩家",
    Desc = "Teleport player",
    Callback = function()
        if LOL.sp and LOL.sp ~= "未选择" then
            local targetPlayer = Players:FindFirstChild(LOL.sp)
            if targetPlayer and targetPlayer.Character and targetPlayer.Character:FindFirstChild("HumanoidRootPart") then
                LocalPlayer.Character.HumanoidRootPart.CFrame = targetPlayer.Character.HumanoidRootPart.CFrame
            end
        end
    end
})

Players.PlayerAdded:Connect(function(s)
    if s ~= LocalPlayer then
        table.insert(LOL.list, s.Name)
        SelectPlayer:Refresh(LOL.list)
    end
end)

Players.PlayerRemoving:Connect(function(s)
    if s ~= LocalPlayer then
        for i, name in ipairs(LOL.list) do
            if name == s.Name then
                table.remove(LOL.list, i)
                SelectPlayer:Refresh(LOL.list)
                break
            end
        end
    end
end)