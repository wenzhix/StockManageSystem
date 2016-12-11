package com.xiaowen.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.xiaowen.model.User;

/**
 *UserDao的Dao数据层
 * @author xiaowen
 * 2016年12月4日
 */
public class UserDao {

	/**
	 * 登陆
	 * @param con
	 * @param user
	 * @return
	 * @throws Exception
	 */
	public User login(Connection con,User user)throws Exception{
		User resultUser=null;
		String sql="select * from t_user where userName=? and password=?";
		PreparedStatement pst=con.prepareStatement(sql);
		pst.setString(1, user.getUserName());
		pst.setString(2, user.getPassword());
		ResultSet rs=pst.executeQuery();
		if(rs.next()){
			resultUser=new User();
			resultUser.setUserName(rs.getString("userName"));
			resultUser.setPassword(rs.getString("password"));
		}
		return resultUser;
	}
}
