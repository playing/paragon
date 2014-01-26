package com.paragon.entity;


import com.paragon.dao.*;


import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;
import org.hibernate.tool.hbm2ddl.SchemaExport;

public class UserClient {
	public static void main(String[] args) {

		// session = factory.openSession();
		// session.beginTransaction();
		User_Info user_Register = new User_Info();
		user_Register.setUser_ID(1);
		user_Register.setUser_Phone("23hello");
		user_Register.setUser_TName("hwhw123");
		user_Register.setUser_Address("15436@qq.com");
		user_Register.setSex("f");

		User_InfoDAO userreg = new User_InfoDAO();
		userreg.insert(user_Register);
		//≤‚ ‘delete∑Ω∑®
		//User_InfoDAO userreg = new User_InfoDAO();
		//userreg.delete("52aae944438e767101438e7672740001");
	}
}