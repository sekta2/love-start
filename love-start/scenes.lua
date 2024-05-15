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
        if not scenes.list[scenes.current] then return end
        scenes.list[scenes.current]:enter()
    end

    function scenes.leave()
        if not scenes.list[scenes.current] then return end
        scenes.list[scenes.current]:leave()
    end

    function scenes.update(dt)
        scenes.list[scenes.current]:update(dt)
    end

    function scenes.draw()
        scenes.list[scenes.current]:draw()
    end

    return scenes
end