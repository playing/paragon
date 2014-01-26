package com.paragon.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "User_Register")
public class User {
	private String User_RegName;
	private int User_ID;
	private String Password;
	private String email;
	
	//user_register表对应的类，表中属性为User_RegName,User_ID,Password,email;
	public String getUser_RegName() {
		return User_RegName;
	}
	public void setUser_RegName(String User_RegName) {
		this.User_RegName = User_RegName;
	}
	
	
	@Column(name = "Password", length = 10, nullable = false, unique = false)
	public String getPassword() {
		return Password;
	}
	public void setPassword(String Password) {
		this.Password = Password;
	}
	
	@Column(name = "Email", length = 30, nullable = false, unique = false)
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public int getUser_ID() {
		return User_ID;
	}
	public void setUser_ID(int user_ID) {
		User_ID = user_ID;
	}
	
}
