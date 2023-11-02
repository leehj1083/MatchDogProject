package com.one.mat.main.service;

import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.one.mat.main.dao.MatchingDAO;
import com.one.mat.member.dto.ProfileDTO;

@Service
public class MatchingService {
	Logger logger = LoggerFactory.getLogger(getClass());
	@Autowired MatchingDAO dao;
	
	public List<Map<String, Object>> matchingList(Map<String, Integer> params) {
		logger.info("matchingList");
		return dao.matchingList();
	}

	public List<String> matchingListCharType4(int member_idx, int pro_idx) {
		logger.info("matchingListCharType4");
		return dao.matchingListCharType4();
	}

	public List<String> matchingListCharType3(int member_idx, int pro_idx) {
		logger.info("matchingListCharType3");
		return dao.matchingListCharType3();
	}

	public List<String> matchingListCharType2(int member_idx, int pro_idx) {
		logger.info("matchingListCharType2");
		return dao.matchingListCharType2();
	}

	public List<String> matchingListCharType1(int member_idx, int pro_idx) {
		logger.info("matchingListCharType1");
		return dao.matchingListCharType1();
	}


}
