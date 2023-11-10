package com.one.mat.main.dto;

import java.sql.Date;

public class MatchingDTO {
	
	/*
	@Override
	public String toString() {
	    return "MatchingDTO{" +
	           "match_idx=" + match_idx +
	           ", pro_sendIdx=" + pro_sendIdx +
	           ", pro_recvIdx='" + pro_recvIdx + '\'' +
	           ", match_req='" + match_req + '\'' +
	           ", match_succeed=" + match_succeed +
	           ", pro_idx=" + pro_idx +
	           '}';
	}
	*/
	
	private int match_idx;
	private int pro_sendIdx;
	private int pro_recvIdx;
	private Date match_req;
	private String match_succeed;
	private int pro_idx; // 채팅리스트에서 상대방 프로필 불러오려고 넣었습니다.
	
	public int getMatch_idx() {
		return match_idx;
	}
	public void setMatch_idx(int match_idx) {
		this.match_idx = match_idx;
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
	public Date getMatch_req() {
		return match_req;
	}
	public void setMatch_req(Date match_req) {
		this.match_req = match_req;
	}
	public String getMatch_succeed() {
		return match_succeed;
	}
	public void setMatch_succeed(String match_succeed) {
		this.match_succeed = match_succeed;
	}
	public int getPro_idx() {
		return pro_idx;
	}
	public void setPro_idx(int pro_idx) {
		this.pro_idx = pro_idx;
	}
	
	

}
