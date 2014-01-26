package com.paragon.entity;

import java.util.Date;

/**
 * HouseInfo entity.
 * POJO类
 * 与数据库表House_Info相对应
 * 完成人：黄凯
 * 日期：2014-01-14
 */
public class HouseInfo {
	
	//数据库表House_Info 
	private int houseId;
	private String houseAddress;
	private String housePicture;
	private int liveNum;
	private int housePrice;
	private String houseIntro;
	private String checkInTime;
	private String checkOutTime;
	private String houseType;
	private String rentType;
	private int houseArea;
	private int bedroomNum;
	
	
	//生成getters和setters方法
	

	public String getHouseAddress() {
		return houseAddress;
	}
	public void setHouseAddress(String houseAddress) {
		this.houseAddress = houseAddress;
	}
	public String getHousePicture() {
		return housePicture;
	}
	public void setHousePicture(String housePicture) {
		this.housePicture = housePicture;
	}
	public int getLiveNum() {
		return liveNum;
	}
	public void setLiveNum(int liveNum) {
		this.liveNum = liveNum;
	}
	public int getHousePrice() {
		return housePrice;
	}
	public void setHousePrice(int housePrice) {
		this.housePrice = housePrice;
	}
	public String getHouseIntro() {
		return houseIntro;
	}
	public void setHouseIntro(String houseIntro) {
		this.houseIntro = houseIntro;
	}
	public String getCheckInTime() {
		return checkInTime;
	}
	public void setCheckInTime(String checkInTime) {
		this.checkInTime = checkInTime;
	}
	public String getCheckOutTime() {
		return checkOutTime;
	}
	public void setCheckOutTime(String checkOutTime) {
		this.checkOutTime = checkOutTime;
	}
	public String getHouseType() {
		return houseType;
	}
	public void setHouseType(String houseType) {
		this.houseType = houseType;
	}
	public String getRentType() {
		return rentType;
	}
	public void setRentType(String rentType) {
		this.rentType = rentType;
	}
	public int getHouseArea() {
		return houseArea;
	}
	public void setHouseArea(int houseArea) {
		this.houseArea = houseArea;
	}
	public int getBedroomNum() {
		return bedroomNum;
	}
	public void setBedroomNum(int bedroomNum) {
		this.bedroomNum = bedroomNum;
	}
	public int getHouseId() {
		return houseId;
	}
	public void setHouseId(int houseId) {
		this.houseId = houseId;
	}

	
}
