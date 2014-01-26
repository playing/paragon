package com.paragon.entity;

public class UserConnHouse {
	private int User_ID;
	private int houseId;
	
	//userconnhouse表对应类，表中元素为User_ID,houseid;
	//houseid为主键，一个houseid只能对应一个User_ID,User_ID可以重复；
	public int getUser_ID() {
		return User_ID;
	}
	public void setUser_ID(int user_ID) {
		User_ID = user_ID;
	}
	public int getHouseId() {
		return houseId;
	}
	public void setHouseId(int houseId) {
		this.houseId = houseId;
	}
}
