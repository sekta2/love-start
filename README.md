  ![banner](https://github.com/sekta2/love-start/assets/47900900/782e7903-7d41-4392-aca9-cdcadb95a014)

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
- `draw.setImage(img:image)`

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

### Utils

Utilities, has useful features.

- `utils.update(dt:number)`
- `(any) utils.lerp(fraction:number, from:any, to:any)`
- `(number) utils.len(x:number, y:number)`
- `(number) (number) utils.normalize(x:number, y:number)`
- `(number) utils.gameTime()`
- `(number) utils.screenScale(mul:number)`
- `(number) utils.screenScaleH(mul:number)`

### Window

Component for working with a window.

- `window.setMode(w:number, h:number, fullscreen:boolean, msaa:number, vsync:number)`
- `window.toCenter()`
- `(number) window.getDesktopWidth()`
- `(number) window.getDesktopHeight()`
- `(number) window.screenScale(mul:number)`
- `(number) window.screenScaleH(mul:number)`