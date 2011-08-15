package com.candymandesign.pdf.objects
{
	/**
	 * The APDFDocumentInfo class holds the data about author, keywords, subject and title.
	 */ 
	public class APDFDocumentInfo
	{
		/**
		 * @private
		 */ 
		public static const CREATOR:String = "APDF 1.0.0";
		
		/**
		 * The author of the document.
		 */
		public var author:String = "";
		
		/**
		 * The keywords.
		 */
		public var keywords:String = "";
		
		/**
		 * The subject of PDF document.
		 */
		public var subject:String = "";
		
		/**
		 * The title of PDF document.
		 */
		public var title:String = "";
		
		/**
		 * Constructor.
		 */
		public function APDFDocumentInfo(){}

	}
}