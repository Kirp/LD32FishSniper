package entities;

import openfl.display.Sprite;
import openfl.events.TimerEvent;
import openfl.utils.Timer;

/**
 * ...
 * @author ...
 */
class FishBobber extends Sprite
{

	var myPortrait:Sprite;
	
	public var hasBite:Bool = false;
	var initialState:Bool = true;
	
	var animTimer:Timer;
	
	public var isEnabled:Bool = true;
	
	public function new(_x:Float, _y:Float) 
	{
		super();
		
		this.x = _x;
		this.y = _y;
	}
	
	public function StartUp()
	{
		
		myPortrait = new Sprite();
		myPortrait.graphics.beginFill(0xff0000);
		myPortrait.graphics.drawRect(0,0,5,5);
		myPortrait.graphics.endFill();
		addChild(myPortrait);
		
		
		animTimer = new Timer(1000);
		animTimer.addEventListener(TimerEvent.TIMER, onTick);
		animTimer.start();
	}
	
	private function onTick(e:TimerEvent):Void 
	{
		bob();
	}
	
	public function bob()
	{
		//if (hasBite == false)
		//{
			if (initialState)
			{
				myPortrait.graphics.clear();
				myPortrait.graphics.beginFill(0xff0000);
				myPortrait.graphics.drawRect(0,0,5,5);
				myPortrait.graphics.endFill();
				
				myPortrait.graphics.beginFill(0xffffff);
				myPortrait.graphics.drawRect( -5, -10, 15, 5);
				
				myPortrait.graphics.drawRect( -10, -5, 5, 15);
				
				myPortrait.graphics.drawRect( 10,-5, 5, 15);
				
				myPortrait.graphics.drawRect( -5, 10, 15, 5);
				myPortrait.graphics.endFill();
				initialState = false;
				
			}else
				{
					myPortrait.graphics.clear();
					myPortrait.graphics.beginFill(0xff0000);
					myPortrait.graphics.drawRect(0,0,5,5);
					myPortrait.graphics.endFill();
					
					myPortrait.graphics.beginFill(0xffffff);
					myPortrait.graphics.drawRect( 0, -15, 5, 5);
				
					myPortrait.graphics.drawRect( -15, 0, 5, 5);
				
					myPortrait.graphics.drawRect( 15, 0, 5, 5);
				
					myPortrait.graphics.drawRect( 0, 15, 5, 5);
					myPortrait.graphics.endFill();
					initialState = true;
				}
		//}else
			//{
				//if (initialState)
				//{
					//myPortrait.graphics.clear();
					//myPortrait.graphics.beginFill(0xfffffff);
					//
					//myPortrait.graphics.drawRect(0, -5, 5, 5);
					//
					//myPortrait.graphics.drawRect(5, 0, 5, 5);
					//
					//myPortrait.graphics.drawRect(0, 5, 5, 5);
					//
					//myPortrait.graphics.drawRect( -5, 0, 5, 5);
					//
					//myPortrait.graphics.endFill();
					//initialState = false;
					//
				//}else
					//{
						//myPortrait.graphics.clear();
						//myPortrait.graphics.beginFill(0xfffffff);
						//
						//myPortrait.graphics.drawRect(0, -10, 5, 5);
						//
						//myPortrait.graphics.drawRect(5,-5, 5, 5);
						//
						//myPortrait.graphics.drawRect(10,0, 5, 5);
						//
						//myPortrait.graphics.drawRect( 5, 5, 5, 5);
						//
						//myPortrait.graphics.drawRect( 0, 10, 5, 5);
						//
						//myPortrait.graphics.drawRect( -5, 5, 5, 5);
						//
						//myPortrait.graphics.drawRect( -10, 0, 5, 5);
						//
						//myPortrait.graphics.drawRect( -5, -5, 5, 5);
						//
						//myPortrait.graphics.endFill();
						//initialState = true;
					//}
			//}
	}
	
	public function disableBob()
	{
		myPortrait.visible = false;
		animTimer.stop();
		hasBite = false;
		initialState = true;
		isEnabled = false;
	}
	
	public function enableBob()
	{
		isEnabled = true;
		myPortrait.visible = true;
		animTimer.start();
		bob();
	}
	
}