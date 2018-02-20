package com.huangbo.utils;
import java.io.IOException;
import java.net.URL;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.poi.openxml4j.exceptions.InvalidFormatException;

import net.sf.jxls.exception.ParsePropertyException;
import net.sf.jxls.transformer.Workbook;
import net.sf.jxls.transformer.XLSTransformer;
/** 
 * Excel. 
 */  
// 	 http://blog.csdn.net/csdnbenbenchong/article/details/7085124
public class ExcelUtil {  
    /** 
     * Excel文件导出
     * @param templateFileName 
     * @param list 
     * @param resultFileName  
     * @throws InvalidFormatException 
     */  
    public void createExcel(String templateFileName, List<?> list, String resultFileName){  
    	 //����XLSTransformer����  
        XLSTransformer transformer = new XLSTransformer();  
        //��ȡjava��Ŀ������·��  
        URL url = this.getClass().getClassLoader().getResource("");  
        //�õ�ģ���ļ�·��  
        String srcFilePath = url.getPath() + templateFileName;  
        Map<String,Object> beanParams = new HashMap<String,Object>();  
        beanParams.put("list", list);  
        String destFilePath = url.getPath() + resultFileName;  
        try {  
            //���Excel�ļ�  
            try {
				transformer.transformXLS(srcFilePath, beanParams, destFilePath);
			} catch (InvalidFormatException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}  
        } catch (ParsePropertyException e) {  
            e.printStackTrace();  
        } catch (IOException e) {  
            e.printStackTrace();  
        }  
    }
}
