local lg = love.graphics

--[[-----------------------------]]--

local enemy = objects.object()

function enemy:initialize()
    self:createCollider("circle", 0, 0, 15)

    self.collider:setCollisionClass("enemy")

    self.speed = love.math.random(75, 150) + globalSpeedEnemy
    self.redColor = love.math.random(200, 255)

    self.healthMax = 100 + globalHealthEnemy
    self.health = self.healthMax

    enemyCount = enemyCount + 1
    globalSpeedEnemy = globalSpeedEnemy + 0.2
    globalHealthEnemy = globalHealthEnemy + 0.5
    globalEnemySpawned = globalEnemySpawned + 1
end

function enemy:update(dt)
    local x, y = self:getPosition()

    if globalPlayer then
        local px, py = globalPlayer:getPosition()

        local vx, vy = utils.normalize(px - x, py - y)

        self.collider:setLinearVelocity(vx * self.speed, vy * self.speed)
    end

    if self.health <= 0 then
        self:remove()
        globalPlayerPoints = globalPlayerPoints + 1
    end
end

local rem = enemy.remove
function enemy:remove()
    enemyCount = enemyCount - 1
    rem(self)
end

function enemy:draw()
    local x, y = self:getPosition()

    draw.setColor(self.redColor, 0, 0)
    lg.circle("fill", x, y, 15)
    lg.setColor(1, 1, 1)
    lg.circle("line", x, y, 15)

    if self.health < self.healthMax then
        lg.setColor(0, 0.5, 0, 0.5)
        lg.rectangle("fill", x - 50, y - 50, 100, 10)

        lg.setColor(0, 1, 0, 0.5)
        lg.rectangle("fill", x - 50, y - 50, (self.health / self.healthMax) * 100, 10)
    end
end

objects.register(enemy, "enemy")