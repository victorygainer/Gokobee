package com.gokobee.vo;

import java.util.Date;

/*
			userID : userID,
			contentNum : contentNum,
			contentOwner : contentOwner,
			dateChoose : dateChoose,
			memberChoose : memberChoose,
			totalPrice : totalPrice 
  */
public class ReservationVO {
	
	private int reservationNum;
	private String userID;
	private int contentNum;
	private String contentOwner;
	private String dateChoose;
	private int memberChoose;
	private int totalPrice;
	private Date reservationDate;
	private String contentName;
	private String contentThumbImg;
	private String contentSum;
	private String cateCode;
	private int rsvStatus;
	
	public int getReservationNum() {
		return reservationNum;
	}
	public void setReservationNum(int reservationNum) {
		this.reservationNum = reservationNum;
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
	public String getContentOwner() {
		return contentOwner;
	}
	public void setContentOwner(String contentOwner) {
		this.contentOwner = contentOwner;
	}
	public String getDateChoose() {
		return dateChoose;
	}
	public void setDateChoose(String dateChoose) {
		this.dateChoose = dateChoose;
	}
	public int getMemberChoose() {
		return memberChoose;
	}
	public void setMemberChoose(int memberChoose) {
		this.memberChoose = memberChoose;
	}
	public int getTotalPrice() {
		return totalPrice;
	}
	public void setTotalPrice(int totalPrice) {
		this.totalPrice = totalPrice;
	}
	public Date getReservationDate() {
		return reservationDate;
	}
	public void setReservationDate(Date reservationDate) {
		this.reservationDate = reservationDate;
	}
	public String getContentName() {
		return contentName;
	}
	public void setContentName(String contentName) {
		this.contentName = contentName;
	}
	public String getContentThumbImg() {
		return contentThumbImg;
	}
	public void setContentThumbImg(String contentThumbImg) {
		this.contentThumbImg = contentThumbImg;
	}
	public String getContentSum() {
		return contentSum;
	}
	public void setContentSum(String contentSum) {
		this.contentSum = contentSum;
	}
	public String getCateCode() {
		return cateCode;
	}
	public void setCateCode(String cateCode) {
		this.cateCode = cateCode;
	}
	public int getRsvStatus() {
		return rsvStatus;
	}
	public void setRsvStatus(int rsvStatus) {
		this.rsvStatus = rsvStatus;
	}
	
	@Override
	public String toString() {
		return "ReservationVO [reservationNum=" + reservationNum + ", userID=" + userID + ", contentNum=" + contentNum
				+ ", contentOwner=" + contentOwner + ", dateChoose=" + dateChoose + ", memberChoose=" + memberChoose
				+ ", totalPrice=" + totalPrice + ", reservationDate=" + reservationDate + ", contentName=" + contentName
				+ ", contentThumbImg=" + contentThumbImg + ", contentSum=" + contentSum + ", cateCode=" + cateCode
				+ ", rsvStatus=" + rsvStatus + "]";
	}
	
	
	
	
}
