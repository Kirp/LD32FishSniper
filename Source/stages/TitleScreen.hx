package stages;

import openfl.display.Sprite;
import usables.TextDisplay;
import utilities.ConstantHolder;

/**
 * ...
 * @author ...
 */

//placeholder
class TitleScreen extends Sprite
{
	

	var myPortrait:Sprite;
	

	public function new() 
	{
		super();
		
		
	}
	
	public function StartUp()
	{
		
		myPortrait = new Sprite();
		myPortrait.graphics.beginFill(0x303030);
		myPortrait.graphics.drawRect(0,0,ConstantHolder.appWidth,ConstantHolder.appHeight);
		myPortrait.graphics.endFill();
		addChild(myPortrait);
		
		var TitleText1:TextDisplay = new TextDisplay("THE  FISH  SNIPER  ", 200, 200, 50);
		addChild(TitleText1);
		//trace(TitleText1.width);
		
		var startPrompt:TextDisplay = new TextDisplay("press  Space  to  start", 260, 420, 25);
		addChild(startPrompt);
		
		var OwnerText:TextDisplay = new TextDisplay("LD32  Game  by Vrian Candelaria", 10, ConstantHolder.appHeight - 20, 15);
		addChild(OwnerText);
		
		
	}
	
}