package com.paragon.dao;

import java.util.Iterator;
import java.util.List;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;

import com.paragon.entity.HouseExtrainfo;
import com.paragon.entity.UserConnHouse;

public class UserConnHouseDAO {
	private static final Log log = LogFactory.getLog(UserDAO.class);
	// property constants
	private Session session = null;

	
	public Session getSession(){
		Configuration conn = new Configuration().configure();
		SessionFactory factory=conn.buildSessionFactory();
		Session session =factory.openSession();
		return session;
	}
	
	//���빦��
	//���ݲ���ΪUserConnHouse��
	public boolean insert(UserConnHouse userconnhouse){
		session= this.getSession();
		Transaction tran = this.session.beginTransaction();
		this.session.save(userconnhouse);
		tran.commit();
		if(session.isOpen()){
			session.close();
			return true;
		}
		else{return false;}
	}
	
	//����houseid����User_ID�����ݲ���Ϊhouseid
	//����ֵΪUser_ID
	public int findbyhouseId(int id)
	{
		int house = 0;
		session = this.getSession();
		String hql = "Select User_ID FROM UserConnHouse as userconnhouse WHERE userconnhouse.houseId = ?";
		Query q = this.session.createQuery(hql);
		q.setInteger(0,id);
		List l = q.list();
		Iterator iter = l.iterator();
		if(iter.hasNext())
		{
			house = (Integer)iter.next();
		}
		return house;
	}
	
	//����User_ID����houseid�����ݲ���ΪUser_ID
	//����ֵΪhouseid��
	public List findbyuserId(int id)
	{
		List usernum ;
		session = this.getSession();
		String hql = "Select houseId FROM UserConnHouse as userconnhouse WHERE userconnhouse.User_ID = ?";
		Query q = this.session.createQuery(hql);
		q.setInteger(0,id);
		List l = q.list();
		return l;
	}
	
}
