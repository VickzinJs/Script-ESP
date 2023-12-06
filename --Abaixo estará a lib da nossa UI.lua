--Abaixo estará a lib da nossa UI

local Lib = loadstring(game:HttpGet("https://raw.githubusercontent.com/7yhx/kwargs_Ui_Library/main/source.lua"))()

local UI = Lib:Create{
    Theme = "Dark", -- or any other theme
    Size = UDim2.new(0, 555, 0, 400) -- default
 }
 
 local Main = UI:Tab{
    Name = "Inicio"
 }
 
 local Divider = Main:Divider{
    Name = "Inicio shit"
 }
 
 local QuitDivider = Main:Divider{
    Name = "Sair"
 }

 local KillAll = Divider:Button{
    Name = "Kill all",
    Description = "Kills all the players in the game!",
    Callback = function()
        print("All players killed.")
    end
 }
 
 local LoopKillAll = Divider:Toggle{
    Name = "Loop kill all",
    Description = "Loop kills everyone in the game.",
    Callback = function(State)
        print("Kill state: ", State)
    end
 }
 
 local OtherToggleStyle = Divider:Toggle{
    Name = "2nd style of toggle",
    Style = 2
 }
 
 local Players = Divider:Dropdown{
    Name = "Player list",
    Options = {"Player1", "Player2", "Player3", "Player4", "Player5"},
    Callback = function(Value)
        print(Value)
    end
 }
 
 Divider:ColorPicker{
    Name = "ESP color",
    Default = Color3.fromRGB(0, 255, 255), -- default,
    Callback = function(Value)
        print(Value)
    end
 }
 
 Divider:Box{
    Name = "Car name",
    ClearText = true, -- whether the textbox clears on focus or not
    Callback = function(Value)
        print(Value)
    end
 }
 
 Divider:SearchDropdown{
    Name = "Teleports",
    Options = {"Pleasant Park", "Loot Lake", "Tomato Town", "Wailing Woods", "Anarchy Acres", "Retail Row"},
    ClearText = false, -- default
    Callback = function(Value)
        print(Value)
    end
 }
 
 local Quit = QuitDivider:Button{
    Name = "Closes the ui library.",
    Callback = function()
        UI:Quit{
            Message = "Fuck off...", -- closing message
            Length = 1 -- seconds the closing message shows for
        }
    end
 }

 local player = game.Players.LocalPlayer
local mouse = player:GetMouse()

local function createArrow(position, color)
    local arrow = Instance.new("Part")
    arrow.Size = Vector3.new(1, 5, 1)
    arrow.Anchored = true
    arrow.CanCollide = false
    arrow.BrickColor = BrickColor.new(color)
    arrow.Position = position + Vector3.new(0, 2.5, 0)
    arrow.Parent = game.Workspace
    return arrow
end

local function detectEnemies()
    while true do
        wait(0.1) -- Ajuste o intervalo de detecção aqui
        for _, enemy in pairs(game.Players:GetPlayers()) do
            if enemy.TeamColor ~= player.TeamColor then
                local arrowColor = enemy.TeamColor == BrickColor.new("Bright red") and "Bright red" or "Bright blue"
                local arrow = createArrow(enemy.Character.HumanoidRootPart.Position, arrowColor)
                wait(3) -- Tempo que a seta fica visível
                arrow:Destroy()
            end
        end
    end
end

local function toggleScript()
    local enabled = true
    mouse.KeyDown:Connect(function(key)
        if key == "e" then -- Tecla para ativar/desativar o script (pode ser alterada)
            enabled = not enabled
            if enabled then
                detectEnemies()
            end
        end
    end)
end

toggleScript()