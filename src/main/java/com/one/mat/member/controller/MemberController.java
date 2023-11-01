package com.one.mat.member.controller;

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
import org.springframework.web.bind.annotation.ResponseBody;

import com.one.mat.member.dto.MemberDTO;
import com.one.mat.member.service.MailSendService;
import com.one.mat.member.service.MemberService;

@Controller
public class MemberController {

	Logger logger = LoggerFactory.getLogger(getClass());
	@Autowired MemberService service;
	@Autowired MailSendService mailService;
	
	@RequestMapping(value="/joinForm.go")
	public String joinForm() {
		return "joinForm";
	}
	
	@RequestMapping(value="/joinAgree.go")
	public String joinAgreeGo() {
		return "joinAgree";
	}
	
	@RequestMapping(value="/overlayId", method=RequestMethod.POST)
	@ResponseBody
	public HashMap<String,Object> overlayId(@RequestParam String id) {
		boolean use = service.overlayId(id);
		logger.info("사용 가능 여부 : "+use);
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("use", use);	
		return map;
	}
	
	@RequestMapping(value="/overlayNick", method=RequestMethod.POST)
	@ResponseBody
	public HashMap<String, Object> overlayNick(@RequestParam String nickName){
		boolean use = service.overlayNick(nickName);
		logger.info("사용 가능 여부 : "+use);
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("use", use);
		return map;
	}

	@RequestMapping(value="/mailCheck", method=RequestMethod.GET)
	@ResponseBody
	public String mailCheck(String email) {
		System.out.println("이메일 인증 요청이 들어옴.");
		System.out.println("이메일주소 : "+email);
		return mailService.joinEmail(email);			
	}
	
	
	@RequestMapping(value="/join.do")
	@ResponseBody
	public HashMap<String, Object> join(@RequestParam HashMap<String, String> params) {
		logger.info("params : "+params);
		HashMap<String, Object> result = new HashMap<String, Object>();
		int row = service.join(params);
		result.put("success", row);
		return result;
	}
	
	@RequestMapping(value="/login.do", method=RequestMethod.POST)
	public String login(Model model, HttpSession session, @RequestParam String id, @RequestParam String pw) {
		String page = "login";
		MemberDTO dto = service.login(id, pw);
		if (dto != null) {
			// 1. 프로필이 있는지 / 2.로그인 금지 제재 여부 / 3. 구독 여부 / 4. 탈퇴 여부 -> dto에 넣을 정보
			session.setAttribute("loginInfo", dto);
			if(dto.getSubsType_idx()=='4') {
				page = "./dashBoard.go";
				model.addAttribute("msg", dto.getMember_nickName()+"님 환영합니다.");
			}else {
				page = "./main"; // 서비스 메인 페이지로 이동
				model.addAttribute("msg", dto.getMember_nickName()+"님 환영합니다.");
			}
		} else { // 로그인 실패
			model.addAttribute("msg","아이디 또는 비밀번호를 확인해주세요.");
			page = "login";
		}
		return page;
	}
	
	@RequestMapping(value="/idFind.go")
	public String idFind() {
		return "idFind";
	}
	
	@RequestMapping(value="/pwFind.go")
	public String pwFind() {
		return "pwFind";
	}
	
	@RequestMapping(value="/dashBoard.go")
	public String dashBoard() {
		return "dashBoard";
	}
	
}
