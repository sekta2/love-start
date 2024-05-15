local sqrt = math.sqrt

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

    function utils.update(dt)
        utils.time = utils.time + dt
    end

    return utils
end