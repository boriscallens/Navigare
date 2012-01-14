package
{
	import org.flixel.*;

	public class MenuState extends FlxState
	{
		private var playButton:FlxButton;
		//private var devButton:FlxButton;
		private var Title:FlxText;
		
		override public function create():void
		{ 
			var buttonColor:uint = 0xffD4D943;
			var buttonLabelColor:uint = 0xffD8EBA2;
			
			FlxG.bgColor = 0xff000000;
			
			Title = new FlxText(FlxG.width / 2, FlxG.height / 3, 100, "Navigare")
			Title.alignment = "center";
			add(Title);
						
			playButton = new FlxButton(FlxG.width/2-40, FlxG.height / 3 + 100, "Click To Play", onPlay);
			playButton.color = buttonColor;
			playButton.label.color = buttonLabelColor;
			add(playButton);
			
			FlxG.mouse.show();
		}
		
		override public function update():void
		{
			super.update();	
		}
		
		protected function onPlay():void
		{
			playButton.exists = false;
			FlxG.switchState(new PlayState());
		}	
	}
}

