![banner](https://github.com/sekta2/love-start/assets/47900900/d1602d0b-b066-4369-89a8-cc04b9258296)

# love-start
A multi-functional template for your Love2D game

I plan to use this template(although it looks like a library) in my projects.

## Usage(components)

To interact with library components you can do this: `lstart.window.setMode()`.

Or like this: 
```
window = lstart.window
window.setMode()
```

## Functions

### Objects

Object manager, design classes and create classes easily and simply! Also supports `windfield`.

- `objects.register(obj:table, classname:string)`
- `objects._remove(uid:number)`
- `objects.remove(uid:number)`
- `objects.update(dt:number)`
- `objects.draw()`
- `(table) objects.object(base:string(can be nil to use standart base))`
- `(table) objects.create(classname:string)`

### Cache

Allows you to cache fonts and images once, and through the function already use as many as you want.

- `cache.setImagePath(path:string)`
- `cache.setFontPath(path:string)`
- `cache.image(path:string)`
- `cache.font(path:string, name:string, size:number)`
- `(table) cache.getFont(name:string)`

### Config

This component is able to create settings for the game, load them and save them to `config.json`.

- `config.addSetting(name:string, default:any)`
- `config.setSetting(name:string, value:any)`
- `config.addCallback(settingname:string, func:function)`
- `config.callback(settingname:string, newvalue:any)`
- `config.loadSettings()`
- `config.saveSettings()`
- `(table) config.getExportSettings()`
- `(any) config.getSetting(name:string)`

### Draw

Allows you to use the standard 255 color pallete, draw images at the desired resolution, etc.

- `draw.setColor(r:number, g:number, b:number, a:number)`
- `draw.setImage(img:table)`
- `draw.rect(x:number, y:number, w:number, h:number)`
- `draw.rectOutline(x:number, y:number, w:number, h:number)`
- `draw.imageRect(x:number, y:number, w:number, h:number)`
- `draw.setFont(font:table or string)`
- `draw.rect(x:number, y:number, w:number, h:number)`
- `draw.rectOutline(x:number, y:number, w:number, h:number)`
- `draw.rectRounded(x:number, y:number, w:number, h:number, rx:number, ry:number)`
- `draw.rectOutlineRounded(x:number, y:number, w:number, h:number, rx:number, ry:number)`
- `draw.circle(x:number, y:number, r:number)`
- `draw.circleOutline(x:number, y:number, rh:number)`
- `draw.imageRect(x:number, y:number, w:number, h:number)`
- `draw.text(text:string, font:table or string or nil, x:number, y:number, xalign:number, yalign:number)`

### Phys

A simple windfield wrapper.

- `phys.createWorld(gravx:number, gravy:number, sleep:boolean)`
- `phys.addCollisionClass(name:string, ignore:table)`
- `phys.update(dt:number)`
- `phys.draw()`
- `(table) phys.getWorld()`
- `(table) phys.createCollider(ctype:string, ...:vararg)`

### Scenes

Scene Manager (or gamestates).

- `scenes.addScene(name:string, scene:table)`
- `scenes.setScene(name:string)`
- `scenes.enter()`
- `scenes.leave()`
- `scenes.update(dt:number)`
- `scenes.draw()`

### Tilemap

Simple STI wrapper.

- `tilemap.create(...:vararg)`
- `tilemap.draw()`
- `tilemap.drawLayer(layer:number)`
- `(table) tilemap.get()`

### Utils

Utilities, has useful features.

- `utils.update(dt:number)`
- `(any) utils.lerp(fraction:number, from:any, to:any)`
- `(number) utils.len(x:number, y:number)`
- `(number) (number) utils.normalize(x:number, y:number)`
- `(number) utils.gameTime()`
- `(number) utils.screenScale(mul:number)`
- `(number) utils.screenScaleH(mul:number)`
- `(number) utils.clamp(val:number, min:number, max:number)`

### Window

Component for working with a window.

- `window.setMode(w:number, h:number, fullscreen:boolean, msaa:number, vsync:number)`
- `window.toCenter()`
- `(number) window.getDesktopWidth()`
- `(number) window.getDesktopHeight()`
- `(number) window.screenScale(mul:number)`
- `(number) window.screenScaleH(mul:number)`

## Third-Party libraries

### [STI](https://github.com/karai17/Simple-Tiled-Implementation)
- Used for tilemap component
### [windfield](https://github.com/a327ex/windfield)
- Used for phys component
### [json.lua](https://github.com/rxi/json.lua)
- Used for config component
### [lume](https://github.com/rxi/lume)
- Just useful features for gamedev
### [middleclass](https://github.com/kikito/middleclass)
- Used for object manager
### [sock.lua](https://github.com/camchenry/sock.lua)
- Future multiplayer component