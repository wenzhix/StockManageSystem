package com.xiaowen.model;

import java.io.Serializable;
import java.util.Date;
/**
 * 导出实体类
 * @author xiaowen
 * 2016年12月11日
 */
public class Export implements Serializable {
	private static final long serialVersionUID = 1L;
	private Integer id;
	private String goodsId;
	private String expoPrice;
	private Date expoDate;
	private String expoNum;
	private String expoDesc;
	
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
	public String getExpoPrice() {
		return expoPrice;
	}
	public void setExpoPrice(String expoPrice) {
		this.expoPrice = expoPrice;
	}
	public Date getExpoDate() {
		return expoDate;
	}
	public void setExpoDate(Date expoDate) {
		this.expoDate = expoDate;
	}
	public String getExpoNum() {
		return expoNum;
	}
	public void setExpoNum(String expoNum) {
		this.expoNum = expoNum;
	}
	public String getExpoDesc() {
		return expoDesc;
	}
	public void setExpoDesc(String expoDesc) {
		this.expoDesc = expoDesc;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
}
