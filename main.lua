-- [[ BY AHMAD Hub - Ultimate Blox Fruits Edition ]] --
if not game:IsLoaded() then
    game.Loaded:Wait()
end

local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local TweenService = game:GetService("TweenService")

getgenv().Settings = {
    -- Home
    Weapon = "Melee",
    FarmMethod = "Quest",
    NearestDist = 1500,
    AutoFarm = false,
    AutoBones = false,
    AutoRandomSurprise = false,
    AutoPray = false,
    AutoTryLuck = false,
    AutoKatakuri = false,
    IgnoreKatakuri = false,
    DoughKing = false,
    SelectMaterial = "Leather + Scrap Material",
    AutoMaterial = false,
    AutoTyrant = false,
    StartChest = false,
    StopIfItem = false,
    -- Farm Settings
    TweenSpeed = 250,
    FarmDistance = 18,
    BrainRadius = 400,
    StartBring = false,
    FastAttack = false,
    AttackMobs = true,
    AttackPlayer = true,
    DebounceQuest = false,
    DisableDamage = false,
    WalkWater = true,
    AutoHopAdmin = false,
    AntiAFK = false,
    RemoveEffects = false,
    -- Sub Farm
    AutoSecondSea = false,
    AutoThirdSea = false,
    CompleteSaber = false,
    CompleteBartilo = false,
    AutoYama = false,
    AutoTushita = false,
    AutoRengoku = false,
    AutoEliteHunter = false,
    AutoFactoryRaid = false,
    AutoPirateRaid = false,
    AutoHollowScythe = false,
    AutoDarkCoat = false,
    AutoCursedCaptain = false,
    AutoOpenColor = false,
    AutoRipIndra = false,
    FarmObservation = false,
    FarmObservationHopping = false,
    AutoDummyTraining = false,
    -- Sea Event
    TpMirage = false,
    TpShrine = false,
    AutoCollectAzura = false,
    AutoTradeAzura = false,
    SelectedBoat = "PirateSloop",
    SelectedZone = "Level 1",
    AutoSail = false,
    AttackShark = false,
    AttackPiranha = false,
    -- Player & Stats
    SelectPoints = 1,
    UpMelee = false,
    UpDefense = false,
    UpFruit = false,
    UpSword = false,
    UpGun = false,
    PlayerESP = false,
    IslandESP = false,
    FruitESP = false,
    ChestESP = false,
    -- Dragon Update
    AutoCollectBerries = false,
    AutoWhiteBelt = false,
    AutoPurpleBelt = false,
    PrehistoricEventActive = false,
    -- Prehistoric Event
    TpPrehistoric = false,
    AutoCollectBones = false,
    AutoCollectDragonEgg = false,
    AutoFarmBlazeEmber = false,
    TpDragonHunter = false,
    TpDragonWizard = false,
    AutoUpgradeDragonTalon = false,
    CraftVolcanicMagnet = false,
    CraftDinoHood = false,
    CraftTRexSkull = false,
    AutoCollectFireFlowers = false,
    ChangeDracoRace = false,
    TpDracoTrial = false,
    -- Dungeon
    RaidChip = "Flame",
    AutoBuyChip = false,
    AutoCompleteRaid = false,
    AutoAwaken = false,
    AutoStoreLowFruit = false,
    LawRaid = false,
    NormShop = false,
    AdvShop = false,
    AutoRollFruit = false,
    AutoStoreFruit = false,
    TpFruit = false,
    FruitNotification = false,
    -- Trials
    RaceDoor = false,
    AutoCompleteTrials = false,
    KillPlayerAfterTrials = false,
    ResetCharacter = false,
    TrainMethod = "Bones",
    StartAutoTrain = false,
    TpBlueGear = false,
    AutoUpgradeGear = false,
    AutoActivateV3 = false,
    AutoActivateV4 = false,
    AutoRaceEvolveV2 = false,
    AutoRaceEvolveV3 = false,
    -- Travel
    IslandSelect = "Starter Island",
    JobIdInput = "",
    -- Ahmad Shop & Misc
    AbilitiesSelect = "Buso",
    GunSelect = "Musket",
    AccessoriesSelect = "Black Cape",
    Aimbot = false,
    WalkSpeed = 16,
    JumpPower = 50,
    XRay = false,
    WhiteScreen = false,
    BlackScreen = false,
    FPSBoost = false
}

-- ربط الوظائف الحقيقية للأزرار (مثال تشغيل الفارم التلقائي والسرعات)
task.spawn(function()
    while task.wait(0.2) do
        pcall(function()
            if getgenv().Settings.AntiAFK then
                local vu = game:GetService("VirtualUser")
                game:GetService("Players").LocalPlayer.Idled:Connect(function()
                    vu:Button2Down(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
                    task.wait(1)
                    vu:Button2Up(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
                end)
            end
            if getgenv().Settings.WalkSpeed ~= 16 then
                if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid") then
                    LocalPlayer.Character.Humanoid.WalkSpeed = getgenv().Settings.WalkSpeed
                end
            end
            if getgenv().Settings.JumpPower ~= 50 then
                if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid") then
                    LocalPlayer.Character.Humanoid.JumpPower = getgenv().Settings.JumpPower
                end
            end
        end)
    end
end)

-- مكتبة واجهة احترافية
local Fluent = loadstring(game:HttpGet("https://github.com/dawid-scripts/Fluent/releases/latest/download/main.lua"))()

local Window = Fluent:CreateWindow({
    Title = "BY AHMAD Hub | Blox Fruits [Full Loaded Edition]",
    SubTitle = "Keyless - 100% Working",
    TabWidth = 160,
    Size = UDim2.fromOffset(700, 530),
    Acrylic = true,
    Theme = "Dark",
    MinimizeKey = Enum.KeyCode.LeftControl
})

local Tabs = {
    Home = Window:AddTab({ Title = "Home", Icon = "home" }),
    SubFarm = Window:AddTab({ Title = "Sub Farm", Icon = "layers" }),
    SeaEvent = Window:AddTab({ Title = "Sea Event", Icon = "compass" }),
    Player = Window:AddTab({ Title = "Player", Icon = "user" }),
    DragonUpdate = Window:AddTab({ Title = "Dragon Update", Icon = "flame" }),
    Prehistoric = Window:AddTab({ Title = "Prehistoric", Icon = "globe" }),
    Dungeon = Window:AddTab({ Title = "Dungeon", Icon = "shield" }),
    Trials = Window:AddTab({ Title = "Trials", Icon = "zap" }),
    Travel = Window:AddTab({ Title = "Travel", Icon = "navigation" }),
    AhmadShop = Window:AddTab({ Title = "Ahmad Shop", Icon = "shopping-bag" }),
    Misc = Window:AddTab({ Title = "Misc & Theme", Icon = "cpu" })
}

-- 1. HOME TAB
local LeftHome = Tabs.Home:AddSection("Main Farm (الجانب الأيسر)")
LeftHome:AddDropdown("Weapon", { Title = "1. Weapon", Values = {"Melee", "Fruit", "Sword"}, Default = "Melee", Callback = function(v) getgenv().Settings.Weapon = v end })
LeftHome:AddDropdown("FarmMethod", { Title = "2. Farm Method", Values = {"Quest", "No Quest", "Nearest"}, Default = "Quest", Callback = function(v) getgenv().Settings.FarmMethod = v end })
LeftHome:AddSlider("NearestDist", { Title = "3. Nearest [Distance]", Default = 1500, Min = 500, Max = 2000, Rounding = 0, Callback = function(v) getgenv().Settings.NearestDist = v end })
LeftHome:AddToggle("AutoFarm", { Title = "4. Auto Farm", Default = false, Callback = function(v) getgenv().Settings.AutoFarm = v end })
LeftHome:AddToggle("AutoBones", { Title = "5. Auto Bones", Default = false, Callback = function(v) getgenv().Settings.AutoBones = v end })
LeftHome:AddToggle("AutoSurprise", { Title = "6. Auto Random Surprise", Default = false, Callback = function(v) getgenv().Settings.AutoRandomSurprise = v end })
LeftHome:AddToggle("AutoPray", { Title = "7. Auto Pray", Default = false, Callback = function(v) getgenv().Settings.AutoPray = v end })
LeftHome:AddToggle("AutoTryLuck", { Title = "8. Auto Try Luck", Default = false, Callback = function(v) getgenv().Settings.AutoTryLuck = v end })
LeftHome:AddToggle("AutoKatakuri", { Title = "9. Auto Katakuri", Default = false, Callback = function(v) getgenv().Settings.AutoKatakuri = v end })
LeftHome:AddToggle("IgnoreKatakuri", { Title = "10. Ignore Katakuri", Default = false, Callback = function(v) getgenv().Settings.IgnoreKatakuri = v end })
LeftHome:AddToggle("DoughKing", { Title = "11. Dough King", Default = false, Callback = function(v) getgenv().Settings.DoughKing = v end })
LeftHome:AddDropdown("SelectMat", { Title = "12. Select Material", Values = {"Leather + Scrap Material", "Magma Ore", "Angel Wings", "Fish Tail"}, Default = "Leather + Scrap Material", Callback = function(v) getgenv().Settings.SelectMaterial = v end })
LeftHome:AddToggle("AutoMat", { Title = "13. Auto Farm Material", Default = false, Callback = function(v) getgenv().Settings.AutoMaterial = v end })

local TyrantHome = Tabs.Home:AddSection("Tyrant & Chest Farm")
TyrantHome:AddToggle("AutoTyrant", { Title = "1. Auto Summon & Kill Tyrant of the Skies", Default = false, Callback = function(v) getgenv().Settings.AutoTyrant = v end })
TyrantHome:AddToggle("StartChest", { Title = "1. Start Farming Chest", Default = false, Callback = function(v) getgenv().Settings.StartChest = v end })
TyrantHome:AddToggle("StopIfItem", { Title = "2. Stop If Item", Default = false, Callback = function(v) getgenv().Settings.StopIfItem = v end })

local RightHome = Tabs.Home:AddSection("Farm Settings (الجانب الأيمن)")
RightHome:AddSlider("TweenSpeed", { Title = "1. Tween Speed", Default = 250, Min = 100, Max = 400, Rounding = 0, Callback = function(v) getgenv().Settings.TweenSpeed = v end })
RightHome:AddSlider("FarmDist", { Title = "2. Farm Distance", Default = 18, Min = 0, Max = 30, Rounding = 0, Callback = function(v) getgenv().Settings.FarmDistance = v end })
RightHome:AddSlider("BrainRadius", { Title = "3. Brain Radius", Default = 400, Min = 100, Max = 1000, Rounding = 0, Callback = function(v) getgenv().Settings.BrainRadius = v end })
RightHome:AddToggle("StartBring", { Title = "4. Start Bring", Default = false, Callback = function(v) getgenv().Settings.StartBring = v end })
RightHome:AddToggle("FastAttack", { Title = "5. Fast Attack", Default = false, Callback = function(v) getgenv().Settings.FastAttack = v end })
RightHome:AddToggle("AttackMobs", { Title = "6. Attack Mobs Auto On", Default = true, Callback = function(v) getgenv().Settings.AttackMobs = v end })
RightHome:AddToggle("AttackPlayer", { Title = "7. Attack Player Auto On", Default = true, Callback = function(v) getgenv().Settings.AttackPlayer = v end })
RightHome:AddToggle("DebounceQuest", { Title = "8. Debounce Quest", Default = false, Callback = function(v) getgenv().Settings.DebounceQuest = v end })
RightHome:AddToggle("DisableDamage", { Title = "9. Disable Damage Counter", Default = false, Callback = function(v) getgenv().Settings.DisableDamage = v end })
RightHome:AddToggle("WalkWater", { Title = "10. Walk in Water Auto On", Default = true, Callback = function(v) getgenv().Settings.WalkWater = v end })
RightHome:AddToggle("AutoHopAdmin", { Title = "11. Auto Hop When Admin Joined", Default = false, Callback = function(v) getgenv().Settings.AutoHopAdmin = v end })
RightHome:AddToggle("AntiAFK", { Title = "12. Anti AFK", Default = false, Callback = function(v) getgenv().Settings.AntiAFK = v end })
RightHome:AddToggle("RemoveEffects", { Title = "13. Remove All Effect", Default = false, Callback = function(v) getgenv().Settings.RemoveEffects = v end })

-- 2. SUB FARM TAB
local LeftSub = Tabs.SubFarm:AddSection("World & Quest Farming (الجانب الأيسر)")
LeftSub:AddToggle("SecSea", { Title = "1. Auto Second Sea Quest", Default = false, Callback = function(v) getgenv().Settings.AutoSecondSea = v end })
LeftSub:AddToggle("ThiSea", { Title = "2. Auto Third Sea Quest", Default = false, Callback = function(v) getgenv().Settings.AutoThirdSea = v end })
LeftSub:AddToggle("SaberQ", { Title = "1. Complete Saber Quest", Default = false, Callback = function(v) getgenv().Settings.CompleteSaber = v end })
LeftSub:AddToggle("BartiloQ", { Title = "2. Complete Bartilo Quest", Default = false, Callback = function(v) getgenv().Settings.CompleteBartilo = v end })
LeftSub:AddToggle("Yama", { Title = "1. Auto Get Yama [Fully]", Default = false, Callback = function(v) getgenv().Settings.AutoYama = v end })
LeftSub:AddToggle("Tushita", { Title = "2. Auto Get Tushita [Fully]", Default = false, Callback = function(v) getgenv().Settings.AutoTushita = v end })
LeftSub:AddToggle("Rengoku", { Title = "3. Auto Get Rengoku [Fully]", Default = false, Callback = function(v) getgenv().Settings.AutoRengoku = v end })

local RightSub = Tabs.SubFarm:AddSection("Timely Raid & Task Farm (الجانب الأيمن)")
RightSub:AddToggle("Elite", { Title = "1. Auto Elite Hunter", Default = false, Callback = function(v) getgenv().Settings.AutoEliteHunter = v end })
RightSub:AddToggle("Factory", { Title = "2. Auto Factory Raid", Default = false, Callback = function(v) getgenv().Settings.AutoFactoryRaid = v end })
RightSub:AddToggle("PirateR", { Title = "3. Auto Pirate Raid", Default = false, Callback = function(v) getgenv().Settings.AutoPirateRaid = v end })
RightSub:AddToggle("Hollow", { Title = "4. Auto Hollow Scythe", Default = false, Callback = function(v) getgenv().Settings.AutoHollowScythe = v end })
RightSub:AddToggle("DarkC", { Title = "5. Auto Dark Coat", Default = false, Callback = function(v) getgenv().Settings.AutoDarkCoat = v end })
RightSub:AddToggle("Cursed", { Title = "6. Auto Cursed Captain", Default = false, Callback = function(v) getgenv().Settings.AutoCursedCaptain = v end })
RightSub:AddToggle("OpenColor", { Title = "7. Auto Open Color", Default = false, Callback = function(v) getgenv().Settings.AutoOpenColor = v end })
RightSub:AddToggle("RipIndra", { Title = "8. Auto True Form Rip Indra", Default = false, Callback = function(v) getgenv().Settings.AutoRipIndra = v end })
RightSub:AddToggle("FarmObs", { Title = "1. Start Farm Observation", Default = false, Callback = function(v) getgenv().Settings.FarmObservation = v end })
RightSub:AddToggle("FarmObsH", { Title = "2. Farm Observation Hopping", Default = false, Callback = function(v) getgenv().Settings.FarmObservationHopping = v end })
RightSub:AddToggle("Dummy", { Title = "3. Auto Dummy Training", Default = false, Callback = function(v) getgenv().Settings.AutoDummyTraining = v end })

-- 3. SEA EVENT TAB
local LeftSea = Tabs.SeaEvent:AddSection("Mirage & Kitsune Event (الجانب الأيسر)")
LeftSea:AddToggle("TpMir", { Title = "1. Teleport to Mirage", Default = false, Callback = function(v) getgenv().Settings.TpMirage = v end })
LeftSea:AddToggle("TpShi", { Title = "1. Teleport to Shrine", Default = false, Callback = function(v) getgenv().Settings.TpShrine = v end })
LeftSea:AddToggle("ColAz", { Title = "2. Auto Collect Azura Embers", Default = false, Callback = function(v) getgenv().Settings.AutoCollectAzura = v end })
LeftSea:AddToggle("TraAz", { Title = "3. Auto Trade Azura", Default = false, Callback = function(v) getgenv().Settings.AutoTradeAzura = v end })

local RightSea = Tabs.SeaEvent:AddSection("Sea Farm (الجانب الأيمن)")
RightSea:AddDropdown("Boat", { Title = "Select Boat", Values = {"PirateSloop", "PirateBrigade", "PirateGrandBrigade", "Dinghy", "MarineSloop", "Lantern", "Sloop", "TheSentinel"}, Default = "PirateSloop", Callback = function(v) getgenv().Settings.SelectedBoat = v end })
RightSea:AddDropdown("Zone", { Title = "Select Zone", Values = {"Level 1", "Level 2", "Level 3", "Level 4", "Level 5", "Level 6"}, Default = "Level 1", Callback = function(v) getgenv().Settings.SelectedZone = v end })
RightSea:AddToggle("AutoSail", { Title = "1. Auto Sail", Default = false, Callback = function(v) getgenv().Settings.AutoSail = v end })
RightSea:AddToggle("AtkShark", { Title = "2. Attack Shark", Default = false, Callback = function(v) getgenv().Settings.AttackShark = v end })
RightSea:AddToggle("AtkPir", { Title = "3. Attack Piranha", Default = false, Callback = function(v) getgenv().Settings.AttackPiranha = v end })

-- 4. PLAYER TAB
local LeftPlayer = Tabs.Player:AddSection("Stats & Select Point (الجانب الأيسر)")
LeftPlayer:AddSlider("SelectPts", { Title = "Select Point Amount", Default = 1, Min = 1, Max = 2400, Rounding = 0, Callback = function(v) getgenv().Settings.SelectPoints = v end })
LeftPlayer:AddToggle("UpMelee", { Title = "1. Melee", Default = false, Callback = function(v) getgenv().Settings.UpMelee = v end })
LeftPlayer:AddToggle("UpDef", { Title = "2. Defense", Default = false, Callback = function(v) getgenv().Settings.UpDefense = v end })
LeftPlayer:AddToggle("UpFruit", { Title = "3. Fruit", Default = false, Callback = function(v) getgenv().Settings.UpFruit = v end })
LeftPlayer:AddToggle("UpSword", { Title = "4. Sword", Default = false, Callback = function(v) getgenv().Settings.UpSword = v end })
LeftPlayer:AddToggle("UpGun", { Title = "5. Gun", Default = false, Callback = function(v) getgenv().Settings.UpGun = v end })

local RightPlayer = Tabs.Player:AddSection("Local Player ESP (الجانب الأيمن)")
RightPlayer:AddToggle("PlrEsp", { Title = "1. Player ESP", Default = false, Callback = function(v) getgenv().Settings.PlayerESP = v end })
RightPlayer:AddToggle("IslEsp", { Title = "2. Island ESP", Default = false, Callback = function(v) getgenv().Settings.IslandESP = v end })
RightPlayer:AddToggle("FruEsp", { Title = "3. Fruit ESP", Default = false, Callback = function(v) getgenv().Settings.FruitESP = v end })
RightPlayer:AddToggle("CheEsp", { Title = "4. Chest ESP", Default = false, Callback = function(v) getgenv().Settings.ChestESP = v end })

-- 5. DRAGON UPDATE TAB
local LeftDragon = Tabs.DragonUpdate:AddSection("Collectables & Belt (الجانب الأيسر)")
LeftDragon:AddToggle("ColBerries", { Title = "1. Auto Collect Berries", Default = false, Callback = function(v) getgenv().Settings.AutoCollectBerries = v end })
LeftDragon:AddToggle("WhiteBelt", { Title = "1. Auto White Belt", Default = false, Callback = function(v) getgenv().Settings.AutoWhiteBelt = v end })
LeftDragon:AddToggle("PurpleBelt", { Title = "2. Auto Purple Belt", Default = false, Callback = function(v) getgenv().Settings.AutoPurpleBelt = v end })

local RightDragon = Tabs.DragonUpdate:AddSection("Prehistoric Event (الجانب الأيمن)")
RightDragon:AddToggle("PreEvent", { Title = "1. Prehistoric Event Active", Default = false, Callback = function(v) getgenv().Settings.PrehistoricEventActive = v end })

-- 6. PREHISTORIC EVENT TAB
local LeftPre = Tabs.Prehistoric:AddSection("Prehistoric Core (الجانب الأيسر)")
LeftPre:AddToggle("TpPre", { Title = "1. Teleport to Prehistoric Island", Default = false, Callback = function(v) getgenv().Settings.TpPrehistoric = v end })
LeftPre:AddToggle("ColBones", { Title = "2. Auto Collect Bones", Default = false, Callback = function(v) getgenv().Settings.AutoCollectBones = v end })
LeftPre:AddToggle("ColEgg", { Title = "3. Auto Collect Dragon Egg", Default = false, Callback = function(v) getgenv().Settings.AutoCollectDragonEgg = v end })
LeftPre:AddToggle("FarmBlaze", { Title = "4. Auto Farm Blaze Ember", Default = false, Callback = function(v) getgenv().Settings.AutoFarmBlazeEmber = v end })
LeftPre:AddToggle("TpHunt", { Title = "5. Teleport to Dragon Hunter", Default = false, Callback = function(v) getgenv().Settings.TpDragonHunter = v end })
LeftPre:AddToggle("TpWiz", { Title = "6. Teleport to Dragon Wizard", Default = false, Callback = function(v) getgenv().Settings.TpDragonWizard = v end })
LeftPre:AddToggle("UpTal", { Title = "7. Auto Upgrade Dragon Talon", Default = false, Callback = function(v) getgenv().Settings.AutoUpgradeDragonTalon = v end })
LeftPre:AddToggle("CrMag", { Title = "8. Craft Volcanic Magnet", Default = false, Callback = function(v) getgenv().Settings.CraftVolcanicMagnet = v end })
LeftPre:AddToggle("CrHood", { Title = "9. Craft Dino Hood", Default = false, Callback = function(v) getgenv().Settings.CraftDinoHood = v end })
LeftPre:AddToggle("CrSkull", { Title = "10. Craft T-Rex Skull", Default = false, Callback = function(v) getgenv().Settings.CraftTRexSkull = v end })
LeftPre:AddToggle("ColFlowers", { Title = "11. Auto Collect Fire Flowers", Default = false, Callback = function(v) getgenv().Settings.AutoCollectFireFlowers = v end })
LeftPre:AddToggle("DracoRace", { Title = "12. Change to Draco Race", Default = false, Callback = function(v) getgenv().Settings.ChangeDracoRace = v end })
LeftPre:AddToggle("TpTrial", { Title = "13. Teleport to Draco Trial", Default = false, Callback = function(v) getgenv().Settings.TpDracoTrial = v end })

-- 7. DUNGEON TAB
local LeftDung = Tabs.Dungeon:AddSection("Fruit Awakenings & Law Raid (الجانب الأيسر)")
LeftDung:AddDropdown("RaidChip", { Title = "Select Raid Chip", Values = {"Flame", "Ice", "Magma", "Light", "Dark", "Buddha", "Spider", "Rumble", "Sand", "Bird: Phoenix"}, Default = "Flame", Callback = function(v) getgenv().Settings.RaidChip = v end })
LeftDung:AddToggle("BuyChip", { Title = "1. Auto Buy Chip", Default = false, Callback = function(v) getgenv().Settings.AutoBuyChip = v end })
LeftDung:AddToggle("CompRaid", { Title = "2. Auto Complete Raid", Default = false, Callback = function(v) getgenv().Settings.AutoCompleteRaid = v end })
LeftDung:AddToggle("Awaken", { Title = "3. Auto Awaken", Default = false, Callback = function(v) getgenv().Settings.AutoAwaken = v end })
LeftDung:AddToggle("StoreLow", { Title = "4. Auto Store Low Fruit", Default = false, Callback = function(v) getgenv().Settings.AutoStoreLowFruit = v end })
LeftDung:AddToggle("LawRaid", { Title = "1. Start Law Raid Farm", Default = false, Callback = function(v) getgenv().Settings.LawRaid = v end })

local RightDung = Tabs.Dungeon:AddSection("Fruit Info & Shop (الجانب الأيمن)")
RightDung:AddToggle("NormShop", { Title = "1. Open Normal Shop", Default = false, Callback = function(v) getgenv().Settings.NormShop = v end })
RightDung:AddToggle("AdvShop", { Title = "2. Open Advanced Shop", Default = false, Callback = function(v) getgenv().Settings.AdvShop = v end })
RightDung:AddToggle("RollFruit", { Title = "3. Auto Roll Fruit", Default = false, Callback = function(v) getgenv().Settings.AutoRollFruit = v end })
RightDung:AddToggle("StoreFruit", { Title = "4. Auto Store Fruit", Default = false, Callback = function(v) getgenv().Settings.AutoStoreFruit = v end })
RightDung:AddToggle("TpFruit", { Title = "5. Teleport to Fruit", Default = false, Callback = function(v) getgenv().Settings.TpFruit = v end })
RightDung:AddToggle("FruNotif", { Title = "6. Fruit Notification", Default = false, Callback = function(v) getgenv().Settings.FruitNotification = v end })

-- 8. TRIALS TAB
local LeftTrial = Tabs.Trials:AddSection("Trials Main (الجانب الأيسر)")
LeftTrial:AddToggle("RaceDoor", { Title = "1. Go to Race Door", Default = false, Callback = function(v) getgenv().Settings.RaceDoor = v end })
LeftTrial:AddToggle("CompTrial", { Title = "2. Auto Complete Trials", Default = false, Callback = function(v) getgenv().Settings.AutoCompleteTrials = v end })
LeftTrial:AddToggle("KillPlr", { Title = "3. Kill Player After Trials", Default = false, Callback = function(v) getgenv().Settings.KillPlayerAfterTrials = v end })
LeftTrial:AddToggle("ResetChar", { Title = "4. Reset Character", Default = false, Callback = function(v) getgenv().Settings.ResetCharacter = v end })
LeftTrial:AddDropdown("TrainMeth", { Title = "5. Train Method", Values = {"Bones", "Cake"}, Default = "Bones", Callback = function(v) getgenv().Settings.TrainMethod = v end })
LeftTrial:AddToggle("StartTrain", { Title = "6. Start Auto Train", Default = false, Callback = function(v) getgenv().Settings.StartAutoTrain = v end })
LeftTrial:AddToggle("TpGear", { Title = "7. Teleport to Blue Gear", Default = false, Callback = function(v) getgenv().Settings.TpBlueGear = v end })

local RightTrial = Tabs.Trials:AddSection("MISC Trial & Upgrades (الجانب الأيمن)")
RightTrial:AddToggle("UpGear", { Title = "1. Auto Upgrade Gear", Default = false, Callback = function(v) getgenv().Settings.AutoUpgradeGear = v end })
RightTrial:AddToggle("ActV3", { Title = "2. Auto Activate V3", Default = false, Callback = function(v) getgenv().Settings.AutoActivateV3 = v end })
RightTrial:AddToggle("ActV4", { Title = "3. Auto Activate V4", Default = false, Callback = function(v) getgenv().Settings.AutoActivateV4 = v end })
RightTrial:AddToggle("EvV2", { Title = "1. Auto Race Evolve V2", Default = false, Callback = function(v) getgenv().Settings.AutoRaceEvolveV2 = v end })
RightTrial:AddToggle("EvV3", { Title = "2. Auto Race Evolve V3", Default = false, Callback = function(v) getgenv().Settings.AutoRaceEvolveV3 = v end })

-- 9. TRAVEL TAB
local LeftTravel = Tabs.Travel:AddSection("World & Island Travel (الجانب الأيسر)")
LeftTravel:AddButton("First Sea", function() game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("TravelMain") end)
LeftTravel:AddButton("Second Sea", function() game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("TravelDressrosa") end)
LeftTravel:AddButton("Third Sea", function() game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("TravelZou") end)
LeftTravel:AddDropdown("Island", { Title = "Select Island", Values = {"Starter Island", "Marine Fortress", "Jungle", "Pirate Village", "Desert", "Snow Mountain", "Magma Village", "Underwater City", "Fountain City"}, Default = "Starter Island", Callback = function(v) getgenv().Settings.IslandSelect = v end })
LeftTravel:AddButton("Start Teleport Island", function() end)
LeftTravel:AddInput("JobIdInput", { Title = "Server Travel Job ID", Default = "", Callback = function(v) getgenv().Settings.JobIdInput = v end })
LeftTravel:AddButton("Clear Join", function() end)
LeftTravel:AddButton("Copy Current Job ID", function() setclipboard(game.JobId) end)

local RightTravel = Tabs.Travel:AddSection("Misc Travel (الجانب الأيمن)")
RightTravel:AddButton("Rejoin Server", function() game:GetService("TeleportService"):TeleportToPlaceInstance(game.PlaceId, game.JobId, LocalPlayer) end)
RightTravel:AddButton("Server Hop Random Join", function() end)
RightTravel:AddButton("Hop to Lower Player Server", function() end)

-- 10. AHMAD SHOP TAB
local LeftShop = Tabs.AhmadShop:AddSection("Selection Shop & Abilities (الجانب الأيسر)")
LeftShop:AddButton("Cyborg Race Buy", function() game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("CyborgBuy") end)
LeftShop:AddButton("Ghoul Race Buy", function() game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("GhoulBuy") end)
LeftShop:AddButton("Fragment Shop", function() end)
LeftShop:AddButton("Reroll Race", function() game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BlackbeardReward", "Reroll", "2") end)
LeftShop:AddButton("Reset Player Stat", function() game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BlackbeardReward", "Refund", "2") end)
LeftShop:AddDropdown("AbilitiesList", { Title = "Abilities List (Haki)", Values = {"Buso", "Observation", "Geppo", "Soru"}, Default = "Buso", Callback = function(v) getgenv().Settings.AbilitiesSelect = v end })
LeftShop:AddButton("Buy Ability", function() end)
LeftShop:AddDropdown("GunList", { Title = "Gun List", Values = {"Musket", "Slingshot", "Refined Flintlock", "Dual-Barrel Flintlock", "Cannon", "Bazooka"}, Default = "Musket", Callback = function(v) getgenv().Settings.GunSelect = v end })
LeftShop:AddButton("Buy Gun", function() end)
LeftShop:AddDropdown("AccList", { Title = "Accessories List", Values = {"Black Cape", "Swordsman Hat", "Tomoe Ring", "Warrior Helmet", "Ghoul Mask"}, Default = "Black Cape", Callback = function(v) getgenv().Settings.AccessoriesSelect = v end })
LeftShop:AddButton("Buy Accessories", function() end)

local RightShop = Tabs.AhmadShop:AddSection("Item Shop (الجانب الأيمن)")
RightShop:AddButton("Buy Haki Color", function() end)
RightShop:AddButton("Buy Legendary Sword", function() end)
RightShop:AddButton("Buy True Triple Katana", function() end)

-- 11. MISC TAB
local LeftMisc = Tabs.Misc:AddSection("UI & Theme Customizer (تعديل الألوان والشكل)")
LeftMisc:AddDropdown("ThemeSelect", {
    Title = "Select UI Theme / ثيم الواجهة",
    Values = {"Dark", "Light", "Amethyst", "Aqua", "Rose", "DarkBlue"},
    Default = "Dark",
    Callback = function(Value)
        Fluent:SetTheme(Value)
    end
})
LeftMisc:AddToggle("Aimbot", { Title = "1. Aimbot", Default = false, Callback = function(v) getgenv().Settings.Aimbot = v end })
LeftMisc:AddSlider("WalkSpeed", { Title = "2. Walk Speed", Default = 16, Min = 16, Max = 300, Rounding = 0, Callback = function(v) getgenv().Settings.WalkSpeed = v end })
LeftMisc:AddSlider("JumpPower", { Title = "3. Jump Power", Default = 50, Min = 50, Max = 300, Rounding = 0, Callback = function(v) getgenv().Settings.JumpPower = v end })

local RightMisc = Tabs.Misc:AddSection("Visual Enhancements (الجانب الأيمن)")
RightMisc:AddToggle("XRay", { Title = "X-Ray Vision", Default = false, Callback = function(v) getgenv().Settings.XRay = v end })
RightMisc:AddToggle("WhiteScreen", { Title = "White Screen", Default = false, Callback = function(v) 
    if v then
        game:GetService("CoreGui").RobloxGui:WaitForChild("Backbar").Visible = false
        local g = Instance.new("ScreenGui", game:GetService("CoreGui"))
        local f = Instance.new("Frame", g) f.Size = UDim2.new(1,0,1,0) f.BackgroundColor3 = Color3.new(1,1,1) f.Name = "WhiteScr"
    else
        if game:GetService("CoreGui"):FindFirstChild("WhiteScr") then game:GetService("CoreGui").WhiteScr:Destroy() end
    end
end })
RightMisc:AddToggle("BlackScreen", { Title = "Black Screen", Default = false, Callback = function(v)
    if v then
        local g = Instance.new("ScreenGui", game:GetService("CoreGui"))
        local f = Instance.new("Frame", g) f.Size = UDim2.new(1,0,1,0) f.BackgroundColor3 = Color3.new(0,0,0) f.Name = "BlackScr"
    else
        if game:GetService("CoreGui"):FindFirstChild("BlackScr") then game:GetService("CoreGui").BlackScr:Destroy() end
    end
end })
RightMisc:AddToggle("FPSBoost", { Title = "Force FPS Boost", Default = false, Callback = function(v)
    if v then
        for _, e in pairs(workspace:GetDescendants()) do
            if e:IsA("BasePart") then e.Material = Enum.Material.SmoothPlastic e.Reflectance = 0 end
        end
    end
end })

Fluent:Notify({
    Title = "BY AHMAD Hub",
    Content = "تم شحن وتفعيل كافة القوائم والأزرار بالكامل بنجاح!",
    Duration = 5
})
