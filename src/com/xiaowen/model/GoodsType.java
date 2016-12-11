package com.xiaowen.model;

import java.io.Serializable;
/**
 * 
 * @author xiaowen
 * 2016年12月11日
 */
public class GoodsType implements Serializable {
	private static final long serialVersionUID = 1L;
	
	private Integer id;
	private String typeName;
	private String typeDesc;
	
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getTypeName() {
		return typeName;
	}
	public void setTypeName(String typeName) {
		this.typeName = typeName;
	}
	public String getTypeDesc() {
		return typeDesc;
	}
	public void setTypeDesc(String typeDesc) {
		this.typeDesc = typeDesc;
	}

}
