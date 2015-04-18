package stages;

import camera.CameraBase;
import entities.PlayerBase;
import entities.TargetBase;
import entities.ThrownFishBase;
import openfl.geom.Point;
import utilities.ConstantHolder;

import openfl.display.Sprite;
import openfl.geom.Rectangle;

/**
 * ...
 * @author ...
 */
class PlayStageFishBase extends Sprite
{
	private var stageBG:Sprite;

	private var tempStageRect:Rectangle;
	
	private var player:PlayerBase; 
	private var target:TargetBase;
	
	private var bulletFish:ThrownFishBase;
	
	public var camera:CameraBase;
	
	private var RunGameLoop:Bool = false;
	
	public function new() 
	{
		super();
		
	}
	
	public function StartUp()
	{
		tempStageRect = new Rectangle(0,0, ConstantHolder.appWidth*3, ConstantHolder.appHeight);
		
		
		stageBG = new Sprite();
		stageBG.graphics.beginFill(0xffffff);
		stageBG.graphics.drawRect(tempStageRect.x, tempStageRect.y, tempStageRect.width, tempStageRect.height);
		stageBG.graphics.endFill();
		
		addChild(stageBG);
		
		
		player = new PlayerBase(10, 300);
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
	}
	
	public function GameStep()
	{
		bulletFish.GameStep();
		camera.followTarget();
	}
	
	public function ControlMovement(toControl:Point)
	{
		if (toControl.y < 0) bulletFish.moveDown();
		
		if (toControl.y > 0) bulletFish.moveUp();
		
	}
	
}