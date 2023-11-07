package com.one.mat.board.dto;

public class RecommendDTO {
	
	private int rec_id;
	private int board_id;
	private int member_idx;
	private int rec_type;
	private int checkCount; // 추천갯수Count해서 가져옴
	
	public int getCheckCount() {
		return checkCount;
	}
	public void setCheckCount(int checkCount) {
		this.checkCount = checkCount;
	}
	public int getRec_id() {
		return rec_id;
	}
	public void setRec_id(int rec_id) {
		this.rec_id = rec_id;
	}
	public int getBoard_id() {
		return board_id;
	}
	public void setBoard_id(int board_id) {
		this.board_id = board_id;
	}
	public int getMember_idx() {
		return member_idx;
	}
	public void setMember_idx(int member_idx) {
		this.member_idx = member_idx;
	}
	public int getRec_type() {
		return rec_type;
	}
	public void setRec_type(int rec_type) {
		this.rec_type = rec_type;
	}
	

}
