local PATH = ... .. "/"

--[[-----------------------------]]--

return function(lstart)
    local objects = {}

    objects.uid = 0
    objects.list = {}
    objects.registered = {}

    objects.base = require(PATH .. "base")(lstart, objects)

    function objects.object(base)
        base = objects.registered[base] or objects.base

        local obj = lstart.middleclass("entity", base)
        obj.base = base

        return obj
    end

    function objects.register(obj, classname)
        local base = obj.base

        local oldinit = obj.initialize
        local baseinit = base.initialize

        function obj:initialize()
            baseinit(self)
            oldinit(self)
        end

        objects.registered[classname] = obj
    end

    function objects.create(classname)
        objects.uid = objects.uid + 1

        local obj = objects.registered[classname]:new()
        obj.uid = object.uid

        objects.list[objects.uid] = obj

        return obj
    end

    function objects._remove(uid)
        objects.list[uid] = nil
    end

    function objects.remove(uid)
        objects.list[uid]:remove()
    end

    function objects.update(dt)
        for k, v in ipairs(objects.list) do
            if v then v:update(dt) end
        end
    end

    function objects.draw()
        for k, v in ipairs(objects.list) do
            if v then v:draw() end
        end
    end

    return objects
end