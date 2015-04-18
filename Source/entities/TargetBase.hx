package entities;
import openfl.display.Sprite;
import openfl.geom.Rectangle;

/**
 * ...
 * @author ...
 */
class TargetBase extends Sprite
{

	var myPortrait:Sprite;
	var myHitbox:Rectangle;

	public function new(_x:Float, _y:Float) 
	{
		super();
		
		this.x = _x;
		this.y = _y;
		
		myHitbox = new Rectangle(0,0,25,25);
	}
	
	public function StartUp()
	{
		
		myPortrait = new Sprite();
		myPortrait.graphics.beginFill(0x00ff00);
		myPortrait.graphics.drawRect(0,0,25,25);
		myPortrait.graphics.endFill();
		addChild(myPortrait);
	}
	
	public function returnHitBox():Rectangle
	{
		return new Rectangle(this.x, this.y, myHitbox.width, myHitbox.height);
	}
	
}