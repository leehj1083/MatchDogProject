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
		dto.setBreedType(params.get("BreedType"));
		dto.setPro_dogName(params.get("pro_dogName"));
		String dogAgeStr = params.get("pro_dogAge");
		int dogAge = Integer.parseInt(dogAgeStr);
		dto.setPro_dogAge(dogAge);
		dto.setPro_dogGender(params.get("pro_dogGender"));
		dto.setCharType(params.get("CharType"));
		dto.setPro_dogDesc(params.get("pro_dogDesc"));
		
		dao.writemyProfile(dto);
		
		
		String page = "redirect:/regProfile";
		
		return page;
	}

	public ArrayList<ProfileDTO> list() {
	
		return dao.list();
	}

	

}
