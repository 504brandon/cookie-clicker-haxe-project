package;

import flixel.FlxGame;
import openfl.display.FPS;
import openfl.display.Sprite;

class Main extends Sprite
{
	public function new()
	{
		super();
		addChild(new FPS(10, 10, 0xadffffff));
		addChild(new FlxGame(1280, 720, MainMenuState, 1.05, 1000, 1000, true, false));
	}
}
