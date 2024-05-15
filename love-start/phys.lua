return function(lstart)
    local wf = lstart.windfield

    local phys = {}

    function phys.createWorld(gravx, gravy, sleep)
        if phys.world then phys.world:destroy() end

        sleep = sleep or true
        phys.world = wf.newWorld(gravx, gravy, sleep)
    end

    function phys.getWorld()
        return phys.world
    end

    phys.colliders = {
        ["circle"] = function(...)
            return phys.world:newCircleCollider(...)
        end,

        ["rectangle"] = function(...)
            return phys.world:newRectangleCollider(...)
        end,

        ["bsg"] = function(...)
            return phys.world:newBSGRectangleCollider(...)
        end,

        ["polygon"] = function(...)
            return phys.world:newPolygonCollider(...)
        end,

        ["line"] = function(...)
            return phys.world:newLineCollider(...)
        end,

        ["chain"] = function(...)
            return phys.world:newChainCollider(...)
        end,
    }

    function phys.createCollider(ctype, ...)
        local fn = phys.colliders[ctype]
        if fn then return fn(...) end
    end

    function phys.addCollisionClass(name, ignore)
        phys.world:addCollisionClass(name, ignore)
    end

    function phys.update(dt)
        phys.world:update(dt)
    end

    function phys.draw()
        phys.world:draw()
    end

    return phys
end