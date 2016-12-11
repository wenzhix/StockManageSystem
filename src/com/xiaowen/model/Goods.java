package com.xiaowen.model;
import java.io.Serializable;
/**
 * @author xiaowen
 * 2016年12月11日
 */
public class Goods implements Serializable {

	private static final long serialVersionUID = 1L;
	
	private Integer id;
	private String goodsId;
	private String goodsName;
	private String proId;
	private String typeId;
	private String goodsDesc;
	
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
	public String getGoodsName() {
		return goodsName;
	}
	public void setGoodsName(String goodsName) {
		this.goodsName = goodsName;
	}
	public String getProId() {
		return proId;
	}
	public void setProId(String proId) {
		this.proId = proId;
	}
	public String getTypeId() {
		return typeId;
	}
	public void setTypeId(String typeId) {
		this.typeId = typeId;
	}
	public String getGoodsDesc() {
		return goodsDesc;
	}
	public void setGoodsDesc(String goodsDesc) {
		this.goodsDesc = goodsDesc;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
}
