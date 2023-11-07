package com.one.mat.admin.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.one.mat.admin.dao.MemberListDAO;
import com.one.mat.board.dto.BoardDTO;
import com.one.mat.member.dto.MemberDTO;

@Service
public class MemberListService {

	Logger logger = LoggerFactory.getLogger(getClass());
	@Autowired MemberListDAO dao;

	public void memberDetail(Model model, String member_idx) {
		MemberDTO dto = dao.memberDetail(member_idx);
		logger.info("dto형식의 멤버값 : "+dto);
		model.addAttribute("dto", dto);
	}

	public ArrayList<MemberDTO> memberList(String searchType, String searchKeyword, int pagePerNum,
			int page) {		
		
		int offset = (page-1)*pagePerNum;					    
		return dao.memberList(searchType, searchKeyword, pagePerNum, offset);
	}
	
	public int totalPage(int pagePerNum, String searchType, String searchKeyword) {
		return dao.totalPage(pagePerNum, searchType, searchKeyword);
	}	

	public void memberAuthMod(String subsType_code, String member_idx) {		
		dao.memberAuthMod(Integer.parseInt(subsType_code), Integer.parseInt(member_idx));
	}

	public ArrayList<BoardDTO> subsHistory(Model model, int member_idx) {
		return dao.subsHistory(member_idx);
	}

	public int countUser(String searchType, String searchKeyword) {
		return dao.countUser(searchType, searchKeyword);
	}

	

	

	
	
	
}
