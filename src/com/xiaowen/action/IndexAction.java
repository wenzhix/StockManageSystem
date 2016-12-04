package com.xiaowen.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.struts2.interceptor.ServletRequestAware;

import com.opensymphony.xwork2.ActionSupport;
/**
 * 
 * @author xiaowen
 * 2016年12月4日
 */
import com.xiaowen.util.DBUtil;
public class IndexAction extends ActionSupport implements ServletRequestAware{

	private static final long serialVersionUID = 1L;
	private HttpServletRequest request;
	DBUtil dbUtil=new DBUtil();
	
	public String goIndex(){
		HttpSession session=request.getSession();
		
		return "index";
	}

	@Override
	public void setServletRequest(HttpServletRequest request) {
		this.request=request;
	}

}
