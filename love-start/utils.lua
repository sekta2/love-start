local lg = love.graphics
local sqrt = math.sqrt
local mmin = math.min
local mmax = math.max

--[[-----------------------------]]--

return function(lstart)
    local utils = {}

    utils.time = 0

    function utils.lerp(fraction, from, to)
        return from + (to - from) * fraction
    end

    function utils.len(x, y)
        local len = sqrt(x * x + y * y)
        return len
    end

    function utils.normalize(x, y)
        local len = sqrt(x * x + y * y)
        return x / len, y / len
    end

    function utils.gameTime()
        return utils.time
    end

    function utils.screenScale(mul)
        local orig = lg.getWidth()
        return (orig * 0.01) * mul
    end

    function utils.screenScaleH(mul)
        local orig = lg.getHeight()
        return (orig * 0.01) * mul
    end

    function utils.clamp(val, min, max)
        return mmin(max, mmax(val, min))
    end

    function utils.update(dt)
        utils.time = utils.time + dt
    end

    return utils
end