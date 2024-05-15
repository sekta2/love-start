  ![banner](https://github.com/sekta2/love-start/assets/47900900/782e7903-7d41-4392-aca9-cdcadb95a014)

# love-start
A multi-functional template for your Love2D game

I plan to use this template(although it looks like a library) in my projects.

## Functions

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

### Utils

- `utils.update(dt:number)`
- `(any) utils.lerp(fraction:number, from:any, to:any)`
- `(number) utils.len(x:number, y:number)`
- `(number) (number) utils.normalize(x:number, y:number)`
- `(number) utils.gameTime()`

### Window

- `window.setMode(w:number, h:number, fullscreen:boolean, msaa:number, vsync:number)`