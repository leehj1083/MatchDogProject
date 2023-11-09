package com.one.mat.myPage.controller;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.one.mat.member.dto.MemberDTO;
import com.one.mat.myPage.service.SubsService;

@Controller
public class SubsController {

	Logger logger = LoggerFactory.getLogger(getClass());
	
	@Autowired SubsService service;
	
	@RequestMapping(value="/plusSubs.do")
	@ResponseBody
	public HashMap<String, Object> plusSubsDo(Model model, HttpSession session,
			@RequestParam String subsStartTime){
		HashMap<String, Object> result = new HashMap<String, Object>();
		logger.info("subsStartTime:"+subsStartTime);

		// subsStartTime을 LocalDate로 파싱
	    LocalDate startDate = LocalDate.parse(subsStartTime);

	    // 시작일로부터 1달 후 계산
	    LocalDate endDate = startDate.plusMonths(1);

	    // 계산된 만료일을 원하는 형식으로 포맷팅 (yyyy-MM-dd)
	    DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
	    String expirationTime = endDate.format(formatter);
	    logger.info("expirationTime:" + expirationTime);
		
		String page = "redirect:/";
		if(session.getAttribute("loginInfo") == null) {
			result.put("login", false);
		}else {
			result.put("login", true);
			MemberDTO dto = (MemberDTO) session.getAttribute("loginInfo");
			int idx = dto.getMember_idx();
			logger.info("idx :"+idx);
			logger.info("subsStartTime:"+subsStartTime);
			logger.info("expirationTime:" + expirationTime);
			service.plusSubsDo(idx, subsStartTime, expirationTime);
			page = "redirect:/";
		}
		
		return result;
	}
	
	@RequestMapping(value="/premiumSubs.do")
	@ResponseBody
	public HashMap<String, Object> premiumSubsDo(Model model, HttpSession session,
			@RequestParam String subsStartTime){
		HashMap<String, Object> result = new HashMap<String, Object>();
		logger.info("subsStartTime:"+subsStartTime);

		// subsStartTime을 LocalDate로 파싱
	    LocalDate startDate = LocalDate.parse(subsStartTime);

	    // 시작일로부터 1달 후 계산
	    LocalDate endDate = startDate.plusMonths(1);

	    // 계산된 만료일을 원하는 형식으로 포맷팅 (yyyy-MM-dd)
	    DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
	    String expirationTime = endDate.format(formatter);
	    logger.info("expirationTime:" + expirationTime);
		
		String page = "redirect:/";
		if(session.getAttribute("loginInfo") == null) {
			result.put("login", false);
		}else {
			result.put("login", true);
			MemberDTO dto = (MemberDTO) session.getAttribute("loginInfo");
			int idx = dto.getMember_idx();
			logger.info("idx :"+idx);
			logger.info("subsStartTime:"+subsStartTime);
			logger.info("expirationTime:" + expirationTime);
			service.premiumSubsDo(idx, subsStartTime, expirationTime);
			page = "redirect:/";
		}
		
		return result;
	}
	
	
	
/*	
	@RequestMapping(value= "/plusSubs.do")
	public String plusSubsDo(Model model, HttpSession session) {
		if (session.getAttribute("loginInfo") == null) {
			model.addAttribute("msg", "로그인이 필요한 서비스입니다.");
		} else {
			MemberDTO dto = (MemberDTO) session.getAttribute("loginInfo");
			int idx = dto.getMember_idx();
			logger.info("idx :"+idx);
			service.plusSubsDo(idx);
		}
		return "redirect:/myPageList.do";
	}
*/	
/*
	@RequestMapping(value= "/premiumSubs.do")
	public String premiumSubsDo(Model model, HttpSession session) {
		if (session.getAttribute("loginInfo") == null) {
			model.addAttribute("msg", "로그인이 필요한 서비스입니다.");
		} else {
			MemberDTO dto = (MemberDTO) session.getAttribute("loginInfo");
			int idx = dto.getMember_idx();
			logger.info("idx :"+idx);
			service.premiumSubsDo(idx);
		}
		return "redirect:/myPageList.do";
	}
*/	
	@RequestMapping(value= "/myPageSubsDelete.do")
	public String myPageSubsDeleteDo(Model model, HttpSession session) {
		if (session.getAttribute("loginInfo") == null) {
			model.addAttribute("msg", "로그인이 필요한 서비스입니다.");
		} else {
			MemberDTO dto = (MemberDTO) session.getAttribute("loginInfo");
			int idx = dto.getMember_idx();
			logger.info("idx :"+idx);
			service.myPageSubsDeleteDo(idx);
		}
		return "redirect:/myPageList.do";
	}
	
	
	
	
}
