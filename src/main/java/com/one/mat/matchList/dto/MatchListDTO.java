package com.one.mat.matchList.dto;

import java.sql.Date;
import java.util.ArrayList;

public class MatchListDTO {
	
	private int pro_idx = 0; // 프로필 id
	private int pro_you = 0;
	private int pro_me = 0;
	private String myDogName = "";
	private int pro_sendIdx = 0;
	private int pro_recvIdx = 0;
	private Date regDate;
	private String photo_fileName = ""; // 사진이름
	private String breedType = ""; // 견종
	private String pro_dogName = ""; // 프로필 강아지 이름
	private int match_idx = 0;
	private Date match_req;
	private String matchTime = "";
	private ArrayList<String> charType = new ArrayList<String>();
	private String match_succeed = "";
	
	
	
	
	public String getMatch_succeed() {
		return match_succeed;
	}
	public void setMatch_succeed(String match_succeed) {
		this.match_succeed = match_succeed;
	}
	public ArrayList<String> getCharType() {
		return charType;
	}
	public void setCharType(ArrayList<String> charType) {
		this.charType = charType;
	}
	public String getMatchTime() {
		return matchTime;
	}
	public void setMatchTime(String matchTime) {
		this.matchTime = matchTime;
	}
	public Date getMatch_req() {
		return match_req;
	}
	public void setMatch_req(Date match_req) {
		this.match_req = match_req;
	}
	public int getMatch_idx() {
		return match_idx;
	}
	public void setMatch_idx(int match_idx) {
		this.match_idx = match_idx;
	}
	public int getPro_idx() {
		return pro_idx;
	}
	public void setPro_idx(int pro_idx) {
		this.pro_idx = pro_idx;
	}
	public int getPro_you() {
		return pro_you;
	}
	public void setPro_you(int pro_you) {
		this.pro_you = pro_you;
	}
	public int getPro_me() {
		return pro_me;
	}
	public void setPro_me(int pro_me) {
		this.pro_me = pro_me;
	}
	public String getMyDogName() {
		return myDogName;
	}
	public void setMyDogName(String myDogName) {
		this.myDogName = myDogName;
	}
	public int getPro_sendIdx() {
		return pro_sendIdx;
	}
	public void setPro_sendIdx(int pro_sendIdx) {
		this.pro_sendIdx = pro_sendIdx;
	}
	public int getPro_recvIdx() {
		return pro_recvIdx;
	}
	public void setPro_recvIdx(int pro_recvIdx) {
		this.pro_recvIdx = pro_recvIdx;
	}
	public Date getRegDate() {
		return regDate;
	}
	public void setRegDate(Date regDate) {
		this.regDate = regDate;
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
	public String getPro_dogName() {
		return pro_dogName;
	}
	public void setPro_dogName(String pro_dogName) {
		this.pro_dogName = pro_dogName;
	}
	
	

}
