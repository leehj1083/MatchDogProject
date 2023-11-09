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
	public void plusSubsDo(int idx, String subsStartTime, String expirationTime) {
	    dao.plusSubsDo(idx);
	    logger.info("idx" + idx);
	    logger.info(subsStartTime);
	    logger.info(expirationTime);
	    dao.plusHistory(idx, subsStartTime, expirationTime);
	   
	}
	
	public void premiumSubsDo(int idx, String subsStartTime, String expirationTime) {
		dao.premiumSubsDo(idx);
		dao.premiumHistory(idx, subsStartTime, expirationTime);
	}
	
	public void myPageSubsDeleteDo(int idx) {
		dao.myPageSubsDeleteDo(idx);
		
	}
	
}
