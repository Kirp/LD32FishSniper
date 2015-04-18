package stages;

import camera.CameraBase;
import entities.PlayerBase;
import entities.TargetBase;
import entities.ThrownFishBase;
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
	
	private var player:PlayerBase; 
	private var target:TargetBase;
	
	private var bulletFish:ThrownFishBase;
	
	public var camera:CameraBase;
	
	private var RunGameLoop:Bool = false;
	
	private var obstacleList:Array<StaticObstacleBase>;
	
	private var GameOver:Bool = false;
	
	public function new() 
	{
		super();
		
	}
	
	public function StartUp()
	{
		//init
		tools = new Vtools();
		obstacleList = [];
		
		
		tempStageRect = new Rectangle(0,0, ConstantHolder.appWidth*3, ConstantHolder.appHeight);
		
		
		stageBG = new Sprite();
		stageBG.graphics.beginFill(0xffffff);
		stageBG.graphics.drawRect(tempStageRect.x, tempStageRect.y, tempStageRect.width, tempStageRect.height);
		stageBG.graphics.endFill();
		
		addChild(stageBG);
		
		
		player = new PlayerBase(100, 300);
		addChild(player);
		player.StartUp();
		
		target = new TargetBase(tempStageRect.width - 35, 300);
		addChild(target);
		target.StartUp();
		
		bulletFish = new ThrownFishBase(20, 300);
		addChild(bulletFish);
		bulletFish.StartUp();
		
		camera = new CameraBase(0, 0);
		camera.StartUp();
		addChild(camera);
		camera.setTarget(bulletFish);
		
		RunGameLoop = true;
		
		AddObstacles();
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
	
	public function GameStep()
	{
		if (GameOver) return;
		
		bulletFish.GameStep();
		camera.followTarget();
		GameOver = (checkIfFishIsHittingBarriers());
	}
	
	public function ControlMovement(toControl:Point)
	{
		if (toControl.y < 0) bulletFish.moveDown();
		
		if (toControl.y > 0) bulletFish.moveUp();
		
	}
	
}