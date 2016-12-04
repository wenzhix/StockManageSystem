package com.xiaowen.util;
import java.sql.Connection;
import java.sql.DriverManager;

/**
 * 数据库工具类
 * @author xiaowen
 * 2016年12月4日
 */
public class DBUtil {
    //数据库连接
	private String url = "jdbc:mysql://localhost:3306/db_stockmanage";
	//数据库用户名
	private String username = "root";
	//数据库密码
	private String password = "123456";
	//数据库驱动
	private String driver = "com.mysql.jdbc.Driver";
	
	/**
	 * 连接
	 * @return
	 * @throws Exception
	 */
	public Connection getCon() throws Exception {
		Class.forName(driver);
		Connection con = DriverManager.getConnection(url, username, password);
		return con;
	}
	
	/**
	 * 关闭连接
	 * @param con
	 * @throws Exception
	 */
	public void closeCon(Connection con) throws Exception {
		if(con!=null) {
			con.close();
		}
	}
}
