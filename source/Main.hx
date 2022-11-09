package;

import flixel.FlxGame;
import openfl.display.FPS;
import openfl.display.Sprite;

class Main extends Sprite
{
	#if !html5
	public var frameRate:Int = 120;
	#else
	public var frameRate:Int = 60;
	#end

	public function new()
	{
		super();
		addChild(new FPS(10, 10, 0xadffffff));
		addChild(new FlxGame(1280, 720, MainMenuState, 1.05, frameRate, frameRate, true, false));
		FlxG.autoPause = false;
	}
}
