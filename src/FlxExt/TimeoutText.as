package FlxExt
{
	import org.flixel.*;

	public class TimeoutText extends FlxText
	{
		[Embed(source = "../data/uni05_53.ttf", fontFamily = "BIT", embedAsCFF = "false")] public	var	bitfont:String;
		
		private var frameCounter:int;
		private const textWidth:int = 300;
		private const yOffset:Number = -60;
		
		public function TimeoutText(x:Number, y:Number, text:String, timeout:int) 
		{
			super(x -textWidth /2, y + yOffset, textWidth, text, true);
			setFormat("BIT", 8, 0xff000000,"center");
			frameCounter = timeout;
		}
		
		override public function update():void 
		{
			super.update();
			frameCounter -= 1;
			if (frameCounter <= 0)
			{
				this.text = "";
				this.kill();
			}
		}
		
		public function show(x:Number, y:Number, width:Number, text:String, timeout:int):void
		{
			this.text = text;
			this.x = x - textWidth/2;
			this.y = y + yOffset;
			
			frameCounter = timeout;
		}
	}

}