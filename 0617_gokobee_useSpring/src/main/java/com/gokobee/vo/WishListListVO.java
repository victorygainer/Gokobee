package com.gokobee.vo;

import java.util.Date;

//create table wishList (
//	    wlNum     number          not null,
//	    userID      varchar2(50)    not null,
//	    contentNum  number          not null,
//	    addDate     date            default sysdate,
//	    primary key(wlNum, userId) 


// join 함수 연관 info
/*    
	 	cityCode         varchar2(20)    not null,
	    cateCode         varchar2(30)    not null,
	    contentName      varchar2(50)    not null,
	    contentPrice     number          not null,
	    contentSum       varchar(200)    null,
	    contentThumbImg  varchar(200)    null, 
 */


//	);

public class WishListListVO {
	private int wlNum;
	private String userID;
	private int contentNum;
	private Date addDate;
	private int num;
	private String cityCode;
	private String cateCode;
	private String contentName;
	private int contentPrice;
	private String contentSum;
	private String contentThumbImg;
	
	public WishListListVO() {}

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

	public int getNum() {
		return num;
	}

	public void setNum(int num) {
		this.num = num;
	}

	public String getCityCode() {
		return cityCode;
	}

	public void setCityCode(String cityCode) {
		this.cityCode = cityCode;
	}

	public String getCateCode() {
		return cateCode;
	}

	public void setCateCode(String cateCode) {
		this.cateCode = cateCode;
	}

	public String getContentName() {
		return contentName;
	}

	public void setContentName(String contentName) {
		this.contentName = contentName;
	}

	public int getContentPrice() {
		return contentPrice;
	}

	public void setContentPrice(int contentPrice) {
		this.contentPrice = contentPrice;
	}

	public String getContentSum() {
		return contentSum;
	}

	public void setContentSum(String contentSum) {
		this.contentSum = contentSum;
	}

	public String getContentThumbImg() {
		return contentThumbImg;
	}

	public void setContentThumbImg(String contentThumbImg) {
		this.contentThumbImg = contentThumbImg;
	}

	@Override
	public String toString() {
		return "WishListVO [wlNum=" + wlNum + ", userID=" + userID + ", contentNum=" + contentNum + ", addDate="
				+ addDate + ", num=" + num + ", cityCode=" + cityCode + ", cateCode=" + cateCode + ", contentName="
				+ contentName + ", contentPrice=" + contentPrice + ", contentSum=" + contentSum + ", contentThumbImg="
				+ contentThumbImg + "]";
	}   
}
