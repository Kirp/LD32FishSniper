package gameScreens;

import openfl.display.Sprite;
import openfl.events.Event;
import openfl.events.KeyboardEvent;
import openfl.ui.Keyboard;
import stages.PlayStageFishBase;

/**
 * ...
 * @author ...
 */
class MainScreenBase extends Sprite
{
	var myBG:Sprite;
	var fishStage:PlayStageFishBase;

	public function new() 
	{
		super();
		
		addEventListener(Event.ADDED_TO_STAGE, onAdded);
	}
	
	private function onAdded(e:Event):Void 
	{
		removeEventListener(Event.ADDED_TO_STAGE, onAdded);
		
		trace("GUI screen loaded");
		
		//lets load up a bg
		myBG = new Sprite();
		myBG.graphics.beginFill(0x303030);
		myBG.graphics.drawRect(0, 0, 800, 600);
		myBG.graphics.endFill();
		
		addChild(myBG);
		
		stage.addEventListener(KeyboardEvent.KEY_DOWN, onKeyDown); 
		stage.addEventListener(KeyboardEvent.KEY_UP, onKeyUp);
		
		
		
		
		addChild(fishStage = new PlayStageFishBase());
		fishStage.StartUp();
		
		
		stage.addEventListener(Event.ENTER_FRAME, onEnterFrame);
	}
	
	private function onEnterFrame(e:Event):Void 
	{
		//trace("step");
		fishStage.GameStep();
	}
	
	private function onKeyUp(e:KeyboardEvent):Void 
	{
		
	}
	
	private function onKeyDown(e:KeyboardEvent):Void 
	{
		if (e.keyCode == Keyboard.A)
		{
			fishStage.x -= 10;
		}
		
		if (e.keyCode == Keyboard.D)
		{
			fishStage.x += 10;
		}
		
		if (e.keyCode == Keyboard.SPACE)
		{
			trace("fire");
		}
	}
	
}