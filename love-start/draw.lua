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

    function draw.rect(x, y, w, h)
        lg.rectangle("fill", x, y, w, h)
    end

    function draw.rectOutline(x, y, w, h)
        lg.rectangle("line", x, y, w, h)
    end

    function draw.imageRect(x, y, w, h)
        if not draw.currentImage then draw.rect(x, y, w, h) return end
        local rw, rh = draw.currentImage:getDimensions()
        lg.draw(draw.currentImage, x, y, _, w / rw, h / rh)
    end

    return draw
end