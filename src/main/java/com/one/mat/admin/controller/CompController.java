package com.one.mat.admin.controller;

import java.util.Map;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.one.mat.admin.service.CompService;



@Controller
public class CompController {
	Logger logger = LoggerFactory.getLogger(getClass());
	@Autowired CompService service;

	
	@RequestMapping(value="/compList.go")
	public String compList(HttpSession session) {
		
		return "compList";
	}
	@RequestMapping(value="/compDetail")
	public String compDetail() {
		
		return "compDetail";
	}

	@RequestMapping(value="/list2")
	@ResponseBody
	public Map<String, Object> list(HttpSession session,@RequestParam String pagePerNum,
			@RequestParam String page) {
		logger.info("페이지당 보여줄 게시글 수 : "+pagePerNum);
		logger.info("보여줄 페이지 : "+page);
		
		
		return service.list2(pagePerNum, page);
	}
	
	@RequestMapping(value = "/sancHistory.go")
	public String sancHistory(){
		
		return "sancHistory";
	}
	@RequestMapping(value ="/proSuc.do")
	public String proSuc(@RequestParam Map<String, String> params) {
		logger.info("params : "+params);
		
		return "redirect:/compList.go"; 
	}

}
