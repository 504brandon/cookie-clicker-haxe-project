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

class PlayState extends FlxState
{
	var cookies_clicked:Int = 0;
	var cookie_level:Int = 0;
	var cookie:FlxSprite = null;
	var cookiem:FlxSprite = null;
	var click_text:FlxText;
	var ver_text:FlxText;

	override public function create()
	{
		#if desktop
		DiscordClient.changePresence("Cookie Clicker", "Playing The Game With " + cookies_clicked + " Cookies At Lvl " + cookie_level, null, true);
		#end
		super.create();
		var bg:FlxSprite = new FlxSprite(0, 0).loadGraphic("assets/images/backround v1.png");
		bg.antialiasing = true;
		bg.screenCenter(XY);
		bg.scale.set(1.3, 2);
		add(bg);

		var cookie_anim = FlxAtlasFrames.fromSparrow("assets/images/cookie.png", "assets/images/cookie.xml");

		cookie = new FlxSprite(0, 0);
		cookie.frames = cookie_anim;
		cookie.animation.addByPrefix('idle', 'cookie static');
		cookie.animation.addByPrefix('press', 'cookie press', 54, false);
		cookie.animation.play('idle');
		cookie.antialiasing = true;
		cookie.screenCenter(XY);
		cookie.pixelPerfectPosition = true;
		add(cookie);

		click_text = new FlxText(601.2, 50, 0, "digga bye bye", 30);
		click_text.pixelPerfectPosition = true;
		click_text.borderColor = FlxColor.BLACK;
		click_text.borderSize = 3;
		click_text.borderStyle = OUTLINE;
		add(click_text);

		ver_text = new FlxText(1032.65, 0, 0, Application.current.meta.get('version'), 30);
		add(ver_text);

		if (FlxG.save.data.cookies_clicked != cookies_clicked)
			cookies_clicked = FlxG.save.data.cookies_clicked;

		if (FlxG.save.data.cookie_level != cookie_level)
			cookie_level = FlxG.save.data.cookie_level;
	}

	override public function update(elapsed:Float)
	{
		super.update(elapsed);
		click_text.text = "" + cookies_clicked; // why do i have to make it a black string at first bruh
		if (cookie_level == 1)
		{
			cookie.kill();

			var cookie_anim_m = FlxAtlasFrames.fromSparrow("assets/images/m&m cookie.png", "assets/images/m&m cookie.xml");

			cookiem = new FlxSprite(0, 0);
			cookiem.frames = cookie_anim_m;
			cookiem.animation.addByPrefix('idle', 'cookie static');
			cookiem.animation.addByPrefix('press', 'cookie press', 54, false);
			cookiem.animation.play('idle');
			cookiem.antialiasing = true;
			cookiem.screenCenter(XY);
			cookiem.pixelPerfectPosition = true;
			add(cookiem);
		}
		if (FlxG.keys.justPressed.E)
		{
			cookies_clicked += 1;
			FlxG.save.data.cookies_clicked = cookies_clicked;
			FlxG.save.flush();
			trace("you have pressed " + cookies_clicked + " times");
			if (MainOptionsState.clicksoundenable == 1)
			{
				FlxG.sound.play(("assets/sounds/click.ogg"), 1, false);
			}
			if (MainOptionsState.clickanimenable == 1)
			{
				cookie.animation.play('press');
				cookiem.animation.play('press');
			}
		}
		if (FlxG.mouse.overlaps(cookie) && FlxG.mouse.justPressed)
		{
			cookies_clicked += 1;
			FlxG.save.data.cookies_clicked = cookies_clicked;
			FlxG.save.flush();
			trace("you have pressed " + cookies_clicked + " times");
			if (MainOptionsState.clicksoundenable == 1)
			{
				FlxG.sound.play(("assets/sounds/click.ogg"), 1, false);
			}
			if (MainOptionsState.clickanimenable == 1)
			{
				cookie.animation.play('press');
				cookiem.animation.play('press');
			}
			if (FlxG.keys.justPressed.L)
			{
				cookie_level += 1;
			}
		}
	}
}
