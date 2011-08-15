package com.candymandesign.pdf.objects
{
	/**
	 * The APDFormat class enable to set the format of PDF document.
	 */ 
	public class APDFormat
	{
		public static const LANDSCAPE:String = "L";
		public static const PORTRAIT:String = "P";
		
		public static const PAGE_SIZE_A4:String = "A4";
		public static const PAGE_SIZE_A3:String = "A3";
		public static const PAGE_SIZE_A5:String = "A5";
		public static const PAGE_SIZE_LETTER:String = "Letter";
		public static const PAGE_SIZE_LEGAL:String = "Legal";
		
		public static const UNIT_MM:String = "mm";
		public static const UNIT_CM:String = "cm";
		public static const UNIT_INCH:String = "in";
		public static const UNIT_POINT:String = "pt";
		
		
		
		/**
		 * The format of PDF document.
		 */ 
		public var pageSize:String;
		/**
		 * The orientation of PDF document.
		 */ 
		public var orientation:String;
		
		/**
		 * The unit. Default value is mm.
		 */ 
		public var unit:String;
		
		
		/**
		 * The left margin of PDF document.
		 */ 
		public var leftMargin:Number;
		
		/**
		 * The top margin of PDF document.
		 */
		public var topMargin:Number;
		
		/**
		 * The right margin of PDF document.
		 */
		public var rightMargin:Number;
		
		
		/**
		 * Constructor.
		 * The APDFormat class enable to set the format of PDF document.
		 */
		public function APDFormat()
		{
			init();
		}
		
		/**
		 * @private
		 */ 
		protected function init():void
		{
			orientation = APDFormat.PORTRAIT;
			unit = APDFormat.UNIT_MM;
			pageSize = APDFormat.PAGE_SIZE_A4;
			
			leftMargin = 10;
			rightMargin = 10;
			topMargin = 10;
		}
		
		/**
		 * Set margins in the PDF document. Default value is 10mm. Change this values if you change the unit.
		 * @param		$left		- The left margin.
		 * @param		$top		- The top margin.
		 * @param		$right		- The right margin.
		 */ 
		public function setMargines($left:Number = 10, $top:Number = 10, $right:Number = 10):void
		{
			leftMargin = $left;
			rightMargin = $right;
			topMargin = $top;
		}
	}
}