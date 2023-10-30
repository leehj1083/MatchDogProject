package com.one.mat.chatting.controller;

import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.one.mat.chatting.service.ChattingService;
import com.one.mat.member.dto.MemberDTO;

@Controller
public class ChattingController {

	Logger logger = LoggerFactory.getLogger(getClass());
	
	@Autowired
	ChattingService service;
	
	@RequestMapping(value="/")
	public String index() {
		return "login";
	}
	
	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public String login(Model model, HttpSession session, @RequestParam String id, @RequestParam String pw) {
		String page = "login";
		// 아이디와 패스워드를 제공을 해 주면 제한에 관한 정보를 담은 DTO 를 가지고 와 준다.
		MemberDTO dto = service.login(id, pw);
		if (dto != null) {
			// 1. 프로필이 있는지 / 2.로그인 금지 제재 여부 / 3. 구독 여부 / 4. 탈퇴 여부 -> dto에 넣을 정보
			session.setAttribute("loginInfo", dto); 
			page = "main"; // 채팅방 페이지로 이동
		} else { // 로그인 실패
			model.addAttribute("msg","아이디 또는 비밀번호를 확인해주세요.");
		}
		return page;
	}
	
	// 채팅방 페이지로 이동
	@RequestMapping(value="/chattingList.go")
	public String chattingListGo(Model model,HttpSession session) {
		String page = "login";
		MemberDTO dto = (MemberDTO) session.getAttribute("loginInfo");
		if(dto == null) { // 로그인 안했을 때
			model.addAttribute("msg","로그인해주세요.");
		}else if(dto.getMember_loginLock().equals("Y")) { // 제재당한 회원일 때
			model.addAttribute("msg","제재당한 회원입니다.");
		}else if(dto.getMember_quit().equals("Y")) { // 탈퇴한 회원일 때
			model.addAttribute("msg","탈퇴한 회원입니다.");
		}else { // 정상 로그인 시
			page = "test3";
		}
		// + 프로필 없으면 프로필 등록 페이지로
		return page;
	}
	
	@RequestMapping(value="/chattingList.do")
	public HashMap<String, Object> chattingListDo(@RequestParam String pagePerNum, @RequestParam String page) {
		logger.info("보여줄 페이지 : "+page);
		return service.chattingListDo(pagePerNum,page);
	}
	
}
