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
	
	public MemberDTO login(String member_id, String member_pw) {
		return dao.login(member_id, member_pw);
	}

	public boolean overlayId(String member_id) {
		boolean use = false;
		int cnt = dao.overlayId(member_id);
		if(cnt==0) {
			use=true;
		}
		return use;
	}

	public boolean overlayNick(String member_nickName) {
		boolean use = false;
		int cnt = dao.overlayNick(member_nickName);
		if(cnt==0) {
			use=true;
		}		
		return use;
	}

	public int join(HashMap<String, String> params) {
		
		int row = 0;
		row = dao.join(params);
		setSubsType_code(params);
			
		return row;
	}

	private void setSubsType_code(HashMap<String, String> params) {
		dao.setSubsType_code(Integer.parseInt(String.valueOf(params.get("member_idx"))));
	}

	
	

}
