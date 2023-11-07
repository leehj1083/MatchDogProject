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

			public int homeSend(Map<String, String> map) {
				logger.info("homeSend Service");
				logger.info("map/pro_recvIdx : " + map.get("pro_recvIdx"));
				logger.info("map/pro_sendIdx : " + map.get("pro_sendIdx"));
				
				return dao.homeSend(map) ;
			}

			public void recvMatchingListDo(int member_idx, Model model) {


				ArrayList<ProfileDTO> myProfileList = new ArrayList<ProfileDTO>();

				ArrayList<ProfileDTO> myProfile = dao.MyProfileListDo(member_idx);

				for (ProfileDTO profileDTO : myProfile) {
				    int pro_idx = profileDTO.getPro_idx();

				    // 나에게 매칭 요청한 강아지의 성향 가져오기
				    // ArrayList<String> charTypeList = dao.charType(pro_idx);

				    // 해당 프로필의 성향 정보를 프로필에 추가
				    // profileDTO.setCharTypeList(charTypeList);
				    
				    // 사진 정보를 가져와야 함
				    ArrayList<String> photo_fileNameList = dao.photo_fileName(pro_idx);
				    // 해당 프로필의 사진 정보를 프로필에 추가해야 함
				    profileDTO.setPhoto_fileNameList(photo_fileNameList);
				    

				    // 수정된 프로필을 myProfileList에 추가
				    myProfileList.add(profileDTO);

				    // logger.info("성향들:" + charTypeList);
				    logger.info("성향들:" + photo_fileNameList);
				    logger.info("br");
				}
				
				model.addAttribute("myProfile", myProfileList);
				/* model.addAttribute("charType", charTypeList); */
			
			}

			public Map<String, Object> memberDetailListGO(int pro_idx) {
				return dao.memberDetailListGO(pro_idx);
				
			}
}

