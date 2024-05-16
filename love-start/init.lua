local PATH = ... .. "/"

--[[-----------------------------]]--

local lstart = {}
lstart.__index = lstart

lstart.json = require(PATH .. "tp/json")
lstart.sti = require(PATH .. "tp/sti")
lstart.windfield = require(PATH .. "tp/windfield")
lstart.sock = require(PATH .. "tp/sock")
lstart.middleclass = require(PATH .. "tp/middleclass")
lstart.lume = require(PATH .. "tp/lume")

lstart.utils = require(PATH .. "utils")(lstart)
lstart.cache = require(PATH .. "cache")(lstart)
lstart.draw = require(PATH .. "draw")(lstart)
lstart.tilemap = require(PATH .. "tilemap")(lstart)
lstart.phys = require(PATH .. "phys")(lstart)
lstart.config = require(PATH .. "config")(lstart)
lstart.objects = require(PATH .. "objects")(lstart)
lstart.scenes = require(PATH .. "scenes")(lstart)
lstart.window = require(PATH .. "window")(lstart)

return setmetatable({}, lstart)