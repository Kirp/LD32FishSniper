package stages;

import camera.CameraBase;
import entities.FishBobber;
import entities.PlayerBase;
import entities.SpentFishBase;
import entities.TargetBase;
import entities.ThrownFishBase;
import openfl.events.TimerEvent;
import openfl.utils.Timer;
import sfxManager.SfxManager;
import uiComponents.TargetExplainer;

import obstacles.StaticObstacleBase;
import openfl.geom.Point;
import usables.Vtools;
import utilities.ConstantHolder;

import openfl.display.Sprite;
import openfl.geom.Rectangle;

/**
 * ...
 * @author ...
 */
class PlayStageFishBase extends Sprite
{
	private var tools:Vtools;
	
	private var stageBG:Sprite;

	private var tempStageRect:Rectangle;
	
	private var mapLengthMultiplier:Float = 3;
	
	private var player:PlayerBase; 
	private var target:TargetBase;
	
	private var targetA:TargetBase;
	private var targetB:TargetBase;
	private var targetC:TargetBase;
	private var targetD:TargetBase;
	
	private var targetList:Array<TargetBase>;
	
	private var currentTargetType:Int;
	
	private var bobBait:FishBobber;
	
	private var bulletFish:ThrownFishBase;
	
	public var camera:CameraBase;
	
	private var RunGameLoop:Bool = false;
	
	private var obstacleList:Array<StaticObstacleBase>;
	private var deadFishList:Array<SpentFishBase>;
	
	public var GameOver:Bool = false;
	
	public var fishDown:Bool = true;
	
	private var fishBiteRoller:Timer;
	
	private var animateControl:Timer;
	
	public var goalAchieved:Bool = false;
	public var penalizeTime:Bool = false;
	
	public var targetDisplayer:TargetExplainer;
	
	private var soundManager:SfxManager;
	
	public function new() 
	{
		super();
		
	}
	
	public function StartUp()
	{
		//init
		tools = new Vtools();
		obstacleList = [];
		targetList = [];
		deadFishList = [];
		
		soundManager = new SfxManager();
		
		tempStageRect = new Rectangle(0,0, ConstantHolder.appWidth*mapLengthMultiplier, ConstantHolder.appHeight);
		
		
		stageBG = new Sprite();
		stageBG.graphics.beginFill(0xffffff);
		stageBG.graphics.drawRect(tempStageRect.x, tempStageRect.y, tempStageRect.width, tempStageRect.height);
		stageBG.graphics.endFill();
		stageBG.graphics.beginFill(0x0011ff);
		stageBG.graphics.drawRect(tempStageRect.x, tempStageRect.y, 95, tempStageRect.height);
		stageBG.graphics.endFill();
		
		addChild(stageBG);
		
		
		//player = new PlayerBase(100, 300);
		//addChild(player);
		//player.StartUp();
		
		//target = new TargetBase(tempStageRect.width - 35, 300);
		//addChild(target);
		//target.StartUp();
		
		
		targetA = new TargetBase(tempStageRect.width - 35, 80,0);
		addChild(targetA);
		targetA.StartUp();
		targetList.push(targetA);
		
		targetB = new TargetBase(tempStageRect.width - 35, 200,1);
		addChild(targetB);
		targetB.StartUp();
		targetList.push(targetB);
		
		targetC = new TargetBase(tempStageRect.width - 35, 330,2);
		addChild(targetC);
		targetC.StartUp();
		targetList.push(targetC);
		
		targetD = new TargetBase(tempStageRect.width - 35, 450,3);
		addChild(targetD);
		targetD.StartUp();
		targetList.push(targetD);
		
		
		//lets get our random target color
		currentTargetType = getRandomTargetType();
		//trace("current target is type: "+currentTargetType);
		
		
		targetDisplayer = new TargetExplainer(100, 300, currentTargetType);
		targetDisplayer.StartUp();
		addChild(targetDisplayer);
		
		
		bobBait = new FishBobber(50,300);
		bobBait.StartUp();
		addChild(bobBait);
		
		bulletFish = new ThrownFishBase(-200, 300);
		addChild(bulletFish);
		bulletFish.StartUp();
		
		camera = new CameraBase(0, 0);
		camera.StartUp();
		addChild(camera);
		camera.setTarget(bulletFish);
		
		RunGameLoop = true;
		
		//AddObstacles();
		addObstaclesBySection();
		
		
		//fishbaittimer
		fishBiteRoller = new Timer(3000);
		fishBiteRoller.addEventListener(TimerEvent.TIMER, onBiteTick);
		fishBiteRoller.start();
	}
	
	private function onBiteTick(e:TimerEvent):Void 
	{
		bulletFish.swapPic();
		
		if (bobBait == null && bobBait.isEnabled==false) return;
		
		if (bobBait.hasBite == false)
		{
			if (isFishBiting()) bobBait.hasBite = true;
		}else
			{
				var roll = Math.random();
				if (roll > 0.75)
				{
					bobBait.hasBite = false;
				}
			}
		
	}
	
	private function getRandomTargetType():Int
	{
		var currentTargetType = Math.floor(Math.random() * 4);
		if (currentTargetType > 3) currentTargetType = 3;
		
		return currentTargetType;
	}
	
	private function isFishBiting():Bool
	{
		var fishBitePercentage:Float = 0.5;
		var roll = Math.random();
		if (roll < fishBitePercentage) return true;
		
		return false;
	}
	
	function AddObstacles() 
	{
		//for 20 times lets make a gateway using 2 obstacles
		var currentGatePoint:Point = new Point(400, 300);
		for (i in 0...13)
		{
			//first lets move the gate by a few blocks
			var jitterByBox = getRandomNumberBetween(1, 29);
			
			
			//lets put the top part of the gate
			var firstCutoff = 29 - jitterByBox;
			var obstacle1 = new StaticObstacleBase(currentGatePoint.x, 0, 1, firstCutoff);
			obstacle1.StartUp();
			addChild(obstacle1);
			obstacleList.push(obstacle1);
			
			
			var firstPasteOn = firstCutoff + 4;
			var obstacle2 = new StaticObstacleBase(currentGatePoint.x, firstPasteOn*ConstantHolder.tileArea, 1, 30 - firstPasteOn);
			obstacle2.StartUp();
			addChild(obstacle2);
			obstacleList.push(obstacle2);
			
			currentGatePoint.x += ConstantHolder.tileArea * 5;
		}
		
		//var obstacle1 = new StaticObstacleBase(400, 300, 1, 10);
		//obstacle1.StartUp();
		//addChild(obstacle1);
	}
	
	function addObstaclesBySection():Void
	{
		//initial computations
		var endBuffers:Float = 400;
		var ObstacleAreaLength:Float = ConstantHolder.appWidth * mapLengthMultiplier - endBuffers * 2;
		var numberOfObstaclesThatCanFit:Int = Math.floor(ObstacleAreaLength / (ConstantHolder.tileArea * 5));
		
		
		var currentGatePoint:Point = new Point(400, 300);
		for (i in 0...numberOfObstaclesThatCanFit)
		{
			
			//lets have more variations of this later
			addGateObstacle(currentGatePoint);
			
			currentGatePoint.x += ConstantHolder.tileArea * 5;
		}
		
		
	}
	
	function addGateObstacle(atPoint:Point)
	{
		//first lets move the gate by a few blocks
			var jitterByBox = getRandomNumberBetween(1, 29);
			
			
			//lets put the top part of the gate
			var firstCutoff = 28 - jitterByBox;
			var obstacle1 = new StaticObstacleBase(atPoint.x, 0, 1, firstCutoff);
			obstacle1.StartUp();
			addChild(obstacle1);
			obstacleList.push(obstacle1);
			
			
			var firstPasteOn = firstCutoff + 4;
			var obstacle2 = new StaticObstacleBase(atPoint.x, firstPasteOn*ConstantHolder.tileArea, 1, 30 - firstPasteOn);
			obstacle2.StartUp();
			addChild(obstacle2);
			obstacleList.push(obstacle2);
	}
	
	function getRandomNumberBetween(min:Float, max:Float):Float
	{
		var rolled:Float = Math.round((Math.random() * max + min) - min);
		return rolled;
	}
	
	function TrueOrFalse():Bool
	{
		var rolled = Math.random();
		if (rolled < 0.5) return true;
		return false;
	}
	
	function checkIfFishIsHittingBarriers():Bool
	{
		if (bulletFish == null) return false;
		
		for (barrier in obstacleList)
		{
			if (tools.checkIfPointInRectangle(bulletFish.getCenter(), barrier.returnHitBox())) return true;
		}
		
		return false;
	}
	
	function checkIfFishIsOutOfBounds():Bool
	{
		if (tools.checkIfPointInRectangle(bulletFish.getCenter(), tempStageRect)==false)
		{
			return true;
		}
		
		return false;
	}
	
	function checkIfFishIsHittingTargets():Point
	{
		var unConventionalUse:Point = new Point(0,0);
		for (target in targetList)
		{
			if (tools.checkIfPointInRectangle(bulletFish.getCenter(), target.returnHitBox()))
			{
				unConventionalUse.x = 1;
				unConventionalUse.y = target.myType;
			}
			
			if (unConventionalUse.x == 1) return unConventionalUse;
		}
		
		return unConventionalUse;
	}
	
	public function GameStep()
	{
		if (fishDown) return;
		
		bulletFish.GameStep();
		camera.followTarget();
		var camHit = camera.returnHitBox();
		
		if (camHit.x + camHit.width > ConstantHolder.appWidth * mapLengthMultiplier)
		{
			camera.x = (ConstantHolder.appWidth * mapLengthMultiplier) - camHit.width;
		}
		
		fishDown = (checkIfFishIsHittingBarriers()||checkIfFishIsOutOfBounds());
		//fishDown = checkIfFishIsOutOfBounds();
		
		var checkIfGameOver:Point = checkIfFishIsHittingTargets();
		if (checkIfGameOver.x == 1)
		{
			if (checkIfGameOver.y == currentTargetType)
			{
				//trace("Hitting correct target");
				//trace("you win!");
				goalAchieved = true;
				fishDown = true;
				soundManager.playHitRight();
				return;
			}
			//trace("hitting a target but incorrect");
			penalizeTime = true;
			fishDown = true;
		}
		
		if (fishDown)
		{
			if (bulletFish.isAtReset == false)
			{
				
				spawnDeadFishAtPosition(bulletFish.x, bulletFish.y, bulletFish.currentAngleRadians);
				bulletFish.hideAway();
			}
			camera.resetPosition();
			targetDisplayer.visible = true;
			if (bobBait.isEnabled == false)
			{
				bobBait.enableBob();
				soundManager.playHitWrong();
			}
		}
	}
	
	function spawnDeadFishAtPosition(_x:Float, _y:Float, _angle:Float) 
	{
		var deadFish = new SpentFishBase(_x, _y, _angle);
		deadFish.StartUp();
		//maybe add this alll later in an array for easy fixing
		addChild(deadFish);
		deadFishList.push(deadFish);
	}
	
	public function shootFish():Void
	{
		//if (bobBait.hasBite == false)
		//{
			//trace("no bite");
			//return;
		//}
		bulletFish.x = 50;
		bulletFish.y = 300;
		bulletFish.resetMe();
		camera.setTarget(bulletFish);
		fishDown = false;
		
		bobBait.disableBob();
		
		targetDisplayer.visible = false;
		
		soundManager.playLaunchSfx();
		//fishBiteRoller.stop();
	}
	
	public function ControlMovement(toControl:Point)
	{
		if (toControl.y < 0) bulletFish.moveDown();
		
		if (toControl.y > 0) bulletFish.moveUp();
		
	}
	
	public function InitialGameStart()
	{
		
	}
	
	public function ResetStage()
	{
		for (wall in obstacleList)
		{
			wall.destroy();
		}
		
		obstacleList = [];
		
		
	}
	
}