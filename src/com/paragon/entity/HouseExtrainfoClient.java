/**
 * 
 */
package com.paragon.entity;


import com.paragon.dao.*;


/**
 * @author a
 *
 */
public class HouseExtrainfoClient {

	/**
	 * @param args
	 */
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
		HouseExtrainfo houseExtra = new HouseExtrainfo();
		houseExtra.setHouseId(1);
		houseExtra.setBedNum(3);
		houseExtra.setFacilities("带洗衣机");
		houseExtra.setToiletNum(2);
		houseExtra.setRoomDescribe("光线好，不带带阳台");
		
		HouseExtrainfoDAO houseExtradao = new HouseExtrainfoDAO();
		houseExtradao.update(houseExtra);
		

	}

}
