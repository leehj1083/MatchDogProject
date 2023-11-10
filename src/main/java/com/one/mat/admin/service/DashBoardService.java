package com.one.mat.admin.service;

import java.sql.Date;
import java.util.ArrayList;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.one.mat.admin.dao.DashBoardDAO;
import com.one.mat.admin.dto.VisitorDTO;

@Service
public class DashBoardService {

	Logger logger = LoggerFactory.getLogger(getClass());
	@Autowired DashBoardDAO dao;
	
	
	public int getTotalSubscriber() {
		return dao.getTotalSubscriber();
	}

	public int getMonthlySubscriber(int month) {
		return dao.getMonthlySubscriber(month);
	}		

	public int getTotalSales() {
		return dao.getTotalSales();
	}

	public int getMonthlySales(int month) {
		return dao.getMonthlySales(month);
	}
	
	public int getDailySales() {
		return dao.getDailySales();
	}

	public VisitorDTO selectVisitCount(int member_idx) {		
		return dao.selectVisitCount(member_idx);
	}

	public void insertVisitCount(int member_idx) {
		dao.insertVisitCount(member_idx);
	}

	public void updateVisitCount(int member_idx) {
		dao.updateVisitCount(member_idx);
	}

	public int getVisitTodayCount(Date today) {
		return dao.getVisitTodayCount(today);
	}

	public int getVisitTotalCount() {
		return dao.getVisitTotalCount();
	}
/*
	public ArrayList<VisitorDTO> getWeekCount(Date today) {
		return dao.getWeekCount(today);
	}

	public ArrayList<VisitorDTO> getSevenWeekCount(Date today) {
		return dao.getSevenWeekCount(today);
	}

	public ArrayList<VisitorDTO> getMonthCount(Date today) {
		return dao.getMonthCount(today);
	}
*/




	
}
