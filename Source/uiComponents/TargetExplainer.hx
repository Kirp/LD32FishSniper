package uiComponents;
import entities.TargetBase;
import openfl.display.Sprite;
import usables.TextDisplay;


/**
 * ...
 * @author ...
 */
class TargetExplainer extends Sprite
{

	var myText:TextDisplay;
	var myBG:Sprite;
	var type:Int;
	
	public function new(_x:Float, _y:Float, _targetType:Int) 
	{
		super();
		
		this.x = _x;
		this.y = _y;
		
		type = _targetType;
		
	}
	
	public function StartUp()
	{
		
		myBG = new Sprite();
		myBG.graphics.beginFill(0x303030);
		myBG.graphics.drawRect(0, 0, 200, 100);
		myBG.graphics.endFill();
		addChild(myBG);
		
		myText = new TextDisplay("Your  Target  is:  ", 5, 0);
		myBG.addChild(myText);
		
		var dummyTarget:TargetBase = new TargetBase(75, 25, type);
		dummyTarget.StartUp();
		myBG.addChild(dummyTarget);
		
		var myText2 = new TextDisplay("Now Launch  with", 5, 47);
		myBG.addChild(myText2);
		
		var myText2 = new TextDisplay("SPACEBAR!", 5, 65);
		myBG.addChild(myText2);
	}
	
	public function sayText(toSay:String)
	{
		myText.say(toSay);
	}
	
}