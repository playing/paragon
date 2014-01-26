package com.paragon.struts.action;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import com.paragon.dao.HouseExtrainfoDAO;
import com.paragon.dao.HouseInfoDAO;
import com.paragon.dao.UserConnHouseDAO;
import com.paragon.entity.HouseExtrainfo;
import com.paragon.entity.HouseInfo;
import com.paragon.entity.UserConnHouse;
import com.paragon.struts.form.PublishForm;



public class PublishAction extends Action {
	/*
	 * Generated Methods
	 */

	/** 
	 * Method execute
	 * @param mapping
	 * @param form
	 * @param request
	 * @param response
	 * @return ActionForward
	 */
	
	
	public ActionForward execute(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
		PublishForm publishForm = (PublishForm) form;// TODO Auto-generated method stub
		
		//House_Info table attribute (share house_id)
		int houseid = publishForm.getHouse_id();
		String houseaddress = publishForm.getHouse_address();
		String housepicture = publishForm.getHouse_picture();
		int livenum = publishForm.getLive_num();
		int houseprice = publishForm.getHouse_price();
		String houseintro = publishForm.getHouse_intro();
		String checkintime = publishForm.getCheck_in_time();
		String checkouttime = publishForm.getCheck_out_time();
		String housetype = publishForm.getHouse_type();
		String renttype = publishForm.getRent_type();
		int housearea = publishForm.getHouse_area();
		int bedroomnum = publishForm.getBedroom_num();
		
		int user_id = publishForm.getUser_id();
		
		//House_ExtraInfo table
		String facilities = publishForm.getFacilities();
		int bednum = publishForm.getBed_num();
		int toiletnum = publishForm.getToilet_num();
		String roomdescribe = publishForm.getRoom_describe();
        
		//Insert House_Info table
		HouseInfoDAO houseinfodao = new HouseInfoDAO();
		HouseInfo houseinfo = new HouseInfo();
		
		houseinfo.setHouseId(houseid);
		houseinfo.setHouseAddress(houseaddress);
		houseinfo.setHousePicture(housepicture);
		houseinfo.setLiveNum(livenum);
		houseinfo.setHousePrice(houseprice);
		houseinfo.setHouseIntro(houseintro);
		houseinfo.setCheckInTime(checkintime);
		houseinfo.setCheckOutTime(checkouttime);
		houseinfo.setHouseType(housetype);
		houseinfo.setRentType(renttype);
		houseinfo.setHouseArea(housearea);
		houseinfo.setBedroomNum(bedroomnum);
		
		houseinfodao.insert(houseinfo);
		
		//Insert House_ExtraInfo table
		HouseExtrainfoDAO houseextrainfodao = new HouseExtrainfoDAO();
		HouseExtrainfo houseextrainfo = new HouseExtrainfo();
		
		houseextrainfo.setHouseId(houseid);
		houseextrainfo.setFacilities(facilities);
		houseextrainfo.setBedNum(bednum);
		houseextrainfo.setToiletNum(toiletnum);
		houseextrainfo.setRoomDescribe(roomdescribe);
		
		houseextrainfodao.insert(houseextrainfo);
		
		//ÃÌº””Ôæ‰
		UserConnHouse userconn = new UserConnHouse();
		userconn.setHouseId(houseid);
		userconn.setUser_ID(user_id);
		UserConnHouseDAO userconndao = new UserConnHouseDAO();
		userconndao.insert(userconn);
		
		 response.setContentType("text/html; charset=utf-8");
		
		int result = 1;
		try {
			PrintWriter out = response.getWriter();
		    out.println(result);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return null;
	}
}