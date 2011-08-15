/**
 *@author Mirko Bordjoski 
 */ 
 
 
package com.candymandesign.pdf.logic
{
	import com.candymandesign.pdf.objects.APDFDocumentInfo;
	
	/**
	 * [internal-use]
	 */ 
	public class APDFParser
	{
		/**
		 * Constructor.
		 */ 
		public function APDFParser(){}
		
		/**
		 * @private
		 */ 
		public static function parse(page:Array):String
		{
			var paperData:String = '<?xml version="1.0" encoding="UTF-8"?><paper>';		
			
			for(var i:int = 0; i < page.length; i++)
			{
				paperData += "<page>";
				for(var p:int = 0; p < page[i].elements.length; p++)
				{
					paperData += "<element>";
					if(page[i].elements[p].type == "image")
					{
						paperData += "<image ";
						paperData += 'x="' + page[i].elements[p].x + '" ';
						paperData += 'y="' + page[i].elements[p].y + '" ';
						paperData += 'width="' + page[i].elements[p].width + '" ';
						paperData += 'height="' + page[i].elements[p].height + '">';
						paperData += "<![CDATA[" + page[i].elements[p].data + "]]>";
						paperData += "</image>";
					}
					else if(page[i].elements[p].type == "text")
					{
						paperData += '<text fontType="' + page[i].elements[p].fontType + '" ';
						paperData += 'fontWeight="' + page[i].elements[p].weight + '" ';
						paperData += 'fontSize="' + page[i].elements[p].size + '" ';
						paperData += 'textx="' + String(page[i].elements[p].x) + '" ';
						paperData += 'texty="' + String(page[i].elements[p].y) + '">';
						paperData += page[i].elements[p].data;
						paperData += "</text>";
					}
					else if(page[i].elements[p].type == "cell")
					{
						paperData += '<cell fontType="' + page[i].elements[p].fontType + '" ';
						paperData += 'fontWeight="' + page[i].elements[p].weight + '" ';
						paperData += 'fontSize="' + page[i].elements[p].size + '" ';
						paperData += 'textx="' + String(page[i].elements[p].x) + '" ';
						paperData += 'texty="' + String(page[i].elements[p].y) + '">';
						paperData += page[i].elements[p].data;
						paperData += "</cell>";
					}
					paperData += "</element>";
				}
				paperData += "</page>";
			}
			
			paperData += "</paper>";
			return paperData;
		}

	}
}