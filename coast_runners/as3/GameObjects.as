package
{
   import flash.display.BitmapData;
   import flash.events.*;
   import flash.geom.Point;
   
   internal class GameObjects
   {
      
      public static var numobjs:*;
      
      internal static var m:Main;
      
      public static var zorder:Array;
      
      public static var objs:Vector.<GameObj>;
      
      public static var lastGenIndex:int;
      
      internal var v:Vector.<GameObj> = new Vector.<GameObj>(1000);
      
      public function GameObjects()
      {
         super();
      }
      
      public static function Update() : void
      {
         var _loc1_:GameObj = null;
         Debug.StartTimer("update GOs");
         for each(_loc1_ in objs)
         {
            if(_loc1_.active == true)
            {
               _loc1_.Update();
            }
         }
         Debug.EndTimer("update GOs");
      }
      
      public static function Render(param1:BitmapData) : void
      {
         var _loc2_:GameObj = null;
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         Debug.StartTimer("sort");
         _loc3_ = 0;
         zorder.splice(0,zorder.length);
         for each(_loc2_ in objs)
         {
            if(_loc2_.active && _loc2_.visible && (RLBridge.fastRender == false || _loc2_.rlSkipDraw == false))
            {
               zorder.push(_loc2_);
               _loc3_++;
            }
         }
         zorder.sortOn("zpos",Array.NUMERIC | Array.DESCENDING);
         Debug.EndTimer("sort");
         _loc4_ = 0;
         while(_loc4_ < _loc3_)
         {
            _loc2_ = zorder[_loc4_];
            _loc2_.Render(param1);
            _loc4_++;
         }
      }
      
      public static function zcompare(param1:Point, param2:Point) : Number
      {
         if(param1.y > param2.y)
         {
            return -1;
         }
         if(param1.y < param2.y)
         {
            return 1;
         }
         return 0;
      }
      
      public static function KillObjects() : void
      {
         var _loc1_:GameObj = null;
         for each(_loc1_ in objs)
         {
            if(_loc1_.active == true && _loc1_.killed)
            {
               _loc1_.active = false;
            }
         }
      }
      
      public static function InitOnce(param1:Main, param2:int) : *
      {
         var _loc3_:* = undefined;
         numobjs = param2;
         m = param1;
         objs = new Vector.<GameObj>(numobjs);
         zorder = new Array(numobjs);
         _loc3_ = 0;
         while(_loc3_ < numobjs)
         {
            objs[_loc3_] = new GameObj(m,0,0);
            _loc3_++;
         }
      }
      
      public static function ClearAll() : *
      {
         var _loc1_:int = 0;
         _loc1_ = 0;
         while(_loc1_ < numobjs)
         {
            objs[_loc1_].active = false;
            _loc1_++;
         }
      }
      
      public static function CountActive() : int
      {
         var _loc2_:int = 0;
         var _loc1_:int = 0;
         _loc2_ = 0;
         while(_loc2_ < objs.length)
         {
            if(objs[_loc2_].active == true)
            {
               _loc1_++;
            }
            _loc2_++;
         }
         return _loc1_;
      }
      
      public static function AddObj(param1:Number, param2:Number, param3:Number) : GameObj
      {
         var _loc4_:int = 0;
         var _loc5_:GameObj = null;
         _loc4_ = 0;
         while(_loc4_ < numobjs)
         {
            if(objs[_loc4_].active == false)
            {
               _loc5_ = objs[_loc4_];
               _loc5_.active = true;
               _loc5_.zpos = param3;
               _loc5_.xpos = param1;
               _loc5_.ypos = param2;
               _loc5_.startx = param1;
               _loc5_.starty = param2;
               _loc5_.startz = param3;
               _loc5_.Init(0);
               lastGenIndex = _loc4_;
               return objs[_loc4_];
            }
            _loc4_++;
         }
         trace("ERROR! NO FREE OBJECTS");
         lastGenIndex = -1;
         return null;
      }
      
      public static function ForEachActive(param1:Function) : void
      {
         var _loc2_:GameObj = null;
         var _loc3_:Array = new Array();
         for each(_loc2_ in objs)
         {
            if(_loc2_.active)
            {
               param1(_loc2_);
            }
         }
      }
      
      public static function GetGOByIndex(param1:int) : GameObj
      {
         return objs[param1];
      }
      
      public function GameObjGroup() : *
      {
      }
   }
}

