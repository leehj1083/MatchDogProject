package com.one.mat.main.service;

import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.one.mat.main.dao.MatchingDAO;

@Service
public class MatchingService {
	Logger logger = LoggerFactory.getLogger(getClass());
	@Autowired MatchingDAO dao;
	
	
	public List<Map<String, Object>> matchingList() {
		logger.info("MatchingService");
		return dao.matchingList();
	}

}
