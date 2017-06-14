package com.cpic.sme


import org.grails.plugins.excelimport.AbstractExcelImporter
import org.grails.plugins.excelimport.ExcelImportService
import org.grails.plugins.excelimport.ExpectedPropertyType

class MemberExcelImporter extends AbstractExcelImporter {
   
	 static Map CONFIG_BOOK_COLUMN_MAP = [
			 sheet:'sheet1',
				startRow: 1,
			 columnMap:  [
					 	'A':'workLine',
						'B':'company',
						'C':'org',
						'D':'name',
						'E':'loginName',
						'F':'cellphone',
						'G':'idNum',
						'H':'email',
						'I':'department',
						'J':'remark'
			 ]
	 ]
	 
	 static Map propertyConfigurationMap = [
		 workLine:([expectedType: ExpectedPropertyType.StringType, defaultValue:""]),
		 company:([expectedType: ExpectedPropertyType.StringType, defaultValue:""]),
		 org:([expectedType: ExpectedPropertyType.StringType, defaultValue:""]),
		 name:([expectedType: ExpectedPropertyType.StringType, defaultValue:""]),
		 loginName:([expectedType: ExpectedPropertyType.StringType, defaultValue:""]),
		 cellphone:([expectedType: ExpectedPropertyType.StringType, defaultValue:""]),
		 idNum:([expectedType: ExpectedPropertyType.StringType, defaultValue:""]),
		 email:([expectedType: ExpectedPropertyType.StringType, defaultValue:""]),
		 department:([expectedType: ExpectedPropertyType.StringType, defaultValue:""]),
		 remark:([expectedType: ExpectedPropertyType.StringType, defaultValue:""])
		
  ]
   
	   //can also configure injection in resources.groovy
	   def getExcelImportService() {
		   ExcelImportService.getService()
	   }
   
	 public MemberExcelImporter(fileName) {
	   super(fileName)
	 }
   
	public List<Map> getRows() {
	   List rows = excelImportService.columns(workbook, CONFIG_BOOK_COLUMN_MAP,null,propertyConfigurationMap,-1)
	 }
   
   
   
   
}
