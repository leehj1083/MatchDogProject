package com.one.mat.myPage.service;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.one.mat.myPage.dao.SubsDAO;

@Service
public class SubsService {

	Logger logger = LoggerFactory.getLogger(getClass());
	
	@Autowired SubsDAO dao;
	public void plusSubsDo(int idx) {
		dao.plusSubsDo(idx);
		
	}
	public void premiumSubsDo(int idx) {
		dao.premiumSubsDo(idx);
		
	}
	
	public void myPageSubsDeleteDo(int idx) {
		dao.myPageSubsDeleteDo(idx);
		
	}
	
}
