package com.xiaowen.util;

import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.util.Date;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

/**
 * json工具类
 * @author xiaowen
 * 2016年12月11日
 */
public class JsonUtil {

	public static JSONArray formatRsToJsonArray(ResultSet rs)throws Exception{
		//从元数据中获得列数 
		ResultSetMetaData md=rs.getMetaData();
		//返回所有字段的数目
		int num=md.getColumnCount();
		JSONArray array=new JSONArray();
		while (rs.next()) {
			JSONObject object=new JSONObject();
			for(int i=1;i<=num;i++){
				Object o=rs.getObject(i);
				if(o instanceof Date){
					object.put(md.getColumnName(i), DateUtil.formatDate((Date)o, "yyyy-MM-dd"));
				}else{
					//字段的名称
					object.put(md.getColumnName(i), rs.getObject(i));
				}
			}
			array.add(object);
		}
		return array;
	}
}
