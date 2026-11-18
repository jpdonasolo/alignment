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
   import flash.display.BlendMode;
   import flash.display.Graphics;
   import flash.display.GraphicsPath;
   import flash.display.GraphicsSolidFill;
   import flash.display.GraphicsStroke;
   import flash.display.IGraphicsData;
   import flash.display.MovieClip;
   import flash.events.*;
   import flash.geom.ColorTransform;
   import flash.geom.Matrix;
   import flash.geom.Point;
   import flash.geom.Rectangle;
   import flash.media.SoundChannel;
   import flash.system.System;
   import flash.ui.*;
   import flash.utils.ByteArray;
   import org.flashdevelop.utils.FlashConnect;
   
   public class Game
   {
      
      internal static var goReadySetGo:GameObj;
      
      internal static var playerNumJumps:int;
      
      internal static var bgFrame:int;
      
      internal static var playerTurnDiff:Number;
      
      internal static var levelTimedOut:Boolean;
      
      internal static var levelsMinSpd:Number;
      
      internal static var newLevelUnlockedIndex:int;
      
      internal static var lastMemUsed:int;
      
      public static var currentAppearingPickup:int;
      
      internal static var currentStartPointIndex:int;
      
      public static var numVehicles:int;
      
      internal static var num_turbos_used:int;
      
      internal static var trackPieces:Vector.<GameObj>;
      
      internal static var swapZones:Array;
      
      internal static var pickupHitTimerMax:int;
      
      internal static var levelFunctions:LevelFunctions;
      
      internal static var playerInAirTime:int;
      
      internal static var driftLapComplete:Boolean;
      
      internal static var physObjs:PhysObjs;
      
      public static var maxFallSpeed:*;
      
      internal static var bonusUnlocks:Array;
      
      internal static var numLevels:int;
      
      internal static var startCountdownTimer:int;
      
      internal static var currentScore:int;
      
      internal static var readySetGoFrame:int;
      
      public static var cowsAbducted:int;
      
      internal static var playerTotalInAirTime:int;
      
      internal static var wrongWayFlag:Boolean;
      
      public static var gettingReady:Boolean;
      
      internal static var playerCarColorIndex:int;
      
      internal static var playerTotalCheckpointIndex:int;
      
      internal static var newLevelUnlockedFlag:Boolean;
      
      internal static var full_turbo_achieved:Boolean;
      
      internal static var totalCashPickups:int;
      
      internal static var frameAngs:Array;
      
      public static var numStaticObjects:int;
      
      public static var polygonList:Array;
      
      internal static var minimapBD:BitmapData;
      
      public static var timesList:Array;
      
      public static var numTrackPieces:int;
      
      internal static var playerName:String;
      
      internal static var numLives:int;
      
      public static var playerCurrentSkidDist:int;
      
      internal static var floorBD:BitmapData;
      
      internal static var playerTurnDiffAbs:Number;
      
      public static var LapPositions:Array;
      
      internal static var skidLines:Vector.<SkidLine>;
      
      internal static var levelScore:int;
      
      internal static var levels:Array;
      
      internal static var aiCarColorList:Array;
      
      internal static var previousStaticPoints:Array;
      
      internal static var currentLevel:int;
      
      internal static var best_drift:int;
      
      internal static var effectBD:BitmapData;
      
      internal static var fr_edit:Number;
      
      internal static var mm_x:Number;
      
      internal static var mm_y:Number;
      
      internal static var levelStateCount:int;
      
      internal static var objectsDestroyedList:CountList;
      
      internal static var fillScreenMC:MovieClip;
      
      internal static var panelOverlay:MovieClip;
      
      internal static var main:Main;
      
      internal static var perfectStartCount:int;
      
      internal static var cheatActive:int;
      
      internal static var multiplier:int;
      
      internal static var swapLists:Array;
      
      internal static var totalBoostPickups:int;
      
      internal static var levscore_pickups:int;
      
      internal static var numRacesCompleted:int;
      
      internal static var lastGeneratedGameObj:GameObj;
      
      internal static var upgrades:Upgrades;
      
      internal static var playerHitVehicles:Boolean;
      
      internal static var hitWhaleFlag:Boolean;
      
      internal static var goPlayer:GameObj;
      
      internal static var best_drift_mutiplier:int;
      
      internal static var playerGoneOffRoad:Boolean;
      
      internal static var playerBoatName:String;
      
      internal static var pause:Boolean;
      
      public static var currentCarIndex:int;
      
      internal static var oldRecordPosY:Number;
      
      internal static var oldRecordPosX:Number;
      
      internal static var pickupHitTimer:int;
      
      internal static var carpath:Array;
      
      internal static var levelTimer:int;
      
      internal static var levelNames:Array;
      
      public static var finalRaceOrder:Array;
      
      internal static var mc_321go:GameObj;
      
      public static var numAppearingPickups:int;
      
      internal static var playbackPos:int;
      
      internal static var turboOffsets:Array;
      
      public static var gravity:*;
      
      internal static var limited_time:int;
      
      internal static var checkpointLines:Array;
      
      internal static var carColors:Array;
      
      internal static var wheelOffsets:Array;
      
      internal static var bonusNames:Array;
      
      internal static var turboStartSuccess:Boolean;
      
      internal static var pickupHitInRowCount:int;
      
      internal static var playerHitScenery:Boolean;
      
      internal static var levelWon:Boolean;
      
      internal static var levscore_obstacles:int;
      
      internal static var playerFrame1:Number;
      
      public static var noLapFlag:Boolean;
      
      public static var numFruitCollected:int;
      
      internal static var effectBDFull:BitmapData;
      
      internal static var totalObjectsDestroyed:int;
      
      internal static var currentPlaybackNode:PlayerRecordData;
      
      internal static var turboStartPressed:Boolean;
      
      internal static var floorTiles:Vector.<GameObj>;
      
      internal static var totalWonInRow:int;
      
      public static var numLaps:int;
      
      internal static var total_drift:int;
      
      internal static var best_lap_time:int;
      
      internal static var raceTimer:int;
      
      internal static var pauseGameplayInput:Boolean;
      
      internal static var numBoostPickups:int;
      
      public static var raceOrder:Array;
      
      public static var numFloorTiles:int;
      
      internal static var playerFrame:int;
      
      internal static var playerBestAirTime:int;
      
      internal static var numAIVehicles:int;
      
      internal static var numRacesWon:int;
      
      internal static var objectsHitList:CountList;
      
      public static var achievements:Achievements;
      
      internal static var camera:Camera;
      
      public static var numPickups:int;
      
      internal static var fillScreenMC1:MovieClip;
      
      internal static var cash:int;
      
      internal static var reedPolys:Array;
      
      internal static var levscore_skids:int;
      
      public static var cowsSaved:int;
      
      internal static var numPickupsCollected:int;
      
      public static var numCollisionTests:int;
      
      internal static var playerCarDataIndex:int;
      
      internal static var startCountdownTime:int;
      
      internal static var levelState:int;
      
      internal static var nextAICarColor:int;
      
      internal static var physObjInstances:PhysObj_Instances;
      
      public static var playerCarIndex:int;
      
      internal static var level_instances:Array;
      
      internal static var race_time:int;
      
      internal static var numCashPickups:int;
      
      internal static var limited_time_limit:int;
      
      public static var world:b2World;
      
      internal static var objectsCountList:CountList;
      
      internal static var lap_times:Array;
      
      internal static var lap_timer:int;
      
      public static var playerTotalSkidDist:int;
      
      internal static var driftLapFlag:Boolean;
      
      internal static var numRacesNotWon:int;
      
      internal static var gameState:int;
      
      internal static var groundBody:b2Body;
      
      internal static var currentGameMusic:int;
      
      internal static var levscore_jumps:int;
      
      internal static var startPoints:Array;
      
      internal static var levelStateTimer:int;
      
      internal static var startCountdownFlags:Array;
      
      internal static var playerHitShallows:Boolean;
      
      internal static var levelsMaxSpd:Number;
      
      public static var currentAiCarIndex:int;
      
      internal static var soundon:Boolean = true;
      
      internal static var usedebug:Boolean = false;
      
      internal static var reedSpeedMultiplier0:Number = 0.6;
      
      internal static var reedSpeedMultiplier1:Number = 0.9;
      
      internal static var score_ramp:int = 1000;
      
      internal static var score_hump:int = 100;
      
      internal static var score_pickup:int = 1000;
      
      internal static var score_scorepickup:int = 10000;
      
      internal static var score_breakage:int = 1000;
      
      internal static var score_whale:int = 2000;
      
      internal static var score_oilburn:int = 2000;
      
      internal static var score_bird:int = 500;
      
      internal static var difficulty:int = 0;
      
      internal static var difficultyText:Array = new Array("Normal","Harder","Hardest");
      
      internal static var totalWonInRowPerLevel:Array = new Array();
      
      internal static const gameState_UI:* = 0;
      
      internal static const gameState_Play:* = 1;
      
      internal static const levelState_LevelStart:* = 0;
      
      internal static const levelState_Play:* = 1;
      
      internal static const levelState_Null:* = 2;
      
      internal static const levelState_Editor:* = 3;
      
      internal static const levelState_Complete:* = 4;
      
      internal static const levelState_EndScreen:* = 5;
      
      internal static const colCategory_Background:int = 1;
      
      internal static const colCategory_Player:int = 2;
      
      internal static const colCategory_Enemy:int = 4;
      
      internal static var physNumIterations:int = 10;
      
      internal static var physStep:Number = 1 / 30;
      
      internal static var p2w:Number = 20;
      
      internal static var w2p:Number = 1 / p2w;
      
      internal static var physGravity:Number = 0;
      
      internal static var mouseJoint:b2MouseJoint = null;
      
      internal static var playerPos:Point = new Point(0,0);
      
      internal static var zsortoffset:Number = 0;
      
      internal static var levelPlaceCashList:Array = new Array(2000,1000,500,300,200,100);
      
      internal static var wheelMarker0:Array = new Array(new Point(-8,12),new Point(-10,11),new Point(-10,8),new Point(-13,9),new Point(-12,6),new Point(-15,4),new Point(-12,2),new Point(-10,2),new Point(-12,-1),new Point(-12,-4),new Point(-11,-5),new Point(-11,-5),new Point(-10,0),new Point(-10,-7),new Point(-8,-2),new Point(-5,-7),new Point(-5,-6),new Point(-4,-5),new Point(-3,-3),new Point(-1,-7),new Point(-2,-4),new Point(0,-5),new Point(1,-5),new Point(5,-2),new Point(6,-4),new Point(10,2),new Point(11,3),new Point(12,5),new Point(14,5),new Point(15,6),new Point(15,7),new Point(14,10),new Point(13,11),new Point(12,12),new Point(11,13),new Point(10,14),new Point(8,15),new Point(7,15),new Point(5,15),new Point(3,16),new Point(1,16),new Point(-1,16),new Point(-2,15),new Point(-4,15),new Point(-5,14),new Point(-6,13),new Point(-7,13),new Point(-8,13));
      
      internal static var wheelMarker1:Array = new Array(new Point(10,11),new Point(10,12),new Point(8,13),new Point(7,13),new Point(5,13),new Point(4,15),new Point(1,15),new Point(0,15),new Point(-3,15),new Point(-4,15),new Point(-7,15),new Point(-8,15),new Point(-10,14),new Point(-12,14),new Point(-13,13),new Point(-14,12),new Point(-15,11),new Point(-16,11),new Point(-16,9),new Point(-17,7),new Point(-16,6),new Point(-16,4),new Point(-14,3),new Point(-11,-1),new Point(-9,-2),new Point(-2,-4),new Point(0,-3),new Point(4,-5),new Point(1,0),new Point(5,0),new Point(5,0),new Point(4,2),new Point(7,-1),new Point(9,0),new Point(7,-1),new Point(10,6),new Point(10,3),new Point(11,7),new Point(10,4),new Point(7,5),new Point(12,5),new Point(7,16),new Point(12,6),new Point(12,11),new Point(11,7),new Point(9,9),new Point(10,10),new Point(10,10));
      
      internal static var wheelMarker2:Array = new Array(new Point(-9,12),new Point(-10,11),new Point(-10,8),new Point(-13,9),new Point(-12,6),new Point(-15,4),new Point(-12,2),new Point(-10,2),new Point(-12,-1),new Point(-12,-4),new Point(-11,-5),new Point(-11,-5),new Point(-10,0),new Point(-10,-7),new Point(-8,-2),new Point(-5,-7),new Point(-5,-6),new Point(-4,-5),new Point(-3,-3),new Point(-1,-7),new Point(-2,-4),new Point(0,-5),new Point(1,-5),new Point(5,-2),new Point(6,-4),new Point(10,2),new Point(14,4),new Point(15,5),new Point(16,5),new Point(16,6),new Point(16,9),new Point(16,10),new Point(16,11),new Point(15,12),new Point(14,14),new Point(12,14),new Point(10,15),new Point(8,16),new Point(6,16),new Point(4,17),new Point(2,17),new Point(0,17),new Point(-2,17),new Point(-5,16),new Point(-6,16),new Point(-7,15),new Point(-7,14),new Point(-9,14));
      
      internal static var wheelMarker3:Array = new Array(new Point(10,11),new Point(10,13),new Point(8,14),new Point(6,15),new Point(5,16),new Point(2,17),new Point(1,17),new Point(-1,17),new Point(-4,16),new Point(-6,16),new Point(-8,16),new Point(-8,14),new Point(-12,15),new Point(-14,14),new Point(-14,12),new Point(-16,11),new Point(-17,10),new Point(-18,9),new Point(-18,8),new Point(-18,7),new Point(-17,4),new Point(-16,4),new Point(-14,3),new Point(-11,-1),new Point(-9,-2),new Point(-2,-4),new Point(0,-3),new Point(2,-1),new Point(1,0),new Point(5,0),new Point(5,0),new Point(4,-2),new Point(7,-1),new Point(9,0),new Point(7,-1),new Point(10,1),new Point(9,1),new Point(11,3),new Point(12,2),new Point(10,4),new Point(13,3),new Point(12,8),new Point(13,6),new Point(10,8),new Point(13,7),new Point(9,9),new Point(11,11),new Point(10,10));
      
      internal static var wheelMarker4:Array = new Array(new Point(-8,12),new Point(-10,11),new Point(-10,8),new Point(-13,9),new Point(-12,6),new Point(-15,4),new Point(-12,2),new Point(-10,2),new Point(-12,-1),new Point(-12,-4),new Point(-11,-5),new Point(-11,-5),new Point(-10,0),new Point(-10,-7),new Point(-8,-2),new Point(-5,-7),new Point(-5,-6),new Point(-4,-5),new Point(-3,-3),new Point(-1,-7),new Point(-2,-4),new Point(0,-5),new Point(1,-5),new Point(5,-2),new Point(6,-4),new Point(10,2),new Point(13,3),new Point(14,5),new Point(14,5),new Point(16,6),new Point(15,8),new Point(16,9),new Point(15,11),new Point(14,12),new Point(13,13),new Point(11,14),new Point(9,15),new Point(7,16),new Point(5,15),new Point(4,16),new Point(1,16),new Point(0,16),new Point(-3,16),new Point(-5,15),new Point(-6,15),new Point(-7,14),new Point(-6,12),new Point(-9,13));
      
      internal static var wheelMarker5:Array = new Array(new Point(9,11),new Point(10,13),new Point(8,13),new Point(5,13),new Point(5,13),new Point(3,15),new Point(1,15),new Point(-1,16),new Point(-4,16),new Point(-5,16),new Point(-8,16),new Point(-10,15),new Point(-11,14),new Point(-12,13),new Point(-14,12),new Point(-14,11),new Point(-16,10),new Point(-16,9),new Point(-17,8),new Point(-17,7),new Point(-16,4),new Point(-16,4),new Point(-14,3),new Point(-11,-1),new Point(-9,-2),new Point(-2,-4),new Point(0,-3),new Point(2,-1),new Point(1,0),new Point(5,0),new Point(5,0),new Point(4,-2),new Point(7,-1),new Point(9,0),new Point(7,-1),new Point(10,1),new Point(9,1),new Point(11,3),new Point(10,4),new Point(10,4),new Point(12,5),new Point(12,8),new Point(11,7),new Point(10,8),new Point(9,7),new Point(9,9),new Point(7,11),new Point(8,10));
      
      internal static var wheelMarker6:Array = new Array(new Point(-9,12),new Point(-10,11),new Point(-10,8),new Point(-13,9),new Point(-12,6),new Point(-15,4),new Point(-12,2),new Point(-10,2),new Point(-12,-1),new Point(-12,-4),new Point(-11,-5),new Point(-11,-5),new Point(-10,0),new Point(-10,-7),new Point(-8,-2),new Point(-5,-7),new Point(-5,-6),new Point(-4,-5),new Point(-3,-3),new Point(-1,-7),new Point(-2,-4),new Point(0,-5),new Point(1,-5),new Point(5,-2),new Point(6,-4),new Point(11,2),new Point(11,3),new Point(13,6),new Point(14,5),new Point(15,6),new Point(15,7),new Point(14,9),new Point(14,11),new Point(12,12),new Point(12,13),new Point(10,14),new Point(9,15),new Point(7,15),new Point(6,16),new Point(4,17),new Point(2,17),new Point(0,17),new Point(-3,16),new Point(-5,15),new Point(-6,14),new Point(-6,12),new Point(-7,12),new Point(-8,12));
      
      internal static var wheelMarker7:Array = new Array(new Point(9,11),new Point(10,13),new Point(8,13),new Point(5,14),new Point(5,14),new Point(3,15),new Point(0,16),new Point(-1,16),new Point(-4,16),new Point(-5,15),new Point(-7,15),new Point(-9,14),new Point(-10,14),new Point(-12,13),new Point(-13,11),new Point(-14,11),new Point(-15,11),new Point(-16,9),new Point(-17,8),new Point(-17,7),new Point(-16,4),new Point(-16,4),new Point(-14,3),new Point(-11,-1),new Point(-9,-2),new Point(-2,-4),new Point(0,-3),new Point(2,-1),new Point(1,0),new Point(5,0),new Point(5,0),new Point(4,-2),new Point(7,-1),new Point(9,0),new Point(7,-1),new Point(10,1),new Point(9,1),new Point(11,3),new Point(10,4),new Point(10,4),new Point(12,5),new Point(12,8),new Point(11,7),new Point(10,8),new Point(9,7),new Point(9,9),new Point(7,11),new Point(8,10));
      
      internal static var wheelMarker8:Array = new Array(new Point(-8,12),new Point(-10,11),new Point(-10,8),new Point(-13,9),new Point(-12,6),new Point(-15,4),new Point(-12,2),new Point(-10,2),new Point(-12,-1),new Point(-12,-4),new Point(-11,-5),new Point(-11,-5),new Point(-10,0),new Point(-10,-7),new Point(-8,-2),new Point(-5,-7),new Point(-5,-6),new Point(-4,-5),new Point(-3,-3),new Point(-1,-7),new Point(-2,-4),new Point(0,-5),new Point(1,-5),new Point(5,-2),new Point(6,-4),new Point(10,2),new Point(12,3),new Point(14,6),new Point(15,6),new Point(15,7),new Point(16,9),new Point(15,10),new Point(15,11),new Point(14,12),new Point(13,13),new Point(11,14),new Point(10,15),new Point(8,16),new Point(6,16),new Point(5,16),new Point(2,17),new Point(0,17),new Point(-3,16),new Point(-5,16),new Point(-6,14),new Point(-7,14),new Point(-7,13),new Point(-8,13));
      
      internal static var wheelMarker9:Array = new Array(new Point(10,11),new Point(10,13),new Point(8,13),new Point(5,14),new Point(5,15),new Point(2,15),new Point(0,16),new Point(-2,16),new Point(-4,16),new Point(-6,16),new Point(-8,15),new Point(-10,15),new Point(-12,14),new Point(-13,13),new Point(-14,12),new Point(-15,11),new Point(-16,10),new Point(-17,9),new Point(-17,8),new Point(-17,7),new Point(-16,4),new Point(-16,4),new Point(-14,3),new Point(-12,0),new Point(-9,-2),new Point(-2,-4),new Point(0,-3),new Point(2,-1),new Point(1,0),new Point(5,0),new Point(5,0),new Point(4,-2),new Point(7,-1),new Point(9,0),new Point(7,-1),new Point(10,1),new Point(9,1),new Point(11,3),new Point(10,4),new Point(10,4),new Point(12,5),new Point(12,8),new Point(11,7),new Point(10,8),new Point(11,6),new Point(9,9),new Point(9,10),new Point(8,10));
      
      internal static var turboOffset0:Array = new Array(new Point(0,27),new Point(-4,27),new Point(-8,27),new Point(-12,26),new Point(-16,24),new Point(-19,22),new Point(-23,20),new Point(-25,18),new Point(-27,16),new Point(-30,13),new Point(-30,11),new Point(-32,7),new Point(-33,3),new Point(-32,0),new Point(-32,-4),new Point(-31,-6),new Point(-28,-9),new Point(-27,-12),new Point(-21,-13),new Point(-19,-15),new Point(-15,-17),new Point(-11,-19),new Point(-9,-19),new Point(-4,-18),new Point(0,-20),new Point(4,-19),new Point(7,-18),new Point(13,-17),new Point(16,-15),new Point(19,-14),new Point(20,-12),new Point(23,-10),new Point(25,-8),new Point(28,-5),new Point(29,-3),new Point(31,1),new Point(32,4),new Point(31,8),new Point(31,11),new Point(29,13),new Point(27,17),new Point(26,20),new Point(23,22),new Point(19,23),new Point(16,24),new Point(13,27),new Point(9,27),new Point(4,28));
      
      internal static var turboOffset1:Array = new Array(new Point(0,15),new Point(-3,14),new Point(-5,13),new Point(-8,13),new Point(-10,10),new Point(-14,11),new Point(-16,11),new Point(-14,9),new Point(-17,7),new Point(-18,5),new Point(-19,4),new Point(-22,0),new Point(-19,0),new Point(-17,-3),new Point(-18,-4),new Point(-17,-7),new Point(-15,-8),new Point(-14,-8),new Point(-13,-10),new Point(-12,-13),new Point(-9,-13),new Point(-8,-13),new Point(-4,-14),new Point(-1,-14),new Point(0,-13),new Point(4,-12),new Point(8,-14),new Point(9,-11),new Point(12,-12),new Point(14,-10),new Point(15,-7),new Point(18,-6),new Point(20,-5),new Point(21,-5),new Point(22,-3),new Point(22,0),new Point(20,1),new Point(21,3),new Point(18,4),new Point(19,6),new Point(19,10),new Point(18,11),new Point(15,10),new Point(13,11),new Point(10,14),new Point(9,14),new Point(6,16),new Point(2,13));
      
      internal static var turboOffset2:Array = new Array(new Point(0,15),new Point(-3,14),new Point(-5,13),new Point(-8,13),new Point(-10,10),new Point(-14,11),new Point(-16,11),new Point(-14,9),new Point(-17,7),new Point(-18,5),new Point(-19,4),new Point(-22,0),new Point(-19,0),new Point(-17,-3),new Point(-18,-4),new Point(-17,-7),new Point(-15,-8),new Point(-14,-8),new Point(-13,-10),new Point(-12,-13),new Point(-9,-13),new Point(-8,-13),new Point(-4,-14),new Point(-1,-14),new Point(0,-13),new Point(4,-12),new Point(8,-14),new Point(9,-11),new Point(12,-12),new Point(14,-10),new Point(15,-7),new Point(18,-6),new Point(20,-5),new Point(21,-5),new Point(22,-3),new Point(22,0),new Point(20,1),new Point(21,3),new Point(18,4),new Point(19,6),new Point(19,10),new Point(18,11),new Point(15,10),new Point(13,11),new Point(10,14),new Point(9,14),new Point(6,16),new Point(2,13));
      
      internal static var turboOffset3:Array = new Array(new Point(0,15),new Point(-3,14),new Point(-5,13),new Point(-8,13),new Point(-10,10),new Point(-14,11),new Point(-16,11),new Point(-14,9),new Point(-17,7),new Point(-18,5),new Point(-19,4),new Point(-22,0),new Point(-19,0),new Point(-17,-3),new Point(-18,-4),new Point(-17,-7),new Point(-15,-8),new Point(-14,-8),new Point(-13,-10),new Point(-12,-13),new Point(-9,-13),new Point(-8,-13),new Point(-4,-14),new Point(-1,-14),new Point(0,-13),new Point(4,-12),new Point(8,-14),new Point(9,-11),new Point(12,-12),new Point(14,-10),new Point(15,-7),new Point(18,-6),new Point(20,-5),new Point(21,-5),new Point(22,-3),new Point(22,0),new Point(20,1),new Point(21,3),new Point(18,4),new Point(19,6),new Point(19,10),new Point(18,11),new Point(15,10),new Point(13,11),new Point(10,14),new Point(9,14),new Point(6,16),new Point(2,13));
      
      internal static var turboOffset4:Array = new Array(new Point(0,15),new Point(-3,14),new Point(-5,13),new Point(-8,13),new Point(-10,10),new Point(-14,11),new Point(-16,11),new Point(-14,9),new Point(-17,7),new Point(-18,5),new Point(-19,4),new Point(-22,0),new Point(-19,0),new Point(-17,-3),new Point(-18,-4),new Point(-17,-7),new Point(-15,-8),new Point(-14,-8),new Point(-13,-10),new Point(-12,-13),new Point(-9,-13),new Point(-8,-13),new Point(-4,-14),new Point(-1,-14),new Point(0,-13),new Point(4,-12),new Point(8,-14),new Point(9,-11),new Point(12,-12),new Point(14,-10),new Point(15,-7),new Point(18,-6),new Point(20,-5),new Point(21,-5),new Point(22,-3),new Point(22,0),new Point(20,1),new Point(21,3),new Point(18,4),new Point(19,6),new Point(19,10),new Point(18,11),new Point(15,10),new Point(13,11),new Point(10,14),new Point(9,14),new Point(6,16),new Point(2,13));
      
      internal static var playerPosition:int = 0;
      
      internal static var places:Array = new Array("","1st","2nd","3rd","4th","5th","6th","7th","8th","9th");
      
      internal static var gearTimesMinLevel:Array = new Array(1,1.2,1.4,1.6);
      
      internal static var gearTimes:Array = new Array(0.2,0.4,0.7,1);
      
      internal static var poo:MP3Pitch = null;
      
      internal static var followIndex:int = 0;
      
      internal static var graphicSpeedTestToggle:Boolean = false;
      
      internal static var seaTileFrame:int = 5;
      
      internal static var seaTileFrame2:int = 0;
      
      internal static var RenderSeaTilesTimer:int = 0;
      
      internal static var effectTimer:int = 0;
      
      internal static var effectMode:int = 0;
      
      internal static var doHeadlightOverlay:Boolean = false;
      
      internal static var headlightOverlay:MovieClip = null;
      
      internal static var headlightOverlayBD:BitmapData = null;
      
      internal static var scrollScale:Number = 1;
      
      internal static var pvar01:Number = 0;
      
      internal static var pvar02:Number = 0;
      
      internal static var pvar03:Number = 0;
      
      internal static var panelRect:Rectangle = new Rectangle(200,10,200,10);
      
      internal static var panelRect1:Rectangle = new Rectangle(200,3,200,5);
      
      public function Game()
      {
         super();
      }
      
      public static function GetPlayerPosition() : *
      {
         var _loc1_:int = 0;
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         var _loc4_:PhysObj_Instance = null;
         var _loc5_:Point = null;
         var _loc6_:Point = null;
         _loc1_ = 0;
         playerPosition = -1;
         _loc3_ = 0;
         for each(_loc4_ in physObjInstances.list)
         {
            if(_loc4_.isVehicle && _loc4_.isPlayer)
            {
               raceOrder[_loc1_].x = _loc1_;
               raceOrder[_loc1_].y = _loc4_.totalVehicleCheckpointIndex;
               _loc1_++;
            }
         }
         for each(_loc4_ in physObjInstances.list)
         {
            if(_loc4_.isVehicle && _loc4_.isPlayer == false)
            {
               raceOrder[_loc1_].x = _loc1_;
               raceOrder[_loc1_].y = _loc4_.totalVehicleCheckpointIndex;
               _loc1_++;
            }
         }
         _loc3_ = _loc1_;
         _loc1_ = 0;
         while(_loc1_ < _loc3_ - 1)
         {
            _loc2_ = _loc1_ + 1;
            while(_loc2_ < _loc3_)
            {
               _loc5_ = raceOrder[_loc1_].clone();
               _loc6_ = raceOrder[_loc2_].clone();
               if(_loc6_.y > _loc5_.y)
               {
                  raceOrder[_loc1_] = _loc6_;
                  raceOrder[_loc2_] = _loc5_;
               }
               _loc2_++;
            }
            _loc1_++;
         }
         _loc1_ = 0;
         while(_loc1_ < _loc3_)
         {
            if(raceOrder[_loc1_].x == 0)
            {
               playerPosition = _loc1_;
            }
            _loc1_++;
         }
      }
      
      public static function ApplyImpulseToObjectsFromPoint(param1:PhysObj_Instance, param2:Number, param3:Number, param4:Number, param5:Number) : void
      {
         var _loc6_:Number = NaN;
         var _loc7_:b2Body = null;
         var _loc8_:PhysObj_BodyUserData = null;
         var _loc9_:PhysObj_Instance = null;
         var _loc10_:int = 0;
         var _loc11_:b2Vec2 = null;
         var _loc12_:Number = NaN;
         _loc7_ = world.GetBodyList();
         while(_loc7_)
         {
            if(_loc7_.GetUserData() != -1)
            {
               _loc8_ = _loc7_.GetUserData();
               _loc9_ = _loc8_.instance;
               if(_loc9_ != null)
               {
                  _loc10_ = _loc9_.colflags;
                  if(_loc9_ != param1)
                  {
                     _loc11_ = new b2Vec2(_loc7_.GetWorldCenter().x - param2,_loc7_.GetWorldCenter().y - param3);
                     _loc6_ = _loc11_.Length();
                     if(_loc10_ == 0)
                     {
                        if(_loc6_ <= param5)
                        {
                           _loc11_.Normalize();
                           _loc12_ = Utils.ScaleTo(0,param4,0,param5,param5 - _loc6_);
                           _loc11_.Multiply(_loc12_);
                           _loc7_.ApplyImpulse(_loc11_,_loc7_.GetWorldCenter());
                        }
                     }
                     else if(_loc10_ != 1)
                     {
                        if(_loc10_ == 2)
                        {
                           _loc9_.BreakObject(_loc6_);
                        }
                     }
                  }
               }
            }
            _loc7_ = _loc7_.GetNext();
         }
      }
      
      internal static function AddPhysObjAt(param1:String, param2:Number, param3:Number, param4:Number, param5:String = "", param6:String = "") : PhysObj_Instance
      {
         var _loc10_:Number = NaN;
         var _loc11_:Number = NaN;
         var _loc12_:b2BodyDef = null;
         var _loc13_:b2Body = null;
         var _loc14_:b2PolygonDef = null;
         var _loc15_:b2CircleDef = null;
         var _loc16_:int = 0;
         var _loc17_:b2Joint = null;
         var _loc19_:PhysObj_Body = null;
         var _loc20_:PhysObj_Joint = null;
         var _loc21_:Number = NaN;
         var _loc22_:Number = NaN;
         var _loc23_:Point = null;
         var _loc24_:PhysObj_BodyUserData = null;
         var _loc25_:PhysObj_Shape = null;
         var _loc26_:PhysObj_Graphic = null;
         var _loc27_:b2FilterData = null;
         var _loc28_:Point = null;
         var _loc29_:Number = NaN;
         var _loc30_:Number = NaN;
         var _loc31_:Point = null;
         var _loc32_:int = 0;
         var _loc33_:int = 0;
         var _loc34_:b2Body = null;
         var _loc35_:b2Body = null;
         var _loc36_:b2RevoluteJointDef = null;
         var _loc37_:b2PrismaticJointDef = null;
         var _loc38_:Number = NaN;
         var _loc39_:b2Vec2 = null;
         var _loc40_:b2DistanceJointDef = null;
         var _loc41_:Number = NaN;
         var _loc42_:Number = NaN;
         var _loc43_:b2MouseJointDef = null;
         var _loc7_:PhysObj = physObjs.FindByName(param1);
         var _loc8_:PhysObj_Instance = new PhysObj_Instance();
         _loc8_.typeName = param1;
         _loc8_.x = param2;
         _loc8_.y = param3;
         _loc8_.rot = param4;
         _loc8_.bodies = new Array();
         _loc8_.instanceName = param5;
         _loc8_.initParams = param6;
         _loc8_.hitballsound = _loc7_.hitballsound;
         physObjInstances.list.push(_loc8_);
         _loc8_.Init();
         var _loc9_:Number = Utils.DegToRad(param4);
         param2 *= w2p;
         param3 *= w2p;
         var _loc18_:Matrix = new Matrix();
         _loc18_.rotate(_loc9_);
         for each(_loc19_ in _loc7_.bodies)
         {
            _loc12_ = new b2BodyDef();
            _loc21_ = _loc19_.pos.x * w2p;
            _loc22_ = _loc19_.pos.y * w2p;
            _loc23_ = new Point(_loc21_,_loc22_);
            _loc23_ = _loc18_.transformPoint(_loc23_);
            _loc21_ = _loc23_.x;
            _loc22_ = _loc23_.y;
            _loc12_.position.Set(param2 + _loc21_,param3 + _loc22_);
            _loc12_.angularDamping = _loc19_.angularDamping;
            _loc12_.linearDamping = _loc19_.linearDamping;
            _loc12_.angle = _loc9_;
            _loc13_ = world.CreateBody(_loc12_);
            _loc24_ = new PhysObj_BodyUserData();
            _loc24_.type = param1;
            _loc24_.bodyName = _loc19_.name;
            _loc24_.instance = _loc8_;
            _loc13_.SetUserData(_loc24_);
            if(_loc19_.graphics.length != 0)
            {
               _loc26_ = _loc19_.graphics[0];
               _loc24_.gameObjectID = InitPhysicsGO(param2,param3,_loc26_,_loc26_.graphicID,_loc26_.frame,0);
            }
            for each(_loc25_ in _loc19_.shapes)
            {
               _loc27_ = new b2FilterData();
               _loc27_.categoryBits = _loc25_.collisionCategory;
               _loc27_.maskBits = _loc25_.collisionMask;
               if(_loc25_.type == PhysObj_Shape.Type_Poly)
               {
                  _loc14_ = new b2PolygonDef();
                  _loc14_.vertexCount = _loc25_.poly_points.length;
                  _loc14_.filter = _loc27_;
                  _loc14_.isSensor = _loc19_.sensor;
                  _loc16_ = 0;
                  while(_loc16_ < _loc25_.poly_points.length)
                  {
                     _loc28_ = _loc25_.poly_points[_loc16_].clone();
                     _loc29_ = _loc28_.x * w2p;
                     _loc30_ = _loc28_.y * w2p;
                     if(_loc19_.fixed)
                     {
                        _loc31_ = AlignWithPreviousVerts(_loc29_,_loc30_,param2,param3,_loc9_);
                        if(_loc31_ != null)
                        {
                           _loc29_ += _loc31_.x;
                           _loc30_ += _loc31_.y;
                        }
                     }
                     _loc14_.vertices[_loc16_].Set(_loc29_,_loc30_);
                     _loc16_++;
                  }
                  _loc14_.friction = _loc25_.friction;
                  _loc14_.restitution = _loc25_.restitution;
                  _loc14_.density = _loc25_.density;
                  _loc13_.CreateShape(_loc14_);
               }
               else if(_loc25_.type == PhysObj_Shape.Type_Circle)
               {
                  _loc15_ = new b2CircleDef();
                  _loc15_.radius = _loc25_.circle_radius * w2p;
                  _loc15_.filter = _loc27_;
                  _loc15_.isSensor = _loc19_.sensor;
                  _loc15_.localPosition.x = _loc25_.circle_pos.x * w2p;
                  _loc15_.localPosition.y = _loc25_.circle_pos.y * w2p;
                  _loc15_.friction = _loc25_.friction;
                  _loc15_.restitution = _loc25_.restitution;
                  _loc15_.density = _loc25_.density;
                  _loc13_.CreateShape(_loc15_);
               }
            }
            if(_loc19_.fixed)
            {
               _loc13_.PutToSleep();
               _loc13_.SetMass(new b2MassData());
            }
            else
            {
               _loc13_.SetMassFromShapes();
               _loc13_.SetBullet(true);
            }
            _loc8_.bodies.push(_loc13_);
         }
         for each(_loc20_ in _loc7_.joints)
         {
            _loc32_ = _loc7_.BodyIndexFromName(_loc20_.obj0Name);
            _loc33_ = _loc7_.BodyIndexFromName(_loc20_.obj1Name);
            _loc34_ = _loc8_.bodies[_loc32_];
            _loc35_ = _loc8_.bodies[_loc33_];
            if(_loc20_.type == PhysObj_Joint.Type_Rev)
            {
               _loc36_ = new b2RevoluteJointDef();
               _loc10_ = _loc20_.rev_pos.x * w2p;
               _loc11_ = _loc20_.rev_pos.y * w2p;
               _loc23_ = new Point(_loc10_,_loc11_);
               _loc23_ = _loc18_.transformPoint(_loc23_);
               _loc10_ = _loc23_.x;
               _loc11_ = _loc23_.y;
               _loc36_.Initialize(_loc34_,_loc35_,new b2Vec2(param2 + _loc10_,param3 + _loc11_));
               _loc36_.enableLimit = _loc20_.rev_enableLimit;
               _loc36_.lowerAngle = _loc20_.rev_lowerAngle;
               _loc36_.upperAngle = _loc20_.rev_upperAngle;
               _loc36_.enableMotor = _loc20_.rev_enableMotor;
               _loc36_.motorSpeed = _loc20_.rev_motorSpeed;
               _loc36_.maxMotorTorque = _loc20_.rev_maxMotorTorque;
               _loc36_.collideConnected = false;
               _loc17_ = world.CreateJoint(_loc36_);
            }
            if(_loc20_.type == PhysObj_Joint.Type_Prismatic)
            {
               _loc37_ = new b2PrismaticJointDef();
               _loc10_ = _loc20_.prism_pos.x * w2p;
               _loc11_ = _loc20_.prism_pos.y * w2p;
               _loc23_ = new Point(_loc10_,_loc11_);
               _loc23_ = _loc18_.transformPoint(_loc23_);
               _loc10_ = _loc23_.x;
               _loc11_ = _loc23_.y;
               _loc38_ = Utils.DegToRad(_loc20_.prism_axisangle);
               _loc38_ = _loc38_ + _loc9_;
               _loc39_ = new b2Vec2(Math.cos(_loc38_),Math.sin(_loc38_));
               _loc37_.Initialize(_loc34_,_loc35_,new b2Vec2(param2 + _loc10_,param3 + _loc11_),_loc39_);
               _loc37_.enableLimit = _loc20_.prism_enableLimit;
               _loc37_.lowerTranslation = _loc20_.prism_lowerTranslation * w2p;
               _loc37_.upperTranslation = _loc20_.prism_upperTranslation * w2p;
               _loc37_.enableMotor = _loc20_.prism_enableMotor;
               _loc37_.motorSpeed = _loc20_.prism_motorSpeed;
               _loc37_.maxMotorForce = _loc20_.prism_maxMotorForce;
               _loc37_.collideConnected = false;
               _loc17_ = world.CreateJoint(_loc37_);
            }
            if(_loc20_.type == PhysObj_Joint.Type_Distance)
            {
               _loc40_ = new b2DistanceJointDef();
               _loc10_ = _loc20_.dist_pos0.x * w2p;
               _loc11_ = _loc20_.dist_pos0.y * w2p;
               _loc41_ = _loc20_.dist_pos1.x * w2p;
               _loc42_ = _loc20_.dist_pos1.y * w2p;
               _loc23_ = new Point(_loc10_,_loc11_);
               _loc23_ = _loc18_.transformPoint(_loc23_);
               _loc10_ = _loc23_.x;
               _loc11_ = _loc23_.y;
               _loc23_ = new Point(_loc41_,_loc42_);
               _loc23_ = _loc18_.transformPoint(_loc23_);
               _loc41_ = _loc23_.x;
               _loc42_ = _loc23_.y;
               _loc40_.Initialize(_loc34_,_loc35_,new b2Vec2(param2 + _loc10_,param3 + _loc11_),new b2Vec2(param2 + _loc41_,param3 + _loc42_));
               _loc40_.length += _loc20_.dist_distance * w2p;
               _loc40_.dampingRatio = 0.1;
               _loc40_.collideConnected = false;
               _loc17_ = world.CreateJoint(_loc40_);
            }
            if(_loc20_.type == PhysObj_Joint.Type_Mouse)
            {
               _loc43_ = new b2MouseJointDef();
               _loc43_.target.Set(_loc34_.GetPosition().x,_loc34_.GetPosition().y);
               _loc43_.body1 = world.GetGroundBody();
               _loc43_.body2 = _loc34_;
               _loc43_.maxForce = 30000 * _loc34_.GetMass();
               _loc43_.dampingRatio = 0.7;
               _loc43_.frequencyHz = 10;
               _loc43_.timeStep = 1 / 60;
               _loc17_ = world.CreateJoint(_loc43_);
               mouseJoint = _loc17_ as b2MouseJoint;
            }
            _loc8_.joints.push(_loc17_);
         }
         return _loc8_;
      }
      
      internal static function UpdateLevel() : *
      {
         var _loc1_:PhysObj_Instance = physObjInstances.FindByTypeName("playervehicle");
         if(_loc1_ == null)
         {
            return;
         }
         var _loc2_:b2Vec2 = _loc1_.GetBodyWorldPos(0);
         playerPos.x = _loc2_.x * p2w;
         playerPos.y = _loc2_.y * p2w;
      }
      
      internal static function GetInitialStartPoint() : Point
      {
         var _loc2_:Point = null;
         var _loc1_:Point = null;
         var _loc3_:Number = 999999;
         for each(_loc2_ in startPoints)
         {
            if(_loc2_.x < _loc3_)
            {
               _loc3_ = _loc2_.x;
               _loc1_ = _loc2_;
            }
         }
         return _loc1_;
      }
      
      internal static function GetNearestGameObjByName(param1:String, param2:Number, param3:Number) : GameObj
      {
         var _loc4_:GameObj = null;
         var _loc6_:GameObj = null;
         var _loc7_:Number = NaN;
         var _loc5_:int = 999999;
         for each(_loc6_ in GameObjects.objs)
         {
            if(_loc6_.active && _loc6_.name == param1)
            {
               _loc7_ = Utils.DistBetweenPoints(param2,param3,_loc6_.xpos,_loc6_.ypos);
               if(_loc7_ < _loc5_)
               {
                  _loc5_ = _loc7_;
                  _loc4_ = _loc6_;
               }
            }
         }
         return _loc4_;
      }
      
      internal static function DriftChainMessage(param1:Number, param2:Number, param3:int) : *
      {
      }
      
      internal static function NextLevel() : void
      {
         ++currentLevel;
         if(currentLevel >= levels.length)
         {
            currentLevel = 0;
         }
         StartLevelPlay();
      }
      
      public static function InitLevel() : *
      {
         var _loc1_:GameObj = null;
         KeyReader.InitOnce(main.stage);
         Particles.Reset();
         SurfaceParticles.Reset();
         ObjectDefs.Init();
         GameObjects.ClearAll();
         camera.Reset();
         gravity = 0.2;
         maxFallSpeed = 6;
         polygonList = new Array();
         startPoints = new Array();
         levelTimer = 0;
         pause = false;
         StartLevelPlay();
      }
      
      public static function CarFinishedRace(param1:int) : void
      {
         finalRaceOrder.push(param1);
         if(param1 == playerCarIndex)
         {
            if(levelState != levelState_Complete)
            {
               levelWon = true;
               InitLevelState(levelState_Complete);
            }
            PanelOverlay_UpdateLap();
         }
      }
      
      internal static function ResetAllCars() : *
      {
         var _loc1_:int = 0;
         var _loc2_:CarData = null;
         _loc1_ = 0;
         while(_loc1_ < GlobalCarData.carData.length)
         {
            _loc2_ = GlobalCarData.carData[_loc1_];
            _loc2_.available = false;
            _loc2_.upgradeLevel = 0;
            _loc1_++;
         }
         GlobalCarData.carData[0].available = true;
      }
      
      internal static function StartLevelSounds() : *
      {
         var _loc1_:SoundChannel = null;
         poo.active = true;
      }
      
      internal static function ReadBinaryString(param1:ByteArray) : String
      {
         var _loc2_:String = "";
         var _loc3_:int = param1.readShort();
         if(_loc3_ != 0)
         {
            _loc2_ = param1.readMultiByte(_loc3_,"us-ascii");
         }
         return _loc2_;
      }
      
      internal static function CreatePhysObjInstanceAt(param1:String, param2:Number, param3:Number, param4:Number, param5:String = "", param6:String = "") : PhysObj_Instance
      {
         var _loc7_:PhysObj_Instance = new PhysObj_Instance();
         _loc7_.typeName = param1;
         _loc7_.x = param2;
         _loc7_.y = param3;
         _loc7_.rot = param4;
         _loc7_.bodies = new Array();
         _loc7_.instanceName = param5;
         _loc7_.initParams = param6;
         return _loc7_;
      }
      
      internal static function RenderSeaTiles(param1:BitmapData) : *
      {
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         var _loc4_:Graphics = null;
         var _loc5_:Matrix = null;
         var _loc6_:BitmapData = null;
         var _loc7_:BitmapData = null;
         var _loc8_:Number = NaN;
         var _loc9_:Number = NaN;
         var _loc10_:Number = NaN;
         var _loc11_:Number = NaN;
         ++RenderSeaTilesTimer;
         _loc2_ = GraphicObjects.GetIndexByName("SeaTiles");
         _loc3_ = GraphicObjects.GetIndexByName("SeaTilesAlpha");
         if(usedebug)
         {
            if(KeyReader.Pressed(KeyReader.KEY_Z))
            {
               ++seaTileFrame;
               seaTileFrame %= GraphicObjects.GetNumFrames(_loc2_);
            }
            if(KeyReader.Pressed(KeyReader.KEY_X))
            {
               ++seaTileFrame2;
               seaTileFrame2 %= GraphicObjects.GetNumFrames(_loc3_);
            }
         }
         _loc4_ = fillScreenMC.graphics;
         _loc5_ = new Matrix();
         _loc6_ = GraphicObjects.GetBitmapData(_loc2_,seaTileFrame);
         _loc7_ = GraphicObjects.GetBitmapData(_loc3_,seaTileFrame2);
         _loc5_.translate(-camera.x,-camera.y);
         _loc4_.beginBitmapFill(_loc6_,_loc5_,true);
         _loc4_.drawRect(0,0,640,480);
         _loc4_.endFill();
         _loc8_ = Number(RenderSeaTilesTimer) * 0.1;
         _loc9_ = 1 + Math.cos(RenderSeaTilesTimer * 0.1) * 0.05;
         _loc10_ = Math.cos(_loc8_) * 5;
         _loc11_ = Math.sin(_loc8_) * 5;
         _loc5_.identity();
         _loc5_.translate(-camera.x + _loc10_,-camera.y + _loc11_);
         _loc5_.scale(_loc9_,_loc9_);
         _loc4_.beginBitmapFill(_loc7_,_loc5_,true);
         _loc4_.drawRect(0,0,640,480);
         _loc4_.endFill();
      }
      
      public static function StartLevel() : *
      {
         FlashConnect.trace("Func: StartLevel");
         gameState = gameState_Play;
         InitLevel();
      }
      
      internal static function GetRandomNextPath(param1:int) : *
      {
         var _loc2_:Array = null;
         var _loc3_:int = 0;
         for each(_loc2_ in swapLists)
         {
            if(_loc2_[0] == param1)
            {
               _loc3_ = Utils.RandBetweenInt(1,_loc2_.length - 1);
               return _loc2_[_loc3_];
            }
         }
         FlashConnect.trace("GetRandomNextPath error. No entry exists for path: " + param1);
      }
      
      internal static function CreateLineSwapLists() : *
      {
         var _loc2_:Number = NaN;
         var _loc3_:Number = NaN;
         var _loc4_:int = 0;
         var _loc5_:Array = null;
         var _loc6_:PhysLine = null;
         var _loc7_:int = 0;
         var _loc8_:PhysLine = null;
         var _loc9_:Array = null;
         var _loc10_:int = 0;
         var _loc11_:PhysLine = null;
         var _loc12_:String = null;
         var _loc1_:Level = GetCurrentLevel();
         swapLists = new Array();
         _loc4_ = 0;
         while(_loc4_ < _loc1_.lines.length)
         {
            _loc6_ = _loc1_.lines[_loc4_];
            if(_loc6_.type == 5)
            {
               _loc7_ = 0;
               while(_loc7_ < _loc1_.lines.length)
               {
                  _loc8_ = _loc1_.lines[_loc7_];
                  if(_loc8_.type == 1)
                  {
                     _loc2_ = _loc8_.GetLastPoint().x;
                     _loc3_ = _loc8_.GetLastPoint().y;
                     if(_loc6_.PointInPoly(_loc2_,_loc3_))
                     {
                        _loc9_ = new Array();
                        _loc9_.push(_loc7_);
                        _loc10_ = 0;
                        while(_loc10_ < _loc1_.lines.length)
                        {
                           _loc11_ = _loc1_.lines[_loc10_];
                           if(_loc11_.type == 1)
                           {
                              _loc2_ = _loc11_.GetFirstPoint().x;
                              _loc3_ = _loc11_.GetFirstPoint().y;
                              if(_loc6_.PointInPoly(_loc2_,_loc3_))
                              {
                                 _loc9_.push(_loc10_);
                              }
                           }
                           _loc10_++;
                        }
                        swapLists.push(_loc9_);
                     }
                  }
                  _loc7_++;
               }
            }
            _loc4_++;
         }
         FlashConnect.trace("swaplists: ");
         for each(_loc5_ in swapLists)
         {
            _loc12_ = _loc5_[0] + " : ";
            _loc4_ = 1;
            while(_loc4_ < _loc5_.length)
            {
               _loc12_ += _loc5_[_loc4_] + " ";
               _loc4_++;
            }
            FlashConnect.trace(_loc12_);
         }
      }
      
      internal static function AddCheckpointLine(param1:PhysLine) : *
      {
         checkpointLines.push(param1);
      }
      
      internal static function AddReedPoly(param1:PhysLine) : *
      {
         var _loc2_:Array = new Array();
         reedPolys.push(param1);
      }
      
      internal static function AddWaves() : *
      {
         var _loc1_:int = 0;
         var _loc2_:Particle = null;
         _loc1_ = 0;
         while(_loc1_ < 1)
         {
            _loc2_ = SurfaceParticles.Add(camera.x + Utils.RandBetweenInt(-100,740),camera.y + Utils.RandBetweenInt(-100,580));
            _loc2_.InitWave1();
            _loc1_++;
         }
      }
      
      internal static function AdvancePlayback() : *
      {
      }
      
      internal static function StopSkid(param1:int) : void
      {
      }
      
      internal static function StartPlayback() : *
      {
      }
      
      internal static function AddPhysGameObjectAt(param1:String, param2:Number, param3:Number, param4:Number, param5:String = "", param6:String = "") : GameObj
      {
         var _loc9_:PhysObj_Body = null;
         var _loc10_:PhysObj_Graphic = null;
         var _loc7_:GameObj = null;
         var _loc8_:PhysObj = physObjs.FindByName(param1);
         for each(_loc9_ in _loc8_.bodies)
         {
            if(_loc9_.graphics.length != 0)
            {
               _loc10_ = _loc9_.graphics[0];
               _loc7_ = GameObjects.AddObj(param2,param3,_loc10_.zoffset + zsortoffset);
               _loc7_.graphicID = _loc10_.graphicID;
               _loc7_.frame = _loc10_.frame;
               if(_loc10_.goInitFuntion != "")
               {
                  _loc7_[_loc10_.goInitFuntion]();
               }
            }
         }
         return _loc7_;
      }
      
      public static function InitLevelState(param1:int) : *
      {
         levelState = param1;
         levelStateTimer = 0;
         if(levelState == levelState_LevelStart)
         {
            mc_321go = GameObjects.AddObj(0,0,0);
            mc_321go.Init321go();
            startCountdownTimer = 60;
            StartPlayback();
         }
         if(levelState == levelState_Complete)
         {
            QuietAllSounds();
            if(levelTimedOut == false)
            {
               DoEndLevelStuff();
               achievements.TestAll();
            }
            StopRecordPlayer();
            levelStateTimer = Defs.fps * 1;
         }
         if(levelState == levelState_EndScreen)
         {
            QuietAllSounds();
            SaveData.Save();
            if(levelTimedOut == false)
            {
               TitleScreenState.InitLevelComplete();
            }
            else
            {
               TitleScreenState.InitLevelFailed();
            }
         }
         if(levelState == levelState_Play)
         {
            raceTimer = 0;
            StartRecordPlayer();
         }
         if(levelState == levelState_Editor)
         {
            PhysEditor.InitEditor(camera.x,camera.y);
            PhysEditor.currentLevel = currentLevel;
         }
      }
      
      public static function LoadLevelObjectsBinary(param1:Level, param2:ByteArray) : *
      {
         var _loc5_:String = null;
         var _loc6_:Number = NaN;
         var _loc7_:Number = NaN;
         var _loc8_:Number = NaN;
         var _loc9_:String = null;
         var _loc10_:PhysObj_Instance = null;
         var _loc3_:int = ReadBinaryInt(param2);
         FlashConnect.trace("LoadLevelObjectsBinary numObjects " + _loc3_);
         var _loc4_:int = 0;
         while(_loc4_ < _loc3_)
         {
            _loc5_ = ReadBinaryString(param2);
            _loc6_ = ReadBinaryInt(param2);
            _loc7_ = ReadBinaryInt(param2);
            _loc8_ = ReadBinaryInt(param2);
            _loc9_ = "";
            _loc10_ = CreatePhysObjInstanceAt(_loc5_,_loc6_,_loc7_,_loc8_,"",_loc9_);
            param1.instances.push(_loc10_);
            _loc10_ = null;
            _loc4_++;
         }
      }
      
      internal static function LevelFailed() : *
      {
         InitLevelState(levelState_Null);
         TitleScreenState.InitLevelFailScreen();
      }
      
      internal static function InitMessage(param1:String, param2:Number = 320, param3:Number = 100) : *
      {
         var _loc4_:GameObj = null;
         _loc4_ = GameObjects.AddObj(0,0,-500);
         _loc4_.InitTextMessage(param1,param2,param3);
      }
      
      internal static function DriftComboMessage(param1:Number, param2:Number, param3:int) : *
      {
      }
      
      internal static function StartSkid() : int
      {
         return 0;
      }
      
      internal static function GetNumObjectsCount(param1:String) : int
      {
         return objectsCountList.GetCount(param1);
      }
      
      public static function LoadCar(param1:int) : *
      {
         var _loc2_:XML = ExternalData.xml;
         _loc2_ = _loc2_.cars.car[param1];
         var _loc3_:CarData = new CarData();
         _loc3_.id = XmlHelper.GetAttrInt(_loc2_.@id,0);
         _loc3_.name = XmlHelper.GetAttrString(_loc2_.@name,"undefined");
         _loc3_.info = XmlHelper.GetAttrString(_loc2_.@info,"undefined");
         _loc3_.graphicID = XmlHelper.GetAttrInt(_loc2_.@graphic,0);
         _loc3_.topSpeed0 = XmlHelper.GetAttrNumber(_loc2_.topspeed.@min,0);
         _loc3_.topSpeed1 = XmlHelper.GetAttrNumber(_loc2_.topspeed.@max,0);
         _loc3_.accel0 = XmlHelper.GetAttrNumber(_loc2_.accel.@min,0);
         _loc3_.accel1 = XmlHelper.GetAttrNumber(_loc2_.accel.@max,0);
         _loc3_.decel0 = XmlHelper.GetAttrNumber(_loc2_.decel.@min,0);
         _loc3_.decel1 = XmlHelper.GetAttrNumber(_loc2_.decel.@max,0);
         _loc3_.slide0 = XmlHelper.GetAttrNumber(_loc2_.slide.@min,0);
         _loc3_.slide1 = XmlHelper.GetAttrNumber(_loc2_.slide.@max,0);
         _loc3_.offroad0 = XmlHelper.GetAttrNumber(_loc2_.offroad.@min,0);
         _loc3_.offroad1 = XmlHelper.GetAttrNumber(_loc2_.offroad.@max,0);
         _loc3_.steerSpeed0 = XmlHelper.GetAttrNumber(_loc2_.steerspeed.@min,0);
         _loc3_.steerSpeed1 = XmlHelper.GetAttrNumber(_loc2_.steerspeed.@max,0);
         _loc3_.weight0 = XmlHelper.GetAttrNumber(_loc2_.weight.@min,0);
         _loc3_.weight1 = XmlHelper.GetAttrNumber(_loc2_.weight.@max,0);
         _loc3_.turboTime0 = XmlHelper.GetAttrNumber(_loc2_.turbotime.@min,0);
         _loc3_.turboTime1 = XmlHelper.GetAttrNumber(_loc2_.turbotime.@max,0);
         _loc3_.turboSpeed0 = XmlHelper.GetAttrNumber(_loc2_.turbospeed.@min,0);
         _loc3_.turboSpeed1 = XmlHelper.GetAttrNumber(_loc2_.turbospeed.@max,0);
         _loc3_.maxDriftAng0 = XmlHelper.GetAttrNumber(_loc2_.driftang.@min,0);
         _loc3_.maxDriftAng1 = XmlHelper.GetAttrNumber(_loc2_.driftang.@max,0);
         _loc3_.slipperiness0 = 0;
         _loc3_.slipperiness1 = 100;
         GlobalCarData.carData.push(_loc3_);
      }
      
      public static function GetLevelIndexFromName(param1:String) : int
      {
         var _loc3_:String = null;
         var _loc2_:int = -1;
         for each(_loc3_ in levelNames)
         {
            if(_loc3_ == param1)
            {
               return _loc2_;
            }
            _loc2_++;
         }
         return 0;
      }
      
      internal static function ReloadData() : *
      {
         ExternalData.Load(ReloadData_Done);
      }
      
      internal static function AddGameObjectAt(param1:String, param2:Number, param3:Number, param4:Number, param5:String = "", param6:String = "") : GameObj
      {
         var _loc9_:PhysObj_Graphic = null;
         var _loc7_:GameObj = null;
         var _loc8_:PhysObj = physObjs.FindByName(param1);
         if(_loc8_.graphics.length != 0)
         {
            _loc9_ = _loc8_.graphics[0];
            _loc7_ = GameObjects.AddObj(param2,param3,_loc9_.zoffset + zsortoffset);
            _loc7_.graphicID = _loc9_.graphicID;
            _loc7_.frame = _loc9_.frame;
            if(_loc9_.goInitFuntion != "")
            {
               _loc7_[_loc9_.goInitFuntion]();
            }
         }
         return _loc7_;
      }
      
      internal static function UpdatePanelTurboMeter() : *
      {
         var _loc1_:PhysObj_Instance = null;
         _loc1_ = GetPlayerInstance();
         if(_loc1_)
         {
            if(_loc1_.IsTurboActive())
            {
               panelOverlay.turbometer_ready.visible = false;
               panelOverlay.turbometer_use.visible = true;
               panelOverlay.turbometer_use.gotoAndStop(int(Utils.ScaleTo(100,1,0,_loc1_.turboLevelMax,_loc1_.turboLevel)));
               panelOverlay.turbometer_ready.stop();
            }
            else if(_loc1_.turboLevel == 0)
            {
               panelOverlay.turbometer_ready.visible = false;
               panelOverlay.turbometer_use.visible = true;
               panelOverlay.turbometer_use.gotoAndStop(100);
               panelOverlay.turbometer_ready.stop();
            }
            else
            {
               panelOverlay.turbometer_ready.visible = true;
               panelOverlay.turbometer_use.visible = true;
               panelOverlay.turbometer_use.gotoAndStop(int(Utils.ScaleTo(100,1,0,_loc1_.turboLevelMax,_loc1_.turboLevel)));
               panelOverlay.turbometer_ready.play();
            }
         }
      }
      
      internal static function MakeAngs() : *
      {
         var _loc1_:int = 0;
         var _loc2_:Number = NaN;
         var _loc3_:Number = NaN;
         var _loc4_:Number = NaN;
         var _loc5_:Number = NaN;
         fr_edit = 1;
         frameAngs = new Array(48 * 3);
         _loc1_ = 0;
         while(_loc1_ < 48)
         {
            _loc2_ = Math.PI * 2 / 48 * _loc1_;
            _loc3_ = Math.cos(_loc2_) * fr_edit;
            _loc4_ = Math.sin(_loc2_);
            _loc5_ = Math.atan2(_loc4_,_loc3_);
            frameAngs[_loc1_ + 48] = _loc5_;
            frameAngs[_loc1_] = _loc5_ - Math.PI * 2;
            frameAngs[_loc1_ + 96] = _loc5_ + Math.PI * 2;
            _loc1_++;
         }
      }
      
      internal static function InitHitLists() : *
      {
         objectsCountList = new CountList();
         objectsHitList = new CountList();
         objectsDestroyedList = new CountList();
      }
      
      internal static function GetPlaybackNode() : PlayerRecordData
      {
         currentPlaybackNode.x = carpath[playbackPos * 3 + 0];
         currentPlaybackNode.y = carpath[playbackPos * 3 + 1];
         currentPlaybackNode.angle = carpath[playbackPos * 3 + 2];
         return currentPlaybackNode;
      }
      
      public static function StartMainMenu() : *
      {
         gameState = gameState_UI;
         TitleScreenState.InitMainMenu();
      }
      
      internal static function UpdateScroll() : *
      {
         var _loc1_:Array = null;
         var _loc2_:PhysObj_Instance = null;
         var _loc3_:b2Vec2 = null;
         var _loc4_:Number = NaN;
         var _loc5_:Number = NaN;
         var _loc6_:Point = null;
         _loc1_ = physObjInstances.GetAllByTypeName("aivehicle");
         if(followIndex > _loc1_.length)
         {
            followIndex = 0;
         }
         if(KeyReader.Pressed(KeyReader.KEY_V))
         {
            ++followIndex;
            if(followIndex > _loc1_.length)
            {
               followIndex = 0;
            }
         }
         if(followIndex == 0)
         {
            _loc2_ = physObjInstances.FindByTypeName("playervehicle");
         }
         else
         {
            _loc2_ = _loc1_[followIndex - 1];
         }
         if(_loc2_ == null)
         {
            return;
         }
         _loc3_ = _loc2_.GetBodyWorldPos(0);
         _loc4_ = _loc3_.x * p2w;
         _loc5_ = _loc3_.y * p2w;
         _loc6_ = new Point(_loc2_.GetBodyLinearVelocity(0).x,_loc2_.GetBodyLinearVelocity(0).y);
         camera.UpdatePosition(_loc4_,_loc5_,_loc6_);
      }
      
      public static function GetPlaceByCarIndex(param1:int) : int
      {
         var _loc2_:int = 0;
         _loc2_ = 0;
         while(_loc2_ < finalRaceOrder.length)
         {
            if(finalRaceOrder[_loc2_] == param1)
            {
               return _loc2_;
            }
            _loc2_++;
         }
         return -1;
      }
      
      internal static function AlignWithPreviousVerts(param1:Number, param2:Number, param3:Number, param4:Number, param5:Number) : Point
      {
         var _loc9_:Point = null;
         var _loc10_:Number = NaN;
         var _loc11_:Number = NaN;
         var _loc6_:Matrix = new Matrix();
         _loc6_.rotate(param5);
         var _loc7_:Point = new Point(param1,param2);
         _loc7_ = _loc6_.transformPoint(_loc7_);
         _loc7_.x += param3;
         _loc7_.y += param4;
         var _loc8_:Number = 2 * w2p;
         for each(_loc9_ in previousStaticPoints)
         {
            if(Math.abs(_loc9_.x - _loc7_.x) < _loc8_)
            {
               if(Math.abs(_loc9_.y - _loc7_.y) < _loc8_)
               {
                  _loc10_ = _loc9_.x - _loc7_.x;
                  _loc11_ = _loc9_.y - _loc7_.y;
                  return new Point(_loc10_,_loc11_);
               }
            }
         }
         previousStaticPoints.push(_loc7_.clone());
         return null;
      }
      
      internal static function DoEndLevelStuff() : *
      {
         var _loc1_:Level = null;
         CompleteFinalRaceOrder();
         _loc1_ = GetCurrentLevel();
         _loc1_.complete = true;
         _loc1_.lastTime = levelTimer;
         ++numRacesCompleted;
         var _loc2_:int = GetPlaceByCarIndex(playerCarIndex);
         if(_loc2_ == 0)
         {
            ++totalWonInRow;
            ++numRacesWon;
            ++totalWonInRowPerLevel[currentLevel];
         }
         else
         {
            totalWonInRowPerLevel[currentLevel] = 0;
            totalWonInRow = 0;
            ++numRacesNotWon;
         }
         var _loc3_:int = int(levelPlaceCashList[_loc2_]);
         AddCash(_loc3_);
         FlashConnect.trace("awarded cash " + _loc3_ + " for place: " + _loc2_);
         if(levelScore > _loc1_.bestScore)
         {
            _loc1_.bestScore = levelScore;
         }
         if(race_time < _loc1_.bestTime)
         {
            _loc1_.bestTime = race_time;
         }
         if(_loc2_ < _loc1_.bestPlace)
         {
            _loc1_.bestPlace = _loc2_;
         }
         newLevelUnlockedFlag = false;
         if(currentLevel != levels.length - 1)
         {
            if(GetLevel(currentLevel + 1).available == false)
            {
               if(_loc2_ <= _loc1_.unlockPlace - 1)
               {
                  newLevelUnlockedFlag = true;
                  newLevelUnlockedIndex = currentLevel + 1;
                  GetLevel(currentLevel + 1).available = true;
               }
            }
         }
         var _loc4_:int = 0;
         for each(_loc1_ in levels)
         {
            if(_loc1_.complete)
            {
               _loc4_++;
            }
         }
         CaclulateScore();
         Lic.Kongregate_SubmitStat(currentScore,"high_score");
         Lic.Kongregate_SubmitStat(_loc4_,"levels_complete");
      }
      
      internal static function AddHitObject(param1:String) : *
      {
         objectsHitList.Add(param1);
      }
      
      internal static function PanelOverlay_UpdateScore() : *
      {
         panelOverlay.OSDTextScore.text = levelScore;
      }
      
      internal static function PanelOverlay_UpdateLap(param1:int = -1) : *
      {
         var _loc2_:Level = null;
         if(noLapFlag)
         {
            panelOverlay.OSDTextLap.text = "";
            return;
         }
         _loc2_ = GetCurrentLevel();
         if(_loc2_.levelFunctionName == "StayAlive")
         {
            numLaps = 3;
         }
         if(param1 > numLaps)
         {
            param1 = -1;
         }
         if(param1 == -1)
         {
            panelOverlay.OSDTextLap.text = "--/" + numLaps.toString();
         }
         else
         {
            panelOverlay.OSDTextLap.text = param1.toString() + "/" + numLaps.toString();
         }
      }
      
      public static function InitGame() : *
      {
         FlashConnect.trace("Func: InitGame");
         gameState = gameState_Play;
         main.InitStageForGame();
         Debug.debugMode = 0;
         numLives = 3;
         polygonList = new Array();
         startPoints = new Array();
         currentStartPointIndex = 0;
         currentLevel = 0;
         pause = true;
         cash = 0;
         currentGameMusic = 0;
         LoadLevels();
         LoadCarData();
         Player.InitOnce();
         Particles.Reset();
         SurfaceParticles.Reset();
         MouseControl.Reset();
         GameObjects.ClearAll();
         SaveData.Load();
      }
      
      internal static function RenderBox2D(param1:BitmapData) : void
      {
         var _loc5_:int = 0;
         var _loc6_:b2Body = null;
         var _loc7_:b2Shape = null;
         var _loc8_:b2Vec2 = null;
         var _loc9_:Number = NaN;
         var _loc10_:* = undefined;
         var _loc11_:b2PolygonShape = null;
         var _loc12_:Array = null;
         var _loc13_:int = 0;
         var _loc14_:int = 0;
         var _loc15_:b2Vec2 = null;
         var _loc16_:b2Vec2 = null;
         var _loc17_:Matrix = null;
         var _loc18_:Point = null;
         var _loc19_:Point = null;
         var _loc20_:b2CircleShape = null;
         var _loc21_:Number = NaN;
         if(Debug.IsSet(1) == false)
         {
            return;
         }
         var _loc2_:Number = camera.x;
         var _loc3_:Number = camera.y;
         var _loc4_:Number = p2w;
         _loc6_ = world.GetBodyList();
         while(_loc6_)
         {
            _loc8_ = _loc6_.GetPosition();
            _loc9_ = _loc6_.GetAngle();
            _loc7_ = _loc6_.GetShapeList();
            while(_loc7_)
            {
               _loc10_ = _loc7_.GetType();
               if(_loc10_ == b2Shape.e_polygonShape)
               {
                  _loc11_ = b2PolygonShape(_loc7_);
                  _loc12_ = _loc11_.GetVertices();
                  _loc13_ = _loc11_.GetVertexCount();
                  _loc5_ = 0;
                  while(_loc5_ < _loc13_)
                  {
                     _loc14_ = _loc5_ + 1;
                     if(_loc14_ >= _loc13_)
                     {
                        _loc14_ = 0;
                     }
                     _loc15_ = _loc12_[_loc5_].Copy();
                     _loc16_ = _loc12_[_loc14_].Copy();
                     _loc17_ = new Matrix();
                     _loc17_.rotate(_loc9_);
                     _loc18_ = new Point(_loc15_.x,_loc15_.y);
                     _loc19_ = new Point(_loc16_.x,_loc16_.y);
                     _loc18_ = _loc17_.transformPoint(_loc18_);
                     _loc19_ = _loc17_.transformPoint(_loc19_);
                     _loc15_.x = _loc18_.x;
                     _loc15_.y = _loc18_.y;
                     _loc16_.x = _loc19_.x;
                     _loc16_.y = _loc19_.y;
                     _loc15_.Add(_loc8_);
                     _loc16_.Add(_loc8_);
                     Utils.RenderDotLine(param1,_loc15_.x * _loc4_ - _loc2_,_loc15_.y * _loc4_ - _loc3_,_loc16_.x * _loc4_ - _loc2_,_loc16_.y * _loc4_ - _loc3_,50,4294967295);
                     _loc5_++;
                  }
               }
               if(_loc10_ == b2Shape.e_circleShape)
               {
                  _loc20_ = b2CircleShape(_loc7_);
                  _loc21_ = _loc20_.GetRadius() * _loc4_;
                  Utils.RenderCircle(param1,_loc8_.x * _loc4_ - _loc2_,_loc8_.y * _loc4_ - _loc3_,_loc21_,4294967295);
               }
               _loc7_ = _loc7_.GetNext();
            }
            _loc6_ = _loc6_.GetNext();
         }
      }
      
      public static function GetLevelMaxDriftAngMultiplier(param1:int) : Number
      {
         if(param1 == 0)
         {
            return 1;
         }
         if(param1 == 1)
         {
            return 0.75;
         }
         return 1;
      }
      
      internal static function ResetEverything() : *
      {
         achievements.ResetAll();
         ResetAllLevels();
         ResetAllCars();
         InitBonusUnlocks();
         upgrades.ResetAll();
         cash = 0;
      }
      
      internal static function ReadBinaryChar(param1:ByteArray) : int
      {
         return int(param1.readByte());
      }
      
      internal static function RenderSkids(param1:BitmapData) : void
      {
         var _loc2_:Number = NaN;
         var _loc3_:Number = NaN;
         var _loc4_:uint = 0;
         var _loc5_:Graphics = null;
         var _loc6_:Number = NaN;
         var _loc7_:Number = NaN;
         var _loc8_:Point = null;
         var _loc9_:Point = null;
         var _loc10_:int = 0;
         var _loc11_:SkidLine = null;
         var _loc12_:int = 0;
         var _loc13_:GraphicsPath = null;
         var _loc14_:GraphicsStroke = null;
         var _loc15_:Vector.<IGraphicsData> = null;
         if(skidLines.length == 0)
         {
            return;
         }
         Debug.StartTimer("skidmarks");
         _loc2_ = Math.floor(camera.x);
         _loc3_ = Math.floor(camera.y);
         _loc4_ = 4278190080;
         _loc5_ = fillScreenMC.graphics;
         _loc5_.clear();
         if(graphicSpeedTestToggle == false)
         {
            for each(_loc11_ in skidLines)
            {
               if(_loc11_.active)
               {
                  _loc12_ = int(_loc11_.points.length);
                  if(_loc12_ > 1)
                  {
                     _loc5_.lineStyle(5,_loc4_,_loc11_.alpha);
                     _loc9_ = _loc11_.points[0];
                     _loc6_ = _loc9_.x - _loc2_;
                     _loc7_ = _loc9_.y - _loc3_;
                     _loc5_.moveTo(_loc6_,_loc7_);
                     _loc10_ = 1;
                     while(_loc10_ < _loc12_)
                     {
                        _loc8_ = _loc11_.points[_loc10_];
                        _loc6_ = _loc8_.x - _loc2_;
                        _loc7_ = _loc8_.y - _loc3_;
                        _loc5_.lineTo(_loc6_,_loc7_);
                        _loc10_++;
                     }
                  }
               }
            }
            param1.draw(fillScreenMC);
         }
         if(graphicSpeedTestToggle == true)
         {
            _loc13_ = new GraphicsPath();
            _loc14_ = new GraphicsStroke(5);
            _loc11_ = skidLines[0];
            _loc14_.fill = new GraphicsSolidFill(0,_loc11_.alpha);
            for each(_loc11_ in skidLines)
            {
               if(_loc11_.active)
               {
                  _loc12_ = int(_loc11_.points.length);
                  if(_loc12_ > 1)
                  {
                     _loc9_ = _loc11_.points[0];
                     _loc6_ = _loc9_.x - _loc2_;
                     _loc7_ = _loc9_.y - _loc3_;
                     _loc13_.moveTo(_loc6_,_loc7_);
                     _loc10_ = 1;
                     while(_loc10_ < _loc12_)
                     {
                        _loc8_ = _loc11_.points[_loc10_];
                        _loc6_ = _loc8_.x - _loc2_;
                        _loc7_ = _loc8_.y - _loc3_;
                        _loc13_.lineTo(_loc6_,_loc7_);
                        _loc10_++;
                     }
                  }
               }
            }
            _loc15_ = new Vector.<IGraphicsData>();
            _loc15_.push(_loc14_,_loc13_);
            _loc5_.drawGraphicsData(_loc15_);
            param1.draw(fillScreenMC);
         }
         Debug.EndTimer("skidmarks");
      }
      
      internal static function GetFloorCollision(param1:Number, param2:Number) : int
      {
         return 0;
      }
      
      internal static function PreRenderMiniMap() : *
      {
         var _loc1_:Graphics = null;
         var _loc2_:Level = null;
         var _loc3_:PhysLine = null;
         var _loc4_:Array = null;
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         var _loc7_:int = 0;
         var _loc8_:Number = NaN;
         var _loc9_:Number = NaN;
         minimapBD = new BitmapData(200,200,true,0);
         _loc1_ = fillScreenMC.graphics;
         _loc1_.clear();
         _loc1_.lineStyle(1,16777215,0.5);
         _loc2_ = GetCurrentLevel();
         for each(_loc3_ in _loc2_.lines)
         {
            if(_loc3_.type == 9)
            {
               _loc4_ = _loc3_.points;
               _loc5_ = int(_loc4_.length);
               _loc6_ = 0;
               while(_loc6_ <= _loc5_)
               {
                  _loc7_ = _loc6_;
                  if(_loc7_ >= _loc5_)
                  {
                     _loc7_ = 0;
                  }
                  _loc8_ = Number(_loc4_[_loc7_].x);
                  _loc9_ = Number(_loc4_[_loc7_].y);
                  MiniMap_CalcPos(_loc8_,_loc9_);
                  if(_loc6_ == 0)
                  {
                     _loc1_.moveTo(mm_x,mm_y);
                  }
                  else
                  {
                     _loc1_.lineTo(mm_x,mm_y);
                  }
                  _loc6_++;
               }
            }
         }
         minimapBD.draw(fillScreenMC);
      }
      
      internal static function ReloadData_Done() : *
      {
         LoadCarData();
      }
      
      internal static function ReadBinaryShort(param1:ByteArray) : int
      {
         return int(param1.readShort());
      }
      
      public static function CountAiVehicles() : *
      {
         var _loc1_:PhysObj_Instance = null;
         numAIVehicles = 0;
         level_instances = GetCurrentLevelInstances();
         for each(_loc1_ in level_instances)
         {
            if(_loc1_.typeName == "aivehicle")
            {
               ++numAIVehicles;
            }
         }
      }
      
      internal static function ResetBox2D() : void
      {
         world = null;
         InitBox2D();
      }
      
      internal static function GetNumLinesByType(param1:int) : int
      {
         var _loc4_:PhysLine = null;
         var _loc2_:int = 0;
         var _loc3_:Level = GetCurrentLevel();
         for each(_loc4_ in _loc3_.lines)
         {
            if(_loc4_.type == param1)
            {
               _loc2_++;
            }
         }
         return _loc2_;
      }
      
      internal static function InitHeadlightOverlay() : *
      {
         headlightOverlay = new MovieClip();
         headlightOverlay.x = 0;
         headlightOverlay.y = 0;
         headlightOverlayBD = new BitmapData(640,480,true,0);
      }
      
      internal static function DrawSkidLine(param1:Number, param2:Number, param3:Number, param4:Number) : *
      {
         var _loc5_:Point = null;
         var _loc6_:Point = null;
         var _loc7_:Graphics = null;
         var _loc8_:uint = 0;
         _loc7_ = fillScreenMC.graphics;
         _loc8_ = 4278190080;
         _loc7_.lineStyle(5,_loc8_,0.1);
         _loc7_.moveTo(param1,param2);
         _loc7_.lineTo(param3,param4);
      }
      
      internal static function InitGlobalLevelData() : *
      {
         levelNames = new Array();
         levelNames.push("");
         levelNames.push("1","2","3","4","5","6","7","8","9");
      }
      
      internal static function UnlockBalloons() : *
      {
         var _loc1_:Level = null;
         _loc1_ = GetCurrentLevel();
         _loc1_.gotBalloon = true;
      }
      
      internal static function PreRenderFloor() : *
      {
         var _loc1_:Graphics = null;
         camera.x = camera.minX;
         camera.y = camera.minY;
         floorBD = new BitmapData(camera.maxX - camera.minX + 1,camera.maxY - camera.minY + 1,false,0);
         _loc1_ = fillScreenMC.graphics;
         _loc1_.clear();
         RenderSeaTilesBackground(floorBD);
         RenderReedPolyOverlaysDetail(floorBD);
         floorBD.draw(fillScreenMC);
      }
      
      public static function GetPlayerLapPosition(param1:int) : int
      {
         var _loc2_:int = 0;
         var _loc3_:Point = null;
         _loc2_ = 0;
         for each(_loc3_ in LapPositions)
         {
            if(_loc3_.y == param1)
            {
               if(_loc3_.x == playerCarIndex)
               {
                  return _loc2_;
               }
               _loc2_++;
            }
         }
         return _loc2_;
      }
      
      public static function GetLevelNameFromIndex(param1:int) : String
      {
         param1++;
         return levelNames[param1];
      }
      
      internal static function AddPlayerRecord(param1:int, param2:int, param3:int) : *
      {
      }
      
      internal static function Render() : *
      {
         var _loc1_:BitmapData = null;
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         var _loc4_:Number = NaN;
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         var _loc8_:Graphics = null;
         if(gameState == gameState_UI)
         {
            return;
         }
         if(pause)
         {
            return;
         }
         if(PauseMenu.IsPaused())
         {
            return;
         }
         if(levelState == levelState_EndScreen)
         {
            return;
         }
         if(levelState == levelState_Null)
         {
            return;
         }
         if(levelState == levelState_Editor)
         {
            _loc8_ = fillScreenMC.graphics;
            _loc8_.clear();
            PhysEditor.RenderEditor();
            return;
         }
         _loc1_ = main.screenBD;
         var _loc7_:Level = GetCurrentLevel();
         Debug.StartTimer("render ALL");
         if(Debug.IsSet(4) == false)
         {
            Debug.StartTimer("render sea");
            _loc1_.copyPixels(floorBD,new Rectangle(camera.x - camera.minX,camera.y - camera.minY,640,480),new Point(0,0));
            if(RLBridge.fastRender == false)
            {
               _loc8_ = fillScreenMC.graphics;
               _loc8_.clear();
               RenderSeaTilesOverlay(_loc1_);
               _loc1_.draw(fillScreenMC);
            }
            Debug.EndTimer("render sea");
            Debug.StartTimer("render surface particles");
            SurfaceParticles.Render(_loc1_);
            Debug.EndTimer("render surface particles");
            Debug.StartTimer("render GOs");
            GameObjects.Render(_loc1_);
            Debug.EndTimer("render GOs");
            Debug.StartTimer("render particles");
            Particles.Render(_loc1_);
            Debug.EndTimer("render particles");
            Debug.StartTimer("render minimap");
            RenderMiniMap(_loc1_);
            Debug.EndTimer("render minimap");
            RenderBox2D(_loc1_);
            RenderLines(_loc1_);
         }
         else
         {
            main.screenBD.fillRect(Defs.screenRect,4278190080);
         }
         RenderPanel();
         Debug.EndTimer("render ALL");
         Debug.StopTimers();
         Debug.RenderTimers(main.screenBD);
      }
      
      internal static function GetNumBalloonsUnlocked() : int
      {
         var _loc1_:int = 0;
         var _loc2_:int = 0;
         var _loc3_:Level = null;
         _loc2_ = 0;
         _loc1_ = 0;
         while(_loc1_ < levels.length)
         {
            _loc3_ = GetLevelLight(_loc1_);
            if(_loc3_ != null)
            {
               if(_loc3_.gotBalloon)
               {
                  _loc2_++;
               }
            }
            _loc1_++;
         }
         return _loc2_;
      }
      
      public static function LoadCarData() : *
      {
         GlobalCarData.Init();
         var _loc1_:XML = ExternalData.xml.cars.global[0];
         GlobalCarData.topSpeed0 = XmlHelper.GetAttrNumber(_loc1_.topspeed.@min,0);
         GlobalCarData.topSpeed1 = XmlHelper.GetAttrNumber(_loc1_.topspeed.@max,0);
         GlobalCarData.accel0 = XmlHelper.GetAttrNumber(_loc1_.accel.@min,0);
         GlobalCarData.accel1 = XmlHelper.GetAttrNumber(_loc1_.accel.@max,0);
         GlobalCarData.decel0 = XmlHelper.GetAttrNumber(_loc1_.decel.@min,0);
         GlobalCarData.decel1 = XmlHelper.GetAttrNumber(_loc1_.decel.@max,0);
         GlobalCarData.slide0 = XmlHelper.GetAttrNumber(_loc1_.slide.@min,0);
         GlobalCarData.slide1 = XmlHelper.GetAttrNumber(_loc1_.slide.@max,0);
         GlobalCarData.offroad0 = XmlHelper.GetAttrNumber(_loc1_.offroad.@min,0);
         GlobalCarData.offroad1 = XmlHelper.GetAttrNumber(_loc1_.offroad.@max,0);
         GlobalCarData.steerSpeed0 = XmlHelper.GetAttrNumber(_loc1_.steerspeed.@min,0);
         GlobalCarData.steerSpeed1 = XmlHelper.GetAttrNumber(_loc1_.steerspeed.@max,0);
         GlobalCarData.weight0 = XmlHelper.GetAttrNumber(_loc1_.weight.@min,0);
         GlobalCarData.weight1 = XmlHelper.GetAttrNumber(_loc1_.weight.@max,0);
         GlobalCarData.turboMaxSpeed0 = XmlHelper.GetAttrNumber(_loc1_.turbospeed.@min,0);
         GlobalCarData.turboMaxSpeed1 = XmlHelper.GetAttrNumber(_loc1_.turbospeed.@max,0);
         GlobalCarData.turboTime0 = XmlHelper.GetAttrNumber(_loc1_.turbotime.@min,0);
         GlobalCarData.turboTime1 = XmlHelper.GetAttrNumber(_loc1_.turbotime.@max,0);
         GlobalCarData.maxDriftAng0 = XmlHelper.GetAttrNumber(_loc1_.driftang.@min,0);
         GlobalCarData.maxDriftAng1 = XmlHelper.GetAttrNumber(_loc1_.driftang.@max,0);
         GlobalCarData.slipperiness0 = 0;
         GlobalCarData.slipperiness1 = 1;
         _loc1_ = ExternalData.xml;
         var _loc2_:int = int(_loc1_.cars.car.length());
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_)
         {
            LoadCar(_loc3_);
            _loc3_++;
         }
         GlobalCarData.SetCarAvailable(0,true);
      }
      
      internal static function Reload(param1:Function) : *
      {
         ExternalData.Load(param1);
      }
      
      internal static function InitBitmaps() : *
      {
         effectBD = new BitmapData(Defs.displayarea_w / 4,Defs.displayarea_h / 4);
         effectBDFull = new BitmapData(Defs.displayarea_w,Defs.displayarea_h);
         fillScreenMC = new MovieClip();
         fillScreenMC.x = 0;
         fillScreenMC.y = 0;
         fillScreenMC1 = new MovieClip();
         fillScreenMC1.x = 0;
         fillScreenMC1.y = 0;
      }
      
      internal static function AddObjectCount(param1:String) : *
      {
         objectsCountList.Add(param1);
      }
      
      internal static function InitBonusUnlocks() : *
      {
         bonusUnlocks = new Array(5);
         SetBonusUnlock(0,false);
         SetBonusUnlock(1,false);
         SetBonusUnlock(2,false);
         SetBonusUnlock(3,false);
         SetBonusUnlock(4,false);
         bonusNames = new Array();
         bonusNames.push("headlights");
         bonusNames.push("fisheye");
         bonusNames.push("alienwatcher");
         bonusNames.push("gearview");
         bonusNames.push("3dspecs");
      }
      
      internal static function UpdateSkids() : void
      {
         var _loc1_:SkidLine = null;
         for each(_loc1_ in skidLines)
         {
            if(_loc1_.active && _loc1_.currentlyBeingMade == false)
            {
               _loc1_.alpha -= 0.0001;
               if(_loc1_.alpha <= 0)
               {
                  _loc1_.active = false;
               }
            }
         }
      }
      
      internal static function OutputTurboOffsets() : *
      {
         var _loc1_:String = null;
         var _loc2_:int = 0;
         var _loc3_:Array = null;
         var _loc4_:String = null;
         var _loc5_:Point = null;
         _loc1_ = "";
         _loc2_ = 0;
         for each(_loc3_ in turboOffsets)
         {
            _loc4_ = "static var turboOffset" + _loc2_ + ":Array = new Array(";
            for each(_loc5_ in _loc3_)
            {
               _loc4_ += "new Point(" + _loc5_.x + "," + _loc5_.y + "),";
            }
            _loc4_ = _loc4_.slice(0,_loc4_.length - 1);
            _loc4_ = _loc4_ + ");";
            FlashConnect.trace(_loc4_);
            _loc1_ += _loc4_ + "\n";
            _loc2_++;
         }
         ExternalData.OutputString(_loc1_);
      }
      
      internal static function InitBox2D() : void
      {
         var _loc1_:b2AABB = new b2AABB();
         _loc1_.lowerBound.Set(-250000,-250000);
         _loc1_.upperBound.Set(250000,250000);
         var _loc2_:b2Vec2 = new b2Vec2(0,physGravity);
         var _loc3_:Boolean = true;
         world = new b2World(_loc1_,_loc2_,_loc3_);
         groundBody = world.GetGroundBody();
         groundBody.SetUserData(-1);
         var _loc4_:ContactListener = new ContactListener();
         world.SetContactListener(_loc4_);
      }
      
      internal static function InitSkids() : void
      {
      }
      
      public static function LoadLevels() : *
      {
         var _loc4_:Level = null;
         levels = new Array();
         var _loc1_:XML = ExternalData.xml_levels;
         var _loc2_:* = _loc1_.level.length();
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_)
         {
            PreLoadLevel(_loc3_);
            _loc3_++;
         }
         ResetAllLevels();
         levelsMinSpd = 999999;
         levelsMaxSpd = -999999;
         for each(_loc4_ in levels)
         {
            if(levelsMaxSpd < _loc4_.aiCarMaxSpeed)
            {
               levelsMaxSpd = _loc4_.aiCarMaxSpeed;
            }
            if(levelsMinSpd < _loc4_.aiCarMinSpeed)
            {
               levelsMinSpd = _loc4_.aiCarMinSpeed;
            }
         }
      }
      
      internal static function RenderHeadlightOverlay() : *
      {
         var _loc1_:Number = NaN;
         var _loc2_:Number = NaN;
         var _loc3_:Graphics = null;
         var _loc4_:GameObj = null;
         var _loc5_:Number = NaN;
         var _loc6_:Number = NaN;
         var _loc7_:int = 0;
         var _loc8_:BitmapData = null;
         var _loc9_:Number = NaN;
         var _loc10_:Number = NaN;
         var _loc11_:Matrix = null;
         var _loc12_:Number = NaN;
         _loc1_ = camera.x;
         _loc2_ = camera.y;
         _loc3_ = headlightOverlay.graphics;
         headlightOverlayBD.fillRect(Defs.screenRect,4289769648);
         _loc3_.clear();
         for each(_loc4_ in GameObjects.objs)
         {
            if(_loc4_.active && _loc4_.isVehicle)
            {
               _loc5_ = _loc4_.xpos - _loc1_;
               _loc6_ = _loc4_.ypos - _loc2_;
               _loc7_ = GraphicObjects.GetIndexByName("FX_Headlight");
               _loc8_ = GraphicObjects.GetBitmapData(_loc7_,0);
               _loc9_ = GraphicObjects.GetOffsetX(_loc7_,0);
               _loc10_ = GraphicObjects.GetOffsetY(_loc7_,0);
               _loc11_ = new Matrix();
               _loc11_.identity();
               _loc11_.translate(_loc9_,_loc10_);
               _loc12_ = -_loc4_.dir;
               _loc12_ = _loc12_ + Math.PI / 2;
               _loc11_.rotate(_loc12_);
               _loc11_.translate(_loc5_,_loc6_);
               headlightOverlayBD.draw(_loc8_,_loc11_);
            }
         }
         main.screenBD.draw(headlightOverlayBD,null,null,BlendMode.SUBTRACT);
      }
      
      internal static function ResetAllLevels() : *
      {
         var _loc1_:int = 0;
         var _loc2_:Level = null;
         _loc1_ = 0;
         while(_loc1_ < levels.length)
         {
            _loc2_ = GetLevelLight(_loc1_);
            _loc2_.bestScore = 0;
            _loc2_.bestPlace = 9999999;
            _loc2_.bestTime = 9999999;
            _loc2_.available = false;
            _loc2_.complete = false;
            _loc2_.gotBalloon = false;
            _loc1_++;
         }
         GetLevel(0).available = true;
      }
      
      internal static function GetBonusUnlockIndexFromName(param1:String) : int
      {
         var _loc2_:int = 0;
         _loc2_ = 0;
         while(_loc2_ < bonusUnlocks.length)
         {
            if(param1 == bonusNames[_loc2_])
            {
               return _loc2_;
            }
            _loc2_++;
         }
         return 0;
      }
      
      internal static function GetLevel(param1:int) : Level
      {
         if(param1 < 0)
         {
            return null;
         }
         if(param1 >= levels.length)
         {
            return null;
         }
         LoadLevel(param1,false);
         return levels[param1];
      }
      
      public static function LoadLevel(param1:int, param2:Boolean = true) : *
      {
         var _loc4_:Level = null;
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         var _loc7_:XML = null;
         var _loc8_:int = 0;
         var _loc9_:String = null;
         var _loc10_:int = 0;
         var _loc11_:PhysLine = null;
         var _loc12_:XML = null;
         var _loc13_:String = null;
         var _loc14_:Array = null;
         var _loc15_:Point = null;
         var _loc16_:XML = null;
         var _loc17_:XML = null;
         var _loc18_:String = null;
         var _loc19_:Number = NaN;
         var _loc20_:Number = NaN;
         var _loc21_:Number = NaN;
         var _loc22_:String = null;
         var _loc23_:PhysObj_Instance = null;
         var _loc24_:XML = null;
         var _loc25_:XML = null;
         var _loc26_:String = null;
         var _loc27_:int = 0;
         var _loc3_:XML = ExternalData.xml_levels;
         _loc3_ = _loc3_.level[param1];
         _loc4_ = levels[param1];
         if(_loc4_.fullyLoaded)
         {
            return;
         }
         _loc4_.Calculate();
         _loc4_.fullyLoaded = true;
         _loc4_.lines = new Array();
         _loc5_ = 0;
         while(_loc5_ < _loc3_.line.length())
         {
            _loc7_ = _loc3_.line[_loc5_];
            _loc8_ = XmlHelper.GetAttrInt(_loc7_.@type,0);
            _loc9_ = XmlHelper.GetAttrString(_loc7_.@name,"");
            _loc10_ = XmlHelper.GetAttrInt(_loc7_.@fill,1);
            _loc11_ = new PhysLine();
            _loc11_.type = _loc8_;
            _loc11_.name = _loc9_;
            _loc11_.fill = _loc10_;
            _loc11_.fillScaleX = XmlHelper.GetAttrNumber(_loc7_.@fillscale,1);
            _loc11_.fillScaleY = XmlHelper.GetAttrNumber(_loc7_.@fillscale,1);
            _loc6_ = 0;
            while(_loc6_ < _loc7_.points.length())
            {
               _loc12_ = _loc7_.points[_loc6_];
               _loc13_ = XmlHelper.GetAttrString(_loc12_.@a,"");
               _loc14_ = Utils.PointArrayFromString(_loc13_);
               for each(_loc15_ in _loc14_)
               {
                  _loc11_.points.push(_loc15_);
               }
               _loc6_++;
            }
            _loc4_.lines.push(_loc11_);
            _loc7_ = null;
            _loc11_ = null;
            _loc5_++;
         }
         _loc6_ = 0;
         while(_loc6_ < _loc3_.objgroup.length())
         {
            _loc16_ = _loc3_.objgroup[_loc6_];
            _loc5_ = 0;
            while(_loc5_ < _loc16_.obj.length())
            {
               _loc17_ = _loc16_.obj[_loc5_];
               _loc18_ = _loc17_.@type;
               _loc19_ = Number(_loc17_.@x);
               _loc20_ = Number(_loc17_.@y);
               _loc21_ = Number(_loc17_.@rot);
               _loc22_ = XmlHelper.GetAttrString(_loc17_.@params,"");
               _loc23_ = CreatePhysObjInstanceAt(_loc18_,_loc19_,_loc20_,_loc21_,"",_loc22_);
               _loc4_.instances.push(_loc23_);
               _loc17_ = null;
               _loc23_ = null;
               _loc5_++;
            }
            _loc6_++;
         }
         _loc5_ = 0;
         while(_loc5_ < _loc3_.obj.length())
         {
            _loc17_ = _loc3_.obj[_loc5_];
            _loc18_ = _loc17_.@type;
            _loc19_ = Number(_loc17_.@x);
            _loc20_ = Number(_loc17_.@y);
            _loc21_ = Number(_loc17_.@rot);
            _loc22_ = XmlHelper.GetAttrString(_loc17_.@params,"");
            _loc23_ = CreatePhysObjInstanceAt(_loc18_,_loc19_,_loc20_,_loc21_,"",_loc22_);
            _loc4_.instances.push(_loc23_);
            _loc17_ = null;
            _loc23_ = null;
            _loc5_++;
         }
         if(_loc3_.map.length() != 0)
         {
            _loc4_.map = new Array();
            _loc24_ = _loc3_.map[0];
            _loc4_.mapMinX = XmlHelper.GetAttrInt(_loc24_.@minx,0);
            _loc4_.mapMaxX = XmlHelper.GetAttrInt(_loc24_.@maxx,0);
            _loc4_.mapMinY = XmlHelper.GetAttrInt(_loc24_.@miny,0);
            _loc4_.mapMaxY = XmlHelper.GetAttrInt(_loc24_.@maxy,0);
            _loc4_.mapCellW = XmlHelper.GetAttrInt(_loc24_.@cellw,32);
            _loc4_.mapCellH = XmlHelper.GetAttrInt(_loc24_.@cellh,32);
            _loc6_ = 0;
            while(_loc6_ < _loc24_.mapdata.length())
            {
               _loc25_ = _loc24_.mapdata[_loc6_];
               _loc26_ = XmlHelper.GetAttrString(_loc25_.@a,"");
               _loc14_ = Utils.HexArrayFromString(_loc26_);
               for each(_loc27_ in _loc14_)
               {
                  _loc4_.map.push(_loc27_);
               }
               _loc14_ = null;
               _loc25_ = null;
               _loc6_++;
            }
            _loc24_ = null;
         }
      }
      
      internal static function InitPhysicsGO(param1:Number, param2:Number, param3:PhysObj_Graphic, param4:int = 0, param5:int = 0, param6:Number = 0) : int
      {
         var _loc7_:GameObj = null;
         param6 += param3.zoffset;
         if(param3 == null)
         {
            _loc7_ = GameObjects.AddObj(param1 * p2w,param2 * p2w,param6 + zsortoffset);
            _loc7_.InitPhysicsObject(param4,param5,0,0,"",false);
         }
         else if(param3.goInitFuntion == "")
         {
            _loc7_ = GameObjects.AddObj(param1 * p2w,param2 * p2w,param6 + zsortoffset);
            _loc7_.InitPhysicsObject(param4,param5,param3.offset.x,param3.offset.y,param3.goInitFuntionVarString,param3.hasShadow);
         }
         else
         {
            _loc7_ = GameObjects.AddObj(param1 * p2w,param2 * p2w,param6 + zsortoffset);
            _loc7_.InitPhysicsObject(param4,param5,param3.offset.x,param3.offset.y,param3.goInitFuntionVarString,param3.hasShadow);
            _loc7_[param3.goInitFuntion]();
         }
         lastGeneratedGameObj = _loc7_;
         return GameObjects.lastGenIndex;
      }
      
      internal static function IsInReedPoly(param1:Number, param2:Number) : Boolean
      {
         var _loc3_:PhysLine = null;
         for each(_loc3_ in reedPolys)
         {
            if(_loc3_.PointInPoly(param1,param2))
            {
               return true;
            }
         }
         return false;
      }
      
      public static function UpdateGameplay() : void
      {
         var _loc1_:int = 0;
         var _loc2_:int = 0;
         Debug.StartTimers();
         if(gameState == gameState_UI)
         {
            if(TitleScreenState.preparingFlag)
            {
               TitleScreenState.UpdatePreparing();
            }
            return;
         }
         if(pause)
         {
            return;
         }
         if(PauseMenu.IsPaused())
         {
            QuietAllSounds();
            return;
         }
         if(levelState == levelState_EndScreen)
         {
            QuietAllSounds();
            return;
         }
         if(levelState == levelState_Null)
         {
            return;
         }
         if(levelState == levelState_Editor)
         {
            PhysEditor.UpdateEditor();
            return;
         }
         if(usedebug)
         {
            if(KeyReader.Pressed(KeyReader.KEY_SPACE))
            {
               InitLevelState(levelState_Editor);
            }
         }
         poo.active = true;
         if(levelState == levelState_Play)
         {
            if(PauseMenu.IsPaused() == false)
            {
               if(KeyReader.Pressed(KeyReader.KEY_P))
               {
                  PauseMenu.Pause();
               }
            }
         }
         _loc1_ = 1;
         if(usedebug)
         {
            if(KeyReader.Pressed(KeyReader.KEY_R))
            {
               Debug.debugMode ^= 1;
            }
            if(KeyReader.Pressed(KeyReader.KEY_T))
            {
               Debug.debugMode ^= 2;
            }
            if(KeyReader.Pressed(KeyReader.KEY_Y))
            {
               Debug.debugMode ^= 4;
            }
            if(KeyReader.Pressed(KeyReader.KEY_U))
            {
               Debug.debugMode ^= 8;
            }
            if(KeyReader.Pressed(KeyReader.KEY_I))
            {
            }
            if(KeyReader.Pressed(KeyReader.KEY_O))
            {
               Debug.debugMode ^= 32;
            }
            if(KeyReader.Pressed(KeyReader.KEY_L))
            {
               Debug.debugMode ^= 64;
            }
            if(KeyReader.Pressed(KeyReader.KEY_7))
            {
               InitLevel();
            }
            if(KeyReader.Pressed(KeyReader.KEY_8))
            {
               --currentLevel;
               if(currentLevel < 0)
               {
                  currentLevel = levels.length - 1;
               }
               StartLevelPlay();
            }
            if(KeyReader.Pressed(KeyReader.KEY_9))
            {
               ++currentLevel;
               if(currentLevel >= levels.length)
               {
                  currentLevel = 0;
               }
               StartLevelPlay();
            }
         }
         if(levelState == levelState_Complete)
         {
            --levelStateTimer;
            if(levelStateTimer <= 0)
            {
               InitLevelState(levelState_EndScreen);
            }
         }
         if(levelState == levelState_Play)
         {
            TestForTurboStart();
         }
         if(levelState == levelState_LevelStart)
         {
            --startCountdownTimer;
            if(startCountdownTimer <= 0)
            {
               InitLevelState(levelState_Play);
            }
            TestForTurboStart();
         }
         if(Debug.IsSet(8) == false)
         {
            physObjInstances.PreUpdatePhysObjs();
            _loc2_ = 0;
            while(_loc2_ < _loc1_)
            {
               numCollisionTests = 0;
               Debug.StartTimer("box2d");
               if(Debug.IsSet(16) == false)
               {
                  world.Step(physStep,physNumIterations);
               }
               UpdateGOsFromPhysics();
               Debug.EndTimer("box2d");
               if(levelState == levelState_Play || levelState == levelState_LevelStart || levelState == levelState_Complete)
               {
                  Debug.StartTimer("update gameobjects");
                  GameObjects.Update();
                  Debug.EndTimer("update gameobjects");
                  Debug.StartTimer("update collision");
                  Collision.Update();
                  Debug.EndTimer("update collision");
                  GameObjects.KillObjects();
                  Debug.StartTimer("update particles");
                  Particles.Update();
                  SurfaceParticles.Update();
                  Debug.EndTimer("update particles");
                  levelFunctions.Update();
               }
               _loc2_++;
            }
            physObjInstances.UpdatePhysObjs();
            if(levelState == levelState_Play)
            {
               ++levelTimer;
               ++race_time;
               ++limited_time;
               ++lap_timer;
               if(race_time % Defs.fps == 0)
               {
                  PanelOverlay_UpdateTime();
               }
               if(limited_time >= limited_time_limit)
               {
                  if(levelState != levelState_Complete)
                  {
                     FlashConnect.trace("Time Limit Over");
                     levelWon = false;
                     levelTimedOut = true;
                     InitLevelState(levelState_Complete);
                  }
               }
               else
               {
                  if(levelFunctions.WinCondition())
                  {
                     if(levelState != levelState_Complete)
                     {
                        levelWon = true;
                        InitLevelState(levelState_Complete);
                     }
                  }
                  if(levelFunctions.LoseCondition())
                  {
                     if(levelState != levelState_Complete)
                     {
                        levelWon = false;
                        InitLevelState(levelState_Complete);
                     }
                  }
               }
            }
            UpdateLevel();
            physObjInstances.DoCollideFunction();
            physObjInstances.DoDeleteList();
         }
         UpdateScroll();
         AddWaves();
         if(levelState == levelState_Play || levelState == levelState_LevelStart)
         {
         }
      }
      
      internal static function GetNearestPathLine(param1:Number, param2:Number) : int
      {
         var _loc7_:PhysLine = null;
         var _loc8_:Number = NaN;
         var _loc3_:Number = 999999;
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         var _loc6_:Level = GetCurrentLevel();
         for each(_loc7_ in _loc6_.lines)
         {
            if(_loc7_.type == 1)
            {
               _loc8_ = Utils.DistBetweenPoints(param1,param2,_loc7_.points[0].x,_loc7_.points[0].y);
               if(_loc8_ < _loc3_)
               {
                  _loc3_ = _loc8_;
                  _loc4_ = _loc5_;
               }
            }
            _loc5_++;
         }
         return _loc4_;
      }
      
      public static function LoadLevelMapsBinary(param1:Level, param2:ByteArray) : *
      {
         var _loc6_:int = 0;
         var _loc7_:int = 0;
         var _loc8_:* = undefined;
         var _loc3_:int = ReadBinaryInt(param2);
         FlashConnect.trace("LoadLevelMapsBinary numMaps " + _loc3_);
         if(_loc3_ > 1)
         {
            _loc3_ = 1;
         }
         if(_loc3_ == 0)
         {
            return;
         }
         param1.mapMinX = ReadBinaryInt(param2);
         param1.mapMaxX = ReadBinaryInt(param2);
         param1.mapMinY = ReadBinaryInt(param2);
         param1.mapMaxY = ReadBinaryInt(param2);
         param1.mapCellW = ReadBinaryInt(param2);
         param1.mapCellH = ReadBinaryInt(param2);
         param1.map = new Array();
         var _loc4_:int = ReadBinaryInt(param2);
         var _loc5_:int = 0;
         while(_loc5_ < _loc4_)
         {
            _loc6_ = ReadBinaryShort(param2);
            _loc7_ = ReadBinaryChar(param2);
            _loc7_ = _loc7_ - 48;
            _loc8_ = 0;
            while(_loc8_ < _loc6_)
            {
               param1.map.push(_loc7_);
               _loc8_++;
            }
            _loc5_++;
         }
      }
      
      internal static function FindRoutesInSwapZones() : *
      {
         var _loc2_:PhysLine = null;
         var _loc3_:Array = null;
         var _loc4_:int = 0;
         var _loc5_:PhysLine = null;
         var _loc6_:int = 0;
         var _loc7_:Point = null;
         var _loc8_:Point = null;
         swapZones = new Array();
         var _loc1_:Level = GetCurrentLevel();
         for each(_loc2_ in _loc1_.lines)
         {
            if(_loc2_.type == 5)
            {
               _loc3_ = new Array();
               _loc4_ = 0;
               for each(_loc5_ in _loc1_.lines)
               {
                  if(_loc5_.type == 1)
                  {
                     _loc6_ = 0;
                     for each(_loc7_ in _loc5_.points)
                     {
                        if(_loc2_.PointInPoly(_loc7_.x,_loc7_.y))
                        {
                           _loc8_ = new Point(_loc4_,_loc6_);
                           _loc3_.push(_loc8_);
                        }
                        _loc6_++;
                     }
                  }
                  _loc4_++;
               }
               swapZones.push(_loc3_);
            }
         }
      }
      
      internal static function RenderReedPolyOverlaysDetail(param1:BitmapData) : void
      {
         var _loc2_:Graphics = null;
         var _loc4_:Matrix = null;
         var _loc5_:Number = NaN;
         var _loc6_:Number = NaN;
         var _loc7_:Number = NaN;
         var _loc8_:Number = NaN;
         var _loc9_:int = 0;
         var _loc10_:int = 0;
         var _loc11_:int = 0;
         var _loc12_:int = 0;
         var _loc13_:BitmapData = null;
         var _loc14_:PhysLine = null;
         var _loc15_:int = 0;
         var _loc16_:Array = null;
         var _loc17_:Array = null;
         var _loc18_:Array = null;
         var _loc19_:Array = null;
         var _loc20_:Array = null;
         var _loc21_:Array = null;
         var _loc22_:Array = null;
         var _loc23_:Point = null;
         var _loc24_:Number = NaN;
         var _loc25_:Number = NaN;
         var _loc26_:Number = NaN;
         var _loc27_:Number = NaN;
         var _loc28_:Number = NaN;
         var _loc29_:Number = NaN;
         var _loc30_:Number = NaN;
         var _loc31_:Number = NaN;
         var _loc32_:Number = NaN;
         var _loc33_:int = 0;
         var _loc34_:Array = null;
         var _loc35_:Point = null;
         var _loc36_:Array = null;
         var _loc37_:Array = null;
         _loc2_ = fillScreenMC.graphics;
         var _loc3_:uint = 65280;
         _loc2_.lineStyle(null,null,null);
         _loc4_ = new Matrix();
         _loc4_.translate(-camera.x,-camera.y);
         _loc5_ = camera.x;
         _loc6_ = camera.y;
         for each(_loc14_ in reedPolys)
         {
            _loc15_ = int(_loc14_.points.length);
            _loc16_ = new Array();
            _loc17_ = new Array();
            _loc18_ = new Array();
            _loc19_ = new Array();
            _loc20_ = new Array();
            _loc21_ = new Array();
            _loc22_ = new Array();
            _loc22_.push(_loc16_);
            _loc22_.push(_loc17_);
            _loc22_.push(_loc18_);
            _loc22_.push(_loc19_);
            _loc22_.push(_loc20_);
            _loc10_ = 0;
            while(_loc10_ < _loc15_)
            {
               _loc23_ = _loc14_.points[_loc10_];
               _loc16_.push(_loc23_.clone());
               _loc17_.push(_loc23_.clone());
               _loc18_.push(_loc23_.clone());
               _loc19_.push(_loc23_.clone());
               _loc20_.push(_loc23_.clone());
               _loc21_.push(_loc23_.clone());
               _loc10_++;
            }
            _loc10_ = 0;
            while(_loc10_ < _loc15_)
            {
               _loc11_ = _loc10_ + 1;
               _loc9_ = _loc10_ - 1;
               if(_loc11_ < 0)
               {
                  _loc11_ += _loc15_;
               }
               if(_loc11_ >= _loc15_)
               {
                  _loc11_ -= _loc15_;
               }
               if(_loc9_ < 0)
               {
                  _loc9_ += _loc15_;
               }
               if(_loc9_ >= _loc15_)
               {
                  _loc9_ -= _loc15_;
               }
               _loc24_ = _loc16_[_loc10_].x - _loc16_[_loc9_].x;
               _loc25_ = _loc16_[_loc11_].x - _loc16_[_loc10_].x;
               _loc26_ = _loc16_[_loc10_].y - _loc16_[_loc9_].y;
               _loc27_ = _loc16_[_loc11_].y - _loc16_[_loc10_].y;
               _loc28_ = Math.atan2(_loc26_,_loc24_) + Math.PI / 2;
               _loc29_ = Math.atan2(_loc27_,_loc25_) + Math.PI / 2;
               _loc30_ = Math.cos(_loc28_) + Math.cos(_loc29_);
               _loc31_ = Math.sin(_loc28_) + Math.sin(_loc29_);
               _loc32_ = 3;
               _loc33_ = 1;
               while(_loc33_ < _loc22_.length)
               {
                  _loc34_ = _loc22_[_loc33_];
                  _loc35_ = _loc16_[_loc10_].clone();
                  _loc35_.x -= _loc30_ * (_loc33_ * _loc32_);
                  _loc35_.y -= _loc31_ * (_loc33_ * _loc32_);
                  _loc34_[_loc10_] = _loc35_;
                  _loc33_++;
               }
               _loc10_++;
            }
            if(_loc14_.type == 11)
            {
               _loc12_ = 0;
               _loc13_ = GraphicObjects.GetBitmapData(GraphicObjects.GetIndexByName("SceneryTextures"),_loc12_);
            }
            if(_loc14_.type == 12)
            {
               _loc12_ = 0;
               _loc13_ = GraphicObjects.GetBitmapData(GraphicObjects.GetIndexByName("SeaBed"),_loc12_);
            }
            _loc2_.beginBitmapFill(_loc13_,_loc4_,true);
            _loc7_ = _loc16_[0].x - _loc5_;
            _loc8_ = _loc16_[0].y - _loc6_;
            _loc2_.moveTo(_loc7_,_loc8_);
            _loc10_ = 0;
            while(_loc10_ < _loc15_)
            {
               _loc11_ = _loc10_ % _loc15_;
               _loc7_ = _loc16_[_loc11_].x - _loc5_;
               _loc8_ = _loc16_[_loc11_].y - _loc6_;
               _loc2_.lineTo(_loc7_,_loc8_);
               _loc10_++;
            }
            _loc2_.endFill();
            if(_loc14_.type == 12)
            {
               _loc33_ = 0;
               while(_loc33_ < _loc22_.length - 1)
               {
                  _loc36_ = _loc22_[_loc33_];
                  _loc37_ = _loc22_[_loc33_ + 1];
                  _loc13_ = GraphicObjects.GetBitmapData(GraphicObjects.GetIndexByName("SeaBed"),_loc33_ + 1);
                  _loc10_ = 0;
                  while(_loc10_ < _loc15_)
                  {
                     _loc2_.beginBitmapFill(_loc13_,_loc4_,true);
                     _loc11_ = (_loc10_ + 1) % _loc15_;
                     _loc7_ = _loc36_[_loc10_].x - _loc5_;
                     _loc8_ = _loc36_[_loc10_].y - _loc6_;
                     _loc2_.moveTo(_loc7_,_loc8_);
                     _loc7_ = _loc37_[_loc10_].x - _loc5_;
                     _loc8_ = _loc37_[_loc10_].y - _loc6_;
                     _loc2_.lineTo(_loc7_,_loc8_);
                     _loc7_ = _loc37_[_loc11_].x - _loc5_;
                     _loc8_ = _loc37_[_loc11_].y - _loc6_;
                     _loc2_.lineTo(_loc7_,_loc8_);
                     _loc7_ = _loc36_[_loc11_].x - _loc5_;
                     _loc8_ = _loc36_[_loc11_].y - _loc6_;
                     _loc2_.lineTo(_loc7_,_loc8_);
                     _loc7_ = _loc36_[_loc10_].x - _loc5_;
                     _loc8_ = _loc36_[_loc10_].y - _loc6_;
                     _loc2_.lineTo(_loc7_,_loc8_);
                     _loc2_.endFill();
                     _loc10_++;
                  }
                  _loc33_++;
               }
            }
         }
      }
      
      internal static function RenderPanel() : *
      {
         var _loc1_:Level = null;
         var _loc2_:Number = NaN;
         var _loc3_:Number = NaN;
         var _loc4_:String = null;
         var _loc5_:Number = NaN;
         var _loc6_:BitmapData = null;
         var _loc7_:int = 0;
         var _loc8_:int = 0;
         var _loc9_:Number = NaN;
         var _loc10_:Number = NaN;
         var _loc11_:Number = NaN;
         _loc1_ = GetCurrentLevel();
         _loc6_ = main.screenBD;
         _loc2_ = 10;
         _loc3_ = 10;
         if(usedebug != false)
         {
            _loc7_ = System.totalMemory / 1024;
            _loc8_ = _loc7_ - lastMemUsed;
            lastMemUsed = _loc7_;
            _loc4_ = "FPS: " + Utils.DP2(main.fps).toString() + "  Mem " + _loc7_ + "K   " + _loc8_;
            GraphicObjects.RenderStringAt(main.screenBD,GraphicObjects.gfx_font1,_loc2_,_loc3_,_loc4_,null);
            _loc3_ += 15;
            _loc4_ = "seaTileFrame2 " + seaTileFrame2;
            GraphicObjects.RenderStringAt(main.screenBD,GraphicObjects.gfx_font1,_loc2_,_loc3_,_loc4_,null);
            _loc3_ += 15;
            _loc1_ = Game.GetCurrentLevel();
            _loc9_ = _loc1_.aiCarMaxSpeed;
            _loc10_ = _loc1_.aiCarMinSpeed;
            _loc11_ = Utils.ScaleTo(_loc10_,_loc9_,0,2,Game.difficulty);
            _loc4_ = "difficulty: " + difficulty + "    aispd: " + _loc11_;
            GraphicObjects.RenderStringAt(main.screenBD,GraphicObjects.gfx_font1,_loc2_,_loc3_,_loc4_,null);
            _loc3_ += 15;
            _loc4_ = "level: " + GetCurrentLevel().name;
            GraphicObjects.RenderStringAt(main.screenBD,GraphicObjects.gfx_font1,_loc2_,_loc3_,_loc4_,null);
            _loc3_ += 15;
         }
         if(wrongWayFlag)
         {
            GraphicObjects.RenderAt(GraphicObjects.GetIndexByName("osd_wrongway"),0,main.screenBD,320,240);
         }
         UpdatePanelTurboMeter();
         levelFunctions.UpdatePanel(_loc6_);
      }
      
      internal static function GetLineListByType(param1:int) : Array
      {
         var _loc4_:PhysLine = null;
         var _loc2_:Array = new Array();
         var _loc3_:Level = GetCurrentLevel();
         for each(_loc4_ in _loc3_.lines)
         {
            if(_loc4_.type == param1)
            {
               _loc2_.push(_loc4_);
            }
         }
         return _loc2_;
      }
      
      internal static function GetLastStartPoint(param1:Number) : Point
      {
         var _loc3_:Point = null;
         var _loc2_:Point = startPoints[0];
         var _loc4_:Number = -1000;
         for each(_loc3_ in startPoints)
         {
            if(_loc3_.x < param1)
            {
               if(_loc3_.x > _loc4_)
               {
                  _loc4_ = _loc3_.x;
                  _loc2_ = _loc3_;
               }
            }
         }
         return _loc2_;
      }
      
      public static function GetLevelTurnSpeedMultiplier(param1:int) : Number
      {
         if(param1 == 0)
         {
            return 1;
         }
         if(param1 == 1)
         {
            return 0.75;
         }
         return 1;
      }
      
      internal static function GetGearTime(param1:Number) : *
      {
         var _loc3_:Number = NaN;
         var _loc4_:int = 0;
         var _loc5_:Number = NaN;
         var _loc6_:Number = NaN;
         var _loc7_:Number = NaN;
         var _loc2_:Number = 1;
         _loc3_ = 2;
         _loc4_ = 0;
         while(_loc4_ < gearTimes.length)
         {
            _loc5_ = Number(gearTimes[_loc4_]);
            if(param1 <= _loc5_)
            {
               _loc6_ = 0;
               if(_loc4_ != 0)
               {
                  _loc6_ = Number(gearTimes[_loc4_ - 1]);
               }
               return Utils.ScaleTo(gearTimesMinLevel[_loc4_],_loc3_,_loc6_,_loc5_,param1);
            }
            _loc4_++;
         }
         return _loc3_;
      }
      
      internal static function RenderSeaTilesOverlay(param1:BitmapData) : *
      {
         var _loc2_:int = 0;
         var _loc3_:Graphics = null;
         var _loc4_:Matrix = null;
         var _loc5_:BitmapData = null;
         var _loc6_:Number = NaN;
         var _loc8_:Number = NaN;
         var _loc9_:Number = NaN;
         ++RenderSeaTilesTimer;
         _loc2_ = GraphicObjects.GetIndexByName("SeaTilesAlpha");
         if(usedebug)
         {
            if(KeyReader.Pressed(KeyReader.KEY_F))
            {
               ++seaTileFrame2;
               seaTileFrame2 %= GraphicObjects.GetNumFrames(_loc2_);
            }
         }
         _loc3_ = fillScreenMC.graphics;
         _loc4_ = new Matrix();
         _loc5_ = GraphicObjects.GetBitmapData(_loc2_,seaTileFrame2);
         _loc6_ = Number(RenderSeaTilesTimer) * 0.1;
         var _loc7_:Number = 1 + Math.cos(RenderSeaTilesTimer * 0.1) * 0.05;
         _loc8_ = Math.cos(_loc6_) * 5;
         _loc9_ = Math.sin(_loc6_) * 5;
         _loc4_.identity();
         _loc4_.translate(-camera.x + _loc8_,-camera.y + _loc9_);
         _loc3_.beginBitmapFill(_loc5_,_loc4_,true);
         _loc3_.drawRect(0,0,640,480);
         _loc3_.endFill();
      }
      
      internal static function InitEdgeLineSprites(param1:PhysLine) : *
      {
         var _loc2_:GameObj = null;
         var _loc6_:int = 0;
         var _loc7_:Point = null;
         var _loc8_:Point = null;
         var _loc9_:Number = NaN;
         var _loc10_:Number = NaN;
         var _loc11_:Number = NaN;
         var _loc12_:int = 0;
         var _loc13_:int = 0;
         var _loc14_:Number = NaN;
         var _loc15_:Number = NaN;
         var _loc3_:Number = 80;
         var _loc4_:int = int(param1.points.length);
         var _loc5_:int = 0;
         while(_loc5_ < _loc4_)
         {
            _loc6_ = _loc5_ + 1;
            _loc6_ = _loc6_ % _loc4_;
            _loc7_ = param1.points[_loc5_];
            _loc8_ = param1.points[_loc6_];
            _loc9_ = Utils.DistBetweenPoints(_loc7_.x,_loc7_.y,_loc8_.x,_loc8_.y);
            _loc10_ = _loc8_.x - _loc7_.x;
            _loc11_ = _loc8_.y - _loc7_.y;
            _loc12_ = _loc9_ / 40;
            _loc10_ /= _loc12_;
            _loc11_ /= _loc12_;
            _loc13_ = 0;
            while(_loc13_ < _loc12_)
            {
               _loc14_ = _loc7_.x + _loc10_ * _loc13_;
               _loc15_ = _loc7_.y + _loc11_ * _loc13_;
               _loc2_ = GameObjects.AddObj(_loc14_,_loc15_,0);
               _loc2_.InitEdgeMarker();
               _loc13_++;
            }
            _loc5_++;
         }
      }
      
      public static function GetWheelMarker(param1:int, param2:int) : Point
      {
         var _loc3_:int = 0;
         var _loc4_:Array = null;
         var _loc5_:Point = null;
         _loc3_ = playerCarDataIndex;
         if(_loc3_ > 4)
         {
            _loc3_ = 4;
         }
         _loc4_ = wheelOffsets[_loc3_ * 2 + param2];
         if(param1 < 0)
         {
            return new Point(0,0);
         }
         if(param1 >= 48)
         {
            return new Point(0,0);
         }
         _loc5_ = _loc4_[param1];
         _loc4_[param1] = _loc5_;
         return _loc4_[param1];
      }
      
      internal static function GetNumObjectsHit(param1:String) : int
      {
         return objectsHitList.GetCount(param1);
      }
      
      public static function LoadLevelsBinary() : *
      {
         var _loc5_:Level = null;
         var _loc1_:BinEmbed = new BinEmbed();
         var _loc2_:ByteArray = _loc1_.GetByteArray();
         var _loc3_:int = _loc2_.readInt();
         FlashConnect.trace("LoadLevelsBinary numLevels " + _loc3_);
         var _loc4_:int = 0;
         while(_loc4_ < _loc3_)
         {
            _loc5_ = new Level();
            _loc5_.fullyLoaded = false;
            _loc5_.gotBalloon = false;
            _loc5_.available = false;
            _loc5_.complete = false;
            _loc5_.id = ReadBinaryString(_loc2_);
            _loc5_.name = ReadBinaryString(_loc2_);
            _loc5_.category = ReadBinaryInt(_loc2_);
            _loc5_.music = ReadBinaryInt(_loc2_);
            _loc5_.description = ReadBinaryString(_loc2_);
            _loc5_.numLaps = ReadBinaryInt(_loc2_);
            _loc5_.night = ReadBinaryBoolean(_loc2_);
            _loc5_.aiCarMinSpeed = ReadBinaryInt(_loc2_);
            _loc5_.aiCarMaxSpeed = ReadBinaryInt(_loc2_);
            _loc5_.raceType = ReadBinaryString(_loc2_);
            _loc5_.aiCarTypeString = ReadBinaryString(_loc2_);
            _loc5_.levelFunctionName = ReadBinaryString(_loc2_);
            _loc5_.levelParams = ReadBinaryString(_loc2_);
            LoadLevelObjectsBinary(_loc5_,_loc2_);
            LoadLevelLinesBinary(_loc5_,_loc2_);
            LoadLevelMapsBinary(_loc5_,_loc2_);
            levels.push(_loc5_);
            _loc4_++;
         }
      }
      
      internal static function AddToSkid(param1:int, param2:Number, param3:Number) : void
      {
      }
      
      internal static function DriftMultiplierMessage(param1:Number, param2:Number, param3:int) : *
      {
         var _loc4_:String = null;
         _loc4_ = "x" + param3;
         InitMessage(_loc4_,param1,param2);
      }
      
      internal static function QuietAllSounds() : *
      {
         var _loc1_:SoundChannel = null;
         poo.active = false;
         _loc1_ = SoundPlayer.GetSoundChannelByName("skid");
         SoundPlayer.SetSoundChannelVolume(_loc1_,0);
      }
      
      public static function AddScore(param1:int) : void
      {
         levelScore += param1 * multiplier;
         PanelOverlay_UpdateScore();
      }
      
      internal static function SetBonusUnlock(param1:int, param2:Boolean) : *
      {
         bonusUnlocks[param1] = param2;
      }
      
      internal static function GetHighestScore() : int
      {
         return CaclulateScore();
      }
      
      internal static function RenderSeaTilesBackground(param1:BitmapData) : *
      {
         var _loc2_:int = 0;
         var _loc3_:Graphics = null;
         var _loc4_:Matrix = null;
         var _loc5_:BitmapData = null;
         seaTileFrame = GetCurrentLevel().seatile1;
         ++RenderSeaTilesTimer;
         _loc2_ = GraphicObjects.GetIndexByName("SeaTiles");
         _loc3_ = fillScreenMC.graphics;
         _loc4_ = new Matrix();
         _loc5_ = GraphicObjects.GetBitmapData(_loc2_,seaTileFrame);
         _loc4_.translate(0,0);
         _loc3_.beginBitmapFill(_loc5_,_loc4_,true);
         _loc3_.drawRect(0,0,param1.width,param1.height);
         _loc3_.endFill();
      }
      
      public static function StartLevelPlay() : void
      {
         var _loc1_:Level = null;
         var _loc4_:int = 0;
         Debug.StartMemTest();
         _loc1_ = GetCurrentLevel();
         KeyReader.InitOnce(main.stage);
         QuietAllSounds();
         MusicPlayer.StopMusic();
         MusicPlayer.StartStream(currentGameMusic);
         ++currentGameMusic;
         if(currentGameMusic >= 2)
         {
            currentGameMusic = 0;
         }
         MakeAICarColorList();
         nextAICarColor = 0;
         main.InitStageForGame();
         startPoints = new Array();
         Particles.Reset();
         SurfaceParticles.Reset();
         ResetBox2D();
         previousStaticPoints = new Array();
         mouseJoint = null;
         camera.minX = 12345678;
         camera.maxX = 12345678;
         camera.minY = 12345678;
         camera.maxY = 12345678;
         InitHitLists();
         numVehicles = 0;
         currentCarIndex = 0;
         currentAiCarIndex = 0;
         numPickups = 0;
         numFloorTiles = 0;
         numTrackPieces = 0;
         numStaticObjects = 0;
         numAppearingPickups = 0;
         floorTiles = new Vector.<GameObj>();
         trackPieces = new Vector.<GameObj>();
         totalCashPickups = numCashPickups = 0;
         totalBoostPickups = numBoostPickups = 0;
         GameObjects.ClearAll();
         physObjInstances.Reset();
         CountAiVehicles();
         InitLevelPlayFromEditorObjects();
         InitLevelState(levelState_LevelStart);
         var _loc2_:Number = 100;
         var _loc3_:Number = 100;
         if(startPoints.length != 0)
         {
            _loc2_ = GetInitialStartPoint().x;
            _loc3_ = GetInitialStartPoint().y;
         }
         InitLines();
         AddOutsideBorders();
         FindRoutesInSwapZones();
         CreateLineSwapLists();
         pause = false;
         pauseGameplayInput = false;
         levelTimer = 0;
         gettingReady = true;
         goReadySetGo = GameObjects.AddObj(320,200,0);
         goReadySetGo.InitReadyGetSetGo();
         numLaps = _loc1_.numLaps;
         noLapFlag = false;
         if(numLaps == -1)
         {
            numLaps = 10;
            noLapFlag = true;
         }
         finalRaceOrder = new Array();
         raceOrder = new Array();
         _loc4_ = 0;
         while(_loc4_ < 100)
         {
            raceOrder.push(new Point(-1,-1));
            _loc4_++;
         }
         pickupHitTimer = 0;
         pickupHitTimerMax = 20;
         pickupHitInRowCount = 0;
         numPickupsCollected = 0;
         playerTotalSkidDist = 0;
         wrongWayFlag = false;
         playerTotalCheckpointIndex = 0;
         levscore_jumps = 0;
         levscore_pickups = 0;
         levscore_skids = 0;
         levscore_obstacles = 0;
         levelScore = 0;
         panelOverlay.gotoAndStop(1);
         main.addChild(panelOverlay);
         panelOverlay.y = Defs.displayarea_h - panelOverlay.height;
         readySetGoFrame = -1;
         InitSkids();
         full_turbo_achieved = false;
         num_turbos_used = 0;
         race_time = 0;
         limited_time = 0;
         limited_time_limit = Defs.fps * 3 * 60;
         lap_times = new Array();
         lap_timer = 0;
         best_lap_time = 99999999;
         total_drift = 0;
         best_drift = 0;
         best_drift_mutiplier = 0;
         levelFunctions.Init(_loc1_.levelFunctionName);
         perfectStartCount = 0;
         playerHitScenery = false;
         playerGoneOffRoad = false;
         playerHitVehicles = false;
         levelWon = false;
         levelTimedOut = false;
         totalObjectsDestroyed = 0;
         playerInAirTime = 0;
         playerTotalInAirTime = 0;
         playerNumJumps = 0;
         playerBestAirTime = 0;
         StartLevelSounds();
         PanelOverlay_UpdateLap();
         PanelOverlay_UpdateScore();
         PanelOverlay_UpdateTime();
         driftLapFlag = false;
         driftLapComplete = false;
         lastMemUsed = System.totalMemory / 1024;
         LapPositions = new Array();
         Debug.DoMemTest("StartLevelPlay");
         FlashConnect.trace("Memory used by bitmaps: " + GraphicObjects.totalBitmapSize + "  (" + int(GraphicObjects.totalBitmapSize / 1024) + ")");
         FlashConnect.trace("Num NOT Cropped: " + GraphicObjects.numUnCropped + " / " + int(GraphicObjects.numUnCropped + GraphicObjects.numCropped));
         seaTileFrame2 = GetCurrentLevel().seatile2;
         PreRenderFloor();
         PreRenderMiniMap();
         playerHitShallows = false;
         hitWhaleFlag = false;
         InitTestForTurboStart();
         FlashConnect.trace("totalCashPickups " + totalCashPickups);
         TitleScreenState.SetupMusicMuteButton(panelOverlay.ButtonMusic);
         TitleScreenState.SetupSFXMuteButton(panelOverlay.ButtonSFX);
      }
      
      public static function InitLevelPlayFromEditorObjects() : *
      {
         var _loc1_:PhysObj_Instance = null;
         var _loc2_:PhysObj = null;
         zsortoffset = 0;
         level_instances = GetCurrentLevelInstances();
         for each(_loc1_ in level_instances)
         {
            _loc2_ = physObjs.FindByName(_loc1_.typeName);
            if(_loc2_.graphics.length != 0)
            {
               AddGameObjectAt(_loc1_.typeName,_loc1_.x,_loc1_.y,_loc1_.rot,_loc1_.instanceName,_loc1_.initParams);
               zsortoffset += 0.01;
            }
            else if(_loc2_.hasPhysics)
            {
               AddPhysObjAt(_loc1_.typeName,_loc1_.x,_loc1_.y,_loc1_.rot,_loc1_.instanceName,_loc1_.initParams);
               zsortoffset += 0.01;
            }
            else
            {
               AddPhysGameObjectAt(_loc1_.typeName,_loc1_.x,_loc1_.y,_loc1_.rot,_loc1_.instanceName,_loc1_.initParams);
               zsortoffset += 0.01;
            }
         }
      }
      
      internal static function GetPhysObjInstanceByName(param1:String) : PhysObj_Instance
      {
         var _loc2_:PhysObj_Instance = null;
         for each(_loc2_ in physObjInstances.list)
         {
            if(_loc2_.instanceName == param1)
            {
               return _loc2_;
            }
         }
         return null;
      }
      
      internal static function MiniMap_CalcPos(param1:Number, param2:Number) : *
      {
         var _loc3_:Number = NaN;
         var _loc5_:Number = NaN;
         var _loc7_:Number = NaN;
         _loc3_ = 200;
         var _loc4_:Number = 200;
         _loc5_ = camera.maxX - camera.minX;
         var _loc6_:Number = camera.maxY - camera.minY;
         _loc7_ = _loc3_ / _loc5_;
         param1 -= camera.minX;
         param2 -= camera.minY;
         param1 *= _loc7_;
         param2 *= _loc7_;
         mm_x = param1;
         mm_y = param2;
      }
      
      internal static function RestartLevel() : void
      {
         StartLevelPlay();
      }
      
      internal static function ReadBinaryBoolean(param1:ByteArray) : Boolean
      {
         return param1.readBoolean();
      }
      
      internal static function UpdateGOsFromPhysics() : void
      {
         var _loc2_:GameObj = null;
         var _loc3_:b2Body = null;
         var _loc4_:PhysObj_BodyUserData = null;
         var _loc5_:int = 0;
         var _loc6_:b2Vec2 = null;
         var _loc7_:Number = NaN;
         var _loc1_:Number = p2w;
         _loc3_ = world.GetBodyList();
         while(_loc3_)
         {
            _loc4_ = _loc3_.GetUserData() as PhysObj_BodyUserData;
            if(_loc4_ != null)
            {
               _loc5_ = _loc4_.gameObjectID;
               if(_loc5_ != -1)
               {
                  _loc6_ = _loc3_.GetPosition();
                  _loc7_ = _loc3_.GetAngle();
                  _loc2_ = GameObjects.objs[_loc5_];
                  _loc2_.oldxpos = _loc2_.xpos;
                  _loc2_.oldypos = _loc2_.ypos;
                  _loc2_.xpos = _loc6_.x * _loc1_ + _loc2_.physObjOffsetX;
                  _loc2_.ypos = _loc6_.y * _loc1_ + _loc2_.physObjOffsetY;
                  _loc2_.dir = _loc7_;
               }
            }
            _loc3_ = _loc3_.GetNext();
         }
      }
      
      public static function LoadLevelLinesBinary(param1:Level, param2:ByteArray) : *
      {
         var _loc5_:PhysLine = null;
         var _loc6_:int = 0;
         var _loc7_:int = 0;
         var _loc8_:String = null;
         var _loc9_:Array = null;
         var _loc10_:Point = null;
         var _loc3_:int = ReadBinaryInt(param2);
         FlashConnect.trace("LoadLevelLinesBinary numLines " + _loc3_);
         param1.lines = new Array();
         var _loc4_:int = 0;
         while(_loc4_ < _loc3_)
         {
            _loc5_ = new PhysLine();
            _loc5_.type = ReadBinaryInt(param2);
            _loc5_.name = ReadBinaryString(param2);
            _loc5_.fill = ReadBinaryInt(param2);
            _loc5_.fillScaleX = _loc5_.fillScaleY = ReadBinaryInt(param2);
            _loc6_ = ReadBinaryInt(param2);
            _loc7_ = 0;
            while(_loc7_ < _loc6_)
            {
               _loc8_ = ReadBinaryString(param2);
               _loc9_ = Utils.PointArrayFromString(_loc8_);
               for each(_loc10_ in _loc9_)
               {
                  _loc5_.points.push(_loc10_);
               }
               _loc7_++;
            }
            param1.lines.push(_loc5_);
            _loc5_ = null;
            _loc4_++;
         }
      }
      
      internal static function RenderLines(param1:BitmapData) : void
      {
         var _loc6_:PhysLine = null;
         var _loc7_:int = 0;
         var _loc8_:int = 0;
         var _loc9_:Number = NaN;
         var _loc10_:Number = NaN;
         var _loc11_:Number = NaN;
         var _loc12_:Number = NaN;
         if(Debug.IsSet(1) == false)
         {
            return;
         }
         var _loc2_:Number = camera.x;
         var _loc3_:Number = camera.y;
         var _loc4_:Level = GetCurrentLevel();
         var _loc5_:int = 0;
         for each(_loc6_ in _loc4_.lines)
         {
            _loc8_ = int(_loc6_.points.length);
            _loc7_ = 0;
            while(_loc7_ < _loc8_ - 1)
            {
               _loc9_ = _loc6_.points[_loc7_ + 0].x - _loc2_;
               _loc10_ = _loc6_.points[_loc7_ + 0].y - _loc3_;
               _loc11_ = _loc6_.points[_loc7_ + 1].x - _loc2_;
               _loc12_ = _loc6_.points[_loc7_ + 1].y - _loc3_;
               if(_loc6_.type == 1)
               {
                  Utils.RenderDotLine(param1,_loc9_,_loc10_,_loc11_,_loc12_,50,4294967040);
                  if(_loc7_ == 0)
                  {
                     GraphicObjects.RenderStringAt(param1,GraphicObjects.gfx_font1,_loc9_,_loc10_,_loc5_.toString());
                  }
                  else
                  {
                     GraphicObjects.RenderStringAt(param1,GraphicObjects.gfx_font1,_loc9_,_loc10_,_loc7_.toString());
                  }
               }
               if(_loc6_.type == 2)
               {
                  Utils.RenderDotLine(param1,_loc9_,_loc10_,_loc11_,_loc12_,50,4294902015);
               }
               _loc7_++;
            }
            _loc5_++;
         }
      }
      
      internal static function RenderMiniMap(param1:BitmapData) : *
      {
         var _loc2_:int = 0;
         var _loc3_:ColorTransform = null;
         var _loc4_:int = 0;
         var _loc5_:PhysObj_Instance = null;
         var _loc6_:b2Vec2 = null;
         param1.copyPixels(minimapBD,minimapBD.rect,Defs.pointZero,null,null,true);
         _loc2_ = GraphicObjects.GetIndexByName("osd_minimap_icons");
         _loc3_ = new ColorTransform(1,1,1,1,0,0,0,-128);
         _loc4_ = 0;
         for each(_loc5_ in physObjInstances.list)
         {
            if(_loc5_.isVehicle)
            {
               _loc6_ = _loc5_.GetBodyWorldPos(0).Copy();
               _loc6_.Multiply(p2w);
               MiniMap_CalcPos(_loc6_.x,_loc6_.y);
               _loc4_ = _loc5_.carIndex;
               GraphicObjects.RenderAtRotScaled(_loc2_,_loc4_,param1,mm_x,mm_y,1,0,_loc3_,true);
            }
         }
      }
      
      public static function PreLoadLevel(param1:int) : *
      {
         var _loc3_:Level = null;
         var _loc4_:int = 0;
         var _loc5_:XML = null;
         var _loc2_:XML = ExternalData.xml_levels;
         _loc2_ = _loc2_.level[param1];
         _loc3_ = new Level();
         _loc3_.fullyLoaded = false;
         _loc3_.gotBalloon = false;
         _loc3_.available = false;
         _loc3_.complete = false;
         _loc3_.id = XmlHelper.GetAttrString(_loc2_.@id,"1");
         _loc3_.name = XmlHelper.GetAttrString(_loc2_.@name,"undefined");
         _loc3_.description = XmlHelper.GetAttrString(_loc2_.@desc,"");
         _loc3_.category = XmlHelper.GetAttrInt(_loc2_.@category,0);
         _loc3_.music = XmlHelper.GetAttrInt(_loc2_.@music,0);
         _loc3_.fillFrame = XmlHelper.GetAttrInt(_loc2_.@fillframe,1);
         _loc3_.surfaceFrame = XmlHelper.GetAttrInt(_loc2_.@surfaceframe,2);
         _loc3_.surfaceThickness = XmlHelper.GetAttrInt(_loc2_.@surfacethickness,10);
         _loc3_.eventType = XmlHelper.GetAttrString(_loc2_.@type,"race");
         _loc3_.eventOpponentsString = XmlHelper.GetAttrString(_loc2_.@opponents,"1");
         _loc3_.exclusiveChar = XmlHelper.GetAttrInt(_loc2_.@exclusivechar,-1);
         _loc3_.eventWinParam = XmlHelper.GetAttrNumber(_loc2_.@win,1);
         _loc3_.goldTime = XmlHelper.GetAttrNumber(_loc2_.times.@gold,10) * Defs.fps;
         _loc3_.silverTime = XmlHelper.GetAttrNumber(_loc2_.times.@silver,20) * Defs.fps;
         _loc3_.unlockPlace = XmlHelper.GetAttrInt(_loc2_.race.@unlockplace,1);
         _loc3_.numLaps = XmlHelper.GetAttrInt(_loc2_.race.@laps,3);
         _loc3_.night = XmlHelper.GetAttrBoolean(_loc2_.race.@night,false);
         _loc3_.aiCarMinSpeed = XmlHelper.GetAttrNumber(_loc2_.race.@minspd,14);
         _loc3_.aiCarMaxSpeed = XmlHelper.GetAttrNumber(_loc2_.race.@maxspd,17);
         _loc3_.raceType = XmlHelper.GetAttrString(_loc2_.race.@type,"race");
         _loc3_.aiCarTypeString = XmlHelper.GetAttrString(_loc2_.race.@aicars,"01234");
         _loc3_.levelFunctionName = XmlHelper.GetAttrString(_loc2_.race.@func,"");
         _loc3_.levelParams = XmlHelper.GetAttrString(_loc2_.race.@params,"");
         _loc3_.seatile1 = XmlHelper.GetAttrInt(_loc2_.race.@seatile1,1);
         _loc3_.seatile2 = XmlHelper.GetAttrInt(_loc2_.race.@seatile2,1);
         _loc4_ = 0;
         while(_loc4_ < _loc2_.helpscreen.length())
         {
            _loc5_ = _loc2_.helpscreen[_loc4_];
            _loc3_.helpscreenFrames.push(XmlHelper.GetAttrInt(_loc5_.@frame,0));
            _loc4_++;
         }
         levels.push(_loc3_);
      }
      
      public static function TestForTurboStart() : void
      {
         var _loc1_:Boolean = false;
         var _loc2_:* = undefined;
         var _loc3_:PhysObj_Instance = null;
         _loc1_ = false;
         if(KeyReader.Pressed(KeyReader.KEY_X))
         {
            _loc1_ = true;
         }
         if(KeyReader.Pressed(KeyReader.KEY_SPACE))
         {
            _loc1_ = true;
         }
         if(_loc1_ == false)
         {
            return;
         }
         _loc2_ = 0;
         if(levelState == levelState_LevelStart)
         {
            _loc2_ = startCountdownTimer;
         }
         else if(levelState == levelState_Play)
         {
            _loc2_ = levelTimer;
         }
         turboStartPressed = true;
         if(_loc2_ < 20)
         {
            turboStartSuccess = true;
            _loc3_ = GetPlayerInstance();
            if(_loc3_ != null)
            {
               _loc3_.turboLevel = 10 + (20 - _loc2_);
               _loc3_.UpdateTurbo(true);
               FlashConnect.trace("turbo start " + _loc2_);
            }
         }
      }
      
      internal static function InitPanelOverlay() : *
      {
         panelOverlay = new ingame_osd();
         panelOverlay.cacheAsBitmap = true;
         TitleScreenState.InitMusicMuteButton(panelOverlay.ButtonMusic);
         TitleScreenState.InitSFXMuteButton(panelOverlay.ButtonSFX);
         TitleScreenState.AddButton(panelOverlay.ButtonPause,PanelOverlay_ButtonPausePressed);
         Lic.MoreGamesButton(panelOverlay.buttonMoreGames,"hud");
         panelOverlay.cacheAsBitmap = true;
      }
      
      internal static function AllAreaBalloonsUnlocked(param1:int) : Boolean
      {
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         var _loc5_:Level = null;
         _loc2_ = 0;
         if(param1 == 0)
         {
            _loc2_ = 0;
         }
         if(param1 == 1)
         {
            _loc2_ = 10;
         }
         if(param1 == 2)
         {
            _loc2_ = 20;
         }
         if(param1 == 3)
         {
            _loc2_ = 30;
         }
         _loc4_ = 0;
         _loc3_ = _loc2_;
         while(_loc3_ < _loc2_ + 10)
         {
            _loc5_ = GetLevelLight(_loc3_);
            if(_loc5_ != null)
            {
               if(_loc5_.gotBalloon)
               {
                  _loc4_++;
               }
            }
            _loc3_++;
         }
         if(_loc4_ == 10)
         {
            return true;
         }
         return false;
      }
      
      internal static function MakeAICarColorList() : *
      {
         var _loc1_:int = 0;
         aiCarColorList = new Array();
         _loc1_ = 0;
         while(_loc1_ < 5)
         {
            aiCarColorList.push(_loc1_);
            _loc1_++;
         }
      }
      
      internal static function GetLineByIndex(param1:int) : PhysLine
      {
         var _loc2_:Level = GetCurrentLevel();
         return _loc2_.lines[param1];
      }
      
      internal static function ReadBinaryInt(param1:ByteArray) : int
      {
         return param1.readInt();
      }
      
      internal static function InitBackgroundSoundsOnce() : *
      {
         SoundPlayer.Play("sfx_sprayloop02",0,999999,"skid");
         poo = new MP3Pitch(null);
         poo.active = false;
      }
      
      internal static function GetMapData(param1:int, param2:int) : int
      {
         var _loc3_:Level = GetCurrentLevel();
         param1 /= _loc3_.mapCellW;
         param2 /= _loc3_.mapCellH;
         if(param1 < _loc3_.mapMinX || param1 > _loc3_.mapMaxX || param2 < _loc3_.mapMinY || param2 > _loc3_.mapMaxY)
         {
            return 0;
         }
         var _loc4_:int = _loc3_.mapMaxX - _loc3_.mapMinX + 1;
         param1 -= _loc3_.mapMinX;
         param2 -= _loc3_.mapMinY;
         return _loc3_.map[param1 + param2 * _loc4_];
      }
      
      internal static function PanelOverlay_ButtonPausePressed(param1:MouseEvent) : *
      {
         if(levelState != levelState_Play)
         {
            return;
         }
         if(PauseMenu.IsPaused() == false)
         {
            PauseMenu.Pause();
         }
      }
      
      internal static function GetBonusUnlock(param1:int) : Boolean
      {
         if(usedebug)
         {
            return true;
         }
         return bonusUnlocks[param1];
      }
      
      internal static function RenderReedPolyOverlays(param1:BitmapData) : void
      {
         var _loc2_:Graphics = null;
         var _loc4_:Matrix = null;
         var _loc5_:Number = NaN;
         var _loc6_:Number = NaN;
         var _loc7_:Number = NaN;
         var _loc8_:Number = NaN;
         var _loc9_:PhysLine = null;
         var _loc10_:int = 0;
         var _loc11_:int = 0;
         var _loc12_:BitmapData = null;
         var _loc13_:int = 0;
         var _loc14_:int = 0;
         _loc2_ = fillScreenMC.graphics;
         var _loc3_:uint = 65280;
         _loc2_.lineStyle(null,null,null);
         _loc4_ = new Matrix();
         _loc4_.translate(-camera.x,-camera.y);
         _loc5_ = camera.x;
         _loc6_ = camera.y;
         for each(_loc9_ in reedPolys)
         {
            if(_loc9_.type == 11)
            {
               _loc11_ = 0;
            }
            if(_loc9_.type == 12)
            {
               _loc11_ = 1;
            }
            _loc12_ = GraphicObjects.GetBitmapData(GraphicObjects.GetIndexByName("SceneryTextures"),_loc11_);
            _loc2_.beginBitmapFill(_loc12_,_loc4_,true);
            _loc7_ = _loc9_.points[0].x - _loc5_;
            _loc8_ = _loc9_.points[0].y - _loc6_;
            _loc2_.moveTo(_loc7_,_loc8_);
            _loc13_ = int(_loc9_.points.length);
            _loc10_ = 0;
            while(_loc10_ < _loc13_)
            {
               _loc14_ = _loc10_ % _loc13_;
               _loc7_ = _loc9_.points[_loc14_].x - _loc5_;
               _loc8_ = _loc9_.points[_loc14_].y - _loc6_;
               _loc2_.lineTo(_loc7_,_loc8_);
               _loc10_++;
            }
            _loc2_.endFill();
         }
      }
      
      public static function GetTurboOffset(param1:int) : Point
      {
         var _loc2_:Array = null;
         var _loc3_:Point = null;
         _loc2_ = turboOffsets[playerCarDataIndex];
         if(param1 < 0)
         {
            return new Point(0,0);
         }
         if(param1 >= 48)
         {
            return new Point(0,0);
         }
         _loc3_ = _loc2_[param1];
         _loc2_[param1] = _loc3_;
         return _loc2_[param1];
      }
      
      public static function StartTitleScreen() : *
      {
         FlashConnect.trace("Func: StartTitleScreen");
         gameState = gameState_UI;
         TitleScreenState.Init(main);
      }
      
      internal static function AddOutsideBorders() : *
      {
         var _loc2_:b2Body = null;
         var _loc3_:b2PolygonDef = null;
         var _loc4_:Point = null;
         var _loc5_:Point = null;
         var _loc6_:Point = null;
         var _loc7_:Point = null;
         var _loc8_:Point = null;
         var _loc9_:int = 0;
         var _loc15_:Rectangle = null;
         var _loc1_:b2BodyDef = new b2BodyDef();
         var _loc10_:b2FilterData = new b2FilterData();
         _loc10_.categoryBits = 1;
         _loc10_.maskBits = 15;
         var _loc11_:PhysObj_BodyUserData = new PhysObj_BodyUserData();
         _loc11_.bodyName = "wall";
         var _loc12_:int = camera.maxX - camera.minX;
         var _loc13_:int = camera.maxY - camera.minY;
         var _loc14_:Array = new Array();
         _loc14_.push(new Rectangle(camera.minX - 10,camera.minY - 10,_loc12_ + 20,10));
         _loc14_.push(new Rectangle(camera.minX - 10,camera.maxY,_loc12_ + 20,10));
         _loc14_.push(new Rectangle(camera.minX - 10,camera.minY - 10,10,_loc13_ + 20));
         _loc14_.push(new Rectangle(camera.maxX,camera.minY - 10,10,_loc13_ + 20));
         for each(_loc15_ in _loc14_)
         {
            _loc1_ = new b2BodyDef();
            _loc1_.position.Set(0,0);
            _loc2_ = world.CreateBody(_loc1_);
            _loc3_ = new b2PolygonDef();
            _loc3_.filter = _loc10_;
            _loc3_.vertexCount = 4;
            _loc3_.vertices[0].Set(_loc15_.left * w2p,_loc15_.top * w2p);
            _loc3_.vertices[1].Set(_loc15_.right * w2p,_loc15_.top * w2p);
            _loc3_.vertices[2].Set(_loc15_.right * w2p,_loc15_.bottom * w2p);
            _loc3_.vertices[3].Set(_loc15_.left * w2p,_loc15_.bottom * w2p);
            _loc3_.friction = 0;
            _loc3_.restitution = 0;
            _loc3_.density = 1;
            _loc2_.CreateShape(_loc3_);
            _loc3_ = null;
            _loc2_.SetUserData(_loc11_);
            _loc2_ = null;
         }
      }
      
      internal static function AddCash(param1:int) : *
      {
         cash += param1 * (currentLevel + 1);
      }
      
      internal static function GetLineIndexByTypeIndex(param1:int, param2:int) : int
      {
         var _loc6_:PhysLine = null;
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         var _loc5_:Level = GetCurrentLevel();
         for each(_loc6_ in _loc5_.lines)
         {
            if(_loc6_.type == param1)
            {
               if(_loc3_ == param2)
               {
                  return _loc4_;
               }
               _loc3_++;
            }
            _loc4_++;
         }
         return 0;
      }
      
      internal static function CaclulateScore() : *
      {
         var _loc1_:Level = null;
         currentScore = 0;
         for each(_loc1_ in levels)
         {
            if(_loc1_.available)
            {
               currentScore += _loc1_.bestScore;
            }
         }
      }
      
      public static function GetPlayerInstance() : PhysObj_Instance
      {
         var _loc1_:PhysObj_Instance = null;
         for each(_loc1_ in physObjInstances.list)
         {
            if(_loc1_.isVehicle && _loc1_.isPlayer)
            {
               return _loc1_;
            }
         }
         return null;
      }
      
      internal static function OutputWheelMarkers() : *
      {
         var _loc1_:String = null;
         var _loc2_:int = 0;
         var _loc3_:Array = null;
         var _loc4_:String = null;
         var _loc5_:Point = null;
         _loc1_ = "";
         _loc2_ = 0;
         for each(_loc3_ in wheelOffsets)
         {
            _loc4_ = "static var wheelMarker" + _loc2_ + ":Array = new Array(";
            for each(_loc5_ in _loc3_)
            {
               _loc4_ += "new Point(" + _loc5_.x + "," + _loc5_.y + "),";
            }
            _loc4_ = _loc4_.slice(0,_loc4_.length - 1);
            _loc4_ = _loc4_ + ");";
            FlashConnect.trace(_loc4_);
            _loc1_ += _loc4_ + "\n";
            _loc2_++;
         }
         ExternalData.OutputString(_loc1_);
      }
      
      public static function CarFinishedLap(param1:PhysObj_Instance, param2:int) : void
      {
         var _loc3_:int = 0;
         var _loc4_:String = null;
         var _loc5_:int = 0;
         LapPositions.push(new Point(param2,param1.vehicleCurrentLap));
         if(param2 == playerCarIndex)
         {
            if(driftLapFlag == false)
            {
               if(param1.isDrifting)
               {
                  driftLapFlag = true;
               }
            }
            else
            {
               driftLapComplete = true;
            }
            _loc3_ = lap_timer;
            lap_times.push(lap_timer);
            if(lap_timer <= best_lap_time)
            {
               best_lap_time = lap_timer;
            }
            FlashConnect.trace("lap time: " + lap_timer + "    best: " + best_lap_time);
            lap_timer = 0;
            _loc4_ = "Lap " + lap_times.length + " time: " + Utils.CounterToMinutesSecondsString(_loc3_);
            InitMessage(_loc4_,camera.x + 320,camera.y + 80);
            _loc5_ = GetPlayerLapPosition(param1.vehicleCurrentLap);
            _loc4_ = places[_loc5_ + 1] + " Place.";
            InitMessage(_loc4_,camera.x + 320,camera.y + 110);
         }
      }
      
      internal static function GetCurrentLevelInstances() : Array
      {
         if(currentLevel < 0)
         {
            return null;
         }
         if(currentLevel >= levels.length)
         {
            return null;
         }
         LoadLevel(currentLevel,false);
         return levels[currentLevel].instances;
      }
      
      internal static function GetPhysObjInstanceByTypeName(param1:String) : PhysObj_Instance
      {
         var _loc2_:PhysObj_Instance = null;
         for each(_loc2_ in physObjInstances.list)
         {
            if(_loc2_.typeName == param1)
            {
               return _loc2_;
            }
         }
         return null;
      }
      
      internal static function PanelOverlay_UpdateTime() : *
      {
         panelOverlay.OSDTextTime.text = Utils.CounterToMinutesSecondsString(race_time);
      }
      
      internal static function InitTurboOffsets() : *
      {
         turboOffsets = new Array();
         turboOffsets.push(turboOffset0);
         turboOffsets.push(turboOffset1);
         turboOffsets.push(turboOffset2);
         turboOffsets.push(turboOffset3);
         turboOffsets.push(turboOffset4);
         wheelOffsets = new Array();
         wheelOffsets.push(wheelMarker0);
         wheelOffsets.push(wheelMarker1);
         wheelOffsets.push(wheelMarker2);
         wheelOffsets.push(wheelMarker3);
         wheelOffsets.push(wheelMarker4);
         wheelOffsets.push(wheelMarker5);
         wheelOffsets.push(wheelMarker6);
         wheelOffsets.push(wheelMarker7);
         wheelOffsets.push(wheelMarker8);
         wheelOffsets.push(wheelMarker9);
      }
      
      internal static function InitLines() : *
      {
         var _loc2_:b2Body = null;
         var _loc3_:b2PolygonDef = null;
         var _loc4_:Point = null;
         var _loc5_:Point = null;
         var _loc6_:Point = null;
         var _loc7_:Point = null;
         var _loc8_:Point = null;
         var _loc9_:int = 0;
         var _loc22_:PhysLine = null;
         var _loc23_:Array = null;
         var _loc24_:int = 0;
         var _loc25_:PhysObj_BodyUserData = null;
         var _loc26_:int = 0;
         var _loc27_:Number = NaN;
         var _loc28_:Number = NaN;
         var _loc29_:Number = NaN;
         var _loc30_:Number = NaN;
         var _loc31_:PhysObj_BodyUserData = null;
         var _loc32_:PhysObj_BodyUserData = null;
         reedPolys = new Array();
         checkpointLines = new Array();
         var _loc1_:b2BodyDef = new b2BodyDef();
         var _loc10_:PhysObj_BodyUserData = new PhysObj_BodyUserData();
         _loc10_.bodyName = "wall";
         var _loc11_:PhysObj_BodyUserData = new PhysObj_BodyUserData();
         _loc11_.bodyName = "wall_death";
         var _loc12_:PhysObj_BodyUserData = new PhysObj_BodyUserData();
         _loc12_.bodyName = "ramp";
         var _loc13_:PhysObj_BodyUserData = new PhysObj_BodyUserData();
         _loc13_.bodyName = "hump";
         var _loc14_:PhysObj_BodyUserData = new PhysObj_BodyUserData();
         _loc14_.bodyName = "bigramp";
         var _loc15_:int = 0;
         var _loc16_:int = 0;
         var _loc17_:int = 0;
         var _loc18_:Number = 50;
         var _loc19_:Level = GetCurrentLevel();
         var _loc20_:b2FilterData = new b2FilterData();
         _loc20_.categoryBits = 1;
         _loc20_.maskBits = 15;
         var _loc21_:b2FilterData = new b2FilterData();
         _loc21_.categoryBits = 2;
         _loc21_.maskBits = 2;
         for each(_loc22_ in _loc19_.lines)
         {
            _loc23_ = _loc22_.points;
            _loc24_ = _loc22_.type;
            if(_loc24_ == 9)
            {
               InitEdgeLineSprites(_loc22_);
            }
            if(_loc24_ == 11)
            {
               AddReedPoly(_loc22_);
            }
            if(_loc24_ == 12)
            {
               AddReedPoly(_loc22_);
            }
            if(_loc24_ == 3)
            {
               _loc1_.position.Set(0,0);
               _loc2_ = world.CreateBody(_loc1_);
               if(_loc2_ != null)
               {
                  _loc3_ = new b2PolygonDef();
                  _loc3_.filter = _loc20_;
                  _loc3_.vertexCount = _loc23_.length;
                  _loc3_.isSensor = true;
                  _loc9_ = 0;
                  while(_loc9_ < _loc23_.length)
                  {
                     _loc5_ = _loc23_[_loc9_].clone();
                     _loc3_.vertices[_loc9_].Set(_loc5_.x * w2p,_loc5_.y * w2p);
                     _loc9_++;
                  }
                  _loc3_.friction = 0.1;
                  _loc3_.restitution = 0.1;
                  _loc3_.density = 1;
                  _loc2_.CreateShape(_loc3_);
                  _loc2_.SetUserData(_loc12_);
                  _loc3_ = null;
                  _loc2_ = null;
               }
            }
            if(_loc24_ == 4)
            {
               _loc1_.position.Set(0,0);
               _loc2_ = world.CreateBody(_loc1_);
               if(_loc2_ != null)
               {
                  _loc3_ = new b2PolygonDef();
                  _loc3_.filter = _loc20_;
                  _loc3_.vertexCount = _loc23_.length;
                  _loc3_.isSensor = true;
                  _loc9_ = 0;
                  while(_loc9_ < _loc23_.length)
                  {
                     _loc5_ = _loc23_[_loc9_].clone();
                     _loc3_.vertices[_loc9_].Set(_loc5_.x * w2p,_loc5_.y * w2p);
                     _loc9_++;
                  }
                  _loc3_.friction = 0.1;
                  _loc3_.restitution = 0.1;
                  _loc3_.density = 1;
                  _loc2_.CreateShape(_loc3_);
                  _loc3_ = null;
                  _loc2_.SetUserData(_loc13_);
                  _loc2_ = null;
               }
            }
            if(_loc24_ == 5)
            {
               _loc1_.position.Set(0,0);
               _loc2_ = world.CreateBody(_loc1_);
               if(_loc2_ != null)
               {
                  _loc3_ = new b2PolygonDef();
                  _loc3_.filter = _loc20_;
                  _loc3_.vertexCount = _loc23_.length;
                  _loc3_.isSensor = true;
                  _loc9_ = 0;
                  while(_loc9_ < _loc23_.length)
                  {
                     _loc5_ = _loc23_[_loc9_].clone();
                     _loc3_.vertices[_loc9_].Set(_loc5_.x * w2p,_loc5_.y * w2p);
                     _loc9_++;
                  }
                  _loc3_.friction = 0.1;
                  _loc3_.restitution = 0.1;
                  _loc3_.density = 1;
                  _loc2_.CreateShape(_loc3_);
                  _loc3_ = null;
                  _loc25_ = new PhysObj_BodyUserData();
                  _loc25_.bodyName = "routechange";
                  _loc25_.id = _loc17_;
                  _loc2_.SetUserData(_loc25_);
                  _loc17_++;
                  _loc2_ = null;
               }
            }
            if(_loc24_ == 6)
            {
               _loc1_.position.Set(0,0);
               _loc2_ = world.CreateBody(_loc1_);
               if(_loc2_ != null)
               {
                  _loc3_ = new b2PolygonDef();
                  _loc3_.filter = _loc20_;
                  _loc3_.vertexCount = _loc23_.length;
                  _loc3_.isSensor = true;
                  _loc9_ = 0;
                  while(_loc9_ < _loc23_.length)
                  {
                     _loc5_ = _loc23_[_loc9_].clone();
                     _loc3_.vertices[_loc9_].Set(_loc5_.x * w2p,_loc5_.y * w2p);
                     _loc9_++;
                  }
                  _loc3_.friction = 0.1;
                  _loc3_.restitution = 0.1;
                  _loc3_.density = 1;
                  _loc2_.CreateShape(_loc3_);
                  _loc3_ = null;
                  _loc2_.SetUserData(_loc14_);
                  _loc2_ = null;
               }
            }
            if(_loc24_ == 7)
            {
            }
            if(_loc24_ == 2)
            {
               AddCheckpointLine(_loc22_);
               _loc9_ = 0;
               while(_loc9_ < _loc23_.length - 1)
               {
                  _loc5_ = _loc23_[_loc9_].clone();
                  _loc26_ = _loc9_ + 1;
                  _loc26_ = _loc26_ % _loc23_.length;
                  _loc6_ = _loc23_[_loc26_].clone();
                  _loc7_ = _loc6_.clone();
                  _loc8_ = _loc5_.clone();
                  _loc27_ = Math.atan2(_loc6_.y - _loc5_.y,_loc6_.x - _loc5_.x);
                  _loc27_ = _loc27_ + Math.PI / 2;
                  _loc28_ = 30;
                  _loc29_ = Math.cos(_loc27_) * _loc28_;
                  _loc30_ = Math.sin(_loc27_) * _loc28_;
                  _loc7_.x += _loc29_;
                  _loc7_.y += _loc30_;
                  _loc8_.x += _loc29_;
                  _loc8_.y += _loc30_;
                  _loc1_ = new b2BodyDef();
                  _loc1_.position.Set(0,0);
                  _loc2_ = world.CreateBody(_loc1_);
                  if(_loc2_ != null)
                  {
                     _loc3_ = new b2PolygonDef();
                     _loc3_.filter = _loc20_;
                     _loc3_.vertexCount = 4;
                     _loc3_.vertices[0].Set(_loc5_.x * w2p,_loc5_.y * w2p);
                     _loc3_.vertices[1].Set(_loc6_.x * w2p,_loc6_.y * w2p);
                     _loc3_.vertices[2].Set(_loc7_.x * w2p,_loc7_.y * w2p);
                     _loc3_.vertices[3].Set(_loc8_.x * w2p,_loc8_.y * w2p);
                     _loc3_.isSensor = true;
                     _loc3_.friction = 0.1;
                     _loc3_.restitution = 0.1;
                     _loc3_.density = 1;
                     _loc2_.CreateShape(_loc3_);
                     _loc3_ = null;
                     _loc31_ = new PhysObj_BodyUserData();
                     _loc31_.bodyName = "checkpoint";
                     _loc31_.id = _loc16_;
                     _loc16_++;
                     _loc2_.SetUserData(_loc31_);
                     _loc2_ = null;
                  }
                  _loc9_++;
               }
            }
            if(_loc24_ == 8)
            {
               _loc9_ = 0;
               while(_loc9_ < _loc23_.length - 1)
               {
                  _loc5_ = _loc23_[_loc9_].clone();
                  _loc26_ = _loc9_ + 1;
                  _loc26_ = _loc26_ % _loc23_.length;
                  _loc6_ = _loc23_[_loc26_].clone();
                  _loc7_ = _loc6_.clone();
                  _loc8_ = _loc5_.clone();
                  _loc27_ = Math.atan2(_loc6_.y - _loc5_.y,_loc6_.x - _loc5_.x);
                  _loc27_ = _loc27_ + Math.PI / 2;
                  _loc28_ = 10;
                  _loc29_ = Math.cos(_loc27_) * _loc28_;
                  _loc30_ = Math.sin(_loc27_) * _loc28_;
                  _loc5_.x -= _loc29_;
                  _loc5_.y -= _loc30_;
                  _loc6_.x -= _loc29_;
                  _loc6_.y -= _loc30_;
                  _loc7_.x += _loc29_;
                  _loc7_.y += _loc30_;
                  _loc8_.x += _loc29_;
                  _loc8_.y += _loc30_;
                  _loc1_ = new b2BodyDef();
                  _loc1_.position.Set(0,0);
                  _loc2_ = world.CreateBody(_loc1_);
                  if(_loc2_ != null)
                  {
                     _loc3_ = new b2PolygonDef();
                     _loc3_.filter = _loc20_;
                     _loc3_.vertexCount = 4;
                     _loc3_.vertices[0].Set(_loc5_.x * w2p,_loc5_.y * w2p);
                     _loc3_.vertices[1].Set(_loc6_.x * w2p,_loc6_.y * w2p);
                     _loc3_.vertices[2].Set(_loc7_.x * w2p,_loc7_.y * w2p);
                     _loc3_.vertices[3].Set(_loc8_.x * w2p,_loc8_.y * w2p);
                     _loc3_.isSensor = true;
                     _loc3_.friction = 0.1;
                     _loc3_.restitution = 0.1;
                     _loc3_.density = 1;
                     _loc2_.CreateShape(_loc3_);
                     _loc3_ = null;
                     _loc32_ = new PhysObj_BodyUserData();
                     _loc32_.bodyName = "slalomgate";
                     _loc32_.id = _loc15_;
                     _loc15_++;
                     _loc2_.SetUserData(_loc32_);
                     _loc2_ = null;
                  }
                  _loc9_++;
               }
            }
            if(_loc24_ == 10)
            {
               if(_loc23_.length >= 2)
               {
                  _loc9_ = 0;
                  while(_loc9_ < _loc23_.length)
                  {
                     _loc5_ = _loc23_[_loc9_].clone();
                     _loc26_ = _loc9_ + 1;
                     _loc26_ = _loc26_ % _loc23_.length;
                     _loc6_ = _loc23_[_loc26_].clone();
                     _loc7_ = _loc6_.clone();
                     _loc8_ = _loc5_.clone();
                     _loc27_ = Math.atan2(_loc6_.y - _loc5_.y,_loc6_.x - _loc5_.x);
                     _loc27_ = _loc27_ + Math.PI / 2;
                     _loc28_ = 5;
                     _loc29_ = Math.cos(_loc27_) * _loc28_;
                     _loc30_ = Math.sin(_loc27_) * _loc28_;
                     _loc7_.x += _loc29_;
                     _loc7_.y += _loc30_;
                     _loc8_.x += _loc29_;
                     _loc8_.y += _loc30_;
                     _loc1_ = new b2BodyDef();
                     _loc1_.position.Set(0,0);
                     _loc2_ = world.CreateBody(_loc1_);
                     if(_loc2_ != null)
                     {
                        _loc3_ = new b2PolygonDef();
                        _loc3_.filter = _loc20_;
                        if(_loc24_ == 1)
                        {
                           _loc3_.filter = _loc21_;
                        }
                        _loc3_.vertexCount = 4;
                        _loc3_.vertices[0].Set(_loc5_.x * w2p,_loc5_.y * w2p);
                        _loc3_.vertices[1].Set(_loc6_.x * w2p,_loc6_.y * w2p);
                        _loc3_.vertices[2].Set(_loc7_.x * w2p,_loc7_.y * w2p);
                        _loc3_.vertices[3].Set(_loc8_.x * w2p,_loc8_.y * w2p);
                        _loc3_.isSensor = false;
                        _loc3_.friction = 0;
                        _loc3_.restitution = 0;
                        _loc3_.density = 1;
                        _loc2_.CreateShape(_loc3_);
                        _loc3_ = null;
                        _loc2_.SetUserData(_loc11_);
                        _loc2_ = null;
                     }
                     _loc9_++;
                  }
               }
            }
            if(_loc24_ <= 0)
            {
               if(_loc23_.length >= 2)
               {
                  _loc9_ = 0;
                  while(_loc9_ < _loc23_.length)
                  {
                     _loc5_ = _loc23_[_loc9_].clone();
                     _loc26_ = _loc9_ + 1;
                     _loc26_ = _loc26_ % _loc23_.length;
                     _loc6_ = _loc23_[_loc26_].clone();
                     _loc7_ = _loc6_.clone();
                     _loc8_ = _loc5_.clone();
                     _loc27_ = Math.atan2(_loc6_.y - _loc5_.y,_loc6_.x - _loc5_.x);
                     _loc27_ = _loc27_ + Math.PI / 2;
                     _loc28_ = 5;
                     _loc29_ = Math.cos(_loc27_) * _loc28_;
                     _loc30_ = Math.sin(_loc27_) * _loc28_;
                     _loc7_.x += _loc29_;
                     _loc7_.y += _loc30_;
                     _loc8_.x += _loc29_;
                     _loc8_.y += _loc30_;
                     _loc1_ = new b2BodyDef();
                     _loc1_.position.Set(0,0);
                     _loc2_ = world.CreateBody(_loc1_);
                     if(_loc2_ != null)
                     {
                        _loc3_ = new b2PolygonDef();
                        _loc3_.filter = _loc20_;
                        if(_loc24_ == 1)
                        {
                           _loc3_.filter = _loc21_;
                        }
                        _loc3_.vertexCount = 4;
                        _loc3_.vertices[0].Set(_loc5_.x * w2p,_loc5_.y * w2p);
                        _loc3_.vertices[1].Set(_loc6_.x * w2p,_loc6_.y * w2p);
                        _loc3_.vertices[2].Set(_loc7_.x * w2p,_loc7_.y * w2p);
                        _loc3_.vertices[3].Set(_loc8_.x * w2p,_loc8_.y * w2p);
                        _loc3_.friction = 0;
                        _loc3_.restitution = 0;
                        _loc3_.density = 1;
                        _loc2_.CreateShape(_loc3_);
                        _loc3_ = null;
                        _loc2_.SetUserData(_loc10_);
                        _loc2_ = null;
                     }
                     _loc9_++;
                  }
               }
            }
         }
      }
      
      internal static function GetLevelLight(param1:int) : Level
      {
         if(param1 < 0)
         {
            return null;
         }
         if(param1 >= levels.length)
         {
            return null;
         }
         return levels[param1];
      }
      
      public static function InitTestForTurboStart() : void
      {
         turboStartPressed = false;
         turboStartSuccess = false;
      }
      
      public static function InitOnce() : *
      {
         upgrades = new Upgrades();
         currentScore = 0;
         multiplier = 1;
         numLevels = 8;
         currentLevel = 0;
         playerCarDataIndex = 0;
         InitPanelOverlay();
         gameState = gameState_UI;
         InitBitmaps();
         camera = new Camera();
         MakeAngs();
         playerBoatName = "The Tub";
         playerName = "YOU";
         InitGlobalLevelData();
         achievements = new Achievements();
         numRacesCompleted = 0;
         numRacesWon = 0;
         numRacesNotWon = 0;
         totalWonInRow = 0;
         totalWonInRowPerLevel = new Array(0,0,0,0,0,0,0,0,0);
         levelFunctions = new LevelFunctions();
         carColors = new Array();
         carColors.push(128,-64,-64);
         carColors.push(-64,128,-64);
         carColors.push(-64,-64,128);
         carColors.push(-64,128,128);
         carColors.push(128,128,-64);
         carColors.push(128,128,128);
         carColors.push(0,0,0);
         carColors.push(-128,-128,-128);
         carColors.push(0,0,196);
         carColors.push(0,196,0);
         carColors.push(196,0,0);
         carColors.push(128,0,128);
         carColors.push(64,-64,128);
         carColors.push(128,64,-64);
         carColors.push(64,0,-128);
         playerCarColorIndex = 5;
         InitBackgroundSoundsOnce();
         QuietAllSounds();
         InitBox2D();
         physObjs = new PhysObjs();
         physObjs.InitFromXml(ExternalData.xml);
         physObjInstances = new PhysObj_Instances();
         InitHeadlightOverlay();
         InitTurboOffsets();
         cheatActive = 0;
         InitBonusUnlocks();
         AIPlayers.InitOnce();
      }
      
      internal static function CompleteFinalRaceOrder() : *
      {
         var _loc1_:Array = null;
         var _loc2_:Array = null;
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         _loc1_ = new Array();
         _loc2_ = new Array();
         for each(_loc3_ in finalRaceOrder)
         {
            _loc1_.push(_loc3_);
         }
         _loc4_ = 0;
         while(_loc4_ < 6)
         {
            if(_loc1_.indexOf(_loc4_) == -1)
            {
               _loc2_.push(_loc4_);
            }
            _loc4_++;
         }
         for each(_loc3_ in _loc2_)
         {
            finalRaceOrder.push(_loc3_);
         }
      }
      
      internal static function GetCurrentLevel() : Level
      {
         if(currentLevel < 0)
         {
            return null;
         }
         if(currentLevel >= levels.length)
         {
            return null;
         }
         LoadLevel(currentLevel,false);
         return levels[currentLevel];
      }
      
      internal static function StopRecordPlayer() : *
      {
      }
      
      public static function RemoveObj_Standard(param1:PhysObj_Instance) : *
      {
         physObjInstances.Remove(param1);
      }
      
      internal static function GetNumObjectsDestroyed(param1:String) : int
      {
         return objectsDestroyedList.GetCount(param1);
      }
      
      internal static function AddDestroyedObject(param1:String) : *
      {
         objectsDestroyedList.Add(param1);
         ++totalObjectsDestroyed;
      }
      
      internal static function StartRecordPlayer() : *
      {
      }
   }
}

