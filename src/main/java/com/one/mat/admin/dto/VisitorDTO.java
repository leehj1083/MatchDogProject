package com.one.mat.admin.dto;

public class VisitorDTO {
	
	private String visit_date;	
	private int visit_count;
	private int member_idx;
	private int visit_week;
	private int visit_month;
	
	
	public String getVisit_date() {
		return visit_date;
	}
	public void setVisit_date(String visit_date) {
		this.visit_date = visit_date;
	}
	public int getVisit_week() {
		return visit_week;
	}
	public void setVisit_week(int visit_week) {
		this.visit_week = visit_week;
	}
	public int getVisit_month() {
		return visit_month;
	}
	public void setVisit_month(int visit_month) {
		this.visit_month = visit_month;
	}	

	public int getVisit_count() {
		return visit_count;
	}
	public void setVisit_count(int visit_count) {
		this.visit_count = visit_count;
	}
	public int getMember_idx() {
		return member_idx;
	}
	public void setMember_idx(int member_idx) {
		this.member_idx = member_idx;
	}

}
