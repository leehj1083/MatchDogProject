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
	public String joinAgree() {
		return "joinAgree";
	}
	
	@RequestMapping(value="/overlayId", method=RequestMethod.POST)
	@ResponseBody // ajax에서 반환하는 값을 response에 그려주는 역할을 한다.
	public HashMap<String,Object> overlayId(@RequestParam String member_id) {
		boolean use = service.overlayId(member_id);
		logger.info("사용 가능 여부 : "+use);
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("use", use);	
		return map;
	}
		
	@RequestMapping(value="/overlayNick", method=RequestMethod.POST)
	@ResponseBody
	public HashMap<String, Object> overlayNick(@RequestParam String member_nickName){
		boolean use = service.overlayNick(member_nickName);
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
	public HashMap<String, Object> join(@RequestParam MemberDTO dto) {
		logger.info("params : "+dto.getMember_id());
		/*
		 * MemberDTO dto = new MemberDTO(); int idx = dto.getMember_idx();
		 * generate keys 사용하려면 dto사용해야하는데, map과 같이 사용 가능한지?
		 */
		HashMap<String, Object> result = new HashMap<String, Object>();
		// int row = service.join(params);
		result.put("success", 0);
		return result;
	}
	
	@RequestMapping(value="/login.do", method=RequestMethod.POST)
	public String login(Model model, HttpSession session, @RequestParam String member_id, @RequestParam String member_pw) {
		String page = "home";
		MemberDTO dto = service.login(member_id, member_pw);
		if (dto != null) {
			// 1. 프로필이 있는지 / 2.로그인 금지 제재 여부 / 3. 구독 여부 / 4. 탈퇴 여부 -> dto에 넣을 정보
			session.setAttribute("loginInfo", dto);
			if(dto.getSubsType_code()=='4') {
				page = "./dashBoard.go";
				model.addAttribute("msg", dto.getMember_nickName()+"님 환영합니다.");
			}else {
				page = "main"; // 서비스 메인 페이지로 이동
				model.addAttribute("msg", dto.getMember_nickName()+"님 환영합니다.");
			}
		} else { // 로그인 실패
			model.addAttribute("msg","아이디 또는 비밀번호를 확인해주세요.");
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
