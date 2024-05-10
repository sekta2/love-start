local PATH = ... .. "/"

--[[----------------------]]--

local lstart = {}
lstart.__index = lstart

lstart.utils = require(PATH .. "utils")
lstart.lume = require(PATH .. "lume")
lstart.cache = require(PATH .. "cache")
lstart.window = require(PATH .. "window")

return setmetatable({}, lstart)