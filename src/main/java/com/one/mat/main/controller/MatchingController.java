package com.one.mat.main.controller;

import java.util.Arrays;
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

@Controller
public class MatchingController {
	
	Logger logger = LoggerFactory.getLogger(MatchingController.class);
	@Autowired MatchingService service;

	@RequestMapping(value = "/HomeMatchingList.do")
	public String home() {
		return "home";
	}
	
	// 세션 체크(로그인, 비로그인 다르게)
	// 견주 성별, 주소
	// 견name, 개age(비공개 가능), 개gender(비공개 가능), 개char, 소개글
	// 사용자와 동주소, 강아지 성향이 같은 개수 순으로 리스트 나열
	
	@RequestMapping(value = "/MatchingList.do")
	@ResponseBody
	public Map<String, Object> matchingList(Model model, HttpSession session) {
		logger.info("MatchingList");
		Map<String, Object> map = new HashMap<>();
      List<Map<String, Object>> list = service.matchingList();
      map.put("list", list);
		return map;
	}
}
