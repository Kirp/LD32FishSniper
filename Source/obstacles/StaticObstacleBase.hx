package obstacles;
import openfl.display.Sprite;
import openfl.geom.Rectangle;
import utilities.ConstantHolder;

/**
 * ...
 * @author ...
 */
class StaticObstacleBase extends Sprite
{

	var myPortrait:Sprite;
	var myHitbox:Rectangle;

	public function new(_x:Float, _y:Float, _widthInBoxes:Float, _heightInBoxes:Float) 
	{
		super();
		
		this.x = _x;
		this.y = _y;
		
		myHitbox = new Rectangle(0,0,ConstantHolder.tileArea*_widthInBoxes,ConstantHolder.tileArea* _heightInBoxes);
	}
	
	public function StartUp()
	{
		
		myPortrait = new Sprite();
		myPortrait.graphics.beginFill(0xA52A2A);
		myPortrait.graphics.drawRect(0,0,myHitbox.width,myHitbox.height);
		myPortrait.graphics.endFill();
		addChild(myPortrait);
	}
	
	public function returnHitBox():Rectangle
	{
		return new Rectangle(this.x, this.y, myHitbox.width, myHitbox.height);
	}
}