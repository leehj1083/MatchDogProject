package com.one.mat.admin.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.one.mat.admin.dao.MemberListDAO;
import com.one.mat.member.dto.MemberDTO;

@Service
public class MemberListService {

	Logger logger = LoggerFactory.getLogger(getClass());
	@Autowired MemberListDAO dao;
	
	public ArrayList<MemberDTO> memberList(int pagePerNum, int page) {
		// pagePerNum과 page를 가지고 offset을 계산하기
		// SELECT * FROM 테이블명 ORDERS LIMIT 숫자(A) OFFSET 숫자(B)
		// 위 쿼리는 (B+1) 행 부터 A 행 만큼 출력을 합니다.
		int offset = 0;
		offset = (page-1)*pagePerNum;
		
		return dao.memberList(pagePerNum, offset);
	}
	
	public int totalPage(int pagePerNum) {
		return dao.totalPage(pagePerNum);
	}

	public void memberDetail(Model model, String member_idx) {
		MemberDTO dto = dao.memberDetail(member_idx);
		logger.info("dto형식의 멤버값 : "+dto);
		model.addAttribute("dto", dto);
	}

	public HashMap<String, Object> memberSearch(String searchType, String searchKeyword, int pagePerNum,
			int page) {		
		HashMap<String, Object> result = new HashMap<String, Object>();
		int offset = (page-1)*pagePerNum;
		ArrayList<MemberDTO>list = dao.memberSearch(searchType, searchKeyword, pagePerNum, offset);				
		int pages = dao.totalPageWithSearch(pagePerNum, searchType, searchKeyword);
		logger.info("페이지당 보여줄 게시글 수 : "+pagePerNum);
		logger.info("보여줄 페이지 : "+page);		
		logger.info("검색 후 보여줄 총 페이지 수 : "+pages);
		if(page > pages) {
			page = pages;
		};
		result.put("currPage", page);
		result.put("pages", pages);
		result.put("list", list);
		    
		return result;
	}

	
	
	
}
