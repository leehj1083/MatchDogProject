package com.one.mat.main.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.one.mat.main.dao.MatchingDAO;
import com.one.mat.member.dto.ProfileDTO;

@Service
public class MatchingService {
	Logger logger = LoggerFactory.getLogger(getClass());
	@Autowired MatchingDAO dao;
   		
//   		public List<String> matchingListCharType4(int member_idx, int pro_idx) {
//   			logger.info("matchingListCharType4");
//   			return dao.matchingListCharType4();
//   		}

			public List<Map<String, Object>> matchingList(int member_idx, int pro_idx) {
				logger.info("matchingList");
				logger.info("dao.matchigList : "+dao.matchingList(member_idx,pro_idx));
				return dao.matchingList(member_idx, pro_idx);
				
			}

			public ArrayList<ProfileDTO> MyProfileListDo(int member_idx) {
				return dao.MyProfileListDo(member_idx);
			}

			public ArrayList<String> charType(int pro_idx) {
				return dao.matchingCharType(pro_idx);
			}

			public ArrayList<String> photo_fileName(int pro_idx) {
				return dao.photo_fileName(pro_idx);
			}

			public String homeSend(int pro_idx, Map<String, String> pro_recvIdx) {
				Map<String, String> map = new HashMap<String, String>();
				// map.put("pro_recvIdx", pro_recvIdx);
				map.put("pro_idx", Integer.toString(pro_idx));
				
				logger.info("Pro_idx, pro_recvIdc:"+pro_idx +":"+pro_recvIdx);
				String msg = "";
				if(dao.homeSend(map)==1) {
					msg = "요청이 전송되었습니다";
				}else {
					msg = "요청 전송되지 못했습니다";
				}
				return msg;
			}
}

