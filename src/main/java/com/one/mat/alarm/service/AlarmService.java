package com.one.mat.alarm.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.one.mat.alarm.dao.AlarmDAO;
import com.one.mat.alarm.dto.AlarmDTO;

@Service
public class AlarmService {
	@Autowired AlarmDAO dao;

//	public void alarmListGo(Model model, int member_idx) {
//		List<AlarmDTO> alarmList = new ArrayList<AlarmDTO>();
//		alarmList.add(dao.alarmListGo(member_idx));
//		model.addAttribute("alarmList",alarmList);
//	}
}
