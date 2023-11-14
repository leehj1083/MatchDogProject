package com.one.mat.alarm.service;

import java.util.ArrayList;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.one.mat.alarm.dao.AlarmDAO;
import com.one.mat.alarm.dto.AlarmDTO;

@Service
public class AlarmService {
	Logger logger = LoggerFactory.getLogger(getClass());
	@Autowired AlarmDAO dao;


	public void alarmListGo(Model model, int member_idx) {
		logger.info("alaramListGO!");
		List<AlarmDTO> alarmList = new ArrayList<AlarmDTO>();
		alarmList = dao.alarmListGo(member_idx);
		logger.info("alarmList!! : "+alarmList );
		model.addAttribute("alarmList",alarmList);
	
	}


	
}
