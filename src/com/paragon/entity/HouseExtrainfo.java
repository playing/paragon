package com.paragon.entity;

public class HouseExtrainfo {

	/**
	 * @param args
	 */
	private int houseId;
	private String facilities;
	private int bedNum;
	private int toiletNum;
	private String roomDescribe;
	    
	
		public int getHouseId() {
		    return houseId;
	    }
	    public void setHouseId(int houseId) {
		    this.houseId = houseId;
	    }
		public String getFacilities() {
			return facilities;
		}
		public void setFacilities(String facilities) {
			this.facilities = facilities;
		}
		public int getBedNum() {
			return bedNum;
		}
		public void setBedNum(int bedNum) {
			this.bedNum = bedNum;
		}
		public int getToiletNum() {
			return toiletNum;
		}
		public void setToiletNum(int toiletNum) {
			this.toiletNum = toiletNum;
		}
		public String getRoomDescribe() {
			return roomDescribe;
		}
		public void setRoomDescribe(String roomDescribe) {
			this.roomDescribe = roomDescribe;
		}
		
		

}
