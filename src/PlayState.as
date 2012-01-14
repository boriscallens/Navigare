package
{
	import org.flixel.*;
	import GameObjects.*;

	public class PlayState extends FlxState
	{
		[Embed(source = 'data/cursor.png')] public static var cursor:Class;
		[Embed(source = 'data/clipping.png')] public static var clipmap:Class;
		[Embed(source = 'data/background.png')] public static var backgroundmap:Class;
		
		// ACTORS
		private var player:Player;
		private var turtle:Turtle;
		
		private var background:FlxSprite;
		public var texts:FlxGroup;
		public var clipping:FlxSprite;
		
		override public function create():void
		{
			FlxG.mouse.show(cursor, 1, -16, -16);
			
			// INITS
			texts = new FlxGroup();
			turtle = new Turtle(10,10);
			player = new Player(150, 150);
			clipping = new FlxSprite(0, 0, clipmap);
			background = new FlxSprite(0, 0, backgroundmap);
			
			// ADDS
			add(background);
			add(player);
			add(turtle);
			add(texts);
		}
		
		override public function update():void
		{
			super.update();
			if (FlxG.mouse.justPressed())
			{
				player.walkTo(new FlxPoint(FlxG.mouse.x, FlxG.mouse.y));
			}
		}
	}
}

