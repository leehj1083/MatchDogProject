package com.one.mat.admin.controller;

import java.util.ArrayList;
import java.util.HashMap;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.one.mat.admin.service.DashBoardService;
import com.one.mat.myPage.DTO.SubsDTO;

@Controller
public class DashBoardController {

	Logger logger = LoggerFactory.getLogger(getClass());
	@Autowired DashBoardService service;
		
	
	@RequestMapping(value="/dashBoard.go")
	public String dashBoard() {
		return "dashBoard";
	}
	
	@RequestMapping(value="/visitorStatistics.do")
	public String getVisitorStats(Model model){

		return "";
	}
	
	@RequestMapping(value="/subsStatistics.do")
	@ResponseBody
	public HashMap<String, Object>subsStatistics(){
		HashMap<String, Object> result = new HashMap<String, Object>();		
		ArrayList<SubsDTO>list = service.getDailySales();
		result.put("list", list);
		return result;
	}


}


