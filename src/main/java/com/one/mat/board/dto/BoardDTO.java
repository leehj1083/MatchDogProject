package com.one.mat.board.dto;

import java.sql.Date;

public class BoardDTO {
	
	/*
	@Override
	public String toString() {
	    return "BoardDTO{" +
	           "board_id=" + board_id +
	           ", member_idx=" + member_idx +
	           ", board_subject='" + board_subject + '\'' +
	           ", board_content='" + board_content + '\'' +
	           ", board_regDate=" + board_regDate +
	           ", board_bHit=" + board_bHit +
	           ", board_modDate=" + board_modDate +
	           ", board_hidden='" + board_hidden + '\'' +
	           ", board_notice='" + board_notice + '\'' +
	           ", board_noticeFix='" + board_noticeFix + '\'' +
	           ", member_nickName='" + member_nickName + '\'' +
	           '}';
	}
	*/

	private int board_id;
	private int member_idx;
	private String board_subject;
	private String board_content;
	private Date board_regDate;
	private int board_bHit;
	private Date board_modDate;
	private String board_hidden;
	private String board_notice;
	private String board_noticeFix;
	private String member_nickName;
	
	private int reply;
	private int img;
	
	public int getReply() {
		return reply;
	}
	public void setReply(int reply) {
		this.reply = reply;
	}
	public int getImg() {
		return img;
	}
	public void setImg(int img) {
		this.img = img;
	}
	public String getMember_nickName() {
		return member_nickName;
	}
	public void setMember_nickName(String member_nickName) {
		this.member_nickName = member_nickName;
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
	public String getBoard_subject() {
		return board_subject;
	}
	public void setBoard_subject(String board_subject) {
		this.board_subject = board_subject;
	}
	public String getBoard_content() {
		return board_content;
	}
	public void setBoard_content(String board_content) {
		this.board_content = board_content;
	}
	public Date getBoard_regDate() {
		return board_regDate;
	}
	public void setBoard_regDate(Date board_regDate) {
		this.board_regDate = board_regDate;
	}
	public int getBoard_bHit() {
		return board_bHit;
	}
	public void setBoard_bHit(int board_bHit) {
		this.board_bHit = board_bHit;
	}
	public Date getBoard_modDate() {
		return board_modDate;
	}
	public void setBoard_modDate(Date board_modDate) {
		this.board_modDate = board_modDate;
	}
	public String getBoard_hidden() {
		return board_hidden;
	}
	public void setBoard_hidden(String board_hidden) {
		this.board_hidden = board_hidden;
	}
	public String getBoard_notice() {
		return board_notice;
	}
	public void setBoard_notice(String board_notice) {
		this.board_notice = board_notice;
	}
	public String getBoard_noticeFix() {
		return board_noticeFix;
	}
	public void setBoard_noticeFix(String board_noticeFix) {
		this.board_noticeFix = board_noticeFix;
	}
	
	
}
