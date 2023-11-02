package com.one.mat.main.controller;

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
	
	// 구독여부, 탈퇴 여부, 제재 여부
	// 리스트는 10개씩 불러온다
	// 자신의 동주소를 기준으로 성향이 4,3,2,1 개가 일치하는 순으로 리스트 나열
	@RequestMapping(value = "/MatchingList.do")
	@ResponseBody
	public Map<String, Object> matchingList(Model model, HttpSession session) {
		logger.info("MatchingList");
		Map<String, Object> map = new HashMap<>();
		MemberDTO memberdto = (MemberDTO)session.getAttribute("loginInfo");
		int member_idx = memberdto.getMember_idx();
		logger.info("member_idx " + member_idx);

		ProfileDTO profiledto = (ProfileDTO)session.getAttribute("loginProInfo");
		int pro_idx = profiledto.getPro_idx();
		logger.info("pro_idx "+ pro_idx);

		Map<String, Integer> params = new HashMap<>();
		params.put("member_idx", member_idx);
		params.put("pro_idx", pro_idx);

		// 이제 params Map에 member_idx와 pro_idx 값이 포함되어 있습니다.

		
		 // 세션 체크(로그인, 비로그인 다르게)
	    if (memberdto != null) {
	   	 // 사용자의 거주지, 강아지 성향을 가지고 매칭 리스트 보여주기
//	   	 String dongAddr = memberdto.getMember_dongAddr();
//	   	 String gender = memberdto.getMember_gender();
//	   	 List<ProfileDTO> charTypes = profiledto.getCharType();
	   
	   	 // 견name, 개age(비공개 가능), 개gender(비공개 가능), 개char, 소개글
	   	 // 자신의 동주소를 기준으로 성향이 4,3,2,1 개가 일치하는 순으로 리스트 나열
	   	 List<Map<String, Object>> matchingList = service.matchingList(params);
	   	 map.put("list", matchingList);
	   	 
//	   	 List<String> matchingListCharType4 = service.matchingListCharType4(member_idx, pro_idx);
//	   	 List<String> matchingListCharType3 = service.matchingListCharType3(member_idx, pro_idx);
//	   	 List<String> matchingListCharType2 = service.matchingListCharType2(member_idx, pro_idx);
//	   	 List<String> matchingListCharType1 = service.matchingListCharType1(member_idx, pro_idx);
//	   	 model.addAttribute("list4",matchingListCharType4);
//	   	 model.addAttribute("list3",matchingListCharType3);
//	   	 model.addAttribute("list2",matchingListCharType2);
//	   	 model.addAttribute("list1",matchingListCharType1);
	   	
	    }
	    return map;    
	}
}

