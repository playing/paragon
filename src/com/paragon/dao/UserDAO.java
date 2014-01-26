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
		//��ȡhibernate.cfg.htm�����ļ���
		Configuration conn = new Configuration().configure();
		//��ȡhibernate.cfg.htm�����ļ���sessionFactory��mysql���ݿ����ϵ��Ϣ
		SessionFactory factory=conn.buildSessionFactory();
		//��������
		Session session =factory.openSession();
		return session;
	}
	
	//�����û���ע����Ϣ��
	//��User��Ϊ���ݲ�����
	public boolean insert(User user){
		session= this.getSession();
		Transaction tran = this.session.beginTransaction();
		//��transient״̬��Ϊpersistent״̬
		this.session.save(user);
		//�ύ����
		tran.commit();
		if(session.isOpen()){
			session.close();
			return true;
		}
		else{return false;}
	}
	
	//�������ݿ����
	//��User��Ϊ���ݲ���
	public void update(User user){
		session = this.getSession();
		Transaction tran = this.session.beginTransaction();
		//����Session�Դ���update������
		this.session.update(user);
		tran.commit();	
	}
	
	//�����û���Ϣ
	//���ݲ���ΪUser_ID
	//����User_ID�ҵ�User��ȫ����Ϣ��
	public User queryById(int User_ID){
		session = this.getSession();
		Transaction tran = this.session.beginTransaction();
		User instance = (User) getSession().get(
				"com.paragon.entity.User", User_ID);
		tran.commit();
		return instance;
	}
	
	
	//�����û�����ѯ�û�ID
	
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
		//ͨ��Query��ڲ�ѯ
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
	
	
	
	//ɾ���û���Ϣ�����Ǵ������Ĳ�����User�࣬һ��ʹ������ĸ���User_IDִ��ɾ����
	public void delete(User user){
		session = this.getSession();
		Transaction tran = this.session.beginTransaction();
		this.session.delete(user);
		tran.commit();
	}
	
	//����User_IDΪ������ɾ���û���Ϣ��
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
	
	
	//�������½����ʵ��
	//���ݲ���ΪUser_RegName,Password��
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
