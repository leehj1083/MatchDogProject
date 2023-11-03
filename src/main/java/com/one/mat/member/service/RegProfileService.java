package com.one.mat.member.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.one.mat.member.dao.RegProfileDAO;
import com.one.mat.member.dto.MemberDTO;
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
		
		String memberIdxStr = params.get("memberIdx");
		int memberIdx = Integer.parseInt(memberIdxStr);
		dto.setMember_idx(memberIdx);
		
		
		
		
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

	public void photos1(String ph_1) {
		dao.photos1(ph_1);
		
	}

	public void photos2(String ph_2) {
		dao.photos2(ph_2);
		
	}

	public void photos3(String ph_3) {
		dao.photos3(ph_3);
		
	}

	public void photos4(String ph_4) {
		dao.photos4(ph_4);
		
	}

	public void photos5(String ph_5) {
		dao.photos5(ph_5);
		
	}

	public void photos6(String ph_6) {
		dao.photos6(ph_6);
		
	}

	public void photos7(String ph_7) {
		dao.photos7(ph_7);
		
	}

	public void photos8(String ph_8) {
		dao.photos8(ph_8);
		
	}

	public void photos9(String ph_9) {
		dao.photos9(ph_9);
		
	}

	public void home3() {
		dao.home3();
		
	}

	public void proReq(MemberDTO memberDTO) {
		dao.proReq(memberDTO);
		
	}

	public ArrayList<ProfileDTO> compList() {
		
		return dao.compList();
	}



	


	



	

	

}
