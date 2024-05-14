lstart = require("love-start")
objects = lstart.objects
window = lstart.window

function love.load()
    window.setMode()
end

function love.update(dt)
    objects.update(dt)
end

function love.draw()
    objects.draw()
end