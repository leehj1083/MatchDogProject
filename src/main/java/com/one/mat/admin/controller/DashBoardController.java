package com.one.mat.admin.controller;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.one.mat.admin.service.DashBoardService;

@Controller
public class DashBoardController {

	Logger logger = LoggerFactory.getLogger(getClass());
	@Autowired DashBoardService service;
	
	
	
	@RequestMapping(value="/compList.go")
	public String compList(HttpSession session) {
		
		return "compList";
	}
	
}
