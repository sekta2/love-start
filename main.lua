lstart = require("love-start")
utils = lstart.utils
draw = lstart.draw
phys = lstart.phys
objects = lstart.objects
window = lstart.window

--[[-----------------------------]]--

require("objects/player")
require("objects/enemy")
require("objects/bullet")

spawnEnemyCooldown = 0.5
spawnEnemyTime = spawnEnemyCooldown

enemyCount = 0

globalPlayerHealth = 100
globalPlayerPoints = 0

globalSpeedEnemy = 0
globalHealthEnemy = 0

globalEnemySpawned = 0

debug = false

function love.load()
    window.setMode(_, _, true)

    phys.createWorld(0, 0, true)
    phys.addCollisionClass("player")
    phys.addCollisionClass("bullet")
    phys.addCollisionClass("enemy")

    globalPlayer = objects.create("player")
    globalPlayer:setPosition(200, 200)
end

function love.update(dt)
    utils.update(dt)

    objects.update(dt)
    phys.update(dt)

    local w, _ = love.graphics.getDimensions()

    if utils.gameTime() >= spawnEnemyTime and enemyCount < 35 then
        spawnEnemyTime = utils.gameTime() + spawnEnemyCooldown

        local enemy = objects.create("enemy")
        local x = love.math.random(0, w)

        enemy:setPosition(x, -35)
    end

    if globalPlayerHealth <= 0 then
        love.event.quit()
    end
end

function love.keypressed(key, scancode)
    if scancode == "f1" then
        debug = not debug
    end
end

function love.draw()
    objects.draw()

    love.graphics.setColor(0, 1, 0)
    love.graphics.print("Health: " .. globalPlayerHealth, 50, 50)

    love.graphics.setColor(1, 0.5, 0)
    love.graphics.print("Points: " .. globalPlayerPoints, 50, 50 + 25)

    if debug then
        love.graphics.setColor(1, 0.5, 0)
        love.graphics.print("Spawned: " .. globalEnemySpawned, 50, 50 + 25 + 25)

        love.graphics.setColor(1, 0.5, 0)
        love.graphics.print("HealthAdditive: " .. globalHealthEnemy, 50, 50 + 25 + 25 + 25)

        love.graphics.setColor(1, 0.5, 0)
        love.graphics.print("SpeedAdditive: " .. globalSpeedEnemy, 50, 50 + 25 + 25 + 25 + 25)
    else
        love.graphics.setColor(1, 1, 1)
        love.graphics.print("Press F1 to open debug info", 50, 50 + 25 + 25)
    end
end