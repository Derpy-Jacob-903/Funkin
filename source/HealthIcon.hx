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
		animation.add('bf', [21, 21], 0, false, isPlayer);
		animation.add('bf-car', [21, 21], 0, false, isPlayer);
		animation.add('bf-christmas', [21, 21], 0, false, isPlayer);
		animation.add('bf-pixel', [21, 21], 0, false, isPlayer);
		animation.add('spooky', [21, 21], 0, false, isPlayer);
		animation.add('pico', [21, 21], 0, false, isPlayer);
		animation.add('mom', [22, 22], 0, false, isPlayer);
		animation.add('mom-car', [22, 22], 0, false, isPlayer);
		animation.add('tankman', [21, 21], 0, false, isPlayer);
		animation.add('face', [10, 11], 0, false, isPlayer);
		animation.add('dad', [22, 22], 0, false, isPlayer);
		animation.add('senpai', [22, 22], 0, false, isPlayer);
		animation.add('senpai-angry', [22, 22], 0, false, isPlayer);
		animation.add('spirit', [23, 23], 0, false, isPlayer);
		animation.add('bf-old', [14, 15], 0, false, isPlayer);
		animation.add('gf', [22], 0, false, isPlayer);
		animation.add('parents-christmas', [22], 0, false, isPlayer);
		animation.add('monster', [22, 22], 0, false, isPlayer);
		animation.add('monster-christmas', [22, 22], 0, false, isPlayer);
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
