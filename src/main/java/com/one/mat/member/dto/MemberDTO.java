package com.one.mat.member.dto;

import java.sql.Date;

public class MemberDTO {
	
	private String member_id;
	private String member_pw;
	private String member_email;
	private String member_gender;
	private String member_phone;
	private String member_name;
	private String member_roadAddr; // 도로명 주소
	private String member_parcelAddr; // 지번 주소
	private String member_dongAddr; // 지번 주소
	private String member_detailAddr; //상세 주소
	private String member_nickName; 
	private Date member_birth;
	private Date member_regDate; // 가입일자
	private String member_subs; // 구독 여부
	private String member_renew; // 구독 연장 여부
	private String member_loginLock; // 로그인 금지 여부
	private String member_quit; // 탈퇴 여부
	private int subsType_code; //권한 ID (일반사용자1, 플러스 2, 프리미엄 3, 관리자4)
	private String subsType; // 권한 이름
	private int member_idx;
	
	
	
	public String getMember_dongAddr() {
		return member_dongAddr;
	}
	public void setMember_dongAddr(String member_dongAddr) {
		this.member_dongAddr = member_dongAddr;
	}
	public int getMember_idx() {
		return member_idx;
	}
	public void setMember_idx(int member_idx) {
		this.member_idx = member_idx;
	}
	public String getMember_id() {
		return member_id;
	}
	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}
	public String getMember_pw() {
		return member_pw;
	}
	public void setMember_pw(String member_pw) {
		this.member_pw = member_pw;
	}
	public String getMember_email() {
		return member_email;
	}
	public void setMember_email(String member_email) {
		this.member_email = member_email;
	}
	public String getMember_gender() {
		return member_gender;
	}
	public void setMember_gender(String member_gender) {
		this.member_gender = member_gender;
	}
	public String getMember_phone() {
		return member_phone;
	}
	public void setMember_phone(String member_phone) {
		this.member_phone = member_phone;
	}
	public String getMember_name() {
		return member_name;
	}
	public void setMember_name(String member_name) {
		this.member_name = member_name;
	}
	public String getMember_roadAddr() {
		return member_roadAddr;
	}
	public void setMember_roadAddr(String member_roadAddr) {
		this.member_roadAddr = member_roadAddr;
	}
	public String getMember_parcelAddr() {
		return member_parcelAddr;
	}
	public void setMember_parcelAddr(String member_parcelAddr) {
		this.member_parcelAddr = member_parcelAddr;
	}
	public String getMember_detailAddr() {
		return member_detailAddr;
	}
	public void setMember_detailAddr(String member_detailAddr) {
		this.member_detailAddr = member_detailAddr;
	}
	public String getMember_nickName() {
		return member_nickName;
	}
	public void setMember_nickName(String member_nickName) {
		this.member_nickName = member_nickName;
	}
	public Date getMember_birth() {
		return member_birth;
	}
	public void setMember_birth(Date member_birth) {
		this.member_birth = member_birth;
	}
	public Date getMember_regDate() {
		return member_regDate;
	}
	public void setMember_regDate(Date member_regDate) {
		this.member_regDate = member_regDate;
	}
	public String getMember_subs() {
		return member_subs;
	}
	public void setMember_subs(String member_subs) {
		this.member_subs = member_subs;
	}
	public String getMember_renew() {
		return member_renew;
	}
	public void setMember_renew(String member_renew) {
		this.member_renew = member_renew;
	}
	public String getMember_loginLock() {
		return member_loginLock;
	}
	public void setMember_loginLock(String member_loginLock) {
		this.member_loginLock = member_loginLock;
	}
	public String getMember_quit() {
		return member_quit;
	}
	public void setMember_quit(String member_quit) {
		this.member_quit = member_quit;
	}
	public int getSubsType_code() {
		return subsType_code;
	}
	public void setSubsType_code(int subsType_code) {
		this.subsType_code = subsType_code;
	}
	public String getSubsType() {
		return subsType;
	}
	public void setSubsType(String subsType) {
		this.subsType = subsType;
	}

	
	
	
	

}
