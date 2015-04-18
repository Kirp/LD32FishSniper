package entities;
import openfl.display.Sprite;
import openfl.geom.Point;

/**
 * ...
 * @author ...
 */
class ThrownFishBase extends Sprite
{

	var myPortrait:Sprite;
	
	private var velocity:Point;

	public function new(_x:Float, _y:Float) 
	{
		super();
		
		this.x = _x;
		this.y = _y;
		
		velocity = new Point(1,0);
	}
	
	public function StartUp()
	{
		
		myPortrait = new Sprite();
		myPortrait.graphics.beginFill(0x0000ff);
		myPortrait.graphics.drawRect(0,0,30,10);
		myPortrait.graphics.endFill();
		addChild(myPortrait);
	}
	
	public function GameStep()
	{
		//trace("fish step");
		this.x += velocity.x;
	}
	
}