local scancode = love.keyboard.isScancodeDown
local lm = love.mouse
local lg = love.graphics

--[[-----------------------------]]--

local player = objects.object()

function player:initialize()
    self:createCollider("circle", 0, 0, 15)
    self.collider:setType("static")

    self.collider:setCollisionClass("player")

    self.cooldownDmg = 1
    self.cooldownShoot = 0.3
end

function player:update(dt)
    local x, y = self:getPosition()

    if scancode("w", "s", "a", "d") then
        local ix = scancode("a") and -1 or scancode("d") and 1 or 0
        local iy = scancode("w") and -1 or scancode("s") and 1 or 0

        local nx, ny = utils.normalize(ix, iy)

        local vx, vy = nx * 200 * dt, ny * 200 * dt

        self:setPosition(x + vx, y + vy)
    end

    if lm.isDown(1) and utils.gameTime() >= self.cooldownShoot then
        self.cooldownShoot = utils.gameTime() + (debug and 0 or 0.3)

        local mx, my = lm.getPosition()
        local nx, ny = utils.normalize(mx - x, my - y)

        for i = 1, (debug and 2 or 1) do
            local bullet = objects.create("bullet")
        bullet:setPosition(x + (nx * 25), y + (ny * 25))
        bullet.collider:setLinearVelocity(nx * 350, ny * 350)
        end
    end

    if self.collider:enter("enemy") and utils.gameTime() >= self.cooldownDmg then
        self.cooldownDmg = utils.gameTime() + 1
        globalPlayerHealth = globalPlayerHealth - 10
    end
end

function player:draw()
    local x, y = self:getPosition()

    lg.setColor(1, 1, 0)
    lg.circle("fill", x, y, 15)
    lg.setColor(1, 1, 1)
    lg.circle("line", x, y, 15)
end

objects.register(player, "player")