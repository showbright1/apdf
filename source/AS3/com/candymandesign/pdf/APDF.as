/**
 *@author Mirko Bordjoski 
 */ 
 
/**
* This package enables to create and export PDF documents from Flex.  
*/ 
package com.candymandesign.pdf
{
	import com.candymandesign.pdf.logic.APDFParser;
	import com.candymandesign.pdf.logic.APDFSender;
	import com.candymandesign.pdf.objects.APDFDocumentInfo;
	import com.candymandesign.pdf.objects.APDFPage;
	import com.candymandesign.pdf.objects.APDFormat;
	
	import flash.events.EventDispatcher;
	
	/**
	 * The APDF class enables to create and export PDF documents from Flex. 
	 *  
	 * Simple usage example:
	 * <listing><code>
	 * 
	 * import com.candymandesign.pdf.APDF;
	 * 
	 * var pdf:APDF = new APDF();
	 * pdf.addPage();
	 * pdf.currentPage.addText("Hello world!");
	 * pdf.export("http://localhost/toPDF/logic/apdf.php");
	 * 
	 * </code></listing>
	 */ 
	public class APDF extends EventDispatcher
	{
		public static const NAME:String = "APDF";
		public static const VERSION:String = "Beta 1.0.0";
		public static const AUTHOR:String = "(c) Mirko Bordjoski 2008.";		
		public static const BLOG:String = "http://candymandesign.blogspot.com";
		public static const CONTACT:String = "candymandesign@gmail.com";
		
		
		
		/**
		 * The current page in the document.
		 */ 
		public var currentPage:APDFPage;		
		
		/**
		 * If value is <code>true</code>, it will destroide all the pages after export. 
		 */ 
		public var autoClean:Boolean = true;		
		
		
		/**
		 * @private
		 * All the pages included in the PDF.
		 */ 
		private var pages:Array;		
		
		/**
		 * @private
		 */ 
		private var docInfo:APDFDocumentInfo;
		/**
		 * @private
		 */ 
		private var docFormat:APDFormat;
		
		
		/**
		 * Constructor.
		 * The APDF class enable to export PDF documents from Flex.  
		 */ 
		public function APDF()
		{
			init();
		}
		
		
		
		/**
		 * @private
		 */ 
		protected function init():void
		{
			pages = new Array();
			docInfo = new APDFDocumentInfo();
			docFormat = new APDFormat();
		}
		
		
		
		/**
		 * Set the format of PDF document.
		 * @param		$docFormat		- The APDFormat object.
		 * 
		 * @see		com.candymandesign.pdf.objects.APDFormat
		 */ 
		public function setFormat($docFormat:APDFormat):void
		{
			docFormat = $docFormat;
		}
		
		/**
		 * Set the orientation of the PDF document.
		 * @param		$orientation		- The orientation of PDF document.
		 * 
		 * Usage example:
		 * <listing></code>
		 * import com.candymandesign.pdf.APDF;
		 * import com.candymandesign.pdf.objects.APDFormat;
		 * 
		 * var pdf:APDF = new APDF();
		 * pdf.setOrientation(APDFormat.LANDSCAPE);
		 * 
		 * </code></listing>
		 * 
		 * @see		com.candymandesign.pdf.objects.APDFormat
		 */ 
		public function setOrientation($orientation:String):void
		{
			docFormat.orientation = $orientation;
		}
		
		/**
		 * Set unit of PDF document. Default value is mm.
		 * @param		$unit		- unit.
		 * @see			com.candymandesign.pdf.objects.APDFormat
		 */ 
		public function setUnit($unit:String):void
		{
			docFormat.unit = $unit;
		}
		
		/**
		 * Set page size of PDF document.
		 * @param		$pageSize		- The format of PDF document.
		 * 
		 * Usage example:
		 * <listing></code>
		 * import com.candymandesign.pdf.APDF;
		 * import com.candymandesign.pdf.objects.APDFormat;
		 * 
		 * var pdf:APDF = new APDF();
		 * pdf.setPageSize(APDFormat.PAGE_SIZE_A5);
		 * 
		 * </code></listing>
		 * 
		 * @see		com.candymandesign.pdf.objects.APDFormat
		 */ 
		public function setPageSize($pageSize:String):void
		{
			docFormat.pageSize = $pageSize;
		}
		
		/**
		 * Set margins in the PDF document. Default value is 10mm. Change this values if you change the unit.
		 * @param		$left		- The left margin.
		 * @param		$top		- The top margin.
		 * @param		$right		- The right margin.
		 */ 
		public function setMargins($left:Number = 10, $top:Number = 10, $right:Number = 10):void
		{
			docFormat.setMargines($left, $top, $right);
		}
		
		
		/**
		 * Set the name of the author.
		 */ 
		public function setAuthor($author:String):void
		{
			docInfo.author = $author;
		}
		
		/**
		 * Set the title of document.
		 */ 
		public function setTitle($title:String):void
		{
			docInfo.title = $title;
		}
		
		/**
		 * Set the keywords. Leave empty space between the keywords.
		 * @param		$keywords		- The keywords.
		 */ 
		public function setKeywords($keywords:String):void
		{
			docInfo.keywords = $keywords;
		}
		
		/**
		 * Set the subject of document.
		 */ 
		public function setSubject($subject:String):void
		{
			docInfo.subject = $subject;
		}
		
		
		
		
		/**
		 * Add new page in the document.
		 * @param		$name	- The name of the new page.
		 * 
		 * Usage example:
		 * <listing><code>
		 * 
		 * import com.candymandesign.pdf.APDF;
		 * 
		 * var pdf:APDF = new APDF();
		 * pdf.addPage("firstPage");
		 * pdf.addPage("secondPage");
		 * trace(pdf.getNumberOfPages());		
		 * 
		 * </code></listing>
		 * 
		 */ 
		public function addPage($name:String = null):void
		{			
			var pg:APDFPage = new APDFPage();
			pg.name = $name;
			currentPage = pg;
			pages.push(pg);
		}
		
		
		/**
		 * 
		 * Returns the page with given name.
		 * @param		$name		- the name of the page.
		 * 
		 * Usage example:
		 * <listing><code>
		 * 
		 * import com.candymandesign.pdf.APDF;
		 * 
		 * var pdf:APDF = new APDF();
		 * pdf.addPage("firstPage");
		 * pdf.addPage("secondPage");
		 * pdf.addPage("nPage");
		 * 
		 * pdf.getPageByName("secondPage").addImage(my_mc);
		 * pdf.getPageByName("firstPage").addText("Jump to page");
		 * 
		 * pdf.export("http://localhost/toPDF/logic/apdf.php");
		 *  
		 * </code></listing>
		 * 
		 */ 
		public function getPageByName($name:String):APDFPage
		{
			var pg:APDFPage;
			for(var i:int = 0; i < pages.length; i++)
			{
				if(pages[i].name == $name)
					pg = pages[i];
			}
			currentPage = pg;
			return pg;			
		}
		
		
		/**
		 * Returns the APDF page with given id. 
		 * @param	$id		- ID of the page.
		 * 
		 * Usage example:
		 * <listing><code>
		 * 
		 * import com.candymandesign.pdf.APDF;
		 * 
		 * var pdf:APDF = new APDF();
		 * pdf.addPage();
		 * pdf.addPage();
		 * pdf.addPage();
		 * 
		 * for(var i:int = 0; i < pdf.getNumberOfPages(); i++)
		 * {
		 * 		pdf.getPageByID(i).addText("Page " + i.toString());
		 * }
		 * 
		 * pdf.export("http://localhost/toPDF/logic/apdf.php");
		 *  
		 * </code></listing>
		 */ 
		public function getPageByID($id:int):APDFPage
		{
			currentPage = pages[$id];
			return pages[$id];
		}
		
		
		/**
		 * Returns number of pages in APDF document.
		 */ 
		public function getNumberOfPages():int
		{
			return pages.length;
		}
		
		
		
		
		
		
		
		
		
		
		/**
		 * Export PDF document.
		 * @param		$path	- Path to apdf.php file.
		 */ 
		public function export($path:String):void
		{
			APDFSender.export($path, APDFParser.parse(pages), docInfo, docFormat);
			if(autoClean) 
				clean();
		}
		
		/**
		 * Clean all the pages in the APDF object. 
		 */ 
		public function clean():void
		{
			for(var i:int = 0; i < pages.length; i++)
			{
				pages[i] = null;
			}
			
			pages.splice(0);
			currentPage = null;			
		}
		
		/**
		 * Returns APDF object as a String.
		 */ 
		override public function toString():String
		{
			var str:String = APDF.NAME + "\n";
			str += "Version " + APDF.VERSION + "\n";
			str += "Author: " + APDF.AUTHOR + "\n";
			str += "Blog: " + APDF.BLOG + "\n";
			str += "Contact: " + APDF.CONTACT;
			return str;
		}

	}
}