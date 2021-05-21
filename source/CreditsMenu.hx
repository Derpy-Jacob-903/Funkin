package;

import Controls.KeyboardScheme;
import flixel.FlxG;
import flixel.FlxObject;
import flixel.FlxSprite;
import flixel.group.FlxGroup.FlxTypedGroup;
import flixel.group.FlxGroup;
import flixel.effects.FlxFlicker;
import flixel.graphics.frames.FlxAtlasFrames;
import flixel.group.FlxGroup.FlxTypedGroup;
import flixel.text.FlxText;
import flixel.math.FlxMath;
import flixel.tweens.FlxEase;
import flixel.tweens.FlxTween;
import flixel.util.FlxColor;
import io.newgrounds.NG;
import flixel.util.FlxTimer;
import lime.app.Application;
import flixel.group.FlxGroup.FlxTypedGroup;
import flixel.group.FlxGroup;

#if windows
import Discord.DiscordClient;
#end

using StringTools;

class CreditsMenu extends MusicBeatState
{
	var curSelected:Int = 1;

	var menuItems:FlxTypedGroup<FlxSprite>;
	var crediticons:FlxTypedGroup<FlxSprite>;
	var fixdiff:FlxTypedGroup<FlxSprite>;

	#if !switch
	var optionShit:Array<String> = ['duster', 'shady', 'jorge'];
	#else
	var optionShit:Array<String> = ['shady'];
	#end

	#if !switch
	var creditshit:Array<String> = ['icond', 'icons', 'iconj'];
	#else
	var creditshit:Array<String> = ['icons'];
	#end

	var newGaming:FlxText;
	var newGaming2:FlxText;
	var newInput:Bool = true;

	var magenta:FlxSprite;
	var camFollow:FlxObject;



	var grpLocks:FlxTypedGroup<FlxSprite>;
	var difficultySelectors:FlxGroup;
	var sprDifficulty:FlxSprite;
	var leftArrow:FlxSprite;
	var rightArrow:FlxSprite;

	override function create()
	{
		#if windows
		// Updating Discord Rich Presence
		DiscordClient.changePresence("in the Credits!", null);
		#end

		if (!FlxG.sound.music.playing)
		{
			FlxG.sound.playMusic(Paths.music('freakyMenu'));
		}

		persistentUpdate = persistentDraw = true;

		var bg:FlxSprite = new FlxSprite(-80).loadGraphic(Paths.image('menuBG'));
		bg.scrollFactor.x = 0.10;
		bg.scrollFactor.y = 0;
		bg.setGraphicSize(Std.int(bg.width * 1.1));
		bg.updateHitbox();
		bg.screenCenter();
		bg.antialiasing = true;
		add(bg);

		

		camFollow = new FlxObject(0, 0, 1, 1);
		add(camFollow);

		magenta = new FlxSprite(-80).loadGraphic(Paths.image('menuDesat'));
		magenta.scrollFactor.x = 0;
		magenta.scrollFactor.y = 0.10;
		magenta.setGraphicSize(Std.int(magenta.width * 1.1));
		magenta.updateHitbox();
		magenta.screenCenter();
		magenta.visible = false;
		magenta.antialiasing = true;
		magenta.color = 0xFFfd719b;
		add(magenta);


		menuItems = new FlxTypedGroup<FlxSprite>();
		add(menuItems);

		var tex = Paths.getSparrowAtlas('credits_assets');

		for (i in 0...optionShit.length)
		{
			var menuItem:FlxSprite = new FlxSprite(20  + (i * 480), 520);
			menuItem.frames = tex;
			menuItem.animation.addByPrefix('idle', optionShit[i] + " basic", 24);
			menuItem.animation.addByPrefix('selected', optionShit[i] + " White", 24);
			menuItem.animation.play('idle');
			menuItem.ID = i;
			//menuItem.screenCenter(X);
			menuItems.add(menuItem);
			menuItem.scrollFactor.set();
			menuItem.antialiasing = true;
		}


		crediticons = new FlxTypedGroup<FlxSprite>();
		add(crediticons);

		var tex = Paths.getSparrowAtlas('credits_icons');

		for (i in 0...creditshit.length)
		{
			var crediticon:FlxSprite = new FlxSprite(20  + (i * 480), 420);
			crediticon.frames = tex;
			crediticon.animation.addByPrefix('idle', creditshit[i] + " basic", 24);
			crediticon.animation.addByPrefix('selected', creditshit[i] + " white", 24);
			crediticon.animation.play('idle');
			crediticon.ID = i;
			crediticons.add(crediticon);
			crediticon.scrollFactor.set();
			crediticon.antialiasing = true;
		}
		

		FlxG.camera.follow(camFollow, null, 0.60 * (60 / FlxG.save.data.fpsCap));


		// NG.core.calls.event.logEvent('swag').send();


		if (FlxG.save.data.dfjk)
			controls.setKeyboardScheme(KeyboardScheme.Solo, true);
		else
			controls.setKeyboardScheme(KeyboardScheme.Duo(true), true);

		changeItem();

		super.create();
	}

	var selectedSomethin:Bool = false;




	override function update(elapsed:Float)
	{

		
		
		if (FlxG.sound.music.volume < 0.8)
		{
			FlxG.sound.music.volume += 0.5 * FlxG.elapsed;
		}

		if (!selectedSomethin)
		{
			if (controls.LEFT_P)
			{
				FlxG.sound.play(Paths.sound('scrollMenu'));
				changeItem(-1);
			}

			if (controls.RIGHT_P)
			{
				FlxG.sound.play(Paths.sound('scrollMenu'));
				changeItem(1);
			}

			if (controls.BACK)
			{
				FlxG.switchState(new MainMenuState());
			}

			if (controls.ACCEPT)
			{
				if (optionShit[curSelected] == 'duster')
				{
					#if linux
					Sys.command('/usr/bin/xdg-open', ["https://twitter.com/SirDusterBuster", "&"]);
					#else
					FlxG.openURL('https://twitter.com/SirDusterBuster');
					#end
				}
				else
				{
					if (optionShit[curSelected] == 'shady')
					{
						#if linux
						Sys.command('/usr/bin/xdg-open', ["https://www.youtube.com/channel/UC-90KuSWRVLImW4xHWFYMnQ", "&"]);
						#else
						FlxG.openURL('https://www.youtube.com/channel/UC-90KuSWRVLImW4xHWFYMnQ');
						#end
				}
				else
				{
					if (optionShit[curSelected] == 'jorge' && FlxG.keys.pressed.DOWN)
					{
						#if linux
						Sys.command('/usr/bin/xdg-open', ["https://www.youtube.com/watch?v=0MW9Nrg_kZU", "&"]);
						#else
						FlxG.openURL('https://www.youtube.com/watch?v=0MW9Nrg_kZU');
						#end
				}
				else
				{
						if (optionShit[curSelected] == 'jorge')
						{
							#if linux
							Sys.command('/usr/bin/xdg-open', ["https://twitter.com/Jorge_SunSpirit", "&"]);
							#else
							FlxG.openURL('https://twitter.com/Jorge_SunSpirit');
							#end
						}
					}
				}
			}
		}
	}
		super.update(elapsed);

		menuItems.forEach(function(spr:FlxSprite)
		{
			//spr.screenCenter(X);
		});
	}


	function changeItem(huh:Int = 0)
		{
			curSelected += huh;

			if (curSelected >= 3)
				curSelected = 0;
			if (curSelected < 0)
				curSelected = 3 - 1;
				
			menuItems.forEach(function(spr:FlxSprite)
			{
				spr.animation.play('idle');

				if (spr.ID == curSelected)
				{
					spr.animation.play('selected');
					camFollow.setPosition(spr.getGraphicMidpoint().x, spr.getGraphicMidpoint().y);
				}

				spr.updateHitbox();
			});

			crediticons.forEach(function(spr:FlxSprite)
			{
				spr.animation.play('idle');

				if (spr.ID == curSelected)
				{
					spr.animation.play('selected');
					camFollow.setPosition(spr.getGraphicMidpoint().x, spr.getGraphicMidpoint().y);
				}

				spr.updateHitbox();
			});
		}
	}
