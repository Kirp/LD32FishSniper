package entities;
import openfl.Assets;
import openfl.display.Bitmap;
import openfl.display.Sprite;
import openfl.geom.Rectangle;

/**
 * ...
 * @author ...
 */
class SpentFishBase extends ThrownFishBase
{
	

	public function new(_x:Float, _y:Float, _angle:Float) 
	{
		super(_x, _y);
		currentAngleRadians = _angle;
	}
	
	override public function StartUp() 
	{
		myHitbox = new Rectangle(0,0,30,10);
		
		myPortrait = new Sprite();
		//myPortrait.graphics.beginFill(0x0000ff);
		//myPortrait.graphics.drawRect(-20,-5,30,10);
		//myPortrait.graphics.endFill();
		addChild(myPortrait);
		
		fish1 = new Bitmap(Assets.getBitmapData ("assets/pictures/deadFish.png"));
		
		
		myPix = fish1;
		myPix.x = -20;
		myPix.y = -5;
		myPortrait.addChild(myPix);
		
		
		myPortrait.rotation = currentAngleRadians * 180 / Math.PI;
	}
	
}