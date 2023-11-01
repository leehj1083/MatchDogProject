package com.one.mat.member.service;

import java.util.ArrayList;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.one.mat.member.dao.RegProfileDAO;
import com.one.mat.member.dto.ProfileDTO;

@Service
public class RegProfileService {
	
	Logger logger = LoggerFactory.getLogger(getClass());
	@Autowired
	RegProfileDAO dao;

	public String writemyProfile(Map<String, String> params) {
		ProfileDTO dto = new ProfileDTO();
		
		dto.setPro_dogName(params.get("pro_dogName"));
		String dogAgeStr = params.get("pro_dogAge");
		int dogAge = Integer.parseInt(dogAgeStr);
		dto.setPro_dogAge(dogAge);
		dto.setPro_dogGender(params.get("pro_dogGender"));
		dto.setPro_dogDesc(params.get("pro_dogDesc"));
		dto.setPro_idx(dogAge);
		String breedType_codeStr = params.get("breedType_code");
		int breedType_code = Integer.parseInt(breedType_codeStr);
		dto.setPro_dogAge(breedType_code);
		
		
		
		dao.writemyProfile(dto);
		
		
		
		String page = "redirect:/home2";
		
		return page;
	}

	public ArrayList<ProfileDTO> list() {
	
		return dao.list();
	}

	public ArrayList<ProfileDTO> list2() {
		
		return dao.list2();
	}



	public void breedTypeSave(int bt_code) {
		
		dao.breedTypeSave(bt_code);
		
	}

	public void charSave(Map<String, Integer> charTypeMap) {
		dao.charSave(charTypeMap);
		
	}



	

	

}
