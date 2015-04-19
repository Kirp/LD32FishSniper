package stages;

import openfl.display.Sprite;
import usables.TextDisplay;
import utilities.ConstantHolder;

/**
 * ...
 * @author ...
 */

 //placeholder
class GameOverScreen extends Sprite
{

	var myPortrait:Sprite;
	
	var didWin:Bool;
	var TitleText1:TextDisplay;

	public function new(_win:Bool = false) 
	{
		super();
		
		didWin = _win;
	}
	
	public function StartUp()
	{
		
		myPortrait = new Sprite();
		myPortrait.graphics.beginFill(0x303030);
		myPortrait.graphics.drawRect(0,0,ConstantHolder.appWidth,ConstantHolder.appHeight);
		myPortrait.graphics.endFill();
		addChild(myPortrait);
		
		
		TitleText1 = new TextDisplay("Game  Over", 280, 200, 50);
		addChild(TitleText1);
		
		var TitleText1:TextDisplay = new TextDisplay("Thanks  For  Playing!", 280, 270, 25);
		addChild(TitleText1);
		
			
		var OwnerText:TextDisplay = new TextDisplay("press  SPACEBAR  to  restart", 10, ConstantHolder.appHeight - 20, 20);
		addChild(OwnerText);
		
	}
	
	public function winGame(didWin:Bool)
	{
		if (didWin) TitleText1.say("YOU  WIN!");
		else
			{
				TitleText1.say("YOU  LOST!");
			}
	}
	
}