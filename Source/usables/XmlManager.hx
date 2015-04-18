package usables;



import openfl.Assets;
import haxe.xml.Fast;
/**
 * ...
 * @author Vrian G. Candelaria
 */
class XmlManager
{
	
	public var maxWidthOfMap:Int = 20;
	public var maxHeightOfMap:Int = 24;

	var arrayMapLocked:Bool = false;
	
	var tempXArray:Array<Int>;
	var tempYArray:Array<Array<Int>>;
	
	var finalMap:Array<Array<Int>>;
	
	public function new(_assetLocation:String) 
	{
		tempXArray = [];
		tempYArray = [];
		finalMap = [];
		
		load2dArray(_assetLocation);
	}
	
	public function load2dArray(assetLocation:String):Void
	{
		var exem:Xml = Xml.parse(Assets.getText(assetLocation));
		
		var truly:Fast = new Fast(exem.firstElement());
		
		//trace("version: "+truly.att.version);
		//trace("width: "+truly.att.width);
		//trace("height: " + truly.att.height);
		
		maxWidthOfMap = Std.parseInt(truly.att.width);
		maxHeightOfMap = Std.parseInt(truly.att.height);
		
		
		
		var layer = truly.node.layer;
		
		//trace(layer.att.name);
		
		var data = layer.node.data;
		
		for (p in data.nodes.tile)
		{
			//trace(p.att.gid);
			addValueToMap(p.att.gid);
		}
		
		//trace(tempYArray);
		tempYArray.push(tempXArray);
		
		finalMap = tempYArray;
		arrayMapLocked = true;
		
	}
	
	public function getMapArray():Array < Array<Int> >
	{
		if (arrayMapLocked == false)
		{
			//trace("map not loaded");
			return null;
		}else
			{
				return finalMap;
			}
		
	}
	
	function addValueToMap(_toAdd:String):Void
	{
		var toAdd = Std.parseInt(_toAdd);
		
		if (tempXArray.length < maxWidthOfMap)
		{
			tempXArray.push(toAdd);
		}else
		{
			var holder = ArrayDummyCopy(tempXArray);
			tempYArray.push(holder);
			tempXArray = [];
			tempXArray.push(toAdd);
		}
	}
	
	function ArrayDummyCopy(toCopy:Array<Int>):Array<Int>
	{
		var dummy:Array<Int> = [];
		for (elem in toCopy)
		{
			dummy.push(elem);
		}
		
		return dummy;	
	}
	
	
}