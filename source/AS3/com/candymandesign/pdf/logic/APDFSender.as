/**
 *@author Mirko Bordjoski 
 */ 
 
 
package com.candymandesign.pdf.logic
{
	import com.candymandesign.pdf.objects.APDFDocumentInfo;
	import com.candymandesign.pdf.objects.APDFormat;
	
	import flash.net.URLRequest;
	import flash.net.URLRequestMethod;
	import flash.net.URLVariables;
	import flash.net.navigateToURL;
	
	/**
	 * [internal-use]
	 */ 
	public class APDFSender
	{
		/**
		 * @private
		 */ 
		private var req:URLRequest;
		
		/**
		 * Constructor.
		 */ 
		public function APDFSender(){}
		
		
		/**
		 * @private
		 */ 
		public static function export($path:String, $data:String, $docInfo:APDFDocumentInfo, $docFormat:APDFormat):void
		{
			var req:URLRequest = new URLRequest();
			var reqData:URLVariables = new URLVariables();
			
			reqData.paper = $data;
			
			reqData.author = $docInfo.author;
			reqData.subject = $docInfo.subject;
			reqData.title = $docInfo.title;
			reqData.keywords = $docInfo.keywords;
			reqData.creator = APDFDocumentInfo.CREATOR;
			
			reqData.orientation = $docFormat.orientation;
			reqData.unit = $docFormat.unit;
			reqData.pageSize = $docFormat.pageSize;
			reqData.left = String($docFormat.leftMargin);
			reqData.top = String($docFormat.topMargin);
			reqData.right = String($docFormat.rightMargin);
			
			req.url = $path;
			req.data = reqData;
			req.method = URLRequestMethod.POST;
			navigateToURL(req);			
		}
		

	}
}