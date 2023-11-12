package com.one.mat.admin.controller;

import java.sql.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.one.mat.admin.dto.VisitorDTO;
import com.one.mat.admin.service.DashBoardService;

@Controller
public class DashBoardController {

	Logger logger = LoggerFactory.getLogger(getClass());
	@Autowired DashBoardService service;
	
	@RequestMapping(value="/dashBoard.go")
	public String dashBoard() {
		return "dashBoard";
	}
		
	@RequestMapping(value="/visitorStatistics.do", method=RequestMethod.GET)
	@ResponseBody
	public HashMap<String, Object> getVisitorStats(@RequestParam String selection){
		HashMap<String, Object>result = new HashMap<String, Object>();
		
		int todayCount = service.getVisitTodayCount();
		logger.info("일 접속자 수 : "+todayCount);
		int totalCount = service.getVisitTotalCount();
		logger.info("총 접속자 수 : "+totalCount);
		result.put("todayCount", todayCount);
		result.put("totalCount", totalCount);			
		
		if(selection.equals("day")) {
			ArrayList<VisitorDTO> weekCount = service.getWeekCount();
			result.put("weekCount", weekCount);
		}else if(selection.equals("week")){
			ArrayList<VisitorDTO> sevenWeekCount=service.getSevenWeekCount();			
			result.put("sevenWeekCount", sevenWeekCount);
		}		
		
		return result;
	}
	


	@RequestMapping(value="/subsStatistics.do")
	@ResponseBody
	public HashMap<String, Object>subsStatistics(@RequestParam int month){
		HashMap<String, Object> result = new HashMap<String, Object>();		
		int totalSubscriber = service.getTotalSubscriber();
		int monthlySubscriber = service.getMonthlySubscriber(month);
		int totalSales = service.getTotalSales();
		int monthlySales = service.getMonthlySales(month);
		int dailySales = service.getDailySales();
		result.put("totalSubscriber", totalSubscriber);
		result.put("monthlySubscriber", monthlySubscriber);
		result.put("totalSales", totalSales);
		result.put("monthlySales", monthlySales);
		result.put("dailySales", dailySales);
		
		return result;
	}

	


}


