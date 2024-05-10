local PATH = ... .. "/"

--[[----------------------]]--

local lstart = {}
lstart.__index = lstart

lstart.utils = require(PATH .. "utils")
lstart.lume = require(PATH .. "lume")
lstart.window = require(PATH .. "window")

return setmetatable({}, lstart)