local lg = love.graphics

--[[-----------------------------]]--

return function(lstart)
    local cache = {}

    cache.imagePath = ""
    cache.fontPath = ""

    function cache.setImagePath(path) cache.imagePath = path end
    function cache.setFontPath(path) cache.fontPath = path end

    cache.listImages = {}
    cache.listFont = {}

    function cache.image(path)
        path = cache.imagePath .. path
        local img = cache.listImages[path]
        if img then return img end

        cache.listImages[path] = lg.newImage(path)
    end

    function cache.font(path, name, size)
        path = cache.fontPath .. path

        local font = lg.newFont(path, size)
        cache.listFont[name] = font
    end

    function cache.getFont(name)
        return cache.listFont[name]
    end

    return cache
end