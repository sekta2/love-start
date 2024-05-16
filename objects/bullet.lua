local lg = love.graphics

--[[-----------------------------]]--

local bullet = objects.object()

function bullet:initialize()
    self:createCollider("circle", 0, 0, 5)

    self.collider:setCollisionClass("bullet")
    self.lifeTime = utils.gameTime() + 5
end

function bullet:update(dt)
    if utils.gameTime() >= self.lifeTime then
        self:remove()
    end

    if self.collider:enter("enemy") then
        local enemy = self.collider:getEnterCollisionData("enemy").collider
        local obj = enemy:getObject()

        if obj then
            self:remove()
            obj.health = obj.health - 65
        end
    end
end

function bullet:draw()
    local x, y = self:getPosition()

    draw.setColor(255, 255, 0)
    lg.circle("fill", x, y, 5)
    lg.setColor(1, 1, 1)
    lg.circle("line", x, y, 5)
end

objects.register(bullet, "bullet")