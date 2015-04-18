package usables;
import openfl.geom.Point;

/**
 * ...
 * @author ...
 */
class JoystickMock
{
	private var UpTrigger:Bool;
	private var DownTrigger:Bool;
	private var LeftTrigger:Bool;
	private var RightTrigger:Bool;

	public function new() 
	{
		
		
	}
	
	public function PressedTrigger(toTrigger:Point)
	{
		if (toTrigger.x < 0)
		{
			LeftTrigger = true;
		}else if (toTrigger.x > 0)
			{
				RightTrigger = true;
			}else if (toTrigger.y < 0)
					{
						UpTrigger = true;
					}else if (toTrigger.y > 0)
						{
							DownTrigger = true;
						}
	}
	
	public function ReleasedTrigger(toRelease:Point)
	{
		if (toRelease.x < 0)
		{
			LeftTrigger = false;
		}else if (toRelease.x > 0)
			{
				RightTrigger = false;
			}else if (toRelease.y < 0)
					{
						UpTrigger = false;
					}else if (toRelease.y > 0)
						{
							DownTrigger = false;
						}
	}
	
	public function getCurretDirection():Point
	{
		var toRet:Point = new Point(0, 0);
		if (LeftTrigger)
		{
			toRet.x = -1;
		}else
			if(RightTrigger){
				toRet.x = 1;
			}
			
		if (UpTrigger)
		{
			toRet.y = -1;
		}else if (DownTrigger)
			{
				toRet.y = 1;
			}
			
		return toRet;
	}
	
}