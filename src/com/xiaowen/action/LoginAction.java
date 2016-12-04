package com.xiaowen.action;

import java.sql.Connection;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.struts2.interceptor.ServletRequestAware;

import com.opensymphony.xwork2.ActionSupport;
import com.xiaowen.dao.UserDao;
import com.xiaowen.model.User;
/**
 * 登陆的Action处理层
 * @author xiaowen
 * 2016年12月4日
 */
import com.xiaowen.util.DBUtil;
import com.xiaowen.util.StringUtil;
public class LoginAction extends ActionSupport implements ServletRequestAware{

	private static final long serialVersionUID = 1L;
	private HttpServletRequest request;
	private User user;
	private String error;
	private String imageCode;
	
	DBUtil dbUtil=new DBUtil();
	UserDao userDao=new UserDao();
	
	public String login()throws Exception{
		HttpSession session=request.getSession();
		if(StringUtil.isEmpty(user.getUserName()) || StringUtil.isEmpty(user.getPassword())){
			error = "用户名或密码为空!";
			return ERROR;
		}
		if(StringUtil.isEmpty(imageCode)) {
			error = "验证码为空!";
			return ERROR;
		}
		if(!imageCode.equals(session.getAttribute("sRand"))){
			error = "验证码错误！";
			return ERROR;
		}
		Connection con=null;
		try {
			con=dbUtil.getCon();
			User currentUser=userDao.login(con, user);
			if(currentUser!=null){
				session.setAttribute("currentUser", currentUser);
				return "main";
			}else{
				request.setAttribute("error", "用户名或密码错误！");
				return "login";
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
	        if(con !=null){
	        	dbUtil.closeCon(con);
	        }
		}
		return super.execute();
	}

	@Override
	public void setServletRequest(HttpServletRequest request) {
		this.request=request;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public String getError() {
		return error;
	}

	public void setError(String error) {
		this.error = error;
	}

	public String getImageCode() {
		return imageCode;
	}

	public void setImageCode(String imageCode) {
		this.imageCode = imageCode;
	}

}
