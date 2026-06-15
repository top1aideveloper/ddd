local WindUI = loadstring(game:HttpGet("https://github.com/Footagesus/WindUI/releases/latest/download/main.lua"))()

local Window = WindUI:CreateWindow({
    Title = "UROSNIJ NIGER GARDEN",
    ToggleKey = Enum.KeyCode.C,
    Icon = "cat",
    Author = "Hartf",
    Folder = "MyTestHub",
    Size = UDim2.fromOffset(550, 580),
    Transparent = true,
    Theme = "Dark",
    Resizable = true,
    SideBarWidth = 220,
    BackgroundImageTransparency = 0.42,
    ScrollBarEnabled = true,
    Acrylic = true,
    NewElements = true
})

Window:Tag({ Title = "V2", Color = Color3.fromHex("#fa0a42") })

-- TABS WITH GOOD ICONS
local Farm = Window:Tab({ Title = "Farm", Icon = "tractor", Locked = false, IconColor = Color3.fromRGB(99, 245, 66), IconShape = "Square", Border = true })
local Shop = Window:Tab({ Title = "Shop", Icon = "store", Locked = false, IconColor = Color3.fromRGB(247, 133, 32), IconShape = "Square", Border = true })
local Sell = Window:Tab({ Title = "Sell", Icon = "circle-dollar-sign", Locked = false, IconColor = Color3.fromRGB(9, 176, 12), IconShape = "Square", Border = true })
local Interaction = Window:Tab({ Title = "Interaction", Icon = "hand", Locked = false, IconColor = Color3.fromRGB(255, 200, 100), IconShape = "Square", Border = true })
local SettingsTab = Window:Tab({ Title = "Settings", Icon = "settings", Locked = false, IconColor = Color3.fromRGB(100, 150, 255), IconShape = "Square", Border = true })

local HttpService = game:GetService("HttpService")
local ConfigFile = "GrowAGarden2_Settings.json"

-- ================================
-- TRANSLATIONS (ENGLISH + RUSSIAN)
-- ================================
local Translations = {
    en = {
        -- Farm Tab
        auto_harvest = "Auto Harvest",
        select_plants_harvest = "Select Plants to Harvest",
        choose_plants_harvest = "Choose which plants to auto harvest",
        auto_harvest_desc = "Automatically harvest selected plants",
        auto_plant = "Auto Plant",
        select_seeds_plant = "Select Seeds to Plant",
        choose_seeds_plant = "Choose which seeds to auto plant",
        auto_plant_desc = "Automatically plant selected seeds",
        
        -- Shop Tab
        auto_buy_seeds = "Auto Buy Seeds",
        select_seeds_buy = "Select Seeds to Buy",
        choose_seeds_buy = "Choose which seeds to auto buy",
        auto_buy_seeds_desc = "Automatically purchase selected seeds",
        auto_buy_gears = "Auto Buy Gears",
        select_gears_buy = "Select Gears to Buy",
        choose_gears_buy = "Choose which gears to auto buy",
        auto_buy_gears_desc = "Automatically purchase selected gears",
        
        -- Sell Tab
        auto_sell = "Auto Sell",
        sell_all_now = "Sell All Now",
        sell_all_desc = "Sell all items immediately",
        auto_sell_desc = "Automatically sell items on cooldown",
        
        -- Interaction Tab
        interaction_helper = "Interaction Helper",
        instant_take = "Instant Take",
        instant_take_desc = "Instantly take items without holding",
        instant_take_enabled = "Instant Take: ONLINE",
        interaction_desc = "Auto-trigger proximity prompts",
        
        -- Settings Tab
        config_management = "Config Management",
        save_settings = "Save Settings",
        save_desc = "Save current settings to file",
        load_settings = "Load Settings",
        load_desc = "Load settings from file",
        reset_all = "Reset All",
        reset_desc = "Reset all settings to default",
        language = "Language",
        select_language = "Select your preferred language",
        self_destruct = "SELF DESTRUCT",
        self_destruct_desc = "Terminate the script immediately",
        
        -- Notifications
        settings_saved = "Settings saved!",
        settings_loaded = "Settings loaded!",
        no_settings = "No saved settings found",
        reset_complete = "Reset complete!",
        loaded = "Loaded! Press C to toggle menu",
        error = "Error",
        success = "Success",
        sell_success = "Items sold!",
        config_saved = "Config saved successfully!",
        config_loaded = "Config loaded successfully!",
        config_reset = "All settings reset to default"
    },
    ru = {
        -- Farm Tab
        auto_harvest = "Авто Сбор",
        select_plants_harvest = "Выбрать растения",
        choose_plants_harvest = "Выберите растения для авто сбора",
        auto_harvest_desc = "Автоматически собирать выбранные растения",
        auto_plant = "Авто Посадка",
        select_seeds_plant = "Выбрать семена",
        choose_seeds_plant = "Выберите семена для авто посадки",
        auto_plant_desc = "Автоматически сажать выбранные семена",
        
        -- Shop Tab
        auto_buy_seeds = "Авто Покупка Семян",
        select_seeds_buy = "Выбрать семена",
        choose_seeds_buy = "Выберите семена для авто покупки",
        auto_buy_seeds_desc = "Автоматически покупать выбранные семена",
        auto_buy_gears = "Авто Покупка Снаряжения",
        select_gears_buy = "Выбрать снаряжение",
        choose_gears_buy = "Выберите снаряжение для авто покупки",
        auto_buy_gears_desc = "Автоматически покупать выбранное снаряжение",
        
        -- Sell Tab
        auto_sell = "Авто Продажа",
        sell_all_now = "Продать всё",
        sell_all_desc = "Продать все предметы немедленно",
        auto_sell_desc = "Автоматически продавать предметы",
        
        -- Interaction Tab
        interaction_helper = "Помощник Взаимодействия",
        instant_take = "Мгновенный Забор",
        instant_take_desc = "Мгновенно забирайте предметы",
        instant_take_enabled = "Мгновенный Забор: АКТИВЕН",
        interaction_desc = "Авто активация proximity промптов",
        
        -- Settings Tab
        config_management = "Управление Конфигурацией",
        save_settings = "Сохранить",
        save_desc = "Сохранить текущие настройки",
        load_settings = "Загрузить",
        load_desc = "Загрузить настройки из файла",
        reset_all = "Сбросить всё",
        reset_desc = "Сбросить все настройки",
        language = "Язык",
        select_language = "Выберите предпочитаемый язык",
        self_destruct = "САМОУНИЧТОЖЕНИЕ",
        self_destruct_desc = "Остановить скрипт",
        
        -- Notifications
        settings_saved = "Настройки сохранены!",
        settings_loaded = "Настройки загружены!",
        no_settings = "Сохранённые настройки не найдены",
        reset_complete = "Сброс завершён!",
        loaded = "Загружено! Нажмите C для открытия меню",
        error = "Ошибка",
        success = "Успех",
        sell_success = "Предметы проданы!",
        config_saved = "Конфигурация сохранена!",
        config_loaded = "Конфигурация загружена!",
        config_reset = "Все настройки сброшены"
    }
}

local CurrentLanguage = "en"

local function GetText(key)
    return Translations[CurrentLanguage][key] or Translations.en[key] or key
end

-- ================================
-- SETTINGS
-- ================================
local Settings = {
    selectedHarvestPlants = {},
    autoHarvest = false,
    selectedPlantSeeds = {},
    autoPlant = false,
    selectedBuySeeds = {},
    autoBuySeeds = false,
    selectedBuyGears = {},
    autoBuyGears = false,
    autoSell = false,
    instantTake = false,
    language = "en"
}

local UI = {}
local Loops = {}
local LoopActive = {}

-- ================================
-- SERVICES
-- ================================
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local RunService = game:GetService("RunService")
local ProximityPromptService = game:GetService("ProximityPromptService")
local gardensFolder = workspace:WaitForChild("Gardens")
local remoteEvent = game:GetService("ReplicatedStorage"):WaitForChild("SharedModules"):WaitForChild("Packet"):WaitForChild("RemoteEvent")

-- ================================
-- CONSTANTS
-- ================================
local allPlantsList = {
    "Carrot", "Strawberry", "Blueberry", "Tulip", "Tomato", "Apple",
    "Bamboo", "Corn", "Cactus", "Pineapple", "Mushroom", "Green Bean",
    "Banana", "Grape", "Coconut", "Mango", "Dragon Fruit", "Acorn",
    "Cherry Sunflower", "Venus Fly Trap", "Pomegranate", "Poison Apple",
    "Moon Bloom", "Dragon's Breath"
}

local allGearsList = {
    "Common Watering Can", "Common Sprinkler", "Sign", "Uncommon Sprinkler",
    "Trowel", "Rare Sprinkler", "Jump Mushroom", "Speed Mushroom", "Lantern",
    "Shrink Mushroom", "Supersize Mushroom", "Gnome", "Flashbang", "Basic Pot",
    "Legendary Sprinkler", "Invisible Mushroom", "Teleporter", "WheelBarrow",
    "Super Watering Can", "Super Sprinkler"
}

local singleHarvestPlants = { Carrot = true, Tulip = true, Bamboo = true, Mushroom = true }

-- ================================
-- HELPER FUNCTIONS
-- ================================
local function harvestPlantPacket(plantName, plantID, fruitID)
    local rawString
    if singleHarvestPlants[plantName] or not fruitID then
        rawString = "\178\000$" .. tostring(plantID) .. "\000"
    else
        rawString = "\178\000$" .. tostring(plantID) .. "$" .. tostring(fruitID)
    end
    remoteEvent:FireServer(buffer.fromstring(rawString))
end

local function getPlotYLevel()
    for _, descendant in pairs(gardensFolder:GetDescendants()) do
        if descendant.Name:match("PlantAreaColumn") and descendant:IsA("BasePart") then
            return descendant.Position.Y
        end
    end
    return nil
end

local function manualSell()
    pcall(function() remoteEvent:FireServer(buffer.fromstring("\154\000#")) end)
    WindUI:Notify({ Title = GetText("success"), Content = GetText("sell_success"), Duration = 2 })
end

-- ================================
-- INSTANT TAKE
-- ================================
local instantTakeConnection = nil

local function setupInstantTake()
    if instantTakeConnection then
        instantTakeConnection:Disconnect()
        instantTakeConnection = nil
    end
    if Settings.instantTake then
        instantTakeConnection = ProximityPromptService.PromptButtonHoldBegan:Connect(function(prompt, player)
            if player == LocalPlayer then fireproximityprompt(prompt) end
        end)
    end
end

-- ================================
-- SAVE/LOAD CONFIG
-- ================================
local function SaveSettings()
    local configToSave = {
        selectedHarvestPlants = Settings.selectedHarvestPlants,
        autoHarvest = Settings.autoHarvest,
        selectedPlantSeeds = Settings.selectedPlantSeeds,
        autoPlant = Settings.autoPlant,
        selectedBuySeeds = Settings.selectedBuySeeds,
        autoBuySeeds = Settings.autoBuySeeds,
        selectedBuyGears = Settings.selectedBuyGears,
        autoBuyGears = Settings.autoBuyGears,
        autoSell = Settings.autoSell,
        instantTake = Settings.instantTake,
        language = Settings.language
    }
    local success, encoded = pcall(function() return HttpService:JSONEncode(configToSave) end)
    if success then pcall(function() writefile(ConfigFile, encoded) end) end
    return success
end

local function LoadSettings()
    if isfile(ConfigFile) then
        local success, data = pcall(function() return HttpService:JSONDecode(readfile(ConfigFile)) end)
        if success and data then
            for k, v in pairs(data) do Settings[k] = v end
            CurrentLanguage = Settings.language or "en"
            setupInstantTake()
            return true
        end
    end
    return false
end

-- ================================
-- SELF DESTRUCT
-- ================================
local function selfDestruct()
    for _, loop in pairs(Loops) do if loop then task.cancel(loop) end end
    if instantTakeConnection then instantTakeConnection:Disconnect() end
    Window:Destroy()
    WindUI:Notify({ Title = "SYSTEM", Content = "Script terminated.", Duration = 2 })
    task.wait(1)
    error("Script self-destructed")
end

-- ================================
-- UI LANGUAGE UPDATE
-- ================================
local function UpdateUILanguage()
    if UI.harvestSection then UI.harvestSection:SetTitle(GetText("auto_harvest")) end
    if UI.plantSection then UI.plantSection:SetTitle(GetText("auto_plant")) end
    if UI.buySeedsSection then UI.buySeedsSection:SetTitle(GetText("auto_buy_seeds")) end
    if UI.buyGearsSection then UI.buyGearsSection:SetTitle(GetText("auto_buy_gears")) end
    if UI.sellSection then UI.sellSection:SetTitle(GetText("auto_sell")) end
    if UI.interactionSection then UI.interactionSection:SetTitle(GetText("interaction_helper")) end
    if UI.configSection then UI.configSection:SetTitle(GetText("config_management")) end
    if UI.langSection then UI.langSection:SetTitle(GetText("language")) end
    
    if UI.harvestDropdown then
        UI.harvestDropdown:SetTitle(GetText("select_plants_harvest"))
        UI.harvestDropdown:SetDesc(GetText("choose_plants_harvest"))
    end
    if UI.harvestToggle then
        UI.harvestToggle:SetTitle(GetText("auto_harvest"))
        UI.harvestToggle:SetDesc(GetText("auto_harvest_desc"))
    end
    if UI.plantDropdown then
        UI.plantDropdown:SetTitle(GetText("select_seeds_plant"))
        UI.plantDropdown:SetDesc(GetText("choose_seeds_plant"))
    end
    if UI.plantToggle then
        UI.plantToggle:SetTitle(GetText("auto_plant"))
        UI.plantToggle:SetDesc(GetText("auto_plant_desc"))
    end
    if UI.buySeedsDropdown then
        UI.buySeedsDropdown:SetTitle(GetText("select_seeds_buy"))
        UI.buySeedsDropdown:SetDesc(GetText("choose_seeds_buy"))
    end
    if UI.buySeedsToggle then
        UI.buySeedsToggle:SetTitle(GetText("auto_buy_seeds"))
        UI.buySeedsToggle:SetDesc(GetText("auto_buy_seeds_desc"))
    end
    if UI.buyGearsDropdown then
        UI.buyGearsDropdown:SetTitle(GetText("select_gears_buy"))
        UI.buyGearsDropdown:SetDesc(GetText("choose_gears_buy"))
    end
    if UI.buyGearsToggle then
        UI.buyGearsToggle:SetTitle(GetText("auto_buy_gears"))
        UI.buyGearsToggle:SetDesc(GetText("auto_buy_gears_desc"))
    end
    if UI.sellToggle then
        UI.sellToggle:SetTitle(GetText("auto_sell"))
        UI.sellToggle:SetDesc(GetText("auto_sell_desc"))
    end
    if UI.sellButton then
        UI.sellButton:SetTitle(GetText("sell_all_now"))
        UI.sellButton:SetDesc(GetText("sell_all_desc"))
    end
    if UI.instantTakeToggle then
        UI.instantTakeToggle:SetTitle(GetText("instant_take"))
        UI.instantTakeToggle:SetDesc(GetText("instant_take_desc"))
    end
    if UI.saveButton then
        UI.saveButton:SetTitle(GetText("save_settings"))
        UI.saveButton:SetDesc(GetText("save_desc"))
    end
    if UI.loadButton then
        UI.loadButton:SetTitle(GetText("load_settings"))
        UI.loadButton:SetDesc(GetText("load_desc"))
    end
    if UI.resetButton then
        UI.resetButton:SetTitle(GetText("reset_all"))
        UI.resetButton:SetDesc(GetText("reset_desc"))
    end
    if UI.selfDestructButton then
        UI.selfDestructButton:SetTitle(GetText("self_destruct"))
        UI.selfDestructButton:SetDesc(GetText("self_destruct_desc"))
    end
    if UI.languageDropdown then
        UI.languageDropdown:SetTitle(GetText("language"))
        UI.languageDropdown:SetDesc(GetText("select_language"))
    end
end

-- ================================
-- APPLY SETTINGS TO UI
-- ================================
local function ApplySettingsToUI()
    if UI.harvestDropdown then UI.harvestDropdown:Select(Settings.selectedHarvestPlants) end
    if UI.harvestToggle then UI.harvestToggle:Set(Settings.autoHarvest) end
    if UI.plantDropdown then UI.plantDropdown:Select(Settings.selectedPlantSeeds) end
    if UI.plantToggle then UI.plantToggle:Set(Settings.autoPlant) end
    if UI.buySeedsDropdown then UI.buySeedsDropdown:Select(Settings.selectedBuySeeds) end
    if UI.buySeedsToggle then UI.buySeedsToggle:Set(Settings.autoBuySeeds) end
    if UI.buyGearsDropdown then UI.buyGearsDropdown:Select(Settings.selectedBuyGears) end
    if UI.buyGearsToggle then UI.buyGearsToggle:Set(Settings.autoBuyGears) end
    if UI.sellToggle then UI.sellToggle:Set(Settings.autoSell) end
    if UI.instantTakeToggle then UI.instantTakeToggle:Set(Settings.instantTake) end
    if UI.languageDropdown then UI.languageDropdown:Select(Settings.language) end
    UpdateUILanguage()
    setupInstantTake()
end

-- ================================
-- LOOP SYSTEM
-- ================================
local function createLoop(name, enabledCheck, executeFunc, interval)
    return function()
        if LoopActive[name] then return end
        LoopActive[name] = true
        task.spawn(function()
            while enabledCheck() and RunService:IsRunning() do
                pcall(executeFunc)
                task.wait(interval)
            end
            LoopActive[name] = false
            Loops[name] = nil
        end)
    end
end

local harvestLoopFunc = createLoop("harvest", function() return Settings.autoHarvest end, function()
    for _, plot in pairs(gardensFolder:GetChildren()) do
        local plantsFolder = plot:FindFirstChild("Plants")
        if plantsFolder then
            for _, plantModel in pairs(plantsFolder:GetChildren()) do
                local fruitsFolder = plantModel:FindFirstChild("Fruits")
                if fruitsFolder then
                    for _, fruitModel in pairs(fruitsFolder:GetChildren()) do
                        local ownerId = fruitModel:GetAttribute("UserId")
                        local plantName = fruitModel:GetAttribute("CorePartName")
                        local plantID = fruitModel:GetAttribute("PlantId")
                        local fruitID = fruitModel:GetAttribute("FruitId")
                        if ownerId == LocalPlayer.UserId and table.find(Settings.selectedHarvestPlants, plantName) and plantID and fruitID then
                            harvestPlantPacket(plantName, plantID, fruitID)
                            task.wait(0.02)
                        end
                    end
                else
                    local ownerId = plantModel:GetAttribute("UserId")
                    local plantName = plantModel:GetAttribute("SeedName")
                    local plantID = plantModel:GetAttribute("PlantId")
                    local isReady = plantModel:GetAttribute("PlantGrowthReady")
                    if ownerId == LocalPlayer.UserId and isReady and table.find(Settings.selectedHarvestPlants, plantName) and plantID then
                        harvestPlantPacket(plantName, plantID, nil)
                        task.wait(0.02)
                    end
                end
            end
        end
    end
end, 0.1)

local plantLoopFunc = createLoop("plant", function() return Settings.autoPlant end, function()
    local character = LocalPlayer.Character
    local rootPart = character and character:FindFirstChild("HumanoidRootPart")
    local humanoid = character and character:FindFirstChildOfClass("Humanoid")
    if rootPart and humanoid then
        for _, seedName in pairs(Settings.selectedPlantSeeds) do
            local seedTool = LocalPlayer.Backpack:FindFirstChild(seedName) or character:FindFirstChild(seedName)
            if seedTool then
                if seedTool.Parent == LocalPlayer.Backpack then humanoid:EquipTool(seedTool) task.wait(0.05) end
                local targetY = getPlotYLevel() or (rootPart.Position.Y - 3)
                local finalPos = rootPart.Position + Vector3.new((math.random(-6,6)/10), 0, (math.random(-6,6)/10))
                local rawPacket = "\004\000" .. string.pack("fff", finalPos.X, targetY, finalPos.Z) .. string.char(#seedName) .. seedName
                remoteEvent:FireServer(buffer.fromstring(rawPacket), { seedTool })
                task.wait(0.03)
            end
        end
    end
end, 0.08)

local buySeedsLoopFunc = createLoop("buySeeds", function() return Settings.autoBuySeeds end, function()
    for _, plantName in pairs(Settings.selectedBuySeeds) do
        remoteEvent:FireServer(buffer.fromstring("h\000" .. string.char(#plantName) .. plantName))
        task.wait(0.03)
    end
end, 0.5)

local buyGearsLoopFunc = createLoop("buyGears", function() return Settings.autoBuyGears end, function()
    for _, gearName in pairs(Settings.selectedBuyGears) do
        remoteEvent:FireServer(buffer.fromstring("l\000" .. string.char(#gearName) .. gearName))
        task.wait(0.03)
    end
end, 0.5)

local sellLoopFunc = createLoop("sell", function() return Settings.autoSell end, function()
    remoteEvent:FireServer(buffer.fromstring("\154\000#"))
end, 1)

local function StartLoop(name)
    if Loops[name] then return end
    if name == "harvest" then Loops.harvest = harvestLoopFunc()
    elseif name == "plant" then Loops.plant = plantLoopFunc()
    elseif name == "buySeeds" then Loops.buySeeds = buySeedsLoopFunc()
    elseif name == "buyGears" then Loops.buyGears = buyGearsLoopFunc()
    elseif name == "sell" then Loops.sell = sellLoopFunc() end
end

-- ================================
-- CREATE UI ELEMENTS
-- ================================
UI.harvestSection = Farm:Section({ Title = GetText("auto_harvest"), TextXAlignment = "Center", TextSize = 18, Box = true, BoxBorder = true })
UI.harvestDropdown = Farm:Dropdown({ Title = GetText("select_plants_harvest"), Desc = GetText("choose_plants_harvest"), Values = allPlantsList, Multi = true, Default = Settings.selectedHarvestPlants, AllowNone = true, MenuWidth = 280, SearchBarEnabled = true, Callback = function(s) Settings.selectedHarvestPlants = s or {} SaveSettings() end })
UI.harvestToggle = Farm:Toggle({ Title = GetText("auto_harvest"), Desc = GetText("auto_harvest_desc"), Value = Settings.autoHarvest, Callback = function(s) Settings.autoHarvest = s SaveSettings() if s then StartLoop("harvest") end end })

UI.plantSection = Farm:Section({ Title = GetText("auto_plant"), TextXAlignment = "Center", TextSize = 18, Box = true, BoxBorder = true })
UI.plantDropdown = Farm:Dropdown({ Title = GetText("select_seeds_plant"), Desc = GetText("choose_seeds_plant"), Values = allPlantsList, Multi = true, Default = Settings.selectedPlantSeeds, AllowNone = true, MenuWidth = 280, SearchBarEnabled = true, Callback = function(s) Settings.selectedPlantSeeds = s or {} SaveSettings() end })
UI.plantToggle = Farm:Toggle({ Title = GetText("auto_plant"), Desc = GetText("auto_plant_desc"), Value = Settings.autoPlant, Callback = function(s) Settings.autoPlant = s SaveSettings() if s then StartLoop("plant") end end })

UI.buySeedsSection = Shop:Section({ Title = GetText("auto_buy_seeds"), TextXAlignment = "Center", TextSize = 18, Box = true, BoxBorder = true })
UI.buySeedsDropdown = Shop:Dropdown({ Title = GetText("select_seeds_buy"), Desc = GetText("choose_seeds_buy"), Values = allPlantsList, Multi = true, Default = Settings.selectedBuySeeds, AllowNone = true, MenuWidth = 280, SearchBarEnabled = true, Callback = function(s) Settings.selectedBuySeeds = s or {} SaveSettings() end })
UI.buySeedsToggle = Shop:Toggle({ Title = GetText("auto_buy_seeds"), Desc = GetText("auto_buy_seeds_desc"), Value = Settings.autoBuySeeds, Callback = function(s) Settings.autoBuySeeds = s SaveSettings() if s then StartLoop("buySeeds") end end })

UI.buyGearsSection = Shop:Section({ Title = GetText("auto_buy_gears"), TextXAlignment = "Center", TextSize = 18, Box = true, BoxBorder = true })
UI.buyGearsDropdown = Shop:Dropdown({ Title = GetText("select_gears_buy"), Desc = GetText("choose_gears_buy"), Values = allGearsList, Multi = true, Default = Settings.selectedBuyGears, AllowNone = true, MenuWidth = 280, SearchBarEnabled = true, Callback = function(s) Settings.selectedBuyGears = s or {} SaveSettings() end })
UI.buyGearsToggle = Shop:Toggle({ Title = GetText("auto_buy_gears"), Desc = GetText("auto_buy_gears_desc"), Value = Settings.autoBuyGears, Callback = function(s) Settings.autoBuyGears = s SaveSettings() if s then StartLoop("buyGears") end end })

UI.sellSection = Sell:Section({ Title = GetText("auto_sell"), TextXAlignment = "Center", TextSize = 18, Box = true, BoxBorder = true })
UI.sellButton = Sell:Button({ Title = GetText("sell_all_now"), Desc = GetText("sell_all_desc"), Callback = function() manualSell() end })
UI.sellToggle = Sell:Toggle({ Title = GetText("auto_sell"), Desc = GetText("auto_sell_desc"), Value = Settings.autoSell, Callback = function(s) Settings.autoSell = s SaveSettings() if s then StartLoop("sell") end end })

UI.interactionSection = Interaction:Section({ Title = GetText("interaction_helper"), TextXAlignment = "Center", TextSize = 18, Box = true, BoxBorder = true })
UI.instantTakeToggle = Interaction:Toggle({ Title = GetText("instant_take"), Desc = GetText("instant_take_desc"), Value = Settings.instantTake, Callback = function(s) Settings.instantTake = s SaveSettings() setupInstantTake() if s then WindUI:Notify({ Title = GetText("success"), Content = GetText("instant_take_enabled"), Duration = 2 }) end end })

UI.configSection = SettingsTab:Section({ Title = GetText("config_management"), TextXAlignment = "Center", TextSize = 18, Box = true, BoxBorder = true })
UI.saveButton = SettingsTab:Button({ Title = GetText("save_settings"), Desc = GetText("save_desc"), Callback = function() if SaveSettings() then WindUI:Notify({ Title = GetText("success"), Content = GetText("config_saved"), Duration = 2 }) else WindUI:Notify({ Title = GetText("error"), Content = GetText("error"), Duration = 2 }) end end })
UI.loadButton = SettingsTab:Button({ Title = GetText("load_settings"), Desc = GetText("load_desc"), Callback = function() if LoadSettings() then ApplySettingsToUI() WindUI:Notify({ Title = GetText("success"), Content = GetText("config_loaded"), Duration = 2 }) else WindUI:Notify({ Title = GetText("error"), Content = GetText("no_settings"), Duration = 2 }) end end })
UI.resetButton = SettingsTab:Button({ Title = GetText("reset_all"), Desc = GetText("reset_desc"), Callback = function() Settings = { selectedHarvestPlants = {}, autoHarvest = false, selectedPlantSeeds = {}, autoPlant = false, selectedBuySeeds = {}, autoBuySeeds = false, selectedBuyGears = {}, autoBuyGears = false, autoSell = false, instantTake = false, language = "en" } CurrentLanguage = "en" ApplySettingsToUI() SaveSettings() WindUI:Notify({ Title = GetText("success"), Content = GetText("config_reset"), Duration = 2 }) end })

UI.selfDestructButton = SettingsTab:Button({ Title = GetText("self_destruct"), Desc = GetText("self_destruct_desc"), Callback = function() selfDestruct() end })
UI.selfDestructButton:SetTextColor3(Color3.fromRGB(255, 0, 0))

UI.langSection = SettingsTab:Section({ Title = GetText("language"), TextXAlignment = "Center", TextSize = 18, Box = true, BoxBorder = true })
UI.languageDropdown = SettingsTab:Dropdown({ Title = GetText("language"), Desc = GetText("select_language"), Values = {"en - English", "ru - Russian"}, Multi = false, Default = Settings.language == "en" and "en - English" or "ru - Russian", Callback = function(s) if s then local code = s:match("^([%a]+)") if code and Translations[code] then CurrentLanguage = code Settings.language = code SaveSettings() UpdateUILanguage() WindUI:Notify({ Title = GetText("success"), Content = GetText("settings_saved"), Duration = 2 }) end end end })

-- ================================
-- INITIALIZE
-- ================================
LoadSettings()
ApplySettingsToUI()

if Settings.autoHarvest then StartLoop("harvest") end
if Settings.autoPlant then StartLoop("plant") end
if Settings.autoBuySeeds then StartLoop("buySeeds") end
if Settings.autoBuyGears then StartLoop("buyGears") end
if Settings.autoSell then StartLoop("sell") end

WindUI:Notify({ Title = "Grow a Garden 2", Content = GetText("loaded"), Duration = 4 })