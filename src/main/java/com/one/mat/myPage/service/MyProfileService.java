package com.one.mat.myPage.service;

import java.util.ArrayList;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.one.mat.member.dto.ProfileDTO;
import com.one.mat.myPage.dao.MyProfileDAO;


@Service
public class MyProfileService {

	Logger logger=LoggerFactory.getLogger(getClass());
	@Autowired MyProfileDAO dao;

	public void MyProfileListDo(int idx, Model model) {


		ArrayList<ProfileDTO> myProfileList = new ArrayList<ProfileDTO>();

		ArrayList<ProfileDTO> myProfile = dao.MyProfileListDo(idx);

		for (ProfileDTO profileDTO : myProfile) {
		    int pro_idx = profileDTO.getPro_idx();

		    // 성향 정보를 가져옴
		    ArrayList<String> charTypeList = dao.charType(pro_idx);

		    // 해당 프로필의 성향 정보를 프로필에 추가
		    profileDTO.setCharTypeList(charTypeList);
		    
		    // 사진 정보를 가져와야 함
		    ArrayList<String> photo_fileNameList = dao.photo_fileName(pro_idx);
		    // 해당 프로필의 사진 정보를 프로필에 추가해야 함
		    profileDTO.setPhoto_fileNameList(photo_fileNameList);
		    
		    // 나이 오픈 정보 가져오기
		    String pro_dogAgeOpen=dao.pro_dogAgeOpen(pro_idx);
		    profileDTO.setPro_dogAgeOpen(pro_dogAgeOpen);
		    
		    // 성별 오픈 정보 가져오기
		    String pro_dogGenderOpen=dao.pro_dogGenderOpen(pro_idx);
		    profileDTO.setPro_dogGenderOpen(pro_dogGenderOpen);



		    // 수정된 프로필을 myProfileList에 추가
		    myProfileList.add(profileDTO);

		    logger.info("성향들:" + charTypeList);
		    logger.info("성향들:" + photo_fileNameList);
		    logger.info("나이 오픈:" + pro_dogAgeOpen);
		    logger.info("성별 오픈:" + pro_dogGenderOpen);
		    logger.info("br");
		}
		
		model.addAttribute("myProfile", myProfileList);
		/* model.addAttribute("charType", charTypeList); */
	
	}

	public void myProfileOpenDo(int pro_idx, int openType_code, String toggleValue) {
		dao.myProfileOpenDo(pro_idx, openType_code, toggleValue);
		
	}


	}



