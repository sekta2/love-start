return function(lstart)
    local scenes = {}

    scenes.current = ""
    scenes.list = {}

    function scenes.addScene(name, scene)
        scenes.list[name] = scene

        scene:initialize()
    end

    function scenes.setScene(name)
        scenes.leave()

        scenes.current = name

        scenes.enter()
    end

    function scenes.enter()
        local scene = scenes.list[scenes.current]
        if not scene then return end
        scene:enter()
    end

    function scenes.leave()
        local scene = scenes.list[scenes.current]
        if not scene then return end
        scene:leave()
    end

    function scenes.update(dt)
        scenes.list[scenes.current]:update(dt)
    end

    function scenes.draw()
        scenes.list[scenes.current]:draw()
    end

    return scenes
end