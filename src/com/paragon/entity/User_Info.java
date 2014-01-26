package com.paragon.entity;

import javax.persistence.Column;

public class User_Info {
	private int User_ID;
	private String User_Phone;
	private String User_TName;
	private String User_Address;
	private String Sex;
	
	//user_info表对应类，表中元素为User_ID,User_Phone,User_TName,User_Address,Sex;
	//User_ID为主键，自增型；
	@Column(name = "User_Phone", length = 15, nullable = false, unique = true)
	public String getUser_Phone() {
		return User_Phone;
	}
	public void setUser_Phone(String user_Phone) {
		this.User_Phone = user_Phone;
	}
	
	@Column(name = "User_Tname", length = 8, nullable = false, unique = false)
	public String getUser_TName() {
		return User_TName;
	}
	public void setUser_TName(String user_TName) {
		this.User_TName = user_TName;
	}
	
	@Column(name = "User_Address", length = 20, nullable = false, unique = false)
	public String getUser_Address() {
		return User_Address;
	}
	public void setUser_Address(String user_Address) {
		this.User_Address = user_Address;
	}
	public String getSex() {
		return Sex;
	}
	public void setSex(String sex) {
		this.Sex = sex;
	}
	public int getUser_ID() {
		return User_ID;
	}
	public void setUser_ID(int user_ID) {
		User_ID = user_ID;
	}

}
