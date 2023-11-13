package com.one.mat.myPage.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.one.mat.member.dto.MemberDTO;
import com.one.mat.myPage.service.MyPageService;


@Controller
public class MyPageController {

	Logger logger = LoggerFactory.getLogger(getClass());
	
	@Autowired MyPageService service;
	
	
	@RequestMapping(value = "/myPageList.do")
	public String myPageListDo(Model model, HttpSession session) {
		logger.info("마이페이지 list 요청 받음");
		String page = "login";
		String msg = "로그인이 필요한 서비스입니다.";
		if (session.getAttribute("loginInfo") != null) { // 로그인 했을 경우만 내용을 실행
			page = "myPage";
			msg = "";
			MemberDTO dto = (MemberDTO) session.getAttribute("loginInfo");
			String id = dto.getMember_id();
			MemberDTO member = service.MyPageListDo(id);
			logger.info(member.toString());
			model.addAttribute("myPage", member);
		}
		model.addAttribute("msg", msg);
		return page;
	}

	@RequestMapping(value = "/myPageMod.go")
	public String myPageModGo(Model model, HttpSession session) {
		String page = "login";
		if (session.getAttribute("loginInfo") == null) {
			model.addAttribute("msg", "로그인이 필요한 서비스입니다.");
		} else {
			MemberDTO dto = (MemberDTO) session.getAttribute("loginInfo");
			String id = dto.getMember_id();
			/* MemberDTO member=service.MyPageListDo(id); */
			model.addAttribute("myPage", service.MyPageListDo(id));
			page = "myPageMod";
		}
		return page;
	}

	
	@RequestMapping(value = "/myPageModUpdate.do")
	public String myPageModUpdateDo(Model model, HttpSession session, @RequestParam Map<String, String> params) {
		logger.info("params : " + params);
	
		String page = "redirect:/myPageList.do";

		if (session.getAttribute("loginInfo") == null) {
			model.addAttribute("msg", "로그인이 필요한 서비스입니다.");
		} else {
			service.myPageModUpdateDo(params);
			page = "redirect:/myPageList.do";
		}

		return page;
	}
	
	@RequestMapping(value= "/subs.go")
	public String subsGo(Model model, HttpSession session) {
		if (session.getAttribute("loginInfo") == null) {
			model.addAttribute("msg", "로그인이 필요한 서비스입니다.");
		} else {
			MemberDTO dto = (MemberDTO) session.getAttribute("loginInfo");
			String id = dto.getMember_id();
			
		model.addAttribute("myPage", service.MyPageListDo(id));
		}
		return "subs";
	}
	
	
	@RequestMapping(value="/logout")
	public String logout(HttpSession session) {
		session.removeAttribute("loginInfo");
		return "redirect:/";
	}
	
	
	@RequestMapping(value="/memberQuit.do")
	@ResponseBody
	public HashMap<String, Object> memberQuitDo(HttpSession session,
			@RequestParam int member_idx){
		HashMap<String, Object> result = new HashMap<String, Object>();
		logger.info("member_idx:"+member_idx);
		String page = "redirect:/";
		if(session.getAttribute("loginInfo") == null) {
			result.put("login", false);
		}else {
			result.put("login", true);
			service.memberQuitDo(member_idx);
			page = "redirect:/";
		}
		
		return result;
	}
	
	
	
}