local lg = love.graphics

--[[-----------------------------]]--

return function(lstart)
    local draw = {}

    draw.currentImage = nil

    function draw.setColor(r, g, b, a)
        a = a or 255
        lg.setColor(r / 255, g / 255, b / 255, a / 255)
    end

    function draw.setImage(img)
        draw.currentImage = img
    end

    return draw
end