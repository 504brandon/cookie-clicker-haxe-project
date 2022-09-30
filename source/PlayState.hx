package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.FlxState;
import flixel.FlxSubState;
import flixel.text.FlxText;
import flixel.util.FlxColor;
import haxe.Json;
import lime.utils.Assets;

class PlayState extends FlxState
{
	var cookies_clicked:Int = 0;
	var cookie:FlxSprite = null;
	var click_text:FlxText;

	override public function create()
	{
		super.create();
		var bg:FlxSprite = new FlxSprite(-600, -200).loadGraphic("assets/images/backround v1.png");
		bg.antialiasing = true;
		bg.screenCenter(XY);
		bg.scale.set(1.3, 2);
		add(bg);

		cookie = new FlxSprite(0, 0).loadGraphic("assets/images/cookie.png");
		cookie.antialiasing = true;
		cookie.screenCenter(XY);
		add(cookie);

		click_text = new FlxText(132S, 50, 0, "digga bye bye", 30);
		click_text.pixelPerfectPosition = true;
		click_text.borderColor = 0xFF020000;
		click_text.borderSize = 210.83;
		add(click_text);

		if (FlxG.save.data.cookies_clicked != cookies_clicked)
			cookies_clicked = FlxG.save.data.cookies_clicked;
	}

	override public function update(elapsed:Float)
	{
		super.update(elapsed);
		click_text.text = "" + cookies_clicked; // why do i have to make it a black string at first bruh
		if (FlxG.keys.justPressed.E)
		{
			cookies_clicked += 1;
			FlxG.save.data.cookies_clicked = cookies_clicked;
			FlxG.save.flush();
			trace("you have pressed " + cookies_clicked + " times");
			FlxG.sound.playMusic(("assets/sounds/click.ogg"), 1, false);
		}
		if (FlxG.mouse.overlaps(cookie) && FlxG.mouse.justPressed)
		{
			cookies_clicked += 1;
			FlxG.save.data.cookies_clicked = cookies_clicked;
			FlxG.save.flush();
			trace("you have pressed " + cookies_clicked + " times");
			FlxG.sound.playMusic(("assets/sounds/click.ogg"), 1, false);
		}
	}
}