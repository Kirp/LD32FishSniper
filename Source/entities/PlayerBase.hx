package entities;
import openfl.Assets;
import openfl.display.Bitmap;
import openfl.display.Sprite;

/**
 * ...
 * @author ...
 */
class PlayerBase extends Sprite
{
	var myPortrait:Sprite;
	var myPix:Bitmap;

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
		
		myPix = new Bitmap(Assets.getBitmapData ("assets/pictures/Abro.png"));
		myPix.x = -4;
		myPix.y = 0;
		myPortrait.addChild(myPix);
		
	}
}