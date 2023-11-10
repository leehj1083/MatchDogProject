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
	private int charType_code;
	private ArrayList<ProfileDTO> charTypeList;
	private ArrayList<PhotoDTO> photoList;
	private String pro_dogAgeOpen;
	public int getBoard_id() {
		return board_id;
	}
	public void setBoard_id(int board_id) {
		this.board_id = board_id;
	}
	public int getReply_id() {
		return reply_id;
	}
	public void setReply_id(int reply_id) {
		this.reply_id = reply_id;
	}
	public int getChat_idx() {
		return chat_idx;
	}
	public void setChat_idx(int chat_idx) {
		this.chat_idx = chat_idx;
	}
	private String pro_dogGenderOpen;
	private String pro_quit;
	private int board_id;
	private int reply_id;
	private int chat_idx;
	
	
	public String getBreedType_code() {
		return breedType_code;
	}
	public void setBreedType_code(String breedType_code) {
		this.breedType_code = breedType_code;
	}
	public int getCharType_code() {
		return charType_code;
	}
	public void setCharType_code(int charType_code) {
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
	public ArrayList<ProfileDTO> getCharTypeList() {
		return charTypeList;
	}
	public void setCharTypeList(ArrayList<ProfileDTO> charTypeList) {
		this.charTypeList = charTypeList;
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
	public String getPro_quit() {
		return pro_quit;
	}
	public void setPro_quit(String pro_quit) {
		this.pro_quit = pro_quit;
	}
	public ArrayList<PhotoDTO> getPhotoList() {
		return photoList;
	}
	public void setPhotoList(ArrayList<PhotoDTO> photoList) {
		this.photoList = photoList;
	}






	
}
