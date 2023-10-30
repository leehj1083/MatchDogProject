package com.one.mat.myPage.controller;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.one.mat.member.dto.MemberDTO;
import com.one.mat.myPage.service.MyPageService;


@Controller
public class MyPageController {

	Logger logger = LoggerFactory.getLogger(getClass());
	
	@Autowired MyPageService service;
	
	/*
	 * @RequestMapping(value="/login") public String login(HttpSession session,Model
	 * model, @RequestParam String id, @RequestParam String pw) {
	 * logger.info(id+"/"+pw); String page="login"; boolean success
	 * =service.login(id, pw); logger.info("success : "+success);
	 * 
	 * if(success) { // page = "list"; <- list.jsp // page = "redirect:/list"; <-
	 * controller 의 /list 요청을 해라
	 * 
	 * page="redirect:/myPageList.do"; session.setAttribute("loginId", id);
	 * 
	 * }else { model.addAttribute("msg", "아이디 또는 비밀번호를 확인하세요!"); }
	 * 
	 * return page; }
	 */
	
	@RequestMapping(value="/myPageList.do")
	public String myPageListDo(Model model, HttpSession session) {
		logger.info("마이페이지 list 요청 받음");
		String page="login";
		String msg="로그인이 필요한 서비스입니다.";
		if(session.getAttribute("loginInfo") != null) { // 로그인 했을 경우만 내용을 실행
			page="myPage";
			msg="";
			MemberDTO dto = (MemberDTO) session.getAttribute("loginInfo");
			String id = dto.getMember_id();
			MemberDTO member=service.MyPageListDo(id);
			logger.info(member.toString());
			model.addAttribute("myPage", member);
		}
		model.addAttribute("msg", msg);
		return page;
	}
		
	
		@RequestMapping(value="/myPageMod.go")
		public String myPageModGo() {
			return "myPageMod";
		}
	
	

	
	
	
}