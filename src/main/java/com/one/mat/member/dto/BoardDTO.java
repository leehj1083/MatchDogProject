package com.one.mat.member.dto;

import java.sql.Date;

public class BoardDTO {

	private int board_idx;
	private String board_subject;
	private String board_content;
	private String board_user_name;
	private int board_bHit;
	private Date board_reg_date;
	private int img;
	
	private int idx;
	public int getImg() {
		return img;
	}
	public void setImg(int img) {
		this.img = img;
	}
	private String subject;
	private String content;
	private String user_name;
	private  int bHit;
	public int getIdx() {
		return idx;
	}
	public void setIdx(int idx) {
		this.idx = idx;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getUser_name() {
		return user_name;
	}
	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}
	public int getbHit() {
		return bHit;
	}
	public void setbHit(int bHit) {
		this.bHit = bHit;
	}
	public Date getReg_date() {
		return reg_date;
	}
	public void setReg_date(Date reg_date) {
		this.reg_date = reg_date;
	}
	private Date reg_date;
	
	public int getBoard_idx() {
		return board_idx;
	}
	public void setBoard_idx(int board_idx) {
		this.board_idx = board_idx;
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
	public String getBoard_user_name() {
		return board_user_name;
	}
	public void setBoard_user_name(String board_user_name) {
		this.board_user_name = board_user_name;
	}
	public int getBoard_bHit() {
		return board_bHit;
	}
	public void setBoard_bHit(int board_bHit) {
		this.board_bHit = board_bHit;
	}
	public Date getBoard_reg_date() {
		return board_reg_date;
	}
	public void setBoard_reg_date(Date board_reg_date) {
		this.board_reg_date = board_reg_date;
	}

	
	
}
