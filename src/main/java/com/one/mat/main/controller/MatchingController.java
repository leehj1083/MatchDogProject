package com.one.mat.main.controller;

import java.util.Map;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.one.mat.main.service.MatchingService;

@Controller
public class MatchingController {
	
	Logger logger = LoggerFactory.getLogger(MatchingController.class);
	@Autowired MatchingService service;

	// 세션 체크(로그인, 비로그인 다르게)
	// 견주 성별, 주소
	// 견name, 개age(비공개 가능), 개gender(비공개 가능), 개char, 소개글
	//		/HomeMatchingList.do
	@RequestMapping(value = "/HomeMatchingList.do")
	public String home(Model model, HttpSession session) {
		logger.info("index.jsp");
		Map<String, String> list = service.matchingList();
		model.addAttribute("list",list);
		return "home";
	}
	
}
