package GameObjects 
{
	import org.flixel.FlxObject;
	import org.flixel.FlxPath;
	import org.flixel.FlxPoint;
	import org.flixel.FlxSprite;

	public class Turtle extends FlxSprite
	{
		[Embed(source = '../data/turtle.png')] public static var turtle:Class;
		private var lastPos:FlxPoint;
		
		public function Turtle(x:Number, y:Number) 
		{
			this.x = x;
			this.y = y;
			loadGraphic(turtle, true, false, 40, 22);
			addAnimation("swimright", [0, 0, 0,0,0,0,0, 0, 1], 5, true);
			addAnimation("swimleft", [3,3,3,3,3,3,3,3,2], 5, true);

			// PATH
			var point1:FlxPoint = new FlxPoint(20, 20);
			var point2:FlxPoint = new FlxPoint(300, 20);
			var point3:FlxPoint = new FlxPoint(200, 40);
			var point4:FlxPoint = new FlxPoint(150, 50);
			this.followPath(new FlxPath([point1, point2,point3, point4]),30, FlxObject.PATH_LOOP_BACKWARD, false);
			
			lastPos = new FlxPoint(this.x, this.y);
		}
		
		public override function update():void {
			if (lastPos.x > x)
			{
				play("swimleft");
			}
			else
			{
				play("swimright");
			}
			lastPos = new FlxPoint(this.x, this.y);
		}
	}
}