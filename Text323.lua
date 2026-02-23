local Players = game:GetService("Players")
local player = Players.LocalPlayer

local config = getgenv().AnimConfig
if not config then return end
-- === PACKS ===
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
    },
    ["Adidas Aura"] = {
        WalkAnim = 83842218823011,
        RunAnim = 118320322718866,
        JumpAnim = 109996626521204,
        FallAnim = 95603166884636,
        SwimIdle = 94922130551805,
        Swim = 134530128383903,
        ClimbAnim = 97824616490448,
        Animation1 = 110211186840347,
        Animation2 = 114191137265065
    },
    ["Wicked Popular"] = {
        WalkAnim = 92072849924640,
        RunAnim = 72301599441680,
        JumpAnim = 104325245285198,
        FallAnim = 121152442762481,
        SwimIdle = 113199415118199,
        Swim = 99384245425157,
        ClimbAnim = 131326830509784,
        Animation1 = 118832222982049,
        Animation2 = 76049494037641
    },
    ["Elder"] = {
        WalkAnim = 10921111375,
        RunAnim = 10921104374,
        JumpAnim = 10921107367,
        FallAnim = 10921105765,
        SwimIdle = 10921110146,
        Swim = 10921108971,
        ClimbAnim = 10921100400,
        Animation1 = 10921101664,
        Animation2 = 10921102574
    },
    ["Zombie"] = {
        WalkAnim = 10921355261,
        RunAnim = 616163682,
        JumpAnim = 10921351278,
        FallAnim = 10921350320,
        SwimIdle = 10921353442,
        Swim = 10921352344,
        ClimbAnim = 10921343576,
        Animation1 = 10921344533,
        Animation2 = 10921345304
    },
    ["Mage"] = {
        WalkAnim = 10921152678,
        RunAnim = 10921148209,
        JumpAnim = 10921149743,
        FallAnim = 10921148939,
        SwimIdle = 10921151661,
        Swim = 10921150788,
        ClimbAnim = 10921143404,
        Animation1 = 10921144709,
        Animation2 = 10921145797
    },
    ["Catwalk Glam"] = {
        WalkAnim = 109168724482748,
        RunAnim = 81024476153754,
        JumpAnim = 116936326516985,
        FallAnim = 92294537340807,
        SwimIdle = 98854111361360,
        Swim = 134591743181628,
        ClimbAnim = 119377220967554,
        Animation1 = 133806214992291,
        Animation2 = 94970088341563
    },
    ["Astronaut"] = {
        WalkAnim = 10921046031,
        RunAnim = 10921039308,
        JumpAnim = 10921042494,
        FallAnim = 10921040576,
        SwimIdle = 10921045006,
        Swim = 10921044000,
        ClimbAnim = 10921032124,
        Animation1 = 10921034824,
        Animation2 = 10921036806
    },
    ["Wicked Dancing Through Life"] = {
        WalkAnim = 73718308412641,
        RunAnim = 135515454877967,
        JumpAnim = 78508480717326,
        FallAnim = 78147885297412,
        SwimIdle = 129183123083281,
        Swim = 110657013921774,
        ClimbAnim = 129447497744818,
        Animation1 = 92849173543269,
        Animation2 = 132238900951109
    },
    ["Werewolf"] = {
        WalkAnim = 10921342074,
        RunAnim = 10921336997,
        JumpAnim = nil,
        FallAnim = 10921337907,
        SwimIdle = 10921341319,
        Swim = 10921340419,
        ClimbAnim = 10921329322,
        Animation1 = 10921330408,
        Animation2 = 10921333667
    },
    ["Superhero"] = {
        WalkAnim = 10921298616,
        RunAnim = 10921291831,
        JumpAnim = 10921294559,
        FallAnim = 10921293373,
        SwimIdle = 10921297391,
        Swim = 10921295495,
        ClimbAnim = 10921286911,
        Animation1 = 10921288909,
        Animation2 = 10921290167
    },
    ["Toy"] = {
        WalkAnim = 10921312010,
        RunAnim = 10921306285,
        JumpAnim = 10921308158,
        FallAnim = 10921307241,
        SwimIdle = 10921310341,
        Swim = 10921309319,
        ClimbAnim = 10921300839,
        Animation1 = 10921301576,
        Animation2 = nil
    },
    ["No Boundaries"] = {
        WalkAnim = 18747074203,
        RunAnim = 18747070484,
        JumpAnim = 18747069148,
        FallAnim = 18747062535,
        SwimIdle = 18747071682,
        Swim = 18747073181,
        ClimbAnim = 18747060903,
        Animation1 = 18747067405,
        Animation2 = 18747063918
    },
    ["NFL"] = {
        WalkAnim = 110358958299415,
        RunAnim = 117333533048078,
        JumpAnim = 119846112151352,
        FallAnim = 129773241321032,
        SwimIdle = 79090109939093,
        Swim = 132697394189921,
        ClimbAnim = 134630013742019,
        Animation1 = 92080889861410,
        Animation2 = 74451233229259
    },
    ["Amazon Unboxed"] = {
        WalkAnim = 90478085024465,
        RunAnim = 134824450619865,
        JumpAnim = 121454505477205,
        FallAnim = 94788218468396,
        SwimIdle = 129126268464847,
        Swim = 105962919001086,
        ClimbAnim = 121145883950231,
        Animation1 = 98281136301627,
        Animation2 = nil
    },
    ["Vampire"] = {
        WalkAnim = 10921326949,
        RunAnim = 10921320299,
        JumpAnim = 10921322186,
        FallAnim = 10921321317,
        SwimIdle = 10921325443,
        Swim = 10921324408,
        ClimbAnim = 10921314188,
        Animation1 = 10921315373,
        Animation2 = nil
    },
    ["Ninja"] = {
        Walk = 656121766,
        Run = 656118852,
        Jump = 656117878,
        Fall = 656115606,
        Swim = 656011509,
        SwimIdle = 656012453,
        Climb = 656003713,
        Idle = {656117400,656118341,886742569}
    },
    ["Robot"] = {
        Walk = 616095330,
        Run = 616091570,
        Jump = 616090535,
        Fall = 616087089,
        Swim = 616092998,
        SwimIdle = 616094091,
        Climb = 616086039,
        Idle = {616088211,616089559,885531463}
    },
    ["Levitation"] = {
        Walk = 616013216,
        Run = 616010382,
        Jump = 616008936,
        Fall = 616005863,
        Swim = 616011509,
        SwimIdle = 616012453,
        Climb = 616003713,
        Idle = {616006778,616008087,886862142}
    },
    ["Stylish"] = {
        Walk = 616146177,
        Run = 616140816,
        Jump = 616139451,
        Fall = 616134815,
        Swim = 616143378,
        SwimIdle = 616144772,
        Climb = 616133594,
        Idle = {616136790,616138447,886888594}
    },
    ["Bubbly"] = {
        Walk = 910034870,
        Run = 910025107,
        Jump = 910016857,
        Fall = 910001910,
        Swim = 910028158,
        SwimIdle = 910030921,
        Climb = 909997997,
        Idle = {910004836,910009958,1018536639}
    },
    ["Cartoon"] = {
        Walk = 742640026,
        Run = 742638842,
        Jump = 742637942,
        Fall = 742637151,
        Swim = 742639220,
        SwimIdle = 742639812,
        Climb = 742636889,
        Idle = {742637544,742638445,885477856}
    },
}
-- Funciones de animación
local function ensureAnim(folder,name)
    if not folder then return nil end
    local a = folder:FindFirstChild(name)
    if not a then
        a = Instance.new("Animation")
        a.Name = name
        a.Parent = folder
    end
    return a
end

local function setAnim(animObj, id)
    if animObj and id then
        animObj.AnimationId = "rbxassetid://"..tostring(id)
    end
end

local function stopAllTracks(hum)
    if not hum then return end
    for _, t in ipairs(hum:GetPlayingAnimationTracks()) do
        pcall(function() t:Stop(0) end)
    end
end

local function applyConfigAnims(char)
    local hum = char:FindFirstChildOfClass("Humanoid")
    local animate = char:FindFirstChild("Animate")
    if not hum or not animate then return end
    stopAllTracks(hum)

    local walkObj = ensureAnim(animate:FindFirstChild("walk"), "WalkAnim")
    local runObj = ensureAnim(animate:FindFirstChild("run"), "RunAnim")
    local jumpObj = ensureAnim(animate:FindFirstChild("jump"), "JumpAnim")
    local fallObj = ensureAnim(animate:FindFirstChild("fall"), "FallAnim")
    local climbObj = ensureAnim(animate:FindFirstChild("climb"), "ClimbAnim")
    local swimObj = ensureAnim(animate:FindFirstChild("swim"), "Swim")
    local swimIdleObj = ensureAnim(animate:FindFirstChild("swimidle"), "SwimIdle")
    local idleFolder = animate:FindFirstChild("idle")
    if idleFolder then
        ensureAnim(idleFolder,"Animation1")
        ensureAnim(idleFolder,"Animation2")
    end

    for animName, packName in pairs(config or {}) do
        local pack = PACKS[packName]
        if not pack then continue end
        if animName == "Walk" then setAnim(walkObj, pack.WalkAnim) end
        if animName == "Run" then setAnim(runObj, pack.RunAnim) end
        if animName == "Jump" then setAnim(jumpObj, pack.JumpAnim) end
        if animName == "Fall" then setAnim(fallObj, pack.FallAnim) end
        if animName == "Climb" then setAnim(climbObj, pack.ClimbAnim) end
        if animName == "Swim" then setAnim(swimObj, pack.Swim) end
        if animName == "SwimIdle" then setAnim(swimIdleObj, pack.SwimIdle) end
        if animName == "Animation1" then setAnim(idleFolder:FindFirstChild("Animation1"), pack.Animation1) end
        if animName == "Animation2" then setAnim(idleFolder:FindFirstChild("Animation2"), pack.Animation2) end
    end

    animate.Disabled = true
    task.wait(0.05)
    animate.Disabled = false
end

-- Aplicar al morir/reaparecer
player.CharacterAdded:Connect(function(char)
    task.wait(0.6)
    applyConfigAnims(char)
end)

-- Aplicar inmediatamente si ya hay personaje
if player.Character then
    applyConfigAnims(player.Character)
end
