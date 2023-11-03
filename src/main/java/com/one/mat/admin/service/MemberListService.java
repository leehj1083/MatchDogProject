package com.one.mat.admin.service;

import java.util.ArrayList;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.one.mat.admin.dao.MemberListDAO;
import com.one.mat.member.dto.MemberDTO;

@Service
public class MemberListService {

	Logger logger = LoggerFactory.getLogger(getClass());
	@Autowired MemberListDAO dao;
	
	public ArrayList<MemberDTO> memberList() {
		return dao.memberList();
	}
	
}
