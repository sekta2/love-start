local lg = love.graphics
local lw = love.window

--[[----------------------]]--

local window = {}

function window.setMode(w, h, fullscreen, msaa, vsync)
    w = w or lg.getWidth()
    h = h or lg.getHeight()
    fullscreen = fullscreen or true
    msaa = msaa or 8
    vsync = vsync or 1

    lw.setMode(w, h, {
        fullscreen = fullscreen,
        msaa = msaa,
        vsync = vsync
    })
end

return window