package com.paragon.dao;


import com.paragon.entity.*;



import java.util.Iterator;
import java.util.List;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.hibernate.Criteria;
import org.hibernate.LockMode;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;
import org.hibernate.criterion.Example;
import org.hibernate.criterion.Restrictions;

import orm.BaseHibernateDAO;


public class UserDAO extends BaseHibernateDAO{
	private static final Log log = LogFactory.getLog(UserDAO.class);
	// property constants
	private Session session = null;

	public Session getSession(){
		//读取hibernate.cfg.htm配置文件；
		Configuration conn = new Configuration().configure();
		//读取hibernate.cfg.htm配置文件中sessionFactory与mysql数据库的联系信息
		SessionFactory factory=conn.buildSessionFactory();
		//开启事务
		Session session =factory.openSession();
		return session;
	}
	
	//插入用户新注册信息；
	//以User类为传递参数；
	public boolean insert(User user){
		session= this.getSession();
		Transaction tran = this.session.beginTransaction();
		//有transient状态变为persistent状态
		this.session.save(user);
		//提交事务
		tran.commit();
		if(session.isOpen()){
			session.close();
			return true;
		}
		else{return false;}
	}
	
	//更新数据库操作
	//以User类为传递参数
	public void update(User user){
		session = this.getSession();
		Transaction tran = this.session.beginTransaction();
		//调用Session自带的update方法；
		this.session.update(user);
		tran.commit();	
	}
	
	//查找用户信息
	//传递参数为User_ID
	//根据User_ID找到User的全部信息；
	public User queryById(int User_ID){
		session = this.getSession();
		Transaction tran = this.session.beginTransaction();
		User instance = (User) getSession().get(
				"com.paragon.entity.User", User_ID);
		tran.commit();
		return instance;
	}
	
	
	//根据用户名查询用户ID
	
//	public String queryByUserName(String User_RegName){
//		session = this.getSession();
//		Transaction tran = this.session.beginTransaction();
//		User instance = (User) getSession().get(
//				"com.paragon.entity.User", User_RegName);
//		String email = instance.getEmail();
//		tran.commit();
//		return email;
//	}
	
	public int queryByRegName(String User_RegName)
	{
		User user = null;
		session = this.getSession();
		String hql = "FROM User as user WHERE user.User_RegName=?";
		//通过Query借口查询
		Query q = this.session.createQuery(hql);
		q.setString(0,User_RegName);
		List l = q.list();
		Iterator iter = l.iterator();
		if(iter.hasNext())
		{
			user = (User)iter.next();
		}
		return user.getUser_ID();
	}
	
	
	
	//删除用户信息，但是传进来的参数是User类，一般使用下面的根据User_ID执行删除；
	public void delete(User user){
		session = this.getSession();
		Transaction tran = this.session.beginTransaction();
		this.session.delete(user);
		tran.commit();
	}
	
	//根据User_ID为参数，删除用户信息；
	public void delete(int User_ID)
	{
		log.debug("delete User instance");
		try{
		session = this.getSession();	
		Transaction tran = this.session.beginTransaction();
		User instance = (User) getSession().get(
				"com.paragon.entity.User",User_ID);

		this.session.delete(instance);
		tran.commit();
		log.debug("delete successful!");
		}catch(RuntimeException e)
		{
			log.error("delete failed",e);
			throw e;
		}
	}
	
	
	//界面表单登陆功能实现
	//传递参数为User_RegName,Password；
	public boolean MalUser(String name,String psw)
	{
	if(name == null){
		name = "";
	}
		if(psw == null){
			psw = "";
		}
		List<User> list = null;
	    String hql="select user.User_RegName,user.Password FROM User as user where user.User_RegName='"+name+"' and user.Password = '"+psw+"'";
	    
	        Session session = this.getSession();
	        Query query =session.createQuery(hql);
	        System.out.println("@@@@@@@@@");
	        list = query.list(); 
	    if(list.isEmpty()){
	        return false;
	    }
	        return true;
	}

}
