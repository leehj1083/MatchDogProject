package com.one.mat.matchList.controller;

import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.one.mat.matchList.service.MatchListService;
import com.one.mat.member.dto.MemberDTO;

@Controller
public class MatchListController {
	
	Logger logger = LoggerFactory.getLogger(getClass());
	
	@Autowired
	MatchListService service;
	
	// 매칭받은 리스트 페이지로 이동
//	@RequestMapping(value="/recvMatchingList.go")
//	public String recvMatchingListGo(Model model,HttpSession session) {
//		String page = "login";
//		MemberDTO dto = (MemberDTO) session.getAttribute("loginInfo");
//		if(dto == null) { // 로그인 안했을 때
//			model.addAttribute("msg","로그인해주세요.");
//		}else if(dto.getMember_loginLock().equals("Y")) { // 제재당한 회원일 때
//			model.addAttribute("msg","제재당한 회원입니다.");
//		}else if(dto.getMember_quit().equals("Y")) { // 탈퇴한 회원일 때
//			model.addAttribute("msg","탈퇴한 회원입니다.");
//		}else { // 정상 로그인 시
//			page = "recvMatchingList";
//		}
//		// + 프로필 없으면 프로필 등록 페이지로
//		return page;
//	}
//	
//	// 매칭받은 리스트 뿌려주기
//	@RequestMapping(value="/recvMatchingList.do")
//	@ResponseBody
//	public HashMap<String, Object> recvMatchingListDo(@RequestParam String pagePerNum, @RequestParam String page, HttpSession session) {
//		MemberDTO dto = (MemberDTO) session.getAttribute("loginInfo");
//		int memberIdx = dto.getMember_idx();
//		return service.recvMatchingListDo(pagePerNum,page,memberIdx);
//	}

}
