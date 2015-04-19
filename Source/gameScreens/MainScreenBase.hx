package gameScreens;

import camera.CameraBase;
import openfl.events.TimerEvent;
import openfl.utils.Timer;
import stages.GameOverScreen;
import stages.IntroScreen;
import stages.TitleScreen;

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
	
	var gameRunning:Bool = false;
	
	var titleScreen:TitleScreen;
	
	var intro:IntroScreen;
	var gameover:GameOverScreen;
	
	var gameState:Int = 0;
	
	public function new() 
	{
		super();
		
		addEventListener(Event.ADDED_TO_STAGE, onAdded);
	}
	
	private function onAdded(e:Event):Void 
	{
		removeEventListener(Event.ADDED_TO_STAGE, onAdded);
		
		//trace("GUI screen loaded");
		
		joy1 = new JoystickMock();
		
		//lets load up a bg
		myBG = new Sprite();
		myBG.graphics.beginFill(0x303030);
		myBG.graphics.drawRect(0, 0, ConstantHolder.appWidth, ConstantHolder.appHeight);
		myBG.graphics.endFill();
		
		addChild(myBG);
		
		stage.addEventListener(KeyboardEvent.KEY_DOWN, onKeyDown); 
		stage.addEventListener(KeyboardEvent.KEY_UP, onKeyUp);
		
		stage.addEventListener(Event.ENTER_FRAME, onEnterFrame);
		
		addChild(fishStage = new PlayStageFishBase());
		
		TimeDisplay = new TextChatter(10, 10);
		TimeDisplay.StartUp();
		TimeDisplay.sayText("Get Ready!");
		TimeDisplay.visible = true;
		addChild(TimeDisplay);
		
		CountDown = new Timer(1000);
		CountDown.addEventListener(TimerEvent.TIMER, onTick);
		
		titleScreen = new TitleScreen();
		titleScreen.StartUp();
		addChild(titleScreen);
		//titleScreen.visible = false;
		
		intro = new IntroScreen();
		intro.StartUp();
		addChild(intro);
		intro.visible = false;
		
		gameover = new GameOverScreen(true);
		gameover.StartUp();
		addChild(gameover);
		gameover.visible = false;
		
		gameState = 0;
	}
	
	private function onTick(e:TimerEvent):Void 
	{
		if (gameRunning)
		{
			if (countTime < 0)
			{
				//lets end the game and call it a game over
				//declare a game over here and stop the game
				
				//trace("game over");
				gameRunning = false;
				NextScreen();
				return;
			}
			
			if (fishStage.goalAchieved)
			{
				gameRunning = false;
				//trace("declare a win!");
				NextScreen();
				return;
			}
			
			if (fishStage.penalizeTime)
			{
				//countTime -= 20;
				
			}
			
			var sayThis:String = Std.string(countTime)+ "  till  escape";
			TimeDisplay.sayText(sayThis);
			countTime--;
		}
	}
	
	private function RunGame():Void
	{
		gameRunning = true;
		TimeDisplay.visible = true;
		fishStage.StartUp();
		CountDown.start();
	}
	
	private function ResetRunGame():Void
	{
		fishStage = new PlayStageFishBase();
		TimeDisplay.visible = true;
		fishStage.StartUp();
		CountDown.start();
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
		if (e.keyCode == Keyboard.W  || e.keyCode==Keyboard.UP)
		{
			//fishStage.ControlMovement(new Point(0, -1));
			joy1.ReleasedTrigger(new Point(0,-1));
		}
		
		if (e.keyCode == Keyboard.S  || e.keyCode==Keyboard.DOWN)
		{
			joy1.ReleasedTrigger(new Point(0,1));
		}
	}
	
	private function onKeyDown(e:KeyboardEvent):Void 
	{
		
		
		
		if (e.keyCode == Keyboard.SPACE)
		{
			//trace("fire");
			if (gameRunning)
			{
				if (fishStage.fishDown)
				{
					fishStage.shootFish();
				}
			}else
				if(gameState==2){
					gameRunning = true;
					
				}else
					{
						NextScreen();	
					}
		}
		
		if (e.keyCode == Keyboard.W  || e.keyCode==Keyboard.UP)
		{
			//fishStage.ControlMovement(new Point(0, -1));
			joy1.PressedTrigger(new Point(0,-1));
		}
		
		if (e.keyCode == Keyboard.S  || e.keyCode==Keyboard.DOWN)
		{
			joy1.PressedTrigger(new Point(0,1));
		}
		
	}
	
	private function NextScreen():Void
	{
		switch(gameState)
		{
			case 0:
				titleScreen.visible = false;
				intro.visible = true;
				gameState = 1;
				
			case 1:
				intro.visible = false;
				TimeDisplay.visible = true;
				RunGame();
				gameState = 2;
				countTime = 200;
				
			case 2:
				fishStage.visible = false;
				TimeDisplay.visible = false;
				gameover.visible = true;
				gameover.winGame(fishStage.goalAchieved);
				CountDown.stop();
				gameState = 3;
				
			case 3:
				
				//gameover.visible = false;
				//
				//ResetRunGame();
				//gameState = 2;
				//countTime = 200;
				
			default:
				titleScreen.visible = false;
				intro.visible = true;
				gameState = 1;
		}
	}
	
}