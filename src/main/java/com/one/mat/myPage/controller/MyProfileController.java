package com.one.mat.myPage.controller;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.one.mat.member.dto.MemberDTO;
import com.one.mat.myPage.service.MyProfileService;


@Controller
public class MyProfileController {

	Logger logger = LoggerFactory.getLogger(getClass());
	
	@Autowired MyProfileService service;

	
	@RequestMapping(value = "/myProfileList.do")
	public String myProfileListDo(Model model, HttpSession session) {
		logger.info("프로필 list 요청 받음");
		String page = "login";
		String msg = "로그인이 필요한 서비스입니다.";
		if (session.getAttribute("loginInfo") != null) { // 로그인 했을 경우만 내용을 실행
			page = "myProfile";
			msg = "";
			MemberDTO dto = (MemberDTO) session.getAttribute("loginInfo");
			int idx = dto.getMember_idx();
			logger.info("idx="+idx);
			/*
			 * MemberDTO profile = service.MyProfileListDo(id);
			 * logger.info(profile.toString()); model.addAttribute("myProfile", profile);
			 */
		}
		model.addAttribute("msg", msg);
		return page;
	}
	
	
	@RequestMapping(value = "/myProfileMod.go")
	public String myProfileModGo(Model model, HttpSession session) {
		String page = "login";
		if (session.getAttribute("loginInfo") == null) {
			model.addAttribute("msg", "로그인이 필요한 서비스입니다.");
		} else {
			MemberDTO dto = (MemberDTO) session.getAttribute("loginInfo");
			int idx = dto.getMember_idx();
			/* MemberDTO member=service.MyPageListDo(id); */
			model.addAttribute("myProfile", service.MyProfileListDo(idx));
			page = "myProfileMod";
		}
		return page;
	}
	
	
	
	
}