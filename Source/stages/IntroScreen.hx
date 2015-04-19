package stages;

import openfl.display.Sprite;
import usables.TextDisplay;
import utilities.ConstantHolder;

/**
 * ...
 * @author ...
 */

//placeholder
class IntroScreen extends Sprite
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
		
		//var TitleText1:TextDisplay = new TextDisplay("THE  FISH  SNIPER  ", 200, 200, 50);
		//addChild(TitleText1);
		//trace(TitleText1.width);
		
		var text1:TextDisplay = new TextDisplay("You  are  the  fish  sniper", 100, 200, 25);
		addChild(text1);
		
		var text2:TextDisplay = new TextDisplay("Fishes  and  death  follow  in  your  wake", 100, 230, 25);
		addChild(text2);
		
		var text5:TextDisplay = new TextDisplay("Just  make  sure  its  the  right  one", 100, 260, 25);
		addChild(text5);
		
		
		var text6:TextDisplay = new TextDisplay("Directions:", 100,320, 25);
		addChild(text6);
		
		
		var text3:TextDisplay = new TextDisplay("Launch  Fishes  with  SPACEBAR", 100, 350, 25);
		addChild(text3);
		
		var text4:TextDisplay = new TextDisplay("Turn  them  with  W  and  S keys", 100, 380, 25);
		addChild(text4);
		
		var OwnerText:TextDisplay = new TextDisplay("press  SPACEBAR  to  continue", 10, ConstantHolder.appHeight - 20, 20);
		addChild(OwnerText);
		
	}
}