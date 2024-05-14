return function(lstart, objects)
    local BASE = lstart.middleclass("entity-base")

    BASE.x = 0
    BASE.y = 0

    function BASE:setPosition(x, y)
        self.x = x
        self.y = y
    end

    function BASE:getPosition()
        return self.x, self.y
    end

    function BASE:setX(x) self.x = x end
    function BASE:setY(y) self.y = y end

    function BASE:getX() return self.x end
    function BASE:getY() return self.y end

    function BASE:remove()
        objects._remove(self.uid)
    end

    function BASE:initialize()
    end

    function BASE:update(dt)
    end

    function BASE:draw()
    end

    return BASE
end