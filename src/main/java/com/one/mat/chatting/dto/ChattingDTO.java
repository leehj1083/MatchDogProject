package com.one.mat.chatting.dto;

public class ChattingDTO {
	
	private int pro_idx = 0; // 프로필 id
	private int chatMsg_idx = 0;
	private int chat_idx = 0;
	private int pro_sendIdx = 0;
	private int pro_recvIdx = 0;
	private String chatMsg_msg = "";
	private String chatMsg_read = "";
	private String photo_fileName = "";
	private String breedType = "";
	private String pro_dogName = "";
	private String msgTime = "";
	
	
	public String getMsgTime() {
		return msgTime;
	}
	public void setMsgTime(String msgTime) {
		this.msgTime = msgTime;
	}
	public String getPhoto_fileName() {
		return photo_fileName;
	}
	public void setPhoto_fileName(String photo_fileName) {
		this.photo_fileName = photo_fileName;
	}
	public String getBreedType() {
		return breedType;
	}
	public void setBreedType(String breedType) {
		this.breedType = breedType;
	}
	public String getPro_dogName() {
		return pro_dogName;
	}
	public void setPro_dogName(String pro_dogName) {
		this.pro_dogName = pro_dogName;
	}

	public int getPro_idx() {
		return pro_idx;
	}
	public void setPro_idx(int pro_idx) {
		this.pro_idx = pro_idx;
	}
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

	
	

}
