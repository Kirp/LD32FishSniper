package uiComponents;

import usables.TextDisplay;
import openfl.display.Sprite;

/**
 * ...
 * @author ...
 */
class TextChatter extends Sprite
{
	var myText:TextDisplay;
	var myBG:Sprite;
	
	public function new(_x:Float, _y:Float) 
	{
		super();
		
		this.x = _x;
		this.y = _y;
		
	}
	
	public function StartUp()
	{
		
		myBG = new Sprite();
		myBG.graphics.beginFill(0x303030);
		myBG.graphics.drawRect(0, 0, 200, 25);
		myBG.graphics.endFill();
		addChild(myBG);
		
		myText = new TextDisplay("000 seconds left", 5, 0);
		myBG.addChild(myText);
	}
	
	public function sayText(toSay:String)
	{
		myText.say(toSay);
	}
	
}