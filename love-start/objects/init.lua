local PATH = ... .. "/"

--[[----------------------]]--

local middleclass = require(PATH .. "middleclass")

local objects = {}

objects.uid = 0
objects.list = {}
objects.registered = {}

--[[----------------------]]--

objects.base = middleclass("entity-base")

function objects.base:remove()
    objects._remove(self.uid)
end

function objects.base:initialize()
end

function objects.base:update(dt)
end

function objects.base:draw()
end

--[[----------------------]]--

function objects.object(base)
    base = base or objects.base

    local obj = middleclass("entity", objects.base)
    obj.base = base

    return obj
end

function objects.register(object, class)
    local oldinit = object.initialize
    local baseinit = object.base.initialize
    function object:initialize()
        baseinit(self)
        oldinit(self)
    end

    objects.registered[class] = object
end

function objects._remove(uid)
    objects.list[uid] = nil
end

function objects.remove(uid)
    local obj = objects.list[uid]
    if not obj then return end

    obj:remove()
end

function objects.create(class)
    objects.uid = objects.uid + 1

    local obj = objects.registered[class]:new()
    obj.uid = objects.uid

    objects.list[obj.uid] = obj

    return obj
end

return objects