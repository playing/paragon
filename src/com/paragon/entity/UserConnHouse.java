package com.paragon.entity;

public class UserConnHouse {
	private int User_ID;
	private int houseId;
	
	//userconnhouse���Ӧ�࣬����Ԫ��ΪUser_ID,houseid;
	//houseidΪ������һ��houseidֻ�ܶ�Ӧһ��User_ID,User_ID�����ظ���
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
