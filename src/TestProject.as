package
{
	import org.flixel.*;
	import FlxExt.FlxGameExt;

	[Frame(factoryClass="Preloader")]
	[SWF(width="640", height="480", backgroundColor="#000000")]

	public class TestProject extends FlxGame
	{
		public function TestProject()
		{
			super(320,240,PlayState,2, 60, 60);
			forceDebugger = true;
		}
	}
}