package
{
   import Box2D.Collision.*;
   import Box2D.Collision.Shapes.*;
   import Box2D.Common.*;
   import Box2D.Common.Math.*;
   import Box2D.Dynamics.*;
   import Box2D.Dynamics.Contacts.*;
   import Box2D.Dynamics.Joints.*;
   import flash.display.BitmapData;
   import flash.events.*;
   import flash.geom.*;
   import org.flashdevelop.utils.FlashConnect;
   
   public class GameObj
   {
      
      internal var bellTimer:int;
      
      public var xvel:Number;
      
      internal var path:Poly;
      
      public var todir:Number;
      
      internal var bd:BitmapData;
      
      internal var objectDef:ObjectDef;
      
      public var speed:Number;
      
      public var colFlag_isEnemy:Boolean;
      
      public var startx:Number;
      
      public var ypos2:Number;
      
      public var startz:Number;
      
      public var ypos1:Number;
      
      public var starty:Number;
      
      public var colFlag_playercanbekilled:Boolean;
      
      public var frame1:Number;
      
      public var movementVec:Vec;
      
      internal var physObjInst:PhysObj_Instance;
      
      internal var ct:ColorTransform = new ColorTransform(0.1,0.1,0.1,0.3);
      
      public var visible:Boolean;
      
      internal var sortByY:Boolean;
      
      public var killed:Boolean;
      
      public var colFlag_isWake:Boolean;
      
      public var yvel:Number;
      
      public var colOffsetX:Number;
      
      public var colOffsetY:Number;
      
      public var colFlag_isPhysObj:Boolean;
      
      public var dir:Number;
      
      internal var planeDir:Number;
      
      public var radius:Number;
      
      internal var zbodge:Number;
      
      public var controlMode:int;
      
      public var colFlag_isBullet:Boolean;
      
      internal var uniqueID:int;
      
      public var colFlag_isPlatform:Boolean;
      
      public var xpos1:Number;
      
      public var xpos2:Number;
      
      internal var flybyBombTimeMin:Number = 2;
      
      public var colFlag_isBall:Boolean;
      
      internal var turboMode:int;
      
      public var zvel:Number;
      
      internal var xflip:Boolean;
      
      internal var currentPoly:Poly;
      
      public var colFlag_killPlayer:Boolean;
      
      internal var hopperIndex:int;
      
      public var xacc:Number;
      
      public var count:int;
      
      internal var ufoLine:PhysLine;
      
      internal var birdDir:Number;
      
      public var colFlag_isHose:Boolean;
      
      public var colFlag_jumpon:Boolean;
      
      internal var height:Number;
      
      public var colFlag_isEnemyBullet:Boolean;
      
      internal var flashTimer:int;
      
      internal var maxSpeed:Number;
      
      internal var scale:Number;
      
      internal var alpha:Number;
      
      public var yacc:Number;
      
      public var frame:Number;
      
      public var controlIndex:int;
      
      public var subtype:int;
      
      public var oldxpos:Number;
      
      public var timer1:Number;
      
      internal var flybyGenTimeMax:Number = 4;
      
      public var toPosX:Number;
      
      public var toPosY:Number;
      
      internal var dist:Number;
      
      internal var planeSpd:Number;
      
      public var driveVec:Vec;
      
      internal var vehicleCurrentLap:int;
      
      public var main:Main;
      
      public var colFlag_isGoPhysObj:Boolean;
      
      public var colFlag_affectedByWake:Boolean;
      
      internal var inFrontZone:Poly;
      
      internal var currentMaxSpeed:Number;
      
      public var physObjOffsetY:Number;
      
      public var oldypos:Number;
      
      internal var ct1:ColorTransform = new ColorTransform();
      
      public var colFlag_isShop:Boolean;
      
      internal var turboFrame:int = 0;
      
      internal var scaleVel:Number;
      
      public var physObjOffsetX:Number;
      
      public var graphicID:int;
      
      internal var collisionHitFunction:Function;
      
      internal var textMessage:String;
      
      internal var physControlMode:int = 0;
      
      internal var minFrame:int;
      
      internal var rotVel:Number;
      
      public var yoffset:Number;
      
      internal var cowRenderBeam:Boolean;
      
      public var colFlag_canBeShot:Boolean;
      
      internal var health:Number;
      
      public var colFlag_isPowerup:Boolean;
      
      internal var maxFrame:int;
      
      internal var gateDisplayLights:Boolean;
      
      public var colFlag_isPlayer:Boolean;
      
      internal var flybyGenTimeMin:Number = 2;
      
      internal var vehicleAtMaxTurn:Boolean;
      
      public var physObjInitVarString:String;
      
      public var name:String;
      
      public var graphicID1:int;
      
      public var colFlag_canBePickedUp:Boolean;
      
      internal var isVehicle:Boolean;
      
      public var origspeed:Number;
      
      public var colFlag_isCheckpoint:Boolean;
      
      internal var hopHeight:int;
      
      public var xpos:Number;
      
      internal var wakeVal:Number;
      
      public var renderShadowFlag:Boolean;
      
      internal var ufoLineIndex:int;
      
      internal var ufoSpeed:Number;
      
      internal var renderSmooth:Boolean;
      
      public var frameVel:Number;
      
      public var xoffset:Number;
      
      public var active:Boolean;
      
      public var rlSkipDraw:Boolean;
      
      internal var flybyGenRadius:Number = 200;
      
      public var type:int;
      
      public var ypos:Number;
      
      public var frameVel1:Number;
      
      public var timer:Number;
      
      internal var appearingPickupIndex:int;
      
      public var colFlag_isOil:Boolean;
      
      internal var vehicleCheckpointIndex:int;
      
      public var hitTimer:Number;
      
      internal var flashFlag:Boolean;
      
      public var renderFunction:Function;
      
      internal var showArrowTimer:int;
      
      public var zpos:Number;
      
      public var colFlag_isBouncyPad:Boolean;
      
      internal var skidFrame:int = 0;
      
      public var updateFunction:Function;
      
      internal var totalVehicleCheckpointIndex:int;
      
      public var additive:Boolean;
      
      public var timerMax:Number;
      
      internal var flybyBombTimeMax:Number = 4;
      
      internal var parentObj:GameObj;
      
      internal var flashTimerMax:int;
      
      internal var isPhysObj:Boolean;
      
      public function GameObj(param1:*, param2:*, param3:*)
      {
         super();
         this.xpos = param2;
         this.ypos = param3;
         this.zpos = 1;
         this.starty = param2;
         this.startx = param2;
         this.active = false;
         this.killed = false;
         this.main = param1;
         this.zpos = 0;
         this.graphicID = 0;
         this.frame = 0;
         this.frameVel = 1;
         this.controlIndex = 0;
         this.timer = 0;
         this.timer1 = 0;
         this.radius = 14;
         this.minFrame = 0;
         this.maxFrame = 0;
         this.movementVec = new Vec();
      }
      
      internal function HitTumbleweed(param1:GameObj) : void
      {
         if(this.controlMode != 0)
         {
            return;
         }
         if(this.height < -5)
         {
            return;
         }
         if(param1.colFlag_isPlayer)
         {
            Game.AddHitObject("tumbleweed");
         }
         Game.AddDestroyedObject("tumbleweed");
         param1.VehicleHitObject(this);
         this.frame = 0;
         this.frameVel = 1;
         this.controlMode = 1;
      }
      
      internal function HitCrate(param1:GameObj) : void
      {
         if(this.controlMode != 0)
         {
            return;
         }
         param1.VehicleHitObject(this);
         if(this.type == 0)
         {
            if(param1.colFlag_isPlayer == false)
            {
               return;
            }
            Game.UnlockBalloons();
         }
         var _loc2_:Number = param1.xpos - param1.oldxpos;
         var _loc3_:Number = param1.ypos - param1.oldypos;
         this.movementVec.SetFromDxDy(_loc2_,_loc3_);
         this.movementVec.AddRot(Utils.RandBetweenFloat(-0.2,0.2));
         this.controlMode = 1;
         this.frameVel = 1;
         this.frame = 0;
         if(param1.colFlag_isPlayer)
         {
            Game.AddHitObject("crate");
         }
         Game.AddDestroyedObject("crate");
         if(param1.colFlag_isPlayer)
         {
            Game.AddScore(Game.score_breakage);
            SoundPlayer.Play("sfx_hit_crate");
         }
      }
      
      internal function InitStaticObject_Animated_Half_FarZ() : void
      {
         this.sortByY = true;
         this.frameVel = 0.5;
         this.frame = Utils.RandBetweenInt(0,GraphicObjects.GetNumFrames(this.graphicID) - 1);
         this.updateFunction = this.UpdateStaticObject_Animated;
      }
      
      internal function RenderCoconut() : void
      {
         this.RenderSimpleShadow(4);
         this.RenderObjAt(this.xpos,this.ypos + this.height,this.graphicID,this.frame);
      }
      
      internal function GetHitterSpeed(param1:GameObj) : Number
      {
         var _loc2_:Number = param1.xpos - param1.oldxpos;
         var _loc3_:Number = param1.ypos - param1.oldypos;
         return Math.sqrt(_loc2_ * _loc2_ + _loc3_ * _loc3_);
      }
      
      internal function UpdateOil() : *
      {
         if(this.controlMode == 1)
         {
            if(this.PlayAnimation())
            {
               this.killed = false;
            }
         }
      }
      
      internal function InitFlybyPlaneGenerator1_long() : *
      {
         this.InitFlybyPlaneGenerator();
         this.type = 0;
         this.timer1 = Defs.fps * 20;
      }
      
      internal function InitCornerMarker() : void
      {
         var _loc1_:Number = NaN;
         if(Game.camera.minX == 12345678)
         {
            Game.camera.minX = this.xpos;
            Game.camera.minY = this.ypos;
         }
         else if(Game.camera.maxX == 12345678)
         {
            Game.camera.maxX = this.xpos;
            Game.camera.maxY = this.ypos;
         }
         else
         {
            FlashConnect.trace("Too many corner markers");
         }
         if(Game.camera.minX > Game.camera.maxX)
         {
            _loc1_ = Game.camera.minX;
            Game.camera.minX = Game.camera.maxX;
            Game.camera.maxX = _loc1_;
         }
         if(Game.camera.minY > Game.camera.maxY)
         {
            _loc1_ = Game.camera.minY;
            Game.camera.minY = Game.camera.maxY;
            Game.camera.maxY = _loc1_;
         }
         this.killed = true;
         FlashConnect.trace("scrollW " + int(Game.camera.maxX - Game.camera.minX));
         FlashConnect.trace("scrollH " + int(Game.camera.maxY - Game.camera.minY));
      }
      
      internal function UpdateSandcastle() : void
      {
         if(this.controlMode == 1)
         {
            if(this.PlayAnimation())
            {
               this.killed = false;
            }
         }
      }
      
      internal function InitSkidLayer() : void
      {
         this.updateFunction = this.UpdateSkidLayer;
         this.renderFunction = this.RenderSkidLayer;
      }
      
      internal function UpdateCrate() : void
      {
         var _loc1_:String = null;
         var _loc2_:int = 0;
         var _loc3_:Number = NaN;
         var _loc4_:Number = NaN;
         if(this.controlMode == 1)
         {
            this.xpos += this.movementVec.GetXComponent();
            this.ypos += this.movementVec.GetYComponent();
            if(this.PlayAnimation())
            {
               if(this.type == 1)
               {
                  this.killed = true;
               }
               else
               {
                  this.controlMode = 2;
                  this.timer = Defs.fps;
               }
            }
         }
         else if(this.controlMode == 2)
         {
            _loc2_ = Utils.RandBetweenInt(0,2);
            if(_loc2_ == 0)
            {
               _loc1_ = "balloon_red";
            }
            if(_loc2_ == 1)
            {
               _loc1_ = "balloon_blue";
            }
            if(_loc2_ == 2)
            {
               _loc1_ = "balloon_yellow";
            }
            _loc3_ = Utils.RandBetweenFloat(-9,9);
            _loc4_ = Utils.RandBetweenFloat(-9,9);
            Game.AddGameObjectAt(_loc1_,this.xpos + _loc3_,this.ypos + _loc4_,0,"","");
            --this.timer;
            if(this.timer <= 0)
            {
               this.killed = true;
            }
         }
      }
      
      internal function InitHotAirBalloon() : *
      {
         var _loc1_:Number = Utils.DegToRad(Utils.RandBetweenFloat(-10,10));
         this.updateFunction = this.UpdateHotAirBalloon;
         this.frame = 0;
         this.sortByY = true;
         this.zbodge = -1000;
         this.controlMode = 0;
         this.movementVec.Set(_loc1_,2);
      }
      
      internal function GameObj_UpdateCycleAnim() : void
      {
         this.CycleAnimation();
      }
      
      internal function InitCrate() : void
      {
         this.updateFunction = this.UpdateCrate;
         this.collisionHitFunction = this.HitCrate;
         this.controlMode = 0;
         this.colFlag_isGoPhysObj = true;
         this.colOffsetX = 0;
         this.colOffsetY = -7;
         this.radius = 15;
         this.movementVec = new Vec();
         this.height = 0;
         this.sortByY = true;
         this.frame = 0;
      }
      
      internal function InitCone() : void
      {
         Game.AddObjectCount("cone");
         this.updateFunction = this.UpdateCone;
         this.collisionHitFunction = this.HitCone;
         this.renderFunction = this.RenderCone;
         this.controlMode = 0;
         this.colFlag_isGoPhysObj = true;
         this.colOffsetX = 0;
         this.colOffsetY = 0;
         this.radius = 10;
         this.movementVec = new Vec();
         this.height = 0;
         this.frameVel = 1;
         this.sortByY = true;
      }
      
      internal function RenderWake() : *
      {
         Utils.RenderCircle(this.bd,this.xpos - Game.camera.x,this.ypos - Game.camera.y,this.radius,4294934656);
      }
      
      internal function RenderNormally(param1:Boolean = true) : *
      {
         var _loc2_:Number = int(this.xpos);
         var _loc3_:Number = int(this.ypos);
         if(param1)
         {
            _loc2_ -= int(Game.camera.x);
            _loc3_ -= int(Game.camera.y);
         }
         if(_loc2_ < -1000)
         {
            return;
         }
         if(_loc2_ > Defs.displayarea_w + 500)
         {
            return;
         }
         if(_loc3_ < -1000)
         {
            return;
         }
         if(_loc3_ > Defs.displayarea_h + 500)
         {
            return;
         }
         if(this.scale != 1 || this.dir != 0)
         {
            GraphicObjects.RenderAtRotScaled(this.graphicID,this.frame,this.bd,_loc2_,_loc3_,this.scale,this.dir,null,this.renderSmooth);
         }
         else
         {
            GraphicObjects.RenderAt(this.graphicID,this.frame,this.bd,_loc2_,_loc3_);
         }
      }
      
      internal function InitFlybyJetGenerator1() : *
      {
         this.InitFlybyPlaneGenerator();
         this.type = 0;
         this.timer1 = Defs.fps * 10;
         this.speed = 24;
      }
      
      internal function InitFlybyJetGenerator2() : *
      {
         this.InitFlybyPlaneGenerator();
         this.type = 1;
         this.timer1 = Defs.fps * 10;
         this.speed = 24;
      }
      
      internal function InitFlybyJetGenerator3() : *
      {
         this.InitFlybyPlaneGenerator();
         this.type = 2;
         this.timer1 = Defs.fps * 10;
         this.speed = 24;
      }
      
      internal function UpdateStartLights() : void
      {
         if(Game.levelState == Game.levelState_LevelStart)
         {
            this.frame = Game.startCountdownTime;
            this.frame = Utils.LimitNumber(0,4,this.frame);
            this.frame = 4 - this.frame;
         }
         else
         {
            this.frame = 4;
         }
      }
      
      internal function InitStaticObject() : void
      {
         this.sortByY = true;
         ++Game.numStaticObjects;
      }
      
      internal function InitFruitSequence() : void
      {
         Game.AddObjectCount("fruit_sequence");
         this.name = "fruit";
         this.type = 0;
         this.collisionHitFunction = this.HitFruitSequence;
         this.updateFunction = this.UpdateFruitSequence;
         this.renderFunction = this.RenderFruitSequence;
         this.controlMode = 0;
         this.movementVec = new Vec();
         this.movementVec.SetAng(Utils.RandCircle());
         this.movementVec.speed = Utils.RandBetweenFloat(1,4);
         this.zpos = -1000;
         this.frame = Utils.RandBetweenInt(0,5);
         this.colFlag_isGoPhysObj = true;
         this.colOffsetX = 0;
         this.colOffsetY = -9;
         this.radius = 15;
      }
      
      internal function UpdateFruit() : void
      {
         this.scale += this.zvel;
         this.zvel += 0.01;
         this.alpha -= 0.02;
         if(this.alpha <= 0)
         {
            this.alpha = 0;
            this.killed = true;
         }
      }
      
      internal function InitFlybyJetGenerator4() : *
      {
         this.InitFlybyPlaneGenerator();
         this.type = 3;
         this.timer1 = Defs.fps * 10;
         this.speed = 24;
      }
      
      public function InitMessage(param1:int) : void
      {
         this.updateFunction = this.UpdateMessage;
         this.timer = Defs.fps * 0.8;
         this.frame = param1;
         this.graphicID = GraphicObjects.GetIndexByName("StartRaceText");
      }
      
      internal function UpdateSkidLayer() : void
      {
         Game.UpdateSkids();
      }
      
      internal function InitUFO() : *
      {
         this.renderFunction = this.RenderUFO;
         this.updateFunction = this.UpdateUFO;
         this.collisionHitFunction = this.HitUFO;
         this.controlMode = 0;
         this.frame = 0;
         this.colFlag_isGoPhysObj = true;
         this.colOffsetX = 0;
         this.colOffsetY = -20;
         this.radius = 80;
         this.sortByY = true;
         this.frameVel = 1;
         this.controlMode = 0;
         this.height = 10;
         this.timer = 0;
         this.frame = 0;
         this.height = -100;
         var _loc1_:Array = Game.GetLineListByType(7);
         this.ufoLine = _loc1_[0];
         this.ufoLineIndex = 0;
         this.controlMode = -1;
         this.timer = Defs.fps * 4;
         this.ufoSpeed = 5;
      }
      
      internal function HitBanana(param1:GameObj) : *
      {
         var _loc2_:Number = NaN;
         var _loc3_:Number = NaN;
         if(this.controlMode == 0)
         {
            if(param1.colFlag_isPlayer)
            {
               Game.AddHitObject("banana");
            }
            if(param1.colFlag_isPlayer)
            {
               SoundPlayer.Play("sfx_hit_banana");
            }
            this.controlMode = 1;
         }
         if(this.controlMode == 2)
         {
            if(this.GetHitterSpeed(param1) > 3)
            {
               if(param1.colFlag_isPlayer)
               {
                  Game.AddHitObject("banana");
               }
               if(param1.colFlag_isPlayer)
               {
                  SoundPlayer.Play("sfx_hit_banana");
               }
               param1.VehicleHitOil();
               this.controlMode = 3;
               this.frame = 10 - 1;
               _loc2_ = param1.xpos - param1.oldxpos;
               _loc3_ = param1.ypos - param1.oldypos;
               this.movementVec.SetFromDxDy(_loc2_,_loc3_);
               this.movementVec.AddRot(Utils.RandBetweenFloat(-0.2,0.2));
            }
         }
      }
      
      internal function IsInWorld(param1:Number) : Boolean
      {
         if(this.xpos < 0 - param1)
         {
            return false;
         }
         if(this.ypos < 0 - param1)
         {
            return false;
         }
         if(this.xpos > Defs.displayarea_w + param1)
         {
            return false;
         }
         if(this.ypos > Defs.displayarea_h + param1)
         {
            return false;
         }
         return true;
      }
      
      internal function InitFruit() : void
      {
         this.type = 0;
         this.updateFunction = this.UpdateFruit;
         this.renderFunction = this.RenderFruit;
         this.controlMode = 0;
         this.movementVec = new Vec();
         this.movementVec.SetAng(Utils.RandCircle());
         this.movementVec.speed = Utils.RandBetweenFloat(1,4);
         this.zpos = -1000;
         this.frame = Utils.RandBetweenInt(0,5);
         this.zvel = 0.3;
      }
      
      public function UpdatePickup() : *
      {
         this.CycleAnimation();
      }
      
      internal function InitBanana() : void
      {
         Game.AddObjectCount("banana");
         this.updateFunction = this.UpdateBanana;
         this.collisionHitFunction = this.HitBanana;
         this.controlMode = 0;
         this.colFlag_isGoPhysObj = true;
         this.colOffsetX = 0;
         this.colOffsetY = -5;
         this.radius = 15;
         this.zpos = 500;
         this.frame = 0;
      }
      
      internal function HitBomb(param1:GameObj) : void
      {
         var _loc2_:PhysObj_Instance = null;
         if(this.controlMode == 0)
         {
            return;
         }
         param1.VehicleHitObject(this);
         Game.AddDestroyedObject("bomb");
         if(param1.colFlag_isPlayer)
         {
            SoundPlayer.Play("sfx_hit_snow");
            Game.AddHitObject("bomb");
            _loc2_ = param1.physObjInst;
            _loc2_.DoJump();
            Game.levelFunctions.TriggerAction(1);
         }
         this.colFlag_isGoPhysObj = false;
      }
      
      internal function InitFlybyPlaneGenerator2_long() : *
      {
         this.InitFlybyPlaneGenerator();
         this.type = 1;
         this.timer1 = Defs.fps * 20;
      }
      
      internal function InitBalloon() : void
      {
         this.updateFunction = this.UpdateBalloon;
         this.renderFunction = this.RenderBalloon;
         this.controlMode = 0;
         this.height = 0;
         this.yvel = -2;
         this.sortByY = true;
         this.startx = this.xpos;
         this.timer = Utils.RandBetweenInt(0,1000);
         this.frameVel = 1;
         this.alpha = 0;
         this.movementVec.Set(Utils.RandCircle(),Utils.RandBetweenFloat(0.1,0.2));
         this.xpos1 = this.xpos;
         this.ypos1 = this.ypos;
      }
      
      internal function HitSlalomGate(param1:GameObj) : *
      {
         if(this.controlMode != 0)
         {
            return;
         }
      }
      
      public function Update() : void
      {
         if(this.updateFunction != null)
         {
            this.updateFunction();
         }
         if(this.sortByY)
         {
            this.zpos = 0 - this.ypos * 0.01;
            this.zpos += this.zbodge;
         }
      }
      
      internal function InitSmashObject() : void
      {
         Game.AddObjectCount("smash_object");
         this.updateFunction = this.UpdateSmashObject;
         this.collisionHitFunction = this.HitSmashObject;
         this.controlMode = 0;
         this.colFlag_isGoPhysObj = true;
         this.colOffsetX = 0;
         this.colOffsetY = 0;
         this.radius = 10;
         this.movementVec = new Vec();
         this.height = 0;
         this.sortByY = true;
      }
      
      internal function RenderBeachBall() : void
      {
         this.RenderSimpleShadow(2);
         this.RenderObjAt(this.xpos,this.ypos + this.height,this.graphicID,this.frame);
      }
      
      internal function RenderCoconutHalf() : void
      {
         this.RenderSimpleShadow(4);
         this.RenderObjAt(this.xpos,this.ypos + this.height,this.graphicID,this.frame);
      }
      
      internal function InitFlybyUFO() : *
      {
         this.renderFunction = this.RenderUFO;
         this.updateFunction = this.UpdateFlybyUFO;
         this.controlMode = 0;
         this.frame = 0;
         this.sortByY = true;
         this.frameVel = 1;
         this.minFrame = 1 - 1;
         this.maxFrame = 4 - 1;
         this.controlMode = 0;
         this.frame = 0;
         this.height = -100;
      }
      
      internal function InitBombStatic() : *
      {
         Game.AddObjectCount("bomb");
         this.updateFunction = this.UpdateBombStatic;
         this.collisionHitFunction = this.HitBombStatic;
         this.graphicID = GraphicObjects.GetIndexByName("Bomb");
         this.frame = 0;
         this.zvel = 0;
         this.sortByY = true;
         this.frameVel = 1;
         this.colFlag_isGoPhysObj = true;
         this.colOffsetX = 5;
         this.colOffsetY = -10;
         this.radius = 10;
      }
      
      internal function UpdateStaticObject_Animated() : void
      {
         this.CycleAnimation();
      }
      
      internal function HitCow(param1:GameObj) : *
      {
      }
      
      internal function InitSortByY() : void
      {
         this.sortByY = true;
      }
      
      internal function InitStaticObject_Animated_FarZ() : void
      {
         this.sortByY = true;
         this.frameVel = 1;
         this.frame = Utils.RandBetweenInt(0,GraphicObjects.GetNumFrames(this.graphicID) - 1);
         this.updateFunction = this.UpdateStaticObject_Animated;
      }
      
      public function InitPhysicsObject(param1:int, param2:int, param3:Number = 0, param4:Number = 0, param5:String = "", param6:Boolean = false) : *
      {
         this.colFlag_isPhysObj = true;
         this.physObjOffsetX = param3;
         this.physObjOffsetY = param4;
         this.isPhysObj = true;
         this.graphicID = param1;
         this.frame = param2;
         this.updateFunction = this.UpdatePhysicsObject;
         this.renderShadowFlag = param6;
         this.physObjInitVarString = param5;
      }
      
      internal function UpdateBellBuoy() : void
      {
         var _loc1_:PhysObj_Instance = null;
         var _loc2_:GameObj = null;
         var _loc3_:Number = NaN;
         this.UpdateEdgeMarker();
         _loc1_ = Game.GetPlayerInstance();
         _loc2_ = _loc1_.GetGameObject(0);
         --this.bellTimer;
         if(this.bellTimer <= 0)
         {
            this.bellTimer = 0;
            _loc3_ = 50 * 50;
            if(Utils.Dist2BetweenPoints(this.xpos,this.ypos,_loc2_.xpos,_loc2_.ypos) < _loc3_)
            {
               SoundPlayer.Play("sfx_bellbuoy");
               this.bellTimer = Defs.fps * 3;
            }
         }
      }
      
      internal function ReadySetGoFinishedRace() : void
      {
         this.controlMode = 2;
      }
      
      internal function InitStaticObject_Animated_Half() : void
      {
         this.sortByY = true;
         this.frameVel = 0.5;
         this.frame = Utils.RandBetweenInt(0,GraphicObjects.GetNumFrames(this.graphicID) - 1);
         this.updateFunction = this.UpdateStaticObject_Animated;
      }
      
      public function Init(param1:int) : void
      {
         var _loc2_:int = 0;
         var _loc3_:Number = 0;
         this.type = param1;
         this.controlMode = _loc2_;
         this.xvel = _loc3_;
         this.yvel = _loc3_;
         this.frame = _loc3_;
         this.frameVel = _loc3_;
         this.timer = _loc3_;
         this.hitTimer = _loc3_;
         this.flashTimer = _loc2_;
         this.flashFlag = false;
         this.dir = 0;
         this.todir = 0;
         this.health = 1;
         this.zvel = 0;
         this.name = "";
         this.scale = 1;
         this.objectDef = null;
         this.xflip = false;
         this.updateFunction = null;
         this.renderFunction = null;
         this.visible = true;
         this.renderShadowFlag = false;
         this.ClearColFlags();
         this.isPhysObj = false;
         this.additive = false;
         this.alpha = 1;
         this.xpos1 = 0;
         this.ypos1 = 0;
         this.renderSmooth = true;
         this.frameVel = 1;
         this.isVehicle = false;
         this.sortByY = false;
         this.killed = false;
         this.collisionHitFunction = null;
         this.zbodge = 0;
      }
      
      internal function InitCrate_Bonus() : void
      {
         this.InitCrate();
         this.type = 0;
      }
      
      internal function HitCone(param1:GameObj) : void
      {
         if(this.controlMode != 0)
         {
            return;
         }
         if(this.GetHitterSpeed(param1) < 5)
         {
            return;
         }
         if(param1.colFlag_isPlayer)
         {
            SoundPlayer.Play("sfx_hit_cone");
         }
         if(param1.colFlag_isPlayer)
         {
            Game.AddHitObject("cone");
         }
         param1.VehicleHitObject(this);
         var _loc2_:Number = param1.xpos - param1.oldxpos;
         var _loc3_:Number = param1.ypos - param1.oldypos;
         this.movementVec.SetFromDxDy(_loc2_,_loc3_);
         this.movementVec.AddRot(Utils.RandBetweenFloat(-0.2,0.2));
         this.movementVec.speed *= 0.7;
         this.controlMode = 1;
         this.zvel = -Utils.ScaleToAndLimit(0,5,0,10,this.GetHitterSpeed(param1));
         this.frame = 1;
         this.minFrame = 1;
         this.maxFrame = Utils.RandBetweenInt(8,GraphicObjects.GetNumFrames(this.graphicID) - 1);
      }
      
      internal function InitCoconutHalf() : void
      {
         Game.AddObjectCount("coconut_half");
         this.updateFunction = this.UpdateCoconutHalf;
         this.collisionHitFunction = this.HitCoconutHalf;
         this.renderFunction = this.RenderCoconutHalf;
         this.controlMode = 0;
         this.colFlag_isGoPhysObj = true;
         this.colOffsetX = 0;
         this.colOffsetY = -10;
         this.radius = 14;
         this.movementVec = new Vec();
         this.height = 0;
         this.sortByY = true;
      }
      
      internal function InitFlyingBird() : void
      {
         this.rlSkipDraw = true;
         this.updateFunction = this.UpdateFlyingBird;
         this.renderFunction = this.RenderFlyingBird;
         this.controlMode = 0;
         this.movementVec = new Vec();
         this.height = -150;
         this.sortByY = false;
         this.zpos = 0;
         this.speed = 8;
         this.startx = this.xpos;
         this.starty = this.ypos;
         this.frame = 15 - 1;
         this.frameVel = 1;
         this.timer = this.timerMax = Defs.fps * 20;
      }
      
      internal function UpdateBird() : void
      {
         if(this.controlMode == 0)
         {
            this.minFrame = 1 - 1;
            this.maxFrame = 8 - 1;
            this.frameVel = 1;
            if(this.PlayAnimationEx())
            {
               this.timer = Utils.RandBetweenInt(10,30);
               this.controlMode = 1;
            }
         }
         else if(this.controlMode == 1)
         {
            this.frame = 0;
            --this.timer;
            if(this.timer <= 0)
            {
               this.controlMode = 0;
            }
         }
         else if(this.controlMode == 2)
         {
            this.minFrame = 14 - 1;
            this.maxFrame = 20 - 1;
            this.height += this.zvel;
            if(this.height <= -100)
            {
               this.zvel += 0.1;
               if(this.zvel >= 1)
               {
                  this.zvel = 1;
               }
            }
            this.CycleAnimationEx();
            this.movementVec.Set(this.birdDir,this.speed);
            this.speed += 0.1;
            if(this.speed > 10)
            {
               this.speed = 10;
            }
            this.xpos += this.movementVec.GetXComponent();
            this.ypos += this.movementVec.GetYComponent();
         }
      }
      
      internal function InitSnowGenerator() : void
      {
         this.updateFunction = this.UpdateSnowGenerator;
         this.timer = 0;
         this.visible = false;
      }
      
      internal function InitHaybale() : void
      {
         this.InitSmashObject();
         this.colOffsetX = 0;
         this.colOffsetY = -5;
         this.radius = 16;
      }
      
      internal function UpdateHotAirBalloon() : *
      {
         var _loc1_:Number = NaN;
         this.xpos += this.movementVec.GetUnitXComponent();
         this.ypos += this.movementVec.GetUnitYComponent();
         if(this.xpos >= Game.camera.maxX + 64)
         {
            _loc1_ = Utils.DegToRad(Utils.RandBetweenFloat(-10,10));
            this.movementVec.Set(_loc1_,2);
            this.xpos = Game.camera.minX - 64;
         }
      }
      
      internal function HitOil(param1:GameObj) : *
      {
         if(this.controlMode != 0)
         {
            return;
         }
         if(param1.turboMode == 2)
         {
            if(param1.colFlag_isPlayer)
            {
               SoundPlayer.Play("sfx_hit_igniteflame");
            }
            if(param1.colFlag_isPlayer)
            {
               Game.AddScore(Game.score_oilburn);
            }
            Game.AddDestroyedObject("oil");
            this.graphicID = GraphicObjects.GetIndexByName("fx_fires");
            this.controlMode = 1;
            this.frameVel = 1;
            this.frame = 0;
            param1.VehicleHitOil();
            return;
         }
      }
      
      public function CycleAnimation() : void
      {
         var _loc1_:Number = this.frameVel;
         var _loc2_:int = GraphicObjects.GetNumFrames(this.graphicID);
         this.frame += _loc1_;
         if(this.frame >= _loc2_)
         {
            this.frame -= _loc2_;
         }
         if(this.frame < 0)
         {
            this.frame += _loc2_;
         }
      }
      
      internal function UpdateTextMessage() : *
      {
         --this.timer;
         if(this.timer <= 0)
         {
            this.killed = true;
         }
      }
      
      internal function SetAnim(param1:int) : *
      {
         var _loc2_:int = 0;
         this.graphicID = param1;
         _loc2_ = GraphicObjects.GetNumFrames(this.graphicID) - 1;
         if(this.frame >= _loc2_)
         {
            this.frame = 0;
         }
      }
      
      internal function RenderBomb() : *
      {
         this.RenderSimpleShadow(2);
         this.RenderObjAt(this.xpos,this.ypos + this.height,this.graphicID,this.frame);
      }
      
      internal function UpdateBombStatic() : *
      {
         if(this.controlMode == 0)
         {
            this.CycleAnimation();
         }
         else
         {
            this.frameVel = 0.5;
            if(this.PlayAnimation())
            {
               this.killed = true;
            }
         }
      }
      
      internal function UpdateSplashFX() : void
      {
         if(this.PlayAnimation())
         {
            this.killed = true;
         }
      }
      
      internal function InitFloorTile() : void
      {
         var _loc1_:GameObj = new GameObj(this.main,this.xpos,this.ypos);
         _loc1_.graphicID = this.graphicID;
         _loc1_.frame = this.frame;
         _loc1_.visible = true;
         _loc1_.renderFunction = null;
         _loc1_.scale = 1;
         _loc1_.dir = 0;
         Game.floorTiles.push(_loc1_);
         ++Game.numFloorTiles;
         this.active = false;
      }
      
      internal function GameObj_InitCycleAnim() : void
      {
         this.updateFunction = this.GameObj_UpdateCycleAnim;
         this.frameVel = 1;
      }
      
      internal function InitSlalomGateL() : *
      {
         this.InitSlalomGate();
      }
      
      internal function UpdateFruitSequence() : void
      {
         if(this.controlMode != 0)
         {
            this.zvel = 0.3;
            this.scale += this.zvel;
            this.zvel += 0.01;
            this.alpha -= 0.05;
            if(this.alpha <= 0)
            {
               this.alpha = 0;
               this.killed = true;
            }
         }
      }
      
      internal function InitSlalomGateR() : *
      {
         this.InitSlalomGate();
      }
      
      internal function RenderBalloon() : void
      {
         this.RenderSimpleShadow(4);
         var _loc1_:Number = this.ypos;
         this.ypos += this.height;
         this.RenderNormallyAlpha();
         this.ypos = _loc1_;
      }
      
      internal function UpdateCoconut() : void
      {
         if(this.controlMode == 0)
         {
         }
         if(this.controlMode == 1)
         {
            this.zvel += 0.4;
            this.height += this.zvel;
            if(this.height >= 0)
            {
               this.height = 0;
               this.movementVec.speed *= 0.5;
               this.zvel *= -0.6;
               if(this.movementVec.speed <= 0.4)
               {
                  this.controlMode = 0;
               }
            }
            this.xpos += this.movementVec.GetXComponent();
            this.ypos += this.movementVec.GetYComponent();
         }
      }
      
      internal function InitTumbleweed() : void
      {
         Game.AddObjectCount("tumbleweed");
         this.updateFunction = this.UpdateTumbleweed;
         this.collisionHitFunction = this.HitTumbleweed;
         this.renderFunction = this.RenderTumbleweed;
         this.controlMode = 0;
         this.colFlag_isGoPhysObj = true;
         this.colOffsetX = 0;
         this.colOffsetY = 0;
         this.radius = 10;
         this.movementVec = new Vec();
         this.height = 0;
         this.xvel = Utils.RandBetweenFloat(5,10);
         this.sortByY = true;
      }
      
      internal function InitSnowman() : void
      {
         Game.AddObjectCount("snowman");
         this.updateFunction = this.UpdateSnowman;
         this.collisionHitFunction = this.HitSnowman;
         this.controlMode = 0;
         this.colFlag_isGoPhysObj = true;
         this.colOffsetX = 0;
         this.colOffsetY = 0;
         this.radius = 15;
         this.movementVec = new Vec();
         this.height = 0;
         this.sortByY = true;
      }
      
      internal function HitSheep(param1:GameObj) : *
      {
      }
      
      internal function UpdateBanana() : *
      {
         if(this.controlMode == 1)
         {
            this.minFrame = 1 - 1;
            this.maxFrame = 9 - 1;
            this.frameVel = 1;
            if(this.PlayAnimationEx())
            {
               this.controlMode = 2;
            }
         }
         if(this.controlMode == 3)
         {
            this.minFrame = 10 - 1;
            this.maxFrame = 16 - 1;
            this.frameVel = 0.5;
            if(this.PlayAnimationEx())
            {
               this.controlMode = 2;
            }
            this.xpos += this.movementVec.GetXComponent();
            this.ypos += this.movementVec.GetYComponent();
            this.movementVec.speed -= 0.1;
            if(this.movementVec.speed <= 0)
            {
               this.movementVec.speed = 0;
            }
         }
      }
      
      internal function InitTrackPiece() : void
      {
         var _loc1_:GameObj = new GameObj(this.main,this.xpos,this.ypos);
         _loc1_.graphicID = this.graphicID;
         _loc1_.frame = this.frame;
         _loc1_.visible = true;
         _loc1_.renderFunction = null;
         _loc1_.scale = 1;
         _loc1_.dir = 0;
         Game.trackPieces.push(_loc1_);
         ++Game.numTrackPieces;
         this.active = false;
      }
      
      public function Render(param1:BitmapData) : void
      {
         this.bd = param1;
         if(this.visible == false)
         {
            return;
         }
         if(this.renderFunction != null)
         {
            this.renderFunction();
         }
         else
         {
            this.RenderNormally();
         }
      }
      
      internal function InitPlayerVehicle() : void
      {
         this.sortByY = true;
         this.updateFunction = this.UpdatePlayerVehicle;
         this.renderFunction = this.RenderPlayerVehicle;
         this.SetCarColor(Game.playerCarColorIndex);
         this.skidFrame = 0;
         this.isVehicle = true;
         this.colOffsetX = 0;
         this.colOffsetY = 0;
         this.radius = 20;
         this.vehicleAtMaxTurn = false;
         this.colFlag_isPlayer = true;
         this.physControlMode = 0;
      }
      
      internal function UpdateWaterSplash() : void
      {
         if(this.PlayAnimation())
         {
            this.killed = true;
         }
      }
      
      internal function RenderRaceQueen() : void
      {
         this.RenderNormallyAlpha();
      }
      
      internal function InitStartLights() : void
      {
         this.updateFunction = this.UpdateStartLights;
         this.controlMode = 0;
         this.frame = 0;
         this.frameVel = 1;
         this.sortByY = true;
      }
      
      internal function RenderCarShadowAt(param1:Number, param2:Number, param3:int) : *
      {
         var _loc4_:Number = int(param1) - int(Game.camera.x);
         var _loc5_:Number = int(param2) - int(Game.camera.y);
         if(_loc4_ < -1000)
         {
            return;
         }
         if(_loc4_ > Defs.displayarea_w + 500)
         {
            return;
         }
         if(_loc5_ < -1000)
         {
            return;
         }
         if(_loc5_ > Defs.displayarea_h + 500)
         {
            return;
         }
         _loc4_ -= 2;
         _loc5_ -= 2;
         _loc4_ += this.height * 0.5;
         _loc5_ += this.height * 0.5;
         var _loc6_:int = GraphicObjects.GetIndexByName("BoatShadow");
         _loc4_ -= 32;
         _loc5_ -= 32;
         var _loc7_:int = param3 % 16;
         var _loc8_:int = param3 / 16;
         var _loc9_:int = _loc7_ * 64;
         var _loc10_:int = _loc8_ * 64;
         var _loc11_:Rectangle = new Rectangle(0,0,64,64);
         GraphicObjects.RenderAtRotScaled_SourceRect(_loc6_,0,this.bd,_loc4_,_loc5_,this.scale,0,null,false,_loc11_,_loc9_,_loc10_);
      }
      
      internal function UpdateFlyingBird() : void
      {
         this.minFrame = 15 - 1;
         this.maxFrame = 21 - 1;
         this.CycleAnimationEx();
         this.movementVec.Set(this.birdDir,this.speed);
         this.xpos += this.movementVec.GetXComponent();
         this.ypos += this.movementVec.GetYComponent();
         --this.timer;
         if(this.timer <= 0)
         {
            this.xpos = this.startx;
            this.ypos = this.starty;
            this.timer = this.timerMax;
         }
      }
      
      internal function InitEdgeMarker() : void
      {
         this.zbodge = 1000;
         this.colFlag_affectedByWake = true;
         this.scale = 1;
         this.sortByY = true;
         this.graphicID = GraphicObjects.GetIndexByName("GuideB");
         this.frame = 0;
         this.updateFunction = this.UpdateEdgeMarker;
         this.startx = this.xpos;
         this.starty = this.ypos;
         this.radius = 1;
         this.speed = 1;
         this.toPosX = 0;
         this.toPosY = 0;
         this.xvel = 0;
         this.yvel = 0;
         this.xpos1 = 0;
         this.ypos1 = 0;
         this.timer = 0;
         this.timer1 = 0;
         this.frame = Utils.RandBetweenInt(0,GraphicObjects.GetNumFrames(this.graphicID) - 1);
         this.frameVel = 0.3;
         this.wakeVal = 0;
      }
      
      internal function InitFlybyPlane() : *
      {
         this.rlSkipDraw = true;
         this.zbodge = -1000;
         this.updateFunction = this.UpdateFlybyPlane;
         this.controlMode = 0;
         this.frame = 0;
         this.sortByY = true;
         this.controlMode = 0;
         this.timer1 = Defs.fps * 35;
         this.movementVec.Set(this.planeDir,this.planeSpd);
         this.startx = this.xpos;
         this.starty = this.ypos;
      }
      
      internal function RenderFruitSequence() : void
      {
         this.RenderNormallyAlpha();
      }
      
      internal function UpdateSheep() : *
      {
         if(this.controlMode == 0)
         {
            if(this.PlayAnimation())
            {
               this.controlMode = 1;
               this.timer = Utils.RandBetweenInt(Defs.fps * 1,Defs.fps * 3);
            }
         }
         else
         {
            --this.timer;
            if(this.timer <= 0)
            {
               this.frame = 0;
               this.controlMode = 0;
            }
         }
      }
      
      internal function InitFlyingBird1() : void
      {
         this.InitFlyingBird();
         this.birdDir = Utils.DegToRad(135);
         this.type = 0;
      }
      
      internal function InitFlyingBird2() : void
      {
         this.InitFlyingBird();
         this.birdDir = Utils.DegToRad(225);
         this.type = 1;
      }
      
      public function GetVelFromDir(param1:Number) : *
      {
         this.xvel = Math.cos(this.dir) * param1;
         this.yvel = Math.sin(this.dir) * param1;
      }
      
      public function UpdatePhysicsObject() : *
      {
      }
      
      internal function RenderCone() : void
      {
         this.RenderSimpleShadow(4);
         this.RenderObjAt(this.xpos,this.ypos + this.height,this.graphicID,this.frame);
      }
      
      internal function HitSnowman(param1:GameObj) : void
      {
         if(this.controlMode != 0)
         {
            return;
         }
         param1.VehicleHitObject(this);
         if(param1.colFlag_isPlayer)
         {
            SoundPlayer.Play("sfx_hit_snow");
         }
         if(param1.colFlag_isPlayer)
         {
            Game.AddHitObject("snowman");
         }
         Game.AddDestroyedObject("snowman");
         this.controlMode = 1;
         this.frameVel = 1;
         this.frame = 0;
      }
      
      internal function UpdateTumbleweed() : void
      {
         if(this.controlMode == 0)
         {
            this.xpos += this.xvel;
            this.zvel += 0.4;
            this.height += this.zvel;
            if(this.height >= 0)
            {
               this.height = 0;
               this.zvel = -Utils.RandBetweenFloat(1,4);
            }
            if(this.xpos > Game.camera.maxX + 30)
            {
               this.xpos = Game.camera.minX - 30;
               this.xvel = Utils.RandBetweenFloat(5,10);
            }
         }
         else if(this.controlMode == 1)
         {
            this.xvel *= 0.9;
            this.xpos += this.xvel;
            if(this.PlayAnimation())
            {
               this.killed = true;
            }
         }
      }
      
      internal function UpdateSmoke() : void
      {
         this.xpos += this.xvel;
         this.ypos += this.yvel;
         if(this.PlayAnimation())
         {
            this.killed = true;
         }
      }
      
      internal function InitBird() : void
      {
         this.rlSkipDraw = true;
         Game.AddObjectCount("bird");
         this.updateFunction = this.UpdateBird;
         this.collisionHitFunction = this.HitBird;
         this.renderFunction = this.RenderBird;
         this.controlMode = 0;
         this.colFlag_isGoPhysObj = true;
         this.colOffsetX = 0;
         this.colOffsetY = 0;
         this.radius = 50;
         this.movementVec = new Vec();
         this.height = 0;
         this.sortByY = true;
      }
      
      internal function InitSheep() : *
      {
         this.updateFunction = this.UpdateSheep;
         this.collisionHitFunction = this.HitSheep;
         this.controlMode = 0;
         this.frame = 0;
         this.colFlag_isGoPhysObj = true;
         this.colOffsetX = 0;
         this.colOffsetY = 0;
         this.radius = 10;
         this.sortByY = true;
         this.frame = Utils.RandBetweenInt(0,3);
         this.frameVel = 1;
      }
      
      internal function UpdateDirt() : void
      {
         this.xpos += this.xvel;
         this.ypos += this.yvel;
         if(this.PlayAnimation())
         {
            this.killed = true;
         }
      }
      
      internal function InitGate() : *
      {
         this.renderFunction = this.RenderGate;
         this.gateDisplayLights = false;
      }
      
      internal function RenderCollision() : void
      {
         if(Debug.IsSet(1) == false)
         {
            return;
         }
         if(this.colFlag_isGoPhysObj == false)
         {
            return;
         }
         var _loc1_:Number = 0;
         var _loc2_:Number = 0;
         _loc1_ += this.xpos;
         _loc1_ -= Game.camera.x;
         _loc1_ += this.colOffsetX;
         _loc2_ += this.ypos;
         _loc2_ -= Game.camera.y;
         _loc2_ += this.colOffsetY;
         Utils.RenderCircle(this.bd,_loc1_,_loc2_,this.radius,4294967295);
      }
      
      internal function InitSmoke(param1:GameObj, param2:Number, param3:Number) : void
      {
         var _loc4_:Number = NaN;
         this.sortByY = true;
         this.frame = 0;
         this.frameVel = Utils.RandBetweenFloat(0.5,1);
         this.updateFunction = this.UpdateSmoke;
         this.graphicID = GraphicObjects.GetIndexByName("FX_Smoke");
         this.xpos += Utils.RandBetweenFloat(-3,3);
         this.ypos += Utils.RandBetweenFloat(-3,3);
         param2 = Utils.RandCircle();
         param3 = Utils.RandBetweenFloat(0,0.5);
         _loc4_ = param3;
         this.xvel = Math.cos(param2) * _loc4_;
         this.yvel = Math.sin(param2) * _loc4_;
      }
      
      internal function UpdateEdgeMarker() : void
      {
         var _loc1_:Number = NaN;
         var _loc2_:Number = NaN;
         _loc1_ = 0.01;
         _loc2_ = 0.1;
         var _loc3_:Number = 150 * 150;
         this.speed = 1;
         if(this.wakeVal != 0)
         {
            this.speed = 10;
         }
         _loc1_ *= this.speed;
         _loc2_ *= this.speed;
         if(this.xpos1 > this.toPosX)
         {
            this.xvel -= _loc1_;
            if(this.xvel < -_loc2_)
            {
               this.xvel = -_loc2_;
            }
         }
         else if(this.xpos1 < this.toPosX)
         {
            this.xvel += _loc1_;
            if(this.xvel > _loc2_)
            {
               this.xvel = _loc2_;
            }
         }
         this.xpos1 += this.xvel;
         this.xpos = this.startx + this.xpos1;
         if(this.ypos1 > this.toPosY)
         {
            this.yvel -= _loc1_;
            if(this.yvel < -_loc2_)
            {
               this.yvel = -_loc2_;
            }
         }
         else if(this.ypos1 < this.toPosY)
         {
            this.yvel += _loc1_;
            if(this.yvel > _loc2_)
            {
               this.yvel = _loc2_;
            }
         }
         this.ypos1 += this.yvel;
         this.ypos = this.starty + this.ypos1;
         --this.timer;
         if(this.timer <= 0)
         {
            this.toPosX = Utils.RandBetweenFloat(-this.radius * this.speed,this.radius * this.speed);
            this.timer = Utils.RandBetweenInt(10,20);
         }
         --this.timer1;
         if(this.timer1 <= 0)
         {
            this.toPosY = Utils.RandBetweenFloat(-this.radius * this.speed,this.radius * this.speed);
            this.timer1 = Utils.RandBetweenInt(10,20);
         }
         this.CycleAnimation();
      }
      
      internal function UpdateSnowball() : void
      {
         if(this.controlMode == 1)
         {
            this.xpos += this.movementVec.GetXComponent();
            this.ypos += this.movementVec.GetYComponent();
            this.scale += 0.005;
            if(this.scale >= 1)
            {
               this.scale = 1;
            }
            this.movementVec.speed -= 0.5;
            if(this.movementVec.speed <= 1)
            {
               this.movementVec.speed = 0;
               this.controlMode = 0;
            }
            this.frameVel = Utils.ScaleToAndLimit(0,1,0,6,this.movementVec.speed);
            this.CycleAnimationEx();
         }
         if(this.controlMode == 2)
         {
            if(this.PlayAnimationEx())
            {
               this.killed = false;
            }
         }
      }
      
      internal function UpdateSnowGenerator() : void
      {
         var _loc1_:int = 0;
         var _loc2_:Number = NaN;
         var _loc3_:Number = NaN;
         var _loc4_:Particle = null;
         --this.timer;
         if(this.timer <= 0)
         {
            this.timer = 0;
            _loc1_ = 0;
            while(_loc1_ < 1)
            {
               _loc2_ = Utils.RandBetweenFloat(-200,640 + 200);
               _loc3_ = Utils.RandBetweenFloat(-200,480 + 200);
               _loc4_ = Particles.Add(_loc2_ + Game.camera.x,_loc3_ + Game.camera.y);
               _loc4_.InitSnow();
               _loc1_++;
            }
         }
      }
      
      internal function InitTurboFire() : void
      {
         this.sortByY = true;
         this.updateFunction = this.UpdateTurboFire;
         this.graphicID = GraphicObjects.GetIndexByName("FX_Smash");
         this.frame = 0;
         this.frameVel = 1;
      }
      
      internal function UpdateWake() : *
      {
         this.radius += this.rotVel;
         --this.timer;
         if(this.timer <= 0)
         {
            this.killed = true;
         }
      }
      
      internal function Render321go() : void
      {
         this.RenderNormally(false);
      }
      
      internal function ClearColFlags() : *
      {
         this.colFlag_jumpon = false;
         this.colFlag_killPlayer = false;
         this.colFlag_playercanbekilled = false;
         this.colFlag_canBePickedUp = false;
         this.colFlag_canBeShot = false;
         this.colFlag_isBullet = false;
         this.colFlag_isPlatform = false;
         this.colFlag_isPowerup = false;
         this.colFlag_isBouncyPad = false;
         this.colFlag_isCheckpoint = false;
         this.colFlag_isShop = false;
         this.colFlag_isEnemyBullet = false;
         this.colFlag_isEnemy = false;
         this.colFlag_isBall = false;
         this.colFlag_isHose = false;
         this.colFlag_isPlayer = false;
         this.colFlag_isPhysObj = false;
         this.colFlag_isGoPhysObj = false;
         this.colFlag_isOil = false;
         this.colFlag_affectedByWake = false;
         this.colFlag_isWake = false;
      }
      
      internal function RenderFlyingBird() : void
      {
         this.RenderSimpleShadow(4);
         this.RenderObjAt(this.xpos,this.ypos + this.height,this.graphicID,this.frame);
      }
      
      internal function InitCow() : *
      {
         this.cowRenderBeam = false;
         this.name = "cow";
         this.renderFunction = this.RenderCow;
         this.updateFunction = this.UpdateCow;
         this.collisionHitFunction = this.HitCow;
         this.controlMode = 0;
         this.frame = 0;
         this.colFlag_isGoPhysObj = true;
         this.colOffsetX = 0;
         this.colOffsetY = -20;
         this.radius = 20;
         this.sortByY = true;
         this.frameVel = 1;
         this.controlMode = 0;
         this.height = 10;
         this.timer = 0;
         this.frame = 0;
         this.height = 0;
         this.zvel = 0;
      }
      
      internal function RenderSimpleShadow(param1:int) : *
      {
         if(this.height == 0)
         {
            return;
         }
         var _loc2_:Number = int(this.xpos) - int(Game.camera.x);
         var _loc3_:Number = int(this.ypos) - int(Game.camera.y);
         if(_loc2_ < -1000)
         {
            return;
         }
         if(_loc2_ > Defs.displayarea_w + 500)
         {
            return;
         }
         if(_loc3_ < -1000)
         {
            return;
         }
         if(_loc3_ > Defs.displayarea_h + 500)
         {
            return;
         }
         _loc2_ -= 2;
         _loc3_ -= 2;
         _loc2_ += this.height * 0.5;
         _loc3_ += this.height * 0.5;
         var _loc4_:int = GraphicObjects.GetIndexByName("FX_Shadows");
         GraphicObjects.RenderAt(_loc4_,param1,this.bd,_loc2_,_loc3_);
      }
      
      internal function UpdateFlybyPlane() : *
      {
         this.xpos += this.movementVec.GetXComponent();
         this.ypos += this.movementVec.GetYComponent();
         --this.timer1;
         if(this.timer1 <= 0)
         {
            this.active = false;
         }
      }
      
      internal function HitSandcastle(param1:GameObj) : void
      {
         if(this.controlMode != 0)
         {
            return;
         }
         param1.VehicleHitObject(this);
         if(param1.colFlag_isPlayer)
         {
            SoundPlayer.Play("sfx_hit_snow");
         }
         if(param1.colFlag_isPlayer)
         {
            Game.AddHitObject("sandcastle");
         }
         Game.AddDestroyedObject("sandcastle");
         this.controlMode = 1;
         this.frameVel = 1;
         this.frame = 0;
      }
      
      internal function SetCarColor(param1:int) : *
      {
         var _loc2_:int = int(Game.carColors[param1 * 3 + 0]);
         var _loc3_:int = int(Game.carColors[param1 * 3 + 1]);
         var _loc4_:int = int(Game.carColors[param1 * 3 + 2]);
         this.ct = new ColorTransform(1,1,1,1,_loc2_,_loc3_,_loc4_,0);
      }
      
      internal function UpdateUFO() : *
      {
         var _loc1_:GameObj = null;
         if(this.controlMode == -1)
         {
            --this.timer;
            if(this.timer <= 0)
            {
               this.controlMode = 2;
            }
            this.minFrame = 1 - 1;
            this.maxFrame = 4 - 1;
            this.CycleAnimationEx();
         }
         else if(this.controlMode == 0)
         {
            _loc1_ = Game.GetNearestGameObjByName("cow",this.xpos,this.ypos);
            if(_loc1_ != null)
            {
               _loc1_.controlMode = 1;
               _loc1_.zvel = 0;
               _loc1_.height -= 0.5;
               if(_loc1_.height < -100)
               {
                  ++Game.cowsAbducted;
                  _loc1_.visible = false;
                  _loc1_.height = -100;
               }
            }
            ++this.timer;
            this.minFrame = 1 - 1;
            this.maxFrame = 4 - 1;
            this.CycleAnimationEx();
         }
         else if(this.controlMode == 1)
         {
            this.minFrame = 5 - 1;
            this.maxFrame = 12 - 1;
            if(this.PlayAnimationEx())
            {
               this.controlMode = 2;
            }
         }
         else if(this.controlMode == 2)
         {
            this.toPosX = this.ufoLine.GetPoint(this.ufoLineIndex).x;
            this.toPosY = this.ufoLine.GetPoint(this.ufoLineIndex).y;
            this.movementVec.SetFromDxDy(this.toPosX - this.xpos,this.toPosY - this.ypos);
            this.movementVec.speed = this.ufoSpeed;
            this.xpos += this.movementVec.GetXComponent();
            this.ypos += this.movementVec.GetYComponent();
            if(Utils.DistBetweenPoints(this.xpos,this.ypos,this.toPosX,this.toPosY) <= this.movementVec.speed)
            {
               this.xpos = this.toPosX;
               this.ypos = this.toPosY;
               this.controlMode = 0;
               SoundPlayer.Play("sfx_moo");
            }
            this.minFrame = 1 - 1;
            this.maxFrame = 4 - 1;
            this.CycleAnimationEx();
         }
         else if(this.controlMode == 4)
         {
            this.visible = false;
         }
      }
      
      internal function InitSlalomGate() : *
      {
         this.name = "slalomgate";
         this.renderFunction = this.RenderSlalomGate;
         this.updateFunction = this.UpdateSlalomGate;
         this.collisionHitFunction = this.HitSlalomGate;
         this.controlMode = 0;
         this.frame = 0;
         this.colFlag_isGoPhysObj = true;
         this.colOffsetX = 0;
         this.colOffsetY = 0;
         this.radius = 10;
         this.sortByY = true;
         this.alpha = 1;
         this.frame = Utils.RandBetweenInt(0,3);
         this.frameVel = 1;
      }
      
      internal function GetWheelMarker(param1:int) : Point
      {
         var _loc2_:Number = Number(ExternalData.gameconstants["carturnoffset"]);
         var _loc3_:Number = -this.dir - Math.PI / 2;
         var _loc4_:Number = this.xpos + Math.cos(-this.dir) * _loc2_;
         var _loc5_:Number = this.ypos + Math.sin(-this.dir) * _loc2_;
         var _loc6_:Point = Game.GetWheelMarker(Game.playerFrame,param1);
         return new Point(_loc4_ + _loc6_.x,_loc5_ + _loc6_.y);
      }
      
      internal function InitCrate_Empty() : void
      {
         Game.AddObjectCount("crate");
         this.InitCrate();
         this.type = 1;
      }
      
      internal function RenderUFO() : void
      {
         this.RenderSimpleShadow(8 - 1);
         this.RenderObjAt(this.xpos,this.ypos + this.height,this.graphicID,this.frame);
      }
      
      internal function InitBellBuoy() : void
      {
         this.InitBuoy();
         this.updateFunction = this.UpdateBellBuoy;
         this.bellTimer = 0;
      }
      
      internal function RenderAppearingPickup() : void
      {
         this.RenderNormallyAlpha();
      }
      
      public function RenderShadow() : void
      {
         if(this.renderShadowFlag == false)
         {
            return;
         }
         if(this.visible == false)
         {
            return;
         }
         var _loc1_:Number = this.xpos - Game.camera.x;
         var _loc2_:Number = this.ypos - Game.camera.y;
         GraphicObjects.RenderAtRotScaled(this.graphicID,this.frame,this.bd,_loc1_ + 5,_loc2_ + 5,1,this.dir);
      }
      
      internal function RenderTextMessage() : *
      {
         var _loc1_:Number = this.xpos;
         var _loc2_:Number = this.ypos;
         GraphicObjects.RenderStringBD(GraphicObjects.gfx_font1,this.textMessage);
         GraphicObjects.RenderStringBDAt(this.bd,_loc1_,_loc2_,this.scale,0,this.alpha,1,1);
      }
      
      internal function UpdateBigWaterSplash() : void
      {
         if(this.PlayAnimation())
         {
            this.killed = true;
         }
      }
      
      internal function RenderSkidLayer() : void
      {
         Game.RenderSkids(this.bd);
      }
      
      public function PlayAnimation() : Boolean
      {
         var _loc1_:int = GraphicObjects.GetNumFrames(this.graphicID) - 1;
         this.frame += this.frameVel;
         if(this.frame >= _loc1_)
         {
            this.frame = _loc1_;
            return true;
         }
         if(this.frame <= 0)
         {
            this.frame = 0;
            return true;
         }
         return false;
      }
      
      internal function InitOil() : void
      {
         Game.AddObjectCount("oil");
         this.updateFunction = this.UpdateOil;
         this.collisionHitFunction = this.HitOil;
         this.controlMode = 0;
         this.colFlag_isGoPhysObj = true;
         this.colFlag_isOil = true;
         this.colOffsetX = 0;
         this.colOffsetY = 25;
         this.radius = 30;
         this.zbodge = 1000;
         this.sortByY = true;
      }
      
      public function CycleAnimation1() : void
      {
         var _loc1_:Number = this.frameVel1;
         var _loc2_:int = GraphicObjects.GetNumFrames(this.graphicID1);
         this.frame1 += _loc1_;
         if(this.frame1 >= _loc2_)
         {
            this.frame1 -= _loc2_;
         }
         if(this.frame1 < 0)
         {
            this.frame1 += _loc2_;
         }
      }
      
      internal function HitSnowball(param1:GameObj) : void
      {
         var _loc2_:Number = NaN;
         var _loc3_:Number = NaN;
         if(this.controlMode != 0)
         {
            return;
         }
         if(this.GetHitterSpeed(param1) < 3)
         {
            return;
         }
         param1.VehicleHitObject(this);
         if(param1.colFlag_isPlayer)
         {
            SoundPlayer.Play("sfx_hit_snow");
         }
         if(this.scale == 1)
         {
            this.controlMode = 2;
            this.frame = 10;
            this.frameVel = 1;
            this.minFrame = 11 - 1;
            this.maxFrame = 18 - 1;
            if(param1.colFlag_isPlayer)
            {
               Game.AddHitObject("snowball");
            }
         }
         else
         {
            _loc2_ = param1.xpos - param1.oldxpos;
            _loc3_ = param1.ypos - param1.oldypos;
            this.movementVec.SetFromDxDy(_loc2_,_loc3_);
            this.movementVec.AddRot(Utils.RandBetweenFloat(-0.2,0.2));
            if(this.movementVec.speed > 3)
            {
               this.controlMode = 1;
               Game.AddDestroyedObject("snowball");
            }
         }
      }
      
      public function GetDirBetween(param1:*, param2:*, param3:*, param4:*) : Number
      {
         return Math.atan2(param4 - param2,param3 - param1);
      }
      
      internal function RenderTumbleweed() : void
      {
         this.RenderSimpleShadow(4);
         this.RenderObjAt(this.xpos,this.ypos + this.height,this.graphicID,this.frame);
      }
      
      internal function UpdateTurboFire() : void
      {
         if(this.PlayAnimation())
         {
            this.killed = true;
         }
      }
      
      internal function InitBigWaterSplash() : void
      {
         this.sortByY = true;
         this.updateFunction = this.UpdateBigWaterSplash;
         this.graphicID = GraphicObjects.GetIndexByName("FX_Splash");
         this.frame = 0;
         this.frameVel = 1;
      }
      
      internal function InitStaticObject_FarZ() : void
      {
         this.sortByY = true;
         ++Game.numStaticObjects;
         this.zbodge = 1000;
      }
      
      internal function InitReadyGetSetGo() : void
      {
         this.zpos = 0;
         this.updateFunction = this.UpdateReadyGetSetGo;
         this.renderFunction = null;
      }
      
      internal function UpdatePlayerVehicle() : void
      {
      }
      
      internal function InitFlybyPlane1(param1:int, param2:int, param3:Number, param4:Number) : *
      {
         this.planeSpd = param4;
         this.planeDir = param3;
         this.InitFlybyPlane();
         this.graphicID = param1;
         this.frame = param2;
         this.type = 0;
      }
      
      public function CycleAnimationEx() : Boolean
      {
         var _loc1_:Boolean = false;
         this.frame += this.frameVel;
         var _loc2_:* = this.maxFrame - this.minFrame;
         if(this.frame > this.maxFrame)
         {
            this.frame -= _loc2_;
            _loc1_ = true;
         }
         if(this.frame < this.minFrame)
         {
            this.frame += _loc2_;
            _loc1_ = true;
         }
         return _loc1_;
      }
      
      internal function InitBeachBall() : void
      {
         Game.AddObjectCount("beachball");
         this.updateFunction = this.UpdateBeachBall;
         this.collisionHitFunction = this.HitBeachBall;
         this.renderFunction = this.RenderBeachBall;
         this.controlMode = 0;
         this.colFlag_isGoPhysObj = true;
         this.colOffsetX = 3;
         this.colOffsetY = -8;
         this.radius = 10;
         this.movementVec = new Vec();
         this.height = 0;
         this.sortByY = true;
      }
      
      internal function InitAIVehicle() : void
      {
         this.sortByY = true;
         this.updateFunction = this.UpdatePlayerVehicle;
         this.renderFunction = this.RenderPlayerVehicle;
         var _loc1_:int = int(Game.aiCarColorList[Game.nextAICarColor + 1]);
         ++Game.nextAICarColor;
         this.SetCarColor(_loc1_);
         this.skidFrame = 0;
         this.isVehicle = true;
         this.vehicleAtMaxTurn = false;
         this.physControlMode = 0;
         this.colOffsetX = 0;
         this.colOffsetY = 0;
         this.radius = 20;
      }
      
      internal function HitSmashObject(param1:GameObj) : void
      {
         if(this.controlMode != 0)
         {
            return;
         }
         param1.VehicleHitObject(this);
         var _loc2_:Number = param1.xpos - param1.oldxpos;
         var _loc3_:Number = param1.ypos - param1.oldypos;
         this.movementVec.SetFromDxDy(_loc2_,_loc3_);
         this.movementVec.AddRot(Utils.RandBetweenFloat(-0.2,0.2));
         if(param1.colFlag_isPlayer)
         {
            SoundPlayer.Play("sfx_hit_snow");
         }
         if(param1.colFlag_isPlayer)
         {
            Game.AddHitObject("smash_object");
         }
         Game.AddDestroyedObject("smash_object");
         this.controlMode = 1;
         this.frameVel = 1;
         this.frame = 0;
      }
      
      internal function InitSplashFX(param1:int = 0) : void
      {
         this.zbodge = 2000;
         this.sortByY = true;
         this.updateFunction = this.UpdateSplashFX;
         if(param1 == 0)
         {
            this.graphicID = GraphicObjects.GetIndexByName("fx_splash_a");
         }
         if(param1 == 1)
         {
            this.graphicID = GraphicObjects.GetIndexByName("fx_splash_b");
         }
         if(param1 == 2)
         {
            this.graphicID = GraphicObjects.GetIndexByName("fx_splash_c");
         }
         this.frame = 0;
         this.frameVel = 1;
      }
      
      public function InitTextMessage(param1:String, param2:Number, param3:Number) : void
      {
         this.textMessage = param1;
         this.updateFunction = this.UpdateTextMessage;
         this.renderFunction = this.RenderTextMessage;
         this.timer = Defs.fps * 3;
         this.yvel = 0;
         this.zpos = -5000;
         this.xpos = param2 - Game.camera.x;
         this.ypos = param3 - Game.camera.y;
         this.xvel = (Game.camera.x - Game.camera.oldX) * 0.9;
         this.yvel = (Game.camera.y - Game.camera.oldY) * 0.9;
         this.yvel = 0;
         this.scale = 1;
         this.zvel = 0.1;
         this.alpha = 1;
      }
      
      internal function HitBird(param1:GameObj) : void
      {
         if(this.controlMode != 0 && this.controlMode != 1)
         {
            return;
         }
         if(param1.colFlag_isPlayer)
         {
            SoundPlayer.Play("sfx_hit_bird");
         }
         if(param1.colFlag_isPlayer)
         {
            Game.AddHitObject("bird");
         }
         if(param1.colFlag_isPlayer)
         {
            Game.AddScore(Game.score_bird);
         }
         Game.AddDestroyedObject("bird");
         param1.VehicleHitObject(this);
         var _loc2_:Number = param1.xpos - param1.oldxpos;
         var _loc3_:Number = param1.ypos - param1.oldypos;
         this.controlMode = 2;
         this.timer = 0;
         this.zvel = -5;
         this.speed = 0;
      }
      
      internal function InitBuoy() : void
      {
         var _loc1_:int = 0;
         _loc1_ = this.graphicID;
         this.InitEdgeMarker();
         this.graphicID = _loc1_;
         this.frame = 0;
         this.zbodge = 0;
      }
      
      internal function Update321go() : void
      {
         if(this.PlayAnimation())
         {
            this.killed = true;
         }
      }
      
      internal function UpdateCloud() : void
      {
         this.xpos += this.xvel;
         var _loc1_:Number = 200;
         if(this.xpos > Game.camera.maxX)
         {
            this.xpos -= Game.camera.maxX - Game.camera.minX + _loc1_ * 2;
         }
      }
      
      internal function RenderHomingBullet() : *
      {
      }
      
      internal function UpdateSlalomGate() : *
      {
         if(this.controlMode == 0)
         {
            this.CycleAnimation();
         }
         else if(this.PlayAnimationEx())
         {
            this.frame = this.minFrame;
            this.controlMode = 0;
         }
      }
      
      internal function InitCheckpoint() : void
      {
         Game.startPoints.push(new Point(this.xpos,this.ypos));
      }
      
      internal function UpdateMessage() : *
      {
         this.xpos = 320 + Game.camera.x;
         this.ypos = 100 + Game.camera.y;
         --this.timer;
         if(this.timer <= 0)
         {
            this.killed = true;
         }
      }
      
      internal function UpdateFlybyPlaneGenerator() : *
      {
         var _loc1_:Number = NaN;
         var _loc2_:Number = NaN;
         var _loc3_:GameObj = null;
         var _loc4_:Number = NaN;
         if(Game.levelState != Game.levelState_Play)
         {
            return;
         }
         ++this.timer;
         if(this.timer >= this.timer1)
         {
            this.timer = 0;
            _loc1_ = this.xpos;
            _loc2_ = this.ypos;
            _loc3_ = GameObjects.AddObj(_loc1_,_loc2_,this.zpos);
            if(this.type == 0)
            {
               _loc4_ = Utils.DegToRad(270);
            }
            if(this.type == 1)
            {
               _loc4_ = Utils.DegToRad(0);
            }
            if(this.type == 2)
            {
               _loc4_ = Utils.DegToRad(90);
            }
            if(this.type == 3)
            {
               _loc4_ = Utils.DegToRad(180);
            }
            _loc3_.InitFlybyPlane1(this.graphicID,this.frame,_loc4_,this.speed);
         }
      }
      
      internal function UpdateAppearingPickup() : void
      {
         var _loc1_:int = 0;
         var _loc2_:Number = NaN;
         if(this.controlMode == 0)
         {
            this.visible = false;
            if(this.appearingPickupIndex >= Game.currentAppearingPickup && this.appearingPickupIndex <= Game.currentAppearingPickup + 3)
            {
               _loc1_ = this.appearingPickupIndex - Game.currentAppearingPickup;
               _loc2_ = Utils.ScaleTo(1,0.1,0,3,_loc1_);
               this.alpha += (_loc2_ - this.alpha) * 0.3;
               this.visible = true;
               this.frame = 3;
               if(this.appearingPickupIndex == Game.currentAppearingPickup)
               {
                  this.frame = 4;
               }
            }
         }
         else if(this.PlayAnimationEx())
         {
            this.alpha = 1;
            this.killed = true;
         }
      }
      
      internal function InitCloud() : void
      {
         this.updateFunction = this.UpdateCloud;
         this.controlMode = 0;
         this.xvel = 1;
      }
      
      internal function InitDirt() : void
      {
         this.updateFunction = this.UpdateDirt;
         this.graphicID = GraphicObjects.GetIndexByName("FX_DirtSpray");
         this.frame = 0;
         this.frameVel = Utils.RandBetweenFloat(0.5,1);
      }
      
      internal function Init321go() : void
      {
         this.graphicID = GraphicObjects.GetIndexByName("osd_321");
         this.frame = 0;
         this.frameVel = 1;
         this.xpos = 320;
         this.ypos = 240;
         this.updateFunction = this.Update321go;
         this.renderFunction = this.Render321go;
      }
      
      internal function RenderNormallyAlpha() : *
      {
         if(this.alpha == 1)
         {
            this.RenderNormally();
            return;
         }
         var _loc1_:Number = int(this.xpos) - int(Game.camera.x);
         var _loc2_:Number = int(this.ypos) - int(Game.camera.y);
         if(_loc1_ < -1000)
         {
            return;
         }
         if(_loc1_ > Defs.displayarea_w + 500)
         {
            return;
         }
         if(_loc2_ < -1000)
         {
            return;
         }
         if(_loc2_ > Defs.displayarea_h + 500)
         {
            return;
         }
         this.ct = new ColorTransform();
         this.ct.alphaMultiplier = this.alpha;
         GraphicObjects.RenderAtRotScaled(this.graphicID,this.frame,this.bd,_loc1_,_loc2_,this.scale,this.dir,this.ct,this.renderSmooth);
      }
      
      internal function RenderPlayerVehicle() : void
      {
         var _loc2_:Number = NaN;
         var _loc6_:Number = NaN;
         var _loc7_:int = 0;
         var _loc8_:int = 0;
         var _loc9_:Point = null;
         if(this.physControlMode == 2)
         {
            this.RenderNormally(true);
            return;
         }
         var _loc1_:Number = Number(ExternalData.gameconstants["carturnoffset"]);
         _loc2_ = -this.dir - Math.PI / 2;
         var _loc3_:Number = this.xpos + Math.cos(-this.dir) * _loc1_;
         var _loc4_:Number = this.ypos + Math.sin(-this.dir) * _loc1_;
         this.RenderCarShadowAt(_loc3_,_loc4_,this.skidFrame);
         var _loc5_:Number = this.height + this.hopHeight;
         this.type = 0;
         if(this.physObjInst.boostExtraSpeed != 0)
         {
            _loc6_ = Utils.ScaleToPreLimit(0,1,0,2,this.physObjInst.boostExtraSpeed);
            this.ct1.redOffset = 255;
            this.ct1.greenOffset = 255;
            this.ct1.blueOffset = 255;
            this.ct1.alphaMultiplier = _loc6_;
            this.RenderCarObjAt(_loc3_,_loc4_ + _loc5_,GraphicObjects.GetIndexByName("Boats"),this.frame,0,this.ct);
            this.RenderCarObjAt(_loc3_,_loc4_ + _loc5_,GraphicObjects.GetIndexByName("Boats"),this.frame,0,this.ct1);
            this.RenderCarObjAt(_loc3_,_loc4_ + _loc5_,GraphicObjects.GetIndexByName("Boats"),this.frame,1);
            this.RenderCarObjAt(_loc3_,_loc4_ + _loc5_,GraphicObjects.GetIndexByName("Boats"),this.frame,1,this.ct1);
         }
         else
         {
            this.RenderCarObjAt(_loc3_,_loc4_ + _loc5_,GraphicObjects.GetIndexByName("Boats"),this.frame,0,this.ct);
            this.RenderCarObjAt(_loc3_,_loc4_ + _loc5_,GraphicObjects.GetIndexByName("Boats"),this.frame,1);
         }
         if(this.turboMode == 2)
         {
            _loc7_ = GraphicObjects.GetIndexByName("fx_turbos");
            _loc2_ = this.dir;
            _loc8_ = this.frame / 5;
            _loc9_ = Game.GetTurboOffset(_loc8_);
            if(_loc9_ != null)
            {
               _loc2_ = Math.PI * 2 / 48 * _loc8_;
               this.RenderObjAt(_loc3_ + _loc9_.x,_loc4_ + _loc9_.y + _loc5_,_loc7_,this.turboFrame,null,_loc2_);
            }
            ++this.turboFrame;
            if(this.turboFrame >= 2)
            {
               this.turboFrame = 0;
            }
         }
         this.colFlag_isGoPhysObj = true;
         this.RenderCollision();
         this.colFlag_isGoPhysObj = false;
         if(this.colFlag_isPlayer)
         {
            if(Game.levelState == Game.levelState_LevelStart || Game.levelState == Game.levelState_Play && Game.race_time < Defs.fps * 5)
            {
               this.RenderObjAt(this.xpos,this.ypos - 40,GraphicObjects.GetIndexByName("icon_arrow"),0);
            }
         }
      }
      
      public function InitPhysicsFloorObject(param1:int, param2:Number) : *
      {
         this.frame = param1;
         this.dir = param2;
      }
      
      internal function InitWake(param1:Number) : void
      {
         this.colFlag_isWake = true;
         this.visible = false;
         this.updateFunction = this.UpdateWake;
         this.radius = Utils.ScaleToPreLimit(0,30,0,15,param1);
         this.timer = 10;
         this.rotVel = Utils.ScaleToPreLimit(0,3,0,15,param1);
      }
      
      internal function InitWaterSplash() : void
      {
         this.sortByY = true;
         this.updateFunction = this.UpdateWaterSplash;
         this.graphicID = GraphicObjects.GetIndexByName("FX_SplashWheel");
         this.frame = 0;
         this.frameVel = 1;
      }
      
      internal function RenderEnemyBullet() : *
      {
      }
      
      internal function VehicleHitObject(param1:GameObj) : *
      {
         if(this.colFlag_isPlayer)
         {
         }
      }
      
      internal function HitAppearingPickup(param1:GameObj) : void
      {
         if(this.controlMode != 0)
         {
            return;
         }
         if(this.visible == false)
         {
            return;
         }
         if(this.appearingPickupIndex != Game.currentAppearingPickup)
         {
            return;
         }
         param1.VehicleHitObject(this);
         if(param1.colFlag_isPlayer)
         {
            Game.levelFunctions.TriggerAction(0);
         }
         if(param1.colFlag_isPlayer)
         {
            SoundPlayer.Play("sfx_hit_snow");
         }
         if(param1.colFlag_isPlayer)
         {
            Game.AddHitObject("appearing_pickup");
         }
         Game.AddDestroyedObject("appearing_pickup");
         ++Game.currentAppearingPickup;
         this.controlMode = 1;
         this.frameVel = 0.5;
         this.minFrame = 5 - 1;
         this.maxFrame = 10 - 1;
         this.frame = this.minFrame;
      }
      
      internal function UpdateBeachBall() : void
      {
         if(this.controlMode == 0)
         {
         }
         if(this.controlMode == 1)
         {
            this.zvel += 0.4;
            this.height += this.zvel;
            if(this.height >= 0)
            {
               this.height = 0;
               this.movementVec.speed *= 0.5;
               this.zvel *= -0.6;
               if(this.movementVec.speed <= 0.4)
               {
                  this.controlMode = 0;
               }
            }
            this.xpos += this.movementVec.GetXComponent();
            this.ypos += this.movementVec.GetYComponent();
         }
      }
      
      internal function UpdateBalloon() : void
      {
         this.xpos1 += this.movementVec.GetXComponent();
         this.ypos1 += this.movementVec.GetYComponent();
         this.xpos = this.xpos1 + Math.sin(this.timer * 0.1) * 5;
         this.ypos = this.ypos1;
         if(this.controlMode == 0)
         {
            this.alpha += 0.1;
            if(this.alpha >= 1)
            {
               this.alpha = 1;
            }
            ++this.timer;
            this.CycleAnimation();
            this.height += this.yvel;
            this.yvel -= 0.01;
            if(this.height < -500)
            {
               this.controlMode = 1;
            }
         }
         else
         {
            ++this.timer;
            this.CycleAnimation();
            this.height += this.yvel;
            this.alpha -= 0.05;
            if(this.alpha <= 0)
            {
               this.alpha = 0;
               this.killed = true;
            }
         }
      }
      
      internal function InitFlybyPlaneGenerator1() : *
      {
         this.InitFlybyPlaneGenerator();
         this.type = 0;
         this.timer1 = Defs.fps * 10;
         this.speed = 12;
      }
      
      internal function InitFlybyPlaneGenerator2() : *
      {
         this.InitFlybyPlaneGenerator();
         this.type = 1;
         this.timer1 = Defs.fps * 10;
         this.speed = 12;
      }
      
      internal function InitFlybyPlaneGenerator3() : *
      {
         this.InitFlybyPlaneGenerator();
         this.type = 2;
         this.timer1 = Defs.fps * 10;
         this.speed = 12;
      }
      
      internal function InitFlybyPlaneGenerator4() : *
      {
         this.InitFlybyPlaneGenerator();
         this.type = 3;
         this.timer1 = Defs.fps * 10;
         this.speed = 12;
      }
      
      internal function HitCoconutHalf(param1:GameObj) : void
      {
         if(this.controlMode != 0)
         {
            return;
         }
         if(this.GetHitterSpeed(param1) < 5)
         {
            return;
         }
         param1.VehicleHitObject(this);
         var _loc2_:Number = param1.xpos - param1.oldxpos;
         var _loc3_:Number = param1.ypos - param1.oldypos;
         if(param1.colFlag_isPlayer)
         {
            SoundPlayer.Play("sfx_hit_coconut");
         }
         if(param1.colFlag_isPlayer)
         {
            Game.AddHitObject("coconut_half");
         }
         Game.AddDestroyedObject("coconut_half");
         this.movementVec.SetFromDxDy(_loc2_,_loc3_);
         this.movementVec.AddRot(Utils.RandBetweenFloat(-0.2,0.2));
         this.controlMode = 1;
         this.zvel = -Utils.ScaleToAndLimit(0,5,2,8,this.movementVec.speed);
      }
      
      internal function InitStaticObject_Animated() : void
      {
         this.sortByY = true;
         this.frameVel = 1;
         this.frame = Utils.RandBetweenInt(0,GraphicObjects.GetNumFrames(this.graphicID) - 1);
         this.updateFunction = this.UpdateStaticObject_Animated;
      }
      
      internal function InitPickupText(param1:int) : void
      {
         this.graphicID = GraphicObjects.GetIndexByName("osd_pickups");
         this.frame = param1;
         this.timer = Defs.fps;
         this.updateFunction = this.UpdatePickupText;
      }
      
      internal function UpdateBomb() : *
      {
         if(this.controlMode == 0)
         {
            this.CycleAnimation();
            this.height += this.zvel;
            this.xpos += this.movementVec.GetXComponent();
            this.ypos += this.movementVec.GetYComponent();
            this.movementVec.speed -= 0.1;
            if(this.movementVec.speed < 0)
            {
               this.movementVec.speed = 0;
            }
            this.zvel += 0.1;
            if(this.height >= 0)
            {
               this.height = 0;
               this.controlMode = 1;
               this.graphicID = GraphicObjects.GetIndexByName("FX_Explode");
               this.frame = 0;
               this.colFlag_isGoPhysObj = true;
               this.colOffsetX = 5;
               this.colOffsetY = -10;
               this.radius = 40;
               this.collisionHitFunction = this.HitBomb;
            }
         }
         else
         {
            this.frameVel = 0.5;
            if(this.PlayAnimation())
            {
               this.killed = true;
            }
         }
      }
      
      internal function InitFlybyPlaneGenerator() : *
      {
         this.timer = 0;
         this.visible = false;
         this.updateFunction = this.UpdateFlybyPlaneGenerator;
         this.timer = this.flybyGenTimeMin;
      }
      
      internal function HitFruitSequence(param1:GameObj) : void
      {
         if(this.controlMode != 0)
         {
            return;
         }
         if(param1.colFlag_isPlayer)
         {
            Game.AddHitObject("fruit_sequence");
         }
         Game.AddDestroyedObject("fruit_sequence");
         ++Game.numFruitCollected;
         this.controlMode = 1;
         SoundPlayer.Play("sfx_hit_fruit");
      }
      
      internal function InitBird1() : void
      {
         this.InitBird();
         this.birdDir = Utils.DegToRad(135);
      }
      
      internal function InitBird2() : void
      {
         this.InitBird();
         this.birdDir = Utils.DegToRad(225);
      }
      
      internal function InitSnowball() : void
      {
         Game.AddObjectCount("snowball");
         this.updateFunction = this.UpdateSnowball;
         this.collisionHitFunction = this.HitSnowball;
         this.controlMode = 0;
         this.scale = 0.5;
         this.frame = 0;
         this.frameVel = 1;
         this.colFlag_isGoPhysObj = true;
         this.colOffsetX = 0;
         this.colOffsetY = -10;
         this.radius = 10;
         this.movementVec = new Vec();
         this.sortByY = true;
         this.minFrame = 0;
         this.maxFrame = 9;
      }
      
      public function PlayAnimationEx() : Boolean
      {
         var _loc1_:Boolean = false;
         this.frame += this.frameVel;
         if(this.frame > this.maxFrame)
         {
            this.frame = this.maxFrame;
            _loc1_ = true;
         }
         if(this.frame < this.minFrame)
         {
            this.frame = this.minFrame;
            _loc1_ = true;
         }
         return _loc1_;
      }
      
      internal function Anim_FromVel() : void
      {
         var _loc1_:int = GraphicObjects.GetNumFrames(this.graphicID);
         var _loc2_:Number = this.xvel;
         var _loc3_:Number = this.yvel;
         var _loc4_:* = Math.atan2(_loc3_,_loc2_);
         this.frame = _loc1_ / (Math.PI * 2) * -_loc4_;
         if(this.frame < 0)
         {
            this.frame += _loc1_;
         }
         if(this.frame > _loc1_)
         {
            this.frame -= _loc1_;
         }
         this.frame += _loc1_ / 2;
         if(this.frame > _loc1_)
         {
            this.frame -= _loc1_;
         }
      }
      
      internal function RenderSlalomGate() : *
      {
         this.RenderNormallyAlpha();
      }
      
      internal function VehicleHitOil() : *
      {
         var _loc1_:PhysObj_Instance = this.physObjInst;
         _loc1_.StartOilInstantBoost();
      }
      
      internal function InitCoconut() : void
      {
         Game.AddObjectCount("coconut");
         this.updateFunction = this.UpdateCoconut;
         this.collisionHitFunction = this.HitCoconut;
         this.renderFunction = this.RenderCoconut;
         this.controlMode = 0;
         this.colFlag_isGoPhysObj = true;
         this.colOffsetX = 0;
         this.colOffsetY = -10;
         this.radius = 14;
         this.movementVec = new Vec();
         this.height = 0;
         this.sortByY = true;
      }
      
      internal function RenderObjAt(param1:Number, param2:Number, param3:int, param4:int, param5:ColorTransform = null, param6:Number = 0, param7:Number = 1) : *
      {
         var _loc8_:Number = int(param1) - int(Game.camera.x);
         var _loc9_:Number = int(param2) - int(Game.camera.y);
         if(_loc8_ < -1000)
         {
            return;
         }
         if(_loc8_ > Defs.displayarea_w + 500)
         {
            return;
         }
         if(_loc9_ < -1000)
         {
            return;
         }
         if(_loc9_ > Defs.displayarea_h + 500)
         {
            return;
         }
         if(param5 != null)
         {
            GraphicObjects.RenderAtRotScaled(param3,param4,this.bd,_loc8_,_loc9_,param7,param6,param5,this.renderSmooth);
         }
         else if(param7 != 1 || param6 != 0)
         {
            GraphicObjects.RenderAtRotScaled(param3,param4,this.bd,_loc8_,_loc9_,param7,param6,null,this.renderSmooth);
         }
         else
         {
            GraphicObjects.RenderAt(param3,param4,this.bd,_loc8_,_loc9_);
         }
      }
      
      internal function RenderEnemy() : *
      {
      }
      
      internal function HitBombStatic(param1:GameObj) : void
      {
         var _loc2_:PhysObj_Instance = null;
         if(this.controlMode != 0)
         {
            return;
         }
         param1.VehicleHitObject(this);
         Game.AddDestroyedObject("bomb");
         if(param1.colFlag_isPlayer)
         {
            SoundPlayer.Play("sfx_hit_snow");
            Game.AddHitObject("bomb");
            _loc2_ = param1.physObjInst;
            _loc2_.DoJump();
         }
         this.controlMode = 1;
         this.graphicID = GraphicObjects.GetIndexByName("FX_Explode");
         this.frame = 0;
      }
      
      internal function InitRaceQueen(param1:int) : void
      {
         this.updateFunction = this.UpdateRaceQueen;
         this.renderFunction = this.RenderRaceQueen;
         this.type = param1;
         if(this.type == 0)
         {
            this.graphicID = GraphicObjects.GetIndexByName("popup_racequeen_go");
            this.frame = 0;
            this.controlMode = 0;
            this.frameVel = 0.5;
            this.alpha = 0;
         }
         if(this.type == 1)
         {
            this.graphicID = GraphicObjects.GetIndexByName("popup_racequeen_pose");
            this.frame = 0;
            this.controlMode = 10;
         }
         if(this.type == 2)
         {
            this.graphicID = GraphicObjects.GetIndexByName("popup_racequeen_pose");
            this.frame = 1;
            this.controlMode = 10;
         }
         if(this.type == 3)
         {
            this.graphicID = GraphicObjects.GetIndexByName("popup_racequeen_pose");
            this.frame = 2;
            this.controlMode = 10;
         }
      }
      
      internal function InitSmashBarrier() : void
      {
         this.InitSmashObject();
         this.colOffsetX = 0;
         this.colOffsetY = -5;
         this.radius = 16;
      }
      
      internal function RenderBird() : void
      {
         this.RenderSimpleShadow(4);
         this.RenderObjAt(this.xpos,this.ypos + this.height,this.graphicID,this.frame);
      }
      
      internal function UpdateSmashObject() : void
      {
         if(this.controlMode == 1)
         {
            this.xpos += this.movementVec.GetXComponent();
            this.ypos += this.movementVec.GetYComponent();
            if(this.PlayAnimation())
            {
               this.killed = true;
            }
         }
      }
      
      internal function UpdateReadyGetSetGo() : void
      {
         Game.gettingReady = false;
         this.killed = true;
      }
      
      internal function UpdateFlybyUFO() : *
      {
         this.xpos += 8;
         if(this.xpos > Game.camera.maxX + 100)
         {
            this.xpos = Game.camera.minX - 100;
         }
         this.CycleAnimationEx();
      }
      
      public function PlayAnimation1() : Boolean
      {
         var _loc1_:int = GraphicObjects.GetNumFrames(this.graphicID1) - 1;
         this.frame1 += this.frameVel1;
         if(this.frame1 >= _loc1_)
         {
            this.frame1 = _loc1_;
            return true;
         }
         return false;
      }
      
      internal function HitUFO(param1:GameObj) : *
      {
         if(this.controlMode == 0)
         {
            ++this.ufoLineIndex;
            if(this.ufoLineIndex >= this.ufoLine.GetNumPoints())
            {
               this.ufoLineIndex = 0;
            }
            this.controlMode = 1;
            this.minFrame = 5 - 1;
            this.ufoSpeed += 0.333;
            ++Game.cowsSaved;
         }
      }
      
      internal function RenderGate() : *
      {
         var _loc1_:int = 0;
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         this.RenderNormally();
         _loc1_ = -101;
         _loc2_ = 100;
         _loc3_ = -36;
         this.CycleAnimation1();
         if(this.gateDisplayLights)
         {
            this.RenderObjAt(this.xpos + _loc1_,this.ypos + _loc3_,this.graphicID1,this.frame1);
            this.RenderObjAt(this.xpos + _loc2_,this.ypos + _loc3_,this.graphicID1,this.frame1);
         }
      }
      
      internal function UpdatePickupText() : void
      {
         --this.timer;
         if(this.timer <= 0)
         {
            this.killed = true;
         }
      }
      
      internal function UpdateCone() : void
      {
         if(this.controlMode == 0)
         {
         }
         if(this.controlMode == 1)
         {
            this.PlayAnimationEx();
            this.zvel += 0.4;
            this.height += this.zvel;
            if(this.height >= 0)
            {
               this.height = 0;
               this.movementVec.speed *= 0.5;
               this.zvel *= -0.6;
               if(this.movementVec.speed <= 0.4)
               {
                  this.controlMode = 0;
               }
            }
            this.xpos += this.movementVec.GetXComponent();
            this.ypos += this.movementVec.GetYComponent();
         }
      }
      
      internal function InitAppearingPickup() : void
      {
         Game.AddObjectCount("appearing_pickup");
         this.appearingPickupIndex = Game.numAppearingPickups;
         ++Game.numAppearingPickups;
         this.renderFunction = this.RenderAppearingPickup;
         this.updateFunction = this.UpdateAppearingPickup;
         this.collisionHitFunction = this.HitAppearingPickup;
         this.controlMode = 0;
         this.frame = 0;
         this.colFlag_isGoPhysObj = true;
         this.colOffsetX = 0;
         this.colOffsetY = 0;
         this.radius = 40;
         this.sortByY = true;
         this.visible = false;
         this.scale = 1;
         this.frame = 0;
         this.alpha = 0;
         this.visible = false;
      }
      
      internal function HitCoconut(param1:GameObj) : void
      {
         var _loc2_:Number = NaN;
         var _loc3_:Number = NaN;
         if(this.controlMode != 0)
         {
            return;
         }
         param1.VehicleHitObject(this);
         if(this.GetHitterSpeed(param1) > 5)
         {
            if(param1.colFlag_isPlayer)
            {
               SoundPlayer.Play("sfx_hit_coconut");
            }
         }
         if(param1.colFlag_isPlayer)
         {
            Game.AddHitObject("coconut");
         }
         Game.AddDestroyedObject("coconut");
         _loc2_ = Utils.RandBetweenFloat(-3,3);
         _loc3_ = Utils.RandBetweenFloat(-3,3);
         Game.AddGameObjectAt("coconut_half_1",this.xpos + _loc2_,this.ypos + _loc3_,0,"","");
         _loc2_ = Utils.RandBetweenFloat(-3,3);
         _loc3_ = Utils.RandBetweenFloat(-3,3);
         Game.AddGameObjectAt("coconut_half_2",this.xpos + _loc2_,this.ypos + _loc3_,0,"","");
         this.killed = true;
         if(param1.colFlag_isPlayer)
         {
            Game.levelFunctions.TriggerAction(0);
         }
      }
      
      internal function UpdateSnowman() : void
      {
         if(this.controlMode == 1)
         {
            if(this.PlayAnimation())
            {
               this.killed = false;
            }
         }
      }
      
      internal function HitBeachBall(param1:GameObj) : void
      {
         if(this.controlMode != 0)
         {
            return;
         }
         if(this.GetHitterSpeed(param1) < 5)
         {
            return;
         }
         param1.VehicleHitObject(this);
         if(param1.colFlag_isPlayer)
         {
            SoundPlayer.Play("sfx_hit_beachball");
         }
         if(param1.colFlag_isPlayer)
         {
            Game.AddHitObject("beachball");
         }
         var _loc2_:Number = param1.xpos - param1.oldxpos;
         var _loc3_:Number = param1.ypos - param1.oldypos;
         this.movementVec.SetFromDxDy(_loc2_,_loc3_);
         this.movementVec.AddRot(Utils.RandBetweenFloat(-0.2,0.2));
         this.controlMode = 1;
         this.zvel = -Utils.ScaleToAndLimit(0,5,0,10,this.GetHitterSpeed(param1));
      }
      
      internal function InitSandcastle() : void
      {
         Game.AddObjectCount("sandcastle");
         this.updateFunction = this.UpdateSandcastle;
         this.collisionHitFunction = this.HitSandcastle;
         this.controlMode = 0;
         this.colFlag_isGoPhysObj = true;
         this.colOffsetX = 0;
         this.colOffsetY = 0;
         this.radius = 10;
         this.movementVec = new Vec();
         this.height = 0;
         this.sortByY = true;
      }
      
      public function InitPickup() : *
      {
         this.colFlag_canBePickedUp = true;
         this.graphicID = GraphicObjects.GetIndexByName("coins");
         this.frame = Utils.RandBetweenInt(0,30);
         this.frameVel = 1;
         this.updateFunction = this.UpdatePickup;
      }
      
      internal function UpdateCow() : *
      {
         this.frameVel = 0.25;
         if(this.controlMode == 0)
         {
            this.minFrame = 0;
            this.maxFrame = 7 - 1;
            this.CycleAnimationEx();
            this.zvel += 0.2;
            this.height += this.zvel;
            if(this.height > 0)
            {
               this.height = 0;
               this.zvel = 0;
            }
            this.cowRenderBeam = false;
         }
         else
         {
            this.minFrame = 8 - 1;
            this.maxFrame = 20 - 1;
            this.CycleAnimationEx();
            this.controlMode = 0;
            this.cowRenderBeam = true;
         }
      }
      
      internal function RenderCarObjAt(param1:Number, param2:Number, param3:int, param4:int, param5:int, param6:ColorTransform = null) : *
      {
         var _loc7_:Number = int(param1) - int(Game.camera.x);
         var _loc8_:Number = int(param2) - int(Game.camera.y);
         if(_loc7_ < -1000)
         {
            return;
         }
         if(_loc7_ > Defs.displayarea_w + 500)
         {
            return;
         }
         if(_loc8_ < -1000)
         {
            return;
         }
         if(_loc8_ > Defs.displayarea_h + 500)
         {
            return;
         }
         _loc7_ -= 32;
         _loc8_ -= 32;
         var _loc9_:int = param4 % 16;
         var _loc10_:int = param4 / 16;
         var _loc11_:int = _loc9_ * 64;
         var _loc12_:int = _loc10_ * 64;
         var _loc13_:Rectangle = new Rectangle(0,0,64,64);
         var _loc14_:int = param5;
         _loc14_ = _loc14_ + this.type * 2;
         GraphicObjects.RenderAtRotScaled_SourceRect(param3,_loc14_,this.bd,_loc7_,_loc8_,this.scale,0,param6,false,_loc13_,_loc11_,_loc12_);
      }
      
      internal function UpdateCoconutHalf() : void
      {
         if(this.controlMode == 0)
         {
         }
         if(this.controlMode == 1)
         {
            this.zvel += 0.4;
            this.height += this.zvel;
            if(this.height >= 0)
            {
               this.height = 0;
               this.movementVec.speed *= 0.5;
               this.zvel *= -0.6;
               if(this.movementVec.speed <= 0.4)
               {
                  this.controlMode = 0;
               }
            }
            this.xpos += this.movementVec.GetXComponent();
            this.ypos += this.movementVec.GetYComponent();
            this.frameVel = Utils.ScaleToAndLimit(0,1,0,6,this.movementVec.speed);
            this.CycleAnimation();
         }
      }
      
      internal function UpdateRaceQueen() : void
      {
         this.xpos = Game.camera.x + 0;
         this.ypos = Game.camera.y + 0;
         if(this.controlMode == 0)
         {
            this.alpha += 0.1;
            if(this.alpha >= 1)
            {
               this.alpha = 1;
            }
         }
         if(this.controlMode == 1)
         {
            if(this.PlayAnimation())
            {
               this.controlMode = 2;
               this.timer = Defs.fps * 1;
            }
         }
         else if(this.controlMode == 2)
         {
            --this.timer;
            if(this.timer <= 0)
            {
               this.controlMode = 3;
            }
         }
         else if(this.controlMode == 3)
         {
            this.alpha -= 0.1;
            if(this.alpha <= 0)
            {
               this.alpha = 0;
               this.killed = true;
            }
         }
         if(this.controlMode == 10)
         {
         }
      }
      
      internal function InitBomb(param1:GameObj) : *
      {
         this.updateFunction = this.UpdateBomb;
         this.renderFunction = this.RenderBomb;
         this.movementVec.Set(param1.movementVec.rot,param1.movementVec.speed);
         this.height = param1.height + 10;
         this.xpos = param1.xpos;
         this.ypos = param1.ypos;
         this.zpos = param1.zpos;
         this.graphicID = GraphicObjects.GetIndexByName("Bomb");
         this.frame = 0;
         this.zvel = 0;
         this.sortByY = true;
         this.frameVel = 1;
      }
      
      internal function InitStaticObject_Cloud() : void
      {
         this.sortByY = true;
         ++Game.numStaticObjects;
         this.zbodge = -1000;
      }
      
      internal function RenderCow() : void
      {
         this.RenderSimpleShadow(4);
         this.RenderObjAt(this.xpos,this.ypos + this.height,this.graphicID,this.frame);
         if(this.cowRenderBeam)
         {
            this.RenderObjAt(this.xpos,this.ypos - 30,GraphicObjects.GetIndexByName("FX_UFO"),0);
         }
      }
      
      internal function RenderFruit() : void
      {
         this.RenderNormallyAlpha();
      }
   }
}

