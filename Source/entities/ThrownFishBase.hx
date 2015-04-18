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
	
	public var velocity:Point;
	
	private var speed:Float;
	
	private var currentAngleRadians:Float = 0;
	
	private var turnSpeed:Float = 0.05; 
	
	public var isFlying:Bool = true;

	public function new(_x:Float, _y:Float) 
	{
		super();
		
		this.x = _x;
		this.y = _y;
		
		velocity = new Point(0, 0);
		speed = 5;
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
		//this.x += velocity.x;
		
		var movePoint:Point = new Point(speed * Math.cos(currentAngleRadians), speed * Math.sin(currentAngleRadians));
		this.x += movePoint.x;
		this.y += movePoint.y;
		
		velocity = movePoint;
		
		myPortrait.rotation = currentAngleRadians * 180/Math.PI;
	}
	
	private function ChangeAngleBy(toChange:Float)
	{
		//if (currentAngleRadians + toChange < 0)
		//{
			//currentAngleRadians = 300;
		//}else 
			//if (currentAngleRadians + toChange > 300)
			//{
				//currentAngleRadians = 0;
			//}else
				{
					currentAngleRadians += toChange;
				}
	}
	
	public function moveUp()
	{
		ChangeAngleBy(turnSpeed);
	}
	
	public function moveDown()
	{
		ChangeAngleBy(turnSpeed*-1);
	}
	
}