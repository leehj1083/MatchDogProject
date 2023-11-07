package com.one.mat.admin.controller;

import java.util.HashMap;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.one.mat.admin.service.DashBoardService;

@Controller
public class DashBoardController {

	Logger logger = LoggerFactory.getLogger(getClass());
	@Autowired DashBoardService service;
	
	@RequestMapping(value="/dashBoard.go")
	public String dashBoard() {
		return "dashBoard";
	}
	
	@RequestMapping(value="/visitorStatistics.do")
	@ResponseBody
	public HashMap<String, Object>visitorStatistics(){
		HashMap<String, Object> result = new HashMap<String, Object>();
		
		
		return result;
	}
	
	@RequestMapping(value="/subsStatistics.do")
	@ResponseBody
	public HashMap<String, Object>subsStatistics(){
		HashMap<String, Object> result = new HashMap<String, Object>();
		
		
		return result;
	}
	
	
	
	

}
