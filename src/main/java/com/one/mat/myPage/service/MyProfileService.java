package com.one.mat.myPage.service;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.one.mat.member.dto.MemberDTO;
import com.one.mat.myPage.dao.MyProfileDAO;


@Service
public class MyProfileService {

	@Autowired MyProfileDAO dao;
	
	public MemberDTO MyProfileListDo(int idx) {
		return dao.MyProfileListDo(idx);	
	}
	public int myProfileModUpdateDo(Map<String, String> params) {
		return dao.myProfileModUpdateDo(params);
		
	}



}
