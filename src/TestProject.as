package
{
	import org.flixel.*;

	[SWF(width="640", height="480", backgroundColor="#000000")]
	[Frame(factoryClass="Preloader")]

	public class TestProject extends FlxGame
	{
		public function TestProject()
		{
			super(20,240,MenuState,2, 60, 60);
			forceDebugger = true;
		}
	}
}