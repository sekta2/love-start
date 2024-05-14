return function(lstart)
    local utils = {}

    function utils.lerp(fraction, from, to)
        return from + (to - from) * fraction
    end

    return utils
end