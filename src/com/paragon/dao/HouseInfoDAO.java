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
	//新建session
	private Session session = null;
	
	//在构造方法中实例化session对象
	public HouseInfoDAO()
	{
		//找到Hibernate配置
		Configuration config = new Configuration().configure();
		//从配置中取出SessionFactory
		SessionFactory factory = config.buildSessionFactory();
		//从SessionFactory中取出一个Session
		this.session = factory.openSession();
	}
	
	//所有的操作都通过session进行的
	//向数据库中增加数据	
	public boolean insert(HouseInfo house)
	{
		//开始事务
		Transaction tran = this.session.beginTransaction();
//		System.out.println(session.isOpen());
		//执行语句
		this.session.save(house);
		//提交事务
		tran.commit();	
		if(session.isOpen())
		{
			session.close();
			return true;
		}
		else
		{return false;}
	}
	//修改
	public void update(HouseInfo house)
	{
		//开始事务
		Transaction tran = this.session.beginTransaction();
		//执行语句
		this.session.update(house);
		//提交事务
		tran.commit();	
	}
	
	//按ID查询，推荐使用HQL
	public HouseInfo queryById(int houseId)
	{
		HouseInfo house = null;
		String hql = "FROM HouseInfo as house WHERE house.houseId=?";
		//通过Query借口查询
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
	
	//删除数据
	//Hibernate2和Hibernate3通用，性能不高
//	public void delete(HouseInfo house)
//	{
//		Transaction tran = session.beginTransaction();
//		this.session.delete(house);
//		tran.commit();	
//	}
	
	//在Hibernate3中根据HQL进行删除
	public void delete(int houseId)
	{
		String hql = "DELETE HouseInfo WHERE houseId=?";
		Query q = this.session.createQuery(hql);
		//把参数设置
		q.setInteger(0,houseId);
		//执行更新语句
		q.executeUpdate();
		this.session.beginTransaction().commit();
	}
	
	//查询全部数据
	public List queryAll()
	{
		List l =null;
		String hql = "FROM HouseInfo as house";
		Query q = this.session.createQuery(hql);
		l = q.list();
		return l;	
	}
	//模糊查询
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