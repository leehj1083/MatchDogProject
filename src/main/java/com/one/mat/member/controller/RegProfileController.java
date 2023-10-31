package com.one.mat.member.controller;

import java.util.ArrayList;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.one.mat.member.dto.ProfileDTO;
import com.one.mat.member.service.RegProfileService;

@Controller
public class RegProfileController {
	
	Logger logger = LoggerFactory.getLogger(getClass());
	@Autowired
	RegProfileService service;
	
	
	@RequestMapping("/showChar")
	public String showChar() {
		
		return "showChar";
	}
	

	@RequestMapping("/regProfile")
	public String Home() {
		
		
		return "regProfile";
	}
	
	@RequestMapping(value = "/writemyProfile")
	public String writemyProfile(@RequestParam Map<String,String> params, Model model) {
		logger.info("params : "+ params);
		ArrayList<ProfileDTO> list = service.list();
		model.addAttribute("list",list);
		logger.info("list"+list);
		
		return service.writemyProfile(params);
		
	}
	
	@RequestMapping("/open")
	public String charlist(Model model) {
		ArrayList<ProfileDTO> list = service.list();
		logger.info("list : "+list);
		model.addAttribute("list",list);
		
		return "list";
	}
	
	
	

	
}
