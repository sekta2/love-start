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

- `objects.register(obj:table, classname:string)`
- `objects._remove(uid:number)`
- `objects.remove(uid:number)`
- `objects.update(dt:number)`
- `objects.draw()`
- `(table) objects.object(base:string(can be nil to use standart base))`
- `(table) objects.create(classname:string)`

### Draw

- `draw.setColor(r:number, g:number, b:number, a:number)`
- `draw.setImage(img:image)`

### Phys

- `phys.createWorld(gravx:number, gravy:number, sleep:boolean)`
- `phys.addCollisionClass(name:string, ignore:table)`
- `phys.update(dt:number)`
- `phys.draw()`
- `(table) phys.getWorld()`
- `(table) phys.createCollider(ctype:string, ...:vararg)`

### Scenes

- `scenes.addScene(name:string, scene:table)`
- `scenes.setScene(name:string)`
- `scenes.enter()`
- `scenes.leave()`
- `scenes.update(dt:number)`
- `scenes.draw()`

### Utils

- `utils.update(dt:number)`
- `(any) utils.lerp(fraction:number, from:any, to:any)`
- `(number) utils.len(x:number, y:number)`
- `(number) (number) utils.normalize(x:number, y:number)`
- `(number) utils.gameTime()`

### Window

- `window.setMode(w:number, h:number, fullscreen:boolean, msaa:number, vsync:number)`