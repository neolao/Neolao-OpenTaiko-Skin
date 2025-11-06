--func:DrawText(x, y, text)
--func:DrawNum(x, y, num)
--func:AddGraph("filename")
--func:DrawGraph(x, y, filename)
--func:DrawRectGraph(x, y, rect_x, rect_y, rect_width, rect_height, filename)
--func:SetOpacity(opacity, "filename")
--func:SetScale(xscale, yscale, "filename")
--func:SetColor(r, g, b, "filename")
--func:SetRotation(angle, "filename")


local x = { 499, 499, 499, 499, 499 }
local y = { 0, 0, 0, 0, 0 }

local animeCounter = { 0, 0, 0, 0, 0 }
local speed = 1
local chara_states = { 0, 0, 0, 0, 0 }
local charaAnimeValue = { 0, 0, 0, 0, 0 }

local clear_text_offset_x = 373
local clear_text_offset_y = -3
local failed_effect_x = { 1019, 1399 }
local failed_effect_y = { 503, 503 }

local failedText1Path = "Failed_Text.png"
local failedText2Path = "Failed_Text_2.png"
local failedText3Path = "Failed_Text_3.png"

function clearIn(player)
end

function clearOut(player)
end

function playEndAnime(player)
    animeCounter = { 0, 0, 0, 0, 0 }
end

function init()

    chara_states = { 0, 0, 0, 0, 0 }
    charaAnimeValue = { 0, 0, 0, 0, 0 }

    if playerCount <= 2 then
        y = { 288, 552, 0, 0, 0 }
    elseif playerCount == 5 then
        y = { 58, 274, 490, 706, 922 }
    else
        y = { 69, 333, 597, 861, 0 }
    end

    if lang == "fr" then
      failedText1Path = "Failed_Text_fr.png"
      failedText2Path = "Failed_Text_2_fr.png"
      failedText3Path = "Failed_Text_3_fr.png"
    end

    func:AddGraph(failedText1Path)
    func:AddGraph(failedText2Path)
    func:AddGraph(failedText3Path)

    func:AddGraph("Failed_Effect.png")
    
end

function update(player)
    pos = player + 1

    animeCounter[pos] = animeCounter[pos] + (speed * deltaTime)
    animeValue = animeCounter[pos]
    
    if animeValue < 0.20 then
        chara_states[pos] = 0
        charaAnimeValue[pos] = (animeValue - 0) / (0.20 - 0)
    elseif animeValue < 0.26 then
        chara_states[pos] = 1
        --(0.66 - 0.20) use
        --(0.26 - 0.20) true
        charaAnimeValue[pos] = (animeValue - 0.20) / (0.66 - 0.20)
    elseif animeValue < 0.65 then
        chara_states[pos] = 2
        charaAnimeValue[pos] = (animeValue - 0.26) / (0.65 - 0.26)
    elseif animeValue < 0.73 then
        chara_states[pos] = 3
        charaAnimeValue[pos] = (animeValue - 0.65) / (0.73 - 0.65)
    elseif animeValue < 0.86 then
        chara_states[pos] = 4
        charaAnimeValue[pos] = (animeValue - 0.73) / (0.86 - 0.73)
    else
        chara_states[pos] = 5
        charaAnimeValue[pos] = 0
    end
end

function draw(player)
    pos = player + 1
    animeValue = animeCounter[pos]

    origin_x = x[pos]
    origin_y = y[pos]

    if animeValue < 0.31 then
    elseif animeValue < 2.28 then
        func:SetOpacity((animeValue - 0.31) * 255 * 4, failedText1Path)
        func:DrawGraph(origin_x + clear_text_offset_x, origin_y + clear_text_offset_y, failedText1Path)
    elseif animeValue < 2.31 then
        func:DrawGraph(origin_x + clear_text_offset_x, origin_y + clear_text_offset_y, failedText2Path)
    else
        func:DrawGraph(origin_x + clear_text_offset_x, origin_y + clear_text_offset_y, failedText3Path)
    end

    effectValue = (animeValue - 0.23) * 5
    if effectValue > 0 and effectValue < 1 then
        effectScale = 0.5 + (effectValue * 0.75)
        effectOpacity = math.sin(effectValue * math.pi) * 255
        func:SetScale(effectScale, effectScale, "Failed_Effect.png")
        func:SetOpacity(effectOpacity, "Failed_Effect.png")
        func:DrawGraphCenter(failed_effect_x[1], failed_effect_y[1], "Failed_Effect.png")
        func:DrawGraphCenter(failed_effect_x[2], failed_effect_y[2], "Failed_Effect.png")
    end
end
