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
import com.one.mat.member.dto.PhotoDTO;
import com.one.mat.member.dto.ProfileDTO;

@Service
public class MatchingService {
	Logger logger = LoggerFactory.getLogger(getClass());
	@Autowired MatchingDAO dao;
   		

			public List<Map<String, Object>> matchingList(int member_idx, int pro_idx) {
				logger.info("matchingList");
				logger.info("dao.matchigList : "+dao.matchingList(member_idx,pro_idx));
				return dao.matchingList(member_idx, pro_idx);
			}
			public List<Map<String, Object>> unloginedMatchingList() {
				logger.info("unloginedMatchingList");
				return dao.unloginedMatchingList();
			}

			public ArrayList<ProfileDTO> MyProfileListDo(int member_idx) {
				return dao.MyProfileListDo(member_idx);
			}
		// 성향, 사진, 프로필 오픈 여부 가져오기		
			public List<ProfileDTO> charOpenList(int pro_Idx) {
				ArrayList<ProfileDTO> myProfileList = new ArrayList<ProfileDTO>();
				logger.info("charOpenList : " + pro_Idx);
					 ProfileDTO profileDTO = new ProfileDTO();
				    // 성향 정보를 가져옴
				    ArrayList<ProfileDTO> charTypeList = dao.charType(pro_Idx);

				    // 해당 프로필의 성향 정보를 프로필에 추가
				    profileDTO.setCharTypeList(charTypeList);
				    
				    // 사진 정보를 가져와야 함
//						    ArrayList<PhotoDTO> photoList = dao.photoList(pro_Idx);
//						    // 해당 프로필의 사진 정보를 프로필에 추가해야 함
//						    profileDTO.setPhotoList(photoList);
				    
				    // 나이 오픈 정보 가져오기
				    String pro_dogAgeOpen=dao.pro_dogAgeOpen(pro_Idx);
				    profileDTO.setPro_dogAgeOpen(pro_dogAgeOpen);
				    
				    // 성별 오픈 정보 가져오기
				    String pro_dogGenderOpen=dao.pro_dogGenderOpen(pro_Idx);
				    profileDTO.setPro_dogGenderOpen(pro_dogGenderOpen);

				    // 수정된 프로필을 myProfileList에 추가
				    myProfileList.add(profileDTO);

				    logger.info("성향들:" + charTypeList);
				    // logger.info("사진이름들:" + photoList);
				    logger.info("나이 오픈:" + pro_dogAgeOpen);
				    logger.info("성별 오픈:" + pro_dogGenderOpen);
				    logger.info("br");
					return myProfileList;
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
			
}
