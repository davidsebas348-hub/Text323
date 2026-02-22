-- ANIMATION LOADER BASADO EN TU SISTEMA

local config = _G.AnimConfig
if not config then
    warn("No se encontró _G.AnimConfig")
    return
end

local Players = game:GetService("Players")
local player = Players.LocalPlayer

-- TUS PACKS (ejemplo basado en lo que me pasaste)
local PACKS = {
    ["Adidas Sports"] = {
        WalkAnim = 18537392113,
        RunAnim = 18537384940,
        JumpAnim = 18537380791,
        FallAnim = 18537367238,
        SwimIdle = 18537387180,
        Swim = 18537389531,
        ClimbAnim = 18537363391,
        Animation1 = 18537376492,
        Animation2 = 18537371272
    },

    ["Adidas Community"] = {
        WalkAnim = 122150855457006,
        RunAnim = 82598234841035,
        JumpAnim = 75290611992385,
        FallAnim = 98600215928904,
        SwimIdle = 109346520324160,
        Swim = 133308483266208,
        ClimbAnim = 88763136693023,
        Animation1 = 122257458498464,
        Animation2 = 102357151005774
    }
}

local function applyPack(character)
    local animate = character:WaitForChild("Animate")

    for animType, packName in pairs(config) do
        local pack = PACKS[packName]
        if pack and pack[animType] then
            local animObject = animate:FindFirstChild(animType)
            if animObject and animObject:FindFirstChildOfClass("Animation") then
                animObject:FindFirstChildOfClass("Animation").AnimationId =
                    "rbxassetid://" .. pack[animType]
            end
        end
    end
end

-- Aplicar si ya existe
if player.Character then
    applyPack(player.Character)
end

-- Volver a aplicar al respawn
player.CharacterAdded:Connect(function(char)
    applyPack(char)
end)
