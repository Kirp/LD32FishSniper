package gameScreens;

import camera.CameraBase;
import openfl.display.Sprite;
import openfl.events.Event;
import openfl.events.KeyboardEvent;
import openfl.geom.Point;
import openfl.ui.Keyboard;
import stages.PlayStageFishBase;
import usables.JoystickMock;
import utilities.ConstantHolder;

/**
 * ...
 * @author ...
 */
class MainScreenBase extends Sprite
{
	var myBG:Sprite;
	var fishStage:PlayStageFishBase;
	var camera:CameraBase;

	var joy1:JoystickMock;
	
	public function new() 
	{
		super();
		
		addEventListener(Event.ADDED_TO_STAGE, onAdded);
	}
	
	private function onAdded(e:Event):Void 
	{
		removeEventListener(Event.ADDED_TO_STAGE, onAdded);
		
		trace("GUI screen loaded");
		
		joy1 = new JoystickMock();
		
		//lets load up a bg
		myBG = new Sprite();
		myBG.graphics.beginFill(0x303030);
		myBG.graphics.drawRect(0, 0, ConstantHolder.appWidth, ConstantHolder.appHeight);
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
		fishStage.ControlMovement(joy1.getCurretDirection());
		fishStage.GameStep();
		var offsetToCamera = fishStage.camera.reportOffsetToMain();
		fishStage.x = offsetToCamera.x*-1;
		
		
	}
	
	private function onKeyUp(e:KeyboardEvent):Void 
	{
		if (e.keyCode == Keyboard.W)
		{
			//fishStage.ControlMovement(new Point(0, -1));
			joy1.ReleasedTrigger(new Point(0,-1));
		}
		
		if (e.keyCode == Keyboard.S)
		{
			joy1.ReleasedTrigger(new Point(0,1));
		}
	}
	
	private function onKeyDown(e:KeyboardEvent):Void 
	{
		if (e.keyCode == Keyboard.A)
		{
			//fishStage.x -= 10;
		}
		
		if (e.keyCode == Keyboard.D)
		{
			//fishStage.x += 10;
		}
		
		if (e.keyCode == Keyboard.SPACE)
		{
			trace("fire");
		}
		
		if (e.keyCode == Keyboard.W)
		{
			//fishStage.ControlMovement(new Point(0, -1));
			joy1.PressedTrigger(new Point(0,-1));
		}
		
		if (e.keyCode == Keyboard.S)
		{
			joy1.PressedTrigger(new Point(0,1));
		}
		
	}
	
}