local lg = love.graphics
local lw = love.window

--[[----------------------]]--

return function(lstart)
    local window = {}

    function window.setMode(w, h, fullscreen, msaa, vsync)
        w = w or lg.getWidth()
        h = h or lg.getHeight()
        fullscreen = fullscreen
        msaa = msaa or 8
        vsync = vsync or 1

        lw.setMode(w, h, {
            fullscreen = fullscreen,
            msaa = msaa,
            vsync = vsync
        })
    end

    function window.getDesktopWidth()
        local w, _ = lw.getDesktopDimensions()
        return w
    end

    function window.getDesktopHeight()
        local _, h = lw.getDesktopDimensions()
        return h
    end

    function window.screenScale(mul)
        local orig = window.getDesktopWidth()
        return (orig * 0.01) * mul
    end

    function window.screenScaleH(mul)
        local orig = window.getDesktopHeight()
        return (orig * 0.01) * mul
    end

    function window.toCenter()
        local w, h = lw.getDesktopDimensions()
        local ww, wh = lg.getDimensions()

        local x, y = (w / 2) - (ww / 2), (h / 2) - (wh / 2)

        lw.setPosition(x, y)
    end

    return window
end