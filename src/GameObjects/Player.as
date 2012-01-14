package GameObjects
{
	import org.flixel.*;
	import org.flixel.plugin.photonstorm.*;
	import FlxExt.*;
	 
	public class Player extends FlxSprite
	{
		
		[Embed(source = '../data/guy.png')] public static var player:Class;
		
		
		private var walking:Boolean;
		private var destination:FlxPoint;
		private var speed:Number = 1;
		private var walkingleft:Boolean;
		
		private const texttimeout:int = 100;
		
		//REGARDING STATES
		private var frameCounter:int;
		private var state:uint;
		private const NORMAL:uint = 0x0001;
		
		private const INITIAL:uint = 0x0002;
		private const INITIALEVENT1:int = 100;   //display text 1
		private const INITIALEVENT2:int = 250; 	 //display text 2
		private const INITIALEVENT3:int = 400;   //display text 3
		private const INITIALEVENT4:int = 600; 	 //stand up
		private const INITIALEVENT5:int = 630; 	 //go to NORMAL
		
		public function Player(x:Number, y:Number) 
		{
			loadGraphic(player, true, false, 20, 39);
			
			this.x = x;
			this.y = y;
			this.offset.x = 10;
			this.offset.y = 39;
			
			addAnimation("walkleft", [0, 1, 2, 3], 9, true);
			addAnimation("walkright", [4, 5, 6 , 7], 9, true);
			addAnimation("idle", [0], 10, false);
			addAnimation("sit", [8], 0, false);
			addAnimation("stand", [8,9,0], 9, false);
			
			
			walking = false;
			walkingleft = true;
			
			state = INITIAL;
			frameCounter = 0;
			
		}
		
		override public function update():void 
		{ 
			frameCounter += 1;
			switch(state)
			{
				case NORMAL:

					if (walking && !(this.x == destination.x && this.y == destination.y))
					{
						// calc x  y offset
						
						var xOffset:Number = 0;
						var yOffset:Number = 0;
						
						if (this.x > destination.x) 
						{
							if (this.x - speed > destination.x)
							{
								xOffset = -speed;
							}
							else
							{
								xOffset = destination.x - this.x;
							}
						}
						if (this.x < destination.x) 
						{
							if (this.x + speed < destination.x)
							{
								xOffset = speed;
							}
							else
							{
								xOffset = destination.x - this.x;
							}
						}				
						
						if (this.y > destination.y) 
						{
							if (this.y - speed > destination.y)
							{
								yOffset = -speed;
							}
							else
							{
								yOffset = destination.y - this.y;
							}
						}
						if (this.y < destination.y) 
						{
							if (this.y + speed < destination.y)
							{
								yOffset = speed;
							}
							else
							{
								yOffset = destination.y - this.y;
							}
						}								
						
						// check if okay
						if (!stillOnLand(new FlxPoint(this.x + xOffset, this.y)))
							xOffset = 0;
						if (!stillOnLand(new FlxPoint(this.x, this.y + yOffset)))
							yOffset = 0;
						
						// do
						
						if (xOffset > 0)
						{
							play("walkright");
						}
						else if (xOffset < 0)
						{
							play("walkleft");
						}

						this.x += xOffset;
						this.y += yOffset;
						
						if (xOffset == 0 && yOffset == 0)
							walking = false;
					}
					else
					{
						walking = false;
						play("idle");
					}
					break;
				case INITIAL:
					switch(frameCounter)
					{
						case 1:
							play("sit");
							break;
						case INITIALEVENT1:
							displayText("How did I get here?");
							break;
						case INITIALEVENT2:
							displayText("Where am I?");
							break;
						case INITIALEVENT3:
							displayText("Turtles can't talk.");
							break;
						case INITIALEVENT4:
							play("stand");
							break;
						case INITIALEVENT5:
							play("idle");
							state = NORMAL;
							frameCounter = 0;
							break;							
					}
					break;
			}
		}
		
		public function walkTo(point:FlxPoint):void 
		{
			walking = true;
			destination = point;
			
		}

		public function stillOnLand(point:FlxPoint):Boolean 
		{
			var tempimg:FlxSprite = new FlxSprite(point.x, point.y);
			tempimg.makeGraphic(2, 2,0xffff0000);  //(cannot be 1x1, doesn't work)
			return (FlxCollision.pixelPerfectCheck((FlxG.state as PlayState).clipping, tempimg));
		}
		
		public function displayText(text:String):void 
		{
			(FlxG.state as PlayState).texts.add(new TimeoutText(x, y, text, texttimeout));
		}
						
		
	}

}