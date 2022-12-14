# Date-and-time
DateTime.hx that i made
![IMG_20220118_175153](https://user-images.githubusercontent.com/82664019/149922217-b94b0cc6-e3fa-4b36-85cf-80919e63a3d6.jpg)
# How to use
Go in Main.hx Find the line after this
```haxe
    addChild(new FlxGame(gameWidth, gameHeight, initialState, zoom, framerate, framerate, skipSplash, startFullscreen));
```
Add this code
```haxe
addChild(new DateTime(10, 16, All(true), Both, 0xFFFFFF);
```
