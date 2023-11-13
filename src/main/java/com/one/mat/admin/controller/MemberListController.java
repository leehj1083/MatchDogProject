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

import com.one.mat.admin.dto.CompDTO;
import com.one.mat.admin.service.MemberListService;
import com.one.mat.board.controller.BoardController;
import com.one.mat.board.dto.BoardDTO;
import com.one.mat.member.dto.MemberDTO;
import com.one.mat.myPage.DTO.SubsDTO;

@Controller
public class MemberListController {

	Logger logger = LoggerFactory.getLogger(getClass());
	@Autowired MemberListService service;
	
	@RequestMapping(value="/memberList.go")
	public String memberList(HttpSession session, Model model) {
		MemberDTO dto = (MemberDTO) session.getAttribute("loginInfo");
		String page = "login";
		if(dto != null && dto.getSubsType_code()==4) {			
			page = "memberList";
		}else {
			model.addAttribute("msg","접근권한이 없습니다.");
		}
		return page;
	}
		
	@RequestMapping(value="/memberDetail", method=RequestMethod.GET)
	public String MemberDetail(HttpSession session, Model model, @RequestParam String member_idx){
		MemberDTO dto = (MemberDTO) session.getAttribute("loginInfo");
		String page = "login";
		if(dto != null && dto.getSubsType_code()==4) {			
			service.memberDetail(model, member_idx);
			page = "memberDetail";
		}else {
			model.addAttribute("msg","접근권한이 없습니다.");
		}		
		return page;
	}
	
	
	@RequestMapping(value="/memberList.do", method=RequestMethod.GET)
	@ResponseBody
	public HashMap<String, Object> memberList(HttpSession session, @RequestParam String searchType, 
			@RequestParam String searchKeyword, @RequestParam String pagePerNum,
	        @RequestParam int page, @RequestParam String subsType) {
		HashMap<String, Object>result = new HashMap<String, Object>();
		ArrayList<MemberDTO>list =service.memberList(searchType, searchKeyword, Integer.parseInt(pagePerNum), page, subsType);
		result.put("list", list);
		int pages = service.totalPage(Integer.parseInt(pagePerNum), searchType, searchKeyword, subsType);
		logger.info("페이지당 보여줄 게시글 수: " + pagePerNum);
	    logger.info("보여줄 페이지: " + page);
	    logger.info("검색 후 보여줄 총 페이지 수 : "+pages);
	    logger.info("검색타입: " + searchType);
	    logger.info("검색내용: " + searchKeyword);	   	
	    logger.info("구독등급 : "+ subsType);
		
		result.put("currPage", page);
		result.put("pages", pages);		
		return result; 
	}

	@RequestMapping(value="/memberAuthMod", method=RequestMethod.GET)
	public String memberAuthMod(HttpSession session, Model model, @RequestParam String subsType_code,
			@RequestParam String member_idx) {
		String page ="memberList";
		MemberDTO dto = (MemberDTO) session.getAttribute("loginInfo");
		if(dto != null && dto.getSubsType_code()==4) {
			service.memberAuthMod(subsType_code, member_idx);
			logger.info("선택된 유저번호 : "+member_idx);
			logger.info("선택된 권한값 : "+subsType_code);
			logger.info("수정되었습니다.");
			page = "redirect:./memberDetail?member_idx="+member_idx;
		}else {
			logger.info("수정에 실패하였습니다.");
		}				
		return page;
	}	
	
	@RequestMapping(value="/subsHistory.do")
	public String subsHistory(Model model, HttpSession session, @RequestParam String member_idx) {		
		logger.info("해당하는 회원 : "+member_idx);
		String page = "login";
		MemberDTO dto = (MemberDTO) session.getAttribute("loginInfo");
		if(dto != null && dto.getSubsType_code()==4) {	
			page = "subsHistory";
			ArrayList<SubsDTO>list=service.subsHistory(Integer.parseInt(member_idx));		
			model.addAttribute("list",list);
			model.addAttribute("size",list.size());
			
			MemberDTO member = service.getMemberId(Integer.parseInt(member_idx));
			model.addAttribute("member_id", member.getMember_id());
			model.addAttribute("member_idx", member.getMember_idx());
		}else {
			model.addAttribute("msg","접근권한이 없습니다.");
		}		
		return page;
	}
	
	@RequestMapping(value="/countUser.do", method=RequestMethod.GET)
	@ResponseBody
	public HashMap<String, Object> countUser(@RequestParam String searchType, 
			@RequestParam String searchKeyword, @RequestParam String subsType) {
		HashMap<String, Object>result = new HashMap<String, Object>();
		System.out.println("subsType :"+subsType);
		int cnt = service.countUser(searchType, searchKeyword, subsType);
		result.put("cnt", cnt);
	    logger.info("유저 수 : " + cnt);	   		
			    
		return result; 
	}
	
	@RequestMapping(value="/auth.go")
	public String auth(HttpSession session, Model model) {
		MemberDTO dto = (MemberDTO) session.getAttribute("loginInfo");
		String page = "login";
		if(dto != null && dto.getSubsType_code()==4) {			
			page = "auth";
		}else {
			model.addAttribute("msg","접근권한이 없습니다.");
		}
		return page;
	}
	
	@RequestMapping(value="/sancHistoryList.do")
	public String sancHistoryList(Model model, HttpSession session, @RequestParam String member_idx) {
		logger.info("해당하는 회원 : "+member_idx);
		String page = "login";
		MemberDTO dto = (MemberDTO) session.getAttribute("loginInfo");
		if(dto != null && dto.getSubsType_code()==4) {	
			page = "sancHistoryList";
			ArrayList<CompDTO>list=service.sancHistoryList(Integer.parseInt(member_idx));		
			model.addAttribute("list",list);
			model.addAttribute("size",list.size());
			
			MemberDTO member = service.getMemberId(Integer.parseInt(member_idx));
			model.addAttribute("member_id", member.getMember_id());
			model.addAttribute("member_idx", member.getMember_idx());
		}else {
			model.addAttribute("msg","접근권한이 없습니다.");
		}		
		return page;
	}
	
	
	
	
}
