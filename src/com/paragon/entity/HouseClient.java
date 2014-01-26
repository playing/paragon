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
 * 测试类，测试HouseInfoDao的功能
 * 完成人黄凯
 * 日期：2014-01-14
 */
public class HouseClient {
	
	public static void main(String[] args) {
		// TODO Auto-generated method stub
//		生成POJO类实例化对象
		HouseInfo house = new HouseInfo();
		house.setHouseId(1);
		house.setHouseAddress("南昌市");
		house.setHousePicture("picture1");
		house.setHouseIntro("常青花园小区 三室一厅");
		house.setHouseArea(100);
		house.setBedroomNum(3);
		house.setHousePrice(200);
		house.setHouseType("公寓");
		house.setRentType("单间出租");
		house.setLiveNum(2);
		//house.setCheckInTime(new Date());
		//house.setCheckOutTime(new Date());
		
		HouseInfoDAO housedao = new HouseInfoDAO();
		//housedao.insert(house);
		housedao.queryByLike("武汉");
		System.out.println(house.getHouseAddress());
		
//		HouseClient.exportDB();
	}

	public static void exportDB(){
		
		Configuration cfg = new Configuration().configure();
		SchemaExport export = new SchemaExport(cfg);
		export.create(true, true);
	}
	
	
}
