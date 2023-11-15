package com.one.mat.alarm.dao;

import java.util.List;

import com.one.mat.alarm.dto.AlarmDTO;

public interface AlarmDAO {

	List<AlarmDTO> alarmListGo(int member_idx);

	int proSend(int member_idx);




	

}
