/**
 * 
 */
package com.paragon.dao;
import java.util.Iterator;
import java.util.List;

import com.paragon.entity.*;


import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;

/**
 * @author a
 *
 */
public class HouseExtrainfoDAO {
	//�½�session
	private Session session = null;
	
	//�ڹ��췽����ʵ����session����
	public HouseExtrainfoDAO()
	{
		//�ҵ�Hibernate����
		Configuration config = new Configuration().configure();
		//��������ȡ��SessionFactory
		SessionFactory factory = config.buildSessionFactory();
		//��SessionFactory��ȡ��һ��Session
		this.session = factory.openSession();
	}
	
	public Session getSession(){
		Configuration conn = new Configuration().configure();
		SessionFactory factory=conn.buildSessionFactory();
		Session session =factory.openSession();
		return session;
	}
	
	
	public void insert(HouseExtrainfo houseExtra)
	{
		//��ʼ����
		Transaction tran = this.session.beginTransaction();
//		System.out.println(session.isOpen());
		//ִ�����
		this.session.save(houseExtra);
		//�ύ����
		tran.commit();	
	}
	
	//�޸�
	public void update(HouseExtrainfo houseExtra)
	{
		//��ʼ����
		Transaction tran = this.session.beginTransaction();
		//ִ�����
		this.session.update(houseExtra);
		//�ύ����
		tran.commit();	
	}
	
	//��ID��ѯ���Ƽ�ʹ��HQL
	
	public HouseExtrainfo queryById(int houseId){
		
		Transaction tran = this.session.beginTransaction();
		HouseExtrainfo instance = (HouseExtrainfo) getSession().get(
				"com.paragon.entity.HouseExtrainfo", houseId);
		tran.commit();
		return instance;

	}
	
	
//	public HouseExtrainfo queryById(int houseId)
//	{
//		HouseExtrainfo houseExtra = null;
//		String hql = "FROM HouseExtrainfo as house WHERE houseExtar.houseId=?";
//		//ͨ��Query��ڲ�ѯ
//		Query q = this.session.createQuery(hql);
//		q.setInteger(0,houseId);
//		List l = q.list();
//		Iterator iter = l.iterator();
//		if(iter.hasNext())
//		{
//			houseExtra = (HouseExtrainfo)iter.next();
//		}
//		return houseExtra;
//	}
	
	//��Hibernate3�и���HQL����ɾ��
	public void delete(int houseId)
	{
		String hql = "DELETE HouseExtrainfo WHERE houseId=?";
		Query q = this.session.createQuery(hql);
		//�Ѳ�������
		q.setInteger(0,houseId);
		//ִ�и������
		q.executeUpdate();
		this.session.beginTransaction().commit();
	}
	
	//��ѯȫ������
	public List queryAll()
	{
		List l =null;
		String hql = "FROM HouseExtrainfo as houseExtra";
		Query q = this.session.createQuery(hql);
		l = q.list();
		return l;	
	}
	
	//ģ����ѯ
	public List queryByLike(String cond)
	{
		List l =null;
		String hql = "FROM HouseExtrainfo as houseExtra WHERE houseExtra.roomDescribe like?";
		Query q = this.session.createQuery(hql);
		q.setString(0,"%"+cond+"%");
		l = q.list();
		return l;	
	}

}
