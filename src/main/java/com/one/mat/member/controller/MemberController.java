package com.one.mat.member.controller;

import java.sql.Date;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.one.mat.member.dto.MemberDTO;
import com.one.mat.member.dto.ProfileDTO;
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
		logger.info("member_nickName"+member_nickName);
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
	
	
	@RequestMapping(value="/join.do", method=RequestMethod.POST)
	@ResponseBody
	public HashMap<String, Object> join(@RequestBody MemberDTO dto) {
		logger.info("params : "+dto.getMember_id());		
						
		String member_id = dto.getMember_id();
		String member_pw = dto.getMember_pw();
		String member_name = dto.getMember_name();
		String member_nickName = dto.getMember_nickName();
		Date member_birth = dto.getMember_birth();
		String member_gender = dto.getMember_gender();
		String member_email = dto.getMember_email();
		String member_roadAddr = dto.getMember_roadAddr();
		String member_parcelAddr = dto.getMember_parcelAddr();
		String member_detailAddr = dto.getMember_detailAddr();
		String member_dongAddr = dto.getMember_dongAddr();
		String member_phone = dto.getMember_phone();		
		Date member_regDate = dto.getMember_regDate();
		String member_renew = dto.getMember_renew();
		String member_subs = dto.getMember_subs();
		String member_quit = dto.getMember_quit();
		String member_loginLock=dto.getMember_loginLock();
		int subsType_code = dto.getSubsType_code();		
		
		HashMap<String, Object> result = new HashMap<String, Object>();
		result.put("member_id", member_id);
		result.put("member_pw", member_pw);
		result.put("member_name", member_name);
		result.put("member_nickName", member_nickName);
		result.put("member_birth", member_birth);
		result.put("member_gender", member_gender);
		result.put("member_email", member_email);
		result.put("member_roadAddr", member_roadAddr);
		result.put("member_parcelAddr", member_parcelAddr);
		result.put("member_detailAddr", member_detailAddr);
		result.put("member_dongAddr", member_dongAddr);
		result.put("member_phone", member_phone);
		result.put("member_loginLock", member_loginLock);
		result.put("member_regDate", member_regDate);
		result.put("member_renew", member_renew);
		result.put("member_subs", member_subs);
		result.put("member_quit", member_quit);
		result.put("subsType_code", subsType_code);
		
		int row = service.join(dto);
		result.put("success", row);
		return result;
	}
	
	@RequestMapping(value="/login.do", method=RequestMethod.POST)
	public String login(Model model, HttpSession session, @RequestParam String member_id, @RequestParam String member_pw) {
		String page = "home";
		MemberDTO dto = service.login(member_id, member_pw);
		ArrayList<ProfileDTO> pdto = service.loginProf(member_id, member_pw);
		if (dto != null) {
			// 1. 프로필이 있는지 / 2.로그인 금지 제재 여부 / 3. 구독 여부 / 4. 탈퇴 여부 -> dto에 넣을 정보
			session.setAttribute("loginInfo", dto);
			session.setAttribute("loginProInfo", pdto);
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
		
	
	@RequestMapping(value="/nameMailChk.do")
	@ResponseBody
	public HashMap<String, Object> nameMailChk(@RequestParam String member_name, 
			@RequestParam String member_email) {
		
		HashMap<String, Object> result = new HashMap<String, Object>();
		result = service.nameMailChk(member_name, member_email);		
		logger.info("result: "+result);
		if(result==null) {
			result = new HashMap<String, Object>();
			result.put("msg", "해당하는 정보의 유저가 없습니다.");
		}
		return result;
	}
	
	@RequestMapping(value="/idFind.go")
	public String idFind() {
		return "idFind";
	}
	
	@RequestMapping(value="/idMailChk.do")
	@ResponseBody
	public HashMap<String, Object> idMailChk(@RequestParam String member_id, 
			@RequestParam String member_email) {
		
		HashMap<String, Object> result = new HashMap<String, Object>();
		result = service.idMailChk(member_id, member_email);
		return result;
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
