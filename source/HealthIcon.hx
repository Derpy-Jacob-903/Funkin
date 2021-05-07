package;

import flixel.FlxSprite;

class HealthIcon extends FlxSprite
{
	/**
	 * Used for FreeplayState! If you use it elsewhere, prob gonna annoying
	 */
	public var sprTracker:FlxSprite;

	public function new(char:String = 'bf', isPlayer:Bool = false)
	{
		super();
		loadGraphic(Paths.image('iconGrid'), true, 150, 150);

		antialiasing = true;
		animation.add('bf', [0, 0], 0, false, isPlayer);
		animation.add('bf-car', [0, 0], 0, false, isPlayer);
		animation.add('bf-christmas', [0, 0], 0, false, isPlayer);
		animation.add('bf-pixel', [0, 0], 0, false, isPlayer);
		animation.add('spooky', [2, 2], 0, false, isPlayer);
		animation.add('pico', [2, 2], 0, false, isPlayer);
		animation.add('mom', [1, 1], 0, false, isPlayer);
		animation.add('mom-car', [1, 1], 0, false, isPlayer);
		animation.add('tankman', [2, 2], 0, false, isPlayer);
		animation.add('face', [1, 4], 0, false, isPlayer);
		animation.add('dad', [1, 1], 0, false, isPlayer);
		animation.add('senpai', [1, 1], 0, false, isPlayer);
		animation.add('senpai-angry', [1, 1], 0, false, isPlayer);
		animation.add('spirit', [1, 1], 0, false, isPlayer);
		animation.add('bf-old', [0, 0], 0, false, isPlayer);
		animation.add('gf', [3], 0, false, isPlayer);
		animation.add('parents-christmas', [1], 0, false, isPlayer);
		animation.add('monster', [1, 1], 0, false, isPlayer);
		animation.add('monster-christmas', [1, 1], 0, false, isPlayer);
		animation.play(char);
		scrollFactor.set();
	}

	override function update(elapsed:Float)
	{
		super.update(elapsed);

		if (sprTracker != null)
			setPosition(sprTracker.x + sprTracker.width + 10, sprTracker.y - 30);
	}
}
