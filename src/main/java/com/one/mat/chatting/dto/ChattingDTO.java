package com.one.mat.chatting.dto;

import java.sql.Date;

public class ChattingDTO {
	
	private int chatMsg_idx;
	private int chat_idx;
	private int pro_sendIdx;
	private int pro_recvIdx;
	private String chatMsg_msg;
	private String chatMsg_read;
	private Date chatMsg_regDate;
	
	public int getChatMsg_idx() {
		return chatMsg_idx;
	}
	public void setChatMsg_idx(int chatMsg_idx) {
		this.chatMsg_idx = chatMsg_idx;
	}
	public int getChat_idx() {
		return chat_idx;
	}
	public void setChat_idx(int chat_idx) {
		this.chat_idx = chat_idx;
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
	public String getChatMsg_msg() {
		return chatMsg_msg;
	}
	public void setChatMsg_msg(String chatMsg_msg) {
		this.chatMsg_msg = chatMsg_msg;
	}
	public String getChatMsg_read() {
		return chatMsg_read;
	}
	public void setChatMsg_read(String chatMsg_read) {
		this.chatMsg_read = chatMsg_read;
	}
	public Date getChatMsg_regDate() {
		return chatMsg_regDate;
	}
	public void setChatMsg_regDate(Date chatMsg_regDate) {
		this.chatMsg_regDate = chatMsg_regDate;
	}
	
	

}
