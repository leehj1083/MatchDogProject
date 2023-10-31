package com.one.mat.member.service;

import java.util.HashMap;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.one.mat.member.dao.MemberDAO;
import com.one.mat.member.dto.MemberDTO;

@Service
public class MemberService {
	
	Logger logger = LoggerFactory.getLogger(getClass());
	@Autowired MemberDAO dao;
	
	public MemberDTO login(String id, String pw) {
		return dao.login(id, pw);
	}

	public boolean overlayId(String id) {
		boolean use = false;
		int cnt = dao.overlayId(id);
		if(cnt==0) {
			use=true;
		}
		return use;
	}

	public boolean overlayNick(String nickName) {
		boolean use = false;
		int cnt = dao.overlayNick(nickName);
		if(cnt==0) {
			use=true;
		}		
		return use;
	}
	
	public int join(HashMap<String, String> params) {
		int row = 0;
		row = dao.join(params);
		return row;
	}	
	

}
