--linoria ui is hot :heart:

local repo = 'https://raw.githubusercontent.com/violin-suzutsuki/LinoriaLib/main/Library.lua'

local Library = loadstring(game:HttpGet(repo .. 'Library.lua'))()
local ThemeManager = loadstring(game:HttpGet(repo .. 'addons/ThemeManager.lua'))()
local SaveManager = loadstring(game:HttpGet(repo .. 'addons/SaveManager.lua'))()

local Window = Library:CreateWindow({
    Title = "Lunar's Utility Tool v2",
    Center = true, 
    AutoShow = true,
})

local Tabs = {
    Main = Window:AddTab('Main'), 
    ['UI Settings'] = Window:AddTab('UI Settings'),
}
--Adds the group box called "localPlayer" obviously?
local LeftGroupBox = Tabs.Main:AddLeftGroupbox('LocalPlayer')
LeftGroupBox:AddLabel('Remastered from my old utility tool, which,\nwas using kavo ui lib.\ncringe right?', true)
LeftGroupBox:AddDivider()
LeftGroupBox:AddSlider('wspeed', {
    Text = 'WalkSpeed Changer',
    Default = 16,
    Min = 16,
    Max = 250,
    Rounding = 0,
    Compact = false,
})

local Number = Options.wspeed.Value
Options.wspeed:OnChanged(function()
    print('WalkSpeed was changed! Updated to value:', Options.wspeed.Value)
    game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = Options.wspeed.Value
end)

LeftGroupBox:AddSlider('jspeed', {
    Text = 'JumpPower Changer',
    Default = 50,
    Min = 50,
    Max = 500,
    Rounding = 0,
    Compact = false,
})

local Number = Options.wspeed.Value
Options.jspeed:OnChanged(function()
    print('JumpPower was changed! Updated to value:', Options.jspeed.Value)
    game.Players.LocalPlayer.Character.Humanoid.JumpPower = Options.jspeed.Value
end)

local iy = LeftGroupBox:AddButton('FPS Counter (hotty)', function()
    loadstring(game:HttpGet('https://raw.githubusercontent.com/lunartechnoIogies/scripts/main/rofps.lua'))()
    print('credits to specowos for fps counter check him out fr')
end)
LeftGroupBox:AddLabel('thx to specowos for fps counter,\ncheck him out!')

Library:OnUnload(function()
    print('Unloaded!')
    Library.Unloaded = true
end)
--Adds the group box called "FE Scripts" obviously?
local RightGroupBox = Tabs.Main:AddLeftGroupbox('FE Scripts')
local clo = RightGroupBox:AddButton('CloVR v2 (Cool vr script)', function()
    loadstring(game:HttpGet('https://raw.githubusercontent.com/lunartechnoIogies/scripts/main/clovr.lua'))()
    print('clovr2 executed ig')
end)

local MenuGroup = Tabs['UI Settings']:AddLeftGroupbox('Menu')
RightGroupBox:AddLabel('Controls;')
RightGroupBox:AddLabel('M1 to control left arm')
RightGroupBox:AddLabel('M2 to control right arm')
RightGroupBox:AddLabel('CTRL to  crouch')
RightGroupBox:AddLabel('Zoom in or it wont work!')
--Adds the group box called "Misc Utils" obviously?
local BottomGroupBox = Tabs.Main:AddLeftGroupbox('Misc Utils')
local spr2 = BottomGroupBox:AddButton('Simple Spy (remote spy)', function()
    loadstring(game:HttpGet('https://raw.githubusercontent.com/CoochieSlayer6372/SimpleSpyFixed/main/badscript2.lua'))()
    print('Simple Spy executed')
end)

local iy = BottomGroupBox:AddButton('Infinite Yield (Risky)', function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source", true))()
    print('Infinite Yield Executed!')
end)
iy:AddTooltip('Only use infinite yield if u know it doesnt ban!')

--Idk bro its about themes,config,keybind dont touch this

MenuGroup:AddButton('Unload', function() Library:Unload() end)
MenuGroup:AddLabel('Menu bind'):AddKeyPicker('MenuKeybind', { Default = 'RightShift', NoUI = true, Text = 'Menu keybind' }) 
Library.ToggleKeybind = Options.MenuKeybind
ThemeManager:SetLibrary(Library)
SaveManager:SetLibrary(Library)
SaveManager:IgnoreThemeSettings() 
SaveManager:SetIgnoreIndexes({ 'MenuKeybind' }) 
ThemeManager:SetFolder('lunar.stuff')
SaveManager:SetFolder('lunar.shit/utilitytool')
SaveManager:BuildConfigSection(Tabs['UI Settings']) 
ThemeManager:ApplyToTab(Tabs['UI Settings'])
