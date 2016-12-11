package com.xiaowen.util;
import java.io.OutputStream;
import java.io.PrintWriter;
import javax.servlet.http.HttpServletResponse;
import org.apache.poi.ss.usermodel.Workbook;

/**
 * 响应在页面的数据工具类
 * @author xiaowen
 * 2016年12月11日
 */
public class ResponseUtil {

	public static void write(HttpServletResponse response,Object o)throws Exception{
		response.setContentType("text/html;charset=utf-8");
		PrintWriter pw=response.getWriter();
		pw.write(o.toString());
		pw.flush();
		pw.close();
	}
	
	public static void export(HttpServletResponse response,Workbook wb,String fileName)throws Exception{
		response.setHeader("Content-Disposition", "attachment;filename="+new String(fileName.getBytes("utf-8"),"iso8859-1"));
		response.setContentType("application/ynd.ms-excel;charset=UTF-8");
		OutputStream os=response.getOutputStream();
		wb.write(os);
		os.flush();
		os.close();
	}
}
