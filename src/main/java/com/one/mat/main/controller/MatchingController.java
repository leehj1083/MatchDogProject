package com.one.mat.main.controller;

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
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.one.mat.main.service.MatchingService;
import com.one.mat.member.dto.MemberDTO;
import com.one.mat.member.dto.ProfileDTO;

@Controller
public class MatchingController {
	
	Logger logger = LoggerFactory.getLogger(MatchingController.class);
	@Autowired MatchingService service;

	@RequestMapping(value = "/HomeMatchingList.do")
	public String home() {
		return "home";
	}
	
	@RequestMapping(value = "/MatchingList.do")
	@ResponseBody
	public Map<String, Object> matchingList(Model model, HttpSession session) {
		logger.info("MatchingList");
		Map<String, Object> map = new HashMap<>();
		MemberDTO memberdto = (MemberDTO)session.getAttribute("loginInfo");
		ProfileDTO profiledto = (ProfileDTO)session.getAttribute(null);
		
		 // 세션 체크(로그인, 비로그인 다르게)
	    if (memberdto != null) {
	   	 // 사용자의 견주 성별, 거주지, 강아지 성향등 정보 가져오기
	   	 String dongAddr = memberdto.getMember_dongAddr();
	   	 String gender = memberdto.getMember_gender();
	   	 int memberidx = memberdto.getMember_idx();
	   	 List<String> charTypes = profiledto.getCharType();
	   
	   	 // 견name, 개age(비공개 가능), 개gender(비공개 가능), 개char, 소개글
	   	 // 사용자와 동주소, 강아지 성향이 같은 개수 순으로 리스트 나열
	   	 List<Map<String, Object>> matchingList = service.matchingList(dongAddr, gender, memberidx);
	   	 List<String> matchingListCharType4 = service.matchingListCharType4(dongAddr, gender, charTypes);
	   	 List<String> matchingListCharType3 = service.matchingListCharType3(dongAddr, gender, charTypes);
	   	 List<String> matchingListCharType2 = service.matchingListCharType2(dongAddr, gender, charTypes);
	   	 List<String> matchingListCharType1 = service.matchingListCharType1(dongAddr, gender, charTypes);
	   	 map.put("list", matchingList);
	   	 model.addAttribute("list",matchingListCharType);
	    }
	    return map;    
	}
}

