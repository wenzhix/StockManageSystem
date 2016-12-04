package com.xiaowen.util;
/**
 * 字符串工具类
 * @author xiaowen
 * 2016年12月4日
 */
public class StringUtil {
	
	/**
	 * 判断是否为空
	 * @param str
	 * @return
	 */
	public static boolean isEmpty(String str){
		if("".equals(str) || str==null){
			return true;
		}else{
			return false;
		}
	}
	
	/**
	 * 判断是否不为空
	 * @param str
	 * @return
	 */
	public static boolean isNotEmpty(String str){
		if(!"".equals(str) && str!=null){
			return true;
		}else{
			return false;
		}
	}
}
