local PATH = ... .. "/"

--[[-----------------------------]]--

local lstart = {}
lstart.__index = lstart

lstart.sock = require(PATH .. "tp/sock")
lstart.middleclass = require(PATH .. "tp/middleclass")
lstart.lume = require(PATH .. "tp/lume")

lstart.utils = require(PATH .. "utils")(lstart)
lstart.cache = require(PATH .. "cache")(lstart)
lstart.draw = require(PATH .. "draw")(lstart)
lstart.objects = require(PATH .. "objects")(lstart)
lstart.window = require(PATH .. "window")(lstart)

return setmetatable({}, lstart)