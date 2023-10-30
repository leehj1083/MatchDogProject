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
import com.one.mat.member.service.MemberService;

@Controller
public class MemberController {

	Logger logger = LoggerFactory.getLogger(getClass());
	@Autowired MemberService service;
	
	@RequestMapping(value="/joinForm.go")
	public String joinForm() {
		return "joinForm";
	}
	
	@RequestMapping(value="/joinAgree.go")
	public String joinAgreeGo() {
		return "joinAgree";
	}
	
	// ajax통신의 규칙
		// 1. Response형태로 반환해야 한다.(ajax는 요청하는곳과 데이터 받는 곳이 같아야 한다.)-> 페이지 이동X
		// 2. json과 가장 비슷한 형태로 반환해야 한다. / {key:value}, 쉼표로 나열  ->  HashMap으로 반환!
		//  ex) {"name": "Jack", "age": 30, "hobby": ["Football", "puzzles","swimming"]}
		// 3. json형태로 바꿔줄 라이브러리가 필요하다.(jackson-databind(2.9.4))
		@RequestMapping(value="/overlayId", method=RequestMethod.POST)
		@ResponseBody // ajax에서 반환하는 값을 response에 그려주는 역할을 한다.
		// java.lang.IllegalArgumentException: No converter found for return value of type: class java.util.HashMap
		// 이것이 뜬 이유는 hashmap은 자바에서만 사용하는 것이기 때문에 자바가 아닌곳에서 어떤 데이터타입으로 바꿔야할지 모르겠다는 뜻
		// -> 이것을 해결하기 위해 json형태로 바꿔줄 라이브러리가 필요함
		// 라이브러리 적용 후 ID중복 체크 시 흰 바탕에 {"use":true}만 뜨는데
		// 이는 response는 출력(페이지 그리기)이 되는 객체이므로, 기존 페이지 위에 값을 출력해버리기 때문임
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
	
	@RequestMapping(value="/join.do")
	public String join() {
		return "";
	}
	
	@RequestMapping(value="/login.do", method=RequestMethod.POST)
	public String login(Model model, HttpSession session, @RequestParam String id, @RequestParam String pw) {
		String page = "home";
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
