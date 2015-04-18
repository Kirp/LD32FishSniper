package game.usables;
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

	public function new(toSay:String, _x:Float, _y:Float) 
	{
		super();
		
		this.x = _x;
		this.y = _y;
		
		toDisplayText = toSay;
		
		startDisplay();
	}
	
	
	function startDisplay() 
	{
		myFont = Assets.getFont("assets/fonts/ARCADECLASSIC.TTF");
		
		var format = new TextFormat (myFont.fontName, 5, 0xFFFFFF);
		myTextField = new TextField ();
		
		myTextField.defaultTextFormat = format;
		myTextField.embedFonts = true;
		myTextField.selectable = false;
		
		
		myTextField.width = 10;
		
		myTextField.text = toDisplayText;
		
		addChild (myTextField);
	}
	
}