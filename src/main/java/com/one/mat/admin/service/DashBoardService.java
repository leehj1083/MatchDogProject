package com.one.mat.admin.service;

import java.util.ArrayList;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.one.mat.admin.dao.DashBoardDAO;
import com.one.mat.myPage.DTO.SubsDTO;

@Service
public class DashBoardService {

	Logger logger = LoggerFactory.getLogger(getClass());
	@Autowired DashBoardDAO dao;
	
	public ArrayList<SubsDTO> getDailySales() {
		return dao.getDailySales();
	}


	
}
