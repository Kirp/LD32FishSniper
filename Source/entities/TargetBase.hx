package entities;
import openfl.Assets;
import openfl.display.Bitmap;
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
	public var myType:Int;
	
	var myPix:Bitmap;

	public function new(_x:Float, _y:Float, _type:Int = 0) 
	{
		super();
		
		this.x = _x;
		this.y = _y;
		
		myHitbox = new Rectangle(0, 0, 25, 25);
		myType = _type;
	}
	
	public function StartUp()
	{
		
		myPortrait = new Sprite();
		//myPortrait.graphics.beginFill(0x00ff00);
		//myPortrait.graphics.drawRect(0,0,25,25);
		//myPortrait.graphics.endFill();
		addChild(myPortrait);
		
		myPix = getBitmapByType();
		myPix.x = -4;
		myPortrait.addChild(myPix);
		
	}
	
	function getBitmapByType():Bitmap
	{
		var outBit:Bitmap;
		switch(myType)
		{
			case 0:
			outBit = new Bitmap(Assets.getBitmapData ("assets/pictures/Abro.png"));
				
			case 1:
			outBit = new Bitmap(Assets.getBitmapData ("assets/pictures/Bbro.png"));
				
			case 2:
			outBit = new Bitmap(Assets.getBitmapData ("assets/pictures/Cbro.png"));
				
			case 3:
			outBit = new Bitmap(Assets.getBitmapData ("assets/pictures/Dbro.png"));
				
			default:
			outBit = new Bitmap(Assets.getBitmapData ("assets/pictures/Abro.png"));
				
		}
		
		return outBit;
	}
	
	public function returnHitBox():Rectangle
	{
		return new Rectangle(this.x, this.y, myHitbox.width, myHitbox.height);
	}
	
}