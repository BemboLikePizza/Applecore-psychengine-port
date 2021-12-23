package;

import flixel.FlxSprite;

class Strum extends FlxSprite
{
	var trueCoords:Array<Float>;
	var size:Array<Float>;

	public var resetAnim:Float = 0;

	public function new(x, y)
	{
		super(x, y);
		resetTrueCoords();
	}

	public function resetTrueCoords():Void
	{
		trueCoords = [x, y];
		size = [width, height];
	}

	public function smartCenterOffsets():Void
	{
		return;
		centerOffsets();
		setPosition(trueCoords[0], trueCoords[1]);
		x -= width - size[0];
		y -= height - size[1];
	}

	override function update(t:Float)
	{
		if (resetAnim > 0)
		{
			resetAnim -= t;
			if (resetAnim <= 0)
			{
				animation.play('static');
				resetAnim = 0;
				centerOffsets();
			}
		}

		super.update(t);
		// if (PlayState.SONG.song.toLowerCase() == 'disability') centerOffsets();
	}
}
