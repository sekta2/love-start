local lg = love.graphics

--[[-----------------------------]]--

return function(lstart)
    local cache = lstart.cache

    local draw = {}

    draw.currentImage = nil

    function draw.setColor(r, g, b, a)
        a = a or 255
        lg.setColor(r / 255, g / 255, b / 255, a / 255)
    end

    function draw.setImage(img)
        draw.currentImage = img
    end

    function draw.setFont(font)
        if type(font) == "table" then
            lg.setFont(font)
            return
        end

        lg.setFont(cache.listFont[font])
    end

    -- wrappers

    draw.line = lg.line

    -- func

    function draw.rect(x, y, w, h)
        lg.rectangle("fill", x, y, w, h)
    end

    function draw.rectOutline(x, y, w, h)
        lg.rectangle("line", x, y, w, h)
    end

    function draw.rectRounded(x, y, w, h, rx, ry)
        lg.rectangle("fill", x, y, w, h, rx, ry)
    end

    function draw.rectOutlineRounded(x, y, w, h, rx, ry)
        lg.rectangle("line", x, y, w, h, rx, ry)
    end

    function draw.circle(x, y, r)
        lg.circle("fill", x, y, r)
    end

    function draw.circleOutline(x, y, rh)
        lg.circle("line", x, y, r)
    end

    function draw.imageRect(x, y, w, h)
        if not draw.currentImage then draw.rect(x, y, w, h) return end
        local rw, rh = draw.currentImage:getDimensions()
        lg.draw(draw.currentImage, x, y, _, w / rw, h / rh)
    end

    -- alignx: 1 - 3, 1 - left, 2 - center, 3 - right
    -- aligny: 1 - 3, 1 - top, 2 - center, 3 - bottom
    function draw.text(text, font, x, y, xalign, yalign)
        xalign = xalign or 1
        yalign = yalign or 1

        if font then draw.setFont(font) end
        font = lg.getFont()

        local w, h = font:getWidth(text), font:getHeight(text)

        x = x - (xalign == 1 and 0 or xalign == 2 and w / 2 or w)
        y = y - (yalign == 1 and 0 or yalign == 2 and h / 2 or h)

        lg.printf(text, x, y, w)
    end

    return draw
end