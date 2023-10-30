package com.one.mat.myPage.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.one.mat.member.dto.MemberDTO;
import com.one.mat.myPage.dao.MyPageDAO;


@Service
public class MyPageService {

	@Autowired MyPageDAO dao;
	public boolean login(String id, String pw) {

		String loginId=dao.login(id,pw); 
		return loginId !=null;
	}
	public MemberDTO MyPageListDo(String id) {
		return dao.MyPageListDo(id);	
	}

}
