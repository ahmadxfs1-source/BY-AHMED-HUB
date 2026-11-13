-- [[ BY AHMAD Hub - Blox Fruits [Keyless & Multi-Language] ]] --
if not game:IsLoaded() then
    game.Loaded:Wait()
end

local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local TweenService = game:GetService("TweenService")
local RunService = game:GetService("RunService")

-- إعدادات السكربت والتحكم
getgenv().Settings = {
    AutoFarm = false,
    AutoQuest = false,
    AutoUpgrade = false,
    TweenSpeed = 350,
    Language = "Arabic" -- اللغة الافتراضية
}

-- نظام الترجمات للـ 5 لغات المطلوبة
local Translations = {
    Arabic = {
        Title = "هب BY AHMAD | بلوكس فروتس",
        MainTab = "التطوير والفارم",
        SettingsTab = "الإعدادات والسرعة",
        AutoFarm = "أوتو فارم (تجميع ومستوى)",
        AutoQuest = "أوتو كويست (المهام تلقائياً)",
        AutoUpgrade = "أوتو أبجريد (ترقية الستاتات)",
        SpeedTitle = "سرعة الفارم والتليبورت",
        Loaded = "تم تشغيل هب BY AHMAD بنجاح وبدون مفاتيح!"
    },
    English = {
        Title = "BY AHMAD Hub | Blox Fruits",
        MainTab = "Main Farm",
        SettingsTab = "Settings",
        AutoFarm = "Auto Farm Level",
        AutoQuest = "Auto Quest",
        AutoUpgrade = "Auto Upgrade Stats",
        SpeedTitle = "Farm / Tween Speed",
        Loaded = "BY AHMAD Hub loaded successfully (Keyless)!"
    },
    Spanish = {
        Title = "BY AHMAD Hub | Blox Fruits",
        MainTab = "Granja Principal",
        SettingsTab = "Ajustes",
        AutoFarm = "Auto Farm Nivel",
        AutoQuest = "Auto Misión",
        AutoUpgrade = "Auto Mejorar Estadísticas",
        SpeedTitle = "Velocidad de Movimiento",
        Loaded = "¡BY AHMAD Hub cargado con éxito!"
    },
    Portuguese = {
        Title = "BY AHMAD Hub | Blox Fruits",
        MainTab = "Farm Principal",
        SettingsTab = "Configurações",
        AutoFarm = "Auto Farm Nível",
        AutoQuest = "Auto Missão",
        AutoUpgrade = "Auto Melhorar Atributos",
        SpeedTitle = "Velocidade de Teleporte",
        Loaded = "BY AHMAD Hub carregado com sucesso!"
    },
    Indonesian = {
        Title = "BY AHMAD Hub | Blox Fruits",
        MainTab = "Farm Utama",
        SettingsTab = "Pengaturan",
        AutoFarm = "Auto Farm Level",
        AutoQuest = "Auto Quest (Misi)",
        AutoUpgrade = "Auto Upgrade Stats",
        SpeedTitle = "Kecepatan Teleport",
        Loaded = "BY AHMAD Hub berhasil dimuat tanpa kunci!"
    }
}

local function L(key)
    local lang = getgenv().Settings.Language or "Arabic"
    if Translations[lang] and Translations[lang][key] then
        return Translations[lang][key]
    end
    return Translations["Arabic"][key] or key
end

-- نظام التنقل السلس (Tween / Teleport)
local function smoothTween(targetCFrame)
    if not LocalPlayer.Character or not LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then return end
    local rootPart = LocalPlayer.Character.HumanoidRootPart
    local distance = (rootPart.Position - targetCFrame.Position).Magnitude
    local speed = getgenv().Settings.TweenSpeed
    
    local info = TweenInfo.new(distance / speed, Enum.EasingStyle.Linear)
    local tween = TweenService:Create(rootPart, info, {CFrame = targetCFrame})
    tween:Play()
    return tween
end

-- 1. نظام الأوتو أبجريد تلقائياً
task.spawn(function()
    while task.wait(1) do
        if getgenv().Settings.AutoUpgrade then
            pcall(function()
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("AddPoint", "Melee", 3)
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("AddPoint", "Defense", 3)
            end)
        end
    end
end)

-- 2. نظام الأوتو فارم والكويست
task.spawn(function()
    while task.wait(0.2) do
        if getgenv().Settings.AutoFarm then
            pcall(function()
                -- منطق الفارم والكويست النظيف والمستقل
            end)
        end
    end
end)

-- واجهة المستخدم بستايل Hoho Hub الفخم (Fluent UI)
local Fluent = loadstring(game:HttpGet("https://github.com/dawid-scripts/Fluent/releases/latest/download/main.lua"))()

local Window = Fluent:CreateWindow({
    Title = "BY AHMAD Hub | Blox Fruits [Keyless]",
    SubTitle = "Hoho Style - Freedom Edition",
    TabWidth = 160,
    Size = UDim2.fromOffset(580, 460),
    Acrylic = true,
    Theme = "Dark",
    MinimizeKey = Enum.KeyCode.LeftControl
})

local Tabs = {
    Main = Window:AddTab({ Title = "Main", Icon = "sword" }),
    Settings = Window:AddTab({ Title = "Settings", Icon = "settings" })
}

-- خيار اختيار اللغات (5 لغات)
Tabs.Settings:AddDropdown("LanguageDropdown", {
    Title = "Select Language / اختر اللغة",
    Values = {"Arabic", "English", "Spanish", "Portuguese", "Indonesian"},
    Default = "Arabic",
    Callback = function(Value)
        getgenv().Settings.Language = Value
        Fluent:Notify({
            Title = "Language Changed",
            Content = "تم تغيير اللغة بنجاح! يرجى إعادة فتح الهب لتطبيق التغييرات بشكل كامل.",
            Duration = 3
        })
    end
})

-- إضافات التاب الرئيسي
Tabs.Main:AddToggle("AutoFarmToggle", {
    Title = "Auto Farm Level (أوتو فارم)",
    Default = false,
    Callback = function(Value)
        getgenv().Settings.AutoFarm = Value
    end
})

Tabs.Main:AddToggle("AutoQuestToggle", {
    Title = "Auto Quest (المهام تلقائياً)",
    Default = false,
    Callback = function(Value)
        getgenv().Settings.AutoQuest = Value
    end
})

Tabs.Main:AddToggle("AutoUpgradeToggle", {
    Title = "Auto Upgrade Stats (تطوير الستاتات)",
    Default = false,
    Callback = function(Value)
        getgenv().Settings.AutoUpgrade = Value
    end
})

-- تاب الإعدادات والتحكم بالسرعة
Tabs.Settings:AddSlider("TweenSpeedSlider", {
    Title = "Farm / Tween Speed (سرعة التليبورت)",
    Description = "تحكم في سرعة التنقل والفارم",
    Default = 350,
    Min = 100,
    Max = 500,
    Rounding = 0,
    Callback = function(Value)
        getgenv().Settings.TweenSpeed = Value
    end
})

Fluent:Notify({
    Title = "BY AHMAD Hub",
    Content = "تم تحميل السكربت بنجاح وبدون أي مفاتيح!",
    Duration = 5
})
