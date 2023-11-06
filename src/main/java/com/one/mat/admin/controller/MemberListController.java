package com.one.mat.admin.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.one.mat.admin.service.MemberListService;
import com.one.mat.board.controller.BoardController;
import com.one.mat.member.dto.MemberDTO;

@Controller
public class MemberListController {

	Logger logger = LoggerFactory.getLogger(getClass());
	@Autowired MemberListService service;
	
	@RequestMapping(value="/memberList.go")
	public String memberList() {
		return "memberList";
	}
	
	@RequestMapping(value="/memberList.do")
	@ResponseBody
	public HashMap<String, Object> memberList(Model model, HttpSession session, @RequestParam String pagePerNum,
			@RequestParam String page) {		
		HashMap<String, Object> result = new HashMap<String, Object>();		
		MemberDTO dto = (MemberDTO) session.getAttribute("loginInfo");
		if(dto != null && dto.getSubsType_code()==4) {
			result.put("success", 1);
			logger.info("페이지당 보여줄 게시글 수 : "+pagePerNum);
			logger.info("보여줄 페이지 : "+page);
			int pages = service.totalPage(Integer.parseInt(pagePerNum));
			logger.info("만들 수 있는 총 페이지 수 : "+pages);
			
			ArrayList<MemberDTO> list = service.memberList(Integer.parseInt(pagePerNum), Integer.parseInt(page));
			result.put("pages", pages);
			result.put("list", list);
			result.put("size", list.size());
		}else {
			result.put("success", -1);
		}		
		return result;
	}	
	
	
	@RequestMapping(value="/memberDetail", method=RequestMethod.GET)
	public String MemberDetail(HttpSession session, Model model, @RequestParam String member_idx){
		MemberDTO dto = (MemberDTO) session.getAttribute("loginInfo");
		if(dto != null && dto.getSubsType_code()==4) {			
			service.memberDetail(model, member_idx);
		}else {
			model.addAttribute("msg","접근권한이 없습니다.");
		}		
		return "memberDetail";
	}
	
	
	@RequestMapping(value="/memberSearch.do", method=RequestMethod.GET)
	@ResponseBody
	public HashMap<String, Object> memberSearch(HttpSession session, @RequestParam String searchType, 
			@RequestParam String searchKeyword, @RequestParam String pagePerNum,
	        @RequestParam String page) {
		
		logger.info("페이지당 보여줄 게시글 수: " + pagePerNum);
	    logger.info("보여줄 페이지: " + page);
	    logger.info("검색타입: " + searchType);
	    logger.info("검색내용: " + searchKeyword);	   
	    
		return service.memberSearch(searchType, searchKeyword, Integer.parseInt(pagePerNum), Integer.parseInt(page));
	}

	
	
	
}
