package com.one.mat.member.dto;

public class ProfileDTO {
	
	private int pro_idx;
	private int member_idx;
	private String pro_dogName;
	private int pro_dogAge;
	private String pro_dogGender;
	private String pro_dogDesc;
	private int pro_dogScore;
	private String pro_rep; // 대표프로필 여부
	private String photo_fileName; // 프로필에 들어갈 사진
	private String breedType;
	private String charType;
	private String photos;
	
	
	public String getPhoto_fileName() {
		return photo_fileName;
	}
	public void setPhoto_fileName(String photo_fileName) {
		this.photo_fileName = photo_fileName;
	}
	public String getBreedType() {
		return breedType;
	}
	public void setBreedType(String breedType) {
		this.breedType = breedType;
	}
	public String getCharType() {
		return charType;
	}
	public void setCharType(String charType) {
		this.charType = charType;
	}
	public String getPhotos() {
		return photos;
	}
	public void setPhotos(String photos) {
		this.photos = photos;
	}
	public int getPro_idx() {
		return pro_idx;
	}
	public void setPro_idx(int pro_idx) {
		this.pro_idx = pro_idx;
	}
	public int getMember_idx() {
		return member_idx;
	}
	public void setMember_idx(int member_idx) {
		this.member_idx = member_idx;
	}
	public String getPro_dogName() {
		return pro_dogName;
	}
	public void setPro_dogName(String pro_dogName) {
		this.pro_dogName = pro_dogName;
	}
	public int getPro_dogAge() {
		return pro_dogAge;
	}
	public void setPro_dogAge(int pro_dogAge) {
		this.pro_dogAge = pro_dogAge;
	}
	public String getPro_dogGender() {
		return pro_dogGender;
	}
	public void setPro_dogGender(String pro_dogGender) {
		this.pro_dogGender = pro_dogGender;
	}
	public String getPro_dogDesc() {
		return pro_dogDesc;
	}
	public void setPro_dogDesc(String pro_dogDesc) {
		this.pro_dogDesc = pro_dogDesc;
	}
	public int getPro_dogScore() {
		return pro_dogScore;
	}
	public void setPro_dogScore(int pro_dogScore) {
		this.pro_dogScore = pro_dogScore;
	}
	public String getPro_rep() {
		return pro_rep;
	}
	public void setPro_rep(String pro_rep) {
		this.pro_rep = pro_rep;
	}
	
	

}
