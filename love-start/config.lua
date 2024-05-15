local lfs = love.filesystem

--[[-----------------------------]]--

return function(lstart)
    local json = lstart.json

    local config = {}

    config.list = {}
    config.callbacks = {}

    function config.addSetting(name, default)
        config.callbacks[name] = {}

        config.list[name] = {
            name = name,
            value = default,
            default = default
        }
    end

    function config.setSetting(name, value)
        local setting = config.list[name]
        if not setting then return end

        value = value ~= nil and value or setting.default
        config.list[name].value = value

        config.callback(name, value)
    end

    function config.getSetting(name)
        local setting = config.list[name]
        if not setting then return end

        return setting.value
    end

    function config.addCallback(settingname, func)
        table.insert(config.callbacks[settingname], 1, func)
    end

    function config.callback(settingname, newvalue)
        if #config.callbacks[settingname] <= 0 then return end
        for i = 1, #config.callbacks[settingname] do
            local callback = config.callbacks[settingname][i]

            callback(newvalue)
        end
    end

    function config.getExportSettings()
        local compact = {}

        for k, v in pairs(config.list) do
            compact[k] = v.value
        end

        return compact
    end

    function config.loadSettings()
        local file, _ = lfs.read("config.json")

        if file then
            local settings = json.decode(file)

            for k, v in pairs(settings) do
                if config.list[k] then
                    config.list[k].value = v
                else
                    config.addSetting(k, v)
                end
            end
        end
    end

    function config.saveSettings()
        local jsonText = json.encode(config.getExportSettings())

        lfs.write("config.json", jsonText)
    end

    return config
end -- PASS 2