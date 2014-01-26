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
	//新建session
	private Session session = null;
	
	//在构造方法中实例化session对象
	public HouseExtrainfoDAO()
	{
		//找到Hibernate配置
		Configuration config = new Configuration().configure();
		//从配置中取出SessionFactory
		SessionFactory factory = config.buildSessionFactory();
		//从SessionFactory中取出一个Session
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
		//开始事务
		Transaction tran = this.session.beginTransaction();
//		System.out.println(session.isOpen());
		//执行语句
		this.session.save(houseExtra);
		//提交事务
		tran.commit();	
	}
	
	//修改
	public void update(HouseExtrainfo houseExtra)
	{
		//开始事务
		Transaction tran = this.session.beginTransaction();
		//执行语句
		this.session.update(houseExtra);
		//提交事务
		tran.commit();	
	}
	
	//按ID查询，推荐使用HQL
	
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
//		//通过Query借口查询
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
	
	//在Hibernate3中根据HQL进行删除
	public void delete(int houseId)
	{
		String hql = "DELETE HouseExtrainfo WHERE houseId=?";
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
		String hql = "FROM HouseExtrainfo as houseExtra";
		Query q = this.session.createQuery(hql);
		l = q.list();
		return l;	
	}
	
	//模糊查询
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
