package usables;
import flash.display.Sprite;
import flash.text.Font;
import flash.text.TextField;
import flash.text.TextFormat;
import openfl.Assets;

/**
 * ...
 * @author ...
 */
class TextDisplay extends Sprite
{
	var myFont:Font;
	
	var myTextField:TextField;
	
	var toDisplayText:String;
	
	public var fontSize:Float = 25;
	
	var defaultTextWidth:Float = 500;

	public function new(toSay:String, _x:Float, _y:Float, _fontSize:Float = 25) 
	{
		super();
		
		this.x = _x;
		this.y = _y;
		
		toDisplayText = toSay;
		
		fontSize = _fontSize;
		
		startDisplay();
	}
	
	
	function startDisplay() 
	{
		myFont = Assets.getFont("assets/fonts/ARCADECLASSIC.TTF");
		
		var format = new TextFormat (myFont.fontName, fontSize, 0xFFFFFF);
		myTextField = new TextField ();
		
		myTextField.defaultTextFormat = format;
		myTextField.embedFonts = true;
		myTextField.selectable = false;
		
		
		myTextField.width = defaultTextWidth;
		
		myTextField.text = toDisplayText;
		
		addChild (myTextField);
	}
	
	public function say(toSay:String)
	{
		myTextField.text = toSay;
	}
	
}