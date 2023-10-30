package com.one.mat.member.dto;

import java.sql.Date;

public class PhotoDTO {
	
	private int photo_id;
	private String photo_type;
	private int photo_idfNum;
	private String photo_fileName;
	private Date photo_uploadDate;
	
	public int getPhoto_id() {
		return photo_id;
	}
	public void setPhoto_id(int photo_id) {
		this.photo_id = photo_id;
	}
	public String getPhoto_type() {
		return photo_type;
	}
	public void setPhoto_type(String photo_type) {
		this.photo_type = photo_type;
	}
	public int getPhoto_idfNum() {
		return photo_idfNum;
	}
	public void setPhoto_idfNum(int photo_idfNum) {
		this.photo_idfNum = photo_idfNum;
	}
	public String getPhoto_fileName() {
		return photo_fileName;
	}
	public void setPhoto_fileName(String photo_fileName) {
		this.photo_fileName = photo_fileName;
	}
	public Date getPhoto_uploadDate() {
		return photo_uploadDate;
	}
	public void setPhoto_uploadDate(Date photo_uploadDate) {
		this.photo_uploadDate = photo_uploadDate;
	}
	
	

}
