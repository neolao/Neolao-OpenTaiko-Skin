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

local loadingAnimeType = 0

local logoAngle = 0
local bgWidth = 1920
local bgX = 0
local bgY = 0

function clearIn(player)
end

function clearOut(player)
end

function init()
    func:AddGraph("Background.png")
    func:AddGraph("OpenTaiko.png")

    if loadingAnimeType == 0 then
        func:AddGraph("logo.png")
    elseif loadingAnimeType == 1 then
    end
end

function update()
    bgX = bgX - (bgWidth * deltaTime / 50.0)
    if bgX < -bgWidth then
        bgX = 0
    end

    if loadingAnimeType == 0 then
        logoAngle = logoAngle - (60 * deltaTime)
    elseif loadingAnimeType == 1 then
    end
end

function draw()
    for i = 0, 3 do
        func:DrawGraph(bgX + i * bgWidth, bgY, "Background.png")
    end

    func:DrawGraph(1080, 930, "OpenTaiko.png")

    if loadingAnimeType == 0 then
        func:SetRotation(logoAngle, "logo.png")
        func:DrawGraph(1720, 880, "logo.png")
    elseif loadingAnimeType == 1 then
    end
end
