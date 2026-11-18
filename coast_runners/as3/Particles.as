package
{
   import flash.display.BitmapData;
   import flash.geom.*;
   
   public class Particles
   {
      
      internal static var max:int;
      
      internal static var list:Vector.<Particle>;
      
      internal static var main:Main;
      
      internal static var nextIndex:int;
      
      public static const type_dust:* = 0;
      
      public function Particles()
      {
         super();
      }
      
      public static function Add(param1:Number, param2:Number) : Particle
      {
         var _loc3_:Number = NaN;
         var _loc4_:Number = NaN;
         var _loc5_:Particle = list[nextIndex];
         ++nextIndex;
         if(nextIndex >= max)
         {
            nextIndex = 0;
         }
         _loc5_.active = true;
         _loc5_.timer = 0;
         _loc5_.alpha = 1;
         _loc5_.alphaAdd = 0;
         _loc5_.visible = true;
         _loc5_.xpos = param1;
         _loc5_.ypos = param2;
         _loc5_.angle = 0;
         return _loc5_;
      }
      
      public static function GetNextIndex() : int
      {
         return nextIndex;
      }
      
      public static function Reset() : *
      {
         var _loc1_:int = 0;
         nextIndex = 0;
         _loc1_ = 0;
         while(_loc1_ < max)
         {
            list[_loc1_].active = false;
            _loc1_++;
         }
      }
      
      public static function Update() : *
      {
         var _loc1_:int = 0;
         var _loc2_:Particle = null;
         _loc1_ = 0;
         while(_loc1_ < max)
         {
            _loc2_ = list[_loc1_];
            if(_loc2_.active == true)
            {
               _loc2_.updateFunction();
            }
            _loc1_++;
         }
      }
      
      public static function InitOnce(param1:Main, param2:int) : void
      {
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         main = param1;
         max = param2;
         nextIndex = 0;
         list = new Vector.<Particle>(max);
         _loc3_ = 0;
         while(_loc3_ < max)
         {
            list[_loc3_] = new Particle();
            list[_loc3_].active = false;
            _loc3_++;
         }
      }
      
      public static function CountActive() : int
      {
         var _loc2_:int = 0;
         var _loc1_:int = 0;
         _loc2_ = 0;
         while(_loc2_ < max)
         {
            if(list[_loc2_].active)
            {
               _loc1_++;
            }
            _loc2_++;
         }
         return _loc1_;
      }
      
      public static function Render(param1:BitmapData) : *
      {
         var _loc9_:int = 0;
         var _loc10_:int = 0;
         var _loc12_:Particle = null;
         var _loc13_:Number = NaN;
         var _loc14_:Number = NaN;
         var _loc2_:BitmapData = param1;
         var _loc3_:Number = 0 - 16;
         var _loc4_:Number = Defs.displayarea_w + 16;
         var _loc5_:Number = 0 - 16;
         var _loc6_:Number = Defs.displayarea_h + 16;
         var _loc7_:Number = Game.camera.x;
         var _loc8_:Number = Game.camera.y;
         var _loc11_:ColorTransform = new ColorTransform();
         if(RLBridge.fastRender)
         {
            return;
         }
         _loc9_ = 0;
         while(_loc9_ < max)
         {
            _loc12_ = list[_loc9_];
            if(_loc12_.active && _loc12_.visible)
            {
               _loc13_ = _loc12_.xpos - _loc7_;
               _loc14_ = _loc12_.ypos - _loc8_;
               GraphicObjects.RenderAt(_loc12_.graphicID,int(_loc12_.frame),_loc2_,_loc13_,_loc14_);
            }
            _loc9_++;
         }
      }
   }
}

