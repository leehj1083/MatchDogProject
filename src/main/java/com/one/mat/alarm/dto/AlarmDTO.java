package com.one.mat.alarm.dto;

import java.sql.Date;

public class AlarmDTO {
	private int alarm_id;
	private int pro_recvIdx;  // 로그인한 사용자
	private int pro_sendIdx;  // 알림을 보낸 사용자
	private int alarm_type;
	private int alarm_idfNum;
	private Date alarm_genDate;
	private String alarm_msg;
	private String alarm_readCheck;
	private String photo_fileName;
	public int getAlarm_id() {
		return alarm_id;
	}
	public void setAlarm_id(int alarm_id) {
		this.alarm_id = alarm_id;
	}
	public int getpro_recvIdx() {
		return pro_recvIdx;
	}
	public void setpro_recvIdx(int pro_recvIdx) {
		this.pro_recvIdx = pro_recvIdx;
	}
	public int getpro_sendIdx() {
		return pro_sendIdx;
	}
	public void setpro_sendIdx(int pro_sendIdx) {
		this.pro_sendIdx = pro_sendIdx;
	}
	public int getAlarm_type() {
		return alarm_type;
	}
	public void setAlarm_type(int alarm_type) {
		this.alarm_type = alarm_type;
	}
	public int getAlarm_idfNum() {
		return alarm_idfNum;
	}
	public void setAlarm_idfNum(int alarm_idfNum) {
		this.alarm_idfNum = alarm_idfNum;
	}
	public Date getAlarm_genDate() {
		return alarm_genDate;
	}
	public void setAlarm_genDate(Date alarm_genDate) {
		this.alarm_genDate = alarm_genDate;
	}
	public String getAlarm_msg() {
		return alarm_msg;
	}
	public void setAlarm_msg(String alarm_msg) {
		this.alarm_msg = alarm_msg;
	}
	public String getAlarm_readCheck() {
		return alarm_readCheck;
	}
	public void setAlarm_readCheck(String alarm_readCheck) {
		this.alarm_readCheck = alarm_readCheck;
	}
	public String getPhoto_fileName() {
		return photo_fileName;
	}
	public void setPhoto_fileName(String photo_fileName) {
		this.photo_fileName = photo_fileName;
	}
	
}
