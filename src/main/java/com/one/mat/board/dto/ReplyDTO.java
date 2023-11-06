package com.one.mat.board.dto;

import java.sql.Date;

public class ReplyDTO {

	private int reply_id;
	private int member_idx;
	private int board_id;
	private String reply_content;
	private Date reply_regDate;
	private Date reply_modDate;
	private String reply_hidden;
	private String member_nickName;
	
	public String getMember_nickName() {
		return member_nickName;	
	}
	public void setMember_nickName(String member_nickName) {
		this.member_nickName = member_nickName;
	}
	public int getReply_id() {
		return reply_id;
	}
	public void setReply_id(int reply_id) {
		this.reply_id = reply_id;
	}
	public int getMember_idx() {
		return member_idx;
	}
	public void setMember_idx(int member_idx) {
		this.member_idx = member_idx;
	}
	public int getBoard_id() {
		return board_id;
	}
	public void setBoard_id(int board_id) {
		this.board_id = board_id;
	}
	public String getReply_content() {
		return reply_content;
	}
	public void setReply_content(String reply_content) {
		this.reply_content = reply_content;
	}
	public String getReply_regDate() {
		return reply_regDate.toString();
	}
	public void setReply_regDate(Date reply_regDate) {
		this.reply_regDate = reply_regDate;
	}
	public Date getReply_modDate() {
		return reply_modDate;
	}
	public void setReply_modDate(Date reply_modDate) {
		this.reply_modDate = reply_modDate;
	}
	public String getReply_hidden() {
		return reply_hidden;
	}
	public void setReply_hidden(String reply_hidden) {
		this.reply_hidden = reply_hidden;
	}

	
}
