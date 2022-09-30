package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.FlxState;
import flixel.FlxSubState;
import flixel.text.FlxText;
import flixel.util.FlxColor;
import lime.app.Application;
import lime.utils.Assets;
#if desktop
import Discord.DiscordClient;
#end

class MainOptionsState extends FlxState
{
	static public var clicksoundenable:Int = 1;
	static public var clickanimenable:Int = 1;

	var clicksound:FlxText = null;
	var clickanim:FlxText = null;

	override public function create()
	{
		#if desktop
		DiscordClient.changePresence("Cookie Clicker", "In The Menu", null, true);
		#end

		super.create();
		var bg:FlxSprite = new FlxSprite(0, 0).loadGraphic("assets/images/menu images/menubg.png");
		bg.antialiasing = true;
		bg.screenCenter(X);
		bg.scale.set(1.3, 2);
		bg.y = 321.87;
		add(bg);

		clicksound = new FlxText(810.2, 320, 0, "n/a", 30);
		clicksound.pixelPerfectPosition = true;
		clicksound.borderColor = FlxColor.BLACK;
		clicksound.borderSize = 3;
		clicksound.borderStyle = OUTLINE;
		add(clicksound);

		clickanim = new FlxText(810.2, 521.2, 0, "n/a", 30);
		clickanim.pixelPerfectPosition = true;
		clickanim.borderColor = FlxColor.BLACK;
		clickanim.borderSize = 3;
		clickanim.borderStyle = OUTLINE;
		add(clickanim);
	}

	override public function update(elapsed:Float)
	{
		if (clicksoundenable == 1)
		{
			clicksound.text = "Clicking Sounds: true";
		}
		if (clicksoundenable == 0)
		{
			clicksound.text = "Clicking Sounds: false";
		}
		if (clickanimenable == 1)
		{
			clickanim.text = "Clicking Animation: true";
		}
		if (clickanimenable == 0)
		{
			clickanim.text = "Clicking Animation: false";
		}
		if (clicksoundenable > 1)
		{
			clicksoundenable = 1;
		}
		if (clicksoundenable < 0)
		{
			clicksoundenable = 0;
		}

		if (clickanimenable > 1)
		{
			clickanimenable = 1;
		}
		if (clickanimenable < 0)
		{
			clickanimenable = 0;
		}
		if (FlxG.mouse.overlaps(clicksound) && FlxG.keys.justPressed.ENTER)
		{
			clicksoundenable += 1;
		}
		if (FlxG.mouse.overlaps(clicksound) && FlxG.keys.justPressed.BACKSPACE)
		{
			clicksoundenable -= 1;
		}
		if (FlxG.mouse.overlaps(clickanim) && FlxG.keys.justPressed.ENTER)
		{
			clickanimenable += 1;
		}
		if (FlxG.mouse.overlaps(clickanim) && FlxG.keys.justPressed.BACKSPACE)
		{
			clickanimenable -= 1;
		}
		if (FlxG.keys.justPressed.ESCAPE)
		{
			FlxG.switchState(new MainMenuState());
		}
	}
}
