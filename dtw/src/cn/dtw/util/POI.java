package cn.dtw.util;

import java.io.OutputStream;
import java.net.URLEncoder;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFCellStyle;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;

import cn.dtw.entity.Order;

public class POI {

	public static void outputOrderExcel(List<Order> list,HttpServletResponse resp) throws Exception    
    {    
		OutputStream out = null;
        // 第一步，创建一个webbook，对应一个Excel文件    
        HSSFWorkbook wb = new HSSFWorkbook();    
        // 第二步，在webbook中添加一个sheet,对应Excel文件中的sheet    
        HSSFSheet sheet = wb.createSheet("orderTable");    
        // 第三步，在sheet中添加表头第0行,注意老版本poi对Excel的行数列数有限制short    
        HSSFRow row = sheet.createRow((int) 0);    
        // 第四步，创建单元格，并设置值表头 设置表头居中    
        HSSFCellStyle style = wb.createCellStyle();    
        style.setAlignment(HSSFCellStyle.ALIGN_CENTER); // 创建一个居中格式    
    
        HSSFCell cell = row.createCell((int) 0);    
        cell.setCellValue("客户名");
        cell.setCellStyle(style);    
        cell = row.createCell((int) 1);    
        cell.setCellValue("业务编号"); 
        cell.setCellStyle(style);    
        cell = row.createCell((int) 2);    
        cell.setCellValue("联系人");    
        cell.setCellStyle(style);    
        cell = row.createCell((int) 3);    
        cell.setCellValue("系统号");    
        cell.setCellStyle(style); 
        cell = row.createCell((int) 4);    
        cell.setCellValue("主单号");    
        cell.setCellStyle(style); 
        cell = row.createCell((int) 5);    
        cell.setCellValue("分单号");    
        cell.setCellStyle(style); 
        cell = row.createCell((int) 6);    
        cell.setCellValue("航班号");    
        cell.setCellStyle(style); 
        cell = row.createCell((int) 7);    
        cell.setCellValue("航班日期");    
        cell.setCellStyle(style); 
        cell = row.createCell((int) 8);    
        cell.setCellValue("到港日期");    
        cell.setCellStyle(style); 
        cell = row.createCell((int) 9);    
        cell.setCellValue("起运港"); 
        cell.setCellStyle(style); 
        cell = row.createCell((int) 10);    
        cell.setCellValue("目的港"); 
        cell.setCellStyle(style); 
        cell = row.createCell((int) 11);    
        cell.setCellValue("件数"); 
        cell.setCellStyle(style); 
        cell = row.createCell((int) 12);    
        cell.setCellValue("毛重(KG)"); 
        cell.setCellStyle(style); 
        cell = row.createCell((int) 13);    
        cell.setCellValue("计重(KG)"); 
        cell.setCellStyle(style); 
        cell = row.createCell((int) 14);    
        cell.setCellValue("体积");
        cell.setCellStyle(style);
        cell = row.createCell((int) 15);    
        cell.setCellValue("下单时间");
        cell.setCellStyle(style);
    
        // 第五步，写入实体数据 实际应用中这些数据从数据库得到，    
        for (int i = 0; i < list.size(); i++)    
        {    
            row = sheet.createRow((int) i + 1);    
            Order order = list.get(i);  
            // 第四步，创建单元格，并设置值    
            row.createCell((int) 0).setCellValue(order.getClient().getClientName());    
            row.createCell((int) 1).setCellValue(order.getOrderNo());    
            row.createCell((int) 2).setCellValue(order.getClientcontact().getClientContactName()+"-"+order.getClientcontact().getClientContactTel());    
            row.createCell((int) 3).setCellValue(order.getSystemNo()+" ");
            row.createCell((int) 4).setCellValue(order.getMawbNo()+" ");
            row.createCell((int) 5).setCellValue(order.getHawbNo()+" ");
            row.createCell((int) 6).setCellValue(order.getFlightNo()+" ");
            row.createCell((int) 7).setCellValue(order.getDepartDate()+" ");
            row.createCell((int) 8).setCellValue(order.getArriveDate()+" ");
            row.createCell((int) 9).setCellValue(order.getLoadingPort()+" ");
            row.createCell((int) 10).setCellValue(order.getDestination()+" ");
            row.createCell((int) 11).setCellValue(order.getCargoPiece()+" ");
            row.createCell((int) 12).setCellValue(order.getCargoWeight()+" ");
            row.createCell((int) 13).setCellValue(order.getChargeWeight()+" ");
            row.createCell((int) 14).setCellValue(order.getCargoVolume()+" ");
            row.createCell((int) 15).setCellValue(order.getUpdateTime()+" ");
        }    
        // 第六步，将文件存到指定位置    
        try    
        {    
        	 out = resp.getOutputStream();  
             String fileName = "enroll.xls";// 文件名    
             resp.setContentType("application/x-msdownload");    
             resp.setHeader("Content-Disposition", "attachment; filename="+ URLEncoder.encode(fileName, "UTF-8"));    
             wb.write(out);
        } 
        catch (Exception e)    
        {    
            e.printStackTrace();    
        }finally {
        	 out.close(); 
        }
    }    
}
