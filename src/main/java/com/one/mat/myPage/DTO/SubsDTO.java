package com.one.mat.myPage.DTO;

public class SubsDTO {

	private String member_subs; // member 테이블의 구독여부
	private String member_renew; // member 테이블의 구독 연장 여부
	private String subsType_code; // substype 테이블의 구독코드
	private String subsType; // substype 테이블의 구독 종류
	private String subsType_price; // substype 테이블의 구독 가경
	private String subs_idx; // subs 테이블의 구독 id
	private String subsHistory_idx; // subshistory 테이블의 구독히스토리 id
	private String subHistory_state; // subshistory 테이블의 구독 연장 여부
	private String subsHistory_start; // subshistory 테이블의 구독 시작 일자
	private String subsHistory_exp; // subshistory 테이블의 구독 만료 일자
	
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
	public String getSubsType_code() {
		return subsType_code;
	}
	public void setSubsType_code(String subsType_code) {
		this.subsType_code = subsType_code;
	}
	public String getSubsType() {
		return subsType;
	}
	public void setSubsType(String subsType) {
		this.subsType = subsType;
	}
	public String getSubsType_price() {
		return subsType_price;
	}
	public void setSubsType_price(String subsType_price) {
		this.subsType_price = subsType_price;
	}
	public String getSubs_idx() {
		return subs_idx;
	}
	public void setSubs_idx(String subs_idx) {
		this.subs_idx = subs_idx;
	}
	public String getSubsHistory_idx() {
		return subsHistory_idx;
	}
	public void setSubsHistory_idx(String subsHistory_idx) {
		this.subsHistory_idx = subsHistory_idx;
	}
	public String getSubHistory_state() {
		return subHistory_state;
	}
	public void setSubHistory_state(String subHistory_state) {
		this.subHistory_state = subHistory_state;
	}
	public String getSubsHistory_start() {
		return subsHistory_start;
	}
	public void setSubsHistory_start(String subsHistory_start) {
		this.subsHistory_start = subsHistory_start;
	}
	public String getSubsHistory_exp() {
		return subsHistory_exp;
	}
	public void setSubsHistory_exp(String subsHistory_exp) {
		this.subsHistory_exp = subsHistory_exp;
	}
	
}
