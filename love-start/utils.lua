local utils = {}

function utils.lerp(fraction, from, to)
    return from + (to - from) * fraction
end

return utils