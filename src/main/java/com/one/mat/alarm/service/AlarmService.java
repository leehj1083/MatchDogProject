package com.one.mat.alarm.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.one.mat.alarm.dao.AlarmDAO;
import com.one.mat.member.dto.ProfileDTO;

@Service
public class AlarmService {
	@Autowired AlarmDAO dao;

	public ArrayList<ProfileDTO> MyProfileListDo(int member_idx) {
		// TODO Auto-generated method stub
		return null;
	}
}
