package entities;
import openfl.display.Sprite;

/**
 * ...
 * @author ...
 */
class PlayerBase extends Sprite
{
	var myPortrait:Sprite;

	public function new(_x:Float, _y:Float) 
	{
		super();
		
		this.x = _x;
		this.y = _y;
	}
	
	public function StartUp()
	{
		
		myPortrait = new Sprite();
		myPortrait.graphics.beginFill(0xff0000);
		myPortrait.graphics.drawRect(0,0,25,25);
		myPortrait.graphics.endFill();
		addChild(myPortrait);
	}
}