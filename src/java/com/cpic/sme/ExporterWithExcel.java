package com.cpic.sme;

import java.io.File;

import jxl.Workbook;
import jxl.write.WritableSheet;
import jxl.write.WritableWorkbook;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class ExporterWithExcel {
	private static Logger logger = LoggerFactory.getLogger(ExporterWithExcel.class);

	public static boolean updatePriceAndExportExcel(String srcFilePath, String outFilePath, float discount) {
        try {
        	logger.info( "srcFilePath:"+srcFilePath+",outFilePath:"+outFilePath);
            // Excel获得文件
            Workbook wb = Workbook.getWorkbook(new File(srcFilePath));
            // 打开一个文件的副本，并且指定数据写回到原文件
            new File (outFilePath).getParentFile().mkdirs();
            WritableWorkbook book = Workbook.createWorkbook(new File(outFilePath), wb);
            
             WritableSheet sheet1 = book.getSheet(0);
             int rowSize = sheet1.getRows();
             for(int i = 1;i< rowSize; i++){
            	 try{
	            	String content = sheet1.getCell(11, i).getContents();
	            	float rapport = Float.valueOf(content);
	            	float newPirce = Math.round(rapport * discount * 100)/100;
	            	jxl.write.Number number = new jxl.write.Number(11, i, newPirce);
	            	 sheet1.addCell(number);
            	 }catch(Exception e){
            		 e.printStackTrace();
            	 }
             }
            
            // 添加一个工作表
            book.write();
            book.close();
            wb.close();
        } catch (Exception e) {
        	e.printStackTrace();
            logger.error("导出excel文件出错！可能原因是excel版本太高");
        }
        return true;
    }
}