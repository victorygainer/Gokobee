package com.gokobee.vo;

import java.util.Date;

public class ContentVO {
	
	/*
	create table content (
    contentNum       number          not null,
    cityCode         varchar2(20)    not null,
    cateCode         varchar2(30)    not null,
    contentTag       varchar2(50)    not null,
    contentName      varchar2(50)    not null,
    contentOwner	 varchar2(50)	 not null,
    contentPrice     number          not null,
    contentSum       varchar(200)    null,
    contentDes       varchar(500)    null,
    contentImg       varchar(200)    null,
    contentDate      date            default sysdate,
    contentThumbImg  varchar(200)    null,
    primary key(contentNum)  
);
	 */
	
	private int contentNum;
	private String cityCode;
	private String cateCode;
	private String contentTag;
	private String contentName;
	private String contentOwner;
	private int contentPrice;
	private String contentSum;
	private String contentDes;
	private String contentImg;
	private Date contentDate;
    private String contentThumbImg;

	
	public ContentVO() {}


	public int getContentNum() {
		return contentNum;
	}


	public void setContentNum(int contentNum) {
		this.contentNum = contentNum;
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


	public String getContentTag() {
		return contentTag;
	}


	public void setContentTag(String contentTag) {
		this.contentTag = contentTag;
	}


	public String getContentName() {
		return contentName;
	}


	public void setContentName(String contentName) {
		this.contentName = contentName;
	}


	public String getContentOwner() {
		return contentOwner;
	}


	public void setContentOwner(String contentOwner) {
		this.contentOwner = contentOwner;
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


	public String getContentDes() {
		return contentDes;
	}


	public void setContentDes(String contentDes) {
		this.contentDes = contentDes;
	}


	public String getContentImg() {
		return contentImg;
	}


	public void setContentImg(String contentImg) {
		this.contentImg = contentImg;
	}


	public Date getContentDate() {
		return contentDate;
	}


	public void setContentDate(Date contentDate) {
		this.contentDate = contentDate;
	}


	public String getContentThumbImg() {
		return contentThumbImg;
	}


	public void setContentThumbImg(String contentThumbImg) {
		this.contentThumbImg = contentThumbImg;
	}


	@Override
	public String toString() {
		return "ContentVO [contentNum=" + contentNum + ", cityCode=" + cityCode + ", cateCode=" + cateCode
				+ ", contentTag=" + contentTag + ", contentName=" + contentName + ", contentOwner=" + contentOwner
				+ ", contentPrice=" + contentPrice + ", contentSum=" + contentSum + ", contentDes=" + contentDes
				+ ", contentImg=" + contentImg + ", contentDate=" + contentDate + ", contentThumbImg=" + contentThumbImg
				+ "]";
	}
}


