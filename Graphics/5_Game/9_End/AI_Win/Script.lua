--func:DrawText(x, y, text)
--func:DrawNum(x, y, num)
--func:AddGraph("filename")
--func:DrawGraph(x, y, filename)
--func:DrawRectGraph(x, y, rect_x, rect_y, rect_width, rect_height, filename)
--func:DrawGraphCenter(x, y, filename)
--func:DrawGraphRectCenter(x, y, rect_x, rect_y, rect_width, rect_height, filename)
--func:SetOpacity(opacity, "filename")
--func:SetRotation(angle, "fileName")
--func:SetScale(xscale, yscale, "filename")
--func:SetColor(r, g, b, "filename")

local imagePath = "Base.png"

local animeCounter = 0

local x = 960
local y = 540

function clearIn(player)
end

function clearOut(player)
end

function playEndAnime(player)
    animeCounter = 0
end

function init()
    if lang == "fr" then
      imagePath = "Base_fr.png"
    end

    func:AddGraph(imagePath)
end

function update(player)
    animeCounter = animeCounter + (1.0 * deltaTime)
end

function draw(player)
    value = math.min(animeCounter * 3, 1)
    scale = 2 - value

    func:SetOpacity(value * 255, imagePath)
    func:SetScale(scale, scale, imagePath)

    func:DrawGraphCenter(x, y, imagePath)
end