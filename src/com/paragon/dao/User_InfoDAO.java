package com.paragon.dao;


import com.paragon.entity.*;


import java.util.Iterator;
import java.util.List;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;
import org.hibernate.criterion.Restrictions;

public class User_InfoDAO {
	private static final Log log = LogFactory.getLog(UserDAO.class);
	// property constants
	private Session session = null;

	
	public Session getSession(){
		Configuration conn = new Configuration().configure();
		SessionFactory factory=conn.buildSessionFactory();
		Session session =factory.openSession();
		return session;
	}
	
	//插入用户个人信息功能；
	//传递参数为User_Info类
	//返回值为boolean型，如果查找到，返回true，如果为空，返回false；
	public boolean insert(User_Info user_info){
		session= this.getSession();
		Transaction tran = this.session.beginTransaction();
		this.session.save(user_info);
		tran.commit();
		if(session.isOpen()){
			session.close();
			return true;
		}
		else
		{return false;}
	}
	
	//插入用户个人信息功能；
	//传递参数为User_Info类;
	//返回值为boolean型，如果查找到，返回true，如果为空，返回false；
	public boolean update(User_Info user_info){
		session = this.getSession();
		Transaction tran = this.session.beginTransaction();
		this.session.update(user_info);
		tran.commit();	
		if(session.isOpen()){
			session.close();
			return true;
		}
		else
		{return false;}
	}
	
	//传递参数为User_ID,根据User_ID查找用户个人具体信息，也就是User_Info表中的行信息。
	public User_Info queryById(int User_ID){
		session = this.getSession();
		Transaction tran = this.session.beginTransaction();
		User_Info instance = (User_Info) getSession().get(
				"com.paragon.entity.User_Info", User_ID);
		tran.commit();
		return instance;

	}
	
	//一般不用这个delete方法
	public void delete(User_Info user_info){
		session = this.getSession();
		Transaction tran = this.session.beginTransaction();
		this.session.delete(user_info);
		tran.commit();
	}
	
	//传递进来User_ID参数，根据User_ID删除用户个人信息；
	//判断成功与否，可看日志文件；
	public void delete(int User_ID)
	{
		log.debug("delete User_Info instance");
		try{
		session = this.getSession();	
		Transaction tran = this.session.beginTransaction();
		User instance = (User) getSession().get(
				"com.paragon.entity.User_Info",User_ID);
		this.session.delete(instance);
		tran.commit();
		log.debug("delete successful!");
		}catch(RuntimeException e)
		{
			log.error("delete failed",e);
			throw e;
		}
	}

}
