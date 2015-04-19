package sfxManager;
import flash.media.Sound;
import flash.media.SoundTransform;
import openfl.Assets;

/**
 * ...
 * @author Vrian G. Candelaria
 */

class SfxManager
{
	
	
	
	var launchSound:Sound;
	var hitBad:Sound;
	var hitRight:Sound;


	var soundCTRL:SoundTransform;
	var soundBGM:SoundTransform;

	public function new() 
	{
		
		initializeSounds();
	}
	
	function initializeSounds() 
	{
		
		
		launchSound = Assets.getSound("assets/sfx/Launch.mp3");
		hitBad = Assets.getSound("assets/sfx/HitWrong.mp3");
		hitRight = Assets.getSound("assets/sfx/HitRight.mp3");
		
		soundCTRL = new SoundTransform();
		
		soundCTRL.volume = 0.5;
		
		soundBGM = new SoundTransform();
		
		soundBGM.volume = 0.5;
		
	}
	
	public function playLaunchSfx():Void
	{
		launchSound.play(0,0,soundCTRL);
	}
	
	public function playHitWrong():Void
	{
		hitBad.play(0,0,soundCTRL);
	}
	
	public function playHitRight():Void
	{
		hitRight.play(0,0,soundCTRL);
	}
	
	
}