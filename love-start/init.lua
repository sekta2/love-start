local PATH = ... .. "/"

--[[----------------------]]--

local lstart = {}
lstart.__index = lstart

lstart.lume = require(PATH .. "lume")
lstart.utils = require(PATH .. "utils")
lstart.cache = require(PATH .. "cache")
lstart.draw = require(PATH .. "draw")
lstart.objects = require(PATH .. "objects")
lstart.window = require(PATH .. "window")

return setmetatable({}, lstart)