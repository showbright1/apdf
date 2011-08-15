/**
 *@author Mirko Bordjoski 
 */ 
 
 

package com.candymandesign.pdf.objects
{
	import flash.display.BitmapData;
	import flash.display.DisplayObject;
	
	import mx.graphics.codec.JPEGEncoder;
	import mx.utils.Base64Encoder;


	/**
	 * The APDFPage class represents the page of the PDF document.
	 */ 
	public class APDFPage
	{
		
		
		/**
		 * The name of the page.
		 */ 
		public var name:String;
		
		/**
		 * @private
		 */ 
		public var elements:Array;
		
		
		
		
		
		/**
		 * Constructor.
		 * The APDFPage class represents the page of the PDF document.
	 	*/ 
		public function APDFPage()
		{
			init();
		}
		
		
		/**
		 * @private
		 */ 
		protected function init():void
		{
			elements = new Array();
		}
		
		
		/**
		 * Add new image in the page.
		 * 
		 * @param		$source		- DisplayObject you want to include in the pdf page.
		 * @param		$quality	- The quality of the image.
		 * @param		$x			- x position of the image.
		 * @param		$y			- y position of the image.
		 * @param		$width		- The width of the image. If this value is 0 and the height value is 0, the width and height would be the actual size of display object.
		 * @param		$height		- The height of the image. If this value is 0 and the width value is 0 the image size would be the actual size of display object.
		 * 
		 * Usage example:
		 * 
		 * <listing></code>
		 * import com.candymandesign.pdf.APDF;
		 * 
		 * var pdf:APDF = new APDF();
		 * pdf.addPage();
		 * pdf.currentPage.addImage(this, 70, 10,10, 90,0); 
		 * pdf.export("pathTo_APDF_PHP_file");
		 * 
		 * // if you set the width(height) 
		 * // and leave the height(width) as 0,
		 * // height(width) will be automaticly calculated. 
		 * 
		 * </code></listing>
		 * 
		 */ 
		public function addImage($source:DisplayObject, $quality:Number = 60, $x:Number = 10, $y:Number = 10, $width:Number = 0, $height:Number = 0):void
		{
			var bmd:BitmapData = new BitmapData($source.width,$source.height,false,0xffffff);
			bmd.draw($source);
			var jpg:JPEGEncoder = new JPEGEncoder($quality);
			var base:Base64Encoder = new Base64Encoder();
			base.encodeBytes(jpg.encode(bmd));			
			var pageElement:Object = new Object();
			pageElement.type = "image";
			pageElement.x = String($x);
			pageElement.y = String($y);
			pageElement.width = String($width);
			pageElement.height = String($height);
			pageElement.data = base.toString();
			elements.push(pageElement);
		}
		
		
		
		
		/**
		 * Add new text in the page. You can have some html text too.
		 * 
		 * @param		$text		- The text.
		 * @param		$x			- The x position of the text.
		 * @param		$y			- The y position of the text.
		 * @param		$fontSize	- The font size.
		 * @param		$fontWeight	- The font weight. If this value is "", it will be set as normal.
		 * @param		$fontType	- the font type.
		 * 
		 * 
		 * Usage example:
		 * 
		 * <listing></code>
		 * import com.candymandesign.pdf.APDF;
		 * import com.candymandesign.pdf.objects.APDFont;
		 * 
		 * var pdf:APDF = new APDF();
		 * pdf.addPage();
		 * pdf.currentPage.addText("Some really smart text",0,0, 12, "B", APDFont.COURIER);
		 * pdf.export("pathTo_APDF_PHP_file");
		 * 
		 * </code></listing>
		 */ 
		public function addText($text:String, $x:Number = 10, $y:Number = 10, $fontSize:Number = 12, $fontWeight:String = "", $fontType:String = "Arial"):void
		{
			var pageElement:Object = new Object();
			pageElement.type = "text";
			pageElement.data = $text;
			pageElement.x = $x;
			pageElement.y = $y;
			pageElement.size = $fontSize;
			pageElement.weight = $fontWeight;
			pageElement.fontType = $fontType;
			elements.push(pageElement);
		}
		
		
		/**
		 * Add new cell in the page. It is very similiar with addText method.
		 * 
		 * @param		$text		- The text.
		 * @param		$x			- The x position of the text.
		 * @param		$y			- The y position of the text.
		 * @param		$fontSize	- The font size.
		 * @param		$fontWeight	- The font weight. If this value is "", it will be set as normal.
		 * @param		$fontType	- the font type.
		 * 
		 * 
		 * Usage example:
		 * 
		 * <listing></code>
		 * import com.candymandesign.pdf.APDF;
		 * import com.candymandesign.pdf.objects.APDFont;
		 * 
		 * var pdf:APDF = new APDF();
		 * pdf.addPage();
		 * pdf.currentPage.addCell("Some really smart text in the cell.",0,0, 12, "B", APDFont.COURIER);
		 * pdf.export("pathTo_APDF_PHP_file");
		 * 
		 * </code></listing>
		 */ 
		public function addCell($text:String, $x:Number = 10, $y:Number = 10, $fontSize:Number = 12, $fontWeight:String = "", $fontType:String = "Arial"):void
		{
			var pageElement:Object = new Object();
			pageElement.type = "cell";
			pageElement.data = $text;
			pageElement.x = $x;
			pageElement.y = $y;
			pageElement.size = $fontSize;
			pageElement.weight = $fontWeight;
			pageElement.fontType = $fontType;
			elements.push(pageElement);
		}
		
	}
}