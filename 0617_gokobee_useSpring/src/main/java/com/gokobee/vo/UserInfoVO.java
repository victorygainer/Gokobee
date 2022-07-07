package com.gokobee.vo;

import java.sql.Date;

public class UserInfoVO {
	
	private String userID;
	private String userPassword;
	private String confirmPassword;
	private Date regiDate;
	private int verify;
	
	public UserInfoVO() {}

	public String getUserID() {
		return userID;
	}

	public void setUserID(String userID) {
		this.userID = userID;
	}

	public String getUserPassword() {
		return userPassword;
	}

	public void setUserPassword(String userPassword) {
		this.userPassword = userPassword;
	}

	public String getConfirmPassword() {
		return confirmPassword;
	}

	public void setConfirmPassword(String confirmPassword) {
		this.confirmPassword = confirmPassword;
	}

	public Date getRegiDate() {
		return regiDate;
	}

	public void setRegiDate(Date regiDate) {
		this.regiDate = regiDate;
	}

	public int getVerify() {
		return verify;
	}

	public void setVerify(int verify) {
		this.verify = verify;
	}

	@Override
	public String toString() {
		return "UserInfoVO [userID=" + userID + ", userPassword=" + userPassword + ", confirmPassword="
				+ confirmPassword + ", regiDate=" + regiDate + ", verify=" + verify + "]";
	}

	
	
}