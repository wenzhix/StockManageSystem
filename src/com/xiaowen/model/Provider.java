package com.xiaowen.model;

import java.io.Serializable;
/**
 * 供应者
 * @author xiaowen
 * 2016年12月11日
 */
public class Provider implements Serializable {

	private static final long serialVersionUID = 1L;
	private Integer id;
	private Integer proId;
	private String proName;
	private String linkman;
	private String proPhone;
	private String proDesc;
	
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public Integer getProId() {
		return proId;
	}
	public void setProId(Integer proId) {
		this.proId = proId;
	}
	public String getProName() {
		return proName;
	}
	public void setProName(String proName) {
		this.proName = proName;
	}
	public String getLinkman() {
		return linkman;
	}
	public void setLinkman(String linkman) {
		this.linkman = linkman;
	}
	public String getProPhone() {
		return proPhone;
	}
	public void setProPhone(String proPhone) {
		this.proPhone = proPhone;
	}
	public String getProDesc() {
		return proDesc;
	}
	public void setProDesc(String proDesc) {
		this.proDesc = proDesc;
	}

}
