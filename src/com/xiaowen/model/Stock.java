package com.xiaowen.model;

import java.io.Serializable;
/**
 * 库存实体类
 * @author xiaowen
 * 2016年12月11日
 */
public class Stock implements Serializable {

	private static final long serialVersionUID = 1L;
	private Integer id;
	private String goodsId;
	private String stockNum;
	private String impoPrice;
	private String expoPrice;
	private String stockDesc;
	
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
	public String getStockNum() {
		return stockNum;
	}
	public void setStockNum(String stockNum) {
		this.stockNum = stockNum;
	}
	public String getImpoPrice() {
		return impoPrice;
	}
	public void setImpoPrice(String impoPrice) {
		this.impoPrice = impoPrice;
	}
	public String getExpoPrice() {
		return expoPrice;
	}
	public void setExpoPrice(String expoPrice) {
		this.expoPrice = expoPrice;
	}
	public String getStockDesc() {
		return stockDesc;
	}
	public void setStockDesc(String stockDesc) {
		this.stockDesc = stockDesc;
	}
}
