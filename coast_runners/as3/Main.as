package
{
   import flash.display.Bitmap;
   import flash.display.BitmapData;
   import flash.display.MovieClip;
   import flash.display.Stage;
   import flash.events.Event;
   import flash.external.ExternalInterface;
   import flash.geom.Point;
   import flash.utils.getTimer;
   import org.flashdevelop.utils.FlashConnect;
   
   public class Main extends MovieClip
   {
      
      public static var theRoot:MovieClip;
      
      public static var theStage:Stage;
      
      public var screenB:Bitmap;
      
      private var currentTime:Number = 0;
      
      internal var secondCounter:Number = 0;
      
      public var fps:Number;
      
      public var screenBD:BitmapData;
      
      public var frontBD:BitmapData;
      
      private var origin:Point = new Point(0,0);
      
      internal var framecounter:int = 0;
      
      private var ftime:Number;
      
      public function Main()
      {
         super();
         if(stage)
         {
            this.init(null);
         }
         else
         {
            addEventListener(Event.ADDED_TO_STAGE,this.init);
         }
      }
      
      internal function calcFrameTime() : *
      {
         var _loc1_:Number = this.currentTime;
         this.currentTime = getTimer();
         if(this.currentTime < _loc1_)
         {
            _loc1_ = this.currentTime - 100;
         }
         if(this.currentTime > _loc1_ + 100 * 10)
         {
            _loc1_ = 100 * 10;
         }
         this.ftime = 1 / (1000 / Defs.fps) * (this.currentTime - _loc1_);
         ++this.framecounter;
         this.secondCounter += this.currentTime - _loc1_;
         if(this.secondCounter > 1000)
         {
            this.fps = Number(this.framecounter) / this.secondCounter * 1000;
            this.framecounter = 0;
            this.secondCounter = 0;
         }
         this.ftime = 1;
      }
      
      internal function InitStageForGame() : *
      {
         var _loc1_:* = 0;
         _loc1_ = int(this.numChildren - 1);
         while(_loc1_ >= 0)
         {
            removeChildAt(_loc1_);
            _loc1_--;
         }
         addChild(this.screenB);
         this.screenB.x = 0;
         this.screenB.y = 0;
      }
      
      internal function init(param1:Event) : *
      {
         removeEventListener(Event.ADDED_TO_STAGE,this.init);
         theRoot = this;
         theStage = this.root.stage;
         FlashConnect.trace("Main start");
         this.SetEverythingUpOnce();
      }
      
      internal function RunLevel() : *
      {
         Game.UpdateGameplay();
         this.Render();
      }
      
      internal function InitStageNoBackground() : *
      {
         var _loc1_:* = 0;
         _loc1_ = int(this.numChildren - 1);
         while(_loc1_ >= 0)
         {
            removeChildAt(_loc1_);
            _loc1_--;
         }
      }
      
      internal function InitDrawScreen() : void
      {
         this.screenBD = new BitmapData(Defs.displayarea_w,Defs.displayarea_h,true,0);
         this.frontBD = new BitmapData(Defs.displayarea_w,Defs.displayarea_h,true,0);
         this.screenB = new Bitmap(this.frontBD);
      }
      
      internal function SetEverythingUpOnce2() : void
      {
         this.SetEverythingUpOnce3();
      }
      
      internal function SetEverythingUpOnce3() : void
      {
         Debug.StartMemTest();
         MusicPlayer.InitOnce();
         KeyReader.InitOnce(theStage);
         Debug.DoMemTest("setup 1");
         MouseControl.InitOnce(theStage);
         SoundPlayer.InitOnce(this);
         PauseMenu.InitOnce(this);
         Debug.DoMemTest("setup 2");
         Particles.InitOnce(this,500);
         SurfaceParticles.InitOnce(this,500);
         GameObjects.InitOnce(this,2000);
         this.InitDrawScreen();
         Stats.InitOnce();
         this.SetEverythingUpOnce4();
      }
      
      internal function addedToStage(param1:Event) : *
      {
         this.SetEverythingUpOnce2();
      }
      
      internal function MainLoop(param1:Event) : void
      {
         RLBridge.register();
         if(RLBridge.suppressEnterFrame || RLBridge.inFrame)
         {
            return;
         }
         RLBridge.inFrame = true;
         this.runControlledFrame(false);
         RLBridge.inFrame = false;
      }
      
      internal function runControlledFrame(param1:Boolean, param2:Boolean = true) : void
      {
         if(param1)
         {
            RLBridge.applyKeys();
         }
         KeyReader.UpdateOncePerFrame();
         SoundPlayer.UpdateOncePerFrame();
         MusicPlayer.UpdateOncePerFrame();
         this.calcFrameTime();
         Game.UpdateGameplay();
         if(param2 && RLBridge.recording)
         {
            this.Render();
         }
      }
      
      internal function SetEverythingUpOnce4() : *
      {
         Game.main = this;
         this.InitStage();
         Game.StartTitleScreen();
         RLBridge.install(this);
         addEventListener(Event.ENTER_FRAME,this.MainLoop);
      }
      
      internal function SetEverythingUpOnce() : void
      {
         if(stage == null)
         {
            addEventListener(Event.ADDED_TO_STAGE,this.addedToStage);
         }
         else
         {
            this.SetEverythingUpOnce2();
         }
      }
      
      internal function InitStage() : *
      {
         var _loc1_:* = 0;
         _loc1_ = int(this.numChildren - 1);
         while(_loc1_ >= 0)
         {
            removeChildAt(_loc1_);
            _loc1_--;
         }
         addChild(this.screenB);
         this.screenB.x = 0;
         this.screenB.y = 0;
      }
      
      internal function Render() : *
      {
         this.x = 0;
         this.y = 0;
         if(RLBridge.fastRender && Game.panelOverlay != null)
         {
            Game.panelOverlay.visible = false;
         }
         Game.Render();
         this.frontBD.copyPixels(this.screenBD,this.screenBD.rect,this.origin);
      }
   }

class RLBridge
   {
      
      public static var pumping:Boolean = false;
      
      public static var inFrame:Boolean = false;
      
      public static var suppressEnterFrame:Boolean = false;
      
      public static var recording:Boolean = false;
      
      public static var fastRender:Boolean = true;
      
      private static var callbacksReady:Boolean = false;
      
      public static var main:Main;
      
      private static var keyUp:Boolean = false;
      
      private static var keyDown:Boolean = false;
      
      private static var keyLeft:Boolean = false;
      
      private static var keyRight:Boolean = false;
      
      private static var keyTurbo:Boolean = false;
      
      private static var turboHeld:Boolean = false;
      
      public function RLBridge()
      {
         super();
      }
      
      public static function install(target:Main) : void
      {
         main = target;
         register();
      }
      
      public static function register() : void
      {
         if(callbacksReady)
         {
            return;
         }
         try
         {
            ExternalInterface.addCallback("isReady",isReady);
            ExternalInterface.addCallback("takeControl",takeControl);
            ExternalInterface.addCallback("resetLevel",resetLevel);
            ExternalInterface.addCallback("step",step);
            ExternalInterface.addCallback("setRecording",setRecording);
            ExternalInterface.addCallback("setRender",setRender);
            callbacksReady = true;
            ExternalInterface.call("rlLog","callbacks-ready");
         }
         catch(error:Error)
         {
         }
      }
      
      public static function setRecording(value:*) : Boolean
      {
         recording = value == true || int(value) != 0;
         return recording;
      }
      
      public static function setRender(value:*) : Boolean
      {
         fastRender = String(value) != "full";
         return fastRender;
      }
      
      public static function takeControl() : Boolean
      {
         suppressEnterFrame = true;
         return true;
      }
      
      public static function isReady() : Boolean
      {
         return main != null && Game.levels != null && Game.levels.length > 0;
      }
      
      public static function resetLevel(level:int) : String
      {
         if(level < 0)
         {
            level = 0;
         }
         if(Game.levels != null && level >= Game.levels.length)
         {
            level = 0;
         }
         Game.currentLevel = level;
         turboHeld = false;
         clearKeyNames();
         Game.StartLevel();
         suppressEnterFrame = true;
         var guard:int = 0;
         while(Game.levelState != Game.levelState_Play && guard < 240)
         {
            guard++;
            main.runControlledFrame(false,Game.startCountdownTimer <= 1 || guard == 240);
         }
         return observe();
      }
      
      public static function step(payload:String) : String
      {
         var parts:Array = payload.split("|");
         var keys:String = parts.length > 0 ? String(parts[0]) : "";
         var frames:int = parts.length > 1 ? int(parts[1]) : 1;
         setKeys(keys);
         if(frames < 1)
         {
            frames = 1;
         }
         if(frames > 600)
         {
            frames = 600;
         }
         suppressEnterFrame = true;
         var index:int = 0;
         while(index < frames)
         {
            index++;
            main.runControlledFrame(true,index == frames);
         }
         return observe();
      }
      
      public static function applyKeys() : void
      {
         if(KeyReader.keysDown == null)
         {
            return;
         }
         var index:int = 0;
         while(index < 256)
         {
            KeyReader.keysDown[index] = 0;
            index++;
         }
         if(keyUp)
         {
            KeyReader.keysDown[KeyReader.KEY_UP] = 2;
            KeyReader.keysDown[KeyReader.KEY_W] = 2;
         }
         if(keyDown)
         {
            KeyReader.keysDown[KeyReader.KEY_DOWN] = 2;
            KeyReader.keysDown[KeyReader.KEY_S] = 2;
         }
         if(keyLeft)
         {
            KeyReader.keysDown[KeyReader.KEY_LEFT] = 2;
            KeyReader.keysDown[KeyReader.KEY_A] = 2;
         }
         if(keyRight)
         {
            KeyReader.keysDown[KeyReader.KEY_RIGHT] = 2;
            KeyReader.keysDown[KeyReader.KEY_D] = 2;
         }
         if(keyTurbo)
         {
            var code:int = turboHeld ? 2 : 1;
            KeyReader.keysDown[KeyReader.KEY_SPACE] = code;
            KeyReader.keysDown[KeyReader.KEY_X] = code;
         }
         turboHeld = keyTurbo;
      }
      
      private static function clearKeyNames() : void
      {
         keyUp = false;
         keyDown = false;
         keyLeft = false;
         keyRight = false;
         keyTurbo = false;
      }
      
      private static function setKeys(spec:String) : void
      {
         clearKeyNames();
         if(spec == null || spec.length == 0)
         {
            return;
         }
         var parts:Array = spec.split(",");
         var index:int = 0;
         while(index < parts.length)
         {
            var name:String = String(parts[index]);
            if(name == "up")
            {
               keyUp = true;
            }
            else if(name == "down")
            {
               keyDown = true;
            }
            else if(name == "left")
            {
               keyLeft = true;
            }
            else if(name == "right")
            {
               keyRight = true;
            }
            else if(name == "turbo")
            {
               keyTurbo = true;
            }
            index++;
         }
      }
      
      private static function observe() : String
      {
         var player:PhysObj_Instance = Game.GetPlayerInstance();
         var score:int = Game.levelScore;
         var x:Number = 0;
         var y:Number = 0;
         var speed:Number = 0;
         var lap:int = 0;
         var health:Number = 0;
         var finished:Boolean = Game.levelWon;
         var failed:Boolean = Game.levelTimedOut || Game.levelState == Game.levelState_Complete && Game.levelWon == false;
         if(player != null)
         {
            speed = player.vehicleSpeed;
            lap = player.vehicleCurrentLap;
            if(player.finishedRace)
            {
               finished = true;
            }
            var body:GameObj = null;
            try
            {
               body = player.GetGameObject(0);
            }
            catch(error:Error)
            {
               body = null;
            }
            if(body != null)
            {
               x = body.xpos;
               y = body.ypos;
               health = body.health;
            }
         }
         var time:Number = Game.race_time / Defs.fps;
         return "{\"score\":" + score + ",\"x\":" + num(x) + ",\"y\":" + num(y) + ",\"speed\":" + num(speed) + ",\"lap\":" + lap + ",\"health\":" + num(health) + ",\"finished\":" + bool(finished) + ",\"failed\":" + bool(failed) + ",\"time\":" + num(time) + "}";
      }
      
      private static function num(value:Number) : String
      {
         if(isNaN(value) || value == Infinity || value == -Infinity)
         {
            return "0";
         }
         var rounded:Number = Math.round(value * 1000) / 1000;
         return String(rounded);
      }
      
      private static function bool(value:Boolean) : String
      {
         return value ? "true" : "false";
      }
   }
}
