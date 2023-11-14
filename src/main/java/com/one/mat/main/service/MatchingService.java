package com.one.mat.main.service;

import java.util.ArrayList;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.one.mat.main.dao.MatchingDAO;
import com.one.mat.main.dto.ProOpenDTO;
import com.one.mat.member.dto.MatchAllDTO;
import com.one.mat.member.dto.PhotoDTO;
import com.one.mat.member.dto.ProfileDTO;

@Service
public class MatchingService {
	Logger logger = LoggerFactory.getLogger(getClass());
	@Autowired MatchingDAO dao;
		
		public ArrayList<ProfileDTO> MyProfileListDo(int member_idx) {
			return dao.MyProfileListDo(member_idx);
		}
		
		public ArrayList<MatchAllDTO> matchingList(int member_idx, int pro_idx, int count) {
			return dao.matchingList(member_idx, pro_idx, count);
		}
		
		public ArrayList<MatchAllDTO> noMeMatchingList(int member_idx) {
			return dao.noMeMatchingList(member_idx);
		}

		
		public ArrayList<MatchAllDTO> unloginedMatchingList() {
			return dao.unloginedMatchingList();
		}
		
		public int homeSend(Map<String, String> map) {
			logger.info("homeSend Service");
			logger.info("map/pro_recvIdx : " + map.get("pro_recvIdx"));
			logger.info("map/pro_sendIdx : " + map.get("pro_sendIdx"));
			return dao.homeSend(map) ;
		}
		
		public Map<String, Object> memberDetailListGO(int pro_idx) {
			return dao.memberDetailListGO(pro_idx);
			
		}
		public void matchingSendAlarm(int pro_sendIdx, int pro_recvIdx) {
			dao.matchingSendAlarm(pro_sendIdx, pro_recvIdx);
			
		}

		public ArrayList<PhotoDTO> memberDetailPhotoDo(int pro_idx) {
			return dao.memberDetailPhotoDo(pro_idx);
		}

		public ArrayList<ProOpenDTO> MatchingProOpenDo(int pro_idx) {
			return dao.MatchingProOpenDo(pro_idx);
		}
	
			
}
