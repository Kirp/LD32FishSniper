package gameScreens;

import camera.CameraBase;
import openfl.events.TimerEvent;
import openfl.utils.Timer;

import openfl.display.Sprite;
import openfl.events.Event;
import openfl.events.KeyboardEvent;
import openfl.geom.Point;
import openfl.ui.Keyboard;
import stages.PlayStageFishBase;
import uiComponents.TextChatter;
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
	
	var TimeDisplay:TextChatter;
	var CountDown:Timer;
	var countTime:Int = 200;
	
	var gameRunning:Bool = true;
	
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
		
		
		TimeDisplay = new TextChatter(10, 10);
		TimeDisplay.StartUp();
		TimeDisplay.sayText("yabadaba");
		addChild(TimeDisplay);
		
		CountDown = new Timer(1000);
		CountDown.addEventListener(TimerEvent.TIMER, onTick);
		CountDown.start();
		
	}
	
	private function onTick(e:TimerEvent):Void 
	{
		if (gameRunning)
		{
			TimeDisplay.sayText(Std.string(countTime));
			countTime--;
		}
	}
	
	private function onEnterFrame(e:Event):Void 
	{
		if (gameRunning)
		{
			//trace("step");
			fishStage.ControlMovement(joy1.getCurretDirection());
			fishStage.GameStep();
			var offsetToCamera = fishStage.camera.reportOffsetToMain();
			fishStage.x = offsetToCamera.x*-1;
		}
		
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
			if (fishStage.fishDown)
			{
				fishStage.shootFish();
			}
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