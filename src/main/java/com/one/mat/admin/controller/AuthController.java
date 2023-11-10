package com.one.mat.admin.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

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
		session.setAttribute("pageSubsType_code", subsType_code);
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
		logger.info("authCodes:"+authCodes);
		ArrayList<AuthDTO>authCodeList =service.authCodeListDo();
		model.addAttribute("authCodes", authCodes);
		model.addAttribute("authDetail", authDetail);
		model.addAttribute("authCodeList", authCodeList);
		return "authDetailMod";
	}
	
	
	@RequestMapping(value="/authDetailModUpdate.do")
	public String authDetailModUpdateDo(Model model, HttpSession session,
			@RequestParam Map<String, String> params,
			@RequestParam(value = "authCodes", required = false) String[] authCodes,
			@RequestParam(value ="newAuthCodes", required = false) String[] newAuthCodes
			) {
		logger.info("권한 설명 : "+params.get("subs_desc"));
		
		
		logger.info("subsType_code: " + params.get("subsType_code"));
		if (newAuthCodes != null) {
	        for (String newAuthcode : newAuthCodes) {
	            logger.info(newAuthcode);
	        }
	    }
	
		String page="login";
		MemberDTO dto = (MemberDTO) session.getAttribute("loginInfo");
		if(dto != null && dto.getSubsType_code()==4) {		
			service.authDetailModUpdateDo(params);
			
		}else {
			model.addAttribute("msg","접근권한이 없습니다.");
		}
		
		/* page= "redirect:/authDetailList.do"; */
		return page;
	}
	

	
}
