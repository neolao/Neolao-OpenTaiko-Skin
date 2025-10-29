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

local bgWidth = 1920
local bgX = 0
local bgY = 0
local headerPath = "Header.png"

function clearIn(player)
end

function clearOut(player)
end

function init()
    func:AddGraph("Background.png")

    -- Default to en if an unsupported language is being used
    if lang == "ja" then
      headerPath = "Header_ja.png"
    elseif lang == "fr" then
      headerPath = "Header_fr.png"
    end
    func:AddGraph(headerPath)
end

function update()
    bgX = bgX - (bgWidth * deltaTime / 20.0)
    if bgX < -bgWidth then
        bgX = 0
    end
end

function draw()
    for i = 0, 3 do
        func:DrawGraph(bgX + i * bgWidth, bgY, "Background.png")
    end
    func:DrawGraph(0, 0, headerPath)
end
