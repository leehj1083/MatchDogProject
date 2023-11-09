package com.one.mat.admin.controller;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.one.mat.admin.dto.AuthDTO;
import com.one.mat.admin.service.AuthService;
import com.one.mat.member.dto.MemberDTO;



@Controller
public class AuthController {

	Logger logger= LoggerFactory.getLogger(getClass());
	@Autowired AuthService service;
	
	/*
	@RequestMapping(value="/auth.go")
	public String authGo() {
		return "auth";
	}
	*/
	
	@RequestMapping(value="/authList.do")
	public String authListDo(Model model, HttpSession session) {
		logger.info("authList 요청 받음");
		MemberDTO dto = (MemberDTO) session.getAttribute("loginInfo");
		String page = "./login";
		if(dto != null && dto.getSubsType_code()==4) {			
			ArrayList<AuthDTO> authList = service.authListDo();
			model.addAttribute("authList", authList);
			page = "auth";
		}else {
			model.addAttribute("msg","접근권한이 없습니다.");
		}	
		return page;
	}
	
	@RequestMapping(value="/authDetailList.do")
	public String authDetailListDo(Model model, HttpSession session, @RequestParam int subsType_code) {
		logger.info("권한 상세 요청 받음");
		MemberDTO dto = (MemberDTO) session.getAttribute("loginInfo");
		String page = "./login";
		if(dto != null && dto.getSubsType_code()==4) {		
			logger.info("subsType_code:"+subsType_code);
			HashMap<String, String> authDetail=service.authDetailListDo(subsType_code);
			logger.info("authDetail"+authDetail);
			ArrayList<Integer> authCodes = service.authCode(subsType_code);
			logger.info("authCodes"+authCodes);
			model.addAttribute("authCodes", authCodes);
			model.addAttribute("authDetail", authDetail);
			
			page = "authDetail";
			
		}else {
			model.addAttribute("msg","접근권한이 없습니다.");
		}	
		
		return page;
	}
	
	@RequestMapping(value="/authDetailMod.go")
	public String authDetailModGo(Model model, HttpSession session, @RequestParam int subsType_Code) {
		HashMap<String, String> authDetail=service.authDetailListDo(subsType_Code);
		ArrayList<Integer> authCodes = service.authCode(subsType_Code);
		model.addAttribute("authCodes", authCodes);
		model.addAttribute("authDetail", authDetail);
		return "authDetailMod";
	}
	
}
