package com.xiaowen.model;

import java.io.Serializable;
import java.util.Date;
/**
 * 导入实体类
 * @author xiaowen
 * 2016年12月11日
 */
public class Import implements Serializable {
	private static final long serialVersionUID = 1L;
	
	private Integer id;
	private String goodsId;
	private String impoPrice;
	private Date impoDate;
	private String impoNum;
	private String impoDesc;
	
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getGoodsId() {
		return goodsId;
	}
	public void setGoodsId(String goodsId) {
		this.goodsId = goodsId;
	}
	public String getImpoPrice() {
		return impoPrice;
	}
	public void setImpoPrice(String impoPrice) {
		this.impoPrice = impoPrice;
	}
	public Date getImpoDate() {
		return impoDate;
	}
	public void setImpoDate(Date impoDate) {
		this.impoDate = impoDate;
	}
	public String getImpoNum() {
		return impoNum;
	}
	public void setImpoNum(String impoNum) {
		this.impoNum = impoNum;
	}
	public String getImpoDesc() {
		return impoDesc;
	}
	public void setImpoDesc(String impoDesc) {
		this.impoDesc = impoDesc;
	}

}
