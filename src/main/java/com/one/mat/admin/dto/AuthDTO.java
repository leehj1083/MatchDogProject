package com.one.mat.admin.dto;


public class AuthDTO {
	private int subsType_code;
	private String subsType;
	private int subsType_price;
	private String subs_desc;
	private int authType_code;
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
	public int getSubsType_price() {
		return subsType_price;
	}
	public void setSubsType_price(int subsType_price) {
		this.subsType_price = subsType_price;
	}
	public String getSubs_desc() {
		return subs_desc;
	}
	public void setSubs_desc(String subs_desc) {
		this.subs_desc = subs_desc;
	}
	public int getAuthType_code() {
		return authType_code;
	}
	public void setAuthType_code(int authType_code) {
		this.authType_code = authType_code;
	}

}
