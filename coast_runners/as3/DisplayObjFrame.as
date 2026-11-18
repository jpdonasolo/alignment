package
{
   import flash.display.BitmapData;
   import flash.geom.ColorTransform;
   import flash.geom.Matrix;
   import flash.geom.Point;
   import flash.geom.Rectangle;
   import flash.utils.Dictionary;
   
   internal class DisplayObjFrame
   {
      
      public static var mat:Matrix = new Matrix();
      
      public static var colTrans:ColorTransform = new ColorTransform();
      
      private static var blitRect:Rectangle = new Rectangle();
      
      private static var tintCache:Dictionary;
      
      public var xoffset:Number;
      
      public var yoffset:Number;
      
      public var point:Point;
      
      public var bitmapData:BitmapData;
      
      public var sourceRect:Rectangle;
      
      public function DisplayObjFrame()
      {
         super();
      }
      
      public function RenderAtRotScaled(param1:BitmapData, param2:Number, param3:Number, param4:Number = 1, param5:Number = 0, param6:ColorTransform = null, param7:Boolean = false) : void
      {
         if(param4 == 1 && param5 == 0 && param7 == false && this.bitmapData != null)
         {
            var tile:BitmapData = this.bitmapData;
            var origin:Rectangle = this.sourceRect;
            if(!isPlain(param6))
            {
               tile = tintedBitmap(this.bitmapData,param6,0,0,this.bitmapData.width,this.bitmapData.height);
               origin = tile.rect;
            }
            this.point.x = param2 + this.xoffset;
            this.point.y = param3 + this.yoffset;
            param1.copyPixels(tile,origin,this.point,null,null,true);
            return;
         }
         mat.identity();
         mat.translate(this.xoffset,this.yoffset);
         mat.rotate(param5);
         mat.translate(-this.xoffset,-this.yoffset);
         mat.scale(param4,param4);
         mat.translate(param2 + this.xoffset * param4,param3 + this.yoffset * param4);
         if(this.bitmapData != null)
         {
            param1.draw(this.bitmapData,mat,param6,null,null,param7);
         }
      }
      
      public function RenderAt(param1:BitmapData, param2:Number, param3:Number) : void
      {
         this.point.x = param2 + this.xoffset;
         this.point.y = param3 + this.yoffset;
         param1.copyPixels(this.bitmapData,this.sourceRect,this.point,null,null,true);
      }
      
      public function RenderAtCT(param1:BitmapData, param2:Number, param3:Number, param4:ColorTransform) : void
      {
         mat.identity();
         mat.translate(param2 + this.xoffset,param3 + this.yoffset);
         if(this.bitmapData != null)
         {
            param1.draw(this.bitmapData,mat,param4);
         }
      }
      
      public function RenderAtRotScaled_SourceRect(param1:BitmapData, param2:Number, param3:Number, param4:Number = 1, param5:Number = 0, param6:ColorTransform = null, param7:Boolean = false, param8:Rectangle = null, param9:int = 0, param10:int = 0) : void
      {
         if(param4 == 1 && param5 == 0 && param7 == false && this.bitmapData != null && param8 != null)
         {
            var sx:int = int(param9 - this.xoffset);
            var sy:int = int(param10 - this.yoffset);
            var tile:BitmapData = this.bitmapData;
            if(!isPlain(param6))
            {
               tile = tintedBitmap(this.bitmapData,param6,sx,sy,int(param8.width),int(param8.height));
               sx = 0;
               sy = 0;
            }
            blitRect.x = sx;
            blitRect.y = sy;
            blitRect.width = param8.width;
            blitRect.height = param8.height;
            this.point.x = param2;
            this.point.y = param3;
            param1.copyPixels(tile,blitRect,this.point,null,null,true);
            return;
         }
         mat.identity();
         mat.translate(this.xoffset,this.yoffset);
         mat.rotate(param5);
         mat.translate(-this.xoffset,-this.yoffset);
         mat.scale(param4,param4);
         mat.translate(param2 + (this.xoffset - param9) * param4,param3 + (this.yoffset - param10) * param4);
         param8.x = param2;
         param8.y = param3;
         if(this.bitmapData != null)
         {
            param1.draw(this.bitmapData,mat,param6,null,param8,param7);
         }
      }
      
      private static function isPlain(ct:ColorTransform) : Boolean
      {
         return ct == null || ct.redMultiplier == 1 && ct.greenMultiplier == 1 && ct.blueMultiplier == 1 && ct.alphaMultiplier == 1 && ct.redOffset == 0 && ct.greenOffset == 0 && ct.blueOffset == 0 && ct.alphaOffset == 0;
      }
      
      private static function tintedBitmap(source:BitmapData, ct:ColorTransform, sx:int, sy:int, w:int, h:int) : BitmapData
      {
         if(tintCache == null)
         {
            tintCache = new Dictionary();
         }
         var perSource:Object = tintCache[source];
         if(perSource == null)
         {
            perSource = {};
            tintCache[source] = perSource;
         }
         var key:String = sx + "," + sy + "," + w + "," + h + "," + ct.redMultiplier + "," + ct.greenMultiplier + "," + ct.blueMultiplier + "," + ct.alphaMultiplier + "," + ct.redOffset + "," + ct.greenOffset + "," + ct.blueOffset + "," + ct.alphaOffset;
         var cached:BitmapData = perSource[key];
         if(cached == null)
         {
            cached = new BitmapData(w,h,true,0);
            mat.identity();
            mat.translate(-sx,-sy);
            cached.draw(source,mat,ct,null,null,false);
            perSource[key] = cached;
         }
         return cached;
      }
   }
}
