package com.gokobee.vo;

import java.util.Date;

public class UserCommentVO {

	/*create table userComment (
    contentNum      number          not null,
    userID     varchar2(50)    		not null,
    commentNum      number          not null,
    commentDes      varchar2(2000)  not null,
    commentDate     date            default sysdate,
    primary key(contentNum, commentNum) 
);*/
	
	private int contentNum;
	private String userID;
	private int commentNum;
	private String commentDes;
	private Date commentDate;
	
	public int getContentNum() {
		return contentNum;
	}
	public void setContentNum(int contentNum) {
		this.contentNum = contentNum;
	}
	public String getUserID() {
		return userID;
	}
	public void setUserID(String userID) {
		this.userID = userID;
	}
	public int getCommentNum() {
		return commentNum;
	}
	public void setCommentNum(int commentNum) {
		this.commentNum = commentNum;
	}
	public String getCommentDes() {
		return commentDes;
	}
	public void setCommentDes(String commentDes) {
		this.commentDes = commentDes;
	}
	public Date getCommentDate() {
		return commentDate;
	}
	public void setCommentDate(Date commentDate) {
		this.commentDate = commentDate;
	}
	
	@Override
	public String toString() {
		return "UserCommentVO [contentNum=" + contentNum + ", userID=" + userID + ", commentNum=" + commentNum
				+ ", commentDes=" + commentDes + ", commentDate=" + commentDate + "]";
	}
	
	
	
	
	
}
