package entities;
import openfl.Assets;
import openfl.display.Bitmap;
import openfl.display.BitmapDataChannel;
import openfl.display.Sprite;
import openfl.events.TimerEvent;
import openfl.geom.Point;
import openfl.geom.Rectangle;
import openfl.utils.Timer;

/**
 * ...
 * @author ...
 */
class ThrownFishBase extends Sprite
{

	var myPortrait:Sprite;
	var myHitbox:Rectangle;
	
	var myPix:Bitmap;
	var fish1:Bitmap;
	var fish2:Bitmap;
	
	private var animTimer:Timer;
	
	public var velocity:Point;
	
	private var speed:Float;
	
	public var currentAngleRadians:Float = 0;
	
	private var turnSpeed:Float = 0.1; 
	
	public var isFlying:Bool = true;
	
	private var initialState:Bool = false;
	
	public var resetSpawnPosition:Point;
	
	public var isAtReset:Bool = false;

	public function new(_x:Float, _y:Float) 
	{
		super();
		
		this.x = _x;
		this.y = _y;
		
		velocity = new Point(0, 0);
		speed = 3;
		
		resetSpawnPosition = new Point(_x, _y);
	}
	
	public function StartUp()
	{
		myHitbox = new Rectangle(0,0,30,10);
		
		myPortrait = new Sprite();
		//myPortrait.graphics.beginFill(0x0000ff);
		//myPortrait.graphics.drawRect(-20,-5,30,10);
		//myPortrait.graphics.endFill();
		addChild(myPortrait);
		
		fish1 = new Bitmap(Assets.getBitmapData ("assets/pictures/fish1A.png"));
		fish2 = new Bitmap(Assets.getBitmapData ("assets/pictures/fish1B.png"));
		
		
		myPix = fish2;
		myPix.x = -20;
		myPix.y = -5;
		myPortrait.addChild(myPix);
		
		
		
		
		var hitVisual = new Sprite();
		hitVisual.graphics.beginFill(0xff0000,0.7);
		hitVisual.graphics.drawRect(0,0,2,2);
		hitVisual.graphics.endFill();
		addChild(hitVisual);
		
		//animTimer = new Timer(1000);
		//animTimer.addEventListener(TimerEvent.TIMER, onTick);
		//animTimer.start();
		
	}
	
	private function onTick(e:TimerEvent):Void 
	{
		swapPic();
	}
	
	public function resetMe():Void
	{
		currentAngleRadians = 0;
		isAtReset = false;
	}
	
	public function GameStep()
	{
		//trace("fish step");
		//this.x += velocity.x;
		
		var movePoint:Point = new Point(speed * Math.cos(currentAngleRadians), speed * Math.sin(currentAngleRadians));
		this.x += movePoint.x;
		this.y += movePoint.y;
		
		velocity = movePoint;
		
		myPortrait.rotation = currentAngleRadians * 180 / Math.PI;
		//myPix.rotation = currentAngleRadians * 180 / Math.PI;
		
		
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
	
	public function returnHitBox():Rectangle
	{
		return new Rectangle(this.x, this.y, myHitbox.width, myHitbox.height);
	}
	
	public function getCenter():Point
	{
		return new Point(this.x, this.y);
	}
	
	public function hideAway()
	{
		this.x = resetSpawnPosition.x;
		this.y = resetSpawnPosition.y;
		isAtReset = true;
	}
	
	public function swapPic():Void
	{
		if (initialState)
		{
			myPix = fish1;
			initialState = false;
		}else
			{
				myPix = fish2;
				initialState = true;
			}
	}
}