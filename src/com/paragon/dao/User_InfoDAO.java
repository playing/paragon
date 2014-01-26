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
	
	//�����û�������Ϣ���ܣ�
	//���ݲ���ΪUser_Info��
	//����ֵΪboolean�ͣ�������ҵ�������true�����Ϊ�գ�����false��
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
	
	//�����û�������Ϣ���ܣ�
	//���ݲ���ΪUser_Info��;
	//����ֵΪboolean�ͣ�������ҵ�������true�����Ϊ�գ�����false��
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
	
	//���ݲ���ΪUser_ID,����User_ID�����û����˾�����Ϣ��Ҳ����User_Info���е�����Ϣ��
	public User_Info queryById(int User_ID){
		session = this.getSession();
		Transaction tran = this.session.beginTransaction();
		User_Info instance = (User_Info) getSession().get(
				"com.paragon.entity.User_Info", User_ID);
		tran.commit();
		return instance;

	}
	
	//һ�㲻�����delete����
	public void delete(User_Info user_info){
		session = this.getSession();
		Transaction tran = this.session.beginTransaction();
		this.session.delete(user_info);
		tran.commit();
	}
	
	//���ݽ���User_ID����������User_IDɾ���û�������Ϣ��
	//�жϳɹ���񣬿ɿ���־�ļ���
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
