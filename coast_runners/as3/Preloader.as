package
{
   import flash.display.DisplayObject;
   import flash.display.MovieClip;
   import flash.events.Event;
   import flash.utils.getDefinitionByName;
   import org.flashdevelop.utils.FlashConnect;
   
   [SWF(width="640", height="480", backgroundColor="#ffffff", frameRate="30")]
   public dynamic class Preloader extends MovieClip
   {
      
      private static var loader:MovieClip = null;
      
      public function Preloader()
      {
         super();
         this.initial_startup();
      }
      
      private function initial_startup() : void
      {
         Lic.InitFromFlex(this);
         this.startup();
      }
      
      private function checkFrame(param1:Event) : void
      {
         if(currentFrame == totalFrames)
         {
            removeEventListener(Event.ENTER_FRAME,this.checkFrame);
            this.startmain2();
         }
      }
      
      private function startmain2() : void
      {
         this.startmain3();
      }
      
      private function startmain3() : void
      {
         var _loc1_:Class = getDefinitionByName("Main") as Class;
         addChild(new _loc1_() as DisplayObject);
      }
      
      private function startmain() : void
      {
         FlashConnect.trace("Preloader startmain");
         addEventListener(Event.ENTER_FRAME,this.checkFrame);
      }
      
      private function startup() : void
      {
         FlashConnect.trace("Preloader startup");
         this.startmain();
      }
   }
}

