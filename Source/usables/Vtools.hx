package usables;
import flash.geom.Point;
import openfl.geom.Rectangle;


/**
 * ...
 * @author Vrian
 * 
 * V tools v1.0
 */
class Vtools
{
	
	public function new() 
	{
		
	}
	
	public function getRandomNumberBetween(x:Int, y:Int):Int
	{
		return Math.floor(Math.random()*(y+1))+x;
	}
	
	public function getAngleToPointB(pointA:Point, pointB:Point):Float
	{
		var diffx = pointB.x - pointA.x;
		var diffy = pointB.y - pointA.y;
		return Math.atan2(diffy, diffx) * 180 / Math.PI;
	}
	
	public function getDistanceBetweenPoints(pointA:Point, pointB:Point):Float
	{
		var diffx = pointB.x - pointA.x;
		var diffy = pointB.y - pointA.y;
		return Math.sqrt(diffx*diffx+diffy*diffy);
	}
	
	public function angularVelocityToPointVelocity(angle:Float, velocity:Float):Point
	{
		var output:Point = new Point(0, 0);
		var radAngle = angle * Math.PI / 180;
		
		output.x = velocity * Math.cos(radAngle);
		output.y = velocity * Math.sin(radAngle);
		
		return output;
	}
	
	public function checkIfPointInRectangle(pointA:Point, rectB:Rectangle):Bool
	{
		var Top:Bool = false;
		var Bot:Bool = false;
		var Left:Bool = false;
		var Right:Bool = false;
		
			if (pointA.y > rectB.y ||
				pointA.y > rectB.y)
				{
					Top = true;
				}
			
			if (pointA.y  < rectB.y + rectB.height ||
				pointA.y < rectB.y + rectB.height)
				{
					Bot = true;
				}
				
			if (pointA.x > rectB.x ||
				pointA.x > rectB.x)
				{
					Left = true;
				}
				
			if (pointA.x < rectB.x + rectB.width ||
				pointA.x < rectB.x + rectB.width)
				{
					Right = true;
				}
			
			if ((Top && Bot) && (Left && Right)) return true;
			
			return false;
	}
	
	public function checkIfRectanglesAreColliding(rectA:Rectangle, rectB:Rectangle)
	{
		var Top:Bool = false;
		var Bot:Bool = false;
		var Left:Bool = false;
		var Right:Bool = false;
		
			if (rectA.y > rectB.y ||
				rectA.y + rectA.height > rectB.y)
				{
					Top = true;
				}
			
			if (rectA.y  < rectB.y + rectB.height ||
				rectA.y + rectA.height < rectB.y + rectB.height)
				{
					Bot = true;
				}
				
			if (rectA.x > rectB.x ||
				rectA.x + rectA.width > rectB.x)
				{
					Left = true;
				}
				
			if (rectA.x < rectB.x + rectB.width ||
				rectA.x+rectA.width < rectB.x + rectB.width)
				{
					Right = true;
				}
			
			if ((Top && Bot) && (Left && Right)) return true;
			
			return false;
	}
	
	public function checkIfRectangleIsInRectangle(rectA:Rectangle, rectB:Rectangle):Bool
	{
		if (checkIfPointInRectangle(new Point(rectA.x, rectA.y), rectB) &&
			checkIfPointInRectangle(new Point(rectA.x+rectA.width, rectA.y), rectB) &&
			checkIfPointInRectangle(new Point(rectA.x, rectA.y+rectA.height), rectB) &&
			checkIfPointInRectangle(new Point(rectA.x+rectA.width, rectA.y+rectA.height), rectB))
		{
			return true;
		}
		return false;
	}
}