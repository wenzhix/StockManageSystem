package com.xiaowen.util;

import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * 日期工具类
 * @author xiaowen
 * 2016年12月11日
 */
public class DateUtil {

	/**
	 * String转换成Date
	 * @param date
	 * @param format
	 * @return
	 */
	public static String formatDate(Date date,String format){
		String result="";
		SimpleDateFormat sdf=new SimpleDateFormat(format);
		if(date !=null){
			result=sdf.format(date);
		}
		return result;
	}
	
	/**
	 * String转换成Date
	 * @param str
	 * @param format
	 * @return
	 * @throws Exception
	 */
	public static Date formatString(String str,String format)throws Exception{
		SimpleDateFormat sdf=new SimpleDateFormat(format);
		return sdf.parse(str);
	}
}
