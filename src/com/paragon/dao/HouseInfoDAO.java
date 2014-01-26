package com.paragon.dao;

import com.paragon.entity.*;

import java.util.Iterator;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;

import com.paragon.entity.HouseInfo;


public class HouseInfoDAO{
	//�½�session
	private Session session = null;
	
	//�ڹ��췽����ʵ����session����
	public HouseInfoDAO()
	{
		//�ҵ�Hibernate����
		Configuration config = new Configuration().configure();
		//��������ȡ��SessionFactory
		SessionFactory factory = config.buildSessionFactory();
		//��SessionFactory��ȡ��һ��Session
		this.session = factory.openSession();
	}
	
	//���еĲ�����ͨ��session���е�
	//�����ݿ�����������	
	public boolean insert(HouseInfo house)
	{
		//��ʼ����
		Transaction tran = this.session.beginTransaction();
//		System.out.println(session.isOpen());
		//ִ�����
		this.session.save(house);
		//�ύ����
		tran.commit();	
		if(session.isOpen())
		{
			session.close();
			return true;
		}
		else
		{return false;}
	}
	//�޸�
	public void update(HouseInfo house)
	{
		//��ʼ����
		Transaction tran = this.session.beginTransaction();
		//ִ�����
		this.session.update(house);
		//�ύ����
		tran.commit();	
	}
	
	//��ID��ѯ���Ƽ�ʹ��HQL
	public HouseInfo queryById(int houseId)
	{
		HouseInfo house = null;
		String hql = "FROM HouseInfo as house WHERE house.houseId=?";
		//ͨ��Query��ڲ�ѯ
		Query q = this.session.createQuery(hql);
		q.setInteger(0,houseId);
		List l = q.list();
		Iterator iter = l.iterator();
		if(iter.hasNext())
		{
			house = (HouseInfo)iter.next();
		}
		return house;
	}
	
	//ɾ������
	//Hibernate2��Hibernate3ͨ�ã����ܲ���
//	public void delete(HouseInfo house)
//	{
//		Transaction tran = session.beginTransaction();
//		this.session.delete(house);
//		tran.commit();	
//	}
	
	//��Hibernate3�и���HQL����ɾ��
	public void delete(int houseId)
	{
		String hql = "DELETE HouseInfo WHERE houseId=?";
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
		String hql = "FROM HouseInfo as house";
		Query q = this.session.createQuery(hql);
		l = q.list();
		return l;	
	}
	//ģ����ѯ
	public List queryByLike(String cond)
	{
		List l =null;
		String hql = "FROM HouseInfo as house WHERE house.houseAddress like?";
		Query q = this.session.createQuery(hql);
		q.setString(0,"%"+cond+"%");
		l = q.list();
		return l;
	}
	
	
}