package com.one.mat.myPage.service;

import java.util.ArrayList;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.one.mat.member.dto.MemberDTO;
import com.one.mat.member.dto.ProfileDTO;
import com.one.mat.myPage.dao.MyProfileDAO;


@Service
public class MyProfileService {

	@Autowired MyProfileDAO dao;
	
	public void MyProfileListDo(int idx, Model model) {
		ArrayList<ProfileDTO> myProfile= dao.MyProfileListDo(idx);
		
		ArrayList<ProfileDTO> charTypeList=dao.charType(idx);
		model.addAttribute("myProfile", myProfile);
		model.addAttribute("charTypeList", charTypeList);
	
	}
	/*
	public int myProfileModUpdateDo(Map<String, String> params) {
		return dao.myProfileModUpdateDo(params);
		
	}
	public void myProfileDelDo(String pro_idx) {
		dao.myProfileDelDo(pro_idx);
		
	}
	*/
	}



