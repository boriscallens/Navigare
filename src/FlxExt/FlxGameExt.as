package FlxExt
{
    import flash.events.Event;
    import org.flixel.FlxGame;
 
    [SWF(width="640", height="480", backgroundColor="#000000")]
    public class FlxGameExt extends FlxGame
    {
 
        public function FlxGameExt(GameSizeX:uint,GameSizeY:uint,InitialState:Class,Zoom:Number=1,GameFramerate:uint=60,FlashFramerate:uint=30,UseSystemCursor:Boolean=false)
        {
            super(GameSizeX, GameSizeY, InitialState, Zoom, GameFramerate,FlashFramerate,UseSystemCursor);
        }
 
        override protected function create(FlashEvent:Event):void
        {
            super.create(FlashEvent);
            stage.removeEventListener(Event.DEACTIVATE, onFocusLost);
            stage.removeEventListener(Event.ACTIVATE, onFocus);
        }
 
    }
 
}