package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.FlxState;
import flixel.FlxSubState;
import flixel.graphics.frames.FlxAtlasFrames;
import flixel.text.FlxText;
import flixel.tweens.FlxTween;
import flixel.util.FlxColor;
import haxe.Json;
import lime.app.Application;
import lime.utils.Assets;
#if desktop
import Discord.DiscordClient;
#end

class MainMenuState extends FlxState
{
	var PlayGameButton:FlxSprite = null;
	var OptionMenuButton:FlxSprite = null;

	override public function create()
	{
		#if desktop
		DiscordClient.changePresence("Cookie Clicker", "In The Menu", null, true);
		DiscordClient.initialize();

		Application.current.onExit.add(function(exitCode)
		{
			DiscordClient.shutdown();
		});
		#end

		super.create();
		var bg:FlxSprite = new FlxSprite(0, 0).loadGraphic("assets/images/menu images/menubg.png");
		bg.antialiasing = true;
		bg.screenCenter(X);
		bg.scale.set(1.3, 2);
		bg.y = 321.87;
		add(bg);

		PlayGameButton = new FlxSprite(0, 0).loadGraphic("assets/images/menu images/PlayGameButton.png");
		PlayGameButton.antialiasing = true;
		PlayGameButton.screenCenter(X);
		PlayGameButton.y = -243.9;
		PlayGameButton.scale.set(0.3, 0.3);
		add(PlayGameButton);

		OptionMenuButton = new FlxSprite(0, 0).loadGraphic("assets/images/menu images/OptionMenuButton.png");
		OptionMenuButton.antialiasing = true;
		OptionMenuButton.screenCenter(X);
		OptionMenuButton.y = 243.9;
		OptionMenuButton.scale.set(0.3, 0.3);
		add(OptionMenuButton);
	}

	override public function update(elapsed:Float)
	{
		if (FlxG.mouse.overlaps(PlayGameButton) && FlxG.mouse.justPressed)
		{
			trace("loaded playstate");
			FlxG.switchState(new PlayState());
		}

		if (FlxG.mouse.overlaps(OptionMenuButton) && FlxG.mouse.justPressed)
		{
			trace("loaded options");
			FlxG.switchState(new MainOptionsState());
		}
	}
}
