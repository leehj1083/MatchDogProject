package com.one.mat.myPage.controller;

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

import com.one.mat.member.dto.MemberDTO;
import com.one.mat.myPage.service.MyProfileService;


@Controller
public class MyProfileController {

	Logger logger = LoggerFactory.getLogger(getClass());
	
	@Autowired MyProfileService service;

	//리스트 불러오기
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
			service.MyProfileListDo(idx, model);
		}
		model.addAttribute("msg", msg);
		return page;
	}
	
@RequestMapping(value="/myProfileOpen.do")
@ResponseBody
public HashMap<String, Object> myProfileOpenDo(HttpSession session,
		@RequestParam int openType_code, @RequestParam String toggleValue,
		@RequestParam int pro_idx){
	HashMap<String, Object> result = new HashMap<String, Object>();
	logger.info("pro_idx:"+pro_idx);
	logger.info("openType_code:"+openType_code);
	logger.info(toggleValue);
	
	if(session.getAttribute("loginInfo") == null) {
		result.put("login", false);
	}else {
		result.put("login", true);
		service.myProfileOpenDo(pro_idx, openType_code, toggleValue);

	}
	
	return result;
}


@RequestMapping(value="/myProfileRep.do")
@ResponseBody
public HashMap<String, Object> myProfileRepDo(HttpSession session,
		@RequestParam int pro_idx){
	HashMap<String, Object> result = new HashMap<String, Object>();
	logger.info("pro_idx:"+pro_idx);
	
	if(session.getAttribute("loginInfo") == null) {
		result.put("login", false);
	}else {
		result.put("login", true);
		MemberDTO dto = (MemberDTO) session.getAttribute("loginInfo");
		int idx = dto.getMember_idx();
		logger.info("idx="+idx);
		service.myProfileRepDo(pro_idx, idx);

	}
	
	return result;
}

	
	@RequestMapping(value = "/myProfileMod.go")
	public String myProfileModGo(Model model, HttpSession session) {
		String page = "login";
		if (session.getAttribute("loginInfo") == null) {
			model.addAttribute("msg", "로그인이 필요한 서비스입니다.");
		} else {
			MemberDTO dto = (MemberDTO) session.getAttribute("loginInfo");
			int idx = dto.getMember_idx();
			service.MyProfileListDo(idx, model);
			
			page = "myProfileMod";
		}
		return page;
	}

	

	@RequestMapping(value="myProfileDel.do")
	public String myProfileDelDo(Model model, HttpSession session,
			@RequestParam String pro_idx) {
		
		String page="index";
		
		if(session.getAttribute("loginId")==null) {
			model.addAttribute("msg", "로그인이 필요한 서비스입니다.");
		}else {		
			/* service.myProfileDelDo(pro_idx); */
			logger.info("pro_idx:"+pro_idx);
			page="redirect:/myProfileListDo";
		}
		return page;
	}

	
	
	
	
}