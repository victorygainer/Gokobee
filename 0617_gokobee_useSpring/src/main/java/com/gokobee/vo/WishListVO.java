package com.gokobee.vo;

import java.util.Date;

//create table wishList (
//	    wlNum     number          not null,
//	    userID      varchar2(50)    not null,
//	    contentNum  number          not null,
//	    addDate     date            default sysdate,
//	    primary key(wlNum, userId) 
//	);

public class WishListVO {
	private int wlNum;
	private String userID;
	private int contentNum;
	private Date addDate;
	
	public WishListVO() {}
	
	public int getWlNum() {
		return wlNum;
	}
	public void setWlNum(int wlNum) {
		this.wlNum = wlNum;
	}
	public String getUserID() {
		return userID;
	}
	public void setUserID(String userID) {
		this.userID = userID;
	}
	public int getContentNum() {
		return contentNum;
	}
	public void setContentNum(int contentNum) {
		this.contentNum = contentNum;
	}
	public Date getAddDate() {
		return addDate;
	}
	public void setAddDate(Date addDate) {
		this.addDate = addDate;
	}
	
	@Override
	public String toString() {
		return "WishListVO [wlNum=" + wlNum + ", userID=" + userID + ", contentNum=" + contentNum + ", addDate="
				+ addDate + "]";
	}
	
	
	
}
