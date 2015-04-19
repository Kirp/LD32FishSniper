package camera;

import entities.ThrownFishBase;
import openfl.display.Sprite;
import openfl.geom.Point;
import openfl.geom.Rectangle;
import utilities.ConstantHolder;

/**
 * ...
 * @author ...
 */
class CameraBase extends Sprite
{
	var myPortrait:Sprite;
	
	var fishBulletToFollow:ThrownFishBase;
	
	var startFollowing:Bool = false;
	
	var myHitbox:Rectangle;

	public function new(_x:Float, _y:Float) 
	{
		super();
		
		this.x = _x;
		this.y = _y;
		
		myHitbox = new Rectangle(0,0,800,600);
	}
	
	public function StartUp()
	{
		
		myPortrait = new Sprite();
		myPortrait.graphics.beginFill(0x303030,0.5);
		myPortrait.graphics.drawRect(0,0,ConstantHolder.appWidth,ConstantHolder.appHeight);
		myPortrait.graphics.endFill();
		addChild(myPortrait);
	}
	
	public function returnHitBox():Rectangle
	{
		return new Rectangle(this.x, this.y, myHitbox.width, myHitbox.height);
	}
	
	public function setTarget(toTarget:ThrownFishBase)
	{
		fishBulletToFollow = toTarget;
		startFollowing = true;
	}
	
	public function resetPosition():Void
	{
		fishBulletToFollow = null;
		startFollowing = false;
		
		this.x = 0;
	}
	
	public function followTarget()
	{
		if (startFollowing == false || followTarget == null) return;
		
		if (fishBulletToFollow.x > this.x + (myHitbox.width / 2))
		{
			this.x += fishBulletToFollow.velocity.x;
		}
	}
	
	public function reportOffsetToMain():Point
	{
		return new Point(this.x,0);
	}
	
	
}