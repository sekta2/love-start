return function(lstart)
    local sti = lstart.sti

    local tilemap = {}

    tilemap.map = nil

    function tilemap.create(...)
        tilemap.map = sti(...)
    end

    function tilemap.get()
        return tilemap.map
    end

    function tilemap.drawLayer(layer)
        tilemap.map.drawLayer(layer)
    end

    function tilemap.draw()
        tilemap.map:draw()
    end

    return tilemap
end