return function(lstart, objects)
    local BASE = lstart.middleclass("entity-base")

    BASE.x = 0
    BASE.y = 0

    BASE.collider = nil

    function BASE:createCollider(ctype, ...)
        self.collider = lstart.phys.createCollider(ctype, ...)
        self.collider:setObject(self)
    end

    function BASE:setPosition(x, y)
        if self.collider then
            self.collider:setPosition(x, y)
            return
        end

        self.x = x
        self.y = y
    end

    function BASE:getPosition()
        if self.collider then
            return self.collider:getPosition()
        end

        return self.x, self.y
    end

    function BASE:setX(x) if self.collider then self.collider:setX(x) return end self.x = x end
    function BASE:setY(y) if self.collider then self.collider:setY(y) return end self.y = y end

    function BASE:getX() if self.collider then return self.collider:getX() end return self.x end
    function BASE:getY() if self.collider then return self.collider:getY() end return self.y end

    function BASE:remove()
        if self.collider then
            self.collider:destroy()
        end

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