/**
 * 
 */
package com.paragon.entity;


import com.paragon.dao.*;


import java.text.SimpleDateFormat;
import java.util.Date;

import org.hibernate.cfg.Configuration;
import org.hibernate.tool.hbm2ddl.SchemaExport;

/**
 * �����࣬����HouseInfoDao�Ĺ���
 * ����˻ƿ�
 * ���ڣ�2014-01-14
 */
public class HouseClient {
	
	public static void main(String[] args) {
		// TODO Auto-generated method stub
//		����POJO��ʵ��������
		HouseInfo house = new HouseInfo();
		house.setHouseId(1);
		house.setHouseAddress("�ϲ���");
		house.setHousePicture("picture1");
		house.setHouseIntro("���໨԰С�� ����һ��");
		house.setHouseArea(100);
		house.setBedroomNum(3);
		house.setHousePrice(200);
		house.setHouseType("��Ԣ");
		house.setRentType("�������");
		house.setLiveNum(2);
		//house.setCheckInTime(new Date());
		//house.setCheckOutTime(new Date());
		
		HouseInfoDAO housedao = new HouseInfoDAO();
		//housedao.insert(house);
		housedao.queryByLike("�人");
		System.out.println(house.getHouseAddress());
		
//		HouseClient.exportDB();
	}

	public static void exportDB(){
		
		Configuration cfg = new Configuration().configure();
		SchemaExport export = new SchemaExport(cfg);
		export.create(true, true);
	}
	
	
}
