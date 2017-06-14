package com.cpic.sme


import org.grails.plugins.excelimport.AbstractExcelImporter
import org.grails.plugins.excelimport.ExcelImportService
import org.grails.plugins.excelimport.ExpectedPropertyType

class PriceRuleExcelImporter extends AbstractExcelImporter {
   
	 static Map CONFIG_BOOK_COLUMN_MAP = [
			 sheet:'sheet1',
				startRow: 1,
			 columnMap:  [
					 	'A':'xz',
						'B':'price',
						'C':'factor1',
						'D':'factor2'	
			 ]
	 ]
	 
	 static Map propertyConfigurationMap = [
		 xz:([expectedType: ExpectedPropertyType.StringType, defaultValue:""]),
		 price:([expectedType: ExpectedPropertyType.StringType, defaultValue:""]),
		 factor1:([expectedType: ExpectedPropertyType.StringType, defaultValue:""]),
		 factor2:([expectedType: ExpectedPropertyType.StringType, defaultValue:""])
				
  ]
   
	   //can also configure injection in resources.groovy
	   def getExcelImportService() {
		   ExcelImportService.getService()
	   }
   
	 public PriceRuleExcelImporter(fileName) {
	   super(fileName)
	 }
   
	public List<Map> getRows() {
	   List rows = excelImportService.columns(workbook, CONFIG_BOOK_COLUMN_MAP,null,propertyConfigurationMap,-1)
	 }
   
   
   
   
}
