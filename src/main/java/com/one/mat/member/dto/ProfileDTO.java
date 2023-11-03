package com.one.mat.member.dto;

import java.util.ArrayList;
import java.util.List;

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
	private String breedType_code;
	private String charType_code;
	private ArrayList<String> charTypeList;
	private ArrayList<String> photo_fileNameList;
	private String pro_dogAgeOpen;
	private String pro_dogGenderOpen;
	
	
	public String getBreedType_code() {
		return breedType_code;
	}
	public void setBreedType_code(String breedType_code) {
		this.breedType_code = breedType_code;
	}
	public String getCharType_code() {
		return charType_code;
	}
	public void setCharType_code(String charType_code) {
		this.charType_code = charType_code;
	}
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
	public ArrayList<String> getCharTypeList() {
		return charTypeList;
	}
	public void setCharTypeList(ArrayList<String> charTypeList) {
		this.charTypeList = charTypeList;
	}
	public ArrayList<String> getPhoto_fileNameList() {
		return photo_fileNameList;
	}
	public void setPhoto_fileNameList(ArrayList<String> photo_fileNameList) {
		this.photo_fileNameList = photo_fileNameList;
	}
	public String getPro_dogAgeOpen() {
		return pro_dogAgeOpen;
	}
	public void setPro_dogAgeOpen(String pro_dogAgeOpen) {
		this.pro_dogAgeOpen = pro_dogAgeOpen;
	}
	public String getPro_dogGenderOpen() {
		return pro_dogGenderOpen;
	}
	public void setPro_dogGenderOpen(String pro_dogGenderOpen) {
		this.pro_dogGenderOpen = pro_dogGenderOpen;
	}





	
}
